<?php
require_once '../classes/database.php';
if (session_status() === PHP_SESSION_NONE) session_start();

// Xử lý yêu cầu xóa dữ liệu (POST)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    $id = (int)$_POST['id'];

    if ($id) {
        try {
            $db->query("DELETE FROM subjects WHERE id = ?", [$id]);
            $_SESSION['msg'] = "Subject deleted successfully!";
        } catch (PDOException $e) {
            $_SESSION['error'] = "Cannot delete subject because it has grade ledger history: " . $e->getMessage();
        }
    }
    header("Location: index.php");
    exit;
}
?>