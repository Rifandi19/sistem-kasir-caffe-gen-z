-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Nov 2025 pada 06.29
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem kasir caffe gen z`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail transaksi`
--

CREATE TABLE `detail transaksi` (
  `Id_Detail` int(11) NOT NULL,
  `Id_Transaksi` int(11) NOT NULL,
  `Id_Produk` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Harga_Satuan` decimal(12,2) NOT NULL,
  `Subtotal` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail transaksi`
--
ALTER TABLE `detail transaksi`
  ADD PRIMARY KEY (`Id_Detail`),
  ADD KEY `Id_Transaksi` (`Id_Transaksi`),
  ADD KEY `Id_Produk` (`Id_Produk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail transaksi`
--
ALTER TABLE `detail transaksi`
  MODIFY `Id_Detail` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
