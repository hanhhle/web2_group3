<?php
declare(strict_types=1);

class LedgerController {
    // ── ADMIN: VIEW LEDGER ENTRIES ──
    public function index(): void {
        requirePermission('view_ledger');
        $isAdmin = hasPermission('verify_ledger');
        $uid = uid();

        if ($isAdmin) {
            $entries = qAll("SELECT sl.*, u.full_name grader, u.username grader_username, se.semester, su.full_name student_name, sub.name subject_name, sub.code subject_code, rc.description crit_desc FROM score_ledger sl JOIN users u ON sl.graded_by = u.id JOIN student_enrollments se ON sl.enrollment_id = se.id JOIN users su ON se.student_id = su.id JOIN subjects sub ON se.subject_id = sub.id JOIN rubric_criteria rc ON sl.criterion_id = rc.id ORDER BY sl.id DESC LIMIT 300");
            $pageTitle = 'Global Score Ledger';
            $pageDesc  = 'All subjects — full hash chain view';
        } else {
            $entries = qAll("SELECT sl.*, u.full_name grader, u.username grader_username, se.semester, su.full_name student_name, sub.name subject_name, sub.code subject_code, rc.description crit_desc FROM score_ledger sl JOIN users u ON sl.graded_by = u.id JOIN student_enrollments se ON sl.enrollment_id = se.id JOIN users su ON se.student_id = su.id JOIN subjects sub ON se.subject_id = sub.id JOIN rubric_criteria rc ON sl.criterion_id = rc.id WHERE sl.graded_by = ? ORDER BY sl.id DESC LIMIT 200", [$uid]);
            $pageTitle = 'My Subject Ledger';
            $pageDesc  = 'Ledger entries for subjects you teach';
        }

        require_once __DIR__ . '/../views/ledger.php';
        if (function_exists('pageLEDGER')) {
            pageLEDGER($entries, $pageTitle, $pageDesc);
        }
    }

    // ── ADMIN: VERIFY LEDGER BLOCKS ──
    public function verify(): void {
        requirePermission('verify_ledger');
        $result = null;

        if (($_SERVER['REQUEST_METHOD'] ?? '') === 'POST' && ($_POST['_action'] ?? '') === 'verify_ledger') {
            $result = ledgerVerify();
        }

        require_once __DIR__ . '/../views/verify_ledger.php';
        if (function_exists('pageVERIFY_LEDGER')) {
            pageVERIFY_LEDGER($result);
        }
    }

    // ── POST ACTION: SELF-HEAL ──
    public function selfHealLedger(): void {
        requirePermission('verify_ledger');

        try {
            $healed = ledgerSelfHeal();
            flash('success', "Self-healing completed. Restored $healed records successfully.");
        } catch (Exception $e) {
            flash('error', 'Error during healing: ' . $e->getMessage());
        }
        header('Location: index.php?page=verify_ledger');
        exit;
    }
}
