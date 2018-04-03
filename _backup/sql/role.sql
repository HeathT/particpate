-- Create syntax for 'role'

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sponsor` tinyint(4) NOT NULL DEFAULT '0',
  `coordinator` tinyint(4) NOT NULL DEFAULT '0',
  `monitor` tinyint(4) NOT NULL DEFAULT '0',
  `volunteer` tinyint(4) NOT NULL DEFAULT '1',
  `admin` tinyint(4) NOT NULL DEFAULT '0',
  `superadmin` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Add roles to the table

insert into role
set id = 0,
name = 'Super Admin',
sponsor = 1,
coordinator = 1,
monitor = 1,
volunteer = 1,
admin = 1,
superadmin = 1; 

insert into role
set id = 10,
name = 'Volunteer',
sponsor = 0,
coordinator = 0,
monitor = 0,
volunteer = 1,
admin = 0,
superadmin = 0; 

insert into role
set id = 20,
name = 'Coordinator',
sponsor = 0,
coordinator = 1,
monitor = 0,
volunteer = 0,
admin = 0,
superadmin = 0; 

insert into role
set id = 21,
name = 'Coordinator Admin',
sponsor = 0,
coordinator = 1,
monitor = 0,
volunteer = 0,
admin = 1,
superadmin = 0; 

insert into role
set id = 30,
name = 'Sponsor',
sponsor = 1,
coordinator = 0,
monitor = 0,
volunteer = 0,
admin = 0,
superadmin = 0; 

insert into role
set id = 31,
name = 'Sponsor Admin',
sponsor = 1,
coordinator = 0,
monitor = 0,
volunteer = 0,
admin = 1,
superadmin = 0;

insert into role
set id = 40,
name = 'Monitor',
sponsor = 0,
coordinator = 0,
monitor = 1,
volunteer = 0,
admin = 0,
superadmin = 0;

insert into role
set id = 41,
name = 'Monitor Admin',
sponsor = 0,
coordinator = 0,
monitor = 1,
volunteer = 0,
admin = 1,
superadmin = 0;