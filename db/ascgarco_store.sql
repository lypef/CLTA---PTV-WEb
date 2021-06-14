-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-06-2021 a las 21:41:44
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ascgarco_store`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `ubicacion` varchar(254) NOT NULL,
  `telefono` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id`, `nombre`, `ubicacion`, `telefono`) VALUES
(1, 'PABLO', '20 DE NOVIEMBRE 324, COL BARRIO DE LAS FLORES', '2377602'),
(2, 'BENITO', 'PARQUE JUAREZ NO. 9, COL CENTRO', '2372928'),
(3, 'CENTRAL 101', '101', '9231200505'),
(4, 'MARIO', 'J mario rosado', '000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `annuities`
--

CREATE TABLE `annuities` (
  `id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `concepto` varchar(254) NOT NULL,
  `price` float NOT NULL,
  `date_ini` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `annuities`
--

INSERT INTO `annuities` (`id`, `client`, `concepto`, `price`, `date_ini`, `date_last`, `active`) VALUES
(4, 210, 'Anualidad CFDI', 1800, '2018-11-01 12:00:00', '2020-10-31 20:55:21', 1),
(6, 212, 'Anualidad CFDI', 1900, '2019-03-29 12:00:00', '2020-06-30 14:40:36', 1),
(7, 213, 'Anualidad CFDI', 1900, '2019-04-17 12:00:00', '2021-04-30 15:29:31', 1),
(8, 214, 'Anualidad CFDI', 1700, '2019-05-30 12:00:00', '2019-05-30 12:00:00', 0),
(9, 215, 'Anualidad CFDI', 1900, '2019-09-01 12:00:00', '2020-09-28 19:31:10', 1),
(10, 199, 'Anualidad CFDI', 1900, '2019-10-30 14:37:47', '2020-10-31 20:54:58', 1),
(13, 277, 'Anualidad CFDI , CABB891111CL8', 1900, '2020-02-21 11:02:15', '2021-01-13 10:50:38', 1),
(15, 282, 'moamao-tpv.com + certificado digital, anualidad. ', 1300, '2020-04-04 16:04:02', '2020-04-04 16:04:02', 0),
(16, 290, 'anualidad rfc GIA100728216 , GIC040830321', 1900, '2020-06-01 12:25:48', '2021-05-17 11:12:26', 1),
(17, 154, 'eNVIOS DE CORREO ELECTRONICA', 100, '2020-07-17 12:13:41', '2020-07-17 12:13:41', 1),
(23, 284, 'CMA191128DK6 Anualidad Cfdi', 1900, '2020-08-04 19:22:05', '2020-08-04 19:22:05', 1),
(24, 359, 'Anualidad CFEDI', 1900, '2021-03-22 00:40:48', '2021-03-22 00:40:48', 1),
(26, 292, 'ANUALIDAD CFDI RFC: SHE200929S97', 1900, '2021-04-28 18:38:13', '2021-04-28 18:38:13', 1),
(27, 348, 'CFDI ANUALIDAD GAGJ8209199N7', 1900, '2021-05-06 22:34:07', '2021-05-06 22:34:07', 1),
(28, 348, 'CFDI ANUALIDAD GAGJ8209199N7 $ 1900', 1900, '2021-05-29 12:17:05', '2021-05-29 12:17:05', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `direccion` varchar(254) NOT NULL DEFAULT '',
  `telefono` varchar(254) NOT NULL,
  `descuento` int(11) NOT NULL,
  `rfc` varchar(254) NOT NULL DEFAULT '',
  `razon_social` varchar(254) NOT NULL DEFAULT '',
  `correo` varchar(254) NOT NULL,
  `prospecto` tinyint(1) NOT NULL DEFAULT 0,
  `interes` varchar(254) NOT NULL DEFAULT '',
  `c_entero_nosotros` varchar(254) NOT NULL DEFAULT '',
  `user` int(11) NOT NULL,
  `creado` date NOT NULL,
  `clasificacion` varchar(254) NOT NULL DEFAULT 'B'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `nombre`, `direccion`, `telefono`, `descuento`, `rfc`, `razon_social`, `correo`, `prospecto`, `interes`, `c_entero_nosotros`, `user`, `creado`, `clasificacion`) VALUES
(1, 'PUBLICO EN GENERAL', 'Dirección de cliente demo ', '923120050', 0, 'XAXX010101000', 'PUBLICO EN GENERAL', 'ventas@cyberchoapas.com', 0, '', '', 1, '2021-06-14', 'B'),
(154, 'CARLOS CUEVAS', 'CORDILLERA HIMALAYA 3961  COLINAS DEL PONIENTE  QUERETARO, QRO', '+52 1 442 173 2721', 15, 'GYM081030CJ3', 'GYMSPORT SA DE CV', 'carlos.gymsport@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(155, 'RICARDO ALONSO AVILA', '', '55 2726 5055', 15, 'AOAR9110234A9', 'RICARDO ALONSO AVILA', 'rikrdometal@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(158, 'Maestro Elier', '', '9231056364', 0, '', '', 'elhackers2013@HOTMAIL.COM', 0, '', '', 1, '2021-06-14', 'B'),
(159, 'JORGE BENITEZ | ISA INDUSTRIAL', '', '', 0, '', 'ISA INDUSTRIAL', 'jbenitezhdz@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(161, 'MARIO ALBERTO BARAJAS', '', '+52 1 6181335695', 0, '', '', 'mario.barajas@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(162, 'Francisco Herrera Arriaga', '', '', 15, '', '', 'zhero49@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(163, 'LUIS ENRIQUE ALVAREZ ', '', '', 0, '', '', 'luenalgo@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(164, 'BEULAH VIRIDIANA CAMARILLO', '', '', 0, '', 'COMPUNET', 'viridiana.camarillo@compunetmexico.com', 0, '', '', 1, '2021-06-14', 'B'),
(167, 'ENRIQUE JAVIER GUZMAN DE LA CRUZ', '', '', 0, '', 'U. TEC. GUTIERREZ SAMORA', 'enrique.guzman@utgz.edu.mx', 0, '', '', 1, '2021-06-14', 'B'),
(168, 'FRANCISCO OLVERA', '', '', 0, '', '', 'folveras@icloud.com', 0, '', '', 1, '2021-06-14', 'B'),
(169, 'DIEGO CORONA ZAMBRANO', '', '', 0, '', '', 'diego.corona18@outlook.com', 0, '', '', 1, '2021-06-14', 'B'),
(170, 'GUILLERMO PRIETO GERONIMO', '', '', 0, '', '', 'memoprieto3010@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(179, 'SOFIA VAZQUES MORALES', '20 DE NOVIEMBRE , FNT. COPPEL', '', 0, '', 'OPTICA IRAIS', '', 0, '', '', 1, '2021-06-14', 'B'),
(180, 'JORGE SIERRA NERIA', '', '', 0, 'SINJ931227923', 'JORGE SIERRA NERIA', 'j.sierra3113@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(181, 'JHONATAN IVAN SANTOYO MATEO', '', '', 0, '', '', 'jivansantoyo@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(182, 'ABRAHAM IVAN CAMACHO MOJICA', '', '', 15, '', '', 'inmobiliariabkl@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(183, 'Javier OSORIO IBARRA ', '', '', 0, '', '', 'javier_osorio_ibarra@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(184, 'ISC.  EDGAR MeNDEZ ', '', '', 0, 'IVD990911KU1', 'INSTITUTO VERACRUZANO DEL DEPORTE SIN TIPO DE SOCIEDAD', 'edgarmendez1087@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(185, 'JOSE DE JESUS GONZALES REYNA', '', '', 0, '', '', 'pumagym1987@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(186, 'MAURICIO MENA VALDIVIA ', '', '', 0, '', '', 'maurmenav@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(187, 'PABLO HERNANDEZ VILLARREAL', '', '', 0, 'GAV970331L29', 'GRUAS Y TRANSPORTES VELASQUEZ S.A DE C.V', 'guillermo.gonzales@gavsa.com.mx', 0, '', '', 1, '2021-06-14', 'B'),
(188, ' FERNANDO MIGUEL FLORES MARTINEZ', '', '', 0, '', '', 'nokian95nam@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(189, 'CITLALI ALVAREZ', '', '', 0, '', '', 'citlali_cesar@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(190, 'RAFAEL DAVID MATEO', '', '', 0, '', '', 'El-deivi02@live.com', 0, '', '', 1, '2021-06-14', 'B'),
(191, 'STIVEN GONZALEZ GUARIN', '', '', 0, '', '', 'stivengg90@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(192, 'JOSE ALBERTO MONTENEGRO RAMIREZ', '', '', 0, '', '', 'beda.montenegro@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(194, 'ISAAC SIERRA', '', '', 0, '', '', 'sierraisaac01@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(195, 'LAWRENCE OLIVARES', '', '', 0, '', '', 'lawrencediaz2219@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(196, 'LUIS ZAMBRANO', '', '', 0, '', '', 'Luisillo515@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(197, 'JOSE ERNESTO HERNANDEZ HERNANDEZ', '', '', 0, '', '', 'je_250810@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(198, 'MILANO', '', '', 0, 'DIS880803JW8', 'MILANO OPERADORA S.A DE C.V', 'tda3042@milano.com', 0, '', '', 1, '2021-06-14', 'B'),
(199, 'MARCO ANTONIO AYALA GUDIÑO', '', '', 0, 'AAGM700914547', 'Marco Antonio Ayala Gudiño ', 'alp.ingeniero@gmail.com,kalihotel@outlook.es', 0, '', '', 1, '2021-06-14', 'B'),
(200, 'HOTEL CASA ROMA', '', '', 0, 'AATD781127MZ8', 'DANIA ELIBETH ALARCON TOVAR ', 'Hotelcasaroma@outlook.com', 0, '', '', 1, '2021-06-14', 'B'),
(201, 'ARTURO GALLARDO MEDINA', '', '', 0, '', '', 'ar.gallardo.m@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(202, 'HOMERO CHAVEZ ', '', '', 0, '', '', 'hchavezm9@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(203, 'CARLOS EDUARDO NAVA CUELLAR ', '', '', 0, '', '', 'Carloseduardo_nava@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(205, 'MIGUE PANTIGA', '', '', 0, '', '', 'cp_pantiga@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(206, 'HECTOR LOMAS ', '', '', 0, '', '', 'ecko_dnc@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(207, 'GERMáN HERNáNDEZ BLANCAS ', '', '', 0, '', '', 'german.h.b@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(208, 'ISIDORA IRMA BAUTISTA VELAZQUEZ', '', '', 0, 'BAVI5404043C1', 'ISIDORA IRMA BAUTISTA VELAZQUEZ', 'livsanchez@msn.com', 0, '', '', 1, '2021-06-14', 'B'),
(210, 'ALFONSO LOAIZA LOEZA ', '', '', 0, '', '', 'alfonsoloaiza@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(211, 'HOTEL PLAYA DEL REY', '', '', 0, 'RIM1707126W2', 'RIMCLAT, S.A. DE C.V.', 'brendaplayadelrey@gmail.com,recepcion@hotelplayadelrey.com.mx', 0, '', '', 1, '2021-06-14', 'B'),
(212, 'LUZ MARIA MEDINA MUCIÑO', '', '+52 7731998020', 0, 'MEML580110KYA', 'LUZ MARIA MEDINA MUCIÑO', 'mego5604@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(213, 'ANABELL CORDOVA LORETO', '', '', 0, 'COLA920825DY7', 'ANABELL CORDOVA LORETO', 'francisco.macias@grupomacogas.mx', 0, '', '', 1, '2021-06-14', 'B'),
(214, 'HOTEL SAN JOSE TEXMELUCAN', '', '', 0, '', '', 'hoteles.restaurantes.smt@outlook.com', 0, '', '', 1, '2021-06-14', 'B'),
(215, 'HOTEL CASA DE LOS ROMBOS', '', '', 0, 'CAD1709061CA', 'CIUDAD ANTIGUA DESARROLLOS DE INVERSION SA DE CV', 'enlacearq.conta@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(216, 'TITO CALLEJA LOPEZ', '', '', 0, '', '', 'remodelacionescalleja@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(217, 'Rafael Pinto', '', '', 0, '', '', 'bootcampuy@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(218, 'IVAN FERNANDEZ', '', '', 40, '', '', 'ministeriumcr@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(219, 'ING. GILBERTO RAMíREZ CORREA', '', '', 0, '', 'SOFTBOX ZACATECAS', 'softboxzac@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(220, 'ALBERTO GALLEGOS GODINEZ ', '', '', 0, '', '', 'soporte.08.89@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(221, 'KARLA MUñOZ', '', '', 0, '', '', 'kam_24_8@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(222, ' ING. JOSE LUIS CELAYA', '', '', 0, '', '', 'direccion@grupoabys.com.mx', 0, '', '', 1, '2021-06-14', 'B'),
(223, 'FRANKLYN CRISOSTOMO LUCIANO', '', '', 0, '', '', 'crisostomofranklin@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(224, 'TOMAS ANTONIO ARIAS', '', '', 0, '', '', 'gamer-antonio@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(225, 'STAR ZONE GYM', '', '', 0, '', '', 'delamazaleon17@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(226, ' CARLOS IVAN DUARTE MEJíA', '', '', 0, '', '', 'carlos_ivan_mej@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(227, 'LUIS MONDRAGON', '', '', 0, '', '', 'lmondragon00@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(228, 'JULIO CESAR CABALLERO FERNANDEZ', '', '', 0, 'CAFJ880722J74', 'JULIO CESAR CABALLERO FERNANDEZ', 'Juliocaballero2001@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(229, 'MYHOTEL SPA', ' COMERCIAL: KENNEDY 3886, VITACURA, SANTIAGO, CHILE', '', 0, 'RUT: 76.377.708-1', ' DESARROLLO Y COMERCIALIZACIóN DE SOFTWARE MYHOTEL SPA', 'cobranza@myhotel.com.es', 0, '', '', 1, '2021-06-14', 'B'),
(230, 'NINA STRUNK', '', '', 0, '', '', 'nilou.h@web.de', 0, '', '', 1, '2021-06-14', 'B'),
(231, 'SUSANA JIMEVILLA', '', '', 0, '', '', 'confeccionesjimevilla@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(232, 'JESUS ALVARADO', '', '', 0, '', '', 'jesus.chivas64@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(233, 'JULIO O. CALDERóN PACHECO', '', '', 0, '', '', 'julio-pacheco@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(234, 'CESAR ORTEGA MAYA', '', '', 0, '', 'SCOM GYM', 'comsesar@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(240, 'LUIS NAVARRETE', '', '', 0, 'TBC121206PD0', 'Title Boxing Club SA DE CV', 'luis.navarrete@titleboxingclub.com', 0, '', '', 1, '2021-06-14', 'B'),
(241, 'JULIO ANAYA', '', '', 0, '', '', 'julio.jesus@metasoftica.com', 0, '', '', 1, '2021-06-14', 'B'),
(242, 'LEONARDO CUEVAS ', '', '', 15, '', 'INSSOLC', 'cuevas2708@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(243, 'BRYAN AURELIANO MARTIN TOSTADO', '', '', 0, '', 'HECTOR MARTíN TOSTADO', 'Bryan_Aureliano@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(244, 'ROGELIO VAZQUEZ NEVÁREZ ', '', '', 0, 'VANR830811S35', 'ROGELIO VAZQUEZ NEVÁREZ', 'pctecnicajuarez@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(245, 'MARIELA REYES PIMENTEL', '', '', 0, 'REPM761023TY4', 'MARIELA REYES PIMENTEL', 'berelchoapas@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(246, 'SMY GYM FITNESS', '', '', 0, '', 'SMY GYM FITNESS', 'smy.gym.oficial@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(247, 'LEOPOLDO SALAZAR VAZQUEZ', '', '', 0, '', '', 'ventas@secutam.com', 0, '', '', 1, '2021-06-14', 'B'),
(248, 'CéSAR ORTEGA MAYA', '', '', 0, '', '', 'comsesar@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(249, 'DANIEL MARQUEZ', '', '', 0, '', '', 'marquez.fm@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(250, 'CARLOS YANUARIO AVILA CHI', '', '', 0, '', '', 'lc.carlosavila@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(251, 'NEFI GARCES ARVIZU', '', '', 0, '', 'NEFI GARCES ARVIZU', 'negazu16@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(252, 'JAIME GOMAR MUNGUIA ', '', '', 0, 'GOTJ5607265E3', 'Jaime gomar torres ', 'jimygom@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(253, 'KEVIN ANTONIO REYNOSO ALONSO', '', '', 0, 'REAK940430BD3', 'KEVIN ANTONIO REYNOSO ALONSO', 'elias.fdzb@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(254, 'GEPSO TECNOLOGíA EN PREVENCIóN AVANZADA S.A. DE C.V.', '', '', 0, 'GTP0608074V0', 'GEPSO TECNOLOGíA EN PREVENCIóN AVANZADA S.A. DE C.V.', 'grupo.pozos@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(255, 'GABRIEL AGUIRRE OLVERA', '', '', 0, '', '', 'gabriel.aguirre@vinte.com', 0, '', '', 1, '2021-06-14', 'B'),
(256, 'ADRIAN GUSTAVO MAMANI CARO', '', '', 0, '', 'ATOMIC GYM', 'mamanicaroo@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(257, 'ANA KAREN GUDIñO DE LEóN ', '', '', 0, '', '', 'fco.reyes.ochoa@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(258, 'ANA PATRICIA CORDOVA OLAN ', '', '', 0, 'COOA891108KE3', 'ANA PATRICIA CORDOVA OLAN ', 'senusa@outlook.com', 0, '', '', 1, '2021-06-14', 'B'),
(259, 'GUZMAN JORGE QUISPE HUAMANI', '', '', 0, '', '', 'jorgequispe.huamani@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(260, 'JUDITH GABRIELA QUISPE MARZE', '', '', 0, '', '', 'getfit031213@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(262, 'CHRISTIAN JAVAN HERNANDEZ', '', '', 0, '', '', 'Christian.javan@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(263, ' Juan fernando Ramírez Varela', '', '', 0, 'ravj700209ila', ' Juan fernando Ramírez Varela', 'yaid10@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(264, 'RAFAEL SOLANO TORRES', '', '', 0, '', '', 'rafael777s@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(265, 'JAHUDIEL TANORI', '', '', 0, '', 'MINING CAMP SOLUTIONS', 'miningcampsolutions@outlook.com', 0, '', '', 1, '2021-06-14', 'B'),
(266, 'ECOFITNESS GYM', '', '', 0, '', '', 'ecofitness@live.com.mx', 0, '', '', 1, '2021-06-14', 'B'),
(268, 'DAVID DIAZ CRUZ', '', '', 0, '', '', 'wsdbolivia@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(269, 'SANDRA CORTEZ', '', '', 0, '', '', 'Sandruchis_yo@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(270, 'Cynthia Cristina Salazar Ruiz', '', '', 0, 'SARC650306NM3', 'Cynthia Cristina Salazar Ruiz', 'e.facturacion2018@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(271, 'JORGE AMADO SáNCHEZ', '', '', 0, '', '', 'ing.jorgeamado@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(272, 'MIGUEL FERNANDO LADINO PULIDO', '', '', 0, '', '', 'Miguel.ladino1548@correo.policia.gov.co', 0, '', '', 1, '2021-06-14', 'B'),
(273, ' NESA SERVICIOS HOTELEROS SA DE CV', '', '', 0, 'NCO1404092F0', ' NESA SERVICIOS HOTELEROS SA DE CV', 'nesacom@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(274, 'HELENA PADILLA', '', '', 0, '', '', 'helena.lylu@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(275, 'AVELINO BENIGNO VILLA SALAS', '', '', 0, 'VISA391116P30', 'AVELINO BENIGNO VILLA SALAS', 'abvillasalas@aevitas.com.mx', 0, '', '', 1, '2021-06-14', 'B'),
(276, 'CESAR LUIS ABAD ESTUDILLO HUERTA', '', '', 0, '', '', 'cesarestudillo93@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(277, 'HOTEL PLAZA MANGOS', '', '', 0, '', 'HOTEL PLAZA MANGOS', 'reservaciones@hotelplazamangos.com', 0, '', '', 1, '2021-06-14', 'B'),
(278, 'DEBORA LIZETH SANCHEZ HERNANDEZ', '', '', 0, 'SAHD890607GZ2', 'DEBORA LIZETH SANCHEZ HERNANDEZ', 'rafaelrburguete@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(279, 'HOTEL CASA MARAN', '', '', 0, '', '', 'hotelcasamaran@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(280, 'JESUS EMMANUEL MORA', '', '', 0, '', '', 'alarmasmora@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(281, 'ANITA PAT MAGAÑA', '', '', 10, 'PAMA520104UA5', 'ANITA PAT MAGAÑA', 'Ventas.multicomputo@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(282, 'MARCELINO ALBERTO RAMíREZ MONTIEL ', '', '', 0, 'RAMM8608122B0', 'MARCELINO ALBERTO RAMíREZ MONTIEL ', 'ramirez.marcelino@gmail.com,contabilidad@promarco.mx', 0, '', '', 1, '2021-06-14', 'B'),
(283, 'YAMIR BENNETTS CAMPOS CORREO', '', '', 0, '', '', 'yamirbennetts@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(284, 'ISMAEL PARRA MARTíNEZ', '', '', 0, '', 'HOTEL CASA MARIANO', 'casamarianohotelboutique@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(285, 'SOPORTE ELEKTRA', '', '', 0, 'AIR080523UMA', 'ADMINISTRACION INTEGRAL DE REDES RI', 'seguimientos@rintegral.com.mx', 0, '', '', 1, '2021-06-14', 'B'),
(286, 'RICARDO AGUILAR ', '', '', 0, '', '', 'raguilar1037@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(287, 'ARTURO GALINDO BAZA', '', '733390990', 0, '', '', 'coronita212@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(288, 'RAúL ESTRADA SANTIAGO', '', '', 0, '', '', 'raulstradas@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(289, 'GREGORIO MELGAR ESPINOZA', '2A. AVENIDA NORTE 6, COL. CENTRO. CP 30700', '', 0, 'MEEG650312262', 'GREGORIO MELGAR ESPINOZA', 'elbarondetapachula@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(290, 'ALEJANDRO CAFETOS', 'calle del retorno entre carretera federal fortin- orizaba y 9 sur fortin  - centroAutopista Córdoba-Orizaba Km 290+750 S/N Córdoba, Ver.', '', 0, 'GIC040830321', 'Grupo Inmobiliario de Córdoba SA de CV', 'alejandro.cafetos@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(291, 'JOEL JIMENEZ PEREZ', '', '', 0, '', '', 'joeljperez@zoho.com', 0, '', '', 1, '2021-06-14', 'B'),
(292, 'YESICA NOEMI JAIME RIOS', '', '', 0, '', '', 'yesica_jrios@outlook.com', 0, '', '', 1, '2021-06-14', 'B'),
(293, 'CHRISTOPHER GERARDO PéREZ VARELA', '', '', 0, 'VAHL600421GW5', '', 'calzadodeportivoktto@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(294, 'GRUPO LASA MEX', '', '', 0, 'FOMG6103024A6', 'GUADALUPE FLORES MENDOZA', 'gerencia.general@grupolasamex.com', 0, '', '', 1, '2021-06-14', 'B'),
(295, 'ING. DARINEL SANCHEZ LOPEZ', '', '', 0, '', 'CIBER MUNDO', '', 0, '', '', 1, '2021-06-14', 'B'),
(296, 'VICTORIA MORGADO MARTINEZ', '', '', 5, '', 'CIBER GAME CASH', 'Cashgamer04@outlook.com', 0, '', '', 1, '2021-06-14', 'B'),
(297, 'ELVIS DE LOS SANTOS', '', '8099827673', 0, '', 'Elvis sucurity', 'elvisdelossantos@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(298, 'ANTONIO CARRANZA VELAZQUEZ ', '', '', 0, 'CAVA460707EI8', 'ANTONIO CARRANZA VELAZQUEZ ', 'youngexcursionsmexico@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(299, 'CRISTIAN DANIEL GUZMAN DIAZ DE LEON', '', '', 0, '', '', 'danguz1324@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(301, 'MIGUEL BENITEZ VALENCIA', '', '', 0, 'OOS200206EV1', 'OXYGEN OSMI S.A.S', 'ma_valencia@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(302, 'FARMACIA GUADALAJARA, SA. DE C.V', '', '', 0, 'FGU830930PD3', 'FARMACIA GUADALAJARA, SA. DE C.V', 'jesusmonts90@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(303, 'MARIO SANDOVAL', '', '', 0, '', '', 'killer_jrloco@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(304, 'EDUARDO TOLENTINO PEREZ', '', '', 0, '', '', 'publicidad_en_metal@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(305, 'JAHUDIEL TANORI', '', '', 0, '', 'JAHUDIEL TANORI', 'jtanmar@live.com', 0, '', '', 1, '2021-06-14', 'B'),
(306, 'NALLELY GASTELUM LEPRO', ' ', '', 0, '', 'LATINOS GYM', 'lunallely_7@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(307, 'NOTARIA 24', '', '', 0, '', 'NOTARIA 24', 'jjerez@n24ver.com', 0, '', '', 1, '2021-06-14', 'B'),
(308, 'ROBERTO PEREZ', '', '', 0, '', 'ESC. RETER', 'betooo_1998@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(309, 'JOSé ORTEGA SáNCHEZ ', '', '', 0, '', 'JOSé ORTEGA SáNCHEZ ', 'josepe655@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(310, 'GUADALUPE CISNEROS', '', '', 0, '', 'HOTEL VALLARTA', 'lupitacf@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(311, 'SILVIA REYES QUIROZ ', '', '', 0, '', 'SILVIA REYES QUIROZ ', 'silviareyes02@yahoo.com.mx', 0, '', '', 1, '2021-06-14', 'B'),
(312, 'KEVIN OSWALDO NUñEZ LóPEZ', '', '', 0, '', 'GRAVITY GYM', 'oswaldonunezlopez@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(313, 'JAVIER SOTO ORDUÑO', '', '', 0, '', 'ALFA BODY GYM', 'javiersoto.abogado@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(314, 'PASTELERIA SESI GOURMET', '', '', 0, '', 'PASTELERIA SESI GOURMET', '', 0, '', '', 1, '2021-06-14', 'B'),
(315, 'EDGAR ADAYA AGUIRRE', '', '', 0, '', 'DANGER GYM', 'danger2882@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(316, 'CITLALI ALONSO', '', '', 0, '', 'OH FITNESS GYM', 'lali_mayoreo@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(317, 'ROSA VASQUEZ', '', '', 0, '', 'ANIMARE GYM', 'rositavasquezrapanui@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(318, 'DANIEL ARRIAGA MEDINA', '', '', 0, '', 'JUNIOR GYM', 'arriaga0495@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(319, 'JOSUE DELGADO ULLOA', '', '', 0, '', 'COLOMBUS GYM', '', 0, '', '', 1, '2021-06-14', 'B'),
(320, 'AMER ANSELMO RIVAS CASTRO', '', '', 0, '', '', '', 1, '', '', 1, '2021-06-14', 'B'),
(321, 'LUIS CRUZ MENDEZ (120200619184843)', '', '', 0, '', 'LUIS CRUZ MENDEZ ', '', 0, '', '', 1, '2021-06-14', 'B'),
(322, 'BENJAMIN RODRIGUEZ', '', '', 0, '', 'BENJAMIN RODRIGUEZ', 'r.h.benjamin@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(323, 'ELVIS DE LOS SANTOS DE LOS SANTOS', 'CALLE 13 #105 SECTOR 27 FEBRERO', '18099827673', 0, '', 'ELVIS SECURITY', 'elvisdelossantos@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(324, 'NORMAN PEñA ESPINOSA', '', '', 0, '', 'ZONA BOX', 'chots15@hotmail.con', 0, '', '', 1, '2021-06-14', 'B'),
(325, 'MARIA DEL CARMEN MENDEZ PONCE', '', '', 0, '', 'CASA DE JUAN HOSTAL', 'casadejuanhostal@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(326, 'COMERCIALIZADORA FARMACEUTICA DE CHIAPAS SAPI DE CV', '', '', 0, '', '', '', 0, '', '', 1, '2021-06-14', 'B'),
(327, 'MARIO PEREZ PLATA', '', '5540055290', 0, 'PEPM6805232E5', 'MARIO PEREZ PLATA', 'coinsis@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(328, 'MAXXIM INDUSTRIES, S.A. DE C.V.', '', '', 0, '', '', 'Noel@maxximindustries.com', 0, '', '', 1, '2021-06-14', 'B'),
(329, 'EVA HASAN TORRES', '', '', 0, '', 'EVA HASAN TORRES', 'evaminimalfitnessclub@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(330, 'URBANO GALLEGOS', '', '', 0, '', 'CASCADA  GARRUÑO', 'lacascadacal@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(331, 'JOSé LUIS GARCíA', '', '', 0, '', 'JOSé LUIS GARCíA', 'gabe2409@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(332, 'BRAULIO CHAGILA', '', '', 0, '', '', 'brlchgll@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(333, 'YADIRA MIKELLY JUAREZ', '', '', 0, '', 'BODYPOMP GYM', 'mikelly8090@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(334, 'ROSA ELENA MERINO', '', '', 0, '', 'BAJACOM SERVICIOS INFORMATICOS', 'administracion@bajacom.net', 0, '', '', 1, '2021-06-14', 'B'),
(335, 'BERNARDO VáZQUEZ MORALES ', '', '', 0, '', 'FIT GYM', 'dulcilandia_mich@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(336, 'MAURICIO MARTíNEZ RODRíGUEZ', '', '', 0, '', 'CCA CONSULTORíA, CONTABILIDAD Y ADMINISTRACIóN', 'mmrikmh@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(337, 'FERNANDO QUETZALCóATL MOCTEZUMA PEREDA', '', '', 0, '', '', '', 0, '', '', 1, '2021-06-14', 'B'),
(338, 'BEATRIZ SANCHEZ GARCIA ', '', '', 0, '', 'HOTEL DALIAS SUITES ACAPULCO ', 'hoteldaliascentro@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(339, 'JESSICA LOPES REYES', '', '', 0, '', 'ELITE FITNESS', 'jessiclopez27@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(340, 'BAYRON ZABALA', '', '', 0, 'B&G BAGELS CATERING', '', 'bgbagels@optimum.net', 0, '', '', 1, '2021-06-14', 'B'),
(341, 'ROSARIO OVIEDO', '', '4423536517', 0, '', '', 'rosario.oviedo@siasd.mx', 0, '', '', 1, '2021-06-14', 'B'),
(342, 'GYM MULTIPOWERS', '', '+591 65415788', 0, '', 'GYM MULTIPOWERS', 'robertocarlos176@gmail.com', 1, '', '', 1, '2021-06-14', 'B'),
(343, 'KAREN FERNáNDEZ PEGUERO ', '', '', 0, '', ' KF SPORT GYM', 'kfsportgym@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(344, 'ARMANDO CERVERA', '', '', 0, '', 'RHINO GYM', 'armando_jcl@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(345, 'CIVILTA CONSTRUCCIONES INTEGRALES S.A. DE C.V', '', '', 0, 'CCI050623RT9', 'CIVILTA CONSTRUCCIONES INTEGRALES S.A. DE C.V', 'arturocivil2@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(346, 'DIMITRI CANO SIERRA', '', '', 0, '', '', 'digicom_tech@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(347, 'LIC. CRISTINA', '', '', 0, '', 'NOTARIA 24', '', 0, '', '', 1, '2021-06-14', 'B'),
(348, 'JORGE LUIS GARZA GUAJARDO', '', '+52 1 81 1065 6665', 0, 'GAGJ8209199N7', 'JORGE LUIS GARZA GUAJARDO', 'elprincipalhotel@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(349, 'ARMANDO ARTURO BARRERA ARJONA', '', '', 0, '', 'EXPLOSIVE FITNESS & HEALTHY CENTER', 'barrera.arjona@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(350, 'ICG GROUP S.A. DE C.V.', '', '', 0, 'IGR030825FX7', 'ICG GROUP S.A. DE C.V.', 'Ygarcia@icggroup.com.mx', 0, '', '', 1, '2021-06-14', 'B'),
(351, 'HéCTOR MARTíNEZ RUíZ SCR ', '', '', 0, '', '', 'opqr6@hotmail.com', 1, '', '', 1, '2021-06-14', 'B'),
(352, 'JAIRO ORTIZ', '', '', 0, '', '', 'hemisgym@gmail.com', 1, '', '', 1, '2021-06-14', 'B'),
(353, 'ING. PHILLIPS CAMACHO', '', '+57 313 5327395', 0, '', '', 'Phillipscamacho14@gmail.com', 1, '', '', 1, '2021-06-14', 'B'),
(354, 'ADRIANA HERNANDEZ CHAPA', '', '', 0, '', 'MOTEL EL DESEO ', 'eldeseo_motel@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(355, 'JUAN JOSE GIRON QUIÑONES', '', '', 0, '', '', 'juanjomex@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(356, 'JESUS DAVID', '', '+52 1 311 167 2938', 0, '', '', 'gerencia_girasoles@hotmail.com', 1, '', '', 1, '2021-06-14', 'B'),
(357, 'ORLANDO SANCHEZ', '', '', 0, '', 'CARIBBEAN TOP TEAM', 'tiky95pr@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(358, 'ADRIANA LIZBETH VARGAS RAMOS ', '', '', 0, '', 'TRáMITES ARLITZ ', '', 0, '', '', 1, '2021-06-14', 'B'),
(359, 'CARALAMPIA DEL CARMEN GORDILLO ABADIA', '', '', 0, '', 'HOTEL PUERTA SUR ', 'jguilleng@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(360, 'JULIO CéSAR GUILLEN GORDILLO', '', '', 0, '', 'PICA ALITAS ', 'jguilleng@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(361, 'ALEJANDRO BUSTOS', '', '', 0, '', 'LBR FIT', 'arqaobg@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(362, 'SANDRA LIZBETH FABIAN GONZáLEZ', '', '', 0, '', 'VIDA FITNESS GYM', 'Lizbethprincess2008@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(363, 'MOISES SAENZ ESCOBAR', '', '', 0, '', 'SUBLIMINAL GYM', 'MOISESESCOBAR09@GMAIL.COM', 0, '', '', 1, '2021-06-14', 'B'),
(364, 'LEM RICARDO ZEPEDA', '', '', 0, '', '', 'cliffcompany@cliff.com.mx', 1, '', '', 1, '2021-06-14', 'B'),
(365, 'EDGAR ROJAS', '', '+52 1 55 1301 5850', 0, '', '', 'dtxeard@gmail.com', 1, '', '', 1, '2021-06-14', 'B'),
(366, 'ANGELO RAMIREZ GARCIA', '', '', 0, '', 'ANGELO RAMIREZ GARCIA', '', 0, '', '', 1, '2021-06-14', 'B'),
(367, 'FRANCIS MOLINA GAMBOA', '', '', 0, '', 'BLACK GYM', 'Gamboa_sanchez@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(368, 'ANTONIO VIRTO', '', '', 0, '', '', 'antoniovirto@hitocampamentos.com.mx', 0, '', '', 1, '2021-06-14', 'B'),
(369, 'ROSI FERNáNDEZ', '', '', 0, '', 'HOTEL GUADALAJARA EXPRESS', 'Hotelguadalajaraexpress@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(370, 'HECTOR JASSO CORTES', '', '', 0, '', '', 'admon@jascort.com', 1, '', '', 1, '2021-06-14', 'B'),
(371, 'LUIS FERNANDO ZAMORA GUTIERREZ', '', '', 0, '', ' KRATOS   GYM', 'cpfzamora@yahoo.com.mx', 0, '', '', 1, '2021-06-14', 'B'),
(372, 'HITO EXPLORACIONES Y PERFORACIONES BB S DE RL DE CV ', '', '', 0, 'HEP1002045TA', 'HITO EXPLORACIONES Y PERFORACIONES BB S DE RL DE CV ', 'ivettescalante1@hotmail.con', 0, '', '', 1, '2021-06-14', 'B'),
(373, 'CIBER HIDALGO', '', '', 0, '', 'CIBER HIDALGO', '', 0, '', '', 1, '2021-06-14', 'B'),
(374, 'DANIEL VALENTIN CABRALES GOMEZ', '', '', 0, '', 'SOLUCIONES DEPORTIVAS DE TABASCO SA DE CV', 'sdtabasco@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(375, 'RAUL PEñA BUENROSTRO', '', '', 0, '', 'VOLUTION FITNESS', 'acuarius.rulz@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(376, 'OMAR DE ANDA OLMOS', '', '', 0, '', '', 'omarolmos81@gmail.com', 1, '', '', 1, '2021-06-14', 'B'),
(377, 'DIONICIO JIMENEZ FRIAS', '', '', 0, '', '', 'DJIMENEZFR@GMAIL.COM', 1, '', '', 1, '2021-06-14', 'B'),
(378, 'CYNTIA SOLIS', '', '+52 1 33 1118 8457', 0, '', '', 'cyntiasolis@hotmail.com', 1, '', '', 1, '2021-06-14', 'B'),
(379, 'GERARDO JUAREZ CUELLAR', '', '', 0, '', 'GOLDS GYM SPORT', 'gerardojuarezcuellar@hotmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(382, 'TECNOCLICKS', '', '5219842765440', 0, '', '', '', 1, '', '', 1, '2021-06-14', 'B'),
(383, 'EL MEJOR CLIENTE', '', '51957691866', 0, '', '', '', 1, '', '', 1, '2021-06-14', 'B'),
(384, 'EL MEJOR CLIENTE', '', '5217441589163', 0, '', '', '', 1, '', '', 1, '2021-06-14', 'B'),
(385, 'EL MEJOR CLIENTE', '', '51957691866', 0, '', '', '', 1, '', '', 1, '2021-06-14', 'B'),
(386, 'EL MEJOR CLIENTE', '', '56994484594', 0, '', '', '', 1, '', '', 1, '2021-06-14', 'B'),
(387, 'DAVID OSWALDO BETANCOURT CALDERON', '', '+52 1 231 148 0991', 0, '', 'ESTANCIA INFANTIL SONRISAS ', 'aslandbcal@gmail.com', 1, '', '', 1, '2021-06-14', 'B'),
(388, 'HECTOR MAGAñA', '', '5215532470671', 0, '', '', '', 1, '', '', 1, '2021-06-14', 'B'),
(389, 'LAWRENCE OLIVARES DíAZ', '', '', 0, '', '', '', 1, '', '', 1, '2021-06-14', 'B'),
(390, 'GLORIA LOPEZ TORRES', '', '+52 919 177 5869', 0, '', 'HOTEL GEMINIS', 'roko250498@gmail.com', 0, '', '', 1, '2021-06-14', 'B'),
(391, 'HéCTOR MAGAñA CAMACHO ', '', '', 0, '', 'GYM180°', 'hectormagana91@gmail.com', 1, '', '', 1, '2021-06-14', 'B'),
(392, 'MOISES DIAZ DIAZ', '', '5215554124198', 0, '', '', '', 1, '', '', 1, '2021-06-14', 'B'),
(393, 'VICTOR HUGO MORALES', '', '5212281507601', 0, '', 'OCELOT GYM', 'ventas@spixalapa.com', 1, '', '', 1, '2021-06-14', 'B'),
(394, 'ORGANISMO PUBLICO LOCAL ELECTORAL', '', '', 0, 'IEV940922512', 'ORGANISMO PUBLICO LOCAL ELECTORAL', 'llinas98@hotmail.com,crrosenda@gmail.com', 0, '', '', 1, '2021-06-14', 'B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credits`
--

CREATE TABLE `credits` (
  `id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `f_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `factura` varchar(254) NOT NULL,
  `adeudo` decimal(65,4) NOT NULL,
  `abono` decimal(65,4) NOT NULL,
  `dias_credit` int(11) NOT NULL,
  `pay` tinyint(1) NOT NULL DEFAULT 0,
  `sucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `credits`
--

INSERT INTO `credits` (`id`, `client`, `f_registro`, `factura`, `adeudo`, `abono`, `dias_credit`, `pay`, `sucursal`) VALUES
(1, 213, '2020-06-15 15:57:33', '120200615120441', '186.7600', '0.0000', 3, 1, 10),
(2, 1, '2020-06-16 11:47:28', 'Impresiones 55 * 5', '165.0000', '165.0000', 2, 1, 1),
(7, 284, '2020-06-19 15:09:22', '120200619150321', '194.8800', '194.8800', 7, 1, 1),
(8, 1, '2020-06-19 18:49:44', '120200619184843', '219.2400', '219.2400', 7, 1, 10),
(9, 295, '2020-06-20 16:20:35', '120200620161732', '90.0000', '90.0000', 7, 1, 10),
(10, 296, '2020-06-20 16:20:39', '120200620161632', '620.0000', '620.0000', 7, 1, 10),
(11, 1, '2020-06-20 16:33:00', '120200620163250', '10.0000', '10.0000', 7, 1, 10),
(14, 296, '2020-06-27 15:00:28', '120200627145955', '90.0000', '0.0000', 7, 1, 10),
(20, 298, '2020-07-01 16:17:53', '120200701161718', '1038.3500', '895.1500', 7, 1, 10),
(23, 295, '2020-07-04 22:26:30', '120200704194345', '270.0000', '270.0000', 7, 1, 10),
(24, 296, '2020-07-04 22:26:33', '120200704194244', '90.0000', '90.0000', 7, 1, 10),
(25, 242, '2020-07-08 16:40:58', '120200708154251', '863.3700', '0.0000', 7, 1, 1),
(26, 296, '2020-07-11 12:04:29', '120200711120307', '180.0000', '0.0000', 7, 1, 10),
(27, 295, '2020-07-11 12:06:16', '120200711120531', '180.0000', '180.0000', 7, 1, 10),
(32, 294, '2020-07-20 13:54:00', '120200720134513', '308.0000', '308.0000', 7, 1, 10),
(37, 292, '2020-08-01 16:37:54', '120200801161527', '240.0000', '240.0000', 7, 1, 9),
(39, 200, '2020-08-04 13:32:36', '120191215121646', '5197.0000', '5197.0000', 1000, 1, 1),
(40, 266, '2020-08-04 18:47:33', '120200804181332', '250.0000', '250.0000', 7, 1, 1),
(43, 304, '2020-08-09 16:55:58', '120200809164733', '540.0000', '540.0000', 7, 1, 10),
(45, 307, '2020-08-17 15:26:05', '120200814100403', '3830.0000', '3830.0000', 7, 1, 10),
(47, 154, '2020-08-25 18:16:03', '120200825181518', '350.0000', '0.0000', 7, 1, 10),
(53, 317, '2020-09-07 17:36:18', '120200907173049', '336.0000', '336.0000', 7, 1, 10),
(57, 295, '2020-09-13 12:03:59', '120200913115636', '360.0000', '360.0000', 7, 1, 10),
(58, 296, '2020-09-13 12:04:03', '120200913115621', '400.0000', '400.0000', 7, 1, 10),
(59, 304, '2020-09-14 13:23:31', '120200914122030', '180.0000', '180.0000', 7, 1, 10),
(61, 182, '2020-09-18 19:27:17', '120200918191937', '180.0000', '180.0000', 7, 1, 10),
(63, 155, '2020-09-19 12:46:26', '120200919124057', '952.0000', '0.0000', 7, 0, 10),
(66, 320, '2020-09-24 15:16:17', '120200924144004', '360.0000', '0.0000', 7, 0, 10),
(69, 219, '2020-09-24 19:17:57', '120200914212125', '14400.0000', '14400.0000', 400, 1, 10),
(72, 296, '2020-09-25 23:52:55', '120200925232641', '220.0000', '0.0000', 7, 1, 10),
(73, 295, '2020-09-25 23:52:59', '120200925232824', '360.0000', '360.0000', 7, 1, 10),
(75, 325, '2020-10-02 12:27:08', '120201002122249', '150.0000', '150.0000', 7, 1, 10),
(77, 296, '2020-10-04 10:23:40', '120201004102140', '670.0000', '670.0000', 7, 1, 10),
(79, 266, '2020-10-07 11:02:39', '120201007105346', '574.0000', '574.0000', 7, 1, 1),
(83, 292, '2020-10-10 18:51:56', '120201010185030', '250.0000', '250.0000', 7, 1, 10),
(84, 296, '2020-10-10 19:56:53', '120201010195300', '330.0000', '330.0000', 7, 1, 10),
(87, 316, '2020-10-16 11:11:56', '120201016110556', '300.0000', '0.0000', 7, 1, 10),
(89, 296, '2020-10-17 20:07:37', '120201017200447', '400.0000', '400.0000', 7, 1, 10),
(90, 295, '2020-10-17 20:11:07', '120201017200755', '810.0000', '810.0000', 7, 1, 10),
(97, 295, '2020-11-09 20:01:56', '120201103121133', '810.0000', '0.0000', 7, 1, 10),
(98, 296, '2020-11-09 20:02:15', '120201109195210', '600.0000', '600.0000', 7, 1, 10),
(102, 182, '2020-11-13 21:55:15', '120201113215420', '3500.0000', '3500.0000', 7, 1, 10),
(105, 339, '2020-11-24 19:42:22', '120201124193540', '280.0000', '280.0000', 7, 1, 10),
(110, 338, '2020-11-26 20:00:07', '120201126195821', '350.0000', '0.0000', 7, 0, 10),
(112, 191, '2020-11-30 10:41:49', '120201130104126', '180.0000', '0.0000', 7, 0, 1),
(119, 340, '2020-12-15 14:47:40', '120201214212912', '8628.9500', '0.0000', 70, 0, 10),
(120, 325, '2020-12-17 15:55:48', '120201217155518', '580.0000', '0.0000', 7, 0, 10),
(124, 161, '2020-12-18 14:13:58', '120201218141329', '735.0000', '0.0000', 7, 0, 10),
(126, 316, '2021-01-02 17:39:11', '120210102172906', '312.0000', '312.0000', 7, 1, 10),
(131, 219, '2021-01-22 10:11:21', '120210122101032', '15500.0000', '2500.0000', 60, 0, 10),
(132, 332, '2021-02-09 19:07:00', '120210209190449', '400.0000', '400.0000', 7, 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credit_pay`
--

CREATE TABLE `credit_pay` (
  `id` int(11) NOT NULL,
  `credito` int(11) NOT NULL,
  `monto` decimal(65,4) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `credit_pay`
--

INSERT INTO `credit_pay` (`id`, `credito`, `monto`, `fecha`) VALUES
(10, 14, '90.0000', '2020-06-27 18:30:46'),
(11, 1, '186.7600', '2020-07-08 12:34:05'),
(12, 26, '180.0000', '2020-07-11 12:54:45'),
(15, 20, '0.8000', '2020-08-04 17:07:30'),
(16, 39, '1500.0000', '2020-08-04 17:09:10'),
(18, 45, '1500.0000', '2020-08-17 15:26:22'),
(26, 47, '350.0000', '2020-09-08 18:57:25'),
(28, 69, '5000.0000', '2020-09-24 19:18:22'),
(31, 72, '220.0000', '2020-09-28 10:31:49'),
(34, 87, '300.0000', '2020-11-03 22:33:33'),
(37, 97, '810.0000', '2020-11-23 13:31:28'),
(40, 119, '4798.0000', '2020-12-15 14:48:08'),
(41, 69, '5000.0000', '2021-01-09 13:32:04'),
(43, 69, '4400.0000', '2021-01-22 10:06:53'),
(46, 25, '863.3700', '2021-03-22 00:42:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `descripcion` varchar(254) NOT NULL,
  `view_index` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `descripcion`, `view_index`) VALUES
(33, 'VARIOS', 'ARTICULOS VARIOS', 1),
(37, 'SOFTWARE', 'Software desarrollado por la empresa o por terceros', 1),
(38, 'COMPUTO', 'Accesorios para pc o similares\r\n', 1),
(39, 'CELULARES', 'ACCESORIOS PARA MOBILES\r\n', 1),
(40, 'MEMORIAS', 'MEMORIAS DE TODO TIPO\r\n', 1),
(42, 'DOCS OFICIALES', 'Servicio de documentos oficiales', 0),
(43, 'CONSUMIBLES', 'TONER, TINTA, CARTUCHOS', 0),
(44, 'COMUNICACIONES', 'RADIOS, ACCESORIOS ETC ', 0),
(45, 'NASUR', 'Medicamentos Naturales del sur', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `nombre_corto` varchar(254) NOT NULL,
  `direccion` varchar(254) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `telefono` varchar(254) NOT NULL,
  `mision` longtext NOT NULL,
  `vision` longtext NOT NULL,
  `contacto` longtext NOT NULL,
  `facebook` varchar(254) NOT NULL,
  `twitter` varchar(254) NOT NULL,
  `youtube` varchar(254) NOT NULL,
  `iva` int(11) NOT NULL,
  `footer` longtext NOT NULL,
  `cfdi_lugare_expedicion` varchar(254) NOT NULL,
  `cfdi_rfc` varchar(254) NOT NULL,
  `cfdi_regimen` varchar(254) NOT NULL,
  `cfdi_cer` varchar(254) NOT NULL,
  `cfdi_key` varchar(254) NOT NULL,
  `cfdi_pass` varchar(254) NOT NULL,
  `token` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `nombre_corto`, `direccion`, `correo`, `telefono`, `mision`, `vision`, `contacto`, `facebook`, `twitter`, `youtube`, `iva`, `footer`, `cfdi_lugare_expedicion`, `cfdi_rfc`, `cfdi_regimen`, `cfdi_cer`, `cfdi_key`, `cfdi_pass`, `token`) VALUES
(1, 'GRUPO ASCGAR', 'GA', 'Veracruz, Mexico', 'contacto@cyberchoapa.scom', '+52 923 120 05 05', 'Somos una empresa fundada físicamente el 29 de mayo del año 2013 en el estado de Veracruz, México. Dedicada al desarrollo, distribución y venta de software, soluciones en Internet, venta de equipos (Hardware) y servicios varios. Ofreciendo una solución global a empresas, profesionales, administraciones, usuarios particulares y al publico en general, en todo el territorio nacional e internacional.', 'Pretendemos ser un referente en el mercado nacional en el sector de las TIC, y para ello abarcaremos todos los servicios que ofrecemos actualmente incrementando los que vayan surgiendo debido a la necesidad de cambio provocado por los avances tecnológicos. Esto es así ya que somos una empresa en constante innovación ya que el sector de la tecnología así lo requiere.', 'Telefono\r\n<br>\r\n+52 923 120 05 05\r\n<br><br>\r\nVentas | Informacion \r\n<br>\r\nventas@cyberchoapas.com', '', '', '', 16, '<h5 style=\"background-color: #1a4f7d; text-align: center;\"><span style=\"background-color: #1a4f7d; color: #ffffff;\"><em><strong>| www.cyberchoapas.com | ::: GRUPO ASCGAR ::: | www.ascgar.com |</strong></em></span><span style=\"background-color: #1a4f7d; color: #ffffff;\"><em><strong><br /></strong></em></span></h5>', '96980', 'AEDF9201245G3', '621', 'SDK2/certificados/CER.cer  ', 'SDK2/certificados/KEY.key', 'AEDF9201', 'g4UW4c0gIkyX2yH90bOHlCx8ivt0lD3/Eyh7AnLuSrmVeBiyFbjEmdlFBs0uaaeVOxQRjz5DPTmXzuZrWdVZs/bsVoQ8Tc4BWo/XDDG+EvA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `e_ventas`
--

CREATE TABLE `e_ventas` (
  `id` int(11) NOT NULL,
  `estrategia` varchar(300) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `e_ventas`
--

INSERT INTO `e_ventas` (`id`, `estrategia`, `active`) VALUES
(1, 'VENTA CONVENCIONAL', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `serie` varchar(254) NOT NULL,
  `folio` varchar(254) NOT NULL,
  `estatus` varchar(254) NOT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`serie`, `folio`, `estatus`, `cliente`) VALUES
('A', '120190819143328', 'Vigente', 154),
('A', '120190819153303', 'Proceso cancelar', 1),
('A', '120190819153435', 'Proceso cancelar', 1),
('A', '120190820121431', 'Vigente', 155),
('A', '120190913132203', 'Proceso cancelar', 1),
('A', '120190916221358', 'Vigente', 180),
('A', '120190925093148', 'Vigente', 184),
('A', '120190927195056', 'Vigente', 187),
('A', '120190930201754', 'Vigente', 1),
('A', '120190930202456', 'Vigente', 1),
('A', '120191004195727', 'Vigente', 198),
('A', '120191011135643', 'Vigente', 199),
('A', '120191014113426', 'Vigente', 184),
('A', '120191014165302', 'Vigente', 200),
('A', '120191029181000', 'Vigente', 208),
('A', '120191122200257', 'Vigente', 198),
('A', '120191123103040', 'Vigente', 228),
('A', '120191128191557', 'Vigente', 198),
('A', '120191211172238', 'Vigente', 240),
('A', '120191212203154', 'Vigente', 198),
('A', '120191219190531', 'Vigente', 198),
('A', '120191223121908', 'Vigente', 244),
('A', '120191223191852', 'Vigente', 245),
('A', '120191231095013', 'Vigente', 240),
('A', '120200103144631', 'Vigente', 252),
('A', '120200105121047', 'Vigente', 253),
('A', '120200105140748', 'Vigente', 254),
('A', '120200111110951', 'Vigente', 198),
('A', '120200114134955', 'Vigente', 155),
('A', '120200124105728', 'Vigente', 263),
('A', '120200205122840', 'Vigente', 270),
('A', '120200211003703', 'Vigente', 273),
('B', '120200214191541', 'Vigente', 275),
('A', '120200219111106', 'Vigente', 278),
('A', '120200219164131', 'Vigente', 200),
('A', '120200223223835', 'Vigente', 154),
('A', '120200228101706', 'Vigente', 270),
('A', '120200301183321', 'Vigente', 282),
('A', '120200311102623', 'Vigente', 285),
('A', '120200314104810', 'Vigente', 198),
('A', '120200325181657', 'Vigente', 198),
('A', '120200404153703', 'Vigente', 282),
('A', '120200404160402', 'Vigente', 282),
('A', '120200422094312', 'Vigente', 289),
('B', '120200430141134', 'Vigente', 290),
('A', '120200513104001', 'Vigente', 213),
('A', '120200514232903', 'Vigente', 293),
('A', '120200521115213', 'Vigente', 198),
('A', '120200525125754', 'Vigente', 290),
('A', '120200526153134', 'Vigente', 290),
('A', '120200526153239', 'Vigente', 290),
('A', '120200527092213', 'Vigente', 290),
('A', '120200527092332', 'Vigente', 290),
('A', '120200527092511', 'Vigente', 290),
('A', '120200527092727', 'Vigente', 290),
('A', '120200602141246', 'Vigente', 294),
('A', '120200603154543', 'Vigente', 213),
('B', '120200622193924', 'Vigente', 282),
('B', '120200630124124', 'Vigente', 244),
('B', '120200630144036', 'Vigente', 212),
('B', '120200701161718', 'Vigente', 298),
('B', '120200705162232', 'Vigente', 301),
('A', '120200708192655', 'Vigente', 302),
('B', '120200724182732', 'Vigente', 290),
('B', '120200817170823', 'Vigente', 285),
('A', '120200831162442', 'Vigente', 302),
('B', '120200903174256', 'Vigente', 198),
('A', '120200910113931', 'Vigente', 198),
('B', '120200928102847', 'Vigente', 215),
('B', '120201012143843', 'Vigente', 282),
('B', '120201114111404', 'Vigente', 198),
('B', '120201124115412', 'Vigente', 198),
('A', '120201202115054', 'Vigente', 198),
('B', '120201210161510', 'Vigente', 302),
('B', '120201213130813', 'Vigente', 294),
('A', '120201214162711', 'Vigente', 198),
('A', '120201218105500', 'Vigente', 198),
('B', '120210110121141', 'Vigente', 345),
('B', '120210118203518', 'Vigente', 285),
('B', '120210203135257', 'Vigente', 348),
('C', '120210206153434', 'Vigente', 350),
('B', '120210330180545', 'Vigente', 372),
('A', '120210410103800', 'Vigente', 198),
('B', '120210506223451', 'Vigente', 348),
('B', '120210517111226', 'Vigente', 290),
('A', '120210611180546', 'Vigente', 275),
('C', '120210611182235', 'Vigente', 394),
('B', '120210612164732', 'Vigente', 198),
('B', '3620200115190647', 'Vigente', 258),
('A', '3720191023123718', 'Proceso cancelar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `folio_venta`
--

CREATE TABLE `folio_venta` (
  `folio` varchar(254) NOT NULL,
  `vendedor` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `descuento` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `open` tinyint(1) NOT NULL,
  `cobrado` float DEFAULT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  `cut` tinyint(1) DEFAULT 0,
  `sucursal` int(11) NOT NULL,
  `cut_global` int(11) NOT NULL DEFAULT 0,
  `iva` int(11) NOT NULL DEFAULT 0,
  `t_pago` varchar(254) NOT NULL DEFAULT 'Ninguno',
  `pedido` tinyint(1) NOT NULL DEFAULT 0,
  `folio_venta_ini` varchar(254) DEFAULT NULL,
  `cotizacion` tinyint(1) NOT NULL DEFAULT 0,
  `concepto` varchar(254) DEFAULT NULL,
  `comision_pagada` tinyint(1) NOT NULL DEFAULT 0,
  `oxxo_pay` varchar(254) NOT NULL DEFAULT '0',
  `titulo` varchar(254) DEFAULT '',
  `f_entrega` date DEFAULT NULL,
  `estrategia` int(11) DEFAULT NULL,
  `facturar` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `folio_venta`
--

INSERT INTO `folio_venta` (`folio`, `vendedor`, `client`, `descuento`, `fecha`, `open`, `cobrado`, `fecha_venta`, `cut`, `sucursal`, `cut_global`, `iva`, `t_pago`, `pedido`, `folio_venta_ini`, `cotizacion`, `concepto`, `comision_pagada`, `oxxo_pay`, `titulo`, `f_entrega`, `estrategia`, `facturar`) VALUES
('120190819143328', 1, 154, 0, '2019-08-19 14:33:28', 0, 4600, '2019-08-19 15:12:04', 1, 1, 1, 16, 'transferencia', 0, '120190819143328', 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190820121431', 1, 1, 0, '2019-08-20 12:14:31', 0, 10517.2, '2019-08-25 10:34:06', 1, 1, 1, 16, 'transferencia', 0, '120190820121431', 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190820190330', 1, 154, 0, '2019-08-20 19:03:30', 0, 3795, '2019-08-20 19:04:26', 1, 9, 1, 16, 'transferencia', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190824131530', 1, 1, 0, '2019-08-24 13:15:30', 0, 105, '2019-08-24 13:17:30', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190829201049', 1, 1, 0, '2019-08-29 20:10:49', 0, 180, '2019-08-29 20:11:21', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190829205530', 1, 1, 0, '2019-08-29 20:55:30', 0, 190, '2019-08-29 20:55:45', 1, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190831213732', 1, 1, 0, '2019-08-31 21:37:32', 0, 300, '2019-08-31 21:41:35', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190904183621', 1, 1, 0, '2019-09-04 18:36:21', 0, 400, '2019-09-04 19:10:42', 1, 1, 1, 16, 'efectivo', 0, '120190904183621', 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190905085759', 1, 162, 10, '2019-09-05 08:57:59', 0, 4320, '2019-09-20 14:27:17', 1, 1, 1, 16, 'efectivo', 0, '120190905085759', 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190907112858', 1, 1, 0, '2019-09-07 11:28:58', 0, 290, '2019-09-07 11:30:13', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190907143803', 1, 1, 0, '2019-09-07 14:38:03', 0, 88, '2019-09-07 14:38:48', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190907201649', 1, 1, 0, '2019-09-07 20:16:49', 0, 110, '2019-09-07 20:18:56', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190909205319', 1, 1, 0, '2019-09-09 20:53:19', 0, 60, '2019-09-09 20:53:52', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190912210242', 1, 1, 0, '2019-09-12 21:02:42', 0, 410, '2019-09-12 21:05:28', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190914130854', 1, 1, 0, '2019-09-14 13:08:54', 0, 105, '2019-09-14 13:33:15', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190916123500', 1, 179, 0, '2019-09-16 12:35:00', 0, 399.99, '2019-09-16 14:51:02', 1, 1, 1, 16, 'efectivo', 0, '120190916123500', 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190916193937', 1, 1, 0, '2019-09-16 19:39:37', 0, 150, '2019-09-16 19:39:53', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190916221358', 1, 180, 0, '2019-09-16 22:13:58', 0, 4800, '2019-09-16 22:14:48', 1, 1, 1, 16, 'transferencia', 0, '120190916221358', 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190917120915', 1, 1, 0, '2019-09-17 12:09:15', 0, 70, '2019-09-17 12:09:35', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190917192301', 1, 1, 0, '2019-09-17 19:23:01', 0, 0, '2019-09-17 19:23:38', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190917202852', 1, 1, 0, '2019-09-17 20:28:52', 0, 20, '2019-09-17 20:29:34', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('120190921141216', 1, 1, 0, '2019-09-21 14:12:16', 0, 30, '2019-09-21 14:12:54', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120190921153718', 1, 332, 0, '2019-09-21 15:37:18', 0, 4500, '2019-09-21 15:38:15', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120190925093148', 1, 184, 0, '2019-09-25 09:31:48', 0, 1125, '2019-09-30 18:05:34', 1, 1, 1, 16, 'transferencia', 0, '120190925093148', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120190925202625', 1, 1, 0, '2019-09-25 20:26:25', 0, 280, '2019-09-25 20:26:55', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120190926141326', 1, 1, 0, '2019-09-26 14:13:26', 0, 85, '2019-09-26 14:14:14', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120190926205952', 1, 162, 20, '2019-09-26 20:59:52', 0, 6080, '2019-09-27 12:22:29', 1, 1, 1, 16, 'transferencia', 0, '120190926205952', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120190927122730', 1, 186, 0, '2019-09-27 12:27:30', 0, 4500, '2019-09-27 12:51:47', 1, 1, 1, 16, 'transferencia', 0, '120190927122730', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120190927195056', 1, 187, 0, '2019-09-27 19:50:56', 0, 100, '2019-09-27 19:51:48', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120190927203056', 1, 1, 0, '2019-09-27 20:30:56', 0, 20, '2019-09-27 20:31:17', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120190928145049', 1, 188, 3, '2019-09-28 14:50:49', 0, 4365, '2019-09-28 15:37:17', 1, 1, 1, 16, 'transferencia', 0, '120190928145049', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120190928164919', 1, 190, 0, '2019-09-28 16:49:19', 0, 4800, '2019-10-26 17:00:19', 1, 1, 1, 16, 'transferencia', 0, '120190928164919', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120190929102555', 1, 191, 8, '2019-09-29 10:25:55', 0, 4416, '2019-10-02 21:27:14', 1, 1, 1, 16, 'transferencia', 0, '120190929102555', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120190930114626', 1, 1, 0, '2019-09-30 11:46:26', 0, 180, '2019-10-01 14:36:24', 1, 1, 1, 16, 'efectivo', 0, '120190930114626', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191004195727', 1, 198, 0, '2019-10-04 19:57:27', 0, 239.8, '2019-10-04 19:59:52', 1, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191005195335', 1, 1, 0, '2019-10-05 19:53:35', 0, 110, '2019-10-05 19:53:53', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191006181905', 1, 1, 0, '2019-10-06 18:19:05', 0, 480, '2019-10-07 12:06:09', 1, 1, 1, 16, 'transferencia', 0, '120191006181905', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191007150313', 1, 1, 0, '2019-10-07 15:03:13', 0, 100, '2019-10-07 15:05:21', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191009211643', 1, 1, 0, '2019-10-09 21:16:43', 0, 90, '2019-10-09 21:17:04', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191011135643', 1, 199, 0, '2019-10-11 13:56:43', 0, 5450, '2019-10-19 13:33:45', 1, 1, 1, 16, 'transferencia', 0, '120191011135643', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191011192654', 1, 1, 0, '2019-10-11 19:26:54', 0, 700, '2019-10-11 19:28:09', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191014113426', 1, 184, 0, '2019-10-14 11:34:26', 0, 1125, '2019-10-14 11:41:06', 1, 1, 1, 16, 'transferencia', 0, '120191014113426', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191014165302', 1, 200, 0, '2019-10-14 16:53:02', 0, 1359.52, '2019-10-14 20:09:29', 1, 1, 1, 16, 'efectivo', 0, '120191014165302', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191014193713', 1, 1, 0, '2019-10-14 19:37:13', 0, 60, '2019-10-14 19:37:52', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191016124524', 1, 201, 0, '2019-10-16 12:45:24', 0, 4800, '2019-10-16 15:59:20', 1, 1, 1, 16, 'transferencia', 0, '120191016124524', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191016215055', 1, 202, 0, '2019-10-16 21:50:55', 0, 2000, '2019-10-17 11:50:25', 1, 1, 1, 16, 'transferencia', 0, '120191016215055', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191017195945', 1, 1, 0, '2019-10-17 19:59:45', 0, 150, '2019-10-17 20:30:55', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191020164646', 1, 1, 0, '2019-10-20 16:46:46', 0, 106, '2019-10-20 16:47:48', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191022111046', 1, 206, 0, '2019-10-22 11:10:46', 0, 4600, '2019-10-22 11:48:27', 1, 1, 1, 16, 'transferencia', 0, '120191022111046', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191022145144', 1, 182, 0, '2019-10-22 14:51:44', 0, 2000, '2019-10-23 16:24:34', 1, 1, 1, 16, 'transferencia', 0, '120191022145144', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191029181000', 1, 208, 0, '2019-10-29 18:10:00', 0, 4500, '2019-10-29 18:11:43', 1, 1, 1, 16, 'transferencia', 0, '120191029181000', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191030143747', 1, 199, 0, '2019-10-30 14:37:47', 0, 950, '2019-10-30 14:37:47', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191101093802', 1, 210, 0, '2019-11-01 09:38:02', 0, 1800, '2019-11-01 09:38:02', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191105205941', 1, 217, 0, '2019-11-05 20:59:41', 0, 480, '2019-11-09 12:30:00', 1, 1, 1, 16, 'transferencia', 0, '120191105205941', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191107163213', 1, 1, 0, '2019-11-07 16:32:13', 0, 480, '2019-11-07 21:10:45', 1, 1, 1, 16, 'tranferencia', 0, '120191107163213', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191108193425', 1, 218, 40, '2019-11-08 19:34:25', 0, 2880, '2019-11-08 19:48:39', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191113223531', 1, 154, 0, '2019-11-13 22:35:31', 0, 100, '2019-11-14 09:45:24', 1, 1, 1, 16, 'transferencia', 0, '120191113223531', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191114005331', 1, 1, 0, '2019-11-14 00:53:31', 0, 480, '2019-11-14 09:59:29', 1, 1, 1, 16, 'tranferencia', 0, '120191114005331', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191114180220', 1, 1, 0, '2019-11-14 18:02:20', 0, 200, '2019-11-15 09:13:16', 1, 1, 1, 16, 'tranferencia', 0, '120191114180220', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191116151736', 1, 223, 0, '2019-11-16 15:17:36', 0, 1831.32, '2019-11-16 16:00:40', 1, 1, 1, 16, 'efectivo', 0, '120191116151736', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191119190512', 1, 225, 0, '2019-11-19 19:05:12', 0, 8600, '2019-11-19 19:06:04', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191119235516', 1, 1, 0, '2019-11-19 23:55:16', 0, 300, '2019-11-20 08:27:48', 1, 1, 1, 16, 'tranferencia', 0, '120191119235516', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191121122200', 1, 227, 5, '2019-11-21 12:22:00', 0, 4275, '2019-11-21 13:33:09', 1, 1, 1, 16, 'transferencia', 0, '120191121122200', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191121122456', 1, 229, 20, '2019-11-21 12:24:56', 0, 1864.8, '2019-11-25 15:16:49', 1, 1, 1, 16, '', 0, '120191121122456', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191122200257', 1, 198, 0, '2019-11-22 20:02:57', 0, 253, '2019-11-28 18:46:46', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191123103040', 1, 228, 0, '2019-11-23 10:30:40', 0, 6700, '2019-11-23 18:33:31', 1, 1, 1, 16, 'transferencia', 0, '120191123103040', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191126104315', 1, 231, 100, '2019-11-26 10:43:15', 0, 0, '2019-11-26 10:44:13', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191127121217', 1, 232, 50, '2019-11-27 12:12:17', 0, 2400, '2019-12-27 15:12:59', 1, 1, 1, 16, 'transferencia', 0, '120191127121217', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191128095310', 1, 233, 0, '2019-11-28 09:53:10', 0, 4800, '2019-12-09 18:05:12', 1, 1, 1, 16, 'transferencia', 0, '120191128095310', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191128191557', 1, 198, 0, '2019-11-28 19:15:57', 0, 253, '2019-11-28 19:29:40', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191201121446', 1, 1, 0, '2019-12-01 12:14:46', 0, 230, '2019-12-01 12:15:04', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191211172238', 1, 240, 10, '2019-12-11 17:22:38', 0, 7740, '2019-12-18 19:46:02', 1, 1, 1, 16, 'transferencia', 0, '120191211172238', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191212182812', 1, 241, 0, '2019-12-12 18:28:12', 0, 780, '2019-12-12 18:31:58', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191212203154', 1, 198, 0, '2019-12-12 20:31:54', 0, 322, '2019-12-12 20:33:57', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191215121646', 1, 200, 0, '2019-12-15 12:16:46', 0, 5197, '2021-02-13 11:30:17', 1, 1, 1, 16, 'efectivo', 0, '120191215121646', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191217192702', 1, 1, 0, '2019-12-17 19:27:02', 0, 160, '2019-12-17 19:27:29', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191219190531', 1, 198, 0, '2019-12-19 19:05:31', 0, 119, '2019-12-19 19:06:20', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191220114310', 1, 242, 100, '2019-12-20 11:43:10', 0, 0, '2019-12-20 11:44:23', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191222191800', 1, 243, 30, '2019-12-22 19:18:00', 0, 3360, '2019-12-23 18:41:59', 1, 1, 1, 16, 'transferencia', 0, '120191222191800', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191223101413', 1, 1, 0, '2019-12-23 10:14:13', 0, 580, '2019-12-23 18:55:38', 1, 1, 1, 16, 'transferencia', 0, '120191223101413', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191223121908', 1, 244, 0, '2019-12-23 12:19:08', 0, 6700, '2019-12-23 12:21:08', 1, 1, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191223191852', 1, 245, 0, '2019-12-23 19:18:52', 0, 1300, '2019-12-23 19:20:42', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191224090514', 1, 246, 0, '2019-12-24 09:05:14', 0, 4864, '2019-12-24 10:44:52', 1, 1, 1, 16, 'transferencia', 0, '120191224090514', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191226110834', 1, 247, 0, '2019-12-26 11:08:34', 0, 4500, '2019-12-26 12:33:06', 1, 1, 1, 16, 'transferencia', 0, '120191226110834', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191226133437', 1, 1, 0, '2019-12-26 13:34:37', 0, 580, '2019-12-31 09:57:08', 1, 1, 1, 16, 'transferencia', 0, '120191226133437', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191227183100', 1, 234, 50, '2019-12-27 18:31:00', 0, 2400, '2019-12-27 19:36:38', 1, 1, 1, 16, 'transferencia', 0, '120191227183100', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191227193742', 1, 248, 50, '2019-12-27 19:37:42', 0, 2400, '2019-12-27 19:38:59', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120191231095013', 1, 240, 0, '2019-12-31 09:50:13', 0, 1276, '2019-12-31 09:51:26', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200103144631', 1, 252, 0, '2020-01-03 14:46:31', 0, 4800, '2020-01-04 13:38:39', 1, 1, 1, 16, 'transferencia', 0, '120200103144631', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200103162126', 1, 232, 0, '2020-01-03 16:21:26', 0, 4770, '2020-01-05 17:12:28', 1, 1, 1, 16, 'transferencia', 0, '120200103162126', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200104175315', 1, 1, 0, '2020-01-04 17:53:15', 0, 25, '2020-01-11 11:40:51', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200105121047', 1, 253, 0, '2020-01-05 12:10:47', 0, 4800, '2020-01-05 16:59:12', 1, 1, 1, 16, 'transferencia', 0, '120200105121047', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200105140748', 1, 254, 0, '2020-01-05 14:07:48', 0, 4800, '2020-01-05 16:55:44', 1, 1, 1, 16, 'transferencia', 0, '120200105140748', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200107203605', 1, 255, 0, '2020-01-07 20:36:05', 0, 6700, '2020-01-07 20:36:31', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200110093529', 1, 242, 15, '2020-01-10 09:35:29', 0, 4080, '2020-01-11 09:12:08', 1, 1, 1, 16, 'transferencia', 0, '120200110093529', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200111110951', 1, 198, 0, '2020-01-11 11:09:51', 0, 180, '2020-01-11 11:11:07', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200114134955', 1, 155, 16, '2020-01-14 13:49:55', 0, 12852, '2020-01-15 19:56:58', 1, 1, 1, 16, 'transferencia', 0, '120200114134955', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200115120846', 1, 256, 30, '2020-01-15 12:08:46', 0, 3360, '2020-01-15 16:58:13', 1, 1, 1, 16, 'transferencia', 0, '120200115120846', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200115134352', 1, 257, 0, '2020-01-15 13:43:52', 0, 6700, '2020-01-15 13:44:40', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200117130324', 1, 260, 0, '2020-01-17 13:03:24', 0, 4800, '2020-01-23 10:58:45', 1, 1, 1, 16, 'transferencia', 0, '120200117130324', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200118142448', 1, 262, 0, '2020-01-18 14:24:48', 0, 6700, '2020-01-24 13:25:59', 1, 1, 1, 16, 'transferencia', 0, '120200118142448', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200124105728', 1, 263, 0, '2020-01-24 10:57:28', 0, 8600, '2020-01-24 17:04:52', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200124201751', 1, 264, 5, '2020-01-24 20:17:51', 0, 4275, '2020-01-24 20:29:00', 1, 9, 1, 16, 'transferencia', 0, '120200124201751', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200129214930', 1, 266, 0, '2020-01-29 21:49:30', 0, 4999, '2020-01-29 21:50:05', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200205122840', 1, 270, 0, '2020-02-05 12:28:40', 0, 3000, '2020-02-28 10:16:31', 1, 1, 1, 16, 'transferencia', 0, '120200205122840', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200210122304', 1, 272, 0, '2020-02-10 12:23:04', 0, 4800, '2020-02-10 15:04:22', 1, 1, 1, 16, 'transferencia', 0, '120200210122304', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200211003703', 1, 273, 0, '2020-02-11 00:37:03', 0, 4500, '2020-02-20 19:22:12', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200211200422', 1, 274, 0, '2020-02-11 20:04:22', 0, 8799, '2020-02-11 20:05:15', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200214191541', 1, 275, 0, '2020-02-14 19:15:41', 0, 72.6, '2020-02-14 19:23:55', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200215121630', 1, 276, 0, '2020-02-15 12:16:30', 0, 8799, '2020-02-15 12:37:05', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200217223930', 1, 277, 0, '2020-02-17 22:39:30', 0, 6400, '2020-02-17 23:06:10', 1, 1, 1, 16, 'transferencia', 0, '120200217223930', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200218131603', 1, 162, 15, '2020-02-18 13:16:03', 0, 5525, '2020-02-20 19:24:27', 1, 1, 1, 16, 'transferencia', 0, '120200218131603', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200219111106', 1, 278, 0, '2020-02-19 11:11:06', 0, 4999, '2020-02-19 13:34:37', 1, 1, 1, 16, 'transferencia', 0, '120200219111106', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200219164131', 1, 200, 0, '2020-02-19 16:41:31', 0, 1166.96, '2020-03-02 12:31:47', 1, 1, 1, 16, 'transferencia', 0, '120200219164131', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200221110215', 1, 277, 0, '2020-02-21 11:02:15', 0, 1900, '2020-02-21 11:02:15', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200222191451', 1, 279, 0, '2020-02-22 19:14:51', 0, 4500, '2020-02-22 19:15:02', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200223223835', 1, 154, 15, '2020-02-23 22:38:35', 0, 4334.15, '2020-02-24 10:27:18', 1, 1, 1, 16, 'transferencia', 0, '120200223223835', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200224140712', 1, 280, 90, '2020-02-24 14:07:12', 0, 500, '2020-02-24 14:07:32', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200224141101', 1, 154, 0, '2020-02-24 14:11:01', 0, 100, '2020-02-24 14:11:01', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200227090513', 1, 226, 15, '2020-02-27 09:05:13', 0, 9918.65, '2020-02-27 13:51:54', 1, 1, 1, 16, 'transferencia', 0, '120200227090513', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200228101706', 1, 270, 0, '2020-02-28 10:17:06', 0, 2870, '2020-02-28 10:17:31', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200301183321', 1, 282, 0, '2020-03-01 18:33:21', 0, 4000, '2020-03-14 15:11:21', 1, 1, 1, 16, 'transferencia', 0, '120200301183321', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200310104440', 1, 284, 0, '2020-03-10 10:44:40', 0, 6400, '2020-03-11 10:35:50', 1, 1, 1, 16, 'transferencia', 0, '120200310104440', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200311102623', 1, 285, 0, '2020-03-11 10:26:23', 0, 464, '2020-03-11 10:27:49', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200311102840', 1, 234, 0, '2020-03-11 10:28:40', 0, 3800, '2020-03-14 15:05:04', 1, 1, 1, 16, 'transferencia', 0, '120200311102840', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200313173607', 1, 162, 15, '2020-03-13 17:36:07', 0, 1615, '2020-03-14 15:10:07', 1, 1, 1, 16, 'transferencia', 0, '120200313173607', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200314104810', 1, 198, 0, '2020-03-14 10:48:10', 0, 90, '2020-03-14 10:49:22', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200324191513', 1, 155, 15, '2020-03-24 19:15:13', 0, 4249.15, '2020-03-25 13:34:13', 1, 1, 1, 16, 'transferencia', 0, '120200324191513', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200325181657', 1, 198, 0, '2020-03-25 18:16:57', 0, 98, '2020-03-25 18:17:39', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200401195048', 1, 283, 0, '2020-04-01 19:50:48', 0, 450, '2020-04-09 01:29:33', 1, 1, 1, 16, 'oxxo', 0, '120200401195048', 0, NULL, 0, '93000318338603', '', NULL, NULL, 0),
('120200404153703', 1, 282, 0, '2020-04-04 15:37:03', 0, 3000, '2020-04-04 16:00:37', 1, 1, 1, 16, 'transferencia', 0, '120200404153703', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200404160402', 1, 282, 0, '2020-04-04 16:04:02', 0, 1300, '2020-04-04 16:06:03', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200407215434', 1, 287, 0, '2020-04-07 21:54:34', 0, 5800, '2020-04-09 01:22:28', 1, 1, 1, 16, 'oxxo', 0, '120200407215434', 0, NULL, 0, '93000323583847', '', NULL, NULL, 0),
('120200410164933', 1, 1, 0, '2020-04-10 16:49:33', 0, 400, '2020-04-11 11:07:57', 1, 1, 1, 16, 'transferencia', 0, '120200410164933', 0, NULL, 0, '93000325897781', '', NULL, NULL, 0),
('120200422094312', 1, 289, 0, '2020-04-22 09:43:12', 0, 4500, '2020-04-22 10:43:02', 1, 1, 1, 16, 'transferencia', 0, '120200422094312', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200422192310', 1, 290, 0, '2020-04-22 19:23:10', 0, 10000, '2020-04-27 11:50:17', 1, 1, 1, 16, 'transferencia', 0, '120200422192310', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200428203701', 1, 291, 0, '2020-04-28 20:37:01', 0, 3750, '2020-04-28 21:20:35', 1, 1, 1, 16, 'transferencia', 0, '120200428203701', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200430104842', 1, 292, 15, '2020-04-30 10:48:42', 0, 5440, '2020-05-01 10:22:29', 1, 9, 1, 16, 'transferencia', 0, '120200430104842', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200512211718', 1, 162, 0, '2020-05-12 21:17:18', 0, 1000, '2020-05-13 11:28:20', 1, 1, 1, 16, 'efectivo', 0, '120200512211718', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200513104001', 1, 213, 0, '2020-05-13 10:40:01', 0, 1900, '2020-05-13 10:43:03', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200513112736', 1, 1, 0, '2020-05-13 11:27:36', 0, 150, '2020-05-14 14:46:00', 1, 1, 1, 16, 'oxxo', 0, '120200513112736', 0, NULL, 0, '93000359515697', '', NULL, NULL, 0),
('120200514232903', 1, 293, 0, '2020-05-14 23:29:03', 0, 8120, '2020-05-15 16:24:54', 1, 1, 1, 16, 'transferencia', 0, '120200514232903', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200521115213', 1, 198, 0, '2020-05-21 11:52:13', 0, 108, '2020-05-21 11:53:28', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200525125754', 1, 290, 0, '2020-05-25 12:57:54', 0, 3364, '2020-05-26 15:27:14', 1, 1, 1, 16, 'transferencia', 0, '120200525125754', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200526153134', 1, 290, 0, '2020-05-26 15:31:34', 0, 4800, '2020-05-26 15:32:12', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200526153239', 1, 290, 0, '2020-05-26 15:32:39', 0, 3000, '2020-05-26 15:33:18', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200527092213', 1, 290, 0, '2020-05-27 09:22:13', 0, 3364, '2020-05-27 09:22:53', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200527092332', 1, 290, 50, '2020-05-27 09:23:32', 0, 1900, '2020-05-27 09:24:19', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200529165018', 1, 1, 0, '2020-05-29 16:50:18', 0, 1160, '2020-05-30 09:49:27', 1, 1, 1, 16, 'oxxo', 0, '120200529165018', 0, NULL, 0, '93000380466191', '', NULL, NULL, 0),
('120200602141246', 1, 294, 0, '2020-06-02 14:12:46', 0, 1160, '2020-06-02 14:14:04', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200603154543', 1, 213, 0, '2020-06-03 15:45:43', 0, 812, '2020-06-04 17:54:08', 1, 1, 1, 16, 'transferencia', 0, '120200603154543', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200604174537', 1, 291, 0, '2020-06-04 17:45:37', 0, 400, '2020-06-04 20:35:45', 1, 1, 1, 16, 'oxxo', 0, '120200604174537', 0, NULL, 0, '93000388190736', '', NULL, NULL, 0),
('120200610192001', 1, 162, 20, '2020-06-10 19:20:01', 0, 3999.2, '2020-06-10 19:20:26', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200613121227', 1, 287, 0, '2020-06-13 12:12:27', 0, 8000, '2020-06-13 17:51:29', 1, 1, 1, 16, 'oxxo', 0, '120200613121227', 0, NULL, 0, '93000398774230', '', NULL, NULL, 0),
('120200613122527', 1, 287, 0, '2020-06-13 12:25:27', 0, 6500, '2020-06-13 17:25:47', 1, 1, 1, 16, 'oxxo', 0, '120200613122527', 0, NULL, 0, '93000398777548', '', NULL, NULL, 0),
('120200615120441', 1, 213, 0, '2020-06-15 12:04:41', 0, 186.76, '2020-07-08 12:34:05', 1, 10, 1, 16, 'transferencia', 0, '120200615120441', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200617152417', 1, 272, 0, '2020-06-17 15:24:17', 0, 503.44, '2020-06-17 17:04:11', 1, 1, 1, 16, 'transferencia', 0, '120200617152417', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200619150321', 1, 284, 0, '2020-06-19 15:03:21', 0, 799.24, '2020-07-16 17:34:13', 1, 1, 1, 16, 'transferencia', 0, '120200619150321', 0, NULL, 0, '93000406991479', 'titulos/120200619150321.pdf', NULL, NULL, 0),
('120200619184843', 1, 325, 0, '2020-06-19 18:48:43', 0, 219.24, '2020-06-22 11:35:48', 1, 10, 1, 16, 'oxxo', 0, '120200619184843', 0, NULL, 0, '93000407269412', '', NULL, NULL, 0),
('120200620145755', 1, 1, 0, '2020-06-20 14:57:55', 0, 53, '2020-06-20 14:58:18', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200620161632', 1, 296, 0, '2020-06-20 16:16:32', 0, 620, '2020-06-21 00:42:53', 1, 10, 1, 16, 'transferencia', 0, '120200620161632', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200620161732', 1, 295, 0, '2020-06-20 16:17:32', 0, 90, '2020-06-20 17:43:20', 1, 10, 1, 16, 'transferencia', 0, '120200620161732', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200620163250', 1, 1, 0, '2020-06-20 16:32:50', 0, 10, '2020-06-20 16:33:14', 1, 10, 1, 16, 'transferencia', 0, '120200620163250', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200620170024', 1, 1, 0, '2020-06-20 17:00:24', 0, 290, '2020-06-20 17:00:39', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200621000857', 1, 1, 0, '2020-06-21 00:08:57', 1, 0, NULL, 1, 10, 1, 16, 'transferencia', 1, '120200621000857', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200622190933', 1, 1, 0, '2020-06-22 19:09:33', 0, 120, '2020-06-22 19:09:49', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200622193924', 1, 282, 0, '2020-06-22 19:39:24', 0, 4172, '2020-06-26 00:16:01', 1, 10, 1, 16, 'transferencia', 0, '120200622193924', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200626165105', 1, 1, 0, '2020-06-26 16:51:05', 0, 580, '2020-06-26 19:41:53', 1, 10, 1, 16, 'oxxo', 0, '120200626165105', 0, NULL, 0, '93000416092672', '', NULL, NULL, 0),
('120200627145955', 1, 296, 0, '2020-06-27 14:59:55', 0, 90, '2020-06-27 18:30:46', 1, 10, 1, 16, 'transferencia', 0, '120200627145955', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200630124124', 1, 244, 0, '2020-06-30 12:41:24', 0, 672.8, '2020-06-30 14:46:48', 1, 10, 1, 16, 'transferencia', 0, '120200630124124', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200630144036', 1, 212, 0, '2020-06-30 14:40:36', 0, 1900, '2020-06-30 19:04:22', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200701150827', 1, 1, 0, '2020-07-01 15:08:27', 0, 25, '2020-07-01 15:08:53', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200701161718', 1, 298, 0, '2020-07-01 16:17:18', 0, 1038.35, '2020-10-31 13:27:42', 1, 10, 1, 16, 'banamex', 0, '120200701161718', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200703143244', 1, 1, 0, '2020-07-03 14:32:44', 0, 650, '2020-07-07 16:27:43', 1, 10, 1, 16, 'transferencia', 0, '120200703143244', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200704194244', 1, 296, 0, '2020-07-04 19:42:44', 0, 90, '2020-07-06 12:39:46', 1, 10, 1, 16, 'transferencia', 0, '120200704194244', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200704194345', 1, 295, 0, '2020-07-04 19:43:45', 0, 270, '2020-07-05 15:40:49', 1, 10, 1, 16, 'transferencia', 0, '120200704194345', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200705162232', 1, 301, 15, '2020-07-05 16:22:32', 0, 9221.65, '2020-07-13 14:18:06', 1, 10, 1, 16, 'transferencia', 0, '120200705162232', 0, NULL, 0, '0', 'titulos/120200705162232.pdf', NULL, NULL, 0),
('120200708154251', 1, 242, 0, '2020-07-08 15:42:51', 0, 863.37, '2021-03-22 00:42:10', 1, 1, 1, 16, 'paypal', 0, '120200708154251', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200708192655', 1, 302, 0, '2020-07-08 19:26:55', 0, 87, '2020-07-08 19:27:43', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200710135209', 1, 294, 0, '2020-07-10 13:52:09', 0, 464, '2020-07-13 14:17:28', 1, 10, 1, 16, 'transferencia', 0, '120200710135209', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200711120307', 1, 296, 0, '2020-07-11 12:03:07', 0, 180, '2020-07-11 12:54:45', 1, 10, 1, 16, 'transferencia', 0, '120200711120307', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200711120531', 1, 295, 0, '2020-07-11 12:05:31', 0, 180, '2020-07-13 14:17:33', 1, 10, 1, 16, 'transferencia', 0, '120200711120531', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200715194200', 1, 274, 0, '2020-07-15 19:42:00', 0, 2500, '2020-07-29 13:16:02', 1, 10, 1, 16, 'transferencia', 0, '120200715194200', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200716143707', 1, 154, 15, '2020-07-16 14:37:07', 0, 4249.15, '2020-07-16 14:55:14', 1, 10, 1, 16, 'transferencia', 0, '120200716143707', 0, NULL, 0, '0', 'titulos/120200716143707.pdf', NULL, NULL, 0),
('120200716165040', 1, 1, 0, '2020-07-16 16:50:40', 0, 190, '2020-07-16 17:38:36', 1, 10, 1, 16, 'transferencia', 0, '120200716165040', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200717120846', 1, 1, 0, '2020-07-17 12:08:46', 0, 580, '2020-07-17 21:03:11', 1, 10, 1, 16, 'transferencia', 0, '120200717120846', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200719162107', 1, 296, 0, '2020-07-19 16:21:07', 0, 90, '2020-07-22 11:39:10', 1, 10, 1, 16, 'transferencia', 0, '120200719162107', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200720134513', 1, 294, 0, '2020-07-20 13:45:13', 0, 308, '2020-09-04 09:51:33', 1, 10, 1, 16, 'transferencia', 0, '120200720134513', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200723202347', 1, 155, 15, '2020-07-23 20:23:47', 0, 4249.15, '2020-07-24 14:45:01', 1, 10, 1, 16, 'transferencia', 0, '120200723202347', 0, NULL, 0, '0', 'titulos/120200723202347.pdf', NULL, NULL, 0),
('120200724182732', 1, 290, 0, '2020-07-24 18:27:32', 0, 673, '2020-07-29 19:43:15', 1, 10, 1, 16, 'transferencia', 0, '120200724182732', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200725171239', 1, 1, 0, '2020-07-25 17:12:39', 0, 120, '2020-07-27 16:46:11', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200727135904', 1, 199, 0, '2020-07-27 13:59:04', 0, 680, '2020-07-28 00:14:47', 1, 10, 1, 16, 'transferencia', 0, '120200727135904', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200727165512', 1, 182, 15, '2020-07-27 16:55:12', 0, 3825, '2020-07-30 12:42:28', 1, 10, 1, 16, 'transferencia', 0, '120200727165512', 0, NULL, 0, '0', 'titulos/120200727165512.pdf', NULL, NULL, 0),
('120200727181614', 1, 1, 0, '2020-07-27 18:16:14', 0, 75, '2020-07-27 18:16:41', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200728140040', 1, 266, 0, '2020-07-28 14:00:40', 0, 580, '2020-07-29 19:29:47', 1, 10, 1, 16, 'transferencia', 0, '120200728140040', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200728194758', 1, 154, 0, '2020-07-28 19:47:58', 0, 2390, '2020-09-07 19:44:46', 1, 10, 1, 16, 'transferencia', 0, '120200728194758', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200730084615', 1, 252, 0, '2020-07-30 08:46:15', 0, 300, '2020-07-30 09:06:15', 1, 10, 1, 16, 'transferencia', 0, '120200730084615', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200801161527', 1, 292, 0, '2020-08-01 16:15:27', 0, 240, '2020-08-01 20:45:40', 1, 9, 1, 16, 'transferencia', 0, '120200801161527', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200804181332', 1, 266, 0, '2020-08-04 18:13:32', 0, 250, '2020-08-06 00:25:12', 1, 1, 1, 16, 'oxxo', 0, '120200804181332', 0, NULL, 0, '93000475162457', '', NULL, NULL, 0),
('120200805200705', 1, 1, 0, '2020-08-05 20:07:05', 0, 290, '2020-08-05 20:07:18', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200807195248', 1, 1, 0, '2020-08-07 19:52:48', 0, 55, '2020-08-07 19:53:14', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200809164733', 1, 304, 0, '2020-08-09 16:47:33', 0, 540, '2020-08-20 17:22:45', 1, 10, 1, 16, 'oxxo', 0, '120200809164733', 0, NULL, 0, '93000482789011', '', NULL, NULL, 0),
('120200810173138', 1, 1, 0, '2020-08-10 17:31:38', 0, 380, '2020-08-10 17:32:26', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200811194742', 1, 306, 0, '2020-08-11 19:47:42', 0, 12196, '2020-08-13 21:22:25', 1, 10, 1, 16, 'transferencia', 0, '120200811194742', 0, NULL, 0, '0', 'titulos/120200811194742.pdf', NULL, NULL, 0),
('120200814100403', 1, 307, 0, '2020-08-14 10:04:03', 0, 3830, '2020-09-07 11:19:11', 1, 10, 1, 16, 'transferencia', 0, '120200814100403', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200815121621', 1, 296, 0, '2020-08-15 12:16:21', 0, 270, '2020-08-16 15:37:43', 1, 10, 1, 16, 'transferencia', 0, '120200815121621', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200817170823', 1, 285, 0, '2020-08-17 17:08:23', 0, 464, '2020-08-17 17:20:42', 1, 10, 1, 16, 'transferencia', 0, '120200817170823', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200817174845', 1, 1, 0, '2020-08-17 17:48:45', 0, 75, '2020-08-17 17:49:26', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200818205714', 1, 309, 0, '2020-08-18 20:57:14', 0, 1999, '2020-08-20 11:48:05', 1, 10, 1, 16, 'transferencia', 0, '120200818205714', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200820200136', 1, 1, 0, '2020-08-20 20:01:36', 0, 0, '2020-08-20 20:03:35', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200822133029', 1, 296, 0, '2020-08-22 13:30:29', 0, 370, '2020-08-22 18:01:56', 1, 10, 1, 16, 'transferencia', 0, '120200822133029', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200822135458', 1, 295, 0, '2020-08-22 13:54:58', 0, 720, '2020-09-05 15:56:20', 1, 10, 1, 16, 'transferencia', 0, '120200822135458', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200822142007', 1, 155, 15, '2020-08-22 14:20:07', 0, 5056.65, '2020-08-22 18:02:17', 1, 10, 1, 16, 'transferencia', 0, '120200822142007', 0, NULL, 0, '0', 'titulos/120200822142007.pdf', NULL, NULL, 0),
('120200823142507', 1, 1, 0, '2020-08-23 14:25:07', 0, 0, '2020-08-23 14:26:36', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200825181518', 1, 154, 0, '2020-08-25 18:15:18', 0, 350, '2020-09-08 18:57:25', 1, 10, 1, 16, 'transferencia', 0, '120200825181518', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200825220509', 1, 1, 0, '2020-08-25 22:05:09', 0, 0, '2020-08-25 22:05:19', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200829131920', 1, 296, 0, '2020-08-29 13:19:20', 0, 735, '2020-08-31 12:48:03', 1, 10, 1, 16, 'transferencia', 0, '120200829131920', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200830133556', 1, 1, 0, '2020-08-30 13:35:56', 0, 220, '2020-08-30 13:36:12', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200831162442', 1, 302, 0, '2020-08-31 16:24:42', 0, 59.4, '2020-08-31 16:27:24', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200901175435', 1, 313, 0, '2020-09-01 17:54:35', 0, 8799, '2020-09-01 18:38:00', 1, 10, 1, 16, 'transferencia', 0, '120200901175435', 0, NULL, 0, '0', 'titulos/120200901175435.pdf', NULL, NULL, 0),
('120200903174256', 1, 198, 0, '2020-09-03 17:42:56', 0, 60, '2020-09-03 17:47:03', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200905104822', 1, 315, 19, '2020-09-05 10:48:22', 0, 4049.19, '2020-09-06 16:02:02', 1, 10, 1, 16, 'transferencia', 0, '120200905104822', 0, NULL, 0, '0', 'titulos/120200905104822.pdf', NULL, NULL, 0),
('120200905154855', 1, 296, 0, '2020-09-05 15:48:55', 0, 670, '2020-09-07 11:21:11', 1, 10, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200907121651', 1, 316, 0, '2020-09-07 12:16:51', 0, 580, '2020-09-07 12:40:45', 1, 10, 1, 16, 'oxxo', 0, '120200907121651', 0, NULL, 0, '93000525999858', '', NULL, NULL, 0),
('120200907173049', 1, 317, 0, '2020-09-07 17:30:49', 0, 336, '2020-09-11 11:55:22', 1, 10, 1, 16, 'transferencia', 0, '120200907173049', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200909213745', 1, 318, 0, '2020-09-09 21:37:45', 0, 4999, '2020-09-11 11:16:57', 1, 10, 1, 16, 'transferencia', 0, '120200909213745', 0, NULL, 0, '0', 'titulos/120200909213745.pdf', NULL, NULL, 0),
('120200910113931', 1, 198, 0, '2020-09-10 11:39:31', 0, 60, '2020-09-10 11:41:10', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200911125555', 1, 188, 0, '2020-09-11 12:55:55', 0, 580, '2020-09-11 14:19:00', 1, 1, 1, 16, 'oxxo', 0, '120200911125555', 0, NULL, 0, '93000532129150', '', NULL, NULL, 0),
('120200913115621', 1, 296, 0, '2020-09-13 11:56:21', 0, 400, '2020-09-14 16:41:54', 1, 10, 1, 16, 'transferencia', 0, '120200913115621', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200913115636', 1, 295, 0, '2020-09-13 11:56:36', 0, 360, '2020-09-14 16:41:44', 1, 10, 1, 16, 'transferencia', 0, '120200913115636', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200914122030', 1, 304, 0, '2020-09-14 12:20:30', 0, 180, '2020-09-19 18:50:41', 1, 10, 1, 16, 'oxxo', 0, '120200914122030', 0, NULL, 0, '93000536865494', '', NULL, NULL, 0),
('120200914182517', 1, 1, 0, '2020-09-14 18:25:17', 0, 460, '2020-09-14 18:26:03', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200914212125', 1, 219, 0, '2020-09-14 21:21:25', 0, 14400, '2021-02-08 22:41:07', 1, 10, 1, 16, 'santander', 0, '120200914212125', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200918191937', 1, 182, 0, '2020-09-18 19:19:37', 0, 180, '2020-10-06 11:49:43', 1, 10, 1, 16, 'oxxo', 0, '120200918191937', 0, NULL, 0, '93000544544156', '', NULL, NULL, 0),
('120200919124057', 1, 155, 0, '2020-09-19 12:40:57', 1, 0, NULL, 1, 10, 1, 16, 'bancopel_isc', 0, '120200919124057', 1, NULL, 0, '93000545717231', '', NULL, NULL, 0),
('120200921151954', 1, 296, 0, '2020-09-21 15:19:54', 0, 620, '2020-09-21 20:28:43', 1, 10, 1, 16, 'transferencia', 0, '120200921151954', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200921192728', 1, 1, 0, '2020-09-21 19:27:28', 0, 150, '2020-09-21 19:27:57', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200924144004', 1, 320, 0, '2020-09-24 14:40:04', 1, 0, NULL, 1, 10, 1, 16, 'paypal', 0, '120200924144004', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120200925232641', 1, 296, 0, '2020-09-25 23:26:41', 0, 220, '2020-09-28 10:31:49', 1, 10, 1, 16, 'bancopel_isc', 0, '120200925232641', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200925232824', 1, 295, 0, '2020-09-25 23:28:24', 0, 360, '2020-10-04 13:48:44', 1, 10, 1, 16, 'bancopel_isc', 0, '120200925232824', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120200926130636', 1, 322, 0, '2020-09-26 13:06:36', 0, 4999, '2020-11-20 19:58:04', 1, 10, 1, 16, 'banamex', 0, '120200926130636', 0, NULL, 0, '0', 'titulos/120200926130636.pdf', NULL, NULL, 0),
('120200928102847', 1, 215, 5, '2020-09-28 10:28:47', 0, 1805, '2020-10-10 12:00:52', 1, 10, 1, 16, 'santander', 0, '120200928102847', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201002122249', 1, 325, 0, '2020-10-02 12:22:49', 0, 150, '2020-10-19 16:01:11', 1, 10, 1, 16, 'oxxo', 0, '120201002122249', 0, NULL, 0, '93000567919905', '', NULL, NULL, 0),
('120201004102140', 1, 296, 0, '2020-10-04 10:21:40', 0, 670, '2020-10-04 13:47:24', 1, 10, 1, 16, 'bancopel_isc', 0, '120201004102140', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201007105346', 1, 266, 0, '2020-10-07 10:53:46', 0, 574, '2020-10-07 13:06:00', 1, 1, 1, 16, 'oxxo', 0, '120201007105346', 0, NULL, 0, '93000575974470', '', NULL, NULL, 0),
('120201008143527', 1, 182, 15, '2020-10-08 14:35:27', 0, 3825, '2020-10-10 12:48:47', 1, 10, 1, 16, 'saldazo', 0, '120201008143527', 0, NULL, 0, '0', 'titulos/120201008143527.pdf', NULL, NULL, 0),
('120201010124929', 1, 318, 0, '2020-10-10 12:49:29', 0, 950, '2020-10-12 14:29:04', 1, 10, 1, 16, 'saldazo', 0, '120201010124929', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201010141626', 1, 319, 0, '2020-10-10 14:16:26', 1, 0, NULL, 1, 10, 1, 16, 'paypal', 0, '120201010141626', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120201010185030', 1, 292, 0, '2020-10-10 18:50:30', 0, 250, '2020-10-12 14:28:42', 1, 10, 1, 16, 'saldazo', 0, '120201010185030', 0, NULL, 0, '93000581423009', '', NULL, NULL, 0),
('120201010195300', 1, 296, 0, '2020-10-10 19:53:00', 0, 330, '2020-10-12 14:28:36', 1, 10, 1, 16, 'bancopel_isc', 0, '120201010195300', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201010195711', 1, 295, 0, '2020-10-10 19:57:11', 0, 180, '2020-10-10 19:59:00', 1, 10, 1, 16, 'bancopel_isc', 0, '120201010195711', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201012143843', 1, 282, 0, '2020-10-12 14:38:43', 0, 2876.8, '2020-10-12 14:41:37', 1, 10, 1, 16, 'santander', 0, '120201012143843', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201013113045', 1, 182, 0, '2020-10-13 11:30:45', 0, 3500, '2020-10-14 23:31:33', 1, 10, 1, 16, 'santander', 0, '120201013113045', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201015104323', 1, 327, 0, '2020-10-15 10:43:23', 0, 6179, '2020-10-15 14:19:49', 1, 10, 1, 16, 'banamex', 0, '120201015104323', 0, NULL, 0, '0', 'titulos/120201015104323.pdf', NULL, NULL, 0),
('120201015145152', 1, 327, 0, '2020-10-15 14:51:52', 0, 1900, '2020-10-28 12:17:28', 1, 10, 1, 16, 'banamex', 0, '120201015145152', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201015182735', 1, 328, 0, '2020-10-15 18:27:35', 0, 3800, '2020-10-22 17:25:47', 1, 10, 1, 16, 'santander', 0, '120201015182735', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201016110556', 1, 316, 0, '2020-10-16 11:05:56', 0, 300, '2020-11-03 22:33:33', 1, 10, 1, 16, 'oxxo', 0, '120201016110556', 0, NULL, 0, '93000591206030', '', NULL, NULL, 0),
('120201016133426', 1, 182, 15, '2020-10-16 13:34:26', 0, 3825, '2020-10-29 11:43:29', 1, 10, 1, 16, 'saldazo', 0, '120201016133426', 0, NULL, 0, '0', 'titulos/120201016133426.pdf', NULL, NULL, 0),
('120201017200447', 1, 296, 0, '2020-10-17 20:04:47', 0, 400, '2020-10-19 00:08:03', 1, 10, 1, 16, 'bancopel_isc', 0, '120201017200447', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201017200755', 1, 295, 0, '2020-10-17 20:07:55', 0, 810, '2020-10-28 12:17:00', 1, 10, 1, 16, 'bancopel_isc', 0, '120201017200755', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201022091818', 1, 329, 0, '2020-10-22 09:18:18', 0, 5413, '2020-10-23 10:44:29', 1, 10, 1, 16, 'paypal', 0, '120201022091818', 0, NULL, 0, '0', 'titulos/120201022091818.pdf', NULL, NULL, 0),
('120201026125807', 1, 296, 0, '2020-10-26 12:58:07', 0, 1040, '2020-10-28 12:16:54', 1, 10, 1, 16, 'bancopel_isc', 0, '120201026125807', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201030202430', 1, 330, 0, '2020-10-30 20:24:30', 0, 4500, '2020-11-03 19:52:44', 1, 10, 1, 16, 'efectivo', 0, '120201030202430', 0, NULL, 0, '0', 'titulos/120201030202430.pdf', NULL, NULL, 0),
('120201031123410', 1, 1, 0, '2020-10-31 12:34:10', 0, 150, '2020-10-31 12:34:32', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201031205458', 1, 199, 0, '2020-10-31 20:54:58', 0, 1900, '2020-10-31 20:54:58', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201031205521', 1, 210, 0, '2020-10-31 20:55:21', 0, 1800, '2020-10-31 20:55:21', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201103120906', 1, 296, 0, '2020-11-03 12:09:06', 0, 330, '2020-11-09 19:51:51', 1, 10, 1, 16, 'bancopel_isc', 0, '120201103120906', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201103121133', 1, 295, 0, '2020-11-03 12:11:33', 0, 810, '2020-11-23 13:31:28', 1, 10, 1, 16, 'bancopel_isc', 0, '120201103121133', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201106131911', 1, 313, 0, '2020-11-06 13:19:11', 0, 3250, '2020-11-09 19:55:01', 1, 10, 1, 16, 'saldazo', 0, '120201106131911', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201109195210', 1, 296, 0, '2020-11-09 19:52:10', 0, 600, '2020-11-10 13:15:11', 1, 10, 1, 16, 'bancopel_isc', 0, '120201109195210', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201112183932', 1, 290, 0, '2020-11-12 18:39:32', 0, 580, '2020-11-14 11:16:55', 1, 10, 1, 16, 'saldazo', 0, '120201112183932', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201113215420', 1, 182, 0, '2020-11-13 21:54:20', 0, 3500, '2020-11-23 12:41:19', 1, 10, 1, 16, 'banamex', 0, '120201113215420', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201114111404', 1, 198, 0, '2020-11-14 11:14:04', 0, 200, '2020-11-14 11:14:57', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201114212243', 1, 335, 15, '2020-11-14 21:22:43', 0, 6967.45, '2020-11-17 22:22:39', 1, 10, 1, 16, 'banamex', 0, '120201114212243', 0, NULL, 0, '0', 'titulos/120201114212243.pdf', NULL, NULL, 0),
('120201116111144', 1, 296, 0, '2020-11-16 11:11:44', 0, 600, '2020-11-17 10:44:05', 1, 10, 1, 16, 'bancopel_isc', 0, '120201116111144', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201123124946', 1, 296, 0, '2020-11-23 12:49:46', 0, 470, '2020-11-23 23:07:19', 1, 10, 1, 16, 'bancopel_isc', 0, '120201123124946', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201123133155', 1, 295, 0, '2020-11-23 13:31:55', 0, 420, '2020-11-24 13:13:06', 1, 10, 1, 16, 'bancopel_isc', 0, '120201123133155', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201124115412', 1, 198, 0, '2020-11-24 11:54:12', 0, 184, '2020-11-24 11:54:57', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201124161743', 1, 338, 0, '2020-11-24 16:17:43', 0, 4500, '2020-11-26 19:17:19', 1, 10, 1, 16, 'efectivo', 0, '120201124161743', 0, NULL, 0, '0', 'titulos/120201124161743.pdf', NULL, NULL, 0),
('120201124193245', 1, 339, 0, '2020-11-24 19:32:45', 0, 0, '2020-11-24 19:33:20', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201124193540', 1, 339, 0, '2020-11-24 19:35:40', 0, 280, '2020-11-26 19:46:35', 1, 10, 1, 16, 'oxxo', 0, '120201124193540', 0, NULL, 0, '93000672262837', '', NULL, NULL, 0),
('120201126114507', 1, 213, 0, '2020-11-26 11:45:07', 0, 580, '2020-11-26 14:43:09', 1, 10, 1, 16, 'oxxo', 0, '120201126114507', 0, NULL, 0, '93000675997264', '', NULL, NULL, 0),
('120201126195821', 1, 338, 0, '2020-11-26 19:58:21', 1, 0, NULL, 1, 10, 1, 16, 'bancopel_isc', 0, '120201126195821', 1, NULL, 0, '93000676626300', '', NULL, NULL, 0),
('120201130103253', 1, 296, 0, '2020-11-30 10:32:53', 0, 440, '2020-12-01 15:43:32', 1, 10, 1, 16, 'bancopel_isc', 0, '120201130103253', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201130104126', 1, 191, 0, '2020-11-30 10:41:26', 1, 0, NULL, 1, 1, 1, 16, 'paypal', 0, '120201130104126', 1, NULL, 0, '93000684945742', '', NULL, NULL, 0),
('120201130174720', 1, 279, 0, '2020-11-30 17:47:20', 0, 500, '2020-12-01 01:25:35', 1, 1, 1, 16, 'bancopel_isc', 0, '120201130174720', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201202115054', 1, 198, 0, '2020-12-02 11:50:54', 0, 192, '2020-12-02 11:51:42', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201207192738', 1, 296, 0, '2020-12-07 19:27:38', 0, 170, '2020-12-12 16:33:15', 1, 10, 1, 16, 'transferencia', 0, '120201207192738', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201210161510', 1, 302, 0, '2020-12-10 16:15:10', 0, 495, '2020-12-10 16:15:54', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201213130813', 1, 294, 0, '2020-12-13 13:08:13', 0, 672.8, '2020-12-15 10:40:47', 1, 10, 1, 16, 'saldazo', 0, '120201213130813', 0, NULL, 0, '0', 'titulos/120201213130813.pdf', NULL, NULL, 0),
('120201214105839', 1, 266, 0, '2020-12-14 10:58:39', 0, 696, '2020-12-15 10:40:18', 1, 10, 1, 16, 'banamex', 0, '120201214105839', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201214162711', 1, 198, 0, '2020-12-14 16:27:11', 0, 81, '2020-12-14 16:28:07', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201214212912', 1, 340, 0, '2020-12-14 21:29:12', 1, 0, NULL, 1, 10, 1, 16, 'paypal', 0, '120201214212912', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120201215104322', 1, 296, 0, '2020-12-15 10:43:22', 0, 620, '2020-12-15 12:43:47', 1, 10, 1, 16, 'bancopel_isc', 0, '120201215104322', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201215111551', 1, 295, 0, '2020-12-15 11:15:51', 0, 700, '2020-12-15 22:31:06', 1, 10, 1, 16, 'bancopel_isc', 0, '120201215111551', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201217155518', 1, 325, 0, '2020-12-17 15:55:18', 1, 0, NULL, 1, 10, 1, 16, 'efectivo', 0, '120201217155518', 1, NULL, 0, '0', '', NULL, NULL, 0);
INSERT INTO `folio_venta` (`folio`, `vendedor`, `client`, `descuento`, `fecha`, `open`, `cobrado`, `fecha_venta`, `cut`, `sucursal`, `cut_global`, `iva`, `t_pago`, `pedido`, `folio_venta_ini`, `cotizacion`, `concepto`, `comision_pagada`, `oxxo_pay`, `titulo`, `f_entrega`, `estrategia`, `facturar`) VALUES
('120201218105500', 1, 198, 0, '2020-12-18 10:55:00', 0, 56, '2020-12-18 10:55:46', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201218141329', 1, 161, 0, '2020-12-18 14:13:29', 1, 0, NULL, 1, 10, 1, 16, 'oxxo', 0, '120201218141329', 1, NULL, 0, '93000726779828', '', NULL, NULL, 0),
('120201220161404', 1, 343, 0, '2020-12-20 16:14:04', 0, 4999, '2020-12-22 16:15:57', 1, 10, 1, 16, 'bancopel_isc', 0, '120201220161404', 0, NULL, 0, '0', 'titulos/120201220161404.pdf', NULL, NULL, 0),
('120201228170127', 1, 344, 0, '2020-12-28 17:01:27', 0, 3500, '2021-01-06 19:38:09', 1, 10, 1, 16, 'bancopel_isc', 0, '120201228170127', 0, NULL, 0, '0', 'titulos/120201228170127.pdf', NULL, NULL, 0),
('120201230172435', 1, 296, 0, '2020-12-30 17:24:35', 0, 350, '2021-01-13 10:57:02', 1, 10, 1, 16, 'bancopel_isc', 0, '120201230172435', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120201230172644', 1, 295, 0, '2020-12-30 17:26:44', 0, 240, '2021-01-13 10:56:31', 1, 10, 1, 16, 'bancopel_isc', 0, '120201230172644', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210102172906', 1, 316, 0, '2021-01-02 17:29:06', 0, 312, '2021-01-02 17:58:15', 1, 10, 1, 16, 'oxxo', 0, '120210102172906', 0, NULL, 0, '93000766215907', '', NULL, NULL, 0),
('120210110121141', 1, 345, 0, '2021-01-10 12:11:41', 0, 140, '2021-01-10 12:13:00', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210112200725', 1, 296, 0, '2021-01-12 20:07:25', 0, 730, '2021-01-13 10:57:25', 1, 10, 1, 16, 'bancopel_isc', 0, '120210112200725', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210112201025', 1, 295, 0, '2021-01-12 20:10:25', 0, 1080, '2021-01-16 14:39:28', 1, 10, 1, 16, 'bancopel_isc', 0, '120210112201025', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210113105038', 1, 277, 0, '2021-01-13 10:50:38', 0, 1900, '2021-01-13 10:50:38', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210114201904', 1, 346, 0, '2021-01-14 20:19:04', 0, 1000, '2021-01-15 11:15:59', 1, 10, 1, 16, 'santander', 0, '120210114201904', 0, NULL, 0, '0', 'titulos/120210114201904.pdf', NULL, NULL, 0),
('120210118203518', 1, 285, 0, '2021-01-18 20:35:18', 0, 928, '2021-01-18 20:38:03', 1, 10, 1, 16, 'banamex', 0, '120210118203518', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210120204658', 1, 295, 0, '2021-01-20 20:46:58', 0, 550, '2021-01-23 12:57:42', 1, 10, 1, 16, 'bancopel_isc', 0, '120210120204658', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210121150755', 1, 335, 0, '2021-01-21 15:07:55', 0, 2900, '2021-02-13 11:22:08', 1, 10, 1, 16, 'bancopel_isc', 0, '120210121150755', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210122101032', 1, 219, 0, '2021-01-22 10:10:32', 1, 0, NULL, 1, 10, 1, 16, 'bancopel_isc', 0, '120210122101032', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210128145640', 1, 295, 0, '2021-01-28 14:56:40', 0, 120, '2021-02-13 11:20:19', 1, 10, 1, 16, 'bancopel_isc', 0, '120210128145640', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210129143418', 1, 347, 0, '2021-01-29 14:34:18', 0, 425, '2021-02-13 11:18:55', 1, 10, 1, 16, 'bancopel_isc', 0, '120210129143418', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210203135257', 1, 348, 0, '2021-02-03 13:52:57', 0, 4500, '2021-02-03 19:35:41', 1, 10, 1, 16, 'bancopel_isc', 0, '120210203135257', 0, NULL, 0, '0', 'titulos/120210203135257.pdf', NULL, NULL, 0),
('120210204102701', 1, 296, 5, '2021-02-04 10:27:01', 0, 798, '2021-02-04 10:57:50', 1, 10, 1, 16, 'bancopel_isc', 0, '120210204102701', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210204141716', 1, 349, 0, '2021-02-04 14:17:16', 0, 4000, '2021-02-11 12:33:36', 1, 10, 1, 16, 'santander', 0, '120210204141716', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210206153434', 1, 350, 0, '2021-02-06 15:34:34', 0, 400, '2021-02-06 15:38:07', 1, 9, 1, 16, 'efectivo', 0, '120210206153434', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210208212753', 1, 351, 0, '2021-02-08 21:27:53', 1, 0, NULL, 1, 10, 1, 16, 'santander', 0, '120210208212753', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210209124912', 1, 352, 7, '2021-02-09 12:49:12', 1, 0, NULL, 1, 10, 1, 16, 'banamex', 0, '120210209124912', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210209190449', 1, 332, 0, '2021-02-09 19:04:49', 0, 400, '2021-02-11 01:27:44', 1, 10, 1, 16, 'paypal', 0, '120210209190449', 0, NULL, 0, '93000869637098', '', NULL, NULL, 0),
('120210210085514', 1, 295, 0, '2021-02-10 08:55:14', 0, 1150, '2021-02-11 01:27:18', 1, 10, 1, 16, 'bancopel_isc', 0, '120210210085514', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210211125522', 1, 353, 0, '2021-02-11 12:55:22', 1, 0, NULL, 1, 10, 1, 16, 'paypal', 0, '120210211125522', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210211173109', 1, 354, 0, '2021-02-11 17:31:09', 0, 928, '2021-02-13 11:31:14', 1, 10, 1, 16, 'banamex', 0, '120210211173109', 0, NULL, 0, '0', 'titulos/120210211173109.pdf', NULL, NULL, 0),
('120210212001457', 1, 315, 0, '2021-02-12 00:14:57', 0, 7000, '2021-02-12 18:06:36', 1, 10, 1, 16, 'santander', 0, '120210212001457', 0, NULL, 0, '93000875693093', 'titulos/120210212001457.pdf', NULL, NULL, 0),
('120210212183901', 1, 355, 0, '2021-02-12 18:39:01', 0, 4999, '2021-02-13 11:17:34', 1, 10, 1, 16, 'saldazo', 0, '120210212183901', 0, NULL, 0, '0', 'titulos/120210212183901.pdf', NULL, NULL, 0),
('120210213124613', 1, 356, 5, '2021-02-13 12:46:13', 1, 0, NULL, 1, 10, 1, 16, 'bancopel_isc', 0, '120210213124613', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210213181913', 1, 357, 40, '2021-02-13 18:19:13', 0, 5847.6, '2021-02-14 13:04:41', 1, 10, 1, 16, 'paypal', 0, '120210213181913', 0, NULL, 0, '0', 'titulos/120210213181913.pdf', NULL, NULL, 0),
('120210217173310', 1, 296, 5, '2021-02-17 17:33:10', 0, 760, '2021-02-18 01:24:23', 1, 10, 1, 16, 'bancopel_isc', 0, '120210217173310', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210220161814', 1, 295, 0, '2021-02-20 16:18:14', 0, 460, '2021-02-21 22:02:53', 1, 10, 1, 16, 'bancopel_isc', 0, '120210220161814', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210221100529', 1, 358, 0, '2021-02-21 10:05:29', 0, 150, '2021-02-21 11:33:20', 1, 10, 1, 16, 'bancopel_isc', 0, '120210221100529', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210222143248', 1, 359, 40, '2021-02-22 14:32:48', 0, 3840, '2021-02-22 18:58:09', 1, 10, 1, 16, 'banamex', 0, '120210222143248', 0, NULL, 0, '0', 'titulos/120210222143248.pdf', NULL, NULL, 0),
('120210225222925', 1, 360, 40, '2021-02-25 22:29:25', 0, 2100, '2021-02-26 22:37:39', 1, 10, 1, 16, 'banamex', 0, '120210225222925', 0, NULL, 0, '0', 'titulos/120210225222925.pdf', NULL, NULL, 0),
('120210228140830', 1, 296, 5, '2021-02-28 14:08:30', 1, 0, NULL, 1, 10, 1, 16, 'bancopel_isc', 0, '120210228140830', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210228230409', 1, 361, 0, '2021-02-28 23:04:09', 1, 0, NULL, 1, 10, 1, 16, 'banamex', 0, '120210228230409', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210301111332', 1, 290, 0, '2021-03-01 11:13:32', 1, 0, NULL, 1, 10, 1, 16, 'banamex', 0, '120210301111332', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210304113830', 1, 242, 0, '2021-03-04 11:38:30', 1, 0, NULL, 1, 10, 1, 16, 'paypal', 0, '120210304113830', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210304151442', 1, 362, 0, '2021-03-04 15:14:42', 0, 800, '2021-03-08 18:52:17', 1, 10, 1, 16, 'bancopel_isc', 0, '120210304151442', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210315175223', 1, 363, 40, '2021-03-15 17:52:23', 0, 3206.4, '2021-03-15 18:58:46', 1, 10, 1, 16, 'paypal', 0, '120210315175223', 0, NULL, 0, '0', 'titulos/120210315175223.pdf', NULL, NULL, 0),
('120210317120354', 1, 364, 0, '2021-03-17 12:03:54', 1, 0, NULL, 1, 10, 1, 16, 'banamex', 0, '120210317120354', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210317120601', 1, 364, 0, '2021-03-17 12:06:01', 1, 0, NULL, 1, 10, 1, 16, 'banamex', 0, '120210317120601', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210317143927', 1, 365, 0, '2021-03-17 14:39:27', 1, 0, NULL, 1, 10, 1, 16, 'bancopel_isc', 0, '120210317143927', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210317200843', 1, 366, 0, '2021-03-17 20:08:43', 0, 0, '2021-03-17 20:09:38', 1, 10, 1, 16, 'efectivo', 0, '120210317200843', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210318000551', 1, 367, 0, '2021-03-18 00:05:51', 0, 4999, '2021-03-18 00:06:45', 1, 10, 1, 16, 'banamex', 0, '120210318000551', 0, NULL, 0, '0', 'titulos/120210318000551.pdf', NULL, NULL, 0),
('120210319144928', 1, 368, 0, '2021-03-19 14:49:28', 0, 4500, '2021-03-19 14:49:52', 1, 10, 1, 16, 'efectivo', 0, '120210319144928', 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210324133229', 1, 369, 0, '2021-03-24 13:32:29', 1, 0, NULL, 1, 10, 1, 16, 'bancopel_isc', 0, '120210324133229', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210324183533', 1, 370, 0, '2021-03-24 18:35:33', 1, 0, NULL, 1, 10, 1, 16, 'santander', 0, '120210324183533', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210330151444', 1, 371, 10, '2021-03-30 15:14:44', 0, 4499.1, '2021-03-31 18:08:55', 1, 10, 1, 16, 'bancopel_isc', 0, '120210330151444', 0, NULL, 0, '0', 'titulos/120210330151444.pdf', NULL, NULL, 0),
('120210330180545', 1, 372, 0, '2021-03-30 18:05:45', 0, 4500, '2021-03-30 18:13:43', 1, 10, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210410103800', 1, 198, 0, '2021-04-10 10:38:00', 0, 104, '2021-04-10 10:40:47', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210427191553', 1, 374, 0, '2021-04-27 19:15:53', 0, 4999, '2021-04-27 19:16:46', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', 'titulos/120210427191553.pdf', NULL, NULL, 0),
('120210428141755', 1, 375, 0, '2021-04-28 14:17:55', 0, 4999, '2021-04-28 14:18:07', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', 'titulos/120210428141755.pdf', NULL, NULL, 0),
('120210430152931', 1, 213, 0, '2021-04-30 15:29:31', 0, 1900, '2021-04-30 15:29:31', 0, 10, 0, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210506223451', 1, 348, 0, '2021-05-06 22:34:51', 0, 1900, '2021-05-06 22:35:32', 0, 10, 0, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210507134841', 1, 376, 0, '2021-05-07 13:48:41', 1, 0, NULL, 0, 10, 0, 16, 'bancopel_isc', 0, '120210507134841', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210511185049', 1, 377, 0, '2021-05-11 18:50:49', 1, 0, NULL, 0, 10, 0, 16, 'bancopel_isc', 0, '120210511185049', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210512124938', 1, 378, 0, '2021-05-12 12:49:38', 1, 0, NULL, 0, 10, 0, 16, 'bancopel_isc', 0, '120210512124938', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210517111226', 1, 290, 0, '2021-05-17 11:12:26', 0, 1900, '2021-05-17 11:13:18', 0, 10, 0, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210528134116', 1, 379, 20, '2021-05-28 13:41:16', 0, 3999.2, '2021-05-28 16:24:03', 0, 10, 0, 16, 'santander', 0, '120210528134116', 0, NULL, 0, '0', 'titulos/120210528134116.pdf', NULL, NULL, 0),
('120210605115505', 1, 296, 5, '2021-06-05 11:55:05', 1, 0, NULL, 0, 10, 0, 16, 'bancopel_isc', 0, '120210605115505', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210606122815', 1, 387, 0, '2021-06-06 12:28:15', 1, 0, NULL, 0, 10, 0, 16, 'banamex', 0, '120210606122815', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210607174051', 1, 390, 20, '2021-06-07 17:40:51', 0, 3600, '2021-06-11 19:22:58', 0, 10, 0, 16, 'santander', 0, '120210607174051', 0, NULL, 0, '0', 'titulos/120210607174051.pdf', NULL, NULL, 0),
('120210608110052', 1, 391, 0, '2021-06-08 11:00:52', 1, 0, NULL, 0, 10, 0, 16, 'banamex', 0, '120210608110052', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210608110204', 1, 391, 0, '2021-06-08 11:02:04', 1, 0, NULL, 0, 10, 0, 16, 'banamex', 0, '120210608110204', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210608110440', 1, 391, 0, '2021-06-08 11:04:40', 1, 0, NULL, 0, 10, 0, 16, 'banamex', 0, '120210608110440', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210608140928', 1, 294, 0, '2021-06-08 14:09:28', 1, 0, NULL, 0, 10, 0, 16, 'bancopel_isc', 0, '120210608140928', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210608173324', 1, 393, 0, '2021-06-08 17:33:24', 1, 0, NULL, 0, 10, 0, 16, 'santander', 0, '120210608173324', 1, NULL, 0, '0', '', NULL, NULL, 0),
('120210611180546', 1, 275, 0, '2021-06-11 18:05:46', 0, 540, '2021-06-11 18:06:47', 0, 1, 0, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210611182235', 1, 394, 0, '2021-06-11 18:22:35', 0, 147, '2021-06-11 18:23:32', 0, 9, 0, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('120210612164732', 1, 198, 0, '2021-06-12 16:47:32', 0, 80, '2021-06-12 16:48:18', 0, 10, 0, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('20190819205346', 1, 1, 0, '2019-08-19 20:53:46', 0, 860, '2019-08-19 20:53:46', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'clta parque leydi', 1, '0', '', NULL, NULL, 0),
('20190819205425', 1, 1, 0, '2019-08-19 20:54:25', 0, 860, '2019-08-19 20:54:25', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'a', 1, '0', '', NULL, NULL, 0),
('20200624211257', 1, 1, 0, '2020-06-24 21:12:57', 0, 830, '2020-06-24 21:12:57', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'Joselin', 0, '0', '', NULL, NULL, 0),
('20200624211710', 1, 1, 0, '2020-06-24 21:17:10', 0, -100, '2020-06-24 21:17:10', 1, 1, 1, 0, 'efectivo', 0, '', 0, '2 ACTAS NACIMIENTO', 0, '0', '', NULL, NULL, 0),
('20200625205804', 1, 1, 0, '2020-06-25 20:58:04', 0, -23, '2020-06-25 20:58:04', 1, 10, 1, 0, 'efectivo', 0, '', 0, '3820200625124629 Producto', 0, '0', '', NULL, NULL, 0),
('20200625212347', 1, 1, 0, '2020-06-25 21:23:47', 0, 410, '2020-06-25 21:23:47', 1, 10, 1, 0, 'efectivo', 0, '', 0, '1 RECARGA 50 MXN ', 0, '0', '', NULL, NULL, 0),
('20200626170633', 1, 1, 0, '2020-06-26 17:06:33', 0, -200, '2020-06-26 17:06:33', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'Servicio luz', 0, '0', '', NULL, NULL, 0),
('20200626172124', 1, 1, 0, '2020-06-26 17:21:24', 0, -4172, '2020-06-26 17:21:24', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'temporal', 0, '0', '', NULL, NULL, 0),
('20200626210546', 1, 1, 0, '2020-06-26 21:05:46', 0, 510, '2020-06-26 21:05:46', 1, 1, 1, 0, 'efectivo', 0, '', 0, '43', 0, '0', '', NULL, NULL, 0),
('20200627202651', 1, 1, 0, '2020-06-27 20:26:51', 0, 450, '2020-06-27 20:26:51', 1, 1, 1, 0, 'efectivo', 0, '', 0, '43', 0, '0', 'titulos/20200627202651.pdf', NULL, NULL, 0),
('20200629200015', 1, 1, 0, '2020-06-29 20:00:15', 0, -80, '2020-06-29 20:00:15', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'Recargas ', 0, '0', '', NULL, NULL, 0),
('20200629200154', 1, 1, 0, '2020-06-29 20:01:54', 0, 120, '2020-06-29 20:01:54', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'USB 16 GB', 0, '0', '', NULL, NULL, 0),
('20200629203132', 38, 1, 0, '2020-06-29 20:31:32', 0, 700, '2020-06-29 20:31:32', 0, 9, 1, 0, 'efectivo', 0, '', 0, 'se queda en caja 28 pesos', 0, '0', '', NULL, NULL, 0),
('20200629204459', 1, 1, 0, '2020-06-29 20:44:59', 0, 700, '2020-06-29 20:44:59', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c. 43, caja 17', 0, '0', '', NULL, NULL, 0),
('20200629204618', 1, 1, 0, '2020-06-29 20:46:18', 0, -120, '2020-06-29 20:46:18', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'Ajuste USB', 0, '0', '', NULL, NULL, 0),
('20200630143912', 37, 1, 0, '2020-06-30 14:39:12', 0, -30, '2020-06-30 14:39:12', 0, 1, 1, 0, 'efectivo', 0, '', 0, 'Recarga', 0, '0', '', NULL, NULL, 0),
('20200630160057', 1, 1, 0, '2020-06-30 16:00:57', 0, -4000, '2020-06-30 16:00:57', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'Faltante de Renta ', 0, '0', '', NULL, NULL, 0),
('20200630203337', 1, 1, 0, '2020-06-30 20:33:37', 0, 785, '2020-06-30 20:33:37', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c 43', 0, '0', '', NULL, NULL, 0),
('20200701173727', 1, 1, 0, '2020-07-01 17:37:27', 0, 365, '2020-07-01 17:37:27', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200702112909', 1, 1, 0, '2020-07-02 11:29:09', 0, 861, '2020-07-02 11:29:09', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200702191007', 1, 1, 0, '2020-07-02 19:10:07', 0, 2295, '2020-07-02 19:10:07', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200703093612', 1, 1, 0, '2020-07-03 09:36:12', 0, -200, '2020-07-03 09:36:12', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Recargas', 0, '0', '', NULL, NULL, 0),
('20200703093813', 1, 1, 0, '2020-07-03 09:38:13', 0, -1145, '2020-07-03 09:38:13', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'Disco duro para refaccion', 0, '0', '', NULL, NULL, 0),
('20200703111621', 1, 1, 0, '2020-07-03 11:16:21', 0, -200, '2020-07-03 11:16:21', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Miguel electrico', 0, '0', '', NULL, NULL, 0),
('20200703125948', 1, 1, 0, '2020-07-03 12:59:48', 0, -1201, '2020-07-03 12:59:48', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'TELMEX 06', 0, '0', '', NULL, NULL, 0),
('20200703130040', 1, 1, 0, '2020-07-03 13:00:40', 0, -399, '2020-07-03 13:00:40', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'TELMEX 05', 0, '0', '', NULL, NULL, 0),
('20200703130109', 1, 1, 0, '2020-07-03 13:01:09', 0, -474, '2020-07-03 13:01:09', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'TELMEX', 0, '0', '', NULL, NULL, 0),
('20200703190715', 1, 1, 0, '2020-07-03 19:07:15', 0, 800, '2020-07-03 19:07:15', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200703204000', 1, 1, 0, '2020-07-03 20:40:00', 0, 50, '2020-07-03 20:40:00', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200704200116', 1, 1, 0, '2020-07-04 20:01:16', 0, 610, '2020-07-04 20:01:16', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Dominio zacatecas', 0, '0', '', NULL, NULL, 0),
('20200705210438', 1, 1, 0, '2020-07-05 21:04:38', 0, 640, '2020-07-05 21:04:38', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200706210641', 1, 1, 0, '2020-07-06 21:06:41', 0, 862, '2020-07-06 21:06:41', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200706211040', 1, 1, 0, '2020-07-06 21:10:40', 0, -1400, '2020-07-06 21:10:40', 1, 10, 1, 0, 'efectivo', 0, '', 0, '88 MARIBEL', 0, '0', '', NULL, NULL, 0),
('20200707162918', 1, 1, 0, '2020-07-07 16:29:18', 0, -250, '2020-07-07 16:29:18', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'actas', 0, '0', '', NULL, NULL, 0),
('20200707163022', 1, 1, 0, '2020-07-07 16:30:22', 0, -450, '2020-07-07 16:30:22', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Diseño tarjetas', 0, '0', '', NULL, NULL, 0),
('20200707212313', 1, 1, 0, '2020-07-07 21:23:13', 0, 100, '2020-07-07 21:23:13', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200707212405', 1, 1, 0, '2020-07-07 21:24:05', 0, 965, '2020-07-07 21:24:05', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200707212447', 1, 1, 0, '2020-07-07 21:24:47', 0, -1500, '2020-07-07 21:24:47', 1, 1, 1, 0, 'efectivo', 0, '', 0, '88 JOSELIN', 0, '0', '', NULL, NULL, 0),
('20200707212941', 1, 1, 0, '2020-07-07 21:29:41', 0, -4479, '2020-07-07 21:29:41', 1, 10, 1, 0, 'efectivo', 0, '', 0, '', 0, '0', '', NULL, NULL, 0),
('20200708210222', 38, 1, 0, '2020-07-08 21:02:22', 0, 670, '2020-07-08 21:02:22', 0, 9, 1, 0, 'efectivo', 0, '', 0, '26', 0, '0', '', NULL, NULL, 0),
('20200708210619', 1, 1, 0, '2020-07-08 21:06:19', 0, 1078, '2020-07-08 21:06:19', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200708210651', 1, 1, 0, '2020-07-08 21:06:51', 0, 2000, '2020-07-08 21:06:51', 1, 10, 1, 0, 'efectivo', 0, '', 0, '88 ADEUDO TIA MARIA', 0, '0', '', NULL, NULL, 0),
('20200709205922', 1, 1, 0, '2020-07-09 20:59:22', 0, -120, '2020-07-09 20:59:22', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'Ajuste usb ', 0, '0', '', NULL, NULL, 0),
('20200709212736', 1, 1, 0, '2020-07-09 21:27:36', 0, 500, '2020-07-09 21:27:36', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200710205447', 38, 1, 0, '2020-07-10 20:54:47', 0, 374, '2020-07-10 20:54:47', 0, 9, 1, 0, 'efectivo', 0, '', 0, '50', 0, '0', '', NULL, NULL, 0),
('20200712201842', 1, 1, 0, '2020-07-12 20:18:42', 0, 215, '2020-07-12 20:18:42', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200712201918', 1, 1, 0, '2020-07-12 20:19:18', 0, 1800, '2020-07-12 20:19:18', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'Dysplay HP', 0, '0', '', NULL, NULL, 0),
('20200713141852', 1, 1, 0, '2020-07-13 14:18:52', 0, -400, '2020-07-13 14:18:52', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'recargas', 0, '0', '', NULL, NULL, 0),
('20200713141925', 1, 1, 0, '2020-07-13 14:19:25', 0, -6900, '2020-07-13 14:19:25', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Reenvolso taxi', 0, '0', '', NULL, NULL, 0),
('20200713141945', 1, 1, 0, '2020-07-13 14:19:45', 0, -1020, '2020-07-13 14:19:45', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Pago arlene ', 0, '0', '', NULL, NULL, 0),
('20200713142015', 1, 1, 0, '2020-07-13 14:20:15', 0, -400, '2020-07-13 14:20:15', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Ac5tas prospero', 0, '0', '', NULL, NULL, 0),
('20200714205609', 1, 1, 0, '2020-07-14 20:56:09', 0, -350, '2020-07-14 20:56:09', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200716161642', 1, 1, 0, '2020-07-16 16:16:42', 0, -5914, '2020-07-16 16:16:42', 1, 10, 1, 0, 'efectivo', 0, '', 0, '2 KIT TONER COLOR, FUSOR PABLO', 0, '0', '', NULL, NULL, 0),
('20200716161817', 1, 1, 0, '2020-07-16 16:18:17', 0, -580, '2020-07-16 16:18:17', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Paquete de hoja', 0, '0', '', NULL, NULL, 0),
('20200716202711', 38, 1, 0, '2020-07-16 20:27:11', 0, 180, '2020-07-16 20:27:11', 0, 9, 1, 0, 'efectivo', 0, '', 0, '12', 0, '0', '', NULL, NULL, 0),
('20200716222621', 1, 1, 0, '2020-07-16 22:26:21', 0, 250, '2020-07-16 22:26:21', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200717205446', 1, 1, 0, '2020-07-17 20:54:46', 0, 405, '2020-07-17 20:54:46', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200717205909', 38, 1, 0, '2020-07-17 20:59:09', 0, 400, '2020-07-17 20:59:09', 0, 9, 1, 0, 'efectivo', 0, '', 0, '49', 0, '0', '', NULL, NULL, 0),
('20200717210928', 1, 1, 0, '2020-07-17 21:09:28', 0, -4200, '2020-07-17 21:09:28', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'leydi y renta ', 0, '0', '', NULL, NULL, 0),
('20200719162822', 1, 1, 0, '2020-07-19 16:28:22', 0, 300, '2020-07-19 16:28:22', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200722114427', 1, 1, 0, '2020-07-22 11:44:27', 0, 1500, '2020-07-22 11:44:27', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200722114500', 1, 1, 0, '2020-07-22 11:45:00', 0, -1400, '2020-07-22 11:45:00', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'maribel', 0, '0', '', NULL, NULL, 0),
('20200722210711', 38, 1, 0, '2020-07-22 21:07:11', 0, 430, '2020-07-22 21:07:11', 0, 9, 1, 0, 'efectivo', 0, '', 0, '67', 0, '0', '', NULL, NULL, 0),
('20200723105020', 1, 1, 0, '2020-07-23 10:50:20', 0, 350, '2020-07-23 10:50:20', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200723184657', 1, 1, 0, '2020-07-23 18:46:57', 0, -260, '2020-07-23 18:46:57', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'agua', 0, '0', '', NULL, NULL, 0),
('20200723184721', 1, 1, 0, '2020-07-23 18:47:21', 0, -300, '2020-07-23 18:47:21', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'agua', 0, '0', '', NULL, NULL, 0),
('20200724194941', 1, 1, 0, '2020-07-24 19:49:41', 0, 450, '2020-07-24 19:49:41', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200724201119', 1, 1, 0, '2020-07-24 20:11:19', 0, -1750, '2020-07-24 20:11:19', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'acceosios  liente', 0, '0', '', NULL, NULL, 0),
('20200724201723', 1, 1, 0, '2020-07-24 20:17:23', 0, -550, '2020-07-24 20:17:23', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'rele', 0, '0', '', NULL, NULL, 0),
('20200729194202', 38, 1, 0, '2020-07-29 19:42:02', 0, 300, '2020-07-29 19:42:02', 0, 9, 1, 0, 'efectivo', 0, '', 0, '40', 0, '0', '', NULL, NULL, 0),
('20200731214643', 1, 1, 0, '2020-07-31 21:46:43', 0, 2000, '2020-07-31 21:46:43', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'c43 pd', 0, '0', '', NULL, NULL, 0),
('20200731214745', 1, 1, 0, '2020-07-31 21:47:45', 0, -12200, '2020-07-31 21:47:45', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'gastos y pagos', 0, '0', '', NULL, NULL, 0),
('20200801154919', 1, 1, 0, '2020-08-01 15:49:19', 0, -7000, '2020-07-31 15:49:19', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'renta', 0, '0', '', NULL, NULL, 0),
('20200803182850', 1, 1, 0, '2020-08-03 18:28:50', 0, -7000, '2020-07-31 18:28:50', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Abono ricardo', 0, '0', '', NULL, NULL, 0),
('20200803183324', 1, 1, 0, '2020-08-03 18:33:24', 0, -573.95, '2020-07-31 18:33:24', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'electra y otros gastos', 0, '0', '', NULL, NULL, 0),
('20200803183600', 1, 1, 0, '2020-08-03 18:36:00', 0, 695, '2020-08-03 18:36:00', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200803183812', 1, 1, 0, '2020-08-03 18:38:12', 0, -240, '2020-08-01 18:38:12', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'ascgar', 0, '0', '', NULL, NULL, 0),
('20200803205417', 1, 1, 0, '2020-08-03 20:54:17', 0, 585, '2020-08-03 20:54:17', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200804185921', 1, 1, 0, '2020-08-04 18:59:21', 0, 430, '2020-08-04 18:59:21', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200804193941', 1, 1, 0, '2020-08-04 19:39:41', 0, 465, '2020-08-04 19:39:41', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200805184922', 1, 1, 0, '2020-08-05 18:49:22', 0, 370, '2020-08-05 18:49:22', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200805201455', 1, 1, 0, '2020-08-05 20:14:55', 0, 460, '2020-08-05 20:14:55', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200806195803', 38, 1, 0, '2020-08-06 19:58:03', 0, 410, '2020-08-06 19:58:03', 0, 9, 1, 0, 'efectivo', 0, '', 0, '26', 0, '0', '', NULL, NULL, 0),
('20200806203914', 1, 1, 0, '2020-08-06 20:39:14', 0, -250, '2020-08-06 20:39:14', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'recargas', 0, '0', '', NULL, NULL, 0),
('20200806204147', 1, 1, 0, '2020-08-06 20:41:47', 0, 650, '2020-08-06 20:41:47', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200806204251', 1, 1, 0, '2020-08-06 20:42:51', 0, -1500, '2020-08-06 20:42:51', 1, 1, 1, 0, 'efectivo', 0, '', 0, '88 Joselin', 0, '0', '', NULL, NULL, 0),
('20200807112047', 1, 1, 0, '2020-08-07 11:20:47', 0, -1200, '2020-08-07 11:20:47', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200807112126', 1, 1, 0, '2020-08-07 11:21:26', 0, -400, '2020-08-07 11:21:26', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'telmex', 0, '0', '', NULL, NULL, 0),
('20200807112534', 1, 1, 0, '2020-08-07 11:25:34', 0, -100, '2020-08-07 11:25:34', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'actas', 0, '0', '', NULL, NULL, 0),
('20200807185212', 1, 1, 0, '2020-08-07 18:52:12', 0, 890, '2020-08-07 18:52:12', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200807195436', 1, 1, 0, '2020-08-07 19:54:36', 0, 535, '2020-08-07 19:54:36', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200807195737', 1, 1, 0, '2020-08-07 19:57:37', 0, -240, '2020-08-07 19:57:37', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'usb Arlene', 0, '0', '', NULL, NULL, 0),
('20200808191118', 1, 1, 0, '2020-08-08 19:11:18', 0, 300, '2020-08-08 19:11:18', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200808203204', 1, 1, 0, '2020-08-08 20:32:04', 0, 300, '2020-08-08 20:32:04', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'C44', 0, '0', '', NULL, NULL, 0),
('20200809161032', 38, 1, 0, '2020-08-09 16:10:32', 0, 150, '2020-08-09 16:10:32', 0, 9, 1, 0, 'efectivo', 0, '', 0, '3', 0, '0', '', NULL, NULL, 0),
('20200809161124', 38, 1, 0, '2020-08-09 16:11:24', 0, 100, '2020-08-09 16:11:24', 0, 9, 1, 0, 'efectivo', 0, '', 0, '', 0, '0', '', NULL, NULL, 0),
('20200809171603', 1, 1, 0, '2020-08-09 17:16:03', 0, 250, '2020-08-09 17:16:03', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200810191658', 1, 1, 0, '2020-08-10 19:16:58', 0, 1045, '2020-08-10 19:16:58', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200810193235', 1, 1, 0, '2020-08-10 19:32:35', 0, 640, '2020-08-10 19:32:35', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200810194109', 1, 1, 0, '2020-08-10 19:41:09', 0, -650, '2020-08-10 19:41:09', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Telmex 101 y actas ', 0, '0', '', NULL, NULL, 0),
('20200811195642', 1, 1, 0, '2020-08-11 19:56:42', 0, 900, '2020-08-11 19:56:42', 1, 9, 1, 0, 'efectivo', 0, '', 0, '43', 0, '0', '', NULL, NULL, 0),
('20200811200214', 1, 1, 0, '2020-08-11 20:02:14', 0, 655, '2020-08-11 20:02:14', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200812192116', 38, 1, 0, '2020-08-12 19:21:16', 0, 446, '2020-08-12 19:21:16', 0, 9, 1, 0, 'efectivo', 0, '', 0, '26', 0, '0', '', NULL, NULL, 0),
('20200813195405', 1, 1, 0, '2020-08-13 19:54:05', 0, 830, '2020-08-13 19:54:05', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200813195422', 1, 1, 0, '2020-08-13 19:54:22', 0, 920, '2020-08-13 19:54:22', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200815201631', 1, 1, 0, '2020-08-15 20:16:31', 0, 360, '2020-08-15 20:16:31', 1, 9, 1, 0, 'efectivo', 0, '', 0, '43', 0, '0', '', NULL, NULL, 0),
('20200815201649', 1, 1, 0, '2020-08-15 20:16:49', 0, 506, '2020-08-15 20:16:49', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200815201730', 1, 1, 0, '2020-08-15 20:17:30', 0, 800, '2020-08-15 20:17:30', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'C43 ', 0, '0', '', NULL, NULL, 0),
('20200815201750', 1, 1, 0, '2020-08-15 20:17:50', 0, -716, '2020-08-15 20:17:50', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Ascgar.com', 0, '0', '', NULL, NULL, 0),
('20200815202046', 1, 1, 0, '2020-08-15 20:20:46', 0, -4120, '2020-08-15 20:20:46', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Chapa, caller Id, próspero, actas', 0, '0', '', NULL, NULL, 0),
('20200816161056', 38, 1, 0, '2020-08-16 16:10:56', 0, 450, '2020-08-16 16:10:56', 0, 9, 1, 0, 'efectivo', 0, '', 0, '16', 0, '0', '', NULL, NULL, 0),
('20200816204911', 1, 1, 0, '2020-08-16 20:49:11', 0, 600, '2020-08-16 20:49:11', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200816204942', 1, 1, 0, '2020-08-16 20:49:42', 0, -1010, '2020-08-16 20:49:42', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'actas+guias', 0, '0', '', NULL, NULL, 0),
('20200816205005', 1, 1, 0, '2020-08-16 20:50:05', 0, -360, '2020-08-16 20:50:05', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'radio baofeng', 0, '0', '', NULL, NULL, 0),
('20200817191243', 1, 1, 0, '2020-08-17 19:12:43', 0, 1540, '2020-08-17 19:12:43', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200817191323', 1, 1, 0, '2020-08-17 19:13:23', 0, 955, '2020-08-17 19:13:23', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200817222008', 1, 1, 0, '2020-08-17 22:20:08', 0, -2753, '2020-08-17 22:20:08', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'Guias, disco duro, lector de huella ', 0, '0', '', NULL, NULL, 0),
('20200818194822', 1, 1, 0, '2020-08-18 19:48:22', 0, 845, '2020-08-18 19:48:22', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200818194855', 1, 1, 0, '2020-08-18 19:48:55', 0, 785, '2020-08-18 19:48:55', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200819194346', 38, 1, 0, '2020-08-19 19:43:46', 0, 900, '2020-08-19 19:43:46', 0, 9, 1, 0, 'efectivo', 0, '', 0, '36', 0, '0', '', NULL, NULL, 0),
('20200820192415', 1, 1, 0, '2020-08-20 19:24:15', 0, 940, '2020-08-20 19:24:15', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200820192437', 1, 1, 0, '2020-08-20 19:24:37', 0, 690, '2020-08-20 19:24:37', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200821215024', 1, 1, 0, '2020-08-21 21:50:24', 0, 1125, '2020-08-21 21:50:24', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200821215048', 1, 1, 0, '2020-08-21 21:50:48', 0, 700, '2020-08-21 21:50:48', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200821215107', 1, 1, 0, '2020-08-21 21:51:07', 0, -1500, '2020-08-21 21:51:07', 1, 10, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200822182253', 1, 1, 0, '2020-08-22 18:22:53', 0, 295, '2020-08-22 18:22:53', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'C43', 0, '0', '', NULL, NULL, 0),
('20200823141814', 38, 1, 0, '2020-08-23 14:18:14', 0, 290, '2020-08-23 14:18:14', 0, 9, 1, 0, 'efectivo', 0, '', 0, '18', 0, '0', '', NULL, NULL, 0),
('20200824192452', 1, 1, 0, '2020-08-24 19:24:52', 0, 1110, '2020-08-24 19:24:52', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200824192546', 1, 1, 0, '2020-08-24 19:25:46', 0, 1275, '2020-08-24 19:25:46', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200826202141', 38, 1, 0, '2020-08-26 20:21:41', 0, 1850, '2020-08-26 20:21:41', 0, 9, 1, 0, 'efectivo', 0, '', 0, '37', 0, '0', '', NULL, NULL, 0),
('20200828163734', 38, 1, 0, '2020-08-28 16:37:34', 0, 365, '2020-08-28 16:37:34', 0, 9, 1, 0, 'efectivo', 0, '', 0, '19', 0, '0', '', NULL, NULL, 0),
('20200829182012', 38, 1, 0, '2020-08-29 18:20:12', 0, 200, '2020-08-29 18:20:12', 0, 9, 1, 0, 'efectivo', 0, '', 0, '17', 0, '0', '', NULL, NULL, 0),
('20200902193422', 38, 1, 0, '2020-09-02 19:34:22', 0, 800, '2020-09-02 19:34:22', 0, 9, 1, 0, 'efectivo', 0, '', 0, '14', 0, '0', '', NULL, NULL, 0),
('20200903163328', 38, 1, 0, '2020-09-03 16:33:28', 0, 600, '2020-09-03 16:33:28', 0, 9, 1, 0, 'efectivo', 0, '', 0, '21', 0, '0', '', NULL, NULL, 0),
('20200906161748', 38, 1, 0, '2020-09-06 16:17:48', 0, 875, '2020-09-06 16:17:48', 0, 9, 1, 0, 'efectivo', 0, '', 0, '15', 0, '0', '', NULL, NULL, 0),
('20200908185430', 1, 1, 0, '2020-09-08 18:54:30', 0, 1295, '2020-09-08 18:54:30', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'c43', 0, '0', '', NULL, NULL, 0),
('20200909204100', 38, 1, 0, '2020-09-09 20:41:00', 0, 920, '2020-09-09 20:41:00', 0, 9, 1, 0, 'efectivo', 0, '', 0, '36', 0, '0', '', NULL, NULL, 0),
('20200910162550', 38, 1, 0, '2020-09-10 16:25:50', 0, 685, '2020-09-10 16:25:50', 0, 9, 1, 0, 'efectivo', 0, '', 0, '15', 0, '0', '', NULL, NULL, 0),
('20200916203201', 38, 1, 0, '2020-09-16 20:32:01', 0, 1030, '2020-09-16 20:32:01', 0, 9, 1, 0, 'efectivo', 0, '', 0, '11.5', 0, '0', '', NULL, NULL, 0),
('20200921192517', 38, 1, 0, '2020-09-21 19:25:17', 0, 1200, '2020-09-21 19:25:17', 0, 9, 1, 0, 'efectivo', 0, '', 0, '17', 0, '0', '', NULL, NULL, 0),
('20200928193829', 38, 1, 0, '2020-09-28 19:38:29', 0, 2350, '2020-09-28 19:38:29', 0, 9, 1, 0, 'efectivo', 0, '', 0, '36', 0, '0', '', NULL, NULL, 0),
('20201012202952', 38, 1, 0, '2020-10-12 20:29:52', 0, 1620, '2020-10-12 20:29:52', 0, 9, 1, 0, 'efectivo', 0, '', 0, '18', 0, '0', '', NULL, NULL, 0),
('20201019205233', 38, 1, 0, '2020-10-19 20:52:33', 0, 2000, '2020-10-19 20:52:33', 0, 9, 1, 0, 'efectivo', 0, '', 0, '40', 0, '0', '', NULL, NULL, 0),
('20201022204611', 38, 1, 0, '2020-10-22 20:46:11', 0, 1050, '2020-10-22 20:46:11', 0, 9, 1, 0, 'efectivo', 0, '', 0, '64', 0, '0', '', NULL, NULL, 0),
('20201026201622', 38, 1, 0, '2020-10-26 20:16:22', 0, 1075, '2020-10-26 20:16:22', 0, 9, 1, 0, 'efectivo', 0, '', 0, '49', 0, '0', '', NULL, NULL, 0),
('20201102203541', 38, 1, 0, '2020-11-02 20:35:41', 0, 570, '2020-11-02 20:35:41', 0, 9, 1, 0, 'efectivo', 0, '', 0, '25', 0, '0', '', NULL, NULL, 0),
('20201109205939', 38, 1, 0, '2020-11-09 20:59:39', 0, 1100, '2020-11-09 20:59:39', 0, 9, 1, 0, 'efectivo', 0, '', 0, '18', 0, '0', '', NULL, NULL, 0),
('20201115150833', 38, 1, 0, '2020-11-15 15:08:33', 0, 1100, '2020-11-15 15:08:33', 0, 9, 1, 0, 'efectivo', 0, '', 0, '9', 0, '0', '', NULL, NULL, 0),
('20201116204146', 38, 1, 0, '2020-11-16 20:41:46', 0, 600, '2020-11-16 20:41:46', 0, 9, 1, 0, 'efectivo', 0, '', 0, '16', 0, '0', '', NULL, NULL, 0),
('20201123210602', 38, 1, 0, '2020-11-23 21:06:02', 0, 1470, '2020-11-23 21:06:02', 0, 9, 1, 0, 'efectivo', 0, '', 0, '22', 0, '0', '', NULL, NULL, 0),
('20201130205723', 38, 1, 0, '2020-11-30 20:57:23', 0, 815, '2020-11-30 20:57:23', 0, 9, 1, 0, 'efectivo', 0, '', 0, '43', 0, '0', '', NULL, NULL, 0),
('20201204205709', 38, 1, 0, '2020-12-04 20:57:09', 0, 580, '2020-12-04 20:57:09', 0, 9, 1, 0, 'efectivo', 0, '', 0, '35', 0, '0', '', NULL, NULL, 0),
('20201214204046', 38, 1, 0, '2020-12-14 20:40:46', 0, 1015, '2020-12-14 20:40:46', 0, 9, 1, 0, 'efectivo', 0, '', 0, '23.5', 0, '0', '', NULL, NULL, 0),
('20201219145732', 38, 1, 0, '2020-12-19 14:57:32', 0, 350, '2020-12-19 14:57:32', 0, 9, 1, 0, 'efectivo', 0, '', 0, '49', 0, '0', '', NULL, NULL, 0),
('20201220120250', 38, 1, 0, '2020-12-20 12:02:50', 0, 270, '2020-12-20 12:02:50', 0, 9, 1, 0, 'efectivo', 0, '', 0, '35', 0, '0', '', NULL, NULL, 0),
('20201221210453', 38, 1, 0, '2020-12-21 21:04:53', 0, 420, '2020-12-21 21:04:53', 0, 9, 1, 0, 'efectivo', 0, '', 0, '37', 0, '0', '', NULL, NULL, 0),
('20201227205515', 38, 1, 0, '2020-12-27 20:55:15', 0, 665, '2020-12-27 20:55:15', 0, 9, 1, 0, 'efectivo', 0, '', 0, '665', 0, '0', '', NULL, NULL, 0),
('20201228203406', 38, 1, 0, '2020-12-28 20:34:06', 0, 1190, '2020-12-28 20:34:06', 0, 9, 1, 0, 'efectivo', 0, '', 0, '11.5', 0, '0', '', NULL, NULL, 0),
('20210104205957', 38, 1, 0, '2021-01-04 20:59:57', 0, 2120, '2021-01-04 20:59:57', 0, 9, 1, 0, 'efectivo', 0, '', 0, '50', 0, '0', '', NULL, NULL, 0),
('20210129204930', 38, 1, 0, '2021-01-29 20:49:30', 0, 1020, '2021-01-29 20:49:30', 0, 9, 1, 0, 'efectivo', 0, '', 0, '21', 0, '0', '', NULL, NULL, 0),
('20210215184734', 38, 1, 0, '2021-02-15 18:47:34', 0, 1470, '2021-02-15 18:47:34', 0, 9, 1, 0, 'efectivo', 0, '', 0, '16', 0, '0', '', NULL, NULL, 0),
('20210216175242', 42, 1, 0, '2021-02-16 17:52:42', 0, 180, '2021-02-16 17:52:42', 0, 11, 1, 0, 'efectivo', 0, '', 0, '62.5', 0, '0', '', NULL, NULL, 0),
('20210216183013', 38, 1, 0, '2021-02-16 18:30:13', 0, 1400, '2021-02-16 18:30:13', 0, 9, 1, 0, 'efectivo', 0, '', 0, '1', 0, '0', '', NULL, NULL, 0),
('20210217180902', 38, 1, 0, '2021-02-17 18:09:02', 0, 1270, '2021-02-17 18:09:02', 0, 9, 1, 0, 'efectivo', 0, '', 0, '4', 0, '0', '', NULL, NULL, 0),
('20210218183826', 38, 1, 0, '2021-02-18 18:38:26', 0, 1270, '2021-02-18 18:38:26', 0, 9, 1, 0, 'efectivo', 0, '', 0, '8', 0, '0', '', NULL, NULL, 0),
('20210219181001', 42, 1, 0, '2021-02-19 18:10:01', 0, 150, '2021-02-19 18:10:01', 0, 11, 1, 0, 'efectivo', 0, '', 0, '83.5', 0, '0', '', NULL, NULL, 0),
('20210219183023', 38, 1, 0, '2021-02-19 18:30:23', 0, 780, '2021-02-19 18:30:23', 0, 9, 1, 0, 'efectivo', 0, '', 0, '23', 0, '0', '', NULL, NULL, 0),
('20210220210801', 38, 1, 0, '2021-02-20 21:08:01', 0, 220, '2021-02-20 21:08:01', 0, 9, 1, 0, 'efectivo', 0, '', 0, '18', 0, '0', '', NULL, NULL, 0),
('20210221175142', 42, 1, 0, '2021-02-21 17:51:42', 0, 80, '2021-02-21 17:51:42', 0, 11, 1, 0, 'efectivo', 0, '', 0, '74.5', 0, '0', '', NULL, NULL, 0),
('20210222175747', 42, 1, 0, '2021-02-22 17:57:47', 0, 220, '2021-02-22 17:57:47', 0, 11, 1, 0, 'efectivo', 0, '', 0, '67.5', 0, '0', '', NULL, NULL, 0),
('20210222185624', 38, 1, 0, '2021-02-22 18:56:24', 0, 1185, '2021-02-22 18:56:24', 0, 9, 1, 0, 'efectivo', 0, '', 0, '14', 0, '0', '', NULL, NULL, 0),
('20210223174751', 42, 1, 0, '2021-02-23 17:47:51', 0, 150, '2021-02-23 17:47:51', 0, 11, 1, 0, 'efectivo', 0, '', 0, '102', 0, '0', '', NULL, NULL, 0),
('20210223182610', 38, 1, 0, '2021-02-23 18:26:10', 0, 610, '2021-02-23 18:26:10', 0, 9, 1, 0, 'efectivo', 0, '', 0, '35', 0, '0', '', NULL, NULL, 0),
('20210224210724', 42, 1, 0, '2021-02-24 21:07:24', 0, 680, '2021-02-24 21:07:24', 0, 9, 1, 0, 'efectivo', 0, '', 0, '37', 0, '0', '', NULL, NULL, 0),
('20210225204959', 38, 1, 0, '2021-02-25 20:49:59', 0, 655, '2021-02-25 20:49:59', 0, 9, 1, 0, 'efectivo', 0, '', 0, '41', 0, '0', '', NULL, NULL, 0),
('20210226200835', 42, 1, 0, '2021-02-26 20:08:35', 0, 1100, '2021-02-26 20:08:35', 0, 9, 1, 0, 'efectivo', 0, '', 0, '55', 0, '0', '', NULL, NULL, 0),
('20210227204722', 42, 1, 0, '2021-02-27 20:47:22', 0, 600, '2021-02-27 20:47:22', 0, 9, 1, 0, 'efectivo', 0, '', 0, '33.5', 0, '0', '', NULL, NULL, 0),
('20210228204926', 42, 1, 0, '2021-02-28 20:49:26', 0, 1250, '2021-02-28 20:49:26', 0, 9, 1, 0, 'efectivo', 0, '', 0, '52.5', 0, '0', '', NULL, NULL, 0),
('20210301205031', 42, 1, 0, '2021-03-01 20:50:31', 0, 1000, '2021-03-01 20:50:31', 0, 9, 1, 0, 'efectivo', 0, '', 0, '44', 0, '0', '', NULL, NULL, 0),
('20210302204103', 42, 1, 0, '2021-03-02 20:41:03', 0, 1290, '2021-03-02 20:41:03', 0, 9, 1, 0, 'efectivo', 0, '', 0, '42', 0, '0', '', NULL, NULL, 0),
('20210303204812', 42, 1, 0, '2021-03-03 20:48:12', 0, 1700, '2021-03-03 20:48:12', 0, 9, 1, 0, 'efectivo', 0, '', 0, '56.5', 0, '0', '', NULL, NULL, 0),
('20210304205444', 38, 1, 0, '2021-03-04 20:54:44', 0, 1505, '2021-03-04 20:54:44', 0, 9, 1, 0, 'efectivo', 0, '', 0, '23.5', 0, '0', '', NULL, NULL, 0),
('20210305210841', 38, 1, 0, '2021-03-05 21:08:41', 0, 820, '2021-03-05 21:08:41', 0, 9, 1, 0, 'efectivo', 0, '', 0, '12', 0, '0', '', NULL, NULL, 0),
('20210306201147', 42, 1, 0, '2021-03-06 20:11:47', 0, 600, '2021-03-06 20:11:47', 0, 9, 1, 0, 'efectivo', 0, '', 0, '65', 0, '0', '', NULL, NULL, 0),
('20210307202326', 42, 1, 0, '2021-03-07 20:23:26', 0, 450, '2021-03-07 20:23:26', 0, 9, 1, 0, 'efectivo', 0, '', 0, '50', 0, '0', '', NULL, NULL, 0),
('20210308204517', 42, 1, 0, '2021-03-08 20:45:17', 0, 1800, '2021-03-08 20:45:17', 0, 9, 1, 0, 'efectivo', 0, '', 0, '42.5', 0, '0', '', NULL, NULL, 0),
('20210309205220', 42, 1, 0, '2021-03-09 20:52:20', 0, 700, '2021-03-09 20:52:20', 0, 9, 1, 0, 'efectivo', 0, '', 0, '59', 0, '0', '', NULL, NULL, 0),
('20210310203446', 42, 1, 0, '2021-03-10 20:34:46', 0, 1000, '2021-03-10 20:34:46', 0, 9, 1, 0, 'efectivo', 0, '', 0, '76', 0, '0', '', NULL, NULL, 0),
('20210311210230', 42, 1, 0, '2021-03-11 21:02:30', 0, 1000, '2021-03-11 21:02:30', 0, 9, 1, 0, 'efectivo', 0, '', 0, '53', 0, '0', '', NULL, NULL, 0),
('20210312200949', 38, 1, 0, '2021-03-12 20:09:49', 0, 700, '2021-03-12 20:09:49', 0, 9, 1, 0, 'efectivo', 0, '', 0, '49', 0, '0', '', NULL, NULL, 0),
('20210313194249', 42, 1, 0, '2021-03-13 19:42:49', 0, 290, '2021-03-13 19:42:49', 0, 9, 1, 0, 'efectivo', 0, '', 0, '43.5', 0, '0', '', NULL, NULL, 0),
('20210314205320', 42, 1, 0, '2021-03-14 20:53:20', 0, 280, '2021-03-14 20:53:20', 0, 9, 1, 0, 'efectivo', 0, '', 0, '24.5', 0, '0', '', NULL, NULL, 0),
('20210315210453', 42, 1, 0, '2021-03-15 21:04:53', 0, 250, '2021-03-15 21:04:53', 0, 9, 1, 0, 'efectivo', 0, '', 0, '39', 0, '0', '', NULL, NULL, 0),
('20210316205253', 42, 1, 0, '2021-03-16 20:52:53', 0, 1480, '2021-03-16 20:52:53', 0, 9, 1, 0, 'efectivo', 0, '', 0, '38.5', 0, '0', '', NULL, NULL, 0),
('20210317205004', 42, 1, 0, '2021-03-17 20:50:04', 0, 850, '2021-03-17 20:50:04', 0, 9, 1, 0, 'efectivo', 0, '', 0, '11.5', 0, '0', '', NULL, NULL, 0),
('20210318194145', 42, 1, 0, '2021-03-18 19:41:45', 0, 800, '2021-03-18 19:41:45', 0, 9, 1, 0, 'efectivo', 0, '', 0, '30', 0, '0', '', NULL, NULL, 0),
('20210319211121', 38, 1, 0, '2021-03-19 21:11:21', 0, 650, '2021-03-19 21:11:21', 0, 9, 1, 0, 'efectivo', 0, '', 0, '33', 0, '0', '', NULL, NULL, 0),
('20210320204718', 42, 1, 0, '2021-03-20 20:47:18', 0, 650, '2021-03-20 20:47:18', 0, 9, 1, 0, 'efectivo', 0, '', 0, '34', 0, '0', '', NULL, NULL, 0),
('20210321205424', 42, 1, 0, '2021-03-21 20:54:24', 0, 750, '2021-03-21 20:54:24', 0, 9, 1, 0, 'efectivo', 0, '', 0, '52', 0, '0', '', NULL, NULL, 0),
('20210322205455', 42, 1, 0, '2021-03-22 20:54:55', 0, 1100, '2021-03-22 20:54:55', 0, 9, 1, 0, 'efectivo', 0, '', 0, '54', 0, '0', '', NULL, NULL, 0),
('20210323205716', 42, 1, 0, '2021-03-23 20:57:16', 0, 1350, '2021-03-23 20:57:16', 0, 9, 1, 0, 'efectivo', 0, '', 0, '33.5', 0, '0', '', NULL, NULL, 0),
('20210324205128', 42, 1, 0, '2021-03-24 20:51:28', 0, 640, '2021-03-24 20:51:28', 0, 9, 1, 0, 'efectivo', 0, '', 0, '31', 0, '0', '', NULL, NULL, 0),
('20210325205611', 42, 1, 0, '2021-03-25 20:56:11', 0, 700, '2021-03-25 20:56:11', 0, 9, 1, 0, 'efectivo', 0, '', 0, '49.5', 0, '0', '', NULL, NULL, 0),
('20210326210137', 38, 1, 0, '2021-03-26 21:01:37', 0, 760, '2021-03-26 21:01:37', 0, 9, 1, 0, 'efectivo', 0, '', 0, '40', 0, '0', '', NULL, NULL, 0),
('20210327202345', 42, 1, 0, '2021-03-27 20:23:45', 0, 600, '2021-03-27 20:23:45', 0, 9, 1, 0, 'efectivo', 0, '', 0, '53', 0, '0', '', NULL, NULL, 0),
('20210328202411', 42, 1, 0, '2021-03-28 20:24:11', 0, 800, '2021-03-28 20:24:11', 0, 9, 1, 0, 'efectivo', 0, '', 0, '19.5', 0, '0', '', NULL, NULL, 0),
('20210329203409', 42, 1, 0, '2021-03-29 20:34:09', 0, 550, '2021-03-29 20:34:09', 0, 9, 1, 0, 'efectivo', 0, '', 0, '25', 0, '0', '', NULL, NULL, 0),
('20210330210404', 42, 1, 0, '2021-03-30 21:04:04', 0, 700, '2021-03-30 21:04:04', 0, 9, 1, 0, 'efectivo', 0, '', 0, '14', 0, '0', '', NULL, NULL, 0),
('20210331205059', 42, 1, 0, '2021-03-31 20:50:59', 0, 700, '2021-03-31 20:50:59', 0, 9, 1, 0, 'efectivo', 0, '', 0, '57', 0, '0', '', NULL, NULL, 0),
('20210401205629', 42, 1, 0, '2021-04-01 20:56:29', 0, 200, '2021-04-01 20:56:29', 0, 9, 1, 0, 'efectivo', 0, '', 0, '41.5', 0, '0', '', NULL, NULL, 0),
('20210402184607', 38, 1, 0, '2021-04-02 18:46:07', 0, 600, '2021-04-02 18:46:07', 0, 9, 1, 0, 'efectivo', 0, '', 0, '46', 0, '0', '', NULL, NULL, 0),
('20210403193649', 42, 1, 0, '2021-04-03 19:36:49', 0, 620, '2021-04-03 19:36:49', 0, 9, 1, 0, 'efectivo', 0, '', 0, '69', 0, '0', '', NULL, NULL, 0),
('20210404202903', 42, 1, 0, '2021-04-04 20:29:03', 0, 550, '2021-04-04 20:29:03', 0, 9, 1, 0, 'efectivo', 0, '', 0, '63.5', 0, '0', '', NULL, NULL, 0),
('20210405205847', 38, 1, 0, '2021-04-05 20:58:47', 0, 320, '2021-04-05 20:58:47', 0, 9, 1, 0, 'efectivo', 0, '', 0, '6', 0, '0', '', NULL, NULL, 0),
('20210406204739', 42, 1, 0, '2021-04-06 20:47:39', 0, 650, '2021-04-06 20:47:39', 0, 9, 1, 0, 'efectivo', 0, '', 0, '25.5', 0, '0', '', NULL, NULL, 0),
('20210407205018', 42, 1, 0, '2021-04-07 20:50:18', 0, 700, '2021-04-07 20:50:18', 0, 9, 1, 0, 'efectivo', 0, '', 0, '77.5', 0, '0', '', NULL, NULL, 0),
('20210408203859', 42, 1, 0, '2021-04-08 20:38:59', 0, 450, '2021-04-08 20:38:59', 0, 9, 1, 0, 'efectivo', 0, '', 0, '67.5', 0, '0', '', NULL, NULL, 0),
('20210409203142', 38, 1, 0, '2021-04-09 20:31:42', 0, 500, '2021-04-09 20:31:42', 0, 9, 1, 0, 'efectivo', 0, '', 0, '28', 0, '0', '', NULL, NULL, 0),
('20210410202946', 42, 1, 0, '2021-04-10 20:29:46', 0, 300, '2021-04-10 20:29:46', 0, 9, 1, 0, 'efectivo', 0, '', 0, '44.5', 0, '0', '', NULL, NULL, 0),
('20210411190941', 42, 1, 0, '2021-04-11 19:09:41', 0, 350, '2021-04-11 19:09:41', 0, 9, 1, 0, 'efectivo', 0, '', 0, '40.5', 0, '0', '', NULL, NULL, 0),
('20210412204955', 42, 1, 0, '2021-04-12 20:49:55', 0, 900, '2021-04-12 20:49:55', 0, 9, 1, 0, 'efectivo', 0, '', 0, '21', 0, '0', '', NULL, NULL, 0),
('20210413202839', 42, 1, 0, '2021-04-13 20:28:39', 0, 900, '2021-04-13 20:28:39', 0, 9, 1, 0, 'efectivo', 0, '', 0, '64', 0, '0', '', NULL, NULL, 0),
('20210414205236', 42, 1, 0, '2021-04-14 20:52:36', 0, 550, '2021-04-14 20:52:36', 0, 9, 1, 0, 'efectivo', 0, '', 0, '27.5', 0, '0', '', NULL, NULL, 0),
('20210415204108', 42, 1, 0, '2021-04-15 20:41:08', 0, 1600, '2021-04-15 20:41:08', 0, 9, 1, 0, 'efectivo', 0, '', 0, '72', 0, '0', '', NULL, NULL, 0),
('20210417200656', 42, 1, 0, '2021-04-17 20:06:56', 0, 500, '2021-04-17 20:06:56', 0, 9, 1, 0, 'efectivo', 0, '', 0, '41', 0, '0', '', NULL, NULL, 0),
('20210418205011', 42, 1, 0, '2021-04-18 20:50:11', 0, 500, '2021-04-18 20:50:11', 0, 9, 1, 0, 'efectivo', 0, '', 0, '27', 0, '0', '', NULL, NULL, 0),
('20210419180855', 42, 1, 0, '2021-04-19 18:08:55', 0, 200, '2021-04-19 18:08:55', 0, 11, 1, 0, 'efectivo', 0, '', 0, '101', 0, '0', '', NULL, NULL, 0),
('20210419195430', 38, 1, 0, '2021-04-19 19:54:30', 0, 1660, '2021-04-19 19:54:30', 0, 9, 1, 0, 'efectivo', 0, '', 0, '34', 0, '0', '', NULL, NULL, 0),
('20210420204733', 42, 1, 0, '2021-04-20 20:47:33', 0, 1500, '2021-04-20 20:47:33', 0, 9, 1, 0, 'efectivo', 0, '', 0, '53', 0, '0', '', NULL, NULL, 0),
('20210421204257', 42, 1, 0, '2021-04-21 20:42:57', 0, 1350, '2021-04-21 20:42:57', 0, 9, 1, 0, 'efectivo', 0, '', 0, '58', 0, '0', '', NULL, NULL, 0),
('20210422210121', 38, 1, 0, '2021-04-22 21:01:21', 0, 1440, '2021-04-22 21:01:21', 0, 9, 1, 0, 'efectivo', 0, '', 0, '23', 0, '0', '', NULL, NULL, 0),
('20210423205908', 38, 1, 0, '2021-04-23 20:59:08', 0, 995, '2021-04-23 20:59:08', 0, 9, 1, 0, 'efectivo', 0, '', 0, '31', 0, '0', '', NULL, NULL, 0),
('20210424202634', 42, 1, 0, '2021-04-24 20:26:34', 0, 200, '2021-04-24 20:26:34', 0, 9, 1, 0, 'efectivo', 0, '', 0, '65', 0, '0', '', NULL, NULL, 0),
('20210425203344', 42, 1, 0, '2021-04-25 20:33:44', 0, 470, '2021-04-25 20:33:44', 0, 9, 1, 0, 'efectivo', 0, '', 0, '62.5', 0, '0', '', NULL, NULL, 0),
('20210426211749', 38, 1, 0, '2021-04-26 21:17:49', 0, 600, '2021-04-26 21:17:49', 0, 9, 1, 0, 'efectivo', 0, '', 0, '41', 0, '0', '', NULL, NULL, 0),
('20210427204443', 42, 1, 0, '2021-04-27 20:44:43', 0, 700, '2021-04-27 20:44:43', 0, 9, 1, 0, 'efectivo', 0, '', 0, '25.5', 0, '0', '', NULL, NULL, 0),
('20210428210208', 38, 1, 0, '2021-04-28 21:02:08', 0, 1450, '2021-04-28 21:02:08', 0, 9, 1, 0, 'efectivo', 0, '', 0, '52', 0, '0', '', NULL, NULL, 0),
('20210429205256', 42, 1, 0, '2021-04-29 20:52:56', 0, 800, '2021-04-29 20:52:56', 0, 9, 0, 0, 'efectivo', 0, '', 0, '64.5', 0, '0', '', NULL, NULL, 0),
('20210430204832', 38, 1, 0, '2021-04-30 20:48:32', 0, 1270, '2021-04-30 20:48:32', 0, 9, 0, 0, 'efectivo', 0, '', 0, '15.5', 0, '0', '', NULL, NULL, 0),
('20210501204033', 42, 1, 0, '2021-05-01 20:40:33', 0, 450, '2021-05-01 20:40:33', 0, 9, 0, 0, 'efectivo', 0, '', 0, '20', 0, '0', '', NULL, NULL, 0),
('20210502201437', 42, 1, 0, '2021-05-02 20:14:37', 0, 780, '2021-05-02 20:14:37', 0, 9, 0, 0, 'efectivo', 0, '', 0, '37.5', 0, '0', '', NULL, NULL, 0),
('20210503174150', 42, 1, 0, '2021-05-03 17:41:50', 0, 80, '2021-05-03 17:41:50', 0, 11, 0, 0, 'efectivo', 0, '', 0, '42.5', 0, '0', '', NULL, NULL, 0),
('20210504174215', 42, 1, 0, '2021-05-04 17:42:15', 0, 75, '2021-05-04 17:42:15', 0, 11, 0, 0, 'efectivo', 0, '', 0, '58', 0, '0', '', NULL, NULL, 0),
('20210505174705', 42, 1, 0, '2021-05-05 17:47:05', 0, 230, '2021-05-05 17:47:05', 0, 11, 0, 0, 'efectivo', 0, '', 0, '69.5', 0, '0', '', NULL, NULL, 0);
INSERT INTO `folio_venta` (`folio`, `vendedor`, `client`, `descuento`, `fecha`, `open`, `cobrado`, `fecha_venta`, `cut`, `sucursal`, `cut_global`, `iva`, `t_pago`, `pedido`, `folio_venta_ini`, `cotizacion`, `concepto`, `comision_pagada`, `oxxo_pay`, `titulo`, `f_entrega`, `estrategia`, `facturar`) VALUES
('20210506180319', 42, 1, 0, '2021-05-06 18:03:19', 0, 300, '2021-05-06 18:03:19', 0, 11, 0, 0, 'efectivo', 0, '', 0, '53.5', 0, '0', '', NULL, NULL, 0),
('20210507202244', 38, 1, 0, '2021-05-07 20:22:44', 0, 750, '2021-05-07 20:22:44', 0, 9, 0, 0, 'efectivo', 0, '', 0, '10', 0, '0', '', NULL, NULL, 0),
('20210508205106', 42, 1, 0, '2021-05-08 20:51:06', 0, 350, '2021-05-08 20:51:06', 0, 9, 0, 0, 'efectivo', 0, '', 0, '21.5', 0, '0', '', NULL, NULL, 0),
('20210509204903', 42, 1, 0, '2021-05-09 20:49:03', 0, 600, '2021-05-09 20:49:03', 0, 9, 0, 0, 'efectivo', 0, '', 0, '14.5', 0, '0', '', NULL, NULL, 0),
('20210510204246', 42, 1, 0, '2021-05-10 20:42:46', 0, 400, '2021-05-10 20:42:46', 0, 9, 0, 0, 'efectivo', 0, '', 0, '36', 0, '0', '', NULL, NULL, 0),
('20210511200658', 42, 1, 0, '2021-05-11 20:06:58', 0, 600, '2021-05-11 20:06:58', 0, 9, 0, 0, 'efectivo', 0, '', 0, '27', 0, '0', '', NULL, NULL, 0),
('20210512204447', 42, 1, 0, '2021-05-12 20:44:47', 0, 700, '2021-05-12 20:44:47', 0, 9, 0, 0, 'efectivo', 0, '', 0, '60', 0, '0', '', NULL, NULL, 0),
('20210513201739', 42, 1, 0, '2021-05-13 20:17:39', 0, 1100, '2021-05-13 20:17:39', 0, 9, 0, 0, 'efectivo', 0, '', 0, '28', 0, '0', '', NULL, NULL, 0),
('20210514210235', 38, 1, 0, '2021-05-14 21:02:35', 0, 1890, '2021-05-14 21:02:35', 0, 9, 0, 0, 'efectivo', 0, '', 0, '22.5', 0, '0', '', NULL, NULL, 0),
('20210515203932', 42, 1, 0, '2021-05-15 20:39:32', 0, 500, '2021-05-15 20:39:32', 0, 9, 0, 0, 'efectivo', 0, '', 0, '30.5', 0, '0', '', NULL, NULL, 0),
('20210516203922', 42, 1, 0, '2021-05-16 20:39:22', 0, 400, '2021-05-16 20:39:22', 0, 9, 0, 0, 'efectivo', 0, '', 0, '40.5', 0, '0', '', NULL, NULL, 0),
('20210517204703', 42, 1, 0, '2021-05-17 20:47:03', 0, 500, '2021-05-17 20:47:03', 0, 9, 0, 0, 'efectivo', 0, '', 0, '47.5', 0, '0', '', NULL, NULL, 0),
('20210519204700', 42, 1, 0, '2021-05-19 20:47:00', 0, 800, '2021-05-19 20:47:00', 0, 9, 0, 0, 'efectivo', 0, '', 0, '59', 0, '0', '', NULL, NULL, 0),
('20210520205821', 42, 1, 0, '2021-05-20 20:58:21', 0, 1150, '2021-05-20 20:58:21', 0, 9, 0, 0, 'efectivo', 0, '', 0, '29.5', 0, '0', '', NULL, NULL, 0),
('20210521210400', 38, 1, 0, '2021-05-21 21:04:00', 0, 735, '2021-05-21 21:04:00', 0, 9, 0, 0, 'efectivo', 0, '', 0, '29.5', 0, '0', '', NULL, NULL, 0),
('20210522204356', 42, 1, 0, '2021-05-22 20:43:56', 0, 1650, '2021-05-22 20:43:56', 0, 9, 0, 0, 'efectivo', 0, '', 0, '15', 0, '0', '', NULL, NULL, 0),
('20210524180051', 42, 1, 0, '2021-05-24 18:00:51', 0, 650, '2021-05-24 18:00:51', 0, 9, 0, 0, 'efectivo', 0, '', 0, '69', 0, '0', '', NULL, NULL, 0),
('20210525202349', 42, 1, 0, '2021-05-25 20:23:49', 0, 850, '2021-05-25 20:23:49', 0, 9, 0, 0, 'efectivo', 0, '', 0, '39', 0, '0', '', NULL, NULL, 0),
('20210526203005', 42, 1, 0, '2021-05-26 20:30:05', 0, 900, '2021-05-26 20:30:05', 0, 9, 0, 0, 'efectivo', 0, '', 0, '45', 0, '0', '', NULL, NULL, 0),
('20210527203957', 42, 1, 0, '2021-05-27 20:39:57', 0, 1550, '2021-05-27 20:39:57', 0, 9, 0, 0, 'efectivo', 0, '', 0, '70', 0, '0', '', NULL, NULL, 0),
('20210528205212', 38, 1, 0, '2021-05-28 20:52:12', 0, 630, '2021-05-28 20:52:12', 0, 9, 0, 0, 'efectivo', 0, '', 0, '26.5', 0, '0', '', NULL, NULL, 0),
('20210529205022', 42, 1, 0, '2021-05-29 20:50:22', 0, 750, '2021-05-29 20:50:22', 0, 9, 0, 0, 'efectivo', 0, '', 0, '70.5', 0, '0', '', NULL, NULL, 0),
('20210530193044', 42, 1, 0, '2021-05-30 19:30:44', 0, 450, '2021-05-30 19:30:44', 0, 9, 0, 0, 'efectivo', 0, '', 0, '53.5', 0, '0', '', NULL, NULL, 0),
('20210531204351', 42, 1, 0, '2021-05-31 20:43:51', 0, 850, '2021-05-31 20:43:51', 0, 9, 0, 0, 'efectivo', 0, '', 0, '50', 0, '0', '', NULL, NULL, 0),
('20210602204618', 42, 1, 0, '2021-06-02 20:46:18', 0, 2100, '2021-06-02 20:46:18', 0, 9, 0, 0, 'efectivo', 0, '', 0, '48.5', 0, '0', '', NULL, NULL, 0),
('20210603202324', 42, 1, 0, '2021-06-03 20:23:24', 0, 1500, '2021-06-03 20:23:24', 0, 9, 0, 0, 'efectivo', 0, '', 0, '17', 0, '0', '', NULL, NULL, 0),
('20210604203917', 38, 1, 0, '2021-06-04 20:39:17', 0, 880, '2021-06-04 20:39:17', 0, 9, 0, 0, 'efectivo', 0, '', 0, '29', 0, '0', '', NULL, NULL, 0),
('20210605203608', 42, 1, 0, '2021-06-05 20:36:08', 0, 450, '2021-06-05 20:36:08', 0, 9, 0, 0, 'efectivo', 0, '', 0, '27', 0, '0', '', NULL, NULL, 0),
('20210606191027', 42, 1, 0, '2021-06-06 19:10:27', 0, 900, '2021-06-06 19:10:27', 0, 9, 0, 0, 'efectivo', 0, '', 0, '37', 0, '0', '', NULL, NULL, 0),
('20210607204922', 38, 1, 0, '2021-06-07 20:49:22', 0, 1560, '2021-06-07 20:49:22', 0, 9, 0, 0, 'efectivo', 0, '', 0, '1', 0, '0', '', NULL, NULL, 0),
('20210608203840', 42, 1, 0, '2021-06-08 20:38:40', 0, 1300, '2021-06-08 20:38:40', 0, 9, 0, 0, 'efectivo', 0, '', 0, '21', 0, '0', '', NULL, NULL, 0),
('20210609203946', 42, 1, 0, '2021-06-09 20:39:46', 0, 950, '2021-06-09 20:39:46', 0, 9, 0, 0, 'efectivo', 0, '', 0, '29', 0, '0', '', NULL, NULL, 0),
('20210610204830', 42, 1, 0, '2021-06-10 20:48:30', 0, 900, '2021-06-10 20:48:30', 0, 9, 0, 0, 'efectivo', 0, '', 0, '16', 0, '0', '', NULL, NULL, 0),
('20210611205017', 38, 1, 0, '2021-06-11 20:50:17', 0, 378, '2021-06-11 20:50:17', 0, 9, 0, 0, 'efectivo', 0, '', 0, '20', 0, '0', '', NULL, NULL, 0),
('20210612203531', 42, 1, 0, '2021-06-12 20:35:31', 0, 370, '2021-06-12 20:35:31', 0, 9, 0, 0, 'efectivo', 0, '', 0, '30', 0, '0', '', NULL, NULL, 0),
('20210613180431', 42, 1, 0, '2021-06-13 18:04:31', 0, 540, '2021-06-13 18:04:31', 0, 9, 0, 0, 'efectivo', 0, '', 0, '25', 0, '0', '', NULL, NULL, 0),
('3720190821145559', 37, 1, 0, '2019-08-21 14:55:59', 0, 105, '2019-08-21 14:57:29', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720190822181954', 37, 1, 0, '2019-08-22 18:19:54', 0, 105, '2019-08-22 18:31:49', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720190823151129', 37, 1, 0, '2019-08-23 15:11:29', 0, 45, '2019-08-23 15:12:10', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720190823152104', 37, 1, 0, '2019-08-23 15:21:04', 0, 120, '2019-08-23 15:21:47', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720190827152233', 37, 1, 0, '2019-08-27 15:22:33', 0, 105, '2019-08-27 15:23:59', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720190901110051', 37, 1, 0, '2019-09-01 11:00:51', 0, 105, '2019-09-01 11:02:29', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720190904154428', 37, 1, 0, '2019-09-04 15:44:28', 0, 35, '2019-09-04 15:45:00', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720190905175126', 37, 1, 0, '2019-09-05 17:51:26', 0, 140, '2019-09-05 17:51:56', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720190905180041', 37, 1, 0, '2019-09-05 18:00:41', 0, 110, '2019-09-05 18:01:49', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720190906190751', 37, 1, 0, '2019-09-06 19:07:51', 0, 155, '2019-09-06 19:08:23', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720190915161003', 37, 1, 0, '2019-09-15 16:10:03', 0, 20, '2019-09-15 16:10:28', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720190918130207', 37, 1, 0, '2019-09-18 13:02:07', 0, 20, '2019-09-18 13:02:31', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720190922170015', 37, 1, 0, '2019-09-22 17:00:15', 0, 40, '2019-09-22 17:00:44', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720191003105645', 37, 1, 0, '2019-10-03 10:56:45', 0, 70, '2019-10-03 10:57:14', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720191006131620', 37, 1, 0, '2019-10-06 13:16:20', 0, 25, '2019-10-06 13:21:11', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720191014132916', 37, 1, 0, '2019-10-14 13:29:16', 0, 20, '2019-10-14 13:29:37', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720191018162441', 37, 1, 0, '2019-10-18 16:24:41', 0, 190, '2019-10-18 16:25:46', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720191018162557', 37, 1, 0, '2019-10-18 16:25:57', 0, 73, '2019-10-18 16:26:32', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720191023123718', 37, 1, 0, '2019-10-23 12:37:18', 0, 199, '2019-10-26 20:27:54', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720191209145110', 37, 1, 0, '2019-12-09 14:51:10', 0, 110, '2019-12-09 14:51:44', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720191217175255', 37, 1, 0, '2019-12-17 17:52:55', 0, 70, '2019-12-17 17:53:25', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3720191229132537', 37, 1, 0, '2019-12-29 13:25:37', 0, 60, '2019-12-29 13:26:12', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720191230144723', 37, 1, 0, '2019-12-30 14:47:23', 0, 23, '2019-12-30 14:48:35', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200103123139', 37, 1, 0, '2020-01-03 12:31:39', 0, 53, '2020-01-03 12:32:11', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200126123920', 37, 1, 0, '2020-01-26 12:39:20', 0, 19, '2020-01-26 12:39:56', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200126145305', 37, 1, 0, '2020-01-26 14:53:05', 0, 23, '2020-01-26 14:53:32', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200131155849', 37, 1, 0, '2020-01-31 15:58:49', 0, 23, '2020-01-31 15:59:31', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200204163223', 37, 1, 0, '2020-02-04 16:32:23', 0, 23, '2020-02-04 16:32:49', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200217164916', 37, 1, 0, '2020-02-17 16:49:16', 0, 90, '2020-02-17 16:49:45', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200217165030', 37, 1, 0, '2020-02-17 16:50:30', 0, 90, '2020-02-17 16:50:54', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200223134942', 37, 1, 0, '2020-02-23 13:49:42', 0, 110, '2020-02-23 13:50:07', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200223151012', 37, 1, 0, '2020-02-23 15:10:12', 0, 65, '2020-02-23 15:11:01', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200622153118', 37, 1, 0, '2020-06-22 15:31:18', 0, 120, '2020-06-22 15:31:48', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200624121138', 37, 1, 0, '2020-06-24 12:11:38', 0, 70, '2020-06-24 12:12:31', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200630143837', 37, 1, 0, '2020-06-30 14:38:37', 0, 55, '2020-06-30 14:38:52', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200706104513', 37, 1, 0, '2020-07-06 10:45:13', 0, 23, '2020-07-06 10:45:36', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200706182308', 37, 1, 0, '2020-07-06 18:23:08', 0, 25, '2020-07-06 18:23:48', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200713142512', 37, 1, 0, '2020-07-13 14:25:12', 0, 120, '2020-07-13 14:25:31', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200715170422', 37, 1, 0, '2020-07-15 17:04:22', 0, 210, '2020-07-15 17:05:40', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200721171139', 37, 1, 0, '2020-07-21 17:11:39', 0, 55, '2020-07-21 17:11:56', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200721172923', 37, 1, 0, '2020-07-21 17:29:23', 0, 50, '2020-07-21 17:29:42', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200729184341', 37, 1, 0, '2020-07-29 18:43:41', 0, 23, '2020-07-29 18:44:15', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200807140756', 37, 1, 0, '2020-08-07 14:07:56', 0, 240, '2020-08-07 14:09:43', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200810132134', 37, 1, 0, '2020-08-10 13:21:34', 0, 55, '2020-08-10 13:22:12', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200813173619', 37, 1, 0, '2020-08-13 17:36:19', 0, 23, '2020-08-13 17:36:46', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200814132125', 37, 1, 0, '2020-08-14 13:21:25', 0, 150, '2020-08-14 13:21:56', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200815155227', 37, 1, 0, '2020-08-15 15:52:27', 0, 120, '2020-08-15 15:53:03', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200826165838', 37, 1, 0, '2020-08-26 16:58:38', 0, 100, '2020-08-26 16:59:27', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200901111756', 37, 1, 0, '2020-09-01 11:17:56', 0, 120, '2020-09-01 11:18:23', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200904132133', 37, 1, 0, '2020-09-04 13:21:33', 0, 150, '2020-09-04 13:22:08', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200904132302', 37, 1, 0, '2020-09-04 13:23:02', 0, 150, '2020-09-04 13:23:16', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200904145258', 37, 1, 0, '2020-09-04 14:52:58', 0, 120, '2020-09-04 14:53:12', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200909145946', 37, 1, 0, '2020-09-09 14:59:46', 0, 150, '2020-09-09 15:00:09', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720200910154114', 37, 1, 0, '2020-09-10 15:41:14', 0, 150, '2020-09-10 15:41:39', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201008141609', 37, 1, 0, '2020-10-08 14:16:09', 0, 120, '2020-10-08 14:16:26', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201011135040', 37, 1, 0, '2020-10-11 13:50:40', 0, 46, '2020-10-11 13:51:03', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201019162903', 37, 1, 0, '2020-10-19 16:29:03', 0, 120, '2020-10-19 16:29:41', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201022125932', 37, 1, 0, '2020-10-22 12:59:32', 0, 23, '2020-10-22 12:59:55', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201022155434', 37, 1, 0, '2020-10-22 15:54:34', 0, 85, '2020-10-22 15:54:58', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201027131615', 37, 1, 0, '2020-10-27 13:16:15', 0, 120, '2020-10-27 13:16:40', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201113150757', 37, 1, 0, '2020-11-13 15:07:57', 0, 150, '2020-11-13 15:08:15', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201115175101', 37, 1, 0, '2020-11-15 17:51:01', 0, 40, '2020-11-15 17:51:15', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201124141110', 37, 1, 0, '2020-11-24 14:11:10', 0, 150, '2020-11-24 14:11:24', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201130153725', 37, 1, 0, '2020-11-30 15:37:25', 0, 140, '2020-11-30 15:37:57', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201210161402', 37, 1, 0, '2020-12-10 16:14:02', 0, 120, '2020-12-10 16:14:22', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201213120944', 37, 1, 0, '2020-12-13 12:09:44', 0, 120, '2020-12-13 12:10:12', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201213122816', 37, 1, 0, '2020-12-13 12:28:16', 0, 120, '2020-12-13 12:28:59', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201216151452', 37, 1, 0, '2020-12-16 15:14:52', 0, 150, '2020-12-16 15:15:08', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720201221133642', 37, 1, 0, '2020-12-21 13:36:42', 0, 120, '2020-12-21 13:37:06', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3720210111181259', 37, 1, 0, '2021-01-11 18:12:59', 0, 45, '2021-01-11 18:13:28', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820190901113349', 38, 1, 0, '2019-09-01 11:33:49', 0, 1130, '2019-09-01 11:42:25', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3820190901151612', 38, 1, 0, '2019-09-01 15:16:12', 0, 20, '2019-09-01 15:16:33', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3820190916113452', 38, 1, 0, '2019-09-16 11:34:52', 0, 370, '2019-09-16 11:36:16', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3820191101170229', 38, 1, 0, '2019-11-01 17:02:29', 0, 150, '2019-11-01 17:03:13', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3820191113114242', 38, 1, 0, '2019-11-13 11:42:42', 0, 30, '2019-11-13 11:43:09', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3820191113114846', 38, 1, 0, '2019-11-13 11:48:46', 0, 28, '2019-11-13 11:49:10', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3820191206134000', 38, 1, 0, '2019-12-06 13:40:00', 0, 45, '2019-12-06 13:41:44', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0', '', NULL, NULL, 0),
('3820191230111732', 38, 1, 0, '2019-12-30 11:17:32', 0, 70, '2019-12-30 11:18:13', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200102102438', 38, 1, 0, '2020-01-02 10:24:38', 0, 23, '2020-01-02 10:25:21', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200117132945', 38, 1, 0, '2020-01-17 13:29:45', 0, 89, '2020-01-17 13:35:33', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200123185435', 38, 1, 0, '2020-01-23 18:54:35', 0, 230, '2020-01-23 18:55:47', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200123185653', 38, 1, 0, '2020-01-23 18:56:53', 0, 108, '2020-01-24 17:37:29', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200126135001', 38, 1, 0, '2020-01-26 13:50:01', 0, 350, '2020-01-26 13:51:08', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200126151742', 38, 1, 0, '2020-01-26 15:17:42', 0, 23, '2020-01-26 15:22:31', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200214171445', 38, 1, 0, '2020-02-14 17:14:45', 0, 23, '2020-02-14 17:15:23', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200216144107', 38, 1, 0, '2020-02-16 14:41:07', 0, 25, '2020-02-16 14:41:36', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200223131054', 38, 1, 0, '2020-02-23 13:10:54', 0, 23, '2020-02-23 13:12:17', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200224115303', 38, 1, 0, '2020-02-24 11:53:03', 0, 75, '2020-02-24 11:53:34', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200302103522', 38, 1, 0, '2020-03-02 10:35:22', 0, 19, '2020-03-02 10:35:52', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200312145259', 38, 1, 0, '2020-03-12 14:52:59', 0, 20, '2020-03-12 14:53:32', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200324125724', 38, 1, 0, '2020-03-24 12:57:24', 0, 25, '2020-03-24 12:57:58', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200408185729', 38, 1, 0, '2020-04-08 18:57:29', 0, 19, '2020-04-08 18:57:48', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200412132345', 38, 1, 0, '2020-04-12 13:23:45', 0, 139, '2020-04-12 13:24:09', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200414140742', 38, 1, 0, '2020-04-14 14:07:42', 0, 23, '2020-04-14 14:08:02', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200415171824', 38, 1, 0, '2020-04-15 17:18:24', 0, 120, '2020-04-15 17:19:02', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200420134252', 38, 1, 0, '2020-04-20 13:42:52', 0, 23, '2020-04-20 13:43:12', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200424130204', 38, 1, 0, '2020-04-24 13:02:04', 0, 259, '2020-04-24 13:10:49', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200428105116', 38, 1, 0, '2020-04-28 10:51:16', 0, 70, '2020-04-28 10:51:40', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200519131634', 38, 1, 0, '2020-05-19 13:16:34', 0, 23, '2020-05-19 13:17:02', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200521135408', 38, 1, 0, '2020-05-21 13:54:08', 0, 53, '2020-05-21 13:55:01', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200528125918', 38, 1, 0, '2020-05-28 12:59:18', 0, 120, '2020-05-28 12:59:53', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200625124629', 38, 1, 0, '2020-06-25 12:46:29', 0, 23, '2020-06-25 12:47:07', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200701113026', 38, 1, 0, '2020-07-01 11:30:26', 0, 23, '2020-07-01 11:30:40', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200707091309', 38, 1, 0, '2020-07-07 09:13:09', 0, 120, '2020-07-07 09:13:19', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200717101254', 38, 1, 0, '2020-07-17 10:12:54', 0, 120, '2020-07-17 10:13:14', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200722152228', 38, 1, 0, '2020-07-22 15:22:28', 0, 23, '2020-07-22 15:23:14', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200723103206', 38, 1, 0, '2020-07-23 10:32:06', 0, 23, '2020-07-23 10:32:30', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200723125049', 38, 1, 0, '2020-07-23 12:50:49', 0, 120, '2020-07-23 12:51:09', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200805135135', 38, 1, 0, '2020-08-05 13:51:35', 0, 150, '2020-08-05 13:51:48', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200823132654', 38, 1, 0, '2020-08-23 13:26:54', 0, 170, '2020-08-23 13:27:46', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200827143801', 38, 1, 0, '2020-08-27 14:38:01', 0, 120, '2020-08-27 14:38:53', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200828105339', 38, 1, 0, '2020-08-28 10:53:39', 0, 23, '2020-08-28 10:53:54', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200904143441', 38, 1, 0, '2020-09-04 14:34:41', 0, 150, '2020-09-04 14:34:54', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200908161356', 38, 1, 0, '2020-09-08 16:13:56', 0, 120, '2020-09-08 16:14:27', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200909145736', 38, 1, 0, '2020-09-09 14:57:36', 0, 150, '2020-09-09 14:57:58', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200913103959', 38, 1, 0, '2020-09-13 10:39:59', 0, 150, '2020-09-13 10:40:23', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200916113452', 38, 1, 0, '2020-09-16 11:34:52', 0, 120, '2020-09-16 11:35:13', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820200922145927', 38, 1, 0, '2020-09-22 14:59:27', 0, 120, '2020-09-22 15:00:32', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820201012195206', 38, 1, 0, '2020-10-12 19:52:06', 0, 150, '2020-10-12 19:52:36', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820201104095250', 38, 1, 0, '2020-11-04 09:52:50', 0, 120, '2020-11-04 09:53:11', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820201123202434', 38, 1, 0, '2020-11-23 20:24:34', 0, 120, '2020-11-23 20:24:46', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820201223131529', 38, 1, 0, '2020-12-23 13:15:29', 0, 120, '2020-12-23 13:15:50', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820201227192928', 38, 1, 0, '2020-12-27 19:29:28', 0, 120, '2020-12-27 19:30:23', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0),
('3820201228115158', 38, 1, 0, '2020-12-28 11:51:58', 0, 120, '2020-12-28 11:52:17', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `no. De parte` varchar(254) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `descripcion` longtext NOT NULL,
  `almacen` int(11) NOT NULL,
  `departamento` int(11) NOT NULL,
  `loc_almacen` varchar(254) NOT NULL,
  `marca` varchar(254) NOT NULL,
  `proveedor` varchar(254) NOT NULL,
  `foto0` varchar(254) NOT NULL,
  `foto1` varchar(254) NOT NULL,
  `foto2` varchar(254) NOT NULL,
  `foto3` varchar(254) NOT NULL,
  `oferta` tinyint(1) NOT NULL DEFAULT 0,
  `precio_normal` float NOT NULL DEFAULT 0,
  `precio_oferta` float NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL,
  `tiempo de entrega` varchar(254) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `stock_max` int(11) NOT NULL,
  `precio_costo` float NOT NULL DEFAULT 0,
  `cv` varchar(254) NOT NULL DEFAULT '01010101',
  `um` varchar(254) NOT NULL DEFAULT 'H87',
  `um_des` varchar(254) NOT NULL DEFAULT 'NA',
  `pedir_medidas` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `no. De parte`, `nombre`, `descripcion`, `almacen`, `departamento`, `loc_almacen`, `marca`, `proveedor`, `foto0`, `foto1`, `foto2`, `foto3`, `oferta`, `precio_normal`, `precio_oferta`, `stock`, `tiempo de entrega`, `stock_min`, `stock_max`, `precio_costo`, `cv`, `um`, `um_des`, `pedir_medidas`) VALUES
(2, '290514', 'SISTEMA HOTELERO', 'Software para hoteles y moteles ...', 3, 37, 'CLOUD', 'CLTA', 'CLTA', 'product/product_img120190819113358.jpg', 'product/product_img220190819113601.jpg', 'product/product_img320190819113601.jpg', 'product/product_img420190819113601.jpg', 0, 4500, 4300, 4974, 'INMEDIATO', 1000, 10000, 0, '43232300', 'XUN', 'LICENCIA VITALICIA', 0),
(3, '290515', 'CONTROL DE SOCIOS GOLDEN', 'Sistema hotelero, administra mejor tu hotel o motel. ', 3, 37, 'CLOUD', 'CLTA', 'CLTA', 'product/product_img120190819114221.jpg', 'product/product_img220190819114221.jpg', 'product/product_img320190819114221.jpg', 'product/product_img420190819114221.jpg', 0, 4999, 4600, 4940, 'INMEDIATO', 1000, 10000, 0, '43232300', 'XUN', 'LICENCIA VITALICIA', 0),
(4, 'rele_v2', 'Circuito Relevador Usb (no/nc), Rele, Relevador', 'torniquetes, chapas electricas, compuertas', 3, 38, 'ZYHC', 'CLTA', 'CLTA', 'product/product_img120190819120614.jpg', 'product/product_img220190819120614.jpg', 'product/product_img320190819120614.jpg', 'product/product_img420190819120614.jpg', 0, 1900, 1800, -19, '1 DIA HABIL', 1, 4, 500, '32101600', 'H87', 'PIEZA', 0),
(5, '500013-001-103', 'Lector Digital Person 4500 UAERE', 'Lector de huella Usb, control de socios, control de acceso\r\n', 3, 38, '', 'DIGITAL PERSONA', 'DESCONOCIDO', 'product/product_img120190819120837.jpg', 'product/product_img220190819115510.jpg', 'product/product_img320190819115510.jpg', 'product/product_img420190819115510.jpg', 0, 1900, 1800, 472, '1 DIA HABIL', 0, 1000, 0, '43211600', 'H87', 'PIEZA', 0),
(6, 'PTV_SISTEMA', 'Sistema Venta, Punto De Venta, Red', 'Sistema PTV, Generic', 3, 37, 'CLOUD', 'CLTA', 'CLTA', 'product/product_img120190819115846.jpg', 'product/product_img220190819115846.jpg', 'product/product_img320190819115846.jpg', 'product/product_img420190819115846.jpg', 0, 400, 300, 5000, 'INMEDIATA', 0, 10000, 0, '43232300', 'XUN', 'LICENCIA VITALICIA', 0),
(14, 'T_C_REF', 'Cargador Reforzado Tipo C', '', 1, 39, 'V. VERTICAL', 'GENERICO', '24X7_ONLINE', 'product/product_img120190907150352.jpg', '', '', '', 0, 45, 40, 3, 'INMEDIATO', 2, 20, 19.8, '01010101', 'H87', 'NA', 0),
(16, '25885', 'Cable Usb Datos Uso Rudo Stela Android V8 Accesorios G R', '', 1, 39, 'V. VERTICAL', 'XCASE', 'DICOTECH', 'product/product_img120200715164024.jpg', '', '', '', 0, 50, 32, 0, 'INMEDIATO', 2, 8, 19, '01010101', 'H87', 'NA', 0),
(19, 'ZIPER-EAR', 'Audifono Economico Xha17 Super Bass G R Access ', '', 1, 39, 'V. VERTICAL', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200715164144.jpg', '', '', '', 0, 23, 25, 2, 'INMEDIATO', 2, 15, 23, '01010101', 'H87', 'NA', 0),
(20, 'XOTN30585', 'Turbo Cargador Pared Led Carga Rapida Doble Puerto Usb', '', 1, 39, 'V. VERTICAL', 'GENERICO', '24X7_ONLINE', 'product/product_img120190819184923.jpg', '', '', '', 0, 53, 49, 0, 'INMEDIATO', 2, 6, 24.5, '01010101', 'H87', 'NA', 0),
(21, 'XDXP29633', 'Gabinete Externo Usb Disco Duro Laptop Sata 2.5 Hasta 500gb', '', 1, 38, 'V. VERTICAL', 'E-ELEGATE', '24X7_ONLINE', 'product/product_img120190819185046.jpg', '', '', '', 0, 110, 99, -1, 'INMEDIATO', 1, 4, 1, '01010101', 'H87', 'NA', 0),
(22, '7506215916516', 'Mouse Ac-916516 Acteck Ac-916516 Acteck Mougen1810', '', 1, 38, 'V. VERTICAL', 'ACTECK', 'DICOTECH', 'product/product_img120190819185254.jpg', '', '', '', 0, 90, 85, 1, 'INMEDIATO', 2, 8, 53, '01010101', 'H87', 'NA', 0),
(23, 'RTDG32146', 'Cable Hdmi 5 Metros Reforzado Full Hd 1080p Xbox 360 Lcd', '', 1, 38, 'V. VERTICAL', 'XCASE', '24X7_ONLINE', 'product/product_img120190819185432.jpg', '', '', '', 0, 150, 99, 1, 'INMEDIATO', 1, 1, 39, '01010101', 'H87', 'NA', 0),
(28, 'kit_ptv', 'Kit Punto De Venta Cajon +lector Base+ Miniprinter ', '', 1, 38, '', 'VARIOS', 'CLTA', 'product/product_img120190820130510.jpg', 'product/product_img220190820130510.jpg', 'product/product_img320190820130510.jpg', 'product/product_img420190820130510.jpg', 0, 2870, 2600, 999, '1 DIA HABIL', 0, 1000, 0, '01010101', 'H87', 'NA', 0),
(30, '22222', 'SOFTWARE MEDICO – MEDICIS', '', 3, 37, '', 'CLTA', 'CLTA', 'product/product_img120190823133616.jpg', '', '', '', 0, 6900, 6000, 1000, '1 DIA HABIL', 1, 1000, 0, '01010101', 'H87', 'NA', 0),
(32, '791261080466', 'Taza Automática Auto Mezcladora Térmica Para Café Con Tapa', '', 1, 33, '', 'SELF', 'DESCONOCIDO', 'product/product_img120190826194937.jpg', 'product/product_img220190826194937.jpg', 'product/product_img320190826194937.jpg', 'product/product_img420190826194937.jpg', 0, 175, 150, 1, 'INMEDIATO', 1, 2, 105, '01010101', 'H87', 'NA', 0),
(33, 'JFCQ38669', 'Taza Multi Usos Tipo Block Construcción Build On', '', 1, 33, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120190826195307.jpg', 'product/product_img220190826195307.jpg', 'product/product_img320190826195307.jpg', 'product/product_img420190826195307.jpg', 0, 230, 210, 1, 'INMEDIATO', 1, 2, 105, '01010101', 'H87', 'NA', 0),
(34, 'hub-13', 'Hub Usb 2.0 Led 4 Puertos Computadoras Pc Laptop Memorias', '', 1, 38, '', 'E-ELEGATE', 'SLIM_COMPANY', 'product/product_img120190826195844.jpg', 'product/product_img220190826195844.jpg', 'product/product_img320190826195844.jpg', 'product/product_img420190826195844.jpg', 0, 70, 60, -1, 'INMEDIATO', 1, 3, 35, '01010101', 'H87', 'NA', 0),
(35, '', 'Soporte Base Holder Celular Auto Carro Universal', '', 1, 39, '', 'E-ELEGATE', 'ELEGATE', 'product/product_img120190826200307.jpg', 'product/product_img220190826200307.jpg', 'product/product_img320190826200307.jpg', 'product/product_img420190826200307.jpg', 0, 60, 55, 0, 'INMEDIATO', 1, 6, 30, '01010101', 'H87', 'NA', 0),
(36, '', 'Cortadora De Chip Sim A Micro Sim Y Nano Sim + Adaptadores', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120190826200600.jpg', '', '', '', 0, 50, 50, 1, 'INMEDIATO', 1, 1, 26, '01010101', 'H87', 'NA', 0),
(37, '', 'Kit Desarmador Herramientas 7 En 1 Reparacion Celulares Torx', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120190826200733.jpg', '', '', '', 0, 110, 99, 0, 'INMEDIATO', 1, 6, 55, '01010101', 'H87', 'NA', 0),
(38, 'AKCI30563', 'Adaptador Otg ', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200620151351.jpg', '', '', '', 0, 23, 16, 9, 'INMEDIATO', 2, 10, 7.8, '01010101', 'H87', 'NA', 0),
(39, '', 'Cable Adaptador Rs232 Serial Db9 Macho A Usb 2.0 Macho', '', 1, 38, '', 'E-ELEGATE', 'ELEGATE', 'product/product_img120190826201200.jpg', '', '', '', 0, 120, 115, 1, 'INMEDIATO', 1, 4, 60, '01010101', 'H87', 'NA', 0),
(40, '', 'Manija Soporte Gamepad Gatillos Universal 5 En 1 Smartphone', '', 1, 39, '', 'E-ELEGATE', 'ELEGATE', 'product/product_img120190826201414.jpg', 'product/product_img220190826201414.jpg', 'product/product_img320190826201414.jpg', 'product/product_img420190826201414.jpg', 0, 90, 80, 0, 'INMEDIATO', 2, 10, 63, '01010101', 'H87', 'NA', 0),
(41, 'SATA II', 'Cable Sata Para Datos Disco Duro Quemador', '', 2, 38, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120190826202129.jpg', '', '', '', 0, 60, 50, 1, 'INMEDIATO', 1, 1, 30, '01010101', 'H87', 'NA', 0),
(42, '', 'DHL GUIA XPRESS', '', 3, 42, '', 'DHL', 'DHL', 'product/product_img120190906134246.jpg', '', '', '', 0, 199, 199, 1000, '1 DIA HABIL', 0, 0, 177, '01010101', 'H87', 'NA', 0),
(43, '', 'CLAVIJA CARGADOR VIAJE TRIPLE USB RAPIDA 3.1A', '', 1, 39, 'VITRINA', 'GENERICO', 'ANDRES DANIEL MANZANO RODRIGUEZ', 'product/product_img120191007193307.jpg', '', '', '', 0, 66, 50, 1, 'INMEDIATO', 0, 4, 33, '01010101', 'H87', 'NA', 0),
(44, '', 'Multicargador Universal Laptop 8 Puntas 12 - 24v', '', 1, 38, 'vitrina', 'GENERICO', 'ANDRES DANIEL MANZANO RODRIGUEZ', 'product/product_img120191007193833.jpg', 'product/product_img220191007193833.jpg', 'product/product_img320191007193833.jpg', 'product/product_img420191007193833.jpg', 0, 281, 230, 0, 'INMEDIATO', 1, 4, 108, '01010101', 'H87', 'NA', 0),
(46, '', 'Sistema WEB Cotización, Remisión, Facturación e Inventario', '', 3, 37, '', 'CLTA', 'CLTA', 'product/product_img120191111175402.jpg', '', '', '', 0, 6000, 60000, 1000, 'INMEDIATO', 0, 0, 0, '01010101', 'H87', 'NA', 0),
(47, 'mag-350', 'IMAN MAGNETICO PARA PUERTA', '', 3, 33, 'RSELL', 'VARIOS', 'DESCONOCIDO', 'product/product_img120200305095158.jpg', '', '', '', 0, 2800, 2700, 1, '1 DIA HABIL', 1, 1, 1600, '01010101', 'H87', 'NA', 0),
(48, 'SOP-TECT-290513', 'ASISTENCIA TECNICA', 'SPORTE TECNICO POR TIEMPO, EL VALOR INGRESADO REPRESENTA EL COSTO POR UN MINUTO', 3, 37, 'CONMUTADOR, WHATSAPP, ETC ', 'SOPORTE', 'SOPORTE', 'product/product_img120200615121259.jpg', '', '', '', 0, 12, 7, 999999455, 'INMEDIATO', 0, 0, 1, '01010101', 'H87', 'NA', 0),
(49, 'ACT', 'ACTA DE NACIMIENTO MAYOREO', '', 3, 42, '', '', '', 'product/product_img120200620161518.jpg', '', '', '', 0, 90, 80, 999868, 'INMEDIATO', 10, 100, 50, '01010101', 'H87', 'NA', 0),
(50, 'EDIT,UPDATE-CURP', 'CORRECCION, ALTA CURP MAYOREO', '', 3, 42, '', '', '', 'product/product_img120200620161546.jpg', '', '', '', 0, 350, 300, 999999, 'INMEDIATO', 1, 10, 250, '01010101', 'H87', 'NA', 0),
(51, 'hub-14', 'Hub Usb 2.0 Led 7 Puertos Computadoras Pc Laptop Memorias', '', 1, 38, '', 'E-ELEGATE', 'ELEGATE', 'product/product_img120200620151139.jpg', '', '', '', 0, 85, 85, 1, 'INMEDIATO', 1, 3, 45, '01010101', 'PZ', 'NA', 0),
(52, 'T_C_EXT_3_MTS', 'Cargador eXTENSION Tipo C c. rapida 3 mTS', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200620151832.jpg', '', '', '', 0, 75, 75, 0, 'INMEDIATO', 1, 3, 45, '01010101', 'UD', 'NA', 0),
(53, 'OJUF34697', 'TRAVEL CHARGER ', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200620152443.jpg', '', '', '', 0, 75, 75, 6, 'INMEDIATO', 1, 0, 75, '01010101', 'H87', 'NA', 0),
(54, 'SHANDIAN_USB', 'MICRO SD SHANDIAN 16 gb', '', 1, 40, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200620152705.jpg', '', '', '', 0, 120, 120, 0, 'INMEDIATO', 2, 4, 68, '01010101', 'H87', 'NA', 0),
(55, 'SHANDIAN', 'MICRO SD SHANDIAN 32 GB', '', 1, 40, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200620152834.jpg', '', '', '', 0, 150, 150, -1, 'INMEDIATO', 1, 4, 70, '01010101', 'H87', 'NA', 0),
(56, 'USB_JASTER', 'Memoria Usb 16gb economica', '', 1, 40, '', 'Jaster', 'DESCONOCIDO', 'product/product_img120200620153310.jpg', '', '', '', 0, 120, 120, 4, 'INMEDIATO', 2, 4, 68, '01010101', 'PZ', 'NA', 0),
(57, 'USB-ANIM', 'USB ANIMADOS 16 GB', 'descripcion ss', 1, 40, 'VI_MEDIO\r\n', 'MARCA GEN', 'PROVEEDOR INC', 'product/product_img120200620161331.jpg', '', '', '', 0, 150, 150, -1, 'INMEDIATO', 1, 2, 80, '01010101', 'H87', 'NA', 0),
(58, 'EW-RED-EAR', 'Game pad', '', 1, 33, '', '', '', '', '', '', '', 0, 80, 80, 4, 'INMEDIATO', 1, 6, 80, '$', 'H87', 'NA', 0),
(59, 'C-V8-LUN', 'CARGADOR V8 ', '', 2, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200630085933.jpg', '', '', '', 0, 55, 54, 5, 'INMEDIATO', 2, 6, 35, '01010101', 'H87', 'NA', 0),
(60, '', 'Audífonos cierre ', '', 1, 33, '', 'GENERICO', 'GENERICO', 'product/product_img120200715165431.jpg', '', '', '', 0, 49, 49, 5, 'INMEDIATO', 1, 20, 49, '01010101', 'H87', 'NA', 0),
(61, '', 'Bocina Bluetooth Portátil Cilíndrica Recargable ', '', 1, 33, '', 'GENERICO', 'GENERICO', 'product/product_img120200715165620.jpg', '', '', '', 0, 270, 210, 2, 'INMEDIATO', 0, 0, 130, '01010101', 'H87', 'NA', 0),
(62, 'usb-gen', 'Memoria Usb 32gb economica', '', 2, 40, '', 'GENERICO', 'GENERICO', 'product/product_img120200723133054.jpg', '', '', '', 0, 150, 150, -2, '', 2, 4, 70, '01010101', 'H87', 'NA', 0),
(63, 'cartera', 'CARTERA MODELOS VARIOS', '', 1, 33, 'VITRINA', 'DESCONOCIDO', 'DESCONOCIDO', 'product/product_img120200820194540.jpg', '', '', '', 0, 230, 230, 5, 'INMEDIATO', 2, 10, 230, '01010101', 'H87', 'NA', 0),
(64, '', 'Llaveros', '', 1, 33, 'vITRINA', 'Cartoon ', 'DESCONOCIDO', 'product/product_img120201025135043.jpg', '', '', '', 0, 20, 20, 6, 'INMEDIATO', 1, 10, 20, '01010101', 'H87', 'NA', 0),
(66, '', 'Constancia sat Mayoreo', '', 3, 42, '', 'Desconocido', 'DESCONOCIDO', 'product/product_img120200822133456.jpg', '', '', '', 0, 110, 110, 99929, 'INMEDIATO', 10, 1000, 25, '01010101', 'H87', 'NA', 0),
(67, '', 'Comunicado SAT', '', 3, 42, '', '', '', 'product/product_img120201116111616.jpg', '', '', '', 0, 60, 60, 978, 'INMEDIATO', 10, 100, 60, '01010101', 'H87', 'NA', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_sub`
--

CREATE TABLE `productos_sub` (
  `id` int(11) NOT NULL,
  `padre` int(11) NOT NULL,
  `almacen` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `ubicacion` varchar(254) NOT NULL,
  `max` int(11) NOT NULL DEFAULT 0,
  `min` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_sub`
--

INSERT INTO `productos_sub` (`id`, `padre`, `almacen`, `stock`, `ubicacion`, `max`, `min`) VALUES
(1, 19, 2, 1, 'VIDRIO ENTRADA', 10, 2),
(3, 14, 2, 1, 'VIDRIO ENTRADA', 10, 2),
(4, 16, 2, 3, 'VIDRIO ENTRADA', 12, 4),
(5, 20, 2, 0, 'VIDRIO ENTRADA', 4, 1),
(10, 34, 2, 0, '', 1, 1),
(12, 39, 2, 1, '', 1, 1),
(13, 38, 2, -6, '', 1, 1),
(14, 37, 2, 0, '', 1, 1),
(15, 40, 2, -1, '', 1, 1),
(16, 43, 2, 1, 'PUERTA', 2, 1),
(17, 21, 2, 0, '', 2, 1),
(18, 57, 2, 1, '', 3, 1),
(19, 55, 2, 0, '', 2, 1),
(20, 54, 2, 0, '', 3, 1),
(21, 56, 2, 2, '', 10, 1),
(22, 38, 2, 2, '', 10, 1),
(23, 53, 2, 1, '', 2, 1),
(24, 59, 1, 1, '', 1, 1),
(25, 60, 2, 1, '', 1, 1),
(26, 61, 2, 1, '', 1, 1),
(27, 62, 1, -2, '', 1, 1),
(28, 56, 4, 0, '', 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_pedido`
--

CREATE TABLE `product_pedido` (
  `id` int(11) NOT NULL,
  `folio_venta` varchar(254) NOT NULL,
  `product` int(11) DEFAULT NULL,
  `unidades` int(11) NOT NULL,
  `precio` float NOT NULL,
  `p_generico` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_trasnfer`
--

CREATE TABLE `product_trasnfer` (
  `id` int(11) NOT NULL,
  `folio_tranfer` varchar(254) NOT NULL,
  `product` int(11) DEFAULT NULL,
  `unidades` int(11) NOT NULL,
  `product_sub` int(11) DEFAULT NULL,
  `almacen_destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product_trasnfer`
--

INSERT INTO `product_trasnfer` (`id`, `folio_tranfer`, `product`, `unidades`, `product_sub`, `almacen_destino`) VALUES
(63, '20210605043410', 149, 1, NULL, 16),
(64, '20210605043404', 149, 1, NULL, 16),
(65, '20210605043404', 149, 3, 2, 14),
(66, '20210605043404', 149, 4, 3, 15),
(67, '20210605043404', 149, 3, 17, 14),
(68, '20210605043402', 149, 1, NULL, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_venta`
--

CREATE TABLE `product_venta` (
  `id` int(11) NOT NULL,
  `folio_venta` varchar(254) NOT NULL,
  `product` int(11) DEFAULT NULL,
  `unidades` int(11) NOT NULL,
  `precio` float NOT NULL,
  `product_sub` int(11) DEFAULT NULL,
  `p_generico` varchar(254) DEFAULT NULL,
  `ancho` decimal(64,2) NOT NULL DEFAULT 0.00,
  `alto` decimal(64,2) NOT NULL DEFAULT 0.00,
  `largo` decimal(64,2) NOT NULL DEFAULT 0.00,
  `peso` decimal(64,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product_venta`
--

INSERT INTO `product_venta` (`id`, `folio_venta`, `product`, `unidades`, `precio`, `product_sub`, `p_generico`, `ancho`, `alto`, `largo`, `peso`) VALUES
(3, '120190819143328', 3, 1, 4600, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(17, '120190820121431', 3, 1, 4600, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(18, '120190820121431', 5, 2, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(19, '120190820121431', 4, 2, 1058.62, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(22, '120190820190330', 3, 1, 4600, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(23, '120190820190330', NULL, 1, -805, NULL, 'COMISION ML', '0.00', '0.00', '0.00', '0.00'),
(60, '3720190823151129', 14, 1, 45, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(75, '120190829201049', NULL, 1, 180, NULL, 'Cable de energia for pC', '0.00', '0.00', '0.00', '0.00'),
(84, '120190829205530', NULL, 1, 190, NULL, 'OPTIMIZACION DE SISTEMA OPERATIVO ', '0.00', '0.00', '0.00', '0.00'),
(88, '120190831213732', NULL, 1, 300, NULL, 'INSTALACION E. NUEVOS', '0.00', '0.00', '0.00', '0.00'),
(90, '3820190901113349', NULL, 1, 480, NULL, 'unidad cd', '0.00', '0.00', '0.00', '0.00'),
(91, '3820190901113349', NULL, 1, 50, NULL, 'instalación de unidad cd ', '0.00', '0.00', '0.00', '0.00'),
(92, '3820190901113349', NULL, 1, 450, NULL, 'formateo', '0.00', '0.00', '0.00', '0.00'),
(93, '3820190901113349', NULL, 1, 150, NULL, 'respaldo de información ', '0.00', '0.00', '0.00', '0.00'),
(103, '3720190904154428', 16, 1, 35, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(104, '120190904183621', NULL, 1, 300, NULL, 'Instalación equipos nuevos', '0.00', '0.00', '0.00', '0.00'),
(105, '120190904183621', NULL, 5, 20, NULL, 'Limpieza virus USB', '0.00', '0.00', '0.00', '0.00'),
(108, '120190905085759', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(115, '3720190905180041', 21, 1, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(128, '3720190906190751', 38, 1, 25, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(129, '120190907112858', NULL, 1, 190, NULL, 'Paqueteria office', '0.00', '0.00', '0.00', '0.00'),
(130, '120190907112858', NULL, 1, 100, NULL, 'Antivirus Karspersky free', '0.00', '0.00', '0.00', '0.00'),
(138, '120190907143803', 16, 1, 35, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(139, '120190907143803', 20, 1, 53, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(141, '120190907201649', NULL, 1, -10, NULL, 'DESCUENTO', '0.00', '0.00', '0.00', '0.00'),
(148, '120190909205319', NULL, 1, 60, NULL, 'Diagnostico laptop compaq presario CQ56', '0.00', '0.00', '0.00', '0.00'),
(175, '3820190916113452', NULL, 1, 370, NULL, 'limpieza, paqueteria office, antivirus.', '0.00', '0.00', '0.00', '0.00'),
(176, '120190916123500', NULL, 1, 200, NULL, 'Reiniciar/Restaurar Sistema', '0.00', '0.00', '0.00', '0.00'),
(177, '120190916123500', NULL, 1, 150, NULL, 'Instalacion suite office', '0.00', '0.00', '0.00', '0.00'),
(178, '120190916123500', NULL, 1, 49.99, NULL, 'Antivirus', '0.00', '0.00', '0.00', '0.00'),
(179, '120190916193937', 23, 1, 150, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(180, '120190916221358', NULL, 1, 4800, NULL, 'SISTEMA CONTROL DE SOCIOS ', '0.00', '0.00', '0.00', '0.00'),
(181, '120190917120915', 34, 1, 70, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(183, '120190917192301', NULL, 1, 0, NULL, 'IMPRESORA REVIZAR RODILLOS, NO JALA LA HOJA', '0.00', '0.00', '0.00', '0.00'),
(189, '120190921153718', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(203, '120190925202625', NULL, 1, 280, NULL, 'Instalacion basica ', '0.00', '0.00', '0.00', '0.00'),
(206, '120190926141326', 38, 1, 25, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(207, '120190926141326', 35, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(211, '120190926205952', 4, 4, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(212, '120190927122730', NULL, 1, 4500, NULL, 'Lic. Vitalicia sistema hotelero ', '0.00', '0.00', '0.00', '0.00'),
(213, '120190927195056', NULL, 18, 5, NULL, 'Escaneo de documentos', '0.00', '0.00', '0.00', '0.00'),
(214, '120190927195056', NULL, 1, 10, NULL, 'Envio de correo electronico', '0.00', '0.00', '0.00', '0.00'),
(217, '120190928145049', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(220, '120190928164919', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(229, '120190929102555', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(237, '120190930114626', NULL, 1, 180, NULL, 'Configuracion de printer', '0.00', '0.00', '0.00', '0.00'),
(239, '120190925093148', NULL, 1, 400, NULL, 'SEPARAR REPORTE POR CONCEPTO ANTCP. 50 %', '0.00', '0.00', '0.00', '0.00'),
(240, '120190925093148', NULL, 1, 225, NULL, 'MONTO TOTAL Y NUMEROS DE MOVIMIENTOS EN REPORTES ANTICIPO 50 %', '0.00', '0.00', '0.00', '0.00'),
(242, '120190925093148', NULL, 1, 300, NULL, 'REPORTE DE CLIENTES POR SEXO Y MUNICIPIO ANTICIPO 50 %', '0.00', '0.00', '0.00', '0.00'),
(243, '120190925093148', NULL, 1, 200, NULL, 'AGRAGAR CAMPO SEXO Y MUNICIPIO EN CLIENTES ANTICIPO 50 %', '0.00', '0.00', '0.00', '0.00'),
(261, '3720191003105645', 34, 1, 70, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(267, '120191004195727', NULL, 27, 8, NULL, 'impresiones color', '0.00', '0.00', '0.00', '0.00'),
(268, '120191004195727', NULL, 34, 0.7, NULL, 'impresiones bn mayoreo', '0.00', '0.00', '0.00', '0.00'),
(270, '120191005195335', 37, 1, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(271, '3720191006131620', 38, 1, 25, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(272, '120191006181905', NULL, 1, 480, NULL, 'actualización sistema control de socios.  ', '0.00', '0.00', '0.00', '0.00'),
(274, '120191007150313', NULL, 1, 100, NULL, 'generico', '0.00', '0.00', '0.00', '0.00'),
(290, '120191011135643', NULL, 1, 4500, NULL, 'Licencia Sistema Hotelero', '0.00', '0.00', '0.00', '0.00'),
(291, '120191011192654', NULL, 1, 350, NULL, 'INSTALACION BASICA', '0.00', '0.00', '0.00', '0.00'),
(292, '120191011192654', NULL, 1, 350, NULL, 'fORMATEO DE EQUIPO', '0.00', '0.00', '0.00', '0.00'),
(293, '120191014113426', NULL, 1, 400, NULL, 'PRODUCTO SEPARAR REPORTE POR CONCEPTO ', '0.00', '0.00', '0.00', '0.00'),
(294, '120191014113426', NULL, 1, 200, NULL, 'MONTO TOTAL Y NUMEROS DE MOVIMIENTOS EN REPORTES ', '0.00', '0.00', '0.00', '0.00'),
(295, '120191014113426', NULL, 1, 300, NULL, 'REPORTE DE CLIENTES POR SEXO Y MUNICIPIO', '0.00', '0.00', '0.00', '0.00'),
(296, '120191014113426', NULL, 1, 225, NULL, 'AGRAGAR CAMPO SEXO Y MUNICIPIO EN CLIENTES', '0.00', '0.00', '0.00', '0.00'),
(298, '120191014165302', NULL, 1, 290, NULL, 'Actualizacion sistema hotelero', '0.00', '0.00', '0.00', '0.00'),
(299, '120191014165302', NULL, 461, 2.32, NULL, 'folios facturas', '0.00', '0.00', '0.00', '0.00'),
(301, '120191014193713', 35, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(302, '120191016124524', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(303, '120191016215055', NULL, 1, 1900, NULL, 'Lector de huellas digital person 4500 uaere', '0.00', '0.00', '0.00', '0.00'),
(304, '120191016215055', NULL, 1, 100, NULL, 'Diagnostico y configuración ', '0.00', '0.00', '0.00', '0.00'),
(309, '120191017195945', 40, 1, 150, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(310, '3720191018162441', NULL, 1, 190, NULL, 'AUDIFONOS', '0.00', '0.00', '0.00', '0.00'),
(312, '3720191018162557', 20, 1, 53, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(313, '120191011135643', NULL, 1, 950, NULL, 'Anualidad cfdi.  50 % descuento ', '0.00', '0.00', '0.00', '0.00'),
(316, '120191020164646', 43, 1, 66, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(318, '120191020164646', NULL, 1, 40, NULL, 'Cable USB', '0.00', '0.00', '0.00', '0.00'),
(323, '120191022111046', NULL, 1, 4600, NULL, 'Sistema control de socios precio anterior.  ', '0.00', '0.00', '0.00', '0.00'),
(324, '120191022145144', NULL, 1, 2000, NULL, 'Modulo tarifas y folios en reportes Z', '0.00', '0.00', '0.00', '0.00'),
(359, '120191029181000', NULL, 1, 4500, NULL, 'SISTEMA HOTELERO LICENCIA.  ', '0.00', '0.00', '0.00', '0.00'),
(368, '120191030143747', NULL, 1, 950, NULL, 'Anualidad CFDI 50 % descuento', '0.00', '0.00', '0.00', '0.00'),
(370, '120191101093802', NULL, 1, 1800, NULL, 'Anualidad CFDI', '0.00', '0.00', '0.00', '0.00'),
(371, '3820191101170229', 40, 1, 150, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(375, '120191105205941', NULL, 1, 480, NULL, 'Actualización, Sistema control de socios', '0.00', '0.00', '0.00', '0.00'),
(376, '120191107163213', NULL, 1, 480, NULL, 'Actualización control de socios.  ', '0.00', '0.00', '0.00', '0.00'),
(377, '120191108193425', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(404, '3820191113114846', NULL, 1, 28, NULL, 'usb micro', '0.00', '0.00', '0.00', '0.00'),
(405, '120191113223531', NULL, 1, 100, NULL, 'Anualidad correo electronico', '0.00', '0.00', '0.00', '0.00'),
(406, '120191114005331', NULL, 1, 480, NULL, 'Reinstalacion de sistema control de socios', '0.00', '0.00', '0.00', '0.00'),
(409, '120191114180220', NULL, 1, 200, NULL, 'Instalacion de 18 drivers en pc', '0.00', '0.00', '0.00', '0.00'),
(410, '120191116151736', NULL, 1, 1831.32, NULL, 'Software tallez lic. vitalica', '0.00', '0.00', '0.00', '0.00'),
(412, '120191119190512', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(414, '120191119190512', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(415, '120191119190512', 4, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(416, '120191119235516', NULL, 1, 300, NULL, 'Optimización y limpieza de windows os.  ', '0.00', '0.00', '0.00', '0.00'),
(420, '120191121122200', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(421, '120191121122456', NULL, 1, 641, NULL, 'reporte TXT o CSV', '0.00', '0.00', '0.00', '0.00'),
(422, '120191121122456', NULL, 1, 890, NULL, 'Agregar campos, pais, f. nacimiento, genero, canal de reserva', '0.00', '0.00', '0.00', '0.00'),
(424, '120191121122456', NULL, 1, 400, NULL, 'Autogenerar Archivo y dejarlo en pc', '0.00', '0.00', '0.00', '0.00'),
(425, '120191121122456', NULL, 1, 400, NULL, 'Subir dinero a ftp ', '0.00', '0.00', '0.00', '0.00'),
(427, '120191122200257', NULL, 1, 8, NULL, 'Impresion color', '0.00', '0.00', '0.00', '0.00'),
(428, '120191123103040', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(429, '120191123103040', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(431, '120191126104315', NULL, 1, 199, NULL, 'Soporte tecnico', '0.00', '0.00', '0.00', '0.00'),
(436, '120191127121217', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(439, '120191128095310', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(441, '120191122200257', NULL, 25, 8, NULL, 'Impresiones color', '0.00', '0.00', '0.00', '0.00'),
(442, '120191122200257', NULL, 4, 1, NULL, 'Impresiones BN', '0.00', '0.00', '0.00', '0.00'),
(443, '120191122200257', NULL, 6, 0.5, NULL, 'Copias TC', '0.00', '0.00', '0.00', '0.00'),
(444, '120191122200257', NULL, 6, 1, NULL, 'Impresiones BN', '0.00', '0.00', '0.00', '0.00'),
(445, '120191122200257', NULL, 1, 20, NULL, 'Uso internet', '0.00', '0.00', '0.00', '0.00'),
(446, '120191122200257', NULL, 7, 0.5, NULL, 'Copias TC', '0.00', '0.00', '0.00', '0.00'),
(447, '120191122200257', NULL, 3, 1, NULL, 'Impresiones BN', '0.00', '0.00', '0.00', '0.00'),
(448, '120191122200257', NULL, 2, 1, NULL, 'Impresiones BN', '0.00', '0.00', '0.00', '0.00'),
(449, '120191122200257', NULL, 7, 0.5, NULL, 'Impresiones BN', '0.00', '0.00', '0.00', '0.00'),
(451, '120191128191557', NULL, 1, 8, NULL, 'Impresion color', '0.00', '0.00', '0.00', '0.00'),
(452, '120191128191557', NULL, 25, 8, NULL, 'Impresion color', '0.00', '0.00', '0.00', '0.00'),
(453, '120191128191557', NULL, 4, 1, NULL, ' Impresiones BN', '0.00', '0.00', '0.00', '0.00'),
(454, '120191128191557', NULL, 6, 0.5, NULL, ' Copias TC', '0.00', '0.00', '0.00', '0.00'),
(455, '120191128191557', NULL, 6, 1, NULL, ' Impresiones BN', '0.00', '0.00', '0.00', '0.00'),
(456, '120191128191557', NULL, 1, 20, NULL, ' Uso internet', '0.00', '0.00', '0.00', '0.00'),
(458, '120191128191557', NULL, 3, 1, NULL, ' Impresiones BN', '0.00', '0.00', '0.00', '0.00'),
(459, '120191128191557', NULL, 2, 1, NULL, ' Impresiones BN ', '0.00', '0.00', '0.00', '0.00'),
(460, '120191128191557', NULL, 7, 1, NULL, 'Impresiones BN', '0.00', '0.00', '0.00', '0.00'),
(461, '120191201121446', NULL, 1, 230, NULL, 'Instalacion de office', '0.00', '0.00', '0.00', '0.00'),
(465, '3820191206134000', NULL, 1, 45, NULL, 'cable usb naranja con rayitas negras', '0.00', '0.00', '0.00', '0.00'),
(470, '3720191209145110', 21, 1, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(471, '120191211172238', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(472, '120191211172238', 4, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(473, '120191211172238', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(474, '120191212182812', NULL, 1, 780, NULL, 'Código Fuente Genera Pdf De Xml Cfdi 3.3 - C#', '0.00', '0.00', '0.00', '0.00'),
(475, '120191212203154', NULL, 3, 7, NULL, 'Impresion color', '0.00', '0.00', '0.00', '0.00'),
(476, '120191212203154', NULL, 5, 7, NULL, 'Impresion color', '0.00', '0.00', '0.00', '0.00'),
(477, '120191212203154', NULL, 17, 7, NULL, 'Impresion color', '0.00', '0.00', '0.00', '0.00'),
(478, '120191212203154', NULL, 21, 7, NULL, 'Impresion Color   ', '0.00', '0.00', '0.00', '0.00'),
(482, '120191215121646', NULL, 1, 100, NULL, 'Instalación y configuración dvr', '0.00', '0.00', '0.00', '0.00'),
(483, '120191215121646', NULL, 1, 700, NULL, 'Disco duro hdd 500Gb 3.5', '0.00', '0.00', '0.00', '0.00'),
(484, '120191215121646', NULL, 1, 2900, NULL, 'Dvr 16 canales dahua ', '0.00', '0.00', '0.00', '0.00'),
(496, '3720191217175255', 34, 1, 70, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(500, '120191219190531', NULL, 17, 7, NULL, 'Impresiones color ', '0.00', '0.00', '0.00', '0.00'),
(501, '120191220114310', NULL, 1, 4800, NULL, 'Sistema control de socios ', '0.00', '0.00', '0.00', '0.00'),
(507, '120191222191800', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(508, '120191223101413', NULL, 1, 580, NULL, 'Actualización control de socios ', '0.00', '0.00', '0.00', '0.00'),
(509, '120191223121908', NULL, 1, 4800, NULL, 'Control de socios ', '0.00', '0.00', '0.00', '0.00'),
(510, '120191223121908', NULL, 1, 1900, NULL, 'Relevador usb ', '0.00', '0.00', '0.00', '0.00'),
(511, '120191223191852', NULL, 1, 700, NULL, 'Disco duro ssd 120 GB', '0.00', '0.00', '0.00', '0.00'),
(512, '120191223191852', NULL, 1, 100, NULL, 'Gabinete Medio USO', '0.00', '0.00', '0.00', '0.00'),
(513, '120191223191852', NULL, 1, 500, NULL, 'mantenimiento a equipo de computo', '0.00', '0.00', '0.00', '0.00'),
(515, '120191224090514', NULL, 1, 2464, NULL, 'Kit ptv 12 % descuento ', '0.00', '0.00', '0.00', '0.00'),
(516, '120191224090514', NULL, 1, 2400, NULL, 'Sistema control socios. 50 % descuento.   ', '0.00', '0.00', '0.00', '0.00'),
(517, '120191226110834', NULL, 1, 4500, NULL, 'Sistema hotelero lic', '0.00', '0.00', '0.00', '0.00'),
(518, '120191226133437', NULL, 1, 580, NULL, 'Actualización control de socios.  ', '0.00', '0.00', '0.00', '0.00'),
(520, '120191227183100', NULL, 1, 4800, NULL, 'Sistema control de socios Sistema control de socios Lic', '0.00', '0.00', '0.00', '0.00'),
(521, '120191227193742', NULL, 1, 4800, NULL, 'Sistema control de socio', '0.00', '0.00', '0.00', '0.00'),
(522, '3720191229132537', 35, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(523, '3820191230111732', 34, 1, 70, 10, NULL, '0.00', '0.00', '0.00', '0.00'),
(524, '3720191230144723', 38, 1, 23, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(526, '120191231095013', NULL, 1, 1276, NULL, 'Modificaciones, segun lo acordado', '0.00', '0.00', '0.00', '0.00'),
(530, '3820200102102438', 38, 1, 23, 13, NULL, '0.00', '0.00', '0.00', '0.00'),
(537, '3720200103123139', 20, 1, 53, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(538, '120200103144631', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(539, '120200103162126', NULL, 1, 2870, NULL, 'Kit Punto De Venta lector de barras  , impresora cajón ', '0.00', '0.00', '0.00', '0.00'),
(540, '120200103162126', NULL, 1, 1900, NULL, 'Lector de huellas ', '0.00', '0.00', '0.00', '0.00'),
(542, '120200105121047', NULL, 1, 4800, NULL, 'Sistema control de socios.  ', '0.00', '0.00', '0.00', '0.00'),
(543, '120200105140748', NULL, 1, 4800, NULL, 'Control de socios Lic. Vitalicia ', '0.00', '0.00', '0.00', '0.00'),
(546, '120200107203605', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(547, '120200107203605', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(548, '120200110093529', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(549, '120200111110951', NULL, 20, 9, NULL, 'Imp color', '0.00', '0.00', '0.00', '0.00'),
(550, '120200104175315', NULL, 1, 25, NULL, 'cable usb', '0.00', '0.00', '0.00', '0.00'),
(552, '120200114134955', 4, 3, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(553, '120200114134955', 3, 2, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(554, '120200115120846', NULL, 1, 4800, NULL, 'Control de socios Lic vitalicia', '0.00', '0.00', '0.00', '0.00'),
(555, '120200115134352', NULL, 1, 4800, NULL, 'Control de socios', '0.00', '0.00', '0.00', '0.00'),
(556, '120200115134352', NULL, 1, 1900, NULL, 'Lector de huella', '0.00', '0.00', '0.00', '0.00'),
(559, '120200117130324', NULL, 1, 4800, NULL, 'Control de socios licencia vitalicia', '0.00', '0.00', '0.00', '0.00'),
(560, '3820200117132945', 43, 1, 66, 16, NULL, '0.00', '0.00', '0.00', '0.00'),
(561, '3820200117132945', NULL, 1, 23, NULL, 'cable usb azul', '0.00', '0.00', '0.00', '0.00'),
(570, '120200118142448', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(571, '120200118142448', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(576, '3820200123185435', NULL, 1, 230, NULL, 'recibi computadora', '0.00', '0.00', '0.00', '0.00'),
(578, '120200124105728', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(579, '120200124105728', 4, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(580, '120200124105728', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(586, '3820200123185653', 20, 1, 53, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(587, '3820200123185653', NULL, 1, 55, NULL, 'Cargador de lunita', '0.00', '0.00', '0.00', '0.00'),
(588, '120200124201751', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(591, '3720200126123920', NULL, 1, 19, NULL, 'Cable USB blanco', '0.00', '0.00', '0.00', '0.00'),
(593, '3820200126135001', NULL, 1, 350, NULL, 'laptop hp', '0.00', '0.00', '0.00', '0.00'),
(594, '3720200126145305', NULL, 1, 23, NULL, 'ADAPTADOR OTG', '0.00', '0.00', '0.00', '0.00'),
(595, '3820200126151742', NULL, 1, 23, NULL, 'mini adaptador', '0.00', '0.00', '0.00', '0.00'),
(605, '120200129214930', NULL, 1, 4999, NULL, 'Control de socios Lic.  Vitalicia ', '0.00', '0.00', '0.00', '0.00'),
(613, '3720200131155849', 38, 1, 23, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(614, '3720200204163223', 38, 1, 23, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(615, '120200205122840', NULL, 1, 3000, NULL, 'Licencia Sistema Estacionamiento', '0.00', '0.00', '0.00', '0.00'),
(624, '120200210122304', 3, 1, 4800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(625, '120200211003703', NULL, 1, 4500, NULL, 'Sistema hotelero. ', '0.00', '0.00', '0.00', '0.00'),
(628, '120200211200422', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(629, '120200211200422', 4, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(630, '120200211200422', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(632, '3820200214171445', 38, 1, 23, 13, NULL, '0.00', '0.00', '0.00', '0.00'),
(633, '120200214191541', NULL, 121, 0.6, NULL, 'Copías TC', '0.00', '0.00', '0.00', '0.00'),
(634, '120200215121630', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(635, '120200215121630', 4, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(636, '120200215121630', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(638, '3820200216144107', NULL, 1, 25, NULL, 'usb color azul entrada delgada', '0.00', '0.00', '0.00', '0.00'),
(639, '3720200217164916', 22, 1, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(640, '3720200217165030', 40, 1, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(641, '120200217223930', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(642, '120200217223930', NULL, 1, 1900, NULL, 'Anualidad CFDI', '0.00', '0.00', '0.00', '0.00'),
(643, '120200218131603', NULL, 1, 5500, NULL, 'Sistema lic. vitalicia Web Inventarios', '0.00', '0.00', '0.00', '0.00'),
(644, '120200218131603', NULL, 1, 1000, NULL, 'Hosting Anualidad', '0.00', '0.00', '0.00', '0.00'),
(645, '120200219111106', NULL, 1, 4999, NULL, 'Lic.  Control de socios ', '0.00', '0.00', '0.00', '0.00'),
(646, '120200219164131', NULL, 503, 2.32, NULL, 'Servicio de timbrado a la fecha.', '0.00', '0.00', '0.00', '0.00'),
(656, '120200221110215', NULL, 1, 1900, NULL, 'Anualidad CFDI , CABB891111CL8', '0.00', '0.00', '0.00', '0.00'),
(657, '120200222191451', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(658, '3820200223131054', NULL, 1, 23, NULL, 'adaptador de usb para celular', '0.00', '0.00', '0.00', '0.00'),
(659, '3720200223134942', 37, 1, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(660, '3720200223151012', NULL, 1, 65, NULL, 'cargador de lunita ', '0.00', '0.00', '0.00', '0.00'),
(661, '120200223223835', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(662, '120200223223835', NULL, 1, 100, NULL, 'Anualidad Emails', '0.00', '0.00', '0.00', '0.00'),
(663, '3820200224115303', NULL, 1, 75, NULL, 'cargador travel charger', '0.00', '0.00', '0.00', '0.00'),
(664, '120200224140712', 3, 1, 5000, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(665, '120200224141101', NULL, 1, 100, NULL, 'Anualidad SendMAil. fol 120200223223835', '0.00', '0.00', '0.00', '0.00'),
(667, '120200227090513', NULL, 1, 4999, NULL, 'Sistema control de socios ', '0.00', '0.00', '0.00', '0.00'),
(668, '120200227090513', NULL, 1, 1900, NULL, 'Lector de huellas digital person ', '0.00', '0.00', '0.00', '0.00'),
(670, '120200227090513', NULL, 1, 2870, NULL, 'Chapa magnética 300 libras ', '0.00', '0.00', '0.00', '0.00'),
(671, '120200227090513', NULL, 1, 1900, NULL, 'Relevador usb ', '0.00', '0.00', '0.00', '0.00'),
(672, '120200228101706', 28, 1, 2870, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(673, '120200301183321', NULL, 1, 4000, NULL, 'Anticipo sistema de ventas con modificaciones acordadas. ', '0.00', '0.00', '0.00', '0.00'),
(674, '3820200302103522', NULL, 1, 19, NULL, 'cable usb blanco ', '0.00', '0.00', '0.00', '0.00'),
(707, '120200310104440', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(708, '120200310104440', NULL, 1, 1900, NULL, 'Anualidad CFDI', '0.00', '0.00', '0.00', '0.00'),
(710, '120200311102623', NULL, 1, 464, NULL, 'Servicio Soporte  Tecnico', '0.00', '0.00', '0.00', '0.00'),
(712, '120200311102840', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(713, '120200311102840', 4, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(715, '3820200312145259', NULL, 1, 20, NULL, 'cable usb negro con punta delgada', '0.00', '0.00', '0.00', '0.00'),
(716, '120200313173607', 4, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(718, '120200314104810', NULL, 5, 6, NULL, 'Impresiones color', '0.00', '0.00', '0.00', '0.00'),
(719, '120200314104810', NULL, 10, 6, NULL, 'Impresiones mayoreo color', '0.00', '0.00', '0.00', '0.00'),
(726, '3820200324125724', NULL, 1, 25, NULL, 'auriculares', '0.00', '0.00', '0.00', '0.00'),
(727, '120200324191513', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(728, '120200325181657', NULL, 14, 7, NULL, 'Imp Color', '0.00', '0.00', '0.00', '0.00'),
(750, '120200401195048', NULL, 1, 450, NULL, 'Reinstalacion y respaldo Control de socios', '0.00', '0.00', '0.00', '0.00'),
(751, '120200404153703', NULL, 1, 3000, NULL, '50 % Sistema PTv WEb', '0.00', '0.00', '0.00', '0.00'),
(753, '120200404160402', NULL, 1, 1300, NULL, 'moamao-tpv.com + certificado digital, anualidad. ', '0.00', '0.00', '0.00', '0.00'),
(756, '120200407215434', NULL, 1, 5800, NULL, 'Software Radio taxi + 1 caller ID', '0.00', '0.00', '0.00', '0.00'),
(757, '3820200408185729', NULL, 1, 19, NULL, 'cable usb color negro', '0.00', '0.00', '0.00', '0.00'),
(760, '120200410164933', NULL, 1, 400, NULL, 'Reinstalación y respaldo de sistema', '0.00', '0.00', '0.00', '0.00'),
(761, '3820200412132345', NULL, 1, 139, NULL, 'memoria usb ', '0.00', '0.00', '0.00', '0.00'),
(762, '3820200414140742', NULL, 1, 23, NULL, 'adaptador usb a celular', '0.00', '0.00', '0.00', '0.00'),
(763, '3820200415171824', NULL, 1, 120, NULL, 'MEMORIA USB ', '0.00', '0.00', '0.00', '0.00'),
(765, '3820200420134252', NULL, 1, 23, NULL, 'adaptador de usb para celular', '0.00', '0.00', '0.00', '0.00'),
(766, '120200422094312', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(768, '120200422192310', NULL, 1, 1000, NULL, 'Anualidad server', '0.00', '0.00', '0.00', '0.00'),
(770, '120200422192310', NULL, 2, 4500, NULL, 'Sistema hotelero.  Lic vitalicia ', '0.00', '0.00', '0.00', '0.00'),
(771, '3820200424130204', NULL, 1, 120, NULL, 'memoria usb ', '0.00', '0.00', '0.00', '0.00'),
(772, '3820200424130204', NULL, 1, 139, NULL, 'memoria usb', '0.00', '0.00', '0.00', '0.00'),
(774, '3820200428105116', 34, 1, 70, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(777, '120200428203701', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(778, '120200428203701', NULL, 1, -1249, NULL, 'Desc', '0.00', '0.00', '0.00', '0.00'),
(782, '120200430104842', NULL, 1, 4500, NULL, 'Lic. Sistema hotelero ', '0.00', '0.00', '0.00', '0.00'),
(784, '120200430104842', NULL, 1, 1900, NULL, 'Anualidad cfdi.  ', '0.00', '0.00', '0.00', '0.00'),
(794, '120200512211718', NULL, 1, 1000, NULL, 'Abono por un total de $ 1950 ajustes control de socios', '0.00', '0.00', '0.00', '0.00'),
(795, '120200513104001', NULL, 1, 1900, NULL, 'Anualidad CFDI', '0.00', '0.00', '0.00', '0.00'),
(796, '120200513112736', NULL, 1, 150, NULL, 'Asistencia tecnica', '0.00', '0.00', '0.00', '0.00'),
(797, '120200514232903', NULL, 1, 8120, NULL, 'Sistema web + anualidad servidor', '0.00', '0.00', '0.00', '0.00'),
(798, '3820200519131634', 38, 1, 23, 13, NULL, '0.00', '0.00', '0.00', '0.00'),
(799, '120200521115213', NULL, 18, 6, NULL, 'impresiones color', '0.00', '0.00', '0.00', '0.00'),
(800, '3820200521135408', 20, 1, 53, 5, NULL, '0.00', '0.00', '0.00', '0.00'),
(801, '120200525125754', NULL, 1, 3364, NULL, 'Ajustes acordados ', '0.00', '0.00', '0.00', '0.00'),
(803, '120200526153134', NULL, 1, 4800, NULL, 'Sistema web control', '0.00', '0.00', '0.00', '0.00'),
(804, '120200526153239', NULL, 2, 1500, NULL, 'Minisuper + ajuste familias', '0.00', '0.00', '0.00', '0.00'),
(805, '120200527092213', NULL, 1, 3364, NULL, 'Ajustes solicitados', '0.00', '0.00', '0.00', '0.00'),
(806, '120200527092332', NULL, 2, 1900, NULL, 'Anualidad cfdi', '0.00', '0.00', '0.00', '0.00'),
(811, '3820200528125918', NULL, 1, 120, NULL, 'USB ADATA 16GB', '0.00', '0.00', '0.00', '0.00'),
(812, '120200529165018', NULL, 2, 580, NULL, 'Actualización sistema hotelero ', '0.00', '0.00', '0.00', '0.00'),
(817, '120200602141246', NULL, 2, 580, NULL, 'Actualizacion sistema hotelero', '0.00', '0.00', '0.00', '0.00'),
(818, '120200603154543', NULL, 1, 812, NULL, 'Reinstalación sistema hotelero ', '0.00', '0.00', '0.00', '0.00'),
(820, '120200604174537', NULL, 1, 400, NULL, 'Reinstalacion sistema control de socios', '0.00', '0.00', '0.00', '0.00'),
(823, '120200610192001', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(824, '120200613121227', NULL, 1, 6500, NULL, 'Ajustes a medida solicitados', '0.00', '0.00', '0.00', '0.00'),
(825, '120200613121227', NULL, 1, 1500, NULL, 'Caller ID', '0.00', '0.00', '0.00', '0.00'),
(826, '120200613122527', NULL, 1, 6500, NULL, 'AJUSTES A MEDIDA SOLICITADOS', '0.00', '0.00', '0.00', '0.00'),
(831, '120200615120441', 48, 23, 8.12, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(834, '120200617152417', 48, 62, 8.12, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(836, '120200619150321', 48, 27, 8.12, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(837, '120200619184843', 48, 27, 8.12, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(838, '120200620145755', 20, 1, 53, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(839, '120200620161632', 49, 3, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(840, '120200620161632', 50, 1, 350, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(841, '120200620161732', 49, 1, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(842, '120200620163250', NULL, 1, 10, NULL, 'aa', '0.00', '0.00', '0.00', '0.00'),
(843, '120200620170024', 58, 1, 290, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(844, '3720200622153118', 56, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(845, '120200622190933', 54, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(846, '120200622193924', NULL, 1, 200, NULL, 'Eliminar Abonos de caja', '0.00', '0.00', '0.00', '0.00'),
(848, '120200622193924', NULL, 1, 324, NULL, 'Cierre de caja en modo corte x & z', '0.00', '0.00', '0.00', '0.00'),
(849, '120200622193924', NULL, 1, 1700, NULL, 'Informtes (Listado)', '0.00', '0.00', '0.00', '0.00'),
(850, '120200622193924', NULL, 1, 1948, NULL, 'Control de pedidos', '0.00', '0.00', '0.00', '0.00'),
(851, '3720200624121138', 34, 1, 70, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(852, '3820200625124629', 38, 1, 23, 22, NULL, '0.00', '0.00', '0.00', '0.00'),
(855, '120200626165105', NULL, 1, 580, NULL, 'Restauración. ', '0.00', '0.00', '0.00', '0.00'),
(856, '120200627145955', 49, 1, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(861, '120200630124124', NULL, 1, 672.8, NULL, 'Reinicie licencia manual ', '0.00', '0.00', '0.00', '0.00'),
(863, '3720200630143837', 59, 1, 55, 24, NULL, '0.00', '0.00', '0.00', '0.00'),
(864, '120200630144036', NULL, 1, 1900, NULL, 'Anualidad CFDI', '0.00', '0.00', '0.00', '0.00'),
(865, '3820200701113026', 38, 1, 23, 22, NULL, '0.00', '0.00', '0.00', '0.00'),
(866, '120200701150827', 19, 1, 25, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(867, '120200701161718', NULL, 1, 780.44, NULL, 'Recontruccion de usuario administrador', '0.00', '0.00', '0.00', '0.00'),
(1415, '120200703143244', NULL, 1, 650, NULL, 'AJUSTE BOTONES POR SEMANA', '0.00', '0.00', '0.00', '0.00'),
(1418, '120200704194244', 49, 1, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1419, '120200704194345', 49, 3, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1420, '120200705162232', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1421, '120200705162232', NULL, 1, 800, NULL, 'LECTOR RFID', '0.00', '0.00', '0.00', '0.00'),
(1422, '120200705162232', 4, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1423, '120200705162232', NULL, 100, 17, NULL, 'Tarjetas Proximidad', '0.00', '0.00', '0.00', '0.00'),
(1424, '120200705162232', NULL, 50, 29, NULL, 'Llaveros rfid', '0.00', '0.00', '0.00', '0.00'),
(1425, '3720200706104513', 38, 1, 23, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1426, '3720200706182308', 19, 1, 25, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1427, '3820200707091309', 56, 1, 120, 21, NULL, '0.00', '0.00', '0.00', '0.00'),
(1428, '120200708154251', 48, 1, 552, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1439, '120200708192655', NULL, 29, 3, NULL, 'Impresion color', '0.00', '0.00', '0.00', '0.00'),
(1442, '120200710135209', NULL, 1, 464, NULL, 'Reinstalación sistema en blanco ', '0.00', '0.00', '0.00', '0.00'),
(1443, '120200711120307', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1444, '120200711120531', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1447, '3720200713142512', 56, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1448, '3720200715170422', 60, 1, 210, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1449, '120200715194200', NULL, 1, 800, NULL, 'Lector RFID', '0.00', '0.00', '0.00', '0.00'),
(1450, '120200715194200', NULL, 100, 17, NULL, 'Tarjetas RFID', '0.00', '0.00', '0.00', '0.00'),
(1451, '120200716143707', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1452, '120200619150321', NULL, 1, 580, NULL, 'Reinstalacion Sistema hotelero', '0.00', '0.00', '0.00', '0.00'),
(1454, '120200716165040', 32, 1, 190, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1455, '3820200717101254', 56, 1, 120, 21, NULL, '0.00', '0.00', '0.00', '0.00'),
(1456, '120200717120846', 48, 58, 10, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1459, '120200719162107', 49, 1, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1460, '120200720134513', 48, 28, 10, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1463, '3720200721171139', 59, 1, 55, 24, NULL, '0.00', '0.00', '0.00', '0.00'),
(1465, '3720200721172923', 16, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1466, '3820200722152228', 19, 1, 23, 1, NULL, '0.00', '0.00', '0.00', '0.00'),
(1468, '3820200723103206', 19, 1, 23, 1, NULL, '0.00', '0.00', '0.00', '0.00'),
(1469, '3820200723125049', 56, 1, 120, 21, NULL, '0.00', '0.00', '0.00', '0.00'),
(1471, '120200723202347', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1472, '120200724182732', NULL, 1, 673, NULL, 'Actualizacion sistema hotelero', '0.00', '0.00', '0.00', '0.00'),
(1477, '120200727135904', NULL, 1, 680, NULL, 'Reinstalacion sistema hotelero con respaldo', '0.00', '0.00', '0.00', '0.00'),
(1478, '120200725171239', 62, 1, 0, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1479, '120200725171239', 56, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1480, '120200727165512', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1481, '120200727181614', 52, 1, 75, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1482, '120200728140040', NULL, 1, 580, NULL, 'Reinstalacion de sistema en blanco y recuperacion de contraseña', '0.00', '0.00', '0.00', '0.00'),
(1484, '120200728194758', 48, 48, 10, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1485, '120200728194758', NULL, 3, 250, NULL, 'Quitar actualizaciones forzosas de windows', '0.00', '0.00', '0.00', '0.00'),
(1486, '120200728194758', NULL, 2, 580, NULL, 'Actualizar sistemas a ultima version a detalle.', '0.00', '0.00', '0.00', '0.00'),
(1488, '3720200729184341', 19, 1, 23, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1489, '120200730084615', NULL, 1, 580, NULL, 'Configuracion de red', '0.00', '0.00', '0.00', '0.00'),
(1490, '120200730084615', NULL, 1, -280, NULL, 'Ajuste por acuerdo', '0.00', '0.00', '0.00', '0.00'),
(1492, '120200720134513', NULL, 1, 28, NULL, 'Penalizacion 10 %, 30 de julio 2020', '0.00', '0.00', '0.00', '0.00'),
(1494, '120200701161718', NULL, 1, 77.72, NULL, 'Penalizacion 10 %, 30 de julio 2020', '0.00', '0.00', '0.00', '0.00'),
(1496, '120200801161527', 48, 24, 10, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1508, '120200804181332', NULL, 1, 250, NULL, 'INSTALACION Y CONFIGURACION DE IMPRESORAS', '0.00', '0.00', '0.00', '0.00'),
(1509, '3820200805135135', 57, 1, 150, 18, NULL, '0.00', '0.00', '0.00', '0.00'),
(1510, '120200805200705', 58, 1, 290, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1512, '3720200807140756', 56, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1514, '3720200807140756', 56, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1515, '120200807195248', 59, 1, 55, 24, NULL, '0.00', '0.00', '0.00', '0.00'),
(1518, '120200809164733', 48, 45, 12, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1519, '3720200810132134', NULL, 1, 55, NULL, 'CABLE DE IMPRESORA', '0.00', '0.00', '0.00', '0.00'),
(1520, '120200810173138', 56, 1, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1521, '120200810173138', 44, 1, 270, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1528, '120200811194742', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1529, '120200811194742', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1531, '120200811194742', 4, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1532, '120200811194742', 47, 1, 2800, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1533, '120200811194742', NULL, 3, 199, NULL, 'Envios', '0.00', '0.00', '0.00', '0.00'),
(1537, '3720200813173619', 19, 1, 23, 1, NULL, '0.00', '0.00', '0.00', '0.00'),
(1540, '120200814100403', NULL, 1, 580, NULL, 'Instalacion y clonado de disco duro', '0.00', '0.00', '0.00', '0.00'),
(1541, '120200814100403', NULL, 1, 450, NULL, 'Limpieza y mantenimiento fisico de equipo de computo', '0.00', '0.00', '0.00', '0.00'),
(1545, '3720200814132125', 57, 1, 150, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1546, '120200815121621', 49, 3, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1547, '3720200815155227', 56, 1, 120, 21, NULL, '0.00', '0.00', '0.00', '0.00'),
(1552, '120200817170823', NULL, 1, 464, NULL, 'Servicios ', '0.00', '0.00', '0.00', '0.00'),
(1553, '120200817174845', NULL, 1, 75, NULL, 'Cargador de viaje tipo c', '0.00', '0.00', '0.00', '0.00'),
(1554, '120200818205714', 5, 1, 1999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1555, '120200820200136', 63, 1, 0, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1556, '120200814100403', NULL, 1, 2800, NULL, 'Hdd 2 tb', '0.00', '0.00', '0.00', '0.00'),
(1557, '120200822133029', 49, 3, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1559, '120200822133029', 66, 1, 30, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1560, '120200822135458', 49, 8, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1561, '120200822142007', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1562, '120200822142007', NULL, 1, 800, NULL, 'Configuracion de red Servidor', '0.00', '0.00', '0.00', '0.00'),
(1563, '120200822142007', NULL, 1, 150, NULL, 'Configuracion de Pc red Cliente', '0.00', '0.00', '0.00', '0.00'),
(1564, '3820200823132654', 54, 1, 120, 20, NULL, '0.00', '0.00', '0.00', '0.00'),
(1565, '3820200823132654', NULL, 1, 50, NULL, 'cargador power caja roja', '0.00', '0.00', '0.00', '0.00'),
(1566, '120200823142507', 56, 1, 0, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1574, '120200825181518', NULL, 1, 350, NULL, 'Configuracion de impresora', '0.00', '0.00', '0.00', '0.00'),
(1575, '3720200826165838', 16, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1576, '3720200826165838', 16, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1583, '3820200827143801', 56, 1, 120, 21, NULL, '0.00', '0.00', '0.00', '0.00'),
(1584, '3820200828105339', 19, 1, 23, 1, NULL, '0.00', '0.00', '0.00', '0.00'),
(1585, '120200829131920', 66, 3, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1586, '120200829131920', 49, 4, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1587, '120200829131920', NULL, 1, 45, NULL, 'Constancia sat Mayoreo PRECIO ANTERIOR', '0.00', '0.00', '0.00', '0.00'),
(1588, '120200830133556', 63, 1, 220, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1589, '120200831162442', NULL, 13, 0.6, NULL, 'Imp. BN Mayoreo', '0.00', '0.00', '0.00', '0.00'),
(1590, '120200831162442', NULL, 26, 0.6, NULL, 'Imp. Bn Mayoreo ', '0.00', '0.00', '0.00', '0.00'),
(1591, '120200831162442', NULL, 60, 0.6, NULL, 'Imp Bn Mayoreo', '0.00', '0.00', '0.00', '0.00'),
(1592, '3720200901111756', 54, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1593, '120200901175435', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1594, '120200901175435', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1595, '120200901175435', 4, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1602, '120200903174256', NULL, 1, 60, NULL, 'imp. color Premium', '0.00', '0.00', '0.00', '0.00'),
(1603, '3720200904132133', 57, 1, 150, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1604, '3720200904132302', 57, 1, 150, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1605, '3820200904143441', 57, 1, 150, 18, NULL, '0.00', '0.00', '0.00', '0.00'),
(1606, '3720200904145258', 54, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1618, '120200905154855', 49, 5, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1619, '120200905154855', 66, 2, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1620, '120200905104822', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1625, '120200701161718', NULL, 1, 85.81, NULL, 'Penalizacion 10 %, 30 de agosto 2020', '0.00', '0.00', '0.00', '0.00'),
(1627, '120200907121651', NULL, 1, 580, NULL, 'Recuperacion de sistema', '0.00', '0.00', '0.00', '0.00'),
(1630, '120200907173049', 48, 28, 12, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1631, '3820200908161356', NULL, 1, 120, NULL, 'memoria usb con adaptador integrado', '0.00', '0.00', '0.00', '0.00'),
(1632, '3820200909145736', 62, 1, 150, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1633, '3720200909145946', 55, 1, 150, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1634, '120200909213745', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1639, '120200910113931', NULL, 10, 6, NULL, 'Imp. Color ', '0.00', '0.00', '0.00', '0.00'),
(1640, '3720200910154114', 57, 1, 150, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1641, '120200911125555', NULL, 1, 580, NULL, 'ACTUALIZACION DE SISTEMAS', '0.00', '0.00', '0.00', '0.00'),
(1642, '3820200913103959', 55, 1, 150, 19, NULL, '0.00', '0.00', '0.00', '0.00'),
(1643, '120200913115621', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1644, '120200913115621', 66, 2, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1645, '120200913115636', 49, 4, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1648, '120200914122030', NULL, 1, 180, NULL, 'ERROR EN CONFIGURACION DE SISTEMA', '0.00', '0.00', '0.00', '0.00'),
(1650, '120200914182517', 64, 2, 230, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1651, '120200914212125', NULL, 1, 2500, NULL, 'Carrito de compras ', '0.00', '0.00', '0.00', '0.00'),
(1652, '120200914212125', NULL, 1, 1900, NULL, 'Pagos ', '0.00', '0.00', '0.00', '0.00'),
(1653, '120200914212125', NULL, 1, 2800, NULL, 'Administración ', '0.00', '0.00', '0.00', '0.00'),
(1654, '120200914212125', NULL, 1, 1900, NULL, 'Pedido/ventas ', '0.00', '0.00', '0.00', '0.00'),
(1655, '120200914212125', NULL, 1, 2500, NULL, 'Envíos', '0.00', '0.00', '0.00', '0.00'),
(1656, '120200914212125', NULL, 1, 2800, NULL, 'Estructura, usuario, módulos básicos. ', '0.00', '0.00', '0.00', '0.00'),
(1657, '3820200916113452', NULL, 1, 120, NULL, 'memoria usb con adaptador integrado', '0.00', '0.00', '0.00', '0.00'),
(1663, '120200918191937', NULL, 1, 180, NULL, 'ERROR EN CONFIGURACION DE SISTEMA', '0.00', '0.00', '0.00', '0.00'),
(1665, '120200919124057', NULL, 1, 680, NULL, 'REINSTALACION DE SISTEMA CON RESPALDO', '0.00', '0.00', '0.00', '0.00'),
(1666, '120200921151954', 66, 4, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1667, '120200921151954', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1668, '120200921192728', 62, 1, 150, 27, NULL, '0.00', '0.00', '0.00', '0.00'),
(1669, '3820200922145927', 56, 1, 120, 21, NULL, '0.00', '0.00', '0.00', '0.00'),
(1670, '120200924144004', 48, 30, 12, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1672, '120200925232641', 66, 2, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1673, '120200925232824', 49, 4, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1674, '120200926130636', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1680, '120200928102847', NULL, 1, 1900, NULL, 'Anualidad CFDI', '0.00', '0.00', '0.00', '0.00'),
(1688, '120200701161718', NULL, 1, 94.38, NULL, ' Penalizacion 10 %, 30 de septiembre 2020 ', '0.00', '0.00', '0.00', '0.00'),
(1693, '120201002122249', NULL, 1, 150, NULL, 'Reactivacion de licencia', '0.00', '0.00', '0.00', '0.00'),
(1694, '120201004102140', 66, 2, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1695, '120201004102140', 49, 5, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1696, '120201007105346', 48, 27, 12, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1697, '120201007105346', NULL, 1, 250, NULL, 'Desactivacion de actualizaciones automaticas de windows', '0.00', '0.00', '0.00', '0.00'),
(1698, '3720201008141609', 54, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1699, '120201008143527', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1700, '120201010124929', NULL, 1, 800, NULL, 'Configuracion de servidor para trabajo en red', '0.00', '0.00', '0.00', '0.00'),
(1701, '120201010124929', NULL, 1, 150, NULL, 'Equipo adicional, Misma red', '0.00', '0.00', '0.00', '0.00'),
(1702, '120201010124929', NULL, 1, 0, NULL, 'Migrar Sistema de un equipo a otro.', '0.00', '0.00', '0.00', '0.00'),
(1703, '120201010141626', NULL, 1, 300, NULL, 'Asistencia tecnica', '0.00', '0.00', '0.00', '0.00'),
(1705, '120201010185030', NULL, 1, 250, NULL, 'Instalacion office', '0.00', '0.00', '0.00', '0.00'),
(1706, '120201010195300', 66, 3, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1707, '120201010195711', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1710, '3720201011135040', 38, 2, 23, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1711, '120201012143843', NULL, 1, 440.8, NULL, 'Regla no poder agregar abonos mayores al adeudo', '0.00', '0.00', '0.00', '0.00'),
(1712, '120201012143843', NULL, 1, 348, NULL, 'Fondo gris con letras blancas en encabezados de reportes', '0.00', '0.00', '0.00', '0.00'),
(1713, '120201012143843', NULL, 1, 2088, NULL, 'Módulo de pedido por cliente mostrando adeudo.', '0.00', '0.00', '0.00', '0.00'),
(1720, '3820201012195206', 55, 1, 150, 19, NULL, '0.00', '0.00', '0.00', '0.00'),
(1724, '120201013113045', NULL, 1, 3500, NULL, 'anticipo 50 % Sistema inmobiliaria web de acuerdo a requisitos acordados. ', '0.00', '0.00', '0.00', '0.00'),
(1725, '120201015104323', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1726, '120201015104323', NULL, 1, 800, NULL, 'Lector RFID', '0.00', '0.00', '0.00', '0.00'),
(1727, '120201015104323', NULL, 20, 19, NULL, 'Tarjetas RFID pvc', '0.00', '0.00', '0.00', '0.00'),
(1728, '120201015145152', 4, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1729, '120201015182735', 5, 2, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1736, '120201016110556', 48, 25, 12, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1737, '120201016133426', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1738, '120201017200447', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1739, '120201017200447', 66, 2, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1740, '120201017200755', 49, 9, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1741, '3720201019162903', 56, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1743, '120201022091818', 3, 1, 5413, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1744, '3720201022125932', 38, 1, 23, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1745, '3720201022155434', 51, 1, 85, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1746, '120201026125807', 66, 7, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1747, '120201026125807', 49, 3, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1748, '3720201027131615', 56, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1750, '120201030202430', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1751, '120201031123410', 55, 1, 150, 19, NULL, '0.00', '0.00', '0.00', '0.00'),
(1752, '120201031205458', NULL, 1, 1900, NULL, 'Anualidad CFDI', '0.00', '0.00', '0.00', '0.00'),
(1753, '120201031205521', NULL, 1, 1800, NULL, 'Anualidad CFDI', '0.00', '0.00', '0.00', '0.00'),
(1755, '120201103120906', 66, 3, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1756, '120201103121133', 49, 9, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1757, '3820201104095250', 56, 1, 120, 21, NULL, '0.00', '0.00', '0.00', '0.00'),
(1774, '120201106131911', NULL, 1, 800, NULL, 'Lector rfid', '0.00', '0.00', '0.00', '0.00'),
(1775, '120201106131911', NULL, 50, 17, NULL, 'Tarjetas rfid', '0.00', '0.00', '0.00', '0.00'),
(1776, '120201106131911', NULL, 50, 28, NULL, 'Llaveros rfid', '0.00', '0.00', '0.00', '0.00'),
(1777, '120201106131911', NULL, 1, 200, NULL, 'Envío Dhl ', '0.00', '0.00', '0.00', '0.00'),
(1783, '120201109195210', 66, 3, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1784, '120201109195210', 49, 3, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1798, '120201112183932', NULL, 1, 580, NULL, 'Migracion de sistema hotelero ', '0.00', '0.00', '0.00', '0.00'),
(1799, '3720201113150757', 62, 1, 150, 27, NULL, '0.00', '0.00', '0.00', '0.00'),
(1800, '120201113215420', NULL, 1, 3500, NULL, 'Liquidacion 50 % Pendientes Sistema inmobiliaria web de acuerdo a requisitos acordados folio anterior: 120201013113045', '0.00', '0.00', '0.00', '0.00'),
(1801, '120201114111404', NULL, 40, 5, NULL, 'Impresiones Color ', '0.00', '0.00', '0.00', '0.00'),
(1802, '120201114212243', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1803, '120201114212243', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1804, '120201114212243', NULL, 1, 900, NULL, 'Lector de barras ', '0.00', '0.00', '0.00', '0.00'),
(1805, '120201114212243', NULL, 2, 199, NULL, 'Envíos ', '0.00', '0.00', '0.00', '0.00'),
(1806, '3720201115175101', 64, 2, 20, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1837, '120201116111144', 66, 3, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1838, '120201116111144', 49, 1, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1839, '120201116111144', 67, 3, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1845, '120201123124946', 67, 3, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1846, '120201123124946', 66, 1, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1847, '120201123124946', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1848, '120201123133155', 67, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1849, '120201123133155', 49, 4, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1850, '3820201123202434', 56, 1, 120, 21, NULL, '0.00', '0.00', '0.00', '0.00'),
(1851, '120201124115412', NULL, 23, 8, NULL, 'Impresion Color', '0.00', '0.00', '0.00', '0.00'),
(1852, '3720201124141110', 55, 1, 150, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1853, '120201124161743', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1854, '120201124193245', NULL, 1, 0, NULL, 'Licencia Ctrl Socios: 0001237', '0.00', '0.00', '0.00', '0.00'),
(1855, '120201124193540', NULL, 1, 280, NULL, 'Configuracion de impresora', '0.00', '0.00', '0.00', '0.00'),
(1873, '120201126114507', NULL, 1, 580, NULL, 'Migración de sistema hotelero. ', '0.00', '0.00', '0.00', '0.00'),
(1874, '120201126195821', NULL, 1, 200, NULL, 'LIMPIEZA DE VIRUS Y AMENAZAS DIGITALES', '0.00', '0.00', '0.00', '0.00'),
(1875, '120201126195821', NULL, 1, 150, NULL, 'OPTIMIZACION DE SISTEMA OPERATIVO', '0.00', '0.00', '0.00', '0.00'),
(1878, '120201130103253', 67, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1879, '120201130103253', 66, 1, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1880, '120201130103253', 49, 3, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00');
INSERT INTO `product_venta` (`id`, `folio_venta`, `product`, `unidades`, `precio`, `product_sub`, `p_generico`, `ancho`, `alto`, `largo`, `peso`) VALUES
(1882, '120201130104126', NULL, 1, 180, NULL, 'ERROR EN CONFIGURACION DE SISTEMA', '0.00', '0.00', '0.00', '0.00'),
(1883, '3720201130153725', 54, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1884, '3720201130153725', 64, 1, 20, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1885, '120201130174720', NULL, 1, 500, NULL, 'Reestablecimiento Tabla de usuarios ', '0.00', '0.00', '0.00', '0.00'),
(1886, '120201202115054', NULL, 24, 8, NULL, 'Impresiones Color', '0.00', '0.00', '0.00', '0.00'),
(1891, '120201207192738', 67, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1892, '120201207192738', 66, 1, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1893, '3720201210161402', 56, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1894, '120201210161510', NULL, 165, 3, NULL, 'Impresiones Color', '0.00', '0.00', '0.00', '0.00'),
(1896, '3720201213120944', 56, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1897, '3720201213122816', 56, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1898, '120201213130813', NULL, 1, 672.8, NULL, 'Migración sistema hotelero ', '0.00', '0.00', '0.00', '0.00'),
(1899, '120201214105839', NULL, 1, 696, NULL, 'Servicio técnico ', '0.00', '0.00', '0.00', '0.00'),
(1900, '120201214162711', NULL, 9, 9, NULL, 'Imp.  Color ', '0.00', '0.00', '0.00', '0.00'),
(1902, '120201214212912', NULL, 1, 8628.95, NULL, 'Sistema Desayunos Escuela de acuerdo a archivo excel', '0.00', '0.00', '0.00', '0.00'),
(1903, '120201214212912', NULL, 1, 0, NULL, '1 año servidor y dominio http', '0.00', '0.00', '0.00', '0.00'),
(1904, '120201214212912', NULL, 1, 0, NULL, 'Tiempo de desarrollo 70 dias habiles', '0.00', '0.00', '0.00', '0.00'),
(1905, '120201215104322', 66, 4, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1906, '120201215104322', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1907, '120201215111551', 49, 4, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1908, '120201215111551', 67, 2, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1909, '120201215111551', 66, 2, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1910, '3720201216151452', 55, 1, 150, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1915, '120201217155518', NULL, 1, 580, NULL, 'Reinstalacion sistema hotelero lic: 120201217153457', '0.00', '0.00', '0.00', '0.00'),
(1916, '120201218105500', NULL, 7, 8, NULL, 'imp Color ', '0.00', '0.00', '0.00', '0.00'),
(1917, '120201218141329', NULL, 1, 735, NULL, 'Asistencia  tecnica', '0.00', '0.00', '0.00', '0.00'),
(1918, '120201220161404', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1919, '3720201221133642', 56, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1920, '3820201223131529', 56, 1, 120, 21, NULL, '0.00', '0.00', '0.00', '0.00'),
(1922, '3820201227192928', 54, 1, 120, 20, NULL, '0.00', '0.00', '0.00', '0.00'),
(1923, '3820201228115158', 56, 1, 120, 21, NULL, '0.00', '0.00', '0.00', '0.00'),
(1924, '120201228170127', 3, 1, 3500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1925, '120201230172435', 67, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1926, '120201230172435', 66, 1, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1927, '120201230172435', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1928, '120201230172644', 67, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1929, '120201230172644', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1930, '120210102172906', 48, 26, 12, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1931, '120191215121646', NULL, 3, 499, NULL, 'Camara Bullet 2021 exterior', '0.00', '0.00', '0.00', '0.00'),
(1934, '120210110121141', NULL, 200, 0.6, NULL, 'Impresiones BN', '0.00', '0.00', '0.00', '0.00'),
(1935, '120210110121141', NULL, 1, 20, NULL, 'LLAVERO DE SUPERHEROE', '0.00', '0.00', '0.00', '0.00'),
(1936, '3720210111181259', 14, 1, 45, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1937, '120210112200725', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1938, '120210112200725', 66, 5, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1939, '120210112201025', 67, 3, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1941, '120210112201025', 49, 10, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1942, '120210113105038', NULL, 1, 1900, NULL, 'Anualidad CFDI , CABB891111CL8', '0.00', '0.00', '0.00', '0.00'),
(1943, '120210114201904', NULL, 2, 500, NULL, 'Ractivacion licencia ', '0.00', '0.00', '0.00', '0.00'),
(1944, '120210118203518', NULL, 1, 928, NULL, 'Servicio Tecnico', '0.00', '0.00', '0.00', '0.00'),
(1947, '120210120204658', 49, 3, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1948, '120210120204658', 67, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1949, '120210120204658', 66, 2, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1950, '120210121150755', NULL, 1, 1000, NULL, 'Ajuste máquina adicional', '0.00', '0.00', '0.00', '0.00'),
(1951, '120210121150755', NULL, 1, 1900, NULL, 'Lector De Huella', '0.00', '0.00', '0.00', '0.00'),
(1952, '120210122101032', NULL, 1, 12500, NULL, 'Ajustes a medida alparied', '0.00', '0.00', '0.00', '0.00'),
(1957, '120210128145640', 67, 2, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1958, '120210129143418', NULL, 1, 75, NULL, 'Alta NUevo RFC', '0.00', '0.00', '0.00', '0.00'),
(1959, '120210129143418', NULL, 1, 150, NULL, 'COnstancia de situacion fiscal', '0.00', '0.00', '0.00', '0.00'),
(1960, '120210129143418', NULL, 1, 200, NULL, 'Soporte tecnico', '0.00', '0.00', '0.00', '0.00'),
(1961, '120200919124057', NULL, 1, 272, NULL, 'Recargos ', '0.00', '0.00', '0.00', '0.00'),
(1962, '120210203135257', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1963, '120210204102701', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1964, '120210204102701', 66, 6, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1965, '120210204141716', NULL, 1, 4000, NULL, 'Control De Socios con promoción', '0.00', '0.00', '0.00', '0.00'),
(1979, '120210206153434', NULL, 396, 1, NULL, 'Impresiones a color varios ', '0.00', '0.00', '0.00', '0.00'),
(1980, '120210206153434', NULL, 1, 4, NULL, 'Carpeta tamaño carta ', '0.00', '0.00', '0.00', '0.00'),
(1983, '120210208212753', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1984, '120210122101032', NULL, 1, 3000, NULL, 'Calendario', '0.00', '0.00', '0.00', '0.00'),
(1985, '120210209124912', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1986, '120210209124912', NULL, 1, 1900, NULL, 'Lector de huellas ', '0.00', '0.00', '0.00', '0.00'),
(1987, '120210209124912', NULL, 1, 600, NULL, 'Lector de barras usb ', '0.00', '0.00', '0.00', '0.00'),
(1988, '120210209190449', NULL, 1, 400, NULL, 'Asistencia tecnica', '0.00', '0.00', '0.00', '0.00'),
(1989, '120210210085514', 66, 5, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1990, '120210210085514', 67, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1991, '120210210085514', 49, 6, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1992, '120210211125522', NULL, 1, 6699, NULL, 'Sistema web de Renta + anualidad servidor ', '0.00', '0.00', '0.00', '0.00'),
(1994, '120210212001457', NULL, 2, 3500, NULL, 'Sistema control de socios precio especial ', '0.00', '0.00', '0.00', '0.00'),
(1996, '120210211173109', NULL, 1, 928, NULL, 'Reactivacion lic sistema hotelero', '0.00', '0.00', '0.00', '0.00'),
(1997, '120210212183901', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1998, '120210212183901', NULL, 1, 0, NULL, 'Lions GYMs', '0.00', '0.00', '0.00', '0.00'),
(2000, '120210213124613', 2, 1, 5220, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2001, '120210213124613', NULL, 1, 1900, NULL, 'Anualidad cfdi Timbredo ilimitado', '0.00', '0.00', '0.00', '0.00'),
(2002, '120210213181913', 3, 1, 5146, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2003, '120210213181913', 5, 1, 2500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2004, '120210213181913', NULL, 1, 2100, NULL, 'Relevador Puerta', '0.00', '0.00', '0.00', '0.00'),
(2005, '120210217173310', 66, 4, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2006, '120210217173310', 49, 4, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2007, '120210220161814', 67, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2008, '120210220161814', 66, 2, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2009, '120210220161814', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2010, '120210221100529', 67, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2011, '120210221100529', 49, 1, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2012, '120210222143248', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2013, '120210222143248', NULL, 1, 1900, NULL, 'Anualidad Cfdi ', '0.00', '0.00', '0.00', '0.00'),
(2014, '120210225222925', NULL, 1, 3500, NULL, 'Sistema Restaurant ', '0.00', '0.00', '0.00', '0.00'),
(2017, '120210228140830', 66, 6, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2018, '120210228230409', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2019, '120210228230409', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2020, '120210228230409', NULL, 1, 1900, NULL, 'Relevados', '0.00', '0.00', '0.00', '0.00'),
(2021, '120210228230409', 28, 1, 2870, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2022, '120210228230409', NULL, 1, 250, NULL, 'Envio', '0.00', '0.00', '0.00', '0.00'),
(2026, '120210301111332', NULL, 1, 1856, NULL, 'Anualidad Hosting', '0.00', '0.00', '0.00', '0.00'),
(2029, '120210304113830', 3, 1, 5858.22, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2030, '120210304151442', NULL, 1, 800, NULL, 'Reactivacion licencia. ', '0.00', '0.00', '0.00', '0.00'),
(2034, '120210315175223', 3, 1, 5344, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2035, '120200708154251', NULL, 1, 311.37, NULL, 'Asistencia tecnica', '0.00', '0.00', '0.00', '0.00'),
(2036, '120210317120354', NULL, 1, 14900, NULL, 'Replica sistema hotelero version web . ', '0.00', '0.00', '0.00', '0.00'),
(2037, '120210317120354', NULL, 1, 2000, NULL, 'Servidor anual. ', '0.00', '0.00', '0.00', '0.00'),
(2039, '120210317120601', NULL, 1, 0, NULL, 'Tiempo de desarrollo. 70 dias habiles. ', '0.00', '0.00', '0.00', '0.00'),
(2040, '120210317120354', NULL, 1, 0, NULL, 'Tiempo de desarrollo. 70 dias habiles. ', '0.00', '0.00', '0.00', '0.00'),
(2041, '120210317120601', NULL, 1, 2900, NULL, 'Modulo Adicional PTV para clientes', '0.00', '0.00', '0.00', '0.00'),
(2042, '120210317120601', NULL, 1, 9800, NULL, 'REESCRIBIR SISTEMA HOTELERO CON FUNCIONES DE RED.<b> SISTEMA LOCAL</b>', '0.00', '0.00', '0.00', '0.00'),
(2043, '120210317143927', 3, 2, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2044, '120210317143927', NULL, 2, 2000, NULL, 'Equipos adicionales', '0.00', '0.00', '0.00', '0.00'),
(2045, '120210317200843', 2, 1, 0, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2046, '120210318000551', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2047, '120210319144928', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2049, '120210324133229', NULL, 1, 5220, NULL, 'Sistema hotelero 46 habitaciones', '0.00', '0.00', '0.00', '0.00'),
(2050, '120210324183533', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2051, '120210324183533', 5, 1, 2000, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2052, '120210324183533', 28, 1, 2980, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2053, '120210324183533', NULL, 1, 800, NULL, 'Configuracion de servidor ', '0.00', '0.00', '0.00', '0.00'),
(2054, '120210324183533', NULL, 2, 800, NULL, 'Configuracion de Computadora adicional', '0.00', '0.00', '0.00', '0.00'),
(2055, '120210330151444', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2059, '120210330180545', NULL, 1, 4500, NULL, 'Sistema hotelero', '0.00', '0.00', '0.00', '0.00'),
(2060, '120210410103800', NULL, 1, 104, NULL, 'Varios imp Color ', '0.00', '0.00', '0.00', '0.00'),
(2080, '120210427191553', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2081, '120210428141755', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2082, '120210301111332', NULL, 1, 672.8, NULL, 'Desbloqueo de dominio 24 hrs', '0.00', '0.00', '0.00', '0.00'),
(2083, '120210430152931', NULL, 1, 1900, NULL, 'Anualidad CFDI', '0.00', '0.00', '0.00', '0.00'),
(2088, '120210506223451', NULL, 1, 1900, NULL, '	CFDI ANUALIDAD GAGJ8209199N7', '0.00', '0.00', '0.00', '0.00'),
(2089, '120210507134841', NULL, 1, 9900, NULL, 'Actualización de sistema hotelero a versión web ', '0.00', '0.00', '0.00', '0.00'),
(2090, '120210507134841', NULL, 1, 0, NULL, 'Desarrollo en 40 días hábiles.  ', '0.00', '0.00', '0.00', '0.00'),
(2093, '120210511185049', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2094, '120210512124938', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2095, '120210512124938', NULL, 1, 0, NULL, 'Configuracion Para equipos adicionales $ 1000', '0.00', '0.00', '0.00', '0.00'),
(2096, '120210512124938', NULL, 1, 0, NULL, '1 Equipo adicional $ 500', '0.00', '0.00', '0.00', '0.00'),
(2103, '120210517111226', NULL, 1, 1900, NULL, 'anualidad rfc GIA100728216 , GIC040830321', '0.00', '0.00', '0.00', '0.00'),
(2109, '120210528134116', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2114, '120210605115505', 66, 3, 110, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2115, '120210605115505', 49, 2, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2116, '120210606122815', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2117, '120210607174051', 2, 1, 4500, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2119, '120210608110052', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2120, '120210608110052', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2121, '120210608110204', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2122, '120210608110204', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2123, '120210608110204', NULL, 1, 1180, NULL, 'Impresora Termica', '0.00', '0.00', '0.00', '0.00'),
(2124, '120210608110440', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2125, '120210608110440', 5, 1, 1900, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2126, '120210608110440', 28, 1, 2870, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2127, '120210608140928', NULL, 1, 580, NULL, 'Reinstalacion sistema Hotelero', '0.00', '0.00', '0.00', '0.00'),
(2128, '120210608173324', 3, 1, 4999, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2129, '120210611180546', NULL, 108, 5, NULL, 'Escaneos', '0.00', '0.00', '0.00', '0.00'),
(2130, '120210611182235', NULL, 1, 147, NULL, 'Impresiones color varios', '0.00', '0.00', '0.00', '0.00'),
(2131, '120210612164732', NULL, 10, 8, NULL, 'Impresiones color', '0.00', '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prospecto_acciones`
--

CREATE TABLE `prospecto_acciones` (
  `id` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `propuesta` varchar(300) NOT NULL,
  `accion` varchar(300) NOT NULL,
  `realizada` tinyint(1) NOT NULL DEFAULT 0,
  `interesados` tinyint(1) NOT NULL DEFAULT 0,
  `fecha` datetime NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soporte`
--

CREATE TABLE `soporte` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(254) NOT NULL,
  `costo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `soporte`
--

INSERT INTO `soporte` (`id`, `descripcion`, `costo`) VALUES
(1, 'REINSTALACION SISTEMA SIN RESPALDO', 150),
(2, 'REINSTALACION DE SISTEMA CON RESPALDO', 400),
(3, 'CONFIGURACION DE WINDOWS PARA TRABAJO EN RED', 400),
(4, 'AGREGAR COMPUTADORA ADICIONAL', 100),
(5, 'INSTALACION Y CONFIGURACION DE IMPRESORAS', 150),
(6, 'RECUPERACION DE CONTRASEÑA', 350),
(7, 'ERROR EN CONFIGURACION DE SISTEMA', 180),
(8, 'ERROR EN CONFIGURACION DE SISTEMA OPERATIVO', 220),
(9, 'OPTIMIZACION DE SISTEMA OPERATIVO', 250),
(10, 'LIMPIEZA DE VIRUS Y AMENAZAS DIGITALES', 201),
(11, 'ACTUALIZACION DE SISTEMAS', 580);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `direccion` varchar(254) NOT NULL,
  `telefono` varchar(254) NOT NULL,
  `cfdi_serie` varchar(254) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `nombre`, `direccion`, `telefono`, `cfdi_serie`) VALUES
(1, 'CLTA | PABLO L. SIDAR', 'VEINTE DE NOVIEMBRE.NO.324, COL. BARRIO DE LAS FLORES, VERACRUZ, MEX 96980, TEL: + 52 923 120 05 05', '+52 55 4163 0891', 'A'),
(9, 'CLTA | BENITO JUAREZ', 'PARQUE JUAREZ NO. 9, COL. CENTRO, VERACRUZ, MEXICO 96980, TEL: + 52 923 120 05 05', '+52 55 4163 0891', 'C'),
(10, 'CLTA | CENTRAL 101', 'AV. 20 DE NOVIEMBRE 306, CTRO LAS CHOAPAS VER.', '+52 55 4163 0891', 'B'),
(11, 'CLTA | A. M. QUIRAZCO ', 'ANTONIO M QUIRAZCO ', '+52 55 4163 0891', 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_almacen`
--

CREATE TABLE `sucursal_almacen` (
  `id` int(11) NOT NULL,
  `sucursal` int(11) NOT NULL,
  `almacen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal_almacen`
--

INSERT INTO `sucursal_almacen` (`id`, `sucursal`, `almacen`) VALUES
(5, 9, 2),
(6, 1, 1),
(7, 10, 2),
(8, 10, 1),
(9, 10, 3),
(10, 11, 4),
(11, 10, 4),
(12, 11, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traspasos`
--

CREATE TABLE `traspasos` (
  `folio` varchar(254) NOT NULL,
  `fecha` datetime NOT NULL,
  `user` int(11) NOT NULL,
  `open` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `traspasos`
--

INSERT INTO `traspasos` (`folio`, `fecha`, `user`, `open`) VALUES
('20210614213904', '2021-06-14 21:39:04', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(254) NOT NULL,
  `password` varchar(254) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `imagen` varchar(254) NOT NULL,
  `product_add` tinyint(1) NOT NULL DEFAULT 0,
  `product_gest` tinyint(1) NOT NULL DEFAULT 0,
  `gen_orden_compra` tinyint(1) NOT NULL DEFAULT 0,
  `client_add` tinyint(1) NOT NULL DEFAULT 0,
  `client_guest` tinyint(1) NOT NULL DEFAULT 0,
  `almacen_add` tinyint(1) NOT NULL DEFAULT 0,
  `almacen_guest` tinyint(1) NOT NULL DEFAULT 0,
  `depa_add` tinyint(1) NOT NULL DEFAULT 0,
  `depa_guest` tinyint(1) NOT NULL DEFAULT 0,
  `propiedades` tinyint(1) NOT NULL DEFAULT 0,
  `usuarios` tinyint(1) NOT NULL DEFAULT 0,
  `finanzas` tinyint(1) NOT NULL DEFAULT 0,
  `descripcion` longtext NOT NULL,
  `sucursal` int(11) NOT NULL,
  `change_suc` tinyint(1) NOT NULL,
  `sucursal_gest` tinyint(1) NOT NULL DEFAULT 0,
  `caja` tinyint(1) NOT NULL DEFAULT 0,
  `super_pedidos` tinyint(1) NOT NULL DEFAULT 0,
  `comision` int(11) DEFAULT 5,
  `sueldo` float NOT NULL DEFAULT 0,
  `vtd_pg` tinyint(1) NOT NULL DEFAULT 0,
  `full_graficas` tinyint(1) NOT NULL DEFAULT 0,
  `traspasos` tinyint(1) NOT NULL DEFAULT 0,
  `facturar` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nombre`, `imagen`, `product_add`, `product_gest`, `gen_orden_compra`, `client_add`, `client_guest`, `almacen_add`, `almacen_guest`, `depa_add`, `depa_guest`, `propiedades`, `usuarios`, `finanzas`, `descripcion`, `sucursal`, `change_suc`, `sucursal_gest`, `caja`, `super_pedidos`, `comision`, `sueldo`, `vtd_pg`, `full_graficas`, `traspasos`, `facturar`) VALUES
(1, 'root', '6990149e5865432c7061b4b1376b7283', 'ISC. FRANCISCO E. ASCENCIO DOMINGUEZ', 'users/usuario20200624223146.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'CEO', 10, 1, 1, 1, 1, 5, 1800, 1, 1, 1, 1),
(37, 'joselin', '102a23a0e4661368943dacb516a18cc8', 'Joseline', 'users/usuario20190820112539.jpg', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 9, 0, 0, 0, 0, 5, 1800, 0, 0, 0, 0),
(38, 'lady', '1729bc477f7b098b508c1e99269c74a1', 'LADY CESIA OSORIO', 'users/usuario20190901112206.jpg', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 9, 0, 0, 0, 1, 5, 1500, 0, 0, 0, 0),
(41, 'patricia', '823fec7a2632ea7b498c1d0d11c11377', 'Patricia', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Patricia', 9, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0),
(42, 'natali', '716c153621f76922708404b68c339701', 'natali', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Natali', 9, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `annuities`
--
ALTER TABLE `annuities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `annuity_client` (`client`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_user` (`user`);

--
-- Indices de la tabla `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `factura` (`factura`),
  ADD KEY `credit_client` (`client`),
  ADD KEY `credit_sucursal` (`sucursal`);

--
-- Indices de la tabla `credit_pay`
--
ALTER TABLE `credit_pay`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credit` (`credito`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `e_ventas`
--
ALTER TABLE `e_ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `cliente_cliente` (`cliente`);

--
-- Indices de la tabla `folio_venta`
--
ALTER TABLE `folio_venta`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `client_folio` (`client`),
  ADD KEY `vendedor_folio` (`vendedor`),
  ADD KEY `sale_sucursal` (`sucursal`),
  ADD KEY `estrategia_venta` (`estrategia`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_almacen` (`almacen`),
  ADD KEY `producto_departamento` (`departamento`);

--
-- Indices de la tabla `productos_sub`
--
ALTER TABLE `productos_sub`
  ADD PRIMARY KEY (`id`),
  ADD KEY `padre_hijo` (`padre`),
  ADD KEY `hijo_almacen` (`almacen`);

--
-- Indices de la tabla `product_pedido`
--
ALTER TABLE `product_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto` (`product`),
  ADD KEY `folio` (`folio_venta`);

--
-- Indices de la tabla `product_trasnfer`
--
ALTER TABLE `product_trasnfer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_venta`
--
ALTER TABLE `product_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folio_venta` (`folio_venta`),
  ADD KEY `sale_product` (`product`),
  ADD KEY `hijo` (`product_sub`);

--
-- Indices de la tabla `prospecto_acciones`
--
ALTER TABLE `prospecto_acciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accion_prospecto` (`cliente`),
  ADD KEY `accion_prospecto_user` (`user`);

--
-- Indices de la tabla `soporte`
--
ALTER TABLE `soporte`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sucursal_almacen`
--
ALTER TABLE `sucursal_almacen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sucursal` (`sucursal`),
  ADD KEY `almacen` (`almacen`);

--
-- Indices de la tabla `traspasos`
--
ALTER TABLE `traspasos`
  ADD PRIMARY KEY (`folio`),
  ADD UNIQUE KEY `folio` (`folio`),
  ADD KEY `tras_user` (`user`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendedor_sucursal` (`sucursal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `annuities`
--
ALTER TABLE `annuities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;

--
-- AUTO_INCREMENT de la tabla `credits`
--
ALTER TABLE `credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de la tabla `credit_pay`
--
ALTER TABLE `credit_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `e_ventas`
--
ALTER TABLE `e_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT de la tabla `productos_sub`
--
ALTER TABLE `productos_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `product_pedido`
--
ALTER TABLE `product_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `product_trasnfer`
--
ALTER TABLE `product_trasnfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `product_venta`
--
ALTER TABLE `product_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3393;

--
-- AUTO_INCREMENT de la tabla `prospecto_acciones`
--
ALTER TABLE `prospecto_acciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `soporte`
--
ALTER TABLE `soporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `sucursal_almacen`
--
ALTER TABLE `sucursal_almacen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `annuities`
--
ALTER TABLE `annuities`
  ADD CONSTRAINT `annuity_client` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clientes_user` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `credits`
--
ALTER TABLE `credits`
  ADD CONSTRAINT `credit_client` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_sucursal` FOREIGN KEY (`sucursal`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `credit_pay`
--
ALTER TABLE `credit_pay`
  ADD CONSTRAINT `credit` FOREIGN KEY (`credito`) REFERENCES `credits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `cliente_cliente` FOREIGN KEY (`cliente`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `folio_venta`
--
ALTER TABLE `folio_venta`
  ADD CONSTRAINT `client_folio` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estrategia_venta` FOREIGN KEY (`estrategia`) REFERENCES `e_ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_sucursal` FOREIGN KEY (`sucursal`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vendedor_folio` FOREIGN KEY (`vendedor`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `producto_almacen` FOREIGN KEY (`almacen`) REFERENCES `almacen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_departamento` FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_sub`
--
ALTER TABLE `productos_sub`
  ADD CONSTRAINT `hijo_almacen` FOREIGN KEY (`almacen`) REFERENCES `almacen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `padre_hijo` FOREIGN KEY (`padre`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `product_pedido`
--
ALTER TABLE `product_pedido`
  ADD CONSTRAINT `folio` FOREIGN KEY (`folio_venta`) REFERENCES `folio_venta` (`folio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto` FOREIGN KEY (`product`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `product_venta`
--
ALTER TABLE `product_venta`
  ADD CONSTRAINT `folio_venta` FOREIGN KEY (`folio_venta`) REFERENCES `folio_venta` (`folio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hijo` FOREIGN KEY (`product_sub`) REFERENCES `productos_sub` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_product` FOREIGN KEY (`product`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prospecto_acciones`
--
ALTER TABLE `prospecto_acciones`
  ADD CONSTRAINT `accion_prospecto` FOREIGN KEY (`cliente`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accion_prospecto_user` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sucursal_almacen`
--
ALTER TABLE `sucursal_almacen`
  ADD CONSTRAINT `almacen` FOREIGN KEY (`almacen`) REFERENCES `almacen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sucursal` FOREIGN KEY (`sucursal`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `traspasos`
--
ALTER TABLE `traspasos`
  ADD CONSTRAINT `tras_user` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `vendedor_sucursal` FOREIGN KEY (`sucursal`) REFERENCES `sucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
