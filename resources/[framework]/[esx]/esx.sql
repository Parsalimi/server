-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           10.1.38-MariaDB - mariadb.org binary distribution
-- Server OS:        essentialmode            Win64
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for essentialmode
CREATE DATABASE IF NOT EXISTS `essentialmode` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `essentialmode`;

-- Dumping structure for table essentialmode.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.addon_account: ~21 rows (approximately)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
REPLACE INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Livret Bleu', 0),
	('caution', 'Caution', 0),
	('property_black_money', 'Argent Sale Propriété', 0),
	('society_ambulance', 'Ambulance', 1),
	('society_avocat', 'Advokat', 1),
	('society_banker', 'Banque', 1),
	('society_bishops', 'Bishops', 1),
	('society_cardealer', 'Concessionnaire', 1),
	('society_dismay', 'Dismay', 1),
	('society_dock', 'Marina', 1),
	('society_fire', 'fire', 1),
	('society_foodtruck', 'Foodtruck', 1),
	('society_grove', 'Grove', 1),
	('society_mafia', 'Mafia', 1),
	('society_mechanic', 'Mécano', 1),
	('society_police', 'Police', 1),
	('society_realestateagent', 'Agent immobilier', 1),
	('society_rebel', 'Rebel', 1),
	('society_taxi', 'Taxi', 1),
	('society_unicorn', 'Unicorn', 1),
	('society_vigne', 'Winegrower', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.addon_account_data: ~24 rows (approximately)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
REPLACE INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_ambulance', 0, NULL),
	(2, 'society_avocat', 0, NULL),
	(3, 'society_banker', 0, NULL),
	(4, 'society_bishops', 0, NULL),
	(5, 'society_cardealer', 0, NULL),
	(6, 'society_dismay', 0, NULL),
	(7, 'society_fire', 0, NULL),
	(8, 'society_foodtruck', 0, NULL),
	(9, 'society_grove', 0, NULL),
	(10, 'society_mafia', 0, NULL),
	(11, 'society_mechanic', 400, NULL),
	(12, 'society_police', 0, NULL),
	(13, 'society_realestateagent', 0, NULL),
	(14, 'society_rebel', 0, NULL),
	(15, 'society_taxi', 0, NULL),
	(16, 'society_unicorn', 0, NULL),
	(17, 'society_vigne', 0, NULL),
	(18, 'society_dock', 0, NULL),
	(19, 'bank_savings', 0, 'steam:11000013c742c7c'),
	(20, 'property_black_money', 0, 'steam:11000013c742c7c'),
	(21, 'caution', 0, 'steam:11000013c742c7c'),
	(22, 'bank_savings', 0, 'steam:11000010ef561cd'),
	(23, 'caution', 0, 'steam:11000010ef561cd'),
	(24, 'property_black_money', 0, 'steam:11000010ef561cd');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.addon_inventory: ~17 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
REPLACE INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('property', 'Propriété', 0),
	('society_ambulance', 'Ambulance', 1),
	('society_avocat', 'Advokat', 1),
	('society_bishops', 'Bishops', 1),
	('society_cardealer', 'Concesionnaire', 1),
	('society_dismay', 'Dismay', 1),
	('society_dock', 'Marina', 1),
	('society_fire', 'fire', 1),
	('society_grove', 'Grove', 1),
	('society_mafia', 'Mafia', 1),
	('society_mechanic', 'Mécano', 1),
	('society_police', 'Police', 1),
	('society_rebel', 'Rebel', 1),
	('society_taxi', 'Taxi', 1),
	('society_unicorn', 'Unicorn', 1),
	('society_unicorn_fridge', 'Unicorn (frigo)', 1),
	('society_vigne', 'Winegrower', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.addon_inventory_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumping structure for table essentialmode.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.billing: ~0 rows (approximately)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumping structure for table essentialmode.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.cardealer_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `height` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.characters: ~2 rows (approximately)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
REPLACE INTO `characters` (`id`, `identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`) VALUES
	(1, 'steam:11000013c742c7c', 'Ruben', 'Ribeiro', '2001-02-04', 'm', '200'),
	(2, 'steam:11000010ef561cd', 'Tony ', 'Mirandelas', '541561516', 'm', '145');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table essentialmode.coffees
CREATE TABLE IF NOT EXISTS `coffees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.coffees: ~0 rows (approximately)
/*!40000 ALTER TABLE `coffees` DISABLE KEYS */;
REPLACE INTO `coffees` (`id`, `name`, `item`, `price`) VALUES
	(1, 'Coffee', 'coffee', 30);
/*!40000 ALTER TABLE `coffees` ENABLE KEYS */;

-- Dumping structure for table essentialmode.darkshops
CREATE TABLE IF NOT EXISTS `darkshops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.darkshops: ~0 rows (approximately)
/*!40000 ALTER TABLE `darkshops` DISABLE KEYS */;
REPLACE INTO `darkshops` (`id`, `name`, `item`, `price`) VALUES
	(1, 'Darks', 'Darknet', 15);
/*!40000 ALTER TABLE `darkshops` ENABLE KEYS */;

-- Dumping structure for table essentialmode.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.datastore: ~17 rows (approximately)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
REPLACE INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Propriété', 0),
	('society_ambulance', 'Ambulance', 1),
	('society_avocat', 'Advokat', 1),
	('society_bishops', 'Bishops', 1),
	('society_dismay', 'Dismay', 1),
	('society_fire', 'fire', 1),
	('society_grove', 'Grove', 1),
	('society_mafia', 'Mafia', 1),
	('society_police', 'Police', 1),
	('society_rebel', 'Rebel', 1),
	('society_taxi', 'Taxi', 1),
	('society_unicorn', 'Unicorn', 1),
	('society_vigne', 'Winegrower', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for table essentialmode.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.datastore_data: ~22 rows (approximately)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
REPLACE INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_ambulance', NULL, '{}'),
	(2, 'society_avocat', NULL, '{}'),
	(3, 'society_bishops', NULL, '{}'),
	(4, 'society_dismay', NULL, '{}'),
	(5, 'society_fire', NULL, '{}'),
	(6, 'society_grove', NULL, '{}'),
	(7, 'society_mafia', NULL, '{}'),
	(8, 'society_police', NULL, '{}'),
	(9, 'society_rebel', NULL, '{}'),
	(10, 'society_taxi', NULL, '{}'),
	(11, 'society_unicorn', NULL, '{}'),
	(12, 'society_vigne', NULL, '{}'),
	(13, 'property', 'steam:11000013c742c7c', '{}'),
	(14, 'user_ears', 'steam:11000013c742c7c', '{}'),
	(15, 'user_helmet', 'steam:11000013c742c7c', '{}'),
	(16, 'user_glasses', 'steam:11000013c742c7c', '{}'),
	(17, 'user_mask', 'steam:11000013c742c7c', '{}'),
	(18, 'user_ears', 'steam:11000010ef561cd', '{}'),
	(19, 'property', 'steam:11000010ef561cd', '{}'),
	(20, 'user_glasses', 'steam:11000010ef561cd', '{}'),
	(21, 'user_helmet', 'steam:11000010ef561cd', '{}'),
	(22, 'user_mask', 'steam:11000010ef561cd', '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumping structure for table essentialmode.dock
CREATE TABLE IF NOT EXISTS `dock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.dock: ~14 rows (approximately)
/*!40000 ALTER TABLE `dock` DISABLE KEYS */;
REPLACE INTO `dock` (`id`, `name`, `model`, `price`, `category`) VALUES
	(1, 'Seashark', 'seashark', 1500, 'dock'),
	(2, 'Seashark2', 'seashark2', 1500, 'dock'),
	(3, 'Yacht Seashark', 'seashark3', 1500, 'dock'),
	(4, 'Suntrap', 'suntrap', 1500, 'dock'),
	(5, 'Dinghy', 'dinghy', 2500, 'dock'),
	(6, 'Dinghy2 ', 'dinghy2', 2500, 'dock'),
	(7, 'Yacht Dinghy', 'dinghy4', 1500, 'dock'),
	(8, 'Tropic', 'tropic', 10000, 'dock'),
	(9, 'Yacht Tropic', 'tropic2', 10000, 'dock'),
	(10, 'Squalo', 'squalo', 12000, 'dock'),
	(11, 'Yacht Toro', 'toro2', 15000, 'dock'),
	(12, 'Toro', 'toro', 15000, 'dock'),
	(13, 'Jetmax', 'jetmax', 17500, 'dock'),
	(14, 'Voilier Marquis', 'marquis', 45500, 'dock');
/*!40000 ALTER TABLE `dock` ENABLE KEYS */;

-- Dumping structure for table essentialmode.dock_categories
CREATE TABLE IF NOT EXISTS `dock_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.dock_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `dock_categories` DISABLE KEYS */;
REPLACE INTO `dock_categories` (`id`, `name`, `label`) VALUES
	(1, 'dock', 'Bateaux');
/*!40000 ALTER TABLE `dock_categories` ENABLE KEYS */;

-- Dumping structure for table essentialmode.dock_vehicles
CREATE TABLE IF NOT EXISTS `dock_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.dock_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `dock_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `dock_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.fine_types: ~52 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
REPLACE INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Usage abusif du klaxon', 30, 0),
	(2, 'Franchir une ligne continue', 40, 0),
	(3, 'Circulation à contresens', 250, 0),
	(4, 'Demi-tour non autorisé', 250, 0),
	(5, 'Circulation hors-route', 170, 0),
	(6, 'Non-respect des distances de sécurité', 30, 0),
	(7, 'Arrêt dangereux / interdit', 150, 0),
	(8, 'Stationnement gênant / interdit', 70, 0),
	(9, 'Non respect  de la priorité à droite', 70, 0),
	(10, 'Non-respect à un véhicule prioritaire', 90, 0),
	(11, 'Non-respect d\'un stop', 105, 0),
	(12, 'Non-respect d\'un feu rouge', 130, 0),
	(13, 'Dépassement dangereux', 100, 0),
	(14, 'Véhicule non en état', 100, 0),
	(15, 'Conduite sans permis', 1500, 0),
	(16, 'Délit de fuite', 800, 0),
	(17, 'Excès de vitesse < 5 kmh', 90, 0),
	(18, 'Excès de vitesse 5-15 kmh', 120, 0),
	(19, 'Excès de vitesse 15-30 kmh', 180, 0),
	(20, 'Excès de vitesse > 30 kmh', 300, 0),
	(21, 'Entrave de la circulation', 110, 1),
	(22, 'Dégradation de la voie publique', 90, 1),
	(23, 'Trouble à l\'ordre publique', 90, 1),
	(24, 'Entrave opération de police', 130, 1),
	(25, 'Insulte envers / entre civils', 75, 1),
	(26, 'Outrage à agent de police', 110, 1),
	(27, 'Menace verbale ou intimidation envers civil', 90, 1),
	(28, 'Menace verbale ou intimidation envers policier', 150, 1),
	(29, 'Manifestation illégale', 250, 1),
	(30, 'Tentative de corruption', 1500, 1),
	(31, 'Arme blanche sortie en ville', 120, 2),
	(32, 'Arme léthale sortie en ville', 300, 2),
	(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
	(34, 'Port d\'arme illégal', 700, 2),
	(35, 'Pris en flag lockpick', 300, 2),
	(36, 'Vol de voiture', 1800, 2),
	(37, 'Vente de drogue', 1500, 2),
	(38, 'Fabriquation de drogue', 1500, 2),
	(39, 'Possession de drogue', 650, 2),
	(40, 'Prise d\'ôtage civil', 1500, 2),
	(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
	(42, 'Braquage particulier', 650, 2),
	(43, 'Braquage magasin', 650, 2),
	(44, 'Braquage de banque', 1500, 2),
	(45, 'Tir sur civil', 2000, 3),
	(46, 'Tir sur agent de l\'état', 2500, 3),
	(47, 'Tentative de meurtre sur civil', 3000, 3),
	(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
	(49, 'Meurtre sur civil', 10000, 3),
	(50, 'Meurte sur agent de l\'état', 30000, 3),
	(51, 'Meurtre involontaire', 1800, 3),
	(52, 'Escroquerie à l\'entreprise', 2000, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table essentialmode.fine_types_bishops
CREATE TABLE IF NOT EXISTS `fine_types_bishops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.fine_types_bishops: ~7 rows (approximately)
/*!40000 ALTER TABLE `fine_types_bishops` DISABLE KEYS */;
REPLACE INTO `fine_types_bishops` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Raket', 3000, 0),
	(2, 'Raket', 5000, 0),
	(3, 'Raket', 10000, 1),
	(4, 'Raket', 20000, 1),
	(5, 'Raket', 50000, 2),
	(6, 'Raket', 150000, 3),
	(7, 'Raket', 350000, 3);
/*!40000 ALTER TABLE `fine_types_bishops` ENABLE KEYS */;

-- Dumping structure for table essentialmode.fine_types_dismay
CREATE TABLE IF NOT EXISTS `fine_types_dismay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.fine_types_dismay: ~7 rows (approximately)
/*!40000 ALTER TABLE `fine_types_dismay` DISABLE KEYS */;
REPLACE INTO `fine_types_dismay` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Raket', 3000, 0),
	(2, 'Raket', 5000, 0),
	(3, 'Raket', 10000, 1),
	(4, 'Raket', 20000, 1),
	(5, 'Raket', 50000, 2),
	(6, 'Raket', 150000, 3),
	(7, 'Raket', 350000, 3);
/*!40000 ALTER TABLE `fine_types_dismay` ENABLE KEYS */;

-- Dumping structure for table essentialmode.fine_types_grove
CREATE TABLE IF NOT EXISTS `fine_types_grove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.fine_types_grove: ~7 rows (approximately)
/*!40000 ALTER TABLE `fine_types_grove` DISABLE KEYS */;
REPLACE INTO `fine_types_grove` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Raket', 3000, 0),
	(2, 'Raket', 5000, 0),
	(3, 'Raket', 10000, 1),
	(4, 'Raket', 20000, 1),
	(5, 'Raket', 50000, 2),
	(6, 'Raket', 150000, 3),
	(7, 'Raket', 350000, 3);
/*!40000 ALTER TABLE `fine_types_grove` ENABLE KEYS */;

-- Dumping structure for table essentialmode.fine_types_mafia
CREATE TABLE IF NOT EXISTS `fine_types_mafia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.fine_types_mafia: ~7 rows (approximately)
/*!40000 ALTER TABLE `fine_types_mafia` DISABLE KEYS */;
REPLACE INTO `fine_types_mafia` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Raket', 3000, 0),
	(2, 'Raket', 5000, 0),
	(3, 'Raket', 10000, 1),
	(4, 'Raket', 20000, 1),
	(5, 'Raket', 50000, 2),
	(6, 'Raket', 150000, 3),
	(7, 'Raket', 350000, 3);
/*!40000 ALTER TABLE `fine_types_mafia` ENABLE KEYS */;

-- Dumping structure for table essentialmode.fine_types_rebel
CREATE TABLE IF NOT EXISTS `fine_types_rebel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.fine_types_rebel: ~7 rows (approximately)
/*!40000 ALTER TABLE `fine_types_rebel` DISABLE KEYS */;
REPLACE INTO `fine_types_rebel` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Raket', 3000, 0),
	(2, 'Raket', 5000, 0),
	(3, 'Raket', 10000, 1),
	(4, 'Raket', 20000, 1),
	(5, 'Raket', 50000, 2),
	(6, 'Raket', 150000, 3),
	(7, 'Raket', 350000, 3);
/*!40000 ALTER TABLE `fine_types_rebel` ENABLE KEYS */;

-- Dumping structure for table essentialmode.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.items: ~86 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
REPLACE INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('alive_chicken', 'Poulet vivant', 20, 0, 1),
	('bait', 'Bait', 20, 0, 1),
	('bandage', 'Bandage', 20, 0, 1),
	('binoculars', 'Binoculars', 1, 0, 1),
	('blowpipe', 'Chalumeaux', 10, 0, 1),
	('bolcacahuetes', 'Bol de cacahuètes', 5, 0, 1),
	('bolchips', 'Bol de chips', 5, 0, 1),
	('bolnoixcajou', 'Bol de noix de cajou', 5, 0, 1),
	('bolpistache', 'Bol de pistaches', 5, 0, 1),
	('bread', 'Pain', 10, 0, 1),
	('burger', 'Burger', 20, 0, 1),
	('cannabis', 'Cannabis', 40, 0, 1),
	('carokit', 'Kit carosserie', 3, 0, 1),
	('carotool', 'outils carosserie', 4, 0, 1),
	('clothe', 'Vêtement', 40, 0, 1),
	('cola', 'Coke', 20, 0, 1),
	('contrat', 'Salvage', 15, 0, 1),
	('copper', 'Cuivre', 56, 0, 1),
	('croquettes', 'Croquettes', 20, 0, 1),
	('cutted_wood', 'Bois coupé', 20, 0, 1),
	('diamond', 'Diamant', 50, 0, 1),
	('drpepper', 'Dr. Pepper', 5, 0, 1),
	('energy', 'Energy Drink', 5, 0, 1),
	('essence', 'Essence', 24, 0, 1),
	('fabric', 'Tissu', 80, 0, 1),
	('fish', 'Poisson', 100, 0, 1),
	('fishingrod', 'Fishing rod', 5, 0, 1),
	('fixkit', 'Kit réparation', 5, 0, 1),
	('fixtool', 'outils réparation', 6, 0, 1),
	('gazbottle', 'bouteille de gaz', 11, 0, 1),
	('gold', 'Or', 21, 0, 1),
	('golem', 'Golem', 5, 0, 1),
	('grand_cru', 'Vintage Bottle', -1, 0, 1),
	('grapperaisin', 'Grappe de raisin', 5, 0, 1),
	('ice', 'Glaçon', 5, 0, 1),
	('icetea', 'Ice Tea', 5, 0, 1),
	('iron', 'Fer', 42, 0, 1),
	('jager', 'Jägermeister', 5, 0, 1),
	('jagerbomb', 'Jägerbomb', 5, 0, 1),
	('jagercerbere', 'Jäger Cerbère', 3, 0, 1),
	('jewels', 'Jewels', -1, 0, 1),
	('journal', 'Journal', -1, 0, 1),
	('jusfruit', 'Jus de fruits', 5, 0, 1),
	('jus_raisin', 'Grape juice', -1, 0, 1),
	('limonade', 'Limonade', 5, 0, 1),
	('litter', 'Litter', -1, 0, 1),
	('litter_pooch', 'Pochon de LITTER', -1, 0, 1),
	('lsd', 'Lsd', -1, 0, 1),
	('lsd_pooch', 'Pochon de LSD', -1, 0, 1),
	('marijuana', 'Marijuana', 14, 0, 1),
	('martini', 'Martini blanc', 5, 0, 1),
	('meat', 'Meat', 20, 0, 1),
	('medikit', 'Medikit', 5, 0, 1),
	('menthe', 'Feuille de menthe', 10, 0, 1),
	('metreshooter', 'Mètre de shooter', 3, 0, 1),
	('mixapero', 'Mix Apéritif', 3, 0, 1),
	('mojito', 'Mojito', 5, 0, 1),
	('packaged_chicken', 'Poulet en barquette', 100, 0, 1),
	('packaged_plank', 'Paquet de planches', 100, 0, 1),
	('petrol', 'Pétrole', 24, 0, 1),
	('petrol_raffin', 'Pétrole Raffiné', 24, 0, 1),
	('plongee1', 'Plongee courte', -1, 0, 1),
	('plongee2', 'Plongee longue', -1, 0, 1),
	('raisin', 'Grapes', -1, 0, 1),
	('rhum', 'Rhum', 5, 0, 1),
	('rhumcoca', 'Rhum-coca', 5, 0, 1),
	('rhumfruit', 'Rhum-jus de fruits', 5, 0, 1),
	('saucisson', 'Saucisson', 5, 0, 1),
	('slaughtered_chicken', 'Poulet abattu', 20, 0, 1),
	('soda', 'Soda', 5, 0, 1),
	('stone', 'Pierre', 7, 0, 1),
	('tacos', 'Tacos', 20, 0, 1),
	('teqpaf', 'Teq\'paf', 5, 0, 1),
	('tequila', 'Tequila', 5, 0, 1),
	('vegetables', 'Vegetables', 20, 0, 1),
	('vine', 'Vine', -1, 0, 1),
	('vodka', 'Vodka', 5, 0, 1),
	('vodkaenergy', 'Vodka-energy', 5, 0, 1),
	('vodkafruit', 'Vodka-jus de fruits', 5, 0, 1),
	('washed_stone', 'Pierre Lavée', 7, 0, 1),
	('water', 'Eau', 5, 0, 1),
	('whisky', 'Whisky', 5, 0, 1),
	('whiskycoca', 'Whisky-coca', 5, 0, 1),
	('wood', 'Bois', 20, 0, 1),
	('wool', 'Laine', 40, 0, 1),
	('xanax', 'Xanax', -1, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table essentialmode.jail
CREATE TABLE IF NOT EXISTS `jail` (
  `identifier` varchar(100) NOT NULL,
  `jail_time` int(10) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.jail: ~0 rows (approximately)
/*!40000 ALTER TABLE `jail` DISABLE KEYS */;
/*!40000 ALTER TABLE `jail` ENABLE KEYS */;

-- Dumping structure for table essentialmode.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.jobs: ~34 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
REPLACE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'Ambulance', 0),
	('avocat', 'Advokat', 1),
	('banker', 'Banquier', 0),
	('bishops', 'Bishops', 1),
	('bus', 'busdriver', 0),
	('cardealer', 'Concessionnaire', 0),
	('coastguard', 'coastguard', 0),
	('deliverer', 'Deliverer', 0),
	('dismay', 'Dismay', 1),
	('dock', 'Marina', 0),
	('fire', 'LSFD', 0),
	('fisherman', 'Pêcheur', 0),
	('foodtruck', 'Foodtruck', 1),
	('fueler', 'Raffineur', 0),
	('gopostal', 'Correios', 0),
	('grove', 'Grove', 1),
	('lumberjack', 'Bûcheron', 0),
	('mafia', 'Mafia', 1),
	('mechanic', 'Mécano', 0),
	('miner', 'Mineur', 0),
	('pizza', '?Pizzadelivery', 0),
	('police', 'LSPD', 0),
	('poolcleaner', 'Nettoyeur de piscine', 0),
	('realestateagent', 'Agent immobilier', 0),
	('rebel', 'Rebel', 1),
	('reporter', 'Journaliste', 0),
	('Salvage', 'Salvage', 0),
	('slaughterer', 'Abatteur', 0),
	('tailor', 'Couturier', 0),
	('taxi', 'Taxi', 0),
	('trucker', 'Chauffeur', 0),
	('unemployed', 'Unemployed', 0),
	('unicorn', 'Unicorn', 1),
	('vigne', 'Winegrower', 1);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table essentialmode.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.job_grades: ~87 rows (approximately)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
REPLACE INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
	(2, 'lumberjack', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	(3, 'fisherman', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	(4, 'fueler', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	(5, 'reporter', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	(6, 'tailor', 0, 'employee', 'Intérimaire', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(7, 'miner', 0, 'employee', 'Intérimaire', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(8, 'slaughterer', 0, 'employee', 'Intérimaire', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(9, 'ambulance', 0, 'ambulance', 'Ambulancier', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(10, 'ambulance', 1, 'doctor', 'Medecin', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(11, 'ambulance', 2, 'chief_doctor', 'Medecin-chef', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(12, 'ambulance', 3, 'boss', 'Chirurgien', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(13, 'banker', 0, 'advisor', 'Conseiller', 10, '{}', '{}'),
	(14, 'banker', 1, 'banker', 'Banquier', 20, '{}', '{}'),
	(15, 'banker', 2, 'business_banker', 'Banquier d\'affaire', 30, '{}', '{}'),
	(16, 'banker', 3, 'trader', 'Trader', 40, '{}', '{}'),
	(17, 'banker', 4, 'boss', 'Patron', 0, '{}', '{}'),
	(18, 'bishops', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
	(19, 'bishops', 1, 'capo', 'Capo', 1800, '{}', '{}'),
	(20, 'bishops', 2, 'consigliere', 'Consigliere', 2100, '{}', '{}'),
	(21, 'bishops', 3, 'boss', 'Parain', 2700, '{}', '{}'),
	(22, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
	(23, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(24, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
	(25, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}'),
	(26, 'bus', 0, 'employee', 'Valores', 200, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	(27, 'coastguard', 0, 'employee', 'Valores', 200, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	(28, 'deliverer', 0, 'employee', 'Employee', 200, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	(29, 'dismay', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
	(30, 'dismay', 1, 'capo', 'Capo', 1800, '{}', '{}'),
	(31, 'dismay', 2, 'consigliere', 'Consigliere', 2100, '{}', '{}'),
	(32, 'dismay', 3, 'boss', 'Parain', 2700, '{}', '{}'),
	(33, 'fire', 0, 'recruit', 'Recrue', 20, '{"tshirt_1":57,"torso_1":55,"arms":0,"pants_1":35,"glasses":0,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":5,"face":19,"glasses_2":1,"torso_2":0,"shoes":24,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":8}', '{"tshirt_1":34,"torso_1":48,"shoes":24,"pants_1":34,"torso_2":0,"decals_2":0,"hair_color_2":0,"glasses":0,"helmet_2":0,"hair_2":3,"face":21,"decals_1":0,"glasses_2":1,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"pants_2":0,"arms":14,"hair_color_1":10,"tshirt_2":0,"helmet_1":57}'),
	(34, 'fire', 1, 'sergeant', 'Sergent', 40, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":1,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"arms":0,"decals_1":8,"torso_2":0,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"hair_color_1":5,"glasses":0,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":14,"pants_1":34,"pants_2":0,"decals_2":1,"hair_color_2":0,"shoes":24,"helmet_2":0,"hair_2":3,"decals_1":7,"torso_2":0,"face":21,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"glasses_2":1,"hair_color_1":10,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(35, 'fire', 2, 'lieutenant', 'Lieutenant', 65, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":2,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"glasses":0,"decals_1":8,"hair_color_1":5,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"torso_2":0,"arms":41,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":44,"pants_1":34,"hair_2":3,"decals_2":2,"hair_color_2":0,"hair_color_1":10,"helmet_2":0,"face":21,"shoes":24,"torso_2":0,"glasses_2":1,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"pants_2":0,"decals_1":7,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(36, 'fire', 3, 'boss', 'Commandant', 80, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":3,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"arms":41,"torso_2":0,"hair_color_1":5,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"decals_1":8,"glasses":0,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":44,"pants_1":34,"pants_2":0,"decals_2":3,"hair_color_2":0,"face":21,"helmet_2":0,"hair_2":3,"decals_1":7,"torso_2":0,"hair_color_1":10,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"glasses_2":1,"shoes":24,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(37, 'foodtruck', 0, 'cook', 'Cook', 200, '{}', '{}'),
	(38, 'foodtruck', 1, 'boss', 'Owner', 300, '{}', '{}'),
	(39, 'gopostal', 0, 'employee', 'Sedex', 200, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	(40, 'grove', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
	(41, 'grove', 1, 'capo', 'Capo', 1800, '{}', '{}'),
	(42, 'grove', 2, 'consigliere', 'Consigliere', 2100, '{}', '{}'),
	(43, 'grove', 3, 'boss', 'Parain', 2700, '{}', '{}'),
	(83, 'avocat', 0, 'boss', 'Patron', 500, '', ''),
	(84, 'mechanic', 0, 'recrue', 'Recrue', 12, '{}', '{}'),
	(85, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
	(86, 'mechanic', 2, 'experimente', 'Experimente', 36, '{}', '{}'),
	(87, 'mechanic', 3, 'chief', 'Chef d\'équipe', 48, '{}', '{}'),
	(88, 'mechanic', 4, 'boss', 'Patron', 0, '{}', '{}'),
	(89, 'Salvage', 0, 'interim', 'Diver', 80, '{}', '{}'),
	(90, 'pizza', 0, 'employee', 'Valores', 200, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	(91, 'police', 0, 'recruit', 'Recrue', 20, '{}', '{}'),
	(92, 'police', 1, 'officer', 'Officier', 40, '{}', '{}'),
	(93, 'police', 2, 'sergeant', 'Sergent', 60, '{}', '{}'),
	(94, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
	(95, 'police', 4, 'boss', 'Commandant', 100, '{}', '{}'),
	(96, 'poolcleaner', 0, 'interim', 'Intérimaire', 400, '{}', '{}'),
	(97, 'realestateagent', 0, 'location', 'Location', 10, '{}', '{}'),
	(98, 'realestateagent', 1, 'vendeur', 'Vendeur', 25, '{}', '{}'),
	(99, 'realestateagent', 2, 'gestion', 'Gestion', 40, '{}', '{}'),
	(100, 'realestateagent', 3, 'boss', 'Patron', 0, '{}', '{}'),
	(101, 'mafia', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
	(102, 'mafia', 1, 'capo', 'Capo', 1800, '{}', '{}'),
	(103, 'mafia', 2, 'consigliere', 'Consigliere', 2100, '{}', '{}'),
	(104, 'mafia', 3, 'boss', 'Parain', 2700, '{}', '{}'),
	(105, 'rebel', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
	(106, 'rebel', 1, 'capo', 'Capo', 1800, '{}', '{}'),
	(107, 'rebel', 2, 'consigliere', 'Consigliere', 2100, '{}', '{}'),
	(108, 'rebel', 3, 'boss', 'Parain', 2700, '{}', '{}'),
	(109, 'taxi', 0, 'recrue', 'Recrue', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(110, 'taxi', 1, 'novice', 'Novice', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(111, 'taxi', 2, 'experimente', 'Experimente', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(112, 'taxi', 3, 'uber', 'Uber', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(113, 'taxi', 4, 'boss', 'Patron', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(114, 'trucker', 0, 'employee', 'Employé', 200, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	(115, 'unicorn', 0, 'barman', 'Barman', 300, '{}', '{}'),
	(116, 'unicorn', 1, 'dancer', 'Danseur', 300, '{}', '{}'),
	(117, 'unicorn', 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
	(118, 'unicorn', 3, 'boss', 'Gérant', 600, '{}', '{}'),
	(119, 'vigne', 0, 'recrue', 'Interim', 500, '{"tshirt_1":59,"tshirt_2":0,"torso_1":12,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(120, 'vigne', 1, 'novice', 'Winegrower', 750, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(121, 'vigne', 2, 'cdisenior', 'Team boss', 1200, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(122, 'vigne', 3, 'boss', 'Boss', 1600, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":15,"tshirt_2":0,"torso_1":14,"torso_2":15,"shoes_1":12,"shoes_2":0,"pants_1":9, "pants_2":5, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(123, 'dock', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
	(124, 'dock', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(125, 'dock', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
	(126, 'dock', 3, 'boss', 'Patron', 0, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for table essentialmode.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.licenses: ~7 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
REPLACE INTO `licenses` (`type`, `label`) VALUES
	('boat', 'Boat License'),
	('dmv', 'Code de la route'),
	('drive', 'Permis de conduire'),
	('drive_bike', 'Permis moto'),
	('drive_truck', 'Permis camion'),
	('weapon', 'Permis de port d\'arme'),
	('weed_processing', 'Weed Processing License');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for table essentialmode.owned_dock
CREATE TABLE IF NOT EXISTS `owned_dock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.owned_dock: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_dock` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_dock` ENABLE KEYS */;

-- Dumping structure for table essentialmode.owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.owned_properties: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties` ENABLE KEYS */;

-- Dumping structure for table essentialmode.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'State of the car',
  `stored` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Etat de la voiture',
  `garage_name` varchar(50) NOT NULL DEFAULT 'Garage_Centre',
  `fourrieremecano` tinyint(1) NOT NULL DEFAULT '0',
  `vehiclename` varchar(50) NOT NULL DEFAULT 'voiture',
  `plate` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'car',
  PRIMARY KEY (`plate`),
  KEY `vehsowned` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.owned_vehicles: ~1 rows (approximately)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
REPLACE INTO `owned_vehicles` (`vehicle`, `owner`, `state`, `stored`, `garage_name`, `fourrieremecano`, `vehiclename`, `plate`, `type`) VALUES
	('{"modTurbo":false,"wheelColor":156,"modRearBumper":-1,"modFrontWheels":-1,"modTransmission":-1,"tyreSmokeColor":[255,255,255],"fuelLevel":65.0,"modRightFender":-1,"modArmor":-1,"pearlescentColor":111,"modSpoilers":-1,"modSteeringWheel":-1,"modWindows":-1,"dirtLevel":11.0,"neonColor":[255,0,255],"wheels":0,"modAirFilter":-1,"modExhaust":-1,"color2":0,"modArchCover":-1,"modRoof":-1,"color1":6,"plateIndex":0,"modBrakes":-1,"modBackWheels":-1,"modOrnaments":-1,"modSpeakers":-1,"bodyHealth":1000.0,"plate":"KLE 274","extras":{"12":false,"10":false},"modEngine":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modTank":-1,"engineHealth":1000.0,"modSuspension":-1,"modTrunk":-1,"modTrimA":-1,"modHydrolic":-1,"modShifterLeavers":-1,"modFender":-1,"neonEnabled":[false,false,false,false],"modHorns":-1,"modSeats":-1,"modAerials":-1,"modDoorSpeaker":-1,"modFrame":-1,"windowTint":-1,"modTrimB":-1,"modStruts":-1,"modVanityPlate":-1,"modXenon":false,"modPlateHolder":-1,"modHood":-1,"modDashboard":-1,"modSmokeEnabled":1,"model":-344943009,"modAPlate":-1,"modFrontBumper":-1,"modDial":-1,"modLivery":-1,"modGrille":-1}', 'steam:11000013c742c7c', 1, 0, 'Garage_Centre', 0, 'voiture', 'KLE 274', 'car');
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.owner_vehicles
CREATE TABLE IF NOT EXISTS `owner_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.owner_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `owner_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owner_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.peage_flash
CREATE TABLE IF NOT EXISTS `peage_flash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(10) NOT NULL,
  `speed` int(11) NOT NULL,
  `modele` varchar(25) NOT NULL,
  `station` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.peage_flash: 1 rows
/*!40000 ALTER TABLE `peage_flash` DISABLE KEYS */;
REPLACE INTO `peage_flash` (`id`, `plate`, `speed`, `modele`, `station`) VALUES
	(1, '09JBK526', 168, 'T20', 1);
/*!40000 ALTER TABLE `peage_flash` ENABLE KEYS */;

-- Dumping structure for table essentialmode.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.properties: ~72 rows (approximately)
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
REPLACE INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{"y":564.89,"z":182.959,"x":119.384}', '{"x":117.347,"y":559.506,"z":183.304}', '{"y":557.032,"z":183.301,"x":118.037}', '{"y":567.798,"z":182.131,"x":119.249}', '[]', NULL, 1, 1, 0, '{"x":118.748,"y":566.573,"z":175.697}', 1500000),
	(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{"x":372.796,"y":428.327,"z":144.685}', '{"x":373.548,"y":422.982,"z":144.907},', '{"y":420.075,"z":145.904,"x":372.161}', '{"x":372.454,"y":432.886,"z":143.443}', '[]', NULL, 1, 1, 0, '{"x":377.349,"y":429.422,"z":137.3}', 1500000),
	(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{"y":-379.165,"z":37.961,"x":-936.363}', '{"y":-365.476,"z":113.274,"x":-913.097}', '{"y":-367.637,"z":113.274,"x":-918.022}', '{"y":-382.023,"z":37.961,"x":-943.626}', '[]', NULL, 1, 1, 0, '{"x":-927.554,"y":-377.744,"z":112.674}', 1700000),
	(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{"y":440.8,"z":146.702,"x":346.964}', '{"y":437.456,"z":148.394,"x":341.683}', '{"y":435.626,"z":148.394,"x":339.595}', '{"x":350.535,"y":443.329,"z":145.764}', '[]', NULL, 1, 1, 0, '{"x":337.726,"y":436.985,"z":140.77}', 1500000),
	(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{"y":502.696,"z":136.421,"x":-176.003}', '{"y":497.817,"z":136.653,"x":-174.349}', '{"y":495.069,"z":136.666,"x":-173.331}', '{"y":506.412,"z":135.0664,"x":-177.927}', '[]', NULL, 1, 1, 0, '{"x":-174.725,"y":493.095,"z":129.043}', 1500000),
	(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{"y":596.58,"z":142.641,"x":-686.554}', '{"y":591.988,"z":144.392,"x":-681.728}', '{"y":590.608,"z":144.392,"x":-680.124}', '{"y":599.019,"z":142.059,"x":-689.492}', '[]', NULL, 1, 1, 0, '{"x":-680.46,"y":588.6,"z":136.769}', 1500000),
	(7, 'LowEndApartment', 'Appartement de base', '{"y":-1078.735,"z":28.4031,"x":292.528}', '{"y":-1007.152,"z":-102.002,"x":265.845}', '{"y":-1002.802,"z":-100.008,"x":265.307}', '{"y":-1078.669,"z":28.401,"x":296.738}', '[]', NULL, 1, 1, 0, '{"x":265.916,"y":-999.38,"z":-100.008}', 562500),
	(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{"y":454.955,"z":96.462,"x":-1294.433}', '{"x":-1289.917,"y":449.541,"z":96.902}', '{"y":446.322,"z":96.899,"x":-1289.642}', '{"y":455.453,"z":96.517,"x":-1298.851}', '[]', NULL, 1, 1, 0, '{"x":-1287.306,"y":455.901,"z":89.294}', 1500000),
	(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{"x":-853.346,"y":696.678,"z":147.782}', '{"y":690.875,"z":151.86,"x":-859.961}', '{"y":688.361,"z":151.857,"x":-859.395}', '{"y":701.628,"z":147.773,"x":-855.007}', '[]', NULL, 1, 1, 0, '{"x":-858.543,"y":697.514,"z":144.253}', 1500000),
	(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{"y":620.494,"z":141.588,"x":-752.82}', '{"y":618.62,"z":143.153,"x":-759.317}', '{"y":617.629,"z":143.153,"x":-760.789}', '{"y":621.281,"z":141.254,"x":-750.919}', '[]', NULL, 1, 1, 0, '{"x":-762.504,"y":618.992,"z":135.53}', 1500000),
	(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{"y":37.025,"z":42.58,"x":-618.299}', '{"y":58.898,"z":97.2,"x":-603.301}', '{"y":58.941,"z":97.2,"x":-608.741}', '{"y":30.603,"z":42.524,"x":-620.017}', '[]', NULL, 1, 1, 0, '{"x":-622.173,"y":54.585,"z":96.599}', 1700000),
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
	(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_01_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.661,"y":327.672,"z":210.396}', 1300000),
	(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_01_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.735,"y":326.757,"z":186.313}', 1300000),
	(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_01_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.386,"y":330.782,"z":195.08}', 1300000),
	(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_02_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.615,"y":327.878,"z":210.396}', 1300000),
	(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_02_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.297,"y":327.092,"z":186.313}', 1300000),
	(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_02_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.303,"y":330.932,"z":195.085}', 1300000),
	(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_03_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.885,"y":327.641,"z":210.396}', 1300000),
	(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_03_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.607,"y":327.344,"z":186.313}', 1300000),
	(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_03_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.525,"y":330.851,"z":195.085}', 1300000),
	(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_04_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.527,"y":327.89,"z":210.396}', 1300000),
	(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_04_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.642,"y":326.497,"z":186.313}', 1300000),
	(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_04_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.503,"y":331.318,"z":195.085}', 1300000),
	(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_05_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.289,"y":328.086,"z":210.396}', 1300000),
	(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_05_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.692,"y":326.762,"z":186.313}', 1300000),
	(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_05_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.094,"y":330.976,"z":195.085}', 1300000),
	(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_06_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.263,"y":328.104,"z":210.396}', 1300000),
	(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_06_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.655,"y":326.611,"z":186.313}', 1300000),
	(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_06_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.3,"y":331.414,"z":195.085}', 1300000),
	(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_07_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.956,"y":328.257,"z":210.396}', 1300000),
	(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_07_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.545,"y":326.659,"z":186.313}', 1300000),
	(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_07_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.087,"y":331.429,"z":195.123}', 1300000),
	(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_08_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.187,"y":328.47,"z":210.396}', 1300000),
	(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_08_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.658,"y":326.563,"z":186.313}', 1300000),
	(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_08_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.287,"y":331.084,"z":195.086}', 1300000),
	(37, 'IntegrityWay', '4 Integrity Way', '{"x":-47.804,"y":-585.867,"z":36.956}', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 1700000),
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 1700000),
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 1700000),
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 1700000),
	(43, 'MazeBankBuilding', 'Maze Bank Building', '{"x":-79.18,"y":-795.92,"z":43.35}', NULL, NULL, '{"x":-72.50,"y":-786.92,"z":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
	(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(47, 'ExecutiveRich', 'Executive Rich', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(48, 'ExecutiveCool', 'Executive Cool', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(53, 'LomBank', 'Lom Bank', '{"x":-1581.36,"y":-558.23,"z":34.07}', NULL, NULL, '{"x":-1583.60,"y":-555.12,"z":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
	(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(63, 'MazeBankWest', 'Maze Bank West', '{"x":-1379.58,"y":-499.63,"z":32.22}', NULL, NULL, '{"x":-1378.95,"y":-502.82,"z":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
	(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;

-- Dumping structure for table essentialmode.qalle_brottsregister
CREATE TABLE IF NOT EXISTS `qalle_brottsregister` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofcrime` varchar(255) NOT NULL,
  `crime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.qalle_brottsregister: ~0 rows (approximately)
/*!40000 ALTER TABLE `qalle_brottsregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `qalle_brottsregister` ENABLE KEYS */;

-- Dumping structure for table essentialmode.rented_dock
CREATE TABLE IF NOT EXISTS `rented_dock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.rented_dock: ~0 rows (approximately)
/*!40000 ALTER TABLE `rented_dock` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_dock` ENABLE KEYS */;

-- Dumping structure for table essentialmode.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.rented_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.shops: ~16 rows (approximately)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
REPLACE INTO `shops` (`id`, `store`, `item`, `price`) VALUES
	(1, 'TwentyFourSeven', 'bread', 30),
	(2, 'TwentyFourSeven', 'water', 15),
	(3, 'RobsLiquor', 'bread', 30),
	(4, 'RobsLiquor', 'water', 15),
	(5, 'LTDgasoline', 'bread', 30),
	(6, 'LTDgasoline', 'water', 15),
	(7, 'LTDgasoline', 'croquettes', 100),
	(8, 'TwentyFourSeven', 'binoculars', 1000),
	(9, 'RobsLiquor', 'binoculars', 1000),
	(10, 'LTDgasoline', 'binoculars', 1000),
	(11, 'LTDgasoline', 'plongee1', 250),
	(12, 'RobsLiquor', 'plongee1', 250),
	(13, 'TwentyFourSeven', 'plongee1', 250),
	(14, 'LTDgasoline', 'plongee2', 350),
	(15, 'RobsLiquor', 'plongee2', 350),
	(16, 'TwentyFourSeven', 'plongee2', 350);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Dumping structure for table essentialmode.shops2
CREATE TABLE IF NOT EXISTS `shops2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.shops2: ~0 rows (approximately)
/*!40000 ALTER TABLE `shops2` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops2` ENABLE KEYS */;

-- Dumping structure for table essentialmode.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.society_moneywash: ~0 rows (approximately)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumping structure for table essentialmode.truck_inventory
CREATE TABLE IF NOT EXISTS `truck_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owned` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`item`,`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.truck_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `truck_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `truck_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext COLLATE utf8mb4_bin,
  `position` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `pet` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `is_dead` tinyint(1) DEFAULT '0',
  `phone_number` int(11) DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin,
  `tattoos` longtext COLLATE utf8mb4_bin,
  UNIQUE KEY `index_users_phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `pet`, `is_dead`, `phone_number`, `last_property`, `status`, `tattoos`) VALUES
	('steam:11000013c742c7c', 'license:2fb4c87a5078639b770392ca0ca38c7a1c1ac41e', 992000, 'kelputoo CSGO500', '{"makeup_3":0,"sun_2":0,"complexion_1":0,"arms_2":0,"eye_color":0,"sun_1":0,"lipstick_3":0,"tshirt_2":0,"decals_2":0,"hair_2":0,"bracelets_1":-1,"hair_color_2":0,"eyebrows_3":0,"glasses_1":0,"bracelets_2":0,"makeup_4":0,"age_2":0,"hair_color_1":0,"mask_1":0,"beard_3":0,"chest_1":0,"decals_1":0,"blemishes_2":0,"bags_2":0,"blush_2":0,"torso_1":0,"glasses_2":0,"blemishes_1":0,"chest_3":0,"sex":0,"bproof_2":0,"tshirt_1":0,"eyebrows_1":0,"beard_2":0,"chest_2":0,"shoes_1":0,"arms":0,"makeup_1":0,"pants_1":0,"watches_2":0,"chain_1":0,"beard_4":0,"lipstick_2":0,"moles_2":0,"skin":0,"complexion_2":0,"eyebrows_4":0,"torso_2":0,"makeup_2":0,"mask_2":0,"bags_1":0,"watches_1":-1,"beard_1":0,"ears_2":0,"blush_3":0,"face":0,"lipstick_1":0,"pants_2":0,"blush_1":0,"ears_1":-1,"age_1":0,"helmet_1":-1,"helmet_2":0,"bproof_1":0,"moles_1":0,"lipstick_4":0,"bodyb_1":0,"shoes_2":0,"bodyb_2":0,"eyebrows_2":0,"chain_2":0,"hair_1":0}', 'gopostal', 0, '[]', '{"z":30.7,"y":-799.0,"x":219.2}', 490, 4, 'superadmin', 'Ruben', 'Ribeiro', '2001-02-04', 'm', '200', '', 0, 38696, NULL, '[{"percent":42.73,"name":"hunger","val":427300},{"percent":44.5475,"name":"thirst","val":445475},{"percent":0.0,"name":"drug","val":0},{"percent":0.0,"name":"drunk","val":0}]', NULL),
	('steam:11000010ef561cd', 'license:bdc3d8478bebabeef465af3c9f879cad55b078fe', 2249509, 'Tony Mirandelas', '{"makeup_3":0,"sun_2":0,"complexion_1":0,"arms_2":0,"face":0,"sun_1":0,"lipstick_3":0,"tshirt_2":0,"decals_2":0,"hair_2":0,"bracelets_1":-1,"hair_color_2":0,"eyebrows_3":0,"glasses_1":0,"bracelets_2":0,"makeup_4":0,"age_2":0,"hair_color_1":0,"mask_1":0,"beard_3":0,"chest_1":0,"decals_1":0,"blemishes_2":0,"bags_2":0,"lipstick_1":0,"torso_1":0,"glasses_2":0,"helmet_2":0,"chest_3":0,"sex":0,"bproof_2":0,"tshirt_1":0,"eyebrows_1":0,"beard_2":0,"chest_2":0,"shoes_1":0,"arms":0,"makeup_1":0,"pants_1":0,"watches_2":0,"chain_1":0,"beard_4":0,"lipstick_2":0,"moles_2":0,"skin":0,"complexion_2":0,"eyebrows_4":0,"torso_2":0,"makeup_2":0,"mask_2":0,"bags_1":0,"watches_1":-1,"beard_1":0,"ears_2":0,"helmet_1":-1,"blush_2":0,"bproof_1":0,"ears_1":-1,"blush_1":0,"age_1":0,"pants_2":0,"shoes_2":0,"chain_2":0,"blemishes_1":0,"moles_1":0,"lipstick_4":0,"eye_color":0,"bodyb_1":0,"blush_3":0,"hair_1":0,"eyebrows_2":0,"bodyb_2":0}', 'mechanic', 3, '[]', '{"x":-338.9,"y":-135.2,"z":38.4}', 330, 0, 'user', 'Tony ', 'Mirandelas', '541561516', 'm', '145', '', 0, 71009, NULL, '[{"percent":91.54,"val":915400,"name":"hunger"},{"percent":93.655,"val":936550,"name":"thirst"},{"percent":0.0,"val":0,"name":"drug"},{"percent":0.0,"val":0,"name":"drunk"}]', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.user_accounts: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
REPLACE INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
	(1, 'steam:11000013c742c7c', 'black_money', 0),
	(2, 'steam:11000010ef561cd', 'black_money', 0);
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_contacts
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_contacts_identifier_name_number` (`identifier`,`name`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.user_contacts: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contacts` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.user_inventory: ~172 rows (approximately)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
REPLACE INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
	(1, 'steam:11000013c742c7c', 'energy', 0),
	(2, 'steam:11000013c742c7c', 'jusfruit', 0),
	(3, 'steam:11000013c742c7c', 'carokit', 0),
	(4, 'steam:11000013c742c7c', 'golem', 0),
	(5, 'steam:11000013c742c7c', 'diamond', 0),
	(6, 'steam:11000013c742c7c', 'essence', 0),
	(7, 'steam:11000013c742c7c', 'packaged_chicken', 0),
	(8, 'steam:11000013c742c7c', 'copper', 0),
	(9, 'steam:11000013c742c7c', 'meat', 0),
	(10, 'steam:11000013c742c7c', 'jager', 0),
	(11, 'steam:11000013c742c7c', 'burger', 0),
	(12, 'steam:11000013c742c7c', 'blowpipe', 0),
	(13, 'steam:11000013c742c7c', 'ice', 0),
	(14, 'steam:11000013c742c7c', 'mixapero', 0),
	(15, 'steam:11000013c742c7c', 'carotool', 0),
	(16, 'steam:11000013c742c7c', 'limonade', 0),
	(17, 'steam:11000013c742c7c', 'fixtool', 0),
	(18, 'steam:11000013c742c7c', 'jagercerbere', 0),
	(19, 'steam:11000013c742c7c', 'cola', 0),
	(20, 'steam:11000013c742c7c', 'grand_cru', 0),
	(21, 'steam:11000013c742c7c', 'mojito', 0),
	(22, 'steam:11000013c742c7c', 'grapperaisin', 0),
	(23, 'steam:11000013c742c7c', 'gazbottle', 0),
	(24, 'steam:11000013c742c7c', 'fish', 0),
	(25, 'steam:11000013c742c7c', 'icetea', 0),
	(26, 'steam:11000013c742c7c', 'rhumcoca', 0),
	(27, 'steam:11000013c742c7c', 'wool', 0),
	(28, 'steam:11000013c742c7c', 'fishingrod', 0),
	(29, 'steam:11000013c742c7c', 'packaged_plank', 0),
	(30, 'steam:11000013c742c7c', 'bolpistache', 0),
	(31, 'steam:11000013c742c7c', 'xanax', 0),
	(32, 'steam:11000013c742c7c', 'lsd', 0),
	(33, 'steam:11000013c742c7c', 'litter', 0),
	(34, 'steam:11000013c742c7c', 'martini', 0),
	(35, 'steam:11000013c742c7c', 'whiskycoca', 0),
	(36, 'steam:11000013c742c7c', 'litter_pooch', 0),
	(37, 'steam:11000013c742c7c', 'whisky', 0),
	(38, 'steam:11000013c742c7c', 'marijuana', 0),
	(39, 'steam:11000013c742c7c', 'raisin', 0),
	(40, 'steam:11000013c742c7c', 'water', 0),
	(41, 'steam:11000013c742c7c', 'plongee2', 0),
	(42, 'steam:11000013c742c7c', 'vodkafruit', 0),
	(43, 'steam:11000013c742c7c', 'lsd_pooch', 0),
	(44, 'steam:11000013c742c7c', 'bait', 0),
	(45, 'steam:11000013c742c7c', 'contrat', 0),
	(46, 'steam:11000013c742c7c', 'vodkaenergy', 0),
	(47, 'steam:11000013c742c7c', 'vodka', 0),
	(48, 'steam:11000013c742c7c', 'bandage', 0),
	(49, 'steam:11000013c742c7c', 'vine', 0),
	(50, 'steam:11000013c742c7c', 'journal', 0),
	(51, 'steam:11000013c742c7c', 'vegetables', 0),
	(52, 'steam:11000013c742c7c', 'jewels', 0),
	(53, 'steam:11000013c742c7c', 'slaughtered_chicken', 0),
	(54, 'steam:11000013c742c7c', 'tequila', 0),
	(55, 'steam:11000013c742c7c', 'teqpaf', 0),
	(56, 'steam:11000013c742c7c', 'croquettes', 0),
	(57, 'steam:11000013c742c7c', 'metreshooter', 0),
	(58, 'steam:11000013c742c7c', 'stone', 0),
	(59, 'steam:11000013c742c7c', 'petrol_raffin', 0),
	(60, 'steam:11000013c742c7c', 'alive_chicken', 0),
	(61, 'steam:11000013c742c7c', 'soda', 0),
	(62, 'steam:11000013c742c7c', 'bolnoixcajou', 0),
	(63, 'steam:11000013c742c7c', 'rhumfruit', 0),
	(64, 'steam:11000013c742c7c', 'petrol', 0),
	(65, 'steam:11000013c742c7c', 'jus_raisin', 0),
	(66, 'steam:11000013c742c7c', 'washed_stone', 0),
	(67, 'steam:11000013c742c7c', 'plongee1', 0),
	(68, 'steam:11000013c742c7c', 'rhum', 0),
	(69, 'steam:11000013c742c7c', 'saucisson', 0),
	(70, 'steam:11000013c742c7c', 'drpepper', 0),
	(71, 'steam:11000013c742c7c', 'jagerbomb', 0),
	(72, 'steam:11000013c742c7c', 'bread', 0),
	(73, 'steam:11000013c742c7c', 'tacos', 0),
	(74, 'steam:11000013c742c7c', 'menthe', 0),
	(75, 'steam:11000013c742c7c', 'medikit', 0),
	(76, 'steam:11000013c742c7c', 'fixkit', 0),
	(77, 'steam:11000013c742c7c', 'wood', 0),
	(78, 'steam:11000013c742c7c', 'clothe', 0),
	(79, 'steam:11000013c742c7c', 'iron', 0),
	(80, 'steam:11000013c742c7c', 'fabric', 0),
	(81, 'steam:11000013c742c7c', 'cutted_wood', 0),
	(82, 'steam:11000013c742c7c', 'gold', 0),
	(83, 'steam:11000013c742c7c', 'cannabis', 0),
	(84, 'steam:11000013c742c7c', 'bolcacahuetes', 0),
	(85, 'steam:11000013c742c7c', 'bolchips', 0),
	(86, 'steam:11000013c742c7c', 'binoculars', 0),
	(87, 'steam:11000010ef561cd', 'energy', 0),
	(88, 'steam:11000010ef561cd', 'carokit', 0),
	(89, 'steam:11000010ef561cd', 'jusfruit', 0),
	(90, 'steam:11000010ef561cd', 'golem', 0),
	(91, 'steam:11000010ef561cd', 'diamond', 0),
	(92, 'steam:11000010ef561cd', 'essence', 0),
	(93, 'steam:11000010ef561cd', 'packaged_chicken', 0),
	(94, 'steam:11000010ef561cd', 'copper', 0),
	(95, 'steam:11000010ef561cd', 'meat', 0),
	(96, 'steam:11000010ef561cd', 'jager', 0),
	(97, 'steam:11000010ef561cd', 'burger', 0),
	(98, 'steam:11000010ef561cd', 'blowpipe', 0),
	(99, 'steam:11000010ef561cd', 'ice', 0),
	(100, 'steam:11000010ef561cd', 'mixapero', 0),
	(101, 'steam:11000010ef561cd', 'carotool', 0),
	(102, 'steam:11000010ef561cd', 'limonade', 0),
	(103, 'steam:11000010ef561cd', 'fixtool', 0),
	(104, 'steam:11000010ef561cd', 'jagercerbere', 0),
	(105, 'steam:11000010ef561cd', 'cola', 0),
	(106, 'steam:11000010ef561cd', 'grand_cru', 0),
	(107, 'steam:11000010ef561cd', 'mojito', 0),
	(108, 'steam:11000010ef561cd', 'grapperaisin', 0),
	(109, 'steam:11000010ef561cd', 'gazbottle', 0),
	(110, 'steam:11000010ef561cd', 'fish', 0),
	(111, 'steam:11000010ef561cd', 'icetea', 0),
	(112, 'steam:11000010ef561cd', 'rhumcoca', 0),
	(113, 'steam:11000010ef561cd', 'wool', 0),
	(114, 'steam:11000010ef561cd', 'fishingrod', 0),
	(115, 'steam:11000010ef561cd', 'packaged_plank', 0),
	(116, 'steam:11000010ef561cd', 'bolpistache', 0),
	(117, 'steam:11000010ef561cd', 'xanax', 0),
	(118, 'steam:11000010ef561cd', 'lsd', 0),
	(119, 'steam:11000010ef561cd', 'litter', 0),
	(120, 'steam:11000010ef561cd', 'martini', 0),
	(121, 'steam:11000010ef561cd', 'whiskycoca', 0),
	(122, 'steam:11000010ef561cd', 'litter_pooch', 0),
	(123, 'steam:11000010ef561cd', 'whisky', 0),
	(124, 'steam:11000010ef561cd', 'marijuana', 0),
	(125, 'steam:11000010ef561cd', 'raisin', 0),
	(126, 'steam:11000010ef561cd', 'water', 0),
	(127, 'steam:11000010ef561cd', 'plongee2', 0),
	(128, 'steam:11000010ef561cd', 'vodkafruit', 0),
	(129, 'steam:11000010ef561cd', 'lsd_pooch', 0),
	(130, 'steam:11000010ef561cd', 'bait', 0),
	(131, 'steam:11000010ef561cd', 'contrat', 0),
	(132, 'steam:11000010ef561cd', 'vodkaenergy', 0),
	(133, 'steam:11000010ef561cd', 'vodka', 0),
	(134, 'steam:11000010ef561cd', 'bandage', 0),
	(135, 'steam:11000010ef561cd', 'vine', 0),
	(136, 'steam:11000010ef561cd', 'journal', 0),
	(137, 'steam:11000010ef561cd', 'vegetables', 0),
	(138, 'steam:11000010ef561cd', 'jewels', 0),
	(139, 'steam:11000010ef561cd', 'slaughtered_chicken', 0),
	(140, 'steam:11000010ef561cd', 'tequila', 0),
	(141, 'steam:11000010ef561cd', 'teqpaf', 0),
	(142, 'steam:11000010ef561cd', 'croquettes', 0),
	(143, 'steam:11000010ef561cd', 'metreshooter', 0),
	(144, 'steam:11000010ef561cd', 'stone', 0),
	(145, 'steam:11000010ef561cd', 'petrol_raffin', 0),
	(146, 'steam:11000010ef561cd', 'alive_chicken', 0),
	(147, 'steam:11000010ef561cd', 'soda', 0),
	(148, 'steam:11000010ef561cd', 'bolnoixcajou', 0),
	(149, 'steam:11000010ef561cd', 'rhumfruit', 0),
	(150, 'steam:11000010ef561cd', 'petrol', 0),
	(151, 'steam:11000010ef561cd', 'jus_raisin', 0),
	(152, 'steam:11000010ef561cd', 'washed_stone', 0),
	(153, 'steam:11000010ef561cd', 'plongee1', 0),
	(154, 'steam:11000010ef561cd', 'rhum', 0),
	(155, 'steam:11000010ef561cd', 'saucisson', 0),
	(156, 'steam:11000010ef561cd', 'drpepper', 0),
	(157, 'steam:11000010ef561cd', 'jagerbomb', 0),
	(158, 'steam:11000010ef561cd', 'bread', 0),
	(159, 'steam:11000010ef561cd', 'tacos', 0),
	(160, 'steam:11000010ef561cd', 'menthe', 0),
	(161, 'steam:11000010ef561cd', 'medikit', 4),
	(162, 'steam:11000010ef561cd', 'fixkit', 0),
	(163, 'steam:11000010ef561cd', 'clothe', 0),
	(164, 'steam:11000010ef561cd', 'wood', 0),
	(165, 'steam:11000010ef561cd', 'iron', 0),
	(166, 'steam:11000010ef561cd', 'fabric', 0),
	(167, 'steam:11000010ef561cd', 'cutted_wood', 0),
	(168, 'steam:11000010ef561cd', 'gold', 0),
	(169, 'steam:11000010ef561cd', 'cannabis', 0),
	(170, 'steam:11000010ef561cd', 'bolcacahuetes', 0),
	(171, 'steam:11000010ef561cd', 'bolchips', 0),
	(172, 'steam:11000010ef561cd', 'binoculars', 0);
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.user_licenses: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumping structure for table essentialmode.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.vehicles: ~240 rows (approximately)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
REPLACE INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.vehicle_categories: ~11 rows (approximately)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
REPLACE INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for table essentialmode.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.vehicle_sold: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Dumping structure for table essentialmode.weashops
CREATE TABLE IF NOT EXISTS `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.weashops: ~40 rows (approximately)
/*!40000 ALTER TABLE `weashops` DISABLE KEYS */;
REPLACE INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
	(1, 'GunShop', 'WEAPON_PISTOL', 300),
	(2, 'BlackWeashop', 'WEAPON_PISTOL', 500),
	(3, 'GunShop', 'WEAPON_FLASHLIGHT', 60),
	(4, 'BlackWeashop', 'WEAPON_FLASHLIGHT', 70),
	(5, 'GunShop', 'WEAPON_MACHETE', 90),
	(6, 'BlackWeashop', 'WEAPON_MACHETE', 110),
	(7, 'GunShop', 'WEAPON_NIGHTSTICK', 150),
	(8, 'BlackWeashop', 'WEAPON_NIGHTSTICK', 150),
	(9, 'GunShop', 'WEAPON_BAT', 100),
	(10, 'BlackWeashop', 'WEAPON_BAT', 100),
	(11, 'GunShop', 'WEAPON_STUNGUN', 50),
	(12, 'BlackWeashop', 'WEAPON_STUNGUN', 50),
	(13, 'GunShop', 'WEAPON_MICROSMG', 1400),
	(14, 'BlackWeashop', 'WEAPON_MICROSMG', 1700),
	(15, 'GunShop', 'WEAPON_PUMPSHOTGUN', 3400),
	(16, 'BlackWeashop', 'WEAPON_PUMPSHOTGUN', 3500),
	(17, 'GunShop', 'WEAPON_ASSAULTRIFLE', 10000),
	(18, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 11000),
	(19, 'GunShop', 'WEAPON_SPECIALCARBINE', 15000),
	(20, 'BlackWeashop', 'WEAPON_SPECIALCARBINE', 16500),
	(21, 'GunShop', 'WEAPON_SNIPERRIFLE', 22000),
	(22, 'BlackWeashop', 'WEAPON_SNIPERRIFLE', 24000),
	(23, 'GunShop', 'WEAPON_FIREWORK', 18000),
	(24, 'BlackWeashop', 'WEAPON_FIREWORK', 20000),
	(25, 'GunShop', 'WEAPON_GRENADE', 500),
	(26, 'BlackWeashop', 'WEAPON_GRENADE', 650),
	(27, 'GunShop', 'WEAPON_BZGAS', 200),
	(28, 'BlackWeashop', 'WEAPON_BZGAS', 350),
	(29, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 100),
	(30, 'BlackWeashop', 'WEAPON_FIREEXTINGUISHER', 100),
	(31, 'GunShop', 'WEAPON_BALL', 50),
	(32, 'BlackWeashop', 'WEAPON_BALL', 50),
	(33, 'GunShop', 'WEAPON_SMOKEGRENADE', 100),
	(34, 'BlackWeashop', 'WEAPON_SMOKEGRENADE', 100),
	(35, 'BlackWeashop', 'WEAPON_APPISTOL', 1100),
	(36, 'BlackWeashop', 'WEAPON_CARBINERIFLE', 12000),
	(37, 'BlackWeashop', 'WEAPON_HEAVYSNIPER', 30000),
	(38, 'BlackWeashop', 'WEAPON_MINIGUN', 45000),
	(39, 'BlackWeashop', 'WEAPON_RAILGUN', 50000),
	(40, 'BlackWeashop', 'WEAPON_STICKYBOMB', 500);
/*!40000 ALTER TABLE `weashops` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@ */;
