<?php
require_once '../classes/database.php';
if (session_status() === PHP_SESSION_NONE) session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    $program_id = $_POST['program_id'];
    $subject_id = $_POST['subject_id'];
    
    // Mapping array shape: $mappings[clo_id][plo_id] = percentage
    $mappings = $_POST['mapping'] ?? [];

    try {
        // Use transaction to ensure integrity (either save all or none)
        $db->pdo->beginTransaction();

        foreach ($mappings as $clo_id => $plo_data) {
            foreach ($plo_data as $plo_id => $percentage) {
                
                // Xóa mapping cũ của cặp CLO-PLO này
                $db->query("DELETE FROM clo_plo_mappings WHERE clo_id = ? AND plo_id = ?", [$clo_id, $plo_id]);
                
                // Only insert if percentage > 0
                if ($percentage > 0) {
                    $db->query("INSERT INTO clo_plo_mappings (clo_id, plo_id, contribution_percentage) VALUES (?, ?, ?)", 
                        [$clo_id, $plo_id, $percentage]
                    );
                }
            }
        }
        $db->pdo->commit();
        $_SESSION['msg'] = "Saved mapping matrix successfully!";
        
    } catch (PDOException $e) {
        $db->pdo->rollBack();
        $_SESSION['error'] = "Matrix save error: " . $e->getMessage();
    }
    
    // Trả về đúng cái ma trận vừa mở
    header("Location: matrix.php?program_id=$program_id&subject_id=$subject_id");
    exit;
}