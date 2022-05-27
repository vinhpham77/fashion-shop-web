<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style/base.css">
<link rel="stylesheet" href="style/doimk.css"/>
<?php 

      if(isset($_POST['doimk'])){
          $username = $_POST['username'];
          $password_cu = md5($_POST['password_cu']);
          $password_moi = md5($_POST['password_moi']);
          $sql = "SELECT * FROM shop-web WHERE username ='".$username."' AND password ='".$password_cu."'";
          $row = mysqli_query($mysqli,$sql);
          $count = $mysqli_num_row($row);
          if($count>0){
             $sql_update= $mysqli_query($mysqli,"UPDATE shop-web SET username='".$username."'AND password ='".$password_moi."'")
              header("Location:index.php");
          }else{
              echo'<p stylle="color="red">(""Tài khoản hoặc Mật Khẩu không đúng , vui lòng nhập lại .")</p>';
              header("Location:")
          }
      }
?>
<head>

    <title>Quên Mật Khẩu</title>
</head>
<body>
<form method="post" action="" class="doimk">
        <h2 class="ten">Đổi Mật Khẩu</h2>
        <div class="user">Username: <input type="text" name="username" value="" required> </div>
        <div class="pass">Password: <input type="password" name="password" value="" required/></div>
        <div class="pass">A new password: <input type="password" name="password-1" value="" required/></div>
        </div><div class="btluuthaydoi"><input type="button" id="tollbar" name="dangky" class="password"style="margin-top: 19px;" value="Lưu Thay Đổi" ></div>

        <div class="btdangnhap"><input type="button" id="tollbar" name="dangnhap" class="login"style="margin-top: 7px;margin-bottom:5px" value="Đăng Nhập" onclick="window.location.href='FormDangNhap.php';"></div>
        
        <div class="btdangky"><input type="button" id="tollbar" name="dangnhap" class="register"style="margin-top: 5x;" value="Đăng Ký" onclick="window.location.href='register.php';">
        
    </form>
</body>
</html>