-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2026 at 05:03 AM
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
-- Database: `medcare_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `requested_datetime` datetime NOT NULL,
  `reason` text NOT NULL,
  `preferred_time` varchar(255) DEFAULT NULL,
  `approved_datetime` datetime DEFAULT NULL,
  `completed_datetime` datetime DEFAULT NULL,
  `temperature` varchar(255) DEFAULT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `heart_rate` varchar(255) DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `status` enum('pending','approved','rescheduled','declined','completed','cancelled','in_session') NOT NULL DEFAULT 'pending',
  `morning_notified` tinyint(1) NOT NULL DEFAULT 0,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_sms_sent` tinyint(1) NOT NULL DEFAULT 0,
  `guardian_sms_sent` tinyint(1) NOT NULL DEFAULT 0,
  `findings` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `student_id`, `requested_datetime`, `reason`, `preferred_time`, `approved_datetime`, `completed_datetime`, `temperature`, `blood_pressure`, `heart_rate`, `additional_notes`, `status`, `morning_notified`, `approved_by`, `admin_note`, `created_at`, `updated_at`, `student_sms_sent`, `guardian_sms_sent`, `findings`) VALUES
(1, 3, '2025-10-07 21:53:00', '', NULL, '2025-10-07 14:35:00', NULL, NULL, NULL, NULL, NULL, 'rescheduled', 0, 2, 'shesh', '2025-10-07 05:53:42', '2025-10-07 06:30:46', 0, 0, NULL),
(2, 3, '2025-10-08 21:55:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-07 05:55:49', '2025-10-13 03:48:45', 0, 0, NULL),
(3, 3, '2025-10-14 09:36:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 03:37:02', '2025-10-13 03:49:00', 0, 0, NULL),
(4, 3, '2025-10-14 09:36:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 03:37:07', '2025-10-13 03:49:04', 0, 0, NULL),
(5, 3, '2025-10-13 19:37:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 03:38:02', '2025-10-13 03:48:49', 0, 0, NULL),
(6, 3, '2025-10-13 19:40:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 03:40:51', '2025-10-13 03:48:53', 0, 0, NULL),
(7, 3, '2025-10-13 23:41:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 03:41:44', '2025-10-13 03:48:57', 0, 0, NULL),
(8, 3, '2025-10-13 23:04:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 07:05:03', '2025-10-13 07:06:39', 0, 0, NULL),
(9, 3, '2025-10-13 23:04:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 07:05:22', '2025-10-13 07:06:42', 0, 0, NULL),
(10, 3, '2025-10-15 08:04:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 07:06:19', '2025-10-13 07:27:44', 0, 0, NULL),
(11, 3, '2025-10-13 23:08:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 07:08:16', '2025-10-13 07:27:19', 0, 0, NULL),
(12, 3, '2025-10-14 23:14:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 07:14:50', '2025-10-13 07:27:40', 0, 0, NULL),
(13, 3, '2025-10-13 23:19:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 07:19:45', '2025-10-13 07:27:24', 0, 0, NULL),
(14, 3, '2025-10-13 23:19:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 07:23:12', '2025-10-13 07:27:28', 0, 0, NULL),
(15, 3, '2025-10-13 23:23:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 07:23:56', '2025-10-13 07:27:32', 0, 0, NULL),
(16, 3, '2025-10-13 23:23:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0, NULL, NULL, '2025-10-13 07:26:57', '2025-10-13 07:27:36', 0, 0, NULL),
(17, 3, '2025-10-15 08:27:00', '', NULL, '2025-10-18 01:14:00', NULL, NULL, NULL, NULL, NULL, 'declined', 0, 2, 'asdasd', '2025-10-13 07:28:00', '2025-10-17 17:09:50', 0, 0, NULL),
(18, 3, '2025-10-20 09:09:00', '', NULL, '2025-10-18 01:25:00', NULL, NULL, NULL, NULL, NULL, 'completed', 0, 2, 'asd', '2025-10-17 17:09:13', '2025-10-19 21:09:27', 0, 0, NULL),
(19, 3, '2025-10-18 11:24:00', '', NULL, '2025-10-18 01:29:00', NULL, NULL, NULL, NULL, NULL, 'rescheduled', 0, 2, 'asdasd', '2025-10-17 17:24:27', '2025-10-17 17:25:01', 0, 0, NULL),
(20, 3, '2025-10-29 09:24:00', '', NULL, '2025-10-18 01:30:00', NULL, NULL, NULL, NULL, NULL, 'approved', 0, 2, 'asdasd', '2025-10-17 17:24:31', '2025-10-17 17:25:08', 0, 0, NULL),
(21, 3, '2025-10-19 11:38:00', '', NULL, '2025-10-19 04:25:00', NULL, NULL, NULL, NULL, NULL, 'completed', 0, 2, 'asd', '2025-10-18 19:38:21', '2025-10-18 23:14:08', 0, 0, NULL),
(22, 3, '2025-10-19 13:50:00', '', NULL, '2025-10-19 05:55:00', NULL, NULL, NULL, NULL, NULL, 'approved', 0, 2, 'asds', '2025-10-18 21:50:37', '2025-10-18 21:51:03', 0, 0, NULL),
(23, 3, '2025-10-23 09:53:00', '', NULL, '2025-10-20 12:59:00', NULL, NULL, NULL, NULL, NULL, 'approved', 0, 2, 'as', '2025-10-20 04:53:51', '2025-10-20 04:54:28', 0, 0, NULL),
(24, 3, '2025-10-25 10:42:00', '', NULL, '2025-10-25 04:48:00', NULL, NULL, NULL, NULL, NULL, 'completed', 0, 2, NULL, '2025-10-24 20:42:49', '2025-10-24 20:44:08', 0, 0, NULL),
(25, 3, '2025-11-03 09:43:00', '', NULL, '2026-01-23 10:05:00', NULL, NULL, NULL, NULL, NULL, 'completed', 0, 2, NULL, '2025-11-01 01:44:12', '2026-01-23 03:15:31', 0, 0, NULL),
(26, 3, '2025-11-03 10:03:00', '', NULL, '2025-12-03 11:31:00', NULL, NULL, NULL, NULL, NULL, 'declined', 0, 2, 'asdasd', '2025-11-01 02:04:02', '2025-12-03 03:26:27', 0, 0, NULL),
(27, 3, '2025-12-04 09:19:00', '', NULL, '2025-12-03 08:25:00', NULL, NULL, NULL, NULL, NULL, 'approved', 0, 2, 'wasa', '2025-12-03 00:20:07', '2025-12-03 00:20:31', 0, 0, NULL),
(28, 3, '2026-01-06 11:30:00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', 0, NULL, NULL, '2026-01-06 02:30:31', '2026-01-06 10:54:05', 0, 0, NULL),
(29, 3, '2026-01-23 09:42:39', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', 0, NULL, NULL, '2026-01-23 01:42:39', '2026-01-23 01:43:08', 0, 0, NULL),
(30, 3, '2026-01-23 10:55:43', '', NULL, '2026-01-23 11:01:00', NULL, NULL, NULL, NULL, NULL, 'completed', 0, 2, NULL, '2026-01-23 02:55:43', '2026-01-23 03:15:39', 0, 0, NULL),
(31, 3, '2026-01-23 11:16:23', '', NULL, '2026-01-23 11:28:00', NULL, NULL, NULL, NULL, NULL, 'completed', 0, 2, NULL, '2026-01-23 03:16:23', '2026-01-23 03:24:09', 0, 0, NULL),
(32, 3, '2026-01-23 11:25:31', '', NULL, '2026-01-23 11:30:00', NULL, NULL, NULL, NULL, NULL, 'approved', 0, 2, NULL, '2026-01-23 03:25:31', '2026-01-23 03:25:46', 0, 0, NULL),
(33, 11, '2026-02-10 15:39:26', '', NULL, '2026-02-10 15:44:00', NULL, NULL, NULL, NULL, NULL, 'completed', 0, 2, NULL, '2026-02-10 07:39:26', '2026-02-10 07:40:02', 0, 0, NULL),
(34, 3, '2026-02-14 19:56:53', 'asdasd', '123', '2026-02-14 20:02:00', NULL, NULL, NULL, NULL, NULL, 'completed', 0, 2, NULL, '2026-02-14 11:56:53', '2026-02-14 11:57:45', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointment_completions`
--

CREATE TABLE `appointment_completions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` bigint(20) UNSIGNED NOT NULL,
  `completed_datetime` datetime NOT NULL,
  `temperature` varchar(255) DEFAULT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `heart_rate` varchar(255) DEFAULT NULL,
  `findings` text DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointment_completions`
--

INSERT INTO `appointment_completions` (`id`, `appointment_id`, `completed_datetime`, `temperature`, `blood_pressure`, `heart_rate`, `findings`, `additional_notes`, `created_at`, `updated_at`) VALUES
(1, 21, '2025-10-19 07:13:00', '55', '123', '232', NULL, 'asdasdasd', '2025-10-18 23:14:08', '2025-10-18 23:14:08'),
(2, 18, '2025-10-20 05:09:00', NULL, NULL, NULL, NULL, NULL, '2025-10-19 21:09:27', '2025-10-19 21:09:27'),
(3, 24, '2025-10-25 04:43:00', '2312', '123123', '233', NULL, 'sdad', '2025-10-24 20:44:08', '2025-10-24 20:44:08'),
(4, 25, '2026-01-23 11:15:00', NULL, NULL, NULL, NULL, NULL, '2026-01-23 03:15:31', '2026-01-23 03:15:31'),
(5, 30, '2026-01-23 11:15:00', NULL, NULL, NULL, NULL, NULL, '2026-01-23 03:15:39', '2026-01-23 03:15:39'),
(6, 31, '2026-01-23 11:24:00', NULL, NULL, NULL, NULL, NULL, '2026-01-23 03:24:09', '2026-01-23 03:24:09'),
(7, 33, '2026-02-10 15:39:00', '55', '12', '42', NULL, 'wa ra', '2026-02-10 07:40:02', '2026-02-10 07:40:02'),
(8, 34, '2026-02-14 19:57:00', '21', '12', '12', NULL, 'asd', '2026-02-14 11:57:45', '2026-02-14 11:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_records`
--

CREATE TABLE `emergency_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `reported_by` bigint(20) UNSIGNED DEFAULT NULL,
  `reported_at` datetime DEFAULT NULL,
  `temperature` varchar(255) DEFAULT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `heart_rate` varchar(255) DEFAULT NULL,
  `symptoms` text DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `treatment` text DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `guardian_notified` tinyint(1) NOT NULL DEFAULT 0,
  `guardian_notified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emergency_records`
--

INSERT INTO `emergency_records` (`id`, `created_at`, `updated_at`, `student_id`, `reported_by`, `reported_at`, `temperature`, `blood_pressure`, `heart_rate`, `symptoms`, `diagnosis`, `treatment`, `additional_notes`, `guardian_notified`, `guardian_notified_at`) VALUES
(1, '2026-02-01 05:24:27', '2026-02-01 05:24:27', 7, 2, '2026-02-01 13:24:27', '37.5', '120/80', '80', 'TEST EMERGENCY', 'TEST', 'TEST', NULL, 0, NULL),
(2, '2026-02-01 20:28:38', '2026-02-01 20:28:38', 7, 2, '2026-02-02 04:28:38', NULL, NULL, NULL, NULL, NULL, NULL, '123', 0, NULL),
(3, '2026-02-01 20:28:51', '2026-02-01 20:28:51', 7, 2, '2026-02-02 04:28:51', NULL, NULL, NULL, NULL, NULL, NULL, 'asdasd', 0, NULL),
(4, '2026-02-01 20:29:50', '2026-02-01 20:29:50', 7, 2, '2026-02-02 04:29:50', NULL, NULL, NULL, NULL, NULL, NULL, 'asdasdasd', 0, NULL),
(5, '2026-02-09 06:40:05', '2026-02-09 06:40:05', 3, 2, '2026-02-09 14:40:05', NULL, NULL, NULL, NULL, NULL, NULL, 'asdasd', 0, NULL),
(6, '2026-02-09 06:52:53', '2026-02-09 06:52:53', 7, 2, '2026-02-09 14:52:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(7, '2026-02-09 06:53:17', '2026-02-09 06:53:17', 8, 2, '2026-02-09 14:53:17', NULL, NULL, NULL, NULL, NULL, NULL, 'asd', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guardian_sms_logs`
--

CREATE TABLE `guardian_sms_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_phone` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `sent_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sent_by_role` varchar(255) DEFAULT NULL,
  `sent_by` varchar(255) DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guardian_sms_logs`
--

INSERT INTO `guardian_sms_logs` (`id`, `appointment_id`, `student_id`, `guardian_name`, `guardian_phone`, `message`, `sent_by_id`, `sent_by_role`, `sent_by`, `sent_at`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'edward', '09952936784', 'gwafo kaau ka', 2, 'nurse', 'Nurse User', NULL, '2026-01-10 04:36:52', '2026-01-10 04:36:52'),
(2, NULL, NULL, 'edward', '+639952936784', 'wafo', 2, 'nurse', 'Nurse User', NULL, '2026-01-10 04:41:14', '2026-01-10 04:41:14'),
(3, NULL, NULL, 'edward', '639952936784', 'wafo', 2, 'nurse', 'Nurse User', NULL, '2026-01-10 04:42:28', '2026-01-10 04:42:28'),
(4, NULL, NULL, 'edward', '09952936784', 'ey', 2, 'nurse', 'Nurse User', NULL, '2026-01-10 04:52:52', '2026-01-10 04:52:52'),
(5, NULL, NULL, 'edward', '+639952936784', 'ey', 2, 'nurse', 'Nurse User', NULL, '2026-01-10 04:59:12', '2026-01-10 04:59:12'),
(6, NULL, NULL, 'edward', '+639952936784', 'wafo', 2, 'nurse', 'Nurse User', NULL, '2026-02-09 07:01:14', '2026-02-09 07:01:14'),
(7, NULL, NULL, 'edward', '+639952936784', 'wafo', 2, 'nurse', 'Nurse User', NULL, '2026-02-09 07:01:16', '2026-02-09 07:01:16'),
(8, NULL, NULL, 'edward', '+639952936784', 'wafo', 2, 'nurse', 'Nurse User', NULL, '2026-02-09 07:01:17', '2026-02-09 07:01:17'),
(9, NULL, NULL, 'edward', '+639952936784', 'wafo', 2, 'nurse', 'Nurse User', NULL, '2026-02-09 07:01:20', '2026-02-09 07:01:20');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"d5a8f66c-7feb-4f51-a2f9-1a938de5d5cd\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1759845224,\"delay\":null}', 0, NULL, 1759845224, 1759845224),
(2, 'default', '{\"uuid\":\"df3416f9-75a4-4eef-bb59-0f2a3d979bb8\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1759845349,\"delay\":null}', 0, NULL, 1759845349, 1759845349),
(3, 'default', '{\"uuid\":\"25b2f38e-bc0b-4b75-a25e-bf0aa371743b\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:84:\\\"📢 Your appointment has been rescheduled. Please check your dashboard for details.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1759847446,\"delay\":null}', 0, NULL, 1759847446, 1759847446),
(4, 'default', '{\"uuid\":\"d777e245-6253-4a1f-bf57-47e3438cbd58\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760355424,\"delay\":null}', 0, NULL, 1760355424, 1760355424),
(5, 'default', '{\"uuid\":\"af46af3c-a1e9-45ba-aaa0-3cee2336cdb0\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760355427,\"delay\":null}', 0, NULL, 1760355427, 1760355427),
(6, 'default', '{\"uuid\":\"8b029e1c-5d48-456a-af33-295b1a1b4713\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760355482,\"delay\":null}', 0, NULL, 1760355482, 1760355482),
(7, 'default', '{\"uuid\":\"1103c9eb-59c8-4e82-8ac1-fafe8237c9d1\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760355651,\"delay\":null}', 0, NULL, 1760355651, 1760355651),
(8, 'default', '{\"uuid\":\"1fdb3582-1bf4-4cbb-a343-057059204a25\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760355704,\"delay\":null}', 0, NULL, 1760355704, 1760355704),
(9, 'default', '{\"uuid\":\"9a808fff-d81f-4e43-8d3b-c552eba8e569\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:48:\\\"❌ Appointment #2 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760356125,\"delay\":null}', 0, NULL, 1760356125, 1760356125),
(10, 'default', '{\"uuid\":\"9e80ef29-d06d-45cd-bad9-088638f76112\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:48:\\\"❌ Appointment #5 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760356130,\"delay\":null}', 0, NULL, 1760356130, 1760356130),
(11, 'default', '{\"uuid\":\"feb687d7-d469-4bf5-bc75-402e40e9c4c4\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:48:\\\"❌ Appointment #6 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760356133,\"delay\":null}', 0, NULL, 1760356133, 1760356133),
(12, 'default', '{\"uuid\":\"9ab1e148-8d54-4193-8475-78931a524cba\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:48:\\\"❌ Appointment #7 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760356137,\"delay\":null}', 0, NULL, 1760356137, 1760356137),
(13, 'default', '{\"uuid\":\"7546cb6d-75bd-4e0c-9972-a5223c93bd76\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:48:\\\"❌ Appointment #3 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760356140,\"delay\":null}', 0, NULL, 1760356140, 1760356140),
(14, 'default', '{\"uuid\":\"485f0198-10e9-4101-9151-b5c8f3c60d92\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:48:\\\"❌ Appointment #4 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760356144,\"delay\":null}', 0, NULL, 1760356144, 1760356144),
(15, 'default', '{\"uuid\":\"4c937924-e448-4b77-bb0e-d42b04ea536c\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760367904,\"delay\":null}', 0, NULL, 1760367904, 1760367904),
(16, 'default', '{\"uuid\":\"03e40b14-9f5a-40c8-8375-3c8cf344393a\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760367922,\"delay\":null}', 0, NULL, 1760367922, 1760367922),
(17, 'default', '{\"uuid\":\"c1ed4fcc-ebd6-4c3b-b571-7dc1d8286446\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760367979,\"delay\":null}', 0, NULL, 1760367979, 1760367979),
(18, 'default', '{\"uuid\":\"f1ade143-f5cb-4b7b-9040-d2f463bf16b1\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:48:\\\"❌ Appointment #8 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760367999,\"delay\":null}', 0, NULL, 1760367999, 1760367999),
(19, 'default', '{\"uuid\":\"29a0bf5a-0cca-4c0b-9366-6542f9650074\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:48:\\\"❌ Appointment #9 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760368002,\"delay\":null}', 0, NULL, 1760368002, 1760368002),
(20, 'default', '{\"uuid\":\"32c52f9b-03af-49ca-95c9-8087283a0c08\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760368096,\"delay\":null}', 0, NULL, 1760368096, 1760368096),
(21, 'default', '{\"uuid\":\"db1b5adf-8c97-4839-8f22-5fe277199310\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760368491,\"delay\":null}', 0, NULL, 1760368491, 1760368491),
(22, 'default', '{\"uuid\":\"512f4f82-be1e-4a4d-b6d7-5fae5442a014\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760368785,\"delay\":null}', 0, NULL, 1760368785, 1760368785),
(23, 'default', '{\"uuid\":\"78b80fa7-ca78-446e-a97d-9052a6136066\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760368992,\"delay\":null}', 0, NULL, 1760368992, 1760368992),
(24, 'default', '{\"uuid\":\"5dc763ea-3dcc-4ee9-a617-306d518e391f\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760369036,\"delay\":null}', 0, NULL, 1760369036, 1760369036),
(25, 'default', '{\"uuid\":\"ffae0a64-f2ef-43b3-af53-472a65697222\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760369217,\"delay\":null}', 0, NULL, 1760369217, 1760369217),
(26, 'default', '{\"uuid\":\"7810ebe2-298c-48bf-a646-4adf15cffb11\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:49:\\\"❌ Appointment #11 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760369239,\"delay\":null}', 0, NULL, 1760369239, 1760369239),
(27, 'default', '{\"uuid\":\"0017be57-5fde-485a-962f-318d89f92e0e\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:49:\\\"❌ Appointment #13 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760369244,\"delay\":null}', 0, NULL, 1760369244, 1760369244),
(28, 'default', '{\"uuid\":\"e2155c91-927a-4260-a887-f6a2805bf4d1\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:49:\\\"❌ Appointment #14 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760369248,\"delay\":null}', 0, NULL, 1760369248, 1760369248),
(29, 'default', '{\"uuid\":\"a689d616-6a19-4452-83db-110ce3e2ae04\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:49:\\\"❌ Appointment #15 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760369252,\"delay\":null}', 0, NULL, 1760369252, 1760369252),
(30, 'default', '{\"uuid\":\"df0821db-20d5-4eae-b831-e9d25c460d90\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:49:\\\"❌ Appointment #16 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760369256,\"delay\":null}', 0, NULL, 1760369256, 1760369256),
(31, 'default', '{\"uuid\":\"4f6600d7-621c-45fb-9a27-f497327b9118\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:49:\\\"❌ Appointment #12 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760369260,\"delay\":null}', 0, NULL, 1760369260, 1760369260),
(32, 'default', '{\"uuid\":\"02bd876e-13da-4bc6-87aa-9fa4ba98b50b\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:49:\\\"❌ Appointment #10 was cancelled by Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760369264,\"delay\":null}', 0, NULL, 1760369264, 1760369264),
(33, 'default', '{\"uuid\":\"0e7c73a5-972b-4ce9-a984-702c42d0f3e3\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760369280,\"delay\":null}', 0, NULL, 1760369280, 1760369280),
(34, 'default', '{\"uuid\":\"873418b4-c7e1-472c-9ef3-498cbb429a62\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760749755,\"delay\":null}', 0, NULL, 1760749755, 1760749755),
(35, 'default', '{\"uuid\":\"c3e28fe3-93d6-42b0-896c-3b98cbcc95f6\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:56:\\\"📢 Your appointment request was declined by the nurse.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760749790,\"delay\":null}', 0, NULL, 1760749790, 1760749790),
(36, 'default', '{\"uuid\":\"f3856967-f629-4164-af53-c2e3ea4fdd34\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:56:\\\"📢 Your appointment request was declined by the nurse.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760749795,\"delay\":null}', 0, NULL, 1760749795, 1760749795),
(37, 'default', '{\"uuid\":\"783f50f6-a221-4307-9051-abf52a8ce43c\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:56:\\\"📢 Your appointment request was declined by the nurse.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760749833,\"delay\":null}', 0, NULL, 1760749833, 1760749833),
(38, 'default', '{\"uuid\":\"b19a8789-d86a-4a20-8476-29d48c0e986d\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Oct 18, 2025 01:25 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760750435,\"delay\":null}', 0, NULL, 1760750435, 1760750435),
(39, 'default', '{\"uuid\":\"3eb7dbc1-a44f-4dd5-9962-48ee22007ab9\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760750667,\"delay\":null}', 0, NULL, 1760750667, 1760750667),
(40, 'default', '{\"uuid\":\"9a61df69-bdf4-48d5-881c-14e435b8df75\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760750671,\"delay\":null}', 0, NULL, 1760750671, 1760750671),
(41, 'default', '{\"uuid\":\"dcd3b36d-c734-466c-89e7-984e2b57d873\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:84:\\\"📢 Your appointment has been rescheduled. Please check your dashboard for details.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760750701,\"delay\":null}', 0, NULL, 1760750701, 1760750701),
(42, 'default', '{\"uuid\":\"a4372a70-f5db-47cf-9b4d-facb7980bb23\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Oct 18, 2025 01:30 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760750708,\"delay\":null}', 0, NULL, 1760750708, 1760750708),
(43, 'default', '{\"uuid\":\"9ef54836-0a0f-496f-9a72-858bca336002\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760845104,\"delay\":null}', 0, NULL, 1760845104, 1760845104),
(44, 'default', '{\"uuid\":\"d9a239e1-1f0d-411a-8fef-d91e685fec2a\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Oct 19, 2025 04:25 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760847635,\"delay\":null}', 0, NULL, 1760847635, 1760847635),
(45, 'default', '{\"uuid\":\"d22ad076-cb16-41e4-9f49-ba294fb74826\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Oct 19, 2025 04:25 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760847639,\"delay\":null}', 0, NULL, 1760847639, 1760847639),
(46, 'default', '{\"uuid\":\"46967624-02b3-4efe-9ece-a219f43f4895\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Oct 19, 2025 04:25 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760847662,\"delay\":null}', 0, NULL, 1760847662, 1760847662),
(47, 'default', '{\"uuid\":\"f95c591b-feca-4693-af61-28c92a9dfdf2\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760853037,\"delay\":null}', 0, NULL, 1760853037, 1760853037),
(48, 'default', '{\"uuid\":\"c20e08b6-e4a1-4283-ad6d-f56396b37d76\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Oct 19, 2025 05:55 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760853063,\"delay\":null}', 0, NULL, 1760853063, 1760853063),
(49, 'default', '{\"uuid\":\"f57252ba-fd1f-4e0c-b22c-f5d4396b6cf9\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:63:\\\"✅ Your check-up is completed. Please review the clinic notes.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760858048,\"delay\":null}', 0, NULL, 1760858048, 1760858048);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(50, 'default', '{\"uuid\":\"9969cf02-f281-4824-8fe5-747e68c944e1\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:63:\\\"✅ Your check-up is completed. Please review the clinic notes.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760936969,\"delay\":null}', 0, NULL, 1760936970, 1760936970),
(51, 'default', '{\"uuid\":\"a81e2015-55e7-4269-8edd-959fa2c8fb5e\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760964833,\"delay\":null}', 0, NULL, 1760964833, 1760964833),
(52, 'default', '{\"uuid\":\"55b77023-f0a6-45cf-90a7-3ffc36a219b1\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Oct 20, 2025 12:59 PM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1760964868,\"delay\":null}', 0, NULL, 1760964868, 1760964868),
(53, 'default', '{\"uuid\":\"7e697418-f827-4d5f-afcf-290a265d3a34\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1761367370,\"delay\":null}', 0, NULL, 1761367370, 1761367370),
(54, 'default', '{\"uuid\":\"19f10fc8-329b-4c6a-82cd-69a5175e1b6f\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Oct 25, 2025 04:48 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1761367421,\"delay\":null}', 0, NULL, 1761367421, 1761367421),
(55, 'default', '{\"uuid\":\"c6018142-00d3-4e17-97ac-8dd66b7f825b\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":1:{s:7:\\\"message\\\";s:63:\\\"✅ Your check-up is completed. Please review the clinic notes.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1761367448,\"delay\":null}', 0, NULL, 1761367448, 1761367448),
(56, 'default', '{\"uuid\":\"013b1655-245d-41d2-a146-cf7c7434ba7f\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:1;s:7:\\\"message\\\";s:30:\\\"Test notification from Tinker!\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1761987240,\"delay\":null}', 0, NULL, 1761987240, 1761987240),
(57, 'default', '{\"uuid\":\"09a4050f-c5a5-4411-a4f8-059e9b129d96\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:2;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1761990252,\"delay\":null}', 0, NULL, 1761990252, 1761990252),
(58, 'default', '{\"uuid\":\"de1363e2-9169-4100-80d3-2e8cd68ec304\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:2;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1761991442,\"delay\":null}', 0, NULL, 1761991442, 1761991442),
(59, 'default', '{\"uuid\":\"04937519-01f2-483d-bce6-25bc490b65c0\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:2;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1764750007,\"delay\":null}', 0, NULL, 1764750007, 1764750007),
(60, 'default', '{\"uuid\":\"29e48631-9f29-430c-b770-192df5ac90d7\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Dec 03, 2025 08:25 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1764750031,\"delay\":null}', 0, NULL, 1764750031, 1764750031),
(61, 'default', '{\"uuid\":\"9427d306-5da7-4a7e-b0a4-6ebab9bb7050\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:56:\\\"📢 Your appointment request was declined by the nurse.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1764761189,\"delay\":null}', 0, NULL, 1764761189, 1764761189),
(62, 'default', '{\"uuid\":\"5ef234f7-0667-4da1-861f-f60fa50e75ad\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:2;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1767695431,\"delay\":null}', 0, NULL, 1767695431, 1767695431),
(63, 'default', '{\"uuid\":\"1179d764-4552-435d-9067-ba5faa6abe7a\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:2;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769161359,\"delay\":null}', 0, NULL, 1769161359, 1769161359),
(64, 'default', '{\"uuid\":\"2dcdf9ba-281f-4690-a78b-43a054849bbd\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:6;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769161359,\"delay\":null}', 0, NULL, 1769161359, 1769161359),
(65, 'default', '{\"uuid\":\"b729479d-a610-461c-ac98-f11cb02503e9\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Jan 23, 2026 10:05 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769162410,\"delay\":null}', 0, NULL, 1769162410, 1769162410),
(66, 'default', '{\"uuid\":\"0ca5493b-2fe9-4cb8-8670-5be1b6a0c18f\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:62:\\\"⏰ Reminder: You have a clinic appointment today at 10:05 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769163630,\"delay\":null}', 0, NULL, 1769163630, 1769163630),
(67, 'default', '{\"uuid\":\"564dc2b1-1e57-41e8-8eac-c46ddfe46f52\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:2;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769165743,\"delay\":null}', 0, NULL, 1769165743, 1769165743),
(68, 'default', '{\"uuid\":\"508b5ad7-0b64-47d8-811c-f32bd40bfb7f\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:6;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769165743,\"delay\":null}', 0, NULL, 1769165743, 1769165743),
(69, 'default', '{\"uuid\":\"819c89d5-f6c7-4086-8501-c1803e07f95a\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Jan 23, 2026 11:01 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769165776,\"delay\":null}', 0, NULL, 1769165776, 1769165776),
(70, 'default', '{\"uuid\":\"ca5eb599-fc6a-4e87-8307-915cdb9ef4b3\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:42:\\\"🩺 Your appointment session has started.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769166926,\"delay\":null}', 0, NULL, 1769166926, 1769166926),
(71, 'default', '{\"uuid\":\"33e442f6-d44b-44ef-80d4-9d7933152583\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:73:\\\"📢 Your check-up has been completed. Thank you for visiting the clinic.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769166931,\"delay\":null}', 0, NULL, 1769166931, 1769166931),
(72, 'default', '{\"uuid\":\"1ee8945b-7ee1-495f-bb62-c7db8074e4c7\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:42:\\\"🩺 Your appointment session has started.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769166934,\"delay\":null}', 0, NULL, 1769166934, 1769166934),
(73, 'default', '{\"uuid\":\"a8fa32db-166a-4802-b7e8-040b1ed4fd7c\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:73:\\\"📢 Your check-up has been completed. Thank you for visiting the clinic.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769166939,\"delay\":null}', 0, NULL, 1769166939, 1769166939),
(74, 'default', '{\"uuid\":\"0a69dc98-db68-4ccc-a46a-5fd1dfe4c618\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:2;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769166983,\"delay\":null}', 0, NULL, 1769166983, 1769166983),
(75, 'default', '{\"uuid\":\"786e7ae8-2f16-4b13-99fd-2604b549ce65\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:6;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769166983,\"delay\":null}', 0, NULL, 1769166983, 1769166983),
(76, 'default', '{\"uuid\":\"408e343c-1750-4231-93f3-57318f16c1cb\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Jan 23, 2026 11:28 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769167436,\"delay\":null}', 0, NULL, 1769167436, 1769167436),
(77, 'default', '{\"uuid\":\"14e29f2f-87d5-4605-9c1d-128a43f3cca8\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:42:\\\"🩺 Your appointment session has started.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769167444,\"delay\":null}', 0, NULL, 1769167444, 1769167444),
(78, 'default', '{\"uuid\":\"795beff0-6790-4230-80b8-ddd196e41a46\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:73:\\\"📢 Your check-up has been completed. Thank you for visiting the clinic.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769167449,\"delay\":null}', 0, NULL, 1769167449, 1769167449),
(79, 'default', '{\"uuid\":\"302cb4e9-2334-4eee-97a8-16ffb9f84ed7\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:2;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769167531,\"delay\":null}', 0, NULL, 1769167531, 1769167531),
(80, 'default', '{\"uuid\":\"e9721a17-c838-4d75-8bd0-e1745b14b7db\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:6;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769167531,\"delay\":null}', 0, NULL, 1769167531, 1769167531),
(81, 'default', '{\"uuid\":\"7f9e1060-cc23-4e69-984e-b35146ba3bfd\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Jan 23, 2026 11:30 AM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769167546,\"delay\":null}', 0, NULL, 1769167546, 1769167546),
(82, 'default', '{\"uuid\":\"3616d508-19a7-4139-b1f1-c46d7d19b313\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:2;s:7:\\\"message\\\";s:37:\\\"📅 New appointment request from zxc\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770737969,\"delay\":null}', 0, NULL, 1770737969, 1770737969),
(83, 'default', '{\"uuid\":\"bf4b4405-6d58-44c8-a771-2848839745c7\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:6;s:7:\\\"message\\\";s:37:\\\"📅 New appointment request from zxc\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770737969,\"delay\":null}', 0, NULL, 1770737969, 1770737969),
(84, 'default', '{\"uuid\":\"25da3df2-5578-4ee6-bc27-e838fd6b889e\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:10;s:7:\\\"message\\\";s:37:\\\"📅 New appointment request from zxc\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770737969,\"delay\":null}', 0, NULL, 1770737969, 1770737969),
(85, 'default', '{\"uuid\":\"eedda33a-6f06-482e-b899-82f613f34eff\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:11;s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Feb 10, 2026 03:44 PM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770737986,\"delay\":null}', 0, NULL, 1770737986, 1770737986),
(86, 'default', '{\"uuid\":\"0f49ef85-bdc9-4f98-99b4-4b5f6286528a\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:11;s:7:\\\"message\\\";s:42:\\\"🩺 Your appointment session has started.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770737989,\"delay\":null}', 0, NULL, 1770737989, 1770737989),
(87, 'default', '{\"uuid\":\"bb073327-c9d3-458f-8b23-681022d02a9b\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:11;s:7:\\\"message\\\";s:73:\\\"📢 Your check-up has been completed. Thank you for visiting the clinic.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1770738002,\"delay\":null}', 0, NULL, 1770738002, 1770738002),
(88, 'default', '{\"uuid\":\"4d59ea9d-7ba2-4e15-a44a-f0092f7eb5cf\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:2;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1771099016,\"delay\":null}', 0, NULL, 1771099016, 1771099016),
(89, 'default', '{\"uuid\":\"b680e38c-ba9d-4ba7-b3d3-f36109fc40c9\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:6;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1771099016,\"delay\":null}', 0, NULL, 1771099016, 1771099016),
(90, 'default', '{\"uuid\":\"8d0ddca8-47c4-44e3-999d-435c6f69cc39\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:10;s:7:\\\"message\\\";s:46:\\\"📅 New appointment request from Student User\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1771099016,\"delay\":null}', 0, NULL, 1771099016, 1771099016),
(91, 'default', '{\"uuid\":\"0e187e11-3c9a-4040-aae6-9c6d407bce9a\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:66:\\\"📢 Your appointment has been approved for Feb 14, 2026 08:02 PM.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1771099051,\"delay\":null}', 0, NULL, 1771099051, 1771099051),
(92, 'default', '{\"uuid\":\"2a52edf2-05b8-4240-b30c-e1a378d8dc9c\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:42:\\\"🩺 Your appointment session has started.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1771099054,\"delay\":null}', 0, NULL, 1771099054, 1771099054),
(93, 'default', '{\"uuid\":\"58e2a56d-c2a9-4c2d-a5fb-75ca88b36f65\",\"displayName\":\"App\\\\Events\\\\NewNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:26:\\\"App\\\\Events\\\\NewNotification\\\":2:{s:6:\\\"userId\\\";i:3;s:7:\\\"message\\\";s:73:\\\"📢 Your check-up has been completed. Thank you for visiting the clinic.\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1771099065,\"delay\":null}', 0, NULL, 1771099065, 1771099065);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2025_08_13_113254_create_patients_table', 1),
(5, '2025_08_13_113359_create_appointments_table', 1),
(6, '2025_08_16_163432_add_user_id_to_appointments_table', 1),
(7, '2025_09_07_125018_create_personal_access_tokens_table', 1),
(8, '2025_10_01_130929_create_notifications_table', 1),
(9, '2025_10_02_064512_add_otp_to_users_table', 1),
(10, '2025_10_04_131007_create_sessions_table', 1),
(11, '2025_10_06_123037_create_guardian_sms_logs_table', 2),
(12, '2025_10_07_121425_add_sent_by_to_guardian_sms_logs_table', 3),
(13, '2025_10_07_121824_add_sent_by_id_and_role_to_guardian_sms_logs_table', 4),
(14, '2025_10_07_131723_add_sms_flags_to_appointments_table', 5),
(15, '2025_10_13_114750_sync_cancelled_enum_in_appointments_table', 6),
(16, '2025_10_19_064821_add_completion_fields_to_appointments_table', 7),
(17, '2025_10_19_071307_create_appointment_completions_table', 8),
(18, '2025_10_20_052603_create_emergency_records_table', 9),
(19, '2026_01_06_084244_add_is_verified_to_users_table', 10),
(20, '2026_01_23_101509_add_morning_notified_to_appointments', 11),
(21, '2026_01_30_133452_add_fields_to_emergency_records_table', 12),
(22, '2026_02_14_185824_remove_user_id_from_appointments', 13),
(23, '2026_02_14_185917_add_in_session_to_appointments_status', 14),
(24, '2026_02_14_195513_add_reason_and_preferred_time_to_appointments', 15);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('050d4a53-4894-4568-81b9-dfdc541a7946', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 6, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', NULL, '2026-01-23 03:25:31', '2026-01-23 03:25:31'),
('0646f707-653f-4fea-b74d-6edfe5b94abb', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 2, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', '2026-01-28 01:53:49', '2026-01-23 03:16:23', '2026-01-28 01:53:49'),
('075c5b41-1898-4526-9135-ef2661ce52ac', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 6, '{\"message\":\"\\ud83d\\udcc5 New appointment request from zxc\"}', NULL, '2026-02-10 07:39:29', '2026-02-10 07:39:29'),
('0ea5c265-7602-441f-b5be-64140264d419', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 2, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', '2026-01-28 01:53:49', '2026-01-23 02:55:43', '2026-01-28 01:53:49'),
('11735fc9-0373-4821-b7e3-3b4b51c97c0c', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83d\\udce2 Your appointment has been approved for Feb 14, 2026 08:02 PM.\"}', '2026-02-14 11:58:16', '2026-02-14 11:57:31', '2026-02-14 11:58:16'),
('1241e3d0-f1bc-40bd-9f7e-f13a902bd8fd', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\u2705 Your account has been verified. You may now access MedCare.\"}', '2026-01-06 02:13:03', '2026-01-06 01:45:23', '2026-01-06 02:13:03'),
('1e2c3a1b-0287-4e90-b59c-8b7295d86d14', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83e\\ude7a Your appointment session has started.\"}', '2026-02-14 11:58:16', '2026-01-23 03:15:26', '2026-02-14 11:58:16'),
('27993e49-38e7-425b-ab6f-5435a5b7131d', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 6, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', NULL, '2026-01-23 03:16:23', '2026-01-23 03:16:23'),
('27b32b1d-4d8c-436d-b8c9-ecb7220f74f5', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 2, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', '2026-01-28 01:53:49', '2026-01-23 03:25:31', '2026-01-28 01:53:49'),
('297661bc-0615-4649-966e-8f0961a0a7f3', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 2, '{\"message\":\"\\ud83d\\udcc5 New appointment request from zxc\"}', '2026-02-10 07:40:06', '2026-02-10 07:39:29', '2026-02-10 07:40:06'),
('3108c4c2-b320-4943-8305-694c3b35d7f4', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 6, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', NULL, '2026-01-23 01:42:39', '2026-01-23 01:42:39'),
('327b33cc-76f0-4b26-9c4d-3852db48bbd6', 'Illuminate\\Notifications\\Notification@anonymous\0C:\\xampp\\htdocs\\medcare-system\\app\\Http\\Controllers\\AppointmentController.php:429$1617', 'App\\Models\\User', 2, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', '2025-12-25 10:05:12', '2025-12-03 00:20:07', '2025-12-25 10:05:12'),
('34498830-fa0a-4c68-922a-7bb737567d7f', 'Illuminate\\Notifications\\Notification@anonymous\0C:\\xampp\\htdocs\\medcare-system\\app\\Http\\Controllers\\AppointmentController.php:429$1f1a', 'App\\Models\\User', 3, '{\"message\":\"\\ud83d\\udce2 Your appointment has been approved for Dec 03, 2025 08:25 AM.\"}', '2026-01-06 02:13:03', '2025-12-03 00:20:31', '2026-01-06 02:13:03'),
('3f461d56-fd82-4de8-97ab-132b4aa9eb3a', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 2, '{\"message\":\"\\u2705 Your account has been verified. You may now access MedCare.\"}', '2026-01-06 02:12:36', '2026-01-06 01:38:15', '2026-01-06 02:12:36'),
('46957929-fabb-4b1d-a002-b08cb3199418', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 2, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', '2026-01-28 01:53:49', '2026-01-23 01:42:39', '2026-01-28 01:53:49'),
('492335fc-067b-4c07-a31a-97042504d611', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 10, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', NULL, '2026-02-14 11:56:56', '2026-02-14 11:56:56'),
('4cfe4872-f8ae-4a87-81b4-190d7a98b80d', 'Illuminate\\Notifications\\Notification@anonymous\0C:\\xampp\\htdocs\\medcare-system\\app\\Http\\Controllers\\AppointmentController.php:429$1ec6', 'App\\Models\\User', 2, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', '2025-11-01 02:04:32', '2025-11-01 02:04:02', '2025-11-01 02:04:32'),
('4facc420-880a-47a0-a5d9-5b24b7dbd7ce', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\u2705 Your account has been verified. You may now access MedCare.\"}', '2026-01-06 02:13:03', '2026-01-06 01:40:36', '2026-01-06 02:13:03'),
('53b9b91b-cac1-4679-9899-95e3f0224205', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 8, '{\"message\":\"\\u2705 Your account has been verified. You may now access MedCare.\"}', NULL, '2026-01-30 06:03:20', '2026-01-30 06:03:20'),
('6641838f-ac29-48e7-b07b-c1dad6ed1c86', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 2, '{\"message\":\"\\u2705 Your account has been verified. You may now access MedCare.\"}', '2026-01-06 02:12:36', '2026-01-06 01:45:20', '2026-01-06 02:12:36'),
('68dbf048-1fe2-40c3-bbd6-ee614c4e2c6f', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83d\\udce2 Your check-up has been completed. Thank you for visiting the clinic.\"}', '2026-02-14 11:58:16', '2026-01-23 03:15:39', '2026-02-14 11:58:16'),
('6b247726-e526-407c-8de6-662ecc49f5a1', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83d\\udce2 Your appointment has been approved for Jan 23, 2026 11:01 AM.\"}', '2026-02-14 11:58:16', '2026-01-23 02:56:16', '2026-02-14 11:58:16'),
('7258bcec-79a6-438d-8d89-d49ab64c54e4', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 6, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', NULL, '2026-02-14 11:56:56', '2026-02-14 11:56:56'),
('7f738076-11ea-447c-a13a-c4b34e29915f', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 11, '{\"message\":\"\\ud83d\\udce2 Your check-up has been completed. Thank you for visiting the clinic.\"}', NULL, '2026-02-10 07:40:02', '2026-02-10 07:40:02'),
('82844573-5a6f-47b1-85ea-3eb2704a2650', 'Illuminate\\Notifications\\Notification@anonymous\0C:\\xampp\\htdocs\\medcare-system\\app\\Http\\Controllers\\AppointmentController.php:429$ab62', 'App\\Models\\User', 3, '{\"message\":\"\\ud83d\\udce2 Your appointment request was declined by the nurse.\"}', '2026-01-06 02:13:03', '2025-12-03 03:26:29', '2026-01-06 02:13:03'),
('87c0a13e-60f9-462d-bfe2-240ab86cbd6f', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83d\\udce2 Your appointment has been approved for Jan 23, 2026 11:28 AM.\"}', '2026-02-14 11:58:16', '2026-01-23 03:23:56', '2026-02-14 11:58:16'),
('8873e0f0-c333-4039-8605-1e33b6dd3e52', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83e\\ude7a Your appointment session has started.\"}', '2026-02-14 11:58:16', '2026-01-23 03:15:34', '2026-02-14 11:58:16'),
('8f841a5c-50ab-4596-8900-db7e14db9904', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83d\\udce2 Your check-up has been completed. Thank you for visiting the clinic.\"}', '2026-02-14 11:58:16', '2026-01-23 03:24:09', '2026-02-14 11:58:16'),
('98e31e64-d6f4-480d-addc-a96852dc01a7', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 10, '{\"message\":\"\\ud83d\\udcc5 New appointment request from zxc\"}', NULL, '2026-02-10 07:39:29', '2026-02-10 07:39:29'),
('ab982b61-e4f7-48a9-9a88-976a43630f8d', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 11, '{\"message\":\"\\ud83d\\udce2 Your appointment has been approved for Feb 10, 2026 03:44 PM.\"}', NULL, '2026-02-10 07:39:46', '2026-02-10 07:39:46'),
('abbb07f1-50b0-4987-8b95-2d6c7a462177', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83e\\ude7a Your appointment session has started.\"}', '2026-02-14 11:58:16', '2026-02-14 11:57:34', '2026-02-14 11:58:16'),
('af135bce-91c8-4901-9b49-7f11cafd261e', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83d\\udce2 Your check-up has been completed. Thank you for visiting the clinic.\"}', '2026-02-14 11:58:16', '2026-01-23 03:15:31', '2026-02-14 11:58:16'),
('b67d9236-14d0-4250-9b99-0e970bfdddf5', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 6, '{\"message\":\"\\u2705 Your account has been verified. You may now access MedCare.\"}', NULL, '2026-01-23 03:26:55', '2026-01-23 03:26:55'),
('c0f26c94-6be9-4815-a802-0fa54a16349e', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 2, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', NULL, '2026-02-14 11:56:55', '2026-02-14 11:56:55'),
('c9b6bd80-58fd-4e62-935d-ca69be113331', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 11, '{\"message\":\"\\ud83e\\ude7a Your appointment session has started.\"}', NULL, '2026-02-10 07:39:49', '2026-02-10 07:39:49'),
('cc2539e0-fe29-4932-85f1-d080fe122176', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 2, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', '2026-01-06 10:55:25', '2026-01-06 02:30:31', '2026-01-06 10:55:25'),
('cd7b197c-117f-4b00-b829-06d219da0573', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 2, '{\"message\":\"\\u2705 Your account has been verified. You may now access MedCare.\"}', '2026-01-06 02:12:36', '2026-01-06 01:40:34', '2026-01-06 02:12:36'),
('d0afa50c-d168-4bcb-b027-b0cc188869d4', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\u2705 Your account has been verified. You may now access MedCare.\"}', '2026-01-06 02:13:03', '2026-01-06 01:38:56', '2026-01-06 02:13:03'),
('d0d5c30f-877a-4733-9e24-1cf047f82b9a', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83e\\ude7a Your appointment session has started.\"}', '2026-02-14 11:58:16', '2026-01-23 03:24:04', '2026-02-14 11:58:16'),
('d4fc9b67-a5a3-4e3a-bbda-d59fffdf256c', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83d\\udce2 Your check-up has been completed. Thank you for visiting the clinic.\"}', '2026-02-14 11:58:16', '2026-02-14 11:57:45', '2026-02-14 11:58:16'),
('e9728c3a-7cf3-4934-bff6-490a48710590', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83d\\udce2 Your appointment has been approved for Jan 23, 2026 10:05 AM.\"}', '2026-02-14 11:58:16', '2026-01-23 02:00:10', '2026-02-14 11:58:16'),
('ea7c420d-066d-414a-ac30-8d677be202b1', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 7, '{\"message\":\"\\u2705 Your account has been verified. You may now access MedCare.\"}', NULL, '2026-01-23 03:26:57', '2026-01-23 03:26:57'),
('eb3bf8c0-0e0e-4a64-9da3-1ce758b4b771', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 6, '{\"message\":\"\\ud83d\\udcc5 New appointment request from Student User\"}', NULL, '2026-01-23 02:55:43', '2026-01-23 02:55:43'),
('f50efd8b-b49a-4f57-be61-07668585c642', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\u23f0 Reminder: You have a clinic appointment today at 10:05 AM.\"}', '2026-02-14 11:58:16', '2026-01-23 02:20:30', '2026-02-14 11:58:16'),
('f733706e-e38a-42f6-aa78-5411014bcd26', 'App\\Notifications\\UserNotification', 'App\\Models\\User', 3, '{\"message\":\"\\ud83d\\udce2 Your appointment has been approved for Jan 23, 2026 11:30 AM.\"}', '2026-02-14 11:58:16', '2026-01-23 03:25:46', '2026-02-14 11:58:16');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('DNFWhVr99SyGsR9uQMKx2DAK3mvAncnyo1SEO0fz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlpwcjQ2SXVMQktNWDg0VHJqSGRYMmxnZ1B3Wk05bjl0TjV2U2lPeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ub3RpZmljYXRpb25zL2NoZWNrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771099103),
('DsLwkOv2HZoCfXyDsAITOvkwbHr2D1cprjWqivqQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjk3RmdMekluUTBpbjZJUHVEYnVLejgzM2RJalNOODJDUEF2RUdscSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1771099750);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'student',
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `is_verified`, `remember_token`, `created_at`, `updated_at`, `otp`, `otp_expires_at`) VALUES
(1, 'Admin User', 'dwightgacad@gmail.com', NULL, '$2y$12$drzo9zbcZpkx972fdJSpE.L6xxt8QNQ9dU8pOc6zAeaZU9hPzUQU2', 'admin', 1, NULL, '2025-10-04 05:31:31', '2025-10-04 05:32:12', NULL, NULL),
(2, 'Nurse User', 'nurse@example.com', NULL, '$2y$12$ZNd0IvO/g2PZpDnr4AWeZ.IwKk0StIMzChVUTem6.tJsTA8BRlq3O', 'nurse', 1, NULL, '2025-10-04 05:31:31', '2026-01-06 01:45:20', NULL, NULL),
(3, 'Student User', 'student@example.com', NULL, '$2y$12$aipQMCbu/aSrIBgu5iZWLewH40V6YZJJC2nLvHKXdJwyS9kTbvK7G', 'student', 1, NULL, '2025-10-04 05:31:31', '2026-01-06 01:45:23', NULL, NULL),
(4, 'shes', 'sample@sample.com', NULL, '$2y$12$s/./1S2/HQidDTIW4fWsu.YiApWokDc4PJroa47mdchKMx54fIBUG', 'admin', 0, NULL, '2026-01-18 02:56:35', '2026-01-18 02:56:35', NULL, NULL),
(5, 'edward', 'edward@gmail.com', NULL, '$2y$12$OR.GW8lFTXb6BllNbybQqeAuv5szErElCqWcPzs3HHZ3QBEv5ko8m', 'admin', 0, NULL, '2026-01-18 05:58:01', '2026-01-18 05:58:01', NULL, NULL),
(6, 'sesa', 'sea@gmail.com', NULL, '$2y$12$bV6It9yXjnXYPhbiLLUcQegxghwdQXrPnqXW0gi.ZeemHCLXozol2', 'nurse', 1, NULL, '2026-01-18 05:58:56', '2026-01-23 03:26:54', NULL, NULL),
(7, 'ge', 'gacadedward017@gmail.com', NULL, '$2y$12$4mY6RVLENgaex1hd40jjGuHfwfXg3NSCkILRCQ4GV9FYThGZ5IPtC', 'student', 1, NULL, '2026-01-18 06:00:07', '2026-01-23 03:26:57', NULL, NULL),
(8, 'sheshab', 'ey@example.com', NULL, '$2y$12$9B3YTdit2ncxfXAYO0brieMrtVcl8YCdJ/mdV3foyB.1NYH6J7mSC', 'student', 1, NULL, '2026-01-30 06:02:45', '2026-01-30 06:03:20', NULL, NULL),
(9, 'asdasd', 'asdas@se.com', NULL, '$2y$12$xWYeMTenpFCDvfayOFXJsuWNCbxKLFuaNggFxWeS0NMhADIFTWQQO', 'admin', 0, NULL, '2026-02-10 07:25:46', '2026-02-10 07:25:46', NULL, NULL),
(10, 'asdzxd', 'zxd@easd.com', NULL, '$2y$12$MxYyAnzdPsNo/MXQspTCUOO6eO8Fkc7.xm1U0Jj.djr7SHtamRoay', 'nurse', 0, NULL, '2026-02-10 07:26:19', '2026-02-10 07:26:19', NULL, NULL),
(11, 'zxc', 'zxcz@m.com', NULL, '$2y$12$VZCH4.q9HIqriHfCWFNY1ewNKaqqmlPQsssreiGFx0DQJ961Qg8jW', 'student', 0, NULL, '2026-02-10 07:39:13', '2026-02-10 07:39:13', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_student_id_foreign` (`student_id`),
  ADD KEY `appointments_approved_by_foreign` (`approved_by`),
  ADD KEY `appointments_requested_datetime_index` (`requested_datetime`),
  ADD KEY `appointments_approved_datetime_index` (`approved_datetime`),
  ADD KEY `appointments_status_index` (`status`);

--
-- Indexes for table `appointment_completions`
--
ALTER TABLE `appointment_completions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_completions_appointment_id_foreign` (`appointment_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `emergency_records`
--
ALTER TABLE `emergency_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emergency_records_student_id_foreign` (`student_id`),
  ADD KEY `emergency_records_reported_by_foreign` (`reported_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `guardian_sms_logs`
--
ALTER TABLE `guardian_sms_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patients_email_unique` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `appointment_completions`
--
ALTER TABLE `appointment_completions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `emergency_records`
--
ALTER TABLE `emergency_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guardian_sms_logs`
--
ALTER TABLE `guardian_sms_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointment_completions`
--
ALTER TABLE `appointment_completions`
  ADD CONSTRAINT `appointment_completions_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `emergency_records`
--
ALTER TABLE `emergency_records`
  ADD CONSTRAINT `emergency_records_reported_by_foreign` FOREIGN KEY (`reported_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `emergency_records_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
