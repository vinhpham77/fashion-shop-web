<?php
require_once 'site.php';
loadHeader();
?>
<div class="container order-container">
    <div class="order-info">
        <div class="div-text">
            <p class="text-title">Danh sách hóa đơn</p>
        </div>
        <table class="table">
            <tr class="text">
                <td class="text-info text-infor1">ID Hóa đơn</td>
                <td class="text-info text-infor1">Khách hàng</td>
                <td class="text-info text-infor1">Người nhận hàng</td>
                <td class="text-info text-infor1">SĐT nhận hàng</td>
                <td class="text-info text-infor1">Địa chỉ nhận hàng</td>
                <td class="text-info text-infor1">Số lượng</td>
                <td class="text-info text-infor1">Tổng tiền</td>
                <td class="text-info text-infor1">Ngày thanh toán</td>
            </tr>
            <?php
require_once '../connect_db.php';
require_once 'function/process_search.php';
if (isset($_GET['key'])) {
	$key = $_GET['key'];
	tim_hoadon($key);
} else {
	$sql = "SELECT `order`.* ,`quantity` *`price` AS 'tien',SUM('tien') ,SUM(`quantity`) AS 'soluong' FROM `order-detail` ,`order` where `order-detail`.`order_id`=`order`.`order_id` GROUP BY `order-detail`.`order_id`";
	$query = mysqli_query($conn, $sql);
	while ($row = mysqli_fetch_array($query)) {
		load_order($row);
	}
}
?>
        </table>
    </div>
    <div class="order-detail-info">
        <div class="div-text">
            <p class="text-title">Chi tiết hóa đơn</p>
        </div>
        <div class="heder-cthd"></div>
    </div>
</div>
<script src="js/hoadon_admin.js"></script>
<?php
loadFooter();
?>
