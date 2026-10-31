-- Blood Bank & Donor Management System (BBDMS)
-- Database schema reconstructed from the queries used in the PHP code.
-- Import: create/select a database named `bbdms` in phpMyAdmin, then Import this file.
--
-- Default admin login (CHANGE AFTER FIRST LOGIN):
--   Username: admin
--   Password: Admin@123

CREATE DATABASE IF NOT EXISTS `bbdms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bbdms`;

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `tblbloodrequirer`;
DROP TABLE IF EXISTS `tblblooddonars`;
DROP TABLE IF EXISTS `tbladmin`;
DROP TABLE IF EXISTS `tblbloodgroup`;
DROP TABLE IF EXISTS `tblcontactusinfo`;
DROP TABLE IF EXISTS `tblcontactusquery`;
DROP TABLE IF EXISTS `tblpages`;

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) NOT NULL,
  `MobileNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) NOT NULL,
  `AdminRegdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblblooddonars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(120) DEFAULT NULL,
  `MobileNumber` varchar(20) DEFAULT NULL,
  `EmailId` varchar(200) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `BloodGroup` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `Password` varchar(200) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_donor_email` (`EmailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblbloodgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BloodGroup` varchar(20) NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblbloodrequirer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BloodDonarID` int(11) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `EmailId` varchar(200) DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `BloodRequirefor` varchar(255) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `ApplyDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `idx_requirer_donor` (`BloodDonarID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Address` tinytext DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `detail` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed data
INSERT INTO `tbladmin` (`AdminName`,`UserName`,`MobileNumber`,`Email`,`Password`) VALUES
('Admin','admin','9999999999','admin@example.com','0e7517141fb53f21ee439b355b5a1d0a');

INSERT INTO `tblbloodgroup` (`BloodGroup`) VALUES
('A+'),('A-'),('B+'),('B-'),('AB+'),('AB-'),('O+'),('O-');

INSERT INTO `tblcontactusinfo` (`Address`,`EmailId`,`ContactNo`) VALUES
('Your address here','info@example.com','919999999999');

INSERT INTO `tblpages` (`PageName`,`type`,`detail`) VALUES
('About Us','aboutus','<p>Write about your blood bank here. You can edit this from Admin &gt; Manage Pages.</p>'),
('Why Become Donor','donor','<p>Explain why people should donate blood. You can edit this from Admin &gt; Manage Pages.</p>');
