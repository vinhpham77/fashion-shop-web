<?php 
    $host='localhost';
    $namehost='root';
    $passhost='';
    $csdl='6aesn';
    $conn=mysqli_connect($host,$namehost,$passhost,$csdl) or die ("Không thể kết nối Database");
    mysqli_query($conn,"SET NAMES 'UTF8'");
?>	