<?php
require_once 'site.php';
loadHeader();
?>
<div class="container">
    <div class="div-text">
        <p class="text-title">Thông tin CODE -GIẢM GIÁ</p>
        <div class="div-btn-mgg">
            <button class="btn-mgg btn-mgg-insert">Thêm</button>
        </div>
    </div>

    <table class="table tbale_mgg">
        <tr class="text">
            <td class="text-info text-infor1">CODE</td>
            <td class="text-info text-infor1">Tên mã</td>
            <td class="text-info text-infor1">Số tiền giảm</td>
            <td class="text-info text-infor1">Xoá</td>
        </tr>
        <?php
function hienthi() {
	require_once '../connect_db.php';
	require_once 'function/process_search.php';
	if (isset($_GET['key'])) {
		$key = $_GET['key'];
		tim_magiamgia($key);
	} else {
		$sql = "SELECT *FROM promotion";
		$query = mysqli_query($conn, $sql);
		while ($row = mysqli_fetch_array($query)) {
			load_promo($row);
		}
	}
}
hienthi();
?>
    </table>
<!---bang insert-->
    <div class="div-insert-mgg">
        <div class="div-delete-0 table_thongbao">
            <td><div class="div-button-close"><i class="fa-solid fa-xmark"></i></div></td>
            <table class="table_mgg">
                <td>
                    <label class ="lb-insert" for="input_ma_code">Mã CODE</label>
                    <input type="text" id="input_ma_code" class="input_name" name="macode"  placeholder="BDJW88">
                </td>
                <td>
                    <label class ="lb-insert" for="input_ten_code">Tên mã</label>
                    <input type="text" id="input_ten_code" class="input_insert" name="tenma" placeholder="Quocdz">
                </td>
                <td>
                    <label class ="lb-insert" for="input_tiengiam">Số tiền giảm</label>
                    <input type="text" id="input_tiengiam" class="input_tiengiam" name="tiengiam" placeholder="8">
                </td>
                <td>
                    <label class ="lb-insert" for="intput_dvt">Đơn vị tính</label>
                    <input type="text" id="input_dvt" class="input_dvt" name="donvitinh" placeholder="0-đồng ,1-%">
                </td>
                <td><div class="div-button-them"><button class="btn_them_insert">Thêm</button></div></td>
            </table>
        </div>

    <!---bang  xoa-->
        <div class="div-delete div-delete-1 table_thongbao">
            <div class="thongbao">
                <p class="text-thongbao"> Bạn có chắc chắn muốn xóa không?</p>
            </div>
            <div class="btn-message-delete">
                <div class="btn-message btn-mesage-agree">Đồng ý</div>
                <div class="btn-message btn-mesage-cancel">Hủy</div>
            </div>
        </div>

    <!---bang  xoahet-->
        <div class="div-delete div-delete-2 table_thongbao">
          <div class="thongbao">
              <p class="text-thongbao"> Bạn có chắc chắn muốn xóa hết không?</p>
          </div>
          <div class="btn-message-delete">
                <div class="btn-message btn-mesage-agree">Đồng ý</div>
                <div class="btn-message btn-mesage-cancel">Hủy</div>
          </div>
        </div>

    <!---bang sua-->
        <div class="div-delete div-delete-3 table_thongbao">
          <div class="thongbao">
              <p class="text-thongbao"> Bạn có chắc chắn muốn sửa không?</p>
          </div>
          <div class="btn-message-delete">
                <div class="btn-message btn-mesage-agree">Oke</div>
                <div class="btn-message btn-mesage-cancel">Hủy</div>
          </div>
        </div>
    <!---bang thong bao them thành cong-->
        <div class="div-delete themthanhcong table_thongbao">
          <div class="thongbao">
              <p class="text-thongbao"> Bạn đã thêm thành công</p>
          </div>
        </div>
    </div>
</div>
<script src="js/magiamgia_admin.js"></script>
<?php
loadFooter();
?>
