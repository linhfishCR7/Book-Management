<?php
// session_start();
// var_dump($_SESSION['user_logged']);die;


// Include file cấu hình ban đầu của `Twig`
require_once __DIR__ . '/../../bootstrap.php';
// Truy vấn database để lấy danh sách
if (!isset($_SESSION['user_logged'])) {
    header("location:/quanlycuahangsach/backend/error/errorChuaLogin.php");
}
if (isset($_SESSION['dashboard'])) {
    unset($_SESSION['dashboard']);
}
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__ . '/../../dbconnect.php');
include_once('../pages/navbar.php');

// 2. Chuẩn bị câu truy vấn $sql
// Sử dụng HEREDOC của PHP để tạo câu truy vấn SQL với dạng dễ đọc, thân thiện với việc bảo trì code
$sql = "SELECT `SOHOADONTRONGTHANGGANNHAT`() as SL";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_array($result, MYSQLI_ASSOC) ;

$sql1 = "SELECT `SOLUONGCON`() as SL";
$result1 = mysqli_query($conn, $sql1);
$row1 = mysqli_fetch_array($result1, MYSQLI_ASSOC) ;

$sql2 = "SELECT `SOLUONGLINHVUC`() as SL";
$result2 = mysqli_query($conn, $sql2);
$row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC) ;

$sql3 = "SELECT `TONGSOLUONGSACH`() as SL";
$result3 = mysqli_query($conn, $sql3);
$row3 = mysqli_fetch_array($result3, MYSQLI_ASSOC) ;

$sql4 = "SELECT `SOLUONGLOAISACH`() as SL";
$result4 = mysqli_query($conn, $sql4);
$row4 = mysqli_fetch_array($result4, MYSQLI_ASSOC) ;

$sql5 = "SELECT `HOADONCOSOLUONGSACHHON5`() as SL";
$result5 = mysqli_query($conn, $sql5);
$row5 = mysqli_fetch_array($result5, MYSQLI_ASSOC) ;
mysqli_close($conn);



// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/sanpham/index.html.twig`
// với dữ liệu truyền vào file giao diện được đặt tên là `ds_sanpham`
echo $twig->render('backend/pages/dashboard.html.twig', [
    'sl' => $row,
    'sl1' => $row1,
    'sl2' => $row2,
    'sl3' => $row3,
    'sl4' => $row4,
    'sl5' => $row5,
    'ds_nav' => $data1
   

]);
