-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2025 at 03:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baigiuxetudong`
--

-- --------------------------------------------------------

--
-- Table structure for table `giaodichguixe`
--

CREATE TABLE `giaodichguixe` (
  `MaGiaoDich` int(11) NOT NULL,
  `MaKH` int(11) DEFAULT NULL,
  `BienSoXe` varchar(20) DEFAULT NULL,
  `ThoiGianVao` datetime NOT NULL,
  `ThoiGianRa` datetime DEFAULT NULL,
  `SoTienTinhPhi` decimal(10,2) DEFAULT NULL,
  `TrangThaiRa` enum('ChuaRa','DaRa') DEFAULT 'ChuaRa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` int(11) NOT NULL,
  `HoTen` varchar(100) NOT NULL,
  `SoDienThoai` varchar(15) NOT NULL,
  `CCCD` varchar(12) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DiaChi` text DEFAULT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `SoDu` decimal(15,2) DEFAULT 0.00,
  `LoaiKhachHang` enum('Thuong','Thang') DEFAULT 'Thuong',
  `NgayDangKyGoiThang` date DEFAULT NULL,
  `NgayHetHanGoiThang` date DEFAULT NULL,
  `TrangThai` enum('HoatDong','TamKhoa') DEFAULT 'HoatDong'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nhatkycamera`
--

CREATE TABLE `nhatkycamera` (
  `MaNhatKy` int(11) NOT NULL,
  `MaKH` int(11) DEFAULT NULL,
  `BienSoXe` varchar(20) DEFAULT NULL,
  `ThoiGian` datetime DEFAULT current_timestamp(),
  `HinhAnh` varchar(255) DEFAULT NULL,
  `SuKien` enum('Vao','Ra','BatThuong') DEFAULT NULL,
  `GhiChu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thanhtoan`
--

CREATE TABLE `thanhtoan` (
  `MaThanhToan` int(11) NOT NULL,
  `MaGiaoDich` int(11) DEFAULT NULL,
  `MaKH` int(11) DEFAULT NULL,
  `ThoiGianThanhToan` datetime DEFAULT current_timestamp(),
  `SoTienThanhToan` decimal(10,2) NOT NULL,
  `PhuongThuc` enum('TienMat','ViDienTu','TaiKhoanTru') DEFAULT 'TaiKhoanTru',
  `TrangThai` enum('ThanhCong','ThatBai') DEFAULT 'ThanhCong'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `giaodichguixe`
--
ALTER TABLE `giaodichguixe`
  ADD PRIMARY KEY (`MaGiaoDich`),
  ADD KEY `MaKH` (`MaKH`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKH`),
  ADD UNIQUE KEY `SoDienThoai` (`SoDienThoai`),
  ADD UNIQUE KEY `CCCD` (`CCCD`);

--
-- Indexes for table `nhatkycamera`
--
ALTER TABLE `nhatkycamera`
  ADD PRIMARY KEY (`MaNhatKy`),
  ADD KEY `MaKH` (`MaKH`);

--
-- Indexes for table `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD PRIMARY KEY (`MaThanhToan`),
  ADD KEY `MaGiaoDich` (`MaGiaoDich`),
  ADD KEY `MaKH` (`MaKH`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `giaodichguixe`
--
ALTER TABLE `giaodichguixe`
  MODIFY `MaGiaoDich` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MaKH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nhatkycamera`
--
ALTER TABLE `nhatkycamera`
  MODIFY `MaNhatKy` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thanhtoan`
--
ALTER TABLE `thanhtoan`
  MODIFY `MaThanhToan` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `giaodichguixe`
--
ALTER TABLE `giaodichguixe`
  ADD CONSTRAINT `giaodichguixe_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`);

--
-- Constraints for table `nhatkycamera`
--
ALTER TABLE `nhatkycamera`
  ADD CONSTRAINT `nhatkycamera_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`);

--
-- Constraints for table `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD CONSTRAINT `thanhtoan_ibfk_1` FOREIGN KEY (`MaGiaoDich`) REFERENCES `giaodichguixe` (`MaGiaoDich`),
  ADD CONSTRAINT `thanhtoan_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
