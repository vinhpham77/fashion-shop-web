<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="giohangmain.css">
    <title>Giỏ Hàng</title>
</head>
<body>
    <section class="cart-content">
            <div class="cart-content-left">
                <table>
                    <tr>
						<th>Tên Sản Phẩm</th>
                        <th></th>
                        <th>Chiết Khấu</th>
                        <th>Số lượng</th>
                        <th>Tổng Tiền</th>
                    </tr>
                    <tr>
                        <td><img src="images/Aothun.jpg" alt="Áo Thun"></td>
                        <td><p>Áo thun Tropical <br>Màu sắc: Nâu Cà Phê <br/>Size: L</p></td>
                        <td></td>
                        <td><input type="number" value="1" min="1"></td>
                        <td><p>650.000 <sup>đ</sup></p></td>
                        <td><span>X</span></td>
                    </tr>
                    <tr>
                        <td><img src="images/dam.jpg" alt="Đầm Trắng"></td>
                        <td><p>Đầm dạ hội phối hoa hồng <br>Màu sắc: Trắng <br/>Size: M</p></td>
                        <td></td>
                        <td><input type="number" value="1" min="1"></td>
                        <td><p>2.990.000đ <sup>đ</sup></p></td>
                        <td><span>X</span></td>
		     		</tr>
                    <tr>
                        <td><img src="images/vay.jpg" alt="Váy Jeans"></td>
                        <td><p>Zuýp jean phối túi giả <br>Màu sắc: Xanh Lơ <br/>Size: L</p></td>
                        <td></td>
                        <td><input type="number" value="1" min="1"></td>
                        <td><p>1.190.000đ <sup>đ</sup></p></td>
                        <td><span>X</span></td>
                    </tr>
					<tr>
                        <td><img src="images/aotaydai.jpg" alt="Áo sơ mi"></td>
                        <td><p>Áo sơ mi nam dáng Slim fit <br>Màu sắc: Trắng <br/>Size: L</p></td>
                        <td></td>
                        <td><input type="number" value="1" min="1"></td>
                        <td><p>1.090.000đ <sup>đ</sup></p></td>
                        <td><span>X</span></td>
					</tr>
                </table>
                <div class="cart-content-left-button">
                    <input type="submit" value="<---  Tiếp tục mua hàng" name="muasam">
                </div>
            </div>
            <div class="cart-content-right">
                <table>
                    <tr><th colspan="2">Tổng Tiền Giỏ Hàng</th></tr>
                    <tr>
                        <td>Tổng sản phẩm</td>
                        <td class="sizing-right">4</td>
                    </tr>
                    <tr>
                        <td>Tổng tiền hàng</td>
                        <td class="sizing-right">5.920.000 <sup>đ</sup></td>
                    </tr>
                    <tr>
                        <td>Thành tiền</td>
                        <td class="sizing-right">5.920.000 <sup>đ</sup></td>
                    </tr>
                    <tr>
                        <td>Tạm tính</td>
                        <td class="sizing-right">5.920.000 <sup>đ</sup></td>
                    </tr>
                </table>
                <div class="cart-content-right-text">
                    <p>Đơn hàng của bạn được Miễn phí ship</p>
                </div>
                <div class="cart-content-right-button">
                    <input type="submit" name="dathang" value="Đặt Hàng">
                </div>
            </div>
    </div>
</body>
</html>