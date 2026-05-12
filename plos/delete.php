<?php
require_once '../classes/database.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    $id = (int)$_POST['id'];

    if ($id) {
        try {
            $db->query("DELETE FROM plos WHERE id = ?", [$id]);
            $_SESSION['msg'] = "Đã xóa PLO thành công!";
        } catch (PDOException $e) {
            $_SESSION['error'] = "Không thể xóa: " . $e->getMessage();
        }
    }
    header("Location: index.php");
    exit;
}
?>