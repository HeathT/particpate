-- Create syntax for 'loginhistory'

CREATE TABLE `loginhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loggedin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `method` int(11) NOT NULL DEFAULT '1',
  `ipaddress` varchar(200) DEFAULT NULL,
  `loggedoff` datetime DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `isfailure` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;
