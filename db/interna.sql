-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-07-2018 a las 23:46:47
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
(30, 'BODEGA A', '', '');

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
  `cut` tinyint(1) DEFAULT 0,
  `sucursal` int(11) NOT NULL,
  `cut_global` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `folio_venta`
--

INSERT INTO `folio_venta` (`folio`, `vendedor`, `client`, `descuento`, `fecha`, `open`, `cobrado`, `fecha_venta`, `cut`, `sucursal`, `cut_global`) VALUES
('120180725162052', 1, 8, 0, '2018-07-25 16:20:52', 0, 3150, '2018-07-25 16:21:19', 0, 2, 1),
('120180725231422', 1, 1, 100, '2018-07-25 23:14:22', 1, NULL, NULL, 0, 2, 0);

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
(5, '12121', 'ASADOR CARBON ONE TOUCH 18.5', 'Asador de carbón marca WEBER. Fabricado en acero con esmalte de porcelana horneado. Ventilación en tapa. Rejilla de cocción de acero cromado. Rejilla para el carbón hecha de acero resistente a altas temperaturas. Diámetro 18\". Ventila de aluminio. Sistema de limpieza One Touch. Termómetro incorporado duradero. Rejilla articulada. Colector de cenizas de gran capacidad. Mango con ganchos para herramienta. \r\n(600498)', 1, 1, '', 'HERO', 'FERREMEX', 'product/600498-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 1849, 1500, 84, '', 5, 10),
(6, '564584', 'PLANTA KALANCHOE 6', 'Varios colores. Planta de media sombra. Riego 1 vez por semana. Maceta 15 cm de diámetro. Fertilización una vez al mes. \r\n(595077)', 1, 1, 'EN EL ANAQUEL 2 ', 'MARA ROSAL', 'DIR. MEXICO', 'product/595077-z.jpg', 'product/product_img220180702193033.jpg', 'product/product_img320180702193033.jpg', 'product/product_img420180702193033.jpg', 0, 39, 35, 6, '1 DIA', 0, 0),
(7, '6625', 'ATORNILLADOR INALÁMBRICO 3.6V CON LINTERNA BLACK & DECKER', 'Atornillador Inalámbrico 3.6 V Linterna LED incluída. Batería 3.6V de Ión Litio.Velocidad 200 RPM. Torque Máximo 4.0 Nm. \r\n(233139)\r\n\r\n* Se garantiza sus herramientas industriales por tres años de garantía limitada desde la compra. 1 año de mantenimiento gratuito; Que incluye limpieza general. Cambio de grasa. Carbones y mano de obra gratis. Sólo cubre tres mantenimientos en un año. <br> No incluye accesorios.', 2, 2, '', '', '', 'product/233139-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 779, 10, 4, '', 0, 0),
(8, '656541', 'TALADRO PERCUTOR/DESTORNILLADOR M18 1/2', 'Juego de taladro percutor/destonillador compacto de 1/2\" de 13 mm. Motor: Características de un diseño robusto combinado con imanes de tierras raras para una vida más larga el mejor en su clase. Diseño compacto: permite una mayor accesibilidad en el trabajo apretado. Funda todo metal: Proporciona máximo impacto y durabilidad de choque. Protege la herramienta contra situaciones de abuso y proporciona máxima duración. \r\n(401416)\r\n\r\n', 2, 2, '', '', '', 'product/401416-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 4499, 4200, 8, '', 15, 20),
(9, '6352', 'DISCO CORTE METAL 7', 'Ideal para corte de lámina y metales en general. Se puede usar en sierras circulares y esmeriladoras angulares. Modelo 2115. \r\n(436220)', 1, 2, '', '', '', 'product/436220-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 51.5, 31.5, 2, '', 10, 15),
(10, '6956', 'POLIDUCTO CONDUIT BICAPA 3/4', 'Se utiliza en instalación de cableado eléctrico. Económico. Medida 3/4\" 100 m x pieza. Dimensión .80 x 25 cm. 12 kg. \r\n(287871)', 1, 3, '', '', '', 'product/287871-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 449, 300, 7, '', 25, 15),
(11, '558', 'CENTRO DE CARGA 3P 100A DE SOBREPONER', 'Centro de carga para uso residencial y comercial ligero de montaje de sobreponer. Cuenta con conectores tipo opresor para fácil conexión. Envolvente de lámina de acero rolada en frío. Tipo 1. Uso interior. Terminales de aluminio estañado para mayor protección. Cumple con NOM. 240 V. Máximo Tipo NEMA 1. \r\n(434758)', 1, 3, '', '', '', 'product/434758-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 365, 10, 7, '', 6, 10),
(12, '646541', 'PLACA Y CONTACTO DOBLE CONTACTO BLANCO', 'Placa con doble contacto sin tierra en color blanco. 125 v. Material resistente a altas temperaturas. \r\n(703634)', 1, 3, '', '', '', 'product/703634-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 95, 10, 7, '', 2, 15),
(13, 'a41543', 'APISONADOR PARA COMPACTACIÓN MT74FAF', 'Motor Subaru de 3.5hp de cuatro tiempo a gasolina. Carburador de flotador. Zapata de impacto de 28.8 x 33.1 cm. Revoluciones por minuto 3600(rpm). 640-680 GPM. 1400kg de impacto. \r\n(474137)', 1, 4, '', '', '', 'product/474137-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 57249, 10, 9, '', 15, 10),
(14, '55', 'PLATAF DE MTTO NO CONDUCT 8 ESC', 'Plataforma móvil de fibra de vidrio no conductora de electricidad con pasamanos. Barandales y plataforma. Peldaños con superficie que previene los derrapes y diseño que facilita el ascenso y descenso. Ruedas para facilitar su transportación a las áreas de trabajo. Color amarillo. Capacidad de carga 136 kg. de Uso Industrial. Modelo FW2408. Garantía 1 año. ', 2, 4, '', '', '', 'product/473381-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 62700, 0, 10, '', 0, 0),
(15, '251a5641a', 'CONCERTINA GALVANIZADA 8 M', 'Caja con 8 metros lineales. espiral de navajas de 47 cm de diámetro para cercas o sobre bardas \r\n(807703)', 2, 4, '', '', '', 'product/807703-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 569, 350, 2, '', 4, 15),
(16, '56415641', 'CORTINA ENROLL TRANSLÚCIDA 160X180 CM MARFIL REGGIA', 'Cortina enrollable translúcida. Fabricada en poliéster. Color marfíl. Medida 160 cm de ancho x 180 cm de alto. Diseño minimalista. Reduce la entrada de luz solar y protege. Fácil instalación. Uso en interiores. \r\n(955965)', 1, 5, '', '', '', 'product/955965-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 455, 0, 100, '', 0, 0),
(17, '5615614', 'PERSIANA DUOLIGHT 1.60 X 2.20 MARFIL', 'Hecho de tela poliéster con cabezal y contrapeso cerrado de aluminio. Regula la entrada de la luz de manera parcial. Se puede instalar por fuera o por dentro del marco de la ventana. Incluye accesorios de seguridad para evitar que los niños jueguen con los cordones \r\n(800469)', 2, 5, '', '', '', 'product/800469-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 1875, 950, 100, '', 0, 0),
(18, '54541', 'PERSIANA HORIZONTAL PVC 1.0X1.6 MADERA REGGIA', 'Persiana horizontal de PVC. Color madera. Medida 100 cm de ancho x 160 cm de alto. Recomendada para habitaciones abiertas sala/comedor. Permite graduar la intensidad del paso de la luz. Accionamiento muy sencillo. Fácil mantenimiento. Uso en interiores. ', 1, 5, '', '', '', 'product/260402-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 555, 0, 100, '', 0, 0),
(21, '521541', 'PISO NORWEGIAN 18X55 CAOBA 1.49 M2 (110850)\r\n', 'Piso cerámico esmaltado. Tipo madera. Medida 18x55 cm. Color caoba. Tecnología digital. Para espacios en el interior y exterior. Recomendado para comedor. sala o recamaras. Trafico semi-intenso. Cobertura por caja de 1.49 m2. Grado de calidad 1A. Variación de tono extremo en su diseño. Fácil instalación \r\n', 1, 7, '', '', '', 'product/110850-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 205, 150, 19, '', 0, 0),
(22, '521541', 'REGADERA ANTISARRO CROMO 5 FUNCIONES\r\n', 'Acabado cromo. 5 funciones. 10 años de garantía. Modelo 56225-0501. \r\n', 1, 9, '', '', '', 'product/377246-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 900, 0, 10, '', 0, 0),
(23, '5612564', 'SANITARIO NEMESIS HUESO 1 PIEZA 3 Y 5 L', 'Sanitario de una sola pieza. Color hueso. Capacidad de descarga 350 gr. Tecnología doble descarga para un consumo menor a 5 L. Ahorrador de agua. Diseño alargado con asiento de cierre lento. Trampa oculta. Ahorra 10220 L de agua por persona al año (comparado con un sanitario de 10 L). \r\n', 1, 9, '', '', '', 'product/413203-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 2499, 10, 10, '', 0, 0),
(24, '5454', 'MEZCLADORA MONOMANDO PARA LAVABO CAMELIA CROMO\r\n', 'Si buscas calidad y un estilo excepcional esta mezcladora para lavabo Moen es tu mejor opción. Mezcladora Camelia. Es ahorradora utiliza hasta -32% de agua sin sacrificar rendimiento. Su acabado cromo altamente reflejante combina con cualquier estilo de decoración. Incluye desagüe y tapón retráctil. Suite completa para baño disponible. Garantía Moen contra fuga y goteo. \r\n', 1, 9, '', '', '', 'product/615428-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 1636, 0, 10, '', 0, 0),
(38, '554', 'KIT CAUTIN', 'CAUTIN', 1, 2, 'AAA', 'A', 'A', 'product/product_img120180702203110.jpg', '', '', '', 0, 120, 105, 10, 'MISMO DIA', 0, 0),
(39, '54156', '1111', '11', 30, 6, '', '', '', 'product/product_img120180714044922.jpg', '', '', '', 0, 10, 50, 1, '1', 5, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_sub`
--

CREATE TABLE `productos_sub` (
  `id` int(11) NOT NULL,
  `padre` int(11) NOT NULL,
  `almacen` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_sub`
--

INSERT INTO `productos_sub` (`id`, `padre`, `almacen`, `stock`) VALUES
(2, 5, 30, 20),
(3, 5, 2, 4),
(4, 14, 30, 10),
(5, 5, 30, 10),
(6, 5, 2, 150);

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
(36, '120180725162052', 5, 1, 1500, NULL, NULL),
(37, '120180725162052', 5, 1, 1500, 3, NULL),
(38, '120180725162052', NULL, 1, 150, NULL, 'producto generico');

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
(1, 'LAS PALMAS', 'AV. ADOLFO LOPEZX MATEO 23', '9231200505'),
(2, 'SALAMANCA', 'AV. ADOLFO LOPEZX MATEO 24', '01800122');

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
  `caja` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nombre`, `imagen`, `product_add`, `product_gest`, `gen_orden_compra`, `client_add`, `client_guest`, `almacen_add`, `almacen_guest`, `depa_add`, `depa_guest`, `propiedades`, `usuarios`, `finanzas`, `descripcion`, `sucursal`, `change_suc`, `sucursal_gest`, `caja`) VALUES
(1, 'root', '63a9f0ea7bb98050796b649e85481845', 'SUPER USUARIO', 'users/usuario20180725145242.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'aaaa', 2, 1, 1, 1);

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
-- AUTO_INCREMENT de la tabla `productos_sub`
--
ALTER TABLE `productos_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `product_venta`
--
ALTER TABLE `product_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
