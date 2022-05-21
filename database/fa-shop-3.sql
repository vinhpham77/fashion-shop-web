-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2022 at 11:31 AM
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
-- Database: `fa-shop-2`
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
(51, '<p>Áo thun bé trai trơn, cổ tròn, tay cộc. Phía trước áo được in hình sư tử dễ thương. Kỹ thuật in nổi sắc nét, hút mắt.\r\n', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(52, 'Áo thun rộng rãi dành cho bé trai năng động. Hình khủng long nghịch ngợm cùng dòng chữ đáng yêu sẽ khiến các bé thích mê chiếc áo này. Bố mẹ đừng quên cho con diện mẫu áo này khi đi chơi nhé!', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(53, 'Áo thun cổ tròn, tay ngắn, dáng Regular rộng rãi. Áo trơn không họa tiết, phía trước được phối túi hộp có nắp.', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(54, 'Áo sơ mi dáng dài thường, ôm nhẹ. Các chi tiết bao gồm: cổ đức, tay ngắn, khuy cài, túi hộp đằng trước. Mẫu thiết kế đáng yêu và năng động phù hợp cho bé trai diện ra ngoài.', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(55, 'Thiết kế sơ mi năng động dành cho bé trai. Dáng áo Regular vừa vặn nhưng vẫn giữ độ thoải mái. Phía trước áo được in họa tiết túi giả bắt mắt. Cổ đức chỉn chu và tay ngắn mát mẻ phù hợp cho bé diện đi học hoặc đi chơi trong mùa hè. ', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(56, 'Áo thun bé trai, dáng suông hơi ôm nhẹ, độ dài thường. Tay cộc, cổ tròn. Phía trước áo là dòng chữ Sleep Eat Skate và hình ván trượt ngộ nghĩnh\r\nMàu sắc: Xanh dương - Xanh tím than', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(57, 'Áo thun bé trai dáng Regular. Độ dài vừa phải, tay ngắn, cổ tròn. Phía trước áo có dòng chữ Symphony. Phía sau áo được in hình rừng cây.\r\n', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn'),
(58, 'Áo thun cổ tròn, tay ngắn. Dáng áo xuông. In hình các con vật tạo điểm nhấn. Quần đùi cạp chun co giãn đi kèm, có 2 túi chéo.', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn'),
(59, 'Áo thun cổ tròn, tay ngắn. Dáng xuông. In chữ nhiều màu mặt trước.', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn'),
(60, 'Áo thun cho bé trai, cổ tròn, tay ngắn, độ dài vừa phải, dáng suông rộng. Phía trước được in hình hologram có dòng chữ Awesome.', 'Dòng sản phẩm:Boy<br>Nhóm sản phẩm: Áo<br>Cổ áo : Cổ tròn', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn'),
(61, 'Quần sooc thun dáng Regular dành cho các bé trai. Thiết kế Regular với ống đứng rộng rãi. Phía trước có 2 túi chéo, phía sau có túi hộp.', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(62, 'Quần sooc được làm từ chất liệu thun mềm. Cạp quần chun được may giả khóa. Họa tiết rằn ri xanh quân đội mang đến vẻ nghịch ngợm, nam tính cho các cậu nhóc.', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(63, 'Quần short có độ dài trên gối, được làm từ vải Khaki. Phần đai được phối chun 2 bên, có thể co dãn tùy vào số đo của mỗi bé. Phía trước có túi hộp năng động.', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(64, 'Quần sooc ngắn cho bé trai, năng động với túi hộp mix cùng vải kẻ lạ mắt. Dáng quần suông, rộng, độ dài ngang đầu gối. Chất liệu Khaki đứng dáng, không bị nhàu nát sau khi hoạt động mạnh.', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(65, 'Quần Khaki có họa tiết khủng long nhí dễ thương. Dáng quần suông nhẹ, đứng dáng mà vẫn tạo cảm giác thoải mái cho con các con. Quần có cạp chun giả khóa kéo, xinh xắn và phù hợp diện hằng ngày.', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(66, 'Quần bò dài có chun bo ống. Phía trước và phía sau đều có 2 túi. Cạp chun giả đai khuy. Chất liệu denim mềm mại, phù hợp với các bé. Cạp chun dễ mặc và co dãn tốt dù bé có lớn lên.', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(67, 'Quần jean bé trai dáng Slim fit, form hơi ôm nhẹ. Gấu gập khoảng 3cm. Viền chỉ vàng. Phía trước có 2 túi chéo, phía sau có túi hộp.', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(68, 'Quần sooc thun cạp chun co giãn có dây kéo rút. 2 túi chéo và túi vuông có nắp trên ống.', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(69, 'Quần sooc cạp chun co giãn. 2 túi chéo. Vải kẻ kiểu caro màu xanh dương. ', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(70, 'Quần dài khaki cạp chun co giãn, 2 túi chéo 2 bên - 2 viền túi giả phía sau. Gấu bo chun co giãn.', 'Dòng sản phẩm	Boy<br> Nhóm sản phẩm	Quần<br> Kiểu dáng	Regular fit', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(71, 'Jumpsuit trơn dáng suông. Dáng áo không tay, vạt đổ từ đằng trước xuống đằng sau. Dáng quần ống đứng, rộng, độ dài chạm gót. 2 bên có 2 túi chéo. Chất liệu chính là lụa.', '\r\nDòng sản phẩm	Ladies\r\nNhóm sản phẩm	Jumpsuit\r\nCổ áo	Cổ tròn', 'Chi tiết bảo quản sản phẩm : \r\n\r\n* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(72, 'Quần dáng suông, độ dài ngang mắt cá chân. Chất liệu chính là Tuysi dày dặn. Trên đai quần có khuy cài ẩn. Phía trước có 2 túi hộp, phần viền cách điệu được đính ngọc nhỏ.', '\r\nDòng sản phẩm	You\r\nNhóm sản phẩm	Quần\r\nKiểu dáng	Ống suông', ' * Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(73, 'Áo sơ mi dáng suông, tay lửng, bo gấu đầu ống. Chất liệu chính là lụa. Trên ống tay được thêu nổi họa tiết hoa. Phần cổ áo cách điệu với dây buộc dài, tạo hình nơ.', 'Dòng sản phẩm	Ladies\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ khác', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(74, 'Đầm dáng xòe, không tay, đai vai to bản. Đầm bao gồm 2 lớp, lớp trong là lụa mềm, lớp ngoài là vải dập nổi họa tiết ô trám. Lớp ngoài được xếp nếp ngẫu nhiên tạo bề mặt không bằng phẳng. Trên đai vai được đính kèm phụ kiện hoa.\r\n\r\nĐể trở thành tâm điểm của bữa tiệc, nàng không cần lựa chọn quá nhiều chi tiết cầu kỳ. Đôi khi chính sự đơn giản lại khiến diện mạo nàng lộng lẫy hơn. Và chiếc đầm dạ hội này sẽ đáp ứng đầy đủ yêu cầu về vẻ ngoài của những quý cô tinh tế. Dáng váy xòe cổ điển \"cân\" tốt mọi vóc người. Điểm nhấn phụ kiện hoa thêm phần nổi bật cho chiếc đầm.\r\n\r\nMàu sắc: Trắng - Đen\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m68\r\nCân nặng: 52kg\r\nSố đo 3 vòng: 83-62-95cm', 'Dòng sản phẩm	Senora\r\nNhóm sản phẩm	Đầm\r\nCổ áo	Cổ vuông', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(75, 'Đầm dáng maxi với độ dài ngang bắp chân. Thiết kế thân trên ôm nhẹ, thân dưới xòe rộng tự nhiên. Đầm không có tay áo, thay vào đó là 2 dây đai to bản nối đến phần vặn xoắn trước ngực. Eo đầm được nhấn cao nhẹ nhàng. Phần dưới vạt được nhấn xòe.\r\n\r\nThiết kế tràn ngập hương sắc mùa hè này sẽ là sự lựa chọn hoàn hảo cho chuyến du lịch của nàng. Đường nét của thiết kế hướng đến sự tối giản nhưng không làm mất đi vẻ cuốn hút nơi diện mạo nàng. Ngược lại, những đường nét đơn giản nhưng thú vị này sẽ khiến mọi cô nàng sở hữu một loại khí chất đặc biệt, rực rỡ và lung linh như những tia nắng ngày hè.\r\n\r\nMàu sắc: Đỏ mận - Hồng tím\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m68\r\nCân nặng: 52kg\r\nSố đo 3 vòng: 83-62-95cm', '\r\nDòng sản phẩm	Ladies\r\nNhóm sản phẩm	Đầm\r\nCổ áo	Cổ khác', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(76, 'Thiết kế sơ mi dáng suông, độ dài vừa phải. Tay áo ngắn. Phần cổ được đắp ren bản lớn. Đằng trước có 3 khuy cố định. Chất liệu chính lụa mềm, nhẹ.\r\n\r\nMột thiết kế hướng đến sự nữ tính và nhẹ nhàng. Chất liệu lụa mềm mại có độ bay nhẹ giúp ngày hè của nàng dễ chịu hơn. Dáng áo suông không hề kén vóc người, nàng có thể chọn sơ vin hay thả tà đều đẹp.\r\n\r\nMàu sắc: Trắng\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m68\r\nCân nặng: 52kg\r\nSố đo 3 vòng: 83-62-95cm', '\r\nDòng sản phẩm	Ladies\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ khác', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.'),
(77, 'Áo sơ mi cổ đức, dáng croptop với độ dài lửng, tay ngắn. Dọc thân áo khuy bấm được ẩn ở trong. Phía trước có 2 túi vuông cùng khuy cài giả.\r\n\r\nNếu những chiếc sơ mi dài có phần hơi trang trọng và đứng đắn, thì mẫu sơ mi croptop này lại tràn ngập nét trẻ trung và năng động. Dáng áo lửng không quá ngắn dễ dàng phù hợp với mọi dáng người, kể cả khi nàng có vòng eo không thon thả. Form sơ mi cổ đức cùng ống tay ngắn mang đến nét tươi sáng, không kén item mix cùng.\r\n\r\nMàu sắc: Trắng - Hồng san hô\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m68\r\nCân nặng: 52kg\r\nSố đo 3 vòng: 83-62-95cm', '\r\nDòng sản phẩm	You\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ đức', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.'),
(78, 'Thiết kế áo suông, không tay. Cổ V cách điệu cùng dây buộc. Phần vai và viền áo được nhấn bèo chun. Chất liệu chính của áo là lụa dập nổi tinh xảo.\r\n\r\nNhững chiếc áo kiểu không tay luôn được các quý cô ưu ái hơn khi mùa hè nóng nực đến. Chất lụa nhẹ với họa tiết dập nổi mang đến vẻ sang trọng, tinh tế, đồng thời khiến thiết kế dễ chịu hơn với người mặc. Điểm nhấn của chiếc áo này nằm ở phần bèo nhún trên vai, góp phần tạo nên diện mạo nữ tính, duyên dáng cho nàng.', 'Dòng sản phẩm	Ladies\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ tròn\r\nTay áo	Cánh tiên\r\nKiểu dáng	Xuông\r\nĐộ dài	Dài thường\r\nHọa tiết	Dập nổi\r\nChất liệu	Lụa', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.'),
(79, 'Áo sơ mi cổ tàu có khuy giả. Xung quanh cổ áo được thêu hoa nổi trên nền lụa trơn. Tay áo lửng, dáng xuông.\r\n\r\nHọa tiết thêu hoa tinh xảo nơi cổ áo chính là điểm nhấn đặc biệt của item này. Dáng cổ đức tối giản giúp những ngày hè của nàng thoáng mát, nhẹ nhàng hơn. Tay áo lửng che tốt mọi khuyết điệm khiến nàng chưa tự tin. Với chiếc áo sơ mi này, nàng có thể phối cùng chân váy hay quần công sở đều rất phù hợp.\r\n\r\nMàu sắc: Cam', '\r\nDòng sản phẩm	Ladies\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ khác\r\nTay áo	Tay lỡ\r\nKiểu dáng	Xuông\r\nĐộ dài	Dài thường\r\nHọa tiết	Trơn\r\nChất liệu	Lụa', ' Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. '),
(80, 'Áo sơ mi dáng ôm, thân áo có độ đứng. Thiết kế cổ đức. Phía trước có 2 túi hộp phối cùng khuy kim loại. Tại phần khủy tay có khuy để cài cố định khi gập ống tay. Tà áo dáng đuôi tôm xẻ ở 2 bên.\r\n\r\nMột thiết kế cơ bản nhưng không kém phần trẻ trung với họa tiết kẻ sọc bắt mắt. Dáng áo ôm nhẹ gọn gàng phù hợp cho những quý cô công sở bận rộn. Ống tay có khuy cố định mỗi khi sắn ống giúp diện mạo nàng trông năng động hơn.\r\n\r\nMàu sắc: Kẻ trắng - Kẻ đen', '\r\nDòng sản phẩm	You\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ đức\r\nTay áo	Tay dài\r\nKiểu dáng	Ôm\r\nĐộ dài	Dài thường\r\nHọa tiết	Kẻ\r\nChất liệu	Lụa', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.\r\n\r\n* Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.\r\n\r\n* Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.\r\n\r\n* Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.\r\n\r\n* Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. '),
(81, 'Áo thun dáng ôm, độ dài vừa phải, tay ngắn, cổ tròn. Phần cổ được viền in. Phía trước là dòng chữ Joie De Vivre trên nền in bạc, trên chữ được đính ngọc trai.\r\n\r\nMột mẫu áo thun năng động nhưng không kém phần nữ tính dành cho các cô nàng. Áo có độ ôm vừa phải, gọn gàng và chỉn chu để phối cùng nhiều item khác nhau.', '\r\nDòng sản phẩm	Ladies\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ tròn\r\nTay áo	Tay ngắn\r\nKiểu dáng	Ôm\r\nĐộ dài	Dài thường\r\nHọa tiết	Trơn\r\nChất liệu	Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.'),
(82, 'Áo thun dáng croptop, cổ V, tay ngắn, phong cách mongtoghi. Dáng áo ôm, phía trước có khuy vân mini.\r\n\r\nMẫu áo thun trẻ trung này sẽ là item không thể thiếu trong tủ đồ mùa hè của nàng. Dáng áo ôm nhẹ cùng chất liệu co dãn tôn lên triệt để vẻ đẹp hình thể của nàng. Để diện được mẫu áo này đẹp nhất, nàng hãy phối cùng các item cạp cao nhé.\r\n\r\nMàu sắc: Xanh lime - Cam đào\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m68\r\nCân nặng: 52kg\r\nSố đo 3 vòng: 83-62-95cm', 'Dòng sản phẩm	You\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ chữ V\r\nTay áo	Tay ngắn\r\nKiểu dáng	Ôm\r\nĐộ dài	Croptop\r\nHọa tiết	Trơn\r\nChất liệu	Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. '),
(83, 'Áo thun dáng suông, form basic với tay ngắn và cổ tròn. Phía trước áo được in nổi một bài thơ bằng tiếng Anh.\r\n\r\nThiết kế tối giản nhưng vẫn sang trọng này phù hợp với mọi cô nàng trong mọi dịp khác nhau. Nàng có thể mix-match item này với quần Tây, quần jean hay chân váy đều rất đẹp.\r\n\r\nMàu sắc: Trắng - Đen\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m68\r\nCân nặng: 52kg\r\nSố đo 3 vòng: 83-62-95cm', 'Dòng sản phẩm	Ladies\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ tròn\r\nTay áo	Tay ngắn\r\nKiểu dáng	Xuông\r\nĐộ dài	Dài thường\r\nHọa tiết	Trơn\r\nChất liệu	Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.'),
(84, 'Áo thun cơ bản với nền trơn và chữ in màu ở giữa. Áo ngắn tay, cổ tròn, dáng suông.\r\n\r\nLựa chọn một chiếc áo thun basic sẽ khiến phong cách của nàng trở nên năng động và trẻ trung hơn. Thiết kế áo thun với câu nói cổ vũ sẽ giúp vẻ ngoài nàng sáng bừng rực rỡ. Đơn giản phối cùng quần jean là đã hoàn thành ngay một set đồ tiêu chuẩn.\r\n\r\nMàu sắc: Trắng - Xanh lá\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m69\r\n\r\nCân nặng: 48kg\r\n\r\nSố đo: 80-60-90cm', '\r\nDòng sản phẩm	You\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ tròn\r\nTay áo	Tay ngắn\r\nKiểu dáng	Xuông\r\nĐộ dài	Dài thường\r\nHọa tiết	Trơn\r\nChất liệu	Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.\r\n\r\n* Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.\r\n\r\n* Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.\r\n\r\n* Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.\r\n\r\n* Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. '),
(85, 'Áo thun dáng suông, độ dài vừa phải, không có ống tay, vai nối dài, cổ tròn. Phía trước áo được in câu quote với phối màu ombre.\r\n\r\nMột mẫu áo thun cơ bản dành cho nàng diện trong những ngày hè nắng nóng. Dáng áo không tay kết hợp cùng phần vai nối dài đem đến cảm giác mát mẻ mà vẫn giữ nguyên tính chỉn chu, lịch sự. Sáng áo suông với độ dài vừa phải mang đến nhiều cách mix-match khác nhau cho nàng thoải mái lựa chọn.\r\n\r\nMàu sắc: Trắng - Nude\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m69\r\n\r\nCân nặng: 48kg\r\n\r\nSố đo: 80-60-90cm', 'Dòng sản phẩm	You\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ tròn\r\nTay áo	Sát nách\r\nKiểu dáng	Xuông\r\nĐộ dài	Dài thường\r\nHọa tiết	Trơn\r\nChất liệu	Thun', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.');
INSERT INTO `description` (`prod_id`, `introduction`, `detail`, `maintenance`) VALUES
(86, 'Áo dáng croptop cạp ngắn, ống tay dài, cổ tròn. Thân áo được thiết kế dựa trên các đường xếp ly nhỏ cố định. Tay áo phồng và được bo chun ở đầu ống. Phần eo có dây dài cùng màu để buộc, thắt theo ý thích. Cổ áo phía sau có khuy cài kim loại. Thân áo được may 2 lớp, tay áo được may 1 lớp có độ xuyên thấu nhẹ.\r\n\r\nMàu sắc: Đỏ mận\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m68\r\nCân nặng: 52kg\r\nSố đo 3 vòng: 83-62-95cm', 'Dòng sản phẩm	You\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ tròn\r\nTay áo	Tay lỡ\r\nKiểu dáng	Ôm\r\nĐộ dài	Croptop\r\nHọa tiết	Trơn\r\nChất liệu	Lụa', ' Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.'),
(87, 'Áo croptop cổ kiểu, vạt chéo . Tay ngắn. Dáng croptop ngang eo - chần chun co giãn. Cài bằng khuy giọt lệ phía sau.\r\n\r\nĐơn giản, nhỏ gọn lại được may bằng chất liệu lụa mỏng, không nhăn, mang theo bên mình trong những chuyến đi chơi là lựa chọn thông minh cho cô nàng hiện đại. Mix cùng quần jean, zuýp các loại hoặc quần short cũng đủ nàng biến hóa nhiều phong cách mong muốn. \r\n\r\nMàu sắc: Hồng san hô - Nude\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m65\r\nCân nặng: 47kg\r\nSố đo 3 vòng: 82-61-89 cm', 'Dòng sản phẩm	Ladies\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ khác\r\nTay áo	Tay ngắn\r\nKiểu dáng	Bo gấu\r\nĐộ dài	Croptop\r\nHọa tiết	Trơn\r\nChất liệu	Lụa', ' Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.\r\n\r\n* Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.'),
(88, 'Áo croptop cổ đức có thêu chữ 1 bên. Có 3 khuy tạo kiểu phía trước phần cổ V cách điệu. Dáng áo croptop. \r\n\r\nSử dụng chất vải Tuysi với những ưu điểm vượt trội như: Thoáng mát, thấm nước tốt, độ bền cao giúp thiết kế trở nên nổi bật. Đừng quên mix cùng quần sooc, jeans,... và phụ kiện nhé\r\n\r\nMàu sắc: Đen - Cam\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m68\r\nCân nặng: 52kg\r\nSố đo 3 vòng: 83-62-95cm', 'Dòng sản phẩm	Ladies\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ đức\r\nTay áo	Tay ngắn\r\nKiểu dáng	Ôm\r\nĐộ dài	Croptop\r\nHọa tiết	Trơn\r\nChất liệu	Tuysi', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.'),
(89, 'Áo croptop cổ chữ V xếp nếp. Tay áo liền. Dáng áo croptop bo gấu. Phía sau có dây thắt nơ tạo điểm nhấn. Cài bằng khóa kéo sau lưng.\r\n\r\nSử dụng vải thô lụa thoáng khí, nhẹ nhàng tạo cảm giác dễ chịu cho người mặc. Nàng có thể mix cùng quần âu công sở, quần jeans hay zuýp các loại.\r\n\r\nMàu sắc: Họa tiết Nude - Đen - Nude\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m68\r\nCân nặng: 52kg\r\nSố đo 3 vòng: 83-62-95cm', 'Dòng sản phẩm	Ladies\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ chữ V\r\nTay áo	Tay liền\r\nKiểu dáng	Bo gấu\r\nĐộ dài	Croptop\r\nHọa tiết	Hoa,Trơn\r\nChất liệu	Lụa,Thô', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.'),
(90, 'Áo croptop cổ tròn bằng chun co giãn, tay cánh dơi gấu lật. Gấu chần chun đều co giãn, bo phía dưới. Mặt trước in hàng chữ khác màu tạo điểm hút.\r\n\r\nKiểu dáng độc lạ cho 1 chiếc áo thun. Chất liệu thun cao cấp nhẹ, mềm, thấm hút mồ hôi, siêu co dãn...Mix cùng quần Jean, chân váy, zuýp dài...bạn sẽ có những set đồ thời trang, cá tính, lịch sự.\r\n\r\nMàu sắc: Cam Đậm - Trắng\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m70\r\nCân nặng: 47kg\r\nSố đo 3 vòng: 78-60-90\r\n', '\r\nDòng sản phẩm	You\r\nNhóm sản phẩm	Áo\r\nCổ áo	Cổ tròn\r\nTay áo	Cánh dơi\r\nKiểu dáng	Bo gấu\r\nĐộ dài	Croptop\r\nHọa tiết	Trơn\r\nChất liệu	Thun', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.'),
(91, 'Chân váy dáng xòe, xếp ly to nhỏ so le nhau. Đai bản lớn rộng khoảng 3-4cm, vải lụa trơn. Chất liệu chính của váy là Tuysi. Độ dài váy trên gối.\r\n\r\nThiết chân váy cơ bản phù hợp để nàng diện trong nhiều dịp khác nhau. Dáng váy thanh lịch nhưng vẫn trẻ trung, dễ mix-match theo nhiều phong cách\r\n\r\nMàu sắc: Đen - Nude\r\n\r\nMẫu mặc size S:\r\n\r\nChiều cao: 1m68\r\nCân nặng: 52kg\r\nSố đo 3 vòng: 83-62-95cm', '\r\nDòng sản phẩm	You\r\nNhóm sản phẩm	Zuýp\r\nKiểu dáng	Xếp ly\r\nĐộ dài	Trên gối\r\nHọa tiết	Trơn\r\nChất liệu	Tuysi', 'Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.'),
(92, 'Chân váy dáng Midi. Dọc thân là các đường xếp ly bản vừa. 2 bên hông váy được cắt ly ngắn hơn để tạo điểm nhấn. Trên eo váy có đai dây có thể tùy chỉnh cách thắt, buộc.\r\n\r\nThiết kế sang trọng, thanh lịch nhưng vẫn trẻ trung này phù hợp cho nàng diện trong nhiều dịp khác nhau. Phối cùng sơ mi chỉn chu, nàng đã có ngay outfit đến nơi công sở. Còn nếu chọn mix với áo kiểu rực rỡ, set đồ mùa hè để đi du lịch đã sẵn sàng rồi đó!\r\n\r\nMàu sắc: Nude - Đen\r\n\r\nMẫu mặc size M:\r\n\r\nChiều cao: 1m67\r\n\r\nCân nặng: 50kg\r\n\r\nSố đo: 83-65-93cm', '\r\nDòng sản phẩm	Ladies\r\nNhóm sản phẩm	Zuýp\r\nKiểu dáng	Xếp ly\r\nĐộ dài	Qua gối\r\nHọa tiết	Trơn\r\nChất liệu	Tuysi', '\r\nDòng sản phẩm	Ladies\r\nNhóm sản phẩm	Zuýp\r\nKiểu dáng	Xếp ly\r\nĐộ dài	Qua gối\r\nHọa tiết	Trơn\r\nChất liệu	Tuysi'),
(93, 'Zuýp midi họa tiết hoa độc lạ. Độ dài ngang bắp. Phần chân dập ly đều 2 bên tạo kiểu.\r\n\r\nBằng chất vải chiffon bên trong có lớp lót giúp bạn trở nên thoải mái nhất. Kiểu dáng trenddy chỉ cần mix&match với áo sơ mi kiểu, áo thun, 2 dây đều tạo cho nàng 1 outfit hoàn hảo.\r\n\r\nMàu sắc: Họa tiết Đen - Đen', '\r\nDòng sản phẩm	Ladies\r\nNhóm sản phẩm	Zuýp\r\nKiểu dáng	Midi\r\nĐộ dài	Ngang bắp\r\nHọa tiết	Hoa,Trơn\r\nChất liệu	Chiffon', ' Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.'),
(94, 'Zuýp xếp ly cạp kiểu với độ dài trên gối, gấu lệch. Cài bằng khóa kéo ẩn bên sườn.\r\n\r\nKiểu chân zuýp xếp ly tennis được cách điệu với phần đai và gấu lệch tạo kiểu độc đáo. Chất vải Tuysi 1 lớp phù hợp với tiết trời mùa hè. Màu sắc basic dễ mix với các áo sơ mi, áo thun kiểu.\r\n\r\nMàu sắc: Nude - Đen', 'Dòng sản phẩm	You\r\nNhóm sản phẩm	Zuýp\r\nKiểu dáng	Xếp ly\r\nĐộ dài	Trên gối\r\nHọa tiết	Trơn\r\nChất liệu	Tuysi\r\n', ' Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.'),
(95, 'Zuýp 2 lớp cạp cao. Vải xếp ly đều với độ dài ngang gối. Cài khóa kéo ẩn. Có thể mix cùng áo vest MS 63M5908 đồng màu.\r\n\r\nNhững đường xếp ly tinh tế tôn nét mềm mại của chất liệu lụa đồng thời tạo độ bồng bềnh, nữ tính. Bên cạnh những cách phối chiếc zuýp này với áo cùng set, mẫu áo kiểu có phần cách điệu cũng là một lựa chọn mang đến vẻ ngoài thời trang và ấn tượng cho bạn đấy.\r\n\r\nMàu sắc: Gold - Cam - Hồng san hô', 'Dòng sản phẩm	Ladies\r\nNhóm sản phẩm	Zuýp\r\nKiểu dáng	Xếp ly\r\nĐộ dài	Ngang gối\r\nHọa tiết	Trơn\r\nChất liệu	Tuysi\r\n', '* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn.\r\n\r\n* Vải voan , lụa , chiffon nên giặt bằng tay.\r\n\r\n* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy.\r\n\r\n* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay.\r\n\r\n* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác. \r\n\r\n* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng.\r\n\r\n* Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.\r\n\r\n* Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.\r\n\r\n* Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.\r\n\r\n* Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. ');

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
(70, 31, 'QUẦN DÀI KHAKI BÉ TRAI', 200000, '10.00', 50, '2022-05-20 12:54:00'),
(71, 3, 'JUMPSUIT LỤA SUÔNG TRƠN', 1112000, '20.00', 150, '2022-05-20 14:16:56'),
(72, 3, 'QUẦN SUÔNG PHỐI TÚI VIỀN', 872000, '20.00', 130, '2022-05-20 14:20:59'),
(73, 3, 'ÁO SƠ MI THÊU NỐI PHỐI NƠ', 952000, '20.00', 60, '2022-05-20 14:20:59'),
(74, 3, 'ĐẦM XÒE PHỐI HOA', 2792000, '20.00', 10, '2022-05-20 14:20:59'),
(75, 3, 'ĐẦM MAXI KHÔNG TAY', 1352000, '20.00', 170, '2022-05-20 14:20:59'),
(76, 5, 'ÁO SƠ MI CỔ ĐẮP REN', 712000, '0.00', 200, '2022-05-20 14:27:37'),
(77, 5, 'ÁO SƠ MI CROPTOP PHỐI TÚI TRƯỚC', 872000, '0.00', 300, '2022-05-20 14:27:37'),
(78, 5, 'ÁO LỤA DẬP NỔI NHẤN BÈO', 715000, '2.00', 150, '2022-05-20 14:27:37'),
(79, 5, 'SƠ MI LỤA THÊU NỔI', 1192000, '0.00', 400, '2022-05-20 14:27:37'),
(80, 5, 'ÁO SƠ MI KẺ CHẤT LỤA', 1192000, '5.00', 100, '2022-05-20 14:27:37'),
(81, 6, 'ÁO THUN JOIE DE VIVRE', 472000, '0.00', 500, '2022-05-20 14:31:36'),
(82, 6, 'ÁO THUN MONGTOGHI', 600000, '0.00', 200, '2022-05-20 14:31:36'),
(83, 6, 'ÁO THUN POEM', 742000, '0.00', 500, '2022-05-20 14:31:36'),
(84, 6, 'ÁO THUN DO WHAT MAKE YOU HAPPY', 600000, '0.00', 300, '2022-05-20 14:31:36'),
(85, 6, 'ÁO THUN I QUOTE OMBRE', 750000, '0.00', 190, '2022-05-20 14:31:36'),
(86, 7, 'ÁO CROPTOP NHẤN DÂY', 1490000, '0.00', 300, '2022-05-20 14:49:16'),
(87, 7, 'ÁO CROPTOP CỔ KIỂU', 632000, '0.00', 200, '2022-05-20 14:49:16'),
(88, 7, 'ÁO CROPTOP CỔ ĐỨC', 635000, '0.00', 230, '2022-05-20 14:49:16'),
(89, 7, 'ÁO CROPTOP CỔ XẾP NẾP', 874000, '0.00', 400, '2022-05-20 14:49:16'),
(90, 7, 'ÁO CROPTOP BO CHUN GẤU', 600000, '0.00', 300, '2022-05-20 14:49:16'),
(91, 9, 'CHÂN VÁY XẾP LI SOLE', 1090000, '2.00', 120, '2022-05-20 15:04:27'),
(92, 9, 'CHÂN VÁY MIDI THẮT EO', 1032000, '0.00', 190, '2022-05-20 15:04:27'),
(93, 9, 'CHÂN VÁY CHIFFON MIDI', 650000, '0.00', 130, '2022-05-20 15:04:27'),
(94, 9, 'CHÂN VÁY XẾP LY GẤU LỆCH', 553000, '0.00', 80, '2022-05-20 15:04:27'),
(95, 9, 'CHÂN VÁY XẾP LY NGANG GỐI', 700000, '6.00', 100, '2022-05-20 15:04:27');

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
(51, 20, 50, 30, 90, 20),
(52, 20, 50, 30, 90, 20),
(53, 20, 50, 30, 90, 20),
(54, 20, 50, 30, 90, 20),
(55, 20, 50, 30, 90, 20),
(56, 20, 50, 30, 90, 20),
(57, 20, 50, 30, 90, 20),
(58, 20, 50, 30, 90, 20),
(59, 20, 50, 30, 90, 20),
(60, 20, 50, 30, 90, 20),
(61, 20, 50, 30, 90, 20),
(62, 20, 50, 30, 90, 20),
(63, 20, 50, 30, 90, 20),
(64, 20, 50, 30, 90, 20),
(65, 20, 90, 30, 90, 20),
(66, 20, 50, 10, 90, 20),
(67, 20, 50, 20, 90, 20),
(68, 20, 30, 30, 90, 20),
(69, 20, 50, 40, 50, 20),
(70, 20, 50, 30, 90, 10),
(71, 50, 50, 20, 20, 10),
(72, 30, 40, 30, 15, 15),
(73, 10, 10, 10, 15, 10),
(74, 2, 2, 2, 2, 2),
(75, 50, 20, 30, 30, 40),
(76, 40, 40, 40, 40, 40),
(77, 60, 50, 70, 60, 60),
(78, 30, 30, 30, 30, 30),
(79, 80, 60, 70, 90, 100),
(80, 20, 20, 10, 25, 25),
(81, 100, 150, 50, 100, 100),
(82, 40, 40, 40, 60, 20),
(83, 100, 100, 100, 100, 0),
(84, 60, 60, 60, 60, 60),
(85, 90, 25, 25, 25, 25),
(86, 60, 60, 60, 60, 60),
(87, 40, 60, 40, 40, 20),
(88, 30, 50, 50, 50, 50),
(89, 50, 100, 50, 50, 150),
(90, 60, 60, 60, 60, 60),
(91, 20, 25, 25, 25, 25),
(92, 90, 25, 25, 25, 25),
(93, 30, 25, 25, 25, 25),
(94, 10, 20, 20, 20, 10),
(95, 20, 20, 20, 20, 20);

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
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'mã sản phẩm', AUTO_INCREMENT=96;

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
