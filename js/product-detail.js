var bigImg = document.querySelector('.gallery--big img');
var zoom = document.querySelector('.gallery--zoom');
var innerImg = document.querySelector('.gallery__inner img');
var images = document.querySelectorAll('.gallery--small img');
var exit = document.querySelector('.controller__exit');
var next = document.querySelector('.controller__next');
var prev = document.querySelector('.controller__prev');
var currentIndex = 0;

images.forEach((item, index) => {
    item.addEventListener('click', function() {
        currentIndex = index;
        bigImg.src = images[currentIndex].src;
        let checkedProduct = document.querySelector('.product--checked');
        checkedProduct.classList.remove('product--checked');
        images[currentIndex].classList.add('product--checked');
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