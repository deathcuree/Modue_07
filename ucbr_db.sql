-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 03, 2023 at 08:26 AM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ucbr_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_tbl`
--

CREATE TABLE `admin_user_tbl` (
  `id` int(150) NOT NULL,
  `username` varchar(150) DEFAULT NULL,
  `type` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `dateAdded` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_user_tbl`
--

INSERT INTO `admin_user_tbl` (`id`, `username`, `type`, `password`, `dateAdded`) VALUES
(1, 'admin', 'admin', '4297f44b13955235245b2497399d7a93', '2023-04-21 14:03:54'),
(5, 'cashier', 'cashier', '4297f44b13955235245b2497399d7a93', '2023-05-03 12:53:04'),
(6, 'receptionist', 'receptionist', '4297f44b13955235245b2497399d7a93', '2023-05-03 12:58:04');

-- --------------------------------------------------------

--
-- Table structure for table `chat_history`
--

CREATE TABLE `chat_history` (
  `id` int(150) NOT NULL,
  `adminID` varchar(250) DEFAULT '',
  `userID` varchar(250) DEFAULT NULL,
  `dateAdded` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_history`
--

INSERT INTO `chat_history` (`id`, `adminID`, `userID`, `dateAdded`) VALUES
(1, '2', '12', '2023-04-24 00:38:29'),
(12, '2', '15', '2023-04-24 11:47:10'),
(13, '2', '27', '2023-04-25 12:49:23'),
(14, '1', '28', '2023-04-26 08:17:02'),
(15, '1', '31', '2023-04-26 10:53:43'),
(16, '1', '15', '2023-04-26 12:56:51'),
(17, '1', '29', '2023-04-26 18:24:09'),
(18, '1', '33', '2023-04-26 18:34:31'),
(19, '1', '39', '2023-04-28 06:46:52'),
(20, '1', '40', '2023-04-28 08:22:31'),
(21, '1', '44', '2023-04-29 21:26:28'),
(22, '1', '46', '2023-05-01 12:03:54');

-- --------------------------------------------------------

--
-- Table structure for table `chat_msgs`
--

CREATE TABLE `chat_msgs` (
  `id` int(11) NOT NULL,
  `historyID` varchar(255) DEFAULT NULL,
  `sentBy` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `isViewedUser` varchar(255) DEFAULT '0',
  `dateAdded` datetime DEFAULT NULL,
  `isViewedAdmin` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_msgs`
--

INSERT INTO `chat_msgs` (`id`, `historyID`, `sentBy`, `msg`, `isViewedUser`, `dateAdded`, `isViewedAdmin`) VALUES
(1, '1', 'admin', 'Testing6', '1', '2023-04-23 00:39:46', '1'),
(2, '1', 'admin', 'Testing5', '1', '2023-04-23 00:39:46', '1'),
(33, '13', 'user', 'testasdfa sd asd asd asd', '1', '2023-04-25 19:33:11', '1'),
(34, '13', 'user', '123123 123 123123', '1', '2023-04-25 19:33:52', '1'),
(35, '13', 'user', 'Hi diane\n', '1', '2023-04-25 19:36:19', '1'),
(36, '13', 'admin', 'yes po?', '1', '2023-04-25 19:36:27', '1'),
(37, '13', 'user', 'Wala lang', '1', '2023-04-25 19:36:32', '1'),
(38, '13', 'admin', 'nice one\nOKAY', '1', '2023-04-25 19:36:39', '1'),
(39, '', 'admin', 'dali na\n', '0', '2023-04-25 21:37:52', '0'),
(40, '', 'admin', 'gggggg', '0', '2023-04-25 21:37:58', '0'),
(41, '', 'admin', 'ai bat wala\n', '0', '2023-04-25 21:38:06', '0'),
(42, '14', 'admin', 'Halo\n', '1', '2023-04-26 08:17:16', '1'),
(43, '14', 'user', 'sup\n', '1', '2023-04-26 08:17:29', '1'),
(44, '14', 'user', 'sino ka', '1', '2023-04-26 08:17:32', '1'),
(45, '14', 'admin', 'nani\n', '1', '2023-04-26 08:17:36', '1'),
(46, '14', 'user', 'cute', '1', '2023-04-26 08:17:55', '1'),
(47, '14', 'admin', 'ge\n', '1', '2023-04-26 08:18:04', '1'),
(48, '15', 'admin', 'Hello This is NIKAAAAAA tulungan niyo ako sa THESIS', '1', '2023-04-26 10:54:16', '1'),
(49, '15', 'user', 'HAHAHHAHAA', '1', '2023-04-26 10:54:24', '1'),
(50, '15', 'user', 'inaayos ko pa', '1', '2023-04-26 10:54:39', '1'),
(51, '15', 'admin', 'NAPAKALAKAS!!\n', '1', '2023-04-26 10:54:39', '1'),
(52, '15', 'admin', 'Websocket GOD ah', '1', '2023-04-26 10:54:53', '1'),
(53, '15', 'user', 'hindiii may backend yan i mean di na ko nag backend', '1', '2023-04-26 10:54:54', '1'),
(54, '15', 'admin', 'uu websocket yan ', '1', '2023-04-26 10:55:07', '1'),
(55, '15', 'user', 'gumawa siya custom controller code tas vanilla php', '1', '2023-04-26 10:55:07', '1'),
(56, '15', 'user', 'pure to', '1', '2023-04-26 10:55:17', '1'),
(57, '15', 'user', 'template lang yan hahaha', '1', '2023-04-26 10:55:44', '1'),
(58, '15', 'user', 'bootstrap oo parang ganon rental', '1', '2023-04-26 10:55:55', '1'),
(59, '15', 'admin', 'Napakalakas talaga OMG', '1', '2023-04-26 10:56:23', '1'),
(60, '15', 'admin', 'Pwede kana mag ing instructor ', '1', '2023-04-26 10:56:33', '1'),
(61, '14', 'user', 'book ka na', '1', '2023-04-26 10:56:37', '1'),
(62, '14', 'user', 'walang stripe paypal lang', '1', '2023-04-26 10:56:43', '1'),
(63, '16', 'admin', 'hello\n', '1', '2023-04-26 12:57:57', '1'),
(64, '16', 'admin', '123123\n', '1', '2023-04-26 17:14:53', '1'),
(65, '16', 'admin', 'sdfsdfsdfsdf', '1', '2023-04-26 17:15:43', '1'),
(66, '16', 'admin', 'sdfsdsd sd sd \n', '1', '2023-04-26 17:15:45', '1'),
(67, '16', 'admin', 'sdvs d bsd sd sd \n', '1', '2023-04-26 17:15:47', '1'),
(68, '', 'admin', 'hallo\n', '0', '2023-04-26 18:23:19', '0'),
(69, '', 'admin', 'hallo', '0', '2023-04-26 18:23:25', '0'),
(70, '', 'admin', 'chat', '0', '2023-04-26 18:23:42', '0'),
(71, '', 'admin', 'chat', '0', '2023-04-26 18:24:03', '0'),
(72, '17', 'admin', 'halo', '1', '2023-04-26 18:24:18', '1'),
(73, '17', 'admin', 'hi\n', '1', '2023-04-26 18:26:06', '1'),
(74, '', 'admin', 'hi', '0', '2023-04-26 18:28:52', '0'),
(75, '', 'admin', 'hallo', '0', '2023-04-26 18:28:57', '0'),
(76, '18', 'admin', '12231231', '1', '2023-04-26 18:40:45', '1'),
(77, '18', 'user', 'sdfsdaf\n', '1', '2023-04-26 18:45:03', '1'),
(78, '17', 'user', 'fdasfs\n', '1', '2023-04-26 18:45:17', '0'),
(79, '14', 'admin', 'this is mae ann\n', '1', '2023-04-26 18:47:11', '1'),
(80, '18', 'admin', 'this is jeff', '1', '2023-04-26 18:48:05', '1'),
(81, '20', 'admin', 'hello i would like to ask for assitance\n', '0', '2023-04-28 08:22:41', '1'),
(82, '20', 'admin', 'mag rerent ako\n', '0', '2023-04-28 08:22:46', '1'),
(83, '', 'admin', 'hallo\n', '0', '2023-04-30 10:02:03', '0'),
(84, '', 'admin', 'hi\n', '0', '2023-04-30 10:02:45', '0'),
(85, '', 'admin', 'hi guys ', '0', '2023-04-30 10:02:51', '0'),
(86, '', 'admin', 'Test', '0', '2023-05-01 03:19:31', '0');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us_tbl`
--

CREATE TABLE `contact_us_tbl` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `dateAdded` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us_tbl`
--

INSERT INTO `contact_us_tbl` (`id`, `name`, `email`, `phone`, `message`, `dateAdded`) VALUES
(1, 'Grace Nicao Sonza Andaya', 'nikaandaya21@gmail.com', '09276980795', '123123', '2023-04-25 09:25:51'),
(7, 'jeff', 'eqweqeqweqwe@gmail.com', '09305043628', 'hi', '2023-04-26 19:48:28'),
(8, 'Jeff', 'jefferson_corral@aura.edu.ph', '09305043628', 'gib info', '2023-04-26 20:51:10'),
(9, 'Sharon Chan', 'sharonchan.tech@outlook.com', '9058899464', 'How are you?\r\n\r\nCan we talk about your Website?', '2023-04-28 01:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_tbl`
--

CREATE TABLE `reservation_tbl` (
  `id` int(150) NOT NULL,
  `userID` varchar(150) DEFAULT NULL,
  `fbEmail` varchar(150) DEFAULT NULL,
  `fbUsername` varchar(150) DEFAULT NULL,
  `type` varchar(150) DEFAULT NULL,
  `reviewCenter` varchar(150) DEFAULT NULL,
  `reviewLastSchool` varchar(150) DEFAULT NULL,
  `reviewLastSchoolLocation` varchar(150) DEFAULT NULL,
  `reviewLocation` varchar(150) DEFAULT NULL,
  `course` varchar(150) DEFAULT NULL,
  `yearLevel` varchar(150) DEFAULT NULL,
  `guardianName` varchar(150) DEFAULT '',
  `guardianNetwork` varchar(150) DEFAULT NULL,
  `guardianNumber` varchar(150) DEFAULT NULL,
  `guardianEmail` varchar(150) DEFAULT NULL,
  `guardianRelationship` varchar(150) DEFAULT NULL,
  `guardianAddress` varchar(150) DEFAULT NULL,
  `guardian2Name` varchar(150) DEFAULT NULL,
  `guardian2Network` varchar(150) DEFAULT NULL,
  `guardian2Number` varchar(150) DEFAULT NULL,
  `guardian2Email` varchar(150) DEFAULT NULL,
  `guardian2Relationship` varchar(150) DEFAULT NULL,
  `guardian2Address` varchar(150) DEFAULT NULL,
  `validDocu` varchar(150) DEFAULT NULL,
  `validDocuFile` varchar(150) DEFAULT NULL,
  `roomSelected` varchar(150) DEFAULT NULL,
  `isApprove` varchar(150) DEFAULT '0',
  `checkInDate` varchar(150) DEFAULT '',
  `checkoutDate` varchar(150) DEFAULT '',
  `dateUpdated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `dateAdded` datetime DEFAULT NULL,
  `paymentType` varchar(255) DEFAULT NULL,
  `paymentUpload` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_tbl`
--

INSERT INTO `reservation_tbl` (`id`, `userID`, `fbEmail`, `fbUsername`, `type`, `reviewCenter`, `reviewLastSchool`, `reviewLastSchoolLocation`, `reviewLocation`, `course`, `yearLevel`, `guardianName`, `guardianNetwork`, `guardianNumber`, `guardianEmail`, `guardianRelationship`, `guardianAddress`, `guardian2Name`, `guardian2Network`, `guardian2Number`, `guardian2Email`, `guardian2Relationship`, `guardian2Address`, `validDocu`, `validDocuFile`, `roomSelected`, `isApprove`, `checkInDate`, `checkoutDate`, `dateUpdated`, `dateAdded`, `paymentType`, `paymentUpload`) VALUES
(10, '12', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', 'Grade 11', 'res@asdasd.com', 'Smart', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', 'Smart', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', '483808652.pdf', '1', '1', '26 April, 2023', '30 April, 2023', '2023-04-29 14:23:10', '2023-04-22 09:33:59', 'Gcash', '434904248.pdf'),
(11, '14', 'marvin.monsalud.mm@gmail.com', 'res@asdasd.com', 'others', 'Test', 'Adamson', 'Kalayaan', 'QUEZON CITY', 'BSIT', '3rd Year', 'res@asdasd.com', 'Sun', '09611438093', 'marvin.monsalud.mm@gmail.com', 'res@asdasd.com', 'res@asdasd.com', 'res@asdasd.com', 'Globe', '0961 300 2479', 'marvin.monsalud.mm@gmail.com', 'res@asdasd.com', 'res@asdasd.com', '2Ids', '554071717.pdf', '2', '1', '24 April, 2023', '28 April, 2023', '2023-04-23 11:40:26', '2023-04-23 05:38:11', 'Paypal', NULL),
(12, '15', 'johndoe@gmail.com', 'johndoe', 'worker', '', 'aura', 'sbma', '', '', 'Grade 11', 'dad', 'Smart', '12345678909', 'dad@gmail.com', 'father', '01 Sampaloc Street', 'mom', 'Smart', '12345678909', 'mom@gmail.com', 'mother', '01 Sinigang St', 'schoolID', '139477800.jpg', '1', '2', '24 April, 2023', '28 April, 2023', '2023-04-25 16:13:06', '2023-04-24 07:06:36', 'Paypal', NULL),
(14, '33', 'eqweqeqweqwe@gmail.com', 'jeps', 'student', 'jeps center', 'aura college', 'olongapo', 'castillejos', 'bsit', '4th Year', 'jeff', 'Talk and Text', '09305043628', 'eqweqeqweqwe@gmail.com', 'twin', 'magsaysay,castillejos,zambales', 'ffej', 'Talk and Text', '-1123123131', 'eqweqeqweqwe@gmail.com', 'brother', '131231', 'schoolID', '369516811.png', '5', '2', '26 April, 2023', '26 April, 2023', '2023-04-26 13:52:51', '2023-04-26 18:56:10', 'Paypal', NULL),
(15, '33', 'eqweqeqweqwe@gmail.com', 'qweqweq', 'student', 'qweqe', 'eeee', 'eee', 'eqweee', 'qweqwe', '4th Year', 'eqweqwe', 'Talk and Text', '12345678900', 'eqweqeqweqwe@gmail.com', 'qweqwe', 'qweqweq', 'asdasd', 'Talk and Text', '12345678900', 'eqweqeqweqwe@gmail.com', 'asdasd', 'asdadasd', 'schoolID', '661419688.png', '1', '1', '26 April, 2023', '26 April, 2023', '2023-04-26 14:08:20', '2023-04-26 19:29:47', NULL, NULL),
(16, '40', 'mae@gmail.com', 'mae', 'student', '', '', '', '', '', '', 'dad', 'Globe', '09123456789', 'wa@gmail.com', 'father', '01 Sampaloc Street', 'mom', 'Talk and Text', '09123456789', 'ma@gmail.com', 'mother', '01 Sinigang St.', 'schoolID', '327124097.png', '6', '1', '28 April, 2023', '30 April, 2023', '2023-04-28 03:01:30', '2023-04-28 08:27:34', 'Paypal', NULL),
(17, '43', '123123@gmail.com', '123123', '123123', '123123', '123123', '123123', '123123', '123123', 'Grade 12', '123123', 'Globe', '09613002474', '123123123123@gmail.com', '123123', '123123', '123123', 'GOMO', '09613002474', '123123@gmail.com', '123123', '123123', '123123', '106515802.txt', '1', '0', '9 May, 2023', '26 May, 2023', NULL, '2023-05-01 16:27:35', NULL, NULL),
(18, '48', '123123@gmail.com', '123123', '123123', '123123', '123123', '123123', '123123', '123123', '3rd Year', '123123', 'Sun', '09611438093', 'mariamelissax@gmail.com', '123123', '83 ANONAS STREET', '123123', 'Smart', '09611438093', '123123@123.com', '123123', '123123', '123123', '749649941.jpg', '1', '0', '2 May, 2023', '26 May, 2023', NULL, '2023-05-01 16:37:55', NULL, NULL),
(19, '15', 'sadasdasd@e.com', 'sadasdad', 'student', 'asdadsa', 'asdasd', 'asdasd', 'asdasd', 'asdasdasd', 'Grade 11', 'asdasd', 'Globe', '09065397259', 'asdasd@a.co', 'asdads', 'asdasd', 'asdadsad', 'Globe', '09065397785', 'asdadad@gmail.co', 'asdasd', 'asdasd', 'schoolID', '456086547.css', '1', '0', '3 May, 2023', '27 May, 2023', NULL, '2023-05-02 16:38:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reserve_billing_tbl`
--

CREATE TABLE `reserve_billing_tbl` (
  `id` int(11) NOT NULL,
  `reservationFee` varchar(255) DEFAULT NULL,
  `securityDeposit` varchar(255) DEFAULT NULL,
  `utilityDeposit` varchar(255) DEFAULT NULL,
  `bedSheetDeposit` varchar(255) DEFAULT NULL,
  `aptKey` varchar(255) DEFAULT NULL,
  `roomTypeDeposit` varchar(255) DEFAULT NULL,
  `firstMonthRental` varchar(255) DEFAULT NULL,
  `proRatedRentalDeposit` varchar(255) DEFAULT NULL,
  `reservationID` varchar(255) DEFAULT NULL,
  `dateAdded` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reserve_billing_tbl`
--

INSERT INTO `reserve_billing_tbl` (`id`, `reservationFee`, `securityDeposit`, `utilityDeposit`, `bedSheetDeposit`, `aptKey`, `roomTypeDeposit`, `firstMonthRental`, `proRatedRentalDeposit`, `reservationID`, `dateAdded`) VALUES
(13, '500', '500', '500', '500', '500', '500', '500', '500', '10', '2023-04-22 09:34:53'),
(14, '1000', '1000', '1000', '1000', '1000', '2000', '2000', '2000', '11', '2023-04-23 05:39:29'),
(16, '1000', '1000', '1000', '1000', '1000', '2000', '0', '1000', '12', '2023-04-24 08:23:30'),
(17, '500', '500', '500', '500', '500', '500', '0', '2000', '14', '2023-04-26 19:03:53'),
(18, '500', '500', '500', '500', '500', '500', '0', '2000', '15', '2023-04-26 19:38:20'),
(19, '500', '1000', '500', '500', '500', '500', '0', '500', '16', '2023-04-28 08:29:54'),
(20, '0', '0', '0', '0', '0', '2000', '0', '0', '10', '2023-04-29 19:53:10');

-- --------------------------------------------------------

--
-- Table structure for table `rooms_tbl`
--

CREATE TABLE `rooms_tbl` (
  `id` int(150) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `photo` varchar(150) DEFAULT NULL,
  `type` varchar(150) DEFAULT NULL,
  `duration` varchar(150) DEFAULT NULL,
  `price` varchar(150) DEFAULT NULL,
  `roomNo` varchar(150) DEFAULT '',
  `dateAdded` timestamp NULL DEFAULT NULL,
  `dateEdited` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms_tbl`
--

INSERT INTO `rooms_tbl` (`id`, `description`, `photo`, `type`, `duration`, `price`, `roomNo`, `dateAdded`, `dateEdited`) VALUES
(1, 'Solo transient rent and you will share the room with others.', '126663853.png', 'Bedspace', 'Transient', '500 per day', '130', '2023-04-26 22:09:06', '2023-05-01 09:16:38'),
(8, 'Solo rent and you will share the room with others.', '366611123.png', 'Bedspace', 'Monthly', '1500 per month', '120', '2023-04-26 22:06:52', '2023-05-01 09:15:33');

-- --------------------------------------------------------

--
-- Table structure for table `room_checkout_tbl`
--

CREATE TABLE `room_checkout_tbl` (
  `id` int(250) NOT NULL,
  `returnItems` varchar(250) DEFAULT NULL,
  `refunds` varchar(250) DEFAULT NULL,
  `unpaid` varchar(250) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `reservationID` varchar(250) DEFAULT NULL,
  `dateAdded` datetime DEFAULT NULL,
  `isApprove` varchar(250) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_checkout_tbl`
--

INSERT INTO `room_checkout_tbl` (`id`, `returnItems`, `refunds`, `unpaid`, `note`, `reservationID`, `dateAdded`, `isApprove`) VALUES
(1, 'asdasdasd', '123123', '123', '123', '10', '2023-04-22 14:16:02', '3'),
(2, 'keys', '123', '123', '123123123', '12', '2023-04-24 13:01:04', '3'),
(3, 'keys', '123123', '123123', '123123', '10', '2023-04-26 17:22:44', '3'),
(4, '12312', '12312', '123', '123123', '14', '2023-04-26 19:22:12', '0');

-- --------------------------------------------------------

--
-- Table structure for table `room_maintainance_tbl`
--

CREATE TABLE `room_maintainance_tbl` (
  `id` int(200) NOT NULL,
  `reservationID` varchar(200) DEFAULT NULL,
  `reason` varchar(200) DEFAULT '',
  `isApprove` varchar(200) DEFAULT '0',
  `dateAdded` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_maintainance_tbl`
--

INSERT INTO `room_maintainance_tbl` (`id`, `reservationID`, `reason`, `isApprove`, `dateAdded`) VALUES
(5, '10', '123123123123', '3', '2023-04-22 13:37:57'),
(6, '10', 'a sfasd asd asd as da sd asd', '1', '2023-04-22 13:55:05'),
(7, '12', 'wsssd', '1', '2023-04-24 12:36:55'),
(8, '14', 'spilled milk', '1', '2023-04-26 19:20:21'),
(9, '14', '1231231', '1', '2023-04-26 19:21:16');

-- --------------------------------------------------------

--
-- Table structure for table `room_monthly_bills_tbl`
--

CREATE TABLE `room_monthly_bills_tbl` (
  `id` int(150) NOT NULL,
  `reservationID` varchar(150) DEFAULT NULL,
  `water` varchar(150) DEFAULT NULL,
  `electricity` varchar(150) DEFAULT NULL,
  `rent` varchar(150) DEFAULT NULL,
  `others` varchar(150) DEFAULT NULL,
  `paymentType` varchar(150) DEFAULT NULL,
  `paymentUpload` varchar(150) DEFAULT NULL,
  `dateAdded` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_monthly_bills_tbl`
--

INSERT INTO `room_monthly_bills_tbl` (`id`, `reservationID`, `water`, `electricity`, `rent`, `others`, `paymentType`, `paymentUpload`, `dateAdded`) VALUES
(5, '10', '500', '500', '500', '500', 'Paypal', NULL, '2023-04-22 09:44:52'),
(8, '11', '1000', '1000', '1000', '1000', 'Gcash', '298243196.txt', '2023-04-23 06:13:36'),
(9, '12', '300', '500', '2500', '0', 'Paypal', NULL, '2023-04-24 08:45:57'),
(10, '14', '500', '500', '500', '0', 'Paypal', NULL, '2023-04-26 19:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `room_transfer_tbl`
--

CREATE TABLE `room_transfer_tbl` (
  `id` int(200) NOT NULL,
  `reservationID` varchar(200) DEFAULT NULL,
  `roomNo` varchar(200) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `isApprove` varchar(200) DEFAULT '0',
  `dateAdded` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_transfer_tbl`
--

INSERT INTO `room_transfer_tbl` (`id`, `reservationID`, `roomNo`, `note`, `isApprove`, `dateAdded`) VALUES
(5, '10', '123123123', '123123123123', '2', '2023-04-22 13:37:57'),
(6, '11', '508', 'This is a tesrt', '0', '2023-04-23 06:15:32'),
(7, '12', '100', 'yaw ko dito', '3', '2023-04-24 12:32:51'),
(8, '14', '123', 'need leave', '0', '2023-04-26 19:14:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `id` int(155) NOT NULL,
  `fullname` varchar(155) DEFAULT '',
  `email` varchar(155) DEFAULT NULL,
  `password` varchar(155) DEFAULT NULL,
  `phoneNumber` varchar(155) DEFAULT NULL,
  `bday` varchar(155) DEFAULT '',
  `gender` varchar(155) DEFAULT '',
  `dateAdded` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_tbl`
--

INSERT INTO `user_tbl` (`id`, `fullname`, `email`, `password`, `phoneNumber`, `bday`, `gender`, `dateAdded`) VALUES
(12, 'Mark Villar 2', 'marvin.monsalud.mm@gmail.com', 'ceb6c970658f31504a901b89dcd3e461', NULL, NULL, NULL, '2023-04-19 10:48:47'),
(14, 'John Does', 'john@gmail.com', 'ceb6c970658f31504a901b89dcd3e461', '09613002479', '2023-04-19', 'male', '2023-04-23 05:36:13'),
(15, 'John Doe', 'johndoe@gmail.com', '4297f44b13955235245b2497399d7a93', '09613002479', '2023-04-25', 'female', '2023-04-24 06:45:26'),
(28, 'Mae Ann Joy Tacorda', 'maeann_tacorda@aura.edu.ph', '5fe7f9d2b724202c0225ed748ca8e1a6', '09982681984', '2000-05-13', 'female', '2023-04-26 08:00:34'),
(29, 'jefferson corral', 'jefferson_corral@aura.edu.ph', 'f5bb0c8de146c67b44babbf4e6584cc0', '0930', '2023-04-26', 'male', '2023-04-26 08:25:43'),
(30, 'kobe', 'kobe@mail.com', '202cb962ac59075b964b07152d234b70', NULL, '', '', '2023-04-26 10:52:30'),
(31, 'Nika Inspired GOD', 'Nika@Napakalakas.com', '08110a9d8beeeb9c9f77fc0490cd2ef8', NULL, '', '', '2023-04-26 10:52:32'),
(32, 'asd', 'asd@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, '', '', '2023-04-26 10:52:41'),
(33, 'jeff c', 'eqweqeqweqwe@gmail.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '09305043628', '2023-04-26', 'male', '2023-04-26 18:27:36'),
(36, 'grace', 'grace@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, '', '', '2023-04-27 10:15:21'),
(37, 'mae', 'mae@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, '', '', '2023-04-27 14:29:33'),
(38, 'hans geronimo', 'hanselot123@gmail.com', 'cb7549a0d02b69e89cbcb6c0c64801c9', NULL, '', '', '2023-04-27 21:04:05'),
(39, 'Katrina Mae De Leon', 'deleon.katrinamae.aura@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '09567612431', '1999-12-04', 'male', '2023-04-28 06:41:48'),
(40, 'Mae Ann', 'maeann@gmail.com', '4297f44b13955235245b2497399d7a93', '09123456789', '2023-04-28', 'female', '2023-04-28 08:21:07'),
(41, 'Juan Dela Cruz', 'juandelacruz@gmail.com', '3d81ce8c68f69bf6c36057b9b668b2ba', '09342477428', '2023-04-29', 'male', '2023-04-29 11:04:13'),
(42, 'jeff', 'jeff@gmail.com', '202cb962ac59075b964b07152d234b70', '09276980795', '2023-04-18', 'male', '2023-04-29 21:05:32'),
(44, 'check', 'check@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, '', '', '2023-04-29 21:22:11'),
(45, 'jeff corral', 'jeff123@gmail.com', '4297f44b13955235245b2497399d7a93', NULL, '', '', '2023-04-30 10:00:28'),
(46, 'Ken Rabiya', 'poram50037@meidecn.com', '9c798a921d95083255baf0444c4f82a7', NULL, '', '', '2023-05-01 12:03:05'),
(48, 'Marvi', 'monsalud26@gmail.com', '7a5e05c3dae4a4b2d85268aca11af845', NULL, '', '', '2023-05-01 16:37:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user_tbl`
--
ALTER TABLE `admin_user_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_history`
--
ALTER TABLE `chat_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_msgs`
--
ALTER TABLE `chat_msgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us_tbl`
--
ALTER TABLE `contact_us_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation_tbl`
--
ALTER TABLE `reservation_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reserve_billing_tbl`
--
ALTER TABLE `reserve_billing_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms_tbl`
--
ALTER TABLE `rooms_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_checkout_tbl`
--
ALTER TABLE `room_checkout_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_maintainance_tbl`
--
ALTER TABLE `room_maintainance_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_monthly_bills_tbl`
--
ALTER TABLE `room_monthly_bills_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_transfer_tbl`
--
ALTER TABLE `room_transfer_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user_tbl`
--
ALTER TABLE `admin_user_tbl`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chat_history`
--
ALTER TABLE `chat_history`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `chat_msgs`
--
ALTER TABLE `chat_msgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `contact_us_tbl`
--
ALTER TABLE `contact_us_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reservation_tbl`
--
ALTER TABLE `reservation_tbl`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `reserve_billing_tbl`
--
ALTER TABLE `reserve_billing_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `rooms_tbl`
--
ALTER TABLE `rooms_tbl`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `room_checkout_tbl`
--
ALTER TABLE `room_checkout_tbl`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `room_maintainance_tbl`
--
ALTER TABLE `room_maintainance_tbl`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `room_monthly_bills_tbl`
--
ALTER TABLE `room_monthly_bills_tbl`
  MODIFY `id` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `room_transfer_tbl`
--
ALTER TABLE `room_transfer_tbl`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `id` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
