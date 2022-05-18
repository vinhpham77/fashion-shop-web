-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 18, 2022 lúc 05:00 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fashion-shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `username` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'tên tài khoản',
  `password` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'mật khẩu',
  `account_type` bit(1) NOT NULL DEFAULT b'0' COMMENT 'loại tài khoản(0-người dùng, 1-admin)',
  `fullname` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'họ tên',
  `current_address` text COLLATE utf8_bin NOT NULL COMMENT 'chỗ ở hiện tại',
  `email` varchar(50) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'email',
  `phone_number` varchar(10) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'số điện thoại',
  `shipping_address` text COLLATE utf8_bin NOT NULL COMMENT 'địa chỉ nhận hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`username`, `password`, `account_type`, `fullname`, `current_address`, `email`, `phone_number`, `shipping_address`) VALUES
('AliceMr', '123Alice', b'0', '', '46-Phan Đình Phùng-Phạm Kim Đồng-Đà Lạt', 'Alice1111@gmail.com', '0563238915', '46-Phan Đình Phùng-Phạm Kim Đồng-Đà Lạt'),
('Henlee', '123Henlee', b'0', 'Helenka', '02-Định Văn Của-Xuân Vinh-Rạch Giá', 'Henlee123@gmail.com', '0834554432', 'KBang-Chư Pưng-Gia Lai'),
('JamesJon', '123James', b'0', 'Jon Văn James', '61-Lý Thái Tổ-Xuân Diệu-Quy Nhơn', 'James222@gmail.com', '0905232261', '61-Lý Thái Tổ-Xuân Diệu-Quy Nhơn'),
('ThompsonRobert', '123Robert', b'0', ' Robert Thompson', ' Phụng Hoài Hảo-Hoài Nhơn-Bình Định', ' RobertThompson000@gmail.com', '0394778001', '53-Nguyễn Đình Thụ-Nguyễn Văn Cừ-Hồ Chí Minh'),
('admin', '123admin', b'1', 'Nguyễn Văn Admin', '77-Nguyễn Huệ-Quang Trung-Bình Định-\r\nFashion-shop', 'admin123@gmail.com', '0920392389', ''),
('johnweak', 'doggo123', b'0', 'John Wick', '123 Wall Sred, New York', 'johnweak@gg.com', '0398166111', '123 Chợ đầu mối');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `username` varchar(20) COLLATE ascii_bin NOT NULL COMMENT 'tên tài khoản',
  `prod_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `size` varchar(3) COLLATE ascii_bin NOT NULL COMMENT 'size',
  `quantity` int(11) NOT NULL COMMENT 'số lượng'
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `cate_id` tinyint(4) NOT NULL COMMENT 'mã danh mục',
  `cate_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT 'tên danh mục',
  `parent_cate_id` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'mã danh mục cha'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`cate_id`, `cate_name`, `parent_cate_id`) VALUES
(1, 'Nữ', 0),
(2, 'Hàng mới về', 1),
(3, 'Deal hot giảm 20%', 1),
(4, 'Áo', 1),
(5, 'Áo sơ mi', 4),
(6, 'Áo thun', 4),
(7, 'Áo croptop', 4),
(8, 'Chân váy', 1),
(9, 'Chân váy xếp li', 8),
(10, 'Chân váy chữ A', 8),
(11, 'Đầm', 1),
(12, 'Đầm maxi/voan', 11),
(13, 'Đầm thun', 11),
(14, 'Nam', 0),
(15, 'Hàng mới về', 14),
(16, 'Deal Hot giảm 10%', 14),
(17, 'Áo', 14),
(18, 'Áo sơ mi', 17),
(19, 'Áo thun', 17),
(20, 'Áo polo', 17),
(21, 'Quần', 14),
(22, 'Quần short', 21),
(23, 'Quần kaki', 21),
(24, 'Quần Jean', 21),
(25, 'Trẻ em', 0),
(26, 'Bé gái', 25),
(27, 'Áo bé gái', 26),
(28, 'Quần bé gái', 26),
(29, 'Váy bé gái', 26),
(30, 'Bé trai', 25),
(31, 'Áo bé trai', 30),
(32, 'Quần bé trai', 30),
(33, 'Sale ', 0),
(34, 'Sale 10%', 33),
(35, 'Sale 20%', 33),
(36, 'Thông tin', 0),
(37, 'Giới thiệu về 6AESN', 36),
(38, 'Chính sách hoàn trả', 36);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `description`
--

CREATE TABLE `description` (
  `prod_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `introduction` text COLLATE utf8mb4_bin NOT NULL COMMENT 'giới thiệu',
  `detail` text COLLATE utf8mb4_bin NOT NULL COMMENT 'chi tiết',
  `maintenance` text COLLATE utf8mb4_bin NOT NULL COMMENT 'bảo quản'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `username` varchar(20) COLLATE ascii_bin NOT NULL COMMENT 'tên tài khoản',
  `prod_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `size` varchar(3) COLLATE ascii_bin NOT NULL COMMENT 'size',
  `total_value` int(11) NOT NULL COMMENT 'tổng giá',
  `total_quantity` int(11) NOT NULL COMMENT 'tổng số lượng',
  `pay_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ngày thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `cate_id` tinyint(4) NOT NULL COMMENT 'mã danh mục',
  `prod_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'tên sản phẩm',
  `price` int(11) NOT NULL COMMENT 'giá',
  `discount` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'giảm giá(%)',
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `date_added` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ngày nhập sản phẩm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`prod_id`, `cate_id`, `prod_name`, `price`, `discount`, `quantity`, `date_added`) VALUES
(1, 5, 'ÁO SƠ MI LỤA ĐŨI', 1090000, '10.00', 200, '2022-05-17 13:19:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

CREATE TABLE `size` (
  `prod_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `s` int(11) NOT NULL DEFAULT 0 COMMENT 'size S',
  `m` int(11) NOT NULL DEFAULT 0 COMMENT 'size M',
  `x` int(11) NOT NULL DEFAULT 0 COMMENT 'size X',
  `l` int(11) NOT NULL DEFAULT 0 COMMENT 'size L',
  `xxl` int(11) NOT NULL DEFAULT 0 COMMENT 'size XXL'
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `UN_email` (`email`),
  ADD UNIQUE KEY `UN_phone_number` (`phone_number`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD KEY `FK_cart-prodID` (`prod_id`),
  ADD KEY `FK_cart-username` (`username`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cate_id`);

--
-- Chỉ mục cho bảng `description`
--
ALTER TABLE `description`
  ADD UNIQUE KEY `UN_des-prodID` (`prod_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD KEY `FK_order-username` (`username`),
  ADD KEY `FK_order-prodID` (`prod_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `FK_cate_id` (`cate_id`);

--
-- Chỉ mục cho bảng `size`
--
ALTER TABLE `size`
  ADD UNIQUE KEY `UN_size-prodID` (`prod_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `cate_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'mã danh mục', AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã sản phẩm', AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_cart-prodID` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`),
  ADD CONSTRAINT `FK_cart-username` FOREIGN KEY (`username`) REFERENCES `account` (`username`);

--
-- Các ràng buộc cho bảng `description`
--
ALTER TABLE `description`
  ADD CONSTRAINT `FK_des-prodID` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_order-prodID` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`),
  ADD CONSTRAINT `FK_order-username` FOREIGN KEY (`username`) REFERENCES `account` (`username`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_cate_id` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
