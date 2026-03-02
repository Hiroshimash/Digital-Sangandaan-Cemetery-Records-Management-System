-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2026 at 04:13 AM
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
-- Database: `sangandaan_cemetery`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `table_name`, `record_id`, `description`, `ip_address`, `created_at`) VALUES
(1, 5, 'CREATE', 'burial_records', 4, 'Created burial record for Gregorio Valdez', '::1', '2026-03-01 02:18:59'),
(2, 5, 'CREATE', 'burial_records', 5, 'Created burial record for Gregorio Valdez', '::1', '2026-03-01 02:19:02'),
(3, 5, 'CREATE', 'burial_records', 6, 'Created burial record for dawa', '::1', '2026-03-01 02:36:29'),
(4, 5, 'CREATE', 'burial_records', 7, 'Created burial record for Gregorio Valdez', '::1', '2026-03-01 02:46:41'),
(5, 5, 'DELETE', 'burial_records', 3, 'Deleted burial record for Pedro Reyes', '::1', '2026-03-01 02:48:42');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `appointment_id` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `appointment_type` enum('lot_viewing','burial_planning','payment','document_request','inquiry','other') NOT NULL,
  `preferred_date` date NOT NULL,
  `preferred_time` time NOT NULL,
  `alternate_date` date DEFAULT NULL,
  `alternate_time` time DEFAULT NULL,
  `purpose` text DEFAULT NULL,
  `lot_section` varchar(50) DEFAULT NULL,
  `lot_number` varchar(50) DEFAULT NULL,
  `deceased_name` varchar(100) DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `status` enum('pending','confirmed','completed','cancelled','rescheduled') DEFAULT 'pending',
  `priority` enum('normal','urgent') DEFAULT 'normal',
  `staff_notes` text DEFAULT NULL,
  `customer_notes` text DEFAULT NULL,
  `cancellation_reason` text DEFAULT NULL,
  `reschedule_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `appointment_id`, `user_id`, `customer_name`, `customer_email`, `customer_phone`, `appointment_type`, `preferred_date`, `preferred_time`, `alternate_date`, `alternate_time`, `purpose`, `lot_section`, `lot_number`, `deceased_name`, `relationship`, `status`, `priority`, `staff_notes`, `customer_notes`, `cancellation_reason`, `reschedule_count`, `created_at`, `updated_at`) VALUES
(1, 'APP-2024-0001', 1, 'John Doe', 'john@example.com', '09123456789', 'lot_viewing', '2026-02-22', '10:00:00', NULL, NULL, 'Interested in viewing available lots in Section A', 'Section A', NULL, NULL, NULL, 'confirmed', 'normal', NULL, NULL, NULL, 0, '2026-02-20 02:14:08', '2026-02-20 02:14:08'),
(2, 'APP-2024-0002', 1, 'John Doe', 'john@example.com', '09123456789', 'payment', '2026-02-20', '14:30:00', NULL, NULL, 'Process payment for lot reservation', NULL, NULL, NULL, NULL, 'completed', 'normal', '\n[2026-02-20 18:38:30] Status changed from pending to confirmed by Cemetery Staff. Notes: \n[2026-02-20 18:39:18] Status changed from confirmed to completed by Cemetery Staff. Notes: ', NULL, NULL, 0, '2026-02-20 02:14:08', '2026-02-20 17:39:18'),
(3, 'APP-2024-0003', 2, 'Jane Smith', 'jane@example.com', '09187654321', 'burial_planning', '2026-02-24', '09:00:00', '2026-02-28', '13:00:00', 'Plan burial arrangements for my father', 'Section B', 'B-456', NULL, NULL, 'rescheduled', 'normal', NULL, '\nReschedule requested to 2026-02-27 at 09:00:00. Reason: busy\nReschedule requested to 2026-02-28 at 13:00:00. Reason: csdcsscc', NULL, 2, '2026-02-20 02:14:08', '2026-02-20 16:58:16'),
(4, 'APP-2024-0004', 1, 'John Doe', 'john@example.com', '09123456789', 'inquiry', '2026-02-26', '11:00:00', NULL, NULL, 'Ask about cemetery rules and regulations', NULL, NULL, NULL, NULL, 'confirmed', 'normal', '\n[2026-02-20 03:58:30] Status changed from pending to confirmed by Cemetery Staff. Notes: ', NULL, NULL, 0, '2026-02-20 02:14:08', '2026-02-20 02:58:30'),
(5, 'APP-2026-0001', 2, 'Ronan James', 'ronan@gmail.com', '09382554205', 'lot_viewing', '2026-02-23', '16:00:00', '2026-03-02', '14:00:00', 'i want to see', 'B', '235', '', '', 'rescheduled', 'normal', '\n[2026-02-20 03:58:47] Status changed from pending to confirmed by Cemetery Staff. Notes: ', '\nReschedule requested to 2026-03-02 at 14:00:00. Reason: yes', NULL, 1, '2026-02-20 02:16:42', '2026-02-20 16:59:22'),
(6, 'APP-2026-0002', 2, 'Ronan James', 'ronan@gmail.com', '09382554205', 'lot_viewing', '2026-02-28', '09:00:00', NULL, NULL, 'efa ffeaewfafwa', 'Section D', '888', '', '', 'cancelled', 'normal', '\n[2026-02-20 18:51:19] Cemetery Staff: prio\n[2026-02-20 18:51:30] Cemetery Staff: ;rkl', NULL, 'Change of plans', 0, '2026-02-20 08:32:06', '2026-02-20 17:51:30'),
(7, 'APP-2026-0003', 2, 'Ronan James', 'ronan@gmail.com', '09382554205', 'payment', '2026-02-21', '16:00:00', NULL, NULL, 'buying lot', '', '', '', '', 'confirmed', 'normal', '\n[2026-02-20 18:20:30] Status changed from pending to completed by Cemetery Staff. Notes: \n[2026-02-20 18:39:05] Status changed from completed to confirmed by Cemetery Staff. Notes: ', NULL, NULL, 0, '2026-02-20 08:47:11', '2026-02-20 17:39:05'),
(8, 'APP-2026-0004', 2, 'Ronan James', 'ronan@gmail.com', '09382554205', 'lot_viewing', '2026-02-22', '09:00:00', NULL, NULL, 'awdwdaadw', 'Section F', '816', '', '', 'cancelled', 'normal', NULL, NULL, 'Schedule conflict', 0, '2026-02-20 17:34:56', '2026-02-20 17:36:53'),
(9, 'APP-2026-0005', 2, 'Ronan James', 'ronan@gmail.com', '09382554205', 'lot_viewing', '2026-02-28', '10:00:00', NULL, NULL, 'dawadadwa', '', '', '', '', 'pending', 'normal', NULL, NULL, NULL, 0, '2026-02-20 17:53:23', '2026-02-20 17:53:23'),
(10, 'APP-2026-0006', 2, 'Ronan James', 'ronan@gmail.com', '09382554205', 'burial_planning', '2026-03-14', '16:00:00', NULL, NULL, 'fawdfawdaawddaw', '', '', 'Gregorio Valdez', 'Father', 'pending', 'normal', NULL, NULL, NULL, 0, '2026-02-26 22:40:30', '2026-02-26 22:40:30');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_history`
--

