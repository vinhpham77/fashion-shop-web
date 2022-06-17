<?php
require_once("../connect_db.php");
laysizemax($conn);
function laysizemax($conn){
    $sql1="SELECT ".$_POST['size']." from size where prod_id='".$_POST['prod_id']."'"  ;
    $query= mysqli_query($conn,$sql1);
    $row=mysqli_fetch_array($query);
    echo "$row[0]";

}
?>
