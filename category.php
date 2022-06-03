<?php 
    require_once('user/header.php');
    require_once('connect_db.php');
    $prod_name = $size = $sort = '';
    if (!empty($_GET['prod_name'])) {
        $prod_name = $_GET['prod_name'];
    }
    if(!empty($_GET['size']))
    {
        $size = $_GET['size'];
    }
    if(!empty($_GET['size']))
    {
        $sort = $_GET['sort'];
    }
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
                    <span class="search-phrase disabled">Kết quả tìm kiếm: </span><span class="keywords"></span>
                </div>
                <form class="category-top-right" method="GET">
                    <input type="hidden" name="prod_name" value=<?php echo $prod_name; ?>>
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
                        if (!empty($sort)) {
                            $sql .= " ORDER BY original_price $sort";
                        }
                        $result = $conn->query($sql);
                        $keywords = $_GET['prod_name'];

                        echo <<<SEARCH_RESULT
                            <script>
                                let phrase = document.querySelector('.search-phrase');
                                let keywords = document.querySelector('.keywords');
                                phrase.classList.remove('disabled');
                                keywords.innerHTML = "$keywords";
                            </script>
                        SEARCH_RESULT;
                        if ($result->num_rows > 0) {
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
