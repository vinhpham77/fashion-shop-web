<?php
    if (!isset($_SESSION['username'])) {
        header('location: ../login.php');
    }
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../fontawesome/css/all.min.css">
    <link rel="stylesheet" href="../style/styles.css">
    <link rel="stylesheet" href="../style/index.css">
    <link rel="stylesheet" href="../style/index_admin.css">
    <script defer src="../js/search_admin.js"></script>
    <title>Admin</title>
</head>
<div id="main">
       <div id="header">
            <ul class="nav nav-left">
                <li><a href="index_admin.php">Admin</a></li>
                <li><a href="khachhang.php">Khách hàng</a></li>
                <li><a href="sanpham.php">Sản phẩm</a></li>
                <li><a href="hoadon.php">Hóa đơn</a></li>
                <li><a href="magiamgia.php">Mã giảm giá</a></li>
            </ul>
            <ul class="nav nav-right">
                <li class="search">
                    <input type="text" placeholder="Tìm kiếm" id="input-search">
                    <i class="fa-solid fa-magnifying-glass search-icon"></i>
                </li>
                <li class="canhan">
                    <a>Cá nhân</a>
                    <ul class="subnav">
                        <li><a href="./dangxuat.php">Đăng xuất</a></li>
                        <li><a href="./doimk.php">Đổi mật khẩu</a></li>
                    </ul>
                </li>
            </ul>
       </div>
