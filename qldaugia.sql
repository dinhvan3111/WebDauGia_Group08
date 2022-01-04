-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 04, 2022 lúc 08:00 AM
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
(0000000047, '105751357318145639642google', NULL, 3, 'Do Van', 'dinhvan3111@gmail.com', NULL, NULL, 0),
(0000000048, 'dinhvan', '$2b$10$xWHlip460bWo849801nc4.8r0URpaCaCtL6utP0fFaFnyvijxyE3i', 3, 'Do Dinh Van', 'dodinhvan3111@gmail.com', '2001-11-03', 'Tây Sơn - Bình Định', 0),
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
(0000000164, '2022-01-04 13:26:22', 0000000043, 0000000004, '46000000');

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
(0000000043, 0000000008, '2022-01-04 06:17:58', '39000000'),
(0000000043, 0000000009, '2022-01-04 06:19:34', '26000000'),
(0000000043, 0000000010, '2022-01-04 06:22:32', '52000000'),
(0000000043, 0000000012, '2022-01-04 06:24:01', '36000000'),
(0000000044, 0000000009, '2022-01-04 05:53:49', '23000000'),
(0000000051, 0000000001, '2022-01-04 06:00:53', '31000000'),
(0000000051, 0000000003, '2022-01-04 06:14:38', '23000000'),
(0000000051, 0000000004, '2022-01-04 06:25:16', '42000000'),
(0000000051, 0000000005, '2022-01-04 04:54:35', '40000000'),
(0000000051, 0000000006, '2022-01-04 06:13:02', '55000000'),
(0000000051, 0000000008, '2022-01-04 06:17:43', '40000000'),
(0000000051, 0000000009, '2022-01-04 06:19:19', '24000000'),
(0000000051, 0000000012, '2022-01-04 06:23:52', '34000000'),
(0000000052, 0000000011, '2022-01-04 06:20:40', '12000000'),
(0000000052, 0000000012, '2022-01-04 06:24:19', '38000000'),
(0000000053, 0000000001, '2022-01-04 06:05:22', '35000000'),
(0000000053, 0000000005, '2022-01-04 05:44:45', '31000000');

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
(0000000004, 'Nội thất', NULL),
(0000000005, 'Đồng hồ thông minh', 0000000001),
(0000000006, 'Bàn ghế', 0000000004);

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
(0000000008, 'Laptop Dell Gaming G3 15 i7 10750H/16GB/512GB/6GB GTX1660Ti/120Hz/Win10 (P89F002BWH', '40000000', '1000000', '50000000', '2022-01-04 13:00:00', '2022-01-19 11:37:00', '<p><strong>Laptop Dell G3 15 i7 (P89F002BWH)</strong> thuộc d&ograve;ng laptop gaming với cấu h&igrave;nh mạnh mẽ, thiết kế trang nh&atilde; v&agrave; rất sang trọng, dễ lựa chọn cho cả người đi đọc, đi l&agrave;m, l&agrave; 1 phi&ecirc;n bản tốt để lựa chọn cho cả nhu cầu l&agrave;m việc, học tập v&agrave; chơi game giải tr&iacute;.<br />Sang trọng, tinh tế, phong c&aacute;ch trẻ trung, hiện đại<br />Được đưa v&agrave;o ph&acirc;n kh&uacute;c laptop gaming, Dell G3 v&igrave; thế trang bị vẻ ngo&agrave;i cũng mang hơi hướng mạnh mẽ, c&aacute; t&iacute;nh, nhưng đủ tinh tế v&agrave; rất sang trọng để người d&ugrave;ng c&oacute; thể thoải m&aacute;i mang theo sử dụng ở mọi nơi.</p>\r\n<p>Lớp vỏ nhựa m&agrave;u trắng hiện đại, c&aacute;c đường v&aacute;t g&oacute;c cạnh rất tinh tế, ngoại h&igrave;nh chắc chắn, trọng lượng 2.58 kg, độ d&agrave;y 30.96 mm kh&ocirc;ng qu&aacute; nhẹ nhưng cũng kh&ocirc;ng qu&aacute; kh&oacute; khăn để mang k&egrave;m n&oacute; tới văn ph&ograve;ng, lớp học,&hellip;</p>\r\n<p>Laptop Dell trang bị b&agrave;n ph&iacute;m với h&agrave;nh tr&igrave;nh ph&iacute;m tốt, cụm ph&iacute;m WASD nổi bật, v&ugrave;ng ph&iacute;m số độc lập gi&uacute;p thao t&aacute;c soạn thảo v&agrave; t&iacute;nh to&aacute;n cực nhanh nhạy, th&ecirc;m sự hỗ trợ của đ&egrave;n nền để thao t&aacute;c ph&iacute;m chuẩn x&aacute;c cả trong điều kiện thiếu s&aacute;ng.</p>', 0, 0000000003, 0000000051, 0000000052, 1, 1),
(0000000009, 'Laptop Dell Inspiron 7400 i5 1135G7/16GB/512GB/2GB MX350/Win10 (N4I5134W)', '26000000', '1000000', '40000000', '2022-01-04 12:00:00', '2022-01-12 11:40:00', '<p>Mang đến kiểu d&aacute;ng sang trọng v&agrave; đẳng cấp, laptop <strong>Dell Inspiron 7400 i5 1135G7 (N4I5134W)</strong> với sức mạnh hiệu năng mạnh mẽ từ chip Intel Gen 11, l&agrave; cộng sự l&yacute; tưởng ở cả c&ocirc;ng việc v&agrave; giải tr&iacute;.<br />Tận hưởng khung h&igrave;nh ch&acirc;n thật c&ugrave;ng &acirc;m thanh sống động<br />M&agrave;n h&igrave;nh 14.5 inch c&ugrave;ng độ ph&acirc;n giải QHD+ (2560 x 1600) cho h&igrave;nh ảnh hiển thị ch&acirc;n thật, r&otilde; n&eacute;t ở cả trong nh&agrave; hay ngo&agrave;i trời nhờ độ s&aacute;ng m&agrave;n h&igrave;nh 300 nits.</p>\r\n<p>Hiển thị một c&aacute;ch ch&iacute;nh x&aacute;c v&agrave; sắc n&eacute;t c&aacute;c chi tiết của h&igrave;nh ảnh nhờ m&agrave;n h&igrave;nh 100% sRGB, đồng thời gi&uacute;p hạn chế tối đa sự kh&aacute;c biệt giữa h&igrave;nh ảnh hiển thị với thực tế.<br />Khung h&igrave;nh được trải rộng l&ecirc;n đến 178 độ nhờ tấm nền IPS mang đến cho bạn h&igrave;nh ảnh sống động d&ugrave; kh&ocirc;ng ngồi trực diện m&agrave; kh&ocirc;ng lo mỏi mắt hay l&oacute;a mắt do ảnh hưởng xấu từ &aacute;nh s&aacute;ng xanh độc hại nhờ c&ocirc;ng nghệ chống ch&oacute;i Anti Glare.</p>', 0, 0000000003, 0000000043, 0000000053, 1, 1),
(0000000010, 'Điện thoại Samsung Galaxy Z Fold3 5G 512GB', '52000000', '2000000', '90000000', '2022-01-04 12:00:00', '2022-01-27 11:41:00', '<p><strong>Galaxy Z Fold3 5G</strong> đ&aacute;nh dấu bước tiến mới của Samsung trong ph&acirc;n kh&uacute;c điện thoại gập cao cấp khi được cải tiến về độ bền c&ugrave;ng những n&acirc;ng cấp đ&aacute;ng gi&aacute; về cấu h&igrave;nh hiệu năng, hứa hẹn sẽ mang đến trải nghiệm sử dụng đột ph&aacute; cho người d&ugrave;ng.</p>\r\n<p><br /><strong>Đột ph&aacute; thiết kế m&agrave;n h&igrave;nh gập</strong><br />Đầu ti&ecirc;n, khung viền Galaxy Z Fold3 được ho&agrave;n thiện bằng chất liệu Armor Aluminum cao cấp nhất từ trước đến giờ nhằm tăng cường được độ bền, m&agrave; vẫn đảm bảo được trọng lượng c&acirc;n đối đem tới cảm gi&aacute;c v&ocirc; c&ugrave;ng chắc chắn v&agrave; cao cấp.&nbsp;</p>\r\n<p><br /><strong>Cụm camera đỉnh cao c&ocirc;ng nghệ</strong><br />Kế đ&oacute;, cụm camera tr&ecirc;n Galaxy Z Fold3 bao gồm 3 ống k&iacute;nh: Camera g&oacute;c rộng, camera g&oacute;c si&ecirc;u rộng, camera tele t&iacute;ch hợp chống rung OIS v&agrave; đều sở hữu độ ph&acirc;n giải 12 MP đặt trong cụm m&ocirc;-đun h&igrave;nh chữ nhật được bo tr&ograve;n 2 đầu tr&ocirc;ng rất thon gọn v&agrave; đầy tinh tế.</p>', 0, 0000000002, 0000000043, 0000000053, 1, 0),
(0000000011, 'Điện thoại Xiaomi 11T 5G 128GB', '12000000', '500000', '20000000', '2022-01-04 12:00:00', '2022-01-13 11:43:00', '<p><strong>Xiaomi 11T</strong> đầy nổi bật với thiết kế v&ocirc; c&ugrave;ng trẻ trung, m&agrave;n h&igrave;nh AMOLED, bộ 3 camera sắc n&eacute;t v&agrave; vi&ecirc;n pin lớn đ&acirc;y sẽ l&agrave; mẫu smartphone của Xiaomi thỏa m&atilde;n mọi nhu cầu giải tr&iacute;, l&agrave;m việc v&agrave; l&agrave; niềm đam m&ecirc; s&aacute;ng tạo của bạn.&nbsp;</p>\r\n<p><br /><strong>Camera 108 MP si&ecirc;u sắc n&eacute;t, l&agrave;m chủ mọi khung h&igrave;nh</strong><br />Xiaomi trang bị cho 11T 3 camera sau gồm camera ch&iacute;nh độ ph&acirc;n giải 108 MP, camera g&oacute;c rộng 8 MP 120 độ v&agrave; camera telemacro 5 MP c&ugrave;ng hệ thống phần cứng tối t&acirc;n được trang bị b&ecirc;n trong cực kỳ ấn tượng. Chỉ cần giơ m&aacute;y l&ecirc;n chụp l&agrave; bạn đ&atilde; c&oacute; những bức ảnh sắc n&eacute;t đ&aacute;ng kinh ngạc, khả năng thu ph&oacute;ng cũng cực tốt, cho bạn chụp được r&otilde; từng chi tiết d&ugrave; đối tượng ở kh&aacute; xa.</p>\r\n<p><br /><strong>Chiến game cực &ldquo;mượt&rdquo; với MediaTek Dimensity 1200</strong><br />MediaTek Dimensity 1200 8 nh&acirc;n được sản xuất dựa tr&ecirc;n tiến tr&igrave;nh 6 nm đạt mức xung nhịp tối đa l&agrave; 3 GHz, một sức mạnh cực khủng cho chiếc điện thoại đủ để bạn chiến mọi tựa game tr&ecirc;n di động v&agrave; tiết kiệm năng lượng hơn so với thế hệ tiền nhiệm trước đ&oacute;.&nbsp;</p>', 0, 0000000002, 0000000052, 0000000053, 1, 1),
(0000000012, 'iPhone 13 Pro Max 256GB Chính hãng', '37000000', '1000000', '60000000', '2022-01-04 11:50:00', '2022-01-12 11:44:00', '<p><strong>Mua iPhone 13 Pro Max 256GB</strong> là lựa chọn t&ocirc;́t nh&acirc;́t ở thời đi&ecirc;̉m này bởi đ&acirc;y được xem là bản n&acirc;ng c&acirc;́p tuy&ecirc;̣t vời của phi&ecirc;n bản iPhone 12 Pro Max. Sự xu&acirc;́t hi&ecirc;̣n của chip A15 Bionic, màn hình ProMotion 120Hz, dung lượng pin lớn hơn....chắc chắn sẽ mang đ&ecirc;́n trải nghi&ecirc;̣m hoàn hảo nh&acirc;́t.<br />Thi&ecirc;́t k&ecirc;́ sang trọng đ&ecirc;́n từng chi ti&ecirc;́t<br />Thi&ecirc;́t k&ecirc;́ <strong>iPhone 13 Pro Max 256GB</strong> tr&ocirc;ng v&acirc;̃n gi&ocirc;́ng với <strong>iPhone 12 Pro Max</strong>. Đi&ecirc;̣n thoại v&acirc;̃n được hoàn thi&ecirc;̣n từ mặt lưng kính phủ mờ k&ecirc;́t hợp với khung vi&ecirc;̀n thép kh&ocirc;ng gỉ được làm phẳng mang đ&ecirc;́n sự nam tính và mạnh mẽ. Đ&ecirc;̉ thi&ecirc;́t bị trở n&ecirc;n hoàn hảo hơn, Apple cũng đã thực hi&ecirc;̣n m&ocirc;̣t vài tinh nhỏ.<br />Ph&acirc;̀n notch tai thỏ tr&ecirc;n <strong>iPhone 13 Pro Max</strong> giá rẻ giờ đ&acirc;y đã được thu hẹp nhỏ hơn th&ecirc;́ h&ecirc;̣ trước 20%. M&ocirc;-đun camera sau cũng có kích thước lớn và nh&ocirc; ra nhi&ecirc;̀u hơn. Những chi ti&ecirc;́t này k&ecirc;́t hợp với vi&ecirc;̣c trang bị dung lượng pin lớn đã khi&ecirc;́n trọng lượng đi&ecirc;̣n thoại nặng và dày hơn khá nhi&ecirc;̀u. Mua <strong>iPhone 13 Pro Max 256GB</strong> người dùng sẽ có các tùy chòn màu sắc g&ocirc;̀m: Xám, bạc, vàng và xanh nhạt.</p>\r\n<p><strong>Màn hình ProMotion 120Hz</strong><br />Apple ti&ecirc;́p tục trang bị cho màn hình<strong> iPhone 13 Pro Max 256GB</strong> kích thước 6.7 inch có đ&ocirc;̣ ph&acirc;n giải 1284 x 2778 Pixel. Đi&ecirc;̉m đáng chú ý nh&acirc;́t chính là đi&ecirc;̣n thoại đã được trang bị t&acirc;̀n s&ocirc;́ quét 120Hz. Đ&acirc;y là tính năng mà r&acirc;́t nhi&ecirc;̀u người h&acirc;m m&ocirc;̣ đã chờ đợi, và họ đã r&acirc;́t th&acirc;́t vọng khi nó lỡ hẹn tr&ecirc;n iPhone 12 Pro Max.</p>', 0, 0000000002, 0000000052, 0000000053, 1, 0);

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
(0000000059, 0000000052, 0000000043, 1, '2022-01-04 13:11:05', 'Tốt', 0000000002);

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
(0000000052, '2022-01-06 08:18:16'),
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
('FDnDaDr1XLG_lAKclJUZI-HI7DARfIZ7', 1641363972, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":43,\"username\":\"ab\",\"id_permission\":1,\"name\":\"Hai Tuan Vu\",\"email\":\"vutuanhaigk@gmail.com\",\"dob\":\"30-11-2021\",\"addr\":\"ab\",\"is_locked\":0}}}'),
('HEgnOHfl3hX4iiHXZwCw5F0MXYcZQo5K', 1641362030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":44,\"username\":\"abc\",\"id_permission\":2,\"name\":\"Hai Tuan Vu\",\"email\":\"drl19hcmus@gmail.com\",\"dob\":\"30-11-1899\",\"addr\":\"abc\",\"is_locked\":0}}}'),
('MCkh7TMpH2QoNb_mXAVNtSUj07kn9ARM', 1641363954, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":53,\"email\":\"tuantran.280801@gmail.com\",\"name\":\"Tuan Tran\",\"id_in_third_party\":\"112099082612252636766\",\"provider\":\"google\",\"id_permission\":2},\"id_permission\":2}}'),
('NATf_1jZY2HJoCz7LSVyg3v5inEBTOVz', 1641365960, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":51,\"username\":\"tushimon\",\"id_permission\":1,\"name\":\"Nguyễn Trần Ngọc Tú\",\"email\":\"ngoctu.280801@gmail.com\",\"dob\":\"28-08-2001\",\"addr\":\"Cần Đước, Long An\",\"is_locked\":0}}}'),
('XUsqu7_PQwO0gMn7zYwgVrSQsuGMUuQJ', 1641357509, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":52,\"email\":\"ntntu19@clc.fitus.edu.vn\",\"name\":\"Tú Nguyễn Trần Ngọc\",\"id_in_third_party\":\"110765543678667073301\",\"provider\":\"google\",\"id_permission\":2},\"id_permission\":2}}'),
('Z1aYlTB57sQNTqB5Vvrm8NrPA3bA3Oh4', 1641363929, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":52,\"email\":\"ntntu19@clc.fitus.edu.vn\",\"name\":\"Tú Nguyễn Trần Ngọc\",\"id_in_third_party\":\"110765543678667073301\",\"provider\":\"google\",\"id_permission\":2},\"id_permission\":2}}'),
('fu0CymQZe1Fg-yjIoRZm9Tb4bI0Dvdo2', 1641317538, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":51,\"username\":\"tushimon\",\"id_permission\":1,\"name\":\"Nguyễn Trần Ngọc Tú\",\"email\":\"ngoctu.280801@gmail.com\",\"dob\":\"28-08-2001\",\"addr\":\"Cần Đước, Long An\",\"is_locked\":0}}}');

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
(0000000051, 0000000001),
(0000000051, 0000000003),
(0000000051, 0000000004),
(0000000051, 0000000008),
(0000000051, 0000000009),
(0000000051, 0000000011),
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
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT cho bảng `bid_price`
--
ALTER TABLE `bid_price`
  MODIFY `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `rate_history`
--
ALTER TABLE `rate_history`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

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
