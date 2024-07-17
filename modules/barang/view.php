<!-- Content Header (Page header) -->
<section class="content-header">

  <h1>
    <i class="fa fa-folder-o icon-title pull-left"></i> Data Barang

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
          <li><a href="?module=barang">Semua Jenis</a></li>
        <?php
          $query_jenis = mysqli_query($mysqli, "SELECT jenis FROM v_barang_jenis ORDER BY jenis ASC")
                                                or die('Ada kesalahan pada query tampil barang: '.mysqli_error($mysqli));
          while ($data_jenis = mysqli_fetch_assoc($query_jenis)) {
            //echo"<option value=\"$data_jenis[jenis]\"> $data_jenis[jenis]</option>";
            echo "<li><a href=\"?module=barang&jenis=$data_jenis[jenis]\">$data_jenis[jenis]</a></li>";
          }
        ?>
        </ul>
      </span>
      
      
      <a class="btn btn-primary btn-social" href="?module=form_barang&form=add" title="Tambah Data" data-toggle="tooltip">
        <i class="fa fa-plus"></i> Tambah
      </a>
      
    </div>
    
  </h1>

</section>


<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-md-12">

    <?php  
    // fungsi untuk menampilkan pesan
    // jika alert = "" (kosong)
    // tampilkan pesan "" (kosong)
    if (empty($_GET['alert'])) {
      echo "";
    } 
    // jika alert = 1
    // tampilkan pesan Sukses "Data barang baru berhasil disimpan"
    elseif ($_GET['alert'] == 1) {
      echo "<div class='alert alert-success alert-dismissable'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4>  <i class='icon fa fa-check-circle'></i> Sukses!</h4>
              Data barang baru berhasil disimpan.
            </div>";
    }
    // jika alert = 2
    // tampilkan pesan Sukses "Data barang berhasil diubah"
    elseif ($_GET['alert'] == 2) {
      echo "<div class='alert alert-success alert-dismissable'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4>  <i class='icon fa fa-check-circle'></i> Sukses!</h4>
              Data barang berhasil diubah.
            </div>";
    }
    // jika alert = 3
    // tampilkan pesan Sukses "Data barang berhasil dinonaktifkan"
    elseif ($_GET['alert'] == 3) {
      echo "<div class='alert alert-success alert-dismissable'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4>  <i class='icon fa fa-check-circle'></i> Sukses!</h4>
              Data barang berhasil dinonaktifkan.
            </div>";
    }
    // jika alert = 4
    // tampilkan pesan Sukses "Data barang berhasil diaktifkan"
    elseif ($_GET['alert'] == 4) {
      echo "<div class='alert alert-success alert-dismissable'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4>  <i class='icon fa fa-check-circle'></i> Sukses!</h4>
              Data barang berhasil diaktifkan.
            </div>";
    }
    
    ?>
      <?php 
      //Fungsi untuk menampilkan alert/notifikasi ketika stok barang berada di level stok minimum
      $datastokbarang = mysqli_query($mysqli,"SELECT * FROM tb_barang WHERE stok < 5");

      while($data = mysqli_fetch_array($datastokbarang)) {
        $barang = $data['nama_barang'];
      ?>
   
      <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Perhatian!</strong> Stok barang <?= $barang; ?> telah berada di level minimum.
      </div>

      <?php
       }
      ?>

      <?php 
      // Fungsi untuk menampilkan alert/notifikasi ketika stok barang berada di level stok habis
      $datastokbaranghabis = mysqli_query($mysqli,"SELECT * FROM tb_barang WHERE stok = 0");

      while($data = mysqli_fetch_array($datastokbaranghabis)) {
        $stokhabis = $data['nama_barang'];
      
      ?>

      <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Perhatian!</strong> Stok barang <?= $barang; ?> telah habis.
      </div>

      <?php 
      }
      ?>

      <div class="box box-primary">
        <div class="box-body table-responsive">
          <!-- tampilan tabel barang -->
          <table id="dataTables1" class="table table-bordered table-striped table-hover">
            <!-- tampilan tabel header -->
            <thead>
              <tr>
                <th class="center">No.</th>
                <th class="center">Kode Barang</th>
                <th class="center">Nama Barang</th>
                <th class="center">Type</th>
                <th class="center">Jenis</th>
                <th class="center">Min</th>
                <th class="center">Max</th>
                <th class="center">Stok</th>
                <th class="center">Satuan</th>
                <th class="center">Harga Beli</th>
                <th class="center">Harga Jual</th>
                <th class="center">Aksi</th>
              </tr>
            </thead>
            <!-- tampilan tabel body -->
            <tbody>
            <?php  
            $no = 1;
            // fungsi query untuk menampilkan data dari tabel barang
            
            if (isset($_GET['jenis'])) {
                $s_jenis  = mysqli_real_escape_string($mysqli, trim($_GET['jenis']));
                $query = mysqli_query($mysqli, "SELECT kode_barang,nama_barang,type_barang,jenis,stok_max,stok_min,satuan,stok,aktif,harga_beli,harga_jual FROM tb_barang WHERE jenis='$s_jenis' ORDER BY kode_barang DESC")
                                                or die('Ada kesalahan pada query tampil Data Barang: '.mysqli_error($mysqli));
            } else {
                $query = mysqli_query($mysqli, "SELECT kode_barang,nama_barang,type_barang,jenis,stok_max,stok_min,satuan,stok,aktif,harga_beli,harga_jual FROM tb_barang ORDER BY kode_barang DESC")
                                                or die('Ada kesalahan pada query tampil Data Barang: '.mysqli_error($mysqli));

            }

            // tampilkan data
            while ($data = mysqli_fetch_assoc($query)) { 
              $stokmax = format_rupiah($data['stok_max']);
              $stokmin = format_rupiah($data['stok_min']);
              // menampilkan isi tabel dari database ke tabel di aplikasi
              echo "<tr>
                      <td width='30' class='center'>$no</td>
                      <td width='80' class='center'>$data[kode_barang]</td>
                      <td width='180'>$data[nama_barang]</td>
                      <td width='80'>$data[type_barang]</td>
                      <td width='80'>$data[jenis]</td>
                      <td width='30' align='right'>$stokmin</td>
                      <td width='30' align='right'>$stokmax</td>
                      <td width='80' align='right'>$data[stok]</td>
                      <td width='80' class='center'>$data[satuan]</td>
                      <td width='80' class='center'>$data[harga_beli]</td>
                      <td width='80' class='center'>$data[harga_jual]</td>
                      <td class='center' width='80' nowrap>
                        <div>
                          <a data-toggle='tooltip' data-placement='top' title='Ubah' style='margin-right:5px' class='btn btn-primary btn-sm' href='?module=form_barang&form=edit&id=$data[kode_barang]'>
                              <i style='color:#fff' class='glyphicon glyphicon-edit'></i>
                          </a>";
            
            
            
            if ($data['aktif']=='1') { ?>
                          <a data-toggle="tooltip" data-placement="top" title="Non Aktifkan" class="btn btn-warning btn-sm" href="modules/barang/proses.php?act=off&id=<?php echo $data['kode_barang'];?>" onclick="return confirm('Anda yakin ingin menonaktifkan barang <?php echo $data['nama_barang']; ?> ?');">
                              <i style="color:#fff" class="glyphicon glyphicon-trash"></i>
                          </a>
            <?php
                          } 
                          else { ?>
                          
                          <a data-toggle="tooltip" data-placement="top" title="Aktifkan" class="btn btn-danger btn-sm" href="modules/barang/proses.php?act=on&id=<?php echo $data['kode_barang'];?>" onclick="return confirm('Anda yakin ingin mengaktifkan barang <?php echo $data['nama_barang']; ?> ?');">
                              <i style="color:#fff" class="glyphicon glyphicon-off"></i>
                          </a>
                          
            <?php
                          }
              echo "    </div>
                      </td>
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