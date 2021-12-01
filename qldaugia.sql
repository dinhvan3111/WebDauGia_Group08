-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2021 at 04:19 PM
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
  `username` varchar(50) CHARACTER SET ascii NOT NULL,
  `pwd` varchar(500) CHARACTER SET ascii NOT NULL,
  `id_permission` int(10) unsigned NOT NULL DEFAULT '3',
  `name` varchar(100) NOT NULL,
  `email` varchar(100) CHARACTER SET ascii NOT NULL,
  `dob` date NOT NULL,
  `addr` varchar(100) NOT NULL,
  `is_locked` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;














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
 ADD PRIMARY KEY (`id`), ADD KEY `FK_cate_parentCate` (`parent_id`);

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
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bid_history`
--






ALTER TABLE `bid_history`
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--







ALTER TABLE `categories`
MODIFY `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT;
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
-- Constraints for table `watch_list`
--
ALTER TABLE `watch_list`
ADD CONSTRAINT `FK_WatchList_Acc` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`),
ADD CONSTRAINT `FK_WatchList_Product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);






/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
