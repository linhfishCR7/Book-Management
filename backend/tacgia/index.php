<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__.'/../../bootstrap.php';

// Truy vấn database để lấy danh sách
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__.'/../../dbconnect.php');
//session đăng nhập
if (!isset($_SESSION['user_logged'])) {
    header("location:/quanlycuahangsach/backend/error/errorChuaLogin.php");
}
include_once('../pages/navbar.php');
//gỡ session alert
include_once('../flash/flash-index.php');


// 2. Chuẩn bị câu truy vấn $sql
$sql = "select * from `tacgia`";

// 3. Thực thi câu truy vấn SQL để lấy về dữ liệu
$result = mysqli_query($conn, $sql);

// var_dump($_SESSION['ls_ma']);die;
// 4. Khi thực thi các truy vấn dạng SELECT, dữ liệu lấy về cần phải phân tích để sử dụng
// Thông thường, chúng ta sẽ sử dụng vòng lặp while để duyệt danh sách các dòng dữ liệu được SELECT
// Ta sẽ tạo 1 mảng array để chứa các dữ liệu được trả về
$data = [];

while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{
    $data[] = array(
        'tacgia_mtacgia' => $row['MATACGIA'],
        'tacgia_tentacgia' => $row['TENTACGIA'],
        'tacgia_namsinh' => $row['NAMSINH'],
        'tacgia_nammat' => $row['NAMMAT'],
        'tacgia_quequan' => $row['QUEQUAN'],
    );
}

echo $twig->render('backend/tacgia/index.html.twig', [
    'ds_tacgia' => $data,
    'ds_nav' => $data1,
    ]
 );