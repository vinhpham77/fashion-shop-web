<?php
    require_once('site.php');
    loadHeader();
?>
<div class="container">
    <div class="div-text">
        <p class="text-khachhang">Danh sách hóa đơn</p>
    </div>
    <div class="haithang">
        <div class="div-table">
            <table class="table">
                <div class="hoaDon">
                    <tr class="text">
                        <td class="text-info text-infor1">ID Hóa đơn</td>
                        <td class="text-info text-infor1">Khách hàng</td>
                        <td class="text-info text-infor1">Số điện thoại</td>
                        <td class="text-info text-infor1">Địa chỉ ship</td>
                        <td class="text-info text-infor1">Số lượng</td>
                        <td class="text-info text-infor1">Tổng tiền</td>
                    </tr>
                    <?php
                        require_once ('../connect_db.php');
                       require_once('process_search.php');  
                       if(isset($_GET['key']))  { 
                       $key=$_GET['key']; 
                       tim_hoadon($key); 
                       }      
                         else
                        {
                        $sql="SELECT `order`.`order_id`,`order`.`username`,`order`.`phone_number`,`order`.`shipping_address`,`quantity` *`price` AS 'tien',SUM('tien') ,SUM(`quantity`) AS 'soluong' FROM `order-detail` ,`order` where `order-detail`.`order_id`=`order`.`order_id` GROUP BY `order-detail`.`order_id`";
                        $query=mysqli_query($conn,$sql);
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
                    ?>
                </div>
            </table>
        </div>
        <div class="container-cthd">
            <p class="text-cthd"> Chi Tiết hóa đơn</p>
            <div class="heder-cthd"></div>
        </div>
    </div>
</div>
<script src="../js/hoadon_admin.js"></script>
<?php
    loadFooter();
?>
