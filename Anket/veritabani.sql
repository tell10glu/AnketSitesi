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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Anket`
--

LOCK TABLES `Anket` WRITE;
/*!40000 ALTER TABLE `Anket` DISABLE KEYS */;
INSERT INTO `Anket` VALUES (106,7,'DenemeAnket','2015-05-04','2015-05-27','\0','\0'),(107,7,'AnketEmailDeneme','2015-05-04','2015-05-20','\0','\0'),(108,7,'AnketDeneme','2015-05-04','2015-05-25','\0',''),(109,7,'OguzDeneme','2015-05-04','2015-05-28','\0','');
/*!40000 ALTER TABLE `Anket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnketDavet`
--

DROP TABLE IF EXISTS `AnketDavet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnketDavet` (
  `KullaniciEmail` varchar(50) NOT NULL DEFAULT '',
  `anketId` int(11) NOT NULL,
  `mailGonderildi` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnketDavet`
--

LOCK TABLES `AnketDavet` WRITE;
/*!40000 ALTER TABLE `AnketDavet` DISABLE KEYS */;
INSERT INTO `AnketDavet` VALUES ('ogz.khrmn52@gmail.com',107,'\0'),('abdullah.tellioglu93@gmail.com',107,'\0'),('ogz.khrmn52@gmail.com',108,''),('tellioglu_93@hotmail.com',108,''),('abdullah.tellioglu@gmail.com',108,''),('ogz.khrmn52@gmail.com',109,''),('huseyin.can.ercan@hotmail.com',109,''),('tellioglu_93@hotmail.com',109,'');
/*!40000 ALTER TABLE `AnketDavet` ENABLE KEYS */;
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
INSERT INTO `AnketKategori` VALUES (106,1),(106,5),(106,2),(106,3),(107,1),(107,5),(107,2),(108,1),(108,5),(108,2),(109,1),(109,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cevap`
--

LOCK TABLES `Cevap` WRITE;
/*!40000 ALTER TABLE `Cevap` DISABLE KEYS */;
INSERT INTO `Cevap` VALUES (1,'Trabzon SPOR',25),(2,'bjk',25),(3,'gs',25),(4,'gfb',25),(5,'GenÃ§lerBirliÄ?i',25),(6,'OsmanlÄ±Spor',25),(7,'Kola',26),(8,'Ayran',26),(9,'Gazoz',26),(10,'Å?algam',26),(11,'asdf',28),(12,'asfdsadf',28),(13,'BEn',29),(14,'OÄ?uz',29),(15,'HÃ¼seyin',29);
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
  `soruTipi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Soru`
--

LOCK TABLES `Soru` WRITE;
/*!40000 ALTER TABLE `Soru` DISABLE KEYS */;
INSERT INTO `Soru` VALUES (25,NULL,'Å?ampiyon Kim Olur',106,2),(26,NULL,'Hangi Ä°Ã§eceÄ?i Tercih Edersiniz',106,1),(27,NULL,'SoruDeneme1',108,1),(28,NULL,'SoruDeneme1',108,1),(29,NULL,'Seni Siken Kim ?',109,1);
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

-- Dump completed on 2015-05-04 12:43:03
