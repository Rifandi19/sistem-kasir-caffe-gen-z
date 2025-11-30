-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Nov 2025
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

 /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
 /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
 /*!40101 SET @OLD_COLLATION_CONNECTION=@@OLD_COLLATION_CONNECTION */;
 /*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_kasir_caffe_gen_z`
--
CREATE DATABASE IF NOT EXISTS `sistem_kasir_caffe_gen_z`;
USE `sistem_kasir_caffe_gen_z`;

-- --------------------------------------------------------
-- 1. TABEL KATEGORI
-- --------------------------------------------------------

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `kategori` (`nama_kategori`) VALUES
('Makanan'),
('Minuman'),
('Snack');

-- --------------------------------------------------------
-- 2. TABEL PRODUK
-- --------------------------------------------------------

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga` decimal(12,2) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_produk`),
  KEY `id_kategori` (`id_kategori`),
  CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `produk` (`id_kategori`, `nama_produk`, `harga`, `gambar`) VALUES
(1, 'Nasi Goreng', 20000, 'nasi_goreng.jpg'),
(1, 'Mie Goreng', 15000, 'mie_goreng.jpg'),
(2, 'Es Teh Manis', 10000, 'es_teh.jpg'),
(2, 'Es Jeruk', 10000, 'es_jeruk.jpg'),
(3, 'Kentang Goreng', 10000, 'kentang.jpg'),
(3, 'Cireng Bumbu Rujak', 15000, 'cireng.jpg'),
(3, 'Nugget', 12000, 'nugget.jpg'),
(3, 'Sosis Bakar', 12000, 'sosis.jpg');

-- --------------------------------------------------------
-- 3. TABEL TRANSAKSI
-- --------------------------------------------------------

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `total_harga` decimal(12,2) NOT NULL,
  `metode_pembayaran` varchar(50) NOT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- 4. TABEL DETAIL TRANSAKSI
-- --------------------------------------------------------

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL AUTO_INCREMENT,
  `id_transaksi` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_satuan` decimal(12,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_detail`),
  KEY `id_transaksi` (`id_transaksi`),
  KEY `id_produk` (`id_produk`),
  CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- 5. TABEL METODE PEMBAYARAN
-- --------------------------------------------------------

CREATE TABLE `metode_pembayaran` (
  `id_metode` int(11) NOT NULL AUTO_INCREMENT,
  `nama_metode` varchar(50) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_metode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `metode_pembayaran` (`nama_metode`, `logo`) VALUES
('Cash', 'cash.png'),
('QRIS', 'qris.png'),
('Dana', 'dana.png'),
('Gopay', 'gopay.png'),
('OVO', 'ovo.png'),
('BCA', 'bca.png'),
('Mandiri', 'mandiri.png'),
('BNI', 'bni.png'),
('Permata Bank', 'permata.png');

COMMIT;

 /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
 /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
 /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
