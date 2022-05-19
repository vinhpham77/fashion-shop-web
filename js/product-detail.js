let bigImg = document.querySelector('.gallery--big img');
let zoom = document.querySelector('.gallery--zoom');
let innerImg = document.querySelector('.gallery__inner img');
let images = document.querySelectorAll('.gallery--small img');
let exit = document.querySelector('.controller__exit');
let next = document.querySelector('.controller__next');
let prev = document.querySelector('.controller__prev');
let currentIndex = 0;

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

let sizes = document.querySelectorAll('.product-detail__size > span');
let sizeName = document.querySelector('.product-detail__size > p > span');

sizes.forEach(function(item) {
    item.onclick = function() {
        let checkedSize = document.querySelector('.size--checked');
        if (checkedSize !== null) {
            checkedSize.classList.remove('size--checked');
            checkedSize.classList.remove('checked');
        }
        item.classList.add('size--checked');
        item.classList.add('checked');
        sizeName.innerHTML = item.innerHTML;
    }
})

let plus = document.querySelector('.fa-plus');
let minus = document.querySelector('.fa-minus');
let quantityInput = document.querySelector('#quantity');
let quantityOnHand = 999;

plus.onclick = function() {
    if (quantityInput.value < quantityOnHand) {
        quantityInput.value++;
    }
}

minus.onclick = function() {
    if (quantityInput.value > 1) {
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
    let checkedSize = document.querySelector('.size--checked');
    if (checkedSize === null) {
        alert("Bạn chưa chọn size!");
    } else {
        window.location.assign('delivery.php');
    }
}

btnAddToCart.onclick = function() {
    let checkedSize = document.querySelector('.size--checked');
    if (checkedSize === null) {
        alert("Bạn chưa chọn size!");
    } else {
        alert("Thêm vào giỏ hàng thành công!");
    }
}
