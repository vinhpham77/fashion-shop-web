<?php
require_once 'site.php';
require_once 'function/load-object.php';
loadHeader();
echo '<script defer src="../js/search_admin.js"></script>';
?>
<div class="container">
    <div class="div-text"><p class="text-title">Thông tin khách hàng</p></div>
    <table class="table">
        <tr class="text">
            <td class="text-info text-infor1">Họ tên</td>
            <td class="text-info text-infor1">Địa chỉ</td>
            <td class="text-info text-infor1">Email</td>
            <td class="text-info text-infor1">Số điện thoại</td>
            <td class="text-info text-infor1">Địa chỉ nhận hàng</td>
        </tr>
            <?php
require '../connect_db.php';
require_once 'function/process_search.php';
if (isset($_GET['key'])) {
	$key = $_GET['key'];
	tim_khachhang($key);
} else {
	$sql = "SELECT * FROM account where account_type = '0'";
	$query = mysqli_query($conn, $sql);
	while ($row = mysqli_fetch_array($query)) {
		load_customer($row);
	}
}
?>
    </table>
</div>
<?php
loadFooter();
?>
