<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="style/base.css">
    <link rel="stylesheet" href="style/register.css"/>
    <!-- <script async src="js/register.js"></script> -->
</head>
<body>
    <form method="post" action="" class="register">
        <div class="account__detail">
            <h2>Tài khoản</h2>
            <label for="username">Tên tài khoản: </label>
            <input type="text" name="username" id="username" pattern="^\w{5,20}$" title="Bao gồm 5-20 kí tự, chỉ chứa A-Z, a-z, 0-9">
            <span class="error" id="username_error"></span>
            <label for="password">Mật khẩu: </label>
            <input type="password" name="password" id="password" pattern="^\w{5,20}$" title="Bao gồm 5-20 kí tự, chỉ chứa A-Z, a-z, 0-9">
            <span class="error" id="password_error"></span>
            <label for="re-password">Nhập lại mật khẩu: </label>
            <input type="password" name="re-password" id="re-password">
            <span class="error" id="re-password_error"></span>
        </div>
        <div class="user__detail">
            <h2>Thông tin</h2>
            <label for="fullname">Họ tên: </label>
            <input type="text" name="fullname" id="fullname" required>
            <label for="current-address">Chỗ ở hiện tại: </label>
            <textarea name="current-address" id="current-address" required></textarea>
            <label for="email">Email: </label>
            <input type="email" name="email" id="email" required>
            <span class="error" id="email_error"></span>
            <label for="phone-number">Số điện thoại: </label>
            <input type="tel" name="phone-number" id="phone-number" pattern="^0\d{9}$" title=
            "Số điện thoại bao gồm 10 chữ số bắt đầu bằng số 0" required>
            <span class="error" id="phone-number_error"></span>
            <label for="shipping-address">Địa chỉ giao hàng: </label>
            <textarea name="shipping-address" id="shipping-address" required></textarea>
            <button type="submit" name="btn-register" id="btn-register"/>Đăng Ký</button>
        </div>
    </form>
</body>
</html>
