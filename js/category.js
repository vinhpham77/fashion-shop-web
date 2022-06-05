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
        console.log('cc');
        current_page.value = item.getAttribute('data-value');
        removeUselessStuff();
        form.submit();
    }
})

let order = document.querySelector('select#order');
let field = document.querySelector('input[name="field"]');
let by = document.querySelector('input[name="by"]');
order.onchange = function() {
    let orderby = order.value.split(' ');
    field.value = orderby[0] ? orderby[0] : '';
    by.value = orderby[1] ? orderby[1] : '';
}

let size = document.querySelector('select#size');
const stuff = [field, by, size];
function removeUselessStuff() {
    stuff.forEach(function(item) {
        if (!item.value) {
            item.name = '';
        }
    })
    if (current_page.value == 1) {
        current_page.name = '';
    }
    return true;
}
