-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-07-2018 a las 05:43:03
-- Versión del servidor: 10.2.15-MariaDB
-- Versión de PHP: 7.2.6

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
(1, 'ALMACEN 1', 'AV. MARTIRES DE CHICAGO', '00000\r\n'),
(2, 'ALMACEN 2', 'UBIACAION', '0000\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `descripcion` varchar(254) NOT NULL,
  `url` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `descripcion`, `url`) VALUES
(1, 'HOGAR & JARDIN', 'PRODUCTOS DE HOGAR & GARDIN', '/dfdfdfdf'),
(2, 'HERRAMIENTAS', 'HERRAMIENTAS\r\n', '/dfdfdfdf'),
(3, 'MATERIAL ELECTRICO', 'MATERIAL ELECTRICO\r\n', '/dfdfdfdf'),
(4, 'MAQUINARIA', 'MAQUINARIA ', '/dfdfdfdf'),
(5, 'DECORACION', 'EQUIPOS DE CAMPO', '/dfdfdfdf'),
(6, 'FERRETERIA', 'PRODUCTOS QUE NO ENCAGEN EN OTROS DEPARTAMENTOS', '/dfdfdfdf'),
(7, 'PISOS', 'PISOS', 'SS\r\n'),
(9, 'BAÑOS', 'BAÑOS Y ACCESORIOS', 'SASS\r\n');

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
(1, 'FERRETERA DEL NORTE SA. DE C.V', 'FERRETERIA', 'TULIPANES Y GARDENIAS 321324SSS EQ. 10 DE MAYO', 'contacto@cyberchoapas.com\r\nventas@cyberchoapas.com', '+52 923120505\r\n+52 923114545', 'Lorem ipsum dolor sit amet, consecteir our adipisicing elit, sed do eiusmod tempor the incididunt ut labore et dolore magnaa liqua. Ut enim minimn.', 'Lorem ipsum dolor sit amet, consecteir our adipisicing elit, sed do eiusmod tempor the incididunt ut labore et dolore magnaa liqua. Ut enim minimn.', 'Lorem ipsum dolor sit amet, consecteir our adipisicing elit, sed do eiusmod tempor the incididunt ut labore et dolore magnaa liqua. Ut enim minimn.', 'http://www.fb.com', 'http://www.fb.com', 'http://www.fb.com\r\n');

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
  `tiempo de entrega` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `no. De parte`, `nombre`, `descripcion`, `almacen`, `departamento`, `loc_almacen`, `marca`, `proveedor`, `foto0`, `foto1`, `foto2`, `foto3`, `oferta`, `precio_normal`, `precio_oferta`, `stock`, `tiempo de entrega`) VALUES
