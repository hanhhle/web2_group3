<?php
// BẬT HIỂN THỊ LỖI (Vũ khí bí mật để bắt bệnh PHP)
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once 'classes/database.php';
$db = Database::getInstance();

echo "<div style='font-family: Arial; padding: 20px;'>";
echo "<h2>🚀 Đang tiến hành Import Dữ liệu N-N (Database Seeding)...</h2>";

// ... (Phần code bên dưới giữ nguyên) ...

require_once 'classes/database.php';
$db = Database::getInstance();

echo "<div style='font-family: Arial; padding: 20px;'>";
echo "<h2>🚀 Đang tiến hành Import Dữ liệu N-N (Database Seeding)...</h2>";

try {
    // 1. Lấy tất cả các ID chương trình hiện có
    $all_programs = $db->fetchAll("SELECT id, code FROM programs");
    
    if (empty($all_programs)) {
        die("<h3 style='color: red;'>❌ Lỗi: Chưa có Chương trình đào tạo nào! Hãy tạo các ngành QHQ trước.</h3>");
    }

    // Lấy ID của toàn bộ 14 ngành (để gán môn chung)
    $all_program_ids = array_column($all_programs, 'id');
    
    // Tìm ID của ngành Hệ thống thông tin quản lý - QHQ03 (để gán môn chuyên ngành)
    $mis_program_id = null;
    foreach ($all_programs as $p) {
        if ($p['code'] === 'QHQ03') {
            $mis_program_id = $p['id'];
            break;
        }
    }

    if (!$mis_program_id) {
        die("<h3 style='color: red;'>❌ Lỗi: Không tìm thấy ngành QHQ03 (MIS) trong database.</h3>");
    }

    // 2. Mảng dữ liệu cấu trúc mới: [Mã, Tên, Tín chỉ, Là_Môn_Chung]
    $subjects_data = [
        // CÁC MÔN CHUNG TOÀN TRƯỜNG (is_common = true) -> Học tất cả các ngành
        ['FLF1108', 'Tiếng Anh B2', 5, true],
        ['MAT1092', 'Toán cao cấp', 4, true],
        ['MAT1004', 'Lí thuyết xác suất và thống kê toán', 3, true],
        ['PES1003', 'GDTC - Giáo dục thể chất cơ bản', 1, true],
        ['PES1130', 'Võ cổ truyền 1', 1, true],
        ['PES1020', 'GDTC - Bóng rổ 1', 1, true],
        ['PES1025', 'GDTC - Bóng đá 1', 1, true],
        ['PHI1006', 'Triết học Mác – Lênin', 3, true],
        ['PEC1008', 'Kinh tế chính trị Mác – Lênin', 2, true],
        ['PSY1050', 'Tâm lí học đại cương', 2, true],
        ['THL1057', 'Nhà nước và Pháp luật đại cương', 2, true],
        ['PHI1002', 'Chủ nghĩa xã hội khoa học', 2, true],
        ['HIS1001', 'Lịch sử Đảng Cộng sản Việt Nam', 2, true],
        ['CME1001', 'Giáo dục quốc phòng – an ninh', 8, true],
        ['POL1001', 'Tư tưởng Hồ Chí Minh', 2, true],
        ['SOC1050', 'Xã hội học đại cương', 2, true],

        // CÁC MÔN CHUYÊN NGÀNH HOẶC KHỐI NGÀNH (is_common = false) -> Chỉ gán cho QHQ03
        ['INE1050', 'Kinh tế vi mô', 3, false],
        ['INS1051', 'Nhập môn Hệ thống thông tin quản lí', 2, false],
        ['INS1073', 'Tin học cơ sở', 3, false],
        ['ISV1020', 'Kĩ năng bổ trợ 1', 1, false],
        ['INE1051', 'Kinh tế vĩ mô', 3, false],
        ['INS2020', 'Lập trình 1', 3, false],
        ['INS2111', 'Tổ chức và quản trị kinh doanh', 3, false],
        ['ISV1023', 'Kĩ năng bổ trợ 2', 1, false],
        ['INS1077', 'Các nguyên lý về mạng máy tính', 3, false],
        ['INS2037', 'Hệ thống thông tin và các quy trình kinh doanh', 3, false],
        ['INS2080', 'Cơ sở dữ liệu', 3, false],
        ['INS3050', 'Cấu trúc dữ liệu và giải thuật', 3, false],
        ['INS3254', 'Nhập môn Khoa học dữ liệu', 3, false],
        ['INS2051', 'Các phương pháp định lượng trong quản lí', 3, false],
        ['INS3044', 'Quản trị dự án công nghệ thông tin', 3, false],
        ['INS3080', 'Trí tuệ nhân tạo', 3, false],
        ['INS2023', 'Quản trị hoạt động', 3, false],
        ['INS2058', 'Quyền sở hữu trí tuệ', 3, false],
        ['INS2060', 'Đổi mới công nghệ thông tin và kinh doanh', 3, false],
        ['INS2098', 'Nguyên lí kế toán', 3, false],
        ['INS2112', 'Thiết kế và quản lí Web', 3, false],
        ['INS3035', 'Lập trình Java', 3, false],
        ['INS3056', 'Mô hình hóa và thiết kế các hệ thống thông tin', 3, false],
        ['INS3061', 'Các hệ thống thông tin doanh nghiệp', 3, false],
        ['INS3062', 'Các nguyên lí an toàn thông tin', 3, false],
        ['INS3212', 'Blockchain và tiền kĩ thuật số', 3, false],
        ['INS1076', 'Phương pháp nghiên cứu cho Khoa học tự nhiên và Công nghệ', 2, false],
        ['INS2059', 'Lãnh đạo và xây dựng đội ngũ', 2, false],
        ['INS2065', 'Các công nghệ dựa trên nền công nghệ thông tin', 2, false],
        ['INS2097', 'Môi trường xã hội, đạo đức, pháp lí trong kinh doanh', 2, false],
        ['INS3064', 'Thiết kế đa phương tiện và phát triển Web', 3, false],
        ['INS3069', 'Các hệ hỗ trợ ra quyết định', 3, false],
        ['INS3281', 'Dự án I', 3, false],
        ['ISV1024', 'Kĩ năng bổ trợ 3', 1, false],
        ['INS3057', 'Lập kế hoạch và hạ tầng công nghệ thông tin', 3, false],
        ['INS3060', 'Phát triển cơ sở dữ liệu nâng cao', 3, false],
        ['INS3066', 'Các giải pháp kinh doanh cho doanh nghiệp', 3, false],
        ['INS3067', 'Các quy trình và công nghệ ngân hàng bán lẻ', 3, false],
        ['INS3068', 'Các quy trình và công nghệ thanh toán điện tử', 3, false],
        ['INS3070', 'Quản lí các hệ thống thông tin', 3, false],
        ['INS3240', 'Phân tích quy trình kinh doanh', 3, false],
        ['INS3009', 'Khởi nghiệp', 3, false],
        ['INS3045', 'An ninh mạng', 3, false],
        ['INS3266', 'Hệ thống hoạch định nguồn lực doanh nghiệp', 3, false],
        ['INS3267', 'Kinh doanh thông minh và kho dữ liệu', 3, false],
        ['INS4034', 'Chuyển đổi số', 3, false],
        ['INS4036', 'Thực tập thực tế', 5, false],
        ['INS2100', 'Quản trị chiến lược', 3, false],
        ['INS3282', 'Dự án II', 2, false],
        ['INS4011', 'Khóa luận tốt nghiệp', 5, false],
    ];

    $count_subjects = 0;
    $count_mappings = 0;
    
    foreach ($subjects_data as $sub) {
        $code = $sub[0];
        $name = $sub[1];
        $credits = $sub[2];
        $is_common = $sub[3];

        // Thêm môn học vào bảng subjects
        $check = $db->query("SELECT id FROM subjects WHERE code = ?", [$code])->fetch();
        if (!$check) {
            $db->query("INSERT INTO subjects (code, name, credits) VALUES (?, ?, ?)", [$code, $name, $credits]);
            $subject_id = $db->getLastInsertId();
            $count_subjects++;
            
            // Xử lý Ánh xạ (Mapping) N-N
            $target_programs = $is_common ? $all_program_ids : [$mis_program_id];
            
            foreach ($target_programs as $prog_id) {
                // Kiểm tra xem mapping đã tồn tại chưa
                $map_check = $db->query("SELECT id FROM subject_program_mapping WHERE subject_id = ? AND program_id = ?", [$subject_id, $prog_id])->fetch();
                if (!$map_check) {
                    $db->query("INSERT INTO subject_program_mapping (subject_id, program_id) VALUES (?, ?)", [$subject_id, $prog_id]);
                    $count_mappings++;
                }
            }
        }
    }

    echo "<h3 style='color: green;'>🎉 Import thành công!</h3>";
    echo "<ul>";
    echo "<li>Đã thêm <strong>$count_subjects</strong> học phần mới.</li>";
    echo "<li>Đã tạo <strong>$count_mappings</strong> liên kết ngành - môn học (Đã phân bổ đúng môn chung/môn riêng).</li>";
    echo "</ul>";
    echo "<a href='subjects/index.php' class='btn' style='padding: 10px 20px; background: #0d6efd; color: white; text-decoration: none; border-radius: 5px; margin-top: 20px; display: inline-block;'>Đến trang Quản lý Môn học</a>";

} catch (PDOException $e) {
    echo "<h3 style='color: red;'>❌ Lỗi Database: " . $e->getMessage() . "</h3>";
}
echo "</div>";
?>