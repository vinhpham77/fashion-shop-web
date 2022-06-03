<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../fontawesome/css/all.min.css">
        <link rel="stylesheet" href="../style/styles.css">
        <link rel="stylesheet" href="../style/index.css">
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
                   <div class="div-text"><p class="text-khachhang">Thông tin khách hàng</p></div> 
                
        <table class="table">
        <div>
            <div class="div-text1">
                 <tr class="text">
                    <td class="text-info text-infor1">Full Name</td>
                    <td class="text-info text-infor1">Address</td>
                    <td class="text-info text-infor1">Email</td>
                    <td class="text-info text-infor1">Phone Number</td>
                    <td class="text-info text-infor1">Shipping address</td>
                </tr>
            </div>
               
                <?php   
                      require_once ('../connect_db.php');     
                      $sql="SELECT *FROM account";
                      $query=mysqli_query($conn,$sql);
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

                ?>
            </div>                                 
        </table>   
    </div>
<!-- kmdksdsd -->
<div id="footer">

</div>
</div>
    

