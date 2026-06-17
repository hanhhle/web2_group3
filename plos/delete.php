<?php
require_once '../classes/database.php';
if (session_status() === PHP_SESSION_NONE) session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    $id = (int)$_POST['id'];

    if ($id) {
        try {
            $db->query("DELETE FROM plos WHERE id = ?", [$id]);
            $_SESSION['msg'] = "PLO deleted successfully!";
        } catch (PDOException $e) {
            $_SESSION['error'] = "Delete error: " . $e->getMessage();
        }
    }
    header("Location: index.php");
    exit;
}
?>