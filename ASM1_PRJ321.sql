CREATE DATABASE  IF NOT EXISTS `ASM1`;
USE `ASM1`;

drop database `asm1`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255),
  PRIMARY KEY (`id`)
);
insert into `role` values (1, "ADMIN"), (2, "USER");
select * from `role`;
CREATE TABLE `donation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255),
  `created` datetime default now(),
  `description` varchar(255),
  `end_date` varchar(255),
  `money` int(11),
  `name` varchar(255),
  `organization_name` varchar(255),
  `phone_number` varchar(255),
  `start_date` varchar(255),
  `status` int(11),
   PRIMARY KEY (`id`)
);
insert into donation(id,`code`,`name`,`description`,money,start_date, end_date, `status`, organization_name, phone_number, `created`) 
values 
(1, "123", "name", "description", 100000, now(), now(), 1, "organization", "0988123456", now());
insert into donation(`code`,`name`,`description`,money,start_date, end_date, `status`, organization_name, phone_number, `created`) 
values 
("321", "lu lut", "description", 100000, now(), now(), 0, "organization", "0988123456", now());
insert into donation(`code`,`name`,`description`,money,start_date, end_date, `status`, organization_name, phone_number, `created`) 
values 
("852", "vi tre em", "description", 100000, now(), now(), 3, "organization", "0988123456", now());
select * from donation;
update donation set description = 'Test' where id > 0;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255),
  `email` varchar(255),
  `full_name` varchar(255),
  `note` varchar(255),
  `password` varchar(128),
  `phone_number` varchar(255),
  `status` int(11),
  `user_name` varchar(255),
  `created` datetime default now(),
  `role_id` int(11),
  foreign key(`role_id`) references `role`(`id`),
  primary key(id)
);

insert into `user`(id, user_name, password, full_name, email, address, phone_number, note, status, role_id)
values (1, "admin", "123", "hai pham", "@gmail", "hcm", "12345", "hihi", 1, 1);
insert into `user`(user_name, password, full_name, email, address, phone_number, note, status, role_id)
values ("user1", "123", "next partner", "@gmail", "hcm", "12345", "hihi", 1, 2);
delete from `user` where id = 4;
select * from `user`;
update `user` set full_name = "ahihi" where id = 17;

CREATE TABLE `user_donation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime default now(),
  `money` int(11),
  `name` varchar(255),
  `status` int(11),
  `text` varchar(255) ,
  `donation_id` int(11),
  `user_id` int(11),
  foreign key(`donation_id`) references `donation`(`id`),
  foreign key(`user_id`) references `user`(`id`),
  primary key(id)
);
select * from user_donation;

update user_donation set status = 0 where id > 0;

delete from user_donation where id > 3;




