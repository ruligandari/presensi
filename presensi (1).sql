-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Bulan Mei 2023 pada 08.51
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_presensi`
--

CREATE TABLE `daftar_presensi` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mk` varchar(255) NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_keluar` time NOT NULL,
  `tanggal` date NOT NULL,
  `id_dosen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `daftar_presensi`
--

INSERT INTO `daftar_presensi` (`id`, `id_kelas`, `id_mk`, `jam_masuk`, `jam_keluar`, `tanggal`, `id_dosen`) VALUES
(11, 1, '3001', '20:58:00', '23:58:00', '2023-05-09', 1),
(12, 1, '2001', '08:30:00', '09:30:00', '2023-05-09', 1),
(13, 2, '2001', '22:07:00', '23:07:00', '2023-05-09', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nama`, `nip`, `email`, `password`) VALUES
(1, 'Dosen 1', '12345678', 'dosen1@gmail.com', '$2y$10$.9QXvNjswQP.Mvd/bK1CUOj3vgmHVuJzXCRL1pAvIMqweB5sH5Ff6'),
(2, 'Dosen 2', '1234567', 'dosen2@gmail.com', '$2y$10$MRbjVejc13cfGkhdPgrJp.ET0mDxetLYLVj5z10oIA97sX47uWzfe'),
(8, 'Pebi Pebriansah', '321022160200001', 'pebipebriansah160200@gmail.com', '$2y$10$u3/CDCFNCN7REGq3ts7WJeXDjBfSk7RdvAZuG6aQ6Gc4NU16j0RFO');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`) VALUES
(1, 'TI 2017 A'),
(2, 'TI 2017 B');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `jurusan` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL,
  `ttl` varchar(100) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `id_kelas`, `jurusan`, `jenis_kelamin`, `ttl`, `agama`, `alamat`) VALUES
('20180810025', 'Pebi Pebriansah', 1, 'Teknik Informatika', 'L', 'Majalengka 16-02-2000', 'Islam', 'Sukamanah'),
('20180810026', 'Ruli Gandari', 2, 'Teknik Informatika', 'L', 'Majalengka 16-02-2000', 'Kristen', 'SAKjkasdas'),
('2348098001', 'Livia', 1, 'Teknik Informatika', 'P', 'Majalengka 16-02-2000', 'Hindu', 'Sukamanah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id_mk` varchar(255) NOT NULL,
  `nama_mk` varchar(255) NOT NULL,
  `id_dosen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id_mk`, `nama_mk`, `id_dosen`) VALUES
('2001', 'Filsafat', '2'),
('3001', 'Matematika', '2'),
('3002', 'Matematika', '2'),
('3003', 'Matematika', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2023-03-16-174939', 'App\\Database\\Migrations\\DosenTable', 'default', 'App', 1678989399, 1),
(2, '2023-03-16-175739', 'App\\Database\\Migrations\\MahasiswaTabel', 'default', 'App', 1678989971, 2),
(3, '2023-03-16-180724', 'App\\Database\\Migrations\\PresensiTabel', 'default', 'App', 1678991068, 3),
(4, '2023-05-01-084555', 'App\\Database\\Migrations\\StaffTabel', 'default', 'App', 1682931203, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi`
--

CREATE TABLE `presensi` (
  `id_presensi` int(11) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mk` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `status` enum('hadir','tidak hadir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `presensi`
--

INSERT INTO `presensi` (`id_presensi`, `nim`, `id_kelas`, `id_mk`, `id`, `status`) VALUES
(1, '20180810025', 1, '3001', 11, 'tidak hadir'),
(2, '2348098001', 1, '3001', 11, 'tidak hadir'),
(3, '20180810025', 1, '2001', 12, 'tidak hadir'),
(4, '2348098001', 1, '2001', 12, 'tidak hadir'),
(5, '20180810026', 2, '2001', 13, 'tidak hadir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `staff`
--

CREATE TABLE `staff` (
  `id_staff` int(11) NOT NULL,
  `nama_staff` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `staff`
--

INSERT INTO `staff` (`id_staff`, `nama_staff`, `email`, `password`) VALUES
(1, 'Staff TU 1', 'stafftu1@gmail.com', '$2y$10$U5oDodWmTLVyRU7hp4bOuOTVqBCTYBa9VoF3pccKqMxv5X9u31Exa');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `daftar_presensi`
--
ALTER TABLE `daftar_presensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mk` (`id_mk`),
  ADD KEY `id_dosen` (`id_dosen`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `nip` (`nip`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id_mk`),
  ADD KEY `id_dosen` (`id_dosen`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `nim` (`nim`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mk` (`id_mk`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id_staff`),
  ADD UNIQUE KEY `id_staff` (`id_staff`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `daftar_presensi`
--
ALTER TABLE `daftar_presensi`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;