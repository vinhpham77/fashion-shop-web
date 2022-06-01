<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style/base.css">
<link rel="stylesheet" href="style/doimk.css"/>
<?php 
    if (isset($_POST['doimk'])) {
        $username = $_POST['username'];
        $password_cu = md5($_POST['password']);
        $password_moi = md5($_POST['password-1']);
        $sql = "SELECT * FROM account WHERE username ='".$username."' AND password ='".$password_cu."'";
        $row = mysqli_query($mysqli,$sql);
        $count = mysqli_num_rows($row);
        if ($count > 0) {
            $sql_update = $mysqli_query($mysqli,"UPDATE account SET username='".$username."'AND password ='".$password_moi."'");
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
        <div class="pass">Password: <input type="password" name="password" value="" required/></div>
        <div class="pass">A new password: <input type="password" name="password-1" value="" required/></div>
        </div><div class="btluuthaydoi"><input type="button" id="tollbar" name="doimk" class="password"style="margin-top: 19px;" value="Lưu Thay Đổi" ></div>
    </form>
</body>
</html>
