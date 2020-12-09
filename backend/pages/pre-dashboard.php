<?php
// session_start();
// var_dump($_SESSION['user_logged']);die;


// Include file cấu hình ban đầu của `Twig`
require_once __DIR__ . '/../../bootstrap.php';
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__ . '/../../dbconnect.php');

echo $twig->render('backend/pages/pre-dashboard.html.twig');
