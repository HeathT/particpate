-- Create syntax for 'weekday'

CREATE TABLE `weekday` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `short` varchar(4) NOT NULL,
  `isweekend` tinyint(4) NOT NULL,
  `ordinal` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
