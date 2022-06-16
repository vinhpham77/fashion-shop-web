<?php
require '../connect_db.php';
require_once 'load-object.php';
$GLOBALS['conn'] = $conn;
function tim_khachhang($key) {
	$key = convertVNKey($key);
	$sql = "SELECT * FROM `account` WHERE account_type = 0 AND (`username` like $key OR `fullname` like $key OR `current_address` like $key OR `email` like $key OR `phone_number` like $key) ";
	$query = mysqli_query($GLOBALS['conn'], $sql);
	while ($row = mysqli_fetch_array($query)) {
		load_customer($row);
	}
}
function tim_hoadon($key) {
	$key = convertVNKey($key);
	$sql = "SELECT `order`.* ,SUM(`quantity` *`price`) AS 'tien',SUM(`quantity`) AS 'soluong'
    FROM `order-detail` ,`order` where `order-detail`.`order_id`=`order`.`order_id`
    AND (`username` like $key OR `phone_number`like $key OR `shipping_address` like $key OR `pay_date` like $key)
    GROUP BY `order-detail`.`order_id` ";
	$query1 = mysqli_query($GLOBALS['conn'], $sql);
	while ($row = mysqli_fetch_array($query1)) {
		load_order($row);
	}
}

function tim_magiamgia($key) {
	$key = convertVNKey($key);
	$sql = "SELECT * FROM `promotion` WHERE `promo_code` like $key OR `promo_name`like $key OR `promo_price` like $key OR `calc_unit` like $key";
	$query = mysqli_query($GLOBALS['conn'], $sql);
	while ($row = mysqli_fetch_array($query)) {
		load_promo($row);
	}
}

function tim_sanpham($key) {
	$key = convertVNKey($key);
	$sql = "SELECT `promotion`.`promo_code`,`promotion`.`calc_unit`,`promotion`.`promo_price`, `prod_id`,`product`.`cate_id`,`prod_name`, `price`,`quantity`,`date_added`,`category`.`cate_name`FROM `product` JOIN `category` on `product`.`cate_id`=`category`.`cate_id` LEFT JOIN `promotion`  on `product`.`promo_code`=`promotion`.`promo_code`
    where `promotion`.`promo_code` like $key OR `promotion`.`promo_price` like $key OR `prod_name` like $key OR `price` like $key OR `quantity` like $key OR `date_added` like $key OR `category`.`cate_name` like $key";
	$query = mysqli_query($GLOBALS['conn'], $sql);
	while ($row = mysqli_fetch_array($query)) {
		load_product($row);
	}
}
