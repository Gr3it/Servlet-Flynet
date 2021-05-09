-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 09, 2021 alle 21:25
-- Versione del server: 10.4.18-MariaDB
-- Versione PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aereoporto`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `compagnia`
--

CREATE TABLE `compagnia` (
  `id_compagnia` int(11) NOT NULL,
  `nome_compagnia` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `compagnia`
--

INSERT INTO `compagnia` (`id_compagnia`, `nome_compagnia`) VALUES
(1, 'AIR FRANCE'),
(2, 'ALBASTAR'),
(3, 'Blue Air'),
(4, 'EASYJET'),
(5, 'Easyjet Europe'),
(6, 'RYANAIR'),
(7, 'TRANSAVIA FRANCE'),
(8, 'VOLOTEA'),
(9, 'VUELING AIRLINES   S.A.'),
(10, '4 Europe'),
(12, 'duce'),
(13, 'duce');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `username` varchar(30) NOT NULL,
  `psw` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`username`, `psw`) VALUES
('Provvisorio', 'Provvisorio2021'),
('root', 'root');

-- --------------------------------------------------------

--
-- Struttura della tabella `volo`
--

CREATE TABLE `volo` (
  `id` int(11) NOT NULL,
  `sigla` char(3) DEFAULT NULL,
  `aeroporto` varchar(30) DEFAULT NULL,
  `compagnia` int(11) DEFAULT NULL,
  `codice_volo` char(7) DEFAULT NULL,
  `partenza` varchar(30) DEFAULT NULL,
  `arrivo` varchar(30) DEFAULT NULL,
  `tipo` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `volo`
--

INSERT INTO `volo` (`id`, `sigla`, `aeroporto`, `compagnia`, `codice_volo`, `partenza`, `arrivo`, `tipo`) VALUES
(1, 'BVA', 'PARIGI BEAUVAIS', 6, 'FR 4832', '12:50', '14:15', 'Rit'),
(2, 'BVA', 'PARIGI BEAUVAIS', 6, 'FR 4831', '09:20', '12:45', 'And'),
(3, 'BVA', 'PARIGI BEAUVAIS', 6, 'FR 4832', '18:05', '19:30', 'Rit'),
(4, 'BVA', 'PARIGI BEAUVAIS', 6, 'FR 4831', '19:55', '23:20', 'And'),
(5, 'BVA', 'PARIGI BEAUVAIS', 6, 'FR 4832', '13:55', '15:20', 'Rit'),
(6, 'BVA', 'PARIGI BEAUVAIS', 6, 'FR 4831', '10:25', '13:50', 'And'),
(7, 'CDG', 'PARIGI CHARLES DE GAULLE', 1, 'AF 1111', '16:15', '19:35', 'And'),
(8, 'CDG', 'PARIGI CHARLES DE GAULLE', 1, 'AF 1110', '13:55', '15:15', 'Rit'),
(9, 'CDG', 'PARIGI CHARLES DE GAULLE', 1, 'AF 1111', '12:35', '15:55', 'And'),
(10, 'CDG', 'PARIGI CHARLES DE GAULLE', 1, 'AF 1110', '10:15', '11:35', 'Rit'),
(11, 'ORY', 'PARIGI ORLY', 7, 'TO 3893', '19:00', '22:05', 'And'),
(12, 'ORY', 'PARIGI ORLY', 7, 'TO 3892', '17:10', '18:15', 'Rit'),
(13, 'ORY', 'PARIGI ORLY', 7, 'TO 3893', '15:30', '18:35', 'And'),
(14, 'ORY', 'PARIGI ORLY', 7, 'TO 3892', '13:40', '14:45', 'Rit'),
(15, 'STN', 'LONDRA STANSTED', 6, 'FR 2851', '20:30', '22:00', 'And'),
(16, 'STN', 'LONDRA STANSTED', 6, 'FR 2851', '11:25', '12:55', 'And'),
(17, 'STN', 'LONDRA STANSTED', 6, 'FR 2850', '16:35', '20:05', 'Rit'),
(18, 'STN', 'LONDRA STANSTED', 6, 'FR 2850', '07:30', '11:00', 'Rit'),
(19, 'STN', 'LONDRA STANSTED', 6, 'FR 2851', '22:00', '23:30', 'And'),
(20, 'STN', 'LONDRA STANSTED', 6, 'FR 2851', '22:00', '23:30', 'And'),
(21, 'STN', 'LONDRA STANSTED', 6, 'FR 2851', '22:00', '23:30', 'And'),
(22, 'STN', 'LONDRA STANSTED', 6, 'FR 2850', '18:05', '21:35', 'Rit'),
(23, 'STN', 'LONDRA STANSTED', 6, 'FR 2850', '18:05', '21:35', 'Rit'),
(24, 'STN', 'LONDRA STANSTED', 6, 'FR 2850', '18:05', '21:35', 'Rit'),
(25, 'STN', 'LONDRA STANSTED', 6, 'FR 2851', '21:50', '23:20', 'And'),
(26, 'STN', 'LONDRA STANSTED', 6, 'FR 2850', '17:55', '21:25', 'Rit'),
(27, 'STN', 'LONDRA STANSTED', 4, 'U2 3204', '11:40', '13:10', 'And'),
(28, 'STN', 'LONDRA STANSTED', 4, 'U2 3203', '07:40', '11:10', 'Rit'),
(29, 'STN', 'LONDRA STANSTED', 4, 'U2 3204', '19:00', '20:30', 'And'),
(30, 'STN', 'LONDRA STANSTED', 4, 'U2 3203', '15:00', '18:30', 'Rit'),
(31, 'STN', 'LONDRA STANSTED', 4, 'U2 3204', '10:30', '12:00', 'And'),
(32, 'STN', 'LONDRA STANSTED', 4, 'U2 3203', '06:25', '09:55', 'Rit'),
(33, 'CTA', 'CATANIA', 6, 'FR 5048', '15:45', '17:00', 'Rit'),
(34, 'CTA', 'CATANIA', 6, 'FR 5047', '17:25', '18:40', 'And'),
(35, 'CTA', 'CATANIA', 6, 'FR 5048', '16:35', '17:50', 'Rit'),
(36, 'CTA', 'CATANIA', 6, 'FR 5048', '16:35', '17:50', 'Rit'),
(37, 'CTA', 'CATANIA', 6, 'FR 5047', '14:40', '15:55', 'And'),
(38, 'CTA', 'CATANIA', 6, 'FR 5047', '14:40', '15:55', 'And'),
(39, 'CTA', 'CATANIA', 6, 'FR 5048', '16:50', '18:05', 'Rit'),
(40, 'CTA', 'CATANIA', 6, 'FR 5048', '16:20', '17:35', 'Rit'),
(41, 'CTA', 'CATANIA', 6, 'FR 5047', '18:00', '19:15', 'And'),
(42, 'CTA', 'CATANIA', 6, 'FR 5047', '14:55', '16:10', 'And'),
(43, 'CTA', 'CATANIA', 6, 'FR 5048', '16:40', '17:55', 'Rit'),
(44, 'CTA', 'CATANIA', 6, 'FR 5047', '14:35', '15:50', 'And'),
(45, 'CUF', 'CUNEO', 6, 'FR 4816', '14:25', '15:50', 'Rit'),
(46, 'CUF', 'CUNEO', 6, 'FR 4815', '12:40', '14:05', 'And'),
(47, 'CUF', 'CUNEO', 6, 'FR 4816', '12:10', '13:35', 'Rit'),
(48, 'CUF', 'CUNEO', 6, 'FR 4816', '12:10', '13:35', 'Rit'),
(49, 'CUF', 'CUNEO', 6, 'FR 4816', '12:10', '13:35', 'Rit'),
(50, 'CUF', 'CUNEO', 6, 'FR 4815', '10:25', '11:50', 'And'),
(51, 'CUF', 'CUNEO', 6, 'FR 4815', '10:25', '11:50', 'And'),
(52, 'CUF', 'CUNEO', 6, 'FR 4815', '10:25', '11:50', 'And'),
(53, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4802', '12:40', '13:50', 'Rit'),
(54, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4802', '20:05', '21:15', 'Rit'),
(55, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4801', '06:45', '07:55', 'And'),
(56, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4801', '14:15', '15:25', 'And'),
(57, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4801', '14:40', '15:50', 'And'),
(58, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4801', '21:40', '22:50', 'And'),
(59, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4801', '16:40', '17:50', 'And'),
(60, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4802', '15:05', '16:15', 'Rit'),
(61, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4801', '08:15', '09:25', 'And'),
(62, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4801', '08:15', '09:25', 'And'),
(63, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4802', '06:40', '07:50', 'Rit'),
(64, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4802', '06:40', '07:50', 'Rit'),
(65, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4802', '07:45', '08:55', 'Rit'),
(66, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4802', '13:05', '14:15', 'Rit'),
(67, 'CIA', 'ROMA CIAMPINO', 6, 'FR 4802', '08:20', '09:30', 'Rit'),
(68, 'BRI', 'BARI', 6, 'FR 8726', '18:40', '20:00', 'Rit'),
(69, 'BRI', 'BARI', 6, 'FR 8727', '16:40', '18:00', 'And'),
(70, 'BRI', 'BARI', 6, 'FR 8726', '16:25', '17:45', 'Rit'),
(71, 'BRI', 'BARI', 6, 'FR 8726', '16:25', '17:45', 'Rit'),
(72, 'BRI', 'BARI', 6, 'FR 8727', '14:25', '15:45', 'And'),
(73, 'BRI', 'BARI', 6, 'FR 8727', '14:25', '15:45', 'And'),
(74, 'BRI', 'BARI', 6, 'FR 8727', '21:45', '23:05', 'And'),
(75, 'BRI', 'BARI', 6, 'FR 8726', '20:00', '21:20', 'Rit'),
(76, 'VCE', 'VENEZIA', 6, 'FR 4826', '10:40', '12:10', 'And'),
(77, 'VCE', 'VENEZIA', 6, 'FR 4827', '16:15', '17:45', 'Rit'),
(78, 'VCE', 'VENEZIA', 6, 'FR 4827', '11:50', '13:20', 'Rit'),
(79, 'VCE', 'VENEZIA', 6, 'FR 4827', '12:20', '13:50', 'Rit'),
(80, 'VCE', 'VENEZIA', 6, 'FR 4827', '12:20', '13:50', 'Rit'),
(81, 'VCE', 'VENEZIA', 6, 'FR 4826', '10:25', '11:55', 'And'),
(82, 'VCE', 'VENEZIA', 6, 'FR 4826', '10:25', '11:55', 'And'),
(83, 'VCE', 'VENEZIA', 6, 'FR 4827', '13:20', '14:50', 'Rit'),
(84, 'VCE', 'VENEZIA', 6, 'FR 4827', '15:15', '16:45', 'Rit'),
(85, 'VCE', 'VENEZIA', 6, 'FR 4826', '14:20', '15:50', 'And'),
(86, 'VCE', 'VENEZIA', 6, 'FR 4826', '09:55', '11:25', 'And'),
(87, 'VCE', 'VENEZIA', 6, 'FR 4826', '11:25', '12:55', 'And'),
(88, 'VCE', 'VENEZIA', 6, 'FR 4826', '13:20', '14:50', 'And'),
(89, 'VCE', 'VENEZIA', 6, 'FR 4827', '12:35', '14:05', 'Rit'),
(90, 'VCE', 'VENEZIA', 6, 'FR 4827', '11:45', '13:15', 'Rit'),
(91, 'VCE', 'VENEZIA', 6, 'FR 4826', '09:50', '11:20', 'And'),
(92, 'VCE', 'VENEZIA', 10, 'EC 3308', '12:45', '14:05', 'And'),
(93, 'VCE', 'VENEZIA', 10, 'EC 3308', '09:20', '10:40', 'And'),
(94, 'VCE', 'VENEZIA', 10, 'EC 3307', '10:55', '12:15', 'Rit'),
(95, 'VCE', 'VENEZIA', 10, 'EC 3307', '07:30', '08:50', 'Rit'),
(96, 'VCE', 'VENEZIA', 10, 'EC 3308', '21:40', '23:00', 'And'),
(97, 'VCE', 'VENEZIA', 10, 'EC 3307', '19:50', '21:10', 'Rit'),
(98, 'VCE', 'VENEZIA', 10, 'EC 3308', '08:05', '09:25', 'And'),
(99, 'VCE', 'VENEZIA', 10, 'EC 3307', '06:15', '07:35', 'Rit'),
(100, 'VRN', 'VERONA', 6, 'FR 487', '17:50', '19:05', 'Rit'),
(101, 'VRN', 'VERONA', 6, 'FR 487', '20:40', '21:55', 'Rit'),
(102, 'VRN', 'VERONA', 6, 'FR 486', '15:40', '16:55', 'And'),
(103, 'VRN', 'VERONA', 6, 'FR 486', '18:30', '19:45', 'And'),
(104, 'VRN', 'VERONA', 6, 'FR 487', '20:30', '21:45', 'Rit'),
(105, 'VRN', 'VERONA', 6, 'FR 487', '12:35', '13:50', 'Rit'),
(106, 'VRN', 'VERONA', 6, 'FR 487', '12:35', '13:50', 'Rit'),
(107, 'VRN', 'VERONA', 6, 'FR 486', '18:20', '19:35', 'And'),
(108, 'VRN', 'VERONA', 6, 'FR 486', '10:25', '11:40', 'And'),
(109, 'VRN', 'VERONA', 6, 'FR 486', '10:25', '11:40', 'And'),
(110, 'VRN', 'VERONA', 6, 'FR 487', '09:10', '10:25', 'Rit'),
(111, 'VRN', 'VERONA', 6, 'FR 486', '07:00', '08:15', 'And'),
(112, 'VRN', 'VERONA', 6, 'FR 487', '20:25', '21:40', 'Rit'),
(113, 'VRN', 'VERONA', 6, 'FR 487', '20:25', '21:40', 'Rit'),
(114, 'VRN', 'VERONA', 6, 'FR 486', '18:15', '19:30', 'And'),
(115, 'VRN', 'VERONA', 6, 'FR 486', '18:15', '19:30', 'And'),
(116, 'VRN', 'VERONA', 8, 'V7 1771', '12:00', '13:30', 'And'),
(117, 'VRN', 'VERONA', 8, 'V7 1770', '10:00', '11:30', 'Rit'),
(118, 'GOA', 'GENOVA', 8, 'V7 1801', '20:45', '21:55', 'Rit'),
(119, 'GOA', 'GENOVA', 8, 'V7 1801', '20:20', '21:30', 'Rit'),
(120, 'GOA', 'GENOVA', 8, 'V7 1801', '12:25', '13:35', 'Rit'),
(121, 'GOA', 'GENOVA', 8, 'V7 1800', '10:30', '11:40', 'And'),
(122, 'GOA', 'GENOVA', 8, 'V7 1800', '10:30', '11:40', 'And'),
(123, 'PMF', 'PARMA', 6, 'FR 8112', '09:55', '11:20', 'And'),
(124, 'PMF', 'PARMA', 6, 'FR 8112', '07:35', '09:00', 'And'),
(125, 'PMF', 'PARMA', 6, 'FR 8111', '11:45', '13:10', 'Rit'),
(126, 'PMF', 'PARMA', 6, 'FR 8111', '09:25', '10:50', 'Rit'),
(127, 'PMO', 'PALERMO', 8, 'V7 1569', '11:00', '12:10', 'And'),
(128, 'PMO', 'PALERMO', 8, 'V7 1568', '19:30', '20:40', 'Rit'),
(129, 'PMO', 'PALERMO', 8, 'V7 1568', '17:15', '18:25', 'Rit'),
(130, 'PMO', 'PALERMO', 8, 'V7 1568', '12:35', '13:45', 'Rit'),
(131, 'PMO', 'PALERMO', 8, 'V7 1569', '17:55', '19:05', 'And'),
(132, 'PMO', 'PALERMO', 8, 'V7 1569', '19:00', '20:10', 'And'),
(133, 'PMO', 'PALERMO', 8, 'V7 1569', '16:35', '17:45', 'And'),
(134, 'PMO', 'PALERMO', 8, 'V7 1569', '07:30', '08:40', 'And'),
(135, 'PMO', 'PALERMO', 8, 'V7 1568', '15:00', '16:10', 'Rit'),
(136, 'PMO', 'PALERMO', 8, 'V7 1568', '08:55', '10:05', 'Rit'),
(137, 'PSA', 'PISA', 6, 'FR 9932', '06:35', '07:50', 'And'),
(138, 'PSA', 'PISA', 6, 'FR 9932', '06:40', '07:55', 'And'),
(139, 'PSA', 'PISA', 6, 'FR 9932', '06:40', '07:55', 'And'),
(140, 'PSA', 'PISA', 6, 'FR 9934', '13:15', '14:30', 'And'),
(141, 'PSA', 'PISA', 6, 'FR 9933', '11:35', '12:50', 'Rit'),
(142, 'PSA', 'PISA', 6, 'FR 9931', '21:55', '23:10', 'Rit'),
(143, 'PSA', 'PISA', 6, 'FR 9931', '08:10', '09:25', 'Rit'),
(144, 'PSA', 'PISA', 6, 'FR 9931', '08:15', '09:30', 'Rit'),
(145, 'PSA', 'PISA', 6, 'FR 9931', '08:15', '09:30', 'Rit'),
(146, 'PSA', 'PISA', 6, 'FR 9932', '20:20', '21:35', 'And'),
(147, 'PSA', 'PISA', 6, 'FR 9934', '16:05', '17:20', 'And'),
(148, 'PSA', 'PISA', 6, 'FR 9934', '16:05', '17:20', 'And'),
(149, 'PSA', 'PISA', 6, 'FR 9933', '14:25', '15:40', 'Rit'),
(150, 'PSA', 'PISA', 6, 'FR 9933', '14:25', '15:40', 'Rit'),
(151, 'PSA', 'PISA', 6, 'FR 9934', '12:45', '14:00', 'And'),
(152, 'PSA', 'PISA', 6, 'FR 9934', '16:10', '17:25', 'And'),
(153, 'PSA', 'PISA', 6, 'FR 9933', '11:05', '12:20', 'Rit'),
(154, 'PSA', 'PISA', 6, 'FR 9933', '17:45', '19:00', 'Rit'),
(155, 'MXP', 'MILANO MALPENSA', 6, 'FR 4608', '08:30', '09:50', 'And'),
(156, 'MXP', 'MILANO MALPENSA', 6, 'FR 4608', '14:15', '15:35', 'And'),
(157, 'MXP', 'MILANO MALPENSA', 6, 'FR 4608', '11:05', '12:25', 'And'),
(158, 'MXP', 'MILANO MALPENSA', 6, 'FR 4607', '09:20', '10:40', 'Rit'),
(159, 'MXP', 'MILANO MALPENSA', 6, 'FR 4607', '12:30', '13:50', 'Rit'),
(160, 'MXP', 'MILANO MALPENSA', 6, 'FR 4607', '06:45', '08:05', 'Rit'),
(161, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '21:50', '23:10', 'And'),
(162, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '22:00', '23:20', 'And'),
(163, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '22:00', '23:20', 'And'),
(164, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '20:05', '21:25', 'Rit'),
(165, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '20:15', '21:35', 'Rit'),
(166, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '20:15', '21:35', 'Rit'),
(167, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '14:00', '15:20', 'And'),
(168, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '12:15', '13:35', 'Rit'),
(169, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '22:25', '23:45', 'And'),
(170, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '20:40', '22:00', 'Rit'),
(171, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '21:40', '23:00', 'And'),
(172, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '19:55', '21:15', 'Rit'),
(173, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '12:10', '13:30', 'And'),
(174, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '20:55', '22:15', 'And'),
(175, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '19:10', '20:30', 'Rit'),
(176, 'MXP', 'MILANO MALPENSA', 6, 'FR 1047', '12:20', '13:40', 'And'),
(177, 'MXP', 'MILANO MALPENSA', 6, 'FR 1047', '07:45', '09:05', 'And'),
(178, 'MXP', 'MILANO MALPENSA', 6, 'FR 1047', '08:35', '09:55', 'And'),
(179, 'MXP', 'MILANO MALPENSA', 6, 'FR 1046', '10:35', '11:55', 'Rit'),
(180, 'MXP', 'MILANO MALPENSA', 6, 'FR 1046', '06:00', '07:20', 'Rit'),
(181, 'MXP', 'MILANO MALPENSA', 6, 'FR 1046', '06:50', '08:10', 'Rit'),
(182, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '10:25', '11:45', 'Rit'),
(183, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '09:05', '10:25', 'And'),
(184, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '09:05', '10:25', 'And'),
(185, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '07:20', '08:40', 'Rit'),
(186, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '07:20', '08:40', 'Rit'),
(187, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '17:40', '19:00', 'And'),
(188, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '17:55', '19:15', 'And'),
(189, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '15:55', '17:15', 'Rit'),
(190, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '16:10', '17:30', 'Rit'),
(191, 'MXP', 'MILANO MALPENSA', 6, 'FR 4608', '08:50', '10:10', 'And'),
(192, 'MXP', 'MILANO MALPENSA', 6, 'FR 4608', '08:50', '10:10', 'And'),
(193, 'MXP', 'MILANO MALPENSA', 6, 'FR 4608', '08:35', '09:55', 'And'),
(194, 'MXP', 'MILANO MALPENSA', 6, 'FR 4607', '07:05', '08:25', 'Rit'),
(195, 'MXP', 'MILANO MALPENSA', 6, 'FR 4607', '07:05', '08:25', 'Rit'),
(196, 'MXP', 'MILANO MALPENSA', 6, 'FR 4607', '06:50', '08:10', 'Rit'),
(197, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '17:45', '19:05', 'And'),
(198, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '16:45', '18:05', 'And'),
(199, 'MXP', 'MILANO MALPENSA', 6, 'FR 4562', '16:45', '18:05', 'And'),
(200, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '16:00', '17:20', 'Rit'),
(201, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '15:00', '16:20', 'Rit'),
(202, 'MXP', 'MILANO MALPENSA', 6, 'FR 4561', '15:00', '16:20', 'Rit'),
(203, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '17:30', '18:50', 'And'),
(204, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '15:25', '16:45', 'Rit'),
(205, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '17:05', '18:25', 'And'),
(206, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '15:00', '16:20', 'Rit'),
(207, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '10:55', '12:15', 'Rit'),
(208, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '10:55', '12:15', 'Rit'),
(209, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '20:35', '21:55', 'Rit'),
(210, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '15:50', '17:10', 'Rit'),
(211, 'MXP', 'MILANO MALPENSA', 10, 'EC 2876', '12:40', '14:00', 'And'),
(212, 'MXP', 'MILANO MALPENSA', 10, 'EC 2876', '11:40', '13:00', 'And'),
(213, 'MXP', 'MILANO MALPENSA', 10, 'EC 2875', '10:50', '12:10', 'Rit'),
(214, 'MXP', 'MILANO MALPENSA', 10, 'EC 2875', '09:50', '11:10', 'Rit'),
(215, 'MXP', 'MILANO MALPENSA', 10, 'EC 2880', '22:45', '00:05', 'And'),
(216, 'MXP', 'MILANO MALPENSA', 10, 'EC 2879', '20:55', '22:15', 'Rit'),
(217, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '22:25', '23:45', 'And'),
(218, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '17:40', '19:00', 'And'),
(219, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '12:45', '14:05', 'And'),
(220, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '12:45', '14:05', 'And'),
(221, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '11:35', '12:55', 'And'),
(222, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '09:40', '11:00', 'Rit'),
(223, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '15:50', '17:10', 'And'),
(224, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '13:55', '15:15', 'Rit'),
(225, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '09:10', '10:30', 'Rit'),
(226, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '09:10', '10:30', 'Rit'),
(227, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '11:05', '12:25', 'And'),
(228, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '11:05', '12:25', 'And'),
(229, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '11:05', '12:25', 'And'),
(230, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '09:15', '10:35', 'Rit'),
(231, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '21:10', '22:30', 'And'),
(232, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '21:10', '22:30', 'And'),
(233, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '21:10', '22:30', 'And'),
(234, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '19:10', '20:30', 'Rit'),
(235, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '19:10', '20:30', 'Rit'),
(236, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '19:10', '20:30', 'Rit'),
(237, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '09:25', '10:45', 'And'),
(238, 'MXP', 'MILANO MALPENSA', 10, 'EC 2878', '09:25', '10:45', 'And'),
(239, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '07:35', '08:55', 'Rit'),
(240, 'MXP', 'MILANO MALPENSA', 10, 'EC 2877', '07:35', '08:55', 'Rit'),
(241, 'NAP', 'NAPOLI', 6, 'FR 4655', '11:25', '12:35', 'And'),
(242, 'NAP', 'NAPOLI', 6, 'FR 4654', '09:50', '11:00', 'Rit'),
(243, 'NAP', 'NAPOLI', 10, 'EC 4897', '11:15', '12:25', 'Rit'),
(244, 'NAP', 'NAPOLI', 8, 'V7 1799', '06:45', '07:55', 'And'),
(245, 'NAP', 'NAPOLI', 8, 'V7 1798', '08:45', '09:55', 'Rit'),
(246, 'NAP', 'NAPOLI', 8, 'V7 1799', '07:00', '08:10', 'And'),
(247, 'NAP', 'NAPOLI', 8, 'V7 1799', '10:30', '11:45', 'And'),
(248, 'NAP', 'NAPOLI', 8, 'V7 1799', '09:45', '10:55', 'And'),
(249, 'NAP', 'NAPOLI', 8, 'V7 1799', '10:45', '11:55', 'And'),
(250, 'NAP', 'NAPOLI', 8, 'V7 1798', '08:55', '10:05', 'Rit'),
(251, 'NAP', 'NAPOLI', 8, 'V7 1798', '08:55', '10:05', 'Rit'),
(252, 'NAP', 'NAPOLI', 8, 'V7 1798', '08:50', '10:05', 'Rit'),
(253, 'NAP', 'NAPOLI', 8, 'V7 1798', '11:40', '12:50', 'Rit'),
(254, 'NAP', 'NAPOLI', 8, 'V7 1798', '12:40', '13:50', 'Rit'),
(255, 'NAP', 'NAPOLI', 8, 'V7 1798', '12:40', '13:50', 'Rit'),
(256, 'TRN', 'TORINO', 6, 'FR 6863', '21:25', '22:45', 'Rit'),
(257, 'TRN', 'TORINO', 6, 'FR 6863', '16:00', '17:20', 'Rit'),
(258, 'TRN', 'TORINO', 6, 'FR 6863', '22:20', '23:40', 'Rit'),
(259, 'TRN', 'TORINO', 6, 'FR 6863', '08:55', '10:15', 'Rit'),
(260, 'TRN', 'TORINO', 6, 'FR 6863', '20:05', '21:25', 'Rit'),
(261, 'TRN', 'TORINO', 6, 'FR 6863', '20:05', '21:25', 'Rit'),
(262, 'TRN', 'TORINO', 6, 'FR 6863', '22:15', '23:35', 'Rit'),
(263, 'TRN', 'TORINO', 6, 'FR 6863', '22:15', '23:35', 'Rit'),
(264, 'TRN', 'TORINO', 6, 'FR 6862', '07:00', '08:20', 'And'),
(265, 'TRN', 'TORINO', 6, 'FR 6862', '20:25', '21:45', 'And'),
(266, 'TRN', 'TORINO', 6, 'FR 6862', '14:05', '15:25', 'And'),
(267, 'TRN', 'TORINO', 6, 'FR 6862', '19:30', '20:50', 'And'),
(268, 'TRN', 'TORINO', 6, 'FR 6862', '18:10', '19:30', 'And'),
(269, 'TRN', 'TORINO', 6, 'FR 6862', '18:10', '19:30', 'And'),
(270, 'TRN', 'TORINO', 6, 'FR 6862', '20:20', '21:40', 'And'),
(271, 'TRN', 'TORINO', 6, 'FR 6862', '20:20', '21:40', 'And'),
(272, 'TRN', 'TORINO', 8, 'V7 1853', '14:20', '15:30', 'And'),
(273, 'TRN', 'TORINO', 8, 'V7 1853', '13:35', '14:45', 'And'),
(274, 'TRN', 'TORINO', 8, 'V7 1853', '14:30', '15:40', 'And'),
(275, 'TRN', 'TORINO', 8, 'V7 1853', '15:05', '16:15', 'And'),
(276, 'TRN', 'TORINO', 8, 'V7 1796', '13:05', '14:15', 'Rit'),
(277, 'TRN', 'TORINO', 8, 'V7 1852', '21:00', '22:10', 'Rit'),
(278, 'TRN', 'TORINO', 8, 'V7 1797', '07:00', '08:10', 'And'),
(279, 'TRN', 'TORINO', 8, 'V7 1852', '21:10', '22:20', 'Rit'),
(280, 'TRN', 'TORINO', 8, 'V7 1797', '14:35', '15:45', 'And'),
(281, 'TRN', 'TORINO', 8, 'V7 1797', '13:40', '14:50', 'And'),
(282, 'TRN', 'TORINO', 8, 'V7 1797', '17:55', '19:05', 'And'),
(283, 'TRN', 'TORINO', 8, 'V7 1796', '21:10', '22:20', 'Rit'),
(284, 'TRN', 'TORINO', 8, 'V7 1796', '20:10', '21:20', 'Rit'),
(285, 'TRN', 'TORINO', 3, '0B 4068', '09:45', '11:05', 'And'),
(286, 'TRN', 'TORINO', 3, '0B 4067', '07:40', '09:00', 'Rit'),
(287, 'TRN', 'TORINO', 3, '0B 4068', '15:25', '16:45', 'And'),
(288, 'TRN', 'TORINO', 3, '0B 4067', '13:20', '14:40', 'Rit'),
(289, 'TRN', 'TORINO', 3, '0B 6048', '15:40', '17:00', 'And'),
(290, 'TRN', 'TORINO', 3, '0B 6047', '13:20', '14:40', 'Rit'),
(291, 'TRS', 'TRIESTE', 6, 'FR 5601', '12:55', '14:25', 'Rit'),
(292, 'TRS', 'TRIESTE', 6, 'FR 5600', '10:50', '12:20', 'And'),
(293, 'TRS', 'TRIESTE', 6, 'FR 5601', '12:00', '13:30', 'Rit'),
(294, 'TRS', 'TRIESTE', 6, 'FR 5601', '21:30', '23:00', 'Rit'),
(295, 'TRS', 'TRIESTE', 6, 'FR 5600', '09:55', '11:25', 'And'),
(296, 'TRS', 'TRIESTE', 6, 'FR 5600', '19:25', '20:55', 'And'),
(297, 'BGY', 'BERGAMO', 6, 'FR 7748', '17:10', '18:40', 'Rit'),
(298, 'BGY', 'BERGAMO', 6, 'FR 7748', '15:30', '17:00', 'Rit'),
(299, 'BGY', 'BERGAMO', 6, 'FR 7749', '22:00', '23:30', 'And'),
(300, 'BGY', 'BERGAMO', 6, 'FR 7748', '20:05', '21:35', 'Rit'),
(301, 'BGY', 'BERGAMO', 6, 'FR 4707', '13:20', '14:50', 'And'),
(302, 'BGY', 'BERGAMO', 6, 'FR 4707', '08:50', '10:20', 'And'),
(303, 'BGY', 'BERGAMO', 6, 'FR 4707', '08:50', '10:20', 'And'),
(304, 'BGY', 'BERGAMO', 6, 'FR 4706', '11:25', '12:55', 'Rit'),
(305, 'BGY', 'BERGAMO', 6, 'FR 4706', '06:55', '08:25', 'Rit'),
(306, 'BGY', 'BERGAMO', 6, 'FR 4877', '15:05', '16:35', 'Rit'),
(307, 'BGY', 'BERGAMO', 6, 'FR 4877', '18:10', '19:40', 'Rit'),
(308, 'BGY', 'BERGAMO', 6, 'FR 4876', '17:00', '18:30', 'And'),
(309, 'BGY', 'BERGAMO', 6, 'FR 4876', '20:05', '21:35', 'And'),
(310, 'BGY', 'BERGAMO', 6, 'FR 7749', '15:15', '16:45', 'And'),
(311, 'BGY', 'BERGAMO', 6, 'FR 7749', '17:25', '18:55', 'And'),
(312, 'BGY', 'BERGAMO', 6, 'FR 4706', '10:45', '12:15', 'Rit'),
(313, 'BGY', 'BERGAMO', 6, 'FR 4876', '12:35', '14:05', 'And'),
(314, 'BGY', 'BERGAMO', 6, 'FR 4877', '10:40', '12:10', 'Rit'),
(315, 'BGY', 'BERGAMO', 6, 'FR 4877', '15:30', '17:00', 'Rit'),
(316, 'BGY', 'BERGAMO', 6, 'FR 4876', '17:25', '18:55', 'And'),
(317, 'BGY', 'BERGAMO', 6, 'FR 7749', '18:15', '19:45', 'And'),
(318, 'BGY', 'BERGAMO', 6, 'FR 7748', '16:20', '17:50', 'Rit'),
(319, 'BGY', 'BERGAMO', 6, 'FR 7749', '19:35', '21:05', 'And'),
(320, 'BGY', 'BERGAMO', 6, 'FR 7748', '21:30', '23:00', 'Rit'),
(321, 'BGY', 'BERGAMO', 6, 'FR 4706', '08:30', '10:00', 'Rit'),
(322, 'BGY', 'BERGAMO', 6, 'FR 4706', '08:30', '10:00', 'Rit'),
(323, 'BGY', 'BERGAMO', 6, 'FR 4707', '06:35', '08:05', 'And'),
(324, 'BGY', 'BERGAMO', 6, 'FR 4707', '06:35', '08:05', 'And'),
(325, 'BGY', 'BERGAMO', 6, 'FR 4707', '09:30', '11:00', 'And'),
(326, 'BGY', 'BERGAMO', 6, 'FR 4706', '07:35', '09:05', 'Rit'),
(327, 'BGY', 'BERGAMO', 6, 'FR 7749', '19:25', '20:55', 'And'),
(328, 'BGY', 'BERGAMO', 6, 'FR 7749', '18:10', '19:40', 'And'),
(329, 'BGY', 'BERGAMO', 6, 'FR 7748', '21:20', '22:50', 'Rit'),
(330, 'BGY', 'BERGAMO', 6, 'FR 7748', '16:15', '17:45', 'Rit'),
(331, 'BGY', 'BERGAMO', 2, 'AP 5150', '22:30', '23:50', 'And'),
(332, 'BGY', 'BERGAMO', 2, 'AP 5149', '16:10', '17:30', 'Rit'),
(333, 'BLQ', 'BOLOGNA', 6, 'FR 3969', '13:35', '14:55', 'And'),
(334, 'BLQ', 'BOLOGNA', 6, 'FR 3968', '11:50', '13:10', 'Rit'),
(335, 'BLQ', 'BOLOGNA', 6, 'FR 3969', '12:10', '13:30', 'And'),
(336, 'BLQ', 'BOLOGNA', 6, 'FR 3969', '15:55', '17:15', 'And'),
(337, 'BLQ', 'BOLOGNA', 6, 'FR 3968', '10:25', '11:45', 'Rit'),
(338, 'BLQ', 'BOLOGNA', 6, 'FR 3968', '17:50', '19:10', 'Rit'),
(339, 'BLQ', 'BOLOGNA', 6, 'FR 3969', '12:45', '14:05', 'And'),
(340, 'BLQ', 'BOLOGNA', 6, 'FR 3968', '11:00', '12:20', 'Rit'),
(341, 'BLQ', 'BOLOGNA', 6, 'FR 3969', '17:45', '19:05', 'And'),
(342, 'BLQ', 'BOLOGNA', 6, 'FR 3968', '16:00', '17:20', 'Rit'),
(343, 'BLQ', 'BOLOGNA', 6, 'FR 3969', '12:15', '13:35', 'And'),
(344, 'BLQ', 'BOLOGNA', 6, 'FR 3969', '12:15', '13:35', 'And'),
(345, 'BLQ', 'BOLOGNA', 6, 'FR 3969', '12:15', '13:35', 'And'),
(346, 'BLQ', 'BOLOGNA', 6, 'FR 3968', '10:30', '11:50', 'Rit'),
(347, 'BLQ', 'BOLOGNA', 6, 'FR 3968', '10:30', '11:50', 'Rit'),
(348, 'BLQ', 'BOLOGNA', 6, 'FR 3968', '10:30', '11:50', 'Rit'),
(349, 'OPO', 'PORTO', 6, 'FR 5861', '06:55', '07:55', 'And'),
(350, 'OPO', 'PORTO', 6, 'FR 5860', '09:30', '12:30', 'Rit'),
(351, 'OPO', 'PORTO', 6, 'FR 5860', '16:55', '19:55', 'Rit'),
(352, 'OPO', 'PORTO', 6, 'FR 5861', '14:20', '15:20', 'And'),
(353, 'OPO', 'PORTO', 6, 'FR 5861', '17:45', '18:45', 'And'),
(354, 'OPO', 'PORTO', 6, 'FR 5860', '20:20', '23:20', 'Rit'),
(355, 'CRL', 'BRUXELLES CHARLEROI', 6, 'FR 4829', '13:00', '15:45', 'Rit'),
(356, 'CRL', 'BRUXELLES CHARLEROI', 6, 'FR 4828', '16:10', '18:55', 'And'),
(357, 'CRL', 'BRUXELLES CHARLEROI', 6, 'FR 4828', '09:05', '11:50', 'And'),
(358, 'CRL', 'BRUXELLES CHARLEROI', 6, 'FR 4829', '05:55', '08:40', 'Rit'),
(359, 'CRL', 'BRUXELLES CHARLEROI', 6, 'FR 4829', '14:55', '17:40', 'Rit'),
(360, 'CRL', 'BRUXELLES CHARLEROI', 6, 'FR 4828', '18:05', '20:50', 'And'),
(361, 'SVQ', 'SIVIGLIA', 6, 'FR 6711', '12:55', '16:10', 'And'),
(362, 'SVQ', 'SIVIGLIA', 6, 'FR 6710', '11:15', '12:30', 'Rit'),
(363, 'SVQ', 'SIVIGLIA', 6, 'FR 6711', '10:45', '14:00', 'And'),
(364, 'SVQ', 'SIVIGLIA', 6, 'FR 6711', '10:45', '14:00', 'And'),
(365, 'SVQ', 'SIVIGLIA', 6, 'FR 6711', '20:55', '00:10', 'And'),
(366, 'SVQ', 'SIVIGLIA', 6, 'FR 6710', '09:05', '10:20', 'Rit'),
(367, 'SVQ', 'SIVIGLIA', 6, 'FR 6710', '09:05', '10:20', 'Rit'),
(368, 'SVQ', 'SIVIGLIA', 6, 'FR 6710', '19:15', '20:30', 'Rit'),
(369, 'BCN', 'BARCELLONA', 9, 'VY 6165', '14:30', '17:00', 'And'),
(370, 'BCN', 'BARCELLONA', 9, 'VY 6164', '13:15', '13:45', 'Rit'),
(371, 'BCN', 'BARCELLONA', 9, 'VY 6165', '12:20', '14:50', 'And'),
(372, 'BCN', 'BARCELLONA', 9, 'VY 6165', '11:00', '13:30', 'And'),
(373, 'BCN', 'BARCELLONA', 9, 'VY 6164', '09:45', '10:15', 'Rit'),
(374, 'BCN', 'BARCELLONA', 9, 'VY 6165', '15:00', '17:30', 'And'),
(375, 'BCN', 'BARCELLONA', 9, 'VY 6164', '13:45', '14:15', 'Rit'),
(376, 'BCN', 'BARCELLONA', 9, 'VY 6164', '11:05', '11:35', 'Rit'),
(377, 'BCN', 'BARCELLONA', 9, 'VY 6165', '15:05', '17:35', 'And'),
(378, 'BCN', 'BARCELLONA', 9, 'VY 6165', '15:05', '17:35', 'And'),
(379, 'BCN', 'BARCELLONA', 9, 'VY 6165', '15:05', '17:35', 'And'),
(380, 'BCN', 'BARCELLONA', 9, 'VY 6164', '13:50', '14:20', 'Rit'),
(381, 'BCN', 'BARCELLONA', 9, 'VY 6164', '13:50', '14:20', 'Rit'),
(382, 'BCN', 'BARCELLONA', 9, 'VY 6164', '13:50', '14:20', 'Rit'),
(383, 'KRK', 'CRACOVIA', 6, 'FR 7305', '12:10', '13:40', 'Rit'),
(384, 'KRK', 'CRACOVIA', 6, 'FR 7304', '14:05', '17:35', 'And'),
(385, 'KRK', 'CRACOVIA', 6, 'FR 7304', '09:55', '13:25', 'And'),
(386, 'KRK', 'CRACOVIA', 6, 'FR 7305', '13:50', '15:20', 'Rit'),
(387, 'BUD', 'BUDAPEST', 6, 'FR 5249', '20:05', '22:00', 'And'),
(388, 'BUD', 'BUDAPEST', 6, 'FR 5249', '18:25', '20:20', 'And'),
(389, 'BUD', 'BUDAPEST', 6, 'FR 5248', '17:45', '19:40', 'Rit'),
(390, 'BUD', 'BUDAPEST', 6, 'FR 5248', '16:05', '18:00', 'Rit');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `compagnia`
--
ALTER TABLE `compagnia`
  ADD PRIMARY KEY (`id_compagnia`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`username`);

--
-- Indici per le tabelle `volo`
--
ALTER TABLE `volo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compagnia` (`compagnia`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `compagnia`
--
ALTER TABLE `compagnia`
  MODIFY `id_compagnia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `volo`
--
ALTER TABLE `volo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `volo`
--
ALTER TABLE `volo`
  ADD CONSTRAINT `volo_ibfk_1` FOREIGN KEY (`compagnia`) REFERENCES `compagnia` (`id_compagnia`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
