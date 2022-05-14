-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2022 at 08:32 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electrogriddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payID` int(11) NOT NULL,
  `fullName` varchar(30) NOT NULL,
  `NIC` varchar(10) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `date` varchar(30) NOT NULL,
  `bankName` varchar(30) NOT NULL,
  `debitCard` varchar(19) NOT NULL,
  `otpNumber` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payID`, `fullName`, `NIC`, `amount`, `date`, `bankName`, `debitCard`, `otpNumber`) VALUES
(1, 'Gihan', '893453453V', '2000.00', '2022-02-03', 'NDB ', '1111-5435-2311-5433', '1005'),
(2, 'karesh', '990212123V', '15000.00', '26-09-2022', 'BOC', '3333-4444-0000-6666', '9898'),
(3, 'marky', '971234522V', '9999.00', '30-10-2021', 'HSBC', '1234-2345-0000-4567', '4567'),
(4, 'sam', '871231234x', '2000.00', '12-10-2022', 'HSBC', '1234-0000-1234-0000', '9999');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
