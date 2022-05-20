

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `username` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'tên tài khoản',
  `password` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'mật khẩu',
  `account_type` bit(1) NOT NULL DEFAULT b'0' COMMENT 'loại tài khoản(0-người dùng, 1-admin)',
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'họ tên',
  `current_address` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'chỗ ở hiện tại',
  `email` varchar(50) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'email',
  `phone_number` varchar(10) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'số điện thoại',
  `shipping_address` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'địa chỉ nhận hàng',
  PRIMARY KEY (`username`),
  UNIQUE KEY `UN_email` (`email`),
  UNIQUE KEY `UN_phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;



INSERT INTO `account` (`username`, `password`, `account_type`, `fullname`, `current_address`, `email`, `phone_number`, `shipping_address`) VALUES
('johnweak', 'doggo123', b'0', 'John Wick', '123 Wall Sred, New York', 'johnweak@gg.com', '0398166111', '123 Chợ đầu mối');



DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `username` varchar(20) COLLATE ascii_bin NOT NULL COMMENT 'tên tài khoản',
  `prod_id` int NOT NULL COMMENT 'mã sản phẩm',
  `size` varchar(3) COLLATE ascii_bin NOT NULL COMMENT 'size',
  `quantity` int NOT NULL COMMENT 'số lượng',
  KEY `FK_cart-prodID` (`prod_id`),
  KEY `FK_cart-username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;



DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `cate_id` tinyint NOT NULL AUTO_INCREMENT COMMENT 'mã danh mục',
  `cate_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'tên danh mục',
  `parent_cate_id` tinyint NOT NULL DEFAULT '0' COMMENT 'mã danh mục cha',
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;



INSERT INTO `category` (`cate_id`, `cate_name`, `parent_cate_id`) VALUES
(1, 'Nữ', 0),
(2, 'Hàng mới về', 1),
(3, 'Deal hot giảm 20%', 1),
(4, 'Áo', 1),
(5, 'Áo sơ mi', 4);





DROP TABLE IF EXISTS `description`;
CREATE TABLE IF NOT EXISTS `description` (
  `prod_id` int NOT NULL COMMENT 'mã sản phẩm',
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'giới thiệu',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'chi tiết',
  `maintenance` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'bảo quản',
  UNIQUE KEY `UN_des-prodID` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;



DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `username` varchar(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'tên tài khoản',
  `prod_id` int NOT NULL COMMENT 'mã sản phẩm',
  `size` varchar(3) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'size',
  `total_value` int NOT NULL COMMENT 'tổng giá',
  `total_quantity` int NOT NULL COMMENT 'tổng số lượng',
  `pay_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ngày thanh toán',
  KEY `FK_order-username` (`username`),
  KEY `FK_order-prodID` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;



DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `prod_id` int NOT NULL AUTO_INCREMENT COMMENT 'mã sản phẩm',
  `cate_id` tinyint NOT NULL COMMENT 'mã danh mục',
  `prod_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tên sản phẩm',
  `price` int NOT NULL COMMENT 'giá',
  `discount` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'giảm giá(%)',
  `quantity` int NOT NULL COMMENT 'số lượng',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ngày nhập sản phẩm',
  PRIMARY KEY (`prod_id`),
  KEY `FK_cate_id` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

INSERT INTO `product` (`prod_id`, `cate_id`, `prod_name`, `price`, `discount`, `quantity`, `date_added`) VALUES
(1, 5, 'ÁO SƠ MI LỤA ĐŨI', 1090000, '10.00', 200, '2022-05-17 13:19:02');


DROP TABLE IF EXISTS `size`;
CREATE TABLE IF NOT EXISTS `size` (
  `prod_id` int NOT NULL COMMENT 'mã sản phẩm',
  `s` int NOT NULL DEFAULT '0' COMMENT 'size S',
  `m` int NOT NULL DEFAULT '0' COMMENT 'size M',
  `x` int NOT NULL DEFAULT '0' COMMENT 'size X',
  `l` int NOT NULL DEFAULT '0' COMMENT 'size L',
  `xxl` int NOT NULL DEFAULT '0' COMMENT 'size XXL',
  UNIQUE KEY `UN_size-prodID` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;


ALTER TABLE `cart`
  ADD CONSTRAINT `FK_cart-prodID` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_cart-username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `description`
  ADD CONSTRAINT `FK_des-prodID` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;


ALTER TABLE `order`
  ADD CONSTRAINT `FK_order-prodID` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_order-username` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT;


ALTER TABLE `product`
  ADD CONSTRAINT `FK_cate_id` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

