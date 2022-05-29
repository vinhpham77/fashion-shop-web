<?php 
    require_once "connection.php";
    echo 'Đăng nhập thành công';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="style/categorystyle.css">
	<link rel="stylesheet" href="fontawesome/css/all.css">
    <script async type="text/javascript" src="js/category.js"></script>
</head>
<body>
    <section class="category">
        <div class="container">
            <div class="category-top row">
                <p>Trang chủ</p> <span>&#8594;</span> <p>Nữ</p> <span>&#8594;</span> <p>Hàng nữ mới về</p>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="category-left">
                    <ul>
                        <li class="category-left-li"><a href="#">Nữ</a> 
                            <ul>
                                <li><a href="">Hàng nữ mới về</a></li>
                                <li><a href="">Beyond trendy</a></li>
                                <li><a href="">Jeans for joy</a></li>
                                <li><a href="">Quần jeans nữ</a></li>
                            </ul>
                        </li>
                        <li class="category-left-li"><a href="#">Nam</a>
                            <ul>
                                <li><a href="">Hàng nam mới về</a></li>
                                <li><a href="">Beyond trendy</a></li>
                                <li><a href="">Jeans for joy</a></li>
                                <li><a href="">Quần jeans nam</a></li>
                            </ul>
                        </li>
                        <li class="category-left-li"><a href="#">Trẻ em</a> 
                            <ul>
                                <li><a href="">Hàng trẻ em mới về</a></li>
                                <li><a href="">Beyond trendy</a></li>
                            </ul>
                        </li>
                        <li class="category-left-li"><a href="#">Bộ sưu tập</a>
                        </li>
                    </ul>
                </div>
                <div class="category-right row">
                    <div class="category-right-top-item">
                        <p>Hàng nữ mới về</p>
                    </div>
					
					<div class="category-right-top-item">
						<select name="" id="">
                            <option value="">Size</option>
                            <option value="">S</option>
                            <option value="">M</option>
							<option value="">L</option>
							<option value="">XL</option>
							<option value="">XXL</option>
                        </select>
					</div>					              
                    <div class="category-right-top-item">
                        <select name="" id="">
                            <option value="">Sắp xếp</option>
                            <option value="">Giá thấp đến cao</option>
                            <option value="">Giá cao đến thấp</option>
                        </select>
                    </div>
                    <div class="category-right-content row">
                        <div class="category-right-content-item">
                            <img src="images/sp1.jpg" alt="">
                            <h1>Sản phẩm 1</h1>
                            <p>50.000<sup>đ</sup></p>
                        </div>
                        <div class="category-right-content-item">
                            <img src="images/sp2.jpg" alt="">
                            <h1>Sản phẩm 2</h1>
                            <p>600.000<sup>đ</sup></p>
                        </div>
                        <div class="category-right-content-item">
                            <img src="images/sp3.jpg" alt="">
                            <h1>Sản phẩm 3</h1>
                            <p>600.000<sup>đ</sup></p>
                        </div>
                        <div class="category-right-content-item">
                            <img src="images/sp4.jpg" alt="">
                            <h1>Sản phẩm 4</h1>
                            <p>600.000<sup>đ</sup></p>
                        </div>
                        <div class="category-right-content-item">
                            <img src="images/sp5.jpg" alt="">
                            <h1>Sản phẩm 5</h1>
                            <p>600.000<sup>đ</sup></p>
                        </div>
                        <div class="category-right-content-item">
                            <img src="images/sp6.jpg" alt="">
                            <h1>Sản phẩm 6</h1>
                            <p>600.000<sup>đ</sup></p>
                        </div>
                        <div class="category-right-content-item">
                            <img src="images/sp7.jpg" alt="">
                            <h1>Sản phẩm 7</h1>
                            <p>600.000<sup>đ</sup></p>
                        </div>
                        <div class="category-right-content-item">
                            <img src="images/sp8.jpg" alt="">
                            <h1>Sản phẩm 8</h1>
                            <p>600.000<sup>đ</sup></p>
                        </div>
                    </div>
                    <div class="category-right-bottom row">
                        <div class="category-right-bottom-item">
                            <p>Hiển thị 2 <span>|</span> 4 Sản phẩm</p>
                        </div>
                        <div class="category-right-bottom-item">
                            <p><span>&#171;</span>1 2 3 4 5<span>&#187;</span>Trang cuối</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>