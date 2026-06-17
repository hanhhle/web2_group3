<?php
require_once '../classes/database.php';
if (session_status() === PHP_SESSION_NONE) session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    
    $code = strtoupper(trim($_POST['code']));
    $name = trim($_POST['name']);
    $credits = (int)$_POST['credits'];
    $program_ids = $_POST['program_ids'] ?? []; // Đây là mảng các ID ngành được tích chọn

    if (empty($code) || empty($name) || empty($program_ids)) {
        $_SESSION['error'] = "Please fill all required fields and select at least one program!";
        header("Location: index.php");
        exit;
    }

    try {
        // Bước 1: Lưu thông tin môn học vào bảng subjects (không còn cột program_id)
        $sql_sub = "INSERT INTO subjects (code, name, credits) VALUES (?, ?, ?)";
        $db->query($sql_sub, [$code, $name, $credits]);
        
        // Lấy ID của môn học vừa tạo
        $subject_id = $db->pdo->lastInsertId();

        // Bước 2: Lặp qua mảng các ngành để lưu vào bảng trung gian
        $sql_mapping = "INSERT INTO subject_program_mapping (subject_id, program_id) VALUES (?, ?)";
        foreach ($program_ids as $p_id) {
            $db->query($sql_mapping, [$subject_id, (int)$p_id]);
        }

        $_SESSION['msg'] = "Subject created and mapped to " . count($program_ids) . " programs successfully!";
    } catch (PDOException $e) {
        $_SESSION['error'] = "Database Error: " . $e->getMessage();
    }
    
    header("Location: index.php");
    exit;
}