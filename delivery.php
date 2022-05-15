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
            <div class="delivery-conten-above">
                <table>
                    <h1>Vui lòng chọn địa chỉ giao hàng</h1>
                    <div class="delivery-content-login">
                        <i class="fa-solid fa-right-to-bracket"></i>
                        <p><button type="button" onclick="Trang_dang_nhap()">Đăng nhập</button> (nếu bạn đã có tài khoản)</p>
                    </div>
                    <div class="delivery-conten-above-registration">
                        <i class="fa-solid fa-right-to-bracket"></i>
                        <p><button type="button" onclick="Trang_dang_ky()">Đăng ký tài khoản</button> (Nếu bạn chưa có tài khoản)</p>
                    </div>
                    <div class="delivery-conten-above-guest">
                        <i class="fa-solid fa-bell-concierge"></i>
                        <p> <span style="font-weight: bold;">Khách lẻ</span> (Tiếp tục thanh toán và nếu bạn không muốn lưu thông tin)</p>
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
                    <p><button style="font-weight: bold" type="button" onclick="quay_lai_gio_hang()">&#8678; Quay lại giỏ hàng</button></p>
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
