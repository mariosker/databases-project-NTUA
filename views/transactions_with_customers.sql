-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 24, 2020 at 10:26 AM
-- Server version: 8.0.20
-- PHP Version: 7.4.6

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
-- Structure for view `transactions_with_customers`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transactions_with_customers`  AS  select `purchase`.`store_id` AS `store_id`,`transaction`.`transaction_id` AS `transaction_id`,`transaction`.`date_time` AS `date_time`,`transaction`.`payment_type` AS `payment_type`,`purchase`.`card_id` AS `card_id`,`store`.`store_area` AS `store_area`,`store`.`operating_hours` AS `operating_hours`,`store`.`street` AS `street`,`store`.`number` AS `number`,`store`.`zip` AS `zip`,`store`.`city` AS `city` from ((`transaction` join `purchase` on((`transaction`.`transaction_id` = `purchase`.`transaction_id`))) join `store` on((`purchase`.`store_id` = `store`.`store_id`))) ;

--
-- VIEW `transactions_with_customers`
-- Data: None
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
