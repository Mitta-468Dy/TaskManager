-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2020-10-02 08:45:54
-- サーバのバージョン： 10.4.14-MariaDB
-- PHP のバージョン: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `taskdata2`
--
CREATE DATABASE IF NOT EXISTS `taskdata2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `taskdata2`;

-- --------------------------------------------------------

--
-- テーブルの構造 `group`
--
-- 作成日時： 2020-10-02 02:25:08
-- 最終更新： 2020-10-02 02:26:55
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `ID` int(5) NOT NULL,
  `NAME` text NOT NULL,
  `PASSWORD` text NOT NULL COMMENT 'プログラム側で値のルールを設定'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `group`
--

INSERT INTO `group` (`ID`, `NAME`, `PASSWORD`) VALUES
(1, 'グループA', 'grp1Pass4'),
(2, 'グループB', 'grp2Pass7'),
(3, 'グループC', 'grp3Pass6');

-- --------------------------------------------------------

--
-- テーブルの構造 `member`
--
-- 作成日時： 2020-10-02 03:49:01
-- 最終更新： 2020-10-02 04:43:37
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `groupID` int(5) NOT NULL,
  `id` varchar(7) NOT NULL,
  `name` text NOT NULL,
  `pass` varchar(50) NOT NULL,
  `Supplement` text DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `member`
--

INSERT INTO `member` (`groupID`, `id`, `name`, `pass`, `Supplement`) VALUES
(1, 'U001001', 'ZE', 'g1u1pass', 'リーダー'),
(1, 'U001002', 'RM', 'g1u2pass', '音楽'),
(1, 'U001003', 'NL', 'g1u3pass', '音楽'),
(1, 'U001004', 'RH', 'g1u4pass', '音楽'),
(1, 'U001005', 'CF', 'g1u5pass', '音楽'),
(1, 'U001006', 'RN', 'g1u6pass', '音楽'),
(1, 'U001007', 'SR', 'g1u7pass', '音楽'),
(1, 'U001008', 'KR', 'g1u8pass', '音楽'),
(1, 'U001009', 'IW', 'g1u9pass', '音楽'),
(1, 'U001010', 'KY', 'g1uApass', '音楽'),
(1, 'U001011', 'GB', 'g1uBpass', '音楽'),
(1, 'U001012', 'SG', 'g1uCpass', '画像'),
(1, 'U001013', 'DE', 'g1uDpass', '動画'),
(2, 'U002001', 'CS', 'g2u1pass', NULL),
(2, 'U002002', 'KU', 'g2u2pass', NULL),
(2, 'U002003', 'NN', 'g2u3pass', NULL),
(2, 'U002004', 'NB', 'g2u4pass', NULL),
(2, 'U002005', 'TL', 'g2u5pass', NULL),
(2, 'U002006', 'T1', 'g2u6pass', NULL),
(2, 'U002007', 'ZK', 'g2u7pass', NULL),
(3, 'U003001', 'RS', 'g3u1pass', '音楽'),
(3, 'U003002', 'YK', 'g3u2pass', '音楽'),
(3, 'U003003', 'AQ', 'g3u3pass', '音楽'),
(3, 'U003004', 'MJ', 'g3u4pass', '音楽'),
(3, 'U003005', 'PE', 'g3u5pass', '音楽'),
(3, 'U003006', 'DR', 'g3u6pass', '音楽'),
(3, 'U003007', 'SM', 'g3u7pass', '音楽');

-- --------------------------------------------------------

--
-- テーブルの構造 `task`
--
-- 作成日時： 2020-10-02 05:38:42
-- 最終更新： 2020-10-02 06:40:19
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `groupID` int(5) NOT NULL,
  `memberID` varchar(7) NOT NULL,
  `typeID` varchar(7) NOT NULL,
  `id` int(7) NOT NULL,
  `Overview` text NOT NULL,
  `Detail` text NOT NULL,
  `Start` date NOT NULL DEFAULT current_timestamp(),
  `Deadline` date DEFAULT current_timestamp(),
  `Progress` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `task`
--

INSERT INTO `task` (`groupID`, `memberID`, `typeID`, `id`, `Overview`, `Detail`, `Start`, `Deadline`, `Progress`) VALUES
(1, 'U001001', 'T001002', 1, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(1, 'U001002', 'T001002', 2, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(1, 'U001003', 'T001002', 3, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(1, 'U001004', 'T001002', 4, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(1, 'U001005', 'T001002', 5, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(1, 'U001006', 'T001002', 6, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(1, 'U001007', 'T001002', 7, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(1, 'U001008', 'T001002', 8, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(1, 'U001009', 'T001002', 9, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(1, 'U001010', 'T001002', 10, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(1, 'U001011', 'T001002', 11, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(2, 'U002001', 'T002002', 12, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(2, 'U002002', 'T002002', 13, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(2, 'U002003', 'T002002', 14, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(2, 'U002004', 'T002002', 15, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(2, 'U002005', 'T002002', 16, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(2, 'U002006', 'T002002', 17, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(2, 'U002007', 'T002002', 18, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(3, 'U003001', 'T003002', 19, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(3, 'U003002', 'T003002', 20, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(3, 'U003003', 'T003002', 21, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(3, 'U003004', 'T003002', 22, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(3, 'U003005', 'T003002', 23, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(3, 'U003006', 'T003002', 24, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(3, 'U003007', 'T003002', 25, '楽曲納品', '曲名---', '2020-10-02', '2020-11-04', 0),
(1, 'U001001', 'T001001', 26, '納金', '\\20,000', '2020-10-02', '2020-10-19', 0),
(2, 'U002001', 'T002001', 27, '納金', '\\15,000', '2020-10-02', '2020-10-19', 100),
(3, 'U003001', 'T003001', 28, '納金', '\\15,000', '2020-10-02', '2020-10-19', 100),
(1, 'U001001', 'T001004', 29, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U001002', 'T001004', 30, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U001003', 'T001004', 31, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U001004', 'T001004', 32, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U001005', 'T001004', 33, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U001006', 'T001004', 34, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U001007', 'T001004', 35, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U001008', 'T001004', 36, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U001009', 'T001004', 37, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U001010', 'T001004', 38, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U001011', 'T001004', 39, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(2, 'U002001', 'T002004', 40, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(2, 'U002002', 'T002004', 41, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(2, 'U002003', 'T002004', 42, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(2, 'U002004', 'T002004', 43, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(2, 'U002005', 'T002004', 44, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(2, 'U002006', 'T002004', 45, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(2, 'U002007', 'T002004', 46, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(3, 'U003001', 'T003004', 47, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(3, 'U003002', 'T003004', 48, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(3, 'U003003', 'T003004', 49, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(3, 'U003004', 'T003004', 50, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(3, 'U003005', 'T003004', 51, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(3, 'U003006', 'T003004', 52, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(3, 'U003007', 'T003004', 53, 'ロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U001001', 'T001003', 54, 'サークルロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U002001', 'T002003', 55, 'サークルロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U003001', 'T003003', 56, 'サークルロゴ納品', '2000x2000', '2020-10-02', '2020-11-01', 0),
(1, 'U001001', 'T001005', 57, '動画納品', '各曲10秒ずつ', '2020-10-02', '2020-11-01', 0),
(2, 'U002001', 'T002005', 58, '動画納品', '各曲10秒ずつ', '2020-10-02', '2020-11-01', 0),
(3, 'U003001', 'T003005', 59, '動画納品', '各曲10秒ずつ', '2020-10-02', '2020-11-01', 0),
(1, 'U001013', 'T001007', 60, '動画制作', '動画を制作する', '2020-10-02', '2020-11-15', 0),
(1, 'U001001', 'T001006', 61, 'リリース', '動画などを公開する', '2020-12-31', NULL, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `type`
--
-- 作成日時： 2020-10-02 02:37:13
-- 最終更新： 2020-10-02 06:31:45
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `groupID` int(5) NOT NULL,
  `id` varchar(7) NOT NULL,
  `name` text NOT NULL,
  `abv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `type`
