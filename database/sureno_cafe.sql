-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-08-2022 a las 03:32:02
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

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
  `cliId` int(11) NOT NULL,
  `cliName` varchar(64) NOT NULL,
  `cliEmail` varchar(100) NOT NULL,
  `cliPassword` varchar(255) NOT NULL,
  `cliImg` varchar(255) DEFAULT NULL,
  `cliTelefono` varchar(16) DEFAULT NULL,
  `cliToken` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliId`, `cliName`, `cliEmail`, `cliPassword`, `cliImg`, `cliTelefono`, `cliToken`) VALUES
(1, 'Abraham Marianjel Sepúlveda', 'abr@gmail.com', '$2b$10$TBYpxFrxieQabyP3my/Q2.ds2HQoJ/y.rg4p3Pzu6y778KvsMuwQ6', 'https://4.bp.blogspot.com/-ZjmN5oVtWPs/WFvd74Yyl4I/AAAAAAAAAv4/edwGnBzKwQIbAZ90o5LUKhgSiD64JnGDgCLcB/s640/6.jpg', '+56999044562', NULL),
(2, 'Gokú', 'goku@dragonballz.cl', 'goku', 'https://depor.com/resizer/pfVziOV4X8Vu9nwknDc-oNItlB8=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/6Y2EDIISGFGVFANEVDCR5LCG34.jpg', '+56999044562', NULL),
(3, 'Dua Lipa', 'dualipa@gmail.com', '$2b$10$X6dFz.dc91ftgy/Ghx3/LeF.Cxe/qnwL9oamHToiAtskc44kNfoyq', 'https://media.vogue.mx/photos/6082d0d36e82e15ad6aefd7a/2:3/w_2560%2Cc_limit/GettyImages-1307105605.jpg', '+569090980', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contienedulces`
--

