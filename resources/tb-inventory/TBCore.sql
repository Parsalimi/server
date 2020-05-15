
CREATE TABLE IF NOT EXISTS `cryptos` (
  `crypto` varchar(50) DEFAULT NULL,
  `crypto_label` varchar(50) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `cryptos` (`crypto`, `crypto_label`, `value`) VALUES
	('tbcoin', 'TBCoin', 4663);

CREATE TABLE IF NOT EXISTS `house_inventory` (
  `house` varchar(50) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `itemslot` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT 'item'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `house_inventory` (`house`, `item`, `amount`, `itemslot`, `type`) VALUES
	('mirrorpark01', 'water', 22, 5, 'item'),
	('mirrorpark01', 'radio', 22, 8, 'item'),
	('mirrorpark01', 'bread', 22, 4, 'item');

CREATE TABLE IF NOT EXISTS `house_plants` (
  `house` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-e',
  `health` int(11) DEFAULT 100,
  `food` int(11) DEFAULT 100,
  `coords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plantid` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `tops` int(11) DEFAULT 15,
  `harvestable` varchar(50) DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `house_plants` (`house`, `stage`, `health`, `food`, `coords`, `plantid`, `type`, `tops`, `harvestable`) VALUES
	('mirrorpark01', 'stage-e', 1, 1, '{"z":34.548931121826,"y":-603.32531738281,"x":894.84039306641}', 842132, 'ak47', 1, 'true'),
	('mirrorpark01', 'stage-e', 1, 1, '{"z":34.548931121826,"y":-603.24182128906,"x":895.93707275391}', 123321, 'amnesia', 1, 'true'),
	('mirrorpark01', 'stage-e', 1, 1, '{"z":34.548931121826,"y":-603.81628417969,"x":896.99505615234}', 109924, 'og-kush', 1, 'true'),
	('mirrorpark01', 'stage-e', 1, 1, '{"z":34.548931121826,"y":-609.87683105469,"x":895.45111083984}', 941040, 'skunk', 1, 'true'),
	('mirrorpark01', 'stage-e', 1, 1, '{"z":34.548946380615,"y":-605.3115234375,"x":893.34216308594}', 286071, 'amnesia', 1, 'true'),
	('mirrorpark01', 'stage-e', 1, 1, '{"z":34.548961639404,"y":-605.31066894531,"x":891.71765136719}', 336303, 'white-widow', 1, 'true');

CREATE TABLE IF NOT EXISTS `house_weapons` (
  `house` varchar(50) DEFAULT NULL,
  `weapon` varchar(50) DEFAULT NULL,
  `itemslot` int(11) DEFAULT NULL,
  `bullets` int(11) DEFAULT 0,
  `weaponid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `house_weapons` (`house`, `weapon`, `itemslot`, `bullets`, `weaponid`) VALUES
	('mirrorpark01', 'weapon_pistol', 1, 250, 234556);

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `cash` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `bsn` varchar(50) DEFAULT NULL,
  `banknumber` varchar(50) DEFAULT NULL,
  `slotname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `tussenvoegsel` varchar(50) DEFAULT 'n.v.t.',
  `lastname` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `job_grade` varchar(50) DEFAULT '0',
  `position` text DEFAULT NULL,
  `usergroup` varchar(50) DEFAULT 'user',
  `phone` text DEFAULT NULL,
  `status` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;


INSERT INTO `players` (`id`, `identifier`, `license`, `name`, `cid`, `cash`, `bank`, `bsn`, `banknumber`, `slotname`, `firstname`, `tussenvoegsel`, `lastname`, `sex`, `dob`, `job`, `job_grade`, `position`, `usergroup`, `phone`, `status`) VALUES
	(10, 'steam:110000117fd5be8', 'license:b19a466c8a6553b860896f6724db32dfec9d5aad', 's0me1', 4, 3476, 2500, '515859985', 'NL08TB311788940429', '234234', 'werwer', 'werwer', 'werwer', '324234', '', 'unemployed', '0', '{"z":58.212516784668,"y":-607.6103515625,"x":887.36041259766}', 'user', '0677963256', NULL),
	(11, 'steam:110000117fd5be8', 'license:b19a466c8a6553b860896f6724db32dfec9d5aad', 's0me1', 2, 110005, 3502500, '345599365', 'NL07TB629101562500', 'Yeeeeeet', 'Yeet', 'Yeet', 'Yeet', 'Man', '2000-09-13', 'unemployed', '0', '{"z":58.212516784668,"y":-607.6103515625,"x":887.36041259766}', 'admin', '0672647094', '{"thirst":10,"hunger":10}'),
	(12, 'steam:11000011598271d', 'license:c99c19404eb2bcd7a518812d74ee455774e7a248', 'Zapherion', 1, 2500, 2500, '769342041', 'NL05TB521600341796', 'WEreldgozerds', 'Jan', 'De', 'Vries', 'man', '1222-12-12', 'unemployed', '0', '{"z":54.086296081543,"y":-202.93687438965,"x":320.33166503906}', 'admin', '0674441528', '{"thirst":0,"hunger":0}'),
	(13, 'steam:11000010774b0a7', 'license:2c478316c7f184b066ae06fd466b736805e01e38', 'Dr. Onjo 204', 1, 2500, 2500, '256692504', 'NL07TB873025512695', 'Hey', 'Onno', 'de', 'vries', 'Manwijf', '2002-02-04', 'unemployed', '0', '{"y":-944.99450683594,"x":187.0347442627,"z":30.091930389404}', 'user', '0630398559', NULL);

CREATE TABLE IF NOT EXISTS `player_bankaccounts` (
  `identifier` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `banknumber` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `player_bankaccounts` (`identifier`, `cid`, `name`, `balance`, `type`, `banknumber`) VALUES
	('steam:110000117fd5be8', 2, 'Yeet', 2, 'Spaarrekening', 'NLYEET01234');

CREATE TABLE IF NOT EXISTS `player_clothing` (
  `identifier` varchar(255) NOT NULL,
  `cid` int(11) NOT NULL,
  `sex` int(11) NOT NULL,
  `face` int(11) NOT NULL DEFAULT 0,
  `dadmumpercent` int(11) NOT NULL DEFAULT 0,
  `skinton` int(11) NOT NULL DEFAULT 0,
  `eyecolor` int(11) NOT NULL DEFAULT 0,
  `acne` int(11) NOT NULL DEFAULT 0,
  `skinproblem` int(11) NOT NULL DEFAULT 0,
  `freckle` int(11) NOT NULL DEFAULT 0,
  `wrinkle` int(11) NOT NULL DEFAULT 0,
  `wrinkleopacity` int(11) NOT NULL DEFAULT 0,
  `eyebrow` int(11) NOT NULL DEFAULT 0,
  `eyebrowopacity` int(11) NOT NULL DEFAULT 0,
  `beard` int(11) NOT NULL DEFAULT 0,
  `beardopacity` int(11) NOT NULL DEFAULT 0,
  `beardcolor` int(11) NOT NULL DEFAULT 0,
  `hair` int(11) NOT NULL DEFAULT 0,
  `hairtext` int(11) NOT NULL DEFAULT 0,
  `torso` int(11) NOT NULL DEFAULT 0,
  `torsotext` int(11) NOT NULL DEFAULT 0,
  `leg` int(11) NOT NULL DEFAULT 0,
  `legtext` int(11) NOT NULL DEFAULT 0,
  `shoes` int(11) NOT NULL DEFAULT 0,
  `shoestext` int(11) NOT NULL DEFAULT 0,
  `accessory` int(11) NOT NULL DEFAULT 0,
  `accessorytext` int(11) NOT NULL DEFAULT 0,
  `undershirt` int(11) NOT NULL DEFAULT 0,
  `undershirttext` int(11) NOT NULL DEFAULT 0,
  `torso2` int(11) NOT NULL DEFAULT 0,
  `torso2text` int(11) NOT NULL DEFAULT 0,
  `prop_hat` int(11) NOT NULL DEFAULT 0,
  `prop_hat_text` int(11) NOT NULL DEFAULT 0,
  `prop_glasses` int(11) NOT NULL DEFAULT 0,
  `prop_glasses_text` int(11) NOT NULL DEFAULT 0,
  `prop_earrings` int(11) NOT NULL DEFAULT 0,
  `prop_earrings_text` int(11) NOT NULL DEFAULT 0,
  `prop_watches` int(11) NOT NULL DEFAULT 0,
  `prop_watches_text` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `player_contacts` (
  `identifier` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` int(10) unsigned zerofill DEFAULT NULL,
  `color` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `player_contacts` (`identifier`, `cid`, `name`, `number`, `color`) VALUES
	('steam:110000117fd5be8', 2, 'yeet', 0629482058, NULL);

CREATE TABLE IF NOT EXISTS `player_houses` (
  `identifier` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `house` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `player_houses` (`identifier`, `cid`, `house`) VALUES
	('steam:110000117fd5be8', 2, 'mirrorpark01'),
	('steam:110000117fd5be8', 2, 'mirrorpark02');

CREATE TABLE IF NOT EXISTS `player_inventory` (
  `cid` int(11) DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `itemslot` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT 'item'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `player_inventory` (`cid`, `identifier`, `item`, `amount`, `itemslot`, `type`) VALUES
	(2, 'steam:110000117fd5be8', 'laptop', 4, 5, 'item'),
	(1, 'steam:11000011598271d', 'laptop', 1, 1, 'item'),
	(2, 'steam:110000117fd5be8', 'ogkush', 88, 1, 'item'),
	(2, 'steam:110000117fd5be8', 'amnesia', 3, 7, 'item'),
	(2, 'steam:110000117fd5be8', 'ak47', 15, 11, 'item'),
	(2, 'steam:110000117fd5be8', 'whitewidow', 1, 20, 'item'),
	(2, 'steam:110000117fd5be8', 'purplehaze', 17, 6, 'item'),
	(2, 'steam:110000117fd5be8', 'bread', 11, 21, 'item'),
	(2, 'steam:110000117fd5be8', 'skunk', 1, 25, 'item'),
	(2, 'steam:110000117fd5be8', 'joint', 2, 2, 'item');

CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `identifier` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `fakeplate` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `player_vehicles` (`identifier`, `cid`, `vehicle`, `plate`, `fakeplate`) VALUES
	('steam:110000117fd5be8', 2, 'lwgtr', 'NL0123', 0);

CREATE TABLE IF NOT EXISTS `player_weapons` (
  `cid` int(11) DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `weapon` varchar(50) DEFAULT NULL,
  `itemslot` int(11) DEFAULT NULL,
  `bullets` int(11) DEFAULT 0,
  `weaponid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `player_weapons` (`cid`, `identifier`, `weapon`, `itemslot`, `bullets`, `weaponid`) VALUES
	(2, 'steam:110000117fd5be8', 'weapon_smg', 13, 0, 584594),
	(2, 'steam:110000117fd5be8', 'weapon_carbinerifle', 12, 0, 677185),
	(2, 'steam:110000117fd5be8', 'weapon_pistol', 3, 6, 739166),
	(2, 'steam:110000117fd5be8', 'weapon_carbinerifle', 17, 65, 350280);
