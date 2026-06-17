<?php
require_once '../classes/database.php';
if (session_status() === PHP_SESSION_NONE) session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    $subject_id = (int)$_POST['subject_id'];
    $code = strtoupper(trim($_POST['code']));
    $description = trim($_POST['description']);

    try {
        $db->query("INSERT INTO clos (subject_id, code, description) VALUES (?, ?, ?)", [$subject_id, $code, $description]);
        $_SESSION['msg'] = "Added $code successfully!";
    } catch (PDOException $e) {
        $_SESSION['error'] = "Database error: " . $e->getMessage();
    }
    header("Location: index.php");
    exit;
}