-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2022 at 02:07 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtugas7`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `inputDivisi` (IN `iddivisi` VARCHAR(6), IN `nama` VARCHAR(30), IN `nip_pegawai` VARCHAR(9))   BEGIN
    INSERT INTO divisi VALUES (iddivisi,nama,nip_pegawai);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inputGaji` (IN `Gapok` INT, IN `tunjangan` INT, IN `nip_pegawai` INT)   BEGIN
    INSERT INTO gaji VALUES (nextval(id_gaji),Gapok,tunjangan,nip_pegawai);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inputJabatan` (IN `id_jabatan` VARCHAR(6), IN `nama_jabatan` VARCHAR(32), IN `nip_pegawai` VARCHAR(9))   BEGIN
    INSERT INTO jabatan VALUES (id_jabatan,nama_jabatan,nip_pegawai);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inputPegawai` (IN `nama` VARCHAR(32), IN `tempat_lahir` VARCHAR(50), IN `tgl_lahir` DATE, IN `jenis_kelamin` ENUM('L','P'), IN `alamat` VARCHAR(50), IN `no_telp` VARCHAR(13), IN `tgl_masuk` DATE)   BEGIN
    INSERT INTO pegawai VALUES (nextval(id_peg),nama,tempat_lahir,tgl_lahir,jenis_kelamin,alamat,no_telp,tgl_masuk);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showGaji` ()   BEGIN
	SELECT * FROM gaji;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showPegawai` ()   BEGIN
	SELECT *  FROM pegawai;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `totalGaji` (IN `Gapok` INT, IN `tunjangan` INT, OUT `total` INT)   BEGIN
 SELECT Gapok + Tunjangan
 INTO total
 FROM gaji;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `iddivisi` varchar(6) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `nip_pegawai` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`iddivisi`, `nama`, `nip_pegawai`) VALUES
('1', 'IT Dev', '1');

-- --------------------------------------------------------

--
-- Table structure for table `gaji`
--

CREATE TABLE `gaji` (
  `no_slip` int(11) NOT NULL,
  `Gapok` int(11) DEFAULT NULL,
  `tunjungan` int(11) DEFAULT NULL,
  `nip_pegawai` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gaji`
--

INSERT INTO `gaji` (`no_slip`, `Gapok`, `tunjungan`, `nip_pegawai`) VALUES
(1, 5000000, 500000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `id_divisi`
--

CREATE TABLE `id_divisi` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Dumping data for table `id_divisi`
--

INSERT INTO `id_divisi` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(1, 1, 9223372036854775806, 1, 1, 1000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `id_gaji`
--

CREATE TABLE `id_gaji` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Dumping data for table `id_gaji`
--

INSERT INTO `id_gaji` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(1, 1, 9223372036854775806, 1, 1, 1000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `id_jabatan`
--

CREATE TABLE `id_jabatan` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Dumping data for table `id_jabatan`
--

INSERT INTO `id_jabatan` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(1, 1, 9223372036854775806, 1, 1, 1000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `id_peg`
--

CREATE TABLE `id_peg` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Dumping data for table `id_peg`
--

INSERT INTO `id_peg` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(1001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` varchar(6) NOT NULL,
  `nama_jabatan` varchar(32) DEFAULT NULL,
  `nip_pegawai` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`, `nip_pegawai`) VALUES
('1', 'Kepala Divisi', '1');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nip` varchar(9) NOT NULL,
  `nama` varchar(32) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nip`, `nama`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `alamat`, `no_telp`, `tgl_masuk`) VALUES
('1', 'Fahmi', 'Sukabumi', '2001-02-27', 'L', 'Surabaya', '0895405491234', '2020-02-02');

-- --------------------------------------------------------

--
-- Stand-in structure for view `totgaji`
-- (See below for the actual view)
--
CREATE TABLE `totgaji` (
`nip` varchar(9)
,`nama` varchar(32)
,`posisi` varchar(32)
,`departemen` varchar(30)
,`Gapok` int(11)
,`tunjungan` int(11)
,`totalGaji` bigint(12)
);

-- --------------------------------------------------------

--
-- Structure for view `totgaji`
--
DROP TABLE IF EXISTS `totgaji`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `totgaji`  AS SELECT `p`.`nip` AS `nip`, `p`.`nama` AS `nama`, `j`.`nama_jabatan` AS `posisi`, `d`.`nama` AS `departemen`, `g`.`Gapok` AS `Gapok`, `g`.`tunjungan` AS `tunjungan`, `g`.`Gapok`+ `g`.`tunjungan` AS `totalGaji` FROM (((`pegawai` `p` join `gaji` `g` on(`p`.`nip` = `g`.`nip_pegawai`)) join `divisi` `d` on(`p`.`nip` = `d`.`nip_pegawai`)) join `jabatan` `j` on(`p`.`nip` = `j`.`nip_pegawai`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD KEY `nip_pegawai` (`nip_pegawai`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`no_slip`),
  ADD KEY `nip_pegawai` (`nip_pegawai`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`),
  ADD KEY `nip_pegawai` (`nip_pegawai`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `nama` (`nama`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gaji`
--
ALTER TABLE `gaji`
  MODIFY `no_slip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `divisi`
--
ALTER TABLE `divisi`
  ADD CONSTRAINT `divisi_ibfk_1` FOREIGN KEY (`nip_pegawai`) REFERENCES `pegawai` (`nip`);

--
-- Constraints for table `gaji`
--
ALTER TABLE `gaji`
  ADD CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`nip_pegawai`) REFERENCES `pegawai` (`nip`);

--
-- Constraints for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD CONSTRAINT `jabatan_ibfk_1` FOREIGN KEY (`nip_pegawai`) REFERENCES `pegawai` (`nip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
