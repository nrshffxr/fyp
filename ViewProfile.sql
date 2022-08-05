-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 02, 2022 at 09:04 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ViewProfile2`
--
DROP DATABASE ViewProfile2;
CREATE DATABASE ViewProfile2;
-- --------------------------------------------------------

--
-- Table structure for table `Administrators`
--

CREATE TABLE `Administrators` (
  `AdministratorID` int(8) NOT NULL,
  `AdministratorNRIC` varchar(9) NOT NULL,
  `AdministratorName` varchar(50) NOT NULL,
  `AdministratorPassword` varchar(50) NOT NULL,
  `AdministratorEmail` varchar(50) NOT NULL,
  `IsItLocked` char(1) NOT NULL,
  `SecondFactor` varchar(50) DEFAULT NULL,
  `AdministratorDateOfBirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Administrators`
--

INSERT INTO `Administrators` (`AdministratorID`, `AdministratorNRIC`, `AdministratorName`, `AdministratorPassword`, `AdministratorEmail`, `IsItLocked`, `SecondFactor`, `AdministratorDateOfBirth`) VALUES
(20000000, 'S9000000D', 'Administrator1', '*FBA7C2D27C9D05F3FD4C469A1BBAF557114E5594', 'a@a.com', 'N', '*0CA086D1437D5196E79C640AB579FD2C49D4BB61', '2012-01-01'),
(20000001, 'S9000001D', 'Charlie', '*FBA7C2D27C9D05F3FD4C469A1BBAF557114E5594', 'qwerty@a.com', 'Y', NULL, '1999-12-31'),
(20000002, 'S9000002D', 'Charlie Tan', '*FBA7C2D27C9D05F3FD4C469A1BBAF557114E5594', 'abc@a.com', 'Y', NULL, '1999-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `Feedbacks`
--

CREATE TABLE `Feedbacks` (
  `Feedback` varchar(256) NOT NULL,
  `Timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Feedbacks`
--

INSERT INTO `Feedbacks` (`Feedback`, `Timestamp`) VALUES
('Hello world', '2022-08-01 12:46:56');

-- --------------------------------------------------------

--
-- Table structure for table `Students`
--

CREATE TABLE `Students` (
  `StudentID` int(8) NOT NULL,
  `StudentNRIC` varchar(9) NOT NULL,
  `StudentName` varchar(50) NOT NULL,
  `StudentPassword` varchar(50) NOT NULL,
  `StudentEmail` varchar(50) NOT NULL,
  `IsItLocked` char(1) NOT NULL,
  `StudentDateOfBirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Students`
--

INSERT INTO `Students` (`StudentID`, `StudentNRIC`, `StudentName`, `StudentPassword`, `StudentEmail`, `IsItLocked`, `StudentDateOfBirth`) VALUES
(19000001, 's90000001', 'Ali', '*2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19', 'abc@example.com', 'Y', '2000-01-01'),
(19000002, 'S9000001D', 'Ben', '*2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19', 'b@a.com', 'N', '2020-01-01'),
(19039601, 'S9000000D', 'Student1', '*2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19', 'a@a.com', 'N', '2022-04-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Administrators`
--
ALTER TABLE `Administrators`
  ADD PRIMARY KEY (`AdministratorID`,`AdministratorNRIC`);

--
-- Indexes for table `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`StudentID`,`StudentNRIC`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
