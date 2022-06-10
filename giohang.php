<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/giohangmain.css">
    <script async src="js/giohang-sukien.js"></script>
    <title>Giỏ Hàng</title>
</head>
<body>

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
						
                        require_once "connect_db.php";
                        $kh=$_POST['username'];
						$sql="select cart.username,cart.prod_id,cart.size,cart.quantity,product.prod_name,price from cart,product where cart.prod_id=product.prod_id AND cart.username='".$kh."'";
						$kq=mysqli_query($conn,$sql);
						while($row=mysqli_fetch_array($kq))
                        {
							$sqlmax="SELECT * from size where prod_id='".$row['prod_id']."'";
							$slmax=mysqli_query($conn,$sqlmax);
							$rowslmax=mysqli_fetch_array($slmax);
							$directory ="images/products/".$row['prod_id'];
							$hinh=array_diff(scandir($directory), array('..', '.'));
						echo'
						 <tr product_id='.$row['prod_id'].'>
                         <td><img src="'.$directory.'/'.$hinh[2].'" alt=""></td>
                         <td product_size='.$row['size'].'><p>'.$row['prod_name'].'<br/>size: '.$row['size'].'</p></td>
                         <td class="price-dollar"><p>'.$row['price'].'</p></td>
                         <td><input class="soluong" type="number" value="'.$row['quantity'].'" max="'.$rowslmax[$row['size']].'" min="1" oninput="validity.valid||(value='.');"></td>
                         <td class="thanhtien"><span>'.$row['quantity']*$row['price'].'</span><sup>đ</sup></td>
                         <td><input type="button" value="x" class="close-x" onclick="xoasp(this)"></td>
						 </tr>';
						}
                       
						
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
                        <td class="sizing-right-number"><span>4</span></td>
                    </tr>
                    <tr>
                        <td>Tổng tiền hàng</td>
                        <td class="sizing-right-money"><span>5.920.000</span><sup>đ</sup></td>
                    </tr>
                </table>
                <div class="cart-content-right-button">
                    <input type="button" value="Đặt Hàng" onclick="lienketDatHang(this)">
                </div>
            </div>
    </div>
</body>
</html>