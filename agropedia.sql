-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Des 2021 pada 00.25
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agropedia`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `nama_item` varchar(150) NOT NULL,
  `harga_per_item` varchar(20) NOT NULL,
  `satuan` varchar(40) NOT NULL,
  `min_pembelian` varchar(10) NOT NULL,
  `deskripsi_item` text NOT NULL,
  `foto_item_thumbnail` varchar(100) NOT NULL,
  `stok` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `komentar` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2021_10_16_200257_create_users_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_jenis_usaha`
--

CREATE TABLE `ms_jenis_usaha` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_jenis_usaha`
--

INSERT INTO `ms_jenis_usaha` (`id`, `nama`) VALUES
(1, 'HORTIKULTURA'),
(2, 'PERKEBUNAN'),
(3, 'TANAMAN PANGAN'),
(4, 'PERTERNAKAN'),
(5, 'KEHUTANAN'),
(6, 'BUDIDAYA IKAN'),
(7, 'PERIKANAN TANGKAP'),
(9, 'PENGOLAHAN'),
(10, 'LAINNYA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ms_komoditas`
--

CREATE TABLE `ms_komoditas` (
  `id` int(11) NOT NULL,
  `nama_komoditas` varchar(100) NOT NULL,
  `jenis_usaha_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ms_komoditas`
--

INSERT INTO `ms_komoditas` (`id`, `nama_komoditas`, `jenis_usaha_id`) VALUES
(1, '-', 0),
(2, 'ALPUKAT', 0),
(3, 'BAWANG DAUN', 0),
(4, 'BAYAM', 0),
(5, 'CABAI', 0),
(6, 'HORTIKULTURA LAINNYA', 0),
(7, 'JAGUNG', 0),
(8, 'KACANG TANAH', 0),
(9, 'KAKAO', 0),
(10, 'KANGKUNG', 0),
(11, 'KELAPA', 0),
(12, 'KENTANG', 0),
(13, 'KOPI', 0),
(14, 'PADI', 0),
(15, 'PERKEBUNAN LAINNYA', 0),
(16, 'SAYURAN LAINNYA', 0),
(17, 'SEMANGKA', 0),
(18, 'TANAMAN HIAS', 0),
(19, 'TANAMAN PANGAN LAINNYA', 0),
(20, 'TEBU', 0),
(21, 'TEH', 0),
(22, 'TERUNG', 0),
(23, 'TIMUN', 0),
(24, 'TOMAT', 0),
(25, 'UBI KAYU', 0),
(26, 'UMBI-UMBIAN', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `harga` varchar(11) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `sub_total` varchar(11) NOT NULL,
  `review` int(11) NOT NULL,
  `status_transaksi` enum('suksess','process','batal') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota_kab_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kecamatan_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_registrasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_lupa_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','register') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `no_hp`, `alamat`, `password`, `kota_kab_id`, `kecamatan_id`, `token_registrasi`, `token_lupa_password`, `status`, `created_at`, `updated_at`) VALUES
(100, 'Triastono Taufiq', 'triastonotaufiq35@gmail.com', '085848794941', 'Kedungwuni', '$2y$10$OpLfG7siPOknLqFyCViN6u2zw8NO718Gv2MTtYV7t/coffGFr4oiC', NULL, NULL, '$2y$10$QYY13AsThFyE21cxX27N3OtmD1I0jQpZjDXAV1Rvu.sfo686fW4AG', NULL, 'register', '2021-11-27 19:04:59', '2021-11-27 19:04:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ms_jenis_usaha`
--
ALTER TABLE `ms_jenis_usaha`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ms_komoditas`
--
ALTER TABLE `ms_komoditas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `ms_jenis_usaha`
--
ALTER TABLE `ms_jenis_usaha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `ms_komoditas`
--
ALTER TABLE `ms_komoditas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