(2, '103421', 'JUEGO DE TALADRO Y DESTORNILLADOR COMPACTO DE 12V RYOBI', 'El taladro/destornillador RYOBI de iones de litio de 12 V le ofrece un rendimiento óptimo con un diseño compacto. El tamaño reducido y la empuñadura ergonómica hacen que sea extremadamente fácil de manejar y es ideal para espacios reducidos. Cuenta con luz de trabajo LED para mayor visibilidad, mandril sin llave de 3 / 8 pulgadas, de alta resistencia, para cambiar brocas con rápidez y facilidad. Embrague de 22 posiciones para aplicaciones de alto torque. Compartimiento para brocas integrado para colocar cómodamente una broca extra, empuñadura ergonómica con revestimiento y microtextura para mayor comodidad para el usuario y un mejor agarre. Además de su diseño compacto para realizar trabajos de perforación y atornillado en espacios reducidos. Su peso liviano reduce el cansancio durante el uso prolongado para tu mayor comodidad. \r\n', 2, 6, 'aa', 'marca', 'provedoor', 'product/103421-za2.jpg', 'producto/103421-za2.jpg', 'producto/103421-za2.jpg', 'producto/103421-za2.jpg', 1, 1219, 1100, 10, '15 dias\r\n'),
(5, '600498', 'ASADOR CARBON ONE TOUCH 18.5\"', 'Asador de carbón marca WEBER. Fabricado en acero con esmalte de porcelana horneado. Ventilación en tapa. Rejilla de cocción de acero cromado. Rejilla para el carbón hecha de acero resistente a altas temperaturas. Diámetro 18\". Ventila de aluminio. Sistema de limpieza One Touch. Termómetro incorporado duradero. Rejilla articulada. Colector de cenizas de gran capacidad. Mango con ganchos para herramienta. \r\n(600498)', 1, 1, '', '', '', 'product/600498-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 1849, 1500, 10, ''),
(6, '595077', 'PLANTA KALANCHOE 6\"', 'Varios colores. Planta de media sombra. Riego 1 vez por semana. Maceta 15 cm de diámetro. Fertilización una vez al mes. \r\n(595077)', 1, 1, 'EN EL ANAQUEL 2 ', 'MARA ROSAL', 'DIR. MEXICO', 'product/595077-z.jpg', 'product/600498-z.jpg', 'product/434758-z.jpg', 'product/474137-z.jpg', 0, 39, 35, 10, '1 DIA'),
(7, '233139', 'ATORNILLADOR INALÁMBRICO 3.6V CON LINTERNA BLACK & DECKER', 'Atornillador Inalámbrico 3.6 V Linterna LED incluída. Batería 3.6V de Ión Litio.Velocidad 200 RPM. Torque Máximo 4.0 Nm. \r\n(233139)\r\n\r\n* Se garantiza sus herramientas industriales por tres años de garantía limitada desde la compra. 1 año de mantenimiento gratuito; Que incluye limpieza general. Cambio de grasa. Carbones y mano de obra gratis. Sólo cubre tres mantenimientos en un año. <br> No incluye accesorios.', 2, 2, '', '', '', 'product/233139-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 779, 10, 10, ''),
(8, '401416', 'TALADRO PERCUTOR/DESTORNILLADOR M18 1/2\"', 'Juego de taladro percutor/destonillador compacto de 1/2\" de 13 mm. Motor: Características de un diseño robusto combinado con imanes de tierras raras para una vida más larga el mejor en su clase. Diseño compacto: permite una mayor accesibilidad en el trabajo apretado. Funda todo metal: Proporciona máximo impacto y durabilidad de choque. Protege la herramienta contra situaciones de abuso y proporciona máxima duración. \r\n(401416)\r\n\r\n', 2, 2, '', '', '', 'product/401416-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 4499, 4200, 10, ''),
(9, '436220', 'DISCO CORTE METAL 7\" X 1/8\" DIA', 'Ideal para corte de lámina y metales en general. Se puede usar en sierras circulares y esmeriladoras angulares. Modelo 2115. \r\n(436220)', 1, 2, '', '', '', 'product/436220-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 51.5, 31.5, 100, ''),
(10, '287871', 'POLIDUCTO CONDUIT BICAPA 3/4\" 100 M', 'Se utiliza en instalación de cableado eléctrico. Económico. Medida 3/4\" 100 m x pieza. Dimensión .80 x 25 cm. 12 kg. \r\n(287871)', 1, 3, '', '', '', 'product/287871-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 449, 300, 10, ''),
(11, '434758', 'CENTRO DE CARGA 3P 100A DE SOBREPONER', 'Centro de carga para uso residencial y comercial ligero de montaje de sobreponer. Cuenta con conectores tipo opresor para fácil conexión. Envolvente de lámina de acero rolada en frío. Tipo 1. Uso interior. Terminales de aluminio estañado para mayor protección. Cumple con NOM. 240 V. Máximo Tipo NEMA 1. \r\n(434758)', 1, 3, '', '', '', 'product/434758-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 365, 0, 10, ''),
(12, '703634', 'PLACA Y CONTACTO DOBLE CONTACTO BLANCO', 'Placa con doble contacto sin tierra en color blanco. 125 v. Material resistente a altas temperaturas. \r\n(703634)', 1, 3, '', '', '', 'product/703634-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 95, 0, 10, ''),
(13, '474137', 'APISONADOR PARA COMPACTACIÓN MT74FAF', 'Motor Subaru de 3.5hp de cuatro tiempo a gasolina. Carburador de flotador. Zapata de impacto de 28.8 x 33.1 cm. Revoluciones por minuto 3600(rpm). 640-680 GPM. 1400kg de impacto. \r\n(474137)', 1, 4, '', '', '', 'product/474137-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 57249, 0, 10, ''),
(14, '473381', 'PLATAF DE MTTO NO CONDUCT 8 ESC', 'Plataforma móvil de fibra de vidrio no conductora de electricidad con pasamanos. Barandales y plataforma. Peldaños con superficie que previene los derrapes y diseño que facilita el ascenso y descenso. Ruedas para facilitar su transportación a las áreas de trabajo. Color amarillo. Capacidad de carga 136 kg. de Uso Industrial. Modelo FW2408. Garantía 1 año. ', 2, 4, '', '', '', 'product/473381-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 62700, 0, 10, ''),
(15, '807703', 'CONCERTINA GALVANIZADA 8 M', 'Caja con 8 metros lineales. espiral de navajas de 47 cm de diámetro para cercas o sobre bardas \r\n(807703)', 2, 4, '', '', '', 'product/807703-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 569, 350, 10, ''),
(16, '955965', 'CORTINA ENROLL TRANSLÚCIDA 160X180 CM MARFIL REGGIA', 'Cortina enrollable translúcida. Fabricada en poliéster. Color marfíl. Medida 160 cm de ancho x 180 cm de alto. Diseño minimalista. Reduce la entrada de luz solar y protege. Fácil instalación. Uso en interiores. \r\n(955965)', 1, 5, '', '', '', 'product/955965-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 455, 0, 100, ''),
(17, '800469', 'PERSIANA DUOLIGHT 1.60 X 2.20 MARFIL', 'Hecho de tela poliéster con cabezal y contrapeso cerrado de aluminio. Regula la entrada de la luz de manera parcial. Se puede instalar por fuera o por dentro del marco de la ventana. Incluye accesorios de seguridad para evitar que los niños jueguen con los cordones \r\n(800469)', 2, 5, '', '', '', 'product/800469-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 1875, 950, 100, ''),
(18, '260402', 'PERSIANA HORIZONTAL PVC 1.0X1.6 MADERA REGGIA', 'Persiana horizontal de PVC. Color madera. Medida 100 cm de ancho x 160 cm de alto. Recomendada para habitaciones abiertas sala/comedor. Permite graduar la intensidad del paso de la luz. Accionamiento muy sencillo. Fácil mantenimiento. Uso en interiores. ', 1, 5, '', '', '', 'product/260402-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 555, 0, 100, ''),
(21, '110850', 'PISO NORWEGIAN 18X55 CAOBA 1.49 M2 (110850)\r\n', 'Piso cerámico esmaltado. Tipo madera. Medida 18x55 cm. Color caoba. Tecnología digital. Para espacios en el interior y exterior. Recomendado para comedor. sala o recamaras. Trafico semi-intenso. Cobertura por caja de 1.49 m2. Grado de calidad 1A. Variación de tono extremo en su diseño. Fácil instalación \r\n', 1, 7, '', '', '', 'product/110850-z.jpg', 'producto/103421-za2.jpg', '', '', 1, 205, 150, 19, ''),
(22, '377246', 'REGADERA ANTISARRO CROMO 5 FUNCIONES\r\n', 'Acabado cromo. 5 funciones. 10 años de garantía. Modelo 56225-0501. \r\n', 1, 9, '', '', '', 'product/377246-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 900, 0, 10, ''),
(23, '413203', 'SANITARIO NEMESIS HUESO 1 PIEZA 3 Y 5 L\r\n', 'Sanitario de una sola pieza. Color hueso. Capacidad de descarga 350 gr. Tecnología doble descarga para un consumo menor a 5 L. Ahorrador de agua. Diseño alargado con asiento de cierre lento. Trampa oculta. Ahorra 10220 L de agua por persona al año (comparado con un sanitario de 10 L). \r\n', 1, 9, '', '', '', 'product/413203-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 2499, 0, 10, ''),
(24, '615428', 'MEZCLADORA MONOMANDO PARA LAVABO CAMELIA CROMO\r\n', 'Si buscas calidad y un estilo excepcional esta mezcladora para lavabo Moen es tu mejor opción. Mezcladora Camelia. Es ahorradora utiliza hasta -32% de agua sin sacrificar rendimiento. Su acabado cromo altamente reflejante combina con cualquier estilo de decoración. Incluye desagüe y tapón retráctil. Suite completa para baño disponible. Garantía Moen contra fuga y goteo. \r\n', 1, 9, '', '', '', 'product/615428-z.jpg', 'producto/103421-za2.jpg', '', '', 0, 1636, 0, 10, ''),
(38, 'KAUU', 'KIT CAUTIN', 'CAUTIN', 1, 2, 'AAA', 'A', 'A', 'product/product_img120180629035627.jpg', '', '', '', 0, 120, 105, 10, 'MISMO DIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(254) NOT NULL,
  `password` varchar(254) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `imagen` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nombre`, `imagen`) VALUES
(1, 'root', '63a9f0ea7bb98050796b649e85481845', 'FRANCISCO EDUARDO ASCENDIO D. ', 'users/thor.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
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
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_almacen` (`almacen`),
  ADD KEY `producto_departamento` (`departamento`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `producto_almacen` FOREIGN KEY (`almacen`) REFERENCES `almacen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_departamento` FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
