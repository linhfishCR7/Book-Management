<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__ . '/../../bootstrap.php';

// Truy vấn database
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__ . '/../../dbconnect.php');

/* --- 
   --- 2.Truy vấn dữ liệu sách
   --- 
*/
// Chuẩn bị câu truy vấn $sqlSelect, lấy dữ liệu ban đầu của record cần update
// Lấy giá trị khóa chính được truyền theo dạng QueryString Parameter key1=value1&key2=value2...
$s_ma = $_GET['s_ma'];

$sqlSelect = "SELECT * FROM `sach` s LEFT JOIN `tacgia` tg ON s.MATACGIA = tg.MATACGIA WHERE MASACH='$s_ma'";

// Thực thi câu truy vấn SQL để lấy về dữ liệu ban đầu của record cần update
$resultSelect = mysqli_query($conn, $sqlSelect);
$sachRow1 = mysqli_fetch_array($resultSelect, MYSQLI_ASSOC); // 1 record
/* --- End Truy vấn dữ liệu Sản phẩm theo khóa chính --- */

    // Đóng kết nối
    mysqli_close($conn);
// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/hinhsanpham/edit.html.twig`
echo $twig->render('backend/sach/modal.html.twig', [
    'sach1' => $sachRow1
]);
