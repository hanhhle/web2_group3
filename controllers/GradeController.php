<?php
declare(strict_types=1);

class GradeController {
    // ── LECTURER/ADMIN: ENTER GRADES ──
    public function index(): void {
        requirePermission('grade_student');
        $isAdmin = (role() === 'admin');
        $u = uid();

        if ($isAdmin) {
            $assessments = qAll("SELECT a.*, s.code as sc, u.full_name as lecturer_name FROM assessments a JOIN subjects s ON a.subject_id=s.id LEFT JOIN users u ON a.lecturer_id=u.id ORDER BY a.created_at DESC");
        } else {
            $assessments = qAll("SELECT a.*, s.code as sc, u.full_name as lecturer_name FROM assessments a JOIN subjects s ON a.subject_id=s.id LEFT JOIN users u ON a.lecturer_id=u.id WHERE a.lecturer_id=? ORDER BY a.created_at DESC", [$u]);
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
                header("Location: index.php?page=grade");
                exit;
            }
        }

        $canEdit = $isAdmin || ($selAssess && (int)$selAssess['lecturer_id'] === $u);
        $enrollments = [];
        $rubrics = [];
        $allScores = [];
        $pendingReqs = [];

        if ($selAssess) {
            $enrollments = GradeModel::getEnrollmentsForSubjectAndSemester((int)$selAssess['subject_id'], $selAssess['semester']);
            $rubrics = RubricModel::getRubricsForAssessment($filterAid);
            $allScores = GradeModel::getAllScoresForAssessment($filterAid);
            $pendingReqs = RequestModel::getPendingRequestsForSubjectAndSemester((int)$selAssess['subject_id'], $selAssess['semester']);
        }

        // Export functionality for Lecturer/Admin
        if (isset($_GET['export']) && $_GET['export'] === 'csv') {
            requirePermission('export_grades');
            if ($selAssess) {
                $exportData = GradeModel::getDetailedAssessmentScoresForExport($filterAid);
                $filename = "grade_sheet_assessment_" . $filterAid . "_" . date('Ymd_His') . ".csv";
                
                header('Content-Type: text/csv; charset=utf-8');
                header('Content-Disposition: attachment; filename="' . $filename . '"');
                
                $out = fopen('php://output', 'w');
                // Output BOM for Excel UTF-8 display
                fprintf($out, chr(0xEF).chr(0xBB).chr(0xBF));
                
                fputcsv($out, ['Student Username', 'Student Name', 'Subject Code', 'Subject Name', 'Assessment Name', 'Assessment Type', 'Criterion Description', 'Score', 'Max Score', 'Graded By', 'Graded At']);
                foreach ($exportData as $row) {
                    fputcsv($out, [
                        $row['student_username'],
                        $row['student_name'],
                        $row['subject_code'],
                        $row['subject_name'],
                        $row['assessment_name'],
                        $row['assessment_type'],
                        $row['criterion_desc'],
                        $row['score'] !== null ? $row['score'] : 'N/A',
                        $row['max_score'],
                        $row['grader_name'] !== null ? $row['grader_name'] : 'N/A',
                        $row['graded_at'] !== null ? $row['graded_at'] : 'N/A'
                    ]);
                }
                fclose($out);
                exit;
            }
        }

