<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once 'classes/database.php';
$db = Database::getInstance();

echo "<div style='font-family: Arial; padding: 20px; line-height: 1.6;'>";
echo "<h2>🚀 Đang chạy Thuật toán Auto-Mapping (Tự động ánh xạ CLO - PLO)...</h2>";

try {
    $db->beginTransaction();

    // 1. Lấy danh sách tất cả các chương trình đào tạo
    $programs = $db->fetchAll("SELECT id, code FROM programs");
    
    $total_mappings_inserted = 0;

    foreach ($programs as $prog) {
        $program_id = $prog['id'];
        
        // 2. Lấy danh sách tất cả PLO của chương trình này
        $plos = $db->fetchAll("SELECT id FROM plos WHERE program_id = ?", [$program_id]);
        if (empty($plos)) continue; // Bỏ qua nếu ngành chưa có PLO
        
        // Lấy danh sách ID của các PLO để random
        $plo_ids = array_column($plos, 'id');

        // 3. Lấy tất cả các môn học thuộc chương trình này (qua bảng N-N)
        $subjects = $db->fetchAll("
            SELECT s.id 
            FROM subjects s
            JOIN subject_program_mapping spm ON s.id = spm.subject_id
            WHERE spm.program_id = ?
        ", [$program_id]);

        foreach ($subjects as $sub) {
            $subject_id = $sub['id'];

            // 4. Lấy tất cả CLO của môn học này
            $clos = $db->fetchAll("SELECT id FROM clos WHERE subject_id = ?", [$subject_id]);
            
            foreach ($clos as $clo) {
                $clo_id = $clo['id'];

                // Kiểm tra xem CLO này đã có mapping với PLO nào của ngành này chưa
                $check_exist = $db->query("
                    SELECT COUNT(*) as count 
                    FROM clo_plo_mappings 
                    WHERE clo_id = ? AND plo_id IN (" . implode(',', $plo_ids) . ")
                ", [$clo_id])->fetch();

                if ($check_exist['count'] > 0) {
                    continue; // Nếu đã có mapping rồi thì bỏ qua để không ghi đè dữ liệu thật cậu đã test
                }

                // 5. THUẬT TOÁN RANDOM MAPPING
                // Lấy ngẫu nhiên từ 1 đến 3 PLO để ánh xạ cho CLO này
                $num_plos_to_map = rand(1, min(3, count($plo_ids))); 
                $random_plo_keys = (array) array_rand($plo_ids, $num_plos_to_map);
                
                // Mảng các tỷ lệ % phổ biến để chia (Tổng không nhất thiết phải bằng 100% theo luật Mapping)
                $percentages = [20, 30, 40, 50, 60, 70, 80, 100];

                foreach ($random_plo_keys as $key) {
                    $random_plo_id = $plo_ids[$key];
                    $random_percent = $percentages[array_rand($percentages)]; // Lấy ngẫu nhiên 1 tỷ lệ %

                    // 6. Lưu vào cơ sở dữ liệu
                    $db->query("INSERT INTO clo_plo_mappings (clo_id, plo_id, weight) VALUES (?, ?, ?)", 
                               [$clo_id, $random_plo_id, $random_percent]);
                    
                    $total_mappings_inserted++;
                }
            }
        }
    }

    $db->commit();

    echo "<h3 style='color: green;'>🎉 Hoàn tất Auto-Mapping!</h3>";
    echo "<p>Đã tự động rải <strong>$total_mappings_inserted</strong> bản ghi phần trăm (%) vào Ma trận Ánh xạ cho toàn bộ các ngành.</p>";
    echo "<a href='clos/matrix.php' class='btn' style='padding: 10px 20px; background: #0d6efd; color: white; text-decoration: none; border-radius: 5px; margin-top: 20px; display: inline-block;'>Đến trang Ma trận Ánh xạ</a>";

} catch (Exception $e) {
    $db->rollBack();
    echo "<h3 style='color: red;'>❌ Lỗi Database: " . $e->getMessage() . "</h3>";
}
echo "</div>";
?>