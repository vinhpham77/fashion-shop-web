 dong=document.querySelectorAll(".text2");
 header=document.querySelector('.heder-cthd');
 table = document.querySelector('.table-3');
dong.forEach((item,index)=>{
  item.addEventListener("click",function(){
    id=item.getAttribute('id_order');
    lay_id(id);
  })
})
function lay_id(id){
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
      text=this.responseText;
      console.log(text);
      header.innerHTML=text;
     }
  };
  xhttp.open("POST", "./bang_hoadon.php", true);
  xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xhttp.send('prod_id='+id);
}