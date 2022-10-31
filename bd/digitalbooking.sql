CREATE DATABASE  IF NOT EXISTS `digitalbooking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `digitalbooking`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: digitalbooking
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caracteristicas`
--

DROP TABLE IF EXISTS `caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristicas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aire_acondicionado` bit(1) DEFAULT NULL,
  `estacionamiento_gratuito` bit(1) DEFAULT NULL,
  `cocina` bit(1) DEFAULT NULL,
  `apto_mascotas` bit(1) DEFAULT NULL,
  `pileta` bit(1) DEFAULT NULL,
  `televisor` bit(1) DEFAULT NULL,
  `wifi` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas`
--

LOCK TABLES `caracteristicas` WRITE;
/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
INSERT INTO `caracteristicas` VALUES (1,_binary '',_binary '',_binary '',_binary '',_binary '',_binary '',_binary '');
/*!40000 ALTER TABLE `caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `url_imagen` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'807.374 hoteles','https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','Hoteles'),(2,'258.344 hostels','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/335030057.jpg?k=ad9ca95bc6bd4a12662a53990a2ff5447193ec086b7ff5789bdb56a90532ede9&o=&hp=1','Hostels'),(3,'50.033 departamentos','https://images.pexels.com/photos/1571452/pexels-photo-1571452.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','Departamentos'),(4,'33.499 bed and breakfast','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/249501228.jpg?k=8e553cf07f6c46436a6e0e9012d216a65fcb8535bbbf8e709685cb5e59289dd6&o=&hp=1','Bed and Breakfast');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ciudad_nombre` varchar(255) DEFAULT NULL,
  `pais_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3wpxqd6g0rmrng79oxd2e2stv` (`pais_id`),
  CONSTRAINT `FK3wpxqd6g0rmrng79oxd2e2stv` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Córdoba',1),(2,'Buenos Aires',1),(3,'Mendoza',1),(4,'Salta',1);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrxdxytf48cr005vej8540b0rr` (`producto_id`),
  KEY `FKq9wif2hcqfxj8t49wo613wm0h` (`usuario_id`),
  CONSTRAINT `FKq9wif2hcqfxj8t49wo613wm0h` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKrxdxytf48cr005vej8540b0rr` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `producto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhylof04iou23s0pb9ab6pbd4j` (`producto_id`),
  CONSTRAINT `FKhylof04iou23s0pb9ab6pbd4j` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
INSERT INTO `imagenes` VALUES (1,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/210286836.jpg?k=1a5aa7384548e615005e7ddbb1d2235c3e8641df8ccfb169994f22b1f0217a5b&o=&hp=1',1),(2,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/210286629.jpg?k=ccfcafe5c4daa5f41fff7844644325a128a9189f77ef286ac5ab55a94fcd2df4&o=&hp=1',1),(3,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/163517804.jpg?k=b55b4fc687b19b621091c21bccdb5291036f355276b57f374791a33111781d4f&o=&hp=1',1),(4,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/164602973.jpg?k=f7871f087e0b89fa8a759f5059e8f404396072ad45f6a26fa7b1a9cd22f78b1d&o=&hp=1',1),(5,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/210290121.jpg?k=eefdac293d0e877144a034ed4b0a2e91d2fa975f5e13845898b87808b28735a3&o=&hp=1',1),(6,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/322192657.jpg?k=61f4db92dd2f2d5a16326c3a13619a009715814fa734e7c6d25666aedea78d71&o=&hp=1',2),(7,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/333601159.jpg?k=65a38a4d1d851bcc8476c9b566c147b2016d2f56f9141b8bb7472cec65f4a1a8&o=&hp=1',2),(8,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/321266406.jpg?k=414812bf00765902176d7ebf7e4a4bbf3d6f14f8ae46e05e5e4222467d19475c&o=&hp=1',2),(9,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/322192307.jpg?k=68e9c411eac94d903681a2efaabd979907ac947b277dedd460b9c819c36e845e&o=&hp=1',2),(10,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/330414557.jpg?k=bc6e9cbc7ec37250957c2bbb56688edc1fa4e0e86b04bdfc3503efb97bfdc41d&o=&hp=1',2),(11,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/274059877.jpg?k=279e6de33d56c10da9823bbedb0e129da76066fa465b2d06c5521ff263008522&o=&hp=1',3),(12,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/281687865.jpg?k=468e39e17f9839a82c6dd964bbc12b809d95ac4bf7980fba59fa4bbd64ed8491&o=&hp=1',3),(13,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/274059860.jpg?k=4b6f8479f87be6a53c0d82f484a2b5ac0a185a8c97bc5d96c50220d152b2b545&o=&hp=1',3),(14,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/274059897.jpg?k=26dc08a5f05ae202ebf3d66ddd1bf339ee42190d9b705aeda0fa83765d1f7910&o=&hp=1',3),(15,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/274177000.jpg?k=f54177c187df0ec370d6edc9360a8c4874cb8c3646ea7777da82e6f4f18f777d&o=&hp=1',3),(16,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/85424450.jpg?k=3dde598e779e5c3031059d2e99006b45a5fb4440cfa615d1419e1f5a34d56e13&o=&hp=1',4),(17,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/70539101.jpg?k=cf3c24ea11125ae1228b42dfabb41083ddc8e92fd603c07aea43dfc8ee545195&o=&hp=1',4),(18,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/85424696.jpg?k=af07b66e1e7173ac8411a7aa402f6d430cab196cbbc3692c9bed5f2c341cb30a&o=&hp=1',4),(19,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/70543447.jpg?k=e8e2eb5868db57ff95d27a8a754d234f8f8d91e3e007667d6e1e46c86716abd3&o=&hp=1',4),(20,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/70543497.jpg?k=c3c6bb25f8d98a7efa055555e18c2b99d2ac4d3b31400bdc12e0591c479d2836&o=&hp=1',4),(21,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/337855393.jpg?k=feb6653b19464b7cf268dec1e4e0832eaa03feb22d8b6cb6ecaf628c590ca840&o=&hp=1',5),(22,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/186355776.jpg?k=16a37e4db71f087b32b6f8a84bf398de7721ca67158f10b2bc69d9c380f00587&o=&hp=1',5),(23,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/190082136.jpg?k=d452d68205430e9b3ea2c40216f2ca190fcc781046e69a0aa9742c0bedb258a1&o=&hp=1',5),(24,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/337855413.jpg?k=9ea15821e794b9037ba558695f93538cc422295b0e8550b59d0646d966e8c731&o=&hp=1',5),(25,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/337855389.jpg?k=65580b456fbb93020c6bba011e3ba9fd44216b14743f24a1708a713dfafa91a9&o=&hp=1',5),(26,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/355143084.jpg?k=cfba098ea7a7f8974026e292950ffd71761d13d3056f8f740e40f9408e78b9f5&o=&hp=1',6),(27,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/355120311.jpg?k=e51c6a0e2fdb01fd13752b330e760739e15e04e8d1e5cfe22a521c1366c64560&o=&hp=1',6),(28,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/355143070.jpg?k=5c88c71b3d67f45a85b8160796568ed49815b41206f46658b3167d108191b3f4&o=&hp=1',6),(29,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/355143101.jpg?k=9bc2dbc172c623b845065b667fa474a85ea3b57a4e7b5f24662fdd0c3045f55b&o=&hp=1',6),(30,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/355143078.jpg?k=ae9da53773be64671a4f757188957457dd26d20195010b7ec13cdfae9e16ac81&o=&hp=1',6),(31,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/214519676.jpg?k=867ceb008f2990281fb4571feef43d6bc494cd11b974ac4cb721f50ce3566264&o=&hp=1',7),(32,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/214519737.jpg?k=c7cd741e06bbf4ef231d72e954c4dcc8cab6ae22bbffcb051e3479734f8f66c8&o=&hp=1',7),(33,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/245051995.jpg?k=e990d85fee3ebc5c03811ef93ee8e62ce4777e3e53788bc5194bd0e5d9ba3509&o=&hp=1',7),(34,'seundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/214519724.jpg?k=721657bee71a3255acdfbe5d5618cbd27d3353c1c4c805fbfb2888ed1531761d&o=&hp=1',7),(35,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/214519980.jpg?k=c7f1aca47f0a3bfc520d741ea5a170a8b58eea6aee0e913703592b7e411595ae&o=&hp=1',7),(36,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/350568782.jpg?k=aad6baa948ee425198e47ed9d8a90e8447b418cb8afd17cf02a22cc0f2fe102a&o=&hp=1',8),(37,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/172965867.jpg?k=dedd7b8abbbce9805e0938eb68692865dd2c47fe35893764c70e222d05bdd3b0&o=&hp=1',8),(38,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/350568880.jpg?k=075f8d54f19990a7602512e91bfdb7c3613fc2e16e58f8287fb62addd0aace1d&o=&hp=1',8),(39,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/350568891.jpg?k=83a8c4ae7278524de436a45b21af0bf649821032514a7373831719e235ede9cc&o=&hp=1',8),(40,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/350568907.jpg?k=b2a29919603584c3db977f56d5ec8ae5016304fa9e850548552fe43af344566f&o=&hp=1',8),(41,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/290932356.jpg?k=1bdf2d9d8228f40132b119e329beba728c7ba3a32769bb8af8af79fe7b046a18&o=&hp=1',9),(42,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/210286629.jpg?k=ccfcafe5c4daa5f41fff7844644325a128a9189f77ef286ac5ab55a94fcd2df4&o=&hp=1',9),(43,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/131887033.jpg?k=1abf31a97cd0988342838fa21753d864d3883252f1b6a93a3e7997b1644c2258&o=&hp=1',9),(44,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/172968050.jpg?k=24a249c167af44dea2e313bf1700bf685622ded06cecd2a288ba97f5038ec674&o=&hp=1',9),(45,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/82276535.jpg?k=853bc6ebdde9885f81a60ad6f2ebf6f1211b1629e810fb77e7eb1d989e2be80e&o=&hp=1',9),(46,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/218402915.jpg?k=7e61cd458922631e993db3a07d72b6edda60f9c3745f14749ca991c6bc596467&o=&hp=1',10),(47,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/218402877.jpg?k=c1ca9198e1fbc11a49b0a7f69a823c3a48fe32815fc42c31a55312d6d08af4a8&o=&hp=1',10),(48,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/194338112.jpg?k=a5fa2069faf66f1bb556ae8ede0ec45f6be8269d7adb2bb868bf2afd050d9ddf&o=&hp=1',10),(49,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/218403233.jpg?k=5681372436af8790930f829efa22135381c6292b9095bb1985b698e9b6bf9dc9&o=&hp=1',10),(50,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/194335111.jpg?k=615afeacbedde6fcdbe6680d956ac1e06e2e1680fb82e939722581f6bfdec36a&o=&hp=1',10),(51,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/124416901.jpg?k=9cf203653e00561aa0676dfd9491bec060c6fc15026e1f9df7d515f927af186a&o=&hp=1',11),(52,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/230266122.jpg?k=353003e89efc07dbb9e347f35d3a565f6c446b64ed7f8bdbce09762b1a1f1a10&o=&hp=1',11),(53,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/124416914.jpg?k=b2c96c84b052767d4671303f94e4d2c980a716d5e52aed5da769233738c8a092&o=&hp=1',11),(54,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/230272692.jpg?k=8429749e37ca7a38fa95a666e5d6a1592310dbba693653db84e080f732d7d5de&o=&hp=1',11),(55,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/230266115.jpg?k=074d0e66206d990efcdb171d45c90ec0fd74557d60ad9eb80500edebffd54eb9&o=&hp=1',11),(56,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/118682193.jpg?k=88ddc2f4d17f98bf824aab06b903f96ed2b5e460e555887f078b32617d3c0de9&o=&hp=1',12),(57,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/118682189.jpg?k=ba7507e8d6ee9485eea215d4217f1c79b28328ba081235013426dae8a40d2d5f&o=&hp=1',12),(58,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/118682195.jpg?k=7723f38a5c76bbe7c1725f3adbd7f0aa1970693e4356d547c1107d55ac3b0eb2&o=&hp=1',12),(59,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/118682197.jpg?k=d78e1463e50cc105bfa908b1f30615159aaae99fe4c056f687df9cee47281ac8&o=&hp=1',12),(60,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/118682187.jpg?k=e0d6997e597d587d09f38b7d8fce38b11312091d72516074f1960e0943fc9e3a&o=&hp=1',12),(61,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/285925762.jpg?k=179b7e3eb80f991c0993786f50c2d0ecc7635a222632ab3d5618043ff83c571f&o=&hp=1',13),(62,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/277334352.jpg?k=df39a082d7185287767e511cd655b78b2c2ac7aaaa443b689c7ffc38b6749aec&o=&hp=1',13),(63,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/285925741.jpg?k=f6483312e0136dc5140022005bcadf38b327c7ea76ca94cb6de8781c86bd54a9&o=&hp=1',13),(64,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/285925704.jpg?k=8632e09b4d15f935e46d790c290abaa12224f89ceb73c246c8e373566856e4bf&o=&hp=1',13),(65,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/285925700.jpg?k=18eb3f340033fd15d89b51747c9e88a832142e7721d1a75d7c143b105a401608&o=&hp=1',13),(66,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/205590312.jpg?k=39c00c025601c949797b7afcb78216b7856abfe0427eb02d5f2b9e926256f534&o=&hp=1',14),(67,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/352851225.jpg?k=6e3f4744e8200b70429805e9f668cec4259421c7cb5052c716eea6b56f443a03&o=&hp=1',14),(68,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/352852473.jpg?k=6770935594b417d40fd30d965e19d5ca73e2405ac54aa9b27eda530c40f50f33&o=&hp=1',14),(69,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/365098738.jpg?k=3813437f060e35ed426272aa90e3d1bb4ec00e5e650fccfbb165e02af2030672&o=&hp=1',14),(70,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/365098740.jpg?k=6d43c8e8e0085893674e4e2feddccafc3a638a9e4d02f4ceb77ddb320b0f1582&o=&hp=1',14),(71,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/258961262.jpg?k=95d09ec3b7933d3aa39d119cbf9fcf3970ea9df6e6c75d7b01903f2f4bfd79c6&o=&hp=1',15),(72,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/258961424.jpg?k=9018038d95df2e8d551e00a8c819c7800ceda64b034342c4379981e2dbcf45ba&o=&hp=1',15),(73,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/231197328.jpg?k=a6e4467845f7abc90819d0374097469bd33ea6d23b953b2c3415eaf41412478a&o=&hp=1',15),(74,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/315091145.jpg?k=f2190171b096018b4d1983bccce6d7e6a2bc01f0ae77ac3acc90a6315ba74792&o=&hp=1',15),(75,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/231202465.jpg?k=f54cc5b2e74e81e3945809d39dcaa4c1c59e84303e968265df4e98746519723f&o=&hp=1',15),(76,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/205589314.jpg?k=332c70759742c66b637e13dfc045d0902b454e3a0576642ae8457b8b93957aa2&o=&hp=1',16),(77,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/231210835.jpg?k=cd5c6c680160524e6713934c281c03874f90acd654ed27ed154e93778045c609&o=&hp=1',16),(78,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/205589310.jpg?k=cb2db990a653def7c16827759ac9fae717648220c868854008af00e242bd949c&o=&hp=1',16),(79,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/231210871.jpg?k=6f7dd75ef3e816e4f1e34c10b444ff0934e3b402ba7ca7aa78fbb1cc17816779&o=&hp=1',16),(80,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/231210924.jpg?k=07aa62f2a60bef8415b27347888e9883deffd3df435cd304315238c5e1777337&o=&hp=1',16),(81,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/353346174.jpg?k=41131669bd173e314a70979d2a310bb3daa17b04a00575f5c0656b93fad9862f&o=&hp=1',17),(82,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/353346175.jpg?k=56c4847258acf0ada28e3323d63686a4f44989274d7eefc0ae3c33935d753acd&o=&hp=1',17),(83,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/353346176.jpg?k=0b9b6887d1129ff365a8621d81c4aae619f242e7ee6260e1983023ea3a136f79&o=&hp=1',17),(84,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/353346177.jpg?k=661ea65a3fbd08d0d2024de98966d1d457690649f49ef17260b1739c59e96c4e&o=&hp=1',17),(85,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/353346181.jpg?k=ac1b97691661543b38fa34906db1abfed4363ee4009e5142a67c58500d2a3da2&o=&hp=1',17),(86,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/98889860.jpg?k=d98bcacd4e24b915dc522d85f29c3e50fb86367d570c3085125edff0afcfc076&o=&hp=1',18),(87,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/98983162.jpg?k=50978d9fa6a944fcde523b4835b9cff2ac5fff668daaee9d28ac3fe8842254f8&o=&hp=1',18),(88,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/98971442.jpg?k=a8181eb0955df63a02c09b432e33c556fa9f5ab02420d39f4a6e59340fc5b032&o=&hp=1',18),(89,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/98982684.jpg?k=212985c13b0523575660e2a2f8070f896f84e74f232a7142526b06c02b75647c&o=&hp=1',18),(90,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/238028994.jpg?k=1fd0eef570bf748afdb9012747d1c77f4655232942908d94b5975fec261257c5&o=&hp=1',18),(91,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/185271569.jpg?k=3bafae875c09aa69063a1a13ac5a0623d8284c732df626dd6d35f27c961b9d99&o=&hp=1',19),(92,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/185282402.jpg?k=3099734b9750b18d73f28dd80ccbaad7ea5a3dbafa0d69bbefa70158aef8d288&o=&hp=1',19),(93,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/185280385.jpg?k=f00c1ff343ff6352a4c27f0040719b7c46b60e400825bcd5f3c5296bc738f733&o=&hp=1',19),(94,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/185276098.jpg?k=2a467588f3aade9de8bf1d422c0cdfb3a02c825ab2fc3c9c553a7bb299dcffb2&o=&hp=1',19),(95,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/185255916.jpg?k=48e772b71e8f3c77405cca34ceed2195d034cb6624fa46716eb4d8d171455804&o=&hp=1',19),(96,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/346839760.jpg?k=97d65235b0c8b28e5afe497e6562d38e8df5223c7757419679008cb840fbf411&o=&hp=1',20),(97,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/346839769.jpg?k=dbab791e8e9397cf4ad39b47d067af90e75290e42b0d3afa1911f3f44692fd55&o=&hp=1',20),(98,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/351334127.jpg?k=a105756204238813b292c7022b03d9a8559201ae180d49ce469a02920bf2784e&o=&hp=1',20),(99,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/351334488.jpg?k=f9a92c2976970f54a3a9911b797046eac0f4f133c8fc579437f62bcfac853874&o=&hp=1',20),(100,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/351334125.jpg?k=9b76328ff4e61b877e9ba728334db37cb0d1e9c5dcef41cb0721a6e916cdab3e&o=&hp=1',20),(101,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/327385690.jpg?k=2fc987f508ecf81d2669320ee879d4deb322f551af9bc1d7e063ae125b51c442&o=&hp=1',21),(102,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/137831891.jpg?k=0c6570af269dcbe7a053e1b837921a29e4f92bc295a2ebb3bf8ccadf40c5c582&o=&hp=1',21),(103,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/327385708.jpg?k=e4cdc55c4e072f6f94fb85b874f02e41a700b711d9d7507285e70d4118d72ebb&o=&hp=1',21),(104,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/327385713.jpg?k=b3dc2af8107fce326af204e029411c7e799c1c254cacb0361b0a10cd81542ede&o=&hp=1',21),(105,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/327385686.jpg?k=4b269adcce234233675594813427b7cf20701817e88dfea7c8b35dfb45735628&o=&hp=1',21),(106,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/131386231.jpg?k=435c743cbda963e51fa61dc4ced399086fa9b58b6f5e4db8abe63049d17e6786&o=&hp=1',22),(107,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/131386295.jpg?k=0d57cc99a116f7656516d9a80a2fd357524afc16d8ae2ed6f4ecdc7701a3b008&o=&hp=1',22),(108,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/131386213.jpg?k=dc43b1cba4193f31d8c9cdb48cd617af569048a68f35d069c21a5a0af1f52605&o=&hp=1',22),(109,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/131386201.jpg?k=a0c2c61510bc20df962b133ffac875194914d1935ec32dccf5a2073ba55b9a8e&o=&hp=1',22),(110,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/131386146.jpg?k=b6b67868402e0fbddae9d009ea937083d185cdeb9bbe7f12400a51ebb54eba01&o=&hp=1',22),(111,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/347714673.jpg?k=5e26884056586aa2ecabda76fea4879c7b1c7fa705e3f317e0889fa92fd58d90&o=&hp=1',23),(112,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/347714550.jpg?k=559be3b9cde250bb3a456fc2f9bffe2ae9c740842af261e02dc0e0cee22e2246&o=&hp=1',23),(113,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/347165262.jpg?k=31c43d0519e8fd56ab41fe401cb7a31329eede38d0832c0dacb8998a9594f73b&o=&hp=1',23),(114,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/347714597.jpg?k=bb6849cfa519087297b26ace8c0f2c073284a0887d62d3ae1c42424989f22d95&o=&hp=1',23),(115,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/347714621.jpg?k=91a05f02a13ae23a52617b63b13640b736d35c1c77a6a11e269a3cdbc9fd3a85&o=&hp=1',23),(116,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/102271434.jpg?k=0151a82fde49c69ddfa172c1543e1727e06f55bf53da2d7a8e4d3fd6457a3e84&o=&hp=1',24),(117,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/111802017.jpg?k=ba1153397b0c589f00b772aa970b82c8810cfe2e4afb0420c01133a1c36943bb&o=&hp=1',24),(118,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/242601162.jpg?k=8e1a482b74624b171bfd904a3fb4b1fc2e192bbbb39c6ee8f9118123305a2404&o=&hp=1',24),(119,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/322001064.jpg?k=0fb3b8a7fe68c18127beb4cc5cc61462919c574c06e2ed05935a51aa1e40b993&o=&hp=1',24),(120,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/242601178.jpg?k=e7e923de069d078b6cf61d6730fb2dbbe72c7aad811e1a3a9935efff08faccb4&o=&hp=1',24),(121,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/13746279.jpg?k=4386b73cbdcac982c339fd1b04ea9bcd777363a3a3ca27fe6a58b4c1575aa107&o=&hp=1',25),(122,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/13746287.jpg?k=8ccf530db244b9bdc5627384147b485c79c93a997de1269d8e7147b8477eb1af&o=&hp=1',25),(123,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/13746294.jpg?k=3cf7908f3366319ddb1c8cdea43e7eb64ce0f36e44ebd68ceb4d9ea3109ffb9d&o=&hp=1',25),(124,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/13746310.jpg?k=c14a009ef31a65cd49b39bb324c0645c6402c32ab7bd82e50e6b268f92b03847&o=&hp=1',25),(125,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/21169229.jpg?k=353d3f3aced0a724e3777f527324a79432a3074722e17a24d3e048ded6b88258&o=&hp=1',25),(126,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/183832848.jpg?k=ecdae69c0efefcb735cad31bec8bb71f8cbfa4c2b49716770017a0bc867655a2&o=&hp=1',26),(127,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/296103700.jpg?k=fe22da3cd7130e39f3ec3d1c1d2f88b191d0c9726234904f54b1c0e60972f2bd&o=&hp=1',26),(128,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/296104828.jpg?k=3839ac509cb18a4e93550c1b3987cead7382ab5d3d994cc055219dbcb28861fd&o=&hp=1',26),(129,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/296103270.jpg?k=b5b5b88af758dab089b5a854e771b53d0e3c01615e564920d632ad0e166d244a&o=&hp=1',26),(130,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/296102463.jpg?k=ab14e1a88e14ec3189cff763460b8e592209b2bc21b559a50001a04ab5280c70&o=&hp=1',26),(131,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/328141541.jpg?k=9f5a325312e1732dc813c1f87aa1709ceee732700039d8ad631e8c67ad43e519&o=&hp=1',27),(132,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/236041525.jpg?k=9a956a53a060f964e97167202c6d6aa6b3b2de7d14f6febed2b09c7941c74246&o=&hp=1',27),(133,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/236042345.jpg?k=e07493f009bc0a666d1d2b156ef374cfaecec394f042141da7c34b1a87464184&o=&hp=1',27),(134,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/72814267.jpg?k=5f078598da4a3b006f7abaebdcb4ef72c4788c90c32034d8094745b672af411a&o=&hp=1',27),(135,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/72814007.jpg?k=d6dc51122a283b4a054312952c7329060d0fece81a29ce0cbf3c38e98e60eaf2&o=&hp=1',27),(136,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/322893482.jpg?k=dfda21adf74c84ffe9c1a29cd5cc6470025449a161a09acffea3036c22a5c490&o=&hp=1',28),(137,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/326214832.jpg?k=b2999aa44598df556aa78da84bb9d1b90639fe9e94108112c1c34e4a487ae093&o=&hp=1',28),(138,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/324749130.jpg?k=3a5219732ba3c1cf5257ee780b6ca2a6b39037898ad60cf35df7891719c916b3&o=&hp=1',28),(139,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/324747920.jpg?k=b8bc3d562892382eb5091fe6a412ec0094d93315f32a5292616aec2081f2d65f&o=&hp=1',28),(140,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/322893468.jpg?k=ca011f1b375e6a45a447864015c83d036a5a2447017ac5202d63be2c6c522166&o=&hp=1',28),(141,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/324581656.jpg?k=a90084b3aec6b5ebc6a89913d1c19a0e11a9f1a111e91347d3499a28e27b00f2&o=&hp=1',29),(142,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/324594762.jpg?k=fd0f27cc04ca7282d57d5ffa44675fbab46837981bb8f9a4ee7639ffdc92400f&o=&hp=1',29),(143,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/324601795.jpg?k=3a28d3d6ee32737ac6289170ad3dbe770af289df399f9de5c10e1dcc41a36dc1&o=&hp=1',29),(144,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/331102618.jpg?k=3df13d2b33a537dc9e895463d76970484713b2fe2afd1f87e87f56dfb8f89985&o=&hp=1',29),(145,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/331102610.jpg?k=8f42804ab53726d6d15c4bf71b42198c760e48acf06ef55e0b26be13ad71a5bb&o=&hp=1',29),(146,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/169927531.jpg?k=27a200829b6208f00010a6b7916c9b828eec1bac898947a07a536e20cac6992e&o=&hp=1',30),(147,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/352233688.jpg?k=ceb49c9969e49bb55a888fb71cf044296b36825d9116318babf21d9e5f6a5160&o=&hp=1',30),(148,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/352235618.jpg?k=57b585ba5283f1030fb9bace63c12257a2de84088b6ed7cc8b000b43ba2f5779&o=&hp=1',30),(149,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/200694679.jpg?k=6ea37c40fbc977c6bcb3bb48b84cedc82c1fe2f23b5c9a080cf3f310988c2e07&o=&hp=1',30),(150,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/167138864.jpg?k=05747715715dc78b5f3069cfb457eed503a1de69907478d9b291e80e683978d3&o=&hp=1',30),(151,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/344403400.jpg?k=7b916a4e63e9b0756de73d005befa776990d1bbe674ab2aa8ef34729110b2ba4&o=&hp=1',31),(152,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/344404603.jpg?k=8f33e268418c0d5399d7fb0417131d921ba60bd65cfc8928f35223e6415fc0e9&o=&hp=1',31),(153,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/344392557.jpg?k=a5961f3982bef524da4790b874c3a1072259e7292c176ca5a2f0407d44f345df&o=&hp=1',31),(154,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/344403409.jpg?k=8733c31ddadcaa22aec1cffa7c3de4ef35c7d824fdec8e5db9abd9da627000a8&o=&hp=1',31),(155,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/344403411.jpg?k=950fae05f8439554ccfdbf71d3cd15b07f404d22e07a2be35e115af2ada456ea&o=&hp=1',31),(156,'principal','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/335987727.jpg?k=ff98973c73771384f41682fb6d9928d5cb695544fc0aac21c95485129a5a1579&o=&hp=1',32),(157,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/335988441.jpg?k=3376e03b75609e957620758cc3e1926bc5053e250465829bfd8d8f784c7c3b22&o=&hp=1',32),(158,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/335988110.jpg?k=1570d035321a98f3f4a36dba8e15550f2b0ed8df0b4c5e2165c303419b76caa0&o=&hp=1',32),(159,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/335987925.jpg?k=f381d7b8c1c41d0035aaabc4b56b7d6cc70d4cbeeff1f774925547923744a879&o=&hp=1',32),(160,'secundaria','https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/335987900.jpg?k=48cc7a793dc565c9097c70c8facdb7e600147ac033a10c9679cb7f85b5d04bb9&o=&hp=1',32);
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pais_nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Argentina'),(2,'Colombia');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(2000) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `categoria_id` int NOT NULL,
  `caracteristica_id` int DEFAULT NULL,
  `ciudad_id` bigint NOT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `latitud` varchar(255) DEFAULT NULL,
  `longitud` varchar(255) DEFAULT NULL,
  `puntuacion_promedio` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2fwq10nwymfv7fumctxt9vpgb` (`categoria_id`),
  KEY `FK1wvagduxnk7xmddxvdump1s3l` (`caracteristica_id`),
  KEY `FK2n66ase94bg4q6j56jdm4nj17` (`ciudad_id`),
  CONSTRAINT `FK1wvagduxnk7xmddxvdump1s3l` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristicas` (`id`),
  CONSTRAINT `FK2fwq10nwymfv7fumctxt9vpgb` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `FK2n66ase94bg4q6j56jdm4nj17` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Alójate en el corazón de Córdoba','El Hermitage Hotel cuenta con un impresionante club exclusivo para huéspedes, 6 restaurantes y bares conceptuales, incluido un salón en la azotea, spa con piscina, gimnasio, clínica de superalimentación y salón de belleza. El hotel dispone de 350 habitaciones y suites de lujo, incluyendo una suite en el ático con vistas panorámicas. Todas las habitaciones incluyen mesa, TV de pantalla plana y baño privado. Se ofrece acceso exclusivo al The Residence, un club solo para huéspedes. El establecimiento alberga el The Drawing Room. The Y Bar ofrece un ambiente agradable, donde los huéspedes pueden trabajar durante el día y socializar y tomar cócteles y aperitivos ligeros por la noche. Los huéspedes también pueden seguir un pasadizo secreto hasta The Whisky Room. Además, se sirven aperitivos, refrescos, té y café gratuitos durante todo el día. La decoración interior del hotel es obra de Yabu Pushelberg. El Hermitage Hotel alberga diversos espacios para eventos, como un salón de baile de última generación con capacidad para hasta 850 personas, 2 salas privadas de proyección, una sala de eventos elegante y 7 espacios de reuniones. ','Hermitage Hotel',1,1,1,'Av. Colón 1643','-38.0078679','-57.5423632',3),(2,'Alojamiento de 4 estrellas','El Hotel Solarium está situado en Córdoba, a 200 metros de la playa Mansa, Ofrece alojamiento de 4 estrellas con restaurante, centro de fitness y bar. Está a menos de 1 km del centro comercial Punta Shopping, a 2,3 km de la feria de artesanía y a 2,9 km del puerto. Cuenta con terraza y bañera de hidromasaje.','Solarium H.',1,1,1,'Av. Colón 1643','-38.0078679','-57.5423632',3),(3,'Moderno hostel boutique','Esta propiedad está a 1 minuto de distancia de la playa. Piponeta Suites - Hostel Boutique está situado en el centro de Punta del Este y ofrece alojamiento económico y cómodo con conexión wifi gratis. El hostel cuenta con un animado bar donde los huéspedes pueden relajarse y disfrutar de una copa','Piponeta Hostel',2,1,2,'Av. Colón 1643','-38.0078679','-57.5423632',3),(4,'A solo 100 metros del río','El Planet Hostel se encuentra a solo 100 metros del rio y ofrece alojamiento económico. También proporciona conexión wifi gratis en las zonas comunes y dispone de cocina compartida.','Planet Hostel Premium',2,1,2,'Av. Colón 1643','-38.0078679','-57.5423632',3),(5,'Departamento a metros del centro','Este departamento cuenta con 2 dormitorios, cocina con lavavajillas y microondas, TV de pantalla plana, zona de estar y 3 baños con bidet. Se proporcionan toallas y ropa de cama. A metros del centro. El departamento cuenta con parque infantil y terraza.','Meletios IV',3,1,3,'Av. Colón 1643','-38.0078679','-57.5423632',3),(6,'Alojamiento con vistas a la montaña','El Aloha Luxury Apartment se encuentra en Córdoba, a 1,5 km de la plaza España y a 1,6 km de la Manzana Jesuítica, y ofrece alojamiento con wifi gratis, aire acondicionado, zona de parrilla y terraza. El alojamiento ofrece vistas a la montaña y se encuentra a 1,9 km del centro comercial Patio Olmos y a 2,3 km de la catedral de Córdoba.','Aloha Luxury',3,1,3,'Av. Colón 1643','-38.0078679','-57.5423632',3),(7,'Visita Salta en familia','La Casa Tatu ofrece habitaciones familiares y zona de parrilla. El alojamiento se encuentra a 3,4 km del parque de El Rosedal y a 4 km del Shopping.','Casa Tatu',4,1,4,'Av. Colón 1643','-38.0078679','-57.5423632',3),(8,'Alójate en el corazón de Salta','El Departamento a estrenar, Palermo Hollywood VII ofrece alojamiento en Buenos Aires, a 1,6 km de los lagos de Palermo y a 1,7 km del parque El Rosedal. Los alojamientos disponen de terraza, aire acondicionado, TV de pantalla plana y baño privado con bidet y secador de pelo. Hay heladera y hervidor de agua. Cerca del bed and breakfast hay varios lugares de interés, como la plaza Serrano, los Bosques de Palermo y el parque ecológico de Buenos Aires.','Palermo Hollywood VII',4,1,4,'Av. Colón 1643','-38.0078679','-57.5423632',3),(9,'Alójate en el corazón de Córdoba','El 531 Hostel ofrece alojamiento económico con wifi gratis en el centro de Córdoba. El alojamiento se sitúa a 150 metros de la plaza San Martín, a 100 metros del mercado central y a 450 metros de la terminal de autobuses.Las habitaciones del 531 Hostel son cómodas y luminosas. Todas disponen de ventilador, calefacción y baño compartido.','531 Hostel',2,1,1,'Av. Colón 1643','-38.0078679','-57.5423632-57.5423632',3),(10,'Alójate en el corazón de Córdoba','El Selina Nueva Cordoba se encuentra en Córdoba, a menos de 1 km de la Manzana Jesuítica, y ofrece alojamiento con aire acondicionado y bar. También cuenta con restaurante, salón compartido y wifi gratis. El hotel cuenta con una pileta al aire libre, entretenimiento nocturno y un mostrador de información turística.','Selina Nueva Cordoba',2,1,1,'Av. Colón 1643','-38.0078679','-57.5423632',3),(11,'Alójate en el corazón de Córdoba','El Departamentos Lugar se encuentra en el barrio de Nueva Córdoba, en Córdoba, a solo 250 metros de la zona comercial Paseo del Buen Pastor, y ofrece departamentos independientes con wifi gratis y TV de plasma. El alojamiento está situado a 500 metros del centro histórico y a 800 metros de la plaza San Martín.','Departamentos Lugar',3,1,1,'Av. Colón 1643','-38.0078679','-57.5423632',3),(12,'Alójate en el corazón de Córdoba','El Departamento Obispo Trejo IV se encuentra en Córdoba, a 500 metros de la Manzana Jesuítica y a 800 metros del centro comercial Patio Olmos, y ofrece alojamiento con aire acondicionado, balcón y wifi gratis. El departamento dispone de estacionamiento privado y está a 1 km de la plaza de España.','Apartamento Obispo Trejo IV',3,1,1,'Av. Colón 1643','-38.0078679','-57.5423632',3),(13,'Alójate en el corazón de Córdoba','La Casa Basilico  ofrece servicio de conserjería, habitaciones para no fumadores, bar, wifi gratis en todas las instalaciones y salón compartido. Además, tiene habitaciones familiares y zona de parrilla. Hay recepción 24 horas, cocina compartida y servicio de cambio de divisa. Los alojamientos disponen de aire acondicionado y armario. En la Casa Basilico se sirve un desayuno continental diario.','Casa Basilico',4,1,1,'Av. Colón 1643','-38.0078679','-57.5423632',3),(14,'Alójate en el corazón de Córdoba','Las habitaciones incluyen hervidor de agua. Las habitaciones de la Casa Sumaq tienen baño privado y vistas a la ciudad. Se proporciona ropa de cama.','Casa Sumaq',4,1,1,'Av. Colón 1643','-38.0078679','-57.5423632',3),(15,'Alójate en el corazón de Buenos Aires','El Up Congreso Hotel ofrece habitaciones con aire acondicionado en el centro de Buenos Aires, a 700 metros del Palacio Barolo. Este hotel de 3 estrellas cuenta con mostrador de información turística y servicio de venta de entradas. El alojamiento ofrece recepción 24 horas, servicio de link con el aeropuerto, servicio de conserjería y conexión wifi gratis en todo el alojamiento.','Up Congreso Hotel',1,1,2,'Av. Colón 1643','-38.0078679','-57.5423632',3),(16,'Alójate en el corazón de Buenos Aires','El Up Hotel Recoleta está situado en la ciudad de Buenos Aires, a 100 metros de la avenida Libertador. Ofrece conexión de wifi gratis y mostrador de información turística. Los bares, restaurantes y el cementerio de la Recoleta están cerca. Las 38 habitaciones del Up. Hotel Recoleta cuentan con baño privado, TV por cable, aire acondicionado y room service.','Up Recoleta Hotel',1,1,2,'Av. Colón 1643','-38.0078679','-57.5423632',3),(17,'Alójate en el corazón de Buenos Aires','El Sucre Suites ofrece alojamiento con aire acondicionado en Buenos Aires, a 2,8 km del hipódromo. El establecimiento se encuentra a 3,4 km de la plaza Italia. Hay WiFi gratuita. Todos los alojamientos están equipados con TV vía satélite de pantalla plana. Algunos cuentan con zona de comedor y/o balcón. Hay cocina equipada con horno y heladera. Los alojamientos incluyen baño privado con artículos de aseo gratuitos y toallas. El Sucre Suites también cuenta con terraza.','Sucre Suites',3,1,2,'Av. Colón 1643','-38.0078679','-57.5423632',3),(18,'Alójate en el corazón de Buenos Aires','El Bonjour My Vera se encuentra en Buenos Aires, a 1,7 km de la plaza Serrano y a 3,6 km de Bosques de Palermo, y ofrece alojamiento con wifi gratis, aire acondicionado, centro de fitness y salón compartido. El alojamiento fue construido en 2017 y ofrece alojamiento con balcón. El departamento tiene 1 dormitorio, TV de pantalla plana por cable, lavarropas, baño con bidet y cocina equipada con microondas y heladera. Se proporcionan toallas y ropa de cama. El departamento tiene solárium. El Bonjour My Vera alberga un parque infantil y un jardín.','Bonjour My Vera',3,1,2,'Av. Colón 1643','-38.0078679','-57.5423632',3),(19,'Alójate en el corazón de Buenos Aires','El ChillHouse ofrece alojamiento en Buenos Aires, a 300 metros de la avenida Corrientes. Hay wifi gratis en todas las instalaciones. El alojamiento cuenta con mesa de ping pong. El cementerio de la Recoleta y la plaza Serrano están a 2 km del ChillHouse. El aeroparque Jorge Newbery, el aeropuerto más cercano, está a 5 km.','ChillHouse',4,1,2,'Av. Colón 1643','-38.0078679','-57.5423632',3),(20,'Alójate en el corazón de Buenos Aires','La Casa de Bulnes proporciona WiFi gratuita en todas las instalaciones y ofrece alojamiento en Buenos Aires. Las habitaciones tienen baño privado. También hay TV. El establecimiento cuenta con cocina compartida. El establecimiento cuenta con mesa de ping pong. La Casa de Bulnes se encuentra a 1,5 km de la plaza Serrano y a 1,8 km de la plaza Italia. El aeroparque Jorge Newbery, el aeropuerto más cercano, está a 5 km','La Casa de Bulnes',4,1,2,'Av. Colón 1643','-38.0078679','-57.5423632',3),(21,'Alójate en el corazón de Mendoza','El Sheraton es un hotel nuevo de 5 estrellas situado a pocos pasos de la Avenida San Martín. Ofrece un restaurante con vistas de 360 grados al centro de Mendoza y la cordillera de Los Andes. También cuenta con pileta cubierta y wifi gratis. Las habitaciones del Sheraton son amplias y presentan un estilo moderno y elegante. Todas ellas tienen vistas a la ciudad e incluyen zona de estar y TV LCD con canales por cable. El Sheraton Mendoza Hotel alberga el restaurante más alto de la ciudad de Mendoza, que prepara cocina internacional de calidad. Todas las mañanas se sirve un desayuno, por un adicional.','Sheraton Mendoza Hotel',1,1,3,'Av. Colón 1643','-38.0078679','-57.5423632',3),(22,'Alójate en el corazón de Mendoza','El Park Hyatt Mendoza Hotel, Casino & Spa, situado en un impresionante edificio frente a la Plaza Independencia, ofrece alojamiento de lujo en el centro de Mendoza. El alojamiento alberga spa, centro de fitness, casino, pileta y varios restaurantes. Las habitaciones del Park Hyatt Mendoza son amplias y luminosas y presentan una decoración de estilo contemporáneo. Además, todas incluyen TV por cable, reproductor de DVD y escritorio. Algunas disponen de zona de estar. Todos los días se sirve un desayuno buffet. Para las comidas, los huéspedes pueden disfrutar del restaurante asador argentino o del Bistro M, que ofrece platos internacionales. Las instalaciones del spa incluyen bañera de hidromasaje, sauna y baño de vapor. Además, los huéspedes pueden hacer uso del centro de fitness, la pileta y el casino. También hay un servicio de masajes a pedido.','Park Hyatt Mendoza Hotel',1,1,3,'Av. Colón 1643','-38.0078679','-57.5423632',3),(23,'Alójate en el corazón de Mendoza','El HOSTEL PASO se encuentra en el centro de Mendoza y ofrece habitaciones con aire acondicionado, salón compartido, wifi gratis y jardín. El alojamiento está cerca de lugares de interés como la clínica Zaldívar, el paseo Alameda y el parque OHiggings. Además, tiene vistas al jardín.Las habitaciones incluyen armario. Las habitaciones del HOSTEL PASO están equipadas con baño privado y ropa de cama.','Hostel Boutique PASO',2,1,3,'Av. Colón 1643','-38.0078679','-57.5423632',3),(24,'Alójate en el corazón de Mendoza','El Mora International Hostel ofrece habitaciones con conexión de wifi gratis en el centro de Mendoza, a solo 200 metros de la avenida San Martín. Dispone de cocina común y jardín con zona de parrilla. La plaza principal está a 200 metros. Las habitaciones del Mora International Hostel son muy luminosas y cuentan con suelo de parqué y ventanas grandes. Todas disponen de calefacción y baño compartido. Todos los días se sirve un desayuno buffet que incluye cereales, cruasanes y jugo de naranja. Los huéspedes pueden preparar sus propias comidas en la cocina compartida o en la parrilla del jardín.','Mora International Hostel',2,1,3,'Av. Colón 1643','-38.0078679','-57.5423632',3),(25,'Alójate en el corazón de Mendoza','El 816 B&B está situado en una zona residencial del centro de Mendoza, que cuenta con una gran variedad de restaurantes y bares. El parque San Martín y la terminal de micros y taxis Metrotranvía se encuentran a escasos metros. El alojamiento dispone de aire acondicionado en todas sus dependencias y ofrece conexión Wi-Fi y estacionamiento gratuitos. Las habitaciones del 816 B&B presentan muebles elegantes y suelo de parqué e incluyen calefacción y baño privado. Algunas disponen de bañera de hidromasaje, mientras que todas cuentan con ropa de cama y toallas.','816 B&B',4,1,3,'Av. Colón 1643','-38.0078679','-57.5423632',3),(26,'Alójate en el corazón de Mendoza','Ubicado en Mendoza y con El Rafa House está a menos de 1 km del Museo del Pasado Cuyano y ofrece registros de entrada y salida exprés, habitaciones hipoalergénicas, restaurante, wifi gratis en todas las instalaciones y terraza. Esta posada ofrece guardaesquíes y se encuentra a 1,1 km de la plaza de la Independencia y a 1,3 km del paseo Alameda. El alojamiento cuenta con cocina compartida, mostrador de información turística y servicio de cambio de divisa. Las habitaciones de la posada están equipadas con cafetera. Las habitaciones disponen de baño compartido con ducha. Algunas habitaciones también tienen patio y otras ofrecen vistas al jardín. Todas las habitaciones incluyen ropa de cama.','Rafa House',4,1,3,'Av. Colón 1643','-38.0078679','-57.5423632',3),(27,'Alójate en el corazón de Salta','El Sheraton Salta, que goza de vistas panorámicas al valle de Lerma, está situado en el distrito de Monumento, a 10 calles del centro. Ofrece habitaciones amplias, pileta climatizada y restaurante. Los alojamientos del Sheraton Salta Hotel están equipados con TV por cable, conexión a internet de alta velocidad y minibar. También incluyen reproductor de CD y tabla de planchar. El alojamiento tiene centro de fitness abierto las 24 horas, sauna y bañera de hidromasaje al aire libre a disposición de los huéspedes. En el spa también hay servicio de masajes y un baño escocés. En el Terracota, el restaurante del hotel, ofrece platos italianos y vistas a la ciudad. Además, el Sheraton Salta alberga un bar en el vestíbulo y la cafetería 330 Coffee Shop, que sirve cocina internacional. Se proporciona un servicio de alquiler de autos.','Sheraton Salta Hotel',1,1,4,'Av. Colón 1643','-38.0078679','-57.5423632',3),(28,'Alójate en el corazón de Salta','El Rincon del Cerro se encuentra en Salta, a 12 km de la feria de Güemes, y ofrece alojamiento con restaurante, estacionamiento privado gratuito, pileta al aire libre y centro de fitness. El alojamiento cuenta con bar, salón compartido y jardín. Hay recepción 24 horas y mostrador de información turística. Las habitaciones incluyen armario, TV de pantalla plana y baño privado. El Rincon del Cerro sirve un desayuno buffet o americano. El alojamiento alberga un spa con sauna y bañera de hidromasaje. El Rincon del Cerro se encuentra a 12 km del estadio El Gigante del Norte y del ayuntamiento de Salta. El aeropuerto más cercano es el aeropuerto internacional Martín Miguel de Güemes, a 17 km del hotel.','Rincon del Cerro',1,1,4,'Av. Colón 1643','-38.0078679','-57.5423632',3),(29,'Alójate en el corazón de Salta','El Hostel Gallery se encuentra en Salta y ofrece vistas a la pileta y jardín. Todos los alojamientos disponen de baño privado con bidet, aire acondicionado, TV de pantalla plana y microondas. Hay heladera y hervidor de agua. El hostel se encuentra a 5 km del centro de convenciones de Salta y a 7 km del estadio Padre Ernesto Martearena. El aeropuerto internacional Martín Miguel de Güemes está a 4 km.','Hostel Gallery',2,1,4,'Av. Colón 1643','-38.0078679','-57.5423632',3),(30,'Alójate en el corazón de Salta','El Hostal del Milagro ofrece alojamiento con terraza en Salta, a 1,6 km del teleférico de Salta-San Bernardo. La propiedad está a unos 2,2 km del estadio Padre Ernesto Martearena y 2,2 km del Parque 9 de Julio. Se encuentra a 2,3 km del centro comercial El Palacio Galerías. Todas las habitaciones de este hotel económico están equipadas con armario y TV. Las habitaciones del Hostal del Milagro tienen baño privado y vistas a la ciudad. En la recepción se proporciona información sobre la zona.','Hostel del Milagro',2,1,4,'Av. Colón 1643','-38.0078679','-57.5423632',3),(31,'Alójate en el corazón de Salta','El alojamiento se encuentra en San Lorenzo, a 11 km de Salta. El Apart La Nona ofrece jardín y wifi gratis. Los alojamientos cuentan con suelo de baldosa, cocina totalmente equipada con microondas, zona de comedor, TV de pantalla plana vía satélite y baño privado con bidet y secador de pelo. También incluyen heladera, horno, minibar y hervidor de agua. El departamento tiene solárium. El Apart La Nona se encuentra a 46 km de El Carmen y a 27 km de Rosario de Lerma. El aeropuerto internacional Martín Miguel de Güemes, el más cercano, está a 12 km. Se proporciona servicio de link con el aeropuerto por un adicional.','Apart La Nona',3,1,4,'Av. Colón 1643','-38.0078679','-57.5423632',3),(32,'Alójate en el corazón de Salta','Las Cabañas Tierras del Norte - Diques y Cornisa se encuentran en La Calderilla, a 22 km del centro de Salta, y disponen de pileta exterior de temporada y parque infantil. Se proporciona estacionamiento privado gratuito. Los alojamientos cuentan con zona de comedor, zona de estar con TV de pantalla plana y cocina con horno, microondas, heladera y hervidor de agua. El baño es privado e incluye bañera o ducha, bidet y artículos de aseo gratuitos. Se facilita la ropa de cama. Las Cabañas Tierras del Norte también tienen solárium. La Caldera se encuentra a 4 km de las Cabañas Tierras del Norte - Diques y Cornisa. El aeropuerto internacional Martín Miguel de Güemes es el más cercano, ubicado a 22 km de las Cabañas Tierras del Norte - Diques y Cornisa','Tierras del Norte',3,1,4,'Av. Colón 1643','-38.0078679','-57.5423632',3);
update `productos` set `domicilio`= 'JVA, Av. Colón 1643, B7600 Mar del Plata',`latitud`='-38.007860602582596',`longitud`='-57.54017534234541' where `id`=1;
update `productos` set `domicilio`= 'JVA, Av. Colón 1643, B7600 Mar del Plata',`latitud`='-38.007860602582596',`longitud`='-57.54017534234541' where `id`=2;
update `productos` set `domicilio`= 'Mariscal Antonio José de Sucre 1575',`latitud`='-34.559017872306306',`longitud`='-58.44706108852583' where `id`=3;
update `productos` set `domicilio`= 'José León Pagano 2684, C1425 CABA',`latitud`='-34.58386987657681',`longitud`='-58.39983165648943'where `id`=4;
update `productos` set `domicilio`= '25 de Mayo 1591, X5004 FWS',`latitud`='-31.413752839172783',`longitud`='-64.16224412004914' where `id`=5;
update `productos` set `domicilio`= '25 de Mayo 1591, X5004 FWS',`latitud`='-31.413752839172783',`longitud`='-64.16224412004914' where `id`=6;
update `productos` set `domicilio`= 'Paraguay 5500, C1425 CABA',`latitud`='-34.57729753830746',`longitud`='-58.43405666495257' where `id`=7;
update `productos` set `domicilio`= 'Paraguay 5500, C1425 CABA',`latitud`='-34.57729753830746',`longitud`='-58.43405666495257' where `id`=8;
update `productos` set `domicilio`= 'Buenos Aires 246, X5000AAF ',`latitud`='-31.41913783846336',`longitud`='-64.18396387765019' where `id`=9;
update `productos` set `domicilio`= 'San Lorenzo 163, X5000',`latitud`='-31.423607613198733',`longitud`=' -64.18495709135831' where `id`=10;
update `productos` set `domicilio`= 'Av. Vélez Sarsfield 817, X5000 JJI',`latitud`='-31.42493252478458',`longitud`='-64.19066393980393' where `id`=11;
update `productos` set `domicilio`= 'Av. Vélez Sarsfield 817, X5000 JJI',`latitud`='-31.42493252478458',`longitud`='-64.19066393980393' where `id`=12;
update `productos` set `domicilio`= 'José A. Cabrera 3653, C1186 CABA',`latitud`='-34.59645941490245',`longitud`='-58.41780494370337' where `id`=13;
update `productos` set `domicilio`= 'José A. Cabrera 3653, C1186 CABA',`latitud`='-34.59645941490245',`longitud`='-58.41780494370337' where `id`=14;
update `productos` set `domicilio`= 'Montevideo 86, C1019 CABA',`latitud`='-34.608073077848196',`longitud`='-58.38931875270761' where `id`=15;
update `productos` set `domicilio`= 'José León Pagano 2684, C1425 CABA',`latitud`='-34.58386987657681',`longitud`='-58.39983165648943' where `id`=16;
update `productos` set `domicilio`= 'Mariscal Antonio José de Sucre 1575',`latitud`='-34.559017872306306',`longitud`='-58.44706108852583' where `id`=17;
update `productos` set `domicilio`= 'Vera 847, 1°Piso, Dto. 03, Villa Crespo, 1414',`latitud`='-34.595890336943924',`longitud`='-58.44049107997654' where `id`=18;
update `productos` set `domicilio`= 'Agüero 781, C1186 CABA',`latitud`='-34.60080494048691',`longitud`='-58.41083877738114' where `id`=19;
update `productos` set `domicilio`= 'Bulnes 1240, C1425DKH C1425DKH, Bulnes ',`latitud`='-34.597218047609196',`longitud`='-58.41727447401324' where `id`=20;
update `productos` set `domicilio`= 'Primitivo de la Reta 989, M5500',`latitud`='-32.892197662350284',`longitud`='-68.83799975399889' where `id`=21;
update `productos` set `domicilio`= 'Chile 1124, M5500',`latitud`='-32.88907601536962',`longitud`='-68.84588734553695' where `id`=22;
update `productos` set `domicilio`= 'Paso de los Andes 925, M5500',`latitud`='-32.88897852252339',`longitud`='-68.85882533804552' where `id`=23;
update `productos` set `domicilio`= 'Mora International Hostel',`latitud`='-32.89235263138872',`longitud`='-68.83699834209735' where `id`=24;
update `productos` set `domicilio`= 'Olascoaga 816, M5500',`latitud`='-32.89092305730716',`longitud`='-68.85451222075653' where `id`=25;
update `productos` set `domicilio`= 'Buenos Aires 273 segundo piso, M5500 GEP',`latitud`='-32.88764829819305',`longitud`='-68.83463321424432' where `id`=26;
update `productos` set `domicilio`= 'Coronel Francisco De, Uriondo 330, A4406BKQ',`latitud`='-24.785351325830614',`longitud`='-65.39821231935309' where `id`=27;
update `productos` set `domicilio`= 'Julio Castellano S/N, 4400',`latitud`='-24.70029233991341',`longitud`='-65.48018770042562' where `id`=28;
update `productos` set `domicilio`= 'Av. Independencia 1001, A4400 Salta, Argentina',`latitud`='-24.80800725520593',`longitud`='-65.40269465327623' where `id`=29;
update `productos` set `domicilio`= 'Av. Independencia 1001, A4400 Salta, Argentina',`latitud`='-24.80800725520593',`longitud`='-65.40269465327623' where `id`=30;
update `productos` set `domicilio`= 'Federico Saravia Toledo 242, A4401 San Lorenzo',`latitud`='-24.750749060537785',`longitud`='-65.48363930275971' where `id`=31;
update `productos` set `domicilio`= 'Km 1621, RN9, A4401 La Calderilla',`latitud`='-24.618872580747748',`longitud`='-65.37964382791402' where `id`=32;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntuaciones`
--

