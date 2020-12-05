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
CREATE DATABASE IF NOT EXISTS `qly_nhasach` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `qly_nhasach`;

-- Dumping structure for table qly_nhasach.chitiethoadon
CREATE TABLE IF NOT EXISTS `chitiethoadon` (
  `MAHOADON` int(11) NOT NULL DEFAULT 0,
  `MASACH` char(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SOLUONG` int(11) NOT NULL,
  `MUCGIAMGIA` int(11) DEFAULT NULL,
  PRIMARY KEY (`MAHOADON`,`MASACH`),
  KEY `FK_CHITIETHOADON_MASACH` (`MASACH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.chitiethoadon: 18 rows
/*!40000 ALTER TABLE `chitiethoadon` DISABLE KEYS */;
INSERT INTO `chitiethoadon` (`MAHOADON`, `MASACH`, `SOLUONG`, `MUCGIAMGIA`) VALUES
	(1, 'M1', 10, 0),
	(2, 'M3', 5, 0),
	(3, 'M7', 12, 0),
	(4, 'M12', 2, 0),
	(5, 'M18', 10, 0),
	(6, 'M19', 10, 0),
	(7, 'M21', 10, 0),
	(8, 'M22', 1, 350),
	(9, 'M23', 10, 0),
	(10, 'M25', 10, 0),
	(11, 'M27', 2, 94),
	(12, 'M29', 10, 0),
	(13, 'M5', 10, 0),
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
  `TONGTIEN` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`MAHOADON`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.hoadon: 19 rows
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` (`MAHOADON`, `TENKHACHHANG`, `NGAYLAP`, `TONGTIEN`) VALUES
	(1, 'Lê Ngọc Bội', '2020-11-08', 1350),
	(2, 'Hà Văn Linh', '2020-11-08', 750),
	(3, 'Nguyễn Văn Choi', '2020-11-08', 840),
	(4, 'Bu Lum Xum', '2020-11-08', 1896),
	(5, 'Dương Hóa', '2020-11-08', 396),
	(6, 'Doãng chí Bình', '2020-11-08', 600),
	(7, 'Hà My', '2020-11-08', 600),
	(8, 'Mẫn Gia', '2020-11-08', 1350),
	(9, 'Công Thiện', '2020-11-08', 2050),
	(10, 'Bùi Châu Gia Bảo', '2020-11-08', 999),
	(11, 'Lê Thị C', '2020-11-08', 4090),
	(12, 'How Văn Tài Em', '2020-11-08', 350),
	(13, 'Đình Chí Công', '2020-11-08', 470),
	(14, 'More Gan', '2020-11-08', 1350),
	(15, 'Hoàng D', '2020-11-08', 4512),
	(16, 'Trần Văn Hết Thời', '2020-11-08', 2500),
	(17, 'Phan Hoàng Linh', '2020-11-08', 1300),
	(18, 'Phan Hoàng Linh', '2020-11-08', 1175),
	(19, 'Nhật Hạ', '2020-11-08', 1080);
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.kho
CREATE TABLE IF NOT EXISTS `kho` (
  `MASACH` char(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TONGSOLUONG` int(11) DEFAULT 0,
  `SOLUONGCON` int(11) DEFAULT 0,
  PRIMARY KEY (`MASACH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.kho: 35 rows
/*!40000 ALTER TABLE `kho` DISABLE KEYS */;
INSERT INTO `kho` (`MASACH`, `TONGSOLUONG`, `SOLUONGCON`) VALUES
	('M1', 20, 10),
	('M2', 10, 10),
	('M3', 20, 15),
	('M4', 10, 10),
	('M5', 20, 10),
	('M6', 10, 10),
	('M7', 20, 8),
	('M8', 10, 10),
	('M9', 20, 20),
	('M10', 10, 10),
	('M11', 20, 20),
	('M12', 8, 6),
	('M13', 20, 20),
	('M14', 10, 10),
	('M15', 20, 20),
	('M16', 10, 10),
	('M17', 20, 20),
	('M18', 20, 10),
	('M19', 20, 10),
	('M20', 10, 10),
	('M21', 20, 10),
	('M22', 10, 9),
	('M23', 20, 10),
	('M24', 10, 10),
	('M25', 20, 10),
	('M26', 6, 6),
	('M27', 5, 3),
	('M28', 10, 10),
	('M29', 50, 40),
	('M30', 40, 10),
	('M31', 30, 20),
	('M32', 15, 10),
	('M33', 15, 10),
	('M34', 20, 20),
	('M35', 20, 10);
/*!40000 ALTER TABLE `kho` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.linhvuc
CREATE TABLE IF NOT EXISTS `linhvuc` (
  `MALINHVUC` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TENLINHVUC` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MALINHVUC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.linhvuc: 12 rows
/*!40000 ALTER TABLE `linhvuc` DISABLE KEYS */;
INSERT INTO `linhvuc` (`MALINHVUC`, `TENLINHVUC`) VALUES
	('CN1', 'Kinh tế và quản trị kinh doanh'),
	('CN2', 'Thiếu Nhi'),
	('CN3', 'Tâm Lý/Giáo Dục'),
	('CN4', 'Kiến Trúc/Hội Họa/Điện Ảnh'),
	('CN5', 'Văn Hoá/Du Lịch'),
	('CN6', 'Tâm Linh/Tôn Giáo'),
	('CN7', 'Truyện Tranh/Manga/Comic'),
	('CN8', 'Thường Thức/Đời Sống'),
	('CN9', 'Sách Chuyên Ngành'),
	('CN10', 'Sách Giáo Khoa'),
	('CN11', 'Sách Học Ngoại Ngữ/Từ Điển'),
	('CN12', 'Tạp Chí');
/*!40000 ALTER TABLE `linhvuc` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.loaisach
CREATE TABLE IF NOT EXISTS `loaisach` (
  `MALOAISACH` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TENLOAISACH` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MALOAISACH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.loaisach: 3 rows
/*!40000 ALTER TABLE `loaisach` DISABLE KEYS */;
INSERT INTO `loaisach` (`MALOAISACH`, `TENLOAISACH`) VALUES
	('L3', 'Sách điện tử'),
	('L2', 'Sách cũ'),
	('L1', 'Sách mới');
/*!40000 ALTER TABLE `loaisach` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.nhatkinhapsach
CREATE TABLE IF NOT EXISTS `nhatkinhapsach` (
  `STT` int(11) NOT NULL AUTO_INCREMENT,
  `MASACH` char(13) COLLATE utf8_unicode_ci NOT NULL,
  `SOLUONG` int(11) NOT NULL,
  `NGAYNHAP` date DEFAULT NULL,
  PRIMARY KEY (`STT`),
  KEY `FK_NHATKINHAPSACH_MASACH` (`MASACH`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.nhatkinhapsach: 35 rows
/*!40000 ALTER TABLE `nhatkinhapsach` DISABLE KEYS */;
INSERT INTO `nhatkinhapsach` (`STT`, `MASACH`, `SOLUONG`, `NGAYNHAP`) VALUES
	(25, 'M24', 10, '2020-11-08'),
	(14, 'M14', 10, '2020-11-08'),
	(6, 'M6', 10, '2020-11-08'),
	(5, 'M5', 20, '2020-11-09'),
	(4, 'M4', 10, '2020-11-08'),
	(3, 'M3', 20, '2020-10-09'),
	(2, 'M2', 10, '2020-11-10'),
	(1, 'M1', 20, '2020-11-08'),
	(35, 'M34', 20, '2020-11-08'),
	(34, 'M33', 15, '2020-11-08'),
	(33, 'M32', 15, '2020-11-08'),
	(32, 'M31', 30, '2020-11-09'),
	(31, 'M30', 40, '2020-11-08'),
	(30, 'M29', 50, '2020-11-09'),
	(12, 'M12', 8, '2020-11-08'),
	(29, 'M28', 10, '2020-11-08'),
	(28, 'M27', 5, '2020-11-09'),
	(27, 'M26', 6, '2020-11-08'),
	(26, 'M25', 20, '2020-11-09'),
	(24, 'M23', 20, '2020-11-09'),
	(23, 'M22', 10, '2020-11-08'),
	(22, 'M21', 20, '2020-11-09'),
	(21, 'M20', 10, '2020-11-08'),
	(20, 'M19', 20, '2020-11-09'),
	(19, 'M18', 10, '2020-11-07'),
	(18, 'M18', 10, '2020-11-08'),
	(17, 'M17', 20, '2020-11-09'),
	(16, 'M16', 10, '2020-11-08'),
	(15, 'M15', 20, '2020-11-09'),
	(13, 'M13', 20, '2020-11-09'),
	(11, 'M11', 20, '2020-11-09'),
	(10, 'M10', 10, '2020-11-10'),
	(9, 'M9', 20, '2020-11-09'),
	(8, 'M8', 10, '2020-11-08'),
	(7, 'M7', 20, '2020-11-09');
/*!40000 ALTER TABLE `nhatkinhapsach` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.sach
CREATE TABLE IF NOT EXISTS `sach` (
  `MASACH` char(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TENSACH` varchar(100) CHARACTER SET utf8 NOT NULL,
  `HINHANHSACH` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'HinhMau.jpg',
  `MOTA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `MATACGIA` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `MALOAISACH` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MALINHVUC` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `GIAMUA` int(11) NOT NULL,
  PRIMARY KEY (`MASACH`),
  KEY `FK_SACH_MATACGIA` (`MATACGIA`),
  KEY `FK_SACH_MALOAISACH` (`MALOAISACH`),
  KEY `FK_SACH_MALINHVUC` (`MALINHVUC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.sach: 35 rows
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
INSERT INTO `sach` (`MASACH`, `TENSACH`, `HINHANHSACH`, `MOTA`, `MATACGIA`, `MALOAISACH`, `MALINHVUC`, `GIAMUA`) VALUES
	('M1', 'Bảy Ngày Phiêu Lãng', 'https://product.hstatic.net/200000122283/product/bay-ngay-phieu-lang-wtase_666711965fe14924b9b69c6406076e20_master.jpg', NULL, 'TG1', 'L1', 'CN5', 135),
	('M2', 'Chuyện Tình Lúc Nửa Đêm', 'https://salt.tikicdn.com/cache/w390/ts/product/3e/9e/53/da631f6a29a68c77a2b19e00ddb5b782.jpg', NULL, 'TG1', 'L1', 'CN5', 198),
	('M3', 'Điều Tuyệt Vời Nhất Của Thanh Xuân', 'https://cdn0.fahasa.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/d/i/dieu_tuyet_voi_nhat_cua_thanh_xuan___tap_1_1_2019_02_22_15_33_57.jpg', NULL, 'TG2', 'L1', 'CN5', 150),
	('M4', 'Điều Tuyệt Vời Nhất Của Thanh Xuân', 'https://pibook.vn/uploads/products/5902_01_09_17_dieu-tuyet-voi-nhat-cua-thanh-xuan-truyen-tranh-tap-1.jpg', NULL, 'TG2', 'L3', 'CN5', 80),
	('M5', 'Em', '', NULL, 'TG3', 'L1', 'CN5', 84),
	('M6', 'Yêu Anh Hơn Cả Tử Thần', 'https://cdnaz.truyenfull.vn/cover/o/eJzLyTDW180qTUxzzzNJtPC20A9LCXIti0hNNdb11HeEAad0_RQjF0OTgIrMtHRf_WIDXc9kEyMAKx4Ruw==/yeu-anh-hon-ca-tu-than.jpg', NULL, 'TG3', 'L1', 'CN5', 68),
	('M7', 'Thực Thi Xuất Sắc', 'https://www.pace.edu.vn/Uploads/PACE_BOOKS/thuc_thi_xuat_sac/Thucthixuatsac_web_700x650.jpg', NULL, 'TG4', 'L1', 'CN1', 158),
	('M8', 'Discover Your True North', 'https://th.bing.com/th/id/OIP.g7m0MP7ljOqZVk-VfZV3MgHaLL?pid=Api&rs=1', NULL, 'TG5', 'L1', 'CN1', 155),
	('M9', 'Discover Your True North', 'http://image.slidesharecdn.com/discoveryourtruenorth-150205111216-conversion-gate02/95/discover-your-true-north-1-638.jpg?cb=1423156421', NULL, 'TG5', 'L2', 'CN1', 155),
	('M10', 'Where To Play', '', NULL, 'TG1', 'L1', 'CN5', 185),
	('M11', 'Thành Công Hôm Nay Chưa Chắc Thành Đạt Ngày Mai', 'http://cdn-img-v1.webbnc.net/upload/web/51/510151/product/2017/09/09/07/03/150494058913.gif', NULL, 'TG6', 'L1', 'CN5', 205),
	('M12', 'Biến Tầm Nhìn Thành Hành Động', 'https://bookbuy.vn/Res/Images/Product/bien-tam-nhin-thanh-hanh-dong_108720_1.jpg', NULL, 'TG1', 'L1', 'CN5', 198),
	('M13', 'Trò Bịp Trên Phố Wall (Tái bản năm 2018)', 'https://nhatrangbooks.com/wp-content/uploads/2019/10/1-3228.jpg', NULL, 'TG8', 'L1', 'CN5', 180),
	('M14', 'Trò Bịp Trên Phố Wall (Tái bản năm 2018)', 'https://i.pinimg.com/originals/26/39/4f/26394ffd542b6f20cfb648efa92205a2.jpg', NULL, 'TG8', 'L2', 'CN5', 159),
	('M15', 'Trò Bịp Trên Phố Wall (Tái bản năm 2018)', 'https://bizweb.dktcdn.net/thumb/grande/100/283/734/products/13fdee8159121327216cd3bb88b6b5a7.jpg?v=1536659576660', NULL, 'TG8', 'L3', 'CN5', 120),
	('M16', 'Người Thông Minh Giải Quyết Vấn Đề Như Thế Nào? (Tái bản năm 2020)', 'https://salt.tikicdn.com/cache/w300/ts/product/e6/37/96/b507a660a3b71ea25da56a1ad240db3a.jpg', NULL, 'TG9', 'L1', 'CN8', 320),
	('M17', 'Mùa Tiểu Học Cuối Cùng', 'http://baodaknong.org.vn/database/image/2020/12/04/3456-VH-8.jpg', NULL, 'TG9', 'L1', 'CN2', 55),
	('M18', 'Nỗi Bất Hạnh Của Sophie', 'https://img.webtruyen.com/public/images/noibathanhcuasophieDkV3g5QCM4.jpg', NULL, 'TG9', 'L1', 'CN2', 60),
	('M19', 'Illustrated Classics - Những Câu Chuyện Cổ Tích Hay Nhất Thế Giới', 'https://bookbuy.vn/Res/Images/Product/illustrated-classics-nhung-cau-chuyen-co-tich-hay-nhat-the-gioi_108586_1.jpg', NULL, 'TG9', 'L1', 'CN2', 135),
	('M20', 'Từ Điển Tiếng "Em"', '', NULL, 'TG10', 'L1', 'CN3', 178),
	('M21', 'Hạnh Phúc Không Tự Đến, Đau Khổ Không Tự Đi', 'https://nhatrangbooks.com/wp-content/uploads/2019/10/591c2751b70f9d3f2b1faf2a3e117128.jpg', NULL, 'TG10', 'L1', 'CN3', 205),
	('M22', 'The Story Of Art - Câu Chuyện Nghệ Thuật', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/81/TheStoryOfArt.jpg/220px-TheStoryOfArt.jpg', NULL, 'TG11', 'L1', 'CN4', 999),
	('M23', 'Không Ảnh Đảo Và Bờ Biển Việt Nam', 'https://sachthongtan.vn/DataStore/4/89/Anh/Private/2015-3-1889/2015/03/18/9cc31846-9047-4d4c-8ed4-6c3bfb2cfd5e.jpg', NULL, 'TG12', 'L1', 'CN4', 409),
	('M24', 'Toàn Thư Chiêm Tinh Học Nhập Môn', 'https://readvii.com/wp-content/uploads/2020/04/sach-chiem-tinh-hoc-nhap-mon-212x300.png', NULL, 'TG12', 'L1', 'CN6', 909),
	('M25', 'Bé Tập Kể Chuyện - Nhạc Sĩ Dế Mèn', '', NULL, 'TG13', 'L1', 'CN7', 35),
	('M26', 'Vũ Điệu Làn Da (Tái bản năm 2020)', '', NULL, 'TG14', 'L1', 'CN8', 398),
	('M27', 'Giáo Trình Thực Hành Kiểm Thử Phần Mềm', 'https://nhatrangbooks.com/wp-content/uploads/2020/03/356776_giao-trinh-thuc-hanh-kiem-thu-phan-mem.jpg', NULL, 'TG15', 'L1', 'CN9', 235),
	('M28', 'Lập Trình Windows Form Và Web Form Với C#', 'https://i.pinimg.com/736x/bb/c2/63/bbc263b8c4f484bd713d2ab81ed4d335.jpg', NULL, 'TG15', 'L1', 'CN9', 108),
	('M29', 'Bí Quyết Chinh Phục Điểm Cao Kì Thi THPT Quốc Gia Môn Vật Lí - Tập 1', 'https://i.pinimg.com/originals/df/a7/ed/dfa7edd10c32343c1990225d67ac72bd.jpg', NULL, 'TG16', 'L1', 'CN10', 135),
	('M30', 'Bí Quyết Chinh Phục Điểm Cao Kì Thi THPT Quốc Gia Môn Vật Lí - Tập 2', 'https://ccbook.vn/wordpress/wp-content/uploads/2020/01/B%C3%AD-quy%E1%BA%BFt-chinh-ph%E1%BB%A5c-%C4%91i%E1%BB%83m-cao-k%C3%AC-thi-THPT-Qu%E1%BB%91c-gia-m%C3%B4n-V%E1%BA%ADt-l%C3%AD-T%E1%BA%ADp-2-1-e1578123434563.png', NULL, 'TG16', 'L1', 'CN10', 153),
	('M31', 'Barron IELTS Practice Exams (1st edition)', 'https://www.eflbooks.co.uk/bookimages/9781438011790.jpg', NULL, 'TG16', 'L1', 'CN11', 250),
	('M32', 'Barron IELTS Practice Exams (2nd edition)', 'https://th.bing.com/th/id/OIP.b0mPQOEduVcGdybZG6AzUQHaJk?pid=Api&rs=1', NULL, 'TG16', 'L1', 'CN11', 255),
	('M33', 'Barron IELTS Practice Exams (3rd edition)', 'https://i.pinimg.com/originals/2e/33/d0/2e33d0023b5054b9155b0e4db402c914.jpg', NULL, 'TG16', 'L1', 'CN11', 260),
	('M34', 'Thiên Thần Nhỏ - Ấn Phẩm Của Báo Tiền Phong (Số 391)', '', NULL, 'TG16', 'L1', 'CN12', 235),
	('M35', 'Wowweekend - Số 4', 'https://www.wowweekend.vn/document_root/upload/articles/image/BrowseContent/WWK%20News/WWK%20Vol%204/1.jpg', NULL, 'TG16', 'L1', 'CN12', 108);
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.sachkhuyenmai
CREATE TABLE IF NOT EXISTS `sachkhuyenmai` (
  `MASACH` char(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `MUCGIAMGIA` int(11) NOT NULL,
  PRIMARY KEY (`MASACH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.sachkhuyenmai: 6 rows
/*!40000 ALTER TABLE `sachkhuyenmai` DISABLE KEYS */;
INSERT INTO `sachkhuyenmai` (`MASACH`, `MUCGIAMGIA`) VALUES
	('M11', 0),
	('M14', 0),
	('M22', 0),
	('M12', 1),
	('M34', 0),
	('M27', 0);
/*!40000 ALTER TABLE `sachkhuyenmai` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.tacgia
CREATE TABLE IF NOT EXISTS `tacgia` (
  `MATACGIA` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TENTACGIA` varchar(40) CHARACTER SET utf8 NOT NULL,
  `NAMSINH` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAMMAT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `QUEQUAN` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MATACGIA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.tacgia: 16 rows
/*!40000 ALTER TABLE `tacgia` DISABLE KEYS */;
INSERT INTO `tacgia` (`MATACGIA`, `TENTACGIA`, `NAMSINH`, `NAMMAT`, `QUEQUAN`) VALUES
	('TG1', 'Chiêu Dương', NULL, NULL, NULL),
	('TG2', 'Katherine Weare', NULL, NULL, NULL),
	('TG3', 'Keigo Higashino', NULL, NULL, NULL),
	('TG4', 'Mai Long', NULL, NULL, NULL),
	('TG5', 'Phạm Lữ Ân', NULL, NULL, NULL),
	('TG6', 'Higashino Keigo', NULL, NULL, NULL),
	('TG7', 'Tô Hoài', NULL, NULL, NULL),
	('TG8', 'Tạ Huy Long', NULL, NULL, NULL),
	('TG9', 'Ngô Mạnh Lân', NULL, NULL, NULL),
	('TG10', 'Dale Carnegie', NULL, NULL, NULL),
	('TG11', 'Phạm Công Luận', NULL, NULL, NULL),
	('TG12', 'Thích Nhất Hạnh', NULL, NULL, NULL),
	('TG13', 'Dale Carnegie & Associates', NULL, NULL, NULL),
	('TG14', 'Okyanmama', NULL, NULL, NULL),
	('TG15', 'Phạm Quang Huy & Phạm Quang Hiển', NULL, NULL, NULL),
	('TG16', 'Nhiều Tác Giả', NULL, NULL, NULL);
/*!40000 ALTER TABLE `tacgia` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.taikhoan
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `USERNAME` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PASSWORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TEN` varchar(50) CHARACTER SET utf8 NOT NULL,
  `ID` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `NGAYLAMVIEC` date DEFAULT NULL,
  `CHUCVU` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.taikhoan: 2 rows
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
INSERT INTO `taikhoan` (`USERNAME`, `PASSWORD`, `TEN`, `ID`, `NGAYLAMVIEC`, `CHUCVU`) VALUES
	('admin', 'admin', 'asdad', '123213', '2013-12-19', 'aaa'),
	('linh', '123456', 'linh', '', '2020-10-29', 'sdsgg');
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;

-- Dumping structure for table qly_nhasach.thongtinxuatban
CREATE TABLE IF NOT EXISTS `thongtinxuatban` (
  `MASACH` char(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LANTAIBAN` char(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAMXUATBAN` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NHAXUATBAN` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `GIABIA` int(11) NOT NULL,
  PRIMARY KEY (`MASACH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table qly_nhasach.thongtinxuatban: 34 rows
/*!40000 ALTER TABLE `thongtinxuatban` DISABLE KEYS */;
INSERT INTO `thongtinxuatban` (`MASACH`, `LANTAIBAN`, `NAMXUATBAN`, `NHAXUATBAN`, `GIABIA`) VALUES
	('M1', '2', '2020', 'Phương Nam Book', 500),
	('M2', '1', '2020', 'NXB Kim Đồng', 400),
	('M3', '1', '2020', 'First News', 500),
	('M4', '4', '2020', 'Phương Nam Book', 300),
	('M5', '1', '2020', 'NXB Trẻ', 350),
	('M6', '4', '2020', 'NXB Kim Đồng', 400),
	('M7', '3', '2019', 'Đinh Tị', 700),
	('M8', '1', '2020', 'NXB Kim Đồng', 400),
	('M9', '2', '2020', 'Đinh Tị', 400),
	('M10', '1', '2020', 'Nhã Nam', 500),
	('M34', '2', '2020', 'Báo Sinh Viên - Hoa Học Trò', 600),
	('M11', '1', '2020', 'Phương Nam Book', 300),
	('M12', '2', '2020', 'Nhã Nam', 450),
	('M13', '2', '2018', 'NXB Kim Đồng', 400),
	('M14', '3', '2019', 'Alpha Books', 600),
	('M15', '1', '2020', 'NXB Kim Đồng', 400),
	('M16', '2', '2020', 'NXB Trẻ', 400),
	('M17', '1', '2020', 'First News', 500),
	('M18', '2', '2020', 'Phương Nam Book', 600),
	('M19', '4', '2020', 'Phương Nam Book', 300),
	('M20', '1', '2020', 'NXB Trẻ', 350),
	('M21', '4', '2020', 'NXB Kim Đồng', 400),
	('M22', '3', '2019', 'Đinh Tị', 700),
	('M23', '1', '2020', 'NXB Kim Đồng', 400),
	('M24', '2', '2020', 'Đinh Tị', 400),
	('M25', '1', '2020', 'Nhã Nam', 500),
	('M26', '1', '2020', 'Phương Nam Book', 300),
	('M27', '2', '2020', 'Nhã Nam', 450),
	('M28', '2', '2018', 'NXB Kim Đồng', 400),
	('M29', '1', '2020', 'NXB Kim Đồng', 400),
	('M30', '2', '2020', 'NXB Trẻ', 400),
	('M31', '1', '2020', 'First News', 500),
	('M32', '2', '2020', 'Phương Nam Book', 600),
	('M33', '1', '2020', 'NXB Trẻ', 350);
/*!40000 ALTER TABLE `thongtinxuatban` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
