-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2022 at 11:29 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flightreservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `building_number` varchar(32) NOT NULL,
  `street` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `state` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`building_number`, `street`, `city`, `state`) VALUES
('09', 'hkhk', 'jkhkk', 'gkhjk'),
('0987', 'Heera', 'Kaka', 'dsma.d'),
('12', '30', 'eden', 'lahore'),
('13', '32', 'fsf', 'Karahi'),
('155', '332', 'New Yourl', 'California'),
('2', '23', 'lahore', 'punjab'),
('432', 'fdss', 'fsdfs', 'fsdf'),
('4567', 'fsdfs', 'fsdfsd', 'fsfs'),
('534', 'tfddwer', 'gdgdfg', 'gdfgfd'),
('54', 'gfdg', 'gdf', 'gdfgg'),
('765', 'Sometime', 'Kolkata', 'Bhandhara'),
('980', 'Eden', 'Lahore', 'Kamoki'),
('manat', 'dehli', 'bombay', 'kolkata'),
('sfsdf', 'rewrwrwrw', 'vdsfd', 'wwer');

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `name` varchar(32) NOT NULL,
  `airplane` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`name`, `airplane`) VALUES
('Air France', 'Mg30'),
('China Eastern', 'One'),
('Emirates', 'Cf30'),
('Itehad', '1');

-- --------------------------------------------------------

--
-- Table structure for table `airline_staff`
--

