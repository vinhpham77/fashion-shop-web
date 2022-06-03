<?php 
    require_once "connect_db.php";
    $username = $_COOKIE['username'];
    $sql = "SELECT `fullname`,`phone_number`,`shipping_address` FROM `account` where username = '".$username."' ";
    $result = $conn->query($sql);
    if($rows = $result->fetch_array()){          
        $fullname = $rows[0];
        $SDT = $rows[1];
        $Address = $rows[2];
        if(!empty($_POST)){
            $hoten = $_POST['fullname'];
            $sodt = $_POST['SDT'];
            $diachi = $_POST['Address'];
            $sql = "UPDATE `account` SET `fullname`='$hoten', `phone_number`='$sodt',`shipping_address`='$diachi' WHERE username = '".$username."'";
            $conn->query($sql);

            
            $sql = "SELECT product.prod_id, cart.size, product.price*(100 - product.discount)*0.01 as Price, product.quantity FROM `product` JOIN cart ON product.prod_id = cart.prod_id where username = '".$_COOKIE['username']."' ";
            $result = $conn->query($sql);
            if($result->num_rows > 0){
                $sql = "INSERT INTO `order`(`username`, `fullname`, `phone_number`, `shipping_address`, `pay_date`) VALUES ('$username', '$hoten', '$sodt', '$diachi', CURRENT_TIMESTAMP)";
                $conn->query($sql);
                while ($rows = $result->fetch_array()) {
                    $sql = "SELECT `order_id` FROM `order` ORDER by `order_id` DESC  LIMIT 1";
                    $ketqua = $conn->query($sql)->fetch_array();
                    $sql = "INSERT INTO `order-detail`(`order_id`, `prod_id`, `size`, `price`, `quantity`) VALUES ('$ketqua[0]','$rows[0]','$rows[1]','$rows[2]','$rows[3]')";
                    $conn->query($sql);
                }
                    $sql = "Delete from cart where username = '$username'";
                    $conn->query($sql);
                    echo '<script>
                    alert("Đã thanh toán thành công!");
                    location.href = "index.php";
                    </script>';
            }else{
                echo '<script>
                    alert("Thanh toán thất bại, không có sản phẩm trong giỏ hàng!");
                    location.href = "index.php";
                    </script>';
            }
           
        }
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
    <form class="delivery" method="POST">  
    <div class="container">
        <div class="delivery-content">
            <h1>Địa Chỉ Giao Hàng</h1>
            <div class="delivery-conten-above">
                <table>
                    <div class="delivery-conten-above-input-1 row">
                        <div class="delivery-conten-above-input-item">
                            <label class = "itemsthongtin1">Họ tên </label>
                            <input name="fullname" value="<?php echo "$fullname" ?>" type="text" >
                        </div>
                        <div class="delivery-conten-above-input-item">
                            <label class = "itemsthongtin2">Số điện thoại </label>
                            <input class="thongtinsdt" name="SDT" value="<?php echo "$SDT" ?>" type="text" >
                        </div>
                        
                    </div>
                    <div class="delivery-conten-above-input-2 row">
                        <div class="delivery-conten-above-input-2-item">
                            <label class="diachigiaohang" for="">Địa chỉ giao hàng </label>
                            <input name="Address" value="<?php echo "$Address" ?>" type="text" >
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
                            $sql = "SELECT product.prod_name, product.quantity, cart.size, product.price*(100 - product.discount)*0.01 * cart.quantity as Price FROM `product` JOIN cart ON product.prod_id = cart.prod_id where username = '".$_COOKIE['username']."' ";
                            $result = $conn->query($sql);
                            if($result->num_rows > 0){
                                while ($rows = $result->fetch_array()) {
                                    $nombre_format_francais = number_format($rows[3], 0, ',', '.');
                                    echo "<tr>
                                        <td>$rows[0]</td>
                                        <td>$rows[1]</td>
                                        <td class='size'>$rows[2]</td>
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
                <div method="POST" class="delivery-content-right-button">
                    <p><button name="tienvang" style="font-weight: bold" type="submit">THANH TOÁN</button></p>
                </div>
            </div>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
