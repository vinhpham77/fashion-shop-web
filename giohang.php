<?php 
    require_once('site.php');
    require_once('modules/function/account.php');
    require_once('modules/function/price.php');
    directToLoginIfNot();
    loadHeader();
    echo '	<link rel="stylesheet" href="style/giohangmain.css">
    <script defer src="js/giohang-sukien.js"></script>">';
    loadMenu();
?>
    <section class="cart-content">
            <div class="cart-content-left">
                <table>
                    <tr>
						<th>Tên Sản Phẩm</th>
                        <th></th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Tổng Tiền</th>
                    </tr>
                    <?php
                        require('connect_db.php');
                        $kh=$_COOKIE['username'];
                        if(isset($_GET['prod_id']) ){
                            if(isset($_GET['size'])){
                            $sql="select cart.username,cart.prod_id,cart.size,cart.quantity,product.prod_name,product.price from cart,product where cart.prod_id=product.prod_id AND cart.username='".$kh."' AND cart.prod_id='".$_GET['prod_id']."' AND cart.size='".$_GET['size']."' ";
                            $kq=mysqli_query($conn, $sql);
                            while($row=mysqli_fetch_array($kq))
                            {
                                $sqlmax="SELECT * from size where prod_id='".$row['prod_id']."'";
                                $slmax=mysqli_query($conn,$sqlmax);
                                $rowslmax=mysqli_fetch_array($slmax);
                                $directory ="images/products/".$row['prod_id'];
                                $hinh=array_diff(scandir($directory), array('..', '.'));
                                $dongia = $row['price'];
                                $dongiaformat = number_format($dongia, 0, '', '.');
                                $thanhtoan = $row['quantity']*$row['price'];
                                $thanhtoanformat = number_format($thanhtoan, 0, '', '.');
                            echo'
                                <tr class="tr_id" product_id='.$row['prod_id'].'>
                                    <td><img src="'.$directory.'/'.$hinh[2].'" alt=""></td>
                                    <td class="kichcoSP" product_size='.$row['size'].'><p>'.$row['prod_name'].'<br/>size: '.$row['size'].'</p></td>
                                    <td class="price-dollar"><p>'.$dongiaformat.'</p></td>
                                    <td><input class="soluong" type="number" value="'.$row['quantity'].'" max="'.$rowslmax[$row['size']].'" min="1" ></td>
                                    <td class="thanhtien"><span>'.$thanhtoanformat.' '."đ".'</span></td>
                                    <td><input class="close-x" type="button" value="x" onclick="xoasp(this)"></td>
                                </tr>';
                            }
                        }
                        }
                        else
                        {
						$sql="select cart.username,cart.prod_id,cart.size,cart.quantity,product.prod_name,product.price from cart,product where cart.prod_id=product.prod_id AND cart.username='".$kh."'";
						$kq=mysqli_query($conn, $sql);
						while($row=mysqli_fetch_array($kq))
                        {
							$sqlmax="SELECT * from size where prod_id='".$row['prod_id']."'";
							$slmax=mysqli_query($conn,$sqlmax);
							$rowslmax=mysqli_fetch_array($slmax);
							$directory ="images/products/".$row['prod_id'];
							$hinh=array_diff(scandir($directory), array('..', '.'));
                            $dongia = $row['price'];
                            $dongiaformat = number_format($dongia, 0, '', '.');
                            $thanhtoan = $row['quantity']*$row['price'];
                            $thanhtoanformat = number_format($thanhtoan, 0, '', '.');
						echo'
                            <tr product_id='.$row['prod_id'].'>
                                <td><img src="'.$directory.'/'.$hinh[2].'" alt=""></td>
                                <td class="kichcoSP" product_size='.$row['size'].'><p>'.$row['prod_name'].'<br/>size: '.$row['size'].'</p></td>
                                <td class="price-dollar"><p>'.$dongiaformat.'</p></td>
                                <td><input class="soluong" type="number" value="'.$row['quantity'].'" max="'.$rowslmax[$row['size']].'" min="1" ></td>
                                <td class="thanhtien"><span>'.$thanhtoanformat.' '."đ".'</span></td>
                                <td><input class="close-x" type="button" value="x" onclick="xoasp(this)"></td>
                            </tr>';
						}
                    }
                    $check=isset($_GET['prod_id']);
                    ?>
                   
                </table>
                <div class="cart-content-left-button">
                    <input type="submit" value="<---  Tiếp tục mua hàng" onclick="lienketMuaSam(this)">
                </div>
            </div>
            <div class="cart-content-right">
                <table>
                    <tr><th colspan="2">Tổng Tiền Giỏ Hàng</th></tr>
                    <tr>
                        <td>Tổng sản phẩm</td>
                        <?php 
                            $kh=$_COOKIE['username'];
                            $sql1 = "SELECT SUM(`quantity`) FROM `cart` WHERE `username` = '$kh'";
                            $results = $conn->query($sql1);
                            $rows = $results->fetch_array();
                            $soluong = $rows[0];
                            echo'<td class="sizing-right-number"><span>'.$soluong.'</span></td>';?>
                    </tr>
                    <tr>
                        <td>Tổng tiền hàng</td>
                        <?php 
                            $kh = $_COOKIE['username'];
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
                    <input type="button" value="Đặt Hàng" onclick="<?php echo'truyenquathanhtoan('.$check.')';?>">
                </div>
            </div>
        </div>
    </section>
<?php
    loadFooter();
?>
