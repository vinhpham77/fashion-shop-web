<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bán Hàng</title>
    <link rel="stylesheet" href="style/style.css">
</head>
<body>
    <section class="payment">
    
    <div class="container">
        <div class="payment-content">
          <div class="payment-content-left">
            <div class="payment-content-left-method-eliveryd">
                <p style="font-weight: bolder;">Giao Hàng</p>
                <div class="payment-content-left-method-item">
                    <input checked type="radio">
                    <label for="">Giao Hàng Chuyển Phát Nhanh</label>
                </div>
            </div>
            <div class="payment-content-left-method-payment">
                <p style="font-weight: bolder;">Thanh Toán</p>
                <p>Tất cả giao dịch sẽ được bảo mật và mã hóa . Thông tin khách hàng sẽ được đảm bảo không lưu lại</p>
                <div class="payment-content-left-method-item">
                    <input name="method-payment" type="radio">
                    <label for="">Thanh toán bằng thẻ tính dụng Quốc Tế</label>
                </div>
                <div class="payment-content-left-method-img">
                    <img height="50" width="300" src="images/visa.jpg" alt="">
                </div>
                <div class="payment-content-left-method-item">
                    <input checked name="method-payment" type="radio">
                    <label for="">Thanh toán bằng thẻ ATM</label>
                </div>
                <div class="payment-content-left-method-img">
                    <img  height="100" width="200" src="images/hang.jpg" alt="">
                    <p>Hỗ trợ thanh tốn 24/24 và 38 ngân hàng phổ biến tại Việt Nam</p>
                </div>
                <div class="payment-content-left-method-item">
                    <input name="method-payment" type="radio">
                    <label for="">Thanh Toán Bằng Ví MoMo</label>
                </div>
                <div class="payment-content-left-method-img">
                    <img height="100" width="200" src="images/momo.jpg" >
                </div>
                <div class="payment-content-left-method-item">
                    <input type="radio" name="method-payment" id="">
                    <label for="">Thu tiền tận nơi</label>
                </div>
            </div>
        </div>
	</div>
	<div class="payment-content-right-payment">
            <button>Tiếp tục thanh toán</button>
        </div>
	</div>	
</section>
</body>
</html>
