<?php
declare(strict_types=1);

class NotificationModel {
    /**
     * Fetch user inbox (personal notifications targetting user OR global announcements where user_id IS NULL)
     */
    public static function getInboxForUser(int $userId): array {
        $rows = qAll(
            "SELECT n.*, u.full_name AS sender_name 
             FROM notifications n 
             LEFT JOIN users u ON n.created_by = u.id 
             WHERE n.user_id = ? OR n.user_id IS NULL 
             ORDER BY n.created_at DESC LIMIT 100",
            [$userId]
        );

        $filtered = [];
        foreach ($rows as $row) {
            // Check if dismissed
            $dismissed = [];
            if (!empty($row['dismissed_by'])) {
                $dismissed = json_decode($row['dismissed_by'], true);
                if (!is_array($dismissed)) {
                    $dismissed = [];
                }
            }
            if (in_array($userId, $dismissed, true)) {
                continue;
            }

            // Handle dynamic reading status for global announcements
            if ($row['user_id'] === null) {
                $readBy = [];
                if (!empty($row['read_by'])) {
                    $readBy = json_decode($row['read_by'], true);
                    if (!is_array($readBy)) {
                        $readBy = [];
                    }
                }
                $row['is_read'] = in_array($userId, $readBy, true) ? 1 : 0;
            }

            $filtered[] = $row;
        }

        return $filtered;
    }

    /**
     * Fetch all notifications for Admin management console
     */
    public static function getAllNotificationsForAdmin(): array {
        return qAll(
            "SELECT n.*, u.username AS recipient_username, u.full_name AS recipient_name, 
                    s.username AS sender_username, s.full_name AS sender_name 
             FROM notifications n 
             LEFT JOIN users u ON n.user_id = u.id 
             LEFT JOIN users s ON n.created_by = s.id 
             ORDER BY n.created_at DESC LIMIT 200"
        );
    }

    public static function getById(int $id): ?array {
        $res = qOne("SELECT * FROM notifications WHERE id = ?", [$id]);
        return $res ?: null;
    }

    public static function create(?int $userId, string $title, string $message, string $type, int $createdBy): int {
        qRun(
            "INSERT INTO notifications (user_id, title, message, type, created_by) VALUES (?, ?, ?, ?, ?)",
            [$userId, $title, $message, $type, $createdBy]
        );
        return (int)lastId();
    }

    public static function update(int $id, ?int $userId, string $title, string $message, string $type): bool {
        $stmt = qRun(
            "UPDATE notifications SET user_id = ?, title = ?, message = ?, type = ? WHERE id = ?",
            [$userId, $title, $message, $type, $id]
        );
        return $stmt->rowCount() > 0;
    }

    public static function delete(int $id): bool {
        $stmt = qRun("DELETE FROM notifications WHERE id = ?", [$id]);
        return $stmt->rowCount() > 0;
    }

    public static function markAsRead(int $id, int $userId): bool {
        $notif = self::getById($id);
        if (!$notif) {
            return false;
        }

        // If not targeting this user and not global, deny
        if ($notif['user_id'] !== null && (int)$notif['user_id'] !== $userId) {
            return false;
        }

        if ($notif['user_id'] === null) {
            // Global: append user ID to read_by JSON array
            $readBy = [];
            if (!empty($notif['read_by'])) {
                $readBy = json_decode($notif['read_by'], true);
                if (!is_array($readBy)) {
                    $readBy = [];
                }
            }
            if (!in_array($userId, $readBy, true)) {
                $readBy[] = $userId;
            }
            $stmt = qRun(
                "UPDATE notifications SET read_by = ? WHERE id = ?",
                [json_encode($readBy), $id]
            );
            return $stmt->rowCount() > 0;
        } else {
            // Targeted: set is_read = 1
            $stmt = qRun(
                "UPDATE notifications SET is_read = 1 WHERE id = ?",
                [$id]
            );
            return $stmt->rowCount() > 0;
        }
    }

    public static function dismissForUser(int $id, int $userId): bool {
        $notif = self::getById($id);
        if (!$notif) {
            return false;
        }

        // If not targeting this user and not global, deny
        if ($notif['user_id'] !== null && (int)$notif['user_id'] !== $userId) {
            return false;
        }

        // Append to dismissed_by
        $dismissed = [];
        if (!empty($notif['dismissed_by'])) {
            $dismissed = json_decode($notif['dismissed_by'], true);
            if (!is_array($dismissed)) {
                $dismissed = [];
            }
        }
        if (!in_array($userId, $dismissed, true)) {
            $dismissed[] = $userId;
        }
        $stmt = qRun(
            "UPDATE notifications SET dismissed_by = ? WHERE id = ?",
            [json_encode($dismissed), $id]
        );
        return $stmt->rowCount() > 0;
    }

    public static function getUnreadCount(int $userId): int {
        $inbox = self::getInboxForUser($userId);
        $cnt = 0;
        foreach ($inbox as $n) {
            if ((int)$n['is_read'] === 0) {
                $cnt++;
            }
        }
        return $cnt;
    }
}
