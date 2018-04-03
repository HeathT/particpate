-- Create syntax for 'user'

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(250) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `lastip` varchar(200) DEFAULT NULL,
  `lastfailure` datetime DEFAULT NULL,
  `failurecount` int(11) NOT NULL DEFAULT '0',
  `role` int(11) NOT NULL DEFAULT '1',
  `forcenewpass` tinyint(4) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `verified` tinyint(4) NOT NULL DEFAULT '0',
  `verifiedon` datetime DEFAULT NULL,
  `hasmobile` tinyint(4) DEFAULT '0',
  `privacykey` varchar(250) DEFAULT NULL,
  `courtappointed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
