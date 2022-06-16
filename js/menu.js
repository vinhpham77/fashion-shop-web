let sp_timkiem = document.querySelector(".sp_timkiem");
let keyword_input = document.getElementById("input1");
function search() {
    keyword = keyword_input.value.trim();
    if (keyword) {
        window.location.href = "products.php?filter=prod_name&value=" + keyword;
    }
}
sp_timkiem.onclick = search;
keyword_input.onkeydown = function(event) {
    if (event.keyCode === 13) {
        search();
    }
}

function dangxuat(){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            window.location.href = "login.php";
       }
    };
    xhttp.open("POST", "function/logout.php", true);
    xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhttp.send('');
}
