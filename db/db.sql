-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-06-2020 a las 13:02:20
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(4, 210, 'Anualidad CFDI', 1800, '2018-11-01 12:00:00', '2019-11-01 09:38:02', 1),
(6, 212, 'Anualidad CFDI', 1900, '2019-03-29 12:00:00', '2019-03-29 12:00:00', 0),
(7, 213, 'Anualidad CFDI', 1900, '2019-04-17 12:00:00', '2020-05-13 10:40:01', 1),
(8, 214, 'Anualidad CFDI', 1700, '2019-05-30 12:00:00', '2019-05-30 12:00:00', 0),
(9, 215, 'Anualidad CFDI', 1900, '2019-09-01 12:00:00', '2019-09-01 12:00:00', 1),
(10, 199, 'Anualidad CFDI', 1900, '2019-10-30 14:37:47', '2019-10-30 14:37:47', 1),
(12, 154, 'Anualidad SendMAil', 100, '2019-11-14 09:45:02', '2019-11-14 09:45:02', 1),
(13, 277, 'Anualidad CFDI , CABB891111CL8', 1900, '2020-02-21 11:02:15', '2020-02-21 11:02:15', 1),
(14, 154, 'Anualidad SendMAil. fol 120200223223835', 100, '2020-02-24 14:11:01', '2020-02-24 14:11:01', 1),
(15, 282, 'moamao-tpv.com + certificado digital, anualidad. ', 1300, '2020-04-04 16:04:02', '2020-04-04 16:04:02', 1),
(16, 290, 'anualidad rfc GIA100728216 , GIC040830321', 1900, '2020-06-01 12:25:48', '2020-06-01 12:25:48', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `direccion` varchar(254) NOT NULL,
  `telefono` varchar(254) NOT NULL,
  `descuento` int(11) NOT NULL,
  `rfc` varchar(254) NOT NULL,
  `razon_social` varchar(254) NOT NULL,
  `correo` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `nombre`, `direccion`, `telefono`, `descuento`, `rfc`, `razon_social`, `correo`) VALUES
(1, 'PUBLICO EN GENERAL', 'Dirección de cliente demo ', '923120050', 0, 'XAXX010101000', 'PUBLICO EN GENERAL', 'ventas@cyberchoapas.com'),
(154, 'CARLOS CUEVAS', 'CORDILLERA HIMALAYA 3961  COLINAS DEL PONIENTE  QUERETARO, QRO', '+52 1 442 173 2721', 15, 'GYM081030CJ3', 'GYMSPORT SA DE CV', 'carlos.gymsport@gmail.com'),
(155, 'RICARDO ALONSO AVILA', '', '+52  1  55 2726 5055', 15, 'AOAR9110234A9', 'RICARDO ALONSO AVILA', 'rikrdometal@hotmail.com'),
(158, 'CBTIS 113', '', '9231056364', 0, '', '', 'elhackers2013@HOTMAIL.COM'),
(159, 'JORGE BENITEZ | ISA INDUSTRIAL', '', '', 0, '', 'ISA INDUSTRIAL', 'jbenitezhdz@gmail.com'),
(161, 'MARIO ARNALDO BARAJAS', '', '+52 1 6181335695', 0, '', '', 'mario.barajas@gmail.com'),
(162, 'Francisco Herrera Arriaga', '', '', 15, '', '', 'zhero49@hotmail.com'),
(163, 'LUIS ENRIQUE ALVAREZ ', '', '', 0, '', '', 'luenalgo@gmail.com'),
(164, 'BEULAH VIRIDIANA CAMARILLO', '', '', 0, '', 'COMPUNET', 'viridiana.camarillo@compunetmexico.com'),
(167, 'ENRIQUE JAVIER GUZMAN DE LA CRUZ', '', '', 0, '', 'U. TEC. GUTIERREZ SAMORA', 'enrique.guzman@utgz.edu.mx'),
(168, 'FRANCISCO OLVERA', '', '', 0, '', '', 'folveras@icloud.com'),
(169, 'DIEGO CORONA ZAMBRANO', '', '', 0, '', '', 'diego.corona18@outlook.com'),
(170, 'GUILLERMO PRIETO GERONIMO', '', '', 0, '', '', 'memoprieto3010@gmail.com'),
(179, 'SOFIA VAZQUES MORALES', '20 DE NOVIEMBRE , FNT. COPPEL', '', 0, '', 'OPTICA IRAIS', ''),
(180, 'JORGE SIERRA NERIA', '', '', 0, 'SINJ931227923', 'JORGE SIERRA NERIA', 'j.sierra3113@gmail.com'),
(181, 'JHONATAN IVAN SANTOYO MATEO', '', '', 0, '', '', 'jivansantoyo@gmail.com'),
(182, 'IVAN CAMACHO', '', '', 0, '', '', 'inmobiliariabkl@gmail.com'),
(183, 'Javier OSORIO IBARRA ', '', '', 0, '', '', 'javier_osorio_ibarra@hotmail.com'),
(184, 'ISC.  EDGAR MeNDEZ ', '', '', 0, 'IVD990911KU1', 'INSTITUTO VERACRUZANO DEL DEPORTE SIN TIPO DE SOCIEDAD', 'edgarmendez1087@gmail.com'),
(185, 'JOSE DE JESUS GONZALES REYNA', '', '', 0, '', '', 'pumagym1987@gmail.com'),
(186, 'MAURICIO MENA VALDIVIA ', '', '', 0, '', '', 'maurmenav@hotmail.com'),
(187, 'PABLO HERNANDEZ VILLARREAL', '', '', 0, 'GAV970331L29', 'GRUAS Y TRANSPORTES VELASQUEZ S.A DE C.V', 'guillermo.gonzales@gavsa.com.mx'),
(188, ' FERNANDO MIGUEL FLORES MARTINEZ', '', '', 0, '', '', 'nokian95nam@gmail.com'),
(189, 'CITLALI ALVAREZ', '', '', 0, '', '', 'citlali_cesar@hotmail.com'),
(190, 'RAFAEL DAVID MATEO', '', '', 0, '', '', 'El-deivi02@live.com'),
(191, 'STIVEN GONZALEZ GUARIN', '', '', 0, '', '', 'stivengg90@hotmail.com'),
(192, 'JOSE ALBERTO MONTENEGRO RAMIREZ', '', '', 0, '', '', 'beda.montenegro@hotmail.com'),
(194, 'ISAAC SIERRA', '', '', 0, '', '', 'sierraisaac01@gmail.com'),
(195, 'LAWRENCE OLIVARES', '', '', 0, '', '', 'lawrencediaz2219@gmail.com'),
(196, 'LUIS ZAMBRANO', '', '', 0, '', '', 'Luisillo515@gmail.com'),
(197, 'JOSE ERNESTO HERNANDEZ HERNANDEZ', '', '', 0, '', '', 'je_250810@hotmail.com'),
(198, 'MILANO', '', '', 0, 'DIS880803JW8', 'MILANO OPERADORA S.A DE C.V', 'tda3042@milano.com'),
(199, 'ANTONIO LIMON PRECIADO ', '', '', 0, 'AAGM700914547', 'Marco Antonio Ayala Gudiño ', 'alp.ingeniero@gmail.com'),
(200, 'HOTEL CASA ROMA', '', '', 0, 'AATD781127MZ8', 'DANIA ELIBETH ALARCON TOVAR ', 'Hotelcasaroma@outlook.com'),
(201, 'ARTURO GALLARDO MEDINA', '', '', 0, '', '', 'ar.gallardo.m@gmail.com'),
(202, 'HOMERO CHAVEZ ', '', '', 0, '', '', 'hchavezm9@gmail.com'),
(203, 'CARLOS EDUARDO NAVA CUELLAR ', '', '', 0, '', '', 'Carloseduardo_nava@hotmail.com'),
(205, 'MIGUE PANTIGA', '', '', 0, '', '', 'cp_pantiga@hotmail.com'),
(206, 'HECTOR LOMAS ', '', '', 0, '', '', 'ecko_dnc@hotmail.com'),
(207, 'GERMáN HERNáNDEZ BLANCAS ', '', '', 0, '', '', 'german.h.b@hotmail.com'),
(208, 'ISIDORA IRMA BAUTISTA VELAZQUEZ', '', '', 0, 'BAVI5404043C1', 'ISIDORA IRMA BAUTISTA VELAZQUEZ', 'livsanchez@msn.com'),
(210, 'ALFONSO LOAIZA LOEZA ', '', '', 0, '', '', 'alfonsoloaiza@hotmail.com'),
(211, 'HOTEL PLAYA DEL REY', '', '', 0, 'RIM1707126W2', 'RIMCLAT, S.A. DE C.V.', 'brendaplayadelrey@gmail.com,recepcion@hotelplayadelrey.com.mx'),
(212, 'LUZ MARIA MEDINA MUCIÑO', '', '', 0, '', '', 'mego5604@gmail.com'),
(213, 'ANABELL CORDOVA LORETO', '', '', 0, 'COLA920825DY7', 'ANABELL CORDOVA LORETO', 'francisco.macias@grupomacogas.mx'),
(214, 'HOTEL SAN JOSE TEXMELUCAN', '', '', 0, '', '', 'aceradri@hotmail.com'),
(215, 'HOTEL CASA DE LOS ROMBOS', '', '', 0, '', '', 'enlacearq.conta@hotmail.com'),
(216, 'TITO CALLEJA LOPEZ', '', '', 0, '', '', 'remodelacionescalleja@hotmail.com'),
(217, 'Rafael Pinto', '', '', 0, '', '', 'bootcampuy@gmail.com'),
(218, 'IVAN FERNANDEZ', '', '', 40, '', '', 'ministeriumcr@gmail.com'),
(219, 'ING. GILBERTO RAMíREZ CORREA', '', '', 0, '', 'SOFTBOX ZACATECAS', 'softboxzac@gmail.com'),
(220, 'ALBERTO GALLEGOS GODINEZ ', '', '', 0, '', '', 'soporte.08.89@hotmail.com'),
(221, 'KARLA MUñOZ', '', '', 0, '', '', 'kam_24_8@hotmail.com'),
(222, ' ING. JOSE LUIS CELAYA', '', '', 0, '', '', 'direccion@grupoabys.com.mx'),
(223, 'FRANKLYN CRISOSTOMO LUCIANO', '', '', 0, '', '', 'crisostomofranklin@gmail.com'),
(224, 'TOMAS ANTONIO ARIAS', '', '', 0, '', '', 'gamer-antonio@hotmail.com'),
(225, 'STAR ZONE GYM', '', '', 0, '', '', 'delamazaleon17@gmail.com'),
(226, ' CARLOS IVAN DUARTE MEJíA', '', '', 0, '', '', 'carlos_ivan_mej@hotmail.com'),
(227, 'LUIS MONDRAGON', '', '', 0, '', '', 'lmondragon00@hotmail.com'),
(228, 'JULIO CESAR CABALLERO FERNANDEZ', '', '', 0, 'CAFJ880722J74', 'JULIO CESAR CABALLERO FERNANDEZ', 'Juliocaballero2001@hotmail.com'),
(229, 'MYHOTEL SPA', ' COMERCIAL: KENNEDY 3886, VITACURA, SANTIAGO, CHILE', '', 0, 'RUT: 76.377.708-1', ' DESARROLLO Y COMERCIALIZACIóN DE SOFTWARE MYHOTEL SPA', 'cobranza@myhotel.com.es'),
(230, 'NINA STRUNK', '', '', 0, '', '', 'nilou.h@web.de'),
(231, 'SUSANA JIMEVILLA', '', '', 0, '', '', 'confeccionesjimevilla@gmail.com'),
(232, 'JESUS ALVARADO', '', '', 0, '', '', 'jesus.chivas64@hotmail.com'),
(233, 'JULIO O. CALDERóN PACHECO', '', '', 0, '', '', 'julio-pacheco@hotmail.com'),
(234, 'CESAR ORTEGA MAYA', '', '', 0, '', 'SCOM GYM', 'comsesar@hotmail.com'),
(240, 'LUIS NAVARRETE', '', '', 0, 'TBC121206PD0', 'Title Boxing Club SA DE CV', 'luis.navarrete@titleboxingclub.com'),
(241, 'JULIO ANAYA', '', '', 0, '', '', 'julio.jesus@metasoftica.com'),
(242, 'LEONARDO CUEVAS ', '', '', 15, '', 'Tecnic Inssol', 'cuevas2708@gmail.com'),
(243, 'BRYAN AURELIANO MARTIN TOSTADO', '', '', 0, '', 'HECTOR MARTíN TOSTADO', 'Bryan_Aureliano@hotmail.com'),
(244, 'ROGELIO VAZQUEZ NEVÁREZ ', '', '', 0, 'VANR830811S35', 'ROGELIO VAZQUEZ NEVÁREZ', 'pctecnicajuarez@gmail.com'),
(245, 'MARIELA REYES PIMENTEL', '', '', 0, 'REPM761023TY4', 'MARIELA REYES PIMENTEL', 'berelchoapas@hotmail.com'),
(246, 'SMY GYM FITNESS', '', '', 0, '', 'SMY GYM FITNESS', 'smy.gym.oficial@gmail.com'),
(247, 'LEOPOLDO SALAZAR VAZQUEZ', '', '', 0, '', '', 'ventas@secutam.com'),
(248, 'CéSAR ORTEGA MAYA', '', '', 0, '', '', 'comsesar@hotmail.com'),
(249, 'DANIEL MARQUEZ', '', '', 0, '', '', 'marquez.fm@hotmail.com'),
(250, 'CARLOS YANUARIO AVILA CHI', '', '', 0, '', '', 'lc.carlosavila@gmail.com'),
(251, 'NEFI GARCES ARVIZU', '', '', 0, '', 'NEFI GARCES ARVIZU', 'negazu16@gmail.com'),
(252, 'JAIME GOMAR MUNGUIA ', '', '', 0, 'GOTJ5607265E3', 'Jaime gomar torres ', 'jimygom@gmail.com'),
(253, 'KEVIN ANTONIO REYNOSO ALONSO', '', '', 0, 'REAK940430BD3', 'KEVIN ANTONIO REYNOSO ALONSO', 'elias.fdzb@gmail.com'),
(254, 'GEPSO TECNOLOGíA EN PREVENCIóN AVANZADA S.A. DE C.V.', '', '', 0, 'GTP0608074V0', 'GEPSO TECNOLOGíA EN PREVENCIóN AVANZADA S.A. DE C.V.', 'grupo.pozos@gmail.com'),
(255, 'GABRIEL AGUIRRE OLVERA', '', '', 0, '', '', 'gabriel.aguirre@vinte.com'),
(256, 'ADRIAN GUSTAVO MAMANI CARO', '', '', 0, '', 'ATOMIC GYM', 'mamanicaroo@gmail.com'),
(257, 'ANA KAREN GUDIñO DE LEóN ', '', '', 0, '', '', 'fco.reyes.ochoa@gmail.com'),
(258, 'ANA PATRICIA CORDOVA OLAN ', '', '', 0, 'COOA891108KE3', 'ANA PATRICIA CORDOVA OLAN ', 'senusa@outlook.com'),
(259, 'GUZMAN JORGE QUISPE HUAMANI', '', '', 0, '', '', 'jorgequispe.huamani@gmail.com'),
(260, 'JUDITH GABRIELA QUISPE MARZE', '', '', 0, '', '', 'getfit031213@gmail.com'),
(262, 'CHRISTIAN JAVAN HERNANDEZ', '', '', 0, '', '', 'Christian.javan@gmail.com'),
(263, ' Juan fernando Ramírez Varela', '', '', 0, 'ravj700209ila', ' Juan fernando Ramírez Varela', 'yaid10@hotmail.com'),
(264, 'RAFAEL SOLANO TORRES', '', '', 0, '', '', 'rafael777s@hotmail.com'),
(265, 'JAHUDIEL TANORI', '', '', 0, '', 'MINING CAMP SOLUTIONS', 'miningcampsolutions@outlook.com'),
(266, 'ECOFITNESS GYM', '', '', 0, '', '', 'ecofitness@live.com.mx'),
(267, 'ACEROS LASA', '', '', 0, '', '', 'sistemas@grupolasamex.com'),
(268, 'DAVID DIAZ CRUZ', '', '', 0, '', '', 'wsdbolivia@gmail.com'),
(269, 'SANDRA CORTEZ', '', '', 0, '', '', 'Sandruchis_yo@hotmail.com'),
(270, 'Cynthia Cristina Salazar Ruiz', '', '', 0, 'SARC650306NM3', 'Cynthia Cristina Salazar Ruiz', 'e.facturacion2018@gmail.com'),
(271, 'JORGE AMADO SáNCHEZ', '', '', 0, '', '', 'ing.jorgeamado@hotmail.com'),
(272, 'MIGUEL FERNANDO LADINO PULIDO', '', '', 0, '', '', 'Miguel.ladino1548@correo.policia.gov.co'),
(273, ' NESA SERVICIOS HOTELEROS SA DE CV', '', '', 0, 'NCO1404092F0', ' NESA SERVICIOS HOTELEROS SA DE CV', 'nesacom@gmail.com'),
(274, 'HELENA PADILLA', '', '', 0, '', '', 'helena.lylu@gmail.com'),
(275, 'AVELINO BENIGNO VILLA SALAS', '', '', 0, 'VISA391116P30', 'AVELINO BENIGNO VILLA SALAS', 'abvillasalas@aevitas.com.mx'),
(276, 'CESAR LUIS ABAD ESTUDILLO HUERTA', '', '', 0, '', '', 'cesarestudillo93@gmail.com'),
(277, 'HOTEL PLAZA MANGOS', '', '', 0, '', 'HOTEL PLAZA MANGOS', 'reservaciones@hotelplazamangos.com'),
(278, 'DEBORA LIZETH SANCHEZ HERNANDEZ', '', '', 0, 'SAHD890607GZ2', 'DEBORA LIZETH SANCHEZ HERNANDEZ', 'rafaelrburguete@gmail.com'),
(279, 'HOTEL CASA MARAN', '', '', 0, '', '', 'hotelcasamaran@gmail.com'),
(280, 'JESUS EMMANUEL MORA', '', '', 0, '', '', 'alarmasmora@hotmail.com'),
(281, 'ANITA PAT MAGAÑA', '', '', 10, 'PAMA520104UA5', 'ANITA PAT MAGAÑA', 'Ventas.multicomputo@hotmail.com'),
(282, 'MARCELINO ALBERTO RAMíREZ MONTIEL ', '', '', 0, 'RAMM8608122B0', 'MARCELINO ALBERTO RAMíREZ MONTIEL ', 'ramirez.marcelino@gmail.com,contabilidad@promarco.mx'),
(283, 'YAMIR BENNETTS CAMPOS CORREO', '', '', 0, '', '', 'yamirbennetts@gmail.com'),
(284, 'ISMAEL PARRA MARTíNEZ', '', '', 0, '', '', 'casamarianohotelboutique@gmail.com'),
(285, 'SOPORTE ELEKTRA', '', '', 0, 'AIR080523UMA', 'ADMINISTRACION INTEGRAL DE REDES RI', 'seguimientos@rintegral.com.mx'),
(286, 'RICARDO AGUILAR ', '', '', 0, '', '', 'raguilar1037@gmail.com'),
(287, 'ARTURO GALINDO BAZA', '', '733390990', 0, '', '', 'coronita212@hotmail.com'),
(288, 'RAúL ESTRADA SANTIAGO', '', '', 0, '', '', 'raulstradas@hotmail.com'),
(289, 'GREGORIO MELGAR ESPINOZA', '2A. AVENIDA NORTE 6, COL. CENTRO. CP 30700', '', 0, 'MEEG650312262', 'GREGORIO MELGAR ESPINOZA', 'elbarondetapachula@gmail.com'),
(290, 'ALEJANDRO CAFETOS', 'calle del retorno entre carretera federal fortin- orizaba y 9 sur fortin  - centroAutopista Córdoba-Orizaba Km 290+750 S/N Córdoba, Ver.', '', 0, 'SCA981117398', 'Servicio Los Cafetos SA de CV', 'alejandro.cafetos@gmail.com'),
(291, 'JOEL JIMENEZ PEREZ', '', '', 0, '', '', 'joeljperez@zoho.com'),
(292, 'YESICA NOEMI JAIME RIOS', '', '', 0, '', '', 'yesica_jrios@outlook.com'),
(293, 'CHRISTOPHER GERARDO PéREZ VARELA', '', '', 0, 'VAHL600421GW5', '', 'calzadodeportivoktto@gmail.com'),
(294, 'GRUPO LASA MEX', '', '', 0, 'FOMG6103024A6', 'GUADALUPE FLORES MENDOZA', 'facturacion@grupolasamex.com'),
(295, 'ING. DARINEL SANCHEZ LOPEZ', '', '', 0, '', 'CIBER MUNDO', ''),
(296, 'VICTORIA MORGADO MARTINEZ', '', '', 0, '', 'CIBER GAME CASH', 'Cashgamer04@outlook.com');

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
(1, 213, '2020-06-15 15:57:33', '120200615120441', '186.7600', '0.0000', 3, 0, 10),
(2, 1, '2020-06-16 11:47:28', 'Impresiones 55 * 5', '165.0000', '165.0000', 2, 1, 1),
(7, 284, '2020-06-19 15:09:22', '120200619150321', '194.8800', '0.0000', 7, 0, 1),
(8, 1, '2020-06-19 18:49:44', '120200619184843', '219.2400', '219.2400', 7, 1, 10),
(9, 295, '2020-06-20 16:20:35', '120200620161732', '90.0000', '90.0000', 7, 1, 10),
(10, 296, '2020-06-20 16:20:39', '120200620161632', '620.0000', '620.0000', 7, 1, 10),
(11, 1, '2020-06-20 16:33:00', '120200620163250', '10.0000', '10.0000', 7, 1, 10),
(12, 290, '2020-06-23 00:06:49', '120200615005843', '1000.0000', '0.0000', 7, 0, 10),
(13, 213, '2020-06-26 07:58:24', '31253125351', '15000.0000', '10.0000', 0, 1, 10);

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
(10, 1, '6.7600', '2020-06-26 07:57:41'),
(11, 13, '14990.0000', '2020-06-26 07:58:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `descripcion` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `descripcion`) VALUES
(33, 'VARIOS', 'ARTICULOS VARIOS'),
(37, 'SOFTWARE', 'Software desarrollado por la empresa o por terceros'),
(38, 'COMPUTO', 'Accesorios para pc o similares\r\n'),
(39, 'CELULARES', '');

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
  `cfdi_pass` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `nombre_corto`, `direccion`, `correo`, `telefono`, `mision`, `vision`, `contacto`, `facebook`, `twitter`, `youtube`, `iva`, `footer`, `cfdi_lugare_expedicion`, `cfdi_rfc`, `cfdi_regimen`, `cfdi_cer`, `cfdi_key`, `cfdi_pass`) VALUES
