-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Час створення: Лют 03 2013 р., 21:53
-- Версія сервера: 5.1.44
-- Версія PHP: 5.2.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- БД: `homebuh`
--

-- --------------------------------------------------------

--
-- Структура таблиці `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `balance` decimal(12,2) DEFAULT '0.00',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп даних таблиці `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `type`, `status`, `balance`, `description`) VALUES
(1, 'In', 0, 1, 0.00, ''),
(2, 'Out', 0, 1, 0.00, '');

-- --------------------------------------------------------

--
-- Структура таблиці `acc_status`
--

CREATE TABLE IF NOT EXISTS `acc_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ACCOUNT STATUS' AUTO_INCREMENT=3 ;

--
-- Дамп даних таблиці `acc_status`
--

INSERT INTO `acc_status` (`id`, `name`) VALUES
(1, 'Active'),
(2, 'Closed');

-- --------------------------------------------------------

--
-- Структура таблиці `acc_type`
--

CREATE TABLE IF NOT EXISTS `acc_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп даних таблиці `acc_type`
--


-- --------------------------------------------------------

--
-- Структура таблиці `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(12,2) DEFAULT NULL,
  `account_from` int(11) DEFAULT NULL,
  `account_to` int(11) DEFAULT NULL,
  `pay_date` datetime NOT NULL,
  `status` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PAYMENT_TYPE` (`type`),
  KEY `FK_ACC_FROM` (`account_from`),
  KEY `FK_ACC_TO` (`account_to`),
  KEY `FK_PAYMENT_STATUS` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп даних таблиці `payments`
--


-- --------------------------------------------------------

--
-- Структура таблиці `pay_status`
--

CREATE TABLE IF NOT EXISTS `pay_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Payment status' AUTO_INCREMENT=3 ;

--
-- Дамп даних таблиці `pay_status`
--

INSERT INTO `pay_status` (`id`, `name`) VALUES
(1, 'Active'),
(2, 'Canceled');

-- --------------------------------------------------------

--
-- Структура таблиці `pay_type`
--

CREATE TABLE IF NOT EXISTS `pay_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `pay_type`
--

INSERT INTO `pay_type` (`id`, `name`) VALUES
(1, 'default');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `FK_ACC_FROM` FOREIGN KEY (`account_from`) REFERENCES `accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ACC_TO` FOREIGN KEY (`account_to`) REFERENCES `accounts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PAYMENT_STATUS` FOREIGN KEY (`status`) REFERENCES `pay_status` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PAYMENT_TYPE` FOREIGN KEY (`type`) REFERENCES `pay_type` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
