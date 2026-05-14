<?php
// Bật báo lỗi để kiểm soát quá trình import
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once 'classes/database.php';
$db = Database::getInstance();

echo "<div style='font-family: Arial; padding: 20px; line-height: 1.6;'>";
echo "<h2>🚀 Đang nạp Chuẩn đầu ra (PLO) cho ngành MIS...</h2>";

try {
    // 1. Tìm ID của ngành QHQ03 (Hệ thống thông tin quản lý)
    $program_code = 'QHQ03';
    $stmt = $db->query("SELECT id FROM programs WHERE code = ?", [$program_code]);
    $program = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$program) {
        die("<h3 style='color: red;'>❌ Lỗi: Không tìm thấy mã ngành $program_code trong database. Hãy đảm bảo cậu đã tạo ngành này ở phần Programs.</h3>");
    }

    $program_id = $program['id'];

    // 2. Mảng dữ liệu Chuẩn đầu ra đã được làm sạch
    $plos_data = [
        "Vận dụng được các kiến thức cơ bản về Chủ nghĩa Mác-Lênin, tư tưởng Hồ Chí Minh, đường lối chủ trương của Đảng và Nhà nước, về pháp luật, an ninh-quốc phòng, giáo dục thể chất trong nghề nghiệp và cuộc sống.",
        "Áp dụng được kiến thức nền tảng về toán học, lí thuyết xác suất và thống kê toán, tin học và lập trình ứng dụng, tâm lí học, tiếng Anh, kinh tế, kinh doanh, khởi nghiệp trong hoạt động chuyên môn.",
        "Vận dụng được các các kiến thức nền tảng về hệ thống thông tin quản lý như hệ cơ sở dữ liệu, các phương pháp định lượng trong quản lí, tạo lập và thiết kế web, tổ chức và quản trị kinh doanh, hệ thống thông tin và các quy trình kinh doanh vào việc cải tiến quản lí, điều hành các hoạt động sản xuất-kinh doanh.",
        "Áp dụng được vào thực tế các kiến thức chuyên sâu về mô hình hóa, thiết kế và quản lí các hệ thống thông tin, lập trình nâng cao, các nguyên lí an toàn thông tin, quản trị dự án CNTT, thiết kế đa phương tiện và phát triển web.",
        "Kết nối được các kiển thức chuyên sâu về các giải pháp kinh doanh và hệ thống thông tin cho doanh nghiệp, phân tích kinh doanh hỗ trợ ra quyết định và các kiến thức chuyên sâu theo lựa chọn về quản lí thông tin để giải quyết có hiệu quả các bài toán thực tế.",
        "Thực hiện được việc nhận diện, phân tích và giải quyết vấn đề một cách khoa học và có khả năng thiết kế, vận hành, cải tiến các hệ thống và quy trình trong lĩnh vực hệ thống thông tin quản lý.",
        "Có khả năng phản biện, phê phán và thực hiện các giải pháp thay thế, khả năng cải tiến, đổi mới trong hoạt động nghề nghiệp, quản trị thay đổi và dự đoán xu thế phát triển ngành nghề.",
        "Có khả năng dẫn dắt, khởi nghiệp, tạo việc làm, làm thành thạo việc truyền đạt vấn đề và đưa ra giải pháp thực hiện, có khả năng lập kế hoạch, theo dõi và đánh giá kết quả thực hiện công việc.",
        "Thực hiện thành thạo các kĩ năng cần thiết như kĩ năng giao tiếp ứng xử, kĩ năng thuyết trình, kĩ năng viết báo cáo và văn bản, kĩ năng sử dụng công nghệ số hiệu quả.",
        "Làm quen với việc học và tự học một cách hiệu quả, có khả năng quản lí thời gian và tự đào tạo, khả năng quan sát và học hỏi từ thực tiễn để học tập suốt đời.",
        "Có năng lực sử dụng tiếng Anh trình độ tương đương bậc 4/6, có khả năng sử dụng tiếng Anh để làm việc trong các tổ chức, doanh nghiệp có yếu tố quốc tế.",
        "Có năng lực làm việc độc lập hoặc theo nhóm trong điều kiện thay đổi, chịu trách nhiệm cá nhân và trách nhiệm đối với nhóm, có tinh thần chủ động và sáng kiến.",
        "Có năng lực tự chủ, tự định hướng, đưa ra kết luận chuyên môn, thích nghi với môi trường áp lực cao, có năng lực hướng dẫn, giám sát người khác.",
        "Có trách nhiệm với đơn vị công tác, ý thức tổ chức kỷ luật, trung thực, tận tâm, công bằng, minh bạch, tuân thủ pháp luật và nội quy đơn vị.",
        "Có phẩm chất đạo đức cá nhân và nghề nghiệp, chính trực, có trách nhiệm cộng đồng và xã hội, lập trường chính trị vững vàng, ý thức xây dựng và bảo vệ đất nước."
    ];

    $count = 0;
    foreach ($plos_data as $index => $description) {
        $plo_code = "PLO" . ($index + 1); // Tạo mã PLO1, PLO2...
        
        // Kiểm tra xem PLO này đã tồn tại cho ngành này chưa
        $check = $db->query("SELECT id FROM plos WHERE program_id = ? AND code = ?", [$program_id, $plo_code])->fetch();
        
        if (!$check) {
            $db->query("INSERT INTO plos (program_id, code, description) VALUES (?, ?, ?)", 
                       [$program_id, $plo_code, $description]);
            $count++;
        }
    }

    echo "<h3 style='color: green;'>🎉 Import thành công!</h3>";
    echo "<p>Đã thêm <strong>$count</strong> Chuẩn đầu ra (PLOs) mới vào ngành <strong>$program_code</strong>.</p>";
    echo "<a href='plos/index.php' style='display: inline-block; padding: 10px 20px; background: #007bff; color: white; text-decoration: none; border-radius: 5px;'>Đến trang Quản lý PLOs</a>";

} catch (PDOException $e) {
    echo "<h3 style='color: red;'>❌ Lỗi Database: " . $e->getMessage() . "</h3>";
}
echo "</div>";
?>