-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2026 at 01:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databaseperpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nama_admin` varchar(255) NOT NULL,
  `password` varchar(25) NOT NULL,
  `no_tlp` int(13) NOT NULL,
  `sebagai` enum('admin','petugas') NOT NULL,
  `kode_admin` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nama_admin`, `password`, `no_tlp`, `sebagai`, `kode_admin`) VALUES
(1, 'azis', '123', 0, 'admin', '1'),
(2, 'yuda', '111', 21, 'petugas', '2');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `cover` varchar(255) NOT NULL,
  `id_buku` varchar(20) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengarang` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun_terbit` date NOT NULL,
  `jumlah_halaman` int(11) NOT NULL,
  `buku_deskripsi` text NOT NULL,
  `isi_buku` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`cover`, `id_buku`, `kategori`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `jumlah_halaman`, `buku_deskripsi`, `isi_buku`) VALUES
('69844bc243eea.jpg', 'BK0001', 'novel bucin keren banget', 'Ongkek di Villa ', 'Haris Fadillah Syafei ', 'Firman', '2026-02-04', 2670, 'Sang Haris yang ongkek di villa', 'isi laporan sudah di revisi.pdf'),
('69844c01616d2.png', 'BK0002', 'sains', 'aman', 'ujnad', 'Firman', '2026-02-05', 11, 'tgdjhavsdgy', 'isi laporan sudah di revisi.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_buku`
--

CREATE TABLE `kategori_buku` (
  `kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_buku`
--

INSERT INTO `kategori_buku` (`kategori`) VALUES
('novel bucin keren banget'),
('sains');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `nisn` int(11) NOT NULL,
  `kode_member` varchar(12) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `kelas` varchar(5) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `no_tlp` varchar(15) NOT NULL,
  `tgl_pendaftaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`nisn`, `kode_member`, `nama`, `password`, `jenis_kelamin`, `kelas`, `jurusan`, `no_tlp`, `tgl_pendaftaran`) VALUES
(123, 'mem01', 'yuda', '$2y$10$pc7AlrLZnwvXQYdvn4xRAuJ1wxLqyTsra7KIKiCcEEPqb/MTlaNkO', 'Laki laki', 'X', 'Rekayasa Perangkat Lunak', '332', '2026-02-05'),
(12121, 'mem02', 'firman', '$2y$10$fNQN5TmTqjFVruWowS8KheAyH1OeOzLySqVAHPb0HC/nxXBx9iC8W', 'Laki laki', 'XII', 'Rekayasa Perangkat Lunak', '1231', '2026-02-05'),
(123133, 'mem03', 'penter', '$2y$10$msZKfb1UjHX.btL4GdE.uuiM/M/m5fAaWeSi8/GwJIc3VNwXYlxEG', 'Laki laki', 'XI', 'Desain Komunikasi Visual', '0881', '2026-02-05'),
(14621423, 'mem04', 'kipli', '$2y$10$7evx7.b7NlHil14fXwvKxuESmnGQ7suuIzCYU0nNPr6roZD/iG51e', 'Laki laki', '', 'Desain Pemodelan Informasi Bangunan', '09109', '2026-02-06');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_buku` varchar(20) NOT NULL,
  `nisn` int(11) NOT NULL,
  `nama_admin` varchar(255) NOT NULL,
  `tgl_peminjaman` date NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `bukti_transaksi` varchar(50) NOT NULL,
  `addres_norek` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_buku`, `nisn`, `nama_admin`, `tgl_peminjaman`, `tgl_pengembalian`, `status`, `harga`, `bukti_transaksi`, `addres_norek`) VALUES
(2, 'BK0001', 121, 'yuda', '2026-02-04', '2026-02-05', 'Waktu habis', 1250, 'koboi.jpg', '021'),
(4, 'BK0001', 121, 'yuda', '2026-02-05', '2026-02-06', 'Konfirmasi', 1250, 'laju.jpg', '231');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `kategori_buku`
--
ALTER TABLE `kategori_buku`
  ADD PRIMARY KEY (`kategori`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`nisn`,`kode_member`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
