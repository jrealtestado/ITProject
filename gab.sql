-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2018 at 02:40 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gab`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `apptID` int(11) NOT NULL,
  `services` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `invUsed` varchar(45) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `bill` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `apptid` int(10) UNSIGNED NOT NULL,
  `scheduledDate` date NOT NULL,
  `services` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invUsed` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `bill` int(11) NOT NULL,
  `opStatus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dental_clinic_assistant`
--

CREATE TABLE `dental_clinic_assistant` (
  `asstID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `asstTelNO` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dental_clinic_assistants`
--

CREATE TABLE `dental_clinic_assistants` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dentist`
--

CREATE TABLE `dentist` (
  `dentID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `dentTelNo` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dentists`
--

CREATE TABLE `dentists` (
  `dentID` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dentTelNo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dentists`
--

INSERT INTO `dentists` (`dentID`, `name`, `dentTelNo`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Fred', '09125636987', NULL, NULL),
(2, 'Dr. Gabriana', '09487778564', NULL, NULL),
(3, 'Dr. Garcia', '09568899741', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dentistservices`
--

CREATE TABLE `dentistservices` (
  `serPerformed` int(11) NOT NULL,
  `dentAssigned` varchar(45) NOT NULL,
  `timePerformed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `servDate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dentist_services`
--

CREATE TABLE `dentist_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `histID` int(10) UNSIGNED NOT NULL,
  `dateAdded` date NOT NULL,
  `supplier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `histID` int(11) NOT NULL,
  `dateAdded` date DEFAULT NULL,
  `timeAdded` varchar(45) DEFAULT NULL,
  `invAdded` int(11) DEFAULT NULL,
  `qtyUnused` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `invID` int(10) UNSIGNED NOT NULL,
  `invName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `low_stock_quantity` int(11) NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invStatus` enum('Out of Stock','Low in Stock','Good') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`invID`, `invName`, `quantity`, `low_stock_quantity`, `unit`, `invStatus`, `status`, `created_at`, `updated_at`) VALUES
(1, '2 To 4 HOLES ADAPTER', 9, 8, 'pcs', 'Good', 'Inactive', NULL, '2018-05-23 09:23:13'),
(2, '4 TO TO', 3, 4, 'pcs', 'Low in Stock', 'Active', NULL, '2018-05-24 08:55:49'),
(3, 'Alginate/Kromopan', 15, 14, 'kilos', 'Good', 'Active', NULL, '2018-05-23 09:24:41'),
(4, 'Anesthesia', 12, 13, 'pcs', 'Low in Stock', 'Active', NULL, '2018-05-23 10:04:04'),
(6, 'Articulating Paper', 21, 24, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(8, 'BEAUTI-CEMENT', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(9, 'big diamonds finishing burr', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(10, 'Bite Block', 8, 11, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(11, 'Bite Wax', 37, 40, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(12, 'Bone Burrs', 6, 9, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(13, 'BONDING agent', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(14, 'Brackets', 26, 29, 'set', 'Low in Stock', 'Active', NULL, NULL),
(15, 'Buccal Tubes', 0, 3, 'set', 'Out of Stock', 'Inactive', NULL, NULL),
(16, 'Burr -40 round', 2, 5, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(17, 'Burrs # 368016', 3, 6, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(18, 'Burrs diamond point (FG)', 5, 8, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(19, 'Calibra esthetic Resin Cement', 3, 6, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(20, 'Castone', 12, 15, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(21, 'Cavitron', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(22, 'Celluloid Strip', 4, 7, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(23, 'Ceramic Brackets', 4, 7, 'set', 'Low in Stock', 'Active', NULL, NULL),
(24, 'CLOSED COIL SPRING', 6, 9, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(25, 'Coax', 1, 4, 'packs', 'Low in Stock', 'Active', NULL, NULL),
(26, 'Composite A1', 1, 4, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(27, 'Composite A2', 3, 6, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(28, 'Composite A3', 3, 6, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(29, 'Composite A3.5', 4, 7, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(31, 'Composite B2', 2, 5, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(32, 'Composite Bonding Agent', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(33, 'Composite instruments code-05703', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(34, 'Composite instruments code-05707', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(35, 'composite Inc.', 11, 14, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(36, 'CuNiTi .016 Lower', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(37, 'CuNiTi .12 Upper', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(38, 'Defoger', 4, 7, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(39, 'Dental Impression material tray', 85, 88, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(40, 'Diestone', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(41, 'Disposable Syringes 10cc', 50, 53, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(42, 'Dowel Posts Large', 4, 7, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(43, 'Dowel Posts Medium', 4, 7, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(44, 'Dowel Posts Short', 4, 7, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(45, 'DRIVER', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(47, 'Elastic Chain', 20, 23, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(48, 'Endo Block', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(49, 'Etchant', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(53, 'Fermine', 1, 4, 'Bottles', 'Low in Stock', 'Active', NULL, NULL),
(54, 'Fishbone Trrays', 2, 5, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(57, 'Flowable Composite A2', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(58, 'Flowable Composite A3', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(59, 'Flowable Composite A3.5', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(60, 'Forestadent wire LOWER .012', 4, 7, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(61, 'Forestadent wire UPER .012', 5, 8, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(62, 'Formocresol', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(63, 'gauze', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(64, 'Gingi Master', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(65, 'Gingi Master Refill', 6, 9, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(66, 'Glass Ionomer Cement GIC', 0, 3, 'Boxes', 'Out of Stock', 'Active', NULL, NULL),
(70, 'GS II FIXTURE', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(71, 'Gun type w/ temp crown', 1, 4, 'Set', 'Low in Stock', 'Active', NULL, NULL),
(72, 'Gutta Percha 15-40', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(73, 'Gutta Percha 45-80', 6, 9, 'Packs', 'Low in Stock', 'Active', NULL, NULL),
(74, 'HANDPIECE HIGHSPEED / yabangbang', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(75, 'HANDPIECE NSK DYNALED/SURGERY', 0, 3, 'Packs', 'Out of Stock', 'Active', NULL, NULL),
(76, 'HANDPIECE NSK PANAMAX', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(77, 'HANDPIECE SET serial # 100300503', 2, 5, 'set', 'Low in Stock', 'Active', NULL, NULL),
(78, 'HANDPIECE SET serial # 1100300503', 0, 3, 'set', 'Out of Stock', 'Active', NULL, NULL),
(79, 'HANDPIECE SINGLE SET # 0074693', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(80, 'HANDPIECE SINGLE SET # 0074694', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(81, 'HANDPIECE SINGLE SET # 0074695', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(82, 'HANDPIECE SINGLE SET # 0074696', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(83, 'HANPIECE LUBRICANT', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(84, 'HANDPIECE SINGLE SET # 0866090', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(85, 'Hemodent', 1, 4, 'Bottles', 'Low in Stock', 'Active', NULL, NULL),
(86, 'H-FILE 015-040', 3, 6, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(87, 'IRM', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(90, 'Ligature wire', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(91, 'LIIDOCAINE hcl', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(94, 'METAPEX', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(95, 'Mixing Pad Big', 3, 6, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(96, 'Mixing Pad Small', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(97, 'Modeling compound', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(101, 'NiTi .014 Lower', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(102, 'NiTi .014 Upper', 4, 7, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(111, 'NiTi .019x.025 Upper', 3, 6, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(113, 'NiTi .16 x 22 Lower', 3, 6, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(114, 'NiTi .16 x 22 Upper', 5, 8, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(115, 'Op brush tips', 2, 5, 'Boxes', 'Low in Stock', 'Active', NULL, NULL),
(116, 'Open coil spring', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(118, 'Ortho bonding Agent', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(119, 'Ortho cement', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(124, 'Ortho elastics 1/8 Light', 0, 3, 'Packs', 'Out of Stock', 'Active', NULL, NULL),
(132, 'Ortho kit', 3, 6, 'Packs', 'Low in Stock', 'Active', NULL, NULL),
(134, 'Ostem Implant Kit', 0, 3, 'boxes', 'Out of Stock', 'Active', NULL, NULL),
(135, 'Paper points 15-40', 3, 6, 'Packs', 'Low in Stock', 'Active', NULL, NULL),
(136, 'Paper points 45-80', 5, 8, 'Packs', 'Low in Stock', 'Active', NULL, NULL),
(138, 'Plastic Vyneers', 4, 7, 'Packs', 'Low in Stock', 'Active', NULL, NULL),
(139, 'Polishing burrs', 3, 6, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(140, 'Polishing Strips', 3, 6, 'set', 'Low in Stock', 'Active', NULL, NULL),
(141, 'Polybib', 5, 8, 'Packs', 'Low in Stock', 'Active', NULL, NULL),
(142, 'Primer', 2, 5, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(143, 'Pumice', 1, 4, 'Bottles', 'Low in Stock', 'Active', NULL, NULL),
(144, 'Rigid abutment', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(146, 'Saline Solution', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(147, 'Saliva Ejector tips', 3, 6, 'Packs', 'Low in Stock', 'Active', NULL, NULL),
(148, 'Scaler ultrasonic insert 25 khz', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(149, 'Scaler tips 30k denstply', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(150, 'Screw', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(151, 'Self curing liquid', 1, 4, 'Bottles', 'Low in Stock', 'Active', NULL, NULL),
(152, 'Self curing powder', 5, 8, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(155, 'Self ligating brackets metal', 0, 3, 'set', 'Out of Stock', 'Active', NULL, NULL),
(156, 'Self ligating ceramic brackets', 1, 4, 'set', 'Low in Stock', 'Active', NULL, NULL),
(158, 'Sodium chloride', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(163, 'Stainless steel .017*022 lower', 4, 7, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(165, 'Stainless steel 012 lower', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(169, 'Stainless steel 016 lower', 5, 8, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(172, 'Stainless steel 018 upper', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(174, 'Sterilizing pouch large', 1, 4, 'Boxes', 'Low in Stock', 'Active', NULL, NULL),
(181, 'Surgical tips', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(184, 'Suturing needle silk 4/0 metric', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(185, 'Syringe (G27 long)', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(186, 'Sterilization  pouch (5 1/4 x 10\")\"', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(187, 'Suturing thread', 2, 5, 'Roll', 'Low in Stock', 'Active', NULL, NULL),
(188, 'TF-13', 4, 7, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(190, 'Thermafil Obturation', 1, 4, 'set', 'Low in Stock', 'Active', NULL, NULL),
(191, 'Topical Anesthesia', 3, 6, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(192, 'TR-11', 5, 8, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(193, 'TR-13', 3, 6, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(196, 'Transfer Abutment', 1, 4, 'pcs', 'Low in Stock', 'Active', NULL, NULL),
(197, 'Zeta plus', 0, 3, 'pcs', 'Out of Stock', 'Active', NULL, NULL),
(198, 'Zeta ultra disinfectant', 0, 3, 'Bottles', 'Out of Stock', 'Active', NULL, NULL),
(199, 'Extension', 500, 50, 'pcs', 'Good', 'Active', '2018-04-22 11:37:39', '2018-04-22 11:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `invhistory`
--

CREATE TABLE `invhistory` (
  `invHistID` int(11) UNSIGNED NOT NULL,
  `invID` int(10) UNSIGNED NOT NULL,
  `patID` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `historyStatus` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invhistory`
--

INSERT INTO `invhistory` (`invHistID`, `invID`, `patID`, `quantity`, `historyStatus`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 8, 'Added', '2018-05-23 09:23:13', '2018-05-23 09:23:13'),
(2, 2, 0, 1, 'Added', '2018-05-23 09:23:28', '2018-05-23 09:23:28'),
(3, 3, 0, 11, 'Added', '2018-05-23 09:24:41', '2018-05-23 09:24:41'),
(4, 4, 0, 10, 'Added', '2018-05-23 10:04:05', '2018-05-23 10:04:05'),
(5, 2, 0, 3, 'Added', '2018-05-24 08:34:27', '2018-05-24 08:34:27'),
(6, 2, 0, 0, 'Added', '2018-05-24 08:51:45', '2018-05-24 08:51:45'),
(7, 2, 0, 0, 'Added', '2018-05-24 08:51:55', '2018-05-24 08:51:55'),
(8, 2, 0, 0, 'Added', '2018-05-24 08:52:43', '2018-05-24 08:52:43'),
(9, 2, 0, 3, 'Reduced', '2018-05-24 08:55:49', '2018-05-24 08:55:49');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_03_12_12000_create_dentists_table', 1),
(4, '2018_03_14_074254_create_patients_table', 1),
(5, '2018_03_18_033440_create_inventories_table', 1),
(6, '2018_03_22_144428_create_services_table', 1),
(7, '2018_03_25_064131_create_schedules_table', 1),
(8, '2018_03_31_173654_create_histories_table', 1),
(9, '2018_03_31_174723_create_records_table', 1),
(10, '2018_03_31_174752_create_payments_table', 1),
(11, '2018_03_31_174825_create_dental_clinic_assistants_table', 1),
(12, '2018_03_31_174849_create_service_scheduleds_table', 1),
(13, '2018_03_31_174905_create_dentist_services_table', 1),
(14, '2018_03_31_174938_create_ser_per_inventories_table', 1),
(15, '2018_03_31_175020_create_appointments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patID` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patientTelNo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `age` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medconditions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allergies` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `patStatus` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dentID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patID`, `name`, `address`, `occupation`, `patientTelNo`, `status`, `birthDate`, `age`, `sex`, `medconditions`, `allergies`, `balance`, `patStatus`, `created_at`, `updated_at`, `dentID`) VALUES
(0, 'Jesssie G. Bautista', 'Honeymonon RD, Baguio City', 'Maintenance', '09302184788', 'Married', '1988-08-24', '27', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(1, 'Gandeza Rachel E', 'Marville Subdivision, Irisan, Baguio City', 'Student', '09260717250', 'Single', '1993-01-28', '24', 'F', 'Asthma', 'None', 0, 'Active', NULL, NULL, NULL),
(2, 'Maria Olivia Margaris', 'Marville Subdivision baguio', 'Student', '09193279345', 'Married', '1982-07-15', '35', 'F', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(3, 'Di Anne P Monreal', 'Bakakeng Sur, Baguio City', 'Cabni Crew', '09173024102', 'Single', '1991-02-28', '26', 'F', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(5, 'Joan Polomen', 'Jc 123 La trinidad', 'Student', '09282817870', 'Married', '1983-09-15', '34', 'F', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(6, 'Jhoairha Manaiang', 'Jc 123 La trinidad', 'Student', '09125554867', 'Married', '1999-05-27', '17', 'M', 'None', 'Seafood', 0, 'Active', NULL, NULL, NULL),
(7, 'Magilyn Lim', '7 Laubach Road', 'Student', '09277948873', 'Married', '1997-11-03', '40', 'F', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(8, 'Kailey Robyn C. Bernal', '129E Leonila Mill', 'Student', '09778560101', 'Single', '2010-06-19', '8', 'F', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(9, 'Rexelle Jun R. Bersamin', 'North Cambridge Condominium Bakakeng, Baguio City', 'Security Guard', '09269350953', 'Single', '1994-06-25', '23', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(10, 'charice Costales', '2A-11 Ledesma St. Aurora Hil', 'HouseWife', '244-2461', 'Married', '1998-12-04', '29', 'f', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(11, 'Axel Portugal', '59 Loakan Liwanag ', 'Delivery Boy', '09150787422', 'Single', '1995-08-13', '22', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(12, 'Nataniel Balandra', '28 Camp 7 Amparo Baguio City', 'Factory Worker', '09224149982', 'Single', '1990-02-01', '28', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(13, 'Darell Buclod', 'Lexber Heights Monticello Baguio City', 'Teacher', '09174904035', 'Married', '1988-12-21', '30', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(14, 'Leonardo Vargas', '22 Ongasan Loakan Baguio City', 'Student', '09142282910', 'Single', '1991-04-20', '27', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(15, 'Alexa Malabanan', 'Upper Bonifacio Baguio City', 'Student', '09354218290', 'Single', '1992-09-27', '26', 'F', 'None', 'None', 0, 'Active', NULL, '2018-04-22 11:12:37', NULL),
(16, 'Natasha Medina', 'Quisumbing st Baguio City', 'Accountant', '09175847902', 'Married', '1983-06-30', '35', 'F', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(17, 'Ralph Abad', 'Dominican Hill Baguio City', 'Baker', '09356902867', 'Single', '1994-03-11', '24', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(18, 'Rogelio Gomez', 'Hillside Baguio City', 'Driver', '09164745655', 'Married', '1981-10-22', '37', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(19, 'Norman Bulan', '23 Kias PMA Baguio City', 'Carpenter', '09275899890', 'Single', '1989-04-06', '34', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(20, 'Violet Fajardo', 'Bakakeng Central Baguio City', 'Botanist', '09191267844', 'Married', '1980-06-23', '38', 'F', 'None', 'Dust', 0, 'Active', NULL, NULL, NULL),
(21, 'Joshua Tumulak', '40 Holy Ghost Proper Baguio City', 'Cleaner', '09222543657', 'Single', '1997-12-29', '20', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(22, 'Eugenio Amurao', '10 Guisad Sorong Baguio City', 'Electrician', '09355675478', 'Married', '1984-06-13', '34', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(23, 'Chase Fernando', 'Camp Allen Baguio City', 'Ergonomist', '09336457807', 'Single', '1994-02-06', '24', 'F', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(24, 'Cedric Veterano', '14 Sanitary Camp North Baguio City', 'Engineer', '09450886455', 'Single', '1996-06-27', '21', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(25, 'Amado Andal', 'Lucnab Baguio City', 'Fireman', '09484589754', 'Single', '1988-03-03', '30', 'M', 'None', 'None', 0, 'Active', NULL, '2018-04-22 10:45:52', NULL),
(26, 'Terence Davidson', '#300 irisan Baguio City', 'Student', '09124235975', 'Single', '1981-02-23', '37', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(27, 'Mark Anthony Fernando', '#12 general luna  Baguio City', 'Secretary', '09095566325', 'Single', '1984-05-15', '33', 'M', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(28, 'Lucille David', 'Block 30 eagle crest  Baguio City', 'Treasurer', '09567586952', 'Single', '1982-07-16', '31', 'F', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(29, 'Angelica Castillo', 'Poblacion Street La trinidad', 'Security', '09104561239', 'Single', '1989-03-04', '29', 'F', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(30, 'Maria Antero', 'Jc 456 Puguis La trinidad', 'Accountant', '09489512365', 'Married', '1970-11-27', '47', 'F', 'None', 'None', 0, 'Active', NULL, NULL, NULL),
(31, 'Jay', '#608 Irisan Road Baguio City', 'Driver', '09565779863', 'Single', '1998-03-09', '20', 'Male', 'None', 'None', NULL, 'Active', '2018-04-22 09:22:52', '2018-04-22 09:22:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payID` int(11) NOT NULL,
  `datePaid` date NOT NULL,
  `amount` int(11) NOT NULL,
  `receive` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `recordID` int(11) NOT NULL,
  `dentist` varchar(45) NOT NULL,
  `servPeformed` varchar(45) NOT NULL,
  `patient` varchar(45) NOT NULL,
  `payment` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `recordId` int(10) UNSIGNED NOT NULL,
  `dateRecorded` date NOT NULL,
  `dentist` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment` int(11) NOT NULL,
  `patID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedID` int(11) NOT NULL,
  `scheduledDate` date NOT NULL,
  `timeFrom` time NOT NULL,
  `timeTo` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `schedId` int(10) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `timeFrom` time DEFAULT NULL,
  `timeTo` time DEFAULT NULL,
  `opStatus` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patID` int(10) UNSIGNED NOT NULL,
  `dentID` int(10) UNSIGNED NOT NULL,
  `servID` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teethID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`schedId`, `date`, `timeFrom`, `timeTo`, `opStatus`, `patID`, `dentID`, `servID`, `created_at`, `updated_at`, `teethID`) VALUES
(2, '2018-04-22', '22:00:00', '22:30:00', 'Pending', 25, 3, 22, '2018-04-22 10:58:40', '2018-04-22 10:59:02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `serperinventory`
--

CREATE TABLE `serperinventory` (
  `invQty` int(11) NOT NULL,
  `service` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `servID` int(10) UNSIGNED NOT NULL,
  `servName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`servID`, `servName`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Consultation', 450, NULL, NULL),
(2, 'Per-Apical Xray', 450, NULL, NULL),
(3, 'Panoramic Xray', 1350, NULL, NULL),
(4, 'Cephalometric Xray', 1350, NULL, NULL),
(5, 'Oral Prohylaxis/Cleaning(MILD)', 650, NULL, NULL),
(6, 'Oral Prohylaxis/Cleaning(MODERATE)', 1000, NULL, NULL),
(7, 'Oral Prohylaxis/Cleaning(SEVERE)', 2000, NULL, NULL),
(8, 'Composite Fillings (per surface)', 750, NULL, NULL),
(9, 'Pit and fissure sealant', 2000, NULL, NULL),
(10, 'Recementation of crowns', 1000, NULL, NULL),
(11, 'Flouride treatment(Child/Adult)', 5000, NULL, NULL),
(12, 'Temporary filling', 750, NULL, NULL),
(13, 'Flouride varnish', 1500, NULL, NULL),
(14, 'Porcelain Veneers(Zirconia)', 25000, NULL, NULL),
(15, 'Porcelain Veneers(IPS-Emax)', 25000, NULL, NULL),
(16, 'Porcelain Veneers(Adoro)', 25000, NULL, NULL),
(17, 'Teeth whitening', 15000, NULL, NULL),
(18, 'Root Canal(Simple Extraction)', 550, NULL, NULL),
(19, 'Root Canal(Difficult Extraction)', 1500, NULL, NULL),
(20, 'Root Canal(Odontectomy/Impaction)', 6500, NULL, NULL),
(21, 'Implants', 60000, NULL, NULL),
(22, 'Porcelain fused to TI-LITE', 9500, NULL, NULL),
(23, 'Porcelain fused to GOLD', 7500, NULL, NULL),
(24, 'All porcelain crowns (Zirconia)', 25000, NULL, NULL),
(25, 'All porcelain crowns (IPS-emax)', 25000, NULL, NULL),
(26, 'All porcelain crowns (Adoro)', 25000, NULL, NULL),
(27, 'All plastic Biotone (Flexite)', 15000, NULL, NULL),
(28, 'Stayplate-Unilateral-Trubyte(Porcelain)', 25000, NULL, NULL),
(29, 'Stayplate-Unilateral-Naturadent(Porcelain)', 20000, NULL, NULL),
(30, 'CompleteDenture-Ivocap-Injectable(Porcelain)', 25000, NULL, NULL),
(31, 'CompleteDenture-Trubyte-Bioform(Porcelain)', 25000, NULL, NULL),
(32, 'CompleteDenture-Vitanorm(Porcelain)', 25000, NULL, NULL),
(33, 'CompleteDenture-Natura Dent(Porcelain)', 25000, NULL, NULL),
(34, 'CompleteDenture-Vertex-High Impact(Porcelain)', 750, NULL, NULL),
(35, 'CompleteDenture-Biotone(Porcelain)', 750, NULL, NULL),
(36, 'CompleteDenture-Ivoclar(Porcelain)', 750, NULL, NULL),
(37, 'CompleteDenture-Naturatone(Porcelain)', 750, NULL, NULL),
(38, 'CompleteDenture-Denture repair(Porcelain)', 750, NULL, NULL),
(39, 'CompleteDenture-Denture repair w/ impression taking(Porcelain)', 1000, NULL, NULL),
(40, 'CompleteDenture-Denture reline(Porcelain)', 750, NULL, NULL),
(41, 'Retainers-Ordinary', 5000, NULL, NULL),
(42, 'Retainers-Ordinary w/ design', 7000, NULL, NULL),
(43, 'Retainers-Invisible', 7000, NULL, NULL),
(44, 'Retainers-Lingual Retainer', 5000, NULL, NULL),
(45, 'Orthodontic Treatment-Simple', 40000, NULL, NULL),
(46, 'Orthodontic Treatment-Moderate', 50000, NULL, NULL),
(47, 'Orthodontic Treatment-Difficult', 60000, NULL, NULL),
(48, 'Orthodontic Treatment-Ceramic', 125000, NULL, NULL),
(49, 'Orthodontic Treatment-Daemon/Self-ligating', 80000, NULL, NULL),
(50, 'Orthodontic Treatment-Lingual Braces', 80000, NULL, NULL),
(51, 'Orthodontic Treatment-Invisalign', 80000, NULL, NULL),
(52, 'Recementation of fallen brackets, molar bands, buccal tube', 550, NULL, NULL),
(53, 'Replacement of fallen brackets, molar bands, buccal tube', 1100, NULL, NULL),
(54, 'Teeth Whitening (Advanced)', 1200, '2018-04-22 11:39:11', '2018-04-22 11:39:11');

-- --------------------------------------------------------

--
-- Table structure for table `serviceschedule`
--

CREATE TABLE `serviceschedule` (
  `serPref` int(11) NOT NULL,
  `schedDate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_scheduleds`
--

CREATE TABLE `service_scheduleds` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ser_per_inventories`
--

CREATE TABLE `ser_per_inventories` (
  `invQty` int(11) NOT NULL,
  `service` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `invHistID` int(10) UNSIGNED NOT NULL,
  `invId` int(11) NOT NULL,
  `patID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `historyStatus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teeth`
--

CREATE TABLE `teeth` (
  `teethID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teeth`
--

INSERT INTO `teeth` (`teethID`) VALUES
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(31),
(32),
(34),
(35),
(36),
(37),
(38),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `admin`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Eldridge', 'eldridge@test.com', 1, '$2y$10$udYKeqj1rtMZti/t1I1VM.3/DZ7ntovL1BnphkjMOcYDsahOsGPHy', '9voZ0SAWUj9NMFVeV3oKKdShJxdzPPb1tQlwpU2UENu1EZJjna2H1uEUvQBG', '2018-04-22 06:32:51', '2018-04-22 06:32:51'),
(2, 'Janrielhehez', 'janriel234@gmail.com', 0, '$2y$10$sDn.2v2eoIxZPF51sTGnme9VQEF24ZcbIpMArzDwVi.uEiw7vbIeC', 'AS7ShHwSaxG0V8Ae7pQb9FVnaL5bCy6eIP9d1TCX2QFGEn31ZPjBhYrLj0m9', '2018-04-22 06:42:04', '2018-04-22 06:42:04'),
(3, 'eldridge', 'eldridge234@gmail.com', 0, '$2y$10$T0CJncHfl5eUvpK6U0T17eULui6MYbqBfuZLuHLd/6q3tKjgh8G5e', NULL, '2018-04-22 06:42:47', '2018-04-22 06:42:47'),
(4, 'admin', 'admin@test.com', 1, '$2y$10$0jGiO.KyOoEpTomtNqAKDuSSZihMsk1Ai5zM4zdmLKc7NEiwb3Mma', 'Pl29YFX58Gab1jjmZTu3Epos24oxa737rIkzOfxfKbjQkFRqBq6q3izLXt2Q', '2018-04-22 09:51:57', '2018-04-22 09:51:57'),
(5, 'Assistant', 'Assistant@test.com', 0, '$2y$10$nDPXfIEj4BpUaho.vaDv7OHlmBuReAtfYQGtqwWKjgs7i6p6.H2sq', NULL, '2018-04-22 10:36:13', '2018-04-22 10:36:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`apptID`),
  ADD UNIQUE KEY `apptID_UNIQUE` (`apptID`),
  ADD UNIQUE KEY `services_UNIQUE` (`services`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`apptid`),
  ADD KEY `appointments_user_id_foreign` (`user_id`);

--
-- Indexes for table `dental_clinic_assistant`
--
ALTER TABLE `dental_clinic_assistant`
  ADD PRIMARY KEY (`asstID`),
  ADD UNIQUE KEY `asstID_UNIQUE` (`asstID`);

--
-- Indexes for table `dental_clinic_assistants`
--
ALTER TABLE `dental_clinic_assistants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dentist`
--
ALTER TABLE `dentist`
  ADD PRIMARY KEY (`dentID`),
  ADD UNIQUE KEY `dentID_UNIQUE` (`dentID`);

--
-- Indexes for table `dentists`
--
ALTER TABLE `dentists`
  ADD PRIMARY KEY (`dentID`);

--
-- Indexes for table `dentist_services`
--
ALTER TABLE `dentist_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`histID`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`histID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`invID`);

--
-- Indexes for table `invhistory`
--
ALTER TABLE `invhistory`
  ADD PRIMARY KEY (`invHistID`),
  ADD KEY `patientID` (`patID`),
  ADD KEY `invID` (`invID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patID`),
  ADD KEY `patients_dentid_foreign` (`dentID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payID`),
  ADD UNIQUE KEY `payID_UNIQUE` (`payID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`recordID`),
  ADD UNIQUE KEY `recordID_UNIQUE` (`recordID`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`recordId`),
  ADD KEY `records_patid_foreign` (`patID`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedID`),
  ADD UNIQUE KEY `schedID_UNIQUE` (`schedID`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedId`),
  ADD KEY `schedules_patid_foreign` (`patID`),
  ADD KEY `schedules_dentid_foreign` (`dentID`),
  ADD KEY `schedules_servid_foreign` (`servID`),
  ADD KEY `schedules_teethID_foreign` (`teethID`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`servID`);

--
-- Indexes for table `service_scheduleds`
--
ALTER TABLE `service_scheduleds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`invHistID`);

--
-- Indexes for table `teeth`
--
ALTER TABLE `teeth`
  ADD PRIMARY KEY (`teethID`),
  ADD UNIQUE KEY `teethID_UNIQUE` (`teethID`);

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
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `apptID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `apptid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dental_clinic_assistant`
--
ALTER TABLE `dental_clinic_assistant`
  MODIFY `asstID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dental_clinic_assistants`
--
ALTER TABLE `dental_clinic_assistants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dentist`
--
ALTER TABLE `dentist`
  MODIFY `dentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dentists`
--
ALTER TABLE `dentists`
  MODIFY `dentID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dentist_services`
--
ALTER TABLE `dentist_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `histID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `histID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `invID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `invhistory`
--
ALTER TABLE `invhistory`
  MODIFY `invHistID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `recordID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `recordId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `servID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `service_scheduleds`
--
ALTER TABLE `service_scheduleds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `invHistID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teeth`
--
ALTER TABLE `teeth`
  MODIFY `teethID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `invhistory`
--
ALTER TABLE `invhistory`
  ADD CONSTRAINT `invID` FOREIGN KEY (`invID`) REFERENCES `inventory` (`invID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `patID` FOREIGN KEY (`patID`) REFERENCES `patients` (`patID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_dentid_foreign` FOREIGN KEY (`dentID`) REFERENCES `dentists` (`dentID`) ON UPDATE CASCADE;

--
-- Constraints for table `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `records_patid_foreign` FOREIGN KEY (`patID`) REFERENCES `patients` (`patID`) ON UPDATE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_dentid_foreign` FOREIGN KEY (`dentID`) REFERENCES `dentists` (`dentID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `schedules_patid_foreign` FOREIGN KEY (`patID`) REFERENCES `patients` (`patID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `schedules_servid_foreign` FOREIGN KEY (`servID`) REFERENCES `services` (`servID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `schedules_teethID_foreign` FOREIGN KEY (`teethID`) REFERENCES `teeth` (`teethID`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
