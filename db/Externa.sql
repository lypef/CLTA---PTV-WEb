-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 12-09-2018 a las 00:38:17
-- Versión del servidor: 10.2.16-MariaDB
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clta_ferre`
--
CREATE DATABASE IF NOT EXISTS `clta_ferre` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `clta_ferre`;

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
(1, 'TOLUCA', 'AV. MARTIRES DE CHICAGO', '923554646'),
(2, 'CHILPANCINGO', 'UBIACAION', '0000'),
(30, 'ACAPULCO', '', '');

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
(1, 'PUBLICO EN GENERAL', 'DIRECCION DEL CLIENTE', '9231299595', 1, 'AEDF920124554445G3', 'ASOCIADOS SA DE CV', 'AAA@A.COM'),
(2, 'CLIENTE DEMO  222', 'DIRECCION DEL CLIENTE', '5555', 100, '0000', 'INDUSTRIAS ALIMENTARIOS', '000a@A.com'),
(16, 'CLIENTE DEMO 1', 'DIRECCION DEL CLIENTE', '', 0, '', 'INDUSTRIAS ALIMENTARIOS', ''),
(17, 'A', 'AA', 'AAA', 0, 'AAA', 'AAA', ''),
(18, 'KLJHNJKHNJKHJK', 'HJKHJKHJK', 'HKJHJKHKJH', 0, '', '', ''),
(19, 'CSCSDCECECECC', 'ECECEC', '6665561', 0, '', '', ''),
(20, 'WERVEVEWVEWV', 'EVEVEVE', 'VEWVEEV', 0, '', '', ''),
(21, 'WEFWFWQ', 'WWWW', '', 0, '', '', ''),
(22, 'EWFEWFEWFEWFEWF', 'EWFEWFEWFEF', '', 0, '', '', ''),
(23, 'EWFEWFEWFEW', 'FEWFEWFE', '', 0, '', '', ''),
(24, 'WEFEWFEWFEF', 'FEWFWEFE', '', 0, '', '', ''),
(25, 'WEFEWFEWF', 'EWFEFE', '', 0, '', '', ''),
(26, 'EWFEWFEF', 'WEFEWFE', '', 0, '', '', '');

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
(1, 'HOGAR & JARDIN', 'PRODUCTOS DE HOGAR & GARDIN'),
(2, 'HERRAMIENTAS', 'HERRAMIENTAS\r\n'),
(3, 'MATERIAL ELECTRICO', 'MATERIAL ELECTRICO\r\n'),
(4, 'MAQUINARIA', 'MAQUINARIA '),
(5, 'DECORACION', 'EQUIPOS DE CAMPO'),
(6, 'FERRETERIA', 'PRODUCTOS QUE NO ENCAGEN EN OTROS DEPARTAMENTOS'),
(7, 'PISOS', 'PISOS'),
(9, 'BAÑOS', 'BAÑOS Y ACCESORIOS'),
(22, 'NUEVO DEPARTAMENTO', 'DESCRIPCIÓN DE DEPARTAMENTO');

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
  `iva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `nombre_corto`, `direccion`, `correo`, `telefono`, `mision`, `vision`, `contacto`, `facebook`, `twitter`, `youtube`, `iva`) VALUES
(1, 'TRACTO PARTES LOAIZA', 'FERRETERIA', 'TULIPANES Y GARDENIAS 321324SSS EQ. 10 DE MAYO', 'contacto@distribuidoradetractopartesloaiza,com', '+52 923120505+52 923114545', 'Somos una empresa comercializadora de productos de ferretería liviana que satisfacen las necesidades de nuestros clientes, con asesoría, calidad y respaldo.\r\nActuamos basados en nuestros valores corporativos, preservando el sano equilibrio entre los intereses de clientes, colaboradores, proveedores, accionistas y comunidad donde operamos.', 'En el año 2020 seremos la empresa ferretera preferida por nuestros clientes, brindándoles soluciones, desarrollando el talento humano de nuestros colaboradores y generando beneficios para los accionistas.', 'copntatciochlkjhlik\r\n', 'http://www.fb.com u ', 'http://www.fb.com u ', 'http://www.fb.com u ', 16);

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
  `concepto` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `folio_venta`
--

