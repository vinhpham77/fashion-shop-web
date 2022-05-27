<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style/base.css">
<link rel="stylesheet" href="style/formlogin.css"/>
<?php
    $username = $password = '';
    if (!empty($_POST)) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        require 'widget/connect_db.php';
        $sql = "SELECT * FROM account WHERE username='$username' AND password='$password'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0)
        {
            session_start();
            $_SESSION['username'] = $username;
            header('location: index.php');
        } else {
            echo 'TB';
        }
    }
?>
</head>
<body>
    <form method="post" action="" class="dangnhap">
        <h2>Đăng Nhập</h2>
<<<<<<< HEAD
        <div class="user">Username: <input type="text" name="username" value=""></div>
        <div class="pass">Password: <input type="password" name="password" value=""/></div>
=======
        <div class="user">Username: <input type="text" name="username" value="<?php echo $username; ?>" required></div>
        <div class="pass">Password: <input type="password" name="password" value="<?php echo $password; ?>" required/></div>
>>>>>>> 601bfec6c57d02de38e790c022e8f640534f007f
        <div class="btdangnhap"><input type="submit" name="dangky" class="login" value="Đăng Nhập"/></div>
        <div class="btdangky"><input type="button" name="dangky" class="register" value="Đăng Ký" onclick="window.location.href='register.php';"></div>
    </form>
</body>
</html>
