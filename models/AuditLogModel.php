<?php
declare(strict_types=1);

class AuditLogModel {
    public static function getAll(): array {
        return qAll("SELECT al.*, u.full_name, u.username 
                     FROM audit_logs al 
                     LEFT JOIN users u ON al.user_id=u.id 
                     ORDER BY al.created_at DESC LIMIT 200");
    }

    public static function getByUser(int $userId): array {
        return qAll("SELECT al.*, u.full_name, u.username 
                     FROM audit_logs al 
                     LEFT JOIN users u ON al.user_id=u.id 
                     WHERE al.user_id=? 
                     ORDER BY al.created_at DESC LIMIT 100", [$userId]);
    }
}
