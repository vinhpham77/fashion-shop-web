
	

<?php
require_once('modules/header.php');
echo '<link rel="stylesheet" href="style/product-detail.css">
<script defer type="text/javascript" src="js/product-detail.js"></script>';
require_once('modules/menu.php');
require_once("connect_db.php");
require_once('modules/function/price.php');
	$sql_chitiet = "SELECT * FROM ((product INNER JOIN description ON product.prod_id = description.prod_id)
									INNER JOIN size ON product.prod_id = size.prod_id  LEFT JOIN promotion on product.promo_code=promotion.promo_code
					AND product.prod_id =".$_GET['product-id'].")";
	$query_chitiet = mysqli_query($conn,$sql_chitiet);

	while($row = mysqli_fetch_array($query_chitiet))
	{
		if(($row['calc_unit']!=''))
		{
			if($row['calc_unit']==0){
				$tiensaugiam=$row['price']-$row['promo_price'];
				$tiensaugiam=number_format($tiensaugiam, 0, '', '.');
			}
			else{
				$tiensaugiam=$row['price']-($row['price']*$row['promo_price']/100);
				$tiensaugiam=number_format($tiensaugiam, 0, '', '.');
				if($row['calc_unit']==1)
					$loaigg="%";
				else
					$loaigg="VND";
			}
		}
		else
		{
			$tiensaugiam=$row['price'];
			$tiensaugiam=number_format($tiensaugiam, 0, '', '.');

			$loaigg="";

		}
		$tien=$row['price'];
		$tiengoc=number_format($tien, 0, '', '.');

		$directory = "images/products/".$row['prod_id'];
		$hinh=array_diff(scandir($directory), array ('..','.'));
	echo'
			<div class="product__detail">
		<div class="product-detail__gallery">
			<div class="gallery--big" id="gallery--big">
				<img src="'.$directory.'/'.$hinh[2].'"alt="">
			</div>
			<div class="gallery--small">
				<img src="'.$directory.'/'.$hinh[2].'"" alt="Ảnh sản phẩm" class="option product--checked checked" >
				<img src="'.$directory.'/'.$hinh[3].'"" alt="Ảnh sản phẩm" class="option" >
				<img src="'.$directory.'/'.$hinh[4].'"" alt="Ảnh sản phẩm" class="option" >
				<img src="'.$directory.'/'.$hinh[5].'"" alt="Ảnh sản phẩm" class="option" >
			</div>
		</div>
		<div class="product-detail__info">
			<h1 prod_id='.$row['prod_id'].' class="product-detail__name">'.$row['prod_name'].'</h1>
			<div class="product-detail__price">
				<span class="price--original">'.$tiensaugiam.'VNĐ</span>
				<span class="price--normal">'.$tiengoc.'VNĐ </span>
				<span class="price--discount">'.$row['promo_price'].$loaigg.'</span>
			</div>

			<div class="product-detail__size">
				<p>Size: <span></span></p>';
				
				$sqlmax="SELECT * from size where prod_id='".$row['prod_id']."'";
				$slmax=mysqli_query($conn,$sqlmax);
				$rowslmax=mysqli_fetch_assoc($slmax);
				$max=0;
				array_shift($rowslmax);
				forEach($rowslmax as $key=> $value)
				{
					if($value==0){
						echo'<span title="Hết hàng">'.$key.'</span>';
					}
					else{
						echo'<span class="option">'.$key.'</span>';
						if($value>$max)
							$max=$value;
					}
					
				}
				// <span class="option">s</span>
				// <span class="option">m</span>
				// <span class="option">l</span>
				// <span class="option">xl</span>
			echo'</div>
			<div class="product-detail__quantity">
				<div>Số lượng: </div>
				<div>
					<i class="fa-solid fa-minus"></i>
					<input type="number" name="quantity" id="quantity" min="1" max='.$max.' value="1" readonly>
					<i class="fa-solid fa-plus"></i>
				</div>
			</div>
			<div class="product-detail__purchasing">
				<span class="btn--buy-now">Mua ngay</span>
				<span class="btn--add-to-cart">Thêm vào giỏ hàng</span>
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
	</div>
	<div class="product__description">
			<div class="tab__header">
				<span class="tab__header--active">Giới thiệu</span>
				<span class="">Chi tiết sản phẩm</span>
				<span class="">Bảo quản</span>
			</div>
			<div class="tab__body">
				<div class="tab__body--active">
					'.$row['introduction'].'
				</div>
				<div>
					'.$row['detail'].'
				</div>
				<div>
					'.$row['maintenance'].'
				</div>
			</div>
			<div class="line"></div>
		</div>
	';
	}
require('modules/footer.php');
?>

