-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 16, 2026 lúc 12:27 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `assessments`
--

CREATE TABLE `assessments` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attainment_reports`
--

CREATE TABLE `attainment_reports` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `plo_id` int(11) NOT NULL,
  `attainment_score` decimal(5,2) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `clos`
--

CREATE TABLE `clos` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Cấu trúc bảng cho bảng `clo_plo_mappings`
--

CREATE TABLE `clo_plo_mappings` (
  `id` int(11) NOT NULL,
  `clo_id` int(11) NOT NULL,
  `plo_id` int(11) NOT NULL,
  `weight` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Cấu trúc bảng cho bảng `plos`
--

CREATE TABLE `plos` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Cấu trúc bảng cho bảng `rubrics`
--

CREATE TABLE `rubrics` (
  `id` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rubric_criteria`
--

CREATE TABLE `rubric_criteria` (
  `id` int(11) NOT NULL,
  `rubric_id` int(11) NOT NULL,
  `clo_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `max_score` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `score_ledger`
--

CREATE TABLE `score_ledger` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `criterion_id` int(11) NOT NULL,
  `score` decimal(5,2) NOT NULL,
  `data_snapshot` text DEFAULT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `graded_by` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `previous_hash` varchar(64) NOT NULL,
  `current_hash` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_enrollments`
--

CREATE TABLE `student_enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `credits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `subjects`
--

INSERT INTO `subjects` (`id`, `code`, `name`, `credits`) VALUES
(68, 'FLF1108', 'Tiếng Anh B2', 5),
(69, 'MAT1092', 'Toán cao cấp', 4),
(70, 'MAT1004', 'Lí thuyết xác suất và thống kê toán', 3),
(71, 'PES1003', 'GDTC - Giáo dục thể chất cơ bản', 1),
(75, 'PHI1006', 'Triết học Mác – Lênin', 3),
(76, 'PEC1008', 'Kinh tế chính trị Mác – Lênin', 2),
(77, 'PSY1050', 'Tâm lí học đại cương', 2),
(78, 'THL1057', 'Nhà nước và Pháp luật đại cương', 2),
(79, 'PHI1002', 'Chủ nghĩa xã hội khoa học', 2),
(80, 'HIS1001', 'Lịch sử Đảng Cộng sản Việt Nam', 2),
(81, 'CME1001', 'Giáo dục quốc phòng – an ninh', 8),
(82, 'POL1001', 'Tư tưởng Hồ Chí Minh', 2),
(83, 'SOC1050', 'Xã hội học đại cương', 2),
(84, 'INE1050', 'Kinh tế vi mô', 3),
(85, 'INS1051', 'Nhập môn Hệ thống thông tin quản lí', 2),
(86, 'INS1073', 'Tin học cơ sở', 3),
(87, 'ISV1020', 'Kĩ năng bổ trợ 1', 1),
(88, 'INE1051', 'Kinh tế vĩ mô', 3),
(89, 'INS2020', 'Lập trình 1', 3),
(90, 'INS2111', 'Tổ chức và quản trị kinh doanh', 3),
(91, 'ISV1023', 'Kĩ năng bổ trợ 2', 1),
(92, 'INS1077', 'Các nguyên lý về mạng máy tính', 3),
(93, 'INS2037', 'Hệ thống thông tin và các quy trình kinh doanh', 3),
(94, 'INS2080', 'Cơ sở dữ liệu', 3),
(95, 'INS3050', 'Cấu trúc dữ liệu và giải thuật', 3),
(96, 'INS3254', 'Nhập môn Khoa học dữ liệu', 3),
(97, 'INS2051', 'Các phương pháp định lượng trong quản lí', 3),
(98, 'INS3044', 'Quản trị dự án công nghệ thông tin', 3),
(99, 'INS3080', 'Trí tuệ nhân tạo', 3),
(100, 'INS2023', 'Quản trị hoạt động', 3),
(101, 'INS2058', 'Quyền sở hữu trí tuệ', 3),
(102, 'INS2060', 'Đổi mới công nghệ thông tin và kinh doanh', 3),
(103, 'INS2098', 'Nguyên lí kế toán', 3),
(104, 'INS2112', 'Thiết kế và quản lí Web', 3),
(105, 'INS3035', 'Lập trình Java', 3),
(106, 'INS3056', 'Mô hình hóa và thiết kế các hệ thống thông tin', 3),
(107, 'INS3061', 'Các hệ thống thông tin doanh nghiệp', 3),
(108, 'INS3062', 'Các nguyên lí an toàn thông tin', 3),
(109, 'INS3212', 'Blockchain và tiền kĩ thuật số', 3),
(110, 'INS1076', 'Phương pháp nghiên cứu cho Khoa học tự nhiên và Công nghệ', 2),
(111, 'INS2059', 'Lãnh đạo và xây dựng đội ngũ', 2),
(112, 'INS2065', 'Các công nghệ dựa trên nền công nghệ thông tin', 2),
(113, 'INS2097', 'Môi trường xã hội, đạo đức, pháp lí trong kinh doanh', 2),
(114, 'INS3064', 'Thiết kế đa phương tiện và phát triển Web', 3),
(115, 'INS3069', 'Các hệ hỗ trợ ra quyết định', 3),
(116, 'INS3281', 'Dự án I', 3),
(117, 'ISV1024', 'Kĩ năng bổ trợ 3', 1),
(118, 'INS3057', 'Lập kế hoạch và hạ tầng công nghệ thông tin', 3),
(119, 'INS3060', 'Phát triển cơ sở dữ liệu nâng cao', 3),
(120, 'INS3066', 'Các giải pháp kinh doanh cho doanh nghiệp', 3),
(121, 'INS3067', 'Các quy trình và công nghệ ngân hàng bán lẻ', 3),
(122, 'INS3068', 'Các quy trình và công nghệ thanh toán điện tử', 3),
(123, 'INS3070', 'Quản lí các hệ thống thông tin', 3),
(124, 'INS3240', 'Phân tích quy trình kinh doanh', 3),
(125, 'INS3009', 'Khởi nghiệp', 3),
(126, 'INS3045', 'An ninh mạng', 3),
(127, 'INS3266', 'Hệ thống hoạch định nguồn lực doanh nghiệp', 3),
(128, 'INS3267', 'Kinh doanh thông minh và kho dữ liệu', 3),
(129, 'INS4034', 'Chuyển đổi số', 3),
(130, 'INS4036', 'Thực tập thực tế', 5),
(131, 'INS2100', 'Quản trị chiến lược', 3),
(132, 'INS3282', 'Dự án II', 2),
(133, 'INS4011', 'Khóa luận tốt nghiệp', 5),
(134, 'PES1001', 'Giáo dục thể chất', 4),
(135, 'INS1016', 'Tiếng Anh chuyên ngành 1', 4),
(136, 'MAT1005', 'Toán kinh tế', 3),
(137, 'INS1052', 'Phương pháp luận nghiên cứu khoa học', 2),
(138, 'INS2021', 'Nhập môn kinh doanh quốc tế', 3),
(139, 'INS2003', 'Nguyên lí Marketing', 3),
(140, 'INS2015', 'Tài chính căn bản', 3),
(141, 'INS2105', 'Giao tiếp trong kinh doanh', 2),
(142, 'INS2005', 'Kinh tế quốc tế', 2),
(143, 'INS2026', 'Lý thuyết và chính sách thương mại quốc tế', 2),
(144, 'BSA1055', 'Văn hoá kinh doanh', 2),
(145, 'INS3019', 'Quản trị thương mại quốc tế', 3),
(146, 'INS3021', 'Quản trị chuỗi cung ứng toàn cầu', 3),
(147, 'INS3032', 'Tài chính quốc tế', 3),
(148, 'INS3042', 'Marketing quốc tế', 3),
(149, 'INS3022', 'Luật kinh doanh quốc tế', 3),
(150, 'INS3023', 'Quản trị nguồn nhân lực quốc tế', 3),
(151, 'INS3026', 'Xúc tiến thương mại quốc tế', 3),
(152, 'INS3028', 'Quản trị rủi ro và bảo hiểm', 3),
(153, 'INS3033', 'Khoá học tập ở nước ngoài', 3),
(154, 'INS3287', 'Giao dịch ngoại thương', 3),
(155, 'INE3060', 'Thương mại điện tử', 3),
(156, 'INE3009', 'Quản trị dự án quốc tế', 3),
(157, 'INS2109', 'Kế toán quản trị', 3),
(158, 'INS3271', 'Kế toán quốc tế', 3),
(159, 'INS2110', 'Chính sách kinh tế Việt Nam', 2),
(160, 'INS2033', 'Các công ước và hiệp định thương mại quốc tế', 2),
(161, 'INS2035', 'Kinh tế khu vực Châu Á- Thái Bình Dương', 2),
(162, 'INS2034', 'Kinh tế khu vực Châu Âu', 2),
(163, 'INS3272', 'Kế toán tài chính 1', 3),
(164, 'INS3252', 'Kế toán tài chính 2', 3),
(165, 'INS3016', 'Thực hành kế toán trên máy tính', 3),
(166, 'INS3030', 'Phân tích báo cáo tài chính', 3),
(167, 'INS3251', 'Thuế', 3),
(168, 'INS3164', 'Thị trường và các thể chế tài chính', 3),
(169, 'INS3273', 'Tài chính doanh nghiệp', 3),
(170, 'FIB3005', 'Đầu tư và quản lý danh mục đầu tư', 3),
(171, 'BSA3012', 'Nghiên cứu Marketing', 3),
(172, 'INS3283', 'Marketing số', 3),
(173, 'BSA3014', 'Marketing dịch vụ', 3),
(174, 'INS3090', 'Truyền thông Marketing tích hợp và thương hiệu', 3),
(175, 'INS3041', 'Chiến lược marketing', 3),
(176, 'INS4032', 'Quản trị kinh doanh bền vững', 2),
(177, 'INS4003', 'Quản trị chiến lược quốc tế', 3),
(178, 'INS1082', 'Nhập môn ngành kế toán', 2),
(179, 'INS2009', 'Nguyên lí Kế toán', 4),
(180, 'INS2004', 'Thống kê kinh tế', 3),
(181, 'INS2011', 'Luật kinh tế', 3),
(182, 'INS2102', 'Tiền tệ, tín dụng, ngân hàng', 2),
(183, 'INS3012', 'Kiểm toán căn bản', 3),
(184, 'INS3031', 'Kế toán Việt Nam', 2),
(185, 'INS3025', 'Quân trị đổi mới', 2),
(186, 'INS2104', 'Hệ thống thông tin kế toán', 3),
(187, 'INS3247', 'Phân tích hoạt động kinh doanh', 3),
(188, 'INS2016', 'Rủi ro và phân tích rủi ro', 3),
(189, 'INS3278', 'Công nghệ chuỗi khối cho dự án tài chính', 3),
(190, 'INS3013', 'Kiểm toán tài chính 1', 3),
(191, 'INS3014', 'Kiểm toán tài chính 2', 3),
(192, 'INS3284', 'Kiểm toán nội bộ', 3),
(193, 'INS4019', 'Quản trị hiệu quả hoạt động', 3),
(194, 'INS4035', 'Lập báo cáo tài chính', 2),
(195, 'INS1080', 'Tiếng Nga', 4),
(196, 'INS1193', 'Đại số và hình giải tích', 3),
(197, 'INS1194', 'Giải tích 1', 4),
(198, 'INS1195', 'Giải tích 2', 3),
(199, 'INS1083', 'Vật lí cho Tin học và Kĩ thuật máy tính', 4),
(200, 'INS1060', 'Logic toán và lí thuyết thuật toán', 3),
(201, 'INS1196', 'Lí thuyết xác suất và thống kê toán', 3),
(202, 'INS1189', 'Phương pháp số', 3),
(203, 'INS2071', 'Lí thuyết tín hiệu', 3),
(204, 'INS2073', 'Lập trình 2', 3),
(205, 'INS2074', 'Toán rời rạc', 3),
(206, 'INS2031', 'Kĩ thuật điện', 3),
(207, 'INS2075', 'Kĩ thuật điện tử', 3),
(208, 'INS2076', 'Hệ điều hành', 3),
(209, 'INS3274', 'Ngôn ngữ lập trình cho khoa học dữ liệu', 3),
(210, 'INS2077', 'Kiến trúc máy tính', 2),
(211, 'INS2081', 'Hình họa và vẽ kĩ thuật', 2),
(212, 'INS2082', 'Nguyên lí điều khiển', 2),
(213, 'INS2079', 'Quyền sở hữu trí tuệ trong công nghệ', 2),
(214, 'INS3144', 'Xử lí tín hiệu số', 3),
(215, 'INS3179', 'Thiết kế mạch tích hợp số', 3),
(216, 'INS3108', 'Hệ thống vi xử lí', 3),
(217, 'INS3135', 'Mô phỏng thiết kế mạch', 3),
(218, 'INS3109', 'Mạng máy tính và viễn thông', 2),
(219, 'INS3141', 'Hệ thống truyền tin', 2),
(220, 'INS3181', 'Hệ thống nhúng và vi điều khiển', 2),
(221, 'INS3157', 'An toàn thông tin', 2),
(222, 'INS3046', 'Học máy', 3),
(223, 'INS3125', 'Mạng cục bộ', 2),
(224, 'INS3119', 'Mô hình hóa', 2),
(225, 'INS3102', 'Cơ sở lí thuyết độ tin cậy', 2),
(226, 'INS3180', 'Đo lường và điều khiển bằng máy tính', 2),
(227, 'INS3117', 'Bộ nhớ máy tính', 2),
(228, 'INS3158', 'Truyền thông số và mã hóa', 2),
(229, 'INS3159', 'Công nghệ phần mềm', 2),
(230, 'INS3120', 'Kiểm thử và đảm bảo chất lượng phần mềm', 2),
(231, 'INS3155', 'Thị giác máy tính', 3),
(232, 'INS3118', 'Kĩ thuật đồ họa máy tính', 2),
(233, 'INS3182', 'Tính toán phân tán', 2),
(234, 'INS4014', 'Đồ án tốt nghiệp', 5),
(235, 'INS1053', 'Nhập môn phân tích dữ liệu kinh doanh', 2),
(236, 'INS3078', 'Khoa học quản lí', 2),
(237, 'INS3280', 'Chuẩn bị dữ liệu và trực quan hoá', 3),
(238, 'INS3286', 'Tối ưu hóa ứng dụng', 3),
(239, 'INS3049', 'Kinh tế lượng', 4),
(240, 'INS3008', 'Dự án', 3),
(241, 'INS3076', 'Phân tích dữ liệu lớn', 3),
(242, 'INS2101', 'Đại cương lãnh đạo trong tổ chức', 2),
(243, 'INS3277', 'Xử lý ngôn ngữ tự nhiên ứng dụng', 3),
(244, 'INS3257', 'Phân tích chuỗi thời gian', 3),
(245, 'INS3258', 'Xê-mi-na: Phân tích dữ liệu', 3),
(246, 'INS3259', 'Phân tích dữ liệu tài chính', 3),
(247, 'INS3260', 'Tính toán trong quản trị rủi ro', 3),
(248, 'INS3261', 'Xê-mi-na: Phân tích dữ liệu tài chính', 3),
(249, 'INS3262', 'Phân tích dữ liệu Marketing', 3),
(250, 'INS3263', 'Phân tích quyết định Marketing', 3),
(251, 'INS3264', 'Xê-mi-na: Phân tích dữ liệu Marketing', 3),
(252, 'INS4016', 'Phân tích dữ liệu nâng cao', 2),
(253, 'INS4037', 'Các chủ đề nâng cao trong khoa học dữ liệu', 3),
(254, 'ISV1019', 'Tin học cơ sở', 3),
(255, 'ISV1002', 'Đại số và hình giải tích', 3),
(256, 'ISV1003', 'Giải tích 1', 3),
(257, 'ISV1004', 'Giải tích 2', 3),
(258, 'ISV1005', 'Vật lí đại cương', 3),
(259, 'ISV1022', 'Phương trình đạo hàm riêng', 3),
(260, 'ISV1026', 'Cơ học lý thuyết', 3),
(261, 'ISV1008', 'Phương trình vi phân', 3),
(262, 'ISV1018', 'Lí thuyết xác suất và thống kê', 3),
(263, 'ISV1027', 'Cơ học môi trường liên tục', 3),
(264, 'ISV1011', 'Nhập môn Tự động hóa và Tin học', 2),
(265, 'ISV2001', 'Phương pháp số', 3),
(266, 'ISV2002', 'Vật liệu tiên tiến', 3),
(267, 'ISV2003', 'Đàn hồi nhiệt', 3),
(268, 'ISV2004', 'Nguyên lý điều khiển tự động', 3),
(269, 'ISV2005', 'Lập trình 1', 3),
(270, 'ISV2006', 'Lập trình 2', 3),
(271, 'ISV3001', 'Kĩ thuật điện', 3),
(272, 'ISV3002', 'Kĩ thuật điện tử', 3),
(273, 'ISV3003', 'Vẽ kĩ thuật và CAD', 3),
(274, 'ISV3004', 'Trí tuệ nhân tạo', 3),
(275, 'ISV3005', 'Mạng máy tính', 3),
(276, 'ISV3016', 'Hệ thống tự động hóa số', 3),
(277, 'ISV3007', 'Các nguyên lí an toàn thông tin', 3),
(278, 'ISV1025', 'Phương pháp nghiên cứu cho Khoa học tự nhiên', 2),
(279, 'ISV3009', 'Khởi nghiệp', 3),
(280, 'ISV3010', 'Đồ án I', 3),
(281, 'ISV3015', 'Thực tập doanh nghiệp', 3),
(282, 'ISV3011', 'Linh kiện bán dẫn và vi mạch', 2),
(283, 'ISV3012', 'Đo lường và điều khiển bằng máy tính', 2),
(284, 'ISV3013', 'Kiến trúc máy tính và mạng truyền thông công nghiệp', 2),
(285, 'ISV2007', 'Quyền sở hữu trí tuệ', 2),
(286, 'ISV3014', 'Phát triển ứng dụng IoT', 2),
(287, 'ISV2020', 'Hệ điều hành thời gian thực', 2),
(288, 'ISV1021', 'Quản trị kinh doanh bền vững', 2),
(289, 'INS3143', 'Kỹ thuật đo lường và cảm biến', 3),
(290, 'INS3146', 'Cơ sở công nghệ chế tạo máy', 3),
(291, 'INS3147', 'Mô hình hóa và mô phỏng hệ thống điều khiển', 2),
(292, 'INS3148', 'Vi xử lý và vi điều khiển', 3),
(293, 'INS3149', 'Tự động hóa quá trình sản xuất', 3),
(294, 'INS3150', 'Điều khiển PLC', 3),
(295, 'INS3151', 'Hệ thống điều khiển nhúng', 3),
(296, 'INS3152', 'Người máy', 3),
(297, 'INS3237', 'Động cơ và cơ sở truyền động điện', 3),
(298, 'INS3154', 'Đồ án II: Thiết kế hệ thống điều khiển', 3),
(299, 'INS3034', 'Khung kiến trúc Dot Net', 3),
(300, 'INS3156', 'Đồ án III: Thiết kế hệ thống thông tin', 3),
(301, 'INS4030', 'Đồ án tốt nghiệp', 10),
(302, 'INS1084', 'Tiếng Hàn 1', 5),
(303, 'INS1088', 'Tiếng Trung 1', 5),
(304, 'INS1086', 'Tiếng Pháp 1', 5),
(305, 'INS1085', 'Tiếng Hàn 2', 5),
(306, 'INS1089', 'Tiếng Trung 2', 5),
(307, 'INS1087', 'Tiếng Pháp 2', 5),
(308, 'INS1042', 'Nhập môn tiếng Anh Kinh doanh - CNTT', 2),
(309, 'HIS1056', 'Cơ sở văn hoá Việt Nam', 2),
(310, 'INS1078', 'Phương pháp nghiên cứu ngôn ngữ học ứng dụng', 2),
(311, 'PHI1051', 'Logic học đại cương', 2),
(312, 'ENG2054', 'Giao tiếp liên văn hóa', 3),
(313, 'INS1035', 'Các chuyên đề Lịch sử và Văn minh thế giới', 2),
(314, 'FLF1003', 'Tư duy phê phán', 2),
(315, 'VLF1053', 'Tiếng Việt thực hành', 2),
(316, 'INS3183', 'Nghe 1', 3),
(317, 'INS3187', 'Nghe 2', 3),
(318, 'INS3184', 'Nói 1', 3),
(319, 'INS3131', 'Nói 2', 3),
(320, 'INS3185', 'Đọc 1', 3),
(321, 'INS3132', 'Đọc 2', 3),
(322, 'INS3186', 'Viết 1', 3),
(323, 'INS3133', 'Viết 2', 3),
(324, 'INS1090', 'Lý thuyết ngôn ngữ Anh 1', 4),
(325, 'INS1091', 'Lý thuyết ngôn ngữ Anh 2', 4),
(326, 'INS1032', 'Các chuyên đề Tiếng Anh định hướng kinh doanh', 3),
(327, 'INS1011', 'Các chuyên đề Tiếng Anh định hướng CNTT', 3),
(328, 'INS2115', 'Tư duy tính toán giải quyết vấn đề', 2),
(329, 'INS3276', 'Kỹ thuật phần mềm', 3),
(330, 'INS3275', 'Trí tuệ nhân tạo ứng dụng', 2),
(331, 'INS3162', 'Seminar: Một số chủ đề về Công nghệ thông tin', 2),
(332, 'INS2107', 'Nhập môn lập trình', 3),
(333, 'INS2106', 'Nhập môn các hệ cơ sở dữ liệu', 2),
(334, 'INS2114', 'Nhập môn an toàn thông tin', 2),
(335, 'INS3268', 'Tiếng Anh toàn cầu', 2),
(336, 'INS3269', 'Ngôn ngữ học xã hội', 2),
(337, 'INS3270', 'Ngôn ngữ, văn hóa và xã hội', 2),
(338, 'ENG3030', 'Biên dịch', 3),
(339, 'ENG3031', 'Biên dịch chuyên ngành', 3),
(340, 'ENG3062', 'Phiên dịch', 3),
(341, 'ENG3063', 'Phiên dịch chuyên ngành', 3),
(342, 'ENG3049', 'Lý thuyết dịch', 3),
(343, 'ENG3006', 'Biên dịch nâng cao', 3),
(344, 'ENG3007', 'Phiên dịch nâng cao', 3),
(345, 'INS3130', 'Công nghệ trong dịch thuật', 3),
(346, 'INS3163', 'Lý luận giảng dạy tiếng Anh', 2),
(347, 'ENG3068', 'Thiết kế giáo án và phát triển tài liệu', 3),
(348, 'INS3037', 'Phương pháp giảng dạy tiếng Anh chuyên ngành', 2),
(349, 'ENG3045', 'Kiểm tra đánh giá ngoại ngữ', 2),
(350, 'ENG3069', 'Thụ đắc ngôn ngữ', 3),
(351, 'ENG3078', 'Xây dựng chương trình', 3),
(352, 'INS3036', 'Các chuyên đề về Công nghệ trong dạy học', 3),
(353, 'INS3175', 'Các chuyên đề về Quan hệ công chúng', 3),
(354, 'INS3176', 'Tiếng Anh truyền thông trong KDQT', 3),
(355, 'INS3177', 'Tiếng Anh đàm phán trong KDQT', 3),
(356, 'ENG3083', 'Các tổ chức quốc tế', 3),
(357, 'INS3110', 'Các chuyên đề Đất nước học Anh-Mỹ', 3),
(358, 'ENG3055', 'Ngôn ngữ và truyền thông', 3),
(359, 'INS3112', 'Các chuyên đề toàn cầu hóa', 3),
(360, 'ENG3027', 'Ngữ âm và Âm vị học', 3),
(361, 'ENG2057', 'Ngữ dụng học', 3),
(362, 'ENG3057', 'Ngữ nghĩa học', 3),
(363, 'LIN1012', 'Ngôn ngữ học đối chiếu', 3),
(364, 'INS3174', 'Hình vị học', 3),
(365, 'ENG3039', 'Cú pháp học', 3),
(366, 'ENG2060', 'Phân tích diễn ngôn', 3),
(367, 'INS4028', 'Xây dựng và Quản trị các dự án nghề nghiệp', 3),
(368, 'INS4029', 'Nghiên cứu phát triển nghề nghiệp', 3),
(369, 'INS1081', 'Nhập môn ngành Marketing', 2),
(370, 'INS2066', 'Luật kinh doanh', 4),
(371, 'INS3189', 'Tài chính doanh nghiệp', 4),
(372, 'INS3190', 'Quản trị nguồn nhân lực', 4),
(373, 'INS3095', 'Hành vi người tiêu dùng', 3),
(374, 'INS3248', 'Marketing quốc tế', 3),
(375, 'INS3017', 'Kế toán quốc tế', 3),
(376, 'INS3191', 'Quản lý phân phối và cung ứng', 4),
(377, 'INS3192', 'Quản trị bán hàng', 4),
(378, 'INS3193', 'Quản trị sản phẩm', 4),
(379, 'INS3194', 'Marketing số', 4),
(380, 'INS3195', 'Truyền thông marketing tích hợp', 4),
(381, 'INS3196', 'Chiến lược Marketing toàn cầu', 4),
(382, 'INS3127', 'Nghiên cứu Marketing', 4),
(383, 'INS3197', 'Lập kế hoạch và chiến lược Marketing', 4),
(384, 'INS3128', 'Marketing dịch vụ', 4),
(385, 'INS3198', 'Quản trị và phát triển sản phẩm sáng tạo', 4),
(386, 'INS2116', 'Quản trị hoạt động', 4),
(387, 'INS3285', 'Phân tích hỗ trợ ra quyết định trong kinh doanh', 3),
(388, 'INS3289', 'Liêm chính và chống hối lộ', 3),
(389, 'INS4022', 'Khóa luận tốt nghiệp', 6),
(390, 'INS4023', 'Thực tập tại doanh nghiệp', 4),
(391, 'INS3167', 'Quản trị sự kiện', 2),
(392, 'INS1192', 'Đại số', 3),
(393, 'INS1038', 'Vật lý đại cương', 4),
(394, 'INS1040', 'Tiếng Anh Đại học I', 3),
(395, 'INS1041', 'Tiếng Anh Đại học II', 3),
(396, 'INS1036', 'Tâm lý học đại cương', 3),
(397, 'INS1021', 'Chính trị thế giới', 3),
(398, 'INS1022', 'Nền văn minh phương Tây', 3),
(399, 'INS1026', 'Lịch sử nghệ thuật phương Tây', 3),
(400, 'INS1037', 'Xã hội học đại cương', 3),
(401, 'INS1027', 'Đạo đức', 3),
(402, 'INS1028', 'Nhập môn giao tiếp', 3),
(403, 'INS1054', 'Thống kê cho khoa học xã hội', 3),
(404, 'INS1025', 'Diễn thuyết trước công chúng', 3),
(405, 'INS1055', 'Môi trường pháp lý cho doanh nghiệp', 3),
(406, 'INS2096', 'Nguyên lý Marketing', 3),
(407, 'INS3142', 'Nhập môn kinh doanh và xã hội', 3),
(408, 'INS3097', 'Kế toán I: Kế toán tài chính', 3),
(409, 'INS2038', 'Kinh doanh quốc tế', 3),
(410, 'INS2113', 'Quản trị tài chính', 3),
(411, 'INS3121', 'Lãnh đạo', 3),
(412, 'INS3123', 'Hệ thống và công nghệ thông tin doanh nghiệp', 3),
(413, 'INS3129', 'Kế toán II: Kế toán quản trị', 3),
(414, 'INS3124', 'Quản trị nguồn nhân lực', 3),
(415, 'INS3091', 'Quản trị vận hành và sản xuất', 3),
(416, 'INS3239', 'Hành vi tổ chức', 3),
(417, 'INS3094', 'Lập kế hoạch marketing', 3),
(418, 'INS3093', 'Quảng cáo', 3),
(419, 'INS3104', 'Quan hệ công chúng', 3),
(420, 'INS3101', 'Kế toán chi phí I', 3),
(421, 'INS3099', 'Kế toán thuế thu nhập I', 3),
(422, 'INS3126', 'Quản trị tài chính quốc tế', 3),
(423, 'INS4018', 'Quản trị đa văn hóa', 2),
(424, 'INS4025', 'Thực tập thực tế tại doanh nghiệp', 4),
(425, 'INS4027', 'Quản trị chiến lược', 3),
(426, 'INS4026', 'Học phần trải nghiệm', 3),
(427, 'DIG1001', 'Nhập môn Truyền thông số', 3),
(428, 'DIG1002', 'Lịch sử truyền thông đại chúng', 2),
(429, 'DIG2001', 'Sản xuất nội dung số', 3),
(430, 'DIG2002', 'Thiết kế đồ họa cơ bản', 3),
(431, 'DIG2003', 'Nghệ thuật kể chuyện (Storytelling)', 3),
(432, 'DIG3001', 'Quản trị mạng xã hội', 3),
(433, 'DIG3002', 'Phân tích dữ liệu truyền thông', 3),
(434, 'DIG3003', 'Tâm lý học truyền thông', 3),
(435, 'DIG4001', 'Khóa luận Truyền thông số', 5),
(436, 'DIG4002', 'Đồ án Sản xuất Media', 5),
(437, 'DGB1001', 'Nhập môn Kinh doanh số', 3),
(438, 'DGB2001', 'Mô hình kinh doanh số', 3),
(439, 'DGB3001', 'Quản trị chuỗi cung ứng số', 3),
(440, 'DGB3002', 'Luật và đạo đức trong không gian mạng', 2),
(441, 'DGB3003', 'Hành vi khách hàng trực tuyến', 3),
(442, 'DGB4001', 'Khóa luận Kinh doanh số', 5),
(443, 'DGB4002', 'Khởi nghiệp trên nền tảng số', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subject_program_mapping`
--

CREATE TABLE `subject_program_mapping` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `subject_program_mapping`
--

INSERT INTO `subject_program_mapping` (`id`, `subject_id`, `program_id`) VALUES
(209, 68, 10),
(208, 68, 11),
(207, 68, 12),
(216, 68, 13),
(214, 68, 14),
(212, 68, 15),
(215, 68, 16),
(218, 68, 17),
(213, 68, 18),
(206, 68, 19),
(205, 68, 20),
(211, 68, 21),
(210, 68, 22),
(217, 68, 23),
(225, 69, 10),
(287, 69, 11),
(395, 69, 14),
(600, 69, 15),
(226, 70, 10),
(288, 70, 11),
(396, 70, 14),
(601, 70, 15),
(195, 71, 10),
(194, 71, 11),
(193, 71, 12),
(202, 71, 13),
(200, 71, 14),
(198, 71, 15),
(201, 71, 16),
(204, 71, 17),
(199, 71, 18),
(192, 71, 19),
(191, 71, 20),
(197, 71, 21),
(196, 71, 22),
(203, 71, 23),
(15, 75, 10),
(16, 75, 11),
(17, 75, 12),
(18, 75, 13),
(19, 75, 14),
(20, 75, 15),
(21, 75, 16),
(22, 75, 17),
(23, 75, 18),
(24, 75, 19),
(25, 75, 20),
(26, 75, 21),
(27, 75, 22),
(28, 75, 23),
(29, 76, 10),
(30, 76, 11),
(31, 76, 12),
(32, 76, 13),
(33, 76, 14),
(34, 76, 15),
(35, 76, 16),
(36, 76, 17),
(37, 76, 18),
(38, 76, 19),
(39, 76, 20),
(40, 76, 21),
(41, 76, 22),
(42, 76, 23),
(43, 77, 10),
(44, 77, 11),
(45, 77, 12),
(46, 77, 13),
(47, 77, 14),
(48, 77, 15),
(49, 77, 16),
(50, 77, 17),
(51, 77, 18),
(52, 77, 19),
(53, 77, 20),
(54, 77, 21),
(55, 77, 22),
(56, 77, 23),
(57, 78, 10),
(58, 78, 11),
(59, 78, 12),
(60, 78, 13),
(61, 78, 14),
(62, 78, 15),
(63, 78, 16),
(64, 78, 17),
(65, 78, 18),
(66, 78, 19),
(67, 78, 20),
(68, 78, 21),
(69, 78, 22),
(70, 78, 23),
(71, 79, 10),
(72, 79, 11),
(73, 79, 12),
(74, 79, 13),
(75, 79, 14),
(76, 79, 15),
(77, 79, 16),
(78, 79, 17),
(79, 79, 18),
(80, 79, 19),
(81, 79, 20),
(82, 79, 21),
(83, 79, 22),
(84, 79, 23),
(85, 80, 10),
(86, 80, 11),
(87, 80, 12),
(88, 80, 13),
(89, 80, 14),
(90, 80, 15),
(91, 80, 16),
(92, 80, 17),
(93, 80, 18),
(94, 80, 19),
(95, 80, 20),
(96, 80, 21),
(97, 80, 22),
(98, 80, 23),
(99, 81, 10),
(100, 81, 11),
(101, 81, 12),
(102, 81, 13),
(103, 81, 14),
(104, 81, 15),
(105, 81, 16),
(106, 81, 17),
(107, 81, 18),
(108, 81, 19),
(109, 81, 20),
(110, 81, 21),
(111, 81, 22),
(112, 81, 23),
(113, 82, 10),
(114, 82, 11),
(115, 82, 12),
(116, 82, 13),
(117, 82, 14),
(118, 82, 15),
(119, 82, 16),
(120, 82, 17),
(121, 82, 18),
(122, 82, 19),
(123, 82, 20),
(124, 82, 21),
(125, 82, 22),
(126, 82, 23),
(127, 83, 10),
(128, 83, 11),
(129, 83, 12),
(130, 83, 13),
(131, 83, 14),
(132, 83, 15),
(133, 83, 16),
(134, 83, 17),
(135, 83, 18),
(136, 83, 19),
(137, 83, 20),
(138, 83, 21),
(139, 83, 22),
(140, 83, 23),
(228, 84, 10),
(290, 84, 11),
(141, 84, 12),
(399, 84, 14),
(605, 84, 15),
(655, 84, 16),
(540, 84, 18),
(710, 84, 22),
(142, 85, 12),
(219, 86, 10),
(280, 86, 11),
(143, 86, 12),
(332, 86, 13),
(389, 86, 14),
(596, 86, 15),
(637, 86, 16),
(515, 86, 18),
(708, 86, 22),
(692, 86, 23),
(220, 87, 10),
(281, 87, 11),
(144, 87, 12),
(333, 87, 13),
(390, 87, 14),
(597, 87, 15),
(638, 87, 16),
(449, 87, 17),
(516, 87, 18),
(229, 88, 10),
(291, 88, 11),
(145, 88, 12),
(400, 88, 14),
(606, 88, 15),
(656, 88, 16),
(541, 88, 18),
(711, 88, 22),
(146, 89, 12),
(347, 89, 13),
(234, 90, 10),
(293, 90, 11),
(147, 90, 12),
(401, 90, 14),
(614, 90, 15),
(544, 90, 18),
(712, 90, 22),
(221, 91, 10),
(282, 91, 11),
(148, 91, 12),
(334, 91, 13),
(391, 91, 14),
(598, 91, 15),
(639, 91, 16),
(450, 91, 17),
(517, 91, 18),
(149, 92, 12),
(236, 93, 10),
(150, 93, 12),
(415, 93, 14),
(603, 93, 15),
(550, 93, 18),
(719, 93, 22),
(151, 94, 12),
(355, 94, 13),
(410, 94, 14),
(499, 94, 17),
(152, 95, 12),
(348, 95, 13),
(423, 95, 14),
(498, 95, 17),
(312, 96, 11),
(153, 96, 12),
(362, 96, 13),
(407, 96, 14),
(629, 96, 15),
(558, 96, 18),
(718, 96, 22),
(154, 97, 12),
(411, 97, 14),
(155, 98, 12),
(416, 98, 14),
(156, 99, 12),
(373, 99, 13),
(406, 99, 14),
(250, 100, 10),
(157, 100, 12),
(412, 100, 14),
(158, 101, 12),
(413, 101, 14),
(159, 102, 12),
(417, 102, 14),
(232, 103, 10),
(160, 103, 12),
(607, 103, 15),
(543, 103, 18),
(713, 103, 22),
(161, 104, 12),
(414, 104, 14),
(162, 105, 12),
(163, 106, 12),
(500, 106, 17),
(164, 107, 12),
(427, 107, 14),
(165, 108, 12),
(409, 108, 14),
(327, 109, 11),
(166, 109, 12),
(167, 110, 12),
(385, 110, 13),
(397, 110, 14),
(168, 111, 12),
(386, 111, 13),
(169, 112, 12),
(239, 113, 10),
(304, 113, 11),
(170, 113, 12),
(359, 113, 13),
(430, 113, 14),
(547, 113, 18),
(171, 114, 12),
(369, 114, 13),
(172, 115, 12),
(173, 116, 12),
(222, 117, 10),
(283, 117, 11),
(174, 117, 12),
(335, 117, 13),
(392, 117, 14),
(599, 117, 15),
(640, 117, 16),
(451, 117, 17),
(518, 117, 18),
(175, 118, 12),
(176, 119, 12),
(177, 120, 12),
(408, 120, 14),
(630, 120, 15),
(178, 121, 12),
(179, 122, 12),
(180, 123, 12),
(502, 123, 17),
(181, 124, 12),
(552, 124, 18),
(237, 125, 10),
(300, 125, 11),
(182, 125, 12),
(370, 125, 13),
(398, 125, 14),
(612, 125, 15),
(663, 125, 16),
(525, 125, 18),
(183, 126, 12),
(184, 127, 12),
(185, 128, 12),
(186, 129, 12),
(276, 130, 10),
(328, 130, 11),
(187, 130, 12),
(387, 130, 13),
(443, 130, 14),
(507, 130, 17),
(592, 130, 18),
(249, 131, 10),
(188, 131, 12),
(189, 132, 12),
(277, 133, 10),
(329, 133, 11),
(190, 133, 12),
(444, 133, 14),
(593, 133, 18),
(223, 134, 10),
(284, 134, 11),
(336, 134, 13),
(393, 134, 14),
(448, 134, 17),
(519, 134, 18),
(709, 134, 22),
(693, 134, 23),
(224, 135, 10),
(286, 135, 11),
(227, 136, 10),
(289, 136, 11),
(602, 136, 15),
(230, 137, 10),
(292, 137, 11),
(342, 137, 13),
(231, 138, 10),
(546, 138, 18),
(233, 139, 10),
(295, 139, 11),
(403, 139, 14),
(608, 139, 15),
(542, 139, 18),
(696, 139, 23),
(235, 140, 10),
(297, 140, 11),
(402, 140, 14),
(714, 140, 22),
(238, 141, 10),
(315, 141, 11),
(548, 141, 18),
(240, 142, 10),
(301, 142, 11),
(241, 143, 10),
(242, 144, 10),
(303, 144, 11),
(688, 144, 16),
(243, 145, 10),
(244, 146, 10),
(428, 146, 14),
(682, 146, 16),
(245, 147, 10),
(246, 148, 10),
(667, 148, 16),
(247, 149, 10),
(248, 150, 10),
(545, 150, 18),
(251, 151, 10),
(252, 152, 10),
(684, 152, 16),
(253, 153, 10),
(254, 154, 10),
(255, 155, 10),
(425, 155, 14),
(631, 155, 15),
(685, 155, 16),
(717, 155, 22),
(256, 156, 10),
(313, 156, 11),
(683, 156, 16),
(257, 157, 10),
(299, 157, 11),
(615, 157, 15),
(258, 158, 10),
(325, 158, 11),
(259, 159, 10),
(260, 160, 10),
(261, 161, 10),
(262, 162, 10),
(263, 163, 10),
(307, 163, 11),
(264, 164, 10),
(308, 164, 11),
(265, 165, 10),
(309, 165, 11),
(266, 166, 10),
(311, 166, 11),
(681, 166, 16),
(267, 167, 10),
(306, 167, 11),
(268, 168, 10),
(680, 168, 16),
(269, 169, 10),
(305, 169, 11),
(270, 170, 10),
(321, 170, 11),
(679, 170, 16),
(271, 171, 10),
(272, 172, 10),
(670, 172, 16),
(273, 173, 10),
(674, 173, 16),
(274, 174, 10),
(275, 175, 10),
(439, 175, 14),
(278, 176, 10),
(314, 176, 11),
(687, 176, 16),
(279, 177, 10),
(285, 178, 11),
(294, 179, 11),
(296, 180, 11),
(418, 180, 14),
(298, 181, 11),
(302, 182, 11),
(310, 183, 11),
(316, 184, 11),
(317, 185, 11),
(318, 186, 11),
(319, 187, 11),
(320, 188, 11),
(322, 189, 11),
(435, 189, 14),
(323, 190, 11),
(324, 191, 11),
(326, 192, 11),
(330, 193, 11),
(331, 194, 11),
(337, 195, 13),
(338, 196, 13),
(339, 197, 13),
(340, 198, 13),
(341, 199, 13),
(343, 200, 13),
(344, 201, 13),
(345, 202, 13),
(346, 203, 13),
(349, 204, 13),
(350, 205, 13),
(351, 206, 13),
(352, 207, 13),
(353, 208, 13),
(354, 209, 13),
(405, 209, 14),
(356, 210, 13),
(357, 211, 13),
(358, 212, 13),
(360, 213, 13),
(361, 214, 13),
(486, 214, 17),
(363, 215, 13),
(364, 216, 13),
(365, 217, 13),
(488, 217, 17),
(366, 218, 13),
(367, 219, 13),
(368, 220, 13),
(371, 221, 13),
(372, 222, 13),
(420, 222, 14),
(374, 223, 13),
(375, 224, 13),
(376, 225, 13),
(377, 226, 13),
(378, 227, 13),
(379, 228, 13),
(380, 229, 13),
(503, 229, 17),
(381, 230, 13),
(382, 231, 13),
(431, 231, 14),
(501, 231, 17),
(383, 232, 13),
(384, 233, 13),
(388, 234, 13),
(394, 235, 14),
(404, 236, 14),
(419, 237, 14),
(421, 238, 14),
(422, 239, 14),
(424, 240, 14),
(426, 241, 14),
(504, 241, 17),
(429, 242, 14),
(432, 243, 14),
(433, 244, 14),
(434, 245, 14),
(436, 246, 14),
(437, 247, 14),
(438, 248, 14),
(440, 249, 14),
(441, 250, 14),
(442, 251, 14),
(445, 252, 14),
(446, 253, 14),
(447, 254, 17),
(452, 255, 17),
(453, 256, 17),
(454, 257, 17),
(455, 258, 17),
(456, 259, 17),
(457, 260, 17),
(458, 261, 17),
(459, 262, 17),
(460, 263, 17),
(461, 264, 17),
(462, 265, 17),
(463, 266, 17),
(464, 267, 17),
(465, 268, 17),
(466, 269, 17),
(467, 270, 17),
(468, 271, 17),
(469, 272, 17),
(470, 273, 17),
(471, 274, 17),
(472, 275, 17),
(473, 276, 17),
(474, 277, 17),
(475, 278, 17),
(476, 279, 17),
(477, 280, 17),
(478, 281, 17),
(479, 282, 17),
(480, 283, 17),
(481, 284, 17),
(482, 285, 17),
(483, 286, 17),
(484, 287, 17),
(485, 288, 17),
(487, 289, 17),
(489, 290, 17),
(490, 291, 17),
(491, 292, 17),
(492, 293, 17),
(493, 294, 17),
(494, 295, 17),
(495, 296, 17),
(496, 297, 17),
(497, 298, 17),
(505, 299, 17),
(506, 300, 17),
(508, 301, 17),
(509, 302, 18),
(510, 303, 18),
(511, 304, 18),
(512, 305, 18),
(513, 306, 18),
(514, 307, 18),
(520, 308, 18),
(521, 309, 18),
(522, 310, 18),
(523, 311, 18),
(524, 312, 18),
(526, 313, 18),
(527, 314, 18),
(528, 315, 18),
(529, 316, 18),
(530, 317, 18),
(531, 318, 18),
(532, 319, 18),
(533, 320, 18),
(534, 321, 18),
(535, 322, 18),
(536, 323, 18),
(537, 324, 18),
(538, 325, 18),
(539, 326, 18),
(549, 327, 18),
(551, 328, 18),
(553, 329, 18),
(554, 330, 18),
(555, 331, 18),
(556, 332, 18),
(557, 333, 18),
(559, 334, 18),
(560, 335, 18),
(561, 336, 18),
(562, 337, 18),
(563, 338, 18),
(564, 339, 18),
(565, 340, 18),
(566, 341, 18),
(567, 342, 18),
(568, 343, 18),
(569, 344, 18),
(570, 345, 18),
(571, 346, 18),
(572, 347, 18),
(573, 348, 18),
(574, 349, 18),
(575, 350, 18),
(576, 351, 18),
(577, 352, 18),
(578, 353, 18),
(579, 354, 18),
(580, 355, 18),
(581, 356, 18),
(582, 357, 18),
(583, 358, 18),
(584, 359, 18),
(585, 360, 18),
(586, 361, 18),
(587, 362, 18),
(588, 363, 18),
(589, 364, 18),
(590, 365, 18),
(591, 366, 18),
(594, 367, 18),
(595, 368, 18),
(604, 369, 15),
(609, 370, 15),
(610, 371, 15),
(611, 372, 15),
(613, 373, 15),
(671, 373, 16),
(616, 374, 15),
(617, 375, 15),
(618, 376, 15),
(619, 377, 15),
(620, 378, 15),
(621, 379, 15),
(703, 379, 23),
(622, 380, 15),
(623, 381, 15),
(624, 382, 15),
(625, 383, 15),
(626, 384, 15),
(627, 385, 15),
(628, 386, 15),
(632, 387, 15),
(633, 388, 15),
(634, 389, 15),
(635, 390, 15),
(636, 391, 15),
(641, 392, 16),
(642, 393, 16),
(643, 394, 16),
(644, 395, 16),
(645, 396, 16),
(646, 397, 16),
(647, 398, 16),
(648, 399, 16),
(649, 400, 16),
(650, 401, 16),
(651, 402, 16),
(652, 403, 16),
(653, 404, 16),
(654, 405, 16),
(657, 406, 16),
(658, 407, 16),
(659, 408, 16),
(660, 409, 16),
(661, 410, 16),
(662, 411, 16),
(664, 412, 16),
(665, 413, 16),
(666, 414, 16),
(668, 415, 16),
(669, 416, 16),
(672, 417, 16),
(673, 418, 16),
(705, 418, 23),
(675, 419, 16),
(704, 419, 23),
(676, 420, 16),
(677, 421, 16),
(678, 422, 16),
(686, 423, 16),
(689, 424, 16),
(690, 425, 16),
(691, 426, 16),
(694, 427, 23),
(695, 428, 23),
(697, 429, 23),
(698, 430, 23),
(699, 431, 23),
(700, 432, 23),
(701, 433, 23),
(702, 434, 23),
(706, 435, 23),
(707, 436, 23),
(715, 437, 22),
(716, 438, 22),
(720, 439, 22),
(721, 440, 22),
(722, 441, 22),
(723, 442, 22),
(724, 443, 22);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','lecturer','student') NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `role`, `full_name`, `email`, `created_at`) VALUES
(1, '23070692', '$2y$10$QmZXehnWVxNf/EWDya3vwuZDenFV7DCyHH/hwBeXkDzthr3WGadwy', 'student', 'Lê Hoàng Anh', 'hoanganhle0320@gmail.com', '2026-05-12 04:52:39'),
(2, '123', '$2y$10$PnFrju3DZf3HyCsYVwrgfep64jT1VdD7J23c8IqVrcq3N4BX7etmW', 'admin', 'Trần Thị Khánh Huyền', 'tranthikhanhhuyen@vnu.edu.vn', '2026-05-12 04:53:48'),
(3, 'a1', '$2y$10$.hRlZexa4/aCa1/MkQpJHew/L1IFLJ6HaBdPUN8XRLQjv//XDYLiW', 'lecturer', 'Nguyễn Thị Phương Thuý', 'nguyenthiphuongthuy@vnu.edu.vn', '2026-05-12 04:54:21');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Chỉ mục cho bảng `attainment_reports`
--
ALTER TABLE `attainment_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `plo_id` (`plo_id`);

--
-- Chỉ mục cho bảng `clos`
--
ALTER TABLE `clos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Chỉ mục cho bảng `clo_plo_mappings`
--
ALTER TABLE `clo_plo_mappings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_clo_plo` (`clo_id`,`plo_id`),
  ADD KEY `idx_mapping_clo` (`clo_id`),
  ADD KEY `idx_mapping_plo` (`plo_id`);

--
-- Chỉ mục cho bảng `plos`
--
ALTER TABLE `plos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_id` (`program_id`);

--
-- Chỉ mục cho bảng `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `rubrics`
--
ALTER TABLE `rubrics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assessment_id` (`assessment_id`);

--
-- Chỉ mục cho bảng `rubric_criteria`
--
ALTER TABLE `rubric_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rubric_id` (`rubric_id`),
  ADD KEY `clo_id` (`clo_id`);

--
-- Chỉ mục cho bảng `score_ledger`
--
ALTER TABLE `score_ledger`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_current_hash` (`current_hash`),
  ADD KEY `graded_by` (`graded_by`),
  ADD KEY `idx_score_enrollment` (`enrollment_id`),
  ADD KEY `idx_score_criterion` (`criterion_id`);

--
-- Chỉ mục cho bảng `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_enrollment` (`student_id`,`subject_id`,`semester`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Chỉ mục cho bảng `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `subject_program_mapping`
--
ALTER TABLE `subject_program_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_mapping` (`subject_id`,`program_id`),
  ADD KEY `program_id` (`program_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `assessments`
--
ALTER TABLE `assessments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `attainment_reports`
--
ALTER TABLE `attainment_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `clos`
--
ALTER TABLE `clos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1121;

--
-- AUTO_INCREMENT cho bảng `clo_plo_mappings`
--
ALTER TABLE `clo_plo_mappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4089;

--
-- AUTO_INCREMENT cho bảng `plos`
--
ALTER TABLE `plos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT cho bảng `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `rubrics`
--
ALTER TABLE `rubrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `rubric_criteria`
--
ALTER TABLE `rubric_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `score_ledger`
--
ALTER TABLE `score_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `student_enrollments`
--
ALTER TABLE `student_enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;

--
-- AUTO_INCREMENT cho bảng `subject_program_mapping`
--
ALTER TABLE `subject_program_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=725;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `assessments`
--
ALTER TABLE `assessments`
  ADD CONSTRAINT `assessments_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `attainment_reports`
--
ALTER TABLE `attainment_reports`
  ADD CONSTRAINT `attainment_reports_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attainment_reports_ibfk_2` FOREIGN KEY (`plo_id`) REFERENCES `plos` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `clos`
--
ALTER TABLE `clos`
  ADD CONSTRAINT `clos_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `clo_plo_mappings`
--
ALTER TABLE `clo_plo_mappings`
  ADD CONSTRAINT `clo_plo_mappings_ibfk_1` FOREIGN KEY (`clo_id`) REFERENCES `clos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clo_plo_mappings_ibfk_2` FOREIGN KEY (`plo_id`) REFERENCES `plos` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `plos`
--
ALTER TABLE `plos`
  ADD CONSTRAINT `plos_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `rubrics`
--
ALTER TABLE `rubrics`
  ADD CONSTRAINT `rubrics_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `rubric_criteria`
--
ALTER TABLE `rubric_criteria`
  ADD CONSTRAINT `rubric_criteria_ibfk_1` FOREIGN KEY (`rubric_id`) REFERENCES `rubrics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rubric_criteria_ibfk_2` FOREIGN KEY (`clo_id`) REFERENCES `clos` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `score_ledger`
--
ALTER TABLE `score_ledger`
  ADD CONSTRAINT `score_ledger_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `student_enrollments` (`id`),
  ADD CONSTRAINT `score_ledger_ibfk_2` FOREIGN KEY (`criterion_id`) REFERENCES `rubric_criteria` (`id`),
  ADD CONSTRAINT `score_ledger_ibfk_3` FOREIGN KEY (`graded_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD CONSTRAINT `student_enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_enrollments_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `subject_program_mapping`
--
ALTER TABLE `subject_program_mapping`
  ADD CONSTRAINT `subject_program_mapping_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_program_mapping_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