(1, 'GRUPO ASCGAR', 'ASCGAR', '20 DE NOVIEMBRE 324, BARRIO DE LAS FLORES 96980', 'CONTACTO@CYBERCHOAPAS.COM', '9231200505', 'Zithromax 500mg Dosage  https://ascialis.com/ - buy cialis online usa acheter cialis ligne  <a href=https://ascialis.com/#>acquistare cialis online</a> Cialis Gimnasio ', 'Pretendemos ser un referente en el mercado nacional en el sector de las TIC, y para ello abarcaremos todos los servicios que ofrecemos actualmente incrementando los que vayan surgiendo debido a la necesidad de cambio provocado por los avances tecnológicos. Esto es así ya que somos una empresa en constante innovación ya que el sector de la tecnología así lo requiere.', 'Tel / Whatsapp\r\n<br><a target=\"_BLANK\" href=\"https://wa.me/5219231200505\" style=\"color:white;\">+52 923 120 05 05 </a>\r\n<br><br>\r\n\r\nSkype\r\n<br>ventas@cyberchoapas.com \r\n<br><br>\r\n\r\nCorreo\r\n<br>ventas@cyberchoapas.com \r\n<br><br>\r\n\r\nPagos\r\n<br>pagos@cyberchoapas.com ', 'https://www.facebook.com/CltaServices/', 'https://www.youtube.com/channel/UCyGopyJoASFYL6uulromDwg/videos', 'https://www.youtube.com/channel/UCyGopyJoASFYL6uulromDwg/videos', 16, '<h5 style=\"background-color: #1a4f7d; text-align: center;\"><span style=\"background-color: #1a4f7d; color: #ffffff;\"><em><strong>| www.cyberchoapas.com | ::: GRUPO ASCGAR ::: | www.ascgar.com |</strong></em></span><span style=\"background-color: #1a4f7d; color: #ffffff;\"><em><strong><br /></strong></em></span></h5>', '96980', 'AEDF9201245G3', '621', 'SDK2/certificados/CER.cer  ', 'SDK2/certificados/KEY.key', 'AEDF9201');

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
  `oxxo_pay` varchar(254) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `folio_venta`
--

