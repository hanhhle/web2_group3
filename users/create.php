<?php
require_once '../classes/database.php';
if (session_status() === PHP_SESSION_NONE) session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();

    $username = trim($_POST['username'] ?? '');
    $full_name = trim($_POST['full_name'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';
    $role = trim($_POST['role'] ?? 'student');

    if ($username === '' || $full_name === '' || $email === '' || $password === '') {
        $_SESSION['error'] = 'Please fill in all required fields.';
        header('Location: index.php');
        exit;
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $_SESSION['error'] = 'Please provide a valid email address.';
        header('Location: index.php');
        exit;
    }

    try {
        $password_hash = password_hash($password, PASSWORD_DEFAULT);
        $sql = "INSERT INTO users (username, full_name, email, password_hash, role) VALUES (?, ?, ?, ?, ?)";
        $db->query($sql, [$username, $full_name, $email, $password_hash, $role]);
        $_SESSION['msg'] = 'User account created successfully!';
    } catch (PDOException $e) {
        if ($e->getCode() == 23000) {
            $_SESSION['error'] = 'A user with the same username or email already exists.';
        } else {
            $_SESSION['error'] = 'Database error: ' . $e->getMessage();
        }
    }

    header('Location: index.php');
    exit;
}