<?php
require_once '../classes/database.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    $id = (int)$_POST['id'];

    if ($id) {
        try {
            $db->query("DELETE FROM users WHERE id = ?", [$id]);
            $_SESSION['msg'] = "Đã xóa tài khoản thành công!";
        } catch (PDOException $e) {
            $_SESSION['error'] = "Không thể xóa (tài khoản này đang chứa dữ liệu điểm số): " . $e->getMessage();
        }
    }
    header("Location: index.php");
    exit;
}
?>