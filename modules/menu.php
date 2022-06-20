</head>
<body>
    <header>
        <div class="logo">
            <a href="./"><img  src="./images/logo.png" alt="logo" title="Về trang chủ"></a>
        </div>

        <div class="menu">
            <?php
                require('connect_db.php');
                require_once('function/menu.php');
                $first = 0;
                $sql = "SELECT cate_id, cate_name, parent_cate_id FROM category ORDER BY position";
                $result = $conn->query($sql);
                $cates = $result->fetch_all(MYSQLI_ASSOC);
                $cateTree = getSubCates($cates, $first);
                showCategory($cateTree, $first);

                include_once('function/price.php');
                $sql = "SELECT * FROM promotion ORDER BY promo_name";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    echo '<li class="sale"><a href="products.php?filter=promo_code&value=all">SALE</a>
                        <ul class="sub-menu">';
                    while ($row = $result->fetch_assoc()) {
                        $code = $row['promo_code'];
                        $name = $row['promo_name'];
                        $price = formatPrice($row['promo_price']);
                        $calc_unit = getCalcUnit($row['calc_unit']);
                        echo "<li><a href='products.php?filter=promo_code&value=$code'>
                                <span>$name</span><span> -$price$calc_unit</span>
                            </a></li>";
                    }
                    echo '</ul>
                    </li>';
                }
            ?>
            <li><a href="">THÔNG TIN<a>
                <ul class="sub-menu">
                    <li><a href="https://www.google.com/">Giới thiệu về 6AESN</a></li>
                   <li> <a href="https://www.google.com/">Chính sách hoàn trả</a></li>
                </ul>
            </li>
        </div>
        <div class="orthers">
            <li class="btn-search">
                <input id="input1" placeholder="Tìm kiếm" type="text" name="tim">
                <label for="input1" title="Nhấn để tìm kiếm sản phẩm">
                    <span input="mot" class="sp_timkiem">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </span>
                </label>
            </li>
            <li class="li_dangnhap">
            <?php
                if(isset($_SESSION['username'])){
                    echo'
                    <i class="fa-solid fa-user"></i>
                    <ul class="sub-menu-hienthi-dangnhap">
                        <li><a onclick="dangxuat();">Đăng xuất</a></li>
                        <li><a href="change-pwd.php">Đổi mật khẩu</a></li>
                    </ul>
                    </li>
                    <li><a class="fa--shopping-bag" href="giohang.php" title="Xem giỏ hàng"><i class="fa-solid fa-cart-shopping"></i></a></li>';
                }
                else
                    echo'<a class="fa--user" href="login.php"><i class="fa-solid fa-user" title="Nhấn để đăng nhập"></i></a>
                    </li>
                    <li><a class="fa--shopping-bag" href="giohang.php" title="Xem giỏ hàng"><i class="fa-solid fa-cart-shopping"></i></a></li>';
            ?>
        </div>
    </header>
    <section class="menu-gap"></section>
