<?php 
    require_once('user/header.php');
    echo '<link rel="stylesheet" href="style/category.css">
        <script defer type="text/javascript" src="js/category.js"></script>';
    require_once('user/menu.php');
    require_once('user/function/price.php');

    $prod_name = !empty($_GET['prod_name']) ? $_GET['prod_name'] : '';
    $size = !empty($_GET['size']) ? $_GET['size'] : '';
    $field = !empty($_GET['field']) ? $_GET['field'] : '';
    $by = !empty($_GET['by']) ? $_GET['by'] : '';
    $current_page = !empty($_GET['page']) && $_GET['page'] > 0 ? $_GET['page'] : 1;
?>
<section class="category row">
        <div class="category-top row">
            <div class="category-top-left">
                <span class="search-phrase disabled">Kết quả tìm kiếm </span><span class="keywords"></span><span class="quantity"></span>
            </div>
            <form class="category-top-right" method="GET" onsubmit="removeUselessStuff();">
                <input type="hidden" name="prod_name" value=<?php echo $prod_name; ?>>

                <select name="size" id="size">
                    <option value="">Size</option>
                    <option value="s" <?php if ($size === 's') echo 'selected'; ?>>S</option>
                    <option value="m" <?php if ($size === 'm') echo 'selected'; ?>>M</option>
                    <option value="l" <?php if ($size === 'l') echo 'selected'; ?>>L</option>
                    <option value="xl" <?php if ($size === 'xl') echo 'selected'; ?>>XL</option>
                </select>
                <input type="hidden" name="field" value=<?php echo $field; ?>>
                <input type="hidden" name="by" value=<?php echo $by; ?>>
                <select id="order">
                    <option value="">Sắp xếp</option>
                    <option value="date_added desc" <?php if ($field === 'date_added') echo 'selected'; ?>>Hàng mới về</option>
                    <option value="price" <?php if ($field === 'price' && $by === 'asc') echo 'selected'; ?>>Giá thấp đến cao</option>
                    <option value="price desc" <?php if ($field === 'price' && $by === 'desc') echo 'selected'; ?>>Giá cao đến thấp</option>
                </select>
                <button type="submit" id="btn-filter">Lọc</button>
                <input type="hidden" name="page" value=<?php echo $current_page; ?>>
            </form>
        </div>
        <div class="category-content">
            <?php
                require_once('connect_db.php');
                if(!empty($_GET['prod_name'])) {
                    $sql = "SELECT A.prod_id, cate_id, prod_name, price, quantity, date_added, promo_price, calc_unit FROM size AS C JOIN product AS A ON C.prod_id = A.prod_id LEFT JOIN promotion AS B ON A.promo_code = B.promo_code WHERE UPPER(A.prod_name) LIKE UPPER('%$prod_name%')";
                    if (!empty($size)) {
                        $sql .= " AND C.$size > 0";
                    }

                    $result = $conn->query($sql);
                    $num_rows = $result->num_rows;
                    $prods_per_page = 20;
                    $num_pages = ceil($num_rows / $prods_per_page);
                    $beginning_prod = ($current_page - 1) * $prods_per_page;

                    if (empty($field)) {
                        $sql .= " ORDER BY A.prod_id LIMIT $prods_per_page OFFSET $beginning_prod";
                    } else {
                        $sql .= " ORDER BY $field $by LIMIT $prods_per_page OFFSET $beginning_prod";
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
                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_array()) {
                            $img_path = "images/products/".$row['prod_id'];
                            $images = array_slice(scandir($img_path), 2);
                            echo <<<PROD_AVATAR_NAME
                                <div class="product">
                                    <div class="product__avatar" id="$row[0]">
                                        <img src="$img_path/$images[0]" class="product__avatar--front">
                                        <img src="$img_path/$images[1]" class="product__avatar--back">
                                    </div>
                                    <div class="product__name" title="$row[2]">$row[2]</div>
                            PROD_AVATAR_NAME;

                            $normal_price = formatNumber($row['price']);
                            if ($row['promo_price'] !== null) {
                                $promo_price = $row['promo_price'];
                                $original_price = getPrice($row['price'], $promo_price, $row['calc_unit']);
                                $original_price = formatNumber($original_price);
                                $calc_unit = getCalcUnit($row['calc_unit']);
                                echo <<<PROD_PRICE
                                    <div class="product__price">
                                        <span class="price--original">$original_price<span>đ</span></span>
                                        <span class="price--normal">$normal_price<span>đ</span></span>
                                        <span class="price--discount"> -$promo_price$calc_unit</span>
                                    </div>
                                </div>
                                PROD_PRICE;
                            } else {
                                echo <<<PROD_PRICE
                                    <div class="product__price">
                                        <span class="price--original">$normal_price<span>đ</span></span>
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
        <?php
            if (!empty($prod_name)) {
                $range = 2;
                $min = $current_page - $range;
                $max = $current_page + $range;
                $i = $min > 1 ? $min : 1;
                if ($max > $num_pages) {
                    $max = $num_pages;
                }

                echo "<span data-value='1'><i class='fa-solid fa-angles-left'></i></span>";
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
                echo "<span data-value='$num_pages'><i class='fa-solid fa-angles-right'></i></span>";
            }
        ?>
    </div>
</section>
<?php
    include_once('user/footer.php');
?>