--

INSERT INTO `type` (`groupID`, `id`, `name`, `abv`) VALUES
(1, 'T001001', '納金', '納金'),
(1, 'T001002', '納品', '納品'),
(1, 'T001003', 'サークルのロゴ納品', 'Sロゴ納'),
(1, 'T001004', 'アーティストロゴの納品', 'Aロゴ納'),
(1, 'T001005', '動画納品', '動画納'),
(1, 'T001006', 'リリース', 'リリース'),
(1, 'T001007', '動画制作', '制作'),
(2, 'T002001', '納金', '納金'),
(2, 'T002002', '納品', '納品'),
(2, 'T002003', 'サークルのロゴ納品', 'Sロゴ納'),
(2, 'T002004', 'アーティストロゴの納品', 'Aロゴ納'),
(2, 'T002005', '動画納品', '動画納'),
(2, 'T002006', '動画制作', '制作'),
(3, 'T003001', '納金', '納金'),
(3, 'T003002', '納品', '納品'),
(3, 'T003003', 'サークルのロゴ納品', 'Sロゴ納'),
(3, 'T003004', 'アーティストロゴの納品', 'Aロゴ納'),
(3, 'T003005', '動画納品', '動画納'),
(3, 'T003006', '動画制作', '制作');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`ID`);

--
-- テーブルのインデックス `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_membgrp` (`groupID`);

--
-- テーブルのインデックス `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_taskgrp` (`groupID`),
  ADD KEY `FK_taskmemb` (`memberID`),
  ADD KEY `FK_tasktype` (`typeID`);

--
-- テーブルのインデックス `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_typegrp` (`groupID`);

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `FK_membgrp` FOREIGN KEY (`groupID`) REFERENCES `group` (`ID`);

--
-- テーブルの制約 `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FK_taskgrp` FOREIGN KEY (`groupID`) REFERENCES `group` (`ID`),
  ADD CONSTRAINT `FK_taskmemb` FOREIGN KEY (`memberID`) REFERENCES `member` (`id`),
  ADD CONSTRAINT `FK_tasktype` FOREIGN KEY (`typeID`) REFERENCES `type` (`id`);

--
-- テーブルの制約 `type`
--
ALTER TABLE `type`
  ADD CONSTRAINT `FK_typegrp` FOREIGN KEY (`groupID`) REFERENCES `group` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;