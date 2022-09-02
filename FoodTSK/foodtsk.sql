-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 14, 2021 lúc 01:30 PM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `foodtsk`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `time` varchar(100) NOT NULL,
  `date` varchar(20) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `time`, `date`, `total`) VALUES
(5, '23:09', '2021-04-04', 30000),
(6, '07:40', '2021-04-05', 35000),
(7, '08:13', '2021-04-05', 69000),
(8, '20:49', '2021-04-05', 60000),
(9, '09:50', '2021-04-11', 119000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Food'),
(2, 'Drink');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detailsbill`
--

CREATE TABLE `detailsbill` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `bill` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `detailsbill`
--

INSERT INTO `detailsbill` (`id`, `product`, `bill`, `quantity`, `price`) VALUES
(6, 9, 5, 1, 10000),
(7, 10, 5, 1, 20000),
(8, 11, 6, 1, 15000),
(9, 10, 6, 1, 20000),
(10, 16, 7, 1, 69000),
(11, 1, 8, 2, 40000),
(12, 10, 8, 1, 20000),
(13, 1, 9, 1, 20000),
(14, 2, 9, 1, 20000),
(15, 6, 9, 1, 10000),
(16, 16, 9, 1, 69000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `CategoryID`, `quantity`, `price`) VALUES
(1, 'Khô Bò', 1, 20, '20000'),
(2, 'Chân Gà', 1, 20, '20000'),
(3, 'Da Heo Giòn', 1, 20, '15000'),
(4, 'Bánh Tráng Trộn', 1, 100, '25000'),
(5, 'Bánh Tráng Cuốn', 1, 50, '30000'),
(6, 'Xòa Lắc', 1, 200, '10000'),
(7, 'Kẹo Muối Ớt', 1, 500, '5000'),
(8, 'Lưỡi vịt', 1, 20, '20000'),
(9, 'Trành Chanh', 2, 200, '10000'),
(10, 'Trà Đào', 2, 50, '20000'),
(11, 'Milo Đá Dằm', 2, 40, '15000'),
(16, 'Lẩu Cay', 1, 50, '69000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `sex`, `role`) VALUES
(3, 'Minh Tiến', 'admin', 'c4ca4238a0b923820dcc509a6f75849b', 'Nam', 2),
(21, 'Phương Tiền', 'employee', 'c4ca4238a0b923820dcc509a6f75849b', 'Nam', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `detailsbill`
--
ALTER TABLE `detailsbill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill` (`bill`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cat` (`CategoryID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `detailsbill`
--
ALTER TABLE `detailsbill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_cat` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
