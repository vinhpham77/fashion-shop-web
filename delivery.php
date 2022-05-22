<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="style/styledelivery.css">
	<link rel="stylesheet" href="fontawesome/css/all.css">
    <script async src="js/delivery.js"></script>
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
                            <label for="">Họ tên: </label>
                            <input type="text">
                        </div>
                        <div class="delivery-conten-above-input-item">
                            <label for="">Số điện thoại: </label>
                            <input type="text">
                        </div>
                        
                    </div>
                    <div class="delivery-conten-above-input-2 row">
                        <div class="delivery-conten-above-input-2-item">
                            <label for="">Địa chỉ giao hàng: </label>
                            <input type="text">
                    </div>
                </table>
            </div>
            <div class="delivery-conten-below">
                <table>
                    <div>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                        </tr>
                        <tr>
                            <td>Áo polo</td>
                            <td>1</td>
                            <td><p>500.000 <sup>đ</sup></p></td>
                        </tr>
                        <tr>
                            <td>Áo nam</td>
                            <td>1</td>
                            <td><p>600.000 <sup>đ</sup></p></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;" colspan="2">Tổng</td>
                            <td class = "sum" style="font-weight: bold;" ><span>1.100.000</span><sup>đ</sup></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;" colspan="2">Thuế VAT</td>
                            <td style="font-weight: bold;" ><span>110.000</span><sup>đ</sup></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;" colspan="2">Tổng tiền hàng</td>
                            <td style="font-weight: bold;" ><span>1.210.000</span><sup>đ</sup></td>
                        </tr>
                    </div>
                </table>
                <div class="delivery-content-left-button">
                    <p><button style="font-weight: bold" type="button" onclick="quaylaigiohang()">&#8678; Quay lại giỏ hàng</button></p>
                </div>
                <div class="delivery-content-right-button">
                    <p><button style="font-weight: bold" type="button" onclick="trangthanhtoan()">THANH TOÁN VÀ GIAO HÀNG</button></p>
                </div>
            </div>
        </div>
    </div>
    </div>
    </section>
</body>
</html>
