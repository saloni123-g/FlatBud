-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2023 at 01:02 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `flatbud`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE IF NOT EXISTS `admin_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `booking_request`
--

CREATE TABLE IF NOT EXISTS `booking_request` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `request_for` varchar(255) DEFAULT NULL,
  `request_date` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `flatmate_reply` varchar(255) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `booking_request`
--

INSERT INTO `booking_request` (`bid`, `email`, `request_for`, `request_date`, `status`, `flatmate_reply`) VALUES
(1, 'raj@gmail.com', '2', '17/04/23', 'Accept', 'Accept'),
(2, 'raj@gmail.com', '1', '17/04/23', 'Accept', 'Pending'),
(3, 'raj@gmail.com', '3', '23/04/23', 'Pending', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `cart_whish_list_products`
--

CREATE TABLE IF NOT EXISTS `cart_whish_list_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` varchar(30) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `base_price` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `request_by` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contct_no` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE IF NOT EXISTS `customer_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`id`, `name`, `address`, `mobile`, `email`, `password`, `status`) VALUES
(1, 'Piya', 'Pune', '9876543211', 'piya@gmail.com', '4545', 'Active'),
(2, 'Raj Patil', 'Nashik', '9812453200', 'raj@gmail.com', '1122', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `cust_bookings`
--

CREATE TABLE IF NOT EXISTS `cust_bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` varchar(30) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `base_price` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `totalPrice` varchar(200) DEFAULT NULL,
  `book_by` varchar(200) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `cust_bookings`
--

INSERT INTO `cust_bookings` (`id`, `p_id`, `category`, `p_name`, `base_price`, `quantity`, `totalPrice`, `book_by`, `status`) VALUES
(2, '1', 'Duplex', '2 single bed', '1500', '1', '3550', 'raj@gmail.com', 'Paid'),
(3, '2', 'Family', '2 double bed', '3550 ', '2', '3550', 'raj@gmail.com', 'Paid'),
(4, '2', 'Family', '2 double bed', '3550 ', '1', '3550', 'raj@gmail.com', 'Paid'),
(5, '3', 'Super Comfort', '1 double bed', '2200', '2', '3550', 'raj@gmail.com', 'Paid'),
(6, '2', 'Family', '2 double bed', '3550', '3', '10650', 'piya@gmail.com', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `emp_details`
--

CREATE TABLE IF NOT EXISTS `emp_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `salary` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT 'Working',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `emp_details`
--

INSERT INTO `emp_details` (`id`, `name`, `address`, `email`, `mobile`, `salary`, `status`) VALUES
(1, 'Harsh Sonar', 'Akurdi, Pune', 'harsh@gmail.com', '8765432190', '13500', 'Working'),
(2, 'Yash Kumar', 'Kodhava, Pune', 'yash@gmail.com', '8234567809', '15400', 'Working');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(200) NOT NULL,
  `stars` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `feedback`, `stars`, `email`) VALUES
(6, 'Nice service', '3', 'raj@gmail.com'),
(7, 'Superb.......', '4', 'raj@gmail.com'),
(8, 'Best Service', '4', 'raj@gmail.com'),
(9, 'Best service ever', '4', 'raj@gmail.com'),
(10, 'Nice service', '4', 'raj@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `flatmate_details`
--

CREATE TABLE IF NOT EXISTS `flatmate_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `flatmate_details`
--

INSERT INTO `flatmate_details` (`id`, `name`, `address`, `mobile`, `email`, `password`) VALUES
(1, 'Karan Kumar', 'CBS, Nashik', '9870989098', 'karan@gmail.com', '123'),
(2, 'Paresh Patil', 'Jalgaon', '9832123454', 'paresh@gmail.com', '1010');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE IF NOT EXISTS `payment_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `totalPrice` varchar(200) NOT NULL,
  `card_no` varchar(200) NOT NULL,
  `month_year` varchar(200) NOT NULL,
  `cvv` varchar(200) NOT NULL,
  `payment_by` varchar(255) NOT NULL,
  `payment_date` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Payment Done',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`id`, `totalPrice`, `card_no`, `month_year`, `cvv`, `payment_by`, `payment_date`, `status`) VALUES
(1, '3550', '987654321345', '22/12', '345', 'raj@gmail.com', '29/04/23', 'Payment Done');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE IF NOT EXISTS `product_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(1000) DEFAULT NULL,
  `p_name` varchar(100) DEFAULT NULL,
  `specification` text,
  `file_name` varchar(30) DEFAULT NULL,
  `base_price` varchar(30) DEFAULT NULL,
  `seller` varchar(255) DEFAULT NULL,
  `upload_by` varchar(30) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Not_Sell',
  `action` varchar(255) NOT NULL DEFAULT 'Available',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `category`, `p_name`, `specification`, `file_name`, `base_price`, `seller`, `upload_by`, `status`, `action`) VALUES
(1, 'Duplex', '2 single bed', 'AC, TV, Wifi, etc.', 'img11.png', '1500', 'Admin', 'Admin', 'Not_Sell', 'Available'),
(2, 'Family', '2 double bed', 'Sofa, TV, WIFI, Balcony, AC, etc.', 'img12.png', '3550', 'Admin', 'Admin', 'Not_Sell', 'Accept'),
(3, 'Super Comfort', '1 double bed', 'AC, TV, WIFI, etc.', 'img13.png', '2200', 'Admin', 'Admin', 'Not_Sell', 'BookingRequest');

-- --------------------------------------------------------

--
-- Table structure for table `seller_details`
--

CREATE TABLE IF NOT EXISTS `seller_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `seller_details`
--

INSERT INTO `seller_details` (`id`, `fname`, `email`, `mobile`, `password`) VALUES
(1, 'Amazon', 'amazon@gmail.com', '8900890089', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE IF NOT EXISTS `statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `p_name` varchar(255) DEFAULT NULL,
  `base_price` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`id`, `p_id`, `category`, `p_name`, `base_price`, `quantity`) VALUES
(4, '3', 'Panjabi', 'Panjab Mix Veg', '280', '1'),
(5, '2', 'Rajasthani', 'Khakara Puri', '260', '1'),
(6, '4', 'Gujarathi', 'Dhokala Roll', '220', '1'),
(7, '1', 'Duplex', '2 single bed', '1500', '1'),
(8, '2', 'Family', '2 double bed', '3500', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
