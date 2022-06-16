<?php
session_start();
require "../connect_db.php";
$kh = $_SESSION['username'];
if ($_POST['U'] == 'update') {
	update_number($kh, $conn);
}
if ($_POST['U'] == 'delete') {
	delete_sp($kh, $conn);
}
function update_number($kh, $conn) {
	$sql1 = "UPDATE cart SET quantity='" . $_POST['quantity'] . "' where username='" . $kh . "' AND prod_id='" . $_POST['pro_id'] . "' AND size='" . $_POST['size'] . "' ";
	mysqli_query($conn, $sql1);
}
function delete_sp($kh, $conn) {
	$sql2 = "DELETE FROM cart WHERE username='" . $kh . "' AND prod_id='" . $_POST['pro_id'] . "' AND size='" . $_POST['size'] . "'";
	mysqli_query($conn, $sql2);
}

?>
