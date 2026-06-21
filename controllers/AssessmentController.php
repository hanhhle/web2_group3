<?php
declare(strict_types=1);

class AssessmentController {
    public function index(): void {
        requirePermission('view_assessments');
        $isAdmin = (role() === 'admin');
        $u = uid();

        if ($isAdmin) {
            $subjects = SubjectModel::getSimpleAll();
            $assessments = AssessmentModel::getAll();
        } else {
            $subjects = SubjectModel::getSimpleAllByLecturer($u);
            $assessments = AssessmentModel::getByLecturer($u);
        }

        require_once __DIR__ . '/../views/assessments.php';
        if (function_exists('pageASSESSMENTS')) {
            pageASSESSMENTS($assessments, $subjects);
        }
    }

    public function create(): void {
        requirePermission('manage_assessments');
        $type = trim($_POST['type'] ?? '');
        if ($type === 'attendance') {
            $w = 10.0;
        } elseif ($type === 'midterm') {
            $w = 30.0;
        } elseif ($type === 'final') {
            $w = 60.0;
        } else {
            flash('error', 'Invalid assessment type. Only Attendance, Midterm, and Final are accepted.');
            header('Location: index.php?page=assessments');
            exit;
        }

        $sid = (int)$_POST['subject_id'];
        $sem = trim($_POST['semester'] ?? '');
        $name = trim($_POST['name'] ?? '');

        // Validate subject ownership if not admin
        if (role() !== 'admin') {
            $subject = SubjectModel::getById($sid);
            if (!$subject || (int)$subject['lecturer_id'] !== uid()) {
                flash('error', 'Security Alert: You are not assigned to teach this subject.');
                header('Location: index.php?page=assessments');
                exit;
            }
        }

        // Check duplicate
        if (AssessmentModel::checkDuplicateType($sid, $sem, $type)) {
            flash('error', "Cannot create: This subject already has a '" . ucfirst($type) . "' assessment for this semester.");
            header('Location: index.php?page=assessments');
            exit;
        }

        // Check total weight
        $currentTotal = AssessmentModel::getTotalWeight($sid, $sem);
        if ($currentTotal + $w > 100.01) {
            flash('error', "Cannot create: The total weight of assessments for this subject in this semester has reached {$currentTotal}%. Adding {$w}% would exceed 100%.");
            header('Location: index.php?page=assessments');
            exit;
        }

        $maxScore = ($type === 'attendance') ? 10.0 : (float)($_POST['max_score'] ?? 100.0);
        if ($maxScore < 0.01 || $maxScore > 100) {
            flash('error', 'Max score must be between 0.01 and 100.');
            header('Location: index.php?page=assessments');
            exit;
        }

        try {
            db()->beginTransaction();
            $newAid = AssessmentModel::create($sid, uid(), $name, $type, $w, $maxScore, $sem);
            auditLog('CREATE_ASSESSMENT', 'assessments', $newAid);

            // Auto-generate Rubric and Criterion for Attendance
            if ($type === 'attendance') {
                $rubricId = RubricModel::createRubric($newAid, 'Attendance Rubric');
                // Find first CLO
                $firstClo = qOne("SELECT id FROM clos WHERE subject_id=? ORDER BY id LIMIT 1", [$sid]);
                $cloId = $firstClo ? (int)$firstClo['id'] : null;

                RubricModel::addCriterion($rubricId, 'Attendance score (Automatic criteria)', 10.0, $cloId);
                auditLog('CREATE_CRITERION', 'rubric_criteria', (int)lastId());
            }

            db()->commit();
            flash('success', 'Assessment created.');
        } catch (Exception $e) {
            db()->rollBack();
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=assessments');
        exit;
    }

    public function delete(): void {
        requirePermission('manage_assessments');
        $id = (int)$_POST['id'];

        $assess = AssessmentModel::getById($id);
        if (!$assess || (role() !== 'admin' && (int)$assess['lecturer_id'] !== uid())) {
            flash('error', 'Security Alert: You do not own this assessment.');
            header('Location: index.php?page=assessments');
            exit;
        }

        try {
            AssessmentModel::delete($id);
            auditLog('DELETE_ASSESSMENT', 'assessments', $id);
            flash('success', 'Assessment removed.');
        } catch (Exception $e) {
            flash('error', 'Cannot delete assessment: Rubrics or student scores are already associated with it.');
        }
        header('Location: index.php?page=assessments');
        exit;
    }
}
