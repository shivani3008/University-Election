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
-- Database: `university_election`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad_city`
--

CREATE TABLE IF NOT EXISTS `ad_city` (
  `city_id` int(10) NOT NULL,
  `city_name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ad_city`
--

INSERT INTO `ad_city` (`city_id`, `city_name`) VALUES
(1, 'Ahmedabad'),
(2, 'Amreli'),
(3, 'Anand'),
(4, 'Bardoli'),
(5, 'Bharuch'),
(6, 'Bhavnagar'),
(7, 'Bhuj'),
(8, 'Botad'),
(9, 'Changa'),
(10, 'Dahod'),
(12, 'Daskroi'),
(13, 'Dhari'),
(14, 'Dholka'),
(15, 'Gandhinagar'),
(16, 'Godhra'),
(17, 'Himmatnagar'),
(18, 'Jalalpore'),
(19, 'Jamnagar'),
(20, 'Junagadh'),
(21, 'Kadi'),
(22, 'Kalol'),
(23, 'Kheda'),
(24, 'Khedbrahma'),
(25, 'Mandvi'),
(26, 'Mehsana'),
(27, 'Modasa'),
(28, 'Morbi'),
(29, 'Nadiad'),
(30, 'Navsari'),
(31, 'Olpad'),
(32, 'Palanpur'),
(33, 'Patan'),
(34, 'Petlad'),
(35, 'Prantij'),
(36, 'Rajkot'),
(37, 'Sabarkantha'),
(38, 'Sahera'),
(39, 'Surat'),
(40, 'Unjha'),
(41, 'Vadodara'),
(42, 'Valia'),
(43, 'Vallabh Vidyanagar'),
(44, 'Valsad'),
(45, 'Visnagar'),
(46, 'Wadhwan');

-- --------------------------------------------------------

--
-- Table structure for table `ad_clg`
--

CREATE TABLE IF NOT EXISTS `ad_clg` (
  `clg_id` int(10) NOT NULL,
  `city_id` int(10) NOT NULL,
  `clg_code` int(5) NOT NULL,
  `clg_name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ad_clg`
--

INSERT INTO `ad_clg` (`clg_id`, `city_id`, `clg_code`, `clg_name`) VALUES
(3, 3, 1, 'A. D. PATEL INSTITUTE OF TECHNOLOGY, KARAMSAD'),
(4, 1, 2, 'AHMEDABAD INSTITUTE OF TECHNOLOGY, GOTA, AHMEDABAD'),
(5, 36, 3, 'ATMIYA INSTITUTE OF TECHNOLOGY & SCIENCE, RAJKOT'),
(6, 43, 7, 'BIRLA VISHVAKARMA MAHAVIDYALAYA, VALLABH VIDYANAGA'),
(7, 1, 28, 'L. D. COLLEGE OF ENGINEERING, AHMEDABAD'),
(8, 41, 50, 'SIGMA INSTITUTE OF ENGINEERING, VADODARA');

-- --------------------------------------------------------

--
-- Table structure for table `ad_country_code`
--

CREATE TABLE IF NOT EXISTS `ad_country_code` (
  `country_code_id` int(10) NOT NULL,
  `country_code` varchar(5) NOT NULL,
  `country_name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ad_country_code`
--

INSERT INTO `ad_country_code` (`country_code_id`, `country_code`, `country_name`) VALUES
(1, '+91', 'India'),
(2, '+92', 'Pakistan'),
(3, '+93', 'Afghanistan'),
(4, '+94', 'Shri Lanka'),
(5, '+880', 'Bangladesh');

-- --------------------------------------------------------

--
-- Table structure for table `ad_login`
--

CREATE TABLE IF NOT EXISTS `ad_login` (
  `email` varchar(20) NOT NULL,
  `pswd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ad_login`
--

INSERT INTO `ad_login` (`email`, `pswd`) VALUES
('a@a.a', 'pswd');

-- --------------------------------------------------------

--
-- Table structure for table `ad_post`
--

CREATE TABLE IF NOT EXISTS `ad_post` (
  `post_id` int(10) NOT NULL,
  `post_name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ad_post`
--

INSERT INTO `ad_post` (`post_id`, `post_name`) VALUES
(1, 'GS'),
(2, 'AGS'),
(3, 'CS'),
(4, 'ACS');

-- --------------------------------------------------------

--
-- Table structure for table `clg_ad_registration`
--

CREATE TABLE IF NOT EXISTS `clg_ad_registration` (
  `clg_ad_id` int(10) NOT NULL,
  `clg_id` int(10) NOT NULL,
  `pswd` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clg_ad_registration`
--

INSERT INTO `clg_ad_registration` (`clg_ad_id`, `clg_id`, `pswd`) VALUES
(1, 6, 'pswd'),
(2, 7, 'pswd');

-- --------------------------------------------------------

--
-- Table structure for table `cnd_registration`
--

