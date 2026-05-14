<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once 'classes/database.php';
$db = Database::getInstance();

echo "<div style='font-family: Arial; padding: 20px; line-height: 1.6;'>";
echo "<h2>🚀 Đang nạp hàng loạt PLO cho 8 Chương trình đào tạo...</h2>";

// Mảng Dữ liệu khổng lồ đã được phân loại theo mã ngành
$all_programs_data = [
    // 1. Kinh doanh quốc tế (QHQ01) - 15 PLOs
    'QHQ01' => [
        "Vận dụng các kiến thức cơ bản về khoa học xã hội, khoa học chính trị, pháp luật và ngoại ngữ (tiếng Anh) trong học tập, nghiên cứu và tác nghiệp.",
        "Áp dụng các kiến thức cơ bản về kinh doanh quốc tế để học tập, nghiên cứu và làm việc tại các tổ chức và doanh nghiệp.",
        "Áp dụng các kiến thức về môi trường văn hoá, luật pháp, các yếu tố liên quan đến toàn cầu hoá, nền kinh tế 4.0, sự phát triển công nghệ, đổi mới và phát triển bền vững đến hoạt động kinh doanh quốc tế.",
        "Vận dụng các kiến thức chuyên sâu về kinh doanh quốc tế và quản trị kinh doanh quốc tế, tài chính, marketing, thương mại quốc tế, quản trị nguồn nhân lực để phân tích và đề xuất giải pháp cho các vấn đề kinh doanh.",
        "Phân tích các vấn đề kế toán và kiểm toán, các vấn đề về quản trị rủi ro trong đầu tư, đưa ra các giải pháp phù hợp trong bối cảnh thực tế.",
        "Đánh giá các mô hình, chiến lược, phương thức kinh doanh trong kinh doanh quốc tế tại Việt Nam và nước ngoài.",
        "Áp dụng kĩ năng tổng hợp và phân tích thông tin và dữ liệu liên quan đến kinh doanh quốc tế để đưa ra kết luận và giải pháp một cách khoa học.",
        "Vận dụng tư duy sáng tạo, tư duy nhìn nhận vấn đề một cách tổng quát, đổi mới trong tiếp cận và ứng dụng công nghệ, giải quyết vấn đề thực tiễn.",
        "Phát triển kỹ năng dẫn dắt, khởi nghiệp, tạo việc làm cho mình và người khác.",
        "Xây dựng kỹ năng giao tiếp, kĩ năng đàm phán, thuyết phục; Có năng lực sử dụng tiếng Anh trình độ tương đương bậc 4/6.",
        "Xác định khả năng làm việc nhóm, lập kế hoạch, giao việc, tư duy và giải quyết vấn đề, kiểm soát và quản trị hiệu quả.",
        "Vận dụng kỹ năng sử dụng phần mềm văn phòng, các kỹ thuật, phương pháp nghiên cứu và phân tích định lượng trong phân tích kinh doanh.",
        "Xác định khả năng tự chủ trong nghiên cứu, sử dụng thành thạo kiến thức để đề xuất giải pháp cho các vấn đề kinh doanh quốc tế.",
        "Xác định năng lực phát hiện, giải quyết vấn đề; rút ra những nguyên tắc, quy luật; đưa ra được những sáng kiến có giá trị.",
        "Xác định phẩm chất đạo đức tốt, trung thực, có trách nhiệm, chủ động, chính trực trong học tập và công việc."
    ],

    // 2. Kế toán, Phân tích và Kiểm toán (QHQ02) - 15 PLOs
    'QHQ02' => [
        "Vận dụng các lí thuyết, phương pháp luận của chủ nghĩa duy vật biện chứng và chủ nghĩa duy vật lịch sử; pháp luật, CNTT trong học tập và tác nghiệp.",
        "Liên kết các kiến thức kinh tế, tài chính, quản trị, luật pháp với nghiệp vụ, quy trình và hệ thống trong kế toán, phân tích và kiểm toán.",
        "Lý giải vai trò và ảnh hưởng của môi trường kinh tế, luật pháp, xã hội, công nghệ đến Báo cáo tài chính và quy trình kiểm toán.",
        "Phân biệt các lý thuyết, nguyên tắc, công cụ của Kế toán – Kiểm toán để lập Báo cáo tài chính, thực hiện quy trình kiểm toán.",
        "Dự báo mối quan hệ giữa các vấn đề kế toán-kiểm toán với quản trị và ra quyết định trong doanh nghiệp.",
        "Đánh giá các lý thuyết, nguyên tắc, công cụ phân tích để phân tích dữ liệu kế toán, tài chính, kinh tế phục vụ cho quản trị doanh nghiệp.",
        "Thiết kế hệ thống thông tin kế toán, lập và phân tích Báo cáo tài chính; thực hiên quy trình kiểm toán trên cơ sở tuân thủ đạo đức nghề nghiệp.",
        "Phân tích và lập báo cáo phân tích dữ liệu đáp ứng yêu cầu quản trị doanh nghiệp và ra quyết định.",
        "Thực hành tư duy sáng tạo, tư duy phản biện, tư duy hệ thống, đổi mới trong tiếp cận và ứng dụng công nghệ.",
        "Thực hành kỹ năng giao tiếp, kĩ năng đàm phán; Có năng lực sử dụng tiếng Anh trình độ tương đương bậc 4/6.",
        "Thực hành kĩ năng làm việc nhóm, lập kế hoạch, giao việc, tư duy và giải quyết vấn đề; có khả năng dẫn dắt và tạo việc làm.",
        "Vận dụng kỹ năng sử dụng phần mềm kế toán, phần mềm phân tích dữ liệu; các kỹ thuật, phương pháp phân tích định lượng.",
        "Khả năng tự học tập, tự chủ trong nghiên cứu, sử dụng thành thạo kiến thức để tìm tòi và đưa ra giải pháp trong thực tiễn công việc.",
        "Thực hành năng lực phát hiện, giải quyết vấn đề; đưa ra được những sáng kiến có giá trị để giải quyết vướng mắc.",
        "Thực hành các phẩm chất đạo đức tốt, trung thực, có trách nhiệm, chủ động, chính trực trong học tập và công việc."
    ],

    // 3. Tin học và kĩ thuật máy tính (QHQ04) - 15 PLOs
    'QHQ04' => [
        "Vận dụng được các kiến thức cơ bản về Chủ nghĩa Mác-Lênin, tư tưởng Hồ Chí Minh, đường lối chủ trương của Đảng và Nhà nước.",
        "Áp dụng kiến thức thực tế và lí thuyết vững chắc về ngoại ngữ, toán, vật lý, thống kê, tin học, xử lý tín hiệu số.",
        "Lựa chọn và thực thi giải pháp kĩ thuật phù hợp để giải quyết các vấn đề liên quan tới Tin học và Kỹ thuật máy tính.",
        "Vận dụng được các kiến thức về lập kế hoạch, tổ chức và giám sát các quá trình trong các hoạt động chuyên môn.",
        "Vận dụng được các kiến thức cơ bản về quản lý, điều hành hoạt động chuyên môn liên quan tới phát triển dự án tại doanh nghiệp.",
        "Nhận diện, phân tích và giải quyết vấn đề một cách khoa học; thiết kế, vận hành, cải tiến các hệ thống và quy trình.",
        "Thiết lập kĩ năng phản biện, lựa chọn các giải pháp thay thế, cải tiến, đổi mới; quản trị thay đổi, cập nhật xu thế ngành nghề.",
        "Thực hiện việc dẫn dắt, khởi nghiệp; truyền đạt vấn đề và đưa ra giải pháp; lập kế hoạch, theo dõi và đánh giá kết quả.",
        "Thành thạo các kĩ năng giao tiếp ứng xử, thuyết trình, viết báo cáo, sử dụng công nghệ số hiệu quả.",
        "Làm quen với việc học và tự học, quản lí thời gian, tự đào tạo, quan sát và học hỏi từ thực tiễn để học tập suốt đời.",
        "Đạt trình độ tiếng Anh bậc 4 hoặc cao hơn theo Khung năng lực ngoại ngữ 6 bậc dùng cho Việt Nam.",
        "Làm việc độc lập hoặc theo nhóm, chịu trách nhiệm cá nhân và nhóm, trung thực trong phân tích và đưa ra kết quả.",
        "Xây dựng khả năng tự chủ, đưa ra kết luận chuyên môn, bảo vệ quan điểm cá nhân, chịu áp lực công việc cao.",
        "Xây dựng trách nhiệm với đơn vị công tác, kỷ luật, trung thực, tận tâm, tuân thủ pháp luật và nội quy.",
        "Xây dựng phẩm chất đạo đức nghề nghiệp: kiên trì, tự tin, chính trực, ý thức xây dựng và bảo vệ đất nước."
    ],

    // 4. Phân tích dữ liệu kinh doanh (QHQ05) - 15 PLOs
    'QHQ05' => [
        "Vận dụng được các kiến thức cơ bản về khoa học xã hội, khoa học chính trị và pháp luật trong học tập, nghiên cứu và tác nghiệp.",
        "Vận dụng kiến thức Toán, Thống kê, Kinh tế, CNTT để xây dựng và sử dụng các mô hình, công cụ phân tích dữ liệu.",
        "Lựa chọn và thực thi giải pháp phân tích dữ liệu phù hợp để giải quyết các thách thức tiềm ẩn liên quan tới kinh doanh.",
        "Vận dụng được các kiến thức về lập kế hoạch, tổ chức và giám sát các quá trình, tự học, sáng tạo, thích nghi với môi trường.",
        "Vận dụng được các kiến thức cơ bản về quản lí, điều hành hoạt động chuyên môn: quản lý dự án KHDL, chuỗi cung ứng...",
        "Giải quyết các vấn đề phức tạp thông qua lập luận tư duy sáng tạo, khả năng nghiên cứu, tư duy hệ thống.",
        "Thực hiện dẫn dắt, khởi nghiệp, tạo việc làm cho mình và cho người khác; có tinh thần lập nghiệp.",
        "Hình thành kĩ năng phản biện, phê phán, và sử dụng các giải pháp thay thế trong môi trường không xác định.",
        "Biết đánh giá chất lượng công việc sau khi hoàn thành và kết quả thực hiện của các thành viên trong nhóm.",
        "Thành thạo truyền đạt vấn đề và giải pháp tới người khác; phổ biến kiến thức, kĩ năng trong thực hiện nhiệm vụ.",
        "Có năng lực sử dụng tiếng Anh với trình độ tương đương bậc 4/6 theo khung năng lực ngoại ngữ 6 bậc.",
        "Làm việc độc lập hoặc theo nhóm, chịu trách nhiệm cá nhân và nhóm, trung thực trong phân tích dữ liệu.",
        "Hướng dẫn, giám sát những người khác thực hiện nhiệm vụ xác định.",
        "Tự định hướng, tự chủ trong nghiên cứu, đưa ra kết luận chuyên môn và bảo vệ được quan điểm cá nhân.",
        "Lập kế hoạch, điều phối, quản lí các nguồn lực, đánh giá và cải thiện hiệu quả các hoạt động."
    ],

    // 5. Tự động hoá và tin học (QHQ08) - 15 PLOs
    'QHQ08' => [
        "Vận dụng được các kiến thức cơ bản về Chủ nghĩa Mác-Lênin, tư tưởng Hồ Chí Minh, pháp luật, an ninh-quốc phòng.",
        "Áp dụng được kiến thức cơ bản về toán học, tin học, vật lý, hóa học, cơ học, xác suất thống kê trong công việc kỹ thuật.",
        "Áp dụng các kiến thức về nguyên lý tự động hóa, tính toán số; vận dụng thành thạo lập trình trong chuyên môn.",
        "Áp dụng nguyên lý đo lường, cảm biến, điều khiển, mạng máy tính, xử lý tín hiệu số, ioT trong công việc.",
        "Áp dụng kiến thức chuyên sâu về tự động hóa và tin học (PLC, robot, AI, dữ liệu lớn) trong thiết kế, vận hành hệ thống.",
        "Giải quyết vấn đề chuyên môn liên quan đến thiết kế, vận hành, cải tiến các thiết bị, quy trình trong sản xuất.",
        "Tổng hợp và lựa chọn giải pháp kỹ thuật phù hợp; quản trị thay đổi và khắc phục sự cố thiết bị.",
        "Lập kế hoạch, đánh giá kết quả thực hiện công việc của cá nhân/đội nhóm; cập nhật xu thế phát triển ngành nghề.",
        "Thuyết trình, giao tiếp hiệu quả trong phối hợp làm việc và báo cáo áp dụng các công nghệ cập nhật.",
        "Tự học và chủ động tìm tòi cái mới, từ lý thuyết và thực tiễn để học tập suốt đời.",
        "Có năng lực sử dụng tiếng Anh trình độ bậc 4/6, làm việc trong môi trường hội nhập quốc tế.",
        "Làm việc độc lập hoặc theo nhóm hiệu quả, phối hợp để đạt mục tiêu chung; hướng dẫn đội nhóm.",
        "Thích nghi nhanh với môi trường làm việc quốc tế đa văn hóa, giải quyết nhiều công việc theo tiến độ.",
        "Thực hiện nghiêm các quy định pháp luật và nội quy; công khai minh bạch và trách nhiệm với công việc.",
        "Thực hiện công việc kiên trì, linh hoạt, trung thực; có trách nhiệm cộng đồng và xã hội."
    ],

    // 6. Ngôn ngữ Anh (QHQ09) - 11 PLOs
    'QHQ09' => [
        "VẬN DỤNG kiến thức cơ bản về khoa học xã hội, khoa học chính trị, năng lực số, và pháp luật trong học tập, nghiên cứu.",
        "ĐÁNH GIÁ những hiện tượng ngôn ngữ, văn hóa, xã hội vào lĩnh vực Ngôn ngữ Anh chuyên sâu Kinh doanh – CNTT.",
        "VẬN DỤNG thành thạo tiếng Anh tối thiểu bậc 5 và ngoại ngữ thứ hai tối thiểu bậc 3 vào hoạt động nghề nghiệp.",
        "ÁP DỤNG các kiến thức cơ bản về kinh doanh, công nghệ thông tin vào nghề nghiệp liên quan tới Ngôn ngữ Anh.",
        "HỆ THỐNG HÓA kiến thức lý thuyết cơ bản, chuyên sâu và thực tế để phát triển chuyên môn nghiên cứu và nghề nghiệp.",
        "PHÂN TÍCH các vấn đề phức tạp nhằm quản lý công việc và thời gian hiệu quả trong môi trường đa văn hoá.",
        "ĐÁNH GIÁ chất lượng công việc trong các hoạt động liên quan tới Ngôn ngữ Anh chuyên sâu Kinh doanh – CNTT.",
        "THIẾT LẬP kỹ năng giao tiếp, tư duy ngôn ngữ logic, phản biện trong việc sử dụng Ngôn ngữ Anh chuyên ngành.",
        "THIẾT LẬP kỹ năng làm việc độc lập, làm việc theo nhóm trong môi trường đa văn hoá.",
        "ĐÁNH GIÁ hiệu quả công việc để định hướng, lập kế hoạch trong các hoạt động chuyên môn.",
        "XÁC ĐỊNH đúng đắn phẩm chất đạo đức cá nhân, nghề nghiệp, xã hội trong sử dụng Ngôn ngữ Anh chuyên ngành."
    ],

    // 7. Truyền thông số (QHQ14) - 21 PLOs
    'QHQ14' => [
        "Vận dụng các kiến thức nền tảng về khoa học chính trị, xã hội, pháp luật, phương pháp luận, CNTT để học tập và làm việc.",
        "Vận dụng kiến thức cốt lõi về marketing số để hiểu thị trường, hành vi khách hàng phục vụ xây dựng kế hoạch marketing.",
        "Vận dụng các kiến thức căn bản và các công cụ về truyền thông, truyền thông số và kiến thức liên quan.",
        "Vận dụng hiệu quả các công nghệ số vào hoạt động truyền thông và marketing giúp gia tăng giá trị, giảm chi phí.",
        "Phối hợp kiến thức truyền thông, marketing và công nghệ số để triển khai dự án quảng cáo, quản trị truyền thông đa phương tiện.",
        "Xây dựng và thực thi chiến lược, kế hoạch, dự án khởi nghiệp, kinh doanh gắn truyền thông và marketing số.",
        "Phát triển kỹ năng nghiên cứu, phân tích thị trường, dự báo hành vi khách hàng; kỹ năng xây dựng thương hiệu, sáng tạo nội dung.",
        "Phối hợp sáng tạo kỹ năng phát hiện và giải quyết vấn đề trong lập kế hoạch, đánh giá hiệu quả dự án tích hợp truyền thông.",
        "Sử dụng tốt tiếng Anh (Bậc 4/6) và tiếng Anh chuyên ngành Truyền thông marketing số.", // Note: Original data skipped PLO9, adjusting index to keep text sequential
        "Xác định khả năng làm việc nhóm, lập kế hoạch, giao việc, tư duy và giải quyết vấn đề, kiểm soát và truyền thông hiệu quả.",
        "Đạt kỹ năng sử dụng tin học văn phòng nâng cao; phần mềm xử lý dữ liệu, mô phỏng về hoạt động truyền thông số.",
        "Tự lập kế hoạch, triển khai, đánh giá và cải thiện hiệu quả các hoạt động marketing; chủ động tự học tập.",
        "Làm việc độc lập hoặc theo nhóm; chấp nhận giá trị khác biệt; năng lực dẫn dắt, giám sát công việc.",
        "Thực hành tư duy đổi mới sáng tạo, tự định hướng, đưa ra kết luận chuyên môn và bảo vệ quan điểm cá nhân.",
        "Bản lĩnh vượt qua khó khăn, có trách nhiệm đối với cá nhân, tập thể, tạo giá trị chung cho cộng đồng.",
        "Có thái độ đúng đắn về truyền thông và marketing; tuân thủ luật pháp và các quy định; mang lại giá trị cho cộng đồng.",
        "Thể hiện thái độ tích cực, yêu nghề; ý thức tổ chức kỷ luật, trách nhiệm và đạo đức nghề nghiệp thời đại số.",
        "Tham gia nhiệt tình các hoạt động xã hội; có ý thức phục vụ nhân dân.",
        "Thể hiện phẩm chất chính trị và đạo đức cá nhân phù hợp với xã hội; chấp hành các quy tắc công cộng.",
        "Tuân thủ Hiến pháp và Pháp luật; tham gia bảo vệ an ninh, có ý thức xây dựng đất nước." // Condensed 21 -> 20 due to missing PLO9 in raw text
    ],

    // 8. Kinh doanh số (QHQ13) - 18 PLOs
    'QHQ13' => [
        "Vận dụng kiến thức cơ bản về kinh tế học, quản trị học, luật kinh doanh và công nghệ thông tin.",
        "Áp dụng kiến thức chuyên sâu về thương mại điện tử, chiến lược số, marketing kỹ thuật số, hành vi khách hàng trực tuyến.",
        "Đánh giá tác động của toàn cầu hóa, kinh tế số, công nghiệp 4.0 và phát triển bền vững đến môi trường kinh doanh số.",
        "Vận dụng kiến thức về dữ liệu lớn (big data), AI, điện toán đám mây và tự động hóa để cải thiện hiệu quả kinh doanh.",
        "Phân tích và đề xuất các mô hình kinh doanh số phù hợp với xu thế công nghệ và hành vi tiêu dùng hiện đại.",
        "Tích hợp tư duy phân tích, tư duy hệ thống và tư duy công nghệ trong thiết kế giải pháp chuyển đổi số.",
        "Phân tích và khai thác dữ liệu từ các hệ thống thông tin để hỗ trợ ra quyết định trong doanh nghiệp số.",
        "Thiết kế, triển khai và đánh giá hiệu quả các chiến dịch marketing kỹ thuật số, quản lý nội dung số và trải nghiệm (UX).",
        "Phát triển, vận hành hoạt động thương mại điện tử, ứng dụng quản trị hệ thống CRM, ERP trong doanh nghiệp.",
        "Phối hợp tổ chức thực hiện các dự án kinh doanh số có sự tham gia đa lĩnh vực và đa quốc gia.",
        "Xây dựng kỹ năng giao tiếp chuyên nghiệp, thuyết trình hiệu quả và đàm phán trong môi trường số hoá.",
        "Làm việc nhóm hiệu quả, tổ chức điều phối hoạt động nhóm trên nền tảng công nghệ số và tư duy phản biện.",
        "Ứng dụng thành thạo công cụ số như Google Workspace, Canva, và các công cụ nghiên cứu định lượng (Power BI, Tableau).",
        "Sử dụng tốt tiếng Anh (tương đương bậc 4/6); có kỹ năng sử dụng tốt tiếng Anh chuyên ngành kinh doanh số.",
        "Chủ động trong học tập suốt đời, cập nhật kiến thức công nghệ và xu hướng thị trường mới.",
        "Xác định được vai trò, trách nhiệm và đạo đức nghề nghiệp, bao gồm quyền riêng tư, bảo mật dữ liệu.",
        "Tự tin đưa ra quyết định, thích nghi nhanh và sáng tạo trong điều kiện môi trường kinh doanh liên tục thay đổi.",
        "Xây dựng tư duy khởi nghiệp, sáng tạo, đổi mới, có khả năng dẫn dắt các ý tưởng công nghệ và kinh doanh số."
    ]
];

