<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Product Detail</title>
	<link rel="stylesheet" href="style/reset.css">
	<link rel="stylesheet" href="style/product-detail.css">
	<link rel="stylesheet" href="fontawesome/css/all.min.css">
	<script async type="text/javascript" src="js/product-detail.js"></script>
</head>
<body>
	<div class="product__detail">
		<div class="product-detail__gallery">
			<div class="gallery--big" id="gallery--big">
				<img src="https://pubcdn.ivymoda.com/files/product/thumab/1400/2022/04/21/0419924ccc06d6fbd9c5eae7e8a0afe6.JPG" alt="Ảnh sản phẩm"> 
			</div>
			<div class="gallery--small">
				<img src="https://pubcdn.ivymoda.com/files/product/thumab/1400/2022/04/21/0419924ccc06d6fbd9c5eae7e8a0afe6.JPG" alt="Ảnh sản phẩm" class="product--checked checked">
				<img src="https://pubcdn.ivymoda.com/files/product/thumab/1400/2022/04/21/21c048c5d895eeb3856cdafe789b20f9.JPG" alt="Ảnh sản phẩm">
				<img src="https://pubcdn.ivymoda.com/files/product/thumab/1400/2022/04/21/5e0379dbf1c0dcb54b8bd8e20d96cdb6.JPG" alt="Ảnh sản phẩm">
				<img src="https://pubcdn.ivymoda.com/files/product/thumab/1400/2022/04/21/6a5a99013687159b6466c995820a23bb.JPG" alt="Ảnh sản phẩm">
			</div>
		</div>
		<div class="product-detail__info">
			<div class="product-detail__name">Áo phũ vàng cam óng ánh người đẹp</div>
			<!-- <div class="product-detail__rating" data-href="#">
				<div class="rating__bar">
					<div class="rating__star star--filled"></div>
					<div class="rating__star star--filled"></div>
					<div class="rating__star star--filled"></div>
					<div class="rating__star star--filled"></div>
					<div class="rating__star star--empty"></div>
				</div>
				<div class="rating__text">(1 đánh giá)</div>
			</div> -->
			<div class="product-detail__price">
				<span class="price--original">3.000.000đ</span>
				<span class="price--normal">6.000.000đ</span>
				<span class="price--discount">-50%</span>
			</div>
			<div class="product-detail__colors">
				<p>Màu sắc: <span>Vàng cam óng ánh</span></p>
				<a href="">
					<img src="https://pubcdn.ivymoda.com/files/product/thumab/1400/2022/04/21/0419924ccc06d6fbd9c5eae7e8a0afe6.JPG" class="color--checked checked">
				</a>
				<a href="">
					<img src="https://pubcdn.ivymoda.com/files/product/thumab/1400/2022/04/27/94457894fa5d449111a63f732ff29fb6.JPG">
				</a>
				<a href="">
					<img src="https://pubcdn.ivymoda.com/files/product/thumab/1400/2022/04/06/7a886802addb7aad56499ea9a42c0ca4.JPG">
				</a>
			</div>
			<div class="product-detail__size">
				<p>Size: <span></span></p>
				<span>s</span>
				<span>m</span>
				<span>l</span>
				<span>xl</span>
			</div>
			<div class="product-detail__quantity">
				<div>Số lượng: </div>
				<div>
					<i class="fa-solid fa-minus"></i>
					<input type="number" name="quantity" id="quantity" min="1" value="1" readonly>
					<i class="fa-solid fa-plus"></i>
				</div>
			</div>
			<div class="product-detail__purchasing">
				<span class="buy-now__btn">Mua ngay</span>
				<span class="add-to-cart__btn">Thêm vào giỏ hàng</span>
			</div>
		</div>
		<div class="gallery--zoom">
			<div class="controller controller__exit">
				<i class="fa-solid fa-x"></i>
			</div>
			<div class="gallery__inner">
				<img src="https://pubcdn.ivymoda.com/files/product/thumab/1400/2022/04/21/0419924ccc06d6fbd9c5eae7e8a0afe6.JPG" alt="Ảnh sản phẩm" alt="">
			</div>
			<div class="controller controller__prev">
				<i class="fa-solid fa-chevron-left"></i>
			</div>
			<div class="controller controller__next">
				<i class="fa-solid fa-chevron-right"></i>
			</div>
		</div>
		<div class="toast">
			<div class="toast__icon"><i class="fa-solid fa-circle-exclamation"></i></div>
			<div class="toast__msg"></div>
		</div>
	</div>
	<div class="product__description">
			<div class="tab__header">
				<span class="tab__header--active">Giới thiệu</span>
				<span class="">Chi tiết sản phẩm</span>
				<span class="">Bảo quản</span>
			</div>
			<div class="tab__body">
				<div>
					<p>Đầm được làm từ chất liệu lụa cao cấp, màu sắc và họa tiết lên rõ nét. Đầm dáng cổ V, phần tay cánh tiên được xếp từ nhiều layer chồng lên nhau tạo hiệu ứng bắt mắt. Eo đầm được nhấn cao bằng đai giả. Tà váy được phối đuôi cá hơi xòe. Dọc thân tà là khuy bọc trùng màu với đầm. Lorem ipsum, dolor sit amet consectetur adipisicing elit. Blanditiis odit, voluptatum molestias aut qui odio quidem. Doloremque cupiditate, porro quas labore minus minima ipsam sunt totam dicta hic delectus voluptas?</p>
					<p>Thiết kế đầm bồng bềnh và tinh tế này sẽ là sự lựa chọn hoàn hảo cho chuyến thăm thú mùa hè của nàng. Họa tiết trên đầm được lên màu sáng và rõ nét trên chất liệu lụa cao cấp. Chi tiết tay cánh tiên khéo léo che đi khuyết điểm nơi bắt tay. Dáng đầm thướt tha tôn lên nét đẹp duyên dáng của nàng.</p>
				</div>
				<div class="tab__body--inactive">
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam ex, accusantium debitis, asperiores itaque repellat expedita? Vero eligendi error, provident eveniet dignissimos, rerum facilis explicabo, molestias optio quasi aliquid nostrum!</p>
					<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt similique iste mollitia eum eos quisquam tempora, eveniet vitae quo labore dolor a provident, voluptas eius voluptates, vel perferendis ratione non.</p>
				</div>
				<div class="tab__body--inactive">
					<p>Không ủi</p>
					<p>Không mua</p>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Cum ipsam amet voluptatum expedita aspernatur harum quisquam eveniet vel, ratione corporis? Nisi veniam similique alias recusandae adipisci mollitia voluptates eaque quisquam!</p>
				</div>
			</div>
			<div class="tab__more-description expand--more">
				<i class="fa-solid fa-angle-up"></i>
				<i class="fa-solid fa-angle-down"></i>
				<div class="line"></div>
			</div>
		</div>
</body>
</html>