CREATE TABLE IF NOT EXISTS `cnd_registration` (
  `cnd_id` int(10) NOT NULL,
  `reg_id` int(10) NOT NULL,
  `unions` varchar(20) NOT NULL,
  `post_id` int(10) NOT NULL,
  `percentage` int(5) NOT NULL,
  `profile_photo` varchar(50) NOT NULL,
  `active` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cnd_registration`
--

INSERT INTO `cnd_registration` (`cnd_id`, `reg_id`, `unions`, `post_id`, `percentage`, `profile_photo`, `active`) VALUES
(1, 1, 'BJP', 2, 80, '~/Lib/images/1_180717074923.jpg', 1),
(3, 3, 'BJP', 2, 88, '~/Lib/images/3_330717100331.jpg', 1),
(4, 2, 'BJP', 3, 80, '~/Lib/images/2_490717074923.jpg', 1),
(8, 40, 'ABVP', 1, 76, '~/Lib/images/4_171317091719.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `election_schedule`
--

CREATE TABLE IF NOT EXISTS `election_schedule` (
  `es_id` int(10) NOT NULL,
  `clg_id` int(10) NOT NULL,
  `date` varchar(20) NOT NULL,
  `start_time` varchar(20) NOT NULL,
  `end_time` varchar(20) NOT NULL,
  `result` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `final_result`
--

CREATE TABLE IF NOT EXISTS `final_result` (
  `final_result_id` int(10) NOT NULL,
  `cnd_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL,
  `vote_count` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE IF NOT EXISTS `result` (
  `result_id` int(10) NOT NULL,
  `cnd_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL,
  `vote_count` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stu_registration`
--

CREATE TABLE IF NOT EXISTS `stu_registration` (
  `reg_id` int(10) NOT NULL,
  `enroll_no` varchar(20) NOT NULL,
  `fn` varchar(20) NOT NULL,
  `ln` varchar(20) NOT NULL,
  `city_id` int(10) NOT NULL,
  `clg_id` int(10) NOT NULL,
  `dept` varchar(20) NOT NULL,
  `sem` int(5) NOT NULL,
  `country_code_id` int(10) NOT NULL,
  `mob_no` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pswd` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stu_registration`
--

INSERT INTO `stu_registration` (`reg_id`, `enroll_no`, `fn`, `ln`, `city_id`, `clg_id`, `dept`, `sem`, `country_code_id`, `mob_no`, `gender`, `email`, `pswd`) VALUES
(1, '7010', 'Shivani', 'Patel', 43, 6, 'Computer', 6, 1, '9876543210', 'Female', 'shivani.gkl1@gmail.com', 'pswd'),
(2, '7012', 'Jainee', 'Solanki', 43, 6, 'Computer', 6, 1, '1234567890', 'Female', 'jainee@gmail.com', 'pswd'),
(3, '7011', 'Nirali', 'Tuvar', 43, 6, 'IT', 4, 1, '7894567897', 'Female', 'nirali@gmail.com', 'pswd'),
(4, '7013', 'Purva', 'Patel', 43, 6, 'Electrical', 6, 1, '1234567890', 'Male', 'purva@gmail.com', 'pswd'),
(5, '0001', 'Hemangi', 'Ravalji', 43, 7, 'IT', 6, 1, '1234567890', 'Female', 'hemangi@gmail.com', 'pswd');

-- --------------------------------------------------------

--
-- Table structure for table `voting`
--

CREATE TABLE IF NOT EXISTS `voting` (
  `vote_id` int(10) NOT NULL,
  `reg_id` int(10) NOT NULL,
  `cnd_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voting`
--

INSERT INTO `voting` (`vote_id`, `reg_id`, `cnd_id`, `post_id`) VALUES
(9, 1, 4, 3),
(10, 2, 1, 2),
(14, 3, 3, 2),
(15, 1, 1, 2),
(16, 4, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad_city`
--
ALTER TABLE `ad_city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `ad_clg`
--
ALTER TABLE `ad_clg`
  ADD PRIMARY KEY (`clg_id`);

--
-- Indexes for table `ad_country_code`
--
ALTER TABLE `ad_country_code`
  ADD PRIMARY KEY (`country_code_id`);

--
-- Indexes for table `ad_post`
--
ALTER TABLE `ad_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `clg_ad_registration`
--
ALTER TABLE `clg_ad_registration`
  ADD PRIMARY KEY (`clg_ad_id`);

--
-- Indexes for table `cnd_registration`
--
ALTER TABLE `cnd_registration`
  ADD PRIMARY KEY (`cnd_id`);

--
-- Indexes for table `election_schedule`
--
ALTER TABLE `election_schedule`
  ADD PRIMARY KEY (`es_id`);

--
-- Indexes for table `final_result`
--
ALTER TABLE `final_result`
  ADD PRIMARY KEY (`final_result_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`result_id`);

--
-- Indexes for table `stu_registration`
--
ALTER TABLE `stu_registration`
  ADD PRIMARY KEY (`reg_id`);

--
-- Indexes for table `voting`
--
ALTER TABLE `voting`
  ADD PRIMARY KEY (`vote_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ad_city`
--
ALTER TABLE `ad_city`
  MODIFY `city_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `ad_clg`
--
ALTER TABLE `ad_clg`
  MODIFY `clg_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ad_country_code`
--
ALTER TABLE `ad_country_code`
  MODIFY `country_code_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ad_post`
--
ALTER TABLE `ad_post`
  MODIFY `post_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `clg_ad_registration`
--
ALTER TABLE `clg_ad_registration`
  MODIFY `clg_ad_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cnd_registration`
--
ALTER TABLE `cnd_registration`
  MODIFY `cnd_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `election_schedule`
--
ALTER TABLE `election_schedule`
  MODIFY `es_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `final_result`
--
ALTER TABLE `final_result`
  MODIFY `final_result_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `result_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `stu_registration`
--
ALTER TABLE `stu_registration`
  MODIFY `reg_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `voting`
--
ALTER TABLE `voting`
  MODIFY `vote_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
