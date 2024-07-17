<?php  
// fungsi untuk pengecekan tampilan form
// jika form add data yang dipilih
if ($_GET['form']=='add') { ?> 
  <!-- tampilan form add data -->
	<!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="fa fa-edit icon-title"></i> Input Barang
    </h1>
    <ol class="breadcrumb">
      <li><a href="?module=beranda"><i class="fa fa-home"></i> Beranda </a></li>
      <li><a href="?module=barang"> Barang </a></li>
      <li class="active"> Tambah </li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="box box-primary">
          <!-- form start -->
          <form role="form" class="form-horizontal" action="modules/barang/proses.php?act=insert" method="POST">
            <div class="box-body">
              <?php  
              // fungsi untuk membuat id transaksi
              $query_id = mysqli_query($mysqli, "SELECT RIGHT(kode_barang,6) as kode FROM tb_barang
                                                ORDER BY kode_barang DESC LIMIT 1")
                                                or die('Ada kesalahan pada query tampil kode_barang : '.mysqli_error($mysqli));

              $count = mysqli_num_rows($query_id);

              if ($count <> 0) {
                  // mengambil data kode_barang
                  $data_id = mysqli_fetch_assoc($query_id);
                  $kode    = $data_id['kode'];
              } else {
                  $kode = 1;
              }

              // buat kode_barang
              $buat_id   = str_pad($kode, 6, "0", STR_PAD_LEFT);
              $kode_barang = "B$buat_id";
              ?>

              <div class="form-group">
                <label class="col-sm-2 control-label">Kode Barang</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" name="kode_barang" value="<?php echo $kode_barang; ?>" required>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label">Nama Barang</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" name="nama_barang" autocomplete="off" required>
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label">Type Barang</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" name="type_barang" autocomplete="off" required>
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label">Jenis</label>
                <div class="col-sm-5">
                  <input list="jenisnya_barang" class="chosen form-control" type="search" id="jenis" name="jenis" autocomplete="off" required>
                  <datalist id="jenisnya_barang">
                    <?php
                      $query_jenis = mysqli_query($mysqli, "SELECT jenis FROM tb_barang GROUP BY jenis ORDER BY jenis ASC")
                                                            or die('Ada kesalahan pada query tampil barang: '.mysqli_error($mysqli));
                      while ($data_jenis = mysqli_fetch_assoc($query_jenis)) {
                        echo "<option> $data_jenis[jenis] </option>";
                      }
                    ?>
                  </datalist>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label">Stok Minimum</label>
                <div class="col-sm-5">
                  <div class="input-group">
                    <span class="input-group-addon">Min.</span>
                    <input type="text" class="form-control" id="stok_min" name="stok_min" autocomplete="off" onKeyPress="return goodchars(event,'0123456789',this)" required>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label">Stok Maksimum</label>
                <div class="col-sm-5">
                  <div class="input-group">
                    <span class="input-group-addon">Max.</span>
                    <input type="text" class="form-control" id="stok_max" name="stok_max" autocomplete="off" onKeyPress="return goodchars(event,'0123456789',this)" required>
                  </div>
                </div>
              </div>



              <div class="form-group">
                <label class="col-sm-2 control-label">Satuan</label>
                <div class="col-sm-5">
                  <select class="chosen-select form-control" name="satuan" data-placeholder="-- Pilih --" autocomplete="off" required>
                    <option value=""></option>
                    <option value="Gantung">Gantung</option>
                    <option value="Pcs">Pcs</option>
                    <option value="Dos">Dos</option>
                    <option value="Bungkus">Bungkus</option>
                  </select>
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label">Catatan</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" name="catatan" autocomplete="off">
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label">Harga Beli</label>
                <div class="col-sm-5">
                  <div class="input-group">
                    <span class="input-group-addon">Rp.</span>
                    <input type="text" class="form-control" id="harga_beli" name="harga_beli" autocomplete="off" onKeyPress="return goodchars(event,'0123456789',this)" required>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label">Harga Jual</label>
                <div class="col-sm-5">
                  <div class="input-group">
                    <span class="input-group-addon">Rp.</span>
                    <input type="text" class="form-control" id="harga_jual" name="harga_jual" autocomplete="off" onKeyPress="return goodchars(event,'0123456789',this)" required>
                  </div>
                </div>
              </div>

            </div><!-- /.box body -->

            <div class="box-footer">
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <input type="submit" class="btn btn-primary btn-submit" name="simpan" value="Simpan">
                  <a href="?module=barang" class="btn btn-default btn-reset">Batal</a>
                </div>
              </div>
            </div><!-- /.box footer -->
          </form>
        </div><!-- /.box -->
      </div><!--/.col -->
    </div>   <!-- /.row -->
  </section><!-- /.content -->
<?php
}
// jika form edit data yang dipilih
// isset : cek data ada / tidak
elseif ($_GET['form']=='edit') { 
  if (isset($_GET['id'])) {
      // fungsi query untuk menampilkan data dari barang
      $query = mysqli_query($mysqli, "SELECT kode_barang,nama_barang,type_barang,jenis,stok_min,stok_max,satuan,harga_beli,harga_jual,catatan FROM tb_barang WHERE kode_barang='$_GET[id]'") 
                                      or die('Ada kesalahan pada query tampil Data barang : '.mysqli_error($mysqli));
      $data  = mysqli_fetch_assoc($query);
    }
?>
  <!-- tampilan form edit data -->
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="fa fa-edit icon-title"></i> Ubah Barang
    </h1>
    <ol class="breadcrumb">
      <li><a href="?module=beranda"><i class="fa fa-home"></i> Beranda </a></li>
      <li><a href="?module=barang"> Barang </a></li>
      <li class="active"> Ubah </li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="box box-primary">
          <!-- form start -->
          <form role="form" class="form-horizontal" action="modules/barang/proses.php?act=update" method="POST">
            <div class="box-body">
              
              <div class="form-group">
                <label class="col-sm-2 control-label">Kode Barang</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" name="kode_barang" value="<?php echo $data['kode_barang']; ?>" readonly required>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label">Nama Barang</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" name="nama_barang" autocomplete="off" value="<?php echo $data['nama_barang']; ?>" required>
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label">Type Barang</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" name="type_barang" value="<?php echo $data['type_barang']; ?>" autocomplete="off" >
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label">Jenis</label>
                <div class="col-sm-5">
                  <input list="jenisnya_barang" class="chosen form-control" id="jenis" name="jenis" value="<?php echo $data['jenis']; ?>" autocomplete="off" required>
                  <datalist id="jenisnya_barang">
                    <?php
                      $query_jenis = mysqli_query($mysqli, "SELECT jenis FROM tb_barang GROUP BY jenis ORDER BY jenis ASC")
                                                            or die('Ada kesalahan pada query tampil barang: '.mysqli_error($mysqli));
                      while ($data_jenis = mysqli_fetch_assoc($query_jenis)) {
                        echo "<option> $data_jenis[jenis] </option>";
                      }
                    ?>
                  </datalist>
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label">Stok Minimum</label>
                <div class="col-sm-5">
                  <div class="input-group">
                    <span class="input-group-addon">Min.</span>
                    <input type="text" class="form-control" id="stok_min" name="stok_min" autocomplete="off" onKeyPress="return goodchars(event,'0123456789',this)" value="<?php echo format_rupiah($data['stok_min']); ?>" required>
                  </div>
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label">Stok Maksimum</label>
                <div class="col-sm-5">
                  <div class="input-group">
                    <span class="input-group-addon">Max.</span>
                    <input type="text" class="form-control" id="stok_max" name="stok_max" autocomplete="off" onKeyPress="return goodchars(event,'0123456789',this)" value="<?php echo format_rupiah($data['stok_max']); ?>" required>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label">Satuan</label>
                <div class="col-sm-5">
                  <select class="chosen-select form-control" name="satuan" data-placeholder="-- Pilih --" autocomplete="off" required>
                    <option value="<?php echo $data['satuan']; ?>"><?php echo $data['satuan']; ?></option>
                    <option value="Buah">Buah</option>
                    <option value="Pcs">Pcs</option>
                  </select>
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-sm-2 control-label">Catatan</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" name="catatan" value="<?php echo $data['catatan']; ?>" autocomplete="off">
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label">Harga Beli</label>
                <div class="col-sm-5">
                  <div class="input-group">
                    <span class="input-group-addon">Rp.</span>
                    <input type="text" class="form-control" id="harga_beli" name="harga_beli" autocomplete="off" onKeyPress="return goodchars(event,'0123456789',this)" value="<?php echo format_rupiah($data['harga_beli']); ?>" required>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label">Harga Jual</label>
                <div class="col-sm-5">
                  <div class="input-group">
                    <span class="input-group-addon">Rp.</span>
                    <input type="text" class="form-control" id="harga_jual" name="harga_jual" autocomplete="off" onKeyPress="return goodchars(event,'0123456789',this)" value="<?php echo format_rupiah($data['harga_jual']); ?>" required>
                  </div>
                </div>
              </div>

            </div><!-- /.box body -->

            <div class="box-footer">
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <input type="submit" class="btn btn-primary btn-submit" name="simpan" value="Simpan">
                  <a href="?module=barang" class="btn btn-default btn-reset">Batal</a>
                </div>
              </div>
            </div><!-- /.box footer -->
          </form>
        </div><!-- /.box -->
      </div><!--/.col -->
    </div>   <!-- /.row -->
  </section><!-- /.content -->
<?php
}
?>