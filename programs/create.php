<?php
require_once '../classes/Database.php';
session_start(); 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    
    $name = trim($_POST['name']);
    $code = trim($_POST['code']);
    $description = trim($_POST['description']);

    if (empty($name) || empty($code)) {
        $_SESSION['error'] = "Tên và Mã chương trình không được để trống!";
        header("Location: index.php");
        exit;
    }

    try {
        $sql = "INSERT INTO programs (name, code, description) VALUES (?, ?, ?)";
        $db->query($sql, [$name, $code, $description]);

        $_SESSION['msg'] = "Thêm chương trình thành công!";
        header("Location: index.php");
        exit;

    } catch (PDOException $e) {
        $_SESSION['error'] = "Lỗi Database: " . $e->getMessage();
        header("Location: index.php");
        exit;
    }
}
?>