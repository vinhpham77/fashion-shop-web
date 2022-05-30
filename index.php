<?php
    require_once('widget/header.php');
    require_once('widget/menu.php');
?>

    <section id="Slider">
        <div class="aspect-ratio-169">
            <img src="./images/sliders/slider1.jpg" alt="">
            <img src="./images/sliders/slider2.jpg" alt="">
            <img src="./images/sliders/slider3.jpg" alt="">
            <img src="./images/sliders/slider4.jpg" alt="">
        </div>
        <div class="dot-container">
            <div class="dot active"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>
    </section>

    <!--apcontainer-->
    <section class="app-container">
        <p>Tải ứng dụng 6AESN</p>
        <div class="app-google">
            <img src="./images/appstore.png" alt="">
            <img src="./images/googleplay.png" alt="">
        </div>
        <p>Nhận bản tin 6AESN</p>
        <input type="text" placeholder="Nhập email của bạn...">
    </section>    
<?php
    include_once('widget/footer.php');
?>