CREATE TABLE `airline_staff` (
  `username` varchar(32) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `date_of_birth` varchar(32) DEFAULT NULL,
  `phone_number` varchar(32) DEFAULT NULL,
  `airline_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airline_staff`
--

INSERT INTO `airline_staff` (`username`, `password`, `first_name`, `last_name`, `date_of_birth`, `phone_number`, `airline_name`) VALUES
('client', '12345', 'clientname', 'clientlastname', '43242', '434223', 'China Eastern'),
('khan', '12345', 'khan', 'bilal', '31-15-2021', '0092304342', 'China Eastern'),
('tajwarbilal', '12345', 'Tajwar ', 'Bilal', '31-05-1996', '+923008105302', 'China Eastern');

-- --------------------------------------------------------

--
-- Table structure for table `airplane`
--

CREATE TABLE `airplane` (
  `id_number` varchar(8) NOT NULL,
  `airline` varchar(32) NOT NULL,
  `number_of_seats` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `manafacturing_company` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airplane`
--

INSERT INTO `airplane` (`id_number`, `airline`, `number_of_seats`, `age`, `manafacturing_company`) VALUES
('1', 'Emirates', 50, 2, 'Jet Manafac'),
('1', 'Etihad', 200, 4, 'Jet Manafac'),
('1', 'Qatar', 30, 3, 'Plane Manafac');

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `name` varchar(32) NOT NULL,
  `city` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`name`, `city`, `country`) VALUES
('Ilama Iqbal', 'Lahore', 'Pakistan'),
('India Airport', 'Delhi', 'India'),
('JFK', 'NYC', 'United States'),
('Paris', 'Paris', 'France'),
('PVG', 'Shanghai', 'China');

-- --------------------------------------------------------

--
-- Table structure for table `consists`
--

CREATE TABLE `consists` (
  `name` varchar(32) NOT NULL,
  `id_number` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `email` varchar(32) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `phone_number` varchar(32) DEFAULT NULL,
  `passport_number` varchar(32) DEFAULT NULL,
  `card_number` varchar(32) DEFAULT NULL,
  `customer_email` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`email`, `password`, `name`, `address`, `phone_number`, `passport_number`, `card_number`, `customer_email`) VALUES
('checking@gmail.com', '12345', 'checking', 'manat', '78974927', '7493279327', '42342342', NULL),
('ghost@gmail.com', '12345', 'ghost', '155', '0043242423', '4325543', '7432974829', NULL),
('testing@gmail.com', '12345', 'testing', '2', '+923008105302', '1234342', '666664', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `arrival_airport` varchar(32) NOT NULL,
  `departure_airport` varchar(32) DEFAULT NULL,
  `flight_number` varchar(8) NOT NULL,
  `status` varchar(32) DEFAULT NULL,
  `departure_date` varchar(32) NOT NULL,
  `arrival_date` varchar(32) DEFAULT NULL,
  `base_price` varchar(32) DEFAULT NULL,
  `airplane_id` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`arrival_airport`, `departure_airport`, `flight_number`, `status`, `departure_date`, `arrival_date`, `base_price`, `airplane_id`) VALUES
('Ilama Iqbal', 'Canada', '3456', 'Confirm', '21', '20', '1000', '1'),
('India Airport', 'IN', '34', 'Pennding', '23', '22', '3000', '1'),
('JFK', 'PDG', '32', 'okay', '15', '16', '1200', '1'),
('JFK', 'PDG', '45', 'Confirm', '12', '09', '1100', '1');

-- --------------------------------------------------------

--
-- Table structure for table `myspendings`
--

CREATE TABLE `myspendings` (
  `name` varchar(32) DEFAULT NULL,
  `total` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myspendings`
--

INSERT INTO `myspendings` (`name`, `total`) VALUES
('testing@gmail.com', '1200'),
('testing@gmail.com', '1100'),
('checking@gmail.com', '1000'),
('checking@gmail.com', '1200');

-- --------------------------------------------------------

--
-- Table structure for table `passport`
--

CREATE TABLE `passport` (
  `passport_number` varchar(32) NOT NULL,
  `expiration` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `date_of_birth` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passport`
--

INSERT INTO `passport` (`passport_number`, `expiration`, `country`, `date_of_birth`) VALUES
('1234342', '43', 'Pakistan', '31-05-21'),
('4325543', '23', 'Amrika', '31-05-21'),
('7493279327', '21', 'India', '31-05-21');

-- --------------------------------------------------------

--
-- Table structure for table `payment_information`
--

CREATE TABLE `payment_information` (
  `card_num` varchar(32) NOT NULL,
  `expiration_date` varchar(32) NOT NULL,
  `name_on_card` varchar(32) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `purchase_date` varchar(32) DEFAULT NULL,
  `purchase_time` varchar(32) DEFAULT NULL,
  `card_number` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `phone_number`
--

CREATE TABLE `phone_number` (
  `area_code` varchar(4) NOT NULL,
  `phone_num` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `flight_number` varchar(8) NOT NULL,
  `individual_rating` float NOT NULL,
  `average_rating` float DEFAULT NULL,
  `comments` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `customer_email` varchar(32) NOT NULL,
  `address` varchar(32) DEFAULT NULL,
  `travel_class` varchar(32) DEFAULT NULL,
  `airline_name` varchar(32) DEFAULT NULL,
  `flight_number` varchar(8) NOT NULL,
  `sold_price` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`customer_email`, `address`, `travel_class`, `airline_name`, `flight_number`, `sold_price`) VALUES
('checking@gmail.com', '534', 'Business', 'emirate', '32', '1200'),
('testing@gmail.com', '980', 'Standard', 'emirate', '32', '1200'),
('testing@gmail.com', 'sfsdf', 'Business', 'emirate', '45', '1100');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`building_number`);

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `airline_staff`
--
ALTER TABLE `airline_staff`
  ADD PRIMARY KEY (`username`),
  ADD KEY `airline_name` (`airline_name`);

--
-- Indexes for table `airplane`
--
ALTER TABLE `airplane`
  ADD PRIMARY KEY (`id_number`,`airline`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `consists`
--
ALTER TABLE `consists`
  ADD PRIMARY KEY (`name`,`id_number`),
  ADD KEY `id_number` (`id_number`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`email`),
  ADD KEY `customer_email` (`customer_email`),
  ADD KEY `address` (`address`),
  ADD KEY `passport_number` (`passport_number`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`arrival_airport`,`flight_number`,`departure_date`);

--
-- Indexes for table `passport`
--
ALTER TABLE `passport`
  ADD PRIMARY KEY (`passport_number`);

--
-- Indexes for table `payment_information`
--
ALTER TABLE `payment_information`
  ADD PRIMARY KEY (`card_num`,`expiration_date`),
  ADD KEY `card_number` (`card_number`);

--
-- Indexes for table `phone_number`
--
ALTER TABLE `phone_number`
  ADD PRIMARY KEY (`area_code`,`phone_num`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`flight_number`,`individual_rating`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`customer_email`,`flight_number`),
  ADD KEY `address` (`address`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airline_staff`
--
ALTER TABLE `airline_staff`
  ADD CONSTRAINT `airline_staff_ibfk_1` FOREIGN KEY (`airline_name`) REFERENCES `airline` (`name`);

--
-- Constraints for table `consists`
--
ALTER TABLE `consists`
  ADD CONSTRAINT `consists_ibfk_1` FOREIGN KEY (`id_number`) REFERENCES `airplane` (`id_number`),
  ADD CONSTRAINT `consists_ibfk_2` FOREIGN KEY (`name`) REFERENCES `airline` (`name`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customer_email`) REFERENCES `ticket` (`customer_email`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`address`) REFERENCES `address` (`building_number`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`passport_number`) REFERENCES `passport` (`passport_number`);

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`arrival_airport`) REFERENCES `airport` (`name`);

--
-- Constraints for table `payment_information`
--
ALTER TABLE `payment_information`
  ADD CONSTRAINT `payment_information_ibfk_1` FOREIGN KEY (`card_number`) REFERENCES `customer` (`email`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`address`) REFERENCES `address` (`building_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
