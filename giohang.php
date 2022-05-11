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
                    <tr>
                        <td><img src="images/Aothun.jpg" alt="Áo Thun"></td>
                        <td><p>Áo thun Tropical <br>Màu sắc: Nâu Cà Phê <br/>Size: L</p></td>
                        <td class="price-dollar"><p>650.000</p></td>
                        <td><input class="soluong" type="number" value="1" min="1" oninput="validity.valid||(value='');"></td>
                        <td class="thanhtien"><span>650.000 đ</span><sup></sup></td>
                        <td><input type="button" value="X" class="close-X" onclick="xoasp(this)"></td>
                    </tr>
                    <tr>
                        <td><img src="images/dam.jpg" alt="Đầm Trắng"></td>
                        <td><p>Đầm dạ hội phối hoa hồng <br>Màu sắc: Trắng <br/>Size: M</p></td>
                        <td class="price-dollar"><p>2.990.000</p></td>
                        <td><input class="soluong" type="number" value="1" min="1" oninput="validity.valid||(value='');"></td>
                        <td class="thanhtien"><span>2.990.000 đ</span><sup></sup></td>
                        <td><input type="button" value="X" class="close-X" onclick="xoasp(this)"></td>
		     		</tr>
                    <tr>
                        <td><img src="images/vay.jpg" alt="Váy Jeans"></td>
                        <td><p>Zuýp jean phối túi giả <br>Màu sắc: Xanh Lơ <br/>Size: L</p></td>
                        <td class="price-dollar"><p>1.190.000</p></td>
                        <td><input class="soluong" type="number" value="1" min="1" oninput="validity.valid||(value='');"></td>
                        <td class="thanhtien"><span>1.190.000 đ</span><sup></sup></td>
                        <td><input type="button" value="X" class="close-X" onclick="xoasp(this)"></td>
                    </tr>
					<tr>
                        <td><img src="images/aotaydai.jpg" alt="Áo sơ mi"></td>
                        <td><p>Áo sơ mi nam dáng Slim fit <br>Màu sắc: Trắng <br/>Size: L</p></td>
                        <td class="price-dollar"><p>1.090.000</p></td>
                        <td><input class="soluong" type="number" value="1" min="1" oninput="validity.valid||(value='');"></td>
                        <td class="thanhtien"><span>1.090.000 đ</span><sup></sup></td>
                        <td><input type="button" value="X" class="close-X" onclick="xoasp(this)"></td>
					</tr>
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
                <div class="cart-content-right-fee">
                    <p>Phí ship 0<sup>đ</sup></p>
                </div>
                <div class="cart-content-right-button">
                    <input type="button" value="Đặt Hàng" onclick="lienketDatHang(this)">
                </div>
            </div>
    </div>
</body>
</html>