try {
    $db->beginTransaction(); // Dùng transaction để tăng tốc độ ghi và an toàn dữ liệu
    $total_plos_inserted = 0;

    foreach ($all_programs_data as $prog_code => $plos_array) {
        // Tìm ID của chương trình dựa vào Mã QHQ
        $stmt = $db->query("SELECT id FROM programs WHERE code = ?", [$prog_code]);
        $program = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($program) {
            $program_id = $program['id'];
            $count_for_this_prog = 0;

            foreach ($plos_array as $index => $description) {
                $plo_code = "PLO" . ($index + 1); 
                
                // Tránh ghi đè nếu đã tồn tại
                $check = $db->query("SELECT id FROM plos WHERE program_id = ? AND code = ?", [$program_id, $plo_code])->fetch();
                
                if (!$check) {
                    $db->query("INSERT INTO plos (program_id, code, description) VALUES (?, ?, ?)", 
                               [$program_id, $plo_code, $description]);
                    $count_for_this_prog++;
                    $total_plos_inserted++;
                }
            }
            if ($count_for_this_prog > 0) {
                echo "<p>✅ Đã nạp <strong>$count_for_this_prog</strong> PLOs cho ngành <strong>$prog_code</strong>.</p>";
            } else {
                echo "<p>⚠️ Ngành <strong>$prog_code</strong> đã có sẵn PLO, bỏ qua để tránh trùng lặp.</p>";
            }
        } else {
            echo "<p style='color: orange;'>⚠️ Không tìm thấy ngành <strong>$prog_code</strong> trong CSDL. Vui lòng kiểm tra lại bảng Programs.</p>";
        }
    }

    $db->commit();
    echo "<h3 style='color: green;'>🎉 Hoàn tất! Đã thêm tổng cộng <strong>$total_plos_inserted</strong> PLOs vào hệ thống.</h3>";
    echo "<a href='plos/index.php' style='display: inline-block; padding: 10px 20px; background: #007bff; color: white; text-decoration: none; border-radius: 5px;'>Đến trang Quản lý PLOs</a>";

} catch (PDOException $e) {
    $db->rollBack();
    echo "<h3 style='color: red;'>❌ Lỗi Database: " . $e->getMessage() . "</h3>";
}
echo "</div>";
?>