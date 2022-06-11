<?php
    require_once('user/header.php');
    echo '<link rel="stylesheet" href="style/index.css">
        <script defer src="js/index.js"></script>';
    require_once('user/menu.php');
?>
<section id="Slider">
    <div class="aspect-ratio-169">
        <?php
            require 'user/function/image.php';
            $_Load = getImages("images/sliders");
            $n = count($_Load);
            for($i = 0; $i < $n; $i++) {
                echo "<img src='images/sliders/$_Load[$i]'>";
            }
        ?>
    </div>
    <div class="dot-container">
        <?php
            if($n > 0) {
                echo '<div class="dot active"></div>';
                for($i = 1; $i < $n; $i++) {
                    echo '<div class="dot"></div>';
                }
            }
        ?>
    </div>
</section>
<div class="app-container">
    <p>Tải ứng dụng 6AESN</p>
    <div class="app-google">
        <img src="./images/appstore.png" alt="">
        <img src="./images/googleplay.png" alt="">
    </div>
    <p>Nhận bản tin 6AESN</p>
    <input type="text" placeholder="Nhập email của bạn...">
</div>
<?php
    include_once('user/footer.php');
?>
