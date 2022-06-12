<?php
require_once ('../connect_db.php');
$GLOBALS['conn']=$conn;

    // if($_POST['U']=='hoadon')
    //     tim_hoadon($key);
    // else
    //     if($_POST['U']=='magiamgia')
    //         tim_magiamia($key);
    //     else
    //         if($_POST['U']=='sanpham')
    //             tim_sanpham($key);

function tim_kh($key){
    $sql="SELECT * FROM `account` WHERE `username` like '.%$key%.'OR `fullname` like '.%$key%.' OR `current_address` like N'.%$key%.' OR `email` like '.%$key%.' OR `phone_number` like '.%$key%.'";
    $query= mysqli_query($conn,$sql);
    while($row=mysqli_fetch_array($query)){
        echo '
    <tr class="text">
        <td class="text-info">'.$row['fullname'].'</td>
        <td class="text-info">'.$row['current_address'].'</td>
        <td class="text-info">'.$row['email'].'</td>
        <td class="text-info">'.$row['phone_number'].'</td>
        <td class="text-info">'.$row['shipping_address'].'</td>
    </tr>';
        }
}
function tim_hoadon($key){
    if(isset($_GET['key'])){
        $key=$_GET['key'];
        $sql="SELECT `order`.`order_id`,`order`.`username`,`order`.`phone_number`,`order`.`shipping_address`
        ,SUM(`quantity` *`price`) AS 'tien',SUM(`quantity`) AS 'soluong'
        FROM `order-detail` ,`order` where `order-detail`.`order_id`=`order`.`order_id`
        AND (`username` like '%$key%' OR `phone_number`like '%$key%'OR `shipping_address` like '%$key%' OR `pay_date` like '%$key%')
        GROUP BY `order-detail`.`order_id` ";
        $query1=mysqli_query($GLOBALS['conn'],$sql);
        while($row=mysqli_fetch_array($query1)){
        echo '
            <tr class="text text1 text2" id_order="'.$row['order_id'].'">
            <td class="text-info">'.$row['order_id'].'</td>
            <td class="text-info">'.$row['username'].'</td>
            <td class="text-info">'.$row['phone_number'].'</td>
            <td class="text-info">'.$row['shipping_address'].'</td>
            <td class="text-info">'.$row['soluong'].'</td>
            <td class="text-info">'.$row['tien'].' VNĐ</td>
            </tr>';
    }
    }
}

function tim_magiamgia($key){
    $sql="SELECT * FROM `promotion` WHERE `promo_code` like '.%$key%.' OR `promo_name`like '.%$key%.'OR `promo_price` like '.%$key%.'";
    $query= mysqli_query($conn,$sql);
    while($row=mysqli_fetch_array($query)){
        echo '
        <tr class="text" promo_id='.$row['promo_code'].'>
        <td class="text-info">'.$row['promo_code'].'</td>
        <td class="text-info">'.$row['promo_name'].'</td>
        <td class="text-info">'.$row['promo_price'].'</td>
        <td class="text-info">'.$row['calc_unit'].'</td>
        <td class="text-info"><input type="button" value="x" class="close-x btn-mgg-delete" onclick="xoamgg(this)"></td>
    </tr>';
        }
}
function tim_sanpham($key){
    $sql="SELECT * FROM `order` WHERE `username` like '.%$key%.' OR `phone_number`like '.%$key%.'OR `shipping_address` like '.%$key%.' OR `pay_date` like '.%$key%.' OR `email` like '.%$key%.'";
   $query= mysqli_query($conn,$sql);
   while($row=mysqli_fetch_array($query)){
    echo '
    <tr class="text text1 text2" id_order="'.$row['order_id'].'">
    <td class="text-info">'.$row['order_id'].'</td>
    <td class="text-info">'.$row['username'].'</td>
    <td class="text-info">'.$row['phone_number'].'</td>
    <td class="text-info">'.$row['shipping_address'].'</td>
    <td class="text-info">'.$row['soluong'].'</td>
    <td class="text-info">'.$row['tien'].' VNĐ</td>
    </tr>';
}
}

