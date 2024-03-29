-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: bar_lso
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `acquisto`
--

DROP TABLE IF EXISTS `acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquisto` (
  `utente_email` varchar(50) NOT NULL,
  `bevanda_id` int NOT NULL,
  KEY `fk_acquisto_1_idx` (`utente_email`),
  KEY `fk_acquisto_2_idx` (`bevanda_id`),
  CONSTRAINT `fk_acquisto_1` FOREIGN KEY (`utente_email`) REFERENCES `utente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_acquisto_2` FOREIGN KEY (`bevanda_id`) REFERENCES `bevanda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquisto`
--

LOCK TABLES `acquisto` WRITE;
/*!40000 ALTER TABLE `acquisto` DISABLE KEYS */;
INSERT INTO `acquisto` VALUES ('gi.addati',1),('gi.addati',2),('gi.addati',2),('gi.addati',3),('gi.addati',3),('gi.addati',4),('gi.addati',4),('gi.addati',4),('gi.addati',4),('gi.addati',5),('gi.addati',5),('gi.addati',6),('gi.addati',7),('gi.addati',7),('gi.addati',8),('gi.addati',8),('gi.addati',8),('gi.addati',8),('gi.addati',8),('gi.addati',9),('gi.addati',9),('gi.addati',9),('gi.addati',9);
/*!40000 ALTER TABLE `acquisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bevanda`
--

DROP TABLE IF EXISTS `bevanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bevanda` (
  `id` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `prezzo` float NOT NULL,
  `tipo` enum('cocktail','frullato') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bevanda`
--

LOCK TABLES `bevanda` WRITE;
/*!40000 ALTER TABLE `bevanda` DISABLE KEYS */;
INSERT INTO `bevanda` VALUES (1,'gin tonic',6,'cocktail'),(2,'frullato misto',7,'frullato'),(3,'negroni',8,'cocktail'),(4,'old fashioned',8,'cocktail'),(5,'spritz',6,'cocktail'),(6,'margarita',7,'cocktail'),(7,'mojito',8,'cocktail'),(8,'smoothie al mango',6,'frullato'),(9,'frullato di fragole',6.5,'frullato');
/*!40000 ALTER TABLE `bevanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrello`
--

DROP TABLE IF EXISTS `carrello`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrello` (
  `utente_email` varchar(50) DEFAULT NULL,
  `bevanda_id` int DEFAULT NULL,
  KEY `fk_carrello_1_idx` (`utente_email`),
  KEY `fk_carrello_2_idx` (`bevanda_id`),
  CONSTRAINT `fk_carrello_1` FOREIGN KEY (`utente_email`) REFERENCES `utente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_carrello_2` FOREIGN KEY (`bevanda_id`) REFERENCES `bevanda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrello`
--

LOCK TABLES `carrello` WRITE;
/*!40000 ALTER TABLE `carrello` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrello` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `aggiungi_acquisto_dopo_elimina` AFTER DELETE ON `carrello` FOR EACH ROW INSERT INTO `acquisto` (`utente_email`, `bevanda_id`) VALUES (OLD.`utente_email`, OLD.`bevanda_id`) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contiene`
--

DROP TABLE IF EXISTS `contiene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contiene` (
  `bevanda_id` int NOT NULL,
  `ingrediente_nome` varchar(50) NOT NULL,
  KEY `fk_contiene_1_idx` (`bevanda_id`),
  KEY `fk_contiene_2_idx` (`ingrediente_nome`),
  CONSTRAINT `fk_contiene_1` FOREIGN KEY (`bevanda_id`) REFERENCES `bevanda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_contiene_2` FOREIGN KEY (`ingrediente_nome`) REFERENCES `ingrediente` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contiene`
--

LOCK TABLES `contiene` WRITE;
/*!40000 ALTER TABLE `contiene` DISABLE KEYS */;
INSERT INTO `contiene` VALUES (1,'gin'),(1,'acqua tonica'),(1,'ghiaccio'),(1,'limone'),(3,'gin'),(3,'vermouth rosso'),(3,'campari'),(3,'ghiaccio'),(4,'angostura'),(4,'whisky'),(4,'ghiaccio'),(5,'prosecco'),(5,'Aperol'),(5,'soda'),(5,'ghiaccio'),(2,'ghiaccio'),(2,'latte di cocco'),(2,'yogurt'),(2,'latte'),(2,'limone'),(2,'succo di ananas'),(2,'succo di fragola'),(6,'tequila'),(6,'lime'),(6,'ghiaccio'),(7,'rum bianco'),(7,'lime'),(7,'zucchero di canna'),(7,'menta'),(7,'ghiaccio'),(8,'mango'),(8,'latte di mandorla'),(8,'yogurt'),(8,'ghiaccio'),(9,'succo di fragola'),(9,'latte'),(9,'limone'),(9,'zucchero'),(9,'ghiaccio');
/*!40000 ALTER TABLE `contiene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente` (
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES ('acqua tonica'),('angostura'),('aperol'),('campari'),('ghiaccio'),('gin'),('latte'),('latte di cocco'),('latte di mandorla'),('lime'),('limone'),('mango'),('menta'),('prosecco'),('rum'),('rum bianco'),('soda'),('succo di ananas'),('succo di fragola'),('tequila'),('vermouth rosso'),('vodka'),('whisky'),('yogurt'),('zucchero'),('zucchero di canna');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('gi.addati','ok','Gian Marco','Addati'),('simi.giordano','ok','Simone','Giordano');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-31 12:50:51
