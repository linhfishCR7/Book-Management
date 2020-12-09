<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__.'/../../bootstrap.php';

// Truy vấn database để lấy danh sách
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__.'/../../dbconnect.php');
if (!isset($_SESSION['user_logged'])) {
    header("location:/quanlycuahangsach/backend/error/errorChuaLogin.php");
}
include_once('../pages/navbar.php');
//gỡ session alert
if (isset($_SESSION['status-insert'])) {
    unset($_SESSION['status-insert']);
}
if (isset($_SESSION['status-update'])) {
    unset($_SESSION['status-update']);
}
if (isset($_SESSION['status-delete'])) {
    unset($_SESSION['status-delete']);
}
// 2. Chuẩn bị câu truy vấn $sql
$sql = "select * from `loaisach` order by MALOAISACH";

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
        'ls_ma' => $row['MALOAISACH'],
        'ls_ten' => $row['TENLOAISACH']
        
        // 'ls_ten' => html_entity_decode ($row['TENLOAISACH']),
        // 'ls_ten' => htmlspecialchars_decode ($row['TENLOAISACH'], ENT_QUOTES)
        // 'ls_ten' => preg_replace("/&#?[a-z0-9]+;/i","",$row['TENLOAISACH'])
        // 'ls_ten' => htmlentities(preg_replace("/&#?[a-z0-9]+;/i","",$row['TENLOAISACH']), ENT_QUOTES, "UTF-8")
    );
}

echo $twig->render('backend/loaisach/index.html.twig', [
    'ds_loaisach' => $data,
    'ds_nav' => $data1,
    ]
 );