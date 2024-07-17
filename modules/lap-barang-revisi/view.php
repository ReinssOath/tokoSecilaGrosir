<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
    <i class="fa fa-file-text-o icon-title"></i> Laporan Revisi Stok Barang
  </h1>
  <ol class="breadcrumb">
    <li><a href="?module=beranda"><i class="fa fa-home"></i> Beranda</a></li>
    <li class="active">Laporan</li>
    <li class="active">Data Revisi Stok</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-md-12">

      <!-- Form Laporan -->
      <div class="box box-primary">
        <!-- form start -->
        <form role="form" class="form-horizontal" method="GET" action="modules/lap-barang-revisi/cetak.php" target="_blank">
          <div class="box-body">

            <div class="form-group">
            
              <label class="col-sm-1">Tanggal</label>
              <div class="col-sm-2">
                <input type="text" class="form-control date-picker" data-date-format="dd-mm-yyyy" name="tgl_awal" autocomplete="off" required>
              </div>

              <label class="col-sm-1">s.d.</label>
              <div class="col-sm-2">
                <input type="text" class="form-control date-picker" data-date-format="dd-mm-yyyy" name="tgl_akhir" autocomplete="off" required>
              </div>
              
              <label class="col-sm-1">Jenis</label>
              <div class="col-sm-2">
                  <select class="chosen-select" name="jenis" data-placeholder="-- Semua Jenis --" autocomplete="off">
                    <option value=""></option>
                    <?php
                      $query_jenis = mysqli_query($mysqli, "SELECT jenis FROM v_barang_jenis ORDER BY jenis ASC")
                                                            or die('Ada kesalahan pada query tampil barang: '.mysqli_error($mysqli));
                      while ($data_jenis = mysqli_fetch_assoc($query_jenis)) {
                        echo"<option value=\"$data_jenis[jenis]\"> $data_jenis[jenis]</option>";
                      }
                    ?>
                  </select>
              </div>
            </div>
          </div>
          
          <div class="box-footer">
            <div class="form-group">
              <div class="col-sm-offset-1 col-sm-11">
                <button type="submit" class="btn btn-primary btn-social btn-submit">
                  <i class="fa fa-print"></i> Cetak
                </button>
              </div>
            </div>
          </div>
        </form>
      </div><!-- /.box -->
    </div><!--/.col -->
  </div>   <!-- /.row -->
</section><!-- /.content -->