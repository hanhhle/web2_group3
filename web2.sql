-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2026 at 02:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web2`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
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
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`id`, `subject_id`, `lecturer_id`, `name`, `type`, `weight`, `max_score`, `semester`, `created_at`) VALUES
(1, 1, 2, 'Assignment 1 - PHP Basics', 'attendance', 10.00, 10.00, '2024-1', '2026-05-17 12:03:03'),
(2, 1, 2, 'Midterm Exam', 'midterm', 30.00, 10.00, '2024-1', '2026-05-17 12:03:03'),
(3, 1, 2, 'Final Project - Grading System', 'final', 60.00, 10.00, '2024-1', '2026-05-17 12:03:03'),
(4, 2, 2, 'Lab 1 - SQL Queries', 'attendance', 10.00, 10.00, '2024-1', '2026-05-17 12:03:03'),
(5, 2, 2, 'Midterm - Database Design', 'midterm', 30.00, 10.00, '2024-1', '2026-05-17 12:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
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
-- Dumping data for table `audit_logs`
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
(28, 1, 'VERIFY_LEDGER', 'score_ledger', NULL, 'Verified 10 entries. Violations: 0', '::1', '2026-05-17 12:12:57');

-- --------------------------------------------------------

--
-- Table structure for table `clos`
--

CREATE TABLE `clos` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clos`
--

