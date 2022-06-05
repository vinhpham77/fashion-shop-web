let sp_timkiem = document.querySelector(".sp_timkiem");
let keyword_input = document.getElementById("input1");

function search() {
    keyword = keyword_input.value.trim();
    if (keyword) {
        window.location.href = "category.php?prod_name=" + keyword;
    }
}

sp_timkiem.onclick = search;
keyword_input.onkeydown = function(event) {
    if (event.keyCode === 13) {
        search();
    }
}

// let footer = document.querySelector('footer');
// let prevSibFooter = footer.previousElementSibling;
// console.log(prevSibFooter);
// prevSibFooter.style.marginBottom = '40px';
