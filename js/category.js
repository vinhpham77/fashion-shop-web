let products = document.querySelectorAll('.product>.product__avatar');
products.forEach(function(item) {
    item.title = "Nhấn để xem chi tiết";
    item.onclick = function() {
        window.location.href = "product-detail.php?product-id=" + item.id;
    };
});

let pages = document.querySelectorAll('.category-bottom>span:not(.current-page)');
let current_page = document.querySelector('.category-top-right>input[name="page"]');
let form = document.querySelector('.category-top-right');
pages.forEach(function(item) {
    item.onclick = function() {
        current_page.value = item.getAttribute('data-value');
        form.submit();
    }
})
