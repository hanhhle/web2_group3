-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 22, 2026 lúc 08:32 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

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
(1, 1, 2, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(2, 1, 2, 'Midterm Exam', 'midterm', 30.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(3, 1, 2, 'Final Project Delivery', 'final', 60.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(4, 2, 3, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(5, 2, 3, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(6, 2, 3, 'Final Project Delivery', 'final', 60.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(7, 3, 7, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(8, 3, 7, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(9, 3, 7, 'Final Project Delivery', 'final', 60.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(10, 4, 7, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(11, 4, 7, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(12, 4, 7, 'Final Project Delivery', 'final', 60.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(13, 5, 2, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(14, 5, 2, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(15, 5, 2, 'Final Project Delivery', 'final', 60.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(16, 6, 7, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(17, 6, 7, 'Midterm Exam', 'midterm', 30.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(18, 6, 7, 'Final Project Delivery', 'final', 60.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(19, 7, 3, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(20, 7, 3, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(21, 7, 3, 'Final Project Delivery', 'final', 60.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(22, 8, 7, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(23, 8, 7, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(24, 8, 7, 'Final Project Delivery', 'final', 60.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(25, 9, 7, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(26, 9, 7, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(27, 9, 7, 'Final Project Delivery', 'final', 60.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(28, 10, 3, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(29, 10, 3, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(30, 10, 3, 'Final Project Delivery', 'final', 60.00, 10.00, '2024-1', '2026-06-19 03:16:36'),
(31, 11, 7, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(32, 11, 7, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(33, 11, 7, 'Final Project Delivery', 'final', 60.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(34, 12, 2, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(35, 12, 2, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(36, 12, 2, 'Final Project Delivery', 'final', 60.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(37, 13, 7, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(38, 13, 7, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(39, 13, 7, 'Final Project Delivery', 'final', 60.00, 10.00, '2024-2', '2026-06-19 03:16:36'),
(40, 14, 2, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(41, 14, 2, 'Midterm Exam', 'midterm', 30.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(42, 14, 2, 'Final Project Delivery', 'final', 60.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(43, 15, 3, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(44, 15, 3, 'Midterm Exam', 'midterm', 30.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(45, 15, 3, 'Final Project Delivery', 'final', 60.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(46, 16, 7, 'Attendance & Weekly Quizzes', 'attendance', 10.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(47, 16, 7, 'Midterm Exam', 'midterm', 30.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(48, 16, 7, 'Final Project Delivery', 'final', 60.00, 10.00, '2025-1', '2026-06-19 03:16:36'),
(49, 17, 2, 'Programming Assignment', 'attendance', 30.00, 100.00, '2025-1', '2026-06-22 06:31:33'),
(50, 17, 2, 'Final Exam Project', 'final', 70.00, 100.00, '2025-1', '2026-06-22 06:31:33'),
(51, 18, 2, 'Midterm Theory Test', 'midterm', 40.00, 100.00, '2025-1', '2026-06-22 06:31:33'),
(52, 18, 2, 'Final Coding Exam', 'final', 60.00, 100.00, '2025-1', '2026-06-22 06:31:33'),
(53, 19, 2, 'Hands-on Lab Exam', 'midterm', 50.00, 100.00, '2025-1', '2026-06-22 06:31:33'),
(54, 19, 2, 'Network Defense Paper', 'final', 50.00, 100.00, '2025-1', '2026-06-22 06:31:33'),
(55, 20, 2, 'Cryptanalysis Lab', 'midterm', 40.00, 100.00, '2025-1', '2026-06-22 06:31:33'),
(56, 20, 2, 'Secure Protocol Project', 'final', 60.00, 100.00, '2025-1', '2026-06-22 06:31:33');

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
(1, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=1 criterion=15 score=9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(2, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=1 criterion=16 score=10 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(3, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=1 criterion=17 score=8.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(4, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=1 criterion=18 score=9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(5, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=1 criterion=19 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(6, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=1 criterion=20 score=7.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(7, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=1 criterion=21 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(8, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=2 criterion=22 score=9.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(9, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=2 criterion=23 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(10, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=2 criterion=24 score=9.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(11, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=2 criterion=25 score=8.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(12, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=2 criterion=26 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(13, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=2 criterion=27 score=8.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(14, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=2 criterion=28 score=9.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(15, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=3 criterion=29 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(16, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=3 criterion=30 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(17, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=3 criterion=31 score=7.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(18, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=3 criterion=32 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(19, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=3 criterion=33 score=8.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(20, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=3 criterion=34 score=7.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(21, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=3 criterion=35 score=7.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(22, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=4 criterion=50 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(23, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=4 criterion=51 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(24, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=4 criterion=52 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(25, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=4 criterion=53 score=8.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(26, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=4 criterion=54 score=9.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(27, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=4 criterion=55 score=9.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(28, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=4 criterion=56 score=7.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(29, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=5 criterion=57 score=9.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(30, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=5 criterion=58 score=7.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(31, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=5 criterion=59 score=8.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(32, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=5 criterion=60 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(33, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=5 criterion=61 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(34, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=5 criterion=62 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(35, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=5 criterion=63 score=7.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(36, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=6 criterion=64 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(37, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=6 criterion=65 score=8.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(38, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=6 criterion=66 score=9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(39, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=6 criterion=67 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(40, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=6 criterion=68 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(41, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=6 criterion=69 score=8.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(42, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=6 criterion=70 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(43, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=7 criterion=8 score=7.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(44, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=7 criterion=9 score=7.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(45, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=7 criterion=10 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(46, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=7 criterion=11 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(47, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=7 criterion=12 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(48, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=7 criterion=13 score=7.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(49, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=7 criterion=14 score=8.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(50, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=8 criterion=43 score=8.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(51, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=8 criterion=44 score=7.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(52, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=8 criterion=45 score=9.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(53, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=8 criterion=46 score=9.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(54, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=8 criterion=47 score=9.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(55, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=8 criterion=48 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(56, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=8 criterion=49 score=8.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(57, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=9 criterion=71 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(58, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=9 criterion=72 score=9.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(59, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=9 criterion=73 score=7.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(60, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=9 criterion=74 score=9.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(61, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=9 criterion=75 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(62, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=9 criterion=76 score=8.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(63, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=9 criterion=77 score=9.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(64, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=10 criterion=78 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(65, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=10 criterion=79 score=9.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(66, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=10 criterion=80 score=8.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(67, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=10 criterion=81 score=7.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(68, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=10 criterion=82 score=7.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(69, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=10 criterion=83 score=7.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(70, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=10 criterion=84 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(71, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=11 criterion=85 score=9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(72, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=11 criterion=86 score=7.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(73, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=11 criterion=87 score=8.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(74, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=11 criterion=88 score=9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(75, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=11 criterion=89 score=9.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(76, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=11 criterion=90 score=9.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(77, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=11 criterion=91 score=9.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(78, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=12 criterion=1 score=8.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(79, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=12 criterion=2 score=10 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(80, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=12 criterion=3 score=8.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(81, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=12 criterion=4 score=9.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(82, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=12 criterion=5 score=8.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(83, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=12 criterion=6 score=9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(84, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=12 criterion=7 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(85, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=13 criterion=36 score=8.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(86, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=13 criterion=37 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(87, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=13 criterion=38 score=10 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(88, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=13 criterion=39 score=7.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(89, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=13 criterion=40 score=8.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(90, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=13 criterion=41 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(91, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=13 criterion=42 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(92, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=14 criterion=92 score=8.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(93, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=14 criterion=93 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(94, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=14 criterion=94 score=9.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(95, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=14 criterion=95 score=7.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(96, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=14 criterion=96 score=8.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(97, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=14 criterion=97 score=8.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(98, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=14 criterion=98 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(99, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=15 criterion=99 score=8.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(100, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=15 criterion=100 score=9.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(101, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=15 criterion=101 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(102, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=15 criterion=102 score=8.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(103, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=15 criterion=103 score=9.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(104, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=15 criterion=104 score=10 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(105, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=15 criterion=105 score=9.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(106, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=16 criterion=106 score=9.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(107, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=16 criterion=107 score=9.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(108, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=16 criterion=108 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(109, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=16 criterion=109 score=8.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(110, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=16 criterion=110 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(111, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=16 criterion=111 score=10 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(112, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=16 criterion=112 score=8.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(113, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=17 criterion=15 score=7.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(114, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=17 criterion=16 score=6.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(115, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=17 criterion=17 score=7.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(116, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=17 criterion=18 score=6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(117, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=17 criterion=19 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(118, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=17 criterion=20 score=7.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(119, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=17 criterion=21 score=6.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(120, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=18 criterion=22 score=6.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(121, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=18 criterion=23 score=7.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(122, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=18 criterion=24 score=6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(123, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=18 criterion=25 score=7.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(124, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=18 criterion=26 score=7.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(125, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=18 criterion=27 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(126, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=18 criterion=28 score=5.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(127, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=19 criterion=29 score=5.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(128, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=19 criterion=30 score=6.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(129, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=19 criterion=31 score=6.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(130, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=19 criterion=32 score=7.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(131, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=19 criterion=33 score=5.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(132, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=19 criterion=34 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(133, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=19 criterion=35 score=5.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(134, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=20 criterion=50 score=5.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(135, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=20 criterion=51 score=6.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(136, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=20 criterion=52 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(137, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=20 criterion=53 score=7.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(138, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=20 criterion=54 score=5.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(139, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=20 criterion=55 score=6.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(140, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=20 criterion=56 score=7.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(141, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=21 criterion=57 score=6.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(142, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=21 criterion=58 score=6.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(143, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=21 criterion=59 score=5.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(144, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=21 criterion=60 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(145, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=21 criterion=61 score=5.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(146, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=21 criterion=62 score=5.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(147, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=21 criterion=63 score=6.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(148, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=22 criterion=64 score=7.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(149, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=22 criterion=65 score=6.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(150, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=22 criterion=66 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(151, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=22 criterion=67 score=5.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(152, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=22 criterion=68 score=7.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(153, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=22 criterion=69 score=6.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(154, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=22 criterion=70 score=6.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(155, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=23 criterion=8 score=6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(156, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=23 criterion=9 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(157, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=23 criterion=10 score=6.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(158, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=23 criterion=11 score=6.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(159, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=23 criterion=12 score=7.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(160, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=23 criterion=13 score=5.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(161, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=23 criterion=14 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(162, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=24 criterion=43 score=5.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(163, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=24 criterion=44 score=5.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(164, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=24 criterion=45 score=7.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(165, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=24 criterion=46 score=6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(166, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=24 criterion=47 score=7.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(167, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=24 criterion=48 score=5.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(168, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=24 criterion=49 score=5.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(169, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=25 criterion=71 score=6.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(170, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=25 criterion=72 score=5.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(171, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=25 criterion=73 score=7.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(172, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=25 criterion=74 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(173, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=25 criterion=75 score=7.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(174, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=25 criterion=76 score=6.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(175, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=25 criterion=77 score=7.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(176, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=26 criterion=78 score=5.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(177, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=26 criterion=79 score=6.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(178, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=26 criterion=80 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(179, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=26 criterion=81 score=7.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(180, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=26 criterion=82 score=6.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(181, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=26 criterion=83 score=7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(182, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=26 criterion=84 score=5.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(183, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=27 criterion=85 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(184, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=27 criterion=86 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(185, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=27 criterion=87 score=5.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(186, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=27 criterion=88 score=6.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(187, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=27 criterion=89 score=5.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(188, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=27 criterion=90 score=5.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(189, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=27 criterion=91 score=7.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(190, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=28 criterion=1 score=7.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(191, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=28 criterion=2 score=5.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(192, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=28 criterion=3 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(193, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=28 criterion=4 score=5.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(194, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=28 criterion=5 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(195, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=28 criterion=6 score=6.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(196, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=28 criterion=7 score=5.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(197, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=29 criterion=36 score=7.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(198, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=29 criterion=37 score=6.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(199, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=29 criterion=38 score=7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(200, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=29 criterion=39 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(201, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=29 criterion=40 score=6.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(202, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=29 criterion=41 score=6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(203, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=29 criterion=42 score=7.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(204, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=30 criterion=92 score=7.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(205, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=30 criterion=93 score=7.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(206, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=30 criterion=94 score=7.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(207, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=30 criterion=95 score=5.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(208, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=30 criterion=96 score=5.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(209, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=30 criterion=97 score=7.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(210, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=30 criterion=98 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(211, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=31 criterion=99 score=7.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(212, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=31 criterion=100 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(213, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=31 criterion=101 score=6.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(214, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=31 criterion=102 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(215, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=31 criterion=103 score=6.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(216, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=31 criterion=104 score=7.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(217, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=31 criterion=105 score=7.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(218, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=32 criterion=106 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(219, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=32 criterion=107 score=6.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(220, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=32 criterion=108 score=5.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(221, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=32 criterion=109 score=6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(222, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=32 criterion=110 score=6.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(223, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=32 criterion=111 score=6.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(224, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=32 criterion=112 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(225, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=33 criterion=15 score=9.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(226, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=33 criterion=16 score=9.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(227, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=33 criterion=17 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(228, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=33 criterion=18 score=9.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(229, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=33 criterion=19 score=9.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(230, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=33 criterion=20 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(231, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=33 criterion=21 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(232, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=34 criterion=22 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(233, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=34 criterion=23 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(234, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=34 criterion=24 score=9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(235, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=34 criterion=25 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(236, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=34 criterion=26 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(237, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=34 criterion=27 score=8.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(238, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=34 criterion=28 score=9.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(239, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=35 criterion=29 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(240, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=35 criterion=30 score=8.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(241, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=35 criterion=31 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(242, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=35 criterion=32 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(243, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=35 criterion=33 score=8.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(244, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=35 criterion=34 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(245, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=35 criterion=35 score=9.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(246, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=36 criterion=50 score=8.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(247, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=36 criterion=51 score=9.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(248, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=36 criterion=52 score=8.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(249, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=36 criterion=53 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(250, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=36 criterion=54 score=10 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(251, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=36 criterion=55 score=9.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(252, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=36 criterion=56 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(253, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=37 criterion=8 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(254, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=37 criterion=9 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(255, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=37 criterion=10 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(256, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=37 criterion=11 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(257, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=37 criterion=12 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(258, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=37 criterion=13 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(259, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=37 criterion=14 score=8.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(260, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=38 criterion=43 score=9.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(261, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=38 criterion=44 score=9.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(262, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=38 criterion=45 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(263, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=38 criterion=46 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(264, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=38 criterion=47 score=8.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(265, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=38 criterion=48 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(266, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=38 criterion=49 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(267, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=39 criterion=71 score=8.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(268, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=39 criterion=72 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(269, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=39 criterion=73 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(270, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=39 criterion=74 score=9.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(271, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=39 criterion=75 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(272, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=39 criterion=76 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(273, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=39 criterion=77 score=9.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(274, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=40 criterion=1 score=9.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(275, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=40 criterion=2 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(276, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=40 criterion=3 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(277, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=40 criterion=4 score=9.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(278, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=40 criterion=5 score=8.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(279, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=40 criterion=6 score=9.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(280, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=40 criterion=7 score=9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(281, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=41 criterion=36 score=9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(282, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=41 criterion=37 score=9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(283, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=41 criterion=38 score=9.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(284, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=41 criterion=39 score=10 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(285, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=41 criterion=40 score=8.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(286, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=41 criterion=41 score=8.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(287, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=41 criterion=42 score=8.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(288, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=42 criterion=92 score=9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(289, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=42 criterion=93 score=8.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(290, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=42 criterion=94 score=9.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(291, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=42 criterion=95 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(292, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=42 criterion=96 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(293, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=42 criterion=97 score=9.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(294, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=42 criterion=98 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(295, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=43 criterion=15 score=5.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(296, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=43 criterion=16 score=6.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(297, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=43 criterion=17 score=5.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(298, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=43 criterion=18 score=5.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(299, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=43 criterion=19 score=5.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(300, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=43 criterion=20 score=6.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(301, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=43 criterion=21 score=6.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(302, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=44 criterion=22 score=7.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(303, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=44 criterion=23 score=7.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(304, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=44 criterion=24 score=8.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(305, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=44 criterion=25 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(306, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=44 criterion=26 score=7.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(307, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=44 criterion=27 score=8.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(308, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=44 criterion=28 score=6.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(309, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=45 criterion=29 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(310, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=45 criterion=30 score=6.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(311, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=45 criterion=31 score=8.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(312, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=45 criterion=32 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(313, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=45 criterion=33 score=7.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(314, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=45 criterion=34 score=6.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(315, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=45 criterion=35 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(316, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=46 criterion=8 score=8.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(317, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=46 criterion=9 score=5.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(318, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=46 criterion=10 score=6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(319, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=46 criterion=11 score=8.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(320, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=46 criterion=12 score=7.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(321, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=46 criterion=13 score=9.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(322, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=46 criterion=14 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(323, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=47 criterion=43 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(324, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=47 criterion=44 score=7.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(325, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=47 criterion=45 score=6.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(326, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=47 criterion=46 score=7.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(327, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=47 criterion=47 score=5.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(328, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=47 criterion=48 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(329, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=47 criterion=49 score=8.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(330, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=48 criterion=1 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(331, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=48 criterion=2 score=5.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(332, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=48 criterion=3 score=7.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(333, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=48 criterion=4 score=5.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(334, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=48 criterion=5 score=6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(335, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=48 criterion=6 score=8.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(336, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=48 criterion=7 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(337, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=49 criterion=36 score=6.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(338, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=49 criterion=37 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(339, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=49 criterion=38 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(340, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=49 criterion=39 score=7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(341, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=49 criterion=40 score=7.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(342, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=49 criterion=41 score=7.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(343, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=49 criterion=42 score=6.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(344, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=50 criterion=15 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(345, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=50 criterion=16 score=5.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(346, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=50 criterion=17 score=6.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(347, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=50 criterion=18 score=5.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(348, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=50 criterion=19 score=7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(349, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=50 criterion=20 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(350, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=50 criterion=21 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(351, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=51 criterion=22 score=9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(352, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=51 criterion=23 score=7.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(353, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=51 criterion=24 score=6.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(354, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=51 criterion=25 score=7.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(355, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=51 criterion=26 score=6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(356, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=51 criterion=27 score=8.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(357, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=51 criterion=28 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(358, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=52 criterion=29 score=7.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(359, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=52 criterion=30 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(360, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=52 criterion=31 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36');
INSERT INTO `audit_logs` (`id`, `user_id`, `action`, `table_name`, `record_id`, `details`, `ip_address`, `created_at`) VALUES
(361, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=52 criterion=32 score=6.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(362, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=52 criterion=33 score=8.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(363, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=52 criterion=34 score=5.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(364, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=52 criterion=35 score=8.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(365, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=53 criterion=8 score=7.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(366, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=53 criterion=9 score=7.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(367, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=53 criterion=10 score=9.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(368, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=53 criterion=11 score=6.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(369, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=53 criterion=12 score=5.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(370, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=53 criterion=13 score=8.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(371, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=53 criterion=14 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(372, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=54 criterion=43 score=6.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(373, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=54 criterion=44 score=5.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(374, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=54 criterion=45 score=5.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(375, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=54 criterion=46 score=6.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(376, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=54 criterion=47 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(377, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=54 criterion=48 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(378, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=54 criterion=49 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(379, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=55 criterion=1 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(380, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=55 criterion=2 score=5.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(381, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=55 criterion=3 score=7.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(382, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=55 criterion=4 score=8.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(383, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=55 criterion=5 score=6.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(384, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=55 criterion=6 score=8.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(385, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=55 criterion=7 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(386, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=56 criterion=36 score=8.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(387, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=56 criterion=37 score=5.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(388, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=56 criterion=38 score=5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(389, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=56 criterion=39 score=5.9 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(390, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=56 criterion=40 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(391, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=56 criterion=41 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(392, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=56 criterion=42 score=9.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(393, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=57 criterion=15 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(394, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=57 criterion=16 score=6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(395, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=57 criterion=17 score=7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(396, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=57 criterion=18 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(397, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=57 criterion=19 score=7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(398, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=57 criterion=20 score=5.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(399, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=57 criterion=21 score=6.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(400, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=58 criterion=8 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(401, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=58 criterion=9 score=7.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(402, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=58 criterion=10 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(403, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=58 criterion=11 score=5.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(404, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=58 criterion=12 score=7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(405, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=58 criterion=13 score=6.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(406, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=58 criterion=14 score=9.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(407, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=59 criterion=1 score=7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(408, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=59 criterion=2 score=6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(409, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=59 criterion=3 score=7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(410, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=59 criterion=4 score=8.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(411, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=59 criterion=5 score=8.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(412, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=59 criterion=6 score=8.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(413, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=59 criterion=7 score=7.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(414, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=60 criterion=15 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(415, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=60 criterion=16 score=8.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(416, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=60 criterion=17 score=6.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(417, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=60 criterion=18 score=6.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(418, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=60 criterion=19 score=7.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(419, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=60 criterion=20 score=6.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(420, 7, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=60 criterion=21 score=6.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(421, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=61 criterion=8 score=8.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(422, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=61 criterion=9 score=8.3 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(423, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=61 criterion=10 score=6.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(424, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=61 criterion=11 score=5.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(425, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=61 criterion=12 score=6.5 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(426, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=61 criterion=13 score=9.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(427, 3, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=61 criterion=14 score=8.7 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(428, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=62 criterion=1 score=5.2 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(429, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=62 criterion=2 score=8.4 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(430, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=62 criterion=3 score=6.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(431, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=62 criterion=4 score=8.6 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(432, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=62 criterion=5 score=7.1 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(433, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=62 criterion=6 score=7.8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(434, 2, 'LEDGER_INSERT', 'score_ledger', NULL, 'enrollment=62 criterion=7 score=8 prev_score=NULL', '127.0.0.1', '2026-06-19 03:16:36'),
(435, 2, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 434 entries. Violations: 0', '127.0.0.1', '2026-06-19 03:16:36'),
(436, 5, 'LOGOUT', 'users', 5, 'User logged out: student2', '::1', '2026-06-19 03:16:53'),
(437, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-19 03:16:58'),
(438, 1, 'CREATE_NOTIFICATION', 'notifications', 1, 'Created: Grade Modification Notice (target: All)', '::1', '2026-06-19 03:17:24'),
(439, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-19 03:17:30'),
(440, 2, 'LOGIN', 'users', 2, 'User logged in: lecturer1', '::1', '2026-06-19 03:17:31'),
(441, 2, 'LOGOUT', 'users', 2, 'User logged out: lecturer1', '::1', '2026-06-19 03:20:44'),
(442, 2, 'LOGIN', 'users', 2, 'User logged in: lecturer1', '::1', '2026-06-19 03:20:46'),
(443, 2, 'LOGOUT', 'users', 2, 'User logged out: lecturer1', '::1', '2026-06-19 03:20:49'),
(444, 7, 'LOGIN', 'users', 7, 'User logged in: lecturer3', '::1', '2026-06-19 03:20:52'),
(445, 7, 'REQUEST_GRADE_CHANGE', 'grade_change_requests', 2, NULL, '::1', '2026-06-19 03:23:22'),
(446, 7, 'LOGOUT', 'users', 7, 'User logged out: lecturer3', '::1', '2026-06-19 03:23:27'),
(447, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-19 03:23:32'),
(448, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-19 03:24:41'),
(449, 7, 'LOGIN', 'users', 7, 'User logged in: lecturer3', '::1', '2026-06-19 03:24:45'),
(450, 7, 'LOGOUT', 'users', 7, 'User logged out: lecturer3', '::1', '2026-06-19 03:24:49'),
(451, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-19 03:24:52'),
(452, 1, 'LEDGER_UPDATE', 'score_ledger', NULL, 'enrollment=56 criterion=40 score=8 prev_score=6.7 approved_by=1 request_id=2', '::1', '2026-06-19 03:27:39'),
(453, 1, 'APPROVE_GRADE_CHANGE', 'grade_change_requests', 2, 'Approved new score: 8.00', '::1', '2026-06-19 03:27:39'),
(454, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 435 entries. Violations: 0', '::1', '2026-06-19 03:34:32'),
(455, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-19 08:23:42'),
(456, 4, 'LOGIN', 'users', 4, 'User logged in: student1', '::1', '2026-06-19 08:23:47'),
(457, 4, 'LOGOUT', 'users', 4, 'User logged out: student1', '::1', '2026-06-19 08:24:05'),
(458, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-19 08:24:09'),
(459, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-19 08:28:43'),
(460, 2, 'LOGIN', 'users', 2, 'User logged in: lecturer1', '::1', '2026-06-19 08:29:29'),
(461, 2, 'REQUEST_GRADE_CHANGE', 'grade_change_requests', 3, NULL, '::1', '2026-06-19 08:30:52'),
(462, 2, 'LOGOUT', 'users', 2, 'User logged out: lecturer1', '::1', '2026-06-19 08:30:56'),
(463, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-19 08:31:00'),
(464, 1, 'LEDGER_UPDATE', 'score_ledger', NULL, 'enrollment=59 criterion=1 score=8 prev_score=7 approved_by=1 request_id=3', '::1', '2026-06-19 08:34:59'),
(465, 1, 'APPROVE_GRADE_CHANGE', 'grade_change_requests', 3, NULL, '::1', '2026-06-19 08:34:59'),
(466, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-19 08:35:10'),
(467, 2, 'LOGIN', 'users', 2, 'User logged in: lecturer1', '::1', '2026-06-19 08:35:14'),
(468, 2, 'LOGOUT', 'users', 2, 'User logged out: lecturer1', '::1', '2026-06-20 05:26:14'),
(469, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-20 05:26:18'),
(470, 1, 'CREATE_USER', 'users', 12, 'Created: student8', '::1', '2026-06-20 05:27:56'),
(471, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-20 05:28:02'),
(472, NULL, 'LOGIN', 'users', 12, 'User logged in: student8', '::1', '2026-06-20 05:28:15'),
(473, NULL, 'LOGOUT', 'users', 12, 'User logged out: student8', '::1', '2026-06-20 05:28:22'),
(474, NULL, 'LOGIN', 'users', 12, 'User logged in: student8', '::1', '2026-06-20 05:28:40'),
(475, NULL, 'LOGOUT', 'users', 12, 'User logged out: student8', '::1', '2026-06-20 05:28:44'),
(476, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-20 05:28:48'),
(477, 1, 'DELETE_USER', 'users', 12, NULL, '::1', '2026-06-20 05:28:55'),
(478, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-20 05:28:58'),
(479, 2, 'LOGIN', 'users', 2, 'User logged in: lecturer1', '::1', '2026-06-20 12:59:06'),
(480, 2, 'LOGOUT', 'users', 2, 'User logged out: lecturer1', '::1', '2026-06-20 12:59:14'),
(481, 4, 'LOGIN', 'users', 4, 'User logged in: student1', '::1', '2026-06-20 12:59:22'),
(482, 4, 'LOGOUT', 'users', 4, 'User logged out: student1', '::1', '2026-06-21 04:16:12'),
(483, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-21 04:16:18'),
(484, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-21 04:31:53'),
(485, 2, 'LOGIN', 'users', 2, 'User logged in: lecturer1', '::1', '2026-06-21 04:31:56'),
(486, 2, 'LOGOUT', 'users', 2, 'User logged out: lecturer1', '::1', '2026-06-21 04:32:00'),
(487, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-21 04:32:07'),
(488, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 436 entries. Violations: 0', '::1', '2026-06-21 04:43:53'),
(489, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 436 entries. Violations: 1', '::1', '2026-06-21 04:44:25'),
(490, 1, 'LOGOUT', 'users', 1, 'User logged out: admin', '::1', '2026-06-21 04:55:20'),
(491, 2, 'LOGIN', 'users', 2, 'User logged in: lecturer1', '::1', '2026-06-21 04:55:22'),
(492, 2, 'LOGOUT', 'users', 2, 'User logged out: lecturer1', '::1', '2026-06-21 04:55:34'),
(493, 7, 'LOGIN', 'users', 7, 'User logged in: lecturer3', '::1', '2026-06-21 04:55:37'),
(494, 7, 'REQUEST_GRADE_CHANGE', 'grade_change_requests', 4, NULL, '::1', '2026-06-21 04:56:06'),
(495, 7, 'LOGOUT', 'users', 7, 'User logged out: lecturer3', '::1', '2026-06-21 04:56:10'),
(496, 1, 'LOGIN', 'users', 1, 'User logged in: admin', '::1', '2026-06-21 04:56:16');

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
(1, 1, 'CLO1', 'Learning outcome 1 for subject ID 1', '2026-06-19 03:16:36'),
(2, 1, 'CLO2', 'Learning outcome 2 for subject ID 1', '2026-06-19 03:16:36'),
(3, 1, 'CLO3', 'Learning outcome 3 for subject ID 1', '2026-06-19 03:16:36'),
(4, 2, 'CLO1', 'Learning outcome 1 for subject ID 2', '2026-06-19 03:16:36'),
(5, 2, 'CLO2', 'Learning outcome 2 for subject ID 2', '2026-06-19 03:16:36'),
(6, 2, 'CLO3', 'Learning outcome 3 for subject ID 2', '2026-06-19 03:16:36'),
(7, 3, 'CLO1', 'Learning outcome 1 for subject ID 3', '2026-06-19 03:16:36'),
(8, 3, 'CLO2', 'Learning outcome 2 for subject ID 3', '2026-06-19 03:16:36'),
(9, 3, 'CLO3', 'Learning outcome 3 for subject ID 3', '2026-06-19 03:16:36'),
(10, 4, 'CLO1', 'Learning outcome 1 for subject ID 4', '2026-06-19 03:16:36'),
(11, 4, 'CLO2', 'Learning outcome 2 for subject ID 4', '2026-06-19 03:16:36'),
(12, 4, 'CLO3', 'Learning outcome 3 for subject ID 4', '2026-06-19 03:16:36'),
(13, 5, 'CLO1', 'Learning outcome 1 for subject ID 5', '2026-06-19 03:16:36'),
(14, 5, 'CLO2', 'Learning outcome 2 for subject ID 5', '2026-06-19 03:16:36'),
(15, 5, 'CLO3', 'Learning outcome 3 for subject ID 5', '2026-06-19 03:16:36'),
(16, 6, 'CLO1', 'Learning outcome 1 for subject ID 6', '2026-06-19 03:16:36'),
(17, 6, 'CLO2', 'Learning outcome 2 for subject ID 6', '2026-06-19 03:16:36'),
(18, 6, 'CLO3', 'Learning outcome 3 for subject ID 6', '2026-06-19 03:16:36'),
(19, 7, 'CLO1', 'Learning outcome 1 for subject ID 7', '2026-06-19 03:16:36'),
(20, 7, 'CLO2', 'Learning outcome 2 for subject ID 7', '2026-06-19 03:16:36'),
(21, 7, 'CLO3', 'Learning outcome 3 for subject ID 7', '2026-06-19 03:16:36'),
(22, 8, 'CLO1', 'Learning outcome 1 for subject ID 8', '2026-06-19 03:16:36'),
(23, 8, 'CLO2', 'Learning outcome 2 for subject ID 8', '2026-06-19 03:16:36'),
(24, 8, 'CLO3', 'Learning outcome 3 for subject ID 8', '2026-06-19 03:16:36'),
(25, 9, 'CLO1', 'Learning outcome 1 for subject ID 9', '2026-06-19 03:16:36'),
(26, 9, 'CLO2', 'Learning outcome 2 for subject ID 9', '2026-06-19 03:16:36'),
(27, 9, 'CLO3', 'Learning outcome 3 for subject ID 9', '2026-06-19 03:16:36'),
(28, 10, 'CLO1', 'Learning outcome 1 for subject ID 10', '2026-06-19 03:16:36'),
(29, 10, 'CLO2', 'Learning outcome 2 for subject ID 10', '2026-06-19 03:16:36'),
(30, 10, 'CLO3', 'Learning outcome 3 for subject ID 10', '2026-06-19 03:16:36'),
(31, 11, 'CLO1', 'Learning outcome 1 for subject ID 11', '2026-06-19 03:16:36'),
(32, 11, 'CLO2', 'Learning outcome 2 for subject ID 11', '2026-06-19 03:16:36'),
(33, 11, 'CLO3', 'Learning outcome 3 for subject ID 11', '2026-06-19 03:16:36'),
(34, 12, 'CLO1', 'Learning outcome 1 for subject ID 12', '2026-06-19 03:16:36'),
(35, 12, 'CLO2', 'Learning outcome 2 for subject ID 12', '2026-06-19 03:16:36'),
(36, 12, 'CLO3', 'Learning outcome 3 for subject ID 12', '2026-06-19 03:16:36'),
(37, 13, 'CLO1', 'Learning outcome 1 for subject ID 13', '2026-06-19 03:16:36'),
(38, 13, 'CLO2', 'Learning outcome 2 for subject ID 13', '2026-06-19 03:16:36'),
(39, 13, 'CLO3', 'Learning outcome 3 for subject ID 13', '2026-06-19 03:16:36'),
(40, 14, 'CLO1', 'Learning outcome 1 for subject ID 14', '2026-06-19 03:16:36'),
(41, 14, 'CLO2', 'Learning outcome 2 for subject ID 14', '2026-06-19 03:16:36'),
(42, 14, 'CLO3', 'Learning outcome 3 for subject ID 14', '2026-06-19 03:16:36'),
(43, 15, 'CLO1', 'Learning outcome 1 for subject ID 15', '2026-06-19 03:16:36'),
(44, 15, 'CLO2', 'Learning outcome 2 for subject ID 15', '2026-06-19 03:16:36'),
(45, 15, 'CLO3', 'Learning outcome 3 for subject ID 15', '2026-06-19 03:16:36'),
(46, 16, 'CLO1', 'Learning outcome 1 for subject ID 16', '2026-06-19 03:16:36'),
(47, 16, 'CLO2', 'Learning outcome 2 for subject ID 16', '2026-06-19 03:16:36'),
(48, 16, 'CLO3', 'Learning outcome 3 for subject ID 16', '2026-06-19 03:16:36'),
(49, 17, 'CLO01', 'Understand basic syntax, variables, and control structures.', '2026-06-22 06:31:33'),
(50, 17, 'CLO02', 'Implement standard algorithms using functions and recursion.', '2026-06-22 06:31:33'),
(51, 18, 'CLO01', 'Analyze the time and space complexity of algorithms (Big O).', '2026-06-22 06:31:33'),
(52, 18, 'CLO02', 'Design and implement advanced data structures like trees and graphs.', '2026-06-22 06:31:33'),
(53, 19, 'CLO01', 'Configure firewall rules and analyze network packet captures.', '2026-06-22 06:31:33'),
(54, 19, 'CLO02', 'Identify common security vulnerabilities in network protocols.', '2026-06-22 06:31:33'),
(55, 20, 'CLO01', 'Differentiate and implement symmetric and asymmetric encryption schemes.', '2026-06-22 06:31:33'),
(56, 20, 'CLO02', 'Evaluate secure handshake mechanisms and cryptographic hash chains.', '2026-06-22 06:31:33');

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
(1, 1, 1, 1.00, '2026-06-19 03:16:36'),
(2, 2, 1, 1.00, '2026-06-19 03:16:36'),
(3, 3, 1, 1.00, '2026-06-19 03:16:36'),
(4, 4, 5, 1.00, '2026-06-19 03:16:36'),
(5, 5, 5, 1.00, '2026-06-19 03:16:36'),
(6, 6, 5, 1.00, '2026-06-19 03:16:36'),
(7, 7, 1, 1.00, '2026-06-19 03:16:36'),
(8, 8, 1, 1.00, '2026-06-19 03:16:36'),
(9, 9, 1, 1.00, '2026-06-19 03:16:36'),
(10, 10, 5, 1.00, '2026-06-19 03:16:36'),
(11, 11, 5, 1.00, '2026-06-19 03:16:36'),
(12, 12, 5, 1.00, '2026-06-19 03:16:36'),
(13, 13, 1, 1.00, '2026-06-19 03:16:36'),
(14, 14, 1, 1.00, '2026-06-19 03:16:36'),
(15, 15, 1, 1.00, '2026-06-19 03:16:36'),
(16, 16, 5, 1.00, '2026-06-19 03:16:36'),
(17, 17, 5, 1.00, '2026-06-19 03:16:36'),
(18, 18, 5, 1.00, '2026-06-19 03:16:36'),
(19, 19, 1, 1.00, '2026-06-19 03:16:36'),
(20, 20, 1, 1.00, '2026-06-19 03:16:36'),
(21, 21, 1, 1.00, '2026-06-19 03:16:36'),
(22, 22, 5, 1.00, '2026-06-19 03:16:36'),
(23, 23, 5, 1.00, '2026-06-19 03:16:36'),
(24, 24, 5, 1.00, '2026-06-19 03:16:36'),
(25, 25, 1, 1.00, '2026-06-19 03:16:36'),
(26, 26, 1, 1.00, '2026-06-19 03:16:36'),
(27, 27, 1, 1.00, '2026-06-19 03:16:36'),
(28, 28, 5, 1.00, '2026-06-19 03:16:36'),
(29, 29, 5, 1.00, '2026-06-19 03:16:36'),
(30, 30, 5, 1.00, '2026-06-19 03:16:36'),
(31, 31, 1, 1.00, '2026-06-19 03:16:36'),
(32, 32, 1, 1.00, '2026-06-19 03:16:36'),
(33, 33, 1, 1.00, '2026-06-19 03:16:36'),
(34, 34, 5, 1.00, '2026-06-19 03:16:36'),
(35, 35, 5, 1.00, '2026-06-19 03:16:36'),
(36, 36, 5, 1.00, '2026-06-19 03:16:36'),
(37, 37, 1, 1.00, '2026-06-19 03:16:36'),
(38, 38, 1, 1.00, '2026-06-19 03:16:36'),
(39, 39, 1, 1.00, '2026-06-19 03:16:36'),
(40, 40, 5, 1.00, '2026-06-19 03:16:36'),
(41, 41, 5, 1.00, '2026-06-19 03:16:36'),
(42, 42, 5, 1.00, '2026-06-19 03:16:36'),
(43, 43, 1, 1.00, '2026-06-19 03:16:36'),
(44, 44, 1, 1.00, '2026-06-19 03:16:36'),
(45, 45, 1, 1.00, '2026-06-19 03:16:36'),
(46, 46, 5, 1.00, '2026-06-19 03:16:36'),
(47, 47, 5, 1.00, '2026-06-19 03:16:36'),
(48, 48, 5, 1.00, '2026-06-19 03:16:36');

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
(1, 3, 1, 8.90, 7.00, 'wrong enter', 2, '2026-06-17 09:34:44', 'approved', 1, '2026-06-17 09:47:29', NULL),
(2, 56, 40, 6.70, 8.00, 'he submit better report', 7, '2026-06-19 03:23:22', 'approved', 1, '2026-06-19 03:27:39', ''),
(3, 59, 1, 7.00, 8.00, 'wrong grade', 2, '2026-06-19 08:30:52', 'approved', 1, '2026-06-19 08:34:59', ''),
(4, 41, 41, 8.90, 9.00, 'data entry error', 7, '2026-06-21 04:56:06', 'pending', NULL, NULL, NULL);

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
(1, NULL, 'Grade Modification Notice', 'Any changes to student grades are tracked and logged for security and transparency purposes. Unauthorized modifications are strictly prohibited.', 'info', 0, 1, '2026-06-19 03:17:24', '[1]', NULL),
(2, 1, 'New Grade Change Request', 'Lecturer Nguyễn Văn An has requested a grade change (Req #3).', 'warning', 0, 2, '2026-06-19 08:30:52', NULL, NULL),
(3, 2, 'Request Approved', 'Your grade change request for INS3064 has been approved.', 'success', 0, 1, '2026-06-19 08:34:59', NULL, NULL),
(4, 10, 'Grade Updated', 'Your grade for INS3064 (Classroom active participation) has been revised by Admin.', 'info', 0, 1, '2026-06-19 08:34:59', NULL, NULL),
(5, 1, 'New Grade Change Request', 'Lecturer Lê Thị An has requested a grade change (Req #4).', 'warning', 0, 7, '2026-06-21 04:56:06', NULL, NULL);

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
(1, 1, 'PLO1', 'Apply computing knowledge to solve IS problems', '2026-06-19 03:16:36'),
(2, 1, 'PLO2', 'Design and implement database-driven web applications', '2026-06-19 03:16:36'),
(3, 1, 'PLO3', 'Demonstrate critical thinking and problem-solving skills', '2026-06-19 03:16:36'),
(4, 1, 'PLO4', 'Work effectively in teams and communicate technical concepts', '2026-06-19 03:16:36'),
(5, 2, 'PLO1', 'Apply software engineering principles to develop quality software', '2026-06-19 03:16:36'),
(6, 2, 'PLO2', 'Design scalable and maintainable software architectures', '2026-06-19 03:16:36'),
(7, 3, 'PLO1', 'Apply theoretical computer science to solve practical problems', '2026-06-19 03:16:36'),
(8, 3, 'PLO2', 'Design and analyze efficient algorithms', '2026-06-19 03:16:36'),
(9, 3, 'PLO3', 'Demonstrate knowledge of machine learning techniques', '2026-06-19 03:16:36'),
(10, 4, 'PLO1', 'Identify and mitigate cybersecurity threats', '2026-06-19 03:16:36'),
(11, 4, 'PLO2', 'Design secure software systems', '2026-06-19 03:16:36'),
(12, 2, 'PLO3', 'Apply agile methodologies in software development', '2026-06-19 03:16:36');

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
(1, 'Information Systems', 'IS', 'Chương trình Hệ thống Thông tin', '2026-06-19 03:16:36'),
(2, 'Software Engineering', 'SE', 'Chương trình Kỹ thuật Phần mềm', '2026-06-19 03:16:36'),
(3, 'Computer Science', 'CS', 'Chương trình Khoa học Máy tính', '2026-06-19 03:16:36'),
(4, 'Cybersecurity', 'CY', 'Chương trình An toàn thông tin', '2026-06-19 03:16:36');

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
(1, 1, 'Web Application Development 2 Attendance Rubric', '2026-06-19 03:16:36'),
(2, 2, 'Web Application Development 2 Midterm Rubric', '2026-06-19 03:16:36'),
(3, 3, 'Web Application Development 2 Final Rubric', '2026-06-19 03:16:36'),
(4, 4, 'Database Systems Attendance Rubric', '2026-06-19 03:16:36'),
(5, 5, 'Database Systems Midterm Rubric', '2026-06-19 03:16:36'),
(6, 6, 'Database Systems Final Rubric', '2026-06-19 03:16:36'),
(7, 7, 'Software Engineering Principles Attendance Rubric', '2026-06-19 03:16:36'),
(8, 8, 'Software Engineering Principles Midterm Rubric', '2026-06-19 03:16:36'),
(9, 9, 'Software Engineering Principles Final Rubric', '2026-06-19 03:16:36'),
(10, 10, 'Software Design Patterns Attendance Rubric', '2026-06-19 03:16:36'),
(11, 11, 'Software Design Patterns Midterm Rubric', '2026-06-19 03:16:36'),
(12, 12, 'Software Design Patterns Final Rubric', '2026-06-19 03:16:36'),
(13, 13, 'Advanced Web Development Attendance Rubric', '2026-06-19 03:16:36'),
(14, 14, 'Advanced Web Development Midterm Rubric', '2026-06-19 03:16:36'),
(15, 15, 'Advanced Web Development Final Rubric', '2026-06-19 03:16:36'),
(16, 16, 'Machine Learning Applications Attendance Rubric', '2026-06-19 03:16:36'),
(17, 17, 'Machine Learning Applications Midterm Rubric', '2026-06-19 03:16:36'),
(18, 18, 'Machine Learning Applications Final Rubric', '2026-06-19 03:16:36'),
(19, 19, 'Data Structures & Algorithms Attendance Rubric', '2026-06-19 03:16:36'),
(20, 20, 'Data Structures & Algorithms Midterm Rubric', '2026-06-19 03:16:36'),
(21, 21, 'Data Structures & Algorithms Final Rubric', '2026-06-19 03:16:36'),
(22, 22, 'Agile Software Development Attendance Rubric', '2026-06-19 03:16:36'),
(23, 23, 'Agile Software Development Midterm Rubric', '2026-06-19 03:16:36'),
(24, 24, 'Agile Software Development Final Rubric', '2026-06-19 03:16:36'),
(25, 25, 'Computer Networks Attendance Rubric', '2026-06-19 03:16:36'),
(26, 26, 'Computer Networks Midterm Rubric', '2026-06-19 03:16:36'),
(27, 27, 'Computer Networks Final Rubric', '2026-06-19 03:16:36'),
(28, 28, 'Operating Systems Attendance Rubric', '2026-06-19 03:16:36'),
(29, 29, 'Operating Systems Midterm Rubric', '2026-06-19 03:16:36'),
(30, 30, 'Operating Systems Final Rubric', '2026-06-19 03:16:36'),
(31, 31, 'Software Testing & QA Attendance Rubric', '2026-06-19 03:16:36'),
(32, 32, 'Software Testing & QA Midterm Rubric', '2026-06-19 03:16:36'),
(33, 33, 'Software Testing & QA Final Rubric', '2026-06-19 03:16:36'),
(34, 34, 'Artificial Intelligence Attendance Rubric', '2026-06-19 03:16:36'),
(35, 35, 'Artificial Intelligence Midterm Rubric', '2026-06-19 03:16:36'),
(36, 36, 'Artificial Intelligence Final Rubric', '2026-06-19 03:16:36'),
(37, 37, 'Computer Architecture Attendance Rubric', '2026-06-19 03:16:36'),
(38, 38, 'Computer Architecture Midterm Rubric', '2026-06-19 03:16:36'),
(39, 39, 'Computer Architecture Final Rubric', '2026-06-19 03:16:36'),
(40, 40, 'Cloud Computing Attendance Rubric', '2026-06-19 03:16:36'),
(41, 41, 'Cloud Computing Midterm Rubric', '2026-06-19 03:16:36'),
(42, 42, 'Cloud Computing Final Rubric', '2026-06-19 03:16:36'),
(43, 43, 'Mobile Application Development Attendance Rubric', '2026-06-19 03:16:36'),
(44, 44, 'Mobile Application Development Midterm Rubric', '2026-06-19 03:16:36'),
(45, 45, 'Mobile Application Development Final Rubric', '2026-06-19 03:16:36'),
(46, 46, 'Enterprise Architecture Attendance Rubric', '2026-06-19 03:16:36'),
(47, 47, 'Enterprise Architecture Midterm Rubric', '2026-06-19 03:16:36'),
(48, 48, 'Enterprise Architecture Final Rubric', '2026-06-19 03:16:36');

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
(1, 1, 1, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(2, 1, 2, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(3, 2, 1, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(4, 2, 3, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(5, 3, 1, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(6, 3, 2, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(7, 3, 3, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(8, 4, 4, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(9, 4, 5, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(10, 5, 4, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(11, 5, 6, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(12, 6, 4, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(13, 6, 5, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(14, 6, 6, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(15, 7, 7, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(16, 7, 8, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(17, 8, 7, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(18, 8, 9, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(19, 9, 7, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(20, 9, 8, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(21, 9, 9, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(22, 10, 10, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(23, 10, 11, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(24, 11, 10, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(25, 11, 12, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(26, 12, 10, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(27, 12, 11, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(28, 12, 12, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(29, 13, 13, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(30, 13, 14, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(31, 14, 13, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(32, 14, 15, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(33, 15, 13, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(34, 15, 14, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(35, 15, 15, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(36, 16, 16, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(37, 16, 17, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(38, 17, 16, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(39, 17, 18, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(40, 18, 16, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(41, 18, 17, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(42, 18, 18, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(43, 19, 19, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(44, 19, 20, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(45, 20, 19, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(46, 20, 21, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(47, 21, 19, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(48, 21, 20, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(49, 21, 21, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(50, 22, 22, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(51, 22, 23, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(52, 23, 22, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(53, 23, 24, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(54, 24, 22, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(55, 24, 23, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(56, 24, 24, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(57, 25, 25, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(58, 25, 26, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(59, 26, 25, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(60, 26, 27, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(61, 27, 25, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(62, 27, 26, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(63, 27, 27, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(64, 28, 28, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(65, 28, 29, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(66, 29, 28, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(67, 29, 30, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(68, 30, 28, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(69, 30, 29, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(70, 30, 30, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(71, 31, 31, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(72, 31, 32, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(73, 32, 31, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(74, 32, 33, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(75, 33, 31, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(76, 33, 32, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(77, 33, 33, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(78, 34, 34, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(79, 34, 35, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(80, 35, 34, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(81, 35, 36, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(82, 36, 34, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(83, 36, 35, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(84, 36, 36, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(85, 37, 37, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(86, 37, 38, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(87, 38, 37, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(88, 38, 39, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(89, 39, 37, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(90, 39, 38, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(91, 39, 39, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(92, 40, 40, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(93, 40, 41, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(94, 41, 40, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(95, 41, 42, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(96, 42, 40, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(97, 42, 41, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(98, 42, 42, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(99, 43, 43, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(100, 43, 44, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(101, 44, 43, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(102, 44, 45, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(103, 45, 43, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(104, 45, 44, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(105, 45, 45, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36'),
(106, 46, 46, 'Classroom active participation', 10.00, 50.00, '2026-06-19 03:16:36'),
(107, 46, 47, 'Weekly quizzes performance', 10.00, 50.00, '2026-06-19 03:16:36'),
(108, 47, 46, 'Theoretical concepts application', 10.00, 50.00, '2026-06-19 03:16:36'),
(109, 47, 48, 'Problem solving skills', 10.00, 50.00, '2026-06-19 03:16:36'),
(110, 48, 46, 'Implementation logic & code quality', 10.00, 40.00, '2026-06-19 03:16:36'),
(111, 48, 47, 'System architecture & database design', 10.00, 30.00, '2026-06-19 03:16:36'),
(112, 48, 48, 'Presentation & defense report', 10.00, 30.00, '2026-06-19 03:16:36');

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
(1, 1, 15, 9.00, '{\"enrollment_id\":1,\"criterion_id\":15,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '0000000000000000000000000000000000000000000000000000000000000000', '181ea8f38310fdcade83c5cb83ec5c655a21c781e1f78816f677428d671421d0'),
(2, 1, 16, 10.00, '{\"enrollment_id\":1,\"criterion_id\":16,\"score\":10,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '181ea8f38310fdcade83c5cb83ec5c655a21c781e1f78816f677428d671421d0', 'dba196df67838b223ea8c7ab1100019fd491f958e6540a4e7fad6f0bcb6f6bf2'),
(3, 1, 17, 8.60, '{\"enrollment_id\":1,\"criterion_id\":17,\"score\":8.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'dba196df67838b223ea8c7ab1100019fd491f958e6540a4e7fad6f0bcb6f6bf2', '4129afb73b33c504553951dcae8cc67d7020fd414d125baf4485790633fe386c'),
(4, 1, 18, 9.00, '{\"enrollment_id\":1,\"criterion_id\":18,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '4129afb73b33c504553951dcae8cc67d7020fd414d125baf4485790633fe386c', 'ea64940089123a201275afac424516f6ee6d1fad6abba7b40874f6f315d32f52'),
(5, 1, 19, 9.40, '{\"enrollment_id\":1,\"criterion_id\":19,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'ea64940089123a201275afac424516f6ee6d1fad6abba7b40874f6f315d32f52', '5bdb82104e57474100b12d8df91c21b24d22af06b07ce65a731c8ef610c124a8'),
(6, 1, 20, 7.50, '{\"enrollment_id\":1,\"criterion_id\":20,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '5bdb82104e57474100b12d8df91c21b24d22af06b07ce65a731c8ef610c124a8', '7bd1cd9cc85288dde7986f67550a858271591644d22651575ddb57b4fb61d385'),
(7, 1, 21, 9.60, '{\"enrollment_id\":1,\"criterion_id\":21,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '7bd1cd9cc85288dde7986f67550a858271591644d22651575ddb57b4fb61d385', '22356feceb112bb8b2a2bc80fbb358f421a41edd6f3af61e4a54e9b44c7351e4'),
(8, 2, 22, 9.70, '{\"enrollment_id\":2,\"criterion_id\":22,\"score\":9.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '22356feceb112bb8b2a2bc80fbb358f421a41edd6f3af61e4a54e9b44c7351e4', 'c07775f095a408fb5a269648da74a606ecaf42dfe57734adce87e11533d96467'),
(9, 2, 23, 7.90, '{\"enrollment_id\":2,\"criterion_id\":23,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'c07775f095a408fb5a269648da74a606ecaf42dfe57734adce87e11533d96467', '63fa6d8bfa5659b8626198de98cda99d6b81adbc80ae53a12f63a745ef0823dd'),
(10, 2, 24, 9.70, '{\"enrollment_id\":2,\"criterion_id\":24,\"score\":9.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '63fa6d8bfa5659b8626198de98cda99d6b81adbc80ae53a12f63a745ef0823dd', 'f3d793c9c6fbfbc8d5adf078e80654a391031ef0edcac23a8b1f93efe1375a33'),
(11, 2, 25, 8.50, '{\"enrollment_id\":2,\"criterion_id\":25,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'f3d793c9c6fbfbc8d5adf078e80654a391031ef0edcac23a8b1f93efe1375a33', 'db344078d48e936d51c9e4524a3cf3f7461b66e52678592868d58370846d73be'),
(12, 2, 26, 9.40, '{\"enrollment_id\":2,\"criterion_id\":26,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'db344078d48e936d51c9e4524a3cf3f7461b66e52678592868d58370846d73be', '43f9b71a5217e785ee5a71f8ad136294f3e88ed7440697d58957e84f3a59c7a4'),
(13, 2, 27, 8.70, '{\"enrollment_id\":2,\"criterion_id\":27,\"score\":8.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '43f9b71a5217e785ee5a71f8ad136294f3e88ed7440697d58957e84f3a59c7a4', '065876ffbfee510aefa65e4b3fb71876c6f508ff08cb1e9cf8cfe11fbe5704fa'),
(14, 2, 28, 9.30, '{\"enrollment_id\":2,\"criterion_id\":28,\"score\":9.300000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '065876ffbfee510aefa65e4b3fb71876c6f508ff08cb1e9cf8cfe11fbe5704fa', '4152b891fd8663ed57576e4ea978357c093d4a9c6ed04e823193e2f7e92dcc52'),
(15, 3, 29, 8.80, '{\"enrollment_id\":3,\"criterion_id\":29,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '4152b891fd8663ed57576e4ea978357c093d4a9c6ed04e823193e2f7e92dcc52', 'e8c89a8a4c7bee42a9993b266ed0f89dd1bf13593e8967fc51c1e14ea8687b27'),
(16, 3, 30, 7.90, '{\"enrollment_id\":3,\"criterion_id\":30,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'e8c89a8a4c7bee42a9993b266ed0f89dd1bf13593e8967fc51c1e14ea8687b27', '71cdfb4604e18df9ac80b57449547f0e069c8448b5826ff76fdf55c1cd159ae1'),
(17, 3, 31, 7.70, '{\"enrollment_id\":3,\"criterion_id\":31,\"score\":7.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '71cdfb4604e18df9ac80b57449547f0e069c8448b5826ff76fdf55c1cd159ae1', '06c37d111f3afccf63dde0224db4526d5682b43b95b254b1f66b02eb507a5df0'),
(18, 3, 32, 9.60, '{\"enrollment_id\":3,\"criterion_id\":32,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '06c37d111f3afccf63dde0224db4526d5682b43b95b254b1f66b02eb507a5df0', '04bba8b0682edb68752aa8570f421c3881f396ec65123e547419badf8013df88'),
(19, 3, 33, 8.10, '{\"enrollment_id\":3,\"criterion_id\":33,\"score\":8.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '04bba8b0682edb68752aa8570f421c3881f396ec65123e547419badf8013df88', '46429471f3f7d0c40d8f0ffa4811b93f78651e64af9da601328d501ec317c866'),
(20, 3, 34, 7.80, '{\"enrollment_id\":3,\"criterion_id\":34,\"score\":7.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '46429471f3f7d0c40d8f0ffa4811b93f78651e64af9da601328d501ec317c866', '9fe21d547fb7901540b7d07fdc6f18cd49c9f54f5bbd7d521c0ff8104a6cc5b7'),
(21, 3, 35, 7.50, '{\"enrollment_id\":3,\"criterion_id\":35,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '9fe21d547fb7901540b7d07fdc6f18cd49c9f54f5bbd7d521c0ff8104a6cc5b7', '6568c0f1e0d4e7f9e3349d8b55d5787898ff5ef6c9d6466732bd7f1b8df15708'),
(22, 4, 50, 9.40, '{\"enrollment_id\":4,\"criterion_id\":50,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '6568c0f1e0d4e7f9e3349d8b55d5787898ff5ef6c9d6466732bd7f1b8df15708', 'c0cca4db531fc0a888e14b1d08fa934258669db456b0aa5957575e94eeeb6408'),
(23, 4, 51, 9.40, '{\"enrollment_id\":4,\"criterion_id\":51,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'c0cca4db531fc0a888e14b1d08fa934258669db456b0aa5957575e94eeeb6408', 'b11fa00d843ac544eb267665e92795267e0c21e8c1e223879b5aca4f99f714bc'),
(24, 4, 52, 8.00, '{\"enrollment_id\":4,\"criterion_id\":52,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'b11fa00d843ac544eb267665e92795267e0c21e8c1e223879b5aca4f99f714bc', '0e3429bbd8f5a23932e630db4ff35ec5ff911bc5b58dc025540030efe8916a62'),
(25, 4, 53, 8.40, '{\"enrollment_id\":4,\"criterion_id\":53,\"score\":8.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '0e3429bbd8f5a23932e630db4ff35ec5ff911bc5b58dc025540030efe8916a62', '21cdcd7c3ab3e1780c8b39fd9be56b72cf8069477778b8c06dbd81c164b8bdc6'),
(26, 4, 54, 9.30, '{\"enrollment_id\":4,\"criterion_id\":54,\"score\":9.300000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '21cdcd7c3ab3e1780c8b39fd9be56b72cf8069477778b8c06dbd81c164b8bdc6', 'edee2e0c3fa3ee9626b5dcefcd650907bd5049acf584de6fafd7553ec9bd39e1'),
(27, 4, 55, 9.80, '{\"enrollment_id\":4,\"criterion_id\":55,\"score\":9.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'edee2e0c3fa3ee9626b5dcefcd650907bd5049acf584de6fafd7553ec9bd39e1', 'c583180ef0b586fb572740b8cf9ee3d0924b4431a3b7a278e951dd1a5b532bca'),
(28, 4, 56, 7.60, '{\"enrollment_id\":4,\"criterion_id\":56,\"score\":7.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'c583180ef0b586fb572740b8cf9ee3d0924b4431a3b7a278e951dd1a5b532bca', 'f43746f0ae9ded6346150d4f3e289fb69a4c33b18b0a37a5e1894314d4e7b5c0'),
(29, 5, 57, 9.90, '{\"enrollment_id\":5,\"criterion_id\":57,\"score\":9.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'f43746f0ae9ded6346150d4f3e289fb69a4c33b18b0a37a5e1894314d4e7b5c0', '33921ba9d39b82aa6c8771e3c1ca3e7e5d8e9b32e293f8ee886348051fbc5e6a'),
(30, 5, 58, 7.60, '{\"enrollment_id\":5,\"criterion_id\":58,\"score\":7.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '33921ba9d39b82aa6c8771e3c1ca3e7e5d8e9b32e293f8ee886348051fbc5e6a', '789eb49679c18cddc1c82208f6de8776c37ed6317ed398e07b0c79469ef31fe3'),
(31, 5, 59, 8.20, '{\"enrollment_id\":5,\"criterion_id\":59,\"score\":8.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '789eb49679c18cddc1c82208f6de8776c37ed6317ed398e07b0c79469ef31fe3', '01baa76d36a4eccf9922f4dc3375835b00211810910d3b7db18375d2498ccb84'),
(32, 5, 60, 8.00, '{\"enrollment_id\":5,\"criterion_id\":60,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '01baa76d36a4eccf9922f4dc3375835b00211810910d3b7db18375d2498ccb84', '2ce89eb4500b3b2215cf582c85202b2f4e56e5ec1efafa880240928c88e855f3'),
(33, 5, 61, 9.60, '{\"enrollment_id\":5,\"criterion_id\":61,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '2ce89eb4500b3b2215cf582c85202b2f4e56e5ec1efafa880240928c88e855f3', '0ad8b8141b510bdd59f76f2beffdc345363df1fd3aae956327a150ab3ca43681'),
(34, 5, 62, 9.50, '{\"enrollment_id\":5,\"criterion_id\":62,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '0ad8b8141b510bdd59f76f2beffdc345363df1fd3aae956327a150ab3ca43681', 'e10c2f3deb316ff0b4e5a6dc497c0af20a1925454e66ad6fe1a14119746f23b6'),
(35, 5, 63, 7.80, '{\"enrollment_id\":5,\"criterion_id\":63,\"score\":7.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'e10c2f3deb316ff0b4e5a6dc497c0af20a1925454e66ad6fe1a14119746f23b6', 'fc46b7ff005a7fb3275eb34e61a10b03c720651b07af10b04ce5997bb77489a3'),
(36, 6, 64, 7.90, '{\"enrollment_id\":6,\"criterion_id\":64,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'fc46b7ff005a7fb3275eb34e61a10b03c720651b07af10b04ce5997bb77489a3', '7bbf95c23ec0f3f5f12955894170eb61a7a6784b8b1b71e9da946e0209614b18'),
(37, 6, 65, 8.40, '{\"enrollment_id\":6,\"criterion_id\":65,\"score\":8.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '7bbf95c23ec0f3f5f12955894170eb61a7a6784b8b1b71e9da946e0209614b18', '7e1292f44911fe7d5fca2ef2f6f2e9a95ceb31365a9c525aba89303e1df761f5'),
(38, 6, 66, 9.00, '{\"enrollment_id\":6,\"criterion_id\":66,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '7e1292f44911fe7d5fca2ef2f6f2e9a95ceb31365a9c525aba89303e1df761f5', '4620b726c00719ae1ebd8727fb0e495ae83831dd51f00cd5de9f174ca1d803c3'),
(39, 6, 67, 9.40, '{\"enrollment_id\":6,\"criterion_id\":67,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '4620b726c00719ae1ebd8727fb0e495ae83831dd51f00cd5de9f174ca1d803c3', 'f3317814fc51b5c0c7064fb8269a83c3b1bb36fc255e01ed742ec3819fc77c53'),
(40, 6, 68, 9.50, '{\"enrollment_id\":6,\"criterion_id\":68,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'f3317814fc51b5c0c7064fb8269a83c3b1bb36fc255e01ed742ec3819fc77c53', 'f9575bad8056120c6a21e7441fca4c7531033428e9fb49786759584731bbe47d'),
(41, 6, 69, 8.40, '{\"enrollment_id\":6,\"criterion_id\":69,\"score\":8.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'f9575bad8056120c6a21e7441fca4c7531033428e9fb49786759584731bbe47d', 'df182d86de36962e056449765cf306c56453f9f947175dee6aa94cb15b584aac'),
(42, 6, 70, 9.20, '{\"enrollment_id\":6,\"criterion_id\":70,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'df182d86de36962e056449765cf306c56453f9f947175dee6aa94cb15b584aac', '6e5a99c40bec060ba0cf906f7a186bf437d31d449563229ebf089c6fb00ac700'),
(43, 7, 8, 7.80, '{\"enrollment_id\":7,\"criterion_id\":8,\"score\":7.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '6e5a99c40bec060ba0cf906f7a186bf437d31d449563229ebf089c6fb00ac700', '0c2b6e16cad54db01648626fd999fd382b075cd16e70e608cc25c116a150cc6a'),
(44, 7, 9, 7.70, '{\"enrollment_id\":7,\"criterion_id\":9,\"score\":7.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '0c2b6e16cad54db01648626fd999fd382b075cd16e70e608cc25c116a150cc6a', 'f5f8d99ec478ada9c1496760663813a414823cacd99086d432125c5ec1923679'),
(45, 7, 10, 9.40, '{\"enrollment_id\":7,\"criterion_id\":10,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'f5f8d99ec478ada9c1496760663813a414823cacd99086d432125c5ec1923679', '1a7d61e5aa427f5dfc6f6881bc234d05282a979ddf283b6089de9471558c1ec4'),
(46, 7, 11, 9.60, '{\"enrollment_id\":7,\"criterion_id\":11,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '1a7d61e5aa427f5dfc6f6881bc234d05282a979ddf283b6089de9471558c1ec4', '9b6c44b3cc454fd8eab8444f9334b80e4abfd3a255dfca943a0d76b0b63d5b0f'),
(47, 7, 12, 9.60, '{\"enrollment_id\":7,\"criterion_id\":12,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '9b6c44b3cc454fd8eab8444f9334b80e4abfd3a255dfca943a0d76b0b63d5b0f', '522379d7d4776b93f5a2de7aaff36b92bfacb9e3361175ca8625ef2584c57196'),
(48, 7, 13, 7.60, '{\"enrollment_id\":7,\"criterion_id\":13,\"score\":7.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '522379d7d4776b93f5a2de7aaff36b92bfacb9e3361175ca8625ef2584c57196', '27796b3877b8ce4d9574c8bfa382f29104a34a75755246255c2d1726a5afd072'),
(49, 7, 14, 8.30, '{\"enrollment_id\":7,\"criterion_id\":14,\"score\":8.300000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '27796b3877b8ce4d9574c8bfa382f29104a34a75755246255c2d1726a5afd072', '5e61fb15d285892e31f71579e0fe0cd7c07516cecff80df054945bf5be1d55d1'),
(50, 8, 43, 8.40, '{\"enrollment_id\":8,\"criterion_id\":43,\"score\":8.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '5e61fb15d285892e31f71579e0fe0cd7c07516cecff80df054945bf5be1d55d1', '1245a2c9f8422df9e768679465968980cceb5606c4bea77b06bea43827d0b67e'),
(51, 8, 44, 7.70, '{\"enrollment_id\":8,\"criterion_id\":44,\"score\":7.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '1245a2c9f8422df9e768679465968980cceb5606c4bea77b06bea43827d0b67e', '08cfcade6ee7b5f99edbdfda24d3e454aac7a502391c8eac4c9cd91c81ac2cbe'),
(52, 8, 45, 9.80, '{\"enrollment_id\":8,\"criterion_id\":45,\"score\":9.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '08cfcade6ee7b5f99edbdfda24d3e454aac7a502391c8eac4c9cd91c81ac2cbe', '13dddfbc7d3de33fc0d20c568574fa8c39304b61714e60eb60033d0e310651fa'),
(53, 8, 46, 9.90, '{\"enrollment_id\":8,\"criterion_id\":46,\"score\":9.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '13dddfbc7d3de33fc0d20c568574fa8c39304b61714e60eb60033d0e310651fa', '07e23b51eefc45419c0e128499c8329b403bc886a3b755480d3895d25500b91a'),
(54, 8, 47, 9.90, '{\"enrollment_id\":8,\"criterion_id\":47,\"score\":9.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '07e23b51eefc45419c0e128499c8329b403bc886a3b755480d3895d25500b91a', '0951cd9726241945d01f479968c8d8afb9cecebec53790f08fe633e6067ae4b1'),
(55, 8, 48, 7.90, '{\"enrollment_id\":8,\"criterion_id\":48,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '0951cd9726241945d01f479968c8d8afb9cecebec53790f08fe633e6067ae4b1', '9dfe2643fb62c1acafdd9d3d6aada7625f914a6b972237f9545fee87365603b6'),
(56, 8, 49, 8.50, '{\"enrollment_id\":8,\"criterion_id\":49,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '9dfe2643fb62c1acafdd9d3d6aada7625f914a6b972237f9545fee87365603b6', 'bc8f46e3ca1a845ea0f17d75d2fcc6f84846596b937731d9af1f47ab79973722'),
(57, 9, 71, 8.00, '{\"enrollment_id\":9,\"criterion_id\":71,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'bc8f46e3ca1a845ea0f17d75d2fcc6f84846596b937731d9af1f47ab79973722', 'df9c52a72910c59d4fae2b6efb6255a4a6372fb5e2b46d33aad1b2699fbaa67f'),
(58, 9, 72, 9.80, '{\"enrollment_id\":9,\"criterion_id\":72,\"score\":9.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'df9c52a72910c59d4fae2b6efb6255a4a6372fb5e2b46d33aad1b2699fbaa67f', '305409c1187d2a5d516efc3a7bfe4f0784bb9fca82bd96f5993f9df4845a85ed'),
(59, 9, 73, 7.50, '{\"enrollment_id\":9,\"criterion_id\":73,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '305409c1187d2a5d516efc3a7bfe4f0784bb9fca82bd96f5993f9df4845a85ed', 'eef3f27f53fd5dc6ec92e04996b65d261afb4fe13f0217a495eaaaf3249708f6'),
(60, 9, 74, 9.80, '{\"enrollment_id\":9,\"criterion_id\":74,\"score\":9.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'eef3f27f53fd5dc6ec92e04996b65d261afb4fe13f0217a495eaaaf3249708f6', '0d99f096c25b9efb40e207732f40552894683c9808a90dcbd94ec2e0d30660f2'),
(61, 9, 75, 9.50, '{\"enrollment_id\":9,\"criterion_id\":75,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '0d99f096c25b9efb40e207732f40552894683c9808a90dcbd94ec2e0d30660f2', '13a19ec910df3e59d3f272b7a4b004088c1df2b6ea4d62d42d071774cb562503'),
(62, 9, 76, 8.10, '{\"enrollment_id\":9,\"criterion_id\":76,\"score\":8.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '13a19ec910df3e59d3f272b7a4b004088c1df2b6ea4d62d42d071774cb562503', 'fa6b2f02f2399d8435da9df23b40b530c9606b07273a598f426642c3d466c1f1'),
(63, 9, 77, 9.70, '{\"enrollment_id\":9,\"criterion_id\":77,\"score\":9.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'fa6b2f02f2399d8435da9df23b40b530c9606b07273a598f426642c3d466c1f1', 'db29d5577aca169f6f857c47886cdf0a45a2b1d09a63868b8f8130cdb2d6b52a'),
(64, 10, 78, 8.80, '{\"enrollment_id\":10,\"criterion_id\":78,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'db29d5577aca169f6f857c47886cdf0a45a2b1d09a63868b8f8130cdb2d6b52a', 'ada4c0ea2542dd6ae099d3873f89137651698b3a953742feb44f9ebb3e65324d'),
(65, 10, 79, 9.90, '{\"enrollment_id\":10,\"criterion_id\":79,\"score\":9.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'ada4c0ea2542dd6ae099d3873f89137651698b3a953742feb44f9ebb3e65324d', 'd25602ecdfa76f8b569422e946410cb4fd54e257a747f3093977c5cc47b29ff4'),
(66, 10, 80, 8.30, '{\"enrollment_id\":10,\"criterion_id\":80,\"score\":8.300000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'd25602ecdfa76f8b569422e946410cb4fd54e257a747f3093977c5cc47b29ff4', 'e2a48961a09a55f02b64d2789e4f6674adcf59bfb0776fd2ecc96eeabd01ea89'),
(67, 10, 81, 7.50, '{\"enrollment_id\":10,\"criterion_id\":81,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'e2a48961a09a55f02b64d2789e4f6674adcf59bfb0776fd2ecc96eeabd01ea89', '22ce474ea56e3ade4bf07b3469033d57dd40e8087227f28764be248b1470d8ae'),
(68, 10, 82, 7.80, '{\"enrollment_id\":10,\"criterion_id\":82,\"score\":7.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '22ce474ea56e3ade4bf07b3469033d57dd40e8087227f28764be248b1470d8ae', '1a256e9a27a66cf707909f4f27e0ea94509e155f9ef9221d7736a57d77ec8d3b'),
(69, 10, 83, 7.70, '{\"enrollment_id\":10,\"criterion_id\":83,\"score\":7.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '1a256e9a27a66cf707909f4f27e0ea94509e155f9ef9221d7736a57d77ec8d3b', '90cdf6c908d3bb1a509fb9ed6477d6f2794d4123bb947b333c75e2a33d8d7b79'),
(70, 10, 84, 8.00, '{\"enrollment_id\":10,\"criterion_id\":84,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '90cdf6c908d3bb1a509fb9ed6477d6f2794d4123bb947b333c75e2a33d8d7b79', '42e07bea326c0fa50be57609900e394538ecf8a8ec1a82f7dc33b93b315a80e5'),
(71, 11, 85, 9.00, '{\"enrollment_id\":11,\"criterion_id\":85,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '42e07bea326c0fa50be57609900e394538ecf8a8ec1a82f7dc33b93b315a80e5', '67519a6a057930c6794d6944d40385aad6123b07cbb56a302eeca16987bb3f76'),
(72, 11, 86, 7.60, '{\"enrollment_id\":11,\"criterion_id\":86,\"score\":7.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '67519a6a057930c6794d6944d40385aad6123b07cbb56a302eeca16987bb3f76', '74101482e97927a265736edbb6ce51cead918ef05706c24cd78a5ab3a0ec39d1'),
(73, 11, 87, 8.90, '{\"enrollment_id\":11,\"criterion_id\":87,\"score\":8.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '74101482e97927a265736edbb6ce51cead918ef05706c24cd78a5ab3a0ec39d1', '42fafc1f06c74abd740125a6fb806d659f45993c3a5a94df8ad0d687dc6cd06d'),
(74, 11, 88, 9.00, '{\"enrollment_id\":11,\"criterion_id\":88,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '42fafc1f06c74abd740125a6fb806d659f45993c3a5a94df8ad0d687dc6cd06d', 'd109563c20dc1ff01470be1d811126e8ed5651ca7fe121b92271259a615b6b89'),
(75, 11, 89, 9.80, '{\"enrollment_id\":11,\"criterion_id\":89,\"score\":9.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'd109563c20dc1ff01470be1d811126e8ed5651ca7fe121b92271259a615b6b89', '9cc385d617a8822cd19fb88ec2f387c1d63d69e8cb771efe4557ae597543db63'),
(76, 11, 90, 9.10, '{\"enrollment_id\":11,\"criterion_id\":90,\"score\":9.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '9cc385d617a8822cd19fb88ec2f387c1d63d69e8cb771efe4557ae597543db63', 'eb11f685178e7dda1d8290e7b3096d4b98acb614fcb782a7cff61afb87f4984f'),
(77, 11, 91, 9.90, '{\"enrollment_id\":11,\"criterion_id\":91,\"score\":9.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'eb11f685178e7dda1d8290e7b3096d4b98acb614fcb782a7cff61afb87f4984f', '78adce5348d0ef2bb1331f192618e1678a7327dcb490aa5ae7e53d843f73f2d0'),
(78, 12, 1, 8.70, '{\"enrollment_id\":12,\"criterion_id\":1,\"score\":8.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '78adce5348d0ef2bb1331f192618e1678a7327dcb490aa5ae7e53d843f73f2d0', 'd51a3db0b80322f68d2e842572297f6db392aebfdfa07c4143ea8bf4ad9fbcbf'),
(79, 12, 2, 10.00, '{\"enrollment_id\":12,\"criterion_id\":2,\"score\":10,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'd51a3db0b80322f68d2e842572297f6db392aebfdfa07c4143ea8bf4ad9fbcbf', 'b949010f6453a61a8fe7d0ab2f471f40c80a53ff92949bd5bd83fb2d33287324'),
(80, 12, 3, 8.40, '{\"enrollment_id\":12,\"criterion_id\":3,\"score\":8.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'b949010f6453a61a8fe7d0ab2f471f40c80a53ff92949bd5bd83fb2d33287324', '981e4bac08bf68f5b0218b8d032291ecf396386d655a2fb4ddbdc67a3cb82c7f'),
(81, 12, 4, 9.10, '{\"enrollment_id\":12,\"criterion_id\":4,\"score\":9.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '981e4bac08bf68f5b0218b8d032291ecf396386d655a2fb4ddbdc67a3cb82c7f', '8479fcb8671f8bc096fa5079df685afcb3f6bc4d28ab125863ac0b3f237dc7bb'),
(82, 12, 5, 8.70, '{\"enrollment_id\":12,\"criterion_id\":5,\"score\":8.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '8479fcb8671f8bc096fa5079df685afcb3f6bc4d28ab125863ac0b3f237dc7bb', 'b4757e34f78d54033816b4bc8a695291ba62edb144e2eb862deeb4dffb254e44'),
(83, 12, 6, 9.00, '{\"enrollment_id\":12,\"criterion_id\":6,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'b4757e34f78d54033816b4bc8a695291ba62edb144e2eb862deeb4dffb254e44', '76f01b71beb15159064fd2bb98065905976715ae60490ed7061d47449d78f7f4'),
(84, 12, 7, 9.20, '{\"enrollment_id\":12,\"criterion_id\":7,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '76f01b71beb15159064fd2bb98065905976715ae60490ed7061d47449d78f7f4', '4132b068b19adc004ecac7a7b36b3a3b19de7a1fc87017f8f5ee86546340d9c1'),
(85, 13, 36, 8.50, '{\"enrollment_id\":13,\"criterion_id\":36,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '4132b068b19adc004ecac7a7b36b3a3b19de7a1fc87017f8f5ee86546340d9c1', '702340f3218522b4c7fbe99ae34ba4df68af08334c462737ccd1f752d082e237'),
(86, 13, 37, 9.40, '{\"enrollment_id\":13,\"criterion_id\":37,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '702340f3218522b4c7fbe99ae34ba4df68af08334c462737ccd1f752d082e237', 'b938781c3394403d681accaa917a24755e5b1ba07538468c20c47d852a9c51e2'),
(87, 13, 38, 10.00, '{\"enrollment_id\":13,\"criterion_id\":38,\"score\":10,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'b938781c3394403d681accaa917a24755e5b1ba07538468c20c47d852a9c51e2', 'f73c02a72c7e17f819409ef6e1abb930ec68e8333804fc44e6659ab66ee80313'),
(88, 13, 39, 7.50, '{\"enrollment_id\":13,\"criterion_id\":39,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'f73c02a72c7e17f819409ef6e1abb930ec68e8333804fc44e6659ab66ee80313', '4749838f3529942f59ee6201184b73096590d6344bd3c18cf833fbecfb0cb029'),
(89, 13, 40, 8.70, '{\"enrollment_id\":13,\"criterion_id\":40,\"score\":8.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '4749838f3529942f59ee6201184b73096590d6344bd3c18cf833fbecfb0cb029', 'b97eeaf1dae88f16f53f8490f8a0fe676d9cd79e95502a1fa01d7d0718ced07a'),
(90, 13, 41, 9.20, '{\"enrollment_id\":13,\"criterion_id\":41,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'b97eeaf1dae88f16f53f8490f8a0fe676d9cd79e95502a1fa01d7d0718ced07a', 'c3fc751335dbfe87dd142ad7aa246a9043e70ff07cd40b3bc917c457c35055bd'),
(91, 13, 42, 9.50, '{\"enrollment_id\":13,\"criterion_id\":42,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'c3fc751335dbfe87dd142ad7aa246a9043e70ff07cd40b3bc917c457c35055bd', '7369a53c7c717026b2cf7db05625c02321f2b46c151ad374439c7166d9632297'),
(92, 14, 92, 8.40, '{\"enrollment_id\":14,\"criterion_id\":92,\"score\":8.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '7369a53c7c717026b2cf7db05625c02321f2b46c151ad374439c7166d9632297', 'de2c914cb6fa9aeb3347b4fa391c45486f8dda7092e481c9a7d709fc41f16b8c'),
(93, 14, 93, 8.80, '{\"enrollment_id\":14,\"criterion_id\":93,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'de2c914cb6fa9aeb3347b4fa391c45486f8dda7092e481c9a7d709fc41f16b8c', '7964e80ffecba3d7d5137d2cb1400c2188ecac7ffa37727be148224defa5e09b'),
(94, 14, 94, 9.70, '{\"enrollment_id\":14,\"criterion_id\":94,\"score\":9.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '7964e80ffecba3d7d5137d2cb1400c2188ecac7ffa37727be148224defa5e09b', '79f0671bed0313f9ce496636c5a95729ce792ed491d594beb92d9139c0ad42b2'),
(95, 14, 95, 7.60, '{\"enrollment_id\":14,\"criterion_id\":95,\"score\":7.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '79f0671bed0313f9ce496636c5a95729ce792ed491d594beb92d9139c0ad42b2', '46d89be81b3c9373c49e19c9e3baa0c0219712b195d7c79ad717e16774c82d34'),
(96, 14, 96, 8.10, '{\"enrollment_id\":14,\"criterion_id\":96,\"score\":8.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '46d89be81b3c9373c49e19c9e3baa0c0219712b195d7c79ad717e16774c82d34', '0105c6b9b4b6678ae1c7d69fbd443135734404d4b45b5186303edb46d3727acb'),
(97, 14, 97, 8.60, '{\"enrollment_id\":14,\"criterion_id\":97,\"score\":8.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '0105c6b9b4b6678ae1c7d69fbd443135734404d4b45b5186303edb46d3727acb', '5a17910f458c3d01ebb95a2ed9f21bcbcab3e28d30744f5931a2e7f9908db5c5'),
(98, 14, 98, 9.20, '{\"enrollment_id\":14,\"criterion_id\":98,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '5a17910f458c3d01ebb95a2ed9f21bcbcab3e28d30744f5931a2e7f9908db5c5', '57f6f4aea6a2900a4833ba414cdeb523b62a618a014e62fbc2037ab0dac5db5a'),
(99, 15, 99, 8.90, '{\"enrollment_id\":15,\"criterion_id\":99,\"score\":8.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '57f6f4aea6a2900a4833ba414cdeb523b62a618a014e62fbc2037ab0dac5db5a', '8ab1ecebb123ed6eb9463f297a45f05e2ff225497b127d2093fa5d32abfbbe1a'),
(100, 15, 100, 9.80, '{\"enrollment_id\":15,\"criterion_id\":100,\"score\":9.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '8ab1ecebb123ed6eb9463f297a45f05e2ff225497b127d2093fa5d32abfbbe1a', 'fb92bf0d0191398e98ebdc8fb88c9ac449b26a3937868c0d80b80f2308b2ed8f'),
(101, 15, 101, 7.90, '{\"enrollment_id\":15,\"criterion_id\":101,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'fb92bf0d0191398e98ebdc8fb88c9ac449b26a3937868c0d80b80f2308b2ed8f', 'c08e82d50da1c58c64f7687296b2a29a5c0d9ffac53e9bc9e799ef79f2be615a'),
(102, 15, 102, 8.40, '{\"enrollment_id\":15,\"criterion_id\":102,\"score\":8.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'c08e82d50da1c58c64f7687296b2a29a5c0d9ffac53e9bc9e799ef79f2be615a', '6ac17a3e7f60c6950bbd172afcdcf04d00317e78271c77f43fd954d48ea3d2a7'),
(103, 15, 103, 9.10, '{\"enrollment_id\":15,\"criterion_id\":103,\"score\":9.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '6ac17a3e7f60c6950bbd172afcdcf04d00317e78271c77f43fd954d48ea3d2a7', 'fffdb6b0024db32251257aa866db3861830454fbe152f94437ecdba90a8f6902'),
(104, 15, 104, 10.00, '{\"enrollment_id\":15,\"criterion_id\":104,\"score\":10,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'fffdb6b0024db32251257aa866db3861830454fbe152f94437ecdba90a8f6902', '4e73dc695b18c6477b6fc492ea86e76d72aa2d3aa3570056b03e3548d45846fc'),
(105, 15, 105, 9.90, '{\"enrollment_id\":15,\"criterion_id\":105,\"score\":9.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '4e73dc695b18c6477b6fc492ea86e76d72aa2d3aa3570056b03e3548d45846fc', '577c47906acdb7bbd91c4aa08ddc6c617df75dbdfe6e1e2f820565e7364b36ac'),
(106, 16, 106, 9.70, '{\"enrollment_id\":16,\"criterion_id\":106,\"score\":9.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '577c47906acdb7bbd91c4aa08ddc6c617df75dbdfe6e1e2f820565e7364b36ac', '1e51563e270438363a09469e671c33f2c66e66dbbdb634ff2b9b1278cc5b7ff4'),
(107, 16, 107, 9.30, '{\"enrollment_id\":16,\"criterion_id\":107,\"score\":9.300000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '1e51563e270438363a09469e671c33f2c66e66dbbdb634ff2b9b1278cc5b7ff4', '741e02dd53167a8be1b7042588bba3dd41669bebc20bf9c723de6327104edfc7'),
(108, 16, 108, 9.20, '{\"enrollment_id\":16,\"criterion_id\":108,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '741e02dd53167a8be1b7042588bba3dd41669bebc20bf9c723de6327104edfc7', 'a6244d35486f3b66daecd0c6671b001c0167e7d628b05aad18656eae5cb34082'),
(109, 16, 109, 8.20, '{\"enrollment_id\":16,\"criterion_id\":109,\"score\":8.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'a6244d35486f3b66daecd0c6671b001c0167e7d628b05aad18656eae5cb34082', '6eac332655092b028e3db3547cb50a882761955982f47000cd97dee3f4bc9273'),
(110, 16, 110, 9.60, '{\"enrollment_id\":16,\"criterion_id\":110,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '6eac332655092b028e3db3547cb50a882761955982f47000cd97dee3f4bc9273', 'ae5442782c1772419205c70503d5b1a728628db951c0ed8cbf419e935d415163'),
(111, 16, 111, 10.00, '{\"enrollment_id\":16,\"criterion_id\":111,\"score\":10,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'ae5442782c1772419205c70503d5b1a728628db951c0ed8cbf419e935d415163', '8afd44ae8337960b6fe4aac07be95eaacd5e70a08723dd22dbfe9b1604f0956b'),
(112, 16, 112, 8.20, '{\"enrollment_id\":16,\"criterion_id\":112,\"score\":8.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '8afd44ae8337960b6fe4aac07be95eaacd5e70a08723dd22dbfe9b1604f0956b', '8efb9f8701d3c1ebf3c1915c852f06e64a956c894259e014a0930ad9458c0be3'),
(113, 17, 15, 7.60, '{\"enrollment_id\":17,\"criterion_id\":15,\"score\":7.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '8efb9f8701d3c1ebf3c1915c852f06e64a956c894259e014a0930ad9458c0be3', '4f64639dd6cfac48894fd0881f08586d0408fa2439a5c93903653bfeeb807ac2'),
(114, 17, 16, 6.40, '{\"enrollment_id\":17,\"criterion_id\":16,\"score\":6.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '4f64639dd6cfac48894fd0881f08586d0408fa2439a5c93903653bfeeb807ac2', 'c3b9de3093ef300fdbce2b6d8be324c7b919238e391c14ff0b179d3a8a8f4cf0'),
(115, 17, 17, 7.70, '{\"enrollment_id\":17,\"criterion_id\":17,\"score\":7.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'c3b9de3093ef300fdbce2b6d8be324c7b919238e391c14ff0b179d3a8a8f4cf0', 'e6e96064158872d7b40c78d94807d23ce4beb121f9c4c9328fbbd98ccf461913');
INSERT INTO `score_ledger` (`id`, `enrollment_id`, `criterion_id`, `score`, `data_snapshot`, `action`, `graded_by`, `timestamp`, `previous_hash`, `current_hash`) VALUES
(116, 17, 18, 6.00, '{\"enrollment_id\":17,\"criterion_id\":18,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'e6e96064158872d7b40c78d94807d23ce4beb121f9c4c9328fbbd98ccf461913', 'cfb5daf567c54552e20115629609bccbcb7958769e8ca6e6caa18b2e69f4ed17'),
(117, 17, 19, 6.70, '{\"enrollment_id\":17,\"criterion_id\":19,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'cfb5daf567c54552e20115629609bccbcb7958769e8ca6e6caa18b2e69f4ed17', '6afb8ba12f28b5ded56421451abc61de8e67900f3fb395c34a5801abacc5f4e5'),
(118, 17, 20, 7.30, '{\"enrollment_id\":17,\"criterion_id\":20,\"score\":7.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '6afb8ba12f28b5ded56421451abc61de8e67900f3fb395c34a5801abacc5f4e5', 'a31a807ad10b109d750ad46975838f8fd9fa6a24594a89f61e8499cc2ca334bb'),
(119, 17, 21, 6.80, '{\"enrollment_id\":17,\"criterion_id\":21,\"score\":6.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'a31a807ad10b109d750ad46975838f8fd9fa6a24594a89f61e8499cc2ca334bb', '38e3bfccb3964d586c9eb99ac0ca2676b40e42258135ba656edbe543ce37a087'),
(120, 18, 22, 6.90, '{\"enrollment_id\":18,\"criterion_id\":22,\"score\":6.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '38e3bfccb3964d586c9eb99ac0ca2676b40e42258135ba656edbe543ce37a087', '3ae5d022ebe008b8e638cb5fa022ca857f8a30c7c340f7a87216d25d2cc92c43'),
(121, 18, 23, 7.80, '{\"enrollment_id\":18,\"criterion_id\":23,\"score\":7.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '3ae5d022ebe008b8e638cb5fa022ca857f8a30c7c340f7a87216d25d2cc92c43', '4b7ee9b5535e183b733632ba661f6a9bd8f4ba717353c05c135df641163b4cdc'),
(122, 18, 24, 6.00, '{\"enrollment_id\":18,\"criterion_id\":24,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '4b7ee9b5535e183b733632ba661f6a9bd8f4ba717353c05c135df641163b4cdc', '1097c2c91616522839c9bd6f4332a41aa050e4cbbc700a671a9f874ecb5f33a7'),
(123, 18, 25, 7.80, '{\"enrollment_id\":18,\"criterion_id\":25,\"score\":7.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '1097c2c91616522839c9bd6f4332a41aa050e4cbbc700a671a9f874ecb5f33a7', '430f114ecb4c2d2064803735dd22e2e878abd84c5d933df57361548bd9e2afa6'),
(124, 18, 26, 7.30, '{\"enrollment_id\":18,\"criterion_id\":26,\"score\":7.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '430f114ecb4c2d2064803735dd22e2e878abd84c5d933df57361548bd9e2afa6', '7ffe2d92d9ac89f90ccb3349e664f6927608e7d4c0459d4b49032c8e6c0396e1'),
(125, 18, 27, 6.70, '{\"enrollment_id\":18,\"criterion_id\":27,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '7ffe2d92d9ac89f90ccb3349e664f6927608e7d4c0459d4b49032c8e6c0396e1', '79d5ae3e3bac69af0e56b2023e5b165ec43f4e137e6e7b89595a08da18c334a5'),
(126, 18, 28, 5.50, '{\"enrollment_id\":18,\"criterion_id\":28,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '79d5ae3e3bac69af0e56b2023e5b165ec43f4e137e6e7b89595a08da18c334a5', '3ef9035fb8ee5833139c379c9d57ac72ce99da4c13be63c6eb28be5acf0e9828'),
(127, 19, 29, 5.80, '{\"enrollment_id\":19,\"criterion_id\":29,\"score\":5.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '3ef9035fb8ee5833139c379c9d57ac72ce99da4c13be63c6eb28be5acf0e9828', '6e22ccb48327a4198a34c53d0b12c12b7660ac070ac863ca4c423f3596660271'),
(128, 19, 30, 6.30, '{\"enrollment_id\":19,\"criterion_id\":30,\"score\":6.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '6e22ccb48327a4198a34c53d0b12c12b7660ac070ac863ca4c423f3596660271', '4b3b4b98183e0c48d0cb30c4614c6ff1921bb52f45b9be0f466ad9bdc8324c4d'),
(129, 19, 31, 6.60, '{\"enrollment_id\":19,\"criterion_id\":31,\"score\":6.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '4b3b4b98183e0c48d0cb30c4614c6ff1921bb52f45b9be0f466ad9bdc8324c4d', '6bfb8d8c5d65eb5f01b41b596d4e12646b7b5e5565ac1679b7053ebae55b3a30'),
(130, 19, 32, 7.70, '{\"enrollment_id\":19,\"criterion_id\":32,\"score\":7.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '6bfb8d8c5d65eb5f01b41b596d4e12646b7b5e5565ac1679b7053ebae55b3a30', 'abcea4559171a151a86b5af9f5aeae2d435c5cdc2f2d030ffda056a4dc862836'),
(131, 19, 33, 5.80, '{\"enrollment_id\":19,\"criterion_id\":33,\"score\":5.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'abcea4559171a151a86b5af9f5aeae2d435c5cdc2f2d030ffda056a4dc862836', '09835ac4340de0789dd29bf29a5b37d8d91aece3552d8de4bff585795f8aa361'),
(132, 19, 34, 8.00, '{\"enrollment_id\":19,\"criterion_id\":34,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '09835ac4340de0789dd29bf29a5b37d8d91aece3552d8de4bff585795f8aa361', '99df35d954d3861f8cc6ff8f8563a755eafed357736083a9bfbc16ff60fda1fc'),
(133, 19, 35, 5.70, '{\"enrollment_id\":19,\"criterion_id\":35,\"score\":5.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '99df35d954d3861f8cc6ff8f8563a755eafed357736083a9bfbc16ff60fda1fc', '65570c62066878dd992f0476a13910869f0479172f52e3320e1703b90141f748'),
(134, 20, 50, 5.90, '{\"enrollment_id\":20,\"criterion_id\":50,\"score\":5.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '65570c62066878dd992f0476a13910869f0479172f52e3320e1703b90141f748', 'b6c7ee93c03bbc536b7f90758be98f990317d5332c1a0f55945d7a30f5d5ce38'),
(135, 20, 51, 6.80, '{\"enrollment_id\":20,\"criterion_id\":51,\"score\":6.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'b6c7ee93c03bbc536b7f90758be98f990317d5332c1a0f55945d7a30f5d5ce38', '0dfd07cccdea53c4bd49faeb617068ce790052bb4839d949834e058bdd1a3f45'),
(136, 20, 52, 6.70, '{\"enrollment_id\":20,\"criterion_id\":52,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '0dfd07cccdea53c4bd49faeb617068ce790052bb4839d949834e058bdd1a3f45', '20b0b8cb3d33616fce24eaad9e6a8ff850bbb93e9480846fe728a9e61d042959'),
(137, 20, 53, 7.70, '{\"enrollment_id\":20,\"criterion_id\":53,\"score\":7.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '20b0b8cb3d33616fce24eaad9e6a8ff850bbb93e9480846fe728a9e61d042959', '60a588d9bb4b1dcb779135afa79de1a81df81e0f93798654129e7504493b8aa3'),
(138, 20, 54, 5.50, '{\"enrollment_id\":20,\"criterion_id\":54,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '60a588d9bb4b1dcb779135afa79de1a81df81e0f93798654129e7504493b8aa3', '2bce66a7af41549f4c2b284084416c166f8c904ca1b09cb1903cf7bf8db5cd2a'),
(139, 20, 55, 6.30, '{\"enrollment_id\":20,\"criterion_id\":55,\"score\":6.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '2bce66a7af41549f4c2b284084416c166f8c904ca1b09cb1903cf7bf8db5cd2a', 'a3dbfdedafb4c672b1e1e222913fc49ff3e3514c60e4f4cb01b2728716a2d50c'),
(140, 20, 56, 7.30, '{\"enrollment_id\":20,\"criterion_id\":56,\"score\":7.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'a3dbfdedafb4c672b1e1e222913fc49ff3e3514c60e4f4cb01b2728716a2d50c', 'e9046a0267fc77d5553b806af6235d9cf316b59dea7ca75572799b5f2622883d'),
(141, 21, 57, 6.20, '{\"enrollment_id\":21,\"criterion_id\":57,\"score\":6.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'e9046a0267fc77d5553b806af6235d9cf316b59dea7ca75572799b5f2622883d', '0ff55bdde98bd88636d2a45eb2fbc4a1e0cfff5aee8a95de3a85b9913ebbf43e'),
(142, 21, 58, 6.40, '{\"enrollment_id\":21,\"criterion_id\":58,\"score\":6.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '0ff55bdde98bd88636d2a45eb2fbc4a1e0cfff5aee8a95de3a85b9913ebbf43e', '140914cc1f9fecd4683be1e552b65881b3a0fa4fbf9d20ed7fbcbd895abfc14e'),
(143, 21, 59, 5.70, '{\"enrollment_id\":21,\"criterion_id\":59,\"score\":5.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '140914cc1f9fecd4683be1e552b65881b3a0fa4fbf9d20ed7fbcbd895abfc14e', '16f8db678b3b7547b9bf86bd0576dae16ef7741ac09f5b385dd9beed4181cde0'),
(144, 21, 60, 6.70, '{\"enrollment_id\":21,\"criterion_id\":60,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '16f8db678b3b7547b9bf86bd0576dae16ef7741ac09f5b385dd9beed4181cde0', '26d5bcb8b4d2223422de08f8a86dc0eabbbfb0cd3d4b2d1c4992180e79aeb69c'),
(145, 21, 61, 5.90, '{\"enrollment_id\":21,\"criterion_id\":61,\"score\":5.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '26d5bcb8b4d2223422de08f8a86dc0eabbbfb0cd3d4b2d1c4992180e79aeb69c', 'd77e49bbe77ef3ab514ff622c6c0f6ad0b6a98a6a8921c8faee810f0a9824c54'),
(146, 21, 62, 5.60, '{\"enrollment_id\":21,\"criterion_id\":62,\"score\":5.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'd77e49bbe77ef3ab514ff622c6c0f6ad0b6a98a6a8921c8faee810f0a9824c54', 'f6ebefd1a9636ab6d36c7d16d784ad1e61291f223ae3408444100f4467f0370e'),
(147, 21, 63, 6.80, '{\"enrollment_id\":21,\"criterion_id\":63,\"score\":6.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'f6ebefd1a9636ab6d36c7d16d784ad1e61291f223ae3408444100f4467f0370e', '39d32de94aebdfc9e94a8367e20c614acae36373d06a8339440581395e52b308'),
(148, 22, 64, 7.40, '{\"enrollment_id\":22,\"criterion_id\":64,\"score\":7.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '39d32de94aebdfc9e94a8367e20c614acae36373d06a8339440581395e52b308', 'c2f9f17b08738065bdb559fc98e0f9ee1a7dbb316e25bd687955d79aeb366f0a'),
(149, 22, 65, 6.80, '{\"enrollment_id\":22,\"criterion_id\":65,\"score\":6.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'c2f9f17b08738065bdb559fc98e0f9ee1a7dbb316e25bd687955d79aeb366f0a', '30f1bcd2091a905444e2a6e6c3b36e35444bd293b9e876c896b0a5014b64007b'),
(150, 22, 66, 8.00, '{\"enrollment_id\":22,\"criterion_id\":66,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '30f1bcd2091a905444e2a6e6c3b36e35444bd293b9e876c896b0a5014b64007b', 'ad60de4f3416d7e8f0fb6017467ddc03d01ffbda29444702072774776521c275'),
(151, 22, 67, 5.90, '{\"enrollment_id\":22,\"criterion_id\":67,\"score\":5.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'ad60de4f3416d7e8f0fb6017467ddc03d01ffbda29444702072774776521c275', 'd19bbca67de089a03be10b27736f0c9d199ef1f7b926efd9bc7ab4f016e1b230'),
(152, 22, 68, 7.40, '{\"enrollment_id\":22,\"criterion_id\":68,\"score\":7.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'd19bbca67de089a03be10b27736f0c9d199ef1f7b926efd9bc7ab4f016e1b230', 'c279f87b959e00a0b99b005ac6c3733f466b616347d7eaac2459ee91bd8795de'),
(153, 22, 69, 6.50, '{\"enrollment_id\":22,\"criterion_id\":69,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'c279f87b959e00a0b99b005ac6c3733f466b616347d7eaac2459ee91bd8795de', '74ba2b190f11abf1313b0cf9724463cb2cffd2172f4d4ed5468be356c7bb75cd'),
(154, 22, 70, 6.20, '{\"enrollment_id\":22,\"criterion_id\":70,\"score\":6.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '74ba2b190f11abf1313b0cf9724463cb2cffd2172f4d4ed5468be356c7bb75cd', '172a2610e0a0591343be8ca232adcd2887f110e8a21ef87d074c92c43bbfd4ab'),
(155, 23, 8, 6.00, '{\"enrollment_id\":23,\"criterion_id\":8,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '172a2610e0a0591343be8ca232adcd2887f110e8a21ef87d074c92c43bbfd4ab', 'a5ae4e1268ff48d084214b584e4bee658cb21306294c5055fe6718338e9353a9'),
(156, 23, 9, 7.90, '{\"enrollment_id\":23,\"criterion_id\":9,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'a5ae4e1268ff48d084214b584e4bee658cb21306294c5055fe6718338e9353a9', 'a937cae0db1cde7869060a2dcf2e979db0d042ef426ef953b775ce008d63d567'),
(157, 23, 10, 6.40, '{\"enrollment_id\":23,\"criterion_id\":10,\"score\":6.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'a937cae0db1cde7869060a2dcf2e979db0d042ef426ef953b775ce008d63d567', '5cf9961096204cb2721aed754367bc8765ae3194255dffde128908b7cd92f1c6'),
(158, 23, 11, 6.80, '{\"enrollment_id\":23,\"criterion_id\":11,\"score\":6.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '5cf9961096204cb2721aed754367bc8765ae3194255dffde128908b7cd92f1c6', 'b0855165053ab80d6e5e358dbcc04134f046cbc60b3cde386962b3775cc12cad'),
(159, 23, 12, 7.20, '{\"enrollment_id\":23,\"criterion_id\":12,\"score\":7.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'b0855165053ab80d6e5e358dbcc04134f046cbc60b3cde386962b3775cc12cad', '1de663703e8bbfa4a18bb782164c4c58f9580f6f8178259335ebd496eb3cea56'),
(160, 23, 13, 5.60, '{\"enrollment_id\":23,\"criterion_id\":13,\"score\":5.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '1de663703e8bbfa4a18bb782164c4c58f9580f6f8178259335ebd496eb3cea56', '2c95b5160c43c3e0e485d8b05d3c38e68e839c26ee00bc1743f04d0a3508e1f5'),
(161, 23, 14, 7.90, '{\"enrollment_id\":23,\"criterion_id\":14,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '2c95b5160c43c3e0e485d8b05d3c38e68e839c26ee00bc1743f04d0a3508e1f5', '5f6b0237c848cc056676b298eba36081fb489897e40f5c0d65f02b664c168a60'),
(162, 24, 43, 5.50, '{\"enrollment_id\":24,\"criterion_id\":43,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '5f6b0237c848cc056676b298eba36081fb489897e40f5c0d65f02b664c168a60', '361e11e1008e79ba40caf650492bb191031c7e14bcd9adf6ca7ffc12abde7f56'),
(163, 24, 44, 5.90, '{\"enrollment_id\":24,\"criterion_id\":44,\"score\":5.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '361e11e1008e79ba40caf650492bb191031c7e14bcd9adf6ca7ffc12abde7f56', '42cf4aebbe1461a73c6d37a5e1cf26be91ce88c142e39b4acb200504ac10f898'),
(164, 24, 45, 7.60, '{\"enrollment_id\":24,\"criterion_id\":45,\"score\":7.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '42cf4aebbe1461a73c6d37a5e1cf26be91ce88c142e39b4acb200504ac10f898', 'b1fb9474664106d4905952665caa7409c7bbbee3c9947937398aab691b504e20'),
(165, 24, 46, 6.00, '{\"enrollment_id\":24,\"criterion_id\":46,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'b1fb9474664106d4905952665caa7409c7bbbee3c9947937398aab691b504e20', '81922fa4aa70a1442c43c2aa05e0a57713d7715a35cd16a5f51839e6123fd4ff'),
(166, 24, 47, 7.20, '{\"enrollment_id\":24,\"criterion_id\":47,\"score\":7.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '81922fa4aa70a1442c43c2aa05e0a57713d7715a35cd16a5f51839e6123fd4ff', '301d230819e185f8841ba040410751f8674da45680b8c7c81f409585e54617f4'),
(167, 24, 48, 5.50, '{\"enrollment_id\":24,\"criterion_id\":48,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '301d230819e185f8841ba040410751f8674da45680b8c7c81f409585e54617f4', 'd537213d4d04e344ce49608a159ee4e6be757c14f89051a6f8c95d14048857f0'),
(168, 24, 49, 5.70, '{\"enrollment_id\":24,\"criterion_id\":49,\"score\":5.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'd537213d4d04e344ce49608a159ee4e6be757c14f89051a6f8c95d14048857f0', '4eff784155786e6ee41ca991c551dd3bac839d0b89ba4a10f9a66eb67e46fa5f'),
(169, 25, 71, 6.60, '{\"enrollment_id\":25,\"criterion_id\":71,\"score\":6.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '4eff784155786e6ee41ca991c551dd3bac839d0b89ba4a10f9a66eb67e46fa5f', '311b4e0baf3001eb4589d0489d2c1f901b9bcd47b33de862e0d66508130b7b18'),
(170, 25, 72, 5.50, '{\"enrollment_id\":25,\"criterion_id\":72,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '311b4e0baf3001eb4589d0489d2c1f901b9bcd47b33de862e0d66508130b7b18', '985cee4c9f3c014573e7fc8efe60a004a8189d364cd8cbacc66fbe102a345068'),
(171, 25, 73, 7.50, '{\"enrollment_id\":25,\"criterion_id\":73,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '985cee4c9f3c014573e7fc8efe60a004a8189d364cd8cbacc66fbe102a345068', '7df29aa48756228c7bd97adb9cf6212a4242c76c9a437e9f9a8047790ee1e163'),
(172, 25, 74, 7.90, '{\"enrollment_id\":25,\"criterion_id\":74,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '7df29aa48756228c7bd97adb9cf6212a4242c76c9a437e9f9a8047790ee1e163', '026ca7ee8577f4b175f96c4ae6ddac9922ed4bf14943d8e2a09bfbdf9bf0f876'),
(173, 25, 75, 7.10, '{\"enrollment_id\":25,\"criterion_id\":75,\"score\":7.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '026ca7ee8577f4b175f96c4ae6ddac9922ed4bf14943d8e2a09bfbdf9bf0f876', 'fea5e9f5532ebb472734322e28a907a5edd21ef00dc3e9971fdc4cfc1ceb88a4'),
(174, 25, 76, 6.30, '{\"enrollment_id\":25,\"criterion_id\":76,\"score\":6.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'fea5e9f5532ebb472734322e28a907a5edd21ef00dc3e9971fdc4cfc1ceb88a4', 'd7593b8a498eafee884f4eabf4ea86862e25d75342f0b40109156421445c952e'),
(175, 25, 77, 7.20, '{\"enrollment_id\":25,\"criterion_id\":77,\"score\":7.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'd7593b8a498eafee884f4eabf4ea86862e25d75342f0b40109156421445c952e', '8820f71e821cd562a7ec9a95288415183da01f71153b124bbcea602844808554'),
(176, 26, 78, 5.70, '{\"enrollment_id\":26,\"criterion_id\":78,\"score\":5.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '8820f71e821cd562a7ec9a95288415183da01f71153b124bbcea602844808554', '589af3471d37eee9e9142ea077d798aa6236938f57d8639782895d5fdced1066'),
(177, 26, 79, 6.30, '{\"enrollment_id\":26,\"criterion_id\":79,\"score\":6.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '589af3471d37eee9e9142ea077d798aa6236938f57d8639782895d5fdced1066', 'd8b5abaa934086f464124a908442a336f3b85640f716536f73c8a6b3048edaf2'),
(178, 26, 80, 7.90, '{\"enrollment_id\":26,\"criterion_id\":80,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'd8b5abaa934086f464124a908442a336f3b85640f716536f73c8a6b3048edaf2', 'e188ce456861bc7bc87f05600ce4407fdbc7552707920b9e17671275a129dce5'),
(179, 26, 81, 7.20, '{\"enrollment_id\":26,\"criterion_id\":81,\"score\":7.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'e188ce456861bc7bc87f05600ce4407fdbc7552707920b9e17671275a129dce5', '1ad03df8ae220386f333d63779ecba3acb2b360766f205c2da8a1f48830ceeaa'),
(180, 26, 82, 6.50, '{\"enrollment_id\":26,\"criterion_id\":82,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '1ad03df8ae220386f333d63779ecba3acb2b360766f205c2da8a1f48830ceeaa', '8cdcbbda0f5fb59971b39b394d7fbed544cb4826f73599b81c01eb7495c96a13'),
(181, 26, 83, 7.00, '{\"enrollment_id\":26,\"criterion_id\":83,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '8cdcbbda0f5fb59971b39b394d7fbed544cb4826f73599b81c01eb7495c96a13', '56a8e155afc0d149ef808a25f9d61ac1cd5ddf9a62e6e42f75a9aba42d783642'),
(182, 26, 84, 5.80, '{\"enrollment_id\":26,\"criterion_id\":84,\"score\":5.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '56a8e155afc0d149ef808a25f9d61ac1cd5ddf9a62e6e42f75a9aba42d783642', '8d5ec093c2532d9aaea54baf008b4d0bd4ce52bf1b44785cc21293894e5c7ea4'),
(183, 27, 85, 6.70, '{\"enrollment_id\":27,\"criterion_id\":85,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '8d5ec093c2532d9aaea54baf008b4d0bd4ce52bf1b44785cc21293894e5c7ea4', '18f53cf1f0fd6b48a04fb6a28863887a4f9d3807e07cc784d1415577b7c709be'),
(184, 27, 86, 6.70, '{\"enrollment_id\":27,\"criterion_id\":86,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '18f53cf1f0fd6b48a04fb6a28863887a4f9d3807e07cc784d1415577b7c709be', 'a0cbe691c96bf8ee906a12ac20a67328e022ee7de07aac4d2da05b0816669efb'),
(185, 27, 87, 5.80, '{\"enrollment_id\":27,\"criterion_id\":87,\"score\":5.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'a0cbe691c96bf8ee906a12ac20a67328e022ee7de07aac4d2da05b0816669efb', '5cd6edc25bc4c45f17341e64e7400206f6a5de8ed19ce05e1cb591e4c922023f'),
(186, 27, 88, 6.20, '{\"enrollment_id\":27,\"criterion_id\":88,\"score\":6.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '5cd6edc25bc4c45f17341e64e7400206f6a5de8ed19ce05e1cb591e4c922023f', '46c351a51a07c20d0735f73f503f8bbd090198fdecb983ecc32eaa263afac556'),
(187, 27, 89, 5.90, '{\"enrollment_id\":27,\"criterion_id\":89,\"score\":5.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '46c351a51a07c20d0735f73f503f8bbd090198fdecb983ecc32eaa263afac556', '30c1f34fbbb80d493c6d66a8667dadf399eae19986e1d380d48ba7f359fb242c'),
(188, 27, 90, 5.70, '{\"enrollment_id\":27,\"criterion_id\":90,\"score\":5.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '30c1f34fbbb80d493c6d66a8667dadf399eae19986e1d380d48ba7f359fb242c', 'f9e7ff762685d791dcc7d11087872eaea396680265a6d07c09de8d8da834aa69'),
(189, 27, 91, 7.80, '{\"enrollment_id\":27,\"criterion_id\":91,\"score\":7.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'f9e7ff762685d791dcc7d11087872eaea396680265a6d07c09de8d8da834aa69', '4dfc27461eb89ed6cf6a4cd9b47f2e4fb47289782b45eea24c771b71ecbd7f3b'),
(190, 28, 1, 7.60, '{\"enrollment_id\":28,\"criterion_id\":1,\"score\":7.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '4dfc27461eb89ed6cf6a4cd9b47f2e4fb47289782b45eea24c771b71ecbd7f3b', 'a7c968fb08103f6e730ecf7a812ddb62f149152d3a0dd7f49292ec0a239825b7'),
(191, 28, 2, 5.60, '{\"enrollment_id\":28,\"criterion_id\":2,\"score\":5.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'a7c968fb08103f6e730ecf7a812ddb62f149152d3a0dd7f49292ec0a239825b7', '06a4d9d09b08686d0b3ae5999967ce076d05850d0604467f6c0a4986e41f58f0'),
(192, 28, 3, 7.90, '{\"enrollment_id\":28,\"criterion_id\":3,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '06a4d9d09b08686d0b3ae5999967ce076d05850d0604467f6c0a4986e41f58f0', '09f897b585aefc98836dcb6e52169b32a22a423962a136538789922fe7b3499b'),
(193, 28, 4, 5.60, '{\"enrollment_id\":28,\"criterion_id\":4,\"score\":5.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '09f897b585aefc98836dcb6e52169b32a22a423962a136538789922fe7b3499b', 'f20987e449a47c437f373839cba2a827d8fe7c31c69f4adff953a95c66f12ec7'),
(194, 28, 5, 7.90, '{\"enrollment_id\":28,\"criterion_id\":5,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'f20987e449a47c437f373839cba2a827d8fe7c31c69f4adff953a95c66f12ec7', 'b1dbe71ef718bdaaefdba3d4636b32a1e28eeef04135dad412564c24b10b89b5'),
(195, 28, 6, 6.40, '{\"enrollment_id\":28,\"criterion_id\":6,\"score\":6.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'b1dbe71ef718bdaaefdba3d4636b32a1e28eeef04135dad412564c24b10b89b5', '2b0a56d6cdd2701bbe41cb70ba0456626b4991555291165188260a724ee9be7a'),
(196, 28, 7, 5.80, '{\"enrollment_id\":28,\"criterion_id\":7,\"score\":5.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '2b0a56d6cdd2701bbe41cb70ba0456626b4991555291165188260a724ee9be7a', 'ee8b4a5f730f4e4d4968a0e2d4e93a2a3c6f792b5b7cdca3892b55a77420aece'),
(197, 29, 36, 7.40, '{\"enrollment_id\":29,\"criterion_id\":36,\"score\":7.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'ee8b4a5f730f4e4d4968a0e2d4e93a2a3c6f792b5b7cdca3892b55a77420aece', '7d6100a756d162cbd823b8afa1fbcedc77bef3780dda2c6f3329ce03f6bca81c'),
(198, 29, 37, 6.50, '{\"enrollment_id\":29,\"criterion_id\":37,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '7d6100a756d162cbd823b8afa1fbcedc77bef3780dda2c6f3329ce03f6bca81c', '240bb4ceb7debd9de2e680f462bd0736c35514bf90a55532439c9fa021c40b94'),
(199, 29, 38, 7.00, '{\"enrollment_id\":29,\"criterion_id\":38,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '240bb4ceb7debd9de2e680f462bd0736c35514bf90a55532439c9fa021c40b94', '8712e0d1a3a55a5f924972e5c076a193b6b74a3fe29b9158ff102b7ed0821a7f'),
(200, 29, 39, 8.00, '{\"enrollment_id\":29,\"criterion_id\":39,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '8712e0d1a3a55a5f924972e5c076a193b6b74a3fe29b9158ff102b7ed0821a7f', '8fe0a148282342070502d5ba1139363302ede096dd2ff4b0ae7e57962983af89'),
(201, 29, 40, 6.10, '{\"enrollment_id\":29,\"criterion_id\":40,\"score\":6.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '8fe0a148282342070502d5ba1139363302ede096dd2ff4b0ae7e57962983af89', '90d9de0ac142f1ba948f12a1605240ab830a5ce2ae49badeca77dc6492391463'),
(202, 29, 41, 6.00, '{\"enrollment_id\":29,\"criterion_id\":41,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '90d9de0ac142f1ba948f12a1605240ab830a5ce2ae49badeca77dc6492391463', 'ad517ae0689f26d7bc04231b52d34d38487d7924d5e025783097d44efa3204b6'),
(203, 29, 42, 7.80, '{\"enrollment_id\":29,\"criterion_id\":42,\"score\":7.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'ad517ae0689f26d7bc04231b52d34d38487d7924d5e025783097d44efa3204b6', 'a625f2b3bff0da3abf8a730621aacd48dd489f4893027750a7ade40094202c15'),
(204, 30, 92, 7.20, '{\"enrollment_id\":30,\"criterion_id\":92,\"score\":7.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'a625f2b3bff0da3abf8a730621aacd48dd489f4893027750a7ade40094202c15', '3dd02b5505ea343dbf09856d79f8b4afa48129b8e5bd934fab499948788727f7'),
(205, 30, 93, 7.50, '{\"enrollment_id\":30,\"criterion_id\":93,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '3dd02b5505ea343dbf09856d79f8b4afa48129b8e5bd934fab499948788727f7', '9c49667f08bcd39c5d7f3706d4d5d0bca0102ffaf89ce78d30a0a6e66eb9562b'),
(206, 30, 94, 7.70, '{\"enrollment_id\":30,\"criterion_id\":94,\"score\":7.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '9c49667f08bcd39c5d7f3706d4d5d0bca0102ffaf89ce78d30a0a6e66eb9562b', 'bf0ce344b403455097d7105e46217b46421f65b4a9a5c9dce79c23f2e11cff65'),
(207, 30, 95, 5.60, '{\"enrollment_id\":30,\"criterion_id\":95,\"score\":5.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'bf0ce344b403455097d7105e46217b46421f65b4a9a5c9dce79c23f2e11cff65', '445184ab1d7c84bbf3713c49caf16446e45f3b31fb2b669de3c3325ce6c2f5d3'),
(208, 30, 96, 5.80, '{\"enrollment_id\":30,\"criterion_id\":96,\"score\":5.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '445184ab1d7c84bbf3713c49caf16446e45f3b31fb2b669de3c3325ce6c2f5d3', 'b002d4d2900a9b455fe14165bffa86557af8ab61e4e818fb8844c2605b5dc372'),
(209, 30, 97, 7.70, '{\"enrollment_id\":30,\"criterion_id\":97,\"score\":7.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'b002d4d2900a9b455fe14165bffa86557af8ab61e4e818fb8844c2605b5dc372', '7163276a91739dd1ffedacad7cb1422658824a28e1186ea110a97b42f91e1ac8'),
(210, 30, 98, 8.00, '{\"enrollment_id\":30,\"criterion_id\":98,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '7163276a91739dd1ffedacad7cb1422658824a28e1186ea110a97b42f91e1ac8', '59c8cd84d8238443a0299663b344e1fc3bda744923dc8adaa21aca58fb587622'),
(211, 31, 99, 7.60, '{\"enrollment_id\":31,\"criterion_id\":99,\"score\":7.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '59c8cd84d8238443a0299663b344e1fc3bda744923dc8adaa21aca58fb587622', '588c9905706d3613f21ee021e1b4df7be5294f0a01d4330a0ad2dd3531f09f56'),
(212, 31, 100, 7.90, '{\"enrollment_id\":31,\"criterion_id\":100,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '588c9905706d3613f21ee021e1b4df7be5294f0a01d4330a0ad2dd3531f09f56', '30610ebfc1909b4b1ae6ce7ab5c143eac6efad71e0e5c38b571e021337c0f867'),
(213, 31, 101, 6.90, '{\"enrollment_id\":31,\"criterion_id\":101,\"score\":6.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '30610ebfc1909b4b1ae6ce7ab5c143eac6efad71e0e5c38b571e021337c0f867', '9d4141ae95f337229c3dac83efa17e8e42551a39953952c6f43b543d0d8822bf'),
(214, 31, 102, 6.70, '{\"enrollment_id\":31,\"criterion_id\":102,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '9d4141ae95f337229c3dac83efa17e8e42551a39953952c6f43b543d0d8822bf', '93c22d412da9bde4f5b6c8d3f0bef7b174e53b2e0fc66651dce32ff873573af7'),
(215, 31, 103, 6.10, '{\"enrollment_id\":31,\"criterion_id\":103,\"score\":6.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '93c22d412da9bde4f5b6c8d3f0bef7b174e53b2e0fc66651dce32ff873573af7', '1dfdb659d94841d5a6c1aac9b896c641200d52aec419b7ca6fa9be04daa4638c'),
(216, 31, 104, 7.50, '{\"enrollment_id\":31,\"criterion_id\":104,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '1dfdb659d94841d5a6c1aac9b896c641200d52aec419b7ca6fa9be04daa4638c', 'b628751717995df8e4d97dd27ef907400aa073b50e255fccdeb82888b4d527a7'),
(217, 31, 105, 7.20, '{\"enrollment_id\":31,\"criterion_id\":105,\"score\":7.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'b628751717995df8e4d97dd27ef907400aa073b50e255fccdeb82888b4d527a7', 'ed38abdc5f21dd496a2fbcead46ba011ac8fb5835544127a78ead46c7050c46e'),
(218, 32, 106, 8.00, '{\"enrollment_id\":32,\"criterion_id\":106,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'ed38abdc5f21dd496a2fbcead46ba011ac8fb5835544127a78ead46c7050c46e', 'd90a48ab486d23c8ebdf157a6513fe6f477f9a5af910778af45fd4a298aa6e57'),
(219, 32, 107, 6.40, '{\"enrollment_id\":32,\"criterion_id\":107,\"score\":6.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'd90a48ab486d23c8ebdf157a6513fe6f477f9a5af910778af45fd4a298aa6e57', '9b91f1adbcd8ca34d773c97cdd83157db56bbb325e9ea8fad25aa5f401f35ba9'),
(220, 32, 108, 5.80, '{\"enrollment_id\":32,\"criterion_id\":108,\"score\":5.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '9b91f1adbcd8ca34d773c97cdd83157db56bbb325e9ea8fad25aa5f401f35ba9', 'fb3297e3fb0d8004b4116ee8d702f1768d7fba21c3e02b3173407074017d4912'),
(221, 32, 109, 6.00, '{\"enrollment_id\":32,\"criterion_id\":109,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'fb3297e3fb0d8004b4116ee8d702f1768d7fba21c3e02b3173407074017d4912', '0ca84835d18958f43f989ce6ed574c7ac4e96963d840747bdc2deab29ad6db4b'),
(222, 32, 110, 6.50, '{\"enrollment_id\":32,\"criterion_id\":110,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '0ca84835d18958f43f989ce6ed574c7ac4e96963d840747bdc2deab29ad6db4b', 'cd6c22f66f149b6a4df02d365f4bf99115cccdf0dbbfc32fab4384f28c31b369'),
(223, 32, 111, 6.40, '{\"enrollment_id\":32,\"criterion_id\":111,\"score\":6.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'cd6c22f66f149b6a4df02d365f4bf99115cccdf0dbbfc32fab4384f28c31b369', '2399b83229fb9d947ade9f1cfdaeb67d270bd35830db2cf65ed61714d1e032b3'),
(224, 32, 112, 7.90, '{\"enrollment_id\":32,\"criterion_id\":112,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '2399b83229fb9d947ade9f1cfdaeb67d270bd35830db2cf65ed61714d1e032b3', '10b6480621f87cb97c9478ba61d429524e7e1618238dfc0556a6733a4b3db217'),
(225, 33, 15, 9.80, '{\"enrollment_id\":33,\"criterion_id\":15,\"score\":9.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '10b6480621f87cb97c9478ba61d429524e7e1618238dfc0556a6733a4b3db217', '35a9c0c8d0783b96bec6f4ba85287a308d74463c3ad4c4370668723250ba8821'),
(226, 33, 16, 9.10, '{\"enrollment_id\":33,\"criterion_id\":16,\"score\":9.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '35a9c0c8d0783b96bec6f4ba85287a308d74463c3ad4c4370668723250ba8821', '482938afebd84bca05c7bf91d2747903c73a5e530874d70e377f6598ce7b3a3a'),
(227, 33, 17, 9.40, '{\"enrollment_id\":33,\"criterion_id\":17,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '482938afebd84bca05c7bf91d2747903c73a5e530874d70e377f6598ce7b3a3a', '3e8f5be1f31b550992df3209c4777cc572588d30c3c67d73415dceb78b0ba247'),
(228, 33, 18, 9.70, '{\"enrollment_id\":33,\"criterion_id\":18,\"score\":9.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '3e8f5be1f31b550992df3209c4777cc572588d30c3c67d73415dceb78b0ba247', 'd0fdc81ed99b5c41a75dfc50242f36e2543e3cfcffe410fa39256e4c54dc5d37'),
(229, 33, 19, 9.90, '{\"enrollment_id\":33,\"criterion_id\":19,\"score\":9.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'd0fdc81ed99b5c41a75dfc50242f36e2543e3cfcffe410fa39256e4c54dc5d37', '494ffeeb3f2e994126db559552f81eaa0660dadaaa7dfec4c5a0ce9296693cb8');
INSERT INTO `score_ledger` (`id`, `enrollment_id`, `criterion_id`, `score`, `data_snapshot`, `action`, `graded_by`, `timestamp`, `previous_hash`, `current_hash`) VALUES
(230, 33, 20, 9.40, '{\"enrollment_id\":33,\"criterion_id\":20,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '494ffeeb3f2e994126db559552f81eaa0660dadaaa7dfec4c5a0ce9296693cb8', '2d40d00e50767d7458580f3c3efc5335034fb0de78540433a8f5d3d1fbbe591d'),
(231, 33, 21, 9.40, '{\"enrollment_id\":33,\"criterion_id\":21,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '2d40d00e50767d7458580f3c3efc5335034fb0de78540433a8f5d3d1fbbe591d', 'd49529da540149db459d9f677bd47dec17035f87ceb6be311a75eb5c92e55149'),
(232, 34, 22, 9.60, '{\"enrollment_id\":34,\"criterion_id\":22,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'd49529da540149db459d9f677bd47dec17035f87ceb6be311a75eb5c92e55149', 'e73298c5dcc3ebbfd634eac564b0c180bcba602ac132254263503d6cd031db9b'),
(233, 34, 23, 9.40, '{\"enrollment_id\":34,\"criterion_id\":23,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'e73298c5dcc3ebbfd634eac564b0c180bcba602ac132254263503d6cd031db9b', 'e1be0e72ab7bc158c166db2fb00567746869f068f1fce52440d748b9ea65a25f'),
(234, 34, 24, 9.00, '{\"enrollment_id\":34,\"criterion_id\":24,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'e1be0e72ab7bc158c166db2fb00567746869f068f1fce52440d748b9ea65a25f', 'c2c49d9ca00b56c07068aa1ae5be8b21ca956e2e655b5f5785f7a798769360ad'),
(235, 34, 25, 9.60, '{\"enrollment_id\":34,\"criterion_id\":25,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'c2c49d9ca00b56c07068aa1ae5be8b21ca956e2e655b5f5785f7a798769360ad', 'a29e99bb6a6b4f71a07e58a299af0982a268bb840bb0c9db42f97f9e0f7abdbd'),
(236, 34, 26, 8.80, '{\"enrollment_id\":34,\"criterion_id\":26,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'a29e99bb6a6b4f71a07e58a299af0982a268bb840bb0c9db42f97f9e0f7abdbd', 'fadf31b1b7cf7635891686019c1a9dd4654d9597df61280eae034e940ec25d9e'),
(237, 34, 27, 8.90, '{\"enrollment_id\":34,\"criterion_id\":27,\"score\":8.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'fadf31b1b7cf7635891686019c1a9dd4654d9597df61280eae034e940ec25d9e', '1a7929b926d4aeb459ce59818cf128da4e086b031163be5aca943e61d1a80a19'),
(238, 34, 28, 9.70, '{\"enrollment_id\":34,\"criterion_id\":28,\"score\":9.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '1a7929b926d4aeb459ce59818cf128da4e086b031163be5aca943e61d1a80a19', '48334b1adf90f8bc0ce0a43c0b4bbbedb6ccab204c9b296cd3ab7549149fbbe5'),
(239, 35, 29, 9.60, '{\"enrollment_id\":35,\"criterion_id\":29,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '48334b1adf90f8bc0ce0a43c0b4bbbedb6ccab204c9b296cd3ab7549149fbbe5', '858e139448277b32f460c839c99182f02f9390b878fa6f5c3304b951943cac21'),
(240, 35, 30, 8.60, '{\"enrollment_id\":35,\"criterion_id\":30,\"score\":8.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '858e139448277b32f460c839c99182f02f9390b878fa6f5c3304b951943cac21', '897fd9b29bb59fe1c914abf90297e6ae92d3c5109ac0022a15dfeb5680f4761b'),
(241, 35, 31, 9.20, '{\"enrollment_id\":35,\"criterion_id\":31,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '897fd9b29bb59fe1c914abf90297e6ae92d3c5109ac0022a15dfeb5680f4761b', 'cd08253a11169c11576c034af3e909caf8b9b7b083f4f687b5d58bc2dcb7f0de'),
(242, 35, 32, 9.40, '{\"enrollment_id\":35,\"criterion_id\":32,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'cd08253a11169c11576c034af3e909caf8b9b7b083f4f687b5d58bc2dcb7f0de', '2eedf1d979e9be8108dfbbcbf3248bcd5e1012a4d436117b9c3fd2d01ee000dc'),
(243, 35, 33, 8.60, '{\"enrollment_id\":35,\"criterion_id\":33,\"score\":8.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '2eedf1d979e9be8108dfbbcbf3248bcd5e1012a4d436117b9c3fd2d01ee000dc', 'ad730a2143485e7f43bd3912ad6daa2b2fd984c44c9c8d4a36437ed299afb675'),
(244, 35, 34, 8.80, '{\"enrollment_id\":35,\"criterion_id\":34,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'ad730a2143485e7f43bd3912ad6daa2b2fd984c44c9c8d4a36437ed299afb675', '29ff6556291c38a86d7aa367f1b96a5f60b68c9a2f901b9d323a032e66789a9c'),
(245, 35, 35, 9.30, '{\"enrollment_id\":35,\"criterion_id\":35,\"score\":9.300000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '29ff6556291c38a86d7aa367f1b96a5f60b68c9a2f901b9d323a032e66789a9c', '157e62b811bd8a008138af782ffacd5a4be72363efbfea316aeb1d7da6f4e361'),
(246, 36, 50, 8.60, '{\"enrollment_id\":36,\"criterion_id\":50,\"score\":8.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '157e62b811bd8a008138af782ffacd5a4be72363efbfea316aeb1d7da6f4e361', '2c95df9f3dd9a907229c696fbb8b661375b8ca4b8b179ddeb02d14f62ed6861d'),
(247, 36, 51, 9.30, '{\"enrollment_id\":36,\"criterion_id\":51,\"score\":9.300000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '2c95df9f3dd9a907229c696fbb8b661375b8ca4b8b179ddeb02d14f62ed6861d', 'df45863694cc282180556c0766998b93399e533fa7816b18d80fbc903473845d'),
(248, 36, 52, 8.90, '{\"enrollment_id\":36,\"criterion_id\":52,\"score\":8.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'df45863694cc282180556c0766998b93399e533fa7816b18d80fbc903473845d', '34094afde95592f775f0e6803a49e7223aec25b9506d7665d5969e65f09491c1'),
(249, 36, 53, 9.50, '{\"enrollment_id\":36,\"criterion_id\":53,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '34094afde95592f775f0e6803a49e7223aec25b9506d7665d5969e65f09491c1', '7825798e1cb06a1e2dd3959e2dcc25878fd8f8a0bc6db22b8de455b15c5a231f'),
(250, 36, 54, 10.00, '{\"enrollment_id\":36,\"criterion_id\":54,\"score\":10,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '7825798e1cb06a1e2dd3959e2dcc25878fd8f8a0bc6db22b8de455b15c5a231f', '45ae0d9b2f527deebc73e7a80fb6f180466316ad19a613c60d5df4824f52e27f'),
(251, 36, 55, 9.70, '{\"enrollment_id\":36,\"criterion_id\":55,\"score\":9.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '45ae0d9b2f527deebc73e7a80fb6f180466316ad19a613c60d5df4824f52e27f', '07d3c1e11e3b0aaf58eafbec05a553c2b772454efd6a7b760d217925872c5f65'),
(252, 36, 56, 8.80, '{\"enrollment_id\":36,\"criterion_id\":56,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '07d3c1e11e3b0aaf58eafbec05a553c2b772454efd6a7b760d217925872c5f65', '1bd34b84f6a9f760fb62e89f4c4064eb0120a97967c462611991615abedc3319'),
(253, 37, 8, 9.60, '{\"enrollment_id\":37,\"criterion_id\":8,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '1bd34b84f6a9f760fb62e89f4c4064eb0120a97967c462611991615abedc3319', 'afd9a31cbe8fffb2896db179641262d06c30330af55e5e68d54c0dd4bfa296c7'),
(254, 37, 9, 9.20, '{\"enrollment_id\":37,\"criterion_id\":9,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'afd9a31cbe8fffb2896db179641262d06c30330af55e5e68d54c0dd4bfa296c7', '1c580afcb58bb2778e2f41d510ddc2d643f8dcaebb0f8c08621c6fad8a564e39'),
(255, 37, 10, 8.80, '{\"enrollment_id\":37,\"criterion_id\":10,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '1c580afcb58bb2778e2f41d510ddc2d643f8dcaebb0f8c08621c6fad8a564e39', '2a52b5c35190e7f337de2e78650bb4d111ad4a4241e36a45e9057a9be98f9655'),
(256, 37, 11, 8.80, '{\"enrollment_id\":37,\"criterion_id\":11,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '2a52b5c35190e7f337de2e78650bb4d111ad4a4241e36a45e9057a9be98f9655', 'eeb1c032c161096080d01aa445c3f026b979fae15afa75108bfe46c564eef055'),
(257, 37, 12, 8.80, '{\"enrollment_id\":37,\"criterion_id\":12,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'eeb1c032c161096080d01aa445c3f026b979fae15afa75108bfe46c564eef055', 'f249d97c3ff4d9abfa4a23dfd4c6cff41b2ec425abfcbfb7c6755d7851b2d6f2'),
(258, 37, 13, 9.20, '{\"enrollment_id\":37,\"criterion_id\":13,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'f249d97c3ff4d9abfa4a23dfd4c6cff41b2ec425abfcbfb7c6755d7851b2d6f2', '632d5c530d8f2902aafee75de58fd649159d429bca8ae3da69bfeff5cd460972'),
(259, 37, 14, 8.70, '{\"enrollment_id\":37,\"criterion_id\":14,\"score\":8.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '632d5c530d8f2902aafee75de58fd649159d429bca8ae3da69bfeff5cd460972', 'f1acebedfbddcb639b5abc2e1d6fa4ddc479c1fef91fa99e7107b99627ee8ef7'),
(260, 38, 43, 9.70, '{\"enrollment_id\":38,\"criterion_id\":43,\"score\":9.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'f1acebedfbddcb639b5abc2e1d6fa4ddc479c1fef91fa99e7107b99627ee8ef7', '459c703b4b6a014e689884f0287d00059fcd13ef951bc9bd117ed487a9f29512'),
(261, 38, 44, 9.30, '{\"enrollment_id\":38,\"criterion_id\":44,\"score\":9.300000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '459c703b4b6a014e689884f0287d00059fcd13ef951bc9bd117ed487a9f29512', '5b5f93f1bb233a95628bf823653dbb848bcae1dc51f2c3870b944a894dcaac82'),
(262, 38, 45, 9.60, '{\"enrollment_id\":38,\"criterion_id\":45,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '5b5f93f1bb233a95628bf823653dbb848bcae1dc51f2c3870b944a894dcaac82', '971da461b2bdb698af2814c856dbdbb094d779d77129c7ba72614d06cd4f265b'),
(263, 38, 46, 8.80, '{\"enrollment_id\":38,\"criterion_id\":46,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '971da461b2bdb698af2814c856dbdbb094d779d77129c7ba72614d06cd4f265b', '6093f55e9afa7924b2c662648d823c27de8aa23b68d16a252f6577710eab681a'),
(264, 38, 47, 8.70, '{\"enrollment_id\":38,\"criterion_id\":47,\"score\":8.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '6093f55e9afa7924b2c662648d823c27de8aa23b68d16a252f6577710eab681a', '804dc1b4e9e179bb5694f9b4d63334ba19051e3ab54a52c4d3e667eb82c25945'),
(265, 38, 48, 9.20, '{\"enrollment_id\":38,\"criterion_id\":48,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '804dc1b4e9e179bb5694f9b4d63334ba19051e3ab54a52c4d3e667eb82c25945', '9dad5e6c4cabacc60a37b5414a376140f333278f7028e7443ef2d0ad0aba3896'),
(266, 38, 49, 9.50, '{\"enrollment_id\":38,\"criterion_id\":49,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '9dad5e6c4cabacc60a37b5414a376140f333278f7028e7443ef2d0ad0aba3896', '1f496e6711e608c7fbc6a0030e4ea655e36a4fde5b4ce3fc70cd7ef1de1f9922'),
(267, 39, 71, 8.90, '{\"enrollment_id\":39,\"criterion_id\":71,\"score\":8.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '1f496e6711e608c7fbc6a0030e4ea655e36a4fde5b4ce3fc70cd7ef1de1f9922', 'de255063ca92573695d13d85f4abfea8287f24027058b811a7574c7cd8a16cc8'),
(268, 39, 72, 9.40, '{\"enrollment_id\":39,\"criterion_id\":72,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'de255063ca92573695d13d85f4abfea8287f24027058b811a7574c7cd8a16cc8', '2eeeada9bb8601dded8d70a8a70b3fa014435f221c90dcf847d872784f389cfe'),
(269, 39, 73, 9.40, '{\"enrollment_id\":39,\"criterion_id\":73,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '2eeeada9bb8601dded8d70a8a70b3fa014435f221c90dcf847d872784f389cfe', '63d326a89ed9d4a48935771e9481904c02078bbce3a2e7e49301779ec6ff4328'),
(270, 39, 74, 9.10, '{\"enrollment_id\":39,\"criterion_id\":74,\"score\":9.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '63d326a89ed9d4a48935771e9481904c02078bbce3a2e7e49301779ec6ff4328', '16ae6e946e07b1171611272a7b790cc51eb65b40698bd1a150a1f8bd185eed31'),
(271, 39, 75, 9.50, '{\"enrollment_id\":39,\"criterion_id\":75,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '16ae6e946e07b1171611272a7b790cc51eb65b40698bd1a150a1f8bd185eed31', '9cfc8ff28018cbef07aae50dd3e3b1058588678f60c2f86ae304ec7f34140785'),
(272, 39, 76, 9.40, '{\"enrollment_id\":39,\"criterion_id\":76,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '9cfc8ff28018cbef07aae50dd3e3b1058588678f60c2f86ae304ec7f34140785', '3c913fc585b496c2e8626654f5d3fde6c6cbd9ecba59bf1a83e38cb2a687f66c'),
(273, 39, 77, 9.10, '{\"enrollment_id\":39,\"criterion_id\":77,\"score\":9.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '3c913fc585b496c2e8626654f5d3fde6c6cbd9ecba59bf1a83e38cb2a687f66c', '5f5597726d3c6ee4dcf86aa96c8a4ac8ae283da56c890848f5ac18e151cb9ad2'),
(274, 40, 1, 9.80, '{\"enrollment_id\":40,\"criterion_id\":1,\"score\":9.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '5f5597726d3c6ee4dcf86aa96c8a4ac8ae283da56c890848f5ac18e151cb9ad2', 'e62b6aacb2110ca2bde100e167ebd4c171f86b07eec0d849e8cd9c03ea48e48c'),
(275, 40, 2, 9.50, '{\"enrollment_id\":40,\"criterion_id\":2,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'e62b6aacb2110ca2bde100e167ebd4c171f86b07eec0d849e8cd9c03ea48e48c', '4732fd872682580250b92731e6cfbcb64ca117dc5c3011b4e8bfcf5137f0e6f5'),
(276, 40, 3, 9.60, '{\"enrollment_id\":40,\"criterion_id\":3,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '4732fd872682580250b92731e6cfbcb64ca117dc5c3011b4e8bfcf5137f0e6f5', '352a76602daa9cbec36b0abbfa0f7fe80b933f12048257436b7bbe4e7659ed83'),
(277, 40, 4, 9.60, '{\"enrollment_id\":40,\"criterion_id\":4,\"score\":9.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '352a76602daa9cbec36b0abbfa0f7fe80b933f12048257436b7bbe4e7659ed83', 'da54ab8c0473bb831bca00be20d3a15093fe212e144828cc6c06f75f09079ed4'),
(278, 40, 5, 8.60, '{\"enrollment_id\":40,\"criterion_id\":5,\"score\":8.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'da54ab8c0473bb831bca00be20d3a15093fe212e144828cc6c06f75f09079ed4', '754e77957b0e83e5132c70c044a17e800301dc0a052b0ad7a1e449fc7824de97'),
(279, 40, 6, 9.80, '{\"enrollment_id\":40,\"criterion_id\":6,\"score\":9.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '754e77957b0e83e5132c70c044a17e800301dc0a052b0ad7a1e449fc7824de97', '4c9faf1d2892cafbfcdd09fc35a444cabc1dacef684e2c15c9ef828b1c58eba6'),
(280, 40, 7, 9.00, '{\"enrollment_id\":40,\"criterion_id\":7,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '4c9faf1d2892cafbfcdd09fc35a444cabc1dacef684e2c15c9ef828b1c58eba6', '9aa836bceef806bccf604beacc7a14d55b98fefad57c88d3498fbce16c8c94af'),
(281, 41, 36, 9.00, '{\"enrollment_id\":41,\"criterion_id\":36,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '9aa836bceef806bccf604beacc7a14d55b98fefad57c88d3498fbce16c8c94af', 'a9886078c7677aa5cd7d888481e0b218b85c7d5f0443a0ea686c9304b919c4a5'),
(282, 41, 37, 9.00, '{\"enrollment_id\":41,\"criterion_id\":37,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'a9886078c7677aa5cd7d888481e0b218b85c7d5f0443a0ea686c9304b919c4a5', '7fa18e1a24cc9a327fb11cd3ea81a919222a96a2dc0a04e5a635b5ac44f12112'),
(283, 41, 38, 9.10, '{\"enrollment_id\":41,\"criterion_id\":38,\"score\":9.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '7fa18e1a24cc9a327fb11cd3ea81a919222a96a2dc0a04e5a635b5ac44f12112', '5a9738d5e86ca3b749346b2435810b2ac42e9e4ab694b1d8cfe37041a2c5bacd'),
(284, 41, 39, 10.00, '{\"enrollment_id\":41,\"criterion_id\":39,\"score\":10,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '5a9738d5e86ca3b749346b2435810b2ac42e9e4ab694b1d8cfe37041a2c5bacd', '3a1893b9e1f1a8cff7c28488c28975dcbd9c7b9bc7623dc00fa0be48cbd66402'),
(285, 41, 40, 8.50, '{\"enrollment_id\":41,\"criterion_id\":40,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '3a1893b9e1f1a8cff7c28488c28975dcbd9c7b9bc7623dc00fa0be48cbd66402', '72e3c600f4f8a6033f2e29b1b0fbcd0cd3f4a4c95227e31652bc09b36f68bf42'),
(286, 41, 41, 8.90, '{\"enrollment_id\":41,\"criterion_id\":41,\"score\":8.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '72e3c600f4f8a6033f2e29b1b0fbcd0cd3f4a4c95227e31652bc09b36f68bf42', 'd95e662025e5f98e39a1fd36b65eed1b8c3dcb8c5b54cb64e7eaf448c3910d65'),
(287, 41, 42, 8.70, '{\"enrollment_id\":41,\"criterion_id\":42,\"score\":8.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'd95e662025e5f98e39a1fd36b65eed1b8c3dcb8c5b54cb64e7eaf448c3910d65', '46bfcfe082598da4a71fceaee21fda2789f5815b8cd710753c80c87b21f49e87'),
(288, 42, 92, 9.00, '{\"enrollment_id\":42,\"criterion_id\":92,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '46bfcfe082598da4a71fceaee21fda2789f5815b8cd710753c80c87b21f49e87', 'e6cd76a62088953a1f3a2100c9928b24260739c8df11aafd6426d66d342cadf6'),
(289, 42, 93, 8.90, '{\"enrollment_id\":42,\"criterion_id\":93,\"score\":8.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'e6cd76a62088953a1f3a2100c9928b24260739c8df11aafd6426d66d342cadf6', '717c07f6d297583a98e324a94f28076cae97cde83c6ab7acb4711b5b43f84a18'),
(290, 42, 94, 9.70, '{\"enrollment_id\":42,\"criterion_id\":94,\"score\":9.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '717c07f6d297583a98e324a94f28076cae97cde83c6ab7acb4711b5b43f84a18', '5a27eb0c2419bd5ae98b016ba56553e8385640bfcb166591e9c1228add2d74ba'),
(291, 42, 95, 8.80, '{\"enrollment_id\":42,\"criterion_id\":95,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '5a27eb0c2419bd5ae98b016ba56553e8385640bfcb166591e9c1228add2d74ba', '6a566b1c79234ffb953d2be0308722036f153335afa63ab917bc52ab6244ace4'),
(292, 42, 96, 9.20, '{\"enrollment_id\":42,\"criterion_id\":96,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '6a566b1c79234ffb953d2be0308722036f153335afa63ab917bc52ab6244ace4', 'c1d356fe2578c73dbade2990f94ddd31d6e53a09fe2310da704c9a39b8a6b9e6'),
(293, 42, 97, 9.80, '{\"enrollment_id\":42,\"criterion_id\":97,\"score\":9.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'c1d356fe2578c73dbade2990f94ddd31d6e53a09fe2310da704c9a39b8a6b9e6', '955f695b27e8631180c2837332e5ecf6438d61b795e32ca2f799155898d52c8f'),
(294, 42, 98, 9.40, '{\"enrollment_id\":42,\"criterion_id\":98,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '955f695b27e8631180c2837332e5ecf6438d61b795e32ca2f799155898d52c8f', 'fb64b073e2c99b21a2738d79997514e8a257f87ea924315f823d725e7f69f9ff'),
(295, 43, 15, 5.80, '{\"enrollment_id\":43,\"criterion_id\":15,\"score\":5.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'fb64b073e2c99b21a2738d79997514e8a257f87ea924315f823d725e7f69f9ff', '6d2571624853eb328a30fecaef4a3f96ff57b8fa542da41610fb2bc6b4f595aa'),
(296, 43, 16, 6.50, '{\"enrollment_id\":43,\"criterion_id\":16,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '6d2571624853eb328a30fecaef4a3f96ff57b8fa542da41610fb2bc6b4f595aa', '67e5008d8ea3c808a1d0ea9cf6aeacd36dbdf5ef87c400aa03b533ca1f267190'),
(297, 43, 17, 5.70, '{\"enrollment_id\":43,\"criterion_id\":17,\"score\":5.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '67e5008d8ea3c808a1d0ea9cf6aeacd36dbdf5ef87c400aa03b533ca1f267190', '7f3ce373c2295344fa6bc81e8f5175a04ebd022dbc762d73317248b671901d52'),
(298, 43, 18, 5.50, '{\"enrollment_id\":43,\"criterion_id\":18,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '7f3ce373c2295344fa6bc81e8f5175a04ebd022dbc762d73317248b671901d52', '98cbeafb16e06ef4470defdf98dacbebe1d398529506e1631554cc843c24eb7c'),
(299, 43, 19, 5.30, '{\"enrollment_id\":43,\"criterion_id\":19,\"score\":5.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '98cbeafb16e06ef4470defdf98dacbebe1d398529506e1631554cc843c24eb7c', '750824bf659e6140f8058e132f9929a7f05e8c20d7de71872883954ded6f2fa0'),
(300, 43, 20, 6.80, '{\"enrollment_id\":43,\"criterion_id\":20,\"score\":6.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '750824bf659e6140f8058e132f9929a7f05e8c20d7de71872883954ded6f2fa0', '0d1bb9d82a1479e0cf4bb145ff781a4f9af7821af79ae1a0e117ac93b21d2cbb'),
(301, 43, 21, 6.20, '{\"enrollment_id\":43,\"criterion_id\":21,\"score\":6.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '0d1bb9d82a1479e0cf4bb145ff781a4f9af7821af79ae1a0e117ac93b21d2cbb', '2d2ffe2e7f3d8bb60af972be2eaac9fb17f586e7045ffbb1f5216510d3e5c6e1'),
(302, 44, 22, 7.40, '{\"enrollment_id\":44,\"criterion_id\":22,\"score\":7.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '2d2ffe2e7f3d8bb60af972be2eaac9fb17f586e7045ffbb1f5216510d3e5c6e1', '8546270246b06ef0651d2d70b6541c9a4a47a828f5aad3519bcc4f8076f6f428'),
(303, 44, 23, 7.20, '{\"enrollment_id\":44,\"criterion_id\":23,\"score\":7.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '8546270246b06ef0651d2d70b6541c9a4a47a828f5aad3519bcc4f8076f6f428', '8d318679713bc526bcd86adcf72593b4c8f0cd33a9d18e470368101ba9157b01'),
(304, 44, 24, 8.20, '{\"enrollment_id\":44,\"criterion_id\":24,\"score\":8.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '8d318679713bc526bcd86adcf72593b4c8f0cd33a9d18e470368101ba9157b01', 'e6bae5907f6148f69611d655426cbbf55c2b62536d412de74fa99ce1f79a933c'),
(305, 44, 25, 8.00, '{\"enrollment_id\":44,\"criterion_id\":25,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'e6bae5907f6148f69611d655426cbbf55c2b62536d412de74fa99ce1f79a933c', '0d92590f4d68cf85b3d2ab3f3ba25a145c4121c53c458323950f6ee3f4eca6ce'),
(306, 44, 26, 7.10, '{\"enrollment_id\":44,\"criterion_id\":26,\"score\":7.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '0d92590f4d68cf85b3d2ab3f3ba25a145c4121c53c458323950f6ee3f4eca6ce', '0c9ffa8eb39e3cc94889f788fd574ecfa3849be8e7c62f6015327497b169244e'),
(307, 44, 27, 8.20, '{\"enrollment_id\":44,\"criterion_id\":27,\"score\":8.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '0c9ffa8eb39e3cc94889f788fd574ecfa3849be8e7c62f6015327497b169244e', '1770d9ff754fa38753ff20fee9ae0dae34846a7cc14be171e42f668c7c865994'),
(308, 44, 28, 6.30, '{\"enrollment_id\":44,\"criterion_id\":28,\"score\":6.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '1770d9ff754fa38753ff20fee9ae0dae34846a7cc14be171e42f668c7c865994', '72b61590f4e93cc3efeb0e8f6435375d0ef9a71b91e256c6139e3abc3a334a31'),
(309, 45, 29, 7.90, '{\"enrollment_id\":45,\"criterion_id\":29,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '72b61590f4e93cc3efeb0e8f6435375d0ef9a71b91e256c6139e3abc3a334a31', '9abed9ccb142b09fe3095d0876e04bac7cc6dec13b78b39c3e3cc537d14736af'),
(310, 45, 30, 6.30, '{\"enrollment_id\":45,\"criterion_id\":30,\"score\":6.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '9abed9ccb142b09fe3095d0876e04bac7cc6dec13b78b39c3e3cc537d14736af', '65bc028c21694f488872c7d57408940fcc46aa7643ac38980268408822e86d77'),
(311, 45, 31, 8.70, '{\"enrollment_id\":45,\"criterion_id\":31,\"score\":8.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '65bc028c21694f488872c7d57408940fcc46aa7643ac38980268408822e86d77', 'ba12e39d2ec2578be732ef71fd811587889b5a96f3608bad55935b278f9ebd91'),
(312, 45, 32, 8.80, '{\"enrollment_id\":45,\"criterion_id\":32,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'ba12e39d2ec2578be732ef71fd811587889b5a96f3608bad55935b278f9ebd91', '9588fcd5cb48e8bc074390ec03ccb00d2249affa8acc60f9bbe50f04377a264d'),
(313, 45, 33, 7.40, '{\"enrollment_id\":45,\"criterion_id\":33,\"score\":7.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '9588fcd5cb48e8bc074390ec03ccb00d2249affa8acc60f9bbe50f04377a264d', '51c0ca254106a0b7672c97d0fb5b6d86d9c861e34c743dd218113371fc2d5535'),
(314, 45, 34, 6.20, '{\"enrollment_id\":45,\"criterion_id\":34,\"score\":6.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '51c0ca254106a0b7672c97d0fb5b6d86d9c861e34c743dd218113371fc2d5535', '1c5df0f741f8be1b1a7e0c9baca1017e78e8b7bcf6d62d904ea54815a03f5d60'),
(315, 45, 35, 6.70, '{\"enrollment_id\":45,\"criterion_id\":35,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '1c5df0f741f8be1b1a7e0c9baca1017e78e8b7bcf6d62d904ea54815a03f5d60', '11500f9c753d9a1780d44293a92f53290a74bba3033db41b4c101e22254d2828'),
(316, 46, 8, 8.40, '{\"enrollment_id\":46,\"criterion_id\":8,\"score\":8.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '11500f9c753d9a1780d44293a92f53290a74bba3033db41b4c101e22254d2828', 'c47582e21ceed79d0fb6ac76f0bf1de5b3452c0c402179ddb4246650c097091d'),
(317, 46, 9, 5.60, '{\"enrollment_id\":46,\"criterion_id\":9,\"score\":5.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'c47582e21ceed79d0fb6ac76f0bf1de5b3452c0c402179ddb4246650c097091d', 'b616e600d41a767c3d8c9e72dfbcc86555341ceb593e1a6442257f0da266c378'),
(318, 46, 10, 6.00, '{\"enrollment_id\":46,\"criterion_id\":10,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'b616e600d41a767c3d8c9e72dfbcc86555341ceb593e1a6442257f0da266c378', '2ceeee59a36dd12acbe7afee259ca9b203c2f5dcc634941435c6f07824f92939'),
(319, 46, 11, 8.70, '{\"enrollment_id\":46,\"criterion_id\":11,\"score\":8.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '2ceeee59a36dd12acbe7afee259ca9b203c2f5dcc634941435c6f07824f92939', 'ce8d9e1b047b613313d249636547fa34ddc05dd3d7248476fd52d61d936c0c58'),
(320, 46, 12, 7.10, '{\"enrollment_id\":46,\"criterion_id\":12,\"score\":7.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'ce8d9e1b047b613313d249636547fa34ddc05dd3d7248476fd52d61d936c0c58', '06c972ab2f112766b0620c73eebc1a68c7a9349abe8e8aa3b8e76605cac98994'),
(321, 46, 13, 9.10, '{\"enrollment_id\":46,\"criterion_id\":13,\"score\":9.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '06c972ab2f112766b0620c73eebc1a68c7a9349abe8e8aa3b8e76605cac98994', 'f9c66c0d26e9c5ffabfe2ba6fad5534bb3ba963f6632c08dd6a62cebc9373e7c'),
(322, 46, 14, 9.40, '{\"enrollment_id\":46,\"criterion_id\":14,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'f9c66c0d26e9c5ffabfe2ba6fad5534bb3ba963f6632c08dd6a62cebc9373e7c', '5f23334e1b4e22076a0ee6679fe8fad4f9d78cd9d3d09f0f760a07649b96f63b'),
(323, 47, 43, 9.50, '{\"enrollment_id\":47,\"criterion_id\":43,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '5f23334e1b4e22076a0ee6679fe8fad4f9d78cd9d3d09f0f760a07649b96f63b', 'f090774b897b8a2e2b8235893a534b7a6c1fa99c37d57558759e35eb4053ab95'),
(324, 47, 44, 7.60, '{\"enrollment_id\":47,\"criterion_id\":44,\"score\":7.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'f090774b897b8a2e2b8235893a534b7a6c1fa99c37d57558759e35eb4053ab95', '4125e7a254f806ab8f1176af46a5e688f085f4e5ed044035c4de2869c3819597'),
(325, 47, 45, 6.30, '{\"enrollment_id\":47,\"criterion_id\":45,\"score\":6.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '4125e7a254f806ab8f1176af46a5e688f085f4e5ed044035c4de2869c3819597', '874cc4bf44741312ad437da3296f2b5c4ba62f946656759a42169e048bd52f59'),
(326, 47, 46, 7.80, '{\"enrollment_id\":47,\"criterion_id\":46,\"score\":7.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '874cc4bf44741312ad437da3296f2b5c4ba62f946656759a42169e048bd52f59', '9260e5f96c575e7374b9ddb8d091cb138b72bd6a2f8e1225f9cc3272dba8561c'),
(327, 47, 47, 5.80, '{\"enrollment_id\":47,\"criterion_id\":47,\"score\":5.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '9260e5f96c575e7374b9ddb8d091cb138b72bd6a2f8e1225f9cc3272dba8561c', 'e448d1ac621f5bec245f10216d7d1681e124d51bac053d0d623ca244226566fe'),
(328, 47, 48, 9.20, '{\"enrollment_id\":47,\"criterion_id\":48,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'e448d1ac621f5bec245f10216d7d1681e124d51bac053d0d623ca244226566fe', '6f186d45716626f067b5c0d0f2eeacb689c573b5c7cb1d7cc5bef20bf26df85c'),
(329, 47, 49, 8.20, '{\"enrollment_id\":47,\"criterion_id\":49,\"score\":8.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '6f186d45716626f067b5c0d0f2eeacb689c573b5c7cb1d7cc5bef20bf26df85c', 'b5da5254f7df1b83b8f2a6e8daec68dd214edcb1db8e9e23c842166539d4950f'),
(330, 48, 1, 8.80, '{\"enrollment_id\":48,\"criterion_id\":1,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'b5da5254f7df1b83b8f2a6e8daec68dd214edcb1db8e9e23c842166539d4950f', '1122d4e50966c86d7ffa234fa67b660aac9b3ce91268945d714f5c62864914a3'),
(331, 48, 2, 5.20, '{\"enrollment_id\":48,\"criterion_id\":2,\"score\":5.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '1122d4e50966c86d7ffa234fa67b660aac9b3ce91268945d714f5c62864914a3', 'e11dd884e33e05c169507e5f3240a0ad952749908894c539e0dee24efd85b41f'),
(332, 48, 3, 7.60, '{\"enrollment_id\":48,\"criterion_id\":3,\"score\":7.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'e11dd884e33e05c169507e5f3240a0ad952749908894c539e0dee24efd85b41f', '5bba899eceb3f79abd46eb3c1a7370b2d97d2f9a9bac3a1128035739e7431ab9'),
(333, 48, 4, 5.50, '{\"enrollment_id\":48,\"criterion_id\":4,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '5bba899eceb3f79abd46eb3c1a7370b2d97d2f9a9bac3a1128035739e7431ab9', 'd115d447b673a4fa9237da400cb9da4bd17f7f5b69b850389baab69932d1d76e'),
(334, 48, 5, 6.00, '{\"enrollment_id\":48,\"criterion_id\":5,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'd115d447b673a4fa9237da400cb9da4bd17f7f5b69b850389baab69932d1d76e', 'bf1f9807fb8c181f59d2df2b22c2a8e206307ab5f86653918b9c21d7a38f9dd0'),
(335, 48, 6, 8.30, '{\"enrollment_id\":48,\"criterion_id\":6,\"score\":8.300000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'bf1f9807fb8c181f59d2df2b22c2a8e206307ab5f86653918b9c21d7a38f9dd0', '2d31f3b7c02eb2540fa924ec3d0bb79677ea91c5915f890dc3f1f87d635482d0'),
(336, 48, 7, 9.50, '{\"enrollment_id\":48,\"criterion_id\":7,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '2d31f3b7c02eb2540fa924ec3d0bb79677ea91c5915f890dc3f1f87d635482d0', '720753b919a129e0ec5f48b7873e0e7cce92b791078b2f9f5f73d292b8edaad8'),
(337, 49, 36, 6.90, '{\"enrollment_id\":49,\"criterion_id\":36,\"score\":6.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '720753b919a129e0ec5f48b7873e0e7cce92b791078b2f9f5f73d292b8edaad8', 'aadfd657d2c1e85c8e7d10707e4698e02588f458fdcbbaf42c877b8cc9e7f53b'),
(338, 49, 37, 9.20, '{\"enrollment_id\":49,\"criterion_id\":37,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'aadfd657d2c1e85c8e7d10707e4698e02588f458fdcbbaf42c877b8cc9e7f53b', 'a35b02b37349ea8984e54ffb29b92e387885d7cf62e745e8d93df6f07840b819'),
(339, 49, 38, 9.50, '{\"enrollment_id\":49,\"criterion_id\":38,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'a35b02b37349ea8984e54ffb29b92e387885d7cf62e745e8d93df6f07840b819', '81a2aa5e8108912fbb5fbd3e43be3887de9f6da7b20225431853cd99fa9c2679'),
(340, 49, 39, 7.00, '{\"enrollment_id\":49,\"criterion_id\":39,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '81a2aa5e8108912fbb5fbd3e43be3887de9f6da7b20225431853cd99fa9c2679', '5e1b44ce688c8245abca145c86077fb02eae27867d5158f0936ecf5a4e6a09c7'),
(341, 49, 40, 7.40, '{\"enrollment_id\":49,\"criterion_id\":40,\"score\":7.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '5e1b44ce688c8245abca145c86077fb02eae27867d5158f0936ecf5a4e6a09c7', '07b0b1f6368b29829b47992369a8b4a6f29ec1a1fddf6ec5cba198fc028d920a'),
(342, 49, 41, 7.30, '{\"enrollment_id\":49,\"criterion_id\":41,\"score\":7.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '07b0b1f6368b29829b47992369a8b4a6f29ec1a1fddf6ec5cba198fc028d920a', '5fab5f5dfe0e8a344f9f03305c6b61f98e628c5cd7cc80edfda7137aa10eb8f4'),
(343, 49, 42, 6.10, '{\"enrollment_id\":49,\"criterion_id\":42,\"score\":6.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '5fab5f5dfe0e8a344f9f03305c6b61f98e628c5cd7cc80edfda7137aa10eb8f4', '551bc8dab5829702f3569ab6cbb2f700fe44c6133a13801cbe58310fbdc57d08');
INSERT INTO `score_ledger` (`id`, `enrollment_id`, `criterion_id`, `score`, `data_snapshot`, `action`, `graded_by`, `timestamp`, `previous_hash`, `current_hash`) VALUES
(344, 50, 15, 6.70, '{\"enrollment_id\":50,\"criterion_id\":15,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '551bc8dab5829702f3569ab6cbb2f700fe44c6133a13801cbe58310fbdc57d08', 'f2183e36aa08b3b7613e3c175590f9aaebfaff43e7d19db682fab364294b6d97'),
(345, 50, 16, 5.80, '{\"enrollment_id\":50,\"criterion_id\":16,\"score\":5.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'f2183e36aa08b3b7613e3c175590f9aaebfaff43e7d19db682fab364294b6d97', '54dc2c2d6b27ece4abad2039dcaab4e726171fc1aa0d18a8994decf5249b9fa0'),
(346, 50, 17, 6.30, '{\"enrollment_id\":50,\"criterion_id\":17,\"score\":6.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '54dc2c2d6b27ece4abad2039dcaab4e726171fc1aa0d18a8994decf5249b9fa0', 'd75e6436dd7e94e0116174e8b778e38736ec71e9d23bb98d645f05e582454066'),
(347, 50, 18, 5.60, '{\"enrollment_id\":50,\"criterion_id\":18,\"score\":5.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'd75e6436dd7e94e0116174e8b778e38736ec71e9d23bb98d645f05e582454066', '15c8ec87e9b73b89be5c1a1c48a272360764ff15f158c24929d6ef859df002f1'),
(348, 50, 19, 7.00, '{\"enrollment_id\":50,\"criterion_id\":19,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '15c8ec87e9b73b89be5c1a1c48a272360764ff15f158c24929d6ef859df002f1', '988b7c7be6433477b26a8db1a36757246fbdf19df7864e120280ee10bf1d647a'),
(349, 50, 20, 9.50, '{\"enrollment_id\":50,\"criterion_id\":20,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '988b7c7be6433477b26a8db1a36757246fbdf19df7864e120280ee10bf1d647a', 'd120453e9e19894316414877c2a972a9b293df4da94155cb57e37554f0ad80a4'),
(350, 50, 21, 6.70, '{\"enrollment_id\":50,\"criterion_id\":21,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'd120453e9e19894316414877c2a972a9b293df4da94155cb57e37554f0ad80a4', '369b84bbc83c9e3e0c0251aee27e473e7be941198ecc0185800f9ab82ade9b6d'),
(351, 51, 22, 9.00, '{\"enrollment_id\":51,\"criterion_id\":22,\"score\":9,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '369b84bbc83c9e3e0c0251aee27e473e7be941198ecc0185800f9ab82ade9b6d', 'ddff0a74f4ba4582db02f60e6f48dc7047fdbba95a435792206307e888ab825c'),
(352, 51, 23, 7.20, '{\"enrollment_id\":51,\"criterion_id\":23,\"score\":7.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'ddff0a74f4ba4582db02f60e6f48dc7047fdbba95a435792206307e888ab825c', '6098dbd4ed2b085a7c56cde1324ab3c085f8bcde421cbecf74bd2c8c941fd2c0'),
(353, 51, 24, 6.90, '{\"enrollment_id\":51,\"criterion_id\":24,\"score\":6.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '6098dbd4ed2b085a7c56cde1324ab3c085f8bcde421cbecf74bd2c8c941fd2c0', '7d54fd6e5371a3c8a8880a4bb58bb8aa69896a06590b1efbe789704ee623894d'),
(354, 51, 25, 7.90, '{\"enrollment_id\":51,\"criterion_id\":25,\"score\":7.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '7d54fd6e5371a3c8a8880a4bb58bb8aa69896a06590b1efbe789704ee623894d', '7fc73c9f978811c6b6425d9e79d4908a6c712d3192edb5cae5d5313a63eb4c04'),
(355, 51, 26, 6.00, '{\"enrollment_id\":51,\"criterion_id\":26,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '7fc73c9f978811c6b6425d9e79d4908a6c712d3192edb5cae5d5313a63eb4c04', 'ea2bd5925099358d6c21a8af79289aedf18856d665dc250c88629eb8743b99d6'),
(356, 51, 27, 8.40, '{\"enrollment_id\":51,\"criterion_id\":27,\"score\":8.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'ea2bd5925099358d6c21a8af79289aedf18856d665dc250c88629eb8743b99d6', '76a6053efe4fb33bdbf7d85eba7762350bd35841fa6d1ee7e90349790305e5cb'),
(357, 51, 28, 9.40, '{\"enrollment_id\":51,\"criterion_id\":28,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '76a6053efe4fb33bdbf7d85eba7762350bd35841fa6d1ee7e90349790305e5cb', '122f73b16566430b89ef734ec530f36761b3e21cfde753018c91061fb35116f7'),
(358, 52, 29, 7.20, '{\"enrollment_id\":52,\"criterion_id\":29,\"score\":7.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '122f73b16566430b89ef734ec530f36761b3e21cfde753018c91061fb35116f7', '54488e859f1b734826a4ab17528f80ebcd74955f54162aaa6f257ac22945dc43'),
(359, 52, 30, 8.00, '{\"enrollment_id\":52,\"criterion_id\":30,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '54488e859f1b734826a4ab17528f80ebcd74955f54162aaa6f257ac22945dc43', '1c6b06628f20d9066bd71e0c20aa6612efa5a65cac89ee72bdb509cb37c2665f'),
(360, 52, 31, 9.50, '{\"enrollment_id\":52,\"criterion_id\":31,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '1c6b06628f20d9066bd71e0c20aa6612efa5a65cac89ee72bdb509cb37c2665f', 'a7ad90665ec6e0e3dd07150dc226f1b8e7ef7f3422a01ff198e735d712a5a3af'),
(361, 52, 32, 6.40, '{\"enrollment_id\":52,\"criterion_id\":32,\"score\":6.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'a7ad90665ec6e0e3dd07150dc226f1b8e7ef7f3422a01ff198e735d712a5a3af', '24e7ef80ce6a076cc29b5511d1c1b10ea450e5f68299cc40107a71857cdd127b'),
(362, 52, 33, 8.20, '{\"enrollment_id\":52,\"criterion_id\":33,\"score\":8.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '24e7ef80ce6a076cc29b5511d1c1b10ea450e5f68299cc40107a71857cdd127b', 'a695eb4ea2b76795bf2864ff364ed719650da2e16269b1ecf6cbf3d27983d71d'),
(363, 52, 34, 5.20, '{\"enrollment_id\":52,\"criterion_id\":34,\"score\":5.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'a695eb4ea2b76795bf2864ff364ed719650da2e16269b1ecf6cbf3d27983d71d', '4cc8da804f8340ede04516540c2454bbd03970285307606e01830e9ac86c0354'),
(364, 52, 35, 8.70, '{\"enrollment_id\":52,\"criterion_id\":35,\"score\":8.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '4cc8da804f8340ede04516540c2454bbd03970285307606e01830e9ac86c0354', '18e59b5a90d9ae3fddec2d53f946a54a312f587b2117b567563ba579a5fd9376'),
(365, 53, 8, 7.20, '{\"enrollment_id\":53,\"criterion_id\":8,\"score\":7.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '18e59b5a90d9ae3fddec2d53f946a54a312f587b2117b567563ba579a5fd9376', '16fbf36e41b9f5cd0221b4a3a74fc3b1de2c656906c1cb2daf4a07f23675ab78'),
(366, 53, 9, 7.30, '{\"enrollment_id\":53,\"criterion_id\":9,\"score\":7.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '16fbf36e41b9f5cd0221b4a3a74fc3b1de2c656906c1cb2daf4a07f23675ab78', '1d9531526fc014dce7eb946670e8b6569627b3c6766dfe0a6ee9a334e046bc02'),
(367, 53, 10, 9.50, '{\"enrollment_id\":53,\"criterion_id\":10,\"score\":9.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '1d9531526fc014dce7eb946670e8b6569627b3c6766dfe0a6ee9a334e046bc02', '5aad21f912a7671a0e3f089492094cd6a66f84d0a0720096633f320f3d75a829'),
(368, 53, 11, 6.60, '{\"enrollment_id\":53,\"criterion_id\":11,\"score\":6.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '5aad21f912a7671a0e3f089492094cd6a66f84d0a0720096633f320f3d75a829', '7ead9d6a8d089cb876bc16d9be49857cc04dac96ba743007100979ceca2fb186'),
(369, 53, 12, 5.50, '{\"enrollment_id\":53,\"criterion_id\":12,\"score\":5.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '7ead9d6a8d089cb876bc16d9be49857cc04dac96ba743007100979ceca2fb186', '764bfb118fcc0a1d809866b3831b475e4960ab87e766ad8af12a04ee5c97436d'),
(370, 53, 13, 8.60, '{\"enrollment_id\":53,\"criterion_id\":13,\"score\":8.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '764bfb118fcc0a1d809866b3831b475e4960ab87e766ad8af12a04ee5c97436d', 'ab831c413c9e96c8f81e3484161efefd1cde6823fecda770f4382298360c923a'),
(371, 53, 14, 9.40, '{\"enrollment_id\":53,\"criterion_id\":14,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'ab831c413c9e96c8f81e3484161efefd1cde6823fecda770f4382298360c923a', '663cac69463309dedcca86f67d23389636439ec8c9171e0719515465c391f9d1'),
(372, 54, 43, 6.20, '{\"enrollment_id\":54,\"criterion_id\":43,\"score\":6.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '663cac69463309dedcca86f67d23389636439ec8c9171e0719515465c391f9d1', 'c7175753b48018b1d8d1c11646c9f82482c5133269e1274a76ff686d1d107a63'),
(373, 54, 44, 5.30, '{\"enrollment_id\":54,\"criterion_id\":44,\"score\":5.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'c7175753b48018b1d8d1c11646c9f82482c5133269e1274a76ff686d1d107a63', '57039e5c8ae9adc3a06186c8762de63bb5cd41fc30360783d15650a02fde8f41'),
(374, 54, 45, 5.60, '{\"enrollment_id\":54,\"criterion_id\":45,\"score\":5.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '57039e5c8ae9adc3a06186c8762de63bb5cd41fc30360783d15650a02fde8f41', 'ab46426923ac577d06d55e40d00c0dc17a2c4064d5bc8b07245d369eb450ef02'),
(375, 54, 46, 6.30, '{\"enrollment_id\":54,\"criterion_id\":46,\"score\":6.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'ab46426923ac577d06d55e40d00c0dc17a2c4064d5bc8b07245d369eb450ef02', '0c0fea4566c0c927e3b91539e118b5944a371fb52b9c8be2f8ff55edf9a551a6'),
(376, 54, 47, 9.20, '{\"enrollment_id\":54,\"criterion_id\":47,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '0c0fea4566c0c927e3b91539e118b5944a371fb52b9c8be2f8ff55edf9a551a6', '70a51ecc6747526cff318580265e9b4f80f0c113c60810ebadf4eead65096ce9'),
(377, 54, 48, 8.00, '{\"enrollment_id\":54,\"criterion_id\":48,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '70a51ecc6747526cff318580265e9b4f80f0c113c60810ebadf4eead65096ce9', '99de34db53a878a596e7f0a421be7658ba64212b27e62f57b188b4ec18aea9b1'),
(378, 54, 49, 6.70, '{\"enrollment_id\":54,\"criterion_id\":49,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '99de34db53a878a596e7f0a421be7658ba64212b27e62f57b188b4ec18aea9b1', 'fac7fdbd3fedbc7cd15b006cff99ecaa1cf102afdc188898d5437b1a9de86cbc'),
(379, 55, 1, 6.70, '{\"enrollment_id\":55,\"criterion_id\":1,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'fac7fdbd3fedbc7cd15b006cff99ecaa1cf102afdc188898d5437b1a9de86cbc', '77216b56a52c1d126967d465e366effd231427cde31de7b43cb39de93af2afb7'),
(380, 55, 2, 5.60, '{\"enrollment_id\":55,\"criterion_id\":2,\"score\":5.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '77216b56a52c1d126967d465e366effd231427cde31de7b43cb39de93af2afb7', 'e117e330f481d67924939026c64dc8cf9972c77eeb95931c39a52e08f5cefcf7'),
(381, 55, 3, 7.20, '{\"enrollment_id\":55,\"criterion_id\":3,\"score\":7.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'e117e330f481d67924939026c64dc8cf9972c77eeb95931c39a52e08f5cefcf7', '891975dfe944e8363cf4659c965e02398c853b0b6a6fd146d46d3338a5cf0014'),
(382, 55, 4, 8.80, '{\"enrollment_id\":55,\"criterion_id\":4,\"score\":8.800000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '891975dfe944e8363cf4659c965e02398c853b0b6a6fd146d46d3338a5cf0014', '8b5598f7fd62d6237d80ccef80d9c2c33915e99caa5d9ce54d484f56b3e6cfa7'),
(383, 55, 5, 6.40, '{\"enrollment_id\":55,\"criterion_id\":5,\"score\":6.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '8b5598f7fd62d6237d80ccef80d9c2c33915e99caa5d9ce54d484f56b3e6cfa7', '0b77b77369f7e4cf66d1e2f46671f6ca7ef456b93e5df6f71f5225fbcda40759'),
(384, 55, 6, 8.40, '{\"enrollment_id\":55,\"criterion_id\":6,\"score\":8.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '0b77b77369f7e4cf66d1e2f46671f6ca7ef456b93e5df6f71f5225fbcda40759', '337c86488255d89fb21f5f5dcec640e589cbb3bf276bca637faae8dc46f554d1'),
(385, 55, 7, 8.00, '{\"enrollment_id\":55,\"criterion_id\":7,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '337c86488255d89fb21f5f5dcec640e589cbb3bf276bca637faae8dc46f554d1', '5a605a003ffd4c2670ad5a8560efd3555f6320f259806e46d009da61cf2dd298'),
(386, 56, 36, 8.30, '{\"enrollment_id\":56,\"criterion_id\":36,\"score\":8.300000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '5a605a003ffd4c2670ad5a8560efd3555f6320f259806e46d009da61cf2dd298', 'db2a07b02b018a5e968a646380f24346fd7793d5d67514624f8010b1a5140e46'),
(387, 56, 37, 5.40, '{\"enrollment_id\":56,\"criterion_id\":37,\"score\":5.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'db2a07b02b018a5e968a646380f24346fd7793d5d67514624f8010b1a5140e46', '2ddfea86669ae3ce745633b1b21a1cb7b81b4ceb6ab77292e9d4a01687000cf8'),
(388, 56, 38, 5.00, '{\"enrollment_id\":56,\"criterion_id\":38,\"score\":5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '2ddfea86669ae3ce745633b1b21a1cb7b81b4ceb6ab77292e9d4a01687000cf8', '04fa06ba15eb251fd49583f1386b8156d17c4f3b83aa36457bd5fa9e06448570'),
(389, 56, 39, 5.90, '{\"enrollment_id\":56,\"criterion_id\":39,\"score\":5.9000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '04fa06ba15eb251fd49583f1386b8156d17c4f3b83aa36457bd5fa9e06448570', '2d4687322d5fc7bb94aae42e44f2664b52199c11dc11ec5155325530b4b73ae1'),
(390, 56, 40, 6.70, '{\"enrollment_id\":56,\"criterion_id\":40,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '2d4687322d5fc7bb94aae42e44f2664b52199c11dc11ec5155325530b4b73ae1', '151ff060ae7d6eb4add3fef6b6c205142d76848dd6a365b3a3ae592ca232a4f8'),
(391, 56, 41, 8.00, '{\"enrollment_id\":56,\"criterion_id\":41,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '151ff060ae7d6eb4add3fef6b6c205142d76848dd6a365b3a3ae592ca232a4f8', '90d6bad5096101ee8ce0beb4a2ad85d902136da748b3fd92a7b9f973daeb7450'),
(392, 56, 42, 9.10, '{\"enrollment_id\":56,\"criterion_id\":42,\"score\":9.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '90d6bad5096101ee8ce0beb4a2ad85d902136da748b3fd92a7b9f973daeb7450', 'e8f28b8b570e8130e2c06d748a739ce757b46c3bbd81e4737559a752b83acf2b'),
(393, 57, 15, 9.40, '{\"enrollment_id\":57,\"criterion_id\":15,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'e8f28b8b570e8130e2c06d748a739ce757b46c3bbd81e4737559a752b83acf2b', '239ae08923d0c56c93e075489754540bbee43d83aa4455540cfab2be6eec1b18'),
(394, 57, 16, 6.00, '{\"enrollment_id\":57,\"criterion_id\":16,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '239ae08923d0c56c93e075489754540bbee43d83aa4455540cfab2be6eec1b18', '8839ad5a35b1e2e93cb4d201d48cad2b8bfe8247c6f6afa44c49ffecf380a4ad'),
(395, 57, 17, 7.00, '{\"enrollment_id\":57,\"criterion_id\":17,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '8839ad5a35b1e2e93cb4d201d48cad2b8bfe8247c6f6afa44c49ffecf380a4ad', '236993b28f2b9a558937c035186ca9f30e1ae1a7a79c19dd72ad642489fac644'),
(396, 57, 18, 6.70, '{\"enrollment_id\":57,\"criterion_id\":18,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '236993b28f2b9a558937c035186ca9f30e1ae1a7a79c19dd72ad642489fac644', 'd82e4ba16329b2f33b6f848ff23215ab69197b144be9adf23801dacd5f73e85c'),
(397, 57, 19, 7.00, '{\"enrollment_id\":57,\"criterion_id\":19,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'd82e4ba16329b2f33b6f848ff23215ab69197b144be9adf23801dacd5f73e85c', '253b5221ca29a2786f600e84f93244b55192cc0594ec49da973ec7caf092c471'),
(398, 57, 20, 5.40, '{\"enrollment_id\":57,\"criterion_id\":20,\"score\":5.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '253b5221ca29a2786f600e84f93244b55192cc0594ec49da973ec7caf092c471', 'ed002bfd4a54a699a4de122ef00741c385d718a99948490f5fb81b7ef5032cad'),
(399, 57, 21, 6.50, '{\"enrollment_id\":57,\"criterion_id\":21,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'ed002bfd4a54a699a4de122ef00741c385d718a99948490f5fb81b7ef5032cad', '8eb923088654be2a676aa7594203cc59e0f5daa8f7adce6e6a24cd9f1f21f29d'),
(400, 58, 8, 9.20, '{\"enrollment_id\":58,\"criterion_id\":8,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '8eb923088654be2a676aa7594203cc59e0f5daa8f7adce6e6a24cd9f1f21f29d', 'a05146c3058f681972ac72bb01fafb4ed28e0503e158866f57db41225a2415e5'),
(401, 58, 9, 7.10, '{\"enrollment_id\":58,\"criterion_id\":9,\"score\":7.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'a05146c3058f681972ac72bb01fafb4ed28e0503e158866f57db41225a2415e5', '4eee082fa518c983ed037811aed179511bb41307339d2e7c9c3f236efd138842'),
(402, 58, 10, 6.70, '{\"enrollment_id\":58,\"criterion_id\":10,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '4eee082fa518c983ed037811aed179511bb41307339d2e7c9c3f236efd138842', 'd92765e05c26bfe8634eaa0fbd1340172fd5b3bd90dd21599e8ed763f87cc4b5'),
(403, 58, 11, 5.30, '{\"enrollment_id\":58,\"criterion_id\":11,\"score\":5.29999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'd92765e05c26bfe8634eaa0fbd1340172fd5b3bd90dd21599e8ed763f87cc4b5', '1872fdb9174884c00876e21911811aed03230bbd6f59201fec56f9ac68177f45'),
(404, 58, 12, 7.00, '{\"enrollment_id\":58,\"criterion_id\":12,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '1872fdb9174884c00876e21911811aed03230bbd6f59201fec56f9ac68177f45', 'c99c5f46c91f0f379f55a397d051db3e46a8e1934a1e064f7ea148766d7452ff'),
(405, 58, 13, 6.20, '{\"enrollment_id\":58,\"criterion_id\":13,\"score\":6.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'c99c5f46c91f0f379f55a397d051db3e46a8e1934a1e064f7ea148766d7452ff', 'f54fa81270ffbf72b3704f8cea99499a11ad5463ea9b2d3292062dca0a19f6d0'),
(406, 58, 14, 9.40, '{\"enrollment_id\":58,\"criterion_id\":14,\"score\":9.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'f54fa81270ffbf72b3704f8cea99499a11ad5463ea9b2d3292062dca0a19f6d0', '95d45401dae4fd8fb95f104b78e5c5fc3dee1624101bd347379ea1a9f35b7fdb'),
(407, 59, 1, 7.00, '{\"enrollment_id\":59,\"criterion_id\":1,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '95d45401dae4fd8fb95f104b78e5c5fc3dee1624101bd347379ea1a9f35b7fdb', '4c66f7e9e7930a7243ac9dcf426de157d17dc8b7b26ec8c79627d2e329141073'),
(408, 59, 2, 6.00, '{\"enrollment_id\":59,\"criterion_id\":2,\"score\":6,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '4c66f7e9e7930a7243ac9dcf426de157d17dc8b7b26ec8c79627d2e329141073', '088380e05601e04fe12ac9ede0d88214895c6508444248a90206768f26f10e9d'),
(409, 59, 3, 7.00, '{\"enrollment_id\":59,\"criterion_id\":3,\"score\":7,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '088380e05601e04fe12ac9ede0d88214895c6508444248a90206768f26f10e9d', '52b02b61efcb50a1a6601948706f931eaa5822d70fed7874d285e65313fd7573'),
(410, 59, 4, 8.50, '{\"enrollment_id\":59,\"criterion_id\":4,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '52b02b61efcb50a1a6601948706f931eaa5822d70fed7874d285e65313fd7573', '87b9975dbe4f96e9b245375fab0ecfda0ced919d83a838bd5fb608a8182f0ca5'),
(411, 59, 5, 8.60, '{\"enrollment_id\":59,\"criterion_id\":5,\"score\":8.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '87b9975dbe4f96e9b245375fab0ecfda0ced919d83a838bd5fb608a8182f0ca5', '6213d1dd73be5c4b022ac3fa5bcff0b4acba1b3278eff6c4e28a1afb29d05f73'),
(412, 59, 6, 8.40, '{\"enrollment_id\":59,\"criterion_id\":6,\"score\":8.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '6213d1dd73be5c4b022ac3fa5bcff0b4acba1b3278eff6c4e28a1afb29d05f73', 'd4988c1d0ff2562c07784502f6f4236d5103bcefbc55be7c2572202c2ca87045'),
(413, 59, 7, 7.50, '{\"enrollment_id\":59,\"criterion_id\":7,\"score\":7.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'd4988c1d0ff2562c07784502f6f4236d5103bcefbc55be7c2572202c2ca87045', 'dfa6bbb38e3051f02af84c9289fd6fb88a9588b4bbb9807b6b93f5fdbbd00921'),
(414, 60, 15, 9.20, '{\"enrollment_id\":60,\"criterion_id\":15,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'dfa6bbb38e3051f02af84c9289fd6fb88a9588b4bbb9807b6b93f5fdbbd00921', 'c9b88b6ee75552cc84b302c9a7d54930da3000e2a0f41a5e9b4a49bd15114ed8'),
(415, 60, 16, 8.20, '{\"enrollment_id\":60,\"criterion_id\":16,\"score\":8.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'c9b88b6ee75552cc84b302c9a7d54930da3000e2a0f41a5e9b4a49bd15114ed8', '7d8afca1365f2a3814641ff37db93e433fcf691b4505d09a1f6321df3e5640e0'),
(416, 60, 17, 6.10, '{\"enrollment_id\":60,\"criterion_id\":17,\"score\":6.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '7d8afca1365f2a3814641ff37db93e433fcf691b4505d09a1f6321df3e5640e0', 'c8c8b22c0e0171a1ee9abfa2e88fc2ada3088ffae6763a07c03c2a13f9ef9f37'),
(417, 60, 18, 6.70, '{\"enrollment_id\":60,\"criterion_id\":18,\"score\":6.70000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'c8c8b22c0e0171a1ee9abfa2e88fc2ada3088ffae6763a07c03c2a13f9ef9f37', '575bb2747308847713ea65b554e226489f5829364a45962625db8c7769e3f741'),
(418, 60, 19, 7.60, '{\"enrollment_id\":60,\"criterion_id\":19,\"score\":7.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '575bb2747308847713ea65b554e226489f5829364a45962625db8c7769e3f741', '83f1e989681da5ca8eb191332d16720aeb6442d70c88a78a38af9cfe10b1b1a7'),
(419, 60, 20, 6.50, '{\"enrollment_id\":60,\"criterion_id\":20,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', '83f1e989681da5ca8eb191332d16720aeb6442d70c88a78a38af9cfe10b1b1a7', 'e6ae1be9e0ba5a930662c4bed65afa0e42ccd5d56200bfae8df9b3890a2ad08d'),
(420, 60, 21, 6.60, '{\"enrollment_id\":60,\"criterion_id\":21,\"score\":6.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":7,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 7, '2026-06-19 03:16:36', 'e6ae1be9e0ba5a930662c4bed65afa0e42ccd5d56200bfae8df9b3890a2ad08d', '6c6f38f6df9867e585e7e375b4ee3ba1338d17ace4b4bb37ca6e54a19357db82'),
(421, 61, 8, 8.50, '{\"enrollment_id\":61,\"criterion_id\":8,\"score\":8.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '6c6f38f6df9867e585e7e375b4ee3ba1338d17ace4b4bb37ca6e54a19357db82', '3e2968b3b01987d4acd543fe972c643be2786cd7859057b0d38e9974b1f4597e'),
(422, 61, 9, 8.30, '{\"enrollment_id\":61,\"criterion_id\":9,\"score\":8.300000000000000710542735760100185871124267578125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '3e2968b3b01987d4acd543fe972c643be2786cd7859057b0d38e9974b1f4597e', 'dfddef0ef65daeedfedf8d059e263c989099b72060d33db4a983100a3a77f460'),
(423, 61, 10, 6.10, '{\"enrollment_id\":61,\"criterion_id\":10,\"score\":6.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'dfddef0ef65daeedfedf8d059e263c989099b72060d33db4a983100a3a77f460', '7a946eff22e278d2fb5f36924324cf5526750944eb095907e6b5b8106c9b1ffb'),
(424, 61, 11, 5.60, '{\"enrollment_id\":61,\"criterion_id\":11,\"score\":5.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '7a946eff22e278d2fb5f36924324cf5526750944eb095907e6b5b8106c9b1ffb', 'cf9e36e49323f900ad183e5ccf1ce0d403ed7601a4ba41240a56e66184062daa'),
(425, 61, 12, 6.50, '{\"enrollment_id\":61,\"criterion_id\":12,\"score\":6.5,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'cf9e36e49323f900ad183e5ccf1ce0d403ed7601a4ba41240a56e66184062daa', 'd3b56ef2c6172c9e782a90928d0c8c4b6a35cb7897079fd6fbbf68a416cf8acb'),
(426, 61, 13, 9.20, '{\"enrollment_id\":61,\"criterion_id\":13,\"score\":9.199999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', 'd3b56ef2c6172c9e782a90928d0c8c4b6a35cb7897079fd6fbbf68a416cf8acb', '82e00e741fd5f03ac624ff9636df19fceac32c430c77584ea67154eb6cc37c41'),
(427, 61, 14, 8.70, '{\"enrollment_id\":61,\"criterion_id\":14,\"score\":8.699999999999999289457264239899814128875732421875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":3,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 3, '2026-06-19 03:16:36', '82e00e741fd5f03ac624ff9636df19fceac32c430c77584ea67154eb6cc37c41', '463eaef8e5fb84d17b7ddfb5da148e19a5fb0e7ddf821666d8f62f1afb45ae1c'),
(428, 62, 1, 5.20, '{\"enrollment_id\":62,\"criterion_id\":1,\"score\":5.20000000000000017763568394002504646778106689453125,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '463eaef8e5fb84d17b7ddfb5da148e19a5fb0e7ddf821666d8f62f1afb45ae1c', 'aede002ca61427cfb872c74464b384d0d0c6d9a49f9ad8d7eb9b2684f95ac841'),
(429, 62, 2, 8.40, '{\"enrollment_id\":62,\"criterion_id\":2,\"score\":8.4000000000000003552713678800500929355621337890625,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', 'aede002ca61427cfb872c74464b384d0d0c6d9a49f9ad8d7eb9b2684f95ac841', '07ad1f9b32e98c8d233f2e9082fa164b427d13f43a196333595808eb79dd26e9'),
(430, 62, 3, 6.80, '{\"enrollment_id\":62,\"criterion_id\":3,\"score\":6.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '07ad1f9b32e98c8d233f2e9082fa164b427d13f43a196333595808eb79dd26e9', '6e616d34386f92df92ba85dcf8f55b59b331294aeb2151081cafbd806a111a98'),
(431, 62, 4, 8.60, '{\"enrollment_id\":62,\"criterion_id\":4,\"score\":8.5999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '6e616d34386f92df92ba85dcf8f55b59b331294aeb2151081cafbd806a111a98', '05c01b2ca6eed7a6f1f70d1212c53778920da06b2bbe4aac8706bfe39e772970'),
(432, 62, 5, 7.10, '{\"enrollment_id\":62,\"criterion_id\":5,\"score\":7.0999999999999996447286321199499070644378662109375,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '05c01b2ca6eed7a6f1f70d1212c53778920da06b2bbe4aac8706bfe39e772970', '227c59eaa1ea82bf39a06ec3aa0c46ce0559b0ca448fa1dca2494c52ffa3b834'),
(433, 62, 6, 7.80, '{\"enrollment_id\":62,\"criterion_id\":6,\"score\":7.79999999999999982236431605997495353221893310546875,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '227c59eaa1ea82bf39a06ec3aa0c46ce0559b0ca448fa1dca2494c52ffa3b834', '5ee8b38dc2c286d06eb7ff09d30b61c175fed300e1f48fc5d921c04662fcf8e5'),
(434, 62, 7, 8.00, '{\"enrollment_id\":62,\"criterion_id\":7,\"score\":8,\"previous_score\":null,\"action\":\"INSERT\",\"graded_by\":2,\"approved_by\":null,\"change_request\":null,\"timestamp\":\"2026-06-19 10:16:36\"}', 'INSERT', 2, '2026-06-19 03:16:36', '5ee8b38dc2c286d06eb7ff09d30b61c175fed300e1f48fc5d921c04662fcf8e5', '61c0c26ddc5e661e8d85b687362cf04a58c4a6635e54685c393ed139cd257f73'),
(435, 56, 40, 8.00, '{\"enrollment_id\":56,\"criterion_id\":40,\"score\":8,\"previous_score\":6.70000000000000017763568394002504646778106689453125,\"action\":\"UPDATE\",\"graded_by\":7,\"approved_by\":1,\"change_request\":2,\"timestamp\":\"2026-06-19 05:27:39\"}', 'UPDATE', 7, '2026-06-19 03:27:39', '61c0c26ddc5e661e8d85b687362cf04a58c4a6635e54685c393ed139cd257f73', 'd642eb4411d5daa4cebd18641ae3e3b90e5748be0cc01f2995c586741c04d3f1'),
(436, 59, 1, 8.00, '{\"enrollment_id\":59,\"criterion_id\":1,\"score\":8,\"previous_score\":7,\"action\":\"UPDATE\",\"graded_by\":2,\"approved_by\":1,\"change_request\":3,\"timestamp\":\"2026-06-19 10:34:59\"}', 'UPDATE', 2, '2026-06-19 08:34:59', 'd642eb4411d5daa4cebd18641ae3e3b90e5748be0cc01f2995c586741c04d3f1', 'a8e1e9edc8b39fd2274e1439723673c8e3c117459a420693adb57666fac8a74f');

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
(1, 4, 3, '2024-1', '2026-06-19 03:16:36'),
(2, 4, 4, '2024-1', '2026-06-19 03:16:36'),
(3, 4, 5, '2024-1', '2026-06-19 03:16:36'),
(4, 4, 8, '2024-1', '2026-06-19 03:16:36'),
(5, 4, 9, '2024-1', '2026-06-19 03:16:36'),
(6, 4, 10, '2024-1', '2026-06-19 03:16:36'),
(7, 4, 2, '2024-2', '2026-06-19 03:16:36'),
(8, 4, 7, '2024-2', '2026-06-19 03:16:36'),
(9, 4, 11, '2024-2', '2026-06-19 03:16:36'),
(10, 4, 12, '2024-2', '2026-06-19 03:16:36'),
(11, 4, 13, '2024-2', '2026-06-19 03:16:36'),
(12, 4, 1, '2025-1', '2026-06-19 03:16:36'),
(13, 4, 6, '2025-1', '2026-06-19 03:16:36'),
(14, 4, 14, '2025-1', '2026-06-19 03:16:36'),
(15, 4, 15, '2025-1', '2026-06-19 03:16:36'),
(16, 4, 16, '2025-1', '2026-06-19 03:16:36'),
(17, 5, 3, '2024-1', '2026-06-19 03:16:36'),
(18, 5, 4, '2024-1', '2026-06-19 03:16:36'),
(19, 5, 5, '2024-1', '2026-06-19 03:16:36'),
(20, 5, 8, '2024-1', '2026-06-19 03:16:36'),
(21, 5, 9, '2024-1', '2026-06-19 03:16:36'),
(22, 5, 10, '2024-1', '2026-06-19 03:16:36'),
(23, 5, 2, '2024-2', '2026-06-19 03:16:36'),
(24, 5, 7, '2024-2', '2026-06-19 03:16:36'),
(25, 5, 11, '2024-2', '2026-06-19 03:16:36'),
(26, 5, 12, '2024-2', '2026-06-19 03:16:36'),
(27, 5, 13, '2024-2', '2026-06-19 03:16:36'),
(28, 5, 1, '2025-1', '2026-06-19 03:16:36'),
(29, 5, 6, '2025-1', '2026-06-19 03:16:36'),
(30, 5, 14, '2025-1', '2026-06-19 03:16:36'),
(31, 5, 15, '2025-1', '2026-06-19 03:16:36'),
(32, 5, 16, '2025-1', '2026-06-19 03:16:36'),
(33, 6, 3, '2024-1', '2026-06-19 03:16:36'),
(34, 6, 4, '2024-1', '2026-06-19 03:16:36'),
(35, 6, 5, '2024-1', '2026-06-19 03:16:36'),
(36, 6, 8, '2024-1', '2026-06-19 03:16:36'),
(37, 6, 2, '2024-2', '2026-06-19 03:16:36'),
(38, 6, 7, '2024-2', '2026-06-19 03:16:36'),
(39, 6, 11, '2024-2', '2026-06-19 03:16:36'),
(40, 6, 1, '2025-1', '2026-06-19 03:16:36'),
(41, 6, 6, '2025-1', '2026-06-19 03:16:36'),
(42, 6, 14, '2025-1', '2026-06-19 03:16:36'),
(43, 8, 3, '2024-1', '2026-06-19 03:16:36'),
(44, 8, 4, '2024-1', '2026-06-19 03:16:36'),
(45, 8, 5, '2024-1', '2026-06-19 03:16:36'),
(46, 8, 2, '2024-2', '2026-06-19 03:16:36'),
(47, 8, 7, '2024-2', '2026-06-19 03:16:36'),
(48, 8, 1, '2025-1', '2026-06-19 03:16:36'),
(49, 8, 6, '2025-1', '2026-06-19 03:16:36'),
(50, 9, 3, '2024-1', '2026-06-19 03:16:36'),
(51, 9, 4, '2024-1', '2026-06-19 03:16:36'),
(52, 9, 5, '2024-1', '2026-06-19 03:16:36'),
(53, 9, 2, '2024-2', '2026-06-19 03:16:36'),
(54, 9, 7, '2024-2', '2026-06-19 03:16:36'),
(55, 9, 1, '2025-1', '2026-06-19 03:16:36'),
(56, 9, 6, '2025-1', '2026-06-19 03:16:36'),
(57, 10, 3, '2024-1', '2026-06-19 03:16:36'),
(58, 10, 2, '2024-2', '2026-06-19 03:16:36'),
(59, 10, 1, '2025-1', '2026-06-19 03:16:36'),
(60, 11, 3, '2024-1', '2026-06-19 03:16:36'),
(61, 11, 2, '2024-2', '2026-06-19 03:16:36'),
(62, 11, 1, '2025-1', '2026-06-19 03:16:36');

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
(1, 1, 15, 9.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(2, 1, 16, 10.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(3, 1, 17, 8.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(4, 1, 18, 9.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(5, 1, 19, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(6, 1, 20, 7.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(7, 1, 21, 9.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(8, 2, 22, 9.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(9, 2, 23, 7.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(10, 2, 24, 10.00, 7, '2026-06-19 03:16:36', '2026-06-21 04:44:22'),
(11, 2, 25, 8.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(12, 2, 26, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(13, 2, 27, 8.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(14, 2, 28, 9.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(15, 3, 29, 8.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(16, 3, 30, 7.90, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(17, 3, 31, 7.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(18, 3, 32, 9.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(19, 3, 33, 8.10, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(20, 3, 34, 7.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(21, 3, 35, 7.50, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(22, 4, 50, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(23, 4, 51, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(24, 4, 52, 8.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(25, 4, 53, 8.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(26, 4, 54, 9.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(27, 4, 55, 9.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(28, 4, 56, 7.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(29, 5, 57, 9.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(30, 5, 58, 7.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(31, 5, 59, 8.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(32, 5, 60, 8.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(33, 5, 61, 9.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(34, 5, 62, 9.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(35, 5, 63, 7.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(36, 6, 64, 7.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(37, 6, 65, 8.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(38, 6, 66, 9.00, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(39, 6, 67, 9.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(40, 6, 68, 9.50, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(41, 6, 69, 8.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(42, 6, 70, 9.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(43, 7, 8, 7.80, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(44, 7, 9, 7.70, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(45, 7, 10, 9.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(46, 7, 11, 9.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(47, 7, 12, 9.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(48, 7, 13, 7.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(49, 7, 14, 8.30, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(50, 8, 43, 8.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(51, 8, 44, 7.70, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(52, 8, 45, 9.80, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(53, 8, 46, 9.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(54, 8, 47, 9.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(55, 8, 48, 7.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(56, 8, 49, 8.50, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(57, 9, 71, 8.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(58, 9, 72, 9.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(59, 9, 73, 7.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(60, 9, 74, 9.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(61, 9, 75, 9.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(62, 9, 76, 8.10, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(63, 9, 77, 9.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(64, 10, 78, 8.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(65, 10, 79, 9.90, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(66, 10, 80, 8.30, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(67, 10, 81, 7.50, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(68, 10, 82, 7.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(69, 10, 83, 7.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(70, 10, 84, 8.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(71, 11, 85, 9.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(72, 11, 86, 7.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(73, 11, 87, 8.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(74, 11, 88, 9.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(75, 11, 89, 9.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(76, 11, 90, 9.10, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(77, 11, 91, 9.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(78, 12, 1, 8.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(79, 12, 2, 10.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(80, 12, 3, 8.40, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(81, 12, 4, 9.10, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(82, 12, 5, 8.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(83, 12, 6, 9.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(84, 12, 7, 9.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(85, 13, 36, 8.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(86, 13, 37, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(87, 13, 38, 10.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(88, 13, 39, 7.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(89, 13, 40, 8.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(90, 13, 41, 9.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(91, 13, 42, 9.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(92, 14, 92, 8.40, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(93, 14, 93, 8.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(94, 14, 94, 9.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(95, 14, 95, 7.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(96, 14, 96, 8.10, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(97, 14, 97, 8.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(98, 14, 98, 9.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(99, 15, 99, 8.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(100, 15, 100, 9.80, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(101, 15, 101, 7.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(102, 15, 102, 8.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(103, 15, 103, 9.10, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(104, 15, 104, 10.00, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(105, 15, 105, 9.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(106, 16, 106, 9.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(107, 16, 107, 9.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(108, 16, 108, 9.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(109, 16, 109, 8.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(110, 16, 110, 9.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(111, 16, 111, 10.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(112, 16, 112, 8.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(113, 17, 15, 7.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(114, 17, 16, 6.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(115, 17, 17, 7.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(116, 17, 18, 6.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(117, 17, 19, 6.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(118, 17, 20, 7.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(119, 17, 21, 6.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(120, 18, 22, 6.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(121, 18, 23, 7.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(122, 18, 24, 6.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(123, 18, 25, 7.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(124, 18, 26, 7.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(125, 18, 27, 6.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(126, 18, 28, 5.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(127, 19, 29, 5.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(128, 19, 30, 6.30, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(129, 19, 31, 6.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(130, 19, 32, 7.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(131, 19, 33, 5.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(132, 19, 34, 8.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(133, 19, 35, 5.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(134, 20, 50, 5.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(135, 20, 51, 6.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(136, 20, 52, 6.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(137, 20, 53, 7.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(138, 20, 54, 5.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(139, 20, 55, 6.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(140, 20, 56, 7.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(141, 21, 57, 6.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(142, 21, 58, 6.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(143, 21, 59, 5.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(144, 21, 60, 6.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(145, 21, 61, 5.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(146, 21, 62, 5.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(147, 21, 63, 6.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(148, 22, 64, 7.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(149, 22, 65, 6.80, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(150, 22, 66, 8.00, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(151, 22, 67, 5.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(152, 22, 68, 7.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(153, 22, 69, 6.50, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(154, 22, 70, 6.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(155, 23, 8, 6.00, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(156, 23, 9, 7.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(157, 23, 10, 6.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(158, 23, 11, 6.80, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(159, 23, 12, 7.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(160, 23, 13, 5.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(161, 23, 14, 7.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(162, 24, 43, 5.50, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(163, 24, 44, 5.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(164, 24, 45, 7.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(165, 24, 46, 6.00, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(166, 24, 47, 7.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(167, 24, 48, 5.50, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(168, 24, 49, 5.70, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(169, 25, 71, 6.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(170, 25, 72, 5.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(171, 25, 73, 7.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(172, 25, 74, 7.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(173, 25, 75, 7.10, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(174, 25, 76, 6.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(175, 25, 77, 7.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(176, 26, 78, 5.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(177, 26, 79, 6.30, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(178, 26, 80, 7.90, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(179, 26, 81, 7.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(180, 26, 82, 6.50, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(181, 26, 83, 7.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(182, 26, 84, 5.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(183, 27, 85, 6.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(184, 27, 86, 6.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(185, 27, 87, 5.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(186, 27, 88, 6.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(187, 27, 89, 5.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(188, 27, 90, 5.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(189, 27, 91, 7.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(190, 28, 1, 7.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(191, 28, 2, 5.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(192, 28, 3, 7.90, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(193, 28, 4, 5.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(194, 28, 5, 7.90, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(195, 28, 6, 6.40, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(196, 28, 7, 5.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(197, 29, 36, 7.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(198, 29, 37, 6.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(199, 29, 38, 7.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(200, 29, 39, 8.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(201, 29, 40, 6.10, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(202, 29, 41, 6.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(203, 29, 42, 7.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(204, 30, 92, 7.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(205, 30, 93, 7.50, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(206, 30, 94, 7.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(207, 30, 95, 5.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(208, 30, 96, 5.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(209, 30, 97, 7.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(210, 30, 98, 8.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(211, 31, 99, 7.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(212, 31, 100, 7.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(213, 31, 101, 6.90, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(214, 31, 102, 6.70, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(215, 31, 103, 6.10, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(216, 31, 104, 7.50, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(217, 31, 105, 7.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(218, 32, 106, 8.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(219, 32, 107, 6.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(220, 32, 108, 5.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(221, 32, 109, 6.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(222, 32, 110, 6.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(223, 32, 111, 6.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(224, 32, 112, 7.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(225, 33, 15, 9.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(226, 33, 16, 9.10, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(227, 33, 17, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(228, 33, 18, 9.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(229, 33, 19, 9.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(230, 33, 20, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(231, 33, 21, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(232, 34, 22, 9.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(233, 34, 23, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(234, 34, 24, 9.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(235, 34, 25, 9.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(236, 34, 26, 8.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(237, 34, 27, 8.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(238, 34, 28, 9.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(239, 35, 29, 9.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(240, 35, 30, 8.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(241, 35, 31, 9.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(242, 35, 32, 9.40, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(243, 35, 33, 8.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(244, 35, 34, 8.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(245, 35, 35, 9.30, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(246, 36, 50, 8.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(247, 36, 51, 9.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(248, 36, 52, 8.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(249, 36, 53, 9.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(250, 36, 54, 10.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(251, 36, 55, 9.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(252, 36, 56, 8.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(253, 37, 8, 9.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(254, 37, 9, 9.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(255, 37, 10, 8.80, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(256, 37, 11, 8.80, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(257, 37, 12, 8.80, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(258, 37, 13, 9.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(259, 37, 14, 8.70, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(260, 38, 43, 9.70, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(261, 38, 44, 9.30, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(262, 38, 45, 9.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(263, 38, 46, 8.80, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(264, 38, 47, 8.70, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(265, 38, 48, 9.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(266, 38, 49, 9.50, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(267, 39, 71, 8.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(268, 39, 72, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(269, 39, 73, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(270, 39, 74, 9.10, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(271, 39, 75, 9.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(272, 39, 76, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(273, 39, 77, 9.10, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(274, 40, 1, 9.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(275, 40, 2, 9.50, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(276, 40, 3, 9.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(277, 40, 4, 9.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(278, 40, 5, 8.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(279, 40, 6, 9.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(280, 40, 7, 9.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(281, 41, 36, 9.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(282, 41, 37, 9.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(283, 41, 38, 9.10, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(284, 41, 39, 10.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(285, 41, 40, 8.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(286, 41, 41, 8.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(287, 41, 42, 8.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(288, 42, 92, 9.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(289, 42, 93, 8.90, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(290, 42, 94, 9.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(291, 42, 95, 8.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(292, 42, 96, 9.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(293, 42, 97, 9.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(294, 42, 98, 9.40, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(295, 43, 15, 5.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(296, 43, 16, 6.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(297, 43, 17, 5.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(298, 43, 18, 5.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(299, 43, 19, 5.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(300, 43, 20, 6.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(301, 43, 21, 6.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(302, 44, 22, 7.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(303, 44, 23, 7.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(304, 44, 24, 8.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(305, 44, 25, 8.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(306, 44, 26, 7.10, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(307, 44, 27, 8.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(308, 44, 28, 6.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(309, 45, 29, 7.90, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(310, 45, 30, 6.30, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(311, 45, 31, 8.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(312, 45, 32, 8.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(313, 45, 33, 7.40, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(314, 45, 34, 6.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(315, 45, 35, 6.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(316, 46, 8, 8.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(317, 46, 9, 5.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(318, 46, 10, 6.00, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(319, 46, 11, 8.70, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(320, 46, 12, 7.10, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(321, 46, 13, 9.10, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(322, 46, 14, 9.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(323, 47, 43, 9.50, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(324, 47, 44, 7.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(325, 47, 45, 6.30, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(326, 47, 46, 7.80, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(327, 47, 47, 5.80, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(328, 47, 48, 9.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(329, 47, 49, 8.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(330, 48, 1, 8.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(331, 48, 2, 5.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(332, 48, 3, 7.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(333, 48, 4, 5.50, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(334, 48, 5, 6.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(335, 48, 6, 8.30, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(336, 48, 7, 9.50, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(337, 49, 36, 6.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(338, 49, 37, 9.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(339, 49, 38, 9.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(340, 49, 39, 7.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(341, 49, 40, 7.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(342, 49, 41, 7.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(343, 49, 42, 6.10, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(344, 50, 15, 6.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(345, 50, 16, 5.80, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(346, 50, 17, 6.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(347, 50, 18, 5.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(348, 50, 19, 7.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(349, 50, 20, 9.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(350, 50, 21, 6.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(351, 51, 22, 9.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(352, 51, 23, 7.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(353, 51, 24, 6.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(354, 51, 25, 7.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(355, 51, 26, 6.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(356, 51, 27, 8.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(357, 51, 28, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(358, 52, 29, 7.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(359, 52, 30, 8.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(360, 52, 31, 9.50, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(361, 52, 32, 6.40, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(362, 52, 33, 8.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(363, 52, 34, 5.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(364, 52, 35, 8.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(365, 53, 8, 7.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(366, 53, 9, 7.30, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(367, 53, 10, 9.50, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(368, 53, 11, 6.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(369, 53, 12, 5.50, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(370, 53, 13, 8.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(371, 53, 14, 9.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(372, 54, 43, 6.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(373, 54, 44, 5.30, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(374, 54, 45, 5.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(375, 54, 46, 6.30, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(376, 54, 47, 9.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(377, 54, 48, 8.00, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(378, 54, 49, 6.70, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(379, 55, 1, 6.70, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(380, 55, 2, 5.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(381, 55, 3, 7.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(382, 55, 4, 8.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(383, 55, 5, 6.40, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(384, 55, 6, 8.40, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(385, 55, 7, 8.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(386, 56, 36, 8.30, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(387, 56, 37, 5.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(388, 56, 38, 5.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(389, 56, 39, 5.90, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(390, 56, 40, 8.00, 7, '2026-06-19 03:27:39', '2026-06-19 03:27:39'),
(391, 56, 41, 8.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(392, 56, 42, 9.10, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(393, 57, 15, 9.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(394, 57, 16, 6.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(395, 57, 17, 7.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(396, 57, 18, 6.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(397, 57, 19, 7.00, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(398, 57, 20, 5.40, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(399, 57, 21, 6.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(400, 58, 8, 9.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(401, 58, 9, 7.10, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(402, 58, 10, 6.70, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(403, 58, 11, 5.30, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(404, 58, 12, 7.00, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(405, 58, 13, 6.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(406, 58, 14, 9.40, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(407, 59, 1, 8.00, 2, '2026-06-19 08:34:59', '2026-06-19 08:34:59'),
(408, 59, 2, 6.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(409, 59, 3, 7.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(410, 59, 4, 8.50, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(411, 59, 5, 8.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(412, 59, 6, 8.40, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(413, 59, 7, 7.50, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(414, 60, 15, 9.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(415, 60, 16, 8.20, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(416, 60, 17, 6.10, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(417, 60, 18, 6.70, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(418, 60, 19, 7.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(419, 60, 20, 6.50, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(420, 60, 21, 6.60, 7, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(421, 61, 8, 8.50, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(422, 61, 9, 8.30, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(423, 61, 10, 6.10, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(424, 61, 11, 5.60, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(425, 61, 12, 6.50, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(426, 61, 13, 9.20, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(427, 61, 14, 8.70, 3, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(428, 62, 1, 5.20, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(429, 62, 2, 8.40, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(430, 62, 3, 6.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(431, 62, 4, 8.60, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(432, 62, 5, 7.10, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(433, 62, 6, 7.80, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36'),
(434, 62, 7, 8.00, 2, '2026-06-19 03:16:36', '2026-06-19 03:16:36');

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
(1, 1, 'INS3064', 'Web Application Development 2', 3, '2026-06-19 03:16:36', 2),
(2, 1, 'INS3021', 'Database Systems', 3, '2026-06-19 03:16:36', 3),
(3, 2, 'SE3001', 'Software Engineering Principles', 3, '2026-06-19 03:16:36', 7),
(4, 2, 'SE3002', 'Software Design Patterns', 3, '2026-06-19 03:16:36', 7),
(5, 1, 'INS4001', 'Advanced Web Development', 3, '2026-06-19 03:16:36', 2),
(6, 1, 'INS4010', 'Machine Learning Applications', 3, '2026-06-19 03:16:36', 7),
(7, 1, 'INS3080', 'Data Structures & Algorithms', 3, '2026-06-19 03:16:36', 3),
(8, 2, 'SE4002', 'Agile Software Development', 3, '2026-06-19 03:16:36', 7),
(9, 1, 'INS3010', 'Computer Networks', 3, '2026-06-19 03:16:36', 7),
(10, 1, 'INS3015', 'Operating Systems', 3, '2026-06-19 03:16:36', 3),
(11, 2, 'SE3010', 'Software Testing & QA', 3, '2026-06-19 03:16:36', 7),
(12, 1, 'INS4020', 'Artificial Intelligence', 3, '2026-06-19 03:16:36', 2),
(13, 1, 'INS3070', 'Computer Architecture', 3, '2026-06-19 03:16:36', 7),
(14, 1, 'INS4030', 'Cloud Computing', 3, '2026-06-19 03:16:36', 2),
(15, 1, 'INS4050', 'Mobile Application Development', 3, '2026-06-19 03:16:36', 3),
(16, 2, 'SE4010', 'Enterprise Architecture', 3, '2026-06-19 03:16:36', 7),
(17, 3, 'CS101', 'Introduction to Programming', 3, '2026-06-22 06:31:33', 2),
(18, 3, 'CS202', 'Data Structures and Algorithms', 4, '2026-06-22 06:31:33', 2),
(19, 4, 'CY101', 'Network Security Foundations', 3, '2026-06-22 06:31:33', 2),
(20, 4, 'CY202', 'Applied Cryptography', 3, '2026-06-22 06:31:33', 2);

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
(1, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'System Administrator', 'admin@vnu.edu.vn', '2026-06-19 03:16:36'),
(2, 'lecturer1', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lecturer', 'Nguyễn Văn An', 'lecturer1@vnu.edu.vn', '2026-06-19 03:16:36'),
(3, 'lecturer2', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lecturer', 'Trần Thị Bình', 'lecturer2@vnu.edu.vn', '2026-06-19 03:16:36'),
(4, 'student1', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Lê Văn Cường', 'student1@vnu.edu.vn', '2026-06-19 03:16:36'),
(5, 'student2', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Phạm Thị Dung', 'student2@vnu.edu.vn', '2026-06-19 03:16:36'),
(6, 'student3', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Hoàng Văn Em', 'student3@vnu.edu.vn', '2026-06-19 03:16:36'),
(7, 'lecturer3', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lecturer', 'Lê Thị An', 'lethian@vnu.edu.vn', '2026-06-19 03:16:36'),
(8, 'student4', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Vũ Thị Giang', 'student4@vnu.edu.vn', '2026-06-19 03:16:36'),
(9, 'student5', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Đặng Văn Hùng', 'student5@vnu.edu.vn', '2026-06-19 03:16:36'),
(10, 'student6', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Bùi Thị Kim', 'student6@vnu.edu.vn', '2026-06-19 03:16:36'),
(11, 'student7', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Nguyễn Thị Lan', 'student7@vnu.edu.vn', '2026-06-19 03:16:36');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=497;

--
-- AUTO_INCREMENT cho bảng `clos`
--
ALTER TABLE `clos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `clo_plo_mappings`
--
ALTER TABLE `clo_plo_mappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `grade_change_requests`
--
ALTER TABLE `grade_change_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `rubric_criteria`
--
ALTER TABLE `rubric_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT cho bảng `score_ledger`
--
ALTER TABLE `score_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT cho bảng `student_enrollments`
--
ALTER TABLE `student_enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `student_scores`
--
ALTER TABLE `student_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- AUTO_INCREMENT cho bảng `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
