<?php
    require_once('site.php');
    loadHeader();
  echo'
  <script defer src="../js/search_admin.js"></script>">';
?>
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
<?php
    loadFooter();
?>
