<?php
    require_once('site.php');
    loadHeader();
    echo '<link rel="stylesheet" href="style/index.css">
    <script defer src="js/index.js"></script>';
    loadMenu();
?>
<section id="Slider">
    <div class="aspect-ratio-169">
        <?php
            require 'function/image.php';
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
        <a href="https://www.apple.com/vn/app-store/"><img src="./images/appstore.png" alt=""></a>
        <a href="https://play.google.com/store/apps"><img src="./images/googleplay.png" alt=""></a>
    </div>
    <p>Nhận bản tin 6AESN</p>
    <input type="text" placeholder="Nhập email của bạn..." id="email-receive">
</div>
<?php
    loadFooter();
?>
