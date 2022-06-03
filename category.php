<?php 
    require_once('user/header.php');
?>
	<link rel="stylesheet" href="style/category.css">
	<link rel="stylesheet" href="fontawesome/css/all.css">
    <script defer type="text/javascript" src="js/category.js"></script>
<?php
    require_once('user/menu.php');
?>
    <section class="category row">
			<div class="category-top row">
				<div class="category-top-left">
                    <span class="disabled">Kết quả tìm kiếm cho: </span><span class="category-name">ABA</span>
                </div>
                <form class="category-top-right">
                    <select name="size" id="size">
                        <option value="">Size</option>
                        <option value="S">S</option>
                        <option value="M">M</option>
    					<option value="L">L</option>
    					<option value="XL">XL</option>
                    </select>
                    <select name="sort" id="sort">
                        <option value="">Sắp xếp</option>
                        <option value="asc">Giá thấp đến cao</option>
                        <option value="desc">Giá cao đến thấp</option>
                    </select>
                    <button type="submit" id="btn-filter">Lọc</button>
                </form>
			</div>
            <div class="category-content">
                <?php
                    require_once('connect_db.php');
                    if(isset($_GET['prod_name']))
                    {
                        $prod_name = mb_strtoupper($_GET['prod_name']);
                        $sql = "SELECT * FROM product WHERE product.prod_id AND prod_name LIKE '%$prod_name%'";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0)
                        {
                            while($row = $result->fetch_array())
                            {
                                $out_of_stock = $row['quantity'] === 0;
                                $img_path = "images/products/".$row['prod_id'];
                                $images = array_slice(scandir($img_path), 2);
                                echo <<<PROD_AVATAR_NAME
                                    <div class="product" id="$row[0]" data-status="$out_of_stock">
                                        <div class="product__avatar" title="Nhấn để xem chi tiết">
                                            <img src="$img_path/$images[0]" class="product__avatar--front">
                                            <img src="$img_path/$images[1]" class="product__avatar--back">
                                        </div>
                                        <div class="product__name">$row[2]</div>
                                PROD_AVATAR_NAME;

                                $price_normal = number_format($row['price'], 0, '', '.');
                                if ($row['discount'] > 0) {
                                    $price_original = $row['price'] * (100 - $row['discount']) * 0.01;
                                    $price_original = number_format($price_original, 0, '', '.');
                                    echo <<<PROD_PRICE
                                        <div class="product__price">
                                            <span class="price--original">$price_original<sup>đ</sub></span>
                                            <span class="price--normal">$price_normal<sup>đ</sub></span>
                                            <span class="price--discount"> -$row[4]%</span>
                                        </div>
                                    </div>
                                    PROD_PRICE;
                                } else {
                                    echo <<<PROD_PRICE
                                        <div class="product__price">
                                            <span class="price--original">$price_normal<sup>đ</sub></span>
                                        </div>
                                    </div>
                                    PROD_PRICE;
                                }
                            }
                        }
                    }
                ?>
                <div class="product" id="1">
                    <div class="product__avatar" title="Nhấn để xem chi tiết">
                        <img src="images/products/1/aosomidenim.jpg" class="product__avatar--front">
                        <img src="images/products/1/aosomidenim1.jpg" class="product__avatar--back" alt="Không ảnh">
                    </div>
                    <div class="product__name">Sản phẩm XYZ</div>
                    <div class="product__price">
                        <span class="price--original">100.000đ</span>
                        <span class="price--normal">300.000đ</span>
                        <span class="price--discount">-33%</span>
                    </div>
                </div>
                <div class="product" id="2">
                    <div class="product__avatar" title="Nhấn để xem chi tiết">
                        <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ac8c6ac4-f054-4bec-b48b-51c704ef85c0/df14lma-da5a6921-73ab-4ebf-9b47-7f9f736bfdd0.jpg/v1/fill/w_900,h_1066,q_75,strp/light_study_126_by_razaras_df14lma-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTA2NiIsInBhdGgiOiJcL2ZcL2FjOGM2YWM0LWYwNTQtNGJlYy1iNDhiLTUxYzcwNGVmODVjMFwvZGYxNGxtYS1kYTVhNjkyMS03M2FiLTRlYmYtOWI0Ny03ZjlmNzM2YmZkZDAuanBnIiwid2lkdGgiOiI8PTkwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.DTVr_drZGOqZhAhcGe76N1G8leJRdcmkk9-9t80B5Z4" class="product__avatar--front" alt="Không ảnh">
                        <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ac8c6ac4-f054-4bec-b48b-51c704ef85c0/de2mw6i-ea057719-ae7a-4521-bfce-b21fe8aac7e5.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2FjOGM2YWM0LWYwNTQtNGJlYy1iNDhiLTUxYzcwNGVmODVjMFwvZGUybXc2aS1lYTA1NzcxOS1hZTdhLTQ1MjEtYmZjZS1iMjFmZThhYWM3ZTUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Q-kCgQBHqrxK2s-23Ss5KWSzcoK5a3dq55dD2ApjMNE" class="product__avatar--back" alt="Không ảnh">
                    </div>
                    <div class="product__name">Sản phẩm XYZ</div>
                    <div class="product__price">
                        <span class="price--original">100.000đ</span>
                        <span class="price--normal">300.000đ</span>
                        <span class="price--discount">-33%</span>
                    </div>
                </div>
                <div class="product" id="3">
                    <div class="product__avatar" title="Nhấn để xem chi tiết">
                        <img src="images/products/1/aosomidenim.jpg" class="product__avatar--front">
                        <img src="images/products/1/aosomidenim1.jpg" class="product__avatar--back" alt="Không ảnh">
                    </div>
                    <div class="product__name">Sản phẩm XYZ</div>
                    <div class="product__price">
                        <span class="price--original">100.000đ</span>
                        <span class="price--normal">300.000đ</span>
                        <span class="price--discount">-33%</span>
                    </div>
                </div>
                <div class="product" id="1">
                    <div class="product__avatar" title="Nhấn để xem chi tiết">
                        <img src="images/products/1/aosomidenim.jpg" class="product__avatar--front">
                        <img src="images/products/1/aosomidenim1.jpg" class="product__avatar--back" alt="Không ảnh">
                    </div>
                    <div class="product__name">Sản phẩm XYZ</div>
                    <div class="product__price">
                        <span class="price--original">100.000đ</span>
                        <span class="price--normal">300.000đ</span>
                        <span class="price--discount">-33%</span>
                    </div>
                </div>
                <div class="product" id="2">
                    <div class="product__avatar" title="Nhấn để xem chi tiết">
                        <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ac8c6ac4-f054-4bec-b48b-51c704ef85c0/df14lma-da5a6921-73ab-4ebf-9b47-7f9f736bfdd0.jpg/v1/fill/w_900,h_1066,q_75,strp/light_study_126_by_razaras_df14lma-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTA2NiIsInBhdGgiOiJcL2ZcL2FjOGM2YWM0LWYwNTQtNGJlYy1iNDhiLTUxYzcwNGVmODVjMFwvZGYxNGxtYS1kYTVhNjkyMS03M2FiLTRlYmYtOWI0Ny03ZjlmNzM2YmZkZDAuanBnIiwid2lkdGgiOiI8PTkwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.DTVr_drZGOqZhAhcGe76N1G8leJRdcmkk9-9t80B5Z4" class="product__avatar--front" alt="Không ảnh">
                        <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ac8c6ac4-f054-4bec-b48b-51c704ef85c0/de2mw6i-ea057719-ae7a-4521-bfce-b21fe8aac7e5.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2FjOGM2YWM0LWYwNTQtNGJlYy1iNDhiLTUxYzcwNGVmODVjMFwvZGUybXc2aS1lYTA1NzcxOS1hZTdhLTQ1MjEtYmZjZS1iMjFmZThhYWM3ZTUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Q-kCgQBHqrxK2s-23Ss5KWSzcoK5a3dq55dD2ApjMNE" class="product__avatar--back" alt="Không ảnh">
                    </div>
                    <div class="product__name">Sản phẩm XYZ</div>
                    <div class="product__price">
                        <span class="price--original">100.000đ</span>
                        <span class="price--normal">300.000đ</span>
                        <span class="price--discount">-33%</span>
                    </div>
                </div>
                <div class="product" id="3">
                    <div class="product__avatar" title="Nhấn để xem chi tiết">
                        <img src="images/products/1/aosomidenim.jpg" class="product__avatar--front">
                        <img src="images/products/1/aosomidenim1.jpg" class="product__avatar--back" alt="Không ảnh">
                    </div>
                    <div class="product__name">Sản phẩm XYZ</div>
                    <div class="product__price">
                        <span class="price--original">100.000đ</span>
                        <span class="price--normal">300.000đ</span>
                        <span class="price--discount">-33%</span>
                    </div>
                </div><div class="product" id="1">
                    <div class="product__avatar" title="Nhấn để xem chi tiết">
                        <img src="images/products/1/aosomidenim.jpg" class="product__avatar--front">
                        <img src="images/products/1/aosomidenim1.jpg" class="product__avatar--back" alt="Không ảnh">
                    </div>
                    <div class="product__name">Sản phẩm XYZ</div>
                    <div class="product__price">
                        <span class="price--original">100.000đ</span>
                        <span class="price--normal">300.000đ</span>
                        <span class="price--discount">-33%</span>
                    </div>
                </div>
                <div class="product" id="2">
                    <div class="product__avatar" title="Nhấn để xem chi tiết">
                        <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ac8c6ac4-f054-4bec-b48b-51c704ef85c0/df14lma-da5a6921-73ab-4ebf-9b47-7f9f736bfdd0.jpg/v1/fill/w_900,h_1066,q_75,strp/light_study_126_by_razaras_df14lma-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTA2NiIsInBhdGgiOiJcL2ZcL2FjOGM2YWM0LWYwNTQtNGJlYy1iNDhiLTUxYzcwNGVmODVjMFwvZGYxNGxtYS1kYTVhNjkyMS03M2FiLTRlYmYtOWI0Ny03ZjlmNzM2YmZkZDAuanBnIiwid2lkdGgiOiI8PTkwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.DTVr_drZGOqZhAhcGe76N1G8leJRdcmkk9-9t80B5Z4" class="product__avatar--front" alt="Không ảnh">
                        <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ac8c6ac4-f054-4bec-b48b-51c704ef85c0/de2mw6i-ea057719-ae7a-4521-bfce-b21fe8aac7e5.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2FjOGM2YWM0LWYwNTQtNGJlYy1iNDhiLTUxYzcwNGVmODVjMFwvZGUybXc2aS1lYTA1NzcxOS1hZTdhLTQ1MjEtYmZjZS1iMjFmZThhYWM3ZTUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Q-kCgQBHqrxK2s-23Ss5KWSzcoK5a3dq55dD2ApjMNE" class="product__avatar--back" alt="Không ảnh">
                    </div>
                    <div class="product__name">Sản phẩm XYZ</div>
                    <div class="product__price">
                        <span class="price--original">100.000đ</span>
                        <span class="price--normal">300.000đ</span>
                        <span class="price--discount">-33%</span>
                    </div>
                </div>
                <div class="product" id="3">
                    <div class="product__avatar" title="Nhấn để xem chi tiết">
                        <img src="images/products/1/aosomidenim.jpg" class="product__avatar--front">
                        <img src="images/products/1/aosomidenim1.jpg" class="product__avatar--back" alt="Không ảnh">
                    </div>
                    <div class="product__name">Sản phẩm XYZ</div>
                    <div class="product__price">
                        <span class="price--original">100.000đ</span>
                        <span class="price--normal">300.000đ</span>
                        <span class="price--discount">-33%</span>
                    </div>
                </div><div class="product" id="1">
                    <div class="product__avatar" title="Nhấn để xem chi tiết">
                        <img src="images/products/1/aosomidenim.jpg" class="product__avatar--front">
                        <img src="images/products/1/aosomidenim1.jpg" class="product__avatar--back" alt="Không ảnh">
                    </div>
                    <div class="product__name">Sản phẩm XYZ</div>
                    <div class="product__price">
                        <span class="price--original">100.000đ</span>
                        <span class="price--normal">300.000đ</span>
                        <span class="price--discount">-33%</span>
                    </div>
                </div>
                <div class="product" id="2">
                    <div class="product__avatar" title="Nhấn để xem chi tiết">
                        <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ac8c6ac4-f054-4bec-b48b-51c704ef85c0/df14lma-da5a6921-73ab-4ebf-9b47-7f9f736bfdd0.jpg/v1/fill/w_900,h_1066,q_75,strp/light_study_126_by_razaras_df14lma-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTA2NiIsInBhdGgiOiJcL2ZcL2FjOGM2YWM0LWYwNTQtNGJlYy1iNDhiLTUxYzcwNGVmODVjMFwvZGYxNGxtYS1kYTVhNjkyMS03M2FiLTRlYmYtOWI0Ny03ZjlmNzM2YmZkZDAuanBnIiwid2lkdGgiOiI8PTkwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.DTVr_drZGOqZhAhcGe76N1G8leJRdcmkk9-9t80B5Z4" class="product__avatar--front" alt="Không ảnh">
                        <img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ac8c6ac4-f054-4bec-b48b-51c704ef85c0/de2mw6i-ea057719-ae7a-4521-bfce-b21fe8aac7e5.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2FjOGM2YWM0LWYwNTQtNGJlYy1iNDhiLTUxYzcwNGVmODVjMFwvZGUybXc2aS1lYTA1NzcxOS1hZTdhLTQ1MjEtYmZjZS1iMjFmZThhYWM3ZTUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Q-kCgQBHqrxK2s-23Ss5KWSzcoK5a3dq55dD2ApjMNE" class="product__avatar--back" alt="Không ảnh">
                    </div>
                    <div class="product__name">Sản phẩm XYZ</div>
                    <div class="product__price">
                        <span class="price--original">100.000đ</span>
                        <span class="price--normal">300.000đ</span>
                        <span class="price--discount">-33%</span>
                    </div>
                </div>
                <div class="product" id="3">
                    <div class="product__avatar" title="Nhấn để xem chi tiết">
                        <img src="images/products/1/aosomidenim.jpg" class="product__avatar--front">
                        <img src="images/products/1/aosomidenim1.jpg" class="product__avatar--back" alt="Không ảnh">
                    </div>
                    <div class="product__name">Sản phẩm XYZ</div>
                    <div class="product__price">
                        <span class="price--original">100.000đ</span>
                        <span class="price--normal">300.000đ</span>
                        <span class="price--discount">-33%</span>
                    </div>
                </div>
            </div>
            <div class="category-bottom">
                <span><<</span>
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span>5</span>
                <span>>></span>
            </div>
    </section>
<?php
    include_once('user/footer.php');
?>
