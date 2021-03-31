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
CREATE DATABASE IF NOT EXISTS `crud-ci-vue` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `crud-ci-vue`;

-- Volcando estructura para tabla crud-ci-vue.tb_kategori
CREATE TABLE IF NOT EXISTS `tb_kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla crud-ci-vue.tb_kategori: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_kategori` DISABLE KEYS */;
REPLACE INTO `tb_kategori` (`id_kategori`, `kategori`, `deskripsi`) VALUES
	(18, 'gfdg', 'qwqwew'),
	(19, 'kkkk', 'ityityityi');
/*!40000 ALTER TABLE `tb_kategori` ENABLE KEYS */;

-- Volcando estructura para tabla crud-ci-vue.tb_pengarang
CREATE TABLE IF NOT EXISTS `tb_pengarang` (
  `id_pengarang` int(11) NOT NULL AUTO_INCREMENT,
  `pengarang` varchar(50) DEFAULT NULL,
  `tgl_lahir` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pengarang`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla crud-ci-vue.tb_pengarang: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_pengarang` DISABLE KEYS */;
REPLACE INTO `tb_pengarang` (`id_pengarang`, `pengarang`, `tgl_lahir`) VALUES
	(1, 'afe', '2021-03-16'),
	(3, 'hjhgj', '2021-03-16'),
	(6, 'jjj', '2021-03-14');
/*!40000 ALTER TABLE `tb_pengarang` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
