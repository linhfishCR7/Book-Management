<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__ . '/../../bootstrap.php';

// Truy vấn database
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__ . '/../../dbconnect.php');

/* --- 
   --- 2.Truy vấn dữ liệu Loại sách
   --- 
*/
// Chuẩn bị câu truy vấn Loại sách
$sqlLoaiSach = "select * from `loaisach`";

// Thực thi câu truy vấn SQL để lấy về dữ liệu
$resultLoaiSach = mysqli_query($conn, $sqlLoaiSach);

// Khi thực thi các truy vấn dạng SELECT, dữ liệu lấy về cần phải phân tích để sử dụng
// Thông thường, chúng ta sẽ sử dụng vòng lặp while để duyệt danh sách các dòng dữ liệu được SELECT
// Ta sẽ tạo 1 mảng array để chứa các dữ liệu được trả về
$dataLoaiSach = [];
while ($rowLoaiSach = mysqli_fetch_array($resultLoaiSach, MYSQLI_ASSOC)) {
    $dataLoaiSach[] = array(
        'ls_ma' => $rowLoaiSach['MALOAISACH'],
        'ls_ten' => $rowLoaiSach['TENLOAISACH'],
    );
}
/* --- End Truy vấn dữ liệu Loại sách --- */

/* --- 
   --- 2.Truy vấn dữ liệu Lĩnh vực
   --- 
*/

$sqlLinhVuc = "select * from `linhvuc`";

$resultLinhVuc = mysqli_query($conn, $sqlLinhVuc);

$dataLinhVuc = [];
while ($rowLinhVuc = mysqli_fetch_array($resultLinhVuc, MYSQLI_ASSOC)) {
    $dataLinhVuc[] = array(
        'lv_ma' => $rowLinhVuc['MALINHVUC'],
        'lv_ten' => $rowLinhVuc['TENLINHVUC'],
    );
}
/* --- End Truy vấn dữ liệu Lĩnh vực --- */

/* --- 
   --- 2.Truy vấn dữ liệu Nhật ký nhập sách
   --- 
*/

// $sqlNhapSach = "select * from `nhatkynhapsach`";

// $resultNhapSach = mysqli_query($conn, $sqlNhapSach);

// $dataNhapSach = [];
// while($rowNhapSach = mysqli_fetch_array($resultNhapSach, MYSQLI_ASSOC))
// {
//     $dataNhapSach[] = array(
//         'nkns_ma' => $rowNhapSach['STT'],
//         's_ma' => $rowNhapSach['MASACH'],
//         'nkns_soluong' => $rowNhapSach['SOLUONG'],
//         'nkns_ngaynhap' => $rowNhapSach['NGAYNHAP'],
//     );
// }
/* --- End Truy vấn dữ liệu Nhật ký nhập sách --- */

/* --- 
   --- 2.Truy vấn dữ liệu Tác giả
   --- 
*/

$sqlTacGia = "select tg.MATACGIA,tg.TENTACGIA from `tacgia` tg ";

$resultTacGia = mysqli_query($conn, $sqlTacGia);

$dataTacGia = [];
while ($rowTacGia = mysqli_fetch_array($resultTacGia, MYSQLI_ASSOC)) {
    $dataTacGia[] = array(
        'tg_ma' => $rowTacGia['MATACGIA'],
        'tg_ten' => $rowTacGia['TENTACGIA'],

    );
}
/* --- End Truy vấn dữ liệu Tác giả --- */



// 2. Nếu người dùng có bấm nút Đăng ký thì thực thi câu lệnh UPDATE
if (isset($_POST['btnSave'])) {
    // Lấy dữ liệu người dùng hiệu chỉnh gởi từ REQUEST POST
    $s_ma = $_POST['s_ma'];
    $s_ten = $_POST['s_ten'];
    //$s_hinhanh = $_POST['s_hinhanh'];
    $s_mota = $_POST['s_mota'];
    $tg_ma = $_POST['tg_ma'];
    $ls_ma = $_POST['ls_ma'];
    $lv_ma = $_POST['lv_ma'];
    $s_gia = $_POST['s_gia'];

    // Xử lý hình ảnh
    // Nếu người dùng có chọn file để upload
    if (isset($_FILES['s_hinhanh'])) {
        // Đường dẫn để chứa thư mục upload trên ứng dụng web của chúng ta. Các bạn có thể tùy chỉnh theo ý các bạn.
        // Ví dụ: các file upload sẽ được lưu vào thư mục ../../assets/uploads
        $upload_dir = "../../assets/upload/";

        // Đối với mỗi file, sẽ có các thuộc tính như sau:
        // $_FILES['s_hinhanh']['name']     : Tên của file chúng ta upload
        // $_FILES['s_hinhanh']['type']     : Kiểu file mà chúng ta upload (hình ảnh, word, excel, pdf, txt, ...)
        // $_FILES['s_hinhanh']['tmp_name'] : Đường dẫn đến file tạm trên web server
        // $_FILES['s_hinhanh']['error']    : Trạng thái của file chúng ta upload, 0 => không có lỗi
        // $_FILES['s_hinhanh']['size']     : Kích thước của file chúng ta upload

        // Nếu file upload bị lỗi, tức là thuộc tính error > 0
        if ($_FILES['s_hinhanh']['error'] > 0) {
            echo 'File Upload Bị Lỗi';
            die;
        } else {
            // Tiến hành di chuyển file từ thư mục tạm trên server vào thư mục chúng ta muốn chứa các file uploads
            // Ví dụ: move file từ C:\xampp\tmp\php6091.tmp -> C:/xampp/htdocs/learning.nentang.vn/php/twig/assets/uploads/hoahong.jpg
            $s_hinhanh = $_FILES['s_hinhanh']['name'];
            $hinhanh = date('YmdHis') . '_' . $s_hinhanh; //20200530154922_hoahong.jpg

            move_uploaded_file($_FILES['s_hinhanh']['tmp_name'], $upload_dir . $hinhanh);
            //echo 'File Uploaded';
        }
    }
    // Câu lệnh INSERT
    $sql = "INSERT INTO `sach` (MASACH,TENSACH,HINHANHSACH,MOTA,MATACGIA,MALOAISACH,MALINHVUC,GIAMUA) VALUES ('" . $s_ma . "',
    '" . $s_ten . "','" . $hinhanh . "',
    '" . $s_mota . "','" . $tg_ma . "','" . $ls_ma . "','" . $lv_ma . "','" . $s_gia . "');";

    // Thực thi INSERT
    mysqli_query($conn, $sql);
    // var_dump( $sql);die;
    
    // Đóng kết nối
    mysqli_close($conn);
    //session alert
    include_once('../flash/flash-create.php');
    // Sau khi cập nhật dữ liệu, tự động điều hướng về trang Danh sách
    header('location:index.php');
} else if (isset($_POST['btnCancel'])) {
    header('location:index.php');
}

// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/loaisanpham/create.html.twig`
echo $twig->render('backend/sach/create.html.twig', [
    'ds_loaisach' => $dataLoaiSach,
    'ds_tacgia' => $dataTacGia,
    'ds_linhvuc' => $dataLinhVuc
]);
