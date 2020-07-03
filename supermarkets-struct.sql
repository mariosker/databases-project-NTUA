-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 03, 2020 at 05:17 PM
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
-- Table structure for table `contains`
--

CREATE TABLE `contains` (
  `product_id` int NOT NULL,
  `transaction_id` int NOT NULL,
  `quantity_bought` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `card_id` int NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  `street` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `relationship_status` varchar(50) DEFAULT NULL,
  `nr_kids` tinyint UNSIGNED DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `phone_number` text NOT NULL,
  `points` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `age` BEFORE INSERT ON `customer` FOR EACH ROW IF (YEAR(NEW.birth_date) > (YEAR(CURRENT_DATE)  - 18))
THEN
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Age < 18!';
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `has`
--

CREATE TABLE `has` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `stored_quantity` int NOT NULL,
  `aisle` int NOT NULL,
  `shelf` int NOT NULL,
  `has_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_prices`
-- (See below for the actual view)
--
CREATE TABLE `latest_prices` (
`has_id` int
,`price` int
,`date` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `most_frequent_products_by_id`
-- (See below for the actual view)
--
CREATE TABLE `most_frequent_products_by_id` (
`card_id` int
,`transaction_id` int
,`product_id` int
,`product_name` varchar(100)
,`category` varchar(30)
,`store_brand` tinyint(1)
,`cnt` bigint
);

-- --------------------------------------------------------

--
-- Table structure for table `price_log`
--

CREATE TABLE `price_log` (
  `price_log_id` int NOT NULL,
  `date` datetime NOT NULL,
  `value` int NOT NULL,
  `has_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `store_brand` tinyint(1) NOT NULL DEFAULT '0',
  `category` varchar(30) NOT NULL,
  `product_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `store_id` int NOT NULL,
  `card_id` int NOT NULL,
  `transaction_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` int NOT NULL,
  `store_area` int NOT NULL,
  `operating_hours` text NOT NULL,
  `street` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `payment_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `transactions`
-- (See below for the actual view)
--
CREATE TABLE `transactions` (
`transaction_id` int
,`card_id` int
,`NAME` varchar(92)
,`store_id` int
,`store_name` varchar(124)
,`date_time` datetime
,`total` decimal(42,0)
,`payment_type` varchar(10)
,`points` decimal(45,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `transactions_with_customers`
-- (See below for the actual view)
--
CREATE TABLE `transactions_with_customers` (
`store_id` int
,`transaction_id` int
,`date_time` datetime
,`payment_type` varchar(10)
,`card_id` int
,`store_area` int
,`operating_hours` text
,`street` varchar(50)
,`number` varchar(10)
,`zip` varchar(10)
,`city` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `transaction_total_cost`
-- (See below for the actual view)
--
CREATE TABLE `transaction_total_cost` (
`transaction_id` int
,`total` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Structure for view `latest_prices`
--
DROP TABLE IF EXISTS `latest_prices`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_prices`  AS  select `n`.`has_id` AS `has_id`,`n`.`value` AS `price`,`n`.`date` AS `date` from ((select `price_log`.`has_id` AS `has_id`,max(`price_log`.`date`) AS `maxdate` from `price_log` group by `price_log`.`has_id`) `x` join `price_log` `n` on(((`n`.`has_id` = `x`.`has_id`) and (`n`.`date` = `x`.`maxdate`)))) ;

-- --------------------------------------------------------

--
-- Structure for view `most_frequent_products_by_id`
--
DROP TABLE IF EXISTS `most_frequent_products_by_id`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `most_frequent_products_by_id`  AS  select `p`.`card_id` AS `card_id`,`p`.`transaction_id` AS `transaction_id`,`c`.`product_id` AS `product_id`,`prod`.`product_name` AS `product_name`,`prod`.`category` AS `category`,`prod`.`store_brand` AS `store_brand`,count(`c`.`product_id`) AS `cnt` from ((`purchase` `p` join `contains` `c` on((`p`.`transaction_id` = `c`.`transaction_id`))) join `products` `prod` on((`prod`.`product_id` = `c`.`product_id`))) group by `p`.`card_id`,`c`.`product_id` order by `p`.`card_id` desc ;

-- --------------------------------------------------------

--
-- Structure for view `transactions`
--
DROP TABLE IF EXISTS `transactions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transactions`  AS  select `transactions_with_customers`.`transaction_id` AS `transaction_id`,`c`.`card_id` AS `card_id`,concat(`c`.`first_name`,' ',coalesce(`c`.`middle_name`,''),' ',`c`.`last_name`) AS `NAME`,`transactions_with_customers`.`store_id` AS `store_id`,concat(`transactions_with_customers`.`street`,' ',`transactions_with_customers`.`number`,', ',`transactions_with_customers`.`zip`,' ',`transactions_with_customers`.`city`) AS `store_name`,`transactions_with_customers`.`date_time` AS `date_time`,`transaction_total_cost`.`total` AS `total`,`transactions_with_customers`.`payment_type` AS `payment_type`,(0.10 * `transaction_total_cost`.`total`) AS `points` from ((`transactions_with_customers` join `transaction_total_cost` on((`transactions_with_customers`.`transaction_id` = `transaction_total_cost`.`transaction_id`))) join (select `customer`.`first_name` AS `first_name`,`customer`.`middle_name` AS `middle_name`,`customer`.`last_name` AS `last_name`,`customer`.`card_id` AS `card_id` from `customer`) `c` on((`transactions_with_customers`.`card_id` = `c`.`card_id`))) order by `transactions_with_customers`.`date_time` desc ;

-- --------------------------------------------------------

--
-- Structure for view `transactions_with_customers`
--
DROP TABLE IF EXISTS `transactions_with_customers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transactions_with_customers`  AS  select `purchase`.`store_id` AS `store_id`,`transaction`.`transaction_id` AS `transaction_id`,`transaction`.`date_time` AS `date_time`,`transaction`.`payment_type` AS `payment_type`,`purchase`.`card_id` AS `card_id`,`store`.`store_area` AS `store_area`,`store`.`operating_hours` AS `operating_hours`,`store`.`street` AS `street`,`store`.`number` AS `number`,`store`.`zip` AS `zip`,`store`.`city` AS `city` from ((`transaction` join `purchase` on((`transaction`.`transaction_id` = `purchase`.`transaction_id`))) join `store` on((`purchase`.`store_id` = `store`.`store_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `transaction_total_cost`
--
DROP TABLE IF EXISTS `transaction_total_cost`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transaction_total_cost`  AS  select `t`.`transaction_id` AS `transaction_id`,sum((`t`.`quantity_bought` * `latest_prices`.`price`)) AS `total` from ((select `purchase`.`transaction_id` AS `transaction_id`,`purchase`.`store_id` AS `store_id`,`purchase`.`card_id` AS `card_id`,`contains`.`product_id` AS `product_id`,`contains`.`quantity_bought` AS `quantity_bought` from (`purchase` join `contains` on((`purchase`.`transaction_id` = `contains`.`transaction_id`)))) `t` join `latest_prices`) where (`latest_prices`.`has_id` = (select `has`.`has_id` from `has` where ((`has`.`product_id` = `t`.`product_id`) and (`has`.`store_id` = `t`.`store_id`)))) group by `t`.`transaction_id` ;

--
-- Indexes for dumped tables
--

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
  ADD KEY `store_id` (`store_id`),
  ADD KEY `product_fk_idx` (`product_id`),
  ADD KEY `store_fk_idx` (`store_id`);

--
-- Indexes for table `price_log`
--
ALTER TABLE `price_log`
  ADD PRIMARY KEY (`price_log_id`),
  ADD KEY `price_log_ibfk_1` (`has_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `prod_cat` (`category`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD KEY `fk3` (`transaction_id`),
  ADD KEY `fk1` (`card_id`),
  ADD KEY `fk2` (`store_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `transaction_indx` (`transaction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `card_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `has`
--
ALTER TABLE `has`
  MODIFY `has_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_log`
--
ALTER TABLE `price_log`
  MODIFY `price_log_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `has`
--
ALTER TABLE `has`
  ADD CONSTRAINT `has_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `has_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `price_log`
--
ALTER TABLE `price_log`
  ADD CONSTRAINT `price_log_ibfk_1` FOREIGN KEY (`has_id`) REFERENCES `has` (`has_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`card_id`) REFERENCES `customer` (`card_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk2` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk3` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
