<?php
require_once '../classes/database.php';
if (session_status() === PHP_SESSION_NONE) session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    $id = (int)$_POST['id'];

    if ($id) {
        try {
            $db->query("DELETE FROM users WHERE id = ?", [$id]);
            $_SESSION['msg'] = "Account deleted successfully!";
        } catch (PDOException $e) {
            $_SESSION['error'] = "Unable to delete user (account has related grade data): " . $e->getMessage();
        }
    }
    header("Location: index.php");
    exit;
}
?>