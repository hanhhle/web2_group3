<?php
declare(strict_types=1);

class RubricController {
    public function index(): void {
        requirePermission('manage_rubrics');
        $isAdmin = (role() === 'admin');
        $u = uid();

        if ($isAdmin) {
            $assessments = qAll("SELECT a.*, s.code as sc FROM assessments a JOIN subjects s ON a.subject_id=s.id ORDER BY a.created_at DESC");
        } else {
            $assessments = qAll("SELECT a.*, s.code as sc FROM assessments a JOIN subjects s ON a.subject_id=s.id WHERE a.lecturer_id=? ORDER BY a.created_at DESC", [$u]);
        }

        $filterAid = isset($_GET['assessment_id']) ? (int)$_GET['assessment_id'] : 0;
        if ($filterAid === 0 && !empty($assessments)) {
            $filterAid = (int)$assessments[0]['id'];
        }

        $selAssess = null;
        foreach ($assessments as $a) {
            if ((int)$a['id'] === $filterAid) {
                $selAssess = $a;
                break;
            }
        }

        if ($filterAid > 0 && !$selAssess && !$isAdmin) {
            $existsOther = qOne("SELECT id FROM assessments WHERE id=?", [$filterAid]);
            if ($existsOther) {
                flash('error', 'Security Alert: Access denied. You do not own this assessment.');
                header("Location: index.php?page=rubrics");
                exit;
            }
        }

        $rubrics = RubricModel::getRubricsForAssessment($filterAid);
        $clos = $selAssess ? CloModel::getBySubject((int)$selAssess['subject_id']) : [];

        require_once __DIR__ . '/../views/rubrics.php';
        if (function_exists('pageRUBRICS')) {
            pageRUBRICS($assessments, $filterAid, $selAssess, $rubrics, $clos);
        }
    }

    public function createRubric(): void {
        requirePermission('manage_rubrics');
        $aid = (int)$_POST['assessment_id'];
        $name = trim($_POST['name'] ?? '');

        $assessOwner = AssessmentModel::getById($aid);
        if (!$assessOwner || (role() !== 'admin' && (int)$assessOwner['lecturer_id'] !== uid())) {
            flash('error', 'Security Alert: You do not own this assessment.');
            header("Location: index.php?page=rubrics&assessment_id=$aid");
            exit;
        }

        try {
            $newId = RubricModel::createRubric($aid, $name);
            auditLog('CREATE_RUBRIC', 'rubrics', $newId);
            flash('success', 'Rubric created.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header("Location: index.php?page=rubrics&assessment_id=$aid");
        exit;
    }

    public function deleteRubric(): void {
        requirePermission('manage_rubrics');
        $id = (int)$_POST['id'];

        $rubricAssess = RubricModel::getRubricWithAssessment($id);
        if (!$rubricAssess || (role() !== 'admin' && (int)$rubricAssess['lecturer_id'] !== uid())) {
            flash('error', 'Security Alert: You do not have permission to delete this rubric.');
            header("Location: index.php?page=rubrics");
            exit;
        }
        $aid = (int)$rubricAssess['assessment_id'];

        try {
            RubricModel::deleteRubric($id);
            auditLog('DELETE_RUBRIC', 'rubrics', $id);
            flash('success', 'Rubric deleted.');
        } catch (Exception $e) {
            flash('error', 'Cannot delete rubric: This rubric already has criteria or grades linked to it.');
        }
        header("Location: index.php?page=rubrics&assessment_id=$aid");
        exit;
    }

    public function addCriterion(): void {
        requirePermission('manage_rubrics');
        $rid = (int)$_POST['rubric_id'];
        $description = trim($_POST['description'] ?? '');
        $maxScore = (float)($_POST['max_score'] ?? 0);
        $cloId = !empty($_POST['clo_id']) ? (int)$_POST['clo_id'] : null;

        $rubricAssess = RubricModel::getRubricWithAssessment($rid);
        if (!$rubricAssess || (role() !== 'admin' && (int)$rubricAssess['lecturer_id'] !== uid())) {
            flash('error', 'Security Alert: You do not have permission to edit this rubric.');
            header("Location: index.php?page=rubrics");
            exit;
        }
        $aid = (int)$rubricAssess['assessment_id'];

        if ($maxScore < 0.01 || $maxScore > 100) {
            flash('error', 'Max score must be between 0.01 and 100.');
            header("Location: index.php?page=rubrics&assessment_id=$aid");
            exit;
        }

        try {
            $newId = RubricModel::addCriterion($rid, $description, $maxScore, $cloId);
            auditLog('CREATE_CRITERION', 'rubric_criteria', $newId);
            flash('success', 'Criterion added.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header("Location: index.php?page=rubrics&assessment_id=$aid");
        exit;
    }

    public function deleteCriterion(): void {
        requirePermission('manage_rubrics');
        $id = (int)$_POST['id'];

        $critAssess = RubricModel::getCriterionWithAssessment($id);
        if (!$critAssess || (role() !== 'admin' && (int)$critAssess['lecturer_id'] !== uid())) {
            flash('error', 'Security Alert: You do not have permission to delete this criterion.');
            header("Location: index.php?page=rubrics");
            exit;
        }
        $aid = (int)$critAssess['assessment_id'];

        try {
            RubricModel::deleteCriterion($id);
            auditLog('DELETE_CRITERION', 'rubric_criteria', $id);
            flash('success', 'Criterion deleted.');
        } catch (Exception $e) {
            flash('error', 'Cannot delete criterion: This criterion already has student scores linked to it.');
        }
        header("Location: index.php?page=rubrics&assessment_id=$aid");
        exit;
    }
}
