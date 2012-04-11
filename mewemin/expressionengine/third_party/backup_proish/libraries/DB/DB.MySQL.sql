--
-- @author Dick Munroe <munroe@csworks.com>
-- @copyright copyright @ 2006 by Dick Munroe, Cottage Software Works, Inc.
-- @license http://www.csworks.com/publications/ModifiedNetBSD.html
-- @version 2.0.0
-- @package dm.DB
-- @example ./example.php
--
-- SQL procedure to create the test database and table for the examples
-- in the dm.DB project.
--
-- phpMyAdmin SQL Dump
-- version 2.6.4-pl2-Debian-1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 06, 2006 at 02:27 PM
-- Server version: 4.1.11
-- PHP Version: 4.4.0-4
--
-- Database: `DB`
--

DROP DATABASE IF EXISTS `DB` ;

CREATE DATABASE `DB` ;

USE `DB` ;

-- --------------------------------------------------------

--
-- Table structure for table `table`
--

DROP TABLE IF EXISTS `table`;
CREATE TABLE `table` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `fullname` varchar(255) default NULL,
  `user` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `table`
--

INSERT INTO `table` (`id`, `fullname`, `user`, `password`) VALUES (1, 'A', 'a', 'b');
INSERT INTO `table` (`id`, `fullname`, `user`, `password`) VALUES (2, 'B', 'b', 'c');
INSERT INTO `table` (`id`, `fullname`, `user`, `password`) VALUES (3, 'C', 'c', 'd');
INSERT INTO `table` (`id`, `fullname`, `user`, `password`) VALUES (4, 'D', 'd', 'e');
INSERT INTO `table` (`id`, `fullname`, `user`, `password`) VALUES (5, 'E', 'e', 'f');
INSERT INTO `table` (`id`, `fullname`, `user`, `password`) VALUES (6, 'F', 'f', 'g');
INSERT INTO `table` (`id`, `fullname`, `user`, `password`) VALUES (7, 'G', 'g', 'h');
INSERT INTO `table` (`id`, `fullname`, `user`, `password`) VALUES (8, 'H', 'h', 'i');
INSERT INTO `table` (`id`, `fullname`, `user`, `password`) VALUES (9, 'J', 'J', 'k');
INSERT INTO `table` (`id`, `fullname`, `user`, `password`) VALUES (10, 'K', 'k', 'l');
