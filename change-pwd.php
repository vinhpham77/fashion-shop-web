<?php
require_once 'site.php';
require 'connect_db.php';
if (!empty($_POST['username']) && !empty($_POST['password_cu']) && !empty($_POST['password_moi'])) {
	$username = $_POST['username'];
	$password_cu = md5($_POST['password_cu']);
	$password_moi = md5($_POST['password_moi']);
	$sql = "SELECT account_type FROM account WHERE username ='" . $username . "' AND password ='" . $password_cu . "'";
	$row = mysqli_query($conn, $sql);
	$count = mysqli_num_rows($row);
	if ($count > 0) {
		$sql_update = mysqli_query($conn, "UPDATE account SET password ='" . $password_moi . "' WHERE username = '$username'");
		$type = $row->fetch_assoc()['account_type'];
		echo "<script>
                    alert('Đổi mật khẩu thành công!');
                    if ($type == 0) {
                        window.location.href = 'index.php';
                    } else {
                        window.location.href = 'admin/index_admin.php';
                    }
                </script>";
	} else {
		echo "<script>
                    alert('Sai tài khoản hoặc mật khẩu cũ! Vui lòng nhập lại');
                    history.back();
                </script>";
		unset($_POST);
	}
}
loadHeader();
echo '<link rel="stylesheet" href="style/change-pwd.css"/>';
loadMenu();
?>

<section>
    <form method="post" action="" class="doimk" accept-charset="ASCII">
        <h2 class="ten">Đổi Mật Khẩu</h2>
        <label for="username">Tài khoản:</label>
        <input type="text" name="username" id="username" required>
        <label for="password_cu">Mật khẩu cũ:</label>
        <input type="password" name="password_cu" id="password_cu" required/>
        <label for="password_moi">Mật khẩu mới:</label>
        <input type="password" id="password_moi" name="password_moi" required/>
        <button type="submit" class="btn--black">Lưu Thay Đổi</button>
    </form>
</section>
<?php
loadFooter();
?>
