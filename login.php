<?php
    session_start();
    require_once('modules/function/account.php');
    logOut();
    if (!empty($_POST)) {
        $username = $_POST['username'];
        $password = md5($_POST['password']);
        require_once('connect_db.php');
        $sql = "SELECT password, account_type FROM account WHERE username='$username' AND password='$password'";
        $result = $conn->query($sql);
        if ($row = $result->fetch_array())
        {
             if ($row['account_type'] == 0) {
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
    require_once('site.php');
    loadHeader();
    echo '<link rel="stylesheet" href="style/login.css">';
    loadMenu();
?>
<section>
    <form method="POST" class="dangnhap" accept-charset="ASCII">
        <h2>Đăng Nhập</h2>
        <div class="user">Tài khoản: <input type="text" name="username" required></div>
        <div class="pass">Mật khẩu: <input type="password" name="password" required/></div>
        <div class="btdangnhap"><input type="submit" name="dangky" class="login" value="ĐĂNG NHẬP"/></div>
        <div class="btdangky">
            <input type="button" name="dangky" class="register" value="ĐĂNG KÝ" onclick="window.location.href='register.php';">
        </div>
    </form>
</section>
<?php
    loadFooter();
?>
