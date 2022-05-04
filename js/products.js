let products = document.querySelectorAll('.product');

products.forEach((item, index) => {
	item.addEventListener('click', function() {
		window.location.href = "product-detail.php?product-id=" + products[index].id;
	})
})