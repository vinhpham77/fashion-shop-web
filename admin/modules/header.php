<?php
session_start();
$valid = true;
if (!isset($_SESSION['username'])) {
	$valid = false;
} else {
	require '../connect_db.php';
	$user = $_SESSION['username'];
	$sql = "SELECT account_type FROM account WHERE username = '$user'";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		$type = $result->fetch_assoc()['account_type'];
		if ($type == 0) {
			$valid = false;
		}
	} else {
		$valid = false;
	}
}

if (!$valid) {
	header('location: ../');
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../fontawesome/css/all.min.css">
    <link rel="stylesheet" href="style/admin.css">
    <link rel="stylesheet" href="../style/base.css">
    <script defer src="./js/search_admin.js"></script>
    <title>Admin</title>
</head>
<div id="main">
       <div id="header">
            <ul class="nav nav-left">
                <li><a href="./">Admin</a></li>
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
                        <li><a href="../change-pwd.php">Đổi mật khẩu</a></li>
                    </ul>
                </li>
            </ul>
       </div>
