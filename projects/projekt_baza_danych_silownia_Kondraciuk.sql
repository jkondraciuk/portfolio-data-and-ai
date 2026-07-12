-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: silownia4
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `awariesprzetu`
--

DROP TABLE IF EXISTS `awariesprzetu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awariesprzetu` (
  `idAwarii` int(11) NOT NULL AUTO_INCREMENT,
  `opis` varchar(100) NOT NULL,
  `dataAwarii` datetime NOT NULL,
  `dataNaprawy` datetime DEFAULT NULL,
  `idSprzetu` int(11) NOT NULL,
  PRIMARY KEY (`idAwarii`),
  UNIQUE KEY `idKlienta_UNIQUE` (`idAwarii`),
  UNIQUE KEY `email_UNIQUE` (`opis`),
  KEY `fk_AwarieSprzetu_Sprzet1_idx` (`idSprzetu`),
  CONSTRAINT `fk_AwarieSprzetu_Sprzet1` FOREIGN KEY (`idSprzetu`) REFERENCES `sprzet` (`idSprzetu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awariesprzetu`
--

LOCK TABLES `awariesprzetu` WRITE;
/*!40000 ALTER TABLE `awariesprzetu` DISABLE KEYS */;
INSERT INTO `awariesprzetu` VALUES (1,'Uszkodzona taśma bieżni','2025-04-15 08:20:00','2025-04-20 13:30:00',1),(2,'Zablokowany mechanizm ciężarów','2025-03-10 10:45:00','2025-03-15 16:00:00',2),(3,'Pęknięcie ramy','2025-01-05 11:10:00','2025-01-08 09:30:00',3),(4,'Odkręcone śruby oparcia','2025-02-18 17:40:00','2025-02-20 11:00:00',4),(5,'Problem z wyświetlaczem LCD','2025-05-01 08:15:00','2025-05-03 14:45:00',5);
/*!40000 ALTER TABLE `awariesprzetu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karnety`
--

DROP TABLE IF EXISTS `karnety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karnety` (
  `idKarnetu` int(11) NOT NULL AUTO_INCREMENT,
  `idKlienta` int(11) NOT NULL,
  `dataZakupu` datetime NOT NULL,
  `kwota` decimal(8,2) NOT NULL,
  `idTypu` int(11) NOT NULL,
  PRIMARY KEY (`idKarnetu`),
  UNIQUE KEY `idKlienta_UNIQUE` (`idKarnetu`),
  KEY `fk_Karnety_Klienci_idx` (`idKlienta`),
  KEY `fk_Karnety_typyKarnetow1_idx` (`idTypu`),
  CONSTRAINT `fk_Karnety_Klienci` FOREIGN KEY (`idKlienta`) REFERENCES `klienci` (`idKlienta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Karnety_typyKarnetow1` FOREIGN KEY (`idTypu`) REFERENCES `typykarnetow` (`idTypu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karnety`
--

LOCK TABLES `karnety` WRITE;
/*!40000 ALTER TABLE `karnety` DISABLE KEYS */;
INSERT INTO `karnety` VALUES (1,1,'2025-05-01 00:00:00',120.00,1),(2,2,'2025-05-03 00:00:00',150.00,2),(3,3,'2025-05-05 00:00:00',120.00,3),(4,4,'2025-05-10 00:00:00',120.00,4),(5,5,'2025-05-15 00:00:00',150.00,2);
/*!40000 ALTER TABLE `karnety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klienci`
--

DROP TABLE IF EXISTS `klienci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klienci` (
  `idKlienta` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nrTelefonu` varchar(15) NOT NULL,
  `dataUrodzenia` date NOT NULL,
  PRIMARY KEY (`idKlienta`),
  UNIQUE KEY `idKlienta_UNIQUE` (`idKlienta`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nrTelefonu_UNIQUE` (`nrTelefonu`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klienci`
--

LOCK TABLES `klienci` WRITE;
/*!40000 ALTER TABLE `klienci` DISABLE KEYS */;
INSERT INTO `klienci` VALUES (1,'Jan','Kowalski','jan.kowalski@example.com','123456789','1990-05-15'),(2,'Anna','Nowak','anna.nowak@example.com','987654321','1985-08-22'),(3,'Piotr','Zieliński','piotr.zielinski@example.com','456123789','1992-12-03'),(4,'Katarzyna','Wiśniewska','katarzyna.w@example.com','789321654','1988-03-30'),(5,'Marek','Lewandowski','marek.lewandowski@example.com','321654987','1995-11-10'),(7,'Testowy','Klient','testowy@example.com','123456711','1990-01-01');
/*!40000 ALTER TABLE `klienci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logi_operacji`
--

DROP TABLE IF EXISTS `logi_operacji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logi_operacji` (
  `idLogu` int(11) NOT NULL AUTO_INCREMENT,
  `tabela` varchar(50) DEFAULT NULL,
  `operacja` varchar(20) DEFAULT NULL,
  `czas` datetime DEFAULT NULL,
  `szczegoly` text DEFAULT NULL,
  PRIMARY KEY (`idLogu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logi_operacji`
--

LOCK TABLES `logi_operacji` WRITE;
/*!40000 ALTER TABLE `logi_operacji` DISABLE KEYS */;
INSERT INTO `logi_operacji` VALUES (1,'klienci','INSERT','2025-06-03 00:02:17','Dodano klienta: Testowy Klient'),(2,'treningipersonalne','UPDATE','2025-06-03 00:08:51','Zmieniono kwotę z 100.00 na 120.00 dla klienta ID 1');
/*!40000 ALTER TABLE `logi_operacji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platnosci`
--

DROP TABLE IF EXISTS `platnosci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platnosci` (
  `idPlatnosci` int(11) NOT NULL AUTO_INCREMENT,
  `idKlienta` int(11) NOT NULL,
  `dataPlatnosci` datetime NOT NULL,
  `idTypu` int(11) NOT NULL,
  PRIMARY KEY (`idPlatnosci`),
  UNIQUE KEY `idKlienta_UNIQUE` (`idPlatnosci`),
  KEY `fk_Platnosci_Klienci1_idx` (`idKlienta`),
  KEY `fk_Platnosci_typyPlatnosci1_idx` (`idTypu`),
  CONSTRAINT `fk_Platnosci_Klienci1` FOREIGN KEY (`idKlienta`) REFERENCES `klienci` (`idKlienta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Platnosci_typyPlatnosci1` FOREIGN KEY (`idTypu`) REFERENCES `typyplatnosci` (`idTypu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platnosci`
--

LOCK TABLES `platnosci` WRITE;
/*!40000 ALTER TABLE `platnosci` DISABLE KEYS */;
INSERT INTO `platnosci` VALUES (1,1,'2025-05-01 10:32:00',1),(2,2,'2025-05-03 16:10:00',2),(3,3,'2025-05-05 12:45:00',1),(4,4,'2025-05-10 14:20:00',1),(5,5,'2025-05-15 09:55:00',2);
/*!40000 ALTER TABLE `platnosci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownicy`
--

DROP TABLE IF EXISTS `pracownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pracownicy` (
  `idPracownika` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nrTelefonu` varchar(15) NOT NULL,
  `dataUrodzenia` date NOT NULL,
  `idStanowiska` int(11) NOT NULL,
  PRIMARY KEY (`idPracownika`),
  UNIQUE KEY `idKlienta_UNIQUE` (`idPracownika`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nrTelefonu_UNIQUE` (`nrTelefonu`),
  KEY `fk_Pracownicy_stanowiska1_idx` (`idStanowiska`),
  CONSTRAINT `fk_Pracownicy_stanowiska1` FOREIGN KEY (`idStanowiska`) REFERENCES `stanowiska` (`idTypu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownicy`
--

LOCK TABLES `pracownicy` WRITE;
/*!40000 ALTER TABLE `pracownicy` DISABLE KEYS */;
INSERT INTO `pracownicy` VALUES (1,'Tomasz','Nowicki','tomasz.nowicki@silownia.pl','500600700','1980-07-20',1),(2,'Ewa','Kubiak','ewa.kubiak@silownia.pl','511722933','1990-03-10',2),(3,'Adam','Maj','adam.maj@silownia.pl','502301456','1985-12-15',3),(4,'Karolina','Zając','karolina.zajac@silownia.pl','503112899','1992-04-05',4),(5,'Michał','Lis','michal.lis@silownia.pl','504123765','1988-09-30',5);
/*!40000 ALTER TABLE `pracownicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sprzet`
--

DROP TABLE IF EXISTS `sprzet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sprzet` (
  `idSprzetu` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) NOT NULL,
  `opis` varchar(50) NOT NULL,
  `dataZakupu` date NOT NULL,
  `idPracownika` int(11) NOT NULL,
  PRIMARY KEY (`idSprzetu`),
  UNIQUE KEY `idKlienta_UNIQUE` (`idSprzetu`),
  KEY `fk_Sprzet_Pracownicy1_idx` (`idPracownika`),
  CONSTRAINT `fk_Sprzet_Pracownicy1` FOREIGN KEY (`idPracownika`) REFERENCES `pracownicy` (`idPracownika`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprzet`
--

LOCK TABLES `sprzet` WRITE;
/*!40000 ALTER TABLE `sprzet` DISABLE KEYS */;
INSERT INTO `sprzet` VALUES (1,'Bieżnia Matrix T5','Bieżnia elektryczna z programami treningowymi','2024-01-10',5),(2,'Atlas Kettler','Sprzęt wielofunkcyjny do ćwiczeń siłowych','2023-11-22',5),(3,'Rower stacjonarny BH','Profesjonalny rower treningowy','2022-10-15',5),(4,'Ławka do wyciskania','Stabilna ławka z regulacją kąta','2023-08-05',5),(5,'Wiosłomistrz X200','Ergometr wioślarski dla zaawansowanych','2024-02-01',5);
/*!40000 ALTER TABLE `sprzet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stanowiska`
--

DROP TABLE IF EXISTS `stanowiska`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stanowiska` (
  `idTypu` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) NOT NULL,
  PRIMARY KEY (`idTypu`),
  UNIQUE KEY `idTypu_UNIQUE` (`idTypu`),
  UNIQUE KEY `nazwa_UNIQUE` (`nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stanowiska`
--

LOCK TABLES `stanowiska` WRITE;
/*!40000 ALTER TABLE `stanowiska` DISABLE KEYS */;
INSERT INTO `stanowiska` VALUES (3,'Manager'),(2,'Recepcjonista'),(4,'Sprzątacz'),(5,'Technik serwisu'),(1,'Trener personalny');
/*!40000 ALTER TABLE `stanowiska` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treningipersonalne`
--

DROP TABLE IF EXISTS `treningipersonalne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treningipersonalne` (
  `idTreningu` int(11) NOT NULL AUTO_INCREMENT,
  `dataRozpoczecia` datetime NOT NULL,
  `dataZakonczenia` datetime NOT NULL,
  `kwota` decimal(8,2) NOT NULL,
  `idKlienta` int(11) NOT NULL,
  `idPracownika` int(11) NOT NULL,
  PRIMARY KEY (`idTreningu`),
  UNIQUE KEY `idKlienta_UNIQUE` (`idTreningu`),
  KEY `fk_TreningiPersonalne_Klienci1_idx` (`idKlienta`),
  KEY `fk_TreningiPersonalne_Pracownicy1_idx` (`idPracownika`),
  CONSTRAINT `fk_TreningiPersonalne_Klienci1` FOREIGN KEY (`idKlienta`) REFERENCES `klienci` (`idKlienta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TreningiPersonalne_Pracownicy1` FOREIGN KEY (`idPracownika`) REFERENCES `pracownicy` (`idPracownika`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treningipersonalne`
--

LOCK TABLES `treningipersonalne` WRITE;
/*!40000 ALTER TABLE `treningipersonalne` DISABLE KEYS */;
INSERT INTO `treningipersonalne` VALUES (1,'2025-05-06 08:00:00','2025-05-06 09:00:00',120.00,1,1),(2,'2025-05-08 17:00:00','2025-05-08 18:00:00',100.00,3,1),(3,'2025-05-10 10:30:00','2025-05-10 11:30:00',90.00,5,1),(4,'2025-05-12 14:00:00','2025-05-12 15:00:00',110.00,2,1),(5,'2025-05-14 09:00:00','2025-05-14 10:00:00',95.00,4,1);
/*!40000 ALTER TABLE `treningipersonalne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typykarnetow`
--

DROP TABLE IF EXISTS `typykarnetow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typykarnetow` (
  `idTypu` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) NOT NULL,
  PRIMARY KEY (`idTypu`),
  UNIQUE KEY `idTypu_UNIQUE` (`idTypu`),
  UNIQUE KEY `nazwa_UNIQUE` (`nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typykarnetow`
--

LOCK TABLES `typykarnetow` WRITE;
/*!40000 ALTER TABLE `typykarnetow` DISABLE KEYS */;
INSERT INTO `typykarnetow` VALUES (2,'Kwartalny'),(1,'Miesięczny'),(3,'Polroczny'),(4,'Roczny');
/*!40000 ALTER TABLE `typykarnetow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typyplatnosci`
--

DROP TABLE IF EXISTS `typyplatnosci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typyplatnosci` (
  `idTypu` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(45) NOT NULL,
  PRIMARY KEY (`idTypu`),
  UNIQUE KEY `idTypu_UNIQUE` (`idTypu`),
  UNIQUE KEY `nazwa_UNIQUE` (`nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typyplatnosci`
--

LOCK TABLES `typyplatnosci` WRITE;
/*!40000 ALTER TABLE `typyplatnosci` DISABLE KEYS */;
INSERT INTO `typyplatnosci` VALUES (1,'Karnet'),(2,'Trening personalny');
/*!40000 ALTER TABLE `typyplatnosci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wejsciasauna`
--

DROP TABLE IF EXISTS `wejsciasauna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wejsciasauna` (
  `idWejscia` int(11) NOT NULL AUTO_INCREMENT,
  `dataWejscia` datetime NOT NULL,
  `Klienci_idKlienta` int(11) NOT NULL,
  PRIMARY KEY (`idWejscia`),
  UNIQUE KEY `idKlienta_UNIQUE` (`idWejscia`),
  KEY `fk_WejsciaSauna_Klienci1_idx` (`Klienci_idKlienta`),
  CONSTRAINT `fk_WejsciaSauna_Klienci1` FOREIGN KEY (`Klienci_idKlienta`) REFERENCES `klienci` (`idKlienta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wejsciasauna`
--

LOCK TABLES `wejsciasauna` WRITE;
/*!40000 ALTER TABLE `wejsciasauna` DISABLE KEYS */;
INSERT INTO `wejsciasauna` VALUES (1,'2025-05-02 18:45:00',2),(2,'2025-05-04 20:10:00',4),(3,'2025-05-07 17:30:00',2),(4,'2025-05-09 19:00:00',5),(5,'2025-05-11 21:15:00',2);
/*!40000 ALTER TABLE `wejsciasauna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wejsciasilownia`
--

DROP TABLE IF EXISTS `wejsciasilownia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wejsciasilownia` (
  `idWejscia` int(11) NOT NULL AUTO_INCREMENT,
  `dataWejscia` datetime NOT NULL,
  `Klienci_idKlienta` int(11) NOT NULL,
  PRIMARY KEY (`idWejscia`),
  UNIQUE KEY `idKlienta_UNIQUE` (`idWejscia`),
  KEY `fk_WejsciaSilownia_Klienci1_idx` (`Klienci_idKlienta`),
  CONSTRAINT `fk_WejsciaSilownia_Klienci1` FOREIGN KEY (`Klienci_idKlienta`) REFERENCES `klienci` (`idKlienta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wejsciasilownia`
--

LOCK TABLES `wejsciasilownia` WRITE;
/*!40000 ALTER TABLE `wejsciasilownia` DISABLE KEYS */;
INSERT INTO `wejsciasilownia` VALUES (1,'2025-05-01 07:15:00',1),(2,'2025-05-02 09:25:00',2),(3,'2025-05-05 18:00:00',3),(4,'2025-05-06 17:45:00',4),(5,'2025-05-07 08:30:00',5);
/*!40000 ALTER TABLE `wejsciasilownia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `widok_aktywni_klienci`
--

DROP TABLE IF EXISTS `widok_aktywni_klienci`;
/*!50001 DROP VIEW IF EXISTS `widok_aktywni_klienci`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `widok_aktywni_klienci` AS SELECT 
 1 AS `idKlienta`,
 1 AS `imie`,
 1 AS `nazwisko`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_karnety_klienci`
--

DROP TABLE IF EXISTS `widok_karnety_klienci`;
/*!50001 DROP VIEW IF EXISTS `widok_karnety_klienci`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `widok_karnety_klienci` AS SELECT 
 1 AS `idKlienta`,
 1 AS `imie`,
 1 AS `nazwisko`,
 1 AS `dataZakupu`,
 1 AS `kwota`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_klienci_kontakt`
--

DROP TABLE IF EXISTS `widok_klienci_kontakt`;
/*!50001 DROP VIEW IF EXISTS `widok_klienci_kontakt`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `widok_klienci_kontakt` AS SELECT 
 1 AS `idKlienta`,
 1 AS `imie`,
 1 AS `nazwisko`,
 1 AS `email`,
 1 AS `nrTelefonu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_ostatnie_wejscie_klientow`
--

DROP TABLE IF EXISTS `widok_ostatnie_wejscie_klientow`;
/*!50001 DROP VIEW IF EXISTS `widok_ostatnie_wejscie_klientow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `widok_ostatnie_wejscie_klientow` AS SELECT 
 1 AS `idKlienta`,
 1 AS `imie`,
 1 AS `nazwisko`,
 1 AS `ostatnie_wejscie`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_pracownicy_stanowiska`
--

DROP TABLE IF EXISTS `widok_pracownicy_stanowiska`;
/*!50001 DROP VIEW IF EXISTS `widok_pracownicy_stanowiska`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `widok_pracownicy_stanowiska` AS SELECT 
 1 AS `idPracownika`,
 1 AS `imie`,
 1 AS `nazwisko`,
 1 AS `stanowisko`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_sprzet_info`
--

DROP TABLE IF EXISTS `widok_sprzet_info`;
/*!50001 DROP VIEW IF EXISTS `widok_sprzet_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `widok_sprzet_info` AS SELECT 
 1 AS `idSprzetu`,
 1 AS `nazwa`,
 1 AS `dataZakupu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_sredni_czas_naprawy`
--

DROP TABLE IF EXISTS `widok_sredni_czas_naprawy`;
/*!50001 DROP VIEW IF EXISTS `widok_sredni_czas_naprawy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `widok_sredni_czas_naprawy` AS SELECT 
 1 AS `idSprzetu`,
 1 AS `sredni_czas_h`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_statystyka_wejsc`
--

DROP TABLE IF EXISTS `widok_statystyka_wejsc`;
/*!50001 DROP VIEW IF EXISTS `widok_statystyka_wejsc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `widok_statystyka_wejsc` AS SELECT 
 1 AS `idKlienta`,
 1 AS `imie`,
 1 AS `nazwisko`,
 1 AS `wejsc_silownia`,
 1 AS `wejsc_sauna`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_suma_treningow_klienta`
--

DROP TABLE IF EXISTS `widok_suma_treningow_klienta`;
/*!50001 DROP VIEW IF EXISTS `widok_suma_treningow_klienta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `widok_suma_treningow_klienta` AS SELECT 
 1 AS `idKlienta`,
 1 AS `imie`,
 1 AS `nazwisko`,
 1 AS `suma_treningow`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_wejscia_silownia`
--

DROP TABLE IF EXISTS `widok_wejscia_silownia`;
/*!50001 DROP VIEW IF EXISTS `widok_wejscia_silownia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `widok_wejscia_silownia` AS SELECT 
 1 AS `Klienci_idKlienta`,
 1 AS `imie`,
 1 AS `nazwisko`,
 1 AS `dataWejscia`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'silownia4'
--

--
-- Dumping routines for database 'silownia4'
--

--
-- Final view structure for view `widok_aktywni_klienci`
--

/*!50001 DROP VIEW IF EXISTS `widok_aktywni_klienci`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_aktywni_klienci` AS select distinct `k`.`idKlienta` AS `idKlienta`,`k`.`imie` AS `imie`,`k`.`nazwisko` AS `nazwisko` from `klienci` `k` where `k`.`idKlienta` in (select `karnety`.`idKlienta` from `karnety`) and `k`.`idKlienta` in (select `treningipersonalne`.`idKlienta` from `treningipersonalne`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_karnety_klienci`
--

/*!50001 DROP VIEW IF EXISTS `widok_karnety_klienci`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_karnety_klienci` AS select `k`.`idKlienta` AS `idKlienta`,`c`.`imie` AS `imie`,`c`.`nazwisko` AS `nazwisko`,`k`.`dataZakupu` AS `dataZakupu`,`k`.`kwota` AS `kwota` from (`karnety` `k` join `klienci` `c` on(`k`.`idKlienta` = `c`.`idKlienta`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_klienci_kontakt`
--

/*!50001 DROP VIEW IF EXISTS `widok_klienci_kontakt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_klienci_kontakt` AS select `klienci`.`idKlienta` AS `idKlienta`,`klienci`.`imie` AS `imie`,`klienci`.`nazwisko` AS `nazwisko`,`klienci`.`email` AS `email`,`klienci`.`nrTelefonu` AS `nrTelefonu` from `klienci` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_ostatnie_wejscie_klientow`
--

/*!50001 DROP VIEW IF EXISTS `widok_ostatnie_wejscie_klientow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_ostatnie_wejscie_klientow` AS select `k`.`idKlienta` AS `idKlienta`,`k`.`imie` AS `imie`,`k`.`nazwisko` AS `nazwisko`,max(`w`.`dataWejscia`) AS `ostatnie_wejscie` from (`klienci` `k` join `wejsciasilownia` `w` on(`k`.`idKlienta` = `w`.`Klienci_idKlienta`)) group by `k`.`idKlienta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_pracownicy_stanowiska`
--

/*!50001 DROP VIEW IF EXISTS `widok_pracownicy_stanowiska`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_pracownicy_stanowiska` AS select `p`.`idPracownika` AS `idPracownika`,`p`.`imie` AS `imie`,`p`.`nazwisko` AS `nazwisko`,`s`.`nazwa` AS `stanowisko` from (`pracownicy` `p` join `stanowiska` `s` on(`p`.`idStanowiska` = `s`.`idTypu`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_sprzet_info`
--

/*!50001 DROP VIEW IF EXISTS `widok_sprzet_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_sprzet_info` AS select `sprzet`.`idSprzetu` AS `idSprzetu`,`sprzet`.`nazwa` AS `nazwa`,`sprzet`.`dataZakupu` AS `dataZakupu` from `sprzet` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_sredni_czas_naprawy`
--

/*!50001 DROP VIEW IF EXISTS `widok_sredni_czas_naprawy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_sredni_czas_naprawy` AS select `awariesprzetu`.`idSprzetu` AS `idSprzetu`,round(avg(timestampdiff(HOUR,`awariesprzetu`.`dataAwarii`,`awariesprzetu`.`dataNaprawy`)),2) AS `sredni_czas_h` from `awariesprzetu` group by `awariesprzetu`.`idSprzetu` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_statystyka_wejsc`
--

/*!50001 DROP VIEW IF EXISTS `widok_statystyka_wejsc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_statystyka_wejsc` AS select `k`.`idKlienta` AS `idKlienta`,`k`.`imie` AS `imie`,`k`.`nazwisko` AS `nazwisko`,(select count(0) from `wejsciasilownia` `ws` where `ws`.`Klienci_idKlienta` = `k`.`idKlienta`) AS `wejsc_silownia`,(select count(0) from `wejsciasauna` `wsau` where `wsau`.`Klienci_idKlienta` = `k`.`idKlienta`) AS `wejsc_sauna` from `klienci` `k` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_suma_treningow_klienta`
--

/*!50001 DROP VIEW IF EXISTS `widok_suma_treningow_klienta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_suma_treningow_klienta` AS select `k`.`idKlienta` AS `idKlienta`,`k`.`imie` AS `imie`,`k`.`nazwisko` AS `nazwisko`,sum(`t`.`kwota`) AS `suma_treningow` from (`treningipersonalne` `t` join `klienci` `k` on(`t`.`idKlienta` = `k`.`idKlienta`)) group by `k`.`idKlienta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_wejscia_silownia`
--

/*!50001 DROP VIEW IF EXISTS `widok_wejscia_silownia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_wejscia_silownia` AS select `w`.`Klienci_idKlienta` AS `Klienci_idKlienta`,`k`.`imie` AS `imie`,`k`.`nazwisko` AS `nazwisko`,`w`.`dataWejscia` AS `dataWejscia` from (`wejsciasilownia` `w` join `klienci` `k` on(`w`.`Klienci_idKlienta` = `k`.`idKlienta`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-04  0:02:59
