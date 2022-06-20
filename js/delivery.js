function quaylaigiohang(){
    history.back();
}
var thead = document.querySelector('.delivery-conten-below thead');
var tfoot = document.querySelector('.delivery-conten-below tfoot');
var tbody = document.querySelector('.delivery-conten-below tbody');
function setWidth(item) {
    if (tbody.scrollHeight > tbody.clientHeight) {
        item.style.setProperty('width', 'calc(100% - 1em)');
    } else {
        item.style.setProperty('width', '100%');
    }
}
setWidth(thead);
setWidth(tfoot);

var tongtien = document.querySelector(".thanhtoan span");
var btn_quaylui=document.querySelector(".cart-content-left-button");

var Gia = document.querySelectorAll(".thanhtien p");
function tongtienhang(e){
    var sum = 0;
    for(var i = 0;i< e.length;i++){
        sum += parseInt(e[i].innerHTML.replaceAll('.', '').replace('<sup>đ</sup>',''));
    }
    return sum;
}
var tongtienhang = tongtienhang(Gia);
tongtien.innerHTML = tongtienhang.toLocaleString('de-DE');
