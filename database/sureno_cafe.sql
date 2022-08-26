-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-08-2022 a las 08:04:37
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sureno_cafe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth`
--

CREATE TABLE `auth` (
  `userId` int(11) NOT NULL,
  `userName` varchar(150) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userImg` varchar(255) DEFAULT NULL,
  `userRole` varchar(100) DEFAULT NULL,
  `userToken` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth`
--

INSERT INTO `auth` (`userId`, `userName`, `userEmail`, `userPassword`, `userImg`, `userRole`, `userToken`) VALUES
(1, 'Café Sureño', 'adm@cafesureno.com', '$2b$10$gee/RMYqqiwcjlyCKiqTKeNmXJOFwcjZWBo.esN79VQvui6s7y43i', 'f', 'Administrador', NULL),
(2, 'Prueba para los Put', 'prueba@cafesureno.com', '$2b$10$QIYWxpYtLLa/cA2NARODNu96kK.mhRxqdpTnO8MdqSm7xXERun5UC', '/assets/Auth/Flor.jpeg', 'Junior', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cliName` varchar(64) NOT NULL,
  `cliEmail` varchar(100) NOT NULL,
  `cliPassword` varchar(255) NOT NULL,
  `cliImg` varchar(255) DEFAULT NULL,
  `cliTelefono` varchar(16) NOT NULL,
  `cliToken` varchar(200) DEFAULT NULL,
  `rol` varchar(5) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliName`, `cliEmail`, `cliPassword`, `cliImg`, `cliTelefono`, `cliToken`, `rol`) VALUES
('Administrador', 'adm@cafesureno.com', '$2b$10$GIt2X21YK/sFsI..YUQVEulgP/3ur8Y9mUBS31GwlJs3z428YzuSa', NULL, '569133133', NULL, 'admin'),
('Ezreal', 'ezreal@gmail.com', '$2b$10$WFrloMiWoHEc88h4GF6yMuImGu/MWEnx67hd90Ntzx2kZ.I42K5W2', NULL, '912345678', NULL, 'user'),
('gangplank', 'gangplank@gmail.com', '$2b$10$4yRbVeLi7Su0ffeR8jaFi.qeCMaECC1KtW6diVxhxQWoNTivzyNVK', NULL, '912345678', NULL, 'user'),
('kaisa', 'kaisa@gmail.com', '$2b$10$cjTJ7LnQX5lFjryScMGG8eEzVh4mjSPD5wWp2nF8fyv4VkR3cfeIe', NULL, '912345678', NULL, 'user'),
('marcianeke', 'marcianeke@gmail.com', '$2b$10$FlRkRQqxNXpXnV8EQBm7ruuuwBc.axO.pGF3U7Rdvxg5.Fd0oGgXu', NULL, '912345681', NULL, 'user'),
('Admin-2', 'master@surenocafe.com', '$2b$10$xvIHA8PPaKGP.hpu2GUMYe5eihifsBnR1Efb0iSYl/UzI947E6.nS', NULL, '970124521', NULL, 'admin'),
('Matias Gaete', 'matteph.gaete42@gmail.com', '$2b$10$fMd0zxoqSrvNaAjcp2sGWe.o/fRYJXV.k8.I2nl6fW4P29nCMHJIq', NULL, '982807543', NULL, 'user'),
('Admin-3', 'profeAdmin@cafesureno.com', '$2b$10$RJsXMEA3SHUpWqW5D7RYRumJ2TsFNPfjfvrjjXHV4U9A3QZSqiNVe', NULL, '982712030', NULL, 'admin'),
('Sebastián Rocha', 'se.rochacampos@gmail.com', '$2b$10$RGMNqBslRAB9.hBeJ8SQL.ywXBplQD30cCQfW2.SS3c2HVBL889bG', NULL, '954395324', NULL, 'user'),
('Seraphine', 'seraphine@gmail.com', '$2b$10$Dd1cNunyRNGttZN6YjNMI.xGaMUDBbnf/5R1VxXcAsNdUgRoGZHHy', NULL, '912345678', NULL, 'user'),
('sivir', 'sivir@gmail.com', '$2b$10$obN70lj9AhBDab0Z5ab75ugEr56JmJ5am5jhTTGlvJEmE0Eif0pZ6', NULL, '912345678', NULL, 'user'),
('vayne', 'vayne@gmail.com', '$2b$10$Lqc0l9Jkol5YBKDbQliAr.LrtEbPGAWLvtHXvHTgp7RhQDMigho1W', NULL, '982807543', NULL, 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contienedulces`
--

