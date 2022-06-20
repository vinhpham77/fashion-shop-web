<?php
    require_once 'site.php';
    loadHeader();
    echo '<link rel="stylesheet" href="style/products.css">
    <script defer type="text/javascript" src="js/products.js"></script>';
    loadMenu();
    require_once 'function/price.php';
    require_once 'function/image.php';
    if (empty($_GET['filter']) || empty($_GET['value'])) {
    	echo '<script>window.location.href = "./"</script>';
    }
    $filter = $_GET['filter'];
    $value = $_GET['value'];
    $size = !empty($_GET['size']) ? $_GET['size'] : '';
    $field = !empty($_GET['field']) ? $_GET['field'] : '';
    $sort = !empty($_GET['sort']) ? $_GET['sort'] : '';
    $current_page = !empty($_GET['page']) && $_GET['page'] > 0 ? $_GET['page'] : 1;
?>
<section class="products">
    <div class="products-top">
        <div class="products-top-left">
            <span class="filter-phrase"></span>
            <span class="keywords"></span>
            <span class="quantity"></span>
        </div>
        <form class="products-top-right" method="GET" onsubmit="removeUselessStuff();">
            <input type="hidden" name="filter" value=<?php echo $filter; ?>>
            <input type="hidden" name="value" value=<?php echo $value; ?>>
            <select name="size" id="size">
                <option value="">Size</option>
                <option value="s" <?php if ($size === 's') echo 'selected'; ?>>S</option>
                <option value="m" <?php if ($size === 'm') echo 'selected'; ?>>M</option>
                <option value="l" <?php if ($size === 'l') echo 'selected'; ?>>L</option>
               <option value="xl" <?php if ($size === 'xl') echo 'selected'; ?>>XL</option>
            </select>
            <input type="hidden" name="field" value=<?php echo $field; ?>>
            <input type="hidden" name="sort" value=<?php echo $sort; ?>>
            <select id="order">
                <option value="">Sắp xếp</option>
                <option value="date_added desc" <?php if ($field === 'date_added') echo 'selected'; ?>>Hàng mới về</option>
                <option value="price asc" <?php if ($field === 'price' && $sort === 'asc') echo 'selected'; ?>>Giá thấp đến cao</option>
                <option value="price desc" <?php if ($field === 'price' && $sort === 'desc') echo 'selected'; ?>>Giá cao đến thấp</option>
            </select>
            <button type="submit" id="btn-filter" class="btn--black">Lọc</button>
            <input type="hidden" name="page" value=<?php echo $current_page; ?>>
        </form>
    </div>
    <div class="products-content">
        <?php
        require 'connect_db.php';
        switch ($filter) {
            case 'prod_name':
                $where = "WHERE UPPER(A.prod_name) LIKE UPPER('%$value%')";
                $keywords = $value;
                break;
            case 'cate_id':
                $sql = "SELECT cate_name FROM category WHERE $filter = '$value' LIMIT 1";
                $result = $conn->query($sql);
                $keywords = $result->fetch_array()[0];
                $sql = "SELECT cate_id, parent_cate_id FROM category";
                $result = $conn->query($sql);
                $cate_list = $result->fetch_all(MYSQLI_ASSOC);
                require_once 'function/products.php';
                $cate_ID_arr = getItAndAllSubCateIDs($cate_list, $value);
                $cate_IDs = implode(', ', $cate_ID_arr);
                $where = "WHERE A.$filter IN ($cate_IDs)";
                break;
            case 'promo_code':
                if ($value === 'all') {
                  $where = "WHERE B.$filter IS NOT NULL";
                  $keywords = "Khuyến mãi";
                } else {
                    $sql = "SELECT promo_name FROM promotion WHERE promo_code = '$value' LIMIT 1";
                    $result = $conn->query($sql);
                    $keywords = $result->fetch_array()[0];
                    $where = "WHERE A.$filter = '$value'";
                }
                break;
            default:
            $where = "WHERE 1";
            break;
        }
        $sql = "SELECT A.prod_id, cate_id, prod_name, price, quantity, date_added, promo_price, calc_unit FROM size AS C JOIN product AS A ON C.prod_id = A.prod_id LEFT JOIN promotion AS B ON A.promo_code = B.promo_code " . $where;
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
    	$sql .= " ORDER BY $field $sort LIMIT $prods_per_page OFFSET $beginning_prod";
    }
    echo <<<FILTER_RESULT
        <script>
        let phrase = document.querySelector('.filter-phrase');
        let keywordsSpan = document.querySelector('.keywords');
        let quantity = document.querySelector('.quantity');

        if ('$filter' === 'prod_name') {
            phrase.innerHTML = "Kết quả tìm kiếm";
            keywordsSpan.innerHTML = "'$keywords'";
            } else {
                keywordsSpan.innerHTML = "$keywords";
            }
            quantity.innerHTML = ": " + $num_rows + " sản phẩm";
        </script>
    FILTER_RESULT;
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_array()) {
                $img_path = 'images/products/' . $row['prod_id'];
                $images = getImages($img_path);
                echo <<<PROD_AVATAR_NAME
                <div class="product">
                    <div class="product__avatar" id="$row[0]">
                    <img src="$img_path/$images[0]" class="product__avatar--front">
                    <img src="$img_path/$images[1]" class="product__avatar--back">
                </div>
                <div class="product__name" title="$row[2]">$row[2]</div>
                PROD_AVATAR_NAME;

                $normal_price = formatPrice($row['price']);
                if ($row['promo_price'] !== null) {
                    $promo_price = $row['promo_price'];
                    $discounted_price = getPrice($row['price'], $promo_price, $row['calc_unit']);
                    $discounted_price = formatPrice($discounted_price);
                    $promo_price = formatPrice($promo_price);
                    $calc_unit = getCalcUnit($row['calc_unit']);
                    echo <<<PROD_PRICE
                        <div class="product__price">
                            <span>$discounted_price<span>đ</span></span>
                            <span class="price--normal">$normal_price<span>đ</span></span>
                            <span class="price--discount"> -$promo_price$calc_unit</span>
                        </div>
                    </div>
                    PROD_PRICE;
                } else {
                echo <<<PROD_PRICE
                    <div class="product__price">
                        <span>$normal_price<span>đ</span></span>
                    </div>
                </div>
                PROD_PRICE;
                }
         }
     }
     ?>
    </div>
    <div class="products-bottom">
        <?php
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
       ?>
    </div>
</section>
<?php
loadFooter();
?>
