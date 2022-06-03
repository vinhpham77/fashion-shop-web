let products = document.querySelectorAll('.product');

products.forEach(function(item) {
    item.onclick = function() {
        window.location.href = "product-detail.php?product-id=" + item.id;
    };
});

