<?php
declare(strict_types=1);

class NotificationController {
    // ── MAIN INTERFACE ──
    public function index(): void {
        requirePermission('view_notifications');
        $isAdmin = hasPermission('manage_notifications');
        $u = uid();

        if ($isAdmin) {
            $myInbox = NotificationModel::getInboxForUser($u);
            $allNotifs = NotificationModel::getAllNotificationsForAdmin();
            $recipients = qAll("SELECT id, username, role, full_name FROM users ORDER BY role, username");
        } else {
            $myInbox = NotificationModel::getInboxForUser($u);
            $allNotifs = [];
            $recipients = [];
        }

        require_once __DIR__ . '/../views/notifications.php';
        if (function_exists('pageNOTIFICATIONS')) {
            pageNOTIFICATIONS($myInbox, $allNotifs, $recipients, $isAdmin);
        }
    }

    // ── AJAX: LIST USER NOTIFICATIONS ──
    public function list(): void {
        requirePermission('view_notifications');
        header('Content-Type: application/json');
        
        $myInbox = NotificationModel::getInboxForUser(uid());
        $unreadCount = NotificationModel::getUnreadCount(uid());
        
        echo json_encode(['success' => true, 'notifications' => $myInbox, 'unread_count' => $unreadCount]);
        exit;
    }

    // ── AJAX: CREATE ──
    public function create(): void {
        requirePermission('manage_notifications');
        header('Content-Type: application/json');

        if (!Auth::validateCsrfToken($_POST['csrf_token'] ?? '')) {
            echo json_encode(['success' => false, 'message' => 'CSRF token mismatch.']);
            exit;
        }

        $title = trim($_POST['title'] ?? '');
        $message = trim($_POST['message'] ?? '');
        $type = trim($_POST['type'] ?? 'info');
        $targetUserId = isset($_POST['user_id']) && $_POST['user_id'] !== '' ? (int)$_POST['user_id'] : null;

        if ($title === '' || $message === '') {
            echo json_encode(['success' => false, 'message' => 'Title and message cannot be empty.']);
            exit;
        }

        if (!in_array($type, ['info', 'success', 'warning', 'danger'], true)) {
            $type = 'info';
        }

        try {
            $newId = NotificationModel::create($targetUserId, $title, $message, $type, uid());
            auditLog('CREATE_NOTIFICATION', 'notifications', $newId, "Created: $title (target: " . ($targetUserId ?: 'All') . ")");
            echo json_encode(['success' => true, 'id' => $newId, 'message' => 'Notification created successfully.']);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
        exit;
    }

    // ── AJAX: UPDATE ──
    public function update(): void {
        requirePermission('manage_notifications');
        header('Content-Type: application/json');

        if (!Auth::validateCsrfToken($_POST['csrf_token'] ?? '')) {
            echo json_encode(['success' => false, 'message' => 'CSRF token mismatch.']);
            exit;
        }

        $id = (int)($_POST['id'] ?? 0);
        $title = trim($_POST['title'] ?? '');
        $message = trim($_POST['message'] ?? '');
        $type = trim($_POST['type'] ?? 'info');
        $targetUserId = isset($_POST['user_id']) && $_POST['user_id'] !== '' ? (int)$_POST['user_id'] : null;

        if ($id <= 0 || $title === '' || $message === '') {
            echo json_encode(['success' => false, 'message' => 'Invalid parameters.']);
            exit;
        }

        try {
            $notif = NotificationModel::getById($id);
            if (!$notif) {
                echo json_encode(['success' => false, 'message' => 'Notification not found.']);
                exit;
            }

            NotificationModel::update($id, $targetUserId, $title, $message, $type);
            auditLog('UPDATE_NOTIFICATION', 'notifications', $id, "Updated: $title");
            echo json_encode(['success' => true, 'message' => 'Notification updated successfully.']);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
        exit;
    }

    // ── AJAX: DELETE ──
    public function delete(): void {
        requirePermission('view_notifications');
        header('Content-Type: application/json');

        if (!Auth::validateCsrfToken($_POST['csrf_token'] ?? '')) {
            echo json_encode(['success' => false, 'message' => 'CSRF token mismatch.']);
            exit;
        }

        $id = (int)($_POST['id'] ?? 0);
        if ($id <= 0) {
            echo json_encode(['success' => false, 'message' => 'Invalid ID.']);
            exit;
        }

        try {
            $notif = NotificationModel::getById($id);
            if (!$notif) {
                echo json_encode(['success' => false, 'message' => 'Notification not found.']);
                exit;
            }

            $isAdmin = hasPermission('manage_notifications');
            $fromHistory = isset($_POST['from_history']) && $_POST['from_history'] === '1';

            if ($fromHistory) {
                // Deleting broadcast globally from admin console
                if (!$isAdmin) {
                    echo json_encode(['success' => false, 'message' => 'Access denied. You cannot delete this announcement.']);
                    exit;
                }
                NotificationModel::delete($id);
                auditLog('DELETE_NOTIFICATION', 'notifications', $id, "Deleted broadcast notification #$id");
                echo json_encode(['success' => true, 'message' => 'Broadcast deleted successfully.']);
            } else {
                // Dismissing notification for the current user
                // User can dismiss if it's targeted to them OR if it's a global notification (user_id IS NULL)
                if ($notif['user_id'] !== null && (int)$notif['user_id'] !== uid()) {
                    echo json_encode(['success' => false, 'message' => 'Access denied. You cannot dismiss this notification.']);
                    exit;
                }
                NotificationModel::dismissForUser($id, uid());
                echo json_encode(['success' => true, 'message' => 'Notification dismissed.']);
            }
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
        exit;
    }

    // ── AJAX: MARK AS READ ──
    public function markRead(): void {
        requirePermission('mark_notification_read');
        header('Content-Type: application/json');

        if (!Auth::validateCsrfToken($_POST['csrf_token'] ?? '')) {
            echo json_encode(['success' => false, 'message' => 'CSRF token mismatch.']);
            exit;
        }

        $id = (int)($_POST['id'] ?? 0);
        if ($id <= 0) {
            echo json_encode(['success' => false, 'message' => 'Invalid ID.']);
            exit;
        }

        try {
            NotificationModel::markAsRead($id, uid());
            echo json_encode(['success' => true, 'message' => 'Notification marked as read.']);
        } catch (Exception $e) {
            echo json_encode(['success' => false, 'message' => $e->getMessage()]);
        }
        exit;
    }
}
