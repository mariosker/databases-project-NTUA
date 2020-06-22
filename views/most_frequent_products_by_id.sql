-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: localhost
-- Χρόνος δημιουργίας: 22 Ιουν 2020 στις 13:03:58
-- Έκδοση διακομιστή: 8.0.20
-- Έκδοση PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `supermarkets`
--

-- --------------------------------------------------------

--
-- Δομή για προβολή `most_frequent_products_by_id`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `most_frequent_products_by_id`  AS  select `p`.`card_id` AS `card_id`,`p`.`transaction_id` AS `transaction_id`,`c`.`product_id` AS `product_id`,`prod`.`product_name` AS `product_name`,`prod`.`category` AS `category`,`prod`.`store_brand` AS `store_brand`,count(`c`.`product_id`) AS `cnt` from ((`purchase` `p` join `contains` `c` on((`p`.`transaction_id` = `c`.`transaction_id`))) join `products` `prod` on((`prod`.`product_id` = `c`.`product_id`))) group by `p`.`card_id`,`c`.`product_id` order by `p`.`card_id` desc ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
