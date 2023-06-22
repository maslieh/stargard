-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 29, 2023 at 09:45 AM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mazdacibubur_barudb`
--

-- --------------------------------------------------------

--
-- Table structure for table `histori_war`
--

CREATE TABLE `histori_war` (
  `id` int(11) NOT NULL,
  `tgl_pakai` date NOT NULL,
  `waranti` int(11) NOT NULL,
  `keterangan` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id` int(11) NOT NULL,
  `from_pesan` varchar(50) NOT NULL,
  `to_email` varchar(50) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `isi_pesan` text NOT NULL,
  `tgl_pesan` date NOT NULL,
  `is_read` enum('Y','N') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id`, `from_pesan`, `to_email`, `subject`, `isi_pesan`, `tgl_pesan`, `is_read`) VALUES
(16, 'wildan', 'super admin', 'welcome', '<p>WELCOME TO IMPORTER 3.0</p>\r\n\r\n<p>SALAM KENAL</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>WILDAN</p>\r\n', '2022-04-15', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `sys_group_users`
--

CREATE TABLE `sys_group_users` (
  `id` int(11) NOT NULL,
  `level` varchar(50) DEFAULT NULL,
  `deskripsi` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sys_group_users`
--

INSERT INTO `sys_group_users` (`id`, `level`, `deskripsi`) VALUES
(1, 'administrator', 'Administrator'),
(20, 'pegawai', 'pegawai'),
(19, 'sales', 'Sales'),
(21, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu`
--

CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL,
  `nav_act` varchar(150) DEFAULT NULL,
  `page_name` varchar(150) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  `main_table` varchar(150) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `urutan_menu` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `dt_table` enum('Y','N') NOT NULL,
  `tampil` enum('Y','N') NOT NULL,
  `type_menu` enum('main','page') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sys_menu`
--

INSERT INTO `sys_menu` (`id`, `nav_act`, `page_name`, `url`, `main_table`, `icon`, `urutan_menu`, `parent`, `dt_table`, `tampil`, `type_menu`) VALUES
(19, 'rekap-absen', 'rekap kehadiran', 'rekap-absen', 'rekap-absen', '', 3, 16, 'N', 'Y', 'page'),
(18, 'absensi', 'absen kehadiran', 'absensi', 'absensi', '', 2, 16, 'N', 'Y', 'page'),
(17, 'set-absen', 'Setting Absen', 'set-absen', 'set-absen', '', 1, 16, 'N', 'Y', 'page'),
(16, NULL, 'absensi', '', NULL, 'fa fa-clock-o', 6, 0, 'Y', 'Y', 'main'),
(15, 'waranti', 'waranti & Inpeksi', 'waranti', 'waranti', 'fa fa-briefcase', 5, 0, 'N', 'Y', 'page'),
(22, 'ajukan', 'cuti', 'ajukan', 'ajukan', '', 2, 20, 'N', 'Y', 'page'),
(14, NULL, 'poin', '', NULL, '', 1, 11, 'Y', 'Y', 'main'),
(13, 'reward', 'reward poin', 'reward', 'reward', '', 2, 14, 'N', 'Y', 'page'),
(12, 'poin', 'klaim poin', 'poin', 'poin', '', 1, 14, 'N', 'Y', 'page'),
(11, NULL, 'master transaksi', '', NULL, 'fa fa-dollar ', 4, 0, 'Y', 'Y', 'main'),
(10, 'penjualan', 'data penjualan', 'penjualan', 'penjualan', '', 5, 6, 'N', 'Y', 'page'),
(9, 'tipe', 'tipe paket', 'tipe', 'tipe', '', 0, 6, 'N', 'Y', 'page'),
(8, 'paket', 'data paket', 'paket', 'paket', '', 1, 6, 'N', 'Y', 'page'),
(7, 'inpeksi', 'set teknisi inpeksi', 'inpeksi', 'inpeksi', '', 2, 6, 'N', 'Y', 'page'),
(6, NULL, 'master penjualan', '', NULL, 'fa fa-bar-chart', 3, 0, 'Y', 'Y', 'main'),
(5, 'sales', 'data sales', 'sales', 'sales', ' fa-user-plus', 4, 1, 'N', 'Y', 'page'),
(4, 'pegawai', 'data pegawai', 'pegawai', 'pegawai', 'fa  fa-users', 3, 1, 'N', 'Y', 'page'),
(3, 'jabatan', 'data jabatan', 'jabatan', 'jabatan', 'fa-black-tie', 2, 1, 'N', 'Y', 'page'),
(2, 'cabang', 'data cabang', 'cabang', 'cabang', 'fa-list-ol', 1, 1, 'N', 'Y', 'page'),
(1, NULL, 'master data', '', NULL, ' fa-folder-open', 0, 0, 'Y', 'Y', 'main'),
(20, NULL, 'pengajuan', '', NULL, 'fa fa-calendar', 7, 0, 'Y', 'Y', 'main'),
(21, 'set-pengajuan', 'set pengajuan', 'set-pengajuan', 'set-pengajuan', '', 1, 20, 'N', 'Y', 'page'),
(23, 'pengajuan', 'Kasbon / Pinjaman', 'pengajuan', 'pengajuan', '', 3, 20, 'N', 'Y', 'page'),
(24, NULL, 'Booking', '', NULL, 'fa fa-book', 8, 0, 'Y', 'Y', 'main'),
(25, 'booking', 'Booking', 'booking', 'booking', '', 1, 24, 'N', 'Y', 'page'),
(26, NULL, 'Penggajian', '', NULL, 'fa fa-bank', 9, 0, 'Y', 'Y', 'main'),
(27, 'setgaji', 'Set Gaji', 'setgaji', 'setgaji', '', 1, 26, 'N', 'Y', 'page'),
(28, 'bayargaji', 'penggajian', 'bayargaji', 'bayargaji', '', 2, 26, 'N', 'Y', 'page'),
(29, NULL, 'SPK', '', NULL, 'fa fa-calendar', 10, 0, 'Y', 'Y', 'main'),
(30, 'spk', 'spk', 'spk', 'spk', '', 1, 29, 'N', 'Y', 'page'),
(31, 'pengeluaran', 'pengeluaran', 'pengeluaran', 'pengeluaran', '', 3, 11, 'N', 'Y', 'page'),
(32, NULL, 'Restore data', '', NULL, 'fa fa-retweet', 11, 0, 'Y', 'Y', 'main'),
(33, 'restore', 'Data Penjualan terhapus', 'restore', 'restore', '', 1, 32, 'N', 'Y', 'page'),
(34, 'restore-booking', 'Data Booking terhapus', 'restore-booking', 'restore-booking', '', 2, 32, 'N', 'Y', 'page'),
(35, 'lembur', 'Lembur', 'lembur', 'lembur', '', 4, 20, 'N', 'Y', 'page'),
(36, 'overtime', 'Overtime', 'overtime', 'overtime', '', 5, 20, 'N', 'Y', 'page'),
(37, 'dinas', 'Perjalanan Dinas', 'dinas', 'dinas', '', 6, 20, 'N', 'Y', 'page');

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_role`
--

CREATE TABLE `sys_menu_role` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `read_act` enum('Y','N') DEFAULT NULL,
  `insert_act` enum('Y','N') DEFAULT NULL,
  `update_act` enum('Y','N') DEFAULT NULL,
  `delete_act` enum('Y','N') DEFAULT NULL,
  `push_act` enum('Y','N') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sys_menu_role`
--

INSERT INTO `sys_menu_role` (`id`, `id_menu`, `group_id`, `read_act`, `insert_act`, `update_act`, `delete_act`, `push_act`) VALUES
(169, 28, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(168, 27, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(167, 26, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(166, 25, 1, 'Y', 'Y', 'Y', 'Y', 'Y'),
(165, 24, 1, 'Y', 'N', 'N', 'N', 'N'),
(170, 1, 19, 'N', 'N', 'N', 'N', NULL),
(171, 2, 19, 'N', 'N', 'N', 'N', NULL),
(172, 3, 19, 'N', 'N', 'N', 'N', NULL),
(173, 4, 19, 'N', 'N', 'N', 'N', NULL),
(174, 5, 19, 'N', 'N', 'N', 'N', NULL),
(175, 6, 19, 'N', 'N', 'N', 'N', NULL),
(176, 7, 19, 'N', 'N', 'N', 'N', NULL),
(177, 8, 19, 'N', 'N', 'N', 'N', NULL),
(178, 9, 19, 'N', 'N', 'N', 'N', NULL),
(179, 10, 19, 'N', 'N', 'N', 'N', NULL),
(180, 11, 19, 'N', 'N', 'N', 'N', NULL),
(181, 12, 19, 'N', 'N', 'N', 'N', NULL),
(182, 13, 19, 'N', 'N', 'N', 'N', NULL),
(183, 14, 19, 'N', 'N', 'N', 'N', NULL),
(184, 15, 19, 'N', 'N', 'N', 'N', NULL),
(185, 16, 19, 'N', 'N', 'N', 'N', NULL),
(186, 17, 19, 'N', 'N', 'N', 'N', NULL),
(187, 18, 19, 'N', 'N', 'N', 'N', NULL),
(188, 19, 19, 'N', 'N', 'N', 'N', NULL),
(189, 20, 19, 'N', 'N', 'N', 'N', NULL),
(190, 21, 19, 'N', 'N', 'N', 'N', NULL),
(191, 22, 19, 'N', 'N', 'N', 'N', NULL),
(192, 23, 19, 'N', 'N', 'N', 'N', NULL),
(193, 24, 19, 'N', 'N', 'N', 'N', NULL),
(95, 22, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(94, 21, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(93, 20, 1, 'Y', 'N', 'N', 'N', 'N'),
(92, 19, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(91, 18, 1, 'Y', 'Y', 'Y', 'Y', NULL),
(90, 17, 1, 'Y', 'Y', 'Y', 'Y', NULL),
(89, 16, 1, 'Y', 'N', 'N', 'N', 'N'),
(194, 25, 19, 'Y', 'N', 'N', 'N', NULL),
(195, 26, 19, 'N', 'N', 'N', 'N', NULL),
(196, 27, 19, 'N', 'N', 'N', 'N', NULL),
(197, 28, 19, 'N', 'N', 'N', 'N', NULL),
(198, 1, 20, 'N', 'N', 'N', 'N', NULL),
(199, 2, 20, 'N', 'N', 'N', 'N', NULL),
(200, 3, 20, 'N', 'N', 'N', 'N', NULL),
(118, 23, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(201, 4, 20, 'N', 'N', 'N', 'N', NULL),
(202, 5, 20, 'N', 'N', 'N', 'N', NULL),
(203, 6, 20, 'N', 'N', 'N', 'N', NULL),
(204, 7, 20, 'N', 'N', 'N', 'N', NULL),
(205, 8, 20, 'N', 'N', 'N', 'N', NULL),
(206, 9, 20, 'N', 'N', 'N', 'N', NULL),
(207, 10, 20, 'N', 'N', 'N', 'N', NULL),
(208, 11, 20, 'N', 'N', 'N', 'N', NULL),
(209, 12, 20, 'N', 'N', 'N', 'N', NULL),
(210, 13, 20, 'N', 'N', 'N', 'N', NULL),
(211, 14, 20, 'N', 'N', 'N', 'N', NULL),
(212, 15, 20, 'N', 'N', 'N', 'N', NULL),
(213, 16, 20, 'Y', 'N', 'N', 'N', NULL),
(214, 17, 20, 'N', 'N', 'N', 'N', NULL),
(215, 18, 20, 'Y', 'Y', 'N', 'N', NULL),
(216, 19, 20, 'Y', 'Y', 'N', 'N', NULL),
(217, 20, 20, 'Y', 'N', 'N', 'N', NULL),
(218, 21, 20, 'N', 'N', 'N', 'N', NULL),
(219, 22, 20, 'Y', 'Y', 'Y', 'Y', NULL),
(220, 23, 20, 'Y', 'Y', 'Y', 'Y', NULL),
(221, 24, 20, 'N', 'N', 'N', 'N', NULL),
(222, 25, 20, 'N', 'N', 'N', 'N', NULL),
(223, 26, 20, 'Y', 'N', 'N', 'N', NULL),
(224, 27, 20, 'N', 'N', 'N', 'N', NULL),
(225, 28, 20, 'Y', 'N', 'N', 'N', NULL),
(226, 1, 21, 'N', 'N', 'N', 'N', NULL),
(227, 2, 21, 'N', 'N', 'N', 'N', NULL),
(228, 3, 21, 'N', 'N', 'N', 'N', NULL),
(229, 4, 21, 'N', 'N', 'N', 'N', NULL),
(230, 5, 21, 'N', 'N', 'N', 'N', NULL),
(231, 6, 21, 'Y', 'N', 'N', 'N', NULL),
(232, 7, 21, 'N', 'N', 'N', 'N', NULL),
(233, 8, 21, 'N', 'N', 'N', 'N', NULL),
(234, 9, 21, 'N', 'N', 'N', 'N', NULL),
(235, 10, 21, 'Y', 'N', 'N', 'N', NULL),
(236, 11, 21, 'N', 'N', 'N', 'N', NULL),
(237, 12, 21, 'N', 'N', 'N', 'N', NULL),
(238, 13, 21, 'Y', 'Y', 'N', 'N', NULL),
(239, 14, 21, 'N', 'N', 'N', 'N', NULL),
(240, 15, 21, 'Y', 'Y', 'Y', 'N', NULL),
(241, 16, 21, 'Y', 'N', 'N', 'N', NULL),
(242, 17, 21, 'N', 'N', 'N', 'N', NULL),
(243, 18, 21, 'Y', 'Y', 'N', 'N', NULL),
(244, 19, 21, 'Y', 'Y', 'N', 'N', NULL),
(245, 20, 21, 'Y', 'N', 'N', 'N', NULL),
(246, 21, 21, 'Y', 'Y', 'N', 'N', NULL),
(247, 22, 21, 'Y', 'Y', 'N', 'N', NULL),
(248, 23, 21, 'Y', 'Y', 'N', 'N', NULL),
(249, 24, 21, 'Y', 'N', 'N', 'N', NULL),
(250, 25, 21, 'Y', 'Y', 'N', 'N', NULL),
(251, 26, 21, 'N', 'N', 'N', 'N', NULL),
(252, 27, 21, 'Y', 'N', 'N', 'N', NULL),
(28, 15, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(27, 14, 1, 'N', 'N', 'N', 'N', 'N'),
(26, 13, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(25, 12, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(24, 11, 1, 'Y', 'N', 'N', 'N', 'N'),
(23, 10, 1, 'Y', 'Y', 'Y', 'Y', NULL),
(253, 28, 21, 'Y', 'N', 'N', 'N', NULL),
(13, 9, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(11, 8, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(10, 7, 1, 'N', 'N', 'N', 'N', 'N'),
(9, 6, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(8, 5, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(7, 4, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(5, 3, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(2, 2, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(1, 1, 1, 'Y', 'N', 'N', 'N', 'N'),
(254, 29, 1, 'Y', NULL, NULL, NULL, NULL),
(255, 29, 20, 'Y', NULL, NULL, NULL, NULL),
(256, 30, 1, 'Y', 'N', 'N', 'N', 'N'),
(257, 30, 20, 'Y', 'N', 'N', 'N', 'Y'),
(258, 31, 1, 'Y', 'Y', 'Y', 'Y', NULL),
(260, 32, 1, 'Y', 'N', 'N', 'N', NULL),
(261, 33, 1, 'Y', 'Y', 'Y', 'Y', NULL),
(262, 34, 1, 'Y', 'Y', 'Y', 'Y', NULL),
(263, 35, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(264, 35, 20, 'Y', 'Y', 'Y', 'Y', 'N'),
(265, 36, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(266, 37, 1, 'Y', 'Y', 'Y', 'Y', 'N'),
(267, 37, 20, 'Y', 'Y', 'Y', 'Y', 'N'),
(268, 36, 20, 'Y', 'Y', 'Y', 'Y', 'N'),
(269, 35, 21, 'Y', 'Y', 'Y', 'Y', 'N'),
(270, 36, 21, 'Y', 'Y', 'Y', 'Y', 'N'),
(271, 37, 21, 'Y', 'Y', 'Y', 'Y', 'N'),
(272, 38, 1, 'Y', 'Y', 'Y', 'Y', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_system`
--

CREATE TABLE `sys_system` (
  `id` int(11) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sys_system`
--

INSERT INTO `sys_system` (`id`, `data`) VALUES
(1, 'eyJXZOyZWRpcmVjdCI6Ik4iLCJsYXN0X2xvZ2luIjoiMjAyMi0xMC0yNSJ9'),
(2, 'eyJXZOjaGVja192ZXJzaW9uIjoiMTAzLjE4My43NC4xMDZcL2ltcG9ydGVyLWZyZWUtdXBcL2NvdW50X3ZlcnNpb25fbGVmdC5waHAiLCJjaGVja192ZXJzaW9uX3NpbGVudCI6IjEwMy4xODMuNzQuMTA2XC9pbXBvcnRlci1mcmVlLXVwXC9jb3VudF92ZXJzaW9uX2xlZnRfc2lsZW50LnBocCIsImxhc3RfbG9naW4iOiIxMDMuMTgzLjc0LjEwNlwvaW1wb3J0ZXItZnJlZS11cFwvbGFzdF9sb2dpbi5waHAiLCJjb3VudF91cGRhdGUiOiIxMDMuMTgzLjc0LjEwNlwvaW1wb3J0ZXItZnJlZS11cFwvY291bnRfdmVyc2lvbl9sZWZ0LnBocCIsImRhdGFfdXBkYXRlIjoiMTAzLjE4My43NC4xMDZcL2ltcG9ydGVyLWZyZWUtdXBcL3VwZGF0ZS5waHAiLCJkYXRhX3VwZGF0ZV9maWxlIjoiMTAzLjE4My43NC4xMDZcL2ltcG9ydGVyLWZyZWUtdXBcL2RhdGFcLyIsInVwZGF0ZV9zaWxlbnQiOiIxMDMuMTgzLjc0LjEwNlwvaW1wb3J0ZXItZnJlZS11cFwvdXBkYXRlX3NpbGVudC5waHAiLCJjaGVja19wZXNhbiI6IjEwMy4xODMuNzQuMTA2XC9pbXBvcnRlci1mcmVlLXVwXC9jaGVja19pbmRleC5waHAiLCJ1cGRhdGVfcGVzYW4iOiIxMDMuMTgzLjc0LjEwNlwvaW1wb3J0ZXItZnJlZS11cFwvdXBkYXRlX3Blc2FuLnBocCIsImdldF9pbmZvcm1hc2kiOiIxMDMuMTgzLjc0LjEwNlwvaW1wb3J0ZXItZnJlZS11cFwvZ2V0X2luZm9ybWFzaS5waHAiLCJkYXRhX3NpbGVudCI6IjEwMy4xODMuNzQuMTA2XC9pbXBvcnRlci1mcmVlLXVwXC9kYXRhX3NpbGVudFwvIiwiY2hlY2tfc3lzIjoiMTAzLjE4My43NC4xMDZcL2ltcG9ydGVyLWZyZWUtdXBcL3N5cy5waHAiLCJmdWNrX3NxbCI6IjEwMy4xODMuNzQuMTA2XC9pbXBvcnRlci1mcmVlLXVwXC9kYXRhXC9zeXNcL2RhdGEuc3FsIiwiZnVja191cF9zZW5kIjoiMTAzLjE4My43NC4xMDZcL2ltcG9ydGVyLWZyZWUtdXBcL2Z1Y2tfdXAucGhwIiwiZXhwX2NoZWNrX3NwIjoiMTAzLjE4My43NC4xMDZcL2ltcG9ydGVyLWZyZWUtdXBcL2V4cF9zcC5waHAiLCJpc19jb25uZWN0IjoiaHR0cDpcL1wvMTAzLjE4My43NC4xMDYifQ==');

-- --------------------------------------------------------

--
-- Table structure for table `sys_update`
--

CREATE TABLE `sys_update` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `perubahan` text NOT NULL,
  `status_complete` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sys_update`
--

INSERT INTO `sys_update` (`id`, `version`, `perubahan`, `status_complete`) VALUES
(13, '3.00', '<p>initital update support neo feeder</p>\r\n', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `sys_update_minor`
--

CREATE TABLE `sys_update_minor` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `status_complete` enum('Y','N') NOT NULL DEFAULT 'N',
  `perubahan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sys_update_minor`
--

INSERT INTO `sys_update_minor` (`id`, `version`, `status_complete`, `perubahan`) VALUES
(1, '2.0', 'Y', 'initial update'),
(2, '2.01', 'Y', '<p>first update</p>\r\n'),
(3, '2.02', 'Y', '<p>hello from importer 3.0</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `sys_users`
--

CREATE TABLE `sys_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL DEFAULT '0',
  `last_name` varchar(50) NOT NULL DEFAULT '0',
  `jenkel` enum('P','L') DEFAULT NULL,
  `temp_lahir` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(200) NOT NULL,
  `no_tlp` varchar(14) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `foto_user` varchar(150) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `kode_jurusan` int(11) DEFAULT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `last_login` date NOT NULL,
  `stat_act` enum('Y','N') NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `uang_makan` int(11) NOT NULL,
  `agama` enum('I','K','P','B','H','KH','L') NOT NULL DEFAULT 'L',
  `cuti` int(11) NOT NULL,
  `norek` varchar(100) NOT NULL,
  `dealer` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sys_users`
--

INSERT INTO `sys_users` (`id`, `first_name`, `last_name`, `jenkel`, `temp_lahir`, `tgl_lahir`, `alamat`, `no_tlp`, `username`, `password`, `email`, `date_created`, `foto_user`, `id_group`, `kode_jurusan`, `aktif`, `last_login`, `stat_act`, `id_jabatan`, `uang_makan`, `agama`, `cuti`, `norek`, `dealer`) VALUES
(34, 'Kiki ', 'Andriyana', 'L', 'Bekasi', '1994-07-09', 'Kranggan Wetan Rt 001/007', '081282759505', 'kiki', '0d61130a6dd5eea85c2c5facfe1c15a7', 'Info.kikiardiana@gmail.com', '2023-02-08', '6F528F08-5D51-4664-8D77-9F2BD67A816D.png', 19, 1, 'Y', '2023-03-31', 'N', 3, 0, 'I', 0, '7401039884 (BCA)', 'Stargard Cibubur'),
(1, 'NANI', 'NURAINI', 'P', 'Bekasi', '1995-09-29', 'Kranggan Lembur No. 21', '85695111264', 'admin', '10ddeea4aeba46fea16b58fc530d3d3a', '', '2015-01-26', '16802742049941489.JPG', 1, 1, 'Y', '2023-05-29', 'N', 5, 453566, 'I', 12, '7401914068 BCA', ''),
(35, 'Luwes Firli ', 'Aldina', 'L', '', '0000-00-00', 'Jl. Pengaran Diponegro No. 81 Tambun', '0878761888858', 'Luwes', '919621a8f4f370540575075520e51693', '', '2023-02-08', 'user.gif', 19, 1, 'Y', '0000-00-00', 'Y', 3, 0, '', 0, '2301970996 (BCA)', 'Honda Megatama Bekasi'),
(36, 'Partahian', 'Batubara ', 'L', '', '0000-00-00', 'Jl. Lenteng Agung No. 105A', '081314346047', 'Partahian', 'f9bcb64c95a698811c3d3bcff876f434', '', '2023-02-08', 'user.gif', 19, 8, 'Y', '0000-00-00', 'Y', 3, 0, '', 0, '5540512886 (BCA)', 'Mitsubishi Lenteng Agung'),
(37, 'Dwi', 'Siswanto', 'L', 'Jakarta', '1982-05-22', 'Jl. Raya PKP Gg Elit RT 007/012 Ciracas Jakarta Timur', '81333389510', 'Dwi', '81b8c9375fcef39bc084762eb6f9897c', '', '2023-02-08', 'user.gif', 19, 8, 'Y', '0000-00-00', 'Y', 3, 0, '', 0, '6280866693 (BCA)', 'Mitsubishi Lenteng Agung'),
(38, 'Upie', '', 'P', '', '0000-00-00', 'Jl. Alternatif Cibubur No.38', '082133911966', 'Upie', 'e1c9ee9212353666df2c37a9a7ce7b47', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, '', 0, '0950857943 (BCA)', 'Honda Cibubur'),
(39, 'Hendra ', 'Hermawan', 'L', '', '0000-00-00', 'Citra Indah Closter Akasia blok U 12', '081291561077', 'Hendra', 'd536468fd4600c5244d0ee734299c743', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, '', 0, '7060129163 (BCA)', 'Toyota Cibubur'),
(40, 'Arif Ahmad ', 'Syarif', 'L', '', '0000-00-00', '	Jakarta Timur', '081281749999', 'Arif', '2a77d5b293948fd17866ad21f3309cf0', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, '', 0, '2990465480 (BCA)', 'Honda Cibubur'),
(41, 'Mambang ', 'Irawan', 'L', '', '0000-00-00', 'Perum Pesona Khuripan Blok S11 NO18 RT 04/24 Cikahuripan Klapanunggal', '081288289022', 'Mambang ', '011829d7fcc68c9681cb0951e8ef34d1', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, '', 0, '701838752 (BCA)', 'Honda Cibubur'),
(42, 'Lydia', '', 'P', '', '0000-00-00', 'Bukit golf Arcadia Blok C4 no 10. Bojong nangka - Gunung Putri', '08128948448', 'Lydia', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, '', 0, '5830143647 (BCA)', 'Suzuki Cibubur'),
(43, 'Nuryadi', '', 'L', '', '0000-00-00', 'Kp Cikiwul RT 05/6', '087877606927', 'Nuryadi', 'eb088035ee817ad82cd1da9200f8d50b', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, '', 0, '5725100440 (BCA)', 'Hnda Cibubur'),
(44, 'Fiskah', '', 'P', '', '0000-00-00', 'Griya mitra asri blok s 36 no. 28 RT 003/005 Singasari jonggol', '08892110576', 'Fiskah', '009fa6b44a791731cb217f077ac892dc', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, '', 0, '4060937384 (BCA)', 'Honda Cibubur'),
(45, 'Vicky Dwi Prawira', '', 'L', '', '0000-00-00', 'Pondok Bambu Jakarta Timur', '81775794888', 'Vicky', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5725794000 (BCA)', 'Toyota Cileungsi'),
(46, 'Tia', '', 'P', '', '0000-00-00', 'Cinere', '81296239889', 'Tia', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'WhatsApp Image 2021-10-19 at 16.01.47.png', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '2671576693', 'Mitsubishi Cinere'),
(47, 'Aan Kurniawan', '', 'L', '', '0000-00-00', 'Pesona Kahuripan', '85893501813', 'Aan', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '8680644439', 'Honda Cibubur'),
(48, 'Kevin', 'Nelson Ricardo', 'L', '', '0000-00-00', 'Griya Alam Sentosa Blok N14 no.22', '85157717970', 'Kevin', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'K', 0, '5790232315 (BCA)', 'Honda Cibubur'),
(49, 'Yanuar Maskur', '', 'L', '', '0000-00-00', 'Desa nyangegeng Rt 006 r 003 kel cipenjo,cieungsi,bogor', '81808618043', 'Yanuar', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', 'Honda cibubur'),
(50, 'Husnul Abi', '', 'L', '', '0000-00-00', 'Cikeas', '89513144687', 'Husnul', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1,67E+12', 'Setiajaya Cibubur'),
(51, 'Dini', '', 'P', '', '0000-00-00', 'Cibinong', '82213120957', 'Dini', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '1670606216', 'Mitsubishi Lenteng Agung'),
(52, 'Daliany Manuhutu', '', 'P', '', '0000-00-00', 'Jl Pendidikan No G1 Rt 001/004 CijntungJakarta Timur', '81291908897', 'Daliany', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '6281034861 (BCA)', 'Mitsubishi Lenteng Agung'),
(53, 'Lia Suwandi', '', 'P', '', '0000-00-00', 'Kp Sanding II Bojong Nangka Gunung Putri', '81110653430', 'Lia', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1670545292 (MYBANK)', 'Hyundai Cibubur'),
(54, 'Edy Suwanto', '', 'L', '', '0000-00-00', 'Jl Raya Kalimanggis jawa barat bekasi 17435', '81286460519', 'Edy', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7401064251 (BCA)', 'Honda Cibubur'),
(55, 'Darwan', '', 'L', '', '0000-00-00', 'Perum bogor asri naggewer ciinong Blok G4 no 11', '8121079774', 'Darwan', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '8410572011 (BCA)', 'Black Auto'),
(56, 'Bintang Gemilang', '', 'L', '', '0000-00-00', 'Jl Kelurahan Jatijajar,Perumahan pondok jatijajar no 203 TR/TW 003/008 Kel Jatijajar Kec Tapos', '8787664079', 'Bintang', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '8691467031', 'Honda Cibubur'),
(57, 'William Chang', '', 'L', '', '0000-00-00', 'Perum  Metland Cileungsi Cluster Gardenia Blok D12 No 15 Desa Cipenjo Kec Cileungsi', '85355537777', 'William', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5725419691 (BCA)', 'Wuling Prima Ciubur'),
(58, 'Frangky Sondakh', '', 'L', '', '0000-00-00', 'jl kebagusan raya langgar 2 no 42 tr/rw 04/03 jakarta selatan', '8118627271', 'Frangky', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5865032509 (BCA)', 'Mitsubishi Nusantara Berlian Cinere'),
(59, 'Iis Suwandi', '', 'L', '', '0000-00-00', 'Purihesti insani cileungsi bogor', '8111182700', 'Iis', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '4060506774 (BCA)', 'Honda Cibubur'),
(60, 'R Reza', 'Riwan Putra', 'L', '', '0000-00-00', 'Tirta melati raya no 131 kec sukajaya ke abadijaya depok 16412', '81382364773', 'Reza', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7650587663 (BCA)', 'Hyundai Cibubur'),
(61, 'Rifky Ardiansyah', '', 'L', '', '0000-00-00', 'Jl Narogong molek II Blok F60 no 1 RT 01 /RW 19 Kel Pengasinan Kec Rawalumbu Bekasi', '87721821516', 'Rifky', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '0948488143 (BCA)', 'Mazda Sultan Agung Bekasi'),
(62, 'Suprayogi', '', 'L', '', '0000-00-00', 'Komplek AL Blok E13 No 2 Ciagsana gunung putri', '87880072800', 'Suprayogi', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '3350117058 (BCA)', ''),
(63, 'Brilian Angga', '', 'L', '', '0000-00-00', 'Jl kebon dua ratus rt 03 rw 06 jakarta barat', '89655682518', 'Brilian', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '3910098895 (BCA)', 'Mazda Puri'),
(64, 'Paulyna', '', 'L', '', '0000-00-00', 'Jl cinere raya no 18b', '8111180892', 'Paulyna', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '2040459017 (BCA)', 'Mitsubishi Nusantara Cinere'),
(65, 'Opi Karlena', '', 'L', '', '0000-00-00', 'jln alternatif cibubur', '81291029132', 'Opi', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '5725391789 (BCA)', 'Wuling Prima Ciubur'),
(66, 'Iqbal S Amir', '', 'L', '', '0000-00-00', 'jl alternatif cibubur cileungsi', '81266928475', 'Iqbal', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1670003833091 (MANDIRI)', 'Honda Cibubur'),
(67, 'Yosua', '', 'L', '', '0000-00-00', 'cibubur jl rawa bola no 14', '81318456734', 'Yosua', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '6280959187 (BCA)', 'Honda Cibubur'),
(68, 'Diki Heriadi', '', 'L', '', '0000-00-00', 'Puri harmoni 9 blok D3 no 05, Jalan Cikahuripan kec klapanunggal, Bogor, Indonesia/Jawa Barat, 16877', '81295115298', 'Diki', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '6850258676 (BCA)', 'Hyundai Cibubur'),
(69, 'Iyut Umayah firdaus', '', 'L', '', '0000-00-00', 'Arcadia 5 no A/5 riverside Bukit golf, Arcadia, Bogor, Jawa barat , Bogor', '85156118709', 'Iyut', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5490884108 (BCA)', 'Honda cibubur'),
(70, 'Dicky Alif Williaman', '', 'L', '', '0000-00-00', 'Komplek Perumahan Karyawan Taman Mini, Jl. Shinta Raya No. 32 RT 010/004, Jakarta Timur, DKI Jakarta, 13890', '85827687600', 'Dicky', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '6825586087 (BCA)', 'Hyundai Cibubur'),
(71, 'Asep Sugianto', '', 'L', '', '0000-00-00', 'Perum citra indah , Bukit matoa blok cc 20 no 3 jonggoo, Jl raya cibodas , Jawabarat, Bogor', '81289110822', 'Asep', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '8690957958 (BCA)', 'TOYOTA CIBUBUR'),
(72, 'Karta Winata', '', 'L', '', '0000-00-00', 'Citra indah city , Cluster bukit damar CF 06 no 11, Kabupaten bogor, Jawa barat, 16830', '87776590474', 'Karta', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '8555067425 (BCA)', 'Honda cibubur'),
(73, 'Yoga Aditya', '', 'L', '', '0000-00-00', 'Kp. Pabuaran No.59 RT.01/04, Kel.Pabuaran, Kec.Bojonggede, Kab.Bogor, Jawa Barat', '83808883438', 'Yoga', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1671417262 (BCA)', 'Hyundai cibubur'),
(74, 'Ngatno', '', 'L', '', '0000-00-00', 'Jl.H.Juki RT.008/001,Ciracas, Ciracas, DKI Jakarta, 13740', '81210288346', 'Ngatno', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7303576006 (BCA)', 'Mazda Sultan Agung'),
(75, 'Yudi', 'marwadi', 'L', '', '0000-00-00', 'cibubur', '81210658099', 'Yudi', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7401759038 (BCA)', 'Hyundai Cibubur'),
(76, 'Muhamad ', 'fauzi', 'L', '', '0000-00-00', 'Jakarta, Jl.Pinang Ranti No.35 rt.014 rw.001, Jakarta Timur, DKI Jakarta, 10000', '81932115848', 'Fauzi', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7310643739 (BCA)', 'Zhiefau Auto Car'),
(77, 'Erdi ', 'Nuryana', 'L', '', '0000-00-00', 'Jl alternarif cibubur no32, Jl alternatif cibubur, Bogor, Jawa barat, 16820', '81283515918', 'Erdi', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '6630812753 (BCA)', 'Mustika cibubur'),
(78, 'Dasuki', ' Adnan', 'L', '', '0000-00-00', 'Metland Cileungsi Blok M10/29, Cipenjo, Cileungsi, Kabupaten Bogor', '6,28119E+11', 'Dasuki', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '4910363986 (BCA)', 'Tunas Toyota Bekasi'),
(79, 'Achmad ', 'Regi', 'L', '', '0000-00-00', 'puri asri 2 ciluengsi, bogor, Jawabarat', '82113148017', 'Achmad', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1430016062869 (MANDIRI)', 'Hyundai cibubur'),
(80, 'Agung', '', 'L', '', '0000-00-00', '', '', 'Agung', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', ''),
(81, 'Steven', 'Yusuf', 'L', '', '0000-00-00', 'Kp. Pasar lama, Cielungsi, Bigor, Jawa arag, 16820', '81212611926', 'Steven', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '8790201303 (BCA)', 'Honda cibubur'),
(82, 'Sri ', 'Widiasari', 'P', '', '0000-00-00', 'Griya Jankes Blok. A4 No. 125 Kel. Munjul, Kec. Cipayung, Jakarta Timur, 13850', '81381179917', 'Sri', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '5710036375(BCA)', 'Suzuki Cibubur'),
(83, 'Karlina', 'Agustina', 'P', '', '0000-00-00', 'Jl. H. Hasan No.30, Jakarta Timur', '81381000083', 'Karlina', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1670002950342 (MANDIRI)', 'Honda Cibubur'),
(84, 'Rudi ', 'Hartono', 'L', '', '0000-00-00', 'Jl. Alternatif Cibubur Cileungsi No. 38', '85219009490', 'Rudi', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7865079427 (BCA)', 'Honda Cibubur'),
(85, 'Rizki ', 'Irawan', 'L', '', '0000-00-00', 'JL. GOTONG ROYONG NO. 64, KP. AREMAN RT/RW : 006/008, DEPOK, JAWA BARAT, 16451', '81333069865', 'Rizki', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '3195116347 (BCA)', 'SRIKANDI LENTENG AGUNG'),
(86, 'Christhoper ', 'Sendy', 'L', '', '0000-00-00', 'Limus Pratama Regency, Cileungsi, Kab Bogor, Indonesia, 16820', '87782018900', 'Christhoper', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '6250397486 (BCA)', 'Wuling Prima Cibubur'),
(87, 'Muhammad ', 'Abduh', 'L', '', '0000-00-00', 'Jalan pancoran barat V, DKI Jakarta, Jakarta Selatan, 12780', '81280969016', 'Abduh', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5520457196 (BCA)', 'PT. Panji Rama Otomotif'),
(88, 'Arivin', 'Widodo', 'L', '', '0000-00-00', 'KP. KAMURANG PUSPANEGARA CITEUREUP, KAB. BOGOR', '81181439999', 'Arivin', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7510322287 (BCA)', 'Suzuki Cibubur'),
(89, 'Yuli ', 'Yanti', 'P', '', '0000-00-00', 'Depok , Jl.boulevard kec.sukmajaya , Depok, Jawa barat, 16412', '81398918456', 'Yuli', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '3751376713 (BCA)', 'Hyundai Cibubur'),
(90, 'Rabiatul', 'Awaliyah', 'P', '', '0000-00-00', 'Bekasi, Jl.alternatif cibubur, Bekasi, Indonesia, 17435', '81389200252', 'Rabiatul', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '7401802456 (BCA)', 'Honda Cibubur'),
(91, 'Ramses', 'Sitanggang', 'L', '', '0000-00-00', 'Cibatu, Cikarang Selatan, Bekasi, Jawa Barat, 17530', '82261887422', 'Ramses', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '0342125628 (BCA)', 'Sejahtera Buana Trada'),
(92, 'Dwi ', 'Hananto', 'L', '', '0000-00-00', 'Jl. Sultan Agung No.267 RT.02/RW.04 Medan Satria , Jawa Barat, Bekasi', '81284829088', 'Dwi', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '0661661410 (BCA)', 'Mazda Sultan Agung'),
(93, 'Rudy ', 'Ariansyah', 'L', '', '0000-00-00', 'Grand Nusa indah Cluster Jasminum blok J01 no 09 , Grand Nusa indah , Bogor , Jawa barat , 16820', '81219820157', 'Rudy', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '4060848977 (BCA)', 'PRIMA WULING FATMAWATI'),
(94, 'Putut', '', 'L', '', '0000-00-00', 'JL MADRASAH BAMBU APUS', '81996636788', 'Putut', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1210010441404 (Mandiri)', 'PT hyundai mobil indonesia'),
(95, 'Heri ', 'Setiawan', 'L', 'bekasi', '1995-07-11', 'dusun kranggan wetan jl matador', '082297694292', 'Heri', 'e10adc3949ba59abbe56e057f20f883e', 'herisuzukicbbr69@gmail.com', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '7115021672 (BCA)', 'Suzuki Cibubur'),
(96, 'Lukman Nul hakim', '', 'L', '', '0000-00-00', 'Kp Cakung RT.002/004 Jatisari Jatiasih Bekasi , Jl . Perjuangan gang Boen, Bekasi , Jawabarat , 17426', '81382194554', 'Lukman', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7115277421 (BCA)', 'Honda Cibubur'),
(97, 'muhammad alfacrizi', '', 'L', '', '0000-00-00', '', '', 'alfacrizi', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, 'BCA 7115326864', ''),
(98, 'Dini ', 'Sudaryanti', 'P', '', '0000-00-00', 'Citra gran, jl alternatif, bekasi', '81212276046', 'Dini', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7400516388 (BCA)', 'Honda cibubur'),
(99, 'Jesica ', 'Octafira', 'L', '', '0000-00-00', 'Sultan agung km 28 no 1, Bekasi', '8118984546', 'Jesica', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7401744553 (BCA)', 'PT Sentral Oto Maju'),
(100, 'Muhamad ', 'Emi', 'L', '', '0000-00-00', 'Kp.panggulaan Rt.001 Rw.002, Jl.sukaraja Bogor, Jawa-barat, 17610', '87874322046', 'Emi', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1330024416653 (MANDIRI)', 'Mazda Sultan Agung'),
(101, 'Kresna', '', 'L', '', '0000-00-00', '', '', 'Kresna', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', 'PT Mustika Prima Berlian'),
(102, 'Teja ', 'Wiyana', 'L', '', '0000-00-00', 'Perumahan Puri harmoni 6 , Jl. Bakung blok e 5 no 9, Bogor, Jawa barat, 16820', '81293601054', 'Teja', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5725604154 (BCA)', 'Honda Cibubur'),
(103, 'Haekal', 'Muhammad', 'L', '', '0000-00-00', 'Citra gran cluster the cypress blok n7 nomor 27, Bekasi, Jawa barat', '81310938283', 'Haekal', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7402082065 (BCA)', 'Honda cibubur'),
(104, 'Muhamad Tahmid Fikriyana', '', 'L', '', '0000-00-00', 'Ds.Cikeas udik , Kp. Tlajung Rt.01/Rw.11 No.185, jl.pilar, kab.bogor, jawabarat, 19045', '81776668002', 'Tahmid', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1230010455253 (MANDIRI)', 'Imora Sentul'),
(105, 'Hengki', '', 'L', '', '0000-00-00', 'Jalan pulo 2, Kp pulo rt 002/009, Bekasi', '81511234229', 'Hengki', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '6830289958 (bCA)', 'Honda Pondok Gede'),
(106, 'Tjong Junidah', '', 'L', '', '0000-00-00', 'Jl. Citanduy III no. 188, Depok, Jawa barat, 16418', '81283538353', 'Tjong', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1570007942544 (MANDIRI)', 'Hyundai Cibubur'),
(107, 'Yoga Prayoga', 'Prayoga', 'L', '', '0000-00-00', 'Kp rawailat rt 009/15 desa dayeuh kecamatan cileungsi, Jl kh umar kp rawailat, Bogor, Indonesia jawa barat, 16820', '81298469389', 'Yoga', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '4060690427', 'Hyundai cibubur'),
(108, 'Pratikno', '', 'L', '', '0000-00-00', 'Cilodong ,RT/RW 004/005, Gg.Jawa No.80, Depok, Jawa Barat, 16414', '81318983979', 'Pratikno', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1281466327 (BCA)', 'PT. Dwi Perkasa Mobiltama'),
(109, 'Freddy Gunawan', '', 'L', '', '0000-00-00', 'Jl.Alternatif cibubur no.32, Cibubur - Cileungsi, Bogor, Jawa barat, 19620', '82114574592', 'Freddy', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '4060963474', 'Mustika Prima Berlian Cibubur'),
(110, 'Dina', '', 'P', '', '0000-00-00', '', '81297675788', 'Dina', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', 'Mitsubishi Lenteng Agung'),
(111, 'Rafi ', '', 'L', '', '0000-00-00', 'cim', '8118691315', 'Rafi ', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7401835311 (BCA)', ''),
(112, 'Novy', '', 'P', '', '0000-00-00', '-', '81310391182', 'Novy', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', 'Mitsubishi Lenteng Agung'),
(113, 'Siti ', 'Rohmawati', 'P', '', '0000-00-00', 'kp cakung rt.003 rw.005, jalan wibawa mukti 2, jawabarat, bekasi', '81295995589', 'sitirohmawati', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7390505927 (BCA)', 'Honda Cibubur'),
(114, 'Putra', '', 'L', '', '0000-00-00', '', '85716118405', 'Putra', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', ''),
(115, 'Rahma', '', 'P', '', '0000-00-00', 'Jl. Alternatif Cibubur No.38, Jatisampurna', '81295995589', 'Rahma', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7390505927 (BCA)', 'honda cibubur'),
(116, 'Gandi', '', 'L', '', '0000-00-00', 'mitsubishi', '87775777897', 'Gandi', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', ''),
(117, 'Rubyn', '', 'L', '', '0000-00-00', '', '81288976616', 'Rubyn', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', 'toyota'),
(118, 'Arifin', '', 'L', '', '0000-00-00', 'mitsubishi cinere', '8989620692', 'Arifin', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', 'Mitsubishi cinere'),
(119, 'Reza akbar', 'Naluri putra', 'L', '', '0000-00-00', 'Grand Residence Cluster Pattimura Blok CD 4 No 26 Rt 001 Rw 014, Kel.Burangkeng Kec. Setu Kabupaten Bekasi,', '81281222534', 'Reza', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5681101013 (BCA)', 'Honda Cibubur'),
(120, 'Achmad ', 'Nugroho', 'L', '', '0000-00-00', 'Limus pratama regency C 7 no 21, Merpati 1, Bogor, Jawa barat, 16820', '8129822910', 'AchmadNugroho', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '4061309505 (BCA)', 'Setiajaya mobilindo cibubur'),
(121, 'hengki', '', 'L', '', '0000-00-00', '', '81511234229', 'hengki', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', 'honda pondok gede'),
(122, 'Dera ', 'Pradefta', 'P', '', '0000-00-00', 'Jl raya lenteng agung no.105, Jakarta, Dki jakarta, 12610', '8119981686', 'Dera', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '2741530335 (BCA)', 'PT SRIKANDI DIAMOND MOTORS'),
(123, 'Sinta ', 'Dinasti', 'P', '', '0000-00-00', 'Jl. Alternatif cibubur, Kota , Bekasi, Jawabarat', '89652496418', 'Sinta', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5771167927 (BCA)', 'HMI CIBUBUR'),
(124, 'Ade ', 'Suhendro', 'L', '', '0000-00-00', 'Jl kemayoran barat no 8, Jakarta pusat, Dki jakarta, 10620', '81213656563', 'Ade', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1260010044112 (MANDIRI)', 'Hyundai Fatmawati'),
(125, 'Denis', '', 'L', 'Bekasi', '0000-00-00', 'gg delima no 113 rt 009 rw 002', '81296991666', 'Denis', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', 'Mazda Puri'),
(126, 'Bayu Ginanjar', '', 'L', '', '0000-00-00', 'Jl Sepakat II 001/001 cilangkap cipayung, jakarta timur Jakarta, Jakarta Timur, 13870', '87785522055', 'Bayu', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7401195525 (BCA)', 'Wuling Arista Cibinong'),
(127, 'Erni', '', 'P', '', '0000-00-00', 'wuling cibubur', '81315166611', 'Erni', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5725337733 (BCA)', 'Wuling Cibubur'),
(128, 'Irwandi', '', 'L', '', '0000-00-00', '', '81289322988', 'Irwandi', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', ''),
(129, 'Andrea Marsiglietti', '', 'L', '', '0000-00-00', 'Komp ferry sonneville blok 4 kav IVB, Gunung putri, Bogor, Jawa Barat, 16961', '82113148029', 'Andrea', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5725280049 (BCA)', 'Hyundai cibubur'),
(130, 'Renny Yuliana', '', 'P', '', '0000-00-00', 'Metland transyogi', '081274299777', 'Renny', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '1191643068 (BCA)', 'Honda Cibubur'),
(131, 'Asep Saputra', '', 'L', '', '0000-00-00', 'Kp Tapos RT 004 RW 001 ,desa Tapos , kecamatan tapos, Gang langgar , Jawa barat , Depok', '85716118405', 'Asep', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '7115013688 (BCA)', 'Hyundai Soleh Iskandar'),
(132, 'Dodi Kusnendi', '', 'L', '', '0000-00-00', 'Blok Manis Rt.001 Rw.001 Desa Kaduagung Kecamatan Karangkancana, jl. Raya Kaduagung, Kuningan, Jawa barat, 45584', '81517251198', 'Dodi', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5470829119 (BCA)', 'Mitsubishi Lenteng Agung'),
(133, 'Widaya ', 'Kartiana', 'P', '', '0000-00-00', 'Jl. Kranggan pasar No.5 RT.001/RW.004, Bekasi, Jawa barat, 17435', '81314640438', 'Widaya', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '4060947517 (BCA)', 'Honda cibubur'),
(134, 'Ragiel', '', 'L', '', '0000-00-00', 'HMI', '85876502728', 'Ragiel', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', 'Hyundai cibubur'),
(135, 'Bayu', 'Andika', 'L', '', '0000-00-00', 'Jl Mulia No 22, Rt 011 Rw 008, Jakarta Timur, DKI Jakarta, 13330', '87891280200', 'BayuLA', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5530400036', 'PT SRIKANDI DIAMOND MOTORS'),
(136, 'Hendri', '', 'L', '', '0000-00-00', '', '82125363313', 'Hendri', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', 'Suzuki Cibubur'),
(137, 'Yuda', '', 'L', '', '0000-00-00', '', '82377164697', 'Yuda', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', 'Hyundai Cibubur'),
(138, 'Jehan', 'Audrey', 'P', '', '0000-00-00', 'cim', '81904433292', 'Jehan', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', ''),
(139, 'Martinez', '.', NULL, NULL, NULL, 'Sultan agung', '87888514409', 'Martinez', 'e10adc3949ba59abbe56e057f20f883e', NULL, '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', ''),
(140, 'Ferro', '.', NULL, NULL, NULL, '', '', 'Ferro', 'e10adc3949ba59abbe56e057f20f883e', NULL, '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5725167242 (BCA)', ''),
(141, 'Nisfah', '.', NULL, NULL, NULL, '', '', 'Nisfah', 'e10adc3949ba59abbe56e057f20f883e', NULL, '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', ''),
(142, 'Firman', '', 'L', '', '0000-00-00', '', '81211106275', 'Firman', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', 'Toyota Cibubur'),
(143, 'Satri', '', 'P', '', '0000-00-00', 'Jl.ir h juanda Margahayu Bekasi timur , Bekasi , Indonesia , Bekasi', '81314840511', 'Satri', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '0661117892 (BCA)', 'Tunas Toyota Bintaro'),
(144, 'Riki Cim', '.', NULL, NULL, NULL, '', '81212583024', 'Rikicim', 'e10adc3949ba59abbe56e057f20f883e', NULL, '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '', ''),
(145, 'Wawan Irawan', '', 'L', '', '0000-00-00', 'Kp. Sabur rt. 001 rw. 002, Tarikolot, citeureup, Kabupaten bogor, Jawa barat, 16i10', '85710575845', 'WawanLA', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '5720896666 (BCA)', 'Mitsubishi Lenteng Agung'),
(146, 'Wiwiek Saruniati', '', 'L', '', '0000-00-00', 'Jalan pamitran Cijantung no 17 , Jakarta timur , DKI Jakarta', '87882048974', 'Wiwiek', 'e10adc3949ba59abbe56e057f20f883e', '', '2023-02-08', 'user.gif', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'L', 0, '6281836240 (BCA)', 'Mitsubishi Lenteng Agung'),
(147, 'Dayat', '.', NULL, NULL, NULL, '', '83898877267', 'Dayat', 'e10adc3949ba59abbe56e057f20f883e', NULL, '2023-02-08', 'user.gif', 0, 0, 'Y', '0000-00-00', '', 0, 0, 'L', 0, '', 'Chery'),
(148, 'ROBY 	', 'ADITYA', 'L', 'Bekasi', '1999-09-08', 'Karanggan wetan rt 001 rw 007, Jatirangga, Jatisampurna kota ', '82115132515', 'roby', 'c5c5a17bbf5d31171d022fb123416d1a', '', '2023-02-24', '22324F86-E35B-44AE-BFD0-2A5C61FF5B65.jpeg', 20, 1, 'Y', '2023-05-29', 'N', 2, 0, 'I', 0, '7115259008 BCA', ''),
(149, 'ADIL ', 'JUNANDA', 'L', 'Banjarnegara', '1992-06-12', 'Kp. Ciketing Selatan Rt. 002/007, Ciketing udik, Bantargebang, Bekasi', '87882702858', 'adil', 'b0825c81770829671e41e2350a260775', '', '2023-02-24', '1E24198D-7BCC-4ADF-B401-97C117A69A90.jpeg', 20, 1, 'Y', '2023-05-29', 'N', 2, 0, 'I', 0, '5725534920 BCA', ''),
(150, 'RANGGA', '', 'L', 'Jakarta', '1990-01-24', 'JL. Cipinang Cempedak 1 no. 10 rt 013/006 Jakarta Timur', '85691210276', 'ardian', '863c2a4b6bff5e22294081e376fc1f51', '', '2023-02-24', 'WhatsApp Image 2023-05-03 at 17.56.47.jpg', 20, 1, 'Y', '2023-05-29', 'N', 2, 0, 'I', 0, '5530574042', ''),
(151, 'ANDI ', 'MAULANA', 'L', 'Bekasi', '1999-08-07', 'Kp. Payangan Kel. Jatisari kec. Jatiasih', '83837029594', 'andi', 'ce0e5bf55e4f71749eade7a8b95c4e46', '', '2023-02-24', '6A2441B4-F5A0-48F9-AB45-46A77D50E815.jpeg', 20, 1, 'Y', '2023-05-29', 'N', 2, 0, 'I', 0, '7115259024 BCA', ''),
(153, 'SAHRUL', '', 'L', 'Karawang', '2001-01-12', 'KP.Pondok Benda Rt 04/ Rw 05 Jl. Siakad', '82122942774', 'sahrul', '2bfad295dce47ca3fc1f30fdbe92ff4a', '', '2023-02-24', 'WhatsApp Image 2023-05-03 at 17.59.30.jpg', 20, 1, 'Y', '2023-05-29', 'N', 2, 0, 'I', 0, '7510975574 BCA', ''),
(154, 'DEVI ', 'SAPUTRA', 'L', 'Bekasi', '2002-07-17', 'Kranggan wetan rt 001 rw 007', '85715537240', 'devi', 'f5c2db1f19bdde37e740e86b70d0534f', '', '2023-02-24', 'WhatsApp Image 2021-10-19 at 16.01.47.png', 20, 1, 'Y', '2023-05-29', 'N', 2, 0, 'I', 0, '7115384465 BCA', ''),
(155, 'sales', 'admin', 'L', 'Bekasi', '2023-02-01', 'Jl. Siakadsssdad', '089998', 'adminsales', '4df489f8fd6d221fb6edfbf9bedfc4e1', 'tuyulchruncy@gmail.com', '2023-02-28', 'SharedScreenshot.jpg', 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', ''),
(184, 'Rachmat ', 'Fadhil', 'L', '-', '0000-00-00', 'Jl. Cipayung setu no.22 rt001/004 cipung jakarta timur, Jakarta timur, Dki jakarta', '82111544599', 'rachmat', '2dbc7dd7e9524ddff1157d2e3df10aeb', '', '2023-04-01', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '6281374432 (BCA)', 'Hyundai cibubur'),
(157, 'NIMUN', '', 'L', 'Bekasi', '0000-00-00', 'Kranggan Wetan RT 001/07', '85716640221', 'nimun', 'e19b9e71d9f7c658c2adc374171206c0', '', '2023-03-04', 'WhatsApp Image 2023-05-03 at 18.05.12.jpg', 20, 1, 'Y', '2023-04-03', 'N', 5, 0, 'I', 3, '7115379798 BCA', ''),
(158, 'Raymond', 'Andreas', 'L', 'bekasi', '0000-00-00', 'Legenda wisata zona einstein rt 9 rw 5 gunung putri', '08111893272', 'reymond', '47938d99794e783cec95163d951d0131', '', '2023-03-04', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'K', 0, '-', 'stargard cibubur'),
(159, 'Sutrisno', '', '', '', '0000-00-00', 'Depok,', '	(6281) 3800-1', 'sutrisno', '82e29bc26cd3dd9eff684bb064f1855b', '', '2023-03-04', NULL, 0, 5, 'Y', '0000-00-00', 'Y', 3, 0, '', 0, '', 'Sun motor yasmin'),
(160, 'Sutrisno', '', 'L', 'bekasi', '1994-07-09', 'depok', '8138001982', 'risno', '341a7c84972c951f38f5ced600dc3f2c', '', '2023-03-04', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '-', 'Sun motor yasmin'),
(161, 'Marizeki', '', 'L', '', '0000-00-00', '', '8111719903', 'rizkicinere', 'c412a94f4703a77325f4260e7c56a4e8', '', '2023-03-06', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '7650468125', 'Mitsubishi Cinere'),
(162, 'Muhamad', 'Taufik', 'L', 'bekasi', '0000-00-00', 'Kranggan Wetan', '82123556460', 'taufik', 'd4305d7ed2ec97107cd6eb8dd4b6f6b7', '', '2023-03-08', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', ''),
(163, 'Rudi', 'Yanto', 'L', 'bekasi', '0000-00-00', 'Sawangan depok, Jl sawangan permai rt 02 rw 09, Depok, Jawa barat, 16511', '087885206878', 'Rudiyanto', '980cfd91bdc9e158c037e0312f5fa492', '', '2023-03-10', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '7115328956 (BCA)', 'Suzuki Cibubur'),
(164, 'Galuh Arya', 'Ramadhan', 'L', 'bekasi', '0000-00-00', '', '82217757819', 'Galuh', '4d47f4a147b998a940ad688baaf43e6d', '', '2023-03-11', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '7401876271 (BCA)', 'Toyota Cileungsi'),
(165, 'Erdin Artis', '', 'L', 'Bekasi', '0000-00-00', '', '82359127783', 'Erdin', '898b0c09c4855a126532d0735944e328', '', '2023-03-11', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', 'Referal Program'),
(166, 'Siman', '', 'L', 'bekasi', '0000-00-00', 'Jl lurah namat no 24 RT.02/06 kota bekasi, 17434', '081386195994', 'siman', '322f3681ffb4580ab4653d5013797068', '', '2023-03-14', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', 'chery cibubur'),
(167, 'Yudha ', 'keswara', 'L', 'bekasi', '0000-00-00', 'Jl Alam Pesanggrahan 6, Blok OI 19, Bukit Cinere Indah Depok, Jl Alam Pesanggrahan 6 Blok OI 19, Cinere, Jawa Barat, 16515', '082377092796', 'yudha', '2b9633304de305ed5c03fe19b7a06afe', '', '2023-03-16', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '7402143617', 'Mitsubishi Nusantara Cinere'),
(168, 'Dedi', 'purnomo', 'L', 'bekasi', '0000-00-00', 'Kp kalibata Srengseng sawah , DKI Jakarta , Jakarta Selatan , 12640', '081210653250', 'dedi', 'c5897fbcc14ddcf30dca31b2735c3d7e', '', '2023-03-20', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '5405075871', 'Mitsubishi Lenteng Agung'),
(169, 'Irvan ', 'Sugara', 'L', '', '0000-00-00', 'Kp. Kebantenan Rt. 005/008 Kel. Jati Asih Kec. Jati asih, Bekasi, Jawa Barat, 17423', '081219512228', 'irvan', '4c8e0251c853de2172b5e138075c7b3f', '', '2023-03-23', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '1660002394641 (MANDIRI)', 'Tunas Toyota'),
(170, 'Rohmat', '', 'L', 'bekasi', '0000-00-00', 'D\'Area Permata blok a no 20 , sawangan,sawangan,depok, depok, jawa barat, 16511', '085890880849', 'Rohmat', '105a3df610a28f93b907ca616a62334c', '', '2023-03-24', NULL, 0, 0, 'Y', '0000-00-00', 'Y', 0, 0, 'I', 0, '4890282259', 'MAzda Sultan Agung Bekasi'),
(172, 'Rohmat', '', 'L', 'bekasi', '0000-00-00', 'D\'Area Permata blok a no 20 , sawangan,sawangan,depok, depok, jawa barat, 16511', '085890880849', 'Rohmatsultanagung', 'b5d765a619028523dfe9dc5d767c3f56', '', '2023-03-24', NULL, 0, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '4890282259', 'MAzda Sultan Agung Bekasi'),
(173, 'Khilda', '', 'P', '', '0000-00-00', '', '081392015857', 'khilda', 'b60f7ee1dffefc59b5ee9bc07e66194c', '', '2023-03-24', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', 'Mitsubishi Lenteng Agung'),
(174, 'Fenny', ' Yuniarti', 'P', '', '0000-00-00', 'Jl rawa kuning , GG.h.saleh, Jakarta timur , DKI Jakarta , 13950', '081322122106', 'fenny', '23b690524e78636b0a472dcb1d5c22eb', '', '2023-03-24', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '6240599129', 'chery cibubur'),
(175, 'tes', 'pegawai', 'L', 'Bekasi', '2023-03-28', 'Jl. Siakadsssdad', '089998', 'pegawai', '047aeeb234644b9e2d4138ed3bc7976a', 'dwika.luthfi@politeknikssr.ac.id', '2023-03-26', '007da09bc2b3321a55af69f722b01923.jpg', 20, 5, 'Y', '2023-05-29', 'N', 2, 100000, 'I', 12, '', ''),
(176, 'yomah', 'Kamarullah', 'P', '', '0000-00-00', 'Jl. Raya Bogor KM.20 , Gg.H.Naning Rt.002 Rw.08 No.10 B Kel.Tengah Kec.Kramat Jati , Jakarta Timur, DKI Jakarta, 13540', '081310897536', 'yomah', '2bdd748a2231be0625879b23b4121cfb', '', '2023-03-27', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, 'BCA 	6090242669', '	PT. SRIKANDI DIAMOND MOTORS'),
(177, 'Roby', '', 'L', 'bekasi', '0000-00-00', '', '81275639414', 'robi', 'b8b743a499e461922accad58fdbf25d2', '', '2023-03-27', NULL, 19, 5, 'Y', '2023-03-31', 'N', 3, 0, 'I', 0, '', 'MAzda Sultan Agung Bekasi'),
(178, 'Muhamad', 'Al fachrizi', 'L', '', '0000-00-00', 'Kp karang tengah rt 03/02 kec. Babakan madang , Kp karang tengah , Bogor , Jawa barat, 16811', '81281356162', 'fahreza', 'c9e6be03ff3d2190c8a30076c98526cf', '', '2023-03-27', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '7115326864 (BCA)', 'hyundai cibubur'),
(179, 'wardah', '', '', '', '0000-00-00', '', '081315281008', 'wardah', 'f7a613559aa700a2be909675b5e125fe', '', '2023-03-28', NULL, 0, 0, 'Y', '0000-00-00', 'Y', 0, 0, '', 0, '', ''),
(180, 'Wardatus ', 'Sholihat', 'P', 'bekasi', '0000-00-00', 'Puri Harmoni 9, Puri Harmoni 9, Bogor, Jawa barat, Bogor', '081315281008', 'Wardahtus', '57ee34735cc60ba473bb6721457d85ef', '', '2023-03-28', NULL, 19, 1, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '7402158053 BCA', 'Hyundai Cibubur'),
(181, 'Wahyu ', 'Yanti', 'L', '', '0000-00-00', '', '81934179979', 'wahyu', '32c9e71e866ecdbc93e497482aa6779f', '', '2023-03-30', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, '', 0, '5725776648', ''),
(204, 'SRI', 'NETI', 'L', 'Indramayu', '1995-05-15', 'Jl nusa 1 no 12 Rt 004 Rw 003 Kel Kramat Jati Kec Kramat Jati', '089681172015', 'neti', '1d4dceb4bc2853d626976977a73bf4f2', '', '2023-05-02', 'WhatsApp Image 2023-05-03 at 17.26.13.jpg', 21, 1, 'Y', '2023-05-29', 'N', 5, 0, 'I', 0, '6871374268 BCA', ''),
(183, 'SONY', 'SETIAWAN', 'L', 'Bekasi', '1998-04-21', 'Dusun Kranggan Lembur RT 001 RW 005', '81546239016', 'sony', '33561003f44d374c719506bef4faeba4', '', '2023-03-31', 'WhatsApp Image 2023-05-03 at 17.55.37.jpg', 20, 1, 'Y', '2023-05-29', 'N', 2, 0, 'I', 0, '7115404857 BCA', ''),
(185, 'Robby ', 'Firdaus', 'L', '-', '0000-00-00', 'jl perjuangan , kp cakung rt 004/04 jatisari, jl perjuangan, bekasi, jawabarat, 17426', '085283333428', 'robby', '8d05dd2f03981f86b56c23951f3f34d7', '', '2023-04-03', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', 'Cibubur Indah Motor'),
(186, 'Rijal', 'Jeje', 'L', '-', '2023-04-05', 'Polsek Ciracas komseko, Kramat jati, Jakarta timur, Jakarta, Jakarta', '082189678520', 'rijal', '25e8281c69ae6a68e92139c790f1956d', '', '2023-04-05', NULL, 19, 1, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '7401969741', 'ASTRIDO CILEUNGSI'),
(187, 'Nurul', 'Huda', 'P', '-', '0000-00-00', 'Perumahan limus pratama blok i7 no.35, Jl kediri , 16820', '0812 9189-6700', 'nurul', '6968a2c57c3a4fee8fadc79a80355e4d', '', '2023-04-05', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '4141838355 (BCA)', 'Pt.mustika prima berlian'),
(188, 'Fani ', 'Hermawan', 'L', '', '0000-00-00', '', ' 85773295558', 'fani', 'ee61d621f12489791ce28b31409daee4', '', '2023-04-05', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', '-'),
(189, 'Dwi', 'Ariristanto', 'L', '', '0000-00-00', 'Jl.kemuning blok A59 Pondok pucung indah', '81290346410', 'dwi ariristanto', '30e2ec6bc224effc15d9a031e9430763', '', '2023-04-06', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '6800823305', 'MAZDA SIMPRUG'),
(190, 'Rachma ', 'Alfazdilla', 'L', '', '0000-00-00', 'KOMP. Polri jatirangga , Blok c 20', '87765801095', 'dilla', 'd1e6bcd9c4b932851068578b15af2bab', '', '2023-04-06', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '7401751193', 'Cibubur'),
(191, 'Surya', 'Bachtiar', 'L', '', '0000-00-00', '', '895330796245', 'surya', 'aff8fbcbf1363cd7edc85a1e11391173', '', '2023-04-06', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', '-'),
(192, 'admin1', 'Tes', NULL, NULL, NULL, '', NULL, 'admin1', 'c7624c15bb538a4122cca363f7bc25e9', 'siakadapp@gmail.com', '2023-04-06', '7233-2252-CUCU RAHMAWATI-1680557184.png', 1, 5, 'Y', '2023-05-29', 'N', 0, 0, 'L', 0, '', ''),
(193, 'Intan ', 'Mei', 'P', '-', '0000-00-00', 'Limus Pratama Regency L5 12 , Lembang L5 no 12, Bogor, Jawabarat, Bogor', '82322976176', 'intan', 'b1098cab9c2db3eb9f576eb66c33449c', '', '2023-04-08', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '5725407634', 'ASTRIDO TOYOTA CILEUNGSI'),
(194, 'Salamuddin', '', 'L', '-', '0000-00-00', '-', '82177773853', 'udin', '6bec9c852847242e384a4d5ac0962ba0', '', '2023-04-10', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '8850427110', 'Mitsubishi '),
(195, 'Yudhistira', 'Vandhika', 'L', '-', '0000-00-00', 'Jl. Rajawali no. 15 mekarsari cimanggis, Depok, Jawa barat, 16452', '81280011158', 'yudhis', '41f460a9ded946c0d973061b6b06f5fb', '', '2023-04-11', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'K', 0, '5315049668', 'Mitsubishi Srikandi Lenteng agung'),
(197, 'Fahmi ', 'Falino', 'L', '-', '0000-00-00', 'RESIDENCE 8 NO.6 JLN.SLTP 160, JAKARTA TIMUR, DKI JAKARTA, 13820', '81394344949', 'fahmi', 'f11d50d63d3891a44c332e46d6d7d561', '', '2023-04-13', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '7940078363', 'HONDA KENCANA KRANJI'),
(198, 'Iwan', '', 'L', '', '0000-00-00', '', '', 'iwan', '01ccce480c60fcdb67b54f4509ffdb56', '', '2023-04-13', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', ''),
(199, 'Dini', 'Cim', 'P', '', '0000-00-00', '', '81212276046', 'dinicim', '5fc5899d8d7007afa99e1778904d46e1', '', '2023-04-15', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', 'Cibubur'),
(200, 'Astry ', 'Vania', 'P', '-', '0000-00-00', 'Jalan Raya Narogong Pangkalan 8 No. 8, Bogor, West Java, 16820', '82299300107', 'asty', 'c218f6378c398eb0a010b301af858278', '', '2023-04-17', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '4061016036', 'Astrido cileungsi'),
(201, 'Lusi ', 'Oktariani', 'P', '-', '0000-00-00', 'Jl. Haji Entong Usan, Cibadak, Tanah Sareal Kota Bogor, Kota Bogor, Jawa Barat, 16166', '89611813116', 'lusi', 'c842ecc88a0ff8fd0105eaeabf71999d', '', '2023-04-18', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '8720927587', 'Hyundai Sholeh Iskandar Bogor'),
(202, 'Pierre ', 'Bryan', 'L', '-', '0000-00-00', 'Perumahan Limus pratama regency , Jln. Blora blok i 7 no. 35, Kab. Bogor, 16820', '81213266786', 'pierre', '84675f2baf7140037b8f5afe54eef841', '', '2023-04-20', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'P', 0, '2770356710', 'Pt.mustika prima berlian'),
(203, 'Chika ', 'Widiastiti', 'P', '-', '0000-00-00', 'Griya limus asri blok a10no1, Jawabarat, 16820', '85770796744', 'chika', '9ff90b13e5b1ce54e0f28af6b395f73c', '', '2023-05-02', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '7401835486 (BCA)', 'PT ANDALAN AUTO PRIMA'),
(205, 'Saipul', '', 'L', '', '0000-00-00', 'MAZDA SULTAN AGUNG', '85711695989', 'SAIPUL', '0df98fedfb246b51562ba130fc39b376', '', '2023-05-10', NULL, 19, 1, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', 'mazda bekasi'),
(206, 'Daniel', '', 'L', '-', '0000-00-00', 'Tanah Merah Atas no 24', '89603658522', 'daniel', 'aa47f8215c6f30a0dcdb2a36a9f4168e', '', '2023-05-12', NULL, 19, 8, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '6320417234 (BCA)', 'Hyundai Sawah Besar'),
(207, 'Runny', 'Mola', 'L', '', '0000-00-00', '-', '81298755447', 'mola', '6d05cea0deb594fb3ad0880cae8fd8ad', '', '2023-05-12', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'K', 0, '', 'Honda Pondok Gede'),
(208, 'Debbi', 'Sukma ayu', 'L', '', '0000-00-00', 'Jl.pisangan lama 3 rt 001 rw 07, Jakarta timur , Jkt timur, Di jkt, 13230', '85716516880', 'deby', '94169b553688da79735f4a4a1dd781c1', '', '2023-05-13', NULL, 19, 1, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '0750041761 (BCA)', 'Astrido toyota cileungsi'),
(209, 'Eva', 'Sary', 'P', '', '0000-00-00', '', '8128955620', 'eva', '14bd76e02198410c078ab65227ea0794', '', '2023-05-13', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '2291419064', 'Honda Cibubur'),
(210, 'Sherly', 'Liliana', 'P', '', '0000-00-00', 'Gn putri selatan no 132, Bukit tongkonan toraja, Bogor, Indonesia, 16961', '81911707020', 'sherly', '1c8b06358890d6c512859b21557315b4', '', '2023-05-15', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '1330024082638', 'PT HYUNDAI MOBIL INDONESIA'),
(211, 'Nur Fitrah ', 'Ayumi', 'P', '', '0000-00-00', 'Perumahan harvest city cluster orchid A 07/06, Ragemanunggal, Setu, Bekasi, Bekasi, Indonesia, 16820', '88102519157', 'Nur', 'b55178b011bfb206965f2638d0f87047', '', '2023-05-16', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '1560018729428', 'Cibubur Indah Motor'),
(212, 'Rizki', 'Irawan', 'L', 'Bekasi', '2023-05-09', 'Jl lenteng agung', '081333069865', 'rizkiirawan', 'db3bc5b89c6e4c91077d921359002a2d', '', '2023-05-22', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '3195116347 (BCA)', 'Mitsubishi lenteng agung'),
(213, 'Ibu Maria', '', 'P', 'Bekasi', '2023-05-01', 'Jl sultan agung', '', 'maria', '263bce650e68ab4e23f28263760b9fa5', '', '2023-05-22', NULL, 19, 1, 'Y', '0000-00-00', 'Y', 3, 0, 'K', 0, '-', 'Mazda Sultan Agung'),
(214, 'Muhammad ', 'Bondan', 'L', '', '0000-00-00', 'Villa nusa indah blok dd 6 no. 11 RT 001 RW 002, Jatiasih , Bekasi, Jawa barat, 16969', '85161017033', 'Bondan', 'acaa3b2723e9789e72d81321b8328e76', '', '2023-05-22', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '1330024812232 (MANDIRI)', 'HYUNDAI CIBUBUR'),
(215, 'Savira ', 'Meyrani', 'P', '', '0000-00-00', '', '85891388150', 'Savira', '7b3378ccac51140e86f9fb92f6c4fb8a', '', '2023-05-22', NULL, 19, 1, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '6825533412', 'Honda Maju Pondok Gede'),
(216, 'Aldo', 'Oktaviansyah', 'L', '', '0000-00-00', 'Harvest City, Jl. Harvest city boulevard, Kabupaten Bekasi, Jawa Barat, -', '81218817801', 'Aldo', 'b104ab9a0e58c861b9628208b3fecd58', '', '2023-05-22', NULL, 19, 1, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '1652542063', 'Auto2000'),
(217, 'Yudirangge', 'Basiangdi', 'L', '', '0000-00-00', 'JL PISANG KEPOK 3 NO 5 RT 002 RW 016', '81294897344', 'Rangge', '62f7de8ff9cc1fe7b7c8c9296db8af64', '', '2023-05-22', NULL, 19, 1, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '1670005017057 (MANDIRI)', 'HYUNDAI KALIMALANG'),
(218, 'Siti ', 'Rahma Sari', 'P', '', '0000-00-00', 'Jl. Jend sudirman km 31 Kranji, kec. Bekasi Selatan. Kota bekasi Jawa barat, Jl. Jend sudirman km. 31 Kranji, Bekasi, Jawa Barat, 17143', '85310418000', 'Siti', 'db04eb4b07e0aaf8d1d477ae342bdff9', '', '2023-05-25', NULL, 19, 1, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '5740139675', 'HONDA KENCANA KRANJI'),
(219, 'Rendra', 'Anggriawan', 'L', '', '0000-00-00', 'Lenteng agung, Jaksel, Dki jkt, 12610', '857182855087', 'Rendra', 'bcb0195b3b8dcfd3f5656518d9063499', '', '2023-05-25', NULL, 19, 8, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '5520513894', 'PT SRIKANDI DIAMOND MOTORS LENTENG AGUNG'),
(220, 'Siman', 'Simon', 'L', '', '0000-00-00', 'Jl lurah namat no 24 bekasi', '81386195994', 'kemot', 'ada62db53c9e87d7699fc37ca7114795', '', '2023-05-26', NULL, 19, 1, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '5395087590', 'Dealer Chery Cibubur'),
(221, 'Tony', 'Saragih', 'L', '', '0000-00-00', '', '81298304645', 'tony', 'ddc5f5e86d2f85e1b1ff763aff13ce0a', '', '2023-05-26', NULL, 19, 5, 'Y', '0000-00-00', 'Y', 3, 0, 'I', 0, '', 'Wuling Cibubur'),
(222, 'pegawai ', 'pegawai', 'L', 'Bekasi ', '2023-05-01', 'Ggg', '5558080', 'pegawai1', 'c7624c15bb538a4122cca363f7bc25e9', 'siakadapp@gmail.com', '2023-05-29', 'Screenshot_2023-05-27-22-59-28-984_com.android.chrome.png', 20, 1, 'Y', '0000-00-00', 'Y', 5, 15000, 'I', 12, 'BAC 5777265 a/n juan', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_absen`
--

CREATE TABLE `t_absen` (
  `id` int(11) NOT NULL,
  `masuk_awal` varchar(15) NOT NULL,
  `masuk_akhir` varchar(15) NOT NULL,
  `pulang_awal` varchar(15) NOT NULL,
  `pulang_akhir` varchar(15) NOT NULL,
  `status` enum('N','Y') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_absen`
--

INSERT INTO `t_absen` (`id`, `masuk_awal`, `masuk_akhir`, `pulang_awal`, `pulang_akhir`, `status`) VALUES
(7, '08:00', '08:40', '17:00', '17.30', 'Y'),
(12, '05:33', '05:34', '05:55', '05:57', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `t_agama`
--

CREATE TABLE `t_agama` (
  `id` int(11) NOT NULL,
  `kode` varchar(3) NOT NULL,
  `nama` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_agama`
--

INSERT INTO `t_agama` (`id`, `kode`, `nama`) VALUES
(1, 'I', 'Islam'),
(2, 'K', 'Katolik'),
(3, 'P', 'Protestan'),
(4, 'B', 'Budha'),
(5, 'H', 'Hindu'),
(6, 'KH', 'Khonghuchu'),
(7, 'L', 'Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `t_bayar_gaji`
--

CREATE TABLE `t_bayar_gaji` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `gajixhari` int(11) NOT NULL,
  `tunjangan` int(11) NOT NULL,
  `overtime` int(11) NOT NULL,
  `uang_makan` int(11) NOT NULL,
  `uang_transport` int(11) NOT NULL,
  `lembur` int(11) NOT NULL,
  `insentif` int(11) NOT NULL,
  `potongan` int(11) NOT NULL,
  `jht` int(11) NOT NULL,
  `gajikotor` int(11) NOT NULL,
  `bonus` int(11) NOT NULL,
  `tg_server` datetime NOT NULL DEFAULT current_timestamp(),
  `status_gaji` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_booking`
--

CREATE TABLE `t_booking` (
  `id` int(11) NOT NULL,
  `jml_booking` int(11) NOT NULL,
  `id_jual` varchar(11) NOT NULL,
  `tgl_booking` date NOT NULL,
  `waktu` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_cabang`
--

CREATE TABLE `t_cabang` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_cabang`
--

INSERT INTO `t_cabang` (`id`, `nama`, `deskripsi`) VALUES
(1, 'Bekasi', 'Bekasi'),
(2, 'Kab. Bogor', 'Kab. Bogor'),
(6, 'Depok', 'Depok'),
(5, 'Cibubur Pusat', 'Cibubur Pusat'),
(8, 'Jakarta', 'Jakarta'),
(9, 'Kota Bogor', 'Kota Bogor'),
(10, 'Tangerang', 'Tangerang');

-- --------------------------------------------------------

--
-- Table structure for table `t_gaji`
--

CREATE TABLE `t_gaji` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `gaji` int(11) NOT NULL,
  `uang_makan` int(11) NOT NULL,
  `uang_transport` int(11) NOT NULL,
  `overtime` int(11) NOT NULL,
  `insentif` int(11) NOT NULL,
  `dinas` int(11) NOT NULL,
  `lainnya` int(11) NOT NULL,
  `lembur` int(11) NOT NULL,
  `pokok` int(11) NOT NULL,
  `tun_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_gaji`
--

INSERT INTO `t_gaji` (`id`, `id_pegawai`, `gaji`, `uang_makan`, `uang_transport`, `overtime`, `insentif`, `dinas`, `lainnya`, `lembur`, `pokok`, `tun_jabatan`) VALUES
(15, 183, 38461, 15000, 0, 15000, 20000, 30000, 0, 100000, 0, 0),
(16, 149, 65384, 30769, 0, 15000, 50000, 30000, 0, 100000, 0, 200000),
(17, 154, 38461, 15000, 0, 15000, 20000, 30000, 0, 100000, 0, 0),
(18, 148, 57692, 23076, 0, 15000, 0, 30000, 0, 100000, 0, 0),
(19, 151, 57692, 15384, 0, 15000, 30000, 30000, 0, 100000, 0, 0),
(20, 153, 61538, 30769, 0, 15000, 50000, 30000, 0, 100000, 0, 0),
(21, 150, 61538, 30769, 0, 15000, 50000, 30000, 0, 100000, 0, 0),
(22, 196, 76923, 0, 0, 15000, 0, 0, 0, 100000, 0, 0),
(23, 1, 84615, 0, 0, 15000, 0, 0, 0, 100000, 0, 0),
(25, 204, 76929, 0, 0, 15000, 0, 0, 0, 100000, 0, 0),
(26, 157, 69230, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 175, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 0, 10000),
(28, 222, 20, 20, 20, 20, 20, 20, 20, 20, 0, 20);

-- --------------------------------------------------------

--
-- Table structure for table `t_garansi`
--

CREATE TABLE `t_garansi` (
  `id` int(11) NOT NULL,
  `id_data` varchar(11) NOT NULL,
  `batas` int(11) NOT NULL,
  `terpakai` int(11) NOT NULL,
  `tgl_mulai` date NOT NULL DEFAULT current_timestamp(),
  `tgl_akhir` date NOT NULL DEFAULT current_timestamp(),
  `tgl` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_garansi`
--

INSERT INTO `t_garansi` (`id`, `id_data`, `batas`, `terpakai`, `tgl_mulai`, `tgl_akhir`, `tgl`) VALUES
(1, 'WRT000001', 4, 0, '2023-02-05', '2023-02-27', '2023-02-28'),
(2, 'WRT000002', 1, 0, '2023-02-28', '2024-02-28', '2023-02-28'),
(3, 'WRT000003', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(4, 'WRT000004', 6, 0, '2023-02-28', '2026-02-28', '2023-02-28'),
(5, 'WRT000005', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(6, 'WRT000006', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(7, 'WRT000007', 5, 0, '2023-02-28', '2028-02-28', '2023-02-28'),
(8, 'WRT000008', 6, 0, '2023-02-28', '2026-02-28', '2023-02-28'),
(9, 'WRT000009', 6, 0, '2023-02-28', '2026-02-28', '2023-02-28'),
(10, 'WRT000010', 6, 0, '2023-02-28', '2026-02-28', '2023-02-28'),
(11, 'WRT000011', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(12, 'WRT000012', 2, 0, '2023-02-28', '2024-02-28', '2023-02-28'),
(13, 'WRT000013', 10, 0, '2023-02-28', '2028-02-28', '2023-02-28'),
(14, 'WRT000014', 4, 1, '2023-02-28', '2025-02-28', '2023-02-28'),
(15, 'WRT000015', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(16, 'WRT000016', 4, 2, '2021-09-01', '2023-09-01', '2023-02-28'),
(17, 'WRT000017', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(18, 'WRT000018', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(19, 'WRT000019', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(20, 'WRT000020', 4, 2, '2023-02-28', '2025-02-28', '2023-02-28'),
(21, 'WRT000021', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(22, 'WRT000022', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(23, 'WRT000023', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(24, 'WRT000024', 6, 0, '2023-02-28', '2026-02-28', '2023-02-28'),
(25, 'WRT000025', 10, 0, '2023-02-28', '2028-02-28', '2023-02-28'),
(26, 'WRT000026', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(27, 'WRT000027', 4, 0, '2022-01-29', '2024-01-29', '2023-02-28'),
(28, 'WRT000028', 6, 0, '2023-02-28', '2026-02-28', '2023-02-28'),
(29, 'WRT000029', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(30, 'WRT000030', 4, 0, '2023-03-31', '2025-03-31', '2023-02-28'),
(31, 'WRT000031', 4, 0, '2023-02-05', '2023-02-27', '2023-02-28'),
(32, 'WRT000032', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(33, 'WRT000033', 6, 1, '2023-02-28', '2026-02-28', '2023-02-28'),
(34, 'WRT000034', 6, 1, '2023-02-28', '2026-02-28', '2023-02-28'),
(35, 'WRT000035', 6, 0, '2023-03-29', '2026-03-29', '2023-02-28'),
(36, 'WRT000036', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(37, 'WRT000037', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(38, 'WRT000038', 4, 1, '2023-02-28', '2025-02-28', '2023-02-28'),
(39, 'WRT000039', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(40, 'WRT000040', 4, 1, '2023-08-01', '2025-08-01', '2023-02-28'),
(41, 'WRT000041', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(42, 'WRT000042', 4, 1, '2023-02-28', '2025-03-15', '2023-02-28'),
(43, 'WRT000043', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(44, 'WRT000044', 5, 0, '2023-02-28', '2028-02-28', '2023-02-28'),
(45, 'WRT000045', 1, 0, '2023-02-28', '2024-02-28', '2023-02-28'),
(46, 'WRT000046', 5, 0, '2023-02-28', '2028-02-28', '2023-02-28'),
(47, 'WRT000047', 4, 1, '2023-02-28', '2025-02-28', '2023-02-28'),
(48, 'WRT000048', 4, 1, '2023-02-28', '2025-02-28', '2023-02-28'),
(49, 'WRT000049', 4, 1, '2023-02-28', '2025-02-28', '2023-02-28'),
(50, 'WRT000050', 4, 2, '2023-02-28', '2025-02-28', '2023-02-28'),
(51, 'WRT000051', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(52, 'WRT000052', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(53, 'WRT000053', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(54, 'WRT000054', 10, 0, '2023-02-28', '2028-02-28', '2023-02-28'),
(55, 'WRT000055', 5, 0, '2023-02-28', '2028-02-28', '2023-02-28'),
(56, 'WRT000056', 6, 0, '2023-02-28', '2026-02-28', '2023-02-28'),
(57, 'WRT000057', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(58, 'WRT000058', 4, 1, '2023-02-28', '2025-02-28', '2023-02-28'),
(59, 'WRT000059', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(60, 'WRT000060', 6, 0, '2023-02-28', '2026-02-28', '2023-02-28'),
(61, 'WRT000061', 2, 0, '2023-02-28', '2024-02-28', '2023-02-28'),
(62, 'WRT000062', 4, 1, '2023-02-28', '2025-02-28', '2023-02-28'),
(63, 'WRT000063', 4, 0, '2022-11-27', '2023-03-31', '2023-02-28'),
(64, 'WRT000064', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(65, 'WRT000065', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(66, 'WRT000066', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(67, 'WRT000067', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(68, 'WRT000068', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(69, 'WRT000069', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(70, 'WRT000070', 4, 1, '2022-03-16', '2024-03-16', '2023-02-28'),
(71, 'WRT000071', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(72, 'WRT000072', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(73, 'WRT000073', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(74, 'WRT000074', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(75, 'WRT000075', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(76, 'WRT000076', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(77, 'WRT000077', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(78, 'WRT000078', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(79, 'WRT000079', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(80, 'WRT000080', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(81, 'WRT000081', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(82, 'WRT000082', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(83, 'WRT000083', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(84, 'WRT000084', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(85, 'WRT000085', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(86, 'WRT000086', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(87, 'WRT000087', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(88, 'WRT000088', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(89, 'WRT000089', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(90, 'WRT000090', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(91, 'WRT000091', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(92, 'WRT000092', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(93, 'WRT000093', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(94, 'WRT000094', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(95, 'WRT000095', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(96, 'WRT000096', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(97, 'WRT000097', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(98, 'WRT000098', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(99, 'WRT000099', 4, 2, '2023-02-28', '2025-02-28', '2023-02-28'),
(100, 'WRT000100', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(101, 'WRT000101', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(102, 'WRT000102', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(103, 'WRT000103', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(104, 'WRT000104', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(105, 'WRT000105', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(106, 'WRT000106', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(107, 'WRT000107', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(108, 'WRT000108', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(109, 'WRT000109', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(110, 'WRT000110', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(111, 'WRT000111', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(112, 'WRT000112', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(113, 'WRT000113', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(114, 'WRT000114', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(115, 'WRT000115', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(116, 'WRT000116', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(117, 'WRT000117', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(118, 'WRT000118', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(119, 'WRT000119', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(120, 'WRT000120', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(121, 'WRT000121', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(122, 'WRT000122', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(123, 'WRT000123', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(124, 'WRT000124', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(125, 'WRT000125', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(126, 'WRT000126', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(127, 'WRT000127', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(128, 'WRT000128', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(129, 'WRT000129', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(130, 'WRT000130', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(131, 'WRT000131', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(132, 'WRT000132', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(133, 'WRT000133', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(134, 'WRT000134', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(135, 'WRT000135', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(136, 'WRT000136', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(137, 'WRT000137', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(138, 'WRT000138', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(139, 'WRT000139', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(140, 'WRT000140', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(141, 'WRT000141', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(142, 'WRT000142', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(143, 'WRT000143', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(144, 'WRT000144', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(145, 'WRT000145', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(146, 'WRT000146', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(147, 'WRT000147', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(148, 'WRT000148', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(149, 'WRT000149', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(150, 'WRT000150', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(151, 'WRT000151', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(152, 'WRT000152', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(153, 'WRT000153', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(154, 'WRT000154', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(155, 'WRT000155', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(156, 'WRT000156', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(157, 'WRT000157', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(158, 'WRT000158', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(159, 'WRT000159', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(160, 'WRT000160', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(161, 'WRT000161', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(162, 'WRT000162', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(163, 'WRT000163', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(164, 'WRT000164', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(165, 'WRT000165', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(166, 'WRT000166', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(167, 'WRT000167', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(168, 'WRT000168', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(169, 'WRT000169', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(170, 'WRT000170', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(171, 'WRT000171', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(172, 'WRT000172', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(173, 'WRT000173', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(174, 'WRT000174', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(175, 'WRT000175', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(176, 'WRT000176', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(177, 'WRT000177', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(178, 'WRT000178', 4, 1, '2021-07-23', '2023-07-23', '2023-02-28'),
(179, 'WRT000179', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(180, 'WRT000180', 4, 1, '2021-06-20', '2023-06-20', '2023-02-28'),
(181, 'WRT000181', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(182, 'WRT000182', 0, 0, '2021-06-23', '2023-06-23', '2023-02-28'),
(183, 'WRT000183', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(184, 'WRT000184', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(185, 'WRT000185', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(186, 'WRT000186', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(187, 'WRT000187', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(188, 'WRT000188', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(189, 'WRT000189', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(190, 'WRT000190', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(191, 'WRT000191', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(192, 'WRT000192', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(193, 'WRT000193', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(194, 'WRT000194', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(195, 'WRT000195', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(196, 'WRT000196', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(197, 'WRT000197', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(198, 'WRT000198', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(199, 'WRT000199', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(200, 'WRT000200', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(201, 'WRT000201', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(202, 'WRT000202', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(203, 'WRT000203', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(204, 'WRT000204', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(205, 'WRT000205', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(206, 'WRT000206', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(207, 'WRT000207', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(208, 'WRT000208', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(209, 'WRT000209', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(210, 'WRT000210', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(211, 'WRT000211', 0, 0, '2022-07-12', '2025-07-12', '2023-02-28'),
(212, 'WRT000212', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(213, 'WRT000213', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(214, 'WRT000214', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(215, 'WRT000215', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(216, 'WRT000216', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(217, 'WRT000217', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(218, 'WRT000218', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(219, 'WRT000219', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(220, 'WRT000220', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(221, 'WRT000221', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(222, 'WRT000222', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(223, 'WRT000223', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(224, 'WRT000224', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(225, 'WRT000225', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(226, 'WRT000226', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(227, 'WRT000227', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(228, 'WRT000228', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(229, 'WRT000229', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(230, 'WRT000230', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(231, 'WRT000231', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(232, 'WRT000232', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(233, 'WRT000233', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(234, 'WRT000234', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(235, 'WRT000235', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(236, 'WRT000236', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(237, 'WRT000237', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(238, 'WRT000238', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(239, 'WRT000239', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(240, 'WRT000240', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(241, 'WRT000241', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(242, 'WRT000242', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(243, 'WRT000243', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(244, 'WRT000244', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(245, 'WRT000245', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(246, 'WRT000246', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(247, 'WRT000247', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(248, 'WRT000248', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(249, 'WRT000249', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(250, 'WRT000250', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(251, 'WRT000251', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(252, 'WRT000252', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(253, 'WRT000253', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(254, 'WRT000254', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(255, 'WRT000255', 4, 0, '2022-08-09', '2024-08-09', '2023-02-28'),
(256, 'WRT000256', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(257, 'WRT000257', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(258, 'WRT000258', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(259, 'WRT000259', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(260, 'WRT000260', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(261, 'WRT000261', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(262, 'WRT000262', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(263, 'WRT000263', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(264, 'WRT000264', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(265, 'WRT000265', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(266, 'WRT000266', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(267, 'WRT000267', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(268, 'WRT000268', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(269, 'WRT000269', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(270, 'WRT000270', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(271, 'WRT000271', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(272, 'WRT000272', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(273, 'WRT000273', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(274, 'WRT000274', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(275, 'WRT000275', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(276, 'WRT000276', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(277, 'WRT000277', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(278, 'WRT000278', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(279, 'WRT000279', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(280, 'WRT000280', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(281, 'WRT000281', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(282, 'WRT000282', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(283, 'WRT000283', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(284, 'WRT000284', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(285, 'WRT000285', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(286, 'WRT000286', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(287, 'WRT000287', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(288, 'WRT000288', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(289, 'WRT000289', 6, 0, '2022-08-30', '2025-08-30', '2023-02-28'),
(290, 'WRT000290', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(291, 'WRT000291', 10, 1, '2022-04-02', '2027-04-02', '2023-02-28'),
(292, 'WRT000292', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(293, 'WRT000293', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(294, 'WRT000294', 4, 1, '2023-02-28', '2025-03-15', '2023-02-28'),
(296, 'WRT000296', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(297, 'WRT000297', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(298, 'WRT000298', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(299, 'WRT000299', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(300, 'WRT000300', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(301, 'WRT000301', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(302, 'WRT000302', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(303, 'WRT000303', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(304, 'WRT000304', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(305, 'WRT000305', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(306, 'WRT000306', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(307, 'WRT000307', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(308, 'WRT000308', 6, 1, '2023-02-28', '2025-02-28', '2023-02-28'),
(309, 'WRT000309', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(310, 'WRT000310', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(311, 'WRT000311', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(312, 'WRT000312', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(313, 'WRT000313', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(314, 'WRT000314', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(315, 'WRT000315', 4, 0, '2022-09-16', '2024-09-16', '2023-02-28'),
(316, 'WRT000316', 4, 0, '2022-09-16', '2024-09-16', '2023-02-28'),
(317, 'WRT000317', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(318, 'WRT000318', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(319, 'WRT000319', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(320, 'WRT000320', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(321, 'WRT000321', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(322, 'WRT000322', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(323, 'WRT000323', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(324, 'WRT000324', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(325, 'WRT000325', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(326, 'WRT000326', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(327, 'WRT000327', 6, 0, '2022-09-22', '2025-09-22', '2023-02-28'),
(328, 'WRT000328', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(329, 'WRT000329', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(330, 'WRT000330', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(331, 'WRT000331', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(332, 'WRT000332', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(333, 'WRT000333', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(334, 'WRT000334', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(335, 'WRT000335', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(336, 'WRT000336', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(337, 'WRT000337', 4, 1, '2023-02-28', '2024-03-08', '2023-02-28'),
(338, 'WRT000338', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(339, 'WRT000339', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(340, 'WRT000340', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(341, 'WRT000341', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(342, 'WRT000342', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(343, 'WRT000343', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(344, 'WRT000344', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(345, 'WRT000345', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(346, 'WRT000346', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(347, 'WRT000347', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(348, 'WRT000348', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(349, 'WRT000349', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(350, 'WRT000350', 8, 0, '2022-10-05', '2026-10-05', '2023-02-28'),
(351, 'WRT000351', 4, 0, '2023-02-28', '2025-02-28', '2023-02-28'),
(352, 'WRT000352', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(353, 'WRT000353', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(354, 'WRT000354', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(355, 'WRT000355', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(356, 'WRT000356', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(357, 'WRT000357', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(358, 'WRT000358', 6, 0, '2022-10-11', '2025-10-11', '2023-02-28'),
(359, 'WRT000359', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(360, 'WRT000360', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(361, 'WRT000361', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(362, 'WRT000362', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(363, 'WRT000363', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(364, 'WRT000364', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(365, 'WRT000365', 4, 0, '2022-10-14', '2024-10-14', '2023-02-28'),
(366, 'WRT000366', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(367, 'WRT000367', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(368, 'WRT000368', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(369, 'WRT000369', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(370, 'WRT000370', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(371, 'WRT000371', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(372, 'WRT000372', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(373, 'WRT000373', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(374, 'WRT000374', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(375, 'WRT000375', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(376, 'WRT000376', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(377, 'WRT000377', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(378, 'WRT000378', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(379, 'WRT000379', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(380, 'WRT000380', 6, 0, '2022-10-22', '2025-10-22', '2023-02-28'),
(381, 'WRT000381', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(382, 'WRT000382', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(383, 'WRT000383', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(384, 'WRT000384', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(385, 'WRT000385', 4, 0, '2022-10-25', '2024-10-25', '2023-02-28'),
(386, 'WRT000386', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(387, 'WRT000387', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(388, 'WRT000388', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(389, 'WRT000389', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(390, 'WRT000390', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(391, 'WRT000391', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(392, 'WRT000392', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(393, 'WRT000393', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(394, 'WRT000394', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(395, 'WRT000395', 4, 0, '2022-11-01', '2024-11-01', '2023-02-28'),
(396, 'WRT000396', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(397, 'WRT000397', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(398, 'WRT000398', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(399, 'WRT000399', 5, 0, '2022-11-02', '2027-11-02', '2023-02-28'),
(400, 'WRT000400', 6, 0, '2022-11-02', '2025-11-02', '2023-02-28'),
(401, 'WRT000401', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(402, 'WRT000402', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(403, 'WRT000403', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(404, 'WRT000404', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(405, 'WRT000405', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(406, 'WRT000406', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(407, 'WRT000407', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(408, 'WRT000408', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(409, 'WRT000409', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(410, 'WRT000410', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(411, 'WRT000411', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(412, 'WRT000412', 6, 0, '2022-11-10', '2025-11-10', '2023-02-28'),
(413, 'WRT000413', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(414, 'WRT000414', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(415, 'WRT000415', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(416, 'WRT000416', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(417, 'WRT000417', 4, 0, '2022-11-12', '2024-11-12', '2023-02-28'),
(418, 'WRT000418', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(419, 'WRT000419', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(420, 'WRT000420', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(421, 'WRT000421', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(422, 'WRT000422', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(423, 'WRT000423', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(424, 'WRT000424', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(425, 'WRT000425', 6, 0, '2022-11-17', '2025-11-17', '2023-02-28'),
(426, 'WRT000426', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(427, 'WRT000427', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(428, 'WRT000428', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(429, 'WRT000429', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(430, 'WRT000430', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(431, 'WRT000431', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(432, 'WRT000432', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(433, 'WRT000433', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(434, 'WRT000434', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(435, 'WRT000435', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(436, 'WRT000436', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(437, 'WRT000437', 4, 0, '2022-11-23', '2024-11-23', '2023-02-28'),
(438, 'WRT000438', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(439, 'WRT000439', 4, 0, '2022-11-25', '2024-11-25', '2023-02-28'),
(440, 'WRT000440', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(441, 'WRT000441', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(442, 'WRT000442', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(443, 'WRT000443', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(444, 'WRT000444', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(445, 'WRT000445', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(446, 'WRT000446', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(447, 'WRT000447', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(448, 'WRT000448', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(449, 'WRT000449', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(450, 'WRT000450', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(451, 'WRT000451', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(452, 'WRT000452', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(453, 'WRT000453', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(454, 'WRT000454', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(455, 'WRT000455', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(456, 'WRT000456', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(457, 'WRT000457', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(458, 'WRT000458', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(459, 'WRT000459', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(460, 'WRT000460', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(461, 'WRT000461', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(462, 'WRT000462', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(463, 'WRT000463', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(464, 'WRT000464', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(465, 'WRT000465', 6, 0, '2022-12-07', '2025-12-07', '2023-02-28'),
(466, 'WRT000466', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(467, 'WRT000467', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(468, 'WRT000468', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(469, 'WRT000469', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(470, 'WRT000470', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(471, 'WRT000471', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(472, 'WRT000472', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(473, 'WRT000473', 6, 0, '2022-12-13', '2025-12-13', '2023-02-28'),
(474, 'WRT000474', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(475, 'WRT000475', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(476, 'WRT000476', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(477, 'WRT000477', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(478, 'WRT000478', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(479, 'WRT000479', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(480, 'WRT000480', 4, 0, '2022-12-17', '2024-12-17', '2023-02-28'),
(481, 'WRT000481', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(482, 'WRT000482', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(483, 'WRT000483', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(484, 'WRT000484', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(485, 'WRT000485', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(486, 'WRT000486', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(487, 'WRT000487', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(488, 'WRT000488', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(489, 'WRT000489', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(490, 'WRT000490', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(491, 'WRT000491', 6, 0, '2022-12-26', '2025-12-26', '2023-02-28'),
(492, 'WRT000492', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(493, 'WRT000493', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(494, 'WRT000494', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(495, 'WRT000495', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(496, 'WRT000496', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(497, 'WRT000497', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(498, 'WRT000498', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(499, 'WRT000499', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(500, 'WRT000500', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(501, 'WRT000501', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(502, 'WRT000502', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(503, 'WRT000503', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(504, 'WRT000504', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(505, 'WRT000505', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(506, 'WRT000506', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(507, 'WRT000507', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(508, 'WRT000508', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(509, 'WRT000509', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(510, 'WRT000510', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(511, 'WRT000511', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(512, 'WRT000512', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(513, 'WRT000513', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(514, 'WRT000514', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(515, 'WRT000515', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(516, 'WRT000516', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(517, 'WRT000517', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(518, 'WRT000518', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(519, 'WRT000519', 6, 0, '2023-01-06', '2026-01-06', '2023-02-28'),
(520, 'WRT000520', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(521, 'WRT000521', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(522, 'WRT000522', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(523, 'WRT000523', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(524, 'WRT000524', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(525, 'WRT000525', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(526, 'WRT000526', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(527, 'WRT000527', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(528, 'WRT000528', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(529, 'WRT000529', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(530, 'WRT000530', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(531, 'WRT000531', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(532, 'WRT000532', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(533, 'WRT000533', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(534, 'WRT000534', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(535, 'WRT000535', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(536, 'WRT000536', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(537, 'WRT000537', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(538, 'WRT000538', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(539, 'WRT000539', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(540, 'WRT000540', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(541, 'WRT000541', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(542, 'WRT000542', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(543, 'WRT000543', 4, 0, '2023-01-19', '2025-01-19', '2023-02-28'),
(544, 'WRT000544', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(545, 'WRT000545', 0, 0, '2023-01-14', '2025-01-14', '2023-02-28'),
(546, 'WRT000546', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(547, 'WRT000547', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(548, 'WRT000548', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(549, 'WRT000549', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(550, 'WRT000550', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(551, 'WRT000551', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(552, 'WRT000552', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(553, 'WRT000553', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(554, 'WRT000554', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(555, 'WRT000555', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(556, 'WRT000556', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(557, 'WRT000557', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(558, 'WRT000558', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(559, 'WRT000559', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(560, 'WRT000560', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(561, 'WRT000561', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(562, 'WRT000562', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(563, 'WRT000563', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(564, 'WRT000564', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(565, 'WRT000565', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(566, 'WRT000566', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(567, 'WRT000567', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(568, 'WRT000568', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(569, 'WRT000569', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(570, 'WRT000570', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(571, 'WRT000571', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(572, 'WRT000572', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(573, 'WRT000573', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(574, 'WRT000574', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(575, 'WRT000575', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(576, 'WRT000576', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(577, 'WRT000577', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(578, 'WRT000578', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(579, 'WRT000579', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(580, 'WRT000580', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(581, 'WRT000581', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(582, 'WRT000582', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(583, 'WRT000583', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(584, 'WRT000584', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(585, 'WRT000585', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(586, 'WRT000586', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(587, 'WRT000587', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(588, 'WRT000588', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(589, 'WRT000589', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(590, 'WRT000590', 10, 0, '2023-02-13', '2028-02-13', '2023-02-28'),
(591, 'WRT000591', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(592, 'WRT000592', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(593, 'WRT000593', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(594, 'WRT000594', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(595, 'WRT000595', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(596, 'WRT000596', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(597, 'WRT000597', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(598, 'WRT000598', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(599, 'WRT000599', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(600, 'WRT000600', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(601, 'WRT000601', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(602, 'WRT000602', 0, 0, '2023-02-28', '2023-02-28', '2023-02-28'),
(606, 'WRT000604', 0, 0, '2023-03-01', '2023-03-01', '2023-03-01'),
(607, 'WRT000605', 5, 0, '2023-03-01', '2028-03-01', '2023-03-01'),
(608, 'WRT000606', 4, 0, '2023-03-01', '2024-03-02', '2023-03-01'),
(609, 'WRT000607', 5, 0, '2023-03-02', '2028-03-02', '2023-03-02'),
(610, 'WRT000608', 4, 0, '2023-03-02', '2025-03-02', '2023-03-02'),
(611, 'WRT000609', 0, 0, '2023-03-03', '2023-03-03', '2023-03-03'),
(615, 'WRT000611', 5, 0, '2023-03-04', '2028-03-04', '2023-03-04'),
(616, 'WRT000612', 4, 0, '2023-03-04', '2025-03-04', '2023-03-04'),
(617, 'WRT000613', 6, 0, '2023-03-04', '2026-03-04', '2023-03-04'),
(618, 'WRT000614', 4, 0, '2023-03-04', '2024-03-13', '2023-03-04'),
(619, 'WRT000615', 5, 0, '2023-03-04', '2028-03-04', '2023-03-04'),
(620, 'WRT000616', 0, 0, '2023-03-05', '2023-03-05', '2023-03-05'),
(624, 'WRT000618', 5, 0, '2023-03-06', '2028-03-06', '2023-03-06'),
(625, 'WRT000619', 6, 0, '2023-03-07', '2026-03-07', '2023-03-07'),
(626, 'WRT000620', 4, 0, '2023-03-07', '2025-03-07', '2023-03-07'),
(627, 'WRT000621', 2, 0, '2023-03-07', '2024-03-07', '2023-03-07'),
(628, 'WRT000622', 4, 0, '2023-03-08', '2025-03-17', '2023-03-08'),
(629, 'WRT000623', 6, 0, '2023-03-08', '2025-03-07', '2023-03-08'),
(630, 'WRT000624', 4, 0, '2023-03-08', '2024-03-08', '2023-03-08'),
(631, 'WRT000625', 4, 0, '2023-03-08', '2024-03-08', '2023-03-08'),
(632, 'WRT000626', 6, 0, '2023-03-09', '2025-03-09', '2023-03-09'),
(633, 'WRT000627', 6, 0, '2023-03-09', '2025-03-09', '2023-03-09'),
(634, 'WRT000628', 6, 0, '2023-03-09', '2025-03-09', '2023-03-09'),
(635, 'WRT000629', 6, 0, '2023-03-09', '2025-03-08', '2023-03-09'),
(636, 'WRT000630', 4, 0, '2023-03-10', '2024-03-10', '2023-03-10'),
(637, 'WRT000631', 4, 0, '2023-03-10', '2024-03-10', '2023-03-10'),
(638, 'WRT000632', 4, 0, '2023-03-10', '2024-03-10', '2023-03-10'),
(639, 'WRT000633', 4, 0, '2023-03-11', '2025-03-14', '2023-03-11'),
(640, 'WRT000634', 4, 0, '2023-03-11', '2024-03-11', '2023-03-11'),
(641, 'WRT000635', 4, 0, '2023-03-11', '2025-03-11', '2023-03-11'),
(642, 'WRT000636', 6, 0, '2023-03-13', '2026-03-13', '2023-03-13'),
(643, 'WRT000637', 5, 0, '2023-03-13', '2027-03-13', '2023-03-13'),
(644, 'WRT000638', 6, 0, '2023-03-14', '2026-03-15', '2023-03-14'),
(645, 'WRT000639', 6, 0, '2023-03-14', '2026-03-14', '2023-03-14'),
(646, 'WRT000640', 10, 0, '2023-03-14', '2028-03-14', '2023-03-14'),
(647, 'WRT000641', 5, 0, '2023-03-15', '2028-03-15', '2023-03-15'),
(648, 'WRT000642', 4, 0, '2023-03-16', '2025-03-16', '2023-03-16'),
(649, 'WRT000643', 2, 0, '2023-03-16', '2024-03-16', '2023-03-16'),
(650, 'WRT000644', 6, 0, '2023-03-16', '2026-03-16', '2023-03-16'),
(651, 'WRT000645', 6, 0, '2023-03-18', '2026-03-18', '2023-03-18'),
(652, 'WRT000646', 4, 0, '2023-03-18', '2025-03-18', '2023-03-18'),
(653, 'WRT000647', 6, 0, '2023-03-20', '2026-03-20', '2023-03-20'),
(654, 'WRT000648', 6, 0, '2023-03-20', '2026-03-20', '2023-03-20'),
(655, 'WRT000649', 6, 0, '2023-03-20', '2026-03-20', '2023-03-20'),
(656, 'WRT000650', 5, 0, '2023-03-20', '2028-03-20', '2023-03-20'),
(657, 'WRT000651', 6, 0, '2023-03-20', '2026-03-20', '2023-03-20'),
(658, 'WRT000652', 2, 0, '2023-03-21', '2024-03-21', '2023-03-21'),
(659, 'WRT000653', 4, 0, '2023-03-22', '2025-03-22', '2023-03-21'),
(660, 'WRT000654', 10, 0, '2023-03-23', '2028-03-23', '2023-03-23'),
(661, 'WRT000655', 10, 0, '2023-03-23', '2028-03-23', '2023-03-23'),
(662, 'WRT000656', 5, 0, '2023-03-23', '2028-03-23', '2023-03-23'),
(663, 'WRT000657', 5, 0, '2023-03-23', '2028-03-23', '2023-03-23'),
(664, 'WRT000658', 4, 0, '2023-03-23', '2025-03-23', '2023-03-23'),
(665, 'WRT000659', 6, 0, '2023-03-24', '2026-03-24', '2023-03-24'),
(666, 'WRT000660', 10, 0, '2023-03-24', '2028-03-24', '2023-03-24'),
(667, 'WRT000661', 6, 0, '2023-03-24', '2026-03-24', '2023-03-24'),
(668, 'WRT000662', 6, 0, '2023-03-24', '2026-03-24', '2023-03-24'),
(669, 'WRT000663', 6, 0, '2023-03-24', '2026-03-24', '2023-03-24'),
(670, 'WRT000664', 4, 0, '2023-03-25', '2025-03-25', '2023-03-25'),
(671, 'WRT000665', 4, 0, '2023-03-25', '2025-03-25', '2023-03-25'),
(672, 'WRT000666', 6, 0, '2023-03-25', '2026-03-25', '2023-03-25'),
(673, 'WRT000667', 6, 0, '2023-03-26', '2026-03-26', '2023-03-26'),
(674, 'WRT000668', 4, 0, '2023-03-26', '2025-03-26', '2023-03-26'),
(675, 'WRT000669', 5, 4, '2023-02-26', '2026-03-27', '2023-03-26'),
(676, 'WRT000670', 6, 0, '2023-03-27', '2026-03-27', '2023-03-27'),
(677, 'WRT000671', 0, 0, '2023-03-27', '2023-03-27', '2023-03-27'),
(678, 'WRT000672', 10, 0, '2023-03-27', '2028-03-27', '2023-03-27'),
(679, 'WRT000673', 4, 0, '2023-03-23', '2025-06-23', '2023-03-28'),
(680, 'WRT000674', 0, 0, '2023-03-28', '2026-03-28', '2023-03-28'),
(681, 'WRT000675', 6, 0, '2023-03-29', '2026-03-29', '2023-03-29'),
(682, 'WRT000676', 4, 0, '2023-03-29', '2025-03-29', '2023-03-29'),
(683, 'WRT000677', 4, 0, '2023-03-30', '2025-03-30', '2023-03-30'),
(684, 'WRT000678', 5, 0, '2023-03-30', '2028-03-30', '2023-03-30'),
(685, 'WRT000679', 0, 0, '2023-03-30', '2026-03-30', '2023-03-30'),
(686, 'WRT000680', 10, 0, '2023-04-01', '2028-04-01', '2023-03-31'),
(687, 'WRT000681', 0, 0, '2023-03-31', '2023-03-31', '2023-03-31'),
(688, 'WRT000682', 4, 0, '2023-03-31', '2025-03-31', '2023-03-31'),
(689, 'WRT000683', 6, 0, '2023-03-31', '2026-03-31', '2023-03-31'),
(690, 'WRT000684', 5, 0, '2023-03-31', '2028-03-31', '2023-03-31'),
(691, 'WRT000685', 5, 0, '2023-03-31', '2028-03-31', '2023-03-31'),
(692, 'WRT000686', 6, 0, '2023-04-01', '2026-04-01', '2023-04-01'),
(693, 'WRT000687', 6, 0, '2023-04-01', '2026-04-01', '2023-04-01'),
(694, 'WRT000688', 10, 0, '2023-04-01', '2028-04-01', '2023-04-01'),
(695, 'WRT000689', 6, 0, '2023-04-03', '2026-04-03', '2023-04-03'),
(703, 'WRT000697', 6, 0, '2023-04-04', '2026-04-04', '2023-04-04'),
(704, 'WRT000698', 2, 0, '2023-04-04', '2024-04-04', '2023-04-04'),
(705, 'WRT000699', 10, 0, '2023-04-04', '2028-04-04', '2023-04-04'),
(707, 'WRT000700', 5, 0, '2023-04-05', '2028-04-05', '2023-04-05'),
(708, 'WRT000701', 4, 0, '2023-04-05', '2025-04-05', '2023-04-05'),
(709, 'WRT000702', 0, 0, '2023-04-05', '2025-04-05', '2023-04-05'),
(710, 'WRT000703', 0, 0, '2023-04-06', '2026-04-06', '2023-04-06'),
(711, 'WRT000704', 0, 0, '2023-04-06', '2023-04-06', '2023-04-06'),
(712, 'WRT000705', 6, 0, '2023-04-06', '2026-04-06', '2023-04-06'),
(713, 'WRT000706', 4, 0, '2023-04-06', '2025-04-06', '2023-04-06'),
(714, 'WRT000707', 6, 0, '2023-04-06', '2026-04-06', '2023-04-06'),
(715, 'WRT000708', 0, 0, '2023-04-08', '2023-04-08', '2023-04-08'),
(716, 'WRT000709', 5, 0, '2023-04-08', '2028-04-08', '2023-04-08'),
(717, 'WRT000710', 4, 0, '2023-04-08', '2025-04-08', '2023-04-08'),
(718, 'WRT000711', 4, 0, '2023-04-09', '2025-04-09', '2023-04-09'),
(719, 'WRT000712', 4, 0, '2023-04-10', '2025-04-10', '2023-04-10'),
(720, 'WRT000713', 5, 0, '2023-04-10', '2028-04-10', '2023-04-10'),
(721, 'WRT000714', 6, 0, '2023-01-07', '2026-01-07', '2023-04-10'),
(722, 'WRT000715', 6, 0, '2023-04-10', '2026-04-10', '2023-04-10'),
(723, 'WRT000716', 6, 0, '2023-04-11', '2026-04-11', '2023-04-11'),
(724, 'WRT000717', 6, 0, '2022-11-11', '2025-11-11', '2023-04-11'),
(725, 'WRT000718', 10, 0, '2022-12-24', '2027-12-24', '2023-04-11'),
(726, 'WRT000719', 4, 0, '2022-12-28', '2024-12-28', '2023-04-11'),
(727, 'WRT000720', 4, 0, '2023-01-06', '2025-01-06', '2023-04-11'),
(728, 'WRT000721', 6, 0, '2023-01-06', '2026-01-06', '2023-04-11'),
(729, 'WRT000722', 4, 0, '2023-01-07', '2025-01-07', '2023-04-11'),
(730, 'WRT000723', 6, 0, '2023-01-11', '2026-01-11', '2023-04-11'),
(731, 'WRT000724', 6, 0, '2023-01-01', '2026-01-11', '2023-04-11'),
(732, 'WRT000725', 4, 0, '2023-04-11', '2025-04-11', '2023-04-11'),
(733, 'WRT000726', 6, 0, '2023-01-20', '2026-01-20', '2023-04-11'),
(734, 'WRT000727', 4, 0, '2023-04-11', '2025-04-11', '2023-04-11'),
(735, 'WRT000728', 6, 0, '2023-04-11', '2026-04-11', '2023-04-11'),
(736, 'WRT000729', 5, 0, '2023-04-12', '2028-04-12', '2023-04-12'),
(737, 'WRT000730', 5, 0, '2023-04-12', '2028-04-12', '2023-04-12'),
(738, 'WRT000731', 0, 0, '2023-04-12', '2023-04-12', '2023-04-12'),
(739, 'WRT000732', 6, 0, '2023-04-12', '2026-04-12', '2023-04-12'),
(740, 'WRT000733', 0, 0, '2023-04-12', '2023-04-12', '2023-04-12'),
(741, 'WRT000734', 4, 0, '2023-04-12', '2025-04-12', '2023-04-12'),
(742, 'WRT000735', 4, 0, '2023-04-13', '2025-04-13', '2023-04-13'),
(743, 'WRT000736', 1, 0, '2023-04-13', '2024-04-13', '2023-04-13'),
(744, 'WRT000737', 0, 0, '2023-04-13', '2023-04-13', '2023-04-13'),
(745, 'WRT000738', 4, 0, '2023-04-14', '2025-04-14', '2023-04-14'),
(746, 'WRT000739', 0, 0, '2023-04-14', '2023-04-14', '2023-04-14'),
(747, 'WRT000740', 4, 0, '2023-04-15', '2025-04-15', '2023-04-15'),
(748, 'WRT000741', 4, 0, '2023-04-15', '2025-04-15', '2023-04-15'),
(749, 'WRT000742', 5, 0, '2023-04-15', '2028-04-15', '2023-04-15'),
(750, 'WRT000743', 5, 0, '2023-04-15', '2028-04-15', '2023-04-15'),
(751, 'WRT000744', 10, 0, '2023-04-15', '2028-04-15', '2023-04-15'),
(752, 'WRT000745', 5, 0, '2023-04-16', '2028-04-16', '2023-04-16'),
(753, 'WRT000746', 5, 0, '2023-04-17', '2028-04-17', '2023-04-17'),
(754, 'WRT000747', 6, 0, '2023-04-17', '2026-04-17', '2023-04-17'),
(755, 'WRT000748', 6, 0, '2023-04-19', '2026-04-19', '2023-04-19'),
(756, 'WRT000749', 6, 0, '2023-04-19', '2026-04-19', '2023-04-19'),
(757, 'WRT000750', 5, 0, '2023-04-20', '2028-04-20', '2023-04-20'),
(758, 'WRT000751', 5, 0, '2023-04-27', '2028-04-27', '2023-04-27'),
(759, 'WRT000752', 6, 0, '2023-04-27', '2026-04-27', '2023-04-27'),
(760, 'WRT000753', 6, 0, '2023-04-27', '2026-04-27', '2023-04-27'),
(761, 'WRT000754', 0, 0, '2023-04-28', '2025-04-28', '2023-04-28'),
(762, 'WRT000755', 6, 0, '2023-05-02', '2026-05-02', '2023-05-02'),
(763, 'WRT000756', 0, 0, '2023-05-03', '2023-05-03', '2023-05-03'),
(764, 'WRT000757', 10, 0, '2023-05-03', '2028-05-03', '2023-05-03'),
(765, 'WRT000758', 4, 0, '2023-05-05', '2025-05-05', '2023-05-05'),
(766, 'WRT000759', 4, 0, '2023-05-06', '2025-05-06', '2023-05-06'),
(767, 'WRT000760', 4, 0, '2023-05-06', '2025-05-06', '2023-05-06'),
(768, 'WRT000761', 6, 0, '2023-05-06', '2026-05-06', '2023-05-06'),
(769, 'WRT000762', 0, 0, '2023-05-08', '2023-05-08', '2023-05-08'),
(770, 'WRT000763', 5, 0, '2023-05-15', '2028-05-15', '2023-05-08'),
(771, 'WRT000764', 5, 0, '2023-05-08', '2028-05-08', '2023-05-08'),
(772, 'WRT000765', 4, 0, '2023-05-23', '2025-05-23', '2023-05-09'),
(773, 'WRT000766', 4, 0, '2023-05-09', '2025-05-09', '2023-05-09'),
(774, 'WRT000767', 1, 0, '2023-05-10', '2024-05-10', '2023-05-10'),
(775, 'WRT000768', 5, 0, '2023-05-10', '2028-05-10', '2023-05-10');
INSERT INTO `t_garansi` (`id`, `id_data`, `batas`, `terpakai`, `tgl_mulai`, `tgl_akhir`, `tgl`) VALUES
(776, 'WRT000769', 6, 0, '2023-05-11', '2026-05-11', '2023-05-11'),
(777, 'WRT000770', 4, 0, '2023-05-11', '2025-05-11', '2023-05-11'),
(778, 'WRT000771', 4, 0, '2023-05-11', '2025-05-11', '2023-05-11'),
(779, 'WRT000772', 6, 0, '2023-05-11', '2026-05-11', '2023-05-11'),
(780, 'WRT000773', 6, 0, '2023-05-11', '2026-05-11', '2023-05-11'),
(781, 'WRT000774', 4, 0, '2023-05-12', '2025-05-12', '2023-05-12'),
(782, 'WRT000775', 6, 0, '2022-12-20', '2025-12-20', '2023-05-12'),
(783, 'WRT000776', 4, 0, '2023-05-12', '2025-05-12', '2023-05-12'),
(784, 'WRT000777', 4, 0, '2023-05-12', '2025-05-12', '2023-05-12'),
(785, 'WRT000778', 0, 0, '2023-05-13', '2023-05-13', '2023-05-13'),
(786, 'WRT000779', 5, 0, '2023-05-13', '2028-05-13', '2023-05-13'),
(787, 'WRT000780', 0, 0, '2023-05-13', '2023-05-13', '2023-05-13'),
(788, 'WRT000781', 6, 0, '2023-05-13', '2026-05-13', '2023-05-13'),
(789, 'WRT000782', 4, 0, '2023-05-13', '2025-05-13', '2023-05-13'),
(790, 'WRT000783', 4, 0, '2023-05-15', '2025-05-15', '2023-05-15'),
(791, 'WRT000784', 6, 0, '2023-05-16', '2026-05-16', '2023-05-16'),
(792, 'WRT000785', 6, 0, '2023-05-17', '2026-05-17', '2023-05-17'),
(793, 'WRT000786', 6, 0, '2023-05-18', '2026-05-18', '2023-05-18'),
(794, 'WRT000787', 4, 0, '2023-05-19', '2025-05-19', '2023-05-19'),
(795, 'WRT000788', 0, 0, '2023-05-19', '2023-05-19', '2023-05-19'),
(796, 'WRT000789', 4, 0, '2023-05-19', '2025-05-19', '2023-05-19'),
(797, 'WRT000790', 6, 0, '2023-05-19', '2026-05-19', '2023-05-19'),
(798, 'WRT000791', 10, 0, '2023-05-22', '2028-05-22', '2023-05-22'),
(799, 'WRT000792', 4, 0, '2023-05-22', '2025-05-22', '2023-05-22'),
(800, 'WRT000793', 0, 0, '2023-05-22', '2023-05-22', '2023-05-22'),
(801, 'WRT000794', 4, 0, '2023-05-22', '2025-05-22', '2023-05-22'),
(802, 'WRT000795', 10, 0, '2023-05-22', '2028-05-22', '2023-05-22'),
(803, 'WRT000796', 6, 0, '2023-05-22', '2026-05-22', '2023-05-22'),
(804, 'WRT000797', 0, 0, '2023-05-23', '2023-05-23', '2023-05-23'),
(805, 'WRT000798', 5, 0, '2023-05-23', '2025-05-23', '2023-05-23'),
(806, 'WRT000799', 5, 0, '2023-05-24', '2028-05-24', '2023-05-24'),
(807, 'WRT000800', 0, 0, '2023-05-24', '2023-05-24', '2023-05-24'),
(808, 'WRT000801', 0, 0, '2023-05-24', '2023-05-24', '2023-05-24'),
(809, 'WRT000802', 4, 0, '2023-05-24', '2025-05-24', '2023-05-24'),
(810, 'WRT000803', 0, 0, '2023-05-24', '2023-05-24', '2023-05-24'),
(811, 'WRT000804', 4, 0, '2023-05-25', '2025-05-25', '2023-05-25'),
(812, 'WRT000805', 0, 0, '2023-05-25', '2023-05-25', '2023-05-25'),
(813, 'WRT000806', 0, 0, '2023-05-25', '2023-05-25', '2023-05-25'),
(814, 'WRT000807', 0, 0, '2023-05-26', '2023-05-26', '2023-05-26'),
(815, 'WRT000808', 0, 0, '2023-05-26', '2023-05-26', '2023-05-26'),
(816, 'WRT000809', 0, 0, '2023-05-27', '2023-05-27', '2023-05-27'),
(817, 'WRT000810', 0, 0, '2023-05-27', '2023-05-27', '2023-05-27'),
(818, 'WRT000811', 0, 0, '2023-05-27', '2023-05-27', '2023-05-27');

-- --------------------------------------------------------

--
-- Table structure for table `t_histori_gaji`
--

CREATE TABLE `t_histori_gaji` (
  `id` int(11) NOT NULL,
  `jabatan` int(11) NOT NULL,
  `tgl_gajian` date NOT NULL,
  `bonus` int(11) NOT NULL,
  `id_pegawai` varchar(11) NOT NULL,
  `overtime` int(11) NOT NULL,
  `lembur` int(11) NOT NULL,
  `dinas` int(11) NOT NULL,
  `makan` int(11) NOT NULL,
  `transport` int(11) NOT NULL,
  `gajix` int(11) NOT NULL,
  `insentif` int(11) NOT NULL,
  `gajikotor` int(11) NOT NULL,
  `potongan` int(11) NOT NULL,
  `gajibersih` int(11) NOT NULL,
  `pegawai` int(11) NOT NULL,
  `potonganjht` int(11) NOT NULL,
  `sts_hapus` int(1) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `sts_gaji` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_histori_gaji`
--

INSERT INTO `t_histori_gaji` (`id`, `jabatan`, `tgl_gajian`, `bonus`, `id_pegawai`, `overtime`, `lembur`, `dinas`, `makan`, `transport`, `gajix`, `insentif`, `gajikotor`, `potongan`, `gajibersih`, `pegawai`, `potonganjht`, `sts_hapus`, `date`, `sts_gaji`) VALUES
(60, 0, '2023-05-29', 0, '151', 45000, 400000, 0, 292296, 0, 1096148, 30000, 1863444, 1000000, 816858, 0, 46586, 0, '2023-05-29 09:23:33', 0),
(57, 10000, '2023-05-29', 888, '175', 666, 999, 0, 2555, 55, 2000, 888, 17163, 6666, 11135, 0, 250, 0, '2023-05-29 02:40:54', 1),
(58, 20, '2023-05-29', 999, '222', 999, 999, 0, 999, 999, 666, 999, 5681, 999, 5681, 0, 1, 0, '2023-05-29 02:41:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_history`
--

CREATE TABLE `t_history` (
  `id` int(11) NOT NULL,
  `tgl_pakai` date NOT NULL,
  `waranti` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  `tgl_time` datetime NOT NULL DEFAULT current_timestamp(),
  `harga_w` int(11) NOT NULL,
  `harga_p` int(11) NOT NULL,
  `pekerjaan` varchar(20) NOT NULL,
  `status_bayar` varchar(1) NOT NULL,
  `sts_kerja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_history`
--

INSERT INTO `t_history` (`id`, `tgl_pakai`, `waranti`, `keterangan`, `tgl_time`, `harga_w`, `harga_p`, `pekerjaan`, `status_bayar`, `sts_kerja`) VALUES
(152, '2023-04-05', 'WRT000109', 'KM 10.109 / BARET JAMUR ', '2023-04-05 16:48:18', 500000, 500000, '150', 'B', 1),
(156, '2023-04-08', 'WRT000097', '', '2023-04-08 11:28:27', 500000, 500000, '153', 'B', 1),
(157, '2023-04-12', 'WRT000351', 'TREATMENT COATING', '2023-04-08 11:30:55', 500000, 500000, '151', 'B', 1),
(158, '2023-04-15', 'WRT000327', 'TREATMENT COATING', '2023-04-08 11:32:25', 500000, 500000, '150', 'B', 1),
(159, '2023-04-14', 'WRT000180', 'TREATMENT COATING', '2023-04-08 11:37:40', 500000, 500000, '150', 'B', 1),
(160, '2023-04-18', 'WRT000178', 'TREATMENT COATING', '2023-04-08 11:42:04', 500000, 500000, '149', 'B', 1),
(161, '2023-04-12', 'WRT000255', 'TREATMENT COATING', '2023-04-10 15:55:40', 500000, 500000, '150', 'B', 1),
(162, '2023-04-15', 'WRT000714', 'TREATMENT COATING', '2023-04-10 16:05:07', 500000, 500000, '153', 'B', 1),
(163, '2023-04-11', 'WRT000590', 'TREATMENT COATING', '2023-04-10 17:00:07', 500000, 500000, '151', 'B', 1),
(164, '2023-04-11', 'WRT000016', 'TREATMENT COATING', '2023-04-11 09:59:47', 500000, 500000, '150', 'B', 1),
(165, '2023-04-13', 'WRT000417', 'TREATMENT', '2023-04-11 17:18:50', 500000, 500000, '153', 'T', 3),
(166, '2023-04-13', 'WRT000724', '0', '2023-04-13 12:16:11', 0, 0, '151', 'B', 1),
(167, '2023-04-20', 'WRT000040', 'TREATMENT', '2023-04-17 17:33:16', 500000, 500000, '150', 'B', 1),
(168, '2023-05-09', 'WRT000680', 'BANYAK JAMUR', '2023-04-18 12:06:07', 0, 0, '150', 'T', 3),
(169, '2023-05-27', 'WRT000723', 'TREATMENT', '2023-04-24 00:06:39', 500000, 500000, '151', 'T', 0),
(170, '2023-05-06', 'WRT000465', 'TREATMENT COATING', '2023-04-27 15:26:46', 700000, 700000, '149', 'B', 1),
(171, '2023-04-27', 'WRT000211', 'TREATMENT', '2023-04-27 15:47:10', 500000, 500000, '149', 'B', 1),
(172, '2023-05-10', 'WRT000399', 'TREATMENT COATING', '2023-04-28 14:27:51', 1000000, 1000000, '153', 'B', 1),
(173, '2023-04-28', 'WRT000620', 'TREATMENT COATING', '2023-04-28 14:38:37', 700000, 700000, '150', 'B', 1),
(174, '2023-05-09', 'WRT000028', 'TREATMENT', '2023-04-29 11:56:01', 750000, 750000, '153', 'T', 0),
(175, '2023-05-05', 'WRT000182', 'TREATMEN COATING', '2023-05-01 09:20:41', 500000, 500000, '153', 'B', 1),
(176, '2023-05-05', 'WRT000070', 'TREATMENT COATING', '2023-05-01 09:22:51', 500000, 500000, '149', 'B', 1),
(177, '2023-05-02', 'WRT000543', 'BANYAK JAMUR', '2023-05-02 11:06:05', 0, 0, '149', 'B', 1),
(178, '2023-05-02', 'WRT000626', 'BARET HALUS', '2023-05-02 11:46:17', 0, 0, '153', 'B', 1),
(179, '2023-05-03', 'WRT000742', 'BERCAK, BARET', '2023-05-02 14:30:45', 0, 0, '150', 'B', 1),
(180, '2023-05-04', 'WRT000400', 'TREATMENT', '2023-05-02 15:42:36', 500000, 500000, '153', 'B', 1),
(181, '2023-05-13', 'WRT000491', 'TREATMENT', '2023-05-02 16:13:16', 500000, 500000, '153', 'B', 1),
(182, '2023-05-11', 'WRT000412', 'TREATMENT', '2023-05-02 16:52:37', 500000, 500000, '151', 'B', 1),
(183, '2023-05-04', 'WRT000437', 'TREATMENT', '2023-05-04 10:01:47', 500000, 500000, '151', 'B', 1),
(184, '2023-05-29', 'WRT000473', 'TREATMENT', '2023-05-04 17:44:57', 500000, 500000, '151', 'T', 0),
(185, '2023-05-12', 'WRT000439', 'TREATMENT', '2023-05-05 12:21:27', 500000, 500000, '150', 'B', 1),
(186, '2023-05-20', 'WRT000316', 'TREATMENT', '2023-05-09 17:24:17', 500000, 500000, '150', 'B', 1),
(187, '2023-05-20', 'WRT000315', 'TREATMENT', '2023-05-09 17:25:16', 500000, 500000, '149', 'B', 1),
(188, '2023-05-17', 'WRT000358', 'TREATMENT COATING', '2023-05-10 15:56:05', 500000, 500000, '151', 'B', 1),
(189, '2023-05-13', 'WRT000775', 'TREATMENT COATING', '2023-05-12 10:55:38', 500000, 500000, '151', 'B', 1),
(190, '2023-05-22', 'WRT000519', 'TREATMENT', '2023-05-17 12:06:36', 500000, 500000, '149', 'T', 0),
(191, '2023-06-01', 'WRT000545', 'TREATMENT', '2023-05-17 16:53:31', 500000, 500000, '149', 'T', 0),
(192, '2023-05-19', 'WRT000289', 'TREATMENT', '2023-05-18 13:33:51', 500000, 500000, '149', 'B', 1),
(193, '2023-06-05', 'WRT000350', 'TREATMENT COATING', '2023-05-24 11:45:04', 500000, 500000, '149', 'T', 0),
(194, '2023-05-26', 'WRT000365', 'TREATMENT COATING', '2023-05-26 14:41:00', 0, 0, '150', 'B', 1),
(195, '2023-05-26', 'WRT000395', 'TREATMENT COATING', '2023-05-26 15:14:31', 500000, 500000, '149', 'B', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_jabatan`
--

CREATE TABLE `t_jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `gapok_jabatan` varchar(50) NOT NULL,
  `ket` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_jabatan`
--

INSERT INTO `t_jabatan` (`id_jabatan`, `jabatan`, `gapok_jabatan`, `ket`) VALUES
(1, 'CEO', '3000000', 'Bekasi'),
(2, 'Teknisi', '10000', 'Teknisi'),
(3, 'Sales', '10000', 'sales'),
(5, 'pegawai', '100000', 'pegawai');

-- --------------------------------------------------------

--
-- Table structure for table `t_jht`
--

CREATE TABLE `t_jht` (
  `id` int(11) NOT NULL,
  `id_pegawai` varchar(11) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `tgl_klaim` date NOT NULL,
  `tgl_cair` date NOT NULL,
  `jumlah_jht` int(11) NOT NULL,
  `sts_jht` int(11) NOT NULL,
  `tgl_server` datetime NOT NULL,
  `sts_hapus` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_lembur`
--

CREATE TABLE `t_lembur` (
  `id_lembur` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tgl_lembu` datetime NOT NULL,
  `jml_lembur` int(11) NOT NULL,
  `sts_lembur` enum('N','Y') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_paket`
--

CREATE TABLE `t_paket` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `harga` int(20) NOT NULL,
  `tipe` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_paket`
--

INSERT INTO `t_paket` (`id`, `nama`, `harga`, `tipe`) VALUES
(1, 'x', 1, '1'),
(14, 'PAINT PROTECTION - SMALL', 1000000, '14'),
(15, 'PAINT PROTECTION - MEDIUM', 1200000, '12'),
(16, 'PAINT PROTECTION - LARGE', 1400000, '10'),
(17, 'PAINT PROTECTION - LUXURY', 1600000, '11'),
(18, 'RUST PROTECTION - SMALL', 1600000, '14'),
(19, 'RUST PROTECTION - MEDIUM', 2000000, '12'),
(20, 'RUST PROTECTION - LARGE', 2400000, '10'),
(21, 'RUST PROTECTION - LUXURY', 2600000, '11'),
(22, 'SOUND PROOFING - SMALL', 1300000, '14'),
(23, 'SOUND PROOFING - MEDIUM', 1400000, '12'),
(24, 'SOUND PROOFING - LARGE', 1500000, '10'),
(25, 'SOUND PROOFING - LUXURY', 1600000, '11'),
(30, 'NANO COATING 2 LAYER - SMALL (PAKET GOLD)', 3000000, '14'),
(31, 'NANO COATING 2 LAYER - MEDIUM (PAKET GOLD)', 3500000, '12'),
(32, 'NANO COATING 2 LAYER - LARGE (PAKET GOLD)', 4000000, '10'),
(33, 'NANO COATING 2 LAYER - LUXURY (PAKET GOLD)', 4500000, '11'),
(34, 'NANO COATING 3 LAYER - SMALL (PAKET PLATINUM)', 3500000, '14'),
(35, 'NANO COATING 3 LAYER - MEDIUM (PAKET PLATINUM)', 4000000, '12'),
(36, 'NANO COATING 3 LAYER - LARGE (PAKET PLATINUM)', 4500000, '10'),
(37, 'NANO COATING 3 LAYER - LUXURY (PAKET PLATINUM)', 5000000, '11'),
(39, 'NANO COATING 5 LAYER - SMALL (PAKET ULTIMATE)', 4500000, '14'),
(40, 'NANO COATING 5 LAYER - MEDIUM (PAKET ULTIMATE)', 5500000, '12'),
(41, 'NANO COATING 5 LAYER -LARGE (PAKET ULTIMATE)', 6000000, '10'),
(42, 'NANO COATING 5 LAYER - LUXURY (PAKET ULTIMATE)', 7000000, '11'),
(44, 'PAINT PROTECTION + RUST PROTECTION + SOUND PROOFING - SMALL', 3900000, '14'),
(45, 'PAINT PROTECTION + RUST PROTECTION + SOUND PROOFING - MEDIUM', 4600000, '12'),
(46, 'PAINT PROTECTION + RUST PROTECTION + SOUND PROOFING - LARGE', 5300000, '10'),
(47, 'PAINT PROTECTION + RUST PROTECTION + SOUND PROOFING - LUXURY', 5800000, '11'),
(48, 'PAINT PROTECTION + RUST PROTECTION  - SMALL', 2600000, '14'),
(49, 'PAINT PROTECTION + RUST PROTECTION  - MEDIUM', 3200000, '12'),
(50, 'PAINT PROTECTION + RUST PROTECTION  - LARGE', 3800000, '10'),
(51, 'PAINT PROTECTION + RUST PROTECTION  - LUXURY', 4200000, '11'),
(58, 'NANO COATING 2 LAYER (PAKET GOLD) + RUST PROTECTION - SMALL', 4600000, '14'),
(59, 'NANO COATING 2 LAYER (PAKET GOLD) + RUST PROTECTION - MEDIUM', 5500000, '12'),
(60, 'NANO COATING 2 LAYER (PAKET GOLD) + RUST PROTECTION - LARGE', 6400000, '10'),
(61, 'NANO COATING 2 LAYER (PAKET GOLD) + RUST PROTECTION - LUXURY', 7100000, '11'),
(62, 'NANO COATING 3 LAYER (PAKET PLATINUM) + RUST PROTECTION - SMALL', 5100000, '14'),
(63, 'NANO COATING 3 LAYER (PAKET PLATINUM) + RUST PROTECTION - MEDIUM', 6000000, '12'),
(64, 'NANO COATING 3 LAYER (PAKET PLATINUM) + RUST PROTECTION - LARGE', 6900000, '10'),
(65, 'NANO COATING 3 LAYER (PAKET PLATINUM) + RUST PROTECTION - LUXURY', 7600000, '11'),
(66, 'NANO COATING 5 LAYER (PAKET ULTIMATE) + RUST PROTECTION - SMALL', 6100000, '14'),
(67, 'NANO COATING 5 LAYER (PAKET ULTIMATE) + RUST PROTECTION - MEDIUM', 7500000, '12'),
(68, 'NANO COATING 5 LAYER (PAKET ULTIMATE) + RUST PROTECTION - LARGE', 7400000, '10'),
(69, 'NANO COATING 5 LAYER (PAKET ULTIMATE) + RUST PROTECTION - LUXURY', 9600000, '11'),
(70, 'TREATMENT COATING', 500000, '7'),
(72, 'TREATMENT COATING + INTERIOR DRESING', 650000, '6'),
(73, 'TREATMENT COATING + ENGGINE DRESING', 600000, '6'),
(74, 'TREATMENT COATING (ULTIMATE)', 1000000, '9'),
(75, 'TREATMENT PAINT PRO', 350000, '6'),
(77, 'TREATMENT RUST PRO', 400000, '6'),
(78, 'RUST PROTECTION + SOUND PROOFING - S', 2900000, '14'),
(79, 'RUST PROTECTION + SOUND PROOFING - MEDIUM', 3400000, '12'),
(80, 'RUST PROTECTION + SOUND PROOFING - L', 3900000, '10'),
(81, 'RUST PROTECTION + SOUND PROOFING - XL', 4200000, '8'),
(91, 'BOOKING FEE', 500000, '6'),
(92, 'NANO COATING 2 LAYER (PAKET GOLD) + RUST PROTECTION + SOUND PROOFING - SMALL', 5900000, '14'),
(93, 'NANO COATING 2 LAYER (PAKET GOLD) + RUST PROTECTION + SOUND PROOFING - MEDIUM', 6900000, '12'),
(94, 'NANO COATING MOTOR (PAKET GOLD)', 1250000, '13'),
(95, 'NANO COATING 3 LAYER (PAKET  PLATINUM) + RUST PROTECTION + SOUND PROOFING - M', 7400000, '12'),
(96, 'NANO COATING 5 LAYER (PAKET ULTIMATE) + SOUND PROOFING - MEDIUM', 6900000, '12'),
(97, 'GLASS COATING', 800000, '6'),
(98, 'SANDING - RUST PRO - ( NANO COATING 3 LAYER FREE) LARGE', 3500000, '10'),
(99, 'TREATMENT INTERIOR DETAILING - MEDIUM', 1200000, '12'),
(100, 'NANO COATING 4 LAYER  + RUST PROTECTION - MEDIUM', 6000000, '12'),
(101, 'TREATMENT PAINT PRO', 400000, '14'),
(102, 'GROMING', 350000, '7'),
(103, 'NANO COATING 4 LAYER - LARGE ', 5000000, '10'),
(104, 'NANO COATING 9 LAYER - LARGE', 8000000, '10'),
(105, 'NANO COATING 4 LAYER + RUST PROTECTION + SOUND PROOFING - SMALL', 7300000, '14'),
(106, 'NANO COATING 2 LAYER + RUST PRO+ SOUND PRO + PEREDAM TEMPEL - MEDIUM', 7500000, '12'),
(107, 'NANO COATING 2 LAYER (PAKET GOLD) + RUST PROTECTION + SOUND PROOFING - LARGE', 7900000, '10'),
(108, 'NANO COATING 5 LAYER (PAKET ULTIMATE) + RUST PROTECTION - LARGE ', 8400000, '10'),
(109, 'PEREDAM TEMPEL - MEDIUM', 3500000, '12'),
(110, 'PAINT PRO + INTERIOR DETAILING - MEDIUM', 1200000, '12'),
(111, 'NANO COATING 3 LAYER (PAKET PLATINUM) + SOUND PROOFING - MEDIUM', 5400000, '12'),
(112, 'NANO COATING 3 LAYER (PAKET PLATINUM) + RUST PROTECTION + SOUND PROOFING - LARGE', 8400000, '10'),
(113, ' PENGECATAN KENDARAAN FULL BODY', 25700000, '11'),
(114, 'PAINT PROTECTION + INTERIOR ENGINE', 1100000, '12'),
(115, 'TREATMENT + INTERIOR ENGINE', 1050000, '12'),
(116, 'FULL DETAILING - MEDIUM', 2500000, '12'),
(117, 'NANO COATING MOTOR - LARGE', 2500000, '10'),
(118, 'PEMASANGAN KACA FILM', 1600000, '12'),
(119, 'NANO COATING 2 LAYER + SOUND PROOFING - LARGE', 5500000, '10'),
(121, 'NANO COATING 3 LAYER - LARGE (PAKET PLATINUM) + INTERIOR DETAILING', 5700000, '10'),
(122, 'NANO COATING 5 LAYER (ULTIMATE) + RUST PRO + SOUND PRO - MEDIUM', 8900000, '12'),
(123, 'INTERIOR DRESSING', 500000, '14'),
(124, 'INTERIOR DRESSING', 600000, '12'),
(125, 'INTERIOR DRESSING', 700000, '10'),
(126, 'INTERIOR DRESSING', 800000, '11'),
(127, 'PAINT PROTECTION + INTERIOR DRESSING', 2100000, '10'),
(128, 'INTERIOR DETAILING', 800000, '14'),
(129, 'INTERIOR DETAILING', 100000, '12'),
(130, 'INTERIOR DETAILING', 1200000, '10'),
(131, 'INTERIOR DETAILING', 1300000, '11'),
(132, 'NANO COATING 5 LAYER (PAKET ULTIMATE) + SOUND PRO - SMALL', 5800000, '14'),
(133, 'NANO COATING 3 LAYER (PAKET PLATINUM) + SOUND PRO - LARGE', 6000000, '10'),
(134, 'NANO COATING 3 LAYER (PAKET PLATINUM) - TENTATIVE', 6000000, '15');

-- --------------------------------------------------------

--
-- Table structure for table `t_pegawai`
--

CREATE TABLE `t_pegawai` (
  `id_pegawai` int(11) DEFAULT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `no_hp` varchar(14) NOT NULL,
  `tmp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `jenkel` enum('P','L','T') NOT NULL DEFAULT 'T',
  `foto` varchar(25) NOT NULL,
  `nip` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_pengajuan`
--

CREATE TABLE `t_pengajuan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `batas` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `kode` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_pengajuan`
--

INSERT INTO `t_pengajuan` (`id`, `nama`, `batas`, `keterangan`, `kode`) VALUES
(1, 'Cuti', '3', 'Cuti', 'C'),
(2, 'Lembur', '3', 'Lembur', 'L'),
(3, 'Kasbon / Pinjaman', '500000', 'Kasbon', 'K'),
(4, 'Transport', '30000', 'Transport', 'T'),
(6, 'Dinas', '30000', 'Untuk Perjalanan Dinas', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `t_pengeluaran`
--

CREATE TABLE `t_pengeluaran` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_p` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `tgl_input` datetime NOT NULL DEFAULT current_timestamp(),
  `sts_hapus` enum('Y','N') NOT NULL DEFAULT 'N',
  `tgl_hapus` datetime NOT NULL DEFAULT current_timestamp(),
  `status_p` int(1) NOT NULL,
  `status_d` int(1) NOT NULL,
  `status` varchar(1) NOT NULL,
  `tgl_edit` date NOT NULL DEFAULT current_timestamp(),
  `status_aju` varchar(2) NOT NULL DEFAULT 'A',
  `nama_peminjam` varchar(100) DEFAULT NULL,
  `baca` varchar(2) NOT NULL DEFAULT 'NR',
  `pengajuan` varchar(1) NOT NULL DEFAULT 'A',
  `tgl_lembur` date NOT NULL DEFAULT current_timestamp(),
  `mulai` varchar(11) NOT NULL,
  `akhir` varchar(11) NOT NULL,
  `sts_bayar` int(1) NOT NULL DEFAULT 0,
  `tglbayar` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_pengeluaran`
--

INSERT INTO `t_pengeluaran` (`id`, `tanggal`, `nama_p`, `jumlah`, `keterangan`, `tgl_input`, `sts_hapus`, `tgl_hapus`, `status_p`, `status_d`, `status`, `tgl_edit`, `status_aju`, `nama_peminjam`, `baca`, `pengajuan`, `tgl_lembur`, `mulai`, `akhir`, `sts_bayar`, `tglbayar`) VALUES
(21, '2023-04-01', 'Deposit 1', 3000000, 'Deposit', '2023-04-01 19:28:58', 'N', '2023-04-01 19:28:58', 0, 1, 'D', '2023-04-01', 'Y', NULL, 'NR', 'A', '2023-04-01', '', '', 1, '2023-05-17'),
(27, '2023-04-03', 'Bayar Parkiran', 3000000, 'Parkiran Motor', '2023-04-03 14:14:48', 'Y', '2023-04-03 01:15:11', 0, 1, 'D', '2023-04-03', 'Y', NULL, 'NR', 'A', '2023-04-03', '', '', 0, '2023-05-17'),
(28, '2023-04-03', 'Bayar Parkiran', 300000, 'Parkiran Motor', '2023-04-03 14:15:59', 'N', '2023-04-03 14:15:59', 1, 0, 'A', '2023-04-03', 'Y', NULL, 'NR', 'A', '2023-04-03', '', '', 0, '2023-05-17'),
(29, '2023-04-03', 'Bensin', 15000, 'Pick Up Mobil (Rangga)', '2023-04-03 14:16:39', 'N', '2023-04-03 14:16:39', 1, 0, 'A', '2023-04-03', 'Y', NULL, 'NR', 'A', '2023-04-03', '', '', 0, '2023-05-17'),
(30, '2023-04-03', 'Token Listrik', 202500, 'WS 2', '2023-04-03 14:17:14', 'N', '2023-04-03 14:17:14', 1, 0, 'A', '2023-04-03', 'Y', NULL, 'NR', 'A', '2023-04-03', '', '', 0, '2023-05-17'),
(31, '2023-04-03', 'Driver Lia', 50000, 'Driver Lia', '2023-04-03 14:17:39', 'N', '2023-04-03 14:17:39', 1, 0, 'A', '2023-04-03', 'Y', NULL, 'NR', 'A', '2023-04-03', '', '', 0, '2023-05-17'),
(32, '2023-04-03', 'Service AC', 75000, 'Service AC', '2023-04-03 17:49:35', 'N', '2023-04-03 17:49:35', 1, 0, 'A', '2023-04-04', 'Y', NULL, 'NR', 'A', '2023-04-03', '', '', 0, '2023-05-17'),
(34, '2023-04-04', 'Tissue', 12000, 'Beli Tissue', '2023-04-04 10:12:47', 'N', '2023-04-04 10:12:47', 1, 0, 'A', '2023-04-04', 'Y', NULL, 'NR', 'A', '2023-04-04', '', '', 0, '2023-05-17'),
(35, '2023-04-03', 'Lembur', 15000, 'Lembur civic', '2023-04-04 12:38:32', 'Y', '2023-04-06 09:07:53', 1, 0, 'A', '2023-04-05', 'Y', '153', 'NR', 'L', '2023-04-04', '17:00', '20:00', 1, '2023-05-17'),
(36, '2023-04-04', 'Dinas', 30000, 'Home servis', '2023-04-04 17:28:59', 'N', '2023-04-04 17:28:59', 1, 0, 'A', '2023-04-05', 'Y', '154', 'NR', 'D', '2023-04-04', '09:00', '17:00', 0, '2023-05-17'),
(37, '2023-04-05', 'Service Printer', 265000, 'service printer', '2023-04-05 09:30:48', 'N', '2023-04-05 09:30:48', 1, 0, 'A', '2023-04-05', 'Y', NULL, 'NR', 'A', '2023-04-05', '', '', 0, '2023-05-17'),
(38, '2023-04-05', 'Pembayaran WIFI', 150000, 'Pembayaran WIFI', '2023-04-05 09:31:13', 'N', '2023-04-05 09:31:13', 1, 0, 'A', '2023-04-05', 'Y', NULL, 'NR', 'A', '2023-04-05', '', '', 0, '2023-05-17'),
(39, '2023-04-03', 'Lembur', 15000, 'Lembur mobil civic', '2023-04-05 12:13:31', 'Y', '2023-04-05 05:09:34', 1, 0, 'A', '2023-04-05', 'N', '154', 'NR', 'L', '2023-04-05', '17:00', '08:00', 0, '2023-05-17'),
(40, '2023-04-05', 'Aqua', 10000, 'sales', '2023-04-05 14:10:45', 'N', '2023-04-05 14:10:45', 1, 0, 'A', '2023-04-05', 'Y', NULL, 'NR', 'A', '2023-04-05', '', '', 0, '2023-05-17'),
(41, '2023-04-06', 'Roby', 100000, 'Untuk beli makan', '2023-04-06 12:28:40', 'N', '2023-04-06 12:28:40', 1, 0, 'A', '2023-04-06', 'Y', '148', 'K', 'K', '2023-04-06', '', '', 1, '2023-05-28'),
(42, '2023-04-06', 'Kasbon / Pinjaman', 100, 'Untuk beli makan', '2023-04-06 12:31:26', 'Y', '2023-04-06 11:33:29', 1, 0, 'A', '2023-04-06', 'Y', '148', 'K', 'K', '2023-04-06', '', '', 1, '2023-05-28'),
(43, '2023-04-06', 'ROBY', 100000, 'BELI MAKAN', '2023-04-06 12:32:41', 'Y', '2023-04-06 11:33:06', 1, 0, 'A', '2023-04-06', 'Y', NULL, 'NR', 'A', '2023-04-06', '', '', 0, '2023-05-17'),
(44, '2023-04-06', 'Tiner', 330000, 'Beli Tiner', '2023-04-06 16:11:20', 'N', '2023-04-06 16:11:20', 1, 0, 'A', '2023-04-06', 'Y', NULL, 'NR', 'A', '2023-04-06', '', '', 0, '2023-05-17'),
(45, '2023-04-06', 'DOUBLE TIP', 10000, 'Beli Double Tip', '2023-04-06 16:32:27', 'N', '2023-04-06 16:32:27', 1, 0, 'A', '2023-04-06', 'Y', NULL, 'NR', 'A', '2023-04-06', '', '', 0, '2023-05-17'),
(46, '2023-04-06', 'Kasbon / Pinjaman', 500, 'tf ke kampung ', '2023-04-06 17:15:35', 'Y', '2023-04-06 04:25:33', 1, 0, 'A', '2023-04-06', 'Y', '151', 'NR', 'K', '2023-04-06', '', '', 1, '2023-05-17'),
(47, '2023-04-06', 'andi', 500000, 'tf ke kampung ', '2023-04-06 17:16:59', 'N', '2023-04-06 17:16:59', 1, 0, 'A', '2023-04-07', 'Y', '151', 'NR', 'K', '2023-04-06', '', '', 1, '2023-05-17'),
(48, '2023-04-07', 'Kasbon / Pinjaman', 300000, 'kasbon', '2023-04-07 09:03:51', 'Y', '2023-04-07 11:47:25', 1, 0, 'A', '2023-04-07', 'Y', '150', 'NR', 'K', '2023-04-07', '', '', 0, '2023-05-17'),
(49, '2023-04-07', 'Token Listrik', 202500, 'ws 1', '2023-04-07 12:39:43', 'N', '2023-04-07 12:39:43', 1, 0, 'A', '2023-04-07', 'Y', NULL, 'NR', 'A', '2023-04-07', '', '', 0, '2023-05-17'),
(50, '2023-04-07', 'Kasbon / Pinjaman', 300, 'Rangga Ardian ', '2023-04-07 12:55:04', 'Y', '2023-04-07 11:57:30', 1, 0, 'A', '2023-04-07', 'Y', '150', 'NR', 'K', '2023-04-07', '', '', 0, '2023-05-17'),
(51, '2023-04-07', 'Rangga', 300000, 'kasbon', '2023-04-07 12:57:14', 'N', '2023-04-07 12:57:14', 1, 0, 'A', '2023-04-07', 'Y', '150', 'NR', 'K', '2023-04-07', '', '', 1, '2023-05-17'),
(52, '2023-04-07', 'Lembur', 15000, 'Jumat agung ', '2023-04-07 15:09:47', 'N', '2023-04-07 15:09:47', 1, 0, 'A', '2023-04-07', 'Y', '150', 'NR', 'L', '2023-04-07', '09:00', '17:00', 0, '2023-05-17'),
(53, '2023-04-07', 'Lembur', 15000, 'Lembur tanggal merah ', '2023-04-07 15:29:42', 'N', '2023-04-07 15:29:42', 1, 0, 'A', '2023-04-07', 'Y', '183', 'NR', 'L', '2023-04-07', '08:30', '17:00', 1, '2023-05-28'),
(54, '2023-04-07', 'Lembur', 15000, 'Lembur jumat Agung ', '2023-04-07 15:32:52', 'N', '2023-04-07 15:32:52', 1, 0, 'A', '2023-04-07', 'Y', '149', 'NR', 'L', '2023-04-07', '09:00', '17:00', 0, '2023-05-17'),
(55, '2023-04-07', 'Lembur', 15000, 'Tgl merah ', '2023-04-07 15:35:22', 'N', '2023-04-07 15:35:22', 1, 0, 'A', '2023-04-08', 'Y', '148', 'NR', 'L', '2023-04-07', '08:30', '17:00', 1, '2023-05-28'),
(56, '2023-04-07', 'Roby', 100000, 'Buat beli makan', '2023-04-07 15:39:23', 'N', '2023-04-07 15:39:23', 1, 0, 'A', '2023-04-07', 'Y', '148', 'NR', 'K', '2023-04-07', '', '', 1, '2023-05-28'),
(57, '2023-04-07', 'Lembur', 15000, 'Jum\'at agung', '2023-04-07 16:00:54', 'N', '2023-04-07 16:00:54', 1, 0, 'A', '2023-04-08', 'Y', '154', 'NR', 'L', '2023-04-07', '08:40', '17:00', 0, '2023-05-17'),
(58, '2023-04-07', 'Lembur', 15000, 'Lembur tanggal merah home servise', '2023-04-07 17:49:52', 'N', '2023-04-07 17:49:52', 1, 0, 'A', '2023-04-08', 'Y', '153', 'NR', 'L', '2023-04-07', '08:00', '17:00', 1, '2023-05-17'),
(59, '2023-04-07', 'Dinas', 30000, 'Perjalanan dinas uang bensin', '2023-04-07 17:55:34', 'Y', '2023-04-08 09:35:00', 1, 0, 'A', '2023-04-07', 'Y', '153', 'NR', 'D', '2023-04-07', '08:00', '17:00', 1, '2023-05-17'),
(60, '2023-04-07', 'Lembur', 15000, 'tanggal merah', '2023-04-07 17:59:22', 'N', '2023-04-07 17:59:22', 1, 0, 'A', '2023-04-08', 'Y', '151', 'NR', 'L', '2023-04-07', '08:00', '16:59', 1, '2023-05-17'),
(61, '2023-04-08', 'Tiki', 8000, 'pengiriman tiki', '2023-04-08 10:02:16', 'N', '2023-04-08 10:02:16', 1, 0, 'A', '2023-04-08', 'Y', NULL, 'NR', 'A', '2023-04-08', '', '', 0, '2023-05-17'),
(62, '2023-04-07', 'Dinas', 30000, 'Uang bensin untuk home service', '2023-04-08 12:03:11', 'N', '2023-04-08 12:03:11', 1, 0, 'A', '2023-04-08', 'Y', '153', 'NR', 'D', '2023-04-08', '08:00', '17:00', 1, '2023-05-17'),
(63, '2023-04-08', 'Lembur', 15000, 'Pengerjaan TC pajero', '2023-04-08 19:28:36', 'Y', '2023-04-14 10:14:49', 1, 0, 'A', '2023-04-08', 'N', '148', 'NR', 'L', '2023-04-08', '05:00', '18:28', 1, '2023-05-28'),
(64, '2023-04-08', 'Lembur', 15000, 'Ak yaris', '2023-04-08 19:29:24', 'Y', '2023-04-14 10:14:47', 1, 0, 'A', '2023-04-08', 'N', '183', 'NR', 'L', '2023-04-08', '17:00', '18:35', 1, '2023-05-28'),
(65, '2023-04-07', 'Lembur', 15000, 'Jumat agung ', '2023-04-08 19:46:00', 'Y', '2023-04-17 09:03:16', 1, 0, 'A', '2023-04-12', 'Y', '151', 'NR', 'L', '2023-04-08', '08:00', '17:00', 1, '2023-05-17'),
(66, '2023-04-09', 'Lembur', 15000, 'Lembur di hari minggu', '2023-04-09 19:21:05', 'N', '2023-04-09 19:21:05', 1, 0, 'A', '2023-04-10', 'Y', '154', 'NR', 'L', '2023-04-09', '08:30', '17:00', 0, '2023-05-17'),
(67, '2023-04-09', 'Lembur', 15000, 'Hari minggu masuk', '2023-04-09 20:50:07', 'N', '2023-04-09 20:50:07', 1, 0, 'A', '2023-04-10', 'Y', '151', 'NR', 'L', '2023-04-09', '08:00', '17:21', 1, '2023-05-17'),
(68, '2023-04-10', 'kabel', 42000, 'colokan', '2023-04-10 11:04:24', 'N', '2023-04-10 11:04:24', 1, 0, 'A', '2023-04-10', 'Y', NULL, 'NR', 'A', '2023-04-10', '', '', 0, '2023-05-17'),
(69, '2023-04-10', 'rinso', 5000, 'cuci lap', '2023-04-10 11:04:53', 'N', '2023-04-10 11:04:53', 1, 0, 'A', '2023-04-10', 'Y', NULL, 'NR', 'A', '2023-04-10', '', '', 0, '2023-05-17'),
(70, '2023-04-10', 'Kasbon / Pinjaman', 100000, 'Buat beli bensin ', '2023-04-10 11:47:17', 'N', '2023-04-10 11:47:17', 1, 0, 'A', '2023-04-10', 'Y', '153', 'NR', 'K', '2023-04-10', '', '', 1, '2023-05-17'),
(71, '2023-04-10', 'Beli ', 24000, 'materai', '2023-04-10 12:51:50', 'N', '2023-04-10 12:51:50', 1, 0, 'A', '2023-04-10', 'Y', NULL, 'NR', 'A', '2023-04-10', '', '', 0, '2023-05-17'),
(72, '2023-04-10', 'Kasbon / Pinjaman', 50000, 'bikin atm', '2023-04-10 13:12:41', 'N', '2023-04-10 13:12:41', 1, 0, 'A', '2023-04-10', 'Y', '183', 'NR', 'K', '2023-04-10', '', '', 1, '2023-05-28'),
(73, '2023-04-10', 'Beli ', 12000, 'materai', '2023-04-10 14:06:55', 'N', '2023-04-10 14:06:55', 1, 0, 'A', '2023-04-10', 'Y', NULL, 'NR', 'A', '2023-04-10', '', '', 0, '2023-05-17'),
(74, '2023-04-10', 'Driver Lia', 50000, 'driver', '2023-04-10 14:07:20', 'N', '2023-04-10 14:07:20', 1, 0, 'A', '2023-04-10', 'Y', NULL, 'NR', 'A', '2023-04-10', '', '', 0, '2023-05-17'),
(75, '2023-04-10', 'DEPOSIT 2', 5000000, 'DEPOSIT 2', '2023-04-10 16:10:54', 'N', '2023-04-10 16:10:54', 0, 1, 'D', '2023-04-10', 'Y', NULL, 'NR', 'A', '2023-04-10', '', '', 0, '2023-05-17'),
(76, '2023-04-10', 'Pembayaran bangunan', 648000, 'Renovasi office', '2023-04-10 16:12:00', 'N', '2023-04-10 16:12:00', 1, 0, 'A', '2023-04-10', 'Y', NULL, 'NR', 'A', '2023-04-10', '', '', 0, '2023-05-17'),
(77, '2023-04-10', 'Tokopedia', 558400, 'Lap Micro', '2023-04-10 16:19:35', 'N', '2023-04-10 16:19:35', 1, 0, 'A', '2023-04-10', 'Y', NULL, 'NR', 'A', '2023-04-10', '', '', 0, '2023-05-17'),
(78, '2023-04-10', 'Kasbon / Pinjaman', 100000, 'Pembayaran mobil yaris ', '2023-04-10 17:47:27', 'N', '2023-04-10 17:47:27', 1, 0, 'A', '2023-04-11', 'N', '151', 'NR', 'K', '2023-04-10', '', '', 1, '2023-05-17'),
(79, '2023-04-11', 'Bensin', 200000, 'towing mazda cx9', '2023-04-11 10:20:05', 'Y', '2023-04-11 11:49:17', 1, 0, 'A', '2023-04-11', 'Y', NULL, 'NR', 'A', '2023-04-11', '', '', 0, '2023-05-17'),
(80, '2023-04-11', 'Pembayaran Cat', 500000, 'Cat Office', '2023-04-11 12:29:27', 'N', '2023-04-11 12:29:27', 1, 0, 'A', '2023-04-11', 'Y', NULL, 'NR', 'A', '2023-04-11', '', '', 0, '2023-05-17'),
(81, '2023-04-11', 'titipan', 75000, 'buat masdik mazda', '2023-04-11 17:34:55', 'N', '2023-04-11 17:34:55', 1, 0, 'A', '2023-04-11', 'Y', NULL, 'NR', 'A', '2023-04-11', '', '', 0, '2023-05-17'),
(82, '2023-04-12', 'sahrul', 10000, 'nganter mobil', '2023-04-12 15:38:48', 'N', '2023-04-12 15:38:48', 1, 0, 'A', '2023-04-12', 'Y', NULL, 'NR', 'A', '2023-04-12', '', '', 0, '2023-05-17'),
(83, '2023-04-11', 'Lembur', 15000, 'Fortuner', '2023-04-12 17:17:55', 'N', '2023-04-12 17:17:55', 1, 0, 'A', '2023-04-17', 'N', '151', 'NR', 'L', '2023-04-12', '05:00', '20:00', 1, '2023-05-17'),
(84, '2023-04-12', 'Lembur', 15000, 'Fortuner', '2023-04-12 17:20:43', 'Y', '2023-04-12 04:25:38', 1, 0, 'A', '2023-04-12', 'A', '151', 'NR', 'L', '2023-04-12', '17:00', '20:00', 1, '2023-05-17'),
(85, '2023-04-13', 'Rantai gembok', 193000, 'Tokopedia', '2023-04-13 09:48:42', 'N', '2023-04-13 09:48:42', 1, 0, 'A', '2023-04-13', 'Y', NULL, 'NR', 'A', '2023-04-13', '', '', 0, '2023-05-17'),
(86, '2023-04-13', 'Bensin sultan agung', 30000, 'andi', '2023-04-13 10:00:35', 'N', '2023-04-13 10:00:35', 1, 0, 'A', '2023-04-13', 'Y', NULL, 'NR', 'A', '2023-04-13', '', '', 0, '2023-05-17'),
(87, '2023-04-13', 'Tiki', 8000, 'berkas LA', '2023-04-13 11:00:41', 'N', '2023-04-13 11:00:41', 1, 0, 'A', '2023-04-13', 'Y', NULL, 'NR', 'A', '2023-04-13', '', '', 0, '2023-05-17'),
(88, '2023-04-13', 'Beli galon', 5000, 'galon', '2023-04-13 11:01:09', 'N', '2023-04-13 11:01:09', 1, 0, 'A', '2023-04-13', 'Y', NULL, 'NR', 'A', '2023-04-13', '', '', 0, '2023-05-17'),
(89, '2023-04-13', 'teknisi', 100000, 'camry', '2023-04-13 11:37:21', 'N', '2023-04-13 11:37:21', 1, 0, 'A', '2023-04-13', 'Y', NULL, 'NR', 'A', '2023-04-13', '', '', 0, '2023-05-17'),
(90, '2023-04-13', 'Kasbon / Pinjaman', 100000, 'Untuk beli makan', '2023-04-13 11:46:42', 'N', '2023-04-13 11:46:42', 1, 0, 'A', '2023-04-13', 'Y', '148', 'NR', 'K', '2023-04-13', '', '', 1, '2023-05-28'),
(91, '2023-04-13', 'Kayu meja tunggu', 147800, 'Tokopedia', '2023-04-13 16:07:50', 'N', '2023-04-13 16:07:50', 1, 0, 'A', '2023-04-13', 'Y', NULL, 'NR', 'A', '2023-04-13', '', '', 0, '2023-05-17'),
(92, '2023-04-14', 'Masking tape', 275500, 'masking tape', '2023-04-14 09:56:33', 'N', '2023-04-14 09:56:33', 1, 0, 'A', '2023-04-14', 'Y', NULL, 'NR', 'A', '2023-04-14', '', '', 0, '2023-05-17'),
(93, '2023-04-14', 'Dinas', 30000, 'Kerja di showroom LA', '2023-04-14 10:27:07', 'N', '2023-04-14 10:27:07', 1, 0, 'A', '2023-04-14', 'Y', '150', 'NR', 'D', '2023-04-14', '09:00', '05:00', 0, '2023-05-17'),
(94, '2023-04-14', 'Kuas', 18000, 'kuas poles ', '2023-04-14 14:44:39', 'N', '2023-04-14 14:44:39', 1, 0, 'A', '2023-04-14', 'Y', NULL, 'NR', 'A', '2023-04-14', '', '', 0, '2023-05-17'),
(95, '2023-04-15', 'tokped', 97800, 'bingkai foto', '2023-04-15 10:44:44', 'N', '2023-04-15 10:44:44', 1, 0, 'A', '2023-04-15', 'Y', NULL, 'NR', 'A', '2023-04-15', '', '', 0, '2023-05-17'),
(96, '2023-04-15', 'anter mobil', 10000, 'wuling', '2023-04-15 11:11:19', 'N', '2023-04-15 11:11:19', 1, 0, 'A', '2023-04-15', 'Y', NULL, 'NR', 'A', '2023-04-15', '', '', 0, '2023-05-17'),
(97, '2023-04-15', 'DEPOSIT THR', 9215000, 'Pembayaran THR', '2023-04-15 15:43:02', 'N', '2023-04-15 15:43:02', 0, 1, 'D', '2023-04-15', 'Y', NULL, 'NR', 'A', '2023-04-15', '', '', 0, '2023-05-17'),
(98, '2023-04-15', 'Pembayaran THR', 9215000, 'THR', '2023-04-15 15:43:34', 'N', '2023-04-15 15:43:34', 1, 0, 'A', '2023-04-15', 'Y', NULL, 'NR', 'A', '2023-04-15', '', '', 0, '2023-05-17'),
(99, '2023-04-15', 'Kasbon / Pinjaman', 500000, 'Angsuran motor ', '2023-04-15 16:40:58', 'N', '2023-04-15 16:40:58', 1, 0, 'A', '2023-04-15', 'Y', '148', 'NR', 'K', '2023-04-15', '', '', 0, '2023-05-28'),
(100, '2023-04-07', 'Lembur', 15000, 'Jumat agung', '2023-04-15 18:54:41', 'Y', '2023-04-15 05:55:30', 1, 0, 'A', '2023-04-15', 'A', '196', 'NR', 'L', '2023-04-15', '08:00', '17:00', 0, '2023-05-17'),
(101, '2023-04-07', 'Lembur', 15000, 'Jumat agung', '2023-04-15 18:58:43', 'N', '2023-04-15 18:58:43', 1, 0, 'A', '2023-04-15', 'Y', '196', 'NR', 'L', '2023-04-15', '08:00', '17:00', 0, '2023-05-17'),
(102, '2023-04-16', 'Lembur', 15000, 'Lembur cherii', '2023-04-16 23:33:33', 'N', '2023-04-16 23:33:33', 1, 0, 'A', '2023-04-17', 'Y', '151', 'NR', 'L', '2023-04-16', '09:00', '16:00', 1, '2023-05-17'),
(103, '2023-04-17', 'Tokped', 382450, 'lap bulan mei (promosi)', '2023-04-17 10:05:50', 'N', '2023-04-17 10:05:50', 1, 0, 'A', '2023-04-17', 'Y', NULL, 'NR', 'A', '2023-04-17', '', '', 0, '2023-05-17'),
(104, '2023-04-17', 'pak kiki', 30000, 'bensin motor', '2023-04-17 10:06:09', 'N', '2023-04-17 10:06:09', 1, 0, 'A', '2023-04-17', 'Y', NULL, 'NR', 'A', '2023-04-17', '', '', 0, '2023-05-17'),
(105, '2023-04-16', 'Lembur', 15000, 'Lembur chery', '2023-04-17 10:44:14', 'N', '2023-04-17 10:44:14', 1, 0, 'A', '2023-04-17', 'Y', '154', 'NR', 'L', '2023-04-17', '08:00', '17:00', 0, '2023-05-17'),
(106, '2023-04-18', 'tokped', 257000, 'alat pemadam kebakaran', '2023-04-18 09:27:04', 'N', '2023-04-18 09:27:04', 1, 0, 'A', '2023-04-18', 'Y', NULL, 'NR', 'A', '2023-04-18', '', '', 0, '2023-05-17'),
(107, '2023-04-18', 'Token Listrik', 202500, 'WS 1', '2023-04-18 09:56:33', 'N', '2023-04-18 09:56:33', 1, 0, 'A', '2023-04-18', 'Y', NULL, 'NR', 'A', '2023-04-18', '', '', 0, '2023-05-17'),
(108, '2023-04-18', 'Tiki', 8000, 'kirim data LA', '2023-04-18 11:42:07', 'N', '2023-04-18 11:42:07', 1, 0, 'A', '2023-04-18', 'Y', NULL, 'NR', 'A', '2023-04-18', '', '', 0, '2023-05-17'),
(109, '2023-04-18', 'Pembayaran sampah', 30000, 'sampah', '2023-04-18 12:27:05', 'N', '2023-04-18 12:27:05', 1, 0, 'A', '2023-04-18', 'Y', NULL, 'NR', 'A', '2023-04-18', '', '', 0, '2023-05-17'),
(110, '2023-04-18', 'Pulsa Kantor', 12000, 'HP kantor', '2023-04-18 14:45:32', 'N', '2023-04-18 14:45:32', 1, 0, 'A', '2023-04-18', 'Y', NULL, 'NR', 'A', '2023-04-18', '', '', 0, '2023-05-17'),
(111, '2023-04-18', 'etoll', 200000, 'pak kiki', '2023-04-18 17:27:43', 'N', '2023-04-18 17:27:43', 1, 0, 'A', '2023-04-18', 'Y', NULL, 'NR', 'A', '2023-04-18', '', '', 0, '2023-05-17'),
(112, '2023-04-19', 'Beli', 5000, 'kardus', '2023-04-19 11:00:37', 'N', '2023-04-19 11:00:37', 1, 0, 'A', '2023-04-19', 'Y', NULL, 'NR', 'A', '2023-04-19', '', '', 0, '2023-05-17'),
(113, '2023-04-19', 'Token Listrik', 202500, 'pak nimun ws 2', '2023-04-19 11:01:10', 'N', '2023-04-19 11:01:10', 1, 0, 'A', '2023-04-19', 'Y', NULL, 'NR', 'A', '2023-04-19', '', '', 0, '2023-05-17'),
(114, '2023-04-19', 'THR LA', 300000, 'Washser', '2023-04-19 13:30:13', 'N', '2023-04-19 13:30:13', 1, 0, 'A', '2023-04-19', 'Y', NULL, 'NR', 'A', '2023-04-19', '', '', 0, '2023-05-17'),
(115, '2023-04-19', 'Bensin', 20000, 'PCX', '2023-04-19 15:47:12', 'N', '2023-04-19 15:47:12', 1, 0, 'A', '2023-04-19', 'Y', NULL, 'NR', 'A', '2023-04-19', '', '', 0, '2023-05-17'),
(116, '2023-04-20', 'Token Listrik', 52500, 'token ws 2 ', '2023-04-20 15:19:47', 'N', '2023-04-20 15:19:47', 1, 0, 'A', '2023-04-20', 'Y', NULL, 'NR', 'A', '2023-04-20', '', '', 0, '2023-05-17'),
(117, '2023-04-23', 'Deposit Kredivo', 1428070, 'Deposit Kredivo', '2023-04-23 17:08:17', 'N', '2023-04-23 17:08:17', 0, 1, 'D', '2023-04-23', 'Y', NULL, 'NR', 'A', '2023-04-23', '', '', 0, '2023-05-17'),
(118, '2023-04-23', 'Kredivo', 1428070, 'Bayar Kredivo', '2023-04-23 17:09:35', 'N', '2023-04-23 17:09:35', 1, 0, 'A', '2023-04-23', 'Y', NULL, 'NR', 'A', '2023-04-23', '', '', 0, '2023-05-17'),
(119, '2023-04-27', 'Kasbon / Pinjaman', 500000, 'Buat transfort sehari hari', '2023-04-27 09:11:27', 'Y', '2023-05-05 07:45:33', 1, 0, 'A', '2023-04-27', 'N', '150', 'NR', 'K', '2023-04-27', '', '', 0, '2023-05-17'),
(120, '2023-04-27', 'Lembur', 15000, 'Home servis stargazer Cikarang ', '2023-04-27 20:06:46', 'N', '2023-04-27 20:06:46', 1, 0, 'A', '2023-04-28', 'N', '148', 'NR', 'L', '2023-04-27', '17:00', '19:06', 1, '2023-05-28'),
(121, '2023-04-27', 'Lembur', 15000, 'Home servis ', '2023-04-27 20:08:24', 'N', '2023-04-27 20:08:24', 1, 0, 'A', '2023-04-28', 'N', '150', 'NR', 'L', '2023-04-27', '17:00', '19:08', 0, '2023-05-17'),
(122, '2023-04-28', 'DEPOSIT 3', 589950, 'DEPOSIT', '2023-04-28 10:07:16', 'N', '2023-04-28 10:07:16', 0, 1, 'D', '2023-04-29', 'Y', NULL, 'NR', 'A', '2023-04-28', '', '', 0, '2023-05-17'),
(123, '2023-04-27', 'Dinas', 30000, 'Home service Cikarang tgl 27', '2023-04-28 12:39:17', 'N', '2023-04-28 12:39:17', 1, 0, 'A', '2023-04-28', 'Y', '148', 'NR', 'D', '2023-04-28', '08:00', '19:00', 1, '2023-05-28'),
(124, '2023-04-28', 'Perjalanan Dinas', 30000, 'motor roby', '2023-04-28 12:50:00', 'Y', '2023-04-28 02:31:09', 1, 0, 'A', '2023-04-28', 'Y', NULL, 'NR', 'A', '2023-04-28', '', '', 0, '2023-05-17'),
(125, '2023-04-28', 'Tiki', 8000, 'Dokumen', '2023-04-28 14:54:40', 'N', '2023-04-28 14:54:40', 1, 0, 'A', '2023-04-28', 'Y', NULL, 'NR', 'A', '2023-04-28', '', '', 0, '2023-05-17'),
(126, '2023-04-29', 'Parfum', 11000, 'Glade', '2023-04-29 09:40:39', 'N', '2023-04-29 09:40:39', 1, 0, 'A', '2023-04-29', 'Y', NULL, 'NR', 'A', '2023-04-29', '', '', 0, '2023-05-17'),
(127, '2023-04-29', 'ITC Fatmawati', 43000, 'parkir & bensin pak rangga', '2023-04-29 09:43:12', 'N', '2023-04-29 09:43:12', 1, 0, 'A', '2023-04-29', 'Y', NULL, 'NR', 'A', '2023-04-29', '', '', 0, '2023-05-17'),
(128, '2023-04-29', 'Home Service', 165000, 'Grab Pergi', '2023-04-29 10:40:26', 'N', '2023-04-29 10:40:26', 1, 0, 'A', '2023-04-29', 'Y', NULL, 'NR', 'A', '2023-04-29', '', '', 0, '2023-05-17'),
(129, '2023-04-29', 'Home Service', 187500, 'Grab Pulang', '2023-04-29 10:41:58', 'N', '2023-04-29 10:41:58', 1, 0, 'A', '2023-04-29', 'Y', NULL, 'NR', 'A', '2023-04-29', '', '', 0, '2023-05-17'),
(130, '2023-04-29', 'beli', 24000, 'kuas poles ', '2023-04-29 12:39:28', 'N', '2023-04-29 12:39:28', 1, 0, 'A', '2023-04-29', 'Y', NULL, 'NR', 'A', '2023-04-29', '', '', 0, '2023-05-17'),
(131, '2023-04-29', 'Beli ', 40000, 'aqua 330ml', '2023-04-29 12:40:30', 'N', '2023-04-29 12:40:30', 1, 0, 'A', '2023-04-29', 'Y', NULL, 'NR', 'A', '2023-04-29', '', '', 0, '2023-05-17'),
(132, '2023-04-29', 'Kasbon / Pinjaman', 100000, 'Beli makan', '2023-04-29 13:02:13', 'N', '2023-04-29 13:02:13', 1, 0, 'A', '2023-04-29', 'Y', '148', 'NR', 'K', '2023-04-29', '', '', 0, '2023-05-28'),
(133, '2023-04-29', 'Dinas', 30000, 'Home servis ', '2023-04-29 13:33:46', 'N', '2023-04-29 13:33:46', 1, 0, 'A', '2023-05-06', 'N', '150', 'NR', 'D', '2023-04-29', '09:00', '05:00', 0, '2023-05-17'),
(134, '2023-04-29', 'PAJAK', 1444290, 'JASA', '2023-04-29 14:56:30', 'N', '2023-04-29 14:56:30', 0, 1, 'D', '2023-04-29', 'Y', NULL, 'NR', 'A', '2023-04-29', '', '', 0, '2023-05-17'),
(135, '2023-04-29', 'PAJAK', 1444290, 'JASA', '2023-04-29 14:56:53', 'N', '2023-04-29 14:56:53', 1, 0, 'A', '2023-04-29', 'Y', NULL, 'NR', 'A', '2023-04-29', '', '', 0, '2023-05-17'),
(136, '2023-04-29', 'Lembur', 15000, 'Pengerjaan nc3 brio', '2023-04-29 20:09:36', 'N', '2023-04-29 20:09:36', 1, 0, 'A', '2023-05-02', 'N', '148', 'NR', 'L', '2023-04-29', '17:00', '19:09', 1, '2023-05-28'),
(137, '2023-04-30', 'Lembur', 15000, 'Pengerjaan mobil XL7 ', '2023-04-30 18:02:39', 'N', '2023-04-30 18:02:39', 1, 0, 'A', '2023-05-02', 'Y', '153', 'NR', 'L', '2023-04-30', '08:30', '17:00', 1, '2023-05-17'),
(138, '2023-05-01', 'Kasbon / Pinjaman', 40000, 'Buat Makan', '2023-05-01 03:41:24', 'Y', '2023-05-01 02:43:37', 1, 0, 'A', '2023-05-01', 'Y', '148', 'NR', 'K', '2023-05-01', '', '', 1, '2023-05-28'),
(139, '2023-05-01', 'Kasbon / Pinjaman', 100, 'daddd', '2023-05-01 03:58:21', 'Y', '2023-05-01 03:01:20', 1, 0, 'A', '2023-05-01', 'Y', '148', 'NR', 'K', '2023-05-01', '', '', 1, '2023-05-28'),
(140, '2023-05-01', 'Kasbon / Pinjaman', 4000, 'wwww', '2023-05-01 04:01:31', 'Y', '2023-05-01 03:04:05', 1, 0, 'A', '2023-05-01', 'R', '148', 'NR', 'K', '2023-05-01', '', '', 1, '2023-05-28'),
(141, '2023-05-02', 'Kasbon / Pinjaman', 500000, 'Buat transfort sehari hari', '2023-05-02 09:12:54', 'Y', '2023-05-05 07:45:18', 1, 0, 'A', '2023-05-02', 'N', '150', 'NR', 'K', '2023-05-02', '', '', 0, '2023-05-17'),
(142, '2023-05-02', 'DEPOSIT', 3000000, '1', '2023-05-02 14:07:53', 'N', '2023-05-02 14:07:53', 0, 1, 'D', '2023-05-02', 'Y', NULL, 'NR', 'A', '2023-05-02', '', '', 0, '2023-05-17'),
(143, '2023-05-02', 'DEPOSIT', 3000000, '1', '2023-05-02 14:08:04', 'Y', '2023-05-02 01:08:29', 0, 1, 'D', '2023-05-02', 'Y', NULL, 'NR', 'A', '2023-05-02', '', '', 0, '2023-05-17'),
(144, '2023-05-02', 'Beli ', 3000, 'lakban kabel', '2023-05-02 14:25:37', 'N', '2023-05-02 14:25:37', 1, 0, 'A', '2023-05-02', 'Y', NULL, 'NR', 'A', '2023-05-02', '', '', 0, '2023-05-17'),
(145, '2023-05-02', 'Beli ', 24000, 'masking tape', '2023-05-02 14:26:10', 'N', '2023-05-02 14:26:10', 1, 0, 'A', '2023-05-02', 'Y', NULL, 'NR', 'A', '2023-05-02', '', '', 0, '2023-05-17'),
(146, '2023-04-30', 'Lembur', 15000, 'Lembur suzuki xl7', '2023-05-02 15:56:27', 'N', '2023-05-02 15:56:27', 1, 0, 'A', '2023-05-02', 'Y', '149', 'NR', 'L', '2023-05-02', '09:00', '17:00', 0, '2023-05-17'),
(147, '2023-05-02', 'bayar', 300000, 'Parkiran Motor', '2023-05-02 16:28:03', 'N', '2023-05-02 16:28:03', 1, 0, 'A', '2023-05-02', 'Y', NULL, 'NR', 'A', '2023-05-02', '', '', 0, '2023-05-17'),
(148, '2023-05-02', 'Beli', 202500, 'token ws 2 ', '2023-05-02 16:28:57', 'N', '2023-05-02 16:28:57', 1, 0, 'A', '2023-05-02', 'Y', NULL, 'NR', 'A', '2023-05-02', '', '', 0, '2023-05-17'),
(149, '2023-05-02', 'bayar', 130000, 'Grab Pergi LA', '2023-05-02 16:32:41', 'N', '2023-05-02 16:32:41', 1, 0, 'A', '2023-05-02', 'Y', NULL, 'NR', 'A', '2023-05-02', '', '', 0, '2023-05-17'),
(150, '2023-05-02', 'Kasbon / Pinjaman', 500000, 'Buat transfort sehari hari', '2023-05-02 17:06:35', 'N', '2023-05-02 17:06:35', 1, 0, 'A', '2023-05-02', 'Y', '150', 'NR', 'K', '2023-05-02', '', '', 0, '2023-05-17'),
(151, '2023-05-02', 'bayar', 120000, 'grab pulang LA', '2023-05-02 17:41:15', 'N', '2023-05-02 17:41:15', 1, 0, 'A', '2023-05-21', 'Y', NULL, 'NR', 'A', '2023-05-02', '', '', 0, '2023-05-17'),
(152, '2023-05-02', 'Kasbon / Pinjaman', 200000, 'Untuk keperluan ', '2023-05-02 17:45:37', 'N', '2023-05-02 17:45:37', 1, 0, 'A', '2023-05-02', 'Y', '153', 'NR', 'K', '2023-05-02', '', '', 0, '2023-05-17'),
(153, '2023-05-02', 'Kasbon / Pinjaman', 500000, 'Keperluan sehari hari ', '2023-05-02 17:47:51', 'N', '2023-05-02 17:47:51', 1, 0, 'A', '2023-05-02', 'Y', '151', 'NR', 'K', '2023-05-02', '', '', 0, '2023-05-17'),
(154, '2023-05-03', 'Tokopedia', 72000, '2 box sarung tangan latex', '2023-05-03 09:41:13', 'N', '2023-05-03 09:41:13', 1, 0, 'A', '2023-05-03', 'Y', NULL, 'NR', 'A', '2023-05-03', '', '', 0, '2023-05-17'),
(155, '2023-05-03', 'Beli ', 320000, 'tiner drijen besar', '2023-05-03 14:30:40', 'N', '2023-05-03 14:30:40', 1, 0, 'A', '2023-05-03', 'Y', NULL, 'NR', 'A', '2023-05-03', '', '', 0, '2023-05-17'),
(156, '2023-05-03', 'Token Listrik', 202500, 'WS 1', '2023-05-03 15:48:49', 'N', '2023-05-03 15:48:49', 1, 0, 'A', '2023-05-03', 'Y', NULL, 'NR', 'A', '2023-05-03', '', '', 0, '2023-05-17'),
(157, '2023-05-03', 'Kasbon / Pinjaman', 100000, 'Untuk beli makan', '2023-05-03 17:41:56', 'N', '2023-05-03 17:41:56', 1, 0, 'A', '2023-05-03', 'Y', '148', 'NR', 'K', '2023-05-03', '', '', 0, '2023-05-28'),
(158, '2023-05-04', 'isi bensin pcx', 60000, 'cabang sultan agung', '2023-05-04 18:15:51', 'N', '2023-05-04 18:15:51', 1, 0, 'A', '2023-05-04', 'Y', NULL, 'NR', 'A', '2023-05-04', '', '', 0, '2023-05-17'),
(159, '2023-05-05', 'Beli ', 26000, 'tissue', '2023-05-05 11:27:09', 'N', '2023-05-05 11:27:09', 1, 0, 'A', '2023-05-05', 'Y', NULL, 'NR', 'A', '2023-05-05', '', '', 0, '2023-05-17'),
(160, '2023-05-05', 'grab', 102000, 'sultan agung', '2023-05-05 11:27:32', 'N', '2023-05-05 11:27:32', 1, 0, 'A', '2023-05-05', 'Y', NULL, 'NR', 'A', '2023-05-05', '', '', 0, '2023-05-17'),
(161, '2023-05-05', 'Beli ', 24000, 'masking tape', '2023-05-05 11:27:48', 'N', '2023-05-05 11:27:48', 1, 0, 'A', '2023-05-05', 'Y', NULL, 'NR', 'A', '2023-05-05', '', '', 0, '2023-05-17'),
(162, '2023-05-05', 'pulsa', 12750, 'kantor', '2023-05-05 11:29:52', 'N', '2023-05-05 11:29:52', 1, 0, 'A', '2023-05-05', 'Y', NULL, 'NR', 'A', '2023-05-05', '', '', 0, '2023-05-17'),
(163, '2023-05-06', 'bayar toll', 35000, 'proses sultan agung', '2023-05-06 11:56:26', 'N', '2023-05-06 11:56:26', 1, 0, 'A', '2023-05-08', 'Y', NULL, 'NR', 'A', '2023-05-06', '', '', 0, '2023-05-17'),
(164, '2023-05-06', 'Bensin pcx', 30000, 'tc bogor', '2023-05-06 11:57:05', 'N', '2023-05-06 11:57:05', 1, 0, 'A', '2023-05-06', 'Y', NULL, 'NR', 'A', '2023-05-06', '', '', 0, '2023-05-17'),
(165, '2023-05-06', 'Beli ', 5000, 'sunlight', '2023-05-06 14:12:36', 'N', '2023-05-06 14:12:36', 1, 0, 'A', '2023-05-06', 'Y', NULL, 'NR', 'A', '2023-05-06', '', '', 0, '2023-05-17'),
(166, '2023-05-07', 'Lembur', 15000, 'Home servis ', '2023-05-07 09:21:30', 'N', '2023-05-07 09:21:30', 1, 0, 'A', '2023-05-08', 'Y', '150', 'NR', 'L', '2023-05-07', '08:20', '05:00', 0, '2023-05-17'),
(167, '2023-05-07', 'Dinas', 30000, 'Uang bensin 26,000', '2023-05-07 09:34:45', 'N', '2023-05-07 09:34:45', 1, 0, 'A', '2023-05-08', 'N', '153', 'NR', 'D', '2023-05-07', '08:33', '17:00', 1, '2023-05-17'),
(168, '2023-05-07', 'Lembur', 15000, 'Lembur mobil Voxi', '2023-05-07 19:01:52', 'N', '2023-05-07 19:01:52', 1, 0, 'A', '2023-05-08', 'Y', '153', 'NR', 'L', '2023-05-07', '08:30', '18:01', 1, '2023-05-17'),
(169, '2023-05-07', 'Lembur', 15000, 'Lembur minggu Santafe ', '2023-05-07 19:16:56', 'N', '2023-05-07 19:16:56', 1, 0, 'A', '2023-05-08', 'Y', '151', 'NR', 'L', '2023-05-07', '08:00', '17:00', 1, '2023-05-17'),
(170, '2023-05-07', 'Lembur', 15000, 'Lembur di hari minggu', '2023-05-07 19:17:16', 'N', '2023-05-07 19:17:16', 1, 0, 'A', '2023-05-08', 'Y', '154', 'NR', 'L', '2023-05-07', '08:40', '17:00', 0, '2023-05-17'),
(171, '2023-05-07', 'Lembur', 15000, '', '2023-05-07 20:26:17', 'N', '2023-05-07 20:26:17', 1, 0, 'A', '2023-05-08', 'N', '150', 'NR', 'L', '2023-05-07', '17:00', '18:00', 0, '2023-05-17'),
(172, '2023-05-08', 'Dinas', 30000, 'Home servis tgl 29', '2023-05-08 09:33:17', 'N', '2023-05-08 09:33:17', 1, 0, 'A', '2023-05-08', 'Y', '150', 'NR', 'D', '2023-05-08', '08:00', '17:00', 0, '2023-05-17'),
(173, '2023-05-08', 'grab', 110000, 'proses sultan agung', '2023-05-08 09:55:33', 'Y', '2023-05-08 08:55:45', 1, 0, 'A', '2023-05-08', 'Y', NULL, 'NR', 'A', '2023-05-08', '', '', 0, '2023-05-17'),
(174, '2023-05-08', 'DEPOSIT 2', 3000000, 'kantor', '2023-05-08 09:56:30', 'N', '2023-05-08 09:56:30', 0, 1, 'D', '2023-05-08', 'Y', NULL, 'NR', 'A', '2023-05-08', '', '', 0, '2023-05-17'),
(175, '2023-05-08', 'beli', 11000, 'masking tape', '2023-05-08 09:57:28', 'N', '2023-05-08 09:57:28', 1, 0, 'A', '2023-05-08', 'Y', NULL, 'NR', 'A', '2023-05-08', '', '', 0, '2023-05-17'),
(176, '2023-05-08', 'grab pergi', 110000, 'proses sultan agung', '2023-05-08 09:57:54', 'N', '2023-05-08 09:57:54', 1, 0, 'A', '2023-05-08', 'Y', NULL, 'NR', 'A', '2023-05-08', '', '', 0, '2023-05-17'),
(177, '2023-05-08', 'grab pulang', 123500, 'proses sultan agung', '2023-05-08 09:58:40', 'N', '2023-05-08 09:58:40', 1, 0, 'A', '2023-05-08', 'Y', NULL, 'NR', 'A', '2023-05-08', '', '', 0, '2023-05-17'),
(178, '2023-05-08', 'Dinas', 30000, 'Uang bensin tgl 7', '2023-05-08 10:49:18', 'N', '2023-05-08 10:49:18', 1, 0, 'A', '2023-05-08', 'Y', '153', 'NR', 'D', '2023-05-08', '08:00', '18:00', 1, '2023-05-17'),
(179, '2023-05-08', 'Kasbon / Pinjaman', 100000, 'Bikin atm/ saldo ', '2023-05-08 10:50:55', 'N', '2023-05-08 10:50:55', 1, 0, 'A', '2023-05-08', 'Y', '151', 'NR', 'K', '2023-05-08', '', '', 0, '2023-05-17'),
(180, '2023-05-08', 'bayar', 150000, 'wifi', '2023-05-08 10:52:28', 'N', '2023-05-08 10:52:28', 1, 0, 'A', '2023-05-08', 'Y', NULL, 'NR', 'A', '2023-05-08', '', '', 0, '2023-05-17'),
(181, '2023-05-08', 'beli', 272000, 'kabel tembaga 20m', '2023-05-08 16:26:37', 'N', '2023-05-08 16:26:37', 1, 0, 'A', '2023-05-08', 'Y', NULL, 'NR', 'A', '2023-05-08', '', '', 0, '2023-05-17'),
(182, '2023-05-08', 'beli', 300000, 'stiker', '2023-05-08 16:29:31', 'N', '2023-05-08 16:29:31', 1, 0, 'A', '2023-05-08', 'Y', NULL, 'NR', 'A', '2023-05-08', '', '', 0, '2023-05-17'),
(183, '2023-05-08', 'Beli ', 15000, 'kepala colokan', '2023-05-08 16:51:30', 'N', '2023-05-08 16:51:30', 1, 0, 'A', '2023-05-08', 'Y', NULL, 'NR', 'A', '2023-05-08', '', '', 0, '2023-05-17'),
(184, '2023-05-08', 'bayar', 100000, 'tukang listrik', '2023-05-08 16:52:01', 'N', '2023-05-08 16:52:01', 1, 0, 'A', '2023-05-08', 'Y', NULL, 'NR', 'A', '2023-05-08', '', '', 0, '2023-05-17'),
(185, '2023-05-09', 'bayar', 241550, 'lemari', '2023-05-09 09:52:08', 'N', '2023-05-09 09:52:08', 1, 0, 'A', '2023-05-09', 'Y', NULL, 'NR', 'A', '2023-05-09', '', '', 0, '2023-05-17'),
(186, '2023-05-09', 'Kasbon / Pinjaman', 100000, 'Berobat ', '2023-05-09 14:18:00', 'N', '2023-05-09 14:18:00', 1, 0, 'A', '2023-05-09', 'Y', '151', 'NR', 'K', '2023-05-09', '', '', 0, '2023-05-17'),
(187, '2023-05-10', 'beli bensin', 30000, 'motor pcx bekasi', '2023-05-10 10:44:04', 'N', '2023-05-10 10:44:04', 1, 0, 'A', '2023-05-10', 'Y', NULL, 'NR', 'A', '2023-05-10', '', '', 0, '2023-05-17'),
(188, '2023-05-10', 'beli', 286000, 'injakan steam', '2023-05-10 10:45:20', 'N', '2023-05-10 10:45:20', 1, 0, 'A', '2023-05-10', 'Y', NULL, 'NR', 'A', '2023-05-10', '', '', 0, '2023-05-17'),
(189, '2023-05-10', 'beli', 5000, 'silet', '2023-05-10 12:54:23', 'N', '2023-05-10 12:54:23', 1, 0, 'A', '2023-05-10', 'Y', NULL, 'NR', 'A', '2023-05-10', '', '', 0, '2023-05-17'),
(190, '2023-05-10', 'Kasbon / Pinjaman', 100000, 'Beli bensin ', '2023-05-10 17:19:31', 'N', '2023-05-10 17:19:31', 1, 0, 'A', '2023-05-10', 'Y', '148', 'NR', 'K', '2023-05-10', '', '', 0, '2023-05-28'),
(191, '2023-05-11', 'bayar grab pergi', 105000, 'mitsubishi lenteng agung', '2023-05-11 11:49:31', 'N', '2023-05-11 11:49:31', 1, 0, 'A', '2023-05-11', 'Y', NULL, 'NR', 'A', '2023-05-11', '', '', 0, '2023-05-17'),
(192, '2023-05-11', 'bayar toll', 20000, 'sultan agung', '2023-05-11 14:02:41', 'N', '2023-05-11 14:02:41', 1, 0, 'A', '2023-05-11', 'Y', NULL, 'NR', 'A', '2023-05-11', '', '', 0, '2023-05-17'),
(193, '2023-05-11', 'bayar grab pulang', 104000, 'sultan agung', '2023-05-11 17:48:18', 'N', '2023-05-11 17:48:18', 1, 0, 'A', '2023-05-11', 'Y', NULL, 'NR', 'A', '2023-05-11', '', '', 0, '2023-05-17'),
(194, '2023-05-13', 'bayar', 200000, 'lampu travo', '2023-05-13 09:49:16', 'N', '2023-05-13 09:49:16', 1, 0, 'A', '2023-05-13', 'Y', NULL, 'NR', 'A', '2023-05-13', '', '', 0, '2023-05-17'),
(195, '2023-05-13', 'beli', 75000, 'kabel colokan', '2023-05-13 09:49:41', 'N', '2023-05-13 09:49:41', 1, 0, 'A', '2023-05-13', 'Y', NULL, 'NR', 'A', '2023-05-13', '', '', 0, '2023-05-17'),
(196, '2023-05-13', 'bayar', 30000, 'sampah', '2023-05-13 09:54:40', 'N', '2023-05-13 09:54:40', 1, 0, 'A', '2023-05-13', 'Y', NULL, 'NR', 'A', '2023-05-13', '', '', 0, '2023-05-17'),
(197, '2023-05-13', 'gojek', 15000, 'ambil mobil hrv', '2023-05-13 11:24:40', 'N', '2023-05-13 11:24:40', 1, 0, 'A', '2023-05-13', 'Y', NULL, 'NR', 'A', '2023-05-13', '', '', 0, '2023-05-17'),
(198, '2023-05-13', 'grab pergi', 137000, 'mazda sultan agung', '2023-05-13 11:27:41', 'N', '2023-05-13 11:27:41', 1, 0, 'A', '2023-05-13', 'Y', NULL, 'NR', 'A', '2023-05-13', '', '', 0, '2023-05-17'),
(199, '2023-05-13', 'Kasbon / Pinjaman', 400000, 'Buat bener motor n tranfour setiap hari ', '2023-05-13 13:48:15', 'N', '2023-05-13 13:48:15', 1, 0, 'A', '2023-05-15', 'Y', '150', 'NR', 'K', '2023-05-13', '', '', 0, '2023-05-17'),
(200, '2023-05-13', 'DEPOSIT 3', 3000000, 'Kantor', '2023-05-13 16:11:07', 'N', '2023-05-13 16:11:07', 0, 1, 'D', '2023-05-13', 'Y', NULL, 'NR', 'A', '2023-05-13', '', '', 0, '2023-05-17'),
(201, '2023-05-13', 'bayar', 389000, '20 L minyak tanah', '2023-05-13 16:12:55', 'N', '2023-05-13 16:12:55', 1, 0, 'A', '2023-05-13', 'Y', NULL, 'NR', 'A', '2023-05-13', '', '', 0, '2023-05-17'),
(202, '2023-05-13', 'Kasbon / Pinjaman', 100000, '', '2023-05-13 17:17:38', 'Y', '2023-05-15 10:23:52', 1, 0, 'A', '2023-05-13', 'N', '148', 'NR', 'K', '2023-05-13', '', '', 1, '2023-05-28'),
(203, '2023-05-13', 'Kasbon / Pinjaman', 100000, 'Kasbon', '2023-05-13 17:29:26', 'N', '2023-05-13 17:29:26', 1, 0, 'A', '2023-05-13', 'Y', '148', 'NR', 'K', '2023-05-13', '', '', 0, '2023-05-28'),
(204, '2023-05-14', 'Lembur', 15000, 'Lembur nc2 hrv merah', '2023-05-14 15:44:52', 'N', '2023-05-14 15:44:52', 1, 0, 'A', '2023-05-15', 'Y', '149', 'NR', 'L', '2023-05-14', '09:00', '17:00', 0, '2023-05-17'),
(205, '2023-05-14', 'Lembur', 15000, 'Hrv merah ', '2023-05-14 15:47:48', 'N', '2023-05-14 15:47:48', 1, 0, 'A', '2023-05-15', 'Y', '151', 'NR', 'L', '2023-05-14', '08:30', '16:00', 1, '2023-05-17'),
(206, '2023-05-15', 'grab pulang', 167500, 'sultan agung', '2023-05-15 10:53:45', 'N', '2023-05-15 10:53:45', 1, 0, 'A', '2023-05-15', 'Y', NULL, 'NR', 'A', '2023-05-15', '', '', 0, '2023-05-17'),
(207, '2023-05-15', 'beli', 5000, 'rinso', '2023-05-15 10:54:40', 'N', '2023-05-15 10:54:40', 1, 0, 'A', '2023-05-15', 'Y', NULL, 'NR', 'A', '2023-05-15', '', '', 0, '2023-05-17'),
(208, '2023-05-15', 'beli bensin', 15000, 'jemput mobil', '2023-05-15 10:55:08', 'N', '2023-05-15 10:55:08', 1, 0, 'A', '2023-05-15', 'Y', NULL, 'NR', 'A', '2023-05-15', '', '', 0, '2023-05-17'),
(209, '2023-05-15', 'Kasbon / Pinjaman', 100000, 'kasbon ', '2023-05-15 11:26:07', 'N', '2023-05-15 11:26:07', 1, 0, 'A', '2023-05-15', 'Y', '151', 'NR', 'K', '2023-05-15', '', '', 0, '2023-05-17'),
(210, '2023-05-15', 'beli', 320000, 'tiner drijen besar', '2023-05-15 14:17:26', 'N', '2023-05-15 14:17:26', 1, 0, 'A', '2023-05-15', 'Y', NULL, 'NR', 'A', '2023-05-15', '', '', 0, '2023-05-17'),
(211, '2023-05-15', 'Kasbon / Pinjaman', 800000, 'Bayar angsuran motor ', '2023-05-15 14:34:51', 'N', '2023-05-15 14:34:51', 1, 0, 'A', '2023-05-15', 'Y', '148', 'NR', 'K', '2023-05-15', '', '', 0, '2023-05-28'),
(212, '2023-05-16', 'Kasbon / Pinjaman', 300000, 'Kasbon', '2023-05-16 17:26:28', 'N', '2023-05-16 17:26:28', 1, 0, 'A', '2023-05-16', 'Y', '153', 'NR', 'K', '2023-05-16', '', '', 0, '2023-05-17'),
(213, '2023-05-17', 'transfer', 200000, 'ke atm pak kiki', '2023-05-17 10:15:38', 'N', '2023-05-17 10:15:38', 1, 0, 'A', '2023-05-17', 'Y', NULL, 'NR', 'A', '2023-05-17', '', '', 0, '2023-05-17'),
(214, '2023-05-17', 'beli', 200400, '2 pack korek api', '2023-05-17 10:17:46', 'N', '2023-05-17 10:17:46', 1, 0, 'A', '2023-05-17', 'Y', NULL, 'NR', 'A', '2023-05-17', '', '', 0, '2023-05-17'),
(215, '2023-05-17', 'beli', 75000, 'token ws 1', '2023-05-17 10:19:23', 'N', '2023-05-17 10:19:23', 1, 0, 'A', '2023-05-17', 'Y', NULL, 'NR', 'A', '2023-05-17', '', '', 0, '2023-05-17'),
(216, '2023-05-17', 'Beli ', 2000, 'sunlight', '2023-05-17 10:19:39', 'N', '2023-05-17 10:19:39', 1, 0, 'A', '2023-05-17', 'Y', NULL, 'NR', 'A', '2023-05-17', '', '', 0, '2023-05-17'),
(217, '2023-05-17', 'beli', 12000, 'materai 10rb', '2023-05-17 11:11:26', 'N', '2023-05-17 11:11:26', 1, 0, 'A', '2023-05-17', 'Y', NULL, 'NR', 'A', '2023-05-17', '', '', 0, '2023-05-17'),
(218, '2023-05-17', 'Beli', 16500, 'baygon', '2023-05-17 16:28:19', 'N', '2023-05-17 16:28:19', 1, 0, 'A', '2023-05-17', 'Y', NULL, 'NR', 'A', '2023-05-17', '', '', 0, '2023-05-17'),
(219, '2023-05-17', 'Kasbon / Pinjaman', 100, 'Bb', '2023-05-17 16:49:51', 'Y', '2023-05-17 03:50:53', 1, 0, 'A', '2023-05-17', 'Y', '175', 'NR', 'K', '2023-05-17', '', '', 1, '2023-05-29'),
(220, '2023-05-17', 'Kasbon / Pinjaman', 100001, '', '2023-05-17 16:51:13', 'Y', '2023-05-17 04:03:56', 1, 0, 'A', '2023-05-17', 'Y', '175', 'NR', 'K', '2023-05-17', '', '', 1, '2023-05-29'),
(221, '2023-05-17', 'Kasbon / Pinjaman', 50, 'Bb', '2023-05-17 16:58:54', 'Y', '2023-05-17 04:03:54', 1, 0, 'A', '2023-05-17', 'Y', '175', 'NR', 'K', '2023-05-17', '', '', 1, '2023-05-29'),
(222, '2023-05-17', 'DEPOSIT 4', 7400000, 'kantor', '2023-05-17 17:16:22', 'N', '2023-05-17 17:16:22', 0, 1, 'D', '2023-05-19', 'Y', NULL, 'NR', 'A', '2023-05-17', '', '', 0, '2023-05-17'),
(223, '2023-05-17', 'bayar', 150000, 'cat bagasi hrv', '2023-05-17 17:20:31', 'N', '2023-05-17 17:20:31', 1, 0, 'A', '2023-05-22', 'Y', NULL, 'NR', 'A', '2023-05-17', '', '', 0, '2023-05-17'),
(224, '2023-05-17', 'Kasbon / Pinjaman', 150000, 'Bayar cat HRV', '2023-05-17 17:42:50', 'N', '2023-05-17 17:42:50', 1, 0, 'A', '2023-05-20', 'Y', '148', 'NR', 'K', '2023-05-17', '', '', 0, '2023-05-28'),
(225, '2023-05-17', 'Dinas', 30000, '', '2023-05-17 20:15:49', 'N', '2023-05-17 20:15:49', 1, 0, 'A', '2023-05-19', 'Y', '153', 'NR', 'D', '2023-05-17', '08:30', '18:00', 0, '2023-05-17'),
(226, '2023-05-19', 'bayar', 4400000, 'bayar karpet lantai', '2023-05-19 10:42:07', 'N', '2023-05-19 10:42:07', 1, 0, 'A', '2023-05-19', 'Y', NULL, 'NR', 'A', '2023-05-19', '', '', 0, '2023-05-19'),
(227, '2023-05-19', 'bayar', 220000, 'driver lalamove', '2023-05-19 10:57:54', 'N', '2023-05-19 10:57:54', 1, 0, 'A', '2023-05-19', 'Y', NULL, 'NR', 'A', '2023-05-19', '', '', 0, '2023-05-19'),
(228, '2023-05-19', 'bayar', 404000, 'kredivo', '2023-05-19 11:13:40', 'N', '2023-05-19 11:13:40', 1, 0, 'A', '2023-05-19', 'Y', NULL, 'NR', 'A', '2023-05-19', '', '', 0, '2023-05-19'),
(229, '2023-05-19', 'bayar tokped', 582900, '100 lap MF', '2023-05-19 16:21:52', 'N', '2023-05-19 16:21:52', 1, 0, 'A', '2023-05-19', 'Y', NULL, 'NR', 'A', '2023-05-19', '', '', 0, '2023-05-19'),
(230, '2023-05-19', 'pembelian', 150000, 'cat', '2023-05-19 16:25:32', 'N', '2023-05-19 16:25:32', 1, 0, 'A', '2023-05-19', 'Y', NULL, 'NR', 'A', '2023-05-19', '', '', 0, '2023-05-19'),
(231, '2023-05-19', 'pembelian', 95000, 'botol spray', '2023-05-19 17:56:00', 'N', '2023-05-19 17:56:00', 1, 0, 'A', '2023-05-19', 'Y', NULL, 'NR', 'A', '2023-05-19', '', '', 0, '2023-05-19'),
(232, '2023-05-20', 'beli', 5000, 'galon', '2023-05-20 10:05:49', 'N', '2023-05-20 10:05:49', 1, 0, 'A', '2023-05-20', 'Y', NULL, 'NR', 'A', '2023-05-20', '', '', 0, '2023-05-20'),
(233, '2023-05-20', 'Kasbon / Pinjaman', 100000, 'Kasbon', '2023-05-20 12:10:38', 'N', '2023-05-20 12:10:38', 1, 0, 'A', '2023-05-20', 'Y', '148', 'NR', 'K', '2023-05-20', '', '', 0, '2023-05-28'),
(234, '2023-05-20', 'Kasbon / Pinjaman', 100000, 'Berobat ', '2023-05-20 12:18:37', 'N', '2023-05-20 12:18:37', 1, 0, 'A', '2023-05-20', 'Y', '151', 'NR', 'K', '2023-05-20', '', '', 0, '2023-05-20'),
(235, '2023-05-18', 'Lembur', 15000, 'Kerjain unit pendingi an', '2023-05-20 13:28:36', 'N', '2023-05-20 13:28:36', 1, 0, 'A', '2023-05-22', 'Y', '150', 'NR', 'L', '2023-05-20', '08:15', '03:00', 0, '2023-05-20'),
(236, '2023-05-20', 'beli', 202500, 'token ws 1', '2023-05-20 14:10:09', 'N', '2023-05-20 14:10:09', 1, 0, 'A', '2023-05-20', 'Y', NULL, 'NR', 'A', '2023-05-20', '', '', 0, '2023-05-20'),
(237, '2023-05-21', 'Kasbon / Pinjaman', 100000, 'kasbon ', '2023-05-21 13:54:33', 'N', '2023-05-21 13:54:33', 1, 0, 'A', '2023-05-22', 'Y', '151', 'NR', 'K', '2023-05-21', '', '', 0, '2023-05-29'),
(238, '2023-05-21', 'Lembur', 15000, 'Pajero ', '2023-05-21 18:02:48', 'N', '2023-05-21 18:02:48', 1, 0, 'A', '2023-05-22', 'Y', '151', 'NR', 'L', '2023-05-21', '08:30', '17:02', 0, '2023-05-21'),
(239, '2023-05-18', 'Lembur', 15000, 'Hrv putih ', '2023-05-21 18:05:34', 'N', '2023-05-21 18:05:34', 1, 0, 'A', '2023-05-22', 'Y', '151', 'NR', 'L', '2023-05-21', '08:30', '17:05', 0, '2023-05-21'),
(240, '2023-05-21', 'Lembur', 15000, 'Pengerjaan Pajero ', '2023-05-21 18:26:00', 'N', '2023-05-21 18:26:00', 1, 0, 'A', '2023-05-22', 'Y', '153', 'NR', 'L', '2023-05-21', '08:00', '00:00', 0, '2023-05-21'),
(241, '2023-05-22', 'bayar', 63000, 'grab', '2023-05-22 09:48:18', 'N', '2023-05-22 09:48:18', 1, 0, 'A', '2023-05-22', 'Y', NULL, 'NR', 'A', '2023-05-22', '', '', 0, '2023-05-22'),
(242, '2023-05-22', 'bayar', 600000, 'renovasi ws 2', '2023-05-22 09:48:54', 'N', '2023-05-22 09:48:54', 1, 0, 'A', '2023-05-22', 'Y', NULL, 'NR', 'A', '2023-05-22', '', '', 0, '2023-05-22'),
(243, '2023-05-22', 'beli', 52500, 'token ws 2', '2023-05-22 09:49:59', 'N', '2023-05-22 09:49:59', 1, 0, 'A', '2023-05-22', 'Y', NULL, 'NR', 'A', '2023-05-22', '', '', 0, '2023-05-22'),
(244, '2023-05-22', 'beli', 18000, 'kuas poles ', '2023-05-22 11:07:50', 'N', '2023-05-22 11:07:50', 1, 0, 'A', '2023-05-22', 'Y', NULL, 'NR', 'A', '2023-05-22', '', '', 0, '2023-05-22'),
(245, '2023-05-22', 'beli bensin', 15000, 'ambil mobil crv', '2023-05-22 11:17:10', 'N', '2023-05-22 11:17:10', 1, 0, 'A', '2023-05-22', 'Y', NULL, 'NR', 'A', '2023-05-22', '', '', 0, '2023-05-22'),
(246, '2023-05-22', 'DEPOSIT 5', 3000000, 'KANTOR', '2023-05-22 17:02:47', 'N', '2023-05-22 17:02:47', 0, 1, 'D', '2023-05-22', 'Y', NULL, 'NR', 'A', '2023-05-22', '', '', 0, '2023-05-22'),
(247, '2023-05-22', 'bayar', 150000, 'cat', '2023-05-22 17:03:14', 'N', '2023-05-22 17:03:14', 1, 0, 'A', '2023-05-22', 'Y', NULL, 'NR', 'A', '2023-05-22', '', '', 0, '2023-05-22'),
(248, '2023-05-22', 'bayar', 1428070, 'hidrolik', '2023-05-22 17:07:29', 'N', '2023-05-22 17:07:29', 1, 0, 'A', '2023-05-22', 'Y', NULL, 'NR', 'A', '2023-05-22', '', '', 0, '2023-05-22'),
(249, '2023-05-22', 'Lembur', 15000, 'Lembur Pajero ', '2023-05-22 20:01:05', 'N', '2023-05-22 20:01:05', 1, 0, 'A', '2023-05-24', 'N', '148', 'NR', 'L', '2023-05-22', '17:00', '18:30', 1, '2023-05-28'),
(250, '2023-05-23', 'bayar grab', 20000, 'anter kunci kantor', '2023-05-23 09:53:04', 'N', '2023-05-23 09:53:04', 1, 0, 'A', '2023-05-23', 'Y', NULL, 'NR', 'A', '2023-05-23', '', '', 0, '2023-05-23'),
(251, '2023-05-23', 'beli', 835000, 'compond', '2023-05-23 15:47:59', 'N', '2023-05-23 15:47:59', 1, 0, 'A', '2023-05-23', 'Y', NULL, 'NR', 'A', '2023-05-23', '', '', 0, '2023-05-23'),
(252, '2023-05-23', 'Lembur', 15000, 'Homer service hyundai palisade ', '2023-05-23 20:47:26', 'N', '2023-05-23 20:47:26', 1, 0, 'A', '2023-05-24', 'N', '148', 'NR', 'L', '2023-05-23', '17:00', '19:47', 1, '2023-05-28'),
(253, '2023-05-24', 'beli', 70000, 'bensin pcx', '2023-05-24 10:37:20', 'N', '2023-05-24 10:37:20', 1, 0, 'A', '2023-05-24', 'Y', NULL, 'NR', 'A', '2023-05-24', '', '', 0, '2023-05-24'),
(254, '2023-05-24', 'Dinas', 30000, 'Uang bensin', '2023-05-24 11:51:27', 'N', '2023-05-24 11:51:27', 1, 0, 'A', '2023-05-24', 'Y', '153', 'NR', 'D', '2023-05-24', '08:00', '17:00', 0, '2023-05-24'),
(255, '2023-05-24', 'beli', 16000, 'fischer dan sekrup hitam', '2023-05-24 14:57:32', 'N', '2023-05-24 14:57:32', 1, 0, 'A', '2023-05-24', 'Y', NULL, 'NR', 'A', '2023-05-24', '', '', 0, '2023-05-24'),
(256, '2023-05-24', 'beli', 18000, 'obeng', '2023-05-24 15:56:36', 'N', '2023-05-24 15:56:36', 1, 0, 'A', '2023-05-24', 'Y', NULL, 'NR', 'A', '2023-05-24', '', '', 0, '2023-05-24'),
(257, '2023-05-24', 'beli bensin', 60000, '2 hari motor neti', '2023-05-24 18:07:21', 'N', '2023-05-24 18:07:21', 1, 0, 'A', '2023-05-24', 'Y', NULL, 'NR', 'A', '2023-05-24', '', '', 0, '2023-05-24'),
(258, '2023-05-26', 'beli', 102500, 'token ws 2', '2023-05-26 10:32:56', 'N', '2023-05-26 10:32:56', 1, 0, 'A', '2023-05-26', 'Y', NULL, 'NR', 'A', '2023-05-26', '', '', 0, '2023-05-26'),
(259, '2023-05-26', 'beli', 12000, 'pulpen', '2023-05-26 10:33:38', 'N', '2023-05-26 10:33:38', 1, 0, 'A', '2023-05-26', 'Y', NULL, 'NR', 'A', '2023-05-26', '', '', 0, '2023-05-26'),
(260, '2023-05-26', 'beli', 40000, 'aqua', '2023-05-26 15:54:41', 'N', '2023-05-26 15:54:41', 1, 0, 'A', '2023-05-26', 'Y', NULL, 'NR', 'A', '2023-05-26', '', '', 0, '2023-05-26'),
(261, '2023-05-26', 'pembayaran hosting', 316000, 'web stargard', '2023-05-26 16:44:00', 'N', '2023-05-26 16:44:00', 1, 0, 'A', '2023-05-26', 'Y', NULL, 'NR', 'A', '2023-05-26', '', '', 0, '2023-05-26'),
(262, '2023-05-27', 'beli bensin', 30000, 'antar mobil hrv', '2023-05-27 11:16:17', 'Y', '2023-05-27 10:18:05', 1, 0, 'A', '2023-05-27', 'Y', NULL, 'NR', 'A', '2023-05-27', '', '', 0, '2023-05-27'),
(263, '2023-05-26', 'Dinas', 30000, 'Anter mobil sama andi', '2023-05-27 11:27:25', 'N', '2023-05-27 11:27:25', 1, 0, 'A', '2023-05-27', 'Y', '153', 'NR', 'D', '2023-05-27', '16:00', '19:00', 0, '2023-05-27'),
(264, '2023-05-27', 'beli minum', 20000, 'saat anter mobil', '2023-05-27 15:15:55', 'N', '2023-05-27 15:15:55', 1, 0, 'A', '2023-05-27', 'Y', NULL, 'NR', 'A', '2023-05-27', '', '', 0, '2023-05-27'),
(265, '2023-05-27', 'beli', 10000, 'materai', '2023-05-27 15:16:08', 'N', '2023-05-27 15:16:08', 1, 0, 'A', '2023-05-27', 'Y', NULL, 'NR', 'A', '2023-05-27', '', '', 0, '2023-05-27'),
(266, '2023-05-29', 'Lembur', 15000, 'Lembur Minggu ', '2023-05-29 09:18:43', 'N', '2023-05-29 09:18:43', 1, 0, 'A', '2023-05-29', 'A', '150', 'NR', 'L', '2023-05-29', '08:00', '05:00', 0, '2023-05-29'),
(267, '2023-05-28', 'Lembur', 15000, 'Standby', '2023-05-29 09:36:33', 'N', '2023-05-29 09:36:33', 1, 0, 'A', '2023-05-29', 'A', '149', 'NR', 'L', '2023-05-29', '08:30', '10:30', 0, '2023-05-29');

-- --------------------------------------------------------

--
-- Table structure for table `t_peng_histori`
--

CREATE TABLE `t_peng_histori` (
  `id` int(11) NOT NULL,
  `pengajuan` varchar(50) NOT NULL,
  `keterangan_p` text NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `status_pengajuan` enum('Y','T','N','A') NOT NULL DEFAULT 'A',
  `tgl_update` date NOT NULL,
  `id_pegawai` varchar(11) NOT NULL,
  `mulai` date NOT NULL,
  `akhir` date NOT NULL,
  `lama` int(11) NOT NULL,
  `sisa` int(11) NOT NULL,
  `tahun` varchar(11) NOT NULL,
  `kode` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_peng_histori`
--

INSERT INTO `t_peng_histori` (`id`, `pengajuan`, `keterangan_p`, `tgl_pengajuan`, `status_pengajuan`, `tgl_update`, `id_pegawai`, `mulai`, `akhir`, `lama`, `sisa`, `tahun`, `kode`) VALUES
(77, '1', 'Ega enak badan ,kepala pusing darah rendah.', '2023-04-20', 'Y', '2023-04-20', '150', '2023-04-21', '2023-04-21', 0, 0, '2023', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `t_poin`
--

CREATE TABLE `t_poin` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_sales` int(11) NOT NULL,
  `tgl_klaim` date NOT NULL DEFAULT current_timestamp(),
  `total_poin` int(11) NOT NULL,
  `status` enum('N','Y','T') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_presensi`
--

CREATE TABLE `t_presensi` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` varchar(15) NOT NULL,
  `status` varchar(11) NOT NULL,
  `id_pegawai` varchar(15) NOT NULL,
  `sts` varchar(11) NOT NULL,
  `overtime` int(3) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `langitude` varchar(50) NOT NULL,
  `foto_user` varchar(50) NOT NULL,
  `ajukan` varchar(1) NOT NULL DEFAULT 'T',
  `sts_ajukan` varchar(1) NOT NULL DEFAULT 'N',
  `tgl_acc` date NOT NULL,
  `status_absen` int(1) NOT NULL,
  `hapus_absen` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_presensi`
--

INSERT INTO `t_presensi` (`id`, `tanggal`, `waktu`, `status`, `id_pegawai`, `sts`, `overtime`, `latitude`, `langitude`, `foto_user`, `ajukan`, `sts_ajukan`, `tgl_acc`, `status_absen`, `hapus_absen`) VALUES
(61, '2023-04-01', '08:05', 'M', '148', 'A', -10, '', '', '16803112129732310112288425406675.jpg', 'T', 'N', '0000-00-00', 0, 0),
(62, '2023-04-01', '08:07', 'M', '153', 'A', -10, '', '', '16803112597551840801690.jpg', 'T', 'N', '0000-00-00', 0, 0),
(63, '2023-04-01', '08:16', 'M', '182', 'A', -10, '', '', '16803118667398539783480339148473.jpg', 'T', 'N', '0000-00-00', 0, 0),
(64, '2023-04-01', '08:27', 'M', '154', 'A', -10, '', '', '16803124536387431801445860934201.jpg', 'T', 'N', '0000-00-00', 0, 0),
(65, '2023-04-01', '08:28', 'M', '149', 'A', -10, '', '', '16803125014411348254166.jpg', 'T', 'N', '0000-00-00', 0, 0),
(66, '2023-04-01', '08:45', 'M', '150', 'A', -9, '', '', '16803135588471070645292145214866.jpg', 'T', 'N', '0000-00-00', 0, 0),
(67, '2023-04-01', '08:52', 'M', '151', 'A', -9, '', '', '1680313935785.jpg', 'T', 'N', '0000-00-00', 0, 0),
(68, '2023-04-01', '17:05', 'P', '148', 'B', -1, '', '', '16803435412783908739947612820532.jpg', 'T', 'N', '0000-00-00', 0, 0),
(69, '2023-04-01', '17:00', 'P', '149', 'B', -1, '', '', '16803436776892120938063.jpg', 'T', 'N', '0000-00-00', 0, 0),
(70, '2023-04-01', '17:12', 'P', '183', 'B', -1, '', '', '16803439551131850865078.jpg', 'T', 'N', '0000-00-00', 0, 0),
(71, '2023-04-01', '17:14', 'P', '182', 'B', -1, '', '', '16803440918622777575123243055984.jpg', 'T', 'N', '0000-00-00', 0, 0),
(72, '2023-04-01', '17:39', 'P', '150', 'B', 0, '', '', '16803455588037312799280787926886.jpg', 'T', 'N', '0000-00-00', 0, 0),
(73, '2023-04-01', '17:40', 'P', '154', 'B', 0, '', '', '16803456734892019626761853982165.jpg', 'T', 'N', '0000-00-00', 0, 0),
(74, '2023-04-01', '17:46', 'P', '151', 'B', 0, '', '', '1680345976131.jpg', 'T', 'N', '0000-00-00', 0, 0),
(75, '2023-04-01', '18:39', 'P', '153', 'B', 1, '', '', 'IMG-20230401-WA0014.jpg', 'T', 'O', '2023-04-14', 0, 0),
(76, '2023-04-03', '08:02', 'M', '150', 'A', -9, '', '', '16804837497401959506759322108955.jpg', 'T', 'N', '0000-00-00', 0, 0),
(77, '2023-04-03', '08:02', 'M', '153', 'A', -9, '', '', '16804837596761840801690.jpg', 'T', 'N', '0000-00-00', 0, 0),
(78, '2023-04-03', '08:09', 'M', '183', 'A', -9, '', '', '16804841547721192091030.jpg', 'T', 'N', '0000-00-00', 0, 0),
(79, '2023-04-03', '08:23', 'M', '182', 'A', -9, '', '', '16804850195666862313701483376905.jpg', 'T', 'N', '0000-00-00', 0, 0),
(80, '2023-04-03', '08:29', 'M', '154', 'A', -9, '', '', '16804853909303485004336456713931.jpg', 'T', 'N', '0000-00-00', 0, 0),
(81, '2023-04-03', '08:39', 'M', '149', 'A', -9, '', '', '1680485962601808507404.jpg', 'T', 'N', '0000-00-00', 0, 0),
(83, '2023-04-03', '08:39', 'M', '151', 'A', -9, '', '', '1680485985906-1665936556.jpg', 'T', 'N', '0000-00-00', 0, 0),
(84, '2023-04-03', '08:55', 'M', '148', 'A', -9, '', '', '16804869182756846617009325333232.jpg', 'T', 'N', '0000-00-00', 0, 0),
(85, '2023-04-03', '17:01', 'P', '182', 'B', 0, '', '', '16805160869762381144060143140879.jpg', 'T', 'N', '0000-00-00', 0, 0),
(86, '2023-04-03', '17:08', 'P', '148', 'B', 0, '', '', '16805164971661153453996428641124.jpg', 'T', 'N', '0000-00-00', 0, 0),
(87, '2023-04-03', '17:25', 'P', '150', 'B', 0, '', '', '16805175464302116287754685495024.jpg', 'T', 'N', '0000-00-00', 0, 0),
(88, '2023-04-03', '17:27', 'P', '151', 'B', 0, '', '', '1680517652379-1665936556.jpg', 'T', 'N', '0000-00-00', 0, 0),
(89, '2023-04-03', '19:34', 'P', '183', 'B', 2, '', '', '16805252991541437459456.jpg', 'T', 'O', '2023-04-14', 0, 0),
(90, '2023-04-03', '20:14', 'P', '153', 'B', 3, '', '', '16805276857701840801690.jpg', 'T', 'O', '2023-04-14', 0, 0),
(91, '2023-04-03', '20:14', 'P', '154', 'B', 3, '', '', '16805276864241273696177835568682.jpg', 'T', 'O', '2023-04-14', 0, 0),
(92, '2023-04-03', '20:23', 'P', '149', 'B', 3, '', '', '1680528202691969425844.jpg', 'T', 'O', '2023-04-14', 0, 0),
(94, '2023-04-04', '08:02', 'M', '183', 'A', -9, '', '', '16805701472161077668820.jpg', 'T', 'N', '0000-00-00', 0, 0),
(95, '2023-04-04', '08:03', 'M', '148', 'A', -9, '', '', '16805702082217703294588425964636.jpg', 'T', 'N', '0000-00-00', 0, 0),
(96, '2023-04-04', '08:07', 'M', '153', 'A', -9, '', '', '16805704528681840801690.jpg', 'T', 'N', '0000-00-00', 0, 0),
(97, '2023-04-04', '08:23', 'M', '182', 'A', -9, '', '', '16805714231044812868891116112920.jpg', 'T', 'N', '0000-00-00', 0, 0),
(98, '2023-04-04', '08:27', 'M', '149', 'A', -9, '', '', '16805716343331291775903.jpg', 'T', 'N', '0000-00-00', 0, 0),
(99, '2023-04-04', '08:36', 'M', '154', 'A', -9, '', '', '16805722069326015784618520413188.jpg', 'T', 'N', '0000-00-00', 0, 0),
(100, '2023-04-04', '09:31', 'M', '150', 'A', -8, '', '', '16805754800894333618007043292304.jpg', 'T', 'N', '0000-00-00', 0, 0),
(101, '2023-04-04', '17:01', 'P', '183', 'B', 0, '', '', '16806025322071087107442.jpg', 'T', 'N', '0000-00-00', 0, 0),
(102, '2023-04-04', '17:02', 'P', '153', 'B', 0, '', '', '16806025753841840801690.jpg', 'T', 'N', '0000-00-00', 0, 0),
(103, '2023-04-04', '17:03', 'P', '154', 'B', 0, '', '', '16806025975217529157480644811874.jpg', 'T', 'N', '0000-00-00', 0, 0),
(104, '2023-04-04', '17:05', 'P', '149', 'B', 0, '', '', '1680602752599545300723.jpg', 'T', 'N', '0000-00-00', 0, 0),
(105, '2023-04-04', '17:16', 'P', '148', 'B', 0, '', '', '16806033992327428496872834915543.jpg', 'T', 'N', '0000-00-00', 0, 0),
(106, '2023-04-04', '17:31', 'P', '150', 'B', 0, '', '', '16806043159706902323292824867567.jpg', 'T', 'N', '0000-00-00', 0, 0),
(107, '2023-04-04', '17:34', 'P', '182', 'B', 0, '', '', '16806045084904095348060958650874.jpg', 'T', 'N', '0000-00-00', 0, 0),
(108, '2023-04-05', '08:01', 'M', '153', 'A', -9, '', '', '16806564791141840801690.jpg', 'T', 'N', '0000-00-00', 0, 0),
(109, '2023-04-05', '08:04', 'M', '183', 'A', -9, '', '', '16806566904962145402959.jpg', 'T', 'N', '0000-00-00', 0, 0),
(110, '2023-04-05', '08:10', 'M', '150', 'A', -9, '', '', '16806570545061061159103776338713.jpg', 'T', 'N', '0000-00-00', 0, 0),
(111, '2023-04-05', '08:23', 'M', '151', 'A', -9, '', '', '16806577864812108114650.jpg', 'T', 'N', '0000-00-00', 0, 0),
(112, '2023-04-05', '08:23', 'M', '151', 'A', -9, '', '', '16806577864812108114650.jpg', 'T', 'N', '0000-00-00', 0, 0),
(113, '2023-04-05', '08:23', 'M', '148', 'A', -9, '', '', '1680657823200928873130826609328.jpg', 'T', 'N', '0000-00-00', 0, 0),
(114, '2023-04-05', '08:27', 'M', '182', 'A', -9, '', '', '16806580316955956071053121780594.jpg', 'T', 'N', '0000-00-00', 0, 0),
(115, '2023-04-05', '08:33', 'M', '154', 'A', -9, '', '', '16806583886662485487428148524276.jpg', 'T', 'N', '0000-00-00', 0, 0),
(116, '2023-04-05', '08:39', 'M', '149', 'A', -9, '', '', '16806587573451416858488.jpg', 'T', 'N', '0000-00-00', 0, 0),
(117, '2023-04-05', '17:01', 'P', '182', 'B', 0, '', '', '16806888843203394965509493558109.jpg', 'T', 'N', '0000-00-00', 0, 0),
(118, '2023-04-05', '17:10', 'P', '148', 'B', 0, '', '', '16806894380585751841064565660310.jpg', 'T', 'N', '0000-00-00', 0, 0),
(119, '2023-04-05', '17:12', 'P', '183', 'B', 0, '', '', '16806895612281484845803.jpg', 'T', 'N', '0000-00-00', 0, 0),
(120, '2023-04-05', '17:17', 'P', '154', 'B', 0, '', '', '16806898583828725276851621437908.jpg', 'T', 'N', '0000-00-00', 0, 0),
(121, '2023-04-05', '17:17', 'P', '151', 'B', 0, '', '', '16806898820962108114650.jpg', 'T', 'N', '0000-00-00', 0, 0),
(122, '2023-04-05', '17:19', 'P', '151', 'B', 0, '', '', '168068999331026848431.jpg', 'T', 'N', '0000-00-00', 0, 0),
(123, '2023-04-05', '18:50', 'P', '149', 'B', 1, '', '', '16806954261521410569066.jpg', 'T', 'O', '2023-04-14', 0, 0),
(124, '2023-04-05', '19:39', 'P', '150', 'B', 2, '', '', '16806983559535786687365194763511.jpg', 'T', 'O', '2023-04-14', 0, 0),
(125, '2023-04-05', '19:40', 'P', '153', 'B', 2, '', '', '1680698428591-2135392901.jpg', 'T', 'O', '2023-04-14', 0, 0),
(126, '2023-04-06', '08:08', 'M', '153', 'A', -9, '', '', '16807433009221840801690.jpg', 'T', 'N', '0000-00-00', 0, 0),
(127, '2023-04-06', '08:09', 'M', '183', 'A', -9, '', '', '1680743343514175019461.jpg', 'T', 'N', '0000-00-00', 0, 0),
(128, '2023-04-06', '08:17', 'M', '150', 'A', -9, '', '', '16807438454417957119016285796241.jpg', 'T', 'N', '0000-00-00', 0, 0),
(129, '2023-04-06', '08:23', 'M', '182', 'A', -9, '', '', '16807442062289134534243315591291.jpg', 'T', 'N', '0000-00-00', 0, 0),
(130, '2023-04-06', '08:33', 'M', '154', 'A', -9, '', '', '16807448594794252617943312605527.jpg', 'T', 'N', '0000-00-00', 0, 0),
(131, '2023-04-06', '08:36', 'M', '149', 'A', -9, '', '', '16807449749611078460371.jpg', 'T', 'N', '0000-00-00', 0, 0),
(132, '2023-04-06', '08:36', 'M', '148', 'A', -9, '', '', '16807449910513471497517838710776.jpg', 'T', 'N', '0000-00-00', 0, 0),
(133, '2023-04-06', '08:36', 'M', '151', 'A', -9, '', '', '16807450227432108114650.jpg', 'T', 'N', '0000-00-00', 0, 0),
(135, '2023-04-01', '08:12', 'M', '183', 'B', 0, '', '', '16803439551131850865078.jpg', 'T', 'N', '0000-00-00', 0, 0),
(137, '2023-04-06', '17:01', 'P', '151', 'B', 0, '', '', '16807752646822108114650.jpg', 'T', 'N', '0000-00-00', 0, 0),
(138, '2023-04-06', '17:01', 'P', '148', 'B', 0, '', '', '16807752822806753778241226878635.jpg', 'T', 'N', '0000-00-00', 0, 0),
(139, '2023-04-06', '17:02', 'P', '183', 'B', 0, '', '', '16807753358561906161602.jpg', 'T', 'N', '0000-00-00', 0, 0),
(140, '2023-04-06', '17:02', 'P', '150', 'B', 0, '', '', '16807753558262680870696221056336.jpg', 'T', 'N', '0000-00-00', 0, 0),
(141, '2023-04-06', '17:02', 'P', '182', 'B', 0, '', '', '16807753848671301734225833907917.jpg', 'T', 'N', '0000-00-00', 0, 0),
(142, '2023-04-06', '17:03', 'P', '153', 'B', 0, '', '', '16807754370881840801690.jpg', 'T', 'N', '0000-00-00', 0, 0),
(143, '2023-04-06', '17:03', 'P', '154', 'B', 0, '', '', '16807754056435684775688192362120.jpg', 'T', 'N', '0000-00-00', 0, 0),
(144, '2023-04-06', '17:04', 'P', '149', 'B', 0, '', '', '16807754845621396234263.jpg', 'T', 'N', '0000-00-00', 0, 0),
(145, '2023-04-07', '08:01', 'M', '150', 'A', -9, '', '', '1680829289405265663308940196427.jpg', 'T', 'N', '0000-00-00', 0, 0),
(146, '2023-04-07', '08:04', 'M', '183', 'A', -9, '', '', '16808294832561722051551.jpg', 'T', 'N', '0000-00-00', 0, 0),
(147, '2023-04-07', '08:11', 'M', '153', 'A', -9, '', '', '16808298553891840801690.jpg', 'T', 'N', '0000-00-00', 0, 0),
(148, '2023-04-07', '08:17', 'M', '182', 'A', -9, '', '', '16808302490857006067683964244838.jpg', 'T', 'N', '0000-00-00', 0, 0),
(149, '2023-04-07', '08:27', 'M', '151', 'A', -9, '', '', '16808308622292108114650.jpg', 'T', 'N', '0000-00-00', 0, 0),
(150, '2023-04-07', '08:31', 'M', '149', 'A', -9, '', '', '16808310948221098542740.jpg', 'T', 'N', '0000-00-00', 0, 0),
(151, '2023-04-07', '08:33', 'M', '148', 'A', -9, '', '', '16808312387468173696575013833116.jpg', 'T', 'N', '0000-00-00', 0, 0),
(152, '2023-04-07', '08:37', 'M', '154', 'A', -9, '', '', '16808314539244143125958953406294.jpg', 'T', 'N', '0000-00-00', 0, 0),
(153, '2023-04-07', '16:51', 'P', '149', 'B', -1, '', '', '1680861617844716296029.jpg', 'T', 'N', '0000-00-00', 0, 0),
(154, '2023-04-07', '17:01', 'P', '183', 'B', 0, '', '', '16808616646841270218681.jpg', 'T', 'N', '0000-00-00', 0, 0),
(155, '2023-04-07', '17:00', 'P', '148', 'B', 0, '', '', '1680861655805624152192267938946.jpg', 'T', 'N', '0000-00-00', 0, 0),
(156, '2023-04-07', '17:01', 'P', '153', 'B', 0, '', '', '16808616683761425278053750445000.jpg', 'T', 'N', '0000-00-00', 0, 0),
(157, '2023-04-07', '17:01', 'P', '182', 'B', 0, '', '', '16808617194814945391047219024020.jpg', 'T', 'N', '0000-00-00', 0, 0),
(158, '2023-04-07', '17:03', 'P', '150', 'B', 0, '', '', '16808618114086807572674508949214.jpg', 'T', 'N', '0000-00-00', 0, 0),
(159, '2023-04-07', '17:07', 'P', '154', 'B', 0, '', '', '16808620446821602403838311623759.jpg', 'T', 'N', '0000-00-00', 0, 0),
(161, '2023-04-08', '07:53', 'M', '150', 'A', -10, '', '', '16809152382302118455228640195656.jpg', 'T', 'N', '0000-00-00', 0, 0),
(162, '2023-04-08', '08:06', 'M', '150', 'A', -9, '', '', '16809160102544531631046676114950.jpg', 'T', 'N', '0000-00-00', 0, 0),
(163, '2023-04-08', '08:10', 'M', '183', 'A', -9, '', '', '1680916245452752841925.jpg', 'T', 'N', '0000-00-00', 0, 0),
(164, '2023-04-08', '08:11', 'M', '183', 'A', -9, '', '', '1680916245452752841925.jpg', 'T', 'N', '0000-00-00', 0, 0),
(165, '2023-04-08', '08:18', 'M', '153', 'A', -9, '', '', '16809167105021120335951754344299.jpg', 'T', 'N', '0000-00-00', 0, 0),
(166, '2023-04-08', '08:21', 'M', '182', 'A', -9, '', '', '16809168639102610029990637579332.jpg', 'T', 'N', '0000-00-00', 0, 0),
(167, '2023-04-08', '08:30', 'M', '151', 'A', -9, '', '', '16809174127661633324515.jpg', 'T', 'N', '0000-00-00', 0, 0),
(168, '2023-04-08', '08:32', 'M', '151', 'A', -9, '', '', '1680917532073752755808.jpg', 'T', 'N', '0000-00-00', 0, 0),
(169, '2023-04-08', '08:33', 'M', '151', 'A', -9, '', '', '1680917620225267858496.jpg', 'T', 'N', '0000-00-00', 0, 0),
(170, '2023-04-08', '08:35', 'M', '148', 'A', -9, '', '', '16809177579978957741838309534094.jpg', 'T', 'N', '0000-00-00', 0, 0),
(171, '2023-04-08', '08:36', 'M', '149', 'A', -9, '', '', '1680917810877354204230.jpg', 'T', 'N', '0000-00-00', 0, 0),
(172, '2023-04-08', '08:37', 'M', '154', 'A', -9, '', '', '16809178328726817947764965998258.jpg', 'T', 'N', '0000-00-00', 0, 0),
(173, '2023-04-08', '08:38', 'M', '154', 'A', -9, '', '', '16809178328726817947764965998258.jpg', 'T', 'N', '0000-00-00', 0, 0),
(174, '2023-04-08', '08:39', 'M', '154', 'A', -9, '', '', '16809179644548655026870347181004.jpg', 'T', 'N', '0000-00-00', 0, 0),
(175, '2023-04-08', '17:04', 'P', '183', 'B', 0, '', '', '16809482724371771444133.jpg', 'T', 'N', '0000-00-00', 0, 0),
(176, '2023-04-08', '17:06', 'P', '149', 'B', 0, '', '', '1680948393605217529950.jpg', 'T', 'N', '0000-00-00', 0, 0),
(177, '2023-04-08', '17:23', 'P', '153', 'B', 0, '', '', 'IMG-20230408-WA0013.jpg', 'T', 'N', '0000-00-00', 0, 0),
(178, '2023-04-08', '17:30', 'P', '182', 'B', 0, '', '', '16809498357185242041657922493557.jpg', 'T', 'N', '0000-00-00', 0, 0),
(179, '2023-04-08', '17:32', 'P', '150', 'B', 0, '', '', '16809499453663269816695153375249.jpg', 'T', 'N', '0000-00-00', 0, 0),
(180, '2023-04-08', '18:28', 'P', '148', 'B', 1, '', '', '16809533376602656660589189186945.jpg', 'T', 'O', '2023-04-14', 0, 0),
(181, '2023-04-08', '18:42', 'P', '154', 'B', 1, '', '', '16809541331416853246070678105720.jpg', 'T', 'O', '2023-04-14', 0, 0),
(182, '2023-04-08', '18:42', 'P', '151', 'B', 1, '', '', '16809541847311633324515.jpg', 'T', 'O', '2023-04-14', 0, 0),
(183, '2023-04-10', '08:01', 'M', '153', 'A', -9, '', '', '16810885035948413035774052587227.jpg', 'T', 'N', '0000-00-00', 0, 0),
(184, '2023-04-10', '08:02', 'M', '183', 'A', -9, '', '', '1681088567646104702991.jpg', 'T', 'N', '0000-00-00', 0, 0),
(185, '2023-04-10', '08:15', 'M', '182', 'A', -9, '', '', '16810893095966857738577184871686.jpg', 'T', 'N', '0000-00-00', 0, 0),
(186, '2023-04-10', '08:22', 'M', '151', 'A', -9, '', '', '1681089732360-493015162.jpg', 'T', 'N', '0000-00-00', 0, 0),
(187, '2023-04-10', '08:29', 'M', '150', 'A', -9, '', '', '16810903453537853351554265137730.jpg', 'T', 'N', '0000-00-00', 0, 0),
(188, '2023-04-10', '08:34', 'M', '149', 'A', -9, '', '', '16810905061181335111112.jpg', 'T', 'N', '0000-00-00', 0, 0),
(189, '2023-04-10', '17:00', 'P', '153', 'B', 0, '', '', '16811208186054867771909916052958.jpg', 'T', 'N', '0000-00-00', 0, 0),
(190, '2023-04-10', '17:00', 'P', '150', 'B', 0, '', '', '1681120838774835696888429340026.jpg', 'T', 'N', '0000-00-00', 0, 0),
(191, '2023-04-10', '17:03', 'P', '183', 'B', 0, '', '', '16811209825791006883051.jpg', 'T', 'N', '0000-00-00', 0, 0),
(192, '2023-04-10', '17:03', 'P', '149', 'B', 0, '', '', '1681120987570592765695.jpg', 'T', 'N', '0000-00-00', 0, 0),
(193, '2023-04-10', '17:03', 'P', '182', 'B', 0, '', '', '16811210277282726371534557684053.jpg', 'T', 'N', '0000-00-00', 0, 0),
(194, '2023-04-10', '17:04', 'P', '154', 'B', 0, '', '', '16811210836944332064091375942425.jpg', 'T', 'N', '0000-00-00', 0, 0),
(195, '2023-04-11', '08:01', 'M', '153', 'A', -9, '', '', '16811748965046430519568952817383.jpg', 'T', 'N', '0000-00-00', 0, 0),
(196, '2023-04-11', '08:05', 'M', '150', 'A', -9, '', '', '16811751191814190440559544271581.jpg', 'T', 'N', '0000-00-00', 0, 0),
(197, '2023-04-11', '08:09', 'M', '183', 'A', -9, '', '', '16811753564431129159411.jpg', 'T', 'N', '0000-00-00', 0, 0),
(198, '2023-04-11', '08:20', 'M', '182', 'A', -9, '', '', '16811760603321610210102869555735.jpg', 'T', 'N', '0000-00-00', 0, 0),
(199, '2023-04-11', '08:30', 'M', '149', 'A', -9, '', '', '16811766459481813601256.jpg', 'T', 'N', '0000-00-00', 0, 0),
(200, '2023-04-11', '08:32', 'M', '154', 'A', -9, '', '', '16811767331351196082043165952640.jpg', 'T', 'N', '0000-00-00', 0, 0),
(201, '2023-04-11', '17:01', 'P', '183', 'B', 0, '', '', '16812072660431468364421.jpg', 'T', 'N', '0000-00-00', 0, 0),
(202, '2023-04-11', '17:02', 'P', '149', 'B', 0, '', '', '1681207343266956804899.jpg', 'T', 'N', '0000-00-00', 0, 0),
(203, '2023-04-11', '17:02', 'P', '150', 'B', 0, '', '', '16812073326389153088604079153205.jpg', 'T', 'N', '0000-00-00', 0, 0),
(204, '2023-04-11', '17:03', 'P', '182', 'B', 0, '', '', '16812074230752702789530794153606.jpg', 'T', 'N', '0000-00-00', 0, 0),
(205, '2023-04-11', '18:11', 'P', '153', 'B', 1, '', '', '16812114862243605547789553964449.jpg', 'T', 'O', '2023-04-14', 0, 0),
(206, '2023-04-11', '18:12', 'P', '154', 'B', 1, '', '', '16812115520543579911101435060271.jpg', 'T', 'O', '2023-04-14', 0, 0),
(207, '2023-04-11', '19:45', 'P', '148', 'B', 2, '', '', '16812171118804714721509743273403.jpg', 'T', 'O', '2023-04-14', 0, 0),
(208, '2023-04-12', '08:12', 'M', '183', 'A', -9, '', '', '1681261960138926260244.jpg', 'T', 'N', '0000-00-00', 0, 0),
(209, '2023-04-12', '08:14', 'M', '153', 'A', -9, '', '', '16812620711606571263960694958411.jpg', 'T', 'N', '0000-00-00', 0, 0),
(210, '2023-04-12', '08:21', 'M', '182', 'A', -9, '', '', '1681262505681577869165882180952.jpg', 'T', 'N', '0000-00-00', 0, 0),
(211, '2023-04-12', '08:29', 'M', '150', 'A', -9, '', '', '16812630043211355687191134918732.jpg', 'T', 'N', '0000-00-00', 0, 0),
(212, '2023-04-12', '08:31', 'M', '154', 'A', -9, '', '', '16812630989213826197571462097885.jpg', 'T', 'N', '0000-00-00', 0, 0),
(213, '2023-04-12', '08:34', 'M', '149', 'A', -9, '', '', '16812632483151720529566.jpg', 'T', 'N', '0000-00-00', 0, 0),
(214, '2023-04-12', '08:37', 'M', '151', 'A', -9, '', '', '1681263437650-1382028202.jpg', 'T', 'N', '0000-00-00', 0, 0),
(215, '2023-04-12', '08:37', 'M', '151', 'A', -9, '', '', '1681263534731965608833.jpg', 'T', 'N', '0000-00-00', 0, 0),
(216, '2023-04-12', '17:00', 'P', '151', 'B', 0, '', '', '1681293615418-493015162.jpg', 'T', 'N', '0000-00-00', 0, 0),
(217, '2023-04-12', '17:00', 'P', '150', 'B', 0, '', '', '16812936237541361929381284950738.jpg', 'T', 'N', '0000-00-00', 0, 0),
(218, '2023-04-12', '17:00', 'P', '153', 'B', 0, '', '', '1681293617304928166221160920388.jpg', 'T', 'N', '0000-00-00', 0, 0),
(219, '2023-04-12', '17:00', 'P', '149', 'B', 0, '', '', '1681293640146323120022.jpg', 'T', 'N', '0000-00-00', 0, 0),
(220, '2023-04-12', '16:59', 'P', '183', 'B', -1, '', '', '16812936508511577171087.jpg', 'T', 'N', '0000-00-00', 0, 0),
(221, '2023-04-12', '17:00', 'P', '148', 'B', 0, '', '', '16812936560411708357732488544346.jpg', 'T', 'N', '0000-00-00', 0, 0),
(222, '2023-04-12', '17:01', 'P', '154', 'B', 0, '', '', '16812936729796726863222594218332.jpg', 'T', 'N', '0000-00-00', 0, 0),
(223, '2023-04-12', '17:10', 'P', '182', 'B', 0, '', '', '16812943005616919741028626364895.jpg', 'T', 'N', '0000-00-00', 0, 0),
(224, '2023-04-13', '08:05', 'M', '150', 'A', -9, '', '', '16813479313119112911740854287217.jpg', 'T', 'N', '0000-00-00', 0, 0),
(225, '2023-04-13', '08:05', 'M', '153', 'A', -9, '', '', '16813479620293659011160158458079.jpg', 'T', 'N', '0000-00-00', 0, 0),
(226, '2023-04-13', '08:14', 'M', '183', 'A', -9, '', '', '16813484795371017484673.jpg', 'T', 'N', '0000-00-00', 0, 0),
(227, '2023-04-13', '08:24', 'M', '148', 'A', -9, '', '', '16813490642265878166044248443529.jpg', 'T', 'N', '0000-00-00', 0, 0),
(228, '2023-04-13', '08:27', 'M', '182', 'A', -9, '', '', '16813492706287708240469482346855.jpg', 'T', 'N', '0000-00-00', 0, 0),
(229, '2023-04-13', '08:47', 'P', '149', 'B', -9, '', '', '16813504849451197022451.jpg', 'T', 'N', '0000-00-00', 0, 0),
(230, '2023-04-13', '16:59', 'P', '150', 'B', -1, '', '', '16813799515752421980550368040298.jpg', 'T', 'N', '0000-00-00', 0, 0),
(231, '2023-04-13', '16:58', 'P', '149', 'B', -1, '', '', '16813800028281116931504.jpg', 'T', 'N', '0000-00-00', 0, 0),
(232, '2023-04-13', '17:00', 'P', '153', 'B', 0, '', '', '16813800276717832048340804340224.jpg', 'T', 'N', '0000-00-00', 0, 0),
(233, '2023-04-13', '17:01', 'P', '183', 'B', 0, '', '', '16813800905781341145430.jpg', 'T', 'N', '0000-00-00', 0, 0),
(234, '2023-04-13', '17:01', 'P', '182', 'B', 0, '', '', '16813800856851521971349003700966.jpg', 'T', 'N', '0000-00-00', 0, 0),
(235, '2023-04-13', '17:00', 'P', '148', 'B', 0, '', '', '16813800443211504142153697480440.jpg', 'T', 'N', '0000-00-00', 0, 0),
(236, '2023-04-13', '17:04', 'P', '154', 'B', 0, '', '', '16813802432561000184103799204148.jpg', 'T', 'N', '0000-00-00', 0, 0),
(237, '2023-04-14', '07:40', 'M', '150', 'A', -10, '', '', '16814328521294235759070020140483.jpg', 'T', 'N', '0000-00-00', 0, 0),
(238, '2023-04-14', '07:44', 'M', '153', 'A', -10, '', '', '16814330788403530734765815184672.jpg', 'T', 'N', '0000-00-00', 0, 0),
(239, '2023-04-14', '08:06', 'M', '183', 'A', -9, '', '', '16814344714941629614082.jpg', 'T', 'N', '0000-00-00', 0, 0),
(240, '2023-04-14', '08:14', 'M', '151', 'A', -9, '', '', 'IMG_20230413_141105_436.jpg', 'T', 'N', '0000-00-00', 0, 0),
(241, '2023-04-14', '08:20', 'M', '182', 'A', -9, '', '', '16814352623964322489066812431048.jpg', 'T', 'N', '0000-00-00', 0, 0),
(242, '2023-04-14', '08:28', 'M', '154', 'A', -9, '', '', '16814357074233173315687164962638.jpg', 'T', 'N', '0000-00-00', 0, 0),
(243, '2023-04-14', '08:31', 'M', '149', 'A', -9, '', '', '1681435874153945790868.jpg', 'T', 'N', '0000-00-00', 0, 0),
(244, '2023-04-14', '08:32', 'M', '148', 'A', -9, '', '', '16814359658411620721233335679851.jpg', 'T', 'N', '0000-00-00', 0, 0),
(245, '2023-04-14', '17:01', 'P', '153', 'B', 0, '', '', '16814664951076423993827113174343.jpg', 'T', 'N', '0000-00-00', 0, 0),
(246, '2023-04-14', '17:01', 'P', '151', 'B', 0, '', '', 'IMG_20230413_141105_436.jpg', 'T', 'N', '0000-00-00', 0, 0),
(247, '2023-04-14', '17:04', 'P', '149', 'B', 0, '', '', '1681466663220136824797.jpg', 'T', 'N', '0000-00-00', 0, 0),
(248, '2023-04-14', '17:12', 'P', '150', 'B', 0, '', '', '16814671408266459643985659512099.jpg', 'T', 'N', '0000-00-00', 0, 0),
(249, '2023-04-14', '17:27', 'P', '148', 'B', 0, '', '', '16814680751943215755591564465903.jpg', 'T', 'N', '0000-00-00', 0, 0),
(250, '2023-04-14', '17:42', 'P', '182', 'B', 0, '', '', '16814689321723789164340749350030.jpg', 'T', 'N', '0000-00-00', 0, 0),
(251, '2023-04-14', '19:59', 'P', '154', 'B', 2, '', '', '16814771978442885668922476129908.jpg', 'T', 'O', '2023-04-14', 0, 0),
(252, '2023-04-14', '20:00', 'P', '183', 'B', 3, '', '', '1681477241520625371816.jpg', 'T', 'O', '2023-04-14', 0, 0),
(253, '2023-04-15', '07:45', 'M', '153', 'A', -10, '', '', '16815195157887278821194780740305.jpg', 'T', 'N', '0000-00-00', 0, 0),
(254, '2023-04-15', '08:12', 'M', '183', 'A', -9, '', '', '1681521162987719898443.jpg', 'T', 'N', '0000-00-00', 0, 0),
(255, '2023-04-15', '08:13', 'M', '150', 'A', -9, '', '', '16815212206984485833838746670087.jpg', 'T', 'N', '0000-00-00', 0, 0),
(256, '2023-04-15', '08:32', 'M', '182', 'A', -9, '', '', '1681522345670888152443466662792.jpg', 'T', 'N', '0000-00-00', 0, 0),
(257, '2023-04-15', '08:36', 'M', '149', 'A', -9, '', '', '1681522615486885453009.jpg', 'T', 'N', '0000-00-00', 0, 0),
(258, '2023-04-15', '08:39', 'M', '154', 'A', -9, '', '', '16815227644584764444995770128952.jpg', 'T', 'N', '0000-00-00', 0, 0),
(259, '2023-04-15', '17:53', 'P', '150', 'B', 0, '', '', '16815560484705484517559658173775.jpg', 'T', 'N', '0000-00-00', 0, 0),
(260, '2023-04-15', '17:54', 'P', '153', 'B', 0, '', '', '16815560950077069248104027785008.jpg', 'T', 'N', '0000-00-00', 0, 0),
(261, '2023-04-15', '18:51', 'P', '182', 'B', 1, '', '', '16815594805324000000618543770134.jpg', 'T', 'O', '2023-04-15', 0, 0),
(262, '2023-04-15', '19:16', 'P', '149', 'B', 2, '', '', '1681561012640251418992.jpg', 'T', 'O', '2023-04-15', 0, 0),
(263, '2023-04-15', '19:26', 'P', '151', 'B', 2, '', '', '1681561592504-1382028202.jpg', 'T', 'O', '2023-04-17', 0, 0),
(264, '2023-04-15', '19:38', 'P', '183', 'B', 2, '', '', '16815623347711444377067.jpg', 'T', 'O', '2023-04-15', 0, 0),
(265, '2023-04-15', '20:08', 'P', '154', 'B', 3, '', '', '16815641337404745987522354374169.jpg', 'T', 'O', '2023-04-15', 0, 0),
(266, '2023-04-17', '07:59', 'M', '153', 'A', -10, '', '', '16816931820342861135778333374421.jpg', 'T', 'N', '0000-00-00', 0, 0),
(267, '2023-04-17', '08:14', 'M', '183', 'A', -9, '', '', '16816940949681904420323.jpg', 'T', 'N', '0000-00-00', 0, 0),
(268, '2023-04-17', '08:20', 'M', '151', 'A', -9, '', '', '1681694456747-2141285780.jpg', 'T', 'N', '0000-00-00', 0, 0),
(269, '2023-04-17', '08:22', 'M', '148', 'A', -9, '', '', '16816945402647652038674844915970.jpg', 'T', 'N', '0000-00-00', 0, 0),
(270, '2023-04-17', '08:32', 'M', '182', 'A', -9, '', '', '16816951382633891180090167240082.jpg', 'T', 'N', '0000-00-00', 0, 0),
(271, '2023-04-17', '08:33', 'M', '154', 'A', -9, '', '', '16816952417183835890254706337067.jpg', 'T', 'N', '0000-00-00', 0, 0),
(272, '2023-04-17', '08:37', 'M', '149', 'A', -9, '', '', '168169545000274749474.jpg', 'T', 'N', '0000-00-00', 0, 0),
(273, '2023-04-17', '08:54', 'P', '150', 'B', -9, '', '', '1681696503146270345004741147509.jpg', 'T', 'N', '0000-00-00', 0, 0),
(274, '2023-04-17', '17:01', 'P', '183', 'B', 0, '', '', '168172568057244594543.jpg', 'T', 'N', '0000-00-00', 0, 0),
(275, '2023-04-17', '17:05', 'P', '182', 'B', 0, '', '', '16817259502878626032184541213517.jpg', 'T', 'N', '0000-00-00', 0, 0),
(276, '2023-04-17', '17:06', 'P', '153', 'B', 0, '', '', '16817259687787112645551883216845.jpg', 'T', 'N', '0000-00-00', 0, 0),
(277, '2023-04-17', '17:14', 'P', '154', 'B', 0, '', '', '16817264696205810891794321818089.jpg', 'T', 'N', '0000-00-00', 0, 0),
(278, '2023-04-17', '17:18', 'P', '149', 'B', 0, '', '', '1681726740706929292140.jpg', 'T', 'N', '0000-00-00', 0, 0),
(279, '2023-04-17', '17:50', 'P', '148', 'B', 0, '', '', '16817286261096841553544183731286.jpg', 'T', 'N', '0000-00-00', 0, 0),
(280, '2023-04-17', '17:50', 'P', '150', 'B', 0, '', '', '16817286450832854938283441414133.jpg', 'T', 'N', '0000-00-00', 0, 0),
(281, '2023-04-17', '17:58', 'P', '151', 'B', 0, '', '', '1681729134232-2141285780.jpg', 'T', 'N', '0000-00-00', 0, 0),
(282, '2023-04-18', '07:56', 'M', '150', 'A', -10, '', '', '16817793883788096738828933017219.jpg', 'T', 'N', '0000-00-00', 0, 0),
(283, '2023-04-18', '08:00', 'M', '153', 'A', -9, '', '', '16817796286556504709991849718210.jpg', 'T', 'N', '0000-00-00', 0, 0),
(284, '2023-04-18', '08:14', 'M', '183', 'A', -9, '', '', '16817804713851827503547.jpg', 'T', 'N', '0000-00-00', 0, 0),
(285, '2023-04-18', '08:18', 'M', '149', 'A', -9, '', '', '16817807213081378121700.jpg', 'T', 'N', '0000-00-00', 0, 0),
(286, '2023-04-18', '08:19', 'M', '182', 'A', -9, '', '', '16817807732563836545966553381665.jpg', 'T', 'N', '0000-00-00', 0, 0),
(287, '2023-04-18', '08:19', 'M', '148', 'A', -9, '', '', '168178077090359325945771579375.jpg', 'T', 'N', '0000-00-00', 0, 0),
(288, '2023-04-18', '08:24', 'M', '151', 'A', -9, '', '', '1681781094437-1600499502.jpg', 'T', 'N', '0000-00-00', 0, 0),
(289, '2023-04-18', '08:30', 'M', '154', 'A', -9, '', '', '16817814511963165618940054596843.jpg', 'T', 'N', '0000-00-00', 0, 0),
(290, '2023-04-18', '16:58', 'P', '151', 'B', -1, '', '', '16818118885301332319640.jpg', 'T', 'N', '0000-00-00', 0, 0),
(291, '2023-04-18', '17:00', 'P', '149', 'B', 0, '', '', '1681812016266112051998.jpg', 'T', 'N', '0000-00-00', 0, 0),
(292, '2023-04-18', '17:00', 'P', '148', 'B', 0, '', '', '16818120413193568754659810665003.jpg', 'T', 'N', '0000-00-00', 0, 0),
(293, '2023-04-18', '17:03', 'P', '182', 'B', 0, '', '', '16818122282695641978023571083694.jpg', 'T', 'N', '0000-00-00', 0, 0),
(294, '2023-04-18', '17:06', 'P', '153', 'B', 0, '', '', 'IMG-20230418-WA0018.jpg', 'T', 'N', '0000-00-00', 0, 0),
(295, '2023-04-18', '17:06', 'P', '150', 'B', 0, '', '', '16818123912113207812373975076440.jpg', 'T', 'N', '0000-00-00', 0, 0),
(296, '2023-04-18', '18:06', 'P', '183', 'B', 1, '', '', '16818160402241545375748.jpg', 'T', 'O', '2023-04-18', 0, 0),
(297, '2023-04-18', '18:08', 'P', '154', 'B', 1, '', '', '16818162190592643295853704408074.jpg', 'T', 'O', '2023-04-18', 0, 0),
(298, '2023-04-19', '08:07', 'M', '153', 'A', -9, '', '', '16818664742901397126547018726256.jpg', 'T', 'N', '0000-00-00', 0, 0),
(299, '2023-04-19', '08:23', 'M', '183', 'A', -9, '', '', '16818675975801851646561.jpg', 'T', 'N', '0000-00-00', 0, 0),
(300, '2023-04-19', '08:28', 'M', '182', 'A', -9, '', '', '16818677335406085536991003858787.jpg', 'T', 'N', '0000-00-00', 0, 0),
(301, '2023-04-19', '08:33', 'M', '148', 'A', -9, '', '', '16818680327866492622552457992723.jpg', 'T', 'N', '0000-00-00', 0, 0),
(302, '2023-04-19', '08:39', 'M', '154', 'A', -9, '', '', '16818683509918339968898360272990.jpg', 'T', 'N', '0000-00-00', 0, 0),
(303, '2023-04-19', '08:40', 'M', '151', 'A', -9, '', '', 'IMG_20230413_141105_436.jpg', 'T', 'N', '0000-00-00', 0, 0),
(304, '2023-04-19', '08:41', 'P', '149', 'B', -9, '', '', '1681868494446381791491.jpg', 'T', 'N', '0000-00-00', 0, 0),
(305, '2023-04-19', '08:40', 'M', '150', 'A', -9, '', '', '16818685909012166419743523730773.jpg', 'T', 'N', '0000-00-00', 0, 0),
(306, '2023-04-19', '16:54', 'P', '148', 'B', -1, '', '', '16818980980688693856120172822206.jpg', 'T', 'N', '0000-00-00', 0, 0),
(307, '2023-04-19', '16:59', 'P', '149', 'B', -1, '', '', '1681898407059616350877.jpg', 'T', 'N', '0000-00-00', 0, 0),
(308, '2023-04-19', '17:05', 'P', '182', 'B', 0, '', '', '16818987124843753634283908884145.jpg', 'T', 'N', '0000-00-00', 0, 0),
(309, '2023-04-19', '17:08', 'P', '154', 'B', 0, '', '', '16818989388622822168501394730340.jpg', 'T', 'N', '0000-00-00', 0, 0),
(310, '2023-04-19', '17:37', 'P', '153', 'B', 0, '', '', 'IMG20230419165230.jpg', 'T', 'N', '0000-00-00', 0, 0),
(311, '2023-04-20', '08:09', 'M', '153', 'A', -9, '', '', '16819529718703320817679459923611.jpg', 'T', 'N', '0000-00-00', 0, 0),
(312, '2023-04-20', '08:27', 'M', '149', 'A', -9, '', '', '1681954058404753043084.jpg', 'T', 'N', '0000-00-00', 0, 0),
(313, '2023-04-20', '08:28', 'M', '151', 'A', -9, '', '', '1681954121448-1088485713.jpg', 'T', 'N', '0000-00-00', 0, 0),
(314, '2023-04-20', '08:29', 'M', '183', 'A', -9, '', '', '16819541462311375322043.jpg', 'T', 'N', '0000-00-00', 0, 0),
(315, '2023-04-20', '08:29', 'M', '182', 'A', -9, '', '', '1681954148948458469482841079016.jpg', 'T', 'N', '0000-00-00', 0, 0),
(316, '2023-04-20', '08:32', 'M', '154', 'A', -9, '', '', '16819543514993646009895436012313.jpg', 'T', 'N', '0000-00-00', 0, 0),
(317, '2023-04-20', '08:35', 'M', '148', 'A', -9, '', '', '1681954522108527081824876143647.jpg', 'T', 'N', '0000-00-00', 0, 0),
(318, '2023-04-20', '14:54', 'P', '148', 'B', -3, '', '', '1681977272564355149098346914022.jpg', 'T', 'N', '0000-00-00', 0, 0),
(319, '2023-04-20', '17:01', 'P', '183', 'B', 0, '', '', 'IMG20230420160204.jpg', 'T', 'N', '0000-00-00', 0, 0),
(320, '2023-04-20', '17:04', 'P', '182', 'B', 0, '', '', '16819850824386051177219928163475.jpg', 'T', 'N', '0000-00-00', 0, 0),
(321, '2023-04-20', '17:09', 'P', '153', 'B', 0, '', '', 'IMG20230420161036.jpg', 'T', 'N', '0000-00-00', 0, 0),
(322, '2023-04-27', '08:05', 'M', '153', 'A', -9, '', '', '16825575151147110212989407136266.jpg', 'T', 'N', '0000-00-00', 0, 0),
(323, '2023-04-27', '08:16', 'M', '148', 'A', -9, '', '', '168255824682021216753660840994.jpg', 'T', 'N', '0000-00-00', 0, 0),
(324, '2023-04-27', '08:22', 'M', '183', 'A', -9, '', '', '16825585458091826386981.jpg', 'T', 'N', '0000-00-00', 0, 0),
(325, '2023-04-27', '08:23', 'M', '182', 'A', -9, '', '', '16825586272434387890560869420351.jpg', 'T', 'N', '0000-00-00', 0, 0),
(326, '2023-04-27', '08:27', 'M', '149', 'A', -9, '', '', '1682558857444475803319.jpg', 'T', 'N', '0000-00-00', 0, 0),
(327, '2023-04-27', '17:01', 'P', '153', 'B', 0, '', '', '1682589675766227417775898857967.jpg', 'T', 'N', '0000-00-00', 0, 0),
(328, '2023-04-27', '17:01', 'P', '183', 'B', 0, '', '', 'IMG20230427165851.jpg', 'T', 'N', '0000-00-00', 0, 0),
(329, '2023-04-27', '17:01', 'P', '149', 'B', 0, '', '', '16825896940421267081230.jpg', 'T', 'N', '0000-00-00', 0, 0),
(330, '2023-04-27', '17:13', 'P', '154', 'B', 0, '', '', '16825904186594371969036290678101.jpg', 'T', 'N', '0000-00-00', 0, 0),
(331, '2023-04-27', '17:16', 'P', '182', 'B', 0, '', '', '16825906268962896980417139131079.jpg', 'T', 'N', '0000-00-00', 0, 0),
(332, '2023-04-27', '19:06', 'P', '148', 'B', 2, '', '', '16825972278945883089520640184125.jpg', 'T', 'O', '2023-04-28', 0, 0),
(333, '2023-04-28', '08:08', 'M', '153', 'A', -9, '', '', '16826441380352297879043373696618.jpg', 'T', 'N', '0000-00-00', 0, 0),
(334, '2023-04-28', '08:19', 'M', '204', 'A', -9, '', '', '16826447470302538240157296123292.jpg', 'T', 'N', '0000-00-00', 0, 0),
(335, '2023-04-28', '08:24', 'M', '183', 'A', -9, '', '', '16826450775951377061865.jpg', 'T', 'N', '0000-00-00', 0, 0),
(336, '2023-04-28', '08:30', 'M', '148', 'A', -9, '', '', '16826454088492345522613987127635.jpg', 'T', 'N', '0000-00-00', 0, 0),
(337, '2023-04-28', '08:31', 'M', '149', 'A', -9, '', '', '16826455156051994898585.jpg', 'T', 'N', '0000-00-00', 0, 0),
(338, '2023-04-28', '08:37', 'M', '154', 'A', -9, '', '', 'IMG-20230428-WA0010.jpg', 'T', 'N', '0000-00-00', 0, 0),
(339, '2023-04-28', '17:01', 'P', '148', 'B', 0, '', '', '16826761019415993354243168359701.jpg', 'T', 'N', '0000-00-00', 0, 0),
(340, '2023-04-28', '17:06', 'P', '153', 'B', 0, '', '', '16826763896281488967937051006528.jpg', 'T', 'N', '0000-00-00', 0, 0),
(341, '2023-04-28', '17:18', 'P', '182', 'B', 0, '', '', '16826771452397792102566348578248.jpg', 'T', 'N', '0000-00-00', 0, 0),
(342, '2023-04-28', '20:03', 'P', '183', 'B', 3, '', '', '1682687029729178049923.jpg', 'T', 'O', '2023-04-29', 0, 0),
(343, '2023-04-28', '20:04', 'P', '154', 'B', 3, '', '', '16826871049007835900772016713178.jpg', 'T', 'O', '2023-04-29', 0, 0),
(344, '2023-04-28', '20:04', 'P', '154', 'B', 3, '', '', '16826871049007835900772016713178.jpg', 'T', 'T', '2023-05-04', 0, 0),
(345, '2023-04-28', '20:06', 'P', '149', 'B', 3, '', '', '16826871891651615483683.jpg', 'T', 'O', '2023-05-05', 0, 0),
(346, '2023-04-29', '08:08', 'M', '183', 'A', -9, '', '', '16827304999161013228215.jpg', 'T', 'N', '0000-00-00', 0, 0),
(347, '2023-04-29', '08:14', 'M', '153', 'A', -9, '', '', '16827308713977291135499335008992.jpg', 'T', 'N', '0000-00-00', 0, 0),
(348, '2023-04-29', '08:21', 'M', '148', 'A', -9, '', '', '16827314322348601490748557098452.jpg', 'T', 'N', '0000-00-00', 0, 0),
(349, '2023-04-29', '08:32', 'M', '182', 'A', -9, '', '', '16827319471458717521982131106211.jpg', 'T', 'N', '0000-00-00', 0, 0),
(350, '2023-04-29', '08:39', 'M', '154', 'A', -9, '', '', '1682732394024558547867645078476.jpg', 'T', 'N', '0000-00-00', 0, 0),
(351, '2023-04-29', '08:44', 'M', '149', 'B', -9, '', '', '16827326459262005682161.jpg', 'T', 'N', '0000-00-00', 0, 0),
(352, '2023-04-29', '17:02', 'P', '183', 'B', 0, '', '', '1682762527065582179733.jpg', 'T', 'P', '0000-00-00', 0, 0),
(353, '2023-04-29', '17:57', 'P', '154', 'B', 0, '', '', '16827658474701370225036276548136.jpg', 'T', 'N', '0000-00-00', 0, 0),
(354, '2023-04-29', '18:56', 'P', '182', 'B', 1, '', '', '16827694074887129837085814317235.jpg', 'T', 'O', '2023-05-02', 0, 0),
(355, '2023-04-29', '19:08', 'P', '148', 'B', 2, '', '', '16827701238491571908228343420722.jpg', 'T', 'O', '2023-05-04', 0, 0),
(356, '2023-04-29', '20:13', 'P', '153', 'B', 3, '', '', '16827740285397438588551498833999.jpg', 'T', 'O', '2023-05-02', 0, 0),
(357, '2023-04-30', '08:18', 'M', '153', 'A', -9, '', '', '16828174935994102738260094756070.jpg', 'T', 'N', '0000-00-00', 0, 0),
(358, '2023-04-30', '08:37', 'M', '149', 'A', -9, '', '', '1682818687221452928743.jpg', 'T', 'N', '0000-00-00', 0, 0),
(359, '2023-04-30', '17:00', 'P', '153', 'B', 0, '', '', 'IMG20230430154313.jpg', 'T', 'N', '0000-00-00', 0, 0),
(360, '2023-04-30', '17:32', 'P', '149', 'B', 0, '', '', '16828507299961294520644.jpg', 'T', 'N', '0000-00-00', 0, 0),
(361, '2023-05-02', '07:52', 'M', '153', 'A', -10, '', '', '16829887641987507062340578855229.jpg', 'T', 'N', '0000-00-00', 0, 0),
(362, '2023-05-02', '08:13', 'M', '183', 'A', -9, '', '', '16829900387151779863657.jpg', 'T', 'N', '0000-00-00', 0, 0),
(363, '2023-05-02', '08:32', 'M', '148', 'A', -9, '', '', '16829911759765936250790288336446.jpg', 'T', 'N', '0000-00-00', 0, 0),
(364, '2023-05-02', '08:38', 'M', '154', 'A', -9, '', '', '16829915333843247582526889745088.jpg', 'T', 'N', '0000-00-00', 0, 0),
(365, '2023-05-02', '08:45', 'M', '149', 'B', -9, '', '', '1682991912169390102599.jpg', 'T', 'N', '0000-00-00', 0, 0),
(366, '2023-05-02', '09:49', 'M', '151', 'B', -8, '', '', '1682995823501-1446102752.jpg', 'T', 'N', '0000-00-00', 0, 0),
(367, '2023-05-02', '13:51', 'M', '192', 'B', -4, '', '', 'WhatsApp Image 2023-04-03 at 06.23.33 (1).jpeg', 'T', 'N', '0000-00-00', 0, 0),
(368, '2023-05-02', '17:00', 'P', '153', 'B', 0, '', '', '16830216225714858559369299878528.jpg', 'T', 'N', '0000-00-00', 0, 0),
(369, '2023-05-02', '17:01', 'P', '183', 'B', 0, '', '', '168302167285483435231.jpg', 'T', 'N', '0000-00-00', 0, 0),
(371, '2023-05-02', '08:02', 'M', '150', 'B', 0, '', '', '16830217403558807553342762647943.jpg', 'T', 'N', '0000-00-00', 0, 0),
(372, '2023-05-02', '17:02', 'P', '150', 'B', 0, '', '', '16830217403558807553342762647943.jpg', 'T', 'N', '0000-00-00', 0, 0),
(373, '2023-05-02', '17:01', 'P', '149', 'B', 0, '', '', '1683021767140285423137.jpg', 'T', 'N', '0000-00-00', 0, 0),
(374, '2023-05-02', '17:04', 'P', '154', 'B', 0, '', '', '16830218755976748690012543114046.jpg', 'T', 'N', '0000-00-00', 0, 0),
(375, '2023-05-02', '17:09', 'P', '148', 'B', 0, '', '', '16830221599153893162644222099762.jpg', 'T', 'N', '0000-00-00', 0, 0),
(376, '2023-05-02', '17:11', 'P', '204', 'B', 0, '', '', '16830222815297790398753631328557.jpg', 'T', 'N', '0000-00-00', 0, 0),
(377, '2023-05-03', '07:49', 'M', '153', 'A', -10, '', '', '16830749914704483557464244032854.jpg', 'T', 'N', '0000-00-00', 0, 0),
(378, '2023-05-03', '08:02', 'M', '150', 'A', -9, '', '', '16830757499661532981364776337345.jpg', 'T', 'N', '0000-00-00', 0, 0),
(379, '2023-05-03', '08:32', 'M', '149', 'A', -9, '', '', '16830775418891907521213.jpg', 'T', 'N', '0000-00-00', 0, 0),
(380, '2023-05-03', '08:33', 'M', '204', 'A', -9, '', '', '1683077638898958955266138286709.jpg', 'T', 'N', '0000-00-00', 0, 0),
(381, '2023-05-03', '08:33', 'M', '183', 'A', -9, '', '', '168307774819299788258.jpg', 'T', 'N', '0000-00-00', 0, 0),
(382, '2023-05-03', '08:36', 'M', '148', 'A', -9, '', '', '1683077796362466946012539175984.jpg', 'T', 'N', '0000-00-00', 0, 0),
(383, '2023-05-03', '08:38', 'M', '154', 'A', -9, '', '', '16830779180687223990295060156976.jpg', 'T', 'N', '0000-00-00', 0, 0),
(384, '2023-04-29', '08:44', 'M', '150', 'B', -9, '', '', '16827326459262005682161.jpg', 'T', 'N', '0000-00-00', 0, 0),
(385, '2023-05-03', '08:02', 'M', '151', 'A', -9, '', '', '16830757499661532981364776337345.jpg', 'T', 'N', '0000-00-00', 0, 0),
(386, '2023-05-03', '17:12', 'P', '148', 'B', 0, '', '', '16831087640451061131122086159009.jpg', 'T', 'N', '0000-00-00', 0, 0),
(387, '2023-05-03', '17:27', 'P', '150', 'B', 0, '', '', '16831096575022932930433345005225.jpg', 'T', 'N', '0000-00-00', 0, 0),
(388, '2023-05-03', '17:44', 'P', '149', 'B', 0, '', '', '1683110654409551399393.jpg', 'T', 'N', '0000-00-00', 0, 0),
(389, '2023-05-03', '18:03', 'P', '183', 'B', 1, '', '', '16831117853261422420395.jpg', 'T', 'T', '2023-05-04', 0, 0),
(390, '2023-05-03', '18:04', 'P', '154', 'B', 1, '', '', '16831118480098944814305246732414.jpg', 'T', 'T', '2023-05-04', 0, 0),
(391, '2023-05-03', '18:09', 'P', '204', 'B', 1, '', '', '1683112170872733741466259114260.jpg', 'T', 'T', '2023-05-04', 0, 0),
(392, '2023-05-03', '18:14', 'P', '153', 'B', 1, '', '', '16831124475803653660554392839205.jpg', 'T', 'T', '2023-05-04', 0, 0),
(393, '2023-05-04', '08:18', 'M', '183', 'A', -9, '', '', '16831631018341037692909.jpg', 'T', 'N', '0000-00-00', 0, 0),
(394, '2023-05-04', '08:18', 'M', '150', 'A', -9, '', '', '16831631276468924783537686744338.jpg', 'T', 'N', '0000-00-00', 0, 0),
(395, '2023-05-04', '08:22', 'M', '153', 'A', -9, '', '', '16831633955101859371330994238945.jpg', 'T', 'N', '0000-00-00', 0, 0),
(396, '2023-05-04', '08:29', 'M', '151', 'A', -9, '', '', '1683163793812492535837.jpg', 'T', 'N', '0000-00-00', 0, 0),
(397, '2023-05-04', '08:38', 'M', '204', 'A', -9, '', '', '16831643287591203745681196897652.jpg', 'T', 'N', '0000-00-00', 0, 0),
(398, '2023-05-04', '16:54', 'P', '150', 'B', -1, '', '', '16831941290606212080569913280486.jpg', 'T', 'N', '0000-00-00', 0, 0),
(399, '2023-05-04', '16:55', 'P', '148', 'B', -1, '', '', '16831941334372098009027415536848.jpg', 'T', 'N', '0000-00-00', 0, 0),
(400, '2023-05-04', '17:00', 'P', '153', 'B', 0, '', '', '16831944268638366564147881182387.jpg', 'T', 'N', '0000-00-00', 0, 0),
(401, '2023-05-04', '16:59', 'P', '183', 'B', -1, '', '', 'IMG20230504165526.jpg', 'T', 'N', '0000-00-00', 0, 0),
(402, '2023-05-04', '17:23', 'P', '204', 'B', 0, '', '', '16831958224528493079337827293063.jpg', 'T', 'N', '0000-00-00', 0, 0),
(403, '2023-05-04', '17:32', 'P', '149', 'B', 0, '', '', '16831963480361843024774.jpg', 'T', 'N', '0000-00-00', 0, 0),
(404, '2023-05-04', '19:32', 'P', '154', 'B', 2, '', '', '16832035613862556720984784113583.jpg', 'T', 'T', '2023-05-06', 0, 0),
(405, '2023-05-04', '19:35', 'P', '151', 'B', 2, '', '', '16832037136641312877966.jpg', 'T', 'T', '2023-05-05', 0, 0),
(406, '2023-05-05', '06:56', 'M', '151', 'A', -11, '', '', '16832446099751912349639.jpg', 'T', 'N', '0000-00-00', 0, 0),
(407, '2023-05-05', '07:44', 'M', '153', 'A', -10, '', '', '16832474566282431263696959335581.jpg', 'T', 'N', '0000-00-00', 0, 0),
(408, '2023-05-05', '08:06', 'M', '150', 'A', -9, '', '', '16832488202414887606238471291204.jpg', 'T', 'N', '0000-00-00', 0, 0),
(409, '2023-05-05', '08:11', 'M', '148', 'A', -9, '', '', '16832490673813096328081329855459.jpg', 'T', 'N', '0000-00-00', 0, 0),
(410, '2023-05-05', '08:13', 'M', '149', 'A', -9, '', '', '1683249221351481702244.jpg', 'T', 'N', '0000-00-00', 0, 0),
(411, '2023-05-05', '08:27', 'M', '204', 'A', -9, '', '', '16832500239154009324725708326929.jpg', 'T', 'N', '0000-00-00', 0, 0),
(412, '2023-05-05', '08:47', 'M', '183', 'A', -9, '', '', '16832512696371329617760.jpg', 'T', 'N', '0000-00-00', 0, 0),
(413, '2023-05-05', '16:59', 'P', '150', 'B', -1, '', '', '16832807873686138715216056491283.jpg', 'T', 'N', '0000-00-00', 0, 0),
(414, '2023-05-05', '16:58', 'P', '153', 'B', -1, '', '', '1683280747801619193877228791697.jpg', 'T', 'N', '0000-00-00', 0, 0),
(415, '2023-05-05', '16:59', 'P', '183', 'B', -1, '', '', 'IMG20230505165534.jpg', 'T', 'N', '0000-00-00', 0, 0),
(416, '2023-05-05', '17:02', 'P', '204', 'B', 0, '', '', '16832809794672993533984172154492.jpg', 'T', 'N', '0000-00-00', 0, 0),
(417, '2023-05-05', '18:16', 'P', '151', 'B', 1, '', '', '1683285372813-1496870128.jpg', 'T', 'T', '2023-05-06', 0, 0),
(418, '2023-05-05', '18:42', 'P', '148', 'B', 1, '', '', '16832869716531145757806871153278.jpg', 'T', 'O', '2023-05-06', 0, 0),
(419, '2023-05-05', '19:25', 'P', '149', 'B', 2, '', '', 'IMG_20230505_164027.jpg', 'T', 'O', '2023-05-06', 0, 0),
(420, '2023-05-06', '08:04', 'M', '183', 'A', -9, '', '', '16833350509211517465806.jpg', 'T', 'N', '0000-00-00', 0, 0),
(421, '2023-05-06', '08:18', 'M', '153', 'A', -9, '', '', '16833359266712701593094542434581.jpg', 'T', 'N', '0000-00-00', 0, 0),
(422, '2023-05-06', '08:21', 'M', '148', 'A', -9, '', '', '16833360920566467462969025086323.jpg', 'T', 'N', '0000-00-00', 0, 0),
(423, '2023-05-06', '08:26', 'M', '204', 'A', -9, '', '', '16833363917634340240729458671070.jpg', 'T', 'N', '0000-00-00', 0, 0),
(424, '2023-05-06', '08:32', 'M', '149', 'A', -9, '', '', '16833367421391845697718.jpg', 'T', 'N', '0000-00-00', 0, 0),
(425, '2023-05-06', '08:37', 'M', '154', 'A', -9, '', '', '16833370245134902132195191346730.jpg', 'T', 'N', '0000-00-00', 0, 0),
(426, '2023-05-06', '08:40', 'M', '151', 'A', -9, '', '', '1683337246149-1581260827.jpg', 'T', 'N', '0000-00-00', 0, 0),
(427, '2023-05-06', '16:59', 'P', '153', 'B', -1, '', '', '1683367184158988344827748130712.jpg', 'T', 'N', '0000-00-00', 0, 0),
(428, '2023-05-06', '16:59', 'P', '183', 'B', -1, '', '', 'IMG20230506165535.jpg', 'T', 'N', '0000-00-00', 0, 0),
(429, '2023-05-06', '17:01', 'P', '151', 'B', 0, '', '', '1683367280986-1496870128.jpg', 'T', 'N', '0000-00-00', 0, 0),
(430, '2023-05-06', '17:02', 'P', '154', 'B', 0, '', '', '16833673688082110368913450496765.jpg', 'T', 'N', '0000-00-00', 0, 0),
(431, '2023-05-06', '18:06', 'P', '149', 'B', 1, '', '', '16833711954591730983671.jpg', 'T', 'O', '2023-05-08', 0, 0),
(432, '2023-05-06', '18:42', 'P', '148', 'B', 1, '', '', '16833733261365572283298789707005.jpg', 'T', 'O', '2023-05-08', 0, 0),
(433, '2023-05-06', '20:53', 'P', '204', 'B', 3, '', '', '16833811892888757296760240953590.jpg', 'T', 'T', '2023-05-09', 0, 0),
(434, '2023-05-08', '08:15', 'M', '183', 'A', -9, '', '', '16835085063521836243283.jpg', 'T', 'N', '0000-00-00', 0, 0),
(435, '2023-05-08', '08:19', 'M', '150', 'A', -9, '', '', '16835087849531610005342230813677.jpg', 'T', 'N', '0000-00-00', 0, 0),
(436, '2023-05-08', '08:20', 'M', '151', 'A', -9, '', '', '1683508834147-1496870128.jpg', 'T', 'N', '0000-00-00', 0, 0),
(437, '2023-05-08', '08:23', 'M', '204', 'A', -9, '', '', '16835089951603529562016653706220.jpg', 'T', 'N', '0000-00-00', 0, 0),
(438, '2023-05-08', '08:23', 'M', '148', 'A', -9, '', '', '16835090238783697740473243495337.jpg', 'T', 'N', '0000-00-00', 0, 0),
(439, '2023-05-08', '08:36', 'M', '153', 'A', -9, '', '', '16835097818067424761222655612558.jpg', 'T', 'N', '0000-00-00', 0, 0),
(440, '2023-05-08', '08:39', 'M', '154', 'A', -9, '', '', '16835099703632482187466281504838.jpg', 'T', 'N', '0000-00-00', 0, 0),
(441, '2023-05-08', '08:40', 'M', '149', 'A', -9, '', '', '1683510046546418838140.jpg', 'T', 'N', '0000-00-00', 0, 0),
(442, '2023-05-08', '17:01', 'P', '183', 'B', 0, '', '', '16835400679061395436159.jpg', 'T', 'N', '0000-00-00', 0, 0),
(443, '2023-05-08', '17:03', 'P', '150', 'B', 0, '', '', '16835401883522869006278309058141.jpg', 'T', 'N', '0000-00-00', 0, 0),
(444, '2023-05-08', '17:03', 'P', '151', 'B', 0, '', '', '1683540200877-1496870128.jpg', 'T', 'N', '0000-00-00', 0, 0),
(445, '2023-05-08', '17:04', 'P', '154', 'B', 0, '', '', '16835402420927553381539291793597.jpg', 'T', 'N', '0000-00-00', 0, 0),
(446, '2023-05-08', '17:03', 'P', '153', 'B', 0, '', '', '16835402408446716967479565625443.jpg', 'T', 'N', '0000-00-00', 0, 0),
(447, '2023-05-08', '17:05', 'P', '148', 'B', 0, '', '', '16835403191325614434430705029668.jpg', 'T', 'N', '0000-00-00', 0, 0),
(448, '2023-05-08', '17:09', 'P', '204', 'B', 0, '', '', '16835405573543451672985541667662.jpg', 'T', 'N', '0000-00-00', 0, 0),
(449, '2023-05-08', '17:10', 'P', '149', 'B', 0, '', '', '16835406400571507659213.jpg', 'T', 'N', '0000-00-00', 0, 0),
(450, '2023-05-09', '07:40', 'M', '153', 'A', -10, '', '', '16835928095212324880983294769654.jpg', 'T', 'N', '0000-00-00', 0, 0),
(451, '2023-05-09', '08:18', 'M', '183', 'A', -9, '', '', '1683595085956939008673.jpg', 'T', 'N', '0000-00-00', 0, 0),
(452, '2023-05-09', '08:21', 'M', '150', 'A', -9, '', '', '16835953275764777676200251955379.jpg', 'T', 'N', '0000-00-00', 0, 0),
(453, '2023-05-09', '08:23', 'M', '148', 'A', -9, '', '', '16835954011867601296460267084363.jpg', 'T', 'N', '0000-00-00', 0, 0),
(454, '2023-05-09', '08:27', 'M', '204', 'A', -9, '', '', '16835956321914253326828623368375.jpg', 'T', 'N', '0000-00-00', 0, 0),
(455, '2023-05-09', '08:34', 'M', '149', 'A', -9, '', '', '1683596050647112102068.jpg', 'T', 'N', '0000-00-00', 0, 0),
(456, '2023-05-09', '08:36', 'M', '151', 'A', -9, '', '', '1683596169438-1496870128.jpg', 'T', 'N', '0000-00-00', 0, 0),
(457, '2023-05-09', '17:01', 'P', '148', 'B', 0, '', '', '16836264677861071142215278222204.jpg', 'T', 'N', '0000-00-00', 0, 0),
(458, '2023-05-09', '17:01', 'P', '153', 'B', 0, '', '', '16836264692663532626841859128812.jpg', 'T', 'N', '0000-00-00', 0, 0),
(459, '2023-05-09', '17:01', 'P', '150', 'B', 0, '', '', '16836264784496957173074071645297.jpg', 'T', 'N', '0000-00-00', 0, 0),
(460, '2023-05-09', '17:01', 'P', '183', 'B', 0, '', '', 'IMG20230509165915.jpg', 'T', 'N', '0000-00-00', 0, 0),
(461, '2023-05-09', '17:03', 'P', '149', 'B', 0, '', '', '16836266269501607883866.jpg', 'T', 'N', '0000-00-00', 0, 0),
(462, '2023-05-09', '17:11', 'P', '204', 'B', 0, '', '', '16836270933294843856501058337596.jpg', 'T', 'N', '0000-00-00', 0, 0),
(463, '2023-05-09', '17:11', 'P', '154', 'B', 0, '', '', 'IMG-20230509-WA0027.jpg', 'T', 'N', '0000-00-00', 0, 0),
(464, '2023-05-10', '07:56', 'M', '153', 'A', -10, '', '', '16836802257619137289260427769229.jpg', 'T', 'N', '0000-00-00', 0, 0),
(465, '2023-05-10', '08:04', 'M', '148', 'A', -9, '', '', '16836806754961846837106266300237.jpg', 'T', 'N', '0000-00-00', 0, 0),
(466, '2023-05-10', '08:05', 'M', '150', 'A', -9, '', '', '16836807486956856977277855483109.jpg', 'T', 'N', '0000-00-00', 0, 0),
(467, '2023-05-10', '08:21', 'M', '183', 'A', -9, '', '', '1683681704943616987435.jpg', 'T', 'N', '0000-00-00', 0, 0),
(468, '2023-05-10', '08:28', 'M', '149', 'A', -9, '', '', '16836821416251737872782.jpg', 'T', 'N', '0000-00-00', 0, 0),
(469, '2023-05-10', '08:34', 'M', '204', 'A', -9, '', '', '16836824595214311734788705436651.jpg', 'T', 'N', '0000-00-00', 0, 0),
(470, '2023-05-10', '17:01', 'P', '183', 'B', 0, '', '', '16837129029661031989507.jpg', 'T', 'N', '0000-00-00', 0, 0),
(471, '2023-05-10', '17:04', 'P', '148', 'B', 0, '', '', '16837130544183311183858656814144.jpg', 'T', 'N', '0000-00-00', 0, 0),
(472, '2023-05-10', '17:11', 'P', '149', 'B', 0, '', '', '16837135106001119094560.jpg', 'T', 'N', '0000-00-00', 0, 0);
INSERT INTO `t_presensi` (`id`, `tanggal`, `waktu`, `status`, `id_pegawai`, `sts`, `overtime`, `latitude`, `langitude`, `foto_user`, `ajukan`, `sts_ajukan`, `tgl_acc`, `status_absen`, `hapus_absen`) VALUES
(473, '2023-05-10', '17:14', 'P', '204', 'B', 0, '', '', '16837136548848756066467018854969.jpg', 'T', 'N', '0000-00-00', 0, 0),
(474, '2023-05-10', '17:16', 'P', '154', 'B', 0, '', '', '16837138006547314432749412984321.jpg', 'T', 'N', '0000-00-00', 0, 0),
(475, '2023-05-10', '18:00', 'P', '153', 'B', 1, '', '', '16837164582231842673745167914226.jpg', 'T', 'O', '2023-05-11', 0, 0),
(476, '2023-05-10', '18:02', 'P', '150', 'B', 1, '', '', '1683716576814362482328383487815.jpg', 'T', 'O', '2023-05-11', 0, 0),
(477, '2023-05-11', '07:43', 'M', '153', 'A', -10, '', '', '16837658149782465341966324479862.jpg', 'T', 'N', '0000-00-00', 0, 0),
(478, '2023-05-11', '08:10', 'M', '150', 'A', -9, '', '', '16837674404733733023961836879990.jpg', 'T', 'N', '0000-00-00', 0, 0),
(479, '2023-05-11', '08:10', 'M', '183', 'A', -9, '', '', '16837674452001530000234.jpg', 'T', 'N', '0000-00-00', 0, 0),
(480, '2023-05-11', '08:27', 'M', '204', 'A', -9, '', '', '16837684294639183882168066996346.jpg', 'T', 'N', '0000-00-00', 0, 0),
(481, '2023-05-11', '08:28', 'M', '154', 'A', -9, '', '', '1683768503042297724885747752058.jpg', 'T', 'N', '0000-00-00', 0, 0),
(483, '2023-05-11', '08:34', 'M', '148', 'A', -9, '', '', '16837688657973129883302815501186.jpg', 'T', 'N', '0000-00-00', 0, 0),
(484, '2023-05-11', '08:39', 'M', '149', 'A', -9, '', '', '1683769159033612488151.jpg', 'T', 'N', '0000-00-00', 0, 0),
(485, '2023-05-11', '10:35', 'M', '192', 'A', -7, '', '', '01-15-300x293.png', 'T', 'N', '0000-00-00', 0, 0),
(486, '2023-05-11', '16:59', 'P', '149', 'B', -1, '', '', '16837992058071073269787.jpg', 'T', 'N', '0000-00-00', 0, 0),
(487, '2023-05-11', '17:00', 'P', '153', 'B', 0, '', '', '16837992387877429985797536174983.jpg', 'T', 'N', '0000-00-00', 0, 0),
(488, '2023-05-11', '17:01', 'P', '183', 'B', 0, '', '', '1683799263115177742463.jpg', 'T', 'N', '0000-00-00', 0, 0),
(489, '2023-05-11', '17:01', 'P', '154', 'B', 0, '', '', '16837992845293705175761418212957.jpg', 'T', 'N', '0000-00-00', 0, 0),
(490, '2023-05-11', '17:01', 'P', '148', 'B', 0, '', '', '16837992706954808110799076719175.jpg', 'T', 'N', '0000-00-00', 0, 0),
(491, '2023-05-11', '17:02', 'P', '150', 'B', 0, '', '', '16837993592697617458407748308533.jpg', 'T', 'N', '0000-00-00', 0, 0),
(492, '2023-05-11', '17:02', 'P', '151', 'B', 0, '', '', '1683799377824-1496870128.jpg', 'T', 'N', '0000-00-00', 0, 0),
(493, '2023-05-11', '17:28', 'P', '204', 'B', 0, '', '', '16838008985863889969231263130062.jpg', 'T', 'N', '0000-00-00', 0, 0),
(494, '2023-05-12', '07:56', 'M', '153', 'A', -10, '', '', '16838529713175209891776584733006.jpg', 'T', 'N', '0000-00-00', 0, 0),
(495, '2023-05-12', '08:12', 'M', '151', 'A', -9, '', '', '1683853964491-1496870128.jpg', 'T', 'N', '0000-00-00', 0, 0),
(496, '2023-05-12', '08:14', 'M', '150', 'A', -9, '', '', '16838540914725219035202536380720.jpg', 'T', 'N', '0000-00-00', 0, 0),
(497, '2023-05-12', '08:24', 'M', '148', 'A', -9, '', '', '16838546657274490422872796556677.jpg', 'T', 'N', '0000-00-00', 0, 0),
(498, '2023-05-12', '08:32', 'M', '204', 'A', -9, '', '', '16838552059342582449739170870261.jpg', 'T', 'N', '0000-00-00', 0, 0),
(499, '2023-05-12', '08:33', 'M', '183', 'A', -9, '', '', 'IMG20230509165915.jpg', 'T', 'N', '0000-00-00', 0, 0),
(500, '2023-05-12', '08:33', 'M', '149', 'A', -9, '', '', '16838552478051084048474.jpg', 'T', 'N', '0000-00-00', 0, 0),
(501, '2023-05-12', '08:39', 'M', '154', 'A', -9, '', '', '16838555429952373643378940271253.jpg', 'T', 'N', '0000-00-00', 0, 0),
(502, '2023-05-12', '17:01', 'P', '183', 'B', 0, '', '', '16838856641791503761550.jpg', 'T', 'N', '0000-00-00', 0, 0),
(503, '2023-05-12', '17:01', 'P', '154', 'B', 0, '', '', '16838856734318947693636234910199.jpg', 'T', 'N', '0000-00-00', 0, 0),
(504, '2023-05-12', '17:02', 'P', '148', 'B', 0, '', '', '1683885723933585134692634356830.jpg', 'T', 'N', '0000-00-00', 0, 0),
(505, '2023-05-12', '17:01', 'P', '153', 'B', 0, '', '', '16838857217268179766038606788727.jpg', 'T', 'N', '0000-00-00', 0, 0),
(506, '2023-05-12', '17:03', 'P', '151', 'B', 0, '', '', '1683885801999-1581260827.jpg', 'T', 'N', '0000-00-00', 0, 0),
(507, '2023-05-12', '17:03', 'P', '149', 'B', 0, '', '', '1683885845801354618316.jpg', 'T', 'N', '0000-00-00', 0, 0),
(508, '2023-05-12', '17:04', 'P', '150', 'B', 0, '', '', '16838858458813553202043829574557.jpg', 'T', 'N', '0000-00-00', 0, 0),
(509, '2023-05-12', '18:40', 'P', '204', 'B', 1, '', '', '16838916175124553610176777203538.jpg', 'T', 'O', '2023-05-13', 0, 0),
(510, '2023-05-13', '07:58', 'M', '149', 'A', -10, '', '', '1683939528906514517055.jpg', 'T', 'N', '0000-00-00', 0, 0),
(511, '2023-05-13', '08:03', 'M', '153', 'A', -9, '', '', '1683939829320165065015979064389.jpg', 'T', 'N', '0000-00-00', 0, 0),
(512, '2023-05-13', '08:08', 'M', '148', 'A', -9, '', '', '16839400876634028813437329180748.jpg', 'T', 'N', '0000-00-00', 0, 0),
(513, '2023-05-13', '08:08', 'M', '151', 'A', -9, '', '', 'IMG-20230512-WA0019.jpg', 'T', 'N', '0000-00-00', 0, 0),
(514, '2023-05-13', '08:12', 'M', '150', 'A', -9, '', '', '16839403441074432132398123089844.jpg', 'T', 'N', '0000-00-00', 0, 0),
(515, '2023-05-13', '08:28', 'M', '183', 'A', -9, '', '', '16839412859651804509205.jpg', 'T', 'N', '0000-00-00', 0, 0),
(516, '2023-05-13', '08:34', 'M', '204', 'A', -9, '', '', '16839416769597415330367704192452.jpg', 'T', 'N', '0000-00-00', 0, 0),
(517, '2023-05-13', '08:36', 'M', '154', 'A', -9, '', '', '16839417863145299127876063558516.jpg', 'T', 'N', '0000-00-00', 0, 0),
(518, '2023-05-13', '17:04', 'P', '183', 'B', 0, '', '', '16839722832582113347468.jpg', 'T', 'N', '0000-00-00', 0, 0),
(519, '2023-05-13', '17:10', 'P', '150', 'B', 0, '', '', '16839726222052943914241966410850.jpg', 'T', 'N', '0000-00-00', 0, 0),
(520, '2023-05-13', '17:24', 'P', '153', 'B', 0, '', '', '16839734550161856410457313451521.jpg', 'T', 'N', '0000-00-00', 0, 0),
(521, '2023-05-13', '17:38', 'P', '154', 'B', 0, '', '', 'IMG20230513173042.jpg', 'T', 'N', '0000-00-00', 0, 0),
(522, '2023-05-13', '18:11', 'P', '204', 'B', 1, '', '', '16839762683276641740092448819330.jpg', 'T', 'T', '2023-05-19', 0, 0),
(523, '2023-05-13', '18:11', 'P', '151', 'B', 1, '', '', '1683976287350-1496870128.jpg', 'T', 'T', '2023-05-15', 0, 0),
(524, '2023-05-13', '19:33', 'P', '149', 'B', 2, '', '', '1683981218864356448618.jpg', 'T', 'O', '2023-05-15', 0, 0),
(525, '2023-05-13', '19:51', 'P', '148', 'B', 2, '', '', '16839822821162846624791909424245.jpg', 'T', 'O', '2023-05-15', 0, 0),
(526, '2023-05-15', '08:02', 'M', '150', 'A', -9, '', '', '16841125732181508522740633054453.jpg', 'T', 'N', '0000-00-00', 0, 0),
(527, '2023-05-15', '08:08', 'M', '153', 'A', -9, '', '', '16841129392934054657226900848510.jpg', 'T', 'N', '0000-00-00', 0, 0),
(528, '2023-05-15', '08:12', 'M', '151', 'A', -9, '', '', '1684113177157-1496870128.jpg', 'T', 'N', '0000-00-00', 0, 0),
(529, '2023-05-15', '08:22', 'M', '183', 'A', -9, '', '', '16841137437551948955025.jpg', 'T', 'N', '0000-00-00', 0, 0),
(530, '2023-05-15', '08:30', 'M', '149', 'A', -9, '', '', '16841142620281485287084.jpg', 'T', 'N', '0000-00-00', 0, 0),
(531, '2023-05-15', '08:33', 'M', '204', 'A', -9, '', '', '16841143822098045328818959901459.jpg', 'T', 'N', '0000-00-00', 0, 0),
(532, '2023-05-15', '08:36', 'M', '148', 'A', -9, '', '', '16841146105146300611102453224030.jpg', 'T', 'N', '0000-00-00', 0, 0),
(533, '2023-04-28', '08:37', 'M', '150', 'A', -9, '', '', 'IMG-20230428-WA0010.jpg', 'T', 'N', '0000-00-00', 0, 0),
(537, '2023-05-15', '18:01', 'P', '175', 'B', 1, '', '', '', 'T', 'T', '2023-05-17', 0, 0),
(538, '2023-05-15', '16:59', 'P', '149', 'B', -1, '', '', '16841448051831951894375.jpg', 'T', 'N', '0000-00-00', 0, 0),
(539, '2023-05-15', '17:00', 'P', '153', 'B', 0, '', '', '16841448215609060937163401992771.jpg', 'T', 'N', '0000-00-00', 0, 0),
(540, '2023-05-15', '17:01', 'P', '148', 'B', 0, '', '', '16841448658677980751910609229925.jpg', 'T', 'N', '0000-00-00', 0, 0),
(541, '2023-05-15', '17:00', 'P', '154', 'B', 0, '', '', '1684144829739637870646101165179.jpg', 'T', 'N', '0000-00-00', 0, 0),
(542, '2023-05-15', '17:00', 'P', '183', 'B', 0, '', '', '16841448738831150851143.jpg', 'T', 'N', '0000-00-00', 0, 0),
(543, '2023-05-15', '17:01', 'P', '150', 'B', 0, '', '', '16841449023293986516775992137678.jpg', 'T', 'N', '0000-00-00', 0, 0),
(544, '2023-05-15', '17:03', 'P', '151', 'B', 0, '', '', '1684145001456-1496870128.jpg', 'T', 'N', '0000-00-00', 0, 0),
(545, '2023-05-15', '17:22', 'P', '204', 'B', 0, '', '', '16841461631297965136408316224204.jpg', 'T', 'N', '0000-00-00', 0, 0),
(546, '2023-05-16', '08:02', 'M', '150', 'A', -9, '', '', '16841989741914017240447132536827.jpg', 'T', 'N', '0000-00-00', 0, 0),
(547, '2023-05-16', '08:18', 'M', '204', 'A', -9, '', '', '16841999294044991802431472644373.jpg', 'T', 'N', '0000-00-00', 0, 0),
(548, '2023-05-16', '08:19', 'M', '151', 'A', -9, '', '', '1684200002430560511763.jpg', 'T', 'N', '0000-00-00', 0, 0),
(549, '2023-05-16', '08:19', 'M', '153', 'A', -9, '', '', '16841999905807088103684425324299.jpg', 'T', 'N', '0000-00-00', 0, 0),
(550, '2023-05-16', '08:22', 'M', '183', 'A', -9, '', '', '16842001652141735302810.jpg', 'T', 'N', '0000-00-00', 0, 0),
(551, '2023-05-16', '08:32', 'M', '149', 'A', -9, '', '', '1684200726187613597441.jpg', 'T', 'N', '0000-00-00', 0, 0),
(552, '2023-05-16', '08:38', 'M', '154', 'A', -9, '', '', 'IMG-20230516-WA0000.jpg', 'T', 'N', '0000-00-00', 0, 0),
(553, '2023-05-16', '08:39', 'M', '148', 'A', -9, '', '', '16842011875663807806970933007582.jpg', 'T', 'N', '0000-00-00', 0, 0),
(554, '2023-04-29', '08:40', 'M', '204', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(555, '2023-05-02', '08:30', 'M', '204', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(556, '2023-05-16', '17:00', 'P', '153', 'B', 0, '', '', '16842312382015037930327456020048.jpg', 'T', 'N', '0000-00-00', 0, 0),
(557, '2023-05-16', '17:00', 'P', '183', 'B', 0, '', '', '1684231230383355401843.jpg', 'T', 'N', '0000-00-00', 0, 0),
(558, '2023-05-16', '17:01', 'P', '148', 'B', 0, '', '', '16842313052268567498059269026192.jpg', 'T', 'N', '0000-00-00', 0, 0),
(559, '2023-05-16', '17:03', 'P', '154', 'B', 0, '', '', '16842314295082114237873258836715.jpg', 'T', 'N', '0000-00-00', 0, 0),
(560, '2023-05-16', '17:05', 'P', '150', 'B', 0, '', '', '1684231509461670053968179834226.jpg', 'T', 'N', '0000-00-00', 0, 0),
(561, '2023-05-16', '17:21', 'P', '204', 'B', 0, '', '', '1684232491447246868242159177751.jpg', 'T', 'N', '0000-00-00', 0, 0),
(562, '2023-05-16', '17:22', 'P', '151', 'B', 0, '', '', '1684232556769112566038.jpg', 'T', 'N', '0000-00-00', 0, 0),
(563, '2023-05-16', '20:45', 'P', '149', 'B', 3, '', '', '16842447125001541580730.jpg', 'T', 'T', '2023-05-17', 0, 0),
(564, '2023-05-17', '08:04', 'M', '150', 'A', -9, '', '', '16842854803586565936772108848744.jpg', 'T', 'N', '0000-00-00', 0, 0),
(565, '2023-05-17', '08:11', 'M', '153', 'A', -9, '', '', '16842859063203109904311030162306.jpg', 'T', 'N', '0000-00-00', 0, 0),
(566, '2023-05-17', '08:20', 'M', '183', 'A', -9, '', '', '1684286446532948602827.jpg', 'T', 'N', '0000-00-00', 0, 0),
(567, '2023-05-17', '08:28', 'M', '204', 'A', -9, '', '', '16842869367318624685845906928952.jpg', 'T', 'N', '0000-00-00', 0, 0),
(568, '2023-05-17', '08:36', 'M', '149', 'A', -9, '', '', '16842873856811082497475.jpg', 'T', 'N', '0000-00-00', 0, 0),
(569, '2023-05-17', '08:38', 'M', '154', 'A', -9, '', '', '16842874835617065298739081351499.jpg', 'T', 'N', '0000-00-00', 0, 0),
(570, '2023-05-17', '17:01', 'P', '148', 'B', 0, '', '', '16843176996352934417668768510989.jpg', 'T', 'N', '0000-00-00', 0, 0),
(571, '2023-05-17', '17:01', 'P', '183', 'B', 0, '', '', '1684317700408982287089.jpg', 'T', 'N', '0000-00-00', 0, 0),
(572, '2023-05-17', '17:03', 'P', '148', 'B', 0, '', '', '1684317824724271606328414386693.jpg', 'T', 'N', '0000-00-00', 0, 0),
(573, '2023-05-17', '17:04', 'P', '150', 'B', 0, '', '', '16843178679727285052041602997938.jpg', 'T', 'N', '0000-00-00', 0, 0),
(574, '2023-05-17', '17:05', 'P', '154', 'B', 0, '', '', '16843179115728273605977367821763.jpg', 'T', 'N', '0000-00-00', 0, 0),
(575, '2023-05-17', '17:07', 'P', '151', 'B', 0, '', '', '1684318061975428834713.jpg', 'T', 'N', '0000-00-00', 0, 0),
(576, '2023-05-17', '17:44', 'P', '204', 'B', 0, '', '', '16843202526003452051102231857260.jpg', 'T', 'N', '0000-00-00', 0, 0),
(577, '2023-05-17', '19:13', 'P', '153', 'B', 2, '', '', '16843256383235472010748688719060.jpg', 'T', 'O', '2023-05-19', 0, 0),
(578, '2023-05-17', '19:16', 'P', '149', 'B', 2, '', '', '1684325773199781215934.jpg', 'T', 'O', '2023-05-19', 0, 0),
(579, '2023-05-19', '07:38', 'M', '153', 'A', -10, '', '', '16844567068533177311464758579761.jpg', 'T', 'N', '0000-00-00', 0, 0),
(580, '2023-05-19', '07:55', 'M', '150', 'A', -10, '', '', '16844577356569167286093780909910.jpg', 'T', 'N', '0000-00-00', 0, 0),
(581, '2023-05-19', '08:15', 'M', '204', 'A', -9, '', '', '16844589372133776279157974540924.jpg', 'T', 'N', '0000-00-00', 0, 0),
(582, '2023-05-19', '08:15', 'M', '204', 'A', -9, '', '', '16844589820771722295585974186206.jpg', 'T', 'N', '0000-00-00', 0, 0),
(583, '2023-05-19', '08:24', 'M', '183', 'A', -9, '', '', '16844594431316734249.jpg', 'T', 'N', '0000-00-00', 0, 0),
(584, '2023-05-19', '08:31', 'M', '149', 'A', -9, '', '', '1684459911370832156735.jpg', 'T', 'N', '0000-00-00', 0, 0),
(585, '2023-05-19', '17:01', 'P', '154', 'B', 0, '', '', '16844904747643346540986720458836.jpg', 'T', 'N', '0000-00-00', 0, 0),
(586, '2023-05-19', '17:01', 'P', '150', 'B', 0, '', '', '16844905190064307080674375474315.jpg', 'T', 'N', '0000-00-00', 0, 0),
(587, '2023-05-19', '17:02', 'P', '153', 'B', 0, '', '', '16844905457476896567076123529713.jpg', 'T', 'N', '0000-00-00', 0, 0),
(588, '2023-05-19', '17:02', 'P', '149', 'B', 0, '', '', '1684490562223139365742.jpg', 'T', 'N', '0000-00-00', 0, 0),
(589, '2023-05-19', '17:11', 'P', '183', 'B', 0, '', '', '16844910622641919109960.jpg', 'T', 'N', '0000-00-00', 0, 0),
(590, '2023-05-19', '17:29', 'P', '204', 'B', 0, '', '', '16844921434262593778017776729332.jpg', 'T', 'N', '0000-00-00', 0, 0),
(591, '2023-05-20', '07:51', 'M', '153', 'A', -10, '', '', '16845438759188530476373443643378.jpg', 'T', 'N', '0000-00-00', 0, 0),
(592, '2023-05-20', '08:03', 'M', '150', 'A', -9, '', '', '16845446418216639951003075044996.jpg', 'T', 'N', '0000-00-00', 0, 0),
(593, '2023-05-20', '08:24', 'M', '204', 'A', -9, '', '', '16845458649724534301264031282007.jpg', 'T', 'N', '0000-00-00', 0, 0),
(594, '2023-05-20', '08:27', 'M', '149', 'A', -9, '', '', '1684546042145749290346.jpg', 'T', 'N', '0000-00-00', 0, 0),
(595, '2023-05-20', '08:38', 'M', '183', 'A', -9, '', '', '168454669364660863159.jpg', 'T', 'N', '0000-00-00', 0, 0),
(596, '2023-05-20', '08:39', 'M', '148', 'A', -9, '', '', '16845467739146962957034283861463.jpg', 'T', 'N', '0000-00-00', 0, 0),
(597, '2023-05-20', '17:01', 'P', '149', 'B', 0, '', '', '16845768886291089691200.jpg', 'T', 'N', '0000-00-00', 0, 0),
(598, '2023-05-20', '17:02', 'P', '183', 'B', 0, '', '', 'IMG20230520163650.jpg', 'T', 'N', '0000-00-00', 0, 0),
(599, '2023-05-20', '17:03', 'P', '148', 'B', 0, '', '', '1684576993484243014035875579550.jpg', 'T', 'N', '0000-00-00', 0, 0),
(600, '2023-05-20', '17:03', 'P', '153', 'B', 0, '', '', '16845770390307085798393616600270.jpg', 'T', 'N', '0000-00-00', 0, 0),
(601, '2023-05-20', '17:10', 'P', '150', 'B', 0, '', '', '16845774351724738432021821593079.jpg', 'T', 'N', '0000-00-00', 0, 0),
(602, '2023-05-20', '17:10', 'P', '150', 'B', 0, '', '', '16845774351724738432021821593079.jpg', 'T', 'N', '0000-00-00', 0, 0),
(603, '2023-05-20', '19:31', 'P', '154', 'B', 2, '', '', 'IMG20230520165739.jpg', 'T', 'T', '2023-05-22', 0, 0),
(604, '2023-05-22', '08:12', 'M', '151', 'A', -9, '', '', '1684717986567574333191.jpg', 'T', 'N', '0000-00-00', 0, 0),
(605, '2023-05-22', '08:11', 'M', '153', 'A', -9, '', '', '16847180882354047035800456169871.jpg', 'T', 'N', '0000-00-00', 0, 0),
(606, '2023-05-22', '08:15', 'M', '150', 'A', -9, '', '', '16847181095841556639599629665101.jpg', 'T', 'N', '0000-00-00', 0, 0),
(607, '2023-05-22', '08:23', 'M', '148', 'A', -9, '', '', '16847186160658418609599550395591.jpg', 'T', 'N', '0000-00-00', 0, 0),
(608, '2023-05-22', '08:26', 'M', '183', 'A', -9, '', '', '1684718817846949012000.jpg', 'T', 'N', '0000-00-00', 0, 0),
(609, '2023-05-22', '08:31', 'M', '204', 'A', -9, '', '', '1684719065955203038498023833237.jpg', 'T', 'N', '0000-00-00', 0, 0),
(610, '2023-05-22', '08:30', 'M', '149', 'A', -9, '', '', '16847190243581837784716.jpg', 'T', 'N', '0000-00-00', 0, 0),
(611, '2023-05-22', '08:39', 'M', '154', 'A', -9, '', '', '16847195890292033904778665690770.jpg', 'T', 'N', '0000-00-00', 0, 0),
(612, '2023-05-22', '18:14', 'P', '183', 'B', 1, '', '', '16847540939501469385719.jpg', 'T', 'O', '2023-05-23', 0, 0),
(613, '2023-05-22', '18:14', 'P', '151', 'B', 1, '', '', '1684754068631574333191.jpg', 'T', 'O', '2023-05-23', 0, 0),
(614, '2023-05-22', '18:17', 'P', '153', 'B', 1, '', '', '1684754248191190057413067131758.jpg', 'T', 'O', '2023-05-23', 0, 0),
(615, '2023-05-22', '18:18', 'P', '149', 'B', 1, '', '', '16847543142121513929259.jpg', 'T', 'O', '2023-05-23', 0, 0),
(616, '2023-05-22', '18:28', 'P', '148', 'B', 1, '', '', '16847549154593415234010127635267.jpg', 'T', 'O', '2023-05-23', 0, 0),
(617, '2023-05-22', '18:36', 'P', '204', 'B', 1, '', '', '16847553681206490977351457525340.jpg', 'T', 'O', '2023-05-23', 0, 0),
(618, '2023-05-22', '19:05', 'P', '150', 'B', 2, '', '', '16847571264704710683474332404827.jpg', 'T', 'T', '2023-05-24', 0, 0),
(619, '2023-05-22', '19:54', 'P', '154', 'B', 2, '', '', 'IMG20230522182622.jpg', 'T', 'T', '2023-05-23', 0, 0),
(620, '2023-05-23', '08:06', 'M', '150', 'A', -9, '', '', '1684803985364992449995144534000.jpg', 'T', 'N', '0000-00-00', 0, 0),
(621, '2023-05-23', '08:17', 'M', '204', 'A', -9, '', '', '16848046274977842988690583195168.jpg', 'T', 'N', '0000-00-00', 0, 0),
(622, '2023-05-23', '08:17', 'M', '153', 'A', -9, '', '', '16848046289531588375639913418489.jpg', 'T', 'N', '0000-00-00', 0, 0),
(623, '2023-05-23', '08:26', 'M', '151', 'A', -9, '', '', '1684805227875988550801.jpg', 'T', 'N', '0000-00-00', 0, 0),
(624, '2023-05-23', '08:34', 'M', '149', 'A', -9, '', '', '1684805700971311700092.jpg', 'T', 'N', '0000-00-00', 0, 0),
(625, '2023-05-04', '08:30', 'M', '154', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(626, '2023-05-04', '17:00', 'P', '154', 'B', 0, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(627, '2023-05-22', '18:00', 'P', '154', 'B', 1, '', '', '', 'T', 'O', '2023-05-23', 0, 0),
(628, '2023-05-05', '08:30', 'M', '154', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(629, '2023-05-05', '17:00', 'P', '154', 'B', 0, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(630, '2023-05-09', '08:30', 'M', '154', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(631, '2023-05-10', '08:30', 'M', '154', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(632, '2023-05-15', '08:30', 'M', '154', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(633, '2023-05-19', '08:30', 'M', '154', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(634, '2023-05-20', '08:30', 'M', '154', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(635, '2023-05-23', '08:30', 'M', '154', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(636, '2023-05-23', '17:01', 'P', '183', 'B', 0, '', '', '16848360893421683015211.jpg', 'T', 'N', '0000-00-00', 0, 0),
(637, '2023-05-23', '17:01', 'P', '153', 'B', 0, '', '', '16848361459823888062467548654811.jpg', 'T', 'N', '0000-00-00', 0, 0),
(638, '2023-05-23', '17:18', 'P', '204', 'B', 0, '', '', '16848371159286357944338053874795.jpg', 'T', 'N', '0000-00-00', 0, 0),
(639, '2023-05-23', '17:19', 'P', '151', 'B', 0, '', '', '16848371539851602321780.jpg', 'T', 'N', '0000-00-00', 0, 0),
(640, '2023-05-23', '18:11', 'P', '150', 'B', 1, '', '', '16848403277706693195606029842436.jpg', 'T', 'O', '2023-05-24', 0, 0),
(641, '2023-05-23', '18:18', 'P', '154', 'B', 1, '', '', '16848407150445306325847360139027.jpg', 'T', 'O', '2023-05-24', 0, 0),
(642, '2023-05-23', '19:47', 'P', '148', 'B', 2, '', '', '16848460557428036072195263338262.jpg', 'T', 'O', '2023-05-24', 0, 0),
(643, '2023-05-23', '19:49', 'P', '149', 'B', 2, '', '', '1684846178779799438124.jpg', 'T', 'O', '2023-05-24', 0, 0),
(644, '2023-05-24', '07:10', 'M', '153', 'A', -10, '', '', '16848870155134370644004051831479.jpg', 'T', 'N', '0000-00-00', 0, 0),
(645, '2023-05-24', '07:26', 'M', '204', 'A', -10, '', '', '16848880025766283109316128448299.jpg', 'T', 'N', '0000-00-00', 0, 0),
(646, '2023-05-24', '08:02', 'M', '148', 'A', -9, '', '', '16848901758035321402244260021097.jpg', 'T', 'N', '0000-00-00', 0, 0),
(647, '2023-05-24', '08:02', 'M', '148', 'A', -9, '', '', '16848902152694859182874589670233.jpg', 'T', 'N', '0000-00-00', 0, 0),
(648, '2023-05-24', '08:03', 'M', '150', 'A', -9, '', '', '16848902168385738036564517877603.jpg', 'T', 'N', '0000-00-00', 0, 0),
(649, '2023-05-24', '08:27', 'M', '151', 'A', -9, '', '', '1684891673777-1723380941.jpg', 'T', 'N', '0000-00-00', 0, 0),
(650, '2023-05-24', '08:29', 'M', '183', 'A', -9, '', '', '16848918012401167765330.jpg', 'T', 'N', '0000-00-00', 0, 0),
(651, '2023-05-24', '08:31', 'M', '149', 'A', -9, '', '', '16848919100941918227826.jpg', 'T', 'N', '0000-00-00', 0, 0),
(652, '2023-05-22', '18:00', 'P', '150', 'B', 1, '', '', '', 'T', 'O', '2023-05-24', 0, 0),
(653, '2023-05-24', '17:00', 'P', '153', 'B', 0, '', '', '16849224127072072701699663131284.jpg', 'T', 'N', '0000-00-00', 0, 0),
(654, '2023-05-24', '17:01', 'P', '183', 'B', 0, '', '', '1684922487428594076237.jpg', 'T', 'N', '0000-00-00', 0, 0),
(655, '2023-05-24', '17:05', 'P', '150', 'B', 0, '', '', '168492273664236181966250983041.jpg', 'T', 'N', '0000-00-00', 0, 0),
(656, '2023-05-24', '17:07', 'P', '154', 'B', 0, '', '', '16849228431759018993990611788435.jpg', 'T', 'N', '0000-00-00', 0, 0),
(657, '2023-05-24', '17:13', 'P', '151', 'B', 0, '', '', '1684923225642-1723380941.jpg', 'T', 'N', '0000-00-00', 0, 0),
(658, '2023-05-24', '17:23', 'P', '149', 'B', 0, '', '', '1684923803306546291066.jpg', 'T', 'N', '0000-00-00', 0, 0),
(659, '2023-05-24', '17:32', 'P', '204', 'B', 0, '', '', '16849243802372749106330248892119.jpg', 'T', 'N', '0000-00-00', 0, 0),
(660, '2023-05-24', '17:50', 'P', '148', 'B', 0, '', '', '16849254619313758390741422790018.jpg', 'T', 'N', '0000-00-00', 0, 0),
(661, '2023-05-25', '08:11', 'M', '153', 'A', -9, '', '', '16849770721328354208564839366911.jpg', 'T', 'N', '0000-00-00', 0, 0),
(662, '2023-05-25', '08:11', 'M', '150', 'A', -9, '', '', '1684977097410619487125707195985.jpg', 'T', 'N', '0000-00-00', 0, 0),
(663, '2023-05-25', '08:26', 'M', '148', 'A', -9, '', '', '16849780199747537686640488874485.jpg', 'T', 'N', '0000-00-00', 0, 0),
(664, '2023-05-25', '08:30', 'M', '204', 'A', -9, '', '', '1684978236802751424580567766264.jpg', 'T', 'N', '0000-00-00', 0, 0),
(665, '2023-05-25', '08:35', 'M', '149', 'A', -9, '', '', '168497854555071253500.jpg', 'T', 'N', '0000-00-00', 0, 0),
(666, '2023-05-25', '08:35', 'M', '183', 'A', -9, '', '', '16849785485651412666366.jpg', 'T', 'N', '0000-00-00', 0, 0),
(667, '2023-05-25', '08:41', 'M', '154', 'A', -9, '', '', '16849789112348826954011000800084.jpg', 'T', 'N', '0000-00-00', 0, 0),
(668, '2023-05-23', '08:30', 'M', '183', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(669, '2023-05-24', '08:30', 'M', '154', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(670, '2023-05-04', '08:30', 'M', '148', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(671, '2023-05-17', '08:30', 'M', '148', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(672, '2023-05-19', '08:30', 'M', '148', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(673, '2023-05-11', '08:30', 'M', '151', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(674, '2023-05-17', '08:30', 'M', '151', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(675, '2023-05-25', '08:30', 'M', '149', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(676, '2023-05-25', '08:30', 'M', '151', 'A', -9, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(677, '2023-05-25', '17:02', 'P', '183', 'B', 0, '', '', '1685008925279938478235.jpg', 'T', 'N', '0000-00-00', 0, 0),
(678, '2023-05-25', '17:02', 'P', '150', 'B', 0, '', '', '1685008969158664511298584155827.jpg', 'T', 'N', '0000-00-00', 0, 0),
(679, '2023-05-25', '17:03', 'P', '148', 'B', 0, '', '', '16850090247999092069818986866926.jpg', 'T', 'N', '0000-00-00', 0, 0),
(680, '2023-05-25', '17:09', 'P', '149', 'B', 0, '', '', '16850093536621647533664.jpg', 'T', 'N', '0000-00-00', 0, 0),
(681, '2023-05-25', '17:24', 'P', '204', 'B', 0, '', '', '16850102497012540998110743732160.jpg', 'T', 'N', '0000-00-00', 0, 0),
(682, '2023-05-25', '17:26', 'P', '154', 'B', 0, '', '', '16850104131884218926049595997981.jpg', 'T', 'N', '0000-00-00', 0, 0),
(683, '2023-05-25', '17:35', 'P', '151', 'B', 0, '', '', '1685010947235-1723380941.jpg', 'T', 'N', '0000-00-00', 0, 0),
(684, '2023-05-25', '18:16', 'P', '153', 'B', 1, '', '', 'IMG-20230520-WA0019.jpg', 'T', 'T', '2023-05-26', 0, 0),
(685, '2023-05-26', '07:36', 'M', '183', 'A', -10, '', '', '16850613804242093544636.jpg', 'T', 'N', '0000-00-00', 0, 0),
(686, '2023-05-26', '08:18', 'M', '150', 'A', -9, '', '', '16850638950838054022865611462338.jpg', 'T', 'N', '0000-00-00', 0, 0),
(687, '2023-05-26', '08:21', 'M', '154', 'A', -9, '', '', '16850641113015056968516467596975.jpg', 'T', 'N', '0000-00-00', 0, 0),
(688, '2023-05-26', '08:25', 'M', '153', 'A', -9, '', '', '16850643274842922896350969419024.jpg', 'T', 'N', '0000-00-00', 0, 0),
(689, '2023-05-26', '08:26', 'M', '151', 'A', -9, '', '', '1685064422848-1723380941.jpg', 'T', 'N', '0000-00-00', 0, 0),
(690, '2023-05-26', '08:30', 'M', '149', 'A', -9, '', '', '16850646091801262144204.jpg', 'T', 'N', '0000-00-00', 0, 0),
(691, '2023-05-26', '08:33', 'M', '204', 'A', -9, '', '', '168506479276795185645208504300.jpg', 'T', 'N', '0000-00-00', 0, 0),
(692, '2023-05-26', '08:34', 'M', '148', 'A', -9, '', '', '16850648787876965755931451512831.jpg', 'T', 'N', '0000-00-00', 0, 0),
(693, '2023-05-15', '08:00', 'P', '', '', 0, '', '', '', 'T', 'N', '0000-00-00', 0, 0),
(694, '2023-05-26', '17:01', 'P', '149', 'B', 0, '', '', '1685095286048447823032.jpg', 'T', 'N', '0000-00-00', 0, 0),
(695, '2023-05-26', '17:02', 'P', '183', 'B', 0, '', '', '1685095323659597210850.jpg', 'T', 'N', '0000-00-00', 0, 0),
(696, '2023-05-26', '17:05', 'P', '148', 'B', 0, '', '', '16850955557641730762948671237683.jpg', 'T', 'N', '0000-00-00', 0, 0),
(697, '2023-05-26', '17:08', 'P', '150', 'B', 0, '', '', '16850956948155618767332278083212.jpg', 'T', 'N', '0000-00-00', 0, 0),
(698, '2023-05-26', '17:12', 'P', '204', 'B', 0, '', '', '1685095949945260453428208505798.jpg', 'T', 'N', '0000-00-00', 0, 0),
(699, '2023-05-26', '17:26', 'P', '154', 'B', 0, '', '', 'IMG-20230526-WA0014.jpeg', 'T', 'N', '0000-00-00', 0, 0),
(700, '2023-05-26', '19:21', 'P', '153', 'B', 2, '', '', '16851036818268587434842544443634.jpg', 'T', 'O', '2023-05-27', 0, 0),
(701, '2023-05-27', '06:57', 'M', '148', 'A', -11, '', '', '1685145454481128854987368624836.jpg', 'T', 'N', '0000-00-00', 0, 0),
(702, '2023-05-27', '07:26', 'M', '149', 'A', -10, '', '', '1685147187245920675705.jpg', 'T', 'N', '0000-00-00', 0, 0),
(703, '2023-05-27', '07:55', 'M', '150', 'A', -10, '', '', '16851489460872498734904412287294.jpg', 'T', 'N', '0000-00-00', 0, 0),
(704, '2023-05-27', '08:12', 'M', '153', 'A', -9, '', '', '16851499421902323489552774160521.jpg', 'T', 'N', '0000-00-00', 0, 0),
(705, '2023-05-27', '08:32', 'M', '183', 'A', -9, '', '', '16851511325481692141515.jpg', 'T', 'N', '0000-00-00', 0, 0),
(706, '2023-05-27', '08:33', 'M', '204', 'A', -9, '', '', '16851512405187365164110252159652.jpg', 'T', 'N', '0000-00-00', 0, 0),
(707, '2023-05-27', '08:34', 'M', '151', 'A', -9, '', '', '1685151266474-1620139472.jpg', 'T', 'N', '0000-00-00', 0, 0),
(708, '2023-05-27', '08:39', 'M', '154', 'A', -9, '', '', '1685151560401684941468631284042.jpg', 'T', 'N', '0000-00-00', 0, 0),
(709, '2023-05-22', '18:00', 'P', '150', 'B', 1, '', '', '', 'T', 'O', '2023-05-27', 0, 0),
(710, '2023-05-26', '19:22', 'P', '151', 'B', 2, '', '', '', 'T', 'O', '2023-05-27', 0, 0),
(711, '2023-05-27', '16:56', 'P', '150', 'B', -1, '', '', '16851814231068614643767389326684.jpg', 'T', 'N', '0000-00-00', 0, 0),
(712, '2023-05-27', '17:00', 'P', '153', 'B', 0, '', '', 'IMG20230527165606.jpg', 'T', 'N', '0000-00-00', 0, 0),
(713, '2023-05-27', '17:00', 'P', '151', 'B', 0, '', '', '1685181661250-1620139472.jpg', 'T', 'N', '0000-00-00', 0, 0),
(714, '2023-05-27', '17:01', 'P', '148', 'B', 0, '', '', '16851816718833319203865217037384.jpg', 'T', 'N', '0000-00-00', 0, 0),
(715, '2023-05-27', '17:02', 'P', '183', 'B', 0, '', '', 'IMG20230527165817.jpg', 'T', 'N', '0000-00-00', 0, 0),
(716, '2023-05-27', '17:06', 'P', '154', 'B', 0, '', '', 'IMG20230527165637.jpg', 'T', 'N', '0000-00-00', 0, 0),
(717, '2023-05-27', '17:06', 'P', '154', 'B', 0, '', '', 'IMG20230527165637.jpg', 'T', 'N', '0000-00-00', 0, 0),
(718, '2023-05-27', '17:17', 'P', '149', 'B', 0, '', '', 'IMG_20230524_155251.jpg', 'T', 'N', '0000-00-00', 0, 0),
(719, '2023-05-27', '17:21', 'P', '204', 'B', 0, '', '', '16851828962593243306888366111567.jpg', 'T', 'N', '0000-00-00', 0, 0),
(720, '2023-05-29', '07:43', 'M', '153', 'A', -10, '', '', '1685321015253186477530343420427.jpg', 'T', 'N', '0000-00-00', 0, 0),
(721, '2023-05-29', '08:01', 'M', '204', 'A', -9, '', '', '16853220677967927774881041187129.jpg', 'T', 'N', '0000-00-00', 0, 0),
(722, '2023-05-29', '08:15', 'M', '150', 'A', -9, '', '', '16853229586588800937258587442012.jpg', 'T', 'N', '0000-00-00', 0, 0),
(723, '2023-05-29', '08:28', 'M', '149', 'A', -9, '', '', '16853237297991372867278.jpg', 'T', 'N', '0000-00-00', 0, 0),
(724, '2023-05-29', '08:30', 'M', '148', 'A', -9, '', '', '16853238198086074448572821540926.jpg', 'T', 'N', '0000-00-00', 0, 0),
(725, '2023-05-29', '08:33', 'M', '151', 'A', -9, '', '', '1685323984614-1620139472.jpg', 'T', 'N', '0000-00-00', 0, 0),
(726, '2023-05-29', '08:34', 'M', '154', 'A', -9, '', '', '16853240871533818124894481713663.jpg', 'T', 'N', '0000-00-00', 0, 0),
(727, '2023-05-29', '08:34', 'M', '183', 'A', -9, '', '', '1685324135668532992482.jpg', 'T', 'N', '0000-00-00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_teknisi`
--

CREATE TABLE `t_teknisi` (
  `id` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `id_teknisi1` int(11) NOT NULL,
  `id_teknisi2` int(11) NOT NULL,
  `id_teknisi3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_teknisi`
--

INSERT INTO `t_teknisi` (`id`, `id_paket`, `id_teknisi1`, `id_teknisi2`, `id_teknisi3`) VALUES
(2, 1, 27, 28, 28);

-- --------------------------------------------------------

--
-- Table structure for table `t_tipe`
--

CREATE TABLE `t_tipe` (
  `id` int(11) NOT NULL,
  `tipe` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_tipe`
--

INSERT INTO `t_tipe` (`id`, `tipe`) VALUES
(6, 'ALL CATEGORY'),
(7, 'ALL SIZE'),
(8, 'EXTRA LARGE'),
(9, 'INTERIOR + ENGGINE + GLASS COATING'),
(10, 'LARGE'),
(11, 'LUXURY'),
(12, 'MEDIUM'),
(13, 'MOTOR'),
(14, 'SMALL'),
(15, 'TENTATIVE');

-- --------------------------------------------------------

--
-- Table structure for table `t_transaksi`
--

CREATE TABLE `t_transaksi` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tlp` varchar(14) NOT NULL,
  `jns_kendaraan` varchar(50) NOT NULL,
  `waranti` varchar(10) NOT NULL,
  `no_rangka` varchar(25) NOT NULL,
  `no_polisi` varchar(10) NOT NULL,
  `id_teknisi` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `id_sales` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `admin` int(11) NOT NULL,
  `sts_point` enum('N','Y') NOT NULL DEFAULT 'N',
  `sts_klaim` enum('N','Y') NOT NULL DEFAULT 'N',
  `total_b` int(11) NOT NULL,
  `tek1` varchar(11) NOT NULL,
  `tek2` varchar(11) NOT NULL,
  `tek3` varchar(11) NOT NULL,
  `tek4` varchar(11) NOT NULL,
  `sts_book` enum('Y','N') NOT NULL DEFAULT 'N',
  `booking` int(11) NOT NULL,
  `sts_hapus` enum('Y','N') NOT NULL DEFAULT 'N',
  `tgl_hapus` datetime DEFAULT current_timestamp(),
  `tgl_server` datetime NOT NULL DEFAULT current_timestamp(),
  `tgl_booking` date NOT NULL DEFAULT current_timestamp(),
  `status_bayar` enum('B','T') NOT NULL,
  `tgl_lunas` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_transaksi`
--

INSERT INTO `t_transaksi` (`id`, `nama`, `alamat`, `tlp`, `jns_kendaraan`, `waranti`, `no_rangka`, `no_polisi`, `id_teknisi`, `tgl`, `id_sales`, `diskon`, `admin`, `sts_point`, `sts_klaim`, `total_b`, `tek1`, `tek2`, `tek3`, `tek4`, `sts_book`, `booking`, `sts_hapus`, `tgl_hapus`, `tgl_server`, `tgl_booking`, `status_bayar`, `tgl_lunas`) VALUES
(1, 'ROSALIA SRI HARYANTI QQ. DHANI', 'JL. LUMBU TENGAH V A NO 17 RT 01/02-07 BOJONG', '242424', 'TOYOTA RUST', 'WRT000001', 'MHKE8FB3JKJ002747', '-', 31, '2022-01-20', 34, 1000000, 1, 'Y', 'Y', 2500000, '149', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '0000-00-00', 'B', '0000-00-00 00:00:00'),
(2, 'PT HARBARINDO MEGATAMA', 'JL. TB SIMATUPANG NO 49 RT7/11, JAKARTA', '', 'HONDA MOBILIO', 'WRT000002', 'MHRDD4850LJ900971', '-', 45, '2022-01-22', 155, 0, 1, 'Y', 'Y', 4600000, '148', '', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-02-28', 'B', '0000-00-00 00:00:00'),
(3, 'USWATUN KHASANAH', 'JL. ASELIH NO 155 RT 009/001, CIPEDAK JAGAKARSA', '', 'MITSUBISHI PAJERO', 'WRT000003', 'MK2KRWPNUMJ014338', '-', 36, '2022-01-22', 155, 2250000, 1, 'Y', 'Y', 2250000, '', '', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(4, 'ISTIANTO', 'KOMPLEK TAMAN ARGO SUBUR BLOK R. 07 NO. 04, TANGGERANG', '', 'MITSUBISHI XPANDER', 'WRT000004', 'MK2NCLTATMJ102735', '-', 35, '2022-01-22', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(5, 'ANITA SUGIANTI', 'GRIYA KENARI MAS A3 5 RT 2/ 10 CILEUNGSI KAB BOGOR', '', 'MAZDA 2', 'WRT000005', 'MM6DJHAA6W189588', 'F 1309 PB', 31, '2022-01-24', 155, 1000000, 1, 'Y', 'Y', 2500000, '', '149', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(6, 'EMMA ROSITA. SE', 'DEPOKAN RT. 007 RW.002 PRENGGAN, KOTAGEDE', '', 'HONDA / HR-V RUIN 1.5 E PLUS CVT CKD', 'WRT000006', 'MHRRU1860MJ109482', '-', 59, '2022-01-25', 155, 2400000, 1, 'Y', 'Y', 3100000, '', '149', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(7, 'UTAMI DEWI INDRIYATI', 'KOMP. B P N BLOK A-111/19 RT. 003 RW.007 TONJONG, TAJURHALANG', '', 'HONDA / BRIO RS DD10 1.2 CY CKD 7', 'WRT000007', 'MHRDD1890MJ11075', '-', 18, '2022-01-25', 155, 650000, 1, 'Y', 'Y', 950000, '148', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(8, 'DR. HELENA AFRIYANTI', 'BUARAN KD BESAR RT 02/06 BABAKAN, KOTA TANGGERANG', '82183319150', 'MAZDA CX-5 2.5L AT GT', 'WRT000008', 'JM6KE1032G0326617', 'B 1011 CYF', 37, '2022-01-25', 155, 1700000, 1, 'Y', 'Y', 3300000, '148', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(9, 'INNI ARSYINI', 'CITRAGRAND CLUSTER THE VARDEN BLOK S2 10.51 R JATIKARYA,', '', 'HONDA / CR-VRW1D - 1.51 PRESTIGE CVT CKD', 'WRT000009', 'MHRRW1880MJ106849', '-', 64, '2022-01-25', 155, 2700000, 1, 'Y', 'Y', 4200000, '148', '148', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(10, 'ELSA RIANDA', 'CAWANG II RT08/RW06 KRAMAT JATI JAKTIM', '', 'HONDA ACCORD CM5 VTI AT', 'WRT000010', 'MRHCM56405PO10012', '-', 36, '2022-01-25', 155, 2000000, 1, 'Y', 'Y', 2500000, '148', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(11, 'ADI HARI', 'CITRA GRAND CIBUBUR', '242424', 'MITSUBISHI XPANDER', 'WRT000011', 'MK2NCLTATMJ100389', '-', 31, '2022-01-25', 155, 700000, 1, 'Y', 'Y', 2800000, '150', '148', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(12, 'TOMMY TANAMAL', 'KRANGGAN WETAN RT 001/007, JATIRANGGA, KOTA BEKASI 17434', '', 'TOYOTA AGYA G MT 1.2', 'WRT000012', 'MHKA4GA5JMJ05454', '-', 14, '2022-01-25', 155, 300000, 1, 'Y', 'Y', 700000, '', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(13, 'TAMARA BELINDA LIMBONG', 'BSI BLCK C 6 C 1A RT 02/11 SAWANGAN DEPOK', '', 'HONDA BRIO SATYA 1.2 E CVT ', 'WRT000013', 'MHRDD1850MJ114343', '-', 39, '2022-01-25', 155, 250000, 1, 'Y', 'Y', 4250000, '', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(14, 'IR ERY SETIAWAN, MPM', 'KOTA WISATA', '', 'HONDA HR-V 1.5 E CVT', 'WRT000014', 'MHRRU1860LJ806612', '-', 70, '2022-01-25', 155, 0, 1, 'Y', 'Y', 500000, '', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(15, 'HELMY', 'KOMP POLRI MUNJUL RT 008/003 JAKARTA TIMUR', '', 'ALL NEW AVANZA 1.5 Q CVT', 'WRT000015', 'MHFAB1BY9M0008583', '-', 31, '2022-01-26', 155, 1000000, 1, 'Y', 'Y', 2500000, '', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(16, 'AGUS DENDI ROCHENDI.SSI', '-', '81283348536', 'WULING ALMAZ ', 'WRT000016', 'MK3BAAGA0MJ006570', '-', 32, '2021-09-01', 34, 800000, 1, 'Y', 'Y', 0, '0', '149', '150', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(17, 'DENNY JOHANNURDIN', 'KOMP PORLI MUNJUL RT 1/3 MUNJUL JAKARTA TIMUR', '', 'TOYOTA AVANZA 1.3 G MT', 'WRT000017', 'MHKM5EA3JLK174769', '-', 31, '2022-01-26', 155, 1500000, 1, 'Y', 'Y', 2000000, '148', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(18, 'JULAIKAH', 'JL. MAIRIN RT 001/003 ULUJAMI, PESANGGRAHAN', '', 'HONDA HR-V RU1N 1.5 E PLUS CVT CKD', 'WRT000018', 'MHRRU1860NJ100432', '-', 31, '2022-01-26', 155, 1750000, 1, 'Y', 'Y', 1750000, '148', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(19, 'ANITA SUGIANTI', 'GRIYA KENARI MAS A3 5 RT 2/ 10 CILEUNGSI KAB BOGOR', '', 'MAZDA 2 1.5L SKYACTIVE', 'WRT000019', 'MM6DJHAA6W189588', '-', 59, '2022-01-26', 155, 1000000, 1, 'Y', 'Y', 4500000, '148', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(20, 'EKO YUNIANTO', 'CIBUBUR JAKARTA TIMUR', '', 'MITSUBISHI EXPANDER CROSS', 'WRT000020', '4A9HM9212', '-', 70, '2022-01-26', 155, 0, 1, 'Y', 'Y', 500000, '148', '152', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(21, 'FENDI KURNIAWAN', 'JL. BOTIN RT 007/004, CIPAYUNG, JAKARTA TIMUR', '', 'SUZUKI XL-7 1.5 AT', 'WRT000021', 'MHYANC22MJ124798', '-', 31, '2022-01-26', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(22, 'NURIDA AKHIRUDINA', 'BUKIT GOLF CLUSTER ARCADIA A3/19 RT 001/002 GUNUNG PUTRI BOGOR', '', 'TOYOTA RUSH', 'WRT000022', 'MHKE8FB3JMK058807', '-', 31, '2022-01-26', 155, 1000000, 1, 'Y', 'Y', 2500000, '', '150', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(23, 'DRG RESSY MARTHIA DEWI', 'JL. BANOWATI NO. 642 DIRGANTARA III RT.005/003 HALIM PERDANA KUSUMA', '', 'HONDA CITY HATCHBACK 1.5L RS MT', 'WRT000023', 'MHRGN5780MJ200876', '-', 59, '2022-01-27', 155, 2400000, 1, 'Y', 'Y', 3100000, '148', '151', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(24, 'SYAKIR MUSTAFA', 'MAHOGANY RESIDENCE BLOK J NO.17 RT006/013', '', 'HYUNDAI PALISADE D 2.2 AT SIGNATURE', 'WRT000024', 'KMHR381AMNU411623', '-', 37, '2022-01-27', 155, 2750000, 1, 'Y', 'Y', 2250000, '149', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(25, 'RISKA DWI ARYANI', 'KP. PEUNDEUY RT 003/004 JONGGOL', '', 'HONDA BRIO SATYA 1.2 E CTV', 'WRT000025', 'MHRDD1850NJ100254', '-', 66, '2022-01-28', 155, 1900000, 1, 'Y', 'Y', 4200000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(26, 'RAUDHATUL FADIL', 'RAFLES HILS', '', 'MAZDA 2', 'WRT000026', 'MM6DJZHAALW611688', 'B 1513 VOO', 31, '2022-01-29', 155, 1500000, 1, 'Y', 'Y', 2000000, '148', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(27, 'ANDREAS BUNGARAN NATHANAEL', 'RAFFLES HILLS BLOK EA 2 NO.8', '', 'HONDA BRIO SATYA 1.2 E CVT', 'WRT000027', 'MHRDD1850NJ100767', '-', 30, '2022-01-29', 155, 1500000, 1, 'Y', 'Y', 1500000, '150', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(28, 'PT TRADISI UNTUK SEMESTA', 'RK AUTO CBR POINT BLK B 9 LT 3 ALTERNATIF CIBUBUR', '81295955438', 'TOYOTA ALPHARD 2.5 G AT', 'WRT000028', 'JTNGF3DH5M8033688', 'B 2718 RAZ', 37, '2022-02-01', 155, 1500000, 1, 'Y', 'Y', 0, '150', '0', '149', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(29, 'SUDARTO', 'PERUMAHAN BUKIT PERMAI JL. WILIS D/10 CIBUBUR', '', 'TOYOTA FORTUNER', 'WRT000029', 'MHFAB8GS0M0479549', '-', 32, '2022-02-01', 155, 1500000, 1, 'Y', 'Y', 2500000, '', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(30, 'ELFIANA AYU RISTIANI', 'JL. MAWAR III NO 5 BINTARO JAKARTA SELATAN', '', 'XPANDER CROSS 1.5L PLUS 4X2 AT', 'WRT000030', 'MK2NCXTATMJ103089', '-', 59, '2022-02-01', 155, 2650000, 1, 'Y', 'Y', 2850000, '149', '151', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(31, 'RISMAYUNI ARTHA HUTAHAEN', 'JL. TANJUNG LENGKOK RT. 015 RW 007 BIDARA CINA, JATINEGARA', '', 'HONDA / BR-V 1.5L CVT PRESTIGE HS', 'WRT000031', 'HONDA / BR-V 1.5L CVT PRE', '-', 31, '2022-02-02', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(32, 'SIMON LINGGOM NATHANIEL', 'RAFFLES HILLS LOK EA 2 NO. 8 RT 006/016 CIANGGIS DEPOK', '', 'HONDA BR-V 1.5 L PRESTIGE CVT', 'WRT000032', 'MHRDG3860NJ300640', '-', 31, '2022-02-03', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(33, 'CATUR NUGROHO', 'PRIMAVERA RESIDENCE BLOK L2 NO 37 RT 001/011 DESA BOJONG KEC. KLAPA NUNGGAL', '', 'TOYOTA RUSH 1.5 GR AT', 'WRT000033', 'MHKE8FB3JNK063951', '-', 63, '2022-02-04', 155, 2650000, 1, 'Y', 'Y', 3350000, '150', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(34, 'RAYMOND ANDREAS HUTAPEA', 'LEGENDA WISATA ZONA EINSTEIN R 9/5 NAGRAK GUNUNG PUTRI', '', 'TOYOTA FORTUNER', 'WRT000034', 'MHFAB8GS4N3028771', '-', 64, '2022-02-04', 155, 2950000, 1, 'Y', 'Y', 3950000, '152', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(35, 'SRIVIDOLA WULANDARI', 'JL. RAYA CILANGKAP RT 002/005 CILANGKAP CIPAYUNG', '', 'HONDA BR-V 1.5L PRE CVT', 'WRT000035', 'MHRDG3860NJ300447', '-', 59, '2022-02-04', 155, 2350000, 1, 'Y', 'Y', 3150000, '150', '152', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(36, 'M DIEGA ARMANDA', 'JL DAMAI NO 11 DURI KEPA JAKBAR', '', 'HONDA HR-V 1.5 E CVT', 'WRT000036', 'MHRRU1850MJ104426', 'B 1833 HFE', 31, '2022-02-04', 155, 1500000, 1, 'Y', 'Y', 2000000, '149', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(37, 'MUHAMAD ADAM ZEIN RUSMANA', 'KP GAOK RT 002/001 MUKTIJAYA SETU', '', 'HONDA BRIO RS 1.2 CVT CKD', 'WRT000037', 'MHRDD1890NJ100483', '-', 58, '2022-02-05', 155, 2050000, 1, 'Y', 'Y', 2550000, '149', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(38, 'AVIVA NISYA MANDIRA', 'SUKATANI PERMAI BLOK BB 12 NO.9', '', 'MITSUBISHI PAJERO SPORT 2.4L DAKAR', 'WRT000038', 'MK2KRWPNUMJ003647', 'B 1088 FJF', 70, '2022-02-07', 155, 0, 1, 'Y', 'Y', 500000, '150', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(39, 'HUDANUL HAFIIZH', 'JL. PINDAHAN NO 31 RT04 RW09 PANCORANMAS DEPOK-PANCORAN MAS', '', 'MITSUBHISI XPANDER 1,5L ULTIMATE-L 4X2 A/T', 'WRT000039', 'MK2NCLTATMJ101636', 'B 2735 ZBC', 31, '2022-02-10', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '152', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(40, 'AGUS PRIYATNA DWIYANA', 'CIBUBUR', '8111251273', 'MITSUBISHI PAJERO', 'WRT000040', 'MK2RWPNUMJ007020', '-', 70, '2022-02-11', 155, 0, 1, 'Y', 'Y', 0, '149', '0', '150', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(41, 'JULIA NURRACHMI SH', 'CIBUBUR', '', 'HONDA JAZZ ', 'WRT000041', 'MHRGK5860JJ803839', 'B 2154 SYE', 70, '2022-02-12', 155, 50000, 1, 'Y', 'Y', 450000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(42, 'CHRISTALIQUE SURYAPUTRI', 'JL KASURI RAYA AS4 NO5 KRANGGAN', '', 'KIA SONET', 'WRT000042', 'MZBFC814TNN134690', '-', 31, '2022-02-14', 155, 700000, 1, 'Y', 'Y', 2800000, '149', '149', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(43, 'SURYA MEDIANA', 'JL HIKMAH 1 NO. 120  RT 1/5 CILANGKAP JAKTIM', '', 'MAZDA CX-5', 'WRT000043', 'JM6KE1032G0364340', 'B 1618 KI', 32, '2022-02-14', 155, 1500000, 1, 'Y', 'Y', 2500000, '150', '152', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(44, 'RINA', 'CBD Bintaro Jaya, Blok B7 A5, Jalan Haji R. Rasuna Said No.Kav.04, Pd. Jaya, Kec. Pd. Aren, Kota Tangerang Selatan, Banten 15229', '', 'PAJERO DAKAR 4X2 ', 'WRT000044', 'MK2KRWNUNJ002615', 'B 1173 SSL', 20, '2022-02-14', 155, 700000, 1, 'Y', 'Y', 1700000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(45, 'HELMY', 'KOMP POLRI MUNJUL RT 008/003 JAKARTA TIMUR', '', 'TOYOTA ALPHARD', 'WRT000045', 'JTNGF3DH8L8029679', '-', 70, '2022-02-16', 155, 0, 1, 'Y', 'Y', 500000, '152', '152', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(46, 'HELMY', 'KOMP POLRI MUNJUL RT 008/003 JAKARTA TIMUR', '', 'HONDA BRIO 1.2 E AT CKD', 'WRT000046', 'HARDD1870FJ515854', '-', 18, '2022-02-16', 155, 700000, 1, 'Y', 'Y', 900000, '151', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(47, 'SITI MARPUAH', 'PERUM DE PRATAMA BK C3 NO 19 RT 02/15 JATIRANGGA BEKASI', '-', 'HONDA BR-V 1.5L PRISTAGE CVT', 'WRT000047', 'MHRG3880NJ300470', 'B 2347 KZO', 59, '2022-02-16', 155, 2400000, 1, 'Y', 'Y', 0, '149', '151', '175', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(48, 'DWI NUR PERMATASARI', 'LEGENDA WISATA, DAVINCI T10 NO 35', '', 'HONDA CR-V 1.5 PRESTIGE', 'WRT000048', 'MHRRW1880MJ102211', 'F 1524 FAA', 70, '2022-02-17', 155, 50000, 1, 'Y', 'Y', 450000, '149', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(49, 'RIFKI ADRIANSYAH', 'ARYADUTA TUGU TANI', '', 'HONDA JAZZ RS', 'WRT000049', 'MHRGK5860HJ704716', 'B 1963 RNF', 73, '2022-02-17', 155, 1050000, 1, 'Y', 'Y', -450000, '152', '149', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(50, 'SANJAYA', 'KRANGGAN', '', 'XPANDER', 'WRT000050', 'MK2NCLPANMJ100075', '-', 31, '2022-02-18', 155, 1050000, 1, 'Y', 'Y', 2450000, '150', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(51, 'FAHRUR ROEZI', 'CITRA GRAND CLUSTER BRENTWOOD BLOCK RC 1 NO 5 JATI KARYA, JATISAMPURNA ', '', 'HONDA BR-V DG3 1,5L PRE-HS CVT ', 'WRT000051', 'MHRDG3880NJ300864', 'F 1700 FAH', 59, '2022-02-21', 155, 2400000, 1, 'Y', 'Y', 3100000, '149', '151', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(52, 'SAPTO ARTADI', 'KSATRIAN BRIMOB AMJIATTAK KELAPADUA CIMANGGIS DEPOK', '', 'HYUNDAI PALISADE 2.2', 'WRT000052', 'KMHR381AMNU414135', 'B 1195 SSM', 107, '2022-02-22', 155, 3050000, 1, 'Y', 'Y', 4050000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(53, 'ALIF RAFI BATUBARA ', 'TMN KENARI NUSANTARA MG 3/3 A GUNUNG PUTRI BOGOR', '', 'SUZUKI XL7', 'WRT000053', 'MHYANC22SMJ119523', '-', 31, '2022-02-24', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(54, 'R R KUMALA SARI', 'JL KHUSAERI NO 39 HALIM PERDANA KUSUMA', '', 'HONDA CRV 1.5 PRESTIGE CVT', 'WRT000054', 'MHRRW1880NJ250110', '-', 41, '2022-02-26', 155, 1500000, 1, 'Y', 'Y', 4500000, '152', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(55, 'DEMETERIUS FERDINAN IMANUEL YUPOUKONI', 'LEGENDA WISATA', '', 'HONDA BR-V', 'WRT000055', 'MHRDG3860NJ301761', '-', 19, '2022-02-26', 155, 650000, 1, 'Y', 'Y', 1350000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(56, 'DARMAWATI', 'jl. pedati no.5 rt.006/009 kel.rawa bungan kec jatinegara jakarta timur', '', 'TERIOS X MT', 'WRT000056', 'MHKG68FAIJNK023614', '-', 35, '2022-02-27', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(57, 'MUHAMAD ALI PAHMI', 'KP BLOK SEK JL CEMAT ENJAN 4 RT3/10 CILEUNGSI KAB BOGOR', '', 'SUZUKI XL7 4X2 AT', 'WRT000057', 'MHYANC22SMJ124689', '-', 31, '2022-02-28', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(58, 'KUNKUN KURNIADI', 'PERUMAHAN CIKARANG PARK JL. CEMARA BLOK AH NO.10', '', 'SUZUKI XL 7 GX AT', 'WRT000058', 'MHYANC22SKJ1116111', '-', 70, '2022-03-01', 155, 0, 1, 'Y', 'Y', 500000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(59, 'ALIF FAJAR', 'CIBUBUR', '', 'MITSUBISHI XPANDER SPORT', 'WRT000059', 'MK2NCWPARJJ007516', 'B 2128 TZZ', 31, '2022-03-03', 155, 1400000, 1, 'Y', 'Y', 2100000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(60, 'FAISAL STYOWADI', 'JL PEPAYA RAYA RT4/16 JJAKARTA UTARA', '', 'XPANDER ULTIMATE 4X2 AT', 'WRT000060', 'MK2NCWPARJJ007516', 'B 2128 TZZ', 63, '2022-03-05', 155, 3300000, 1, 'Y', 'Y', 2700000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(61, 'IKBAL DWI SAPUTRA', 'APARTEMEN PANCORAN RIVORSET', '', 'TOYOTA VIOS 1.5 G AT', 'WRT000061', 'MR2BT9F3201052115', 'B 1639 WBD', 15, '2022-03-05', 155, 0, 1, 'Y', 'Y', 1200000, '151', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(62, 'RIZQI FAUZAN', 'GRIYA CITAYEM PERMAI II', '', 'HONDA CR-V 1.5  PRESTIGE', 'WRT000062', 'MHRRW1880MJ100384', 'B 49 EUR', 70, '2022-03-05', 155, 0, 1, 'Y', 'Y', 500000, '150', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(63, 'DIAN KUSUMAWATI', 'JL. TIPAR KP ASEM RT 002/007 PEKAYON, PASAR REBO', '', 'HONDA HRV 1.5 E PLUS CVT', 'WRT000063', 'MHRRU1860NJ100600', 'B 2244 TKT', 67, '2022-03-07', 155, 2200000, 1, 'Y', 'Y', 5300000, '149', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(64, 'M MUFRAIL', 'LEWINANGGUNG DEPOK', '', 'HONDA BR-V 1.5L PRESTIGE CVT', 'WRT000064', 'MHRD63860NJ301818', 'B 191 JJA', 31, '2022-03-08', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(65, 'IRA EMILIA', 'BUKIT CIMANGGIS CITY HILLS PARK VIEW BLOK EE 7/15 BOGOR', '', 'MITSUBISHI PAJERO', 'WRT000065', 'MMBGUKR10KH017627', '-', 70, '2022-03-08', 155, 0, 1, 'Y', 'Y', 500000, '148', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(66, 'RATNA DEWI DHARMAYANTI', 'PERUM RAFFLEES HILLS BLOK E3 NO 06 ', '', 'HYUNDAI PALISADE 2.2 AT SIGNATURE', 'WRT000066', 'KMHR381AMNU426498', '-', 37, '2022-03-09', 155, 2750000, 1, 'Y', 'Y', 2250000, '148', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(67, 'MUMINAH', 'JL MURAI 14 BLOK H 31 NO 16 KEL. CIMUNING, MUSTIKA JAYA', '', 'HR-V 1.5 E CVT PLUS CKD', 'WRT000067', 'MHRRU1860N100551', '-', 31, '2022-03-09', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '149', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(68, 'SUHERMAN', 'KRANGGAN WETAN RT 001/007 KEL. JATIRANGGA KEC. JATISAMPURNA KOTA BEKASI', '', 'WULING CORTEZ', 'WRT000068', 'MK3AAAGA3MJ012455', 'B 2170 SRT', 41, '2022-03-12', 155, 1300000, 1, 'Y', 'Y', 4700000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(69, 'OLAFIAN FARENZA OKIANDI', 'JL BUNI GG CEMARA NO 52 JAKARTA TIMUR', '', 'TOYOTA FORTUNER', 'WRT000069', 'MHFAB8GS8M0476043', '-', 70, '2022-03-12', 155, 0, 1, 'Y', 'Y', 500000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(70, 'NELIH BIN BIAN', 'KRANGGAN WETAN RT 001/008 JATIRANGGA JATISAMPURNA KOTA BEKASI', '81318990496', 'HONDA CIVIC 1.5TC RS CVT', 'WRT000070', 'MRHFE1680NP290296', '-', 59, '2022-03-16', 155, 1700000, 1, 'Y', 'Y', 0, '0', '151', '148', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(71, 'DENNY ADRIAN PATTIKAWA', 'LENTENG AGUNG NO.7  JAKSEL', '', 'HONDA HRV 1.5 CVTCKD', 'WRT000071', 'MHRRU1850HJ705013', '-', 31, '2022-03-16', 155, 1050000, 1, 'Y', 'Y', 2450000, '149', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(72, 'FITRI AMALIA SE', 'JL. H WAHID NO 19, CIGAJUR JAGAKARSA, JAKARTA SELATAN', '', 'MITSUBISHI XPANDER CROSS ', 'WRT000072', 'MK2NCXTATAMJ104077', '-', 31, '2022-03-17', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(73, 'JOHAN NARSHA', 'MANGGIFERA RESIDENCE KAV 8 JL SD LAMA PONDOK RANGGON CIPAYUNG', '', 'HONDA BR-V 1.5 PRESTIGE CVT', 'WRT000073', 'MHRDG3880NJ301476', '-', 59, '2022-03-18', 155, 2400000, 1, 'Y', 'Y', 3100000, '149', '151', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(74, 'PRANTIANA', 'JL MARTAPURA III TANAG ABANG JAKARTA PUSAT', '', 'MITSUBISHI XPANDER CROSS', 'WRT000074', 'MK2NCXTATNJ000819', '-', 19, '2022-03-18', 155, 1650000, 1, 'Y', 'Y', 350000, '148', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(75, 'PUTUT TRI NUGROHO', 'DUTA MEKAR SARI BLOK M3/17 CILEUNGSI BOGOR', '', 'SUZUKI XL7', 'WRT000075', ' MHYANC22SNJ100971', 'F1886FAI', 19, '2022-03-19', 155, 200000, 1, 'Y', 'Y', 1800000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(76, 'ASEP JUHANA IRAWAN', 'KOMP PORLI MUNJUL', '', 'HONDA CIVIC 1.5 RS CVT', 'WRT000076', 'MRHFE1680NP290172', '-', 32, '2022-03-21', 155, 1500000, 1, 'Y', 'Y', 2500000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(77, 'ANAM', 'KRANGGAN LEMBUR', '', 'TOYOTA INNOVA 2.0 G', 'WRT000077', 'MHFJW8EM0G2318250', 'B 2233 KMG', 32, '2022-03-23', 155, 1500000, 1, 'Y', 'Y', 2500000, '149', '152', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(78, 'IRWAN SAEPULLAH', 'ILRUBY BLOK XIMG TJIP RT.003 RW.01z JATISARI JATIASIH', '', 'HONDA / BR-V DG3 1 5L PRE CVT', 'WRT000078', 'MHRDG3860NJ301640', '-', 59, '2022-03-23', 155, 2450000, 1, 'Y', 'Y', 3050000, '149', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(79, 'HERMAN', 'RUSUN BLOK A T.3 NO.17', '', 'XPANDER ULTIMATE  ', 'WRT000079', 'MK2NCLTATNJ002927', '-', 40, '2022-03-24', 155, 800000, 1, 'Y', 'Y', 4700000, '148', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(80, 'BUYUNG UDAYANA PUTRA', 'JLN RAFLESIA H4 ', '', 'TOYOTA RUSH 1.5 G AT', 'WRT000080', 'MHKE8FB2JNK012556', 'B 1974 KYI', 31, '2022-03-24', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(81, 'SUKANTO', 'JL. MANGGA BLOK A GG II/6', '', 'MITSUBISHI XPANDER 1.5L ULT 4X2 AT', 'WRT000081', 'MK2NCLTATNJ002446', '-', 35, '2022-03-25', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '149', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(82, 'SUKANTO', 'JL. MANGGA BLOK A GG II/6', '', 'MITSUBISHI PAJERO SPORT 2.4 DAKAR 4X4 AT', 'WRT000082', 'MMBGUKS10GH008338', 'B 2047', 36, '2022-03-25', 155, 2500000, 1, 'Y', 'Y', 2000000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(83, 'DARWANTORO', 'JL SUCI RT9/3 SUSUKAN JAKTIM', '', 'RUSH 1.5S AT', 'WRT000083', 'MHRE8FB3JMK048735', 'B 2389 TRL', 31, '2022-03-25', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '150', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(84, 'ANDREAS HASINTONGAN S.', 'JL. MERANTI V BLOK A2 NO. 26', '', 'TOYOTA AGYA 1.2 G A/T', 'WRT000084', 'MHKA4GB5JNJ048151', '-', 66, '2022-03-26', 155, 1900000, 1, 'Y', 'Y', 4200000, '149', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(85, 'DRG. RAMIDA PANGARTBUAN', 'PERUM MUTTARA BARU 12 SEPANJANG JAVA BKS', '', 'HONDA BR-V DG3 1 5L', 'WRT000085', 'HHRDG3880NJ301310', '1', 67, '2022-03-26', 155, 2200000, 1, 'Y', 'Y', 5300000, '149', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(86, 'SUSILO EDI JAHJONO, SE', 'KAMPUNG UTAN RT 015/005', '', 'WULING ALMAZ', 'WRT000086', 'MK3BAAGA4MJ005633', '-', 36, '2022-03-26', 155, 2250000, 1, 'Y', 'Y', 2250000, '150', '152', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(87, 'BIESI DWI KUSWAYANI', 'PERUMAHAN VILA INDAH PAJAJARAN, JL AIRLANGGA NO 18', '', 'BMW X1', 'WRT000087', 'MHH36AA08MKA00515', 'F 81 SI', 31, '2022-03-28', 155, 500000, 1, 'Y', 'Y', 3000000, '150', '150', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(88, 'WIDYO ARI NUGROHO', 'MOH KAFI II /28 RT 2/8 JAGAKARSA', '', 'NISSAN KICK', 'WRT000088', 'MNTFAEP15L6000123', 'B 1228 WK', 31, '2022-03-28', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(89, 'SASONGKO SABDO NUGROHO', 'JL. KELAPA DUA WETAN ', '', 'TOYOTA INNOVA 2.4 Q AT', 'WRT000089', 'MHFAB3EM4G0003638', '-', 32, '2022-03-29', 155, 0, 1, 'Y', 'Y', 4000000, '149', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(90, 'C KURNIWATI ADJI', 'JL PUYUH TIMUR VIII BLOK EG 9/10', '', 'SUZUKI XL 7', 'WRT000090', 'HYANC22SNJ04924', '-', 19, '2022-03-29', 155, 400000, 1, 'Y', 'Y', 1600000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(91, 'GUNAWAN', 'GG GLATINA  RT 014/007  TANAH ABANG JAKARTA PUSAT', '', 'TOYOTA VOXY 2.0 CVT ', 'WRT000091', 'JTNAAAAA0N7000637', '-', 36, '2022-03-29', 155, 2250000, 1, 'Y', 'Y', 2250000, '150', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(92, 'SUKANTO', 'JL. MANGGA BLOK A GG II/6', '', 'TOYOTA INNOVA VENTURER', 'WRT000092', 'HFAB3EM1M0017735', 'B 777 GRI', 36, '2022-03-30', 155, 2400000, 1, 'Y', 'Y', 2100000, '149', '151', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(93, 'IMRON', 'AMPERA RAYA GG KANCIL NO 32', '', 'HYUNDAI STERIA', 'WRT000093', '29152', 'B 3 ALA', 37, '2022-03-31', 155, 2250000, 1, 'Y', 'Y', 2750000, '149', '149', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(94, 'DHANNY KUSUMAWARDHANA, ST', 'CITRA GRAND CIBUBUR', '', 'HONDA CRV PRESTIGE 1.5 ', 'WRT000094', 'MHRRW1880MJ100828', '-', 70, '2022-04-01', 155, 50000, 1, 'Y', 'Y', 450000, '150', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(95, 'HAJI TEDDY', 'KRANGGAN GARY', '', 'HONDA CR-V', 'WRT000095', 'MHRRW1880NJ250261', '-', 64, '2022-04-02', 155, 2400000, 1, 'Y', 'Y', 4500000, '148', '152', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(96, 'JATMAKA ', 'GRIYA BUKIT JAYA CLUSTER XIENNA O.3 NO. 05', '', 'HONDA BR-V 1.5L PRESTIGE HS CVT', 'WRT000096', 'MHRDG3880NJ302553', '-', 77, '2022-04-02', 155, 3000000, 1, 'Y', 'Y', 100000, '148', '151', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(97, 'ZULHAN EFENDY HASIBUAN', 'JL PULE NO A1 RABUTAN CIRACAS', '', 'MITSUBISHI PAJERO', 'WRT000097', 'MK2KRWPNUNJ003935', '-', 36, '2022-04-04', 155, 2250000, 1, 'Y', 'Y', 2250000, '152', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(98, 'TONI', 'DEPOK', '', 'HYUNDAI CRETA PRIME 1.5 ', 'WRT000098', 'MF3PE812TNJ002525', 'B 1557 SSP', 31, '2022-04-04', 155, 1050000, 1, 'Y', 'Y', 2450000, '149', '149', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(99, 'YUDHI PUTRA EKA YURI', 'BUMI MUTIARA BLOK JH 3/5 RT.005 RW.035 Tanggal 04-04-2022 No. SPK 22CIM00155 BOJONG KULUR, GUNUNG PUTRI', '', 'HONDA / HR-V RV3B 1.5L E CVT', 'WRT000099', 'MHRRV3850NJ200023', '-', 31, '2022-04-04', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '150', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(100, 'DR NUGROHO BUDI UTOMO', 'JL. MASJID AL HIDAYAH NO 7 PASAR MINGGU', '', 'HONDA HR-V 1.5 SE CVT', 'WRT000100', 'MHRRV3870NJ200539', '-', 59, '2022-04-06', 155, 2350000, 1, 'Y', 'Y', 3150000, '149', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(101, 'SASUDIN', 'CIBUBUR', '', 'MITUSBISHI PAJERO DAKAR ULTIMATE', 'WRT000101', 'MK2KRWFNUNJ000655', '-', 36, '2022-04-07', 155, 2250000, 1, 'Y', 'Y', 2250000, '152', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(102, 'OKKY BUDIMAN NAHARI', 'JLN MG BESAR 1X/111/II TAMAN SARI', '', 'HONDA HR-V 1.5 SE CVT', 'WRT000102', 'MHRRV3870NJ200268', '-', 59, '2022-04-07', 155, 2350000, 1, 'Y', 'Y', 3150000, '150', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(103, 'DRG DONA ANGELICA E, SP', 'BUMI MUTIARA RT 003/035', '', 'HYUNDAI CRETA PRIME + BLACK ROOF | PUTIH', 'WRT000103', 'MF3PE812TNJ008353', '-', 35, '2022-04-07', 155, 2000000, 1, 'Y', 'Y', 2000000, '152', '152', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(104, 'MUHAMMAD SAIFUL', 'KP. KALIJAMBE RT 002/004, TAMBUN BEKASI SELATAN', '', 'MITSUBISHI PAJERO DAKAR 4X2', 'WRT000104', 'K2KRWPNUNJ005215', '-', 32, '2022-04-07', 155, 2250000, 1, 'Y', 'Y', 1750000, '152', '152', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(105, 'LILI HOLILUDIN', 'CITRA VILA BLOK K 12/14', '', 'MITSUBISHI PAJERO DAKAR 4X2', 'WRT000105', 'MK2KRWPNUNJ004786', '-', 36, '2022-04-07', 155, 2250000, 1, 'Y', 'Y', 2250000, '152', '150', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(106, 'DECA MEDIANA DJOHAN', 'KP. TLAJUNG RT 001/006 , GUNUNG PUTRI', '', 'HONDA BRIO', 'WRT000106', 'MHRDD1850NJ101872', '-', 30, '2022-04-08', 155, 1500000, 1, 'Y', 'Y', 1500000, '150', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(107, 'HERMANSYAH', 'JL PEBANGUNAN RT 001/006, KELAPA DUA WETAN', '', 'MITSUBISHI XPANDER', 'WRT000107', 'MK2NCXPANNJ000573', '-', 31, '2022-04-12', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(108, 'FRANSISUS VIDYA M.P', 'BUKIT GOLF LAVENDER BLOK GG A/3A', '', 'HYUNDAI CRETA', 'WRT000108', 'MF3PE812TNJ006190', '-', 79, '2022-04-13', 155, 1250000, 1, 'Y', 'Y', 2150000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(109, 'MUHAMMAD FARISAL MUFID', 'METLAND CILEUNGSI SEKTOR 6 BLOK FD 1 NO.11', '81291101535', 'MITSUBISHI XPANDER ULTIMATE', 'WRT000109', 'MK2NCLTATNJ004593', 'B 103 PJI', 35, '2023-04-03', 155, 2000000, 1, 'Y', 'Y', 0, '149', '0', '0', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(110, 'SANDRA', 'CITRA GRAND BLOK A1 NO.2 CLUSTER NUSADUA', '', 'TOYOTA ALTIS', 'WRT000110', 'MR2BU3BE760009642', 'B 1553 KAD', 31, '2022-04-14', 155, 1100000, 1, 'Y', 'Y', 2400000, '152', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(111, 'NOVIAN BERNEO PUTERA', 'JL BHP RAYA BLK DD NO 11 KRAMAT JATI JAKARTA TIMUR', '', 'MG MAGINFY', 'WRT000111', 'MMLW74E69G032426', '-', 70, '2022-04-15', 155, 0, 1, 'Y', 'Y', 500000, '150', '150', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(112, 'BUDI RAHARJO', 'PANORAMA RESIDENCE BLOK B/9 JL RAYA MUNJUL', '', 'TOYOTA INNOVA', 'WRT000112', 'MHFAW8EM7NO220969', 'B 272 DAZ', 20, '2022-04-16', 155, 150000, 1, 'Y', 'Y', 2250000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(113, 'ADAM SUTANTO', 'JL. P MANDIRI', '', 'WULING ALMAZ 1.5 T RS PRO', 'WRT000113', 'MK3BAAGA1MJ007338', '-', 36, '2022-04-19', 155, 2300000, 1, 'Y', 'Y', 2200000, '152', '149', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(114, 'EDI PURWANTO', 'ASANA RESUDENCE BLOK M52', '', 'TOYOTA RUSH GR', 'WRT000114', 'MHKE8FA3JNK071264', 'B 1184 EZG', 31, '2022-04-19', 155, 1000000, 1, 'Y', 'Y', 2500000, '149', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(115, 'SONGKO PURNOMO', 'BOGOR RAYA PERAI FA1 NO 02 RT 001/011 BOGOR BARAT', '', 'NISSAN SERENA', 'WRT000115', 'C24A6565', '-', 33, '2022-04-20', 155, 2250000, 1, 'Y', 'Y', 2250000, '148', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(116, 'KEVIN YUDHA PRATAMA', 'METLAND TRANSYOGI CLUSTER EBONI BLK EB 29 CILEUNGSI KAB BOGOR', '', 'MITSUBISHI PAJERO SPORT DAKAR 4X2', 'WRT000116', 'MK2KRWPNUNJ005774', '-', 32, '2022-04-21', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '149', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(117, 'MERIELLE NABILA PUTRI SETIAWAN LATIEF', 'KOMP BNI 46 / PLN NO.9 WIJAYA KUSUMA GROGOL / 0811802090', '', 'HONDA / CITY HATCHBACK 1.5 RC CVT', 'WRT000117', 'MHRGN5880NJ203557', '-', 63, '2022-04-21', 155, 2350000, 1, 'Y', 'Y', 3650000, '150', '150', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(118, 'PT ANEKA MANDIRI SEJAHTERA', 'JL PERSINGGAHAN NO.1 BLOK A KAV 261 JAKARTA TIMUR / 081284024445', '', 'HONDA CIVIC 1.5 RS CVT', 'WRT000118', 'MRHFE1680NP290312', '-', 64, '2022-04-21', 155, 2900000, 1, 'Y', 'Y', 4000000, '152', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(119, 'SOBRI', 'PRM RAJANG ASRI BLOK G ', '', 'TOYOTA AVANZA VELOZ', 'WRT000119', 'MMKM1CA4JEK084589', 'A 1175 ZB', 23, '2022-04-23', 155, 24000, 1, 'Y', 'Y', 1376000, '148', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(120, 'MUNIROH', 'KP TEGAL RT 19 RW 6, KEMBANGAN, KLAPANUNGGAL BOGOR', '', 'TOYOTA AVANZA 1.3 G MT', 'WRT000120', 'MHK5EA3JHK079670', 'F 1627 PY', 15, '2022-04-25', 155, 350000, 1, 'Y', 'Y', 850000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(121, 'IIS AGISTIWATI', 'KOPM DEPNAKER BLOK B2 NO 84', '', 'HONDA BR-V 1.5L PRE-HS CVT', 'WRT000121', 'MHRDG3880NJ303003', '-', 59, '2022-04-26', 155, 2400000, 1, 'Y', 'Y', 3100000, '148', '149', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(122, 'RIZKI FITRIANA', 'KOTA WISATA HACIENDA HEIGHTS BLOK SE 3 NO.10', '', 'HONDA CR-V 1.5 CVT', 'WRT000122', 'MHRRW184NJ200228', '-', 41, '2022-04-27', 155, 1650000, 1, 'Y', 'Y', 4350000, '151', '151', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(123, 'TRWANSJAH', 'PRM PESONA VISTA MEKARSARI BLK E1', '', 'TOYOTA VELOZ 1.5 Q CVT', 'WRT000123', 'MHFAB1BY6N0016383', 'F 1133 FAJ', 19, '2022-04-27', 155, 0, 1, 'Y', 'Y', 2000000, '151', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(124, 'AMELIA CHRISNA DAMAYANTI', 'LEGENDA WISATA ZONA NAPOLION E2 NO.27', '', 'HONDA ACCORD 1.5TC EL CVT', 'WRT000124', 'MRHCV1650NP290118', 'B 1706 SSJ', 32, '2022-04-27', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(125, 'ASEP SUHENDAR', 'PERUM UKUH JAMRUD BLOK J8 NO 11 CIMUNING USTIKA JAYA', '', 'WULING ALMAZ', 'WRT000125', 'MK3BAAGAXMJ006446', '-', 32, '2022-04-28', 155, 1000000, 1, 'Y', 'Y', 3000000, '149', '149', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(126, 'DEVI NORA', 'VILLA MUTIARA CIBUBUR 1 BLOK G NO.3', '', 'HONDA CR-V 1.5 PRESTIGE CVT', 'WRT000126', 'MHRRW188NJ200756', '-', 20, '2022-04-28', 155, 700000, 1, 'Y', 'Y', 1700000, '148', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(127, 'NURAINAH', 'KOMP PORLI BLOK D 40 JATIRANGGA JATISAPURNA', '', 'TOYOTA RUSH 1.5 S AT', 'WRT000127', 'MHKE8FB3JJK010175', 'B 2667 KKQ', 31, '2022-04-28', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(128, 'YUNI KURNIA PUTRI', 'KOTA WISATA COATESVILLE BLOK SC 8/9', '', 'HONDA CR-V 1.5 TC PRESTIGE', 'WRT000128', 'MHRRW1880NJ201972', '-', 20, '2022-04-28', 155, 800000, 1, 'Y', 'Y', 1600000, '151', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(129, 'BIANCA MARYAM RAHMASANI', 'JL GANDARIA III NO 92', '', 'MITSUBISHI XPANDER ULTIMATE 1.5L', 'WRT000129', 'MK2NCLTATNJ005613', '-', 31, '2022-05-12', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(130, 'GUNAWAN IKSAN', 'NEGLASARI II NO 107', '', 'INNOVA VENTURER 2.4 AT', 'WRT000130', 'MHFAB3EM4J0009589', 'D 1589 AMI', 36, '2022-05-12', 155, 2050000, 1, 'Y', 'Y', 2450000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(131, 'PENDI KURNIAWAN', 'JL BOTIN RT 007/004 CIPAYUNG JAKARTA TIMUR', '', 'SUZUKI XL-7 1.5 AT', 'WRT000131', 'MHYANC22MJ124798', '-', 70, '2022-05-12', 155, 0, 1, 'Y', 'Y', 500000, '148', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(132, 'TJHIN VIVI', 'JL PADEMANGAN II GG. 19/36', '', 'TOYOTA VELOZ', 'WRT000132', 'MHFAB1BYXN0016564', 'B 2912 OZR', 19, '2022-05-12', 155, 400000, 1, 'Y', 'Y', 1600000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(133, 'FERDY SEPTIANSYAH', 'JL PALEM  KARTIKA III NO 48', '', 'MITSUBISHI XPANDER', 'WRT000133', 'MK2NCLTATNJ003153', '-', 31, '2022-05-12', 155, 350000, 1, 'Y', 'Y', 3150000, '150', '149', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(134, 'AGUNG', 'JL MATRAMAN LEBAK NO 14', '', 'HONDA CR-V 2.0 AT', 'WRT000134', 'HRRM1830DJDJ4003202', 'F 1215 EB', 20, '2022-05-14', 155, 400000, 1, 'Y', 'Y', 2000000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(135, 'LUCIA NAULIA SIMBOLON QQ. TONGAM', 'JL HJ LEBAR KV DKI 154', '', 'TOYOTA INNOVA 2.0 G AT', 'WRT000135', 'MHFJW8EM2H333298', 'B 2873 BOO', 32, '2022-05-16', 155, 1200000, 1, 'Y', 'Y', 2800000, '150', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(136, 'SAFITRI NUR RAHAYU', 'JL SIAGA NO.4-K  RT3/13 HALIM PK', '', 'HONDA CR-V PRESTIGE CVT', 'WRT000136', 'MHRRW1880NJ250257', 'B 1075 TJY', 32, '2022-05-16', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(137, 'DEVYANTY', 'JL H ICANG NO 18 LENTENG AGUNG, JAKARTA SELATAN', '', 'MITSUBISHI XPANDER 1.5L SPORT 4X2 AT', 'WRT000137', 'MK2NCLPATNJ000359', '-', 35, '2022-05-17', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '150', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(138, 'DONNY TRI F', 'KOMP BPP JL TELUK GILIMANUK BLOK P NO 7 SUKAPURA CILINCING', '', 'MITSUBISHI PAJERO DAKAR 4X2 AT', 'WRT000138', 'MK2KRWPNUNJ005690', '-', 20, '2022-05-17', 155, 700000, 1, 'Y', 'Y', 1700000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(139, 'ALBINA QQ NICO', 'PERUM JATIJAJAR D13 NO 16 RT. RW 03.014 TAPOS DEPOK', '', 'HONDA CRV 1.5 TC PRESTIGE', 'WRT000139', 'MHRRW1880HJ806203', 'B 1635 EJD', 32, '2022-05-18', 155, 1000000, 1, 'Y', 'Y', 3000000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(140, 'SITI HARDIYANTI', 'JL GUMIN MAIH RT 002/017', '', 'MITSIBISHI XPANDER AT / PUTIH', 'WRT000140', 'MK2NCLTATNJ005894', '-', 19, '2022-05-21', 155, 1650000, 1, 'Y', 'Y', 350000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(141, 'WAHYU HIDAYAT', 'KP RAWA BEBEK RT 003/010 KOTA BEKASI', '', 'HONDA BRIO RS URBANITE 1.2 MT CKD / YELLOW', 'WRT000141', 'MHRDD1790NJ250003', 'B 1288 KJQ', 39, '2022-05-21', 155, 1100000, 1, 'Y', 'Y', 3400000, '150', '152', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(142, 'DIDI PAMUNGKAS', 'CITRAGRAND CIBUBUR', '242424', 'MITASUBISHI PAJERO', 'WRT000142', 'MK2KRWPNUMJ002639', '-', 70, '2022-05-24', 155, 0, 1, 'Y', 'Y', 500000, '149', '151', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(143, 'NINDYA PUTRI DINANTY', 'JL BUNI RT 001/004 MUNJUL CIPAYUNG', '', 'HONDA BR-V', 'WRT000143', 'MHRDG3860NJ303112', '-', 31, '2022-05-24', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(144, 'DHIAN RAHMAD INFANTOKO', 'JL CENDRAWASIH 8 N GC-2 HALIM PERDANA KUSUMA', '', 'MITSUBISHI PAJERO SPORT 2.4L DAKAR 4X2 AT', 'WRT000144', 'MK2KRWPNUNJ006684', '-', 36, '2022-05-24', 155, 2250000, 1, 'Y', 'Y', 2250000, '150', '149', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(145, 'M FADHIL FACHRIANSYAH', 'JAGAKARSA PALACE JL JAGAKARSA 1 NO 18-H JAKARTA SELATAN', '', 'MITSUBISHI PAJERO SPORT', 'WRT000145', 'MK2KRWPNUHJ005528', '-', 36, '2022-05-24', 155, 2250000, 1, 'Y', 'Y', 2250000, '149', '148', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(146, 'AGUNG WUGARA', 'JL MATRAMAN LEBAK NO 14 ', '', 'TOYOTA INNOVA', 'WRT000146', 'MHFJW8EM4H2331116', 'F 1376 CD', 20, '2022-05-26', 155, 600000, 1, 'Y', 'Y', 1800000, '148', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(147, 'RIRIN AGUSTIN WUANDARI', 'CITRAGRAND CIBUBUR', '', 'HONDA HRV ', 'WRT000147', 'MHRRU1860KJ805238', '-', 70, '2022-05-26', 155, 0, 1, 'Y', 'Y', 500000, '148', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(148, 'EDY PURNAMA', 'RAFLES HILS', '', 'HYUNDAI PALISADE BLACK', 'WRT000148', 'KMHR381AMNU457391', 'B 1197 SSK', 37, '2022-05-26', 155, 2500000, 1, 'Y', 'Y', 2500000, '149', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(149, 'ROCHMATUN', 'PANGKALAN JATI NO 35 RT 002/009 CIPINANG MELAYU MAKASAR', '85260063485', 'HONDA BR-V 1.5 L PRE-HS CVT', 'WRT000149', 'MHRDG3880NJ302636', '-', 67, '2022-05-27', 155, 2200000, 1, 'Y', 'Y', 5300000, '148', '148', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(150, 'ANNA YUNIASTUTI', 'PONDOK RANGGON', '', 'TOYOTA INNOVA', 'WRT000150', 'MHFGW8EM3H1014329', '-', 70, '2022-05-27', 155, 0, 1, 'Y', 'Y', 500000, '152', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(151, 'JUMRAN', 'PERUM GRAHA MUSTIKA EDIA 009 LUBANG BUAYA SETU BEKASI', '', 'HYUNDAI CRETA PRIME 1.5 DUAL TONE', 'WRT000151', 'MF3PE812TNJ015911', '-', 35, '2022-05-27', 155, 2200000, 1, 'Y', 'Y', 1800000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(152, 'PETERS JACKEY', 'RAFFLES HILS BLOK L7 NO 10', '', 'HONDA CR-V PRESTIGE CVT / 2017', 'WRT000152', 'MHRRW1880HJ808279', 'B 1388 BJG', 80, '2022-05-28', 155, 1200000, 1, 'Y', 'Y', 2700000, '148', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(153, 'ALBINA', 'PERUM JATIJAJAR BLOK', '', 'MG HS I-SMART', 'WRT000153', 'MMLAA42267MG032103', '-', 31, '2022-05-28', 155, 1000000, 1, 'Y', 'Y', 2500000, '150', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(154, 'DRG WELLY APRIYODA', 'JL KIARA ENDANG NO 69 BOJONG KULUR, GUNUNG PUTRI', '', 'SUZUKI XL7 AT 2022', 'WRT000154', 'MHYANC22SNJ107752', '-', 59, '2022-05-30', 155, 2400000, 1, 'Y', 'Y', 3100000, '149', '151', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(155, 'KEZIA ADINDA', 'KP KEBANTENAN RT 001/010 JATISARI, JATIASIH', '', 'HONDA CITY HATCHBACK 1.5 RS CVT', 'WRT000155', 'MHRGN5880NJ200136', '-', 59, '2022-05-30', 155, 2350000, 1, 'Y', 'Y', 3150000, '150', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(156, 'FITRIANA PURWANDARI', 'PERMATA PURI 3 BLOK A NO.29 RT 007/010, MEKARSARI, CIMANGGIS', '', 'HONDA HR-V 1.5L SE CVT', 'WRT000156', 'MHRRV3870NJ201160', '-', 31, '2022-05-31', 155, 1750000, 1, 'Y', 'Y', 1750000, '152', '149', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(157, 'ANA YUNANTI, AMD', 'KP PONDOK RANGGON ', '', 'HYUNDAI CRETA TREND 1.5 ', 'WRT000157', 'MF3PB812TNJ016245 ', '-', 35, '2022-05-31', 155, 2200000, 1, 'Y', 'Y', 1800000, '150', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00');
INSERT INTO `t_transaksi` (`id`, `nama`, `alamat`, `tlp`, `jns_kendaraan`, `waranti`, `no_rangka`, `no_polisi`, `id_teknisi`, `tgl`, `id_sales`, `diskon`, `admin`, `sts_point`, `sts_klaim`, `total_b`, `tek1`, `tek2`, `tek3`, `tek4`, `sts_book`, `booking`, `sts_hapus`, `tgl_hapus`, `tgl_server`, `tgl_booking`, `status_bayar`, `tgl_lunas`) VALUES
(158, 'GRACE CHRISTINE', 'KP PANCOR MAS NO 30 DEPOK', '', 'PAJERO SPORT 2.4L', 'WRT000158', 'MK2KRWFNUNJ001457', 'B 1815 ZJC', 60, '2022-06-03', 155, 2700000, 1, 'Y', 'Y', 3700000, '149', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(159, 'BILY TEGUH KURNIAWAN', 'JL PENDOWO GG H ASINUN DEPOK', '', 'MITSUBISHI XPANDER 1.5L ULTIMATE', 'WRT000159', 'MK2NCLTATNJ008304', '-', 31, '2022-06-03', 155, 1750000, 1, 'Y', 'Y', 1750000, '151', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(160, 'DIAH DETHRIAN', 'JL RUKEM 1 No 4 RAWA MANGUN JAKARTA TIMUR', '', 'XPANDER CROSS', 'WRT000160', 'MK2MCXTATNJ001661', '-', 59, '2022-06-03', 155, 2400000, 1, 'Y', 'Y', 3100000, '149', '148', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(161, 'AMAR SETIADI', 'BLOK DUKU RT 07/10 CIBUBUR', '', 'TOYOTA YARIS 1.5 S AT', 'WRT000161', 'MR054HY91D4704041', 'B 1301 BRM', 30, '2022-06-03', 155, 1000000, 1, 'Y', 'Y', 2000000, '150', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(162, 'IROSA EKO WAHYUDI', 'PERUM BINTANG METROPOL BEKASI', '', 'HYNDAI CRETA PRIME', 'WRT000162', 'MF3PE812TNJ012051', '-', 19, '2022-06-04', 155, 650000, 1, 'Y', 'Y', 1350000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(163, 'DESI RATNASARI', 'KP. MANGGA DUA RT 003/001 SUKADAMAI DRAMAGA', '', 'HONDA BRIO SATYA 1.2 CVT', 'WRT000163', 'MHRDD1850NJ204196', '-', 30, '2022-06-04', 155, 1500000, 1, 'Y', 'Y', 1500000, '152', '152', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(164, 'HENI CIPTANING PURNAWO W', 'JL DAMAI NO 60 BABU APUS CIPAYUNG JAKARTA TIMUR', '8128024314', 'HONDA HRV 1.5 E CVT', 'WRT000164', 'MHRRU1860NJ100719', 'B 1107 HI', 67, '2022-06-04', 155, 2200000, 1, 'Y', 'Y', 5300000, '151', '150', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(165, 'BAYU AJI WIBOWO', 'GRAND NUSA INDAH BLOK O4 NO. 3', '', ' HONDA BRV', 'WRT000165', 'HRDG3880NJ302411', '-', 77, '2022-06-06', 155, 3400000, 1, 'Y', 'Y', -3000000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(166, 'HANNY LIEM', 'PERUM DUREN JAYA JL. CANDI BOROBUDUR', '', 'HONDA HRV  SE CVT', 'WRT000166', 'MHRRV3870NJ201408', '-', 19, '2022-06-06', 155, 650000, 1, 'Y', 'Y', 1350000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(167, 'DODDY GUNAWAN', 'JL KEBAGUSAN KECIL GG IKHLAS RAYA NO 39 PASAR MINGGU', '', 'HONDA HRV 1.5 RS CVT', 'WRT000167', 'MHRRV3890NJ201084', '-', 63, '2022-06-07', 155, 2650000, 1, 'Y', 'Y', 3350000, '152', '151', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(168, 'RINI AGUSTINA PUAR', 'PERUM TAMAN SENTSA BOK J6 N052 RT 015 RW 006', '', 'HYUNDAI CRETA', 'WRT000168', 'MF3PE812TNJ012562', '-', 35, '2022-06-08', 155, 2200000, 1, 'Y', 'Y', 1800000, '149', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(169, 'DEVI OCTAVIA', 'PERUM GREEN PARK RC/SUNFI RT 001 RW 004 JATI MELATI', '', 'HONDA ODYSSEY 2,4 E CVT', 'WRT000169', 'JHMRC1871HC330019', 'B 2486 KFN', 32, '2022-06-08', 155, 1200000, 1, 'Y', 'Y', 2800000, '150', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(170, 'HIDAYAT', 'MASJID BAITUSALAM NO 3 KOMSEN BEKASI', '', 'MAZDA CX-30', 'WRT000170', 'JM6DM2W7AL0102134', 'B 2249 KZA', 31, '2022-06-09', 155, 1225000, 1, 'Y', 'Y', 2275000, '152', '152', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(171, 'MUSYAFAK', 'JL DAHLIA RAYA NO 3 KLAPAGADING JAKARTA UTARA', '', 'MITSUBISHI XPANDER ULTIMATE 4X2 AT', 'WRT000171', 'MK2NCLTATNJ008140', '-', 63, '2022-06-09', 155, 2400000, 1, 'Y', 'Y', 3600000, '150', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(172, 'BAYU ANGGORO', ' KOTA WISATA', '', 'HYUNDAI SANTA FE SIGNATURE', 'WRT000172', 'MF3S381KMNJ000124', '-', 36, '2022-06-10', 155, 2500000, 1, 'Y', 'Y', 2000000, '150', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(173, 'IWAN SETYAWAN MUHARIFE', 'GRAHA CIBUBUR VIEW CLUSTER LIMBOTO BLOK B7 JATIRADEN JATISAMPURNA', '', 'MITSUBISHI XPANDER 1.5 ULTIMATE 4X2 CVT', 'WRT000173', 'MK2NCLTATNJ007022', '-', 19, '2022-06-10', 155, 650000, 1, 'Y', 'Y', 1350000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(174, 'HARDIYANTO DJAPRI', 'JL RAYA PONDOK DUTA DEPOK', '', 'KIA SONET', 'WRT000174', 'MZFBFC814NN162495', '-', 35, '2022-06-11', 155, 0, 1, 'Y', 'Y', 4000000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(175, 'INDRA PRASETYO NUGROHO', 'JL PERMAI RAYA X BX 10/10 PAULANG TANGERANG SELATAN', '', 'HONDA CITY HB 1.5 L RS CVT', 'WRT000175', 'MHRGN588NJ200104', '-', 19, '2022-06-13', 155, 650000, 1, 'Y', 'Y', 1350000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(176, 'BAMBANG IRAWAN', 'METLAND CILEUNGSI SEKTOR 6 CLUSTER THE ALLEGRIA BLOK FH 03/21', '', 'MERCEDES-BENZ E 300', 'WRT000176', 'MHL212054BJ002516', '-', 32, '2022-06-13', 155, 800000, 1, 'Y', 'Y', 3200000, '149', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(177, 'MURWANTO', 'JL APEL RAYA NO 17 DEPOK', '', 'MITSUBISHI XPANDER ULTIMATE 4X2 AT', 'WRT000177', 'MK2NCLTATNJ007770', '-', 19, '2022-06-13', 155, 650000, 1, 'Y', 'Y', 1350000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(178, 'BENYAMIN MARTIONO', 'JL KEMANGGISAN NO 68A GG C1 RT 5/9 PALMERAH JAKBAR', '8389903-7817', 'WULING ALMAZ', 'WRT000178', 'MK3BAAGA7MJ004251', '-', 70, '2022-06-13', 155, 0, 1, 'Y', 'Y', 0, '149', '0', '150', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(179, 'FEDELIX LAUDRA', 'JL PUTRI TUNGGAL KP PEDURENAN HARJAMUKTI CIMANGGIS DEPOK', '', 'XPANDER ULTIMATE', 'WRT000179', 'MK2NCLTATNJ008799', '-', 40, '2022-06-14', 155, 1150000, 1, 'Y', 'Y', 4350000, '148', '148', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(180, 'M YUSUF HANDOPO', 'METLAND CILEUNGSI', '', 'HONDA CR-V 1.5 TC CVT', 'WRT000180', 'MHRRW1840JJ802542', '-', 70, '2022-06-15', 155, 0, 1, 'Y', 'Y', 500000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(181, 'GATOK YOGA PRAWIRANTO', 'KP SAWAH RT 015/003 SERENGSENG SAWAH', '', 'ALL NEW SUZUKI ERTIGA ', 'WRT000181', 'MHYANC32SNJ100430', '-', 19, '2022-06-16', 155, 650000, 1, 'Y', 'Y', 1350000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(182, 'ARIF BUDIMAN', 'PONDOK GEDE BEKASI', '', 'WULING ALMAZ', 'WRT000182', 'MK38AA6A7LJ005219', '-', 70, '2022-06-16', 155, 0, 1, 'Y', 'Y', 500000, '152', '149', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(183, 'HANZHOLAH', 'JL MARGONDA KALIBARU KEC CILODONG KOTA DEPOK', '', 'MERCEDES BENZ E400', 'WRT000183', 'MHL212065FJ005588', 'B 1 PBW', 36, '2022-06-16', 155, 800000, 1, 'Y', 'Y', 3700000, '150', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(184, 'HADI KUSNADI', 'KOMP GRAHA JALA YUDHA BLOK BB5 NO 13 CIANGSANAGUNUNG PUTRI', '', 'MITSUBISHI XPANDER ULTIMATE', 'WRT000184', 'MK2NCLTATNJ005462', '-', 59, '2022-06-18', 155, 480000, 1, 'Y', 'Y', 5020000, '149', '152', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(185, 'IR SRI UTARI', 'KOMP TWP TNI AL BLOK CC.1/3 CIANGSANA GUNUNG PUTRI', '87885777969', 'HONDA BRIO RS CVT CKD', 'WRT000185', 'MHRDD1890NJ240238', '-', 66, '2022-06-18', 155, 1900000, 1, 'Y', 'Y', 4200000, '148', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(186, 'MEILIAWATI SOELAEMAN', 'JL. BHINEKA RAYA NO. 3 RT OO6/009 CIPINANG JAKARTA TIMUR', '', 'HONDA HRV 1.5 SE CVT', 'WRT000186', 'MHRRV3870NJ201850', '-', 35, '2022-06-20', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '151', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(187, 'TITIK BUDIANTI SE QQ. RIZKY', 'SEKEPEER RT 001/005 BANDUNG JAWA BARAT', '', 'HONDA BR-V 1.5 PRE  CVT', 'WRT000187', 'MHRDG3860NJ301828', 'D 1167 AJV', 77, '2022-06-21', 155, 1500000, 1, 'Y', 'Y', -1100000, '149', '152', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(188, 'PRIMA CHRISTINA', 'CITRA GRAND BLOK L2/20 CIBUBUR', '', 'TOYOTA RAIZE 1.0 S CVT', 'WRT000188', 'MHKAA1BA8NJ039875', 'B 2197 KZT', 35, '2022-06-24', 155, 800000, 1, 'Y', 'Y', 3200000, '149', '152', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(189, 'PT ALLVAMED NUVACON ADIGANA', 'BELLEZA BSA JL LETJAN SOEPENO KEBAYORAN LAMA', '', 'WULING CONFERO 1.5 DB MT', 'WRT000189', 'K3AAAGA2NJ001450', '-', 19, '2022-06-24', 155, 650000, 1, 'Y', 'Y', 1350000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(190, 'ERNAWATI', 'PORIS INDAH BLOK E 64', '', 'WULING CORTEZ EX L LUX', 'WRT000190', 'MK3AAAGAXNJ008632', '-', 20, '2022-06-24', 155, 700000, 1, 'Y', 'Y', 1700000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(191, 'MIDIH', 'KP. GOMBANG RT 003/005 SUKAKERTA, SUKAWANGI, KABUPATEN BEKASI', '', 'MITSUBISHI PAJERO SPORT', 'WRT000191', 'MMBGYKG40ED026012', 'B 1515 UJK', 20, '2022-06-26', 155, 0, 1, 'Y', 'Y', 2400000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(192, 'PUTRI ZAHRO', 'CITRA GRAND CIBUBUR', '', 'HONDA CITY HB 1.5L RS CVT', 'WRT000192', 'MHRGN5880MJ202384', '-', 70, '2022-06-27', 155, 0, 1, 'Y', 'Y', 500000, '149', '149', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(193, 'DHIAN RAHMAD INFANTOKO', 'JL CENDRAWASIH 8 N GC-2 HALIM PERDANA KUSUMA', '', 'TOYOTA VELOZ', 'WRT000193', 'MHFABY6N0021521', '-', 31, '2022-06-27', 155, 500000, 1, 'Y', 'Y', 3000000, '148', '148', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(194, 'YUSDA KURNIATI', ' WISMA MELATI NO 40 RT 002/009 PONDOK MELATI BEKASI ', '', 'MITSUBISHI XPANDER ULTIMATE', 'WRT000194', 'MK2NCLTATNJ008066', '-', 35, '2022-06-28', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '149', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(195, 'ANA MARDIATI', 'LEGENDA WISATA ZONA VANGOGH S8 NO 38', '', 'HYUNDAI CRETA TREND 1.5 AT', 'WRT000195', 'MF3PB812TNJ000501', '-', 31, '2022-06-28', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '152', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(196, 'MARENTINA PUSPITASARI', 'KOTA WISATA CLUSTER VIENNA J7 NO.5', '', 'MITSUBISHI PAJERO SPORT DAKAR', 'WRT000196', 'MK2KSWPNUNJ001088', '-', 68, '2022-06-29', 155, 2500000, 1, 'Y', 'Y', 4900000, '148', '151', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(197, 'FARIS', 'JL HIDAYAH NO 69 JAKARTA TIMUR DKI JAKARTA', '', 'MITSUBISHI PAJERO SPORT ', 'WRT000197', 'MK2KRWPNUNJ008604', '-', 64, '2022-07-01', 155, 2950000, 1, 'Y', 'Y', 3950000, '150', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(198, 'SRI WAHYUNINGSIH QQ ILHAM', 'JL NILAM II KRANGGAN KULON KP RADEN', '', 'SUZUKI BALENO 4X2 AT', 'WRT000198', 'MBHEWB52SMG710656', 'B 2411 KZM', 31, '2022-07-01', 155, 1300000, 1, 'Y', 'Y', 2200000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(199, 'ASEP ALDI ', 'JL PERTAINA B NO 43', '', 'HONDA JAZZ', 'WRT000199', 'MHRGE88408J900038', 'B 1990 EMQ', 73, '2022-07-01', 155, 1250000, 1, 'Y', 'Y', -650000, '148', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(200, 'CV SAIMO MANGUNKARSO QQ FILPUS RONGGO KUMBO', 'CITRA GRAD CIBUBUR CLUSTER GREEN VALLEY BLOK I 6 NO.9', '', 'HYUNDAI CRETA 1.5 IVT SINGLE TONE', 'WRT000200', 'MF3PE812TNJ014360', '-', 59, '2022-07-04', 155, 0, 1, 'Y', 'Y', 5500000, '150', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(201, 'RIFQI J', 'LEGENDA WISATA', '', 'MITSUBISHI PAJERO SPORT DAKAR 4X2', 'WRT000201', 'MK2KRWPNUNJ009485', 'B 105 RFQ', 60, '2022-07-04', 155, 1200000, 1, 'Y', 'Y', 5200000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(202, 'STEPHANUS HARIADI', 'CITRA GARDN CIBUBUR BLOK K.7 NO20 ', '', 'TOYOTA VELOZ', 'WRT000202', 'MFFAB1BY4N0019170', '-', 31, '2022-07-05', 155, 1500000, 1, 'Y', 'Y', 2000000, '150', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(203, 'NOVITA SEKAR RINI DEWI QQ  HELMY', 'KOMP PELNI BLK H1 NO.11 DEPOK', '', 'TOYOTA YARIS 1.5 E AT', 'WRT000203', 'MR054HY91B4669437', 'B 1392 EMJ', 59, '2022-07-05', 155, 1800000, 1, 'Y', 'Y', 3700000, '149', '152', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(204, 'MUH ANDIAN ZIKRI', 'LEGENDA WISATA BLOK CA/3A ACROPOLIS SELATAN', '', 'HONDA CR-V 1.5 TC PRESTIGE', 'WRT000204', 'MHRRW1880NJ250623', ' B 1819 KJ', 60, '2022-07-08', 155, 2700000, 1, 'Y', 'Y', 3700000, '149', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(205, 'DANIEL HAMONANGAN', 'RAFFLES HILLS BLOK N.6 NO.19', '', 'HONDA HR-V 1.5L E CVT', 'WRT000205', 'MHRRV385NJ201191', '-', 31, '2022-07-09', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(206, 'ROJANA', 'JL SATOPATI RT 05/ RW 04 BOJONG MENTENG', '', 'HONDA BRIO SATYA 1.2 E AT', 'WRT000206', 'MHRDD1750NJ202876', 'B 2153 KZW', 30, '2022-07-09', 155, 1500000, 1, 'Y', 'Y', 1500000, '150', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(207, 'FAJAR REZANDARU', 'JL ANTASARI MELAK ULU MELAKKUTAI BARAT', '', 'HYUNDAI CRETA', 'WRT000207', 'F3PE812TNJ013569', '-', 19, '2022-07-09', 155, 650000, 1, 'Y', 'Y', 1350000, '151', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(208, 'LIBERTY SIMANJUNTAK', 'RAFFLES HILLS BLOK 0-7 NO.23', '', 'MITSUBISHI PAJERO SPORT', 'WRT000208', 'MK2KRWPNUNJ007275', '-', 32, '2022-07-11', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(209, 'MURWANTO', 'JL APEL RAYA NO 17 DEPOK', '', 'MITSUBISHI XPANDER ULTIMATE 4X2 AT', 'WRT000209', 'MK2NCLTATNJ007770', '-', 35, '2022-07-11', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '152', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(210, 'TITIN ANDRIANI', 'CIBUBUR RESIDENCE BLOK C5 NO 2', '', 'MITSUBISHI PAJERO SPORT DAKAR 4x2', 'WRT000210', 'MK2KRWPNUNJ005268', 'B 2455 SJG', 32, '2022-07-12', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '149', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(211, 'SISILIA QQ DHIYADRI AYU CENDIKIA', 'KOTA WISATA COSTESVILLE 5C 3/2 ', '8125000571', 'MAZDA CX-3 SPORT 1.5 L', 'WRT000211', 'JM6DK2WAAN1708193', '-', 63, '2022-07-12', 155, 2400000, 1, 'Y', 'Y', 0, '150', '151', '151', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(212, 'LAELASARI QQ HASAN ', 'PALSIGUNUNG RT 009.003 TUGU CIMANGGIS DEPOK', '', 'TOYOTA FORTUNER 2.4 VRZ', 'WRT000212', 'MHFAB8GS7M3024566', 'B1386 EJF', 36, '2022-07-13', 155, 1750000, 1, 'Y', 'Y', 2750000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(213, 'LUCKY OKTAVIAN', 'KOMP PAS PAMPRES A 2/10', '', 'MITSUBISHI XPANDER ULTIMATE', 'WRT000213', 'MK2NCLTATNJ009263', '-', 63, '2022-07-13', 155, 2650000, 1, 'Y', 'Y', 3350000, '152', '152', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(214, 'SINGGIH', 'JL. ANGSANA NO L2/1 LARANG INDAH, TANGGERANG, BANTEN', '', 'HYUNDAI CRETA PRIME', 'WRT000214', '21356', '-', 31, '2022-07-14', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(215, 'IBRAHIM HANISH A ALAMRI', ' DUSUN II RT 001/000, SIDOMULYO, SEKAMPUNG,KAB LAMPUNG', '', 'WULING CORTEZ EX LUX CVT', 'WRT000215', 'MK3AAAGA1NJ007305', '-', 60, '2022-07-14', 155, 2700000, 1, 'Y', 'Y', 3700000, '148', '151', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(216, 'MIA NARU', 'CITRA GRAND B 6/56', '', 'MITSUBISHI XPANDER', 'WRT000216', 'MK2NCLTATNJ006621', '-', 35, '2022-07-16', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(217, 'HENDRA', 'KOMP DEPPEN BLOK M 27 CIMANGGIS DEPOK', '', 'HONDA JAZZ ', 'WRT000217', 'MHRGK5860HJ702888', '-', 79, '2022-07-16', 155, 1000000, 1, 'Y', 'Y', 2400000, '151', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(218, 'HERMAWAN', 'KP MELAYU BESAR TEBET JAKARTA SELATAN', '', 'WULING CORTEZ', 'WRT000218', 'MK3AAAGA5NJ007369', 'B 1627 DFW', 32, '2022-07-20', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(219, 'SOELFIAN SHAHIB', 'JL SALAK NO 23 CAWANG KRAMATJATI JAKARTA TIMUR', '', 'HONDA BRIO RS 1.2 CVT CKD', 'WRT000219', 'MHRDD1890NJ240779', '-', 58, '2022-07-20', 155, 2100000, 1, 'Y', 'Y', 2500000, '149', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(220, 'NUNINGGAR HASTIWI', 'PERUM GREEN HILL RESIDENCE BLOK D.3 / 081310349833', '', 'HONDA BRIO RS MT', 'WRT000220', 'MHRDD1790NJ250079', '-', 58, '2022-07-21', 155, 2100000, 1, 'Y', 'Y', 2500000, '149', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(221, 'NUKE SUCIATI IR.MT', 'PERUM HARAPAN REGENCY L5/17 HARAPAN BARU, BEKASI UTARA / 08118404992', '', 'HONDA BR-V 1.5L PRE-HS CVT', 'WRT000221', 'MHRDG3880NJ303546', '-', 31, '2022-07-21', 155, 1750000, 1, 'Y', 'Y', 1750000, '152', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(222, 'YANDREVZ REMINISCERE HABASARON', 'JL. KRAMAT JAYA II NO 22', '', 'MITSUBISHI XPANDER CROS 1.5 L PLUS', 'WRT000222', 'MK2NCXTATNJ002903', '-', 79, '2022-07-21', 155, 1500000, 1, 'Y', 'Y', 1900000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(223, 'DESYANA IRMASARI', 'JL. MAWAR RAYA NO 39', '', 'MITSUBISHI XPANDER 1.5 ULTIMATE', 'WRT000223', 'MK2NCLTATNJ010127', '-', 19, '2022-07-22', 155, 650000, 1, 'Y', 'Y', 1350000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(224, 'SIMAN', 'JL RAYA CIPAYUNG SETU CIPAYUNG / 085770237077', '', 'HONDA CRV 1.5 PRESTIGE CVT', 'WRT000224', 'MHRRW1880NJ330029', '-', 20, '2022-07-23', 155, 700000, 1, 'Y', 'Y', 1700000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(225, 'MUHAMMAD DAFFA SATYA M', 'JL DARMA 19 NO.3 JAKARTA TIMUR', '', 'HONDA BRIO SATYA E CVT', 'WRT000225', 'MHRDD1850NJ206101', 'B 1073 RKK', 18, '2022-07-23', 155, 600000, 1, 'Y', 'Y', 1000000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(226, 'MOCHAMMAD FARID', 'JL KWITANG TIMUR NO 22 SENIN', '', 'HONDA CRV 1.5 PRESTIGE CVT', 'WRT000226', 'MHRRW1880NJ202599', '-', 60, '2022-07-23', 155, 2700000, 1, 'Y', 'Y', 3700000, '152', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(227, 'BUTET QQ TULUS RITONGA', 'JL TARUNA JAYA CIBUBUR JAKARTA TIMUR / 081287771495', '', 'TOYOTA RUSH 1.5 S AT', 'WRT000227', 'MHKE8FB3JNK066940', 'B 1176 RKH', 19, '2022-07-25', 155, 650000, 1, 'Y', 'Y', 1350000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(228, 'ENOH SOLEHUDIN', 'JL. DHARMA 19. NO 3 PASAR REBO / 081281015805', '', 'HONDA BR-V 1.5 L', 'WRT000228', 'MHRDG3880NJ303700', '-', 19, '2022-07-25', 155, 650000, 1, 'Y', 'Y', 1350000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(229, 'ELSYA PUTRI DWI LESTARI', 'PREMIER ESTATE 3 BLOK N 28 JATIRADEN JATISAMPURNA', '', 'HONDA HR-V 1.5L SE ', 'WRT000229', 'MHRRV3870NJ203773', '-', 77, '2022-07-26', 155, 3400000, 1, 'Y', 'Y', -3000000, '149', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(230, 'SIMAN', 'JL RAYA CIPAYUNG SETU CIPAYUNG / 085770237077', '', 'HONDA CRV 1.5 PRESTIGE CVT', 'WRT000230', 'MHRRW1880NJ330029', '-', 36, '2022-07-27', 155, 2250000, 1, 'Y', 'Y', 2250000, '150', '150', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(231, 'KRISTIN', 'KEL RAMBUTAN, CIRACAS JAKARTA TIMUR / 08128888589', '', 'HONDA HR-V 1.5 RS  CVT', 'WRT000231', 'MHRRV3890NJ01261', '-', 63, '2022-07-27', 155, 2650000, 1, 'Y', 'Y', 3350000, '149', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(232, 'HERMANTO', 'PRUM BUKIT PUTRA BLOK G.4/12 CILEUNGSI / 08111977564', '', 'HONDA BR-V 1.5 L PRE CVT', 'WRT000232', 'HRDG38860NJ304270', '-', 40, '2022-07-27', 155, 1450000, 1, 'Y', 'Y', 4050000, '148', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(233, 'SHELLA', 'LEGENDA WISATA CIBUBUR  ZONA EINSTEIN BLOK R7/15', '', 'SUZUKI XL7', 'WRT000233', 'MHYANC22SNJ107835', '-', 15, '2022-07-28', 155, 500000, 1, 'Y', 'Y', 700000, '149', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(234, 'SASONGKO SABDO NUGROHO', 'JL. KELAPA DUA WETAN ', '', 'TOYOTA AVANZA', 'WRT000234', 'MHKM5FB4JKK021864', '-', 31, '2022-07-28', 155, 0, 1, 'Y', 'Y', 3500000, '150', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(235, 'APIL STEFANDI', 'KRANGGAN GG JIPIT RT 01/013 JATIRANGGA JATISAMPURNA', '', 'MITSUBISHI XPANDER EXCEED', 'WRT000235', 'MK2NGWHARK3002180', 'B 2843 BIA', 31, '2022-07-29', 155, 1500000, 1, 'Y', 'Y', 2000000, '149', '149', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(236, 'DR MUHAMMAD SYAFIQ', 'JL. ANDARA 17 BLOK B1 PONDOK LABU CILANDAK / 0881288762869', '', 'HONDA BR-V 1.5L PRE CVT', 'WRT000236', 'MHRDG3860NJ302750', '-', 59, '2022-07-29', 155, 2400000, 1, 'Y', 'Y', 3100000, '150', '148', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(237, 'ISRA WIJAYANTI ST', 'CLUSTER RIVEVA BLOK C7 KOTA DELTAMAS PASRI RANJI CIKARANG PUSAT', '', 'HONDA HR-V 1.5L E CVT', 'WRT000237', 'MHRRV3850NJ250178', '-', 31, '2022-07-29', 155, 1750000, 1, 'Y', 'Y', 1750000, '152', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(238, 'HAKEMAL KARPA', 'JL PROKLAMASI BLOK XI NO 29 DEPOK', '', 'MITSUBISHI EXEED 4X2 1.5L AT', 'WRT000238', 'MK2NCLHATNJ001508', '-', 35, '2022-08-01', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(239, 'SUGIHARTO', 'JL CANDRAQA VI PASAR REBO JAKARTA TIMUR', '81314238531', 'MITSUBISHI XPANDER CROSS 1.5L MT', 'WRT000239', 'MK2NCXPANNJ001165', '-', 59, '2022-08-01', 155, 2400000, 1, 'Y', 'Y', 3100000, '150', '151', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(240, 'AXEL RAPHAEL', 'JL ANGGREK XI AS JATISAMPURNA', '', 'HONDA HR-V 1.5 E CVT', 'WRT000240', 'MHRRV3850NJ201537', '-', 59, '2022-08-02', 155, 2400000, 1, 'Y', 'Y', 3100000, '149', '152', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(241, 'ISRA WIJAYANTI ST', 'CLUSTER RIVEVA BLOK C7 KOTA DELTAMAS PASRI RANJI CIKARANG PUSAT', '', 'HONDA HR-V 1.5L E CVT', 'WRT000241', 'MHRRV3850NJ250178', '-', 79, '2022-08-02', 155, 1400000, 1, 'Y', 'Y', 2000000, '148', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(242, 'LB. BUDI YUDHISTRIA UD', 'BUKIT GOLF ARCADIA ', '81584260197', 'HONDA BRIO RS', 'WRT000242', 'MHROD1890NJ202855', '-', 30, '2022-08-03', 155, 1500000, 1, 'Y', 'Y', 1500000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(243, 'OKI LESTARI IRSAN DR SP S', 'PERUM CIBUBUR COUNTRI APPLE WOOD 1/3', '82166562666', 'HONDA BR-V 1.5 PRESTIGE ', 'WRT000243', 'MHRDG388ONJ304054', '-', 59, '2022-08-03', 155, 3050000, 1, 'Y', 'Y', 2450000, '149', '152', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(244, 'MUSLIM', 'JL SWASEMBADA TIMUR', '', 'TOYOTA AVANZA 1.5 G CVT', 'WRT000244', 'MHKABB1BY9MK000683', '-', 19, '2022-08-03', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(245, 'SAMIH', 'KRANGGAN RT 001/001 KEL. JATIRANGGA KEC. JATISAMPURNA', '81383311219', 'NEW CERRY PU', 'WRT000245', 'MHYHDC61TNJ239017', '-', 19, '2022-08-03', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(246, 'NURILAH ARTI', 'KP SETIA JAYA RT03/02 TAMBUN SELATAN BEKASI', '8119132322', 'HONDA CITY HB 1.5L RS CVT', 'WRT000246', 'MHRGN5880MJ205595', 'B 2539 FFY', 31, '2022-08-04', 155, 1750000, 1, 'Y', 'Y', 1750000, '152', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(247, 'AMIRAH AIDA BARNAS', 'JL ELANG MALINDO 1 BLOK A5/3 RT 001/008', '8119910088', 'HONDA BRIO RS 1.2 CVT', 'WRT000247', 'MHRDD1890NJ202802', '-', 58, '2022-08-04', 155, 2600000, 1, 'Y', 'Y', 2000000, '149', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(248, 'MICHAEL', 'GRIYA BUKIT JAYA BLOK F2 NO7 GUNUNG PUTRI BOGOR', '82297762587', 'HONDA HR-V 1.5L CVT', 'WRT000248', '-', '-', 91, '2022-08-04', 155, 0, 1, 'Y', 'Y', 500000, '', '', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(249, 'MUHAMMAD ARYA PRADIPTA', 'RAFFLES HILLS BLOK Q1 NO.11 RT 024/025 SUKATANI TAPOS', '8131077342', 'HONDA BRIO RS 1.2 CVT', 'WRT000249', 'HRDD1850NJ207849', '-', 44, '2022-08-05', 155, 2600000, 1, 'Y', 'Y', 1300000, '149', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(250, 'MARTA LESTISIA', 'MINI TOWN HOUS RT 003/013', '85959996572', 'PAJERO SPORT  2.4L DAKAR 4X2', 'WRT000250', 'MKZKRMPNUHJ01 0614', '-', 36, '2022-08-06', 155, 2250000, 1, 'Y', 'Y', 2250000, '149', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(251, 'HARJANTO', 'KEMANG PRATAMA BEKASI', '811441625', 'HYUNDAI CRETA', 'WRT000251', 'MF3PE812TNJ02409', '-', 63, '2022-08-07', 155, 1800000, 1, 'Y', 'Y', 4200000, '148', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(252, 'CHARLIZE SAKIKO DEQITA', 'KOTA WISATA WINDSOR BOK 0.16/6 RT.007 RW 027 CIANGSANA GUNUNG PUTRI', '81385467676', 'HONDA CITY HATCHBACK GN5B 1.5L RS CVT', 'WRT000252', 'MHRGN5880NJ203157', '-', 59, '2022-08-08', 155, 3050000, 1, 'Y', 'Y', 2450000, '149', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(253, 'FACHRIZAL DAIM NASUTION S.T', 'PERUMAHAN CIBUBUR CITY BLOK C 10 NO 9', '', 'AVANZA 1.5 G M/T ', 'WRT000253', 'MHKAB1BY4NKO27095', '-', 31, '2022-08-08', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(254, 'RITA SUGIARTI', 'JL NANAS 1 N 2 RT 1/3 MATRAMAN', '8118165999', 'HONDA BRV', 'WRT000254', 'MHRDG3860NJ301945', 'B 1007 RKF', 35, '2022-08-09', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(255, 'MARTIN SURYAPRAWIRA  B QQ IBU NEVY', 'JL KELAPA PUAN XIV BLOK AG 8/7  04/012 PAKULONAN BARAT KELAPA KAB.TANGERANG', '81295311970', 'TOYOTA CAMRY', 'WRT000255', 'MR053BK4089005420', 'B 1621 JRA', 32, '2022-08-09', 155, 4000000, 1, 'Y', 'Y', 0, '149', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(256, 'EWITRINALTI', 'Toyota Cibubur', '81295093559', 'FORTUNER /VRZGR-11', 'WRT000256', 'MHFAA8GS9N0781958', '-', 36, '2022-08-09', 155, 2250000, 1, 'Y', 'Y', 2250000, '150', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(257, 'MICHAEL  QQ  PT INDO SEJAHTERA JAYA ', 'Griya Bukit Jaya Blok F2 No 7 Gunung Putri Bogor', '82297762587', 'HONDA HR-V 1.5T RS CVT', 'WRT000257', 'MHRRV3890NJ201399', 'F 1453 FAN', 35, '2022-08-10', 155, 800000, 1, 'Y', 'Y', 3200000, '149', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(258, 'UMARUL FAROK', 'KP CIKEDOKAN RT 001/005 KEL SUKADANAU', '', 'PAJERO SPORT ', 'WRT000258', 'MK2KSWPNUNJ001397', '-', 36, '2022-08-11', 155, 2250000, 1, 'Y', 'Y', 2250000, '149', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(259, 'CARDIFFA BERTYANA ROBBY ', 'KP SAWAH JL TAMBAKAN NO 19  RT 004 RW 004 JATIMELATI PONDOK MELATI ', '81806071676', 'HONDA CITY HATCHBACK GN5B 1.5L RS CVT', 'WRT000259', 'MHRGN5880NJ203637', '-', 93, '2022-08-11', 155, 4250000, 1, 'Y', 'Y', 2650000, '152', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(260, 'RA RETNO TRI WIDYAWATI K ', 'VII A NUSA INDAH RT 002 RW 029 BOONG KULUR GUNUNG PUTRI', '811887175', 'HONDA CITY HATCHBACK GN5B 1.5L RS CVT', 'WRT000260', 'MHRGN5880NJ203728', '-', 45, '2022-08-11', 155, 3200000, 1, 'Y', 'Y', 1400000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(261, 'PULUNG RAGIL LANANG ', 'PESONA VILA MAS MERUYUNG RW 01 RKP JAYA DEPOK ', '82112118256', 'MITSUBISHI XPANDER 1.5L SPRT L', 'WRT000261', 'MK2NCLPATNJ001013', 'B 1539 ZKW', 15, '2022-08-12', 155, 600000, 1, 'Y', 'Y', 600000, '152', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(262, 'RUDI GUNAWAN', 'JL MADU INDAH BAMBU APUS RT 002 RW 003', '88288200678', 'HYUNDAI CRETA PRIME', 'WRT000262', 'MF3PE812TNJ027174', '-', 35, '2022-08-12', 155, 2200000, 1, 'Y', 'Y', 1800000, '149', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(263, 'RITA SUGIARTI ', 'JL NANAS 1 NO 2 RT 1/3 MATRAMAN ', '8118165999', 'VESPA', 'WRT000263', 'RP8M82221LV044691', 'B 5633 THC', 94, '2022-08-13', 155, 750000, 1, 'Y', 'Y', 500000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(264, 'ANDRY FARMAYANA SE', 'JL DEPNAKER NO 45 A RT 011/006', '89513144687', 'HONDA HR-V  1 5T RS ', 'WRT000264', 'MHRRV3890NJ200889', 'B 1417 RKJ', 23, '2022-08-13', 155, 900000, 1, 'Y', 'Y', 500000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(265, 'UMI HANDAYANI', 'JL SULTAN ISKANDAR MUDA NO 51 JAKARTA SELATAN', '81344528880', 'MAZDA CX 5', 'WRT000265', 'JM6KF2WLAM0704170', 'B 1288 SSL', 70, '2022-08-16', 155, 0, 1, 'Y', 'Y', 500000, '152', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(266, 'DIAN KARTIKA ', 'CIBUBUR COUNTRY CLUST COTTON FIELD 3 NO 20 RT 2 RW 19 CIKEAS ', '85267002200', 'SUZUKI XL7415F', 'WRT000266', 'MHYANC22SNJ108498', 'F 1825 FAN', 19, '2022-08-16', 155, 400000, 1, 'Y', 'Y', 1600000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(267, 'ILHAM', 'JL TIPAR SELATAN RT 010 RW 006 SEMPER BARAT CILINCING', '81286006806', 'HONDA BR-V DG3', 'WRT000267', 'MHRDG3880NJ306062', '-', 59, '2022-08-19', 155, 3050000, 1, 'Y', 'Y', 2450000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(268, 'DANANG AMIN SUYONO QQ ANDRI ', 'BULEVAR HIJAU BLK F 1 5A RT 01 RW 30 PEJUANG D SATRIA BKS', '8119889820', 'FORTUNER 2.4 VRZ', 'WRT000268', 'MHFGB8GSXG0812788', 'B 1217 TY', 36, '2022-08-19', 155, 2000000, 1, 'Y', 'Y', 2500000, '152', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(269, 'MUHAMMAD GUNAWAN QQ ANDRI ', 'JL H TORAN RT 03/01 RENGAS CIPUTAT TIMUR KOTA TANGSEL', '8119889820', 'TOYOTA / NAV1', 'WRT000269', 'MHFX2RB71D8002615', 'B 1654 WYI', 37, '2022-08-19', 155, 2000000, 1, 'Y', 'Y', 3000000, '149', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(270, 'JAROTT', 'Wuling Arista Bintaro,Jln Boulevard Bintaro Jaya  Tanggerang Selatan ', '81210797747', 'WULING ALMAZ L5LT LIAT SC CVT', 'WRT000270', 'MK3BAAGA8NJ000405', '-', 20, '2022-08-20', 155, 1100000, 1, 'Y', 'Y', 1300000, '151', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(271, 'IGN HANANTO SIGIT ', 'KOMP PATRIA JAYA B IV/29 JL SEMERU III RT 04/RW 14 JATIRAHAYU PONDOK MELATI ', '85814800732', 'HONDA BR-V DG3 ', 'WRT000271', 'MHRDG3740NJ301407', 'B 2489 KZY', 31, '2022-08-20', 155, 700000, 1, 'Y', 'Y', 2800000, '152', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(272, 'DAVINA MANTIKA FARMAYANA', 'JL DEPNAKER NO 45 A RT 011 RW 006', '89513144687', 'RAIZE', 'WRT000272', 'MHKAA1BA3NJ047141', 'B 1591 RKI', 23, '2022-08-20', 155, 900000, 1, 'Y', 'Y', 500000, '151', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(273, 'ADRY RYAN CAHYA', 'JL KELAPA DUA WETAN RT/RW 08/01 NO 35 ', '87881143578', 'TOYOTA VELOZ', 'WRT000273', 'MHFAB1BY3N0026269', '-', 49, '2022-08-20', 155, 1000000, 1, 'Y', 'Y', 2200000, '149', '148', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(274, 'DEKRI QQ M IBRAR AL HAFIZH', 'GRIYA ALAM SENTOSA P12 RT 1 RW 10 PASIR ANGIN CILEUNGSI', '218244740', 'SUZUKI XL7', 'WRT000274', 'MHYANC22SLJ114424', '04-12-2020', 70, '2022-08-22', 155, 0, 1, 'Y', 'Y', 500000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(275, 'NACIH', 'KP BAKOM RT/RW 05/04 KEL LIMUSNUNGGAL  KEC  CILEUNGSI', '87780652077', 'HONDA HRV ', 'WRT000275', 'MHRRV3870NJ205435', '-', 31, '2022-08-22', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(276, 'AVIYAT NUGROHO', 'JL SWADAYA 3 GG H MIRTA NO 95 RT 03 RW 06 BEKASI JAWA BARAT 17432', '216365115', 'HONDA CRV ', 'WRT000276', 'MHRRW1880MJ102929', 'B 1940 UJW', 70, '2022-08-23', 155, 0, 1, 'Y', 'Y', 500000, '150', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(277, 'NIKO HUSIN', 'CITRA INDAH BUKIT ANYELIR AE 15 NO 8 RT 05 RW 09 SINGAJAYA KEC JONGGOL BOGOR JAWA BARAT ', '81111829', 'ALMAZ 1.5T LUX ', 'WRT000277', 'MK3BAAGAXLJ003285', '-', 36, '2022-08-24', 155, 2250000, 1, 'Y', 'Y', 2250000, '150', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(278, 'KARINA HELMA DERTI', 'PERUM CIRIUNG CEMERLANG BLOK C15 RT 01 RW 14 KEL CIRIUNG KEC CIBINONG', '8118627271', 'MITSUBISHI XPANDER ULTIMATE', 'WRT000278', 'MK2NCLTATNJ0114033', '', 35, '2022-08-24', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(279, 'YUDI ANDRIANSYAH', 'BLOK RINGIN RT 10 RW 03 KEL CIBUBUR KEC CIRACAS', '8119889820', 'FORTUNER 2.8 VRZ', 'WRT000279', 'MHFAA8GS2N0779467', 'B 820 MAN ', 36, '2022-08-25', 155, 2000000, 1, 'Y', 'Y', 2500000, '152', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(280, 'DR H AMRIL A BURHANY SPA.K.MM', 'KOMP  RSAB HARAPA KITA B/10 RT 10 RW 08 KEL KOTA BAMBU UTARA KE PAL MERAH ', '818155799', 'HONDA BR-V DG3', 'WRT000280', 'MHRDG3850NJ301459', '-', 31, '2022-08-25', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(281, 'ADITYA PRATAMA', 'CIKARET GG SAWARGI NO 23 RT 001 RW 005 KE CIKARET KEC BOGOR SELATA KOTA BOGOR 16132', '87873300802', 'HONDA HRV', 'WRT000281', 'MHRRV3890NJ201732', 'F 1882 CP', 79, '2022-08-25', 155, 1500000, 1, 'Y', 'Y', 1900000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(282, 'IR FAILANI RIZONA ', 'JL BAMBU KUNING VII RT 09 RW 03 JAKBAR', '811175869', 'MITSUBISHI OUTLENDER ', 'WRT000282', 'MHMGAWP2TCK003845', 'B 1910 SJH', 23, '2022-08-26', 155, 0, 1, 'Y', 'Y', 1400000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(283, 'ANDHIKA EKA SATRYA', 'JL KEDONGDOG II NO 49 RT 02 RW 06 JAGAKARSA', '818862970', 'HONDA BR-V DG3', 'WRT000283', 'MHRDG3880NJ306557', '-', 59, '2022-08-26', 155, 3050000, 1, 'Y', 'Y', 2450000, '150', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(284, 'MARRY OLIVIA', 'RAFFLES HILLS CLUSTER SPRING LAND BLOK T3 NO 3 CIBUBUR DEPOK JAWA BARAT 16545', '8161159572', 'HONDA HR-V E CVT / HITAM', 'WRT000284', 'MHRUU1850103052', '13-Sep-21', 70, '2022-08-27', 155, 0, 1, 'Y', 'Y', 500000, '152', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(285, 'STEPHANUS HARIADI PURWOSUDARMINTO SE', 'CITRA GRAN BLOK K 7 NO 20 RT 07 RW 13 JATIKARYA BEKASI', '8176637999', 'TOYOTA  VELOZ', 'WRT000285', 'MHFAB1BY4N0019170', 'B 2521 KZW', 23, '2022-08-27', 155, 500000, 1, 'Y', 'Y', 900000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(286, 'ARIS DWIPURNOMO', 'LEGENDA WISATA BOGOR JAWA BARAT 13720', '811140848', 'HYUNDAI CRETA PRIME', 'WRT000286', 'MF3PB812TNJ006065', '-', 35, '2022-08-29', 155, 2000000, 1, 'Y', 'Y', 2000000, '152', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(287, 'VINCENTIA AYUNINGTYAS', 'JL PULO JAYA RT 005 RW 012 KEL BEJI KEC BEJI', '81296239889', 'MITSUBISHI XPANDER ', 'WRT000287', 'MK2NCLTATNJ012433', '-', 95, '2022-08-29', 155, 4500000, 1, 'Y', 'Y', 2900000, '149', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(288, 'EDDY KARMANA', 'JL MESJID KEBON JERUK NO 18 RT 008 RW 005 KEL MAPHAR KEC TAMAN SARI', '81296239889', 'MITSUBISHI XPANDER', 'WRT000288', 'MK2NCLTATNJ013088', '-', 95, '2022-08-29', 155, 4500000, 1, 'Y', 'Y', 2900000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(289, 'JANA KUSUMA', 'CITRA GRAN CLUSTER FUNDER  PARK BLOK F RT 08 RW 011 KE JTIKARYA KEC JATISAMPURNA', '811848761', 'MAZDA CX8', 'WRT000289', 'PP1KGA333NM300010', 'B 8119 JEI', 36, '2022-08-30', 155, 900000, 1, 'Y', 'Y', 0, '149', '0', '0', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(290, 'APRILINDA INTAN KURNIAPUTRI', 'PERUMAHAN KOTA WISATA CLUSTER NASHVILLE BLOK TD 3 NO 11', '87721821516', 'MAZDA 2 SEDAN', 'WRT000290', 'MM6DL2SAANW822216', '-', 45, '2022-09-01', 155, 3200000, 1, 'Y', 'Y', 1400000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(291, 'ROKI PRABOWO', 'TAMAN KENARI NUSANTARA CLUSTER PASUNDAN PN 1 NO 3A TRANSYOGI CIBUBUR', '81210632873', 'CRETA PRIME 1.5 AT', 'WRT000291', 'MF3PE812TNJ020975', '-', 96, '2022-09-01', 155, 2625000, 1, 'Y', 'Y', 4275000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(292, 'RAHEL ARRAHMA', 'TAMAN ROYAL 1 CLASTER DAMAR 6 NO 53', '8,15585E+11', 'NEW PAJERO SPORT DAKAR 4X2 AT', 'WRT000292', 'MK2KRWPNUNJ011308', '-', 36, '2022-09-01', 155, 2250000, 1, 'Y', 'Y', 2250000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(293, 'FAJAR KRISTIANTO', 'PERUM CIBUBUR COUNTRY NO 26 CIKEAS GUNUNG PUTRI', '82226633311', 'WULING ALMAZ', 'WRT000293', 'MK3BAAGA2KJ007118', 'B 2800 TIE', 32, '2022-09-01', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(294, 'ALBERTUS AAN', 'JALAN PESONA MONTREAL YA 16/11 KOTA WISATA KABUPATEN BOGOR  JAWA BARAT', '81511550889', 'INNOVA REBORN', 'WRT000294', 'MHFAB8EM2M0105111', 'B 2477 UZB', 32, '2022-09-01', 155, 1000000, 1, 'Y', 'Y', 3000000, '152', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(295, 'FERI HADINATA', 'DUKUH ZARUD BLOK F 2 NO 2 RT 01 RW 24 CIMUNING MUSTIKA JAYA', '81288121613', 'HONDA HRV', 'WRT000295', 'MHRRV3870NJ206728', '-', 45, '2022-09-02', 155, 3200000, 1, 'Y', 'Y', 1400000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(296, 'ABDI SETIA', 'PREMIER SAVANNA KAWASAN VIDA BLK 1 003 BEKASI JAWA BARAT', '81290927486', 'MAZDA 2 SEDAN', 'WRT000296', 'MM6DL2SAANW818776', '-', 35, '2022-09-02', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(297, 'VINCENTIUS HIMAWAN', 'PONDOK BAMBU JAKARTA TIMUR', '8111690256', 'MOBILIO', 'WRT000297', 'MHRDD4850KJ901269', 'B 2739 TYQ', 97, '2022-09-03', 155, 160000, 1, 'Y', 'Y', 640000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(298, 'MITRA BINA ARTHA MAKMUR', 'JL ILIR A 4 NO 3 KEMBANGAN JAKARTA BARAT', '8111180892', 'XPANDER 1.5L ULTIMATE', 'WRT000298', 'MK2NCLTATNJ014045', '-', 31, '2022-09-05', 155, 1750000, 1, 'Y', 'Y', 1750000, '151', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(299, 'SAKIM SUNARYA', 'KRANGGAN LEMBUR 5 NO 59 KOTA BEKASI JAWA BARAT', '85697576134', 'VARIO 160 ABS', 'WRT000299', 'MH1KFA118NK106965', '-', 94, '2022-09-05', 155, 750000, 1, 'Y', 'Y', 500000, '151', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(300, 'AGUNG EKO WIBOWO', 'JLN INTAN1 NO 78 RT 10 RW 02 KEL SUMUR BATU KEC KEMAYORAN', '81210017751', 'PAJERO DAKAR-L 4X2 ', 'WRT000300', 'MK2KRWPNUNJO10307', '-', 36, '2022-09-05', 155, 2250000, 1, 'Y', 'Y', 2250000, '149', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(301, 'RAHMA MELLANY', 'JL LAPANGAN TENIS NO 68 Gg MUSHOLA AT-TAUBAH SRENGSER KEMBANGAN', '85779562077', 'WULING ALMAZ EXCLUSIVE', 'WRT000301', 'MK3BAAGAONJOOO673', '-', 32, '2022-09-05', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(302, 'PUPUT BAYU WIBOWO', 'JL CENDANA INDAH BLOK N 1/3 RT 005 RW 016 KEL PEJUANG KE MEDAN SATRIA', '81222022490', 'HONDA HR-V', 'WRT000302', 'MHRRV3870NJ206675', '-', 19, '2022-09-07', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(303, 'LULUK MUSSAFIAH S.E', 'GAMBIRAN UH 5/272-B RT 052 RW 010 KOTA YOGYAKARTA', '85157717970', 'HONDA BRIO RS', 'WRT000303', 'MHRDD1890NJ240556', 'AB 1939 AP', 92, '2022-09-10', 155, 2950000, 1, 'Y', 'Y', 2950000, '149', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(304, 'KARTIKA', 'JL METRO DUTA XIII BLOK FF V NO 3 RT 06 RW 23', '81280302111', 'SUZUKI XL7415F', 'WRT000304', 'MHYANC22SMJ116879', 'B 1570 EZE', 70, '2022-09-10', 155, 0, 1, 'Y', 'Y', 500000, '150', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(305, 'EIKY BRATA', 'CIBUBUR BEKASI', '81318456734', 'HONDA CR-V', 'WRT000305', 'MHRRW1880NJ300599', '-', 60, '2022-09-10', 155, 3200000, 1, 'Y', 'Y', 3200000, '152', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(306, 'HERMAN QQ OYEN', '', '81807321789', 'MITSUBISHI XPANDER ', 'WRT000306', 'K2NCLHANMJ000286', '', 70, '2022-09-10', 155, 0, 1, 'Y', 'Y', 500000, '151', '148', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(307, 'Rezza Rachman', 'Springlake Summarecon Tower Caldesia Unit 1628 Bekasi Utara, Kota Bekasi, 17142 Jawa Barat', '6,28968E+12', 'CRETA ', 'WRT000307', 'MF3PE812TNJ029010', 'B 1389 SSM', 67, '2022-09-12', 155, 3750000, 1, 'Y', 'Y', 3750000, '149', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(308, 'ANTONIUS KUNTJORO R P.SH', 'KOTA WISATA COSTA VERDE SA 7/16 RT 001 RW 038 CIANGSANA GUNUNG PUTRI', '81513203420', 'HONDA HR-V', 'WRT000308', 'MHRRV3890NJ202403', '-', 35, '2022-09-12', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(309, 'PT BANK PERKREDITAN RAKYAT NUSANTARA BONA P', 'JL RAYA PASAR LAMA 4B', '81289110822', 'TOYOTA  VELOZ', 'WRT000309', 'MHKAB1BY8NK017203', 'F 1698 FAL', 19, '2022-09-14', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(310, 'NOVIA ESKA', 'PRIMER ESTATE 3 BLOK D9 JATIRADEN KOTA BEKASI', '82259393120', 'HONDA HR-V 1.5L CVT', 'WRT000310', 'MHRRV3870NJ206935', '-', 40, '2022-09-14', 155, 0, 1, 'Y', 'Y', 5500000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00');
INSERT INTO `t_transaksi` (`id`, `nama`, `alamat`, `tlp`, `jns_kendaraan`, `waranti`, `no_rangka`, `no_polisi`, `id_teknisi`, `tgl`, `id_sales`, `diskon`, `admin`, `sts_point`, `sts_klaim`, `total_b`, `tek1`, `tek2`, `tek3`, `tek4`, `sts_book`, `booking`, `sts_hapus`, `tgl_hapus`, `tgl_server`, `tgl_booking`, `status_bayar`, `tgl_lunas`) VALUES
(311, 'AMELIA', 'KP CIGAROGOL RT 003 RW 001 MEKARSARI CILEUNGSI', '8999500222', 'HONDA BRIO SATYA DD1M', 'WRT000311', 'MHRDD1850NJ210647', '-', 34, '2022-09-14', 155, 1750000, 1, 'Y', 'Y', 1750000, '152', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(312, 'JOKO WINARTO SE', 'JL RAJA WALI 1 HALIM PERDANAKUSUMAH JAKARTA TIMUR DKI JAKARTA', '81387942192', 'HYUNDAI CRETA', 'WRT000312', 'MF3PE812TNJ032408', '-', 31, '2022-09-15', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(313, 'REFI  EKASANTY', 'TAMAN JATISARI PERMAI BLOK D1 NO 30 JL SEMERU RAYA KOTA BEKASI', '81319924904', 'MAZDA 2 SEDAN', 'WRT000313', 'MM6DJ2HAANW826088', '-', 59, '2022-09-15', 155, 1600000, 1, 'Y', 'Y', 3900000, '152', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(314, 'ILYAS', 'JL KREDANG SELATAN RT 003 RW 007 KRENDANG TAMBORA', '82122273173', 'HONDA CR-V', 'WRT000314', 'MHRRW1880J106004', '03 DESEMBE', 70, '2022-09-16', 155, 0, 1, 'Y', 'Y', 500000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(315, 'TRIANA SALEH', 'PERUMAHAN TAMAN JATISARI PERMAI BLOK T NO 30', '8159102375', 'SUZUKI BALENO', 'WRT000315', 'MBHEW352SMG608864', 'B 2013 KGW', 31, '2022-09-16', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(316, 'TRIANA SALEH', 'PERUMAHAN TAMAN JATISARI PERMAI BLOK T NO 30', '8159102375', 'HYUNDAI STARGAZER', 'WRT000316', 'MF3NE81DTNJ001347', 'B 1812 SSV', 31, '2022-09-16', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(317, 'CV PROPERTI TUJUH ', 'JL MEGA KUNINGAN BARAT', '81932115848', 'HONDA CR-V', 'WRT000317', 'MHRRW3830HJ800838', 'kedatangan', 70, '2022-09-16', 155, 0, 1, 'Y', 'Y', 500000, '151', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(318, 'MUCHTAR SURURI', 'JL PULO NANGKA RT 2 RW 2 CENGKARENG', '81310187103', 'BMW', 'WRT000318', 'WBASN2207AC193389', 'B 1403 BDY', 36, '2022-09-19', 155, 0, 1, 'Y', 'Y', 4500000, '149', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(319, 'AGUNG EKO WIBOWO', 'JLN INTAN1 NO 78 RT 10 RW 02 KEL SUMUR BATU KEC KEMAYORAN', '81210017751', 'PAJERO DAKAR-L 4X2 ', 'WRT000319', 'MK2KRWPNUNJO10307', '', 98, '2022-09-19', 155, 0, 1, 'Y', 'Y', 3500000, '149', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(320, 'IRA', 'RUKO PASAR MODERN BLOK R 27 PT TRANS JAVA EXPRESS NUSANTARA', '82298681525', 'MAZDA', 'WRT000320', 'JM6GL1033NO473764', '-', 31, '2022-09-19', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(321, 'FINNA SUROSO ', 'APT MENTENG SQUARE TA 10/19 JL MATRAMAN 30 E ', '817309446', 'HYUNDAI CRETA', 'WRT000321', 'MF3PE812TNJ032194', '-', 31, '2022-09-20', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(322, 'LOLITA', 'TAMAN LAGUNA', '8111741970', 'HYUNDAI CRETA', 'WRT000322', 'MF3PC812TNJ009217', '', 59, '2022-09-21', 155, 1300000, 1, 'Y', 'Y', 4200000, '149', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(323, 'XAVIERA YASMIN AZAHRA ANDY', 'DUTA MEKAR ASRI P 1/2 RT 014 RW 015 CILEUNGSI', '81318980007', 'HONDA HRV ', 'WRT000323', 'MHRRV3870NJ207977', '', 59, '2022-09-21', 155, 2750000, 1, 'Y', 'Y', 2750000, '150', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(324, 'RYAN RONALDY', 'LEBAK BULUS TAMAN BONA INDAH JAKARTA SELATAN  DKI JAKARTA 12440 ', '87776590474', 'HONDA BRV', 'WRT000324', 'XXXXX', '', 35, '2022-09-21', 155, 2000000, 1, 'Y', 'Y', 2000000, '151', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(325, 'THIO SHINTA INDRIYATY', 'TYTYAN INDAH BLOK D2/18 RT 003 KALI BARU MEDAN SATRIA', '81228779689', 'HYUNDAI CRETA', 'WRT000325', 'MF3PE812TNJ003307', '', 35, '2022-09-21', 155, 2000000, 1, 'Y', 'Y', 2000000, '152', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(326, 'TIURMA MANULANG', 'MP PRAPATAN XI NO 44 JAKARTA SELATAN', '81932115848', 'TOYOTA VOXY', 'WRT000326', 'JT7X2RB80M7022662', 'B 2050 SRW', 33, '2022-09-22', 155, 2250000, 1, 'Y', 'Y', 2250000, '149', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(327, 'IGNATIUS HENIS SATRIO WIBOWO', 'JL SIMONGAN 91 KEC SEMARANG', '85240018008', 'MITSUBISHI XPANDER', 'WRT000327', 'MK2NCXPANNJOO1292', '-', 63, '2022-09-22', 155, 3000000, 1, 'Y', 'Y', 0, '150', '151', '0', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(328, 'HADI HARMAWAN FIRDAUS', 'JL H NAWI 111/22', '81394138941', 'HONDA CR-V', 'WRT000328', 'MHRRW1880MJ104438', 'B 2740 SJE', 36, '2022-09-23', 155, 1350000, 1, 'Y', 'Y', 3150000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(329, 'ELIN ERIKA ', 'CIBUBUR INDAH', '', 'TOYOTA YARIS', 'WRT000329', 'MHFK23F39J2046281', '', 99, '2022-09-23', 155, 0, 1, 'Y', 'Y', 1200000, '148', '151', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(330, 'ERIWANDI AGUS', 'PRIMA HARAPAN REGENCY BLOK 11 NO 28', '8161129289', 'PAJERO SPORT ', 'WRT000330', 'MK2KRWPNUNJOO4401', 'B 1696 KJP', 80, '2022-09-24', 155, 1900000, 1, 'Y', 'Y', 2000000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(331, 'LINGGA AGENG TAUFAN', 'LEGENDA WISATA OSCAR BLOK CD 03 NO 9 ', '81311277886', 'HONDA BR-V ', 'WRT000331', 'MHRDG3880NJ305614', 'F 1315 FAP', 95, '2022-09-24', 155, 2100000, 1, 'Y', 'Y', 5300000, '149', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(332, 'SHELLA', 'LEGENDA WISATA CIBUBUR ZONA EINSTEIN BLOK R7/15', '85777097937', 'SUZUKI XL 7', 'WRT000332', 'MHYANC22SNJ107835', '', 19, '2022-09-24', 155, 0, 1, 'Y', 'Y', 2000000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(333, 'LENY NURLINA', 'LEGENDA WISATA CIBUBUR BLOK L 5/19 RT 001 RW 20', '81766658968', 'HYUNDAI STARGAZER', 'WRT000333', 'MF3NE81DTNJ007589', '-', 35, '2022-09-26', 155, 2000000, 1, 'Y', 'Y', 2000000, '152', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(334, 'AZWAR ANES', 'KP RAWA PANJANG RT 004 RW 003 KEL SEPANJANG JAYA KEC RAWALUMBU', '81367351556', 'HYUNDAI CRETA', 'WRT000334', 'MF3PE812TNJ031085', '-', 63, '2022-09-27', 155, 3300000, 1, 'Y', 'Y', 0, '149', '148', '0', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(335, 'ASEP KOSASIH', 'KOTA WISATA COATESVILLE BLOK SC 9/17', '', 'TOYOTA  VELOZ', 'WRT000335', 'MHFAB1BY9N0026230', '', 19, '2022-09-27', 155, 1000000, 1, 'Y', 'Y', 1000000, '151', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(336, 'UTAMI DEWI', 'MANGGARAI SELATAN', '', 'XPANDER ULTIMATE', 'WRT000336', 'MK2NCLTATNJ013846', '', 19, '2022-09-27', 155, 1100000, 1, 'Y', 'Y', 900000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(337, 'MANAHAN PASARIBU', 'PERUMAHAN CILEUNGSI HIJAU', '81213718141', 'HYUNDAI STARGAZER', 'WRT000337', 'MF3NB81DTNJ008196', '', 31, '2022-09-28', 155, 700000, 1, 'Y', 'Y', 2800000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(338, 'RITA SUGIARTI', 'UTAN KAYU SELATAN', '8118165999', 'HYUNDAI CRETA', 'WRT000338', 'MF3PE812TNJ029211', '', 31, '2022-09-28', 155, 1750000, 1, 'Y', 'Y', 1750000, '152', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(339, 'IR.PADMONOBO', 'LEGENDA WISATA CLUSTER LINCOLN N2 NO 5', '81381551553', 'HONDA BRV ', 'WRT000339', 'MHRDG3880NJ306868', '', 31, '2022-09-29', 155, 1750000, 1, 'Y', 'Y', 1750000, '148', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(340, 'DR  MUHAMMAD HUSIN', 'JLN POLTANGAN RAYA NO 44 A', '81293394776', 'HYUNDAI STARGAZER', 'WRT000340', 'MF3NE81DTNJ006385', '', 63, '2022-09-30', 155, 3300000, 1, 'Y', 'Y', 2700000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(341, 'CINDI PRATIWI', 'KP NAGRAK', '81381179917', 'TOYOTA XL 7', 'WRT000341', 'MHYANC22SNJ116415', '', 15, '2022-09-30', 155, 480000, 1, 'Y', 'Y', 720000, '151', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(342, 'DADANG', 'CIREBON', '', 'XPANDER ULTIMATE', 'WRT000342', 'MK2NCLTATNJO14884', '', 19, '2022-09-30', 155, 1000000, 1, 'Y', 'Y', 1000000, '151', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(343, 'WIDIARTO PRASETYOBUDI', 'JL BARKAH NO 56 MANGGARAI SELATAN', '', 'XPANDER EXCEED CVT', 'WRT000343', 'MK2NCLHATNJ002111', '', 19, '2022-10-01', 155, 1100000, 1, 'Y', 'Y', 900000, '151', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(344, 'SAMUEL REYNALDO H', 'MP PRAPATAN XL NO 44 RT7/4 JAKSEL', '81932115848', 'HYUNDAI CRETA', 'WRT000344', 'MF3PC812TNJ009550', '', 35, '2022-10-01', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(345, 'LYRA SICILIA', 'LEGENDA WISATA ZONA EINSTEIN ', '82113148017', 'HYUNDAI SANTAFE', 'WRT000345', 'MF3S381KMNJ000451', '', 32, '2022-10-01', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(346, 'NAILIN MUKHOYAROH', 'PERU GRIYA MAHKOTA ARTE RT 10/07', '81381000083', 'LEXUS', 'WRT000346', 'JTJZAMCA8M2113007', '', 36, '2022-10-01', 155, 2250000, 1, 'Y', 'Y', 2250000, '152', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(347, 'HELENA AUGUSTA', 'JL TG DUREN RAYA LAMA NO 8 RT 004 RW 001', '8119910050', 'HONDA CITY', 'WRT000347', 'MHRGN5880NJ203362', '', 59, '2022-10-03', 155, 2750000, 1, 'Y', 'Y', 2750000, '149', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(348, 'HENDRI SAPUTRA ', 'JL RAYA CIPAYUNG NO 9 RT 002 RW 002 CIPAYUNG', '8128252703', 'HONDA HR-V ', 'WRT000348', 'MHRRV3870NJ208614', '', 35, '2022-10-04', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(349, 'WORO HAPSARI SATRIO', 'METLAND TRANSYOGI CLUSTER EBONI BLOK EB XXV CILEUNGSI', '81310137779', 'HONDA BRIO SATYA DD1M', 'WRT000349', 'MHRDD1850NJ212888', '', 78, '2022-10-04', 155, 2100000, 1, 'Y', 'Y', 800000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(350, 'CHOKY YF SIMANJUNTAK', 'CIBUBUR INDAH VILLA BLOK UJ NO  13 RT 006 RW 011', '82110001500', 'HONDA HR-V ', 'WRT000350', 'MHRRV3870NJ208586', '', 100, '2022-10-05', 155, 3050000, 1, 'Y', 'Y', 2950000, '150', '151', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(351, 'IRFAN ANDRIAN', 'GRAND CIBUBUR COUNTRY CW 3 NO 20 RT 01 RW 024', '818992303', 'HONDA HR-V', 'WRT000351', 'MHRRV3870NJ208190', '', 31, '2022-10-05', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(352, 'SITI NURJANAH', 'KRANGGAN KULON RT 005 RW 008 JATIRADEN JATISAMPURNA', '82297085320', 'HONDA BR-V', 'WRT000352', 'MHRDG3850NJ301951', '', 19, '2022-10-05', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(353, 'NOVIA WULANDARI', 'PERUM GREEN GARUDA WIJAYA NO 24', '', 'MITSUBISHI XPANDER', 'WRT000353', 'MK2NCLTATNJO14942', '', 19, '2022-10-06', 155, 1100000, 1, 'Y', 'Y', 900000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(354, 'OKY YUSPRAWIDYA', 'INDAH MINIMALIS NO 1 JL KEMENYAN INDAH', '81296239889', 'MITSUBISHI XPANDER', 'WRT000354', 'MK2NCLTATNJ014625', '', 79, '2022-10-07', 155, 2300000, 1, 'Y', 'Y', 1100000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(355, 'ASRI SEPTA KURNIA', 'JL MENTENG NO 25B RT 2/17 LAGOA', '', 'HONDA ACCORD', 'WRT000355', 'MRHCP2640CP220680', '', 16, '2022-10-08', 155, 200000, 1, 'Y', 'Y', 1200000, '148', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(356, 'IQBAL SIFA ALFIAN ', 'JL CIKUNIR RAYA JAKA MULYA', '8158184687', 'FORTUNER ', 'WRT000356', 'MHFGB8GS4G0820305', '', 32, '2022-10-08', 155, 1000000, 1, 'Y', 'Y', 3000000, '149', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(357, 'ENY LISTIJARINI SE', 'PERUM PERATA HIJAU PERMAI F12/05 BEKASI UTARA', '81289110822', 'KIJANG INNOVA ', 'WRT000357', 'MHFAB8EMXN0118478', '', 20, '2022-10-11', 155, 1600000, 1, 'Y', 'Y', 800000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(358, 'SITTI SULEHA', 'JL BUNGA SAKURA XVI BLOK U NO 18 RT 004/017', '81287122991', 'HONDA HR-V', 'WRT000358', 'MHRRV3870NJ208462', '', 63, '2022-10-11', 155, 3300000, 1, 'Y', 'Y', 2700000, '150', '148', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(359, 'GHO YUANA', 'TMN ARIES AYU B-5/11 RT 001/009 KEL MERAYU UTARA JAKARTA BARAT', '', 'MARCEDES BENZ GLC 200 NEW ', 'WRT000359', 'MHL253980NJ002613', '', 32, '2022-10-11', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(360, 'DRS.TONI SYAH INDRA', 'PINANG RANTI RT014 RW 002 KEL PINANG  RANTI JAKARTA TIMUR', '8118143999', 'SUZUKI JIMNY', 'WRT000360', '101256', '', 44, '2022-10-12', 155, 2600000, 1, 'Y', 'Y', 1300000, '152', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(361, 'ABADI TISNADISASTRA', 'JL DEMPO 1 NO 43 RT 04 RW 03 KEL GUNUNG KEC KEBAYORAN BARU', '81398918456', 'HYUNDAI IONIQ', 'WRT000361', 'MF3KM81AUNJ000141', '', 36, '2022-10-12', 155, 2450000, 1, 'Y', 'Y', 2050000, '149', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(362, 'PT ROYAL ABADI CONSULTANT', 'GG WIKA UJUNG ASPAL NO 91 RT 03/05 JATI RANGGON', '', 'TOYOTA ALPHARD', 'WRT000362', 'JTNGF3DH5N8038133', '', 36, '2022-10-13', 155, 1500000, 1, 'Y', 'Y', 3000000, '150', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(363, 'YADI MULYADI', 'KOMP KPAD CIBUBUR JL TEMU IRENG II NO 31 RT 004 CIBUBUR', '81389200252', 'HONDA BR-V', 'WRT000363', 'MHRDG3880NJ304834', '', 63, '2022-10-13', 155, 3300000, 1, 'Y', 'Y', 2700000, '152', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(364, 'MOHAMAD YASIN SURYADARMA SE', 'JL FLAMBOYAN NO 39 RT 04 RW 06', '81387687224', 'HONDA HR-V', 'WRT000364', 'MHRRU1850GJ607943', '', 19, '2022-10-13', 155, 400000, 1, 'Y', 'Y', 1600000, '151', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(365, 'LILI SUMARNI SH.MM', 'GUDANG PELURU RY/B.1/12B RT 1 RW 1', '81808618042', ' HONDA BR-V PRESTIGE', 'WRT000365', 'MHRDG3860NJ304303', 'B 1802 DFY', 59, '2022-10-14', 155, 2800000, 1, 'Y', 'Y', 0, '0', '153', '151', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(366, 'HAWANY AFRIANTY', 'JL TANAH ABANG II/46 RT 001 RW 005', '8128079134', 'HONDA BRIO', 'WRT000366', 'MHRDD1890NJ241813', '', 58, '2022-10-14', 155, 2600000, 1, 'Y', 'Y', 2000000, '149', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(367, 'H NENI SRI WAHYUNI', 'JL INTISARI RAYA NO 6 RT 03 RW 009 KALISARI PASAR REBO ', '8176988578', 'MERCY A200 SEDAN', 'WRT000367', 'W1K1771876L005229', '', 35, '2022-10-15', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(368, 'YURIANTO SUROTO', 'LENTENG AGUNG', '81231276199', 'XPANDER ULTIMATE 4X2 AT', 'WRT000368', 'MK2NCLTATNJ014369', '', 102, '2022-10-15', 155, 0, 1, 'Y', 'Y', 350000, '151', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(369, 'IIS NURASYIAH', 'PERUM MEGA REGENCY BLOK D-10', '82261887422', 'SUZUKI XL7', 'WRT000369', 'MHYANC32SNJ104214', '', 31, '2022-10-17', 155, 1750000, 1, 'Y', 'Y', 1750000, '152', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(370, 'UMMU SALAMAH AL HABSO', 'JL NILAM SARI 1 KALISARI PASAR REBO JAKARTA ', '82112049585', 'WULING AIR EV LONG RANGE', 'WRT000370', 'MK3AACE29NJ001887', '', 18, '2022-10-17', 155, 1100000, 1, 'Y', 'Y', 500000, '151', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(371, 'USMAN LINA', 'CROWN GOLF BOULEVARD NO 108 004/003 KAMAL MUARA PANJARINGAN', '8121007888', 'MAZDA CX5', 'WRT000371', 'JM6KF2WLAN0793755', '', 80, '2022-10-17', 155, 2200000, 1, 'Y', 'Y', 1700000, '151', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(372, 'PURWADI', 'CILEUNGSI PERMAI BLOK G7 RT 03 RW 12', '81287904060', 'HYUNDAI STARGAZER', 'WRT000372', 'MF3NE81DTNJ006323', '', 40, '2022-10-17', 155, 2750000, 1, 'Y', 'Y', 2750000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(373, 'PT KING CREATE ASIA', 'KAMPUNG RADEN DUSUN III RT 01 RW 05 JATI RANGGON BEKASI JATI SAMPURNA', '89513144687', 'TOYOTA FURTUNER', 'WRT000373', 'MHFGB8GS8H0842678', '', 32, '2022-10-18', 155, 2200000, 1, 'Y', 'Y', 1800000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(374, 'BOBBY YUS HENDRA', 'JL RAWA BAMBON RT 11/4 CIRACAS ', '', 'TOYOTA ALTIS', 'WRT000374', 'MRO53REH2G4103315', '', 31, '2022-10-19', 155, 1500000, 1, 'Y', 'Y', 2000000, '151', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(375, 'HJ SUHARTATI', 'PERUM CILEUNGSI INDAH BLOK D NO 10 ', '85880735943', 'HYUNDAI STARGAZER', 'WRT000375', 'MF3NE81DTNJ009157', '', 31, '2022-10-19', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(376, 'ROFIQ IMAWANTO ', 'KRANGGAN WETAN RT 01 RW 06 ', '', 'SUZUKI ARK415F GL ', 'WRT000376', 'MHYANC22SJJ105215', '', 15, '2022-10-19', 155, 600000, 1, 'Y', 'Y', 600000, '149', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(377, 'ANDRE ANDREAS HENDJAN', 'KOMPEK P & K 36 CILANDAK RT 013 RW 010 ', '816745504', 'HONDA HR-V', 'WRT000377', 'MHRRV3870NJ209083', '', 63, '2022-10-20', 155, 3300000, 1, 'Y', 'Y', 2700000, '149', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(378, 'HANA ROCHIJADI', 'BUKIT HOLF ARCADIA BLOK AR 44 RT/RW 001/003 BOJONG NANGKA GUNUNG PUTRI', '81315627021', 'HONDA CR-V', 'WRT000378', 'MHRRW1880NJ370281', '', 20, '2022-10-21', 155, 1600000, 1, 'Y', 'Y', 800000, '151', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(379, 'KHAIRANI RISTYA WIDYADHARI', 'KOTA WISATA BARCELONA SB 4/7 RT 003 RW 038 CIANGSANA GUNUNG PUTRI', '81514353532', 'HONDA HR-V', 'WRT000379', 'MHRRV3890NJ250403', '', 59, '2022-10-21', 155, 3050000, 1, 'Y', 'Y', 2450000, '148', '150', '149', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(380, 'HENDRI ANWAR', 'JLN KARTINI X C DALAM NO 2A', '8118987546', 'MAZDA CX 5', 'WRT000380', 'JM6KF2WLAN0794403', '', 64, '2022-10-21', 155, 6900000, 1, 'Y', 'Y', 0, '148', '152', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(381, 'MOHD NUR RASHID BIN MUHAMMED SALIM', 'Grand Nusa indah Cluster Jasminum blok J01 no 09 , Grand Nusa indah , Bogor , Jawa barat , 16820', '81219820157', 'WULING NEW CORTEZ', 'WRT000381', 'MK3AAAGA2NJ008592', '', 36, '2022-10-22', 155, 2250000, 1, 'Y', 'Y', 2250000, '150', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(382, 'DARUL ANWAR', 'JL KAWI KAWI ATAS RT 15/8 JAKPUS', '81908192184', 'MITASUBISHI PAJERO', 'WRT000382', 'MK2KRWPNUNJ010683', '', 36, '2022-10-24', 155, 1300000, 1, 'Y', 'Y', 3200000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(383, 'VANIA ATTHALIA', 'JL PERSADA 1/14 RT 007 RW 015', '87874322046', 'MAZDA CX-3 5WGN RHD', 'WRT000383', 'MM6DK2WAANW511194', '', 31, '2022-10-24', 155, 1400000, 1, 'Y', 'Y', 2100000, '149', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(384, 'YULIA FATMA AGUSTIN SE', 'JL ALTERNATIF CIBUBUR NO 32 CIBUBUR CILEUNGSI', '85945750938', 'NEW XPANDER ULTIMATE CVT', 'WRT000384', 'MK2NCLTATNJ014566', '', 59, '2022-10-24', 155, 3050000, 1, 'Y', 'Y', 2450000, '148', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(385, 'NURUL SAVITRI', 'LIMUS PRATAMA REGENY E.8/11 RT 002 RW 011', '8164838166', 'HONDA HR-V', 'WRT000385', 'MHRRV3870NJ209739', '', 31, '2022-10-25', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(386, 'YONI TRI HANINDITA SE', 'JL PONDOK JAYA II/15 RT/RW 002 / 006', '8118143999', 'SUZUKI XL 7', 'WRT000386', 'MHYANC22SNJ116420', '', 45, '2022-10-26', 155, 3300000, 1, 'Y', 'Y', 1300000, '148', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(387, 'INTAN NURCAHAYA SE', 'JL PONDOK CIPTA RAYA RT 003/009 BINTARA BEKASI BARAT', '81310093362', 'HONDA HR-V', 'WRT000387', 'MHRRV3890NJ202854', '', 59, '2022-10-26', 155, 3050000, 1, 'Y', 'Y', 2450000, '148', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(388, 'ACHMAD RIVAI SE', 'PERUM BUKIT SEJAHTERA BLOK  D1-01 RT 076/RW 022', '81291029132', 'WULING CORTEZ', 'WRT000388', 'MK3AAAGAXNJ011398', '', 32, '2022-10-27', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(389, 'ERWIN QQ PT ARAGON TAMBANG ', 'JL MARGAGUNA RAYA RT 4/RW 11', '81315526588', 'BMW 5281 CKD AT', 'WRT000389', 'MHH5A5607GK952110', '', 103, '2022-10-28', 155, 2000000, 1, 'Y', 'Y', 3000000, '152', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(390, 'RIZA ANANDA NUR', 'KOMP BPN BLOK A-111/19 RT 003 RW 007', '81286206910', 'HONDA HR-V', 'WRT000390', 'MHRRV3870NJ200624', '', 63, '2022-10-28', 155, 3300000, 1, 'Y', 'Y', 2700000, '149', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(391, 'THIERYIUS RAPHAEL GAVIOTA', 'GRIYA ALAM SENTOSA F 22 NO 17 RT 003 RW 009', '8115454136', 'HONDA BR-V DG3', 'WRT000391', 'MHRDG3880NJ308161', '', 49, '2022-10-28', 155, 2000000, 1, 'Y', 'Y', 1200000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(392, 'HELMY QQ PT ASTRA INTERNATIONAL', 'JL PROF DR SOEPOO SH NO 46', '8129284700', 'TOYOTA KIJANG INNOVA', 'WRT000392', 'MHFJB8EM9N1108048', '', 32, '2022-10-28', 155, 1300000, 1, 'Y', 'Y', 2700000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(393, 'JUNITA LAMRIRIS HUTAURUK', 'CLUSTER SANFRANSISCO KOTA WISATA', '8127119090', 'HONDA CR-V', 'WRT000393', 'MHRRW1880MJ105071', '', 70, '2022-10-31', 155, 0, 1, 'Y', 'Y', 500000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(394, 'NADIA NUR SHADRINA', 'JL CEMPAKA VII BS 13/7 RT 006 RW 013 JATISAMPURNA', '81381576622', 'HONDA CITY HATCHBACK', 'WRT000394', 'MHRGN5880NJ300758', '', 93, '2022-11-01', 155, 3750000, 1, 'Y', 'Y', 3150000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(395, 'SITI NUR HALIZAH', 'KP TLAJUNG RT 01 RW 11 CIKEAS UDIK GUNUNG PUTRI', '81776668002', 'HONDA BR-V DG3 1.5L', 'WRT000395', 'MHRDB3850NJ303209', 'F 1516 LIZ', 59, '2022-11-01', 155, 1500000, 1, 'Y', 'Y', 0, '149', '148', '0', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(396, 'EDI SUPRAYITNO', 'PRAMPELAN RW 03 RT 02', '', 'TOYOTA FORTUNER', 'WRT000396', 'MHFGB8GS8K0899759', '', 60, '2022-11-01', 155, 1780000, 1, 'Y', 'Y', 4620000, '152', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(397, 'HARI INDRADI', 'JL PIL KB BLOK AG 2/10 RT 007 RW 014-30', '', 'NEW BRIO SATYA ', 'WRT000397', 'MHRDD1850NJ214257', '', 30, '2022-11-01', 155, 1500000, 1, 'Y', 'Y', 1500000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(398, 'ANA SULPIANTI SE', 'KOP JASINDO LESTARI A7-63 RT 006 RW 004', '2184301921', 'SUZUKI BALENO', 'WRT000398', 'MBHHWBA3SNG249317', '', 31, '2022-11-01', 155, 1750000, 1, 'Y', 'Y', 1750000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(399, 'AKHMAD YUDHI WAHYUDIN ', 'PERUM JATI ASIH INDAH BLOK C 10/400 JL IRIAN JAYA', '81511394822', 'ALL NEW ERTIGA GX AT 2022', 'WRT000399', 'MHYANC32SNJ103526', 'B 2942 KID', 45, '2022-11-02', 155, 3300000, 1, 'Y', 'Y', 0, '150', '148', '0', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(400, 'YULI NUSADAYANTI DRA', 'JL TMN KBN SIRIH IV 3 RT 3/8 KP BALI TN ABANG JAKARTA PUSAT', '81381385284', 'HYUNDAI CRETA', 'WRT000400', 'MF3PE812TNJ035052', 'B 2793 PZB', 35, '2022-11-02', 155, 2000000, 1, 'Y', 'Y', 0, '153', '0', '0', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(401, 'PT MEKAR LANGGENG PERKASA', 'JL RAYA KADUMANGURT 003 RW 002 BABAKAN MADANG BOGOR', '21879533447', 'HYUNDAI SANTAFE', 'WRT000401', 'MF3S381HVNJ000562', '', 41, '2022-11-02', 155, 3000000, 1, 'Y', 'Y', 3000000, '149', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(402, 'KUSMIATI', '', '817111800', 'SUZUKI XL 7', 'WRT000402', 'MHYANC22SNJ109019', '', 45, '2022-11-04', 155, 3200000, 1, 'Y', 'Y', 1400000, '151', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(403, 'SUBAGYO', 'JL BUNI SALAK RT 011 RW 004 KEL MUNJUL KEC CIPAYUNG', '87742611607', 'MITSUBISHI XPANDER', 'WRT000403', 'MK2NCXTATNJ006038', '', 59, '2022-11-04', 155, 2900000, 1, 'Y', 'Y', 2600000, '152', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(404, 'AHMAD ISKANDAR', 'KOMP POLRI PONDOK KARYA BLOK 1 NO 53 RT 010 RW 004', '8118301105', 'HONDA HR-V', 'WRT000404', 'MHRRU1850HJ606498', '01-07-2020', 70, '2022-11-05', 155, 0, 1, 'Y', 'Y', 500000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(405, 'MUHAMAD TAHMID FIKRIYANA', 'KP TLANJUNG RT 001 RW 011 CIKEAS UDIK ', '81776668002', 'MOTOR VESPA', 'WRT000405', 'RP8M66701NV040734', '', 94, '2022-11-05', 155, 550000, 1, 'Y', 'Y', 700000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(406, 'SAIN BIN MOSON', 'KRANGGAN PASAR RT 02 RW 01 JATISAMPURNA BEKASI', '85697443633', 'HONDA BRIO', 'WRT000406', 'MHRDD1750MJ108249', 'B 2811 KZI', 14, '2022-11-07', 155, 250000, 1, 'Y', 'Y', 750000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(407, 'SUKARMI', 'JL WARAKAS 6 GG 16 RT5/5', '', 'HONDA BRIO', 'WRT000407', 'MHRDD1890NJ241313', '', 18, '2022-11-07', 155, 320000, 1, 'Y', 'Y', 1280000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(408, 'AHMAD MARUFI', 'JL MADRASAH XI NO 1A RT 005 RW 010 KEL CIPINANG CEMPEDAK', '81297675788', 'MITSUBISHI XPANDER', 'WRT000408', 'MK2NCXTATNJ005461', '', 35, '2022-11-07', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(409, 'RETNO UTARI TRIASTO', 'GRIYA AGUNG SENTOSA C3 NO 12 RT 005 RW 004 JATIMURNI', '8119623221', 'HONDA HR-V', 'WRT000409', 'MHRRV3850NJ202765', '', 59, '2022-11-07', 155, 3050000, 1, 'Y', 'Y', 2450000, '149', '153', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(410, 'RATIH MULYA WULAN SONGO', 'JL JATIMULYA NO 72 RT 03 RW 06 CINERE', '81398918456', 'HYUNDAI CRETA', 'WRT000410', 'MF3PE812TNJ029532', '', 35, '2022-11-08', 155, 2000000, 1, 'Y', 'Y', 2000000, '152', '150', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(411, 'NANDA NURUL AIDA', 'KOMP TIMAH BLOK AA 16 KELAPA DUA', '', 'MITSUBISHI EXPANDER CROSS', 'WRT000411', 'MK2NCXTATNJ006885', '', 19, '2022-11-09', 155, 740000, 1, 'Y', 'Y', 1260000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(412, 'SUMIYADI', 'JLN SMP 160 NO 42 RT 003 RW 001', '8176664104', 'HONDA HR-V', 'WRT000412', 'MHRRV3870NJ210516', '', 95, '2022-11-10', 155, 4500000, 1, 'Y', 'Y', 2900000, '148', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(413, 'AHMAD SYAH FARHAN RACHMAN', 'KP RAWAJAMUN RT 004 RW 004 DAYEUH CILEUNGSI', '85719888226', 'HONDA  HR-V', 'WRT000413', 'MHRRV3890NJ202664', '', 95, '2022-11-10', 155, 4500000, 1, 'Y', 'Y', 2900000, '148', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(414, 'PT ANIN TRANS TIGA', 'JL LETNAN SUTOPO RUKO PARIS SQUARE', '82183319150', 'TOYOTA FORTUNER', 'WRT000414', 'MHFGB8GS8K0890737', '', 32, '2022-11-11', 155, 1300000, 1, 'Y', 'Y', 2700000, '150', '149', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(415, 'MEI SAPUTRA', 'JL KARYA TANI GG PERTAMA NO 10', '', 'MITSUBISHI XPANDER', 'WRT000415', 'MK2NCXTATNJ006823', '', 19, '2022-11-12', 155, 1100000, 1, 'Y', 'Y', 900000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(416, 'PT DELTA GLOBAL STRUKTUR QQ TONI', 'PERUM DELTA RAYA NO A-78 PEKAYON RT 02 RW 07', '816826369', 'MINI COUPR', 'WRT000416', 'MHHYS9601JK9623B2', '22/09/2021', 70, '2022-11-12', 155, 0, 1, 'Y', 'Y', 500000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(417, 'RINA ARIESANDY', 'CITRA GRAN BLOK G 21 NO 23 KEL JATIKARYA KEC JATISAMPURNA', '81281816774', 'HONDA CR-V', 'WRT000417', 'MHRRW1880NJ201685', '-', 32, '2022-11-12', 155, 2000000, 1, 'Y', 'Y', 0, '0', '153', '0', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(418, 'SYAIFUL MUSLIMIN', 'DSN TONGGOA KEC PRIGEN PSR', '81322518245', 'TOYOTA FORTUNER', 'WRT000418', 'MHFGB8GS2J0876461', '', 20, '2022-11-14', 155, 0, 1, 'Y', 'Y', 2400000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(419, 'EVA NOVIANTI', 'VILLA CIOMAS INDAH BLOK G5', '85716118405', 'HYUNDAI CRETA', 'WRT000419', 'MF3PE812TNJ033501', '', 31, '2022-11-14', 155, 2100000, 1, 'Y', 'Y', 1400000, '150', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(420, 'RAFI ILHAM', 'JL DURIAN D-27 RT 004 RW 006', '', 'XPANDER CROSS', 'WRT000420', 'MK2NCXTATNJ006881', '', 35, '2022-11-15', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(421, 'VITRI IRIANI', 'JL BATU CEPER IV NO 2 A RT 010 RW 001', '8176770083', 'HONDA BRIO', 'WRT000421', 'MHRDD1890NJ204259', '', 105, '2022-11-15', 155, 4000000, 1, 'Y', 'Y', 3300000, '149', '152', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(422, 'FEBRIYANTO', 'JL H JEGU RT 003 RW 003 KEL CIPADU KEC LARANGAN', '82124511911', 'FORD EVEREST', 'WRT000422', 'MNBLS4B404W107320', '', 21, '2022-11-15', 155, 0, 1, 'Y', 'Y', 2600000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(423, 'HAMDAN AHADA', 'DENAYA GREEN RESIDENCE JL LURAH NAMAT', '8112400300', 'TOYOTA INNOVA', 'WRT000423', 'MHFAB8EM9NO119010', '', 106, '2022-11-16', 155, 0, 1, 'Y', 'Y', 7500000, '149', '153', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(424, 'KEVIN NELSON RICARDO', 'GRIYA ALAM SENTOSA BLOK N14 NO 22', '85157717970', 'HONDA MOBILIO', 'WRT000424', 'MHRDD4850GJ601768', '', 99, '2022-11-16', 155, 650000, 1, 'Y', 'Y', 550000, '152', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(425, 'DANIEL GEONARDO', '', '', 'MAZDA CX - 5', 'WRT000425', 'JM6KF2WLAN0778954', '', 36, '2022-11-16', 155, 4500000, 1, 'Y', 'Y', 0, '149', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(426, 'KIKI PURNAMASARI', 'VILLA PERTIWI BLOK N-5 NO 5 RT 003 RW 016 SUKAMAJU CILODONG', '81297774335', 'HONDA HR-V', 'WRT000426', 'MHRRV3890NJ203757', '', 63, '2022-11-17', 155, 3300000, 1, 'Y', 'Y', 2700000, '150', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(427, 'ELMANSYAH', 'KELAPA TIGA RT 011 RW 003 KEL JAGAKARSA KE JAGAKARSA', '', 'MITSUBISHI PAJERO DAKAR', 'WRT000427', 'MK2KRWPNUNJ009755', '', 20, '2022-11-18', 155, 1400000, 1, 'Y', 'Y', 1000000, '151', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(428, 'MOCHAMAD SUBHAN', 'PERMATA DEPOK PIRUS K10 14 RT 010 RW 007 PONDOK JAYA DEPOK', '83808883438', 'HYUNDAI SANTAFE', 'WRT000428', 'MF3S381HVNJ000625', '', 36, '2022-11-19', 155, 2250000, 1, 'Y', 'Y', 2250000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(429, 'DHITA TRI APRILIA NINGRUM', 'JATIRANGGON RT 04/06 JATISAMPURNA BEKASI', '', 'TOYOTA RAIZE', 'WRT000429', 'MHKAA1BA3NJ051187', '', 35, '2022-11-19', 155, 800000, 1, 'Y', 'Y', 3200000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(430, 'ZAHIRMAN', 'KP KALIMANGGIS RT 004 RW 005 KEL HARJAMUKTI KEC CIMANGGIS', '81398918456', 'HYUNDAI CRETA', 'WRT000430', 'MF3PE812TNJ045988', '', 35, '2022-11-19', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(431, 'YOHANA ANDRYANI', 'PERUM GREEN SARIWANGI KAV 12 A', '', 'XPANDER CROSS', 'WRT000431', 'MK2NCXTATNJ006333', '', 95, '2022-11-21', 155, 4500000, 1, 'Y', 'Y', 2900000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(432, 'NADYA DIAN PRATIWI QQ EDWIN ANDRIANUS JUNIAR', 'MUTIARA SENTUL CLUSTER THE NATURE BLOK IB NO 12', '8112342911', 'HYUNDAI CRETA PRIME', 'WRT000432', 'MF3PE812TNJ047883', '', 59, '2022-11-22', 155, 3050000, 1, 'Y', 'Y', 2450000, '149', '153', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(433, 'TINA LUSIANA', 'JL MARGONDA NO 38 RT 001 RW 011', '', 'MITSUBISHI NEW XPANDER CROSS', 'WRT000433', 'MK2NCXTATNJ007317', '', 31, '2022-11-22', 155, 3500000, 1, 'Y', 'Y', 0, '149', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(434, 'PUTRA DWIPA', 'JLN CIPINANG INDAH BLOK E/4A RT/RW 007/016 KEC JATINEGARA', '818799497', 'HONDA BR-V ', 'WRT000434', 'MHRD63880NJ308727', '', 95, '2022-11-23', 155, 4400000, 1, 'Y', 'Y', 3000000, '148', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(435, 'DEAN FADHUROHMAN HAFIZH ', 'JL RAYA CONDET 8.A RT 004 RW 003', '81213319192', 'HYUNDAI CRETA', 'WRT000435', 'MF3PE812TNJ047773', '-', 35, '2022-11-23', 155, 2000000, 1, 'Y', 'Y', 0, '150', '0', '0', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(436, 'SUWARNO', 'KP SINDANG KARSA RT 002/008 SUKAMAJU BARU TAPOS DEPOK ', '81288976616', 'TOYOTA RUSH', 'WRT000436', 'MHKE8FB3JNK076731', '', 19, '2022-11-23', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(437, 'SUPANDRIYAMAN', 'JL DELIMA VI/1 NO 74 RT 1/5 JAKTIM', '85157717970', 'HONDA CR-V', 'WRT000437', 'MHRRW1880MJ106875', '', 107, '2022-11-23', 155, 4900000, 1, 'Y', 'Y', 3000000, '148', '149', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(438, 'ISKANDAR', '', '', 'MAZDA CX 3', 'WRT000438', 'JM6DKZW7AKO425634', '26/06/2020', 70, '2022-11-24', 155, 0, 1, 'Y', 'Y', 500000, '150', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(439, 'AGUNG SETIYONO', 'KP KEBAYUNAN RT 001 RW 018 KEL TAPOS', '81236775552', 'HYUNDAI CRETA', 'WRT000439', 'MF3PE812TNJ045534', '', 31, '2022-11-25', 155, 1750000, 1, 'Y', 'Y', 1750000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(440, 'PT SANDI MULYA MANDIRI', 'JL TB SIMATUPANG NO 18 ', '81398918456', 'HONDA HR-V', 'WRT000440', 'MHRRV3890NJ203013', '', 35, '2022-11-25', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(441, 'RAYMOND ANDREAS HUTAPEA', 'LEGENDA WISATA ZONA EINSTEIN R 9/5 NAGRAK GUNUNG PUTRI', '8111893272', 'SUZUKI XL 7', 'WRT000441', 'MHYANC22SLJ109708', '', 35, '2022-11-25', 155, 1200000, 1, 'Y', 'Y', 2800000, '150', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(442, 'KARMILA SARI ', 'JL H NAWI DALAM III NO 22 RT 5/2', '81383030086', 'MAZDA 2 ', 'WRT000442', 'MM6DJ2HAANW825857', '', 31, '2022-11-26', 155, 1750000, 1, 'Y', 'Y', 1750000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(443, 'MAXIMILIAN FRISCH ', 'JL CIPETE RAYA NO 9/A5 CILANDAK', '87875127605', 'WULING CORTEZ ', 'WRT000443', 'MK3AAAGA6NJ011558', '', 108, '2022-11-26', 155, 4200000, 1, 'Y', 'Y', 4200000, '149', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(444, 'RUSMAN', 'GDC SEKTOR MELATI BOK E-2/3 RT 004 RW 005', '8989620692', 'XPANDER ULTIMATE CVT', 'WRT000444', 'MK2NCLTATNJ018587', '', 19, '2022-11-28', 155, 1100000, 1, 'Y', 'Y', 900000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(445, 'ENDANG', 'PURI GADING BLOK A6 NO 05 RT 03 RW 07 JATIMELATI BEKASI', '8121231345', 'PAJERO SPORTS', 'WRT000445', 'MMBGUKR10HH013234', '', 50, '2022-11-28', 155, 1300000, 1, 'Y', 'Y', 2500000, '148', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(446, 'MULYADI', 'JL H JAMHUR RT 004 RW 001', '', 'XPANDER ULTIMATE ', 'WRT000446', 'MK2NCLTATNJ018217', '', 35, '2022-11-29', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(447, 'AKHMAD TAUFIK ISKANDAR', 'JL CEMARA II NO 6 KOMPLEK AL RT 004 RW 003', '128109978', 'HONDA BR-V ', 'WRT000447', 'MHRDG3860NJ307553', '', 31, '2022-11-29', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(448, 'SUTOPO', 'KP CIRUKULU RT 003 RW 002 CIPENJO CILEUNGSI', '81210106045', 'HONDA BRIO', 'WRT000448', 'MHRDD1850NJ301956', '', 18, '2022-11-30', 155, 1100000, 1, 'Y', 'Y', 500000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(449, 'YONI HANINDITA ', '', '8161475420', 'SUZUKI XL 7', 'WRT000449', 'MHYANC22SNJ116420', '', 109, '2022-12-01', 155, 500000, 1, 'Y', 'Y', 3000000, '150', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(450, 'ROBINHOT TAMPUBOLON', 'CIBUBUR COUNTRY LILY NORT', '81298229107', 'TOYOTA RUSH', 'WRT000450', 'MHKE8FB3JNK076954', '', 19, '2022-12-01', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(451, 'DANY', 'CIBUBUR COUNTRY ', '85229979060', 'MITSUBISHI XPANDER', 'WRT000451', 'MK2NCWPARJJ004067', '', 19, '2022-12-01', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(452, 'JALINSON SARAGIH ', 'JL ARENA NO 5 RT 001 RW 008 KEMIRIMUKA BEJI ', '81314234401', 'HONDA CR-V', 'WRT000452', 'MHRRW1880NJ301303', '', 65, '2022-12-01', 155, 4550000, 1, 'Y', 'Y', 3050000, '148', '149', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(453, 'ICO ANDREAS HATORANGAN SAGALA', 'JL PRUMPUNG TENGAH RT 004 RW 005 KEL CIPINANG', '81212611926', 'HONDA BRIO', 'WRT000453', 'MHRDD1890NJ242098', '', 34, '2022-12-02', 155, 1750000, 1, 'Y', 'Y', 1750000, '152', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(454, 'MISNAN NAHMANSYAHRI', 'KP PABUARAN RT 002 RW 003 KEL JATIRANGGON KEC JATISAMPURNA', '81905085239', 'MITSUBISHI PAJERO DAKAR', 'WRT000454', 'MK2KSWPNUNJ002177', '', 20, '2022-12-02', 155, 300000, 1, 'Y', 'Y', 2100000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(455, 'DONI LUANDA', 'JL MUSHOLA FATHUR RAHMAH NO 75 RANGKAPAN JAYA BARU DEPOK ', '81381387990', 'MITSUBISHI XPANDER', 'WRT000455', 'MK2NCLTATNJ014128', '', 15, '2022-12-02', 155, 550000, 1, 'Y', 'Y', 650000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(456, 'PT OPTIMA JEJARING NUSANTARA', 'GEDUNG MENARA BATAVIA LT 5', '', 'MARCEDES BENZ S450', 'WRT000456', 'MHL223161NJ000227', '', 33, '2022-12-02', 155, 2250000, 1, 'Y', 'Y', 2250000, '148', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(457, 'SUGENG HERMANSAH ST', 'JL TANJUNG WANGI NO 12 RT 004 RW 012', '8111530729', 'HONDA CITY', 'WRT000457', 'MHRGN5890NJ300687', '', 19, '2022-12-03', 155, 1400000, 1, 'Y', 'Y', 600000, '151', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(458, 'ALYNDA NUR ARFYANA ', 'JL BOMBAR NO 9 RT 003 RW 004 ', '', 'HONDA BR-V', 'WRT000458', 'MHRDG3860NJ307509', '', 31, '2022-12-03', 155, 1750000, 1, 'Y', 'Y', 1750000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(459, 'YUSUF', 'JL KEBAGUSAN RY/WATES/6B3', '8111028886', 'HONDA BRIO', 'WRT000459', 'MHRDD1890MJ109932', '', 78, '2022-12-05', 155, 1100000, 1, 'Y', 'Y', 1800000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(460, 'ATIKAH R', 'BHARATA PURA BLOK VI NO 9', '8111526846', 'MITSUBISHI PAJERO', 'WRT000460', 'MK2KRWPNUJJ011330', '', 107, '2022-12-05', 155, 1550000, 1, 'Y', 'Y', 6350000, '148', '149', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(461, 'SELVI ELVIANA PUTRI', 'KRANGGAN WETAN RT 01 JATISAMPURNA BEKASI', '81318990496', 'HONDA CIVIC', 'WRT000461', 'MRHFE1680NP290296', '', 70, '2022-12-05', 155, 0, 1, 'Y', 'Y', 500000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(462, 'SRI HARJONO', 'DUKUH ZAMRUD BLOK K 18 NO 21', '', 'MITSUBISHI PAJERO', 'WRT000462', 'MK2KSWPNUNJ002059', '', 60, '2022-12-05', 155, 3400000, 1, 'Y', 'Y', 3000000, '148', '150', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(463, 'ARIF BUDIMAN', '', '87785083468', 'WULING ALMAZ', 'WRT000463', 'MK38AA6A7LJ005219', '', 70, '2022-12-07', 155, 0, 1, 'Y', 'Y', 500000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(464, 'FAKHRIAN HAKIM', 'KOM BUANA ASRI KAV IV RT  008 RW 004', '8118143999', 'SUZUKI BALENO', 'WRT000464', 'MBHHWBA3SNG272062', '', 15, '2022-12-07', 155, 700000, 1, 'Y', 'Y', 500000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(465, 'ARRY REVO LIANSYAH,SE', 'JL MAYJEN ISHAK DJUARSA RT 001 RW 009', '81219209135', 'FORTUNER ', 'WRT000465', 'MHFAA8GS4N0790504', '', 36, '2022-12-07', 155, 2250000, 1, 'Y', 'Y', 2250000, '149', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(466, 'LUKMAN HADI', 'LEGENDA WISATA MOZART BLOK G 2/19', '81586895863', 'DAIHATSU LUXIO', 'WRT000466', 'MHKW3CA3JKK023547', '', 110, '2022-12-08', 155, 0, 1, 'Y', 'Y', 1200000, '151', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(467, 'PIET INDRA HERMAWAN', 'JL PEGAMBIRAN NO 55 RT 008 RW 010', '82130007799', 'HYUNDAI STARGAZER', 'WRT000467', 'MF3NE81DTNJ014241', '', 35, '2022-12-08', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(468, 'YESSY ARLINA', 'KRANGGAN NO 57 RT 003 RW 002 JATISAMPURNA ', '8129968836', 'WULING CORTEZ ', 'WRT000468', 'MK3AAAGA0NJ008445', '', 20, '2022-12-09', 155, 1600000, 1, 'Y', 'Y', 800000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00');
INSERT INTO `t_transaksi` (`id`, `nama`, `alamat`, `tlp`, `jns_kendaraan`, `waranti`, `no_rangka`, `no_polisi`, `id_teknisi`, `tgl`, `id_sales`, `diskon`, `admin`, `sts_point`, `sts_klaim`, `total_b`, `tek1`, `tek2`, `tek3`, `tek4`, `sts_book`, `booking`, `sts_hapus`, `tgl_hapus`, `tgl_server`, `tgl_booking`, `status_bayar`, `tgl_lunas`) VALUES
(469, 'ANTONIUS YULISTIANTO', 'KOTA WISATA CLUSTER CALGARY BLOK UE ', '8787664079', 'HONDA HR-V', 'WRT000469', 'MHRRV3870NJ210643', '', 59, '2022-12-09', 155, 3050000, 1, 'Y', 'Y', 2450000, '152', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(470, 'AGENG', 'JL PELANGI VI BLOK 52/3 CIMANGGIS DEPOK', '81399110837', 'HYUNDAI CRETA PRIME', 'WRT000470', 'MF3PE812TNJ041099', '', 111, '2022-12-10', 155, 2900000, 1, 'Y', 'Y', 2500000, '153', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(471, 'ENDI FITRI HERLIANTO ', 'JL DANAU MAHALONA B 4/14 RT 004 RW 021 KEL MEKARSARI KEC CIMANGGIS DEPOK', '', 'MAZDA CX-5', 'WRT000471', 'JM6KF2WLAN0801992', '', 32, '2022-12-10', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(472, 'ABDUL MUIZ', 'VANCOUVER UA 6 NO 1 KOTA WISATA CIBUBUR', '8123453450', 'TOYOTA FORTUNER', 'WRT000472', 'MHFAA8GS3N0787514', '', 112, '2022-12-13', 155, 3420000, 1, 'Y', 'Y', 4980000, '151', '149', '150', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(473, 'LIA SUWANDI', 'KP SANDING II RT 8 RW 4 BOJONG NANGKA', '81110653430', 'VW POLO', 'WRT000473', 'WVWZZZ6RZCU070692', '', 34, '2022-12-13', 155, 2100000, 1, 'Y', 'Y', 1400000, '152', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(474, 'SEO IL SUNG', 'KOTA WISATA CLUSTER BARCELONA BLOK SB 4/22 R CIANGSANA', '8118167809', 'HONDA BRIO', 'WRT000474', 'MHRDD1890NJ350256', '', 30, '2022-12-14', 155, 1500000, 1, 'Y', 'Y', 1500000, '149', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(475, 'PT ASIA MULIA T QQ HADI', 'JL BOULEVARD BRT RAYA BLK A2/44 ', '', 'KIA SONET', 'WRT000475', 'MZBFC814TNN162495', '', 70, '2022-12-15', 155, 0, 1, 'Y', 'Y', 500000, '149', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(476, 'DENISE YOESMITA', 'GG DELIMA NO 113 RT 009 RW 002', '', 'HONDA BR-V', 'WRT000476', 'MHRDG3880NJ309177', '', 111, '2022-12-15', 155, 3550000, 1, 'Y', 'Y', 1850000, '152', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(477, 'BARA WIJIANTO', 'JL BATU RATNA II NO 37 RT 017 RW 005', '81213656563', 'HYUNDAI STARGAZER PRIME', 'WRT000477', 'MF3NE81DTNJ011662', '', 19, '2022-12-15', 155, 1000000, 1, 'Y', 'Y', 1000000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(478, 'CORNELIA ANDINI NORMA GUPITA', 'JATIMULYA JAYA BLOK J/491 RT 19 RW 11', '87783076366', 'HYUNDAI CRETA', 'WRT000478', 'MF3PE812TNJ044649', '', 31, '2022-12-17', 155, 2100000, 1, 'Y', 'Y', 1400000, '149', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(479, 'WATIM', 'JL MUJAER KRANGGAN KULON JATIRADEN BEKASI', '87874322046', 'MITSUBISHI PAJERO', 'WRT000479', 'MK2KRWPNUKJ000892', '', 97, '2022-12-17', 155, 300000, 1, 'Y', 'Y', 500000, '151', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(480, 'RIDA WIDARKA', 'JL SUBUR PERTAMINA RT 4 RW 2 NO 112 PONDOK RANGGON CIPAYUNG', '8129094619', 'XPANDER CROSS', 'WRT000480', 'MK2NCLTATNJ018811', '', 31, '2022-12-17', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(481, 'PT DELTA GLOBAL STRUKTUR QQ TONI', 'JL PONDOK KELAPA DUREN SAWIT JAKTIM', '816826369', 'HONDA HR-V', 'WRT000481', 'MHRRV3870NJ200125', '', 31, '2022-12-21', 155, 500000, 1, 'Y', 'Y', 3000000, '150', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(482, 'RICKY MARKUS', 'TAMAN ANGGREK RESIDENCE B 1 A RT 09 RW 05', '8,57783E+11', 'NISSAN GRAND LIVINA ', 'WRT000482', 'MHBG1CG1FBJ064428', '', 114, '2022-12-21', 155, 0, 1, 'Y', 'Y', 1100000, '152', '153', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(483, 'BAYU AJI WIBOWO', 'GRAND NUSA INDAH BLOK O4 NO. 3', '', 'HONDA BR-V', 'WRT000483', 'MHRDG3880NJ302411', '', 115, '2022-12-21', 155, 0, 1, 'Y', 'Y', 1050000, '149', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(484, 'PT DELTA GLOBAL STRUKTUR QQ TONI', 'Jl Delta Raya no A-78 Pekayon Rt02 Rw07 Bekasi Selatan 17148', '816826369', 'HONDA CIVIC', 'WRT000484', 'MRHFK4840MT011300', '22/08/2021', 70, '2022-12-21', 155, 0, 1, 'Y', 'Y', 500000, '151', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(485, 'ARDEN ERLANGGA', 'JL KEBAHAGIAAN BLOK A NO 13 RT 01/05 CIMANGGIS', '8159600933', 'HONDA CR-V', 'WRT000485', 'MHRRW1880MJ102307', '', 70, '2022-12-21', 155, 0, 1, 'Y', 'Y', 500000, '149', '150', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(486, 'EKA MUSTIKA YULIANTI', 'KRANGGAN LEMBUR RT 03 RW 02 JATIRANGGA JATISAMPURNA BEKASI', '8118868500', 'TOYOTA KIJANG INNOVA', 'WRT000486', 'MHFGB8EM7G0408383', '', 32, '2022-12-23', 155, 1100000, 1, 'Y', 'Y', 2900000, '152', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(487, 'RULLY SAPUTRA', 'PONDOK CIPTA RAYA RT 003 RW 009', '81311657180', 'HONDA BR-V', 'WRT000487', 'MHRDG3880NJ308081', '', 59, '2022-12-23', 155, 3050000, 1, 'Y', 'Y', 2450000, '148', '149', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(488, 'RICHI TENRI PADA DJAJADI', 'CIBUBUR GARDEN BLOK F 1 NO 3 ', '81315166611', 'WULING AIR EV LONG RANGE', 'WRT000488', 'MK3AACE24NJ003451', '', 30, '2022-12-23', 155, 1400000, 1, 'Y', 'Y', 1600000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(489, 'HERI YANTO SAPUTRA ', 'JL CIKUNIR RAYA JAKA MULYA RT 005 RW 003', '81318885898', 'TOYOTA KIJANG INNOVA', 'WRT000489', 'MHFJB8EM3J103036', '', 32, '2022-12-24', 155, 2250000, 1, 'Y', 'Y', 1750000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(490, 'FARID AKBAR DAWAMI', 'JL PETOJO ENCLEK V NO 4 RT 005 RW 007', '87877981548', 'MAZDA CX-3', 'WRT000490', 'JM6DK2W7AH0301912', '', 31, '2022-12-24', 155, 1300000, 1, 'Y', 'Y', 2200000, '152', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(491, 'HARRY CANDRA WIBOWO ', 'KEBON PALA RT 7/1 MAKASAR JAKTIM', '818545575', 'HONDA CR-V', 'WRT000491', 'MHRRW3830NJ300099', 'B 1080 TJZ', 64, '2022-12-26', 155, 2500000, 1, 'Y', 'Y', 0, '0', '148', '151', '0', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(492, 'FITRI HAPSARI  ', 'KEBON PALA RT 7/1 MAKASAR JAKTIM', '818545575', 'MITSUBISHI XPANDER ', 'WRT000492', 'MK2NCWTARHJ003658', '', 31, '2022-12-26', 155, 1050000, 1, 'Y', 'Y', 2450000, '150', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(493, 'HERU SURJO NUGROHO', 'JL DIMUN RAYA RT 005 RW 006 KEL SUKAMAJU KEC CILODONG', '81289322988', 'TOYOTA AVANZA', 'WRT000493', 'MHKAB1BY6NK041922', '', 19, '2022-12-26', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(494, 'MARIA PUSPITA AYUDIAH R', 'JL KAYU MAS SELATAN IV/90 RT 002 RW 009 PULO GADUNG ', '87880153488', 'HONDA WR-V', 'WRT000494', 'MHRDG4860NJ350012', '', 59, '2022-12-27', 155, 3050000, 1, 'Y', 'Y', 2450000, '153', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(495, 'NANANG INJUM WAHYUDI AMD', 'PERUM MARGAHAYU JAYA BLOK D RT 003 RW 018', '81346257257', 'MAZDA CX-3 5WGN RHD', 'WRT000495', 'MM6DK2WAANW518740', '', 63, '2022-12-27', 155, 3200000, 1, 'Y', 'Y', 2800000, '151', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(496, 'PUTRI PRATIWI', 'KP SINDANGKARSA RT 004 RW 015', '85780576644', 'HYUNDAI STARGAZER PRIME', 'WRT000496', 'MF3NE81DTNJ004444', '', 111, '2022-12-28', 155, 2900000, 1, 'Y', 'Y', 2500000, '150', '149', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(497, 'YANTO', 'JL RAYA JAKARTA BOGOR CISALAK RT 001 RW 004', '818110489', 'KIA CARNAVAL', 'WRT000497', 'KNHNC37BMN6210684', '', 65, '2022-12-28', 155, 3500000, 1, 'Y', 'Y', 4100000, '152', '150', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(498, 'HADIYANTO DJAPRI ', 'JL PONDOK DUTA RAYA RT 002 RW 028 DEPOK', '82188771679', 'SUZUKI IGNIS', 'WRT000498', 'MA3NFG81SK0237294', '', 35, '2022-12-28', 155, 1500000, 1, 'Y', 'Y', 2500000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(499, 'NENI RISTIANA ', 'GG H ENTONG RT 002 RW 014', '87779265748', 'HONDA HR-V', 'WRT000499', 'MHRRV3870NJ212197', '', 31, '2022-12-28', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(500, 'WULAN YULIAN', 'PERUMAHAN GRAND NUSA INDAH', '81224268707', 'HONDA WR-V', 'WRT000500', 'MHRDG4860NJ300338', '', 19, '2022-12-28', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(501, 'GUNAWAN RAHARJA', 'JL DELTA SERDANG RT 2/7 SERDANG', '', 'HYUNDAI CRETA', 'WRT000501', 'MF3PB812TNJ011604', '', 23, '2022-12-29', 155, 490000, 1, 'Y', 'Y', 910000, '151', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(502, 'GREATNA PRISDHIAN', 'JL KEMANGGISAN RAYA NO 3 RT 001 RW 005', '82113148029', 'HYUNDAI STARGAZER PRIME', 'WRT000502', 'MF3NE81DTNJ010613', '', 40, '2022-12-29', 155, 2750000, 1, 'Y', 'Y', 2750000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(503, 'KEVIN RACHMAN', 'KOTA WISATA AMSTERDAM BLOK 1.5/80 RT 006 RW 025', '8119941694', 'HONDA WR-V', 'WRT000503', 'MHRDG4860NJ300349', '', 111, '2022-12-29', 155, 2900000, 1, 'Y', 'Y', 2500000, '151', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(504, 'ANGGI FIANNI S.I.KOM', 'JL CEMPAKA  2 KAV DKI BLOK 94/26 RT 003 RW 010', '85600999588', 'HONDA HR-V ', 'WRT000504', 'MHRRV3870NJ211498', '', 59, '2022-12-30', 155, 3050000, 1, 'Y', 'Y', 2450000, '151', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(505, 'SUDIYANTO', '-', '87785522055', 'WULING ALMAZ', 'WRT000505', 'MK3BAAGA2NJ002876', '', 32, '2022-12-30', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(506, 'NENCY AMELIA', 'PAMULANG PERMAI II ', '-', 'MITSUBISHI PAJERO', 'WRT000506', 'MK2KRWPNUNJ014147', '', 64, '2023-01-03', 155, 3650000, 1, 'Y', 'Y', 3250000, '149', '151', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(507, 'GILANG PRADHYPTA', 'CITRA INDAH CITY BUKIT ROSELLA BLOK AW 11 NO 5 SINGAJAYA', '82116758094', 'HYUNDAI STARGAZER PRIME', 'WRT000507', 'MF3NE81DTNJ012294', '', 35, '2023-01-03', 155, 2200000, 1, 'Y', 'Y', 1800000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(508, 'RATNA YUDYTHIA ANDAYANI', 'D MARCO CASABLANCA E 20 RT 6/1 CILODONG', '81290730460', 'HYUNDAI CRETA', 'WRT000508', 'MF3PE812TNJ046295', '', 31, '2023-01-03', 155, 2100000, 1, 'Y', 'Y', 1400000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(509, 'KARLINAH', 'JL CEMPAKA BARU NO 42', '', 'MITSUBISHI XPANDER ', 'WRT000509', 'MK2NCLTATNJ015711', '', 19, '2023-01-03', 155, 1100000, 1, 'Y', 'Y', 900000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(510, 'JEMMY YOHANES', 'JL DALANG GG SEMAR NO 30 RT 10/RW 005', '8118855999', 'TOYOTA INNOVA', 'WRT000510', 'MHFABAAA5N0002074', '', 36, '2023-01-04', 155, 2600000, 1, 'Y', 'Y', 1900000, '149', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(511, 'SITI FATIMAH', 'JL LEMBUR 2 RT 001 RW 004 JATIRANGGA', '', 'MAZDA CX 30', 'WRT000511', 'JM6DM2W7AL0102184', '', 97, '2023-01-04', 155, 600000, 1, 'Y', 'Y', 200000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(512, 'RAGA AURA DEWA', 'KOMP TWP TNI AL BLOK B.1/2', '81380700869', 'HONDA HR-V', 'WRT000512', 'MHRRV3870NJ212727', '', 59, '2023-01-04', 155, 3050000, 1, 'Y', 'Y', 2450000, '148', '154', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(513, 'DRA REVRINA SUKMA AGUSTI', 'BUKIT BOGOR RAYA BLOK 1 RT 002 RW 014', '85716118405', 'HYUNDAI CRETA', 'WRT000513', 'MF3PE812TNJ009792', '', 31, '2023-01-04', 155, 2100000, 1, 'Y', 'Y', 1400000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(514, 'HOSNOL HOTIMAH', 'KMP PONDOK UDIK RT 001 RW 003', '81802214770', 'MITSUBISHI XPANDER ', 'WRT000514', 'MK2NCLTATNJ012831', '', 35, '2023-01-05', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(515, 'EKA MUSTIKA YULIANTI', 'KRANGGAN LEMBUR RT 03 RW 02 JATIRANGGA JATISAMPURNA BEKASI', '8118868500', 'VESPA SUPER 150 CC', 'WRT000515', 'VBB2T2622033', '', 94, '2023-01-05', 155, 550000, 1, 'Y', 'Y', 700000, '151', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(516, 'ANDRI WIJAYA', 'KP CIBEBER RT 14 /006 KELAPA NUNGGAL', '87754535807', 'HONDA CR-V', 'WRT000516', 'MHRRW1880NJ370481', '', 32, '2023-01-05', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(517, 'YUNI ARROSIDAH', 'PERMATA HIJAU PERMAI 17 KALIABANG', '8111332344', 'HYUNDAI CRETA', 'WRT000517', 'MF3PE812TNJ014504', '', 23, '2023-01-05', 155, 490000, 1, 'Y', 'Y', 910000, '148', '151', '154', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(518, 'ADITYA NOOR FAUZI', 'JL PIL KB BLOK AG 2/10 RT 7 RW 14', '8129285344', 'HONDA BRIO SATYA', 'WRT000518', 'MHRDD1850NJ214257', '', 70, '2023-01-06', 155, 0, 1, 'Y', 'Y', 500000, '150', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(519, 'YUDI MAWARDI', '', '81210658099', 'HYUNDAI STARGAZER', 'WRT000519', 'MF3NE81DTNJ012986', '', 35, '2023-01-06', 155, 2250000, 1, 'Y', 'Y', 1750000, '149', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(520, 'BUDI WICAKSONO', 'JL HARAPAN INDAH X NO 5', '82125944401', 'HYUNDAI CRETA', 'WRT000520', 'MF3PC812TNJ031667', '', 23, '2023-01-07', 155, 490000, 1, 'Y', 'Y', 910000, '154', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(521, 'UNAY', 'DAMPYAK RT 003 RW 004', '85770401739', 'HONDA BR-V', 'WRT000521', 'MHRDG3860NJ307575', '', 31, '2023-01-07', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(522, 'IMAM TRI WAHYUDI', 'KP TIPAR  RT 002 RW 011 KEL MEKARSARI KEC CIMANGGIS', '', 'KIA SONET', 'WRT000522', 'MZBFC814TMN069324', '', 31, '2023-01-07', 155, 700000, 1, 'Y', 'Y', 2800000, '150', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(523, 'ASIH KURNIASIH', 'GREEN PARK ROSEWOOD VIII RT 08 RW 02', '811951189', 'HYUNDAI CRETA', 'WRT000523', 'MF3PE812TNJ003730', '', 63, '2023-01-09', 155, 2100000, 1, 'Y', 'Y', 3900000, '150', '153', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(524, 'R DONNY INDRAHYANTO SE', 'JL AHMAD YANI II NO 1 RT 005 RW 004', '', 'HYUNDAI STARGAZER PRIME', 'WRT000524', 'MF3NE81DTNJ010738', '', 19, '2023-01-09', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(525, 'NOVAN YUDA', 'KEMILAU RESIDENCE BLOK 03 RT 007/001 KELAPA DUA WETAN CIRACAS', '8112575193', 'HONDA BR-V DG3', 'WRT000525', 'MHRDG388DNJ308779', '', 59, '2023-01-10', 155, 2550000, 1, 'Y', 'Y', 2950000, '149', '151', '154', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(526, 'EKA MUSTIKA YULIANTI', 'KRANGGAN LEMBUR RT 03 RW 02 JATIRANGGA JATISAMPURNA BEKASI', '8118868500', 'VESPA PIAGGIO', 'WRT000526', '0785 KMA', '', 94, '2023-01-10', 155, 550000, 1, 'Y', 'Y', 700000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(527, 'SUNARTI', 'BEKASI', '81213189192', 'HONDA CR-V', 'WRT000527', 'MHRRW1880MJ100202', '', 70, '2023-01-11', 155, 0, 1, 'Y', 'Y', 500000, '151', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(528, 'ELIN INGGRIANI SH', 'CITRA GRAN CLUST THEDENSE BLOK P7 NO 3', '81315166611', 'WULING ALMAZ', 'WRT000528', 'MK3BAAGA1MJ007095', '', 32, '2023-01-11', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(529, 'AGUS PERMADI', 'LEMBAH NIRMALA II BLOK F4 RT 014 RW 013 MEKARSARI CIMANGGIS', '811192708', 'HONDA CR-V RW1F', 'WRT000529', 'MHRRW1840NJ350074', '', 64, '2023-01-12', 155, 3850000, 1, 'Y', 'Y', 3050000, '149', '151', '154', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(530, 'MATHELDA SASELAH', 'JL BATAN 1 RT 07 RW 05 TIRTAJAYA SUKMAJAYA DEPOK  ', '', 'HYUNDAI CRETA', 'WRT000530', 'MF3PE812TNJ016092', '', 63, '2023-01-12', 155, 2100000, 1, 'Y', 'Y', 3900000, '150', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(531, 'PUTRI DESSI RAHMAWATI', 'JL LAPANGAN  TEMBAK KAV 2E NO 5-12 RT 001 RW 005 KELAPA DUA WETAN', '81288660815', 'HONDA BRIO RS DD1S', 'WRT000531', 'MHRDD1890NJ350824', '', 34, '2023-01-13', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(532, 'NOVITA DYAH KUSUMA AYU', 'JL GARUDA VII BLOK B.V/13 010 RW 011', '8121304578', 'HONDA HR-V RV3F', 'WRT000532', 'MHRRV3890NJ203657', '', 35, '2023-01-13', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(533, 'MELLY SARIKASENDA', 'JL MARS 322 RT 003 RW 009 HALIM PERDANA KUSUMAH ', '82125363313', 'SUZUKI S-CROSS', 'WRT000533', 'MA3MYA12SN0287213', '', 19, '2023-01-13', 155, 1300000, 1, 'Y', 'Y', 700000, '151', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(534, 'SITI NURAISYAH ', 'PERMATA CIBUBUR BLOK P.2/12 RT 02/16', '81318705025', 'HONDA BRIO SATYA', 'WRT000534', 'MHRD01850NJ305051', '', 18, '2023-01-13', 155, 1000000, 1, 'Y', 'Y', 600000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(535, 'URIP WIHARJO', 'KAMPUNG UTAN RT 002 RW 008 KEL RAGUNAN KEC PASAR MINGGU', '', 'XPANDER CROSS', 'WRT000535', 'MK2NCXTATNJ008667', '', 19, '2023-01-14', 155, 1100000, 1, 'Y', 'Y', 900000, '151', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(536, 'ALMIRA DANELLA AZZAHRA', 'PONDOK RANGGON RT 008 RW 006', '81388915593', 'HONDA WR-V DG48', 'WRT000536', 'MHRDG4860NJ300203', '', 63, '2023-01-14', 155, 3300000, 1, 'Y', 'Y', 2700000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(537, 'ROSALIN', 'KOMPLEK POLRI MUNJUL NO 244 RT 7  RW 8', '', 'DAIHATSU AYLA', 'WRT000537', 'MHKS4GB5JLJ009888', '', 30, '2023-01-16', 155, 1000000, 1, 'Y', 'Y', 2000000, '152', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(538, 'PT MUSTIKA CITRA RASA', 'JALAN GAJAH MADA NO 172-173 KEL KEAGUNGAN KEC TAMAN SARI', ' 0812-1079-774', 'WULING ALMAZ', 'WRT000538', 'MK3BAAGA7NJ002999', '', 20, '2023-01-17', 155, 1200000, 1, 'Y', 'Y', 1200000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(539, 'ASKANIA FADIMA', 'PURI SRIWEDARI CIBUBUR BLOK K-16 RT 002 RW 012', '82377164697', 'STARGAZER PRIME IVT 6P', 'WRT000539', 'MF3NE81DTNJ015454', '', 35, '2023-01-17', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '149', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(540, 'RAIGUNA MUHAMAD TESAR', 'KOMPLEK KOTA WISATA CLUSTER FLORENCE H6 RT 3 RW 24', '81312036642', 'HONDA HR-V', 'WRT000540', 'MHRRV3890NJ203679', '', 31, '2023-01-18', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(541, 'WIDIYANTO SE', 'VILA NUSA INDAH 3 BLOK KG 1/11 RT 001 RW 041 BOJONG KULUR GUNUNG PUTRI', '87878607114', 'HONDA BRIO RS', 'WRT000541', 'MHRDD1890NJ204888', '', 92, '2023-01-18', 155, 3200000, 1, 'Y', 'Y', 2700000, '148', '154', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(542, 'ANDI SYUKUR ', 'JL KELAPA DUA WETAN RT 001 RW 001', '81904433292', 'HONDA BRIO', 'WRT000542', 'MHRDD1850NJ302590', '', 30, '2023-01-19', 155, 1500000, 1, 'Y', 'Y', 1500000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(543, 'MIRANINA ADHA', 'JL MAKMUR RT 009 RW 002 SUSUKAN CIRASAR', '81513317511', 'HONDA HR-V RV3D', 'WRT000543', 'MHRRV3870PJ20031', '', 31, '2023-01-19', 155, 1750000, 1, 'Y', 'Y', 1750000, '152', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(544, 'SUHARYATI', 'JL PERTAMINA NO 1 RT 008 RW 014 CIBUBUR CIRACAS', '81586662325', 'HONDA HR-V RV3D', 'WRT000544', 'MHRRV3870PJ200023', '', 19, '2023-01-19', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(545, 'NONIE DEWINTA ', 'PERUM DEBALE CLUSTER DIAMOND NO 57 RT 04 RW 23 SUKATANI TAPOS', '81378268513', 'HONDA HR-V 1.5 L', 'WRT000545', 'MHRRV3870NJ211321', '', 31, '2023-01-20', 155, 700000, 1, 'Y', 'Y', 2800000, '152', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(546, 'PT TAKARI KOKOH SEJAHTERA QQ GUNAWAN', 'JL ARJUNA UTARA ', '', 'HYUNDAI CRETA', 'WRT000546', 'MF3P8812TNJ011604', '', 109, '2023-01-20', 155, 1000000, 1, 'Y', 'Y', 2500000, '149', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(547, 'IVANA PUHAN', 'JL PELANGI UNGU  RT 007 RW 026', '', 'TOYOTA FORTUNER', 'WRT000547', 'MHFGB8GS7H0838945', '', 32, '2023-01-23', 155, 1600000, 1, 'Y', 'Y', 2400000, '149', '', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(548, 'CATUR PRADONO', 'JL SAWO GEDE NO 109', '87888514409', 'MAZDA CX-3', 'WRT000548', 'MM6DK2WAANW522592', '', 19, '2023-01-23', 155, 800000, 1, 'Y', 'Y', 1200000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(549, 'FRANSISCUS PERANGIN ANGIN ', 'CIBUBUR VILLA RT 006 RW 010', '8170176444', 'HYUNDAI CRETA', 'WRT000549', 'MF3PE812TNJ041661', '', 31, '2023-01-23', 155, 350000, 1, 'Y', 'Y', 3150000, '149', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(550, 'WAHYU NURYANTO', 'PERMATA PURI II JL AMBER  RAYA BLOK CC-1 NO 9', '', 'TOYOTA ALPARD', 'WRT000550', 'DBAANH20WPFXSKC', '', 17, '2023-01-23', 155, 700000, 1, 'Y', 'Y', 900000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(551, 'PUTRA MULIA', 'RAFFES HILLS BLOK E RT 001 RW 016', '81219726501', 'SUZUKI BALENO', 'WRT000551', 'MBHEWB52SKG376810', '', 116, '2023-01-23', 155, 700000, 1, 'Y', 'Y', 1800000, '151', '153', '154', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(552, 'BAMBANG SANTOSO', 'JL ALAM PASANGGRAHAN BLOK PA RT 003 RW 16', '', 'XPANDER ULTIMATE 4X2 AT', 'WRT000552', 'MK2NCLTATNJ015732', '', 35, '2023-01-25', 155, 2000000, 1, 'Y', 'Y', 2000000, '148', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(553, 'LATIKO ARDILLA DIRGA', 'APARTEMEN BASSURA CITY RT 007 RW 010', '81905271420', 'HONDA HRV', 'WRT000553', 'MHRRV3870PJ200163', '', 35, '2023-01-26', 155, 800000, 1, 'Y', 'Y', 3200000, '153', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(554, 'SITI FATIMAH', 'JL LEMBUR 2 RT 001 RW 004 JATIRANGGA', '', 'MAZDA 2 5HB', 'WRT000554', 'MM6DJ2HAAJW407274', '', 30, '2023-01-27', 155, 1800000, 1, 'Y', 'Y', 1200000, '153', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(555, 'MARYATI', 'JL KAWI KAWI ATAS RT 014 RW 008', '89624073664', 'HONDA BR-V DG3', 'WRT000555', 'MHRDG3880NJ308391', '', 59, '2023-01-27', 155, 3050000, 1, 'Y', 'Y', 2450000, '152', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(556, 'RUSNAINI', 'JL NAKULA NO 45 RT 003 RW 008', '81211106275', 'AVANZA VELOZ ', 'WRT000556', 'MHFAB1BY1P0057085', '', 19, '2023-01-30', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '151', '154', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(557, 'PT SUMBERMULIA HASILGUNA', 'JL IR H JUANDA PLAZA CIPUTAT MAS TANGGERANG', '', 'INNOVA ZENIX 2.0', 'WRT000557', 'MHFABAAA8P0002850', '', 32, '2023-01-30', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(558, 'MITCHEL IVANO SYAHPUTRA', 'KP PEDURENAN RT 006  RW 003 JATILURUH', '', 'HONDA BR-V', 'WRT000558', 'MHRDG3880NJ308274', '', 79, '2023-01-31', 155, 0, 1, 'Y', 'Y', 3400000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(559, 'RONAL ISKANDAR', 'JL CAMAR BLOK L NO 3 TR 05 RW 05', '', 'HYUNDAI CRETA', 'WRT000559', 'MF3PE812TNJ001781', '', 23, '2023-01-31', 155, 490000, 1, 'Y', 'Y', 910000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(560, 'MITCHEL IVANO SYAHPUTRA', 'KP PEDURENAN RT 006  RW 003 JATILURUH', '', 'HONDA BR-V', 'WRT000560', 'MHRDG3880NJ308274', '', 79, '2023-02-01', 155, 2300000, 1, 'Y', 'Y', 1100000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(561, 'RONAL ISKANDAR', 'JL CAMAR BLOK L NO 3 TR 05 RW 05', '', 'HYUNDAI CRETA', 'WRT000561', 'MF3PE812TNJ001781', '', 23, '2023-02-01', 155, 490000, 1, 'Y', 'Y', 910000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(562, 'PT SUMBERMULIA HASILGUNA', 'JL IR H JUANDA PLAZA CIPUTAT MAS TANGGERANG', '81314840511', 'INNOVA ZENIX 2.0', 'WRT000562', 'MHFABAAA8P0002850', '', 32, '2023-02-01', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(563, 'AMIRAH RUKMAMAYA  H H', 'KOTA WISATA FLORENCE BLOK H 1/19 RT 001 RW 024', '81212583024', 'HONDA HR-V', 'WRT000563', 'MHRRV3870NJ213138', '', 31, '2023-02-01', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(564, 'REINHARD YEREMIA', 'JL KERAMAT JAYA II NO 22', '', 'MITSUBISHI XPANDER CROSS', 'WRT000564', 'MK2NCXTATNJ006054', '', 95, '2023-02-01', 155, 4100000, 1, 'Y', 'Y', 3300000, '150', '151', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(565, 'ARDI', 'PERMATA DEPOK REGENCY CLUSTER RUBY BLOK D', '81290703590', 'MITSUBISHI XPANDER ULTIMATE', 'WRT000565', 'MK2NCLTATNJ020555', '', 31, '2023-02-02', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(566, 'GITA PUTRI BENAVITA', 'KOMP HANKAM JL DELIMA II B 97 RT 008 RW 003', '85219543396', 'HONDA CITY', 'WRT000566', 'MHRGN5890PJ300012', '', 31, '2023-02-02', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(567, 'HENRY  DANIEL BUKIT', 'PERUM ROYAL RESIDENCE  BLOK B 11/18', '83898877267', 'CHERY', 'WRT000567', 'MF7CD24B8NJ000069', '', 20, '2023-02-02', 155, 1400000, 1, 'Y', 'Y', 1000000, '151', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(568, 'JONI', 'SERENADE LAKE B5 NO 10', '81314840511', 'CALYA ', 'WRT000568', 'MHKA6GK6JNJ618842', '', 19, '2023-02-03', 155, 1300000, 1, 'Y', 'Y', 700000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(569, 'ALMA AMANDA', 'PERUM CIBUBUR COUNTRY APPLE WOOD RT 003 ', '82166552666', 'HONDA BR-V', 'WRT000569', 'MHRDG3880NJ308913', '', 31, '2023-02-03', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(570, 'DONNY HENDRAWAN ', 'JL PROF  AFRAN PANE NO 9 KELAPA DUA', '81314245835', 'HYUNDAI STARGAZER', 'WRT000570', 'MF3NE81DTNJ009544', '', 35, '2023-02-04', 155, 1000000, 1, 'Y', 'Y', 3000000, '152', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(571, 'TONY HENDRO PRAKOSO', 'METLAND CILEUNGSI CLUSTER CHRYSAN RT 005 RW 014', '8161413298', 'SUZUKI XL 7', 'WRT000571', 'MHYANC22SNJ116840', '', 19, '2023-02-04', 155, 200000, 1, 'Y', 'Y', 1800000, '151', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(572, 'IBNU HAJAR', 'JL CEGER RT 005 RW 002', '', 'TOYOTA FORTUNER ', 'WRT000572', 'MHFAA8GS1NO793053', '', 20, '2023-02-04', 155, 1500000, 1, 'Y', 'Y', 900000, '151', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(573, 'RIFQI JUNAIDI', 'CILILITAN KECIL NO 47 RT 3 RW 13', '85251572555', 'MITSUBISHI PAJERO', 'WRT000573', 'MK2KRWPNUNJ009485', '', 70, '2023-02-06', 155, 0, 1, 'Y', 'Y', 500000, '149', '150', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(574, 'SONY EKO MARJIYANTO', 'CIBUBUR VILLA 3 BLOK C NO 68', '87878012011', 'HONDA BRIO', 'WRT000574', 'MHRDD1750NJ302431', '', 18, '2023-02-06', 155, 600000, 1, 'Y', 'Y', 1000000, '151', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(575, 'PT KARUNIA TEKNIK QQ YANTO', 'JL ZAMRUD BLOK L1 ', '818110489', 'MAZDA 3 ', 'WRT000575', 'JM6BN2478J0244290', '', 70, '2023-02-07', 155, 0, 1, 'Y', 'Y', 500000, '152', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(576, 'YULIATI ASWIN ', 'JL LEMBUR 2 RT 01 RW 04 JATIRANGGA', '81282743488', 'TOYOTA KIJANG INNOVA', 'WRT000576', 'MHFGB8EMXJ0422477', '', 32, '2023-02-07', 155, 400000, 1, 'Y', 'Y', 3600000, '149', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(577, 'FARHAN  NOOR HIDAYATULLAH ', 'JL APEL BLOK CP NO 12 RT 003 RW 013', '81388888545', 'HONDA HR-V ', 'WRT000577', 'MHRRV3870PJ250219', '', 31, '2023-02-07', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '153', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(578, 'MEYTI HARIANI SUSANTO', 'CLUSTER HARMONI BLOK HZ 10 NO 12', '87874322046', 'MAZDA CX-5 ELITE', 'WRT000578', 'JM6KF2WLAN0780968', '', 36, '2023-02-07', 155, 2175000, 1, 'Y', 'Y', 2325000, '148', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(579, 'FERRY JOHANSEN', 'VILLA NUSA INDAH 3 BLOK KA 5 NOMOR 20 RT 05 RW 37', '81210797747', 'MITSUBISHI XPANDER CROSS', 'WRT000579', 'MK2NCXTATNJ010738', '', 19, '2023-02-07', 155, 1000000, 1, 'Y', 'Y', 1000000, '151', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(580, 'AEF SUGRIA', 'KP PAYANGAN NO 37 RT 03 RW 07 JATIASIH', '81298416897', 'MITSUBISHI PAJERO SPORT', 'WRT000580', 'MK2KRWPNUNJ010607', '', 32, '2023-02-08', 155, 1200000, 1, 'Y', 'Y', 2800000, '150', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(581, 'RATNO PURNOMO', 'JL RAYA TENGAH RT 004 RW 003', '', 'HYUNDAI CRETA', 'WRT000581', 'MF3PE812TPJO54128', '', 35, '2023-02-09', 155, 2000000, 1, 'Y', 'Y', 2000000, '150', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(582, 'FAUZIA', 'JL APEL BLOK CP NO 12 JATIASIH BEKASI', '8111182700', 'TOYOTA FORTUNER', 'WRT000582', 'MHFGB8GS8KO905320', '', 32, '2023-02-09', 155, 2000000, 1, 'Y', 'Y', 2000000, '152', '151', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(583, 'WIDYA APRIARI DEVITA', 'JEMURSARI VI/22 RT 003 RW 010', '', 'MITSUBISHI XPANDER ', 'WRT000583', 'MK2NCLPANNJ001499', '', 19, '2023-02-10', 155, 1100000, 1, 'Y', 'Y', 900000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(584, 'BAYU PRADITYA SANTOSO', 'JL ASSAFIIYAH RT 03 RW 07 JATISARI', '81298416897', 'MITSUBISHI PAJERO SPORT', 'WRT000584', 'MK2KRWPNUMJ014393', '', 32, '2023-02-10', 155, 750000, 1, 'Y', 'Y', 3250000, '149', '150', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(585, 'TELLMAN WIENFRIEDS', 'KOMP TVRI KEC KEBAYORAN LAMA KOTA JAKARTA SELATAN', '81314840511', 'INNOVA ZENIX ', 'WRT000585', 'MHFAAAAA8N0004078', '', 32, '2023-02-11', 155, 2000000, 1, 'Y', 'Y', 2000000, '149', '152', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(586, 'E YENI SURYANTI', 'PERUM PERSADA DEPOK BLOK B1/2', '87888514409', 'MAZDA 2', 'WRT000586', 'MM6DL2SAANW827449', '', 18, '2023-02-11', 155, 640000, 1, 'Y', 'Y', 960000, '151', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(587, 'NUR AIN', 'PEDURENAN MESJID RT 5 RW 4 KARET JAKSEL ', '85782821599', 'MITSUBISHI XPANDER ', 'WRT000587', 'MK2NCLTATNJ016339', '', 59, '2023-02-11', 155, 3050000, 1, 'Y', 'Y', 2450000, '148', '150', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(588, 'EVA NUR AISYAH', 'VILA NUSA INDAH W 13 16 RT 06 RW 21 BOJONG KULUR', '87877606927', 'HONDA HR-V', 'WRT000588', 'MHRRV3870NJ213147', '', 59, '2023-02-13', 155, 3050000, 1, 'Y', 'Y', 2450000, '149', '148', '154', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(589, 'PT ARSLAN SRS INTL QQ ARI', 'JL MERUYA ILIR RAYA RT 5 RW 8 JAKARTA BARAT', '81298416897', 'TOYOTA ALPHARD ', 'WRT000589', 'JTNGF3DHXK8022389', '', 107, '2023-02-13', 155, 1600000, 1, 'Y', 'Y', 5500000, '151', '150', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(590, 'PARLY MAYDONI', 'JL MERAPI E1/16 BKT PERMAI RT 2 RW 11', '81314350296', 'TOYOTA FORTUNER', 'WRT000590', 'MHFGB8GS3G0821963', '', 41, '2023-02-13', 155, 3500000, 1, 'Y', 'Y', 2500000, '149', '152', '151', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(591, 'SETIA NINGSIH SE', 'JL PISANG PERUM GURU NO 81 RW 01 RT 02', '81212013454', 'FIAT 500 LOUNGE', 'WRT000591', 'ZFA3120000J143611', '', 30, '2023-02-14', 155, 1500000, 1, 'Y', 'Y', 1500000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(592, 'MITIT SUNARMI DS', '-', '81315152603', 'MAZDA 2 RHD', 'WRT000592', 'MM6DL2SAANW843253', '', 34, '2023-02-14', 155, 1750000, 1, 'Y', 'Y', 1750000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(593, 'FAUZI', 'JL ALFU BUNTU NI 60A RT 2 RW 3 JAKARTA BARAT', '8,95333E+11', 'SUZUKI ERTIGA', 'WRT000593', 'MHYANC22SK124880', '', 15, '2023-02-15', 155, 0, 1, 'Y', 'Y', 1200000, '149', '151', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(594, 'RIZAL ANJAR PRAPANCA', 'JL MEDIA III BLOK AC 32 RT 002 RW 016 ', '811803603', 'HONDA WR-V', 'WRT000594', 'MHRDG4860PJ300281', '', 59, '2023-02-15', 155, 3050000, 1, 'Y', 'Y', 2450000, '150', '153', '148', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(595, 'MULYATNO', 'KOMPLEK POLRI JATI RANGGA', '81219163546', 'MOTOR HONDA GOLDWINGS 1800 CC', 'WRT000595', 'DB 5188 RI', '', 117, '2023-02-16', 155, 1250000, 1, 'Y', 'Y', 1250000, '150', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(596, 'TRI SETYONO', 'JL DUKU BLOK R 1 NO 31  RT 1 RW 8', '', 'TOYOTA FORTUNER', 'WRT000596', 'MHFAA8GS7N0790190', '', 64, '2023-02-17', 155, 3850000, 1, 'Y', 'Y', 3050000, '149', '148', '154', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(597, 'LEONARD MANUEL RICHARD', 'PERUMAHAN WARGA RT 002 RT 12', '811458469', 'MITSUBISHI PAJERO', 'WRT000597', 'MK2KRWPNUPJ000936', '', 36, '2023-02-17', 155, 2250000, 1, 'Y', 'Y', 2250000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(598, 'IKA EPRILIA SARI', 'VILA NUSA INDAH 5 BLOK S 4 RT 006 RW 013', '81318712109', 'HONDA BRIO SATYA', 'WRT000598', 'MHRDD1850PJ302229', '', 62, '2023-02-17', 155, 2750000, 1, 'Y', 'Y', 2350000, '151', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(599, 'NADA SURYANI', 'KP BABAKAN SITU 2 CIPANAS CIANJUR ', '81294487954', 'TOYOTA FORTUNER', 'WRT000599', 'MHFZR69GE3096272', '', 32, '2023-02-18', 155, 800000, 1, 'Y', 'Y', 3200000, '149', '153', '154', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(600, 'YENNY RETNO THAMRIN', 'KOMP GREEND WOODS BLOK J/20 RT 006 RW 011 RENGAS CIPUTAT TIMUR', '8111014406', 'HONDA CR-V', 'WRT000600', 'MHRRW1880PJ350464', '', 60, '2023-02-21', 155, 3600000, 1, 'Y', 'Y', 2800000, '148', '154', '152', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(601, 'SRI HANDAYANI SE ', 'RAFFLES HILLS BLOK Q 9 NO 6 RT 024 RW 025', '85695118047', 'HONDA HR-V', 'WRT000601', 'MHRRV3870PJ201564', '', 31, '2023-02-22', 155, 1750000, 1, 'Y', 'Y', 1750000, '149', '150', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(602, 'SERENITA MARTHA QQ PT SERI METAL ENGINEERING', 'JLN RAYA KP SAWAH GG KENANGAN A NO 169 RT 005 JATIMURNI', '82114500388', 'HONDA CR-V RW1D', 'WRT000602', 'MHRRW1880PJ350159', '', 64, '2023-02-23', 155, 3850000, 1, 'Y', 'Y', 3050000, '148', '152', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(607, 'ARISTA SARI MARTALENA', 'JL PRAMBANAN BLOK A NO 66', ' 81286455875', 'TOYOTA AVANZA', 'WRT000605', 'MHKM5EB4JKK010955', 'B2314KOD', 19, '2023-03-25', 34, 600000, 1, 'N', 'N', 0, '148', '154', '151', '', 'Y', 400000, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(608, 'TINNEKE LAYADI', 'THE GREEN BLOSSOM VILLE BLOK 28', '82226633311', 'BMW 320I', 'WRT000606', 'MHHPG5700AK923304', 'B1981NBA', 32, '2023-03-01', 34, 1350000, 1, 'N', 'N', 2650000, '149', '151', '', '', 'Y', 1000000, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(609, 'RANI WAHYUNI RIZKY', 'JL MERPATI BLOK A NO 10 RT 6 RW 4', '87877606927', 'HONDA HR-V', 'WRT000607', 'MHRRV3870PJ200490', 'B1009RKZ', 19, '2023-03-02', 43, 1300000, 1, 'N', 'N', 700000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(610, 'ANDY SULAEMAN', 'CIPANENGAH RT 001 RW 008 KEL CIPANENGAH KEC LEMBURSITU', ' 81315152603', 'MAZDA CX-30', 'WRT000608', 'JM6DM2W7AP1202429', '-', 31, '2023-03-02', 74, 2275000, 1, 'N', 'N', 1225000, '148', '149', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(611, 'WIDY ASTUTI', 'JL SAWO APEL NO 48 ', '81226115581', 'HYUNDAI CRETA', 'WRT000609', 'MF3PC812TNJ009603', '-', 118, '2023-03-03', 34, 0, 1, 'N', 'N', 1600000, '148', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(612, 'CRISPINA DESIANA QQ IGNIS', 'VILA NUSA INDAH EE3 87 RT 009 RW 029', '81328028022', 'HONDA BRV', 'WRT000610', 'MHRDG3880NJ310017', 'F1641FAT', 19, '2023-03-04', 34, 0, 1, 'N', 'N', 2000000, '148', '151', '154', '', 'Y', 200000, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(615, 'RONY MARIANTORO', 'LENTENG AGUNG NO 50 A RT 4 RW 3', '81905042435', 'HYUNDAI STARGAZER', 'WRT000611', 'MF3NE81DTNJ009846', 'B1031 DKQ', 19, '2023-03-04', 34, 0, 1, 'N', 'N', 2000000, '148', '151', '154', '', 'Y', 100000, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(616, 'UMI HANI', 'JL MAYOR IDRUS RT 001 RW 006', '82258699692', 'HONDA WR-V', 'WRT000612', 'MHRDG4860PJ300786', '0', 59, '2023-03-04', 111, 3050000, 1, 'N', 'N', 2450000, '150', '151', '154', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(617, 'PAULUS  SIMBISA SIMAJORANG', 'PERUMAHAN INTAN REGENCY KRANJI JL. SINGARAJA BLOK B5', '81382025124', 'HONDA HRV', 'WRT000613', '-', '-', 63, '2023-03-21', 158, 2300000, 1, 'N', 'N', 0, '153', '151', '154', '', 'Y', 500000, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(618, 'PENDI MULYADI', 'LEGENDA WISATA ZONA VIVALDI NO M 23', '82214928526', 'HYUNDAI STARGAZER ', 'WRT000614', '7013224', '-', 31, '2023-03-15', 131, 1750000, 1, 'N', 'N', 0, '149', '151', '', '', 'Y', 1750000, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(619, 'PT GUBUG UDANG SENTOSA QQ ABU SELIM', 'JL ALTERNATIF BUPERTA CIBUBUR CIMANGGIS DEPOK', '85791307789', 'SUZUKI ERTIGA', 'WRT000615', 'MHYANC22JJ119027', 'B 1592 ERN', 19, '2023-03-04', 34, 400000, 1, 'N', 'N', 1600000, '151', '154', '', '', 'Y', 500000, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(621, 'SUTRISNO', 'JL DONGKAL BLOK E 1 KP BABAKAN', '8111719903', 'MITSUBISHI XPANDER', 'WRT000617', '-', '-', 35, '2023-03-06', 161, 0, 1, 'N', 'N', 4000000, '153', '', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(624, 'RINA FITRI', 'CLUSTER AL IKHLAS, JL LELE 2 NO.C/15 BAMBU APUS', '82114429991', 'HONDA WR-V', 'WRT000618', 'MHRDG484OJ301058', '-', 19, '2023-03-06', 55, 800000, 1, 'N', 'N', 1200000, '151', '154', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(625, 'RANGGA AJI PRATAMA', 'VILIA DAGO BOULEVARD BLOK A NO 213 JL VILLA DAGO RAYA', '81297675788', 'MITSUBISHI PAJERO DAKAR', 'WRT000619', 'MK2KRWPNUPJ001668', '-', 36, '2023-03-07', 110, 2500000, 1, 'N', 'N', 2000000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(626, 'KURNIAWATI QQ YOGI', 'JL WIJAYA I LANGGAR RT 6 RW 3 KEBAYORAN BARU', '81310858993', 'HONDA HR-V 1.5L SE CVT', 'WRT000620', 'MHRRV3870NJ206372', 'B1362DFY', 59, '2023-03-07', 34, 1600000, 1, 'N', 'N', 3900000, '148', '154', '153', '', 'Y', 0, 'N', '2023-03-07 14:46:32', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(627, 'ETTY IRMA DIANTY ARBA', 'JL BAKTI II NO 27 RT 003 RW 009 PASAR REBO', '87777789711', 'HONDA WR-V', 'WRT000621', 'MHRDG4860PJ300839', '-', 45, '2023-03-07', 66, 2600000, 1, 'N', 'N', 2000000, '148', '154', '149', '', 'Y', 0, 'N', '2023-03-07 15:06:43', '2023-03-07 15:12:00', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(628, 'REFI SEPTIYANA', 'TMN JATISARI PERMAI JL SEMERU II BLOK DI NO 30 RT 02 RW 16', '-', 'HONDA FREED GB3 1.5', 'WRT000622', 'MHRGB3860EJ500512', 'B1337KRE', 31, '2023-03-08', 34, 700000, 1, 'N', 'N', 2800000, '149', '151', '', '', 'Y', 500000, 'N', '2023-03-08 09:55:01', '2023-03-08 09:55:01', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(629, 'DEVI PRIEKASIH PUTRI', 'KP KRANGGAN NO 45 RT 002 RW 009 JATISAMPURNA KOTA BEKASI', '85920700352', 'HONDA ODYSSE 2.4 AT', 'WRT000623', 'JHMRB18704C205815', '-', 64, '2023-03-08', 34, 690000, 1, 'N', 'N', 6210000, '148', '154', '149', '', 'Y', 500000, 'N', '2023-03-08 10:54:28', '2023-03-08 10:54:28', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(630, 'ASPEN HUTAGALUNG', 'CITRA INDAH BUKIT PINUS RT 2 RW 10 SUKAMAJU', '81218835674', 'TOYOTA FORTUNER', 'WRT000624', 'MHFGB8GS8L0910888', 'F1077JU', 32, '2023-03-08', 34, 800000, 1, 'N', 'N', 3200000, '149', '', '', '', 'Y', 350000, 'N', '2023-03-08 11:16:29', '2023-03-08 11:16:29', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(631, 'MEIZAL AZMIR', 'BUMI CIMANGGIS INDAH BLOK R1 NO 28 RT 001 RW 26 SUKATANI TAPOS', '82123556460', 'CHERY TIGGO 8 PRO', 'WRT000625', 'MF7CD24B8PJ000235', '-', 119, '2023-03-08', 162, 2850000, 1, 'N', 'N', 2650000, '151', '150', '', '', 'Y', 0, 'N', '2023-03-08 12:18:58', '2023-03-08 12:18:58', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(632, 'ARIF ARIYANTO', 'PERUM KOTA HIJAU BLOK AR 6 NO 07', '81286120777', 'TOYOTA INNOVA ', 'WRT000626', 'MHFAAAAA2P0006198', '-', 64, '2023-03-09', 34, 1900000, 1, 'N', 'N', 5000000, '153', '151', '', '', 'Y', 1000000, 'N', '2023-03-09 12:06:29', '2023-03-09 12:06:29', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(633, 'KURNIAWAN', 'JL PADEMANGAN VII NO 27 RT 015 RW 001 ', ' 817111800', 'SUZUKI IGNIS ', 'WRT000627', 'MA3NFG81SN0380119', '-', 63, '2023-03-09', 108, 3300000, 1, 'N', 'N', 2700000, '151', '154', '', '', 'Y', 0, 'Y', '2023-03-09 13:03:41', '2023-03-09 12:34:22', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(634, 'KURNIAWAN', 'JL PADEMANGAN VII NO 27 RT 015 RW 001 ', '81387977019', 'SUZUKI IGNIS ', 'WRT000628', 'MA3NFG81SN038119', '-', 62, '2023-03-09', 108, 2750000, 1, 'N', 'N', 2350000, '151', '154', '', '', 'Y', 0, 'N', '2023-03-09 14:45:30', '2023-03-09 14:45:30', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(635, 'Y AGUS PRIMANTO', 'JL GARUDA VII BLOK B V 13 BDR JATISARI BEKASI', '8121304578', 'TOYOTA FORTUNER', 'WRT000629', 'MHFGB8GS9G0809879', 'B2033KBL', 121, '2023-03-09', 40, 2450000, 1, 'N', 'N', 3250000, '149', '150', '153', '', 'Y', 0, 'N', '2023-03-09 16:28:15', '2023-03-09 16:28:15', '2023-03-25', 'B', '0000-00-00 00:00:00');
INSERT INTO `t_transaksi` (`id`, `nama`, `alamat`, `tlp`, `jns_kendaraan`, `waranti`, `no_rangka`, `no_polisi`, `id_teknisi`, `tgl`, `id_sales`, `diskon`, `admin`, `sts_point`, `sts_klaim`, `total_b`, `tek1`, `tek2`, `tek3`, `tek4`, `sts_book`, `booking`, `sts_hapus`, `tgl_hapus`, `tgl_server`, `tgl_booking`, `status_bayar`, `tgl_lunas`) VALUES
(636, 'ARGA FITRA JAYA', 'PURI SRIWEDARI BLOK A NO40 RT 001 RW 012 ', '811896768', 'HONDA HR-V', 'WRT000630', 'MHRRV3870PJ202689', '-', 31, '2023-03-10', 59, 1750000, 1, 'N', 'N', 1750000, '153', '', '', '', 'Y', 0, 'N', '2023-03-10 10:13:17', '2023-03-10 10:13:17', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(637, 'PT ADONAI PIALANG REASURANSI', 'GD GRADA MR21 LT 6 UNIT 1-2 JL MENTENG RAYA NO KEBON SIRIH', '81319457506', 'HONDA HR-V RV3D ', 'WRT000631', 'MHRRV3870PJ202829', '-', 59, '2023-03-10', 44, 3050000, 1, 'N', 'N', 2450000, '150', '148', '154', '', 'Y', 0, 'N', '2023-03-10 11:30:13', '2023-03-10 11:30:13', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(638, 'MARDIANI RANTESALU', 'PERUM CITRA GRAN CIBUBUR BLOK S RT 007', '8128322239', 'HONDA BR-V ', 'WRT000632', 'MHRDG3880PJ301060', '-', 59, '2023-03-10', 115, 3050000, 1, 'N', 'N', 2450000, '149', '148', '154', '', 'Y', 0, 'N', '2023-03-10 16:24:10', '2023-03-10 16:24:10', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(640, 'TIARA BELLA BRITANIA', 'RAFFLES HILLS BLOK E 1 NO 1 RT 001 RW 016', '82217757819', 'TOYOTA VELOZ', 'WRT000634', 'MHFAB1BY7P0055521', '-', 59, '2023-03-11', 164, 3050000, 1, 'N', 'N', 2450000, '148', '151', '154', '', 'Y', 0, 'N', '2023-03-11 14:55:12', '2023-03-11 14:55:12', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(641, 'ERDIN WERDRAYANA WIJAYA', 'THE HEIGH PONDOK LABU RESIDEN NO A10 JL KRAMAT', '82359127783', 'HYUNDAI CRETA', 'WRT000635', 'MF3PE812TNJ046547', '-', 31, '2023-03-11', 165, 1750000, 1, 'N', 'N', 1750000, '153', '149', '', '', 'Y', 0, 'N', '2023-03-11 15:35:58', '2023-03-11 15:35:58', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(642, 'PUTRI DESSI RAHMAWATI', 'JL LAP TEMBAK KAV 2', '81381469393', 'TOYOTA FORTUNER', 'WRT000636', 'MHFGB8GS6HO842193', 'B1635', 36, '2023-03-13', 43, 2250000, 1, 'N', 'N', 2250000, '150', '149', '', '', 'Y', 0, 'N', '2023-03-13 16:20:02', '2023-03-13 16:20:02', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(643, 'DANIEL ABIMANYU SUBAGYO', 'JL WR SUPRATMAN NO 105 RT 001 RW 001', '087885206878', 'SUZUKI ERTIGA', 'WRT000637', 'MHYANC32SNJ104432', '-', 19, '2023-03-13', 163, 1300000, 1, 'N', 'N', 700000, '148', '154', '', '', 'Y', 0, 'N', '2023-03-13 16:22:29', '2023-03-13 16:22:29', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(644, 'PRAJITNO SOENARDI', 'RAFFLES HILLS BLOK S6 NO 22', '8119003101', 'HONDA HR-V', 'WRT000638', 'MHRRV3890NJ200969', 'B2464KZW', 32, '2023-03-14', 43, 2000000, 1, 'N', 'N', 2000000, '149', '', '', '', 'Y', 0, 'N', '2023-03-14 11:25:01', '2023-03-14 11:25:01', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(645, 'HENDRA GUNAWAN', 'RAFFLES HILS BLOK J 2 NO 20 RT 11 RW 25', '81386195994', 'CHERY TIGGO 7', 'WRT000639', 'MF7BD21B8NJ000297', '-', 36, '2023-03-14', 166, 2250000, 1, 'N', 'N', 2250000, '153', '154', '', '', 'Y', 500000, 'N', '2023-03-14 12:00:44', '2023-03-14 12:00:44', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(646, 'HENDY YUD', 'CIPINANG GALUH KULON RT 010 RW 002', '81291221565', 'HYUNDAI STARGAZER', 'WRT000640', 'MF3NE81DTNJ015456', '-', 122, '2023-03-14', 60, 4950000, 1, 'N', 'N', 3950000, '151', '148', '', '', 'Y', 0, 'N', '2023-03-14 15:41:25', '2023-03-14 15:41:25', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(647, 'KENNY JEREMIA ZONDAG', 'BUMI ANGGREK BLOK S NO 182', '81288261884', 'SUZUKI BALENO', 'WRT000641', 'MBHHWBA3SPG341317', '-', 19, '2023-03-15', 82, 1300000, 1, 'N', 'N', 0, '151', '154', '', '', 'Y', 0, 'N', '2023-03-15 16:37:54', '2023-03-15 16:37:54', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(648, 'DRS ANDREAS TONY PAKPAHAN', 'LEGENDA WISATA GALILEO L 6/23 RT 002 RW 020 WANAHERANG', '81288592592', 'HONDA CITY HATCHBACK', 'WRT000642', 'MHRGN5780PJ300054', '-', 59, '2023-03-16', 44, 3050000, 1, 'N', 'N', 2450000, '150', '154', '', '', 'Y', 0, 'N', '2023-03-16 12:44:06', '2023-03-16 12:44:06', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(649, 'BOBBY ARWAN', 'JL DENSE 7 BLOK P7 NO 27 CITRA GRAN', '81908192175', 'TOYOTA KIJANG INNOVA', 'WRT000643', 'MHFJW8EM3L2384673', '-', 127, '2023-03-16', 106, 200000, 1, 'N', 'N', 1900000, '153', '151', '', '', 'Y', 0, 'N', '2023-03-16 14:28:57', '2023-03-16 14:28:57', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(650, 'NURUL ANISA PUTRI', 'PERUMAHAN PURI DEPOK MAS TAHAP III BLOK PJ NO 34', '81219433852', 'MITSUBISHI XPANDER', 'WRT000644', 'MK2NCXTATPJ000697', '-', 63, '2023-03-16', 167, 3100000, 1, 'N', 'N', 2900000, '150', '148', '154', '', 'Y', 0, 'N', '2023-03-16 15:44:48', '2023-03-16 15:44:48', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(651, 'DR INDAH DWI SELVINA QQ BOBBY ARWAN', 'JL H GG Y NO 23 RT 005 RW 008 KEL KEBON BARU KEC TEBET', '81908192175', 'HYUNDAI STARGAZER', 'WRT000645', 'MF3NE81DTPJ015709', '-', 35, '2023-03-18', 106, 2000000, 1, 'N', 'N', 2000000, '150', '', '', '', 'Y', 0, 'N', '2023-03-18 10:19:34', '2023-03-18 10:19:34', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(652, 'LIA ATMADJA', 'CITRA GRAN CIBUBUR CLUSTER THE PRAIREI JATISAMPURNA ', '81317866519', 'MAZDA 2 SEDAN', 'WRT000646', 'MM6DL2SAANW829239', '-', 31, '2023-03-20', 34, 0, 1, 'N', 'N', 0, '149', '', '', '', 'Y', 500000, 'N', '2023-03-18 15:06:48', '2023-03-18 15:06:48', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(653, 'PRAJITNO SOENARDI', 'RAFFLES HILLS BLOK S6 NO 22 JATIKARYA BEKASI', '8119003109', 'MITSUBISHI PAJERO SPORT', 'WRT000647', 'MK2KSWPNUNJ001065', 'B1003KJQ', 36, '2023-03-20', 43, 2250000, 1, 'N', 'N', 2250000, '153', '151', '', '', 'Y', 0, 'N', '2023-03-20 11:00:06', '2023-03-20 11:00:06', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(654, 'GUNTUR SUHARYANTO', 'ARYA TOWN HOUSE 2 JALAN RAYA KRANGGAN GG RANDU 125 KAV 19', '81806611631', 'HONDA HR-V', 'WRT000648', '-', '-', 63, '2023-03-25', 34, 3300000, 1, 'N', 'N', 0, '148', '154', '149', '', 'Y', 500000, 'N', '2023-03-20 12:18:41', '2023-03-25 10:03:43', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(655, 'RAKHMAT SURYA HARDIANTO ', 'KP KALIMATI RT 010 RW 003 KEL KEDAUNG KALI ANGKE', '81299068745', 'WULING ALMAZ', 'WRT000649', 'MK3BAAGAXNJ001247', '-', 64, '2023-03-20', 34, 1380000, 1, 'N', 'N', 5520000, '148', '154', '149', '', 'Y', 500000, 'N', '2023-03-20 13:59:07', '2023-03-20 13:59:07', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(656, 'WAFIRUL CHAIRI FERI', 'DSN NGANGIN RT 004 RW 002 KEL SIMOANGIN ANGIN WONOAYU', '-', 'MITSUBISHI XPANDER CROSS', 'WRT000650', 'MK2NCXTATNJ013211', '-', 19, '2023-03-21', 168, 1000000, 1, 'N', 'N', 0, '148', '154', '', '', 'Y', 0, 'N', '2023-03-20 15:02:22', '2023-03-20 15:02:22', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(657, 'B AGUS TRIHARJONO', 'GRIYA PIPIT VI BLOK A RT 003 RW 013', '8161462199', 'MITSUBISHI PAJERO DAKAR', 'WRT000651', 'MK2KRWPNUPJ001592', '-', 36, '2023-03-20', 110, 2250000, 1, 'N', 'N', 2250000, '150', '154', '', '', 'Y', 0, 'N', '2023-03-20 17:45:53', '2023-03-20 17:45:53', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(658, 'BENYAMIN MARTIONO', 'JL KEMANGGISAN GG CI 68 A ', '83899037817', 'YAMAHA BPV AT', 'WRT000652', 'MH3SG8410NK001147', 'B 5170 BHC', 94, '2023-03-21', 34, 600000, 1, 'N', 'N', 650000, '151', '', '', '', 'Y', 100000, 'N', '2023-03-21 14:18:55', '2023-03-21 14:18:55', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(659, 'AAN WIJAYA', 'DUSUN RANGDU TENGAH RT 006 RW 002 KEL RANGDU', '8118984546', 'MAZDA CX-3 5WGN RHD', 'WRT000653', 'MM6DK2WAAPW525588', '-', 31, '2023-03-21', 99, 2275000, 1, 'N', 'N', 1225000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-21 17:25:57', '2023-03-21 17:25:57', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(660, 'AHMAD HENDARMIN SUNANDAR', 'JL PUTRI NO 4 RT 005 RW 005', '85827687600', 'HYUNDAI PALISADE SIGNATUR ', 'WRT000654', 'KMHR381AMPU591301', '-', 69, '2023-03-25', 68, 5150000, 1, 'N', 'N', 0, '151', '153', '154', '', 'Y', 0, 'N', '2023-03-23 10:53:57', '2023-03-23 10:53:57', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(661, 'MARUP SOPANDI', 'KP KANDANG SAPI RT 005 RW 006', '8118984546', 'MAZDA CX 5 5WGN RHD', 'WRT000655', 'JM6KF4WLAN0858832', '-', 41, '2023-03-23', 99, 3900000, 1, 'N', 'N', 2100000, '149', '148', '', '', 'Y', 0, 'N', '2023-03-23 12:22:12', '2023-03-23 12:22:12', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(662, 'RAJALUMAYUNG', 'TOYOTA FORTUNER', '81808045070', 'TOYOTA FORTUNER', 'WRT000656', 'MHFZR69G6F3119893', '-', 20, '2023-03-23', 34, 480000, 1, 'N', 'N', 1920000, '148', '', '', '', 'Y', 0, 'N', '2023-03-23 12:24:27', '2023-03-23 12:24:27', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(663, 'ISKANDAR ZULKARNAIN', 'KP CIPAYUNG RT 002 RW 002 KEL CIPAYUNG', '81211106275', 'TOYOTA INNOVA ZENIX', 'WRT000657', 'MHFAAAAA8P0007971', '-', 20, '2023-03-23', 142, 1600000, 1, 'N', 'N', 800000, '148', '', '', '', 'Y', 0, 'N', '2023-03-23 12:28:15', '2023-03-23 12:28:15', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(664, 'R TRI AGUS SANTOSO', 'JL CEMPAKA BARU VII RT 008 RW 007', '81250004090', 'HONDA WR-V DG48', 'WRT000658', 'MHRDG4860PJ301065', '-', 31, '2023-03-23', 59, 1750000, 1, 'N', 'N', 0, '150', '', '', '', 'Y', 0, 'N', '2023-03-23 12:44:55', '2023-03-23 12:44:55', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(665, 'RAHMAN B PASUE', 'KP BULU RT 003 RW 011 KE SETIAMEKAR KEC TAMBUN', '-', 'TOYOTA INNOVA ZENIX', 'WRT000659', 'MHFAAAAA1P0008234', '-', 36, '2023-03-24', 169, 2925000, 1, 'N', 'N', 0, '148', '151', '', '', 'Y', 0, 'N', '2023-03-24 10:27:20', '2023-03-24 10:03:23', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(666, 'NUR MUHAMMAD JULIAN', 'JL DR SETIABUDHI NO 103 X RT 7 RW 5 GEGERKALONG', '87880465035', 'MAZDA 2', 'WRT000660', 'MM6DJ2HAAFW117901', '-', 132, '2023-03-30', 34, 3770000, 1, 'N', 'N', 0, '153', '154', '', '', 'Y', 0, 'N', '2023-03-24 10:31:55', '2023-03-24 10:03:31', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(667, 'FRANS HARISCHANDRA SOETANTO', 'JAKARTA GARDEN CITY PALM SPRING F RT 6 RW 14', '8118984546', 'MAZDA 6 2.5L', 'WRT000661', 'JM6GL1033P0502427', '-', 36, '2023-03-24', 99, 2925000, 1, 'N', 'N', 1575000, '149', '', '', '', 'Y', 0, 'N', '2023-03-24 10:34:46', '2023-03-24 10:03:40', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(668, 'SYAIFUDDIN ZUHRIE', 'JL H HASAN GG BUHARI NO 8 RT 4 RW 2', '-', 'MITSUBISHI XPANDER', 'WRT000662', 'MK2NCXTATNJ012318', '-', 95, '2023-03-24', 173, 3900000, 1, 'N', 'N', 3500000, '150', '154', '153', '', 'Y', 0, 'N', '2023-03-24 14:09:16', '2023-03-25 09:03:23', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(669, 'IRIANTO BASUKI', 'VILLA PERTIWI BLOK J-3 NO 5-6 RT 002 RW 015', '8111146014', 'HYUNDAI STARGAZER', 'WRT000663', 'MF3NE81DTPJ015644', '-', 35, '2023-03-24', 53, 2000000, 1, 'N', 'N', 2000000, '150', '', '', '', 'Y', 600000, 'N', '2023-03-24 16:43:25', '2023-03-27 11:03:20', '2023-03-28', 'B', '0000-00-00 00:00:00'),
(670, 'DAVIN', 'JL BUDI MULIA GG RT 8 RW 4 ', '82299747578', 'HONDA JAZZ', 'WRT000664', 'MHRGK5860FJ602230', 'B1828 DK', 31, '2023-03-30', 174, 1550000, 1, 'N', 'N', 0, '148', '150', '', '', 'Y', 500000, 'N', '2023-03-25 11:16:30', '2023-03-30 08:03:43', '2023-03-30', 'B', '0000-00-00 00:00:00'),
(671, 'SULAEMAN', 'JL RA KARTINI KAV 8 RT 10 RW 4 ', '-', 'HONDA CIVIC 1.5 ', 'WRT000665', 'MRHFK4830HT710181', 'B 2303 SZJ', 32, '2023-03-25', 66, 2000000, 1, 'N', 'N', 2000000, '153', '150', '', '', 'Y', 0, 'N', '2023-03-25 12:58:08', '2023-03-25 14:03:34', '2023-03-25', 'B', '0000-00-00 00:00:00'),
(672, 'EDU IBRAHIM', 'JL CIRATA DB 25 RT 002 RW 012', '81219253496', 'HYUNDAI STARGAZER', 'WRT000666', 'MF3NE81DTPJ015930', '-', 63, '2023-03-25', 129, 3300000, 1, 'N', 'N', 2700000, '150', '', '', '', 'Y', 500000, 'N', '2023-03-25 15:17:58', '2023-03-27 14:03:56', '2023-03-28', 'B', '0000-00-00 00:00:00'),
(673, 'SAWIT SETIABUDI', 'KRANGGAN LEMBUR RT 01 RW 03 KOTA BEKASI', '812 84121398', 'TOYOTA FORTUNER 2.8 VRZ 4x2 AT', 'WRT000667', 'MHFAA8GS9NO792829', 'B 1578 KJQ', 36, '2023-04-03', 34, 1125000, 1, 'N', 'N', 0, '149', '', '', '', 'Y', 3375000, 'N', '2023-03-26 05:35:59', '2023-04-03 08:04:23', '2023-04-03', 'B', '2023-04-03 08:04:23'),
(674, 'MUHAMMAD ABDULLAH', 'KOMP. MANDALA ASRI BLOK B NO 11 KOTA DEPOK', '81216445611', 'SUZUKI XL-7', 'WRT000668', 'MHYANC22SPJ101309', 'B 1786 EZK', 59, '2023-04-29', 34, 1100000, 1, 'N', 'N', 0, '153', '154', '151', '0', 'Y', 500000, 'N', '2023-03-26 13:08:51', '2023-04-29 08:04:33', '2023-04-29', 'B', '2023-05-02 11:05:31'),
(675, 'WIDIA LESTARI QQ. DEWA DHANANJAYA', 'JL CANDI MENDUT B, DUREN JAYA BEKASI TIMUR', '85216400080', 'TOYOTA RUSH 1.5 AT', 'WRT000669', 'MHKE8FB3JKK039094', 'B 8120 YW', 63, '2023-03-26', 34, 1500000, 1, 'N', 'N', 4500000, '153', '154', '151', '', 'Y', 500000, 'N', '2023-03-26 19:25:31', '2023-03-31 08:03:18', '0000-00-00', 'B', '0000-00-00 00:00:00'),
(676, 'ACHMAD SYAIFUDDIN RIFAI', 'KP BEDENG NO 18 RT 019 RW 005 KEL ROROTAN KEC CILINCING', '81310897536', 'MITSUBISHI XPANDER', 'WRT000670', 'MK2NCLTATNJ022203', '-', 63, '2023-03-27', 176, 3000000, 1, 'N', 'N', 3000000, '151', '153', '153', '', 'Y', 0, 'N', '2023-03-27 10:04:25', '2023-03-27 11:03:38', '2023-03-27', 'B', '0000-00-00 00:00:00'),
(677, 'SURAHMAN', 'VILA NUSA INDAH', '81275639414', 'MAZDA CX-5', 'WRT000671', 'JM6KE1031F0276939', '-', 36, '2023-03-27', 177, 2925000, 1, 'N', 'N', 1575000, '149', '151', '', '', 'Y', 0, 'Y', '2023-03-29 14:03:07', '2023-03-29 09:03:01', '2023-03-29', 'B', '0000-00-00 00:00:00'),
(678, 'FAHREZA NURFALLAH', 'JL HANKAM GG KREEN NO 22 RT 6 RW 3', '82126220988', 'HYUNDAI STARGAZER', 'WRT000672', 'MF3NE81DTPJ020278', '-', 67, '2023-03-27', 178, 4050000, 1, 'N', 'N', 3450000, '148', '154', '149', '', 'Y', 500000, 'N', '2023-03-27 15:19:25', '2023-03-27 14:03:20', '2023-03-27', 'B', '0000-00-00 00:00:00'),
(679, 'ARIF BUDIMAN', 'PERUM GRAHA PRIMA BLK M.27 RT 09 RW25 KEL. MANGUNJAYA ', '812293827', 'CHERY TIGO 8', 'WRT000673', 'MF7BD21B8NJ000054', '-', 32, '2023-03-28', 34, 0, 1, 'N', 'N', 0, '153', '150', '', '', 'Y', 500000, 'N', '2023-03-28 10:49:19', '2023-03-28 09:03:34', '2023-03-28', 'B', '0000-00-00 00:00:00'),
(680, 'EKA DEWI LESTARI', 'VANCOUVER UB 6/3 KOTA WISATA RT 004 RW 012', '8118401050', 'HYUNDAI CRETA PRIME', 'WRT000674', 'MF3PE812TPJO54124', '-', 63, '2023-03-28', 180, 3300000, 1, 'N', 'N', 2700000, '150', '154', '', '', 'Y', 0, 'N', '2023-03-28 15:19:46', '2023-03-29 09:03:09', '2023-03-28', 'B', '0000-00-00 00:00:00'),
(681, 'MUTIA RAHMAN', 'KP BULU RT 03 RW 11 SETIAMEKAR', '-', 'HONDA HR-V', 'WRT000675', 'MHRRU1850JJ701780', '-', 31, '2023-03-29', 34, 2275000, 1, 'N', 'N', 0, '153', '148', '0', '0', 'Y', 0, 'N', '2023-03-29 10:08:56', '2023-03-29 09:03:40', '0000-00-00', 'B', '0000-00-00 00:00:00'),
(682, 'IMRAN NAHUMARURY', 'KLP DUA WETAN', '8128704827', 'HONDA HR-V RV3F', 'WRT000676', 'MHRRV3890NJ200876', '-', 31, '2023-03-30', 144, 1750000, 1, 'N', 'N', 0, '149', '151', '', '', 'Y', 0, 'N', '2023-03-29 15:03:34', '2023-03-29 14:03:27', '2023-03-29', 'B', '0000-00-00 00:00:00'),
(683, 'SENIRA ARTIA RISKY', 'JL PERMATA TIMUR 1 BLOK G NO.7', '81289589640', 'MITSUBISHI XPANDER CROSS', 'WRT000677', 'MK2NCXTATPJ002430', '-', 31, '2023-04-04', 181, 1750000, 1, 'N', 'N', 0, '150', '0', '0', '0', 'Y', 0, 'N', '2023-03-30 14:12:07', '2023-04-04 08:04:03', '2023-04-04', 'B', '2023-04-11 11:04:47'),
(684, 'JAENUDIN', 'JL KEBAGUSAN BESAR III', '81298416897', 'BMW 4351 COUPE AT', 'WRT000678', 'WBA3R1205EKT32627', '-', 21, '2023-03-30', 34, 1200000, 1, 'N', 'N', 1400000, '151', '154', '', '', 'Y', 0, 'N', '2023-03-30 14:29:59', '2023-03-30 13:03:30', '2023-03-30', 'B', '0000-00-00 00:00:00'),
(685, 'HENDRA HERMAWAN WIJAYA', 'PERUM HARVEST CITY ORCHID BLOK OB. 11 NO.07', '81913217514', 'STARGAZER PRIME IVT 6P', 'WRT000679', 'MF3NE81DTPJ015643', '-', 35, '2023-03-30', 75, 2000000, 1, 'N', 'N', 2000000, '150', '148', '', '', 'Y', 0, 'N', '2023-03-30 14:59:54', '2023-03-31 08:03:36', '2023-03-31', 'B', '0000-00-00 00:00:00'),
(686, 'LESTARI AGUSALIM', 'BABAKAN LIO RT001 RW010 KEL BALUBANG JAYA', '81382707876', 'HYUNDAI CRETA PRIME', 'WRT000680', 'MF3PE812TPJ054912', '-', 40, '2023-04-01', 201, 2750000, 1, 'N', 'N', 0, '150', '0', '0', '0', 'Y', 2750000, 'N', '2023-03-31 11:02:51', '2023-04-01 14:04:34', '0000-00-00', 'B', '2023-04-01 17:04:17'),
(688, 'MUHAMMAD YUNUS', 'JL AMD XXXIX RT 005 RW 007 KEL KELAPA DUA WETAN', '85779674276', 'HONDA BRIO', 'WRT000682', 'MHRDD1890PJ300689', '-', 30, '2023-03-31', 44, 1500000, 1, 'N', 'N', 1500000, '149', '', '', '', 'Y', 0, 'N', '2023-03-31 11:45:53', '2023-03-31 10:03:01', '0000-00-00', 'B', '0000-00-00 00:00:00'),
(689, 'ELVIRA DIANTI', 'RAFLESH HILL BLOK EC 2 NO.5 RT 005 RW 016 KEL HARJAMUKTI', '81319517878', 'HYUNDAI STARGAZER PRIME', 'WRT000683', 'MF3NE81DTPJ022041', '-', 35, '2023-03-31', 53, 2000000, 1, 'N', 'N', 2000000, '150', '', '', '', 'Y', 2000000, 'N', '2023-03-31 12:12:09', '2023-04-03 13:04:39', '2023-04-03', 'B', '2023-04-03 13:04:39'),
(690, 'TETI MUTIARA', 'BUANA GARDENIA BLOK C 6 NO. 18', '81212868477', 'HONDA WR-V', 'WRT000684', 'MHRDG4820PJ300033', '-', 19, '2023-04-03', 44, 1300000, 1, 'N', 'N', 0, '183', '154', '', '', 'Y', 0, 'N', '2023-03-31 20:53:44', '2023-04-01 13:04:24', '2023-04-01', 'B', '2023-04-01 16:04:36'),
(691, 'EKA FITRIANA', 'PERUM CIKARANG UTAMA RESIDEN BLOK C 03 NO.2', '81290164065', 'HYUNDAI STARGAZER', 'WRT000685', 'MF3NE81DTPJ020111', '-', 19, '2023-03-31', 60, 1300000, 1, 'N', 'N', 1750000, '183', '154', '', '', 'Y', 700000, 'N', '2023-03-31 21:03:07', '2023-04-15 17:04:39', '2023-04-15', 'B', '2023-04-15 17:04:19'),
(692, 'HENDARTO', 'GREEN VIEW MERAPU BLOK B NO.3', ' 81317760099', 'TOYOTA HARRIER  2.4 AT', 'WRT000686', 'ACU300122718', 'B 1498 PJE', 36, '2023-04-03', 34, 800000, 1, 'N', 'N', 0, '149', '0', '0', '0', 'Y', 0, 'N', '2023-04-01 09:49:49', '2023-04-01 09:04:33', '2023-04-01', 'B', '2023-04-03 21:04:05'),
(693, 'NUR NOFI AISYAH', 'JL MADRASAH II NO 45 A RT 004 RW 010 KEL DUREN SAWIT', '81330209229', 'HONDA CIVIC 1.5 TC', 'WRT000687', 'MRHFE1680PP390332', '-', 36, '2023-04-01', 59, 2250000, 1, 'N', 'N', 2250000, '153', '', '', '', 'Y', 2250000, 'N', '2023-04-01 15:31:00', '2023-04-03 16:04:32', '2023-04-03', 'B', '2023-04-03 16:04:32'),
(694, 'LAELA ZUHRIYAH QQ RIO PURBA', 'BINTARO PUSPITA IV A/ C NO 1 RT 002 RW 008 KEL PESANGGRAHAN KEC PESANGGRAHAN', ' 82111544599', 'HYUNDAI IONIQ 5 SIGNATURE LONG RANGE', 'WRT000688', 'MF3KM81AUPJ003438', '-', 41, '2023-04-01', 184, 3000000, 1, 'N', 'N', 3000000, '150', '', '', '', 'Y', 500000, 'N', '2023-04-01 16:18:43', '2023-04-10 15:04:27', '2023-04-11', 'B', '2023-04-14 09:04:05'),
(695, 'FERI HADINATA', 'DUKUH ZARUD BLOK F2 NO 2 RT 01 RW 24', '81288121613', 'HONDA HR-V', 'WRT000689', 'MHRRV3870NJ206728', '-', 31, '2023-04-03', 34, 500000, 1, 'N', 'N', 0, '151', '0', '0', '0', 'Y', 3500000, 'N', '2023-04-03 10:53:58', '2023-04-03 09:04:10', '2023-04-03', 'B', '2023-04-03 09:04:10'),
(696, 'FAIRUZIA RAHMADIYANTI WIDYADHARI', 'KOTA WISATA BARCELONA SB 4/7 RT 003 RW 038 KEL CIANGSANA KEC GUNUNG PUTRI', '81514353532', 'HONDA WR-V ', 'WRT000690', 'MHRDG4860PJ301494', '-', 59, '2023-04-03', 44, 3050000, 1, 'N', 'N', 0, '153', '154', '183', '0', 'Y', 2450000, 'N', '2023-04-03 12:06:31', '2023-04-06 11:04:10', '2023-04-06', 'B', '2023-04-06 11:04:15'),
(701, 'RIO MARTHIN', 'JLN LAYUR BLOK D 35 RT 007 RW 011 KEL JATI KEC PULO GADUNG', '81316092113', 'HONDA BRIO E CVT', 'WRT000695', 'MHRDD1850PJ302422', '-', 18, '2023-04-03', 185, 1000000, 1, 'N', 'N', 0, '154', '183', '0', '0', 'Y', 0, 'N', '2023-04-03 12:57:16', '2023-04-05 15:04:14', '2023-04-05', 'B', '2023-04-06 09:04:58'),
(702, 'GATOT SETIYONO', 'JL UTAMA NO 20 SR SAWAH', '81312328418', 'HYUNDAI STARGAZER PRIME IVT 7P', 'WRT000696', 'MF3NE81DTPJ015905', '-', 35, '2023-04-03', 75, 2000000, 1, 'N', 'N', 0, '153', '0', '0', '0', 'Y', 0, 'N', '2023-04-03 13:02:06', '2023-04-04 08:04:22', '2023-04-04', 'B', '2023-04-05 08:04:41'),
(703, 'YOLANDA MAHARANI', 'JL KEBAGUSAN BESAR III', '81513842036', 'HYUNDAI STARGAZER PRIME IVT 7P', 'WRT000697', 'MF3NE81DTPJ017209', '-', 35, '2023-04-07', 191, 2000000, 1, 'N', 'N', 0, '153', '0', '0', '0', 'Y', 2000000, 'N', '2023-04-04 10:24:23', '2023-04-07 08:04:12', '2023-04-07', 'B', '2023-04-08 08:04:51'),
(704, 'SUBANDI', 'JLN LEMBUR 2', '881024309013', 'TOYOTA FORTUNER', 'WRT000698', 'MHFGB8GS0L0909637', '-', 16, '2023-04-04', 100, 0, 1, 'N', 'N', 1400000, '149', '', '', '', 'Y', 0, 'N', '2023-04-04 10:44:24', '2023-04-05 10:04:58', '2023-04-04', 'B', '2023-04-06 09:04:13'),
(705, 'PT FARIZ PUTRA PRATAMA QQ ABD HADI', 'PERUM METLAND MENTENG CLUSTER VALERIA', ' 81290000039', 'HYUNDAI PALISADE', 'WRT000699', 'KMHR381AMPU604005', '-', 69, '2023-04-07', 79, 4900000, 1, 'N', 'N', 0, '149', '154', '183', '0', 'Y', 0, 'N', '2023-04-04 17:50:39', '2023-04-11 12:04:20', '2023-04-11', 'B', '2023-04-13 10:04:19'),
(707, 'SUHARIYONO RACHMAN', 'BUKITCIMANGGU CITY BLOK S 9C', '8567777541', 'MITSUBISHI PAJERO', 'WRT000700', 'MK2KRWFNUPJ000480', '-', 20, '2023-04-05', 187, 1400000, 1, 'N', 'N', 0, '154', '183', '0', '0', 'Y', 0, 'N', '2023-04-05 12:43:15', '2023-04-05 11:04:45', '2023-04-05', 'B', '2023-04-05 15:04:58'),
(708, 'R.D.L. DIAN NOVITA. I.', 'LIMUS PRATAMA REGENCY E 16/8', '82189678520', 'TOYOTA ALPHARD', 'WRT000701', 'JTNGF3DH0P8040407', '-', 61, '2023-04-05', 186, 3400000, 1, 'N', 'N', 0, '149', '183', '154', '0', 'Y', 2500000, 'N', '2023-04-05 14:17:23', '2023-04-06 09:04:06', '2023-04-06', 'B', '2023-04-06 13:04:52'),
(709, 'AGUNG KURNIAWAN S HUT', 'JL SWADAYA RT 009 RW 001 BAMBU APUS', '85773295558', 'TOYOTA INNOVA ZENIX', 'WRT000702', 'MHFAAAAAXP0007860', '-', 60, '2023-04-05', 188, 3600000, 1, 'N', 'N', 0, '153', '154', '183', '0', 'Y', 500000, 'N', '2023-04-05 15:21:47', '2023-04-05 14:04:58', '2023-04-05', 'B', '2023-04-13 08:04:09'),
(710, 'PT CONTROL SYSTEMS ARENA PARA NUSA', 'JL AMPERA RAYA NO 9-10 RAGUNAN', '81290346410', 'MAZDA CX 9 FWD', 'WRT000703', 'JM6TC2WLAPO473461', '-', 65, '2023-04-07', 189, 3800000, 1, 'N', 'N', 0, '149', '183', '154', '0', 'Y', 3800000, 'N', '2023-04-06 12:00:53', '2023-04-07 10:04:28', '2023-04-07', 'B', '2023-04-11 09:04:46'),
(711, 'NOOR DIAH SAVITRI', 'BAMBU HIJAU RESIDENCE ', '81110653430', 'HYUNDAI CRETA TREND', 'WRT000704', 'MF3PB12TPJ052368', '-', 35, '2023-04-11', 0, 20, 1, 'N', 'N', 3999980, '149', '', '', '', 'N', 500000, 'N', '2023-04-06 14:48:59', '2023-04-06 14:48:59', '2023-04-11', 'B', '0000-00-00 00:00:00'),
(712, 'GUVHAHRI RAMADHAN', 'VILA MAHKOTA PESONA BLOK G 2 RT 2 RW 25', '82218328855', 'HONDA CIVIC', 'WRT000705', 'MRHFE1680PP390265', '-', 133, '2023-04-06', 190, 3150000, 1, 'N', 'N', 2850000, '150', '183', '154', '', 'Y', 2850000, 'N', '2023-04-06 15:12:27', '2023-04-06 14:04:22', '2023-04-06', 'B', '2023-04-06 14:04:53'),
(713, 'AHMAD ISKANDAR', 'KOMP POLRI PONDOK KARYA BLOK I NO 53', '8118301105', 'HONDA HRV', 'WRT000706', 'MHRRU1850HJ606498', '-', 31, '2023-04-11', 34, 1050000, 1, 'N', 'N', 0, '153', '0', '0', '0', 'Y', 0, 'N', '2023-04-06 15:23:52', '2023-04-11 11:04:09', '2023-04-11', 'B', '2023-04-12 16:04:51'),
(714, 'NOOR DIAH SAVITRI', 'BAMBU HIJAU RESIDENCE NO 6 JAKARTA TIMUR', '81110653430', 'HYUNDAI CRETA TREND', 'WRT000707', 'MF3PB812TPJ052368', '-', 35, '2023-04-11', 53, 2000000, 1, 'N', 'N', 0, '153', '151', '0', '0', 'Y', 500000, 'N', '2023-04-06 16:17:45', '2023-04-10 13:04:38', '2023-04-10', 'B', '2023-04-11 13:04:22'),
(716, 'OKTARI AL HUSNA', 'JLN SAMBU KEL AIR RUAI', '81808618042', 'MITSUBISHI XPANDER', 'WRT000709', 'MK2NCWTARKJ025246', 'B 2830 UOL', 19, '2023-04-08', 49, 800000, 1, 'N', 'N', 0, '154', '183', '0', '0', 'Y', 0, 'N', '2023-04-08 15:54:30', '2023-04-08 14:04:44', '2023-04-08', 'B', '2023-04-10 10:04:37'),
(717, 'ROBIN ELATH', 'CIKIWUL RT 003 RW 001 BANTAR GEBANG', '81383370375', 'TOYOTA YARIS', 'WRT000710', 'MHFK23F33N2183383', '-', 59, '2023-04-08', 193, 3050000, 1, 'N', 'N', 2450000, '149', '154', '183', '', 'Y', 500000, 'N', '2023-04-08 18:23:25', '2023-04-10 10:04:36', '2023-04-08', 'B', '2023-04-11 09:04:03'),
(718, 'ANDIKA SATRIO BRAHMONOAJI', 'JL AVIA BLOK A1/36 JATIASIH', '81319197632', 'TOYOTA INNOVA 2.4  V AT', 'WRT000711', 'MHFGB8EM8K0427646', 'B 833 KTI', 32, '2023-04-15', 34, 1000000, 1, 'N', 'N', 3000000, '149', '', '', '', 'Y', 500000, 'N', '2023-04-09 12:48:08', '2023-04-14 15:04:35', '2023-04-14', 'B', '2023-04-17 09:04:30'),
(719, 'SARMILIH', 'JL RAYA MUCHTAR RT 002 RW 005', '81283940523', 'MITSUBISHI XPANDER CROSS', 'WRT000712', 'MK2NCXTATPJ000639', '-', 31, '2023-04-09', 194, 1300000, 1, 'N', 'N', 0, '151', '0', '0', '0', 'Y', 0, 'N', '2023-04-10 11:02:20', '2023-04-10 10:04:26', '2023-04-09', 'B', '2023-04-10 10:04:03'),
(720, 'WICAKSONO ABDINUR MUHAMMAD', 'PERUM KALIGELANG BLOK R NO 5', '82144411146', 'MAZDA CX-3', 'WRT000713', 'JM6DK2W7AH0306015', '-', 19, '2023-04-15', 34, 200000, 1, 'N', 'N', 1800000, '154', '183', '', '', 'Y', 500000, 'N', '2023-04-10 12:07:01', '2023-04-15 09:04:10', '2023-04-15', 'B', '2023-04-15 17:04:35'),
(721, 'WICAKSONO ABDINUR MUHAMAD', 'PERUM KALIGELANG BLOK R NO 5', '-', 'MAZDA CX-3 ', 'WRT000714', 'JM6DK2W7AH0306015', 'G 1894 CM ', 35, '2023-01-07', 99, 2200000, 1, 'N', 'N', 1800000, '149', '151', '', '', 'Y', 1800000, 'N', '2023-04-10 16:02:20', '2023-04-10 15:04:37', '2023-01-07', 'B', '2023-04-10 15:04:37'),
(722, 'YONGKY W', 'Citra Gran Cibubur, Cluster The Dense Blok P.02/69', '85777555150', 'HONDA HR-V', 'WRT000715', 'MHRRV3830PJ300113', '-', 63, '2023-04-17', 34, 1700000, 1, 'N', 'N', 0, '149', '183', '154', '0', 'Y', 4300000, 'N', '2023-04-10 17:40:03', '2023-04-17 09:04:47', '2023-04-17', 'B', '2023-04-17 09:04:47'),
(723, 'HENDRY ANWAR', '-', '-', 'MAZDA CX-5', 'WRT000716', 'JM6KF2WLAN0794403', '-', 64, '2022-10-22', 99, 3795000, 1, 'N', 'N', 3105000, '149', '', '', '', 'Y', 0, 'N', '2023-04-11 10:48:38', '2023-04-11 10:48:38', '2023-04-11', 'B', '0000-00-00 00:00:00'),
(724, 'CICILIA DIYAN RETNOWATI', '-', '-', 'MAZDA 2 5HB', 'WRT000717', 'MM6DJ2HAANW829652', '-', 34, '2022-11-11', 99, 1925000, 1, 'N', 'N', 1575000, '153', '', '', '', 'Y', 0, 'N', '2023-04-11 10:52:03', '2023-04-11 10:52:03', '2023-04-11', 'B', '0000-00-00 00:00:00'),
(725, 'IWAN ROSYADI ', '-', '-', 'MAZDA CX-3 ', 'WRT000718', 'MM6DK2WAANW518667', '-', 40, '2022-12-24', 99, 3025000, 1, 'N', 'N', 2475000, '150', '', '', '', 'Y', 0, 'N', '2023-04-11 10:55:47', '2023-04-11 10:55:47', '2023-04-11', 'B', '0000-00-00 00:00:00'),
(726, 'IVANA PUHAN', '-', '-', 'MAZDA CX-5 KURO', 'WRT000719', 'JM6KF2WLAN0854126', '-', 32, '2022-12-28', 99, 2200000, 1, 'N', 'N', 1800000, '153', '', '', '', 'Y', 0, 'N', '2023-04-11 10:58:38', '2023-04-11 10:58:38', '2023-04-11', 'B', '0000-00-00 00:00:00'),
(727, 'ELVI MULIANA ', '-', '-', 'MAZDA CX-3 ELITE', 'WRT000720', 'PP1KGA333NM300127', '-', 32, '2023-01-06', 99, 2200000, 1, 'N', 'N', 1800000, '149', '', '', '', 'Y', 0, 'N', '2023-04-11 12:21:44', '2023-04-11 12:21:44', '2023-04-11', 'B', '0000-00-00 00:00:00'),
(728, 'MARLIANA PUSPITA SARI', '-', '-', 'MAZDA CX-3 ', 'WRT000721', 'MM6DK2WAANW518667', '-', 35, '2023-01-06', 99, 2200000, 1, 'N', 'N', 0, '149', '0', '0', '0', 'Y', 0, 'N', '2023-04-11 12:42:09', '2023-04-11 12:42:09', '2023-04-11', 'B', '0000-00-00 00:00:00'),
(729, 'SISWO ADIBOWO', '-', '-', 'WULING CORTEZ', 'WRT000722', 'MK3AACE21NJ006453', '-', 58, '2023-01-07', 99, 2530000, 1, 'N', 'N', 2070000, '153', '', '', '', 'Y', 0, 'N', '2023-04-11 14:19:49', '2023-04-11 14:19:49', '2023-04-11', 'B', '0000-00-00 00:00:00'),
(730, 'DANIEL ', 'Prima Harapan Regency Cluster Golden Blok E-2 No.9 Harapan Baru bekasi Utara', '81283476225', 'MAZDA CX-5', 'WRT000723', 'JM6KF2LAN0770439', '-', 36, '2023-01-11', 177, 2475000, 1, 'N', 'N', 0, '150', '0', '0', '0', 'Y', 0, 'N', '2023-04-11 14:22:31', '2023-04-11 14:22:31', '2023-04-11', 'B', '0000-00-00 00:00:00'),
(731, 'AKHMAD MAULANA HAMZAH', '-', '-', 'MAZDA 3 ', 'WRT000724', 'JM6BP2H7AL1105375', '-', 35, '2023-01-11', 100, 2200000, 1, 'N', 'N', 1800000, '153', '', '', '', 'Y', 0, 'N', '2023-04-11 14:25:46', '2023-04-11 14:25:46', '2023-04-11', 'B', '0000-00-00 00:00:00'),
(732, 'YULIA', '-', '-', 'MAZDA CX-5 ELITE', 'WRT000725', 'JM6KF2WLAN0855888', '-', 33, '2023-01-11', 100, 2475000, 1, 'N', 'N', 2025000, '150', '', '', '', 'Y', 0, 'N', '2023-04-11 14:27:28', '2023-04-11 14:27:28', '2023-04-11', 'B', '0000-00-00 00:00:00'),
(733, 'R GIRI RAJASHA', '-', '-', 'MAZDA 2 ', 'WRT000726', 'MM6DJ2HAAKW602630', '-', 34, '2023-01-20', 100, 1925000, 1, 'N', 'N', 1575000, '153', '', '', '', 'Y', 0, 'N', '2023-04-11 14:29:30', '2023-04-11 14:29:30', '2023-04-11', 'B', '0000-00-00 00:00:00'),
(734, 'SUTIKNO', 'PERUM KOPWANI VILLAGE II', '89668178718', 'MITSUBISHI XPANDER', 'WRT000727', 'MK2NCLTATNJ015055', '-', 31, '2023-04-17', 146, 1550000, 1, 'N', 'N', 0, '150', '0', '0', '0', 'Y', 0, 'N', '2023-04-11 17:00:42', '2023-04-17 08:04:55', '2023-04-17', 'B', '2023-04-19 09:04:51'),
(735, 'SYAFRIALDI', 'GG MUSHOLA RT 008 RW 011', '81281166469 ', 'MITSUBISHI XPANDER 1.5L ULTIMATE', 'WRT000728', 'MK2NCLTATPJ002703', '-', 35, '2023-04-19', 195, 2000000, 1, 'N', 'N', 2000000, '150', '', '', '', 'Y', 1000000, 'N', '2023-04-11 17:03:46', '2023-04-14 08:04:02', '2023-04-14', 'B', '2023-04-15 08:04:50'),
(736, 'MELTA LIBERIL', 'JL WIBAWA MUKTI IV NO 2', '82110740700', 'WULING AIR EV', 'WRT000729', 'MK3AACE29NJ003154', '-', 18, '2023-04-14', 65, 1000000, 1, 'N', 'N', 0, '154', '183', '0', '0', 'Y', 0, 'N', '2023-04-12 00:27:32', '2023-04-14 17:04:15', '2023-04-14', 'B', '2023-04-15 08:04:16'),
(737, 'SINTHA NURAINI SARI DEWI', 'JL CEMPAKA MOLEK NO 90 RT 005 RW 006', '81317701105', 'HONDA WR-V RS', 'WRT000730', 'MHRDG4840PJ301999', '-', 19, '2023-04-12', 54, 1300000, 1, 'N', 'N', 700000, '183', '154', '', '', 'Y', 700000, 'N', '2023-04-12 10:00:18', '2023-04-12 14:04:28', '2023-04-12', 'B', '2023-04-12 16:04:05'),
(739, 'ERWIN RIYADI', 'BUKIT GOLF CIBUBUR RIVERSIDE', '811845515', 'HONDA WR-V', 'WRT000732', 'MHRDG4860PJ301832', '-', 63, '2023-05-03', 138, 3300000, 1, 'N', 'N', 0, '153', '154', '183', '150', 'Y', 2700000, 'N', '2023-04-12 15:14:21', '2023-05-03 13:05:32', '2023-05-03', 'B', '2023-05-03 18:05:53'),
(740, 'JHON HAPOSAN SIRAIT', 'PERUMAHAN SD PATANE II', '-', 'MITSUBISHI XPANDER', 'WRT000733', '-', '-', 31, '2023-04-18', 0, 1750000, 1, 'N', 'N', 1750000, '149', '', '', '', 'N', 500000, 'N', '2023-04-12 17:35:03', '2023-04-12 17:35:03', '2023-04-18', 'B', '0000-00-00 00:00:00'),
(741, 'JHON HAPOSAN SIRAIT', 'PERUMAHAN SD PATANE II', '85275119583', 'MITSUBISHI XPANDER', 'WRT000734', 'MK2NCLTATNJ018820', '-', 31, '2023-04-18', 34, 1000000, 1, 'N', 'N', 0, '150', '0', '0', '0', 'Y', 500000, 'N', '2023-04-12 17:44:00', '2023-04-18 09:04:16', '2023-04-18', 'B', '2023-04-19 08:04:04'),
(742, 'RAHMA HERIANCE', 'JL KEDOYA RAYA NO.23 RT 003 RW003', '81297215616', 'HONDA HR-V 1.5L', 'WRT000735', 'MHRRV3870PJ350435', '-', 31, '2023-04-13', 197, 1750000, 1, 'N', 'N', 0, '153', '0', '0', '0', 'Y', 0, 'N', '2023-04-13 10:53:49', '2023-04-13 11:04:23', '2023-04-13', 'B', '2023-04-15 09:04:26'),
(743, 'YAPISHAM DAMANIK', 'JL BEND JATILUHUR RT 1 RW 3', '8111182700', 'DAIHATSU XENIA', 'WRT000736', 'MHKV1BA2JCK019511', 'B 1332 POM', 15, '2023-04-13', 59, 900000, 1, 'N', 'N', 300000, '150', '', '', '', 'Y', 0, 'N', '2023-04-13 10:58:09', '2023-04-13 10:04:15', '2023-04-13', 'B', '2023-04-14 09:04:14'),
(744, 'HERU SURJO NUGROHO', 'JL DIMUN RAYA RT 005 RW 006 KEL SUKAMAJU KEC CILODONG', '81289322988', 'TOYOTA AVANZA', 'WRT000737', 'MHKAB1BY6NK041922', '-', 23, '2023-04-13', 198, 800000, 1, 'N', 'N', 0, '154', '183', '0', '0', 'Y', 0, 'N', '2023-04-13 14:11:23', '2023-04-13 13:04:33', '2023-04-13', 'B', '2023-04-14 09:04:38'),
(745, 'MOSHA MAULIDIVA SHAHIB', 'JL SALAK NO 23 RT 001 RW 012 CAWANG', '81293721060', 'HONDA HR-V', 'WRT000738', 'MHRRV3870PJ300440', '-', 59, '2023-04-18', 96, 3050000, 1, 'N', 'N', 2450000, '153', '183', '154', '', 'Y', 2450000, 'N', '2023-04-14 09:37:45', '2023-04-18 16:04:20', '2023-04-18', 'B', '2023-04-19 14:04:16'),
(747, 'UI SOK IN KARTINI', 'JL MANGGA BESAR IX A7 RT 002 RW 001', '81315005555', 'CHERY OMODA 5', 'WRT000740', 'MF7ED21B8PJ000357', '-', 31, '2023-04-16', 162, 1750000, 1, 'N', 'N', 1750000, '151', '', '', '', 'Y', 1750000, 'N', '2023-04-15 10:48:25', '2023-04-15 13:04:30', '2023-04-16', 'B', '2023-04-15 13:04:30'),
(748, 'OKKY RADITYA ADITAMA', 'JL RAJAWALI VI NO 12 PONDOK CIKUNIR INDAH', '82332705574', 'TOYOTA INNOVA', 'WRT000741', 'MHFAB8EM9N0117242', '-', 107, '2023-04-17', 34, 790000, 1, 'N', 'N', 0, '150', '0', '0', '0', 'Y', 500000, 'N', '2023-04-15 11:40:16', '2023-04-17 08:04:07', '2023-04-17', 'B', '2023-04-18 16:04:53'),
(749, 'ANDY NUGROHO SH', 'BUKIT GOLF LAVENDER BLOK GG 15/7', '81519652475', 'HYUNDAI CRETA PRIME', 'WRT000742', 'MF3PE812TPJ051530', '-', 45, '2023-04-15', 76, 3100000, 1, 'N', 'N', 0, '151', '0', '0', '0', 'Y', 0, 'N', '2023-04-15 11:51:22', '2023-04-15 11:04:05', '2023-04-15', 'B', '2023-04-15 12:04:37'),
(750, 'MUHAMMAD RAHADYAN AUFA', 'BUKIT GOLF ARCADIA BLOK AR/44 RT 001 RW 023', '81315627021', 'HONDA WR-V DG48', 'WRT000743', 'MHRDG4860PJ301746', '-', 79, '2023-04-15', 199, 2200000, 1, 'N', 'N', 0, '183', '154', '0', '0', 'Y', 0, 'N', '2023-04-15 13:54:17', '2023-04-15 12:04:38', '2023-04-15', 'B', '2023-04-18 11:04:37'),
(751, 'EKA FITRIANA', 'PERUM CIKARANG UTAMA RESIDEN BLOK C 03 NO.2', '81290164065', 'HYUNDAI STARGAZER', 'WRT000744', 'MF3NE81DTPJ020111', '-', 40, '2023-04-27', 60, 2550000, 1, 'N', 'N', 0, '150', '0', '0', '0', 'Y', 0, 'N', '2023-04-15 18:31:53', '2023-04-15 18:31:53', '2023-04-15', 'B', '0000-00-00 00:00:00'),
(752, 'DR ADI SOPIANDI', 'MT HARYONO RESIDENCE NO.60', '8122008182', 'HYUNDAI CRETA', 'WRT000745', 'MF3PC812TPJ054965', 'B 1066 SST', 19, '2023-04-17', 34, 200000, 1, 'N', 'N', 1800000, '154', '183', '', '', 'Y', 500000, 'N', '2023-04-16 00:18:57', '2023-04-17 13:04:37', '2023-04-17', 'B', '2023-04-17 15:04:14'),
(753, 'YUNITA EKA ASTUTIK', 'KOTA WISATA CLUSTER VISALIA BLOK SK 10/6', '82123652598', 'TOYOTA RUSH', 'WRT000746', 'MHKE8FB3JPK084813', '-', 19, '2023-04-18', 142, 1300000, 1, 'N', 'N', 700000, '183', '154', '', '', 'Y', 0, 'N', '2023-04-17 15:48:59', '2023-04-19 10:04:25', '2023-04-19', 'B', '2023-04-19 13:04:56'),
(754, 'YULI KURNIAWATI', 'KOTA WISATA CLUSTER NEBRASKA SJ 1 NO 08', '81222787817 ', 'TOYOTA FORTUNER', 'WRT000747', 'MHFAA8GS1P0796084', 'F 1522 FAX', 36, '2023-04-27', 200, 2250000, 1, 'N', 'N', 0, '153', '0', '0', '0', 'Y', 500000, 'N', '2023-04-17 17:16:09', '2023-04-27 09:04:41', '2023-04-27', 'B', '2023-04-28 10:04:18'),
(755, 'WISNU ADITOMO', 'JL RTM KELAPA DUA NO 43', '8151822462', 'MITSUBISHI XPANDER', 'WRT000748', 'MK2NCLTATPJ002846', '-', 63, '2023-05-02', 212, 3000000, 1, 'N', 'N', 0, '150', '154', '183', '0', 'Y', 3000000, 'N', '2023-04-19 14:22:15', '2023-05-02 09:05:32', '2023-05-02', 'B', '2023-05-03 08:05:58'),
(756, 'YULI KURNIAWATI', 'KOTA WISATA CLUSTER NEBRASKA SJ 1 NO 08', '81222787817 ', 'TOYOTA ALPHARD', 'WRT000749', 'JTNGF3DHXM8032973', '-', 134, '2023-04-28', 200, 3000000, 1, 'N', 'N', 0, '149', '148', '0', '0', 'Y', 0, 'N', '2023-04-19 15:21:59', '2023-04-29 09:04:27', '2023-04-29', 'B', '2023-05-02 11:05:24'),
(757, 'WAHYUNI', 'JL KR PULO GUNDUL K 48', '81298484679', 'MITSUBISHI XPANDER ULTIMATE', 'WRT000750', 'MK2NCLTATPJ002156', '-', 19, '2023-04-20', 202, 1300000, 1, 'N', 'N', 700000, '154', '183', '', '', 'Y', 0, 'N', '2023-04-20 12:01:44', '2023-04-20 11:04:29', '2023-04-20', 'B', '2023-04-20 15:04:02'),
(758, 'MUHAMMAD WAFI', 'ROTTERDAM RESIDENCE BLOK A NO 17', '8561592871', 'MITSUBISHI XPANDER ULTIMATE', 'WRT000751', 'MK2NCLTATPJ000583', '-', 19, '2023-04-27', 202, 1200000, 1, 'N', 'N', 700000, '154', '183', '', '', 'Y', 0, 'N', '2023-04-27 13:19:23', '2023-04-27 13:04:39', '2023-04-27', 'B', '2023-04-27 15:04:11'),
(759, 'SOEGENG SOEWARNO', 'JL CILIWUNG 6 NO.38 TAMAN CIBODAS CIKARANG', '87874807610', 'HONDA BRIO', 'WRT000752', 'MHRDD1890MJ100526', '-', 34, '2023-04-29', 162, 1550000, 1, 'N', 'N', 0, '151', '0', '0', '0', 'Y', 1000000, 'N', '2023-04-27 15:37:33', '2023-04-29 09:04:32', '2023-04-29', 'B', '2023-04-29 14:04:25'),
(760, 'PRANTIANA', 'JL MARTAPURA III', '818498581', 'MITSUBISHI XPANDER CROSS', 'WRT000753', 'MK2NCXTATPJ002781', '-', 95, '2023-04-28', 46, 4500000, 1, 'N', 'N', 0, '149', '154', '183', '0', 'Y', 0, 'N', '2023-04-27 17:47:31', '2023-04-28 08:04:49', '2023-04-28', 'B', '2023-04-29 12:04:03'),
(761, 'HENDY ADITYA', 'PERUMAHAN MARNA PUTRA JL DANAU SINGKARAK 1 NO B25', '87788212682', 'MITSUBISHI XPANDER 1.5L ULTIMATE', 'WRT000754', 'MK2NCLTATPJ002765', '-', 31, '2023-04-29', 146, 1550000, 1, 'N', 'N', 0, '150', '183', '0', '0', 'Y', 0, 'N', '2023-04-28 10:18:43', '2023-04-29 08:04:41', '2023-04-29', 'B', '2023-05-03 17:05:23'),
(762, 'RAEZA MAZULY', 'JL CHANDRA V BLOK D 10 RT 001 RW 016', '85770796744', 'HYUNDAI CRETA', 'WRT000755', 'MF3PE812TPJ060576', '-', 35, '2023-05-02', 203, 2200000, 1, 'N', 'N', 2000000, '151', '153', '', '', 'Y', 1800000, 'N', '2023-05-02 10:31:37', '2023-05-06 13:05:21', '2023-05-06', 'B', '2023-05-06 13:05:21'),
(763, 'NEVY SUZANTY', 'PERUMAHAN DE MINIMALIS BLOK B', '81295311970', 'HONDA CR-V', 'WRT000756', '-', 'E 1325 WR', 32, '2023-05-05', 34, 1600000, 1, 'N', 'N', 2400000, '151', '150', '', '', 'N', 500000, 'N', '2023-05-03 10:52:24', '2023-05-27 11:05:51', '2023-06-10', 'B', '0000-00-00 00:00:00'),
(764, 'NGATNO', 'JL H JUKI RT 009 RW 001 CIRACAS', '81315152603', 'MAZDA CX9', 'WRT000757', 'JM6TC4WLAN0471891', '-', 42, '2023-05-03', 74, 4550000, 1, 'N', 'N', 0, '149', '151', '0', '0', 'Y', 0, 'N', '2023-05-03 15:30:53', '2023-05-03 14:05:38', '2023-05-03', 'T', '2023-05-03 14:05:38'),
(765, 'PT MEGA INDO LOGISTIK', 'MAZDA SULTAN AGUNG', '-', 'MAZDA CX5 KURO', 'WRT000758', 'AJM6KF2WLAPO871135', '-', 60, '2023-05-05', 213, 4160000, 1, 'N', 'N', 0, '149', '154', '148', '0', 'Y', 0, 'N', '2023-05-05 12:09:33', '2023-05-05 14:05:29', '2023-05-05', 'T', '2023-05-05 14:05:29'),
(766, 'ARIAWAN SASONGKO', 'PERUM CITRA GRAN AVERSA PARK BLOK AA 7 NO 12', '81586402437', 'HYUNDAI SANTAFE D 2.2 AT SIGNATURE', 'WRT000759', 'MF3S381HVPJ001164', '-', 32, '2023-05-07', 53, 2000000, 1, 'N', 'N', 0, '151', '175', '0', '0', 'Y', 500000, 'N', '2023-05-06 12:31:36', '2023-05-07 12:05:23', '2023-05-07', 'B', '2023-05-08 11:05:23'),
(767, 'ARIAWAN SASONGKO', 'PERUM CITRA GRAN AVERSA PARK BLOK AA 7 NO 12', '81586402437', 'TOYOTA VOXY 2.0 AT', 'WRT000760', 'J17X2RB80L7020853', 'B 2670 KOY', 33, '2023-05-07', 53, 2250000, 1, 'N', 'N', 2250000, '153', '150', '', '', 'Y', 0, 'N', '2023-05-06 12:59:10', '2023-05-07 12:05:33', '2023-05-07', 'B', '2023-05-08 11:05:16'),
(768, 'IDA WENAS', 'JL RAJUNGAN I NO 12 RT 008 RW 006 KEL JATI KEC PULO GADUNG', '8128899249', 'MITSUBISHI XPANDER CROSS PREMIUM', 'WRT000761', 'MK2NCXTATPJ003656', '-', 35, '2023-05-08', 135, 2000000, 1, 'N', 'N', 0, '150', '0', '0', '0', 'Y', 2000000, 'N', '2023-05-06 15:13:27', '2023-05-11 08:05:44', '2023-05-11', 'B', '2023-05-11 08:05:44'),
(769, 'ALIP FAJAR', '-', '81339569430', 'HONDA BRIO', 'WRT000762', '-', '-', 18, '2023-05-19', 0, 8000000, 1, 'N', 'N', -6400000, '154', '183', '', '', 'N', 200000, 'N', '2023-05-08 10:10:35', '2023-05-08 10:10:35', '2023-05-19', 'B', '0000-00-00 00:00:00'),
(770, 'KHO KUSNADI', 'JL KELAPA PUAN XVI AG 13/16 RT 003 RW 012 PAKULONAN  BRT KELAPA DUA', '81339569430', 'HONDA BRIO SATYA 1.2 E CVT', 'WRT000763', 'MHRDD1850MJ114465', 'B 1012 JFH', 18, '2023-05-19', 34, 800000, 1, 'N', 'N', 800000, '154', '183', '', '', 'Y', 200000, 'N', '2023-05-08 10:11:47', '2023-05-15 14:05:36', '2023-05-19', 'B', '2023-05-15 16:05:41'),
(771, 'ANDI SAFRIL PANGERAN', 'PERUM PERMATA CIMANGGIS CLUSTER ONYX BLOK 14 NO15', '81288474539', 'TOYOTA ALPHARD', 'WRT000764', 'JTNGF3DH2P8040540', '-', 81, '2023-05-08', 34, 1000000, 1, 'N', 'N', 0, '154', '183', '0', '0', 'Y', 3200000, 'N', '2023-05-08 10:15:54', '2023-05-08 09:05:21', '2023-05-08', 'B', '2023-05-08 15:05:56'),
(772, 'WINARDI', 'PURI GADING BLOK A 2/1 RT 001 RW 007', '811851126', 'MITSUBISHI PAJERO SPORT', 'WRT000765', 'MMBGRKG40ED006538', 'B 2714 KBF', 32, '2023-05-23', 56, 2000000, 1, 'N', 'N', 0, '153', '151', '0', '0', 'Y', 0, 'N', '2023-05-09 11:52:20', '2023-05-22 09:05:49', '2023-05-21', 'B', '2023-05-23 17:05:05'),
(773, 'LIA SHELLINA', '-', '-', 'MAZDA CX-3 SPORT', 'WRT000766', 'MM6DK2WAAPW527830', '-', 31, '2023-05-10', 99, 2275000, 1, 'N', 'N', 0, '149', '151', '0', '0', 'Y', 0, 'N', '2023-05-09 17:55:56', '2023-05-10 09:05:24', '2023-05-10', 'T', '2023-05-10 09:05:24'),
(774, 'DIYAH SETIANINGSIH', 'BUKIT GOLF ARCADIA I BLOK A 7/9', '8118143999', 'SUZUKI S-CROSS', 'WRT000767', 'MA3MYA12SN0285958', '-', 45, '2023-05-10', 88, 3250000, 1, 'N', 'N', 0, '148', '183', '0', '0', 'Y', 0, 'N', '2023-05-10 10:18:51', '2023-05-10 09:05:45', '2023-05-10', 'B', '2023-05-11 09:05:42'),
(775, 'EDY PRAYITNO', 'NGIRENG-IRENG RT 003 RW 000 PANGGUNGHARJO', '8118011121', 'MITSUBISHI XPANDER CROSS 1.5L', 'WRT000768', 'MK2NCXTATPJ002298', '-', 19, '2023-05-11', 37, 1000000, 1, 'N', 'N', 1000000, '148', '183', '', '', 'Y', 1000000, 'N', '2023-05-10 12:35:47', '2023-05-11 08:05:55', '2023-05-11', 'B', '2023-05-11 08:05:55'),
(776, 'ANDREAS SETYA', '-', '87820362014', 'MERCEDES BENZ', 'WRT000769', 'WDD2120486L023143', 'B 1385 BAD', 36, '2023-05-09', 34, 4500000, 1, 'N', 'N', 0, '149', '150', '153', '0', 'Y', 0, 'N', '2023-05-11 11:41:22', '2023-05-11 10:05:46', '2023-05-09', 'B', '2023-05-11 10:05:46'),
(777, 'SOLEH', 'TOKO MEKAR JAYA CILEUNGSI', '87874037749', 'PAJERO SPORT DAKAR 4X2', 'WRT000770', 'MK2KRWPNUMJ000608', '-', 32, '2023-05-15', 34, 2000000, 1, 'N', 'N', 0, '150', '151', '0', '0', 'Y', 500000, 'N', '2023-05-11 15:24:44', '2023-05-15 09:05:41', '2023-05-15', 'B', '2023-05-17 09:05:37'),
(778, 'MUHAMMAD RIZQAAMUL HUSNI SAHIDU', 'CIBUBUR COUNTRY CUSTER EAGLE WOOD EW 3/16', '818368869', 'HONDA BR-V DG3', 'WRT000771', 'MHRDG3880PJ300938', '-', 31, '2023-05-11', 144, 1750000, 1, 'N', 'N', 1750000, '149', '153', '', '', 'Y', 0, 'N', '2023-05-11 16:36:06', '2023-05-11 15:05:52', '2023-05-11', 'B', '2023-05-12 13:05:17'),
(779, 'DINI NURAENI', 'MUTIARA JUANDA RESIDENCE BLOK C 11', '81394443265', 'HONDA WR-V RS HS', 'WRT000772', 'MHRDB4860PJ301248', 'B 1285 EZP', 63, '2023-05-13', 34, 1200000, 1, 'N', 'N', 0, '150', '154', '183', '0', 'Y', 500000, 'N', '2023-05-11 17:21:20', '2023-05-13 09:05:54', '2023-05-13', 'B', '2023-05-15 09:05:23'),
(780, 'WIJI NINGSIH.HJ', '-', '-', 'MAZDA CX-8 ELITE', 'WRT000773', 'PP1KGA333PM300200', '-', 37, '2023-05-13', 99, 3250000, 1, 'N', 'N', 0, '149', '0', '0', '0', 'Y', 0, 'N', '2023-05-11 18:03:01', '2023-05-13 08:05:42', '2023-05-13', 'T', '2023-05-13 08:05:42'),
(781, 'HARRY CANDRA WIBOWO ', 'KEBON PALA RT 7/1 MAKASAR JAKTIM', '818545575', 'NISSAN X-TRAIL', 'WRT000774', 'MHBF3CG3CHJ003172', '-', 32, '2023-05-12', 34, 1500000, 1, 'N', 'N', 2500000, '151', '148', '', '', 'Y', 0, 'N', '2023-05-12 09:49:31', '2023-05-12 09:05:17', '2023-05-12', 'B', '2023-05-13 10:05:15'),
(782, 'HARRY CANDRA WIBOWO ', 'KEBON PALA RT 7/1 MAKASAR JAKTIM', '818545575', 'MITSUBISHI XPANDER', 'WRT000775', 'MK2NCWTARHJ00365', 'B 2310 TZA', 35, '2022-12-20', 155, 4000000, 1, 'N', 'N', 0, '149', '0', '0', '0', 'Y', 0, 'N', '2023-05-12 10:52:55', '2023-05-12 09:05:52', '2022-12-20', 'B', '2023-05-12 09:05:52'),
(783, 'HANNY WAHYU WIDODO', 'GG CBD', '85263512345', 'HONDA WR-V', 'WRT000776', 'MHRDB4840PJ350224', 'B 1144 HKJ', 31, '2023-05-15', 34, 500000, 1, 'N', 'N', 0, '150', '175', '0', '0', 'Y', 3000000, 'N', '2023-05-12 11:28:39', '2023-05-19 09:05:53', '2023-05-19', 'B', '2023-05-20 10:05:01'),
(784, 'YOSAFAT IMANUEL', 'GREEN CAMAN 3 RESIDENCE JL PERMATA IX NO 27 RT 007 RW 003', '81287233323', 'TOYOTA RAIZE', 'WRT000777', 'MHKAA1BA7PJ078900', '-', 31, '2023-05-12', 207, 1750000, 1, 'N', 'N', 0, '153', '0', '0', '0', 'Y', 0, 'N', '2023-05-12 12:20:43', '2023-05-12 14:05:48', '2023-05-12', 'B', '2023-05-15 09:05:48'),
(785, 'GGH', '-', '-', 'TOYOTA INNOVA', 'WRT000778', '-', '-', 20, '2023-05-13', 0, 1600000, 1, 'N', 'N', 800000, '154', '183', '', '', 'N', 0, 'N', '2023-05-13 10:42:03', '2023-05-13 10:42:03', '2023-05-13', 'B', '0000-00-00 00:00:00'),
(786, 'KHOIRUL IMAM', '-', '82244442221', 'TOYOTA INNOVA', 'WRT000779', 'MHFJB8EM6M1084192', 'F 1157 FAA', 20, '2023-05-13', 208, 1600000, 1, 'N', 'N', 0, '154', '183', '0', '0', 'Y', 0, 'N', '2023-05-13 10:46:48', '2023-05-13 09:05:03', '2023-05-13', 'B', '2023-05-15 09:05:28'),
(787, 'HENNY RACHMALITA', 'KP PAYANGAN  RT 002 RW 006 JATISARI', '81319132970', 'HONDA HR-V', 'WRT000780', 'MHRRV3870PJ302952', '-', 35, '2023-05-15', 0, 2000000, 1, 'N', 'N', 2000000, '151', '', '', '', 'N', 2000000, 'N', '2023-05-13 13:46:01', '2023-05-13 13:46:01', '2023-05-15', 'B', '0000-00-00 00:00:00'),
(788, 'HENNY RACHMALITA', 'KP PAYANGAN RT 002 RW 006', '81319132970', 'HONDA HR-V', 'WRT000781', 'MHRRV3870PJ302952', '-', 35, '2023-05-15', 190, 2000000, 1, 'N', 'N', 2000000, '150', '151', '', '', 'Y', 2000000, 'N', '2023-05-13 13:48:44', '2023-05-17 12:05:05', '2023-05-17', 'B', '2023-05-17 12:05:05'),
(789, 'TANIA SUCIHATI', 'KAV DKI BLOK B 2 NO 18 RT 009 RW 009 MALAKA SARI', '8127957274', 'HONDA HR-V RV3F 1.5T', 'WRT000782', 'MHRRV3890PJ300190', '-', 31, '2023-05-14', 209, 1750000, 1, 'N', 'N', 0, '149', '151', '0', '0', 'Y', 0, 'N', '2023-05-13 14:16:33', '2023-05-13 13:05:17', '2023-05-14', 'B', '2023-05-16 09:05:05'),
(790, 'SOVIANTO MARLIN', 'JALAN BACANG NO 31 RT 015 RW 001 KEL LUBANG BUAYA', '81911707020', 'HYUNDAI CRETA PRIME 1.5 IVT', 'WRT000783', 'MF3PE812TPJ059210', '-', 31, '2023-05-15', 210, 1750000, 1, 'N', 'N', 1750000, '153', '', '', '', 'Y', 0, 'N', '2023-05-15 12:18:22', '2023-05-15 14:05:47', '2023-05-15', 'B', '2023-05-17 09:05:21'),
(791, 'MUHAMMAD CHANDRA ROSYID', 'JL SILIWANGI IV BLOK A / 50 RT 004 RW 017 JATIRAHAYU', '87822000651', 'HONDA WR-V RS HS', 'WRT000784', 'MHRDB4860PJ302546', 'B 1717 ROB', 63, '2023-05-19', 211, 3300000, 1, 'N', 'N', 0, '150', '154', '183', '0', 'Y', 2700000, 'N', '2023-05-16 17:55:36', '2023-05-22 14:05:26', '2023-05-22', 'B', '2023-05-22 14:05:26'),
(792, 'ENI NORAINI', 'DUTA BINTARO BLOK D 14/2 RT 006 RW 008 KUNCIRAN PINANG', '85711902776', 'PAJERO SPORT DAKAR 4X2 AT', 'WRT000785', 'MK2KRWPNUPJ004089', '-', 36, '2023-05-17', 161, 2250000, 1, 'N', 'N', 2250000, '149', '153', '', '', 'Y', 0, 'N', '2023-05-17 09:40:19', '2023-05-17 08:05:50', '2023-05-17', 'B', '2023-05-17 13:05:46'),
(793, 'YUNANTA DHARMA S', 'CIBUBUR', '81210068908', 'TOYOTA RUSH', 'WRT000786', 'MHKE8FB3JJK009096', 'B 2657 KKP', 35, '2023-05-20', 34, 0, 1, 'N', 'N', 0, '153', '175', '0', '0', 'Y', 500000, 'N', '2023-05-18 17:58:01', '2023-05-20 08:05:08', '2023-05-20', 'B', '2023-05-22 09:05:14'),
(794, 'RIDA WIDARKA', 'JL SUBUR PERTAMINA RT 4 RW 2 NO 112 PONDOK RANGGON CIPAYUNG', '8129094619', 'HONDA CR-V', 'WRT000787', 'MHRRW1880JJ809395', 'B 1731 BJV', 32, '2023-05-22', 181, 2000000, 1, 'N', 'N', 0, '153', '150', '0', '0', 'Y', 0, 'N', '2023-05-19 10:50:34', '2023-05-22 10:05:50', '2023-05-22', 'B', '2023-05-23 09:05:08'),
(795, 'ERWIN', 'PERUM MUTIARA GADING CITY CLUSTER LONDON BLOK L 02/17', '89603658522', 'HYUNDAI CRETA', 'WRT000788', '-', '-', 35, '2023-05-20', 206, 2000000, 1, 'N', 'N', 2000000, '151', '', '', '', 'N', 0, 'Y', '2023-05-24 19:05:37', '2023-05-23 11:05:54', '2023-05-19', 'B', '0000-00-00 00:00:00'),
(796, 'ASPEN HUTAGALUNG', 'CITRA INDAH BUKIT PINUS Q12 8 RT 02 RW 10 JONGGOL', '81218835674', 'TOYOTA FORTUNER', 'WRT000789', 'MHFAA8GSXP0900524', '-', 32, '2023-05-22', 34, 1200000, 1, 'N', 'N', 2800000, '153', '', '', '', 'Y', 0, 'N', '2023-05-19 16:50:58', '2023-05-23 08:05:33', '2023-05-23', 'B', '2023-05-24 17:05:18'),
(797, 'BAYU ADJE ADRIANTO', 'JL SMP 100 RT 003 RW 005 CEGER', '81296239889', 'MITSUBISHI XPANDER CROSS 1.5L', 'WRT000790', 'MK2NCXTATPJ003170', '-', 35, '2023-05-23', 46, 2000000, 1, 'N', 'N', 2000000, '150', '148', '', '', 'Y', 0, 'N', '2023-05-19 17:08:47', '2023-05-24 08:05:13', '2023-05-24', 'B', '2023-05-26 16:05:06'),
(798, 'RIFKY PINARYO DWI', 'TANAH KUSIR NO 3', '85216515386', 'HYUNDAI PALISADE', 'WRT000791', 'KHMR381AMPU618309', '-', 42, '2023-05-23', 214, 3500000, 1, 'N', 'N', 0, '149', '148', '0', '0', 'Y', 0, 'N', '2023-05-22 00:36:51', '2023-05-23 08:05:20', '2023-05-23', 'B', '2023-05-24 09:05:13'),
(799, 'NAFA AULIA', 'PONDOK MELATI INDAH D 17/2 RT 009 RW 005 JATIWARNA', '81315854477', 'HONDA CR-V', 'WRT000792', 'MHRRW1880PJ350537', '-', 32, '2023-05-22', 215, 2000000, 1, 'N', 'N', 0, '151', '0', '0', '0', 'Y', 0, 'N', '2023-05-22 10:48:14', '2023-05-22 10:05:06', '2023-05-22', 'B', '2023-05-24 14:05:51'),
(800, 'DIYAH SETIANINGSIH', 'BUKIT GOLF ARCADIA I BLOK A 7/9', '8121304561', 'TOYOTA INNOVA ZENIX', 'WRT000793', '-', '-', 46, '2023-05-26', 34, 3200000, 1, 'N', 'N', 2100000, '148', '154', '183', '', 'N', 0, 'N', '2023-05-22 11:33:35', '2023-05-24 19:05:16', '2023-05-20', 'B', '0000-00-00 00:00:00'),
(801, 'ANDI NAVARO', 'SIDAMUKTI RT 001 RW 022', '81210106061', 'TOYOTA FORTUNER', 'WRT000794', 'MHFAA8GS2N0783535', '-', 32, '2023-05-23', 216, 2000000, 1, 'N', 'N', 0, '151', '175', '0', '0', 'Y', 0, 'N', '2023-05-22 16:03:32', '2023-05-23 10:05:33', '2023-05-23', 'B', '2023-05-25 10:05:55'),
(802, 'DEWI YUNITA', 'PENGADEGAN SELATAN I RT 002 RW 004', '81918788887', 'HYUNDAI SANTAFE 2.2 AT', 'WRT000795', 'MF3S381HVPJ001262', '-', 41, '2023-05-23', 217, 3000000, 1, 'N', 'N', 0, '150', '0', '0', '0', 'Y', 500000, 'N', '2023-05-22 16:17:48', '2023-05-23 08:05:45', '2023-05-23', 'B', '2023-05-23 17:05:41'),
(803, 'HARJUDI AGUSTAVIANTO SE', '-', '87874322046', 'MAZDA 3 SEDAN', 'WRT000796', 'JM6BP2S7AP1153240', '-', 35, '2023-05-24', 100, 2000000, 1, 'N', 'N', 0, '149', '175', '0', '0', 'Y', 0, 'N', '2023-05-22 17:54:49', '2023-05-24 08:05:57', '2023-05-24', 'T', '2023-05-24 08:05:57'),
(804, 'FAUZI', 'CIBUBUR', '81932115848', 'HONDA BRIO', 'WRT000797', '-', '-', 18, '2023-05-24', 0, 1000000, 1, 'N', 'N', 600000, '148', '183', '', '', 'N', 0, 'N', '2023-05-23 12:43:44', '2023-05-23 12:43:44', '2023-05-24', 'B', '0000-00-00 00:00:00');
INSERT INTO `t_transaksi` (`id`, `nama`, `alamat`, `tlp`, `jns_kendaraan`, `waranti`, `no_rangka`, `no_polisi`, `id_teknisi`, `tgl`, `id_sales`, `diskon`, `admin`, `sts_point`, `sts_klaim`, `total_b`, `tek1`, `tek2`, `tek3`, `tek4`, `sts_book`, `booking`, `sts_hapus`, `tgl_hapus`, `tgl_server`, `tgl_booking`, `status_bayar`, `tgl_lunas`) VALUES
(805, 'WANGSIT BUDISANTOSO', 'JL KERJA BAKTI V NO. 36 RT 008 RW 004', '82111800808', 'HONDA BRIO', 'WRT000798', 'MHRDD1850OJ310014', 'B 1567 SSP', 18, '2023-05-24', 76, 1000000, 1, 'N', 'N', 600000, '183', '175', '', '', 'Y', 0, 'N', '2023-05-23 12:45:33', '2023-05-24 08:05:51', '2023-05-24', 'B', '2023-05-24 12:05:35'),
(806, 'NENI ROSTINI', 'POJOK SALAK RT 04 RW 08 JONGGOL ', '85282330739', 'MITSUBISHI PAJERO SPORT 2.4 L', 'WRT000799', 'MK2KRWPNUNJ009054', 'F 1370 FAO', 20, '2023-05-24', 34, 700000, 1, 'N', 'N', 1700000, '183', '', '', '', 'Y', 0, 'N', '2023-05-24 09:42:38', '2023-05-24 10:05:46', '2023-05-24', 'B', '2023-05-24 15:05:38'),
(807, 'THEONANTA PARDEDE', 'APT GADING NIAS G 16 GC RT 002 RW 003 PEGANGSAAN DUA', '85222342236', 'HYUNDAI STARGAZER', 'WRT000800', 'MF3NE81DTPJ022566', '-', 35, '2023-05-29', 53, 2000000, 1, 'N', 'N', 0, '149', '148', '0', '0', 'Y', 2000000, 'N', '2023-05-24 10:05:57', '2023-05-26 15:05:12', '2023-05-27', 'B', '2023-05-27 15:05:38'),
(808, 'ANDI NAVARO', 'SIDAMUKTI RT 001 RW 022', '81210106061', 'MITSUBISHI XPANDER', 'WRT000801', '-', '-', 31, '2023-05-25', 216, 2000000, 1, 'N', 'N', 2000000, '153', '149', '', '', 'N', 0, 'N', '2023-05-24 14:19:14', '2023-05-25 09:05:17', '2023-05-29', 'B', '0000-00-00 00:00:00'),
(809, 'ASPEN HUTAGALUNG', 'CITRA INDAH BUKIT PINUS Q12 8 RT 02 RW 10 JONGGOL', '81218835674', 'TOYOTA INNOVA ZENIX', 'WRT000802', 'MHFAAAAA5P0007197', 'F 1882 FAV', 32, '2023-05-25', 34, 2000000, 1, 'N', 'N', 0, '150', '175', '0', '0', 'Y', 0, 'N', '2023-05-24 14:20:53', '2023-05-25 09:05:17', '2023-05-25', 'B', '2023-05-26 16:05:58'),
(810, 'ANDERSON SUBRI SE MM', 'PERUMAHAN BINTARO GREEN CLUSTER BLOK D NO 10 RT 003 RW 001', '81294897344', 'MITSUBISHI PAJERO SPORT 2.4 L DAKAR', 'WRT000803', 'MK2KRWPNUPJ003600', '-', 41, '2023-06-01', 217, 3000000, 1, 'N', 'N', 3000000, '153', '150', '', '', 'N', 500000, 'N', '2023-05-24 15:22:23', '2023-05-24 15:22:23', '2023-06-01', 'B', '0000-00-00 00:00:00'),
(811, 'LUKY HENDARSAH', 'PERUM PESONA KAHURIPAN 1 BLOK I 15 / 20 RT 003 RW 018 CIKAHURIPAN', '81388113121', 'HONDA HR-V', 'WRT000804', 'MHRRV3870PJ202716', 'B 1580 TJZ', 31, '2023-05-25', 218, 1750000, 1, 'N', 'N', 0, '151', '153', '0', '0', 'Y', 500000, 'N', '2023-05-25 09:57:15', '2023-05-25 17:05:54', '2023-05-26', 'B', '2023-05-26 16:05:51'),
(812, 'MOHAMA AOUALL', 'JL H BAIN  RT 003 RW 006 KELAPA DUA WETAN CIRACAS', '81319232028', 'HYUNDAI IONIQ 5 SIGNATURE LONG RANGE', 'WRT000805', 'MF3KM81AUPJ005274', '-', 36, '2023-05-29', 129, 2250000, 1, 'N', 'N', 2250000, '153', '151', '', '', 'N', 0, 'N', '2023-05-25 15:19:29', '2023-05-25 14:05:40', '2023-05-29', 'B', '0000-00-00 00:00:00'),
(813, 'MARDANI', 'JL MOCH KAHFI II / II / 51B RT 4 / RW 3', '8567185519', 'MITSUBISHI PAJERO 2.4 L', 'WRT000806', 'MK2KRWPNUPJ003063', 'B 2672 SJI', 20, '2023-05-26', 219, 900000, 1, 'N', 'N', 0, '154', '183', '0', '0', 'Y', 0, 'N', '2023-05-25 16:30:29', '2023-05-27 13:05:18', '2023-05-27', 'B', '2023-05-27 15:05:56'),
(814, 'AGUS MAJUSEN LIM', 'JL KOL POLM THAHER NO 39 RT 009 RW 000 WIJAYA PURA', '82338330888', 'CHERY OMODA 5 Z', 'WRT000807', 'MF7ED21B8PJ000851', '-', 35, '2023-05-27', 220, 2000000, 1, 'N', 'N', 0, '150', '0', '0', '0', 'Y', 2000000, 'N', '2023-05-26 14:12:17', '2023-05-27 10:05:12', '2023-05-27', 'T', '2023-05-27 10:05:12'),
(815, 'Tony', 'xx', '81298304645', 'CHERY OMODA 5', 'WRT000808', '-', '-', 35, '2023-05-27', 221, 2000000, 1, 'N', 'N', 2000000, '153', '151', '', '', 'N', 0, 'Y', '2023-05-27 11:05:17', '2023-05-26 16:49:11', '2023-05-27', 'B', '0000-00-00 00:00:00'),
(816, 'FELICIA AGATHA KARTADINATA', 'KEBON MANGGA RT 003 RW 007 CIPULIR KEBAYORAN LAMA', '81903297666', 'CHERY OMODA 5 RZ', 'WRT000809', 'MF7ED21B8PJ001053', '-', 31, '2023-05-27', 221, 1750000, 1, 'N', 'N', 0, '153', '151', '0', '0', 'Y', 0, 'N', '2023-05-27 10:21:50', '2023-05-27 09:05:25', '2023-05-27', 'T', '2023-05-27 09:05:25'),
(817, 'MIA KUSUMA', 'JL LAKSMANA NO 22 RT 012 RW 004 BAMBU APUS CIPAYUNG', '8119937464', 'CHERY OMODA 5 Z', 'WRT000810', 'MF7ED21B8PJ000739', '-', 31, '2023-05-28', 221, 1750000, 1, 'N', 'N', 1750000, '149', '150', '', '', 'Y', 0, 'N', '2023-05-27 14:34:33', '2023-05-27 15:05:51', '2023-05-28', 'T', '2023-05-27 15:05:51'),
(818, 'AFRIAN SUPROBO', 'Banjaran Village Blok A3 No.9 Street Address Line 2: Jl.Cilangkap Rt.02/05, Cimpaeun, Tapos City: Depok State / Province: Jawa Barat Postal / Zip Code: 16459', '85710430856', 'HONDA BR-V', 'WRT000811', 'MHRDG3880PJ301753', '-', 20, '2023-06-01', 34, 800000, 1, 'N', 'N', 1600000, '154', '183', '', '', 'N', 500000, 'N', '2023-05-27 16:18:51', '2023-05-27 15:05:38', '2023-06-01', 'B', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `t_transport`
--

CREATE TABLE `t_transport` (
  `id_transport` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tgl_transport` date NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `status` enum('N','Y') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `histori_war`
--
ALTER TABLE `histori_war`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_group_users`
--
ALTER TABLE `sys_group_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_menu`
--
ALTER TABLE `sys_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_menu_role`
--
ALTER TABLE `sys_menu_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_sys_menu_role_sys_menu` (`id_menu`),
  ADD KEY `FK_sys_menu_role_sys_users` (`group_id`);

--
-- Indexes for table `sys_system`
--
ALTER TABLE `sys_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_update`
--
ALTER TABLE `sys_update`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_update_minor`
--
ALTER TABLE `sys_update_minor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_users`
--
ALTER TABLE `sys_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_sys_users_sys_group_users` (`id_group`);

--
-- Indexes for table `t_absen`
--
ALTER TABLE `t_absen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_agama`
--
ALTER TABLE `t_agama`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_bayar_gaji`
--
ALTER TABLE `t_bayar_gaji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_booking`
--
ALTER TABLE `t_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_cabang`
--
ALTER TABLE `t_cabang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_gaji`
--
ALTER TABLE `t_gaji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_garansi`
--
ALTER TABLE `t_garansi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_histori_gaji`
--
ALTER TABLE `t_histori_gaji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_history`
--
ALTER TABLE `t_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_jabatan`
--
ALTER TABLE `t_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `t_jht`
--
ALTER TABLE `t_jht`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_lembur`
--
ALTER TABLE `t_lembur`
  ADD PRIMARY KEY (`id_lembur`);

--
-- Indexes for table `t_paket`
--
ALTER TABLE `t_paket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_pengajuan`
--
ALTER TABLE `t_pengajuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_pengeluaran`
--
ALTER TABLE `t_pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_peng_histori`
--
ALTER TABLE `t_peng_histori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_poin`
--
ALTER TABLE `t_poin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_presensi`
--
ALTER TABLE `t_presensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_teknisi`
--
ALTER TABLE `t_teknisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_tipe`
--
ALTER TABLE `t_tipe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_transaksi`
--
ALTER TABLE `t_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_transport`
--
ALTER TABLE `t_transport`
  ADD PRIMARY KEY (`id_transport`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `histori_war`
--
ALTER TABLE `histori_war`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sys_group_users`
--
ALTER TABLE `sys_group_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `sys_menu_role`
--
ALTER TABLE `sys_menu_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT for table `sys_system`
--
ALTER TABLE `sys_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sys_update`
--
ALTER TABLE `sys_update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sys_update_minor`
--
ALTER TABLE `sys_update_minor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sys_users`
--
ALTER TABLE `sys_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `t_absen`
--
ALTER TABLE `t_absen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_agama`
--
ALTER TABLE `t_agama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_bayar_gaji`
--
ALTER TABLE `t_bayar_gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_booking`
--
ALTER TABLE `t_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_cabang`
--
ALTER TABLE `t_cabang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_gaji`
--
ALTER TABLE `t_gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `t_garansi`
--
ALTER TABLE `t_garansi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=819;

--
-- AUTO_INCREMENT for table `t_histori_gaji`
--
ALTER TABLE `t_histori_gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `t_history`
--
ALTER TABLE `t_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `t_jabatan`
--
ALTER TABLE `t_jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_jht`
--
ALTER TABLE `t_jht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_lembur`
--
ALTER TABLE `t_lembur`
  MODIFY `id_lembur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_paket`
--
ALTER TABLE `t_paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `t_pengajuan`
--
ALTER TABLE `t_pengajuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_pengeluaran`
--
ALTER TABLE `t_pengeluaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `t_peng_histori`
--
ALTER TABLE `t_peng_histori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `t_poin`
--
ALTER TABLE `t_poin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_presensi`
--
ALTER TABLE `t_presensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=728;

--
-- AUTO_INCREMENT for table `t_teknisi`
--
ALTER TABLE `t_teknisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_tipe`
--
ALTER TABLE `t_tipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `t_transaksi`
--
ALTER TABLE `t_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=819;

--
-- AUTO_INCREMENT for table `t_transport`
--
ALTER TABLE `t_transport`
  MODIFY `id_transport` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
