-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2016 at 09:40 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_mcq`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_answer_compare`
--

CREATE TABLE IF NOT EXISTS `tbl_answer_compare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ques_id` int(11) NOT NULL,
  `student_answer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`ques_id`),
  KEY `ques_id` (`ques_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=139 ;

--
-- Dumping data for table `tbl_answer_compare`
--

INSERT INTO `tbl_answer_compare` (`id`, `user_id`, `ques_id`, `student_answer`) VALUES
(129, 1, 3, '0'),
(130, 1, 6, '0'),
(131, 1, 18, '0'),
(132, 1, 19, '0'),
(133, 1, 20, '0'),
(134, 1, 21, '1'),
(135, 1, 22, '3'),
(136, 1, 23, '0'),
(137, 1, 24, '0'),
(138, 1, 25, '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE IF NOT EXISTS `tbl_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `iscomplete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `category`, `iscomplete`) VALUES
(1, 'Mathematics', 0),
(4, 'Science', 0),
(5, 'Advanced Calculus', 0),
(6, 'Nuclear Science', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_question`
--

CREATE TABLE IF NOT EXISTS `tbl_question` (
  `ques_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `opt_1` varchar(255) NOT NULL,
  `opt_2` varchar(255) NOT NULL,
  `opt_3` varchar(255) NOT NULL,
  `opt_4` varchar(255) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `correct_ans` varchar(255) NOT NULL,
  PRIMARY KEY (`ques_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `tbl_question`
--

INSERT INTO `tbl_question` (`ques_id`, `question`, `opt_1`, `opt_2`, `opt_3`, `opt_4`, `cat_id`, `correct_ans`) VALUES
(1, '2+21', '1', '2', '5', '23', 4, '3'),
(3, 'What is the value of 2+21?', '1', '2', '5', '23', 1, '4'),
(6, 'What is the value of 2+25?', '22', '27', '5', '23', 1, '2'),
(7, 'what is force', 'dasd', 'asd', 'dasd', 'dasd', 4, '3'),
(8, 'what is force', 'dasd', 'asd', 'dasd', 'dasd', 4, '3'),
(15, 'gdgd', 'fggdf', 'gdfg', 'gdfg', 'gdfg', 4, '2'),
(17, 'what is force', 'dasd', '2', 'fsdf', '23', 4, '1'),
(18, 'how many taka taka taka taka??', 'taka1', 'taka2', 'taka3', 'taka4', 1, '4'),
(19, 'Which of the following is true for the equation: x >= 5', 'x = 20', 'x = 4.99', 'x = -5', 'x = 2', 1, '1'),
(20, 'What is the value of y if x = 15 in the equation: 20x + 15y = 500?', '13.33333', '13', '20', '15', 1, '1'),
(21, 'What is the power of ten to itself. (10^10)', '10000000', '10000', '100', '10000000000', 1, '4'),
(22, 'What is the value of x, in the equation: 5x + 33 = 22?', '2.5', '3', '2', '3.5', 1, '1'),
(23, 'What is 2^2?', '4', '5', '2', '9', 1, '1'),
(24, 'What is 10 - 10 x 40?', '0', '400', '-390', '2', 1, '3'),
(25, 'What is the 6 x 6?', '12', '45', '35', '36', 1, '4');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `isadmin` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `name`, `email`, `password`, `isadmin`) VALUES
(1, 'admin', 'admin@admin.com', 'admin', 1),
(9, 'Green Love', 'green@love.com', 'admin123', 3),
(14, 'Jon Doe', 'jondoe@gmail.com', '123', 2),
(15, 'Jessica Alba', 'jessica@gmail.com', '123', 3),
(17, 'takashala boom', 'taka@boom.com', '123', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_answer_compare`
--
ALTER TABLE `tbl_answer_compare`
  ADD CONSTRAINT `tbl_answer_compare_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_answer_compare_ibfk_2` FOREIGN KEY (`ques_id`) REFERENCES `tbl_question` (`ques_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_question`
--
ALTER TABLE `tbl_question`
  ADD CONSTRAINT `tbl_question_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `tbl_category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
