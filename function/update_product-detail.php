<?php
session_start();
require_once "../connect_db.php";
$kh = $_SESSION['username'];
$pro_id = $_POST['pro_id'];
$pro_size = $_POST['size'];
$soluong = $_POST['quantity'];

if (check($pro_id, $pro_size, $conn)) {
	update_number($kh, $soluong, $conn);
} else {
	insert_pro($kh, $soluong, $conn);
}

function update_number($kh, $quantity, $conn) {
	$sql1 = "UPDATE cart SET quantity= " . $_POST['quantity']." + quantity  where username='" . $kh . "' AND prod_id='" . $_POST['pro_id'] . "' AND size='" . $_POST['size'] . "' ";
	mysqli_query($conn, $sql1);
}
function insert_pro($kh, $soluong, $conn) {
	$sql1 = "INSERT INTO `cart`(`username`, `prod_id`, `size`, `quantity`) VALUES ('" . $kh . "','" . $_POST['pro_id'] . "','" . $_POST['size'] . "','" . $_POST['quantity'] . "')";
	$query1 = mysqli_query($conn, $sql1);
}
function check($pro_id, $pro_size, $conn) {
	$sql1 = "SELECT  prod_id  FROM cart WHERE prod_id='" . $_POST['pro_id'] . "' AND size='" . $_POST['size'] . "' ";
	$query = mysqli_query($conn, $sql1);
	return mysqli_num_rows($query) > 0;
}
