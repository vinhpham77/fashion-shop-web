<?php
    require_once 'modules/header.php';
    echo '<link rel="stylesheet" href="style/product-detail.css">
        <script defer type="text/javascript" src="js/product-detail.js"></script>';
    require_once 'modules/menu.php';
    require_once "connect_db.php";
    require_once 'function/price.php';
    include_once 'function/image.php';
    $sql_chitiet = "SELECT * FROM product JOIN description ON product.prod_id = description.prod_id
            JOIN size ON product.prod_id = size.prod_id
            LEFT JOIN promotion on product.promo_code=promotion.promo_code
            WHERE product.prod_id =" . $_GET['product-id'];
    $query_chitiet = mysqli_query($conn, $sql_chitiet);
    if ($row = mysqli_fetch_array($query_chitiet)) {
    	$tiensaugiam = getPrice($row['price'], $row['promo_price'], $row['calc_unit']);
    	$tiensaugiam = formatPrice($tiensaugiam);
    	$loaigg = getCalcUnit($row['calc_unit']);
    	$tien = $row['price'];
    	$tiengoc = formatPrice($tien);
    	$directory = "images/products/" . $row['prod_id'];
    	$hinh = getImages($directory);

?>
	<div class="product__detail">
		<div class="product-detail__gallery">
			<div class="gallery--big" id="gallery--big"><?php echo '
				<img src="' . $directory . '/' . $hinh[0] . '"alt="">
			</div>';?>
			<div class="gallery--small">
                <?php
                    $n = count($hinh);
                    if ($n > 0) {
                        echo '<img src="' . $directory . '/' . $hinh[0] . '"" alt="Ảnh sản phẩm" class="option product--checked checked" >';
                        for ($i = 1; $i < $n && $i < 4; $i++) {
                            echo '<img src="' . $directory . '/' . $hinh[$i] . '"" alt="Ảnh sản phẩm" class="option" >';
                        }
                    }
                ?>
			</div>
	    </div>
        <div class="product-detail__info"><?php echo'
			<h1 prod_id=' . $row['prod_id'] . ' class="product-detail__name">' . $row['prod_name'] . '</h1>
			<div class="product-detail__price">';
        	if ($tiensaugiam == $tiengoc) {
        		echo '<span>' . $tiengoc . 'đ</span>';
        	} else {
        		echo '<span>' . $tiensaugiam . 'đ</span>
        		      <span class="price--normal">' . $tiengoc . 'đ </span>
        		      <span class="price--discount">' . $row['promo_price'] . $loaigg . '</span>';
        	}
        	echo '
        		</div>
        		<div class="product-detail__size">
        			<p>Size: <span></span></p>';
        	$sqlmax = "SELECT * from size where prod_id='" . $row['prod_id'] . "'";
        	$slmax = mysqli_query($conn, $sqlmax);
        	$rowslmax = mysqli_fetch_assoc($slmax);
        	$max = 0;
        	array_shift($rowslmax);
        	forEach ($rowslmax as $key => $value) {
        		if ($value == 0) {
        			echo '<span title="Hết hàng">' . $key . '</span>';
        		} else {
        			echo '<span class="option">' . $key . '</span>';
        			if ($value > $max) {
        				$max = $value;
        			}
        		}
        	}
        	?>
            </div>
    		<div class="product-detail__quantity">
    			<div>Số lượng: </div>
    			<div>
    				<i class="fa-solid fa-minus"></i>
                    <?php echo '
    				<input type="number" name="quantity" id="quantity" min="1" max=' . $max . ' value="1" readonly>'; ?>
    				<i class="fa-solid fa-plus"></i>
    			</div>
    		</div>
    		<div class="product-detail__purchasing">
    			<span class="btn--buy-now btn--black">Mua ngay</span>
    			<span class="btn--add-to-cart btn--white">Thêm vào giỏ hàng</span>
    		</div>
	       </div>
        	<div class="gallery--zoom">
        		<div class="controller controller__exit">
        			<i class="fa-solid fa-x"></i>
        		</div>
        		<div class="gallery__inner">
        			<img src="" alt="Ảnh sản phẩm" alt="">
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
                    <?php echo '
    					' . $row['introduction'] . '
    				</div>
    				<div>
    					' . $row['detail'] . '
    				</div>
    				<div>
    					' . $row['maintenance'] . '
    				</div>
    			</div>
    		</div>';
}
    require 'modules/footer.php';
?>