INSERT INTO `clos` (`id`, `subject_id`, `code`, `description`, `created_at`) VALUES
(1, 1, 'CLO1', 'Apply PHP and MySQL to build secure web applications', '2026-05-17 12:03:03'),
(2, 1, 'CLO2', 'Implement authentication and role-based access control', '2026-05-17 12:03:03'),
(3, 1, 'CLO3', 'Design and use hash-chain ledger for data integrity', '2026-05-17 12:03:03'),
(4, 1, 'CLO4', 'Apply OOP principles in PHP development', '2026-05-17 12:03:03'),
(5, 2, 'CLO1', 'Write complex SQL queries using JOIN and aggregation', '2026-05-17 12:03:03'),
(6, 2, 'CLO2', 'Design normalized relational database schemas', '2026-05-17 12:03:03'),
(7, 2, 'CLO3', 'Implement stored procedures and triggers', '2026-05-17 12:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `clo_plo_mappings`
--

CREATE TABLE `clo_plo_mappings` (
  `id` int(11) NOT NULL,
  `clo_id` int(11) NOT NULL,
  `plo_id` int(11) NOT NULL,
  `weight` decimal(5,2) NOT NULL DEFAULT 1.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clo_plo_mappings`
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
(11, 7, 2, 0.50, '2026-05-17 12:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `plos`
--

CREATE TABLE `plos` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plos`
--

INSERT INTO `plos` (`id`, `program_id`, `code`, `description`, `created_at`) VALUES
(1, 1, 'PLO1', 'Apply computing knowledge to solve IS problems', '2026-05-17 12:03:03'),
(2, 1, 'PLO2', 'Design and implement database-driven web applications', '2026-05-17 12:03:03'),
(3, 1, 'PLO3', 'Demonstrate critical thinking and problem-solving skills', '2026-05-17 12:03:03'),
(4, 1, 'PLO4', 'Work effectively in teams and communicate technical concepts', '2026-05-17 12:03:03'),
(5, 2, 'PLO1', 'Apply software engineering principles to develop quality software', '2026-05-17 12:03:03'),
(6, 2, 'PLO2', 'Design scalable and maintainable software architectures', '2026-05-17 12:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `name`, `code`, `description`, `created_at`) VALUES
(1, 'Information Systems', 'IS', 'Chương trình Hệ thống Thông tin', '2026-05-17 12:03:03'),
(2, 'Software Engineering', 'SE', 'Chương trình Kỹ thuật Phần mềm', '2026-05-17 12:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `rubrics`
--

CREATE TABLE `rubrics` (
  `id` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rubrics`
--

INSERT INTO `rubrics` (`id`, `assessment_id`, `name`, `created_at`) VALUES
(1, 1, 'PHP Assignment Rubric', '2026-05-17 12:03:03'),
(2, 2, 'Midterm Exam Rubric', '2026-05-17 12:03:03'),
(3, 3, 'Final Project Rubric', '2026-05-17 12:03:03'),
(4, 4, 'SQL Lab Rubric', '2026-05-17 12:03:03'),
(5, 5, 'Database Design Rubric', '2026-05-17 12:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `rubric_criteria`
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
-- Dumping data for table `rubric_criteria`
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
(11, 5, 7, 'Stored procedures & triggers', 10.00, 50.00, '2026-05-17 12:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `score_ledger`
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
-- Dumping data for table `score_ledger`
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
(10, 3, 7, 10.00, '{\"enrollment_id\":3,\"criterion_id\":7,\"score\":10.0,\"action\":\"INSERT\",\"graded_by\":2,\"timestamp\":\"2024-01-15 10:02:00\"}', 'INSERT', 2, '2024-01-15 03:02:00', 'cdcdd7c978c66ea608ba6bd705afa1223b9d6fefd92a07a96c3401bdb325d43e', '811ce8bdfa5bcc34d64ad517aa3251eb80590a89f0f07903b6664b6f50dc4f9b');

-- --------------------------------------------------------

--
-- Table structure for table `student_enrollments`
--

CREATE TABLE `student_enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL DEFAULT '2024-1',
  `enrolled_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_enrollments`
--

INSERT INTO `student_enrollments` (`id`, `student_id`, `subject_id`, `semester`, `enrolled_at`) VALUES
(1, 4, 1, '2024-1', '2026-05-17 12:03:03'),
(2, 5, 1, '2024-1', '2026-05-17 12:03:03'),
(3, 6, 1, '2024-1', '2026-05-17 12:03:03'),
(4, 4, 2, '2024-1', '2026-05-17 12:03:03'),
(5, 5, 2, '2024-1', '2026-05-17 12:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `student_scores`
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
-- Dumping data for table `student_scores`
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
(29, 5, 11, 6.50, 2, '2026-05-17 12:03:03', '2026-05-17 12:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `credits` int(11) NOT NULL DEFAULT 3,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `program_id`, `code`, `name`, `credits`, `created_at`) VALUES
(1, 1, 'INS3064', 'Web Application Development 2', 3, '2026-05-17 12:03:03'),
(2, 1, 'INS3021', 'Database Systems', 3, '2026-05-17 12:03:03'),
(3, 2, 'SE3001', 'Software Engineering Principles', 3, '2026-05-17 12:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `role`, `full_name`, `email`, `created_at`) VALUES
(1, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'System Administrator', 'admin@vnu.edu.vn', '2026-05-17 12:03:03'),
(2, 'lecturer1', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lecturer', 'Nguyễn Văn An', 'lecturer1@vnu.edu.vn', '2026-05-17 12:03:03'),
(3, 'lecturer2', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lecturer', 'Trần Thị Bình', 'lecturer2@vnu.edu.vn', '2026-05-17 12:03:03'),
(4, 'student1', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Lê Văn Cường', 'student1@vnu.edu.vn', '2026-05-17 12:03:03'),
(5, 'student2', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Phạm Thị Dung', 'student2@vnu.edu.vn', '2026-05-17 12:03:03'),
(6, 'student3', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'Hoàng Văn Em', 'student3@vnu.edu.vn', '2026-05-17 12:03:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `lecturer_id` (`lecturer_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `clos`
--
ALTER TABLE `clos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `clo_plo_mappings`
--
ALTER TABLE `clo_plo_mappings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_clo_plo` (`clo_id`,`plo_id`),
  ADD KEY `plo_id` (`plo_id`);

--
-- Indexes for table `plos`
--
ALTER TABLE `plos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `rubrics`
--
ALTER TABLE `rubrics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assessment_id` (`assessment_id`);

--
-- Indexes for table `rubric_criteria`
--
ALTER TABLE `rubric_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rubric_id` (`rubric_id`),
  ADD KEY `clo_id` (`clo_id`);

--
-- Indexes for table `score_ledger`
--
ALTER TABLE `score_ledger`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_current_hash` (`current_hash`),
  ADD KEY `enrollment_id` (`enrollment_id`),
  ADD KEY `criterion_id` (`criterion_id`),
  ADD KEY `graded_by` (`graded_by`);

--
-- Indexes for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_enrollment` (`student_id`,`subject_id`,`semester`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `student_scores`
--
ALTER TABLE `student_scores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_score` (`enrollment_id`,`criterion_id`),
  ADD KEY `criterion_id` (`criterion_id`),
  ADD KEY `graded_by` (`graded_by`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessments`
--
ALTER TABLE `assessments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `clos`
--
ALTER TABLE `clos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `clo_plo_mappings`
--
ALTER TABLE `clo_plo_mappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `plos`
--
ALTER TABLE `plos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rubrics`
--
ALTER TABLE `rubrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rubric_criteria`
--
ALTER TABLE `rubric_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `score_ledger`
--
ALTER TABLE `score_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student_scores`
--
ALTER TABLE `student_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessments`
--
ALTER TABLE `assessments`
  ADD CONSTRAINT `assessments_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assessments_ibfk_2` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `clos`
--
ALTER TABLE `clos`
  ADD CONSTRAINT `clos_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clo_plo_mappings`
--
ALTER TABLE `clo_plo_mappings`
  ADD CONSTRAINT `clo_plo_mappings_ibfk_1` FOREIGN KEY (`clo_id`) REFERENCES `clos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clo_plo_mappings_ibfk_2` FOREIGN KEY (`plo_id`) REFERENCES `plos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plos`
--
ALTER TABLE `plos`
  ADD CONSTRAINT `plos_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rubrics`
--
ALTER TABLE `rubrics`
  ADD CONSTRAINT `rubrics_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rubric_criteria`
--
ALTER TABLE `rubric_criteria`
  ADD CONSTRAINT `rubric_criteria_ibfk_1` FOREIGN KEY (`rubric_id`) REFERENCES `rubrics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rubric_criteria_ibfk_2` FOREIGN KEY (`clo_id`) REFERENCES `clos` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `score_ledger`
--
ALTER TABLE `score_ledger`
  ADD CONSTRAINT `score_ledger_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `student_enrollments` (`id`),
  ADD CONSTRAINT `score_ledger_ibfk_2` FOREIGN KEY (`criterion_id`) REFERENCES `rubric_criteria` (`id`),
  ADD CONSTRAINT `score_ledger_ibfk_3` FOREIGN KEY (`graded_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD CONSTRAINT `student_enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_enrollments_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_scores`
--
ALTER TABLE `student_scores`
  ADD CONSTRAINT `student_scores_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `student_enrollments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_scores_ibfk_2` FOREIGN KEY (`criterion_id`) REFERENCES `rubric_criteria` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_scores_ibfk_3` FOREIGN KEY (`graded_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;