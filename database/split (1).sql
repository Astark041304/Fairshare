-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2025 at 08:13 PM
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
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bill_name` varchar(100) NOT NULL,
  `paid_by` varchar(100) NOT NULL,
  `involved` varchar(100) NOT NULL,
  `amount` int(50) NOT NULL,
  `date` date NOT NULL,
  `code` varchar(50) NOT NULL,
  `bill_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_name`, `paid_by`, `involved`, `amount`, `date`, `code`, `bill_id`) VALUES
('Bayad sa Wifi', 'Ryan', 'person1', 500, '2007-09-17', '3Xrbsx', 1),
('Jobee', 'Cyrel', 'person1', 1000, '2025-03-29', 'FQx2sk', 2),
('Pani udto', 'Yunjin', '7', 200, '2025-03-29', 'UV2fps', 3),
('Date with her', 'Jennifer', '7', 200, '1971-11-10', 'eCww5d', 4),
('Arcade', 'Andrian Gwapo', '2', 300, '2025-03-29', 'Wcl7cf', 5),
('Cinema', 'Random', '2', 1000, '2025-03-29', 'Qz2p9n', 6),
('School Project', 'William', 'ryanss', 200, '2025-03-29', 'MiCTTE', 7);

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
(7, 'Odette', 'Davidson', 'Stacy Blackwell', 'qoxeqyje@mailinator.com', 'Wafo Ko', '$2y$10$80LqufGTr/W9XBQ5OhjaOOgbbQzB.e6P3PkV/7mNVs31hSAy6RN3q', 'Wafoko123!', 'Standard');

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
  MODIFY `bill_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `u_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
