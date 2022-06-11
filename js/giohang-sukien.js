var number = document.querySelectorAll(".soluong");
var price_money = document.querySelectorAll(".thanhtien span");
var SumNumber = document.querySelector(".sizing-right-number span");
var tongtien = document.querySelector(".sizing-right-money span");

function xoasp(x){
    var tr = x.parentElement.parentElement;      
    var thongbao = confirm("Bạn có chắc chắn muốn xóa không?");
    if(thongbao==true){
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
        id=x.parentElement.parentElement.getAttribute('product_id');
        size1=x.parentElement.parentElement.children[1].getAttribute('product_size');
        console.log(size1);
        delete_item(id,size1);
        alert("Bạn đã xóa thành công!");
    }
    number = document.querySelectorAll(".soluong");
    price_money = document.querySelectorAll(".thanhtien span");
}

number.forEach((item, index)=>{
    item.onchange=function(){
        var soluong = parseInt(item.value);
        var sluongmax= parseInt(item.max);
        var gia = item.parentElement.previousElementSibling.children[0].innerHTML.replaceAll('.', '');
        var giathanh;
         
        giathanh = gia * soluong;
        item.parentElement.nextElementSibling.children[0].innerHTML= giathanh.toLocaleString('de-DE')+' đ';
        var tongSLSP = tongsl(number);
        SumNumber.innerHTML = tongSLSP;

        var tongtienmathang = tongtienhang(price_money);
        if(soluong<0){
            alert("Vui lòng nhập số lượng > 0");
            item.value=1;
            item.onchange();
        }
        tongtien.innerHTML = tongtienmathang.toLocaleString('de-DE');
        id=item.parentElement.parentElement.getAttribute('product_id');
        size1=item.parentElement.previousElementSibling.previousElementSibling.getAttribute('product_size');
        if(sluongmax<soluong){
            alert("Số lượng tối đa có thể mua là: "+sluongmax);
            item.value=1;
            item.onchange();
        }   
        update_number(id, soluong,size1);

        
        if(soluong==''){
            alert("Vui lòng không để trống!");
            item.value = 1;
            item.onchange();
        }
        
    }
})
function tongtienhang(e){
    var sum = 0;
    for(var i = 0;i< e.length;i++){
        sum += parseInt(e[i].innerHTML.replaceAll('.', ''));
    }
    return sum;
}

function tongsl(x){
    var sum = 0;
    for(var i =0; i< x.length;i++){
        sum += parseInt(x[i].value);
    }return sum;
}

function lienketMuaSam(){
    location.href="product-detail.php";
}
function lienketDatHang(){
    location.href="delivery.php";
}
function update_number(id,values,size1){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
            text=this.responseText;
           }
        };
        xhttp.open("POST", "update_cart.php", true);
        xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhttp.send('U=update&pro_id='+id+'&quantity='+values+'&size='+size1);
}
function delete_item(id,size1){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
        text=this.responseText;
       }
    };
    xhttp.open("POST", "update_cart.php", true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('U=delete&pro_id='+id+'&size='+size1);
}


