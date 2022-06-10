<?php
    session_start();
    if (!empty($_POST)) {
        if(isset($_COOKIE['username'])) {
            setcookie('username', null, -1);
        }
        if(isset($_SESSION['username'])) {
            unset($_SESSION['username']);
        }

        $username = $_POST['username'];
        $password = md5($_POST['password']);
        require_once('connect_db.php');
        $sql = "SELECT password, account_type FROM account WHERE username='$username'";
        $result = $conn->query($sql);
        if ($row = $result->fetch_assoc())
        {
            if ($row['password'] !== $password) {
                echo "<script>
                    history.back();
                    alert('Sai mật khẩu!');
                </script>";
                unset($_POST);
            } else if ($row['account_type'] == 0) {
                setcookie('username', $username, time() + (60 * 60 * 24 * 365));
                header('location: index.php');
            } else {
                $_SESSION['username'] = $username;
                header('location: admin/index_admin.php');
            }
        } else {
            echo "<script>
                    history.back();
                    alert('Sai tên đăng nhập hoặc mật khẩu!');
                </script>";
            unset($_POST);
        }
    }
    require_once('user/header.php');
    echo '<link rel="stylesheet" href="style/login.css">';
    require_once('user/menu.php');
?>
<section>
    <div>
        <form method="POST" class="dangnhap">
            <h2>Đăng Nhập</h2>
            <div class="user">Tài khoản: <input type="text" name="username" required></div>
            <div class="pass">Mật khẩu: <input type="password" name="password" required/></div>
            <div class="btdangnhap"><input type="submit" name="dangky" class="login" value="Đăng Nhập"/></div>
            <div class="btdangky"><input type="button" name="dangky" class="register" value="Đăng Ký" onclick="window.location.href='register.php';"></div>
        </form>
    </div>
</section>
<?php
    include_once('user/footer.php');
?>
