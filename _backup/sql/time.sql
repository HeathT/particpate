-- Create syntax for 'time'

CREATE TABLE `time` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `volunteer` int(11) NOT NULL,
  `cause` int(11) NOT NULL,
  `method` tinyint(4) NOT NULL,
  `start` datetime NOT NULL,
  `finish` datetime NOT NULL,
  `multiplier` double NOT NULL,
  `sponsor` int(11) NOT NULL,
  `approvedby` int(11) NOT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `flaggedfor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
