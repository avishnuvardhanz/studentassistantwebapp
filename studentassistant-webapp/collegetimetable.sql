-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2021 at 03:36 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `collegetimetable`
--

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `gradeid` int(11) NOT NULL,
  `gradename` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`gradeid`, `gradename`) VALUES
(1, 'MCA(SS)-Istyear'),
(2, 'MCA(R)-Istyear'),
(3, 'MCA(SS)-IIndyear'),
(4, 'MCA(R)-IIndyear');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `sectionid` int(11) NOT NULL,
  `sectionsname` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`sectionid`, `sectionsname`) VALUES
(1, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subjectid` int(11) NOT NULL,
  `subjectname` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subjectid`, `subjectname`) VALUES
(1, 'JAVA'),
(2, 'C'),
(3, 'COD'),
(4, 'MATHS'),
(5, 'IoT'),
(6, 'GAMEP'),
(7, 'XML'),
(8, 'PYTHON'),
(9, 'DS'),
(10, 'ALGO'),
(11, 'CRYPTO'),
(12, 'VISUAL');

-- --------------------------------------------------------

--
-- Table structure for table `subject_grade`
--

CREATE TABLE `subject_grade` (
  `subject_gradeid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL,
  `NoOfClasses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject_grade`
--

INSERT INTO `subject_grade` (`subject_gradeid`, `subjectid`, `gradeid`, `NoOfClasses`) VALUES
(1, 3, 1, 8),
(2, 4, 1, 3),
(3, 12, 1, 8),
(4, 5, 1, 3),
(5, 7, 1, 2),
(6, 8, 1, 2),
(7, 9, 1, 3),
(8, 10, 1, 3),
(9, 11, 1, 3),
(10, 3, 2, 8),
(11, 12, 2, 8),
(12, 4, 2, 3),
(13, 5, 2, 3),
(14, 7, 2, 2),
(15, 8, 2, 2),
(16, 9, 2, 3),
(17, 10, 2, 3),
(18, 11, 2, 3),
(28, 3, 3, 8),
(29, 12, 3, 8),
(30, 4, 3, 4),
(31, 5, 3, 4),
(32, 7, 3, 4),
(33, 8, 3, 3),
(34, 9, 3, 1),
(35, 10, 3, 2),
(36, 11, 3, 1),
(37, 3, 4, 8),
(38, 12, 4, 8),
(39, 4, 4, 4),
(40, 5, 4, 4),
(41, 7, 4, 4),
(42, 8, 4, 3),
(43, 9, 4, 1),
(44, 10, 4, 2),
(45, 11, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacherinfo`
--

CREATE TABLE `teacherinfo` (
  `teacherid` int(11) NOT NULL,
  `FullName` varchar(250) NOT NULL,
  `Age` int(11) NOT NULL,
  `Nationality` varchar(250) NOT NULL,
  `ContactNo` bigint(20) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `PassportNo` varchar(250) NOT NULL,
  `PassportExpiryDate` date NOT NULL,
  `VisaType` varchar(250) NOT NULL,
  `SchoolAccommodation` varchar(250) NOT NULL,
  `Tutor` varchar(250) NOT NULL,
  `Grade` varchar(250) NOT NULL,
  `RecordedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacherinfo`
--

INSERT INTO `teacherinfo` (`teacherid`, `FullName`, `Age`, `Nationality`, `ContactNo`, `Address`, `PassportNo`, `PassportExpiryDate`, `VisaType`, `SchoolAccommodation`, `Tutor`, `Grade`, `RecordedDate`) VALUES
(18, 'vishnu', 23, 'indian', 8769876987, 'raj@gmail.com', '1222', '2016-09-12', 'HIB', 'Yes', 'y', 'Professor', '2021-05-24'),
(19, 'DK', 34, 'indian', 8769876, 'dk@gmail.com', '1222', '2016-09-12', 'HIB', 'Yes', 'y', 'Professor', '2021-05-24'),
(20, 'aaaaaaaa', 23, 'indian', 8769876987, 'dk@gmail.com', '1222', '2016-09-12', 'HIB', 'Yes', 'y', 'Professor', '2021-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_grades`
--

CREATE TABLE `teacher_grades` (
  `teacher_grades_id` int(11) NOT NULL,
  `teacherid` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_grades`
--

INSERT INTO `teacher_grades` (`teacher_grades_id`, `teacherid`, `gradeid`) VALUES
(55, 18, 1),
(56, 19, 1),
(57, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_sections`
--

CREATE TABLE `teacher_sections` (
  `teacher_sections_id` int(11) NOT NULL,
  `teacherid` int(11) NOT NULL,
  `sectionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_sections`
--

INSERT INTO `teacher_sections` (`teacher_sections_id`, `teacherid`, `sectionid`) VALUES
(47, 18, 1),
(48, 19, 1),
(49, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subjects`
--

CREATE TABLE `teacher_subjects` (
  `teacher_subjects_id` int(11) NOT NULL,
  `teacherid` int(11) NOT NULL,
  `subjectid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_subjects`
--

INSERT INTO `teacher_subjects` (`teacher_subjects_id`, `teacherid`, `subjectid`) VALUES
(48, 18, 5),
(49, 19, 3),
(50, 19, 4),
(51, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_a`
--

CREATE TABLE `timetable_a` (
  `sno` int(11) NOT NULL,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `Grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable_a`
--

INSERT INTO `timetable_a` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `Grade`) VALUES
(61, 'Monday', 9, 5, 4, 8, 10, 3, 3, 1),
(62, 'Tueday', 4, 12, 9, 11, 12, 10, 5, 1),
(63, 'Wednesday', 9, 7, 12, 5, 3, 4, 12, 1),
(64, 'Thursday', 10, 12, 12, 11, 3, 7, 3, 1),
(65, 'Friday', 11, 3, 12, 12, 8, 3, 3, 1),
(66, 'Monday', 10, 12, 4, 12, 3, 9, 12, 2),
(67, 'Tueday', 3, 12, 8, 7, 10, 5, 12, 2),
(68, 'Wednesday', 3, 8, 12, 5, 3, 4, 3, 2),
(69, 'Thursday', 3, 11, 4, 11, 12, 11, 10, 2),
(70, 'Friday', 9, 3, 3, 9, 12, 7, 5, 2),
(71, 'Monday', 8, 4, 4, 7, 12, 12, 12, 3),
(72, 'Tueday', 12, 3, 11, 12, 3, 5, 5, 3),
(73, 'Wednesday', 8, 10, 3, 8, 12, 7, 5, 3),
(74, 'Thursday', 4, 3, 4, 9, 5, 12, 7, 3),
(75, 'Friday', 3, 3, 7, 3, 10, 3, 12, 3),
(76, 'Monday', 8, 10, 3, 12, 10, 4, 12, 4),
(77, 'Tueday', 12, 5, 3, 7, 3, 12, 4, 4),
(78, 'Wednesday', 8, 12, 3, 5, 3, 4, 9, 4),
(79, 'Thursday', 7, 7, 3, 8, 7, 12, 4, 4),
(80, 'Friday', 3, 12, 3, 12, 5, 5, 11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_i`
--

CREATE TABLE `timetable_i` (
  `sno` int(11) NOT NULL,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `Grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable_i`
--

INSERT INTO `timetable_i` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `Grade`) VALUES
(1, 'Sunday', 7, 5, 12, 4, 7, 3, 10, 1),
(2, 'Monday', 9, 11, 4, 9, 11, 5, 12, 1),
(3, 'Tueday', 12, 9, 12, 11, 8, 3, 3, 1),
(4, 'Wednesday', 3, 12, 3, 4, 3, 12, 3, 1),
(5, 'Thursday', 12, 12, 10, 10, 5, 8, 3, 1),
(6, 'Sunday', 3, 10, 3, 12, 12, 12, 7, 2),
(7, 'Monday', 3, 4, 4, 12, 12, 4, 9, 2),
(8, 'Tueday', 3, 3, 11, 10, 3, 5, 12, 2),
(9, 'Wednesday', 12, 5, 8, 10, 12, 11, 7, 2),
(10, 'Thursday', 3, 3, 9, 5, 8, 9, 11, 2),
(11, 'Sunday', 4, 4, 4, 3, 3, 3, 10, 3),
(12, 'Monday', 8, 7, 8, 12, 8, 12, 11, 3),
(13, 'Tueday', 4, 7, 3, 5, 7, 5, 12, 3),
(14, 'Wednesday', 9, 12, 7, 12, 3, 12, 3, 3),
(15, 'Thursday', 12, 10, 12, 3, 5, 5, 3, 3),
(16, 'Sunday', 4, 12, 8, 3, 12, 5, 7, 4),
(17, 'Monday', 8, 3, 3, 5, 3, 3, 5, 4),
(18, 'Tueday', 3, 12, 12, 7, 7, 7, 11, 4),
(19, 'Wednesday', 4, 12, 4, 12, 10, 3, 8, 4),
(20, 'Thursday', 10, 5, 9, 3, 4, 12, 12, 4),
(21, 'Sunday', 3, 12, 5, 3, 8, 7, 1, 5),
(22, 'Monday', 3, 3, 5, 4, 12, 3, 4, 5),
(23, 'Tueday', 12, 5, 12, 10, 11, 9, 4, 5),
(24, 'Wednesday', 1, 1, 1, 8, 7, 7, 12, 5),
(25, 'Thursday', 4, 12, 7, 5, 3, 3, 8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_kalam`
--

CREATE TABLE `timetable_kalam` (
  `sno` int(11) NOT NULL,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL,
  `sectionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timetable_karan`
--

CREATE TABLE `timetable_karan` (
  `sno` int(11) NOT NULL,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL,
  `sectionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timetable_kiruba`
--

CREATE TABLE `timetable_kiruba` (
  `sno` int(11) NOT NULL,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL,
  `sectionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timetable_madhan`
--

CREATE TABLE `timetable_madhan` (
  `sno` int(11) NOT NULL,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL,
  `sectionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timetable_n`
--

CREATE TABLE `timetable_n` (
  `sno` int(11) NOT NULL,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `Grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable_n`
--

INSERT INTO `timetable_n` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `Grade`) VALUES
(1, 'Sunday', 11, 12, 3, 3, 12, 12, 5, 1),
(2, 'Monday', 4, 3, 3, 9, 3, 8, 3, 1),
(3, 'Tueday', 3, 5, 12, 7, 12, 9, 11, 1),
(4, 'Wednesday', 10, 10, 7, 12, 12, 11, 12, 1),
(5, 'Thursday', 5, 8, 10, 4, 3, 4, 9, 1),
(6, 'Sunday', 10, 3, 4, 3, 5, 4, 12, 2),
(7, 'Monday', 12, 7, 8, 5, 3, 4, 5, 2),
(8, 'Tueday', 9, 3, 11, 12, 10, 3, 12, 2),
(9, 'Wednesday', 3, 3, 10, 12, 12, 11, 3, 2),
(10, 'Thursday', 11, 12, 12, 9, 9, 7, 8, 2),
(11, 'Sunday', 3, 12, 4, 3, 10, 9, 4, 3),
(12, 'Monday', 5, 3, 10, 5, 7, 8, 3, 3),
(13, 'Tueday', 12, 3, 3, 7, 4, 8, 12, 3),
(14, 'Wednesday', 12, 8, 12, 5, 3, 7, 7, 3),
(15, 'Thursday', 4, 12, 5, 12, 11, 12, 3, 3),
(16, 'Sunday', 5, 12, 8, 4, 4, 3, 7, 4),
(17, 'Monday', 7, 3, 9, 12, 3, 12, 3, 4),
(18, 'Tueday', 11, 7, 12, 4, 10, 3, 12, 4),
(19, 'Wednesday', 5, 3, 3, 5, 5, 8, 12, 4),
(20, 'Thursday', 12, 12, 4, 10, 3, 7, 8, 4),
(21, 'Sunday', 1, 4, 12, 8, 3, 7, 3, 5),
(22, 'Monday', 3, 5, 12, 5, 7, 1, 4, 5),
(23, 'Tueday', 1, 12, 4, 5, 7, 10, 4, 5),
(24, 'Wednesday', 11, 9, 12, 12, 8, 3, 7, 5),
(25, 'Thursday', 3, 1, 12, 5, 3, 3, 8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_q`
--

CREATE TABLE `timetable_q` (
  `sno` int(11) NOT NULL,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `Grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable_q`
--

INSERT INTO `timetable_q` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `Grade`) VALUES
(1, 'Sunday', 3, 12, 3, 11, 9, 5, 3, 1),
(2, 'Monday', 10, 12, 4, 7, 12, 12, 12, 1),
(3, 'Tueday', 12, 11, 10, 5, 12, 9, 3, 1),
(4, 'Wednesday', 8, 12, 3, 11, 4, 10, 3, 1),
(5, 'Thursday', 5, 9, 3, 7, 4, 3, 8, 1),
(6, 'Sunday', 8, 4, 9, 12, 3, 8, 12, 2),
(7, 'Monday', 10, 5, 12, 3, 3, 12, 9, 2),
(8, 'Tueday', 10, 4, 4, 10, 12, 3, 9, 2),
(9, 'Wednesday', 5, 3, 3, 11, 12, 7, 7, 2),
(10, 'Thursday', 3, 11, 11, 5, 12, 12, 3, 2),
(11, 'Sunday', 3, 7, 7, 5, 10, 5, 12, 3),
(12, 'Monday', 3, 12, 12, 12, 12, 8, 8, 3),
(13, 'Tueday', 10, 4, 4, 3, 4, 11, 8, 3),
(14, 'Wednesday', 9, 12, 3, 3, 7, 3, 3, 3),
(15, 'Thursday', 5, 12, 5, 3, 12, 4, 7, 3),
(16, 'Sunday', 12, 5, 10, 12, 7, 4, 3, 4),
(17, 'Monday', 3, 4, 4, 12, 8, 5, 3, 4),
(18, 'Tueday', 12, 7, 3, 12, 7, 12, 4, 4),
(19, 'Wednesday', 8, 7, 11, 10, 5, 3, 3, 4),
(20, 'Thursday', 8, 3, 3, 12, 5, 9, 12, 4),
(21, 'Sunday', 3, 3, 3, 11, 3, 3, 1, 5),
(22, 'Monday', 7, 4, 1, 3, 12, 7, 1, 5),
(23, 'Tueday', 12, 5, 4, 12, 4, 7, 10, 5),
(24, 'Wednesday', 12, 7, 5, 12, 8, 8, 9, 5),
(25, 'Thursday', 5, 3, 1, 12, 8, 4, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_s`
--

CREATE TABLE `timetable_s` (
  `sno` int(11) NOT NULL,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `Grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timetable_tamil`
--

CREATE TABLE `timetable_tamil` (
  `sno` int(11) NOT NULL,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL,
  `sectionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timetable_vishnu`
--

CREATE TABLE `timetable_vishnu` (
  `sno` int(11) NOT NULL,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `gradeid` int(11) NOT NULL,
  `sectionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable_vishnu`
--

INSERT INTO `timetable_vishnu` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `gradeid`, `sectionid`) VALUES
(5, 'Monday', 0, 0, 0, 0, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_w`
--

CREATE TABLE `timetable_w` (
  `sno` int(11) NOT NULL,
  `Day` varchar(250) NOT NULL,
  `8_9` int(11) NOT NULL,
  `9_10` int(11) NOT NULL,
  `10_11` int(11) NOT NULL,
  `11_12` int(11) NOT NULL,
  `1_2` int(11) NOT NULL,
  `2_3` int(11) NOT NULL,
  `3_4` int(11) NOT NULL,
  `Grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable_w`
--

INSERT INTO `timetable_w` (`sno`, `Day`, `8_9`, `9_10`, `10_11`, `11_12`, `1_2`, `2_3`, `3_4`, `Grade`) VALUES
(1, 'Sunday', 9, 12, 3, 3, 5, 10, 12, 1),
(2, 'Monday', 5, 4, 10, 3, 12, 5, 3, 1),
(3, 'Tueday', 12, 7, 11, 3, 8, 9, 12, 1),
(4, 'Wednesday', 12, 11, 3, 11, 3, 9, 3, 1),
(5, 'Thursday', 4, 10, 7, 4, 12, 8, 12, 1),
(6, 'Sunday', 10, 12, 11, 4, 12, 11, 12, 2),
(7, 'Monday', 3, 9, 12, 5, 5, 7, 12, 2),
(8, 'Tueday', 12, 3, 4, 12, 3, 9, 3, 2),
(9, 'Wednesday', 3, 7, 12, 3, 10, 8, 3, 2),
(10, 'Thursday', 5, 3, 8, 11, 10, 4, 9, 2),
(11, 'Sunday', 7, 5, 5, 3, 12, 12, 3, 3),
(12, 'Monday', 10, 12, 9, 8, 10, 8, 4, 3),
(13, 'Tueday', 11, 3, 8, 12, 3, 7, 7, 3),
(14, 'Wednesday', 3, 12, 3, 4, 5, 3, 7, 3),
(15, 'Thursday', 12, 5, 4, 4, 12, 3, 12, 3),
(16, 'Sunday', 12, 3, 12, 3, 10, 4, 4, 4),
(17, 'Monday', 12, 5, 3, 4, 12, 7, 7, 4),
(18, 'Tueday', 8, 12, 7, 9, 3, 3, 4, 4),
(19, 'Wednesday', 3, 8, 12, 11, 3, 8, 12, 4),
(20, 'Thursday', 7, 5, 3, 5, 10, 12, 5, 4),
(21, 'Sunday', 3, 3, 3, 5, 4, 1, 3, 5),
(22, 'Monday', 8, 12, 12, 12, 12, 5, 3, 5),
(23, 'Tueday', 5, 1, 7, 5, 4, 3, 3, 5),
(24, 'Wednesday', 7, 1, 12, 4, 1, 11, 8, 5),
(25, 'Thursday', 4, 9, 12, 7, 10, 8, 7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `UserId` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `PhoneNo` bigint(20) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Address` text NOT NULL,
  `UserName` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `RecordedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`UserId`, `Name`, `PhoneNo`, `Email`, `Address`, `UserName`, `Password`, `RecordedDate`) VALUES
(1, 'vishnu', 9043963074, 'avishnuvardhanz@gmail.com', 'chennai', 'asd', 'asd', '2021-05-20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`gradeid`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`sectionid`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectid`);

--
-- Indexes for table `subject_grade`
--
ALTER TABLE `subject_grade`
  ADD PRIMARY KEY (`subject_gradeid`),
  ADD KEY `subjectid` (`subjectid`),
  ADD KEY `gradeid` (`gradeid`);

--
-- Indexes for table `teacherinfo`
--
ALTER TABLE `teacherinfo`
  ADD PRIMARY KEY (`teacherid`);

--
-- Indexes for table `teacher_grades`
--
ALTER TABLE `teacher_grades`
  ADD PRIMARY KEY (`teacher_grades_id`),
  ADD KEY `teacherid` (`teacherid`),
  ADD KEY `gradeid` (`gradeid`);

--
-- Indexes for table `teacher_sections`
--
ALTER TABLE `teacher_sections`
  ADD PRIMARY KEY (`teacher_sections_id`),
  ADD KEY `teacherid` (`teacherid`),
  ADD KEY `sectionid` (`sectionid`);

--
-- Indexes for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD PRIMARY KEY (`teacher_subjects_id`),
  ADD KEY `teacherid` (`teacherid`),
  ADD KEY `subjectid` (`subjectid`);

--
-- Indexes for table `timetable_a`
--
ALTER TABLE `timetable_a`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `8_9` (`8_9`),
  ADD KEY `9_10` (`9_10`),
  ADD KEY `10_11` (`10_11`),
  ADD KEY `11_12` (`11_12`),
  ADD KEY `1_2` (`1_2`),
  ADD KEY `2_3` (`2_3`),
  ADD KEY `3_4` (`3_4`),
  ADD KEY `Grade` (`Grade`);

--
-- Indexes for table `timetable_i`
--
ALTER TABLE `timetable_i`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `8_9` (`8_9`),
  ADD KEY `9_10` (`9_10`),
  ADD KEY `10_11` (`10_11`),
  ADD KEY `11_12` (`11_12`),
  ADD KEY `1_2` (`1_2`),
  ADD KEY `2_3` (`2_3`),
  ADD KEY `3_4` (`3_4`),
  ADD KEY `Grade` (`Grade`);

--
-- Indexes for table `timetable_kalam`
--
ALTER TABLE `timetable_kalam`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `8_9` (`8_9`),
  ADD KEY `9_10` (`9_10`),
  ADD KEY `10_11` (`10_11`),
  ADD KEY `11_12` (`11_12`),
  ADD KEY `1_2` (`1_2`),
  ADD KEY `2_3` (`2_3`),
  ADD KEY `3_4` (`3_4`),
  ADD KEY `gradeid` (`gradeid`),
  ADD KEY `sectionid` (`sectionid`);

--
-- Indexes for table `timetable_karan`
--
ALTER TABLE `timetable_karan`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `8_9` (`8_9`),
  ADD KEY `9_10` (`9_10`),
  ADD KEY `10_11` (`10_11`),
  ADD KEY `11_12` (`11_12`),
  ADD KEY `1_2` (`1_2`),
  ADD KEY `2_3` (`2_3`),
  ADD KEY `3_4` (`3_4`),
  ADD KEY `gradeid` (`gradeid`),
  ADD KEY `sectionid` (`sectionid`);

--
-- Indexes for table `timetable_kiruba`
--
ALTER TABLE `timetable_kiruba`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `8_9` (`8_9`),
  ADD KEY `9_10` (`9_10`),
  ADD KEY `10_11` (`10_11`),
  ADD KEY `11_12` (`11_12`),
  ADD KEY `1_2` (`1_2`),
  ADD KEY `2_3` (`2_3`),
  ADD KEY `3_4` (`3_4`),
  ADD KEY `gradeid` (`gradeid`),
  ADD KEY `sectionid` (`sectionid`);

--
-- Indexes for table `timetable_madhan`
--
ALTER TABLE `timetable_madhan`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `8_9` (`8_9`),
  ADD KEY `9_10` (`9_10`),
  ADD KEY `10_11` (`10_11`),
  ADD KEY `11_12` (`11_12`),
  ADD KEY `1_2` (`1_2`),
  ADD KEY `2_3` (`2_3`),
  ADD KEY `3_4` (`3_4`),
  ADD KEY `gradeid` (`gradeid`),
  ADD KEY `sectionid` (`sectionid`);

--
-- Indexes for table `timetable_n`
--
ALTER TABLE `timetable_n`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `8_9` (`8_9`),
  ADD KEY `9_10` (`9_10`),
  ADD KEY `10_11` (`10_11`),
  ADD KEY `11_12` (`11_12`),
  ADD KEY `1_2` (`1_2`),
  ADD KEY `2_3` (`2_3`),
  ADD KEY `3_4` (`3_4`),
  ADD KEY `Grade` (`Grade`);

--
-- Indexes for table `timetable_q`
--
ALTER TABLE `timetable_q`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `8_9` (`8_9`),
  ADD KEY `9_10` (`9_10`),
  ADD KEY `10_11` (`10_11`),
  ADD KEY `11_12` (`11_12`),
  ADD KEY `1_2` (`1_2`),
  ADD KEY `2_3` (`2_3`),
  ADD KEY `3_4` (`3_4`),
  ADD KEY `Grade` (`Grade`);

--
-- Indexes for table `timetable_s`
--
ALTER TABLE `timetable_s`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `8_9` (`8_9`),
  ADD KEY `9_10` (`9_10`),
  ADD KEY `10_11` (`10_11`),
  ADD KEY `11_12` (`11_12`),
  ADD KEY `1_2` (`1_2`),
  ADD KEY `2_3` (`2_3`),
  ADD KEY `3_4` (`3_4`),
  ADD KEY `Grade` (`Grade`);

--
-- Indexes for table `timetable_tamil`
--
ALTER TABLE `timetable_tamil`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `8_9` (`8_9`),
  ADD KEY `9_10` (`9_10`),
  ADD KEY `10_11` (`10_11`),
  ADD KEY `11_12` (`11_12`),
  ADD KEY `1_2` (`1_2`),
  ADD KEY `2_3` (`2_3`),
  ADD KEY `3_4` (`3_4`),
  ADD KEY `gradeid` (`gradeid`),
  ADD KEY `sectionid` (`sectionid`);

--
-- Indexes for table `timetable_vishnu`
--
ALTER TABLE `timetable_vishnu`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `8_9` (`8_9`),
  ADD KEY `9_10` (`9_10`),
  ADD KEY `10_11` (`10_11`),
  ADD KEY `11_12` (`11_12`),
  ADD KEY `1_2` (`1_2`),
  ADD KEY `2_3` (`2_3`),
  ADD KEY `3_4` (`3_4`),
  ADD KEY `gradeid` (`gradeid`),
  ADD KEY `sectionid` (`sectionid`);

--
-- Indexes for table `timetable_w`
--
ALTER TABLE `timetable_w`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `8_9` (`8_9`),
  ADD KEY `9_10` (`9_10`),
  ADD KEY `10_11` (`10_11`),
  ADD KEY `11_12` (`11_12`),
  ADD KEY `1_2` (`1_2`),
  ADD KEY `2_3` (`2_3`),
  ADD KEY `3_4` (`3_4`),
  ADD KEY `Grade` (`Grade`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `gradeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `sectionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subjectid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subject_grade`
--
ALTER TABLE `subject_grade`
  MODIFY `subject_gradeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `teacherinfo`
--
ALTER TABLE `teacherinfo`
  MODIFY `teacherid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `teacher_grades`
--
ALTER TABLE `teacher_grades`
  MODIFY `teacher_grades_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `teacher_sections`
--
ALTER TABLE `teacher_sections`
  MODIFY `teacher_sections_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  MODIFY `teacher_subjects_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `timetable_a`
--
ALTER TABLE `timetable_a`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `timetable_i`
--
ALTER TABLE `timetable_i`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `timetable_kalam`
--
ALTER TABLE `timetable_kalam`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `timetable_karan`
--
ALTER TABLE `timetable_karan`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timetable_kiruba`
--
ALTER TABLE `timetable_kiruba`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `timetable_madhan`
--
ALTER TABLE `timetable_madhan`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timetable_n`
--
ALTER TABLE `timetable_n`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `timetable_q`
--
ALTER TABLE `timetable_q`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `timetable_s`
--
ALTER TABLE `timetable_s`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `timetable_tamil`
--
ALTER TABLE `timetable_tamil`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timetable_vishnu`
--
ALTER TABLE `timetable_vishnu`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `timetable_w`
--
ALTER TABLE `timetable_w`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subject_grade`
--
ALTER TABLE `subject_grade`
  ADD CONSTRAINT `subject_grade_ibfk_1` FOREIGN KEY (`subjectid`) REFERENCES `subject` (`subjectid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_grade_ibfk_2` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`gradeid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_grades`
--
ALTER TABLE `teacher_grades`
  ADD CONSTRAINT `teacher_grades_ibfk_1` FOREIGN KEY (`teacherid`) REFERENCES `teacherinfo` (`teacherid`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_grades_ibfk_2` FOREIGN KEY (`gradeid`) REFERENCES `grade` (`gradeid`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_sections`
--
ALTER TABLE `teacher_sections`
  ADD CONSTRAINT `teacher_sections_ibfk_1` FOREIGN KEY (`teacherid`) REFERENCES `teacherinfo` (`teacherid`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_sections_ibfk_2` FOREIGN KEY (`sectionid`) REFERENCES `sections` (`sectionid`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD CONSTRAINT `teacher_subjects_ibfk_1` FOREIGN KEY (`teacherid`) REFERENCES `teacherinfo` (`teacherid`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_subjects_ibfk_2` FOREIGN KEY (`subjectid`) REFERENCES `subject` (`subjectid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
