-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2018 at 12:35 PM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_election_clg`
--

-- --------------------------------------------------------

--
-- Table structure for table `stu_legal`
--

CREATE TABLE IF NOT EXISTS `stu_legal` (
  `stu_id` int(10) NOT NULL,
  `enroll_no` varchar(15) NOT NULL,
  `fn` varchar(20) NOT NULL,
  `ln` varchar(20) NOT NULL,
  `clg_id` int(10) NOT NULL,
  `dept` varchar(20) NOT NULL,
  `sem` int(5) NOT NULL,
  `country_code_id` varchar(5) NOT NULL,
  `mob_no` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stu_legal`
--

INSERT INTO `stu_legal` (`stu_id`, `enroll_no`, `fn`, `ln`, `clg_id`, `dept`, `sem`, `country_code_id`, `mob_no`, `gender`, `email`) VALUES
(1, '7010', 'Shivani', 'Patel', 6, 'Computer', 6, '1', '9876543210', 'Female', 'shivani.gkl1@gmail.com'),
(2, '7012', 'Jainee', 'Solanki', 6, 'Computer', 6, '1', '1234567890', 'Female', 'jainee@gmail.com'),
(3, '7011', 'Nirali', 'Tuvar', 6, 'IT', 4, '1', '7894567897', 'Female', 'nirali@gmail.com'),
(4, '7013', 'Purva', 'Patel', 6, 'Electrical', 6, '1', '7894567897', 'Male', 'purva@gmail.com'),
(5, '0001', 'Hemangi', 'Ravalji', 7, 'IT', 6, '1', '7894567897', 'Female', 'hemangi@gmail.com'),
(6, '0002', 'Sejal', 'Tuvar', 7, 'Electrical', 4, '1', '7894567897', 'Female', 'sejal@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stu_legal`
--
ALTER TABLE `stu_legal`
  ADD PRIMARY KEY (`stu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `stu_legal`
--
ALTER TABLE `stu_legal`
  MODIFY `stu_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
