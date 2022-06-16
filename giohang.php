<?php 
    require_once('site.php');
    loadHeader();
    require_once('modules/function/directToLoginIfNot.php');
    require_once('modules/function/price.php');
    echo '	<link rel="stylesheet" href="style/giohangmain.css">
    <script defer src="js/giohang-sukien.js"></script>">';
    loadMenu();
?>
    <section class="cart-content">
        <div class="cart-content-left">
            <table>
                <thead>
                    <tr>
						<th>Ảnh</th>
                        <th>Sản phẩm</th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                        <th>Xoá</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                    require('connect_db.php');
                    $kh=$_SESSION['username'];
                    $check=isset($_GET['prod_id']);
                    if (isset($_GET['prod_id']) && isset($_GET['size'])) {
                        $sql="select cart.username,cart.prod_id,cart.size,cart.quantity,product.prod_name,product.price from cart,product where cart.prod_id=product.prod_id AND cart.username='".$kh."' AND cart.prod_id='".$_GET['prod_id']."' AND cart.size='".$_GET['size']."' LIMIT 1";
                    } else {
                        $sql="select cart.username,cart.prod_id,cart.size,cart.quantity,product.prod_name,product.price from cart,product where cart.prod_id=product.prod_id AND cart.username='".$kh."'";
                    }

                    $kq=mysqli_query($conn, $sql);
                    require('modules/function/image.php');
                    while($row=mysqli_fetch_array($kq)) {
                        $sqlmax="SELECT * from size where prod_id='".$row['prod_id']."'";
                        $slmax=mysqli_query($conn,$sqlmax);
                        $rowslmax=mysqli_fetch_array($slmax);
                        $directory ="images/products/".$row['prod_id'];
                        $hinh=getImages($directory);
                        $dongia = $row['price'];
                        $dongiaformat = number_format($dongia, 0, '', '.');
                        $thanhtoan = $row['quantity']*$row['price'];
                        $thanhtoanformat = number_format($thanhtoan, 0, '', '.');
                        echo'
                            <tr class="tr_id" product_id='.$row['prod_id'].'>
                                <td><img src="'.$directory.'/'.$hinh[0].'" alt=""></td>
                                <td class="kichcoSP" product_size='.$row['size'].'><p class="prod_name">'.$row['prod_name'].'</p>Size: <span class="prod_size">'.$row['size'].'</span></td>
                                <td class="price-dollar"><p>'.$dongiaformat.'đ</p></td>
                                <td><input class="soluong" type="number" value="'.$row['quantity'].'" max="'.$rowslmax[$row['size']].'" min="1"></td>
                                <td class="thanhtien"><span>'.$thanhtoanformat."đ".'</span></td>
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
                            $kh=$_SESSION['username'];
                           
                             if(isset($_GET['prod_id']) && isset($_GET['size']))
                                 $sql1 ="SELECT `quantity` FROM `cart` WHERE `username`='$kh' AND cart.prod_id='".$_GET['prod_id']."' AND cart.size='".$_GET['size']."' LIMIT 1";  
                            else
                                $sql1 = "SELECT SUM(`quantity`) FROM `cart` WHERE `username` = '$kh'";
                            $results = $conn->query($sql1);
                            $rows = $results->fetch_array();
                            $soluong = $rows[0] ? $rows[0] : 0;
                            echo'<td class="sizing-right-number"><span>'.$soluong.'</span></td>';?>
                    </tr>
                    <tr>
                        <td>Tổng tiền hàng</td>
                        <?php 
                            $kh = $_SESSION['username'];
                            if (isset($_GET['prod_id']) && isset($_GET['size']))       
                               $sql1 = "SELECT cart.username, cart.quantity, cart.prod_id, SUM(cart.quantity * product.price) FROM `cart` LEFT JOIN `product` ON cart.prod_id = product.prod_id WHERE cart.username = '$kh' AND cart.prod_id='".$_GET['prod_id']."' AND cart.size='".$_GET['size']."' LIMIT 1";
                            else
                                $sql1 = "SELECT cart.username, cart.quantity, cart.prod_id, SUM(cart.quantity * product.price) FROM `cart` LEFT JOIN `product` ON cart.prod_id = product.prod_id WHERE cart.username = '$kh'";
                            $results = $conn->query($sql1);
                            $rows = $results->fetch_array();
                            $tongtien = $rows[3];
                            $sumsanpham = number_format($tongtien, 0, '', '.');
                            echo '<td class="sizing-right-money"><span>'.$sumsanpham.'</span><sup>đ</sup></td>';
                        ?>
                    </tr>
                </table>
                <div class="cart-content-right-button">

                    <input type="button" value="Đặt Hàng" class="btn--black" onclick="<?php echo'truyenquathanhtoan('.$check.')';?>">
                </div>
            </div>
        </div>
    </div>
</section>
<?php
    loadFooter();
?>
