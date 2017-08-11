-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 05, 2017 at 03:34 PM
-- Server version: 5.6.35
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `incubate`
--

-- --------------------------------------------------------

--
-- Table structure for table `vistarateam`
--

CREATE TABLE `vistarateam` (
  `id` int(11) NOT NULL,
  `team_name` varchar(128) NOT NULL,
  `user1` varchar(256) NOT NULL,
  `user2` varchar(256) NOT NULL,
  `user3` varchar(256) NOT NULL,
  `user4` varchar(256) NOT NULL,
  `user5` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vistarateam`
--

INSERT INTO `vistarateam` (`id`, `team_name`, `user1`, `user2`, `user3`, `user4`, `user5`) VALUES
(1, 'Acme', 'Arpit', 'Dishant', 'Simran', 'Aprisyta', 'Sahil'),
(2, 'Riders', 'Tinku', 'Minku', 'Rinku', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vistarateam`
--
ALTER TABLE `vistarateam`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_name` (`team_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vistarateam`
--
ALTER TABLE `vistarateam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
