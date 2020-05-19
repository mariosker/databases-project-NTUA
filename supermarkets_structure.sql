-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 19, 2020 at 06:51 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supermarkets`
--

-- --------------------------------------------------------

--
-- Table structure for table `at`
--

CREATE TABLE `at` (
  `store_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

CREATE TABLE `contains` (
  `product_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `quantity_bought` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `card_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  `street` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `relationship_status` varchar(50) DEFAULT NULL,
  `nr_kids` tinyint(3) UNSIGNED DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `phone_number` text NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `has`
--

CREATE TABLE `has` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `stored_quantity` int(11) NOT NULL,
  `aisle` int(11) NOT NULL,
  `shelve` int(11) NOT NULL,
  `current_price` int(11) NOT NULL,
  `has_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `made_by`
--

CREATE TABLE `made_by` (
  `card_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `price_log`
--

CREATE TABLE `price_log` (
  `price_log_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `store_brand` tinyint(1) NOT NULL DEFAULT 0,
  `category` varchar(30) NOT NULL,
  `product_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `store_area` int(11) NOT NULL,
  `operating_hours` text NOT NULL,
  `street` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone_number` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `total_cost` int(10) UNSIGNED NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `total_items_bought` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `at`
--
ALTER TABLE `at`
  ADD KEY `store_id` (`store_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `contains`
--
ALTER TABLE `contains`
  ADD KEY `contains_ibfk_1` (`product_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`card_id`);

--
-- Indexes for table `has`
--
ALTER TABLE `has`
  ADD PRIMARY KEY (`has_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `made_by`
--
ALTER TABLE `made_by`
  ADD KEY `card_id` (`card_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `price_log`
--
ALTER TABLE `price_log`
  ADD PRIMARY KEY (`price_log_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `has`
--
ALTER TABLE `has`
  MODIFY `has_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_log`
--
ALTER TABLE `price_log`
  MODIFY `price_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `at`
--
ALTER TABLE `at`
  ADD CONSTRAINT `at_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `at_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `has`
--
ALTER TABLE `has`
  ADD CONSTRAINT `has_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `has_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `made_by`
--
ALTER TABLE `made_by`
  ADD CONSTRAINT `made_by_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `customer` (`card_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `made_by_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `price_log`
--
ALTER TABLE `price_log`
  ADD CONSTRAINT `price_log_ibfk_1` FOREIGN KEY (`price_log_id`) REFERENCES `has` (`has_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
