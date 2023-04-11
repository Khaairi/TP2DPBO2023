-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2023 at 05:27 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tp2`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id`, `name`, `username`, `password`) VALUES
(1, 'MoKha', 'mokha', 'mokha30'),
(3, 'ri', 'ri', 'ri'),
(4, 'Admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `id` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `movies` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`id`, `picture`, `name`, `age`, `nationality`, `movies`) VALUES
(11, 'ghafur_night_cyberpunk_city_with_full_moon_cinematic_lighting_u_e0592f0f-11ec-4773-b81e-033b148a8f4c.png', 'Joko Anwar', 37, 'IDN', 1),
(12, 'Aceng_Grim_Reaper_Worm_Sea_32014bd9-86e8-44f1-9a6d-bd1161545851.png', 'Christopher Nolan', 43, 'US', 1);

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `director` int(16) NOT NULL,
  `revenue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `poster`, `title`, `year`, `director`, `revenue`) VALUES
(5, 'MoKha_ancestors_gathering_in_the_holy_of_light_7bee5b15-9114-4d0e-b0d5-740fd3651185.png', 'Pengabdi Setan', '2018', 11, '200.000.000'),
(6, 'MoKha_Angels_and_Demons_abd86ecc-0049-40ce-9f52-d2182410a98e.png', 'TENET', '2021', 12, '1.000.000.000');

--
-- Triggers `film`
--
DELIMITER $$
CREATE TRIGGER `addFilm` AFTER INSERT ON `film` FOR EACH ROW BEGIN
	UPDATE director SET movies = movies + 1
    WHERE id=NEW.director;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deleteFilm` BEFORE DELETE ON `film` FOR EACH ROW BEGIN
	UPDATE director SET movies = movies - 1
    WHERE id=OLD.director;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateFilm` BEFORE UPDATE ON `film` FOR EACH ROW BEGIN
	UPDATE director SET movies = movies - 1
    WHERE id=OLD.director;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`),
  ADD KEY `director` (`director`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `director`
--
ALTER TABLE `director`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`director`) REFERENCES `director` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