CREATE TABLE `contienedulces` (
  `id_pedido` int(11) NOT NULL,
  `prodId` int(11) NOT NULL,
  `cantidad_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contienesalados`
--

CREATE TABLE `contienesalados` (
  `id_pedido` int(11) NOT NULL,
  `prodId` int(11) NOT NULL,
  `cantidad_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'Pasteleria', 'Alfajores', '4 Unidades', 1590, 'Bocado pequeño, de textura suave, relleno con manjar blanco artesanal y espolvoreado con azúcar', '/assets/Dulces/Pastelería/Alfajores.jpg', 0),
(2, 'Pasteleria', 'Pie de limón', 'Unidad', 12000, 'Sabrosa tartaleta como base, rellena con una clásica mezcla de leche condensada y jugo de limón. Para cubrir abundante y vaporoso merengue. ¡Mmm, rico!', '/assets/Dulces/Pastelería/Pie-limon.jpg', 0),
(3, 'Pasteleria', 'Tartaleta de frutas', 'Unidad', 12000, 'Delicada y fresca, ideal para la hora del té. Como base, masa de galletas que en su interior contiene una delicada crema pastelera con sabor a vainilla. Para terminar se cubre con abundantes berries frescos.', '/assets/Dulces/Pastelería/Tarta-berries.jpg', 0),
(4, 'Pasteleria', 'Rollo de nuez', 'Unidad', 6800, 'Esponjoso panqueque de nuez, relleno con sabroso manjar. Enrollado como un brazo de reina y cubierto con una fina cobertura de chocolate. Un trocito, es el bocado preciso para endulzar el día.', '/assets/Dulces/Pastelería/Rollo-nuez.jpg', 0),
(5, 'Pasteleria', 'Küchen Miga (Manzana o berries)', 'Unidad', 6800, 'Húmedo, delicado y muy sabroso. Masa dulce de base, rellena con abundantes arándanos y frambuesas. Para cubrir, finas migas de masa con abundante canela. Delicioso.', '/assets/Dulces/Pastelería/Kuchen-berries.jpg', 0),
(10, 'Pasteleria', 'Galletas', '1/4', 2300, 'Deliciosas galletas, ideales para acompañar tus bebidas calientes o solo para darte un gustito. Es dificil no caer en la tentación', '/assets/Dulces/Pastelería/Galletas.jpg', 0),
(11, 'Pasteleria', 'Empolvados', 'Unidad', 650, 'Bocado pequeño, de textura suave, relleno con manjar blanco artesanal y espolvoreado con azúcar.', '/assets/Dulces/Pastelería/Empolvados.jpg', 0),
(12, 'Pasteleria', 'Pasteles', 'Unidad', 1900, 'Exquisitas y frescas variedades de pasteles para todos los gustos y ocasiones. Disfruta su sabor y textura, te van a encantar.', '/assets/Dulces/Pastelería/pasteles.jpg', 0),
(13, 'Postres', 'Mousse tres chocolates', '10 a 12 personas', 13980, 'Mucho chocolate, derretido y en trozos, además de crema fresca batida, definen este tentador postre. Incluye una salsa para acompañar.', '/assets/Dulces/Postres/Mousse-chocolate.jpg', 0),
(14, 'Postres', 'Mousse de maracuyá', '10 a 12 personas', 13980, 'Por su sabor y aroma es un postre de gusto general. Su textura es suave y su sabor es intenso, ya que el maracuyá es el protagonista de esta preparación. Incluye una salsa para acompañar.', '/assets/Dulces/Postres/Mousse-maracuya.jpg', 0),
(15, 'Postres', 'Mousse de frambuesa', '10 a 12 personas', 13980, 'Cremoso, fresco, ácido y dulce, la combinación perfecta. En su interior, salsa y trozos de frambuesa. Su color es rosado y su aspecto es marmoleado. Incluye más salsa de frambuesa para acentuar su intenso sabor.', '/assets/Dulces/Postres/Suspiro-limeno.jpg', 0),
(16, 'Postres', 'Tres leches', '8 personas', 9980, 'Es un postre delicado y dulce. Elaborado con un bizcocho suave, que incluye trocitos de almendra molida, humectado con la clásica mezcla de las tres leches y relleno con manjar blanco artesanal.', '/assets/Dulces/Postres/Tres-leches.jpg', 0),
(17, 'Postres', 'Suspiro limeño', '10 personas', 13980, 'Dulce y cremoso manjar, cubierto de un merengue aireado, esponjoso y con toques de oporto. Como final, canela en polvo. Es un postre adictivo.', '/assets/Dulces/Postres/Suspiro-limeno.jpg', 0),
(18, 'Postres', 'Tiramisú', '8 personas', 12790, 'Clásico postre italiano semi dulce, con aroma y sabor a café con amaretto. Mascarpone, galletas de bizcocho y chocolate amargo son también sus ingredientes. Ideal para finalizar equilibradamente tu comida.', '/assets/Dulces/Postres/Postres-tiramisu.jpg', 0),
(19, 'Postres', 'Suspiro frambuesa', '10 porciones', 14580, 'Dulce y cremoso manjar, cubierto de un merengue aireado, esponjoso y con toques de frambuesa. Como final, canela en polvo. Es un postre adictivo.', '/assets/Dulces/Postres/Suspiro-frambuesa.jpg', 0),
(20, 'Postres', 'Tronco de Castañas', 'Grande', 21950, 'Postre elegante y exclusivo. Rollo de suave puré de castaña, mezclado con un delicado almíbar de licor y relleno con cremoso chocolate.', '/assets/Dulces/Postres/Tronco-de-castana.jpg', 0),
(21, 'Tortas', 'Torta mil hojas manjar frambuesa crema', '41 personas', 51000, 'Delgadas capas de hojarascas rellenas con una mezcla ganadora de sabores. Frescas y ácidas frambuesas, crema chantilly levemente endulzada y dulce manjar color caramelo cubierta con merengue. Hay que probarla y probablemente te harás adicto a ella.', '/assets/Dulces/Tortas/hoja_frambuesa.jpg', 0),
(22, 'Tortas', 'Torta Manjar Tradicional (sólo manjar)', '45 personas', 51000, 'Delgadas y crocantes hojarascas rellenas con suave manjar, brillante y de color caramelo. Se cubre con pequeños trozos de hojarasca. Es deliciosamente adictiva.', '/assets/Dulces/Tortas/hoja_tradicional.jpg', 0),
(23, 'Tortas', 'Torta mil hojas manjar crema maracuyá', '45 personas', 51000, 'Delgadas capas de hojarascas, rellenas con nuestro manjar, crema chantilly levemente endulzada y aromática salsa de pulpa de maracuyá. La acidez y la dulzura son la característica de esta torta. Deliciosa.', '/assets/Dulces/Tortas/hoja_maracuya.jpg', 0),
(24, 'Tortas', 'Torta panqueque blanco frambuesa chocolate manjar', '45 personas', 51000, 'Delgadas y húmedas capas de panqueque clásico, rellenos de tres sabores diferentes: ácida y colorida salsa de frambuesas, intensa salsa de chocolate al coñac, dulce y suave manjar. Es una mezcla que gusta a muchos.', '/assets/Dulces/Tortas/panqueque_blanco_frambuesa_chocolate.jpg', 0),
(25, 'Tortas', 'Torta panqueque nuez manjar', '45 personas', 46400, 'Gustosos panqueques elaborados con abundante nuez y rellenos sólo con delicioso manjar. Dulce, definida y adictiva.', '/assets/Dulces/Tortas/panqueque_nuez_manjar.jpg', 0),
(26, 'Tortas', 'Torta panqueque nuez frambuesa', '45 personas', 46400, 'Gustosos panqueques elaborados con abundante nuez y rellenos de tres sabores diferentes: ácida y colorida salsa de frambuesas, dulce manjar y la suavidad de la mezcla de cremas pastelera y chantilly, hacen que sea una torta suave y delicada.', '/assets/Dulces/Tortas/panqueque-nuez-frambuesa.jpg', 0),
(27, 'Tortas', 'Torta panqueque chocolate frambuesa', '45 personas', 51000, 'Finos panqueques de chocolate humectados, rellenos con salsa de chocolate al coñac y frescas frambuesas. Es una combinación adictiva.', '/assets/Dulces/Tortas/panqueque_chocolate_frambuesa.jpg', 0),
(28, 'Tortas', 'Torta Naranja Morena', '45 personas', 47600, 'Delgadas y húmedas capas de panqueque blanco y chocolate, rellenos exquisita crema de vainilla, un toque de naranja y salsa de chocolate al coñac. Un sabor suave al paladar.', '/assets/Dulces/Tortas/naranja_morena.jpg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `fecha_agendada` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `hora` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'Carnes', 'Roast beef de filete con jugo y salsa', '1 kg', 31350, 'Finas láminas de carne desgrasada, sellada en aceite de oliva y cocinada con aliño de cilantro, vino tinto y otros aderezos. Su punto de cocción es rosado y su textura es suave. Incluye el sabroso jugo de su preparación y una salsa de mostaza o de champiñó', '/assets/Salados/Carnes/Roast-beef.jpg', 0),
(2, 'Carnes', 'Pechuga de pavo asada con jugo y salsa', '1 kg', 24600, 'Sólo pechuga de pavo sin piel ni grasa, asada y cortada en láminas. Incluye un sabroso jugo que es producto de su cocción y los aliños con los cuales fue adobada. Además, se acompaña de una salsa a elección (mostaza o zanahoria al curry).', '/assets/Salados/Carnes/Pavo.jpg', 0),
(3, 'Carnes', 'Salmón asado con salsa', '1 kg', 25900, 'Filete de salmón fresco adobado con limón, vino blanco y jengibre. Asado a fuego suave, encostrado en quinoa tostada, ralladura de limón y parmesano. Se acompaña de una delicada salsa de espinacas y champiñones.', '/assets/Salados/Carnes/Salmon-salsa-champinon.jpg', 0),
(4, 'Carnes', 'Plateada el Abuelo', '350 gr', 8900, 'Exquisito y suave corte de res guisada con verduras.', '/assets/Salados/Carnes/Plateada.jpg', 0),
(5, 'Acompañamientos', 'Arroz frío quinoa y verduras', '1 a 2 personas', 1850, 'Liviana y agradable mezcla de verduras finamente cortadas y salteadas con arroz blanco y quinoa. Es un acompañamiento fresco por sus trocitos de tomate y aliño de limón.', '/assets/Salados/Acompanhamientos/Arroz-frio-con-quinoa-y-verduras.jpg', 0),
(6, 'Acompañamientos', 'Arroz pasas y almendras', '1 a 2 porciones', 1850, 'Arroz blanco, muy graneado, con pequeñas pasas tipo corinto y palitos de almendras peladas y tostadas. Sazonado con un toque de aceite de oliva.', '/assets/Salados/Acompanhamientos/Arroz-con-pasas-y-almendras-tostadas.jpg', 0),
(7, 'Acompañamientos', 'Cous cous albahaca pimentón aceitunas', '1 a 2 porciones', 1850, 'Fresco acompañamiento de cous cous con abundante albahaca cortada en julianas finas, trocitos de pimiento rojo y de aceitunas moradas, aliñado con limón y aceite de oliva.', '/assets/Salados/Acompanhamientos/Cous-cous-albahaca-pimenton-y-aceituna.jpg', 0),
(8, 'Acompañamientos', 'Papas a la crema', '4 porciones', 5950, 'Cremoso y contundente acompañamiento de papas cortadas finamente, cocinadas con crema, queso y algo de aliños. Ideal para complementar de manera sabrosa un trozo de carne.', '/assets/Salados/Acompanhamientos/Papas-a-la-crema.jpg', 0),
(9, 'Acompañamientos', 'Quinoa cranberry maravilla', '1 a 2 porciones', 1850, 'Quinoa graneada con trozos de cranberry seco, espinaca finamente cortada y salteada, semillas de maravilla y ciboulette. Esta mezcla de ingredientes da como resultado un acompañamiento semidulce, colorido y alimenticio.', '/assets/Salados/Acompanhamientos/Quinoa-con-cranberry-y-maravilla.jpg', 0),
(10, 'Acompañamientos', 'Papas al romero', '1 a 2 porciones', 1850, 'Finos cortes de papa, cocidas y salteadas con un toque de romero, una exquisita combinación de sabores.', '/assets/Salados/Acompanhamientos/Papas-al-romero.jpg', 0),
(11, 'Acompañamientos', 'Arroz finas hierbas', '1 a 2 porciones', 1850, 'Arroz blanco cocido sazonado con un toque de finas hierbas. Aromático y suave al paladar.', '/assets/Salados/Acompanhamientos/Arroz_finas-hierbas.jpg', 0),
(12, 'Guisos', 'Ají de gallina', '1 porción', 4190, 'Clásico guiso peruano, elaborado con carne de ave desmenuzada. Su salsa es suave, cremosa, de color anaranjado y algo picante, ya que contiene ají rocotto. Se decora con huevo, aceituna.', '/assets/Salados/Guisos/Aji-de-gallina.jpg', 0),
(13, 'Guisos', 'Canelones con jaiba', '8 unidades', 28270, 'Finas láminas de pasta cacera con un delicado relleno de bechamel y carne de jaiba una preparación ideal para estas fiestas.', '/assets/Salados/Guisos/Canelones.jpg', 0),
(14, 'Guisos', 'Pastel de Jaiba', '350 gr', 5490, 'Un clásico de la cocina chilena...', '/assets/Salados/Guisos/Pastel-de-jaiba.jpg', 0),
(15, 'Guisos', 'Picante de mariscos', '350 gr', 5490, 'Un imperdible de la cocina peruana', '/assets/Salados/Guisos/Picante-de-mariscos.jpg', 0),
(16, 'Lasañas', 'Lasaña boloñesa', '6 a 8 porciones', 16800, 'Fina masa de pasta al huevo, rellena con abundante salsa boloñesa, salsa bechamel y queso mantecoso. Tomates, carne de vacuno, vino tinto, laurel y más forman parte de este plato de gusto general.', '/assets/Salados/Lasanhas/Lasana-bolonesa.jpg', 0),
(17, 'Lasañas', 'Lasaña provenzal', '6 a 8 porciones', 17400, 'Color y sabor, todo en uno. Láminas de pasta fresca elaborada por nosotros y rellenas con trozos de verduras salteadas: pimentón, zapallo italiano y berenjena. Todo acompañado de aceitunas, quesos, toques de orégano y laurel, sobre una fina capa de salsa b', '/assets/Salados/Lasanhas/Lasana-provenzal.jpg', 0),
(18, 'Pollos Rellenos', 'Pollo champiñón tocino', '8 a 10 porciones', 19800, 'Pollo deshuesado, desgrasado y cuidadosamente adobado. Su relleno es sabroso y cremoso, con abundantes champiñones y tocino crocante. Se acompaña con su propio jugo y una salsa de champiñones para intensificar su sabor.', '/assets/Salados/Pollos Rellenos/Pollo-relleno-con-champinon-tocino.jpg', 0),
(19, 'Pollos Rellenos', 'Pollo manzana ciruela', '8 a 10 porciones', 19800, 'Pollo deshuesado, desgrasado y adobado. Tiene un relleno levemente agridulce, que mezcla manzana en trozos pequeños, ciruela deshidratada, nuez y un toque de curry. Incluye el jugo de la cocción y una ligera salsa de mostaza.', '/assets/Salados/Pollos Rellenos/Pollo-relleno-manzana-ciruela.jpg', 0),
(20, 'Quiches', 'Quiche de cebolla pimentón aceituna', '6 a 8 porciones', 12900, 'Base de masa delgada y sabrosa, rellena con pimentones pelados, cortados en julianas y salteados con aceite de oliva, cebolla pluma levemente caramelizada y aceitunas negras. Todo unido a la mezcla característica de crema, huevo y queso.', '/assets/Salados/Quinches/Quiche-cebolla-pimenton.jpg', 0),
(21, 'Quiches', 'Quiche cebolla sésamo', '6 a 8 porciones', 12900, 'Base de masa delgada y sabrosa, rellena con dulce cebolla pluma cocinada y levemente caramelizada que se mezcla con quesos, crema, huevos y toques de sésamo tostado.', '/assets/Salados/Quinches/Quiche-cebolla-sesamo.jpg', 0),
(22, 'Quiches', 'Quiche espinaca ricotta champiñón', '6 a 8 porciones', 12900, 'Base de masa delgada y sabrosa, rellena con una elegante y fina mezcla de verduras: champiñones salteados, espinaca cortada en julianas y pequeños trozos de pimiento rojo. Todo unido con ricotta, huevos, quesos y crema dando como resultado un producto deli', '/assets/Salados/Quinches/Quiche-champinon-espinaca.jpg', 0),
(23, 'Quiches', 'Quiche champiñón tocino', '6 a 8 porciones', 12900, 'Tarta de masa delgada y sabrosa, rellena de champiñones salteados, un toque de tocino desgrasado y sofrito de cebollín. Unido por los clásicos ingredientes: quesos, huevo y crema. Dando como resultado un plato con carácter y de sabor intenso.', '/assets/Salados/Quinches/Quiche-champinon-tocino.jpg', 0);

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
  ADD PRIMARY KEY (`cliId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
