<?php
require_once '../function/price.php';
require_once '../function/image.php';

function load_product($row) {
	$directory = "../images/products/" . $row['prod_id'];
	$hinh = getImages($directory);
	$calc = getCalcUnit($row['calc_unit']);
	$price = formatPrice($row['promo_price']);
	$price = $price == 0 ? '' : $price;
	echo '
        <tr class="text text2">
            <td class="text-info">' . $row['cate_name'] . '</td>
            <td class="text-info">' . $row['prod_name'] . '</td>
            <td class="text-info"><img class="hinhanh_sp" src="' . $directory . '/' . $hinh[0] . '" alt=""></td>
            <td class="text-info">' . formatPrice($row['price']) . 'đ</td>
            <td class="text-info">' . $row['promo_code'] . '</td>
            <td class="text-info">' . $price . $calc . '</td>
            <td class="text-info">' . $row['quantity'] . '</td>
            <td class="text-info">' . $row['date_added'] . '</td>
        </tr>';
}

function load_customer($row) {
	echo '
        <tr class="text">
            <td class="text-info">' . $row['fullname'] . '</td>
            <td class="text-info">' . $row['current_address'] . '</td>
            <td class="text-info">' . $row['email'] . '</td>
            <td class="text-info">' . $row['phone_number'] . '</td>
            <td class="text-info">' . $row['shipping_address'] . '</td>
        </tr>';
}

function load_order($row) {
	echo '
        <tr class="text text1 text2" id_order="' . $row['order_id'] . '">
            <td class="text-info">' . $row['order_id'] . '</td>
            <td class="text-info">' . $row['username'] . '</td>
            <td class="text-info">' . $row['fullname'] . '</td>
            <td class="text-info">' . $row['phone_number'] . '</td>
            <td class="text-info">' . $row['shipping_address'] . '</td>
            <td class="text-info">' . $row['soluong'] . '</td>
            <td class="text-info">' . formatPrice($row['tien']) . 'đ</td>
            <td class="text-info">' . $row['pay_date'] . '</td>
        </tr>';
}

function load_promo($row) {
	$calc = getCalcUnit($row['calc_unit']);
	echo '
        <tr class="text" promo_id=' . $row['promo_code'] . '>
            <td class="text-info">' . $row['promo_code'] . '</td>
            <td class="text-info">' . $row['promo_name'] . '</td>
            <td class="text-info">' . formatPrice($row['promo_price']) . $calc . '</td>
            <td class=""><input type="button" value="x" class="close-x btn-mgg-delete" onclick="xoamgg(this)"></td>
        </tr>';
}

function convertVNKey($key) {
	$key = "CONCAT('%', CONVERT('$key', BINARY), '%')";
	return $key;
}
?>
