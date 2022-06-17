var number = document.querySelectorAll(".soluong");
var price_money = document.querySelectorAll(".thanhtien span");
var SumNumber = document.querySelector(".sizing-right-number span");
var tongtien = document.querySelector(".sizing-right-money span");
var btn_dathang = document.querySelector(".cart-content-right-button");
var btn_quaylui = document.querySelector(".cart-content-left-button");

var prodTableBody = document.querySelector(".cart-content-left table tbody");
var prodTableHead = document.querySelector(".cart-content-left table thead");

function setWidthProdTableHead() {
    if (prodTableBody.scrollHeight > prodTableBody.clientHeight) {
        prodTableHead.style.setProperty('width', 'calc(100% - 1em)');
    } else {
        prodTableHead.style.setProperty('width', '100%');
    }

    btn_quaylui.addEventListener("click", function() {
        history.back();
    });
}
setWidthProdTableHead();


function truyenquathanhtoan(check) {
    if (check == 1) {
        var id = document.querySelector('.tr_id');
        var size = document.querySelector('.kichcoSP');
        if (id == null)
            alert("Chưa có sản phẩm nào!");
        else {
            var get_id = id.getAttribute('product_id');
            var get_size = size.getAttribute('product_size');
            window.location.href = "delivery.php?id=" + get_id + "&size=" + get_size;
        }
    } else {
        window.location.href = "delivery.php";
    }
}

function xoasp(x) {
    var tr = x.parentElement.parentElement;
    var thongbao = confirm("Bạn có chắc chắn muốn xóa không?");
    if (thongbao == true) {
        var numberone = x.parentElement.parentElement.children[3].children[0].value;
        var tongtienmacdinh = x.parentElement.parentElement.children[4].children[0].innerHTML.replaceAll('.', '');
        var tinhtong = tongtienmacdinh.replaceAll('đ', '');

        var soluongcu = SumNumber.innerHTML;
        var soluonghientai = soluongcu - numberone;

        SumNumber.innerHTML = soluonghientai;
        var thanhtoancu = tongtien.innerHTML.replaceAll('.', '');
        var thanhtoanhientai = thanhtoancu - tinhtong;
        tongtien.innerHTML = thanhtoanhientai.toLocaleString('de-DE');
        tr.remove();
        id = x.parentElement.parentElement.getAttribute('product_id');
        size1 = x.parentElement.parentElement.children[1].getAttribute('product_size');
        delete_item(id, size1);
        setWidthProdTableHead();
    }
    number = document.querySelectorAll(".soluong");
    price_money = document.querySelectorAll(".thanhtien span");
}

number.forEach(item => {
    item.onchange = function() {
        var soluong = parseInt(item.value);
        var sluongmax = parseInt(item.max);
        var gia = item.parentElement.previousElementSibling.children[0].innerHTML;
        gia = gia.replaceAll('.', '').replace('đ', '');
        var giathanh;

        giathanh = gia * soluong;
        item.parentElement.nextElementSibling.children[0].innerHTML = giathanh.toLocaleString('de-DE') + 'đ';
        var tongSLSP = tongsl(number);
        SumNumber.innerHTML = tongSLSP;
        var tongtienmathang = tongtienhang(price_money);
        if (soluong < 0 || soluong > sluongmax) {
            item.value = 1;
            item.onchange();
        }

        tongtien.innerHTML = tongtienmathang.toLocaleString('de-DE');
        id = item.parentElement.parentElement.getAttribute('product_id');
        size1 = item.parentElement.previousElementSibling.previousElementSibling.getAttribute('product_size');
        update_number(id, soluong, size1);
    }
})

function tongtienhang(e) {
    var sum = 0;
    for (var i = 0; i < e.length; i++) {
        sum += parseInt(e[i].innerHTML.replaceAll('.', ''));
    }
    return sum;
}

function tongsl(x) {
    var sum = 0;
    for (var i = 0; i < x.length; i++) {
        sum += parseInt(x[i].value);
    }
    return sum;
}

function update_number(id, values, size1) {
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "function/update_cart.php", true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('U=update&pro_id=' + id + '&quantity=' + values + '&size=' + size1);
}

function delete_item(id, size1) {
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "function/update_cart.php", true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('U=delete&pro_id=' + id + '&size=' + size1);
}

let plus = document.querySelectorAll('.fa-plus');
let minus = document.querySelectorAll('.fa-minus');
plus.forEach(item => {
    item.onclick = function() {
        let quantityInput = item.previousElementSibling;
        soluonginput = parseInt(quantityInput.value);
        soluonginputmax = parseInt(quantityInput.max);
        if (soluonginput < soluonginputmax) {
            quantityInput.value++;
        }
    }
})

minus.forEach(item => {
    item.onclick = function() {
        let quantityInput = item.nextElementSibling;
        soluonginput = parseInt(quantityInput.value);
        soluonginputmax = parseInt(quantityInput.max);
        if (soluonginput > 1) {
            quantityInput.value--;
        }
    }
})

// plus.onclick = function() {
//     soluonginput = parseInt(quantityInput.value);
//     soluonginputmax = parseInt(quantityInput.max);
//     if (soluonginput < soluonginputmax) {
//         quantityInput.value++;
//     }
// }

// minus.onclick = function() {

// }
