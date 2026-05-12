<?php
require_once '../classes/database.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    $id = (int)$_POST['id'];

    if ($id) {
        try {
            $sql = "DELETE FROM programs WHERE id = ?";
            $db->query($sql, [$id]);
            $_SESSION['msg'] = "Đã xóa chương trình thành công!";
        } catch (PDOException $e) {
            $_SESSION['error'] = "Không thể xóa: " . $e->getMessage();
        }
    }
    
    header("Location: index.php");
    exit;
}
?>