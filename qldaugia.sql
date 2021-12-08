-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2021 at 01:35 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `pwd`, `id_permission`, `name`, `email`, `dob`, `addr`, `is_locked`) VALUES
(0000000015, '110452804810387facebook', NULL, 3, 'Elizabeth Algecgkdeheg Chengsen', 'ixnxqhmhoj_1638799299@tfbnw.net', NULL, NULL, 0),
(0000000019, 'a', NULL, 3, 'aaaaa', 'a@gmail.com', NULL, NULL, 0),
(0000000020, '108130178380491facebook', NULL, 3, 'Open Graph Test User', 'open_hjrryuc_user@tfbnw.net', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bid_history`
--

CREATE TABLE IF NOT EXISTS `bid_history` (
`id` int(10) unsigned zerofill NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_acc` int(10) unsigned zerofill NOT NULL,
  `id_product` int(10) unsigned zerofill NOT NULL,
  `in_bid_price` decimal(10,0) unsigned NOT NULL,
  `max_bid_price` decimal(10,0) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `time_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time_end` datetime NOT NULL,
  `description` mediumtext NOT NULL,
  `auto_renew` int(11) NOT NULL DEFAULT '0',
  `id_category` int(10) unsigned zerofill NOT NULL,
  `id_win_bidder` int(10) unsigned zerofill DEFAULT NULL,
  `id_seller` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('8Fk5YyqShKRUjy6kZF6BRK793qJF9Odz', 1639053299, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"}}'),
('8oejZHqn0tEAbD33TGxzT0MpwuTJU37e', 1638980444, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"}}'),
('JKSn6_I6f_F0_iuvsY93EWtgivN81TPa', 1639046874, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{},"idAcc":29}'),
('Rv8qKTrTpSnUQaN-TtTG7v6QCy7B2Cz2', 1639035852, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"flash":{"error":["Email trung"],"info":["Email này đã được đăng ký với 1 tài khoản khác đã có trong hệ thống","Email này đã được đăng ký với 1 tài khoản khác đã có trong hệ thống","Email này đã được đăng ký với 1 tài khoản khác đã có trong hệ thống","Email này đã được đăng ký với 1 tài khoản khác đã có trong hệ thống","Email này đã được đăng ký với 1 tài khoản khác đã có trong hệ thống"]},"isLogging":true,"passport":{"user":{"id":20,"email":"open_hjrryuc_user@tfbnw.net","name":"Open Graph Test User","idThirdPartyAcc":"108130178380491","provider":"facebook","username":"108130178380491facebook"}}}');

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
(0000000020, '108130178380491', 'facebook');

-- --------------------------------------------------------

--
-- Table structure for table `watch_list`
--

CREATE TABLE IF NOT EXISTS `watch_list` (
  `id_acc` int(10) unsigned zerofill NOT NULL,
  `id_product` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
 ADD PRIMARY KEY (`id`), ADD KEY `FK_products_cate` (`id_category`), ADD KEY `FK_products_accBidder` (`id_win_bidder`), ADD KEY `FK_products_accSeller` (`id_seller`);

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
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `bid_history`
--
ALTER TABLE `bid_history`
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rate_history`
--
ALTER TABLE `rate_history`
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT;
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
