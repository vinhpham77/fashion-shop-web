let bigImg = document.querySelector('.gallery--big img');
let zoom = document.querySelector('.gallery--zoom');
let innerImg = document.querySelector('.gallery__inner img');
let images = document.querySelectorAll('.gallery--small img');
let exit = document.querySelector('.controller__exit');
let next = document.querySelector('.controller__next');
let prev = document.querySelector('.controller__prev');
let currentIndex = 0;

images.forEach((item, index) => {
    item.addEventListener('click', function() {
        currentIndex = index;
        bigImg.src = images[currentIndex].src;
        let checkedProduct = document.querySelector('.product--checked');
        checkedProduct.classList = '';
        images[currentIndex].classList = 'product--checked checked';
    })
})

bigImg.addEventListener('click', function() {
    zoom.classList.add('show');
    showBigImg();
})

exit.addEventListener('click', function() {
    zoom.classList.remove('show');
})

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

next.addEventListener('click', function() {
    if (currentIndex < images.length - 1) {
        currentIndex++;
        showBigImg();
    }
})

prev.addEventListener('click', function() {
    if (currentIndex > 0) {
        currentIndex--;
        showBigImg();
    }
})

let sizes = document.querySelectorAll('.product-detail__size > span');
let sizeName = document.querySelector('.product-detail__size > p > span');

sizes.forEach((item, index) => {
    item.addEventListener('click', function() {
        let checkedSize = document.querySelector('.size--checked');
        if (checkedSize !== null) {
            checkedSize.classList = '';
        }
        sizes[index].classList = 'size--checked checked';
        sizeName.innerHTML = sizes[index].innerHTML;
    })
})

let plus = document.querySelector('.fa-plus');
let minus = document.querySelector('.fa-minus');
let quantityInput = document.querySelector('#quantity');
let quantityOnHand = 999;

plus.addEventListener('click', function() {
    if (quantityInput.value < quantityOnHand) {
        quantityInput.value++;
    }
})

minus.addEventListener('click', function() {
    if (quantityInput.value > 1) {
        quantityInput.value--;
    }
})

let tabHeaders = document.querySelectorAll('.tab__header > span');
let tabBodies = document.querySelectorAll('.tab__body > div');
let currentBodyIndex = 0;
tabHeaders.forEach((item, index) => {
    item.addEventListener('click', function() {
        let currentTabHeader = document.querySelector('.tab__header--active');
        currentTabHeader.classList = '';
        tabBodies[currentBodyIndex].classList = 'tab__body--inactive';
        currentBodyIndex = index;
        tabBodies[currentBodyIndex].classList = '';
        item.classList = 'tab__header--active';
    })
})

let btnExpand = document.querySelector('.tab__more-description');
let tapBody = document.querySelector('.tab__body');
btnExpand.addEventListener('click', function() {
    if (btnExpand.classList.contains('expand--more')) {
        btnExpand.classList.remove('expand--more');
        btnExpand.classList.add('expand--less');
        tapBody.style.height = "auto";
    } else {
        btnExpand.classList.remove('expand--less');
        btnExpand.classList.add('expand--more');
        tapBody.style.height = "100px";
    }
})

let btnBuyNow = document.querySelector('.buy-now__btn');
let btnAddToCart = document.querySelector('.add-to-cart__btn');
let toastMsg = document.querySelector('.toast__msg');
let toast = document.querySelector('.toast');

function autoToast(msg) {
    toastMsg.innerHTML = msg;
    toast.classList.add('toast--show');
    setTimeout(function() {
        toast.classList.remove('toast--show');
    }, 1.2 * 1000);
}

btnBuyNow.addEventListener('click', function() {
    let checkedSize = document.querySelector('.size--checked');
    if (checkedSize === null) {
        autoToast("Bạn chưa chọn size!");
    } else {
        window.location.assign('delivery.php');
    }
})

btnAddToCart.addEventListener('click', function() {
    let checkedSize = document.querySelector('.size--checked');
    if (checkedSize === null) {
        autoToast("Bạn chưa chọn size!");
    } else {
        autoToast("Thêm vào giỏ hàng thành công!");
    }
})