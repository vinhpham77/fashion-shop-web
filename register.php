<?php
    require_once('site.php');
    loadHeader();
    echo '<link rel="stylesheet" href="style/base.css">
        <link rel="stylesheet" href="style/register.css"/>
        <script defer src="js/register.js"></script>">';
    loadMenu();

    if(isset($_POST['btn-register']))
    {
        $username = $_POST['username'];
        $password = md5($_POST['password']);
        $repassword = md5($_POST['re-password']);
        $fullname = $_POST['fullname'];
        $currentaddress = $_POST['current-address'];
        $email = $_POST['email'];
        $phonenumber = $_POST['phone-number'];
        $shippingaddress  = $_POST['shipping-address'];
        require 'connect_db.php';

        $sql = "SELECT * FROM account WHERE username = '$username' OR email = '$email' OR phone_number = '$phonenumber' LIMIT 1";
        $result = mysqli_query($conn, $sql);
        if (mysqli_num_rows($result) > 0) {
            echo '<script>alert("Tên đăng ký, email hoặc số điện thoại đã được sử dụng!"); history.back();</script>';
        } else {
            $sql =  "INSERT INTO account VALUES ('$username','$password', FALSE,'$fullname','$currentaddress','$email','$phonenumber','$shippingaddress')";
            mysqli_query($conn, $sql);
            echo '<script>alert("Đăng ký thành công!"); window.location="login.php";</script>';
            exit();
        }
    }
?>

<section>
    <form method="post" action="" class="register" onsubmit="return validateForm();">
        <div class="account__detail">
            <h2>Tài khoản</h2>
            <div class="form-group">
                <label for="username">Tên tài khoản: </label>
                <input type="text" name="username" id="username" title="Bao gồm 5-20 kí tự, chỉ chứa A-Z, a-z, 0-9">
                <span class="form-message"></span>
            </div>
            <div class="form-group">
                <label for="password">Mật khẩu: </label>
                <input type="password" name="password" id="password" title="Bao gồm 5-20 kí tự, chỉ chứa A-Z, a-z, 0-9">
                <span class="form-message"></span>
            </div>
            <div class="form-group">
                <label for="re-password">Nhập lại mật khẩu: </label>
                <input type="password" name="re-password" id="re-password">
                <span class="form-message"></span>
            </div>
        </div>
        <div class="user__detail">
            <h2>Thông tin</h2>
            <div class="form-group">
                <label for="fullname">Họ tên: </label>
                <input type="text" name="fullname" id="fullname">
                <span class="form-message"></span>
            </div>
            <div class="form-group">
                <label for="current-address">Chỗ ở hiện tại: </label>
                <textarea name="current-address" id="current-address"></textarea>
                <span class="form-message"></span>
            </div>
            <div class="form-group">
                <label for="email">Email: </label>
                <input type="email" name="email" id="email">
                <span class="form-message"></span>
            </div>
            <div class="form-group">
                <label for="phone-number">Số điện thoại: </label>
                <input type="tel" name="phone-number" id="phone-number" title=
                "Số điện thoại bao gồm 10 chữ số bắt đầu bằng số 0">
                <span class="form-message"></span>
            </div>
            <span class="form-message"></span>
            <div class="form-group">
                <label for="shipping-address">Địa chỉ giao hàng: </label>
                <textarea name="shipping-address" id="shipping-address"></textarea>
                <span class="form-message"></span>
            </div>
            <div class="form-group">
                <button type="submit" name="btn-register" id="btn-register" class="btn btn--black" >Đăng Ký</button>
            </div>
        </div>
    </form>
</section>
<?php
    loadFooter();
?>
