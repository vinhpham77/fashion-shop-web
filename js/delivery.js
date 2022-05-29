function quaylaigiohang(){
    location.href = "giohang.php";
}

var tongtien = document.querySelector(".thanhtoan span");
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