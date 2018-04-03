-- Create syntax for 'listing'

CREATE TABLE `listing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `sponsor` int(11) NOT NULL,
  `enteredby` int(11) NOT NULL,
  `primarycontact` int(11) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `fromhour` int(11) NOT NULL,
  `tohour` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `approvedon` datetime DEFAULT NULL,
  `approvedby` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `geolat` varchar(100) DEFAULT NULL,
  `geolong` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
