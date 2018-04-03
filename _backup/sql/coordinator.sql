-- Create syntax for 'coordinator'

CREATE TABLE `coordinator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `address` varchar(250) NOT NULL,
  `address2` varchar(250) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` int(11) NOT NULL,
  `mainline` varchar(15) NOT NULL,
  `primarycontact` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
