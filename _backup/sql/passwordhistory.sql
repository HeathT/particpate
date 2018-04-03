-- Create syntax for 'passwordhistory'

CREATE TABLE `passwordhistory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `passhash` varchar(250) NOT NULL DEFAULT '',
  `privacykey` varchar(200) NOT NULL DEFAULT '',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
