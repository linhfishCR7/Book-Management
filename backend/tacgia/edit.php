<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__.'/../../bootstrap.php';

// Truy vấn database
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__.'/../../dbconnect.php');
if (!isset($_SESSION['user_logged'])) {
    header("location:/quanlycuahangsach/backend/error/hack.php");
}
// 2. Chuẩn bị câu truy vấn $sqlSelect, lấy dữ liệu ban đầu của record cần update
// Lấy giá trị khóa chính được truyền theo dạng QueryString Parameter key1=value1&key2=value2...
$ma = $_GET['tacgia_mtacgia'];
$sqlSelect = "SELECT * FROM `tacgia` WHERE MATACGIA='$ma';";

// 3. Thực thi câu truy vấn SQL để lấy về dữ liệu ban đầu của record cần update
$resultSelect = mysqli_query($conn, $sqlSelect);
$loaisanphamRow = mysqli_fetch_array($resultSelect, MYSQLI_ASSOC); // 1 record

// 4. Nếu người dùng có bấm nút Đăng ký thì thực thi câu lệnh UPDATE
if(isset($_POST['btnSave'])) 
{
    // Lấy dữ liệu người dùng hiệu chỉnh gởi từ REQUEST POST
    $ma = $_POST['tacgia_mtacgia'];
    $ten = $_POST['tacgia_tentacgia'];
    $namsinh = $_POST['tacgia_namsinh'];
    $nammat = $_POST['tacgia_nammat'];
    $quequan = $_POST['tacgia_quequan'];
    

    // Câu lệnh UPDATE
    $sql = "UPDATE `tacgia` SET TENTACGIA='$ten', NAMSINH='$namsinh', NAMMAT='$nammat',  QUEQUAN='$quequan' WHERE MATACGIA='$ma';";

    // Thực thi UPDATE
    mysqli_query($conn, $sql);

    // Đóng kết nối
    mysqli_close($conn);
    include_once('../flash/flash-edit.php');

    // Sau khi cập nhật dữ liệu, tự động điều hướng về trang Danh sách
    header('location:index.php');
}

// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/loaisanpham/edit.html.twig`
// với dữ liệu truyền vào file giao diện được đặt tên là `loaisanpham`
echo $twig->render('backend/tacgia/edit.html.twig', ['tacgia' => $loaisanphamRow] );