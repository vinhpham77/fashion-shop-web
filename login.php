<?php
    // include_once('modules/function/logout.php');
    if (!empty($_POST)) {
        $username = $_POST['username'];
        $password = md5($_POST['password']);
        require_once('connect_db.php');
        $sql = "SELECT password, account_type FROM account WHERE username='$username' AND password='$password' LIMIT 1";
        $result = $conn->query($sql);
        if ($row = $result->fetch_array())
        {
            $_SESSION['username'] = $username;
             if ($row['account_type'] == 0) {
                header('location: index.php');
            } else {
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
        <div class="form-group">
            <label for="username">Tài khoản:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" required/>
        </div>
        <div class="btdangnhap"><button type="submit" name="dangky" class="login btn--black">ĐĂNG NHẬP</button></div>
        <div class="btdangky">
            <button type="button" name="dangky" class="register btn--black" onclick="window.location.href='register.php';">ĐĂNG KÝ</button>
        </div>
    </form>
</section>
<?php
    loadFooter();
?>
