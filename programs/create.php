<?php
require_once '../classes/database.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);
    
    $code = strtoupper(preg_replace('/\s+/', '', $_POST['code'])); 

    if (empty($name) || empty($code)) {
        $_SESSION['error'] = "Tên và Mã chương trình không được để trống!";
        header("Location: index.php");
        exit;
    }

    try {
        $sql = "INSERT INTO programs (name, code, description) VALUES (?, ?, ?)";
        $db->query($sql, [$name, $code, $description]); // Prepared Statements chống SQL Injection

        $_SESSION['msg'] = "Đã thêm thành công chương trình: $code";
    } catch (PDOException $e) {
        // Bắt lỗi trùng lặp Mã chương trình (Unique Key constraint)
        if ($e->getCode() == 23000) {
            $_SESSION['error'] = "Lỗi: Mã chương trình '$code' đã tồn tại trong hệ thống!";
        } else {
            $_SESSION['error'] = "Lỗi Database: " . $e->getMessage();
        }
    }
    
    header("Location: index.php");
    exit;
}
?>