<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../fontawesome/css/all.min.css">
        <link rel="stylesheet" href="../style/styles.css">
        <link rel="stylesheet" href="../style/index.css">
        <script async src="../js/hoadon_admin.js"></script>
        <title>Admin</title>
    </head>
    <div id="main">
        <div id="header">
            <ul id="nav">
                    <li><a href="index_admin.php">Admin</a></li>
                    <li><a href="khachhang.php">Khách hàng</a></li>
                    <li><a href="sanpham.php">Sản phẩm</a></li>
                    <li><a href="hoadon.php">Hóa đơn</a></li>
                        <li class="canhan">
                            <a href="#">
                                Cá nhân
                                <i class="nav-arow-down ti-angle-down"></i>
                            </a>
                            <ul class="subnav">
                                <li><a href="#">Đăng xuất</a></li>
                                <li><a href="#">Đổi mật khẩu</a></li>
                            </ul>
                        </li>
            </ul>
                <!--search-->
                <div class="search-btn">
                    <i class="search-icon ti-search"></i>
                </div>
            
        </div>
        <div class="container">
                <div class="div-text">
                    <p class="text-khachhang">Danh sách hóa đơn</p>
                </div>
                <div class="haithang">
                    <div class="div-table">
                        <table class="table">
                            <div>
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
                                ?>
                            </div>                                 
                        </table>   
                    </div>
              
            <div class="container-cthd">
                <p class="text-cthd"> Chi Tiết hóa đơn</p>
                <div class="heder-cthd">
                    
                    
                </div>
            </div>
            </div>
        </div>
        <!---->
        <!---->

    </div>
        

