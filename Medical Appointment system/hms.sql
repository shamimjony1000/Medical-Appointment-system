-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2022 at 07:45 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_req`
--

CREATE TABLE `booking_req` (
  `rid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `slot` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_req`
--

INSERT INTO `booking_req` (`rid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(8, 'Fatima@gmail.com', 'Fatima', 'Female', 'morning', 'Fever', '10:20:00', '2022-11-29', 'Dermatologists', '01944930530'),
(9, 'Saty@gmail.com', 'Renesa', 'Female', 'evening', 'Cool', '19:10:00', '2022-11-29', 'Endocrinologists', '01720406090'),
(10, 'Kawser@gmail.com', 'Kawser', 'Male', 'night', 'Cancer', '22:50:00', '2022-11-30', 'Anesthesiologists', '01816357113');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `did` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`did`, `email`, `doctorname`, `dept`) VALUES
(1, 'anees@gmail.com', 'anees', 'Cardiologists'),
(2, 'amrutha@gmail.com', 'amrutha bhatta', 'Dermatologists'),
(3, 'aadithyaa@gmail.com', 'aadithyaa', 'Anesthesiologists'),
(4, 'anees@gmail', 'anees', 'Endocrinologists'),
(5, 'aneeqah@gmail.com', 'aneekha', 'corona');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `slot` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(18, 'jonyshamim1000@gmail.com', 'Shahin', 'Male', 'morning', 'fever', '10:00:00', '2022-11-25', 'Cardiologists', '01794302620'),
(19, 'jonyshamim1000@gmail.com', 'Priya', 'Female', 'night', 'fever', '20:00:00', '2022-11-26', 'Endocrinologists', '01816357113'),
(20, 'jonyshamim1000@gmail.com', 'Md Jony ', 'Male', 'morning', 'fever', '10:40:00', '2022-11-28', 'Endocrinologists', '01816357113'),
(21, 'jonyshamim1000@gmail.com', 'Shakib', 'Male', 'night', 'Fever', '22:30:00', '2022-11-21', 'Cardiologists', '01816357113'),
(22, 'jonyshamim1000@gmail.com', 'Sajid', 'Male', 'morning', 'fever', '10:30:00', '2022-11-30', 'Endocrinologists', '01816357113'),
(23, 'jony@gmail.com', 'Sham', 'Male', 'evening', 'Cool', '21:30:00', '2022-11-29', 'Cardiologists', '01816435862');

--
-- Triggers `patients`
--
DELIMITER $$
CREATE TRIGGER `PatientDelete` BEFORE DELETE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,OLD.pid,OLD.email,OLD.name,'PATIENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PatientUpdate` AFTER UPDATE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT UPDATED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `patientinsertion` AFTER INSERT ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT INSERTED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `email`) VALUES
(1, 'ANEES', 'ARK@GMAIL.COM'),
(2, 'test', 'test@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `trigr`
--

CREATE TABLE `trigr` (
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trigr`
--

INSERT INTO `trigr` (`tid`, `pid`, `email`, `name`, `action`, `timestamp`) VALUES
(20, 18, 'jonyshamim1000@gmail.com', 'Shahin', 'PATIENT INSERTED', '2022-11-23 13:05:12'),
(21, 8, 'patient@gmail.com', 'anees', 'PATIENT DELETED', '2022-11-23 13:32:12'),
(22, 19, 'jonyshamim1000@gmail.com', 'Priya', 'PATIENT INSERTED', '2022-11-23 15:14:37'),
(23, 20, 'jonyshamim1000@gmail.com', 'Md Jony ', 'PATIENT INSERTED', '2022-11-23 15:18:29'),
(24, 21, 'jonyshamim1000@gmail.com', 'Shakib', 'PATIENT INSERTED', '2022-11-23 15:23:54'),
(25, 22, 'jonyshamim1000@gmail.com', 'Sajid', 'PATIENT INSERTED', '2022-11-23 15:38:02'),
(26, 2, 'anees1@gmail.com', 'anees1 rehman khan', 'PATIENT DELETED', '2022-11-28 11:27:56'),
(27, 5, 'patient@gmail.com', 'patien', 'PATIENT DELETED', '2022-11-28 11:28:07'),
(28, 7, 'patient@gmail.com', 'anees', 'PATIENT DELETED', '2022-11-28 11:28:12'),
(29, 9, 'aneesurrehman423@gmail.com', 'anees', 'PATIENT DELETED', '2022-11-28 11:28:18'),
(30, 10, 'anees@gmail.com', 'anees', 'PATIENT DELETED', '2022-11-28 11:28:26'),
(31, 15, 'khushi@gmail.com', 'khushi', 'PATIENT DELETED', '2022-11-28 11:28:29'),
(32, 16, 'khushi@gmail.com', 'khushi', 'PATIENT DELETED', '2022-11-28 11:28:37'),
(33, 17, 'aneeqah@gmail.com', 'aneeqah', 'PATIENT DELETED', '2022-11-28 11:28:41'),
(34, 23, 'jony@gmail.com', 'Sham', 'PATIENT INSERTED', '2022-11-28 12:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `usertype`, `email`, `password`) VALUES
(16, 'jonyshamim1000@gmail.com', 'Patient', 'jonyshamim1000@gmail.com', 'pbkdf2:sha256:150000$lcjsfApA$c2080337bce32f7e5d76f8d54cb06d20424a1108b7ffeced674fcb496b7c4e24'),
(17, 'shahinDoc', 'Doctor', 'shahind@gmail.com', 'pbkdf2:sha256:150000$Y5Gju15w$73e6a62e123d6d26cf03f1963522cccfc249d8f7a39626f4d452c5325fd17770'),
(18, 'admin', 'Doctor', 'admin@gmail.com', 'pbkdf2:sha256:150000$XJbHWJ2l$a9dce2331508596ad13782dbc1664273e6ada55e69ca889e37257df2e219c632'),
(19, 'jony', 'Patient', 'jony@gmail.com', 'pbkdf2:sha256:150000$ZuSk36ZM$51ae7989532a8f64a2250a682a3f53178f035568789ea28a54925cbd53db5203');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_req`
--
ALTER TABLE `booking_req`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trigr`
--
ALTER TABLE `trigr`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_req`
--
ALTER TABLE `booking_req`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trigr`
--
ALTER TABLE `trigr`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
