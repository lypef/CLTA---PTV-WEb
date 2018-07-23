-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-07-2018 a las 06:13:54
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
(1, 'BODEGA LAS FLORES', 'AV. MARTIRES DE CHICAGO', '923554646'),
(2, 'BODEGA LAS MATAS', 'UBIACAION', '0000'),
(30, 'almacen', '', '');

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
(1, 'CLIENTE DEMO  2', ' 000', '5555', 100, '0000', 'INDUSTRIAS ALIMENTARIOS', '000a@A.com'),
(8, 'PUBLICO EN GENERAL', 'DIRECCION DEL CLIENTE', '9231299595', 1, 'AEDF920124554445G3', 'ASOCIADOS SA DE CV', 'AAA@A.COM'),
(16, 'CLIENTE DEMO 1', '', '', 0, '', '', '');

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
  `youtube` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `nombre_corto`, `direccion`, `correo`, `telefono`, `mision`, `vision`, `contacto`, `facebook`, `twitter`, `youtube`) VALUES
(1, 'TRACTO PARTES LOAIZA', 'FERRETERIA', 'TULIPANES Y GARDENIAS 321324SSS EQ. 10 DE MAYO', 'ventas@cyberchoapas.com', '+52 923120505+52 923114545', 'Somos una empresa comercializadora de productos de ferretería liviana que satisfacen las necesidades de nuestros clientes, con asesoría, calidad y respaldo.\r\nActuamos basados en nuestros valores corporativos, preservando el sano equilibrio entre los intereses de clientes, colaboradores, proveedores, accionistas y comunidad donde operamos.', 'En el año 2020 seremos la empresa ferretera preferida por nuestros clientes, brindándoles soluciones, desarrollando el talento humano de nuestros colaboradores y generando beneficios para los accionistas.', 'copntatciochlkjhlik\r\n', 'http://www.fb.com u ', 'http://www.fb.com u ', 'http://www.fb.com u ');

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
  `cut` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `folio_venta`
--

INSERT INTO `folio_venta` (`folio`, `vendedor`, `client`, `descuento`, `fecha`, `open`, `cobrado`, `fecha_venta`, `cut`) VALUES
('120180718045016', 1, 1, 20, '2018-07-18 04:50:16', 0, 2966.4, '2018-07-21 07:24:11', 1),
('120180718045019', 1, 8, 50, '2018-07-18 04:50:19', 0, 19820.2, '2018-07-20 05:27:02', 1),
('120180721054557', 1, 8, 0, '2018-07-21 05:45:57', 0, 300, '2018-07-19 07:24:35', 1),
('120180721072541', 1, 8, 0, '2018-07-21 07:25:41', 0, 1898, '2018-07-21 07:26:34', 1),
('120180721161538', 1, 16, 0, '2018-07-21 16:15:38', 0, 59098, '2018-07-21 16:43:17', 1),
('120180721174424', 1, 16, 0, '2018-07-21 17:44:24', 0, 0, '2018-07-23 04:44:27', 0),
('120180721174429', 1, 1, 100, '2018-07-21 17:44:29', 0, 0, '2018-07-23 04:45:59', 0);

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
  `stock_max` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `no. De parte`, `nombre`, `descripcion`, `almacen`, `departamento`, `loc_almacen`, `marca`, `proveedor`, `foto0`, `foto1`, `foto2`, `foto3`, `oferta`, `precio_normal`, `precio_oferta`, `stock`, `tiempo de entrega`, `stock_min`, `stock_max`) VALUES
