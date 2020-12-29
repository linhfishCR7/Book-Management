<?php
// session_start();
// var_dump($_SESSION['user_logged']);die;


// Include file cấu hình ban đầu của `Twig`
require_once __DIR__ . '/../../bootstrap.php';
// Truy vấn database để lấy danh sách
if (!isset($_SESSION['user_logged'])) {
    header("location:/quanlycuahangsach/backend/error/errorChuaLogin.php");
}

// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__ . '/../../dbconnect.php');
include_once('../pages/navbar.php');

// 2. Chuẩn bị câu truy vấn $sql
// Sử dụng HEREDOC của PHP để tạo câu truy vấn SQL với dạng dễ đọc, thân thiện với việc bảo trì code
$sql3 = "CALL `SGGMAX`()";

// 3. Thực thi câu truy vấn SQL để lấy về dữ liệu
$result3 = mysqli_query($conn, $sql3);
// 4. Khi thực thi các truy vấn dạng SELECT, dữ liệu lấy về cần phải phân tích để sử dụng
// Thông thường, chúng ta sẽ sử dụng vòng lặp while để duyệt danh sách các dòng dữ liệu được SELECT
// Ta sẽ tạo 1 mảng array để chứa các dữ liệu được trả về
$data3 = [];
while ($row3= mysqli_fetch_array($result3, MYSQLI_ASSOC)) {

    $data3[] = array(
        'TENSACH' => $row3['TENSACH'],
        'MUCGIAMGIA' => $row3['MUCGIAMGIA']
    );
}
mysqli_close($conn);



// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/sanpham/index.html.twig`
// với dữ liệu truyền vào file giao diện được đặt tên là `ds_sanpham`
echo $twig->render('backend/pages/SachGiamGiaCaoNhat.html.twig', [
    'SGGMAX' => $data3,
    'ds_nav' => $data1
   

]);