INSERT INTO `folio_venta` (`folio`, `vendedor`, `client`, `descuento`, `fecha`, `open`, `cobrado`, `fecha_venta`, `cut`, `sucursal`, `cut_global`, `iva`, `t_pago`, `pedido`, `folio_venta_ini`, `cotizacion`, `concepto`, `comision_pagada`, `oxxo_pay`) VALUES
('120190819143328', 1, 154, 0, '2019-08-19 14:33:28', 0, 4600, '2019-08-19 15:12:04', 1, 1, 1, 16, 'transferencia', 0, '120190819143328', 0, NULL, 1, '0'),
('120190820121431', 1, 155, 0, '2019-08-20 12:14:31', 0, 10517.2, '2019-08-25 10:34:06', 1, 1, 1, 16, 'transferencia', 0, '120190820121431', 0, NULL, 1, '0'),
('120190820190330', 1, 1, 0, '2019-08-20 19:03:30', 0, 3795, '2019-08-20 19:04:26', 1, 9, 1, 16, 'transferencia', 0, NULL, 0, NULL, 1, '0'),
('120190824131530', 1, 1, 0, '2019-08-24 13:15:30', 0, 105, '2019-08-24 13:17:30', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190829201049', 1, 1, 0, '2019-08-29 20:10:49', 0, 180, '2019-08-29 20:11:21', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190829205530', 1, 1, 0, '2019-08-29 20:55:30', 0, 190, '2019-08-29 20:55:45', 1, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190831213732', 1, 1, 0, '2019-08-31 21:37:32', 0, 300, '2019-08-31 21:41:35', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190904183621', 1, 1, 0, '2019-09-04 18:36:21', 0, 400, '2019-09-04 19:10:42', 1, 1, 1, 16, 'efectivo', 0, '120190904183621', 0, NULL, 1, '0'),
('120190905085759', 1, 162, 10, '2019-09-05 08:57:59', 0, 4320, '2019-09-20 14:27:17', 1, 1, 1, 16, 'efectivo', 0, '120190905085759', 0, NULL, 1, '0'),
('120190907112858', 1, 1, 0, '2019-09-07 11:28:58', 0, 290, '2019-09-07 11:30:13', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190907143803', 1, 1, 0, '2019-09-07 14:38:03', 0, 88, '2019-09-07 14:38:48', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190907201649', 1, 1, 0, '2019-09-07 20:16:49', 0, 110, '2019-09-07 20:18:56', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190909205319', 1, 1, 0, '2019-09-09 20:53:19', 0, 60, '2019-09-09 20:53:52', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190912210242', 1, 1, 0, '2019-09-12 21:02:42', 0, 410, '2019-09-12 21:05:28', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190914130854', 1, 1, 0, '2019-09-14 13:08:54', 0, 105, '2019-09-14 13:33:15', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190916123500', 1, 179, 0, '2019-09-16 12:35:00', 0, 399.99, '2019-09-16 14:51:02', 1, 1, 1, 16, 'efectivo', 0, '120190916123500', 0, NULL, 1, '0'),
('120190916193937', 1, 1, 0, '2019-09-16 19:39:37', 0, 150, '2019-09-16 19:39:53', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190916221358', 1, 180, 0, '2019-09-16 22:13:58', 0, 4800, '2019-09-16 22:14:48', 1, 1, 1, 16, 'transferencia', 0, '120190916221358', 0, NULL, 1, '0'),
('120190917120915', 1, 1, 0, '2019-09-17 12:09:15', 0, 70, '2019-09-17 12:09:35', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190917192301', 1, 1, 0, '2019-09-17 19:23:01', 0, 0, '2019-09-17 19:23:38', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190917202852', 1, 1, 0, '2019-09-17 20:28:52', 0, 20, '2019-09-17 20:29:34', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('120190921141216', 1, 1, 0, '2019-09-21 14:12:16', 0, 30, '2019-09-21 14:12:54', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120190921153718', 1, 1, 0, '2019-09-21 15:37:18', 0, 4500, '2019-09-21 15:38:15', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120190925093148', 1, 184, 0, '2019-09-25 09:31:48', 0, 1125, '2019-09-30 18:05:34', 1, 1, 1, 16, 'transferencia', 0, '120190925093148', 0, NULL, 0, '0'),
('120190925202625', 1, 1, 0, '2019-09-25 20:26:25', 0, 280, '2019-09-25 20:26:55', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120190926141326', 1, 1, 0, '2019-09-26 14:13:26', 0, 85, '2019-09-26 14:14:14', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120190926205952', 1, 162, 20, '2019-09-26 20:59:52', 0, 6080, '2019-09-27 12:22:29', 1, 1, 1, 16, 'transferencia', 0, '120190926205952', 0, NULL, 0, '0'),
('120190927122730', 1, 186, 0, '2019-09-27 12:27:30', 0, 4500, '2019-09-27 12:51:47', 1, 1, 1, 16, 'transferencia', 0, '120190927122730', 0, NULL, 0, '0'),
('120190927195056', 1, 187, 0, '2019-09-27 19:50:56', 0, 100, '2019-09-27 19:51:48', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120190927203056', 1, 1, 0, '2019-09-27 20:30:56', 0, 20, '2019-09-27 20:31:17', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120190928145049', 1, 188, 3, '2019-09-28 14:50:49', 0, 4365, '2019-09-28 15:37:17', 1, 1, 1, 16, 'transferencia', 0, '120190928145049', 0, NULL, 0, '0'),
('120190928164919', 1, 190, 0, '2019-09-28 16:49:19', 0, 4800, '2019-10-26 17:00:19', 1, 1, 1, 16, 'transferencia', 0, '120190928164919', 0, NULL, 0, '0'),
('120190929102555', 1, 191, 8, '2019-09-29 10:25:55', 0, 4416, '2019-10-02 21:27:14', 1, 1, 1, 16, 'transferencia', 0, '120190929102555', 0, NULL, 0, '0'),
('120190930114626', 1, 1, 0, '2019-09-30 11:46:26', 0, 180, '2019-10-01 14:36:24', 1, 1, 1, 16, 'efectivo', 0, '120190930114626', 0, NULL, 0, '0'),
('120191004195727', 1, 198, 0, '2019-10-04 19:57:27', 0, 239.8, '2019-10-04 19:59:52', 1, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191005195335', 1, 1, 0, '2019-10-05 19:53:35', 0, 110, '2019-10-05 19:53:53', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191006181905', 1, 1, 0, '2019-10-06 18:19:05', 0, 480, '2019-10-07 12:06:09', 1, 1, 1, 16, 'transferencia', 0, '120191006181905', 0, NULL, 0, '0'),
('120191007150313', 1, 1, 0, '2019-10-07 15:03:13', 0, 100, '2019-10-07 15:05:21', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191009211643', 1, 1, 0, '2019-10-09 21:16:43', 0, 90, '2019-10-09 21:17:04', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191011135643', 1, 199, 0, '2019-10-11 13:56:43', 0, 5450, '2019-10-19 13:33:45', 1, 1, 1, 16, 'transferencia', 0, '120191011135643', 0, NULL, 0, '0'),
('120191011192654', 1, 1, 0, '2019-10-11 19:26:54', 0, 700, '2019-10-11 19:28:09', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191014113426', 1, 184, 0, '2019-10-14 11:34:26', 0, 1125, '2019-10-14 11:41:06', 1, 1, 1, 16, 'transferencia', 0, '120191014113426', 0, NULL, 0, '0'),
('120191014165302', 1, 200, 0, '2019-10-14 16:53:02', 0, 1359.52, '2019-10-14 20:09:29', 1, 1, 1, 16, 'efectivo', 0, '120191014165302', 0, NULL, 0, '0'),
('120191014193713', 1, 1, 0, '2019-10-14 19:37:13', 0, 60, '2019-10-14 19:37:52', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191016124524', 1, 201, 0, '2019-10-16 12:45:24', 0, 4800, '2019-10-16 15:59:20', 1, 1, 1, 16, 'transferencia', 0, '120191016124524', 0, NULL, 0, '0'),
('120191016215055', 1, 202, 0, '2019-10-16 21:50:55', 0, 2000, '2019-10-17 11:50:25', 1, 1, 1, 16, 'transferencia', 0, '120191016215055', 0, NULL, 0, '0'),
('120191017195945', 1, 1, 0, '2019-10-17 19:59:45', 0, 150, '2019-10-17 20:30:55', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191020164646', 1, 1, 0, '2019-10-20 16:46:46', 0, 106, '2019-10-20 16:47:48', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191022111046', 1, 206, 0, '2019-10-22 11:10:46', 0, 4600, '2019-10-22 11:48:27', 1, 1, 1, 16, 'transferencia', 0, '120191022111046', 0, NULL, 0, '0'),
('120191022145144', 1, 182, 0, '2019-10-22 14:51:44', 0, 2000, '2019-10-23 16:24:34', 1, 1, 1, 16, 'transferencia', 0, '120191022145144', 0, NULL, 0, '0'),
('120191029181000', 1, 208, 0, '2019-10-29 18:10:00', 0, 4500, '2019-10-29 18:11:43', 1, 1, 1, 16, 'transferencia', 0, '120191029181000', 0, NULL, 0, '0'),
('120191030143747', 1, 199, 0, '2019-10-30 14:37:47', 0, 950, '2019-10-30 14:37:47', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191101093802', 1, 210, 0, '2019-11-01 09:38:02', 0, 1800, '2019-11-01 09:38:02', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191105205941', 1, 217, 0, '2019-11-05 20:59:41', 0, 480, '2019-11-09 12:30:00', 1, 1, 1, 16, 'transferencia', 0, '120191105205941', 0, NULL, 0, '0'),
('120191107163213', 1, 1, 0, '2019-11-07 16:32:13', 0, 480, '2019-11-07 21:10:45', 1, 1, 1, 16, 'tranferencia', 0, '120191107163213', 0, NULL, 0, '0'),
('120191108193425', 1, 218, 40, '2019-11-08 19:34:25', 0, 2880, '2019-11-08 19:48:39', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120191113223531', 1, 154, 0, '2019-11-13 22:35:31', 0, 100, '2019-11-14 09:45:24', 1, 1, 1, 16, 'transferencia', 0, '120191113223531', 0, NULL, 0, '0'),
('120191114005331', 1, 1, 0, '2019-11-14 00:53:31', 0, 480, '2019-11-14 09:59:29', 1, 1, 1, 16, 'tranferencia', 0, '120191114005331', 0, NULL, 0, '0'),
('120191114180220', 1, 1, 0, '2019-11-14 18:02:20', 0, 200, '2019-11-15 09:13:16', 1, 1, 1, 16, 'tranferencia', 0, '120191114180220', 0, NULL, 0, '0'),
('120191116151736', 1, 223, 0, '2019-11-16 15:17:36', 0, 1831.32, '2019-11-16 16:00:40', 1, 1, 1, 16, 'efectivo', 0, '120191116151736', 0, NULL, 0, '0'),
('120191119190512', 1, 225, 0, '2019-11-19 19:05:12', 0, 8600, '2019-11-19 19:06:04', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120191119235516', 1, 1, 0, '2019-11-19 23:55:16', 0, 300, '2019-11-20 08:27:48', 1, 1, 1, 16, 'tranferencia', 0, '120191119235516', 0, NULL, 0, '0'),
('120191121122200', 1, 227, 5, '2019-11-21 12:22:00', 0, 4275, '2019-11-21 13:33:09', 1, 1, 1, 16, 'transferencia', 0, '120191121122200', 0, NULL, 0, '0'),
('120191121122456', 1, 229, 20, '2019-11-21 12:24:56', 0, 1864.8, '2019-11-25 15:16:49', 1, 1, 1, 16, '', 0, '120191121122456', 0, NULL, 0, '0'),
('120191122200257', 1, 198, 0, '2019-11-22 20:02:57', 0, 253, '2019-11-28 18:46:46', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191123103040', 1, 228, 0, '2019-11-23 10:30:40', 0, 6700, '2019-11-23 18:33:31', 1, 1, 1, 16, 'transferencia', 0, '120191123103040', 0, NULL, 0, '0'),
('120191125155907', 1, 230, 0, '2019-11-25 15:59:07', 1, 0, NULL, 1, 1, 1, 16, 'efectivo', 0, '120191125155907', 1, NULL, 0, '0'),
('120191126104315', 1, 231, 100, '2019-11-26 10:43:15', 0, 0, '2019-11-26 10:44:13', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120191127101251', 1, 155, 25, '2019-11-27 10:12:51', 1, 0, NULL, 1, 1, 1, 16, 'efectivo', 0, '120191127101251', 1, NULL, 0, '0'),
('120191127121217', 1, 232, 50, '2019-11-27 12:12:17', 0, 2400, '2019-12-27 15:12:59', 1, 1, 1, 16, 'transferencia', 0, '120191127121217', 0, NULL, 0, '0'),
('120191128095310', 1, 233, 0, '2019-11-28 09:53:10', 0, 4800, '2019-12-09 18:05:12', 1, 1, 1, 16, 'transferencia', 0, '120191128095310', 0, NULL, 0, '0'),
('120191128191557', 1, 198, 0, '2019-11-28 19:15:57', 0, 253, '2019-11-28 19:29:40', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191201121446', 1, 1, 0, '2019-12-01 12:14:46', 0, 230, '2019-12-01 12:15:04', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191204145033', 1, 234, 0, '2019-12-04 14:50:33', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120191204145033', 1, NULL, 0, '0'),
('120191211172238', 1, 240, 10, '2019-12-11 17:22:38', 0, 7740, '2019-12-18 19:46:02', 1, 1, 1, 16, 'transferencia', 0, '120191211172238', 0, NULL, 0, '0'),
('120191212182812', 1, 241, 0, '2019-12-12 18:28:12', 0, 780, '2019-12-12 18:31:58', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120191212203154', 1, 198, 0, '2019-12-12 20:31:54', 0, 322, '2019-12-12 20:33:57', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191215121646', 1, 200, 0, '2019-12-15 12:16:46', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120191215121646', 1, NULL, 0, '0'),
('120191217192702', 1, 1, 0, '2019-12-17 19:27:02', 0, 160, '2019-12-17 19:27:29', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191219190531', 1, 198, 0, '2019-12-19 19:05:31', 0, 119, '2019-12-19 19:06:20', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191220114310', 1, 242, 100, '2019-12-20 11:43:10', 0, 0, '2019-12-20 11:44:23', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120191221130642', 1, 162, 0, '2019-12-21 13:06:42', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120191221130642', 1, NULL, 0, '0'),
('120191222191800', 1, 243, 30, '2019-12-22 19:18:00', 0, 3360, '2019-12-23 18:41:59', 1, 1, 1, 16, 'transferencia', 0, '120191222191800', 0, NULL, 0, '0'),
('120191223101413', 1, 1, 0, '2019-12-23 10:14:13', 0, 580, '2019-12-23 18:55:38', 1, 1, 1, 16, 'transferencia', 0, '120191223101413', 0, NULL, 0, '0'),
('120191223121908', 1, 244, 0, '2019-12-23 12:19:08', 0, 6700, '2019-12-23 12:21:08', 1, 1, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0'),
('120191223191852', 1, 245, 0, '2019-12-23 19:18:52', 0, 1300, '2019-12-23 19:20:42', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120191224090514', 1, 246, 0, '2019-12-24 09:05:14', 0, 4864, '2019-12-24 10:44:52', 1, 1, 1, 16, 'transferencia', 0, '120191224090514', 0, NULL, 0, '0'),
('120191226110834', 1, 247, 0, '2019-12-26 11:08:34', 0, 4500, '2019-12-26 12:33:06', 1, 1, 1, 16, 'transferencia', 0, '120191226110834', 0, NULL, 0, '0'),
('120191226133437', 1, 1, 0, '2019-12-26 13:34:37', 0, 580, '2019-12-31 09:57:08', 1, 1, 1, 16, 'transferencia', 0, '120191226133437', 0, NULL, 0, '0'),
('120191227183100', 1, 234, 50, '2019-12-27 18:31:00', 0, 2400, '2019-12-27 19:36:38', 1, 1, 1, 16, 'transferencia', 0, '120191227183100', 0, NULL, 0, '0'),
('120191227193742', 1, 248, 50, '2019-12-27 19:37:42', 0, 2400, '2019-12-27 19:38:59', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120191231095013', 1, 240, 0, '2019-12-31 09:50:13', 0, 1276, '2019-12-31 09:51:26', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120191231145118', 1, 249, 0, '2019-12-31 14:51:18', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120191231145118', 1, NULL, 0, '0'),
('120200102145902', 1, 250, 0, '2020-01-02 14:59:02', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200102145902', 1, NULL, 0, '0'),
('120200103112713', 1, 251, 0, '2020-01-03 11:27:13', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200103112713', 1, NULL, 0, '0'),
('120200103144631', 1, 252, 0, '2020-01-03 14:46:31', 0, 4800, '2020-01-04 13:38:39', 1, 1, 1, 16, 'transferencia', 0, '120200103144631', 0, NULL, 0, '0'),
('120200103162126', 1, 232, 0, '2020-01-03 16:21:26', 0, 4770, '2020-01-05 17:12:28', 1, 1, 1, 16, 'transferencia', 0, '120200103162126', 0, NULL, 0, '0'),
('120200104175315', 1, 1, 0, '2020-01-04 17:53:15', 0, 25, '2020-01-11 11:40:51', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200105121047', 1, 253, 0, '2020-01-05 12:10:47', 0, 4800, '2020-01-05 16:59:12', 1, 1, 1, 16, 'transferencia', 0, '120200105121047', 0, NULL, 0, '0'),
('120200105140748', 1, 254, 0, '2020-01-05 14:07:48', 0, 4800, '2020-01-05 16:55:44', 1, 1, 1, 16, 'transferencia', 0, '120200105140748', 0, NULL, 0, '0'),
('120200107203605', 1, 255, 0, '2020-01-07 20:36:05', 0, 6700, '2020-01-07 20:36:31', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200110093529', 1, 242, 15, '2020-01-10 09:35:29', 0, 4080, '2020-01-11 09:12:08', 1, 1, 1, 16, 'transferencia', 0, '120200110093529', 0, NULL, 0, '0'),
('120200111110951', 1, 198, 0, '2020-01-11 11:09:51', 0, 180, '2020-01-11 11:11:07', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200114134955', 1, 155, 16, '2020-01-14 13:49:55', 0, 12852, '2020-01-15 19:56:58', 1, 1, 1, 16, 'transferencia', 0, '120200114134955', 0, NULL, 0, '0'),
('120200115120846', 1, 256, 30, '2020-01-15 12:08:46', 0, 3360, '2020-01-15 16:58:13', 1, 1, 1, 16, 'transferencia', 0, '120200115120846', 0, NULL, 0, '0'),
('120200115134352', 1, 257, 0, '2020-01-15 13:43:52', 0, 6700, '2020-01-15 13:44:40', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200116204713', 1, 259, 0, '2020-01-16 20:47:13', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200116204713', 1, NULL, 0, '0'),
('120200117130324', 1, 260, 0, '2020-01-17 13:03:24', 0, 4800, '2020-01-23 10:58:45', 1, 1, 1, 16, 'transferencia', 0, '120200117130324', 0, NULL, 0, '0'),
('120200118115214', 1, 255, 0, '2020-01-18 11:52:14', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200118115214', 1, NULL, 0, '0'),
('120200118142448', 1, 262, 0, '2020-01-18 14:24:48', 0, 6700, '2020-01-24 13:25:59', 1, 1, 1, 16, 'transferencia', 0, '120200118142448', 0, NULL, 0, '0'),
('120200124105728', 1, 263, 0, '2020-01-24 10:57:28', 0, 8600, '2020-01-24 17:04:52', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200124201751', 1, 264, 5, '2020-01-24 20:17:51', 0, 4275, '2020-01-24 20:29:00', 1, 9, 1, 16, 'transferencia', 0, '120200124201751', 0, NULL, 0, '0'),
('120200126111015', 1, 245, 0, '2020-01-26 11:10:15', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200126111015', 1, NULL, 0, '0'),
('120200127175015', 1, 265, 0, '2020-01-27 17:50:15', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200127175015', 1, NULL, 0, '0'),
('120200129214930', 1, 266, 0, '2020-01-29 21:49:30', 0, 4999, '2020-01-29 21:50:05', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200130143214', 1, 267, 100, '2020-01-30 14:32:14', 0, 0, '2020-01-30 14:35:11', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200131113725', 1, 268, 10, '2020-01-31 11:37:25', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200131113725', 1, NULL, 0, '0'),
('120200131114349', 1, 269, 0, '2020-01-31 11:43:49', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200131114349', 1, NULL, 0, '0'),
('120200205122840', 1, 270, 0, '2020-02-05 12:28:40', 0, 3000, '2020-02-28 10:16:31', 1, 1, 1, 16, 'transferencia', 0, '120200205122840', 0, NULL, 0, '0'),
('120200206100410', 1, 185, 0, '2020-02-06 10:04:10', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200206100410', 1, NULL, 0, '0'),
('120200207130612', 1, 271, 5, '2020-02-07 13:06:12', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200207130612', 1, NULL, 0, '0'),
('120200210122304', 1, 272, 0, '2020-02-10 12:23:04', 0, 4800, '2020-02-10 15:04:22', 1, 1, 1, 16, 'transferencia', 0, '120200210122304', 0, NULL, 0, '0'),
('120200211003703', 1, 273, 0, '2020-02-11 00:37:03', 0, 4500, '2020-02-20 19:22:12', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200211200422', 1, 274, 0, '2020-02-11 20:04:22', 0, 8799, '2020-02-11 20:05:15', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200214191541', 1, 275, 0, '2020-02-14 19:15:41', 0, 72.6, '2020-02-14 19:23:55', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200215121630', 1, 276, 0, '2020-02-15 12:16:30', 0, 8799, '2020-02-15 12:37:05', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200217223930', 1, 277, 0, '2020-02-17 22:39:30', 0, 6400, '2020-02-17 23:06:10', 1, 1, 1, 16, 'transferencia', 0, '120200217223930', 0, NULL, 0, '0'),
('120200218131603', 1, 162, 15, '2020-02-18 13:16:03', 0, 5525, '2020-02-20 19:24:27', 1, 1, 1, 16, 'transferencia', 0, '120200218131603', 0, NULL, 0, '0'),
('120200219111106', 1, 278, 0, '2020-02-19 11:11:06', 0, 4999, '2020-02-19 13:34:37', 1, 1, 1, 16, 'transferencia', 0, '120200219111106', 0, NULL, 0, '0'),
('120200219164131', 1, 200, 0, '2020-02-19 16:41:31', 0, 1166.96, '2020-03-02 12:31:47', 1, 1, 1, 16, 'transferencia', 0, '120200219164131', 0, NULL, 0, '0'),
('120200221110215', 1, 277, 0, '2020-02-21 11:02:15', 0, 1900, '2020-02-21 11:02:15', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200222191451', 1, 279, 0, '2020-02-22 19:14:51', 0, 4500, '2020-02-22 19:15:02', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200223223835', 1, 154, 15, '2020-02-23 22:38:35', 0, 4334.15, '2020-02-24 10:27:18', 1, 1, 1, 16, 'transferencia', 0, '120200223223835', 0, NULL, 0, '0'),
('120200224140712', 1, 280, 90, '2020-02-24 14:07:12', 0, 500, '2020-02-24 14:07:32', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200224141101', 1, 154, 0, '2020-02-24 14:11:01', 0, 100, '2020-02-24 14:11:01', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200225122835', 1, 281, 10, '2020-02-25 12:28:35', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200225122835', 1, NULL, 0, '0'),
('120200227090513', 1, 226, 15, '2020-02-27 09:05:13', 0, 9918.65, '2020-02-27 13:51:54', 1, 1, 1, 16, 'transferencia', 0, '120200227090513', 0, NULL, 0, '0'),
('120200228101706', 1, 270, 0, '2020-02-28 10:17:06', 0, 2870, '2020-02-28 10:17:31', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200301183321', 1, 282, 0, '2020-03-01 18:33:21', 0, 4000, '2020-03-14 15:11:21', 1, 1, 1, 16, 'transferencia', 0, '120200301183321', 0, NULL, 0, '0'),
('120200305094612', 1, 159, 0, '2020-03-05 09:46:12', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200305094612', 1, NULL, 0, '0'),
('120200310090003', 1, 283, 0, '2020-03-10 09:00:03', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200310090003', 1, NULL, 0, '0'),
('120200310104440', 1, 284, 0, '2020-03-10 10:44:40', 0, 6400, '2020-03-11 10:35:50', 1, 1, 1, 16, 'transferencia', 0, '120200310104440', 0, NULL, 0, '0'),
('120200311102623', 1, 285, 0, '2020-03-11 10:26:23', 0, 464, '2020-03-11 10:27:49', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200311102840', 1, 234, 0, '2020-03-11 10:28:40', 0, 3800, '2020-03-14 15:05:04', 1, 1, 1, 16, 'transferencia', 0, '120200311102840', 0, NULL, 0, '0'),
('120200313173607', 1, 162, 15, '2020-03-13 17:36:07', 0, 1615, '2020-03-14 15:10:07', 1, 1, 1, 16, 'transferencia', 0, '120200313173607', 0, NULL, 0, '0'),
('120200314104810', 1, 198, 0, '2020-03-14 10:48:10', 0, 90, '2020-03-14 10:49:22', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200320175952', 1, 286, 0, '2020-03-20 17:59:52', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200320175952', 1, NULL, 0, '0'),
('120200324191513', 1, 155, 15, '2020-03-24 19:15:13', 0, 4249.15, '2020-03-25 13:34:13', 1, 1, 1, 16, 'transferencia', 0, '120200324191513', 0, NULL, 0, '0'),
('120200325181657', 1, 198, 0, '2020-03-25 18:16:57', 0, 98, '2020-03-25 18:17:39', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200330113039', 1, 182, 0, '2020-03-30 11:30:39', 1, 0, NULL, 1, 1, 1, 16, 'oxxo', 0, '120200330113039', 1, NULL, 0, '93000316098233'),
('120200401195048', 1, 283, 0, '2020-04-01 19:50:48', 0, 450, '2020-04-09 01:29:33', 1, 1, 1, 16, 'oxxo', 0, '120200401195048', 0, NULL, 0, '93000318338603'),
('120200404153703', 1, 282, 0, '2020-04-04 15:37:03', 0, 3000, '2020-04-04 16:00:37', 1, 1, 1, 16, 'transferencia', 0, '120200404153703', 0, NULL, 0, '0'),
('120200404160402', 1, 282, 0, '2020-04-04 16:04:02', 0, 1300, '2020-04-04 16:06:03', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200407215434', 1, 287, 0, '2020-04-07 21:54:34', 0, 5800, '2020-04-09 01:22:28', 1, 1, 1, 16, 'oxxo', 0, '120200407215434', 0, NULL, 0, '93000323583847'),
('120200410115939', 1, 288, 0, '2020-04-10 11:59:39', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200410115939', 1, NULL, 0, '0'),
('120200410164933', 1, 1, 0, '2020-04-10 16:49:33', 0, 400, '2020-04-11 11:07:57', 1, 1, 1, 16, 'transferencia', 0, '120200410164933', 0, NULL, 0, '93000325897781'),
('120200422094312', 1, 289, 0, '2020-04-22 09:43:12', 0, 4500, '2020-04-22 10:43:02', 1, 1, 1, 16, 'transferencia', 0, '120200422094312', 0, NULL, 0, '0'),
('120200422192310', 1, 290, 0, '2020-04-22 19:23:10', 0, 10000, '2020-04-27 11:50:17', 1, 1, 1, 16, 'transferencia', 0, '120200422192310', 0, NULL, 0, '0'),
('120200428140349', 1, 290, 0, '2020-04-28 14:03:49', 0, 6800, '2020-04-29 17:52:44', 1, 1, 1, 16, 'transferencia', 0, '120200428140349', 0, NULL, 0, '0'),
('120200428203701', 1, 291, 0, '2020-04-28 20:37:01', 0, 3750, '2020-04-28 21:20:35', 1, 1, 1, 16, 'transferencia', 0, '120200428203701', 0, NULL, 0, '0'),
('120200430104842', 1, 292, 15, '2020-04-30 10:48:42', 0, 5440, '2020-05-01 10:22:29', 1, 9, 1, 16, 'transferencia', 0, '120200430104842', 0, NULL, 0, '0'),
('120200430141134', 1, 290, 50, '2020-04-30 14:11:34', 0, 4150, '2020-05-26 15:29:15', 1, 9, 1, 16, 'transferencia', 0, '120200430141134', 0, NULL, 0, '0'),
('120200512211718', 1, 162, 0, '2020-05-12 21:17:18', 0, 1000, '2020-05-13 11:28:20', 1, 1, 1, 16, 'efectivo', 0, '120200512211718', 0, NULL, 0, '0'),
('120200513104001', 1, 213, 0, '2020-05-13 10:40:01', 0, 1900, '2020-05-13 10:43:03', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200513112736', 1, 1, 0, '2020-05-13 11:27:36', 0, 150, '2020-05-14 14:46:00', 1, 1, 1, 16, 'oxxo', 0, '120200513112736', 0, NULL, 0, '93000359515697'),
('120200514232903', 1, 293, 0, '2020-05-14 23:29:03', 0, 8120, '2020-05-15 16:24:54', 1, 1, 1, 16, 'transferencia', 0, '120200514232903', 0, NULL, 0, '0'),
('120200521115213', 1, 198, 0, '2020-05-21 11:52:13', 0, 108, '2020-05-21 11:53:28', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200525125754', 1, 290, 0, '2020-05-25 12:57:54', 0, 3364, '2020-05-26 15:27:14', 1, 1, 1, 16, 'transferencia', 0, '120200525125754', 0, NULL, 0, '0'),
('120200526153134', 1, 290, 0, '2020-05-26 15:31:34', 0, 4800, '2020-05-26 15:32:12', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200526153239', 1, 290, 0, '2020-05-26 15:32:39', 0, 3000, '2020-05-26 15:33:18', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200527092213', 1, 290, 0, '2020-05-27 09:22:13', 0, 3364, '2020-05-27 09:22:53', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200527092332', 1, 290, 50, '2020-05-27 09:23:32', 0, 1900, '2020-05-27 09:24:19', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200527092511', 1, 290, 0, '2020-05-27 09:25:11', 0, 9000, '2020-05-27 09:25:43', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200527092727', 1, 290, 0, '2020-05-27 09:27:27', 0, 6800, '2020-05-27 09:28:36', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200529165018', 1, 1, 0, '2020-05-29 16:50:18', 0, 1160, '2020-05-30 09:49:27', 1, 1, 1, 16, 'oxxo', 0, '120200529165018', 0, NULL, 0, '93000380466191'),
('120200601122548', 1, 290, 0, '2020-06-01 12:25:48', 0, 1900, '2020-06-01 12:25:48', 1, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200602141246', 1, 294, 0, '2020-06-02 14:12:46', 0, 1160, '2020-06-02 14:14:04', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200603154543', 1, 213, 0, '2020-06-03 15:45:43', 0, 812, '2020-06-04 17:54:08', 1, 1, 1, 16, 'transferencia', 0, '120200603154543', 0, NULL, 0, '0'),
('120200604174537', 1, 291, 0, '2020-06-04 17:45:37', 0, 400, '2020-06-04 20:35:45', 1, 1, 1, 16, 'oxxo', 0, '120200604174537', 0, NULL, 0, '93000388190736'),
('120200609170247', 1, 293, 0, '2020-06-09 17:02:47', 1, 0, NULL, 1, 1, 1, 16, 'transferencia', 0, '120200609170247', 1, NULL, 0, '0'),
('120200610192001', 1, 162, 20, '2020-06-10 19:20:01', 0, 3999.2, '2020-06-10 19:20:26', 1, 1, 1, 16, 'transferencia', 0, NULL, 0, NULL, 0, '0'),
('120200613121227', 1, 287, 0, '2020-06-13 12:12:27', 0, 8000, '2020-06-13 17:51:29', 1, 1, 1, 16, 'oxxo', 0, '120200613121227', 0, NULL, 0, '93000398774230'),
('120200613122527', 1, 287, 0, '2020-06-13 12:25:27', 0, 6500, '2020-06-13 17:25:47', 1, 1, 1, 16, 'oxxo', 0, '120200613122527', 0, NULL, 0, '93000398777548'),
('120200615005843', 1, 290, 0, '2020-06-15 00:58:43', 1, 0, NULL, 1, 10, 1, 16, 'transferencia', 0, '120200615005843', 1, NULL, 0, '0'),
('120200615120441', 1, 213, 0, '2020-06-15 12:04:41', 1, 0, NULL, 1, 10, 1, 16, 'transferencia', 0, '120200615120441', 1, NULL, 0, '0'),
('120200617152417', 1, 272, 0, '2020-06-17 15:24:17', 0, 503.44, '2020-06-17 17:04:11', 1, 1, 1, 16, 'transferencia', 0, '120200617152417', 0, NULL, 0, '0'),
('120200619150321', 1, 284, 0, '2020-06-19 15:03:21', 1, 0, NULL, 1, 1, 1, 16, 'oxxo', 0, '120200619150321', 1, NULL, 0, '93000406991479'),
('120200619184843', 1, 1, 0, '2020-06-19 18:48:43', 0, 219.24, '2020-06-22 11:35:48', 1, 10, 1, 16, 'oxxo', 0, '120200619184843', 0, NULL, 0, '93000407269412'),
('120200620145755', 1, 1, 0, '2020-06-20 14:57:55', 0, 53, '2020-06-20 14:58:18', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200620161632', 1, 296, 0, '2020-06-20 16:16:32', 0, 620, '2020-06-21 00:42:53', 1, 10, 1, 16, 'transferencia', 0, '120200620161632', 0, NULL, 0, '0'),
('120200620161732', 1, 295, 0, '2020-06-20 16:17:32', 0, 90, '2020-06-20 17:43:20', 1, 10, 1, 16, 'transferencia', 0, '120200620161732', 0, NULL, 0, '0'),
('120200620163250', 1, 1, 0, '2020-06-20 16:32:50', 0, 10, '2020-06-20 16:33:14', 1, 10, 1, 16, 'transferencia', 0, '120200620163250', 0, NULL, 0, '0'),
('120200620170024', 1, 1, 0, '2020-06-20 17:00:24', 0, 290, '2020-06-20 17:00:39', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200621000857', 1, 1, 0, '2020-06-21 00:08:57', 1, 0, NULL, 1, 10, 1, 16, 'transferencia', 1, '120200621000857', 0, NULL, 0, '0'),
('120200622190933', 1, 1, 0, '2020-06-22 19:09:33', 0, 120, '2020-06-22 19:09:49', 1, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('120200622193924', 1, 282, 0, '2020-06-22 19:39:24', 1, 0, NULL, 1, 10, 1, 16, 'transferencia', 0, '120200622193924', 1, NULL, 0, '0'),
('20190819205346', 1, 1, 0, '2019-08-19 20:53:46', 0, 860, '2019-08-19 20:53:46', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'clta parque leydi', 1, '0'),
('20190819205425', 1, 1, 0, '2019-08-19 20:54:25', 0, 860, '2019-08-19 20:54:25', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'a', 1, '0'),
('20200624210816', 1, 1, 0, '2020-06-24 21:08:16', 0, 586.5, '2020-06-24 21:08:16', 1, 9, 1, 0, 'efectivo', 0, '', 0, 'Benito leydi maribel', 0, '0'),
('20200624211257', 1, 1, 0, '2020-06-24 21:12:57', 0, 830, '2020-06-24 21:12:57', 1, 1, 1, 0, 'efectivo', 0, '', 0, 'Joselin', 0, '0'),
('20200624211710', 1, 1, 0, '2020-06-24 21:17:10', 0, -100, '2020-06-24 21:17:10', 0, 1, 1, 0, 'efectivo', 0, '', 0, '2 ACTAS NACIMIENTO', 0, '0'),
('20200624221245', 1, 1, 0, '2020-06-24 22:12:45', 0, 8170.48, '2020-06-24 22:12:45', 0, 9, 1, 0, 'efectivo', 0, '', 0, 'aaa', 0, '0'),
('20200624221259', 1, 1, 0, '2020-06-24 22:12:59', 0, -10000, '2020-06-24 22:12:59', 0, 11, 1, 0, 'efectivo', 0, '', 0, 'aaa', 0, '0'),
('20200624224641', 39, 1, 0, '2020-06-24 22:46:41', 0, 1500, '2020-06-24 22:46:41', 0, 9, 1, 0, 'efectivo', 0, '', 0, 'aaaaa', 0, '0'),
('20200624224717', 39, 1, 0, '2020-06-24 22:47:17', 0, 150, '2020-06-24 22:47:17', 0, 9, 1, 0, 'efectivo', 0, '', 0, 'aaa', 0, '0'),
('20200624224729', 39, 1, 0, '2020-06-24 22:47:29', 0, 150, '2020-06-24 22:47:29', 0, 9, 1, 0, 'efectivo', 0, '', 0, 'aaaa', 0, '0'),
('20200624224912', 1, 1, 0, '2020-06-24 22:49:12', 0, 1500, '2020-06-24 22:49:12', 0, 10, 1, 0, 'efectivo', 0, '', 0, 'aaaa', 0, '0'),
('20200624225024', 1, 1, 0, '2020-06-24 22:50:24', 0, -55, '2020-06-24 22:50:24', 0, 10, 1, 0, 'efectivo', 0, '', 0, 'etc', 0, '0'),
('20200624225146', 1, 1, 0, '2020-06-24 22:51:46', 0, 1500, '2020-06-24 22:51:46', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'aaa', 0, '0'),
('20200624225156', 1, 1, 0, '2020-06-24 22:51:56', 0, -586.55, '2020-06-24 22:51:56', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'aaaa', 0, '0'),
('20200624225231', 39, 1, 0, '2020-06-24 22:52:31', 0, 1500, '2020-06-24 22:52:31', 0, 9, 0, 0, 'efectivo', 0, '', 0, 'prueba numero uno ', 0, '0'),
('20200624225240', 39, 1, 0, '2020-06-24 22:52:40', 0, -1650, '2020-06-24 22:52:40', 0, 9, 0, 0, 'efectivo', 0, '', 0, 'prueba no. 2', 0, '0'),
('20200624225558', 1, 1, 0, '2020-06-24 22:55:58', 0, -55, '2020-06-24 22:55:58', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'aaa', 0, '0'),
('20200624225829', 1, 1, 0, '2020-06-24 22:58:29', 0, 15, '2020-06-24 22:58:29', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'aa', 0, '0'),
('20200625233754', 1, 1, 0, '2020-06-25 23:37:54', 0, 1500, '2020-06-25 23:37:54', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'aaa', 0, '0'),
('20200625233837', 1, 1, 0, '2020-06-25 23:38:37', 0, 1500, '2020-06-25 23:38:37', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'aaa', 0, '0'),
('20200625233932', 1, 1, 0, '2020-06-25 23:39:32', 0, 1500, '2020-06-25 23:39:32', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'a', 0, '0'),
('20200625234103', 1, 1, 0, '2020-06-25 23:41:03', 0, 1500, '2020-06-25 23:41:03', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'aa', 0, '0'),
('20200625234122', 1, 1, 0, '2020-06-25 23:41:22', 0, 1515, '2020-06-25 23:41:22', 0, 10, 0, 0, 'efectivo', 0, '', 0, '51515', 0, '0'),
('20200625234143', 1, 1, 0, '2020-06-25 23:41:43', 0, 1500, '2020-06-25 23:41:43', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'aaaa', 0, '0'),
('20200625234221', 1, 1, 0, '2020-06-25 23:42:21', 0, 151515, '2020-06-25 23:42:21', 0, 10, 0, 0, 'efectivo', 0, '', 0, '151551', 0, '0'),
('20200625234830', 1, 1, 0, '2020-06-25 23:48:30', 0, 1500, '2020-06-25 23:48:30', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'aaaaaa', 0, '0'),
('20200625234954', 1, 1, 0, '2020-06-25 23:49:54', 0, 1500, '2020-06-25 23:49:54', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'aaaaaaaa', 0, '0'),
('20200625235109', 1, 1, 0, '2020-06-25 23:51:09', 0, 65541500, '2020-06-25 23:51:09', 0, 10, 0, 0, 'efectivo', 0, '', 0, '1aaa', 0, '0'),
('20200625235208', 1, 1, 0, '2020-06-25 23:52:08', 0, 51515200, '2020-06-25 23:52:08', 0, 10, 0, 0, 'efectivo', 0, '', 0, '62a66', 0, '0'),
('20200625235256', 1, 1, 0, '2020-06-25 23:52:56', 0, 15151, '2020-06-25 23:52:56', 0, 10, 0, 0, 'efectivo', 0, '', 0, '5AAA', 0, '0'),
('20200625235328', 1, 1, 0, '2020-06-25 23:53:28', 0, 1500, '2020-06-25 23:53:28', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'AAA', 0, '0'),
('20200625235342', 1, 1, 0, '2020-06-25 23:53:42', 0, 1515510, '2020-06-25 23:53:42', 0, 11, 0, 0, 'efectivo', 0, '', 0, 'SSSS', 0, '0'),
('20200625235345', 1, 1, 0, '2020-06-25 23:53:45', 0, 1515510, '2020-06-25 23:53:45', 0, 11, 0, 0, 'efectivo', 0, '', 0, 'SSSS', 0, '0'),
('20200625235503', 1, 1, 0, '2020-06-25 23:55:03', 0, 1515, '2020-06-25 23:55:03', 0, 10, 0, 0, 'efectivo', 0, '', 0, '1aaaa', 0, '0'),
('20200625235711', 1, 1, 0, '2020-06-25 23:57:11', 0, 1500, '2020-06-25 23:57:11', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'aaaaa', 0, '0'),
('20200625235957', 1, 1, 0, '2020-06-25 23:59:57', 0, 1545, '2020-06-25 23:59:57', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'aaa', 0, '0'),
('20200626000136', 1, 1, 0, '2020-06-26 00:01:36', 0, -1555.78, '2020-06-26 00:01:36', 0, 10, 0, 0, 'efectivo', 0, '', 0, '43', 0, '0'),
('20200626000220', 1, 1, 0, '2020-06-26 00:02:20', 0, -150, '2020-06-26 00:02:20', 0, 10, 0, 0, 'efectivo', 0, '', 0, 'AAA', 0, '0'),
('3620190824124557', 36, 1, 0, '2019-08-24 12:45:57', 0, 73, '2019-08-24 12:48:09', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190831104158', 36, 1, 0, '2019-08-31 10:41:58', 0, 105, '2019-08-31 10:43:29', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190831144240', 36, 1, 0, '2019-08-31 14:42:40', 0, 55, '2019-08-31 14:44:01', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190902143627', 36, 1, 0, '2019-09-02 14:36:27', 0, 20, '2019-09-02 14:37:58', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190902143846', 36, 1, 0, '2019-09-02 14:38:46', 0, 190, '2019-09-02 14:41:13', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190903192401', 36, 1, 0, '2019-09-03 19:24:01', 0, 105, '2019-09-03 19:24:22', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190904151733', 36, 1, 0, '2019-09-04 15:17:33', 0, 55, '2019-09-04 15:18:16', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190905170200', 36, 1, 0, '2019-09-05 17:02:00', 0, 105, '2019-09-05 17:04:32', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190905174326', 36, 1, 0, '2019-09-05 17:43:26', 0, 25, '2019-09-05 17:44:29', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190907205856', 36, 1, 0, '2019-09-07 20:58:56', 0, 110, '2019-09-07 20:59:19', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190910210424', 36, 1, 0, '2019-09-10 21:04:24', 0, 35, '2019-09-10 21:05:06', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190912192426', 36, 1, 0, '2019-09-12 19:24:26', 0, 25, '2019-09-12 19:24:58', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190917153824', 36, 1, 0, '2019-09-17 15:38:24', 0, 20, '2019-09-17 15:38:50', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620190921114147', 36, 1, 0, '2019-09-21 11:41:47', 0, 25, '2019-09-21 11:42:30', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620191002161347', 36, 1, 0, '2019-10-02 16:13:47', 0, 150, '2019-10-02 16:14:12', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620191008162822', 36, 1, 0, '2019-10-08 16:28:22', 0, 165, '2019-10-08 16:28:38', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620191014171954', 36, 1, 0, '2019-10-14 17:19:54', 0, 45, '2019-10-14 17:20:32', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620191019123605', 36, 1, 0, '2019-10-19 12:36:05', 0, 799, '2019-10-19 12:40:12', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620191021195326', 36, 1, 0, '2019-10-21 19:53:26', 0, 110, '2019-10-21 19:54:06', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3620191127100130', 36, 1, 0, '2019-11-27 10:01:30', 0, 230, '2019-11-27 16:14:35', 0, 9, 1, 16, 'efectivo', 0, '3620191127100130', 0, NULL, 1, '0'),
('3620191230164548', 36, 1, 0, '2019-12-30 16:45:48', 0, 23, '2019-12-30 16:46:20', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3620191231162542', 36, 1, 0, '2019-12-31 16:25:42', 0, 23, '2019-12-31 16:29:10', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3620200105205557', 36, 1, 0, '2020-01-05 20:55:57', 0, 19, '2020-01-05 20:56:38', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3620200105205911', 36, 1, 0, '2020-01-05 20:59:11', 0, 19, '2020-01-05 20:59:34', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3620200112165501', 36, 1, 0, '2020-01-12 16:55:01', 0, 23, '2020-01-12 16:55:30', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3620200115190541', 36, 1, 0, '2020-01-15 19:05:41', 0, 133, '2020-01-21 17:39:23', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3620200115190647', 36, 258, 0, '2020-01-15 19:06:47', 0, 330, '2020-01-16 20:04:25', 0, 9, 1, 16, 'efectivo', 0, '3620200115190647', 0, NULL, 0, '0'),
('3620200121195810', 36, 1, 0, '2020-01-21 19:58:10', 0, 90, '2020-01-21 20:00:01', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720190821145559', 37, 1, 0, '2019-08-21 14:55:59', 0, 105, '2019-08-21 14:57:29', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720190822181954', 37, 1, 0, '2019-08-22 18:19:54', 0, 105, '2019-08-22 18:31:49', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720190823151129', 37, 1, 0, '2019-08-23 15:11:29', 0, 45, '2019-08-23 15:12:10', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720190823152104', 37, 1, 0, '2019-08-23 15:21:04', 0, 120, '2019-08-23 15:21:47', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720190827152233', 37, 1, 0, '2019-08-27 15:22:33', 0, 105, '2019-08-27 15:23:59', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720190901110051', 37, 1, 0, '2019-09-01 11:00:51', 0, 105, '2019-09-01 11:02:29', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720190904154428', 37, 1, 0, '2019-09-04 15:44:28', 0, 35, '2019-09-04 15:45:00', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720190905175126', 37, 1, 0, '2019-09-05 17:51:26', 0, 140, '2019-09-05 17:51:56', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720190905180041', 37, 1, 0, '2019-09-05 18:00:41', 0, 110, '2019-09-05 18:01:49', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720190906190751', 37, 1, 0, '2019-09-06 19:07:51', 0, 155, '2019-09-06 19:08:23', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720190915161003', 37, 1, 0, '2019-09-15 16:10:03', 0, 20, '2019-09-15 16:10:28', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720190918130207', 37, 1, 0, '2019-09-18 13:02:07', 0, 20, '2019-09-18 13:02:31', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720190922170015', 37, 1, 0, '2019-09-22 17:00:15', 0, 40, '2019-09-22 17:00:44', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720191003105645', 37, 1, 0, '2019-10-03 10:56:45', 0, 70, '2019-10-03 10:57:14', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720191006131620', 37, 1, 0, '2019-10-06 13:16:20', 0, 25, '2019-10-06 13:21:11', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720191014132916', 37, 1, 0, '2019-10-14 13:29:16', 0, 20, '2019-10-14 13:29:37', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720191018162441', 37, 1, 0, '2019-10-18 16:24:41', 0, 190, '2019-10-18 16:25:46', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720191018162557', 37, 1, 0, '2019-10-18 16:25:57', 0, 73, '2019-10-18 16:26:32', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720191023123718', 37, 1, 0, '2019-10-23 12:37:18', 0, 199, '2019-10-26 20:27:54', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720191209145110', 37, 1, 0, '2019-12-09 14:51:10', 0, 110, '2019-12-09 14:51:44', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720191217175255', 37, 1, 0, '2019-12-17 17:52:55', 0, 70, '2019-12-17 17:53:25', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3720191229132537', 37, 1, 0, '2019-12-29 13:25:37', 0, 60, '2019-12-29 13:26:12', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720191230144723', 37, 1, 0, '2019-12-30 14:47:23', 0, 23, '2019-12-30 14:48:35', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720200103123139', 37, 1, 0, '2020-01-03 12:31:39', 0, 53, '2020-01-03 12:32:11', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720200126123920', 37, 1, 0, '2020-01-26 12:39:20', 0, 19, '2020-01-26 12:39:56', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720200126145305', 37, 1, 0, '2020-01-26 14:53:05', 0, 23, '2020-01-26 14:53:32', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720200131155849', 37, 1, 0, '2020-01-31 15:58:49', 0, 23, '2020-01-31 15:59:31', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720200204163223', 37, 1, 0, '2020-02-04 16:32:23', 0, 23, '2020-02-04 16:32:49', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720200217164916', 37, 1, 0, '2020-02-17 16:49:16', 0, 90, '2020-02-17 16:49:45', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720200217165030', 37, 1, 0, '2020-02-17 16:50:30', 0, 90, '2020-02-17 16:50:54', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720200223134942', 37, 1, 0, '2020-02-23 13:49:42', 0, 110, '2020-02-23 13:50:07', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720200223151012', 37, 1, 0, '2020-02-23 15:10:12', 0, 65, '2020-02-23 15:11:01', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720200622153118', 37, 1, 0, '2020-06-22 15:31:18', 0, 120, '2020-06-22 15:31:48', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3720200624121138', 37, 1, 0, '2020-06-24 12:11:38', 0, 70, '2020-06-24 12:12:31', 0, 1, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820190901113349', 38, 1, 0, '2019-09-01 11:33:49', 0, 1130, '2019-09-01 11:42:25', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3820190901151612', 38, 1, 0, '2019-09-01 15:16:12', 0, 20, '2019-09-01 15:16:33', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3820190916113452', 38, 1, 0, '2019-09-16 11:34:52', 0, 370, '2019-09-16 11:36:16', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3820191101170229', 38, 1, 0, '2019-11-01 17:02:29', 0, 150, '2019-11-01 17:03:13', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3820191113114242', 38, 1, 0, '2019-11-13 11:42:42', 0, 30, '2019-11-13 11:43:09', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3820191113114846', 38, 1, 0, '2019-11-13 11:48:46', 0, 28, '2019-11-13 11:49:10', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3820191206134000', 38, 1, 0, '2019-12-06 13:40:00', 0, 45, '2019-12-06 13:41:44', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 1, '0'),
('3820191230111732', 38, 1, 0, '2019-12-30 11:17:32', 0, 70, '2019-12-30 11:18:13', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200102102438', 38, 1, 0, '2020-01-02 10:24:38', 0, 23, '2020-01-02 10:25:21', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200117132945', 38, 1, 0, '2020-01-17 13:29:45', 0, 89, '2020-01-17 13:35:33', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200123185435', 38, 1, 0, '2020-01-23 18:54:35', 0, 230, '2020-01-23 18:55:47', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200123185653', 38, 1, 0, '2020-01-23 18:56:53', 0, 108, '2020-01-24 17:37:29', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200126135001', 38, 1, 0, '2020-01-26 13:50:01', 0, 350, '2020-01-26 13:51:08', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200126151742', 38, 1, 0, '2020-01-26 15:17:42', 0, 23, '2020-01-26 15:22:31', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200214171445', 38, 1, 0, '2020-02-14 17:14:45', 0, 23, '2020-02-14 17:15:23', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200216144107', 38, 1, 0, '2020-02-16 14:41:07', 0, 25, '2020-02-16 14:41:36', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200223131054', 38, 1, 0, '2020-02-23 13:10:54', 0, 23, '2020-02-23 13:12:17', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200224115303', 38, 1, 0, '2020-02-24 11:53:03', 0, 75, '2020-02-24 11:53:34', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200302103522', 38, 1, 0, '2020-03-02 10:35:22', 0, 19, '2020-03-02 10:35:52', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200312145259', 38, 1, 0, '2020-03-12 14:52:59', 0, 20, '2020-03-12 14:53:32', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200324125724', 38, 1, 0, '2020-03-24 12:57:24', 0, 25, '2020-03-24 12:57:58', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200408185729', 38, 1, 0, '2020-04-08 18:57:29', 0, 19, '2020-04-08 18:57:48', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200412132345', 38, 1, 0, '2020-04-12 13:23:45', 0, 139, '2020-04-12 13:24:09', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200414140742', 38, 1, 0, '2020-04-14 14:07:42', 0, 23, '2020-04-14 14:08:02', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200415171824', 38, 1, 0, '2020-04-15 17:18:24', 0, 120, '2020-04-15 17:19:02', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200420134252', 38, 1, 0, '2020-04-20 13:42:52', 0, 23, '2020-04-20 13:43:12', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200424130204', 38, 1, 0, '2020-04-24 13:02:04', 0, 259, '2020-04-24 13:10:49', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200428105116', 38, 1, 0, '2020-04-28 10:51:16', 0, 70, '2020-04-28 10:51:40', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200519131634', 38, 1, 0, '2020-05-19 13:16:34', 0, 23, '2020-05-19 13:17:02', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200521135408', 38, 1, 0, '2020-05-21 13:54:08', 0, 53, '2020-05-21 13:55:01', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3820200528125918', 38, 1, 0, '2020-05-28 12:59:18', 0, 120, '2020-05-28 12:59:53', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200129202921', 39, 1, 0, '2020-01-29 20:29:21', 0, 19, '2020-01-29 20:30:07', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200211132254', 39, 1, 0, '2020-02-11 13:22:54', 0, 230, '2020-02-11 13:24:03', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200211132413', 39, 1, 0, '2020-02-11 13:24:13', 0, 750, '2020-02-11 13:24:53', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200213170239', 39, 1, 0, '2020-02-13 17:02:39', 0, 70, '2020-02-13 17:08:06', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200215203413', 39, 1, 0, '2020-02-15 20:34:13', 0, 200, '2020-02-15 20:48:49', 0, 9, 1, 16, 'efectivo', 0, '3920200215203413', 0, NULL, 0, '0'),
('3920200305142409', 39, 1, 0, '2020-03-05 14:24:09', 0, 139, '2020-03-05 14:24:47', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200309161829', 39, 1, 0, '2020-03-09 16:18:29', 0, 25, '2020-03-09 16:18:59', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200310182247', 39, 1, 0, '2020-03-10 18:22:47', 0, 75, '2020-03-10 18:23:13', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200314091148', 39, 1, 0, '2020-03-14 09:11:48', 0, 19, '2020-03-14 09:12:13', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200322150148', 39, 1, 0, '2020-03-22 15:01:48', 0, 139, '2020-03-22 15:02:19', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200329161603', 39, 1, 0, '2020-03-29 16:16:03', 0, 23, '2020-03-29 16:16:53', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200405202356', 39, 1, 0, '2020-04-05 20:23:56', 0, 19, '2020-04-05 20:24:21', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200418141934', 39, 1, 0, '2020-04-18 14:19:34', 0, 280, '2020-04-18 14:20:40', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200426144105', 39, 1, 0, '2020-04-26 14:41:05', 0, 46, '2020-04-26 14:41:40', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200428181940', 39, 1, 0, '2020-04-28 18:19:40', 0, 200, '2020-04-28 18:20:05', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200501141336', 39, 1, 0, '2020-05-01 14:13:36', 0, 49, '2020-05-01 14:14:27', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200501141441', 39, 1, 0, '2020-05-01 14:14:41', 0, 25, '2020-05-01 14:15:02', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200503204546', 39, 1, 0, '2020-05-03 20:45:46', 0, 150, '2020-05-03 20:46:07', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200503205110', 39, 1, 0, '2020-05-03 20:51:10', 0, 150, '2020-05-03 20:51:35', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200504203734', 39, 1, 0, '2020-05-04 20:37:34', 0, 25, '2020-05-04 20:37:58', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200507145648', 39, 1, 0, '2020-05-07 14:56:48', 0, 120, '2020-05-07 14:57:08', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200507191940', 39, 1, 0, '2020-05-07 19:19:40', 0, 23, '2020-05-07 19:20:07', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200530154212', 39, 1, 0, '2020-05-30 15:42:12', 0, 35, '2020-05-30 15:42:45', 0, 9, 1, 16, 'transferencia', 0, '3920200530154212', 0, NULL, 0, '0'),
('3920200607181436', 39, 1, 0, '2020-06-07 18:14:36', 0, 300, '2020-06-07 18:15:08', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200615134937', 39, 1, 0, '2020-06-15 13:49:37', 0, 700, '2020-06-15 13:50:14', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0'),
('3920200617175105', 39, 1, 0, '2020-06-17 17:51:05', 0, 25, '2020-06-17 17:51:23', 0, 9, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0');

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
  `um_des` varchar(254) NOT NULL DEFAULT 'NA'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `no. De parte`, `nombre`, `descripcion`, `almacen`, `departamento`, `loc_almacen`, `marca`, `proveedor`, `foto0`, `foto1`, `foto2`, `foto3`, `oferta`, `precio_normal`, `precio_oferta`, `stock`, `tiempo de entrega`, `stock_min`, `stock_max`, `precio_costo`, `cv`, `um`, `um_des`) VALUES
(2, '290514', 'SISTEMA HOTELERO', 'Software para hoteles y moteles ...', 3, 37, 'CLOUD', 'CLTA', 'CLTA', 'product/product_img120190819113358.jpg', 'product/product_img220190819113601.jpg', 'product/product_img320190819113601.jpg', 'product/product_img420190819113601.jpg', 0, 4500, 4300, 4984, 'INMEDIATO', 1000, 10000, 0, '43232300', 'XUN', 'LICENCIA VITALICIA'),
(3, '290515', 'CONTROL DE SOCIOS GOLDEN', 'Sistema hotelero, administra mejor tu hotel o motel. ', 3, 37, 'CLOUD', 'CLTA', 'CLTA', 'product/product_img120190819114221.jpg', 'product/product_img220190819114221.jpg', 'product/product_img320190819114221.jpg', 'product/product_img420190819114221.jpg', 0, 4999, 4600, 4962, 'INMEDIATO', 1000, 10000, 0, '43232300', 'XUN', 'LICENCIA VITALICIA'),
(4, 'rele_v2', 'Circuito Relevador Usb (no/nc), Rele, Relevador', 'torniquetes, chapas electricas, compuertas', 3, 38, 'ZYHC', 'CLTA', 'CLTA', 'product/product_img120190819120614.jpg', 'product/product_img220190819120614.jpg', 'product/product_img320190819120614.jpg', 'product/product_img420190819120614.jpg', 0, 1900, 1800, -15, '1 DIA HABIL', 1, 4, 500, '32101600', 'H87', 'PIEZA'),
(5, '500013-001-103', 'Lector Digital Person 4500 UAERE', 'Lector de huella Usb, control de socios, control de acceso\r\n', 3, 38, '', 'DIGITAL PERSONA', 'DESCONOCIDO', 'product/product_img120190819120837.jpg', 'product/product_img220190819115510.jpg', 'product/product_img320190819115510.jpg', 'product/product_img420190819115510.jpg', 0, 1900, 1800, 479, '1 DIA HABIL', 0, 1000, 0, '43211600', 'H87', 'PIEZA'),
(6, 'PTV_SISTEMA', 'Sistema Venta, Punto De Venta, Red', 'Sistema PTV, Generic', 3, 37, 'CLOUD', 'CLTA', 'CLTA', 'product/product_img120190819115846.jpg', 'product/product_img220190819115846.jpg', 'product/product_img320190819115846.jpg', 'product/product_img420190819115846.jpg', 0, 400, 300, 5000, 'INMEDIATA', 0, 10000, 0, '43232300', 'XUN', 'LICENCIA VITALICIA'),
(8, '740617274707', 'Kingston 32GB SD ', '', 1, 39, 'VITRINA', 'KINGSTON', 'DICOTECH', 'product/product_img120190819181652.jpg', '', '', '', 0, 165, 150, 0, 'INMEDIATO', 1, 6, 70, '01010101', 'H87', 'PIEZA'),
(14, 'T_C_REF', 'Cargador Reforzado Tipo C', '', 1, 39, 'V. VERTICAL', 'GENERICO', '24X7_ONLINE', 'product/product_img120190907150352.jpg', '', '', '', 0, 45, 40, 4, 'INMEDIATO', 2, 20, 19.8, '01010101', 'H87', 'NA'),
(16, '25885', 'CABLE USB V8 MICRO', '', 1, 39, 'V. VERTICAL', 'XCASE', 'DICOTECH', 'product/product_img120190819184119.jpg', '', '', '', 0, 35, 32, 0, 'INMEDIATO', 2, 8, 19, '01010101', 'H87', 'NA'),
(19, 'ZIPER-EAR', 'AUDIFONOS ECONOMICOS', '', 1, 39, 'V. VERTICAL', 'GENERICO', 'DESCONOCIDO', 'product/product_img120190819184719.jpg', '', '', '', 0, 25, 25, 3, 'INMEDIATO', 2, 15, 20, '01010101', 'H87', 'NA'),
(20, 'XOTN30585', 'Turbo Cargador Pared Led Carga Rapida Doble Puerto Usb', '', 1, 39, 'V. VERTICAL', 'GENERICO', '24X7_ONLINE', 'product/product_img120190819184923.jpg', '', '', '', 0, 53, 49, 0, 'INMEDIATO', 2, 6, 24.5, '01010101', 'H87', 'NA'),
(21, 'XDXP29633', 'Gabinete Externo Usb Disco Duro Laptop Sata 2.5 Hasta 500gb', '', 1, 38, 'V. VERTICAL', 'E-ELEGATE', '24X7_ONLINE', 'product/product_img120190819185046.jpg', '', '', '', 0, 110, 99, -1, 'INMEDIATO', 1, 4, 1, '01010101', 'H87', 'NA'),
(22, '7506215916516', 'Mouse Ac-916516 Acteck Ac-916516 Acteck Mougen1810', '', 1, 38, 'V. VERTICAL', 'ACTECK', 'DICOTECH', 'product/product_img120190819185254.jpg', '', '', '', 0, 90, 85, 1, 'INMEDIATO', 2, 8, 53, '01010101', 'H87', 'NA'),
(23, 'RTDG32146', 'Cable Hdmi 5 Metros Reforzado Full Hd 1080p Xbox 360 Lcd', '', 1, 38, 'V. VERTICAL', 'XCASE', '24X7_ONLINE', 'product/product_img120190819185432.jpg', '', '', '', 0, 150, 99, 1, 'INMEDIATO', 1, 1, 39, '01010101', 'H87', 'NA'),
(28, 'kit_ptv', 'Kit Punto De Venta Cajon +lector Base+ Miniprinter ', '', 1, 38, '', 'VARIOS', 'CLTA', 'product/product_img120190820130510.jpg', 'product/product_img220190820130510.jpg', 'product/product_img320190820130510.jpg', 'product/product_img420190820130510.jpg', 0, 2870, 2600, 999, '1 DIA HABIL', 0, 1000, 0, '01010101', 'H87', 'NA'),
(30, '22222', 'SOFTWARE MEDICO – MEDICIS', '', 3, 37, '', 'CLTA', 'CLTA', 'product/product_img120190823133616.jpg', '', '', '', 0, 6900, 6000, 1000, '1 DIA HABIL', 1, 1000, 0, '01010101', 'H87', 'NA'),
(32, '791261080466', 'Taza Automática Auto Mezcladora Térmica Para Café Con Tapa', '', 1, 33, '', 'SELF', 'DESCONOCIDO', 'product/product_img120190826194937.jpg', 'product/product_img220190826194937.jpg', 'product/product_img320190826194937.jpg', 'product/product_img420190826194937.jpg', 0, 175, 150, 2, 'INMEDIATO', 1, 2, 105, '01010101', 'H87', 'NA'),
(33, 'JFCQ38669', 'Taza Multi Usos Tipo Block Construcción Build On', '', 1, 33, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120190826195307.jpg', 'product/product_img220190826195307.jpg', 'product/product_img320190826195307.jpg', 'product/product_img420190826195307.jpg', 0, 230, 210, 1, 'INMEDIATO', 1, 2, 105, '01010101', 'H87', 'NA'),
(34, 'hub-13', 'Hub Usb 2.0 Led 4 Puertos Computadoras Pc Laptop Memorias', '', 1, 38, '', 'E-ELEGATE', 'SLIM_COMPANY', 'product/product_img120190826195844.jpg', 'product/product_img220190826195844.jpg', 'product/product_img320190826195844.jpg', 'product/product_img420190826195844.jpg', 0, 70, 60, -1, 'INMEDIATO', 1, 3, 35, '01010101', 'H87', 'NA'),
(35, '', 'Soporte Base Holder Celular Auto Carro Universal', '', 1, 39, '', 'E-ELEGATE', 'ELEGATE', 'product/product_img120190826200307.jpg', 'product/product_img220190826200307.jpg', 'product/product_img320190826200307.jpg', 'product/product_img420190826200307.jpg', 0, 60, 55, 0, 'INMEDIATO', 1, 6, 30, '01010101', 'H87', 'NA'),
(36, '', 'Cortadora De Chip Sim A Micro Sim Y Nano Sim + Adaptadores', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120190826200600.jpg', '', '', '', 0, 50, 50, 1, 'INMEDIATO', 1, 1, 26, '01010101', 'H87', 'NA'),
(37, '', 'Kit Desarmador Herramientas 7 En 1 Reparacion Celulares Torx', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120190826200733.jpg', '', '', '', 0, 110, 99, 0, 'INMEDIATO', 1, 6, 55, '01010101', 'H87', 'NA'),
(38, 'AKCI30563', 'Adaptador Otg ', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200620151351.jpg', '', '', '', 0, 23, 16, 13, 'INMEDIATO', 2, 10, 7.8, '01010101', 'H87', 'NA'),
(39, '', 'Cable Adaptador Rs232 Serial Db9 Macho A Usb 2.0 Macho', '', 1, 38, '', 'E-ELEGATE', 'ELEGATE', 'product/product_img120190826201200.jpg', '', '', '', 0, 120, 115, 1, 'INMEDIATO', 1, 4, 60, '01010101', 'H87', 'NA'),
(40, '', 'Manija Soporte Gamepad Gatillos Universal 5 En 1 Smartphone', '', 1, 39, '', 'E-ELEGATE', 'ELEGATE', 'product/product_img120190826201414.jpg', 'product/product_img220190826201414.jpg', 'product/product_img320190826201414.jpg', 'product/product_img420190826201414.jpg', 0, 90, 80, 0, 'INMEDIATO', 2, 10, 63, '01010101', 'H87', 'NA'),
(41, 'SATA II', 'Cable Sata Para Datos Disco Duro Quemador', '', 2, 38, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120190826202129.jpg', '', '', '', 0, 60, 50, 1, 'INMEDIATO', 1, 1, 30, '01010101', 'H87', 'NA'),
(42, '', 'DHL GUIA XPRESS', '', 3, 33, '', 'DHL', 'DHL', 'product/product_img120190906134246.jpg', '', '', '', 0, 199, 199, 1000, '1 DIA HABIL', 0, 0, 177, '01010101', 'H87', 'NA'),
(43, '', 'CLAVIJA CARGADOR VIAJE TRIPLE USB RAPIDA 3.1A', '', 1, 39, 'VITRINA', 'GENERICO', 'ANDRES DANIEL MANZANO RODRIGUEZ', 'product/product_img120191007193307.jpg', '', '', '', 0, 66, 50, 1, 'INMEDIATO', 0, 4, 33, '01010101', 'H87', 'NA'),
(44, '', 'Multicargador Universal Laptop 8 Puntas 12 - 24v', '', 1, 38, 'vitrina', 'GENERICO', 'ANDRES DANIEL MANZANO RODRIGUEZ', 'product/product_img120191007193833.jpg', 'product/product_img220191007193833.jpg', 'product/product_img320191007193833.jpg', 'product/product_img420191007193833.jpg', 0, 281, 230, 1, 'INMEDIATO', 1, 4, 108, '01010101', 'H87', 'NA'),
(46, '', 'Sistema WEB Cotización, Remisión, Facturación e Inventario', '', 3, 37, '', 'CLTA', 'CLTA', 'product/product_img120191111175402.jpg', '', '', '', 0, 6000, 60000, 1000, 'INMEDIATO', 0, 0, 0, '01010101', 'H87', 'NA'),
(47, 'mag-350', 'IMAN MAGNETICO PARA PUERTA', '', 3, 33, 'RSELL', 'VARIOS', 'DESCONOCIDO', 'product/product_img120200305095158.jpg', '', '', '', 0, 2800, 2700, 2, '1 DIA HABIL', 1, 1, 1600, '01010101', 'H87', 'NA'),
(48, 'SOP-TECT-290513', 'ASISTENCIA TECNICA', 'SPORTE TECNICO POR TIEMPO, EL VALOR INGRESADO REPRESENTA EL COSTO POR UN MINUTO', 3, 37, 'CONMUTADOR, WHATSAPP, ETC ', 'SOPORTE', 'SOPORTE', 'product/product_img120200615121259.jpg', '', '', '', 0, 8.12, 7, 999999911, 'INMEDIATO', 0, 0, 1, '01010101', 'H87', 'NA'),
(49, 'ACT', 'ACTA DE NACIMIENTO MAYOREO', '', 3, 33, '', '', '', 'product/product_img120200620161518.jpg', '', '', '', 0, 90, 80, 999996, 'INMEDIATO', 10, 100, 50, '01010101', 'H87', 'NA'),
(50, 'EDIT,UPDATE-CURP', 'CORRECCION, ALTA CURP MAYOREO', '', 3, 33, '', '', '', 'product/product_img120200620161546.jpg', '', '', '', 0, 350, 300, 999999, 'INMEDIATO', 1, 10, 250, '01010101', 'H87', 'NA'),
(51, 'hub-14', 'Hub Usb 2.0 Led 7 Puertos Computadoras Pc Laptop Memorias', '', 1, 38, '', 'E-ELEGATE', 'ELEGATE', 'product/product_img120200620151139.jpg', '', '', '', 0, 85, 85, 2, 'INMEDIATO', 1, 3, 45, '01010101', 'PZ', 'NA'),
(52, 'T_C_EXT_3_MTS', 'Cargador eXTENSION Tipo C c. rapida 3 mTS', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200620151832.jpg', '', '', '', 0, 75, 75, 1, 'INMEDIATO', 1, 3, 45, '01010101', 'UD', 'NA'),
(53, 'OJUF34697', 'TRAVEL CHARGER 1USB', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200620152443.jpg', '', '', '', 0, 75, 75, 3, 'INMEDIATO', 2, 6, 35, '01010101', 'H87', 'NA'),
(54, 'SHANDIAN_USB', 'MICRO SD SHANDIAN 16 gb', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200620152705.jpg', '', '', '', 0, 120, 120, 0, 'INMEDIATO', 2, 4, 68, '01010101', 'H87', 'NA'),
(55, 'SHANDIAN 32 ', 'MICRO SD SHANDIAN 32 GB', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200620152834.jpg', '', '', '', 0, 150, 150, 1, 'INMEDIATO', 1, 4, 70, '01010101', 'H87', 'NA'),
(56, 'USB_JASTER', 'Memoria Usb 16gb Jaster ', '', 1, 39, '', 'GENERICO', 'DESCONOCIDO', 'product/product_img120200620153310.jpg', '', '', '', 0, 120, 120, 5, 'INMEDIATO', 2, 4, 68, '01010101', 'PZ', 'NA'),
(57, 'USB-ANIM', 'USB ANIMADOS 16 GB', 'descripcion ss', 1, 38, 'VI_MEDIO\r\n', 'MARCA GEN', 'PROVEEDOR INC', 'product/product_img120200620161331.jpg', '', '', '', 0, 150, 150, 4, 'INMEDIATO', 1, 2, 80, '01010101', 'H87', 'NA'),
(58, 'EW-RED-EAR', 'EAGLE WARRIOT AUDIFONOS', '', 1, 33, '', '', '', 'product/product_img120200620170020.jpg', '', '', '', 0, 290, 290, 2, 'INMEDIATO', 2, 6, 160, '01010101', 'H87', 'NA');

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
(1, 19, 2, 4, 'VIDRIO ENTRADA', 10, 2),
(3, 14, 2, 1, 'VIDRIO ENTRADA', 10, 2),
(4, 16, 2, 0, 'VIDRIO ENTRADA', 12, 4),
(5, 20, 2, 0, 'VIDRIO ENTRADA', 4, 1),
(7, 8, 2, 0, 'VIDRIO ENTRADA', 4, 1),
(10, 34, 2, 0, '', 1, 1),
(12, 39, 2, 1, '', 1, 1),
(13, 38, 2, -6, '', 1, 1),
(14, 37, 2, 0, '', 1, 1),
(15, 40, 2, -1, '', 1, 1),
(16, 43, 2, 1, 'PUERTA', 2, 1),
(17, 21, 2, 1, '', 2, 1),
(18, 57, 2, 6, '', 3, 1),
(19, 55, 2, 1, '', 2, 1),
(20, 54, 2, 1, '', 3, 1),
(21, 56, 2, 7, '', 4, 1),
(22, 38, 2, 4, '', 10, 1),
(23, 53, 2, 1, '', 2, 1);

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
-- Estructura de tabla para la tabla `product_venta`
--

CREATE TABLE `product_venta` (
  `id` int(11) NOT NULL,
  `folio_venta` varchar(254) NOT NULL,
  `product` int(11) DEFAULT NULL,
  `unidades` int(11) NOT NULL,
  `precio` float NOT NULL,
  `product_sub` int(11) DEFAULT NULL,
  `p_generico` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product_venta`
--

INSERT INTO `product_venta` (`id`, `folio_venta`, `product`, `unidades`, `precio`, `product_sub`, `p_generico`) VALUES
(3, '120190819143328', 3, 1, 4600, NULL, NULL),
(17, '120190820121431', 3, 1, 4600, NULL, NULL),
(18, '120190820121431', 5, 2, 1900, NULL, NULL),
(19, '120190820121431', 4, 2, 1058.62, NULL, NULL),
(22, '120190820190330', 3, 1, 4600, NULL, NULL),
(23, '120190820190330', NULL, 1, -805, NULL, 'COMISION ML'),
(60, '3720190823151129', 14, 1, 45, NULL, NULL),
(63, '3620190824124557', 20, 1, 53, 5, NULL),
(75, '120190829201049', NULL, 1, 180, NULL, 'Cable de energia for pC'),
(84, '120190829205530', NULL, 1, 190, NULL, 'OPTIMIZACION DE SISTEMA OPERATIVO '),
(86, '3620190831144240', 19, 1, 55, 1, NULL),
(88, '120190831213732', NULL, 1, 300, NULL, 'INSTALACION E. NUEVOS'),
(90, '3820190901113349', NULL, 1, 480, NULL, 'unidad cd'),
(91, '3820190901113349', NULL, 1, 50, NULL, 'instalación de unidad cd '),
(92, '3820190901113349', NULL, 1, 450, NULL, 'formateo'),
(93, '3820190901113349', NULL, 1, 150, NULL, 'respaldo de información '),
(96, '3620190902143846', NULL, 1, 190, NULL, 'actulizacion office '),
(102, '3620190904151733', 19, 1, 55, 1, NULL),
(103, '3720190904154428', 16, 1, 35, NULL, NULL),
(104, '120190904183621', NULL, 1, 300, NULL, 'Instalación equipos nuevos'),
(105, '120190904183621', NULL, 5, 20, NULL, 'Limpieza virus USB'),
(108, '120190905085759', 3, 1, 4800, NULL, NULL),
(113, '3620190905174326', 38, 1, 25, 13, NULL),
(115, '3720190905180041', 21, 1, 110, NULL, NULL),
(128, '3720190906190751', 38, 1, 25, NULL, NULL),
(129, '120190907112858', NULL, 1, 190, NULL, 'Paqueteria office'),
(130, '120190907112858', NULL, 1, 100, NULL, 'Antivirus Karspersky free'),
(138, '120190907143803', 16, 1, 35, NULL, NULL),
(139, '120190907143803', 20, 1, 53, NULL, NULL),
(141, '120190907201649', NULL, 1, -10, NULL, 'DESCUENTO'),
(142, '3620190907205856', 19, 2, 55, 1, NULL),
(148, '120190909205319', NULL, 1, 60, NULL, 'Diagnostico laptop compaq presario CQ56'),
(149, '3620190910210424', 16, 1, 35, 4, NULL),
(156, '3620190912192426', 38, 1, 25, 13, NULL),
(164, '120190912210242', 8, 1, 165, NULL, NULL),
(175, '3820190916113452', NULL, 1, 370, NULL, 'limpieza, paqueteria office, antivirus.'),
(176, '120190916123500', NULL, 1, 200, NULL, 'Reiniciar/Restaurar Sistema'),
(177, '120190916123500', NULL, 1, 150, NULL, 'Instalacion suite office'),
(178, '120190916123500', NULL, 1, 49.99, NULL, 'Antivirus'),
(179, '120190916193937', 23, 1, 150, NULL, NULL),
(180, '120190916221358', NULL, 1, 4800, NULL, 'SISTEMA CONTROL DE SOCIOS '),
(181, '120190917120915', 34, 1, 70, NULL, NULL),
(183, '120190917192301', NULL, 1, 0, NULL, 'IMPRESORA REVIZAR RODILLOS, NO JALA LA HOJA'),
(187, '3620190921114147', 38, 1, 25, 13, NULL),
(189, '120190921153718', 2, 1, 4500, NULL, NULL),
(203, '120190925202625', NULL, 1, 280, NULL, 'Instalacion basica '),
(206, '120190926141326', 38, 1, 25, NULL, NULL),
(207, '120190926141326', 35, 1, 60, NULL, NULL),
(211, '120190926205952', 4, 4, 1900, NULL, NULL),
(212, '120190927122730', NULL, 1, 4500, NULL, 'Lic. Vitalicia sistema hotelero '),
(213, '120190927195056', NULL, 18, 5, NULL, 'Escaneo de documentos'),
(214, '120190927195056', NULL, 1, 10, NULL, 'Envio de correo electronico'),
(217, '120190928145049', 2, 1, 4500, NULL, NULL),
(220, '120190928164919', 3, 1, 4800, NULL, NULL),
(229, '120190929102555', 3, 1, 4800, NULL, NULL),
(237, '120190930114626', NULL, 1, 180, NULL, 'Configuracion de printer'),
(239, '120190925093148', NULL, 1, 400, NULL, 'SEPARAR REPORTE POR CONCEPTO ANTCP. 50 %'),
(240, '120190925093148', NULL, 1, 225, NULL, 'MONTO TOTAL Y NUMEROS DE MOVIMIENTOS EN REPORTES ANTICIPO 50 %'),
(242, '120190925093148', NULL, 1, 300, NULL, 'REPORTE DE CLIENTES POR SEXO Y MUNICIPIO ANTICIPO 50 %'),
(243, '120190925093148', NULL, 1, 200, NULL, 'AGRAGAR CAMPO SEXO Y MUNICIPIO EN CLIENTES ANTICIPO 50 %'),
(260, '3620191002161347', 40, 1, 150, 15, NULL),
(261, '3720191003105645', 34, 1, 70, NULL, NULL),
(267, '120191004195727', NULL, 27, 8, NULL, 'impresiones color'),
(268, '120191004195727', NULL, 34, 0.7, NULL, 'impresiones bn mayoreo'),
(270, '120191005195335', 37, 1, 110, NULL, NULL),
(271, '3720191006131620', 38, 1, 25, NULL, NULL),
(272, '120191006181905', NULL, 1, 480, NULL, 'actualización sistema control de socios.  '),
(274, '120191007150313', NULL, 1, 100, NULL, 'generico'),
(286, '3620191008162822', 8, 1, 165, 7, NULL),
(290, '120191011135643', NULL, 1, 4500, NULL, 'Licencia Sistema Hotelero'),
(291, '120191011192654', NULL, 1, 350, NULL, 'INSTALACION BASICA'),
(292, '120191011192654', NULL, 1, 350, NULL, 'fORMATEO DE EQUIPO'),
(293, '120191014113426', NULL, 1, 400, NULL, 'PRODUCTO SEPARAR REPORTE POR CONCEPTO '),
(294, '120191014113426', NULL, 1, 200, NULL, 'MONTO TOTAL Y NUMEROS DE MOVIMIENTOS EN REPORTES '),
(295, '120191014113426', NULL, 1, 300, NULL, 'REPORTE DE CLIENTES POR SEXO Y MUNICIPIO'),
(296, '120191014113426', NULL, 1, 225, NULL, 'AGRAGAR CAMPO SEXO Y MUNICIPIO EN CLIENTES'),
(298, '120191014165302', NULL, 1, 290, NULL, 'Actualizacion sistema hotelero'),
(299, '120191014165302', NULL, 461, 2.32, NULL, 'folios facturas'),
(300, '3620191014171954', 14, 1, 45, 3, NULL),
(301, '120191014193713', 35, 1, 60, NULL, NULL),
(302, '120191016124524', 3, 1, 4800, NULL, NULL),
(303, '120191016215055', NULL, 1, 1900, NULL, 'Lector de huellas digital person 4500 uaere'),
(304, '120191016215055', NULL, 1, 100, NULL, 'Diagnostico y configuración '),
(309, '120191017195945', 40, 1, 150, NULL, NULL),
(310, '3720191018162441', NULL, 1, 190, NULL, 'AUDIFONOS'),
(312, '3720191018162557', 20, 1, 53, NULL, NULL),
(313, '120191011135643', NULL, 1, 950, NULL, 'Anualidad cfdi.  50 % descuento '),
(314, '3620191019123605', NULL, 1, 549, NULL, 'Teclado para laptop HP'),
(315, '3620191019123605', NULL, 1, 250, NULL, 'Montaje de teclado en laptop HP'),
(316, '120191020164646', 43, 1, 66, NULL, NULL),
(318, '120191020164646', NULL, 1, 40, NULL, 'Cable USB'),
(319, '3620191021195326', 37, 1, 110, 14, NULL),
(323, '120191022111046', NULL, 1, 4600, NULL, 'Sistema control de socios precio anterior.  '),
(324, '120191022145144', NULL, 1, 2000, NULL, 'Modulo tarifas y folios en reportes Z'),
(359, '120191029181000', NULL, 1, 4500, NULL, 'SISTEMA HOTELERO LICENCIA.  '),
(368, '120191030143747', NULL, 1, 950, NULL, 'Anualidad CFDI 50 % descuento'),
(370, '120191101093802', NULL, 1, 1800, NULL, 'Anualidad CFDI'),
(371, '3820191101170229', 40, 1, 150, NULL, NULL),
(375, '120191105205941', NULL, 1, 480, NULL, 'Actualización, Sistema control de socios'),
(376, '120191107163213', NULL, 1, 480, NULL, 'Actualización control de socios.  '),
(377, '120191108193425', 3, 1, 4800, NULL, NULL),
(404, '3820191113114846', NULL, 1, 28, NULL, 'usb micro'),
(405, '120191113223531', NULL, 1, 100, NULL, 'Anualidad correo electronico'),
(406, '120191114005331', NULL, 1, 480, NULL, 'Reinstalacion de sistema control de socios'),
(409, '120191114180220', NULL, 1, 200, NULL, 'Instalacion de 18 drivers en pc'),
(410, '120191116151736', NULL, 1, 1831.32, NULL, 'Software tallez lic. vitalica'),
(412, '120191119190512', 3, 1, 4800, NULL, NULL),
(414, '120191119190512', 5, 1, 1900, NULL, NULL),
(415, '120191119190512', 4, 1, 1900, NULL, NULL),
(416, '120191119235516', NULL, 1, 300, NULL, 'Optimización y limpieza de windows os.  '),
(420, '120191121122200', 2, 1, 4500, NULL, NULL),
(421, '120191121122456', NULL, 1, 641, NULL, 'reporte TXT o CSV'),
(422, '120191121122456', NULL, 1, 890, NULL, 'Agregar campos, pais, f. nacimiento, genero, canal de reserva'),
(424, '120191121122456', NULL, 1, 400, NULL, 'Autogenerar Archivo y dejarlo en pc'),
(425, '120191121122456', NULL, 1, 400, NULL, 'Subir dinero a ftp '),
(427, '120191122200257', NULL, 1, 8, NULL, 'Impresion color'),
(428, '120191123103040', 3, 1, 4800, NULL, NULL),
(429, '120191123103040', 5, 1, 1900, NULL, NULL),
(430, '120191125155907', 3, 1, 4800, NULL, NULL),
(431, '120191126104315', NULL, 1, 199, NULL, 'Soporte tecnico'),
(433, '3620191127100130', NULL, 1, 230, NULL, 'Instalar microsoft office'),
(434, '120191127101251', 3, 1, 4800, NULL, NULL),
(435, '120191127101251', 4, 2, 1900, NULL, NULL),
(436, '120191127121217', 3, 1, 4800, NULL, NULL),
(439, '120191128095310', 3, 1, 4800, NULL, NULL),
(441, '120191122200257', NULL, 25, 8, NULL, 'Impresiones color'),
(442, '120191122200257', NULL, 4, 1, NULL, 'Impresiones BN'),
(443, '120191122200257', NULL, 6, 0.5, NULL, 'Copias TC'),
(444, '120191122200257', NULL, 6, 1, NULL, 'Impresiones BN'),
(445, '120191122200257', NULL, 1, 20, NULL, 'Uso internet'),
(446, '120191122200257', NULL, 7, 0.5, NULL, 'Copias TC'),
(447, '120191122200257', NULL, 3, 1, NULL, 'Impresiones BN'),
(448, '120191122200257', NULL, 2, 1, NULL, 'Impresiones BN'),
(449, '120191122200257', NULL, 7, 0.5, NULL, 'Impresiones BN'),
(451, '120191128191557', NULL, 1, 8, NULL, 'Impresion color'),
(452, '120191128191557', NULL, 25, 8, NULL, 'Impresion color'),
(453, '120191128191557', NULL, 4, 1, NULL, ' Impresiones BN'),
(454, '120191128191557', NULL, 6, 0.5, NULL, ' Copias TC'),
(455, '120191128191557', NULL, 6, 1, NULL, ' Impresiones BN'),
(456, '120191128191557', NULL, 1, 20, NULL, ' Uso internet'),
(458, '120191128191557', NULL, 3, 1, NULL, ' Impresiones BN'),
(459, '120191128191557', NULL, 2, 1, NULL, ' Impresiones BN '),
(460, '120191128191557', NULL, 7, 1, NULL, 'Impresiones BN'),
(461, '120191201121446', NULL, 1, 230, NULL, 'Instalacion de office'),
(463, '120191204145033', 28, 1, 2870, NULL, NULL),
(465, '3820191206134000', NULL, 1, 45, NULL, 'cable usb naranja con rayitas negras'),
(470, '3720191209145110', 21, 1, 110, NULL, NULL),
(471, '120191211172238', 3, 1, 4800, NULL, NULL),
(472, '120191211172238', 4, 1, 1900, NULL, NULL),
(473, '120191211172238', 5, 1, 1900, NULL, NULL),
(474, '120191212182812', NULL, 1, 780, NULL, 'Código Fuente Genera Pdf De Xml Cfdi 3.3 - C#'),
(475, '120191212203154', NULL, 3, 7, NULL, 'Impresion color'),
(476, '120191212203154', NULL, 5, 7, NULL, 'Impresion color'),
(477, '120191212203154', NULL, 17, 7, NULL, 'Impresion color'),
(478, '120191212203154', NULL, 21, 7, NULL, 'Impresion Color   '),
(482, '120191215121646', NULL, 1, 116, NULL, 'Instalación y configuración dvr'),
(483, '120191215121646', NULL, 1, 812, NULL, 'Disco duro hdd 500Gb 3.5'),
(484, '120191215121646', NULL, 1, 3365, NULL, 'Dvr 16 canales dahua '),
(496, '3720191217175255', 34, 1, 70, NULL, NULL),
(500, '120191219190531', NULL, 17, 7, NULL, 'Impresiones color '),
(501, '120191220114310', NULL, 1, 4800, NULL, 'Sistema control de socios '),
(502, '120191221130642', NULL, 1, 300, NULL, 'Sucurales inventarios'),
(503, '120191221130642', NULL, 1, 400, NULL, 'Sucursal productos venta directa'),
(504, '120191221130642', NULL, 1, 400, NULL, 'Sucursal productos finanzas'),
(505, '120191221130642', NULL, 1, 500, NULL, 'Modulo gestion sucursales'),
(506, '120191221130642', NULL, 1, 0, NULL, 'Actualizacion nueva version'),
(507, '120191222191800', 3, 1, 4800, NULL, NULL),
(508, '120191223101413', NULL, 1, 580, NULL, 'Actualización control de socios '),
(509, '120191223121908', NULL, 1, 4800, NULL, 'Control de socios '),
(510, '120191223121908', NULL, 1, 1900, NULL, 'Relevador usb '),
(511, '120191223191852', NULL, 1, 700, NULL, 'Disco duro ssd 120 GB'),
(512, '120191223191852', NULL, 1, 100, NULL, 'Gabinete Medio USO'),
(513, '120191223191852', NULL, 1, 500, NULL, 'mantenimiento a equipo de computo'),
(515, '120191224090514', NULL, 1, 2464, NULL, 'Kit ptv 12 % descuento '),
(516, '120191224090514', NULL, 1, 2400, NULL, 'Sistema control socios. 50 % descuento.   '),
(517, '120191226110834', NULL, 1, 4500, NULL, 'Sistema hotelero lic'),
(518, '120191226133437', NULL, 1, 580, NULL, 'Actualización control de socios.  '),
(520, '120191227183100', NULL, 1, 4800, NULL, 'Sistema control de socios Sistema control de socios Lic'),
(521, '120191227193742', NULL, 1, 4800, NULL, 'Sistema control de socio'),
(522, '3720191229132537', 35, 1, 60, NULL, NULL),
(523, '3820191230111732', 34, 1, 70, 10, NULL),
(524, '3720191230144723', 38, 1, 23, NULL, NULL),
(525, '3620191230164548', 38, 1, 23, 13, NULL),
(526, '120191231095013', NULL, 1, 1276, NULL, 'Modificaciones, segun lo acordado'),
(527, '120191231145118', NULL, 1, 5800, NULL, 'Sistema radio taxi + 1 identificador'),
(528, '120191231145118', NULL, 2, 1000, NULL, 'identificador de llamada'),
(529, '3620191231162542', 38, 1, 23, 13, NULL),
(530, '3820200102102438', 38, 1, 23, 13, NULL),
(531, '120200102145902', NULL, 1, 4500, NULL, 'Sistema hotelero Lic vitalicia '),
(532, '120200102145902', NULL, 1, 0, NULL, '1 mes Facturación electrónica gratis '),
(533, '120200103112713', 3, 1, 4800, NULL, NULL),
(534, '120200103112713', 5, 1, 1900, NULL, NULL),
(535, '120200103112713', NULL, 1, 480, NULL, 'Lector de codigo de barras'),
(536, '120200103112713', NULL, 2, 200, NULL, 'Envios por paqueteria'),
(537, '3720200103123139', 20, 1, 53, NULL, NULL),
(538, '120200103144631', 3, 1, 4800, NULL, NULL),
(539, '120200103162126', NULL, 1, 2870, NULL, 'Kit Punto De Venta lector de barras  , impresora cajón '),
(540, '120200103162126', NULL, 1, 1900, NULL, 'Lector de huellas '),
(542, '120200105121047', NULL, 1, 4800, NULL, 'Sistema control de socios.  '),
(543, '120200105140748', NULL, 1, 4800, NULL, 'Control de socios Lic. Vitalicia '),
(544, '3620200105205557', NULL, 1, 19, NULL, 'CABLE SAMSUNG'),
(545, '3620200105205911', NULL, 1, 19, NULL, 'CABLE SAMSUNG'),
(546, '120200107203605', 3, 1, 4800, NULL, NULL),
(547, '120200107203605', 5, 1, 1900, NULL, NULL),
(548, '120200110093529', 3, 1, 4800, NULL, NULL),
(549, '120200111110951', NULL, 20, 9, NULL, 'Imp color'),
(550, '120200104175315', NULL, 1, 25, NULL, 'cable usb'),
(551, '3620200112165501', 38, 1, 23, 13, NULL),
(552, '120200114134955', 4, 3, 1900, NULL, NULL),
(553, '120200114134955', 3, 2, 4800, NULL, NULL),
(554, '120200115120846', NULL, 1, 4800, NULL, 'Control de socios Lic vitalicia'),
(555, '120200115134352', NULL, 1, 4800, NULL, 'Control de socios'),
(556, '120200115134352', NULL, 1, 1900, NULL, 'Lector de huella'),
(557, '3620200115190647', NULL, 1, 330, NULL, 'SERVICIO DE INSTALACION PAQUETERIA OFFICE,ANTIVIRUS Y ACROBAT READER '),
(558, '120200116204713', NULL, 1, 4500, NULL, ' Sistema control Hotelero licencia'),
(559, '120200117130324', NULL, 1, 4800, NULL, 'Control de socios licencia vitalicia'),
(560, '3820200117132945', 43, 1, 66, 16, NULL),
(561, '3820200117132945', NULL, 1, 23, NULL, 'cable usb azul'),
(562, '120200118115214', NULL, 1, 2998, NULL, 'Procesador AMD Ryzen 3 2200G'),
(563, '120200118115214', NULL, 1, 2200, NULL, 'Motherboard Am4 A320m-s2h Tarjeta Madre Gigabyte Amd Ddr4'),
(564, '120200118115214', NULL, 1, 1200, NULL, 'Memoria RAM 8 GB 1x8GB Adata AD4S240038G17-S'),
(565, '120200118115214', NULL, 1, 900, NULL, 'Disco sólido interno Kingston A400 SA400S37/120G 120GB'),
(566, '120200118115214', NULL, 1, 1100, NULL, 'Gabinete disponible'),
(567, '120200118115214', NULL, 1, 2200, NULL, 'Monitor 17 Pulg Wide Disponible LG, HP, Samsung, Acteck'),
(568, '120200118115214', NULL, 1, 500, NULL, 'Envio a domicilio'),
(569, '120200118115214', NULL, 1, 299, NULL, 'Instalacion de compaq'),
(570, '120200118142448', 3, 1, 4800, NULL, NULL),
(571, '120200118142448', 5, 1, 1900, NULL, NULL),
(572, '3620200115190541', 21, 1, 110, NULL, NULL),
(573, '3620200115190541', 38, 1, 23, NULL, NULL),
(574, '3620200121195810', 40, 1, 90, 15, NULL),
(576, '3820200123185435', NULL, 1, 230, NULL, 'recibi computadora'),
(578, '120200124105728', 3, 1, 4800, NULL, NULL),
(579, '120200124105728', 4, 1, 1900, NULL, NULL),
(580, '120200124105728', 5, 1, 1900, NULL, NULL),
(586, '3820200123185653', 20, 1, 53, NULL, NULL),
(587, '3820200123185653', NULL, 1, 55, NULL, 'Cargador de lunita'),
(588, '120200124201751', 2, 1, 4500, NULL, NULL),
(589, '120200126111015', NULL, 4, 1738.84, NULL, 'FireWall Lan WIfi'),
(590, '120200126111015', NULL, 4, 348, NULL, 'Configuracion Firewall'),
(591, '3720200126123920', NULL, 1, 19, NULL, 'Cable USB blanco'),
(593, '3820200126135001', NULL, 1, 350, NULL, 'laptop hp'),
(594, '3720200126145305', NULL, 1, 23, NULL, 'ADAPTADOR OTG'),
(595, '3820200126151742', NULL, 1, 23, NULL, 'mini adaptador'),
(596, '120200127175015', 2, 1, 4500, NULL, NULL),
(604, '3920200129202921', NULL, 1, 19, NULL, 'cable cargador'),
(605, '120200129214930', NULL, 1, 4999, NULL, 'Control de socios Lic.  Vitalicia '),
(607, '120200130143214', 2, 1, 4500, NULL, NULL),
(608, '120200131113725', NULL, 1, 4500, NULL, 'sistema radio taxi '),
(609, '120200131113725', NULL, 1, 1300, NULL, 'Identificadro de llamada rj11'),
(610, '120200131114349', 3, 1, 4999, NULL, NULL),
(611, '120200131114349', 5, 1, 1900, NULL, NULL),
(612, '120200131114349', 28, 1, 2870, NULL, NULL),
(613, '3720200131155849', 38, 1, 23, NULL, NULL),
(614, '3720200204163223', 38, 1, 23, NULL, NULL),
(615, '120200205122840', NULL, 1, 3000, NULL, 'Licencia Sistema Estacionamiento'),
(617, '120200206100410', NULL, 1, 4999, NULL, 'Control de socios golden'),
(618, '120200206100410', NULL, 1, 1928, NULL, 'Lector digital person 4500 uaere '),
(619, '120200206100410', NULL, 1, 1900, NULL, 'Circuito relevador '),
(620, '120200206100410', NULL, 1, 2800, NULL, 'Chapa magnética.  '),
(621, '120200207130612', 3, 1, 4900, NULL, NULL),
(622, '120200207130612', 5, 1, 1928, NULL, NULL),
(623, '120200207130612', 4, 1, 1900, NULL, NULL),
(624, '120200210122304', 3, 1, 4800, NULL, NULL),
(625, '120200211003703', NULL, 1, 4500, NULL, 'Sistema hotelero. '),
(626, '3920200211132254', NULL, 1, 230, NULL, 'instalación de paqueteria office'),
(627, '3920200211132413', NULL, 1, 750, NULL, 'reparación de teclado'),
(628, '120200211200422', 3, 1, 4999, NULL, NULL),
(629, '120200211200422', 4, 1, 1900, NULL, NULL),
(630, '120200211200422', 5, 1, 1900, NULL, NULL),
(631, '3920200213170239', NULL, 1, 70, NULL, 'usb de varias entradas '),
(632, '3820200214171445', 38, 1, 23, 13, NULL),
(633, '120200214191541', NULL, 121, 0.6, NULL, 'Copías TC'),
(634, '120200215121630', 3, 1, 4999, NULL, NULL),
(635, '120200215121630', 4, 1, 1900, NULL, NULL),
(636, '120200215121630', 5, 1, 1900, NULL, NULL),
(637, '3920200215203413', NULL, 1, 200, NULL, 'inst de mini tap, inst de oficce y anti virus '),
(638, '3820200216144107', NULL, 1, 25, NULL, 'usb color azul entrada delgada'),
(639, '3720200217164916', 22, 1, 90, NULL, NULL),
(640, '3720200217165030', 40, 1, 90, NULL, NULL),
(641, '120200217223930', 2, 1, 4500, NULL, NULL),
(642, '120200217223930', NULL, 1, 1900, NULL, 'Anualidad CFDI'),
(643, '120200218131603', NULL, 1, 5500, NULL, 'Sistema lic. vitalicia Web Inventarios'),
(644, '120200218131603', NULL, 1, 1000, NULL, 'Hosting Anualidad'),
(645, '120200219111106', NULL, 1, 4999, NULL, 'Lic.  Control de socios '),
(646, '120200219164131', NULL, 503, 2.32, NULL, 'Servicio de timbrado a la fecha.'),
(656, '120200221110215', NULL, 1, 1900, NULL, 'Anualidad CFDI , CABB891111CL8'),
(657, '120200222191451', 2, 1, 4500, NULL, NULL),
(658, '3820200223131054', NULL, 1, 23, NULL, 'adaptador de usb para celular'),
(659, '3720200223134942', 37, 1, 110, NULL, NULL),
(660, '3720200223151012', NULL, 1, 65, NULL, 'cargador de lunita '),
(661, '120200223223835', 3, 1, 4999, NULL, NULL),
(662, '120200223223835', NULL, 1, 100, NULL, 'Anualidad Emails'),
(663, '3820200224115303', NULL, 1, 75, NULL, 'cargador travel charger'),
(664, '120200224140712', 3, 1, 5000, NULL, NULL),
(665, '120200224141101', NULL, 1, 100, NULL, 'Anualidad SendMAil. fol 120200223223835'),
(666, '120200225122835', 2, 1, 4500, NULL, NULL),
(667, '120200227090513', NULL, 1, 4999, NULL, 'Sistema control de socios '),
(668, '120200227090513', NULL, 1, 1900, NULL, 'Lector de huellas digital person '),
(670, '120200227090513', NULL, 1, 2870, NULL, 'Chapa magnética 300 libras '),
(671, '120200227090513', NULL, 1, 1900, NULL, 'Relevador usb '),
(672, '120200228101706', 28, 1, 2870, NULL, NULL),
(673, '120200301183321', NULL, 1, 4000, NULL, 'Anticipo sistema de ventas con modificaciones acordadas. '),
(674, '3820200302103522', NULL, 1, 19, NULL, 'cable usb blanco '),
(675, '120200305094612', 3, 1, 4999, NULL, NULL),
(676, '120200305094612', 5, 1, 1900, NULL, NULL),
(677, '120200305094612', 4, 1, 1900, NULL, NULL),
(678, '120200305094612', 28, 1, 2870, NULL, NULL),
(679, '120200305094612', 47, 1, 2800, NULL, NULL),
(680, '120200305094612', NULL, 1, 650, NULL, ' Gabinete Acteck Akron, Soporta T. Madre Atx,micro Atx, 2xsata, Fuente De Poder 500w, Color Negro'),
(681, '120200305094612', NULL, 1, 1499, NULL, 'Tarjeta Madre Gigabyte Ga-h110m-a-mx, Soporta 7th/6th Gen Skt 1151, 2 Ddr4, 4 Sata 3, Usb 3.0, Usb 2.0, Pci-e X16, Hdmi, 2ch Audio, Micro Atx'),
(682, '120200305094612', NULL, 1, 1930, NULL, ' Procesador Intel Pentium, G4560, 3.5 Ghz, Lga 1151, 2 Nucleos, 4 Hilos, Caché 3mb, (bx80677g4560)'),
(683, '120200305094612', NULL, 1, 480, NULL, ' Memoria Ram Kingston, 4gb Ddr4, 2666 Mhz, Cl 19 Kvr26n19s6x4'),
(684, '120200305094612', NULL, 1, 662, NULL, ' Unidad De Estado Solido Ssd Adata Su650, 120 Gb, Serial Ata Iii 6 Gb/s, Lectura 520 Mb/s, Escritura 450 Mb/s, 2.5\" (asu650ss-120gt-r)'),
(685, '120200305094612', NULL, 1, 1460, NULL, ') Monitor Vorago Led-w15-200-v2, 39,6 Cm (15.6\")diagonal, 1 Vga, Color Negro, 2 Ms'),
(686, '120200305094612', NULL, 1, 174, NULL, ' Kit Teclado Y Mouse Optico 1000 Dpi, Acteck K200, 105 Teclas, Color Negro, Usb 2.0, Compatible Con Windows Y Macos'),
(687, '120200305094612', NULL, 1, 590, NULL, ' ENVIOS EQUIPO DE COMPUTO'),
(688, '120200305094612', NULL, 1, 500, NULL, ' Licencia office 2019'),
(689, '120200305094612', NULL, 1, 500, NULL, ' Licencia office 2019'),
(690, '120200305094612', NULL, 1, 0, NULL, '400'),
(691, '120200305094612', NULL, 1, 388, NULL, ' lIC. kaspersky ORIGINAL'),
(692, '3920200305142409', NULL, 1, 139, NULL, 'usb 16 gb'),
(705, '3920200309161829', NULL, 1, 25, NULL, 'audifono'),
(706, '120200310090003', 3, 1, 4999, NULL, NULL),
(707, '120200310104440', 2, 1, 4500, NULL, NULL),
(708, '120200310104440', NULL, 1, 1900, NULL, 'Anualidad CFDI'),
(709, '3920200310182247', NULL, 1, 75, NULL, 'cargador tipo c'),
(710, '120200311102623', NULL, 1, 464, NULL, 'Servicio Soporte  Tecnico'),
(712, '120200311102840', 5, 1, 1900, NULL, NULL),
(713, '120200311102840', 4, 1, 1900, NULL, NULL),
(715, '3820200312145259', NULL, 1, 20, NULL, 'cable usb negro con punta delgada'),
(716, '120200313173607', 4, 1, 1900, NULL, NULL),
(717, '3920200314091148', NULL, 1, 19, NULL, 'cargador'),
(718, '120200314104810', NULL, 5, 6, NULL, 'Impresiones color'),
(719, '120200314104810', NULL, 10, 6, NULL, 'Impresiones mayoreo color'),
(720, '120200320175952', 3, 1, 4999, NULL, NULL),
(721, '120200320175952', 4, 1, 1900, NULL, NULL),
(722, '120200320175952', 5, 1, 1900, NULL, NULL),
(723, '120200320175952', NULL, 1, 2800, NULL, 'Kit chapa magnética '),
(725, '3920200322150148', NULL, 1, 139, NULL, 'usb 16 gb'),
(726, '3820200324125724', NULL, 1, 25, NULL, 'auriculares'),
(727, '120200324191513', 3, 1, 4999, NULL, NULL),
(728, '120200325181657', NULL, 14, 7, NULL, 'Imp Color'),
(746, '3920200329161603', NULL, 1, 23, NULL, 'mini adaptador para telefono '),
(747, '120200330113039', NULL, 1, 580, NULL, 'ACTUALIZACION DE SISTEMAS'),
(750, '120200401195048', NULL, 1, 450, NULL, 'Reinstalacion y respaldo Control de socios'),
(751, '120200404153703', NULL, 1, 3000, NULL, '50 % Sistema PTv WEb'),
(753, '120200404160402', NULL, 1, 1300, NULL, 'moamao-tpv.com + certificado digital, anualidad. '),
(754, '3920200405202356', NULL, 1, 19, NULL, 'cargador'),
(756, '120200407215434', NULL, 1, 5800, NULL, 'Software Radio taxi + 1 caller ID'),
(757, '3820200408185729', NULL, 1, 19, NULL, 'cable usb color negro'),
(758, '120200410115939', NULL, 1, 5800, NULL, 'Software radio taxi + 1 caller ID '),
(759, '120200410115939', NULL, 3, 900, NULL, 'Caller ID '),
(760, '120200410164933', NULL, 1, 400, NULL, 'Reinstalación y respaldo de sistema'),
(761, '3820200412132345', NULL, 1, 139, NULL, 'memoria usb '),
(762, '3820200414140742', NULL, 1, 23, NULL, 'adaptador usb a celular'),
(763, '3820200415171824', NULL, 1, 120, NULL, 'MEMORIA USB '),
(764, '3920200418141934', NULL, 1, 280, NULL, 'servicio equipo de computo.'),
(765, '3820200420134252', NULL, 1, 23, NULL, 'adaptador de usb para celular'),
(766, '120200422094312', 2, 1, 4500, NULL, NULL),
(768, '120200422192310', NULL, 1, 1000, NULL, 'Anualidad server'),
(770, '120200422192310', NULL, 2, 4500, NULL, 'Sistema hotelero.  Lic vitalicia '),
(771, '3820200424130204', NULL, 1, 120, NULL, 'memoria usb '),
(772, '3820200424130204', NULL, 1, 139, NULL, 'memoria usb'),
(773, '3920200426144105', NULL, 2, 23, NULL, 'mini adaptador'),
(774, '3820200428105116', 34, 1, 70, NULL, NULL),
(775, '120200428140349', NULL, 2, 1500, NULL, 'sistema Mini SUper PTV'),
(776, '3920200428181940', NULL, 1, 200, NULL, 'servicio de office'),
(777, '120200428203701', 3, 1, 4999, NULL, NULL),
(778, '120200428203701', NULL, 1, -1249, NULL, 'Desc'),
(781, '120200428140349', NULL, 1, 3800, NULL, 'SISTEMA WEB PTV'),
(782, '120200430104842', NULL, 1, 4500, NULL, 'Lic. Sistema hotelero '),
(784, '120200430104842', NULL, 1, 1900, NULL, 'Anualidad cfdi.  '),
(785, '120200430141134', NULL, 2, 1900, NULL, 'ANUALIDAD CFDI'),
(786, '3920200501141336', NULL, 1, 49, NULL, 'audifonos de cierre'),
(787, '3920200501141441', NULL, 1, 25, NULL, 'audifonos'),
(788, '3920200503204546', NULL, 1, 150, NULL, 'memoria tarrito'),
(789, '3920200503205110', NULL, 1, 150, NULL, 'usb de tarrito'),
(790, '3920200504203734', NULL, 1, 25, NULL, 'audífonos sencillos'),
(792, '3920200507145648', NULL, 1, 120, NULL, 'usb 16 gb'),
(793, '3920200507191940', NULL, 1, 23, NULL, 'MINI ADAPTADOR '),
(794, '120200512211718', NULL, 1, 1000, NULL, 'Abono por un total de $ 1950 ajustes control de socios'),
(795, '120200513104001', NULL, 1, 1900, NULL, 'Anualidad CFDI'),
(796, '120200513112736', NULL, 1, 150, NULL, 'Asistencia tecnica'),
(797, '120200514232903', NULL, 1, 8120, NULL, 'Sistema web + anualidad servidor'),
(798, '3820200519131634', 38, 1, 23, 13, NULL),
(799, '120200521115213', NULL, 18, 6, NULL, 'impresiones color'),
(800, '3820200521135408', 20, 1, 53, 5, NULL),
(801, '120200525125754', NULL, 1, 3364, NULL, 'Ajustes acordados '),
(802, '120200430141134', 2, 1, 4500, NULL, NULL),
(803, '120200526153134', NULL, 1, 4800, NULL, 'Sistema web control'),
(804, '120200526153239', NULL, 2, 1500, NULL, 'Minisuper + ajuste familias'),
(805, '120200527092213', NULL, 1, 3364, NULL, 'Ajustes solicitados'),
(806, '120200527092332', NULL, 2, 1900, NULL, 'Anualidad cfdi'),
(807, '120200527092511', NULL, 2, 4500, NULL, 'Sistema control de socios'),
(808, '120200527092727', NULL, 2, 1000, NULL, 'SISTEMA PTV'),
(809, '120200527092727', NULL, 1, 4800, NULL, 'SISTEMA WEB PTV'),
(811, '3820200528125918', NULL, 1, 120, NULL, 'USB ADATA 16GB'),
(812, '120200529165018', NULL, 2, 580, NULL, 'Actualización sistema hotelero '),
(813, '3920200530154212', NULL, 1, 35, NULL, 'investigación'),
(816, '120200601122548', NULL, 1, 1900, NULL, 'anualidad rfc GIA100728216 , GIC040830321'),
(817, '120200602141246', NULL, 2, 580, NULL, 'Actualizacion sistema hotelero'),
(818, '120200603154543', NULL, 1, 812, NULL, 'Reinstalación sistema hotelero '),
(820, '120200604174537', NULL, 1, 400, NULL, 'Reinstalacion sistema control de socios'),
(821, '3920200607181436', NULL, 1, 300, NULL, 'paqueteria office y anti virus '),
(822, '120200609170247', NULL, 1, 2842, NULL, '50 % Ajustes acordados '),
(823, '120200610192001', 3, 1, 4999, NULL, NULL),
(824, '120200613121227', NULL, 1, 6500, NULL, 'Ajustes a medida solicitados'),
(825, '120200613121227', NULL, 1, 1500, NULL, 'Caller ID'),
(826, '120200613122527', NULL, 1, 6500, NULL, 'AJUSTES A MEDIDA SOLICITADOS'),
(829, '120200615005843', NULL, 1, 1000, NULL, 'Incremento de velocidad en servidor. NO FACTURABLE'),
(831, '120200615120441', 48, 23, 8.12, NULL, NULL),
(832, '3920200615134937', NULL, 1, 700, NULL, 'laptop lenobo '),
(834, '120200617152417', 48, 62, 8.12, NULL, NULL),
(835, '3920200617175105', NULL, 1, 25, NULL, 'audifonos'),
(836, '120200619150321', 48, 27, 8.12, NULL, NULL),
(837, '120200619184843', 48, 27, 8.12, NULL, NULL),
(838, '120200620145755', 20, 1, 53, NULL, NULL),
(839, '120200620161632', 49, 3, 90, NULL, NULL),
(840, '120200620161632', 50, 1, 350, NULL, NULL),
(841, '120200620161732', 49, 1, 90, NULL, NULL),
(842, '120200620163250', NULL, 1, 10, NULL, 'aa'),
(843, '120200620170024', 58, 1, 290, NULL, NULL),
(844, '3720200622153118', 56, 1, 120, NULL, NULL),
(845, '120200622190933', 54, 1, 120, NULL, NULL),
(846, '120200622193924', NULL, 1, 200, NULL, 'Eliminar Abonos de caja'),
(848, '120200622193924', NULL, 1, 324, NULL, 'Cierre de caja en modo corte x & z'),
(849, '120200622193924', NULL, 1, 1700, NULL, 'Informtes (Listado)'),
(850, '120200622193924', NULL, 1, 1948, NULL, 'Control de pedidos'),
(851, '3720200624121138', 34, 1, 70, NULL, NULL);

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
(1, 'CLTA | PABLO L. SIDAR', 'VEINTE DE NOVIEMBRE.NO.324, COL. BARRIO DE LAS FLORES, VERACRUZ, MEX 96980, TEL: + 52 923 120 05 05', '+52 923 120 05 05', 'A'),
(9, 'CLTA | BENITO JUAREZ', 'PARQUE JUAREZ NO. 9, COL. CENTRO, VERACRUZ, MEXICO 96980, TEL: + 52 923 120 05 05', '+52 923 120 05 05', 'C'),
(10, 'CLTA | CENTRAL 101', 'AVENIDA 20 DE NOVIEMBRE 306, CENTRO', '9231200505', 'B'),
(11, 'CLTA | A. M. QUIRAZCO ', 'ANTONIO M QUIRAZCO ', '', '');

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
(11, 10, 4);

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
  `vtd_pg` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nombre`, `imagen`, `product_add`, `product_gest`, `gen_orden_compra`, `client_add`, `client_guest`, `almacen_add`, `almacen_guest`, `depa_add`, `depa_guest`, `propiedades`, `usuarios`, `finanzas`, `descripcion`, `sucursal`, `change_suc`, `sucursal_gest`, `caja`, `super_pedidos`, `comision`, `sueldo`, `vtd_pg`) VALUES
(1, 'root', '6990149e5865432c7061b4b1376b7283', 'ISC. FRANCISCO E. ASCENCIO DOMINGUEZ', 'users/usuario20200619221516.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'CEO', 10, 1, 1, 1, 1, 5, 1800, 1),
(36, 'koraima', '6990149e5865432c7061b4b1376b7283', 'KORAIMA ALVAREZ ', 'users/usuario20190820112557.jpg', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 9, 0, 0, 0, 1, 5, 1500, 0),
(37, 'joselin', '263051d6e5004677725107ac08795505', 'JOSELIN ANAHI', 'users/usuario20190820112539.jpg', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 1, 5, 1800, 0),
(38, 'lady', '1729bc477f7b098b508c1e99269c74a1', 'LADY CESIA OSORIO', 'users/usuario20190901112206.jpg', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 9, 0, 0, 0, 1, 5, 1500, 0),
(39, 'maribel', '1ed850247ae4c79e4f3abf82e174bafa', 'MARIBEL', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 9, 0, 0, 0, 1, 5, 0, 0);

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
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `sale_sucursal` (`sucursal`);

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
-- Indices de la tabla `product_venta`
--
ALTER TABLE `product_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folio_venta` (`folio_venta`),
  ADD KEY `sale_product` (`product`),
  ADD KEY `hijo` (`product_sub`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `annuities`
--
ALTER TABLE `annuities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT de la tabla `credits`
--
ALTER TABLE `credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `credit_pay`
--
ALTER TABLE `credit_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `productos_sub`
--
ALTER TABLE `productos_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `product_pedido`
--
ALTER TABLE `product_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_venta`
--
ALTER TABLE `product_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=852;

--
-- AUTO_INCREMENT de la tabla `soporte`
--
ALTER TABLE `soporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `sucursal_almacen`
--
ALTER TABLE `sucursal_almacen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `annuities`
--
ALTER TABLE `annuities`
  ADD CONSTRAINT `annuity_client` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Filtros para la tabla `sucursal_almacen`
--
ALTER TABLE `sucursal_almacen`
  ADD CONSTRAINT `almacen` FOREIGN KEY (`almacen`) REFERENCES `almacen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sucursal` FOREIGN KEY (`sucursal`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `vendedor_sucursal` FOREIGN KEY (`sucursal`) REFERENCES `sucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
