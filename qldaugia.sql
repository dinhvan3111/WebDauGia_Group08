-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 09, 2022 lúc 01:56 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qldaugia`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `username` varchar(150) CHARACTER SET ascii DEFAULT NULL,
  `pwd` varchar(100) CHARACTER SET ascii DEFAULT NULL,
  `id_permission` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) CHARACTER SET ascii DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `is_locked` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `pwd`, `id_permission`, `name`, `email`, `dob`, `addr`, `is_locked`) VALUES
(0000000015, '110452804810388facebook', NULL, 3, 'Elizabeth Algecgkdeheg Chengsen', 'ixnxqhmhoj_1638799299@tfbnw.net', NULL, NULL, 0),
(0000000019, 'a', NULL, 3, 'aaaaa', 'a@gmail.com', NULL, NULL, 0),
(0000000020, '108130178380491facebook', NULL, 3, 'Open Graph Test User', 'open_hjrryuc_user@tfbnw.net', NULL, NULL, 0),
(0000000043, 'ab', '$2b$10$vWfmmjKKsE.RBaSe/Uy0HeuRbJTlxZ.pbwIZWDp.NkXLBKr.YVmBG', 1, 'Hai Tuan Vu', 'vutuanhaigk@gmail.com', '2021-11-30', 'ab', 0),
(0000000044, 'abc', '$2b$10$Ony22vGMo9eDuzbxFuCVluilWyxWgWY9zJM8uC7QDuUaBjPwzT.Rq', 2, 'Hai Tuan Vu', 'drl19hcmus@gmail.com', '0000-00-00', 'abc', 0),
(0000000046, 'aba', '$2b$10$d6ZkiQ.UsMcCo9UieJVbouGzi0pBT.qxGL7st.GD3Xtl07Je2J/ki', 3, 'Hai Tuan Vu', 'tocafep687@videour.com', '0000-00-00', 'ab', 0),
(0000000047, '105751357318145639642google', NULL, 2, 'Do Van', 'dinhvan3111@gmail.com', NULL, NULL, 0),
(0000000048, 'dinhvan', '$2b$10$xWHlip460bWo849801nc4.8r0URpaCaCtL6utP0fFaFnyvijxyE3i', 2, 'Do Dinh Van', 'dodinhvan3111@gmail.com', '2001-11-03', 'Tây Sơn - Bình Định', 0),
(0000000049, '110452804810387facebook', NULL, 3, 'Elizabeth Algecgkdeheg Chengsen', 'hoyahe2221@ritumusic.com', NULL, NULL, 0),
(0000000050, '104913772676972067806google', NULL, 3, 'Hai VuTuan', 'vutuanhaigk123@gmail.com', NULL, NULL, 0),
(0000000051, 'tushimon', '$2b$10$NdZkktdjdNbl5TanmIBgvevacGITGMIitJYdupr8XYMElkewCuiMa', 1, 'Nguyễn Trần Ngọc Tú', 'ngoctu.280801@gmail.com', '2001-08-28', 'Cần Đước, Long An', 0),
(0000000052, '110765543678667073301google', NULL, 2, 'Tú Nguyễn Trần Ngọc', 'ntntu19@clc.fitus.edu.vn', '2001-08-28', 'Long An', 0),
(0000000053, '112099082612252636766google', NULL, 2, 'Tuan Tran', 'tuantran.280801@gmail.com', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bid_history`
--

CREATE TABLE `bid_history` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_product` int(10) UNSIGNED ZEROFILL NOT NULL,
  `in_bid_price` decimal(10,0) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `bid_history`
--

INSERT INTO `bid_history` (`id`, `time`, `id_acc`, `id_product`, `in_bid_price`) VALUES
(0000000093, '2022-01-04 11:54:35', 0000000051, 0000000005, '28000000'),
(0000000094, '2022-01-04 11:55:42', 0000000051, 0000000007, '19000000'),
(0000000095, '2022-01-04 12:44:03', 0000000053, 0000000005, '29000000'),
(0000000096, '2022-01-04 12:44:03', 0000000051, 0000000005, '30000000'),
(0000000097, '2022-01-04 12:44:45', 0000000053, 0000000005, '31000000'),
(0000000098, '2022-01-04 12:45:17', 0000000051, 0000000005, '32000000'),
(0000000099, '2022-01-04 12:52:06', 0000000044, 0000000007, '19500000'),
(0000000100, '2022-01-04 12:52:06', 0000000051, 0000000007, '20000000'),
(0000000101, '2022-01-04 12:52:18', 0000000044, 0000000007, '20500000'),
(0000000102, '2022-01-04 12:52:41', 0000000044, 0000000005, '34000000'),
(0000000103, '2022-01-04 12:52:41', 0000000051, 0000000005, '35000000'),
(0000000104, '2022-01-04 12:53:05', 0000000044, 0000000002, '9000000'),
(0000000105, '2022-01-04 12:53:49', 0000000044, 0000000009, '22000000'),
(0000000106, '2022-01-04 13:00:33', 0000000051, 0000000002, '10000000'),
(0000000107, '2022-01-04 13:00:53', 0000000051, 0000000001, '30000000'),
(0000000108, '2022-01-04 13:01:34', 0000000051, 0000000007, '21000000'),
(0000000109, '2022-01-04 13:01:34', 0000000044, 0000000007, '21500000'),
(0000000110, '2022-01-04 13:05:13', 0000000053, 0000000001, '30000000'),
(0000000111, '2022-01-04 13:05:13', 0000000051, 0000000001, '31000000'),
(0000000112, '2022-01-04 13:05:22', 0000000053, 0000000001, '32000000'),
(0000000113, '2022-01-04 13:05:43', 0000000051, 0000000001, '33000000'),
(0000000114, '2022-01-04 13:05:43', 0000000053, 0000000001, '34000000'),
(0000000115, '2022-01-04 13:05:59', 0000000051, 0000000007, '30000000'),
(0000000116, '2022-01-04 13:08:05', 0000000043, 0000000002, '10500000'),
(0000000117, '2022-01-04 13:08:51', 0000000051, 0000000002, '11000000'),
(0000000118, '2022-01-04 13:09:23', 0000000043, 0000000002, '11000000'),
(0000000119, '2022-01-04 13:09:23', 0000000051, 0000000002, '11500000'),
(0000000120, '2022-01-04 13:10:18', 0000000043, 0000000002, '15000000'),
(0000000121, '2022-01-04 13:11:59', 0000000043, 0000000006, '49000000'),
(0000000122, '2022-01-04 13:13:02', 0000000051, 0000000006, '51000000'),
(0000000123, '2022-01-04 13:13:16', 0000000043, 0000000006, '52000000'),
(0000000124, '2022-01-04 13:13:16', 0000000051, 0000000006, '53000000'),
(0000000125, '2022-01-04 13:14:17', 0000000043, 0000000006, '54000000'),
(0000000126, '2022-01-04 13:14:17', 0000000051, 0000000006, '55000000'),
(0000000127, '2022-01-04 13:14:38', 0000000051, 0000000003, '22000000'),
(0000000128, '2022-01-04 13:14:54', 0000000043, 0000000003, '22000000'),
(0000000129, '2022-01-04 13:14:54', 0000000051, 0000000003, '23000000'),
(0000000130, '2022-01-04 13:15:42', 0000000043, 0000000003, '24000000'),
(0000000131, '2022-01-04 13:16:10', 0000000051, 0000000003, '24000000'),
(0000000132, '2022-01-04 13:16:10', 0000000043, 0000000003, '25000000'),
(0000000133, '2022-01-04 13:17:43', 0000000051, 0000000008, '36000000'),
(0000000134, '2022-01-04 13:17:58', 0000000043, 0000000008, '38000000'),
(0000000135, '2022-01-04 13:18:08', 0000000051, 0000000008, '38000000'),
(0000000136, '2022-01-04 13:18:08', 0000000043, 0000000008, '39000000'),
(0000000137, '2022-01-04 13:18:26', 0000000051, 0000000008, '40000000'),
(0000000138, '2022-01-04 13:18:53', 0000000043, 0000000009, '22000000'),
(0000000139, '2022-01-04 13:18:53', 0000000044, 0000000009, '23000000'),
(0000000140, '2022-01-04 13:19:19', 0000000051, 0000000009, '24000000'),
(0000000141, '2022-01-04 13:19:34', 0000000043, 0000000009, '25000000'),
(0000000142, '2022-01-04 13:20:00', 0000000043, 0000000010, '45000000'),
(0000000143, '2022-01-04 13:20:40', 0000000052, 0000000011, '10000000'),
(0000000144, '2022-01-04 13:21:08', 0000000052, 0000000009, '25000000'),
(0000000145, '2022-01-04 13:21:08', 0000000043, 0000000009, '26000000'),
(0000000146, '2022-01-04 13:22:01', 0000000051, 0000000010, '48000000'),
(0000000147, '2022-01-04 13:22:01', 0000000043, 0000000010, '50000000'),
(0000000148, '2022-01-04 13:22:56', 0000000052, 0000000010, '50000000'),
(0000000149, '2022-01-04 13:22:56', 0000000043, 0000000010, '52000000'),
(0000000150, '2022-01-04 13:23:14', 0000000043, 0000000011, '11000000'),
(0000000151, '2022-01-04 13:23:14', 0000000052, 0000000011, '11500000'),
(0000000152, '2022-01-04 13:23:25', 0000000043, 0000000011, '11500000'),
(0000000153, '2022-01-04 13:23:25', 0000000052, 0000000011, '12000000'),
(0000000154, '2022-01-04 13:23:52', 0000000051, 0000000012, '33000000'),
(0000000155, '2022-01-04 13:24:01', 0000000043, 0000000012, '35000000'),
(0000000156, '2022-01-04 13:24:11', 0000000052, 0000000012, '35000000'),
(0000000157, '2022-01-04 13:24:11', 0000000043, 0000000012, '36000000'),
(0000000158, '2022-01-04 13:24:19', 0000000052, 0000000012, '37000000'),
(0000000159, '2022-01-04 13:25:16', 0000000051, 0000000004, '40000000'),
(0000000160, '2022-01-04 13:25:49', 0000000043, 0000000004, '40000000'),
(0000000161, '2022-01-04 13:25:49', 0000000051, 0000000004, '42000000'),
(0000000162, '2022-01-04 13:26:10', 0000000043, 0000000004, '44000000'),
(0000000163, '2022-01-04 13:26:22', 0000000051, 0000000004, '44000000'),
(0000000164, '2022-01-04 13:26:22', 0000000043, 0000000004, '46000000'),
(0000000165, '2022-01-05 13:20:16', 0000000046, 0000000013, '200000'),
(0000000166, '2022-01-05 13:25:51', 0000000044, 0000000013, '400000'),
(0000000167, '2022-01-05 13:25:51', 0000000046, 0000000013, '500000'),
(0000000168, '2022-01-05 13:26:21', 0000000044, 0000000013, '1000000'),
(0000000169, '2022-01-05 13:26:21', 0000000046, 0000000013, '1100000'),
(0000000170, '2022-01-05 15:00:08', 0000000046, 0000000014, '100000'),
(0000000171, '2022-01-05 15:01:33', 0000000044, 0000000014, '200000'),
(0000000172, '2022-01-05 15:01:33', 0000000046, 0000000014, '210000'),
(0000000173, '2022-01-05 15:02:04', 0000000044, 0000000014, '300000'),
(0000000174, '2022-01-05 15:02:04', 0000000046, 0000000014, '310000'),
(0000000175, '2022-01-05 15:09:34', 0000000044, 0000000015, '100000'),
(0000000176, '2022-01-05 15:10:09', 0000000046, 0000000015, '200000'),
(0000000177, '2022-01-05 15:10:09', 0000000044, 0000000015, '210000'),
(0000000178, '2022-01-05 15:10:19', 0000000046, 0000000015, '500000'),
(0000000179, '2022-01-05 15:10:19', 0000000044, 0000000015, '510000'),
(0000000180, '2022-01-05 15:15:44', 0000000046, 0000000016, '100000'),
(0000000181, '2022-01-05 15:16:27', 0000000044, 0000000016, '200000'),
(0000000182, '2022-01-05 15:16:27', 0000000046, 0000000016, '210000'),
(0000000183, '2022-01-05 15:16:44', 0000000044, 0000000016, '400000'),
(0000000184, '2022-01-05 15:16:44', 0000000046, 0000000016, '410000'),
(0000000185, '2022-01-05 15:24:34', 0000000044, 0000000017, '100000'),
(0000000186, '2022-01-05 15:25:10', 0000000044, 0000000018, '100000'),
(0000000187, '2022-01-05 15:28:13', 0000000046, 0000000017, '200000'),
(0000000188, '2022-01-05 15:28:13', 0000000044, 0000000017, '210000'),
(0000000189, '2022-01-05 15:29:20', 0000000046, 0000000017, '400000'),
(0000000190, '2022-01-05 15:29:20', 0000000044, 0000000017, '410000'),
(0000000191, '2022-01-05 15:32:23', 0000000046, 0000000018, '200000'),
(0000000192, '2022-01-05 15:32:24', 0000000044, 0000000018, '210000'),
(0000000193, '2022-01-05 15:35:30', 0000000046, 0000000018, '400000'),
(0000000194, '2022-01-05 15:35:30', 0000000044, 0000000018, '410000'),
(0000000195, '2022-01-05 15:46:56', 0000000046, 0000000019, '100000'),
(0000000196, '2022-01-05 15:47:18', 0000000046, 0000000020, '100000'),
(0000000197, '2022-01-05 15:48:11', 0000000044, 0000000020, '400000'),
(0000000198, '2022-01-05 15:48:11', 0000000046, 0000000020, '500000'),
(0000000199, '2022-01-05 15:48:23', 0000000044, 0000000019, '500000'),
(0000000200, '2022-01-05 15:48:23', 0000000046, 0000000019, '510000'),
(0000000201, '2022-01-05 15:48:32', 0000000044, 0000000020, '800000'),
(0000000202, '2022-01-05 15:48:32', 0000000046, 0000000020, '900000'),
(0000000203, '2022-01-05 15:48:42', 0000000044, 0000000019, '1000000'),
(0000000204, '2022-01-05 15:48:42', 0000000046, 0000000019, '1010000'),
(0000000205, '2022-01-08 22:01:25', 0000000043, 0000000022, '30000000'),
(0000000206, '2022-01-08 22:02:17', 0000000048, 0000000022, '33000000'),
(0000000207, '2022-01-08 22:02:17', 0000000043, 0000000022, '33500000'),
(0000000208, '2022-01-08 22:02:55', 0000000048, 0000000024, '200000000'),
(0000000209, '2022-01-09 17:41:38', 0000000051, 0000000008, '50000000'),
(0000000210, '2022-01-09 19:48:52', 0000000053, 0000000030, '25000000'),
(0000000211, '2022-01-09 19:49:29', 0000000052, 0000000030, '25000000'),
(0000000212, '2022-01-09 19:49:29', 0000000053, 0000000030, '26000000'),
(0000000213, '2022-01-09 19:49:36', 0000000052, 0000000030, '27000000'),
(0000000214, '2022-01-09 19:49:59', 0000000053, 0000000030, '28000000'),
(0000000215, '2022-01-09 19:50:15', 0000000051, 0000000030, '29000000'),
(0000000216, '2022-01-09 19:50:15', 0000000053, 0000000030, '30000000'),
(0000000217, '2022-01-09 19:50:33', 0000000051, 0000000024, '230000000'),
(0000000218, '2022-01-09 19:50:47', 0000000043, 0000000024, '240000000'),
(0000000219, '2022-01-09 19:50:47', 0000000051, 0000000024, '250000000'),
(0000000220, '2022-01-09 19:50:53', 0000000043, 0000000024, '260000000'),
(0000000221, '2022-01-09 19:51:32', 0000000053, 0000000027, '950000'),
(0000000222, '2022-01-09 19:51:46', 0000000052, 0000000027, '1050000'),
(0000000223, '2022-01-09 19:52:03', 0000000051, 0000000027, '1100000'),
(0000000224, '2022-01-09 19:52:17', 0000000052, 0000000027, '1400000'),
(0000000225, '2022-01-09 19:52:17', 0000000051, 0000000027, '1450000'),
(0000000226, '2022-01-09 19:52:31', 0000000052, 0000000029, '2000000'),
(0000000227, '2022-01-09 19:52:42', 0000000053, 0000000029, '2200000'),
(0000000228, '2022-01-09 19:52:42', 0000000052, 0000000029, '2400000'),
(0000000229, '2022-01-09 19:53:32', 0000000053, 0000000029, '2800000'),
(0000000230, '2022-01-09 19:54:20', 0000000052, 0000000029, '3000000'),
(0000000231, '2022-01-09 19:54:52', 0000000043, 0000000033, '2100000'),
(0000000232, '2022-01-09 19:55:21', 0000000051, 0000000033, '2100000'),
(0000000233, '2022-01-09 19:55:21', 0000000043, 0000000033, '2200000'),
(0000000234, '2022-01-09 19:55:59', 0000000052, 0000000033, '2300000'),
(0000000235, '2022-01-09 19:56:14', 0000000043, 0000000033, '2700000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bid_price`
--

