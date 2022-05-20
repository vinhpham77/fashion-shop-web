-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2022 at 06:17 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ban-hang`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
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
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `password`, `account_type`, `fullname`, `current_address`, `email`, `phone_number`, `shipping_address`) VALUES
('AliceMr', '123Alice', b'0', 'AliceHan', '46-Phan Đình Phùng-Phạm Kim Đồng-Đà Lạt', 'Alice1111@gmail.com', '0563238915', '46-Phan Đình Phùng-Phạm Kim Đồng-Đà Lạt'),
('Henlee', '123Henlee', b'0', 'Helenka', '02-Định Văn Của-Xuân Vinh-Rạch Giá', 'Henlee123@gmail.com', '0834554432', 'KBang-Chư Pưng-Gia Lai'),
('JamesJon', '123James', b'0', 'Jon Văn James', '61-Lý Thái Tổ-Xuân Diệu-Quy Nhơn', 'James222@gmail.com', '0905232261', '61-Lý Thái Tổ-Xuân Diệu-Quy Nhơn'),
('ThompsonRobert', '123Robert', b'0', ' Robert Thompson', ' Phụng Hoài Hảo-Hoài Nhơn-Bình Định', ' RobertThompson000@gmail.com', '0394778001', '53-Nguyễn Đình Thụ-Nguyễn Văn Cừ-Hồ Chí Minh'),
('admin', '123admin', b'1', 'Nguyễn Văn Admin', '77-Nguyễn Huệ-Quang Trung-Bình Định-\r\nFashion-shop', 'admin123@gmail.com', '0920392389', ''),
('johnweak', 'doggo123', b'0', 'John Wick', '123 Wall Sred, New York', 'johnweak@gg.com', '0398166111', '123 Chợ đầu mối');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `username` varchar(20) COLLATE ascii_bin NOT NULL COMMENT 'tên tài khoản',
  `prod_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `size` varchar(3) COLLATE ascii_bin NOT NULL COMMENT 'size',
  `quantity` int(11) NOT NULL COMMENT 'số lượng'
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cate_id` tinyint(4) NOT NULL COMMENT 'mã danh mục',
  `cate_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT 'tên danh mục',
  `parent_cate_id` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'mã danh mục cha'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `category`
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
-- Table structure for table `description`
--

