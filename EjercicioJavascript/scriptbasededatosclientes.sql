-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.7-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para clientes
CREATE DATABASE IF NOT EXISTS `clientes` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `clientes`;

-- Volcando estructura para tabla clientes.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(60) NOT NULL,
  `nombrecompleto` varchar(200) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `tel1` varchar(200) DEFAULT NULL,
  `tel2` varchar(200) DEFAULT NULL,
  `agente` varchar(200) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla clientes.gestiones
CREATE TABLE IF NOT EXISTS `gestiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `agente` varchar(100) DEFAULT NULL,
  `res1` varchar(100) DEFAULT NULL,
  `res2` varchar(100) DEFAULT NULL,
  `res3` varchar(100) DEFAULT NULL,
  `comentarios` varchar(800) DEFAULT NULL,
  `campana` varchar(100) DEFAULT NULL,
  `telMarcado` varchar(30) DEFAULT NULL,
  `guid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gestiones_clientes_idcliente` (`idcliente`),
  CONSTRAINT `FK_gestiones_clientes_idcliente` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
