-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2020 at 12:24 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `essentialmode`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('bank_savings', 'Livret Bleu', 0),
('caution', 'Caution', 0),
('property_black_money', 'Argent Sale Propriété', 0),
('society_admin', 'admin', 1),
('society_ambulance', 'Ambulance', 1),
('society_avocat', 'Advokat', 1),
('society_banker', 'Banque', 1),
('society_bishops', 'Bishops', 1),
('society_cardealer', 'Concessionnaire', 1),
('society_dismay', 'Dismay', 1),
('society_dock', 'Marina', 1),
('society_fbi', 'FBI', 1),
('society_fire', 'fire', 1),
('society_foodtruck', 'Foodtruck', 1),
('society_gang', 'gang', 1),
('society_grove', 'Grove', 1),
('society_mafia', 'Mafia', 1),
('society_mechanic', 'Mécano', 1),
('society_police', 'Police', 1),
('society_realestateagent', 'Agent immobilier', 1),
('society_rebel', 'Rebel', 1),
('society_taxi', 'Taxi', 1),
('society_unicorn', 'Unicorn', 1),
('society_vigne', 'Winegrower', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_ambulance', 300, NULL),
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
(12, 'society_police', 0, ''),
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
(24, 'property_black_money', 0, 'steam:11000010ef561cd'),
(25, 'bank_savings', 0, 'steam:1100001374d7ce1'),
(26, 'property_black_money', 0, 'steam:1100001374d7ce1'),
(27, 'caution', 0, 'steam:1100001374d7ce1'),
(28, 'society_fbi', 0, NULL),
(29, 'society_admin', 0, NULL),
(30, 'bank_savings', 0, 'steam:11000011c609b9f'),
(31, 'property_black_money', 0, 'steam:11000011c609b9f'),
(32, 'caution', 0, 'steam:11000011c609b9f'),
(33, 'society_gang', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('gang_a', 'gang', 1),
('gang_dev', 'gang', 1),
('gang_hamid', 'gang', 1),
('property', 'Propriété', 0),
('society_admin', 'admin', 1),
('society_ambulance', 'Ambulance', 1),
('society_avocat', 'Advokat', 1),
('society_bishops', 'Bishops', 1),
('society_cardealer', 'Concesionnaire', 1),
('society_dismay', 'Dismay', 1),
('society_dock', 'Marina', 1),
('society_fbi', 'FBI', 1),
('society_fire', 'fire', 1),
('society_gang', 'Gang', 1),
('society_grove', 'Grove', 1),
('society_mafia', 'Mafia', 1),
('society_mechanic', 'Mécano', 1),
('society_police', 'Police', 1),
('society_rebel', 'Rebel', 1),
('society_taxi', 'Taxi', 1),
('society_unicorn', 'Unicorn', 1),
('society_unicorn_fridge', 'Unicorn (frigo)', 1),
('society_vigne', 'Winegrower', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addon_inventory_items`
--

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(1, 'society_police', 'gps', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `arrests_list`
--

CREATE TABLE `arrests_list` (
  `id` int(11) NOT NULL,
  `json_data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `baninfo`
--

CREATE TABLE `baninfo` (
  `identifier` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `playername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `banlist`
--

CREATE TABLE `banlist` (
  `identifier` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `expiration` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `banlisthistory`
--

CREATE TABLE `banlisthistory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` int(11) NOT NULL,
  `added` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `ID` int(255) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `identifier` varchar(1024) NOT NULL,
  `reason` varchar(1024) NOT NULL,
  `ban_issued` varchar(1024) NOT NULL,
  `banned_until` varchar(1024) NOT NULL,
  `staff_name` varchar(1024) NOT NULL,
  `staff_steamid` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blackmarket`
--

CREATE TABLE `blackmarket` (
  `id` int(11) NOT NULL,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blackmarket`
--

INSERT INTO `blackmarket` (`id`, `store`, `item`, `price`) VALUES
(1, 'blackmarket', 'loole', 400),
(2, 'blackmarket', 'fanar', 300),
(3, 'blackmarket', 'capsul', 400),
(4, 'blackmarket', 'picklock', 200),
(5, 'blackmarket', 'drillsharji', 2000),
(6, 'blackmarket', 'mattezakhim', 2000),
(7, 'blackmarket', 'battery', 1500),
(8, 'blackmarket', 'clip', 2000),
(9, 'blackmarket', 'silencer', 10000),
(10, 'blackmarket', 'grip', 3000),
(11, 'blackmarket', 'flashlight', 1500),
(12, 'blackmarket', 'yusuf', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `bolos_list`
--

CREATE TABLE `bolos_list` (
  `id` int(11) NOT NULL,
  `json_data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `capture`
--

CREATE TABLE `capture` (
  `name` varchar(255) NOT NULL,
  `reward` varchar(255) NOT NULL,
  `coordinate` varchar(255) NOT NULL,
  `handeler` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `car_parking`
--

CREATE TABLE `car_parking` (
  `id` int(10) NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` bigint(20) NOT NULL,
  `parking` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `car_parking`
--

INSERT INTO `car_parking` (`id`, `owner`, `plate`, `data`, `time`, `parking`) VALUES
(5, 'steam:11000011c609b9f', 'HAMID2', '{\"health\":{\"body\":999.0,\"engine\":1000.0,\"tank\":1000.0},\"props\":{\"modDial\":-1,\"modEngineBlock\":-1,\"modArchCover\":-1,\"modSteeringWheel\":-1,\"modVanityPlate\":-1,\"engineHealth\":1000.0,\"modRearBumper\":-1,\"modRightFender\":-1,\"modArmor\":-1,\"modFrame\":-1,\"pearlescentColor\":73,\"modTurbo\":false,\"modTank\":-1,\"modAirFilter\":-1,\"modPlateHolder\":-1,\"modAPlate\":-1,\"wheelColor\":0,\"modShifterLeavers\":-1,\"modTransmission\":-1,\"plateIndex\":0,\"modAerials\":-1,\"modSmokeEnabled\":1,\"modFrontWheels\":-1,\"dirtLevel\":5.2,\"modBackWheels\":-1,\"modFender\":-1,\"modOrnaments\":-1,\"modSpoilers\":-1,\"modGrille\":-1,\"extras\":[],\"modSpeakers\":-1,\"color1\":64,\"modFrontBumper\":-1,\"modWindows\":-1,\"model\":-1848994066,\"neonColor\":[255,0,255],\"wheels\":0,\"modStruts\":-1,\"modLivery\":-1,\"bodyHealth\":999.0,\"modEngine\":-1,\"modXenon\":false,\"neonEnabled\":[false,false,false,false],\"fuelLevel\":40.9,\"modBrakes\":-1,\"modTrimB\":-1,\"modRoof\":-1,\"plate\":\"HAMID2\",\"modSuspension\":-1,\"modSeats\":-1,\"modHydrolic\":-1,\"modTrimA\":-1,\"modExhaust\":-1,\"windowTint\":-1,\"modDoorSpeaker\":-1,\"modTrunk\":-1,\"modSideSkirt\":-1,\"modDashboard\":-1,\"modHorns\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":0,\"modHood\":-1},\"livery\":-1,\"location\":{\"z\":30.724761962891,\"x\":-323.52621459961,\"h\":172.14179992676,\"y\":-895.07238769531},\"parking\":\"parking1\"}', 1589357825, 'parking1'),
(6, 'steam:11000011c609b9f', 'HAMID1', '{\"location\":{\"h\":162.43463134766,\"z\":30.657859802246,\"y\":-898.14886474609,\"x\":-305.47830200195},\"health\":{\"tank\":994.34423828125,\"engine\":999.25,\"body\":952.0576171875},\"parking\":\"parking1\",\"livery\":-1,\"props\":{\"modTank\":-1,\"modSteeringWheel\":-1,\"modArmor\":4,\"modSuspension\":-1,\"wheelColor\":156,\"modTurbo\":1,\"modVanityPlate\":-1,\"modBackWheels\":-1,\"modExhaust\":2,\"modSeats\":-1,\"modRoof\":-1,\"plate\":\"HAMID1\",\"modHood\":1,\"color2\":41,\"modFrontWheels\":-1,\"modDial\":-1,\"modRightFender\":-1,\"modFrontBumper\":-1,\"modSmokeEnabled\":1,\"pearlescentColor\":12,\"modOrnaments\":-1,\"modDoorSpeaker\":-1,\"modEngineBlock\":-1,\"engineHealth\":999.3,\"color1\":12,\"modAirFilter\":-1,\"modHorns\":-1,\"wheels\":7,\"fuelLevel\":74.3,\"modXenon\":1,\"modTrimB\":-1,\"tyreSmokeColor\":[0,245,255],\"modWindows\":-1,\"modRearBumper\":-1,\"modTransmission\":2,\"modDashboard\":-1,\"modSpeakers\":-1,\"plateIndex\":2,\"modGrille\":-1,\"modStruts\":-1,\"dirtLevel\":8.4,\"modHydrolic\":-1,\"extras\":[],\"modLivery\":-1,\"modEngine\":3,\"modArchCover\":-1,\"modAPlate\":-1,\"neonColor\":[0,245,255],\"modSpoilers\":4,\"neonEnabled\":[1,1,1,1],\"model\":-1403128555,\"modAerials\":-1,\"bodyHealth\":952.1,\"modFender\":-1,\"windowTint\":-1,\"modTrimA\":-1,\"modSideSkirt\":1,\"modFrame\":1,\"modBrakes\":2,\"modShifterLeavers\":-1,\"modTrunk\":-1,\"modPlateHolder\":-1}}', 1589358143, 'parking1');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `height` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`) VALUES
(1, 'steam:11000013c742c7c', 'Ruben', 'Ribeiro', '2001-02-04', 'm', '200'),
(2, 'steam:11000010ef561cd', 'Tony ', 'Mirandelas', '541561516', 'm', '145'),
(3, 'steam:1100001374d7ce1', 'Parsa', 'Salimi', '13821102', 'm', '186'),
(4, 'steam:11000011c609b9f', 'Hamidreza', 'Karimi', '1994-08-16', 'm', '190');

-- --------------------------------------------------------

--
-- Table structure for table `coffees`
--

CREATE TABLE `coffees` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coffees`
--

INSERT INTO `coffees` (`id`, `name`, `item`, `price`) VALUES
(1, 'Coffee', 'coffee', 30);

-- --------------------------------------------------------

--
-- Table structure for table `commend`
--

CREATE TABLE `commend` (
  `ID` int(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `reason` varchar(1024) NOT NULL,
  `staff_name` varchar(255) NOT NULL,
  `staff_steamid` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `ID` int(255) NOT NULL,
  `community_name` varchar(255) NOT NULL DEFAULT 'Community Name',
  `discord_webhook` varchar(1024) DEFAULT NULL,
  `joinmessages` enum('true','false') NOT NULL DEFAULT 'false',
  `chatcommands` enum('true','false') NOT NULL DEFAULT 'true',
  `checktimeout` int(255) NOT NULL DEFAULT 15,
  `trustscore` int(255) NOT NULL DEFAULT 75,
  `tswarn` int(255) NOT NULL DEFAULT 3,
  `tskick` int(255) NOT NULL DEFAULT 6,
  `tsban` int(255) NOT NULL DEFAULT 10,
  `tscommend` int(255) NOT NULL DEFAULT 2,
  `tstime` int(255) NOT NULL DEFAULT 1,
  `recent_time` int(255) NOT NULL DEFAULT 10,
  `permissions` varchar(20480) NOT NULL,
  `serveractions` varchar(20480) NOT NULL,
  `debug` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `darkshops`
--

CREATE TABLE `darkshops` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `darkshops`
--

INSERT INTO `darkshops` (`id`, `name`, `item`, `price`) VALUES
(1, 'Darks', 'Darknet', 15);

-- --------------------------------------------------------

--
-- Table structure for table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('gang_a', 'gang', 1),
('gang_dev', 'gang', 1),
('gang_hamid', 'gang', 1),
('property', 'Propriété', 0),
('society_admin', 'admin', 1),
('society_ambulance', 'Ambulance', 1),
('society_avocat', 'Advokat', 1),
('society_bishops', 'Bishops', 1),
('society_dismay', 'Dismay', 1),
('society_fbi', 'FBI', 1),
('society_fire', 'fire', 1),
('society_gang', 'Gang', 1),
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

-- --------------------------------------------------------

--
-- Table structure for table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_ambulance', NULL, '{}'),
(2, 'society_avocat', NULL, '{}'),
(3, 'society_bishops', NULL, '{}'),
(4, 'society_dismay', NULL, '{}'),
(5, 'society_fire', NULL, '{}'),
(6, 'society_grove', NULL, '{}'),
(7, 'society_mafia', NULL, '{}'),
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
(22, 'user_mask', 'steam:11000010ef561cd', '{}'),
(23, 'user_ears', 'steam:1100001374d7ce1', '{}'),
(24, 'user_glasses', 'steam:1100001374d7ce1', '{}'),
(25, 'property', 'steam:1100001374d7ce1', '{\"dressing\":[{\"skin\":{\"ears_1\":-1,\"watches_1\":-1,\"age_1\":0,\"sun_1\":0,\"arms\":59,\"eyebrows_3\":0,\"bracelets_2\":0,\"hair_color_2\":0,\"blemishes_2\":0,\"makeup_4\":0,\"bodyb_1\":0,\"blush_1\":0,\"complexion_1\":0,\"lipstick_4\":0,\"chest_1\":0,\"eyebrows_4\":0,\"chain_2\":0,\"lipstick_1\":0,\"blemishes_1\":0,\"pants_1\":10,\"blush_3\":0,\"skin\":0,\"age_2\":0,\"shoes_1\":10,\"blush_2\":0,\"eye_color\":0,\"beard_1\":0,\"makeup_2\":0,\"moles_2\":0,\"arms_2\":0,\"ears_2\":0,\"makeup_3\":0,\"mask_1\":0,\"beard_3\":0,\"lipstick_2\":0,\"pants_2\":0,\"bproof_2\":0,\"hair_2\":0,\"sun_2\":0,\"tshirt_1\":15,\"hair_color_1\":0,\"eyebrows_1\":0,\"makeup_1\":0,\"face\":0,\"complexion_2\":0,\"eyebrows_2\":0,\"decals_2\":0,\"sex\":0,\"beard_4\":0,\"decals_1\":0,\"lipstick_3\":0,\"mask_2\":0,\"bracelets_1\":-1,\"bags_1\":0,\"torso_2\":0,\"bproof_1\":0,\"chain_1\":0,\"helmet_1\":106,\"chest_2\":0,\"hair_1\":0,\"bodyb_2\":0,\"glasses_1\":7,\"bags_2\":0,\"chest_3\":0,\"glasses_2\":0,\"moles_1\":0,\"beard_2\":0,\"shoes_2\":0,\"helmet_2\":20,\"watches_2\":0,\"torso_1\":43,\"tshirt_2\":0},\"label\":\"Police\"}]}'),
(26, 'user_mask', 'steam:1100001374d7ce1', '{}'),
(27, 'user_helmet', 'steam:1100001374d7ce1', '{}'),
(28, 'society_fbi', NULL, '{}'),
(29, 'society_admin', NULL, '{}'),
(30, 'society_police', NULL, '{\"weapons\":[{\"count\":0,\"name\":\"WEAPON_COMBATPISTOL\"},{\"count\":1,\"name\":\"WEAPON_CARBINERIFLE\"},{\"count\":1,\"name\":\"WEAPON_NIGHTSTICK\"},{\"count\":6,\"name\":\"WEAPON_FLASHLIGHT\"},{\"count\":1,\"name\":\"WEAPON_STUNGUN\"}]}'),
(31, 'property', 'steam:11000011c609b9f', '{}'),
(32, 'user_ears', 'steam:11000011c609b9f', '{}'),
(33, 'user_glasses', 'steam:11000011c609b9f', '{}'),
(34, 'user_mask', 'steam:11000011c609b9f', '{}'),
(35, 'user_helmet', 'steam:11000011c609b9f', '{}'),
(36, 'society_gang', NULL, '{}'),
(37, 'gang_hamid', NULL, '[]'),
(38, 'gang_dev', NULL, '[]'),
(39, 'gang_a', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `dock`
--

CREATE TABLE `dock` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dock`
--

INSERT INTO `dock` (`id`, `name`, `model`, `price`, `category`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `dock_categories`
--

CREATE TABLE `dock_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dock_categories`
--

INSERT INTO `dock_categories` (`id`, `name`, `label`) VALUES
(1, 'dock', 'Bateaux');

-- --------------------------------------------------------

--
-- Table structure for table `dock_vehicles`
--

CREATE TABLE `dock_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dpkeybinds`
--

CREATE TABLE `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dpkeybinds`
--

INSERT INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
('steam:1100001374d7ce1', 'num4', '', 'num5', '', 'num6', '', 'num7', 'salute', 'num8', '', 'num9', ''),
('steam:11000011c609b9f', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');

-- --------------------------------------------------------

--
-- Table structure for table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Mal uso del claxon', 1000, 0),
(2, 'Cruzando ilegalmente una línea continua', 1500, 0),
(3, 'Conducir en el lado equivocado de la carretera', 2000, 0),
(4, 'Giro ilegal en U', 1000, 0),
(5, 'Conducir ilegalmente fuera de la carretera', 2000, 0),
(6, 'Rechazar una orden legal', 3000, 0),
(7, 'Detener ilegalmente un vehículo', 1000, 0),
(8, 'Estacionamiento ilegal', 2000, 0),
(9, 'A falta de ceder a la derecha', 2000, 0),
(10, 'Incumplimiento de la información del vehículo', 2000, 0),
(11, 'No parar en una señal de Stop', 1500, 0),
(12, 'No parar en un semaforo rojo', 1000, 0),
(13, 'Paso ilegal', 1000, 0),
(14, 'Conducir un vehículo ilegal', 5000, 0),
(15, 'Conducir sin licencia', 3000, 0),
(16, 'Accidente con fuga', 10000, 0),
(17, 'Exceso de velocidad por < 5 mph', 1000, 0),
(18, 'Exceso de velocidad por 5-15 mph', 1500, 0),
(19, 'Exceso de velocidad por 15-30 mph', 2000, 0),
(20, 'Exceso de velocidad por > 30 mph', 3000, 0),
(21, 'Impedir el flujo de tráfico', 1000, 1),
(22, 'Intoxicación pública', 2000, 1),
(23, 'Conducta desordenada', 3000, 1),
(24, 'Obstrucción de la justicia', 6000, 1),
(25, 'Insultos hacia los civiles', 2000, 1),
(26, 'Falta de respeto a un oficial', 5000, 1),
(27, 'Amenaza verbal hacia un civil', 3000, 1),
(28, 'Amenaza verbal hacia un oficial', 6000, 1),
(29, 'Proporcionar información falsa', 15000, 1),
(30, 'Intento de corrupción', 15000, 1),
(31, 'Blandiendo un arma en los límites de la ciudad', 2000, 2),
(32, 'Blandiendo un arma letal en los límites de la ciudad', 6000, 2),
(33, 'Sin licencia de armas de fuego', 10000, 2),
(34, 'Posesión de un arma ilegal', 20000, 2),
(35, 'Posesión de herramientas de robo', 2000, 2),
(36, 'Acoso y/o violacion', 10000, 2),
(37, 'Intención de vender, comprar droga', 2000, 2),
(38, 'Fabricación de una sustancia ilegal', 5000, 2),
(39, 'Posesión de una sustancia ilegal', 2000, 2),
(40, 'Secuestro de un Civilan', 20000, 2),
(41, 'Secuestro de un Oficial', 100000, 2),
(42, 'Robo', 30000, 2),
(43, 'Robo de joyeria mano armada', 80000, 2),
(44, 'Robo de banco mano armada', 500000, 2),
(45, 'Robo a un civil', 20000, 3),
(46, 'Robo a un oficial', 50000, 3),
(47, 'Intento de asesinato de un civil', 300000, 3),
(48, 'Intento de asesinato de un oficial', 500000, 3),
(49, 'Asesinato de un civil', 1000000, 3),
(50, 'Asesinato de un oficial', 5000000, 3),
(51, 'Homicidio involuntario', 200000, 3),
(52, 'Fraude', 80000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `fine_types_bishops`
--

CREATE TABLE `fine_types_bishops` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fine_types_bishops`
--

INSERT INTO `fine_types_bishops` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Raket', 3000, 0),
(2, 'Raket', 5000, 0),
(3, 'Raket', 10000, 1),
(4, 'Raket', 20000, 1),
(5, 'Raket', 50000, 2),
(6, 'Raket', 150000, 3),
(7, 'Raket', 350000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fine_types_dismay`
--

CREATE TABLE `fine_types_dismay` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fine_types_dismay`
--

INSERT INTO `fine_types_dismay` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Raket', 3000, 0),
(2, 'Raket', 5000, 0),
(3, 'Raket', 10000, 1),
(4, 'Raket', 20000, 1),
(5, 'Raket', 50000, 2),
(6, 'Raket', 150000, 3),
(7, 'Raket', 350000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fine_types_gang`
--

CREATE TABLE `fine_types_gang` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fine_types_gang`
--

INSERT INTO `fine_types_gang` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Raket', 3000, 0),
(2, 'Raket', 5000, 0),
(3, 'Raket', 10000, 1),
(4, 'Raket', 20000, 1),
(5, 'Raket', 50000, 2),
(6, 'Raket', 150000, 3),
(7, 'Raket', 350000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fine_types_grove`
--

CREATE TABLE `fine_types_grove` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fine_types_grove`
--

INSERT INTO `fine_types_grove` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Raket', 3000, 0),
(2, 'Raket', 5000, 0),
(3, 'Raket', 10000, 1),
(4, 'Raket', 20000, 1),
(5, 'Raket', 50000, 2),
(6, 'Raket', 150000, 3),
(7, 'Raket', 350000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fine_types_mafia`
--

CREATE TABLE `fine_types_mafia` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fine_types_mafia`
--

INSERT INTO `fine_types_mafia` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Raket', 3000, 0),
(2, 'Raket', 5000, 0),
(3, 'Raket', 10000, 1),
(4, 'Raket', 20000, 1),
(5, 'Raket', 50000, 2),
(6, 'Raket', 150000, 3),
(7, 'Raket', 350000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fine_types_rebel`
--

CREATE TABLE `fine_types_rebel` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fine_types_rebel`
--

INSERT INTO `fine_types_rebel` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Raket', 3000, 0),
(2, 'Raket', 5000, 0),
(3, 'Raket', 10000, 1),
(4, 'Raket', 20000, 1),
(5, 'Raket', 50000, 2),
(6, 'Raket', 150000, 3),
(7, 'Raket', 350000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `gangs`
--

CREATE TABLE `gangs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gangs`
--

INSERT INTO `gangs` (`id`, `name`, `label`) VALUES
(2, 'Hamid', 'gang'),
(3, 'Dev', 'gang'),
(4, 'A', 'gang');

-- --------------------------------------------------------

--
-- Table structure for table `gangs_data`
--

CREATE TABLE `gangs_data` (
  `id` int(11) NOT NULL,
  `gang_name` varchar(255) NOT NULL,
  `blip` longtext DEFAULT NULL,
  `armory` longtext DEFAULT NULL,
  `locker` longtext DEFAULT NULL,
  `boss` longtext DEFAULT NULL,
  `veh` longtext DEFAULT NULL,
  `vehdel` longtext DEFAULT NULL,
  `vehspawn` longtext DEFAULT NULL,
  `expire` longtext DEFAULT NULL,
  `vehprop` longtext DEFAULT NULL,
  `vehicles` longtext DEFAULT NULL,
  `expire_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gangs_data`
--

INSERT INTO `gangs_data` (`id`, `gang_name`, `blip`, `armory`, `locker`, `boss`, `veh`, `vehdel`, `vehspawn`, `expire`, `vehprop`, `vehicles`, `expire_time`) VALUES
(1, 'A', NULL, NULL, NULL, NULL, '{\"z\":175.89013671875,\"y\":542.92749023438,\"x\":12.210989952087}', '{\"z\":176.02490234375,\"y\":544.20660400391,\"x\":22.773628234863}', '{\"z\":175.90698242188,\"y\":549.34942626953,\"x\":10.153846740723}', NULL, '[]', '[]', '2020-06-12 23:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `gang_account`
--

CREATE TABLE `gang_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(255) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gang_account`
--

INSERT INTO `gang_account` (`name`, `label`, `shared`) VALUES
('gang_a', 'gang', 1),
('gang_dev', 'gang', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gang_account_data`
--

CREATE TABLE `gang_account_data` (
  `id` int(11) NOT NULL,
  `gang_name` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gang_account_data`
--

INSERT INTO `gang_account_data` (`id`, `gang_name`, `money`, `owner`) VALUES
(1, 'gang_hamid', 0, NULL),
(2, 'gang_dev', 0, NULL),
(3, 'gang_a', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gang_grades`
--

CREATE TABLE `gang_grades` (
  `id` int(11) NOT NULL,
  `gang_name` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gang_grades`
--

INSERT INTO `gang_grades` (`id`, `gang_name`, `grade`, `name`, `label`) VALUES
(1, 'none', 0, 'none', 'Unaffiliated'),
(2, 'gang', 0, 'soldato', 'Ptite-Frappe'),
(3, 'gang', 1, 'capo', 'Capo'),
(4, 'gang', 2, 'consigliere', 'Chef'),
(5, 'gang', 3, 'boss', 'Patron');

-- --------------------------------------------------------

--
-- Table structure for table `glovebox_inventory`
--

CREATE TABLE `glovebox_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hungerthirst`
--

CREATE TABLE `hungerthirst` (
  `idSteam` varchar(255) NOT NULL,
  `hunger` int(11) NOT NULL DEFAULT 100,
  `thirst` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `instagram_accounts`
--

CREATE TABLE `instagram_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `realUser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `instagram_likes`
--

CREATE TABLE `instagram_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `picId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `instagram_pics`
--

CREATE TABLE `instagram_pics` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(250) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `limit` int(11) NOT NULL DEFAULT -1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `label`, `weight`, `limit`, `rare`, `can_remove`, `price`) VALUES
(0, '100gbag', 'Ziploc Bag[100g]', 20, -1, 0, 1, 0),
(0, '1gbag', 'Ziploc Bag[1g]', 20, -1, 0, 1, 0),
(0, '50gbag', 'Ziploc Bag[50g]', 20, -1, 0, 1, 0),
(0, '5gbag', 'Ziploc Bag[5g]', 20, -1, 0, 1, 0),
(0, 'ammoanalyzer', 'Ammo Analyzer', NULL, 1, 0, 1, 0),
(0, 'beer', 'Beer', 20, -1, 0, 1, 0),
(0, 'binocular', 'Binoculars', 20, -1, 0, 1, 0),
(0, 'bloodsample', 'Blood Sample', NULL, 1, 0, 1, 0),
(0, 'blowtorch', 'Blowtorch', 20, -1, 0, 1, 0),
(NULL, 'bread', 'Pain', NULL, 10, 0, 1, 0),
(0, 'bulletsample', 'Bullet Casing', NULL, 1, 0, 1, 0),
(0, 'cashew', 'Cashew', 20, -1, 0, 1, 0),
(0, 'champagne', 'Champagne Bottle', 20, -1, 0, 1, 0),
(0, 'chips', 'Chips', 20, -1, 0, 1, 0),
(0, 'chocolate', 'Chocolate', 20, -1, 0, 1, 0),
(0, 'cigarette', 'Cigarette', 20, -1, 0, 1, 0),
(0, 'cocacola', 'Coca-Cola', 20, -1, 0, 1, 0),
(0, 'cupcake', 'Cupcake', 20, -1, 0, 1, 0),
(0, 'dnaanalyzer', 'DNA Analyzer', NULL, 1, 0, 1, 0),
(0, 'drill', 'Drill', 20, -1, 0, 1, 0),
(0, 'drpepper', 'Dr Pepper', 20, -1, 0, 1, 0),
(0, 'drugscales', 'Scales', 20, -1, 0, 1, 0),
(0, 'energy', 'Energy Drink', 20, -1, 0, 1, 0),
(0, 'fixkit', 'Fix Kit', 20, -1, 0, 1, 0),
(0, 'gps', 'GPS', 20, -1, 0, 1, 0),
(0, 'grand_cru', 'Champagne', 20, -1, 0, 1, 0),
(0, 'hamburger', 'Hamburger', 20, -1, 0, 1, 0),
(0, 'handcuffs', 'handcuffs', 0, -1, 0, 1, 0),
(0, 'highgradefert', 'Fertilizer [high]', 20, -1, 0, 1, 0),
(0, 'icetea', 'Ice-Tea', 20, -1, 0, 1, 0),
(0, 'lemonade', 'Lemonade', 20, -1, 0, 1, 0),
(0, 'lighter', 'Lighter', 20, -1, 0, 1, 0),
(0, 'lockpick', 'Lockpick', 20, -1, 0, 1, 0),
(0, 'lowgradefert', 'Fertilizer [low]', 20, -1, 0, 1, 0),
(NULL, 'odznaka', 'Badge Police', NULL, -1, 0, 1, 0),
(NULL, 'parkingcard', 'Parking Card', NULL, -1, 0, 1, 0),
(0, 'phone', 'Phone', 20, -1, 0, 1, 0),
(0, 'pistachio', 'Pistachio', 20, -1, 0, 1, 0),
(0, 'plantpot', 'Plant Pot', 20, -1, 0, 1, 0),
(0, 'rollingpaper', 'Rolling Paper', 20, -1, 0, 1, 0),
(0, 'rope', 'Rope', NULL, -1, 0, 1, 0),
(0, 'sandwich', 'Sandwich', 20, -1, 0, 1, 0),
(0, 'scubagear', 'Scuba Gear', 20, -1, 0, 1, 0),
(0, 'tequila', 'Tequila', 20, -1, 0, 1, 0),
(0, 'vodka', 'Vodka', 20, -1, 0, 1, 0),
(NULL, 'water', 'Eau', NULL, 5, 0, 1, 0),
(0, 'WEAPON_ADVANCEDRIFLE', 'Advanced Rifle', 1, -1, 0, 1, 0),
(0, 'WEAPON_ADVANCEDRIFLE_AMMO', 'Advanced Rifle Ammo', 1, -1, 0, 1, 0),
(0, 'WEAPON_APPISTOL', 'AP Pistol', 1, -1, 0, 1, 0),
(0, 'WEAPON_APPISTOL_AMMO', 'AP Pistol Ammo', 1, -1, 0, 1, 0),
(0, 'WEAPON_ASSAULTRIFLE', 'Assault Rifle', 1, -1, 0, 1, 0),
(0, 'WEAPON_ASSAULTRIFLE_AMMO', 'Assault Rifle Ammo', 1, -1, 0, 1, 0),
(0, 'WEAPON_ASSAULTSHOTGUN', 'Assault Shotgun', 1, -1, 0, 1, 0),
(0, 'WEAPON_ASSAULTSHOTGUN_AMMO', 'Assault Shotgun Ammo', 1, -1, 0, 1, 0),
(0, 'WEAPON_ASSAULTSMG', 'Assault SMG', 1, -1, 0, 1, 0),
(0, 'WEAPON_ASSAULTSMG_AMMO', 'Assault SMG Ammo', 1, -1, 0, 1, 0),
(0, 'WEAPON_AUTOSHOTGUN', 'Auto Shotgun', 1, -1, 0, 1, 0),
(0, 'WEAPON_AUTOSHOTGUN_AMMO', 'Auto Shotgun Ammo', 1, -1, 0, 1, 0),
(0, 'WEAPON_BAT', 'Baseball Bat', 1, -1, 0, 1, 0),
(0, 'WEAPON_CARBINERIFLE', 'Carbine Rifle', 1, -1, 0, 1, 0),
(0, 'WEAPON_CARBINERIFLE_AMMO', 'Carbin Rifle Ammo', 1, -1, 0, 1, 0),
(0, 'WEAPON_COMBATPISTOL', 'Combat Pistol', 1, -1, 0, 1, 0),
(0, 'WEAPON_COMBATPISTOL_AMMO', 'Combat Pistol Ammo', 1, -1, 0, 1, 0),
(0, 'WEAPON_FLASHLIGHT', 'Flashlight', 1, -1, 0, 1, 0),
(0, 'WEAPON_KNIFE', 'Knife', 100, -1, 1, 1, 0),
(0, 'WEAPON_PISTOL', 'Pistol', 1, -1, 0, 1, 0),
(0, 'WEAPON_PISTOL_AMMO', '9mm Rounds', 1, -1, 0, 1, 0),
(0, 'WEAPON_PUMPSHOTGUN', 'Pump Shotgun', 1, -1, 0, 1, 0),
(0, 'WEAPON_PUMPSHOTGUN_AMMO', 'Pump Shotgun Ammo', 1, -1, 0, 1, 0),
(0, 'WEAPON_SMG', 'SMG', 1, -1, 0, 1, 0),
(0, 'WEAPON_SMG_AMMO', 'Shotgun Shells', 1, -1, 0, 1, 0),
(0, 'WEAPON_STUNGUN', 'Taser', 100, -1, 1, 1, 0),
(0, 'whisky', 'Whisky', 20, -1, 0, 1, 0),
(0, 'wine', 'Wine', 20, -1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jail`
--

CREATE TABLE `jail` (
  `identifier` varchar(100) NOT NULL,
  `Jailtime` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('admin', 'Admin', 1),
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
('fbi', 'FBI', 0),
('fire', 'LSFD', 0),
('fisherman', 'Pêcheur', 0),
('foodtruck', 'Foodtruck', 1),
('fueler', 'Raffineur', 0),
('gang', 'Gang', 1),
('gopostal', 'Correios', 0),
('grove', 'Grove', 1),
('lumberjack', 'Bûcheron', 0),
('mafia', 'Mafia', 1),
('mechanic', 'Mécano', 0),
('miner', 'Mineur', 0),
('pizza', '?Pizzadelivery', 0),
('police', 'Police', 0),
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

-- --------------------------------------------------------

--
-- Table structure for table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
(2, 'lumberjack', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
(3, 'fisherman', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
(4, 'fueler', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
(5, 'reporter', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
(6, 'tailor', 0, 'employee', 'Intérimaire', 0, '{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}', '{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(7, 'miner', 0, 'employee', 'Intérimaire', 0, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}', '{}'),
(8, 'slaughterer', 0, 'employee', 'Intérimaire', 0, '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),
(9, 'ambulance', 0, 'ambulance', 'Ambulancier', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(10, 'ambulance', 1, 'doctor', 'Medecin', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(11, 'ambulance', 2, 'chief_doctor', 'Medecin-chef', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(12, 'ambulance', 3, 'boss', 'Chirurgien', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
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
(26, 'bus', 0, 'employee', 'Valores', 200, '{\"tshirt_1\":59,\"torso_1\":89,\"arms\":31,\"pants_1\":36,\"glasses_1\":19,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":2,\"glasses_2\":0,\"torso_2\":1,\"shoes\":35,\"hair_1\":0,\"skin\":0,\"sex\":0,\"glasses_1\":19,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":5}', '{\"tshirt_1\":36,\"torso_1\":0,\"arms\":68,\"pants_1\":30,\"glasses_1\":15,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":27,\"glasses_2\":0,\"torso_2\":11,\"shoes\":26,\"hair_1\":5,\"skin\":0,\"sex\":1,\"glasses_1\":15,\"pants_2\":2,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":19}'),
(27, 'coastguard', 0, 'employee', 'Valores', 200, '{\"tshirt_1\":59,\"torso_1\":89,\"arms\":31,\"pants_1\":36,\"glasses_1\":19,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":2,\"glasses_2\":0,\"torso_2\":1,\"shoes\":35,\"hair_1\":0,\"skin\":0,\"sex\":0,\"glasses_1\":19,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":5}', '{\"tshirt_1\":36,\"torso_1\":0,\"arms\":68,\"pants_1\":30,\"glasses_1\":15,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":27,\"glasses_2\":0,\"torso_2\":11,\"shoes\":26,\"hair_1\":5,\"skin\":0,\"sex\":1,\"glasses_1\":15,\"pants_2\":2,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":19}'),
(28, 'deliverer', 0, 'employee', 'Employee', 200, '{\"tshirt_1\":59,\"torso_1\":89,\"arms\":31,\"pants_1\":36,\"glasses_1\":19,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":2,\"glasses_2\":0,\"torso_2\":1,\"shoes\":35,\"hair_1\":0,\"skin\":0,\"sex\":0,\"glasses_1\":19,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":5}', '{\"tshirt_1\":36,\"torso_1\":0,\"arms\":68,\"pants_1\":30,\"glasses_1\":15,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":27,\"glasses_2\":0,\"torso_2\":11,\"shoes\":26,\"hair_1\":5,\"skin\":0,\"sex\":1,\"glasses_1\":15,\"pants_2\":2,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":19}'),
(29, 'dismay', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(30, 'dismay', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(31, 'dismay', 2, 'consigliere', 'Consigliere', 2100, '{}', '{}'),
(32, 'dismay', 3, 'boss', 'Parain', 2700, '{}', '{}'),
(37, 'foodtruck', 0, 'cook', 'Cook', 200, '{}', '{}'),
(38, 'foodtruck', 1, 'boss', 'Owner', 300, '{}', '{}'),
(39, 'gopostal', 0, 'employee', 'Sedex', 200, '{\"tshirt_1\":59,\"torso_1\":89,\"arms\":31,\"pants_1\":36,\"glasses_1\":19,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":2,\"glasses_2\":0,\"torso_2\":1,\"shoes\":35,\"hair_1\":0,\"skin\":0,\"sex\":0,\"glasses_1\":19,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":5}', '{\"tshirt_1\":36,\"torso_1\":0,\"arms\":68,\"pants_1\":30,\"glasses_1\":15,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":27,\"glasses_2\":0,\"torso_2\":11,\"shoes\":26,\"hair_1\":5,\"skin\":0,\"sex\":1,\"glasses_1\":15,\"pants_2\":2,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":19}'),
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
(109, 'taxi', 0, 'recrue', 'Recrue', 3000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(110, 'taxi', 1, 'novice', 'Novice', 4000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(111, 'taxi', 2, 'experimente', 'Experimente', 5000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(112, 'taxi', 3, 'uber', 'Uber', 6000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(113, 'taxi', 4, 'boss', 'Patron', 7000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(114, 'trucker', 0, 'employee', 'Employé', 200, '{\"tshirt_1\":59,\"torso_1\":89,\"arms\":31,\"pants_1\":36,\"glasses_1\":19,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":2,\"glasses_2\":0,\"torso_2\":1,\"shoes\":35,\"hair_1\":0,\"skin\":0,\"sex\":0,\"glasses_1\":19,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":5}', '{\"tshirt_1\":36,\"torso_1\":0,\"arms\":68,\"pants_1\":30,\"glasses_1\":15,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":27,\"glasses_2\":0,\"torso_2\":11,\"shoes\":26,\"hair_1\":5,\"skin\":0,\"sex\":1,\"glasses_1\":15,\"pants_2\":2,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":19}'),
(115, 'unicorn', 0, 'barman', 'Barman', 300, '{}', '{}'),
(116, 'unicorn', 1, 'dancer', 'Danseur', 300, '{}', '{}'),
(117, 'unicorn', 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
(118, 'unicorn', 3, 'boss', 'Gérant', 600, '{}', '{}'),
(119, 'vigne', 0, 'recrue', 'Interim', 500, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(120, 'vigne', 1, 'novice', 'Winegrower', 750, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(121, 'vigne', 2, 'cdisenior', 'Team boss', 1200, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(122, 'vigne', 3, 'boss', 'Boss', 1600, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":14,\"torso_2\":15,\"shoes_1\":12,\"shoes_2\":0,\"pants_1\":9, \"pants_2\":5, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(123, 'dock', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
(124, 'dock', 1, 'novice', 'Novice', 25, '{}', '{}'),
(125, 'dock', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
(126, 'dock', 3, 'boss', 'Patron', 0, '{}', '{}'),
(127, 'fbi', 0, 'agent', 'Agent', 20, '{}', '{}'),
(128, 'fbi', 1, 'special', 'Experienced Agent', 40, '{}', '{}'),
(129, 'fbi', 2, 'supervisor', 'Supervisor', 60, '{}', '{}'),
(130, 'fbi', 3, 'assistant', 'Assistant Director', 85, '{}', '{}'),
(131, 'fbi', 4, 'boss', 'Director', 100, '{}', '{}'),
(133, 'admin', 0, 'low admin', 'Low admin', 250, '{}', '{}'),
(134, 'admin', 1, 'meduim admin', 'Meduim admin', 500, '{}', '{}'),
(135, 'admin', 2, 'high admin', 'High admin', 750, '{}', '{}'),
(136, 'admin', 3, 'Owner', 'Owner', 1000, '{}', '{}'),
(159, 'offpolice', 0, 'recruit', 'Fuera de Servicio', 200, '{}', '{}'),
(160, 'offpolice', 1, 'officer', 'Fuera de Servicio', 200, '{}', '{}'),
(161, 'offpolice', 2, 'sergeant', 'Fuera de Servicio', 200, '{}', '{}'),
(162, 'offpolice', 3, 'lieutenant', 'Fuera de Servicio', 200, '{}', '{}'),
(163, 'offpolice', 4, 'boss', 'Fuera de Servicio', 200, '{}', '{}'),
(164, 'offpolice', 5, 'boss', 'Fuera de Servicio', 200, '{}', '{}'),
(165, 'offambulance', 0, 'ambulance', 'Fuera de Servicio', 200, '{}', '{}'),
(166, 'offambulance', 1, 'doctor', 'Fuera de Servicio', 200, '{}', '{}'),
(167, 'offambulance', 2, 'chef', 'Fuera de Servicio', 200, '{}', '{}'),
(168, 'offambulance', 3, 'boss', 'Fuera de Servicio', 200, '{}', '{}'),
(169, 'offtend', 0, 'employee', 'Fuera de Servicio', 200, '{}', '{}'),
(170, 'offtend', 1, 'boss', 'Fuera de Servicio', 200, '{}', '{}'),
(171, 'offmech', 0, 'boss', 'Fuera de Servicio', 200, '{}', '{}'),
(172, 'offmech', 1, 'novice', 'Fuera de Servicio', 200, '{}', '{}'),
(173, 'offmech', 2, 'experimente', 'Fuera de Servicio', 200, '{}', '{}'),
(174, 'offmech', 3, 'chief', 'Fuera de Servicio', 200, '{}', '{}'),
(175, 'offmech', 4, 'boss', 'Fuera de Servicio', 200, '{}', '{}'),
(176, 'police', 0, 'recruit', 'sarbaz sefr', 20, '{}', '{}'),
(177, 'police', 1, 'officer', 'sarbaz', 40, '{}', '{}'),
(178, 'police', 2, 'sergeant', 'gorhban', 60, '{}', '{}'),
(179, 'police', 3, 'lieutenant', 'ostovar', 85, '{}', '{}'),
(180, 'police', 4, 'chief', 'sargord', 100, '{}', '{}'),
(181, 'police', 5, 'boss', 'sarhang', 100, '{}', '{}'),
(182, 'ambulance', 0, 'ambulance', 'Ambulancier', 20, '{}', '{}'),
(183, 'ambulance', 1, 'ambulance', 'Medecin', 40, '{}', '{}'),
(184, 'ambulance', 2, 'ambulance', 'Chirurgien', 80, '{}', '{}'),
(185, 'gang', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(186, 'gang', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(187, 'gang', 2, 'consigliere', 'Chef', 2100, '{}', '{}'),
(188, 'gang', 3, 'boss', 'Patron', 2700, '{}', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `jsfour_atm`
--

CREATE TABLE `jsfour_atm` (
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jsfour_atm`
--

INSERT INTO `jsfour_atm` (`identifier`, `account`) VALUES
('steam:1100001374d7ce1', '8423461914'),
('steam:11000011c609b9f', '3591400146');

-- --------------------------------------------------------

--
-- Table structure for table `kc_bans`
--

CREATE TABLE `kc_bans` (
  `id` int(11) NOT NULL,
  `identifier` varchar(100) NOT NULL DEFAULT '0',
  `license` varchar(100) NOT NULL,
  `reason` varchar(250) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '127.0.0.1',
  `admin_name` varchar(100) NOT NULL DEFAULT '0',
  `admin_identifier` varchar(100) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kc_jails`
--

CREATE TABLE `kc_jails` (
  `id` int(11) NOT NULL,
  `license` varchar(100) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '0',
  `admin_name` varchar(100) NOT NULL DEFAULT '0',
  `admin_identifier` varchar(100) NOT NULL DEFAULT '0',
  `time` varchar(100) NOT NULL DEFAULT '0',
  `time_s` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kc_warns`
--

CREATE TABLE `kc_warns` (
  `id` int(11) NOT NULL,
  `identifier` varchar(100) NOT NULL DEFAULT '0',
  `license` varchar(100) NOT NULL DEFAULT '0',
  `reason` varchar(250) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL DEFAULT '0',
  `admin_name` varchar(250) NOT NULL DEFAULT '0',
  `admin_identifier` varchar(100) NOT NULL DEFAULT '0',
  `timestamp` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kicks`
--

CREATE TABLE `kicks` (
  `ID` int(255) NOT NULL,
  `license` varchar(1024) NOT NULL,
  `reason` varchar(1024) NOT NULL,
  `staff_name` varchar(255) NOT NULL,
  `staff_steamid` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('boat', 'Boat License'),
('dmv', 'Code de la route'),
('drive', 'Permis de conduire'),
('drive_bike', 'Permis moto'),
('drive_truck', 'Permis camion'),
('weapon', 'Permis de port d\'arme'),
('weed_processing', 'Weed Processing License');

-- --------------------------------------------------------

--
-- Table structure for table `mdt_reports`
--

CREATE TABLE `mdt_reports` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_warrants`
--

CREATE TABLE `mdt_warrants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `owned_dock`
--

CREATE TABLE `owned_dock` (
  `id` int(11) NOT NULL,
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  `shared` varchar(60) DEFAULT NULL,
  `arleady_owned` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `owned_shops`
--

CREATE TABLE `owned_shops` (
  `identifier` varchar(250) DEFAULT NULL,
  `ShopNumber` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT 0,
  `ShopValue` int(11) DEFAULT NULL,
  `LastRobbery` int(11) DEFAULT 0,
  `ShopName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owned_shops`
--

INSERT INTO `owned_shops` (`identifier`, `ShopNumber`, `money`, `ShopValue`, `LastRobbery`, `ShopName`) VALUES
('0', 1, 0, 280000, 1549643682, '0'),
('0', 2, 0, 220000, 1549643682, '0'),
('0', 3, 0, 235000, 1549643682, '0'),
('0', 4, 0, 285000, 1549643682, '0'),
('0', 5, 0, 135000, 1549643682, '0'),
('0', 6, 0, 235000, 1549643682, '0'),
('0', 7, 0, 160000, 1549643682, '0'),
('0', 8, 0, 275000, 1549643682, '0'),
('0', 9, 0, 265000, 1549643682, '0'),
('0', 10, 0, 300000, 1549643682, '0'),
('0', 12, 0, 145000, 1549643682, '0'),
('0', 13, 0, 145000, 1549643682, '0'),
('0', 14, 0, 280000, 1549643682, '0'),
('0', 15, 0, 300000, 1549643682, '0'),
('0', 16, 0, 435000, 1549643682, '0'),
('0', 18, 0, 235000, 1549643682, '0'),
('0', 11, 0, 225000, 1549643682, '0'),
('0', 19, 0, 150000, 1549643682, '0'),
('0', 20, 0, 165000, 1549643682, '0'),
('0', 17, 0, 150000, 1549643682, '0');

-- --------------------------------------------------------

--
-- Table structure for table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(60) NOT NULL,
  `vehicle` longtext NOT NULL,
  `plate` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'car',
  `job` varchar(50) DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Etat de la voiture',
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'State of the car',
  `garage_name` varchar(50) NOT NULL DEFAULT 'Garage_Centre',
  `fourrieremecano` tinyint(1) NOT NULL DEFAULT 0,
  `vehiclename` varchar(50) NOT NULL DEFAULT 'voiture'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`owner`, `vehicle`, `plate`, `type`, `job`, `stored`, `state`, `garage_name`, `fourrieremecano`, `vehiclename`) VALUES
('steam:11000011c609b9f', '{\"plate\":\"HAMID1\",\"modArchCover\":-1,\"plateIndex\":2,\"modDashboard\":-1,\"color2\":41,\"wheelColor\":156,\"modStruts\":-1,\"modXenon\":1,\"tyreSmokeColor\":[0,245,255],\"modHorns\":-1,\"modRearBumper\":-1,\"modSpoilers\":4,\"modFender\":-1,\"modTank\":-1,\"modEngine\":3,\"bodyHealth\":1000.0,\"modTurbo\":1,\"modWindows\":-1,\"modAPlate\":-1,\"modSuspension\":-1,\"modSteeringWheel\":-1,\"modTrimB\":-1,\"dirtLevel\":7.3,\"modHydrolic\":-1,\"modArmor\":4,\"modRightFender\":-1,\"modEngineBlock\":-1,\"neonEnabled\":[1,1,1,1],\"modFrontWheels\":-1,\"modAirFilter\":-1,\"modTransmission\":2,\"neonColor\":[0,245,255],\"modDoorSpeaker\":-1,\"modFrame\":1,\"fuelLevel\":59.7,\"modTrunk\":-1,\"modShifterLeavers\":-1,\"color1\":12,\"modGrille\":-1,\"model\":-1403128555,\"windowTint\":-1,\"modLivery\":-1,\"modSideSkirt\":1,\"modSeats\":-1,\"modExhaust\":2,\"modBrakes\":2,\"pearlescentColor\":12,\"modVanityPlate\":-1,\"extras\":[],\"modPlateHolder\":-1,\"modTrimA\":-1,\"modDial\":-1,\"modBackWheels\":-1,\"wheels\":7,\"modOrnaments\":-1,\"modHood\":1,\"modSpeakers\":-1,\"modRoof\":-1,\"modAerials\":-1,\"modFrontBumper\":-1,\"engineHealth\":1000.0,\"modSmokeEnabled\":1}', 'HAMID1', 'car', NULL, 2, 1, 'Garage_Centre', 0, 'voiture'),
('steam:11000011c609b9f', '{\"modTank\":-1,\"modSideSkirt\":-1,\"neonColor\":[255,0,255],\"modTurbo\":false,\"modSpeakers\":-1,\"color2\":0,\"modHood\":-1,\"bodyHealth\":999.0,\"model\":-1848994066,\"modHydrolic\":-1,\"modTrunk\":-1,\"modVanityPlate\":-1,\"modLivery\":-1,\"modArchCover\":-1,\"modRoof\":-1,\"color1\":64,\"plateIndex\":0,\"modDashboard\":-1,\"modStruts\":-1,\"modAPlate\":-1,\"modRearBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrimB\":-1,\"modEngine\":-1,\"modShifterLeavers\":-1,\"modSteeringWheel\":-1,\"modAerials\":-1,\"modFender\":-1,\"modArmor\":-1,\"modOrnaments\":-1,\"wheels\":0,\"wheelColor\":0,\"modSpoilers\":-1,\"modSmokeEnabled\":1,\"modSuspension\":-1,\"modHorns\":-1,\"modDoorSpeaker\":-1,\"modTrimA\":-1,\"modBackWheels\":-1,\"plate\":\"HAMID2\",\"windowTint\":-1,\"modGrille\":-1,\"extras\":[],\"modSeats\":-1,\"pearlescentColor\":73,\"modXenon\":false,\"modRightFender\":-1,\"fuelLevel\":71.3,\"modFrame\":-1,\"modExhaust\":-1,\"modWindows\":-1,\"modEngineBlock\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"modFrontBumper\":-1,\"modAirFilter\":-1,\"modPlateHolder\":-1,\"modDial\":-1,\"neonEnabled\":[false,false,false,false],\"dirtLevel\":5.0,\"modFrontWheels\":-1,\"engineHealth\":1000.0}', 'HAMID2', 'car', NULL, 2, 1, 'Garage_Centre', 0, 'voiture'),
('steam:1100001374d7ce1', '{\"modRightFender\":-1,\"fuelLevel\":53.3,\"extras\":{\"1\":true,\"12\":false},\"modFrontWheels\":-1,\"modStruts\":-1,\"dirtLevel\":0.0,\"model\":-1627000575,\"modSpeakers\":-1,\"plate\":\"IYM 875\",\"modFender\":-1,\"neonColor\":[255,0,255],\"modTrunk\":-1,\"modSideSkirt\":-1,\"modVanityPlate\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"modSeats\":-1,\"modEngine\":-1,\"modSuspension\":-1,\"color1\":134,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":4,\"modArchCover\":-1,\"modTurbo\":false,\"modTrimB\":-1,\"modLivery\":0,\"modHorns\":-1,\"modWindows\":-1,\"neonEnabled\":[false,false,false,false],\"modAirFilter\":-1,\"modFrame\":-1,\"modArmor\":-1,\"modTank\":-1,\"modHydrolic\":-1,\"modBackWheels\":-1,\"modOrnaments\":-1,\"modAPlate\":-1,\"modHood\":-1,\"windowTint\":-1,\"modShifterLeavers\":-1,\"modRoof\":-1,\"wheels\":0,\"modSmokeEnabled\":false,\"modTransmission\":-1,\"modAerials\":-1,\"modSteeringWheel\":-1,\"modDoorSpeaker\":-1,\"modExhaust\":-1,\"modPlateHolder\":-1,\"engineHealth\":1000.0,\"modTrimA\":-1,\"bodyHealth\":1000.0,\"modSpoilers\":-1,\"wheelColor\":156,\"pearlescentColor\":0,\"modBrakes\":-1,\"modDial\":-1,\"color2\":0,\"modEngineBlock\":-1,\"modXenon\":false,\"modGrille\":-1}', 'IYM 875', 'car', 'police', 0, 1, 'Garage_Centre', 0, 'voiture'),
('steam:11000013c742c7c', '{\"modTurbo\":false,\"wheelColor\":156,\"modRearBumper\":-1,\"modFrontWheels\":-1,\"modTransmission\":-1,\"tyreSmokeColor\":[255,255,255],\"fuelLevel\":65.0,\"modRightFender\":-1,\"modArmor\":-1,\"pearlescentColor\":111,\"modSpoilers\":-1,\"modSteeringWheel\":-1,\"modWindows\":-1,\"dirtLevel\":11.0,\"neonColor\":[255,0,255],\"wheels\":0,\"modAirFilter\":-1,\"modExhaust\":-1,\"color2\":0,\"modArchCover\":-1,\"modRoof\":-1,\"color1\":6,\"plateIndex\":0,\"modBrakes\":-1,\"modBackWheels\":-1,\"modOrnaments\":-1,\"modSpeakers\":-1,\"bodyHealth\":1000.0,\"plate\":\"KLE 274\",\"extras\":{\"12\":false,\"10\":false},\"modEngine\":-1,\"modSideSkirt\":-1,\"modEngineBlock\":-1,\"modTank\":-1,\"engineHealth\":1000.0,\"modSuspension\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"modHydrolic\":-1,\"modShifterLeavers\":-1,\"modFender\":-1,\"neonEnabled\":[false,false,false,false],\"modHorns\":-1,\"modSeats\":-1,\"modAerials\":-1,\"modDoorSpeaker\":-1,\"modFrame\":-1,\"windowTint\":-1,\"modTrimB\":-1,\"modStruts\":-1,\"modVanityPlate\":-1,\"modXenon\":false,\"modPlateHolder\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modSmokeEnabled\":1,\"model\":-344943009,\"modAPlate\":-1,\"modFrontBumper\":-1,\"modDial\":-1,\"modLivery\":-1,\"modGrille\":-1}', 'KLE 274', 'car', NULL, 0, 1, 'Garage_Centre', 0, 'voiture'),
('steam:11000011c609b9f', '{\"modHydrolic\":-1,\"neonColor\":[255,0,255],\"modTurbo\":false,\"wheels\":1,\"modDashboard\":-1,\"modArchCover\":-1,\"bodyHealth\":1000.0,\"modAerials\":-1,\"modDial\":-1,\"modRoof\":-1,\"modTank\":-1,\"pearlescentColor\":0,\"color1\":134,\"modExhaust\":-1,\"color2\":134,\"modEngine\":-1,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modStruts\":-1,\"modSmokeEnabled\":false,\"modFrame\":-1,\"modSpoilers\":-1,\"modFender\":-1,\"extras\":{\"1\":true,\"2\":false},\"modOrnaments\":-1,\"modSideSkirt\":-1,\"wheelColor\":156,\"modBrakes\":-1,\"modRightFender\":-1,\"windowTint\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"tyreSmokeColor\":[255,255,255],\"modAPlate\":-1,\"modSeats\":-1,\"modFrontBumper\":-1,\"modSteeringWheel\":-1,\"modRearBumper\":-1,\"modHood\":-1,\"modGrille\":-1,\"model\":2046537925,\"modTrimA\":-1,\"modDoorSpeaker\":-1,\"modHorns\":-1,\"dirtLevel\":2.0,\"modPlateHolder\":-1,\"fuelLevel\":30.9,\"plateIndex\":4,\"neonEnabled\":[false,false,false,false],\"modFrontWheels\":-1,\"modSpeakers\":-1,\"modTrimB\":-1,\"plate\":\"LTF 646\",\"modArmor\":-1,\"modXenon\":false,\"modSuspension\":-1,\"modWindows\":-1,\"modLivery\":0,\"modEngineBlock\":-1,\"modTransmission\":-1,\"modAirFilter\":-1,\"modBackWheels\":-1}', 'LTF 646', 'car', 'police', 0, 1, 'Garage_Centre', 0, 'voiture'),
('steam:1100001374d7ce1', '{\"modDial\":-1,\"modSuspension\":-1,\"modEngineBlock\":-1,\"neonEnabled\":[false,false,false,false],\"modGrille\":-1,\"modFrame\":-1,\"wheelColor\":156,\"wheels\":1,\"modBackWheels\":-1,\"engineHealth\":1000.0,\"pearlescentColor\":1,\"color1\":111,\"model\":-1683328900,\"modExhaust\":-1,\"modFrontWheels\":-1,\"modRearBumper\":-1,\"modTrunk\":-1,\"modSpoilers\":-1,\"modHood\":-1,\"bodyHealth\":1000.0,\"modBrakes\":-1,\"modFender\":-1,\"dirtLevel\":0.0,\"modAirFilter\":-1,\"modArmor\":-1,\"modRightFender\":-1,\"modStruts\":-1,\"modAerials\":-1,\"modEngine\":-1,\"modShifterLeavers\":-1,\"modTurbo\":false,\"modTank\":-1,\"modSmokeEnabled\":1,\"modSteeringWheel\":-1,\"modWindows\":-1,\"modDashboard\":-1,\"modRoof\":-1,\"neonColor\":[255,0,255],\"modArchCover\":-1,\"plateIndex\":4,\"modFrontBumper\":-1,\"modSideSkirt\":-1,\"windowTint\":-1,\"modHorns\":-1,\"modDoorSpeaker\":-1,\"modAPlate\":-1,\"extras\":{\"1\":false,\"5\":true,\"2\":false,\"12\":false,\"10\":true},\"modLivery\":0,\"modHydrolic\":-1,\"plate\":\"NGU 243\",\"modOrnaments\":-1,\"modSeats\":-1,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"fuelLevel\":53.1,\"modTrimA\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrimB\":-1,\"modSpeakers\":-1,\"color2\":0,\"modTransmission\":-1,\"modXenon\":false}', 'NGU 243', 'car', 'police', 0, 1, 'Garage_Centre', 0, 'voiture'),
('steam:1100001374d7ce1', '{\"modDial\":-1,\"modSuspension\":-1,\"modEngineBlock\":-1,\"neonEnabled\":[false,false,false,false],\"modGrille\":-1,\"modFrame\":-1,\"wheelColor\":156,\"wheels\":5,\"modBackWheels\":-1,\"engineHealth\":999.6,\"pearlescentColor\":111,\"color1\":4,\"model\":-1809822327,\"modExhaust\":-1,\"modFrontWheels\":-1,\"modRearBumper\":-1,\"modTrunk\":-1,\"modSpoilers\":-1,\"modHood\":-1,\"bodyHealth\":999.3,\"modBrakes\":-1,\"modFender\":-1,\"dirtLevel\":3.5,\"modAirFilter\":-1,\"modArmor\":-1,\"modRightFender\":-1,\"modStruts\":-1,\"modAerials\":-1,\"modEngine\":-1,\"modShifterLeavers\":-1,\"modTurbo\":false,\"modTank\":-1,\"modSmokeEnabled\":1,\"modSteeringWheel\":-1,\"modWindows\":-1,\"modDashboard\":-1,\"modRoof\":-1,\"neonColor\":[255,0,255],\"modArchCover\":-1,\"plateIndex\":0,\"modFrontBumper\":-1,\"modSideSkirt\":-1,\"windowTint\":-1,\"modHorns\":-1,\"modDoorSpeaker\":-1,\"modAPlate\":-1,\"extras\":{\"11\":false,\"10\":true},\"modLivery\":-1,\"modHydrolic\":-1,\"plate\":\"PEV 832\",\"modOrnaments\":-1,\"modSeats\":-1,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"fuelLevel\":23.6,\"modTrimA\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrimB\":-1,\"modSpeakers\":-1,\"color2\":4,\"modTransmission\":-1,\"modXenon\":false}', 'PEV 832', 'car', NULL, 0, 1, 'Garage_Centre', 0, 'voiture'),
('steam:1100001374d7ce1', '{\"modRightFender\":-1,\"fuelLevel\":53.3,\"extras\":{\"1\":true,\"12\":false},\"modFrontWheels\":-1,\"modStruts\":-1,\"dirtLevel\":0.0,\"model\":-1627000575,\"modSpeakers\":-1,\"plate\":\"WHE 681\",\"modFender\":-1,\"neonColor\":[255,0,255],\"modTrunk\":-1,\"modSideSkirt\":-1,\"modVanityPlate\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"modSeats\":-1,\"modEngine\":-1,\"modSuspension\":-1,\"color1\":134,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":4,\"modArchCover\":-1,\"modTurbo\":false,\"modTrimB\":-1,\"modLivery\":0,\"modHorns\":-1,\"modWindows\":-1,\"neonEnabled\":[false,false,false,false],\"modAirFilter\":-1,\"modFrame\":-1,\"modArmor\":-1,\"modTank\":-1,\"modHydrolic\":-1,\"modBackWheels\":-1,\"modOrnaments\":-1,\"modAPlate\":-1,\"modHood\":-1,\"windowTint\":-1,\"modShifterLeavers\":-1,\"modRoof\":-1,\"wheels\":0,\"modSmokeEnabled\":false,\"modTransmission\":-1,\"modAerials\":-1,\"modSteeringWheel\":-1,\"modDoorSpeaker\":-1,\"modExhaust\":-1,\"modPlateHolder\":-1,\"engineHealth\":1000.0,\"modTrimA\":-1,\"bodyHealth\":1000.0,\"modSpoilers\":-1,\"wheelColor\":156,\"pearlescentColor\":0,\"modBrakes\":-1,\"modDial\":-1,\"color2\":0,\"modEngineBlock\":-1,\"modXenon\":false,\"modGrille\":-1}', 'WHE 681', 'car', 'police', 1, 1, 'Garage_Centre', 0, 'voiture'),
('steam:1100001374d7ce1', '{\"neonEnabled\":[false,false,false,false],\"engineHealth\":1000.0,\"modVanityPlate\":-1,\"modTank\":-1,\"modLivery\":0,\"modAerials\":-1,\"modSpeakers\":-1,\"modFrontBumper\":-1,\"modBrakes\":-1,\"plate\":\"XSW 392\",\"plateIndex\":4,\"modGrille\":-1,\"modHorns\":-1,\"modFrontWheels\":-1,\"fuelLevel\":32.2,\"modArmor\":-1,\"modTurbo\":false,\"modTrimA\":-1,\"modSuspension\":-1,\"model\":1341474454,\"color2\":134,\"modHood\":-1,\"modSpoilers\":-1,\"wheelColor\":0,\"modTrimB\":-1,\"pearlescentColor\":0,\"modStruts\":-1,\"modShifterLeavers\":-1,\"modSideSkirt\":-1,\"modRightFender\":-1,\"modAirFilter\":-1,\"modEngine\":-1,\"bodyHealth\":1000.0,\"modWindows\":-1,\"modAPlate\":-1,\"modBackWheels\":-1,\"color1\":134,\"modXenon\":false,\"modDashboard\":-1,\"wheels\":0,\"modOrnaments\":-1,\"modTrunk\":-1,\"modHydrolic\":-1,\"neonColor\":[255,0,255],\"modPlateHolder\":-1,\"modExhaust\":-1,\"modTransmission\":-1,\"modFrame\":-1,\"modSeats\":-1,\"dirtLevel\":3.0,\"modSteeringWheel\":-1,\"modSmokeEnabled\":false,\"modRoof\":-1,\"modDoorSpeaker\":-1,\"windowTint\":-1,\"modDial\":-1,\"extras\":{\"2\":true,\"3\":true,\"1\":true,\"7\":true,\"4\":true,\"5\":true},\"modEngineBlock\":-1,\"modFender\":-1,\"tyreSmokeColor\":[255,255,255],\"modArchCover\":-1,\"modRearBumper\":-1}', 'XSW 392', 'car', 'police', 0, 1, 'Garage_Centre', 0, 'voiture');

-- --------------------------------------------------------

--
-- Table structure for table `owner_vehicles`
--

CREATE TABLE `owner_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peage_flash`
--

CREATE TABLE `peage_flash` (
  `id` int(11) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `speed` int(11) NOT NULL,
  `modele` varchar(25) NOT NULL,
  `station` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peage_flash`
--

INSERT INTO `peage_flash` (`id`, `plate`, `speed`, `modele`, `station`) VALUES
(1, '09JBK526', 168, 'T20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `ID` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `steam` varchar(255) NOT NULL,
  `playtime` int(255) NOT NULL DEFAULT 0,
  `firstjoined` varchar(255) NOT NULL,
  `lastplayed` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qalle_brottsregister`
--

CREATE TABLE `qalle_brottsregister` (
  `id` int(255) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofcrime` varchar(255) NOT NULL,
  `crime` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rented_dock`
--

CREATE TABLE `rented_dock` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `ID` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `rcon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int(11) DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `count` varchar(50) DEFAULT NULL,
  `time` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `shops2`
--

CREATE TABLE `shops2` (
  `id` int(11) NOT NULL,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `truck_inventory`
--

CREATE TABLE `truck_inventory` (
  `id` int(11) NOT NULL,
  `item` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owned` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trunk_inventory`
--

CREATE TABLE `trunk_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `twitter_accounts`
--

INSERT INTO `twitter_accounts` (`id`, `username`, `password`, `avatar_url`) VALUES
(38, 'Hamid', '123456', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `twitter_likes`
--

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `twitter_tweets`
--

INSERT INTO `twitter_tweets` (`id`, `authorId`, `realUser`, `message`, `time`, `likes`) VALUES
(170, 38, 'steam:11000011c609b9f', 'Hello', '2020-05-13 07:19:30', 0),
(171, 38, 'steam:11000011c609b9f', 'Hello', '2020-05-13 07:19:35', 0),
(172, 38, 'steam:11000011c609b9f', 'Dahanet Gaeidas', '2020-05-13 07:58:39', 0),
(173, 38, 'steam:11000011c609b9f', 'OSkol', '2020-05-13 08:35:08', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `gang` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `gang_grade` int(11) DEFAULT NULL,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
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
  `is_dead` tinyint(1) DEFAULT 0,
  `phone_number` int(11) DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `tattoos` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `skellydata` longtext COLLATE utf8mb4_bin NOT NULL,
  `jail` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `gang`, `gang_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `pet`, `is_dead`, `phone_number`, `last_property`, `status`, `tattoos`, `skellydata`, `jail`) VALUES
('steam:11000013c742c7c', 'license:2fb4c87a5078639b770392ca0ca38c7a1c1ac41e', 992000, 'kelputoo CSGO500', '{\"makeup_3\":0,\"sun_2\":0,\"complexion_1\":0,\"arms_2\":0,\"eye_color\":0,\"sun_1\":0,\"lipstick_3\":0,\"tshirt_2\":0,\"decals_2\":0,\"hair_2\":0,\"bracelets_1\":-1,\"hair_color_2\":0,\"eyebrows_3\":0,\"glasses_1\":0,\"bracelets_2\":0,\"makeup_4\":0,\"age_2\":0,\"hair_color_1\":0,\"mask_1\":0,\"beard_3\":0,\"chest_1\":0,\"decals_1\":0,\"blemishes_2\":0,\"bags_2\":0,\"blush_2\":0,\"torso_1\":0,\"glasses_2\":0,\"blemishes_1\":0,\"chest_3\":0,\"sex\":0,\"bproof_2\":0,\"tshirt_1\":0,\"eyebrows_1\":0,\"beard_2\":0,\"chest_2\":0,\"shoes_1\":0,\"arms\":0,\"makeup_1\":0,\"pants_1\":0,\"watches_2\":0,\"chain_1\":0,\"beard_4\":0,\"lipstick_2\":0,\"moles_2\":0,\"skin\":0,\"complexion_2\":0,\"eyebrows_4\":0,\"torso_2\":0,\"makeup_2\":0,\"mask_2\":0,\"bags_1\":0,\"watches_1\":-1,\"beard_1\":0,\"ears_2\":0,\"blush_3\":0,\"face\":0,\"lipstick_1\":0,\"pants_2\":0,\"blush_1\":0,\"ears_1\":-1,\"age_1\":0,\"helmet_1\":-1,\"helmet_2\":0,\"bproof_1\":0,\"moles_1\":0,\"lipstick_4\":0,\"bodyb_1\":0,\"shoes_2\":0,\"bodyb_2\":0,\"eyebrows_2\":0,\"chain_2\":0,\"hair_1\":0}', 'gopostal', 0, NULL, NULL, '[]', '{\"z\":30.7,\"y\":-799.0,\"x\":219.2}', 490, 4, 'superadmin', 'Ruben', 'Ribeiro', '2001-02-04', 'm', '200', '', 0, 38696, NULL, '[{\"percent\":42.73,\"name\":\"hunger\",\"val\":427300},{\"percent\":44.5475,\"name\":\"thirst\",\"val\":445475},{\"percent\":0.0,\"name\":\"drug\",\"val\":0},{\"percent\":0.0,\"name\":\"drunk\",\"val\":0}]', NULL, '', 0),
('steam:11000010ef561cd', 'license:bdc3d8478bebabeef465af3c9f879cad55b078fe', 2249509, 'Tony Mirandelas', '{\"makeup_3\":0,\"sun_2\":0,\"complexion_1\":0,\"arms_2\":0,\"face\":0,\"sun_1\":0,\"lipstick_3\":0,\"tshirt_2\":0,\"decals_2\":0,\"hair_2\":0,\"bracelets_1\":-1,\"hair_color_2\":0,\"eyebrows_3\":0,\"glasses_1\":0,\"bracelets_2\":0,\"makeup_4\":0,\"age_2\":0,\"hair_color_1\":0,\"mask_1\":0,\"beard_3\":0,\"chest_1\":0,\"decals_1\":0,\"blemishes_2\":0,\"bags_2\":0,\"lipstick_1\":0,\"torso_1\":0,\"glasses_2\":0,\"helmet_2\":0,\"chest_3\":0,\"sex\":0,\"bproof_2\":0,\"tshirt_1\":0,\"eyebrows_1\":0,\"beard_2\":0,\"chest_2\":0,\"shoes_1\":0,\"arms\":0,\"makeup_1\":0,\"pants_1\":0,\"watches_2\":0,\"chain_1\":0,\"beard_4\":0,\"lipstick_2\":0,\"moles_2\":0,\"skin\":0,\"complexion_2\":0,\"eyebrows_4\":0,\"torso_2\":0,\"makeup_2\":0,\"mask_2\":0,\"bags_1\":0,\"watches_1\":-1,\"beard_1\":0,\"ears_2\":0,\"helmet_1\":-1,\"blush_2\":0,\"bproof_1\":0,\"ears_1\":-1,\"blush_1\":0,\"age_1\":0,\"pants_2\":0,\"shoes_2\":0,\"chain_2\":0,\"blemishes_1\":0,\"moles_1\":0,\"lipstick_4\":0,\"eye_color\":0,\"bodyb_1\":0,\"blush_3\":0,\"hair_1\":0,\"eyebrows_2\":0,\"bodyb_2\":0}', 'mechanic', 3, NULL, NULL, '[]', '{\"x\":-338.9,\"y\":-135.2,\"z\":38.4}', 330, 0, 'user', 'Tony ', 'Mirandelas', '541561516', 'm', '145', '', 0, 71009, NULL, '[{\"percent\":91.54,\"val\":915400,\"name\":\"hunger\"},{\"percent\":93.655,\"val\":936550,\"name\":\"thirst\"},{\"percent\":0.0,\"val\":0,\"name\":\"drug\"},{\"percent\":0.0,\"val\":0,\"name\":\"drunk\"}]', NULL, '', 0),
('steam:1100001374d7ce1', 'license:fd9f598393777451b8d7af11718aef4a5b47d865', 15589, 'Parsa', '{\"sun_1\":0,\"lipstick_4\":0,\"beard_1\":0,\"bproof_2\":0,\"shoes_1\":10,\"arms_2\":0,\"makeup_2\":0,\"bags_2\":0,\"tshirt_1\":15,\"shoes_2\":0,\"hair_color_2\":0,\"makeup_3\":0,\"glasses_2\":0,\"glasses_1\":7,\"eyebrows_1\":0,\"decals_2\":0,\"lipstick_1\":0,\"eye_color\":0,\"decals_1\":0,\"chest_2\":0,\"torso_2\":0,\"bracelets_1\":-1,\"helmet_1\":106,\"moles_1\":0,\"chain_1\":0,\"makeup_1\":0,\"ears_1\":-1,\"mask_1\":0,\"age_1\":0,\"hair_1\":0,\"sex\":0,\"bodyb_2\":0,\"beard_2\":0,\"chest_1\":0,\"eyebrows_3\":0,\"torso_1\":43,\"complexion_2\":0,\"moles_2\":0,\"age_2\":0,\"face\":0,\"watches_1\":-1,\"chest_3\":0,\"tshirt_2\":0,\"blush_3\":0,\"beard_3\":0,\"helmet_2\":20,\"lipstick_2\":0,\"bproof_1\":0,\"bodyb_1\":0,\"pants_2\":0,\"lipstick_3\":0,\"hair_color_1\":0,\"complexion_1\":0,\"eyebrows_2\":0,\"blemishes_2\":0,\"sun_2\":0,\"hair_2\":0,\"beard_4\":0,\"skin\":0,\"eyebrows_4\":0,\"arms\":59,\"blush_1\":0,\"bracelets_2\":0,\"blush_2\":0,\"ears_2\":0,\"makeup_4\":0,\"blemishes_1\":0,\"chain_2\":0,\"mask_2\":0,\"pants_1\":10,\"bags_1\":0,\"watches_2\":0}', 'ambulance', 3, NULL, NULL, '[{\"ammo\":0,\"label\":\"Nightstick\",\"components\":[],\"name\":\"WEAPON_NIGHTSTICK\"},{\"ammo\":670,\"label\":\"Combat pistol\",\"components\":[\"clip_extended\",\"flashlight\",\"suppressor\"],\"name\":\"WEAPON_COMBATPISTOL\"},{\"ammo\":261,\"label\":\"Carbine rifle\",\"components\":[\"clip_default\"],\"name\":\"WEAPON_CARBINERIFLE\"},{\"ammo\":261,\"label\":\"Special carbine\",\"components\":[\"clip_default\"],\"name\":\"WEAPON_SPECIALCARBINE\"},{\"ammo\":1000,\"label\":\"Taser\",\"components\":[],\"name\":\"WEAPON_STUNGUN\"}]', '{\"z\":29.6,\"y\":-907.8,\"x\":160.3}', 23014771, 50, 'superadmin', 'Parsa', 'Salimi', '13821102', 'm', '186', '', 0, 54994, NULL, '[{\"val\":180700,\"name\":\"hunger\",\"percent\":18.07},{\"val\":260525,\"name\":\"thirst\",\"percent\":26.0525},{\"val\":0,\"name\":\"drug\",\"percent\":0.0},{\"val\":0,\"name\":\"drunk\",\"percent\":0.0}]', NULL, '', 0),
('steam:11000011c609b9f', 'license:24231feadd43cb604bf693cb81bc90004fc68859', 95000, 'Hamidreza', '{\"torso_2\":0,\"blemishes_1\":0,\"makeup_3\":0,\"watches_2\":0,\"hair_color_2\":0,\"tshirt_1\":0,\"shoes_1\":0,\"glasses_1\":0,\"chain_1\":0,\"bproof_2\":0,\"shoes_2\":0,\"torso_1\":0,\"sun_1\":0,\"hair_color_1\":0,\"makeup_4\":0,\"ears_2\":0,\"mask_2\":0,\"sex\":0,\"lipstick_4\":0,\"makeup_2\":0,\"beard_3\":0,\"arms_2\":0,\"hair_2\":1,\"pants_2\":0,\"bags_2\":0,\"hair_1\":10,\"bodyb_2\":0,\"face\":0,\"bags_1\":0,\"lipstick_2\":0,\"bproof_1\":0,\"blush_3\":0,\"beard_4\":0,\"beard_2\":0,\"bodyb_1\":0,\"bracelets_1\":-1,\"skin\":0,\"eyebrows_3\":0,\"beard_1\":0,\"sun_2\":0,\"helmet_2\":0,\"blemishes_2\":0,\"complexion_1\":0,\"blush_1\":0,\"ears_1\":-1,\"blush_2\":0,\"helmet_1\":-1,\"age_1\":0,\"decals_2\":0,\"moles_2\":0,\"eye_color\":0,\"makeup_1\":0,\"arms\":0,\"age_2\":0,\"lipstick_3\":0,\"chain_2\":0,\"chest_3\":0,\"bracelets_2\":0,\"moles_1\":0,\"complexion_2\":0,\"lipstick_1\":0,\"glasses_2\":0,\"watches_1\":-1,\"tshirt_2\":0,\"chest_2\":0,\"decals_1\":0,\"pants_1\":0,\"eyebrows_2\":0,\"eyebrows_4\":0,\"eyebrows_1\":0,\"mask_1\":0,\"chest_1\":0}', 'gang', 3, 'dev', 6, '[]', '{\"z\":170.6,\"y\":526.8,\"x\":1.5}', 192388, 10000, 'superadmin', 'Hamidreza', 'Karimi', '1994-08-16', 'm', '190', '', 0, 524771118, NULL, NULL, NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
(1, 'steam:11000013c742c7c', 'black_money', 0),
(2, 'steam:11000010ef561cd', 'black_money', 0),
(3, 'steam:1100001374d7ce1', 'black_money', 0),
(4, 'steam:11000011c609b9f', 'black_money', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_convictions`
--

CREATE TABLE `user_convictions` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_inventory`
--

INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
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
(172, 'steam:11000010ef561cd', 'binoculars', 0),
(173, 'steam:1100001374d7ce1', 'marijuana', 0),
(174, 'steam:1100001374d7ce1', 'journal', 0),
(175, 'steam:1100001374d7ce1', 'mixapero', 0),
(176, 'steam:1100001374d7ce1', 'gold', 0),
(177, 'steam:1100001374d7ce1', 'martini', 0),
(178, 'steam:1100001374d7ce1', 'litter', 0),
(179, 'steam:1100001374d7ce1', 'clothe', 0),
(180, 'steam:1100001374d7ce1', 'gazbottle', 0),
(181, 'steam:1100001374d7ce1', 'contrat', 0),
(182, 'steam:1100001374d7ce1', 'binoculars', 0),
(183, 'steam:1100001374d7ce1', 'rhumfruit', 0),
(184, 'steam:1100001374d7ce1', 'ice', 0),
(185, 'steam:1100001374d7ce1', 'rhum', 0),
(186, 'steam:1100001374d7ce1', 'jagercerbere', 0),
(187, 'steam:1100001374d7ce1', 'raisin', 0),
(188, 'steam:1100001374d7ce1', 'limonade', 0),
(189, 'steam:1100001374d7ce1', 'whiskycoca', 0),
(190, 'steam:1100001374d7ce1', 'wool', 0),
(191, 'steam:1100001374d7ce1', 'cola', 0),
(192, 'steam:1100001374d7ce1', 'drpepper', 0),
(193, 'steam:1100001374d7ce1', 'copper', 0),
(194, 'steam:1100001374d7ce1', 'lsd_pooch', 0),
(195, 'steam:1100001374d7ce1', 'vodkafruit', 0),
(196, 'steam:1100001374d7ce1', 'croquettes', 0),
(197, 'steam:1100001374d7ce1', 'bolcacahuetes', 0),
(198, 'steam:1100001374d7ce1', 'vine', 0),
(199, 'steam:1100001374d7ce1', 'carokit', 0),
(200, 'steam:1100001374d7ce1', 'jus_raisin', 0),
(201, 'steam:1100001374d7ce1', 'cannabis', 0),
(202, 'steam:1100001374d7ce1', 'litter_pooch', 0),
(203, 'steam:1100001374d7ce1', 'bread', 0),
(204, 'steam:1100001374d7ce1', 'jager', 0),
(205, 'steam:1100001374d7ce1', 'metreshooter', 0),
(206, 'steam:1100001374d7ce1', 'cutted_wood', 0),
(207, 'steam:1100001374d7ce1', 'soda', 0),
(208, 'steam:1100001374d7ce1', 'lsd', 0),
(209, 'steam:1100001374d7ce1', 'plongee1', 0),
(210, 'steam:1100001374d7ce1', 'jusfruit', 0),
(211, 'steam:1100001374d7ce1', 'bolchips', 0),
(212, 'steam:1100001374d7ce1', 'jagerbomb', 0),
(213, 'steam:1100001374d7ce1', 'xanax', 0),
(214, 'steam:1100001374d7ce1', 'wood', 0),
(215, 'steam:1100001374d7ce1', 'diamond', 0),
(216, 'steam:1100001374d7ce1', 'energy', 0),
(217, 'steam:1100001374d7ce1', 'mojito', 0),
(218, 'steam:1100001374d7ce1', 'petrol', 0),
(219, 'steam:1100001374d7ce1', 'grapperaisin', 0),
(220, 'steam:1100001374d7ce1', 'bolnoixcajou', 0),
(221, 'steam:1100001374d7ce1', 'water', 0),
(222, 'steam:1100001374d7ce1', 'rhumcoca', 0),
(223, 'steam:1100001374d7ce1', 'washed_stone', 0),
(224, 'steam:1100001374d7ce1', 'vodkaenergy', 0),
(225, 'steam:1100001374d7ce1', 'jewels', 0),
(226, 'steam:1100001374d7ce1', 'carotool', 0),
(227, 'steam:1100001374d7ce1', 'blowpipe', 0),
(228, 'steam:1100001374d7ce1', 'tequila', 0),
(229, 'steam:1100001374d7ce1', 'fabric', 0),
(230, 'steam:1100001374d7ce1', 'alive_chicken', 0),
(231, 'steam:1100001374d7ce1', 'vodka', 0),
(232, 'steam:1100001374d7ce1', 'icetea', 0),
(233, 'steam:1100001374d7ce1', 'fixtool', 0),
(234, 'steam:1100001374d7ce1', 'vegetables', 0),
(235, 'steam:1100001374d7ce1', 'petrol_raffin', 0),
(236, 'steam:1100001374d7ce1', 'teqpaf', 0),
(237, 'steam:1100001374d7ce1', 'tacos', 0),
(238, 'steam:1100001374d7ce1', 'stone', 0),
(239, 'steam:1100001374d7ce1', 'slaughtered_chicken', 0),
(240, 'steam:1100001374d7ce1', 'golem', 0),
(241, 'steam:1100001374d7ce1', 'saucisson', 0),
(242, 'steam:1100001374d7ce1', 'fixkit', 0),
(243, 'steam:1100001374d7ce1', 'fish', 0),
(244, 'steam:1100001374d7ce1', 'burger', 0),
(245, 'steam:1100001374d7ce1', 'medikit', 0),
(246, 'steam:1100001374d7ce1', 'iron', 0),
(247, 'steam:1100001374d7ce1', 'menthe', 0),
(248, 'steam:1100001374d7ce1', 'fishingrod', 0),
(249, 'steam:1100001374d7ce1', 'grand_cru', 0),
(250, 'steam:1100001374d7ce1', 'packaged_chicken', 0),
(251, 'steam:1100001374d7ce1', 'packaged_plank', 0),
(252, 'steam:1100001374d7ce1', 'plongee2', 0),
(253, 'steam:1100001374d7ce1', 'bolpistache', 0),
(254, 'steam:1100001374d7ce1', 'whisky', 0),
(255, 'steam:1100001374d7ce1', 'essence', 0),
(256, 'steam:1100001374d7ce1', 'bait', 0),
(257, 'steam:1100001374d7ce1', 'meat', 0),
(258, 'steam:1100001374d7ce1', 'bandage', 0),
(259, 'steam:1100001374d7ce1', 'legbrace', 0),
(260, 'steam:1100001374d7ce1', 'armbrace', 0),
(261, 'steam:1100001374d7ce1', 'neckbrace', 0),
(262, 'steam:1100001374d7ce1', 'bodybandage', 0),
(263, 'steam:1100001374d7ce1', 'gps', 1),
(264, 'steam:1100001374d7ce1', 'phone', 0),
(265, 'steam:1100001374d7ce1', 'WEAPON_ADVANCEDRIFLE', 0),
(266, 'steam:1100001374d7ce1', '100gbag', 0),
(267, 'steam:1100001374d7ce1', 'plantpot', 0),
(268, 'steam:1100001374d7ce1', 'WEAPON_ASSAULTSHOTGUN', 0),
(269, 'steam:1100001374d7ce1', 'WEAPON_ADVANCEDRIFLE_AMMO', 0),
(270, 'steam:1100001374d7ce1', 'drugscales', 0),
(271, 'steam:1100001374d7ce1', 'WEAPON_STUNGUN', 0),
(272, 'steam:1100001374d7ce1', 'WEAPON_KNIFE', 0),
(273, 'steam:1100001374d7ce1', 'cocacola', 0),
(274, 'steam:1100001374d7ce1', 'scubagear', 0),
(275, 'steam:1100001374d7ce1', 'rollingpaper', 0),
(276, 'steam:1100001374d7ce1', 'WEAPON_PISTOL', 0),
(277, 'steam:1100001374d7ce1', 'hamburger', 0),
(278, 'steam:1100001374d7ce1', 'WEAPON_PUMPSHOTGUN', 0),
(279, 'steam:1100001374d7ce1', 'WEAPON_COMBATPISTOL_AMMO', 0),
(280, 'steam:1100001374d7ce1', 'WEAPON_CARBINERIFLE', 0),
(281, 'steam:1100001374d7ce1', 'sandwich', 0),
(282, 'steam:1100001374d7ce1', 'beer', 0),
(283, 'steam:1100001374d7ce1', 'WEAPON_PISTOL_AMMO', 0),
(284, 'steam:1100001374d7ce1', 'WEAPON_PUMPSHOTGUN_AMMO', 0),
(285, 'steam:1100001374d7ce1', 'WEAPON_SMG_AMMO', 0),
(286, 'steam:1100001374d7ce1', 'chips', 0),
(287, 'steam:1100001374d7ce1', 'WEAPON_ASSAULTSMG_AMMO', 0),
(288, 'steam:1100001374d7ce1', 'WEAPON_ASSAULTSMG', 0),
(289, 'steam:1100001374d7ce1', 'WEAPON_FLASHLIGHT', 0),
(290, 'steam:1100001374d7ce1', 'wine', 0),
(291, 'steam:1100001374d7ce1', 'WEAPON_AUTOSHOTGUN_AMMO', 0),
(292, 'steam:1100001374d7ce1', 'WEAPON_BAT', 0),
(293, 'steam:1100001374d7ce1', 'WEAPON_APPISTOL', 0),
(294, 'steam:1100001374d7ce1', 'WEAPON_AUTOSHOTGUN', 0),
(295, 'steam:1100001374d7ce1', 'WEAPON_ASSAULTSHOTGUN_AMMO', 0),
(296, 'steam:1100001374d7ce1', 'WEAPON_COMBATPISTOL', 0),
(297, 'steam:1100001374d7ce1', 'WEAPON_CARBINERIFLE_AMMO', 0),
(298, 'steam:1100001374d7ce1', 'WEAPON_ASSAULTRIFLE_AMMO', 0),
(299, 'steam:1100001374d7ce1', '5gbag', 0),
(300, 'steam:1100001374d7ce1', 'lemonade', 0),
(301, 'steam:1100001374d7ce1', 'blowtorch', 0),
(302, 'steam:1100001374d7ce1', 'binocular', 0),
(303, 'steam:1100001374d7ce1', 'WEAPON_ASSAULTRIFLE', 0),
(304, 'steam:1100001374d7ce1', 'WEAPON_APPISTOL_AMMO', 0),
(305, 'steam:1100001374d7ce1', 'highgradefert', 0),
(306, 'steam:1100001374d7ce1', 'cigarette', 0),
(307, 'steam:1100001374d7ce1', 'WEAPON_SMG', 0),
(308, 'steam:1100001374d7ce1', 'pistachio', 0),
(309, 'steam:1100001374d7ce1', '1gbag', 0),
(310, 'steam:1100001374d7ce1', 'lowgradefert', 0),
(311, 'steam:1100001374d7ce1', '50gbag', 0),
(312, 'steam:1100001374d7ce1', 'cupcake', 0),
(313, 'steam:1100001374d7ce1', 'chocolate', 0),
(314, 'steam:1100001374d7ce1', 'lighter', 0),
(315, 'steam:1100001374d7ce1', 'drill', 0),
(316, 'steam:1100001374d7ce1', 'cashew', 0),
(317, 'steam:1100001374d7ce1', 'lockpick', 0),
(318, 'steam:1100001374d7ce1', 'handcuffs', 0),
(319, 'steam:1100001374d7ce1', 'rope', 0),
(320, 'steam:1100001374d7ce1', 'champagne', 0),
(321, 'steam:1100001374d7ce1', 'bulletsample', 1),
(322, 'steam:1100001374d7ce1', 'dnaanalyzer', 0),
(323, 'steam:1100001374d7ce1', 'bloodsample', 0),
(324, 'steam:1100001374d7ce1', 'ammoanalyzer', 0),
(325, 'steam:1100001374d7ce1', 'odznaka', 1),
(326, 'steam:11000011c609b9f', 'water', 0),
(327, 'steam:11000011c609b9f', 'icetea', 0),
(328, 'steam:11000011c609b9f', 'cocacola', 0),
(329, 'steam:11000011c609b9f', 'WEAPON_PISTOL_AMMO', 0),
(330, 'steam:11000011c609b9f', 'WEAPON_ASSAULTRIFLE_AMMO', 0),
(331, 'steam:11000011c609b9f', 'lowgradefert', 0),
(332, 'steam:11000011c609b9f', 'WEAPON_CARBINERIFLE_AMMO', 0),
(333, 'steam:11000011c609b9f', 'WEAPON_ASSAULTSMG_AMMO', 0),
(334, 'steam:11000011c609b9f', 'scubagear', 0),
(335, 'steam:11000011c609b9f', 'chocolate', 0),
(336, 'steam:11000011c609b9f', 'sandwich', 0),
(337, 'steam:11000011c609b9f', 'phone', 1),
(338, 'steam:11000011c609b9f', 'WEAPON_COMBATPISTOL_AMMO', 0),
(339, 'steam:11000011c609b9f', 'WEAPON_BAT', 0),
(340, 'steam:11000011c609b9f', 'fixkit', 0),
(341, 'steam:11000011c609b9f', 'WEAPON_SMG_AMMO', 0),
(342, 'steam:11000011c609b9f', 'pistachio', 0),
(343, 'steam:11000011c609b9f', 'cupcake', 0),
(344, 'steam:11000011c609b9f', 'bulletsample', 0),
(345, 'steam:11000011c609b9f', 'whisky', 0),
(346, 'steam:11000011c609b9f', 'grand_cru', 0),
(347, 'steam:11000011c609b9f', 'ammoanalyzer', 0),
(348, 'steam:11000011c609b9f', 'odznaka', 1),
(349, 'steam:11000011c609b9f', 'WEAPON_AUTOSHOTGUN_AMMO', 0),
(350, 'steam:11000011c609b9f', 'WEAPON_ASSAULTSMG', 0),
(351, 'steam:11000011c609b9f', 'WEAPON_KNIFE', 0),
(352, 'steam:11000011c609b9f', 'WEAPON_ADVANCEDRIFLE', 0),
(353, 'steam:11000011c609b9f', 'dnaanalyzer', 0),
(354, 'steam:11000011c609b9f', '100gbag', 0),
(355, 'steam:11000011c609b9f', 'bloodsample', 0),
(356, 'steam:11000011c609b9f', 'rollingpaper', 0),
(357, 'steam:11000011c609b9f', 'handcuffs', 0),
(358, 'steam:11000011c609b9f', 'drill', 0),
(359, 'steam:11000011c609b9f', 'drpepper', 0),
(360, 'steam:11000011c609b9f', 'binocular', 0),
(361, 'steam:11000011c609b9f', 'wine', 0),
(362, 'steam:11000011c609b9f', 'WEAPON_ASSAULTRIFLE', 0),
(363, 'steam:11000011c609b9f', 'WEAPON_STUNGUN', 0),
(364, 'steam:11000011c609b9f', 'WEAPON_SMG', 0),
(365, 'steam:11000011c609b9f', 'WEAPON_ADVANCEDRIFLE_AMMO', 0),
(366, 'steam:11000011c609b9f', 'WEAPON_PUMPSHOTGUN', 0),
(367, 'steam:11000011c609b9f', 'WEAPON_PISTOL', 0),
(368, 'steam:11000011c609b9f', 'gps', 1),
(369, 'steam:11000011c609b9f', 'drugscales', 0),
(370, 'steam:11000011c609b9f', 'WEAPON_PUMPSHOTGUN_AMMO', 0),
(371, 'steam:11000011c609b9f', 'WEAPON_FLASHLIGHT', 0),
(372, 'steam:11000011c609b9f', 'WEAPON_AUTOSHOTGUN', 0),
(373, 'steam:11000011c609b9f', 'WEAPON_CARBINERIFLE', 0),
(374, 'steam:11000011c609b9f', 'lemonade', 0),
(375, 'steam:11000011c609b9f', 'chips', 0),
(376, 'steam:11000011c609b9f', 'rope', 0),
(377, 'steam:11000011c609b9f', 'WEAPON_COMBATPISTOL', 0),
(378, 'steam:11000011c609b9f', 'champagne', 0),
(379, 'steam:11000011c609b9f', 'cigarette', 0),
(380, 'steam:11000011c609b9f', '1gbag', 0),
(381, 'steam:11000011c609b9f', 'WEAPON_ASSAULTSHOTGUN_AMMO', 0),
(382, 'steam:11000011c609b9f', 'highgradefert', 0),
(383, 'steam:11000011c609b9f', 'tequila', 0),
(384, 'steam:11000011c609b9f', 'bread', 0),
(385, 'steam:11000011c609b9f', 'hamburger', 0),
(386, 'steam:11000011c609b9f', 'beer', 0),
(387, 'steam:11000011c609b9f', 'lighter', 0),
(388, 'steam:11000011c609b9f', 'WEAPON_ASSAULTSHOTGUN', 0),
(389, 'steam:11000011c609b9f', 'cashew', 0),
(390, 'steam:11000011c609b9f', '5gbag', 0),
(391, 'steam:11000011c609b9f', 'energy', 0),
(392, 'steam:11000011c609b9f', 'blowtorch', 0),
(393, 'steam:11000011c609b9f', 'lockpick', 0),
(394, 'steam:11000011c609b9f', 'WEAPON_APPISTOL_AMMO', 0),
(395, 'steam:11000011c609b9f', 'WEAPON_APPISTOL', 0),
(396, 'steam:11000011c609b9f', 'vodka', 0),
(397, 'steam:11000011c609b9f', '50gbag', 0),
(398, 'steam:11000011c609b9f', 'plantpot', 0),
(399, 'steam:11000011c609b9f', 'parkingcard', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_licenses`
--

INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
(1, 'weapon', 'steam:1100001374d7ce1'),
(2, 'dmv', 'steam:11000011c609b9f');

-- --------------------------------------------------------

--
-- Table structure for table `user_mdt`
--

CREATE TABLE `user_mdt` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `warrants_list`
--

CREATE TABLE `warrants_list` (
  `id` int(11) NOT NULL,
  `json_data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `weashops`
--

CREATE TABLE `weashops` (
  `id` int(11) NOT NULL,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weashops`
--

INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Indexes for table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Indexes for table `arrests_list`
--
ALTER TABLE `arrests_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `baninfo`
--
ALTER TABLE `baninfo`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `banlisthistory`
--
ALTER TABLE `banlisthistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blackmarket`
--
ALTER TABLE `blackmarket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bolos_list`
--
ALTER TABLE `bolos_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_parking`
--
ALTER TABLE `car_parking`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coffees`
--
ALTER TABLE `coffees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `darkshops`
--
ALTER TABLE `darkshops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Indexes for table `dock`
--
ALTER TABLE `dock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dock_categories`
--
ALTER TABLE `dock_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dock_vehicles`
--
ALTER TABLE `dock_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fine_types_bishops`
--
ALTER TABLE `fine_types_bishops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fine_types_dismay`
--
ALTER TABLE `fine_types_dismay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fine_types_gang`
--
ALTER TABLE `fine_types_gang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fine_types_grove`
--
ALTER TABLE `fine_types_grove`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fine_types_mafia`
--
ALTER TABLE `fine_types_mafia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fine_types_rebel`
--
ALTER TABLE `fine_types_rebel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gangs`
--
ALTER TABLE `gangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gangs_data`
--
ALTER TABLE `gangs_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gang_account`
--
ALTER TABLE `gang_account`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `gang_account_data`
--
ALTER TABLE `gang_account_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gang_grades`
--
ALTER TABLE `gang_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `glovebox_inventory`
--
ALTER TABLE `glovebox_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Indexes for table `instagram_accounts`
--
ALTER TABLE `instagram_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instagram_likes`
--
ALTER TABLE `instagram_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_instagram_likes_instagram_accounts` (`authorId`),
  ADD KEY `FK_instagram_likes_instagram_pics` (`picId`);

--
-- Indexes for table `instagram_pics`
--
ALTER TABLE `instagram_pics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_instagram_pics_instagram_accounts` (`authorId`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `jail`
--
ALTER TABLE `jail`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kc_bans`
--
ALTER TABLE `kc_bans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kc_jails`
--
ALTER TABLE `kc_jails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kc_warns`
--
ALTER TABLE `kc_warns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_warrants`
--
ALTER TABLE `mdt_warrants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_dock`
--
ALTER TABLE `owned_dock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `vehsowned` (`owner`);

--
-- Indexes for table `owner_vehicles`
--
ALTER TABLE `owner_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peage_flash`
--
ALTER TABLE `peage_flash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qalle_brottsregister`
--
ALTER TABLE `qalle_brottsregister`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rented_dock`
--
ALTER TABLE `rented_dock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops2`
--
ALTER TABLE `shops2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `truck_inventory`
--
ALTER TABLE `truck_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item` (`item`,`plate`);

--
-- Indexes for table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Indexes for table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  ADD KEY `FK_twitter_likes_twitter_tweets` (`tweetId`);

--
-- Indexes for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `index_users_phone_number` (`phone_number`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user_contacts_identifier_name_number` (`identifier`,`name`,`number`);

--
-- Indexes for table `user_convictions`
--
ALTER TABLE `user_convictions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_mdt`
--
ALTER TABLE `user_mdt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `warrants_list`
--
ALTER TABLE `warrants_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weashops`
--
ALTER TABLE `weashops`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arrests_list`
--
ALTER TABLE `arrests_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banlisthistory`
--
ALTER TABLE `banlisthistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blackmarket`
--
ALTER TABLE `blackmarket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bolos_list`
--
ALTER TABLE `bolos_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_parking`
--
ALTER TABLE `car_parking`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coffees`
--
ALTER TABLE `coffees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `darkshops`
--
ALTER TABLE `darkshops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `dock`
--
ALTER TABLE `dock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `dock_categories`
--
ALTER TABLE `dock_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dock_vehicles`
--
ALTER TABLE `dock_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `fine_types_bishops`
--
ALTER TABLE `fine_types_bishops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fine_types_dismay`
--
ALTER TABLE `fine_types_dismay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fine_types_gang`
--
ALTER TABLE `fine_types_gang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fine_types_grove`
--
ALTER TABLE `fine_types_grove`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fine_types_mafia`
--
ALTER TABLE `fine_types_mafia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fine_types_rebel`
--
ALTER TABLE `fine_types_rebel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gangs`
--
ALTER TABLE `gangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gangs_data`
--
ALTER TABLE `gangs_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gang_account_data`
--
ALTER TABLE `gang_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gang_grades`
--
ALTER TABLE `gang_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `glovebox_inventory`
--
ALTER TABLE `glovebox_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `instagram_accounts`
--
ALTER TABLE `instagram_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT for table `instagram_likes`
--
ALTER TABLE `instagram_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instagram_pics`
--
ALTER TABLE `instagram_pics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `kc_bans`
--
ALTER TABLE `kc_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `kc_jails`
--
ALTER TABLE `kc_jails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kc_warns`
--
ALTER TABLE `kc_warns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_warrants`
--
ALTER TABLE `mdt_warrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `owned_dock`
--
ALTER TABLE `owned_dock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `owner_vehicles`
--
ALTER TABLE `owner_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peage_flash`
--
ALTER TABLE `peage_flash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `qalle_brottsregister`
--
ALTER TABLE `qalle_brottsregister`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `rented_dock`
--
ALTER TABLE `rented_dock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `shops2`
--
ALTER TABLE `shops2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `truck_inventory`
--
ALTER TABLE `truck_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_convictions`
--
ALTER TABLE `user_convictions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_inventory`
--
ALTER TABLE `user_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;

--
-- AUTO_INCREMENT for table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_mdt`
--
ALTER TABLE `user_mdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warrants_list`
--
ALTER TABLE `warrants_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weashops`
--
ALTER TABLE `weashops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `instagram_likes`
--
ALTER TABLE `instagram_likes`
  ADD CONSTRAINT `FK_instagram_likes_instagram_accounts` FOREIGN KEY (`authorId`) REFERENCES `instagram_accounts` (`id`),
  ADD CONSTRAINT `FK_instagram_likes_instagram_pics` FOREIGN KEY (`picId`) REFERENCES `instagram_pics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `instagram_pics`
--
ALTER TABLE `instagram_pics`
  ADD CONSTRAINT `FK_instagram_pics_instagram_accounts` FOREIGN KEY (`authorId`) REFERENCES `instagram_accounts` (`id`);

--
-- Constraints for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
