<?php
require_once '../classes/database.php';
session_start();

// Xử lý yêu cầu xóa dữ liệu (POST)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    $id = (int)$_POST['id'];

    if ($id) {
        try {
            $db->query("DELETE FROM subjects WHERE id = ?", [$id]);
            $_SESSION['msg'] = "Đã xóa môn học thành công!";
        } catch (PDOException $e) {
            $_SESSION['error'] = "Không thể xóa môn học này vì đang có dữ liệu điểm (Ledger) liên quan: " . $e->getMessage();
        }
    }
    header("Location: index.php");
    exit;
}
?>