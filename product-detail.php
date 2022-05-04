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
				<span>s</span>
				<span>m</span>
				<span>l</span>
				<span>xl</span>
			</div>
			<div class="product-detail__quantity">
				<label for="quantity">Số lượng: </label>
				<input type="number" name="quantity" id="quantity" min="1" value="1">
			</div>
			<div class=""></div>
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
	</div>
</body>
</html>