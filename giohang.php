<?php
require_once 'site.php';
loadHeader();
require_once 'function/directToLoginIfNot.php';
require_once 'function/price.php';
echo '<link rel="stylesheet" href="style/giohangmain.css">
    <script defer src="js/giohang-sukien.js"></script>';
loadMenu();
?>
    <section class="cart-content">
        <div class="cart-content-left">
            <table>
                <thead>
                    <tr>
						<th>Ảnh</th>
                        <th class="prod_col">Sản phẩm</th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                        <th>Xoá</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                require 'connect_db.php';
                $kh = $_SESSION['username'];
                $check = isset($_GET['prod_id'])? "true" : "false";
                $sql = "SELECT cart.username,cart.prod_id,cart.size,cart.quantity,product.prod_name,product.price, promotion.promo_code, promo_price, calc_unit
                            FROM cart JOIN product ON cart.prod_id=product.prod_id
                            LEFT JOIN promotion ON product.promo_code = promotion.promo_code ";
                if (isset($_GET['prod_id']) && isset($_GET['size'])) {
                    $sql .= "WHERE cart.username='" . $kh . "' AND cart.prod_id='" . $_GET['prod_id'] . "' AND cart.size='" . $_GET['size'] . "' LIMIT 1";
                } else {
                	$sql .= "WHERE cart.username='" . $kh . "'";
                }
                $kq = mysqli_query($conn, $sql);
                require 'function/image.php';
                while ($row = mysqli_fetch_array($kq)) {
                	$sqlmax = "SELECT * from size where prod_id='" . $row['prod_id'] . "'";
                	$slmax = mysqli_query($conn, $sqlmax);
                	$rowslmax = mysqli_fetch_array($slmax);
                	$directory = "images/products/" . $row['prod_id'];
                	$hinh = getImages($directory);
                	$dongia = getPrice($row['price'], $row['promo_price'], $row['calc_unit']);
                	$dongiaformat = formatPrice($dongia);
                	$thanhtoan = $row['quantity'] * $dongia;
                	$thanhtoanformat = formatPrice($thanhtoan);
                	echo '
                        <tr class="tr_id" product_id=' . $row['prod_id'] . '>
                            <td><img src="' . $directory . '/' . $hinh[0] . '" alt=""></td>
                            <td class="kichcoSP prod_col" product_size=' . $row['size'] . '><p class="prod_name">' . $row['prod_name'] . '</p>Size: <span class="prod_size">' . $row['size'] . '</span></td>
                            <td class="price-dollar"><p>' . $dongiaformat . 'đ</p></td>
                            <td>
                                <div class="quantity_col">
                                    <i class="fa-solid fa-minus"></i>
                                    <input type="number" name="quantity" class="soluong" id="quantity" min="1" value="' . $row['quantity'] . '" max="' . $rowslmax[$row['size']] . '"readonly><i class="fa-solid fa-plus"></i>
                                </div>
                            </td>
                            <td class="thanhtien"><span>' . $thanhtoanformat . "đ" . '</span></td>
                            <td><button class="close-x" onclick="xoasp(this)"><i class="fa-solid fa-xmark"></i></button></td>
                        </tr>';
                }
                ?>
                </tbody>
            </table>
            <div class="cart-content-left-button">
                <button class="btn--black" type="submit" onclick="lienketDatHang();"><i class="fa-solid fa-left-long"></i> Quay lại mua hàng</button>
            </div>
            </div>
            <div class="cart-content-right">
                <table>
                    <tr>
                        <td>Tổng sản phẩm</td>
                        <?php
                        $kh = $_SESSION['username'];
                        if (isset($_GET['prod_id']) && isset($_GET['size'])) {
                        	$sql1 = "SELECT `quantity` FROM `cart` WHERE `username`='$kh' AND cart.prod_id='" . $_GET['prod_id'] . "' AND cart.size='" . $_GET['size'] . "' LIMIT 1";
                        } else {
                        	$sql1 = "SELECT SUM(`quantity`) FROM `cart` WHERE `username` = '$kh'";
                        }

                        $results = $conn->query($sql1);
                        $rows = $results->fetch_array();
                        $soluong = 0;
                        if ($results->num_rows > 0 && $rows[0] != null) {
                            $soluong = $rows[0];
                        }
                        echo '<td class="sizing-right-number"><span>' . $soluong . '</span></td>';?>
                    </tr>
                    <tr>
                        <td>Tổng tiền hàng</td>
                        <?php
                        $kh = $_SESSION['username'];
                        $sql1 = "SELECT cart.quantity, price, promotion.promo_code, promo_price, calc_unit
                                FROM `cart` JOIN `product` ON cart.prod_id = product.prod_id
                                LEFT JOIN promotion ON product.promo_code = promotion.promo_code ";
                        if (isset($_GET['prod_id']) && isset($_GET['size'])) {
                        	$sql1 .= "WHERE cart.username = '$kh' AND cart.prod_id='" . $_GET['prod_id'] . "' AND cart.size='" . $_GET['size'] . "' LIMIT 1";
                        } else {
                        	$sql1 .= "WHERE cart.username = '$kh'";
                        }
                        $results = $conn->query($sql1);
                        $rows = $results->fetch_all(MYSQLI_ASSOC);
                        $sum = 0;
                        forEach($rows as $item) {
                            $discountPrice = getPrice($item['price'], $item['promo_price'], $item['calc_unit']);
                            $sum += $item['quantity'] * $discountPrice;
                        }
                        $sum = formatPrice($sum);
                        echo '<td class="sizing-right-money"><span>' . $sum . '</span>đ</td>';?>
                    </tr>
                </table>
                <div class="cart-content-right-button">
                    <input type="button" value="Đặt Hàng" class="btn--black" onclick="truyenquathanhtoan(<?php echo $check; ?>);">
                </div>
            </div>
        </div>
    </div>
</section>
<?php
loadFooter();
?>
