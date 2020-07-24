-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-07-2020 a las 21:39:10
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `softboxz_shop`
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
(1, 'ZACATECAS', 'VIALIDAD ARROYO DE LA PLATA #68-C', '4929212835');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `annuities`
--

CREATE TABLE `annuities` (
  `id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `concepto` varchar(254) NOT NULL,
  `price` float NOT NULL,
  `date_ini` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'PUBLICO EN GENERAL', '', '0000', 0, 'XAXX010101000', 'PUBLICO EN GENERAL', 'softboxzac@gmail.com'),
(2, 'SIXTO LEON SANTIAGO', 'SAN MIGUEL AMOLTEPEC, MPIO.COCHOAPA EL GRANDE GUERRERO, C.P. 41640', '', 0, 'LESS890725948', 'SIXTO LEON SANTIAGO', 'ingsix_2507@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credits`
--

CREATE TABLE `credits` (
  `id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `f_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `factura` varchar(254) NOT NULL,
  `adeudo` decimal(65,4) NOT NULL,
  `abono` decimal(65,4) NOT NULL,
  `dias_credit` int(11) NOT NULL,
  `pay` tinyint(1) NOT NULL DEFAULT '0',
  `sucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credit_pay`
--

CREATE TABLE `credit_pay` (
  `id` int(11) NOT NULL,
  `credito` int(11) NOT NULL,
  `monto` decimal(65,4) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(33, 'SERVICIOS INTEGRALES', 'SERVICIOS CCTV, CONTROL DE ACCESO, REDES, MTTO, PUNTO DE VENTA.'),
(41, 'VIDEOVIGILANCIA', 'ACCESORIOS GENERALES, CAMARAS IP Y NVR, CAMARAS Y DVR HD, CABLES Y CONECTORES, ENERGIA, KITS, MONITORES, SERVIDORES Y SOFTWARE.'),
(42, 'CONTROL DE ACCESO', 'ACCESO VEHICULAR, ACCESORIOS, BIOMETRICOS, CERRADURAS, LECTORES Y TARJETAS, TORNIQUETES Y PUERTAS, VIDEOPORTEROS E INTERFONOS.'),
(43, 'ENERGIA', 'BATERIAS, CABLES, CARGADORES DE BATERIAS, SOLAR Y EOLICA, FUENTES DE PODER,  PDU, UPS/RESPALDO, PROTECCION CONTRA DESCARGAS.'),
(44, 'ALARMAS/INTRUSION/CASA INTELIGENTE', 'ACCESORIOS, AUTOMATIZACION (HOGAR), CENTRALES DE MONITOREO, CERCAS ELECTRICAS, DETECTORES/SENSORES, ENERGIA, GABINETES/CARCASAS, SEÑALAMIENTOS, SISTEMA DE EMERGENCIA.'),
(45, 'REDES/AUDIO Y VIDEO', 'AUDIO/VIDEO/VOCEO, COBERTURA PARA CELULAR, ENLACES PTP Y PTMP, NETWORKING, RACKS Y GABINETES, REDES WIFI, TORRES Y MASTILES, TELEFONIA IP.'),
(46, 'CABLEADO ESTRUCTURADO', 'CABLE, CABLEADO DE COBRE, CANALIZACION, CHAROLA, CONECTORES, FIBRA OPTICA, PDU, RACKS Y GABINETES.'),
(47, 'IoT/GPS/TELEMATICA', 'ACCESORIOS, BARRAS, ESTROBOS, IoT/GPS/TELEMATICA, LUCES PERIMETRALES, SIRENAS/BOCINAS, VIDEOGRABADORAS MOVILES Y PORTATILES.'),
(48, 'PUNTO DE VENTA', 'ACCESORIOS, MINIPRINTERS, LECTORES CODIGO DE BARRAS, CAJONES DE DINERO, IMPRESORAS DE ETIQUETAS, LECTORES DE HUELLA, MONITORES TOUCH Y SOFTWARE.'),
(49, 'COMPUTADORAS', 'LAPTOP, COMPUTADORAS ALL ONE, COMPUTADORAS DE ESCRITORIO, ENSAMBLADAS, TABLETAS.'),
(50, 'IMPRESORAS/MULTIFUNCIONALES', 'IMPRESORAS LASER, INYECCION DE TINTA, MATRICIALES, TERMICAS Y MULTIFUNCIONALES A COLOR, BLANCO Y NEGRO.');

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
(1, 'SOFTBOX ZACATECAS', 'SOFTBOXZAC', 'Vialidad Arroyo de la Plata #68-C Col. Centro,Guadalupe, Zacatecas ', 'ventas@softboxzac.mx', '(492)92 1 28 35', 'Ofrecer una amplia gama de productos y servicios de tecnologia, software y seguridad para todo tipo de hogar, negocio, institucion o empresa.', 'Ser una empresa lider en el ramo de la tecnologia, software y seguridad, donde nuestros clientes encuentren LA SOLUCIÓN en el mismo lugar, nuestra compañia.\r\n', 'Whatsapp\r\n<br><a target=\"_BLANK\" href=\"https://wa.me/5214922187782\" style=\"color:white;\">+52 492 218 77 82</a>\r\n<br><br>\r\n\r\nCorreo\r\n<br>ventas@softboxzac.mx\r\nsoftboxzac@gmail.com\r\n<br>', 'https://www.facebook.com/softboxzac/', 'https://www.youtube.com/channel/UCZlU7T3RbtvY-ExdedEphKw?view_as=subscriber', 'https://www.youtube.com/channel/UCZlU7T3RbtvY-ExdedEphKw?view_as=subscriber', 16, '<div></div>Todos nuestros productos tienen 3 años de garantia contra defectos de fabrica. Precios sujetos a cambios sin previo aviso.', '98600', 'RACG860327RI6', '621', 'SDK2/certificados/CER.cer  ', 'SDK2/certificados/KEY.key', 'Racg86035', 'Kr6fxCQhFJQUXfGTIaAYrZRKkc7/PAjs2OljTt1sozw');

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
  `cut` tinyint(1) DEFAULT '0',
  `sucursal` int(11) NOT NULL,
  `cut_global` int(11) NOT NULL DEFAULT '0',
  `iva` int(11) NOT NULL DEFAULT '0',
  `t_pago` varchar(254) NOT NULL DEFAULT 'Ninguno',
  `pedido` tinyint(1) NOT NULL DEFAULT '0',
  `folio_venta_ini` varchar(254) DEFAULT NULL,
  `cotizacion` tinyint(1) NOT NULL DEFAULT '0',
  `concepto` varchar(254) DEFAULT NULL,
  `comision_pagada` tinyint(1) NOT NULL DEFAULT '0',
  `oxxo_pay` varchar(254) NOT NULL DEFAULT '0',
  `titulo` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `oferta` tinyint(1) NOT NULL DEFAULT '0',
  `precio_normal` float NOT NULL DEFAULT '0',
  `precio_oferta` float NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL,
  `tiempo de entrega` varchar(254) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `stock_max` int(11) NOT NULL,
  `precio_costo` float NOT NULL DEFAULT '0',
  `cv` varchar(254) NOT NULL DEFAULT '01010101',
  `um` varchar(254) NOT NULL DEFAULT 'H87',
  `um_des` varchar(254) NOT NULL DEFAULT 'NA'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `no. De parte`, `nombre`, `descripcion`, `almacen`, `departamento`, `loc_almacen`, `marca`, `proveedor`, `foto0`, `foto1`, `foto2`, `foto3`, `oferta`, `precio_normal`, `precio_oferta`, `stock`, `tiempo de entrega`, `stock_min`, `stock_max`, `precio_costo`, `cv`, `um`, `um_des`) VALUES
(1, 'SERVICIO/CAMARAS', 'SERVICIO DE INSTALACION Y CONFIGURACION DE CAMARAS DE VIDEOVIGILANCIA. (PRECIO X CAMARA)', 'Servicio de instalación y configuración de cámaras de video-vigilancia (no incluye material)', 1, 33, '', 'Softbox Zacatecas', 'Softbox Zacatecas', 'product/product_img120200706182035.jpg', 'product/product_img220200706182035.jpg', 'product/product_img320200706182035.jpg', 'product/product_img420200706182035.jpg', 0, 450, 350, 0, 'Varia segun cantidad de cámaras y entorno del sitio.', 1, 5000, 0, '72151605', 'E48', 'Unidad de Servicio'),
(2, 'KESTXLT2BW', 'KIT TurboHD 720p / DVR 4 Canales / 2 Cámaras Bala (interior - exterior 2.8 mm) / Hik-Connect ', 'KIT TurboHD 720p / DVR 4 Canales / 2 Cámaras Bala (interior - exterior 2.8 mm) / Hik-Connect \r\n<table width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td><span style=\"color: #0000ff;\"><strong><a style=\"color: #0000ff;\" href=\"http://www.productosinfo.net/s/mx/es/36719/5901c2f76844faa1f66c684f5abcce07/x/-US$/KESTXLT2BW-EPCOM-95110.html\" target=\"_blank\" rel=\"noopener\">Ver más detalles</a></strong></span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n', 1, 41, '', 'EPCOM', 'SYSCOM', 'product/product_img120200706183138.jpg', '', '', '', 1, 3686.43, 2374.63, 250, '2 Días Hábiles', 1, 500, 1458.98, '46171600', 'XKI', 'Kit (Conjunto de piezas)'),
(3, 'KIT7204BP', 'KIT TurboHD 720p / DVR 4 canales / 4 Cámaras Bala de Policarbonato / 4 Cables 18 Mts / 1 Fuente de Poder Profesional ', 'KIT TurboHD 720p / DVR 4 canales / 4 Cámaras Bala de Policarbonato / 4 Cables 18 Mts / 1 Fuente de Poder Profesional \r\n<table width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td><span style=\"color: #0000ff;\"><strong><a style=\"color: #0000ff;\" href=\"http://www.productosinfo.net/s/mx/es/36719/5901c2f76844faa1f66c684f5abcce07/x/-US$/KIT7204BP-HILOOK+BY+HIKVISION-160318.html\" rel=\"noopener\">Ver más detalles</a></strong></span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n', 1, 41, '', 'HILOOK BY HIKVISION', 'SYSCOM', 'product/product_img120200706190949.jpg', 'product/product_img220200706190949.jpg', '', '', 1, 4088.83, 2968.36, 250, '2 Días Hábiles', 1, 500, 1823.76, '46171622', 'XKI', 'Kit (Conjunto de piezas)'),
(4, 'LB7KIT4P', 'Kit TurboHD 720p / DVR 4 canales / 4 Cámaras Bala de Policarbonato / 4 Cables 18 Mts / 1 Fuente de Poder Profesional / Compatible con Hik-Connect P2P', 'Kit TurboHD 720p / DVR 4 canales / 4 Cámaras Bala de Policarbonato / 4 Cables 18 Mts / 1 Fuente de Poder Profesional / Compatible con Hik-Connect P2P\r\n<table width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td><span style=\"color: #0000ff;\"><strong><a style=\"color: #0000ff;\" href=\"http://www.productosinfo.net/s/mx/es/36719/5901c2f76844faa1f66c684f5abcce07/x/-US$/LB7KIT4P-EPCOM-168119.html\" \r\nrel=\"noopener\">Ver más detalles</a></strong></span></td>\r\n</tr>\r\n</tbody>\r\n</table>', 1, 41, '', 'EPCOM', 'SYSCOM', 'product/product_img120200706191707.jpg', 'product/product_img220200706191707.jpg', '', '', 1, 4089.09, 3571.95, 250, '2 Días Hábiles', 1, 500, 2194.6, '46171622', 'XKI', 'Kit (Conjunto de piezas)'),
(5, 'THC-B220-MC', 'Bullet TURBOHD 1080p / Gran Angular 103º / Lente 2.8 mm / METAL / IR EXIR Inteligente 40 mts / Exterior IP66 / TVI-AHD-CVI-CVBS / dWDR', 'Bullet TURBOHD 1080p / Gran Angular 103º / Lente 2.8 mm / METAL / IR EXIR Inteligente 40 mts / Exterior IP66 / TVI-AHD-CVI-CVBS / dWDR\r\n<table width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td><span style=\"color: #0000ff;\"><strong><a style=\"color: #0000ff;\" href=http://www.productosinfo.net/s/mx/es/36719/5901c2f76844faa1f66c684f5abcce07/x/NzUw-MX$/THC-B220-MC-HILOOK+BY+HIKVISION-163189.html\" rel=\"noopener\">Ver más detalles</a></strong></span></td>\r\n</tr>\r\n</tbody>\r\n</table>', 1, 41, '', 'HILOOK BY HIKVISION', 'SYSCOM', 'product/product_img120200715004612.jpg', '', '', '', 1, 750, 460.6, 250, '2 Días Hábiles', 1, 500, 460.6, '46171610', 'E48', 'PIEZA'),
(6, 'LBE-M5-23-U', 'LiteBeam airMAX M5 CPE hasta 100 Mbps, 5 GHz (5150 - 5875 MHz) con antena integrada de 23 dBi, incluye montaje universal UMOUNT', 'LiteBeam airMAX M5 CPE hasta 100 Mbps, 5 GHz (5150 - 5875 MHz) con antena integrada de 23 dBi, incluye montaje universal UMOUNT\r\n<table width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td><span style=\"color: #0000ff;\"><strong><a style=\"color: #0000ff;\" href=http://www.productosinfo.net/s/mx/es/36719/5901c2f76844faa1f66c684f5abcce07/x/MjI1NQ==-MX$/LBE-M5-23-U-UBIQUITI+NETWORKS-163214.html\" rel=\"noopener\">Ver más detalles</a></strong></span></td>\r\n</tr>\r\n</tbody>\r\n</table>', 1, 45, '', 'UBIQUITI NETWORKS', 'SYSCOM', 'product/product_img120200715005200.jpg', '', '', '', 1, 2255.09, 1385.53, 250, '2 Días Hábiles', 1, 500, 1385.53, '43222640', 'E48', 'PIEZA');

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
  `max` int(11) NOT NULL DEFAULT '0',
  `min` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soporte`
--

CREATE TABLE `soporte` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(254) NOT NULL,
  `costo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(10, 'SOFTBOX ZACATECAS', 'Vialidad Arroyo de la Plata #68-C Col. Centro,Guadalupe, Zacatecas', '4929212835', 'A');

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
(8, 10, 1);

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
  `product_add` tinyint(1) NOT NULL DEFAULT '0',
  `product_gest` tinyint(1) NOT NULL DEFAULT '0',
  `gen_orden_compra` tinyint(1) NOT NULL DEFAULT '0',
  `client_add` tinyint(1) NOT NULL DEFAULT '0',
  `client_guest` tinyint(1) NOT NULL DEFAULT '0',
  `almacen_add` tinyint(1) NOT NULL DEFAULT '0',
  `almacen_guest` tinyint(1) NOT NULL DEFAULT '0',
  `depa_add` tinyint(1) NOT NULL DEFAULT '0',
  `depa_guest` tinyint(1) NOT NULL DEFAULT '0',
  `propiedades` tinyint(1) NOT NULL DEFAULT '0',
  `usuarios` tinyint(1) NOT NULL DEFAULT '0',
  `finanzas` tinyint(1) NOT NULL DEFAULT '0',
  `descripcion` longtext NOT NULL,
  `sucursal` int(11) NOT NULL,
  `change_suc` tinyint(1) NOT NULL,
  `sucursal_gest` tinyint(1) NOT NULL DEFAULT '0',
  `caja` tinyint(1) NOT NULL DEFAULT '0',
  `super_pedidos` tinyint(1) NOT NULL DEFAULT '0',
  `comision` int(11) DEFAULT '5',
  `sueldo` float NOT NULL DEFAULT '0',
  `vtd_pg` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nombre`, `imagen`, `product_add`, `product_gest`, `gen_orden_compra`, `client_add`, `client_guest`, `almacen_add`, `almacen_guest`, `depa_add`, `depa_guest`, `propiedades`, `usuarios`, `finanzas`, `descripcion`, `sucursal`, `change_suc`, `sucursal_gest`, `caja`, `super_pedidos`, `comision`, `sueldo`, `vtd_pg`) VALUES
(1, 'root', '8df4b933382acf2562a935d14d3cd11d', 'ING. GILBERTO RAMIREZ CORREA', 'users/usuario20200706182131.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'Administrador', 10, 1, 1, 1, 1, 5, 1800, 1),
(40, 'ventas', '530b350d414da3378a15b3149b322908', 'Usuario para ventas', '', 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 'Usuario para ventas', 10, 0, 0, 1, 1, 5, 0, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `annuities`
--
ALTER TABLE `annuities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `credits`
--
ALTER TABLE `credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credit_pay`
--
ALTER TABLE `credit_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos_sub`
--
ALTER TABLE `productos_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_pedido`
--
ALTER TABLE `product_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_venta`
--
ALTER TABLE `product_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soporte`
--
ALTER TABLE `soporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sucursal_almacen`
--
ALTER TABLE `sucursal_almacen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
