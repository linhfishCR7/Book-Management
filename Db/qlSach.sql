-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for qly_nhasach
CREATE DATABASE IF NOT EXISTS `qly_nhasach` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `qly_nhasach`;

-- Dumping structure for table qly_nhasach.chitiethoadon
CREATE TABLE IF NOT EXISTS `chitiethoadon` (
  `MAHOADON` int(11) NOT NULL DEFAULT 0,
  `MASACH` char(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SOLUONG` int(11) NOT NULL,
  `MUCGIAMGIA` int(11) DEFAULT NULL,
  PRIMARY KEY (`MAHOADON`,`MASACH`),
  KEY `FK_CHITIETHOADON_MASACH` (`MASACH`),
  KEY `MAHOADON` (`MAHOADON`),
  CONSTRAINT `FK1_CHITIETHOADON_SACH` FOREIGN KEY (`MASACH`) REFERENCES `sach` (`MASACH`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_CHITIETHOADON_HOADON` FOREIGN KEY (`MAHOADON`) REFERENCES `hoadon` (`MAHOADON`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.chitiethoadon: ~0 rows (approximately)
/*!40000 ALTER TABLE `chitiethoadon` DISABLE KEYS */;
INSERT INTO `chitiethoadon` (`MAHOADON`, `MASACH`, `SOLUONG`, `MUCGIAMGIA`) VALUES
	(2, 'M3', 5, 0),
	(3, 'M7', 12, 0),
	(4, 'M12', 2, 0),
	(6, 'M19', 10, 0),
	(7, 'M21', 10, 0),
	(8, 'M22', 1, 350),
	(9, 'M23', 10, 0),
	(11, 'M27', 2, 94),
	(12, 'M29', 10, 0),
	(14, 'M30', 30, 0),
	(15, 'M31', 10, 0),
	(16, 'M32', 5, 0),
	(17, 'M33', 5, 0),
	(18, 'M35', 10, 0);
/*!40000 ALTER TABLE `chitiethoadon` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.hoadon
CREATE TABLE IF NOT EXISTS `hoadon` (
  `MAHOADON` int(11) NOT NULL DEFAULT 0,
  `TENKHACHHANG` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `NGAYLAP` date DEFAULT NULL,
  PRIMARY KEY (`MAHOADON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.hoadon: ~0 rows (approximately)
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` (`MAHOADON`, `TENKHACHHANG`, `NGAYLAP`) VALUES
	(1, 'Lê Ngọc Bội', '2020-10-08'),
	(2, 'Hà Văn Linh', '2020-09-08'),
	(3, 'Nguyễn Văn Choi', '2020-10-08'),
	(4, 'Bu Lum Xum', '2020-09-08'),
	(5, 'Dương Hóa', '2020-08-08'),
	(6, 'Doãng chí Bình', '2020-11-08'),
	(7, 'Hà My', '2020-10-08'),
	(8, 'Mẫn Gia', '2020-11-08'),
	(9, 'Công Thiện', '2020-12-04'),
	(10, 'Bùi Châu Gia Bảo', '2019-11-08'),
	(11, 'Lê Thị C', '2020-11-08'),
	(12, 'How Văn Tài Em', '2020-11-12'),
	(13, 'Đình Chí Công', '2020-11-10'),
	(14, 'More Gan', '2020-10-10'),
	(15, 'Hoàng D', '2020-07-08'),
	(16, 'Trần Văn Hết Thời', '2021-01-10'),
	(17, 'Phan Hoàng Linh', '2019-11-09'),
	(18, 'Phan Hoàng Linh', '2020-11-09'),
	(19, 'Nhật Hạ', '2020-11-08');
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;

-- Dumping structure for function qly_nhasach.HOADONCOSOLUONGSACHHON5
DELIMITER //
CREATE FUNCTION `HOADONCOSOLUONGSACHHON5`() RETURNS int(11)
BEGIN
RETURN (SELECT count(cthd.MAHOADON) AS SL FROM chitiethoadon cthd
WHERE cthd.SOLUONG >= 5);
END//
DELIMITER ;

-- Dumping structure for table qly_nhasach.kho
CREATE TABLE IF NOT EXISTS `kho` (
  `MASACH` char(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TONGSOLUONG` int(11) DEFAULT 0,
  `SOLUONGCON` int(11) DEFAULT 0,
  PRIMARY KEY (`MASACH`),
  KEY `MASACH` (`MASACH`),
  CONSTRAINT `FK1_KHO_SACH` FOREIGN KEY (`MASACH`) REFERENCES `sach` (`MASACH`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.kho: ~24 rows (approximately)
/*!40000 ALTER TABLE `kho` DISABLE KEYS */;
INSERT INTO `kho` (`MASACH`, `TONGSOLUONG`, `SOLUONGCON`) VALUES
	('M13', 20, 20),
	('M14', 10, 10),
	('M15', 20, 20),
	('M16', 10, 10),
	('M17', 20, 20),
	('M19', 20, 10),
	('M2', 10, 10),
	('M21', 20, 10),
	('M22', 10, 9),
	('M23', 20, 10),
	('M24', 10, 10),
	('M27', 5, 3),
	('M28', 10, 10),
	('M29', 50, 40),
	('M3', 20, 15),
	('M30', 40, 10),
	('M33', 15, 10),
	('M34', 20, 20),
	('M35', 20, 10),
	('M4', 10, 10),
	('M6', 10, 10),
	('M7', 20, 8),
	('M8', 10, 10),
	('M9', 20, 20);
/*!40000 ALTER TABLE `kho` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.linhvuc
CREATE TABLE IF NOT EXISTS `linhvuc` (
  `MALINHVUC` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TENLINHVUC` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MALINHVUC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.linhvuc: ~12 rows (approximately)
/*!40000 ALTER TABLE `linhvuc` DISABLE KEYS */;
INSERT INTO `linhvuc` (`MALINHVUC`, `TENLINHVUC`) VALUES
	('CN1', 'Kinh tế và quản trị kinh doanh'),
	('CN10', 'Sách Giáo Khoa'),
	('CN11', 'Sách Học Ngoại Ngữ/Từ Điển'),
	('CN12', 'Tạp Chí'),
	('CN2', 'Thiếu Nhi'),
	('CN3', 'Tâm Lý/Giáo Dục'),
	('CN4', 'Kiến Trúc/Hội Họa/Điện Ảnh'),
	('CN5', 'Văn Hoá/Du Lịch'),
	('CN6', 'Tâm Linh/Tôn Giáo'),
	('CN7', 'Truyện Tranh/Manga/Comic'),
	('CN8', 'Thường Thức/Đời Sống'),
	('CN9', 'Sách Chuyên Ngành');
/*!40000 ALTER TABLE `linhvuc` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.loaisach
CREATE TABLE IF NOT EXISTS `loaisach` (
  `MALOAISACH` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TENLOAISACH` text CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MALOAISACH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.loaisach: ~3 rows (approximately)
/*!40000 ALTER TABLE `loaisach` DISABLE KEYS */;
INSERT INTO `loaisach` (`MALOAISACH`, `TENLOAISACH`) VALUES
	('L1', 'Sách mới'),
	('L2', 'Sách cũ'),
	('L3', 'Sách điện tử');
/*!40000 ALTER TABLE `loaisach` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `idMain` varchar(100) NOT NULL DEFAULT '#',
  `subList` varchar(100) NOT NULL DEFAULT '#',
  `subAdd` varchar(100) NOT NULL DEFAULT '#',
  `idSub` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table qly_nhasach.menu: ~8 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `name`, `idMain`, `subList`, `subAdd`, `idSub`) VALUES
	(1, 'Loại sách\r\n', '#loaisachSubMenu', '/quanlycuahangsach/backend/loaisach/index.php', '/quanlycuahangsach/backend/loaisach/create.php', 'loaisachSubMenu'),
	(2, 'Sách', '#sachSubMenu', '/quanlycuahangsach/backend/sach/index.php', '/quanlycuahangsach/backend/sach/create.php', 'sachSubMenu'),
	(3, 'Navbar', '#navbarSubMenu', '/quanlycuahangsach/backend/navbar/index.php', '/quanlycuahangsach/backend/navbar/create.php', 'navbarSubMenu'),
	(4, 'Lĩnh vực', '#linhvucSubMenu', '/quanlycuahangsach/backend/linhvuc/index.php', '/quanlycuahangsach/backend/linhvuc/create.php', 'linhvucSubMenu'),
	(7, 'Hóa Đơn', '#hoadonSubMenu', '/quanlycuahangsach/backend/hoadon/index.php', '/quanlycuahangsach/backend/hoadon/create.php', 'hoadonSubMenu'),
	(8, 'Lĩnh vực', '#linhvucSubmenu', '/quanlycuahangsach/backend/linhvuc/index.php', '/quanlycuahangsach/backend/linhvuc/create.php', 'linhvucSubmenu'),
	(9, 'Nhật Ký Nhập Sách', '#nhatkynhapsachSubMenu', '/quanlycuahangsach/backend/nhatkinhapsach/index.php', '/quanlycuahangsach/backend/nhatkinhapsach/create.php', 'nhatkynhapsachSubMenu'),
	(10, 'Tác Giả', '#tacgiaSubMenu', '/quanlycuahangsach/backend/tacgia/index.php', '/quanlycuahangsach/backend/tacgia/create.php', 'tacgiaSubMenu');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.nhatkinhapsach
CREATE TABLE IF NOT EXISTS `nhatkinhapsach` (
  `MASACH` char(13) COLLATE utf8_unicode_ci NOT NULL,
  `SOLUONG` int(11) NOT NULL,
  `NGAYNHAP` date DEFAULT NULL,
  PRIMARY KEY (`MASACH`),
  KEY `MASACH` (`MASACH`),
  CONSTRAINT `FK1_NHATKINHAPSACH_SACH` FOREIGN KEY (`MASACH`) REFERENCES `sach` (`MASACH`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.nhatkinhapsach: ~3 rows (approximately)
/*!40000 ALTER TABLE `nhatkinhapsach` DISABLE KEYS */;
INSERT INTO `nhatkinhapsach` (`MASACH`, `SOLUONG`, `NGAYNHAP`) VALUES
	('M1', 20, '2020-11-08'),
	('M12', 8, '2020-11-08'),
	('M13', 20, '2020-11-09');
/*!40000 ALTER TABLE `nhatkinhapsach` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.sach
CREATE TABLE IF NOT EXISTS `sach` (
  `MASACH` char(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TENSACH` varchar(100) CHARACTER SET utf8 NOT NULL,
  `HINHANHSACH` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'HinhMau.jpg',
  `MOTA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `MATACGIA` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `MALOAISACH` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `MALINHVUC` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `GIAMUA` int(11) NOT NULL,
  PRIMARY KEY (`MASACH`),
  KEY `FK_SACH_MATACGIA` (`MATACGIA`),
  KEY `FK_SACH_MALOAISACH` (`MALOAISACH`),
  KEY `FK_SACH_MALINHVUC` (`MALINHVUC`),
  CONSTRAINT `FK1_SACH_TACGIA` FOREIGN KEY (`MATACGIA`) REFERENCES `tacgia` (`MATACGIA`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_SACH_LOAISACH` FOREIGN KEY (`MALOAISACH`) REFERENCES `loaisach` (`MALOAISACH`) ON UPDATE CASCADE,
  CONSTRAINT `FK3_SACH_LINHVUC` FOREIGN KEY (`MALINHVUC`) REFERENCES `linhvuc` (`MALINHVUC`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.sach: ~29 rows (approximately)
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
INSERT INTO `sach` (`MASACH`, `TENSACH`, `HINHANHSACH`, `MOTA`, `MATACGIA`, `MALOAISACH`, `MALINHVUC`, `GIAMUA`) VALUES
	('M1', 'Bảy Ngày Phiêu Lãng', '', '<p><strong>Minerva Highwood, một c&ocirc; n&agrave;ng kh&ocirc;ng m&agrave;ng đến y&ecirc;u đương của Vịnh Spindle, cần đến Scotland.Colin Sandhurt &ndash; Hu&acirc;n tước Payne, một kẻ ph&oacute;ng đ&atilde;ng bậc nhất, đếm từng ng&agrave;y để rời khỏi Vịnh Spindle.Họ trở th&agrave;nh đối t&aacute;c một c&aacute;ch thần k&igrave; v&agrave; bất đắc dĩ. ...</strong></p>', 'TG1', 'L1', 'CN5', 135),
	('M11', 'Thành Công Hôm Nay Chưa Chắc Thành Đạt Ngày Mai', 'book-1-2.jpg', '<p><strong>Th&agrave;nh C&ocirc;ng Kh&ocirc;ng C&ograve;n L&agrave; B&iacute; Mật của t&aacute;c giả Noah l&agrave; một bước nhảy vọt đ&aacute;ng kể. Trong một thế hệ, hiếm c&oacute; ai chịu loay hoay t&igrave;m c&acirc;u trả lời vừa đơn giản vừa hiệu quả cho c&acirc;u hỏi cũ r&iacute;ch: &ldquo;Tại sao c&oacute; qu&aacute; nhiều người tự tước đi th&agrave;nh c&ocirc;ng của bản th&acirc;n m&agrave; lẽ ra họ c&oacute; khả năng đạt được?&rdquo;</strong></p>', 'TG6', 'L1', 'CN5', 205),
	('M12', 'Biến Tầm Nhìn Thành Hành Động', 'book-2-1.jpg', NULL, 'TG1', 'L1', 'CN5', 198),
	('M13', 'Trò Bịp Trên Phố Wall (Tái bản năm 2018)', 'l1.jpg', NULL, 'TG8', 'L1', 'CN5', 180),
	('M14', 'Trò Bịp Trên Phố Wall (Tái bản năm 2018)', 'book-5-1.jpg', NULL, 'TG8', 'L2', 'CN5', 159),
	('M15', 'Trò Bịp Trên Phố Wall (Tái bản năm 2018)', 'book-2.jpg', NULL, 'TG8', 'L3', 'CN5', 120),
	('M16', 'Người Thông Minh Giải Quyết Vấn Đề Như Thế Nào? (Tái bản năm 2020)', 'l13.jpg', NULL, 'TG9', 'L1', 'CN8', 320),
	('M17', 'Mùa Tiểu Học Cuối Cùng', 'book-1.jpg', NULL, 'TG9', 'L1', 'CN2', 55),
	('M19', 'Illustrated Classics - Những Câu Chuyện Cổ Tích Hay Nhất Thế Giới', 'book-3.jpg', NULL, 'TG9', 'L1', 'CN2', 135),
	('M2', 'Chuyện Tình Lúc Nửa Đêm', 'shopcart-1.jpg', NULL, 'TG1', 'L1', 'CN5', 198),
	('M21', 'Hạnh Phúc Không Tự Đến, Đau Khổ Không Tự Đi', 'l7.jpg', NULL, 'TG10', 'L1', 'CN3', 205),
	('M22', 'The Story Of Art - Câu Chuyện Nghệ Thuật', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/81/TheStoryOfArt.jpg/220px-TheStoryOfArt.jpg', NULL, 'TG11', 'L1', 'CN4', 999),
	('M23', 'Không Ảnh Đảo Và Bờ Biển Việt Nam', 'l12.jpg', NULL, 'TG12', 'L1', 'CN4', 409),
	('M24', 'Toàn Thư Chiêm Tinh Học Nhập Môn', 'l11.jpg', NULL, 'TG12', 'L1', 'CN6', 909),
	('M27', 'Giáo Trình Thực Hành Kiểm Thử Phần Mềm', 'l8.jpg', NULL, 'TG15', 'L1', 'CN9', 235),
	('M28', 'Lập Trình Windows Form Và Web Form Với C#', 'book-5.jpg', NULL, 'TG15', 'L1', 'CN9', 108),
	('M29', 'Bí Quyết Chinh Phục Điểm Cao Kì Thi THPT Quốc Gia Môn Vật Lí - Tập 1', 'book-6-1.jpg', NULL, 'TG16', 'L1', 'CN10', 135),
	('M3', 'Điều Tuyệt Vời Nhất Của Thanh Xuân', 'book-4.jpg', NULL, 'TG2', 'L1', 'CN5', 150),
	('M30', 'Bí Quyết Chinh Phục Điểm Cao Kì Thi THPT Quốc Gia Môn Vật Lí - Tập 2', 'book-3-1.jpg', NULL, 'TG16', 'L1', 'CN10', 153),
	('M31', 'Barron IELTS Practice Exams (1st edition)', 'https://www.eflbooks.co.uk/bookimages/9781438011790.jpg', NULL, 'TG16', 'L1', 'CN11', 250),
	('M32', 'Barron IELTS Practice Exams (2nd edition)', 'shopcart-2.jpg', NULL, 'TG16', 'L1', 'CN11', 255),
	('M33', 'Barron IELTS Practice Exams (3rd edition)', 'book-6.jpg', NULL, 'TG16', 'L1', 'CN11', 260),
	('M34', 'Thiên Thần Nhỏ - Ấn Phẩm Của Báo Tiền Phong (Số 391)', '', NULL, 'TG16', 'L1', 'CN12', 235),
	('M35', 'Wowweekend - Số 4', 'https://www.wowweekend.vn/document_root/upload/articles/image/BrowseContent/WWK%20News/WWK%20Vol%204/1.jpg', NULL, 'TG16', 'L1', 'CN12', 108),
	('M4', 'Điều Tuyệt Vời Nhất Của Thanh Xuân', 'l9.jpg', NULL, 'TG2', 'L3', 'CN5', 80),
	('M6', 'Yêu Anh Hơn Cả Tử Thần', 'book-4-1.jpg', NULL, 'TG3', 'L1', 'CN5', 68),
	('M7', 'Thực Thi Xuất Sắc', 'https://www.pace.edu.vn/Uploads/PACE_BOOKS/thuc_thi_xuat_sac/Thucthixuatsac_web_700x650.jpg', NULL, 'TG4', 'L1', 'CN1', 158),
	('M8', 'Discover Your True North', 'https://th.bing.com/th/id/OIP.g7m0MP7ljOqZVk-VfZV3MgHaLL?pid=Api&rs=1', NULL, 'TG5', 'L1', 'CN1', 155),
	('M9', 'Discover Your True North', 'book-1-1.jpg', NULL, 'TG5', 'L2', 'CN1', 155);
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.sachkhuyenmai
CREATE TABLE IF NOT EXISTS `sachkhuyenmai` (
  `MASACH` char(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `MUCGIAMGIA` int(11) NOT NULL,
  PRIMARY KEY (`MASACH`),
  KEY `MASACH` (`MASACH`),
  CONSTRAINT `FK1_SACHKHUYENMAI_SACH` FOREIGN KEY (`MASACH`) REFERENCES `sach` (`MASACH`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.sachkhuyenmai: ~10 rows (approximately)
/*!40000 ALTER TABLE `sachkhuyenmai` DISABLE KEYS */;
INSERT INTO `sachkhuyenmai` (`MASACH`, `MUCGIAMGIA`) VALUES
	('M11', 0),
	('M12', 1),
	('M14', 0),
	('M17', 0),
	('M22', 0),
	('M27', 0),
	('M31', 1),
	('M33', 0),
	('M34', 0),
	('M8', 0);
/*!40000 ALTER TABLE `sachkhuyenmai` ENABLE KEYS */;

-- Dumping structure for procedure qly_nhasach.SC_GMAX
DELIMITER //
CREATE PROCEDURE `SC_GMAX`()
BEGIN
SELECT TENSACH,GIAMUA
FROM sach
WHERE GIAMUA =
(SELECT MAX(s.GIAMUA)
FROM sach as s JOIN loaisach as ls
on s.MALOAISACH=ls.MALOAISACH
WHERE ls.TENLOAISACH="Sách cũ")
AND MALOAISACH = 
(SELECT DISTINCT s.MALOAISACH
FROM sach as s JOIN loaisach as ls
on s.MALOAISACH=ls.MALOAISACH
WHERE ls.TENLOAISACH="Sách cũ");
END//
DELIMITER ;

-- Dumping structure for procedure qly_nhasach.SGGMAX
DELIMITER //
CREATE PROCEDURE `SGGMAX`()
BEGIN
        SELECT s.TENSACH,skm.MUCGIAMGIA
        FROM sach as s JOIN sachkhuyenmai as skm
       on s.MASACH = skm.MASACH    
         WHERE skm.MUCGIAMGIA=
         (SELECT max(mucgiamgia)
          FROM sachkhuyenmai);
END//
DELIMITER ;

-- Dumping structure for function qly_nhasach.SOHOADONTRONGTHANGGANNHAT
DELIMITER //
CREATE FUNCTION `SOHOADONTRONGTHANGGANNHAT`() RETURNS int(11)
BEGIN
RETURN (SELECT count(hd.MAHOADON) AS SL FROM hoadon hd
WHERE hd.NGAYLAP >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
GROUP BY month(hd.NGAYLAP),year(hd.NGAYLAP));
END//
DELIMITER ;

-- Dumping structure for function qly_nhasach.SOLUONGCON
DELIMITER //
CREATE FUNCTION `SOLUONGCON`() RETURNS int(11)
BEGIN
	RETURN (SELECT count(soluongcon)  FROM kho WHERE SOLUONGCON >=40);
END//
DELIMITER ;

-- Dumping structure for function qly_nhasach.SOLUONGLINHVUC
DELIMITER //
CREATE FUNCTION `SOLUONGLINHVUC`() RETURNS int(11)
BEGIN
	RETURN (SELECT COUNT(MALINHVUC)  FROM linhvuc );
END//
DELIMITER ;

-- Dumping structure for function qly_nhasach.SOLUONGLOAISACH
DELIMITER //
CREATE FUNCTION `SOLUONGLOAISACH`() RETURNS int(11)
BEGIN
	RETURN (SELECT COUNT(MALOAISACH)  FROM loaisach );
END//
DELIMITER ;

-- Dumping structure for procedure qly_nhasach.SP_DT_MAX
DELIMITER //
CREATE PROCEDURE `SP_DT_MAX`()
BEGIN
SELECT s.TENSACH, SUM(s.GIAMUA * cthd.SOLUONG) TongThanhTien
FROM hoadon hd
JOIN chitiethoadon cthd ON hd.MAHOADON = cthd.MAHOADON
JOIN sach s ON s.MASACH = cthd.MASACH
WHERE hd.NGAYLAP >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
GROUP BY s.TENSACH
ORDER BY TongThanhTien DESC
LIMIT 0,3;
END//
DELIMITER ;

-- Dumping structure for table qly_nhasach.tacgia
CREATE TABLE IF NOT EXISTS `tacgia` (
  `MATACGIA` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TENTACGIA` varchar(40) CHARACTER SET utf8 NOT NULL,
  `NAMSINH` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAMMAT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `QUEQUAN` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MATACGIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.tacgia: ~16 rows (approximately)
/*!40000 ALTER TABLE `tacgia` DISABLE KEYS */;
INSERT INTO `tacgia` (`MATACGIA`, `TENTACGIA`, `NAMSINH`, `NAMMAT`, `QUEQUAN`) VALUES
	('TG1', 'Chiêu Dương', NULL, NULL, NULL),
	('TG10', 'Dale Carnegie', NULL, NULL, NULL),
	('TG11', 'Phạm Công Luận', NULL, NULL, NULL),
	('TG12', 'Thích Nhất Hạnh', NULL, NULL, NULL),
	('TG13', 'Dale Carnegie & Associates', NULL, NULL, NULL),
	('TG14', 'Okyanmama', NULL, NULL, NULL),
	('TG15', 'Phạm Quang Huy & Phạm Quang Hiển', NULL, NULL, NULL),
	('TG16', 'Nhiều Tác Giả', NULL, NULL, NULL),
	('TG2', 'Katherine Weare', NULL, NULL, NULL),
	('TG3', 'Keigo Higashino', NULL, NULL, NULL),
	('TG4', 'Mai Long', NULL, NULL, NULL),
	('TG5', 'Phạm Lữ Ân', NULL, NULL, NULL),
	('TG6', 'Higashino Keigo', NULL, NULL, NULL),
	('TG7', 'Tô Hoài', NULL, NULL, NULL),
	('TG8', 'Tạ Huy Long', NULL, NULL, NULL),
	('TG9', 'Ngô Mạnh Lân', NULL, NULL, NULL);
/*!40000 ALTER TABLE `tacgia` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.taikhoan
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `USERNAME` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PASSWORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TEN` varchar(50) CHARACTER SET utf8 NOT NULL,
  `ROLE` bigint(20) NOT NULL DEFAULT 0 COMMENT '0: là nhân viên, 1: Admin, 2: khác',
  `NGAYLAMVIEC` date DEFAULT NULL,
  `CHUCVU` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.taikhoan: ~2 rows (approximately)
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` (`USERNAME`, `PASSWORD`, `TEN`, `ROLE`, `NGAYLAMVIEC`, `CHUCVU`) VALUES
	('admin', 'admin', 'asdad', 1, '2013-12-19', 'aaa'),
	('linh', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'linh', 0, '2020-10-29', 'sdsgg');
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.thongtinxuatban
CREATE TABLE IF NOT EXISTS `thongtinxuatban` (
  `MASACH` char(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LANTAIBAN` char(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAMXUATBAN` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NHAXUATBAN` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `GIABIA` int(11) NOT NULL,
  PRIMARY KEY (`MASACH`),
  KEY `MASACH` (`MASACH`),
  CONSTRAINT `FK1_THONGTINXUATBAN_SACH` FOREIGN KEY (`MASACH`) REFERENCES `sach` (`MASACH`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.thongtinxuatban: ~11 rows (approximately)
/*!40000 ALTER TABLE `thongtinxuatban` DISABLE KEYS */;
INSERT INTO `thongtinxuatban` (`MASACH`, `LANTAIBAN`, `NAMXUATBAN`, `NHAXUATBAN`, `GIABIA`) VALUES
	('M1', '2', '2020', 'Phương Nam Book', 500),
	('M11', '1', '2020', 'Nhã Nam', 500),
	('M12', '2', '2020', 'Nhã Nam', 450),
	('M13', '2', '2018', 'NXB Kim Đồng', 400),
	('M14', '3', '2019', 'Alpha Books', 600),
	('M15', '1', '2020', 'NXB Kim Đồng', 400),
	('M16', '2', '2020', 'NXB Trẻ', 400),
	('M17', '1', '2020', 'First News', 500),
	('M2', '1', '2020', 'NXB Kim Đồng', 400),
	('M21', '4', '2020', 'NXB Kim Đồng', 400),
	('M22', '3', '2019', 'Đinh Tị', 700);
/*!40000 ALTER TABLE `thongtinxuatban` ENABLE KEYS */;

-- Dumping structure for function qly_nhasach.TONGSOLUONGSACH
DELIMITER //
CREATE FUNCTION `TONGSOLUONGSACH`() RETURNS int(11)
BEGIN
	RETURN (SELECT sum(SOLUONGCON)  FROM kho );
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
