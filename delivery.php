<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="style/styledelivery.css">
	<link rel="stylesheet" href="fontawesome/css/all.css">
</head>
<body>
    <section class="delivery">  
    <div class="container">
        <div class="delivery-content">
            <div class="delivery-content-left">
                <table>
                    <p>Vui lòng chọn địa chỉ giao hàng</p>
                    <div class="delivery-content-login">
                        <i class="fa-solid fa-right-to-bracket"></i>
                        <p><button>Đăng nhập</button> (nếu bạn đã có tài khoản)</p>
                    </div>
                    <div class="delivery-content-left-guest">
                        <input checked name="loaikhach" type="radio">
                        <p> <span style="font-weight: bold;">Khách lẻ</span> (Nếu bạn không muốn lưu thông tin) </p>
                    </div>
                    <div class="delivery-content-left-registration">
                    <input name="loaikhach" type="radio">
                        <p> <span style="font-weight: bold;">Đăng ký</span> (Tạo mới tài khoản với thông tin bên dưới) </p>
                        <div class="delivery-content-left-input-top">
                            <div class="delivery-content-left-input-top-item">
                                <label for="">Họ tên <span style="color: red;">*</span></label>
                                <input type="text">
                            </div>
                            <div class="delivery-content-left-input-top-item">
                                <label for="">Điện thoại <span style="color: red;">*</span></label>
                                <input type="text">
                            </div>
                            <div class="delivery-content-left-input-top-item">
                                <label for="">Tỉnh/TP <span style="color: red;">*</span></label>
                                <input type="text">
                            </div>
                            <div class="delivery-content-left-input-top-item">
                                <label for="">Quận/Huyện <span style="color: red;">*</span></label>
                                <input type="text">
                            </div>
                            <div class="delivery-content-left-input-bottom">
                                <label for="">Địa chỉ <span style="color: red;">*</span></label>
                                <input type="text">
                            </div>
                        </div>
                    </div>
                </table>
            </div>
            <div class="delivery-content-right">
                <table>
                    <div>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Giảm giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                        </tr>
                        <tr>
                            <td>Áo polo</td>
                            <td>-30%</td>
                            <td>1</td>
                            <td><p>500.000 <sup>đ</sup></p></td>
                        </tr>
                        <tr>
                            <td>Áo nam</td>
                            <td>-20%</td>
                            <td>1</td>
                            <td><p>600.000 <sup>đ</sup></p></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;" colspan="3">Tổng</td>
                            <td style="font-weight: bold;" ><p>600.000 <sup>đ</sup></p></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;" colspan="3">Thuế VAT</td>
                            <td style="font-weight: bold;" ><p>60.000 <sup>đ</sup></p></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;" colspan="3">Tổng tiền hàng</td>
                            <td style="font-weight: bold;" ><p>600.000 <sup>đ</sup></p></td>
                        </tr>
                    </div>
                    
                </table>
                <div class="delivery-content-right-buttom">
                    <a href=""><span>&#10502;</span><p>Quay lại giỏ hàng</p></a>
                    <button><p style="font-weight: bold;">THANH TOÁN VÀ GIAO HÀNG</p></button>
                </div>
            </div>
        </div>
    </div>
    </section>
</body>
</html>