INSERT INTO `folio_venta` (`folio`, `vendedor`, `client`, `descuento`, `fecha`, `open`, `cobrado`, `fecha_venta`, `cut`, `sucursal`, `cut_global`, `iva`, `t_pago`, `pedido`, `folio_venta_ini`, `cotizacion`, `concepto`) VALUES
('120180730001115', 1, 1, 3, '2018-07-30 00:40:15', 0, 0, '2018-07-30 00:40:15', 1, 2, 1, 16, 'efectivo', 1, '120180730001115', 0, ''),
('120180730004521', 1, 1, 3, '2018-07-30 00:40:15', 0, 10, '2018-07-30 00:45:21', 1, 2, 1, 16, 'efectivo', 1, '120180730001115', 0, ''),
('120180730004719', 1, 1, 3, '2018-07-30 00:40:15', 0, 10.5, '2018-07-30 00:47:19', 1, 2, 1, 16, 'efectivo', 1, '120180730001115', 0, ''),
('120180730004731', 1, 1, 3, '2018-07-30 00:40:15', 0, 10, '2018-07-30 00:47:31', 1, 2, 1, 16, 'efectivo', 1, '120180730001115', 0, ''),
('120180730005933', 1, 1, 3, '2018-07-30 00:40:15', 0, 17.03, '2018-07-30 00:59:33', 1, 2, 1, 16, 'efectivo', 1, '120180730001115', 0, ''),
('120180730012306', 1, 1, 3, '2018-07-30 00:40:15', 0, 7.53, '2018-07-30 01:23:06', 1, 2, 1, 16, 'transferencia', 1, '120180730001115', 0, ''),
('120180730015001', 1, 16, 0, '2018-07-30 01:50:01', 0, 1500, '2018-07-30 01:50:10', 1, 2, 1, 16, 'efectivo', 0, NULL, 0, ''),
('120180730015102', 1, 1, 3, '2018-07-30 00:40:15', 0, 89.47, '2018-07-30 01:51:02', 1, 2, 1, 16, 'efectivo', 1, '120180730001115', 0, ''),
('120180730015317', 1, 16, 0, '2018-07-30 01:53:17', 0, 1500, '2018-07-30 01:53:29', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, ''),
('120180730015347', 1, 16, 0, '2018-07-30 01:53:47', 0, 0, NULL, 0, 2, 0, 16, 'transferencia', 1, '120180730015347', 0, ''),
('120180730015418', 1, 16, 0, '2018-07-30 01:53:47', 0, 50, '2018-07-30 01:54:18', 0, 2, 0, 16, 'efectivo', 1, '120180730015347', 0, ''),
('120180730015542', 1, 16, 0, '2018-07-30 01:53:47', 0, 100, '2018-07-30 01:55:42', 0, 2, 0, 16, 'efectivo', 1, '120180730015347', 0, ''),
('120180805100607', 1, 16, 0, '2018-08-05 10:06:07', 0, 1900, '2018-08-05 16:03:00', 0, 2, 0, 16, 'efectivo', 0, '120180805100607', 0, ''),
('120180805105827', 1, 16, 0, '2018-08-05 10:58:27', 0, 39, '2018-08-05 10:58:40', 0, 2, 0, 16, 'transferencia', 0, NULL, 0, ''),
('120180805153952', 1, 16, 0, '2018-08-05 15:39:52', 0, 178, '2018-08-05 15:49:16', 0, 2, 0, 16, 'efectivo', 0, '120180805153952', 1, ''),
('120180807131645', 1, 16, 0, '2018-08-07 13:16:45', 0, 39, '2018-08-09 00:44:53', 0, 2, 0, 16, 'efectivo', 0, '120180807131645', 0, NULL),
('120180807131811', 1, 16, 0, '2018-08-07 13:18:11', 0, 0, NULL, 0, 2, 0, 16, 'efectivo', 1, '120180807131811', 0, NULL),
('120180807131832', 1, 16, 0, '2018-08-07 13:18:32', 0, 0, NULL, 0, 2, 0, 16, 'efectivo', 1, '120180807131832', 0, NULL),
('120180807131912', 1, 16, 0, '2018-08-07 13:18:32', 0, 1, '2018-08-07 13:19:12', 0, 2, 0, 16, 'efectivo', 1, '120180807131832', 0, NULL),
('120180808091256', 1, 16, 0, '2018-08-08 09:12:56', 0, 2149, '2018-08-09 00:39:52', 0, 2, 0, 16, 'efectivo', 0, '120180808091256', 0, NULL),
('120180808091429', 1, 16, 0, '2018-08-08 09:14:29', 0, 0, NULL, 0, 2, 0, 16, 'efectivo', 1, '120180808091429', 0, NULL),
('120180808094035', 1, 16, 0, '2018-08-08 09:14:29', 0, 10, '2018-08-08 09:40:35', 0, 2, 0, 16, 'efectivo', 1, '120180808091429', 0, NULL),
('120180808094525', 1, 16, 0, '2018-08-07 13:18:32', 0, 1510, '2018-08-08 09:45:25', 0, 2, 0, 16, 'efectivo', 1, '120180807131832', 0, NULL),
('120180808094619', 1, 16, 0, '2018-08-08 09:27:25', 0, 65, '2018-08-08 09:46:19', 0, 2, 0, 16, 'efectivo', 1, '120180808092725', 0, NULL),
('120180808094819', 1, 16, 0, '2018-08-08 09:27:25', 0, 1, '2018-08-08 09:48:19', 0, 2, 0, 16, 'efectivo', 1, '120180808092725', 0, NULL),
('120180808094848', 1, 16, 0, '2018-08-08 09:27:25', 0, 1, '2018-08-08 09:48:48', 0, 2, 0, 16, 'efectivo', 1, '120180808092725', 0, NULL),
('120180808094917', 1, 16, 0, '2018-08-08 09:27:25', 0, 1, '2018-08-08 09:49:17', 0, 2, 0, 16, 'efectivo', 1, '120180808092725', 0, NULL),
('120180808095043', 1, 16, 0, '2018-08-08 09:27:25', 0, 7, '2018-08-08 09:50:43', 0, 2, 0, 16, 'efectivo', 1, '120180808092725', 0, NULL),
('120180808095308', 1, 16, 0, '2018-08-08 09:27:25', 0, 10, '2018-08-08 09:53:08', 0, 2, 0, 16, 'efectivo', 1, '120180808092725', 0, NULL),
('120180809004802', 1, 16, 0, '2018-08-09 00:48:02', 0, 1549, '2018-08-09 00:49:09', 0, 2, 0, 16, 'efectivo', 0, '120180809004802', 0, NULL),
('120180809010132', 1, 16, 0, '2018-08-09 00:49:21', 0, 200, '2018-08-09 01:01:32', 0, 2, 0, 16, 'efectivo', 1, '120180809004921', 0, NULL),
('120180809010312', 1, 16, 0, '2018-08-09 00:49:21', 0, 10, '2018-08-09 01:03:12', 0, 2, 0, 16, 'efectivo', 1, '120180809004921', 0, NULL),
('120180809010527', 1, 16, 0, '2018-08-09 00:49:21', 0, 4, '2018-08-09 01:05:27', 0, 2, 0, 16, 'efectivo', 1, '120180809004921', 0, NULL),
('120180809011216', 1, 16, 0, '2018-08-09 01:12:16', 0, 0, NULL, 0, 2, 0, 16, 'efectivo', 1, '120180809011216', 0, NULL),
('120180809011310', 1, 16, 0, '2018-08-09 01:12:16', 0, 3039, '2018-08-09 01:13:10', 0, 2, 0, 16, 'efectivo', 1, '120180809011216', 0, NULL),
('120180809011407', 1, 16, 0, '2018-08-09 01:14:07', 0, 0, NULL, 0, 2, 0, 16, 'efectivo', 1, '120180809011407', 0, NULL),
('120180809011436', 1, 16, 0, '2018-08-09 01:14:07', 0, 1539, '2018-08-09 01:14:36', 0, 2, 0, 16, 'efectivo', 1, '120180809011407', 0, NULL),
('120180809011611', 1, 16, 0, '2018-08-09 01:16:11', 0, 0, NULL, 0, 2, 0, 16, 'efectivo', 1, '120180809011611', 0, NULL),
('120180809011622', 1, 16, 0, '2018-08-09 01:16:11', 0, 10, '2018-08-09 01:16:22', 0, 2, 0, 16, 'efectivo', 1, '120180809011611', 0, NULL),
('120180809012219', 1, 16, 0, '2018-08-09 01:22:19', 0, 39, '2018-08-09 01:31:57', 0, 2, 0, 16, 'efectivo', 0, '120180809012219', 0, NULL),
('120180809012450', 1, 16, 0, '2018-08-09 01:24:50', 0, 39, '2018-08-09 01:25:52', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180809012601', 1, 16, 0, '2018-08-09 01:26:01', 0, 10, '2018-08-09 01:26:11', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180809013351', 1, 1, 1, '2018-08-09 01:33:51', 0, 0, NULL, 0, 2, 0, 16, 'efectivo', 1, '120180809013351', 0, NULL),
('120180809013725', 1, 1, 1, '2018-08-09 01:33:51', 0, 3.61, '2018-08-09 01:37:25', 0, 2, 0, 16, 'efectivo', 1, '120180809013351', 0, NULL),
('120180809014009', 1, 16, 0, '2018-08-09 01:40:09', 0, 0, '2018-08-13 22:52:18', 0, 2, 0, 16, 'efectivo', 0, '120180809014009', 0, NULL),
('120180815140112', 1, 16, 0, '2018-08-15 14:01:12', 0, 0, '2018-08-15 14:03:01', 0, 2, 0, 16, 'efectivo', 0, '120180815140112', 0, NULL),
('120180816122245', 1, 16, 0, '2018-08-16 12:22:45', 0, 39, '2018-08-16 12:24:16', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180816122254', 1, 16, 0, '2018-08-16 12:22:54', 0, 0, NULL, 0, 2, 0, 16, 'efectivo', 1, '120180816122254', 0, NULL),
('120180816132355', 1, 1, 1, '2018-08-09 01:33:51', 0, 35, '2018-08-16 13:23:55', 0, 2, 0, 16, 'efectivo', 1, '120180809013351', 0, NULL),
('120180816133338', 1, 16, 0, '2018-08-16 13:33:38', 0, 156, '2018-08-16 13:34:00', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180816133927', 1, 16, 0, '2018-08-16 13:39:27', 0, 156, '2018-08-16 13:39:50', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180816134253', 1, 16, 0, '2018-08-16 12:22:54', 0, 30, '2018-08-16 13:42:53', 0, 2, 0, 16, 'efectivo', 1, '120180816122254', 0, NULL),
('120180817113846', 1, 16, 0, '2018-08-17 11:38:46', 0, 1588, '2018-08-17 11:39:22', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180817121712', 1, 16, 0, '2018-08-17 12:17:12', 0, 1539, '2018-08-17 12:17:33', 0, 2, 0, 16, 'efectivo', 0, '120180817121712', 0, NULL),
('120180821004637', 1, 26, 1, '2018-08-21 00:46:37', 1, 0, NULL, 0, 2, 0, 16, 'efectivo', 0, '120180821004637', 1, NULL),
('120180821005623', 1, 19, 50, '2018-08-21 00:56:23', 1, 0, NULL, 0, 2, 0, 16, 'efectivo', 1, '120180821005623', 0, NULL),
('120180821005630', 1, 2, 0, '2018-08-21 00:56:30', 1, 0, NULL, 0, 2, 0, 16, 'efectivo', 1, '120180821005630', 0, NULL),
('120180821110059', 1, 16, 0, '2018-08-21 11:00:59', 0, 194088, '2018-08-22 00:28:16', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180822005611', 1, 2, 0, '2018-08-21 00:56:23', 0, 98, '2018-08-22 00:56:11', 0, 2, 0, 16, 'efectivo', 1, '120180821005623', 0, NULL),
('120180822010933', 1, 2, 0, '2018-08-21 00:56:23', 0, 458, '2018-08-22 01:09:33', 0, 2, 0, 16, 'efectivo', 1, '120180821005623', 0, NULL),
('120180822012816', 1, 23, 0, '2018-08-22 01:28:16', 1, 0, NULL, 0, 1, 0, 16, 'efectivo', 1, '120180822012816', 0, NULL),
('120180824161613', 1, 17, 0, '2018-08-24 16:16:13', 1, 0, NULL, 0, 2, 0, 16, 'efectivo', 1, '120180824161613', 0, NULL),
('120180824162737', 1, 17, 0, '2018-08-24 16:16:13', 0, 1000, '2018-08-24 16:27:37', 0, 2, 0, 16, 'efectivo', 1, '120180824161613', 0, NULL),
('120180824163047', 1, 17, 0, '2018-08-24 16:16:13', 0, 55, '2018-08-24 16:30:47', 0, 2, 0, 16, 'efectivo', 1, '120180824161613', 0, NULL),
('120180824163152', 1, 1, 0, '2018-08-24 16:31:52', 0, 4643, '2018-08-24 16:32:19', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180824163905', 1, 17, 0, '2018-08-24 16:39:05', 0, 1000, '2018-08-24 16:39:18', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180824164632', 1, 17, 0, '2018-08-24 16:46:32', 0, 130698, '2018-08-24 16:48:01', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180825231111', 1, 17, 0, '2018-08-25 23:11:11', 0, 290039, '2018-08-25 23:11:30', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180827181546', 1, 17, 0, '2018-08-27 18:15:46', 0, 1001500, '2018-08-27 18:16:04', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180829232923', 1, 2, 50, '2018-08-21 00:56:23', 0, 10, '2018-08-29 23:29:23', 0, 2, 0, 16, 'efectivo', 1, '120180821005623', 0, NULL),
('120180830003538', 1, 17, 0, '2018-08-30 00:35:38', 0, 1539, '2018-09-11 23:00:30', 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180911230405', 1, 17, 0, '2018-09-11 23:04:05', 0, 1500, '2018-09-11 23:04:13', 0, 1, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('120180911232436', 1, 17, 0, '2018-09-11 23:24:36', 1, NULL, NULL, 0, 2, 0, 16, 'efectivo', 0, NULL, 0, NULL),
('20180806105308', 1, 1, 0, '2018-08-06 10:53:08', 0, 1500, '2018-08-06 10:53:08', 0, 2, 0, 0, 'efectivo', 0, '', 0, 'ingreso de hoy '),
('20180806105726', 1, 1, 0, '2018-08-06 10:57:26', 0, -1500, '2018-08-06 10:57:26', 0, 2, 0, 0, 'efectivo', 0, '', 0, 'pago de servicio'),
('2320180816122814', 23, 16, 0, '2018-08-16 12:28:14', 0, 7249, '2018-08-16 12:49:39', 0, 1, 0, 16, 'efectivo', 0, NULL, 0, NULL);

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
  `precio_costo` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `no. De parte`, `nombre`, `descripcion`, `almacen`, `departamento`, `loc_almacen`, `marca`, `proveedor`, `foto0`, `foto1`, `foto2`, `foto3`, `oferta`, `precio_normal`, `precio_oferta`, `stock`, `tiempo de entrega`, `stock_min`, `stock_max`, `precio_costo`) VALUES
(5, '12121', 'ASADOR CARBON ONE TOUCH 18.5', 'Asador de carbón marca WEBER. Fabricado en acero con esmalte de porcelana horneado. Ventilación en tapa. Rejilla de cocción de acero cromado. Rejilla para el carbón hecha de acero resistente a altas temperaturas. Diámetro 18\". Ventila de aluminio. Sistema de limpieza One Touch. Termómetro incorporado duradero. Rejilla articulada. Colector de cenizas de gran capacidad. Mango con ganchos para herramienta. \r\n(600498)', 1, 1, '', 'HERO', 'FERREMEX', 'product/600498-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 1849, 1500, 9, '', 40, 100, 1000),
(6, '564584', 'PLANTA KALANCHOE 6', 'Varios colores. Planta de media sombra. Riego 1 vez por semana. Maceta 15 cm de diámetro. Fertilización una vez al mes. \r\n(595077)', 1, 1, 'A/6', 'MARA ROSAL', 'DIR. MEXICO', 'product/595077-z.jpg', 'product/product_img220180702193033.jpg', 'product/product_img320180702193033.jpg', 'product/product_img420180702193033.jpg', 0, 39, 35, 1, '1 DIA', 2, 10, 0),
(7, '6625', 'ATORNILLADOR INALAMBRICO 3.6V CON LINTERNA BLACK & DECKER', 'Atornillador Inalámbrico 3.6 V Linterna LED incluída. Batería 3.6V de Ión Litio.Velocidad 200 RPM. Torque Máximo 4.0 Nm. \r\n(233139)\r\n\r\n* Se garantiza sus herramientas industriales por tres años de garantía limitada desde la compra. 1 año de mantenimiento gratuito; Que incluye limpieza general. Cambio de grasa. Carbones y mano de obra gratis. Sólo cubre tres mantenimientos en un año. <br> No incluye accesorios.', 2, 2, 'E/256', 'hero', '', 'product/233139-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 779, 10, 7, '', 0, 15, 0),
(8, '656541', 'TALADRO PERCUTOR/DESTORNILLADOR M18 1/2', 'Juego de taladro percutor/destonillador compacto de 1/2\" de 13 mm. Motor: Características de un diseño robusto combinado con imanes de tierras raras para una vida más larga el mejor en su clase. Diseño compacto: permite una mayor accesibilidad en el trabajo apretado. Funda todo metal: Proporciona máximo impacto y durabilidad de choque. Protege la herramienta contra situaciones de abuso y proporciona máxima duración. \r\n(401416)\r\n\r\n', 2, 2, '', 'HERO', '', 'product/401416-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 4499, 4200, 1, '', 15, 20, 0),
(9, '6352', 'DISCO CORTE METAL 7', 'Ideal para corte de lámina y metales en general. Se puede usar en sierras circulares y esmeriladoras angulares. Modelo 2115. \r\n(436220)', 1, 2, '', 'HERO', '', 'product/436220-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 51.5, 31.5, 0, '', 10, 15, 0),
(10, '6956', 'POLIDUCTO CONDUIT BICAPA 3/4', 'Se utiliza en instalación de cableado eléctrico. Económico. Medida 3/4\" 100 m x pieza. Dimensión .80 x 25 cm. 12 kg. \r\n(287871)', 1, 3, '', '', '', 'product/287871-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 449, 300, 2, '', 25, 15, 0),
(11, '558', 'CENTRO DE CARGA 3P 100A DE SOBREPONER', 'Centro de carga para uso residencial y comercial ligero de montaje de sobreponer. Cuenta con conectores tipo opresor para fácil conexión. Envolvente de lámina de acero rolada en frío. Tipo 1. Uso interior. Terminales de aluminio estañado para mayor protección. Cumple con NOM. 240 V. Máximo Tipo NEMA 1. \r\n(434758)', 30, 3, 'A/58', '', '', 'product/434758-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 365, 10, 2, '', 6, 10, 0),
(12, '646541', 'PLACA Y CONTACTO DOBLE CONTACTO BLANCO', 'Placa con doble contacto sin tierra en color blanco. 125 v. Material resistente a altas temperaturas. \r\n(703634)', 1, 3, '', '', '', 'product/703634-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 95, 10, 4, '', 2, 15, 0),
(13, 'a41543', 'APISONADOR PARA COMPACTACIÓN MT74FAF', 'Motor Subaru de 3.5hp de cuatro tiempo a gasolina. Carburador de flotador. Zapata de impacto de 28.8 x 33.1 cm. Revoluciones por minuto 3600(rpm). 640-680 GPM. 1400kg de impacto. \r\n(474137)', 1, 4, '', '', '', 'product/474137-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 57249, 10, 7, '', 15, 10, 0),
(14, '55', 'PLATAF DE MTTO NO CONDUCT 8 ESC', 'Plataforma móvil de fibra de vidrio no conductora de electricidad con pasamanos. Barandales y plataforma. Peldaños con superficie que previene los derrapes y diseño que facilita el ascenso y descenso. Ruedas para facilitar su transportación a las áreas de trabajo. Color amarillo. Capacidad de carga 136 kg. de Uso Industrial. Modelo FW2408. Garantía 1 año. ', 2, 4, '', '', '', 'product/473381-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 62700, 1, 9, '', 0, 0, 0),
(15, '251a5641a', 'CONCERTINA GALVANIZADA 8 M', 'Caja con 8 metros lineales. espiral de navajas de 47 cm de diámetro para cercas o sobre bardas \r\n(807703)', 2, 4, '', '', '', 'product/807703-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 569, 350, 1, '', 4, 15, 0),
(16, '56415641', 'CORTINA ENROLL TRANSLÚCIDA 160X180 CM MARFIL REGGIA', 'Cortina enrollable translúcida. Fabricada en poliéster. Color marfíl. Medida 160 cm de ancho x 180 cm de alto. Diseño minimalista. Reduce la entrada de luz solar y protege. Fácil instalación. Uso en interiores. \r\n(955965)', 1, 5, '', '', '', 'product/955965-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 455, 0, 98, '', 0, 0, 0),
(17, '5615614', 'PERSIANA DUOLIGHT 1.60 X 2.20 MARFIL', 'Hecho de tela poliéster con cabezal y contrapeso cerrado de aluminio. Regula la entrada de la luz de manera parcial. Se puede instalar por fuera o por dentro del marco de la ventana. Incluye accesorios de seguridad para evitar que los niños jueguen con los cordones \r\n(800469)', 2, 5, '', '', '', 'product/800469-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 1875, 950, 98, '', 0, 0, 0),
(18, '54541', 'PERSIANA HORIZONTAL PVC 1.0X1.6 MADERA REGGIA', 'Persiana horizontal de PVC. Color madera. Medida 100 cm de ancho x 160 cm de alto. Recomendada para habitaciones abiertas sala/comedor. Permite graduar la intensidad del paso de la luz. Accionamiento muy sencillo. Fácil mantenimiento. Uso en interiores. ', 1, 5, '', '', '', 'product/260402-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 555, 0, 99, '', 0, 0, 0),
(21, '521541', 'PISO NORWEGIAN 18X55 CAOBA 1.49 M2 (110850)\r\n', 'Piso cerámico esmaltado. Tipo madera. Medida 18x55 cm. Color caoba. Tecnología digital. Para espacios en el interior y exterior. Recomendado para comedor. sala o recamaras. Trafico semi-intenso. Cobertura por caja de 1.49 m2. Grado de calidad 1A. Variación de tono extremo en su diseño. Fácil instalación \r\n', 1, 7, '', '', '', 'product/110850-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 205, 150, 18, '', 0, 0, 0),
(22, '521541', 'REGADERA ANTISARRO CROMO 5 FUNCIONES\r\n', 'Acabado cromo. 5 funciones. 10 años de garantía. Modelo 56225-0501. \r\n', 1, 9, '', '', '', 'product/377246-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 900, 0, 8, '', 0, 0, 0),
(23, '5612564', 'SANITARIO NEMESIS HUESO 1 PIEZA 3 Y 5 L', 'Sanitario de una sola pieza. Color hueso. Capacidad de descarga 350 gr. Tecnología doble descarga para un consumo menor a 5 L. Ahorrador de agua. Diseño alargado con asiento de cierre lento. Trampa oculta. Ahorra 10220 L de agua por persona al año (comparado con un sanitario de 10 L). \r\n', 1, 9, '', '', '', 'product/413203-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 2499, 10, 10, '', 0, 0, 0),
(24, '5454', 'MEZCLADORA MONOMANDO PARA LAVABO CAMELIA CROMO', 'Si buscas calidad y un estilo excepcional esta mezcladora para lavabo Moen es tu mejor opción. Mezcladora Camelia. Es ahorradora utiliza hasta -32% de agua sin sacrificar rendimiento. Su acabado cromo altamente reflejante combina con cualquier estilo de decoración. Incluye desagüe y tapón retráctil. Suite completa para baño disponible. Garantía Moen contra fuga y goteo. \r\n', 1, 9, '', '', '', 'product/615428-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 1636, 1, 10, '', 0, 0, 0),
(38, '554', 'KIT CAUTIN', 'CAUTIN', 1, 2, 'AAA', 'A', 'A', 'product/product_img120180702203110.jpg', '', '', '', 0, 120, 105, 10, 'MISMO DIA', 0, 0, 0),
(39, '54156', '1111', '11', 30, 6, '', '', '', 'product/product_img120180714044922.jpg', '', '', '', 0, 10, 50, 1, '1', 5, 10, 0);

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
  `max` int(11) NOT NULL,
  `min` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_sub`
--

INSERT INTO `productos_sub` (`id`, `padre`, `almacen`, `stock`, `ubicacion`, `max`, `min`) VALUES
(2, 5, 30, 10, '', 0, 0),
(3, 5, 2, 9, 'Si tiene', 0, 0),
(4, 14, 30, 8, '', 0, 0),
(13, 6, 30, 39, 'No tiene', 0, 0),
(14, 24, 30, 5, '', 50, 10),
(15, 6, 30, 0, 'Si tiene', 25, 2),
(16, 6, 1, 0, 'En anaquel no. 2', 0, 0),
(17, 39, 2, 5, 'A/56', 250, 5),
(18, 6, 1, 2, 'a2', 500, 10);

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

--
-- Volcado de datos para la tabla `product_pedido`
--

INSERT INTO `product_pedido` (`id`, `folio_venta`, `product`, `unidades`, `precio`, `p_generico`) VALUES
(25, '120180730001115', 6, 1, 39, NULL),
(26, '120180730001115', 7, 1, 10, NULL),
(27, '120180730001115', NULL, 1, 100, 'sdadsqwadwas'),
(28, '120180730015347', 7, 10, 10, NULL),
(29, '120180730015347', NULL, 1, 50, 'ssss'),
(39, '120180807131832', 7, 1, 10, NULL),
(40, '120180807131832', 5, 1, 1500, NULL),
(43, '120180808091429', 7, 1, 10, NULL),
(47, '120180809011216', 6, 1, 39, NULL),
(48, '120180809011216', NULL, 2, 1500, 'lkihkljh'),
(49, '120180809011407', 5, 1, 1500, NULL),
(50, '120180809011407', 6, 1, 39, NULL),
(51, '120180809011611', 7, 1, 10, NULL),
(55, '120180809013351', 6, 1, 39, NULL),
(59, '120180816122254', 7, 1, 10, NULL),
(60, '120180821005623', 6, 2, 39, NULL),
(61, '120180821005623', NULL, 2, 10, 'PRODUCTO A PEDIR'),
(62, '120180821005623', NULL, 10, 10, 'PRODUCTO DE PRUEBA PEDIDO'),
(63, '120180821005623', 5, 1, 1500, NULL),
(64, '120180822012816', 6, 1, 39, NULL),
(65, '120180822012816', NULL, 50, 10, 'MUCHAS COSAS'),
(66, '120180824161613', 6, 1, 39, NULL),
(67, '120180824161613', 5, 2, 1500, NULL),
(68, '120180824161613', NULL, 2, 1500, 'PRODUCTO CON NOMBRE LARGO');

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
(3, '120180730015001', 5, 1, 1500, 2, NULL),
(4, '120180730015317', 5, 1, 1500, NULL, NULL),
(8, '120180805100607', 5, 1, 1500, NULL, NULL),
(9, '120180805100607', 10, 1, 300, NULL, NULL),
(13, '120180805100607', NULL, 1, 100, NULL, 'assss'),
(15, '120180805105827', 6, 1, 39, NULL, NULL),
(22, '120180805153952', 6, 2, 39, NULL, NULL),
(23, '120180805153952', NULL, 10, 10, NULL, 'aaa'),
(30, '120180808091256', 7, 1, 10, NULL, NULL),
(31, '120180808091256', 5, 1, 1500, NULL, NULL),
(40, '120180808091256', 10, 2, 300, NULL, NULL),
(43, '120180809004802', 5, 1, 1500, 3, NULL),
(44, '120180809004802', 6, 1, 39, NULL, NULL),
(45, '120180809004802', NULL, 10, 1, NULL, 'lknjklj'),
(48, '120180809012450', 6, 1, 39, NULL, NULL),
(49, '120180809012601', 7, 1, 10, NULL, NULL),
(53, '120180809012219', 6, 1, 39, NULL, NULL),
(55, '120180816122245', 6, 1, 39, 13, NULL),
(57, '2320180816122814', 6, 1, 39, 13, NULL),
(58, '2320180816122814', 8, 1, 4200, NULL, NULL),
(59, '2320180816122814', 7, 1, 10, NULL, NULL),
(60, '2320180816122814', 5, 1, 1500, 3, NULL),
(61, '2320180816122814', 5, 1, 1500, 3, NULL),
(62, '120180816133338', 6, 1, 39, NULL, NULL),
(63, '120180816133338', 6, 1, 39, 13, NULL),
(64, '120180816133338', 6, 1, 39, 15, NULL),
(65, '120180816133338', 6, 1, 39, 16, NULL),
(66, '120180816133927', 6, 2, 39, NULL, NULL),
(67, '120180816133927', 6, 2, 39, 13, NULL),
(68, '120180817113846', 6, 1, 39, 13, NULL),
(69, '120180817113846', 6, 1, 39, NULL, NULL),
(70, '120180817113846', 7, 1, 10, NULL, NULL),
(71, '120180817113846', 5, 1, 1500, 2, NULL),
(72, '120180817121712', 6, 1, 39, 13, NULL),
(73, '120180817121712', 5, 1, 1500, 2, NULL),
(74, '120180821110059', 5, 1, 1500, NULL, NULL),
(75, '120180821110059', 5, 1, 1500, 2, NULL),
(76, '120180821110059', 6, 1, 39, NULL, NULL),
(77, '120180821110059', 6, 1, 39, 13, NULL),
(78, '120180821110059', 7, 1, 10, NULL, NULL),
(79, '120180821110059', 8, 1, 4200, NULL, NULL),
(80, '120180821110059', 9, 1, 31.5, NULL, NULL),
(81, '120180821110059', 10, 1, 300, NULL, NULL),
(82, '120180821110059', 11, 1, 365, NULL, NULL),
(83, '120180821110059', 12, 1, 95, NULL, NULL),
(84, '120180821110059', 13, 1, 57249, NULL, NULL),
(85, '120180821110059', 14, 1, 62700, NULL, NULL),
(86, '120180821110059', 14, 1, 62700, 4, NULL),
(87, '120180821110059', 15, 1, 350, NULL, NULL),
(88, '120180821110059', 16, 1, 455, NULL, NULL),
(89, '120180821110059', 17, 1, 950, NULL, NULL),
(90, '120180821110059', 18, 1, 555, NULL, NULL),
(91, '120180821110059', 21, 1, 150, NULL, NULL),
(92, '120180821110059', 22, 1, 900, NULL, NULL),
(118, '120180824163152', 6, 1, 39, NULL, NULL),
(119, '120180824163152', 6, 1, 39, 13, NULL),
(120, '120180824163152', 8, 1, 4200, NULL, NULL),
(121, '120180824163152', 11, 1, 365, NULL, NULL),
(122, '120180824163905', NULL, 1, 1000, NULL, 'AAAA'),
(123, '120180824164632', 5, 1, 1500, NULL, NULL),
(124, '120180824164632', 5, 1, 1500, 2, NULL),
(125, '120180824164632', 6, 1, 39, NULL, NULL),
(126, '120180824164632', 6, 1, 39, NULL, NULL),
(127, '120180824164632', 7, 1, 10, NULL, NULL),
(128, '120180824164632', 8, 1, 4200, NULL, NULL),
(129, '120180824164632', 9, 1, 31.5, NULL, NULL),
(130, '120180824164632', 10, 1, 300, NULL, NULL),
(131, '120180824164632', 11, 1, 365, NULL, NULL),
(132, '120180824164632', 12, 1, 95, NULL, NULL),
(133, '120180824164632', 13, 1, 57249, NULL, NULL),
(134, '120180824164632', 14, 1, 62700, 4, NULL),
(135, '120180824164632', 11, 1, 365, NULL, NULL),
(136, '120180824164632', 16, 1, 455, NULL, NULL),
(137, '120180824164632', 17, 1, 950, NULL, NULL),
(138, '120180824164632', 22, 1, 900, NULL, NULL),
(140, '120180825231111', NULL, 2, 145000, NULL, 'AAA'),
(141, '120180825231111', 6, 1, 39, NULL, NULL),
(142, '120180827181546', NULL, 1, 1000000, NULL, 'SSSS'),
(143, '120180827181546', 5, 1, 1500, NULL, NULL),
(144, '120180830003538', 5, 1, 1500, NULL, NULL),
(145, '120180830003538', 6, 1, 39, 13, NULL),
(146, '120180911230405', 5, 1, 1500, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `direccion` varchar(254) NOT NULL,
  `telefono` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'LAS PALMAS', 'Blvr. Cayaco Puerto Marquez - Km.4 c.p. 39747 Col. La parota, Acapulco ,Gro\r\nEmail:dtplventas111@hotmail.com;dtp-l@hotmail.com y dtplcreditoycobranzaaca@hotmail.com', ' (744) 406 0800, Cel: 045 (744) 182 7899'),
(2, 'SALAMANCA', 'Blvr. Cayaco Puerto Marquez - Km.4 c.p. 39747 Col. La parota, Acapulco ,Gro\r\nEmail:dtplventas111@hotmail.com;dtp-l@hotmail.com y dtplcreditoycobranzaaca@hotmail.com', ' (744) 406 0800, Cel: 045 (744) 182 7899');

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
  `super_pedidos` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nombre`, `imagen`, `product_add`, `product_gest`, `gen_orden_compra`, `client_add`, `client_guest`, `almacen_add`, `almacen_guest`, `depa_add`, `depa_guest`, `propiedades`, `usuarios`, `finanzas`, `descripcion`, `sucursal`, `change_suc`, `sucursal_gest`, `caja`, `super_pedidos`) VALUES
(1, 'root', '63a9f0ea7bb98050796b649e85481845', 'SUPER USUARIO', 'users/usuario20180725145242.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'aaaa', 2, 1, 1, 1, 1),
(23, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'ddd', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'dd', 1, 0, 0, 0, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `productos_sub`
--
ALTER TABLE `productos_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `product_pedido`
--
ALTER TABLE `product_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `product_venta`
--
ALTER TABLE `product_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

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
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `vendedor_sucursal` FOREIGN KEY (`sucursal`) REFERENCES `sucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
