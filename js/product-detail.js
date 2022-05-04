let bigImg = document.querySelector('.gallery--big img');
let zoom = document.querySelector('.gallery--zoom');
let innerImg = document.querySelector('.gallery__inner img');
let images = document.querySelectorAll('.gallery--small img');
let sizes = document.querySelectorAll('.product-detail__size span');
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

sizes.forEach((item, index) => {
    item.addEventListener('click', function() {
        let checkedSize = document.querySelector('.size--checked');
        if (checkedSize !== null) {
            checkedSize.classList = '';
        }
        sizes[index].classList = 'size--checked checked';
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