-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: projedenemesi
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `hava_durumu`
--

DROP TABLE IF EXISTS `hava_durumu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hava_durumu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tarih` date NOT NULL,
  `il` varchar(100) NOT NULL,
  `ilce` varchar(100) NOT NULL,
  `sicaklik` decimal(5,2) NOT NULL,
  `hadise` varchar(50) NOT NULL,
  `resim_yolu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hava_durumu`
--

LOCK TABLES `hava_durumu` WRITE;
/*!40000 ALTER TABLE `hava_durumu` DISABLE KEYS */;
/*!40000 ALTER TABLE `hava_durumu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `il`
--

DROP TABLE IF EXISTS `il`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `il` (
  `id` tinyint NOT NULL DEFAULT '0',
  `ad` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `ad` (`ad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `il`
--

LOCK TABLES `il` WRITE;
/*!40000 ALTER TABLE `il` DISABLE KEYS */;
INSERT INTO `il` VALUES (1,'Adana'),(2,'Adıyaman'),(3,'Afyonkarahisar'),(4,'Ağrı'),(5,'Amasya'),(6,'Ankara'),(7,'Antalya'),(8,'Artvin'),(9,'Aydın'),(10,'Balıkesir'),(11,'Bilecik'),(12,'Bingöl'),(13,'Bitlis'),(14,'Bolu'),(15,'Burdur'),(16,'Bursa'),(17,'Çanakkale'),(18,'Çankırı'),(19,'Çorum'),(20,'Denizli'),(21,'Diyarbakır'),(22,'Edirne'),(23,'Elazığ'),(24,'Erzincan'),(25,'Erzurum'),(26,'Eskişehir'),(27,'Gaziantep'),(28,'Giresun'),(29,'Gümüşhane'),(30,'Hakkari'),(31,'Hatay'),(32,'Isparta'),(33,'Mersin(İçel)'),(34,'İstanbul'),(35,'İzmir'),(36,'Kars'),(37,'Kastamonu'),(38,'Kayseri'),(39,'Kırklareli'),(40,'Kırşehir'),(41,'Kocaeli'),(42,'Konya'),(43,'Kütahya'),(44,'Malatya'),(45,'Manisa'),(46,'Kahramanmaraş'),(47,'Mardin'),(48,'Muğla'),(49,'Muş'),(50,'Nevşehir'),(51,'Niğde'),(52,'Ordu'),(53,'Rize'),(54,'Sakarya'),(55,'Samsun'),(56,'Siirt'),(57,'Sinop'),(58,'Sivas'),(59,'Tekirdağ'),(60,'Tokat'),(61,'Trabzon'),(62,'Tunceli'),(63,'Şanlıurfa'),(64,'Uşak'),(65,'Van'),(66,'Yozgat'),(67,'Zonguldak'),(68,'Aksaray'),(69,'Bayburt'),(70,'Karaman'),(71,'Kırıkkale'),(72,'Batman'),(73,'Şırnak'),(74,'Bartın'),(75,'Ardahan'),(76,'Iğdır'),(77,'Yalova'),(78,'Karabük'),(79,'Kilis'),(80,'Osmaniye'),(81,'Düzce');
/*!40000 ALTER TABLE `il` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilce`
--

DROP TABLE IF EXISTS `ilce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `il_id` tinyint NOT NULL,
  `ad` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=959 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilce`
--

LOCK TABLES `ilce` WRITE;
/*!40000 ALTER TABLE `ilce` DISABLE KEYS */;
INSERT INTO `ilce` VALUES (1,1,'Aladağ(Karsantı)'),(2,1,'Ceyhan'),(3,1,'Çukurova'),(4,1,'Feke'),(5,1,'İmamoğlu'),(6,1,'Karaisalı'),(7,1,'Karataş'),(8,1,'Kozan'),(9,1,'Pozantı'),(10,1,'Saimbeyli'),(11,1,'Sarıçam'),(12,1,'Seyhan'),(13,1,'Tufanbeyli'),(14,1,'Yumurtalık'),(15,1,'Yüreğir'),(16,2,'Adıyaman'),(17,2,'Besni'),(18,2,'Çelikhan'),(19,2,'Gerger'),(20,2,'Gölbaşı'),(21,2,'Kahta'),(22,2,'Samsat'),(23,2,'Sincik'),(24,2,'Tut'),(25,3,'Afyonkarahisar'),(26,3,'Başmakçı'),(27,3,'Bayat'),(28,3,'Bolvadin'),(29,3,'Çay'),(30,3,'Çobanlar'),(31,3,'Dazkırı'),(32,3,'Dinar'),(33,3,'Emirdağ'),(34,3,'Evciler'),(35,3,'Hocalar'),(36,3,'İhsaniye'),(37,3,'İscehisar'),(38,3,'Kızılören'),(39,3,'Sandıklı'),(40,3,'Sincanlı(Sinanpaşa)'),(41,3,'Sultandağı'),(42,3,'Şuhut'),(43,4,'Ağrı'),(44,4,'Diyadin'),(45,4,'Doğubeyazıt'),(46,4,'Eleşkirt'),(47,4,'Hamur'),(48,4,'Patnos'),(49,4,'Taşlıçay'),(50,4,'Tutak'),(51,5,'Amasya'),(52,5,'Göynücek'),(53,5,'Gümüşhacıköy'),(54,5,'Hamamözü'),(55,5,'Merzifon'),(56,5,'Suluova'),(57,5,'Taşova'),(58,6,'Akyurt'),(59,6,'Altındağ'),(60,6,'Ayaş'),(61,6,'Bala'),(62,6,'Beypazarı'),(63,6,'Çamlıdere'),(64,6,'Çankaya'),(65,6,'Çubuk'),(66,6,'Elmadağ'),(67,6,'Etimesgut'),(68,6,'Evren'),(69,6,'Gölbaşı'),(70,6,'Güdül'),(71,6,'Haymana'),(72,6,'Kalecik'),(73,6,'Kazan'),(74,6,'Keçiören'),(75,6,'Kızılcahamam'),(76,6,'Mamak'),(77,6,'Nallıhan'),(78,6,'Polatlı'),(79,6,'Pursaklar'),(80,6,'Sincan'),(81,6,'Şereflikoçhisar'),(82,6,'Yenimahalle'),(83,7,'Akseki'),(84,7,'Aksu'),(85,7,'Alanya'),(86,7,'Döşemealtı'),(87,7,'Elmalı'),(88,7,'Finike'),(89,7,'Gazipaşa'),(90,7,'Gündoğmuş'),(91,7,'İbradı(Aydınkent)'),(92,7,'Kale(Demre)'),(93,7,'Kaş'),(94,7,'Kemer'),(95,7,'Kepez'),(96,7,'Konyaaltı'),(97,7,'Korkuteli'),(98,7,'Kumluca'),(99,7,'Manavgat'),(100,7,'Muratpaşa'),(101,7,'Serik'),(102,8,'Ardanuç'),(103,8,'Arhavi'),(104,8,'Artvin'),(105,8,'Borçka'),(106,8,'Hopa'),(107,8,'Murgul(Göktaş)'),(108,8,'Şavşat'),(109,8,'Yusufeli'),(110,9,'Aydın'),(111,9,'Bozdoğan'),(112,9,'Buharkent(Çubukdağı)'),(113,9,'Çine'),(114,9,'Didim(Yenihisar)'),(115,9,'Germencik'),(116,9,'İncirliova'),(117,9,'Karacasu'),(118,9,'Karpuzlu'),(119,9,'Koçarlı'),(120,9,'Köşk'),(121,9,'Kuşadası'),(122,9,'Kuyucak'),(123,9,'Nazilli'),(124,9,'Söke'),(125,9,'Sultanhisar'),(126,9,'Yenipazar'),(127,10,'Ayvalık'),(128,10,'Balıkesir'),(129,10,'Balya'),(130,10,'Bandırma'),(131,10,'Bigadiç'),(132,10,'Burhaniye'),(133,10,'Dursunbey'),(134,10,'Edremit'),(135,10,'Erdek'),(136,10,'Gömeç'),(137,10,'Gönen'),(138,10,'Havran'),(139,10,'İvrindi'),(140,10,'Kepsut'),(141,10,'Manyas'),(142,10,'Marmara'),(143,10,'Savaştepe'),(144,10,'Sındırgı'),(145,10,'Susurluk'),(146,11,'Bilecik'),(147,11,'Bozüyük'),(148,11,'Gölpazarı'),(149,11,'İnhisar'),(150,11,'Osmaneli'),(151,11,'Pazaryeri'),(152,11,'Söğüt'),(153,11,'Yenipazar'),(154,12,'Adaklı'),(155,12,'Bingöl'),(156,12,'Genç'),(157,12,'Karlıova'),(158,12,'Kığı'),(159,12,'Solhan'),(160,12,'Yayladere'),(161,12,'Yedisu'),(162,13,'Adilcevaz'),(163,13,'Ahlat'),(164,13,'Bitlis'),(165,13,'Güroymak'),(166,13,'Hizan'),(167,13,'Mutki'),(168,13,'Tatvan'),(169,14,'Bolu'),(170,14,'Dörtdivan'),(171,14,'Gerede'),(172,14,'Göynük'),(173,14,'Kıbrıscık'),(174,14,'Mengen'),(175,14,'Mudurnu'),(176,14,'Seben'),(177,14,'Yeniçağa'),(178,15,'Ağlasun'),(179,15,'Altınyayla(Dirmil)'),(180,15,'Bucak'),(181,15,'Burdur'),(182,15,'Çavdır'),(183,15,'Çeltikçi'),(184,15,'Gölhisar'),(185,15,'Karamanlı'),(186,15,'Kemer'),(187,15,'Tefenni'),(188,15,'Yeşilova'),(189,16,'Büyükorhan'),(190,16,'Gemlik'),(191,16,'Gürsu'),(192,16,'Harmancık'),(193,16,'İnegöl'),(194,16,'İznik'),(195,16,'Karacabey'),(196,16,'Keles'),(197,16,'Kestel'),(198,16,'Mudanya'),(199,16,'Mustafakemalpaşa'),(200,16,'Nilüfer'),(201,16,'Orhaneli'),(202,16,'Orhangazi'),(203,16,'Osmangazi'),(204,16,'Yenişehir'),(205,16,'Yıldırım'),(206,17,'Ayvacık'),(207,17,'Bayramiç'),(208,17,'Biga'),(209,17,'Bozcaada'),(210,17,'Çan'),(211,17,'Çanakkale'),(212,17,'Eceabat'),(213,17,'Ezine'),(214,17,'Gelibolu'),(215,17,'Gökçeada(İmroz)'),(216,17,'Lapseki'),(217,17,'Yenice'),(218,18,'Atkaracalar'),(219,18,'Bayramören'),(220,18,'Çankırı'),(221,18,'Çerkeş'),(222,18,'Eldivan'),(223,18,'Ilgaz'),(224,18,'Kızılırmak'),(225,18,'Korgun'),(226,18,'Kurşunlu'),(227,18,'Orta'),(228,18,'Şabanözü'),(229,18,'Yapraklı'),(230,19,'Alaca'),(231,19,'Bayat'),(232,19,'Boğazkale'),(233,19,'Çorum'),(234,19,'Dodurga'),(235,19,'İskilip'),(236,19,'Kargı'),(237,19,'Laçin'),(238,19,'Mecitözü'),(239,19,'Oğuzlar(Karaören)'),(240,19,'Ortaköy'),(241,19,'Osmancık'),(242,19,'Sungurlu'),(243,19,'Uğurludağ'),(244,20,'Acıpayam'),(245,20,'Akköy'),(246,20,'Babadağ'),(247,20,'Baklan'),(248,20,'Bekilli'),(249,20,'Beyağaç'),(250,20,'Bozkurt'),(251,20,'Buldan'),(252,20,'Çal'),(253,20,'Çameli'),(254,20,'Çardak'),(255,20,'Çivril'),(256,20,'Denizli'),(257,20,'Güney'),(258,20,'Honaz'),(259,20,'Kale'),(260,20,'Sarayköy'),(261,20,'Serinhisar'),(262,20,'Tavas'),(263,21,'Bağlar'),(264,21,'Bismil'),(265,21,'Çermik'),(266,21,'Çınar'),(267,21,'Çüngüş'),(268,21,'Dicle'),(269,21,'Eğil'),(270,21,'Ergani'),(271,21,'Hani'),(272,21,'Hazro'),(273,21,'Kayapınar'),(274,21,'Kocaköy'),(275,21,'Kulp'),(276,21,'Lice'),(277,21,'Silvan'),(278,21,'Sur'),(279,21,'Yenişehir'),(280,22,'Edirne'),(281,22,'Enez'),(282,22,'Havsa'),(283,22,'İpsala'),(284,22,'Keşan'),(285,22,'Lalapaşa'),(286,22,'Meriç'),(287,22,'Süleoğlu(Süloğlu)'),(288,22,'Uzunköprü'),(289,23,'Ağın'),(290,23,'Alacakaya'),(291,23,'Arıcak'),(292,23,'Baskil'),(293,23,'Elazığ'),(294,23,'Karakoçan'),(295,23,'Keban'),(296,23,'Kovancılar'),(297,23,'Maden'),(298,23,'Palu'),(299,23,'Sivrice'),(300,24,'Çayırlı'),(301,24,'Erzincan'),(302,24,'İliç(Ilıç)'),(303,24,'Kemah'),(304,24,'Kemaliye'),(305,24,'Otlukbeli'),(306,24,'Refahiye'),(307,24,'Tercan'),(308,24,'Üzümlü'),(309,25,'Aşkale'),(310,25,'Aziziye(Ilıca)'),(311,25,'Çat'),(312,25,'Hınıs'),(313,25,'Horasan'),(314,25,'İspir'),(315,25,'Karaçoban'),(316,25,'Karayazı'),(317,25,'Köprüköy'),(318,25,'Narman'),(319,25,'Oltu'),(320,25,'Olur'),(321,25,'Palandöken'),(322,25,'Pasinler'),(323,25,'Pazaryolu'),(324,25,'Şenkaya'),(325,25,'Tekman'),(326,25,'Tortum'),(327,25,'Uzundere'),(328,25,'Yakutiye'),(329,26,'Alpu'),(330,26,'Beylikova'),(331,26,'Çifteler'),(332,26,'Günyüzü'),(333,26,'Han'),(334,26,'İnönü'),(335,26,'Mahmudiye'),(336,26,'Mihalgazi'),(337,26,'Mihalıçcık'),(338,26,'Odunpazarı'),(339,26,'Sarıcakaya'),(340,26,'Seyitgazi'),(341,26,'Sivrihisar'),(342,26,'Tepebaşı'),(343,27,'Araban'),(344,27,'İslahiye'),(345,27,'Karkamış'),(346,27,'Nizip'),(347,27,'Nurdağı'),(348,27,'Oğuzeli'),(349,27,'Şahinbey'),(350,27,'Şehitkamil'),(351,27,'Yavuzeli'),(352,28,'Alucra'),(353,28,'Bulancak'),(354,28,'Çamoluk'),(355,28,'Çanakçı'),(356,28,'Dereli'),(357,28,'Doğankent'),(358,28,'Espiye'),(359,28,'Eynesil'),(360,28,'Giresun'),(361,28,'Görele'),(362,28,'Güce'),(363,28,'Keşap'),(364,28,'Piraziz'),(365,28,'Şebinkarahisar'),(366,28,'Tirebolu'),(367,28,'Yağlıdere'),(368,29,'Gümüşhane'),(369,29,'Kelkit'),(370,29,'Köse'),(371,29,'Kürtün'),(372,29,'Şiran'),(373,29,'Torul'),(374,30,'Çukurca'),(375,30,'Hakkari'),(376,30,'Şemdinli'),(377,30,'Yüksekova'),(378,31,'Altınözü'),(379,31,'Antakya'),(380,31,'Belen'),(381,31,'Dörtyol'),(382,31,'Erzin'),(383,31,'Hassa'),(384,31,'İskenderun'),(385,31,'Kırıkhan'),(386,31,'Kumlu'),(387,31,'Reyhanlı'),(388,31,'Samandağ'),(389,31,'Yayladağı'),(390,32,'Aksu'),(391,32,'Atabey'),(392,32,'Eğridir(Eğirdir)'),(393,32,'Gelendost'),(394,32,'Gönen'),(395,32,'Isparta'),(396,32,'Keçiborlu'),(397,32,'Senirkent'),(398,32,'Sütçüler'),(399,32,'Şarkikaraağaç'),(400,32,'Uluborlu'),(401,32,'Yalvaç'),(402,32,'Yenişarbademli'),(403,33,'Akdeniz'),(404,33,'Anamur'),(405,33,'Aydıncık'),(406,33,'Bozyazı'),(407,33,'Çamlıyayla'),(408,33,'Erdemli'),(409,33,'Gülnar (Gülpınar)'),(410,33,'Mezitli'),(411,33,'Mut'),(412,33,'Silifke'),(413,33,'Tarsus'),(414,33,'Toroslar'),(415,33,'Yenişehir'),(416,34,'Adalar'),(417,34,'Arnavutköy'),(418,34,'Ataşehir'),(419,34,'Avcılar'),(420,34,'Bağcılar'),(421,34,'Bahçelievler'),(422,34,'Bakırköy'),(423,34,'Başakşehir'),(424,34,'Bayrampaşa'),(425,34,'Beşiktaş'),(426,34,'Beykoz'),(427,34,'Beylikdüzü'),(428,34,'Beyoğlu'),(429,34,'Büyükçekmece'),(430,34,'Çatalca'),(431,34,'Çekmeköy'),(432,34,'Esenler'),(433,34,'Esenyurt'),(434,34,'Eyüp'),(435,34,'Fatih'),(436,34,'Gaziosmanpaşa'),(437,34,'Güngören'),(438,34,'Kadıköy'),(439,34,'Kağıthane'),(440,34,'Kartal'),(441,34,'Küçükçekmece'),(442,34,'Maltepe'),(443,34,'Pendik'),(444,34,'Sancaktepe'),(445,34,'Sarıyer'),(446,34,'Silivri'),(447,34,'Sultanbeyli'),(448,34,'Sultangazi'),(449,34,'Şile'),(450,34,'Şişli'),(451,34,'Tuzla'),(452,34,'Ümraniye'),(453,34,'Üsküdar'),(454,34,'Zeytinburnu'),(455,35,'Aliağa'),(456,35,'Balçova'),(457,35,'Bayındır'),(458,35,'Bayraklı'),(459,35,'Bergama'),(460,35,'Beydağ'),(461,35,'Bornova'),(462,35,'Buca'),(463,35,'Cumaovası(Menderes)'),(464,35,'Çeşme'),(465,35,'Çiğli'),(466,35,'Dikili'),(467,35,'Foça'),(468,35,'Gaziemir'),(469,35,'Güzelbahçe'),(470,35,'Karabağlar'),(471,35,'Karaburun'),(472,35,'Karşıyaka'),(473,35,'Kemalpaşa'),(474,35,'Kınık'),(475,35,'Kiraz'),(476,35,'Konak'),(477,35,'Menemen'),(478,35,'Narlıdere'),(479,35,'Ödemiş'),(480,35,'Seferihisar'),(481,35,'Selçuk'),(482,35,'Tire'),(483,35,'Torbalı'),(484,35,'Urla'),(485,36,'Akyaka'),(486,36,'Arpaçay'),(487,36,'Digor'),(488,36,'Kağızman'),(489,36,'Kars'),(490,36,'Sarıkamış'),(491,36,'Selim'),(492,36,'Susuz'),(493,37,'Abana'),(494,37,'Ağlı'),(495,37,'Araç'),(496,37,'Azdavay'),(497,37,'Bozkurt'),(498,37,'Cide'),(499,37,'Çatalzeytin'),(500,37,'Daday'),(501,37,'Devrekani'),(502,37,'Doğanyurt'),(503,37,'Hanönü(Gökçeağaç)'),(504,37,'İhsangazi'),(505,37,'İnebolu'),(506,37,'Kastamonu'),(507,37,'Küre'),(508,37,'Pınarbaşı'),(509,37,'Seydiler'),(510,37,'Şenpazar'),(511,37,'Taşköprü'),(512,37,'Tosya'),(513,38,'Akkışla'),(514,38,'Bünyan'),(515,38,'Develi'),(516,38,'Felahiye'),(517,38,'Hacılar'),(518,38,'İncesu'),(519,38,'Kocasinan'),(520,38,'Melikgazi'),(521,38,'Özvatan(Çukur)'),(522,38,'Pınarbaşı'),(523,38,'Sarıoğlan'),(524,38,'Sarız'),(525,38,'Talas'),(526,38,'Tomarza'),(527,38,'Yahyalı'),(528,38,'Yeşilhisar'),(529,39,'Babaeski'),(530,39,'Demirköy'),(531,39,'Kırklareli'),(532,39,'Kofçaz'),(533,39,'Lüleburgaz'),(534,39,'Pehlivanköy'),(535,39,'Pınarhisar'),(536,39,'Vize'),(537,40,'Akçakent'),(538,40,'Akpınar'),(539,40,'Boztepe'),(540,40,'Çiçekdağı'),(541,40,'Kaman'),(542,40,'Kırşehir'),(543,40,'Mucur'),(544,41,'Başiskele'),(545,41,'Çayırova'),(546,41,'Darıca'),(547,41,'Derince'),(548,41,'Dilovası'),(549,41,'Gebze'),(550,41,'Gölcük'),(551,41,'İzmit'),(552,41,'Kandıra'),(553,41,'Karamürsel'),(554,41,'Kartepe'),(555,41,'Tütünçiftlik'),(556,42,'Ahırlı'),(557,42,'Akören'),(558,42,'Akşehir'),(559,42,'Altınekin'),(560,42,'Beyşehir'),(561,42,'Bozkır'),(562,42,'Cihanbeyli'),(563,42,'Çeltik'),(564,42,'Çumra'),(565,42,'Derbent'),(566,42,'Derebucak'),(567,42,'Doğanhisar'),(568,42,'Emirgazi'),(569,42,'Ereğli'),(570,42,'Güneysınır'),(571,42,'Hadim'),(572,42,'Halkapınar'),(573,42,'Hüyük'),(574,42,'Ilgın'),(575,42,'Kadınhanı'),(576,42,'Karapınar'),(577,42,'Karatay'),(578,42,'Kulu'),(579,42,'Meram'),(580,42,'Sarayönü'),(581,42,'Selçuklu'),(582,42,'Seydişehir'),(583,42,'Taşkent'),(584,42,'Tuzlukçu'),(585,42,'Yalıhüyük'),(586,42,'Yunak'),(587,43,'Altıntaş'),(588,43,'Aslanapa'),(589,43,'Çavdarhisar'),(590,43,'Domaniç'),(591,43,'Dumlupınar'),(592,43,'Emet'),(593,43,'Gediz'),(594,43,'Hisarcık'),(595,43,'Kütahya'),(596,43,'Pazarlar'),(597,43,'Simav'),(598,43,'Şaphane'),(599,43,'Tavşanlı'),(600,43,'Tunçbilek'),(601,44,'Akçadağ'),(602,44,'Arapkir'),(603,44,'Arguvan'),(604,44,'Battalgazi'),(605,44,'Darende'),(606,44,'Doğanşehir'),(607,44,'Doğanyol'),(608,44,'Hekimhan'),(609,44,'Kale'),(610,44,'Kuluncak'),(611,44,'Malatya'),(612,44,'Pötürge'),(613,44,'Yazıhan'),(614,44,'Yeşilyurt'),(615,45,'Ahmetli'),(616,45,'Akhisar'),(617,45,'Alaşehir'),(618,45,'Demirci'),(619,45,'Gölmarmara'),(620,45,'Gördes'),(621,45,'Kırkağaç'),(622,45,'Köprübaşı'),(623,45,'Kula'),(624,45,'Manisa'),(625,45,'Salihli'),(626,45,'Sarıgöl'),(627,45,'Saruhanlı'),(628,45,'Selendi'),(629,45,'Soma'),(630,45,'Turgutlu'),(631,46,'Afşin'),(632,46,'Andırın'),(633,46,'Çağlayancerit'),(634,46,'Ekinözü'),(635,46,'Elbistan'),(636,46,'Göksun'),(637,46,'Kahramanmaraş'),(638,46,'Nurhak'),(639,46,'Pazarcık'),(640,46,'Türkoğlu'),(641,47,'Dargeçit'),(642,47,'Derik'),(643,47,'Kızıltepe'),(644,47,'Mardin'),(645,47,'Mazıdağı'),(646,47,'Midyat(Estel)'),(647,47,'Nusaybin'),(648,47,'Ömerli'),(649,47,'Savur'),(650,47,'Yeşilli'),(651,48,'Bodrum'),(652,48,'Dalaman'),(653,48,'Datça'),(654,48,'Fethiye'),(655,48,'Kavaklıdere'),(656,48,'Köyceğiz'),(657,48,'Marmaris'),(658,48,'Milas'),(659,48,'Muğla'),(660,48,'Ortaca'),(661,48,'Ula'),(662,48,'Yatağan'),(663,49,'Bulanık'),(664,49,'Hasköy'),(665,49,'Korkut'),(666,49,'Malazgirt'),(667,49,'Muş'),(668,49,'Varto'),(669,50,'Acıgöl'),(670,50,'Avanos'),(671,50,'Derinkuyu'),(672,50,'Gülşehir'),(673,50,'Hacıbektaş'),(674,50,'Kozaklı'),(675,50,'Nevşehir'),(676,50,'Ürgüp'),(677,51,'Altunhisar'),(678,51,'Bor'),(679,51,'Çamardı'),(680,51,'Çiftlik(Özyurt)'),(681,51,'Niğde'),(682,51,'Ulukışla'),(683,52,'Akkuş'),(684,52,'Aybastı'),(685,52,'Çamaş'),(686,52,'Çatalpınar'),(687,52,'Çaybaşı'),(688,52,'Fatsa'),(689,52,'Gölköy'),(690,52,'Gülyalı'),(691,52,'Gürgentepe'),(692,52,'İkizce'),(693,52,'Kabataş'),(694,52,'Karadüz(Kabadüz)'),(695,52,'Korgan'),(696,52,'Kumru'),(697,52,'Mesudiye'),(698,52,'Ordu'),(699,52,'Perşembe'),(700,52,'Ulubey'),(701,52,'Ünye'),(702,53,'Ardeşen'),(703,53,'Çamlıhemşin'),(704,53,'Çayeli'),(705,53,'Derepazarı'),(706,53,'Fındıklı'),(707,53,'Güneysu'),(708,53,'Hemşin'),(709,53,'İkizdere'),(710,53,'İyidere'),(711,53,'Kalkandere'),(712,53,'Pazar'),(713,53,'Rize'),(714,54,'Adapazarı'),(715,54,'Akyazı'),(716,54,'Arifiye'),(717,54,'Erenler'),(718,54,'Ferizli'),(719,54,'Geyve'),(720,54,'Hendek'),(721,54,'Karapürçek'),(722,54,'Karasu'),(723,54,'Kaynarca'),(724,54,'Kocaali'),(725,54,'Pamukova'),(726,54,'Sapanca'),(727,54,'Serdivan'),(728,54,'Söğütlü'),(729,54,'Taraklı'),(730,55,'19 Mayıs(Ballıca)'),(731,55,'Alaçam'),(732,55,'Asarcık'),(733,55,'Atakum'),(734,55,'Ayvacık'),(735,55,'Bafra'),(736,55,'Canik'),(737,55,'Çarşamba'),(738,55,'Havza'),(739,55,'İlkadım'),(740,55,'Kavak'),(741,55,'Ladik'),(742,55,'Salıpazarı'),(743,55,'Tekkeköy'),(744,55,'Terme'),(745,55,'Vezirköprü'),(746,55,'Yakakent'),(747,56,'Aydınlar'),(748,56,'Baykan'),(749,56,'Eruh'),(750,56,'Kurtalan'),(751,56,'Pervari'),(752,56,'Siirt'),(753,56,'Şirvan'),(754,57,'Ayancık'),(755,57,'Boyabat'),(756,57,'Dikmen'),(757,57,'Durağan'),(758,57,'Erfelek'),(759,57,'Gerze'),(760,57,'Saraydüzü'),(761,57,'Sinop'),(762,57,'Türkeli'),(763,58,'Akıncılar'),(764,58,'Altınyayla'),(765,58,'Divriği'),(766,58,'Doğanşar'),(767,58,'Gemerek'),(768,58,'Gölova'),(769,58,'Gürün'),(770,58,'Hafik'),(771,58,'İmranlı'),(772,58,'Kangal'),(773,58,'Koyulhisar'),(774,58,'Sivas'),(775,58,'Suşehri'),(776,58,'Şarkışla'),(777,58,'Ulaş'),(778,58,'Yıldızeli'),(779,58,'Zara'),(780,59,'Çerkezköy'),(781,59,'Çorlu'),(782,59,'Hayrabolu'),(783,59,'Malkara'),(784,59,'Marmaraereğlisi'),(785,59,'Muratlı'),(786,59,'Saray'),(787,59,'Şarköy'),(788,59,'Tekirdağ'),(789,60,'Almus'),(790,60,'Artova'),(791,60,'Başçiftlik'),(792,60,'Erbaa'),(793,60,'Niksar'),(794,60,'Pazar'),(795,60,'Reşadiye'),(796,60,'Sulusaray'),(797,60,'Tokat'),(798,60,'Turhal'),(799,60,'Yeşilyurt'),(800,60,'Zile'),(801,61,'Akçaabat'),(802,61,'Araklı'),(803,61,'Arsin'),(804,61,'Beşikdüzü'),(805,61,'Çarşıbaşı'),(806,61,'Çaykara'),(807,61,'Dernekpazarı'),(808,61,'Düzköy'),(809,61,'Hayrat'),(810,61,'Köprübaşı'),(811,61,'Maçka'),(812,61,'Of'),(813,61,'Sürmene'),(814,61,'Şalpazarı'),(815,61,'Tonya'),(816,61,'Trabzon'),(817,61,'Vakfıkebir'),(818,61,'Yomra'),(819,62,'Çemişgezek'),(820,62,'Hozat'),(821,62,'Mazgirt'),(822,62,'Nazımiye'),(823,62,'Ovacık'),(824,62,'Pertek'),(825,62,'Pülümür'),(826,62,'Tunceli'),(827,63,'Akçakale'),(828,63,'Birecik'),(829,63,'Bozova'),(830,63,'Ceylanpınar'),(831,63,'Halfeti'),(832,63,'Harran'),(833,63,'Hilvan'),(834,63,'Siverek'),(835,63,'Suruç'),(836,63,'Şanlıurfa'),(837,63,'Viranşehir'),(838,64,'Banaz'),(839,64,'Eşme'),(840,64,'Karahallı'),(841,64,'Sivaslı'),(842,64,'Ulubey'),(843,64,'Uşak'),(844,65,'Bahçesaray'),(845,65,'Başkale'),(846,65,'Çaldıran'),(847,65,'Çatak'),(848,65,'Edremit(Gümüşdere)'),(849,65,'Erciş'),(850,65,'Gevaş'),(851,65,'Gürpınar'),(852,65,'Muradiye'),(853,65,'Özalp'),(854,65,'Saray'),(855,65,'Van'),(856,66,'Akdağmadeni'),(857,66,'Aydıncık'),(858,66,'Boğazlıyan'),(859,66,'Çandır'),(860,66,'Çayıralan'),(861,66,'Çekerek'),(862,66,'Kadışehri'),(863,66,'Saraykent'),(864,66,'Sarıkaya'),(865,66,'Sorgun'),(866,66,'Şefaatli'),(867,66,'Yenifakılı'),(868,66,'Yerköy'),(869,66,'Yozgat'),(870,67,'Alaplı'),(871,67,'Çaycuma'),(872,67,'Devrek'),(873,67,'Gökçebey'),(874,67,'Karadenizereğli'),(875,67,'Zonguldak'),(876,68,'Ağaçören'),(877,68,'Aksaray'),(878,68,'Eskil'),(879,68,'Gülağaç(Ağaçlı)'),(880,68,'Güzelyurt'),(881,68,'Ortaköy'),(882,68,'Sarıyahşi'),(883,69,'Aydıntepe'),(884,69,'Bayburt'),(885,69,'Demirözü'),(886,70,'Ayrancı'),(887,70,'Başyayla'),(888,70,'Ermenek'),(889,70,'Karaman'),(890,70,'Kazımkarabekir'),(891,70,'Sarıveliler'),(892,71,'Bahşili'),(893,71,'Balışeyh'),(894,71,'Çelebi'),(895,71,'Delice'),(896,71,'Karakeçili'),(897,71,'Keskin'),(898,71,'Kırıkkale'),(899,71,'Sulakyurt'),(900,71,'Yahşihan'),(901,72,'Batman'),(902,72,'Beşiri'),(903,72,'Gercüş'),(904,72,'Hasankeyf'),(905,72,'Kozluk'),(906,72,'Sason'),(907,73,'Beytüşşebap'),(908,73,'Cizre'),(909,73,'Güçlükonak'),(910,73,'İdil'),(911,73,'Silopi'),(912,73,'Şırnak'),(913,73,'Uludere'),(914,74,'Amasra'),(915,74,'Bartın'),(916,74,'Kurucaşile'),(917,74,'Ulus'),(918,75,'Ardahan'),(919,75,'Çıldır'),(920,75,'Damal'),(921,75,'Göle'),(922,75,'Hanak'),(923,75,'Posof'),(924,76,'Aralık'),(925,76,'Iğdır'),(926,76,'Karakoyunlu'),(927,76,'Tuzluca'),(928,77,'Altınova'),(929,77,'Armutlu'),(930,77,'Çınarcık'),(931,77,'Çiftlikköy'),(932,77,'Termal'),(933,77,'Yalova'),(934,78,'Eflani'),(935,78,'Eskipazar'),(936,78,'Karabük'),(937,78,'Ovacık'),(938,78,'Safranbolu'),(939,78,'Yenice'),(940,79,'Elbeyli'),(941,79,'Kilis'),(942,79,'Musabeyli'),(943,79,'Polateli'),(944,80,'Bahçe'),(945,80,'Düziçi'),(946,80,'Hasanbeyli'),(947,80,'Kadirli'),(948,80,'Osmaniye'),(949,80,'Sumbas'),(950,80,'Toprakkale'),(951,81,'Akçakoca'),(952,81,'Cumayeri'),(953,81,'Çilimli'),(954,81,'Düzce'),(955,81,'Gölyaka'),(956,81,'Gümüşova'),(957,81,'Kaynaşlı'),(958,81,'Yığılca');
/*!40000 ALTER TABLE `ilce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanicilar`
--

DROP TABLE IF EXISTS `kullanicilar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanicilar` (
  `MusteriMail` varchar(255) NOT NULL,
  `MusteriSifre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MusteriMail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanicilar`
--

LOCK TABLES `kullanicilar` WRITE;
/*!40000 ALTER TABLE `kullanicilar` DISABLE KEYS */;
INSERT INTO `kullanicilar` VALUES ('osmanozceylan@gmail.com','Osman123');
/*!40000 ALTER TABLE `kullanicilar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musteriler`
--

DROP TABLE IF EXISTS `musteriler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musteriler` (
  `MusteriID` int NOT NULL AUTO_INCREMENT,
  `MusteriIsimSoyisim` varchar(100) NOT NULL,
  `MusteriMail` varchar(100) NOT NULL,
  `MusteriSifre` varchar(255) NOT NULL,
  `KayitTarihi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MusteriID`),
  UNIQUE KEY `MusteriMail` (`MusteriMail`)
) ENGINE=InnoDB AUTO_INCREMENT=46334 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musteriler`
--

LOCK TABLES `musteriler` WRITE;
/*!40000 ALTER TABLE `musteriler` DISABLE KEYS */;
INSERT INTO `musteriler` VALUES (8727,'Deneme','deneme@gmail.com','Deneme123','2025-01-04 22:29:45'),(38856,'Osman Ali Özceylan','osmanozceylan@gmail.com','Osman.2205','2025-01-02 21:58:35'),(46333,'Burak Yılmaz','burak34.37yilmaz@gmail.com','Burak123','2025-01-04 22:19:45');
/*!40000 ALTER TABLE `musteriler` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-05  1:45:58
