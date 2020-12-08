<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__ . '/../../bootstrap.php';
// Truy vấn database để lấy danh sách
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__ . '/../../dbconnect.php');

include_once('../pages/navbar.php');
// 2. Chuẩn bị câu truy vấn $sql
// Sử dụng HEREDOC của PHP để tạo câu truy vấn SQL với dạng dễ đọc, thân thiện với việc bảo trì code
$sql = <<<EOT
            SELECT  s.MASACH
                    ,s.TENSACH
                    ,s.MOTA
                    ,s.HINHANHSACH
                    ,s.GIAMUA
                    , ls.TENLOAISACH
                    , lv.TENLINHVUC
                    , tg.TENTACGIA
                    ,nkns.SOLUONG,nkns.NGAYNHAP
                    FROM `sach` s
                    JOIN `loaisach` ls ON s.MALOAISACH = ls.MALOAISACH
                    JOIN `linhvuc` lv ON s.MALINHVUC = lv.MALINHVUC
                    JOIN `nhatkinhapsach` nkns ON s.MASACH = nkns.MASACH
                    LEFT JOIN `tacgia` tg ON s.MATACGIA = tg.MATACGIA
                    ORDER BY s.MASACH DESC
EOT;

// 3. Thực thi câu truy vấn SQL để lấy về dữ liệu
$result = mysqli_query($conn, $sql);
// 4. Khi thực thi các truy vấn dạng SELECT, dữ liệu lấy về cần phải phân tích để sử dụng
// Thông thường, chúng ta sẽ sử dụng vòng lặp while để duyệt danh sách các dòng dữ liệu được SELECT
// Ta sẽ tạo 1 mảng array để chứa các dữ liệu được trả về
$data = [];
while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
   
    $data[] = array(
        's_ma' => $row['MASACH'],
        's_ten' => $row['TENSACH'],
        's_mota' => $row['MOTA'],
        's_hinhanh' => $row['HINHANHSACH'],
         // Sử dụng hàm number_format(số tiền, số lẻ thập phân, dấu phân cách số lẻ, dấu phân cách hàng nghìn) để định dạng số khi hiển thị trên giao diện. Vd: 15800000 -> format thành 15,800,000.66 vnđ
        's_gia' => number_format($row['GIAMUA'], 2, ".", ",") .'0'. ' vnđ',
        'ls_ten' => $row['TENLOAISACH'],
        'lv_ten' => $row['TENLINHVUC'],
        'tg_ten' => $row['TENTACGIA'],
        's_soluong' => number_format($row['SOLUONG'], 0, ".", ","),
        's_ngaynhap' => date('d/m/Y', strtotime($row['NGAYNHAP']))
  
        
        ,
    );
}
// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/sanpham/index.html.twig`
// với dữ liệu truyền vào file giao diện được đặt tên là `ds_sanpham`
echo $twig->render('backend/sach/index.html.twig', [
    'ds_sach' => $data,
    'ds_nav' => $data1
]);