CREATE TABLE `bid_price` (
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_product` int(10) UNSIGNED ZEROFILL NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `max_bid_price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `bid_price`
--

INSERT INTO `bid_price` (`id_acc`, `id_product`, `time`, `max_bid_price`) VALUES
(0000000043, 0000000003, '2022-01-04 06:15:42', '26000000'),
(0000000043, 0000000004, '2022-01-04 06:26:10', '46000000'),
(0000000043, 0000000006, '2022-01-04 06:11:59', '50000000'),
(0000000043, 0000000009, '2022-01-04 06:19:34', '26000000'),
(0000000043, 0000000010, '2022-01-04 06:22:32', '52000000'),
(0000000043, 0000000012, '2022-01-04 06:24:01', '36000000'),
(0000000043, 0000000022, '2022-01-08 15:01:25', '35000000'),
(0000000043, 0000000024, '2022-01-09 12:50:53', '260000000'),
(0000000043, 0000000033, '2022-01-09 12:54:52', '2700000'),
(0000000044, 0000000009, '2022-01-04 05:53:49', '23000000'),
(0000000044, 0000000015, '2022-01-05 08:09:34', '4900000'),
(0000000044, 0000000017, '2022-01-05 08:24:34', '1000000'),
(0000000044, 0000000018, '2022-01-05 08:25:09', '2000000'),
(0000000046, 0000000013, '2022-01-05 06:20:16', '1800000'),
(0000000046, 0000000014, '2022-01-05 08:00:08', '4900000'),
(0000000046, 0000000016, '2022-01-05 08:15:44', '2000000'),
(0000000046, 0000000019, '2022-01-05 08:46:56', '5000000'),
(0000000046, 0000000020, '2022-01-05 08:47:18', '4000000'),
(0000000048, 0000000024, '2022-01-08 15:02:55', '220000000'),
(0000000051, 0000000001, '2022-01-04 06:00:53', '31000000'),
(0000000051, 0000000003, '2022-01-04 06:14:38', '23000000'),
(0000000051, 0000000004, '2022-01-04 06:25:16', '42000000'),
(0000000051, 0000000005, '2022-01-04 04:54:35', '40000000'),
(0000000051, 0000000006, '2022-01-04 06:13:02', '55000000'),
(0000000051, 0000000009, '2022-01-04 06:19:19', '24000000'),
(0000000051, 0000000012, '2022-01-04 06:23:52', '34000000'),
(0000000051, 0000000024, '2022-01-09 12:50:33', '250000000'),
(0000000051, 0000000027, '2022-01-09 12:52:03', '1500000'),
(0000000052, 0000000011, '2022-01-04 06:20:40', '12000000'),
(0000000052, 0000000012, '2022-01-04 06:24:19', '38000000'),
(0000000052, 0000000027, '2022-01-09 12:51:46', '1050000'),
(0000000052, 0000000029, '2022-01-09 12:52:31', '3200000'),
(0000000052, 0000000030, '2022-01-09 12:49:36', '27000000'),
(0000000052, 0000000033, '2022-01-09 12:55:59', '2600000'),
(0000000053, 0000000001, '2022-01-04 06:05:22', '35000000'),
(0000000053, 0000000005, '2022-01-04 05:44:45', '31000000'),
(0000000053, 0000000027, '2022-01-09 12:51:32', '1000000'),
(0000000053, 0000000029, '2022-01-09 12:53:32', '2800000'),
(0000000053, 0000000030, '2022-01-09 12:48:52', '30000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent_id` int(10) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`) VALUES
(0000000001, 'Điện tử', NULL),
(0000000002, 'Điện thoại di động', 0000000001),
(0000000003, 'Máy tính xách tay', 0000000001),
(0000000007, 'Sách, Tiểu thuyết', NULL),
(0000000012, 'Sách khoa học', 0000000007),
(0000000014, 'Sách hành động', 0000000007),
(0000000015, 'Tai nghe', 0000000001),
(0000000017, 'Xe', NULL),
(0000000018, 'Xe máy', 0000000017),
(0000000019, 'Ô tô', 0000000017),
(0000000020, 'Thể thao', NULL),
(0000000021, 'Phụ kiện thể thao', 0000000020),
(0000000022, 'Giày thể thao', 0000000020);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `change_pwd`
--

CREATE TABLE `change_pwd` (
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL,
  `token` varchar(100) NOT NULL,
  `expired_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `change_pwd`
--

INSERT INTO `change_pwd` (`id_acc`, `token`, `expired_date`) VALUES
(0000000048, '67450865726bd069c67d8ca966bd1183ce50b4a72782807fcdb4cb297a81b2511d2feac93bda4bc2f54f14c77f7d26b40570', '2022-01-05 12:48:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ignore_bidder`
--

CREATE TABLE `ignore_bidder` (
  `id_product` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `not_verified_email`
--

CREATE TABLE `not_verified_email` (
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL,
  `token` varchar(100) NOT NULL,
  `expired_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,0) UNSIGNED NOT NULL,
  `step_price` decimal(10,0) UNSIGNED NOT NULL,
  `buy_now_price` decimal(10,0) UNSIGNED DEFAULT NULL,
  `time_start` datetime NOT NULL DEFAULT current_timestamp(),
  `time_end` datetime NOT NULL,
  `description` mediumtext NOT NULL,
  `auto_renew` int(11) NOT NULL DEFAULT 0,
  `id_category` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_win_bidder` int(10) UNSIGNED ZEROFILL DEFAULT NULL,
  `id_seller` int(10) UNSIGNED ZEROFILL NOT NULL,
  `not_sold` tinyint(1) NOT NULL DEFAULT 1,
  `allow_non_rating_bidder` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `step_price`, `buy_now_price`, `time_start`, `time_end`, `description`, `auto_renew`, `id_category`, `id_win_bidder`, `id_seller`, `not_sold`, `allow_non_rating_bidder`) VALUES
(0000000001, 'Điện thoại iPhone 12 Pro Max 128GB', '34000000', '1000000', '50000000', '2022-01-04 12:00:00', '2022-01-12 11:22:00', '<p><strong>iPhone 12 Pro Max 128 GB</strong> một si&ecirc;u phẩm smartphone đến từ Apple. M&aacute;y c&oacute; một hiệu năng ho&agrave;n to&agrave;n mạnh mẽ đ&aacute;p ứng tốt nhiều nhu cầu đến từ người d&ugrave;ng v&agrave; mang trong m&igrave;nh một thiết kế đầy vu&ocirc;ng vức, sang trọng.</p>\r\n<p><br /><strong>Thay đổi thiết kế mới sau 6 năm</strong><br />Theo chu kỳ cứ mỗi 3 năm th&igrave; iPhone lại thay đổi thiết kế v&agrave; 2020 l&agrave; năm đ&aacute;nh dấu cột mốc quan trong n&agrave;y, v&igrave; thế rất c&oacute; thể đ&acirc;y l&agrave; thời điểm c&aacute;c mẫu iPhone 12 sẽ c&oacute; một sự thay đổi mạnh mẽ về thiết kế.</p>\r\n<p>iPhone 12 Pro Max sở hữu diện mạo mới mới với khung viền được v&aacute;t thẳng v&agrave; mạnh mẽ như tr&ecirc;n iPad Pro 2020, chấm dứt hơn 6 năm với kiểu thiết kế bo cong tr&ecirc;n iPhone 6 được ra mắt lần đầu ti&ecirc;n v&agrave;o năm 2014<br />Chất lượng hiển thị tuyệt vời<br />iPhone 12 Pro Max được trang bị m&agrave;n h&igrave;nh OLED k&iacute;ch thước 6.7 inch với c&ocirc;ng nghệ Super Retina XDR mang đến chất lượng h&igrave;nh ảnh sắc n&eacute;t, m&agrave;u sắc được t&aacute;i tạo chuẩn x&aacute;c, độ tương phản cao, m&agrave;u đen s&acirc;u tiết kiệm pin hơn.</p>', 0, 0000000002, 0000000053, 0000000052, 1, 1),
(0000000002, 'Điện thoại OPPO Reno6 Z 5G', '15000000', '500000', '15000000', '2022-01-04 12:00:00', '2022-01-04 13:10:18', '<p>Reno6 Z 5G đến từ nh&agrave; OPPO với h&agrave;ng loạt sự n&acirc;ng cấp v&agrave; cải tiến kh&ocirc;ng chỉ ngoại h&igrave;nh b&ecirc;n ngo&agrave;i m&agrave; c&ograve;n sức mạnh b&ecirc;n trong. Đặc biệt, chiếc điện thoại được h&atilde;ng đ&aacute;nh gi&aacute; &ldquo;chuy&ecirc;n gia ch&acirc;n dung bắt trọn mọi cảm x&uacute;c ch&acirc;n thật nhất&rdquo;, đ&acirc;y chắc chắn sẽ l&agrave; một &ldquo;si&ecirc;u phẩm\" m&agrave; bạn kh&ocirc;ng thể bỏ qua.<br /><strong>Bộ 3 camera chuy&ecirc;n nghiệp - Mỗi cảm x&uacute;c, một ch&acirc;n dung</strong><br />Hệ thống camera sau được trang bị tối t&acirc;n, trong đ&oacute; c&oacute; camera ch&iacute;nh 64 MP, camera g&oacute;c si&ecirc;u rộng 8 MP v&agrave; camera macro 2 MP c&ugrave;ng camera trước 32 MP lu&ocirc;n sẵn s&agrave;ng bắt trọn mọi cảm x&uacute;c trong khung h&igrave;nh, gi&uacute;p người d&ugrave;ng thoải m&aacute;i ghi lại những khoảnh khắc trong cuộc sống một c&aacute;ch ấn tượng nhất.<br /><strong>Thiết kế thời thượng, vẻ ngo&agrave;i đầy ấn tượng</strong><br />Reno6 Z 5G với thiết kế nguy&ecirc;n khối si&ecirc;u mỏng nhẹ 173 gam c&ugrave;ng c&aacute;c g&oacute;c cạnh bo cong mềm mại, uyển chuyển mang đến sự mượt m&agrave; v&agrave; tinh tế, cho bạn dễ d&agrave;ng cầm nắm trong qu&aacute; tr&igrave;nh sử dụng.</p>', 0, 0000000002, 0000000043, 0000000052, 0, 1),
(0000000003, 'Điện thoại Samsung Galaxy S21 Ultra 5G 128GB', '25000000', '1000000', '35000000', '2022-01-04 12:00:00', '2022-01-13 14:00:00', '<p>Sự đẳng cấp được Samsung gửi gắm th&ocirc;ng qua chiếc smartphone Galaxy S21 Ultra 5G với h&agrave;ng loạt sự n&acirc;ng cấp v&agrave; cải tiến kh&ocirc;ng chỉ ngoại h&igrave;nh b&ecirc;n ngo&agrave;i m&agrave; c&ograve;n sức mạnh b&ecirc;n trong, hứa hẹn đ&aacute;p ứng trọn vẹn nhu cầu ng&agrave;y c&agrave;ng cao của người d&ugrave;ng.<br /><strong>Đột ph&aacute; trong thiết kế thời thượng</strong><br />Kh&ocirc;ng chỉ đơn thuần phục vụ giao tiếp v&agrave; giải tr&iacute;, Samsung Galaxy S21 Ultra 5G c&ograve;n ch&iacute;nh l&agrave; m&oacute;n phụ kiện thời trang khẳng định vị thế của người sở hữu. Vẻ ngo&agrave;i mảnh mai v&agrave; thon gọn đến bất ngờ chỉ 165.1 x 75.6 x 8.9 mm v&agrave; trọng lượng 228 g d&ugrave; phải &ldquo;v&aacute;c&rdquo; một vi&ecirc;n pin lớn.<br /><strong>Thỏa m&atilde;n thị gi&aacute;c hơn bao giờ hết</strong><br />Samsung Galaxy S21 Ultra 5G sở hữu m&agrave;n h&igrave;nh k&iacute;ch thước lớn l&ecirc;n đến 6.8 inch. M&agrave;n h&igrave;nh v&ocirc; cực &ldquo;&iacute;t cong&rdquo; hơn v&agrave; viền bezel mỏng xung quanh, c&ugrave;ng camera selfie đục lỗ Infinity-O kh&aacute; nhỏ gi&uacute;p m&aacute;y đạt tỉ lệ m&agrave;n h&igrave;nh tới 20:9 đ&aacute;ng mơ ước</p>', 0, 0000000002, 0000000043, 0000000052, 1, 0),
(0000000004, 'Laptop Apple MacBook Pro M1 2020 16GB/1TB SSD (Z11C000CJ)', '46000000', '2000000', '70000000', '2022-01-04 11:28:00', '2022-01-15 11:28:00', '<p>Laptop Apple Macbook Pro M1 2020 (Z11C000CJ) với chip M1 d&agrave;nh ri&ecirc;ng cho MacBook đưa hiệu năng của MacBook Pro 2020 l&ecirc;n một tầm cao mới. M&agrave;n h&igrave;nh Retina si&ecirc;u n&eacute;t, thời lượng pin ấn tượng v&agrave; h&agrave;ng loạt c&aacute;c t&iacute;nh năng hiện đại gi&uacute;p bạn c&oacute; được trải nghiệm l&agrave;m việc chuy&ecirc;n nghiệp nhất.<br /><strong>Vi xử l&iacute; M1 mạnh mẽ đột ph&aacute;&nbsp;</strong><br />Sức mạnh vượt trội của MacBook Pro đến từ con chip Apple M1, bộ vi xử l&yacute; đầu ti&ecirc;n được ch&iacute;nh Apple chế tạo cho d&ograve;ng Mac của m&igrave;nh, được t&iacute;ch hợp tr&iacute; tuệ nh&acirc;n tạo th&ocirc;ng minh, khả năng vận h&agrave;nh mạnh mẽ, thỏa sức s&aacute;ng tạo mọi nội dung, đ&aacute;p ứng tốt mọi nhu cầu của người d&ugrave;ng.</p>\r\n<p>M1 c&ograve;n được t&iacute;ch hợp card đồ họa 8 nh&acirc;n GPU c&oacute; khả năng xử l&yacute; c&aacute;c t&aacute;c vụ đồ họa như mở c&ugrave;ng l&uacute;c nhiều video với độ ph&acirc;n giải cao, dựng h&igrave;nh 2D, 3D chuy&ecirc;n nghiệp. Bạn c&oacute; thể render video độ ph&acirc;n giải cao tr&ecirc;n Adobe Premiere hay Final Cut trong thời gian nhanh ch&oacute;ng. Apple tự tin khẳng định rằng M1 l&agrave; con chip đồ hoạ mạnh nhất hiện nay.</p>\r\n<p>Bộ nhớ RAM 16 GB cho tốc độ đa nhiệm nhanh ch&oacute;ng, chuyển đổi mượt m&agrave; giữa nhiều ứng dụng c&ugrave;ng l&uacute;c m&agrave; kh&ocirc;ng xảy ra hiện tượng giật, lag.</p>', 0, 0000000003, 0000000043, 0000000052, 1, 0),
(0000000005, 'Laptop Acer Nitro 5 Gaming AN515 57 727J i7 11800H/8GB/512GB/4GB RTX3050Ti/144Hz/Win10 (NH.QD9SV.005', '35000000', '1000000', '50000000', '2022-01-04 11:35:00', '2022-01-12 11:30:00', '<p>Acer Nitro 5 Gaming AN515 57 727J i7 (NH.QD9SV.005.) sở hữu vẻ ngo&agrave;i c&aacute; t&iacute;nh, nổi bật v&agrave; được t&iacute;ch hợp bộ vi xử l&yacute; Intel thế hệ 11 t&acirc;n tiến, card đồ hoạ rời NVIDIA GeForce RTX, hứa hẹn mang đến c&aacute;c trải nghiệm tuyệt vời cho người d&ugrave;ng.<br /><strong>Sức mạnh nổi bật nhờ c&ocirc;ng nghệ ti&ecirc;n tiến</strong><br />Acer Nitro Gaming được trang bị bộ vi xử l&yacute; Intel Core i7 Tiger Lake với cấu tr&uacute;c 8 nh&acirc;n 16 luồng c&oacute; tốc độ đạt tối đa đến 4.6 GHz nhờ Turbo Boost cho m&aacute;y hiệu năng mạnh mẽ chạy tốt c&aacute;c tựa game cấu h&igrave;nh cao, xử l&yacute; c&aacute;c t&aacute;c vụ đồ họa chuy&ecirc;n nghiệp một c&aacute;ch trơn tru.</p>\r\n<p>RAM 8 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe rời) c&ugrave;ng khả năng n&acirc;ng cấp tối đa l&ecirc;n đến 32 GB xử l&yacute; đa nhiệm c&ugrave;ng l&uacute;c nhiều t&aacute;c vụ, việc di chuyển qua lại giữa c&aacute;c phần mềm, chạy đồng thời c&aacute;c ứng dụng đồ họa m&agrave; kh&ocirc;ng lo hiện tượng giật, lag.<br />Card đồ họa rời NVIDIA GeForce RTX 3050Ti 4 GB được x&acirc;y dựng tr&ecirc;n kiến tr&uacute;c NVIDIA Turing đột ph&aacute;, cho trải nghiệm chơi game mượt m&agrave;, hiệu ứng đồ họa đẹp mắt. Bạn c&oacute; thể thỏa sức giải tr&iacute; với những tựa game ở mức c&agrave;i đặt cao như GTA V, The Witcher 3, LOL, CS:GO, PUBG,... hay render video 2D, 3D tr&ecirc;n Photoshop, AI,... một c&aacute;ch trơn tru.</p>', 0, 0000000003, 0000000051, 0000000052, 1, 1),
(0000000006, 'Laptop Asus ROG Zephyrus G14 Alan Walker GA401QEC R9 5900HS/16GB 1TB/4GB RTX3050Ti/120Hz/ Win10 (K20', '55000000', '1000000', '80000000', '2022-01-04 11:40:00', '2022-01-20 11:33:00', '<p>C&ugrave;ng bạn đối đầu mọi th&aacute;ch thức tr&ecirc;n chiến trường ảo nhờ bộ vi xử l&yacute; mạnh mẽ AMD v&agrave; phong c&aacute;ch thiết kế độc đ&aacute;o, khẳng định chất t&ocirc;i ri&ecirc;ng của si&ecirc;u phẩm độc nhất v&ocirc; nhị<strong> Asus ROG Zephyrus Gaming G14 Alan Walker (K2064T)</strong>, hứa hẹn sẽ mang đến những trải nghiệm tuyệt hảo kh&oacute; qu&ecirc;n cho người d&ugrave;ng. Nếu l&agrave; một fan của Alan Walker th&igrave; đ&acirc;y ch&iacute;nh l&agrave; sản phẩm bạn kh&ocirc;ng thể bỏ lỡ.<br /><strong>Ngoại h&igrave;nh đơn giản, ấn tượng nhưng kh&ocirc;ng k&eacute;m phần c&aacute; t&iacute;nh</strong><br />Đập v&agrave;o mắt người d&ugrave;ng l&agrave; 2 mảnh vải đen th&ecirc;u chữ trắng nổi bật được ốp tr&ecirc;n nắp lưng m&aacute;y được l&agrave;m thủ c&ocirc;ng ho&agrave;n to&agrave;n bằng tay, ph&iacute;a g&oacute;c dưới l&agrave; chữ k&yacute; của ch&iacute;nh DJ Alan Walker được khắc bằng laser tinh xảo, đảm bảo mọi &aacute;nh nh&igrave;n xung quanh sẽ đổ dồn về chủ nh&acirc;n sở hữu si&ecirc;u phẩm n&agrave;y.&nbsp;</p>\r\n<p>Một điểm đặc biệt tr&ecirc;n chiếc Asus ROG n&agrave;y l&agrave; c&ocirc;ng nghệ Anime Matrix, bạn ho&agrave;n to&agrave;n c&oacute; thể tự thiết kế dải đ&egrave;n với 1.215 đ&egrave;n LED mini tr&ecirc;n lưng m&aacute;y theo những h&igrave;nh ảnh y&ecirc;u th&iacute;ch bằng ch&iacute;nh phần mềm c&oacute; sẵn ở laptop.</p>', 0, 0000000003, 0000000051, 0000000052, 1, 0),
(0000000007, 'Laptop Asus VivoBook A515EA OLED i5 1135G7/8GB/512GB/Win11 (L12032W)', '30000000', '500000', '30000000', '2022-01-04 11:40:00', '2022-01-04 13:05:59', '<p>Laptop Asus VivoBook A515EA OLED i5 (L12032W) hiệu năng vượt trội đến từ bộ vi xử l&yacute; Intel Gen 11 được bao bọc bởi lớp vỏ ngo&agrave;i sang trọng, hiện đại, phục vụ tốt cho việc học tập, l&agrave;m việc văn ph&ograve;ng hay xem phim, nghe nhạc giải tr&iacute; h&agrave;ng ng&agrave;y.</p>\r\n<p><br /><strong>Thiết kế mang phong c&aacute;ch thời thượng, bền bỉ</strong><br />Laptop Asus VivoBook ho&agrave;n thiện từ chất liệu nhựa cứng c&aacute;p, nắp kim loại th&aacute;ch thức mọi giới hạn, tạo ra chuẩn mực mới trong c&aacute;i nh&igrave;n hiện đại, ph&ugrave; hợp với đa dạng đối tượng sử dụng. Laptop c&oacute; độ d&agrave;y khoảng 17.9 mm v&agrave; trọng lượng 1.8 kg, bạn vẫn c&oacute; thể thuận tiện bỏ gọn v&agrave;o balo, sẵn s&agrave;ng đồng h&agrave;nh c&ugrave;ng bạn mọi l&uacute;c, mọi nơi để học tập, l&agrave;m việc dễ d&agrave;ng, kh&ocirc;ng lo vướng v&iacute;u, mệt nhọc.<br />Mở kh&oacute;a m&aacute;y nhanh ch&oacute;ng chỉ với một chạm, đồng thời bảo vệ dữ liệu c&aacute; nh&acirc;n hơn nhờ t&iacute;nh năng cảm biến v&acirc;n tay t&iacute;ch hợp ngay tr&ecirc;n n&uacute;t nguồn, thay v&igrave; tốn nhiều thời gian ghi nhớ mật khẩu v&agrave; đăng nhập kiểu truyền thống mỗi ng&agrave;y.<br />D&atilde;y cổng kết nối trang bị đầy đủ tr&ecirc;n m&aacute;y bao gồm: USB 3.2, 2 x USB 2.0, USB Type-C, HDMI, Jack tai nghe 3.5 mm, khe thẻ nhớ Micro SD li&ecirc;n kết dễ d&agrave;ng, truyền tải th&ocirc;ng tin chuẩn x&aacute;c, nhanh ch&oacute;ng đến c&aacute;c thiết bị ngoại vi tương th&iacute;ch m&agrave; kh&ocirc;ng cần đến adapter chuyển đổi.</p>', 0, 0000000003, 0000000051, 0000000052, 0, 1),
(0000000008, 'Laptop Dell Gaming G3 15 i7 10750H/16GB/512GB/6GB GTX1660Ti/120Hz/Win10 (P89F002BWH', '50000000', '1000000', '50000000', '2022-01-04 13:00:00', '2022-01-09 17:41:38', '<p><strong>Laptop Dell G3 15 i7 (P89F002BWH)</strong> thuộc d&ograve;ng laptop gaming với cấu h&igrave;nh mạnh mẽ, thiết kế trang nh&atilde; v&agrave; rất sang trọng, dễ lựa chọn cho cả người đi đọc, đi l&agrave;m, l&agrave; 1 phi&ecirc;n bản tốt để lựa chọn cho cả nhu cầu l&agrave;m việc, học tập v&agrave; chơi game giải tr&iacute;.<br />Sang trọng, tinh tế, phong c&aacute;ch trẻ trung, hiện đại<br />Được đưa v&agrave;o ph&acirc;n kh&uacute;c laptop gaming, Dell G3 v&igrave; thế trang bị vẻ ngo&agrave;i cũng mang hơi hướng mạnh mẽ, c&aacute; t&iacute;nh, nhưng đủ tinh tế v&agrave; rất sang trọng để người d&ugrave;ng c&oacute; thể thoải m&aacute;i mang theo sử dụng ở mọi nơi.</p>\r\n<p>Lớp vỏ nhựa m&agrave;u trắng hiện đại, c&aacute;c đường v&aacute;t g&oacute;c cạnh rất tinh tế, ngoại h&igrave;nh chắc chắn, trọng lượng 2.58 kg, độ d&agrave;y 30.96 mm kh&ocirc;ng qu&aacute; nhẹ nhưng cũng kh&ocirc;ng qu&aacute; kh&oacute; khăn để mang k&egrave;m n&oacute; tới văn ph&ograve;ng, lớp học,&hellip;</p>\r\n<p>Laptop Dell trang bị b&agrave;n ph&iacute;m với h&agrave;nh tr&igrave;nh ph&iacute;m tốt, cụm ph&iacute;m WASD nổi bật, v&ugrave;ng ph&iacute;m số độc lập gi&uacute;p thao t&aacute;c soạn thảo v&agrave; t&iacute;nh to&aacute;n cực nhanh nhạy, th&ecirc;m sự hỗ trợ của đ&egrave;n nền để thao t&aacute;c ph&iacute;m chuẩn x&aacute;c cả trong điều kiện thiếu s&aacute;ng.</p>', 0, 0000000003, 0000000051, 0000000052, 0, 1),
(0000000009, 'Laptop Dell Inspiron 7400 i5 1135G7/16GB/512GB/2GB MX350/Win10 (N4I5134W)', '26000000', '1000000', '40000000', '2022-01-04 12:00:00', '2022-01-12 11:40:00', '<p>Mang đến kiểu d&aacute;ng sang trọng v&agrave; đẳng cấp, laptop <strong>Dell Inspiron 7400 i5 1135G7 (N4I5134W)</strong> với sức mạnh hiệu năng mạnh mẽ từ chip Intel Gen 11, l&agrave; cộng sự l&yacute; tưởng ở cả c&ocirc;ng việc v&agrave; giải tr&iacute;.<br />Tận hưởng khung h&igrave;nh ch&acirc;n thật c&ugrave;ng &acirc;m thanh sống động<br />M&agrave;n h&igrave;nh 14.5 inch c&ugrave;ng độ ph&acirc;n giải QHD+ (2560 x 1600) cho h&igrave;nh ảnh hiển thị ch&acirc;n thật, r&otilde; n&eacute;t ở cả trong nh&agrave; hay ngo&agrave;i trời nhờ độ s&aacute;ng m&agrave;n h&igrave;nh 300 nits.</p>\r\n<p>Hiển thị một c&aacute;ch ch&iacute;nh x&aacute;c v&agrave; sắc n&eacute;t c&aacute;c chi tiết của h&igrave;nh ảnh nhờ m&agrave;n h&igrave;nh 100% sRGB, đồng thời gi&uacute;p hạn chế tối đa sự kh&aacute;c biệt giữa h&igrave;nh ảnh hiển thị với thực tế.<br />Khung h&igrave;nh được trải rộng l&ecirc;n đến 178 độ nhờ tấm nền IPS mang đến cho bạn h&igrave;nh ảnh sống động d&ugrave; kh&ocirc;ng ngồi trực diện m&agrave; kh&ocirc;ng lo mỏi mắt hay l&oacute;a mắt do ảnh hưởng xấu từ &aacute;nh s&aacute;ng xanh độc hại nhờ c&ocirc;ng nghệ chống ch&oacute;i Anti Glare.</p>', 0, 0000000003, 0000000043, 0000000053, 1, 1),
(0000000010, 'Điện thoại Samsung Galaxy Z Fold3 5G 512GB', '52000000', '2000000', '90000000', '2022-01-04 12:00:00', '2022-01-27 11:41:00', '<p><strong>Galaxy Z Fold3 5G</strong> đ&aacute;nh dấu bước tiến mới của Samsung trong ph&acirc;n kh&uacute;c điện thoại gập cao cấp khi được cải tiến về độ bền c&ugrave;ng những n&acirc;ng cấp đ&aacute;ng gi&aacute; về cấu h&igrave;nh hiệu năng, hứa hẹn sẽ mang đến trải nghiệm sử dụng đột ph&aacute; cho người d&ugrave;ng.</p>\r\n<p><br /><strong>Đột ph&aacute; thiết kế m&agrave;n h&igrave;nh gập</strong><br />Đầu ti&ecirc;n, khung viền Galaxy Z Fold3 được ho&agrave;n thiện bằng chất liệu Armor Aluminum cao cấp nhất từ trước đến giờ nhằm tăng cường được độ bền, m&agrave; vẫn đảm bảo được trọng lượng c&acirc;n đối đem tới cảm gi&aacute;c v&ocirc; c&ugrave;ng chắc chắn v&agrave; cao cấp.&nbsp;</p>\r\n<p><br /><strong>Cụm camera đỉnh cao c&ocirc;ng nghệ</strong><br />Kế đ&oacute;, cụm camera tr&ecirc;n Galaxy Z Fold3 bao gồm 3 ống k&iacute;nh: Camera g&oacute;c rộng, camera g&oacute;c si&ecirc;u rộng, camera tele t&iacute;ch hợp chống rung OIS v&agrave; đều sở hữu độ ph&acirc;n giải 12 MP đặt trong cụm m&ocirc;-đun h&igrave;nh chữ nhật được bo tr&ograve;n 2 đầu tr&ocirc;ng rất thon gọn v&agrave; đầy tinh tế.</p>', 0, 0000000002, 0000000043, 0000000053, 1, 0),
(0000000011, 'Điện thoại Xiaomi 11T 5G 128GB', '12000000', '500000', '20000000', '2022-01-04 12:00:00', '2022-01-13 11:43:00', '<p><strong>Xiaomi 11T</strong> đầy nổi bật với thiết kế v&ocirc; c&ugrave;ng trẻ trung, m&agrave;n h&igrave;nh AMOLED, bộ 3 camera sắc n&eacute;t v&agrave; vi&ecirc;n pin lớn đ&acirc;y sẽ l&agrave; mẫu smartphone của Xiaomi thỏa m&atilde;n mọi nhu cầu giải tr&iacute;, l&agrave;m việc v&agrave; l&agrave; niềm đam m&ecirc; s&aacute;ng tạo của bạn.&nbsp;</p>\r\n<p><br /><strong>Camera 108 MP si&ecirc;u sắc n&eacute;t, l&agrave;m chủ mọi khung h&igrave;nh</strong><br />Xiaomi trang bị cho 11T 3 camera sau gồm camera ch&iacute;nh độ ph&acirc;n giải 108 MP, camera g&oacute;c rộng 8 MP 120 độ v&agrave; camera telemacro 5 MP c&ugrave;ng hệ thống phần cứng tối t&acirc;n được trang bị b&ecirc;n trong cực kỳ ấn tượng. Chỉ cần giơ m&aacute;y l&ecirc;n chụp l&agrave; bạn đ&atilde; c&oacute; những bức ảnh sắc n&eacute;t đ&aacute;ng kinh ngạc, khả năng thu ph&oacute;ng cũng cực tốt, cho bạn chụp được r&otilde; từng chi tiết d&ugrave; đối tượng ở kh&aacute; xa.</p>\r\n<p><br /><strong>Chiến game cực &ldquo;mượt&rdquo; với MediaTek Dimensity 1200</strong><br />MediaTek Dimensity 1200 8 nh&acirc;n được sản xuất dựa tr&ecirc;n tiến tr&igrave;nh 6 nm đạt mức xung nhịp tối đa l&agrave; 3 GHz, một sức mạnh cực khủng cho chiếc điện thoại đủ để bạn chiến mọi tựa game tr&ecirc;n di động v&agrave; tiết kiệm năng lượng hơn so với thế hệ tiền nhiệm trước đ&oacute;.&nbsp;</p>', 0, 0000000002, 0000000052, 0000000053, 1, 1),
(0000000012, 'iPhone 13 Pro Max 256GB Chính hãng', '37000000', '1000000', '60000000', '2022-01-04 11:50:00', '2022-01-12 11:44:00', '<p><strong>Mua iPhone 13 Pro Max 256GB</strong> là lựa chọn t&ocirc;́t nh&acirc;́t ở thời đi&ecirc;̉m này bởi đ&acirc;y được xem là bản n&acirc;ng c&acirc;́p tuy&ecirc;̣t vời của phi&ecirc;n bản iPhone 12 Pro Max. Sự xu&acirc;́t hi&ecirc;̣n của chip A15 Bionic, màn hình ProMotion 120Hz, dung lượng pin lớn hơn....chắc chắn sẽ mang đ&ecirc;́n trải nghi&ecirc;̣m hoàn hảo nh&acirc;́t.<br />Thi&ecirc;́t k&ecirc;́ sang trọng đ&ecirc;́n từng chi ti&ecirc;́t<br />Thi&ecirc;́t k&ecirc;́ <strong>iPhone 13 Pro Max 256GB</strong> tr&ocirc;ng v&acirc;̃n gi&ocirc;́ng với <strong>iPhone 12 Pro Max</strong>. Đi&ecirc;̣n thoại v&acirc;̃n được hoàn thi&ecirc;̣n từ mặt lưng kính phủ mờ k&ecirc;́t hợp với khung vi&ecirc;̀n thép kh&ocirc;ng gỉ được làm phẳng mang đ&ecirc;́n sự nam tính và mạnh mẽ. Đ&ecirc;̉ thi&ecirc;́t bị trở n&ecirc;n hoàn hảo hơn, Apple cũng đã thực hi&ecirc;̣n m&ocirc;̣t vài tinh nhỏ.<br />Ph&acirc;̀n notch tai thỏ tr&ecirc;n <strong>iPhone 13 Pro Max</strong> giá rẻ giờ đ&acirc;y đã được thu hẹp nhỏ hơn th&ecirc;́ h&ecirc;̣ trước 20%. M&ocirc;-đun camera sau cũng có kích thước lớn và nh&ocirc; ra nhi&ecirc;̀u hơn. Những chi ti&ecirc;́t này k&ecirc;́t hợp với vi&ecirc;̣c trang bị dung lượng pin lớn đã khi&ecirc;́n trọng lượng đi&ecirc;̣n thoại nặng và dày hơn khá nhi&ecirc;̀u. Mua <strong>iPhone 13 Pro Max 256GB</strong> người dùng sẽ có các tùy chòn màu sắc g&ocirc;̀m: Xám, bạc, vàng và xanh nhạt.</p>\r\n<p><strong>Màn hình ProMotion 120Hz</strong><br />Apple ti&ecirc;́p tục trang bị cho màn hình<strong> iPhone 13 Pro Max 256GB</strong> kích thước 6.7 inch có đ&ocirc;̣ ph&acirc;n giải 1284 x 2778 Pixel. Đi&ecirc;̉m đáng chú ý nh&acirc;́t chính là đi&ecirc;̣n thoại đã được trang bị t&acirc;̀n s&ocirc;́ quét 120Hz. Đ&acirc;y là tính năng mà r&acirc;́t nhi&ecirc;̀u người h&acirc;m m&ocirc;̣ đã chờ đợi, và họ đã r&acirc;́t th&acirc;́t vọng khi nó lỡ hẹn tr&ecirc;n iPhone 12 Pro Max.</p>', 0, 0000000002, 0000000052, 0000000053, 1, 0),
(0000000013, 'Sách The Gene: An Intimate History cũ', '1100000', '100000', '2000000', '2022-01-05 11:52:00', '2022-01-16 11:52:00', '<p><em>The book&rsquo;s author, Siddhartha Mukherjee, decided to write it largely because of a huge advance that had received far less attention than it deserved: Biochemist Jennifer Doudna and microbiologist Emmanuelle Charpentier&rsquo;s discovery of &ldquo;genetic scissors&rdquo; that allow scientists to cut any DNA sequence with incredible precision. Doudna and Charpentier&rsquo;s discovery earned them the 2020 Nobel Prize in Chemistry.</em></p>', 0, 0000000012, 0000000046, 0000000043, 1, 1),
(0000000014, 'Sách A Thousand Brains: A New Theory of Intelligence cũ', '310000', '10000', '5000000', '2022-01-05 14:59:00', '2022-01-14 16:00:00', '<p><span style=\"color: #000000;\">If Hawkins is right that the only viable path to artificial general intelligence is by replicating the workings of the neocortex, that means it&rsquo;s unlikely that intelligent machines will supplant or subjugate the human race&mdash;the kind of thing you see in classic sci-fi movies like&nbsp;<em>The Matrix</em>&nbsp;and&nbsp;<em>The Terminator</em>. That&rsquo;s because the neocortex operates differently from parts of the brain that evolved much earlier and that drive our primal emotions and instincts.</span></p>\r\n<p><span style=\"color: #e03e2d;\"><strong>&ldquo;Intelligent machines need to have a model of the world and the flexibility of behavior that comes from that model, but they don&rsquo;t need to have human-like instincts for survival and procreation.&rdquo;</strong></span></p>', 0, 0000000012, 0000000046, 0000000043, 1, 1),
(0000000015, 'Sách Klara and the Sun, by Kazuo Ishiguro cũ', '510000', '10000', '5000000', '2022-01-05 15:08:00', '2022-01-13 16:00:00', '<p><strong><em><a href=\"https://www.gatesnotes.com/Books/Klara-and-the-Sun\" target=\"_blank\" rel=\"noopener\">Klara and the Sun</a></em></strong><em>,&nbsp;<a href=\"https://www.gatesnotes.com/Books/Klara-and-the-Sun\" target=\"_blank\" rel=\"noopener\">by Kazuo Ishiguro</a>.&nbsp;</em>I love a good robot story, and Ishiguro&rsquo;s novel about an &ldquo;artificial friend&rdquo; to a sick young girl is no exception. Although it takes place in a dystopian future, the robots aren&rsquo;t a force for evil. Instead, they serve as companions to keep people company. This book made me think about what life with super intelligent robots might look like&mdash;and whether we&rsquo;ll treat these kinds of machines as pieces of technology or as something more.</p>', 0, 0000000012, 0000000044, 0000000043, 1, 1),
(0000000016, 'Sách Hamnet, by Maggie O’Farrell cũ', '410000', '10000', '5000000', '2022-01-05 15:14:00', '2022-01-13 18:00:00', '<p><strong><em><a href=\"https://www.gatesnotes.com/Books/Hamnet\" target=\"_blank\" rel=\"noopener\">Hamnet</a></em></strong><em>,&nbsp;<a href=\"https://www.gatesnotes.com/Books/Hamnet\" target=\"_blank\" rel=\"noopener\">by Maggie O&rsquo;Farrell</a>.&nbsp;</em>If you&rsquo;re a Shakespeare fan, you&rsquo;ll love this moving novel about how his personal life might&rsquo;ve influenced the writing of one of his most famous plays. O&rsquo;Farrell has built her story on two facts we know to be true about &ldquo;The Bard&rdquo;: his son Hamnet died at the age of 11, and a couple years later, Shakespeare wrote a tragedy called&nbsp;<em>Hamlet</em>. I especially enjoyed reading about his wife, Anne, who is imagined here as an almost supernatural figure.</p>', 0, 0000000012, 0000000046, 0000000043, 1, 1),
(0000000017, 'Sách Project Hail Mary, by Andy Weir cũ', '410000', '10000', '5000000', '2022-01-05 15:21:00', '2022-01-15 16:00:00', '<p><strong><em><a href=\"https://www.gatesnotes.com/Books/Project-Hail-Mary\" target=\"_blank\" rel=\"noopener\">Project Hail Mary</a></em></strong><em>,&nbsp;<a href=\"https://www.gatesnotes.com/Books/Project-Hail-Mary\" target=\"_blank\" rel=\"noopener\">by Andy Weir</a>.&nbsp;</em>Like most people, I was first introduced to Weir&rsquo;s writing through&nbsp;<em>The Martian</em>. His latest novel is a wild tale about a high school science teacher who wakes up in a different star system with no memory of how he got there. The rest of the story is all about how he uses science and engineering to save the day. It&rsquo;s a fun read, and I finished the whole thing in one weekend.</p>', 0, 0000000012, 0000000044, 0000000043, 1, 1),
(0000000018, 'Sách The Overstory by Richard Powers cũ', '410000', '10000', '5000000', '2022-01-05 15:25:00', '2022-01-14 18:00:00', '<p>In&nbsp;<em>The Overstory</em>&nbsp;by Richard Powers, Mimi Ma arrives at her office one morning to find that the woods she can see from her desk have been cut down. Powers describes the moment the &ldquo;outrage floods into her, the sneakiness of man, a sense of injustice larger than her whole life, the old loss that will never, ever be answered.&rdquo; This reaction starts her on a path to become a radical activist willing to throw her entire life away to protect trees.</p>', 0, 0000000012, 0000000044, 0000000043, 1, 1),
(0000000019, 'Tai nghe True Wireless Audio-Techncia ATH-CK3TW cũ', '1010000', '10000', '20000000', '2022-01-05 15:45:00', '2022-01-13 17:00:00', '<h2>Tai nghe True Wireless Audio-Techncia ATH-CK3TW &nbsp;ch&iacute;nh h&atilde;ng</h2>\r\n<p><strong><a href=\"https://tainghe.com.vn/tai-nghe-true-wireless-audio-techncia-ath-ck3tw.html\" target=\"_blank\" rel=\"noopener\">Audio-Technica ATH-CK3TW</a></strong>&nbsp;l&agrave; một trong những chiếc tai nghe hiếm hoi được trang bị True Wireless Stereo Plus của Qualcomm. Với gi&aacute; b&aacute;n chỉ 2,5 triệu đồng,&nbsp;<strong>ATH-CK3TW</strong>&nbsp;hứa hẹn sẽ l&agrave;m mưa l&agrave;m gi&oacute; trong thị trường tai nghe kh&ocirc;ng d&acirc;y vốn đang rất chật chội hiện nay.</p>', 0, 0000000015, 0000000046, 0000000043, 1, 1),
(0000000020, 'Tai nghe True Wireless Sabbat E12 cũ', '900000', '100000', '6000000', '2022-01-05 15:47:00', '2022-01-15 18:00:00', '<h2><strong>Tai nghe True Wireless Sabbat E12</strong></h2>\r\n<p><strong>Sabbat</strong> l&agrave; một h&atilde;ng &acirc;m thanh mới lạ với phần lớn những người chơi &acirc;m thanh, h&atilde;ng nổi tiếng với những mẫu tai nghe true wireless thời thượng. Một trong số đ&oacute; l&agrave; mẫu <strong>tai nghe true wireless Sabbat E12</strong> được rất nhiều người d&ugrave;ng săn đ&oacute;n.</p>\r\n<h2><strong>Sabbat E12 đ&oacute;ng hộp</strong></h2>\r\n<p>Tuy l&agrave; một sản phẩm gi&aacute; rẻ, tuy nhi&ecirc;n <strong>Sabbat E12</strong> vẫn được h&atilde;ng chăm ch&uacute;t với phần đ&oacute;ng hộp đẹp mắt v&agrave; cứng c&aacute;p. B&ecirc;n ngo&agrave;i vỏ hộp, ch&uacute;ng ta sẽ chỉ c&oacute; một v&agrave;i đường dẫn c&aacute;ch t&acirc;n hiện đại c&ugrave;ng với t&ecirc;n sản phẩm v&agrave; một v&agrave;i th&ocirc;ng tin kh&aacute; cơ bản.</p>', 0, 0000000015, 0000000046, 0000000043, 1, 1),
(0000000021, 'Honda Super Cub C125', '70000000', '1000000', '89000000', '2022-01-06 20:30:00', '2022-01-21 23:00:00', '<p>Thiết kế cổ điển, thanh lịch đậm chất&nbsp;<em>Super CUB</em>. Tư thế l&aacute;i xe thoải m&aacute;i. ĐỘNG CƠ - C&Ocirc;NG NGHỆ. Động cơ n&acirc;ng cấp bền bỉ. TIỆN &Iacute;CH &amp; AN TO&Agrave;N.</p>', 0, 0000000018, NULL, 0000000047, 1, 0),
(0000000022, 'Air Blade 125/150', '33500000', '500000', '41490000', '2022-01-06 20:35:00', '2022-01-21 23:00:00', '<h5>Kiểu d&aacute;ng thể thao cao cấp</h5>\r\n<p class=\"text-justify\">Tiếp tục l&agrave; hiện th&acirc;n của sự đột ph&aacute;, hiện đại với diện mạo được trau chuốt tỉ mỉ đến từng chi tiết, Air Blade mang h&igrave;nh ảnh đặc trưng được thể hiện qua thiết kế tổng thể gợi li&ecirc;n tưởng đến &ldquo;chữ X&rdquo;, phản chiếu sự cứng c&aacute;p trong bề mặt hiện đại xen lẫn l&agrave; những đường n&eacute;t được xử l&yacute; gọn g&agrave;ng, dứt kho&aacute;t. Đặc biệt, Air Blade 150cc kh&aacute;c biệt hơn với tấm chắn gi&oacute; ph&iacute;a trước, y&ecirc;n xe hai t&ocirc;ng m&agrave;u v&agrave; tiết diện lốp xe lớn.</p>\r\n<h5>Tem xe c&ugrave;ng phối m&agrave;u mới mới ấn tượng</h5>\r\n<p class=\"text-justify\">Tem xe được thiết kế mới với những đường n&eacute;t mạnh mẽ, thể thao, c&ugrave;ng phối m&agrave;u mới ấn tượng nhưng kh&ocirc;ng k&eacute;m phần sang trọng, mang đến diện mạo mới thể thao v&agrave; cuốn h&uacute;t hơn.</p>\r\n<h5>Cụm đ&egrave;n LED trước</h5>\r\n<p class=\"text-justify\">Air Blade sử dụng đ&egrave;n định vị LED cỡ lớn với thiết kế đ&egrave;n trước được m&ocirc; phỏng cấu tr&uacute;c đ&egrave;n từ những mẫu xe ph&acirc;n khối lớn, tạo cảm gi&aacute;c thể thao năng động. Nhờ việc cải thiện đặc điểm ph&acirc;n v&ugrave;ng &aacute;nh s&aacute;ng của đ&egrave;n chiếu s&aacute;ng ph&iacute;a trước, tầm nh&igrave;n xe được cải thiện hơn v&agrave;o ban đ&ecirc;m v&agrave; trong điều kiện thời tiết xấu.</p>\r\n<h5>Mặt đồng hồ LCD</h5>\r\n<p class=\"text-justify\">Mặt đồng hồ LCD kỹ thuật số ho&agrave;n to&agrave;n mang lại một thiết kế hiện đại, gọn g&agrave;ng hơn v&agrave; tăng kh&ocirc;ng gian cho th&ocirc;ng tin hiển thị. Ngo&agrave;i hai th&ocirc;ng tin về h&agrave;nh tr&igrave;nh, đồng hồ c&ograve;n hiển thị th&ocirc;ng tin ti&ecirc;u thụ nhi&ecirc;n liệu tức thời/trung b&igrave;nh, gi&uacute;p người d&ugrave;ng theo d&otilde;i được sự kh&aacute;c biệt trong những t&igrave;nh huống l&aacute;i xe kh&aacute;c nhau.</p>', 0, 0000000018, 0000000043, 0000000047, 1, 1),
(0000000023, 'Audi R8 2021 Grey', '9000000000', '100000000', '9999999999', '2022-01-06 21:00:00', '2022-01-31 23:00:00', '<p><em>Audi R8</em>&nbsp;l&agrave; d&ograve;ng xe thể thao, hạng sang, 2 chỗ ngồi, động cơ đặt giữa được sản xuất bởi nh&agrave; sản xuất Audi AG, Đức. Audi R8 lần đầu ti&ecirc;n được giới thiệu tới c&ocirc;ng ch&uacute;ng v&agrave;o năm 2006. Thế hệ thứ 2 được ra mắt v&agrave;o năm 2015 - nay.</p>\r\n<h2>Ngoại thất Audi R8 2021</h2>\r\n<p>Chiếc Audi R8 thế hệ đầu ti&ecirc;n l&agrave; một trong những mẫu xe được \"đại gia Việt\" y&ecirc;u th&iacute;ch. Thế hệ thứ 2 của Audi R8 &iacute;t tiếng vang hơn do sự cạnh tranh gay gắt của c&aacute;c h&atilde;ng si&ecirc;u xe thể thao tr&ecirc;n thị trường như Lamborghini, Ferrari, McLaren...</p>\r\n<p>Audi R8 2021 được h&atilde;ng xe sang Audi tinh chỉnh nhiều ngoại thất. Hệ thống đ&egrave;n, cản trước được thiết kế thanh mảnh nhưng sắc n&eacute;t hơn. Lưới tản nhiệt Singleframe h&igrave;nh đa gi&aacute;c, c&oacute; k&iacute;ch thước lớn hơn. Hốc gi&oacute; được thiết kế mới với k&iacute;ch thước rộng hơn tr&ocirc;ng hầm hố, mạnh mẽ hơn so với phi&ecirc;n bản tiền nhiệm.</p>\r\n<p>Tất cả c&aacute;c phi&ecirc;n bản Audi R8 2021 đều được trang bị đ&egrave;n pha LED v&agrave; đ&egrave;n hậu LED ti&ecirc;u chuẩn, t&iacute;ch hợp đ&egrave;n b&aacute;o rẽ. Với phi&ecirc;n bản Audi R8 V10 Performance c&oacute; thể t&ugrave;y chọn lắp đ&egrave;n laser. Phần đu&ocirc;i xe, khe tho&aacute;t nhiệt được l&agrave;m lớn hơn, hệ thống xả k&eacute;p h&igrave;nh oval cũng c&oacute; k&iacute;ch thước to hơn.</p>\r\n<h2>Nội thất Audi R8 2021</h2>\r\n<p>B&ecirc;n trong cabin Audi R8 2021 sở hữu kh&ocirc;ng gian sang trọng, đẳng cấp. Audi R8 2021 được bổ sung th&ecirc;m cụm đồng hồ kỹ thuật số, đ&egrave;n nội thất, sạc kh&ocirc;ng d&acirc;y v&agrave; GPS. Hệ thống &acirc;m thanh Bang&amp;Olufsen với 13 loa được trang bị ti&ecirc;u chuẩn. Audi cung cấp th&ecirc;m 02 m&agrave;u nội thất: m&agrave;u n&acirc;u (Palomino Brown) v&agrave; bạc (Pastel Silver) cho kh&aacute;ch h&agrave;ng th&ecirc;m sự lựa chọn.</p>\r\n<p>Cabin Audi R8 2021 được bọc da Nappa, ghế chỉnh điện ti&ecirc;u chuẩn 14 hướng. T&ugrave;y chọn g&oacute;i nội thất Premium cho phi&ecirc;n bản R8 RWD với trần xe bọc da Alcantara, ghế chỉnh điện 18 hướng c&oacute; thanh đỡ b&ecirc;n v&agrave; đệm kh&iacute; cho ch&acirc;n, bậc cửa c&oacute; đ&egrave;n chiếu s&aacute;ng.</p>\r\n<h2>Vận h&agrave;nh, an to&agrave;n Audi R8 2021</h2>\r\n<p>Với phi&ecirc;n bản Audi R8 Coupe RWD v&agrave; Audi R8 Spyder RWD sử dụng động cơ ti&ecirc;u chuẩn V10, 5.2 l&iacute;t, kết hợp hộp số tự động ly hợp k&eacute;p 07 cấp S Tronic v&agrave; hệ dẫn động cầu sau, sản sinh ra c&ocirc;ng suất tối đa 532 m&atilde; lực v&agrave; m&ocirc; men xoắn cực đại 539 Nm. Thời gian tăng tốc từ 0-100km/h cho bản Coupe l&agrave; 3.6s v&agrave; cho bản Spyder l&agrave; 3.7s. Tốc độ tối đa đạt 323 km/h đối với bản Coupe v&agrave; 322 km/h đối với bản Spyder.</p>\r\n<p>Với phi&ecirc;n bản&nbsp;<a href=\"https://giaxeoto.vn/audi-r8-363.html\">Audi R8&nbsp;</a>Coupe Preformance (Quattro) v&agrave; Audi R8 Spyder Preformance (Quattro) cũng sử dụng động cơ ti&ecirc;u chuẩn V10, 5.2 l&iacute;t, kết hợp hộp số tự động ly hợp k&eacute;p 07 cấp S Tronic v&agrave; v&agrave; hệ dẫn động 04 b&aacute;nh to&agrave;n thời gian, sản sinh ra c&ocirc;ng suất tối đa 602 m&atilde; lực v&agrave; m&ocirc; men xoắn cực đại 559 Nm. Thời gian tăng tốc từ 0-100km/h cho bản Coupe l&agrave; 3.2s v&agrave; cho bản Spyder l&agrave; 3.3s. Tốc độ tối đa đạt 327 km/h đối với bản Coupe v&agrave; 326 km/h đối với bản Spyder.</p>', 0, 0000000019, NULL, 0000000048, 1, 1),
(0000000024, 'Băng đội trưởng của Ronaldo', '260000000', '10000000', '350000000', '2022-01-06 21:00:00', '2022-01-29 23:00:00', '<p><strong>Băng đội trường của cầu thủ b&oacute;ng đ&aacute; Cristiano Ronaldo trong trận Bồ Đ&agrave;o Nha 2-2 Serbia</strong></p>\r\n<p>Ronaldo bị trọng t&agrave;i &ldquo;cướp&rdquo; b&agrave;n thắng hợp lệ ở trận đấu với Serbia tại lượt đấu thứ 2 v&ograve;ng loại World Cup 2022 khu vực ch&acirc;u &Acirc;u khiến Bồ Đ&agrave;o Nha bị cầm h&ograve;a với tỉ số 2-2. Do đ&oacute;, CR7 đ&atilde; tức giận n&eacute;m tấm băng đội trưởng của m&igrave;nh xuống s&acirc;n v&agrave; bỏ v&agrave;o ph&ograve;ng thay đồ ngay sau tiếng c&ograve;i m&atilde;n cuộc vang l&ecirc;n.</p>\r\n<p>Nguy&ecirc;n nh&acirc;n tiền đạo người Bồ Đ&agrave;o Nha kh&ocirc;ng được c&ocirc;ng nhận b&agrave;n thắng ở trận gặp Serbia v&igrave; Ban tổ chức kh&ocirc;ng &aacute;p dụng c&ocirc;ng nghệ ở v&ograve;ng loại n&ecirc;n c&aacute;c trọng t&agrave;i kh&ocirc;ng được hỗ trợ. Sau đ&oacute;, trọng t&agrave;i ch&iacute;nh đ&atilde; gửi lời xin lỗi tới Ronaldo v&agrave; ĐT Bồ Đ&agrave;o Nha.</p>\r\n<p>&nbsp;</p>', 0, 0000000021, 0000000043, 0000000047, 1, 1),
(0000000025, 'Giày bóng đá Signature Neymar - Jogo Prismatico', '1500000', '200000', '3000000', '2022-01-06 21:10:00', '2022-01-29 23:00:00', '<p>Tiếp theo th&agrave;nh c&ocirc;ng của 13 NJR \'Speed Freak\', Jogo Prism&aacute;tico l&agrave; đ&ocirc;i gi&agrave;y mới nhất NIKE thửa ri&ecirc;ng cho Neymar. Đ&acirc;y l&agrave; một đ&ocirc;i gi&agrave;y mang nhiều &yacute; nghĩa. Jogo Prism&aacute;tico vừa mới lạ m&agrave; cũng vừa quen thuộc. Quen thuộc bởi thiết kế của phi&ecirc;n bản n&agrave;y c&oacute; sự kế thừa từ những đ&ocirc;i gi&agrave;y tiền nhiệm. Sự kết hợp độc đ&aacute;o n&agrave;y đ&atilde; cho ra mắt một đ&ocirc;i gi&agrave;y th&uacute; vị hơn bao giờ hết.</p>\r\n<p>Đ&ocirc;i gi&agrave;y m&agrave; Nike ưu &aacute;i d&agrave;nh ri&ecirc;ng cho Neymar thuộc d&ograve;ng Mercurial Vapor 13, l&agrave; mẫu gi&agrave;y lu&ocirc;n được Neymar sử dụng. Đ&ocirc;i gi&agrave;y nổi bật với những hoa văn sặc sở đầy m&agrave;u sắc: xanh, đỏ, v&agrave;ng - cảm hứng bắt nguồn từ những h&igrave;nh xăm tr&ecirc;n cổ ch&acirc;n v&agrave; những thiết kế logo c&aacute; nh&acirc;n trước đ&acirc;y của anh ch&agrave;ng.</p>\r\n<p>Cảm hứng c&ograve;n bắt nguồn từ những h&igrave;nh xăm của Neymar. Neymar xăm 2 d&ograve;ng chữ ở 2 cổ ch&acirc;n với &yacute; nghĩa: &ldquo;T&aacute;o bạo&rdquo; v&agrave; &ldquo;Vui vẻ&rsquo;. C&oacute; thể n&oacute;i, đ&acirc;y ch&iacute;nh l&agrave; h&igrave;nh xăm mi&ecirc;u tả r&otilde; nhất về con người của anh. Sắc m&agrave;u của Jogo Prism&aacute;tico cũng tr&agrave;n ngập &aacute;nh s&aacute;ng v&agrave; sự tươi vui.</p>', 0, 0000000022, NULL, 0000000048, 1, 1),
(0000000026, 'Air Jordan 1 của Michael Jordan 1985', '5000000000', '200000000', '8000000000', '2022-01-06 22:00:00', '2022-01-30 23:00:00', '<p><strong>Đ&ocirc;i gi&agrave;y&nbsp;<a title=\"Nike\" href=\"https://ragus.vn/tag/nike/\" target=\"_self\" data-ail=\"66566\">Nike</a>&nbsp;<a title=\"AIR JORDAN 1\" href=\"https://ragus.vn/tag/air-jordan-1/\" target=\"_self\" data-ail=\"66566\">Air Jordan 1</a> từ năm 1985 với chữ k&yacute; của Michael Jordan&nbsp;</strong></p>\r\n<p>&ldquo;Bản gốc Vintage từ năm 1985 c&oacute; trong m&agrave;u trắng, đen v&agrave; đỏ của Chicago Bulls &ndash; colorway&nbsp;<a title=\"AIR JORDAN 1\" href=\"https://ragus.vn/tag/air-jordan-1/\" target=\"_self\" data-ail=\"66566\">Air Jordan 1</a>&nbsp;m&agrave; Michael Jordan mang thường xuy&ecirc;n nhất tr&ecirc;n s&acirc;n,&rdquo; đọc một bản tin từ Sothotti. &ldquo;Được sản xuất từ ​​th&aacute;ng 2 đến th&aacute;ng 4 năm 1985, Jordan đ&atilde; đeo đ&ocirc;i&nbsp;<a title=\"AIR JORDAN 1\" href=\"https://ragus.vn/tag/air-jordan-1/\" target=\"_self\" data-ail=\"66566\">Air Jordan 1</a>&nbsp;n&agrave;y trong thời điểm đầu trong sự nghiệp, quan trọng đ&ocirc;i gi&agrave;y đ&atilde; gi&uacute;p anh ấy chiến thắng những trận đấu quan trọng nhất trong sự nghiệp&rdquo;</p>\r\n<p>Đ&ocirc;i gi&agrave;y thể hiện được tầm ảnh hưởng của Jordan v&agrave; rất hiếm c&oacute; một vận động vi&ecirc;n chuy&ecirc;n nghiệp n&agrave;o v&agrave;o thời điểm đ&oacute; c&oacute; thể s&aacute;nh được.&nbsp;<a title=\"Nike\" href=\"https://ragus.vn/tag/nike/\" target=\"_self\" data-ail=\"66566\">Nike</a>&nbsp;thậm ch&iacute; c&ograve;n kh&ocirc;ng ph&aacute;t h&agrave;nh&nbsp;<a title=\"Gi&agrave;y thể thao\" href=\"https://ragus.vn/tag/giay-the-thao/\" target=\"_self\" data-ail=\"66566\">gi&agrave;y thể thao</a>&nbsp;h&agrave;ng đầu n&agrave;y ra c&ocirc;ng ch&uacute;ng sau đ&oacute; &ndash; chỉ cao v&agrave; thấp, theo Sotheber&rsquo;s.</p>', 0, 0000000022, NULL, 0000000048, 1, 1),
(0000000027, 'Túi cầu lông Yonex LSQ13 MS3 BTS6 - S Đen chữ ký vàng', '1450000', '50000', '2000000', '2022-01-08 23:00:00', '2022-01-10 08:00:00', '<p>T&uacute;i cầu l&ocirc;ng Yonex LSQ13 MS3 BTS6 - S Đen chữ k&yacute; v&agrave;ng l&agrave; mẫu t&uacute;i chất lượng, bền bỉ, phong c&aacute;ch thiết kế thời thượng, hiện đại được sản xuất v&agrave;o năm 2020 để kỉ niệm vận động vi&ecirc;n đơn nam số 1 thế giới Lee Chong Wei giải nghệ.</p>\r\n<p>&nbsp;</p>', 0, 0000000021, 0000000051, 0000000043, 1, 1),
(0000000028, 'Adidas Predator Pro 20', '1500000', '100000', '3200000', '2022-01-08 23:00:00', '2022-01-10 08:00:00', '<p>Găng tay thủ m&ocirc;n Adidas Predator 20 Pro &ndash; Black / Active Red, m&atilde; sản phẩm FH7288, găng tay thủ m&ocirc;n chuy&ecirc;n nghiệp, ph&acirc;n kh&uacute;c cao cấp nhất, được sử dụng bởi c&aacute;c thủ m&ocirc;n h&agrave;ng đầu thế giới l&agrave; David De Gea, Manuel Neuer hay Kepa&hellip;kiểu mặt cắt negative cut &ocirc;m chặt tay</p>\r\n<p>Loại găng tay đ&atilde; gi&uacute;p Thủ m&ocirc;n Donnarumma của đội tuyển &Yacute; l&ecirc;n ng&ocirc;i đ&aacute;nh bại đội tuyển Anh l&ecirc;n ng&ocirc;i v&ocirc; địch Euro 2020&nbsp;</p>', 0, 0000000021, NULL, 0000000043, 1, 1),
(0000000029, 'Bóng Nike Premier League 2021-2022', '3000000', '200000', '3600000', '2022-01-08 23:00:00', '2022-01-10 12:00:00', '<p>B&oacute;ng Nike Flight Premier League OMB- White/ Laser Orange/ Black CQ7147-100, b&oacute;ng Nike Ngoại Hạng Anh m&ugrave;a giải 2020-2021, b&oacute;ng Nike EPL 2020-2021, b&oacute;ng Nike ch&iacute;nh h&atilde;ng, tr&aacute;i b&oacute;ng Nike Flight sẽ sử dụng ch&iacute;nh thức tại Ngoại Hạng Anh m&ugrave;a giải 2020-2021, b&oacute;ng đạt ti&ecirc;u chuẩn cao nhất l&agrave; FIFA Quality Pro&hellip;.</p>', 0, 0000000021, 0000000052, 0000000043, 1, 1),
(0000000030, 'Mũ xe đạp CAIRBULL 4D PRO Ultimate', '30000000', '1000000', '35000000', '2022-01-08 23:00:00', '2022-01-10 12:00:00', '<p>CAIRBULL l&agrave; một thương hiệu mũ bảo hiểm thể thao mang lại sự an to&agrave;n h&agrave;ng đầu với chất lượng cao với giá hợp lý. CAIRBULL sáng tạo ra những thi&ecirc;́t k&ecirc;́ mũ bảo hi&ecirc;̉m dành cho xe đạp đ&ocirc;̣c đáo, thời trang,thoải m&aacute;i với cho tất cả c&aacute;c tay đua. Thiết kế bắt nguồn từ cuộc thi mang lại sự ph&ugrave; hợp tuyệt vời v&agrave; hiệu suất chi ph&iacute; hấp dẫn. C&aacute;c t&iacute;nh năng tương tự 4D 4D như hệ thống khai th&aacute;c SUPER FIX v&agrave; hệ thống th&ocirc;ng gi&oacute; cấu tr&uacute;c 4D cho ph&eacute;p m&ocirc; h&igrave;nh n&agrave;y đối ph&oacute; với chuyến đi kh&oacute; khăn nhất của bạn tr&ecirc;n đường. Thương hiệu: CAIRBULL C&aacute;c t&iacute;nh năng: thiết kế một mảnh / chu vi đầu điều chỉnh / si&ecirc;u nhẹ Chất liệu: Shell PC / l&oacute;t bằng EPS mật độ cao M&agrave;u sắc: 7 m&agrave;u c&oacute; sẵn, như được hiển thị. 7 m&agrave;u s&aacute;ng b&oacute;ng Trọng lượng: 195g Lỗ kh&iacute;: 29 lỗ k&iacute;ch thước: M&atilde; M 54-58CM, chiều rộng b&ecirc;n trong 17-17,5CM; M&atilde; L 57-63CM, chiều rộng b&ecirc;n trong 17,7-18CM Hệ thống l&agrave;m m&aacute;t k&iacute;ch thước thứ 4, cửa h&uacute;t gi&oacute; si&ecirc;u lớn ph&iacute;a trước, cải thiện luồng kh&ocirc;ng kh&iacute; v&agrave; giữ cho đầu bạn m&aacute;t mẻ. Lưới 4L DryLite mỏng, mềm v&agrave; nhẹ kh&ocirc;ng bị biến dạng do nước hoặc mồ h&ocirc;i Hệ thống Super Fit dễ sử dụng cung cấp 3 loại điều chỉnh độ cao, với chức năng điều chỉnh độ đ&agrave;n hồi tốt. Hệ thống đai nhẹ độc đ&aacute;o gi&uacute;p cải thiện độ an to&agrave;n khi đeo. Thiết kế đệm hiệu suất cao cải thiện hiệu suất thoải m&aacute;i v&agrave; mồ h&ocirc;i</p>', 0, 0000000021, 0000000053, 0000000043, 1, 1),
(0000000031, 'ADIDAS PREDATOR FREAK .1 LOW FG WHITESPARK - FOOTWEAR WHITE/IRON METAL/SOLAR RED', '4200000', '200000', '8000000', '2022-01-09 19:00:00', '2022-01-12 18:00:00', '<p><strong>adidas Predator Freak .1 Low FG WhiteSpark - Footwear White/Iron Metal/Solar Red</strong> l&agrave; phi&ecirc;n bản cao cấp s&acirc;n cỏ tự nhi&ecirc;n 7-11 người. Nằm trong bộ sưu tập với m&agrave;u trắng chủ đạo, điểm xuyến c&aacute;c chi tiết m&agrave;u đỏ, x&aacute;m nổi bật đầy thu h&uacute;t tr&ecirc;n gi&agrave;y. Adidas Predator l&agrave; d&ograve;ng gi&agrave;y kiểm so&aacute;t b&oacute;ng tốt nhất trong đội h&igrave;nh 3 &lsquo;chiến binh&rsquo; của thương hiệu adidas. Thiết kế của Predator lu&ocirc;n độc đ&aacute;o v&agrave; ấn tượng, vẫn l&agrave; m&agrave;u đỏ chủ đạo với những điểm nhấn m&agrave;u đen xuất hiện tr&ecirc;n phần logo 3 sọc v&agrave; g&oacute;t gi&agrave;y.<br />Cầu thủ nổi tiếng đại diện: Paul Pogba, David Alaba, Steven Gerrard, Gareth Bale...</p>\r\n<p><strong>Bộ sưu tập</strong>: White Spark.</p>\r\n<p><strong>Năm sản xuất</strong>: 2021.</p>\r\n<p><strong>Chất liệu</strong>: Da tổng hợp Demonskin 2.</p>\r\n<p><strong>C&ocirc;ng nghệ</strong>: Đế Control Frame b&aacute;m s&acirc;n, cổ thun Primeknit co gi&atilde;n, l&oacute;t đệm &ecirc;m &aacute;i.</p>\r\n<p><strong>Trọng lượng</strong>: 209 gram/chiếc (Size 40).</p>\r\n<p><strong>Phong c&aacute;ch</strong>: Kiểm so&aacute;t, dứt điểm.</p>\r\n<p><strong>Vị tr&iacute;</strong>: Trung vệ, tiền vệ trung t&acirc;m.</p>\r\n<p><strong>Form gi&agrave;y</strong>: Ph&ugrave; hợp form ch&acirc;n thon/ch&acirc;n b&egrave;.</p>\r\n<p><strong>Mặt s&acirc;n</strong>: S&acirc;n cỏ tự nhi&ecirc;n 11 người.</p>', 0, 0000000022, NULL, 0000000052, 1, 1),
(0000000032, ' ADIDAS X SPEEDFLOW .1 FG/AG METEORITE - SOLAR RED/WHITE/BLACK', '4200000', '100000', '8000000', '2022-01-09 18:05:00', '2022-01-10 18:02:00', '<p><strong>Adidas X Speedflow .1 FG/AG Meteorite - Solar Red/White/Black</strong> l&agrave; phi&ecirc;n bản gi&agrave;y cao cấp d&agrave;nh cho s&acirc;n cỏ tự nhi&ecirc;n 7-11 người. Một chương mới của silo tốc độ vừa được adidas ra mắt tr&ecirc;n thị trường. Hứa hẹn sẽ l&agrave; một sản phẩm rất được săn đ&oacute;n trong thời gian tới. Nằm trong BST Meteorite Pack sẽ được ra mắt v&agrave;o cuối th&aacute;ng 7, X Speedflow c&oacute; gam m&agrave;u đỏ nổi bật, ho&agrave;nh tr&aacute;ng c&ugrave;ng với m&agrave;u đen v&agrave; trắng đi k&egrave;m m&agrave;u dạ quang. Đem lại sự ho&agrave;i h&ograve;a cũng như đ&aacute;nh bật những chi tiết được n&acirc;ng cấp ở phi&ecirc;n bản mới n&agrave;y.<br />Cầu thủ nổi tiếng đại diện: Mohamed Salah, Son Hueng Min, Messi...</p>\r\n<p><strong>Bộ sưu tập</strong>: Meteorite.</p>\r\n<p><strong>Năm sản xuất</strong>: 2021.</p>\r\n<p><strong>Chất liệu</strong>: Da tổng hợp cao cấp mỏng nhẹ.</p>\r\n<p><strong>C&ocirc;ng nghệ</strong>: Đế Speedframe tốc độ b&aacute;m s&acirc;n, tấm carbon si&ecirc;u nhẹ, cổ thun Primknit &ocirc;m ch&acirc;n, l&oacute;t foam &ecirc;m &aacute;i v&agrave; g&oacute;t ch&acirc;n đệm 3D.</p>\r\n<p><strong>Phong c&aacute;ch</strong>: Tấn c&ocirc;ng, tốc độ.</p>\r\n<p><strong>Vị tr&iacute;</strong>: Tiền vệ c&aacute;nh, tiền đạo.</p>\r\n<p><strong>Form gi&agrave;y</strong>: Ph&ugrave; hợp form ch&acirc;n thon/ch&acirc;n b&egrave;.</p>\r\n<p><strong>Mặt s&acirc;n</strong>: S&acirc;n cỏ tự nhi&ecirc;n 11 người.</p>', 0, 0000000022, NULL, 0000000052, 1, 1),
(0000000033, 'NIKE MERCURIAL SUPERFLY 8 ACADEMY MG MOTIVATION - VOLT/BLACK/BRIGHT CRIMSON', '2700000', '100000', '5000000', '2022-01-09 19:00:00', '2022-01-11 11:05:00', '<p>Bộ sưu tập \'<strong>Motivation Pack</strong>\' ra mắt v&agrave;o thời điểm đầu m&ugrave;a giải mới v&agrave; được c&aacute;c nh&agrave; thiết kế của Nike sử dụng gam m&agrave;u tượng trưng cho chiến thắng như đỏ, v&agrave;ng kết hợp với tone m&agrave;u cơ bản trắng, đen để l&agrave;m phối m&agrave;u chủ đạo cho phi&ecirc;n bản gi&agrave;y lần n&agrave;y. Với vẻ ngo&agrave;i vừa tươi s&aacute;ng vừa gi&agrave;u năng lượng, \'Motivation Pack\' đem đến nguồn động lực mới mẻ v&agrave; niềm hứng khởi cho c&aacute;c cầu thủ khi ra s&acirc;n.&nbsp;<br />Cầu thủ nổi tiếng đại diện: Cristiano Ronaldo, Edin Hazard, Mbappe.....</p>\r\n<p><strong>Bộ sưu tập</strong>: Motivation.</p>\r\n<p><strong>Năm sản xuất</strong>: 2021.</p>\r\n<p><strong>Chất liệu</strong>: Da tổng hợp mới mềm mại.</p>\r\n<p><strong>C&ocirc;ng nghệ</strong>: Cổ thun Dynamic Fit, cấu tr&uacute;c đế Aerotrak b&aacute;m s&acirc;n.</p>\r\n<p><strong>Trọng lượng:</strong> 198 gram/chiếc (Size 41).</p>\r\n<p><strong>Phong c&aacute;ch</strong>: Tấn c&ocirc;ng, tốc độ.</p>\r\n<p><strong>Vị tr&iacute;</strong>: Tiền vệ c&aacute;nh, tiền đạo.</p>\r\n<p><strong>Form gi&agrave;y</strong>: Ph&ugrave; hợp form ch&acirc;n thon/ch&acirc;n b&egrave;.</p>\r\n<p><strong>Mặt s&acirc;n</strong>: Cỏ tự nhi&ecirc;n 11 người.</p>', 0, 0000000022, 0000000043, 0000000053, 1, 1),
(0000000034, 'NIKE TIEMPO LEGEND 7 SR4 FG CORAZON Y SANGRE - WHITE/METALLIC GOLD LIMITED EDITION', '9000000', '500000', '20000000', '2022-01-09 19:00:00', '2022-01-11 18:45:00', '<p>Đối với những ai y&ecirc;u th&iacute;ch sở hữu những đ&ocirc;i gi&agrave;y đ&aacute; b&oacute;ng phi&ecirc;n bản giới hạn, hiếm hoi c&oacute; mặt tr&ecirc;n thị trường th&igrave; <strong>Nike Tiempo Sergio Ramos Lengend 7 \'Coraz&oacute;n y Sangre\'</strong> từ năm 2017 l&agrave; một đ&ocirc;i gi&agrave;y huyền thoại đ&aacute;ng sở hữu. H&atilde;y c&ugrave;ng Neymarsport kh&aacute;m ph&aacute; phi&ecirc;n bản giới hạn đặc sắc n&agrave;y ngay sau đ&acirc;y nh&eacute;<br />Những cầu thủ nổi tiếng đại diện: Piqu&eacute;, Van Dijk v&agrave; Thiago Silva.....</p>\r\n<p><strong>Bộ Sưu Tập</strong>: Corazon Y Sangre.</p>\r\n<p><strong>Năm sản</strong> xuất: 2017.</p>\r\n<p><strong>Chất liệu</strong>: Da tự nhi&ecirc;n Kangaroo v&agrave; cấu tr&uacute;c v&acirc;n kim cương 3D.</p>\r\n<p><strong>C&ocirc;ng nghệ</strong>: Cổ thun Flyknit, ACC (đ&aacute; mọi thời tiết) v&agrave; đế Hyperstability.</p>\r\n<p><strong>Trọng lượng</strong>: 205 gram/chiếc (Size 41).</p>\r\n<p><strong>Phong c&aacute;ch</strong>: Kiểm so&aacute;t, kỹ thuật.</p>\r\n<p><strong>Vị tr&iacute;</strong>: Hậu vệ, tiền vệ trung t&acirc;m.</p>\r\n<p><strong>Form gi&agrave;y</strong>: Tương đối thoải m&aacute;i, ph&ugrave; hợp ch&acirc;n b&egrave;.</p>\r\n<p><strong>Mặt s&acirc;n</strong>: S&acirc;n cỏ tự nhi&ecirc;n 11 người.</p>', 0, 0000000022, NULL, 0000000053, 1, 1);
INSERT INTO `products` (`id`, `name`, `price`, `step_price`, `buy_now_price`, `time_start`, `time_end`, `description`, `auto_renew`, `id_category`, `id_win_bidder`, `id_seller`, `not_sold`, `allow_non_rating_bidder`) VALUES
(0000000035, 'Lamborghini Aventador', '9999999999', '1000000000', '9999999999', '2022-01-09 19:30:00', '2022-01-11 19:20:00', '<p>Cũng giống như nhiều anh em kh&aacute;c,<strong> Lamborghini Aventador SVJ 2022</strong> c&oacute; mức gi&aacute; lăn b&aacute;nh kh&ocirc;ng hề rẻ. Đủ để nhiều người m&ecirc; mẩn nhưng chỉ d&aacute;m nh&igrave;n từ xa v&igrave; kh&ocirc;ng đủ điều kiện. Tuy nhi&ecirc;n, đ&acirc;y cũng ch&iacute;nh l&agrave; lựa chọn tuyệt vời cho giới đại gia thứ thiệt.<br />Thiết kế v&ocirc; lăng &amp; t&aacute;p l&ocirc;</p>\r\n<p>Lamborghini chưa bao giờ khiến kh&aacute;ch h&agrave;ng của m&igrave;nh phải thất vọng về khoang cabin. Mở cửa bước v&agrave;o Lamborghini Aventador SVJ 2022 bạn sẽ c&oacute; cảm gi&aacute;c như đang bước v&agrave;o một thế giới kh&aacute;c, nơi đ&oacute; tất cả mọi thứ đều thuộc về đẳng cấp đỉnh cao v&agrave; xa xỉ. V&ocirc; lăng của chiếc si&ecirc;u xe n&agrave;y được thiết kế 3 chấu v&aacute;t ngang phần đ&aacute;y rất độc đ&aacute;o.&nbsp;</p>\r\n<p>Phần t&aacute;p l&ocirc; được đầu tư kỹ lưỡng những n&uacute;t bấm hiện đại v&agrave; bắt mắt. Đặt biệt t&aacute;p l&ocirc; được nối liền với tựa để tay, khi đang g&aacute;c tay người l&aacute;i vẫn c&oacute; thể dễ d&agrave;ng thực hiện c&aacute;c thao t&aacute;c vặn n&uacute;m xoay linh hoạt. Kh&oacute; m&agrave; kh&ocirc;ng d&agrave;nh lời khen cho sự chăm ch&uacute;t n&agrave;y.</p>\r\n<p><strong>Thiết kế ghế ngồi</strong></p>\r\n<p>Tr&ecirc;n ghế ngồi của Lamborghini Aventador SVJ 2022 c&oacute; logo SVJ m&agrave;u trắng đỏ nổi bật. Đ&acirc;y l&agrave; điểm nhấn gi&uacute;p ph&acirc;n biệt phi&ecirc;n bản d&ograve;ng xe SVJ với những người anh em kh&aacute;c c&ugrave;ng nh&agrave; Lamborghini. Ghế ngồi được bọc da alcantara cao cấp, th&agrave;nh ghế &ocirc;m chặt th&acirc;n người ngồi cho một trải nghiệm cực kỳ tuyệt hảo tr&ecirc;n c&aacute;c cung đường đua. Chiều d&agrave;i cơ sở của xe l&ecirc;n đến 2700mm n&ecirc;n chủ nh&acirc;n c&oacute; thể ngả hẳn ghế ra sau. Ngo&agrave;i ra kiểu thiết kế đầy t&iacute;nh thể thao cũng l&agrave; điểm nhấn cho khoang ghế ngồi của Lamborghini Aventador SVJ 2022.</p>\r\n<p><strong>Khoang h&agrave;nh l&yacute;</strong></p>\r\n<p>Khoang h&agrave;nh l&yacute; của Lamborghini Aventador SVJ 2022 c&oacute; l&agrave; một trong những điểm trừ hiếm hoi của con xe n&agrave;y n&oacute;i ri&ecirc;ng v&agrave; tất cả những d&ograve;ng si&ecirc;u xe thể thao của Lamborghini n&oacute;i chung. Dễ hiểu th&ocirc;i, đ&acirc;y kh&ocirc;ng phải l&agrave; chiếc xe d&agrave;nh cho gia đ&igrave;nh.&nbsp;</p>\r\n<p>Khoang h&agrave;nh l&yacute; của Lamborghini Aventador SVJ 2022 chỉ đủ chứa 1 đến 2 chiếc vali size nhỏ. Nhưng tr&ecirc;n thực tế kh&aacute;ch h&agrave;ng cũng kh&ocirc;ng c&oacute; nhiều cơ hội để đặt vali v&agrave;o đ&acirc;y bởi cốp xe l&agrave; vị tr&iacute; thuận lợi nhất để đặt phần mui xe c&oacute; thể th&aacute;o rời.</p>\r\n<p>Để sở hữu được một chiếc xe gắn logo &ldquo;si&ecirc;u b&ograve;&rdquo; kh&aacute;ch h&agrave;ng kh&ocirc;ng chỉ l&agrave; người c&oacute; tiền m&agrave; phải c&oacute; rất nhiều tiền. Kh&aacute;ch h&agrave;ng c&oacute; nhu cầu mua b&aacute;n xe &ocirc; t&ocirc; Lamborghini Aventador SVJ c&oacute; thể tham khảo gi&aacute; b&aacute;n tại mua b&aacute;n xe Lamborghini Aventador SVJ.</p>', 0, 0000000019, NULL, 0000000053, 1, 0),
(0000000036, 'BMW 420i Cabriolet 2021 mui trần', '2800000000', '100000000', '4000000000', '2022-01-09 19:30:00', '2022-01-11 19:22:00', '<p>L&agrave; d&ograve;ng xe mui xếp cứng được rất nhiều người y&ecirc;u th&iacute;ch tr&ecirc;n thế giới, <strong>BMW 420i Cabriolet 2021</strong> thế hệ mới (thường gọi l&agrave; <strong>BMW 420i mui trần</strong>) chứng tỏ bản th&acirc;n vẫn giữ vững phong độ v&igrave; ng&agrave;y c&agrave;ng biết c&aacute;ch l&agrave;m thỏa l&ograve;ng kh&aacute;ch h&agrave;ng.<br /><strong>Thiết kế ngoại thất BMW 420i mui trần</strong><br />BMW 420i mui trần thế hệ mới sở hữu vẻ ngo&agrave;i đầy m&ecirc; hoặc v&agrave; lối cuốn với những đường n&eacute;t đầy tinh tế. Nh&igrave;n từ trực diện, 420i Cabriolet 2021 l&agrave;m đa số kh&aacute;ch h&agrave;ng phải xao xuyến ngay từ c&aacute;i nh&igrave;n đầu ti&ecirc;n.<br />Ở phần h&ocirc;ng xe, <strong>BMW 420i mui trần Cabriolet 2021</strong> tr&ocirc;ng thể thao hơn hẳn nhờ được trang bị bộ la zăng c&oacute; k&iacute;ch thước lớn 18 inch.</p>\r\n<p>Dọc th&acirc;n xe l&agrave; những đường g&acirc;n dập nổi tạo c&aacute;i nh&igrave;n kh&aacute; &ldquo;hung dữ&rdquo; gi&uacute;p chủ nh&acirc;n thể hiện được c&aacute;i t&ocirc;i ri&ecirc;ng của m&igrave;nh. Gương chiếu hậu của xe c&oacute; khả năng tự điều chỉnh chống ch&oacute;i v&agrave; được sơn c&ugrave;ng m&agrave;u th&acirc;n xe tạo sự liền mạch đẹp mắt.</p>', 0, 0000000019, NULL, 0000000053, 1, 0),
(0000000037, 'Mercedes Maybach S650', '9999999999', '500000000', '9999999999', '2022-01-09 19:30:00', '2022-01-10 19:30:00', '<p><strong>Mercedes Maybach S650 2022 </strong>l&agrave; một trong những d&ograve;ng xe sang c&oacute; mức gi&aacute; b&aacute;n hấp dẫn nhất tr&ecirc;n thị trường hiện nay. Đ&acirc;y cũng l&agrave; d&ograve;ng xe c&oacute; nhiều thiết kế đẳng cấp hướng đến đối tượng kh&aacute;ch h&agrave;ng thương gia.&nbsp;</p>\r\n<p>Kh&ocirc;ng chỉ l&agrave; sản phẩm nổi bật nhất của thương hiệu xe h&agrave;ng đầu Mercedes, Mercedes S650 2022 c&ograve;n khiến cho kh&aacute;ch h&agrave;ng phải trầm trồ về những đường n&eacute;t thiết kế tỉ mỉ, cẩn trọng v&agrave; đẳng cấp. Đ&acirc;y cũng ch&iacute;nh l&agrave; một trong những d&ograve;ng xe mang lại cho người d&ugrave;ng cảm gi&aacute;c l&aacute;i ho&agrave;n hảo nhất cho tới thời điểm hiện tại.&nbsp;<br /><strong>Thiết kế v&ocirc; lăng &amp; t&aacute;p l&ocirc;&nbsp;</strong></p>\r\n<p>Những chi tiết b&ecirc;n trong kh&ocirc;ng gian nội thất, đặc biệt l&agrave; ở khu vực bảng t&aacute;p l&ocirc; đều được d&ograve;ng xe Mercedes S650 2022 trau chuốt v&ocirc; c&ugrave;ng tỉ mỉ, ngo&agrave;i ra, d&ograve;ng xe n&agrave;y c&ograve;n sử dụng những chất liệu cao cấp bậc nhất như ốp nh&ocirc;m, gỗ b&oacute;ng, da cao cấp,&hellip; Những điều n&agrave;y khiến cho tổng thể b&ecirc;n trong của d&ograve;ng xe trở n&ecirc;n sang trọng v&agrave; đẳng cấp hơn rất nhiều.&nbsp;</p>\r\n<p>Mercedes S650 2022 thiết kế phần bảng t&aacute;p l&ocirc; kh&aacute; d&agrave;i v&agrave; bề thế, chi tiết n&agrave;y cũng được nhiều kh&aacute;ch h&agrave;ng đ&aacute;nh gi&aacute; cao khi bố tr&iacute; vừa với tầm nh&igrave;n của người l&aacute;i xe. Ngo&agrave;i ra, d&ograve;ng xe n&agrave;y c&ograve;n lựa chọn cho m&igrave;nh mẫu v&ocirc; lăng 3 chấu được bọc da, ốp gỗ, t&iacute;ch hợp khả năng ghi nhớ 3 vị tr&iacute;, &nbsp;c&aacute;c lẫy chuyển số v&agrave; n&uacute;t bấm điều khiển tiện lợi gi&uacute;p cho bạn c&oacute; thể điều khiển c&aacute;c th&ocirc;ng số tr&ecirc;n xe một c&aacute;ch thuận tiện nhất ngay cả khi đang l&aacute;i xe.&nbsp;</p>\r\n<p><strong>Thiết kế ghế ngồi&nbsp;</strong></p>\r\n<p>Kh&ocirc;ng chỉ l&agrave; hệ thống ghế ngồi c&oacute; chất liệu hiện đại m&agrave; d&ograve;ng xe n&agrave;y c&ograve;n c&oacute; đệm đặc biệt mang lại sự &ecirc;m &aacute;i v&agrave; thư gi&atilde;n nhất cho kh&aacute;ch h&agrave;ng khi ngồi tr&ecirc;n xe. Mercedes S650 2022 c&ograve;n lựa chọn rất nhiều &nbsp;những vật liệu giảm tiếng ồn ấn tượng mang lại cho kh&ocirc;ng gian b&ecirc;n trong sự ri&ecirc;ng tư, thoải m&aacute;i nhất.</p>\r\n<p>Ngo&agrave;i ra, ở từng h&agrave;ng ghế c&ograve;n được bổ sung th&ecirc;m chức năng chỉnh điện, ghi nhớ vị tr&iacute; v&agrave; tựa đầu cỡ lớn. Nếu kh&aacute;ch h&agrave;ng sử dụng h&agrave;ng ghế sau hạng thương gia th&igrave; Mercedes S650 2022 kh&ocirc;ng chỉ c&oacute; chức năng chỉnh điện, tựa đầu m&agrave; c&ograve;n c&oacute; th&ecirc;m bệ để ch&acirc;n, chức năng massage v&agrave; đỡ bắp ch&acirc;n. C&oacute; thể thấy thiết &nbsp;kế của Mercedes S650 2022 ho&agrave;n to&agrave;n c&oacute; thể chinh phục được cả những kh&aacute;ch h&agrave;ng kh&oacute; t&iacute;nh nhất bởi d&ograve;ng xe n&agrave;y thật sự l&agrave; mẫu xe đẳng cấp v&agrave; tiện nghi</p>\r\n<p><strong>Khoang h&agrave;nh l&yacute;&nbsp;</strong></p>\r\n<p><strong>Mercedes S650 2022</strong> c&oacute; mức chiều d&agrave;i kh&aacute; lớn, đi k&egrave;m với đ&oacute; l&agrave; kiểu thiết &nbsp;kế xe d&agrave;i v&agrave; thoải, điều n&agrave;y mang lại cho d&ograve;ng xe một khoang h&agrave;nh l&yacute; ti&ecirc;u chuẩn đảm bảo cho người d&ugrave;ng c&oacute; thể chứa đựng &nbsp;được những đồ d&ugrave;ng cần thiết trong những chuyến đi của m&igrave;nh.</p>\r\n<p>Cụ thể mức dung t&iacute;ch h&agrave;nh l&yacute; ti&ecirc;u chuẩn của d&ograve;ng xe n&agrave;y đạt mức 564 l&iacute;t, ngo&agrave;i ra, kh&aacute;ch h&agrave;ng cũng c&oacute; thể mở rộng bằng c&aacute;ch gặp chỉnh c&aacute;c h&agrave;ng ghế v&ocirc; c&ugrave;ng linh hoạt v&agrave; tiện lợi..</p>\r\n<p>Tin b&aacute;n xe l&agrave; website chuy&ecirc;n cho kh&aacute;ch h&agrave;ng mua b&aacute;n xe &ocirc; t&ocirc; đăng tin miễn ph&iacute; uy t&iacute;n h&agrave;ng đầu Việt Nam.</p>', 0, 0000000019, NULL, 0000000052, 1, 0),
(0000000038, 'Mercedes-Benz C 300 AMG', '1800000000', '100000000', '4000000000', '2022-01-09 19:30:00', '2022-01-12 19:26:00', '<p><strong>Mercedes-Benz</strong> ch&iacute;nh thức tr&igrave;nh l&agrave;ng c&aacute;c bản n&acirc;ng cấp của C-Class năm 2019 v&agrave;o th&aacute;ng 2 vừa qua. Trong đ&oacute;, phi&ecirc;n bản <em><strong>Mercedes-Benz C 300 AMG</strong></em> được nhận x&eacute;t l&agrave; đ&atilde; trở th&agrave;nh một mẫu xe thể thao thực thụ với nhiều cải tiến mới.<br /><strong>Mercedes-Benz C 300 AMG</strong><br />Trong năm 2018, doanh số b&aacute;n h&agrave;ng tr&ecirc;n to&agrave;n cầu của Mercedes-Benz đ&atilde; tăng th&ecirc;m 0,9%, l&ecirc;n mức kỷ lục 2.310.185 xe. Đ&acirc;y cũng l&agrave; năm thứ 8 li&ecirc;n tiếp doanh số của h&atilde;ng xe n&agrave;y dẫn đầu ph&acirc;n kh&uacute;c. Để c&oacute; mức doanh số kỷ lục n&agrave;y, c&aacute;c phi&ecirc;n bản C-Class thế hệ W205 đ&oacute;ng vai tr&ograve; v&ocirc; c&ugrave;ng quan trọng.</p>\r\n<p>V&agrave;o năm 2019, Mercedes-Benz tiếp tục tr&igrave;nh l&agrave;ng bản n&acirc;ng cấp của d&ograve;ng sedan n&agrave;y. Trong đ&oacute;, Mercedes-Benz C 300 AMG l&agrave; phi&ecirc;n bản được rất nhiều người quan t&acirc;m. B&ecirc;n cạnh những sự n&acirc;ng cấp về thiết kế, tiện nghi, phần động cơ cải tiến được đ&aacute;nh gi&aacute; l&agrave; đ&atilde; g&oacute;p phần gi&uacute;p Mercedes-Benz C 300 AMG trở th&agrave;nh một mẫu xe đua thật thụ.<br /><strong>Ngoại thất</strong><br />So với 2 phi&ecirc;n bản Mercedes-Benz C 200 v&agrave; Mercedes-Benz C 200 Exclusive, Mercedes-Benz C 300 AMG c&oacute; vẻ ngo&agrave;i mạnh mẽ hơn đến từ g&oacute;i ngoại thất thể thao AMG với thiết kế mới. Kết hợp với đ&oacute; l&agrave; m&acirc;m xe thể thao AMG 18-inch đa chấu hiện đại. Đồng thời, c&aacute;c đường dập nổi tr&ecirc;n th&acirc;n xe c&agrave;ng gi&uacute;p cho tổng thể Mercedes-Benz C 300 AMG th&ecirc;m phần cuốn h&uacute;t.<br /><strong>Nội thất</strong><br />Mercedes-Benz C 300 AMG với chất liệu da cao cấp c&ugrave;ng 2 t&ugrave;y chọn m&agrave;u nội thất: Đen (251) hoặc N&acirc;u Saddle (264) sẽ mang đến cảm gi&aacute;c sang trọng, đẳng cấp ngay khi bước v&agrave;o khoang xe. Đặc biệt, hệ thống đ&egrave;n viền nội thất được n&acirc;ng l&ecirc;n th&agrave;nh 64 m&agrave;u gi&uacute;p cho người d&ugrave;ng dễ d&agrave;ng c&oacute; được kh&ocirc;ng gian nội thất thoải m&aacute;i nhất.</p>', 0, 0000000019, NULL, 0000000052, 1, 1),
(0000000039, 'SH 150i', '78000000', '1000000', '130000000', '2022-01-09 19:45:00', '2022-01-11 19:39:00', '<p><strong>Đặc điểm</strong><br />Kế thừa tinh hoa của d&ograve;ng xe SH với những đường n&eacute;t thanh lịch, sang trọng mang hơi thở Ch&acirc;u &Acirc;u c&ugrave;ng động cơ cải tiến đột ph&aacute; v&agrave; c&ocirc;ng nghệ ti&ecirc;n tiến, SH125i/150i mới bổ sung m&agrave;u mới ấn tượng v&agrave; nổi bật..<br />Cụ thể, phi&ecirc;n bản Đặc biệt SH150i với m&agrave;u đen nh&aacute;m hiện tại được bổ sung; Bản Thể thao mới cho SH150i đi k&egrave;m phanh ABS với m&agrave;u x&aacute;m b&oacute;ng ho&agrave;n to&agrave;n mới giống SH350i.</p>\r\n<p>Ngo&agrave;i ra, hai bản Thể thao v&agrave; Đặc biệt của SH 150i sẽ nổi bật hơn với c&aacute;c chi tiết m&agrave;u chạy từ th&acirc;n xe xuống h&ocirc;ng s&agrave;n xe, kết th&uacute;c bằng chữ SH bản đậm. Tr&ecirc;n c&aacute;c phi&ecirc;n bản c&ograve;n lại của SH125i v&agrave; SH150i, m&agrave;u đỏ được chuyển sang t&ocirc;ng s&acirc;u hơn.<br />C&ugrave;ng với m&agrave;u sắc, HVN cũng n&acirc;ng cấp t&iacute;nh năng kết nối bluetooth tr&ecirc;n SH150i đi k&egrave;m với ứng dụng My Honda+ (tương th&iacute;ch với c&aacute;c thiết bị Apple iOS v&agrave; Google Android) để th&ocirc;ng b&aacute;o cuộc gọi, tin nhắn SMS/SNS tr&ecirc;n m&agrave;n h&igrave;nh đồng hồ xe. Đồng thời, kh&aacute;ch h&agrave;ng c&oacute; thể đọc to&agrave;n bộ c&aacute;c th&ocirc;ng tin xe: T&igrave;nh trạng vận h&agrave;nh, mức độ ti&ecirc;u thụ nhi&ecirc;n liệu, lịch sử đỗ xe, th&ocirc;ng tin sửa chữa, bảo dưỡng, bảo h&agrave;nh...</p>', 0, 0000000018, NULL, 0000000052, 1, 1),
(0000000040, 'Yamaha Exciter 155 VVA', '45000000', '500000', '60000000', '2022-01-09 19:45:00', '2022-01-11 11:00:00', '<p><strong>Yamaha Exciter 155</strong> | Gi&aacute; xe Exciter 155 | Xe c&ocirc;n tay Yamaha Exciter 155 VVA mới nhất 2022 | Gi&aacute; xe Yamaha Exciter 155 VVA mới nhất h&ocirc;m nay 2022</p>\r\n<p>Thời gian vừa qua c&aacute;i t&ecirc;n &ldquo;<strong>Exciter 155 VVA 2022</strong>&rdquo; đ&atilde; được rất nhiều người ti&ecirc;u d&ugrave;ng nhắc đến cũng như t&igrave;m kiếm quan t&acirc;m Exciter 155 khi n&agrave;o ra mắt sau khi h&atilde;ng xe đối thủ đ&atilde; ch&iacute;nh thức c&ocirc;ng bố mẫu xe Winner X sắp được ra mắt trong thời gian sắp tới. Đến Tối 29/12, Yamaha Việt Nam tr&igrave;nh l&agrave;ng Yamaha Exciter 155 VVA được coi l&agrave; phi&ecirc;n bản thay thế ho&agrave;n to&agrave;n cho Exciter 2022 hiện nay với sự lột x&aacute;c so với bản cũ, cả ở thiết kế lẫn động cơ đi k&egrave;m, n&acirc;ng cấp động cơ l&ecirc;n 155 ph&acirc;n khối k&egrave;m c&ocirc;ng nghệ van biến thi&ecirc;n VVA, bộ ly hợp chống trượt, hộp số 6 cấp, kh&ocirc;ng c&oacute; ABS.<br />Kh&ocirc;ng qu&aacute; kh&oacute; để đo&aacute;n ra, Yamaha Exciter 155 mới 2022 được ra mắt bởi theo như d&ograve;ng đời chu kỳ sản phẩm th&igrave; đ&atilde; tới l&uacute;c Yamaha ra mắt Exciter 155 VVA phi&ecirc;n bản mới 2022 sau lần thay đổi nhẹ trong năm ngo&aacute;i khi bổ sung đ&egrave;n pha LED v&agrave; đồng hồ kỹ thuật số cũng như mẫu m&atilde; m&agrave;u sắc tem xe mới. Ngo&agrave;i ra việc ra mắt Exciter 155 VVA 2022 l&agrave; lời đ&aacute;p trả của Yamaha cho đối thủ Winner X trước sức &eacute;p ng&agrave;y c&agrave;ng lớn khi mức gi&aacute; tại đại l&yacute; của mẫu xe Honda Winner X lu&ocirc;n b&aacute;n dưới gi&aacute; đề xuất 3-5 triệu đồng.</p>', 0, 0000000018, NULL, 0000000053, 1, 1),
(0000000041, 'WINNER X', '55000000', '1000000', '70000000', '2022-01-09 20:00:00', '2022-01-12 19:43:00', '<p>Lấy cảm hứng từ đam m&ecirc; tốc độ v&agrave; sự mạnh mẽ, phi&ecirc;n bản thể thao <strong>ABS Winner X</strong> mới chuyển m&igrave;nh với sự kết hợp đầy t&aacute;o bạo giữa m&agrave;u bạc đen đỏ mới lạ v&agrave; tem xe biến h&oacute;a kh&eacute;o l&eacute;o từ nền chữ &ldquo;Winner X&rdquo; th&agrave;nh nền chữ&rdquo;Sport&rdquo; nổi bật khẳng định chất thể thao kh&ocirc;ng thể h&ograve;a lẫn của mẫu xe . Điểm xuyết tr&ecirc;n tem xe mới l&agrave; những đường kẻ đỏ c&ugrave;ng họa tiết tam gi&aacute;c đang l&agrave; xu hướng tr&ecirc;n c&aacute;c mẫu si&ecirc;u xe thể thao, gi&uacute;p cho thiết kế tem xe tổng thể trở n&ecirc;n nổi bật v&agrave; c&aacute; t&iacute;nh hơn. Đặc biệt, mặt nạ đầu xe c&ograve;n tạo hiệu ứng thị gi&aacute;c hiệu quả với h&igrave;nh ảnh chữ &ldquo;Sport&rdquo; đỏ nổi bật nằm dọc ph&iacute;a b&ecirc;n tr&aacute;i, kết hợp c&ugrave;ng đ&egrave;n LED hiện đại<br />Nằm trong tổng thể h&igrave;nh d&aacute;ng của một si&ecirc;u xe thể thao, cụm đ&egrave;n xi nhan trước v&agrave; sau của WINNER X được bố tr&iacute; hai b&ecirc;n th&acirc;n xe với tạo h&igrave;nh độc đ&aacute;o, trang bị LED hiện đại, đậm dấu ấn ph&aacute; c&aacute;ch trong ph&acirc;n kh&uacute;c xe c&ocirc;n tay thể thao 150cc.<br />Được thiết kế như l&agrave; một chiếc xe thể thao ph&acirc;n khối lớn thực thụ, WINNER X mang tr&ecirc;n m&igrave;nh h&agrave;ng loạt trang bị hấp dẫn, đậm chất thể thao: Phuộc trước tạo h&igrave;nh độc đ&aacute;o; G&aacute;c ch&acirc;n bằng nh&ocirc;m sang trọng, c&oacute; thể gập lại, tăng t&iacute;nh tiện dụng; Tay dắt sau thiết kế t&aacute;ch rời, tăng cảm gi&aacute;c thể thao; Đĩa phanh h&igrave;nh lượn s&oacute;ng c&ugrave;ng Nắp nh&ocirc;m của c&agrave;ng sau c&agrave;ng nhấn mạnh vẻ thể thao, mạnh mẽ của WINNER X.</p>', 0, 0000000018, NULL, 0000000053, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rate_history`
--

CREATE TABLE `rate_history` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_assessor` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL,
  `mark` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `comment` varchar(200) NOT NULL,
  `id_product` int(10) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `rate_history`
--

INSERT INTO `rate_history` (`id`, `id_assessor`, `id_acc`, `mark`, `time`, `comment`, `id_product`) VALUES
(0000000054, 0000000052, 0000000051, 1, '2022-01-04 13:06:53', 'Tốt', 0000000007),
(0000000055, 0000000051, 0000000052, 1, '2022-01-04 13:07:02', 'Tốt', 0000000007),
(0000000056, 0000000043, 0000000052, 1, '2022-01-04 13:10:41', 'Tốt', 0000000002),
(0000000057, 0000000043, 0000000052, 1, '2022-01-04 13:10:47', 'Tốt', 0000000002),
(0000000058, 0000000043, 0000000052, 1, '2022-01-04 13:10:57', 'Tốt', 0000000002),
(0000000059, 0000000052, 0000000043, 1, '2022-01-04 13:11:05', 'Tốt', 0000000002),
(0000000060, 0000000051, 0000000052, 1, '2022-01-09 17:42:54', 'tốt', 0000000008),
(0000000066, 0000000052, 0000000051, 1, '2022-01-09 17:56:19', 'Tốt, sản phẩm tuyệt vời!', 0000000008);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `request_upgrade`
--

CREATE TABLE `request_upgrade` (
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `request_upgrade`
--

INSERT INTO `request_upgrade` (`id_acc`) VALUES
(0000000050);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `seller_expired_day`
--

CREATE TABLE `seller_expired_day` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `seller_expired_day`
--

INSERT INTO `seller_expired_day` (`id`, `time`) VALUES
(0000000047, '2022-01-13 20:22:32'),
(0000000048, '2022-01-13 20:37:23'),
(0000000052, '2022-01-16 17:58:56'),
(0000000053, '2022-01-11 11:34:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('6qDayqpfgsva0o2lMfRHkJUXsoF5N4BS', 1641819361, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":52,\"email\":\"ntntu19@clc.fitus.edu.vn\",\"name\":\"Tú Nguyễn Trần Ngọc\",\"id_in_third_party\":\"110765543678667073301\",\"provider\":\"google\",\"id_permission\":2},\"id_permission\":2}}'),
('7bjj0I8yYKRsEWkrGLsFO2-giE8TCtP0', 1641819251, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":53,\"email\":\"tuantran.280801@gmail.com\",\"name\":\"Tuan Tran\",\"id_in_third_party\":\"112099082612252636766\",\"provider\":\"google\",\"id_permission\":2},\"id_permission\":2}}'),
('8A9OScRzao5JQ23DuvmLGdpcAF4pq1d2', 1641812654, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":52,\"email\":\"ntntu19@clc.fitus.edu.vn\",\"name\":\"Tú Nguyễn Trần Ngọc\",\"id_in_third_party\":\"110765543678667073301\",\"provider\":\"google\",\"id_permission\":2},\"id_permission\":2}}'),
('DjurQfmD2YaXhF9VGfOHAVJJsNkgPUHH', 1641819360, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":51,\"username\":\"tushimon\",\"id_permission\":1,\"name\":\"Nguyễn Trần Ngọc Tú\",\"email\":\"ngoctu.280801@gmail.com\",\"dob\":\"28-08-2001\",\"addr\":\"Cần Đước, Long An\",\"is_locked\":0}}}'),
('TslpFM5dSmcCL4IMzJRVd4PTK-44Udf-', 1641742316, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":43,\"username\":\"ab\",\"id_permission\":1,\"name\":\"Hai Tuan Vu\",\"email\":\"vutuanhaigk@gmail.com\",\"dob\":\"30-11-2021\",\"addr\":\"ab\",\"is_locked\":0}}}'),
('Yz3MTb1Gx4YOC7OGezHzi6_l8uiR2BEB', 1641812908, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":53,\"email\":\"tuantran.280801@gmail.com\",\"name\":\"Tuan Tran\",\"id_in_third_party\":\"112099082612252636766\",\"provider\":\"google\",\"id_permission\":2},\"id_permission\":2}}'),
('gS3ybC1B7gCEZyImscIO_7NoLbTtXVD8', 1641819376, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":43,\"username\":\"ab\",\"id_permission\":1,\"name\":\"Hai Tuan Vu\",\"email\":\"vutuanhaigk@gmail.com\",\"dob\":\"30-11-2021\",\"addr\":\"ab\",\"is_locked\":0}}}'),
('oUNxnNUcPJfBUrpWbKoIbh1q0852m9g0', 1641817415, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":53,\"email\":\"tuantran.280801@gmail.com\",\"name\":\"Tuan Tran\",\"id_in_third_party\":\"112099082612252636766\",\"provider\":\"google\",\"id_permission\":2},\"id_permission\":2}}'),
('uI4HfvkEtlvm2zL-vBt3ErFiinqCIIcP', 1641818390, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":52,\"email\":\"ntntu19@clc.fitus.edu.vn\",\"name\":\"Tú Nguyễn Trần Ngọc\",\"id_in_third_party\":\"110765543678667073301\",\"provider\":\"google\",\"id_permission\":2},\"id_permission\":2}}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `third_party_account`
--

CREATE TABLE `third_party_account` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_in_third_party` varchar(100) DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `third_party_account`
--

INSERT INTO `third_party_account` (`id`, `id_in_third_party`, `provider`) VALUES
(0000000015, '110452804810387', 'facebook'),
(0000000020, '108130178380491', 'facebook'),
(0000000047, '105751357318145639642', 'google'),
(0000000049, '110452804810387', 'facebook'),
(0000000050, '104913772676972067806', 'google'),
(0000000052, '110765543678667073301', 'google'),
(0000000053, '112099082612252636766', 'google');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `watch_list`
--

CREATE TABLE `watch_list` (
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_product` int(10) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `watch_list`
--

INSERT INTO `watch_list` (`id_acc`, `id_product`) VALUES
(0000000048, 0000000001),
(0000000048, 0000000005),
(0000000048, 0000000024),
(0000000048, 0000000026),
(0000000051, 0000000001),
(0000000051, 0000000003),
(0000000051, 0000000004),
(0000000051, 0000000008),
(0000000051, 0000000009),
(0000000051, 0000000011),
(0000000051, 0000000028),
(0000000052, 0000000005),
(0000000052, 0000000012);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Chỉ mục cho bảng `bid_history`
--
ALTER TABLE `bid_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_BidHis_Acc` (`id_acc`),
  ADD KEY `FK_BidHis_Product` (`id_product`);

--
-- Chỉ mục cho bảng `bid_price`
--
ALTER TABLE `bid_price`
  ADD PRIMARY KEY (`id_acc`,`id_product`),
  ADD KEY `FK_BidPrice_Product` (`id_product`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `FK_cate_parentCate` (`parent_id`);

--
-- Chỉ mục cho bảng `change_pwd`
--
ALTER TABLE `change_pwd`
  ADD PRIMARY KEY (`id_acc`);

--
-- Chỉ mục cho bảng `ignore_bidder`
--
ALTER TABLE `ignore_bidder`
  ADD PRIMARY KEY (`id_product`,`id_acc`),
  ADD KEY `FK_IgnoreBidder_Account` (`id_acc`);

--
-- Chỉ mục cho bảng `not_verified_email`
--
ALTER TABLE `not_verified_email`
  ADD PRIMARY KEY (`id_acc`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_products_cate` (`id_category`),
  ADD KEY `FK_products_accBidder` (`id_win_bidder`),
  ADD KEY `FK_products_accSeller` (`id_seller`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`,`description`);

--
-- Chỉ mục cho bảng `rate_history`
--
ALTER TABLE `rate_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_RateHis_AccAssessor` (`id_assessor`),
  ADD KEY `FK_RateHis_Acc` (`id_acc`),
  ADD KEY `FK_RateHis_Products` (`id_product`);

--
-- Chỉ mục cho bảng `request_upgrade`
--
ALTER TABLE `request_upgrade`
  ADD PRIMARY KEY (`id_acc`);

--
-- Chỉ mục cho bảng `seller_expired_day`
--
ALTER TABLE `seller_expired_day`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Chỉ mục cho bảng `third_party_account`
--
ALTER TABLE `third_party_account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `watch_list`
--
ALTER TABLE `watch_list`
  ADD PRIMARY KEY (`id_acc`,`id_product`),
  ADD KEY `FK_WatchList_Product` (`id_product`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `bid_history`
--
ALTER TABLE `bid_history`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT cho bảng `bid_price`
--
ALTER TABLE `bid_price`
  MODIFY `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `rate_history`
--
ALTER TABLE `rate_history`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bid_history`
--
ALTER TABLE `bid_history`
  ADD CONSTRAINT `FK_BidHis_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_BidHis_Product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `bid_price`
--
ALTER TABLE `bid_price`
  ADD CONSTRAINT `FK_BidPrice_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_BidPrice_Product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_cate_parentCate` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `change_pwd`
--
ALTER TABLE `change_pwd`
  ADD CONSTRAINT `FK_ChangePwd_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`);

--
-- Các ràng buộc cho bảng `ignore_bidder`
--
ALTER TABLE `ignore_bidder`
  ADD CONSTRAINT `FK_IgnoreBidder_Account` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_IgnoreBidder_Product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `not_verified_email`
--
ALTER TABLE `not_verified_email`
  ADD CONSTRAINT `FK_NotVerifiedEmail_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products_accBidder` FOREIGN KEY (`id_win_bidder`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_products_accSeller` FOREIGN KEY (`id_seller`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_products_cate` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `rate_history`
--
ALTER TABLE `rate_history`
  ADD CONSTRAINT `FK_RateHis_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_RateHis_AccAssessor` FOREIGN KEY (`id_assessor`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_RateHis_Products` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `request_upgrade`
--
ALTER TABLE `request_upgrade`
  ADD CONSTRAINT `FK_RequestUp_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`);

--
-- Các ràng buộc cho bảng `seller_expired_day`
--
ALTER TABLE `seller_expired_day`
  ADD CONSTRAINT `FK_SellerExpDay_Acc` FOREIGN KEY (`id`) REFERENCES `accounts` (`id`);

--
-- Các ràng buộc cho bảng `third_party_account`
--
ALTER TABLE `third_party_account`
  ADD CONSTRAINT `FK_ThirdPartyAcc_Acc` FOREIGN KEY (`id`) REFERENCES `accounts` (`id`);

--
-- Các ràng buộc cho bảng `watch_list`
--
ALTER TABLE `watch_list`
  ADD CONSTRAINT `FK_WatchList_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_WatchList_Product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
