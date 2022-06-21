let bigImg = document.querySelector('.gallery--big img');
let zoom = document.querySelector('.gallery--zoom');
let innerImg = document.querySelector('.gallery__inner img');
let images = document.querySelectorAll('.gallery--small img');
let exit = document.querySelector('.controller__exit');
let next = document.querySelector('.controller__next');
let prev = document.querySelector('.controller__prev');
let currentIndex = 0;
let id = document.querySelector('.product-detail__name').getAttribute('prod_id');

images.forEach((item, index) => {
    item.onclick = function() {
        currentIndex = index;
        bigImg.src = images[currentIndex].src;
        let checkedProduct = document.querySelector('.product--checked');
        checkedProduct.classList.remove('product--checked');
        checkedProduct.classList.remove('checked');
        images[currentIndex].classList.add('product--checked');
        images[currentIndex].classList.add('checked');
    }
})

bigImg.onclick = function() {
    zoom.classList.add('show');
    showBigImg();
}

exit.onclick = function() {
    zoom.classList.remove('show');
}

function showBigImg() {
    innerImg.src = images[currentIndex].src;

    if (currentIndex === 0) {
        prev.classList.add('hide');
    } else {
        prev.classList.remove('hide');
    }

    if (currentIndex === images.length - 1) {
        next.classList.add('hide');
    } else {
        next.classList.remove('hide');
    }
}

next.onclick = function() {
    if (currentIndex < images.length - 1) {
        currentIndex++;
        showBigImg();
    }
}

prev.onclick = function() {
    if (currentIndex > 0) {
        currentIndex--;
        showBigImg();
    }
}

let sizes = document.querySelectorAll('.product-detail__size > span.option');
let sizeName = document.querySelector('.product-detail__size > p > span');
let quantityInput = document.querySelector('#quantity');

sizes.forEach(function(item) {
    item.onclick = function() {
        let checkedSize = document.querySelector('.size--checked');
        if (checkedSize != null) {
            checkedSize.classList.remove('size--checked');
            checkedSize.classList.remove('checked');
        }
        item.classList.add('size--checked');
        item.classList.add('checked');
        quantityInput.value = 1;
        sizeName.innerHTML = item.innerHTML;
        laysp(id, sizeName.innerHTML);
    }
})

let plus = document.querySelector('.fa-plus');
let minus = document.querySelector('.fa-minus');

plus.onclick = function() {
    soluonginput = parseInt(quantityInput.value);
    soluonginputmax = parseInt(quantityInput.max);
    if (soluonginput < soluonginputmax) {
        quantityInput.value++;
    }
}

minus.onclick = function() {
    soluonginput = parseInt(quantityInput.value);
    soluonginputmax = parseInt(quantityInput.max);
    if (soluonginput > 1) {
        quantityInput.value--;
    }
}

let tabHeaders = document.querySelectorAll('.tab__header > span');
let tabBodies = document.querySelectorAll('.tab__body > div');

tabHeaders.forEach((item, index) => {
    item.onclick = function() {
        let currentTabHeader = document.querySelector('.tab__header--active');
        let currentTabBody = document.querySelector('.tab__body--active');
        currentTabHeader.classList.remove('tab__header--active');
        item.classList.add('tab__header--active');
        currentTabBody.classList.remove('tab__body--active');
        tabBodies[index].classList.add('tab__body--active');
    }
})

let btnBuyNow = document.querySelector('.btn--buy-now');
let btnAddToCart = document.querySelector('.btn--add-to-cart');

btnBuyNow.onclick = function() {
    if(loggedIn()) {
        let checkedSize = document.querySelector('.size--checked');
        if (checkedSize === null) {
            alert("Bạn chưa chọn size!");
        } else {
            update_number(id, quantityInput.value, sizeName.innerHTML);
            soluonginput = parseInt(quantityInput.value);
            window.location.href = "giohang.php?prod_id=" + id + "&size=" + sizeName.innerHTML;
        }
    }
}

btnAddToCart.onclick = function() {
    if (loggedIn()) {
        let checkedSize = document.querySelector('.size--checked');
        if (checkedSize === null) {
            alert("Bạn chưa chọn size!");
        } else {
            update_number(id, quantityInput.value, sizeName.innerHTML);
            alert("Thêm vào giỏ hàng thành công!");
        }
    }
}

function update_number(id, values, size) {
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "function/update_product-detail.php");
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('U=update&pro_id=' + id + '&quantity=' + values + '&size=' + size);
}

function laysp(id, size) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            text = this.responseText;
            quantityInput.max = text;
        }
    };
    xhttp.open("POST", "function/process_size.php");
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('U=2&prod_id=' + id + '&size=' + size);
}

function loggedIn(){
    let submenuLogin = document.querySelector('.sub-menu-hienthi-dangnhap');
    if (submenuLogin == null) {
        alert('Vui lòng đăng nhập trước!');
        window.location.href = 'login.php';
        return false;
    }
    return true;
}
