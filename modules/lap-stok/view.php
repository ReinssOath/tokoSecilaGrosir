<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
    <i class="fa fa-file-text-o icon-title"></i> Laporan Stok Barang

    <div class="pull-right">
    
      <span class="dropdown">
        <button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">
        <?php
          if (isset($_GET['jenis'])) {
              $s_jenis  = mysqli_real_escape_string($mysqli, trim($_GET['jenis']));
              echo $s_jenis;
          } else {
              echo "Semua Jenis";
          }
        ?>
        <span class="caret"></span></button>
        <ul class="dropdown-menu">
          <li><a href="?module=lap_stok">Semua Jenis</a></li>
        <?php
          $query_jenis = mysqli_query($mysqli, "SELECT jenis FROM v_barang_jenis ORDER BY jenis ASC")
                                                or die('Ada kesalahan pada query tampil barang: '.mysqli_error($mysqli));
          while ($data_jenis = mysqli_fetch_assoc($query_jenis)) {
            //echo"<option value=\"$data_jenis[jenis]\"> $data_jenis[jenis]</option>";
            echo "<li><a href=\"?module=lap_stok&jenis=$data_jenis[jenis]\">$data_jenis[jenis]</a></li>";
          }
        ?>
        </ul>
      </span>
      <span class="">&nbsp;</span>

        <?php
          if (isset($_GET['jenis'])) {
              $s_jenis  = mysqli_real_escape_string($mysqli, trim($_GET['jenis']));
              ?>
              <a class="btn btn-primary btn-social pull-right" href="modules/lap-stok/cetak.php?jenis=<?php echo $s_jenis; ?>" target="_blank">
                <i class="fa fa-print"></i> Cetak
              </a>
              <?php
          } else {
              ?>
            <a class="btn btn-primary btn-social pull-right" href="modules/lap-stok/cetak.php" target="_blank">
              <i class="fa fa-print"></i> Cetak
            </a>
            <?php
          }
        ?>


    
    </div>
  </h1>

</section>

<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box box-primary">
        <div class="box-body">
          <!-- tampilan tabel Barang -->
          <table id="dataTables1" class="table table-bordered table-striped table-hover">
            <!-- tampilan tabel header -->
            <thead>
              <tr>
                <th class="center">No.</th>
                <th class="center">Kode Barang</th>
                <th class="center">Nama Barang</th>
                <th class="center">Jenis</th>
                <th class="center">Stok</th>
                <th class="center">Satuan</th>
              </tr>
            </thead>
            <!-- tampilan tabel body -->
            <tbody>
            <?php  
            $no = 1;
            
            if (isset($_GET['jenis'])) {
                $s_jenis  = mysqli_real_escape_string($mysqli, trim($_GET['jenis']));
                $query = mysqli_query($mysqli, "SELECT kode_barang,nama_barang,type_barang,jenis,stok_max,stok_min,satuan,stok,aktif FROM tb_barang WHERE jenis='$s_jenis' ORDER BY nama_barang ASC")
                                                or die('Ada kesalahan pada query tampil Data Barang: '.mysqli_error($mysqli));
            } else {
                $query = mysqli_query($mysqli, "SELECT kode_barang,nama_barang,type_barang,jenis,stok_max,stok_min,satuan,stok,aktif FROM tb_barang ORDER BY nama_barang ASC")
                                                or die('Ada kesalahan pada query tampil Data Barang: '.mysqli_error($mysqli));

            }
            
            
            
            // fungsi query untuk menampilkan data dari tabel barang
            //$query = mysqli_query($mysqli, "SELECT kode_barang,nama_barang,harga_beli,harga_jual,satuan,stok FROM tb_barang ORDER BY nama_barang ASC")
            //                                or die('Ada kesalahan pada query tampil Data Barang: '.mysqli_error($mysqli));
            $adatype = '';
            // tampilkan data
            while ($data = mysqli_fetch_assoc($query)) { 
              //$harga_beli = format_rupiah($data['harga_beli']);
              //$harga_jual = format_rupiah($data['harga_jual']);
              // menampilkan isi tabel dari database ke tabel di aplikasi
              $adatype = $data['type_barang'];
              $typebarang = ($adatype == '') ? '' : " <tiny>[$adatype]</tiny>" ;
              echo "<tr>
                      <td width='30' class='center'>$no</td>
                      <td width='80' class='center'>$data[kode_barang]</td>
                      <td width='180'>$data[nama_barang]$typebarang</td>
                      <td width='80'>$data[jenis]</td>
                      <td width='80' align='right'>$data[stok]</td>
                      <td width='80' class='center'>$data[satuan]</td>
                    </tr>";
              $no++;
            }
            ?>
            </tbody>
          </table>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!--/.col -->
  </div>   <!-- /.row -->
</section><!-- /.content