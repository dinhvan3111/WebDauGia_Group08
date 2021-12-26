-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2021 at 04:30 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE `qldaugia` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `qldaugia`;
--
-- Database: `qldaugia`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
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
-- Dumping data for table `accounts`
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
(0000000050, '104913772676972067806google', NULL, 3, 'Hai VuTuan', 'vutuanhaigk123@gmail.com', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bid_history`
--

CREATE TABLE `bid_history` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_product` int(10) UNSIGNED ZEROFILL NOT NULL,
  `in_bid_price` decimal(10,0) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bid_history`
--

INSERT INTO `bid_history` (`id`, `time`, `id_acc`, `id_product`, `in_bid_price`) VALUES
(0000000014, '2021-12-16 11:27:11', 0000000044, 0000000002, '1000000'),
(0000000015, '2021-12-16 11:27:52', 0000000046, 0000000002, '1900000'),
(0000000016, '2021-12-16 11:27:52', 0000000044, 0000000002, '2000000'),
(0000000017, '2021-12-16 11:28:14', 0000000046, 0000000002, '2100000'),
(0000000020, '2021-12-16 15:58:00', 0000000015, 0000000002, '2600000'),
(0000000021, '2021-12-16 16:00:39', 0000000044, 0000000002, '3000000'),
(0000000022, '2021-12-16 16:00:39', 0000000015, 0000000002, '3100000'),
(0000000023, '2021-12-16 17:46:37', 0000000044, 0000000002, '4000000'),
(0000000024, '2021-12-16 17:46:37', 0000000015, 0000000002, '4100000'),
(0000000025, '2021-12-16 20:46:58', 0000000044, 0000000002, '4500000'),
(0000000026, '2021-12-16 20:46:58', 0000000015, 0000000002, '4600000'),
(0000000027, '2021-12-16 20:49:15', 0000000044, 0000000002, '4900000'),
(0000000028, '2021-12-16 20:49:15', 0000000015, 0000000002, '5000000'),
(0000000029, '2021-12-16 20:52:30', 0000000044, 0000000002, '5100000'),
(0000000030, '2021-12-16 22:25:26', 0000000046, 0000000002, '5500000'),
(0000000031, '2021-12-16 22:25:26', 0000000044, 0000000002, '5600000'),
(0000000032, '2021-12-16 22:34:02', 0000000046, 0000000002, '5700000'),
(0000000033, '2021-12-16 22:34:02', 0000000044, 0000000002, '5800000'),
(0000000042, '2021-12-18 16:24:12', 0000000046, 0000000003, '10000000');

-- --------------------------------------------------------

--
-- Table structure for table `bid_price`
--

CREATE TABLE `bid_price` (
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_product` int(10) UNSIGNED ZEROFILL NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `max_bid_price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bid_price`
--

INSERT INTO `bid_price` (`id_acc`, `id_product`, `time`, `max_bid_price`) VALUES
(0000000015, 0000000002, '2021-12-16 08:58:00', '5000000'),
(0000000046, 0000000002, '2021-12-16 04:28:14', '2500000'),
(0000000046, 0000000003, '2021-12-18 09:24:12', '12000000');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent_id` int(10) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`) VALUES
(0000000001, 'Điện tử', NULL),
(0000000002, 'Điện thoại di động', 0000000001),
(0000000003, 'Máy tính xách tay', 0000000001),
(0000000004, 'Nội thất', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `change_pwd`
--

CREATE TABLE `change_pwd` (
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL,
  `token` varchar(100) NOT NULL,
  `expired_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ignore_bidder`
--

CREATE TABLE `ignore_bidder` (
  `id_product` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `not_verified_email`
--

CREATE TABLE `not_verified_email` (
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL,
  `token` varchar(100) NOT NULL,
  `expired_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
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
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `step_price`, `buy_now_price`, `time_start`, `time_end`, `description`, `auto_renew`, `id_category`, `id_win_bidder`, `id_seller`, `not_sold`, `allow_non_rating_bidder`) VALUES
(0000000002, 'BPhone', '5800000', '100000', '10000000', '2021-12-16 11:13:41', '2021-12-16 12:00:00', '<p><em><span style=\"text-decoration: underline;\">Điện thoại Đ&acirc;y l&agrave; d&ograve;ng m&ocirc; tả BPhone</span></em></p><br><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i>  17/12/2021<br><p>BPhone h&agrave;ng like new 95%, c&oacute; m&oacute;p cạnh viền</p>', 0, 0000000002, 0000000044, 0000000043, 0, 1),
(0000000003, 'SAMSUNG Galaxy S20 cũ lllllllllllllllllllllllllllllll', '10000000', '200000', '19000000', '2021-12-16 11:15:32', '2021-12-18 16:35:00', '<p>Điện thoại SAMSUNG Galaxy S20 cũ 97% FULL BOX, xước nhẹ camera</p>', 1, 0000000002, 0000000046, 0000000043, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rate_history`
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

-- --------------------------------------------------------

--
-- Table structure for table `request_upgrade`
--

CREATE TABLE `request_upgrade` (
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `request_upgrade`
--

INSERT INTO `request_upgrade` (`id_acc`) VALUES
(0000000050);

-- --------------------------------------------------------

--
-- Table structure for table `seller_expired_day`
--

CREATE TABLE `seller_expired_day` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('bGdENuJ5-FBbeJ4ULwY1dY5XO2AN1xPJ', 1640495463, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":43,\"username\":\"ab\",\"id_permission\":1,\"name\":\"Hai Tuan Vu\",\"email\":\"vutuanhaigk@gmail.com\",\"dob\":\"30-11-2021\",\"addr\":\"ab\",\"is_locked\":0}}}'),
('iDwrOlJ_hImdfZOVWbCAP1JfO7bFdz0A', 1640575734, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"id\":43,\"username\":\"ab\",\"id_permission\":1,\"name\":\"Hai Tuan Vu\",\"email\":\"vutuanhaigk@gmail.com\",\"dob\":\"30-11-2021\",\"addr\":\"ab\",\"is_locked\":0}}}');

-- --------------------------------------------------------

--
-- Table structure for table `third_party_account`
--

CREATE TABLE `third_party_account` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_in_third_party` varchar(100) DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `third_party_account`
--

INSERT INTO `third_party_account` (`id`, `id_in_third_party`, `provider`) VALUES
(0000000015, '110452804810387', 'facebook'),
(0000000020, '108130178380491', 'facebook'),
(0000000047, '105751357318145639642', 'google'),
(0000000049, '110452804810387', 'facebook'),
(0000000050, '104913772676972067806', 'google');

-- --------------------------------------------------------

--
-- Table structure for table `watch_list`
--

CREATE TABLE `watch_list` (
  `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_product` int(10) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `watch_list`
--

INSERT INTO `watch_list` (`id_acc`, `id_product`) VALUES
(0000000044, 0000000002),
(0000000044, 0000000003),
(0000000047, 0000000002);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `bid_history`
--
ALTER TABLE `bid_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_BidHis_Acc` (`id_acc`),
  ADD KEY `FK_BidHis_Product` (`id_product`);

--
-- Indexes for table `bid_price`
--
ALTER TABLE `bid_price`
  ADD PRIMARY KEY (`id_acc`,`id_product`),
  ADD KEY `FK_BidPrice_Product` (`id_product`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `FK_cate_parentCate` (`parent_id`);

--
-- Indexes for table `change_pwd`
--
ALTER TABLE `change_pwd`
  ADD PRIMARY KEY (`id_acc`);

--
-- Indexes for table `ignore_bidder`
--
ALTER TABLE `ignore_bidder`
  ADD PRIMARY KEY (`id_product`,`id_acc`),
  ADD KEY `FK_IgnoreBidder_Account` (`id_acc`);

--
-- Indexes for table `not_verified_email`
--
ALTER TABLE `not_verified_email`
  ADD PRIMARY KEY (`id_acc`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_products_cate` (`id_category`),
  ADD KEY `FK_products_accBidder` (`id_win_bidder`),
  ADD KEY `FK_products_accSeller` (`id_seller`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`,`description`);

--
-- Indexes for table `rate_history`
--
ALTER TABLE `rate_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_RateHis_AccAssessor` (`id_assessor`),
  ADD KEY `FK_RateHis_Acc` (`id_acc`),
  ADD KEY `FK_RateHis_Products` (`id_product`);

--
-- Indexes for table `request_upgrade`
--
ALTER TABLE `request_upgrade`
  ADD PRIMARY KEY (`id_acc`);

--
-- Indexes for table `seller_expired_day`
--
ALTER TABLE `seller_expired_day`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `third_party_account`
--
ALTER TABLE `third_party_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watch_list`
--
ALTER TABLE `watch_list`
  ADD PRIMARY KEY (`id_acc`,`id_product`),
  ADD KEY `FK_WatchList_Product` (`id_product`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `bid_history`
--
ALTER TABLE `bid_history`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `bid_price`
--
ALTER TABLE `bid_price`
  MODIFY `id_acc` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rate_history`
--
ALTER TABLE `rate_history`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bid_history`
--
ALTER TABLE `bid_history`
  ADD CONSTRAINT `FK_BidHis_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_BidHis_Product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `bid_price`
--
ALTER TABLE `bid_price`
  ADD CONSTRAINT `FK_BidPrice_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_BidPrice_Product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_cate_parentCate` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `change_pwd`
--
ALTER TABLE `change_pwd`
  ADD CONSTRAINT `FK_ChangePwd_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `ignore_bidder`
--
ALTER TABLE `ignore_bidder`
  ADD CONSTRAINT `FK_IgnoreBidder_Account` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_IgnoreBidder_Product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `not_verified_email`
--
ALTER TABLE `not_verified_email`
  ADD CONSTRAINT `FK_NotVerifiedEmail_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products_accBidder` FOREIGN KEY (`id_win_bidder`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_products_accSeller` FOREIGN KEY (`id_seller`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_products_cate` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`);

--
-- Constraints for table `rate_history`
--
ALTER TABLE `rate_history`
  ADD CONSTRAINT `FK_RateHis_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_RateHis_AccAssessor` FOREIGN KEY (`id_assessor`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_RateHis_Products` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `request_upgrade`
--
ALTER TABLE `request_upgrade`
  ADD CONSTRAINT `FK_RequestUp_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `seller_expired_day`
--
ALTER TABLE `seller_expired_day`
  ADD CONSTRAINT `FK_SellerExpDay_Acc` FOREIGN KEY (`id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `third_party_account`
--
ALTER TABLE `third_party_account`
  ADD CONSTRAINT `FK_ThirdPartyAcc_Acc` FOREIGN KEY (`id`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `watch_list`
--
ALTER TABLE `watch_list`
  ADD CONSTRAINT `FK_WatchList_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `FK_WatchList_Product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
