<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__ . '/../../bootstrap.php';
// Truy vấn database
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__ . '/../../dbconnect.php');
//bỏ session để tắt đi thông báo
unset($_SESSION['logout']);

if(isset($_SESSION['user_logged']) && !empty($_SESSION['user_logged'])) {
    header("location:/quanlycuahangsach/backend/error/errorDaLogin.php");
}else{
if(isset($_POST['btnLogin'])) {
    // Kiểm tra đăng nhập...
    $user = $_POST['user'];
    $password = sha1($_POST['password']);
    // Câu lệnh SELECT
    $sqlSelect = <<<EOT
    SELECT *
    FROM taikhoan tk
    WHERE tk.USERNAME = '$user' AND tk.PASSWORD = '$password';
EOT;
    // Thực thi SELECT
    $result = mysqli_query($conn, $sqlSelect);
    // var_dump($result);die;
    // Sử dụng hàm `mysqli_num_rows()` để đếm số dòng SELECT được
    // Nếu có bất kỳ dòng dữ liệu nào SELECT được <-> Người dùng có tồn tại và đã đúng thông tin USERNAME, PASSWORD
    if (mysqli_num_rows($result) > 0) {
        //echo 'Đăng nhập thành công!';
        // redirect đi đâu đó...
        header("location:/quanlycuahangsach/backend/pages/dashboard.php");

        $_SESSION['user_logged'] = $user;
        $_SESSION['dashboard'] = 1;

        
    } else {

        header("location:/quanlycuahangsach/backend/error/error.php");
    }
} else {
    echo $twig->render('backend/auth/login.html.twig');
}
}
?>