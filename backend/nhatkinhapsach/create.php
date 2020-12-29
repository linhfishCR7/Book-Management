<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__.'/../../bootstrap.php';

// Truy vấn database
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__.'/../../dbconnect.php');
if (!isset($_SESSION['user_logged'])) {
    header("location:/quanlycuahangsach/backend/error/hack.php");
}
// 2. Nếu người dùng có bấm nút Đăng ký thì thực thi câu lệnh UPDATE
if(isset($_POST['btnSave'])) 
{
    // Lấy dữ liệu người dùng hiệu chỉnh gởi từ REQUEST POST    
    $ma = $_POST['nkns_ms'];
    $soluong = $_POST['nkns_sl'];
    $ngaynhap = $_POST['nkns_ngaynhap'];
   

    // Câu lệnh INSERT
    $sql = "INSERT INTO `nhatkinhapsach` (MASACH, SOLUONG,NGAYNHAP) VALUES ('" . $ma . "', '". $soluong ."','".$ngaynhap."');";

    // Thực thi INSERT
    mysqli_query($conn, $sql);

    // Đóng kết nối
    mysqli_close($conn);
    include_once('../flash/flash-create.php');

    // Sau khi cập nhật dữ liệu, tự động điều hướng về trang Danh sách
    header('location:index.php');
}

// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/nhatkinhapsach/create.html.twig`
echo $twig->render('backend/nhatkinhapsach/create.html.twig');