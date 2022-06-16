<?php
require_once 'site.php';
loadHeader();
require_once 'function/directToLoginIfNot.php';
echo '<link rel="stylesheet" href="style/styledelivery.css">
    <script defer src="js/delivery.js"></script>">';
loadMenu();

require_once 'function/price.php';
require 'connect_db.php';
$username = $_SESSION['username'];
$sql = "SELECT `fullname`,`phone_number`,`shipping_address` FROM `account` where username = '$username' ";
$result = $conn->query($sql);
if ($rows = $result->fetch_array()) {
	$fullname = $rows[0];
	$SDT = $rows[1];
	$Address = $rows[2];
	if (!empty($_POST)) {
		$hoten = $_POST['fullname'];
		$sodt = $_POST['SDT'];
		$diachi = $_POST['Address'];
		$sql = "UPDATE `account` SET `fullname`='$hoten', `phone_number`='$sodt',`shipping_address`='$diachi' WHERE username = '" . $username . "'";
		$conn->query($sql);
		$sql = "SELECT product.prod_id, cart.size, cart.quantity, product.price, promotion.calc_unit, promo_price FROM cart JOIN product ON cart.prod_id = product.prod_id LEFT JOIN promotion ON product.promo_code = promotion.promo_code where username = '" . $_SESSION['username'] . "' ";
		$result = $conn->query($sql);
		if ($result->num_rows > 0) {
			$sql = "INSERT INTO `order`(`username`, `fullname`, `phone_number`, `shipping_address`, `pay_date`) VALUES ('$username', '$hoten', '$sodt', '$diachi', CURRENT_TIMESTAMP)";
			$conn->query($sql);
			$sql = "SELECT `order_id` FROM `order` ORDER by `order_id` DESC LIMIT 1";
			$ketqua = $conn->query($sql)->fetch_array();
			while ($rows = $result->fetch_array()) {
				$sl_giohang = $rows[2];
				$price_sp = $rows[3];
				$donvi = $rows[4];
				$magiamgia = $rows[5];
				$GiaSauGiam = getPrice($price_sp, $magiamgia, $donvi);
				$sql = "INSERT INTO `order-detail`(`order_id`, `prod_id`, `size`, `price`, `quantity`) VALUES ('$ketqua[0]','$rows[0]','$rows[1]','$GiaSauGiam','$sl_giohang')";
				$conn->query($sql);
				$sql = "UPDATE `product` INNER JOIN `cart` ON `product`.`prod_id` = `cart`.`prod_id`
                                SET `product`.`quantity`= `product`.`quantity`-`cart`.`quantity`  WHERE `product`.`prod_id`= '$rows[0]' AND `username` = '$username'";
				$conn->query($sql);
				$sql = "UPDATE `size` INNER JOIN `cart` ON `size`.`prod_id` = `cart`.`prod_id` SET `size`.`$rows[1]` = `size`.`$rows[1]`-`cart`.`quantity`
                                WHERE `cart`.`prod_id` = '$rows[0]' AND `cart`.username = '$username'";
				$conn->query($sql);
			}
			$sql = "Delete from cart where username = '$username'";
			$conn->query($sql);
			echo '<script>
                    alert("Đã thanh toán thành công!");
                    location.href = "index.php";
                    </script>';
		} else {
			echo '<script>
                    alert("Thanh toán thất bại, không có sản phẩm trong giỏ hàng!");
                    location.href = "index.php";
                    </script>';
		}
	}
}
?>
<section>
    <form class="delivery-content" method="POST">
        <h1>Thông Tin Giao Hàng</h1>
        <div class="delivery-conten-above">
            <div class="delivery-conten-above-input-1">
                <div class="delivery-conten-above-input-item">
                    <label class = "itemsthongtin1" for="fullname">Họ tên </label>
                    <input name="fullname" id="fullname" value="<?php echo "$fullname" ?>" type="text" >
                </div>
                <div class="delivery-conten-above-input-item">
                    <label class = "itemsthongtin2" for="SDT">Số điện thoại </label>
                    <input class="thongtinsdt" name="SDT" id="SDT" value="<?php echo "$SDT" ?>" type="text" >
                </div>
            </div>
            <div class="delivery-conten-above-input-2">
                <div class="delivery-conten-above-input-item">
                    <label class="diachigiaohang" for="Address">Địa chỉ giao hàng </label>
                    <textarea name="Address" id="Address"><?php echo "$Address" ?></textarea>
                </div>
            </div>
        </div>
        <div class="delivery-conten-below">
            <table>
                <thead>
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Size</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                <?php
require "connect_db.php";
if (isset($_GET['id'])) {
	$sql = "SELECT product.prod_name, cart.quantity, cart.size, product.price,  promotion.calc_unit, promo_price FROM cart JOIN product ON cart.prod_id = product.prod_id LEFT JOIN promotion ON product.promo_code = promotion.promo_code where username = '" . $_SESSION['username'] . "' AND cart.prod_id='" . $_GET['id'] . "' AND cart.size='" . $_GET['size'] . "'";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		$tongtien = 0;
		while ($rows = $result->fetch_array()) {
			$sl_giohang = $rows[1];
			$price_sp = $rows[3];
			$donvi = $rows[4];
			$gia = $rows[5];
			$GiaSauGiam = getPrice($price_sp, $gia, $donvi) * $sl_giohang;
			$numberformat = number_format($GiaSauGiam, 0, '', '.');
			$tongtien = $tongtien + $GiaSauGiam;
    		echo "<tr>
                    <td>$rows[0]</td>
                    <td>$rows[1]</td>
                    <td class='size'>$rows[2]</td>
                    <td class='thanhtien'><p>$numberformat<sup>đ</sup></p></td>
                </tr>";
		}
	}
} else {
	$sql = "SELECT product.prod_name, cart.quantity, cart.size, product.price,  promotion.calc_unit, promo_price FROM cart JOIN product ON cart.prod_id = product.prod_id LEFT JOIN promotion ON product.promo_code = promotion.promo_code where username = '" . $_SESSION['username'] . "' ";
	$result = $conn->query($sql);
	$tongtien = 0;
	if ($result->num_rows > 0) {
		while ($rows = $result->fetch_array()) {
			$sl_giohang = $rows[1];
			$price_sp = $rows[3];
			$donvi = $rows[4];
			$gia = $rows[5];
			$GiaSauGiam = getPrice($price_sp, $gia, $donvi) * $sl_giohang;
			$numberformat = formatPrice($GiaSauGiam);
			$tongtien = $tongtien + $GiaSauGiam;
			echo "<tr>
                <td>$rows[0]</td>
                <td>$rows[1]</td>
                <td class='size'>$rows[2]</td>
                <td class='thanhtien'><p>$numberformat<sup>đ</sup></p></td>
            </tr>";
		}
	}
}
    $tongtien = formatPrice($tongtien);
    echo '
        </tbody>
        <tfoot>
            <tr>
                <td colspan="3">Tổng tiền hàng</td>
                <td class="thanhtoan"><span>' . $tongtien . '</span><sup>đ</sup></td>
            </tr>
        </tfoot>';
?>
            </table>
            <div class="delivery-content-below-button">
                <div class="delivery-content-left-button">
                   <button type="button" class="btn--white" onclick="quaylaigiohang()"><i class="fa-solid fa-left-long"></i> Quay lại giỏ hàng</button>
                </div>
                <div method="POST" class="delivery-content-right-button">
                    <button name="tienvang" class="btn--black" type="submit">THANH TOÁN</button>
                </div>
            </div>
        </div>
    </form>
</section>
<?php
loadFooter();
?>
