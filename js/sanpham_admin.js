btn_check=document.querySelectorAll('checkbox');
console.log(btn_check);
btn_check.forEach((item,index)=> {
    item.onlick()=function(e){
        if (this.checked){
            alert("Bạn vừa thích freetuts.net");
        }
        else{
            alert("Bạn vừa bỏ thích freetuts.net");
        }
    };
    })