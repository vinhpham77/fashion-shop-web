<?php
    if (!isset($_COOKIE['username'])) {
        echo "<script>alert('Vui lòng đăng nhập trước!');
        window.location.href = 'login.php';</script>";
        exit();
    }
?>
