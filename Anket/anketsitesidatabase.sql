-- MySQL dump 10.13  Distrib 5.6.23, for osx10.8 (x86_64)
--
-- Host: localhost    Database: AnketSitesi
-- ------------------------------------------------------
-- Server version	5.6.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Anket`
--

DROP TABLE IF EXISTS `Anket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Anket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KullaniciID` int(11) NOT NULL,
  `AnketAdi` varchar(50) NOT NULL DEFAULT '',
  `KoyulmaTarihi` date DEFAULT NULL,
  `BitisTarihi` date DEFAULT NULL,
  `IPKullanimIzin` bit(1) DEFAULT NULL,
  `Aktif` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Anket`
--

LOCK TABLES `Anket` WRITE;
/*!40000 ALTER TABLE `Anket` DISABLE KEYS */;
INSERT INTO `Anket` VALUES (1,7,'abdullahinanketi',NULL,NULL,'',NULL),(2,7,'qweqwe',NULL,NULL,'\0',NULL),(3,7,'qweqwe',NULL,NULL,'\0',NULL),(4,2,'cetininanketi',NULL,NULL,'\0',NULL),(5,2,'cetininanketi2',NULL,NULL,'\0',NULL),(6,2,'cetinanket123',NULL,NULL,'\0',NULL),(7,2,'cetinaa',NULL,NULL,'\0',NULL),(8,2,'anketceto',NULL,NULL,'\0',NULL),(9,2,'anketcet',NULL,NULL,'\0',NULL),(10,7,'abdullahinanket',NULL,NULL,'\0',NULL),(11,7,'asdfasdf',NULL,NULL,'\0',NULL),(12,7,'tewtrwt',NULL,NULL,'\0',NULL),(13,7,'bhbhl',NULL,NULL,'\0',NULL),(14,7,'asdfasdf',NULL,NULL,'\0',NULL),(15,7,'qweasfd',NULL,NULL,'\0',NULL),(16,7,'weqrrqwe',NULL,NULL,'\0',NULL),(17,7,'asdfasf',NULL,NULL,'\0',NULL),(18,7,'asdfasf',NULL,NULL,'\0',NULL),(19,7,'qwersafd',NULL,NULL,'\0',NULL),(20,7,'qwrr',NULL,NULL,'\0',NULL),(21,7,'qwer',NULL,NULL,'\0',NULL),(22,7,'asdfa',NULL,NULL,'\0',NULL),(23,7,'asdf',NULL,NULL,'\0',NULL),(24,7,'asdf',NULL,NULL,'\0',NULL),(25,7,'asdfsadf',NULL,NULL,'\0',NULL),(26,7,'asdf',NULL,NULL,'\0',NULL),(27,7,'WDFASDF',NULL,NULL,'\0',NULL),(28,7,'asfasdf',NULL,NULL,'\0',NULL);
/*!40000 ALTER TABLE `Anket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnketKategori`
--

DROP TABLE IF EXISTS `AnketKategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnketKategori` (
  `AnketID` int(11) NOT NULL,
  `KategoriID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnketKategori`
--

LOCK TABLES `AnketKategori` WRITE;
/*!40000 ALTER TABLE `AnketKategori` DISABLE KEYS */;
INSERT INTO `AnketKategori` VALUES (1,1),(1,5),(1,2),(1,3),(9,1),(9,5),(9,3),(9,4),(10,1),(10,2),(10,3),(11,1),(11,5),(11,2),(11,3),(12,1),(12,3),(12,4),(13,5),(13,2),(13,3),(14,1),(14,3),(14,4),(15,1),(15,5),(15,2),(15,3),(16,1),(16,5),(17,5),(17,2),(18,1),(18,5),(18,2),(19,1),(19,5),(20,1),(20,5),(20,2),(21,5),(21,2),(22,1),(22,5),(22,2),(23,1),(23,5),(24,1),(24,5),(24,2),(25,3),(26,2),(27,1),(27,5),(27,2),(28,5),(28,2),(28,3);
/*!40000 ALTER TABLE `AnketKategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cevap`
--

DROP TABLE IF EXISTS `Cevap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cevap` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cevap` varchar(50) DEFAULT NULL,
  `soruID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cevap`
--

LOCK TABLES `Cevap` WRITE;
/*!40000 ALTER TABLE `Cevap` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cevap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kategori`
--

DROP TABLE IF EXISTS `Kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Kategori` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `KategoriAdi` varchar(50) DEFAULT NULL,
  `Onay` bit(1) DEFAULT NULL,
  `parentid` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kategori`
--

LOCK TABLES `Kategori` WRITE;
/*!40000 ALTER TABLE `Kategori` DISABLE KEYS */;
INSERT INTO `Kategori` VALUES (1,'Spor','',-1),(2,'Siyaset','',-1),(3,'Sanat','',-1),(4,'Kitap','',-1),(5,'Futbol','',1);
/*!40000 ALTER TABLE `Kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kullanici`
--

DROP TABLE IF EXISTS `Kullanici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Kullanici` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `KullaniciAdi` varchar(10) NOT NULL DEFAULT '',
  `Sifre` varchar(15) NOT NULL DEFAULT '',
  `Email` varchar(50) NOT NULL DEFAULT '',
  `Rol` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `KullaniciAdi` (`KullaniciAdi`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kullanici`
--

LOCK TABLES `Kullanici` WRITE;
/*!40000 ALTER TABLE `Kullanici` DISABLE KEYS */;
INSERT INTO `Kullanici` VALUES (2,'cetin','1602435856','asdfasdfasf',2),(4,'cetin2','1602435856','asdfasdf',2),(6,'oguz','1164686755','ogz.khrmn52@gmail.com',1),(7,'abdullah','2781275209','abdullah.tellioglu93@gmail.com',1);
/*!40000 ALTER TABLE `Kullanici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KullaniciCevap`
--

DROP TABLE IF EXISTS `KullaniciCevap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KullaniciCevap` (
  `kullaniciID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cevapID` int(11) DEFAULT NULL,
  `cevapdurum` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kullaniciID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KullaniciCevap`
--

LOCK TABLES `KullaniciCevap` WRITE;
/*!40000 ALTER TABLE `KullaniciCevap` DISABLE KEYS */;
/*!40000 ALTER TABLE `KullaniciCevap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Log`
--

DROP TABLE IF EXISTS `Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Tarih` date DEFAULT NULL,
  `Saat` time DEFAULT NULL,
  `AksiyonAdi` varchar(50) DEFAULT NULL,
  `Cikti` varchar(250) DEFAULT NULL,
  `Renk` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Log`
--

LOCK TABLES `Log` WRITE;
/*!40000 ALTER TABLE `Log` DISABLE KEYS */;
/*!40000 ALTER TABLE `Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rol`
--

DROP TABLE IF EXISTS `Rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rol` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `RolAdi` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rol`
--

LOCK TABLES `Rol` WRITE;
/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Soru`
--

DROP TABLE IF EXISTS `Soru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Soru` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `soruNumarasi` int(11) DEFAULT NULL,
  `soru` varchar(250) NOT NULL DEFAULT '',
  `anketId` int(11) DEFAULT NULL,
  `sorutTipi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Soru`
--

LOCK TABLES `Soru` WRITE;
/*!40000 ALTER TABLE `Soru` DISABLE KEYS */;
/*!40000 ALTER TABLE `Soru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SoruTipleri`
--

DROP TABLE IF EXISTS `SoruTipleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SoruTipleri` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SoruTipi` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SoruTipleri`
--

LOCK TABLES `SoruTipleri` WRITE;
/*!40000 ALTER TABLE `SoruTipleri` DISABLE KEYS */;
INSERT INTO `SoruTipleri` VALUES (1,'Coklu Secim'),(2,'Tekli Secim'),(3,'Yazi');
/*!40000 ALTER TABLE `SoruTipleri` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-23 22:57:41
