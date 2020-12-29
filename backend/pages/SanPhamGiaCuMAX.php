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

$sql2 = "CALL `SC_GMAX`()";

// 3. Thực thi câu truy vấn SQL để lấy về dữ liệu
$result2 = mysqli_query($conn, $sql2);
// 4. Khi thực thi các truy vấn dạng SELECT, dữ liệu lấy về cần phải phân tích để sử dụng
// Thông thường, chúng ta sẽ sử dụng vòng lặp while để duyệt danh sách các dòng dữ liệu được SELECT
// Ta sẽ tạo 1 mảng array để chứa các dữ liệu được trả về
$data2 = [];
while ($row2 = mysqli_fetch_array($result2, MYSQLI_ASSOC)) {

    $data2[] = array(
        'TENSACH' => $row2['TENSACH'],
        'GIAMUA' => $row2['GIAMUA']

    );
}
// 2. Chuẩn bị câu truy vấn $sql
// Sử dụng HEREDOC của PHP để tạo câu truy vấn SQL với dạng dễ đọc, thân thiện với việc bảo trì code




// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/sanpham/index.html.twig`
// với dữ liệu truyền vào file giao diện được đặt tên là `ds_sanpham`
echo $twig->render('backend/pages/SanPhamGiaCuMAX.html.twig', [
    'SC_GMAX' => $data2,
    'ds_nav' => $data1
]);