DROP TABLE IF EXISTS `puntuaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntuaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `puntuacion` double NOT NULL,
  `producto_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqep6jym4fop6gtxjdux9ioayd` (`producto_id`),
  KEY `FKf3ipc1ss30u5lf6qe5es8gue1` (`usuario_id`),
  CONSTRAINT `FKf3ipc1ss30u5lf6qe5es8gue1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKqep6jym4fop6gtxjdux9ioayd` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntuaciones`
--

LOCK TABLES `puntuaciones` WRITE;
/*!40000 ALTER TABLE `puntuaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntuaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hora_comienzo` time NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `producto_id` int NOT NULL,
  `usuarios_id` int NOT NULL,
  `apellido_reserva` varchar(255) DEFAULT NULL,
  `comentarios` varchar(255) DEFAULT NULL,
  `email_reserva` varchar(255) DEFAULT NULL,
  `nombre_reserva` varchar(255) DEFAULT NULL,
  `telefono_reserva` varchar(255) DEFAULT NULL,
  `vacunacion` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`producto_id`,`usuarios_id`),
  KEY `fk_reservas_productos1_idx` (`producto_id`),
  KEY `fk_reservas_usuarios1_idx` (`usuarios_id`),
  CONSTRAINT `fk_reservas_productos1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `fk_reservas_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'11:00:00','2022-07-15','2022-08-01',1,1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'11:00:00','2022-07-15','2022-08-01',2,2,NULL,NULL,NULL,NULL,NULL,NULL),(3,'11:00:00','2022-07-15','2022-08-01',3,1,NULL,NULL,NULL,NULL,NULL,NULL),(4,'11:00:00','2022-07-15','2022-08-01',4,2,NULL,NULL,NULL,NULL,NULL,NULL),(5,'11:00:00','2022-07-15','2022-08-01',5,1,NULL,NULL,NULL,NULL,NULL,NULL),(6,'11:00:00','2022-07-15','2022-08-01',6,2,NULL,NULL,NULL,NULL,NULL,NULL),(7,'11:00:00','2022-07-15','2022-08-01',7,1,NULL,NULL,NULL,NULL,NULL,NULL),(8,'11:00:00','2022-07-15','2022-08-01',8,2,NULL,NULL,NULL,NULL,NULL,NULL),(9,'11:00:00','2022-07-15','2022-08-01',9,1,NULL,NULL,NULL,NULL,NULL,NULL),(10,'11:00:00','2022-07-15','2022-08-01',10,2,NULL,NULL,NULL,NULL,NULL,NULL),(11,'11:00:00','2022-08-10','2022-08-20',11,1,NULL,NULL,NULL,NULL,NULL,NULL),(12,'11:00:00','2022-08-10','2022-08-20',12,2,NULL,NULL,NULL,NULL,NULL,NULL),(13,'11:00:00','2022-08-10','2022-08-20',13,1,NULL,NULL,NULL,NULL,NULL,NULL),(14,'11:00:00','2022-08-10','2022-08-20',14,2,NULL,NULL,NULL,NULL,NULL,NULL),(15,'11:00:00','2022-08-10','2022-08-20',15,1,NULL,NULL,NULL,NULL,NULL,NULL),(16,'11:00:00','2022-08-10','2022-08-20',16,2,NULL,NULL,NULL,NULL,NULL,NULL),(17,'11:00:00','2022-08-10','2022-08-20',17,1,NULL,NULL,NULL,NULL,NULL,NULL),(18,'11:00:00','2022-08-10','2022-08-20',18,2,NULL,NULL,NULL,NULL,NULL,NULL),(19,'11:00:00','2022-09-01','2022-10-01',1,1,NULL,NULL,NULL,NULL,NULL,NULL),(20,'11:00:00','2022-10-01','2022-11-01',1,2,NULL,NULL,NULL,NULL,NULL,NULL),(21,'19:00:00','2022-12-03','2022-12-05',1,1,'Pérez',NULL,'sergio.perez@gmail.com','Sergio','+541169611987',NULL),(22,'19:00:00','2022-12-04','2022-12-05',4,1,'Pérez',NULL,'sergio@gmail.com','Rocio','+541169611987',NULL),(23,'14:00:00','2022-07-01','2022-07-22',22,5,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `contrasenia` varchar(300) DEFAULT NULL,
  `roles_id` int NOT NULL,
  `verificacion` bit(1) DEFAULT NULL,
  `codigo_verificacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`roles_id`),
  KEY `fk_usuarios_roles1_idx` (`roles_id`),
  CONSTRAINT `fk_usuarios_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Sergio','Pérez','sergio.perez@gmail.com','+541169611987','$2a$10$sGuoDOFKq12CkSaNAZP9r.mRAxa7qiaIYixa7pZ0agYG4YGE.c1lW',1,_binary '\0',NULL),(2,'Lionel','Messi','lionel.messi@gmail.com','+541169611987','$2a$10$qWqrpluxwafauAL5GupN5.3BQU93VpuwUBAWAIbAa2AOwqS9YNTJy',2,_binary '\0',NULL),(4,'Rocio','Bottinelli','prueba@gmail.com','Santa Fe','$2a$10$3.0UkznAnau7xnWxfUqgPul7WnTz09FQE76JLxjSyIIxNj3bTMoeu',2,NULL,NULL),(5,'Rocio','Bottinelli','rociobottinelli@gmail.com','Santa Fe','$2a$10$QY2a3nnRt3Le3XzxADuRa.jMU1ZtV393n8B5gl9Q4wv5P4GACtDe6',2,NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'digitalbooking'
--

--
-- Dumping routines for database 'digitalbooking'
--
/*!50003 DROP PROCEDURE IF EXISTS `findAllProductByScore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `findAllProductByScore`()
BEGIN
UPDATE productos prod INNER JOIN puntuaciones punt ON prod.id = punt.producto_id
SET prod.puntuacion_promedio = (SELECT round(avg(punt.puntuacion),2)*2 FROM puntuaciones punt where prod.id = punt.producto_id );
SELECT * FROM productos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findByCityAndBetweenDates_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `findByCityAndBetweenDates_procedure`(in ciudadName varchar(255), in fechaInicio date, in fechaFin date)
BEGIN
SELECT * from productos p join ciudades c where p.ciudad_id = c.id AND c.ciudad_nombre = ciudadName AND p.id not in 
(SELECT prod.id FROM productos prod JOIN reservas r ON r.producto_id = prod.id where
(r.fecha_inicio <= fechaInicio AND fechaInicio <= r.fecha_fin)
OR (r.fecha_inicio <= fechaFin AND fechaFin <= r.fecha_fin)
OR (fechaInicio <= r.fecha_inicio AND r.fecha_inicio <= fechaFin)
OR (fechaInicio <= r.fecha_fin AND r.fecha_fin <= fechaFin));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-22 12:29:08
