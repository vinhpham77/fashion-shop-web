<?php
require('../connect_db.php');
$GLOBALS['conn']=$conn;
function tim_khachhang($key){
    $sql="SELECT * FROM `account` WHERE account_type = '0' AND `username` like '%$key%'OR `fullname` like '%$key%' OR `current_address` like N'%$key%' OR `email` like '%$key%' OR `phone_number` like '%$key%' ";
    $query= mysqli_query($GLOBALS['conn'],$sql);
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

function tim_magiamgia($key){
    $sql="SELECT * FROM `promotion` WHERE `promo_code` like '%$key%' OR `promo_name`like '%$key%' OR `promo_price` like '%$key%'  OR `calc_unit` like '%$key%'";
    $query= mysqli_query($GLOBALS['conn'],$sql);
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
    $sql="SELECT `promotion`.`promo_code`,`promotion`.`calc_unit`,`promotion`.`promo_price`, `prod_id`,`product`.`cate_id`,`prod_name`, `price`,`quantity`,`date_added`,`category`.`cate_name`FROM `product` JOIN `category` on `product`.`cate_id`=`category`.`cate_id` LEFT JOIN `promotion`  on `product`.`promo_code`=`promotion`.`promo_code`
    where `promotion`.`promo_code` like '%$key%' OR `promotion`.`promo_price` like '%$key%' OR `prod_name` like N'%$key%' OR `price` like '%$key%' OR `quantity` like '%$key%' OR `date_added` like '%$key%' OR `category`.`cate_name` like '%$key%'";
    $query= mysqli_query($GLOBALS['conn'],$sql);
    
    while($row=mysqli_fetch_array($query)){
        $directory = "../images/products/".$row['prod_id'];
        $hinh=array_diff(scandir($directory), array('..', '.'));
        echo '
        
<tr class="text text2"> 
    <td class="text-info">'.$row['cate_name'].'</td>
    <td class="text-info">'.$row['prod_name'].'</td>
    <td class="text-info"><img class="hinhanh_sp" src="'.$directory.'/'.$hinh[2].'" alt=""></td>
    <td class="text-info">'.$row['price'].'VNĐ</td>
    <td class="text-info">'.$row['promo_code'].'</td>
    <td class="text-info">'.$row['promo_price'].'</td>
    <td class="text-info">'.$row['quantity'].'</td>
    <td class="text-info">'.$row['date_added'].'</td>
</tr>';
    }
}

