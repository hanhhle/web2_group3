<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once 'classes/database.php';
$db = Database::getInstance();

echo "<div style='font-family: Arial; padding: 20px; line-height: 1.6;'>";
echo "<h2>🚀 Đang nạp hàng loạt Môn học cho 5 Ngành đào tạo...</h2>";

// MẢNG DỮ LIỆU ĐÃ ĐƯỢC LÀM SẠCH (Cắt bỏ các ký tự thừa như *, **, (E))
$all_programs_subjects = [
    // 1. Kế toán phân tích và kiểm toán (QHQ02)
    'QHQ02' => [
        ['PHI1006', 'Triết học Mác-Lênin', 3], ['PEC1008', 'Kinh tế chính trị Mác-Lênin', 2], ['PHI1002', 'Chủ nghĩa xã hội khoa học', 2],
        ['HIS1001', 'Lịch sử Đảng cộng sản Việt Nam', 2], ['POL1001', 'Tư tưởng Hồ Chí Minh', 2], ['INS1073', 'Tin học cơ sở', 3],
        ['THL1057', 'Nhà nước và Pháp luật đại cương', 2], ['FLF1108', 'Tiếng Anh B2', 5], ['ISV1020', 'Kỹ năng bổ trợ 1', 1],
        ['ISV1023', 'Kỹ năng bổ trợ 2', 1], ['ISV1024', 'Kỹ năng bổ trợ 3', 1], ['CME1001', 'Giáo dục quốc phòng - an ninh', 8],
        ['PES1001', 'Giáo dục thể chất', 4], ['INS1082', 'Nhập môn ngành kế toán', 2], ['INS1016', 'Tiếng Anh chuyên ngành 1', 4],
        ['MAT1092', 'Toán cao cấp', 4], ['MAT1004', 'Lý thuyết xác suất và thống kê toán', 3], ['MAT1005', 'Toán kinh tế', 3],
        ['INE1050', 'Kinh tế vi mô', 3], ['INE1051', 'Kinh tế vĩ mô', 3], ['INS1052', 'Phương pháp luận nghiên cứu khoa học', 2],
        ['INS2111', 'Tổ chức và quản trị kinh doanh', 3], ['INS2009', 'Nguyên lí Kế toán', 4], ['INS2003', 'Nguyên lí Marketing', 3],
        ['INS2004', 'Thống kê kinh tế', 3], ['INS2015', 'Tài chính căn bản', 3], ['INS2011', 'Luật kinh tế', 3],
        ['INS2109', 'Kế toán quản trị', 3], ['INS3009', 'Khởi nghiệp', 3], ['INS2005', 'Kinh tế quốc tế', 2],
        ['INS2102', 'Tiền tệ, tín dụng, ngân hàng', 2], ['BSA1055', 'Văn hoá kinh doanh', 2], ['INS2097', 'Môi trường xã hội, đạo đức, pháp lí', 2],
        ['INS3273', 'Tài chính doanh nghiệp', 3], ['INS3251', 'Thuế', 3], ['INS3272', 'Kế toán tài chính 1', 3],
        ['INS3252', 'Kế toán tài chính 2', 3], ['INS3016', 'Thực hành kế toán trên máy tính', 3], ['INS3012', 'Kiểm toán căn bản', 3],
        ['INS3030', 'Phân tích báo cáo tài chính', 3], ['INS3254', 'Nhập môn Khoa học dữ liệu', 3], ['INE3009', 'Quản trị dự án quốc tế', 3],
        ['INS4032', 'Quản trị kinh doanh bền vững', 2], ['INS2105', 'Giao tiếp trong kinh doanh', 2], ['INS3031', 'Kế toán Việt Nam', 2],
        ['INS3025', 'Quân trị đổi mới', 2], ['SOC1050', 'Xã hội học đại cương', 2], ['PSY1050', 'Tâm lí học đại cương', 2],
        ['INS2104', 'Hệ thống thông tin kế toán', 3], ['INS3247', 'Phân tích hoạt động kinh doanh', 3], ['INS2016', 'Rủi ro và phân tích rủi ro', 3],
        ['FIB3005', 'Đầu tư và quản lý danh mục đầu tư', 3], ['INS3278', 'Công nghệ chuỗi khối cho dự án tài chính', 3], ['INS3013', 'Kiểm toán tài chính 1', 3],
        ['INS3014', 'Kiểm toán tài chính 2', 3], ['INS3271', 'Kế toán quốc tế', 3], ['INS3284', 'Kiểm toán nội bộ', 3],
        ['INS3212', 'Blockchain và Tiền kĩ thuật số', 3], ['INS4036', 'Thực tập thực tế', 5], ['INS4011', 'Khoá luận tốt nghiệp', 5],
        ['INS4019', 'Quản trị hiệu quả hoạt động', 3], ['INS4035', 'Lập báo cáo tài chính', 2]
    ],

    // 2. Tin học và kỹ thuật máy tính (QHQ04)
    'QHQ04' => [
        ['PHI1006', 'Triết học Mác-Lênin', 3], ['PEC1008', 'Kinh tế chính trị Mác-Lênin', 2], ['PHI1002', 'Chủ nghĩa xã hội khoa học', 2],
        ['HIS1001', 'Lịch sử Đảng cộng sản Việt Nam', 2], ['POL1001', 'Tư tưởng Hồ Chí Minh', 2], ['FLF1108', 'Tiếng Anh B2', 5],
        ['INS1073', 'Tin học cơ sở', 3], ['THL1057', 'Nhà nước và Pháp luật đại cương', 2], ['ISV1020', 'Kỹ năng bổ trợ 1', 1],
        ['ISV1023', 'Kỹ năng bổ trợ 2', 1], ['ISV1024', 'Kỹ năng bổ trợ 3', 1], ['PES1001', 'Giáo dục thể chất', 4],
        ['CME1001', 'Giáo dục quốc phòng - an ninh', 8], ['INS1080', 'Tiếng Nga', 4], ['INS1193', 'Đại số và hình giải tích', 3],
        ['INS1194', 'Giải tích 1', 4], ['INS1195', 'Giải tích 2', 3], ['INS1083', 'Vật lí cho Tin học và Kĩ thuật máy tính', 4],
        ['INS1052', 'Nhập môn tin học và kĩ thuật máy tính', 2], ['INS1060', 'Logic toán và lí thuyết thuật toán', 3],
        ['INS1196', 'Lí thuyết xác suất và thống kê toán', 3], ['INS1189', 'Phương pháp số', 3], ['INS2071', 'Lí thuyết tín hiệu', 3],
        ['INS2020', 'Lập trình 1', 3], ['INS3050', 'Cấu trúc dữ liệu và giải thuật', 3], ['INS2073', 'Lập trình 2', 3],
        ['INS2074', 'Toán rời rạc', 3], ['INS2031', 'Kĩ thuật điện', 3], ['INS2075', 'Kĩ thuật điện tử', 3],
        ['INS2076', 'Hệ điều hành', 3], ['INS3274', 'Ngôn ngữ lập trình cho khoa học dữ liệu', 3], ['INS2080', 'Cơ sở dữ liệu', 3],
        ['INS2077', 'Kiến trúc máy tính', 2], ['INS2081', 'Hình họa và vẽ kĩ thuật', 2], ['INS2082', 'Nguyên lí điều khiển', 2],
        ['INS2097', 'Môi trường xã hội, đạo đức và pháp lí', 2], ['INS2079', 'Quyền sở hữu trí tuệ trong công nghệ', 2],
        ['INS3144', 'Xử lí tín hiệu số', 3], ['INS3254', 'Nhập môn Khoa học dữ liệu', 3], ['INS3179', 'Thiết kế mạch tích hợp số', 3],
        ['INS3108', 'Hệ thống vi xử lí', 3], ['INS3135', 'Mô phỏng thiết kế mạch', 3], ['INS3109', 'Mạng máy tính và viễn thông', 2],
        ['INS3141', 'Hệ thống truyền tin', 2], ['INS3181', 'Hệ thống nhúng và vi điều khiển', 2], ['INS3064', 'Thiết kế đa phương tiện và phát triển Web', 3],
        ['INS3009', 'Khởi nghiệp', 3], ['INS3157', 'An toàn thông tin', 2], ['INS3046', 'Học máy', 3], ['INS3080', 'Trí tuệ nhân tạo', 3],
        ['INS3125', 'Mạng cục bộ', 2], ['INS3119', 'Mô hình hóa', 2], ['INS3102', 'Cơ sở lí thuyết độ tin cậy', 2],
        ['INS3180', 'Đo lường và điều khiển bằng máy tính', 2], ['INS3117', 'Bộ nhớ máy tính', 2], ['INS3158', 'Truyền thông số và mã hóa', 2],
        ['INS3159', 'Công nghệ phần mềm', 2], ['INS3120', 'Kiểm thử và đảm bảo chất lượng phần mềm', 2], ['INS3155', 'Thị giác máy tính', 3],
        ['INS3118', 'Kĩ thuật đồ họa máy tính', 2], ['INS3182', 'Tính toán phân tán', 2], ['INS1076', 'Phương pháp nghiên cứu cho Khoa học tự nhiên', 2],
        ['INS2059', 'Lãnh đạo và xây dựng đội ngũ', 2], ['INS4036', 'Thực tập thực tế', 5], ['INS4014', 'Đồ án tốt nghiệp', 5]
    ],

    // 3. Phân tích dữ liệu kinh doanh (QHQ05)
    'QHQ05' => [
        ['PHI1006', 'Triết học Mác-Lênin', 3], ['PEC1008', 'Kinh tế chính trị Mác-Lênin', 2], ['PHI1002', 'Chủ nghĩa xã hội khoa học', 2],
        ['HIS1001', 'Lịch sử Đảng cộng sản Việt Nam', 2], ['POL1001', 'Tư tưởng Hồ Chí Minh', 2], ['FLF1108', 'Tiếng Anh B2', 5],
        ['INS1073', 'Tin học cơ sở', 3], ['THL1057', 'Nhà nước và Pháp luật đại cương', 2], ['ISV1020', 'Kỹ năng bổ trợ 1', 1],
        ['ISV1023', 'Kỹ năng bổ trợ 2', 1], ['ISV1024', 'Kỹ năng bổ trợ 3', 1], ['PES1001', 'Giáo dục thể chất', 4],
        ['CME1001', 'Giáo dục quốc phòng - an ninh', 8], ['INS1053', 'Nhập môn phân tích dữ liệu kinh doanh', 2],
        ['MAT1092', 'Toán cao cấp', 4], ['MAT1004', 'Lí thuyết xác suất và thống kê toán', 3], ['INS1076', 'Phương pháp nghiên cứu cho khoa học tự nhiên', 2],
        ['INS3009', 'Khởi nghiệp', 3], ['INE1050', 'Kinh tế vi mô', 3], ['INE1051', 'Kinh tế vĩ mô', 3],
        ['INS2111', 'Tổ chức và quản trị kinh doanh', 3], ['INS2015', 'Tài chính căn bản', 3], ['INS2003', 'Nguyên lí Marketing', 3],
        ['INS3078', 'Khoa học quản lí', 2], ['INS3274', 'Ngôn ngữ lập trình cho khoa học dữ liệu', 3], ['INS3080', 'Trí tuệ nhân tạo', 3],
        ['INS3254', 'Nhập môn khoa học dữ liệu', 3], ['INS3066', 'Các giải pháp kinh doanh cho doanh nghiệp', 3],
        ['INS3062', 'Các nguyên lí an toàn thông tin', 3], ['INS2080', 'Cơ sở dữ liệu', 3], ['INS2051', 'Các phương pháp định lượng trong quản lí', 3],
        ['INS2023', 'Quản trị hoạt động', 3], ['INS2058', 'Quyền sở hữu trí tuệ', 3], ['INS2112', 'Thiết kế và quản lí Web', 3],
        ['INS2037', 'Hệ thống thông tin và các quy trình kinh doanh', 3], ['INS3044', 'Quản trị dự án CNTT', 3],
        ['INS2060', 'Đổi mới công nghệ thông tin và kinh doanh', 3], ['INS2004', 'Thống kê kinh tế', 3], ['INS3280', 'Chuẩn bị dữ liệu và trực quan hoá', 3],
        ['INS3046', 'Học máy', 3], ['INS3286', 'Tối ưu hóa ứng dụng', 3], ['INS3049', 'Kinh tế lượng', 4],
        ['INS3050', 'Cấu trúc dữ liệu và giải thuật', 3], ['INS3008', 'Dự án', 3], ['INE3060', 'Thương mại điện tử', 3],
        ['INS3076', 'Phân tích dữ liệu lớn', 3], ['INS3061', 'Các hệ thống thông tin doanh nghiệp', 3], ['INS3021', 'Quản trị chuỗi cung ứng toàn cầu', 3],
        ['INS2101', 'Đại cương lãnh đạo trong tổ chức', 2], ['INS2097', 'Môi trường, xã hội, đạo đức và pháp lý', 2],
        ['PSY1050', 'Tâm lí học đại cương', 2], ['SOC1050', 'Xã hội học đại cương', 2], ['INS3155', 'Thị giác máy tính', 3],
        ['INS3277', 'Xử lý ngôn ngữ tự nhiên ứng dụng', 3], ['INS3257', 'Phân tích chuỗi thời gian', 3], ['INS3258', 'Xê-mi-na: Phân tích dữ liệu', 3],
        ['INS3278', 'Công nghệ chuỗi khối cho các dự án tài chính', 3], ['INS3259', 'Phân tích dữ liệu tài chính', 3],
        ['INS3260', 'Tính toán trong quản trị rủi ro', 3], ['INS3261', 'Xê-mi-na: Phân tích dữ liệu tài chính', 3],
        ['INS3041', 'Chiến lược Marketing', 3], ['INS3262', 'Phân tích dữ liệu Marketing', 3], ['INS3263', 'Phân tích quyết định Marketing', 3],
        ['INS3264', 'Xê-mi-na: Phân tích dữ liệu Marketing', 3], ['INS4036', 'Thực tập thực tế', 5], ['INS4011', 'Khóa luận tốt nghiệp', 5],
        ['INS4016', 'Phân tích dữ liệu nâng cao', 2], ['INS4037', 'Các chủ đề nâng cao trong khoa học dữ liệu', 3]
    ],

    // 4. Tự động hoá và tin học (QHQ08)
    'QHQ08' => [
        ['PHI1006', 'Triết học Mác-Lênin', 3], ['PEC1008', 'Kinh tế chính trị Mác-Lênin', 2], ['PHI1002', 'Chủ nghĩa xã hội khoa học', 2],
        ['HIS1001', 'Lịch sử Đảng Cộng sản Việt Nam', 2], ['POL1001', 'Tư tưởng Hồ Chí Minh', 2], ['THL1057', 'Nhà nước và pháp luật đại cương', 2],
        ['ISV1019', 'Tin học cơ sở', 3], ['FLF1108', 'Tiếng Anh B2', 5], ['PES1001', 'Giáo dục thể chất', 4],
        ['CME1001', 'Giáo dục quốc phòng - an ninh', 8], ['ISV1020', 'Kỹ năng bổ trợ 1', 1], ['ISV1023', 'Kỹ năng bổ trợ 2', 1],
        ['ISV1024', 'Kỹ năng bổ trợ 3', 1], ['ISV1002', 'Đại số và hình giải tích', 3], ['ISV1003', 'Giải tích 1', 3],
        ['ISV1004', 'Giải tích 2', 3], ['ISV1005', 'Vật lí đại cương', 3], ['ISV1022', 'Phương trình đạo hàm riêng', 3],
        ['ISV1026', 'Cơ học lý thuyết', 3], ['ISV1008', 'Phương trình vi phân', 3], ['ISV1018', 'Lí thuyết xác suất và thống kê', 3],
        ['ISV1027', 'Cơ học môi trường liên tục', 3], ['ISV1011', 'Nhập môn Tự động hóa và Tin học', 2], ['ISV2001', 'Phương pháp số', 3],
        ['ISV2002', 'Vật liệu tiên tiến', 3], ['ISV2003', 'Đàn hồi nhiệt', 3], ['ISV2004', 'Nguyên lý điều khiển tự động', 3],
        ['ISV2005', 'Lập trình 1', 3], ['ISV2006', 'Lập trình 2', 3], ['ISV3001', 'Kĩ thuật điện', 3],
        ['ISV3002', 'Kĩ thuật điện tử', 3], ['ISV3003', 'Vẽ kĩ thuật và CAD', 3], ['ISV3004', 'Trí tuệ nhân tạo', 3],
        ['ISV3005', 'Mạng máy tính', 3], ['ISV3016', 'Hệ thống tự động hóa số', 3], ['ISV3007', 'Các nguyên lí an toàn thông tin', 3],
        ['ISV1025', 'Phương pháp nghiên cứu cho Khoa học tự nhiên', 2], ['ISV3009', 'Khởi nghiệp', 3], ['ISV3010', 'Đồ án I', 3],
        ['ISV3015', 'Thực tập doanh nghiệp', 3], ['ISV3011', 'Linh kiện bán dẫn và vi mạch', 2], ['ISV3012', 'Đo lường và điều khiển bằng máy tính', 2],
        ['ISV3013', 'Kiến trúc máy tính và mạng truyền thông công nghiệp', 2], ['ISV2007', 'Quyền sở hữu trí tuệ', 2],
        ['ISV3014', 'Phát triển ứng dụng IoT', 2], ['ISV2020', 'Hệ điều hành thời gian thực', 2], ['ISV1021', 'Quản trị kinh doanh bền vững', 2],
        ['INS3144', 'Xử lí tín hiệu số', 3], ['INS3143', 'Kỹ thuật đo lường và cảm biến', 3], ['INS3135', 'Mô phỏng thiết kế mạch', 3],
        ['INS3146', 'Cơ sở công nghệ chế tạo máy', 3], ['INS3147', 'Mô hình hóa và mô phỏng hệ thống điều khiển', 2],
        ['INS3148', 'Vi xử lý và vi điều khiển', 3], ['INS3149', 'Tự động hóa quá trình sản xuất', 3], ['INS3150', 'Điều khiển PLC', 3],
        ['INS3151', 'Hệ thống điều khiển nhúng', 3], ['INS3152', 'Người máy', 3], ['INS3237', 'Động cơ và cơ sở truyền động điện', 3],
        ['INS3154', 'Đồ án II: Thiết kế hệ thống điều khiển', 3], ['INS3050', 'Cấu trúc dữ liệu và giải thuật', 3], ['INS2080', 'Cơ sở dữ liệu', 3],
        ['INS3056', 'Mô hình hóa và thiết kế các hệ thống thông tin', 3], ['INS3155', 'Thị giác máy tính', 3], ['INS3070', 'Quản lý các hệ thống thông tin', 3],
        ['INS3159', 'Công nghệ phần mềm', 2], ['INS3076', 'Phân tích dữ liệu lớn', 3], ['INS3034', 'Khung kiến trúc Dot Net', 3],
        ['INS3156', 'Đồ án III: Thiết kế hệ thống thông tin', 3], ['INS4036', 'Thực tập thực tế', 5], ['INS4030', 'Đồ án tốt nghiệp', 10]
    ],

    // 5. Ngôn ngữ Anh (QHQ09)
    'QHQ09' => [
        ['PHI1006', 'Triết học Mác-Lênin', 3], ['PEC1008', 'Kinh tế chính trị Mác-Lênin', 2], ['PHI1002', 'Chủ nghĩa xã hội khoa học', 2],
        ['HIS1001', 'Lịch sử Đảng Cộng sản Việt Nam', 2], ['POL1001', 'Tư tưởng Hồ Chí Minh', 2], ['THL1057', 'Nhà nước & pháp luật đại cương', 2],
        ['INS1084', 'Tiếng Hàn 1', 5], ['INS1088', 'Tiếng Trung 1', 5], ['INS1086', 'Tiếng Pháp 1', 5],
        ['INS1085', 'Tiếng Hàn 2', 5], ['INS1089', 'Tiếng Trung 2', 5], ['INS1087', 'Tiếng Pháp 2', 5],
        ['INS1073', 'Tin học cơ sở', 3], ['ISV1020', 'Kỹ năng bổ trợ 1', 1], ['ISV1023', 'Kỹ năng bổ trợ 2', 1],
        ['ISV1024', 'Kỹ năng bổ trợ 3', 1], ['PES1001', 'Giáo dục thể chất', 4], ['CME1001', 'Giáo dục quốc phòng - an ninh', 8],
        ['INS1042', 'Nhập môn tiếng Anh Kinh doanh - CNTT', 2], ['HIS1056', 'Cơ sở văn hoá Việt Nam', 2],
        ['INS1078', 'Phương pháp nghiên cứu ngôn ngữ học ứng dụng', 2], ['PHI1051', 'Logic học đại cương', 2],
        ['ENG2054', 'Giao tiếp liên văn hóa', 3], ['INS3009', 'Khởi nghiệp', 3], ['INS1035', 'Các chuyên đề Lịch sử và Văn minh thế giới', 2],
        ['FLF1003', 'Tư duy phê phán', 2], ['VLF1053', 'Tiếng Việt thực hành', 2], ['INS3183', 'Nghe 1', 3],
        ['INS3187', 'Nghe 2', 3], ['INS3184', 'Nói 1', 3], ['INS3131', 'Nói 2', 3], ['INS3185', 'Đọc 1', 3],
        ['INS3132', 'Đọc 2', 3], ['INS3186', 'Viết 1', 3], ['INS3133', 'Viết 2', 3], ['INS1090', 'Lý thuyết ngôn ngữ Anh 1', 4],
        ['INS1091', 'Lý thuyết ngôn ngữ Anh 2', 4], ['INS1032', 'Các chuyên đề Tiếng Anh định hướng kinh doanh', 3],
        ['INE1050', 'Kinh tế vi mô', 3], ['INE1051', 'Kinh tế vĩ mô', 3], ['INS2003', 'Nguyên lí Marketing', 3],
        ['INS2098', 'Nguyên lí kế toán', 3], ['INS2111', 'Tổ chức và quản trị kinh doanh', 3], ['INS3023', 'Quản trị nguồn nhân lực quốc tế', 3],
        ['INS2021', 'Nhập môn kinh doanh quốc tế', 3], ['INS2097', 'Môi trường xã hội, đạo đức, pháp lí trong kinh doanh', 2],
        ['INS2105', 'Giao tiếp trong kinh doanh', 2], ['INS1011', 'Các chuyên đề Tiếng Anh định hướng CNTT', 3],
        ['INS2037', 'Hệ thống thông tin và các quy trình kinh doanh', 3], ['INS2115', 'Tư duy tính toán giải quyết vấn đề', 2],
        ['INS3240', 'Phân tích quy trình kinh doanh', 3], ['INS3276', 'Kỹ thuật phần mềm', 3], ['INS3275', 'Trí tuệ nhân tạo ứng dụng', 2],
        ['INS3162', 'Seminar: Một số chủ đề về Công nghệ thông tin', 2], ['INS2107', 'Nhập môn lập trình', 3],
        ['INS2106', 'Nhập môn các hệ cơ sở dữ liệu', 2], ['INS3254', 'Nhập môn khoa học dữ liệu', 3], ['INS2114', 'Nhập môn an toàn thông tin', 2],
        ['INS3268', 'Tiếng Anh toàn cầu', 2], ['INS3269', 'Ngôn ngữ học xã hội', 2], ['INS3270', 'Ngôn ngữ, văn hóa và xã hội', 2],
        ['ENG3030', 'Biên dịch', 3], ['ENG3031', 'Biên dịch chuyên ngành', 3], ['ENG3062', 'Phiên dịch', 3],
        ['ENG3063', 'Phiên dịch chuyên ngành', 3], ['ENG3049', 'Lý thuyết dịch', 3], ['ENG3006', 'Biên dịch nâng cao', 3],
        ['ENG3007', 'Phiên dịch nâng cao', 3], ['INS3130', 'Công nghệ trong dịch thuật', 3], ['INS3163', 'Lý luận giảng dạy tiếng Anh', 2],
        ['ENG3068', 'Thiết kế giáo án và phát triển tài liệu', 3], ['INS3037', 'Phương pháp giảng dạy tiếng Anh chuyên ngành', 2],
        ['ENG3045', 'Kiểm tra đánh giá ngoại ngữ', 2], ['ENG3069', 'Thụ đắc ngôn ngữ', 3], ['ENG3078', 'Xây dựng chương trình', 3],
        ['INS3036', 'Các chuyên đề về Công nghệ trong dạy học', 3], ['INS3175', 'Các chuyên đề về Quan hệ công chúng', 3],
        ['INS3176', 'Tiếng Anh truyền thông trong KDQT', 3], ['INS3177', 'Tiếng Anh đàm phán trong KDQT', 3], ['ENG3083', 'Các tổ chức quốc tế', 3],
        ['INS3110', 'Các chuyên đề Đất nước học Anh-Mỹ', 3], ['ENG3055', 'Ngôn ngữ và truyền thông', 3], ['INS3112', 'Các chuyên đề toàn cầu hóa', 3],
        ['ENG3027', 'Ngữ âm và Âm vị học', 3], ['ENG2057', 'Ngữ dụng học', 3], ['ENG3057', 'Ngữ nghĩa học', 3],
        ['LIN1012', 'Ngôn ngữ học đối chiếu', 3], ['INS3174', 'Hình vị học', 3], ['ENG3039', 'Cú pháp học', 3],
        ['ENG2060', 'Phân tích diễn ngôn', 3], ['INS4036', 'Thực tập thực tế', 5], ['INS4011', 'Khóa luận tốt nghiệp', 5],
        ['INS4028', 'Xây dựng và Quản trị các dự án nghề nghiệp', 3], ['INS4029', 'Nghiên cứu phát triển nghề nghiệp', 3]
    ]
];