CREATE TABLE `description` (
  `prod_id` int(11) NOT NULL COMMENT 'mã sản phẩm',
  `introduction` text COLLATE utf8mb4_bin NOT NULL COMMENT 'giới thiệu',
  `detail` text COLLATE utf8mb4_bin NOT NULL COMMENT 'chi tiết',
  `maintenance` text COLLATE utf8mb4_bin NOT NULL COMMENT 'bảo quản'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `description`
--

INSERT INTO `description` (`prod_id`, `introduction`, `detail`, `maintenance`) VALUES
(1, '<p>Sơ mi nam tay ngắn. Trên nền vải denim được đánh bạc màu giả. Phía trước có túi ngực. Ống tay gập gấu khoảng 2-3cm. Khuy cài cùng màu với nền vải.</p>\r\n<p>Thiết kế sơ mi denim mang đến vẻ năng động và trẻ trung. Sắc đen ngả bạc giúp vẻ ngoài của các chàng trai thêm phần phong trần, mạnh mẽ. Thiết kế chú trọng vào \r\ntính cơ bản nên phù hợp để chàng diện vào nhiều dịp khác nhau.</p>', 'Cổ Áo: cổ đức<br>Tay Áo: tay cộc<br>Kiểu Áo: Regular fit<br>Độ dài: dài thường<br>Họa Tiết: trơn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(2, '<p>Áo sơ mi cổ đức, tay ngắn. Cài bằng hàng khuy phía trước. Dáng regular kết hợp với chất liệu lụa cao cấp giúp bạn mặc thoải mái và dễ chịu. MIx cùng quần jeans màu đen, sooc để có set đồ ăn ý nhất nhé!</p>', 'Cổ Áo: khác<br>Tay Áo: tay ngắn<br>Kiểu Áo: Regular<br>Độ dài: dài thường<br>Họa Tiết: in hình', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(3, '<p>Áo sơ mi dáng slim fit với cổ đức và ống tay dài. Họa tiết kẻ mờ. Độ dài vừa phải. Có viền ngoài để giấu khuy cài.</p>\r\n<p>Những chiếc áo sơ mi kẻ luôn được lòng các quý ông công sở. Thiết kế chú trọng đến sự tối giản sẽ tôn lên vẻ ngoài phong độ, chỉn chu của người mặc. Dáng slim fit ôm nhẹ phù hợp để bạn mặc khi diện vest và quần Âu.', 'Cổ Áo: cổ đức<br>Tay Áo: tay dài<br>Kiểu Áo: Slim fit<br>Độ dài: dài thường<br>Họa Tiết: kẻ', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(4, '<p>Áo sơ mi cổ đức phối màu hình tam giác. Tay dài bo gấu và 2 khuy cài đính kèm. Vạt áo hình phía trước. Cài bằng hàng khuy ẩn tà phía trước.</p>\r\n<p>Kiểu dáng Slim fit thiết kế form ôm nhẹ, tôn đường nét của cơ thể. Tông màu lịch lãm, dễ phối nhiều trang phục như quần jean, short, quần tây... Áo có thể sơ vin hoặc thả suông nhờ tà lượn thời trang.</p>', 'Cổ Áo: cổ đức<br>Tay Áo: tay dài<br>Kiểu Áo: Slim fit<br>Độ dài: dài thường, Oversize<br>Họa Tiết: trơn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(5, '<p>Áo sơ mi cổ đức. Tay dài bo gấu và 2 khuy cài đính kèm. 1 túi vuông trước ngực. Cài bằng hàng khuy phía trước. Vải họa tiết tinh tế.</p>\r\n<p>Kiểu dáng Slim fit thiết kế form ôm nhẹ, tôn đường nét của cơ thể. Tông màu lịch lãm, dễ phối nhiều trang phục như quần jean, short, quần tây... Áo có thể sơ vin hoặc thả suông nhờ tà lượn thời trang.</p>', 'Cổ Áo: cổ đức<br>Tay Áo: tay dài<br>Kiểu Áo: Slim fit<br>Độ dài: dài thường<br>Họa Tiết: khác', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(6, '<p>Zuýp chữ A 2 lớp dáng trên gối. Có 1 móc kim loại tạo kiểu phía trước. 2 viền túi giả 2 bên. Cài bằng khóa ẩn sau lưng.</p>\r\n<p>gợi ý cho bạn cứ mix theo combo ton-sur-ton với áo vest đồng bộ MS 67M7076 sẽ có vẻ ngoài trông thật sành điệu, tự tin ghi điểm tuyệt đối trong mắt người đối diện. Muốn làm mới phong cách thời trang công sở của mình, nhất định phải có ít nhất một kiểu chân váy như thế này trong tủ đồ của mình nhé!</p>', 'Kiểu dáng: chữ A<br>Độ dài: trên gối<br>Chất liệu: Tuysi', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(7, '<p>Zuýp chữ A 2 lớp. Mặt trước dưới gấu thêu chữ và đính hoa nổi khác màu tạo nổi bật. Cài bằng khóa kéo ẩn sau lưng.</p>\r\n<p>Với chiều dài trên gối cùng chất liệu Tuysi cao cấp giúp nàng trở nên trẻ trung và năng động hơn. Mix cùng áo blazer, áo sơ mi kiểu, áo thun basic là bạn có thể tự tin bước ra ngoài rồi!</p>', 'Kiểu dáng: chữ A<br>Độ dài: trên gối<br>Họa tiết: trơn<br>Chất liệu: Tuysi', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(8, '<p>Zuýp chữ A  2 lớp. Mặt trước có hàng khuy bọc vải kiểu chéo trang trí. Xẻ tạo kiểu dưới gấu. </p>\r\n<p>Chất liệu Tuysi không quá dày cũng không quá mỏng tạo form dáng cứng cáp, không xù lông đặc biệt không nhăn, dễ dàng tạo sự thoải mái, không gò bó và mang đến nét đẹp năng động, trẻ trung cho người mặc. Chân váy chữ A công sở cũng ghi điểm nhờ sự “thân thiện” có thể kết hợp cùng áo sơ mi, áo thun… đầy ấn tượng.</p>', 'Kiểu dáng: chữ A<br>Độ dài: trên gối<br>Họa tiết: trơn<br>Chất liệu: Tuysi', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(9, '<p>Zuýp chữ A 2 lớp cạp có đai liền và đỉa ở giữa. Phom chữ A basic. Trang trí bằng các đường chần chỉ nổi màu trắng tạo điểm nhấn.</p>\r\n<p>Sử dụng chất vải Tuysi  bên trong có lớp lót dính liền tạo cho nàng cảm giác thoải mái khi diện thiết kế này. Dáng chữ A dễ phối hợp với nhiều kiểu áo, và phụ kiện giúp nàng trở nên năng động và tự tin hơn.</p>', 'Kiểu dáng: chữ A<br>Độ dài: trên gối<br>Họa tiết: trơn<br>Chất liệu: Tuysi', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(10, '<p>Zuýp chữ A dáng dài ngang bắp. Cạp cao. Mặt trước trang trí hàng khuy làm điểm nhấn. Cài bằng khóa kéo ẩn phía sau. Có thể mix cùng áo croptop đồng bộ.</p>\r\n<p>Chất liệu vải Thô xước mang lại cảm giác thoáng mát, thoải mái cho người mặc bởi khả năng hút ẩm cao, thấm hút tốt.</p>', 'Kiểu dáng: chữ A<br>Độ dài: ngang bắp<br>Họa tiết: trơn<br>Chất liệu: thô', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(11, 'Áo phông chất thun, dáng Regular, độ dài thoải mái. Tay cộc, cổ tròn. Phía trước in lệch chữ Symphony. Phía sau in hình thiên nhiên khổ lớn.\r\nMột mẫu áo năng động, phối hình in sáng màu phù hợp cho chàng trẻ trung. Thiết kế có độ rộng thoải mái, cover tốt những khuyết điểm mà người mặc chưa tự tin.\r\nMàu sắc: Ghi khói - Đen', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Khác\r\nTay áo: Tay cộc\r\nKiểu dáng: Regular\r\nĐộ dài: Dài thường\r\nHọa tiết: In hình\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(12, 'Áo thun dáng Regular, độ dài vừa phải, tay cộc, cổ tròn. Phía trước in hình và chữ bắt mắt, trẻ trung.\r\nĐây là một chiếc áo thun cơ bản, năng động dành cho các chàng trai mùa hè. Gam đen dễ phối được kết hợp cùng hình in sáng màu trẻ trung. Dáng Regular vừa vặn giúp người mặc trông gọn gàng hơn.\r\nMàu sắc: Đen', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Khác\r\nTay áo: Tay cộc\r\nKiểu dáng: Regular\r\nĐộ dài: Dài thường\r\nHọa tiết: In hình\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(13, 'Áo phông chất thun trơn, tay ngắn, cổ tròn. Độ dài thoải mái. Phía trước có hình in phong cách Tropical phối cùng chữ.\r\nMột thiết kế tràn ngập hơi thở mùa hè dành cho những chàng trai hiện đại. Gam màu tươi sáng hứa hẹn sẽ giúp sáng bừng diện mạo của người mặc. Độ dài thoải mái phù hợp cho những chàng thích mặc rộng rãi. Chất thun mềm mại và thấm hút mồ hôi tốt.\r\nMàu sắc: Trắng - Nâu cà phê', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ tròn\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Trơn\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(14, 'Áo thun dáng cơ bản, ôm nhẹ nhưng không bó, có động rộng nhất định. Tay ngắn, cổ tròn. Phía trước được in một dòng trích dẫn từ NTK của IVY men.\r\nNhững chiếc áo phông cơ bản rất được lòng chàng khi mùa hè đến. Một chiếc áo trơn in quote vừa đảm bảo phù hợp để phối cùng mọi set đồ lại vừa năng động, trẻ trung. Với những phiên bản của mẫu áo này, chàng có thể thoải mái mix-match theo nhiều phong cách khác nhau.\r\nMàu sắc: Trắng - Đen - Nude - Xanh oliu - Xanh cổ vịt nhạt', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ tròn\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Trơn\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(15, 'Áo thun cổ tròn, tay ngắn, độ dài vừa phải. Phía trước được thêu chữ Sustainable cách điệu.\r\nChất liệu thun đặc trưng của IVY moda luôn đảm bảo người mặc sẽ cảm thấy thoải mái và dễ chịu nhất suốt cả ngày hè dài. Chữ thêu đơn giản phía trước giúp tổng thể trẻ trung và năng động hơn. Bạn có thể phối áo thun cùng quần jean hay quần vải đều phù hợp,\r\nMàu sắc: Cam - Xanh tím than', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ tròn\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Trơn\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(16, 'Chất liệu vải pique dệt - cotton sợi dệt mặt lưới, tạo ra được độ mềm và thoáng cho những người ưa vận động hay chơi thể thao, độ thấm hút mồ hôi tốt và có khả năng co giãn 4 chiều, đem đến cảm giác vô cùng thoải mái, dễ chịu khi sử dụng.\r\nForm áo Regular viền chun co giãn ở tay áo giúp người mặc trở nên khỏe khoắn và năng động hơn. Phần cổ áo được may bằng thun co giãn với 3 khuy cài, viền tay bằng vải từ thân áo tạo nên thiết kế mới mẻ, trẻ trung và đầy sức sống.\r\nMàu sắc: Xanh Nước Biển - Trắng', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ bo\r\nTay áo: Tay ngắn\r\nKiểu dáng: Regular\r\nĐộ dài: Dài thường\r\nHọa tiết: Khác\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(17, 'Chất liệu vải pique dệt - cotton sợi dệt mặt lưới, tạo ra được độ mềm và thoáng cho những người ưa vận động hay chơi thể thao, độ thấm hút mồ hôi tốt và có khả năng co giãn 4 chiều, đem đến cảm giác vô cùng thoải mái, dễ chịu khi sử dụng.\r\nForm áo Regular Fit viền chun co giãn ở tay áo giúp người mặc trở nên khỏe khoắn và năng động hơn. Phần cổ áo được may bằng thun co giãn với 2 khuy cài, viền tay bằng vải từ thân áo tạo nên thiết kế mới mẻ, trẻ trung và đầy sức sống.\r\nMàu sắc: Xanh Nước Biển - Trắng', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ đức\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Trơn\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(18, 'Chất liệu vải pique dệt - cotton sợi dệt mặt lưới, tạo ra được độ mềm và thoáng cho những người ưa vận động hay chơi thể thao, độ thấm hút mồ hôi tốt và có khả năng co giãn 4 chiều, đem đến cảm giác vô cùng thoải mái, dễ chịu khi sử dụng.\r\nForm áo Regular Fit viền chun co giãn ở tay áo giúp người mặc trở nên khỏe khoắn và năng động hơn. Phần cổ áo được may bằng vải từ thân áo với 3 khuy cài tạo nên thiết kế mới mẻ, trẻ trung và đầy sức sống.\r\nMàu sắc: Kẻ Xanh Dương', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ bo\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Kẻ\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(19, 'Chất liệu vải pique dệt - cotton sợi dệt mặt lưới, tạo ra được độ mềm và thoáng cho những người ưa vận động hay chơi thể thao, độ thấm hút mồ hôi tốt và có khả năng co giãn 4 chiều, đem đến cảm giác vô cùng thoải mái, dễ chịu khi sử dụng.\r\nPhần tay áo được bo viền cùng phần cổ áo được may bằng vải từ thân áo với 3 khuy kết hợp với đường kẻ ngang tạo nên thiết kế mới mẻ, trẻ trung và đầy sức sống.\r\nMàu sắc: Kẻ Đen - Kẻ Trắng', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Áo\r\nCổ áo: Cổ pyjama\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Kẻ\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(20, 'Chất liệu vải pique dệt - cotton sợi dệt mặt lưới, tạo ra được độ mềm và thoáng cho những người ưa vận động hay chơi thể thao, độ thấm hút mồ hôi tốt và có khả năng co giãn 4 chiều, đem đến cảm giác vô cùng thoải mái, dễ chịu khi sử dụng.\r\nForm áo Regular Fit, thiết kế trở nên đắt giá khi được bo chun co giãn 100% ở cổ, gấu xẻ 2 bên. Các đường kẻ và phối nhiều màu sắc trở nên bắt mắt và hợp xu hướng.\r\nMàu sắc: Kẻ Trắng', 'Nhóm sản phẩm: Áo\r\nCổ áo: Cổ bo\r\nTay áo: Tay ngắn\r\nKiểu dáng: Khác\r\nĐộ dài: Dài thường\r\nHọa tiết: Kẻ\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(21, 'Quần sooc ngang gối dáng Regular. Có 2 túi chéo, 2 túi vuông có nắp bên ống quần. Có dây kéo rút, cạp chun co giãn.\r\nDễ dàng kết hợp cùng nhiều trang phục như áo thun, sơ mi,... mát mẻ. Gam màu lạ mắt trẻ trung dễ dàng phối với nhiều trang phục. Thiết kế thời trang, mang lại vẻ năng động và trẻ trung\r\nMàu sắc: Đen - Gold', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Regular\r\nĐộ dài: Ngang đùi\r\nHọa tiết: Trơn\r\nChất liệu: Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(22, 'Quần lửng khaki cạp chun co giãn có dây kéo rút. 2 túi chéo và 2 túi vuông có nắp phía sau. Thiết kế ấn tượng nhưng không kém phần ấn tượng cho nam giới diện mạo cuốn hút. Màu sắc cơ bản, độ dài ngang gối, có thể linh hoạt phối hợp với nhiều trang phục khác nhau.\r\nMàu sắc: Ghi Khói - Xanh Lơ', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Ngang gối\r\nHọa tiết: Trơn\r\nChất liệu: Khaki', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(23, 'Quần lửng ngang gối. Có 2 túi phía trước và 2 túi có khuy cài phía sau. Nhấn đường ly cố định 2 bên ống quần. Cài phía trước bằng khóa kéo và khuy.\r\nKhông chỉ là chất vải Khaki thông thường mà còn được phối 50% sợi Tencel giúp thiết kế có độ mềm, mát hơn quần khaki thông thường. Màu sắc cơ bản, độ dài ngang gối, có thể linh hoạt phối hợp với nhiều trang phục khác nhau trong mùa hè.\r\nMàu sắc: Xanh Oliu - Bạc Hà ', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Ngang gối\r\nHọa tiết: Trơn\r\nChất liệu: Khaki, 50% sợi Tencel\r\n', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(24, 'Quần lửng cạp cao có đỉa, khuy cài lệch 1 bên. 2 túi chéo và 2 túi vuông phía sau. Chiều dài ngang gối. Cài bằng dây khóa kéo và khuy\r\nLà chiếc quần lửng nam là must-have-item (món đồ không thể thiếu) của bất cứ quý ông nào. Sử dụng chất vải thô cotton họa tiết kẻ với độ thông thoáng, thoải mái phù hợp với tất cả các mùa, đặc biệt là mùa hè với tính ứng dụng cao trong đời sống hàng ngày. Đây cũng là chiếc quần tương đối dễ phối nên cánh màu râu có thể tự tin mix & match.\r\nMàu sắc: Kẻ Xanh Lơ', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Ngang gối\r\nHọa tiết: Kẻ\r\nChất liệu: Thô', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(25, 'Quần lửng cạp cao có đỉa. 2 túi chéo và 2 túi vuông phía sau. Chiều dài ngang gối. Cài bằng dây khóa kéo và khuy\r\nLà chiếc quần lửng nam là must-have-item (món đồ không thể thiếu) của bất cứ quý ông nào. Sử dụng chất vải thô họa tiết kẻ với độ thông thoáng, thoải mái phù hợp với tất cả các mùa, đặc biệt là mùa hè với tính ứng dụng cao trong đời sống hàng ngày. Đây cũng là chiếc quần tương đối dễ phối nên cánh màu râu có thể tự tin mix & match.\r\nMàu sắc: Kẻ Xanh Tím Than', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Ngang gối\r\nHọa tiết: Kẻ\r\nChất liệu: Thô', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(26, 'Quần khaki, có 2 túi có nắp phía giữa ống quần cài khuy. Cài phía trước bằng khóa kéo và khuy, cạp chần chun co giãn có đỉa. Ống quần bó, chần chun.\r\nChất vải khaki ít nhàu, không bai, không xù. Đường may chỉn chu, tinh tế khiến quần rất bền. Không chỉ phổ biến nơi công sở, bạn hoàn toàn có thể biến tấu cho riêng mình bằng cách mix-match cùng sơ mi, áo thun hoặc len mỏng để trở thành chàng trai lịch thiệp trong mọi trường hợp.\r\nMàu sắc: Xanh Tím Than - Đen - Bạc', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Ngang mắt cá chân\r\nHọa tiết: Trơn\r\nChất liệu: Khaki', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(27, 'Quần khaki ống bo chun co giãn kiểu bó, cạp chần chun có dây kéo rút. Có túi phía trước và 2 túi có nắp phía sau.\r\nQuần khaki phom dáng có độ suông nhẹ vừa vặn. Thiết kế basic không kén người mặc. Quần đứng dáng chỉn chu với đường may tỉ mỉ đến từng chi tiết. Có thể sơ vin hoặc không đều phù hợp, dễ kết hợp với nhiều trang phục theo nhiều phong cách khác nhau.\r\nMàu sắc: Gold - Đen', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Ngang mắt cá chân\r\nHọa tiết: Trơn\r\nChất liệu: Khaki', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(28, 'Quần dài khaki cạp có đỉa. 2 túi trước, 2 viền túi có khuy cài phía sau. Cài bằng khóa kéo và khuy.\r\nĐược may từ chất liệu Khaki thiết kế đơn giản nhưng đem đến cho người mặc cảm giác thoải mái dễ chịu. Bạn có thể kết hợp sản phẩm với trang phục, phụ kiện phù hợp để có một diện mạo hợp thời, mang đậm \"Gu\" của riêng mình.\r\nMàu sắc: Gold - Đen - Xanh Tím Than', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Slim\r\nĐộ dài: Qua mắt cá chân\r\nHọa tiết: Trơn\r\nChất liệu: Khaki', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(29, 'Quần dài khaki kiểu dáng Slim, đai quần có đỉa. 2 túi chéo trước, 2 túi sau có khuy cài. Thiết kế tối giản, các chi tiết may tỉ mỉ, tinh tế, mang đến diện mạo chỉn chu, lịch lãm cho người mặc. Cài bằng khóa kéo và khuy cài.\r\nChất liệu Khaki thoáng mát, thấm hút mồ hôi tốt và khả năng giữ bền form dáng sau nhiều lần giặt.\r\nMàu sắc: Đen - Be', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Slim\r\nĐộ dài: Qua mắt cá chân\r\nHọa tiết: Trơn\r\nChất liệu: Khaki', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(30, 'Quần khaki, có 2 túi có nắp phía giữa ống quần cài khuy. Cài phía trước bằng khóa kéo và khuy, có dây kéo rút.\r\nChất vải khaki ít nhàu, không bai, không xù. Đường may chỉn chu, tinh tế khiến quần rất bền. Không chỉ phổ biến nơi công sở, bạn hoàn toàn có thể biến tấu cho riêng mình bằng cách mix-match cùng sơ mi, áo thun hoặc len mỏng để trở thành chàng trai lịch thiệp trong mọi trường hợp.\r\nMàu sắc: Rêu Khói - Xanh Tím Than', 'Dòng sản phẩm: Men\r\nNhóm sản phẩm: Quần\r\nKiểu dáng: Khác\r\nĐộ dài: Qua mắt cá chân\r\nHọa tiết: Trơn\r\nChất liệu: Khaki', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(31, 'Quần sooc bò màu đen dáng regular fit. Có 5 túi. Cạp sử dụng khóa và khuy kim loại, mặt trước rách cá tính. Màu đen hiện đại, phù hợp với thời trang dạo phố.\r\nDenim là một loại vải được dệt từ sợi bông trong đó các sợi bông được nhuộm dệt từ 1 sợi màu và 1 sợi trắng. Vải denim có độ bền cực kỳ cao. \r\nMàu sắc: Đen', 'Dòng sản phẩm	Men\r\nNhóm sản phẩm	Quần\r\nKiểu dáng	Regular fit\r\nĐộ dài	        Ngang gối\r\nHọa tiết	Trơn\r\nChất liệu	Denim', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(32, 'Quần jean dài chạm mắt cá chân. Dáng quần ôm nhẹ, ống đứng. Chất liệu vải denim trơn, dày dặn. Đằng trước có khuy cài và khóa kéo. Phía sau có túi ngang, phía trước có 2 túi chéo.\r\nMàu sắc: Đen', 'Dòng sản phẩm	Men\r\nNhóm sản phẩm	Quần\r\nKiểu dáng	Slim fit\r\nĐộ dài	        Qua mắt cá chân\r\nHọa tiết	Trơn\r\nChất liệu	Denim', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(33, 'Quần jeans ống đứng. Gấu lật. Có 5 túi. Mặt trước mài sáng. Cài phía trước bằng khóa kéo và khuy. Dáng quần Slim fit là sản phẩm must-have trong tủ đồ của bạn vì tính ứng dụng rất cao. Phù hợp với mọi tỉ lệ cơ thể cũng như biến hóa với gần như tất cả outfit của bạn. \r\nMàu sắc: Xanh Lơ', 'Dòng sản phẩm	Men\r\nNhóm sản phẩm	Quần\r\nKiểu dáng	Slim fit\r\nĐộ dài	        Qua mắt cá chân\r\nHọa tiết	Trơn\r\nChất liệu	Denim', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(34, 'Quần jeans ống đứng. Gấu lật. Có 5 túi. Mặt trước mài sáng. Cài phía trước bằng khóa kéo và khuy. Dáng quần Slim fit là sản phẩm must-have trong tủ đồ của bạn vì tính ứng dụng rất cao. Phù hợp với mọi tỉ lệ cơ thể cũng như biến hóa với gần như tất cả outfit của bạn. \r\nMàu sắc: Xanh Lơ', 'Dòng sản phẩm	Men\r\nNhóm sản phẩm	Quần\r\nKiểu dáng	Slim fit\r\nĐộ dài	        Qua mắt cá chân\r\nHọa tiết	Trơn\r\nChất liệu	Denim', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(35, 'Quần jeans ống suông, dài qua mắt cá chân. Kiểu bạc màu. Gấu lật. Có 5 túi. Cài phía trước bằng khóa kéo và khuy.\r\nMàu sắc: Xanh Lơ - Đen', 'Dòng sản phẩm	Men\r\nNhóm sản phẩm	Quần\r\nKiểu dáng	Slim fit\r\nĐộ dài	        Qua mắt cá chân\r\nHọa tiết	Trơn\r\nChất liệu	Denim', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(36, 'Set áo thun được in hình logo mặt cười IVY Kids. Bộ bao gồm áo suông, tay phồng và quần giả váy vạt lệch. Thiết kế nữ tính nhưng vẫn rộng rãi và thoải mái, phù hợp để bé mặc đi học hoặc đi chơi. Hình in sắc nét, tươi sáng làm tăng thêm độ đáng yêu.\r\nMàu sắc: Nude - Hồng', 'Dòng sản phẩm	Girl\r\nNhóm sản phẩm	Áo\r\nCổ áo	        Cổ tròn\r\nTay áo	        Tay ngắn\r\nKiểu dáng	Xuông\r\nĐộ dài	        Dài thường\r\nHọa tiết	Trơn\r\nChất liệu	Thun', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(37, 'Set áo thun được in hình logo mặt cười IVY Kids. Bộ bao gồm áo suông, tay phồng và quần giả váy vạt lệch. Thiết kế nữ tính nhưng vẫn rộng rãi và thoải mái, phù hợp để bé mặc đi học hoặc đi chơi. Hình in sắc nét, tươi sáng làm tăng thêm độ đáng yêu.\r\nMàu sắc: Nude - Hồng', '\r\nDòng sản phẩm	Girl\r\nNhóm sản phẩm	Áo\r\nCổ áo	        Cổ tròn\r\nTay áo	        Tay ngắn\r\nKiểu dáng	Xuông\r\nĐộ dài	        Dài thường\r\nHọa tiết	Trơn\r\nChất liệu	Thun', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(38, 'Set thun bao gồm áo 2 dây và quần ngắn. Dáng áo suông, quần ngắn và hơi ôm. Trên áo và quần có chữ in trang trí COOL. Màu sắc bắt mắt và đáng yêu.\r\nMàu sắc: Hồng san hô', 'Dòng sản phẩm	Girl\r\nNhóm sản phẩm	Áo\r\nCổ áo	        Cổ vuông\r\nTay áo	        2dây\r\nKiểu dáng	Xuông\r\nĐộ dài	        Dài thường\r\nHọa tiết	Trơn\r\nChất liệu	Thun', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(39, 'Một set bao gồm áo ngắn tay và quần lửng có cùng màu. Màu của set sẽ được giao ngẫu ngẫu nhiên.\r\nSet thun có chất liệu mềm, nhẹ, thoáng, phù hợp để bé diện vào mùa hè. Quần lửng gọn gàng, năng động giúp bé có những phút giây vui chơi thoải mái.\r\nMàu sắc: Tím lavender - Xanh lơ', 'Dòng sản phẩm	Girl\r\nNhóm sản phẩm	Áo\r\nCổ áo	        Cổ tròn\r\nTay áo	        Tay ngắn\r\nKiểu dáng	Xuông\r\nĐộ dài	        Dài thường\r\nHọa tiết	Trơn\r\nChất liệu	Thun', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(40, 'Bộ thun bao gồm áo ngắn tay và quần đùi. Dáng áo và quần hơi ôm nhẹ, tạo độ gọn gàng. Xuyên suốt set đồ là họa tiết nhí đáng yêu và nữ tính. Set đồ này phù hợp để các bé mặc khi ở nhà.\r\nMàu sắc: Họa tiết Trắng - Họa tiết Hồng san hô', '\r\nDòng sản phẩm	Girl\r\nNhóm sản phẩm	Áo\r\nCổ áo	        Cổ tròn\r\nTay áo	        Tay ngắn\r\nKiểu dáng	Xuông\r\nĐộ dài	        Dài thường\r\nHọa tiết	Chấm bi,Hoa\r\nChất liệu	Thun', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(41, 'Quần sooc thun, độ dài ngang đùi. Dáng quần hơi ôm nhẹ. Phía trước có nơ buộc xinh xắn. Chất liệu thun thoáng mát, nhẹ nhàng.\r\nMàu sắc: Hồng phấn - Họa tiết be', '\r\nDòng sản phẩm	Girl\r\nNhóm sản phẩm	Quần\r\nKiểu dáng	Khác\r\nĐộ dài	        Ngang đùi\r\nHọa tiết	Chấm bi,Trơn\r\nChất liệu	Thun', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(42, 'Quần sooc vải thô, cạp chun co giãn. Xếp ly 2 bên. In hình họa tiết nhiều màu tạo điểm nhấn.\r\nMàu sắc: Họa tiết Trắng', 'Dòng sản phẩm	Girl\r\nNhóm sản phẩm	Quần\r\nKiểu dáng	Giả váy\r\nĐộ dài	        Ngang đùi\r\nHọa tiết	Họa tiết khác\r\nChất liệu	Thô', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(43, 'Quần sooc cạp chun co giãn có đính nơ trang trí. 2 túi chéo 2 bên. Ống quần ngang đùi, thêu hoa nổi cùng màu.\r\nMàu sắc: Cam Đào - Vàng hoa cúc', 'Dòng sản phẩm	Girl\r\nNhóm sản phẩm	Quần\r\nKiểu dáng	Ống đứng\r\nĐộ dài	        Ngang đùi\r\nHọa tiết	Trơn\r\nChất liệu	Thô', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(44, 'Quần sooc cạp chun co giãn có đính nơ trang trí. 2 túi chéo 2 bên. Ống quần ngang đùi, thêu hoa nổi cùng màu.\r\nMàu sắc: Cam Đào - Vàng hoa cúc', '\r\nDòng sản phẩm	Girl\r\nNhóm sản phẩm	Quần\r\nKiểu dáng	Ống đứng\r\nĐộ dài	        Ngang đùi\r\nHọa tiết	Trơn\r\nChất liệu	Thô', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(45, 'Jumpsuit bé gái cổ tròn, tay sát nách. Eo chiết có chần chun co giãn. Quần ngắn ngang đùi, 2 túi vuông 2 bên. Cài bằng hàng khuy phía trước. Mặt sau lưng có đường chần chun co giãn tạo kiểu.\r\nMàu sắc: Họa tiết Be - Họa tiết chì - Hồng Phấn', 'Dòng sản phẩm	Girl\r\nNhóm sản phẩm	Jumpsuit\r\nCổ áo	        Cổ tròn\r\nTay áo	        Tay ngắn\r\nKiểu dáng	Xuông\r\nHọa tiết	Chấm bi,Hoa,Trơn\r\nChất liệu	Thun', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(46, 'Đầm thun dáng suông, độ dài ngang gối, tay áo lửng. Trên đầm được in hình chú cún đáng yêu. \r\nChiếc đầm này phù hợp để bé gái diện đi chơi trong mùa hè.\r\nMàu sắc: Cam - Đỏ', '\r\nDòng sản phẩm	Girl\r\nNhóm sản phẩm	Đầm\r\nCổ áo	        Cổ tròn\r\nTay áo	        Tay ngắn\r\nKiểu dáng	Suông\r\nĐộ dài	        Ngang gối\r\nHọa tiết	Trơn\r\nChất liệu	Thun', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(47, 'Đầm thun dáng suông, độ dài ngang gối, tay áo lửng. Trên đầm được in hình chú cún đáng yêu. \r\nChiếc đầm này phù hợp để bé gái diện đi chơi trong mùa hè.\r\nMàu sắc: Cam - Đỏ', '\r\nDòng sản phẩm	Girl\r\nNhóm sản phẩm	Đầm\r\nCổ áo	        Cổ tròn\r\nTay áo	        Tay ngắn\r\nKiểu dáng	Suông\r\nĐộ dài	        Ngang gối\r\nHọa tiết	Trơn\r\nChất liệu	Thun', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(48, 'Đầm dáng babydoll bao gồm 2 lớp: lớp thun trong dài trên gối, lớp voan bay bên ngoài dài qua gối. Phía đằng trước áo đầm có hình in hoa rực rỡ. Đầm cổ tròn và tay ngắn dáng cơ bản.\r\nChiếc đầm đáng yêu này sẽ là lựa chọn tuyệt vời cho sự kiện đặc biệt của các bé gái. Dáng đầm công chúa dễ thương biến mọi cô nàng nhỏ trở thành tâm điểm của bữa tiệc.\r\nMàu sắc: Hồng san hô', 'Dòng sản phẩm	Girl\r\nNhóm sản phẩm	Đầm\r\nCổ áo	        Cổ tròn\r\nTay áo	        Tay ngắn\r\nKiểu dáng	Đầm xòe\r\nĐộ dài	        Ngang gối\r\nHọa tiết	Trơn\r\nChất liệu	Thun', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(49, 'Thiết kế đầm lụa mềm mại, dễ thương dành cho bé gái. Trên cầu vai, phía trước đầm và từng tầng của tà váy đều được nhấn chun và béo đáng yêu. Dáng đầm xòe tự nhiên, rộng rãi, phù hợp với mọi bạn nhỏ.\r\nMàu sắc: Họa tiết Đỏ mận', '\r\nDòng sản phẩm	Girl\r\nNhóm sản phẩm	Đầm\r\nCổ áo	        Cổ vuông\r\nTay áo	        Tay ngắn\r\nKiểu dáng	Đầm xòe\r\nĐộ dài	        Trên gối\r\nHọa tiết	Họa tiết khác\r\nChất liệu	Lụa\r\n', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(50, 'Đầm dáng babydoll được nhấn 3 tầng, dáng xòe, độ dài qua gối. Tay lửng phồng bản lớn. Họa tiết hoa nhí nhiều màu sắc được sử dụng trong toàn bộ thiết kế.\r\nChiếc đầm nữ tính này sẽ là item mẹ không thể bỏ qua cho bé nhà mình. Dáng đầm đậm chất công chúa sẵn sàng khiến mọi cô bé trở nên lộng lẫy không tưởng.\r\nMàu sắc: Họa tiết Xanh táo - Họa tiết Đỏ thẫm', '\r\nDòng sản phẩm	Girl\r\nNhóm sản phẩm	Đầm\r\nCổ áo	        Cổ tròn\r\nTay áo	        Tay ngắn\r\nKiểu dáng	Đầm xòe\r\nĐộ dài	        Trên gối\r\nHọa tiết	Hoa\r\nChất liệu	Thô\r\n', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(51, '<p>Áo thun bé trai trơn, cổ tròn, tay cộc. Phía trước áo được in hình sư tử dễ thương. Kỹ thuật in nổi sắc nét, hút mắt.</p>\r\n', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(52, '<p>Áo thun rộng rãi dành cho bé trai năng động. Hình khủng long nghịch ngợm cùng dòng chữ đáng yêu sẽ khiến các bé thích mê chiếc áo này. Bố mẹ đừng quên cho con diện mẫu áo này khi đi chơi nhé!</p>', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(53, '<p>Áo thun cổ tròn, tay ngắn, dáng Regular rộng rãi. Áo trơn không họa tiết, phía trước được phối túi hộp có nắp.</p>', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(54, '<p>Áo sơ mi dáng dài thường, ôm nhẹ. Các chi tiết bao gồm: cổ đức, tay ngắn, khuy cài, túi hộp đằng trước. Mẫu thiết kế đáng yêu và năng động phù hợp cho bé trai diện ra ngoài.</p>\r\n', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(55, '<p>Thiết kế sơ mi năng động dành cho bé trai. Dáng áo Regular vừa vặn nhưng vẫn giữ độ thoải mái. Phía trước áo được in họa tiết túi giả bắt mắt. Cổ đức chỉn chu và tay ngắn mát mẻ phù hợp cho bé diện đi học hoặc đi chơi trong mùa hè. </p>\r\n', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(56, '<p>Áo thun bé trai, dáng suông hơi ôm nhẹ, độ dài thường. Tay cộc, cổ tròn. Phía trước áo là dòng chữ Sleep Eat Skate và hình ván trượt ngộ nghĩnh</p>\r\n<p>Màu sắc: Xanh dương - Xanh tím than</p>', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(57, '<p>Áo thun bé trai dáng Regular. Độ dài vừa phải, tay ngắn, cổ tròn. Phía trước áo có dòng chữ Symphony. Phía sau áo được in hình rừng cây.</p>\r\n', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn'),
(58, '<p>Áo thun cổ tròn, tay ngắn. Dáng áo xuông. In hình các con vật tạo điểm nhấn. Quần đùi cạp chun co giãn đi kèm, có 2 túi chéo.</p>', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn'),
(59, '<p>Áo thun cổ tròn, tay ngắn. Dáng xuông. In chữ nhiều màu mặt trước.', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn'),
(60, '<p>Áo thun cho bé trai, cổ tròn, tay ngắn, độ dài vừa phải, dáng suông rộng. Phía trước được in hình hologram có dòng chữ Awesome.</p>', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn'),
(61, '<p>Quần sooc thun dáng Regular dành cho các bé trai. Thiết kế Regular với ống đứng rộng rãi. Phía trước có 2 túi chéo, phía sau có túi hộp.</p>', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(62, '<p>Quần sooc được làm từ chất liệu thun mềm. Cạp quần chun được may giả khóa. Họa tiết rằn ri xanh quân đội mang đến vẻ nghịch ngợm, nam tính cho các cậu nhóc.</p>', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(63, '<p>Quần short có độ dài trên gối, được làm từ vải Khaki. Phần đai được phối chun 2 bên, có thể co dãn tùy vào số đo của mỗi bé. Phía trước có túi hộp năng động.</p>', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(64, '<p>Quần sooc ngắn cho bé trai, năng động với túi hộp mix cùng vải kẻ lạ mắt. Dáng quần suông, rộng, độ dài ngang đầu gối. Chất liệu Khaki đứng dáng, không bị nhàu nát sau khi hoạt động mạnh.</p>', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(65, '<p>Quần Khaki có họa tiết khủng long nhí dễ thương. Dáng quần suông nhẹ, đứng dáng mà vẫn tạo cảm giác thoải mái cho con các con. Quần có cạp chun giả khóa kéo, xinh xắn và phù hợp diện hằng ngày.</p>', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(66, '<p>Quần bò dài có chun bo ống. Phía trước và phía sau đều có 2 túi. Cạp chun giả đai khuy. Chất liệu denim mềm mại, phù hợp với các bé. Cạp chun dễ mặc và co dãn tốt dù bé có lớn lên.</p>', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(67, '<p>Quần jean bé trai dáng Slim fit, form hơi ôm nhẹ. Gấu gập khoảng 3cm. Viền chỉ vàng. Phía trước có 2 túi chéo, phía sau có túi hộp.</p>', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(68, '<p>Quần sooc thun cạp chun co giãn có dây kéo rút. 2 túi chéo và túi vuông có nắp trên ống.</p>', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(69, '<p>Quần sooc cạp chun co giãn. 2 túi chéo. Vải kẻ kiểu caro màu xanh dương. </p>', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(70, '<p>Quần dài khaki cạp chun co giãn, 2 túi chéo 2 bên - 2 viền túi giả phía sau. Gấu bo chun co giãn.</p>', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular fit', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.');

-- --------------------------------------------------------

--
-- Table structure for table `order`
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
-- Table structure for table `product`
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
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `cate_id`, `prod_name`, `price`, `discount`, `quantity`, `date_added`) VALUES
(1, 5, 'ÁO SƠ MI DENIM', 890000, '10.00', 200, '2022-05-17 13:19:02'),
(2, 5, 'ÁO SƠ MI NAM HỌA TIẾT', 1090000, '20.00', 90, '2022-05-18 11:33:39'),
(3, 5, 'ÁO SƠ MI KẺ MỜ', 1190000, '0.00', 199, '2022-05-18 01:26:14'),
(4, 5, 'ÁO SƠ MI CỔ PHỐI MÀU', 1099000, '10.00', 70, '2022-05-18 01:27:09'),
(5, 5, 'ÁO SƠ MI TAY DÀI TÚI VUÔNG', 990000, '30.00', 30, '2022-05-18 01:32:01'),
(6, 10, 'CHÂN VÁY CHỮ A 2 LỚP', 1090000, '30.00', 120, '2022-05-18 10:35:20'),
(7, 10, 'CHÂN VÁY CHỮ A HOA NỔI', 990000, '0.00', 20, '2022-05-18 11:05:09'),
(8, 10, 'CHÂN VÁY CHỮ A PHỐI NÚT', 790000, '30.00', 50, '2022-05-18 11:09:05'),
(9, 10, 'CHÂN VÁY CHỮ A CHẦN CHỈ NỔI', 890000, '0.00', 110, '2022-05-18 11:12:20'),
(10, 10, 'CHÂN VÁY CHỮ A DÁNG DÀI', 990000, '10.00', 160, '2022-05-18 11:20:59'),
(11, 19, 'ÁO THUN SYMPHONY', 650000, '10.00', 100, '2022-05-19 17:15:51'),
(12, 19, 'ÁO THUN ANTI-HAVEN', 650000, '0.00', 100, '2022-05-18 17:20:53'),
(13, 19, 'ÁO THUN TROPICAL', 650000, '20.00', 100, '2022-05-18 17:21:28'),
(14, 19, 'ÁO THUN IN QUOTE', 650000, '10.00', 100, '2022-05-18 17:21:28'),
(15, 19, 'ÁO THUN SUSTAINABLE', 650000, '10.00', 100, '2022-05-18 17:23:10'),
(16, 20, 'ÁO POLO NAM MÀU ĐEN', 790000, '10.00', 100, '2022-05-18 17:28:27'),
(17, 20, 'ÁO POLO PHỐI KẺ', 790000, '0.00', 100, '2022-05-18 17:28:27'),
(18, 20, 'ÁO POLO NAM VẢI KẺ', 790000, '10.00', 100, '2022-05-18 17:30:08'),
(19, 20, 'ÁO POLO NAM KẺ NGANG', 790000, '10.00', 100, '2022-05-18 17:30:08'),
(20, 20, 'ÁO POLO KẺ DỌC', 790000, '10.00', 100, '2022-05-18 17:30:08'),
(21, 22, 'QUẦN SOOC THUN CẠP DÂY KÉO RÚT', 890000, '10.00', 100, '2022-05-18 17:36:09'),
(22, 22, 'QUẦN LỬNG KHAKI', 890000, '20.00', 100, '2022-05-18 17:36:09'),
(23, 22, 'QUẦN LỬNG VẢI PHỐI SỢI TENCEL', 890000, '10.00', 100, '2022-05-18 17:36:09'),
(24, 22, 'QUẦN LỬNG KẺ KHUY LỆCH', 890000, '10.00', 100, '2022-05-18 17:36:09'),
(25, 22, 'QUẦN LỬNG KẺ', 890000, '10.00', 100, '2022-05-18 17:36:09'),
(26, 23, 'QUẦN TÂY NAM KHAIKI GẤU BO', 1090000, '30.00', 100, '2022-05-18 17:43:36'),
(27, 23, 'QUẦN TÂY NAM KHAKI DÂY KÉO RÚT', 1090000, '30.00', 100, '2022-05-18 17:43:36'),
(28, 23, 'QUẦN TÂY NAM KHAKI DÁNG SLIM', 1090000, '30.00', 100, '2022-05-18 17:43:36'),
(29, 23, 'QUẦN TÂY NAM KHAKI TÚI VIỀN ĐÔI', 1090000, '30.00', 100, '2022-05-18 17:43:36'),
(30, 23, 'QUẦN KHAKI TÚI 2 BÊN', 405000, '10.00', 100, '2022-05-18 17:43:36'),
(31, 24, 'QUẦN SOOC JEANS NAM', 800000, '10.00', 50, '2022-05-20 09:57:01'),
(32, 24, 'QUẦN BÒ SLIM FIT', 100000, '10.00', 50, '2022-05-20 09:57:01'),
(33, 24, 'QUẦN JEANS NAM SLIM FIT', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(34, 24, 'QUẦN JEANS NAM SLIM FIT', 500000, '10.00', 50, '2022-05-20 09:57:01'),
(35, 24, 'QUẦN JEANS SLIM FIT', 300000, '10.00', 50, '2022-05-20 09:57:01'),
(36, 27, 'BỘ ÁO THUN VÀ QUẦN GIẢ VÁY', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(37, 27, 'BỘ ÁO THUN VÀ QUẦN GIẢ VÁY', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(38, 27, 'SET 2 DÂY COOL', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(39, 27, 'SET ÁO THUN VÀ QUẦN LỬNG CÙNG MÀU', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(40, 27, 'SET THUN HỌA TIẾT NHÍ', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(41, 28, 'QUẦN SOOC NƠ', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(42, 28, 'QUẦN SOOC GIẢ VÁY', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(43, 28, 'QUẦN SOOC THÊU HOA', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(44, 28, 'QUẦN SOOC THÊU HOA', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(45, 28, 'JUMPSUIT BÉ GÁI', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(46, 29, 'ĐẦM SUÔNG CHÚ CÚN ĐÁNG YÊU', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(47, 29, 'ĐẦM SUÔNG CHÚ CÚN ĐÁNG YÊU', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(48, 29, 'ĐẦM BABYDOLL PHỐI HOA', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(49, 29, 'ĐẦM LỤA NHẤN CHUN', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(50, 29, 'ĐẦM BABYDOLL TAY BỒNG', 200000, '10.00', 50, '2022-05-20 09:57:01'),
(51, 30, 'ÁO THUN SƯ TỬ', 280000, '20.00', 50, '2022-05-20 12:54:00'),
(52, 30, 'ÁO THUN KHỦNG LONG JUST CHILL', 320000, '10.00', 150, '2022-05-20 12:54:00'),
(53, 30, 'ÁO THUN PHỐI TÚI NẮP', 319000, '0.00', 150, '2022-05-20 12:54:00'),
(54, 30, 'ÁO SƠ MI REGULAR FIT', 399000, '10.00', 200, '2022-05-20 12:54:00'),
(55, 30, 'ÁO SƠ MI PHỐI TÚI GIẢ', 399000, '10.00', 150, '2022-05-20 12:54:00'),
(56, 30, 'ÁO THUN SLEEP EAT SKATE', 239000, '10.00', 300, '2022-05-20 12:54:00'),
(57, 30, 'ÁO THUN BÉ TRAI SYMPHONY', 500000, '10.00', 150, '2022-05-20 12:54:00'),
(58, 30, 'ÁO THUN CON VẬT (KÈM QUẦN)', 900000, '20.00', 150, '2022-05-20 12:54:00'),
(59, 30, 'ÁO THUN NEVER STOP', 152000, '0.00', 50, '2022-05-20 12:54:00'),
(60, 30, 'ÁO THUN AWESOME', 200000, '10.00', 50, '2022-05-20 12:54:00'),
(61, 31, 'QUẦN SOOC REGULAR', 239000, '10.00', 50, '2022-05-20 12:54:00'),
(62, 31, 'QUẦN SOOC RẰN RI', 200000, '10.00', 250, '2022-05-20 12:54:00'),
(63, 31, 'QUẦN SHORT PHỐI ĐAI CHUN', 599000, '10.00', 100, '2022-05-20 12:54:00'),
(64, 31, 'QUẦN SOOC PHỐI TÚI NẮP', 450000, '10.00', 50, '2022-05-20 12:54:00'),
(65, 31, 'QUẦN KHAKI KHỦNG LONG NHÍ', 499000, '0.00', 350, '2022-05-20 12:54:00'),
(66, 31, 'QUẦN DENIM BO ỐNG', 390000, '10.00', 150, '2022-05-20 12:54:00'),
(67, 31, 'QUẦN JEAN SLIM FIT', 579000, '10.00', 100, '2022-05-20 12:54:00'),
(68, 31, 'QUẦN SOOC THUN 2 TÚI', 350000, '10.00', 150, '2022-05-20 12:54:00'),
(69, 31, 'QUẦN SOOC KẺ CARO NGANG ĐÙI', 599000, '0.00', 250, '2022-05-20 12:54:00'),
(70, 31, 'QUẦN DÀI KHAKI BÉ TRAI', 200000, '10.00', 50, '2022-05-20 12:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `size`
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
-- Dumping data for table `size`
--

INSERT INTO `size` (`prod_id`, `s`, `m`, `x`, `l`, `xxl`) VALUES
(1, 50, 70, 40, 30, 10),
(2, 25, 15, 20, 20, 10),
(3, 80, 50, 40, 10, 19),
(4, 30, 10, 10, 10, 10),
(5, 10, 5, 5, 5, 5),
(6, 20, 30, 40, 10, 20),
(7, 4, 6, 2, 6, 2),
(8, 10, 5, 5, 20, 10),
(9, 40, 20, 40, 5, 5),
(10, 20, 50, 30, 30, 30),
(11, 20, 20, 20, 20, 20),
(12, 20, 20, 20, 20, 20),
(13, 20, 20, 20, 20, 20),
(14, 20, 20, 20, 20, 20),
(15, 20, 20, 20, 20, 20),
(16, 20, 20, 20, 20, 20),
(17, 20, 20, 20, 20, 20),
(18, 20, 20, 20, 20, 20),
(19, 20, 20, 20, 20, 20),
(20, 20, 20, 20, 20, 20),
(21, 20, 20, 20, 20, 20),
(22, 20, 20, 20, 20, 20),
(23, 20, 20, 20, 20, 20),
(24, 20, 20, 20, 20, 20),
(25, 20, 20, 20, 20, 20),
(26, 20, 20, 20, 20, 20),
(27, 20, 20, 20, 20, 20),
(28, 20, 20, 20, 20, 20),
(29, 20, 20, 20, 20, 20),
(30, 20, 20, 20, 20, 20),
(31, 10, 10, 10, 10, 10),
(32, 10, 10, 10, 10, 10),
(33, 10, 10, 10, 10, 10),
(34, 10, 10, 10, 10, 10),
(35, 10, 10, 10, 10, 10),
(36, 10, 10, 10, 10, 10),
(37, 10, 10, 10, 10, 10),
(38, 10, 10, 10, 10, 10),
(39, 10, 10, 10, 10, 10),
(40, 10, 10, 10, 10, 10),
(41, 10, 10, 10, 10, 10),
(42, 10, 10, 10, 10, 10),
(43, 10, 10, 10, 10, 10),
(44, 10, 10, 10, 10, 10),
(45, 10, 10, 10, 10, 10),
(46, 10, 10, 10, 10, 10),
(47, 10, 10, 10, 10, 10),
(48, 10, 10, 10, 10, 10),
(49, 10, 10, 10, 10, 10),
(50, 10, 10, 10, 10, 10),
(51, 5, 7, 8, 11, 13),
(52, 5, 7, 8, 11, 13),
(53, 5, 7, 8, 11, 13),
(54, 5, 7, 8, 11, 13),
(55, 5, 7, 8, 11, 13),
(56, 5, 7, 8, 11, 13),
(57, 5, 7, 8, 11, 13),
(58, 5, 7, 8, 11, 13),
(59, 5, 7, 8, 11, 13),
(60, 5, 7, 8, 11, 13),
(61, 5, 7, 8, 11, 13),
(62, 5, 7, 8, 11, 13),
(63, 5, 7, 8, 11, 13),
(64, 5, 7, 8, 11, 13),
(65, 5, 7, 8, 11, 13),
(66, 5, 7, 8, 11, 13),
(67, 5, 7, 8, 11, 13),
(68, 5, 7, 8, 11, 13),
(69, 5, 7, 8, 11, 13),
(70, 5, 7, 8, 11, 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `UN_email` (`email`),
  ADD UNIQUE KEY `UN_phone_number` (`phone_number`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `FK_cart-prodID` (`prod_id`),
  ADD KEY `FK_cart-username` (`username`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `description`
--
ALTER TABLE `description`
  ADD UNIQUE KEY `UN_des-prodID` (`prod_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD KEY `FK_order-username` (`username`),
  ADD KEY `FK_order-prodID` (`prod_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `FK_cate_id` (`cate_id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD UNIQUE KEY `UN_size-prodID` (`prod_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cate_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'mã danh mục', AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã sản phẩm', AUTO_INCREMENT=71;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_cart-prodID` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`),
  ADD CONSTRAINT `FK_cart-username` FOREIGN KEY (`username`) REFERENCES `account` (`username`);

--
-- Constraints for table `description`
--
ALTER TABLE `description`
  ADD CONSTRAINT `FK_des-prodID` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_order-prodID` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`),
  ADD CONSTRAINT `FK_order-username` FOREIGN KEY (`username`) REFERENCES `account` (`username`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_cate_id` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
