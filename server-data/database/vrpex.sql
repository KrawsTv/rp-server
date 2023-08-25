-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for vrpex
CREATE DATABASE IF NOT EXISTS `vrpex` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `vrpex`;

-- Dumping structure for table vrpex.bank_transfer
CREATE TABLE IF NOT EXISTS `bank_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.eg_policia
CREATE TABLE IF NOT EXISTS `eg_policia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `police_id` int(11) DEFAULT NULL,
  `text` varchar(1000) NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `horario` timestamp NULL DEFAULT current_timestamp(),
  `img` varchar(100) DEFAULT NULL,
  `ativo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.eg_policia_acao
CREATE TABLE IF NOT EXISTS `eg_policia_acao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `text` varchar(1000) NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `horario` timestamp NULL DEFAULT current_timestamp(),
  `qtdPoliciais` int(11) DEFAULT NULL,
  `participantes` varchar(100) DEFAULT '{}',
  `resultado` varchar(50) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `z` float DEFAULT NULL,
  `concluido` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.eg_policia_bate_ponto
CREATE TABLE IF NOT EXISTS `eg_policia_bate_ponto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `horario` timestamp NULL DEFAULT current_timestamp(),
  `horario2` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `ativo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.eg_policia_funcionarios
CREATE TABLE IF NOT EXISTS `eg_policia_funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `patente` varchar(100) DEFAULT 'Aluno',
  `unidade` varchar(100) DEFAULT '-',
  `pontuacao` int(11) DEFAULT 0,
  `advertencia` int(11) DEFAULT 0,
  `exonerado` int(11) DEFAULT 0,
  `motivo` varchar(100) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.eg_policia_pontos
CREATE TABLE IF NOT EXISTS `eg_policia_pontos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pontos` int(11) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `contabilizado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.eg_policia_relatorios
CREATE TABLE IF NOT EXISTS `eg_policia_relatorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `nuser_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.gas_station_balance
CREATE TABLE IF NOT EXISTS `gas_station_balance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gas_station_id` varchar(50) NOT NULL,
  `income` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.insto_accounts
CREATE TABLE IF NOT EXISTS `insto_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forename` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `surname` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.insto_instas
CREATE TABLE IF NOT EXISTS `insto_instas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filters` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_insto_instas_insto_accounts` (`authorId`),
  CONSTRAINT `FK_insto_instas_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.insto_likes
CREATE TABLE IF NOT EXISTS `insto_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `inapId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_insto_likes_insto_accounts` (`authorId`),
  KEY `FK_insto_likes_insto_instas` (`inapId`),
  CONSTRAINT `FK_insto_likes_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`),
  CONSTRAINT `FK_insto_likes_insto_instas` FOREIGN KEY (`inapId`) REFERENCES `insto_instas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.mrlt_fichados_data
