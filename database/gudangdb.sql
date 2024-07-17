-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 31 Okt 2021 pada 01.14
-- Versi server: 10.2.36-MariaDB-log
-- Versi PHP: 5.6.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gudangdb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `jumlah_keluar` int(11) NOT NULL,
  `stok` int(11) DEFAULT NULL,
  `total_stok` int(11) DEFAULT NULL,
  `tujuan` varchar(65) NOT NULL DEFAULT '',
  `catatan` varchar(200) NOT NULL DEFAULT '',
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`kode_transaksi`, `tanggal_keluar`, `kode_barang`, `jumlah_keluar`, `stok`, `total_stok`, `tujuan`, `catatan`, `created_user`, `created_date`) VALUES
('TK-2021-0000002', '2021-10-26', 'B000001', 5, 55, 50, 'aaaa', '', 1, '2021-10-26 02:32:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `stok` int(11) DEFAULT NULL,
  `total_stok` int(11) DEFAULT NULL,
  `asal` varchar(65) NOT NULL DEFAULT '',
  `catatan` varchar(200) NOT NULL DEFAULT '',
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_user` int(3) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`kode_transaksi`, `tanggal_masuk`, `kode_barang`, `jumlah_masuk`, `stok`, `total_stok`, `asal`, `catatan`, `created_user`, `created_date`, `updated_user`, `updated_date`) VALUES
('TM-2021-0000001', '2021-10-18', 'B000001', 50, 0, 50, 'AMRI STORE', '', 1, '2021-10-17 22:02:18', NULL, '2021-10-17 22:02:18'),
('TM-2021-0000002', '2021-10-26', 'B000001', 5, 50, 55, 'AMRI STORE', '', 1, '2021-10-26 02:20:22', NULL, '2021-10-26 02:20:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_stok`
--

CREATE TABLE `barang_stok` (
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_revisi` date NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `stok_real` int(11) NOT NULL,
  `stok_awal` int(11) DEFAULT NULL,
  `stok_revisi` int(11) DEFAULT 0 COMMENT 'jumlah real - stok awal = stok revisi',
  `catatan` varchar(200) NOT NULL DEFAULT '',
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(65) NOT NULL,
  `type_barang` varchar(65) DEFAULT '',
  `jenis` varchar(65) DEFAULT '',
  `stok_min` int(11) NOT NULL DEFAULT 0,
  `stok_max` int(11) NOT NULL DEFAULT 0,
  `satuan` varchar(25) NOT NULL DEFAULT 'Pcs',
  `stok` int(11) NOT NULL,
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_user` int(3) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `harga_beli` int(11) NOT NULL DEFAULT 0,
  `harga_jual` int(11) NOT NULL DEFAULT 0,
  `catatan` varchar(25) DEFAULT '',
  `aktif` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `type_barang`, `jenis`, `stok_min`, `stok_max`, `satuan`, `stok`, `created_user`, `created_date`, `updated_user`, `updated_date`, `harga_beli`, `harga_jual`, `catatan`, `aktif`) VALUES
('1B001', 'As Roda Canter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:16', 1, '2021-10-17 17:50:16', 0, 0, 'Firs One Card', '1'),
('1B002', 'Baut Roda Belakang Kanan Suma', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:16', 1, '2021-10-17 17:50:16', 0, 0, 'Suma Part Indonesia', '1'),
('1B003', 'Baut Roda Belakang Kiri Suma', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:16', 1, '2021-10-17 17:50:16', 0, 0, 'Suma Part Indonesia', '1'),
('1B004', 'Baut Roda Depan Kanan Suma ', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:16', 1, '2021-10-17 17:50:16', 0, 0, 'Suma Part Indonesia', '1'),
('1B005', 'Baut Roda Depan Kiri Suma ', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:16', 1, '2021-10-17 17:50:16', 0, 0, 'Suma Part Indonesia', '1'),
('1B006', 'Behel Belakang Canter', '18 x 72 x 400', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:16', 1, '2021-10-17 17:50:16', 0, 0, 'Indo Multi Prima', '1'),
('1B007', 'Dudukan Transmisi Canter HDX', 'MC 122542', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:16', 1, '2021-10-17 17:50:16', 0, 0, 'Kenzo Motor', '1'),
('1B008', 'Dudukan Transmisi Canter HDX', 'MC 122542', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Sigma Motor', '1'),
('1B009', 'Dudukan Mesin Kiri / Kanan', 'ML242056', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Darma Outomotif Part', '1'),
('1B010', 'Filter Solar Atas Aegis', 'ME 035829', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'PT. Anugerah Spareparts S', '1'),
('1B011', 'Filter Solar Bawah Sakura', 'F 1008', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Central Diesel', '1'),
('1B012', 'Filter Udara Aspira', 'M1-01724-CTR-1810', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Aki Murah Jkt', '1'),
('1B013', 'Filter Solar Bawah Aspira', 'M1-4601-LOP-1800', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Aki Murah Jkt', '1'),
('1B014', 'Filter Oli Canter', 'ME 130968', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Sumber Rejeki Motor', '1'),
('1B015', 'Gambiran Blok Hdx Gum75 GMB', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Yeni Gunawan', '1'),
('1B016', 'Gambiran Blok Hdx Gum75 GMB', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Seno Automotif', '1'),
('1B017', 'Gambiran Blok Hdx Gum75 GMB', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Kenzi Autopart', '1'),
('1B018', 'Oil Seal Roda Belakang Dalam', 'MB308965', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Surya Abadi Motor', '1'),
('1B019', 'Oil Seal Roda Belakang Luar', 'MB 308966', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Surya Abadi Motor', '1'),
('1B020', 'Oil Seal Roda Depan Canter', 'MB 025295', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Surya Abadi Motor', '1'),
('1B021', 'Per Kampas Canter HDX', 'MX 927066', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Kenzi Autopart', '1'),
('1B022', 'Karet Rem Canter', 'MK 585602', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Kayoko Auto Part', '1'),
('1B023', 'Kampas Rem Lining Canter HDX', 'MK 585622', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Jito Part', '1'),
('1B024', 'Karet Debu Canter HDX', '11227', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Bahari Outo Part', '1'),
('1B025', 'Kampas Kopling HDX', 'ME 515796', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Harapan Berkat Motor', '1'),
('1B026', 'Baut As Canter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Kenzo Motor', '1'),
('1B027', 'Baut As Canter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Olshop Lisa', '1'),
('1B028', 'Lahar Penindis Kopling Canter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Jason Part', '1'),
('1B029', 'Bak Rem Belakang Kiri Neppel', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, '', '1'),
('1B030', 'Bak Rem Belakang Kiri Non Neppel', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, '', '1'),
('1B031', 'Braket Filter Canter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, '', '1'),
('1B032', 'Baut Nap Canter HDX', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Alphin', '1'),
('1B033', 'Ring Kerucut', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:15', 1, '2021-10-17 17:50:15', 0, 0, 'Alphin', '1'),
('1B034', 'Karet Rem 30253R', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:14', 1, '2021-10-17 17:50:14', 0, 0, '', '1'),
('1B035', 'Gigi Transmisi', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:14', 1, '2021-10-17 17:50:14', 0, 0, '', '1'),
('1B036', 'Saringan Udara', 'ME 017264', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:14', 1, '2021-10-17 17:50:14', 0, 0, 'PT. Anugerah Spareparts S', '1'),
('1B037', 'Baut Roda Belakang Kanan AWC ', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:14', 1, '2021-10-17 17:50:14', 0, 0, 'Spareparts Jatim', '1'),
('1B038', 'Kampas Rem Tangan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:14', 1, '2021-10-17 17:50:14', 0, 0, 'Pak Fendy', '1'),
('1B039', 'Lahar Belakang Luar Canter', '3204-11JR', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:14', 1, '2021-10-17 17:50:14', 0, 0, 'Tri Tunggal', '1'),
('1B040', 'Lahar Belakang Dalam Canter', '32014U', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:14', 1, '2021-10-17 17:50:14', 0, 0, 'Tri Tunggal', '1'),
('1B041', 'Lahar Depan Dalam Canter', '50KW01', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:14', 1, '2021-10-17 17:50:14', 0, 0, 'Tri Tunggal', '1'),
('1B042', 'Lahar Depan Luar Canter', 'J30-1AC638', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:14', 1, '2021-10-17 17:50:14', 0, 0, 'Tri Tunggal', '1'),
('1C001', 'Bak Rem Belakang RH / LH Hino Sanyco', '47550-2680', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:13', 1, '2021-10-17 17:50:13', 0, 0, '', '1'),
('1C002', 'Bhusing Kit Hino / Fuso', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:13', 1, '2021-10-17 17:50:13', 0, 0, 'Pusat Onderdil Mobil', '1'),
('1C003', 'Bhusing Kit Plat Hino / Fuso', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:13', 1, '2021-10-17 17:50:13', 0, 0, 'Pusat Onderdil Mobil', '1'),
('1C004', 'Behel Depan Hino', '20 x 83 x 225', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:13', 1, '2021-10-17 17:50:13', 0, 0, 'Indo Multi Prima', '1'),
('1C005', 'Behel Belakang Hino 6 Roda', '24 x 93 x 500', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:13', 1, '2021-10-17 17:50:13', 0, 0, 'Indo Multi Prima', '1'),
('1C006', 'Baut Roda Belakang Kiri AWC', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:13', 1, '2021-10-17 17:50:13', 0, 0, 'Indo Multi Prima', '1'),
('1C007', 'Baut Roda Belakang Kiri Suma', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:13', 1, '2021-10-17 17:50:13', 0, 0, 'Suma Part Indonesia', '1'),
('1C008', 'Baut Roda Belakang Kanan Suma', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:13', 1, '2021-10-17 17:50:13', 0, 0, 'Suma Part Indonesia', '1'),
('1C009', 'Baut Roda Depan Kiri Suma', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:13', 1, '2021-10-17 17:50:13', 0, 0, 'Suma Part Indonesia', '1'),
('1C010', 'Baut Roda Depan Kanan Suma', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:13', 1, '2021-10-17 17:50:13', 0, 0, 'Suma Part Indonesia', '1'),
('1C011', 'Baut Roda Belakang Kiri Doubel Nut Suma', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Suma Part Indonesia', '1'),
('1C012', 'Baut Roda Belakang Kanan Doubel Nut Suma', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Suma Part Indonesia', '1'),
('1C013', 'Dudukan Transmisi Hino', '12035-3142', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Jakarta Part 81', '1'),
('1C014', 'Dudukan Mesin Hino Lohan', '1BK HM04Z1', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Jasutra Motor', '1'),
('1C015', 'Filter Solar Atas Hino', '23401-1332L', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'PT. Anugerah Spareparts S', '1'),
('1C016', 'Filter Oli Mesin Hop ', 'VH156072190', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Panca Benua Perkasa', '1'),
('1C017', 'Gelas Filter Bawah Hino', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Pak Fendy', '1'),
('1C018', 'Handle Pintu Kanan Hino Lohan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Jakarta Part 81', '1'),
('1C019', 'Handle Pintu Kanan Hino Lohan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Jakarta Part 81', '1'),
('1C020', 'Isi Power Rem Hino 10 Roda', '44069-5362', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'MJD Sparepart', '1'),
('1C021', 'Isi Power Rem Hino Nabco', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Jaya Agung', '1'),
('1C022', 'Karet Debu Hino / Fuso / Tronton', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Cemerlang Samudra', '1'),
('1C023', 'Karet Rem Depan Hino Dan Fuso 6 Roda', 'SC 80093', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Bahari Oto Putra', '1'),
('1C024', 'Kampas Rem Depan 10 Roda', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Jaya Agung', '1'),
('1C025', 'Kampas Rem Belakang Hino 10 Roda & Fuso 10 Roda WB', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Jaya Agung', '1'),
('1C026', 'Liner Booster 90Mm Hino Lohan 6 & 10 Roda', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'MJD Sparepart', '1'),
('1C027', 'Lahar Penindis Hino & Fuso Ct 70', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Pak Fendy', '1'),
('1C028', 'Power Kopling Hino 6 Roda & 10 Roda', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'MJD Sparepart', '1'),
('1C029', 'Ring As Blakang Lubang Hino', '9004-36113', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:12', 1, '2021-10-17 17:50:12', 0, 0, 'Felix Jakarta', '1'),
('1C030', 'Ring As Belakang Polos', '9004-36116', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, 'Felix Jakarta', '1'),
('1C031', 'Regulator Kaca RH / LH', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, 'MJD Sparepart', '1'),
('1C032', 'Seal Roda Belakang Luar Hino', '9828-76101A', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, 'Ken 93', '1'),
('1C033', 'Seal Roda Belakang Dalam Hino', 'SZ311-01047', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, 'Jakarta Part 81', '1'),
('1C034', 'Tali Porsenelan Kanan Hino Lohan ', '3382-E0D80', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, 'MJD Sparepart', '1'),
('1C035', 'Tali Persenelan Kiri Hino Lohan ', '33830-E0A3OL', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, 'MJD Sparepart', '1'),
('1C036', 'Nap Roda Hino (Bekas)', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, 'Mantap Jaya Auto Part', '1'),
('1C037', 'Swist Double', 'S27610-4530', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, '', '1'),
('1C038', 'Tabung Jimbret', 'ME053885', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, '', '1'),
('1C039', 'Tongkat Persenelan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, 'MJD Sparepart', '1'),
('1C040', 'Tiroad End', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, 'MJD Sparepart', '1'),
('1C041', 'Karet Rem Depan Hino & Fuso 10 Roda', 'SC80207', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, 'Bahari Oto Putra', '1'),
('1C042', 'Braket Filter Solar Bawah', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:11', 1, '2021-10-17 17:50:11', 0, 0, '', '1'),
('1C043', 'Filter Solar Bawah', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, 'PT. Anugerah Spareparts S', '1'),
('1C044', 'Per Pedal Hino', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, '', '1'),
('1C045', 'Seal Kransaft Depan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, '', '1'),
('1C046', 'Dinamo Stater', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, '', '1'),
('1C047', 'Baut Nap Kunci 19', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, 'Alphin', '1'),
('1C048', 'Kura-Kura Power Rem', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, 'MJD Sparepart', '1'),
('1C049', 'Gambiran Gudump - 2 Out', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, '', '1'),
('1C050', 'Isi Kura-Kura Power Rem', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, '', '1'),
('1C051', 'Hub Bolt Belakang Kanan AWC', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, 'Sparepart Jatim', '1'),
('1C052', 'Hub Bolt Belakang Kiri AWC', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, 'Sparepart Jatim', '1'),
('1C053', 'Isi Kopling Atas', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, '', '1'),
('1C054', 'Bak Rem Belakang Hino Osako', '37550-2680', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, '', '1'),
('1C055', 'Bak Rem Belakang Hino Osako', '47550-2670', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, '', '1'),
('1C056', 'Bak Rem Belakang Hino Osako', '47510-1910', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, '', '1'),
('1C057', 'Power Rem Panjang Hino 10 Roda', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, 'MJD Sparepart', '1'),
('1C058', 'Power Rem Pendek Hino 10 Roda', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, 'MJD Sparepart', '1'),
('1C059', 'Hub Bolt Belakang Kiri', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, 'Indo Multi Prima', '1'),
('1C060', 'Hub Bolt Belakang Kanan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, 'Indo Multi Prima', '1'),
('1C061', 'Isi Power Rem 6 Roda Hino', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, '', '1'),
('1C062', 'Pedal Rem Hino', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:10', 1, '2021-10-17 17:50:10', 0, 0, 'MJD Sparepart', '1'),
('1C063', 'Karet Stabil Hino', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, '', '1'),
('1C064', 'Karet Stabil Hop', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, '', '1'),
('1C065', 'Dudukan Mesin Hino Lohan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, '', '1'),
('1C066', 'Air Dryyer Hino', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, '', '1'),
('1C067', 'Ring Lubang As Depan Lubang', '9004-36109', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Felix Jakarta', '1'),
('1C068', 'Ring Lubang As Depan Polos', '9279-390107', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Felix Jakarta', '1'),
('1C069', 'Lahar Depan Luar', '22310', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Tri Tunggal', '1'),
('1C070', 'Lahar Depan Dalam', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Tri Tunggal', '1'),
('1C071', 'Lahar Belakang Luar', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Tri Tunggal', '1'),
('1C072', 'Lahar Belakang Dalam', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Tri Tunggal', '1'),
('1D001', 'Rantai Rs 80 Singgel', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Prima Jaya Sentosa ', '1'),
('1D002', 'Baut Fyl 140 Kopling Dinamo', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Prima Jaya Sentosa ', '1'),
('1D003', 'Karet Fyl 140 Kopling Dinamo', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Prima Jaya Sentosa ', '1'),
('1D004', 'Seal 1000 x 130 x 12', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, '', '1'),
('1D005', 'Lahar 22240 Twb', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Asia Bearing', '1'),
('1D006', 'Tang Las 800 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Nicon Tech', '1'),
('1D007', 'Tang Las 800 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, '3 Serangkai', '1'),
('1D008', 'Tang Las 200 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Art Tehnik', '1'),
('1D009', 'Tang Las 800 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Klik Hardware', '1'),
('1D010', 'Seal 1000 x 130 x 12', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, 'Asian Bearing', '1'),
('1D011', 'Lahar 22320', 'TWB', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, '', '1'),
('1D012', 'Lahar 22322', 'DYZV', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, '', '1'),
('1D013', 'Lahar 22322', 'FAG', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, '', '1'),
('1D014', 'Lahar 22324', 'FAG', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:09', 1, '2021-10-17 17:50:09', 0, 0, '', '1'),
('1D015', 'Lahar 22326', 'TWB', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, '', '1'),
('1D016', 'Lahar 23148', 'ZWZ', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, '', '1'),
('1D017', 'Lahar 22317', 'TWB', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, '', '1'),
('1D018', 'Lahar 22318', 'TWB', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, '', '1'),
('1D019', 'Vambel D-200', 'MITSHUBOSI', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, '', '1'),
('1D020', 'Vambel D-250', 'MITSHUBOSI', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, '', '1'),
('1D021', 'Kuku Macan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, '', '1'),
('1D022', 'Bhusing Jow H2320', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, '', '1'),
('1D023', 'Lahar UCT 210 J', 'FYH', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, '', '1'),
('1D024', 'Lahar Bang Jago 210', 'ASB', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, '', '1'),
('1D025', 'Lahar Bang Jago 204', 'ASB', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, '', '1'),
('1D026', 'Lahar UCP 210', 'ASB', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, '', '1'),
('A1001', 'As Roda NMR', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, 'Felix Acian Motor', '1'),
('A1002', 'Baut Roda Belakang Kiri NMR Suma', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, 'Suma Part Indonesia', '1'),
('A1003', 'Baut Roda Belakang Kanan NMR Suma', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, 'Suma Part Indonesia', '1'),
('A1004', 'Baut Roda Depan Kiri  Suma', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:08', 1, '2021-10-17 17:50:08', 0, 0, 'Suma Part Indonesia', '1'),
('A1005', 'Baut Roda Depan Kanan Suma', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, 'Suma Part Indonesia', '1'),
('A1006', 'Baut Roda Belakang Kanan NMR Godson India', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, 'First One Car', '1'),
('A1007', 'Baut Roda Belakang Kanan NMR AWC', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, 'Indo Multi Prima', '1'),
('A1008', 'Baut Roda Belakang Kiri NMR HWC', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, 'Indo Multi Prima', '1'),
('A1009', 'Baut As Roda NMR', '5.09300.066.1', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, 'Tigar Automotive Part', '1'),
('A1010', 'Bak Rem Belakang Kiri Non Neppel', '8-97022143-1', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, '', '1'),
('A1011', 'Bak Rem Depan Kiri Neppel', '897022131-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, '', '1'),
('A1012', 'Bak Rem Depan Kiri Neppel 2', '8-97022131-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, 'Berkat Onderdil', '1'),
('A1013', 'Bak Rem Depan Kanan Neppel', '8-97022030-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, '', '1'),
('A1014', 'Bak Rem Depan Kanan Neppel 2', '8-97022030-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, 'Berkat Onderdil', '1'),
('A1015', 'Bak Rem Depan Kiri Non Neppel', '8-97022029-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, '', '1'),
('A1016', 'Bak Rem Depan Kiri Non Neppel 2', '8-97022029-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, 'Berkat Onderdil', '1'),
('A1017', 'Bak Rem Depan Kanan Non Neppel 2', '8-97022028-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, 'Berkat Onderdil', '1'),
('A1018', 'Behel Belakang NMR', '18 x 72 x 350', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:07', 1, '2021-10-17 17:50:07', 0, 0, 'Indo Multi Prima', '1'),
('A1019', 'Dinamo Stater NMR', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:06', 1, '2021-10-17 17:50:06', 0, 0, 'Jasutra Motor', '1'),
('A1020', 'Dudukan Mesin Kanan NMR', '8-98722893-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:06', 1, '2021-10-17 17:50:06', 0, 0, 'Koyoko Genuine Part', '1'),
('A1021', 'Dudukan Mesin Kiri NMR', '8-97122-895-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:06', 1, '2021-10-17 17:50:06', 0, 0, 'Koyoko Genuine Part', '1'),
('A1022', 'Dudukan Transmisi NMR', '16-94111-903-1', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:06', 1, '2021-10-17 17:50:06', 0, 0, 'Acien Part Original', '1'),
('A1023', 'Dudukan Transmisi NMR', '16-94111-903-1', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Felix Acian Motor', '1'),
('A1024', 'Filter Solar Bawah Isuzu NMR', '16-98319912-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Sumber Abadi Motor', '1'),
('A1025', 'Filter Solar Bawah Nmr Aegis', '16-98319912-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'PT. Anugerah Spareparts M', '1'),
('A1026', 'Filter Solar Atas Aegis', '8-97172-549-A', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'PT. Anugerah Spareparts M', '1'),
('A1027', 'Filter Udara NMR', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Aki Murah Jakarta', '1'),
('A1028', 'Gambiran Blok Guis 73 GMB', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'First One Car', '1'),
('A1029', 'Gambiran Blok Guis 73 GMB', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Jaya Sukses', '1'),
('A1030', 'Gambiran Pto Isuzu NMR', 'GUD UMP 1 OUT', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Sentosa Seal', '1'),
('A1031', 'Gambiran Pto Isuzu NMR', 'GUD UMP 11 OUT', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Sentosa Seal', '1'),
('A1032', 'Gambiran Gud Ump 3U / 8413 SJ', 'GUD 3', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Cun Mobil', '1'),
('A1033', 'Isi Kopling Isuzu Nkr', '5.87831.402.0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Jakarta Part 81', '1'),
('A1034', 'Seal Roda Belakang Luar NMR', '8-94336-317', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Surya Abadi Motor', '1'),
('A1035', 'Seal Roda Belakang Dalam NMR', '8-79122-937-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Surya Abadi Motor', '1'),
('A1036', 'Seal Jimrek', '8-97096-809-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, '', '1'),
('A1037', 'Seal Roda Depan NMR', '8-94348-117', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Surya Abadi Motor', '1'),
('A1038', 'Karet Rem Seiken', 'SC-40493', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Grosiran Part Geiune', '1'),
('A1039', 'Lahar Penindis NMR', 'J8TKL4801', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Surya Abadi Motor', '1'),
('A1040', 'Lahar Penindis NMR', '8-97255-313-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Pak Fendy', '1'),
('A1041', 'Lampu Stop Kiri NMR', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Gabriel Motor', '1'),
('A1042', 'Lampu Stop Kanan NMR', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Gabriel Motor', '1'),
('A1043', 'Master Kopling NMR', '8-970-328-470', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'S.M 68 ', '1'),
('A1044', 'Paku Kampas', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Pak Fendy', '1'),
('A1045', 'Per Kampas Rem NMR', '8-97022087-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Surya Abadi Motor', '1'),
('A1046', 'Sambungan Knalpot NMR', 'TE 000017', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Mitesun Hota', '1'),
('A1047', 'Nap Roda NMR', '8-9107-549-2', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Velix Jakarta', '1'),
('A1048', 'Lahar Depan Luar', '32207', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, 'Tri Tunggal', '1'),
('A1049', 'Tromol Belakang NMR', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:05', 1, '2021-10-17 17:50:05', 0, 0, '', '1'),
('A1050', 'Sepatu Kampas NMR', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, '', '1'),
('A1051', 'Lahar Depan Dalam', '32210', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Tri Tunggal', '1'),
('A1052', 'Lahar Belakang Luar', '28680', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Tri Tunggal', '1'),
('A1053', 'Lahar Belakang Dalam', '32213', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Tri Tunggal', '1'),
('A1054', 'Ring Bulan Isuzu', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, '', '1'),
('A1055', 'Karet Kopling Atas NMR', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, '', '1'),
('A1056', 'Karet Kopling Bawah NMR', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, '', '1'),
('A1057', 'Kampas Rem Isuzu Nippon', '6-87870-028-128', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'UD. Asia Baru', '1'),
('A1058', 'Baut Roda Depan Kanan AWC', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Sparepart Jatim', '1'),
('A1059', 'Baut Roda Depan Kiri AWC', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Sparepart Jatim', '1'),
('A1060', 'Seal Pinion Isuzu', '1-09625-484-0', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Pak Fendy', '1'),
('A1061', 'Kipas Radiator', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Pak Fendy', '1'),
('A1062', 'Kampas Kopling NMR', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, '', '1'),
('A1063', 'Filter Oli Aegis NMR', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'PT. Aegis Filter', '1'),
('A1064', 'Kampas Rem Tangan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, '', '1'),
('A1065', 'Kampas Kopling NMR', 'EXEMEDI', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, '', '1'),
('A1066', 'Dinamo Stater NMR', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Yanhan Dieselindo', '1'),
('A1067', 'Filter Solar Atas Giga', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, '', '1'),
('A1E001', 'Kepala Baut Roda Fuso Kiri', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Suma Part Indonesia', '1'),
('A1E002', 'Kepala Baut Roda Fiso Kanan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Suma Part Indonesia', '1'),
('A1E003', 'Baut Roda Depan Kanan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Suma Part Indonesia', '1'),
('A1E004', 'Baut Roda Belakang Kiri', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Suma Part Indonesia', '1'),
('A1E005', 'Baut Roda Belakang Kanan Fuso', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:04', 1, '2021-10-17 17:50:04', 0, 0, 'Suma Part Indonesia', '1'),
('A1E006', 'Behel Belakang Fuso 10 Roda', '30 x 93 x 380', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:03', 1, '2021-10-17 17:50:03', 0, 0, 'Indo Multi Prima', '1'),
('A1E007', 'Behel Belakang Fuso 6 Roda', '30 x 83 x 500', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:03', 1, '2021-10-17 17:50:03', 0, 0, 'Indo Multi Prima', '1'),
('A1E008', 'Isi Power Rem Fuso 6 Roda', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:03', 1, '2021-10-17 17:50:03', 0, 0, 'Jaya Agung', '1'),
('A1E009', 'Kampas Koling Fuso', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:03', 1, '2021-10-17 17:50:03', 0, 0, 'Felix Jakarta', '1'),
('A1E010', 'Lampu Stop FN RH / LH', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:03', 1, '2021-10-17 17:50:03', 0, 0, 'Gabriel Motor', '1'),
('A1E011', 'Mika Lampu Stop Fuso FN Merah', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:03', 1, '2021-10-17 17:50:03', 0, 0, 'Gabriel Motor', '1'),
('A1E012', 'Mika Lampu Stop Fuso FN Kuning', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:03', 1, '2021-10-17 17:50:03', 0, 0, 'Gabriel Motor', '1'),
('A1E013', 'Seal Roda Belakang Dalam', 'MC 807438', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:03', 1, '2021-10-17 17:50:03', 0, 0, 'Best Store 87', '1'),
('A1E014', 'Power Rem Panjang Fuso', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:03', 1, '2021-10-17 17:50:03', 0, 0, 'Jaya Agung', '1'),
('A1E015', 'Power Rem Pendek Fuso', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:03', 1, '2021-10-17 17:50:03', 0, 0, 'Jaya Agung', '1'),
('A1E016', 'Nap Roda (Bekas)', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:03', 1, '2021-10-17 17:50:03', 0, 0, 'Mantap Jaya Auto Part', '1'),
('A1E017', 'Seal Roda Belakang Luar', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:03', 1, '2021-10-17 17:50:03', 0, 0, '', '1'),
('A1E018', 'Lahar Penindis Kopling', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:02', 1, '2021-10-17 17:50:02', 0, 0, '', '1'),
('A1E019', 'Dor Lock Fuso', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:02', 1, '2021-10-17 17:50:02', 0, 0, 'MJD Sparepart', '1'),
('A1E020', 'Swist Rem Fuso', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:02', 1, '2021-10-17 17:50:02', 0, 0, 'MJD Sparepart', '1'),
('A1E021', 'Pedal Rem Fuso', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:02', 1, '2021-10-17 17:50:02', 0, 0, '', '1'),
('A1E022', 'Filter Oli Fuso', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:02', 1, '2021-10-17 17:50:02', 0, 0, 'Sumber Rejeki', '1'),
('A1E023', 'Tiroad End', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:01', 1, '2021-10-17 17:50:01', 0, 0, 'MJD Sparepart', '1'),
('A1E024', 'Paku Kampas Fuso / Hino', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:01', 1, '2021-10-17 17:50:01', 0, 0, '', '1'),
('A1E025', 'Isi Power Koling Fuso', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:01', 1, '2021-10-17 17:50:01', 0, 0, '', '1'),
('A1E026', 'Gambiran Blok Fuso', 'GUIS 67', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:01', 1, '2021-10-17 17:50:01', 0, 0, 'MJD Sparepart', '1'),
('A1E027', 'Bak Rem Fuso Belakang', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:01', 1, '2021-10-17 17:50:01', 0, 0, '', '1'),
('A1E028', 'Baut Blok Kunci 24', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:01', 1, '2021-10-17 17:50:01', 0, 0, 'Alphin', '1'),
('A1E029', 'Baut Blok Kunci 19', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:01', 1, '2021-10-17 17:50:01', 0, 0, 'Alphin', '1'),
('A1E030', 'Baut Blok Kuci 22', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:01', 1, '2021-10-17 17:50:01', 0, 0, 'Alphin', '1'),
('A1E031', 'Baut Nap Kunci 22', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:01', 1, '2021-10-17 17:50:01', 0, 0, 'Alphin', '1'),
('A1E032', 'Kura-Kura Power Rem Fuso', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:00', 1, '2021-10-17 17:50:00', 0, 0, 'MJD Sparepart', '1'),
('A1E033', 'Dinamo Stater Fuso', 'PS190', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:00', 1, '2021-10-17 17:50:00', 0, 0, 'Yanhan Dieselindo', '1'),
('A1F001', 'Mata Gurinda Kipas Grit 80', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:00', 1, '2021-10-17 17:50:00', 0, 0, 'SKW Tools', '1'),
('A1F002', 'Mata Gurinda Kipas Grit 100', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:00', 1, '2021-10-17 17:50:00', 0, 0, 'SKW Tools', '1'),
('A1F003', 'Mata Gurinda Gosok', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:00', 1, '2021-10-17 17:50:00', 0, 0, '', '1'),
('A1F004', 'Mata Gurinda Gabus', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:00', 1, '2021-10-17 17:50:00', 0, 0, '', '1'),
('A1F005', 'Mata Gurinda Tipis', 'TAYO', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:00', 1, '2021-10-17 17:50:00', 0, 0, '', '1'),
('A1F006', 'Mata Gurinda 14 Tayo', 'TAYO', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:00', 1, '2021-10-17 17:50:00', 0, 0, '', '1'),
('A1F007', 'Mata Gurinda Tebal', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:50:00', 1, '2021-10-17 17:50:00', 0, 0, 'Surya Sakti', '1'),
('A1F008', 'Mata Blender No 2', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:59', 1, '2021-10-17 17:49:59', 0, 0, 'Surya Sakti', '1'),
('A1F009', 'Mata Blender No 3', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:59', 1, '2021-10-17 17:49:59', 0, 0, 'Surya Sakti', '1'),
('A1G001', 'Mpu 10', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:59', 1, '2021-10-17 17:49:59', 0, 0, 'Teknik Pratama', '1'),
('A1G002', 'Mpu 12', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:59', 1, '2021-10-17 17:49:59', 0, 0, 'Teknik Pratama', '1'),
('A1G003', 'Mpu 8', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:59', 1, '2021-10-17 17:49:59', 0, 0, 'Teknik Pratama', '1'),
('A1G004', 'Mpu 6', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:59', 1, '2021-10-17 17:49:59', 0, 0, 'Teknik Pratama', '1'),
('A1G005', 'Neppel Selang Gresse', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:59', 1, '2021-10-17 17:49:59', 0, 0, 'Suksses Store 123', '1'),
('A1G006', 'Neppel Gommok Lurus Wipro', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:59', 1, '2021-10-17 17:49:59', 0, 0, 'SKW Tools', '1'),
('A1G007', 'Sambungan T 12', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:58', 1, '2021-10-17 17:49:58', 0, 0, 'Teknik Pratama', '1'),
('A1G008', 'Elbow 12', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:58', 1, '2021-10-17 17:49:58', 0, 0, 'Teknik Pratama', '1'),
('A1G009', 'Sambungan T 10', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:58', 1, '2021-10-17 17:49:58', 0, 0, 'Teknik Pratama', '1'),
('A1G010', 'Sambungan Pu 12', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:58', 1, '2021-10-17 17:49:58', 0, 0, 'Teknik Pratama', '1'),
('A1G011', 'Sambungan 10', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:58', 1, '2021-10-17 17:49:58', 0, 0, 'Teknik Pratama', '1'),
('A1G012', 'Neppel Pu 12 Mm Drat 1/8', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:58', 1, '2021-10-17 17:49:58', 0, 0, 'Teknik Pratama', '1'),
('A1G013', 'Neppel Pu 12 Mm Drat 1/4', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:58', 1, '2021-10-17 17:49:58', 0, 0, 'Teknik Pratama', '1'),
('A1G014', 'Neppel Pu 10 Mm Drat 1/4', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:58', 1, '2021-10-17 17:49:58', 0, 0, 'Teknik Pratama', '1'),
('A1G015', 'Neppel Pu 10 Mm Drat 1/8', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:58', 1, '2021-10-17 17:49:58', 0, 0, 'Teknik Pratama', '1'),
('A1G016', 'Neppel Pu 12 Mm Drat 3/8', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:58', 1, '2021-10-17 17:49:58', 0, 0, 'Teknik Pratama', '1'),
('A1G017', 'Neppel Pu 12 Mm', 'DRAT 12', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:58', 1, '2021-10-17 17:49:58', 0, 0, 'Teknik Pratama', '1'),
('A1G018', 'Neppel Pu 10 Mm Drat 1/2', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:57', 1, '2021-10-17 17:49:57', 0, 0, 'Teknik Pratama', '1'),
('A1G019', 'Neppel Pu 10 Mm Drat 3/8', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:57', 1, '2021-10-17 17:49:57', 0, 0, 'Teknik Pratama', '1'),
('A1H001', 'Sekring 10 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:57', 1, '2021-10-17 17:49:57', 0, 0, '', '1'),
('A1H002', 'Sekring 20 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:57', 1, '2021-10-17 17:49:57', 0, 0, '', '1'),
('A1H003', 'Sekring 15 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, '', '1'),
('A1H004', 'Sekring 25 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, '', '1'),
('A1H005', 'Sekring 30 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, '', '1'),
('A1H006', 'Sekring 10 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Part Moto', '1'),
('A1H007', 'Sekring 15 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Part Moto', '1'),
('A1H008', 'Sekring 20 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Part Moto', '1'),
('A1H009', 'Sekring 25 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Part Moto', '1'),
('A1H010', 'Sekring 30 Amp', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Part Moto', '1'),
('A1I001', 'Filter Oli 10 Hidrolik', 'YN52V01016R600T', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Panca Benua Perkasa', '1'),
('A1I002', 'Filter Solar SK 200 / SK-330', 'VH23390E002OTI', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Panca Benua Perkasa', '1'),
('A1I003', 'Karet Caksing', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Tekido Grosir Eletronic', '1'),
('A1I004', 'Pompa Solar SK 200', 'VHS233041490', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Mitra Aneka Usaha', '1'),
('A1I005', 'Pompa Gommok', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Jasindo Teknik', '1'),
('A1I006', 'Pompa Air', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Crown Auto Part', '1'),
('A1I007', 'Seal Bucket', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Batangase', '1'),
('A1I008', 'Rakor Eksa SK 200', 'YN21P01068R100T', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Panca Benua Perkasa ', '1'),
('A1I009', 'Rakor Eka SK 200', 'YN21P01088R100T', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Panca Benua Perkasa ', '1'),
('A1I010', 'Seal Boom', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Batangase', '1'),
('A1I011', 'Seal Arm', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:56', 1, '2021-10-17 17:49:56', 0, 0, 'Batangase', '1'),
('A1I012', 'Selenoid', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'Panca Benua Perkasa', '1'),
('A1I013', 'Filter Udara SK-200', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, '', '1'),
('A1I014', 'Relay Stater', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, '', '1'),
('A1I015', 'Cupling Pompa SK-200', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'Panca Benua Perksasa', '1'),
('A1J001', 'Air Cok Hino, Fuso, Nissan ', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'MJD Sparepart', '1'),
('A1J002', 'Baut M 10 x 15', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'Multi Baja Fasteners', '1'),
('A1J003', 'Baut M 10 x 12', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'Multi Baja Fasteners', '1'),
('A1J004', 'Baut M 18 x 100', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'PT. Hasil Fastindo', '1'),
('A1J006', 'Baut Stabil Pendek M 18 x 100-12,9', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'Indo Multi Prima', '1'),
('A1J008', 'Baut Stabil Panjang M 18 x 270-12,9', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'Indo Multi Prima', '1'),
('A1J009', 'Balon Lampu H3 Osram 24V/70 Watt', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'MPS', '1'),
('A1J010', 'Balon Lampu H3 Standar 24V/70 Watt', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'Pusat Onderdil Grosir', '1'),
('A1J011', 'Balon Lampu H3 Twin Head 24V/70 Watt', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'Galaxi Automotif', '1'),
('A1J012', 'Balon Kontak 1 24V Twinhead', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'Brillian Acesories', '1'),
('A1J013', 'Balon Kontak 2 24V Twinhead', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'Brillian Acesories', '1'),
('A1J014', 'Cable Conector 35-50 Mm Betina', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:55', 1, '2021-10-17 17:49:55', 0, 0, 'Suryo Laris', '1'),
('A1J015', 'Conector Las Dkj 35-50 Jantan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, 'Suryo Laris', '1'),
('A1J016', 'Konektor Mesin Las 10-25 Betina', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, 'Pejuang Teknik Mandiri', '1'),
('A1J017', 'Konektor Mesin Las 10-25 Betina', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, 'Rhino Welding Official', '1'),
('A1J018', 'Extraktor Pembuka Baut', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, '', '1'),
('A1J020', 'Guh 72', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, 'MJD Sparepart', '1'),
('A1J021', 'Guh 73', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, 'MJD Sparepart', '1'),
('A1J022', 'Guh 75', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, 'MJD Sparepart', '1'),
('A1J023', 'Isi Pompa Solar Hino, Fuso, Nissan', '921210011', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, 'Jakarta Part 81', '1'),
('A1J024', 'Isi Pompa Solar Hino, Fuso, Nissan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, 'Jaya Agung', '1'),
('A1J025', 'Karet Kopling 19 Mm', '1310-0121', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, 'Multi Auto Part', '1'),
('A1J026', 'Karet Kopling 19 Mm Seiken', '721036', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, 'G.S.T Motor', '1'),
('A1J027', 'Karet Kopling 22 Mm', '1310-0109', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, 'Multi Auto Part', '1'),
('A1J028', 'Karet Kopling 22 Mm Seiken', '721027', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:54', 1, '2021-10-17 17:49:54', 0, 0, 'G.S.T Motor', '1'),
('A1J029', 'Kepala Aki', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Arif Mtr 88', '1'),
('A1J030', 'Karet Rem Belakang Hino & Fuso 6 Roda Seiken', 'SC 80133R', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Men Auto Part', '1'),
('A1J031', 'Karet Rem Hino & Fuso 10 Roda', 'SC 80209R', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Cemerlang Samudra', '1'),
('A1J032', 'Kabel Seri ', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Dr P. Fendy', '1'),
('A1J033', 'Kit Master Kopling Atas', '210-80831', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'SU 88 Motor', '1'),
('A1J034', 'Kit Master Kopling Atas', '80831-2', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Auto Jaya Mandiri', '1'),
('A1J035', 'Lampu H4 24V 100/90 Watt Standar', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Pusat Onderdil Grosir', '1'),
('A1J036', 'Lampu H4 24V 100/90 Watt Stainles', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Pusat Onderdil Grosir', '1'),
('A1J039', 'Neppel Solar ', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Aneka Hydraulick ', '1'),
('A1J040', 'Mur M 18 x 100', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'PT. Hasil Fastindo', '1'),
('A1J041', 'Piston Kopling 19 Mm Bawah ', '642-14602', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'MJD Sparepart', '1'),
('A1J042', 'Piston Kopling 22 Mm', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'MJD Sparepart', '1'),
('A1J043', 'Pompa Solar Denso ', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Jaya Agung', '1'),
('A1J044', 'Pompa Solar Suma ', 'ME 702224', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Suma Part Indonesiaa', '1'),
('A1J045', 'Pipa Rem 9 Mm Roll', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, '', '1'),
('A1J046', 'Pipa Rem 6 Mm Roll', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, '', '1'),
('A1J047', 'Ring Solar Tembaga 16', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Aan Japaris', '1'),
('A1J048', 'Ring Solar Tembaga 12 x 12', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Aan Japaris', '1'),
('A1J049', 'Ring Solar Tembaga  14 Mm', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Aan Japaris', '1'),
('A1J050', 'Ring Solar Karet 16', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Aan Japaris', '1'),
('A1J051', 'Selang Gress', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Perkakas Smart Indo', '1'),
('A1J052', 'Selang Gress', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, 'Sukses Store 123', '1'),
('A1J053', 'Skun 70', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:53', 1, '2021-10-17 17:49:53', 0, 0, '', '1'),
('A1J054', 'Sambungan Rantai RS 80', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'Victorindo Jaya Sentosa', '1'),
('A1J055', 'Tali Pto 4 Meter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'MJD Sparepart', '1'),
('A1J056', 'Tali Pto 6,5 Meter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'MJD Sparepart', '1'),
('A1J057', 'Tali Pto 7 Meter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'MJD Sparepart', '1'),
('A1J058', 'Ring Kampas Kopling Akab12\"', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'UD. Asia Baru', '1'),
('A1J059', 'Ring Kampas Kopling Akab14\"', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'UD. Asia Baru', '1'),
('A1J060', 'Ring Kampas Kopling Akab15\"', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'UD. Asia Baru', '1'),
('A1J061', 'Rivet 5 x 6 / Klem Kampas', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'UD. Asia Baru', '1'),
('A1J062', 'Rivet 5 x 8 / Klem Kampas', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'UD. Asia Baru', '1'),
('A1J063', 'Baut Solar ', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, '', '1'),
('A1J064', 'Baut Blok 22', '1218-27900', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'Olshop Lisa', '1');
INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `type_barang`, `jenis`, `stok_min`, `stok_max`, `satuan`, `stok`, `created_user`, `created_date`, `updated_user`, `updated_date`, `harga_beli`, `harga_jual`, `catatan`, `aktif`) VALUES
('A1J065', 'Baut Blok 19', '12018-27900', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'Olshop Lisa', '1'),
('A1J066', 'Baut Nap 24', 'MH001456', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'Olshop Lisa', '1'),
('A1J067', 'Baut Nap 19', 'MH001456', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'Olshop Lisa', '1'),
('A1J068', 'Baut Blok 24', '12018-27900', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'Olshop Lisa', '1'),
('A1J069', 'Baut As', 'MB293357', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 18:06:40', 0, 0, 'Olshop Lisa', '1'),
('A1J070', 'Tali Kompresor', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'Warung Perkakas', '1'),
('A1J071', 'Tiroad 14 x 14', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'MJD Sparepart', '1'),
('A1J072', 'Tiroad 12 x 12', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'MJD Sparepart', '1'),
('A1J073', 'Tiroad 8 x 8', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'MJD Sparepart', '1'),
('A1J075', 'Tiroad 6 x 6', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'MJD Sparepart', '1'),
('A1J076', 'Bor Tangan Fisch', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, '', '1'),
('A1J077', 'Kacamata Las', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, '', '1'),
('A1J078', 'Stand Kertas Gosok', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, '', '1'),
('A1J079', 'Isolasi Karet', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, '', '1'),
('A1J080', 'Bor Tangan Mailtangk', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, '', '1'),
('A1J081', 'Gurinda Tangan Mailtangk', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, '', '1'),
('A1J082', 'Tali Pto / Tongkang  3 Meter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:52', 1, '2021-10-17 17:49:52', 0, 0, 'Sparepart Jatim', '1'),
('A1J083', 'Tali Pto / Tongkang 3,5 Meter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, 'Sparepart Jatim', '1'),
('A1J084', 'Tali Pto / Tongkang 5 Meter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, 'Sparepart Jatim', '1'),
('A1J085', 'Tali Pto / Tongkang 5,5 Meter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, 'Sparepart Jatim', '1'),
('A1J086', 'Tali Pto / Tongkang 6 Meter', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, 'Sparepart Jatim', '1'),
('A1J087', 'Komprension CSS 0.35.70', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, 'Pak Fendy', '1'),
('A1J088', 'Kompersion CSS 0.70.70', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, 'Pak Fendy', '1'),
('A1J089', 'Karet Stabil / Dindong', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, 'Victor Jaya Auto', '1'),
('A1J090', 'Karet Stabil / Dindong', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, 'TD Motor', '1'),
('A1J091', 'Filter Oli Pic Up', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, '', '1'),
('A1J092', 'Baut Saringan', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, 'MG Grosir', '1'),
('A1J093', 'Rin Cincin', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, '', '1'),
('A1J094', 'Lampu H-3 Stainles', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, '', '1'),
('A1J095', 'Lampu Led', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, '', '1'),
('A1J096', 'Klem Selang', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, 'TSS Teknik', '1'),
('A1J097', 'Klem Selang 1/2', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, '', '1'),
('A1J098', 'Skun 25', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, '', '1'),
('A1J099', 'Skun 35', '', '', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:51', 1, '2021-10-17 17:49:51', 0, 0, '', '1'),
('A1J100', 'Gambiran Guis-66', '', 'xxxx', 5, 10, 'Pcs', 0, 1, '2021-10-17 17:49:50', 1, '2021-10-17 18:20:51', 0, 0, 'Non Jenis', '1'),
('B000001', 'cobacoba', 'coba', 'Oke', 0, 10, 'Pcs', 50, 1, '2021-10-17 18:22:08', 1, '2021-10-26 02:32:44', 1, 2, 'Ini catatan', '1'),
('Q000001', 'COBA-COBA 2', 'COBA', 'COBA', 3, 5, 'Pcs', 0, 1, '2021-10-23 14:30:32', 1, '2021-10-23 14:30:51', 5, 6, 'Ini catatan', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(3) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `hak_akses` enum('Admin','Pemilik Toko','Gudang') NOT NULL,
  `status` enum('aktif','blokir') NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `nama_user`, `password`, `email`, `telepon`, `foto`, `hak_akses`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin System', '21232f297a57a5a743894a0e4a801fc3', 'ratomi@gmail.com', '08114447788', NULL, 'Super Admin', 'aktif', '2021-02-06 12:03:35', '2021-10-11 19:05:28'),
(2, 'Pemilik Toko', 'Pemilik Toko', '1d0258c2440a8d19e716292b231e3190', '', '', NULL, 'Pemilik Toko', 'aktif', '2021-02-06 19:05:50', '2021-10-11 14:58:10');


-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_barang_asal`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_barang_asal` (
`asal` varchar(65)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_barang_jenis`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_barang_jenis` (
`jenis` varchar(65)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_barang_tujuan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_barang_tujuan` (
`tujuan` varchar(65)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_barang_asal`
--
DROP TABLE IF EXISTS `v_barang_asal`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_barang_asal`  AS  select `barang_masuk`.`asal` AS `asal` from `barang_masuk` where `barang_masuk`.`asal` <> '' group by `barang_masuk`.`asal` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_barang_jenis`
--
DROP TABLE IF EXISTS `v_barang_jenis`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_barang_jenis`  AS  select `tb_barang`.`jenis` AS `jenis` from `tb_barang` where `tb_barang`.`jenis` <> '' group by `tb_barang`.`jenis` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_barang_tujuan`
--
DROP TABLE IF EXISTS `v_barang_tujuan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_barang_tujuan`  AS  select `barang_keluar`.`tujuan` AS `tujuan` from `barang_keluar` where `barang_keluar`.`tujuan` <> '' group by `barang_keluar`.`tujuan` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `id_product` (`kode_barang`) USING BTREE,
  ADD KEY `created_user` (`created_user`) USING BTREE;
ALTER TABLE `barang_keluar` ADD FULLTEXT KEY `barang_keluar_tujuan` (`tujuan`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `id_product` (`kode_barang`) USING BTREE,
  ADD KEY `created_user` (`created_user`) USING BTREE,
  ADD KEY `updated_user` (`updated_user`);
ALTER TABLE `barang_masuk` ADD FULLTEXT KEY `barang_masuk_asal` (`asal`);

--
-- Indeks untuk tabel `barang_stok`
--
ALTER TABLE `barang_stok`
  ADD PRIMARY KEY (`kode_transaksi`) USING BTREE,
  ADD KEY `id_product_new` (`kode_barang`) USING BTREE,
  ADD KEY `created_user_new` (`created_user`) USING BTREE;

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `created_user` (`created_user`) USING BTREE,
  ADD KEY `updated_user` (`updated_user`) USING BTREE;
ALTER TABLE `tb_barang` ADD FULLTEXT KEY `tb_barang_nama` (`nama_barang`);
ALTER TABLE `tb_barang` ADD FULLTEXT KEY `tb_barang_jenis` (`jenis`);
ALTER TABLE `tb_barang` ADD FULLTEXT KEY `tb_barang_type` (`type_barang`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `level` (`hak_akses`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_fk1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_keluar_fk2` FOREIGN KEY (`created_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_fk1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_masuk_fk2` FOREIGN KEY (`created_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_masuk_fk3` FOREIGN KEY (`updated_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `barang_stok`
--
ALTER TABLE `barang_stok`
  ADD CONSTRAINT `barang_stok_fk1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_stok_fk2` FOREIGN KEY (`created_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_fk1` FOREIGN KEY (`updated_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_barang_fk2` FOREIGN KEY (`created_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
