/*
SQLyog Professional v12.09 (32 bit)
MySQL - 5.5.28 : Database - fscore_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fscore_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `fscore_db`;

/*Table structure for table `applications` */

DROP TABLE IF EXISTS `applications`;

CREATE TABLE `applications` (
  `app_id` char(10) NOT NULL,
  `user_id` char(10) NOT NULL,
  `app_name` text NOT NULL,
  `entry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`app_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `applications` */

insert  into `applications`(`app_id`,`user_id`,`app_name`,`entry_date`) values ('01','02','Stock','2020-04-24 00:00:00'),('02','02','Bonds','2020-04-24 00:00:00');

/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `company_id` char(15) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `symbol` char(15) NOT NULL,
  `nature_of_business` text NOT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_no` char(15) DEFAULT NULL,
  `date_listed` date DEFAULT NULL,
  `date_of_incorporation` date DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `companies` */

insert  into `companies`(`company_id`,`company_name`,`symbol`,`nature_of_business`,`address`,`email`,`mobile_no`,`date_listed`,`date_of_incorporation`,`entry_date`) values ('FBN','First Bank','FBN','Bankin','Lagos','fbn@yahoo.com','234','2020-04-25','2020-04-25','2020-04-25 00:00:00'),('GTB','GTB Bank','GTB','Bankin','Lagos','gtb@yahoo.com','234','2020-04-25','2020-04-25','2020-04-25 00:00:00');

/*Table structure for table `fin_quarters` */

DROP TABLE IF EXISTS `fin_quarters`;

CREATE TABLE `fin_quarters` (
  `quarter_id` int(11) NOT NULL,
  `quarters` char(4) NOT NULL,
  PRIMARY KEY (`quarter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fin_quarters` */

insert  into `fin_quarters`(`quarter_id`,`quarters`) values (11,'01'),(12,'02'),(13,'03');

/*Table structure for table `fin_years` */

DROP TABLE IF EXISTS `fin_years`;

CREATE TABLE `fin_years` (
  `year_id` int(11) NOT NULL,
  `year` char(4) NOT NULL,
  PRIMARY KEY (`year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fin_years` */

insert  into `fin_years`(`year_id`,`year`) values (11,'Jan'),(12,'Feb');

/*Table structure for table `financial_components` */

DROP TABLE IF EXISTS `financial_components`;

CREATE TABLE `financial_components` (
  `components_id` char(15) NOT NULL,
  `company_id` char(15) NOT NULL,
  `year_id` int(11) NOT NULL,
  `quarter_id` int(11) NOT NULL,
  `user_id` char(10) NOT NULL,
  `entry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`components_id`),
  KEY `company_id` (`company_id`),
  KEY `year_id` (`year_id`),
  KEY `quarter_id` (`quarter_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `financial_components_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  CONSTRAINT `financial_components_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `fin_years` (`year_id`),
  CONSTRAINT `financial_components_ibfk_3` FOREIGN KEY (`quarter_id`) REFERENCES `fin_quarters` (`quarter_id`),
  CONSTRAINT `financial_components_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `financial_components` */

insert  into `financial_components`(`components_id`,`company_id`,`year_id`,`quarter_id`,`user_id`,`entry_date`) values ('001','GTB',11,11,'02','2020-04-25 00:00:00'),('002','FBN',12,12,'02','2020-04-25 00:00:00');

/*Table structure for table `fundamentals` */

DROP TABLE IF EXISTS `fundamentals`;

CREATE TABLE `fundamentals` (
  `fundamentals_id` char(15) NOT NULL,
  `net_income` int(11) NOT NULL,
  `return_on_assets` int(11) NOT NULL,
  `cash_flow` int(11) NOT NULL,
  `total_assets` int(11) NOT NULL,
  `gross_profit` int(11) NOT NULL,
  `turnover` int(11) NOT NULL,
  `long_term_assets` int(11) NOT NULL,
  `current_assets` int(11) NOT NULL,
  `current_liabilities` int(11) NOT NULL,
  `outstanding_shares` int(11) NOT NULL,
  `entry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`fundamentals_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fundamentals` */

insert  into `fundamentals`(`fundamentals_id`,`net_income`,`return_on_assets`,`cash_flow`,`total_assets`,`gross_profit`,`turnover`,`long_term_assets`,`current_assets`,`current_liabilities`,`outstanding_shares`,`entry_date`) values ('FBN',1000,2000,5000,1000,5000,5000,5000,5000,5000,5000,'2020-04-25 00:00:00'),('GTB',1000,2000,5000,1000,5000,5000,5000,5000,5000,5000,'2020-04-25 00:00:00');

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `user_id` char(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_user` */

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_role_id` int(50) NOT NULL AUTO_INCREMENT,
  `user_role` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `entry_date` datetime NOT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `user_roles` */

insert  into `user_roles`(`user_role_id`,`user_role`,`description`,`entry_date`) values (11,'Agric','Agric','2020-04-24 00:00:00'),(12,'Banking','Banking','2020-04-24 00:00:00');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` char(10) NOT NULL,
  `user_role_id` int(50) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile_no` char(15) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_role_id` (`user_role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `user_roles` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`user_role_id`,`first_name`,`last_name`,`gender`,`mobile_no`,`email`,`entry_date`) values ('02',12,'Abigail','Sarah','Female','080','sarah@yahoo.com','2020-04-24 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
