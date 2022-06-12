
                        <?php
                        require_once('connect_db.php');
                        echo '<table class="table-3">
                        <tr class="header-text-cthd">
                        <td class="text-info text-infor1">ID Hóa đơn</td>
                        <td class="text-info text-infor1">Mã sản phẩm</td>
                        <td class="text-info text-infor1">Kích thước</td>
                        <td class="text-info text-infor1">Đơn giá</td>
                        <td class="text-info text-infor1">Số lượng</td>
                    </tr>';
                        $id=$_POST['prod_id']; 
                        update_number($id, $conn);
                            
                        function update_number($id, $conn){
                        $sql1="SELECT `order_id`,`prod_id`,`size`,`price`,`quantity` FROM `order-detail`  where `order-detail`.`order_id`='".$id."'"; 
                        $query1= mysqli_query($conn,$sql1);
                           while($row=mysqli_fetch_array($query1)){                     
                            echo '
                            <tr class="text text1">
                                <td class="text-info">'.$row['order_id'].'</td>
                                <td class="text-info">'.$row['prod_id'].'</td>
                                <td class="text-info">'.$row['size'].'</td>
                                <td class="text-info">'.$row['price'].'</td>
                                <td class="text-info">'.$row['quantity'].'</td>
                            </tr>';
                        }
                        echo '</table>';
                        }
                        ?>
                        