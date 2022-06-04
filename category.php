<?php 
    require_once('user/header.php');
    echo '<link rel="stylesheet" href="style/category.css">
        <link rel="stylesheet" href="fontawesome/css/all.css">
        <script defer type="text/javascript" src="js/category.js"></script>';
    require_once('user/menu.php');

    $prod_name = !empty($_GET['prod_name']) ? $_GET['prod_name'] : '';
    $size = !empty($_GET['size']) ? $_GET['size'] : '';
    $sort = !empty($_GET['sort']) ? $_GET['sort'] : '';
    $current_page = !empty($_GET['page']) && $_GET['page'] > 0 ? $_GET['page'] - 1 : 0;
?>
    <section class="category row">
			<div class="category-top row">
				<div class="category-top-left">
                    <span class="search-phrase disabled">Kết quả tìm kiếm </span><span class="keywords"></span><span class="quantity"></span>
                </div>
                <form class="category-top-right" method="GET">
                    <input type="hidden" name="prod_name" value=<?php echo $prod_name; ?>>
                    <input type="hidden" name="page" value=<?php echo $current_page; ?>>
                    <select name="size" id="size">
                        <option value="">Size</option>
                        <option value="s" <?php if ($size === 's') echo 'selected'; ?>>S</option>
                        <option value="m" <?php if ($size === 'm') echo 'selected'; ?>>M</option>
    					<option value="l" <?php if ($size === 'l') echo 'selected'; ?>>L</option>
    					<option value="xl" <?php if ($size === 'xl') echo 'selected'; ?>>XL</option>
                    </select>
                    <select name="sort" id="sort">
                        <option value="">Sắp xếp</option>
                        <option value="asc" <?php if ($sort === 'asc') echo 'selected'; ?>>Giá thấp đến cao</option>
                        <option value="desc" <?php if ($sort === 'desc') echo 'selected'; ?>>Giá cao đến thấp</option>
                    </select>
                    <button type="submit" id="btn-filter">Lọc</button>
                </form>
			</div>
            <div class="category-content">
                <?php
                    require_once('connect_db.php');
                    if(!empty($_GET['prod_name'])) {
                        $sql = "SELECT product.*, price * (100 - discount) * 0.01 AS original_price FROM product, size WHERE product.prod_id = size.prod_id AND UPPER(prod_name) LIKE UPPER('%$prod_name%')";
                        if (!empty($size)) {
                            $sql .= " AND size.$size > 0";
                        }

                        $result = $conn->query($sql);
                        $num_rows = $result->num_rows;
                        $prods_per_page = 20;
                        $num_pages = ceil($num_rows / $prods_per_page);
                        $beginning_prod = $current_page * $prods_per_page;

                        if (empty($sort)) {
                            $sql .= " ORDER BY product.prod_id LIMIT $prods_per_page OFFSET $beginning_prod";
                        } else {
                            $sql .= " ORDER BY original_price $sort LIMIT $prods_per_page OFFSET $beginning_prod";
                        }
                        $keywords = $_GET['prod_name'];
                        echo <<<SEARCH_RESULT
                            <script>
                                let phrase = document.querySelector('.search-phrase');
                                let keywords = document.querySelector('.keywords');
                                let quantity = document.querySelector('.quantity');
                                phrase.classList.remove('disabled');
                                keywords.innerHTML = "'$keywords'";
                                quantity.innerHTML = ": $num_rows sản phẩm";
                            </script>
                        SEARCH_RESULT;
                        $result = $conn->query($sql);
                        if ($num_rows > 0) {
                            while($row = $result->fetch_array()) {
                                $img_path = "images/products/".$row['prod_id'];
                                $images = array_slice(scandir($img_path), 2);
                                echo <<<PROD_AVATAR_NAME
                                    <div class="product" id="$row[0]">
                                        <div class="product__avatar" title="Nhấn để xem chi tiết">
                                            <img src="$img_path/$images[0]" class="product__avatar--front">
                                            <img src="$img_path/$images[1]" class="product__avatar--back">
                                        </div>
                                        <div class="product__name" title="$row[2]">$row[2]</div>
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
        </div>
        <div class="category-bottom row">
            <span data-value="1"><i class="fa-solid fa-angles-left"></i></span>
            <?php
                $range = 2;
                $current_page++;
                $min = $current_page - $range;
                $max = $current_page + $range;
                $i = $min > 1 ? $min : 1;
                if ($max > $num_pages) {
                    $max = $num_pages;
                }

                while ($i < $current_page) {
                    echo "<span data-value='$i'>$i</span>";
                    $i++;
                }
                echo "<span class='current-page'>$i</span>";
                $i++;
                while ($i <= $max) {
                    echo "<span data-value='$i'>$i</span>";
                    $i++;
                }
            ?>
            <span data-value="<?php echo $num_pages; ?>"><i class="fa-solid fa-angles-right"></i></span>
        </div>
    </section>
<?php
    include_once('user/footer.php');
?>
