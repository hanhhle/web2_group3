<?php
declare(strict_types=1);

class GradeRequestController {
    // ── ADMIN: VIEW ALL REQUESTS ──
    public function index(): void {
        requirePermission('approve_grade_change');
        $allReqs = RequestModel::getAllRequests();

        require_once __DIR__ . '/../views/grade_requests.php';
        if (function_exists('pageGRADE_REQUESTS')) {
            pageGRADE_REQUESTS($allReqs);
        }
    }

    // ── LECTURER: VIEW MY SUBMITTED REQUESTS ──
    public function showMyRequests(): void {
        requirePermission('request_grade_change');
        $myReqs = RequestModel::getRequestsByLecturer(uid());

        require_once __DIR__ . '/../views/my_requests.php';
        if (function_exists('pageMY_REQUESTS')) {
            pageMY_REQUESTS($myReqs);
        }
    }

    // ── POST ACTION: APPROVE REQUEST ──
    public function approveGradeChange(): void {
        requirePermission('approve_grade_change');
        $id = (int)($_POST['request_id'] ?? $_POST['id'] ?? 0);
        $note = trim($_POST['review_note'] ?? '');

        try {
            $req = RequestModel::getById($id);
            if (!$req) {
                throw new Exception('Request not found or already processed.');
            }

            RequestModel::approveRequest($id, uid(), $note);
            auditLog('APPROVE_GRADE_CHANGE', 'grade_change_requests', $id, "Approved new score: " . $req['new_score']);
            flash('success', 'Request approved and ledger chain updated successfully.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=grade_requests');
        exit;
    }

    // ── POST ACTION: REJECT REQUEST ──
    public function rejectGradeChange(): void {
        requirePermission('approve_grade_change');
        $id = (int)($_POST['request_id'] ?? $_POST['id'] ?? 0);
        $note = trim($_POST['review_note'] ?? '');

        try {
            $req = RequestModel::getById($id);
            if (!$req) {
                throw new Exception('Request not found or already processed.');
            }

            RequestModel::rejectRequest($id, uid(), $note);
            auditLog('REJECT_GRADE_CHANGE', 'grade_change_requests', $id);
            flash('success', 'Request rejected.');
        } catch (Exception $e) {
            flash('error', 'Error: ' . $e->getMessage());
        }
        header('Location: index.php?page=grade_requests');
        exit;
    }

    // ── AJAX API: ADMIN APPROVE REQUEST ──
    public function approveGradeChangeAjax(): void {
        requirePermission('approve_grade_change');
        header('Content-Type: application/json');

        if (!Auth::validateCsrfToken($_POST['csrf_token'] ?? '')) { echo json_encode(['success' => false, 'message' => 'CSRF Token is invalid.']); exit; }
        $id = (int)($_POST['request_id'] ?? 0);
        $note = trim($_POST['review_note'] ?? '');

        try {
            $req = RequestModel::getById($id);
            if (!$req) throw new Exception('Request not found or already processed.');

            RequestModel::approveRequest($id, uid(), $note);
            auditLog('APPROVE_GRADE_CHANGE', 'grade_change_requests', $id);
            $info = qOne("SELECT se.student_id, s.code as subj_code, rc.description as crit_desc 
                          FROM student_enrollments se 
                          JOIN subjects s ON se.subject_id = s.id 
                          JOIN rubric_criteria rc ON rc.id = ? 
                          WHERE se.id = ?", [$req['criterion_id'], $req['enrollment_id']]);
            
            NotificationModel::create((int)$req['requested_by'], 'Request Approved', "Your grade change request for {$info['subj_code']} has been approved.", 'success', uid());
            
            if ($info && $info['student_id']) {
                NotificationModel::create((int)$info['student_id'], 'Grade Updated', "Your grade for {$info['subj_code']} ({$info['crit_desc']}) has been revised by Admin.", 'info', uid());
            }
            echo json_encode(['success' => true, 'message' => 'Request approved and ledger chain updated successfully.']);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
        exit;
    }

    // ── AJAX API: ADMIN REJECT REQUEST ──
    public function rejectGradeChangeAjax(): void {
        requirePermission('approve_grade_change');
        header('Content-Type: application/json');

        if (!Auth::validateCsrfToken($_POST['csrf_token'] ?? '')) { echo json_encode(['success' => false, 'message' => 'CSRF Token is invalid.']); exit; }
        $id = (int)($_POST['request_id'] ?? 0);
        $note = trim($_POST['review_note'] ?? '');

        try {
            $req = RequestModel::getById($id);
            if (!$req) throw new Exception('Request not found or already processed.');

            RequestModel::rejectRequest($id, uid(), $note);
            auditLog('REJECT_GRADE_CHANGE', 'grade_change_requests', $id);
            $info = qOne("SELECT s.code as subj_code FROM student_enrollments se JOIN subjects s ON se.subject_id = s.id WHERE se.id = ?", [$req['enrollment_id']]);
            $subjCode = $info ? $info['subj_code'] : 'a subject';
            
            NotificationModel::create((int)$req['requested_by'], 'Request Rejected', "Your grade change request for $subjCode was rejected. Note: $note", 'danger', uid());
            echo json_encode(['success' => true, 'message' => 'Request rejected.']);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
        exit;
    }
}