(2, '', 'JUEGO DE TALADRO Y DESTORNILLADOR COMPACTO DE 12V RYOBI', 'El taladro/destornillador RYOBI de iones de litio de 12 V le ofrece un rendimiento óptimo con un diseño compacto. El tamaño reducido y la empuñadura ergonómica hacen que sea extremadamente fácil de manejar y es ideal para espacios reducidos. Cuenta con luz de trabajo LED para mayor visibilidad, mandril sin llave de 3 / 8 pulgadas, de alta resistencia, para cambiar brocas con rápidez y facilidad. Embrague de 22 posiciones para aplicaciones de alto torque. Compartimiento para brocas integrado para colocar cómodamente una broca extra, empuñadura ergonómica con revestimiento y microtextura para mayor comodidad para el usuario y un mejor agarre. Además de su diseño compacto para realizar trabajos de perforación y atornillado en espacios reducidos. Su peso liviano reduce el cansancio durante el uso prolongado para tu mayor comodidad. \r\n', 2, 6, 'aa', 'marca', 'provedoor', 'product/103421-za2.jpg', 'producto/103421-za2.jpg', 'producto/103421-za2.jpg', 'producto/103421-za2.jpg', 0, 1500, 1299, -1849, '15 dias', 3, 10),
(5, '600498', 'ASADOR CARBON ONE TOUCH 18.5', 'Asador de carbón marca WEBER. Fabricado en acero con esmalte de porcelana horneado. Ventilación en tapa. Rejilla de cocción de acero cromado. Rejilla para el carbón hecha de acero resistente a altas temperaturas. Diámetro 18\". Ventila de aluminio. Sistema de limpieza One Touch. Termómetro incorporado duradero. Rejilla articulada. Colector de cenizas de gran capacidad. Mango con ganchos para herramienta. \r\n(600498)', 1, 1, '', 'HERO', 'FERREMEX', 'product/600498-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 1849, 1500, 79, '', 5, 10),
(6, '595077', 'PLANTA KALANCHOE 6', 'Varios colores. Planta de media sombra. Riego 1 vez por semana. Maceta 15 cm de diámetro. Fertilización una vez al mes. \r\n(595077)', 1, 1, 'EN EL ANAQUEL 2 ', 'MARA ROSAL', 'DIR. MEXICO', 'product/595077-z.jpg', 'product/product_img220180702193033.jpg', 'product/product_img320180702193033.jpg', 'product/product_img420180702193033.jpg', 0, 39, 35, 7, '1 DIA', 0, 0),
(7, '233139', 'ATORNILLADOR INALÁMBRICO 3.6V CON LINTERNA BLACK & DECKER', 'Atornillador Inalámbrico 3.6 V Linterna LED incluída. Batería 3.6V de Ión Litio.Velocidad 200 RPM. Torque Máximo 4.0 Nm. \r\n(233139)\r\n\r\n* Se garantiza sus herramientas industriales por tres años de garantía limitada desde la compra. 1 año de mantenimiento gratuito; Que incluye limpieza general. Cambio de grasa. Carbones y mano de obra gratis. Sólo cubre tres mantenimientos en un año. <br> No incluye accesorios.', 2, 2, '', '', '', 'product/233139-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 779, 10, 5, '', 0, 0),
(8, '401416', 'TALADRO PERCUTOR/DESTORNILLADOR M18 1/2', 'Juego de taladro percutor/destonillador compacto de 1/2\" de 13 mm. Motor: Características de un diseño robusto combinado con imanes de tierras raras para una vida más larga el mejor en su clase. Diseño compacto: permite una mayor accesibilidad en el trabajo apretado. Funda todo metal: Proporciona máximo impacto y durabilidad de choque. Protege la herramienta contra situaciones de abuso y proporciona máxima duración. \r\n(401416)\r\n\r\n', 2, 2, '', '', '', 'product/401416-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 4499, 4200, 8, '', 15, 20),
(9, '436220', 'DISCO CORTE METAL 7', 'Ideal para corte de lámina y metales en general. Se puede usar en sierras circulares y esmeriladoras angulares. Modelo 2115. \r\n(436220)', 1, 2, '', '', '', 'product/436220-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 51.5, 31.5, 2, '', 10, 15),
(10, '287871', 'POLIDUCTO CONDUIT BICAPA 3/4', 'Se utiliza en instalación de cableado eléctrico. Económico. Medida 3/4\" 100 m x pieza. Dimensión .80 x 25 cm. 12 kg. \r\n(287871)', 1, 3, '', '', '', 'product/287871-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 449, 300, 7, '', 25, 15),
(11, '434758', 'CENTRO DE CARGA 3P 100A DE SOBREPONER', 'Centro de carga para uso residencial y comercial ligero de montaje de sobreponer. Cuenta con conectores tipo opresor para fácil conexión. Envolvente de lámina de acero rolada en frío. Tipo 1. Uso interior. Terminales de aluminio estañado para mayor protección. Cumple con NOM. 240 V. Máximo Tipo NEMA 1. \r\n(434758)', 1, 3, '', '', '', 'product/434758-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 365, 10, 7, '', 6, 10),
(12, '703634', 'PLACA Y CONTACTO DOBLE CONTACTO BLANCO', 'Placa con doble contacto sin tierra en color blanco. 125 v. Material resistente a altas temperaturas. \r\n(703634)', 1, 3, '', '', '', 'product/703634-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 95, 10, 7, '', 2, 15),
(13, '474137', 'APISONADOR PARA COMPACTACIÓN MT74FAF', 'Motor Subaru de 3.5hp de cuatro tiempo a gasolina. Carburador de flotador. Zapata de impacto de 28.8 x 33.1 cm. Revoluciones por minuto 3600(rpm). 640-680 GPM. 1400kg de impacto. \r\n(474137)', 1, 4, '', '', '', 'product/474137-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 57249, 10, 9, '', 15, 10),
(14, '473381', 'PLATAF DE MTTO NO CONDUCT 8 ESC', 'Plataforma móvil de fibra de vidrio no conductora de electricidad con pasamanos. Barandales y plataforma. Peldaños con superficie que previene los derrapes y diseño que facilita el ascenso y descenso. Ruedas para facilitar su transportación a las áreas de trabajo. Color amarillo. Capacidad de carga 136 kg. de Uso Industrial. Modelo FW2408. Garantía 1 año. ', 2, 4, '', '', '', 'product/473381-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 62700, 0, 10, '', 0, 0),
(15, '807703', 'CONCERTINA GALVANIZADA 8 M', 'Caja con 8 metros lineales. espiral de navajas de 47 cm de diámetro para cercas o sobre bardas \r\n(807703)', 2, 4, '', '', '', 'product/807703-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 569, 350, 2, '', 4, 15),
(16, '955965', 'CORTINA ENROLL TRANSLÚCIDA 160X180 CM MARFIL REGGIA', 'Cortina enrollable translúcida. Fabricada en poliéster. Color marfíl. Medida 160 cm de ancho x 180 cm de alto. Diseño minimalista. Reduce la entrada de luz solar y protege. Fácil instalación. Uso en interiores. \r\n(955965)', 1, 5, '', '', '', 'product/955965-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 455, 0, 100, '', 0, 0),
(17, '800469', 'PERSIANA DUOLIGHT 1.60 X 2.20 MARFIL', 'Hecho de tela poliéster con cabezal y contrapeso cerrado de aluminio. Regula la entrada de la luz de manera parcial. Se puede instalar por fuera o por dentro del marco de la ventana. Incluye accesorios de seguridad para evitar que los niños jueguen con los cordones \r\n(800469)', 2, 5, '', '', '', 'product/800469-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 1875, 950, 100, '', 0, 0),
(18, '260402', 'PERSIANA HORIZONTAL PVC 1.0X1.6 MADERA REGGIA', 'Persiana horizontal de PVC. Color madera. Medida 100 cm de ancho x 160 cm de alto. Recomendada para habitaciones abiertas sala/comedor. Permite graduar la intensidad del paso de la luz. Accionamiento muy sencillo. Fácil mantenimiento. Uso en interiores. ', 1, 5, '', '', '', 'product/260402-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 555, 0, 100, '', 0, 0),
(21, '110850', 'PISO NORWEGIAN 18X55 CAOBA 1.49 M2 (110850)\r\n', 'Piso cerámico esmaltado. Tipo madera. Medida 18x55 cm. Color caoba. Tecnología digital. Para espacios en el interior y exterior. Recomendado para comedor. sala o recamaras. Trafico semi-intenso. Cobertura por caja de 1.49 m2. Grado de calidad 1A. Variación de tono extremo en su diseño. Fácil instalación \r\n', 1, 7, '', '', '', 'product/110850-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 205, 150, 19, '', 0, 0),
(22, '377246', 'REGADERA ANTISARRO CROMO 5 FUNCIONES\r\n', 'Acabado cromo. 5 funciones. 10 años de garantía. Modelo 56225-0501. \r\n', 1, 9, '', '', '', 'product/377246-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 900, 0, 10, '', 0, 0),
(23, '413203', 'SANITARIO NEMESIS HUESO 1 PIEZA 3 Y 5 L', 'Sanitario de una sola pieza. Color hueso. Capacidad de descarga 350 gr. Tecnología doble descarga para un consumo menor a 5 L. Ahorrador de agua. Diseño alargado con asiento de cierre lento. Trampa oculta. Ahorra 10220 L de agua por persona al año (comparado con un sanitario de 10 L). \r\n', 1, 9, '', '', '', 'product/413203-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 2499, 10, 10, '', 0, 0),
(24, '615428', 'MEZCLADORA MONOMANDO PARA LAVABO CAMELIA CROMO\r\n', 'Si buscas calidad y un estilo excepcional esta mezcladora para lavabo Moen es tu mejor opción. Mezcladora Camelia. Es ahorradora utiliza hasta -32% de agua sin sacrificar rendimiento. Su acabado cromo altamente reflejante combina con cualquier estilo de decoración. Incluye desagüe y tapón retráctil. Suite completa para baño disponible. Garantía Moen contra fuga y goteo. \r\n', 1, 9, '', '', '', 'product/615428-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 1636, 0, 10, '', 0, 0),
(38, 'KAUU', 'KIT CAUTIN', 'CAUTIN', 1, 2, 'AAA', 'A', 'A', 'product/product_img120180702203110.jpg', '', '', '', 0, 120, 105, 10, 'MISMO DIA', 0, 0),
(39, '415845454', '1111', '11', 30, 6, '', '', '', 'product/product_img120180714044922.jpg', '', '', '', 0, 10, 50, 1, '1', 5, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_venta`
--

CREATE TABLE `product_venta` (
  `id` int(11) NOT NULL,
  `folio_venta` varchar(254) NOT NULL,
  `product` int(11) NOT NULL,
  `unidades` int(11) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product_venta`
--

INSERT INTO `product_venta` (`id`, `folio_venta`, `product`, `unidades`, `precio`) VALUES
(9, '120180718045019', 5, 4, 1849),
(10, '120180718045019', 7, 1, 10),
(11, '120180718045019', 9, 1, 31.5),
(12, '120180718045019', 10, 2, 300),
(13, '120180718045019', 11, 2, 365),
(14, '120180718045019', 8, 2, 4200),
(15, '120180718045019', 12, 3, 95),
(16, '120180718045019', 5, 10, 1849),
(17, '120180718045019', 5, 2, 1849),
(18, '120180718045016', 5, 2, 1849),
(19, '120180718045016', 7, 1, 10),
(22, '120180721054557', 10, 1, 300),
(23, '120180721072541', 5, 1, 1849),
(24, '120180721072541', 6, 1, 39),
(25, '120180721072541', 7, 1, 10),
(28, '120180721161538', 5, 1, 1849),
(29, '120180721161538', 13, 1, 57249),
(30, '120180721174429', 6, 1, 39),
(31, '120180721174429', 9, 1, 31.5);

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
  `descripcion` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nombre`, `imagen`, `product_add`, `product_gest`, `gen_orden_compra`, `client_add`, `client_guest`, `almacen_add`, `almacen_guest`, `depa_add`, `depa_guest`, `propiedades`, `usuarios`, `finanzas`, `descripcion`) VALUES
(1, 'root', '63a9f0ea7bb98050796b649e85481845', 'NOMBRE DE AMINISTRADOR', 'users/usuario20180721072102.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'ESTE ES UN TEXTO EN EL CUAL SE DESCRIBE ALGUNAS CARACTERISTICAS ACERCA DE CADA USUARIOESTE ES UN TEXTO EN EL CUAL SE DESCRIBE ALGUNAS CARACTERISTICAS ACERCA DE CADA USUARIO');

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
  ADD KEY `vendedor_folio` (`vendedor`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_almacen` (`almacen`),
  ADD KEY `producto_departamento` (`departamento`);

--
-- Indices de la tabla `product_venta`
--
ALTER TABLE `product_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folio_venta` (`folio_venta`),
  ADD KEY `sale_product` (`product`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `product_venta`
--
ALTER TABLE `product_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `folio_venta`
--
ALTER TABLE `folio_venta`
  ADD CONSTRAINT `client_folio` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vendedor_folio` FOREIGN KEY (`vendedor`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `producto_almacen` FOREIGN KEY (`almacen`) REFERENCES `almacen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_departamento` FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `product_venta`
--
ALTER TABLE `product_venta`
  ADD CONSTRAINT `folio_venta` FOREIGN KEY (`folio_venta`) REFERENCES `folio_venta` (`folio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_product` FOREIGN KEY (`product`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
