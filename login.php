<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style/base.css">
<link defer rel="stylesheet" href="style/login.css"/>
<?php
    if (!empty($_POST)) {
        if(isset($_COOKIE['username'])) {
            unset($_COOKIE['username']);
            setcookie('username', null, -1);
        }

        $username = $_POST['username'];
        $password = md5($_POST['password']);
        require 'widget/connect_db.php';
        $sql = "SELECT * FROM account WHERE username='$username' AND password='$password'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0)
        {
            setcookie('username', $username, time() + (60 * 60 * 24 * 365));
            header('location: index.php');
        } else {
            echo "<script>
                    history.back();
                    alert('Sai tên đăng nhập hoặc mật khẩu!');
                </script>";
            unset($_POST);
        }
    }
?>
</head>
<body>
    <form method="post" action="" class="dangnhap">
        <h2>Đăng Nhập</h2>
        <div class="user">Username: <input type="text" name="username" required></div>
        <div class="pass">Password: <input type="password" name="password" required/></div>
        <div class="btdangnhap"><input type="submit" name="dangky" class="login" value="Đăng Nhập"/></div>
        <div class="btdangky"><input type="button" name="dangky" class="register" value="Đăng Ký" onclick="window.location.href='register.php';"></div>
    </form>
</body>
</html>
