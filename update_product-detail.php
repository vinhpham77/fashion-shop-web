<?php
require_once("connect_db.php");
$kh= $_COOKIE['username'];
$pro_id=$_POST['pro_id'];
$pro_size=$_POST['size'];
if(check($pro_id,$pro_size,$conn)==1)
        update_number($kh, $conn); 
else
        insert_pro($kh, $conn); 

function update_number($kh, $conn){
    $sql="SELECT quantity from cart where username='".$kh."' AND prod_id='".$_POST['pro_id']."' AND size='".$_POST['size']."' ";
    $query=mysqli_query($conn,$sql);
    $row=mysqli_fetch_array($query);
    $soluongcu=$row['quantity'];
    $sql1="UPDATE cart SET quantity='".$_POST['quantity']+$soluongcu."' where username='".$kh."' AND prod_id='".$_POST['pro_id']."' AND size='".$_POST['size']."' "  ;
    mysqli_query($conn,$sql1);
}
function insert_pro($kh,$conn){
    $sql1="INSERT INTO `cart`(`username`, `prod_id`, `size`, `quantity`) VALUES ('".$kh."','".$_POST['pro_id']."','".$_POST['size']."','".$_POST['quantity']."')";
    $query1=mysqli_query($conn,$sql1);
}
function check($pro_id,$pro_size,$conn){
    $sql1="SELECT  prod_id  FROM cart WHERE prod_id='".$_POST['pro_id']."' AND size='".$_POST['size']."' ";
    $query=mysqli_query($conn,$sql1);
    if($soluong=mysqli_num_rows($query)>0)
        return 1;
    else
        return 0;
}