CREATE TABLE `contienedulces` (
  `id_pedido` int(11) NOT NULL,
  `prodId` int(11) NOT NULL,
  `cantidad_producto` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contienedulces`
--

INSERT INTO `contienedulces` (`id_pedido`, `prodId`, `cantidad_producto`) VALUES
(17, 14, 1),
(17, 15, 1),
(18, 1, 1),
(42, 22, 5),
(42, 23, 3),
(44, 3, 2),
(45, 2, 1),
(46, 2, 1),
(47, 1, 1),
(47, 2, 3),
(48, 1, 1),
(49, 2, 1),
(51, 1, 1),
(51, 2, 1),
(52, 1, 1),
(53, 14, 1),
(53, 15, 1),
(53, 16, 1),
(53, 17, 1),
(53, 18, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contienesalados`
--

CREATE TABLE `contienesalados` (
  `id_pedido` int(11) NOT NULL,
  `prodId` int(11) NOT NULL,
  `cantidad_producto` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contienesalados`
--

INSERT INTO `contienesalados` (`id_pedido`, `prodId`, `cantidad_producto`) VALUES
(19, 1, 1),
(19, 4, 1),
(19, 22, 1),
(19, 23, 1),
(35, 6, 1),
(40, 1, 1),
(41, 1, 3),
(43, 1, 2),
(44, 1, 1),
(44, 2, 1),
(47, 1, 1),
(50, 4, 1),
(51, 6, 1),
(51, 10, 1),
(53, 12, 1),
(53, 13, 1),
(53, 14, 1),
(53, 15, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dulces`
--

CREATE TABLE `dulces` (
  `prodId` int(11) NOT NULL,
  `tipo` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `cantidad` varchar(64) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(256) NOT NULL,
  `imageUrl` varchar(256) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dulces`
--

INSERT INTO `dulces` (`prodId`, `tipo`, `name`, `cantidad`, `price`, `description`, `imageUrl`, `stock`) VALUES
(1, 'Pasteleria', 'Alfajores', '4 Unidades', 1590, 'Bocado pequeño, de textura suave, relleno con manjar blanco artesanal y espolvoreado con azúcar', '/assets/Dulces/Pastelería/Alfajores.jpg', 50),
(2, 'Pasteleria', 'Pie de limón', 'Unidad', 12000, 'Sabrosa tartaleta como base, rellena con una clásica mezcla de leche condensada y jugo de limón. Para cubrir abundante y vaporoso merengue. ¡Mmm, rico!', '/assets/Dulces/Pastelería/Pie-limon.jpg', 93),
(3, 'Pasteleria', 'Tartaleta de frutas', 'Unidad', 12000, 'Delicada y fresca, ideal para la hora del té. Como base, masa de galletas que en su interior contiene una delicada crema pastelera con sabor a vainilla. Para terminar se cubre con abundantes berries frescos.', '/assets/Dulces/Pastelería/Tarta-berries.jpg', 98),
(4, 'Pasteleria', 'Rollo de nuez', 'Unidad', 6800, 'Esponjoso panqueque de nuez, relleno con sabroso manjar. Enrollado como un brazo de reina y cubierto con una fina cobertura de chocolate. Un trocito, es el bocado preciso para endulzar el día.', '/assets/Dulces/Pastelería/Rollo-nuez.jpg', 100),
(5, 'Pasteleria', 'Küchen Miga (Manzana o berries)', 'Unidad', 6800, 'Húmedo, delicado y muy sabroso. Masa dulce de base, rellena con abundantes arándanos y frambuesas. Para cubrir, finas migas de masa con abundante canela. Delicioso.', '/assets/Dulces/Pastelería/Kuchen-berries.jpg', 100),
(10, 'Pasteleria', 'Galletas', '1/4', 2300, 'Deliciosas galletas, ideales para acompañar tus bebidas calientes o solo para darte un gustito. Es dificil no caer en la tentación', '/assets/Dulces/Pastelería/Galletas.jpg', 100),
(11, 'Pasteleria', 'Empolvados', 'Unidad', 650, 'Bocado pequeño, de textura suave, relleno con manjar blanco artesanal y espolvoreado con azúcar.', '/assets/Dulces/Pastelería/Empolvados.jpg', 100),
(12, 'Pasteleria', 'Pasteles', 'Unidad', 1900, 'Exquisitas y frescas variedades de pasteles para todos los gustos y ocasiones. Disfruta su sabor y textura, te van a encantar.', '/assets/Dulces/Pastelería/pasteles.jpg', 100),
(13, 'Postres', 'Mousse tres chocolates', '10 a 12 personas', 13980, 'Mucho chocolate, derretido y en trozos, además de crema fresca batida, definen este tentador postre. Incluye una salsa para acompañar.', '/assets/Dulces/Postres/Mousse-chocolate.jpg', 100),
(14, 'Postres', 'Mousse de maracuyá', '10 a 12 personas', 13980, 'Por su sabor y aroma es un postre de gusto general. Su textura es suave y su sabor es intenso, ya que el maracuyá es el protagonista de esta preparación. Incluye una salsa para acompañar.', '/assets/Dulces/Postres/Mousse-maracuya.jpg', 99),
(15, 'Postres', 'Mousse de frambuesa', '10 a 12 personas', 13980, 'Cremoso, fresco, ácido y dulce, la combinación perfecta. En su interior, salsa y trozos de frambuesa. Su color es rosado y su aspecto es marmoleado. Incluye más salsa de frambuesa para acentuar su intenso sabor.', '/assets/Dulces/Postres/Suspiro-limeno.jpg', 99),
(16, 'Postres', 'Tres leches', '8 personas', 9980, 'Es un postre delicado y dulce. Elaborado con un bizcocho suave, que incluye trocitos de almendra molida, humectado con la clásica mezcla de las tres leches y relleno con manjar blanco artesanal.', '/assets/Dulces/Postres/Tres-leches.jpg', 99),
(17, 'Postres', 'Suspiro limeño', '10 personas', 13980, 'Dulce y cremoso manjar, cubierto de un merengue aireado, esponjoso y con toques de oporto. Como final, canela en polvo. Es un postre adictivo.', '/assets/Dulces/Postres/Suspiro-limeno.jpg', 99),
(18, 'Postres', 'Tiramisú', '8 personas', 12790, 'Clásico postre italiano semi dulce, con aroma y sabor a café con amaretto. Mascarpone, galletas de bizcocho y chocolate amargo son también sus ingredientes. Ideal para finalizar equilibradamente tu comida.', '/assets/Dulces/Postres/Postres-tiramisu.jpg', 99),
(19, 'Postres', 'Suspiro frambuesa', '10 porciones', 14580, 'Dulce y cremoso manjar, cubierto de un merengue aireado, esponjoso y con toques de frambuesa. Como final, canela en polvo. Es un postre adictivo.', '/assets/Dulces/Postres/Suspiro-frambuesa.jpg', 100),
(20, 'Postres', 'Tronco de Castañas', 'Grande', 21950, 'Postre elegante y exclusivo. Rollo de suave puré de castaña, mezclado con un delicado almíbar de licor y relleno con cremoso chocolate.', '/assets/Dulces/Postres/Tronco-de-castana.jpg', 100),
(21, 'Tortas', 'Torta mil hojas manjar frambuesa crema', '41 personas', 51000, 'Delgadas capas de hojarascas rellenas con una mezcla ganadora de sabores. Frescas y ácidas frambuesas, crema chantilly levemente endulzada y dulce manjar color caramelo cubierta con merengue. Hay que probarla y probablemente te harás adicto a ella.', '/assets/Dulces/Tortas/hoja_frambuesa.jpg', 100),
(22, 'Tortas', 'Torta Manjar Tradicional (sólo manjar)', '45 personas', 51000, 'Delgadas y crocantes hojarascas rellenas con suave manjar, brillante y de color caramelo. Se cubre con pequeños trozos de hojarasca. Es deliciosamente adictiva.', '/assets/Dulces/Tortas/hoja_tradicional.jpg', 95),
(23, 'Tortas', 'Torta mil hojas manjar crema maracuyá', '45 personas', 51000, 'Delgadas capas de hojarascas, rellenas con nuestro manjar, crema chantilly levemente endulzada y aromática salsa de pulpa de maracuyá. La acidez y la dulzura son la característica de esta torta. Deliciosa.', '/assets/Dulces/Tortas/hoja_maracuya.jpg', 97),
(24, 'Tortas', 'Torta panqueque blanco frambuesa chocolate manjar', '45 personas', 51000, 'Delgadas y húmedas capas de panqueque clásico, rellenos de tres sabores diferentes: ácida y colorida salsa de frambuesas, intensa salsa de chocolate al coñac, dulce y suave manjar. Es una mezcla que gusta a muchos.', '/assets/Dulces/Tortas/panqueque_blanco_frambuesa_chocolate.jpg', 100),
(25, 'Tortas', 'Torta panqueque nuez manjar', '45 personas', 46400, 'Gustosos panqueques elaborados con abundante nuez y rellenos sólo con delicioso manjar. Dulce, definida y adictiva.', '/assets/Dulces/Tortas/panqueque_nuez_manjar.jpg', 100),
(26, 'Tortas', 'Torta panqueque nuez frambuesa', '45 personas', 46400, 'Gustosos panqueques elaborados con abundante nuez y rellenos de tres sabores diferentes: ácida y colorida salsa de frambuesas, dulce manjar y la suavidad de la mezcla de cremas pastelera y chantilly, hacen que sea una torta suave y delicada.', '/assets/Dulces/Tortas/panqueque-nuez-frambuesa.jpg', 100),
(27, 'Tortas', 'Torta panqueque chocolate frambuesa', '45 personas', 51000, 'Finos panqueques de chocolate humectados, rellenos con salsa de chocolate al coñac y frescas frambuesas. Es una combinación adictiva.', '/assets/Dulces/Tortas/panqueque_chocolate_frambuesa.jpg', 100),
(28, 'Tortas', 'Torta Naranja Morena', '45 personas', 47600, 'Delgadas y húmedas capas de panqueque blanco y chocolate, rellenos exquisita crema de vainilla, un toque de naranja y salsa de chocolate al coñac. Un sabor suave al paladar.', '/assets/Dulces/Tortas/naranja_morena.jpg', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `fecha_agendada` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `hora` varchar(5) NOT NULL,
  `local` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `fecha_pedido`, `fecha_agendada`, `email`, `hora`, `local`) VALUES
(2, '2022-07-25', '2022-07-26', 'se.rochacampos@gmail.com', '10:45', '5 de Abril'),
(3, '2022-07-25', '2022-07-27', 'se.rochacampos@gmail.com', '10:15', '5 de Abril'),
(4, '2022-07-25', '2022-07-27', 'se.rochacampos@gmail.com', '10:45', '5 de Abril'),
(5, '2022-07-25', '2022-07-29', 'se.rochacampos@gmail.com', '10:45', 'Flores de Millán'),
(6, '2022-07-25', '2022-07-27', 'se.rochacampos@gmail.com', '10:45', '5 de Abril'),
(7, '2022-07-25', '2022-07-30', 'se.rochacampos@gmail.com', '11:15', 'Constitución'),
(8, '2022-07-25', '2022-07-26', 'matteph.gaete42@gmail.com', '10:45', 'Flores de Millán'),
(9, '2022-07-25', '2022-07-26', 'matteph.gaete42@gmail.com', '11:15', 'Constitución'),
(10, '2022-07-25', '2022-07-27', 'matteph.gaete42@gmail.com', '10:30', '5 de Abril'),
(11, '2022-07-25', '2022-07-27', 'matteph.gaete42@gmail.com', '10:30', '5 de Abril'),
(12, '2022-07-25', '2022-07-27', 'matteph.gaete42@gmail.com', '10:45', '5 de Abril'),
(13, '2022-07-25', '2022-07-26', 'matteph.gaete42@gmail.com', '10:45', '5 de Abril'),
(14, '2022-07-25', '2022-07-27', 'matteph.gaete42@gmail.com', '10:45', '5 de Abril'),
(15, '2022-07-25', '2022-07-27', 'matteph.gaete42@gmail.com', '11:45', '5 de Abril'),
(16, '2022-07-25', '2022-07-27', 'matteph.gaete42@gmail.com', '10:45', '5 de Abril'),
(17, '2022-07-25', '2022-07-27', 'matteph.gaete42@gmail.com', '10:45', '5 de Abril'),
(18, '2022-07-25', '2022-07-30', 'matteph.gaete42@gmail.com', '11:30', 'Constitución'),
(19, '2022-07-25', '2022-07-27', 'matteph.gaete42@gmail.com', '10:45', '5 de Abril'),
(21, '2022-07-25', '2022-07-27', 'adm@cafesureno.com', '10:45', '5 de Abril'),
(22, '2022-07-25', '2022-07-27', 'adm@cafesureno.com', '10:45', '5 de Abril'),
(23, '2022-07-25', '2022-07-27', 'adm@cafesureno.com', '11:00', '5 de Abril'),
(24, '2022-07-25', '2022-07-27', 'adm@cafesureno.com', '11:30', '5 de Abril'),
(25, '2022-07-25', '2022-07-30', 'adm@cafesureno.com', '11:00', 'Flores de Millán'),
(26, '2022-07-25', '2022-07-30', 'adm@cafesureno.com', '11:00', 'Flores de Millán'),
(27, '2022-07-25', '2022-07-29', 'adm@cafesureno.com', '11:00', 'Flores de Millán'),
(28, '2022-07-25', '2022-07-29', 'adm@cafesureno.com', '11:00', 'Constitución'),
(29, '2022-07-25', '2022-07-29', 'adm@cafesureno.com', '11:30', 'Constitución'),
(30, '2022-07-25', '2022-07-30', 'adm@cafesureno.com', '11:00', 'Flores de Millán'),
(31, '2022-07-25', '2022-07-29', 'adm@cafesureno.com', '11:00', 'Flores de Millán'),
(32, '2022-07-25', '2022-07-30', 'adm@cafesureno.com', '11:00', 'Flores de Millán'),
(33, '2022-07-25', '2022-07-30', 'adm@cafesureno.com', '11:00', 'Flores de Millán'),
(34, '2022-07-25', '2022-07-30', 'adm@cafesureno.com', '11:00', 'Flores de Millán'),
(35, '2022-07-25', '2022-07-31', 'adm@cafesureno.com', '11:00', 'Flores de Millán'),
(36, '2022-07-25', '2022-07-31', 'adm@cafesureno.com', '13:45', 'Flores de Millán'),
(37, '2022-07-25', '2022-07-31', 'adm@cafesureno.com', '12:45', 'Flores de Millán'),
(38, '2022-07-25', '2022-07-31', 'adm@cafesureno.com', '15:00', 'Flores de Millán'),
(39, '2022-07-25', '2022-07-31', 'adm@cafesureno.com', '12:00', 'Flores de Millán'),
(40, '2022-07-25', '2022-07-29', 'adm@cafesureno.com', '14:45', 'Flores de Millán'),
(41, '2022-07-25', '2022-07-30', 'adm@cafesureno.com', '13:00', 'Flores de Millán'),
(42, '2022-07-25', '2022-07-30', 'adm@cafesureno.com', '13:30', 'Flores de Millán'),
(43, '2022-07-25', '2022-07-27', 'adm@cafesureno.com', '10:45', '5 de Abril'),
(44, '2022-07-25', '2022-07-29', 'matteph.gaete42@gmail.com', '15:45', 'Constitución'),
(45, '2022-07-25', '2022-07-29', 'matteph.gaete42@gmail.com', '10:45', '5 de Abril'),
(46, '2022-07-25', '2022-07-29', 'matteph.gaete42@gmail.com', '16:15', 'Constitución'),
(47, '2022-07-25', '2022-07-30', 'adm@cafesureno.com', '11:45', 'Flores de Millán'),
(48, '2022-07-26', '2022-07-31', 'adm@cafesureno.com', '11:30', 'Constitución'),
(49, '2022-07-26', '2022-07-30', 'adm@cafesureno.com', '11:30', 'Constitución'),
(50, '2022-08-26', '2022-08-30', 'adm@cafesureno.com', '11:15', 'Constitución'),
(51, '2022-08-26', '2022-08-30', 'adm@cafesureno.com', '16:00', 'Constitución'),
(52, '2022-08-26', '2022-08-30', 'adm@cafesureno.com', '11:30', 'Constitución'),
(53, '2022-08-26', '2022-08-30', 'se.rochacampos@gmail.com', '12:00', 'Flores de Millán');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salados`
--

CREATE TABLE `salados` (
  `prodId` int(11) NOT NULL,
  `tipo` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `cantidad` varchar(64) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(256) NOT NULL,
  `imageUrl` varchar(256) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `salados`
--

INSERT INTO `salados` (`prodId`, `tipo`, `name`, `cantidad`, `price`, `description`, `imageUrl`, `stock`) VALUES
(1, 'Carnes', 'Roast beef de filete con jugo y salsa', '1 kg', 31350, 'Finas láminas de carne desgrasada, sellada en aceite de oliva y cocinada con aliño de cilantro, vino tinto y otros aderezos. Su punto de cocción es rosado y su textura es suave. Incluye el sabroso jugo de su preparación y una salsa de mostaza o de champiñó', '/assets/Salados/Carnes/Roast-beef.jpg', 20),
(2, 'Carnes', 'Pechuga de pavo asada con jugo y salsa', '1 kg', 24600, 'Sólo pechuga de pavo sin piel ni grasa, asada y cortada en láminas. Incluye un sabroso jugo que es producto de su cocción y los aliños con los cuales fue adobada. Además, se acompaña de una salsa a elección (mostaza o zanahoria al curry).', '/assets/Salados/Carnes/Pavo.jpg', 99),
(3, 'Carnes', 'Salmón asado con salsa', '1 kg', 25900, 'Filete de salmón fresco adobado con limón, vino blanco y jengibre. Asado a fuego suave, encostrado en quinoa tostada, ralladura de limón y parmesano. Se acompaña de una delicada salsa de espinacas y champiñones.', '/assets/Salados/Carnes/Salmon-salsa-champinon.jpg', 100),
(4, 'Carnes', 'Plateada el Abuelo', '350 gr', 8900, 'Exquisito y suave corte de res guisada con verduras.', '/assets/Salados/Carnes/Plateada.jpg', 99),
(5, 'Acompañamientos', 'Arroz frío quinoa y verduras', '1 a 2 personas', 1850, 'Liviana y agradable mezcla de verduras finamente cortadas y salteadas con arroz blanco y quinoa. Es un acompañamiento fresco por sus trocitos de tomate y aliño de limón.', '/assets/Salados/Acompanhamientos/Arroz-frio-con-quinoa-y-verduras.jpg', 100),
(6, 'Acompañamientos', 'Arroz pasas y almendras', '1 a 2 porciones', 1850, 'Arroz blanco, muy graneado, con pequeñas pasas tipo corinto y palitos de almendras peladas y tostadas. Sazonado con un toque de aceite de oliva.', '/assets/Salados/Acompanhamientos/Arroz-con-pasas-y-almendras-tostadas.jpg', 99),
(7, 'Acompañamientos', 'Cous cous albahaca pimentón aceitunas', '1 a 2 porciones', 1850, 'Fresco acompañamiento de cous cous con abundante albahaca cortada en julianas finas, trocitos de pimiento rojo y de aceitunas moradas, aliñado con limón y aceite de oliva.', '/assets/Salados/Acompanhamientos/Cous-cous-albahaca-pimenton-y-aceituna.jpg', 100),
(8, 'Acompañamientos', 'Papas a la crema', '4 porciones', 5950, 'Cremoso y contundente acompañamiento de papas cortadas finamente, cocinadas con crema, queso y algo de aliños. Ideal para complementar de manera sabrosa un trozo de carne.', '/assets/Salados/Acompanhamientos/Papas-a-la-crema.jpg', 100),
(9, 'Acompañamientos', 'Quinoa cranberry maravilla', '1 a 2 porciones', 1850, 'Quinoa graneada con trozos de cranberry seco, espinaca finamente cortada y salteada, semillas de maravilla y ciboulette. Esta mezcla de ingredientes da como resultado un acompañamiento semidulce, colorido y alimenticio.', '/assets/Salados/Acompanhamientos/Quinoa-con-cranberry-y-maravilla.jpg', 100),
(10, 'Acompañamientos', 'Papas al romero', '1 a 2 porciones', 1850, 'Finos cortes de papa, cocidas y salteadas con un toque de romero, una exquisita combinación de sabores.', '/assets/Salados/Acompanhamientos/Papas-al-romero.jpg', 99),
(11, 'Acompañamientos', 'Arroz finas hierbas', '1 a 2 porciones', 1850, 'Arroz blanco cocido sazonado con un toque de finas hierbas. Aromático y suave al paladar.', '/assets/Salados/Acompanhamientos/Arroz_finas-hierbas.jpg', 100),
(12, 'Guisos', 'Ají de gallina', '1 porción', 4190, 'Clásico guiso peruano, elaborado con carne de ave desmenuzada. Su salsa es suave, cremosa, de color anaranjado y algo picante, ya que contiene ají rocotto. Se decora con huevo, aceituna.', '/assets/Salados/Guisos/Aji-de-gallina.jpg', 99),
(13, 'Guisos', 'Canelones con jaiba', '8 unidades', 28270, 'Finas láminas de pasta cacera con un delicado relleno de bechamel y carne de jaiba una preparación ideal para estas fiestas.', '/assets/Salados/Guisos/Canelones.jpg', 99),
(14, 'Guisos', 'Pastel de Jaiba', '350 gr', 5490, 'Un clásico de la cocina chilena...', '/assets/Salados/Guisos/Pastel-de-jaiba.jpg', 99),
(15, 'Guisos', 'Picante de mariscos', '350 gr', 5490, 'Un imperdible de la cocina peruana', '/assets/Salados/Guisos/Picante-de-mariscos.jpg', 99),
(16, 'Lasañas', 'Lasaña boloñesa', '6 a 8 porciones', 16800, 'Fina masa de pasta al huevo, rellena con abundante salsa boloñesa, salsa bechamel y queso mantecoso. Tomates, carne de vacuno, vino tinto, laurel y más forman parte de este plato de gusto general.', '/assets/Salados/Lasanhas/Lasana-bolonesa.jpg', 100),
(17, 'Lasañas', 'Lasaña provenzal', '6 a 8 porciones', 17400, 'Color y sabor, todo en uno. Láminas de pasta fresca elaborada por nosotros y rellenas con trozos de verduras salteadas: pimentón, zapallo italiano y berenjena. Todo acompañado de aceitunas, quesos, toques de orégano y laurel, sobre una fina capa de salsa b', '/assets/Salados/Lasanhas/Lasana-provenzal.jpg', 100),
(18, 'Pollos Rellenos', 'Pollo champiñón tocino', '8 a 10 porciones', 19800, 'Pollo deshuesado, desgrasado y cuidadosamente adobado. Su relleno es sabroso y cremoso, con abundantes champiñones y tocino crocante. Se acompaña con su propio jugo y una salsa de champiñones para intensificar su sabor.', '/assets/Salados/Pollos Rellenos/Pollo-relleno-con-champinon-tocino.jpg', 100),
(19, 'Pollos Rellenos', 'Pollo manzana ciruela', '8 a 10 porciones', 19800, 'Pollo deshuesado, desgrasado y adobado. Tiene un relleno levemente agridulce, que mezcla manzana en trozos pequeños, ciruela deshidratada, nuez y un toque de curry. Incluye el jugo de la cocción y una ligera salsa de mostaza.', '/assets/Salados/Pollos Rellenos/Pollo-relleno-manzana-ciruela.jpg', 100),
(20, 'Quiches', 'Quiche de cebolla pimentón aceituna', '6 a 8 porciones', 12900, 'Base de masa delgada y sabrosa, rellena con pimentones pelados, cortados en julianas y salteados con aceite de oliva, cebolla pluma levemente caramelizada y aceitunas negras. Todo unido a la mezcla característica de crema, huevo y queso.', '/assets/Salados/Quinches/Quiche-cebolla-pimenton.jpg', 100),
(21, 'Quiches', 'Quiche cebolla sésamo', '6 a 8 porciones', 12900, 'Base de masa delgada y sabrosa, rellena con dulce cebolla pluma cocinada y levemente caramelizada que se mezcla con quesos, crema, huevos y toques de sésamo tostado.', '/assets/Salados/Quinches/Quiche-cebolla-sesamo.jpg', 100),
(22, 'Quiches', 'Quiche espinaca ricotta champiñón', '6 a 8 porciones', 12900, 'Base de masa delgada y sabrosa, rellena con una elegante y fina mezcla de verduras: champiñones salteados, espinaca cortada en julianas y pequeños trozos de pimiento rojo. Todo unido con ricotta, huevos, quesos y crema dando como resultado un producto deli', '/assets/Salados/Quinches/Quiche-champinon-espinaca.jpg', 100),
(23, 'Quiches', 'Quiche champiñón tocino', '6 a 8 porciones', 12900, 'Tarta de masa delgada y sabrosa, rellena de champiñones salteados, un toque de tocino desgrasado y sofrito de cebollín. Unido por los clásicos ingredientes: quesos, huevo y crema. Dando como resultado un plato con carácter y de sabor intenso.', '/assets/Salados/Quinches/Quiche-champinon-tocino.jpg', 100);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`userId`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliEmail`);

--
-- Indices de la tabla `contienedulces`
--
ALTER TABLE `contienedulces`
  ADD PRIMARY KEY (`id_pedido`,`prodId`),
  ADD KEY `prodId` (`prodId`);

--
-- Indices de la tabla `contienesalados`
--
ALTER TABLE `contienesalados`
  ADD PRIMARY KEY (`id_pedido`,`prodId`),
  ADD KEY `prodId` (`prodId`);

--
-- Indices de la tabla `dulces`
--
ALTER TABLE `dulces`
  ADD PRIMARY KEY (`prodId`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `email` (`email`);

--
-- Indices de la tabla `salados`
--
ALTER TABLE `salados`
  ADD PRIMARY KEY (`prodId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth`
--
ALTER TABLE `auth`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `dulces`
--
ALTER TABLE `dulces`
  MODIFY `prodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `salados`
--
ALTER TABLE `salados`
  MODIFY `prodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contienedulces`
--
ALTER TABLE `contienedulces`
  ADD CONSTRAINT `contienedulces_ibfk_1` FOREIGN KEY (`prodId`) REFERENCES `dulces` (`prodId`),
  ADD CONSTRAINT `contienedulces_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `contienesalados`
--
ALTER TABLE `contienesalados`
  ADD CONSTRAINT `contienesalados_ibfk_1` FOREIGN KEY (`prodId`) REFERENCES `salados` (`prodId`),
  ADD CONSTRAINT `contienesalados_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`email`) REFERENCES `cliente` (`cliEmail`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
