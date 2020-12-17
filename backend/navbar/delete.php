<?php
// Truy vấn database
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__.'/../../dbconnect.php');
if (!isset($_SESSION['user_logged'])) {
    header("location:/quanlycuahangsach/backend/error/hack.php");
}

// 2. Chuẩn bị câu truy vấn $sql
// Lấy giá trị khóa chính được truyền theo dạng QueryString Parameter key1=value1&key2=value2...
$id = $_POST['id'];
// var_dump($ls_ma);die;
$sql = "DELETE FROM `menu` WHERE id= '$id'" ;
// var_dump($sql);die;

// 3. Thực thi câu lệnh DELETE
$result = mysqli_query($conn, $sql);
//session alert
include_once('../flash/flash-delete.php');

// 4. Đóng kết nối
mysqli_close($conn);
    // var_dump($_SESSION['status-delete']);die;

// Sau khi cập nhật dữ liệu, tự động điều hướng về trang Danh sách
header('location:index.php');