-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 11, 2017 at 09:09 AM
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
CREATE DATABASE IF NOT EXISTS `incubate` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `incubate`;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_date` date NOT NULL,
  `end_time` time NOT NULL,
  `type` varchar(50) NOT NULL,
  `venue` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table wil store all the information for the event';

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `description`, `start_date`, `start_time`, `end_date`, `end_time`, `type`, `venue`, `timestamp`) VALUES
(1, 'vistara', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '', '2017-08-05 21:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) UNSIGNED NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `contact_number` varchar(10) DEFAULT NULL,
  `facebook_id` varchar(50) DEFAULT NULL,
  `linkedin_id` varchar(50) DEFAULT NULL,
  `gihtub_id` varchar(50) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `contact_verified` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table will store the user data';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `contact_number`, `facebook_id`, `linkedin_id`, `gihtub_id`, `state`, `city`, `country`, `email_verified`, `contact_verified`, `timestamp_created`) VALUES
(1, 'Arpit', 'Nandwani', 'arpit.nandwani@gmail.com', 'f18f057ea44a945a083a00e6fcc11637d186042d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2017-08-05 12:30:21'),
(2, 'Dishant', 'Khanna', 'dk@gmail.com', 'f18f057ea44a945a083a00e6fcc11637d186042d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2017-08-05 12:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `vistaraques`
--

CREATE TABLE `vistaraques` (
  `id` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `ques1` text NOT NULL,
  `ques2` text NOT NULL,
  `ques3` text NOT NULL,
  `ques4` text NOT NULL,
  `ques5` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vistaraques`
--
ALTER TABLE `vistaraques`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tid` (`tid`);

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vistaraques`
--
ALTER TABLE `vistaraques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vistarateam`
--
ALTER TABLE `vistarateam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
