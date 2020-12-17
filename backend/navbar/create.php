<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__ . '/../../bootstrap.php';

// Truy vấn database
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__ . '/../../dbconnect.php');
if (!isset($_SESSION['user_logged'])) {
    header("location:/quanlycuahangsach/backend/error/hack.php");
}
// 2. Nếu người dùng có bấm nút Đăng ký thì thực thi câu lệnh UPDATE
if (isset($_POST['btnSave'])) {
    // Lấy dữ liệu người dùng hiệu chỉnh gởi từ REQUEST POST
    $name = $_POST['name'];
    $idMain = $_POST['idMain'];
    $subList = $_POST['subList'];
    $subAdd = $_POST['subAdd'];
    $idSub = $_POST['idSub'];

    // Câu lệnh INSERT
    $sql = "INSERT INTO `menu` (name,idMain,subList,subAdd,idSub) VALUES ('" . $name . "','" . $idMain . "','" . $subList . "','" . $subAdd . "','" . $idSub . "');";

    // Thực thi INSERT
    mysqli_query($conn, $sql);
    // var_dump( $sql);die;
   
    // Đóng kết nối
    mysqli_close($conn);
    //session alert
    include_once('../flash/flash-create.php');

    //cài đặt session alert
    // Sau khi cập nhật dữ liệu, tự động điều hướng về trang Danh sách
    header('location:index.php');

} 
// else if (isset($_POST['btnCancel'])) {
//     header('location:index.php');
// }

// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/loaisanpham/create.html.twig`
echo $twig->render('backend/navbar/create.html.twig');
