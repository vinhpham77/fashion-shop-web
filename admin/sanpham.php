<?php
require_once 'site.php';
require_once 'function/load-object.php';
loadHeader();
?>
<div class="container">
    <div class="div-text">
        <p class="text-title">Danh sách sản phẩm</p>
    </div>
    <table class="table table_sp">
        <div>
            <tr class="text">
                <td class="text-info text-infor1">Tên danh mục</td>
                <td class="text-info text-infor1">Tên sản phẩm</td>
                <td class="text-info text-infor1">Hình ảnh</td>
                <td class="text-info text-infor1">Đơn giá</td>
                <td class="text-info text-infor1">Mã giảm giá</td>
                <td class="text-info text-infor1">Số tiền được giảm</td>
                <td class="text-info text-infor1">Số lượng</td>
                <td class="text-info text-infor1">Ngày nhập</td>
            </tr>
            <?php
require_once '../connect_db.php';
require_once 'function/process_search.php';
if (isset($_GET['key'])) {
	$key = $_GET['key'];
	tim_sanpham($key);
} else {
	$sql = "SELECT `promotion`.`promo_code`,`promotion`.`calc_unit`,`promotion`.`promo_price`, `calc_unit`, `prod_id`,`product`.`cate_id`,`prod_name`, `price`,`quantity`,`date_added`,`category`.`cate_name`FROM `product` JOIN `category` on `product`.`cate_id`=`category`.`cate_id` LEFT JOIN `promotion`  on `product`.`promo_code`=`promotion`.`promo_code`";
	$query = mysqli_query($conn, $sql);
	while ($row = mysqli_fetch_array($query)) {
		load_product($row);
	}
}
?>
        </div>
    </table>
</div>
<?php
loadFooter();
?>
