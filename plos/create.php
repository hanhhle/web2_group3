<?php
require_once '../classes/database.php';
if (session_status() === PHP_SESSION_NONE) session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    $program_id = (int)$_POST['program_id'];
    $code = strtoupper(trim($_POST['code']));
    $description = trim($_POST['description']);

    try {
        $sql = "INSERT INTO plos (program_id, code, description) VALUES (?, ?, ?)";
        $db->query($sql, [$program_id, $code, $description]);
        $_SESSION['msg'] = "PLO added successfully!";
    } catch (PDOException $e) {
        $_SESSION['error'] = "Database error: " . $e->getMessage();
    }
    header("Location: index.php");
    exit;
}