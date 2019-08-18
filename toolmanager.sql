-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2019 at 05:35 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toolmanager`
--

-- --------------------------------------------------------

--
-- Table structure for table `toolgroups`
--

CREATE TABLE `toolgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `tool_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toolgroups`
--

INSERT INTO `toolgroups` (`id`, `name`, `description`, `tool_id`) VALUES
(1, 'Tool Group 1', 'Tool Group 1 Information', '1,2,30'),
(2, 'Tool Group 2', 'Tool Group 2 Information', '4,5,6'),
(3, 'Tool Group 3', 'Tool Group 3 Information', '7,8,9'),
(4, 'Tool Group 4', 'Tool Group 4 Information', '10,11,12');

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `purchaseDate` timestamp NULL DEFAULT NULL,
  `costPrice` bigint(20) DEFAULT NULL,
  `toolGroup` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`id`, `name`, `purchaseDate`, `costPrice`, `toolGroup`) VALUES
(1, 'Tool 1', NULL, NULL, 1),
(2, 'Tool 2', NULL, NULL, 1),
(3, 'Tool 3', NULL, NULL, 1),
(4, 'Tool 4', NULL, NULL, 2),
(5, 'Tool 5', NULL, NULL, 2),
(6, 'Tool 6', NULL, NULL, 2),
(7, 'Tool 7', NULL, NULL, 3),
(8, 'Tool 8', NULL, NULL, 3),
(9, 'Tool 9', NULL, NULL, 3),
(10, 'Tool 10', NULL, NULL, 4),
(11, 'Tool 11', NULL, NULL, 4),
(12, 'Tool 12', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `toolGroups` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `toolGroups`) VALUES
(1, 'dishu', 'dishu123', '1,2,3'),
(2, 'sahib', 'sahib123', '4,2,30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `toolgroups`
--
ALTER TABLE `toolgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `toolgroups`
--
ALTER TABLE `toolgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
