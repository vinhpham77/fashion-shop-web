<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./fontawesome/css/all.min.css">
        <link rel="stylesheet" href="../style/styles.css">
        <link rel="stylesheet" href="../style/index.css">
        <title>Admin</title>
    </head>
    <div class="main mainsp">
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
        <table class="table">
            <div>
                <tr class="text">
                    <td class="text-info">Mã danh mục</td>
                    <td class="text-info">Tên danh mục</td>
                    <td class="text-info">Mã sản phẩm</td>
                    <td class="text-info">Tên sản phẩm</td>
                    <td class="text-info">Đơn giá</td>
                    <td class="text-info">Giảm giá</td>
                    <td class="text-info">Số lượng</td>
                    <td class="text-info">Ngày nhập</td>

                </tr>
                <?php   
                    require_once ('../connect_db.php');                                
                    $sql="SELECT `prod_id`,`product`.`cate_id`,`prod_name`, `price`,`discount`,`quantity`,`date_added`,`category`.`cate_name`FROM `product` , `category`WHERE `product`.`cate_id`=`category`.`cate_id`;";
                    $query=mysqli_query($conn,$sql);
                    while($row=mysqli_fetch_array($query)){                     
                        echo ' 
                        <tr class="text text1 text2">
                            <td class="text-info">'.$row['cate_id'].'</td>
                            <td class="text-info">'.$row['cate_name'].'</td>
                            <td class="text-info">'.$row['prod_id'].'</td>
                            <td class="text-info">'.$row['prod_name'].'</td>
                            <td class="text-info">'.$row['price'].'</td>
                            <td class="text-info">'.$row['discount'].'</td>
                            <td class="text-info">'.$row['quantity'].'</td>
                            <td class="text-info">'.$row['date_added'].'</td>
                        </tr>'; 
                    }
                ?>
                <tr class="text">
                    <td class="text-info">Nguyễn Thành Quốc</td>
                    <td class="text-info">Hoài Hảo ,Hoài Nhơn ,Bình Định</td>
                    <td class="text-info">thanhquocnguyen1907@gmail.com</td>
                    <td class="text-info">0394778003</td>
                    <td class="text-info">Hoài Hảo ,Hoài Nhơn ,Bình Định</td>
                </tr>

                <tr class="text">
                    <td class="text-info">Nguyễn Thị Ngô</td>
                    <td class="text-info">Nha Trang ,Quang ,Quy Nhơn</td>
                    <td class="text-info">ngonguyenthi1907@gmail.com</td>
                    <td class="text-info">092323291</td>
                    <td class="text-info">Thị Nại ,Nhơn Hòa, Bình Định</td>
                </tr>
                

            </div>                             
        </table>   
    </div>
<!-- kmdksdsd -->
<div id="footer">

</div>
</div>
<div class="container0">
    <div class="container1">

    </div>
</div>