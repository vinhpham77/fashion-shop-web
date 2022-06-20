var btn_close = document.querySelector(".div-button-close");
var bang_thongbao_chen_mgg = document.querySelector(".div-delete-0");
var nen = document.querySelector(".div-insert-mgg");
var nut_them = document.querySelector('.btn-mgg-insert');
var bang_thongbao_xoa_cacmgg = document.querySelector(".div-delete-1");
var bang_thongbao_xoa_allmgg = document.querySelector(".div-delete-2");
var bang_thongbao_sua_mgg = document.querySelector(".div-delete-3");
var nut_xoa = document.querySelector(".btn-mgg-delete");
var nut_sua = document.querySelector(".btn-mgg-repair");
var nut_xoahet = document.querySelector(".btn-mgg-delete-all");
var bang_thongbao_themthanhcong = document.querySelector(".themthanhcong");
var nut_xoa_tungcai = document.querySelectorAll(".close-x");
var btn_message_agree = document.querySelector(".btn-mesage-agree");
var btn_message_cancel = document.querySelector(".btn-mesage-cancel");
var input_macode = document.getElementById("input_ma_code");
var input_tencode = document.getElementById("input_ten_code");
var input_tiengiam = document.getElementById("input_tiengiam");
var input_donvitinh = document.getElementById("input_dvt");
var nut_them_bang_insert_mgg = document.querySelector(".btn_them_insert");
nut_them_bang_insert_mgg.addEventListener("click", function() {
    insert_discount(input_macode, input_tencode, input_tiengiam, input_donvitinh);
    bang_thongbao_themthanhcong.style.display = "block";
    lammoi();
    location.reload();
})

function lammoi() {
    input_macode.value = "";
    input_tencode.value = "";
    input_tiengiam.value = "";
    input_donvitinh.value = "";
}

nen.addEventListener("click", function() {
    nen.style.display = "none";
    bang_thongbao_chen_mgg.style.display = "none";
    bang_thongbao_xoa_cacmgg.style.display = "none";
    bang_thongbao_xoa_allmgg.style.display = "none";
    bang_thongbao_sua_mgg.style.display = "none";
    bang_thongbao_themthanhcong.style.display = "none";
})

btn_close.addEventListener("click", function() {
    nen.style.display = "none";
    bang_thongbao_chen_mgg.style.display = "none";
})

bang_thongbao_chen_mgg.addEventListener("click", function(event) {
    event.stopPropagation();
})

bang_thongbao_xoa_cacmgg.addEventListener("click", function(event) {
    event.stopPropagation();
})

bang_thongbao_xoa_allmgg.addEventListener("click", function(event) {
    event.stopPropagation();
})

bang_thongbao_sua_mgg.addEventListener("click", function(event) {
    event.stopPropagation();
})

nut_them.addEventListener("click", function() {
    bang_thongbao_chen_mgg.style.display = "flex";
    nen.style.display = "flex";
    nen.style.backgroundColor = "rgba(0,0,0,.4)";

})

nut_xoa.addEventListener("click", function() {
    bang_thongbao_xoa_cacmgg.style.display = "block";
    nen.style.display = "flex";
    nen.style.backgroundColor = "rgba(0,0,0,.4)";
})

nut_xoa_tungcai.forEach((item, index) => {
    item.addEventListener("click", function() {
        bang_thongbao_xoa_cacmgg.style.display = "block";
        nen.style.display = "flex";
        nen.style.backgroundColor = "rgba(0,0,0,.4)";
    })
})

btn_message_cancel.addEventListener("click", function() {
    nen.style.display = "none";
    bang_thongbao_xoa_cacmgg.style.display = "none";
})

function insert_discount(input_macode, input_tencode, input_tiengiam, input_donvitinh) {
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "function/process_insert_mgg.php", false);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('U=insert&macode=' + input_macode.value + '&tencode=' + input_tencode.value + '&tiengiam=' + input_tiengiam.value + '&donvitinh=' + input_donvitinh.value);
}

function xoamgg(x) {
    btn_message_agree.addEventListener("click", function() {
        var macode = x.parentElement.parentElement.getAttribute('promo_id');
        delete_mgg(macode);
        nen.style.display = "none";
        bang_thongbao_xoa_cacmgg.style.display = "none";
        location.reload();
    })
}

function delete_mgg(id) {
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "function/process_insert_mgg.php", true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('U=delete&macode=' + id);
}
