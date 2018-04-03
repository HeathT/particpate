-- Create syntax for 'county'

CREATE TABLE `county` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `short` varchar(5) DEFAULT NULL,
  `geolat` varchar(200) DEFAULT NULL,
  `geolong` varchar(200) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
