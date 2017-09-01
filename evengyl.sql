-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 01 Septembre 2017 à 14:23
-- Version du serveur :  10.1.13-MariaDB
-- Version de PHP :  5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `evengyl`
--
CREATE DATABASE IF NOT EXISTS `evengyl` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `evengyl`;

-- --------------------------------------------------------

--
-- Structure de la table `eau`
--

DROP TABLE IF EXISTS `eau`;
CREATE TABLE `eau` (
  `id` int(11) NOT NULL,
  `date_relever` date NOT NULL,
  `relever` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `eau`
--

TRUNCATE TABLE `eau`;
--
-- Contenu de la table `eau`
--

INSERT INTO `eau` (`id`, `date_relever`, `relever`) VALUES
(1, '2017-02-21', 0),
(7, '2017-03-28', 2.8),
(8, '2017-04-05', 3.37),
(11, '2017-04-11', 10);

-- --------------------------------------------------------

--
-- Structure de la table `electricite_jour`
--

DROP TABLE IF EXISTS `electricite_jour`;
CREATE TABLE `electricite_jour` (
  `id` int(11) NOT NULL,
  `date_relever` date NOT NULL,
  `relever` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `electricite_jour`
--

TRUNCATE TABLE `electricite_jour`;
--
-- Contenu de la table `electricite_jour`
--

INSERT INTO `electricite_jour` (`id`, `date_relever`, `relever`) VALUES
(1, '2017-02-21', 0),
(2, '2017-03-28', 49.9),
(3, '2017-04-05', 58.1),
(5, '2017-04-11', 60);

-- --------------------------------------------------------

--
-- Structure de la table `electricite_nuit`
--

DROP TABLE IF EXISTS `electricite_nuit`;
CREATE TABLE `electricite_nuit` (
  `id` int(11) NOT NULL,
  `date_relever` date NOT NULL,
  `relever` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `electricite_nuit`
--

TRUNCATE TABLE `electricite_nuit`;
--
-- Contenu de la table `electricite_nuit`
--

INSERT INTO `electricite_nuit` (`id`, `date_relever`, `relever`) VALUES
(1, '2017-02-21', 0),
(2, '2017-03-28', 50.9),
(3, '2017-04-05', 62.2),
(5, '2017-04-11', 65);

-- --------------------------------------------------------

--
-- Structure de la table `ft_category`
--

DROP TABLE IF EXISTS `ft_category`;
CREATE TABLE `ft_category` (
  `id` int(11) NOT NULL,
  `visible` int(11) NOT NULL,
  `type_categ` varchar(3) NOT NULL,
  `sub_categ` int(11) NOT NULL,
  `parent_categ_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `ft_category`
--

TRUNCATE TABLE `ft_category`;
--
-- Contenu de la table `ft_category`
--

INSERT INTO `ft_category` (`id`, `visible`, `type_categ`, `sub_categ`, `parent_categ_id`, `name`, `img`, `url`) VALUES
(1, 0, 'FE', 0, 0, 'volume extraction', 'vues/images/categ/volume_extraction.png', '?categ=volume_extraction'),
(2, 0, 'FE', 0, 0, 'tip extraction units', 'vues/images/categ/tip_extraction_units.PNG', '?categ=tip_extraction_units'),
(3, 0, 'FE', 0, 0, 'Extraction Arms', 'vues/images/categ/easy_click_extraction_arms.PNG', '?categ=easy_click_extraction_arms'),
(4, 0, 'FE', 0, 0, 'Pipe Systems 75', 'vues/images/categ/pipe_systems.PNG', '?categ=pipe_systems'),
(6, 0, 'FE', 0, 0, 'accessories filters', 'vues/images/categ/accessories_filters.PNG', '?categ=accessories_filters'),
(7, 0, 'FE', 0, 0, 'Attachment FE to soldering', 'vues/images/categ/tip_extraction_accessories.jpg', '?categ=tip_extraction_accessories'),
(8, 0, 'FE', 0, 0, 'extraction units accessories', 'vues/images/categ/extraction_units_accessories.PNG', '?categ=extraction_units_accessories'),
(9, 1, 'FE', 0, 0, 'extraction hood', 'vues/images/categ/extraction_hood.PNG', '?categ=extraction_hood'),
(10, 0, 'FE', 0, 0, 'Easy Click 60', 'vues/images/categ/easy_click_60.jpg', ''),
(11, 0, 'FE', 0, 0, 'Clean Bench Concept', 'vues/images/categ/clean_bench_concept.jpg', '?categ=clean_bench_concept'),
(12, 1, 'FE', 0, 0, 'acryl exhaust cabinets', 'vues/images/categ/acryl_exhaust_cabinets.PNG', '?categ=acryl_exhaust_cabinets'),
(13, 0, 'FE', 0, 0, 'other accessories', 'vues/images/categ/volume_extraction_accessories.PNG', ''),
(14, 0, 'LL', 0, 0, 'Laser Line extraction', 'vues/images/categ/laser_line.PNG', '?categ=laser_line');

-- --------------------------------------------------------

--
-- Structure de la table `ft_product`
--

DROP TABLE IF EXISTS `ft_product`;
CREATE TABLE `ft_product` (
  `id` int(11) NOT NULL,
  `id_categ` int(11) NOT NULL,
  `id_pa_1` varchar(20) NOT NULL,
  `id_pa_2` varchar(20) NOT NULL,
  `id_pa_3` varchar(20) NOT NULL,
  `id_pa_4` varchar(20) NOT NULL,
  `id_pa_5` varchar(20) NOT NULL,
  `id_pa_6` varchar(20) NOT NULL,
  `image` varchar(255) NOT NULL,
  `kit` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `ma_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `ft_product`
--

TRUNCATE TABLE `ft_product`;
--
-- Contenu de la table `ft_product`
--

INSERT INTO `ft_product` (`id`, `id_categ`, `id_pa_1`, `id_pa_2`, `id_pa_3`, `id_pa_4`, `id_pa_5`, `id_pa_6`, `image`, `kit`, `name`, `code`, `ma_code`) VALUES
(1, 1, '810 87627 03', '810 87627 01', '810 87627 63', '810 36571', '0', '0', '810 36506	', 1, 'Weller - Zero Smog 2, ex-WFE 2ES', 'T0053650699', '810 36506'),
(2, 1, '806 00310', '806 00300', '810 87627 63', '810 36571', '0', '0', '806 00280', 0, 'Weller - MG 130', '130-1000-ESD', '806 00280'),
(3, 1, '810 87627 70', '810 36571', '810 36572', '810 87627 63', '810 87627 57', '810 87627 69', '810 36588	', 0, 'Weller - MG 100S (WFE 2X)', '100-1000-ESD', '810 36588'),
(4, 1, '806 00410', '806 00370', '806 00400', '810 87627 63', '810 36571', '0', '806 00350', 0, 'Weller - MG 140', '145-1000-ESD', '806 00350'),
(5, 1, '810 87359 36', '810 36579', '810 36571', '810 87359 37', '810 87354 27', '810 87627 67', '810 36606	', 0, 'Weller - Zero Smog 4V', 'T0053660699', '810 36606'),
(6, 1, '810 87358 38', '810 87358 36', '810 87627 67', '810 36571', '810 36579', '806 00400', '810 36666	', 0, 'Weller - Zero Smog 6V', 'T0053666699', '810 36666'),
(7, 2, '810 36410', '810 36407', '810 36421', '0', '0', '0', '806 00260	', 0, 'Weller - FT 12', '112-0000-ESD', '806 00260'),
(8, 2, '810 36410', '810 36421', '0', '0', '0', '0', '810 36386	', 0, 'Weller - WFE-P / WFE-2P', 'T0053638699', '810 36386'),
(9, 2, '810 87358 36', '810 87627 67', '810 87627 24', '810 87358 38', '810 31191', '0', '810 36706	', 0, 'Weller - Zero Smog 20 T', 'T0053670699', '810 36706'),
(10, 3, '810 36588', '810 36606', '810 36573', '810 36575', '810 36576', '810 36574', '810 36571', 0, 'Kit 1WF funnel Easy Click 60', 'T0053657199', '810 36571'),
(11, 3, '810 36576', '810 36575', '810 36588', '810 36606', '0', '0', '810 36572', 0, 'Easy Click 60 Kit 1WF sloped nozzle', 'T0053657299', '810 36572'),
(12, 3, '810 36577', '810 36578', '810 36576', '810 36588', '810 36606', '0', '810 36579', 0, ' Easy Click 60 Kit 1S WF Nozzle', 'T0053657999', '810 36579'),
(13, 3, '810 36573', '810 36578', '810 36576', '810 36588', '810 36606', '0', '810 87627 63', 0, 'Easy Click 60 Kit 1S WF funnel', 'T0058762763', '810 87627 63'),
(14, 4, '810 87358 70', '810 87358 69', '810 87358 71', '810 87358 55', '810 87358 63', '0', '810 87358 70', 0, 'Pipe 2 M for System 75', 'T0058735870', '810 87358 70'),
(15, 4, '810 87358 69', '810 87358 70', '810 87358 71', '810 87358 55', '810 87358 63', '0', '810 87358 69', 0, 'Right angle pipe 90°', 'T0058735869', '810 87358 69'),
(16, 4, '810 87358 71', '810 87358 69', '810 87358 70', '810 87358 55', '810 87358 63', '0', '810 87358 71', 0, 'T-piece 2x 90°', 'T0058735871', '810 87358 71'),
(17, 4, '810 87358 55', '810 87358 69', '810 87358 70', '810 87358 71', '810 87358 63', '0', '810 87358 55', 0, 'End seal System 75', 'T0058735855', '810 87358 55'),
(18, 4, '810 87358 64', '810 87358 69', '810 87358 70', '810 87358 71', '810 87358 55', '810 87358 63', '810 87358 64', 0, 'Pipe clamps System 75', 'T0058735864', '810 87358 64'),
(19, 4, '810 87358 63', '810 87358 69', '810 87358 70', '810 87358 71', '810 87358 55', '0', '810 87358 63', 0, 'Adapter Sytem 75mm to System 50mm', 'T0058735863', '810 87358 63'),
(20, 6, '810 87357 57', '0', '0', '0', '0', '0', '810 87357 57', 0, 'Compressed air cleaning filter for WFE / WFE P', 'T0058735757', '810 87357 57'),
(21, 6, '810 36506', '810 87627 03', '0', '0', '0', '0', '810 87627 03', 0, 'Fine dust filter M5 for WFE 2ES / CS', 'T0058762703', '810 87627 03'),
(22, 6, '810 36506', '810 87627 01', '0', '0', '0', '0', '810 87627 01', 0, 'Filter set E12 for WFE 2ES / WFE 2CS', 'T0058762701', '810 87627 01'),
(23, 6, '810 36410', '810 36407', '806 00260', '0', '0', '0', '810 36407', 0, 'Compact filter - WFE / WFE P', 'T0053640799', '810 36407'),
(24, 6, '810 36410', '810 36407', '806 00260', '0', '0', '0', '810 36410', 0, 'Compact filter - WFE / WFE P', 'T0053641099', '810 36410'),
(25, 6, '810 36421', '806 00260', '0', '0', '0', '0', '810 36421', 0, 'Fine dust filter F7 for WFE / WFE P', 'T0053642199', '810 36421'),
(26, 6, '810 36590', '810 36588', '0', '0', '0', '0', '810 36590', 0, 'Compact filter for WFE 2X', 'T0053659099', '810 36590'),
(27, 6, '810 87627 57', '810 87627 58', '810 36588', '0', '0', '0', '810 87627 57', 0, 'Pre-filter box for WFE 2X', 'PF1000', '810 87627 57'),
(28, 6, '810 87358 37', '0', '0', '0', '0', '0', '810 87358 37', 0, 'Fine dust filter M5 for WFE 20D / WFE 4S', 'T0058735837', '810 87358 37'),
(29, 6, '810 87358 36', '0', '0', '0', '0', '0', '810 87358 36', 0, 'Fine dust filter F7 for WFE 20D / WFE 4S', 'T0058735836', '810 87358 36'),
(30, 6, '810 87358 38', '0', '0', '0', '0', '0', '810 87358 38', 0, 'Compact filter for WFE 20D / WFE 4S', 'T0058735838', '810 87358 38'),
(31, 6, '810 87359 37', '810 36606', '810 36573', '0', '0', '0', '810 87359 37', 0, 'Fine dust filter M5 for WFE 2S / Zero Smog 4V', 'T0058735937', '810 87359 37'),
(32, 6, '810 36606', '810 87359 38', '0', '0', '0', '0', '810 87359 38', 0, 'Fine dust filter F7 for WFE 2S / Zero Smog 4V', 'T0058735938', '810 87359 38'),
(33, 6, '810 36606', '810 87359 36', '0', '0', '0', '0', '810 87359 36', 0, 'Compact filter for WFE 2S / Zero Smog 4V', 'T0058735936', '810 87359 36'),
(35, 6, '810 36606', '810 87358 95', '0', '0', '0', '0', '810 87358 95', 0, 'Wide band gas filter for WFE 2S / Zero Smog 4V', 'T0058735895', '810 87358 95'),
(36, 6, '810 87358 60', '0', '0', '0', '0', '0', '810 87358 60', 0, 'Pocket filter F7 for WFE 2S / 4S, ZS 4V', 'T0058735860', '810 87358 60'),
(37, 6, '810 87359 24', '0', '0', '0', '0', '0', '810 87359 24', 0, 'Filterbag for sticky residues', 'T0058735924', '810 87359 24'),
(38, 7, '810 29186', '810 29185', '810 13125', '0', '0', '0', '810 29186', 0, 'FE adapter with tube 6 mm for WSP 80 - WP 80 - MLR 21 - WMP', 'T0052918699', '810 29186'),
(39, 7, '810 29185', '810 29186', '810 13125', '0', '0', '0', '810 29185', 0, 'FE adapter FE + tuyau 4,5 mm for WSP 80 - WP 80 - MLR 21 - WMP', 'T0052918599', '810 29185'),
(40, 7, '810 13125', '810 29185', '810 29186', '0', '0', '0', '810 13125', 0, 'FE attachment for DS 22 - DS 80 - DSX 80', 'T0051312599', '810 13125'),
(41, 7, '810 28126', '810 29167', '810 25125', '0', '0', '0', '810 29167', 0, 'FE adapter Kit for WSP80', 'T0052916799', '810 29167'),
(42, 7, '810 28126', '810 28125', '0', '0', '0', '0', '810 28126', 0, 'FE adapter Kit for WSF80D5/8', 'T0052812699', '810 28126'),
(43, 7, '810 25125', '810 25126', '0', '0', '0', '810 29214', '810 25125', 0, 'FE adapter Kit for LR 21/TCP S', 'T0052512599', '810 25125'),
(44, 7, '810 29214', '810 25125', '810 25126', '0', '0', '0', '810 29214', 0, 'FE WP 65 and WP 120 adapters', 'T0052921499', '810 29214'),
(45, 8, '810 31191', '810 36606', '810 87627 24', '810 87647 26', '810 36593', '0', '810 87359 09', 0, 'Remote control for WFE 2S, WFE 4S, Zero Smog 4V And LL150', 'T0058735909', '810 87359 09'),
(46, 8, '806 00280', '810 36588', '806 00350', '810 87627 24', '810 87647 26', '0', '810 36593', 0, 'Remote Control for WFE 2X', '700-3057', '810 36593'),
(47, 8, '810 31191', '810 87359 09', '0', '0', '0', '0', '810 31191', 0, 'RS 232 interface cable', 'T0053119199', '810 31191'),
(48, 8, '810 87627 46', '0', '0', '0', '0', '0', '810 87627 46', 0, 'WFV 60 A, Auto Valve', 'T0058762746', '810 87627 46'),
(49, 8, '810 87627 24', '810 31191', '810 87647 26', '0', '0', '0', '810 87627 24', 0, 'WX Adapter for Remote control', 'T0058762724', '810 87627 24'),
(50, 8, '810 87627 24', '810 87647 26', '810 36593', '810 87359 09', '0', '0', '810 87647 26', 0, 'WX HUB Activate Zero Smog', 'T0058764726', '810 87647 26'),
(51, 10, '810 87627 70', '806 01230', '810 36606', '810 36571', '0', '0', '810 87627 74', 0, 'End Clap', 'T0058762774', '810 87627 74'),
(52, 10, '806 01230', '810 36579', '810 36606', '810 36571', '810 87627 70', '810 36576', '810 87354 27', 0, 'Extension Hose 1M', '700-3040-ESD', '810 87354 27'),
(53, 10, '810 36579', '810 87627 50', '810 36606', '0', '810 36571', '810 87627 70', '810 36576', 0, 'Extension Hose 3M', '700-3051-ESD', '810 36576'),
(54, 10, '810 36579', '810 87627 50', '810 36606', '0', '810 36576', '810 87627 70', '810 87627 56', 0, 'Extension Hose 5M', '700-3053-ESD', '810 87627 56'),
(55, 10, '810 36579', '810 87627 50', '810 36606', '0', '810 36576', '810 87627 70', '810 87627 72', 0, 'Female adapter', 'T0058762772', '810 87627 72'),
(56, 10, '810 36579', '810 36606', '0', '0', '810 36576', '810 87627 70', '810 87627 50', 0, 'Adapter 40/60', 'T0058762750', '810 87627 50'),
(57, 10, '0', '0', '810 36598', '810 87627 55', '810 36577', '810 87627 66', '810 36574', 0, 'WFV stop valve', 'T0053657499', '810 36574'),
(58, 10, '0', '0', '810 36598', '810 87627 55', '810 36577', '810 36574', '810 87627 66', 0, '60 T-piece', 'T0058762766', '810 87627 66'),
(59, 10, '0', '0', '810 36598', '810 87627 55', '810 87627 66', '810 36574', '810 36577', 0, 'Sloped nozzle', 'FT-NL', '810 36577'),
(60, 10, '0', '0', '810 36598', '810 36577', '810 87627 66', '810 36574', '810 87627 55', 0, '60 male adapter', 'T0058762755', '810 87627 55'),
(61, 10, '0', '810 36598', '810 87627 55', '810 36577', '810 87627 66', '810 36574', '810 36598', 0, 'joint extraction arm', 'T0053659899', '810 36598'),
(62, 10, '810 87627 69', '810 87627 71', '806 01210', '806 00980', '810 36573', '0', '810 87627 67', 0, 'hose connector, straight', 'T0058762767', '810 87627 67'),
(63, 10, '810 87627 67', '810 87627 71', '806 01210', '806 00980', '810 36573', '0', '810 87627 69', 0, 'hose connector, angle 90°', 'T0058762769', '810 87627 69'),
(64, 10, '810 87627 67', '810 87627 69', '806 01210', '806 00980', '810 36573', '0', '810 87627 71', 0, ' Adapter 75mm for Easy Click 60', 'T0058762771', '810 87627 71'),
(65, 10, '810 87627 67', '810 87627 69', '810 87627 71', '806 00980', '810 36573', '0', '806 01210', 0, 'Adapter Easy-Click Z', 'Z', '806 01210'),
(66, 10, '810 87627 67', '810 87627 69', '810 87627 71', '806 01210', '810 36573', '0', '806 00980', 0, 'funnel nozzle ALFA-T', 'ALFA-T', '806 00980'),
(67, 10, '810 87627 67', '810 87627 69', '810 87627 71', '806 01210', '806 00980', '0', '810 36573', 0, 'funnel nozzle WF60', 'ALFA', '810 36573'),
(68, 11, '806 01230', '810 87358 79', '0', '0', '0', '0', '806 01220', 0, 'CBC-A type Hose connector 160 mm', 'CBCA112G04G65I2', '806 01220'),
(69, 11, '806 01220', '810 87358 79', '0', '0', '0', '0', '806 01230', 0, 'CBC-A Type 4 x Easy-Click 60', 'CBCA112G02G65I2', '806 01230'),
(70, 13, '810 36606', '810 36329', '810 36344', '810 36323', '0', '0', '810 87359 15', 0, 'Exhaust connector DN75', 'T0058735915', '810 87359 15'),
(71, 13, '810 36588', '810 36329', '810 36344', '810 36323', '0', '0', '810 36592', 0, 'Trolley with wheels for WFE 2X', 'T0053659299', '810 36592'),
(72, 13, '810 87359 15', '810 36588', '810 36344', '810 36323', '810 36324', '0', '810 36329', 0, 'Pipe clamps 50', 'T0053632999', '810 36329'),
(73, 13, '810 36588', '810 87359 15', '810 36324', '810 87358 79', '0', '0', '810 36344', 0, 'T-piece 50', 'T0053634499', '810 36344'),
(74, 13, '810 87359 15', '810 36588', '810 36344', '810 36323', '810 36324', '810 87358 79', '810 36323', 0, 'Pipe 50, 2 m', 'T0053632399', '810 36323'),
(75, 13, '810 36323', '810 36588', '810 36329', '810 87359 15', '810 87358 79', '0', '810 36324', 0, 'End seal 50 Pipe', 'T0053632499', '810 36324'),
(76, 13, '810 36571', '810 36572', '806 00160', '810 36578', '810 87627 63', '0', '810 87358 79', 0, 'Hose clamp 50 - 70mm', 'T0058735879', '810 87358 79'),
(77, 13, '810 36571', '810 36572', '810 36578', '810 87627 63', '806 00180', '806 00190', '806 00160', 0, 'Flexible extraction arm 0.5M', '0F05', '806 00160'),
(78, 13, '810 36572', '806 00160', '810 87358 79', '810 36578', '810 87627 63', '806 00180', '806 00170', 0, 'Flexible extraction arm 0.7M', '0F07', '806 00170'),
(79, 13, '810 87358 79', '806 00160', '806 00170', '810 87627 63', '0', '0', '810 36578', 0, 'Flexible extraction arm 1.0M', '0F10', '810 36578'),
(80, 13, '806 00190', '806 00160', '806 00170', '810 87627 63', '810 36572', '0', '806 00180', 0, 'Flexible extraction arm 1.5M', '0F15', '806 00180'),
(81, 13, '806 00170', '806 00180', '810 87627 63', '810 36572', '810 36571', '0', '806 00190', 0, 'Flexible extraction arm 2.0M', '0F20', '806 00190'),
(82, 13, '810 36316', '806 00170', '806 00180', '810 87627 63', '810 36572', '810 36571', '810 36414', 0, 'Extraction hose 40', 'T0053641400', '810 36414'),
(83, 13, '810 36414', '806 00170', '806 00180', '810 87627 63', '810 36572', '810 36571', '810 36316', 0, 'Extraction hose 40', 'T0053631699', '810 36316'),
(84, 13, '810 87358 40', '810 36580', '810 87627 68', '0', '0', '0', '810 87358 45', 0, 'Exhaust hood 200 x 100mm', 'T0058735845', '810 87358 45'),
(85, 13, '810 87358 45', '810 36580', '810 87627 68', '0', '0', '0', '810 87358 40', 0, 'Exhaust connector DN100 for WFE 4S', 'T0058735840', '810 87358 40'),
(87, 13, '810 87627 68', '0', '0', '0', '0', '0', '810 36580', 0, 'Microscope extraction arm WF32 Easy Click 60', 'T0053658099', '810 36580'),
(88, 13, '810 36580', '810 87358 45', '0', '0', '0', '0', '810 87627 68', 0, 'Hose connection 60mm', 'T0058762768', '810 87627 68'),
(89, 13, '810 36591', '810 36575', '810 36415', '810 87620 36', '810 87627 70', '0', '810 87627 53', 0, 'Hose adapter 50-60 mm', 'T0058762753', '810 87627 53'),
(90, 13, '810 87627 53', '810 36575', '810 36415', '810 87620 36', '810 87627 70', '0', '810 36591', 0, 'Hanging bracket for WFE 2X / MG 100', '780-3001-ESD', '810 36591'),
(91, 13, '810 87627 53', '810 36591', '810 36415', '810 87620 36', '810 87627 70', '0', '810 36575', 0, 'Bench mounting bracket', 'T0053657599', '810 36575'),
(92, 13, '810 87627 53', '810 36591', '810 36575', '810 87620 36', '810 87627 70', '0', '810 36415', 0, 'Connection element 40-50', 'T0053641599', '810 36415'),
(93, 13, '0', '810 36591', '810 36575', '810 87627 53', '810 87620 36', '810 87627 70', '810 87620 36', 0, 'Extension hose 60', 'T0058762036', '810 87620 36'),
(94, 10, '810 87627 53', '810 36591', '810 36575', '810 36415', '810 87620 36', '0', '810 87627 70', 0, 'Easy Click 60 Kit 1 WF 32', 'T0058762770', '810 87627 70'),
(95, 6, '806 00300', '806 00310', '806 00350', '0', '0', '0', '806 00410', 0, 'Pre-filter F7 MG 140', '145-4000', '806 00410'),
(96, 6, '806 00410', '806 00300', '806 00280', '0', '0', '0', '806 00310', 0, 'Pre-filter MG 130 / F7 (5 pieces)', '130-2010', '806 00310'),
(97, 6, '806 00410', '806 00310', '806 00280', '0', '0', '0', '806 00300', 0, 'Compact filter MG 130', '130-2000-ESD', '806 00300'),
(98, 6, '806 00350', '806 00410', '806 00400', '810 36593', '0', '0', '806 00370', 0, 'Compact filter MG 140', '145-2000-ESD', '806 00370'),
(99, 6, '806 00350', '806 00370', '806 00410', '810 36593', '0', '0', '806 00400', 0, 'Compact filter MG 140, Solvents / VOC', '145-2012-ESD', '806 00400'),
(100, 3, '810 36706', '810 36506', '810 36606', '810 36666', '0', '0', '810 87627 70', 0, 'Easy Click 60 Kit 1 WF 32', 'T0058762770', '810 87627 70'),
(101, 14, '810 87358 60', '810 87359 24', '810 87359 09', '810 87358 38', '0', '0', 'FT-L15', 0, 'LaserLine 150', 'FT-L15', '..'),
(102, 14, '810 87359 24', '810 87359 09', '0', '810 87358 60', '810 87358 38', '0', 'FT-L20', 0, 'LaserLine 200', 'FT91001699', '..'),
(104, 14, '810 87359 24', '810 87358 60', '810 87359 09', '0', '0', '810 87358 38', 'FT-L400', 0, 'LaserLine 400V', 'FT91002699', '..');

-- --------------------------------------------------------

--
-- Structure de la table `ft_product_attribut`
--

DROP TABLE IF EXISTS `ft_product_attribut`;
CREATE TABLE `ft_product_attribut` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `Attribute` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `ft_product_attribut`
--

TRUNCATE TABLE `ft_product_attribut`;
--
-- Contenu de la table `ft_product_attribut`
--

INSERT INTO `ft_product_attribut` (`id`, `id_product`, `Attribute`) VALUES
(53, 1, 'Filter: Fine dust filter F5'),
(54, 1, 'ESD safe'),
(55, 2, 'Filter alarm and 3 steps speed control.'),
(56, 2, 'Small foot print design.'),
(57, 2, 'Compact filter : Particle filter H13, Wide band gas filter (50 % Active carbon + 50 % Chemisorb).'),
(58, 2, 'RS232 (Remote control) : 1 x RS232 (TTL).'),
(59, 2, 'ESD safe'),
(60, 3, 'Filter: HEPA filter H13 (99,95% against particle ca. 0,12 µm)'),
(61, 3, 'ESD safe'),
(62, 4, 'Pre filter mat class F7.'),
(63, 4, 'Compact filter : Particle filter H13, Wide band gas filter (50 % Active carbon + 50 % Chemisorb).'),
(64, 4, 'RS232 (Remote control) : 1 x RS232 (TTL).'),
(65, 4, 'Filter alarm and 3 steps speed control.'),
(66, 4, 'ESD safe'),
(67, 5, 'Digital display: The backlighting graphic display with an easy navigation with multilingual menu.'),
(68, 5, 'Always fresh air: A visual filter monitoring system (red/yellow/green) together with an audible alarm signal gives early warning of the filter condition'),
(69, 5, 'The motor speed is adjusted automatically so that energy is saved, noise level is reduced and filter life is prolonged.'),
(70, 5, 'To 4 workplaces: Has connection points for 4 arms and is fitted with one easy-click connection.'),
(71, 5, 'Equiped with 4 wheels'),
(72, 5, 'ESD safe'),
(73, 6, 'Fine dust filter: Fine dust filter F7'),
(74, 6, 'Filter: Filter for adhesive fumes (wide band gas filter 50% active carbon, 50% Puratex)'),
(75, 6, 'RS232 port All system functions can be operated and remotely monitored via the RS232 port'),
(76, 6, 'USB port: The USB port can be used to load firmware updates, run efficiency testsand log dat data. Do not leave the USB medium inserted for longer than 2 minutes. After this time expires, the USB module will switch of automatically.'),
(77, 6, 'ESD safe'),
(78, 7, 'Up to 2 FE soldering irons can be connected.'),
(79, 7, 'For industrial long term use.'),
(80, 7, 'Maintenance free compressed air converter.'),
(81, 7, 'The vacuum is generated by a maintenance-free compressed air converter.'),
(82, 7, 'The FE (Fume Extraction) soldering irons are connected directly to the unit - additional leads are not required.'),
(83, 7, 'Operating pressure : 6 bar of cleaned, dry compressed air.'),
(84, 7, 'ESD safe'),
(85, 8, 'Max. carrying capacity : 30 l/min.'),
(86, 8, 'ESD safe'),
(87, 9, 'Stage 1: Pre-filter F5'),
(88, 9, 'Stage 2 3: class H13 high efficiency sub-micron particle air filter (99.95% particles up to approx. 0.12 µm) combined with a wide-band gas filter (50% AKF, 50% Puratex)'),
(89, 9, 'ESD safe'),
(90, 11, '60mm, 1m.'),
(91, 12, 'length 1,5m.'),
(92, 13, 'length 1,2m.'),
(93, 14, 'PEHD = Polyethylen high density'),
(94, 14, 'PE = Polyethylen'),
(95, 14, 'With seal at one end, PEHD black 2 m.'),
(96, 15, 'PEHD = Polyethylen high density'),
(97, 15, 'PE = Polyethylen'),
(98, 15, 'with seal at one end platic, PEHD black.'),
(99, 16, 'with 3 seals, plastic, PEHD black.'),
(100, 16, 'PEHD = Polyethylen high density'),
(101, 17, 'PE = Polyethylen'),
(102, 17, 'PE, transparent.'),
(103, 18, 'PE = Polyethylen'),
(104, 18, 'PE, grey'),
(105, 19, 'PEHD = Polyethylen high density'),
(106, 19, 'Adapter PEHD pipe system 75 to pipe system 50, with 2 seals.'),
(107, 21, 'Filter M5 x10'),
(108, 22, 'HEPA filter E12, Wide band gas filter (10% active carbon) + 10x prefilter M5'),
(109, 22, 'Filter E12 + 10x M5'),
(110, 23, 'Main filter 100% active carbon / For adhesive'),
(111, 23, 'Compact filter (HEPA filter E12 and wide band gas filter)'),
(112, 24, 'Main filter 50% active carbon / 50% Puratex'),
(113, 24, 'Compact filter (HEPA filter E12 and wide band gas filter)'),
(114, 25, 'Fine dust filter F7 for WFE / WFE P / FT 12 (3 pcs)'),
(115, 25, 'Filter F7 x3'),
(116, 26, 'Compact filter for WFE 2X, HEPA filter E 12 EN 1822, 50% active carbon, 50% Puratex.'),
(117, 26, 'Filtre compact'),
(118, 27, 'Pre-filter for WFE 2X. For large fine dust quantities. '),
(119, 27, 'Filters are not included.'),
(120, 28, 'Fine dust filter M5 for WFE 20D / WFE 4S'),
(121, 28, 'Filter X10'),
(122, 29, 'Fine dust filter F7 for WFE 20D / WFE 4S'),
(123, 29, 'Filter F7 x10'),
(124, 30, 'Compact filter (HEPA filter H13 + wide band gas filter 50 % active carbon / 50 % Puratex)'),
(125, 30, 'Compact filter'),
(126, 31, 'Fine dust filter for WFE 2S, Zero Smog 4V.'),
(127, 31, 'Filter M5 x10'),
(128, 32, 'Fine dust filter for WFE 2S, Zero Smog 4V.'),
(129, 32, 'Filter F7 x10'),
(130, 33, 'Compact filter for WFE 2S, Zero Smog 4V'),
(131, 33, 'HEPA filter H13 (> 99.955% particles 0,16µm et > 99,994% particles 0,3µm)'),
(132, 33, '50% active carbon, 50% Chemisorb (permanganate de potassium).'),
(133, 33, 'Compact filter'),
(134, 35, 'Wide band gas filter for WFE 2S, WFE 2S, Zero Smog 4V, 50% active carbon, 50% Chemisorb (potassium permanganate).'),
(135, 35, 'Wide band gas filter'),
(136, 36, 'Pocket filter F7 for Pre-Filter box, WFE 2S / 4S, Zero Smog 4V. '),
(137, 36, 'For applications with a high fine dust rate.'),
(138, 36, 'Pocket filtering F7'),
(139, 37, 'Filter for Pre-filter box, WFE 2S / 4S, Zero Smog 4V. '),
(140, 37, 'Filtering fine dust for sticky particles. (ie: large quantities of liquid flux)'),
(141, 37, 'Filtering ash for sticky of arrears'),
(142, 38, 'FE Attachements with tube 6 mm for WSP 80, WP 80, MLR 21, WMP'),
(143, 39, 'Attaches FE + tuyau 4,5 mm pour WSP 80, WP 80, MLR 21, WMP'),
(144, 40, '\r\nFE Attachment for DS 22, DS 80 and DSX 80 desoldering iron'),
(145, 41, 'The attachments are supplied with all necessary fittings and hoses.'),
(146, 41, 'Provide a AK20 safety rest.'),
(147, 41, 'The performance of the retro fitted tools is n ot affected.'),
(148, 42, 'The attachments are supplied with all necessary fittings and hoses.'),
(149, 42, 'Provide a AK20 safety rest.'),
(150, 42, 'The performance of the retro fitted tools is n ot affected.'),
(151, 43, 'The attachments are supplied with all necessary fittings and hoses.'),
(152, 43, 'Provide a AK20 safety rest.'),
(153, 43, 'The performance of the retro fitted tools is n ot affected.'),
(154, 45, 'Remote control for fume extraction units WFE 2S, WFE 4S, Zero Smog 4V. '),
(155, 45, 'For connection to Zero Smog 4V please use the adapter T0058762724.'),
(156, 46, 'Remote control for fume extraction unit WFE 2X / MG with 1m cable.'),
(157, 46, 'ESD safe'),
(158, 47, 'Interface cable RS 232, 2 m (78.74 in) for remote control or monitoring by PC'),
(159, 47, 'Interface Cable'),
(160, 48, 'Automatic valve.'),
(161, 49, 'WX Adapter for connection of the remote control to Zero Smog 4V'),
(162, 50, 'To activate the Zero Smog.'),
(163, 56, '40/60 adapter for Easy Click 60 extraction arms on 50mm WFEMP50 power socket.'),
(164, 57, 'Stop valve'),
(165, 57, 'bench mounting brackets'),
(166, 59, 'Sloped nozzle'),
(167, 61, 'Aluminium stativ extraction arm, ESD safe.'),
(168, 65, 'Adapter Easy-Click 60, metal.'),
(169, 65, 'Ø 50 mm, l : 130 mm'),
(170, 65, 'ESD safe'),
(171, 66, 'To be mounted on an aluminium extraction arm without flexible hose, adapter Z is needed.'),
(172, 66, '225 x 100 mm'),
(173, 66, 'ESD safe'),
(174, 67, 'To be mounted on an aluminium extraction arm without flexible hose, adapter Z is needed.'),
(175, 67, '225 x 100 mm'),
(176, 67, 'ESD safe'),
(177, 68, 'CBC-A cabinet a unique ventilation concept.'),
(178, 68, 'The air curtain cabinet CBC-A has a unique ventilation concept that separates the operator from the process by a dual air curtain system, giving unlimited accessibility on the workbench.'),
(179, 68, 'It stands directly on the workbench and is easily connected via den 160 mm connector to Weller FT mobile filter system or central ventilation system.'),
(180, 68, 'Mobile System for flexible use on a work bench or trolly.'),
(181, 68, 'Large open front working area with no glas screen.'),
(182, 68, '80 % low running cost against conventional extraction cabines.'),
(183, 68, 'CBC-A needs only 200 m³/h, Conventional 1000 m³/h'),
(184, 68, 'Cabinet interior fittings: Tube lighting (2 x 39 W), 230 V.'),
(185, 68, 'Set up in minutes.'),
(186, 68, 'No additionalwork in the building.'),
(187, 68, 'No installation costs.'),
(188, 68, 'Change location: Simply disconnect, move to the new location and reconnect.'),
(189, 68, 'No wasted energy or heat because the air is recycled.'),
(190, 68, 'Requires no authorization for environmental legislation.'),
(191, 68, 'Flow control provides the exact extraction rate and keeps the temperature stable.'),
(192, 68, 'ESD safe'),
(193, 69, 'CBC-A cabinet a unique ventilation concept.'),
(194, 69, 'The air curtain cabinet CBC-A has a unique ventilation concept that separates the operator from the process by a dual air curtain system, giving unlimited accessibility on the workbench.'),
(195, 69, 'It stands directly on the workbench and is easily connected to Weller FT mobile filter system.'),
(196, 69, 'Cabinet with upper housing part 4 with easy-click couplings.'),
(197, 69, 'For CBC-A 112 G04 2 pieces MG 100S or 1 ZS 6V extraction units with high gas filter volume are needed.'),
(198, 69, 'Mobile System for flexible use on a work bench or trolly.'),
(199, 69, 'Large open front working area with no glas screen.'),
(200, 69, '80 % low running cost against conventional extraction cabines.'),
(201, 69, 'CBC-A needs only 200 m³/h, Conventional 1000 m³/h'),
(202, 69, 'Set up in minutes.'),
(203, 69, 'No additionalwork in the building.'),
(204, 69, 'No installation costs.'),
(205, 69, 'Change location: Simply disconnect, move to the new location and reconnect.'),
(206, 69, 'No wasted energy or heat because the air is recycled.'),
(207, 69, 'Requires no authorization for environmental legislation.'),
(208, 69, 'Flow control provides the exact extraction rate and keeps the temperature stable.'),
(209, 69, 'ESD safe'),
(210, 70, 'For WFE 2S / Zero Smog 4V/Zero Smog 6V'),
(211, 72, 'Pipe clamps for 50 pipe system, grey'),
(212, 73, 'T-piece 2 x 90°, 0,5 m, with 3 seals, plastic, PEHD black'),
(213, 74, 'Pipe 2 m, with seal at one end, plastic, PEHD black'),
(214, 75, 'End seal for DN 50, transparent'),
(215, 77, 'Extraction arm, flexible.\r\n'),
(216, 77, 'ESD safe'),
(217, 78, 'Extraction arm, flexible.'),
(218, 78, 'ESD safe'),
(219, 79, 'Extraction arm, flexible.'),
(220, 79, 'ESD safe'),
(221, 80, 'Extraction arm, flexible.'),
(222, 80, 'ESD safe'),
(223, 81, 'Extraction arm, flexible.'),
(224, 81, 'ESD safe'),
(225, 82, 'Extraction hose 40, Ø 40 mm'),
(226, 82, 'sold by metre Pipe system 50'),
(227, 83, 'Extraction hose 40, 1m, Ø 40 mm'),
(228, 83, 'complete with 2 connectingelements'),
(229, 84, 'Recommended for use with hot air soldering operations.'),
(230, 84, 'Uses extraction hose 60'),
(231, 84, 'Metal black'),
(232, 87, 'ESD microscope extraction arm, flexible, ø32mm.'),
(233, 89, 'Hose adapter for WFE 2ES with silicon O-Ring'),
(234, 89, 'ø 50mm'),
(235, 90, 'For fixing WFE 2X / MG 100 on the work table.'),
(236, 90, 'ESD safe'),
(237, 91, 'Maximum width of clamp: 80 mm'),
(238, 93, 'Extension hose, heavy construction, sold by metre. (max. length 15m)'),
(239, 94, 'Easy Click 60 Microscope extraction arm ø32mm.'),
(240, 95, 'Pre-filter bag F7 (2pcs) MG 140'),
(241, 95, 'ESD safe'),
(242, 95, 'Pre-filter'),
(243, 3, 'Wide band gas filter (50% combined with wide gas filter (Active carbonate foam).'),
(244, 10, 'flexible arm'),
(245, 10, 'With butterfly'),
(246, 10, 'A suction arm with funnel-shaped nozzle'),
(247, 98, 'Particle filter H13 and gas filter for MG 140, standard.'),
(248, 98, 'ESD safe'),
(249, 99, 'Particle filter H13 and gas filter for MG 140, solvant / VOC.'),
(250, 99, 'ESD safe'),
(251, 20, 'Compressed air cleaning filter for WFE / WFE P'),
(252, 96, 'Pre-filter MG 130 / F7 (5 pieces)'),
(253, 96, 'ESD Safe\r\n'),
(254, 97, 'Particle filter H13, Wide band gas filter for MG 130'),
(255, 97, 'ESD safe'),
(256, 97, ' (50 % active carbon + 50 % Chemisorb), standard.'),
(257, 44, 'FE Attachements with tube 6 mm for WP 65 and WP 120'),
(258, 92, 'ESD-safe'),
(259, 71, 'Equiped with 4 wheels'),
(260, 76, 'Hose clamps 50-70 mm'),
(261, 76, '2 pieces'),
(262, 76, 'for securing extraction hose 50 mm'),
(263, 88, 'Hose connection 60 mm'),
(264, 88, 'for flexible hose'),
(265, 85, 'Exhaust connector DN 100 '),
(266, 85, 'for Zero Smog 6V and WFE 4S'),
(267, 51, 'End cap 60 mm click connections'),
(268, 52, 'Easy Click 60 Extraction hose Ø 60 mm lenght: 1 meter'),
(269, 53, 'Easy Click 60 Extraction hose Ø 60 mm lenght: 3 meter'),
(270, 54, 'Easy Click 60 Extraction hose Ø 60 mm lenght: 5 meter'),
(271, 54, 'ESD safe'),
(272, 52, 'ESD safe'),
(273, 53, 'ESD safe'),
(274, 55, 'Female adapter for installation e.g'),
(275, 55, 'stop valve on fume extraction units'),
(276, 100, 'Easy Click 60 Microscope'),
(277, 100, 'extraction arm ø32 mm'),
(278, 100, 'With sloped nozzle ø60 mm.'),
(279, 100, 'Length 1m'),
(280, 1, 'EPA filter H12 (99,5% against particle ca. 0,3 µm)'),
(281, 1, 'combined with wide gas filter (Active carbonate foam)'),
(282, 1, 'Large EPA E12 filter surface of 2.4 m²'),
(283, 101, 'Extraction unit for small particle quantities'),
(284, 101, 'Effective and economical filtration system for different laser applications with a 3-stage filter'),
(285, 101, 'Power supply 115-240V'),
(286, 102, 'Extraction unit for small to medium particle quantities'),
(287, 102, 'Compact filtration system for laser emissions with 4 filter stages'),
(288, 102, 'Constant flow control for even extraction power'),
(289, 104, 'Extraction unit for large particle quantities'),
(290, 104, 'Powerful filtration system for laser emissions with 4 filter stages and an integrated expanded metal filter'),
(291, 104, 'Constant flow control for even extraction power'),
(292, 104, 'Optional extra : interface connector for potential-free contacts');

-- --------------------------------------------------------

--
-- Structure de la table `ft_product_caract`
--

DROP TABLE IF EXISTS `ft_product_caract`;
CREATE TABLE `ft_product_caract` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `Max airflow` varchar(255) NOT NULL,
  `Weight (kg / lb)` varchar(255) NOT NULL,
  `Number of- workplace` varchar(255) NOT NULL,
  `Dimensions L x B x H mm` varchar(255) NOT NULL,
  `Dimensions L x B x H in` varchar(255) NOT NULL,
  `Voltage` varchar(255) NOT NULL,
  `Noise level at 1 meter` varchar(255) NOT NULL,
  `Electrical_power` varchar(255) NOT NULL,
  `Max. blower vacuum` varchar(255) NOT NULL,
  `Max. blower capacity` varchar(255) NOT NULL,
  `Pre-filter` varchar(255) NOT NULL,
  `Compact filter` varchar(255) NOT NULL,
  `Gas filter volume` varchar(255) NOT NULL,
  `Particle filter separation degree MPPS` varchar(255) NOT NULL,
  `Minimum extraction volume` varchar(255) NOT NULL,
  `Maximum extraction volume` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Diameter` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `ft_product_caract`
--

TRUNCATE TABLE `ft_product_caract`;
--
-- Contenu de la table `ft_product_caract`
--

INSERT INTO `ft_product_caract` (`id`, `id_product`, `Max airflow`, `Weight (kg / lb)`, `Number of- workplace`, `Dimensions L x B x H mm`, `Dimensions L x B x H in`, `Voltage`, `Noise level at 1 meter`, `Electrical_power`, `Max. blower vacuum`, `Max. blower capacity`, `Pre-filter`, `Compact filter`, `Gas filter volume`, `Particle filter separation degree MPPS`, `Minimum extraction volume`, `Maximum extraction volume`, `Description`, `Diameter`) VALUES
(1, 1, '', '9 kg / 19.8 lb', '1 - 2 Workplaces', '360 x 330 x 415 mm', '14,17 x 12,99 x 16,33 in', '230 V, 50 Hz (120V, 60 Hz)', '53 dB (A)', '200 W', '3.000 Pa', '190 m³/h', 'Medium dust filter M5', 'Particle filter E12 + gas filter (active carbon foam) low', 'low', '> 99,5 %', '', '', '', 'in shalla'),
(2, 2, '', '11 kg / 24.3 lb', '1 - 2 Workplaces', '460 x 210 x 500 mm', '18,11 x 8,26 x 19,68 in', '100 - 240 V, 50/60 Hz', '< 52 dB (A)', '100 W', '2.300 Pa', '140 m³/h', 'Fine dust filter F7', 'Particle filter H13 + gas filter (50% active carbon + 50% Chemisorb)', 'low', '> 99,95 %', '', '', '', ''),
(3, 3, '', '15 kg / 33.1 lb', 'Up to 2 Workplaces', '460 x 210 x 610 mm', '18,11 x 8,26 x 24,15 in', '100 - 240 V, 50/60 Hz', '< 52 dB (A)', '100 W', '2.300 Pa', '140 m³/h', '', 'Particle filter H13 + gas filter (50% active carbon + 50% Chemisorb)', 'high', '> 99,95 %', '', '', '', ''),
(4, 4, '', '18 kg / 39.7 lb', 'Up to 2 Workplaces', '350 x 335 x 655 mm', '13,77 x 13,18 x 25,78 in', '100 - 240 V, 50/60 Hz', '< 50 dB (A)', '100 W', '2.300 pa', '140 m³/h', 'Fine dust filter F7', 'Particle filter H13 + gas filter (50% active carbon + 50% Chemisorb)', 'high', '> 99,95 %', '', '', '', ''),
(5, 5, '', '19 kg / 41.9 lb', 'Up to 4 Workplaces', '345 x 325 x 505 mm', '13,58 x 12,79 x 19,88 in', '230 V, 50 Hz (120V, 60 Hz)', '48 dB (A)', '275 W', '2.700 Pa', '230 m³/h', 'Fine dust filter F7', 'Particle filter H13 + gas filter (50% active carbon + 50% Chemisorb)', 'medium', '> 99,95 %', '', '', '', ''),
(6, 6, '', '40 kg / 88.2 lb', 'Up to 8 Workplaces', '460 x 460 x 665 mm', '18,11 x 18,11 x 26,18 in', '230 V, 50 Hz (120V, 60 Hz)', '51 dB (A)', '460 W', '3.000 Pa', '645 m³/h', 'Fine dust filter F7', 'Particle filter H13 + gas filter (50% active carbon + 50% Chemisorb)', 'high', '> 99,95 %', '', '', '', ''),
(7, 7, '', '1,7 Kg', '', '120 x 120 x 120 mm', '', '', '37 dB(A)', '', '20.000 Pa', '', '', '', '', '', '', '', '', ''),
(8, 8, '1,8 m³/h', '', '', '140 x 295 mm', '', '230 V AC, 70W', '40 dB(A)', '', '30.000 Pa', '', '', '', '', '', '', '', '', ''),
(9, 9, '100 m³/h', '45 Kg', '', '450 x 450 x 695 mm', '', '230 V / 50 Hz, 530 VA', '51 dB(A)', '', '10.000 Pa', '', '', '', '', '', '', '', '', ''),
(10, 10, '', '', '', '230 x 100 x 1000', '', '', '', '', '', '', '', '', '', '', '', '', 'Extraction Arm', 'Ø60 mm'),
(11, 11, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(12, 12, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(13, 13, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(14, 14, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(15, 15, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(16, 16, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(17, 17, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(18, 18, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(19, 19, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(20, 20, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(21, 21, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(25, 22, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(26, 23, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(27, 24, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(28, 25, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(29, 26, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(30, 27, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(31, 28, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(32, 29, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(33, 30, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(34, 31, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(35, 32, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(36, 33, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(37, 34, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(38, 35, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(39, 36, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(40, 37, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(41, 38, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(42, 39, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(43, 40, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(44, 41, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(45, 42, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(46, 43, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(47, 44, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(48, 45, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(49, 46, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(50, 47, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(51, 48, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(52, 49, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(53, 50, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(54, 51, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(55, 52, '', '', '', '1 M x 60 mm', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(56, 53, '', '', '', '3 M x 60 mm', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(57, 54, '', '', '', '5 M x 60 mm', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(58, 55, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(59, 56, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(60, 57, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(61, 58, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(62, 59, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(63, 60, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(64, 61, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(65, 62, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(66, 63, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(67, 64, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(68, 65, '', '', '', 'Ø 50 mm, l : 130 mm', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(69, 66, '', '', '', '225 x 100 mm', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(70, 67, '', '', '', '225 x 100 mm', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(71, 68, '', '53 kg', '', '760 x 1275 x 625 mm', '', '230 V / 50 Hz', '< 49dB(A)', '', '', '', '', '', '', '', '180 m³/h', '230 m³/h', '', ''),
(72, 69, '', '53 kg', '', '760 x 1275 x 625 mm', '', '230 V / 50 Hz', '< 49dB(A)', '', '', '', '', '', '', '', '180 m³/h', '230 m³/h', '', ''),
(73, 70, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(74, 71, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(75, 72, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(76, 73, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(77, 74, '', '', '', 'Ø 60mm  L : 0,5 m', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(78, 75, '', '', '', 'Ø 60mm  L : 0,7 m', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(79, 76, '', '', '', 'Ø 60mm  L : 1,0 m', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(80, 77, '', '', '', 'Ø 60mm  L : 1,5 m', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(81, 78, '', '', '', 'Ø 60mm  L : 2,0 m', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(82, 79, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(83, 80, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(84, 81, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(85, 82, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(86, 83, '', '', '', '1m, Ø 40 mm', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(87, 84, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(88, 85, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(89, 86, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(90, 87, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(91, 88, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(92, 89, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(93, 90, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(94, 91, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(95, 92, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(96, 93, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(97, 98, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Compact filter', ''),
(98, 99, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Compact filter', ''),
(99, 95, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(100, 96, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(101, 94, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(102, 97, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(103, 44, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'FE Attachements with tube 6 mm for WP 65 and WP 120', 'Ø 6,5 mm'),
(104, 101, '', '18 kg / 39.7 lb', '', '340 x 340 x 680', ' 13.4 x 13.4 x 26.8', '110 - 240 V, 50 hz', '< 50', '100 W', '2000', '140 (82.3) m³/h', 'F7 (0.24)', 'Particle filter H13 + gas filter (50% active carbon + 50% Chemisorb)', '', '> 99.95%', '', '', 'Interface TTL', ''),
(105, 102, '', '21 kg / 46.3 lb', '', '320 x 320 x 700', ' 12.6 x 12.6 x 27.6', '230 - 240 V, 50 hz', '< 52', '200 W', '2700', '230 (135) m³/h', 'F7 (0.5 - 2.5)', 'Particle filter H13 + gas filter (50% active carbon + 50% Chemisorb)', '', '> 99.95%', '', '', 'Interface RS232', ''),
(106, 104, '', '51 kg / 112.4 lb', '', '441 x 441 x 1020', ' 17.4 x 17.4 x 40.2', '230 - 240 V, 50 hz', '< 53', '360 W', '3000', '645 (380) m³/h', 'F7 (2.5 - 10)', 'Particle filter H13 + gas filter (50% active carbon + 50% Chemisorb)', '', '> 99.95%', '', '', 'Interface RS232', ''),
(107, 1, '', '9 kg / 19.8 lb', '1 - 2 Workplaces', '360 x 330 x 415 mm', '14,17 x 12,99 x 16,33 in', '230 V, 50 Hz (120V, 60 Hz)', '53 dB (A)', '200 W', '3.000 Pa', '190 m³/h', 'Medium dust filter M5', 'Particle filter E12 + gas filter (active carbon foam) low', 'low', '> 99,5 %', '', '', '', 'in shalla');

-- --------------------------------------------------------

--
-- Structure de la table `gaz`
--

DROP TABLE IF EXISTS `gaz`;
CREATE TABLE `gaz` (
  `id` int(11) NOT NULL,
  `date_relever` date NOT NULL,
  `relever` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `gaz`
--

TRUNCATE TABLE `gaz`;
--
-- Contenu de la table `gaz`
--

INSERT INTO `gaz` (`id`, `date_relever`, `relever`) VALUES
(1, '2017-02-21', 0),
(2, '2017-03-28', 14.98),
(3, '2017-04-05', 16.14),
(5, '2017-04-11', 19);

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_connect` varchar(50) NOT NULL,
  `avertissement` int(11) NOT NULL,
  `password_no_hash` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vider la table avant d'insérer `login`
--

TRUNCATE TABLE `login`;
--
-- Contenu de la table `login`
--

INSERT INTO `login` (`id`, `login`, `password`, `last_connect`, `avertissement`, `password_no_hash`, `email`, `level`) VALUES
(20, 'evengyl', '$2y$10$LMyXpdg11OyYKNOtimiQOOfEABrPA5DOEubnuxvnmOCGiq1Y.BhvS', '1490198511', 0, 'legends', 'dark.evengyl@gmail.com', 3),
(21, 'evengyleez', '$2y$10$LMyXpdg11OyYKNOtimiQOOfEABrPA5DOEubnuxvnmOCGiq1Y.BhvS', '1490198511', 10, 'legends', 'dark.evengyl@gmail.com', 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `eau`
--
ALTER TABLE `eau`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `electricite_jour`
--
ALTER TABLE `electricite_jour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relever` (`relever`);

--
-- Index pour la table `electricite_nuit`
--
ALTER TABLE `electricite_nuit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ft_category`
--
ALTER TABLE `ft_category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ft_product`
--
ALTER TABLE `ft_product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ft_product_attribut`
--
ALTER TABLE `ft_product_attribut`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ft_product_caract`
--
ALTER TABLE `ft_product_caract`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gaz`
--
ALTER TABLE `gaz`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `eau`
--
ALTER TABLE `eau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `electricite_jour`
--
ALTER TABLE `electricite_jour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `electricite_nuit`
--
ALTER TABLE `electricite_nuit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `ft_category`
--
ALTER TABLE `ft_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `ft_product`
--
ALTER TABLE `ft_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT pour la table `ft_product_attribut`
--
ALTER TABLE `ft_product_attribut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;
--
-- AUTO_INCREMENT pour la table `ft_product_caract`
--
ALTER TABLE `ft_product_caract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT pour la table `gaz`
--
ALTER TABLE `gaz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
