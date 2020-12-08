<?php 
//navbar
// 2. Chuẩn bị câu truy vấn $sql
$sql1 = "select * from `menu`";

// 3. Thực thi câu truy vấn SQL để lấy về dữ liệu
$result1 = mysqli_query($conn, $sql1);

// 4. Khi thực thi các truy vấn dạng SELECT, dữ liệu lấy về cần phải phân tích để sử dụng
// Thông thường, chúng ta sẽ sử dụng vòng lặp while để duyệt danh sách các dòng dữ liệu được SELECT
// Ta sẽ tạo 1 mảng array để chứa các dữ liệu được trả về
$data1 = [];
while($row1 = mysqli_fetch_array($result1, MYSQLI_ASSOC))
{
    $data1[] = array(
        'name' => $row1['name'],
        'idMain' => $row1['idMain'],
        'subList' => $row1['subList'],
        'subAdd' => $row1['subAdd'],
        'idSub' => $row1['idSub']

    );
}
//navbar