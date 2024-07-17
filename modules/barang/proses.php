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
            $kode_barang  = mysqli_real_escape_string($mysqli, trim($_POST['kode_barang']));
            $nama_barang  = mysqli_real_escape_string($mysqli, trim($_POST['nama_barang']));
            $type_barang = mysqli_real_escape_string($mysqli, trim($_POST['type_barang']));
            $stok_max = str_replace('.', '', mysqli_real_escape_string($mysqli, trim($_POST['stok_max'])));
            $stok_min = str_replace('.', '', mysqli_real_escape_string($mysqli, trim($_POST['stok_min'])));
            $satuan     = mysqli_real_escape_string($mysqli, trim($_POST['satuan']));
            $jenis     = mysqli_real_escape_string($mysqli, trim($_POST['jenis']));
            $catatan     = mysqli_real_escape_string($mysqli, trim($_POST['catatan']));
            $harga_beli = str_replace('.', '', mysqli_real_escape_string($mysqli, trim($_POST['harga_beli'])));
            $harga_jual = str_replace('.', '', mysqli_real_escape_string($mysqli, trim($_POST['harga_jual'])));

            $created_user = $_SESSION['id_user'];

            // perintah query untuk menyimpan data ke tabel barang
            $query = mysqli_query($mysqli, "INSERT INTO tb_barang(kode_barang,nama_barang,type_barang,jenis,stok_max,stok_min,satuan,created_user,updated_user,harga_beli,harga_jual,catatan) 
                                            VALUES('$kode_barang','$nama_barang','$type_barang','$jenis','$stok_max','$stok_min','$satuan','$created_user','$created_user','$harga_beli','$harga_jual','$catatan')")
                                            or die('Ada kesalahan pada query insert : '.mysqli_error($mysqli));    

            // cek query
            if ($query) {
                // jika berhasil tampilkan pesan berhasil simpan data
                header("location: ../../main.php?module=barang&alert=1");
            }   
        }   
    }
    
    elseif ($_GET['act']=='update') {
        if (isset($_POST['simpan'])) {
            if (isset($_POST['kode_barang'])) {
                // ambil data hasil submit dari form
                $kode_barang    = mysqli_real_escape_string($mysqli, trim($_POST['kode_barang']));
                $nama_barang    = mysqli_real_escape_string($mysqli, trim($_POST['nama_barang']));
                $type_barang    = mysqli_real_escape_string($mysqli, trim($_POST['type_barang']));
                $stok_max       = str_replace('.', '', mysqli_real_escape_string($mysqli, trim($_POST['stok_max'])));
                $stok_min       = str_replace('.', '', mysqli_real_escape_string($mysqli, trim($_POST['stok_min'])));
                $satuan         = mysqli_real_escape_string($mysqli, trim($_POST['satuan']));
                $jenis          = mysqli_real_escape_string($mysqli, trim($_POST['jenis']));
                $catatan     = mysqli_real_escape_string($mysqli, trim($_POST['catatan']));
                $harga_beli = str_replace('.', '', mysqli_real_escape_string($mysqli, trim($_POST['harga_beli'])));
                $harga_jual = str_replace('.', '', mysqli_real_escape_string($mysqli, trim($_POST['harga_jual'])));

                $updated_user = $_SESSION['id_user'];

                // perintah query untuk mengubah data pada tabel barang
                $query = mysqli_query($mysqli, "UPDATE tb_barang SET  nama_barang       = '$nama_barang',
                                                                    type_barang   = '$type_barang',
                                                                    stok_max      = '$stok_max',
                                                                    stok_min      = '$stok_min',
                                                                    satuan          = '$satuan',
                                                                    jenis          = '$jenis',
                                                                    catatan     = '$catatan',
                                                                    harga_beli      = '$harga_beli',
                                                                    harga_jual      = '$harga_jual',
                                                                    updated_user    = '$updated_user'
                                                              WHERE kode_barang       = '$kode_barang'")
                                                or die('Ada kesalahan pada query update : '.mysqli_error($mysqli));

                // cek query
                if ($query) {
                    // jika berhasil tampilkan pesan berhasil update data
                    header("location: ../../main.php?module=barang&alert=2");
                }         
            }
        }
    }

    elseif ($_GET['act']=='off') {
        if (isset($_GET['id'])) {
            $kode_barang = $_GET['id'];
    
            // perintah query untuk menghapus data pada tabel barang
            $query = mysqli_query($mysqli, "UPDATE tb_barang SET aktif='0' WHERE kode_barang='$kode_barang'")
                                            or die('Ada kesalahan pada query delete : '.mysqli_error($mysqli));

            // cek hasil query
            if ($query) {
                // jika berhasil tampilkan pesan berhasil delete data
                header("location: ../../main.php?module=barang&alert=3");
            }
        }
    }     

    elseif ($_GET['act']=='on') {
        if (isset($_GET['id'])) {
            $kode_barang = $_GET['id'];
    
            // perintah query untuk menghapus data pada tabel barang
            $query = mysqli_query($mysqli, "UPDATE tb_barang SET aktif='1' WHERE kode_barang='$kode_barang'")
                                            or die('Ada kesalahan pada query delete : '.mysqli_error($mysqli));

            // cek hasil query
            if ($query) {
                // jika berhasil tampilkan pesan berhasil delete data
                header("location: ../../main.php?module=barang&alert=4");
            }
        }
    }      
}       
?>