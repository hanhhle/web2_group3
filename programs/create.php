<?php
require_once '../classes/database.php';
if (session_status() === PHP_SESSION_NONE) session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);
    
    $code = strtoupper(preg_replace('/\s+/', '', $_POST['code'])); 

    if (empty($name) || empty($code)) {
        $_SESSION['error'] = "Program name and code cannot be empty!";
        header("Location: index.php");
        exit;
    }

    try {
        $sql = "INSERT INTO programs (name, code, description) VALUES (?, ?, ?)";
        $db->query($sql, [$name, $code, $description]); // Prepared Statements protect against SQL Injection

        $_SESSION['msg'] = "Program added successfully: $code";
    } catch (PDOException $e) {
        // Handle duplicate program code (Unique Key constraint)
        if ($e->getCode() == 23000) {
            $_SESSION['error'] = "Error: Program code '$code' already exists.";
        } else {
            $_SESSION['error'] = "Database error: " . $e->getMessage();
        }
    }
    
    header("Location: index.php");
    exit;
}
?>