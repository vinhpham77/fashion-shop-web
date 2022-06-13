<?php
    function directToLoginIfNot() {
        if (!isset($_COOKIE['username'])) {
            echo "<script>alert('Vui lòng đăng nhập trước!');
            window.location.href = 'login.php';</script>";
            exit();
        }
    }

    function logOut() {
        if(isset($_COOKIE['username'])) {
            setcookie('username', null, time() -1);
        }
    }
?>