CREATE TABLE `appointment_history` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `old_status` varchar(50) DEFAULT NULL,
  `new_status` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `performed_by` varchar(100) DEFAULT NULL,
  `performed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_history`
--

INSERT INTO `appointment_history` (`id`, `appointment_id`, `action`, `old_status`, `new_status`, `notes`, `performed_by`, `performed_at`) VALUES
(1, 1, 'created', NULL, 'pending', 'Appointment created by customer', 'John Doe', '2026-02-20 02:14:08'),
(2, 1, 'status_update', 'pending', 'confirmed', 'Confirmed by staff', 'Admin User', '2026-02-20 02:14:08'),
(3, 2, 'created', NULL, 'pending', 'Appointment created by customer', 'John Doe', '2026-02-20 02:14:08'),
(4, 5, 'created', NULL, NULL, 'Appointment created by customer', 'Ronan James', '2026-02-20 02:16:42'),
(5, 4, 'status_update', 'pending', 'confirmed', '', '5', '2026-02-20 02:58:30'),
(6, 5, 'status_update', 'pending', 'confirmed', '', '5', '2026-02-20 02:58:47'),
(7, 7, 'status_update', 'pending', 'completed', '', '5', '2026-02-20 17:20:30'),
(8, 2, 'status_update', 'pending', 'confirmed', '', '5', '2026-02-20 17:38:30'),
(9, 7, 'status_update', 'completed', 'confirmed', '', '5', '2026-02-20 17:39:05'),
(10, 2, 'status_update', 'confirmed', 'completed', '', '5', '2026-02-20 17:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_notifications`
--

CREATE TABLE `appointment_notifications` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('confirmation','reminder','cancellation','reschedule','update') NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_notifications`
--

INSERT INTO `appointment_notifications` (`id`, `appointment_id`, `user_id`, `type`, `message`, `is_read`, `created_at`) VALUES
(1, 5, 2, 'confirmation', 'Your appointment has been scheduled successfully. Reference #: APP-2026-0001', 0, '2026-02-20 02:16:42');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_reminders`
--

CREATE TABLE `appointment_reminders` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `reminder_type` enum('email','sms') NOT NULL,
  `reminder_time` datetime NOT NULL,
  `sent_status` tinyint(1) DEFAULT 0,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_reminders`
--

INSERT INTO `appointment_reminders` (`id`, `appointment_id`, `reminder_type`, `reminder_time`, `sent_status`, `sent_at`, `created_at`) VALUES
(1, 2, 'sms', '2026-02-19 18:59:39', 0, NULL, '2026-02-20 02:59:39'),
(2, 2, 'sms', '2026-02-19 19:01:23', 0, NULL, '2026-02-20 03:01:23');

-- --------------------------------------------------------

--
-- Table structure for table `burial_records`
--

CREATE TABLE `burial_records` (
  `id` int(11) NOT NULL,
  `deceased_name` varchar(255) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `death_date` date NOT NULL,
  `burial_date` date DEFAULT NULL,
  `niche_number` varchar(50) DEFAULT NULL,
  `lot_number` varchar(50) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `status` enum('pending','approved','completed') DEFAULT 'pending',
  `interested_name` varchar(255) NOT NULL,
  `interested_relationship` varchar(100) DEFAULT NULL,
  `interested_contact` varchar(50) DEFAULT NULL,
  `interested_email` varchar(255) DEFAULT NULL,
  `interested_address` text DEFAULT NULL,
  `cause_of_death` varchar(255) DEFAULT NULL,
  `interment_type` enum('inurnment','interment','transfer') DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `burial_records`
--

INSERT INTO `burial_records` (`id`, `deceased_name`, `birth_date`, `death_date`, `burial_date`, `niche_number`, `lot_number`, `section`, `status`, `interested_name`, `interested_relationship`, `interested_contact`, `interested_email`, `interested_address`, `cause_of_death`, `interment_type`, `notes`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Ricardo Santos', '1950-03-15', '2024-03-10', '2024-03-15', NULL, '123', 'B', 'pending', 'Maria Santos', 'Spouse', '09123456789', NULL, NULL, 'Natural Causes', 'interment', 'Family requested traditional service', 1, '2026-03-01 02:14:05', NULL, NULL),
(2, 'Elena Cruz', '1935-07-22', '2024-03-08', '2024-03-18', NULL, '456', 'A', 'approved', 'Juan Cruz', 'Son', '09234567890', NULL, NULL, 'Old Age', 'interment', 'With memorial service', 1, '2026-03-01 02:14:05', NULL, NULL),
(4, 'Gregorio Valdez', '2026-02-28', '2026-02-14', '2026-03-01', '123', 'A-123', 'A', 'approved', 'Kunihiru', 'Parent', '123', 'ronan@gmail.com', '', 'heart attack', '', '', 5, '2026-03-01 02:18:59', NULL, NULL),
(5, 'Gregorio Valdez', '2026-02-28', '2026-02-14', '2026-03-01', '123', 'A-123', 'A', 'approved', 'Kunihiru', 'Parent', '123', 'ronan@gmail.com', '', 'heart attack', '', '', 5, '2026-03-01 02:19:02', NULL, NULL),
(6, 'dawa', '2026-02-09', '2026-03-14', '2026-03-04', 'dawwda', 'dawawd', 'B', 'pending', 'dwawad', 'dawwad', 'dwawda', 'dawdwadawd@gmail.com', 'wdawda', 'dawwda', NULL, 'waddawwda', 5, '2026-03-01 02:36:29', NULL, NULL),
(7, 'Gregorio Valdez', '2006-07-06', '2026-02-28', '2026-03-14', '1231', '133213', 'B', 'pending', 'dawdawdaw', 'awdwdaawd', 'dwaawdawd', 'dawawd@gmail.com', NULL, 'heart attack', NULL, NULL, 5, '2026-03-01 02:46:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cemetery_lots`
--

CREATE TABLE `cemetery_lots` (
  `id` int(11) NOT NULL,
  `lot_id` varchar(20) NOT NULL,
  `section_id` int(11) NOT NULL,
  `lot_number` varchar(20) NOT NULL,
  `row_number` int(11) DEFAULT NULL,
  `column_number` int(11) DEFAULT NULL,
  `lot_type` enum('single','double','family','columbarium') DEFAULT 'single',
  `size_sqm` decimal(5,2) NOT NULL,
  `price_rent` decimal(10,2) NOT NULL,
  `price_buy` decimal(10,2) NOT NULL,
  `status` enum('available','reserved','occupied','maintenance','sold') DEFAULT 'available',
  `occupancy_status` enum('vacant','partially_occupied','fully_occupied') DEFAULT 'vacant',
  `max_occupants` int(11) DEFAULT 1,
  `current_occupants` int(11) DEFAULT 0,
  `features` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cemetery_lots`
--

INSERT INTO `cemetery_lots` (`id`, `lot_id`, `section_id`, `lot_number`, `row_number`, `column_number`, `lot_type`, `size_sqm`, `price_rent`, `price_buy`, `status`, `occupancy_status`, `max_occupants`, `current_occupants`, `features`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 'A-001', 1, '001', 1, 1, 'single', 4.50, 2250.00, 54000.00, 'reserved', 'vacant', 1, 0, 'Near garden, peaceful location', NULL, '2026-02-26 20:58:22', '2026-02-28 04:00:37'),
(2, 'A-002', 1, '002', 1, 2, 'single', 4.50, 2250.00, 54000.00, 'reserved', 'vacant', 1, 0, 'Shaded area', NULL, '2026-02-26 20:58:22', '2026-02-27 16:41:29'),
(3, 'A-003', 1, '003', 1, 3, 'double', 7.20, 3600.00, 86400.00, 'reserved', 'vacant', 2, 0, 'Corner lot', NULL, '2026-02-26 20:58:22', '2026-02-26 20:58:22'),
(4, 'A-004', 1, '004', 2, 1, 'single', 4.50, 2250.00, 54000.00, 'reserved', 'fully_occupied', 1, 1, '\n[Status Update: 6]', NULL, '2026-02-26 20:58:22', '2026-02-28 04:05:31'),
(5, 'A-005', 1, '005', 2, 2, 'family', 12.00, 6000.00, 144000.00, 'reserved', 'vacant', 4, 0, 'Family lot, can accommodate up to 4', NULL, '2026-02-26 20:58:22', '2026-02-26 21:08:57'),
(6, 'B-001', 2, '001', 1, 1, 'single', 4.50, 2700.00, 67500.00, 'reserved', 'vacant', 1, 0, 'Near chapel', NULL, '2026-02-26 20:58:22', '2026-02-26 21:47:17'),
(7, 'B-002', 2, '002', 1, 2, 'double', 7.20, 4320.00, 108000.00, 'available', 'vacant', 2, 0, 'Premium location', NULL, '2026-02-26 20:58:22', '2026-02-26 20:58:22'),
(8, 'B-003', 2, '003', 1, 3, 'single', 4.50, 2700.00, 67500.00, 'available', 'fully_occupied', 1, 1, '\n[Status Update: ]', NULL, '2026-02-26 20:58:22', '2026-02-28 04:05:46'),
(9, 'C-001', 3, '001', 1, 1, 'columbarium', 1.50, 825.00, 20250.00, 'available', 'vacant', 1, 0, 'Wall niche', NULL, '2026-02-26 20:58:22', '2026-02-26 20:58:22'),
(10, 'C-002', 3, '002', 1, 2, 'single', 4.50, 2475.00, 60750.00, 'available', 'vacant', 1, 0, 'Near water feature', NULL, '2026-02-26 20:58:22', '2026-02-26 20:58:22');

-- --------------------------------------------------------

--
-- Table structure for table `cemetery_sections`
--

CREATE TABLE `cemetery_sections` (
  `id` int(11) NOT NULL,
  `section_code` varchar(10) NOT NULL,
  `section_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `total_lots` int(11) DEFAULT 0,
  `available_lots` int(11) DEFAULT 0,
  `occupied_lots` int(11) DEFAULT 0,
  `reserved_lots` int(11) DEFAULT 0,
  `price_per_sqm_rent` decimal(10,2) DEFAULT NULL,
  `price_per_sqm_buy` decimal(10,2) DEFAULT NULL,
  `color_code` varchar(20) DEFAULT '#4CAF50',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cemetery_sections`
--

INSERT INTO `cemetery_sections` (`id`, `section_code`, `section_name`, `description`, `total_lots`, `available_lots`, `occupied_lots`, `reserved_lots`, `price_per_sqm_rent`, `price_per_sqm_buy`, `color_code`, `created_at`) VALUES
(1, 'A', 'Garden of Peace', 'Peaceful garden section with mature trees', 50, 0, 0, 5, 500.00, 12000.00, '#4CAF50', '2026-02-26 20:58:22'),
(2, 'B', 'Holy Cross', 'Traditional Catholic section', 45, 2, 0, 1, 600.00, 15000.00, '#2196F3', '2026-02-26 20:58:22'),
(3, 'C', 'Remembrance Grove', 'Quiet memorial grove', 40, 12, 25, 3, 550.00, 13500.00, '#9C27B0', '2026-02-26 20:58:22'),
(4, 'D', 'Veterans Memorial', 'Honoring our fallen heroes', 30, 5, 22, 3, 700.00, 18000.00, '#F44336', '2026-02-26 20:58:22'),
(5, 'E', 'Sunrise Garden', 'Beautiful sunrise view section', 35, 20, 12, 3, 450.00, 11000.00, '#FF9800', '2026-02-26 20:58:22');

-- --------------------------------------------------------

--
-- Table structure for table `cloud_backups`
--

CREATE TABLE `cloud_backups` (
  `id` int(11) NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `backup_file` varchar(255) DEFAULT NULL,
  `backup_type` enum('single','full') DEFAULT 'single',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cloud_backups`
--

INSERT INTO `cloud_backups` (`id`, `record_id`, `backup_file`, `backup_type`, `created_at`) VALUES
(1, NULL, 'cloud_backups/burial_records/full_backup_2026-03-01_03-15-29.json', 'full', '2026-03-01 02:15:29'),
(2, 6, 'cloud_backups/burial_records/cloud_backup_6_2026-03-01_03-36-29.json', 'single', '2026-03-01 02:36:29'),
(3, 7, 'cloud_backups/burial_records/cloud_backup_7_2026-03-01_03-46-41.json', 'single', '2026-03-01 02:46:41'),
(4, NULL, 'cloud_backups/burial_records/full_cloud_backup_2026-03-01_03-48-21.json', 'full', '2026-03-01 02:48:21');

-- --------------------------------------------------------

--
-- Table structure for table `data_backups`
--

CREATE TABLE `data_backups` (
  `id` int(11) NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `backup_file` varchar(255) DEFAULT NULL,
  `backup_action` enum('create','update','delete') DEFAULT 'create',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_backups`
--

INSERT INTO `data_backups` (`id`, `record_id`, `table_name`, `backup_file`, `backup_action`, `created_at`, `created_by`) VALUES
(1, 4, 'burial_records', 'backups/burial_records/backup_4_2026-03-01_03-18-59.json', 'create', '2026-03-01 02:18:59', 5),
(2, 5, 'burial_records', 'backups/burial_records/backup_5_2026-03-01_03-19-02.json', 'create', '2026-03-01 02:19:02', 5),
(3, 6, 'burial_records', 'backups/burial_records/backup_6_2026-03-01_03-36-29.json', 'create', '2026-03-01 02:36:29', 5),
(4, 7, 'burial_records', 'backups/burial_records/backup_7_2026-03-01_03-46-41.json', 'create', '2026-03-01 02:46:41', 5),
(5, 3, 'burial_records', 'backups/burial_records/backup_3_2026-03-01_03-48-42.json', 'delete', '2026-03-01 02:48:42', 5);

-- --------------------------------------------------------

--
-- Table structure for table `lot_notifications`
--

CREATE TABLE `lot_notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lot_id` int(11) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lot_notifications`
--

INSERT INTO `lot_notifications` (`id`, `user_id`, `lot_id`, `type`, `message`, `is_read`, `created_at`) VALUES
(1, 2, 2, 'reservation', 'Your reservation request for Lot A-002 has been submitted. Transaction ID: TXN-2026-0004', 0, '2026-02-26 22:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `lot_occupants`
--

CREATE TABLE `lot_occupants` (
  `id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `death_date` date NOT NULL,
  `interment_date` date DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `photo_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lot_occupants`
--

INSERT INTO `lot_occupants` (`id`, `lot_id`, `transaction_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `death_date`, `interment_date`, `relationship`, `is_primary`, `photo_path`, `created_at`) VALUES
(1, 4, NULL, 'Juan', 'M', 'Dela Cruz', '1945-03-15', '2023-01-10', '2023-01-15', 'Self', 1, NULL, '2026-02-26 20:58:22'),
(2, 8, NULL, 'Maria', 'R', 'Santos', '1950-06-20', '2023-02-20', '2023-02-25', 'Self', 1, NULL, '2026-02-26 20:58:22');

-- --------------------------------------------------------

--
-- Table structure for table `lot_transactions`
--

CREATE TABLE `lot_transactions` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(20) NOT NULL,
  `lot_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_type` enum('rent','buy') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `down_payment` decimal(10,2) DEFAULT NULL,
  `monthly_payment` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('pending','partial','paid','overdue') DEFAULT 'pending',
  `rejection_reason` text DEFAULT NULL,
  `contract_path` varchar(255) DEFAULT NULL,
  `status` enum('active','completed','cancelled','expired') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lot_transactions`
--

INSERT INTO `lot_transactions` (`id`, `transaction_id`, `lot_id`, `user_id`, `transaction_type`, `start_date`, `end_date`, `total_amount`, `down_payment`, `monthly_payment`, `payment_status`, `rejection_reason`, `contract_path`, `status`, `created_at`, `updated_at`) VALUES
(1, 'TXN-2026-0001', 1, 2, 'rent', '2026-02-26', '2027-02-26', 2250.00, 450.00, 2250.00, 'pending', NULL, NULL, 'active', '2026-02-26 21:08:41', '2026-02-26 21:08:41'),
(2, 'TXN-2026-0002', 5, 2, 'buy', '2026-02-26', NULL, 144000.00, 28800.00, 9600.00, 'pending', NULL, NULL, 'active', '2026-02-26 21:08:57', '2026-02-26 21:08:57'),
(3, 'TXN-2026-0003', 6, 2, 'buy', '2026-02-26', NULL, 67500.00, 13500.00, 4500.00, '', 'wow', NULL, 'cancelled', '2026-02-26 21:47:17', '2026-02-27 16:44:40'),
(4, 'TXN-2026-0004', 2, 2, 'rent', '2026-02-26', '2027-02-26', 2250.00, 450.00, 2250.00, 'paid', NULL, NULL, 'active', '2026-02-26 22:34:32', '2026-02-27 16:41:29'),
(5, 'TRX-2024-001', 1, 1, 'buy', '2024-01-15', '2025-01-15', 50000.00, 10000.00, 2000.00, 'paid', NULL, NULL, 'active', '2026-02-28 01:23:42', '2026-02-28 04:00:37');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_type` enum('down_payment','monthly','full_payment','renewal','other') NOT NULL,
  `or_number` varchar(100) NOT NULL,
  `payment_date` date NOT NULL,
  `remarks` text DEFAULT NULL,
  `status` enum('pending','completed','failed','refunded') DEFAULT 'completed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `transaction_id`, `schedule_id`, `amount`, `payment_type`, `or_number`, `payment_date`, `remarks`, `status`, `created_at`) VALUES
(1, 1, 1, NULL, 5000.00, 'monthly', 'OR-5518', '2026-02-28', NULL, 'pending', '2026-02-28 16:45:39'),
(2, 1, 1, NULL, 5000.00, 'monthly', 'OR-1001', '2026-02-28', NULL, 'pending', '2026-02-28 17:32:59'),
(3, 1, 1, NULL, 5000.00, 'monthly', 'OR-1002', '2026-02-27', NULL, 'pending', '2026-02-27 08:00:00'),
(4, 1, 1, NULL, 5000.00, 'monthly', 'OR-1003', '2026-02-26', NULL, 'pending', '2026-02-26 08:00:00'),
(5, 2, 2, NULL, 20000.00, 'down_payment', 'OR-2001', '2026-02-28', NULL, 'pending', '2026-02-28 17:32:59'),
(6, 1, 1, NULL, 5000.00, 'monthly', 'OR-1004', '2026-01-29', NULL, 'completed', '2026-01-29 08:00:00'),
(7, 1, 1, NULL, 5000.00, 'monthly', 'OR-1005', '2025-12-30', NULL, 'completed', '2025-12-30 08:00:00'),
(8, 2, 2, NULL, 50000.00, '', 'OR-2002', '2026-02-13', NULL, 'completed', '2026-02-13 08:00:00'),
(9, 1, 1, NULL, 5000.00, 'monthly', 'OR-1006', '2026-02-23', NULL, '', '2026-02-23 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment_schedule`
--

CREATE TABLE `payment_schedule` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','overdue','cancelled') DEFAULT 'pending',
  `or_number` varchar(100) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_schedule`
--

INSERT INTO `payment_schedule` (`id`, `transaction_id`, `due_date`, `amount`, `status`, `or_number`, `remarks`, `paid_date`, `payment_method`, `reference_number`, `created_at`) VALUES
(1, 1, '2026-03-15', 5000.00, 'pending', NULL, 'Monthly payment - March', NULL, NULL, NULL, '2026-02-28 17:30:33'),
(2, 1, '2026-04-14', 5000.00, 'pending', NULL, 'Monthly payment - April', NULL, NULL, NULL, '2026-02-28 17:30:33'),
(3, 1, '2026-05-14', 5000.00, 'pending', NULL, 'Monthly payment - May', NULL, NULL, NULL, '2026-02-28 17:30:33'),
(4, 2, '2026-03-10', 7500.00, 'pending', NULL, 'Down payment balance', NULL, NULL, NULL, '2026-02-28 17:30:33'),
(5, 2, '2026-04-09', 7500.00, 'pending', NULL, 'Final payment', NULL, NULL, NULL, '2026-02-28 17:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL,
  `last_ip` varchar(45) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('admin','staff','customer') NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `remember_token`, `token_expiry`, `last_ip`, `full_name`, `phone`, `address`, `role`, `status`, `created_at`, `updated_at`, `last_login`) VALUES
(1, 'john_doe', 'john@example.com', '$2y$10$YourHashedPasswordHere', NULL, NULL, NULL, 'John Doe', '09123456789', NULL, 'customer', 'active', '2026-02-20 02:14:08', '2026-02-20 02:14:08', NULL),
(2, 'hiroshimash', 'ronan@gmail.com', '$2y$10$YycT1oY5v1siR45SqywGROOqF9vgb9nEi62SGLS5Lz0mioPMthT9C', 'bb6926764a7221d8257f7ea86344583dc43dfd378a85da942b38d4df78aee444', '2026-03-23 04:04:48', NULL, 'Ronan James', '09382554205', 'BLK 14E LOT 2 PHASE 3 E1 DAGAT-DAGATAN', 'customer', 'active', '2026-02-17 23:03:18', '2026-03-02 03:07:41', '2026-03-02 03:07:41'),
(3, 'admin_user', 'admin@sangandaan.com', '$2y$10$YourHashedPasswordHere', NULL, NULL, NULL, 'Admin User', '09111222333', NULL, 'admin', 'active', '2026-02-20 02:14:08', '2026-02-20 02:14:08', NULL),
(5, 'staff', 'staff@gmail.com', '$2y$10$Ui7GTOxTT2TL9dLCcDJCnefcoDD81WOIV1ADLIdc51pdGOJhjs8Pe', NULL, NULL, NULL, 'Cemetery Staff', '09123456789', '', 'staff', 'active', '2026-02-19 00:09:04', '2026-03-01 01:46:42', '2026-03-01 01:46:42'),
(6, 'admin', 'admin@sangandaan.gov.ph', '$2y$10$4l8x/5j8kLNWYavCQHRoRu4niXexlqnSFKHI.icDHAlx8ZCIcvEtu', NULL, NULL, NULL, 'System Administrator', '09132132594', '', 'admin', 'active', '2026-02-19 00:14:30', '2026-03-02 03:07:57', '2026-03-02 03:07:57'),
(7, 'utsukushi', 'lovely@gmail.com', '$2y$10$Vk7zveb5PM/vScN7Cc9FFu1sSxDB..Sl5woQcf692zjcMJ5iuFK7K', '11fa6d0af344b12b5f1c6532a8642e4db7bac59e74c96960d3a1d8965a667990', NULL, NULL, 'Lovely Obena', '09080808080', '', 'customer', 'active', '2026-02-21 03:37:53', '2026-02-21 03:53:30', '2026-02-21 03:53:30'),
(8, 'admin2', 'admin2@gmail.com', '$2y$10$S7oXwIrnJAzpNGz2asegnOjmzmopV0KYwymcbV0pfRpiRv0ADEspe', NULL, NULL, NULL, 'Admin', '09789456123', '', 'admin', 'active', '2026-02-23 06:34:00', '2026-02-23 06:34:00', NULL),
(10, 'nonar', 'nonar@gmail.com', '$2y$10$nKCW.6W6aWXQG1elRHgkaO8JJYguDRR5DdlXe770TZ7tET73FhIHO', NULL, NULL, NULL, 'Nonar Blaze', '09321123090', '', 'admin', 'active', '2026-03-02 03:06:12', '2026-03-02 03:08:42', '2026-03-02 03:08:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_activity` (`user_id`,`created_at`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `appointment_id` (`appointment_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_appointment_date` (`preferred_date`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `appointment_history`
--
ALTER TABLE `appointment_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_appointment_id` (`appointment_id`);

--
-- Indexes for table `appointment_notifications`
--
ALTER TABLE `appointment_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_read` (`user_id`,`is_read`),
  ADD KEY `idx_appointment_id` (`appointment_id`);

--
-- Indexes for table `appointment_reminders`
--
ALTER TABLE `appointment_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `burial_records`
--
ALTER TABLE `burial_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_deceased_name` (`deceased_name`),
  ADD KEY `idx_lot_number` (`lot_number`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_burial_date` (`burial_date`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `cemetery_lots`
--
ALTER TABLE `cemetery_lots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lot_id` (`lot_id`),
  ADD UNIQUE KEY `unique_lot_in_section` (`section_id`,`lot_number`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_occupancy` (`occupancy_status`),
  ADD KEY `idx_price` (`price_buy`,`price_rent`);

--
-- Indexes for table `cemetery_sections`
--
ALTER TABLE `cemetery_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `section_code` (`section_code`);

--
-- Indexes for table `cloud_backups`
--
ALTER TABLE `cloud_backups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cloud_backup` (`created_at`);

--
-- Indexes for table `data_backups`
--
ALTER TABLE `data_backups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_record_backup` (`record_id`,`table_name`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `lot_notifications`
--
ALTER TABLE `lot_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `lot_id` (`lot_id`);

--
-- Indexes for table `lot_occupants`
--
ALTER TABLE `lot_occupants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `idx_lot_id` (`lot_id`),
  ADD KEY `idx_name` (`last_name`,`first_name`);

--
-- Indexes for table `lot_transactions`
--
ALTER TABLE `lot_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_lot` (`lot_id`),
  ADD KEY `idx_type` (`transaction_type`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `or_number` (`or_number`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `payment_schedule`
--
ALTER TABLE `payment_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_transaction` (`transaction_id`),
  ADD KEY `idx_due_date` (`due_date`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_remember_token` (`remember_token`),
  ADD KEY `idx_token_expiry` (`token_expiry`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `appointment_history`
--
ALTER TABLE `appointment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `appointment_notifications`
--
ALTER TABLE `appointment_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment_reminders`
--
ALTER TABLE `appointment_reminders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `burial_records`
--
ALTER TABLE `burial_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cemetery_lots`
--
ALTER TABLE `cemetery_lots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cemetery_sections`
--
ALTER TABLE `cemetery_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cloud_backups`
--
ALTER TABLE `cloud_backups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_backups`
--
ALTER TABLE `data_backups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lot_notifications`
--
ALTER TABLE `lot_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lot_occupants`
--
ALTER TABLE `lot_occupants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lot_transactions`
--
ALTER TABLE `lot_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment_schedule`
--
ALTER TABLE `payment_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `appointment_history`
--
ALTER TABLE `appointment_history`
  ADD CONSTRAINT `appointment_history_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `appointment_notifications`
--
ALTER TABLE `appointment_notifications`
  ADD CONSTRAINT `appointment_notifications_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_notifications_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `appointment_reminders`
--
ALTER TABLE `appointment_reminders`
  ADD CONSTRAINT `appointment_reminders_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `burial_records`
--
ALTER TABLE `burial_records`
  ADD CONSTRAINT `burial_records_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `burial_records_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `cemetery_lots`
--
ALTER TABLE `cemetery_lots`
  ADD CONSTRAINT `cemetery_lots_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `cemetery_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `data_backups`
--
ALTER TABLE `data_backups`
  ADD CONSTRAINT `data_backups_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `lot_notifications`
--
ALTER TABLE `lot_notifications`
  ADD CONSTRAINT `lot_notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lot_notifications_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `cemetery_lots` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `lot_occupants`
--
ALTER TABLE `lot_occupants`
  ADD CONSTRAINT `lot_occupants_ibfk_1` FOREIGN KEY (`lot_id`) REFERENCES `cemetery_lots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lot_occupants_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `lot_transactions` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `lot_transactions`
--
ALTER TABLE `lot_transactions`
  ADD CONSTRAINT `lot_transactions_ibfk_1` FOREIGN KEY (`lot_id`) REFERENCES `cemetery_lots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lot_transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `lot_transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `payment_schedule` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payment_schedule`
--
ALTER TABLE `payment_schedule`
  ADD CONSTRAINT `payment_schedule_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `lot_transactions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