        require_once __DIR__ . '/../views/grade.php';
        if (function_exists('pageGRADE')) {
            pageGRADE($assessments, $filterAid, $selAssess, $canEdit, $enrollments, $rubrics, $allScores, $pendingReqs);
        }
    }

    // ── STUDENT: VIEW GRADES ──
    public function showGrades(): void {
        requirePermission('view_my_grades');
        $u = uid();

        $semestersList = qAll("SELECT DISTINCT semester FROM student_enrollments WHERE student_id = ? ORDER BY semester DESC", [$u]);
        
        $selectedSem = trim($_GET['semester'] ?? '');
        if ($selectedSem === '') {
            $selectedSem = defined('SEMESTER_CURRENT') ? SEMESTER_CURRENT : (!empty($semestersList) ? $semestersList[0]['semester'] : '');
        }

        $enrollments = qAll("SELECT se.*, s.name sn, s.code sc, s.credits 
                             FROM student_enrollments se 
                             JOIN subjects s ON se.subject_id=s.id 
                             WHERE se.student_id=? AND se.semester=?", [$u, $selectedSem]);

        // Export student transcript
        if (isset($_GET['export']) && $_GET['export'] === 'csv') {
            requirePermission('export_my_grades');
            $exportData = GradeModel::getDetailedGradesForStudentExport($u, $selectedSem);
            $filename = "student_transcript_" . $selectedSem . "_" . date('Ymd_His') . ".csv";
            
            header('Content-Type: text/csv; charset=utf-8');
            header('Content-Disposition: attachment; filename="' . $filename . '"');
            
            $out = fopen('php://output', 'w');
            // Output BOM for Excel UTF-8 display
            fprintf($out, chr(0xEF).chr(0xBB).chr(0xBF));
            
            fputcsv($out, ['Subject Code', 'Subject Name', 'Credits', 'Assessment Type', 'Weight (%)', 'Criterion Description', 'Score', 'Max Score', 'Graded By', 'Graded At']);
            foreach ($exportData as $row) {
                fputcsv($out, [
                    $row['subject_code'],
                    $row['subject_name'],
                    $row['credits'],
                    $row['assessment_type'],
                    $row['assessment_weight'],
                    $row['criterion_desc'],
                    $row['score'] !== null ? $row['score'] : 'N/A',
                    $row['max_score'],
                    $row['grader_name'] !== null ? $row['grader_name'] : 'N/A',
                    $row['graded_at'] !== null ? $row['graded_at'] : 'N/A'
                ]);
            }
            fclose($out);
            exit;
        }

        require_once __DIR__ . '/../views/grades.php';
        if (function_exists('pageGRADES')) {
            pageGRADES($semestersList, $selectedSem, $enrollments);
        }
    }

    // ── STUDENT: VIEW CLO REPORT ──
    public function showCloReport(): void {
        requirePermission('view_clo_report');
        $u = uid();

        $enrollments = qAll("SELECT se.*, s.name sn, s.code sc, s.program_id 
                             FROM student_enrollments se 
                             JOIN subjects s ON se.subject_id=s.id 
                             WHERE se.student_id=?", [$u]);

        $selectedEnrId = isset($_GET['enrollment_id']) ? (int)$_GET['enrollment_id'] : 0;
        if ($selectedEnrId === 0 && !empty($enrollments)) {
            $selectedEnrId = (int)$enrollments[0]['id'];
        }

        $enr = null;
        foreach ($enrollments as $e) {
            if ((int)$e['id'] === $selectedEnrId) {
                $enr = $e;
                break;
            }
        }

        $clos = [];
        if ($enr) {
            $clos = qAll("SELECT c.*, COUNT(DISTINCT m.plo_id) plo_count 
                          FROM clos c 
                          LEFT JOIN clo_plo_mappings m ON c.id=m.clo_id 
                          WHERE c.subject_id=? 
                          GROUP BY c.id ORDER BY c.code", [$enr['subject_id']]);
        }

        require_once __DIR__ . '/../views/clo_report.php';
        if (function_exists('pageCLO_REPORT')) {
            pageCLO_REPORT($enrollments);
        }
    }

    // ── POST ACTION: SAVE GRADES ──
    public function saveGrades(): void {
        requirePermission('grade_student');
        $aid = (int)$_POST['assessment_id'];
        $scores = $_POST['scores'] ?? [];

        $selAssess = AssessmentModel::getById($aid);
        if (!$selAssess) {
            flash('error', 'Assessment not found.');
            header('Location: index.php?page=dashboard');
            exit;
        }

        // Ownership Validation
        if (role() !== 'admin' && (int)$selAssess['lecturer_id'] !== uid()) {
            flash('error', 'Security Alert: You do not have permission to grade this assessment.');
            header('Location: index.php?page=dashboard');
            exit;
        }

        try {
            $saved = GradeModel::saveGrades($aid, $scores, uid(), role());
            flash('success', "Saved $saved scores. Ledger updated successfully.");
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header("Location: index.php?page=grade&assessment_id=$aid");
        exit;
    }

    // ── POST ACTION: REQUEST GRADE CHANGE ──
    public function requestGradeChange(): void {
        requirePermission('request_grade_change');
        $eid = (int)$_POST['enrollment_id'];
        $cid = (int)$_POST['criterion_id'];
        $newScore = (float)$_POST['new_score'];
        $reason = trim($_POST['reason'] ?? '');
        $aid = (int)$_POST['assessment_id'];

        if ($reason === '') {
            flash('error', 'Please provide a reason for the grade change request.');
            header("Location: index.php?page=grade&assessment_id=$aid");
            exit;
        }

        try {
            $existing = RequestModel::getScoreDetailsForRequest($eid, $cid, $aid);
            if (!$existing) {
                throw new Exception('No existing score found to request a change for.');
            }

            // Ownership check
            if (role() !== 'admin' && (int)$existing['lecturer_id'] !== uid()) {
                throw new Exception('Security Alert: You can only request changes for assessments you own.');
            }

            // Validate new score
            if ($newScore < 0 || $newScore > (float)$existing['max_score']) {
                throw new Exception("New score must be between 0 and {$existing['max_score']}.");
            }

            $newReqId = RequestModel::createRequest($eid, $cid, (float)$existing['score'], $newScore, $reason, uid());
            auditLog('REQUEST_GRADE_CHANGE', 'grade_change_requests', $newReqId);
            flash('success', 'Grade change request submitted successfully to administrator.');
        } catch (Exception $e) {
            flash('error', $e->getMessage());
        }
        header("Location: index.php?page=grade&assessment_id=$aid");
        exit;
    }

    // ── AJAX API: SAVE GRADES ──
    public function saveGradesAjax(): void {
        requirePermission('grade_student');
        
        header('Content-Type: application/json');

        // Validate CSRF
        if (!Auth::validateCsrfToken($_POST['csrf_token'] ?? '')) {
            echo json_encode(['success' => false, 'message' => 'Security error: Invalid CSRF Token.']);
            exit;
        }

        $aid = (int)($_POST['assessment_id'] ?? 0);
        $scores = $_POST['scores'] ?? [];

        if ($aid <= 0) {
            echo json_encode(['success' => false, 'message' => 'Security error: Invalid assessment ID.']);
            exit;
        }

        try {
            $savedCount = 0;
            db()->beginTransaction();
            $updatedEnrIds = [];

            foreach ($scores as $eid => $criteria) {
                foreach ($criteria as $cid => $scoreVal) {
                    if (trim((string)$scoreVal) === '') continue;
                    
                    $scoreVal = (float)$scoreVal;
                    $exist = GradeModel::getExistingScore((int)$eid, (int)$cid);
                    
                    if ($exist) {
                        if (abs((float)$exist['score'] - $scoreVal) > 0.001) {
                            qRun("UPDATE student_scores SET score=?, graded_at=NOW(), graded_by=?, updated_at=NOW() WHERE id=?", 
                                [$scoreVal, uid(), $exist['id']]);
                            ledgerRecord((int)$eid, (int)$cid, $scoreVal, 'UPDATE', uid(), (float)$exist['score']);
                            $updatedEnrIds[$eid] = true;
                            $savedCount++;
                        }
                    } else {
                        qRun("INSERT INTO student_scores (enrollment_id, criterion_id, score, graded_by, graded_at, updated_at) VALUES (?, ?, ?, ?, NOW(), NOW())", 
                            [(int)$eid, (int)$cid, $scoreVal, uid()]);
                        ledgerRecord((int)$eid, (int)$cid, $scoreVal, 'INSERT', uid());
                        $updatedEnrIds[$eid] = true;
                        $savedCount++;
                    }
                }
            }

            db()->commit();
            
            if (!empty($updatedEnrIds)) {
                $eids = array_keys($updatedEnrIds);
                $placeholders = implode(',', array_fill(0, count($eids), '?'));
                $students = qAll("SELECT student_id FROM student_enrollments WHERE id IN ($placeholders)", $eids);
                
                $subjInfo = qOne("SELECT s.code FROM assessments a JOIN subjects s ON a.subject_id = s.id WHERE a.id=?", [$aid]);
                $subjCode = $subjInfo ? $subjInfo['code'] : 'a subject';

                $sent = [];
                foreach ($students as $st) {
                    if (!isset($sent[$st['student_id']])) {
                        NotificationModel::create((int)$st['student_id'], 'Grades Posted', "Your grades for $subjCode have been updated.", 'info', uid());
                        $sent[$st['student_id']] = true;
                    }
                }
            }

            auditLog('GRADE_STUDENT_AJAX', 'student_scores', $aid, "Saved $savedCount scores via AJAX");
            
            echo json_encode(['success' => true, 'message' => "Successfully saved $savedCount grades! Ledger updated."]);
        } catch (Exception $e) {
            db()->rollBack();
            echo json_encode(['success' => false, 'message' => 'Security error: ' . $e->getMessage()]);
        }
        exit;
    }

    // ── AJAX API: REQUEST GRADE CHANGE ──
    public function requestGradeChangeAjax(): void {
        requirePermission('grade_student');
        header('Content-Type: application/json');

        if (!Auth::validateCsrfToken($_POST['csrf_token'] ?? '')) {
            echo json_encode(['success' => false, 'message' => 'Security error: Invalid CSRF Token.']); exit;
        }

        $eid = (int)$_POST['enrollment_id'];
        $cid = (int)$_POST['criterion_id'];
        $newScore = (float)$_POST['new_score'];
        $reason = trim($_POST['reason'] ?? '');
        $aid = (int)$_POST['assessment_id'];

        if ($reason === '') {
            echo json_encode(['success' => false, 'message' => 'Security error: Reason is required.']); exit;
        }

        try {
            $existing = RequestModel::getScoreDetailsForRequest($eid, $cid, $aid);
            if (!$existing) throw new Exception('Score not found.');
            if (role() !== 'admin' && (int)$existing['lecturer_id'] !== uid()) throw new Exception('No permission to modify.');
            if ($newScore < 0 || $newScore > (float)$existing['max_score']) throw new Exception("Score must be between 0 and " . $existing['max_score']);

            $newReqId = RequestModel::createRequest($eid, $cid, (float)$existing['score'], $newScore, $reason, uid());
            auditLog('REQUEST_GRADE_CHANGE', 'grade_change_requests', $newReqId);
            $admins = qAll("SELECT id FROM users WHERE role='admin'");
            foreach ($admins as $adm) {
                NotificationModel::create((int)$adm['id'], 'New Grade Change Request', "Lecturer " . fullName() . " has requested a grade change (Req #$newReqId).", 'warning', uid());
            }
            echo json_encode(['success' => true, 'message' => 'Request submitted successfully!']);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
        exit;
    }
}
