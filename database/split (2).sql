-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2025 at 08:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `split`
--

-- --------------------------------------------------------

--
-- Table structure for table `archive_bills`
--

CREATE TABLE `archive_bills` (
  `bill_id` int(50) NOT NULL,
  `bill_name` varchar(100) NOT NULL,
  `involved` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive_bills`
--

INSERT INTO `archive_bills` (`bill_id`, `bill_name`, `involved`, `date`, `code`) VALUES
(10, 'Jobee', 'Andrian Andales and Ryan Cansancio', '2025-04-04', 'anBXGO'),
(11, 'Jobee', 'Andrian Andales and Ryan Cansancio', '2025-04-04', 'nLaNnS'),
(12, 'Mamutong sa ka Cyrel', 'Kent Andrade and Cyrel Agbon', '2025-04-04', 'k7D822'),
(10, 'Jobee', 'Andrian Andales and Ryan Cansancio', '2025-04-04', 'anBXGO');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bill_name` varchar(100) NOT NULL,
  `involved` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `code` varchar(50) NOT NULL,
  `bill_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_name`, `involved`, `date`, `code`, `bill_id`) VALUES
('Jobee', 'Andrian Andales and Ryan Cansancio', '2025-04-04', 'anBXGO', 10),
('Jobee', 'Andrian Andales and Ryan Cansancio', '2025-04-04', 'nLaNnS', 11),
('Mamutong sa ka Cyrel', 'Kent Andrade and Cyrel Agbon', '2025-04-04', 'k7D822', 12),
('Date with her', 'My Only love', '2025-04-04', 'kTJ44i', 13),
('Arcade', 'My Love', '2025-04-04', '1YXcQx', 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `u_id` int(50) NOT NULL,
  `u_fname` varchar(200) NOT NULL,
  `u_lname` varchar(200) NOT NULL,
  `u_nickname` varchar(200) NOT NULL,
  `u_email` varchar(200) NOT NULL,
  `u_username` varchar(200) NOT NULL,
  `u_password` varchar(200) NOT NULL,
  `u_confirm` varchar(200) NOT NULL,
  `u_type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`u_id`, `u_fname`, `u_lname`, `u_nickname`, `u_email`, `u_username`, `u_password`, `u_confirm`, `u_type`) VALUES
(1, 'awawaw', 'awawaw', 'awawawaw', 'awawawaw@gmail.com', 'ryan12', '$2y$10$185ToM7w4NEqDIxJtNSU8ugKwnfcw.upQNaVIePxwxX0RpIgeqF9W', 'Ryan12345!', 'standard'),
(2, 'awawawaw', 'awawawaw', 'shhhhh', 'ryancansancio7@gmail.com', 'ryanss', '$2y$10$K4w4y1s3wHSLiYL9n/hEQuQVBEqbPKUNeLikrQSyXEz02AWZvY/22', 'Ryan12345!', 'standard'),
(3, 'ryan', 'cansancio', 'nayr', 'ryancansancio7@gmail.com', 'ryan123456', '$2y$10$mKP1NCO8N/BydI7eIw3bbuz74lQthJp59ZYUflmfgy10s6eUbAIqe', 'Ryan12345!', 'standard'),
(4, 'cansancio', 'ryan', 'nayr', 'ryancansancio7@gmail.com', 'ryan123456', '$2y$10$8SrgXV3LZvSIwT1Nci7GdOQUOYJMW9YaAq0Yt5qDSNGTUIzNBniKu', 'Ryan12345!', 'standard'),
(5, 'cansancio', 'ryan', 'nyarrr', 'ryancansancio7@gmail.com', 'oicnasnac123', '$2y$10$FOxe/g.9d1V2/ee5wBdm8uUJTE0UQN0c0E76wz/jiPnOVbnjkrGSG', 'Ryan12345!', 'standard'),
(6, 'ryan', 'Cansancio', 'hahah', 'ridytohu@mailinator.com', 'hash', '$2y$10$SaxntCe0G478bZc7vcS99uV2Ub/MmNfHnWcyl.R.OPLDm/zxErSJO', 'Ryan12345!', 'Standard'),
(7, 'Odette', 'Davidson', 'Stacy Blackwell', 'qoxeqyje@mailinator.com', 'Wafo Ko', '$2y$10$80LqufGTr/W9XBQ5OhjaOOgbbQzB.e6P3PkV/7mNVs31hSAy6RN3q', 'Wafoko123!', 'Standard'),
(8, 'Koo', 'Wafoo', 'Wafo', 'jonwilyammayormita@gmail.com', 'Gwafo', '$2y$10$8JsYUejw66kAI.VSNnBliu39p2b3rhvQbEDUrrKhgfEhBKFxmP31.', 'Gwafoko123!', 'Standard'),
(9, 'Test', 'Po', 'Nganii', 'williammayormita69@gmail.com', 'Mic Test', '$2y$10$PQM1DZAujvggnuWkNaSuqOOWxs8MrZ6kRjgdbXWClr3Ijm.elhDqW', 'Wilyam041304!', 'Standard'),
(10, 'Imelda', 'Aguirre', 'Blaze Meadows', 'xila@mailinator.com', 'Saket', '$2y$10$i7dawKF.XZc0/kkeZHNSTeWyJMm6MYeKM98hSPmvTKdYvAuUiVX8a', 'Saket123!', 'Standard'),
(11, 'Chaney', 'Chandler', 'Sacha Kline', 'williammayormita69@gmail.com', 'Kasaket', '$2y$10$02171MkaLUGQrNNDC2vF/eJ3NT/R9p6yqxRCkSiiyN/y8zWl2dPIO', 'Saket123!', 'Standard');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `bill_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `u_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
