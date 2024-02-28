-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 28, 2024 at 03:49 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gallery`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `albumID` int(11) NOT NULL,
  `namaAlbum` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggalDibuat` date NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`albumID`, `namaAlbum`, `deskripsi`, `tanggalDibuat`, `userID`) VALUES
(1, 'sndrhyu', 'sndrhyu', '2024-02-26', 1),
(2, 'coba', 'coba', '2024-02-25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `fotoID` int(11) NOT NULL,
  `judulFoto` varchar(255) NOT NULL,
  `deskripsiFoto` text NOT NULL,
  `tanggalUnggah` date NOT NULL,
  `lokasiFile` varchar(255) DEFAULT NULL,
  `albumID` int(11) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `pathPhoto` varchar(255) DEFAULT NULL,
  `photoName` varchar(255) DEFAULT NULL,
  `like` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`fotoID`, `judulFoto`, `deskripsiFoto`, `tanggalUnggah`, `lokasiFile`, `albumID`, `userID`, `pathPhoto`, `photoName`, `like`) VALUES
(3, 'Afizah', 'Aku cantik kannnnnnn', '2024-02-12', NULL, NULL, 8, '1.jpg', '1.jpg', 0),
(6, 'Kata Mutiara Edit', 'Kata Mutiaraaa edit', '2024-02-10', NULL, NULL, 11, '2.jpg', '2.jpg', 0),
(7, 'akusindi', 'slebeww', '2024-02-19', NULL, NULL, 13, '3.jpg', '3.jpg', 0),
(8, 'sindi slebewww', 'kiw kiw kiw', '2024-02-19', NULL, NULL, 13, 'uploads\\photo-1708349460569-357971490.jpeg', 'photo-1708349460569-357971490.jpeg', 0),
(9, 'sndrhyu', 'mangeaa', '2024-02-19', NULL, NULL, 13, 'uploads\\photo-1708349737744-760293412.jpeg', 'photo-1708349737744-760293412.jpeg', 0),
(10, 'akusindi', 'kiwkiw', '2024-02-19', NULL, NULL, 11, 'uploads\\photo-1708350091321-871500725.jpeg', 'photo-1708350091321-871500725.jpeg', 0),
(11, 'sndrhyu', 'slebeww', '2024-02-19', NULL, NULL, 11, 'uploads\\photo-1708350138609-20532768.jpeg', 'photo-1708350138609-20532768.jpeg', 0),
(12, 'sndrhyu06', 'kiwkiw', '2024-02-19', NULL, NULL, 11, 'uploads\\photo-1708350633433-890572403.jpeg', 'photo-1708350633433-890572403.jpeg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `komentarfoto`
--

CREATE TABLE `komentarfoto` (
  `komentarID` int(11) NOT NULL,
  `fotoID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `isiKomentar` text NOT NULL,
  `tglKomentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `likefoto`
--

CREATE TABLE `likefoto` (
  `likeID` int(11) NOT NULL,
  `fotoID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `tanggalLike` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `namaLengkap` varchar(255) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `password`, `email`, `namaLengkap`, `alamat`) VALUES
(1, 'sindi rahayu', 'admin', 'sindirahayu723@gmail.com', 'sindi rahayu', 'jaren'),
(8, 'sndrhyu1', 'sndrhyu123', 'sindi@gmail.com', 'sindi rahayu', 'Tangerang Selatan'),
(10, 'rahayu123', '123rahayu', 'sindirahayu421@gmail.com', 'rahayu', 'jaren'),
(11, 'cobacoba', 'coba123', 'coba3@gmail.com', 'coba', 'coba'),
(12, 'sindii', 'sindiw', 'sindirahayu@gmail.com', 'sindi rahayu', 'Tangerang'),
(13, 'jl', 'jl12', 'jl@gmail.com', 'jljl', 'fwejfiqw');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`albumID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`fotoID`),
  ADD KEY `albumID` (`albumID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD PRIMARY KEY (`komentarID`),
  ADD KEY `fotoID` (`fotoID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `likefoto`
--
ALTER TABLE `likefoto`
  ADD PRIMARY KEY (`likeID`),
  ADD KEY `fotoID` (`fotoID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `albumID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `fotoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `komentarfoto`
--
ALTER TABLE `komentarfoto`
  MODIFY `komentarID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likefoto`
--
ALTER TABLE `likefoto`
  MODIFY `likeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`albumID`) REFERENCES `album` (`albumID`),
  ADD CONSTRAINT `foto_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD CONSTRAINT `komentarfoto_ibfk_1` FOREIGN KEY (`fotoID`) REFERENCES `foto` (`fotoID`),
  ADD CONSTRAINT `komentarfoto_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `likefoto`
--
ALTER TABLE `likefoto`
  ADD CONSTRAINT `likefoto_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  ADD CONSTRAINT `likefoto_ibfk_2` FOREIGN KEY (`fotoID`) REFERENCES `foto` (`fotoID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
