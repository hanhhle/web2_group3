<?php
require_once '../classes/database.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = Database::getInstance();
    $program_id = $_POST['program_id'];
    $subject_id = $_POST['subject_id'];
    
    // Mảng mapping nhận được có dạng: $mappings[clo_id][plo_id] = percentage
    $mappings = $_POST['mapping'] ?? [];

    try {
        // Sử dụng Transaction để đảm bảo tính toàn vẹn (Hoặc lưu tất cả, hoặc không lưu gì)
        $db->pdo->beginTransaction();

        foreach ($mappings as $clo_id => $plo_data) {
            foreach ($plo_data as $plo_id => $percentage) {
                
                // Xóa mapping cũ của cặp CLO-PLO này
                $db->query("DELETE FROM clo_plo_mappings WHERE clo_id = ? AND plo_id = ?", [$clo_id, $plo_id]);
                
                // Chỉ insert lại nếu phần trăm > 0
                if ($percentage > 0) {
                    $db->query("INSERT INTO clo_plo_mappings (clo_id, plo_id, contribution_percentage) VALUES (?, ?, ?)", 
                        [$clo_id, $plo_id, $percentage]
                    );
                }
            }
        }
        $db->pdo->commit();
        $_SESSION['msg'] = "Đã lưu ma trận ánh xạ thành công!";
        
    } catch (PDOException $e) {
        $db->pdo->rollBack();
        $_SESSION['error'] = "Lỗi lưu ma trận: " . $e->getMessage();
    }
    
    // Trả về đúng cái ma trận vừa mở
    header("Location: matrix.php?program_id=$program_id&subject_id=$subject_id");
    exit;
}