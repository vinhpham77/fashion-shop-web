<?php
require_once '../../connect_db.php';

if ($_POST['U'] == 'insert') {
	$macode = $_POST['macode'];
	$tencode = $_POST['tencode'];
	$tiengiam = $_POST['tiengiam'];
	$donvitinh = $_POST['donvitinh'];
	insert_mgg($macode, $tencode, $tiengiam, $donvitinh, $conn);
	header('Location: process_insert_mgg.php');
}

if ($_POST['U'] == 'delete') {
	$macode = $_POST['macode'];
	delete_mgg($macode, $conn);
}
function insert_mgg($macode, $tencode, $tiengiam, $donvitinh, $conn) {
	$sql1 = "INSERT INTO promotion(promo_code, promo_name, promo_price, calc_unit )VALUES ('" . $macode . "','" . $tencode . "','" . $tiengiam . "','" . $donvitinh . "')";
	mysqli_query($conn, $sql1);
}
function delete_mgg($macode, $conn) {
	$sql2 = "DELETE FROM promotion WHERE promo_code='" . $macode . "'";
	mysqli_query($conn, $sql2);
}
