<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Stok Gudang</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="Aplikasi Persediaan Barang">
    
    <!-- favicon -->
    <link rel="shortcut icon" href="assets/img/logo.png" />

    <!-- Bootstrap 3.3.2 -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />    
    <!-- FontAwesome 4.3.0 -->
    <link href="assets/plugins/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" />  
    <!-- DATA TABLES -->
    <link href="assets/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    <!-- Datepicker -->
    <link href="assets/plugins/datepicker/datepicker.min.css" rel="stylesheet" type="text/css" />
    <!-- Chosen Select -->
    <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="assets/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
    <link href="assets/css/skins/skin-yellow.min.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="assets/plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- Custom CSS -->
    <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
    
    <!-- Fungsi untuk membatasi karakter yang diinputkan -->
    <script language="javascript">
      function getkey(e)
      {
        if (window.event)
          return window.event.keyCode;
        else if (e)
          return e.which;
        else
          return null;
      }

      function goodchars(e, goods, field)
      {
        var key, keychar;
        key = getkey(e);
        if (key == null) return true;
       
        keychar = String.fromCharCode(key);
        keychar = keychar.toLowerCase();
        goods = goods.toLowerCase();
       
        // check goodkeys
        if (goods.indexOf(keychar) != -1)
            return true;
        // control keys
        if ( key==null || key==0 || key==8 || key==9 || key==27 )
          return true;
          
        if (key == 13) {
          var i;
          for (i = 0; i < field.form.elements.length; i++)
            if (field == field.form.elements[i])
              break;
          i = (i + 1) % field.form.elements.length;
          field.form.elements[i].focus();
          return false;
        };
        // else return false
        return false;
      }
    </script>

  </head>
  
  
<body>
<div class="content-header">
  <h1>
    <i class="fa fa-folder-o icon-title"></i> Stok Gudang

    <a class="btn btn-primary btn-social pull-right" href="index.php" title="Login" data-toggle="tooltip">
      <i class="fa fa fa-user"></i> Login
    </a>

  </h1>
</div>

	<section class="content">

	
	
	  <div class="row">
		<div class="col-md-12">

		<?php  
		// fungsi untuk menampilkan pesan
		// jika alert = "" (kosong)
		// tampilkan pesan "" (kosong)
		require_once "config/database.php";
		require_once "config/fungsi_tanggal.php";
		require_once "config/fungsi_rupiah.php";
		
		?>

		  <div class="box box-primary">
		  
			<div class="box-body table-responsive">
			  <!-- tampilan tabel barang -->
			  <table id="dataTables1" class="table table-bordered table-striped table-hover">
				<!-- tampilan tabel header -->
				<thead>
				  <tr>
					<th class="center">No.</th>
					<th class="center">Kode</th>
					<th class="center" nowrap>Nama Barang</th>
					<th class="center">Type</th>
					<th class="center">Jenis</th>
					<th class="center">Stok</th>
					<th></th>
				  </tr>
				</thead>
				<!-- tampilan tabel body -->
				<tbody>
				<?php  
				$no = 1;
				// fungsi query untuk menampilkan data dari tabel barang
				$query = mysqli_query($mysqli, "SELECT kode_barang,nama_barang,type_barang,jenis,stok_max,stok_min,satuan,stok,aktif FROM tb_barang ORDER BY kode_barang DESC")
												or die('Ada kesalahan pada query tampil Data Barang: '.mysqli_error($mysqli));

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
						  <td width='80' align='right'>$data[stok]</td>
						  <td class='center' width='80'>
							<div>";
				
				
				
				if ($data['aktif']=='1') { ?>
							  <span>
								  <i class="glyphicon glyphicon-ok btn-success btn-sm"></i>
							  </span>
				<?php
							  } 
							  else { ?>
							  
							  <span>
								  <i class="glyphicon glyphicon-off btn-warning btn-sm"></i>
							  </span>
							  
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
	</section><!-- /.content -->






  </body>
    <!-- jQuery 2.1.3 -->
    <script src="assets/plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>    
    <!-- datepicker -->
    <script src="assets/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- chosen select -->
    <script src="assets/plugins/select2/js/select2.min.js" type="text/javascript"></script>
    <!-- DATA TABES SCRIPT -->
    <script src="assets/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="assets/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
    <!-- Datepicker -->
    <script src="assets/plugins/datepicker/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <!-- Slimscroll -->
    <script src="assets/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='assets/plugins/fastclick/fastclick.min.js'></script>
    <!-- maskMoney -->
    <script src="assets/js/jquery.maskMoney.min.js"></script>
    <!-- AdminLTE App -->
    <script src="assets/js/app.min.js" type="text/javascript"></script>
	
	
    <!-- page script -->
    <script type="text/javascript">
      $(function () {
        // datepicker plugin
        $('.date-picker').datepicker({
          autoclose: true,
          todayHighlight: true
        });
        
        // mask money
        $('#harga_beli').maskMoney({thousands:'.', decimal:',', precision:0});
        $('#harga_jual').maskMoney({thousands:'.', decimal:',', precision:0});

        // chosen select
        //$('.chosen-select').chosen({allow_single_deselect:true}); 
        $(document).ready(function() { $('.chosen-select').select2(); });
        //resize the chosen on window resize

        /* CHOSEN LAMA
        $(window)
        .off('resize.chosen')
        .on('resize.chosen', function() {
          $('.chosen-select').each(function() {
             var $this = $(this);
             $this.next().css({'width': $this.parent().width()});
          })
        }).trigger('resize.chosen');
        
        //resize chosen on sidebar collapse/expand
        $(document).on('settings.ace.chosen', function(e, event_name, event_val) {
          if(event_name != 'sidebar_collapsed') return;
          $('.chosen-select').each(function() {
             var $this = $(this);
             $this.next().css({'width': $this.parent().width()});
          })
        });
    

        $('#chosen-multiple-style .btn').on('click', function(e){
          var target = $(this).find('input[type=radio]');
          var which = parseInt(target.val());
          if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
           else $('#form-field-select-4').removeClass('tag-input-style');
        });
        
        if ($('.chosen-container').length > 0) {
          $('.chosen-container').on('touchstart', function(e){
            e.stopPropagation(); e.preventDefault();
            // Trigger the mousedown event.
            $(this).trigger('mousedown');
          });
        }
        */

        // DataTables
        $("#dataTables1").dataTable();
        $('#dataTables2').dataTable({
          "bPaginate": true,
          "bLengthChange": false,
          "bFilter": true,
          "bSort": true,
          "bInfo": true,
          "bAutoWidth": false
        });
      });
    </script>
</html>