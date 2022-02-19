/*
 Navicat Premium Data Transfer

 Source Server         : haroku_gamaservintemec_servidor
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : us-cdbr-east-03.cleardb.com:3306
 Source Schema         : heroku_b038aab427a6e55

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 19/03/2021 17:40:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lugares
-- ----------------------------
DROP TABLE IF EXISTS `lugares`;
CREATE TABLE `lugares` (
  `id` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `imagen_nombre` varchar(255) DEFAULT NULL,
  `importancia` varchar(255) DEFAULT NULL,
  `latitud` varchar(255) DEFAULT NULL,
  `longitud` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `reaction` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lugares
-- ----------------------------
BEGIN;
INSERT INTO `lugares` VALUES ('1', 'Universidad De Lasalle', 'La Universidad Privada más grande de la región, ubicada en León y Salamanca, contamos con posgrados y diplomados en León.', 'Av. Universidad 602 Col. Lomas del Campestre\\n C.P. 37150, León, Gto, México', '477 712 3700', 'http://bajio.delasalle.edu.mx', 'https://mtwdm.kicks-ass.net/lugaresApi/img/1.jpg', '', '21.1071', '-101.6952', '5', 'Universidad De Lasalle', '');
INSERT INTO `lugares` VALUES ('2', 'Arco de mi Casa', 'El Arco Triunfal de la Calzada de Los Héroes, mejor conocido como \"Arco de la Calzada\", es el emblema representativo de la ciudad de León.', 'Calle Calz. de los Héroes 104, \\nCentro, 37370 León, Gto.', '', 'https://es.wikipedia.org/wiki/Arco_de_La_Calzada', 'https://mtwdm.kicks-ass.net/lugaresApi/img/2.jpg', '', '21.1239', '-101.6712', '4.3', 'Arco de mi Casa', '');
INSERT INTO `lugares` VALUES ('3', 'Templo Expiatorio ', 'El Templo Expiatorio Diocesano del Sagrado Corazón de Jesús también conocido simplemente como \"El Expiatorio\" es un templo dedicado al Sagrado Corazón de Jesús, ubicado en León, Guanajuato, en México.', 'Calle Francisco I. Madero 721, \\nCentro, 37000 León, Gto.', '', 'https://elsagradocorazon.org/templo-expiatorio-diocesano-del-sagrado-corazon-de-jesus/', 'https://mtwdm.kicks-ass.net/lugaresApi/img/3.jpg', '', '21.1205', '-101.6748', '5', 'Templo Expiatorio ', '');
INSERT INTO `lugares` VALUES ('4', 'Parque Zoológico de León', 'La colección faunística inició con algunas aves de la región, venados cola blanca, patos domésticos y caballos, para posteriormente sumar especies de animales herbívoros a la familia del ZooLeón.', 'CARRETERA IBARRILLA KM 6, \\n37207 LEÓN, MÉXICO', '477 210 2335', 'https://www.zooleon.org.mx', 'https://mtwdm.kicks-ass.net/lugaresApi/img/4.jpg', '', '21.1822', '-101.6505', '4.6', 'Parque Zoológico de León', '');
INSERT INTO `lugares` VALUES ('5', 'Museo de Arte e Historia de Guanajuato', 'Museo de historia y arte con arquitectura notable, exhibiciones de esculturas mexicanas y cultura regional.', 'Prol, Calle Calz. de los Heroes 908,\\n La Martinica, 37500 León, Gto.', '477 104 1100', 'https://sic.cultura.gob.mx/ficha.php?table=museo&table_id=1274', 'https://mtwdm.kicks-ass.net/lugaresApi/img/5.jpg', '', '21.1181', '-101.6603', '3.2', 'Museo de Arte e Historia de Guanajuato', '');
INSERT INTO `lugares` VALUES ('6', 'Centro de Ciencias Explora', 'El Museo de Explora Centro de Ciencias Explora, es el museo del Estado de Guanajuato, fue creado en noviembre de 1994. Este centro interactivo tiene como objetivo el fomentar la comprensión del mundo desde una perspectiva científica.', 'Blvrd Francisco Villa 202, \\nLa Martinica, 37500 León, Gto.', '477 711 6711', 'http://w.explora.edu.mx/', 'https://mtwdm.kicks-ass.net/lugaresApi/img/6.jpg', '', '21.1092', '-101.6585', '3.9', 'Centro de Ciencias Explora', '');
INSERT INTO `lugares` VALUES ('7', 'Acuario del Bajío', 'Acuario amplio con más de 300 especies, como tiburones, medusas, corales y caballitos de mar.', 'Blvd. Aeropuerto 104, \\nCerrito de Jerez Nte., 37530 León, Gto.', '477 688 2355', 'https://www.acuariodelbajio.com.mx', 'https://mtwdm.kicks-ass.net/lugaresApi/img/7.jpg', '', '21.093', '-101.6271', '4.1', 'Acuario del Bajío', '');
INSERT INTO `lugares` VALUES ('8', 'Parque Metropolitano de León', 'Área natural con un embalse, área de juegos para niños y actividades como acampar, ciclismo y paseos en bote.', 'Prol. Blvd. Adolfo López Mateos Nte. S/N,\\n El Palote, 37130 León, Gto.', '477 717 4410', 'https://www.parquemetroleon.com/', 'https://mtwdm.kicks-ass.net/lugaresApi/img/8.jpg', '', '21.1733', '-101.6868', '4.7', 'Parque Metropolitano de León', '');
INSERT INTO `lugares` VALUES ('9', 'Forum Cultural Guanajuato', 'El Forum Cultural Guanajuato es un complejo cultural, espacio de entretenimiento, formación artística y cultural que promueve la profesionalización de los artistas regionales, la formación de públicos, así como el turismo cultural.', 'Prol, Calle Calz. de los Heroes 908, \\nLa Martinica, 37500 León, Gto.', '477 104 1105', 'https://forumcultural.guanajuato.gob.mx/fcg/', 'https://mtwdm.kicks-ass.net/lugaresApi/img/9.jpg', '', '21.1171', '-101.6605', '2.8', 'Forum Cultural Guanajuato', '');
INSERT INTO `lugares` VALUES ('10', 'Catedral basílica de León', 'La Catedral Basílica Metropolitana de la Madre Santísima de la Luz de León, es una iglesia de culto católico, ubicada en el centro histórico de la ciudad de León, México. Es la sede metropolitana de la Arquidiócesis de León.', 'Álvaro Obregón 112,\\n Centro, 37000 León, Gto.', '', 'https://es.wikipedia.org/wiki/Catedral_bas%C3%ADlica_de_Le%C3%B3n', 'https://mtwdm.kicks-ass.net/lugaresApi/img/10.jpg', '', '21.1251', '-101.6823', '4.9', 'Catedral basílica de León', '');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