try {
    $db->beginTransaction();

    $total_subjects_created = 0;
    $total_mappings_created = 0;

    foreach ($all_programs_subjects as $prog_code => $subjects) {
        
        // 1. Tìm ID của chương trình (Ngành)
        $stmt = $db->query("SELECT id FROM programs WHERE code = ?", [$prog_code]);
        $program = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$program) {
            echo "<p style='color: orange;'>⚠️ Bỏ qua ngành <strong>$prog_code</strong> vì chưa được tạo trong bảng Programs.</p>";
            continue;
        }

        $program_id = $program['id'];
        $mapped_for_this_prog = 0;

        foreach ($subjects as $sub) {
            $code = strtoupper(trim($sub[0]));
            $name = trim($sub[1]);
            $credits = (int)$sub[2];

            // 2. Kiểm tra xem môn học đã có trong bảng subjects chưa
            $check_sub = $db->query("SELECT id FROM subjects WHERE code = ?", [$code])->fetch();
            
            if ($check_sub) {
                // Đã có -> Lấy ID
                $subject_id = $check_sub['id'];
            } else {
                // Chưa có -> Tạo mới môn học
                $db->query("INSERT INTO subjects (code, name, credits) VALUES (?, ?, ?)", [$code, $name, $credits]);
                $subject_id = $db->getLastInsertId();
                $total_subjects_created++;
            }

            // 3. Nối (Mapping) môn học này vào ngành hiện tại
            $check_map = $db->query("SELECT id FROM subject_program_mapping WHERE subject_id = ? AND program_id = ?", [$subject_id, $program_id])->fetch();
            
            if (!$check_map) {
                $db->query("INSERT INTO subject_program_mapping (subject_id, program_id) VALUES (?, ?)", [$subject_id, $program_id]);
                $mapped_for_this_prog++;
                $total_mappings_created++;
            }
        }
        
        echo "<p>✅ Đã nạp thành công <strong>$mapped_for_this_prog</strong> môn học cho ngành <strong>$prog_code</strong>.</p>";
    }

    $db->commit();

    echo "<h3 style='color: green;'>🎉 Hoàn tất quá trình nạp dữ liệu!</h3>";
    echo "<ul>";
    echo "<li>Đã tạo mới <strong>$total_subjects_created</strong> môn học độc lập.</li>";
    echo "<li>Đã thiết lập <strong>$total_mappings_created</strong> liên kết môn học - ngành đào tạo.</li>";
    echo "</ul>";
    echo "<a href='subjects/index.php' class='btn' style='padding: 10px 20px; background: #0d6efd; color: white; text-decoration: none; border-radius: 5px; margin-top: 20px; display: inline-block;'>Đến trang Quản lý Môn học</a>";

} catch (PDOException $e) {
    $db->rollBack();
    echo "<h3 style='color: red;'>❌ Lỗi Database: " . $e->getMessage() . "</h3>";
}
echo "</div>";
?>