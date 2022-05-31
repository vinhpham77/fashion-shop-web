<?php 
    require_once "connect_db.php";
    $username = $_COOKIE['username'];
    $sql = "SELECT `username`, `phone_number`, `shipping_address` FROM `account` where username = '".$username."' ";
    $result = $conn->query($sql);
    if($result->num_rows > 0){
        if($rows = $result->fetch_array()){
            $fullname = $rows[0];
            $SDT = $rows[1];
            $Address = $rows[2];
        }
    }
    if(isset($_POST['tienvang'])){
        $sql = "SELECT product.prod_id, cart.quantity, cart.size, product.price * (100 - product.discount)*0.01  * cart.quantity as price FROM product JOIN cart ON product.prod_id = cart.prod_id where username = '".$_COOKIE['username']."' ";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while ($rows = $result->fetch_array()) {
                $sql = "INSERT INTO `order` (`username`, `prod_id`, `size`, `price`, `quantity`, `pay_date`) VALUES ('$username', '$rows[0]', '$rows[2]', '$rows[3]', '$rows[1]', CURRENT_TIMESTAMP)";
                $conn->query($sql);
            }
            $sql = "Delete from cart where username = '$username'";
            $conn->query($sql);
        }   
        echo '<script>
        alert("Đã thanh toán thành công!");
        location.href = "index.php";
        </script>';
    }
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="style/styledelivery.css">
	<link rel="stylesheet" href="fontawesome/css/all.css">
    <script defer src="js/delivery.js"></script>
</head>
<body>
    <section class="delivery">  
    <div class="container">
        <div class="delivery-content">
            <h1>Địa Chỉ Giao Hàng</h1>
            <div class="delivery-conten-above">
                <table>
                    <div class="delivery-conten-above-input-1 row">
                        <div class="delivery-conten-above-input-item">
                            <label class = "itemsthongtin1">Họ tên </label>
                            <input name="hoten" value="<?php echo "$fullname" ?>" type="text" readonly>
                        </div>
                        <div class="delivery-conten-above-input-item">
                            <label class = "itemsthongtin2">Số điện thoại </label>
                            <input class="thongtinsdt" name="sodienthoai" value="<?php echo "$SDT" ?>" type="text" readonly>
                        </div>
                        
                    </div>
                    <div class="delivery-conten-above-input-2 row">
                        <div class="delivery-conten-above-input-2-item">
                            <label class="diachigiaohang" for="">Địa chỉ giao hàng </label>
                            <input name="diachi" value="<?php echo "$Address" ?>" type="text" readonly>
                    </div>
                </table>
            </div>
            <div class="delivery-conten-below">
                <table>
                    <div>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Size</th>
                            <th>Thành tiền</th>
                        </tr>
                        <?php 
                            require_once "connect_db.php";
                            $sql = "SELECT product.prod_name, cart.quantity, cart.size, product.price * (100 - product.discount)*0.01  * cart.quantity as price FROM product JOIN cart ON product.prod_id = cart.prod_id where username = '".$_COOKIE['username']."' ";
                            $result = $conn->query($sql);
                            if($result->num_rows > 0){
                                while ($rows = $result->fetch_array()) {
                                    $nombre_format_francais = number_format($rows[3], 0, ',', '.');
                                    echo "<tr>
                                        <td>$rows[0]</td>
                                        <td>$rows[1]</td>
                                        <td>$rows[2]</td>
                                        <td class='thanhtien'><p>$nombre_format_francais<sup>đ</sup></p></td>
                                    </tr>";
                                }
                            }
                        ?>
                        <tr>
                            <td style="font-weight: bold;" colspan="3">Tổng tiền hàng</td>
                            <td class="thanhtoan" style="font-weight: bold;" ><span>1.210.000</span><sup>đ</sup></td>
                        </tr>
                    </div>
                </table>
                <div class="delivery-content-left-button">
                    <p><button style="font-weight: bold" type="button" onclick="quaylaigiohang()">&#8678; Quay lại giỏ hàng</button></p>
                </div>
                <form method="POST" class="delivery-content-right-button">
                    <p><button name="tienvang" style="font-weight: bold" type="submit">THANH TOÁN</button></p>
                </form>
            </div>
        </div>
    </div>
    </div>
    </section>
</body>
</html>
