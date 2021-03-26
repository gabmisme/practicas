-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para crud-ci-vue
DROP DATABASE IF EXISTS `crud-ci-vue`;
CREATE DATABASE IF NOT EXISTS `crud-ci-vue` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `crud-ci-vue`;

-- Volcando estructura para tabla crud-ci-vue.tb_kategori
DROP TABLE IF EXISTS `tb_kategori`;
CREATE TABLE IF NOT EXISTS `tb_kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla crud-ci-vue.tb_kategori: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_kategori` DISABLE KEYS */;
REPLACE INTO `tb_kategori` (`id_kategori`, `kategori`, `deskripsi`) VALUES
	(12, 'jhgjhgj', 'hjhgjhgjg'),
	(13, 'jhgjgh', 'fdhdghd'),
	(14, 'jhgjgh', 'fdhdghd'),
	(15, 'jhgjgh', 'fdhdghd'),
	(16, 'jhgjgh', 'fdhdghd');
/*!40000 ALTER TABLE `tb_kategori` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
