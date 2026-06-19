-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 19, 2026 lúc 12:00 PM
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
  `lecturer_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'attendance',
  `weight` decimal(5,2) NOT NULL DEFAULT 0.00,
  `max_score` decimal(5,2) NOT NULL DEFAULT 100.00,
  `semester` varchar(50) NOT NULL DEFAULT '2024-1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `assessments`
--

INSERT INTO `assessments` (`id`, `subject_id`, `lecturer_id`, `name`, `type`, `weight`, `max_score`, `semester`, `created_at`) VALUES
(1, 1, 2, 'Assignment 1 - PHP Basics', 'attendance', 10.00, 10.00, '2024-1', '2026-05-17 12:03:03'),
(2, 1, 2, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-1', '2026-05-17 12:03:03'),
(3, 1, 2, 'Final Project - Grading System', 'final', 60.00, 10.00, '2024-1', '2026-05-17 12:03:03'),
(4, 2, 2, 'Lab 1 - SQL Queries', 'attendance', 10.00, 10.00, '2024-1', '2026-05-17 12:03:03'),
(5, 2, 2, 'Midterm - Database Design', 'midterm', 30.00, 10.00, '2024-1', '2026-05-17 12:03:03'),
(6, 4, 7, 'Attendance & Participation', 'attendance', 10.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(7, 4, 7, 'Midterm - Pattern Analysis', 'midterm', 30.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(8, 4, 7, 'Final - Design Pattern Project', 'final', 60.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(9, 5, 3, 'Lab Attendance & Exercises', 'attendance', 10.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(10, 5, 3, 'Midterm - REST API Design', 'midterm', 30.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(11, 5, 3, 'Final - Full Stack Web App', 'final', 60.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(12, 6, 7, 'Lab Attendance - ML Notebooks', 'attendance', 10.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(13, 6, 7, 'Midterm - Supervised Learning', 'midterm', 30.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(14, 6, 7, 'Final - ML Pipeline Project', 'final', 60.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(15, 7, 2, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(16, 7, 2, 'Midterm - Algorithm Analysis', 'midterm', 30.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(17, 7, 2, 'Final - Algorithm Implementation', 'final', 60.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(18, 8, 3, 'Sprint Participation & Standups', 'attendance', 10.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(19, 8, 3, 'Midterm - Agile Planning Exam', 'midterm', 30.00, 10.00, '2024-1', '2026-06-17 10:26:14'),
(20, 8, 3, 'Final - Agile Project Delivery', 'final', 60.00, 10.00, '2024-1', '2026-06-17 10:26:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `table_name`, `record_id`, `details`, `ip_address`, `created_at`) VALUES
(1, 1, 'LOGIN', 'users', 1, 'Admin logged in', '127.0.0.1', '2026-05-17 12:03:03'),
(2, 2, 'LOGIN', 'users', 2, 'Lecturer1 logged in', '127.0.0.1', '2026-05-17 12:03:03'),
(3, 2, 'CREATE_ASSESSMENT', 'assessments', 1, 'Created: Assignment 1 - PHP Basics', '127.0.0.1', '2026-05-17 12:03:03'),
(4, 2, 'CREATE_ASSESSMENT', 'assessments', 2, 'Created: Midterm Exam', '127.0.0.1', '2026-05-17 12:03:03'),
(5, 2, 'CREATE_ASSESSMENT', 'assessments', 3, 'Created: Final Project - Grading System', '127.0.0.1', '2026-05-17 12:03:03'),
(6, 2, 'LEDGER_INSERT', 'score_ledger', 1, 'enrollment=1 criterion=1 score=8.5', '127.0.0.1', '2026-05-17 12:03:03'),
(7, 2, 'LEDGER_INSERT', 'score_ledger', 2, 'enrollment=1 criterion=2 score=7.0', '127.0.0.1', '2026-05-17 12:03:03'),
(8, 2, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '127.0.0.1', '2026-05-17 12:03:03'),
(9, 1, 'CREATE_USER', 'users', 4, 'Created user: student1', '127.0.0.1', '2026-05-17 12:03:03'),
(10, 1, 'ENROLL_STUDENT', 'student_enrollments', 1, 'student=4 subject=1', '127.0.0.1', '2026-05-17 12:03:03'),
(11, 2, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:04:18'),
(12, 2, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:04:29'),
(13, 2, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:04:40'),
(14, 2, 'LOGOUT', NULL, NULL, NULL, '::1', '2026-05-17 12:04:48'),
(15, 1, 'LOGOUT', NULL, NULL, NULL, '::1', '2026-05-17 12:06:40'),
(16, 2, 'LOGOUT', NULL, NULL, NULL, '::1', '2026-05-17 12:06:46'),
(17, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:07:29'),
(18, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:10:01'),
(19, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:10:16'),
(20, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:11:15'),
(21, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:11:17'),
(22, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:11:21'),
(23, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:11:31'),
(24, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:11:33'),
(25, 1, 'LOGOUT', NULL, NULL, NULL, '::1', '2026-05-17 12:11:36'),
(26, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:12:05'),
(27, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:12:49'),
(28, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:12:57'),
(29, 1, 'LOGIN', 'users', 1, 'Login: admin', '::1', '2026-06-17 10:19:27'),
(30, 1, 'LOGOUT', NULL, NULL, NULL, '::1', '2026-06-17 10:22:18'),
(31, 2, 'LOGIN', 'users', 2, 'Login: lecturer1', '::1', '2026-06-17 10:22:22'),
(32, 2, 'REQUEST_GRADE_CHANGE', 'grade_change_requests', 1, 'enrollment=29 criterion=33 old=7.50 new=8.5 reason=data entry error', '::1', '2026-06-17 10:27:27'),
(33, 2, 'LOGOUT', NULL, NULL, NULL, '::1', '2026-06-17 10:27:48'),
(34, 1, 'LOGIN', 'users', 1, 'Login: admin', '::1', '2026-06-17 10:27:53'),
(35, 1, 'LEDGER_UPDATE', 'score_ledger', NULL, 'enrollment=29 criterion=33 score=8.5 prev_score=7.5 approved_by=1 request_id=1', '::1', '2026-06-17 10:28:24'),
(36, 1, 'APPROVE_GRADE_CHANGE', 'grade_change_requests', 1, 'enrollment=29 criterion=33 old=7.5 new=8.5 approved_by=1', '::1', '2026-06-17 10:28:24'),
(37, 1, 'LOGOUT', NULL, NULL, NULL, '::1', '2026-06-17 10:28:27'),
(38, 10, 'LOGIN', 'users', 10, 'Login: student6', '::1', '2026-06-17 10:28:33'),
(39, 10, 'LOGOUT', NULL, NULL, NULL, '::1', '2026-06-17 10:40:54'),
(40, 1, 'LOGIN', 'users', 1, 'Login: admin', '::1', '2026-06-17 10:41:04'),
(41, 1, 'LOGOUT', NULL, NULL, NULL, '::1', '2026-06-17 10:47:28'),
(42, 2, 'LOGIN', 'users', 2, 'Login: lecturer1', '::1', '2026-06-17 10:47:35'),
(43, 2, 'LOGOUT', NULL, NULL, NULL, '::1', '2026-06-17 11:19:44'),
(44, 1, 'LOGIN', 'users', 1, 'Login: admin', '::1', '2026-06-17 11:19:50'),
(45, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-19 03:24:02'),
(46, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-19 04:34:35'),
(47, 2, 'LOGIN', 'users', 2, 'User logged in: lecturer1', '::1', '2026-06-19 04:34:41'),
(48, 2, 'REQUEST_GRADE_CHANGE', 'grade_change_requests', 2, NULL, '::1', '2026-06-19 04:54:48'),
(49, 2, 'LOGOUT', 'users', 2, 'User logged out: lecturer1', '::1', '2026-06-19 04:54:51'),
(50, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-19 04:54:57'),
(51, 1, 'LEDGER_UPDATE', 'score_ledger', NULL, 'enrollment=28 criterion=33 score=6.5 prev_score=6 approved_by=1 request_id=2', '::1', '2026-06-19 04:55:40'),
(52, 1, 'APPROVE_GRADE_CHANGE', 'grade_change_requests', 2, NULL, '::1', '2026-06-19 04:55:40'),
(53, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 222 entries. Violations: 20', '::1', '2026-06-19 04:56:14'),
(54, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-19 04:56:49'),
(55, 2, 'LOGIN', 'users', 2, 'User logged in: lecturer1', '::1', '2026-06-19 04:56:54'),
(56, 2, 'REQUEST_GRADE_CHANGE', 'grade_change_requests', 3, NULL, '::1', '2026-06-19 04:57:19'),
(57, 2, 'LOGOUT', 'users', 2, 'User logged out: lecturer1', '::1', '2026-06-19 04:57:24'),
(58, 10, 'LOGIN', 'users', 10, 'User logged in: student6', '::1', '2026-06-19 04:57:30'),
(59, 10, 'LOGOUT', 'users', 10, 'User logged out: student6', '::1', '2026-06-19 04:57:35'),
(60, 2, 'LOGIN', 'users', 2, 'User logged in: lecturer1', '::1', '2026-06-19 04:57:38'),
(61, 2, 'LOGOUT', 'users', 2, 'User logged out: lecturer1', '::1', '2026-06-19 04:59:46'),
(62, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-19 04:59:53'),
(63, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-19 05:00:23'),
(64, 10, 'LOGIN', 'users', 10, 'User logged in: student6', '::1', '2026-06-19 05:00:25'),
(65, 10, 'LOGOUT', 'users', 10, 'User logged out: student6', '::1', '2026-06-19 05:00:49'),
(66, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-19 05:00:52'),
(67, 1, 'REJECT_GRADE_CHANGE', 'grade_change_requests', 3, NULL, '::1', '2026-06-19 05:02:22'),
(68, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-19 05:11:16'),
(69, 2, 'LOGIN', 'users', 2, 'User logged in: lecturer1', '::1', '2026-06-19 05:11:23'),
(70, 2, 'REQUEST_GRADE_CHANGE', 'grade_change_requests', 4, NULL, '::1', '2026-06-19 05:11:52'),
(71, 2, 'LOGOUT', 'users', 2, 'User logged out: lecturer1', '::1', '2026-06-19 05:11:56'),
(72, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-19 05:11:58'),
(73, 1, 'LEDGER_UPDATE', 'score_ledger', NULL, 'enrollment=30 criterion=33 score=5 prev_score=7 approved_by=1 request_id=4', '::1', '2026-06-19 05:12:26'),
(74, 1, 'APPROVE_GRADE_CHANGE', 'grade_change_requests', 4, NULL, '::1', '2026-06-19 05:12:26'),
(75, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-19 05:13:50'),
(76, 2, 'LOGIN', 'users', 2, 'User logged in: lecturer1', '::1', '2026-06-19 05:13:55'),
(77, 2, 'LOGOUT', 'users', 2, 'User logged out: lecturer1', '::1', '2026-06-19 05:14:05'),
(78, 10, 'LOGIN', 'users', 10, 'User logged in: student6', '::1', '2026-06-19 05:14:08'),
(79, 10, 'LOGOUT', 'users', 10, 'User logged out: student6', '::1', '2026-06-19 05:19:36'),
(80, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-19 05:19:41');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `clos`
--

INSERT INTO `clos` (`id`, `subject_id`, `code`, `description`, `created_at`) VALUES
(1, 1, 'CLO1', 'Apply PHP and MySQL to build secure web applications', '2026-05-17 12:03:03'),
(2, 1, 'CLO2', 'Implement authentication and role-based access control', '2026-05-17 12:03:03'),
(3, 1, 'CLO3', 'Design and use hash-chain ledger for data integrity', '2026-05-17 12:03:03'),
(4, 1, 'CLO4', 'Apply OOP principles in PHP development', '2026-05-17 12:03:03'),
(5, 2, 'CLO1', 'Write complex SQL queries using JOIN and aggregation', '2026-05-17 12:03:03'),
(6, 2, 'CLO2', 'Design normalized relational database schemas', '2026-05-17 12:03:03'),
(7, 2, 'CLO3', 'Implement stored procedures and triggers', '2026-05-17 12:03:03'),
(8, 4, 'CLO1', 'Apply design patterns to solve software architecture problems', '2026-06-17 10:26:14'),
(9, 4, 'CLO2', 'Implement creational, structural and behavioral patterns', '2026-06-17 10:26:14'),
(10, 4, 'CLO3', 'Evaluate trade-offs between design patterns', '2026-06-17 10:26:14'),
(11, 5, 'CLO1', 'Build RESTful APIs with Node.js and Express', '2026-06-17 10:26:14'),
(12, 5, 'CLO2', 'Implement JWT authentication and authorization', '2026-06-17 10:26:14'),
(13, 5, 'CLO3', 'Deploy web applications using Docker and cloud services', '2026-06-17 10:26:14'),
(14, 6, 'CLO1', 'Apply supervised learning algorithms to real datasets', '2026-06-17 10:26:14'),
(15, 6, 'CLO2', 'Evaluate and tune machine learning model performance', '2026-06-17 10:26:14'),
(16, 6, 'CLO3', 'Implement neural networks using Python frameworks', '2026-06-17 10:26:14'),
(17, 7, 'CLO1', 'Analyze time and space complexity of algorithms', '2026-06-17 10:26:14'),
(18, 7, 'CLO2', 'Implement classic data structures from scratch', '2026-06-17 10:26:14'),
(19, 7, 'CLO3', 'Apply graph algorithms to solve problems', '2026-06-17 10:26:14'),
(20, 8, 'CLO1', 'Apply Scrum and Kanban in software projects', '2026-06-17 10:26:14'),
(21, 8, 'CLO2', 'Write user stories and manage product backlogs', '2026-06-17 10:26:14'),
(22, 8, 'CLO3', 'Conduct sprint reviews and retrospectives effectively', '2026-06-17 10:26:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `clo_plo_mappings`
--

CREATE TABLE `clo_plo_mappings` (
  `id` int(11) NOT NULL,
  `clo_id` int(11) NOT NULL,
  `plo_id` int(11) NOT NULL,
  `weight` decimal(5,2) NOT NULL DEFAULT 1.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `clo_plo_mappings`
--

INSERT INTO `clo_plo_mappings` (`id`, `clo_id`, `plo_id`, `weight`, `created_at`) VALUES
(1, 1, 2, 1.00, '2026-05-17 12:03:03'),
(2, 1, 1, 0.50, '2026-05-17 12:03:03'),
(3, 2, 3, 1.00, '2026-05-17 12:03:03'),
(4, 2, 1, 0.50, '2026-05-17 12:03:03'),
(5, 3, 3, 1.00, '2026-05-17 12:03:03'),
(6, 3, 1, 1.00, '2026-05-17 12:03:03'),
(7, 4, 1, 1.00, '2026-05-17 12:03:03'),
(8, 5, 1, 1.00, '2026-05-17 12:03:03'),
(9, 5, 2, 0.50, '2026-05-17 12:03:03'),
(10, 6, 2, 1.00, '2026-05-17 12:03:03'),
(11, 7, 2, 0.50, '2026-05-17 12:03:03'),
(12, 8, 5, 1.00, '2026-06-17 10:26:14'),
(13, 8, 6, 0.50, '2026-06-17 10:26:14'),
(14, 9, 5, 1.00, '2026-06-17 10:26:14'),
(15, 9, 6, 1.00, '2026-06-17 10:26:14'),
(16, 10, 5, 0.50, '2026-06-17 10:26:14'),
(17, 10, 6, 0.50, '2026-06-17 10:26:14'),
(18, 11, 2, 1.00, '2026-06-17 10:26:14'),
(19, 11, 1, 0.50, '2026-06-17 10:26:14'),
(20, 12, 2, 1.00, '2026-06-17 10:26:14'),
(21, 12, 11, 0.50, '2026-06-17 10:26:14'),
(22, 13, 1, 0.50, '2026-06-17 10:26:14'),
(23, 13, 2, 0.50, '2026-06-17 10:26:14'),
(24, 14, 7, 1.00, '2026-06-17 10:26:14'),
(25, 14, 9, 1.00, '2026-06-17 10:26:14'),
(26, 15, 9, 1.00, '2026-06-17 10:26:14'),
(27, 15, 8, 0.50, '2026-06-17 10:26:14'),
(28, 16, 9, 1.00, '2026-06-17 10:26:14'),
(29, 16, 7, 0.50, '2026-06-17 10:26:14'),
(30, 17, 8, 1.00, '2026-06-17 10:26:14'),
(31, 17, 7, 0.50, '2026-06-17 10:26:14'),
(32, 18, 8, 1.00, '2026-06-17 10:26:14'),
(33, 18, 7, 1.00, '2026-06-17 10:26:14'),
(34, 19, 8, 0.50, '2026-06-17 10:26:14'),
(35, 19, 7, 1.00, '2026-06-17 10:26:14'),
(36, 20, 12, 1.00, '2026-06-17 10:26:14'),
(37, 20, 5, 0.50, '2026-06-17 10:26:14'),
(38, 21, 12, 1.00, '2026-06-17 10:26:14'),
(39, 21, 5, 0.50, '2026-06-17 10:26:14'),
(40, 22, 12, 1.00, '2026-06-17 10:26:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `grade_change_requests`
--

CREATE TABLE `grade_change_requests` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `criterion_id` int(11) NOT NULL,
  `old_score` decimal(5,2) NOT NULL,
  `new_score` decimal(5,2) NOT NULL,
  `reason` text NOT NULL,
  `requested_by` int(11) NOT NULL,
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `reviewed_by` int(11) DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `review_note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `grade_change_requests`
--

