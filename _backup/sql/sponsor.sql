-- Create syntax for 'sponsor'

CREATE TABLE `sponsor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `primarycontact` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` int(11) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `mainline` varchar(15) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `geolat` varchar(250) DEFAULT NULL,
  `geolong` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
