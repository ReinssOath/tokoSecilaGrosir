<?php
session_start();

// Panggil koneksi database.php untuk koneksi database
require_once "../../config/database.php";

// fungsi untuk pengecekan status login user 
// jika user belum login, alihkan ke halaman login dan tampilkan pesan = 1
if (empty($_SESSION['username']) && empty($_SESSION['password'])){
    echo "<meta http-equiv='refresh' content='0; url=index.php?alert=1'>";
}
// jika user sudah login, maka jalankan perintah untuk insert, update, dan delete
else {
    if ($_GET['act']=='insert') {
        if (isset($_POST['simpan'])) {
            // ambil data hasil submit dari form
            $kode_transaksi = mysqli_real_escape_string($mysqli, trim($_POST['kode_transaksi']));
            
            $tanggal         = mysqli_real_escape_string($mysqli, trim($_POST['tanggal_keluar']));
            $exp             = explode('-',$tanggal);
            $tanggal_keluar  = $exp[2]."-".$exp[1]."-".$exp[0];
            
            $kode_barang       = mysqli_real_escape_string($mysqli, trim($_POST['kode_barang']));
            $jumlah_keluar   = mysqli_real_escape_string($mysqli, trim($_POST['jumlah_keluar']));
            $total_stok      = mysqli_real_escape_string($mysqli, trim($_POST['total_stok']));
            $stok      = mysqli_real_escape_string($mysqli, trim($_POST['stok']));
            $tujuan      = mysqli_real_escape_string($mysqli, trim($_POST['tujuan']));
            
            $created_user    = $_SESSION['id_user'];

            // perintah query untuk menyimpan data ke tabel barang masuk
            $query = mysqli_query($mysqli, "INSERT INTO barang_keluar(kode_transaksi,tanggal_keluar,kode_barang,jumlah_keluar,stok,total_stok,tujuan,created_user) 
                                            VALUES('$kode_transaksi','$tanggal_keluar','$kode_barang','$jumlah_keluar','$stok','$total_stok','$tujuan','$created_user')")
                                            or die('Ada kesalahan pada query insert : '.mysqli_error($mysqli));    

            // cek query
            if ($query) {
                // perintah query untuk mengubah data pada tabel barang
                $query1 = mysqli_query($mysqli, "UPDATE tb_barang SET stok        = '$total_stok'
                                                              WHERE kode_barang   = '$kode_barang'")
                                                or die('Ada kesalahan pada query update : '.mysqli_error($mysqli));

                // cek query
                if ($query1) {                       
                    // jika berhasil tampilkan pesan berhasil simpan data
                    header("location: ../../main.php?module=barang_keluar&alert=1");
                }
            }   
        }   
    }
}       
?>