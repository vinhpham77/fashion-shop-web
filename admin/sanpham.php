<?php
    require_once('site.php');
    loadHeader();
?>
<div class="container">
    <div class="header-sp">
        <p class="header-text-sp">Danh sách sản phẩm</p>
    </div>

    <table class="table table_sp">
        <div>
            <tr class="text">
                <td class="text-info">Mã danh mục</td>
                <td class="text-info">Tên danh mục</td>
                <td class="text-info">Mã sản phẩm</td>
                <td class="text-info">Tên sản phẩm</td>
                <td class="text-info">Hình ảnh</td>
                <td class="text-info">Đơn giá</td>
                <td class="text-info">Mã giảm giá</td>
                <td class="text-info">Số tiền được giảm</td>
                <td class="text-info">Số lượng</td>
                <td class="text-info">Ngày nhập</td>
            </tr>
            <?php
                require_once ('../connect_db.php');
                $sql="SELECT `promotion`.`promo_code`,`promotion`.`promo_price`, `prod_id`,`product`.`cate_id`,`prod_name`, `price`,`quantity`,`date_added`,`category`.`cate_name`FROM `product` JOIN `category` on `product`.`cate_id`=`category`.`cate_id` LEFT JOIN `promotion`  on `product`.`promo_code`=`promotion`.`promo_code`";
                $query=mysqli_query($conn,$sql);

                while($row=mysqli_fetch_array($query)){
                    $directory = "../images/products/".$row['prod_id'];
					$hinh=array_diff(scandir($directory), array('..', '.'));
                    echo '
            <tr class="text text2">
                <td class="text-info">'.$row['cate_id'].'</td>
                <td class="text-info">'.$row['cate_name'].'</td>
                <td class="text-info">'.$row['prod_id'].'</td>
                <td class="text-info">'.$row['prod_name'].'</td>
                <td class="text-info"><img class="hinhanh_sp" src="'.$directory.'/'.$hinh[2].'" alt=""></td>
                <td class="text-info">'.$row['price'].'</td>
                <td class="text-info">'.$row['promo_code'].'</td>
                <td class="text-info">'.$row['promo_price'].'</td>
                <td class="text-info">'.$row['quantity'].'</td>
                <td class="text-info">'.$row['date_added'].'</td>
            </tr>';
                }
            ?>
        </div>
    </table>
</div>
<script src="../js/sanpham_admin.js"></script>
<?php
    loadFooter();
?>
<div class="container0">
    <div class="container1">

    </div>
</div>
