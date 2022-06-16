<?php
if (!isset($_SESSION['username'])) {
	echo "<script>
        alert('Vui lòng đăng nhập trước!');
        window.location.href = 'login.php';</script>";
	exit();
}
?>
