var input_search = document.getElementById("input-search");
var icon_search = document.querySelector(".search-icon");
var key = input_search;
var x = window.location.pathname;
var pathname_khachhang = "/fashion-shop-web/admin/khachhang.php";
var pathname_hoadon = "/fashion-shop-web/admin/hoadon.php";
var pathname_sanpham = "/fashion-shop-web/admin/sanpham.php";
var pathname_magiamgia = "/fashion-shop-web/admin/magiamgia.php";
icon_search.onclick = search;
key.onkeydown = function(event) {
    if (event.keyCode === 13) {
        search();
    }
}

function search() {
    if (key.value != "") {
        switch (x) {
            case pathname_khachhang:
                {
                    window.location.href = "khachhang.php?key=" + key.value;
                    break;
                }
            case pathname_sanpham:
                {
                    window.location.href = "sanpham.php?key=" + key.value;
                    break;
                }
            case pathname_hoadon:
                {
                    window.location.href = "hoadon.php?key=" + key.value;
                    break;
                }
            case pathname_magiamgia:
                {
                    window.location.href = "magiamgia.php?key=" + key.value;
                    break;
                }

        }
    }
}

icon_search.addEventListener("click", function() {
    var x = window.location.pathname;
    var pathname_khachhang = "/fashion-shop-web/admin/khachhang.php";
    var pathname_hoadon = "/fashion-shop-web/admin/hoadon.php";
    var pathname_sanpham = "/fashion-shop-web/admin/khachhang.php";
    var pathname_magiamgia = "/fashion-shop-web/admin/khachhang.php";
    if (x == pathname_khachhang) {
        tim_khachhang(key);
    } else
    if (x == pathname_sanpham)
        tim_sanpham(key);
    else
    if (x == pathname_hoadon) {
        tim_hoadon(key);
    } else
    if (x == pathname_magiamgia)
        tim_magiamgia(key);


})

function tim_khachhang(key) {

    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "function/process_search.php", true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('U=khachhang&key=' + key.value);
}

function tim_hoadon(key) {

    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "function/process_search.php", true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('U=hoadon&key=' + key.value);
}

function tim_magiamgia(key) {

    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "function/process_search.php", true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('U=magiamgia&key=' + key.value);
}

function tim_sanpham(key) {

    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "function/process_search.php", true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('U=sanpham&key=' + key.value);
}
