<?php
require_once '../classes/database.php';
if (session_status() === PHP_SESSION_NONE) session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    $id = (int)$_POST['id'];

    if ($id) {
        try {
            $sql = "DELETE FROM programs WHERE id = ?";
            $db->query($sql, [$id]);
            $_SESSION['msg'] = "Program deleted successfully!";
        } catch (PDOException $e) {
            $_SESSION['error'] = "Unable to delete program: " . $e->getMessage();
        }
    }
    
    header("Location: index.php");
    exit;
}
?>