-- Create syntax for 'monitor'

CREATE TABLE `monitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `address2` varchar(250) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `zipcode` varchar(12) DEFAULT NULL,
  `countyid` int(11) NOT NULL,
  `stateid` int(11) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `geolat` varchar(200) DEFAULT NULL,
  `geolong` varchar(200) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `courtappointed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
