<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style/base.css">
<link rel="stylesheet" href="style/doimk.css"/>
<?php
require_once('connect_db.php'); 
    if (isset($_POST['doimk'])) {
        $username = $_POST['username'];
        $password_cu = md5($_POST['password_cu']);
        $password_moi = md5($_POST['password_moi']);
        $sql = "SELECT * FROM account WHERE username ='".$username."' AND password ='".$password_cu."'";
        $row = mysqli_query($conn,$sql);
        $count = mysqli_num_rows($row);
        if ($count > 0) {
            $sql_update = mysqli_query($conn,"UPDATE account SET password ='".$password_moi."'");
            echo '<p style="color:green">Mật khẩu đã được thay đổi</p>';
        } else {
            echo '<p style="color="red">Tài khoản hoặc mật khẩu không đúng , vui lòng nhập lại.</p>';
        }
    }
?>
</head>
<body>
    <form method="post" action="" class="doimk">
        <h2 class="ten">Đổi Mật Khẩu</h2>
        <div class="user">Username: <input type="text" name="username" value="" required> </div>
        <div class="pass">Password: <input type="password" name="password_cu" value="" required/></div>
        <div class="pass">A new password: <input type="password" name="password_moi" value="" required/></div>
        </div><div class="btluuthaydoi"><input type="submit" type="button" id="tollbar" name="doimk" class="password"style="margin-top: 19px;" value="Lưu Thay Đổi" ></div>
    </form>
</body>
</html>
