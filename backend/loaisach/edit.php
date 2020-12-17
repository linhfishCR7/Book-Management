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
$ls_ma = $_GET['ls_ma'];
$sqlSelect = "SELECT * FROM `loaisach` WHERE MALOAISACH='$ls_ma'";

// 3. Thực thi câu truy vấn SQL để lấy về dữ liệu ban đầu của record cần update
$resultSelect = mysqli_query($conn, $sqlSelect);
$loaisachRow = mysqli_fetch_array($resultSelect, MYSQLI_ASSOC); // 1 record

// var_dump($loaisachRow);die;
// 4. Nếu người dùng có bấm nút Đăng ký thì thực thi câu lệnh UPDATE
if(isset($_POST['btnSave'])) 
{
    // Lấy dữ liệu người dùng hiệu chỉnh gởi từ REQUEST POST
    $maLoai = $_POST['ls_ma'];
    $tenLoai = $_POST['ls_ten'];

    // Câu lệnh UPDATE
    $sql = "UPDATE `loaisach` SET TENLOAISACH='$tenLoai' WHERE MALOAISACH='$maLoai';";

    // Thực thi UPDATE
    mysqli_query($conn, $sql);
    //session alert
    include_once('../flash/flash-edit.php');

    // Đóng kết nối
    mysqli_close($conn);

    //cài đặt session alert
    // Sau khi cập nhật dữ liệu, tự động điều hướng về trang Danh sách
    header('location:index.php');
}
// else if(isset($_POST['btnCancel'])){
//     header('location:index.php');
// }

echo $twig->render('backend/loaisach/edit.html.twig', ['loaisach' => $loaisachRow] );
