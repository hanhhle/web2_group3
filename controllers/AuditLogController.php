<?php
declare(strict_types=1);

class AuditLogController {
    public function index(): void {
        requirePermission('view_audit_logs');
        $isAdmin = (role() === 'admin');

        if ($isAdmin) {
            $logs = AuditLogModel::getAll();
        } else {
            $logs = AuditLogModel::getByUser(uid());
        }

        $pageTitle = $isAdmin ? 'System Audit Logs' : 'My Activity Logs';
        $pageDesc  = $isAdmin ? 'Global operation logs and ledger activities' : 'Operations and ledger activities performed by your account';

        require_once __DIR__ . '/../views/audit_logs.php';
        if (function_exists('pageAUDIT_LOGS')) {
            pageAUDIT_LOGS($logs, $pageTitle, $pageDesc);
        }
    }
}
