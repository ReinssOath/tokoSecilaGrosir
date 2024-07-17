<html> <!-- Bagian halaman HTML yang akan print -->
<?php
session_start();
ob_start();
// Panggil koneksi database.php untuk koneksi database
require_once "../../config/database.php";
// panggil fungsi untuk format tanggal
include "../../config/fungsi_tanggal.php";
// panggil fungsi untuk format rupiah
include "../../config/fungsi_rupiah.php";

$hari_ini = date("d-m-Y");

$no = 1;
// fungsi query untuk menampilkan data dari tabel barang
if (isset($_GET['jenis'])) {
    $s_jenis  = mysqli_real_escape_string($mysqli, trim($_GET['jenis']));
    $query = mysqli_query($mysqli, "SELECT kode_barang,nama_barang,type_barang,jenis,stok_max,stok_min,satuan,stok,aktif FROM tb_barang WHERE jenis='$s_jenis' ORDER BY nama_barang ASC")
                                    or die('Ada kesalahan pada query tampil Data Barang: '.mysqli_error($mysqli));
} else {
    $query = mysqli_query($mysqli, "SELECT kode_barang,nama_barang,type_barang,jenis,stok_max,stok_min,satuan,stok,aktif FROM tb_barang ORDER BY nama_barang ASC")
                                    or die('Ada kesalahan pada query tampil Data Barang: '.mysqli_error($mysqli));

}

//$query = mysqli_query($mysqli, "SELECT kode_barang,nama_barang,harga_beli,harga_jual,satuan,stok FROM tb_barang ORDER BY nama_barang ASC")
//                                or die('Ada kesalahan pada query tampil Data Barang: '.mysqli_error($mysqli));

$count  = mysqli_num_rows($query);
?>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Laporan Stok Barang | Toko Secila</title>
        <link rel="stylesheet" type="text/css" href="../../assets/css/laporan.css" />
        <style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

tr:hover {background-color:#f5f5f5;}
</style>
    </head>
    <body>
        <div id="title">
            LAPORAN STOK BARANG<br>
        <?php
          if (isset($_GET['jenis'])) {
              $s_jenis  = mysqli_real_escape_string($mysqli, trim($_GET['jenis']));
              echo "JENIS : ".$s_jenis;
          } else {
              echo "Semua Jenis";
          }
        ?>
            
        </div>
        
        <hr><br>

        <div id="isi">
            <table width="100%" border="0.3" cellpadding="0" cellspacing="0">
                <thead style="background:#e8ecee">
                    <tr class="tr-title">
                        <th height="20" align="center" valign="middle">NO.</th>
                        <th height="20" align="center" valign="middle">KODE BARANG</th>
                        <th height="20" align="center" valign="middle">NAMA BARANG</th>
                        <th height="20" align="center" valign="middle">JENIS</th>
                        <th height="20" align="center" valign="middle">STOK</th>
                        <th height="20" align="center" valign="middle">CEK</th>
                        <th height="20" align="center" valign="middle">KET</th>
                    </tr>
                </thead>
                <tbody>
<?php
        // tampilkan data
        $adatype = '';
        while ($data = mysqli_fetch_assoc($query)) {
            //$harga_beli = format_rupiah($data['harga_beli']);
            //$harga_jual = format_rupiah($data['harga_jual']);
            // menampilkan isi tabel dari database ke tabel di aplikasi
            
            $adatype = $data['type_barang'];
            $typebarang = ($adatype == '') ? '' : " <tiny>[$adatype]</tiny>" ;
            echo "  <tr>
                        <td width='40' height='13' align='center' valign='middle'>$no</td>
                        <td width='80' height='13' align='center' valign='middle'>$data[kode_barang]</td>
                        <td style='padding-left:5px;' width='180' height='13' valign='middle'>$data[nama_barang] $typebarang</td>
                        <td width='80' height='13' align='center' valign='middle'>$data[jenis]</td>
                        <td style='padding-right:10px;' width='80' height='13' align='right' valign='middle'>$data[stok]</td>
                        <td width='80' height='13' align='center' valign='middle'></td>
                        <td width='80' height='13' align='center' valign='middle'></td>
                    </tr>";
            $no++;
        }
?>
                </tbody>
            </table>

            <div id="footer-tanggal">
                Makassar, <?php echo tgl_eng_to_ind("$hari_ini"); ?>
            </div> 
            <div id="footer-jabatan">
                Pimpinan
            </div>
            
            <div id="footer-nama">
                (_____________________________)
            </div>
        </div>
        
        <script>
		window.print();
	    </script>

    </body>
</html><!-- Akhir halaman HTML yang akan di print -->