INSERT INTO `grade_change_requests` (`id`, `enrollment_id`, `criterion_id`, `old_score`, `new_score`, `reason`, `requested_by`, `requested_at`, `status`, `reviewed_by`, `reviewed_at`, `review_note`) VALUES
(1, 29, 33, 7.50, 8.50, 'data entry error', 2, '2026-06-17 10:27:27', 'approved', 1, '2026-06-17 10:28:24', NULL),
(2, 28, 33, 6.00, 6.50, 'chấm lại', 2, '2026-06-19 04:54:48', 'approved', 1, '2026-06-19 04:55:40', ''),
(3, 30, 33, 7.00, 5.00, 're-evaluation', 2, '2026-06-19 04:57:19', 'rejected', 1, '2026-06-19 05:02:22', ''),
(4, 30, 33, 7.00, 5.00, 'appeal re-evaluation', 2, '2026-06-19 05:11:52', 'approved', 1, '2026-06-19 05:12:26', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('info','success','warning','danger') NOT NULL DEFAULT 'info',
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_by` text DEFAULT NULL,
  `dismissed_by` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `is_read`, `created_by`, `created_at`, `read_by`, `dismissed_by`) VALUES
(1, 1, 'New Grade Change Request', 'Lecturer Nguyễn Văn An has requested a grade change (Req #4).', 'warning', 1, 2, '2026-06-19 05:11:52', NULL, NULL),
(2, 2, 'Request Approved', 'Your grade change request for INS3080 has been approved.', 'success', 1, 1, '2026-06-19 05:12:26', NULL, NULL),
(3, 11, 'Grade Updated', 'Your grade for INS3080 (Weekly quiz performance) has been revised by Admin.', 'info', 0, 1, '2026-06-19 05:12:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plos`
--

CREATE TABLE `plos` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `plos`
--

INSERT INTO `plos` (`id`, `program_id`, `code`, `description`, `created_at`) VALUES
(1, 1, 'PLO1', 'Apply computing knowledge to solve IS problems', '2026-05-17 12:03:03'),
(2, 1, 'PLO2', 'Design and implement database-driven web applications', '2026-05-17 12:03:03'),
(3, 1, 'PLO3', 'Demonstrate critical thinking and problem-solving skills', '2026-05-17 12:03:03'),
(4, 1, 'PLO4', 'Work effectively in teams and communicate technical concepts', '2026-05-17 12:03:03'),
(5, 2, 'PLO1', 'Apply software engineering principles to develop quality software', '2026-05-17 12:03:03'),
(6, 2, 'PLO2', 'Design scalable and maintainable software architectures', '2026-05-17 12:03:03'),
(7, 3, 'PLO1', 'Apply theoretical computer science to solve practical problems', '2026-06-17 10:26:14'),
(8, 3, 'PLO2', 'Design and analyze efficient algorithms', '2026-06-17 10:26:14'),
(9, 3, 'PLO3', 'Demonstrate knowledge of machine learning techniques', '2026-06-17 10:26:14'),
(10, 4, 'PLO1', 'Identify and mitigate cybersecurity threats', '2026-06-17 10:26:14'),
(11, 4, 'PLO2', 'Design secure software systems', '2026-06-17 10:26:14'),
(12, 2, 'PLO3', 'Apply agile methodologies in software development', '2026-06-17 10:26:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `programs`
--

CREATE TABLE `programs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `programs`
--

INSERT INTO `programs` (`id`, `name`, `code`, `description`, `created_at`) VALUES
(1, 'Information Systems', 'IS', 'Chương trình Hệ thống Thông tin', '2026-05-17 12:03:03'),
(2, 'Software Engineering', 'SE', 'Chương trình Kỹ thuật Phần mềm', '2026-05-17 12:03:03'),
(3, 'Computer Science', 'CS', 'Chương trình Khoa học Máy tính', '2026-06-17 10:26:14'),
(4, 'Cybersecurity', 'CY', 'Chương trình An toàn thông tin', '2026-06-17 10:26:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rubrics`
--

CREATE TABLE `rubrics` (
  `id` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `rubrics`
--

INSERT INTO `rubrics` (`id`, `assessment_id`, `name`, `created_at`) VALUES
(1, 1, 'PHP Assignment Rubric', '2026-05-17 12:03:03'),
(2, 2, 'Midterm Exam Rubric', '2026-05-17 12:03:03'),
(3, 3, 'Final Project Rubric', '2026-05-17 12:03:03'),
(4, 4, 'SQL Lab Rubric', '2026-05-17 12:03:03'),
(5, 5, 'Database Design Rubric', '2026-05-17 12:03:03'),
(6, 6, 'SE3001 Attendance Rubric', '2026-06-17 10:26:14'),
(7, 7, 'SE3001 Midterm Rubric', '2026-06-17 10:26:14'),
(8, 8, 'SE3001 Final Rubric', '2026-06-17 10:26:14'),
(9, 9, 'INS4001 Attendance Rubric', '2026-06-17 10:26:14'),
(10, 10, 'INS4001 Midterm Rubric', '2026-06-17 10:26:14'),
(11, 11, 'INS4001 Final Rubric', '2026-06-17 10:26:14'),
(12, 12, 'INS4010 Attendance Rubric', '2026-06-17 10:26:14'),
(13, 13, 'INS4010 Midterm Rubric', '2026-06-17 10:26:14'),
(14, 14, 'INS4010 Final Rubric', '2026-06-17 10:26:14'),
(15, 15, 'INS3080 Attendance Rubric', '2026-06-17 10:26:14'),
(16, 16, 'INS3080 Midterm Rubric', '2026-06-17 10:26:14'),
(17, 17, 'INS3080 Final Rubric', '2026-06-17 10:26:14'),
(18, 18, 'SE4002 Attendance Rubric', '2026-06-17 10:26:14'),
(19, 19, 'SE4002 Midterm Rubric', '2026-06-17 10:26:14'),
(20, 20, 'SE4002 Final Rubric', '2026-06-17 10:26:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rubric_criteria`
--

CREATE TABLE `rubric_criteria` (
  `id` int(11) NOT NULL,
  `rubric_id` int(11) NOT NULL,
  `clo_id` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `max_score` decimal(5,2) NOT NULL DEFAULT 10.00,
  `weight_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `rubric_criteria`
--

INSERT INTO `rubric_criteria` (`id`, `rubric_id`, `clo_id`, `description`, `max_score`, `weight_percent`, `created_at`) VALUES
(1, 1, 1, 'PHP & MySQL implementation', 10.00, 60.00, '2026-05-17 12:03:03'),
(2, 1, 4, 'OOP design and code quality', 10.00, 40.00, '2026-05-17 12:03:03'),
(3, 2, 1, 'Web application functionality', 10.00, 50.00, '2026-05-17 12:03:03'),
(4, 2, 2, 'Authentication & security', 10.00, 50.00, '2026-05-17 12:03:03'),
(5, 3, 1, 'Backend logic & database', 10.00, 40.00, '2026-05-17 12:03:03'),
(6, 3, 2, 'Role-based access control', 10.00, 30.00, '2026-05-17 12:03:03'),
(7, 3, 3, 'Ledger hash chain integrity', 10.00, 30.00, '2026-05-17 12:03:03'),
(8, 4, 5, 'SQL query correctness', 10.00, 60.00, '2026-05-17 12:03:03'),
(9, 4, 6, 'Schema normalization', 10.00, 40.00, '2026-05-17 12:03:03'),
(10, 5, 6, 'ER diagram and normalization', 10.00, 50.00, '2026-05-17 12:03:03'),
(11, 5, 7, 'Stored procedures & triggers', 10.00, 50.00, '2026-05-17 12:03:03'),
(12, 6, 8, 'Class attendance and participation', 10.00, 50.00, '2026-06-17 10:26:14'),
(13, 6, 9, 'Pattern identification exercises', 10.00, 50.00, '2026-06-17 10:26:14'),
(14, 7, 8, 'Pattern theory and UML diagrams', 10.00, 50.00, '2026-06-17 10:26:14'),
(15, 7, 10, 'Trade-off analysis essay', 10.00, 50.00, '2026-06-17 10:26:14'),
(16, 8, 8, 'Pattern implementation quality', 10.00, 40.00, '2026-06-17 10:26:14'),
(17, 8, 9, 'Code structure and documentation', 10.00, 30.00, '2026-06-17 10:26:14'),
(18, 8, 10, 'Reflection and trade-off report', 10.00, 30.00, '2026-06-17 10:26:14'),
(19, 9, 11, 'API lab exercises completion', 10.00, 50.00, '2026-06-17 10:26:14'),
(20, 9, 12, 'Authentication implementation', 10.00, 50.00, '2026-06-17 10:26:14'),
(21, 10, 11, 'RESTful API design exam', 10.00, 50.00, '2026-06-17 10:26:14'),
(22, 10, 12, 'JWT & OAuth concepts', 10.00, 50.00, '2026-06-17 10:26:14'),
(23, 11, 11, 'Full stack app backend', 10.00, 40.00, '2026-06-17 10:26:14'),
(24, 11, 12, 'Authentication & role management', 10.00, 30.00, '2026-06-17 10:26:14'),
(25, 11, 13, 'Deployment and DevOps pipeline', 10.00, 30.00, '2026-06-17 10:26:14'),
(26, 12, 14, 'Jupyter notebook exercises', 10.00, 50.00, '2026-06-17 10:26:14'),
(27, 12, 15, 'Model evaluation participation', 10.00, 50.00, '2026-06-17 10:26:14'),
(28, 13, 14, 'Supervised learning theory', 10.00, 50.00, '2026-06-17 10:26:14'),
(29, 13, 15, 'Model selection and tuning', 10.00, 50.00, '2026-06-17 10:26:14'),
(30, 14, 14, 'Data preprocessing pipeline', 10.00, 35.00, '2026-06-17 10:26:14'),
(31, 14, 15, 'Model training and evaluation', 10.00, 35.00, '2026-06-17 10:26:14'),
(32, 14, 16, 'Neural network implementation', 10.00, 30.00, '2026-06-17 10:26:14'),
(33, 15, 17, 'Weekly quiz performance', 10.00, 50.00, '2026-06-17 10:26:14'),
(34, 15, 18, 'Data structure implementation labs', 10.00, 50.00, '2026-06-17 10:26:14'),
(35, 16, 17, 'Big-O analysis problems', 10.00, 50.00, '2026-06-17 10:26:14'),
(36, 16, 18, 'Linked list & tree operations', 10.00, 50.00, '2026-06-17 10:26:14'),
(37, 17, 17, 'Algorithm complexity report', 10.00, 35.00, '2026-06-17 10:26:14'),
(38, 17, 18, 'Custom data structure coding', 10.00, 35.00, '2026-06-17 10:26:14'),
(39, 17, 19, 'Graph algorithm implementation', 10.00, 30.00, '2026-06-17 10:26:14'),
(40, 18, 20, 'Sprint standup participation', 10.00, 50.00, '2026-06-17 10:26:14'),
(41, 18, 21, 'Backlog grooming exercises', 10.00, 50.00, '2026-06-17 10:26:14'),
(42, 19, 20, 'Agile methodology theory', 10.00, 50.00, '2026-06-17 10:26:14'),
(43, 19, 21, 'Sprint planning simulation', 10.00, 50.00, '2026-06-17 10:26:14'),
(44, 20, 20, 'Sprint execution and velocity', 10.00, 40.00, '2026-06-17 10:26:14'),
(45, 20, 21, 'Product backlog management', 10.00, 30.00, '2026-06-17 10:26:14'),
(46, 20, 22, 'Retrospective and improvement', 10.00, 30.00, '2026-06-17 10:26:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `score_ledger`
--

CREATE TABLE `score_ledger` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `criterion_id` int(11) NOT NULL,
  `score` decimal(5,2) NOT NULL,
  `data_snapshot` text NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL DEFAULT 'INSERT',
  `graded_by` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `previous_hash` varchar(64) NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000',
  `current_hash` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `score_ledger`
--

INSERT INTO `score_ledger` (`id`, `enrollment_id`, `criterion_id`, `score`, `data_snapshot`, `action`, `graded_by`, `timestamp`, `previous_hash`, `current_hash`) VALUES
(1, 1, 1, 8.50, '{\"enrollment_id\":1,\"criterion_id\":1,\"score\":8.5,\"action\":\"INSERT\",\"graded_by\":2,\"timestamp\":\"2024-01-15 09:00:00\"}', 'INSERT', 2, '2024-01-15 02:00:00', '0000000000000000000000000000000000000000000000000000000000000000', '517cfad7f9865841ad4b020b9ca084b835c6ac3bd166d3e06a7a7d346b04e76d'),
(2, 1, 2, 7.00, '{\"enrollment_id\":1,\"criterion_id\":2,\"score\":7.0,\"action\":\"INSERT\",\"graded_by\":2,\"timestamp\":\"2024-01-15 09:01:00\"}', 'INSERT', 2, '2024-01-15 02:01:00', '517cfad7f9865841ad4b020b9ca084b835c6ac3bd166d3e06a7a7d346b04e76d', 'aa85031753b3d8046080e25a7b8b8493b681e7d85c96ff00ca21c7aaed9f4a0c'),
(3, 1, 3, 7.50, '{\"enrollment_id\":1,\"criterion_id\":3,\"score\":7.5,\"action\":\"INSERT\",\"graded_by\":2,\"timestamp\":\"2024-01-15 09:02:00\"}', 'INSERT', 2, '2024-01-15 02:02:00', 'aa85031753b3d8046080e25a7b8b8493b681e7d85c96ff00ca21c7aaed9f4a0c', '16dbf57f1297276596b46d3706e4ba96ebdca43c2796ace2b40c0f9f9ff298ee'),
(4, 1, 4, 8.00, '{\"enrollment_id\":1,\"criterion_id\":4,\"score\":8.0,\"action\":\"INSERT\",\"graded_by\":2,\"timestamp\":\"2024-01-15 09:03:00\"}', 'INSERT', 2, '2024-01-15 02:03:00', '16dbf57f1297276596b46d3706e4ba96ebdca43c2796ace2b40c0f9f9ff298ee', 'edef6c71812f67abb14220fe1efdd2b9875a3efb8488ab862f1bc1c24b54e6fb'),
(5, 1, 5, 9.00, '{\"enrollment_id\":1,\"criterion_id\":5,\"score\":9.0,\"action\":\"INSERT\",\"graded_by\":2,\"timestamp\":\"2024-01-15 09:04:00\"}', 'INSERT', 2, '2024-01-15 02:04:00', 'edef6c71812f67abb14220fe1efdd2b9875a3efb8488ab862f1bc1c24b54e6fb', '42183fcadf8e7860b5b562f4ebe134d44222701f611cceabc1229f0d52b62e3b'),
(6, 1, 6, 8.50, '{\"enrollment_id\":1,\"criterion_id\":6,\"score\":8.5,\"action\":\"INSERT\",\"graded_by\":2,\"timestamp\":\"2024-01-15 09:05:00\"}', 'INSERT', 2, '2024-01-15 02:05:00', '42183fcadf8e7860b5b562f4ebe134d44222701f611cceabc1229f0d52b62e3b', '3f52897511f13fa5fad311d46abfa24b96cc08fa96ad13b1189db6dbc11cc6f2'),
(7, 1, 7, 9.50, '{\"enrollment_id\":1,\"criterion_id\":7,\"score\":9.5,\"action\":\"INSERT\",\"graded_by\":2,\"timestamp\":\"2024-01-15 09:06:00\"}', 'INSERT', 2, '2024-01-15 02:06:00', '3f52897511f13fa5fad311d46abfa24b96cc08fa96ad13b1189db6dbc11cc6f2', 'fc4ccbe489e11f62e1b58466c9ab3dc42d9687cc549b1cb7a62be2c6fa736abd'),
(8, 2, 1, 6.00, '{\"enrollment_id\":2,\"criterion_id\":1,\"score\":6.0,\"action\":\"INSERT\",\"graded_by\":2,\"timestamp\":\"2024-01-15 10:00:00\"}', 'INSERT', 2, '2024-01-15 03:00:00', 'fc4ccbe489e11f62e1b58466c9ab3dc42d9687cc549b1cb7a62be2c6fa736abd', '5eba65bb174bb8acd508caccf105a2031a707cbb2af60e5fb41b383765c01b9d'),
(9, 2, 5, 7.00, '{\"enrollment_id\":2,\"criterion_id\":5,\"score\":7.0,\"action\":\"INSERT\",\"graded_by\":2,\"timestamp\":\"2024-01-15 10:01:00\"}', 'INSERT', 2, '2024-01-15 03:01:00', '5eba65bb174bb8acd508caccf105a2031a707cbb2af60e5fb41b383765c01b9d', 'cdcdd7c978c66ea608ba6bd705afa1223b9d6fefd92a07a96c3401bdb325d43e'),
(10, 3, 7, 10.00, '{\"enrollment_id\":3,\"criterion_id\":7,\"score\":10.0,\"action\":\"INSERT\",\"graded_by\":2,\"timestamp\":\"2024-01-15 10:02:00\"}', 'INSERT', 2, '2024-01-15 03:02:00', 'cdcdd7c978c66ea608ba6bd705afa1223b9d6fefd92a07a96c3401bdb325d43e', '811ce8bdfa5bcc34d64ad517aa3251eb80590a89f0f07903b6664b6f50dc4f9b'),
(11, 6, 12, 8.50, '{\"enrollment_id\":6,\"criterion_id\":12,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:00:00\"}', 'INSERT', 7, '2024-03-01 01:00:00', '95e5dbfdd571c83f11209409726f28616305db8da53b68cf66eff456514ed614', '5887e708225b34be744b0290f297151b7b97a390a8e82214b911f8cc1933a888'),
(12, 6, 13, 7.00, '{\"enrollment_id\":6,\"criterion_id\":13,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:00:37\"}', 'INSERT', 7, '2024-03-01 01:00:37', '5887e708225b34be744b0290f297151b7b97a390a8e82214b911f8cc1933a888', '4e5b05220a46347ad5d9da1d39f0b950cd201667ba32aa9f7bb5b8c61ef6105e'),
(13, 7, 12, 7.00, '{\"enrollment_id\":7,\"criterion_id\":12,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:01:14\"}', 'INSERT', 7, '2024-03-01 01:01:14', '4e5b05220a46347ad5d9da1d39f0b950cd201667ba32aa9f7bb5b8c61ef6105e', '03f02a07563c26ef434b7b4e5da24b3c984d231fa6ee5041a80e77a8b2df0615'),
(14, 7, 13, 6.50, '{\"enrollment_id\":7,\"criterion_id\":13,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:01:51\"}', 'INSERT', 7, '2024-03-01 01:01:51', '03f02a07563c26ef434b7b4e5da24b3c984d231fa6ee5041a80e77a8b2df0615', 'a2bfa848929b180a763689beab29e60f8a95ab220cff9ca4f1f504a61d5d97c1'),
(15, 8, 12, 8.50, '{\"enrollment_id\":8,\"criterion_id\":12,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:02:28\"}', 'INSERT', 7, '2024-03-01 01:02:28', 'a2bfa848929b180a763689beab29e60f8a95ab220cff9ca4f1f504a61d5d97c1', 'be7ce5ba1486ef6677b2ba3e9b584c044698e61f0f344d777d96458aaaa10fc8'),
(16, 8, 13, 9.00, '{\"enrollment_id\":8,\"criterion_id\":13,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:03:05\"}', 'INSERT', 7, '2024-03-01 01:03:05', 'be7ce5ba1486ef6677b2ba3e9b584c044698e61f0f344d777d96458aaaa10fc8', '18b1c28ee4cd3eecb537d69d13fa63656f6e381e12e4e0afa9e1d3ca08e1019e'),
(17, 9, 12, 8.00, '{\"enrollment_id\":9,\"criterion_id\":12,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:03:42\"}', 'INSERT', 7, '2024-03-01 01:03:42', '18b1c28ee4cd3eecb537d69d13fa63656f6e381e12e4e0afa9e1d3ca08e1019e', '37a0585d22c449b96cf087c37bd1d2cc4da315236d759f3d1a63339ec493ae69'),
(18, 9, 13, 7.50, '{\"enrollment_id\":9,\"criterion_id\":13,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:04:19\"}', 'INSERT', 7, '2024-03-01 01:04:19', '37a0585d22c449b96cf087c37bd1d2cc4da315236d759f3d1a63339ec493ae69', '7bdac1d7d27bfa24bd46b85c717c5f40f9bbba5ea6267155fb3be0b32a7508b1'),
(19, 10, 12, 5.00, '{\"enrollment_id\":10,\"criterion_id\":12,\"score\":5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:04:56\"}', 'INSERT', 7, '2024-03-01 01:04:56', '7bdac1d7d27bfa24bd46b85c717c5f40f9bbba5ea6267155fb3be0b32a7508b1', '5dbd8731cb11ff2a668f7e1c89e7198c5ef417453255b7da6b82942ab3f36429'),
(20, 10, 13, 5.50, '{\"enrollment_id\":10,\"criterion_id\":13,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:05:33\"}', 'INSERT', 7, '2024-03-01 01:05:33', '5dbd8731cb11ff2a668f7e1c89e7198c5ef417453255b7da6b82942ab3f36429', 'e0bc3f795bab065123bd13c8a65816ef7126c8ea95d74a7d18e2b740ea44f1ea'),
(21, 6, 14, 9.00, '{\"enrollment_id\":6,\"criterion_id\":14,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:06:10\"}', 'INSERT', 7, '2024-03-01 01:06:10', 'e0bc3f795bab065123bd13c8a65816ef7126c8ea95d74a7d18e2b740ea44f1ea', '099cd07397b41ca7fce501a213b8cccf90a2fc49fd3d15f46569cb5d495fd776'),
(22, 6, 15, 8.50, '{\"enrollment_id\":6,\"criterion_id\":15,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:06:47\"}', 'INSERT', 7, '2024-03-01 01:06:47', '099cd07397b41ca7fce501a213b8cccf90a2fc49fd3d15f46569cb5d495fd776', '6facf3233de76e67c7da8e9aa75ea005746d75186d395fed78b28e279113d065'),
(23, 7, 14, 5.50, '{\"enrollment_id\":7,\"criterion_id\":14,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:07:24\"}', 'INSERT', 7, '2024-03-01 01:07:24', '6facf3233de76e67c7da8e9aa75ea005746d75186d395fed78b28e279113d065', 'aae9c559e0c1194833e69a0fda7b0ffa0ef37ee56d14f78f7c91604b58c67bef'),
(24, 7, 15, 6.00, '{\"enrollment_id\":7,\"criterion_id\":15,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:08:01\"}', 'INSERT', 7, '2024-03-01 01:08:01', 'aae9c559e0c1194833e69a0fda7b0ffa0ef37ee56d14f78f7c91604b58c67bef', 'df7c1067eb99f27cdbbb574459759ebeef44e14a3f9fb11849c2b27baaf48851'),
(25, 8, 14, 9.50, '{\"enrollment_id\":8,\"criterion_id\":14,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:08:38\"}', 'INSERT', 7, '2024-03-01 01:08:38', 'df7c1067eb99f27cdbbb574459759ebeef44e14a3f9fb11849c2b27baaf48851', '06ae1bbdca4a3cc79ddfffceff0f89eb06838e91de4552bc2fe22881720ed827'),
(26, 8, 15, 9.00, '{\"enrollment_id\":8,\"criterion_id\":15,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:09:15\"}', 'INSERT', 7, '2024-03-01 01:09:15', '06ae1bbdca4a3cc79ddfffceff0f89eb06838e91de4552bc2fe22881720ed827', '24325f14aec25465af6587a23ad3ed4c6aca6561728e20a95bcbc40fb16ddf46'),
(27, 9, 14, 7.00, '{\"enrollment_id\":9,\"criterion_id\":14,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:09:52\"}', 'INSERT', 7, '2024-03-01 01:09:52', '24325f14aec25465af6587a23ad3ed4c6aca6561728e20a95bcbc40fb16ddf46', 'db55926568f647039fae038a2d2df47a662a29b72f396e4757d64c20cb7a8d67'),
(28, 9, 15, 7.50, '{\"enrollment_id\":9,\"criterion_id\":15,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:10:29\"}', 'INSERT', 7, '2024-03-01 01:10:29', 'db55926568f647039fae038a2d2df47a662a29b72f396e4757d64c20cb7a8d67', 'b3be8e7f84c9e1e46e352c4482c8eefd659b084fbede1f0cab9989e307efabff'),
(29, 10, 14, 5.50, '{\"enrollment_id\":10,\"criterion_id\":14,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:11:06\"}', 'INSERT', 7, '2024-03-01 01:11:06', 'b3be8e7f84c9e1e46e352c4482c8eefd659b084fbede1f0cab9989e307efabff', 'fa299a85c1f84783cad4d53a604712ff9e80012b419451c9643112f796401b98'),
(30, 10, 15, 5.00, '{\"enrollment_id\":10,\"criterion_id\":15,\"score\":5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:11:43\"}', 'INSERT', 7, '2024-03-01 01:11:43', 'fa299a85c1f84783cad4d53a604712ff9e80012b419451c9643112f796401b98', '0d2bcc32b85c76bb39220ca6c4da2d5795d5e2cb1ef26d253d6d2736f5522f5f'),
(31, 6, 16, 8.00, '{\"enrollment_id\":6,\"criterion_id\":16,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:12:20\"}', 'INSERT', 7, '2024-03-01 01:12:20', '0d2bcc32b85c76bb39220ca6c4da2d5795d5e2cb1ef26d253d6d2736f5522f5f', '08ed3bf29e83a2540d91e9e0e7d76b8b18283a781e19a9a6fa4fb052748a4966'),
(32, 6, 17, 9.00, '{\"enrollment_id\":6,\"criterion_id\":17,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:12:57\"}', 'INSERT', 7, '2024-03-01 01:12:57', '08ed3bf29e83a2540d91e9e0e7d76b8b18283a781e19a9a6fa4fb052748a4966', '3265185944162c7ecab135e82a40c3a3214e9f5660746c2399e5012a2bf21878'),
(33, 6, 18, 8.50, '{\"enrollment_id\":6,\"criterion_id\":18,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:13:34\"}', 'INSERT', 7, '2024-03-01 01:13:34', '3265185944162c7ecab135e82a40c3a3214e9f5660746c2399e5012a2bf21878', '7a5cabc976108d8d2e41fb8af1cadb60741cd30defa5d24dcd23f5357ba68d67'),
(34, 7, 16, 5.50, '{\"enrollment_id\":7,\"criterion_id\":16,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:14:11\"}', 'INSERT', 7, '2024-03-01 01:14:11', '7a5cabc976108d8d2e41fb8af1cadb60741cd30defa5d24dcd23f5357ba68d67', 'bc764a7e82bd5eb5519e375c33b0d36bf0fec5a78f9d647da52548c154f3624d'),
(35, 7, 17, 6.50, '{\"enrollment_id\":7,\"criterion_id\":17,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:14:48\"}', 'INSERT', 7, '2024-03-01 01:14:48', 'bc764a7e82bd5eb5519e375c33b0d36bf0fec5a78f9d647da52548c154f3624d', '222bc67d8dcaeae2e29cbd2f5ee8cba166370a15eda9c93bf7a2973b73d11978'),
(36, 7, 18, 7.00, '{\"enrollment_id\":7,\"criterion_id\":18,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:15:25\"}', 'INSERT', 7, '2024-03-01 01:15:25', '222bc67d8dcaeae2e29cbd2f5ee8cba166370a15eda9c93bf7a2973b73d11978', 'b83e57d09515181efde1a2ff41843f4130537c88c2ab98ed3afb2097d42d50ee'),
(37, 8, 16, 9.00, '{\"enrollment_id\":8,\"criterion_id\":16,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:16:02\"}', 'INSERT', 7, '2024-03-01 01:16:02', 'b83e57d09515181efde1a2ff41843f4130537c88c2ab98ed3afb2097d42d50ee', '65e2c9edcf149c14a6c7b5d172c3004f8c46e77b09963836c18af5131e94d9da'),
(38, 8, 17, 8.50, '{\"enrollment_id\":8,\"criterion_id\":17,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:16:39\"}', 'INSERT', 7, '2024-03-01 01:16:39', '65e2c9edcf149c14a6c7b5d172c3004f8c46e77b09963836c18af5131e94d9da', '10e56ba477f6d315b258bf65cac0320ab167baa8547b717d4c509a293e2003fa'),
(39, 8, 18, 9.00, '{\"enrollment_id\":8,\"criterion_id\":18,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:17:16\"}', 'INSERT', 7, '2024-03-01 01:17:16', '10e56ba477f6d315b258bf65cac0320ab167baa8547b717d4c509a293e2003fa', 'c18ee604ff8f2af906a3c894dff2672a22165a7226d431c1bcc3180d1dc39b62'),
(40, 9, 16, 8.00, '{\"enrollment_id\":9,\"criterion_id\":16,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:17:53\"}', 'INSERT', 7, '2024-03-01 01:17:53', 'c18ee604ff8f2af906a3c894dff2672a22165a7226d431c1bcc3180d1dc39b62', 'b2f8ca3ee62660a969373ddb9505e6f3bf6760416aa56beaa037caec8763d905'),
(41, 9, 17, 7.50, '{\"enrollment_id\":9,\"criterion_id\":17,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:18:30\"}', 'INSERT', 7, '2024-03-01 01:18:30', 'b2f8ca3ee62660a969373ddb9505e6f3bf6760416aa56beaa037caec8763d905', 'f80dd293ec0f303778f666fd669cd7f0c314bad2e64313e627a9dafb5c925312'),
(42, 9, 18, 7.00, '{\"enrollment_id\":9,\"criterion_id\":18,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:19:07\"}', 'INSERT', 7, '2024-03-01 01:19:07', 'f80dd293ec0f303778f666fd669cd7f0c314bad2e64313e627a9dafb5c925312', '075b95876739bb0de6dec2888ba5319175b7f5bfc07c45425f0ce8e75210f866'),
(43, 10, 16, 6.00, '{\"enrollment_id\":10,\"criterion_id\":16,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:19:44\"}', 'INSERT', 7, '2024-03-01 01:19:44', '075b95876739bb0de6dec2888ba5319175b7f5bfc07c45425f0ce8e75210f866', '705de929e288cf37655725a0fb541a0adcd3df12b59ea05c3d5f5619fa03beb4'),
(44, 10, 17, 5.50, '{\"enrollment_id\":10,\"criterion_id\":17,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:20:21\"}', 'INSERT', 7, '2024-03-01 01:20:21', '705de929e288cf37655725a0fb541a0adcd3df12b59ea05c3d5f5619fa03beb4', '9b9ab833f5d5b645085f6b10c33e775a5c2ddff604de06caf1625b6e184ea246'),
(45, 10, 18, 5.00, '{\"enrollment_id\":10,\"criterion_id\":18,\"score\":5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:20:58\"}', 'INSERT', 7, '2024-03-01 01:20:58', '9b9ab833f5d5b645085f6b10c33e775a5c2ddff604de06caf1625b6e184ea246', 'e78a11890c5d0001af9ff4c9c9c151827fe6d5065392e7b9d1e69b80ccb8eb0b'),
(46, 11, 19, 8.00, '{\"enrollment_id\":11,\"criterion_id\":19,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:21:35\"}', 'INSERT', 3, '2024-03-01 01:21:35', 'e78a11890c5d0001af9ff4c9c9c151827fe6d5065392e7b9d1e69b80ccb8eb0b', '39441dfbfe9cfe767e82551adb49c5abcf6634a8461e85b86a49c77376a3244c'),
(47, 11, 20, 9.00, '{\"enrollment_id\":11,\"criterion_id\":20,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:22:12\"}', 'INSERT', 3, '2024-03-01 01:22:12', '39441dfbfe9cfe767e82551adb49c5abcf6634a8461e85b86a49c77376a3244c', 'c2c67370b3d6cacea201d75ae557ba3173c7f5a9fc8c6be716cd390c52002f9a'),
(48, 12, 19, 6.50, '{\"enrollment_id\":12,\"criterion_id\":19,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:22:49\"}', 'INSERT', 3, '2024-03-01 01:22:49', 'c2c67370b3d6cacea201d75ae557ba3173c7f5a9fc8c6be716cd390c52002f9a', 'c8b8c4956d0e88e5c7936726f545d4e9190cf3a6f8eaba9893deeb9d57a89da2'),
(49, 12, 20, 5.50, '{\"enrollment_id\":12,\"criterion_id\":20,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:23:26\"}', 'INSERT', 3, '2024-03-01 01:23:26', 'c8b8c4956d0e88e5c7936726f545d4e9190cf3a6f8eaba9893deeb9d57a89da2', 'c72f677197eb99fbd0c74e9c5775c789d4f80a8478bc172573f2c124f1e0b537'),
(50, 13, 19, 9.00, '{\"enrollment_id\":13,\"criterion_id\":19,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:24:03\"}', 'INSERT', 3, '2024-03-01 01:24:03', 'c72f677197eb99fbd0c74e9c5775c789d4f80a8478bc172573f2c124f1e0b537', '922fe98bae1fdadbf4e630a9fdd497e347b45cc8fb3a854f856d1452541366e9'),
(51, 13, 20, 9.50, '{\"enrollment_id\":13,\"criterion_id\":20,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:24:40\"}', 'INSERT', 3, '2024-03-01 01:24:40', '922fe98bae1fdadbf4e630a9fdd497e347b45cc8fb3a854f856d1452541366e9', 'af34ce1102c19b1d91687d0a756fabd4aa3ea32aabfa93cd88f0ca5f22c42ae1'),
(52, 14, 19, 7.50, '{\"enrollment_id\":14,\"criterion_id\":19,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:25:17\"}', 'INSERT', 3, '2024-03-01 01:25:17', 'af34ce1102c19b1d91687d0a756fabd4aa3ea32aabfa93cd88f0ca5f22c42ae1', 'aed563695f5c3cfac6acb5aa914d03f1b6937a878bcd9b25efdd8aac80d8d5e2'),
(53, 14, 20, 7.00, '{\"enrollment_id\":14,\"criterion_id\":20,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:25:54\"}', 'INSERT', 3, '2024-03-01 01:25:54', 'aed563695f5c3cfac6acb5aa914d03f1b6937a878bcd9b25efdd8aac80d8d5e2', '9b670d0dd41364ce12f1efd674485fc293d0945b24c5c7c0110df112a7166255'),
(54, 15, 19, 5.50, '{\"enrollment_id\":15,\"criterion_id\":19,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:26:31\"}', 'INSERT', 3, '2024-03-01 01:26:31', '9b670d0dd41364ce12f1efd674485fc293d0945b24c5c7c0110df112a7166255', '5842c608a269832f72858ab7d10491427870a1fe001e36cd3c86edbd8e12ecc4'),
(55, 15, 20, 6.00, '{\"enrollment_id\":15,\"criterion_id\":20,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:27:08\"}', 'INSERT', 3, '2024-03-01 01:27:08', '5842c608a269832f72858ab7d10491427870a1fe001e36cd3c86edbd8e12ecc4', '54f6ad3705e007073bf5520c54fbe339b26941371df1ee1f133d8ae812597d26'),
(56, 16, 19, 8.00, '{\"enrollment_id\":16,\"criterion_id\":19,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:27:45\"}', 'INSERT', 3, '2024-03-01 01:27:45', '54f6ad3705e007073bf5520c54fbe339b26941371df1ee1f133d8ae812597d26', '8f9639352ceee073fbe5f0483b33be07405154968c925ecd6caa92911eb66aba'),
(57, 16, 20, 7.50, '{\"enrollment_id\":16,\"criterion_id\":20,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:28:22\"}', 'INSERT', 3, '2024-03-01 01:28:22', '8f9639352ceee073fbe5f0483b33be07405154968c925ecd6caa92911eb66aba', 'e0ca104daeb0feab2a914ae17e08c72c8e3f5a1fbac62a9076dcc234ebabe490'),
(58, 17, 19, 7.50, '{\"enrollment_id\":17,\"criterion_id\":19,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:28:59\"}', 'INSERT', 3, '2024-03-01 01:28:59', 'e0ca104daeb0feab2a914ae17e08c72c8e3f5a1fbac62a9076dcc234ebabe490', '3bb4c02edde4898a7466d1fb0c28b848faa95e72b22d43df4b10447db501beaa'),
(59, 17, 20, 7.00, '{\"enrollment_id\":17,\"criterion_id\":20,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:29:36\"}', 'INSERT', 3, '2024-03-01 01:29:36', '3bb4c02edde4898a7466d1fb0c28b848faa95e72b22d43df4b10447db501beaa', 'f707d35c9daeb881e326876a6008a5833eee4f52d4558201489ab28a821e7d0c'),
(60, 11, 21, 7.50, '{\"enrollment_id\":11,\"criterion_id\":21,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:30:13\"}', 'INSERT', 3, '2024-03-01 01:30:13', 'f707d35c9daeb881e326876a6008a5833eee4f52d4558201489ab28a821e7d0c', '467c5740cfc8cbf3135e36f3931c2a4d7c0f7a42f5faea4b40b448f1d447abb9'),
(61, 11, 22, 8.00, '{\"enrollment_id\":11,\"criterion_id\":22,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:30:50\"}', 'INSERT', 3, '2024-03-01 01:30:50', '467c5740cfc8cbf3135e36f3931c2a4d7c0f7a42f5faea4b40b448f1d447abb9', 'a77fd6ff88a5ce78d8fc423cfa7f7156b815baad4a6c855f501738898628c376'),
(62, 12, 21, 7.00, '{\"enrollment_id\":12,\"criterion_id\":21,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:31:27\"}', 'INSERT', 3, '2024-03-01 01:31:27', 'a77fd6ff88a5ce78d8fc423cfa7f7156b815baad4a6c855f501738898628c376', '25488189b1af8ef10089356afaa96cdecc0c11ff9e05b1e57baa0c7924c4484f'),
(63, 12, 22, 6.50, '{\"enrollment_id\":12,\"criterion_id\":22,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:32:04\"}', 'INSERT', 3, '2024-03-01 01:32:04', '25488189b1af8ef10089356afaa96cdecc0c11ff9e05b1e57baa0c7924c4484f', 'c61a6e20b1058634bd97a5f4c33f3280a6cc8c1eb901c167f90485518c1af72d'),
(64, 13, 21, 8.50, '{\"enrollment_id\":13,\"criterion_id\":21,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:32:41\"}', 'INSERT', 3, '2024-03-01 01:32:41', 'c61a6e20b1058634bd97a5f4c33f3280a6cc8c1eb901c167f90485518c1af72d', '9fee0180558758625de2512537327ce9b9b0e0962e674455d71a7c92c11daabb'),
(65, 13, 22, 9.00, '{\"enrollment_id\":13,\"criterion_id\":22,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:33:18\"}', 'INSERT', 3, '2024-03-01 01:33:18', '9fee0180558758625de2512537327ce9b9b0e0962e674455d71a7c92c11daabb', '96cd74411497aec528ff9a594992716da326d1b1caa084d0dbbc08e2127e8317'),
(66, 14, 21, 8.50, '{\"enrollment_id\":14,\"criterion_id\":21,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:33:55\"}', 'INSERT', 3, '2024-03-01 01:33:55', '96cd74411497aec528ff9a594992716da326d1b1caa084d0dbbc08e2127e8317', '80a70ec732f089f4486825a090aa5cfcabd1e80055f659f01a7c2d62f1232900'),
(67, 14, 22, 7.50, '{\"enrollment_id\":14,\"criterion_id\":22,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:34:32\"}', 'INSERT', 3, '2024-03-01 01:34:32', '80a70ec732f089f4486825a090aa5cfcabd1e80055f659f01a7c2d62f1232900', '6749e19b2a8747fd04fc20faf4be5630e098e55fd5cf71f2142e8de1492616cb'),
(68, 15, 21, 5.00, '{\"enrollment_id\":15,\"criterion_id\":21,\"score\":5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:35:09\"}', 'INSERT', 3, '2024-03-01 01:35:09', '6749e19b2a8747fd04fc20faf4be5630e098e55fd5cf71f2142e8de1492616cb', '3785d174069af39761e6fae2c98c73fa07c3843a13218b776bc8e6ccac58dd2b'),
(69, 15, 22, 5.50, '{\"enrollment_id\":15,\"criterion_id\":22,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:35:46\"}', 'INSERT', 3, '2024-03-01 01:35:46', '3785d174069af39761e6fae2c98c73fa07c3843a13218b776bc8e6ccac58dd2b', '85c0277bf61fac3940af38a21059d4dfc045829f3782b5d445a558dc437cec02'),
(70, 16, 21, 8.50, '{\"enrollment_id\":16,\"criterion_id\":21,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:36:23\"}', 'INSERT', 3, '2024-03-01 01:36:23', '85c0277bf61fac3940af38a21059d4dfc045829f3782b5d445a558dc437cec02', 'e03f53dcdb88b5e9e5cafced0c9b49ea6c5cd37a43d002260f9a6199523ae3d9'),
(71, 16, 22, 8.00, '{\"enrollment_id\":16,\"criterion_id\":22,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:37:00\"}', 'INSERT', 3, '2024-03-01 01:37:00', 'e03f53dcdb88b5e9e5cafced0c9b49ea6c5cd37a43d002260f9a6199523ae3d9', 'f6ad391be1a878cbcceb3d11db68bac6849de62c295e0015c899242912b59037'),
(72, 17, 21, 6.50, '{\"enrollment_id\":17,\"criterion_id\":21,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:37:37\"}', 'INSERT', 3, '2024-03-01 01:37:37', 'f6ad391be1a878cbcceb3d11db68bac6849de62c295e0015c899242912b59037', 'd94b99ea750990da1533b7b46ab8cd6f3580c6c17d36afae80562707cbd87b3e'),
(73, 17, 22, 7.50, '{\"enrollment_id\":17,\"criterion_id\":22,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:38:14\"}', 'INSERT', 3, '2024-03-01 01:38:14', 'd94b99ea750990da1533b7b46ab8cd6f3580c6c17d36afae80562707cbd87b3e', '69ef99ecf7ec89c673d5c06faf911d8c2a80d45ae8b047f9c170d6e640e1261e'),
(74, 11, 23, 9.00, '{\"enrollment_id\":11,\"criterion_id\":23,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:38:51\"}', 'INSERT', 3, '2024-03-01 01:38:51', '69ef99ecf7ec89c673d5c06faf911d8c2a80d45ae8b047f9c170d6e640e1261e', 'd44168afe89da9f50326401d34b54615f803540c5a970c584ad6d51a2cd5be50'),
(75, 11, 24, 7.50, '{\"enrollment_id\":11,\"criterion_id\":24,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:39:28\"}', 'INSERT', 3, '2024-03-01 01:39:28', 'd44168afe89da9f50326401d34b54615f803540c5a970c584ad6d51a2cd5be50', '666809ff696b974a36b44c8b2188921c0618685412e03a2ad58eb91c21f01939'),
(76, 11, 25, 8.00, '{\"enrollment_id\":11,\"criterion_id\":25,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:40:05\"}', 'INSERT', 3, '2024-03-01 01:40:05', '666809ff696b974a36b44c8b2188921c0618685412e03a2ad58eb91c21f01939', '7ba2e7666c928d7167c15483bdd6a56bab8e3b88f15998b337628d57aecc3430'),
(77, 12, 23, 7.00, '{\"enrollment_id\":12,\"criterion_id\":23,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:40:42\"}', 'INSERT', 3, '2024-03-01 01:40:42', '7ba2e7666c928d7167c15483bdd6a56bab8e3b88f15998b337628d57aecc3430', '05a116a080f1bf60ebada8461512e0951070715b6157c9ccc38b91caa1552824'),
(78, 12, 24, 6.50, '{\"enrollment_id\":12,\"criterion_id\":24,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:41:19\"}', 'INSERT', 3, '2024-03-01 01:41:19', '05a116a080f1bf60ebada8461512e0951070715b6157c9ccc38b91caa1552824', 'bb04ef5cc9c8591dd8ab430fe0ae346fc0d19baa964aca2199231fdcee2751ba'),
(79, 12, 25, 5.50, '{\"enrollment_id\":12,\"criterion_id\":25,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:41:56\"}', 'INSERT', 3, '2024-03-01 01:41:56', 'bb04ef5cc9c8591dd8ab430fe0ae346fc0d19baa964aca2199231fdcee2751ba', '6d424ef4942cad65123445dca15ba88561a8d950d25db5efc76604cc20f8b6fa'),
(80, 13, 23, 9.00, '{\"enrollment_id\":13,\"criterion_id\":23,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:42:33\"}', 'INSERT', 3, '2024-03-01 01:42:33', '6d424ef4942cad65123445dca15ba88561a8d950d25db5efc76604cc20f8b6fa', 'da21a882c1e6e0541452dee24740117d2f3f80e4971b1ef4ae6eadaf9ff3225e'),
(81, 13, 24, 9.50, '{\"enrollment_id\":13,\"criterion_id\":24,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:43:10\"}', 'INSERT', 3, '2024-03-01 01:43:10', 'da21a882c1e6e0541452dee24740117d2f3f80e4971b1ef4ae6eadaf9ff3225e', 'aaff9fa900347f88623008fcb595e71e83050ac84d6dc2195d074d273727052c'),
(82, 13, 25, 9.00, '{\"enrollment_id\":13,\"criterion_id\":25,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:43:47\"}', 'INSERT', 3, '2024-03-01 01:43:47', 'aaff9fa900347f88623008fcb595e71e83050ac84d6dc2195d074d273727052c', 'a8a489f70a27279571390a2964b0f85218f5ca882aa913fb1f84b0e67913d876'),
(83, 14, 23, 7.00, '{\"enrollment_id\":14,\"criterion_id\":23,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:44:24\"}', 'INSERT', 3, '2024-03-01 01:44:24', 'a8a489f70a27279571390a2964b0f85218f5ca882aa913fb1f84b0e67913d876', '056224da335ca4bb0fd698d80832ded77d3e54ec5ea8f05e1e0dc412a12c8476'),
(84, 14, 24, 7.50, '{\"enrollment_id\":14,\"criterion_id\":24,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:45:01\"}', 'INSERT', 3, '2024-03-01 01:45:01', '056224da335ca4bb0fd698d80832ded77d3e54ec5ea8f05e1e0dc412a12c8476', 'e7d0550cd199faf48c679a9edee0fd1525cb966742025536b64580aa91256612'),
(85, 14, 25, 8.00, '{\"enrollment_id\":14,\"criterion_id\":25,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:45:38\"}', 'INSERT', 3, '2024-03-01 01:45:38', 'e7d0550cd199faf48c679a9edee0fd1525cb966742025536b64580aa91256612', '670fa53d0fe44ef01a45248fb25b9ed52b3eb571e69fbf2e671202dd3ce2185b'),
(86, 15, 23, 5.00, '{\"enrollment_id\":15,\"criterion_id\":23,\"score\":5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:46:15\"}', 'INSERT', 3, '2024-03-01 01:46:15', '670fa53d0fe44ef01a45248fb25b9ed52b3eb571e69fbf2e671202dd3ce2185b', '5d4e1d72fd11471aba3a638a87db6385e27a7160e554f554f23c48aa2b7434ab'),
(87, 15, 24, 5.50, '{\"enrollment_id\":15,\"criterion_id\":24,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:46:52\"}', 'INSERT', 3, '2024-03-01 01:46:52', '5d4e1d72fd11471aba3a638a87db6385e27a7160e554f554f23c48aa2b7434ab', '41be794eca58fa370e1a823f8237e42fdc2d0d06a08968cf5f9d961b10a6d115'),
(88, 15, 25, 6.00, '{\"enrollment_id\":15,\"criterion_id\":25,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:47:29\"}', 'INSERT', 3, '2024-03-01 01:47:29', '41be794eca58fa370e1a823f8237e42fdc2d0d06a08968cf5f9d961b10a6d115', '3568907d42e7515ca55f3bad0ff8b1fdda6c8e79fdc141e015521c6c03689b3d'),
(89, 16, 23, 8.00, '{\"enrollment_id\":16,\"criterion_id\":23,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:48:06\"}', 'INSERT', 3, '2024-03-01 01:48:06', '3568907d42e7515ca55f3bad0ff8b1fdda6c8e79fdc141e015521c6c03689b3d', '9919bafd0138a0246b497e26204cd3838078e9fdbf397dcb2bb3ef98bc8d89d7'),
(90, 16, 24, 7.50, '{\"enrollment_id\":16,\"criterion_id\":24,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:48:43\"}', 'INSERT', 3, '2024-03-01 01:48:43', '9919bafd0138a0246b497e26204cd3838078e9fdbf397dcb2bb3ef98bc8d89d7', '4f9b8ecd9cf5a4331113cef89e9ff9146bebeef074d4fdc9c1536f4e7fc2f26d'),
(91, 16, 25, 8.00, '{\"enrollment_id\":16,\"criterion_id\":25,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:49:20\"}', 'INSERT', 3, '2024-03-01 01:49:20', '4f9b8ecd9cf5a4331113cef89e9ff9146bebeef074d4fdc9c1536f4e7fc2f26d', '69e7e88cf0488bac5b002cdef2fdb844e66955bd21c6320bcb0a914763173307'),
(92, 17, 23, 7.50, '{\"enrollment_id\":17,\"criterion_id\":23,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:49:57\"}', 'INSERT', 3, '2024-03-01 01:49:57', '69e7e88cf0488bac5b002cdef2fdb844e66955bd21c6320bcb0a914763173307', '33f5dd35ec6a0246687e14d17a0a2f1300f533f3927290d38eb9d39bc8285045'),
(93, 17, 24, 7.00, '{\"enrollment_id\":17,\"criterion_id\":24,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:50:34\"}', 'INSERT', 3, '2024-03-01 01:50:34', '33f5dd35ec6a0246687e14d17a0a2f1300f533f3927290d38eb9d39bc8285045', '6d94d280411c1dcd2e903f76aacb172076c093fa6dc3d626f61355aa262699cd'),
(94, 17, 25, 6.50, '{\"enrollment_id\":17,\"criterion_id\":25,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:51:11\"}', 'INSERT', 3, '2024-03-01 01:51:11', '6d94d280411c1dcd2e903f76aacb172076c093fa6dc3d626f61355aa262699cd', '2bea033ac75526d8e2d992665233ac7645fa3b0f3e7381cddbd13edc901f8ec5'),
(95, 18, 26, 8.00, '{\"enrollment_id\":18,\"criterion_id\":26,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:51:48\"}', 'INSERT', 7, '2024-03-01 01:51:48', '2bea033ac75526d8e2d992665233ac7645fa3b0f3e7381cddbd13edc901f8ec5', '1bfaa4e7926143243a78ef9c6fbeb1a823868e809beac71c9d444e29da9d4c5b'),
(96, 18, 27, 9.00, '{\"enrollment_id\":18,\"criterion_id\":27,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:52:25\"}', 'INSERT', 7, '2024-03-01 01:52:25', '1bfaa4e7926143243a78ef9c6fbeb1a823868e809beac71c9d444e29da9d4c5b', 'fee77ca83750831d44aa4dd57d4f1cffd8bade29d25b031ea4a21721e3b68657'),
(97, 19, 26, 6.50, '{\"enrollment_id\":19,\"criterion_id\":26,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:53:02\"}', 'INSERT', 7, '2024-03-01 01:53:02', 'fee77ca83750831d44aa4dd57d4f1cffd8bade29d25b031ea4a21721e3b68657', '07d00fc3ef2a81d5de7e1cc7c26857fc5302199d4b7bd7d947ea85fd9de7fdb4'),
(98, 19, 27, 5.50, '{\"enrollment_id\":19,\"criterion_id\":27,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:53:39\"}', 'INSERT', 7, '2024-03-01 01:53:39', '07d00fc3ef2a81d5de7e1cc7c26857fc5302199d4b7bd7d947ea85fd9de7fdb4', '9cf63536919324c88993538e19eb12d20df92d9a6d494ce7c29b6b066a83db2a'),
(99, 20, 26, 9.00, '{\"enrollment_id\":20,\"criterion_id\":26,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:54:16\"}', 'INSERT', 7, '2024-03-01 01:54:16', '9cf63536919324c88993538e19eb12d20df92d9a6d494ce7c29b6b066a83db2a', '34de406a16416b0a10d01667fc2142821539ebbcd5677b7787ec07e974499923'),
(100, 20, 27, 9.50, '{\"enrollment_id\":20,\"criterion_id\":27,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:54:53\"}', 'INSERT', 7, '2024-03-01 01:54:53', '34de406a16416b0a10d01667fc2142821539ebbcd5677b7787ec07e974499923', '4cdafd06c2c23b4dcdc5db833ca55dc23a6600c845e2cd91097b8efaed15de07'),
(101, 21, 26, 7.50, '{\"enrollment_id\":21,\"criterion_id\":26,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:55:30\"}', 'INSERT', 7, '2024-03-01 01:55:30', '4cdafd06c2c23b4dcdc5db833ca55dc23a6600c845e2cd91097b8efaed15de07', '26a97f6085a387e1b4e8918c76621f1d4a5eca1ed8a2142dec780d4348817d9f'),
(102, 21, 27, 7.00, '{\"enrollment_id\":21,\"criterion_id\":27,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:56:07\"}', 'INSERT', 7, '2024-03-01 01:56:07', '26a97f6085a387e1b4e8918c76621f1d4a5eca1ed8a2142dec780d4348817d9f', '825d852c01150fe8fd20500ef2c681c19f07ddbdb46058da152703740d79caf8'),
(103, 22, 26, 6.00, '{\"enrollment_id\":22,\"criterion_id\":26,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:56:44\"}', 'INSERT', 7, '2024-03-01 01:56:44', '825d852c01150fe8fd20500ef2c681c19f07ddbdb46058da152703740d79caf8', 'dafe857af83fbd297d1485b5e03152f6f2a1434a096170d947fa840b2b491855'),
(104, 22, 27, 5.50, '{\"enrollment_id\":22,\"criterion_id\":27,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:57:21\"}', 'INSERT', 7, '2024-03-01 01:57:21', 'dafe857af83fbd297d1485b5e03152f6f2a1434a096170d947fa840b2b491855', 'e1a10de743d5811a112eeeb2f7d360bef53db112e4e61b4e4eaa20f128355a8f'),
(105, 23, 26, 7.50, '{\"enrollment_id\":23,\"criterion_id\":26,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:57:58\"}', 'INSERT', 7, '2024-03-01 01:57:58', 'e1a10de743d5811a112eeeb2f7d360bef53db112e4e61b4e4eaa20f128355a8f', '779b2a086e01fca1a74edab92eb4ced471d2ad7d134d148407a9dd807879c056'),
(106, 23, 27, 8.00, '{\"enrollment_id\":23,\"criterion_id\":27,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:58:35\"}', 'INSERT', 7, '2024-03-01 01:58:35', '779b2a086e01fca1a74edab92eb4ced471d2ad7d134d148407a9dd807879c056', '5253f9ecdd598508271d90222f7a82a094f6b05109e1961ecbd15618b7fd6bcd'),
(107, 18, 28, 9.00, '{\"enrollment_id\":18,\"criterion_id\":28,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:59:12\"}', 'INSERT', 7, '2024-03-01 01:59:12', '5253f9ecdd598508271d90222f7a82a094f6b05109e1961ecbd15618b7fd6bcd', '81ce9c08e197aa491ba1a5aa2b9f80540472053352ee2c85050bdbda1a7f1846'),
(108, 18, 29, 8.50, '{\"enrollment_id\":18,\"criterion_id\":29,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 08:59:49\"}', 'INSERT', 7, '2024-03-01 01:59:49', '81ce9c08e197aa491ba1a5aa2b9f80540472053352ee2c85050bdbda1a7f1846', '75aa523559a04e9e261f321421d422b8132396d24f590d8af0c3cd3a23c6ce3d'),
(109, 19, 28, 5.50, '{\"enrollment_id\":19,\"criterion_id\":28,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:00:26\"}', 'INSERT', 7, '2024-03-01 02:00:26', '75aa523559a04e9e261f321421d422b8132396d24f590d8af0c3cd3a23c6ce3d', '07ade984a6028dde8d7786292a03158cf1eef21ec9e6ea9afd7695472f1a341d'),
(110, 19, 29, 6.50, '{\"enrollment_id\":19,\"criterion_id\":29,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:01:03\"}', 'INSERT', 7, '2024-03-01 02:01:03', '07ade984a6028dde8d7786292a03158cf1eef21ec9e6ea9afd7695472f1a341d', 'aeee18caf986a39b9fa69bdec7ac947a63a709be5db3cf24b1ad1a67d0086910'),
(111, 20, 28, 9.50, '{\"enrollment_id\":20,\"criterion_id\":28,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:01:40\"}', 'INSERT', 7, '2024-03-01 02:01:40', 'aeee18caf986a39b9fa69bdec7ac947a63a709be5db3cf24b1ad1a67d0086910', 'df44c85613905993d538123c861ddaf230b0eeab37fb8dc8edc0a8e0bfcf75b1'),
(112, 20, 29, 9.00, '{\"enrollment_id\":20,\"criterion_id\":29,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:02:17\"}', 'INSERT', 7, '2024-03-01 02:02:17', 'df44c85613905993d538123c861ddaf230b0eeab37fb8dc8edc0a8e0bfcf75b1', '41142b7768a7deb51395051400aedc8871469f6f6624cf851a95934e0ea38284'),
(113, 21, 28, 7.00, '{\"enrollment_id\":21,\"criterion_id\":28,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:02:54\"}', 'INSERT', 7, '2024-03-01 02:02:54', '41142b7768a7deb51395051400aedc8871469f6f6624cf851a95934e0ea38284', '61df14a16d3a14b2cabb1d112602232e94350659e613329dc54eee60d654bce5'),
(114, 21, 29, 7.50, '{\"enrollment_id\":21,\"criterion_id\":29,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:03:31\"}', 'INSERT', 7, '2024-03-01 02:03:31', '61df14a16d3a14b2cabb1d112602232e94350659e613329dc54eee60d654bce5', '199c6a1885c41800621c51ff07375becc10671dd6d22160fb478a01c2abf333b'),
(115, 22, 28, 6.00, '{\"enrollment_id\":22,\"criterion_id\":28,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:04:08\"}', 'INSERT', 7, '2024-03-01 02:04:08', '199c6a1885c41800621c51ff07375becc10671dd6d22160fb478a01c2abf333b', 'f7e210977b93e8efeb420a0d6b323c7183d8a9f915155be13492fe2f1ae4f893'),
(116, 22, 29, 5.00, '{\"enrollment_id\":22,\"criterion_id\":29,\"score\":5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:04:45\"}', 'INSERT', 7, '2024-03-01 02:04:45', 'f7e210977b93e8efeb420a0d6b323c7183d8a9f915155be13492fe2f1ae4f893', '525ba6e74fbd37caf65cd165412c3eaf01a37d9df4f5953429b58c8c2390c638'),
(117, 23, 28, 7.50, '{\"enrollment_id\":23,\"criterion_id\":28,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:05:22\"}', 'INSERT', 7, '2024-03-01 02:05:22', '525ba6e74fbd37caf65cd165412c3eaf01a37d9df4f5953429b58c8c2390c638', '39075afbf91426615b9e4952f3463296b56f66dbd2cb6d6e23f052b9bf678a42'),
(118, 23, 29, 8.50, '{\"enrollment_id\":23,\"criterion_id\":29,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:05:59\"}', 'INSERT', 7, '2024-03-01 02:05:59', '39075afbf91426615b9e4952f3463296b56f66dbd2cb6d6e23f052b9bf678a42', 'a2c8b1b1ba042bc870632eceec3883aa6d1fcf5291164d83d5bfce1d597e150a'),
(119, 18, 30, 9.00, '{\"enrollment_id\":18,\"criterion_id\":30,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:06:36\"}', 'INSERT', 7, '2024-03-01 02:06:36', 'a2c8b1b1ba042bc870632eceec3883aa6d1fcf5291164d83d5bfce1d597e150a', '5f7bfe6b6754c73c6acf97f91715c4a6a4d87e0a9cde85312f0b5862799bd41d'),
(120, 18, 31, 7.50, '{\"enrollment_id\":18,\"criterion_id\":31,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:07:13\"}', 'INSERT', 7, '2024-03-01 02:07:13', '5f7bfe6b6754c73c6acf97f91715c4a6a4d87e0a9cde85312f0b5862799bd41d', '824f5dd11220a935459b1c3ad5b8f87b1fc2c9104b50cb3f7c43b8323be57d52'),
(121, 18, 32, 8.00, '{\"enrollment_id\":18,\"criterion_id\":32,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:07:50\"}', 'INSERT', 7, '2024-03-01 02:07:50', '824f5dd11220a935459b1c3ad5b8f87b1fc2c9104b50cb3f7c43b8323be57d52', '294e09f61c3ab6f38ed570b2f80470bdb0dbf578a423901301dd80fc5eeead2e'),
(122, 19, 30, 7.00, '{\"enrollment_id\":19,\"criterion_id\":30,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:08:27\"}', 'INSERT', 7, '2024-03-01 02:08:27', '294e09f61c3ab6f38ed570b2f80470bdb0dbf578a423901301dd80fc5eeead2e', '7c2c49982a2241ad15f3d556101c85e7daf64a796540f1c45cb6b44705a05087'),
(123, 19, 31, 6.50, '{\"enrollment_id\":19,\"criterion_id\":31,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:09:04\"}', 'INSERT', 7, '2024-03-01 02:09:04', '7c2c49982a2241ad15f3d556101c85e7daf64a796540f1c45cb6b44705a05087', '6e2c0df172bf666639f0281e278a4fc5bc99bebbc74a1e4c3027a1a40bb4611e'),
(124, 19, 32, 5.50, '{\"enrollment_id\":19,\"criterion_id\":32,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:09:41\"}', 'INSERT', 7, '2024-03-01 02:09:41', '6e2c0df172bf666639f0281e278a4fc5bc99bebbc74a1e4c3027a1a40bb4611e', 'ce7064e24d772d02a334c06f77fb16b5536f0114067bdab3f079dda4fbc16950'),
(125, 20, 30, 9.00, '{\"enrollment_id\":20,\"criterion_id\":30,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:10:18\"}', 'INSERT', 7, '2024-03-01 02:10:18', 'ce7064e24d772d02a334c06f77fb16b5536f0114067bdab3f079dda4fbc16950', '7d915a545bf7183bc7362c29655e4691faa55a4dbb845e58ff606982e2ac8a1f'),
(126, 20, 31, 9.50, '{\"enrollment_id\":20,\"criterion_id\":31,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:10:55\"}', 'INSERT', 7, '2024-03-01 02:10:55', '7d915a545bf7183bc7362c29655e4691faa55a4dbb845e58ff606982e2ac8a1f', '458f81d265a1fa404e9106e825b36cbbf6cf5264dcd7fbfc2c245e40f2898c03'),
(127, 20, 32, 9.00, '{\"enrollment_id\":20,\"criterion_id\":32,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:11:32\"}', 'INSERT', 7, '2024-03-01 02:11:32', '458f81d265a1fa404e9106e825b36cbbf6cf5264dcd7fbfc2c245e40f2898c03', '3c2aea9df59c3e41e87c243142409e91396189e4d74a962311342a58ed5f25be'),
(128, 21, 30, 7.00, '{\"enrollment_id\":21,\"criterion_id\":30,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:12:09\"}', 'INSERT', 7, '2024-03-01 02:12:09', '3c2aea9df59c3e41e87c243142409e91396189e4d74a962311342a58ed5f25be', '126a93d04b67eadf31f7b6ef72f01acf9bcf25763c223dbb94d27ab34131edcf');
INSERT INTO `score_ledger` (`id`, `enrollment_id`, `criterion_id`, `score`, `data_snapshot`, `action`, `graded_by`, `timestamp`, `previous_hash`, `current_hash`) VALUES
(129, 21, 31, 7.50, '{\"enrollment_id\":21,\"criterion_id\":31,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:12:46\"}', 'INSERT', 7, '2024-03-01 02:12:46', '126a93d04b67eadf31f7b6ef72f01acf9bcf25763c223dbb94d27ab34131edcf', '27bed30c55d685dd516cba1a965354456b35e5bd3f40f5f5ddba2bb4b6119f52'),
(130, 21, 32, 8.00, '{\"enrollment_id\":21,\"criterion_id\":32,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:13:23\"}', 'INSERT', 7, '2024-03-01 02:13:23', '27bed30c55d685dd516cba1a965354456b35e5bd3f40f5f5ddba2bb4b6119f52', 'a814486a6abb798cde2a637bef6f0dfa73a52d8e4a29ca559799a6f8c01c8a1c'),
(131, 22, 30, 5.00, '{\"enrollment_id\":22,\"criterion_id\":30,\"score\":5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:14:00\"}', 'INSERT', 7, '2024-03-01 02:14:00', 'a814486a6abb798cde2a637bef6f0dfa73a52d8e4a29ca559799a6f8c01c8a1c', 'e53ee64e2a8a1cb1af0e59a3e438dca0f90231d852daba4e17ab86c613e71049'),
(132, 22, 31, 5.50, '{\"enrollment_id\":22,\"criterion_id\":31,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:14:37\"}', 'INSERT', 7, '2024-03-01 02:14:37', 'e53ee64e2a8a1cb1af0e59a3e438dca0f90231d852daba4e17ab86c613e71049', '44cbe91a203e6ad840200dae721b38d7cee0dcf1c93cbb297bef27875ea511ea'),
(133, 22, 32, 6.00, '{\"enrollment_id\":22,\"criterion_id\":32,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:15:14\"}', 'INSERT', 7, '2024-03-01 02:15:14', '44cbe91a203e6ad840200dae721b38d7cee0dcf1c93cbb297bef27875ea511ea', 'c7d6e0685fedcf49ff9ca816784519b7a2154a843ef2e2c49cb90a28df4964e0'),
(134, 23, 30, 8.00, '{\"enrollment_id\":23,\"criterion_id\":30,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:15:51\"}', 'INSERT', 7, '2024-03-01 02:15:51', 'c7d6e0685fedcf49ff9ca816784519b7a2154a843ef2e2c49cb90a28df4964e0', 'e505e23659d36a60ea3cf98680834359896c2bf1b4e088f4b2e5b250bad4dec6'),
(135, 23, 31, 7.50, '{\"enrollment_id\":23,\"criterion_id\":31,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:16:28\"}', 'INSERT', 7, '2024-03-01 02:16:28', 'e505e23659d36a60ea3cf98680834359896c2bf1b4e088f4b2e5b250bad4dec6', 'f733dce9776b3cf738e931c3d5055e81a39fafc547115e3078bac4756b865956'),
(136, 23, 32, 8.00, '{\"enrollment_id\":23,\"criterion_id\":32,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:17:05\"}', 'INSERT', 7, '2024-03-01 02:17:05', 'f733dce9776b3cf738e931c3d5055e81a39fafc547115e3078bac4756b865956', 'c9f117fbb226c42d957288dc0ade44bf3dea16e6db72d28c2191878ffb03403f'),
(137, 24, 33, 9.00, '{\"enrollment_id\":24,\"criterion_id\":33,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:17:42\"}', 'INSERT', 2, '2024-03-01 02:17:42', 'c9f117fbb226c42d957288dc0ade44bf3dea16e6db72d28c2191878ffb03403f', 'bf7b9bf6538830587192bb05b1d2559c3aa77c2489e1b8e22bf6c6bd8c68275f'),
(138, 24, 34, 8.50, '{\"enrollment_id\":24,\"criterion_id\":34,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:18:19\"}', 'INSERT', 2, '2024-03-01 02:18:19', 'bf7b9bf6538830587192bb05b1d2559c3aa77c2489e1b8e22bf6c6bd8c68275f', '17cfca10f3977580e8eac277f59ce8f25e9d06c740a5819f221e56bf35a29645'),
(139, 25, 33, 5.50, '{\"enrollment_id\":25,\"criterion_id\":33,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:18:56\"}', 'INSERT', 2, '2024-03-01 02:18:56', '17cfca10f3977580e8eac277f59ce8f25e9d06c740a5819f221e56bf35a29645', 'b03a8aefd8d91ff8d43a7b7952ac73dc099777ac68b248297d0d98062d0ff4a6'),
(140, 25, 34, 6.50, '{\"enrollment_id\":25,\"criterion_id\":34,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:19:33\"}', 'INSERT', 2, '2024-03-01 02:19:33', 'b03a8aefd8d91ff8d43a7b7952ac73dc099777ac68b248297d0d98062d0ff4a6', '76c0a7114395e01b44c2a0d1505f7e22e82fd7f3fbfe95776a3f368b7875a36d'),
(141, 26, 33, 9.50, '{\"enrollment_id\":26,\"criterion_id\":33,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:20:10\"}', 'INSERT', 2, '2024-03-01 02:20:10', '76c0a7114395e01b44c2a0d1505f7e22e82fd7f3fbfe95776a3f368b7875a36d', '61da04cd11c328ab6723fbea8035a8f1b10907086b6c550b6f73c06f0db8b078'),
(142, 26, 34, 9.00, '{\"enrollment_id\":26,\"criterion_id\":34,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:20:47\"}', 'INSERT', 2, '2024-03-01 02:20:47', '61da04cd11c328ab6723fbea8035a8f1b10907086b6c550b6f73c06f0db8b078', 'acef4e712b6dd23653ae63dff80b485f7be11f20fa3f33f91e52c12fad6ec9e7'),
(143, 27, 33, 7.00, '{\"enrollment_id\":27,\"criterion_id\":33,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:21:24\"}', 'INSERT', 2, '2024-03-01 02:21:24', 'acef4e712b6dd23653ae63dff80b485f7be11f20fa3f33f91e52c12fad6ec9e7', 'fad5f350d5866e3766949cd94be020a141eab5f1f5d21a2ad9f99e380e903ce3'),
(144, 27, 34, 7.50, '{\"enrollment_id\":27,\"criterion_id\":34,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:22:01\"}', 'INSERT', 2, '2024-03-01 02:22:01', 'fad5f350d5866e3766949cd94be020a141eab5f1f5d21a2ad9f99e380e903ce3', 'afd15f21595490138398c9cf8d53b53b0393aef2c81a2458f07c608726cc93ba'),
(145, 28, 33, 6.00, '{\"enrollment_id\":28,\"criterion_id\":33,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:22:38\"}', 'INSERT', 2, '2024-03-01 02:22:38', 'afd15f21595490138398c9cf8d53b53b0393aef2c81a2458f07c608726cc93ba', '633c2cdfb05fb89be398202cc73874c7544f21a13cbd3130203fef82b1fa8e7b'),
(146, 28, 34, 5.00, '{\"enrollment_id\":28,\"criterion_id\":34,\"score\":5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:23:15\"}', 'INSERT', 2, '2024-03-01 02:23:15', '633c2cdfb05fb89be398202cc73874c7544f21a13cbd3130203fef82b1fa8e7b', '7fe4dff351f3e1b5578095278aec319326e9bcfd12365862700778d12344bbf2'),
(147, 29, 33, 7.50, '{\"enrollment_id\":29,\"criterion_id\":33,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:23:52\"}', 'INSERT', 2, '2024-03-01 02:23:52', '7fe4dff351f3e1b5578095278aec319326e9bcfd12365862700778d12344bbf2', '36c6f1fe76e0cab51e205da4cc77747b811d7a88b1034c596bd6df5b4fbebdea'),
(148, 29, 34, 8.50, '{\"enrollment_id\":29,\"criterion_id\":34,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:24:29\"}', 'INSERT', 2, '2024-03-01 02:24:29', '36c6f1fe76e0cab51e205da4cc77747b811d7a88b1034c596bd6df5b4fbebdea', 'c3a6b3f727f3f5bf2d59ab123c24ae0b110af4bc07c49d890fecb9c91f24bfbc'),
(149, 30, 33, 7.00, '{\"enrollment_id\":30,\"criterion_id\":33,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:25:06\"}', 'INSERT', 2, '2024-03-01 02:25:06', 'c3a6b3f727f3f5bf2d59ab123c24ae0b110af4bc07c49d890fecb9c91f24bfbc', '6bfae07489e28cd0b59b3ade755eb208d18f9cd10b973f4715ebd5109e0ff148'),
(150, 30, 34, 6.50, '{\"enrollment_id\":30,\"criterion_id\":34,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:25:43\"}', 'INSERT', 2, '2024-03-01 02:25:43', '6bfae07489e28cd0b59b3ade755eb208d18f9cd10b973f4715ebd5109e0ff148', '1d7ce84e9e0f47fd62506398632a17542860a45b16233df54cbb547b964fbf58'),
(151, 24, 35, 8.00, '{\"enrollment_id\":24,\"criterion_id\":35,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:26:20\"}', 'INSERT', 2, '2024-03-01 02:26:20', '1d7ce84e9e0f47fd62506398632a17542860a45b16233df54cbb547b964fbf58', '4f88cc7902bb829e3e530d6e4601218ca1379f05739e71ae8e0c62e12ddab539'),
(152, 24, 36, 9.00, '{\"enrollment_id\":24,\"criterion_id\":36,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:26:57\"}', 'INSERT', 2, '2024-03-01 02:26:57', '4f88cc7902bb829e3e530d6e4601218ca1379f05739e71ae8e0c62e12ddab539', '5838c33a1b5622b85424778a1d6b59f5251f34c3bc50b08b577b6285cd971bdf'),
(153, 25, 35, 6.50, '{\"enrollment_id\":25,\"criterion_id\":35,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:27:34\"}', 'INSERT', 2, '2024-03-01 02:27:34', '5838c33a1b5622b85424778a1d6b59f5251f34c3bc50b08b577b6285cd971bdf', '9375e1b68b3893e3fbfd1342658b9d0e4bab4616c0bae77205e9199c9f991e4e'),
(154, 25, 36, 5.50, '{\"enrollment_id\":25,\"criterion_id\":36,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:28:11\"}', 'INSERT', 2, '2024-03-01 02:28:11', '9375e1b68b3893e3fbfd1342658b9d0e4bab4616c0bae77205e9199c9f991e4e', 'de2964e6a631ccf803abb91c94a945daaa3c7c306026ecd0a7def4fdc27be2c8'),
(155, 26, 35, 9.00, '{\"enrollment_id\":26,\"criterion_id\":35,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:28:48\"}', 'INSERT', 2, '2024-03-01 02:28:48', 'de2964e6a631ccf803abb91c94a945daaa3c7c306026ecd0a7def4fdc27be2c8', '23a70959f4ce0cc8b66262139104ae55ecbf9b1fe665e20cdb887e86f7b9a9bc'),
(156, 26, 36, 9.50, '{\"enrollment_id\":26,\"criterion_id\":36,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:29:25\"}', 'INSERT', 2, '2024-03-01 02:29:25', '23a70959f4ce0cc8b66262139104ae55ecbf9b1fe665e20cdb887e86f7b9a9bc', 'dde3e1e494f2dea6bd585b76fd19f12348161be7fe905f3e43b44a3068080b0b'),
(157, 27, 35, 7.50, '{\"enrollment_id\":27,\"criterion_id\":35,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:30:02\"}', 'INSERT', 2, '2024-03-01 02:30:02', 'dde3e1e494f2dea6bd585b76fd19f12348161be7fe905f3e43b44a3068080b0b', '0bfad789cf671ab905864176fa9ab8900c3a9334ce700f39d41e3495055c3572'),
(158, 27, 36, 7.00, '{\"enrollment_id\":27,\"criterion_id\":36,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:30:39\"}', 'INSERT', 2, '2024-03-01 02:30:39', '0bfad789cf671ab905864176fa9ab8900c3a9334ce700f39d41e3495055c3572', 'bcefd31401de3665ea127f98710b54887cb8a63f7bda2b2211013ebd0aac9932'),
(159, 28, 35, 5.50, '{\"enrollment_id\":28,\"criterion_id\":35,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:31:16\"}', 'INSERT', 2, '2024-03-01 02:31:16', 'bcefd31401de3665ea127f98710b54887cb8a63f7bda2b2211013ebd0aac9932', 'd107fb15044108f6d8de763c62cfa41ad7edc1d22555135f597f53c91ff36695'),
(160, 28, 36, 6.00, '{\"enrollment_id\":28,\"criterion_id\":36,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:31:53\"}', 'INSERT', 2, '2024-03-01 02:31:53', 'd107fb15044108f6d8de763c62cfa41ad7edc1d22555135f597f53c91ff36695', 'f4dc654b3841bd755c9abe8fad356dbb1204175d159b6b8d96a74db9a061eba8'),
(161, 29, 35, 8.00, '{\"enrollment_id\":29,\"criterion_id\":35,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:32:30\"}', 'INSERT', 2, '2024-03-01 02:32:30', 'f4dc654b3841bd755c9abe8fad356dbb1204175d159b6b8d96a74db9a061eba8', '4b83a982e3a354322a4f6972cbaaff03cd14448f5f03759d01ccadd9e329cb7f'),
(162, 29, 36, 7.50, '{\"enrollment_id\":29,\"criterion_id\":36,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:33:07\"}', 'INSERT', 2, '2024-03-01 02:33:07', '4b83a982e3a354322a4f6972cbaaff03cd14448f5f03759d01ccadd9e329cb7f', '8070b7eca4cd3349dcd4eacaff22158d1bcea41254799ab548699145973c0c13'),
(163, 30, 35, 7.50, '{\"enrollment_id\":30,\"criterion_id\":35,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:33:44\"}', 'INSERT', 2, '2024-03-01 02:33:44', '8070b7eca4cd3349dcd4eacaff22158d1bcea41254799ab548699145973c0c13', 'b6ec81242aa89fda8fb7a6eaa5c8940627b94f2670484767a6d7ac61e90e160f'),
(164, 30, 36, 7.00, '{\"enrollment_id\":30,\"criterion_id\":36,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:34:21\"}', 'INSERT', 2, '2024-03-01 02:34:21', 'b6ec81242aa89fda8fb7a6eaa5c8940627b94f2670484767a6d7ac61e90e160f', '7917d97b6d4aca115b36ae8da1d195bbfb9f10bdd4a5e7cdca67cc67cb7359ac'),
(165, 24, 37, 7.50, '{\"enrollment_id\":24,\"criterion_id\":37,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:34:58\"}', 'INSERT', 2, '2024-03-01 02:34:58', '7917d97b6d4aca115b36ae8da1d195bbfb9f10bdd4a5e7cdca67cc67cb7359ac', '6fbb5c8f0269ef2aeee17ae6efda9bcd0004fca64f70c2e5cbe8443c68084a69'),
(166, 24, 38, 8.00, '{\"enrollment_id\":24,\"criterion_id\":38,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:35:35\"}', 'INSERT', 2, '2024-03-01 02:35:35', '6fbb5c8f0269ef2aeee17ae6efda9bcd0004fca64f70c2e5cbe8443c68084a69', '249709544dd30a1f3b016681712ef12dd0bf532c52b5949e20475e675ba430e2'),
(167, 24, 39, 9.00, '{\"enrollment_id\":24,\"criterion_id\":39,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:36:12\"}', 'INSERT', 2, '2024-03-01 02:36:12', '249709544dd30a1f3b016681712ef12dd0bf532c52b5949e20475e675ba430e2', '1435b14346c324320ad8ae9a8b404e09bf756b99bf34826b2263f8d55595b838'),
(168, 25, 37, 6.50, '{\"enrollment_id\":25,\"criterion_id\":37,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:36:49\"}', 'INSERT', 2, '2024-03-01 02:36:49', '1435b14346c324320ad8ae9a8b404e09bf756b99bf34826b2263f8d55595b838', 'b59be18cbc4efbfb97b5ed662d2a7af60454a0c28074660a354fe6bac63c5349'),
(169, 25, 38, 5.50, '{\"enrollment_id\":25,\"criterion_id\":38,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:37:26\"}', 'INSERT', 2, '2024-03-01 02:37:26', 'b59be18cbc4efbfb97b5ed662d2a7af60454a0c28074660a354fe6bac63c5349', 'ee4d1ae5f0bc539e316bf8d838b24ef8e53e576d5feff5b4c3c568cf09b3d318'),
(170, 25, 39, 6.50, '{\"enrollment_id\":25,\"criterion_id\":39,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:38:03\"}', 'INSERT', 2, '2024-03-01 02:38:03', 'ee4d1ae5f0bc539e316bf8d838b24ef8e53e576d5feff5b4c3c568cf09b3d318', 'b9691a89367cbb7e8d13f8a11cd8f95e2a0a3653532d8290f9b5599e118681b5'),
(171, 26, 37, 9.50, '{\"enrollment_id\":26,\"criterion_id\":37,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:38:40\"}', 'INSERT', 2, '2024-03-01 02:38:40', 'b9691a89367cbb7e8d13f8a11cd8f95e2a0a3653532d8290f9b5599e118681b5', 'bbeed40254b3dc4c7db83e7a2b87664ac9dd6d70fba400090d0ba7dad81abca5'),
(172, 26, 38, 9.00, '{\"enrollment_id\":26,\"criterion_id\":38,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:39:17\"}', 'INSERT', 2, '2024-03-01 02:39:17', 'bbeed40254b3dc4c7db83e7a2b87664ac9dd6d70fba400090d0ba7dad81abca5', '7a0f09683d2847403a07d2f4be7920a28075330829cbd234fa8ab528a6515d1e'),
(173, 26, 39, 8.50, '{\"enrollment_id\":26,\"criterion_id\":39,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:39:54\"}', 'INSERT', 2, '2024-03-01 02:39:54', '7a0f09683d2847403a07d2f4be7920a28075330829cbd234fa8ab528a6515d1e', '4e4b4e10d1bb048330a1c0dbca5f0c28df8645f5fc8d0da38ec36c1c1f46c3b7'),
(174, 27, 37, 7.50, '{\"enrollment_id\":27,\"criterion_id\":37,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:40:31\"}', 'INSERT', 2, '2024-03-01 02:40:31', '4e4b4e10d1bb048330a1c0dbca5f0c28df8645f5fc8d0da38ec36c1c1f46c3b7', '5853517aa8093bf2ebf3292c428b8963ec6d3292e3506873a833ea8e15df32d4'),
(175, 27, 38, 8.00, '{\"enrollment_id\":27,\"criterion_id\":38,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:41:08\"}', 'INSERT', 2, '2024-03-01 02:41:08', '5853517aa8093bf2ebf3292c428b8963ec6d3292e3506873a833ea8e15df32d4', '1e23ab4cd15e96e977737729c712840bae3957d1a578b40b75edc45b639c791a'),
(176, 27, 39, 7.50, '{\"enrollment_id\":27,\"criterion_id\":39,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:41:45\"}', 'INSERT', 2, '2024-03-01 02:41:45', '1e23ab4cd15e96e977737729c712840bae3957d1a578b40b75edc45b639c791a', 'f29f6658b3549acce7127ad688b13b0682ff1cd02c8404bcd20c99bfaa37beec'),
(177, 28, 37, 5.50, '{\"enrollment_id\":28,\"criterion_id\":37,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:42:22\"}', 'INSERT', 2, '2024-03-01 02:42:22', 'f29f6658b3549acce7127ad688b13b0682ff1cd02c8404bcd20c99bfaa37beec', '2605f8ca80ff435fe88ffdf8529e399528fec01ac01b3324e41911faa0fda597'),
(178, 28, 38, 6.00, '{\"enrollment_id\":28,\"criterion_id\":38,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:42:59\"}', 'INSERT', 2, '2024-03-01 02:42:59', '2605f8ca80ff435fe88ffdf8529e399528fec01ac01b3324e41911faa0fda597', '9bc58e9282b493698f0faad6e2e13fbf813f5db4ed88dc3b22fe5454e9dd06a4'),
(179, 28, 39, 5.50, '{\"enrollment_id\":28,\"criterion_id\":39,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:43:36\"}', 'INSERT', 2, '2024-03-01 02:43:36', '9bc58e9282b493698f0faad6e2e13fbf813f5db4ed88dc3b22fe5454e9dd06a4', 'd4150f404d9febf7cb8b03402187c83aacd8ca42a851a6d1aaf7f3a714f07c37'),
(180, 29, 37, 7.50, '{\"enrollment_id\":29,\"criterion_id\":37,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:44:13\"}', 'INSERT', 2, '2024-03-01 02:44:13', 'd4150f404d9febf7cb8b03402187c83aacd8ca42a851a6d1aaf7f3a714f07c37', 'e2d7510d1c57e39858e834e6fe77d5168f0c15127aa76699f2e3eb1df2fbb017'),
(181, 29, 38, 8.00, '{\"enrollment_id\":29,\"criterion_id\":38,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:44:50\"}', 'INSERT', 2, '2024-03-01 02:44:50', 'e2d7510d1c57e39858e834e6fe77d5168f0c15127aa76699f2e3eb1df2fbb017', '194bf06ffb2c67a9e0d341f0a2c6712f31573a447b1c903e28580820892d0d9b'),
(182, 29, 39, 8.50, '{\"enrollment_id\":29,\"criterion_id\":39,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:45:27\"}', 'INSERT', 2, '2024-03-01 02:45:27', '194bf06ffb2c67a9e0d341f0a2c6712f31573a447b1c903e28580820892d0d9b', '58eb94de8cf77505b1ae331a991e418c3d56405f8e43972d2620f1d741ad7a1c'),
(183, 30, 37, 7.00, '{\"enrollment_id\":30,\"criterion_id\":37,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:46:04\"}', 'INSERT', 2, '2024-03-01 02:46:04', '58eb94de8cf77505b1ae331a991e418c3d56405f8e43972d2620f1d741ad7a1c', '9bf20183e7d71e81120e6171c13bbdb929b470c22c0efed3889214a59c2367e4'),
(184, 30, 38, 6.50, '{\"enrollment_id\":30,\"criterion_id\":38,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:46:41\"}', 'INSERT', 2, '2024-03-01 02:46:41', '9bf20183e7d71e81120e6171c13bbdb929b470c22c0efed3889214a59c2367e4', 'e9e553cc3f28c5e425bcf6d564c4f2c8115c5e6aa5aefb9b2d221fa1ecb74487'),
(185, 30, 39, 7.00, '{\"enrollment_id\":30,\"criterion_id\":39,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:47:18\"}', 'INSERT', 2, '2024-03-01 02:47:18', 'e9e553cc3f28c5e425bcf6d564c4f2c8115c5e6aa5aefb9b2d221fa1ecb74487', '91ce58c6ca6bf51ff249ef0e4b871a0184202cdd34e3f2c2017c55641baf0189'),
(186, 31, 40, 9.00, '{\"enrollment_id\":31,\"criterion_id\":40,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:47:55\"}', 'INSERT', 3, '2024-03-01 02:47:55', '91ce58c6ca6bf51ff249ef0e4b871a0184202cdd34e3f2c2017c55641baf0189', '2f4600602f7de5185fe37bedb639d10c1319b046906aba29605a22576d165f6f'),
(187, 31, 41, 8.50, '{\"enrollment_id\":31,\"criterion_id\":41,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:48:32\"}', 'INSERT', 3, '2024-03-01 02:48:32', '2f4600602f7de5185fe37bedb639d10c1319b046906aba29605a22576d165f6f', '67b5a17adbf523c612f00c7821b9f73c3017c62d196c4430170e999220bd90fc'),
(188, 32, 40, 5.50, '{\"enrollment_id\":32,\"criterion_id\":40,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:49:09\"}', 'INSERT', 3, '2024-03-01 02:49:09', '67b5a17adbf523c612f00c7821b9f73c3017c62d196c4430170e999220bd90fc', '37dc3f2afb2443e3d00bcc4a09a46f3c988aaf461d1039eaefcd16fd73549ad2'),
(189, 32, 41, 6.00, '{\"enrollment_id\":32,\"criterion_id\":41,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:49:46\"}', 'INSERT', 3, '2024-03-01 02:49:46', '37dc3f2afb2443e3d00bcc4a09a46f3c988aaf461d1039eaefcd16fd73549ad2', '33b3aeadd2e1e7ad55feeb31183f0c5fa3f6710f9aed9bbc613a740212a2f93e'),
(190, 33, 40, 9.50, '{\"enrollment_id\":33,\"criterion_id\":40,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:50:23\"}', 'INSERT', 3, '2024-03-01 02:50:23', '33b3aeadd2e1e7ad55feeb31183f0c5fa3f6710f9aed9bbc613a740212a2f93e', '8a11343aa6c6330d2adeb24a40bf2448ad002b7038b89bef4e8f7118227f4b8d'),
(191, 33, 41, 9.00, '{\"enrollment_id\":33,\"criterion_id\":41,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:51:00\"}', 'INSERT', 3, '2024-03-01 02:51:00', '8a11343aa6c6330d2adeb24a40bf2448ad002b7038b89bef4e8f7118227f4b8d', '63bf040d00ac52ad5f8cc0657aa48e52394e94f69239cecba0d990763952a07e'),
(192, 34, 40, 7.00, '{\"enrollment_id\":34,\"criterion_id\":40,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:51:37\"}', 'INSERT', 3, '2024-03-01 02:51:37', '63bf040d00ac52ad5f8cc0657aa48e52394e94f69239cecba0d990763952a07e', 'abc134d0ad002d0bb6a72546a2f86d3bc1e0327bc390237b540707202fb79007'),
(193, 34, 41, 7.50, '{\"enrollment_id\":34,\"criterion_id\":41,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:52:14\"}', 'INSERT', 3, '2024-03-01 02:52:14', 'abc134d0ad002d0bb6a72546a2f86d3bc1e0327bc390237b540707202fb79007', 'a3bb8a903d009444cf8ee9a2f96db0272ac31c5afdcf2d56604c1e474522a1d1'),
(194, 35, 40, 5.50, '{\"enrollment_id\":35,\"criterion_id\":40,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:52:51\"}', 'INSERT', 3, '2024-03-01 02:52:51', 'a3bb8a903d009444cf8ee9a2f96db0272ac31c5afdcf2d56604c1e474522a1d1', '4549a8a0947474350b1401e078a13ee4af1e7ddb92184162adc801c6f1761c67'),
(195, 35, 41, 5.00, '{\"enrollment_id\":35,\"criterion_id\":41,\"score\":5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:53:28\"}', 'INSERT', 3, '2024-03-01 02:53:28', '4549a8a0947474350b1401e078a13ee4af1e7ddb92184162adc801c6f1761c67', '5a0b0111b004d902ce6ae4b7a487a9f443b6f09000fb82dee4cc8b1556aa266d'),
(196, 31, 42, 8.00, '{\"enrollment_id\":31,\"criterion_id\":42,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:54:05\"}', 'INSERT', 3, '2024-03-01 02:54:05', '5a0b0111b004d902ce6ae4b7a487a9f443b6f09000fb82dee4cc8b1556aa266d', '2cf74482950a425999272a16cd2c63a38109d14132938ea89576b2673368b8c8'),
(197, 31, 43, 9.00, '{\"enrollment_id\":31,\"criterion_id\":43,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:54:42\"}', 'INSERT', 3, '2024-03-01 02:54:42', '2cf74482950a425999272a16cd2c63a38109d14132938ea89576b2673368b8c8', '355ea063bccd0bdbe1e044e54405488901c983acfd5405dae771250d54331346'),
(198, 32, 42, 6.50, '{\"enrollment_id\":32,\"criterion_id\":42,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:55:19\"}', 'INSERT', 3, '2024-03-01 02:55:19', '355ea063bccd0bdbe1e044e54405488901c983acfd5405dae771250d54331346', '1b3032904513d7efc4d81993e94f557928eafe6ea2e762833355109cf6ed1b31'),
(199, 32, 43, 5.50, '{\"enrollment_id\":32,\"criterion_id\":43,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:55:56\"}', 'INSERT', 3, '2024-03-01 02:55:56', '1b3032904513d7efc4d81993e94f557928eafe6ea2e762833355109cf6ed1b31', 'c2173e48d0e3ac0bed19b9173dfa0d59a1898c4a0ac49964f683edd2ff81550c'),
(200, 33, 42, 9.00, '{\"enrollment_id\":33,\"criterion_id\":42,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:56:33\"}', 'INSERT', 3, '2024-03-01 02:56:33', 'c2173e48d0e3ac0bed19b9173dfa0d59a1898c4a0ac49964f683edd2ff81550c', '1fb43f3648b37f0b58f40464ae8c9e928dcc6b7a85748cc52d57a2e7c8e08239'),
(201, 33, 43, 9.50, '{\"enrollment_id\":33,\"criterion_id\":43,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:57:10\"}', 'INSERT', 3, '2024-03-01 02:57:10', '1fb43f3648b37f0b58f40464ae8c9e928dcc6b7a85748cc52d57a2e7c8e08239', '5066678392d961d7ae26bcfacc24833ddea8f5fdd6de7daece87cb09c0717038'),
(202, 34, 42, 7.50, '{\"enrollment_id\":34,\"criterion_id\":42,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:57:47\"}', 'INSERT', 3, '2024-03-01 02:57:47', '5066678392d961d7ae26bcfacc24833ddea8f5fdd6de7daece87cb09c0717038', 'ebe6f553a66dab6277ab22c03abbd4e14da668965cb1ef8d8be439695c7d75d6'),
(203, 34, 43, 7.00, '{\"enrollment_id\":34,\"criterion_id\":43,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:58:24\"}', 'INSERT', 3, '2024-03-01 02:58:24', 'ebe6f553a66dab6277ab22c03abbd4e14da668965cb1ef8d8be439695c7d75d6', 'd52c78d000dbc04b8811d0d57e4a6e2f072ef9cbc4bebaffe6874e00ef5af6f9'),
(204, 35, 42, 5.50, '{\"enrollment_id\":35,\"criterion_id\":42,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:59:01\"}', 'INSERT', 3, '2024-03-01 02:59:01', 'd52c78d000dbc04b8811d0d57e4a6e2f072ef9cbc4bebaffe6874e00ef5af6f9', '35107222b750f7195e7206e4cb0dcd308cee74a401e908670348482cf3bbea1b'),
(205, 35, 43, 6.00, '{\"enrollment_id\":35,\"criterion_id\":43,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 09:59:38\"}', 'INSERT', 3, '2024-03-01 02:59:38', '35107222b750f7195e7206e4cb0dcd308cee74a401e908670348482cf3bbea1b', '0005ac498fdd74d459e0fffe4936ee6e8c6670ad7b0f25d8f40f9633dd3ed720'),
(206, 31, 44, 8.50, '{\"enrollment_id\":31,\"criterion_id\":44,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:00:15\"}', 'INSERT', 3, '2024-03-01 03:00:15', '0005ac498fdd74d459e0fffe4936ee6e8c6670ad7b0f25d8f40f9633dd3ed720', '0c4e04fd4f5983dfad849a61aa648ae80abad1e0c19138674792ba4fc4e366bb'),
(207, 31, 45, 7.00, '{\"enrollment_id\":31,\"criterion_id\":45,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:00:52\"}', 'INSERT', 3, '2024-03-01 03:00:52', '0c4e04fd4f5983dfad849a61aa648ae80abad1e0c19138674792ba4fc4e366bb', 'e87b5549611d2d64f4f9565a7e6edd63f692345a70db7fcae32f8b97d6729c09'),
(208, 31, 46, 8.00, '{\"enrollment_id\":31,\"criterion_id\":46,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:01:29\"}', 'INSERT', 3, '2024-03-01 03:01:29', 'e87b5549611d2d64f4f9565a7e6edd63f692345a70db7fcae32f8b97d6729c09', '83293a8eeda3069f3e398e94749e70182c4484166b08323374698a6e6ad2142f'),
(209, 32, 44, 6.50, '{\"enrollment_id\":32,\"criterion_id\":44,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:02:06\"}', 'INSERT', 3, '2024-03-01 03:02:06', '83293a8eeda3069f3e398e94749e70182c4484166b08323374698a6e6ad2142f', '6a7c5daa709a485bf70e0af81e9d0b73a6ab8931c9fcd476983f00c63655575e'),
(210, 32, 45, 5.50, '{\"enrollment_id\":32,\"criterion_id\":45,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:02:43\"}', 'INSERT', 3, '2024-03-01 03:02:43', '6a7c5daa709a485bf70e0af81e9d0b73a6ab8931c9fcd476983f00c63655575e', '5d27acf5e260ec7323865a9320c7b98b2e2867a35191a286881bbe5daafa67d8'),
(211, 32, 46, 6.00, '{\"enrollment_id\":32,\"criterion_id\":46,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:03:20\"}', 'INSERT', 3, '2024-03-01 03:03:20', '5d27acf5e260ec7323865a9320c7b98b2e2867a35191a286881bbe5daafa67d8', 'e5f8ed61ecd82232df98c2271d477741fd856b4501f6542383676448828503b5'),
(212, 33, 44, 9.50, '{\"enrollment_id\":33,\"criterion_id\":44,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:03:57\"}', 'INSERT', 3, '2024-03-01 03:03:57', 'e5f8ed61ecd82232df98c2271d477741fd856b4501f6542383676448828503b5', '62c6084c752feb94326c17ac18e712c5246d050333a77708ee295a1f07a073f3'),
(213, 33, 45, 9.00, '{\"enrollment_id\":33,\"criterion_id\":45,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:04:34\"}', 'INSERT', 3, '2024-03-01 03:04:34', '62c6084c752feb94326c17ac18e712c5246d050333a77708ee295a1f07a073f3', 'eee06c52492b8eaf4ce8abf4f646ffc33590baa8bfa86281eb06478d517cc1b5'),
(214, 33, 46, 8.50, '{\"enrollment_id\":33,\"criterion_id\":46,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:05:11\"}', 'INSERT', 3, '2024-03-01 03:05:11', 'eee06c52492b8eaf4ce8abf4f646ffc33590baa8bfa86281eb06478d517cc1b5', 'c92dbe580b2116b9374c88c04a9f13172c5d745798c1f1f2c5228ffc903e69ab'),
(215, 34, 44, 7.50, '{\"enrollment_id\":34,\"criterion_id\":44,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:05:48\"}', 'INSERT', 3, '2024-03-01 03:05:48', 'c92dbe580b2116b9374c88c04a9f13172c5d745798c1f1f2c5228ffc903e69ab', '69aaedf3cdb47ab69366210b63187f9efeb06cc1097778b5accf77ff67eb3174'),
(216, 34, 45, 8.50, '{\"enrollment_id\":34,\"criterion_id\":45,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:06:25\"}', 'INSERT', 3, '2024-03-01 03:06:25', '69aaedf3cdb47ab69366210b63187f9efeb06cc1097778b5accf77ff67eb3174', '61fcc66a54681bb50d1855b614d526e4a31a79f191cd25c48548a550af469bd5'),
(217, 34, 46, 7.50, '{\"enrollment_id\":34,\"criterion_id\":46,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:07:02\"}', 'INSERT', 3, '2024-03-01 03:07:02', '61fcc66a54681bb50d1855b614d526e4a31a79f191cd25c48548a550af469bd5', '9ee72dad14d7f3144ca7f77b99622c57cdcbb2a18dffe86eb1c426ba069fe6b9'),
(218, 35, 44, 5.00, '{\"enrollment_id\":35,\"criterion_id\":44,\"score\":5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:07:39\"}', 'INSERT', 3, '2024-03-01 03:07:39', '9ee72dad14d7f3144ca7f77b99622c57cdcbb2a18dffe86eb1c426ba069fe6b9', '85490c2d1f902c5ce38d3aa3b739238303401f057a57b7ecd79827cd9903d399'),
(219, 35, 45, 5.50, '{\"enrollment_id\":35,\"criterion_id\":45,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:08:16\"}', 'INSERT', 3, '2024-03-01 03:08:16', '85490c2d1f902c5ce38d3aa3b739238303401f057a57b7ecd79827cd9903d399', '52cf74c6fef1a9a5c091c1028dbc384c8b0512d5a0d78538208620703b607963'),
(220, 35, 46, 6.00, '{\"enrollment_id\":35,\"criterion_id\":46,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2024-03-01 10:08:53\"}', 'INSERT', 3, '2024-03-01 03:08:53', '52cf74c6fef1a9a5c091c1028dbc384c8b0512d5a0d78538208620703b607963', 'd24838e6c92644427756d6a3b228ffb21aa80a6d17da48973fe106674e4e44ae'),
(221, 29, 33, 8.50, '{\"enrollment_id\":29,\"criterion_id\":33,\"score\":8.5,\"previous_score\":7.5,\"action\":\"UPDATE\",\"graded_by\":2,\"approved_by\":1,\"change_request\":1,\"timestamp\":\"2026-06-17 12:28:24\"}', 'UPDATE', 2, '2026-06-17 10:28:24', 'd24838e6c92644427756d6a3b228ffb21aa80a6d17da48973fe106674e4e44ae', 'c34ed2a45366daa700ef45184bccd4214b49facc5dd02eab27c1176c677d5c83'),
(222, 28, 33, 6.50, '{\"enrollment_id\":28,\"criterion_id\":33,\"score\":6.5,\"previous_score\":6,\"action\":\"UPDATE\",\"graded_by\":2,\"approved_by\":1,\"change_request\":2,\"timestamp\":\"2026-06-19 06:55:40\"}', 'UPDATE', 2, '2026-06-19 04:55:40', 'c34ed2a45366daa700ef45184bccd4214b49facc5dd02eab27c1176c677d5c83', 'c0cbb683e7ea8b83bc8897a610be8dfcaf7f4eedd74da7ecd1b82bc688204148'),
(223, 30, 33, 5.00, '{\"enrollment_id\":30,\"criterion_id\":33,\"score\":5,\"previous_score\":7,\"action\":\"UPDATE\",\"graded_by\":2,\"approved_by\":1,\"change_request\":4,\"timestamp\":\"2026-06-19 07:12:26\"}', 'UPDATE', 2, '2026-06-19 05:12:26', 'c0cbb683e7ea8b83bc8897a610be8dfcaf7f4eedd74da7ecd1b82bc688204148', 'b8144825817f8563331d825ef0b8e6b40aa7c49af9d67eacd23045809d60ea03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_enrollments`
--

CREATE TABLE `student_enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL DEFAULT '2024-1',
  `enrolled_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `student_enrollments`
--

INSERT INTO `student_enrollments` (`id`, `student_id`, `subject_id`, `semester`, `enrolled_at`) VALUES
(1, 4, 1, '2024-1', '2026-05-17 12:03:03'),
(2, 5, 1, '2024-1', '2026-05-17 12:03:03'),
(3, 6, 1, '2024-1', '2026-05-17 12:03:03'),
(4, 4, 2, '2024-1', '2026-05-17 12:03:03'),
(5, 5, 2, '2024-1', '2026-05-17 12:03:03'),
(6, 4, 4, '2024-1', '2026-06-17 10:26:14'),
(7, 5, 4, '2024-1', '2026-06-17 10:26:14'),
(8, 6, 4, '2024-1', '2026-06-17 10:26:14'),
(9, 8, 4, '2024-1', '2026-06-17 10:26:14'),
(10, 9, 4, '2024-1', '2026-06-17 10:26:14'),
(11, 4, 5, '2024-1', '2026-06-17 10:26:14'),
(12, 5, 5, '2024-1', '2026-06-17 10:26:14'),
(13, 6, 5, '2024-1', '2026-06-17 10:26:14'),
(14, 8, 5, '2024-1', '2026-06-17 10:26:14'),
(15, 9, 5, '2024-1', '2026-06-17 10:26:14'),
(16, 10, 5, '2024-1', '2026-06-17 10:26:14'),
(17, 11, 5, '2024-1', '2026-06-17 10:26:14'),
(18, 4, 6, '2024-1', '2026-06-17 10:26:14'),
(19, 5, 6, '2024-1', '2026-06-17 10:26:14'),
(20, 6, 6, '2024-1', '2026-06-17 10:26:14'),
(21, 8, 6, '2024-1', '2026-06-17 10:26:14'),
(22, 9, 6, '2024-1', '2026-06-17 10:26:14'),
(23, 10, 6, '2024-1', '2026-06-17 10:26:14'),
(24, 4, 7, '2024-1', '2026-06-17 10:26:14'),
(25, 5, 7, '2024-1', '2026-06-17 10:26:14'),
(26, 6, 7, '2024-1', '2026-06-17 10:26:14'),
(27, 8, 7, '2024-1', '2026-06-17 10:26:14'),
(28, 9, 7, '2024-1', '2026-06-17 10:26:14'),
(29, 10, 7, '2024-1', '2026-06-17 10:26:14'),
(30, 11, 7, '2024-1', '2026-06-17 10:26:14'),
(31, 4, 8, '2024-1', '2026-06-17 10:26:14'),
(32, 5, 8, '2024-1', '2026-06-17 10:26:14'),
(33, 6, 8, '2024-1', '2026-06-17 10:26:14'),
(34, 8, 8, '2024-1', '2026-06-17 10:26:14'),
(35, 9, 8, '2024-1', '2026-06-17 10:26:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_scores`
--

CREATE TABLE `student_scores` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  `criterion_id` int(11) NOT NULL,
  `score` decimal(5,2) NOT NULL DEFAULT 0.00,
  `graded_by` int(11) NOT NULL,
  `graded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `student_scores`
--

INSERT INTO `student_scores` (`id`, `enrollment_id`, `criterion_id`, `score`, `graded_by`, `graded_at`, `updated_at`) VALUES
(1, 1, 1, 8.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(2, 1, 2, 7.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(3, 1, 3, 7.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(4, 1, 4, 8.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(5, 1, 5, 9.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(6, 1, 6, 8.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(7, 1, 7, 9.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(8, 2, 1, 6.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(9, 2, 2, 6.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(10, 2, 3, 5.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(11, 2, 4, 6.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(12, 2, 5, 7.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(13, 2, 6, 6.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(14, 2, 7, 7.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(15, 3, 1, 9.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(16, 3, 2, 8.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(17, 3, 3, 8.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(18, 3, 4, 9.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(19, 3, 5, 9.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(20, 3, 6, 9.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(21, 3, 7, 10.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(22, 4, 8, 8.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(23, 4, 9, 7.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(24, 4, 10, 8.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(25, 4, 11, 7.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(26, 5, 8, 6.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(27, 5, 9, 7.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(28, 5, 10, 6.00, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(29, 5, 11, 6.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03'),
(30, 6, 12, 8.50, 7, '2024-03-01 01:00:00', '2026-06-17 10:26:14'),
(31, 6, 13, 7.00, 7, '2024-03-01 01:00:37', '2026-06-17 10:26:14'),
(32, 7, 12, 7.00, 7, '2024-03-01 01:01:14', '2026-06-17 10:26:14'),
(33, 7, 13, 6.50, 7, '2024-03-01 01:01:51', '2026-06-17 10:26:14'),
(34, 8, 12, 8.50, 7, '2024-03-01 01:02:28', '2026-06-17 10:26:14'),
(35, 8, 13, 9.00, 7, '2024-03-01 01:03:05', '2026-06-17 10:26:14'),
(36, 9, 12, 8.00, 7, '2024-03-01 01:03:42', '2026-06-17 10:26:14'),
(37, 9, 13, 7.50, 7, '2024-03-01 01:04:19', '2026-06-17 10:26:14'),
(38, 10, 12, 5.00, 7, '2024-03-01 01:04:56', '2026-06-17 10:26:14'),
(39, 10, 13, 5.50, 7, '2024-03-01 01:05:33', '2026-06-17 10:26:14'),
(40, 6, 14, 9.00, 7, '2024-03-01 01:06:10', '2026-06-17 10:26:14'),
(41, 6, 15, 8.50, 7, '2024-03-01 01:06:47', '2026-06-17 10:26:14'),
(42, 7, 14, 5.50, 7, '2024-03-01 01:07:24', '2026-06-17 10:26:14'),
(43, 7, 15, 6.00, 7, '2024-03-01 01:08:01', '2026-06-17 10:26:14'),
(44, 8, 14, 9.50, 7, '2024-03-01 01:08:38', '2026-06-17 10:26:14'),
(45, 8, 15, 9.00, 7, '2024-03-01 01:09:15', '2026-06-17 10:26:14'),
(46, 9, 14, 7.00, 7, '2024-03-01 01:09:52', '2026-06-17 10:26:14'),
(47, 9, 15, 7.50, 7, '2024-03-01 01:10:29', '2026-06-17 10:26:14'),
(48, 10, 14, 5.50, 7, '2024-03-01 01:11:06', '2026-06-17 10:26:14'),
(49, 10, 15, 5.00, 7, '2024-03-01 01:11:43', '2026-06-17 10:26:14'),
(50, 6, 16, 8.00, 7, '2024-03-01 01:12:20', '2026-06-17 10:26:14'),
(51, 6, 17, 9.00, 7, '2024-03-01 01:12:57', '2026-06-17 10:26:14'),
(52, 6, 18, 8.50, 7, '2024-03-01 01:13:34', '2026-06-17 10:26:14'),
(53, 7, 16, 5.50, 7, '2024-03-01 01:14:11', '2026-06-17 10:26:14'),
(54, 7, 17, 6.50, 7, '2024-03-01 01:14:48', '2026-06-17 10:26:14'),
(55, 7, 18, 7.00, 7, '2024-03-01 01:15:25', '2026-06-17 10:26:14'),
(56, 8, 16, 9.00, 7, '2024-03-01 01:16:02', '2026-06-17 10:26:14'),
(57, 8, 17, 8.50, 7, '2024-03-01 01:16:39', '2026-06-17 10:26:14'),
(58, 8, 18, 9.00, 7, '2024-03-01 01:17:16', '2026-06-17 10:26:14'),
(59, 9, 16, 8.00, 7, '2024-03-01 01:17:53', '2026-06-17 10:26:14'),
(60, 9, 17, 7.50, 7, '2024-03-01 01:18:30', '2026-06-17 10:26:14'),
(61, 9, 18, 7.00, 7, '2024-03-01 01:19:07', '2026-06-17 10:26:14'),
(62, 10, 16, 6.00, 7, '2024-03-01 01:19:44', '2026-06-17 10:26:14'),
(63, 10, 17, 5.50, 7, '2024-03-01 01:20:21', '2026-06-17 10:26:14'),
(64, 10, 18, 5.00, 7, '2024-03-01 01:20:58', '2026-06-17 10:26:14'),
(65, 11, 19, 8.00, 3, '2024-03-01 01:21:35', '2026-06-17 10:26:14'),
(66, 11, 20, 9.00, 3, '2024-03-01 01:22:12', '2026-06-17 10:26:14'),
(67, 12, 19, 6.50, 3, '2024-03-01 01:22:49', '2026-06-17 10:26:14'),
(68, 12, 20, 5.50, 3, '2024-03-01 01:23:26', '2026-06-17 10:26:14'),
(69, 13, 19, 9.00, 3, '2024-03-01 01:24:03', '2026-06-17 10:26:14'),
(70, 13, 20, 9.50, 3, '2024-03-01 01:24:40', '2026-06-17 10:26:14'),
(71, 14, 19, 7.50, 3, '2024-03-01 01:25:17', '2026-06-17 10:26:14'),
(72, 14, 20, 7.00, 3, '2024-03-01 01:25:54', '2026-06-17 10:26:14'),
(73, 15, 19, 5.50, 3, '2024-03-01 01:26:31', '2026-06-17 10:26:14'),
(74, 15, 20, 6.00, 3, '2024-03-01 01:27:08', '2026-06-17 10:26:14'),
(75, 16, 19, 8.00, 3, '2024-03-01 01:27:45', '2026-06-17 10:26:14'),
(76, 16, 20, 7.50, 3, '2024-03-01 01:28:22', '2026-06-17 10:26:14'),
(77, 17, 19, 7.50, 3, '2024-03-01 01:28:59', '2026-06-17 10:26:14'),
(78, 17, 20, 7.00, 3, '2024-03-01 01:29:36', '2026-06-17 10:26:14'),
(79, 11, 21, 7.50, 3, '2024-03-01 01:30:13', '2026-06-17 10:26:14'),
(80, 11, 22, 8.00, 3, '2024-03-01 01:30:50', '2026-06-17 10:26:14'),
(81, 12, 21, 7.00, 3, '2024-03-01 01:31:27', '2026-06-17 10:26:14'),
(82, 12, 22, 6.50, 3, '2024-03-01 01:32:04', '2026-06-17 10:26:14'),
(83, 13, 21, 8.50, 3, '2024-03-01 01:32:41', '2026-06-17 10:26:14'),
(84, 13, 22, 9.00, 3, '2024-03-01 01:33:18', '2026-06-17 10:26:14'),
(85, 14, 21, 8.50, 3, '2024-03-01 01:33:55', '2026-06-17 10:26:14'),
(86, 14, 22, 7.50, 3, '2024-03-01 01:34:32', '2026-06-17 10:26:14'),
(87, 15, 21, 5.00, 3, '2024-03-01 01:35:09', '2026-06-17 10:26:14'),
(88, 15, 22, 5.50, 3, '2024-03-01 01:35:46', '2026-06-17 10:26:14'),
(89, 16, 21, 8.50, 3, '2024-03-01 01:36:23', '2026-06-17 10:26:14'),
(90, 16, 22, 8.00, 3, '2024-03-01 01:37:00', '2026-06-17 10:26:14'),
(91, 17, 21, 6.50, 3, '2024-03-01 01:37:37', '2026-06-17 10:26:14'),
(92, 17, 22, 7.50, 3, '2024-03-01 01:38:14', '2026-06-17 10:26:14'),
(93, 11, 23, 9.00, 3, '2024-03-01 01:38:51', '2026-06-17 10:26:14'),
(94, 11, 24, 7.50, 3, '2024-03-01 01:39:28', '2026-06-17 10:26:14'),
(95, 11, 25, 8.00, 3, '2024-03-01 01:40:05', '2026-06-17 10:26:14'),
(96, 12, 23, 7.00, 3, '2024-03-01 01:40:42', '2026-06-17 10:26:14'),
(97, 12, 24, 6.50, 3, '2024-03-01 01:41:19', '2026-06-17 10:26:14'),
(98, 12, 25, 5.50, 3, '2024-03-01 01:41:56', '2026-06-17 10:26:14'),
(99, 13, 23, 9.00, 3, '2024-03-01 01:42:33', '2026-06-17 10:26:14'),
(100, 13, 24, 9.50, 3, '2024-03-01 01:43:10', '2026-06-17 10:26:14'),
(101, 13, 25, 9.00, 3, '2024-03-01 01:43:47', '2026-06-17 10:26:14'),
(102, 14, 23, 7.00, 3, '2024-03-01 01:44:24', '2026-06-17 10:26:14'),
(103, 14, 24, 7.50, 3, '2024-03-01 01:45:01', '2026-06-17 10:26:14'),
(104, 14, 25, 8.00, 3, '2024-03-01 01:45:38', '2026-06-17 10:26:14'),
(105, 15, 23, 5.00, 3, '2024-03-01 01:46:15', '2026-06-17 10:26:14'),
(106, 15, 24, 5.50, 3, '2024-03-01 01:46:52', '2026-06-17 10:26:14'),
(107, 15, 25, 6.00, 3, '2024-03-01 01:47:29', '2026-06-17 10:26:14'),
(108, 16, 23, 8.00, 3, '2024-03-01 01:48:06', '2026-06-17 10:26:14'),
(109, 16, 24, 7.50, 3, '2024-03-01 01:48:43', '2026-06-17 10:26:14'),
(110, 16, 25, 8.00, 3, '2024-03-01 01:49:20', '2026-06-17 10:26:14'),
(111, 17, 23, 7.50, 3, '2024-03-01 01:49:57', '2026-06-17 10:26:14'),
(112, 17, 24, 7.00, 3, '2024-03-01 01:50:34', '2026-06-17 10:26:14'),
(113, 17, 25, 6.50, 3, '2024-03-01 01:51:11', '2026-06-17 10:26:14'),
(114, 18, 26, 8.00, 7, '2024-03-01 01:51:48', '2026-06-17 10:26:14'),
(115, 18, 27, 9.00, 7, '2024-03-01 01:52:25', '2026-06-17 10:26:14'),
(116, 19, 26, 6.50, 7, '2024-03-01 01:53:02', '2026-06-17 10:26:14'),
(117, 19, 27, 5.50, 7, '2024-03-01 01:53:39', '2026-06-17 10:26:14'),
(118, 20, 26, 9.00, 7, '2024-03-01 01:54:16', '2026-06-17 10:26:14'),
(119, 20, 27, 9.50, 7, '2024-03-01 01:54:53', '2026-06-17 10:26:14'),
(120, 21, 26, 7.50, 7, '2024-03-01 01:55:30', '2026-06-17 10:26:14'),
(121, 21, 27, 7.00, 7, '2024-03-01 01:56:07', '2026-06-17 10:26:14'),
(122, 22, 26, 6.00, 7, '2024-03-01 01:56:44', '2026-06-17 10:26:14'),
(123, 22, 27, 5.50, 7, '2024-03-01 01:57:21', '2026-06-17 10:26:14'),
(124, 23, 26, 7.50, 7, '2024-03-01 01:57:58', '2026-06-17 10:26:14'),
(125, 23, 27, 8.00, 7, '2024-03-01 01:58:35', '2026-06-17 10:26:14'),
(126, 18, 28, 9.00, 7, '2024-03-01 01:59:12', '2026-06-17 10:26:14'),
(127, 18, 29, 8.50, 7, '2024-03-01 01:59:49', '2026-06-17 10:26:14'),
(128, 19, 28, 5.50, 7, '2024-03-01 02:00:26', '2026-06-17 10:26:14'),
(129, 19, 29, 6.50, 7, '2024-03-01 02:01:03', '2026-06-17 10:26:14'),
(130, 20, 28, 9.50, 7, '2024-03-01 02:01:40', '2026-06-17 10:26:14'),
(131, 20, 29, 9.00, 7, '2024-03-01 02:02:17', '2026-06-17 10:26:14'),
(132, 21, 28, 7.00, 7, '2024-03-01 02:02:54', '2026-06-17 10:26:14'),
(133, 21, 29, 7.50, 7, '2024-03-01 02:03:31', '2026-06-17 10:26:14'),
(134, 22, 28, 6.00, 7, '2024-03-01 02:04:08', '2026-06-17 10:26:14'),
(135, 22, 29, 5.00, 7, '2024-03-01 02:04:45', '2026-06-17 10:26:14'),
(136, 23, 28, 7.50, 7, '2024-03-01 02:05:22', '2026-06-17 10:26:14'),
(137, 23, 29, 8.50, 7, '2024-03-01 02:05:59', '2026-06-17 10:26:14'),
(138, 18, 30, 9.00, 7, '2024-03-01 02:06:36', '2026-06-17 10:26:14'),
(139, 18, 31, 7.50, 7, '2024-03-01 02:07:13', '2026-06-17 10:26:14'),
(140, 18, 32, 8.00, 7, '2024-03-01 02:07:50', '2026-06-17 10:26:14'),
(141, 19, 30, 7.00, 7, '2024-03-01 02:08:27', '2026-06-17 10:26:14'),
(142, 19, 31, 6.50, 7, '2024-03-01 02:09:04', '2026-06-17 10:26:14'),
(143, 19, 32, 5.50, 7, '2024-03-01 02:09:41', '2026-06-17 10:26:14'),
(144, 20, 30, 9.00, 7, '2024-03-01 02:10:18', '2026-06-17 10:26:14'),
(145, 20, 31, 9.50, 7, '2024-03-01 02:10:55', '2026-06-17 10:26:14'),
(146, 20, 32, 9.00, 7, '2024-03-01 02:11:32', '2026-06-17 10:26:14'),
(147, 21, 30, 7.00, 7, '2024-03-01 02:12:09', '2026-06-17 10:26:14'),
(148, 21, 31, 7.50, 7, '2024-03-01 02:12:46', '2026-06-17 10:26:14'),
(149, 21, 32, 8.00, 7, '2024-03-01 02:13:23', '2026-06-17 10:26:14'),
(150, 22, 30, 5.00, 7, '2024-03-01 02:14:00', '2026-06-17 10:26:14'),
(151, 22, 31, 5.50, 7, '2024-03-01 02:14:37', '2026-06-17 10:26:14'),
(152, 22, 32, 6.00, 7, '2024-03-01 02:15:14', '2026-06-17 10:26:14'),
(153, 23, 30, 8.00, 7, '2024-03-01 02:15:51', '2026-06-17 10:26:14'),
(154, 23, 31, 7.50, 7, '2024-03-01 02:16:28', '2026-06-17 10:26:14'),
(155, 23, 32, 8.00, 7, '2024-03-01 02:17:05', '2026-06-17 10:26:14'),
(156, 24, 33, 9.00, 2, '2024-03-01 02:17:42', '2026-06-17 10:26:14'),
(157, 24, 34, 8.50, 2, '2024-03-01 02:18:19', '2026-06-17 10:26:14'),
(158, 25, 33, 5.50, 2, '2024-03-01 02:18:56', '2026-06-17 10:26:14'),
(159, 25, 34, 6.50, 2, '2024-03-01 02:19:33', '2026-06-17 10:26:14'),
(160, 26, 33, 9.50, 2, '2024-03-01 02:20:10', '2026-06-17 10:26:14'),
(161, 26, 34, 9.00, 2, '2024-03-01 02:20:47', '2026-06-17 10:26:14'),
(162, 27, 33, 7.00, 2, '2024-03-01 02:21:24', '2026-06-17 10:26:14'),
(163, 27, 34, 7.50, 2, '2024-03-01 02:22:01', '2026-06-17 10:26:14'),
(164, 28, 33, 6.50, 2, '2026-06-19 04:55:40', '2026-06-19 04:55:40'),
(165, 28, 34, 5.00, 2, '2024-03-01 02:23:15', '2026-06-17 10:26:14'),
(166, 29, 33, 8.50, 2, '2026-06-17 10:28:24', '2026-06-17 10:28:24'),
(167, 29, 34, 8.50, 2, '2024-03-01 02:24:29', '2026-06-17 10:26:14'),
(168, 30, 33, 5.00, 2, '2026-06-19 05:12:26', '2026-06-19 05:12:26'),
(169, 30, 34, 6.50, 2, '2024-03-01 02:25:43', '2026-06-17 10:26:14'),
(170, 24, 35, 8.00, 2, '2024-03-01 02:26:20', '2026-06-17 10:26:14'),
(171, 24, 36, 9.00, 2, '2024-03-01 02:26:57', '2026-06-17 10:26:14'),
(172, 25, 35, 6.50, 2, '2024-03-01 02:27:34', '2026-06-17 10:26:14'),
(173, 25, 36, 5.50, 2, '2024-03-01 02:28:11', '2026-06-17 10:26:14'),
(174, 26, 35, 9.00, 2, '2024-03-01 02:28:48', '2026-06-17 10:26:14'),
(175, 26, 36, 9.50, 2, '2024-03-01 02:29:25', '2026-06-17 10:26:14'),
(176, 27, 35, 7.50, 2, '2024-03-01 02:30:02', '2026-06-17 10:26:14'),
(177, 27, 36, 7.00, 2, '2024-03-01 02:30:39', '2026-06-17 10:26:14'),
(178, 28, 35, 5.50, 2, '2024-03-01 02:31:16', '2026-06-17 10:26:14'),
(179, 28, 36, 6.00, 2, '2024-03-01 02:31:53', '2026-06-17 10:26:14'),
(180, 29, 35, 8.00, 2, '2024-03-01 02:32:30', '2026-06-17 10:26:14'),
(181, 29, 36, 7.50, 2, '2024-03-01 02:33:07', '2026-06-17 10:26:14'),
(182, 30, 35, 7.50, 2, '2024-03-01 02:33:44', '2026-06-17 10:26:14'),
(183, 30, 36, 7.00, 2, '2024-03-01 02:34:21', '2026-06-17 10:26:14'),
(184, 24, 37, 7.50, 2, '2024-03-01 02:34:58', '2026-06-17 10:26:14'),
(185, 24, 38, 8.00, 2, '2024-03-01 02:35:35', '2026-06-17 10:26:14'),
(186, 24, 39, 9.00, 2, '2024-03-01 02:36:12', '2026-06-17 10:26:14'),
(187, 25, 37, 6.50, 2, '2024-03-01 02:36:49', '2026-06-17 10:26:14'),
(188, 25, 38, 5.50, 2, '2024-03-01 02:37:26', '2026-06-17 10:26:14'),
(189, 25, 39, 6.50, 2, '2024-03-01 02:38:03', '2026-06-17 10:26:14'),
(190, 26, 37, 9.50, 2, '2024-03-01 02:38:40', '2026-06-17 10:26:14'),
(191, 26, 38, 9.00, 2, '2024-03-01 02:39:17', '2026-06-17 10:26:14'),
(192, 26, 39, 8.50, 2, '2024-03-01 02:39:54', '2026-06-17 10:26:14'),
(193, 27, 37, 7.50, 2, '2024-03-01 02:40:31', '2026-06-17 10:26:14'),
(194, 27, 38, 8.00, 2, '2024-03-01 02:41:08', '2026-06-17 10:26:14'),
(195, 27, 39, 7.50, 2, '2024-03-01 02:41:45', '2026-06-17 10:26:14'),
(196, 28, 37, 5.50, 2, '2024-03-01 02:42:22', '2026-06-17 10:26:14'),
(197, 28, 38, 6.00, 2, '2024-03-01 02:42:59', '2026-06-17 10:26:14'),
(198, 28, 39, 5.50, 2, '2024-03-01 02:43:36', '2026-06-17 10:26:14'),
(199, 29, 37, 7.50, 2, '2024-03-01 02:44:13', '2026-06-17 10:26:14'),
(200, 29, 38, 8.00, 2, '2024-03-01 02:44:50', '2026-06-17 10:26:14'),
(201, 29, 39, 8.50, 2, '2024-03-01 02:45:27', '2026-06-17 10:26:14'),
(202, 30, 37, 7.00, 2, '2024-03-01 02:46:04', '2026-06-17 10:26:14'),
(203, 30, 38, 6.50, 2, '2024-03-01 02:46:41', '2026-06-17 10:26:14'),
(204, 30, 39, 7.00, 2, '2024-03-01 02:47:18', '2026-06-17 10:26:14'),
(205, 31, 40, 9.00, 3, '2024-03-01 02:47:55', '2026-06-17 10:26:14'),
(206, 31, 41, 8.50, 3, '2024-03-01 02:48:32', '2026-06-17 10:26:14'),
(207, 32, 40, 5.50, 3, '2024-03-01 02:49:09', '2026-06-17 10:26:14'),
(208, 32, 41, 6.00, 3, '2024-03-01 02:49:46', '2026-06-17 10:26:14'),
(209, 33, 40, 9.50, 3, '2024-03-01 02:50:23', '2026-06-17 10:26:14'),
(210, 33, 41, 9.00, 3, '2024-03-01 02:51:00', '2026-06-17 10:26:14'),
(211, 34, 40, 7.00, 3, '2024-03-01 02:51:37', '2026-06-17 10:26:14'),
(212, 34, 41, 7.50, 3, '2024-03-01 02:52:14', '2026-06-17 10:26:14'),
(213, 35, 40, 5.50, 3, '2024-03-01 02:52:51', '2026-06-17 10:26:14'),
(214, 35, 41, 5.00, 3, '2024-03-01 02:53:28', '2026-06-17 10:26:14'),
(215, 31, 42, 8.00, 3, '2024-03-01 02:54:05', '2026-06-17 10:26:14'),
(216, 31, 43, 9.00, 3, '2024-03-01 02:54:42', '2026-06-17 10:26:14'),
(217, 32, 42, 6.50, 3, '2024-03-01 02:55:19', '2026-06-17 10:26:14'),
(218, 32, 43, 5.50, 3, '2024-03-01 02:55:56', '2026-06-17 10:26:14'),
(219, 33, 42, 9.00, 3, '2024-03-01 02:56:33', '2026-06-17 10:26:14'),
(220, 33, 43, 9.50, 3, '2024-03-01 02:57:10', '2026-06-17 10:26:14'),
(221, 34, 42, 7.50, 3, '2024-03-01 02:57:47', '2026-06-17 10:26:14'),
(222, 34, 43, 7.00, 3, '2024-03-01 02:58:24', '2026-06-17 10:26:14'),
(223, 35, 42, 5.50, 3, '2024-03-01 02:59:01', '2026-06-17 10:26:14'),
(224, 35, 43, 6.00, 3, '2024-03-01 02:59:38', '2026-06-17 10:26:14'),
(225, 31, 44, 8.50, 3, '2024-03-01 03:00:15', '2026-06-17 10:26:14'),
(226, 31, 45, 7.00, 3, '2024-03-01 03:00:52', '2026-06-17 10:26:14'),
(227, 31, 46, 8.00, 3, '2024-03-01 03:01:29', '2026-06-17 10:26:14'),
(228, 32, 44, 6.50, 3, '2024-03-01 03:02:06', '2026-06-17 10:26:14'),
(229, 32, 45, 5.50, 3, '2024-03-01 03:02:43', '2026-06-17 10:26:14'),
(230, 32, 46, 6.00, 3, '2024-03-01 03:03:20', '2026-06-17 10:26:14'),
(231, 33, 44, 9.50, 3, '2024-03-01 03:03:57', '2026-06-17 10:26:14'),
(232, 33, 45, 9.00, 3, '2024-03-01 03:04:34', '2026-06-17 10:26:14'),
(233, 33, 46, 8.50, 3, '2024-03-01 03:05:11', '2026-06-17 10:26:14'),
(234, 34, 44, 7.50, 3, '2024-03-01 03:05:48', '2026-06-17 10:26:14'),
(235, 34, 45, 8.50, 3, '2024-03-01 03:06:25', '2026-06-17 10:26:14'),
(236, 34, 46, 7.50, 3, '2024-03-01 03:07:02', '2026-06-17 10:26:14'),
(237, 35, 44, 5.00, 3, '2024-03-01 03:07:39', '2026-06-17 10:26:14'),
(238, 35, 45, 5.50, 3, '2024-03-01 03:08:16', '2026-06-17 10:26:14'),
(239, 35, 46, 6.00, 3, '2024-03-01 03:08:53', '2026-06-17 10:26:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `credits` int(11) NOT NULL DEFAULT 3,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `lecturer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subjects`
--

INSERT INTO `subjects` (`id`, `program_id`, `code`, `name`, `credits`, `created_at`, `lecturer_id`) VALUES
(1, 1, 'INS3064', 'Web Application Development 2', 3, '2026-05-17 12:03:03', NULL),
(2, 1, 'INS3021', 'Database Systems', 3, '2026-05-17 12:03:03', NULL),
(3, 2, 'SE3001', 'Software Engineering Principles', 3, '2026-05-17 12:03:03', NULL),
(4, 2, 'SE3002', 'Software Design Patterns', 3, '2026-06-17 10:26:14', NULL),
(5, 1, 'INS4001', 'Advanced Web Development', 3, '2026-06-17 10:26:14', NULL),
(6, 1, 'INS4010', 'Machine Learning Applications', 3, '2026-06-17 10:26:14', NULL),
(7, 1, 'INS3080', 'Data Structures & Algorithms', 3, '2026-06-17 10:26:14', NULL),
(8, 2, 'SE4002', 'Agile Software Development', 3, '2026-06-17 10:26:14', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','lecturer','student') NOT NULL DEFAULT 'student',
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `role`, `full_name`, `email`, `created_at`) VALUES
(1, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'System Administrator', 'admin@vnu.edu.vn', '2026-05-17 12:03:03'),
(2, 'lecturer1', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lecturer', 'Nguyễn Văn An', 'lecturer1@vnu.edu.vn', '2026-05-17 12:03:03'),
(3, 'lecturer2', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lecturer', 'Trần Thị Bình', 'lecturer2@vnu.edu.vn', '2026-05-17 12:03:03'),
(4, 'student1', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Lê Văn Cường', 'student1@vnu.edu.vn', '2026-05-17 12:03:03'),
(5, 'student2', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Phạm Thị Dung', 'student2@vnu.edu.vn', '2026-05-17 12:03:03'),
(6, 'student3', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Hoàng Văn Em', 'student3@vnu.edu.vn', '2026-05-17 12:03:03'),
(7, 'lecturer3', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lecturer', 'Le Thi An', 'lethian@vnu.edu.vn', '2026-06-17 10:26:14'),
(8, 'student4', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Vu Thi Giang', 'student4@vnu.edu.vn', '2026-06-17 10:26:14'),
(9, 'student5', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Dang Van Hung', 'student5@vnu.edu.vn', '2026-06-17 10:26:14'),
(10, 'student6', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Bui Thi Kim', 'student6@vnu.edu.vn', '2026-06-17 10:26:14'),
(11, 'student7', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Nguyen Thi Lan', 'student7@vnu.edu.vn', '2026-06-17 10:26:14');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `lecturer_id` (`lecturer_id`);

--
-- Chỉ mục cho bảng `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

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
  ADD KEY `plo_id` (`plo_id`);

--
-- Chỉ mục cho bảng `grade_change_requests`
--
ALTER TABLE `grade_change_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollment_id` (`enrollment_id`),
  ADD KEY `criterion_id` (`criterion_id`),
  ADD KEY `requested_by` (`requested_by`),
  ADD KEY `reviewed_by` (`reviewed_by`),
  ADD KEY `status` (`status`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `created_by` (`created_by`);

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
  ADD KEY `enrollment_id` (`enrollment_id`),
  ADD KEY `criterion_id` (`criterion_id`),
  ADD KEY `graded_by` (`graded_by`);

--
-- Chỉ mục cho bảng `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_enrollment` (`student_id`,`subject_id`,`semester`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Chỉ mục cho bảng `student_scores`
--
ALTER TABLE `student_scores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_score` (`enrollment_id`,`criterion_id`),
  ADD KEY `criterion_id` (`criterion_id`),
  ADD KEY `graded_by` (`graded_by`);

--
-- Chỉ mục cho bảng `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `fk_subjects_lecturer` (`lecturer_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `clos`
--
ALTER TABLE `clos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `clo_plo_mappings`
--
ALTER TABLE `clo_plo_mappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `grade_change_requests`
--
ALTER TABLE `grade_change_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `plos`
--
ALTER TABLE `plos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `rubrics`
--
ALTER TABLE `rubrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `rubric_criteria`
--
ALTER TABLE `rubric_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `score_ledger`
--
ALTER TABLE `score_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT cho bảng `student_enrollments`
--
ALTER TABLE `student_enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `student_scores`
--
ALTER TABLE `student_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT cho bảng `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `assessments`
--
ALTER TABLE `assessments`
  ADD CONSTRAINT `assessments_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assessments_ibfk_2` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

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
-- Các ràng buộc cho bảng `grade_change_requests`
--
ALTER TABLE `grade_change_requests`
  ADD CONSTRAINT `gcr_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `student_enrollments` (`id`),
  ADD CONSTRAINT `gcr_ibfk_2` FOREIGN KEY (`criterion_id`) REFERENCES `rubric_criteria` (`id`),
  ADD CONSTRAINT `gcr_ibfk_3` FOREIGN KEY (`requested_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `gcr_ibfk_4` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notif_sender` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_notif_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `rubric_criteria_ibfk_2` FOREIGN KEY (`clo_id`) REFERENCES `clos` (`id`) ON DELETE SET NULL;

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
-- Các ràng buộc cho bảng `student_scores`
--
ALTER TABLE `student_scores`
  ADD CONSTRAINT `student_scores_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `student_enrollments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_scores_ibfk_2` FOREIGN KEY (`criterion_id`) REFERENCES `rubric_criteria` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_scores_ibfk_3` FOREIGN KEY (`graded_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `fk_subjects_lecturer` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