CREATE TABLE IF NOT EXISTS `mrlt_fichados_data` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `dkey` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dvalue` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `datahora` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`did`,`dkey`,`user_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `dkey` (`dkey`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.mrlt_fichados_fotos
CREATE TABLE IF NOT EXISTS `mrlt_fichados_fotos` (
  `user_id` int(11) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.mrlt_hp_consultas
CREATE TABLE IF NOT EXISTS `mrlt_hp_consultas` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_user_id` int(11) NOT NULL,
  `c_esp` varchar(255) NOT NULL,
  `c_date` longtext NOT NULL,
  `c_status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.mrlt_hp_data
CREATE TABLE IF NOT EXISTS `mrlt_hp_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL DEFAULT '',
  `ocorrencia` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `datahora` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.mrlt_hp_fotos
CREATE TABLE IF NOT EXISTS `mrlt_hp_fotos` (
  `user_id` int(11) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.mrlt_identity
CREATE TABLE IF NOT EXISTS `mrlt_identity` (
  `user_id` int(11) NOT NULL,
  `imageUrl` longtext NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.mrlt_prisao
CREATE TABLE IF NOT EXISTS `mrlt_prisao` (
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.mrlt_residences
CREATE TABLE IF NOT EXISTS `mrlt_residences` (
  `residence_id` int(11) NOT NULL AUTO_INCREMENT,
  `residence_owner` int(11) NOT NULL DEFAULT 0,
  `residence_price` int(11) NOT NULL DEFAULT 0,
  `residence_hypothec_price` int(11) NOT NULL DEFAULT 0,
  `residence_has_tax` int(11) NOT NULL DEFAULT 1,
  `residence_tax_status` int(11) NOT NULL DEFAULT 0,
  `residence_tax_time` bigint(255) NOT NULL DEFAULT 0,
  `residence_name` varchar(255) NOT NULL,
  `residence_type` varchar(255) NOT NULL DEFAULT 'buy',
  `residence_payment_type` varchar(255) NOT NULL DEFAULT 'primary',
  `residence_max_residents` int(11) NOT NULL DEFAULT 3,
  `residence_chest` int(11) NOT NULL DEFAULT 250,
  `residence_chest_coords` varchar(255) NOT NULL,
  `residence_wardrobe_coords` varchar(255) NOT NULL,
  `residence_outerdoor_coords` varchar(255) NOT NULL,
  `residence_innerdoor_coords` varchar(255) NOT NULL,
  `residence_visit_exterior_coords` varchar(255) NOT NULL,
  `residence_visit_interior_coords` varchar(255) NOT NULL,
  `residence_garage_active` int(11) NOT NULL DEFAULT 0,
  `residence_garage_blip` varchar(255) NOT NULL,
  `residence_garage_spawn` varchar(50) NOT NULL DEFAULT '',
  `residence_residents` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`residence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.mrlt_residences_notifys
CREATE TABLE IF NOT EXISTS `mrlt_residences_notifys` (
  `notify_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `notify_string` longtext DEFAULT NULL,
  PRIMARY KEY (`notify_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.nation_concessionaria
CREATE TABLE IF NOT EXISTS `nation_concessionaria` (
  `vehicle` text NOT NULL,
  `estoque` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`vehicle`(765))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.nation_race
CREATE TABLE IF NOT EXISTS `nation_race` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `nickname` text NOT NULL DEFAULT '',
  `races` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.phone_ch_reddit
CREATE TABLE IF NOT EXISTS `phone_ch_reddit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redgkit` varchar(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.phone_reddit
CREATE TABLE IF NOT EXISTS `phone_reddit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redgkit` varchar(20) DEFAULT NULL,
  `reditsage` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10704 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.uf_appointaments
CREATE TABLE IF NOT EXISTS `uf_appointaments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product` text DEFAULT NULL,
  `expirate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.uf_daily
CREATE TABLE IF NOT EXISTS `uf_daily` (
  `user_id` int(10) unsigned NOT NULL,
  `hours` float NOT NULL DEFAULT 0,
  `lastGift` mediumtext DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.uf_rankup
CREATE TABLE IF NOT EXISTS `uf_rankup` (
  `user_id` int(10) unsigned NOT NULL,
  `gifts` int(10) unsigned NOT NULL DEFAULT 1,
  UNIQUE KEY `UNIQUE` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_banco
CREATE TABLE IF NOT EXISTS `vrp_banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `extrato` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_business
CREATE TABLE IF NOT EXISTS `vrp_business` (
  `user_id` int(11) NOT NULL,
  `capital` int(11) DEFAULT NULL,
  `laundered` int(11) DEFAULT NULL,
  `reset_timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_business_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_ebay
CREATE TABLE IF NOT EXISTS `vrp_ebay` (
  `id` int(9) unsigned NOT NULL,
  `user_id` int(6) NOT NULL,
  `item_id` varchar(255) NOT NULL DEFAULT '0',
  `quantidade` int(9) NOT NULL DEFAULT 0,
  `price` int(9) NOT NULL DEFAULT 0,
  `anony` varchar(5) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_estoque
CREATE TABLE IF NOT EXISTS `vrp_estoque` (
  `vehicle` varchar(100) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_helpdesk_respostas
CREATE TABLE IF NOT EXISTS `vrp_helpdesk_respostas` (
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `case_id` int(11) NOT NULL,
  `createdAt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_helpdesk_ticket
CREATE TABLE IF NOT EXISTS `vrp_helpdesk_ticket` (
  `user_id` tinyint(11) NOT NULL,
  `title` text NOT NULL DEFAULT '',
  `message` text NOT NULL DEFAULT '',
  `createdAt` text NOT NULL DEFAULT '',
  `status` text NOT NULL DEFAULT '',
  `id` tinyint(4) NOT NULL,
  `case_id` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_homes_permissions
CREATE TABLE IF NOT EXISTS `vrp_homes_permissions` (
  `owner` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `garage` int(11) NOT NULL,
  `home` varchar(100) NOT NULL DEFAULT '',
  `tax` varchar(24) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_priority
CREATE TABLE IF NOT EXISTS `vrp_priority` (
  `id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_shops
CREATE TABLE IF NOT EXISTS `vrp_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `security` varchar(255) NOT NULL DEFAULT '1',
  `price` int(11) DEFAULT NULL,
  `forsale` tinyint(1) DEFAULT NULL,
  `stock` text DEFAULT NULL,
  `maxstock` int(11) DEFAULT NULL,
  `vault` int(11) DEFAULT NULL,
  `maxvault` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_srv_data
CREATE TABLE IF NOT EXISTS `vrp_srv_data` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_stock_exchange
CREATE TABLE IF NOT EXISTS `vrp_stock_exchange` (
  `name` varchar(50) DEFAULT NULL,
  `points` int(10) DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_users
CREATE TABLE IF NOT EXISTS `vrp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_login` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `whitelisted` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `coins` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_user_data
CREATE TABLE IF NOT EXISTS `vrp_user_data` (
  `user_id` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`user_id`,`dkey`),
  CONSTRAINT `fk_user_data_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_user_homes
CREATE TABLE IF NOT EXISTS `vrp_user_homes` (
  `user_id` int(11) NOT NULL,
  `home` varchar(255) NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`home`),
  CONSTRAINT `fk_user_homes_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_user_identities
CREATE TABLE IF NOT EXISTS `vrp_user_identities` (
  `user_id` int(11) NOT NULL,
  `registration` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `registration` (`registration`),
  KEY `phone` (`phone`),
  CONSTRAINT `fk_user_identities_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_user_ids
CREATE TABLE IF NOT EXISTS `vrp_user_ids` (
  `identifier` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  KEY `fk_user_ids_users` (`user_id`),
  CONSTRAINT `fk_user_ids_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_user_moneys
CREATE TABLE IF NOT EXISTS `vrp_user_moneys` (
  `user_id` int(11) NOT NULL,
  `wallet` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_moneys_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_user_vehicles
CREATE TABLE IF NOT EXISTS `vrp_user_vehicles` (
  `user_id` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `detido` int(1) NOT NULL DEFAULT 0,
  `time` varchar(24) NOT NULL DEFAULT '0',
  `engine` int(4) NOT NULL DEFAULT 1000,
  `body` int(4) NOT NULL DEFAULT 1000,
  `fuel` int(3) NOT NULL DEFAULT 100,
  `ipva` int(11) NOT NULL,
  `alugado` tinyint(4) NOT NULL DEFAULT 0,
  `data_alugado` text DEFAULT NULL,
  `estado` text DEFAULT '[]',
  PRIMARY KEY (`user_id`,`vehicle`),
  KEY `ipva` (`ipva`),
  CONSTRAINT `fk_user_vehicles_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.vrp_weapons
CREATE TABLE IF NOT EXISTS `vrp_weapons` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `weapon` text NOT NULL,
  `ammo` int(11) NOT NULL DEFAULT 0,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table vrpex.yellow_tweets
CREATE TABLE IF NOT EXISTS `yellow_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=897 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
