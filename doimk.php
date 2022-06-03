<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style/base.css">
<link rel="stylesheet" href="style/doimk.css"/>
<?php
require_once('connect_db.php'); 
    if (!empty($_POST)) {
        $username = $_POST['username'];
        $password_cu = md5($_POST['password_cu']);
        $password_moi = md5($_POST['password_moi']);
        $sql = "SELECT * FROM account WHERE username ='".$username."' AND password ='".$password_cu."'";
        $row = mysqli_query($conn,$sql);
        $count = mysqli_num_rows($row);
        if ($count > 0) {
            $sql_update = mysqli_query($conn,"UPDATE account SET password ='".$password_moi."'");
            echo "<script>
                    alert('Đổi mật khẩu thành công!');
                    window.location.href = 'login.php';
                </script>";
        } else {
            echo "<script>
                    alert('Sai tài khoản hoặc mật khẩu cũ! Vui lòng nhập lại');
                    history.back();
                </script>";
                unset($_POST);
        }
    }
?>
</head>
<body>
    <form method="post" action="" class="doimk">
        <h2 class="ten">Đổi Mật Khẩu</h2>
        <div class="user">Tên tài khoản: <input type="text" name="username" value="" required> </div>
        <div class="pass">Mật khẩu: <input type="password" name="password_cu" value="" required/></div>
        <div class="pass">Mật khẩu mới: <input type="password" name="password_moi" value="" required/></div>
        </div><div class="btluuthaydoi"><input type="submit" type="button" id="tollbar" name="doimk" class="password" style="margin-top: 19px;" value="Lưu Thay Đổi" ></div>
    </form>
</body>
</html>

