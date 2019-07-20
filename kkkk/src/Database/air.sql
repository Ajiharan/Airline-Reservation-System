-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2019 at 07:18 PM
-- Server version: 5.6.43-log
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `air`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` bigint(20) NOT NULL,
  `cus_id` bigint(20) DEFAULT NULL,
  `flight_name` varchar(50) DEFAULT NULL,
  `start_point` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `seat_type` char(10) DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `Passport_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `cus_id`, `flight_name`, `start_point`, `destination`, `full_name`, `seat_type`, `arrival_date`, `country`, `Passport_number`) VALUES
(11, 1, 'IndiGo', 'Srilanka', 'India', 'kamal', 'Class A', '2019-05-28', 'Srilanka', 'PA1234567'),
(13, 1, 'IndiGo', 'Srilanka', 'India', 'kamal', 'Class A', '2019-05-15', 'Srilanka ', 'PA1234567'),
(14, 1, 'IndiGo', 'Srilanka', 'India', 'kamal', 'Class A', '2019-05-15', 'Srilanka', 'PA1234567'),
(15, 1, 'emirates', 'colombo', 'america', 'john', 'Class A', '2019-01-11', 'America', 'PA1234561'),
(16, 1, 'emirates', 'colombo', 'Malaysia', 'john', 'Class A', '2019-04-25', 'America', 'PA1234561'),
(18, 24, 'srilankan air', 'Srilanka', 'india', 'kamal', 'Class A', '2019-11-29', 'Srilanka', 'PA1234567');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `cid` int(11) NOT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `expirary_date` date DEFAULT NULL,
  `cvc` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`cid`, `card_no`, `expirary_date`, `cvc`, `name`) VALUES
(1, '1000200030004000', '2019-08-10', 100, 'kamal'),
(2, '5000600070008000', '2019-10-10', 200, 'siva');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `job` varchar(30) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `name`, `address`, `job`, `email_id`) VALUES
(4, 'jbhbjbj', 'colombo', 'Receiptient', 'ruban@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feed_id` bigint(20) NOT NULL,
  `cus_id` bigint(20) DEFAULT NULL,
  `comment` varchar(220) DEFAULT NULL,
  `email_id` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feed_id`, `cus_id`, `comment`, `email_id`) VALUES
(1, 1, 'ssds', 'mydemo1243@gmail.com'),
(2, 24, 'jucbubcbc', 'mydemo1243@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `fid` int(11) NOT NULL,
  `flight_id` varchar(50) NOT NULL,
  `flightname` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `start_point` varchar(50) NOT NULL,
  `arrival_time` varchar(100) NOT NULL,
  `classA_seats` int(11) NOT NULL,
  `classB_seats` int(11) NOT NULL,
  `classC_seats` int(11) NOT NULL,
  `booking_payment` double NOT NULL,
  `photo` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `passport`
--

CREATE TABLE `passport` (
  `pid` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `passport` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passport`
--

INSERT INTO `passport` (`pid`, `Name`, `passport`, `country`, `age`) VALUES
(1, 'kamal', 'PA1234567', 'Srilanka', 28),
(2, 'Nimal', 'PA1234560', 'India', 25),
(3, 'John', 'PA1234561', 'America', 30),
(4, 'Marry', 'PA1234562', 'Canada', 40);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `pay_id` bigint(20) NOT NULL,
  `book_id` bigint(20) DEFAULT NULL,
  `cus_id` bigint(20) DEFAULT NULL,
  `pay_amount` int(11) DEFAULT NULL,
  `card_no` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`pay_id`, `book_id`, `cus_id`, `pay_amount`, `card_no`) VALUES
(1, 13, 1, 10000, '5000600070008000'),
(2, 14, 1, 10000, '1000200030004000'),
(3, 15, 1, 10000, '1000200030004000'),
(4, 16, 1, 400000, '1000200030004000'),
(6, 18, 24, 20000, '1000200030004000');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `eid` bigint(20) NOT NULL,
  `photo` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--



-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `uid` bigint(20) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `email_id` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`uid`, `firstname`, `lastname`, `email_id`, `password`, `priority`) VALUES
(1, 'Baskaran', 'Ajiharan', 'haran@gmail.com', 'Thanu0000', 0),
(20, 'Krishnamoorthy', 'Thanusha', 'thanu@gmail.com', 'Thanu0000', 1),
(24, 'kamal', 'sri', 'kamal@gmail.com', 'Kamal0000', 1),
(25, 'Nimal', 'Sri', 'Nimal@gmail.com', 'Nimal0000', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_book` (`cus_id`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feed_id`),
  ADD KEY `fk_feedback` (`cus_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `passport`
--
ALTER TABLE `passport`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pay_id`),
  ADD KEY `fk_payment1` (`cus_id`),
  ADD KEY `fk_payment` (`book_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_profile` (`eid`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feed_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passport`
--
ALTER TABLE `passport`
  MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `pay_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_book` FOREIGN KEY (`cus_id`) REFERENCES `register` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `fk_feedback` FOREIGN KEY (`cus_id`) REFERENCES `register` (`uid`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_payment1` FOREIGN KEY (`cus_id`) REFERENCES `register` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `pk_profile` FOREIGN KEY (`eid`) REFERENCES `register` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
