-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2021 at 05:29 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE DATABASE `qldaugia` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `qldaugia`;
--
-- Database: `qldaugia`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
`id` int(10) unsigned zerofill NOT NULL,
  `username` varchar(150) CHARACTER SET ascii DEFAULT NULL,
  `pwd` varchar(100) CHARACTER SET ascii DEFAULT NULL,
  `id_permission` int(10) unsigned NOT NULL DEFAULT '3',
  `name` varchar(100) NOT NULL,
  `email` varchar(100) CHARACTER SET ascii DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `is_locked` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `pwd`, `id_permission`, `name`, `email`, `dob`, `addr`, `is_locked`) VALUES
(0000000015, '110452804810387facebook', NULL, 3, 'Elizabeth Algecgkdeheg Chengsen', 'ixnxqhmhoj_1638799299@tfbnw.net', NULL, NULL, 0),
(0000000019, 'a', NULL, 3, 'aaaaa', 'a@gmail.com', NULL, NULL, 0),
(0000000020, '108130178380491facebook', NULL, 3, 'Open Graph Test User', 'open_hjrryuc_user@tfbnw.net', NULL, NULL, 0),
(0000000043, 'ab', '$2b$10$vWfmmjKKsE.RBaSe/Uy0HeuRbJTlxZ.pbwIZWDp.NkXLBKr.YVmBG', 2, 'Hai Tuan Vu', 'vutuanhaigk@gmail.com', '2021-11-30', 'ab', 0),
(0000000044, 'abc', '$2b$10$Ony22vGMo9eDuzbxFuCVluilWyxWgWY9zJM8uC7QDuUaBjPwzT.Rq', 3, 'Hai Tuan Vu', 'vutuanhaigk123@gmail.com', '2021-11-30', 'abc', 0),
(0000000046, 'aba', '$2b$10$d6ZkiQ.UsMcCo9UieJVbouGzi0pBT.qxGL7st.GD3Xtl07Je2J/ki', 3, 'Hai Tuan Vu', 'vexal21807@mediafate.com', '2021-11-30', 'ab', 0),
(0000000047, '105751357318145639642google', NULL, 3, 'Do Van', 'dinhvan3111@gmail.com', NULL, NULL, 0),
(0000000048, 'dinhvan', '$2b$10$xWHlip460bWo849801nc4.8r0URpaCaCtL6utP0fFaFnyvijxyE3i', 3, 'Do Dinh Van', 'dodinhvan3111@gmail.com', '2001-11-03', 'Tây Sơn - Bình Định', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bid_history`
--

CREATE TABLE IF NOT EXISTS `bid_history` (
`id` int(10) unsigned zerofill NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_acc` int(10) unsigned zerofill NOT NULL,
  `id_product` int(10) unsigned zerofill NOT NULL,
  `in_bid_price` decimal(10,0) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bid_history`
--

INSERT INTO `bid_history` (`id`, `time`, `id_acc`, `id_product`, `in_bid_price`) VALUES
(0000000014, '2021-12-16 11:27:11', 0000000044, 0000000002, '1000000'),
(0000000015, '2021-12-16 11:27:52', 0000000046, 0000000002, '1900000'),
(0000000016, '2021-12-16 11:27:52', 0000000044, 0000000002, '2000000'),
(0000000017, '2021-12-16 11:28:14', 0000000046, 0000000002, '2100000');

-- --------------------------------------------------------

--
-- Table structure for table `bid_price`
--

CREATE TABLE IF NOT EXISTS `bid_price` (
`id_acc` int(10) unsigned zerofill NOT NULL,
  `id_product` int(10) unsigned zerofill NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `max_bid_price` decimal(10,0) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bid_price`
--

INSERT INTO `bid_price` (`id_acc`, `id_product`, `time`, `max_bid_price`) VALUES
(0000000044, 0000000002, '2021-12-16 04:27:11', '2000000'),
(0000000046, 0000000002, '2021-12-16 04:28:14', '2500000');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(10) unsigned zerofill NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent_id` int(10) unsigned zerofill DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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

CREATE TABLE IF NOT EXISTS `change_pwd` (
  `id_acc` int(10) unsigned zerofill NOT NULL,
  `token` varchar(100) NOT NULL,
  `expired_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ignore_bidder`
--

CREATE TABLE IF NOT EXISTS `ignore_bidder` (
  `id_product` int(10) unsigned zerofill NOT NULL,
  `id_acc` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `not_verified_email`
--

CREATE TABLE IF NOT EXISTS `not_verified_email` (
  `id_acc` int(10) unsigned zerofill NOT NULL,
  `token` varchar(100) NOT NULL,
  `expired_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `not_verified_email`
--

INSERT INTO `not_verified_email` (`id_acc`, `token`, `expired_date`) VALUES
(0000000043, 'ba4e0886bbe91124084fb717878f1c0e6737f5b0273482ba2a441e8f7b6b4540869b74b43dbb59d5c497228e7bacb1b8321c', '2021-12-11 15:48:31'),
(0000000044, 'ef850db80ecc4b062da9dc5ea6310c9dd8ea443caea9f938ca2fd3fa863021c7f1a5bfaa81b5e460112bb70725dc167f32e4', '2021-12-11 14:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`id` int(10) unsigned zerofill NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,0) unsigned NOT NULL,
  `step_price` decimal(10,0) unsigned NOT NULL,
  `buy_now_price` decimal(10,0) unsigned DEFAULT NULL,
  `time_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_end` datetime NOT NULL,
  `description` mediumtext NOT NULL,
  `auto_renew` int(11) NOT NULL DEFAULT '0',
  `id_category` int(10) unsigned zerofill NOT NULL,
  `id_win_bidder` int(10) unsigned zerofill DEFAULT NULL,
  `id_seller` int(10) unsigned zerofill NOT NULL,
  `not_sold` tinyint(1) NOT NULL DEFAULT '1',
  `allow_non_rating_bidder` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `step_price`, `buy_now_price`, `time_start`, `time_end`, `description`, `auto_renew`, `id_category`, `id_win_bidder`, `id_seller`, `not_sold`, `allow_non_rating_bidder`) VALUES
(0000000002, 'BPhone', '2500000', '100000', '10000000', '2021-12-16 11:13:41', '2021-12-16 22:00:00', '<p><em><span style="text-decoration: underline;">Đ&acirc;y l&agrave; d&ograve;ng m&ocirc; tả BPhone</span></em></p>', 0, 0000000002, 0000000046, 0000000043, 1, 1),
(0000000003, 'SAMSUNG Galaxy S20 cũ', '10000000', '200000', '19000000', '2021-12-16 11:15:32', '2021-12-16 16:00:00', '<p>SAMSUNG Galaxy S20 cũ 97% FULL BOX, xước nhẹ camera</p>', 0, 0000000002, NULL, 0000000043, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rate_history`
--

CREATE TABLE IF NOT EXISTS `rate_history` (
`id` int(10) unsigned zerofill NOT NULL,
  `id_assessor` int(10) unsigned zerofill NOT NULL,
  `id_acc` int(10) unsigned zerofill NOT NULL,
  `mark` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rate_history`
--

INSERT INTO `rate_history` (`id`, `id_assessor`, `id_acc`, `mark`, `time`, `comment`) VALUES
(0000000001, 0000000043, 0000000044, 1, '2021-12-11 13:22:54', 'upvote'),
(0000000002, 0000000043, 0000000044, 0, '2021-12-11 13:23:50', 'downVote'),
(0000000003, 0000000044, 0000000043, 1, '2021-12-11 13:24:27', 'ok'),
(0000000004, 0000000043, 0000000044, 1, '2021-12-11 13:25:05', 'upvote again');

-- --------------------------------------------------------

--
-- Table structure for table `request_upgrade`
--

CREATE TABLE IF NOT EXISTS `request_upgrade` (
  `id_acc` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seller_expired_day`
--

CREATE TABLE IF NOT EXISTS `seller_expired_day` (
  `id` int(10) unsigned zerofill NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('Ttre_6QiC2nNAe8UYnxu-DxX0WZKsyJM', 1639658673, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":{"id":44,"username":"abc","id_permission":3,"name":"Hai Tuan Vu","email":"vutuanhaigk123@gmail.com","dob":"30-11-2021","addr":"abc","is_locked":0}}}'),
('fOI4Z7w-FXzoPj_3hY1KiFQGSps83n6b', 1639581933, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":{"id":48,"username":"dinhvan","id_permission":3,"name":"Do Dinh Van","email":"dodinhvan3111@gmail.com","dob":"03-11-2001","addr":"Tây Sơn - Bình Định","is_locked":0}}}'),
('gYsbeHFM2Ae1YqDNvwVoHSK_86TKnRQH', 1639715299, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":{"id":44,"username":"abc","id_permission":3,"name":"Hai Tuan Vu","email":"vutuanhaigk123@gmail.com","dob":"30-11-2021","addr":"abc","is_locked":0}}}'),
('tqQEH6Dy032_ZssR6cevAshdDjBXJz7i', 1639715340, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{},"retUrl":"/products/add"}'),
('y_rnPr64lmeStimganZayRHv5TAlV0Mh', 1639650048, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":{"id":47,"email":"dinhvan3111@gmail.com","name":"Do Van","id_in_third_party":"105751357318145639642","provider":"google"}}}');

-- --------------------------------------------------------

--
-- Table structure for table `third_party_account`
--

CREATE TABLE IF NOT EXISTS `third_party_account` (
  `id` int(10) unsigned zerofill NOT NULL,
  `id_in_third_party` varchar(100) DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `third_party_account`
--

INSERT INTO `third_party_account` (`id`, `id_in_third_party`, `provider`) VALUES
(0000000015, '110452804810387', 'facebook'),
(0000000020, '108130178380491', 'facebook'),
(0000000047, '105751357318145639642', 'google');

-- --------------------------------------------------------

--
-- Table structure for table `watch_list`
--

CREATE TABLE IF NOT EXISTS `watch_list` (
  `id_acc` int(10) unsigned zerofill NOT NULL,
  `id_product` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `watch_list`
--

INSERT INTO `watch_list` (`id_acc`, `id_product`) VALUES
(0000000047, 0000000002);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `bid_history`
--
ALTER TABLE `bid_history`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_BidHis_Acc` (`id_acc`), ADD KEY `FK_BidHis_Product` (`id_product`);

--
-- Indexes for table `bid_price`
--
ALTER TABLE `bid_price`
 ADD PRIMARY KEY (`id_acc`,`id_product`), ADD KEY `FK_BidPrice_Product` (`id_product`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `FK_cate_parentCate` (`parent_id`);

--
-- Indexes for table `change_pwd`
--
ALTER TABLE `change_pwd`
 ADD PRIMARY KEY (`id_acc`);

--
-- Indexes for table `ignore_bidder`
--
ALTER TABLE `ignore_bidder`
 ADD PRIMARY KEY (`id_product`,`id_acc`), ADD KEY `FK_IgnoreBidder_Account` (`id_acc`);

--
-- Indexes for table `not_verified_email`
--
ALTER TABLE `not_verified_email`
 ADD PRIMARY KEY (`id_acc`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_products_cate` (`id_category`), ADD KEY `FK_products_accBidder` (`id_win_bidder`), ADD KEY `FK_products_accSeller` (`id_seller`), ADD FULLTEXT KEY `name` (`name`,`description`);

--
-- Indexes for table `rate_history`
--
ALTER TABLE `rate_history`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_RateHis_AccAssessor` (`id_assessor`), ADD KEY `FK_RateHis_Acc` (`id_acc`);

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
 ADD PRIMARY KEY (`id_acc`,`id_product`), ADD KEY `FK_WatchList_Product` (`id_product`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `bid_history`
--
ALTER TABLE `bid_history`
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `bid_price`
--
ALTER TABLE `bid_price`
MODIFY `id_acc` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `rate_history`
--
ALTER TABLE `rate_history`
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
ADD CONSTRAINT `FK_RateHis_AccAssessor` FOREIGN KEY (`id_assessor`) REFERENCES `accounts` (`id`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
