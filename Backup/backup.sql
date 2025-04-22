-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!50606 SET @OLD_INNODB_STATS_AUTO_RECALC=@@INNODB_STATS_AUTO_RECALC */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=OFF */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `columns_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`User`,`Db`,`Table_name`,`Column_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `component_id` int unsigned NOT NULL AUTO_INCREMENT,
  `component_group_id` int unsigned NOT NULL,
  `component_urn` text NOT NULL,
  PRIMARY KEY (`component_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Components';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`User`,`Db`),
  KEY `User` (`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `default_roles`
--

DROP TABLE IF EXISTS `default_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_roles` (
  `HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `DEFAULT_ROLE_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '%',
  `DEFAULT_ROLE_USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`HOST`,`USER`,`DEFAULT_ROLE_HOST`,`DEFAULT_ROLE_USER`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Default roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `engine_cost`
--

DROP TABLE IF EXISTS `engine_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engine_cost` (
  `engine_name` varchar(64) NOT NULL,
  `device_type` int NOT NULL,
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'io_block_read_cost' then 1.0 when _utf8mb3'memory_block_read_cost' then 0.25 else NULL end)) VIRTUAL,
  PRIMARY KEY (`cost_name`,`engine_name`,`device_type`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `ret` tinyint NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `global_grants`
--

DROP TABLE IF EXISTS `global_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_grants` (
  `USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `PRIV` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `WITH_GRANT_OPTION` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`USER`,`HOST`,`PRIV`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Extended global grants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gtid_executed`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `gtid_executed` (
  `source_uuid` char(36) NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  `interval_start` bigint NOT NULL COMMENT 'First number of interval.',
  `interval_end` bigint NOT NULL COMMENT 'Last number of interval.',
  PRIMARY KEY (`source_uuid`,`interval_start`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int unsigned NOT NULL,
  `help_keyword_id` int unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ndb_binlog_index`
--

DROP TABLE IF EXISTS `ndb_binlog_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ndb_binlog_index` (
  `Position` bigint unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint unsigned NOT NULL,
  `inserts` int unsigned NOT NULL,
  `updates` int unsigned NOT NULL,
  `deletes` int unsigned NOT NULL,
  `schemaops` int unsigned NOT NULL,
  `orig_server_id` int unsigned NOT NULL,
  `orig_epoch` bigint unsigned NOT NULL,
  `gci` int unsigned NOT NULL,
  `next_position` bigint unsigned NOT NULL,
  `next_file` varchar(255) NOT NULL,
  PRIMARY KEY (`epoch`,`orig_server_id`,`orig_epoch`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=latin1 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_history`
--

DROP TABLE IF EXISTS `password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_history` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Password_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `Password` text COLLATE utf8mb3_bin,
  PRIMARY KEY (`Host`,`User`,`Password_timestamp` DESC)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Password history for user accounts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procs_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8mb3_bin NOT NULL,
  `Grantor` varchar(288) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Db`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxies_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Proxied_host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Proxied_user` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` varchar(288) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replication_asynchronous_connection_failover`
--

DROP TABLE IF EXISTS `replication_asynchronous_connection_failover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_asynchronous_connection_failover` (
  `Channel_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The source hostname that the replica will attempt to switch over the replication connection to in case of a failure.',
  `Port` int unsigned NOT NULL COMMENT 'The source port that the replica will attempt to switch over the replication connection to in case of a failure.',
  `Network_namespace` char(64) NOT NULL COMMENT 'The source network namespace that the replica will attempt to switch over the replication connection to in case of a failure. If its value is empty, connections use the default (global) namespace.',
  `Weight` tinyint unsigned NOT NULL COMMENT 'The order in which the replica shall try to switch the connection over to when there are failures. Weight can be set to a number between 1 and 100, where 100 is the highest weight and 1 the lowest.',
  `Managed_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'The name of the group which this server belongs to.',
  PRIMARY KEY (`Channel_name`,`Host`,`Port`,`Network_namespace`,`Managed_name`),
  KEY `Channel_name` (`Channel_name`,`Managed_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The source configuration details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replication_asynchronous_connection_failover_managed`
--

DROP TABLE IF EXISTS `replication_asynchronous_connection_failover_managed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_asynchronous_connection_failover_managed` (
  `Channel_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The replication channel name that connects source and replica.',
  `Managed_name` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'The name of the source which needs to be managed.',
  `Managed_type` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'Determines the managed type.',
  `Configuration` json DEFAULT NULL COMMENT 'The data to help manage group. For Managed_type = GroupReplication, Configuration value should contain {"Primary_weight": 80, "Secondary_weight": 60}, so that it assigns weight=80 to PRIMARY of the group, and weight=60 for rest of the members in mysql.replication_asynchronous_connection_failover table.',
  PRIMARY KEY (`Channel_name`,`Managed_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The managed source configuration details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replication_group_configuration_version`
--

DROP TABLE IF EXISTS `replication_group_configuration_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_group_configuration_version` (
  `name` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The configuration name.',
  `version` bigint unsigned NOT NULL COMMENT 'The version of the configuration name.',
  PRIMARY KEY (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The group configuration version.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `replication_group_member_actions`
--

DROP TABLE IF EXISTS `replication_group_member_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replication_group_member_actions` (
  `name` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The action name.',
  `event` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The event that will trigger the action.',
  `enabled` tinyint(1) NOT NULL COMMENT 'Whether the action is enabled.',
  `type` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'The action type.',
  `priority` tinyint unsigned NOT NULL COMMENT 'The order on which the action will be run, value between 1 and 100, lower values first.',
  `error_handling` char(64) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL COMMENT 'On errors during the action will be handled: IGNORE, CRITICAL.',
  PRIMARY KEY (`name`,`event`),
  KEY `event` (`event`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='The member actions configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_edges`
--

DROP TABLE IF EXISTS `role_edges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_edges` (
  `FROM_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `FROM_USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `TO_HOST` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `TO_USER` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `WITH_ADMIN_OPTION` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`FROM_HOST`,`FROM_USER`,`TO_HOST`,`TO_USER`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Role hierarchy and role grants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `server_cost`
--

DROP TABLE IF EXISTS `server_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_cost` (
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  `default_value` float GENERATED ALWAYS AS ((case `cost_name` when _utf8mb3'disk_temptable_create_cost' then 20.0 when _utf8mb3'disk_temptable_row_cost' then 0.5 when _utf8mb3'key_compare_cost' then 0.05 when _utf8mb3'memory_temptable_create_cost' then 1.0 when _utf8mb3'memory_temptable_row_cost' then 0.1 when _utf8mb3'row_evaluate_cost' then 0.1 else NULL end)) VIRTUAL,
  PRIMARY KEY (`cost_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_master_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slave_master_info` (
  `Number_of_lines` int unsigned NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` bigint unsigned NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'The host name of the source.',
  `User_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The user name used to connect to the master.',
  `User_password` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The password used to connect to the master.',
  `Port` int unsigned NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` int unsigned NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` tinyint(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` tinyint(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` float NOT NULL,
  `Bind` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The master server uuid.',
  `Retry_count` bigint unsigned NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` tinyint(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  `Channel_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The channel on which the replica is connected to a source. Used in Multisource Replication',
  `Tls_version` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Tls version',
  `Public_key_path` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The file containing public key of master server.',
  `Get_public_key` tinyint(1) NOT NULL COMMENT 'Preference to get public key from master.',
  `Network_namespace` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Network namespace used for communication with the master server.',
  `Master_compression_algorithm` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'Compression algorithm supported for data transfer between source and replica.',
  `Master_zstd_compression_level` int unsigned NOT NULL COMMENT 'Compression level associated with zstd compression algorithm.',
  `Tls_ciphersuites` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Ciphersuites used for TLS 1.3 communication with the master server.',
  `Source_connection_auto_failover` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicates whether the channel connection failover is enabled.',
  `Gtid_only` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicates if this channel only uses GTIDs and does not persist positions.',
  PRIMARY KEY (`Channel_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Master Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_relay_log_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slave_relay_log_info` (
  `Number_of_lines` int unsigned NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` bigint unsigned DEFAULT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` bigint unsigned DEFAULT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` int DEFAULT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` int unsigned DEFAULT NULL,
  `Id` int unsigned DEFAULT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  `Channel_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The channel on which the replica is connected to a source. Used in Multisource Replication',
  `Privilege_checks_username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'Username part of PRIVILEGE_CHECKS_USER.',
  `Privilege_checks_hostname` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL COMMENT 'Hostname part of PRIVILEGE_CHECKS_USER.',
  `Require_row_format` tinyint(1) NOT NULL COMMENT 'Indicates whether the channel shall only accept row based events.',
  `Require_table_primary_key_check` enum('STREAM','ON','OFF','GENERATE') NOT NULL DEFAULT 'STREAM' COMMENT 'Indicates what is the channel policy regarding tables without primary keys on create and alter table queries',
  `Assign_gtids_to_anonymous_transactions_type` enum('OFF','LOCAL','UUID') NOT NULL DEFAULT 'OFF' COMMENT 'Indicates whether the channel will generate a new GTID for anonymous transactions. OFF means that anonymous transactions will remain anonymous. LOCAL means that anonymous transactions will be assigned a newly generated GTID based on server_uuid. UUID indicates that anonymous transactions will be assigned a newly generated GTID based on Assign_gtids_to_anonymous_transactions_value',
  `Assign_gtids_to_anonymous_transactions_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Indicates the UUID used while generating GTIDs for anonymous transactions',
  PRIMARY KEY (`Channel_name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Relay Log Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_worker_info`
--

DROP TABLE IF EXISTS `slave_worker_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slave_worker_info` (
  `Id` int unsigned NOT NULL,
  `Relay_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Relay_log_pos` bigint unsigned NOT NULL,
  `Master_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Master_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_relay_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Checkpoint_relay_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_master_log_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `Checkpoint_master_log_pos` bigint unsigned NOT NULL,
  `Checkpoint_seqno` int unsigned NOT NULL,
  `Checkpoint_group_size` int unsigned NOT NULL,
  `Checkpoint_group_bitmap` blob NOT NULL,
  `Channel_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'The channel on which the replica is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`,`Id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Worker Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables_priv` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Grantor` varchar(288) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`User`,`Db`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint NOT NULL,
  `Correction` int NOT NULL,
  PRIMARY KEY (`Transition_time`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int unsigned NOT NULL,
  `Transition_time` bigint NOT NULL,
  `Transition_type_id` int unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int unsigned NOT NULL,
  `Transition_type_id` int unsigned NOT NULL,
  `Offset` int NOT NULL DEFAULT '0',
  `Is_DST` tinyint unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int unsigned NOT NULL DEFAULT '0',
  `max_updates` int unsigned NOT NULL DEFAULT '0',
  `max_connections` int unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT 'caching_sha2_password',
  `authentication_string` text COLLATE utf8mb3_bin,
  `password_expired` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `password_last_changed` timestamp NULL DEFAULT NULL,
  `password_lifetime` smallint unsigned DEFAULT NULL,
  `account_locked` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_role_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Drop_role_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Password_reuse_history` smallint unsigned DEFAULT NULL,
  `Password_reuse_time` smallint unsigned DEFAULT NULL,
  `Password_require_current` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `User_attributes` json DEFAULT NULL,
  PRIMARY KEY (`Host`,`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'mysql'
--

--
-- Dumping routines for database 'mysql'
--

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint unsigned NOT NULL,
  `server_id` int unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumblob NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb3 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int NOT NULL,
  `rows_examined` int NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int NOT NULL,
  `insert_id` int NOT NULL,
  `server_id` int unsigned NOT NULL,
  `sql_text` mediumblob NOT NULL,
  `thread_id` bigint unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb3 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `dataplc`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dataplc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dataplc`;

--
-- Table structure for table `camback`
--

DROP TABLE IF EXISTS `camback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camback` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) DEFAULT NULL,
  `CodeModel` varchar(20) DEFAULT NULL,
  `CodeSerial` varchar(20) DEFAULT NULL,
  `Judge` varchar(2) DEFAULT NULL,
  `VitSidePhai` varchar(2) DEFAULT NULL,
  `VitSideTrai` varchar(2) DEFAULT NULL,
  `Hookpan` varchar(2) DEFAULT NULL,
  `PWE` varchar(2) DEFAULT NULL,
  `VitPWE` varchar(2) DEFAULT NULL,
  `InPadComp` varchar(2) DEFAULT NULL,
  `ClampPipe` varchar(2) DEFAULT NULL,
  `VitClampPipe` varchar(2) DEFAULT NULL,
  `BoxPCB` varchar(2) DEFAULT NULL,
  `VitBoxPCB` varchar(2) DEFAULT NULL,
  `ChotComp` varchar(2) DEFAULT NULL,
  `BanhXePhai` varchar(2) DEFAULT NULL,
  `BanhXeTrai` varchar(2) DEFAULT NULL,
  `CapPipe` varchar(2) DEFAULT NULL,
  `RubberPipe` varchar(2) DEFAULT NULL,
  `InsPadComp` varchar(2) DEFAULT NULL,
  `DayNoiDat` varchar(2) DEFAULT NULL,
  `VitDayNoiDatSidePhai` varchar(2) DEFAULT NULL,
  `WiringDiagram` varchar(2) DEFAULT NULL,
  `CoverComp` varchar(2) DEFAULT NULL,
  `VitCoverComp` varchar(2) DEFAULT NULL,
  `Hanger` varchar(2) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `camback_CodeBack_Index` (`CodeBack`) /*!80000 INVISIBLE */,
  KEY `camback_CodeMdoel_Index` (`CodeModel`),
  KEY `camback_TimeInsert_Index` (`TimeInsert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `camfront`
--

DROP TABLE IF EXISTS `camfront`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camfront` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CodeModel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CodeSerial` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Judge` varchar(2) DEFAULT NULL,
  `Econavi` varchar(2) DEFAULT NULL,
  `LogoPana` varchar(2) DEFAULT NULL,
  `Japanquality` varchar(2) DEFAULT NULL,
  `Warranty` varchar(2) DEFAULT NULL,
  `POPFC` varchar(2) DEFAULT NULL,
  `POPPC` varchar(2) DEFAULT NULL,
  `EnergyLabel` varchar(2) DEFAULT NULL,
  `PanelDoorFC` varchar(2) DEFAULT NULL,
  `PanelDoorPC` varchar(2) DEFAULT NULL,
  `WDLabel` varchar(2) DEFAULT NULL,
  `WD` varchar(2) DEFAULT NULL,
  `DoorControl` varchar(2) DEFAULT NULL,
  `_1ST` varchar(2) DEFAULT NULL,
  `Handle` varchar(2) DEFAULT NULL,
  `POPPCBottom` varchar(2) DEFAULT NULL,
  `Wellness` varchar(2) DEFAULT NULL,
  `ADVISORYLabel` varchar(2) DEFAULT NULL,
  `EnvironmentLabel` varchar(2) DEFAULT NULL,
  `POPBC` varchar(2) DEFAULT NULL,
  `CoverHingeTop` varchar(2) DEFAULT NULL,
  `FoamProtectorDoor` varchar(2) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `camfront_CodeBack_Index` (`CodeBack`) /*!80000 INVISIBLE */,
  KEY `camfront_CodeModel_Index` (`CodeModel`),
  KEY `camfront_TimeInsert_Index` (`TimeInsert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configcheckfinal`
--

DROP TABLE IF EXISTS `configcheckfinal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configcheckfinal` (
  `VP` tinyint DEFAULT '1',
  `GAS` tinyint DEFAULT '1',
  `WI1WITH` tinyint DEFAULT '1',
  `WI1START` tinyint DEFAULT '1',
  `IP` tinyint DEFAULT '1',
  `DF` tinyint DEFAULT '1',
  `TEMP` tinyint DEFAULT '1',
  `IOT` tinyint DEFAULT '1',
  `WI2` tinyint DEFAULT '1',
  `PAN` tinyint DEFAULT '1',
  `CAMBACK` tinyint DEFAULT '1',
  `CAMFRONT` tinyint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `configconnectionplc`
--

DROP TABLE IF EXISTS `configconnectionplc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configconnectionplc` (
  `IpAddress` varchar(30) DEFAULT NULL,
  `PortNumber` int DEFAULT NULL,
  `NameDeviceTrigerReadCabi` int DEFAULT NULL,
  `NameDeviceDataCabi` int DEFAULT NULL,
  `QuantityDataCabi` int DEFAULT NULL,
  `NameDeviceDataPerson` int DEFAULT NULL,
  `QuantityDataPerson` int DEFAULT NULL,
  `NameDeviceDataReason` int DEFAULT NULL,
  `QuantityDataReason` int DEFAULT NULL,
  `NameDeviceSendResult` int DEFAULT NULL,
  `QuantityDeviceSendResult` int DEFAULT NULL,
  `AliveBit` int DEFAULT NULL,
  `NameDeviceSendConfirm` int DEFAULT NULL,
  `NameDeviceTrigerReadError` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datacheckfinal`
--

DROP TABLE IF EXISTS `datacheckfinal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datacheckfinal` (
  `CodeBack` varchar(30) DEFAULT NULL,
  `Judge_VP` varchar(8) DEFAULT NULL,
  `Judge_GAS` varchar(8) DEFAULT NULL,
  `Judge_WI1WITH` varchar(8) DEFAULT NULL,
  `Judge_WI1START` varchar(8) DEFAULT NULL,
  `Judge_IP` varchar(8) DEFAULT NULL,
  `Judge_DF` varchar(8) DEFAULT NULL,
  `Judge_TEMP` varchar(8) DEFAULT NULL,
  `Judge_IOT` varchar(8) DEFAULT NULL,
  `Judge_WI2` varchar(8) DEFAULT NULL,
  `Judge_PAN` varchar(8) DEFAULT NULL,
  `Judge_CAMBACK` varchar(8) DEFAULT NULL,
  `Judge_CAMFRONT` varchar(8) DEFAULT NULL,
  `Judge_Total` varchar(8) DEFAULT NULL,
  `ReasonError` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PersonConfirm` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TimeUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `datacheckfinal_CodeBack_Index` (`CodeBack`) /*!80000 INVISIBLE */,
  KEY `datacheckfinal_TimeUpdate_Index` (`TimeUpdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datacheckfinaldetail`
--

DROP TABLE IF EXISTS `datacheckfinaldetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datacheckfinaldetail` (
  `CodeBack` varchar(30) DEFAULT NULL,
  `Judge_VP` varchar(8) DEFAULT NULL,
  `Judge_GAS` varchar(8) DEFAULT NULL,
  `Judge_WI1WITH` varchar(8) DEFAULT NULL,
  `Judge_WI1START` varchar(8) DEFAULT NULL,
  `Judge_IP` varchar(8) DEFAULT NULL,
  `Judge_DF` varchar(8) DEFAULT NULL,
  `Judge_TEMP` varchar(8) DEFAULT NULL,
  `Judge_IOT` varchar(8) DEFAULT NULL,
  `Judge_WI2` varchar(8) DEFAULT NULL,
  `Judge_PAN` varchar(8) DEFAULT NULL,
  `Judge_CAMBACK` varchar(8) DEFAULT NULL,
  `Judge_CAMFRONT` varchar(8) DEFAULT NULL,
  `Judge_Total` varchar(8) DEFAULT NULL,
  `ReasonError` varchar(100) DEFAULT NULL,
  `PersonConfirm` varchar(50) DEFAULT NULL,
  `TimeUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `datacheckfinaldetail_CodeBack_Index` (`CodeBack`) /*!80000 INVISIBLE */,
  KEY `datacheckfinaldetail_TimeUpdate_Index` (`TimeUpdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataplan`
--

DROP TABLE IF EXISTS `dataplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataplan` (
  `Model` varchar(30) DEFAULT NULL,
  `QuantityDay` int DEFAULT NULL,
  `QuantityPerSec` float DEFAULT NULL,
  `Quantity1` int DEFAULT NULL,
  `Quantity2` int DEFAULT NULL,
  `Quantity3` int DEFAULT NULL,
  `TotalTime` double DEFAULT NULL,
  `TimeStart` datetime DEFAULT NULL,
  `TimeEnd` datetime DEFAULT NULL,
  `TimeUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `MonitorSpecial` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataplanca1`
--

DROP TABLE IF EXISTS `dataplanca1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataplanca1` (
  `Model` varchar(30) DEFAULT NULL,
  `QuantityDay` int DEFAULT NULL,
  `QuantityPerSec` float DEFAULT NULL,
  `TotalTime` double DEFAULT NULL,
  `TimeStart` datetime DEFAULT NULL,
  `TimeEnd` datetime DEFAULT NULL,
  `TimeUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `MonitorSpecial` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataplanca2`
--

DROP TABLE IF EXISTS `dataplanca2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataplanca2` (
  `Model` varchar(30) DEFAULT NULL,
  `QuantityDay` int DEFAULT NULL,
  `QuantityPerSec` float DEFAULT NULL,
  `TotalTime` double DEFAULT NULL,
  `TimeStart` datetime DEFAULT NULL,
  `TimeEnd` datetime DEFAULT NULL,
  `TimeUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `MonitorSpecial` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataplanca3`
--

DROP TABLE IF EXISTS `dataplanca3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataplanca3` (
  `Model` varchar(30) DEFAULT NULL,
  `QuantityDay` int DEFAULT NULL,
  `QuantityPerSec` float DEFAULT NULL,
  `TotalTime` double DEFAULT NULL,
  `TimeStart` datetime DEFAULT NULL,
  `TimeEnd` datetime DEFAULT NULL,
  `TimeUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `MonitorSpecial` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `df`
--

DROP TABLE IF EXISTS `df`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) DEFAULT NULL,
  `CodeModel` varchar(20) DEFAULT NULL,
  `CodeSerial` varchar(10) DEFAULT NULL,
  `Judge` varchar(10) DEFAULT NULL,
  `Volt` varchar(10) DEFAULT NULL,
  `LL` varchar(10) DEFAULT NULL,
  `UL` varchar(10) DEFAULT NULL,
  `Value` varchar(10) DEFAULT NULL,
  `CurrentmA` varchar(10) DEFAULT NULL,
  `U` varchar(10) DEFAULT NULL,
  `Progname` varchar(10) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `df_CodeBack_Index` (`CodeBack`),
  KEY `df_CodeModel_Index` (`CodeModel`),
  KEY `df_TimeInsert_Index` (`TimeInsert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gas`
--

DROP TABLE IF EXISTS `gas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gas` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) DEFAULT NULL,
  `CodeModel` varchar(20) DEFAULT NULL,
  `CodeSerial` varchar(10) DEFAULT NULL,
  `Judge` varchar(10) DEFAULT NULL,
  `CodeCompressor` varchar(50) DEFAULT NULL,
  `Temp` varchar(15) DEFAULT NULL,
  `OIL` varchar(15) DEFAULT NULL,
  `OILSpec` varchar(15) DEFAULT NULL,
  `GAS` varchar(15) DEFAULT NULL,
  `GASSpec` varchar(15) DEFAULT NULL,
  `Mode` varchar(15) DEFAULT NULL,
  `PUMP` varchar(15) DEFAULT NULL,
  `VaccumCou` varchar(15) DEFAULT NULL,
  `VaccumRF` varchar(15) DEFAULT NULL,
  `PressureGasPipe` varchar(15) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `gas_CodeBack_Index` (`CodeBack`) /*!80000 INVISIBLE */,
  KEY `gas_CodeModel_Index` (`CodeModel`),
  KEY `gas_TimeInsert_Index` (`TimeInsert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`TA`@`%`*/ /*!50003 TRIGGER `before_insert_gas` BEFORE INSERT ON `gas` FOR EACH ROW BEGIN
    -- Kiểm tra xem giá trị đã tồn tại trong bảng gasOK hay chưa
    if(New.Judge = 'OK') then
    IF NOT EXISTS (SELECT 1 FROM gas_ok WHERE CodeBack = NEW.CodeBack) THEN
       
        INSERT INTO `dataplc`.`gas_ok`
(`TimePLC`,
`CodeBack`,
`CodeModel`,
`CodeSerial`,
`Judge`)
VALUES
(NEW.TimePLC,
NEW.CodeBack,
NEW.CodeModel,
NEW.CodeSerial,
NEW.Judge);

    END IF;
     END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `gas_ok`
--

DROP TABLE IF EXISTS `gas_ok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gas_ok` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) DEFAULT NULL,
  `CodeModel` varchar(20) DEFAULT NULL,
  `CodeSerial` varchar(10) DEFAULT NULL,
  `Judge` varchar(10) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iot`
--

DROP TABLE IF EXISTS `iot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(50) DEFAULT NULL,
  `CodeModel` varchar(50) DEFAULT NULL,
  `CodeSerial` varchar(50) DEFAULT NULL,
  `Judge` varchar(50) DEFAULT NULL,
  `CodeMarket` varchar(50) DEFAULT NULL,
  `Information` varchar(50) DEFAULT NULL,
  `QRCode` varchar(250) DEFAULT NULL,
  `PassKey` varchar(50) DEFAULT NULL,
  `ErrorName` varchar(100) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `iot_CodeBack_Index` (`CodeBack`),
  KEY `iot_CodeModel_Index` (`CodeModel`),
  KEY `iot_TimeInsert_Index` (`TimeInsert`) /*!80000 INVISIBLE */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ip`
--

DROP TABLE IF EXISTS `ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) DEFAULT NULL,
  `CodeModel` varchar(20) DEFAULT NULL,
  `CodeSerial` varchar(10) DEFAULT NULL,
  `Judge` varchar(10) DEFAULT NULL,
  `Volt` varchar(10) DEFAULT NULL,
  `LL` varchar(10) DEFAULT NULL,
  `UL` varchar(10) DEFAULT NULL,
  `Value` varchar(10) DEFAULT NULL,
  `CurrentmA` varchar(10) DEFAULT NULL,
  `U` varchar(10) DEFAULT NULL,
  `Progname` varchar(10) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `ip_CodeBack_Index` (`CodeBack`),
  KEY `ip_CodeModel_Index` (`CodeModel`) /*!80000 INVISIBLE */,
  KEY `ip_TimeInsert_Index` (`TimeInsert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modelcheckiot`
--

DROP TABLE IF EXISTS `modelcheckiot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelcheckiot` (
  `NameModel` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pan`
--

DROP TABLE IF EXISTS `pan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pan` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) DEFAULT NULL,
  `CodeModel` varchar(20) DEFAULT NULL,
  `CodeSerial` varchar(10) DEFAULT NULL,
  `Judge` varchar(10) DEFAULT NULL,
  `CodePCB` varchar(100) DEFAULT NULL,
  `CodeMarket` varchar(30) DEFAULT NULL,
  `CodePan` varchar(100) DEFAULT NULL,
  `No` varchar(10) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `pan_CodeBack_Index` (`CodeBack`),
  KEY `pan_CodeModel_Index` (`CodeModel`),
  KEY `pan_TimeInsert_Index` (`TimeInsert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suatu`
--

DROP TABLE IF EXISTS `suatu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suatu` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) DEFAULT NULL,
  `CodeModel` varchar(30) DEFAULT NULL,
  `CodeSerial` varchar(30) DEFAULT NULL,
  `Judge` varchar(30) DEFAULT NULL,
  `ShiftName` varchar(45) DEFAULT NULL,
  `TeamName` varchar(45) DEFAULT NULL,
  `IDSuaTu` int DEFAULT NULL,
  `ErrorCode` varchar(150) DEFAULT NULL,
  `ErrorName` varchar(150) DEFAULT NULL,
  `Phenomena` varchar(150) DEFAULT NULL,
  `Solution` varchar(150) DEFAULT NULL,
  `DescribeName` varchar(150) DEFAULT NULL,
  `ErrorEdit` varchar(150) DEFAULT NULL,
  `NameErrorEdit` varchar(150) DEFAULT NULL,
  `DeclarerCode` varchar(45) DEFAULT NULL,
  `DeclarerName` varchar(150) DEFAULT NULL,
  `PersonCode` varchar(45) DEFAULT NULL,
  `PersonName` varchar(150) DEFAULT NULL,
  `PQCComfirmCode` varchar(45) DEFAULT NULL,
  `PQCComfirmName` varchar(150) DEFAULT NULL,
  `CompleteDate` datetime DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  `ErrorGroupName` varchar(150) DEFAULT NULL,
  `ErrorCauseName` varchar(150) DEFAULT NULL,
  KEY `suatu_CodeBack_Index` (`CodeBack`),
  KEY `suatu_CodeModel_Index` (`CodeModel`),
  KEY `suatu_TimeInsert_Index` (`TimeInsert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ta_tbl_dataplan`
--

DROP TABLE IF EXISTS `ta_tbl_dataplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ta_tbl_dataplan` (
  `Model` varchar(30) DEFAULT NULL,
  `QuantityDay` int DEFAULT NULL,
  `QuantityPerSec` float DEFAULT NULL,
  `Quantity1` int DEFAULT NULL,
  `Quantity2` int DEFAULT NULL,
  `Quantity3` int DEFAULT NULL,
  `TotalTime` double DEFAULT NULL,
  `TimeStart` datetime DEFAULT NULL,
  `TimeEnd` datetime DEFAULT NULL,
  `TypePlan` varchar(10) DEFAULT NULL,
  `TimeUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `MonitorSpecial` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ta_tbl_dataplanca1`
--

DROP TABLE IF EXISTS `ta_tbl_dataplanca1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ta_tbl_dataplanca1` (
  `Model` varchar(30) DEFAULT NULL,
  `QuantityDay` int DEFAULT NULL,
  `QuantityPerSec` float DEFAULT NULL,
  `TotalTime` double DEFAULT NULL,
  `TimeStart` datetime DEFAULT NULL,
  `TimeEnd` datetime DEFAULT NULL,
  `TypePlan` varchar(10) DEFAULT NULL,
  `TimeUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `MonitorSpecial` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ta_tbl_dataplanca2`
--

DROP TABLE IF EXISTS `ta_tbl_dataplanca2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ta_tbl_dataplanca2` (
  `Model` varchar(30) DEFAULT NULL,
  `QuantityDay` int DEFAULT NULL,
  `QuantityPerSec` float DEFAULT NULL,
  `TotalTime` double DEFAULT NULL,
  `TimeStart` datetime DEFAULT NULL,
  `TimeEnd` datetime DEFAULT NULL,
  `TypePlan` varchar(10) DEFAULT NULL,
  `TimeUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `MonitorSpecial` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ta_tbl_dataplanca3`
--

DROP TABLE IF EXISTS `ta_tbl_dataplanca3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ta_tbl_dataplanca3` (
  `Model` varchar(30) DEFAULT NULL,
  `QuantityDay` int DEFAULT NULL,
  `QuantityPerSec` float DEFAULT NULL,
  `TotalTime` double DEFAULT NULL,
  `TimeStart` datetime DEFAULT NULL,
  `TimeEnd` datetime DEFAULT NULL,
  `TypePlan` varchar(10) DEFAULT NULL,
  `TimeUpdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `MonitorSpecial` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempdetail`
--

DROP TABLE IF EXISTS `tempdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempdetail` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) DEFAULT NULL,
  `CodeModel` varchar(30) DEFAULT NULL,
  `CodeSerial` varchar(30) DEFAULT NULL,
  `Judge` varchar(30) DEFAULT NULL,
  `NamePoint1` varchar(30) DEFAULT NULL,
  `StandardPoint1` varchar(20) DEFAULT NULL,
  `Actual1` varchar(20) DEFAULT NULL,
  `Result1` varchar(10) DEFAULT NULL,
  `NamePoint2` varchar(30) DEFAULT NULL,
  `StandardPoint2` varchar(20) DEFAULT NULL,
  `Actual2` varchar(20) DEFAULT NULL,
  `Result2` varchar(10) DEFAULT NULL,
  `NamePoint3` varchar(30) DEFAULT NULL,
  `StandardPoint3` varchar(20) DEFAULT NULL,
  `Actual3` varchar(20) DEFAULT NULL,
  `Result3` varchar(10) DEFAULT NULL,
  `NamePoint4` varchar(30) DEFAULT NULL,
  `StandardPoint4` varchar(20) DEFAULT NULL,
  `Actual4` varchar(20) DEFAULT NULL,
  `Result4` varchar(10) DEFAULT NULL,
  `NamePoint5` varchar(30) DEFAULT NULL,
  `StandardPoint5` varchar(20) DEFAULT NULL,
  `Actual5` varchar(20) DEFAULT NULL,
  `Result5` varchar(10) DEFAULT NULL,
  `NamePoint6` varchar(30) DEFAULT NULL,
  `StandardPoint6` varchar(20) DEFAULT NULL,
  `Actual6` varchar(20) DEFAULT NULL,
  `Result6` varchar(10) DEFAULT NULL,
  `NamePoint7` varchar(30) DEFAULT NULL,
  `StandardPoint7` varchar(20) DEFAULT NULL,
  `Actual7` varchar(20) DEFAULT NULL,
  `Result7` varchar(10) DEFAULT NULL,
  `NamePoint8` varchar(30) DEFAULT NULL,
  `StandardPoint8` varchar(20) DEFAULT NULL,
  `Actual8` varchar(20) DEFAULT NULL,
  `Result8` varchar(10) DEFAULT NULL,
  `NamePoint9` varchar(30) DEFAULT NULL,
  `StandardPoint9` varchar(20) DEFAULT NULL,
  `Actual9` varchar(20) DEFAULT NULL,
  `Result9` varchar(10) DEFAULT NULL,
  `NamePoint10` varchar(30) DEFAULT NULL,
  `StandardPoint10` varchar(20) DEFAULT NULL,
  `Actual10` varchar(20) DEFAULT NULL,
  `Result10` varchar(10) DEFAULT NULL,
  `NamePoint11` varchar(30) DEFAULT NULL,
  `StandardPoint11` varchar(20) DEFAULT NULL,
  `Actual11` varchar(20) DEFAULT NULL,
  `Result11` varchar(10) DEFAULT NULL,
  `NamePoint12` varchar(30) DEFAULT NULL,
  `StandardPoint12` varchar(20) DEFAULT NULL,
  `Actual12` varchar(20) DEFAULT NULL,
  `Result12` varchar(10) DEFAULT NULL,
  `NamePoint13` varchar(30) DEFAULT NULL,
  `StandardPoint13` varchar(20) DEFAULT NULL,
  `Actual13` varchar(20) DEFAULT NULL,
  `Result13` varchar(10) DEFAULT NULL,
  `NamePoint14` varchar(30) DEFAULT NULL,
  `StandardPoint14` varchar(20) DEFAULT NULL,
  `Actual14` varchar(20) DEFAULT NULL,
  `Result14` varchar(10) DEFAULT NULL,
  `NamePoint15` varchar(30) DEFAULT NULL,
  `StandardPoint15` varchar(20) DEFAULT NULL,
  `Actual15` varchar(20) DEFAULT NULL,
  `Result15` varchar(10) DEFAULT NULL,
  `NamePoint16` varchar(45) DEFAULT NULL,
  `StandardPoint16` varchar(45) DEFAULT NULL,
  `Actual16` varchar(45) DEFAULT NULL,
  `Result16` varchar(45) DEFAULT NULL,
  `NamePoint17` varchar(45) DEFAULT NULL,
  `StandardPoint17` varchar(45) DEFAULT NULL,
  `Actual17` varchar(45) DEFAULT NULL,
  `Result17` varchar(45) DEFAULT NULL,
  `NamePoint18` varchar(45) DEFAULT NULL,
  `StandardPoint18` varchar(45) DEFAULT NULL,
  `Actual18` varchar(45) DEFAULT NULL,
  `Result18` varchar(45) DEFAULT NULL,
  `NamePoint19` varchar(45) DEFAULT NULL,
  `StandardPoint19` varchar(45) DEFAULT NULL,
  `Actual19` varchar(45) DEFAULT NULL,
  `Result19` varchar(45) DEFAULT NULL,
  `NamePoint20` varchar(45) DEFAULT NULL,
  `StandardPoint20` varchar(45) DEFAULT NULL,
  `Actual20` varchar(45) DEFAULT NULL,
  `Result20` varchar(45) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `tempdetail_CodeBack_Index` (`CodeBack`),
  KEY `tempdetail_CodeModel_Index` (`CodeModel`),
  KEY `tempdetail_TimeInsert` (`TimeInsert`) /*!80000 INVISIBLE */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempresult`
--

DROP TABLE IF EXISTS `tempresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempresult` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(100) DEFAULT NULL,
  `CodeModel` varchar(100) DEFAULT NULL,
  `CodeSerial` varchar(100) DEFAULT NULL,
  `Judge` varchar(100) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `tempresult_CodeBack_Insert` (`CodeBack`),
  KEY `tempresult_CodeModel_Index` (`CodeModel`),
  KEY `tempresult_TimeInsert_Index` (`TimeInsert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vp`
--

DROP TABLE IF EXISTS `vp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vp` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) DEFAULT NULL,
  `CodeModel` varchar(20) DEFAULT NULL,
  `CodeSerial` varchar(10) DEFAULT NULL,
  `Judge` varchar(10) DEFAULT NULL,
  `VaccumAct` varchar(20) DEFAULT NULL,
  `VaccumSpec` varchar(20) DEFAULT NULL,
  `PumpNo` varchar(20) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `vp_CodeBack_Index` (`CodeBack`) /*!80000 INVISIBLE */,
  KEY `vp_CodeModel_Index` (`CodeModel`),
  KEY `vp_TimeInsert_Index` (`TimeInsert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wi1start`
--

DROP TABLE IF EXISTS `wi1start`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wi1start` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) DEFAULT NULL,
  `CodeModel` varchar(20) DEFAULT NULL,
  `CodeSerial` varchar(10) DEFAULT NULL,
  `Judge` varchar(10) DEFAULT NULL,
  `Volt` varchar(10) DEFAULT NULL,
  `LL` varchar(10) DEFAULT NULL,
  `UL` varchar(10) DEFAULT NULL,
  `ValueActual` varchar(10) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `wi1start_CodeBack_Index` (`CodeBack`),
  KEY `wi1start_CodeModel_Index` (`CodeModel`) /*!80000 INVISIBLE */,
  KEY `wi1start_TimeInsert_Index` (`TimeInsert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wi1with`
--

DROP TABLE IF EXISTS `wi1with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wi1with` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) DEFAULT NULL,
  `CodeModel` varchar(20) DEFAULT NULL,
  `CodeSerial` varchar(10) DEFAULT NULL,
  `Judge` varchar(10) DEFAULT NULL,
  `Volt` varchar(10) DEFAULT NULL,
  `LL` varchar(10) DEFAULT NULL,
  `UL` varchar(10) DEFAULT NULL,
  `ValueActual` varchar(10) DEFAULT NULL,
  `LLOM` varchar(10) DEFAULT NULL,
  `ValueOM` varchar(10) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `wi1with_CodeBack_Index` (`CodeBack`),
  KEY `wi1with_CodeModel_Index` (`CodeModel`),
  KEY `wi1with_TimeInsert_Index` (`TimeInsert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wi2`
--

DROP TABLE IF EXISTS `wi2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wi2` (
  `TimePLC` datetime DEFAULT NULL,
  `CodeBack` varchar(30) DEFAULT NULL,
  `CodeModel` varchar(20) DEFAULT NULL,
  `CodeSerial` varchar(10) DEFAULT NULL,
  `Judge` varchar(10) DEFAULT NULL,
  `Volt` varchar(10) DEFAULT NULL,
  `LL` varchar(10) DEFAULT NULL,
  `UL` varchar(10) DEFAULT NULL,
  `ValueActual` varchar(10) DEFAULT NULL,
  `LLom` varchar(10) DEFAULT NULL,
  `Valueom` varchar(10) DEFAULT NULL,
  `Progname` varchar(10) DEFAULT NULL,
  `TimeInsert` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `wi2_CodeBack_Index` (`CodeBack`),
  KEY `wi2_CodeModel_Index` (`CodeModel`),
  KEY `wi2_TimeInsert_Index` (`TimeInsert`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'dataplc'
--

--
-- Dumping routines for database 'dataplc'
--
/*!50003 DROP PROCEDURE IF EXISTS `ClearAllPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `ClearAllPlan`()
BEGIN
	
    
    DECLARE _hournow int;
    Set _hournow = hour(now());
    IF(_hournow > 5) then
	DELETE FROM `dataplc`.`dataplan`
        where  DATE(dataplan.TimeUpdate) = DATE(NOW());
    ELSE
	DELETE FROM `dataplc`.`dataplan`
        where  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetConfigCheckFinal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetConfigCheckFinal`()
BEGIN
   SELECT  * FROM dataplc.configcheckfinal limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetConfigConnectPlc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetConfigConnectPlc`()
BEGIN
    SELECT 
        IpAddress,
        PortNumber,
        NameDeviceTrigerReadCabi,
        NameDeviceDataCabi,
        QuantityDataCabi,
        NameDeviceDataPerson,
        QuantityDataPerson,
        NameDeviceDataReason,
        QuantityDataReason,
        NameDeviceSendResult,
        QuantityDeviceSendResult,
        AliveBit,
        NameDeviceSendConfirm,
        NameDeviceTrigerReadError
    FROM DataPLC.ConfigConnectionPlc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDataDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDataDetail`(IN p_NameCabi NVARCHAR(30))
BEGIN
    SELECT 
        CodeBack,
        Judge,
        VaccumAct,
        VaccumSpec,
        PumpNo,
        TimePLC AS TimeCheck
    FROM DataPLC.VP
    WHERE CodeBack = p_NameCabi
    ORDER BY TimePLC DESC
    LIMIT 20;
    -- Query for GAS table
    SELECT 
        CodeBack,
        Judge,
        CodeCompressor,
        Temp,
        OIL,
        OILSpec,
        GAS,
        GASSpec,
        Mode,
        PUMP,
        VaccumCou,
        VaccumRF,
        PressureGasPipe,
        TimePLC AS TimeCheck
    FROM DataPLC.GAS
    WHERE CodeBack = p_NameCabi
    ORDER BY TimePLC DESC
    LIMIT 20;
	SELECT 
		CodeBack
      ,Judge
      ,Volt
      ,LL
      ,UL
      ,ValueActual
      ,LLOM
      ,ValueOM
       ,TimePLC as TimeCheck
  FROM DataPLC.WI1WITH 
  where CodeBack = p_NameCabi order by TimePLC desc  LIMIT 20;
  
  SELECT 
      CodeBack
      ,Judge
      ,Volt
      ,LL
      ,UL
      ,ValueActual
       ,TimePLC as TimeCheck
  FROM DataPLC.WI1START 
  where CodeBack = p_NameCabi order by TimePLC desc LIMIT 20;
  
   SELECT 
      CodeBack
      ,Judge
      ,Volt
      ,LL
      ,UL
      ,Value
      ,CurrentmA
      ,U
      ,Progname
      ,TimePLC as TimeCheck
  FROM DataPLC.IP 
   where CodeBack = p_NameCabi order by TimePLC desc LIMIT 20;
   
    SELECT 
      CodeBack
      ,Judge
      ,Volt
      ,LL
      ,UL
      ,Value
      ,CurrentmA
      ,U
      ,Progname
      ,TimePLC as TimeCheck
  FROM DataPLC.DF
  where CodeBack = p_NameCabi order by TimePLC desc LIMIT 20;
    SELECT 
CodeBack,
CodeModel,
CodeSerial,
Judge,
NamePoint1,
StandardPoint1,
Actual1,
Result1,
NamePoint2,
StandardPoint2,
Actual2,
Result2,
NamePoint3,
StandardPoint3,
Actual3,
Result3,
NamePoint4,
StandardPoint4,
Actual4,
Result4,
NamePoint5,
StandardPoint5,
Actual5,
Result5,
NamePoint6,
StandardPoint6,
Actual6,
Result6,
NamePoint7,
StandardPoint7,
Actual7,
Result7,
NamePoint8,
StandardPoint8,
Actual8,
Result8,
NamePoint9,
StandardPoint9,
Actual9,
Result9,
NamePoint10,
StandardPoint10,
Actual10,
Result10,
NamePoint11,
StandardPoint11,
Actual11,
Result11,
NamePoint12,
StandardPoint12,
Actual12,
Result12,
NamePoint13,
StandardPoint13,
Actual13,
Result13,
NamePoint14,
StandardPoint14,
Actual14,
Result14,
NamePoint15,
StandardPoint15,
Actual15,
Result15,
NamePoint16,
StandardPoint16,
Actual16,
Result16,
NamePoint17,
StandardPoint17,
Actual17,
Result17,
NamePoint18,
StandardPoint18,
Actual18,
Result18,
NamePoint19,
StandardPoint19,
Actual19,
Result19,
NamePoint20,
StandardPoint20,
Actual20,
Result20,
TimePLC as TimeCheck
  FROM DataPLC.TempDetail
  where substring(CodeBack,1,19)  = p_NameCabi  order by TimePLC desc LIMIT 20;
  SELECT 
	CodeBack,
	CodeModel,
	CodeSerial,
	Judge,
	CodeMarket,
	Information,
	QRCode,
	PassKey,
	ErrorName,
	TimePLC as TimeCheck
  FROM DataPLC.IOT
 where CodeBack = p_NameCabi order by TimePLC desc LIMIT 20;
 
 SELECT 
      CodeBack
      ,Judge
      ,Volt
      ,LL
      ,UL
      ,ValueActual
      ,LLom
      ,Valueom
      ,Progname
       ,TimePLC as TimeCheck
  FROM DataPLC.WI2
  where CodeBack = p_NameCabi order by TimePLC desc LIMIT 20;
SELECT 
      CodeBack
      ,Judge
      ,CodePCB
      ,CodeMarket
      ,CodePan
      ,No
     ,TimePLC as TimeCheck
  FROM DataPLC.PAN 
  where CodeBack = p_NameCabi order by TimePLC desc LIMIT 20;
  SELECT 
      CodeBack
      ,Judge
      ,VitSidePhai
      ,VitSideTrai
      ,Hookpan
      ,PWE
      ,VitPWE
      ,InPadComp
      ,ClampPipe
      ,VitClampPipe
      ,BoxPCB
      ,VitBoxPCB
      ,ChotComp
      ,BanhXePhai
      ,BanhXeTrai
      ,CapPipe
      ,RubberPipe
      ,InsPadComp
      ,DayNoiDat
      ,VitDayNoiDatSidePhai
      ,WiringDiagram
      ,CoverComp
      ,VitCoverComp
      ,Hanger
      ,TimePLC as TimeCheck
  FROM DataPLC.CamBack 
 where CodeBack = p_NameCabi order by TimePLC desc LIMIT 20;

 SELECT 
      CodeBack
      ,Judge
      ,Econavi
      ,LogoPana
      ,Japanquality
      ,Warranty
      ,POPFC
      ,POPPC
      ,EnergyLabel
      ,PanelDoorFC
      ,PanelDoorPC
      ,WDLabel
      ,WD
      ,DoorControl
      ,_1ST
      ,Handle
      ,POPPCBottom
      ,Wellness
      ,ADVISORYLabel
      ,EnvironmentLabel
      ,POPBC
      ,CoverHingeTop
      ,FoamProtectorDoor
      ,TimePLC as TimeCheck
  FROM DataPLC.CamFront  
  where CodeBack = p_NameCabi order by TimePLC desc LIMIT 20;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetJudgeAllLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetJudgeAllLine`(IN p_CodeModel NVARCHAR(30))
BEGIN
    DECLARE rsVP NVARCHAR(2);
    DECLARE rsGAS NVARCHAR(2);
    DECLARE rsWI1WITH NVARCHAR(2);
    DECLARE rsWI1START NVARCHAR(2);
    
    DECLARE rsIP NVARCHAR(2);
    DECLARE rsDF NVARCHAR(2);
    DECLARE rsPAN NVARCHAR(2);
    DECLARE rsWI2 NVARCHAR(2);
    DECLARE rsIOT NVARCHAR(2);
    DECLARE rsTemp NVARCHAR(2);
    DECLARE rsCAMBack NVARCHAR(2);
    DECLARE rsCAMFront NVARCHAR(2);
    
    DECLARE rsTotal NVARCHAR(2);
    
	DECLARE _VP tinyint;
    DECLARE _GAS tinyint;
    DECLARE _WI1WITH tinyint;
   DECLARE _WI1START tinyint;
   DECLARE _IP tinyint;
   DECLARE _DF tinyint;
  DECLARE  _TEMP tinyint;
   DECLARE _IOT tinyint;
  DECLARE  _WI2 tinyint;
  DECLARE  _PAN tinyint;
  DECLARE  _CAMBACK tinyint;
  DECLARE  _CAMFRONT tinyint;
  
  SELECT VP,GAS,WI1WITH,WI1START,IP,DF,TEMP,IOT,WI2,PAN,CAMBACK,CAMFRONT INTO _VP,_GAS,_WI1WITH,_WI1START,_IP,_DF,_TEMP,_IOT,_WI2,_PAN,_CAMBACK,_CAMFRONT FROM configcheckfinal  LIMIT 1;
	IF(_VP = 1) THEN
         SELECT Judge INTO rsVP FROM VP WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsVP = 'NA';
    END IF;
    
    IF(_GAS = 1) THEN
         SELECT Judge INTO rsGAS FROM gas WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsGAS = 'NA';
    END IF;
     IF(_WI1WITH = 1) THEN
         SELECT Judge INTO rsWI1WITH FROM wi1with WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsWI1WITH = 'NA';
    END IF;
     IF(_WI1START = 1) THEN
          SELECT Judge INTO rsWI1START FROM wi1start WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsWI1START = 'NA';
    END IF;
    
    IF(_IP = 1) THEN
          SELECT Judge INTO rsIP FROM  ip WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsIP = 'NA';
    END IF;
    IF(_DF = 1) THEN
          SELECT Judge INTO rsDF FROM  df WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsDF = 'NA';
    END IF;
     IF(_TEMP = 1) THEN
          SELECT Judge INTO rsTemp FROM  tempresult WHERE substring(CodeBack,1,19)  = p_CodeModel  ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsTemp = 'NA';
    END IF;
     IF(_IOT = 1) THEN
          IF(exists(select NameModel from modelcheckiot where NameModel = substring(p_CodeModel,1,12))) THEN
        SELECT Judge INTO rsIOT FROM  iot WHERE CodeBack = p_CodeModel and (Judge = 'OK' or Judge = 'NG')  ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsIOT = 'NA';
    END IF;
    ELSE
        SET rsIOT = 'NA';
    END IF;

      IF(_WI2 = 1) THEN
          SELECT Judge INTO rsWI2 FROM wi2  WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsWI2 = 'NA';
    END IF;
   
	 IF(_PAN = 1) THEN
          SELECT Judge INTO rsPAN FROM  pan WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsPAN = 'NA';
    END IF;
    IF(_CAMBACK = 1) THEN
           SELECT Judge INTO rsCAMBack FROM  camback WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsCAMBack = 'NA';
    END IF;
     IF(_CAMFRONT = 1) THEN
            SELECT Judge INTO rsCAMFront FROM camfront  WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsCAMFront = 'NA';
    END IF;
IF((UPPER(rsVP) = 'OK' or rsVP = 'NA') AND 
	(UPPER(rsGAS) = 'OK' or rsGAS = 'NA') AND 
    (UPPER(rsWI1START) = 'OK' or rsWI1START ='NA') AND 
    (UPPER(rsIP) = 'OK'or rsIP = 'NA') AND 
    (UPPER(rsDF) = 'OK' or rsDF = 'NA')AND 
    (UPPER(rsWI1WITH) = 'OK'or rsWI1WITH = 'NA') AND 
    (UPPER(rsPAN) = 'OK' or rsPAN = 'NA')AND 
    (UPPER(rsWI2) = 'OK' or rsWI2 = 'NA')AND 
    (UPPER(rsIOT) = 'OK' or rsIOT = 'NA') AND 
    (UPPER(rsTemp) = 'OK'or rsTemp = 'NA') AND 
    (UPPER(rsCAMBack) = 'OK'or rsCAMBack = 'NA') AND 
    (UPPER(rsCAMFront) = 'OK' or rsCAMFront = 'NA')) THEN
        SET rsTotal = 'OK';
    ELSE
        SET rsTotal = 'NG';
    END IF;
    SELECT rsVP AS JudgeVP, rsGAS AS JudgeGAS, rsWI1START AS JudgeWI1START, rsWI1WITH AS JudgeWI1WITH, rsIP AS JudgeIP,
        rsDF AS JudgeDF, rsTemp AS JudgeTEMP, rsIOT AS JudgeIOT, rsPAN AS JudgePAN, rsWI2 AS JudgeWI2, 
        rsCAMBack AS JudgeCAMBACK, rsCAMFront AS JudgeCAMFRONT,
        rsTotal AS JudgeTotal;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetJudgeAllLineDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetJudgeAllLineDetail`(IN p_CodeModel NVARCHAR(30))
BEGIN
    DECLARE rsVP NVARCHAR(2);
    DECLARE rsGAS NVARCHAR(2);
    DECLARE rsWI1WITH NVARCHAR(2);
    DECLARE rsWI1START NVARCHAR(2);
    
    DECLARE rsIP NVARCHAR(2);
    DECLARE rsDF NVARCHAR(2);
    DECLARE rsPAN NVARCHAR(2);
    DECLARE rsWI2 NVARCHAR(2);
    DECLARE rsIOT NVARCHAR(2);
    DECLARE rsTemp NVARCHAR(2);
    DECLARE rsCAMBack NVARCHAR(2);
    DECLARE rsCAMFront NVARCHAR(2);
    
    DECLARE rsTotal NVARCHAR(2);
     DECLARE Reason nvarchar(100);
	DECLARE UserConfirm nvarchar(50);
   

   DECLARE _VP tinyint;
    DECLARE _GAS tinyint;
    DECLARE _WI1WITH tinyint;
   DECLARE _WI1START tinyint;
   DECLARE _IP tinyint;
   DECLARE _DF tinyint;
  DECLARE  _TEMP tinyint;
   DECLARE _IOT tinyint;
  DECLARE  _WI2 tinyint;
  DECLARE  _PAN tinyint;
  DECLARE  _CAMBACK tinyint;
  DECLARE  _CAMFRONT tinyint;
  
        SELECT ReasonError,PersonConfirm  INTO Reason, UserConfirm FROM DataCheckFinal where CodeBack = p_CodeModel  ORDER BY  TimeUpdate DESC LIMIT 1;

  
  SELECT VP,GAS,WI1WITH,WI1START,IP,DF,TEMP,IOT,WI2,PAN,CAMBACK,CAMFRONT INTO _VP,_GAS,_WI1WITH,_WI1START,_IP,_DF,_TEMP,_IOT,_WI2,_PAN,_CAMBACK,_CAMFRONT FROM configcheckfinal  LIMIT 1;
	IF(_VP = 1) THEN
         SELECT Judge INTO rsVP FROM VP WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsVP = 'NA';
    END IF;
    
    IF(_GAS = 1) THEN
         SELECT Judge INTO rsGAS FROM gas WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsGAS = 'NA';
    END IF;
     IF(_WI1WITH = 1) THEN
         SELECT Judge INTO rsWI1WITH FROM wi1with WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsWI1WITH = 'NA';
    END IF;
     IF(_WI1START = 1) THEN
          SELECT Judge INTO rsWI1START FROM wi1start WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsWI1START = 'NA';
    END IF;
    
    IF(_IP = 1) THEN
          SELECT Judge INTO rsIP FROM  ip WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsIP = 'NA';
    END IF;
    IF(_DF = 1) THEN
          SELECT Judge INTO rsDF FROM  df WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsDF = 'NA';
    END IF;
     IF(_TEMP = 1) THEN
          SELECT Judge INTO rsTemp FROM  tempresult WHERE substring(CodeBack,1,19)  = p_CodeModel  ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsTemp = 'NA';
    END IF;
     IF(_IOT = 1) THEN
          IF(exists(select NameModel from modelcheckiot where NameModel = substring(p_CodeModel,1,12))) THEN
        SELECT Judge INTO rsIOT FROM  iot WHERE CodeBack = p_CodeModel and (Judge = 'OK' or Judge = 'NG') ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsIOT = 'NA';
    END IF;
    ELSE
        SET rsIOT = 'NA';
    END IF;

      IF(_WI2 = 1) THEN
          SELECT Judge INTO rsWI2 FROM wi2  WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsWI2 = 'NA';
    END IF;
   
	 IF(_PAN = 1) THEN
          SELECT Judge INTO rsPAN FROM  pan WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsPAN = 'NA';
    END IF;
    IF(_CAMBACK = 1) THEN
           SELECT Judge INTO rsCAMBack FROM  camback WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsCAMBack = 'NA';
    END IF;
     IF(_CAMFRONT = 1) THEN
            SELECT Judge INTO rsCAMFront FROM camfront  WHERE CodeBack = p_CodeModel ORDER BY TimePLC DESC LIMIT 1;
    ELSE
        SET rsCAMFront = 'NA';
    END IF;
     
     
     
      
	
   
   
   
  
  
   
   
   
   
   
IF((UPPER(rsVP) = 'OK' or rsVP = 'NA') AND 
	(UPPER(rsGAS) = 'OK' or rsGAS = 'NA') AND 
    (UPPER(rsWI1START) = 'OK' or rsWI1START ='NA') AND 
    (UPPER(rsIP) = 'OK'or rsIP = 'NA') AND 
    (UPPER(rsDF) = 'OK' or rsDF = 'NA')AND 
    (UPPER(rsWI1WITH) = 'OK'or rsWI1WITH = 'NA') AND 
    (UPPER(rsPAN) = 'OK' or rsPAN = 'NA')AND 
    (UPPER(rsWI2) = 'OK' or rsWI2 = 'NA')AND 
    (UPPER(rsIOT) = 'OK' or rsIOT = 'NA') AND 
    (UPPER(rsTemp) = 'OK'or rsTemp = 'NA') AND 
    (UPPER(rsCAMBack) = 'OK'or rsCAMBack = 'NA') AND 
    (UPPER(rsCAMFront) = 'OK' or rsCAMFront = 'NA')) THEN
        SET rsTotal = 'OK';
    ELSE
        SET rsTotal = 'NG';
    END IF;
    SELECT rsVP AS JudgeVP, rsGAS AS JudgeGAS, rsWI1START AS JudgeWI1START, rsWI1WITH AS JudgeWI1WITH, rsIP AS JudgeIP,
        rsDF AS JudgeDF, rsTemp AS JudgeTEMP, rsIOT AS JudgeIOT, rsPAN AS JudgePAN, rsWI2 AS JudgeWI2, 
        rsCAMBack AS JudgeCAMBACK, rsCAMFront AS JudgeCAMFRONT,
        rsTotal AS JudgeTotal , Reason as ReasonError,UserConfirm as UserConfirm;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStartTimeAndEndTimePlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `GetStartTimeAndEndTimePlan`()
BEGIN
 DECLARE _hournow int;
    Set _hournow = hour(now());
    IF(_hournow > 5) then
	select * from dataplan 
        where Model = 'Total' AND DATE(dataplan.TimeUpdate) = DATE(NOW());
    ELSE
	select * from dataplan 
        where Model = 'Total' AND Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertDataFinalCheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`%` PROCEDURE `InsertDataFinalCheck`(
    IN p_CodeBack NVARCHAR(30),
    IN p_Judge_VP VARCHAR(8),
    IN p_Judge_GAS VARCHAR(8),
    IN p_Judge_WI1WITH VARCHAR(8),
    IN p_Judge_WI1START VARCHAR(8),
    IN p_Judge_IP VARCHAR(8),
    IN p_Judge_DF VARCHAR(8),
    IN p_Judge_TEMP VARCHAR(8),
    IN p_Judge_IOT VARCHAR(8),
    IN p_Judge_WI2 VARCHAR(8),
    IN p_Judge_PAN VARCHAR(8),
    IN p_Judge_CAMBACK VARCHAR(8),
    IN p_Judge_CAMFRONT VARCHAR(8),
    IN p_Judge_Total VARCHAR(8),
    IN p_ReasonError NVARCHAR(100),
    IN p_PersonConfirm NVARCHAR(50)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM DataCheckFinal WHERE CodeBack = p_CodeBack) THEN
        INSERT INTO DataCheckFinal (
            CodeBack,
            Judge_VP,
            Judge_GAS,
            Judge_WI1WITH,
            Judge_WI1START,
            Judge_IP,
            Judge_DF,
            Judge_TEMP,
            Judge_IOT,
            Judge_WI2,
            Judge_PAN,
            Judge_CAMBACK,
            Judge_CAMFRONT,
            Judge_Total,
            ReasonError,
            PersonConfirm
        ) VALUES (
            p_CodeBack,
            p_Judge_VP,
            p_Judge_GAS,
            p_Judge_WI1WITH,
            p_Judge_WI1START,
            p_Judge_IP,
            p_Judge_DF,
            p_Judge_TEMP,
            p_Judge_IOT,
            p_Judge_WI2,
            p_Judge_PAN,
            p_Judge_CAMBACK,
            p_Judge_CAMFRONT,
            p_Judge_Total,
            p_ReasonError,
            p_PersonConfirm
        );
    ELSE
        UPDATE DataCheckFinal SET TimeUpdate = NOW() WHERE CodeBack = p_CodeBack;
    END IF;

    INSERT INTO DataCheckFinalDetail (
        CodeBack,
        Judge_VP,
        Judge_GAS,
        Judge_WI1WITH,
        Judge_WI1START,
        Judge_IP,
        Judge_DF,
        Judge_TEMP,
        Judge_IOT,
        Judge_WI2,
        Judge_PAN,
        Judge_CAMBACK,
        Judge_CAMFRONT,
        Judge_Total,
        ReasonError,
        PersonConfirm
    ) VALUES (
        p_CodeBack,
        p_Judge_VP,
        p_Judge_GAS,
        p_Judge_WI1WITH,
        p_Judge_WI1START,
        p_Judge_IP,
        p_Judge_DF,
        p_Judge_TEMP,
        p_Judge_IOT,
        p_Judge_WI2,
        p_Judge_PAN,
        p_Judge_CAMBACK,
        p_Judge_CAMFRONT,
        p_Judge_Total,
        p_ReasonError,
        p_PersonConfirm
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataForBarChartPlanGas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `LoadDataForBarChartPlanGas`()
BEGIN
	DECLARE _hournow int;
    Set _hournow = hour(now());
    IF(_hournow > 5) then
SELECT dataplan.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplan.QuantityDay,dataplan.Quantity1,dataplan.Quantity2,dataplan.Quantity3,dataplan.QuantityPerSec,dataplan.TimeStart,dataplan.TimeEnd,dataplan.TotalTime
FROM dataplan
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplan
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND DATE(TimePLC) = CURDATE() AND HOUR(TimePLC) > 5
    ) AS b ON dataplan.Model = b.CodeModel
    WHERE dataplan.Model <> 'ToTal' AND DATE(dataplan.TimeUpdate) = DATE(NOW())
    GROUP BY dataplan.Model
) AS c ON dataplan.Model = c.Model where dataplan.Model <> 'ToTal' AND DATE(dataplan.TimeUpdate) = DATE(NOW());
    else 
    SELECT dataplan.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplan.QuantityDay,dataplan.Quantity1,dataplan.Quantity2,dataplan.Quantity3,dataplan.QuantityPerSec,dataplan.TimeStart,dataplan.TimeEnd,dataplan.TotalTime
FROM dataplan
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplan
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND ((Date(TimePLC) = curdate() and hour(TimePLC)>= 0 AND hour(TimePLC) < 6) or (DATE_SUB(CURDATE(), INTERVAL 1 DAY) = Date(TimePLC) AND hour(TimePLC)>5))
    ) AS b ON dataplan.Model = b.CodeModel
    WHERE dataplan.Model <> 'ToTal' AND Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
    GROUP BY dataplan.Model
) AS c ON dataplan.Model = c.Model where dataplan.Model <> 'ToTal' AND Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
   
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataForBarChartPlanGasMonitor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `LoadDataForBarChartPlanGasMonitor`()
BEGIN
	DECLARE _hournow int;
    Set _hournow = hour(now());
    IF(_hournow > 5) then
SELECT dataplan.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplan.QuantityDay,dataplan.Quantity1,dataplan.Quantity2,dataplan.Quantity3,dataplan.QuantityPerSec,dataplan.TimeStart,dataplan.TimeEnd,dataplan.TotalTime
FROM dataplan
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplan
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND DATE(TimePLC) = CURDATE() AND HOUR(TimePLC) > 5
    ) AS b ON dataplan.Model = b.CodeModel
    WHERE dataplan.Model <> 'ToTal' AND DATE(dataplan.TimeUpdate) = DATE(NOW())
    GROUP BY dataplan.Model
) AS c ON dataplan.Model = c.Model where dataplan.Model <> 'ToTal' And MonitorSpecial =1 AND DATE(dataplan.TimeUpdate) = DATE(NOW());
    else 
    SELECT dataplan.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplan.QuantityDay,dataplan.Quantity1,dataplan.Quantity2,dataplan.Quantity3,dataplan.QuantityPerSec,dataplan.TimeStart,dataplan.TimeEnd,dataplan.TotalTime
FROM dataplan
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplan
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND ((Date(TimePLC) = curdate() and hour(TimePLC)>= 0 AND hour(TimePLC) < 6) or (DATE_SUB(CURDATE(), INTERVAL 1 DAY) = Date(TimePLC) AND hour(TimePLC)>5))
    ) AS b ON dataplan.Model = b.CodeModel
    WHERE dataplan.Model <> 'ToTal'   AND Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
    GROUP BY dataplan.Model
) AS c ON dataplan.Model = c.Model where dataplan.Model <> 'ToTal' And MonitorSpecial =1 AND Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
   
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataForChart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`%` PROCEDURE `LoadDataForChart`(IN p_selectionItem VARCHAR(3))
BEGIN
	DECLARE _hournow int;
    Set _hournow = hour(now());
	IF(p_selectionItem = '1') THEN
		if(_hournow>5 and _hournow < 14) then
		SELECT
        SUM(CASE WHEN Judge_VP = 'OK' THEN 1 ELSE 0 END) as VPOK,
        SUM(CASE WHEN Judge_GAS = 'OK' THEN 1 ELSE 0 END) as GASOILOK,
        SUM(CASE WHEN Judge_WI1WITH = 'OK' THEN 1 ELSE 0 END) as WI1WITHOK,
        SUM(CASE WHEN Judge_WI1START = 'OK' THEN 1 ELSE 0 END) as WI1STARTOK,
        SUM(CASE WHEN Judge_IP = 'OK' THEN 1 ELSE 0 END) as IPOK,
        SUM(CASE WHEN Judge_DF = 'OK' THEN 1 ELSE 0 END) as DFOK,
        SUM(CASE WHEN Judge_TEMP = 'OK' THEN 1 ELSE 0 END) as TEMPOK,
        SUM(CASE WHEN Judge_IOT = 'OK' THEN 1 ELSE 0 END) as IOTOK,
        SUM(CASE WHEN Judge_WI2 = 'OK' THEN 1 ELSE 0 END) as WI2OK,
        SUM(CASE WHEN Judge_PAN = 'OK' THEN 1 ELSE 0 END) as PANOK,
        SUM(CASE WHEN Judge_CAMBACK = 'OK' THEN 1 ELSE 0 END) as CAMBACKOK,
        SUM(CASE WHEN Judge_CAMFRONT = 'OK' THEN 1 ELSE 0 END) as CAMFRONTOK,

        SUM(CASE WHEN Judge_VP = 'NG' THEN 1 ELSE 0 END) as VPNG,
        SUM(CASE WHEN Judge_GAS = 'NG' THEN 1 ELSE 0 END) as GASOILNG,
        SUM(CASE WHEN Judge_WI1WITH = 'NG' THEN 1 ELSE 0 END) as WI1WITHNG,
        SUM(CASE WHEN Judge_WI1START = 'NG' THEN 1 ELSE 0 END) as WI1STARTNG,
        SUM(CASE WHEN Judge_IP = 'NG' THEN 1 ELSE 0 END) as IPNG,
        SUM(CASE WHEN Judge_DF = 'NG' THEN 1 ELSE 0 END) as DFNG,
        SUM(CASE WHEN Judge_TEMP = 'NG' THEN 1 ELSE 0 END) as TEMPNG,
        SUM(CASE WHEN Judge_IOT = 'NG' THEN 1 ELSE 0 END) as IOTNG,
        SUM(CASE WHEN Judge_WI2 = 'NG' THEN 1 ELSE 0 END) as WI2NG,
        SUM(CASE WHEN Judge_PAN = 'NG' THEN 1 ELSE 0 END) as PANNG,
        SUM(CASE WHEN Judge_CAMBACK = 'NG' THEN 1 ELSE 0 END) as CAMBACKNG,
        SUM(CASE WHEN Judge_CAMFRONT = 'NG' THEN 1 ELSE 0 END) as CAMFRONTNG,

        SUM(CASE WHEN Judge_VP = 'PD' THEN 1 ELSE 0 END) as VPPENDING,
        SUM(CASE WHEN Judge_GAS = 'PD' THEN 1 ELSE 0 END) as GASOILPENDING,
        SUM(CASE WHEN Judge_WI1WITH = 'PD' THEN 1 ELSE 0 END) as WI1WITHPENDING,
        SUM(CASE WHEN Judge_WI1START = 'PD' THEN 1 ELSE 0 END) as WI1STARTPENDING,
        SUM(CASE WHEN Judge_IP = 'PD' THEN 1 ELSE 0 END) as IPPENDING,
        SUM(CASE WHEN Judge_DF = 'PD' THEN 1 ELSE 0 END) as DFPENDING,
        SUM(CASE WHEN Judge_TEMP = 'PD' THEN 1 ELSE 0 END) as TEMPPENDING,
        SUM(CASE WHEN Judge_IOT = 'PD' THEN 1 ELSE 0 END) as IOTPENDING,
        SUM(CASE WHEN Judge_WI2 = 'PD' THEN 1 ELSE 0 END) as WI2PENDING,
        SUM(CASE WHEN Judge_PAN = 'PD' THEN 1 ELSE 0 END) as PANPENDING,
        SUM(CASE WHEN Judge_CAMBACK = 'PD' THEN 1 ELSE 0 END) as CAMBACKPENDING,
        SUM(CASE WHEN Judge_CAMFRONT = 'PD' THEN 1 ELSE 0 END) as CAMFRONTPENDING,

        SUM(CASE WHEN Judge_Total = 'OK' THEN 1 ELSE 0 END) as TotalOK,
        SUM(CASE WHEN Judge_Total = 'NG' THEN 1 ELSE 0 END) as TotalNG

		FROM DataCheckFinal where Date(TimeUpdate) = curdate() and hour(TimeUpdate)>5 and hour(TimeUpdate)<14;
		elseif(_hournow> 13 and _hournow < 22) then
		
		SELECT
        SUM(CASE WHEN Judge_VP = 'OK' THEN 1 ELSE 0 END) as VPOK,
        SUM(CASE WHEN Judge_GAS = 'OK' THEN 1 ELSE 0 END) as GASOILOK,
        SUM(CASE WHEN Judge_WI1WITH = 'OK' THEN 1 ELSE 0 END) as WI1WITHOK,
        SUM(CASE WHEN Judge_WI1START = 'OK' THEN 1 ELSE 0 END) as WI1STARTOK,
        SUM(CASE WHEN Judge_IP = 'OK' THEN 1 ELSE 0 END) as IPOK,
        SUM(CASE WHEN Judge_DF = 'OK' THEN 1 ELSE 0 END) as DFOK,
        SUM(CASE WHEN Judge_TEMP = 'OK' THEN 1 ELSE 0 END) as TEMPOK,
        SUM(CASE WHEN Judge_IOT = 'OK' THEN 1 ELSE 0 END) as IOTOK,
        SUM(CASE WHEN Judge_WI2 = 'OK' THEN 1 ELSE 0 END) as WI2OK,
        SUM(CASE WHEN Judge_PAN = 'OK' THEN 1 ELSE 0 END) as PANOK,
        SUM(CASE WHEN Judge_CAMBACK = 'OK' THEN 1 ELSE 0 END) as CAMBACKOK,
        SUM(CASE WHEN Judge_CAMFRONT = 'OK' THEN 1 ELSE 0 END) as CAMFRONTOK,

        SUM(CASE WHEN Judge_VP = 'NG' THEN 1 ELSE 0 END) as VPNG,
        SUM(CASE WHEN Judge_GAS = 'NG' THEN 1 ELSE 0 END) as GASOILNG,
        SUM(CASE WHEN Judge_WI1WITH = 'NG' THEN 1 ELSE 0 END) as WI1WITHNG,
        SUM(CASE WHEN Judge_WI1START = 'NG' THEN 1 ELSE 0 END) as WI1STARTNG,
        SUM(CASE WHEN Judge_IP = 'NG' THEN 1 ELSE 0 END) as IPNG,
        SUM(CASE WHEN Judge_DF = 'NG' THEN 1 ELSE 0 END) as DFNG,
        SUM(CASE WHEN Judge_TEMP = 'NG' THEN 1 ELSE 0 END) as TEMPNG,
        SUM(CASE WHEN Judge_IOT = 'NG' THEN 1 ELSE 0 END) as IOTNG,
        SUM(CASE WHEN Judge_WI2 = 'NG' THEN 1 ELSE 0 END) as WI2NG,
        SUM(CASE WHEN Judge_PAN = 'NG' THEN 1 ELSE 0 END) as PANNG,
        SUM(CASE WHEN Judge_CAMBACK = 'NG' THEN 1 ELSE 0 END) as CAMBACKNG,
        SUM(CASE WHEN Judge_CAMFRONT = 'NG' THEN 1 ELSE 0 END) as CAMFRONTNG,

        SUM(CASE WHEN Judge_VP = 'PD' THEN 1 ELSE 0 END) as VPPENDING,
        SUM(CASE WHEN Judge_GAS = 'PD' THEN 1 ELSE 0 END) as GASOILPENDING,
        SUM(CASE WHEN Judge_WI1WITH = 'PD' THEN 1 ELSE 0 END) as WI1WITHPENDING,
        SUM(CASE WHEN Judge_WI1START = 'PD' THEN 1 ELSE 0 END) as WI1STARTPENDING,
        SUM(CASE WHEN Judge_IP = 'PD' THEN 1 ELSE 0 END) as IPPENDING,
        SUM(CASE WHEN Judge_DF = 'PD' THEN 1 ELSE 0 END) as DFPENDING,
        SUM(CASE WHEN Judge_TEMP = 'PD' THEN 1 ELSE 0 END) as TEMPPENDING,
        SUM(CASE WHEN Judge_IOT = 'PD' THEN 1 ELSE 0 END) as IOTPENDING,
        SUM(CASE WHEN Judge_WI2 = 'PD' THEN 1 ELSE 0 END) as WI2PENDING,
        SUM(CASE WHEN Judge_PAN = 'PD' THEN 1 ELSE 0 END) as PANPENDING,
        SUM(CASE WHEN Judge_CAMBACK = 'PD' THEN 1 ELSE 0 END) as CAMBACKPENDING,
        SUM(CASE WHEN Judge_CAMFRONT = 'PD' THEN 1 ELSE 0 END) as CAMFRONTPENDING,

        SUM(CASE WHEN Judge_Total = 'OK' THEN 1 ELSE 0 END) as TotalOK,
        SUM(CASE WHEN Judge_Total = 'NG' THEN 1 ELSE 0 END) as TotalNG

    FROM DataCheckFinal where Date(TimeUpdate) = curdate() and hour(TimeUpdate)>13 and hour(TimeUpdate)<22;
    else
		if(_hournow >21) THEN
					
		SELECT
        SUM(CASE WHEN Judge_VP = 'OK' THEN 1 ELSE 0 END) as VPOK,
        SUM(CASE WHEN Judge_GAS = 'OK' THEN 1 ELSE 0 END) as GASOILOK,
        SUM(CASE WHEN Judge_WI1WITH = 'OK' THEN 1 ELSE 0 END) as WI1WITHOK,
        SUM(CASE WHEN Judge_WI1START = 'OK' THEN 1 ELSE 0 END) as WI1STARTOK,
        SUM(CASE WHEN Judge_IP = 'OK' THEN 1 ELSE 0 END) as IPOK,
        SUM(CASE WHEN Judge_DF = 'OK' THEN 1 ELSE 0 END) as DFOK,
        SUM(CASE WHEN Judge_TEMP = 'OK' THEN 1 ELSE 0 END) as TEMPOK,
        SUM(CASE WHEN Judge_IOT = 'OK' THEN 1 ELSE 0 END) as IOTOK,
        SUM(CASE WHEN Judge_WI2 = 'OK' THEN 1 ELSE 0 END) as WI2OK,
        SUM(CASE WHEN Judge_PAN = 'OK' THEN 1 ELSE 0 END) as PANOK,
        SUM(CASE WHEN Judge_CAMBACK = 'OK' THEN 1 ELSE 0 END) as CAMBACKOK,
        SUM(CASE WHEN Judge_CAMFRONT = 'OK' THEN 1 ELSE 0 END) as CAMFRONTOK,

        SUM(CASE WHEN Judge_VP = 'NG' THEN 1 ELSE 0 END) as VPNG,
        SUM(CASE WHEN Judge_GAS = 'NG' THEN 1 ELSE 0 END) as GASOILNG,
        SUM(CASE WHEN Judge_WI1WITH = 'NG' THEN 1 ELSE 0 END) as WI1WITHNG,
        SUM(CASE WHEN Judge_WI1START = 'NG' THEN 1 ELSE 0 END) as WI1STARTNG,
        SUM(CASE WHEN Judge_IP = 'NG' THEN 1 ELSE 0 END) as IPNG,
        SUM(CASE WHEN Judge_DF = 'NG' THEN 1 ELSE 0 END) as DFNG,
        SUM(CASE WHEN Judge_TEMP = 'NG' THEN 1 ELSE 0 END) as TEMPNG,
        SUM(CASE WHEN Judge_IOT = 'NG' THEN 1 ELSE 0 END) as IOTNG,
        SUM(CASE WHEN Judge_WI2 = 'NG' THEN 1 ELSE 0 END) as WI2NG,
        SUM(CASE WHEN Judge_PAN = 'NG' THEN 1 ELSE 0 END) as PANNG,
        SUM(CASE WHEN Judge_CAMBACK = 'NG' THEN 1 ELSE 0 END) as CAMBACKNG,
        SUM(CASE WHEN Judge_CAMFRONT = 'NG' THEN 1 ELSE 0 END) as CAMFRONTNG,

        SUM(CASE WHEN Judge_VP = 'PD' THEN 1 ELSE 0 END) as VPPENDING,
        SUM(CASE WHEN Judge_GAS = 'PD' THEN 1 ELSE 0 END) as GASOILPENDING,
        SUM(CASE WHEN Judge_WI1WITH = 'PD' THEN 1 ELSE 0 END) as WI1WITHPENDING,
        SUM(CASE WHEN Judge_WI1START = 'PD' THEN 1 ELSE 0 END) as WI1STARTPENDING,
        SUM(CASE WHEN Judge_IP = 'PD' THEN 1 ELSE 0 END) as IPPENDING,
        SUM(CASE WHEN Judge_DF = 'PD' THEN 1 ELSE 0 END) as DFPENDING,
        SUM(CASE WHEN Judge_TEMP = 'PD' THEN 1 ELSE 0 END) as TEMPPENDING,
        SUM(CASE WHEN Judge_IOT = 'PD' THEN 1 ELSE 0 END) as IOTPENDING,
        SUM(CASE WHEN Judge_WI2 = 'PD' THEN 1 ELSE 0 END) as WI2PENDING,
        SUM(CASE WHEN Judge_PAN = 'PD' THEN 1 ELSE 0 END) as PANPENDING,
        SUM(CASE WHEN Judge_CAMBACK = 'PD' THEN 1 ELSE 0 END) as CAMBACKPENDING,
        SUM(CASE WHEN Judge_CAMFRONT = 'PD' THEN 1 ELSE 0 END) as CAMFRONTPENDING,

        SUM(CASE WHEN Judge_Total = 'OK' THEN 1 ELSE 0 END) as TotalOK,
        SUM(CASE WHEN Judge_Total = 'NG' THEN 1 ELSE 0 END) as TotalNG

	FROM DataCheckFinal where Date(TimeUpdate) = curdate() and hour(TimeUpdate)> 21;
   
	ELSE
	
		SELECT
        SUM(CASE WHEN Judge_VP = 'OK' THEN 1 ELSE 0 END) as VPOK,
        SUM(CASE WHEN Judge_GAS = 'OK' THEN 1 ELSE 0 END) as GASOILOK,
        SUM(CASE WHEN Judge_WI1WITH = 'OK' THEN 1 ELSE 0 END) as WI1WITHOK,
        SUM(CASE WHEN Judge_WI1START = 'OK' THEN 1 ELSE 0 END) as WI1STARTOK,
        SUM(CASE WHEN Judge_IP = 'OK' THEN 1 ELSE 0 END) as IPOK,
        SUM(CASE WHEN Judge_DF = 'OK' THEN 1 ELSE 0 END) as DFOK,
        SUM(CASE WHEN Judge_TEMP = 'OK' THEN 1 ELSE 0 END) as TEMPOK,
        SUM(CASE WHEN Judge_IOT = 'OK' THEN 1 ELSE 0 END) as IOTOK,
        SUM(CASE WHEN Judge_WI2 = 'OK' THEN 1 ELSE 0 END) as WI2OK,
        SUM(CASE WHEN Judge_PAN = 'OK' THEN 1 ELSE 0 END) as PANOK,
        SUM(CASE WHEN Judge_CAMBACK = 'OK' THEN 1 ELSE 0 END) as CAMBACKOK,
        SUM(CASE WHEN Judge_CAMFRONT = 'OK' THEN 1 ELSE 0 END) as CAMFRONTOK,

        SUM(CASE WHEN Judge_VP = 'NG' THEN 1 ELSE 0 END) as VPNG,
        SUM(CASE WHEN Judge_GAS = 'NG' THEN 1 ELSE 0 END) as GASOILNG,
        SUM(CASE WHEN Judge_WI1WITH = 'NG' THEN 1 ELSE 0 END) as WI1WITHNG,
        SUM(CASE WHEN Judge_WI1START = 'NG' THEN 1 ELSE 0 END) as WI1STARTNG,
        SUM(CASE WHEN Judge_IP = 'NG' THEN 1 ELSE 0 END) as IPNG,
        SUM(CASE WHEN Judge_DF = 'NG' THEN 1 ELSE 0 END) as DFNG,
        SUM(CASE WHEN Judge_TEMP = 'NG' THEN 1 ELSE 0 END) as TEMPNG,
        SUM(CASE WHEN Judge_IOT = 'NG' THEN 1 ELSE 0 END) as IOTNG,
        SUM(CASE WHEN Judge_WI2 = 'NG' THEN 1 ELSE 0 END) as WI2NG,
        SUM(CASE WHEN Judge_PAN = 'NG' THEN 1 ELSE 0 END) as PANNG,
        SUM(CASE WHEN Judge_CAMBACK = 'NG' THEN 1 ELSE 0 END) as CAMBACKNG,
        SUM(CASE WHEN Judge_CAMFRONT = 'NG' THEN 1 ELSE 0 END) as CAMFRONTNG,

        SUM(CASE WHEN Judge_VP = 'PD' THEN 1 ELSE 0 END) as VPPENDING,
        SUM(CASE WHEN Judge_GAS = 'PD' THEN 1 ELSE 0 END) as GASOILPENDING,
        SUM(CASE WHEN Judge_WI1WITH = 'PD' THEN 1 ELSE 0 END) as WI1WITHPENDING,
        SUM(CASE WHEN Judge_WI1START = 'PD' THEN 1 ELSE 0 END) as WI1STARTPENDING,
        SUM(CASE WHEN Judge_IP = 'PD' THEN 1 ELSE 0 END) as IPPENDING,
        SUM(CASE WHEN Judge_DF = 'PD' THEN 1 ELSE 0 END) as DFPENDING,
        SUM(CASE WHEN Judge_TEMP = 'PD' THEN 1 ELSE 0 END) as TEMPPENDING,
        SUM(CASE WHEN Judge_IOT = 'PD' THEN 1 ELSE 0 END) as IOTPENDING,
        SUM(CASE WHEN Judge_WI2 = 'PD' THEN 1 ELSE 0 END) as WI2PENDING,
        SUM(CASE WHEN Judge_PAN = 'PD' THEN 1 ELSE 0 END) as PANPENDING,
        SUM(CASE WHEN Judge_CAMBACK = 'PD' THEN 1 ELSE 0 END) as CAMBACKPENDING,
        SUM(CASE WHEN Judge_CAMFRONT = 'PD' THEN 1 ELSE 0 END) as CAMFRONTPENDING,

        SUM(CASE WHEN Judge_Total = 'OK' THEN 1 ELSE 0 END) as TotalOK,
        SUM(CASE WHEN Judge_Total = 'NG' THEN 1 ELSE 0 END) as TotalNG

	FROM DataCheckFinal where (Date(TimeUpdate) = curdate() and hour(TimeUpdate)>= 0 AND hour(TimeUpdate) < 6) or (DATE_SUB(CURDATE(), INTERVAL 1 DAY) = date(TimeUpdate) AND hour(TimeUpdate)> 21);
        END IF;
    end if;
    ELSE
		IF(_hournow > 5) then
		
		SELECT
        SUM(CASE WHEN Judge_VP = 'OK' THEN 1 ELSE 0 END) as VPOK,
        SUM(CASE WHEN Judge_GAS = 'OK' THEN 1 ELSE 0 END) as GASOILOK,
        SUM(CASE WHEN Judge_WI1WITH = 'OK' THEN 1 ELSE 0 END) as WI1WITHOK,
        SUM(CASE WHEN Judge_WI1START = 'OK' THEN 1 ELSE 0 END) as WI1STARTOK,
        SUM(CASE WHEN Judge_IP = 'OK' THEN 1 ELSE 0 END) as IPOK,
        SUM(CASE WHEN Judge_DF = 'OK' THEN 1 ELSE 0 END) as DFOK,
        SUM(CASE WHEN Judge_TEMP = 'OK' THEN 1 ELSE 0 END) as TEMPOK,
        SUM(CASE WHEN Judge_IOT = 'OK' THEN 1 ELSE 0 END) as IOTOK,
        SUM(CASE WHEN Judge_WI2 = 'OK' THEN 1 ELSE 0 END) as WI2OK,
        SUM(CASE WHEN Judge_PAN = 'OK' THEN 1 ELSE 0 END) as PANOK,
        SUM(CASE WHEN Judge_CAMBACK = 'OK' THEN 1 ELSE 0 END) as CAMBACKOK,
        SUM(CASE WHEN Judge_CAMFRONT = 'OK' THEN 1 ELSE 0 END) as CAMFRONTOK,

        SUM(CASE WHEN Judge_VP = 'NG' THEN 1 ELSE 0 END) as VPNG,
        SUM(CASE WHEN Judge_GAS = 'NG' THEN 1 ELSE 0 END) as GASOILNG,
        SUM(CASE WHEN Judge_WI1WITH = 'NG' THEN 1 ELSE 0 END) as WI1WITHNG,
        SUM(CASE WHEN Judge_WI1START = 'NG' THEN 1 ELSE 0 END) as WI1STARTNG,
        SUM(CASE WHEN Judge_IP = 'NG' THEN 1 ELSE 0 END) as IPNG,
        SUM(CASE WHEN Judge_DF = 'NG' THEN 1 ELSE 0 END) as DFNG,
        SUM(CASE WHEN Judge_TEMP = 'NG' THEN 1 ELSE 0 END) as TEMPNG,
        SUM(CASE WHEN Judge_IOT = 'NG' THEN 1 ELSE 0 END) as IOTNG,
        SUM(CASE WHEN Judge_WI2 = 'NG' THEN 1 ELSE 0 END) as WI2NG,
        SUM(CASE WHEN Judge_PAN = 'NG' THEN 1 ELSE 0 END) as PANNG,
        SUM(CASE WHEN Judge_CAMBACK = 'NG' THEN 1 ELSE 0 END) as CAMBACKNG,
        SUM(CASE WHEN Judge_CAMFRONT = 'NG' THEN 1 ELSE 0 END) as CAMFRONTNG,

        SUM(CASE WHEN Judge_VP = 'PD' THEN 1 ELSE 0 END) as VPPENDING,
        SUM(CASE WHEN Judge_GAS = 'PD' THEN 1 ELSE 0 END) as GASOILPENDING,
        SUM(CASE WHEN Judge_WI1WITH = 'PD' THEN 1 ELSE 0 END) as WI1WITHPENDING,
        SUM(CASE WHEN Judge_WI1START = 'PD' THEN 1 ELSE 0 END) as WI1STARTPENDING,
        SUM(CASE WHEN Judge_IP = 'PD' THEN 1 ELSE 0 END) as IPPENDING,
        SUM(CASE WHEN Judge_DF = 'PD' THEN 1 ELSE 0 END) as DFPENDING,
        SUM(CASE WHEN Judge_TEMP = 'PD' THEN 1 ELSE 0 END) as TEMPPENDING,
        SUM(CASE WHEN Judge_IOT = 'PD' THEN 1 ELSE 0 END) as IOTPENDING,
        SUM(CASE WHEN Judge_WI2 = 'PD' THEN 1 ELSE 0 END) as WI2PENDING,
        SUM(CASE WHEN Judge_PAN = 'PD' THEN 1 ELSE 0 END) as PANPENDING,
        SUM(CASE WHEN Judge_CAMBACK = 'PD' THEN 1 ELSE 0 END) as CAMBACKPENDING,
        SUM(CASE WHEN Judge_CAMFRONT = 'PD' THEN 1 ELSE 0 END) as CAMFRONTPENDING,

        SUM(CASE WHEN Judge_Total = 'OK' THEN 1 ELSE 0 END) as TotalOK,
        SUM(CASE WHEN Judge_Total = 'NG' THEN 1 ELSE 0 END) as TotalNG

    FROM DataCheckFinal WHERE  Date(TimeUpdate) = curdate() and hour(TimeUpdate)>5 ;
    else
		
		SELECT
        SUM(CASE WHEN Judge_VP = 'OK' THEN 1 ELSE 0 END) as VPOK,
        SUM(CASE WHEN Judge_GAS = 'OK' THEN 1 ELSE 0 END) as GASOILOK,
        SUM(CASE WHEN Judge_WI1WITH = 'OK' THEN 1 ELSE 0 END) as WI1WITHOK,
        SUM(CASE WHEN Judge_WI1START = 'OK' THEN 1 ELSE 0 END) as WI1STARTOK,
        SUM(CASE WHEN Judge_IP = 'OK' THEN 1 ELSE 0 END) as IPOK,
        SUM(CASE WHEN Judge_DF = 'OK' THEN 1 ELSE 0 END) as DFOK,
        SUM(CASE WHEN Judge_TEMP = 'OK' THEN 1 ELSE 0 END) as TEMPOK,
        SUM(CASE WHEN Judge_IOT = 'OK' THEN 1 ELSE 0 END) as IOTOK,
        SUM(CASE WHEN Judge_WI2 = 'OK' THEN 1 ELSE 0 END) as WI2OK,
        SUM(CASE WHEN Judge_PAN = 'OK' THEN 1 ELSE 0 END) as PANOK,
        SUM(CASE WHEN Judge_CAMBACK = 'OK' THEN 1 ELSE 0 END) as CAMBACKOK,
        SUM(CASE WHEN Judge_CAMFRONT = 'OK' THEN 1 ELSE 0 END) as CAMFRONTOK,

        SUM(CASE WHEN Judge_VP = 'NG' THEN 1 ELSE 0 END) as VPNG,
        SUM(CASE WHEN Judge_GAS = 'NG' THEN 1 ELSE 0 END) as GASOILNG,
        SUM(CASE WHEN Judge_WI1WITH = 'NG' THEN 1 ELSE 0 END) as WI1WITHNG,
        SUM(CASE WHEN Judge_WI1START = 'NG' THEN 1 ELSE 0 END) as WI1STARTNG,
        SUM(CASE WHEN Judge_IP = 'NG' THEN 1 ELSE 0 END) as IPNG,
        SUM(CASE WHEN Judge_DF = 'NG' THEN 1 ELSE 0 END) as DFNG,
        SUM(CASE WHEN Judge_TEMP = 'NG' THEN 1 ELSE 0 END) as TEMPNG,
        SUM(CASE WHEN Judge_IOT = 'NG' THEN 1 ELSE 0 END) as IOTNG,
        SUM(CASE WHEN Judge_WI2 = 'NG' THEN 1 ELSE 0 END) as WI2NG,
        SUM(CASE WHEN Judge_PAN = 'NG' THEN 1 ELSE 0 END) as PANNG,
        SUM(CASE WHEN Judge_CAMBACK = 'NG' THEN 1 ELSE 0 END) as CAMBACKNG,
        SUM(CASE WHEN Judge_CAMFRONT = 'NG' THEN 1 ELSE 0 END) as CAMFRONTNG,

        SUM(CASE WHEN Judge_VP = 'PD' THEN 1 ELSE 0 END) as VPPENDING,
        SUM(CASE WHEN Judge_GAS = 'PD' THEN 1 ELSE 0 END) as GASOILPENDING,
        SUM(CASE WHEN Judge_WI1WITH = 'PD' THEN 1 ELSE 0 END) as WI1WITHPENDING,
        SUM(CASE WHEN Judge_WI1START = 'PD' THEN 1 ELSE 0 END) as WI1STARTPENDING,
        SUM(CASE WHEN Judge_IP = 'PD' THEN 1 ELSE 0 END) as IPPENDING,
        SUM(CASE WHEN Judge_DF = 'PD' THEN 1 ELSE 0 END) as DFPENDING,
        SUM(CASE WHEN Judge_TEMP = 'PD' THEN 1 ELSE 0 END) as TEMPPENDING,
        SUM(CASE WHEN Judge_IOT = 'PD' THEN 1 ELSE 0 END) as IOTPENDING,
        SUM(CASE WHEN Judge_WI2 = 'PD' THEN 1 ELSE 0 END) as WI2PENDING,
        SUM(CASE WHEN Judge_PAN = 'PD' THEN 1 ELSE 0 END) as PANPENDING,
        SUM(CASE WHEN Judge_CAMBACK = 'PD' THEN 1 ELSE 0 END) as CAMBACKPENDING,
        SUM(CASE WHEN Judge_CAMFRONT = 'PD' THEN 1 ELSE 0 END) as CAMFRONTPENDING,

        SUM(CASE WHEN Judge_Total = 'OK' THEN 1 ELSE 0 END) as TotalOK,
        SUM(CASE WHEN Judge_Total = 'NG' THEN 1 ELSE 0 END) as TotalNG

	FROM DataCheckFinal where (Date(TimeUpdate) = curdate() and hour(TimeUpdate)>= 0 AND hour(TimeUpdate) < 6) or (DATE_SUB(CURDATE(), INTERVAL 1 DAY) = Date(TimeUpdate) AND hour(TimeUpdate)> 5);
    END IF;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataForChartFinalCheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`%` PROCEDURE `LoadDataForChartFinalCheck`(IN p_selectionItem VARCHAR(3))
BEGIN

    Declare _StartDate datetime;
	Declare _EndDate datetime;
   
		SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplan where Model = 'Total';
		SELECT
        SUM(CASE WHEN Judge_VP = 'OK' THEN 1 ELSE 0 END) as VPOK,
        SUM(CASE WHEN Judge_GAS = 'OK' THEN 1 ELSE 0 END) as GASOILOK,
        SUM(CASE WHEN Judge_WI1WITH = 'OK' THEN 1 ELSE 0 END) as WI1WITHOK,
        SUM(CASE WHEN Judge_WI1START = 'OK' THEN 1 ELSE 0 END) as WI1STARTOK,
        SUM(CASE WHEN Judge_IP = 'OK' THEN 1 ELSE 0 END) as IPOK,
        SUM(CASE WHEN Judge_DF = 'OK' THEN 1 ELSE 0 END) as DFOK,
        SUM(CASE WHEN Judge_TEMP = 'OK' THEN 1 ELSE 0 END) as TEMPOK,
        SUM(CASE WHEN Judge_IOT = 'OK' THEN 1 ELSE 0 END) as IOTOK,
        SUM(CASE WHEN Judge_WI2 = 'OK' THEN 1 ELSE 0 END) as WI2OK,
        SUM(CASE WHEN Judge_PAN = 'OK' THEN 1 ELSE 0 END) as PANOK,
        SUM(CASE WHEN Judge_CAMBACK = 'OK' THEN 1 ELSE 0 END) as CAMBACKOK,
        SUM(CASE WHEN Judge_CAMFRONT = 'OK' THEN 1 ELSE 0 END) as CAMFRONTOK,

        SUM(CASE WHEN Judge_VP = 'NG' THEN 1 ELSE 0 END) as VPNG,
        SUM(CASE WHEN Judge_GAS = 'NG' THEN 1 ELSE 0 END) as GASOILNG,
        SUM(CASE WHEN Judge_WI1WITH = 'NG' THEN 1 ELSE 0 END) as WI1WITHNG,
        SUM(CASE WHEN Judge_WI1START = 'NG' THEN 1 ELSE 0 END) as WI1STARTNG,
        SUM(CASE WHEN Judge_IP = 'NG' THEN 1 ELSE 0 END) as IPNG,
        SUM(CASE WHEN Judge_DF = 'NG' THEN 1 ELSE 0 END) as DFNG,
        SUM(CASE WHEN Judge_TEMP = 'NG' THEN 1 ELSE 0 END) as TEMPNG,
        SUM(CASE WHEN Judge_IOT = 'NG' THEN 1 ELSE 0 END) as IOTNG,
        SUM(CASE WHEN Judge_WI2 = 'NG' THEN 1 ELSE 0 END) as WI2NG,
        SUM(CASE WHEN Judge_PAN = 'NG' THEN 1 ELSE 0 END) as PANNG,
        SUM(CASE WHEN Judge_CAMBACK = 'NG' THEN 1 ELSE 0 END) as CAMBACKNG,
        SUM(CASE WHEN Judge_CAMFRONT = 'NG' THEN 1 ELSE 0 END) as CAMFRONTNG,

        SUM(CASE WHEN Judge_VP = 'PD' THEN 1 ELSE 0 END) as VPPENDING,
        SUM(CASE WHEN Judge_GAS = 'PD' THEN 1 ELSE 0 END) as GASOILPENDING,
        SUM(CASE WHEN Judge_WI1WITH = 'PD' THEN 1 ELSE 0 END) as WI1WITHPENDING,
        SUM(CASE WHEN Judge_WI1START = 'PD' THEN 1 ELSE 0 END) as WI1STARTPENDING,
        SUM(CASE WHEN Judge_IP = 'PD' THEN 1 ELSE 0 END) as IPPENDING,
        SUM(CASE WHEN Judge_DF = 'PD' THEN 1 ELSE 0 END) as DFPENDING,
        SUM(CASE WHEN Judge_TEMP = 'PD' THEN 1 ELSE 0 END) as TEMPPENDING,
        SUM(CASE WHEN Judge_IOT = 'PD' THEN 1 ELSE 0 END) as IOTPENDING,
        SUM(CASE WHEN Judge_WI2 = 'PD' THEN 1 ELSE 0 END) as WI2PENDING,
        SUM(CASE WHEN Judge_PAN = 'PD' THEN 1 ELSE 0 END) as PANPENDING,
        SUM(CASE WHEN Judge_CAMBACK = 'PD' THEN 1 ELSE 0 END) as CAMBACKPENDING,
        SUM(CASE WHEN Judge_CAMFRONT = 'PD' THEN 1 ELSE 0 END) as CAMFRONTPENDING,

        SUM(CASE WHEN Judge_Total = 'OK' THEN 1 ELSE 0 END) as TotalOK,
        SUM(CASE WHEN Judge_Total = 'NG' THEN 1 ELSE 0 END) as TotalNG

    FROM DataCheckFinal WHERE  TimeUpdate BETWEEN _StartDate AND _EndDate ;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataForChartHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`%` PROCEDURE `LoadDataForChartHistory`(IN DateTimeFrom DATETIME,
IN DateTimeTo DATETIME)
BEGIN
	SELECT
        SUM(CASE WHEN Judge_VP = 'OK' THEN 1 ELSE 0 END) as VPOK,
        SUM(CASE WHEN Judge_GAS = 'OK' THEN 1 ELSE 0 END) as GASOILOK,
        SUM(CASE WHEN Judge_WI1WITH = 'OK' THEN 1 ELSE 0 END) as WI1WITHOK,
        SUM(CASE WHEN Judge_WI1START = 'OK' THEN 1 ELSE 0 END) as WI1STARTOK,
        SUM(CASE WHEN Judge_IP = 'OK' THEN 1 ELSE 0 END) as IPOK,
        SUM(CASE WHEN Judge_DF = 'OK' THEN 1 ELSE 0 END) as DFOK,
        SUM(CASE WHEN Judge_TEMP = 'OK' THEN 1 ELSE 0 END) as TEMPOK,
        SUM(CASE WHEN Judge_IOT = 'OK' THEN 1 ELSE 0 END) as IOTOK,
        SUM(CASE WHEN Judge_WI2 = 'OK' THEN 1 ELSE 0 END) as WI2OK,
        SUM(CASE WHEN Judge_PAN = 'OK' THEN 1 ELSE 0 END) as PANOK,
        SUM(CASE WHEN Judge_CAMBACK = 'OK' THEN 1 ELSE 0 END) as CAMBACKOK,
        SUM(CASE WHEN Judge_CAMFRONT = 'OK' THEN 1 ELSE 0 END) as CAMFRONTOK,

        SUM(CASE WHEN Judge_VP = 'NG' THEN 1 ELSE 0 END) as VPNG,
        SUM(CASE WHEN Judge_GAS = 'NG' THEN 1 ELSE 0 END) as GASOILNG,
        SUM(CASE WHEN Judge_WI1WITH = 'NG' THEN 1 ELSE 0 END) as WI1WITHNG,
        SUM(CASE WHEN Judge_WI1START = 'NG' THEN 1 ELSE 0 END) as WI1STARTNG,
        SUM(CASE WHEN Judge_IP = 'NG' THEN 1 ELSE 0 END) as IPNG,
        SUM(CASE WHEN Judge_DF = 'NG' THEN 1 ELSE 0 END) as DFNG,
        SUM(CASE WHEN Judge_TEMP = 'NG' THEN 1 ELSE 0 END) as TEMPNG,
        SUM(CASE WHEN Judge_IOT = 'NG' THEN 1 ELSE 0 END) as IOTNG,
        SUM(CASE WHEN Judge_WI2 = 'NG' THEN 1 ELSE 0 END) as WI2NG,
        SUM(CASE WHEN Judge_PAN = 'NG' THEN 1 ELSE 0 END) as PANNG,
        SUM(CASE WHEN Judge_CAMBACK = 'NG' THEN 1 ELSE 0 END) as CAMBACKNG,
        SUM(CASE WHEN Judge_CAMFRONT = 'NG' THEN 1 ELSE 0 END) as CAMFRONTNG,

        SUM(CASE WHEN Judge_VP = 'PD' THEN 1 ELSE 0 END) as VPPENDING,
        SUM(CASE WHEN Judge_GAS = 'PD' THEN 1 ELSE 0 END) as GASOILPENDING,
        SUM(CASE WHEN Judge_WI1WITH = 'PD' THEN 1 ELSE 0 END) as WI1WITHPENDING,
        SUM(CASE WHEN Judge_WI1START = 'PD' THEN 1 ELSE 0 END) as WI1STARTPENDING,
        SUM(CASE WHEN Judge_IP = 'PD' THEN 1 ELSE 0 END) as IPPENDING,
        SUM(CASE WHEN Judge_DF = 'PD' THEN 1 ELSE 0 END) as DFPENDING,
        SUM(CASE WHEN Judge_TEMP = 'PD' THEN 1 ELSE 0 END) as TEMPPENDING,
        SUM(CASE WHEN Judge_IOT = 'PD' THEN 1 ELSE 0 END) as IOTPENDING,
        SUM(CASE WHEN Judge_WI2 = 'PD' THEN 1 ELSE 0 END) as WI2PENDING,
        SUM(CASE WHEN Judge_PAN = 'PD' THEN 1 ELSE 0 END) as PANPENDING,
        SUM(CASE WHEN Judge_CAMBACK = 'PD' THEN 1 ELSE 0 END) as CAMBACKPENDING,
        SUM(CASE WHEN Judge_CAMFRONT = 'PD' THEN 1 ELSE 0 END) as CAMFRONTPENDING,

        SUM(CASE WHEN Judge_Total = 'OK' THEN 1 ELSE 0 END) as TotalOK,
        SUM(CASE WHEN Judge_Total = 'NG' THEN 1 ELSE 0 END) as TotalNG
		FROM DataCheckFinal where TimeUpdate Between DateTimeFrom AND DateTimeTo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataForLineChartPlanGas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `LoadDataForLineChartPlanGas`(IN _ModelName nvarchar(30))
BEGIN
DECLARE _hournow int;
    Set _hournow = hour(now());
	if (_ModelName = 'all') then
    IF(_hournow > 5) then
   SELECT NameHour,COALESCE(b.Quantity, 0) AS Quantity FROM dataplc.datamastertime 
   LEFT JOIN (select hour(TimePLC) as GroupHour, count(DISTINCT CodeBack) as Quantity from gas 
   where Judge = 'OK' and Date(TimePLC) = curdate() and  hour(TimePLC)>5
   group by hour(TimePLC)) as b On datamastertime.NameHour = b.GroupHour;
 select  TimeStart, TimeEnd,QuantityDay,QuantityPerSec,TotalTime from dataplan where Model = 'Total' and Date(dataplan.TimeUpdate ) = Date(now()) limit 1;
    else
	SELECT NameHour,COALESCE(b.Quantity, 0) AS Quantity FROM dataplc.datamastertime 
	LEFT JOIN (select hour(TimePLC) as GroupHour, count(DISTINCT CodeBack) as Quantity from gas 
	where Judge = 'OK' and (Date(TimePLC) = curdate() and hour(TimePLC)>= 0 AND (hour(TimePLC) < 6) or (DATE_SUB(CURDATE(), INTERVAL 1 DAY) = Date(TimePLC) AND hour(TimePLC)>5))
	group by hour(TimePLC)) as b On datamastertime.NameHour = b.GroupHour;
    
    select  TimeStart, TimeEnd,QuantityDay,QuantityPerSec,TotalTime from dataplan where Model = 'Total' and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY) limit 1;
    END IF;
    else
     IF(_hournow > 5) then
   SELECT NameHour,COALESCE(b.Quantity, 0) AS Quantity FROM dataplc.datamastertime 
   LEFT JOIN (select hour(TimePLC) as GroupHour, count(DISTINCT CodeBack) as Quantity from gas 
   where Judge = 'OK' and CodeModel = _ModelName and Date(TimePLC) = curdate() and  hour(TimePLC)>5
   group by hour(TimePLC)) as b On datamastertime.NameHour = b.GroupHour;
 select  TimeStart, TimeEnd,QuantityDay,QuantityPerSec,TotalTime from dataplan where Model = _ModelName and Date(dataplan.TimeUpdate ) = Date(now()) limit 1;
    else
	SELECT NameHour,COALESCE(b.Quantity, 0) AS Quantity FROM dataplc.datamastertime 
	LEFT JOIN (select hour(TimePLC) as GroupHour, count(DISTINCT CodeBack) as Quantity from gas 
	where Judge = 'OK' and  CodeModel = _ModelName and ((Date(TimePLC) = curdate() and hour(TimePLC)>= 0 AND hour(TimePLC) < 6) or (DATE_SUB(CURDATE(), INTERVAL 1 DAY) = Date(TimePLC) AND hour(TimePLC)>5))
	group by hour(TimePLC)) as b On datamastertime.NameHour = b.GroupHour;
    
    select  TimeStart, TimeEnd,QuantityDay,QuantityPerSec,TotalTime from dataplan where Model = _ModelName and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY) limit 1;
    END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataForLineChartPlanGasByTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `LoadDataForLineChartPlanGasByTime`(IN _ModelName nvarchar(30))
BEGIN
	
    DECLARE _hournow int;
    Set _hournow = hour(now());
    if (_ModelName = 'all') then
      IF(_hournow > 5) then
       SET @StartDate = CONCAT(CURRENT_DATE, ' 06:00:00');
SET @EndDate = CONCAT(DATE_ADD(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    dataplan
WHERE
    Model = 'Total'
        AND DATE(dataplan.TimeUpdate) = DATE(NOW())
LIMIT 1;

      else
		SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
		SET @EndDate = CONCAT(CURRENT_DATE, ' 06:00:00');
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    dataplan
WHERE
    Model = 'Total'
        AND DATE(dataplan.TimeUpdate) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
LIMIT 1;

        END IF;
   else
     IF(_hournow > 5) then
        SET @StartDate = CONCAT(CURRENT_DATE, ' 06:00:00');
		SET @EndDate = CONCAT(DATE_ADD(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate and CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    dataplan
WHERE
    Model = _ModelName
        AND DATE(dataplan.TimeUpdate) = DATE(NOW())
LIMIT 1;

      else
		SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
		SET @EndDate = CONCAT(CURRENT_DATE, ' 06:00:00');
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate  and CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    dataplan
WHERE
    Model = _ModelName
        AND DATE(dataplan.TimeUpdate) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
LIMIT 1;

        END IF;
  END IF;
   
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataForPieChartPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `LoadDataForPieChartPlan`()
BEGIN
DECLARE rsOK int;
	DECLARE rsNG int;
    declare rsTotal int;
DECLARE _hournow int;
    Set _hournow = hour(now());
    IF(_hournow > 5) then
		select count(DISTINCT CodeBack) into rsTotal from gas where  Date(TimePLC) = curdate() and  hour(TimePLC)>5;
		select count(DISTINCT CodeBack) into rsOK from gas where Judge = 'OK' and Date(TimePLC) = curdate() and  hour(TimePLC)>5;
    set rsNG = rsTotal - rsOK;
    select rsOK as DataOK, rsNG as DataNG;
    else
		select count(DISTINCT CodeBack) into rsTotal from gas where (Date(TimePLC) = curdate() and hour(TimePLC)>= 0 AND hour(TimePLC) < 6) or (DATE_SUB(CURDATE(), INTERVAL 1 DAY) = Date(TimePLC) AND hour(TimePLC)>5);
		select count(DISTINCT CodeBack) into rsOK from gas where Judge = 'OK' and (Date(TimePLC) = curdate() and hour(TimePLC)>= 0 AND hour(TimePLC) < 6) or (DATE_SUB(CURDATE(), INTERVAL 1 DAY) = Date(TimePLC) AND hour(TimePLC)>5);
		set rsNG = rsTotal - rsOK;
		select rsOK as DataOK, rsNG as DataNG;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataForTableHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`%` PROCEDURE `LoadDataForTableHistory`()
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
    SELECT CodeBack, Judge_Total, TimeUpdate
    FROM DataCheckFinal
    ORDER BY TimeUpdate DESC
    LIMIT 50;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataForTableHistoryFinalCheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`%` PROCEDURE `LoadDataForTableHistoryFinalCheck`()
BEGIN
	Declare _StartDate datetime;
	Declare _EndDate datetime;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
    
   
		SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplan where Model = 'Total';
    SELECT CodeBack, Judge_Total, TimeUpdate
    FROM DataCheckFinal
	WHERE  TimeUpdate BETWEEN _StartDate AND _EndDate 
    ORDER BY TimeUpdate DESC
    LIMIT 50;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataForTableHistoryFinalCheckNew` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`%` PROCEDURE `LoadDataForTableHistoryFinalCheckNew`()
BEGIN
	Declare _StartDate datetime;
	Declare _EndDate datetime;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
    
   
		SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplan where Model = 'Total';
    SELECT CodeBack, Judge_Total, TimeUpdate
    FROM DataCheckFinal
	WHERE  TimeUpdate BETWEEN _StartDate AND _EndDate 
    ORDER BY TimeUpdate DESC
    LIMIT 50;
    
    SELECT * FROM dataplc.datacheckfinal  ORDER BY TimeUpdate DESC LIMIT 1;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataForTableHistoryTrace` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`%` PROCEDURE `LoadDataForTableHistoryTrace`(
    datetimefrom VARCHAR(30),
    datetimeto VARCHAR(30),
    namecabi VARCHAR(30)
)
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
    IF (CHAR_LENGTH(datetimefrom) > 5 AND CHAR_LENGTH(datetimeto) > 5 AND CHAR_LENGTH(namecabi) >= 19) THEN
        SELECT CodeBack, Judge_Total, TimeUpdate
        FROM DataCheckFinal
        WHERE CodeBack = namecabi AND TimeUpdate BETWEEN STR_TO_DATE(datetimefrom, '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE(datetimeto, '%Y-%m-%d %H:%i:%s');
    ELSEIF (CHAR_LENGTH(datetimefrom) > 5 AND CHAR_LENGTH(datetimeto) > 5) THEN
        SELECT CodeBack, Judge_Total, TimeUpdate
        FROM DataCheckFinal
        WHERE TimeUpdate BETWEEN STR_TO_DATE(datetimefrom, '%Y-%m-%d %H:%i:%s') AND STR_TO_DATE(datetimeto, '%Y-%m-%d %H:%i:%s');
    ELSEIF (CHAR_LENGTH(namecabi) >= 19) THEN
        SELECT CodeBack, Judge_Total, TimeUpdate
        FROM DataCheckFinal
        WHERE CodeBack = namecabi;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadDataPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `LoadDataPlan`()
BEGIN
	DECLARE _hournow int;
    Set _hournow = hour(now());
    IF(_hournow > 5) then
	SELECT * FROM dataplc.dataplan where Date(TimeUpdate) = Date(now()) and Model <> 'Total';
    ELSE
	SELECT * FROM dataplc.dataplan
        where Model <> 'Total' AND Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadModelPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `LoadModelPlan`()
BEGIN
	DECLARE _hournow int;
    Set _hournow = hour(now());
    IF(_hournow > 5) then
   SELECT Model FROM dataplan
   where Model <> 'Total' and  Date(dataplan.TimeUpdate ) = Date(now());
    else
    SELECT Model FROM dataplan
   where Model <> 'Total' and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoadQuantityPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `LoadQuantityPlan`(IN _ModelName nvarchar(30))
BEGIN

 DECLARE _hournow int;
    Set _hournow = hour(now());
    IF(_hournow > 5) then
	 if (_ModelName = 'all') then
            select QuantityDay from dataplan where Model = 'Total' and  Date(dataplan.TimeUpdate ) = Date(now());
         else
            select QuantityDay from dataplan where Model = _ModelName and  Date(dataplan.TimeUpdate ) = Date(now());
         end if;
     else
	 if (_ModelName = 'all') then
            select QuantityDay from dataplan where Model = 'Total' and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
         else
            select QuantityDay from dataplan where Model = _ModelName and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
         end if; 
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MonitorSpecial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `MonitorSpecial`(IN _ModelName nvarchar(30))
BEGIN
	DECLARE _hournow int;
    	Set _hournow = hour(now());
    	IF(_hournow > 5) then
		if(exists(select MonitorSpecial from dataplan where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`dataplan`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName and  Date(dataplan.TimeUpdate ) = Date(now());
		else
			UPDATE `dataplc`.`dataplan`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName and  Date(dataplan.TimeUpdate ) = Date(now());
		end if;
    	else
		if(exists(select MonitorSpecial from dataplan where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`dataplan`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
		else
			UPDATE `dataplc`.`dataplan`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
		end if;     		
    	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCountErrorNames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spCountErrorNames`()
BEGIN
    DECLARE errorCount INT;

    SELECT COUNT(*) INTO errorCount
    FROM iot
    WHERE errorname IS NOT NULL;

    SELECT errorCount AS 'TotalErrorNames';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllDataFromCamBack` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetAllDataFromCamBack`(IN request varchar(500),IN judgeType varchar(10), IN pageSize int,IN pageNumber int, In startDate datetime, IN endDate datetime)
BEGIN
	DECLARE Count INT;
	Set Count = 0;
    IF pageNumber = 1 then Set Count = 0; 
    ELSE  Set Count = (pageNumber-1) * pageSize; end if;
	
	SELECT CodeBack, TimePLC, 
		CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM camback
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND(CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'))
	ORDER BY TimePLC
    LIMIT pageSize OFFSET Count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllDataFromDataCamFront` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetAllDataFromDataCamFront`(IN request varchar(500),IN judgeType varchar(10), IN pageSize int,IN pageNumber int, In startDate datetime, IN endDate datetime)
BEGIN
	DECLARE Count INT;
	Set Count = 0;
    IF pageNumber = 1 then Set Count = 0; 
    ELSE  Set Count = (pageNumber-1) * pageSize; end if;
    
	SELECT CodeBack, TimePLC, 
		CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM camfront
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND(CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'))
	ORDER BY TimePLC
    LIMIT pageSize OFFSET Count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllDataFromDF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetAllDataFromDF`(IN request varchar(500),IN judgeType varchar(10), IN pageSize int,IN pageNumber int, In startDate datetime, IN endDate datetime)
BEGIN
	DECLARE Count INT;
	Set Count = 0;
    IF pageNumber = 1 then Set Count = 0; 
    ELSE  Set Count = (pageNumber-1) * pageSize; end if;
	
	SELECT CodeBack, TimePLC, 
		CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM df
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND(CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'))
	ORDER BY TimePLC
    LIMIT pageSize OFFSET Count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllDataFromGAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetAllDataFromGAS`(IN request varchar(500),IN judgeType varchar(10), IN pageSize int,IN pageNumber int, In startDate datetime, IN endDate datetime)
BEGIN
	DECLARE Count INT;
	Set Count = 0;
    IF pageNumber = 1 then Set Count = 0; 
    ELSE  Set Count = (pageNumber-1) * pageSize; end if;
	
	SELECT CodeBack, TimePLC, 
		CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM gas
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND(CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'))
	ORDER BY TimePLC
    LIMIT pageSize OFFSET Count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllDataFromIOT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetAllDataFromIOT`(IN request varchar(500),IN judgeType varchar(10), IN pageSize int,IN pageNumber int, In startDate datetime, IN endDate datetime)
BEGIN
	DECLARE Count INT;
	Set Count = 0;
    IF pageNumber = 1 then Set Count = 0; 
    ELSE  Set Count = (pageNumber-1) * pageSize; end if;
	
	SELECT CodeBack, TimePLC, 
		CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM iot
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND(CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'))
	ORDER BY TimePLC
    LIMIT pageSize OFFSET Count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllDataFromIP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetAllDataFromIP`(IN request varchar(500),IN judgeType varchar(10), IN pageSize int,IN pageNumber int, In startDate datetime, IN endDate datetime)
BEGIN
	DECLARE Count INT;
	Set Count = 0;
    IF pageNumber = 1 then Set Count = 0; 
    ELSE  Set Count = (pageNumber-1) * pageSize; end if;
	
	SELECT CodeBack, TimePLC, 
		CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM ip
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND(CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'))
	ORDER BY TimePLC
    LIMIT pageSize OFFSET Count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllDataFromSuaTu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetAllDataFromSuaTu`(IN request varchar(500),IN judgeType varchar(10), IN pageSize int,IN pageNumber int, In startDate datetime, IN endDate datetime)
BEGIN
	DECLARE Count INT;
	Set Count = 0;
    IF pageNumber = 1 then Set Count = 0; 
    ELSE  Set Count = (pageNumber-1) * pageSize; end if;
	
	SELECT CodeBack, TimePLC, 
		CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM suatu
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND(CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'))
	ORDER BY TimePLC
    LIMIT pageSize OFFSET Count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllDataFromTempResult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetAllDataFromTempResult`(IN request varchar(500),IN judgeType varchar(10), IN pageSize int,IN pageNumber int, In startDate datetime, IN endDate datetime)
BEGIN
	DECLARE Count INT;
	Set Count = 0;
    IF pageNumber = 1 then Set Count = 0; 
    ELSE  Set Count = (pageNumber-1) * pageSize; end if;
	
	SELECT CodeBack, TimePLC, 
		CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM tempresult
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND(CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'))
	ORDER BY TimePLC
    LIMIT pageSize OFFSET Count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllDataFromVP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetAllDataFromVP`(IN request varchar(500),IN judgeType varchar(10), IN pageSize int,IN pageNumber int, In startDate datetime, IN endDate datetime)
BEGIN
	DECLARE Count INT;
	Set Count = 0;
    IF pageNumber = 1 then Set Count = 0; 
    ELSE  Set Count = (pageNumber-1) * pageSize; end if;
	
	SELECT CodeBack, TimePLC, 
		CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM VP
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND(CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'))
	ORDER BY TimePLC
    LIMIT pageSize OFFSET Count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllDataFromWi1Start` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetAllDataFromWi1Start`(IN request varchar(500),IN judgeType varchar(10), IN pageSize int,IN pageNumber int, In startDate datetime, IN endDate datetime)
BEGIN
	DECLARE Count INT;
	Set Count = 0;
    IF pageNumber = 1 then Set Count = 0; 
    ELSE  Set Count = (pageNumber-1) * pageSize; end if;
    
	SELECT CodeBack, TimePLC, 
		CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM wi1start
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND(CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'))
    ORDER BY TimePLC
    LIMIT pageSize OFFSET Count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllDataFromWi1With` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetAllDataFromWi1With`(IN request varchar(500),IN judgeType varchar(10), IN pageSize int,IN pageNumber int, In startDate datetime, IN endDate datetime)
BEGIN
	DECLARE Count INT;
	Set Count = 0;
    IF pageNumber = 1 then Set Count = 0; 
    ELSE  Set Count = (pageNumber-1) * pageSize; end if;
	
	SELECT CodeBack, TimePLC, 
		CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM wi1with
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND(CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'))
	ORDER BY TimePLC
    LIMIT pageSize OFFSET Count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllDataFromWi2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetAllDataFromWi2`(IN request varchar(500),IN judgeType varchar(10), IN pageSize int,IN pageNumber int, In startDate datetime, IN endDate datetime)
BEGIN
	DECLARE Count INT;
	Set Count = 0;
    IF pageNumber = 1 then Set Count = 0; 
    ELSE  Set Count = (pageNumber-1) * pageSize; end if;
	
	SELECT CodeBack, TimePLC, 
		CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM wi2
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND(CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'))
	ORDER BY TimePLC
    LIMIT pageSize OFFSET Count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCamBackOKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetCamBackOKNG`(IN DateStart datetime, IN DateEnd datetime, in isRealTime bit)
BEGIN
	DECLARE CountOK INT DEFAULT 0;
    DECLARE CountNG INT DEFAULT 0;

    CREATE TEMPORARY TABLE IF NOT EXISTS tempIpJudge (
        Judge VARCHAR(10)
    );
    
    -- if isRealTime = true then
	-- INSERT INTO tempIpJudge
	-- SELECT
		   -- CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
	-- FROM camback AS w
	-- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- else
	INSERT INTO tempIpJudge
	SELECT
		   CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
	FROM camback AS w
	WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- end if;
    
    select COUNT(Judge) into CountOK from tempIpJudge where Judge = 'OK';
    select COUNT(Judge) into CountNG from tempIpJudge where Judge = 'NG';
    
    
    select CountOK, CountNG;
    DROP TEMPORARY TABLE IF EXISTS tempIpJudge;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCamBackRatioOkNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetCamBackRatioOkNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotalNG (
			CodeModel VARCHAR(255),
			Judge VARCHAR(10)
		);
    
   
    INSERT INTO tempDataTotalNG
    SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM camback AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') order by TimeInsert desc limit 1000 ;

    
	SELECT 
		temp.CodeModel AS Code,
		COUNT(CASE
			WHEN temp.Judge = 'NG' THEN 1
		END) AS TotalNG,
		COUNT(CASE
			WHEN temp.Judge = 'OK' THEN 1
		END) AS TotalOK
	FROM
		tempDataTotalNG AS temp
	GROUP BY temp.CodeModel
	ORDER BY (TotalNG + TotalOK) DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCamBackStackOkNgByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetCamBackStackOkNgByDate`(IN DateStart DATETIME)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS tempData;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        DayInMonth INT,
        TotalOK INT,
        TotalNG INT
    );

    SET @DateEnd = DAY(last_day(DateStart));
    SET @i = 1;
    
	  SET @today_date = CURDATE();
	  IF MONTH(DateStart) = MONTH(@today_date) AND YEAR(DateStart) = YEAR(@today_date) THEN
	  SET @DateEnd = Day(@today_date);
	  END IF;
    
    
    WHILE @i <= @DateEnd DO
        SET @DayInMonth = DATE(DATE_FORMAT(DateStart, CONCAT('%Y-%m-', @i)));

        SET @sql = CONCAT('INSERT INTO tempData (DayInMonth, TotalOK, TotalNG) SELECT  
            ', @i, ' as DayInMonth,
            Count(case when temp.Judge = "OK" THEN 1 END) as TotalOK,
            Count(case when temp.Judge = "NG" THEN 1 END) as TotalNG 
        FROM (
            SELECT Judge
            FROM camback
            WHERE TimeInsert BETWEEN "', @DayInMonth, '" AND "', DATE_FORMAT(@DayInMonth, '%Y-%m-%d 23:59:59'),'"
        ) AS temp;');
	
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET @i = @i + 1;
    END WHILE;
    
	SELECT 
		*
	FROM
		tempData  WHERE TotalOK <> 0 OR TotalNG <> 0;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCamBackTotalNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetCamBackTotalNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataWi1WithTotalNg;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataWi1WithTotalNg (
        CodeModel VARCHAR(255),
        Judge VARCHAR(10)
    );
    
    -- if isRealTime = true then
    -- INSERT INTO tempDataWi1WithTotalNg
    -- SELECT SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1),
          --  CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    -- FROM camback AS w
    -- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
    -- else
    INSERT INTO tempDataWi1WithTotalNg
    SELECT  SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1),
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM camback AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- end if;
    
    SELECT temp.CodeModel, COUNT(*) as TotalNG
    FROM tempDataWi1WithTotalNg AS temp 
    WHERE temp.Judge = 'NG'
    GROUP BY temp.CodeModel
    ORDER BY TotalNG DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataWi1WithTotalNg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCamFB_Ok_Ng` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetCamFB_Ok_Ng`(IN DateStart datetime, IN DateEnd datetime, in isRealTime bit)
BEGIN
	DECLARE CountOK INT DEFAULT 0;
    DECLARE CountNG INT DEFAULT 0;
    
	DROP TEMPORARY TABLE IF EXISTS tempData;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        Judge VARCHAR(10)
    );
    
	INSERT INTO tempData 
		SELECT * FROM
			(SELECT 
				CASE WHEN cb.CodeBack <> CONCAT(TRIM(cb.CodeModel), TRIM(cb.CodeSerial)) THEN 'NG' ELSE cb.Judge END AS Judge FROM  camback AS cb
			WHERE (cb.TimeInsert between DateStart AND DateEnd) AND(cb.CodeBack IS NOT NULL) AND (TRIM(cb.CodeBack) NOT LIKE '') 
			UNION ALL
			SELECT  CASE WHEN cf.CodeBack <> CONCAT(TRIM(cf.CodeModel), TRIM(cf.CodeSerial)) THEN 'NG' ELSE cf.Judge END AS Judge
			FROM
				camfront AS cf
			WHERE (cf.TimeInsert between DateStart AND DateEnd) AND (cf.CodeBack IS NOT NULL) AND (TRIM(cf.CodeBack) NOT LIKE '')) AS tbl;
    
    select COUNT(Judge) into CountOK from tempData where Judge = 'OK';
    select COUNT(Judge) into CountNG from tempData where Judge = 'NG';
    
    select CountOK as TotalOK, CountNG as TotalNG;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCamFB_StackOkNgByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetCamFB_StackOkNgByDate`(IN StartDate DATETIME)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS tempData;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        DayInMonth INT,
        TotalOK INT,
        TotalNG INT
    );

    SET @DateEnd = DAY(last_day(StartDate));
    SET @i = 1;
    
	  SET @today_date = CURDATE();
	  IF MONTH(StartDate) = MONTH(@today_date) AND YEAR(StartDate) = YEAR(@today_date) THEN
	  SET @DateEnd = Day(@today_date);
	  END IF;
    
    
    WHILE @i <= @DateEnd DO
        SET @DayInMonth = DATE(DATE_FORMAT(StartDate, CONCAT('%Y-%m-', @i)));

        SET @sql = CONCAT('INSERT INTO tempData (DayInMonth, TotalOK, TotalNG) SELECT  
            ', @i, ' as DayInMonth,
            Count(case when temp.Judge = "OK" THEN 1 END) as TotalOK,
            Count(case when temp.Judge = "NG" THEN 1 END) as TotalNG 
        FROM (
            SELECT Judge
            FROM camfront
            WHERE TimeInsert BETWEEN "', @DayInMonth, '" AND "', DATE_FORMAT(@DayInMonth, '%Y-%m-%d 23:59:59'),'"
            
            UNION ALL
            
            SELECT Judge
            FROM camback
            WHERE TimeInsert BETWEEN "', @DayInMonth, '" AND "', DATE_FORMAT(@DayInMonth, '%Y-%m-%d 23:59:59'),'"
        ) AS temp;');
	
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET @i = @i + 1;
    END WHILE;
    
SELECT 
    *
FROM
    tempData WHERE TotalOK <> 0 OR TotalNG <> 0;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCamFrontOKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetCamFrontOKNG`(IN DateStart datetime, IN DateEnd datetime, in isRealTime bit)
BEGIN
	DECLARE CountOK INT DEFAULT 0;
    DECLARE CountNG INT DEFAULT 0;
    
	DROP TEMPORARY TABLE IF EXISTS tempIpJudge;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempIpJudge (
        Judge VARCHAR(10)
    );
    
   -- if isRealTime = true then
	-- INSERT INTO tempIpJudge
	-- SELECT
		   -- CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
	-- FROM camfront AS w
	-- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- else
	INSERT INTO tempIpJudge
	SELECT
		   CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
	FROM camfront AS w
	WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- end if;
    
    select COUNT(Judge) into CountOK from tempIpJudge where Judge = 'OK';
    select COUNT(Judge) into CountNG from tempIpJudge where Judge = 'NG';
    
    
    select CountOK, CountNG;
    DROP TEMPORARY TABLE IF EXISTS tempIpJudge;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCamFrontRatioOkNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetCamFrontRatioOkNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotalNG (
			CodeModel VARCHAR(255),
			Judge VARCHAR(10)
		);
    
   
    INSERT INTO tempDataTotalNG
    SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM camfront AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') order by TimeInsert desc limit 1000 ;

    
	SELECT 
		temp.CodeModel AS Code,
		COUNT(CASE
			WHEN temp.Judge = 'NG' THEN 1
		END) AS TotalNG,
		COUNT(CASE
			WHEN temp.Judge = 'OK' THEN 1
		END) AS TotalOK
	FROM
		tempDataTotalNG AS temp
	GROUP BY temp.CodeModel
	ORDER BY (TotalNG + TotalOK) DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCamFrontStackOkNgByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetCamFrontStackOkNgByDate`(IN DateStart DATETIME)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS tempData;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        DayInMonth INT,
        TotalOK INT,
        TotalNG INT
    );

    SET @DateEnd = DAY(last_day(DateStart));
    SET @i = 1;
    
	  SET @today_date = CURDATE();
	  IF MONTH(DateStart) = MONTH(@today_date) AND YEAR(DateStart) = YEAR(@today_date) THEN
	  SET @DateEnd = Day(@today_date);
	  END IF;
    
    
    WHILE @i <= @DateEnd DO
        SET @DayInMonth = DATE(DATE_FORMAT(DateStart, CONCAT('%Y-%m-', @i)));

        SET @sql = CONCAT('INSERT INTO tempData (DayInMonth, TotalOK, TotalNG) SELECT  
            ', @i, ' as DayInMonth,
            Count(case when temp.Judge = "OK" THEN 1 END) as TotalOK,
            Count(case when temp.Judge = "NG" THEN 1 END) as TotalNG 
        FROM (
            SELECT Judge
            FROM camfront
            WHERE TimeInsert BETWEEN "', @DayInMonth, '" AND "', DATE_FORMAT(@DayInMonth, '%Y-%m-%d 23:59:59'),'"
        ) AS temp;');
	
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET @i = @i + 1;
    END WHILE;
    
	SELECT 
		*
	FROM
		tempData  WHERE TotalOK <> 0 OR TotalNG <> 0;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCamFrontTotalNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetCamFrontTotalNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataWi1WithTotalNg;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataWi1WithTotalNg (
        CodeModel VARCHAR(255),
        Judge VARCHAR(10)
    );
    
    -- if isRealTime = true then
    -- INSERT INTO tempDataWi1WithTotalNg
    -- SELECT SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1),
           -- CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    -- FROM camfront AS w
    -- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
    -- else
    INSERT INTO tempDataWi1WithTotalNg
    SELECT  SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1),
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM camfront AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- end if;
    
    SELECT temp.CodeModel, COUNT(*) as TotalNG
    FROM tempDataWi1WithTotalNg AS temp 
    WHERE temp.Judge = 'NG'
    GROUP BY temp.CodeModel
    ORDER BY TotalNG DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataWi1WithTotalNg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCodeModelIot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetCodeModelIot`()
BEGIN
  SELECT DISTINCT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1) AS CodeModel 
    FROM iot 
    WHERE CodeModel IS NOT NULL 
        AND trim(CodeModel) NOT LIKE '' order by CodeModel;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCodeModelWI1Start` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetCodeModelWI1Start`()
BEGIN
  SELECT DISTINCT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1) AS CodeModel 
    FROM wi1start 
    WHERE CodeModel IS NOT NULL 
        AND CodeModel NOT LIKE '' order by CodeModel;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetDataCheckFinalOKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetDataCheckFinalOKNG`(IN DateStart DATETIME, IN DateEnd DATETIME, IN isRealTime BIT)
BEGIN
    -- Create temporary tables
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataCheckFinalJudge (
        Judge VARCHAR(10),
        CodeModel VARCHAR(30)
    );

    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataOK (
        CountOK BIGINT,
        CodeModel VARCHAR(30)
    );

    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataNG (
        CountNG BIGINT,
        CodeModel VARCHAR(30)
    );

    IF isRealTime THEN
        INSERT INTO tempDataCheckFinalJudge
        SELECT Judge_Total, LEFT(SUBSTRING_INDEX(w.CodeBack, '-', -1), 5) AS CodeModel
        FROM datacheckfinal AS w
        WHERE w.CodeBack IS NOT NULL AND TRIM(w.CodeBack) != ''
        ORDER BY TimeUpdate DESC
        LIMIT 1000;
    ELSE
        INSERT INTO tempDataCheckFinalJudge
        SELECT Judge_Total, LEFT(SUBSTRING_INDEX(w.CodeBack, '-', -1), 5) AS CodeModel
        FROM datacheckfinal AS w
        WHERE w.TimeUpdate BETWEEN DateStart AND DateEnd AND w.CodeBack IS NOT NULL AND TRIM(w.CodeBack) != ''
        ORDER BY TimeUpdate DESC
        LIMIT 1000;
    END IF;

    INSERT INTO tempDataOK (CountOK, CodeModel)
    SELECT COUNT(Judge) AS CountOK, CodeModel
    FROM tempDataCheckFinalJudge
    WHERE Judge = 'OK'
    GROUP BY CodeModel;

    INSERT INTO tempDataNG (CountNG, CodeModel)
    SELECT COUNT(Judge) AS CountNG, CodeModel
    FROM tempDataCheckFinalJudge
    WHERE Judge = 'NG'
    GROUP BY CodeModel;


    SELECT o.*, n.CountNG
    FROM tempDataOK o
    LEFT JOIN tempDataNG n ON o.CodeModel = n.CodeModel ORDER BY CodeModel 
  --  UNION ALL
   -- SELECT o.*, n.CountNG
   -- FROM  tempDataNG n
 --   LEFT JOIN tempDataOK o ON o.CodeModel = n.CodeModel
 ;



	
    -- Drop temporary tables
    DROP TEMPORARY TABLE IF EXISTS tempDataCheckFinalJudge;
    DROP TEMPORARY TABLE IF EXISTS tempDataOK;
    DROP TEMPORARY TABLE IF EXISTS tempDataNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetDataCheckFinalTotalNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetDataCheckFinalTotalNG`(IN codeInput varchar(50),IN DateStart datetime, IN DateEnd datetime )
BEGIN
	select SUBSTRING_INDEX( LEFT(CodeBack,8),'-',-1) AS CodeModel, 
	Count(CASE WHEN Judge_VP = 'NG' THEN 1 ELSE null END) AS Vp,
    Count(CASE WHEN Judge_GAS = 'NG' THEN 1 ELSE null END) AS Gas,
    Count(CASE WHEN Judge_WI1START = 'NG' THEN 1 ELSE null END) AS Wi1Start,
    Count(CASE WHEN Judge_IP = 'NG' THEN 1 ELSE null END) AS Ip,
    Count(CASE WHEN Judge_DF = 'NG' THEN 1 ELSE null END) AS Df,
    Count(CASE WHEN Judge_Temp = 'NG' THEN 1 ELSE null END) AS Temp,
    Count(CASE WHEN Judge_IOT = 'NG' THEN 1 ELSE null END) AS IOT,
    Count(CASE WHEN Judge_WI2 = 'NG' THEN 1 ELSE null END) AS Wi2,
    Count(CASE WHEN Judge_PAN = 'NG' THEN 1 ELSE null END) AS Pan,
    Count(CASE WHEN Judge_CAMBACK = 'NG' THEN 1 ELSE null END) AS CamBack,
    Count(CASE WHEN Judge_CAMFRONT = 'NG' THEN 1 ELSE null END) AS CamFront
    from datacheckfinaldetail
    WHERE SUBSTRING_INDEX( LEFT(CodeBack,8),'-',-1) = codeInput
    AND TimeUpDate BETWEEN date_format(DateStart, '%Y-%m-%d 00:00:00') AND date_format(DateEnd, '%Y-%m-%d 23:59:59')
    Group by CodeModel;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetDFOKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetDFOKNG`(IN DateStart datetime, IN DateEnd datetime, in isRealTime bit)
BEGIN
	DECLARE CountOK INT DEFAULT 0;
    DECLARE CountNG INT DEFAULT 0;

    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataDFJudge (
        Judge VARCHAR(10)
    );
    
    -- if isRealTime = true then
    -- INSERT INTO tempDataDFJudge
    -- SELECT
          --  CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    -- FROM df AS w
    -- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
    -- else
    INSERT INTO tempDataDFJudge
    SELECT
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM df AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- end if;
    
    select COUNT(Judge) into CountOK from tempDataDFJudge where Judge = 'OK';
    select COUNT(Judge) into CountNG from tempDataDFJudge where Judge = 'NG';
    
    
    select CountOK, CountNG;
    DROP TEMPORARY TABLE IF EXISTS tempDataDFJudge;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetDFRatioOkNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetDFRatioOkNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotalNG (
			CodeModel VARCHAR(255),
			Judge VARCHAR(10)
		);
    
   
    INSERT INTO tempDataTotalNG
    SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM df AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') order by TimeInsert desc limit 1000 ;

    
	SELECT 
		temp.CodeModel AS Code,
		COUNT(CASE
			WHEN temp.Judge = 'NG' THEN 1
		END) AS TotalNG,
		COUNT(CASE
			WHEN temp.Judge = 'OK' THEN 1
		END) AS TotalOK
	FROM
		tempDataTotalNG AS temp
	GROUP BY temp.CodeModel
	ORDER BY (TotalNG + TotalOK) DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetDFStackOkNgByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetDFStackOkNgByDate`(IN DateStart DATETIME)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS tempData;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        DayInMonth INT,
        TotalOK INT,
        TotalNG INT
    );

    SET @DateEnd = DAY(last_day(DateStart));
    SET @i = 1;
    
	  SET @today_date = CURDATE();
	  IF MONTH(DateStart) = MONTH(@today_date) AND YEAR(DateStart) = YEAR(@today_date) THEN
	  SET @DateEnd = Day(@today_date);
	  END IF;
    
    
    WHILE @i <= @DateEnd DO
        SET @DayInMonth = DATE(DATE_FORMAT(DateStart, CONCAT('%Y-%m-', @i)));

        SET @sql = CONCAT('INSERT INTO tempData (DayInMonth, TotalOK, TotalNG) SELECT  
            ', @i, ' as DayInMonth,
            Count(case when temp.Judge = "OK" THEN 1 END) as TotalOK,
            Count(case when temp.Judge = "NG" THEN 1 END) as TotalNG 
        FROM (
            SELECT Judge
            FROM df
            WHERE TimeInsert BETWEEN "', @DayInMonth, '" AND "', DATE_FORMAT(@DayInMonth, '%Y-%m-%d 23:59:59'),'"
        ) AS temp;');
	
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET @i = @i + 1;
    END WHILE;
    
SELECT 
    *
FROM
    tempData WHERE TotalOK <> 0 OR TotalNG <> 0;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetDFTotalNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetDFTotalNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotalNG (
        CodeModel VARCHAR(255),
        Judge VARCHAR(10)
    );
    
    -- if isRealTime = true then
    -- INSERT INTO tempDataTotalNG
    -- SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1) AS CodeModel ,
           -- CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
   --  FROM df AS w
    -- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
   --  else
    INSERT INTO tempDataTotalNG
    SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM df AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') order by TimeInsert desc limit 1000 ;
	-- end if;
    
    SELECT temp.CodeModel, COUNT(*) as TotalNG
    FROM tempDataTotalNG AS temp 
    WHERE temp.Judge = 'NG'
    GROUP BY temp.CodeModel
    ORDER BY TotalNG DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetDFValueActual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetDFValueActual`(
    IN DateStart DATETIME,
    IN DateEnd DATETIME,
    IN isRealTime BIT,
    IN CodeModelInput TEXT
)
BEGIN
    -- Author:     <LMK>
    -- Create date: <27/12/2023>
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDFValueActual (
        CodeBack VARCHAR(255),
        CodeModel VARCHAR(255),
        ValueActual DECIMAL(18, 2),
        LLValue     DECIMAL(18,2),
        ULValue     DECIMAL(18,2)
    );

    --  IF isRealTime = TRUE THEN
       --   INSERT INTO tempDFValueActual
        --  SELECT
            --  w.CodeBack,
           --   SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1)AS CodeModel,
           --   w.Value,
           --   w.LL,
           --   w.UL
       --   FROM
           --   df AS w
       --   WHERE
           --   (w.CodeBack IS NOT NULL)
            --  AND (TRIM(w.CodeBack) NOT LIKE '')
           --   AND w.Value <> 0
        --  ORDER BY
           --   w.TimeInsert
       --   LIMIT 1000;
    --  ELSE
        INSERT INTO tempDFValueActual
        SELECT
            w.CodeBack ,
             SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1)AS CodeModel,
            w.Value,
            w.LL,
            w.UL
        FROM
            df AS w
        WHERE
            (w.TimeInsert BETWEEN DateStart AND DateEnd)
            AND (w.CodeBack IS NOT NULL)
            AND (TRIM(w.CodeBack) NOT LIKE '')
            AND w.Value <> 0
        ORDER BY
            w.TimeInsert
        LIMIT 1000;
    --  END IF;

    IF CodeModelInput = '' THEN
        SELECT
            t.CodeModel as Code,
            SUM(t.ValueActual) / COUNT(t.ValueActual) AS TotalValue,
            SUM(t.LLValue) / COUNT(t.LLValue) AS LLValue,
            SUM(t.ULValue) / COUNT(t.ULValue) AS ULValue
        FROM
            tempDFValueActual as t
        GROUP BY
            t.CodeModel
		ORDER BY Code;
    ELSE
        SELECT
            t.CodeBack as Code,
            t.ValueActual as TotalValue,
            t.LLValue,
            t.ULValue
        FROM
            tempDFValueActual as t
        WHERE
           -- t.CodeModel = CodeModelInput;
           find_in_set(t.CodeModel,CodeModelInput) > 0
		ORDER BY Code;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tempDFValueActual;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetErrorIOT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetErrorIOT`()
BEGIN
	select distinct ErrorName from iot where  (CodeBack IS NOT NULL) AND ( TRIM(CodeBack) not like '') and judge <> 'Đang in' and ErrorName is not null  ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetFB_OK_NG_Model` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetFB_OK_NG_Model`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotalNG (
			CodeModel VARCHAR(255),
			Judge VARCHAR(10)
		);
    
    INSERT INTO tempDataTotalNG
    select * from (
    SELECT SUBSTRING_INDEX( LEFT(cf.CodeModel,8),'-',-1) AS CodeModel,
           CASE WHEN cf.CodeBack <> CONCAT(TRIM(cf.CodeModel), TRIM(cf.CodeSerial)) THEN 'NG' ELSE cf.Judge END AS Judge
    FROM camfront AS cf
    WHERE (cf.TimeInsert BETWEEN DateStart AND DateEnd) AND (cf.CodeBack IS NOT NULL) AND ( TRIM(cf.CodeBack) not like '') 
    Union all
    SELECT SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM camback AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')
    )as tbl;

    
	SELECT 
		temp.CodeModel AS Code,
		COUNT(CASE
			WHEN temp.Judge = 'NG' THEN 1
		END) AS TotalNG,
		COUNT(CASE
			WHEN temp.Judge = 'OK' THEN 1
		END) AS TotalOK
	FROM
		tempDataTotalNG AS temp
	GROUP BY temp.CodeModel
	order by (TotalNG + TotalOK) DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetFB_TotalErrorByModel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetFB_TotalErrorByModel`(IN DateStart datetime, IN DateEnd datetime, IN TypeE Int)
BEGIN

Set DateStart = date_format(DateStart, '%Y-%m-%d 00:00:00');
Set DateEnd = date_format(DateEnd, '%Y-%m-%d 23:59:59');

	select * from (
	Select tbl1.*,
    VitSidePhai,
	VitSideTrai,
	Hookpan,
	PWE,
	VitPWE,
	InPadComp,
	ClampPipe,
	VitClampPipe,
	BoxPCB,
	VitBoxPCB,
	ChotComp,
	BanhXePhai,
	BanhXeTrai,
	CapPipe,
	RubberPipe,
	InsPadComp,
	DayNoiDat,
	VitDayNoiDatSidePhai,
	WiringDiagram,
	CoverComp,
	VitCoverComp,
	Hanger
		from (
		select SUBSTRING_INDEX( LEFT(CodeBack,8),'-',-1) AS CodeModel, 
		Count(CASE WHEN Econavi = TypeE THEN 1 ELSE null END) AS Econavi,
		Count(CASE WHEN LogoPana = TypeE THEN 1 ELSE null END) AS LogoPana,
		Count(CASE WHEN Japanquality = TypeE THEN 1 ELSE null END) AS Japanquality,
		Count(CASE WHEN Warranty = TypeE THEN 1 ELSE null END) AS Warranty,
		Count(CASE WHEN POPFC = TypeE THEN 1 ELSE null END) AS POPFC,
		Count(CASE WHEN EnergyLabel = TypeE THEN 1 ELSE null END) AS EnergyLabel,
		Count(CASE WHEN PanelDoorFC = TypeE THEN 1 ELSE null END) AS PanelDoorFC,
		Count(CASE WHEN WDLabel = TypeE THEN 1 ELSE null END) AS WDLabel,
		Count(CASE WHEN WD = TypeE THEN 1 ELSE null END) AS WD,
		Count(CASE WHEN DoorControl = TypeE THEN 1 ELSE null END) AS DoorControl,
		Count(CASE WHEN _1ST = TypeE THEN 1 ELSE null END) AS _1ST,
		Count(CASE WHEN Handle = TypeE THEN 1 ELSE null END) AS Handle,
		Count(CASE WHEN POPPCBottom = TypeE THEN 1 ELSE null END) AS POPPCBottom,
		Count(CASE WHEN Wellness = TypeE THEN 1 ELSE null END) AS Wellness,
		Count(CASE WHEN ADVISORYLabel = TypeE THEN 1 ELSE null END) AS ADVISORYLabel,
		Count(CASE WHEN EnvironmentLabel = TypeE THEN 1 ELSE null END) AS EnvironmentLabel,
		Count(CASE WHEN POPBC = TypeE THEN 1 ELSE null END) AS POPBC,
		Count(CASE WHEN CoverHingeTop = TypeE THEN 1 ELSE null END) AS CoverHingeTop,
		Count(CASE WHEN FoamProtectorDoor = TypeE THEN 1 ELSE null END) AS FoamProtectorDoor
		from camfront Where TimePLC BETWEEN DateStart AND DateEnd
		Group by SUBSTRING_INDEX( LEFT(CodeBack,8),'-',-1)) as tbl1
		Left join 
		(select SUBSTRING_INDEX( LEFT(CodeBack,8),'-',-1) AS CodeModel1, 
		Count(CASE WHEN VitSidePhai = TypeE THEN 1 ELSE null END) AS VitSidePhai,
		Count(CASE WHEN VitSideTrai = TypeE THEN 1 ELSE null END) AS VitSideTrai,
		Count(CASE WHEN Hookpan = TypeE THEN 1 ELSE null END) AS Hookpan,
		Count(CASE WHEN PWE = TypeE THEN 1 ELSE null END) AS PWE,
		Count(CASE WHEN VitPWE = TypeE THEN 1 ELSE null END) AS VitPWE,
		Count(CASE WHEN InPadComp = TypeE THEN 1 ELSE null END) AS InPadComp,
		Count(CASE WHEN ClampPipe = TypeE THEN 1 ELSE null END) AS ClampPipe,
		Count(CASE WHEN VitClampPipe = TypeE THEN 1 ELSE null END) AS VitClampPipe,
		Count(CASE WHEN BoxPCB = TypeE THEN 1 ELSE null END) AS BoxPCB,
		Count(CASE WHEN VitBoxPCB = TypeE THEN 1 ELSE null END) AS VitBoxPCB,
		Count(CASE WHEN ChotComp = TypeE THEN 1 ELSE null END) AS ChotComp,
		Count(CASE WHEN BanhXePhai = TypeE THEN 1 ELSE null END) AS BanhXePhai,
		Count(CASE WHEN BanhXeTrai = TypeE THEN 1 ELSE null END) AS BanhXeTrai,
		Count(CASE WHEN CapPipe = TypeE THEN 1 ELSE null END) AS CapPipe,
		Count(CASE WHEN RubberPipe = TypeE THEN 1 ELSE null END) AS RubberPipe,
		Count(CASE WHEN InsPadComp = TypeE THEN 1 ELSE null END) AS InsPadComp,
		Count(CASE WHEN DayNoiDat = TypeE THEN 1 ELSE null END) AS DayNoiDat,
		Count(CASE WHEN VitDayNoiDatSidePhai = TypeE THEN 1 ELSE null END) AS VitDayNoiDatSidePhai,
		Count(CASE WHEN WiringDiagram = TypeE THEN 1 ELSE null END) AS WiringDiagram,
		Count(CASE WHEN CoverComp = TypeE THEN 1 ELSE null END) AS CoverComp,
		Count(CASE WHEN VitCoverComp = TypeE THEN 1 ELSE null END) AS VitCoverComp,
		Count(CASE WHEN Hanger = TypeE THEN 1 ELSE null END) AS Hanger
		from camback Where TimePLC BETWEEN DateStart AND DateEnd
		Group by SUBSTRING_INDEX( LEFT(CodeBack,8),'-',-1)) as tbl2 ON tbl1.CodeModel = tbl2.CodeModel1
	) as tbl
	Order by (Econavi + LogoPana + Japanquality + Warranty + POPFC + EnergyLabel + 
				PanelDoorFC + WDLabel + WD + DoorControl + _1ST + Handle + POPPCBottom + Wellness +
				ADVISORYLabel + EnvironmentLabel + POPBC + CoverHingeTop + FoamProtectorDoor +
				VitSidePhai + VitSideTrai + Hookpan + PWE + VitPWE + InPadComp + ClampPipe + VitClampPipe + BoxPCB + VitBoxPCB + 
				ChotComp + BanhXePhai + BanhXeTrai + CapPipe + RubberPipe + InsPadComp + DayNoiDat + VitDayNoiDatSidePhai + 
				WiringDiagram + CoverComp + VitCoverComp + Hanger) DESC
	limit 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetFB_TotalModelByError` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetFB_TotalModelByError`(IN DateStart datetime, IN DateEnd datetime, IN TypeE Int)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS tempFB;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempFB (
		CodeModel VARCHAR(5),
		Econavi INT,
		LogoPana INT,
		Japanquality INT,
		Warranty INT,
		POPFC INT,
		EnergyLabel INT,
		PanelDoorFC INT,
		WDLabel INT,
		WD INT,
		DoorControl INT,
		_1ST INT,
		Handle INT,
		POPPCBottom INT,
		Wellness INT,
		ADVISORYLabel INT,
		EnvironmentLabel INT,
		POPBC INT,
		CoverHingeTop INT,
		FoamProtectorDoor INT,
		VitSidePhai INT,
		VitSideTrai INT,
		Hookpan INT,
		PWE INT,
		VitPWE INT,
		InPadComp INT,
		ClampPipe INT,
		VitClampPipe INT,
		BoxPCB INT,
		VitBoxPCB INT,
		ChotComp INT,
		BanhXePhai INT,
		BanhXeTrai INT,
		CapPipe INT,
		RubberPipe INT,
		InsPadComp INT,
		DayNoiDat INT,
		VitDayNoiDatSidePhai INT,
		WiringDiagram INT,
		CoverComp INT,
		VitCoverComp INT,
		Hanger INT);
    
    Insert Into tempFB
    select * from (
	Select tbl1.*,
    VitSidePhai,
	VitSideTrai,
	Hookpan,
	PWE,
	VitPWE,
	InPadComp,
	ClampPipe,
	VitClampPipe,
	BoxPCB,
	VitBoxPCB,
	ChotComp,
	BanhXePhai,
	BanhXeTrai,
	CapPipe,
	RubberPipe,
	InsPadComp,
	DayNoiDat,
	VitDayNoiDatSidePhai,
	WiringDiagram,
	CoverComp,
	VitCoverComp,
	Hanger
		from (
		select SUBSTRING_INDEX( LEFT(CodeBack,8),'-',-1) AS CodeModel, 
		Count(CASE WHEN Econavi = TypeE THEN 1 ELSE null END) AS Econavi,
		Count(CASE WHEN LogoPana = TypeE THEN 1 ELSE null END) AS LogoPana,
		Count(CASE WHEN Japanquality = TypeE THEN 1 ELSE null END) AS Japanquality,
		Count(CASE WHEN Warranty = TypeE THEN 1 ELSE null END) AS Warranty,
		Count(CASE WHEN POPFC = TypeE THEN 1 ELSE null END) AS POPFC,
		Count(CASE WHEN EnergyLabel = TypeE THEN 1 ELSE null END) AS EnergyLabel,
		Count(CASE WHEN PanelDoorFC = TypeE THEN 1 ELSE null END) AS PanelDoorFC,
		Count(CASE WHEN WDLabel = TypeE THEN 1 ELSE null END) AS WDLabel,
		Count(CASE WHEN WD = TypeE THEN 1 ELSE null END) AS WD,
		Count(CASE WHEN DoorControl = TypeE THEN 1 ELSE null END) AS DoorControl,
		Count(CASE WHEN _1ST = TypeE THEN 1 ELSE null END) AS _1ST,
		Count(CASE WHEN Handle = TypeE THEN 1 ELSE null END) AS Handle,
		Count(CASE WHEN POPPCBottom = TypeE THEN 1 ELSE null END) AS POPPCBottom,
		Count(CASE WHEN Wellness = TypeE THEN 1 ELSE null END) AS Wellness,
		Count(CASE WHEN ADVISORYLabel = TypeE THEN 1 ELSE null END) AS ADVISORYLabel,
		Count(CASE WHEN EnvironmentLabel = TypeE THEN 1 ELSE null END) AS EnvironmentLabel,
		Count(CASE WHEN POPBC = TypeE THEN 1 ELSE null END) AS POPBC,
		Count(CASE WHEN CoverHingeTop = TypeE THEN 1 ELSE null END) AS CoverHingeTop,
		Count(CASE WHEN FoamProtectorDoor = TypeE THEN 1 ELSE null END) AS FoamProtectorDoor
		from camfront Where TimePLC BETWEEN DateStart AND DateEnd
		Group by CodeModel) as tbl1
		Left join 
		(select SUBSTRING_INDEX( LEFT(CodeBack,8),'-',-1) AS CodeModel1, 
		Count(CASE WHEN VitSidePhai = TypeE THEN 1 ELSE null END) AS VitSidePhai,
		Count(CASE WHEN VitSideTrai = TypeE THEN 1 ELSE null END) AS VitSideTrai,
		Count(CASE WHEN Hookpan = TypeE THEN 1 ELSE null END) AS Hookpan,
		Count(CASE WHEN PWE = TypeE THEN 1 ELSE null END) AS PWE,
		Count(CASE WHEN VitPWE = TypeE THEN 1 ELSE null END) AS VitPWE,
		Count(CASE WHEN InPadComp = TypeE THEN 1 ELSE null END) AS InPadComp,
		Count(CASE WHEN ClampPipe = TypeE THEN 1 ELSE null END) AS ClampPipe,
		Count(CASE WHEN VitClampPipe = TypeE THEN 1 ELSE null END) AS VitClampPipe,
		Count(CASE WHEN BoxPCB = TypeE THEN 1 ELSE null END) AS BoxPCB,
		Count(CASE WHEN VitBoxPCB = TypeE THEN 1 ELSE null END) AS VitBoxPCB,
		Count(CASE WHEN ChotComp = TypeE THEN 1 ELSE null END) AS ChotComp,
		Count(CASE WHEN BanhXePhai = TypeE THEN 1 ELSE null END) AS BanhXePhai,
		Count(CASE WHEN BanhXeTrai = TypeE THEN 1 ELSE null END) AS BanhXeTrai,
		Count(CASE WHEN CapPipe = TypeE THEN 1 ELSE null END) AS CapPipe,
		Count(CASE WHEN RubberPipe = TypeE THEN 1 ELSE null END) AS RubberPipe,
		Count(CASE WHEN InsPadComp = TypeE THEN 1 ELSE null END) AS InsPadComp,
		Count(CASE WHEN DayNoiDat = TypeE THEN 1 ELSE null END) AS DayNoiDat,
		Count(CASE WHEN VitDayNoiDatSidePhai = TypeE THEN 1 ELSE null END) AS VitDayNoiDatSidePhai,
		Count(CASE WHEN WiringDiagram = TypeE THEN 1 ELSE null END) AS WiringDiagram,
		Count(CASE WHEN CoverComp = TypeE THEN 1 ELSE null END) AS CoverComp,
		Count(CASE WHEN VitCoverComp = TypeE THEN 1 ELSE null END) AS VitCoverComp,
		Count(CASE WHEN Hanger = TypeE THEN 1 ELSE null END) AS Hanger
		from camback Where TimePLC BETWEEN DateStart AND DateEnd
		Group by CodeModel) as tbl2 ON tbl1.CodeModel = tbl2.CodeModel1
	) as tbl
    Group By CodeModel;
    SET @row_count = (SELECT FOUND_ROWS() AS row_count);
    
    if @row_count = 0 then select 0 as Error;
    else
    DROP TEMPORARY TABLE IF EXISTS unpivoteddata;
	CREATE TEMPORARY TABLE IF NOT EXISTS unpivoteddata (
		CodeModel VARCHAR(5),
        ErrorName nvarchar(250),
        TotalErr INT);
        
    INSERT INTO unpivoteddata 
    SELECT CodeModel, 'Econavi' col, Econavi 
	FROM tempFB WHERE Econavi <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'LogoPana' col, LogoPana 
	FROM tempFB WHERE LogoPana <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'Japanquality' col, Japanquality 
	FROM tempFB WHERE Japanquality <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'Warranty' col, Warranty 
	FROM tempFB WHERE Warranty <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'POPFC' col, POPFC 
	FROM tempFB WHERE POPFC <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'EnergyLabel' col, EnergyLabel 
	FROM tempFB WHERE EnergyLabel <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'PanelDoorFC' col, PanelDoorFC 
	FROM tempFB WHERE PanelDoorFC <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'WDLabel' col, WDLabel 
	FROM tempFB WHERE WDLabel <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'WD' col, WD 
	FROM tempFB WHERE WD <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'DoorControl' col, DoorControl 
	FROM tempFB WHERE DoorControl <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, '_1ST' col, _1ST 
	FROM tempFB WHERE _1ST <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'Handle' col, Handle 
	FROM tempFB WHERE Handle <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'POPPCBottom' col, POPPCBottom 
	FROM tempFB WHERE POPPCBottom <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'Wellness' col, Wellness 
	FROM tempFB WHERE Wellness <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'ADVISORYLabel' col, ADVISORYLabel 
	FROM tempFB WHERE ADVISORYLabel <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'EnvironmentLabel' col, EnvironmentLabel 
	FROM tempFB WHERE EnvironmentLabel <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'POPBC' col, POPBC 
	FROM tempFB WHERE POPBC <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'CoverHingeTop' col, CoverHingeTop 
	FROM tempFB WHERE CoverHingeTop <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'FoamProtectorDoor' col, FoamProtectorDoor 
	FROM tempFB WHERE FoamProtectorDoor <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'VitSidePhai' col, VitSidePhai 
	FROM tempFB WHERE VitSidePhai <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'VitSideTrai' col, VitSideTrai 
	FROM tempFB WHERE VitSideTrai <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'Hookpan' col, Hookpan 
	FROM tempFB WHERE Hookpan <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'PWE' col, PWE 
	FROM tempFB WHERE PWE <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'VitPWE' col, VitPWE 
	FROM tempFB WHERE VitPWE <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'InPadComp' col, InPadComp 
	FROM tempFB WHERE InPadComp <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'ClampPipe' col, ClampPipe 
	FROM tempFB WHERE ClampPipe <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'VitClampPipe' col, VitClampPipe 
	FROM tempFB WHERE VitClampPipe <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'BoxPCB' col, BoxPCB 
	FROM tempFB WHERE BoxPCB <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'VitBoxPCB' col, VitBoxPCB 
	FROM tempFB WHERE VitBoxPCB <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'ChotComp' col, ChotComp 
	FROM tempFB WHERE ChotComp <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'BanhXePhai' col, BanhXePhai 
	FROM tempFB WHERE BanhXePhai <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'BanhXeTrai' col, BanhXeTrai 
	FROM tempFB WHERE BanhXeTrai <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'CapPipe' col, CapPipe 
	FROM tempFB WHERE CapPipe <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'RubberPipe' col, RubberPipe 
	FROM tempFB WHERE RubberPipe <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'InsPadComp' col, InsPadComp 
	FROM tempFB WHERE InsPadComp <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'DayNoiDat' col, DayNoiDat 
	FROM tempFB WHERE DayNoiDat <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'VitDayNoiDatSidePhai' col, VitDayNoiDatSidePhai 
	FROM tempFB WHERE VitDayNoiDatSidePhai <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'WiringDiagram' col, WiringDiagram 
	FROM tempFB WHERE WiringDiagram <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'CoverComp' col, CoverComp 
	FROM tempFB WHERE CoverComp <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'VitCoverComp' col, VitCoverComp 
	FROM tempFB WHERE VitCoverComp <> 0;
	INSERT INTO unpivoteddata 
	SELECT CodeModel, 'Hanger' col, Hanger 
	FROM tempFB WHERE Hanger <> 0;	
    
  SET @colErrorName = null;
    SET @sql = NULL;
CREATE TEMPORARY TABLE IF NOT EXISTS intermediateTable (ErrorName TEXT, DynamicSQL MEDIUMTEXT);
	SELECT 
		GROUP_CONCAT(DISTINCT CodeModel) AS DynamicSQL
	INTO @colErrorName FROM unpivoteddata;
    SET @colErrorName = REPLACE(@colErrorName , ",", "+");
    SELECT 
		GROUP_CONCAT(DISTINCT CONCAT('SUM(CASE WHEN CodeModel = "',
					CodeModel,
					'" THEN TotalErr ELSE 0 END) AS ',
					CodeModel)) AS DynamicSQL
	INTO @sql FROM unpivoteddata;
	SET
	   @sql = CONCAT('SELECT ErrorName AS ErrorName, ', @sql, ' FROM unpivoteddata GROUP BY ErrorName ORDER BY (', @colErrorName,') DESC Limit 10');
	PREPARE stmt 
	FROM
	   @sql;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
    
	END IF;
	DROP TEMPORARY TABLE IF EXISTS intermediateTable;
    DROP TEMPORARY TABLE IF EXISTS tempFB;
    DROP TEMPORARY TABLE IF EXISTS unpivoteddata;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetGas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetGas`(	
	IN DateStart DATETIME,
    IN DateEnd DATETIME,
    IN isRealTime bool,
    IN CodeModel text)
BEGIN
	-- Created by: Lã Ngọc Hải
-- Created date: 25/12/2023
-- Description: lấy tất cả gas để view vào chart.
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataGas (
        CodeBack VARCHAR(255),
        CodeModel VARCHAR(255),
        GAS DECIMAL(18, 2),
        GASSpec DECIMAL(18, 2)
    );
   
        INSERT INTO tempDataGas (CodeBack,CodeModel,GAS,GASSpec)
        SELECT
            g.CodeBack,
            SUBSTRING_INDEX( LEFT(g.CodeModel,8),'-',-1)AS CodeModel,
            g.GAS,
            g.GASSpec
        FROM
            gas AS g
        WHERE
            (g.TimePLC BETWEEN DateStart AND DateEnd)
            AND (g.CodeBack IS NOT NULL)
            AND (TRIM(g.CodeBack) NOT LIKE '')
        ORDER BY
            g.TimePLC desc;
   
   IF CodeModel = '' THEN
        SELECT
            t.CodeModel as Code,
            AVG(t.GAS) as GAS,
            AVG(t.GASSpec) as GASSpec
        FROM
            tempDataGas as t
        GROUP BY
            t.CodeModel order by GAS DESC;
    ELSE
        SELECT
            t.CodeBack as Code,
            t.GAS,
            t.GASSpec
        FROM
            tempDataGas as t
        WHERE
           find_in_set(t.CodeModel,CodeModel) > 0 order by GAS DESC;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tempDataGas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetGasAndOil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetGasAndOil`( 
	IN DateStart DATETIME,
    IN DateEnd DATETIME,
    IN isRealTime bool,
    IN CodeModel VARCHAR(30))
BEGIN
-- Created by: Lã Ngọc Hải
-- Created date: 25/12/2023
-- Description: lấy tất cả gas để view vào chart.
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        CodeBack VARCHAR(255),
        CodeModel VARCHAR(255),
        OIL DECIMAL(18, 2),
        OILSpec DECIMAL(18, 2),
        GAS DECIMAL(18, 2),
        GASSpec DECIMAL(18, 2)
    );
    IF isRealTime THEN
        INSERT INTO tempData
        SELECT
            g.CodeBack,
              SUBSTRING_INDEX( LEFT(g.CodeModel,8),'-',-1)AS CodeModel,
            g.OIL,
            g.OILSpec,
            g.GAS,
            g.GASSpec
        FROM
            gas AS g
        WHERE
            (g.CodeBack IS NOT NULL)
            AND (TRIM(g.CodeBack) NOT LIKE '')
        ORDER BY
            g.TimeInsert desc
        LIMIT 1000;
    ELSE
        INSERT INTO tempData
        SELECT
            g.CodeBack,
            SUBSTRING_INDEX( LEFT(g.CodeModel,8),'-',-1)AS CodeModel,
            g.OIL,
            g.OILSpec,
            g.GAS,
            g.GASSpec
        FROM
            gas AS g
        WHERE
            (g.TimeInsert BETWEEN DateStart AND DateEnd)
            AND (g.CodeBack IS NOT NULL)
            AND (TRIM(g.CodeBack) NOT LIKE '')
        ORDER BY
            g.TimeInsert desc
        LIMIT 1000;
    END IF;
    
   IF CodeModel = '' THEN
        SELECT
            t.CodeModel,
            AVG(t.OIL) as OIL,
            AVG(t.OILSpec) as OILSpec,
            AVG(t.GAS) as GAS,
            AVG(t.GASSpec) as GASSpec
        FROM
            tempData as t
        GROUP BY
            t.CodeModel;
    ELSE
        SELECT
            t.CodeBack,
			t.OIL,
            t.OILSpec,
            t.GAS,
            t.GASSpec
        FROM
            tempData as t
        WHERE
            t.CodeModel = CodeModel; 
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetGasCodeModels` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetGasCodeModels`()
begin
-- Created by: Lã Ngọc Hải
-- Created date: 25/12/2023
-- Description: lấy tất cả CodeModel để người dùng lựa chọn.
select   SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1)AS CodeModel from gas as g
where g.CodeModel is not null and g.CodeModel not like ""
group by g.CodeModel 
order by CodeModel;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetIotErrorStats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetIotErrorStats`(IN DateStart DATETIME, IN DateEnd DATETIME, IN isRealTime BIT)
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataIotError (
        Judge varchar(10) ,
        ErrorName VARCHAR(550)
    );

    IF isRealTime = TRUE THEN
        INSERT INTO tempDataIotError
        SELECT
            CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge,
            w.ErrorName
        FROM iot AS w
        WHERE (w.CodeBack IS NOT NULL) AND (TRIM(w.CodeBack) NOT LIKE '') ORDER BY TimePLC DESC LIMIT 1000;
    ELSE
        INSERT INTO tempDataIotError
        SELECT
              CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge,
            w.ErrorName
        FROM iot AS w
        WHERE (w.TimePLC BETWEEN DateStart AND DateEnd)
            AND (w.CodeBack IS NOT NULL) AND (TRIM(w.CodeBack) NOT LIKE '') ORDER BY TimePLC DESC LIMIT 1000;
    END IF;
SELECT 
   sum(CASE WHEN Judge = 'OK' THEN 1 else 0 END) AS OK,
	sum(CASE WHEN Judge = 'NG' THEN 1 else 0 END) AS NG,
    ErrorName
FROM
    tempDataIotError
WHERE
    ErrorName IS NOT NULL
        AND ErrorName != ''
       and judge <> 'Đang in'
GROUP BY ErrorName;


    DROP TEMPORARY TABLE IF EXISTS tempDataIotError;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetIotOKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetIotOKNG`(IN DateStart DATETIME, IN DateEnd DATETIME, IN isRealTime BIT)
BEGIN
    DECLARE CountOK INT DEFAULT 0;
    DECLARE CountNG INT DEFAULT 0;

    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataiotOKNG (
        Judge VARCHAR(10)
    );

    IF isRealTime = 1 THEN
        INSERT INTO tempDataiotOKNG
        SELECT
            CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
        FROM iot AS w
        WHERE (w.CodeBack IS NOT NULL) AND (TRIM(w.CodeBack) NOT LIKE '') ORDER BY TimePLC DESC LIMIT 1000;
    ELSE
        INSERT INTO tempDataiotOKNG
        SELECT
            CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
        FROM iot AS w
        WHERE (w.TimePLC BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND (TRIM(w.CodeBack) NOT LIKE '') ORDER BY TimePLC DESC LIMIT 1000;
    END IF;

    SELECT COUNT(Judge) INTO CountOK FROM tempDataiotOKNG WHERE Judge = 'OK';
    SELECT COUNT(Judge) INTO CountNG FROM tempDataiotOKNG WHERE Judge = 'NG';

    SELECT CountOK, CountNG;

    DROP TEMPORARY TABLE IF EXISTS tempDataiotOKNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetIotTotalNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetIotTotalNG`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
   CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotal (
        CodeModel VARCHAR(255),
        Judge VARCHAR(10)
    );
    
    if isRealTime = true then
    INSERT INTO tempDataTotal
    SELECT   SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM iot AS w
    WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimePLC desc limit 1000 ;
    else
    INSERT INTO tempDataTotal
    SELECT   SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM iot AS w
    WHERE (w.TimePLC BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimePLC desc limit 1000 ;
	end if;
    
    SELECT temp.CodeModel, COUNT(*) as TotalNG
    FROM tempDataTotal AS temp 
    WHERE temp.Judge = 'NG'
    GROUP BY temp.CodeModel
    ORDER BY TotalNG DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetIpOKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetIpOKNG`(IN DateStart datetime, IN DateEnd datetime, in isRealTime bit)
BEGIN
	DECLARE CountOK INT DEFAULT 0;
    DECLARE CountNG INT DEFAULT 0;

    CREATE TEMPORARY TABLE IF NOT EXISTS tempIpJudge (
        Judge VARCHAR(10)
    );
    
    -- if isRealTime = true then
    -- INSERT INTO tempIpJudge
    -- SELECT
           -- CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    -- FROM ip AS w
    -- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
    -- else
    INSERT INTO tempIpJudge
    SELECT
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM ip AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- end if;
    
    select COUNT(Judge) into CountOK from tempIpJudge where Judge = 'OK';
    select COUNT(Judge) into CountNG from tempIpJudge where Judge = 'NG';
    
    
    select CountOK, CountNG;
    DROP TEMPORARY TABLE IF EXISTS tempIpJudge;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetIpRatioOkNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetIpRatioOkNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotalNG (
			CodeModel VARCHAR(255),
			Judge VARCHAR(10)
		);
    
   
    INSERT INTO tempDataTotalNG
    SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM ip AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') order by TimeInsert desc limit 1000 ;

    
	SELECT 
		temp.CodeModel AS Code,
		COUNT(CASE
			WHEN temp.Judge = 'NG' THEN 1
		END) AS TotalNG,
		COUNT(CASE
			WHEN temp.Judge = 'OK' THEN 1
		END) AS TotalOK
	FROM
		tempDataTotalNG AS temp
	GROUP BY temp.CodeModel
	ORDER BY (TotalNG + TotalOK) DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetIpStackOkNgByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetIpStackOkNgByDate`(IN StartDate DATETIME)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS tempData;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        DayInMonth INT,
        TotalOK INT,
        TotalNG INT
    );

    SET @DateEnd = DAY(last_day(StartDate));
    SET @i = 1;
    
	  SET @today_date = CURDATE();
	  IF MONTH(StartDate) = MONTH(@today_date) AND YEAR(StartDate) = YEAR(@today_date) THEN
	  SET @DateEnd = Day(@today_date);
	  END IF;
    
    
    WHILE @i <= @DateEnd DO
        SET @DayInMonth = DATE(DATE_FORMAT(StartDate, CONCAT('%Y-%m-', @i)));

        SET @sql = CONCAT('INSERT INTO tempData (DayInMonth, TotalOK, TotalNG) SELECT  
            ', @i, ' as DayInMonth,
            Count(case when temp.Judge = "OK" THEN 1 END) as TotalOK,
            Count(case when temp.Judge = "NG" THEN 1 END) as TotalNG 
        FROM (
            SELECT Judge
            FROM ip
            WHERE TimeInsert BETWEEN "', @DayInMonth, '" AND "', DATE_FORMAT(@DayInMonth, '%Y-%m-%d 23:59:59'),'"
        ) AS temp;');
	
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET @i = @i + 1;
    END WHILE;
    
SELECT 
    *
FROM
    tempData WHERE TotalOK <> 0 OR TotalNG <> 0;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetIpTotalNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetIpTotalNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataIpTotalNG (
        CodeModel VARCHAR(255),
        Judge VARCHAR(10)
    );
    
   -- if isRealTime = true then
	-- INSERT INTO tempDataIpTotalNG
	-- SELECT   SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1)AS CodeModel,
		   -- CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
	-- FROM ip AS w
	-- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- else
	INSERT INTO tempDataIpTotalNG
	SELECT   SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1)AS CodeModel,
		   CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
	FROM ip AS w
	WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') order by TimeInsert desc limit 1000 ;
	-- end if;
    
    SELECT temp.CodeModel, COUNT(*) as TotalNG
    FROM tempDataIpTotalNG AS temp 
    WHERE temp.Judge = 'NG'
    GROUP BY temp.CodeModel
    ORDER BY TotalNG DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataIpTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetIpValueActual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetIpValueActual`(
    IN DateStart DATETIME,
    IN DateEnd DATETIME,
    IN isRealTime BIT,
    IN CodeModelInput TEXT
)
BEGIN
    -- Author:     <LMK>
    -- Create date: <27/12/2023>
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataIpValue (
        CodeBack VARCHAR(255),
        CodeModel VARCHAR(255),
        ValueActual DECIMAL(18, 2),
        LLValue     DECIMAL(18,2),
        ULValue     DECIMAL(18,2)
    );

    -- IF isRealTime = TRUE THEN
        -- INSERT INTO tempDataIpValue
        -- SELECT
           --  w.CodeBack,
            --  SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1)AS CodeModel,
           -- w.Value,
           --  w.LL,
           --  w.UL
       --  FROM
           --  ip AS w
       --  WHERE
           --  (w.CodeBack IS NOT NULL)
           --  AND (TRIM(w.CodeBack) NOT LIKE '')
           --  AND w.Value <> 0
        -- ORDER BY
           --  w.TimeInsert
        -- LIMIT 1000;
    -- ELSE
        INSERT INTO tempDataIpValue
        SELECT
            w.CodeBack ,
              SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1)AS CodeModel,
            w.Value,
            w.LL,
            w.UL
        FROM
            ip AS w
        WHERE
            (w.TimeInsert BETWEEN DateStart AND DateEnd)
            AND (w.CodeBack IS NOT NULL)
            AND (TRIM(w.CodeBack) NOT LIKE '')
            AND w.Value <> 0
        ORDER BY
            w.TimeInsert
        LIMIT 1000;
    -- END IF;

    IF CodeModelInput = '' THEN
        SELECT
            t.CodeModel as Code,
            SUM(t.ValueActual) / COUNT(t.ValueActual) AS TotalValue,
            SUM(t.LLValue) / COUNT(t.LLValue) AS LLValue,
            SUM(t.ULValue) / COUNT(t.ULValue) AS ULValue
        FROM
            tempDataIpValue as t
        GROUP BY
            t.CodeModel
		ORDER BY Code;
    ELSE
        SELECT
            t.CodeBack as Code,
            t.ValueActual as TotalValue,
            t.LLValue,
            t.ULValue
        FROM
            tempDataIpValue as t
        WHERE
           -- t.CodeModel = CodeModelInput;
           find_in_set(t.CodeModel,CodeModelInput) > 0
		ORDER BY Code;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tempDataIpValue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetNGPendingAgingCol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetNGPendingAgingCol`(DateStart datetime,DateEnd datetime)
BEGIN
	-- Created by: Khánh
-- Created date: 02/01/2024
-- Description: lấy tất cả NG/Pending trong ngày để view vào chart.

select cast( IFNULL(NG, 0) as signed) AS NG,Cast(  IFNULL(Pending, 0) as signed) AS Pending, TableName  from(
 SELECT
    COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'VP'as TableName
FROM vp AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL
SELECT
    COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'GAS'as TableName
FROM gas AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL
SELECT
   COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'Wi1 (Start)' as TableName
FROM wi1start AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL
SELECT
    COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'Wi1 (With)' AS TableName
FROM wi1with AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL
SELECT
   COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'IP'as TableName
FROM ip AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL

SELECT
    COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'DF' as TableName
FROM df AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL
SELECT
   COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'Wi2' as TableName
FROM wi2 AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL
SELECT
     COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'Temp'as TableName
FROM tempresult AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL
SELECT
 COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) <> 'NG' and (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) <> 'OK'  THEN 1 ELSE 0 END), 0) AS Pending,
    'IOT'as TableName
FROM iot AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL
SELECT
     COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'Phiếu sửa tủ' as TableName
FROM suatu AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL
SELECT
    COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'Pan' as TableName
FROM pan AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL
SELECT
     COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'Camera back' as TableName
FROM camback AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL
SELECT
   COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'Camera front' as TableName
FROM camfront AS w
WHERE (w.TimePLC between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
UNION ALL
SELECT
   COALESCE(SUM(CASE WHEN Judge_Total = 'NG' THEN 1 ELSE 0 END), 0) AS NG,
        COALESCE(SUM(CASE WHEN Judge_Total = 'PD' THEN 1 ELSE 0 END), 0) AS Pending,
    'Final check' as TableName
FROM datacheckfinal AS w
WHERE (w.TimeUpdate between DateStart and DateEnd)
    AND (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
) as T;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetNGPendingLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetNGPendingLine`(YearInput int,MonthInput int)
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS temp_dates (
    date_value DATE
);
CREATE TEMPORARY TABLE IF NOT EXISTS tempDataOKNGLineDashoboard (
        NG bigint,
        Pending bigint,
        OK bigint,
        DateInsert date
);

insert into tempDataOKNGLineDashoboard
select sum(NG), sum(Pending),sum(OK),DateInsert from (

SELECT
    SUM(CASE WHEN Judge_Total = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN Judge_Total = 'PD' THEN 1 ELSE 0 END) AS Pending,
    SUM(CASE WHEN Judge_Total = 'OK' THEN 1 ELSE 0 END) AS OK,
	date( w.TimeUpdate) as DateInsert
FROM datacheckfinal AS w
WHERE (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
group by date( w.TimeUpdate)
union all
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END) AS Pending,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
	date( w.TimePLC) as DateInsert
FROM wi1start AS w
WHERE (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')
group by date( w.TimePLC)
union all
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END) AS Pending,
     SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
date( w.TimePLC) as DateInsert
FROM wi1with AS w
WHERE (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')group by date( w.TimePLC)
union all 
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END) AS Pending,
     SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
date( w.TimePLC) as DateInsert
FROM wi2 AS w
WHERE  (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')group by date( w.TimePLC)
union all
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END) AS Pending,
     SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
   date( w.TimePLC) as DateInsert
FROM vp AS w
WHERE(w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')group by date( w.TimePLC)
union all
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END) AS Pending,
     SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
    date( w.TimePLC) as DateInsert
FROM gas AS w
WHERE (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')group by date( w.TimePLC)
union all
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END) AS Pending,
     SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
   date( w.TimePLC) as DateInsert
FROM ip AS w
WHERE (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')group by date( w.TimePLC)
union all
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END) AS Pending,
     SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
   date( w.TimePLC) as DateInsert
FROM df AS w
WHERE  (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')group by date( w.TimePLC)
union all
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END) AS Pending,
     SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
  date( w.TimePLC) as DateInsert
FROM tempresult AS w
WHERE (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')group by date( w.TimePLC)
union all 
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) <> 'NG' and (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) <> 'OK'  THEN 1 ELSE 0 END) AS Pending,
     SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
    date( w.TimePLC) as DateInsert
FROM iot AS w
WHERE  (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')group by date( w.TimePLC)
union all
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END) AS Pending,
     SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
  date( w.TimePLC) as DateInsert
FROM suatu AS w
WHERE  (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')group by date( w.TimePLC)
union all
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END) AS Pending,
     SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
  date( w.TimePLC) as DateInsert
FROM pan AS w
WHERE  (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')group by date( w.TimePLC)
union all
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END) AS Pending,
     SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
   date( w.TimePLC) as DateInsert
FROM camback AS w
WHERE  (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '')group by date( w.TimePLC)
union all
SELECT
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'NG' THEN 1 ELSE 0 END) AS NG,
    SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'PD' THEN 1 ELSE 0 END) AS Pending,
     SUM(CASE WHEN (CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END) = 'OK' THEN 1 ELSE 0 END) AS OK,
  date( w.TimePLC) as DateInsert
FROM camfront AS w
WHERE  (w.CodeBack IS NOT NULL)
    AND (TRIM(w.CodeBack) NOT LIKE '') group by date( w.TimePLC)
) as T group by DateInsert;


WITH RECURSIVE date_recursive AS (
    SELECT DATE(CONCAT(YearInput, '-', MonthInput, '-01')) AS date_value
    UNION ALL
    SELECT DATE_ADD(date_value, INTERVAL 1 DAY)
    FROM date_recursive
    WHERE 
        (
            (MONTH(DATE_ADD(date_value, INTERVAL 1 DAY)) = MonthInput
            AND YEAR(DATE_ADD(date_value, INTERVAL 1 DAY)) = YearInput)
            OR
            (MONTH(DATE_ADD(date_value, INTERVAL 1 DAY)) = MONTH(NOW())
            AND YEAR(DATE_ADD(date_value, INTERVAL 1 DAY)) = YEAR(NOW())
            AND DATE_ADD(date_value, INTERVAL 1 DAY) <= CURDATE())
        )
)
SELECT distinct d.date_value,t.* FROM date_recursive d left join tempDataOKNGLineDashoboard t on d.date_value = t.DateInsert
 WHERE date_value <= curdate() limit 31
;

-- Xóa bảng tạm
DROP TEMPORARY TABLE IF EXISTS tempDataOKNGLineDashoboard;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetOil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetOil`(	IN DateStart DATETIME,
    IN DateEnd DATETIME,
    IN isRealTime bool,
    IN CodeModel text)
BEGIN
	-- Created by: Khánh
-- Created date: 25/12/2023
-- Description: lấy tất cả gas để view vào chart.
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataOil (
        CodeBack VARCHAR(255),
        CodeModel VARCHAR(255),
        OIL DECIMAL(18, 2),
        OILSpec DECIMAL(18, 2)
    );
    
        INSERT INTO tempDataOil
        SELECT
            g.CodeBack,
            SUBSTRING_INDEX( LEFT(g.CodeModel,8),'-',-1)AS CodeModel,
            g.OIL,
            g.OILSpec
        FROM
            gas AS g
        WHERE
            (g.TimePLC BETWEEN DateStart AND DateEnd)
            AND (g.CodeBack IS NOT NULL)
            AND (TRIM(g.CodeBack) NOT LIKE '')
        ORDER BY
            g.TimePLC desc;
  
    
   IF CodeModel = '' THEN
        SELECT
            t.CodeModel as Code,
            AVG(t.OIL) as OIL,
            AVG(t.OILSpec) as OILSpec
        FROM
            tempDataOil as t
        GROUP BY
            t.CodeModel order by OIL DESC;
    ELSE
        SELECT
            t.CodeBack as Code,
			t.OIL,
            t.OILSpec
        FROM
            tempDataOil as t
        WHERE
            find_in_set(t.CodeModel,CodeModel) > 0  order by OIL DESC;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tempDataOil;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetOkNgByMonth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetOkNgByMonth`(IN StartDate DATETIME)
BEGIN
	
    
    DROP TEMPORARY TABLE IF EXISTS tempDataResult;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataResult (
        CountOk bigint,
        CountNg bigint,
        MonthInYear datetime
    );
    
    INSERT INTO tempDataResult
    select * from(
		SELECT COALESCE(Sum(CountOk), 0) as CountOk, COALESCE(Sum(TotalCount - CountOk), 0) as CountNg, TimePLC FROM  (
        SELECT  COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM vp WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        UNION ALL
        SELECT  COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM gas WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        UNION ALL
        SELECT COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM wi1start WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        UNION ALL
        SELECT COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM wi1with WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        UNION ALL
        SELECT  COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM ip WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        UNION ALL
        SELECT  COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM df WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        UNION ALL
        SELECT  COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM wi2 WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        UNION ALL
        SELECT  COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM tempresult WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        UNION ALL
        SELECT  COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM iot WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        UNION ALL
        SELECT COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM suatu WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        UNION ALL
        SELECT  COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM pan WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        UNION ALL
        SELECT COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM camback WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        UNION ALL
		SELECT COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount, DATE_FORMAT(TimePLC,'%Y-%m-01') as TimePLC
        FROM camfront WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
        
        UNION ALL
		SELECT COUNT(CASE WHEN Judge_Total = 'OK' THEN 1 END) AS CountOk,COUNT(Judge_Total) AS TotalCount, DATE_FORMAT(TimeUpdate,'%Y-%m-01') as TimePLC
        FROM datacheckfinal WHERE CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' GROUP BY TimePLC
    ) AS Subquery
    GROUP BY TimePLC) as t;
    
   -- select * from tempData;
   -- select * from tempDataResult;
   SELECT CountOk, CountNg, date_format(MonthInYear, '%Y/%m') as MonthInYear FROM  tempDataResult order by MonthInYear;
   -- SELECT ConCat(  MONTH(DATE_FORMAT(MonthInYear,'%Y-%m-01')) , '/', YEAR(DATE_FORMAT(MonthInYear,'%Y-%m-01')) ) as MonthInYear, COALESCE(tmp.CountOk, 0) as CountOk, COALESCE(CountNg, 0) as CountNg FROM tempData 
   -- LEFT JOIN tempDataResult as tmp on YEAR(DATE_FORMAT(MonthInYear,'%Y-%m-01')) = YEAR(tmp.TimePLC) AND MONTH(DATE_FORMAT(MonthInYear,'%Y-%m-01')) = MONTH(tmp.TimePLC);
   
     DROP TEMPORARY TABLE IF EXISTS tempDataResult;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetPan_CountCodeMarket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetPan_CountCodeMarket`(IN StartDate DATETIME)
BEGIN
	-- =============================================
	-- Author:		Hứa Quốc Đảng
	-- Create date: 20/04/2024
	-- Description:	<Tính tổng các bản ghi thuộc nhóm CodeMarket theo ngày trong tháng>
	-- =============================================

     DROP TEMPORARY TABLE IF EXISTS tempDataCodeMarket;
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataCodeMarket (
        DayInMonth INT,
        Total INT
    );

    SET @DateEnd = DATE_FORMAT(LAST_DAY(StartDate), '%Y-%m-%d 23:59:59');
    
    SET @today_date = DATE_FORMAT(CURDATE(), '%Y-%m-%d 23:59:59');
    
    IF MONTH(StartDate) = MONTH(@today_date) AND YEAR(StartDate) = YEAR(@today_date) THEN
        SET @DateEnd = @today_date;
    END IF;
        
    -- Lấy dữ liệu và đếm tổng số lượng CodeMarket theo ngày
    INSERT INTO tempDataCodeMarket
    SELECT 
        DAY(Date(TimePLC)) AS dayInMonth,
        COUNT(*) AS Total
    FROM pan
    WHERE TimePLC BETWEEN DATE_FORMAT(StartDate, '%Y-%m-1 00:00:00') AND @DateEnd
    AND (CodeMarket IS NOT NULL) AND (TRIM(CodeMarket) <> '') AND (CodeMarket <> 'ERROR')
    GROUP BY dayInMonth;

    SELECT * FROM tempDataCodeMarket;

    DROP TEMPORARY TABLE IF EXISTS tempDataCodeMarket;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTuErrorByModel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTuErrorByModel`(IN DateStart DATETIME, IN DateEnd DATETIME, IN isRealTime BIT)
BEGIN
    -- Đặt độ dài tối đa cho group_concat
    SET SESSION group_concat_max_len = 100000000000;

    -- Tạo bảng tạm thời
    DROP TEMPORARY TABLE IF EXISTS tempTest;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempTest (CodeModel VARCHAR(5), ErrorName TEXT, CountError BIGINT);

    DROP TEMPORARY TABLE IF EXISTS tempTest2;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempTest2 (CodeModel VARCHAR(5), CountError BIGINT);


   -- IF isRealTime = TRUE THEN
	-- Insert vào tempTest2 cho dữ liệu thời gian thực
	-- INSERT INTO tempTest2 
	-- SELECT 
		-- SUBSTRING_INDEX(LEFT(CodeModel, 8), '-', - 1) AS CodeModel,
	   --  COUNT(*) AS CountError
	-- FROM suatu
	-- GROUP BY SUBSTRING_INDEX(LEFT(CodeModel, 8), '-', - 1)
	-- ORDER BY CountError DESC, TimeInsert DESC
	-- LIMIT 10;

	-- Insert vào tempTest sử dụng tempTest2 cho dữ liệu thời gian thực
	-- INSERT INTO tempTest 
	-- SELECT
		-- SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1) AS CodeModel,
		-- stu.ErrorName,
		-- COUNT(stu.ErrorName) AS CountError 
	-- FROM suatu stu
	-- INNER JOIN tempTest2 tmp2 ON tmp2.CodeModel = SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1)
	-- GROUP BY ErrorName, SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1), TimeInsert 
	-- ORDER BY TimeInsert DESC
	-- LIMIT 1000;

	-- ELSE
	-- Insert vào tempTest2 cho khoảng thời gian cụ thể
	INSERT INTO tempTest2 
	SELECT 
		SUBSTRING_INDEX(LEFT(CodeModel, 8), '-', - 1) AS CodeModel,
		COUNT(*) AS CountError
	FROM suatu
	WHERE TimeInsert BETWEEN DateStart AND DateEnd
	GROUP BY SUBSTRING_INDEX(LEFT(CodeModel, 8), '-', - 1)
	ORDER BY CountError DESC
	LIMIT 10;

	-- Insert vào tempTest sử dụng tempTest2 cho khoảng thời gian cụ thể
	INSERT INTO tempTest 
	SELECT
		SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1) AS CodeModel,
		stu.ErrorName,
		COUNT(stu.ErrorName) AS CountError  
	FROM suatu stu
	INNER JOIN tempTest2 tmp2 ON tmp2.CodeModel = SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1)
	WHERE (TimeInsert BETWEEN DateStart AND DateEnd)
	GROUP BY ErrorName, SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1), TimeInsert 
	ORDER BY TimeInsert DESC
	LIMIT 1000;
	-- END IF;

    -- Chọn từ tempTest
    SET @row_count = (SELECT COUNT(*) FROM tempTest);

    IF @row_count = 0 THEN
        SELECT 0 AS Error;
    ELSE
        -- Tạo bảng trung gian
        DROP TEMPORARY TABLE IF EXISTS intermediateTable;
        CREATE TEMPORARY TABLE IF NOT EXISTS intermediateTable (CodeModel VARCHAR(5), DynamicSQL MEDIUMTEXT);

        SET @sql = NULL;
        SELECT GROUP_CONCAT(DISTINCT CONCAT('SUM(CASE WHEN ErrorName = "', ErrorName,
                                            '" THEN CountError ELSE 0 END) AS "', ErrorName,'"')) AS DynamicSQL
        INTO @sql FROM tempTest;

        SET @sql = CONCAT('SELECT CodeModel AS CodeModel, ', @sql, ' FROM tempTest GROUP BY CodeModel ORDER BY CodeModel');

        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        DROP TEMPORARY TABLE IF EXISTS intermediateTable;
    END IF;

    -- Xóa bảng tạm thời
    DROP TEMPORARY TABLE IF EXISTS tempTest;
    DROP TEMPORARY TABLE IF EXISTS tempTest2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTuErrorByModel_New` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTuErrorByModel_New`(IN DateStart DATETIME, IN DateEnd DATETIME, IN isRealTime BIT)
BEGIN
    -- Đặt độ dài tối đa cho group_concat
    SET SESSION group_concat_max_len = 100000000000;

    -- Tạo bảng tạm thời
    DROP TEMPORARY TABLE IF EXISTS tempTest;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempTest (CodeModel VARCHAR(5), ErrorName TEXT, CountError BIGINT);

    DROP TEMPORARY TABLE IF EXISTS tempTest2;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempTest2 (CodeModel VARCHAR(5), CountError BIGINT);


    IF isRealTime = TRUE THEN
        -- Insert vào tempTest2 cho dữ liệu thời gian thực
        INSERT INTO tempTest2 
        SELECT 
            SUBSTRING_INDEX(LEFT(CodeModel, 8), '-', - 1) AS CodeModel,
            COUNT(*) AS CountError
        FROM suatu
        GROUP BY SUBSTRING_INDEX(LEFT(CodeModel, 8), '-', - 1),TimeInsert
        ORDER BY CountError DESC, TimeInsert DESC
        LIMIT 10;

        -- Insert vào tempTest sử dụng tempTest2 cho dữ liệu thời gian thực
        INSERT INTO tempTest 
        SELECT
            SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1) AS CodeModel,
            stu.ErrorName,
            COUNT(stu.ErrorName) AS CountError 
        FROM suatu stu
        INNER JOIN tempTest2 tmp2 ON tmp2.CodeModel = SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1)
        GROUP BY ErrorName, SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1), TimeInsert 
        ORDER BY TimeInsert DESC
        LIMIT 1000;

    ELSE
        -- Insert vào tempTest2 cho khoảng thời gian cụ thể
        INSERT INTO tempTest2 
        SELECT 
            SUBSTRING_INDEX(LEFT(CodeModel, 8), '-', - 1) AS CodeModel,
            COUNT(*) AS CountError
        FROM suatu
        WHERE TimeInsert BETWEEN DateStart AND DateEnd
        GROUP BY SUBSTRING_INDEX(LEFT(CodeModel, 8), '-', - 1)
        ORDER BY CountError DESC, TimeInsert DESC
        LIMIT 10;

        -- Insert vào tempTest sử dụng tempTest2 cho khoảng thời gian cụ thể
        INSERT INTO tempTest 
        SELECT
            SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1) AS CodeModel,
            stu.ErrorName,
            COUNT(stu.ErrorName) AS CountError  
        FROM suatu stu
        INNER JOIN tempTest2 tmp2 ON tmp2.CodeModel = SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1)
        WHERE (TimeInsert BETWEEN DateStart AND DateEnd)
        GROUP BY ErrorName, SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1), TimeInsert 
        ORDER BY TimeInsert DESC
        LIMIT 1000;
    END IF;

    -- Chọn từ tempTest
    SET @row_count = (SELECT COUNT(*) FROM tempTest);

    IF @row_count = 0 THEN
        SELECT 0 AS Error;
    ELSE
        -- Tạo bảng trung gian
        DROP TEMPORARY TABLE IF EXISTS intermediateTable;
        CREATE TEMPORARY TABLE IF NOT EXISTS intermediateTable (CodeModel VARCHAR(5), DynamicSQL MEDIUMTEXT);

        SET @sql = NULL;
        SELECT GROUP_CONCAT(DISTINCT CONCAT('SUM(CASE WHEN ErrorName = "', ErrorName,
                                            '" THEN CountError ELSE 0 END) AS "', ErrorName,'"')) AS DynamicSQL
        INTO @sql FROM tempTest;

        SET @sql = CONCAT('SELECT CodeModel AS CodeModel, ', @sql, ' FROM tempTest GROUP BY CodeModel ORDER BY CodeModel');

        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        DROP TEMPORARY TABLE IF EXISTS intermediateTable;
    END IF;

    -- Xóa bảng tạm thời
    DROP TEMPORARY TABLE IF EXISTS tempTest;
    DROP TEMPORARY TABLE IF EXISTS tempTest2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTuErrorCause` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTuErrorCause`(IN MonthInput datetime)
begin
	DROP TEMPORARY TABLE IF EXISTS CalendarErrorCause;
    CREATE TEMPORARY TABLE IF NOT EXISTS CalendarErrorCause (
        DayInMonth INT
    );

    SET @DateEnd = last_day(MonthInput);
    
	SET @today_date = CURDATE();
	IF MONTH(MonthInput) = MONTH(@today_date) AND YEAR(MonthInput) = YEAR(@today_date) THEN
	SET @DateEnd = @today_date;
	END IF;
    
	SELECT GROUP_CONCAT(DISTINCT 
		CONCAT('SUM(CASE WHEN ErrorCauseName = ''', ErrorCauseName, ''' THEN 1 ELSE 0 END) AS `', ErrorCauseName, '`'))
	INTO @column_names
	FROM suatu
    where TimePLC BETWEEN DATE_FORMAT(MonthInput, '%Y-%m-01 00:00:00') AND DATE_FORMAT(@DateEnd, '%Y-%m-%d 23:59:59');
    
    IF @column_names is null then select 0 as NoData;
    else
		SET @i = 1;
		WHILE @i <= DAY(@DateEnd) DO
			INSERT INTO CalendarErrorCause (DayInMonth) VALUES (@i);
			SET @i = @i + 1;
		END WHILE;
		
		select concat('select DAY(TimePLC) as Day,', @column_names, 'from suatu
			where TimePLC BETWEEN "', DATE_FORMAT(MonthInput, '%Y-%m-01 00:00:00'), '" AND "', DATE_FORMAT(@DateEnd, '%Y-%m-%d 23:59:59'),'"
			group by DAY(TimePLC)' )
            -- select concat('select c.DayInMonth as Day,',@calendar_column_names,' from CalendarErrorCause c left join
			 -- (select DATE(TimePLC) as TimePLC,', @column_names, 'from suatu
			 -- where TimePLC BETWEEN "', DATE_FORMAT(MonthInput, '%Y-%m-01 00:00:00'), '" AND "', DATE_FORMAT(@DateEnd, '%Y-%m-%d 23:59:59'),'"
			 -- group by DATE(TimePLC)) as tempErrorCause
			 -- on c.DayInMonth = DAY(tempErrorCause.TimePLC)' )
		into @sql;
		
		PREPARE statement FROM @sql;
		EXECUTE statement;
		DEALLOCATE PREPARE statement;
    end If;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTuModelByError` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTuModelByError`(IN DateStart DATETIME, IN DateEnd DATETIME, IN isRealTime BIT)
BEGIN
   SET
      SESSION group_concat_max_len = 10000000;
-- Create temporary table
	DROP TEMPORARY TABLE IF EXISTS tempTest;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempTest (ErrorName TEXT, CodeModel VARCHAR(5), CountCode BIGINT);

    DROP TEMPORARY TABLE IF EXISTS tempTest2;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempTest2 (ErrorName VARCHAR(256), CountError BIGINT);
    
    
-- IF isRealTime = TRUE 
-- THEN
	-- INSERT INTO tempTest2 
	-- SELECT
         -- ErrorName,
         -- COUNT(*) AS CountCode 
      -- FROM
        --  suatu 
     --  GROUP BY
        --  ErrorName
     --  ORDER BY
         -- CountCode DESC LIMIT 10;



  --  INSERT INTO
      -- tempTest 
     --  SELECT
        --  stu.ErrorName,
        --  SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1) AS CodeModel,
        --  COUNT(*) AS CountCode 
     --  FROM
        --  suatu stu
       --  INNER JOIN tempTest2 tmp2 ON tmp2.ErrorName = stu.ErrorName
     --  GROUP BY
        --  SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1),
       --   ErrorName,
       --   TimeInsert 
      -- ORDER BY
         -- TimeInsert DESC LIMIT 1000;
-- ELSE

	INSERT INTO tempTest2 
	SELECT
         ErrorName,
         COUNT(*) AS CountCode 
      FROM
         suatu 
	  WHERE
		TimeInsert BETWEEN DateStart AND DateEnd
      GROUP BY
         ErrorName
      ORDER BY
         CountCode DESC LIMIT 10;


   INSERT INTO
      tempTest 
      SELECT
        stu.ErrorName,
         SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1) AS CodeModel,
         COUNT(*) AS CountCode  
      FROM
         suatu stu
        INNER JOIN tempTest2 tmp2 ON tmp2.ErrorName = stu.ErrorName
      WHERE
            TimeInsert BETWEEN DateStart AND DateEnd
      GROUP BY
         SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1),
         ErrorName,
         TimeInsert 
      ORDER BY
         TimeInsert DESC LIMIT 1000;
-- END IF;

    SET @row_count = (SELECT FOUND_ROWS() AS row_count);
    
    if @row_count = 0 then select 0 as Error;
    else
      SET
         @sql = NULL;
-- Create intermediate table
CREATE TEMPORARY TABLE IF NOT EXISTS intermediateTable (ErrorName TEXT, DynamicSQL MEDIUMTEXT);
-- Generate dynamic SQL statements
      SET
         @sql = NULL;
SELECT 
    GROUP_CONCAT(DISTINCT CONCAT('SUM(CASE WHEN CodeModel = "',
                CodeModel,
                '" THEN CountCode ELSE 0 END) AS ',
                CodeModel)) AS DynamicSQL
INTO @sql FROM
    tempTest;
-- Build the final dynamic SQL statement
SET
   @sql = CONCAT('SELECT ErrorName AS ErrorName, ', @sql, ' FROM tempTest GROUP BY ErrorName');
-- Prepare and execute dynamic SQL statement
PREPARE stmt 
FROM
   @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
DROP TEMPORARY TABLE IF EXISTS intermediateTable;
end if;

-- Drop temporary tables
DROP TEMPORARY TABLE IF EXISTS tempTest;
DROP TEMPORARY TABLE IF EXISTS tempTest2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTuModelByErrorCauseName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTuModelByErrorCauseName`(IN DateStart DATETIME, IN DateEnd DATETIME, IN TotalSelect INT)
BEGIN
   SET
      SESSION group_concat_max_len = 10000000;
    -- =============================================
	-- Author:		Lê Minh Khôi 
	-- Create date: 22/02/2024
	-- Description:	<Tính tổng các Model thuộc nhóm lỗi ErrorNameGroup theo ngày>
	-- =============================================
-- Create temporary table
	DROP TEMPORARY TABLE IF EXISTS tempModelErrorCause;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempModelErrorCause (ErrorCauseName TEXT, CodeModel VARCHAR(5), CountCode BIGINT);
   
   INSERT INTO
      tempModelErrorCause 
      SELECT
        main.ErrorCauseName,
         SUBSTRING_INDEX(LEFT(main.CodeModel, 8), '-', - 1) AS CodeModel,
         COUNT(*) AS CountCode  
      FROM
         suatu main
         inner join(
			SELECT
				 SUBSTRING_INDEX(LEFT(CodeModel, 8), '-', - 1) AS CodeModel,
				 COUNT(*) AS CountCode  
			  FROM
				 suatu
			WHERE ErrorCauseName IS NOT NULL AND ErrorCauseName NOT LIKE '' AND TimePLC BETWEEN DATE_FORMAT(DateStart, '%Y-%m-%d 00:00:00') AND DATE_FORMAT(DateEnd, '%Y-%m-%d 23:59:59')
			GROUP BY  SUBSTRING_INDEX(LEFT(CodeModel, 8), '-', - 1)
			ORDER BY CountCode DESC LIMIT TotalSelect
         ) as tblTop5 on SUBSTRING_INDEX(LEFT(main.CodeModel, 8), '-', - 1) = tblTop5.CodeModel
	WHERE main.ErrorCauseName IS NOT NULL AND main.ErrorCauseName NOT LIKE '' AND TimePLC BETWEEN DATE_FORMAT(DateStart, '%Y-%m-%d 00:00:00') AND DATE_FORMAT(DateEnd, '%Y-%m-%d 23:59:59')
	GROUP BY main.ErrorCauseName,  SUBSTRING_INDEX(LEFT(main.CodeModel, 8), '-', - 1);

	-- Kiểm tra dữ liệu
    SET @row_count = (SELECT FOUND_ROWS() AS row_count);
    
    if @row_count = 0 then select 0 as Error;
    else
      SET
         @sql = NULL;
CREATE TEMPORARY TABLE IF NOT EXISTS intermediateTable (ErrorName TEXT, DynamicSQL MEDIUMTEXT);
      SET
         @sql = NULL;
SELECT 
    GROUP_CONCAT(DISTINCT CONCAT('SUM(CASE WHEN CodeModel = "',
                CodeModel,
                '" THEN CountCode ELSE 0 END) AS ',
                CodeModel)) AS DynamicSQL
INTO @sql FROM
    tempModelErrorCause;
SET
   @sql = CONCAT('SELECT ErrorCauseName AS ErrorCauseName, ', @sql, ' FROM tempModelErrorCause GROUP BY ErrorCauseName');
PREPARE stmt 
FROM
   @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
DROP TEMPORARY TABLE IF EXISTS intermediateTable;
end if;

-- Drop temporary tables
DROP TEMPORARY TABLE IF EXISTS tempModelErrorCause;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTuModelByErrorGroupName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTuModelByErrorGroupName`(IN DateStart DATETIME, IN DateEnd DATETIME, IN TotalSelect INT)
BEGIN
   SET
      SESSION group_concat_max_len = 10000000;
	-- =============================================
	-- Author:		Lê Minh Khôi 
	-- Create date: 22/02/2024
	-- Description:	<Tính tổng các Model thuộc nhóm lỗi ErrorNameGroup theo ngày>
	-- =============================================
      
	DROP TEMPORARY TABLE IF EXISTS tempTest;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempTest (ErrorGroupName TEXT, CodeModel VARCHAR(5), CountCode BIGINT);
   
   INSERT INTO
      tempTest 
      SELECT
        main.ErrorGroupName,
         SUBSTRING_INDEX(LEFT(main.CodeModel, 8), '-', - 1) AS CodeModel,
         COUNT(*) AS CountCode  
      FROM
         suatu main
         inner join (
			SELECT
			 SUBSTRING_INDEX(LEFT(CodeModel, 8), '-', - 1) AS CodeModel,
             COUNT(*) AS CountCode 
			  FROM
				 suatu
			WHERE ErrorGroupName IS NOT NULL AND ErrorGroupName NOT LIKE '' AND TimePLC BETWEEN DATE_FORMAT(DateStart, '%Y-%m-%d 00:00:00') AND DATE_FORMAT(DateEnd, '%Y-%m-%d 23:59:59')
			GROUP BY  SUBSTRING_INDEX(LEFT(CodeModel, 8), '-', - 1)
			ORDER BY CountCode DESC LIMIT TotalSelect
         ) as tblTop5 on SUBSTRING_INDEX(LEFT(main.CodeModel, 8), '-', - 1) = tblTop5.CodeModel
	WHERE main.ErrorGroupName IS NOT NULL AND main.ErrorGroupName NOT LIKE '' AND main.TimePLC BETWEEN DATE_FORMAT(DateStart, '%Y-%m-%d 00:00:00') AND DATE_FORMAT(DateEnd, '%Y-%m-%d 23:59:59')
	GROUP BY main.ErrorGroupName,  SUBSTRING_INDEX(LEFT(main.CodeModel, 8), '-', - 1);

	-- Kiểm tra dữ liệu
    SET @row_count = (SELECT FOUND_ROWS() AS row_count);
    
    if @row_count = 0 then select 0 as Error;
    else
CREATE TEMPORARY TABLE IF NOT EXISTS intermediateTable (ErrorName TEXT, DynamicSQL MEDIUMTEXT);
-- Generate dynamic SQL statements
      SET
         @sql = NULL;
SELECT 
    GROUP_CONCAT(DISTINCT CONCAT('SUM(CASE WHEN CodeModel = "',
                CodeModel,
                '" THEN CountCode ELSE 0 END) AS ',
                CodeModel)) AS DynamicSQL
INTO @sql FROM
    tempTest;
-- Build the final dynamic SQL statement
SET
   @sql = CONCAT('SELECT ErrorGroupName AS ErrorGroupName, ', @sql, ' FROM tempTest GROUP BY ErrorGroupName');
-- Prepare and execute dynamic SQL statement
PREPARE stmt 
FROM
   @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
DROP TEMPORARY TABLE IF EXISTS intermediateTable;
end if;

-- Drop temporary tables
DROP TEMPORARY TABLE IF EXISTS tempTest;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTuModelByError_NEW` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTuModelByError_NEW`(IN DateStart DATETIME, IN DateEnd DATETIME, IN isRealTime BIT)
BEGIN
   SET
      SESSION group_concat_max_len = 10000000;
-- Create temporary table
	DROP TEMPORARY TABLE IF EXISTS tempTest;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempTest (ErrorName TEXT, CodeModel VARCHAR(5), CountCode BIGINT);

    DROP TEMPORARY TABLE IF EXISTS tempTest2;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempTest2 (ErrorName VARCHAR(256), CountError BIGINT);
    
    
IF isRealTime = TRUE 
THEN
	INSERT INTO tempTest2 
	SELECT
         ErrorName,
         COUNT(*) AS CountCode 
      FROM
         suatu 
      GROUP BY
         ErrorName
      ORDER BY
         CountCode DESC LIMIT 10;



   INSERT INTO
      tempTest 
      SELECT
         stu.ErrorName,
         SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1) AS CodeModel,
         COUNT(*) AS CountCode 
      FROM
         suatu stu
        INNER JOIN tempTest2 tmp2 ON tmp2.ErrorName = stu.ErrorName
      GROUP BY
         SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1),
         ErrorName,
         TimeInsert 
      ORDER BY
         TimeInsert DESC LIMIT 1000;
ELSE

	INSERT INTO tempTest2 
	SELECT
         ErrorName,
         COUNT(*) AS CountCode 
      FROM
         suatu 
	  WHERE
		TimeInsert BETWEEN DateStart AND DateEnd
      GROUP BY
         ErrorName
      ORDER BY
         CountCode DESC LIMIT 10;


   INSERT INTO
      tempTest 
      SELECT
        stu.ErrorName,
         SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1) AS CodeModel,
         COUNT(*) AS CountCode  
      FROM
         suatu stu
        INNER JOIN tempTest2 tmp2 ON tmp2.ErrorName = stu.ErrorName
      WHERE
            TimeInsert BETWEEN DateStart AND DateEnd
      GROUP BY
         SUBSTRING_INDEX(LEFT(stu.CodeModel, 8), '-', - 1),
         ErrorName,
         TimeInsert 
      ORDER BY
         TimeInsert DESC LIMIT 1000;
END IF;

    SET @row_count = (SELECT FOUND_ROWS() AS row_count);
    
    if @row_count = 0 then select 0 as Error;
    else
      SET
         @sql = NULL;
-- Create intermediate table
CREATE TEMPORARY TABLE IF NOT EXISTS intermediateTable (ErrorName TEXT, DynamicSQL MEDIUMTEXT);
-- Generate dynamic SQL statements
      SET
         @sql = NULL;
SELECT 
    GROUP_CONCAT(DISTINCT CONCAT('SUM(CASE WHEN CodeModel = "',
                CodeModel,
                '" THEN CountCode ELSE 0 END) AS ',
                CodeModel)) AS DynamicSQL
INTO @sql FROM
    tempTest;
-- Build the final dynamic SQL statement
SET
   @sql = CONCAT('SELECT ErrorName AS ErrorName, ', @sql, ' FROM tempTest GROUP BY ErrorName');
-- Prepare and execute dynamic SQL statement
PREPARE stmt 
FROM
   @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
DROP TEMPORARY TABLE IF EXISTS intermediateTable;
end if;

-- Drop temporary tables
DROP TEMPORARY TABLE IF EXISTS tempTest;
DROP TEMPORARY TABLE IF EXISTS tempTest2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTuOKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTuOKNG`(IN DateStart datetime, IN DateEnd datetime, in isRealTime bit)
BEGIN
	DECLARE CountOK INT DEFAULT 0;
    DECLARE CountNG INT DEFAULT 0;

    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        Judge VARCHAR(10)
    );
    
   -- if isRealTime = true then
	-- INSERT INTO tempData
	-- SELECT
		   -- CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
	-- FROM suatu AS w
	-- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- else
	INSERT INTO tempData
	SELECT
		   CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
	FROM suatu AS w
	WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- end if;
    
    select COUNT(Judge) into CountOK from tempData where Judge = 'OK';
    select COUNT(Judge) into CountNG from tempData where Judge = 'NG';
    
    
    select CountOK as TotalOK, CountNG as TotalNG;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTuOK_NG_Model` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTuOK_NG_Model`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotalNG (
			CodeModel VARCHAR(255),
			Judge VARCHAR(10)
		);
    
    -- if isRealTime = true then
    -- INSERT INTO tempDataTotalNG
    -- SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1) AS CodeModel ,
           -- CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    -- FROM suatu AS w
    -- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
    -- else
    INSERT INTO tempDataTotalNG
    SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM suatu AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') order by TimeInsert desc limit 1000 ;
	-- end if;
    
	SELECT 
		temp.CodeModel AS Code,
		COUNT(CASE
			WHEN temp.Judge = 'NG' THEN 1
		END) AS TotalNG,
		COUNT(CASE
			WHEN temp.Judge = 'OK' THEN 1
		END) AS TotalOK
	FROM
		tempDataTotalNG AS temp
	GROUP BY temp.CodeModel
	order by (TotalNG + TotalOK) DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTuStackOkNgByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTuStackOkNgByDate`(IN StartDate DATETIME)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS tempData;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        DayInMonth INT,
        TotalOK INT,
        TotalNG INT
    );

    SET @DateEnd = DAY(last_day(StartDate));
    SET @i = 1;
    
	  SET @today_date = CURDATE();
	  IF MONTH(StartDate) = MONTH(@today_date) AND YEAR(StartDate) = YEAR(@today_date) THEN
	  SET @DateEnd = Day(@today_date);
	  END IF;
    
    
    WHILE @i <= @DateEnd DO
        SET @DayInMonth = DATE(DATE_FORMAT(StartDate, CONCAT('%Y-%m-', @i)));

        SET @sql = CONCAT('INSERT INTO tempData (DayInMonth, TotalOK, TotalNG) SELECT  
            ', @i, ' as DayInMonth,
            Count(case when temp.Judge = "OK" THEN 1 END) as TotalOK,
            Count(case when temp.Judge = "NG" THEN 1 END) as TotalNG 
        FROM (
            SELECT Judge
            FROM suatu
            WHERE TimeInsert BETWEEN "', @DayInMonth, '" AND "', DATE_FORMAT(@DayInMonth, '%Y-%m-%d 23:59:59'),'"
        ) AS temp;');
	
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET @i = @i + 1;
    END WHILE;
    
    SELECT * FROM tempData WHERE TotalOK <> 0 OR TotalNG <> 0;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTuTotalNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTuTotalNG`(YearInput int,MonthInput int)
BEGIN

CREATE TEMPORARY TABLE IF NOT EXISTS tempSuaTuTotalNG (
        NG int,
        DateInsert date
) ;

insert into tempSuaTuTotalNG
select 
	temp.NG, 
    temp.DateInsert from (
	SELECT
		Count(w.ErrorCode) AS NG,
		date( w.TimeInsert) as DateInsert
	FROM suatu AS w
	WHERE (w.CodeBack IS NOT NULL)
		AND (TRIM(w.CodeBack) NOT LIKE '')
	group by date( w.TimeInsert)
	) temp;

WITH RECURSIVE date_recursive AS (
    SELECT DATE(CONCAT(YearInput, '-', MonthInput, '-01')) AS date_value
    UNION ALL
    SELECT DATE_ADD(date_value, INTERVAL 1 DAY)
    FROM date_recursive
    WHERE 
        (
            (MONTH(DATE_ADD(date_value, INTERVAL 1 DAY)) = MonthInput
            AND YEAR(DATE_ADD(date_value, INTERVAL 1 DAY)) = YearInput)
            OR
            (MONTH(DATE_ADD(date_value, INTERVAL 1 DAY)) = MONTH(NOW())
            AND YEAR(DATE_ADD(date_value, INTERVAL 1 DAY)) = YEAR(NOW())
            AND DATE_ADD(date_value, INTERVAL 1 DAY) <= CURDATE())
        )
) SELECT distinct d.date_value, 
			CASE WHEN  t.NG is null then 0 else t.NG end as TotalNG 
            FROM date_recursive d left join tempSuaTuTotalNG t on d.date_value = t.DateInsert
 WHERE date_value <= curdate() limit 31;


-- Xóa bảng tạm
DROP TEMPORARY TABLE IF EXISTS tempSuaTuTotalNG;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTu_CountError` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTu_CountError`(IN StartDate DATETIME)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS tempData;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        DayInMonth INT,
        Shift1 INT,
        Shift2 INT,
        Shift3 INT
    );

    SET @DateEnd = DAY(last_day(StartDate));
    SET @i = 1;
    
	  SET @today_date = CURDATE();
	  IF MONTH(StartDate) = MONTH(@today_date) AND YEAR(StartDate) = YEAR(@today_date) THEN
	  SET @DateEnd = Day(@today_date);
	  END IF;
    
    
    WHILE @i <= @DateEnd DO
        SET @StartDay = DATE_FORMAT(StartDate, CONCAT('%Y-%m-', @i,' 00:00:00'));
		SET @EndDay = DATE_FORMAT(StartDate, CONCAT('%Y-%m-', @i,' 23:59:59'));
        
        SET @sql = CONCAT('INSERT INTO tempData (DayInMonth, Shift1, Shift2, Shift3) SELECT  
            ', @i, ' as DayInMonth,
            coalesce(MAX(IF(temp.ShiftName = "Ca sáng", temp.Total, 0)), 0) as Shift1,
            coalesce(MAX(IF(temp.ShiftName = "Ca chiều", temp.Total, 0)), 0) as Shift2,
            coalesce(MAX(IF(temp.ShiftName = "Ca tối", temp.Total, 0)), 0) as Shift3
        FROM (
            SELECT 
                 ShiftName, 
                 Count(*) as Total
            FROM suatu
            WHERE TimeInsert BETWEEN "', @StartDay, '" AND "', @EndDay, '"
            GROUP BY ShiftName
        ) AS temp;');
	
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET @i = @i + 1;
    END WHILE;
    
    SELECT * FROM tempData WHERE Shift1 <> 0 OR Shift2 <> 0 OR Shift3 <> 0;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSuaTu_CountErrorGroupName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetSuaTu_CountErrorGroupName`(IN StartDate DATETIME)
BEGIN
	-- =============================================
	-- Author:		Lê Minh Khôi 
	-- Create date: 21/02/2024
	-- Description:	<Tính tổng các lỗi thuộc nhóm lỗi ErrorNameGroup theo ngày trong tháng>
	-- =============================================


	DROP TEMPORARY TABLE IF EXISTS tempDataErrorGroupName;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataErrorGroupName (
        DayInMonth INT,
        ErrorName varchar(250),
        Total INT
    );
    
    DROP TEMPORARY TABLE IF EXISTS tempDayInMonth;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDayInMonth (
        DayInMonth INT
    );

    SET @DateEnd =  DATE_FORMAT(last_day(StartDate), '%Y-%m-%d 23:59:59');
    -- SET @i = 1;
    
    SET @today_date = DATE_FORMAT(CURDATE(), '%Y-%m-%d 23:59:59');
    IF MONTH(StartDate) = MONTH(@today_date) AND YEAR(StartDate) = YEAR(@today_date) THEN
    SET @DateEnd = @today_date;
    END IF;
    
    -- Lấy các ngày trong tháng
    -- WHILE @i <= DAY(@DateEnd) DO
        -- SET @DayInMonth =  DATE_FORMAT(StartDate, CONCAT('%Y-%m-', @i, ' 00:00:00'));
       --  SET @sql = CONCAT('INSERT INTO tempDayInMonth (DayInMonth) values 
           --  (', @i, ');');
        -- PREPARE stmt FROM @sql;
        -- EXECUTE stmt;
       -- DEALLOCATE PREPARE stmt;
        -- SET @i = @i + 1;
    -- END WHILE;
    
    
    -- Lấy dữ liệu và pivot lên
    INSERT INTO tempDataErrorGroupName SELECT * FROM
    (
		SELECT 
			Day(Date(TimePLC)) as dayInMonth,
			ErrorGroupName, 
			COUNT(ErrorGroupName) as Total
		FROM suatu
		WHERE TimePLC BETWEEN date_format(StartDate, '%Y-%m-1 00:00:00') AND  @DateEnd
		AND  (ErrorGroupName IS NOT NULL) AND (TRIM(ErrorGroupName) NOT LIKE '')
		GROUP BY dayInMonth, ErrorGroupName
    ) as tbl;
    
    SET @row_count = (SELECT FOUND_ROWS() AS row_count);
    -- Kiểm tra xem có dữ liệu trong bảng không rồi pivot
    IF @row_count = 0 THEN SELECT 0 AS ERROR;
    ELSE 
		-- Lấy các cột
		-- SET @col = null;
		-- SELECT GROUP_CONCAT('coalesce(`',ErrorGroupName,'`,0) AS "',ErrorGroupName,'"') AS ErrorGroupName 
				-- FROM ( SELECT ErrorGroupName FROM suatu WHERE ErrorGroupName NOT LIKE '' AND ErrorGroupName IS NOT NULL AND TimePLC BETWEEN date_format(StartDate, '%Y-%m-1 00:00:00') AND  @DateEnd GROUP BY ErrorGroupName) AS tbl
		-- INTO @col;
        
		SET @sql = NULL;
        DROP TEMPORARY TABLE IF EXISTS intermediateTable;
        CREATE TEMPORARY TABLE IF NOT EXISTS intermediateTable (ErrorName TEXT, DynamicSQL MEDIUMTEXT);
		SELECT 
			GROUP_CONCAT(DISTINCT CONCAT('SUM(CASE WHEN ErrorName = "',
						ErrorName,
						'" THEN Total ELSE 0 END) AS "',
						ErrorName,'"')) AS DynamicSQL
		INTO @sql FROM tempDataErrorGroupName;
		-- Build the final dynamic SQL statement
		SET
		  -- @sql = CONCAT('SELECT  tblDay.*, ',@col,' FROM tempDayInMonth as tblDay LEFT JOIN (SELECT DayInMonth AS DayInMonth, ', @sql, ' FROM tempDataErrorGroupName GROUP BY DayInMonth) AS tblData ON tblDay.DayInMonth = tblData.DayInMonth;');
          @sql = CONCAT('SELECT DayInMonth AS DayInMonth, ', @sql, ' FROM tempDataErrorGroupName GROUP BY DayInMonth');
          -- Prepare and execute dynamic SQL statement
		PREPARE stmt 
		FROM
		   @sql;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		DROP TEMPORARY TABLE IF EXISTS intermediateTable;
	END IF;
    
    DROP TEMPORARY TABLE IF EXISTS tempDataErrorGroupName;
    DROP TEMPORARY TABLE IF EXISTS tempDayInMonth;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTempDetailNamePoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTempDetailNamePoint`(
  IN NamePointCount INT,
  IN CodeModelInput varchar(50),
  IN DateStart datetime, 
  IN DateEnd datetime,
  In IsRealTime bit)
BEGIN
  DECLARE i INT;
  SET i = 1;

  SET DateStart = DATE(DateStart);
  SET DateEnd = DATE_ADD(DATE(DateEnd), INTERVAL '23:59:59' HOUR_SECOND);
  IF CodeModelInput IS NULL OR CodeModelInput = '' THEN
    SELECT SUBSTRING_INDEX( LEFT(tempdetail.CodeModel,8),'-',-1)
      INTO @CodeModel FROM tempdetail LIMIT 1;
    SET CodeModelInput = @CodeModel;
  END IF;

  CREATE TEMPORARY TABLE IF NOT EXISTS TempDetailNamePoint (
    NamePoint VARCHAR(255),
    StandardPoint DECIMAL(10,2),
    Actual DECIMAL(10,2)
  );
if(IsRealTime)
then
 WHILE i <= NamePointCount DO
	SET @sql = CONCAT('INSERT INTO TempDetailNamePoint
                  SELECT NamePoint', i, ', 
                  AVG(REGEXP_SUBSTR(StandardPoint', i, ', \'-?[0-9]+\\.?[0-9]*\')) AS StandardPoint, 
                  AVG(REGEXP_SUBSTR(Actual', i, ', \'-?[0-9]+\\.?[0-9]*\')) AS Actual 
                  FROM tempdetail 
                  WHERE NamePoint', i, ' IS NOT NULL and NamePoint', i, ' <> \'\' 
                  and SUBSTRING_INDEX( LEFT(CodeModel,8),\'-\',-1) = \'', CodeModelInput, '\'
                  and CodeBack = CONCAT(CodeModel,CodeSerial)
                  GROUP BY SUBSTRING_INDEX( LEFT(CodeModel,8),\'-\',-1), NamePoint', i,' limit 1000');

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    SET i = i + 1;
  END WHILE;
else 

  WHILE i <= NamePointCount DO
	SET @sql = CONCAT('INSERT INTO TempDetailNamePoint
                  SELECT NamePoint', i, ', 
                  AVG(REGEXP_SUBSTR(StandardPoint', i, ', \'-?[0-9]+\\.?[0-9]*\')) AS StandardPoint, 
                  AVG(REGEXP_SUBSTR(Actual', i, ', \'-?[0-9]+\\.?[0-9]*\')) AS Actual 
                  FROM tempdetail 
                  WHERE NamePoint', i, ' IS NOT NULL and NamePoint', i, ' <> \'\' 
                  and SUBSTRING_INDEX( LEFT(CodeModel,8),\'-\',-1) = \'', CodeModelInput, '\'
                  and TimePLC BETWEEN "',DateStart,'" And "',DateEnd,'"
                  and CodeBack = CONCAT(CodeModel,CodeSerial)
                  GROUP BY SUBSTRING_INDEX( LEFT(CodeModel,8),\'-\',-1), NamePoint', i);

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    SET i = i + 1;
  END WHILE;
end if;

  SELECT * FROM TempDetailNamePoint;
  DROP TEMPORARY TABLE IF EXISTS TempDetailNamePoint;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTempDetailOKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTempDetailOKNG`(IN DateStart datetime, IN DateEnd datetime)
BEGIN
	DECLARE OK INT DEFAULT 0;
    DECLARE NG INT DEFAULT 0;

    CREATE TEMPORARY TABLE IF NOT EXISTS TempDetailOKAndNG (
        Judge VARCHAR(255)
    );
        
	IF DATE(DateStart) = DATE(DateEnd) THEN
    SET DateStart = DATE(DateStart);
    SET DateEnd = DATE_ADD(DATE(DateEnd), INTERVAL '23:59:59' HOUR_SECOND);
    END IF;
    
	INSERT INTO TempDetailOKAndNG
	SELECT CASE WHEN Trim(CodeBack)!=Concat(Trim(CodeModel),Trim(CodeSerial)) THEN 'NG' ELSE w.Judge END
	FROM tempdetail AS w
	WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND  w.CodeBack IS NOT NULL AND w.CodeBack not like ''
    LIMIT 1000;

    -- Calculate counts
    -- SELECT COUNT(Judge) INTO OK FROM TempDetailOKAndNG WHERE Judge = 'OK';
    -- SELECT COUNT(Judge) INTO NG FROM TempDetailOKAndNG WHERE Judge = 'NG';
    SELECT COUNT(CASE WHEN Judge = 'OK' THEN 1 ELSE NULL END) AS OK, 
			COUNT(CASE WHEN Judge = 'NG' THEN 1 ELSE NULL END) AS NG 
    FROM TempDetailOKAndNG ORDER BY (OK + NG);
   -- SELECT OK, NG;

    DROP TEMPORARY TABLE IF EXISTS TempDetailOKAndNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTempDetailTotalNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTempDetailTotalNG`(IN DateStart datetime, IN DateEnd datetime)
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS TempTempDetailNG (
        CodeModel VARCHAR(255),
        Judge VARCHAR(10)
    );
    
	IF DATE(DateStart) = DATE(DateEnd) THEN
    SET DateStart = DATE(DateStart);
    SET DateEnd = DATE_ADD(DATE(DateEnd), INTERVAL '23:59:59' HOUR_SECOND);
    END IF;
   
	INSERT INTO TempTempDetailNG
	SELECT  SUBSTRING_INDEX( LEFT(TRIM(CodeModel),8),'-',-1) as CodeModel, CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
	FROM tempdetail AS w
	WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL or TRIM(w.CodeBack) not like '');
    
	SELECT temp.CodeModel, COUNT(*) as TotalNG
    FROM TempTempDetailNG AS temp 
    WHERE temp.Judge = 'NG'
    GROUP BY CodeModel ORDER BY TotalNG;

    DROP TEMPORARY TABLE IF EXISTS TempTempDetailNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTempResultNGperMonth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTempResultNGperMonth`(IN DateStart datetime)
BEGIN
  DECLARE start_date DATE;
  DECLARE end_date DATE;
  DECLARE today_date DATE;

  SET start_date = DATE_FORMAT(DateStart, '%Y-%m-01');
  SET end_date = LAST_DAY(DateStart);
  SET today_date = CURDATE();
  IF MONTH(DateStart) = MONTH(today_date) AND YEAR(DateStart) = YEAR(today_date) THEN
  SET end_date = today_date;
  END IF;
  
  CREATE TEMPORARY TABLE IF NOT EXISTS calendar (date DATE);
  
  SET @date = start_date;
  WHILE @date <= end_date DO
    INSERT INTO calendar VALUES (@date);
    SET @date = DATE_ADD(@date, INTERVAL 1 DAY);
  END WHILE;
  
  SELECT DAY(DATE(TimePLC)) AS Day,
         COALESCE(COUNT(Judge),0) AS Total, 
         COALESCE(SUM(IF(Judge = 'NG', 1, 0)),0) AS Total_NG
  FROM tempresult 
  WHERE TimePLC Between start_date and end_date
  GROUP BY DAY(DATE(TimePLC))
  ORDER BY Day;
  
  DROP TEMPORARY TABLE IF EXISTS calendar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTempResultOKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTempResultOKNG`(IN DateStart datetime, IN DateEnd datetime, IN isRealTime bool)
BEGIN
	DECLARE OK INT DEFAULT 0;
    DECLARE NG INT DEFAULT 0;

    CREATE TEMPORARY TABLE IF NOT EXISTS TempResultOKAndNG (
        Judge VARCHAR(255)
    );
        
	IF DATE(DateStart) = DATE(DateEnd) THEN
    SET DateStart = DATE(DateStart);
    SET DateEnd = DATE_ADD(DATE(DateEnd), INTERVAL '23:59:59' HOUR_SECOND);
    END IF;
    
    IF(isRealTime) then
	    INSERT INTO TempResultOKAndNG
	    SELECT CASE WHEN w.CodeBack <> CONCAT(w.CodeModel, w.CodeSerial) THEN 'NG' ELSE w.Judge END AS Judge
	    FROM tempresult AS w
	    WHERE  w.CodeBack IS NOT NULL AND w.CodeBack not like ''
        limit 1000;
    else
    	INSERT INTO TempResultOKAndNG
	    SELECT CASE WHEN w.CodeBack <> CONCAT(w.CodeModel, w.CodeSerial) THEN 'NG' ELSE w.Judge END AS Judge
	    FROM tempresult AS w
	    WHERE (w.TimePLC BETWEEN DateStart AND DateEnd) AND  w.CodeBack IS NOT NULL AND w.CodeBack not like '';
    end if;

    -- Calculate counts
    SELECT COUNT(Judge) INTO OK FROM TempResultOKAndNG WHERE Judge = 'OK';
    SELECT COUNT(Judge) INTO NG FROM TempResultOKAndNG WHERE Judge = 'NG';

    SELECT OK, NG;

    DROP TEMPORARY TABLE IF EXISTS TempResultOKAndNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTempResultTotalNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTempResultTotalNG`(IN DateStart datetime, IN DateEnd datetime, IN isRealTime bool)
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS TempTempResultNG (
        CodeModel VARCHAR(255),
        Judge VARCHAR(10)
    );
    
	IF DATE(DateStart) = DATE(DateEnd) THEN
    SET DateStart = DATE(DateStart);
    SET DateEnd = DATE_ADD(DATE(DateEnd), INTERVAL '23:59:59' HOUR_SECOND);
    END IF;
   
    if(isRealTime) then
	    INSERT INTO TempTempResultNG
	    SELECT  SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1) as CodeModel, CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
	    FROM tempresult AS w
	    WHERE (w.CodeBack IS NOT NULL or TRIM(w.CodeBack) not like '')
        limit 1000;
    else
    	INSERT INTO TempTempResultNG
	    SELECT  SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1) as CodeModel, CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
	    FROM tempresult AS w
	    WHERE (w.TimePLC BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL or TRIM(w.CodeBack) not like '');
	end if;
    
	SELECT temp.CodeModel, COUNT(*) as TotalNG
    FROM TempTempResultNG AS temp 
    WHERE temp.Judge = 'NG'
    GROUP BY temp.CodeModel
    ORDER BY TotalNG DESC;

    DROP TEMPORARY TABLE IF EXISTS TempTempResultNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalOk` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalOk`(IN DateStart DATETIME, IN DateEnd DATETIME)
BEGIN

    SELECT TableName, CountOk, TotalCount
    FROM (
        SELECT 'VP' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM vp WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        UNION ALL
        SELECT 'Gas' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM gas WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        UNION ALL
        SELECT 'Wi1 (Start)' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM wi1start WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        UNION ALL
        SELECT 'Wi1 (With)' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM wi1with WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        UNION ALL
        SELECT 'IP' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM ip WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        UNION ALL
        SELECT 'DF' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM df WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        UNION ALL
        SELECT 'Wi2' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM wi2 WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        UNION ALL
        SELECT 'Temp' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM tempresult WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        UNION ALL
        SELECT 'IOT' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM iot WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        UNION ALL
        SELECT 'Phiếu sửa tủ' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM suatu WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        UNION ALL
        SELECT 'PAN' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM pan WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        UNION ALL
        SELECT 'Camera back' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM camback WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        UNION ALL
		SELECT 'Camera front' AS TableName, COUNT(CASE WHEN Judge = 'OK' THEN 1 END) AS CountOk,COUNT(Judge) AS TotalCount
        FROM camfront WHERE TimePLC BETWEEN DateStart AND DateEnd AND CodeBack IS NOT NULL AND TRIM(CodeBack) NOT LIKE '' AND TRIM(CodeBack) LIKE '%NR-%'
        
        UNION ALL
		SELECT 'Final check' AS TableName, COUNT(CASE WHEN Judge_Total = 'OK' THEN 1 END) AS CountOk,COUNT(Judge_Total) AS TotalCount
        FROM datacheckfinal WHERE TimeUpdate BETWEEN DateStart AND DateEnd AND TRIM(CodeBack) LIKE '%NR-%'
    ) AS Subquery;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalOKRatio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalOKRatio`(DateStart datetime, DateEnd datetime)
BEGIN
  DECLARE ng_count INT DEFAULT 0;
  DECLARE ok_count INT DEFAULT 0;
  DECLARE done BOOLEAN DEFAULT FALSE;
  DECLARE tbl CHAR(64);

  -- Cursor to iterate through tables
  DECLARE tables CURSOR FOR 
    SELECT table_name 
    FROM information_schema.tables
    WHERE table_schema = 'dataplc'
    AND table_name IN ('vp', 'gas', 'wi1start', 'wi1with', 'ip', 'df', 'wi2', 'iot', 'suatu', 'tempresult', 'pan', 'camback', 'camfront', 'datacheckfinal');

  -- Handler for cursor not found
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN tables;

  -- Loop through tables
  read_loop: LOOP
    FETCH tables INTO tbl;
    IF done THEN
      LEAVE read_loop;
    END IF;

    -- Check if the current table is datacheckfinal
    IF tbl = 'datacheckfinal' THEN
      -- Count total records
      SET @s = CONCAT('SELECT COUNT(*) INTO @cnt FROM ', tbl, 
      ' WHERE (CodeBack IS NOT NULL) AND (TRIM(CodeBack) NOT LIKE \'\') and Judge_Total = \'OK\' AND TimeUpdate BETWEEN \'', DateStart, '\' AND \'', DateEnd, '\' LIMIT 1000');
      PREPARE stmt FROM @s;
      EXECUTE stmt;
      SET ok_count = ok_count + @cnt;

      -- Count total records
      SET @s = CONCAT('SELECT COUNT(*) INTO @cnt FROM ', tbl, 
      ' WHERE (CodeBack IS NOT NULL) AND (TRIM(CodeBack) NOT LIKE \'\') and Judge_Total = \'NG\' and TimeUpdate BETWEEN \'', DateStart, '\' AND \'', DateEnd, '\' LIMIT 1000');
      PREPARE stmt FROM @s;
      EXECUTE stmt;
      SET ng_count = ng_count + @cnt;

    ELSE
      -- Count total records
      SET @s = CONCAT('SELECT COUNT(*) INTO @cnt FROM ', tbl, 
      ' WHERE (CodeBack IS NOT NULL) AND (TRIM(CodeBack) NOT LIKE \'\') AND (CodeBack = CONCAT(CodeModel, CodeSerial)) AND Judge = \'NG\' AND TimePLC BETWEEN \'', DateStart, '\' AND \'', DateEnd, '\' LIMIT 1000');
      PREPARE stmt FROM @s;
      EXECUTE stmt;
      SET ng_count = ng_count + @cnt;

      -- Count 'OK' records
      SET @s = CONCAT('SELECT COUNT(*) INTO @cnt FROM ', tbl,
      ' WHERE (CodeBack IS NOT NULL) AND (TRIM(CodeBack) NOT LIKE \'\') AND (CodeBack = CONCAT(CodeModel, CodeSerial)) AND Judge = \'OK\' AND TimePLC BETWEEN \'', DateStart, '\' AND \'', DateEnd, '\' LIMIT 1000');
      PREPARE stmt FROM @s;
      EXECUTE stmt;
      SET ok_count = ok_count + @cnt;
    END IF;
  END LOOP;

  CLOSE tables;

  -- Return the results
  SELECT ok_count AS ok, ng_count as ng;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalPageFromCamBack` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalPageFromCamBack`(IN request varchar(500),IN judgeType varchar(10),In startDate datetime, IN endDate datetime)
BEGIN
	SELECT Count(*) as TotalPage
    FROM camback
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND (CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalPageFromCamFront` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalPageFromCamFront`(IN request varchar(500),IN judgeType varchar(10),In startDate datetime, IN endDate datetime)
BEGIN
	SELECT Count(*) as TotalPage
    FROM camfront
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND (CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalPageFromDF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalPageFromDF`(IN request varchar(500),IN judgeType varchar(10),In startDate datetime, IN endDate datetime)
BEGIN
	SELECT Count(*) as TotalPage
    FROM df
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND (CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalPageFromGAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalPageFromGAS`(IN request varchar(500),IN judgeType varchar(10),In startDate datetime, IN endDate datetime)
BEGIN
	SELECT Count(*) as TotalPage
    FROM gas
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND (CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalPageFromIOT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalPageFromIOT`(IN request varchar(500),IN judgeType varchar(10),In startDate datetime, IN endDate datetime)
BEGIN
	SELECT Count(*) as TotalPage
    FROM iot
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND (CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalPageFromIP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalPageFromIP`(IN request varchar(500),IN judgeType varchar(10),In startDate datetime, IN endDate datetime)
BEGIN
	SELECT Count(*) as TotalPage
    FROM ip
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND (CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalPageFromSuaTu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalPageFromSuaTu`(IN request varchar(500),IN judgeType varchar(10),In startDate datetime, IN endDate datetime)
BEGIN
	SELECT Count(*) as TotalPage
    FROM suatu
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND (CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalPageFromTempResult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalPageFromTempResult`(IN request varchar(500),IN judgeType varchar(10),In startDate datetime, IN endDate datetime)
BEGIN
	SELECT Count(*) as TotalPage
    FROM tempresult
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND (CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalPageFromVP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalPageFromVP`(IN request varchar(500),IN judgeType varchar(10),In startDate datetime, IN endDate datetime)
BEGIN
	SELECT Count(*) as TotalPage
    FROM VP
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND (CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalPageFromWi1Start` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalPageFromWi1Start`(IN request varchar(500),IN judgeType varchar(10),In startDate datetime, IN endDate datetime)
BEGIN
	SELECT Count(*) as TotalPage
    FROM wi1start
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND (CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalPageFromWi1With` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalPageFromWi1With`(IN request varchar(500),IN judgeType varchar(10),In startDate datetime, IN endDate datetime)
BEGIN
	SELECT Count(*) as TotalPage
    FROM wi1with
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND (CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTotalPageFromWi2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetTotalPageFromWi2`(IN request varchar(500),IN judgeType varchar(10),In startDate datetime, IN endDate datetime)
BEGIN
	SELECT Count(*) as TotalPage
    FROM wi2
    Where (TimePLC between startDate AND endDate)
    AND ( TRIM(judgeType) = '' OR CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END = judgeType)
	AND (CodeBack IS NOT NULL) 
    AND (TRIM(CodeBack) NOT LIKE '')
    AND TRIM(CodeBack) <> 'ERROR'
    AND ( TRIM(request) = '' OR CodeBack like concat('%',request,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetVPModelVaccum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetVPModelVaccum`(
    IN DateStart DATETIME,
    IN DateEnd DATETIME,
    IN isRealTime BIT,
    IN CodeModelInput TEXT
)
BEGIN
    -- Author:     <LMK>
    -- Create date: <03/1/2024>
    DROP TEMPORARY TABLE IF EXISTS tempDataVPModelVaccum;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataVPModelVaccum (
        CodeBack VARCHAR(255),
        CodeModel VARCHAR(255),
        VaccumAct DECIMAL(18, 2),
        VaccumSpec DECIMAL(18, 2)
    );
    
        INSERT INTO tempDataVPModelVaccum
        SELECT
            CodeBack,
            CodeModel,
            VaccumAct,
            VaccumSpec
        FROM
            vp AS w
        WHERE
            (TimePLC BETWEEN DateStart AND DateEnd)
            AND (CodeBack IS NOT NULL)
            AND (TRIM(CodeBack) NOT LIKE '')
            AND (CodeSerial IS NOT NULL)
            AND (TRIM(CodeSerial) NOT LIKE '')
            AND TRIM(CodeBack) LIKE '%NR-%'
        ORDER BY
            TimePLC desc;

    IF CodeModelInput = '' THEN
        SELECT
            SUBSTRING_INDEX( LEFT(t.CodeModel,8),'-',-1) as Code,
            SUM(t.VaccumAct) / COUNT(t.VaccumAct) AS TotalValue,
            t.VaccumSpec
        FROM
            tempDataVPModelVaccum as t
        GROUP BY
            t.CodeModel, t.VaccumSpec
		order by Code;
    ELSE
        SELECT
            t.CodeBack  AS  Code,
            t.VaccumAct as TotalValue,
             t.VaccumSpec
        FROM
            tempDataVPModelVaccum as t
        WHERE
           CodeModelInput LIKE  CONCAT('%',SUBSTRING_INDEX( LEFT(t.CodeModel,8),'-',-1),'%')
		order by Code;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tempDataVPModelVaccum;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetVPOKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetVPOKNG`(IN DateStart datetime, IN DateEnd datetime, in isRealTime bit)
BEGIN
	DECLARE CountOK INT DEFAULT 0;
    DECLARE CountNG INT DEFAULT 0;
    
	DROP TEMPORARY TABLE IF EXISTS tempDataVpOKNG;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataVpOKNG (
        Judge VARCHAR(10)
    );
    
    INSERT INTO tempDataVpOKNG
    SELECT
           CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM vp AS w
    WHERE (TimePLC BETWEEN DateStart AND DateEnd) AND (CodeBack IS NOT NULL) AND ( TRIM(CodeBack) not like '') AND TRIM(CodeBack) LIKE '%NR-%'  order by TimePLC desc;

    
    select COUNT(Judge) into CountOK from tempDataVpOKNG where Judge = 'OK';
    select COUNT(Judge) into CountNG from tempDataVpOKNG where Judge = 'NG';
    
    
    select CountOK, CountNG;
    DROP TEMPORARY TABLE IF EXISTS tempDataVpOKNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetVPPumpVaccum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetVPPumpVaccum`(
    IN DateStart DATETIME,
    IN DateEnd DATETIME,
    IN isRealTime BIT,
    IN PumpInput TEXT
)
BEGIN
    -- Author:     <LMK>
    -- Create date: <03/1/2024>
    DROP TEMPORARY TABLE IF EXISTS tempDataVPPumpVaccum;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataVPPumpVaccum (
        CodeBack VARCHAR(255),
        PumpNo VARCHAR(255),
        VaccumAct DECIMAL(18, 2),
        VaccumSpec DECIMAL(18, 2),
        TimePLC datetime
    );

        INSERT INTO tempDataVPPumpVaccum
        SELECT
            CodeBack,
            PumpNo,
            VaccumAct,
            VaccumSpec,
            TimePLC
        FROM
            vp 
        WHERE
            (TimePLC BETWEEN DateStart AND DateEnd)
            AND (CodeBack IS NOT NULL)
            AND (TRIM(CodeBack) NOT LIKE '')
             AND TRIM(CodeBack) LIKE '%NR-%'
        ORDER BY
           TimePLC;
    
    IF PumpInput = '' THEN
        SELECT
			t.PumpNo  as Code,
            SUM(t.VaccumAct) / COUNT(t.VaccumAct) AS TotalValue,
            t.VaccumSpec
        FROM
            tempDataVPPumpVaccum as t
        GROUP BY
            t.PumpNo,t.VaccumSpec
            order by  CAST( t.PumpNo as DECIMAL(18, 2)) ASC;
    ELSE
        SELECT
           t.CodeBack as Code,
            t.VaccumAct as TotalValue,
             t.VaccumSpec
        FROM
            tempDataVPPumpVaccum as t
        WHERE
		  find_in_set(t.PumpNo,PumpInput) = 1;
		-- PumpInput LIKE  CONCAT('%', t.PumpNo,'%');
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tempDataVPPumpVaccum;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetVpRatioOkNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetVpRatioOkNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotalNG (
			CodeModel VARCHAR(255),
			Judge VARCHAR(10)
		);
    
   
    INSERT INTO tempDataTotalNG
    SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM vp AS w
    WHERE (w.TimePLC BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') AND TRIM(CodeBack) LIKE '%NR-%' order by TimePLC desc;

    
	SELECT 
		temp.CodeModel AS Code,
		COUNT(CASE
			WHEN temp.Judge = 'NG' THEN 1
		END) AS TotalNG,
		COUNT(CASE
			WHEN temp.Judge = 'OK' THEN 1
		END) AS TotalOK
	FROM
		tempDataTotalNG AS temp
	GROUP BY temp.CodeModel
	ORDER BY (TotalNG + TotalOK) DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetVPStackOkNgByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetVPStackOkNgByDate`(IN StartDate DATETIME)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS tempData;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        DayInMonth INT,
        TotalOK INT,
        TotalNG INT
    );

    SET @DateEnd = DAY(last_day(StartDate));
    SET @i = 1;
    
	  SET @today_date = CURDATE();
	  IF MONTH(StartDate) = MONTH(@today_date) AND YEAR(StartDate) = YEAR(@today_date) THEN
	  SET @DateEnd = Day(@today_date);
	  END IF;
    
    
    WHILE @i <= @DateEnd DO
        SET @DayInMonth = DATE(DATE_FORMAT(StartDate, CONCAT('%Y-%m-', @i)));

        SET @sql = CONCAT('INSERT INTO tempData (DayInMonth, TotalOK, TotalNG) SELECT  
            ', @i, ' as DayInMonth,
            Count(case when temp.Judge = "OK" THEN 1 END) as TotalOK,
            Count(case when temp.Judge = "NG" THEN 1 END) as TotalNG 
        FROM (
            SELECT Judge
            FROM vp
            WHERE TimeInsert BETWEEN "', @DayInMonth, '" AND "', DATE_FORMAT(@DayInMonth, '%Y-%m-%d 23:59:59'),'"
			AND (CodeBack IS NOT NULL) 
			AND ( TRIM(CodeBack) not like "") 
			AND TRIM(CodeBack) LIKE "%NR-%" 
        ) AS temp;');
	
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET @i = @i + 1;
    END WHILE;
    
    SELECT * FROM tempData WHERE TotalOK <> 0 OR TotalNG <> 0;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetVPTotalNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetVPTotalNG`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
   DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
   CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotalNG (
        CodeModel VARCHAR(255),
        Judge VARCHAR(10)
    );
    
    INSERT INTO tempDataTotalNG
    SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1) as CodeModel,
           CASE WHEN CodeBack <> CONCAT(TRIM(CodeModel), 
           TRIM(CodeSerial)) THEN 'NG' ELSE Judge END AS Judge
    FROM vp
    WHERE (TimePLC BETWEEN DateStart AND DateEnd) 
		AND (CodeBack IS NOT NULL) 
		AND ( TRIM(CodeBack) not like '') 
        AND TRIM(CodeBack) LIKE '%NR-%'
    order by TimePLC desc;
    
    
    SELECT temp.CodeModel as Code, COUNT(*) as TotalNG
    FROM tempDataTotalNG AS temp 
    WHERE temp.Judge = 'NG'
    GROUP BY temp.CodeModel
    order by TotalNG DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWI1StartOKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWI1StartOKNG`(IN DateStart datetime, IN DateEnd datetime, in isRealTime bit)
BEGIN
	DECLARE CountOK INT DEFAULT 0;
    DECLARE CountNG INT DEFAULT 0;
    
	DROP TEMPORARY TABLE IF EXISTS tempDataWI1StartOKNG;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataWI1StartOKNG (
        Judge VARCHAR(10)
    );
    
    -- if isRealTime = true then
    -- INSERT INTO tempDataWI1StartOKNG
    -- SELECT
        --    CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
   --  FROM wi1start AS w
   --  WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') order by TimeInsert desc limit 1000 ;
   --  else
    INSERT INTO tempDataWI1StartOKNG
    SELECT
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM wi1start AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- end if;
    
    select COUNT(Judge) into CountOK from tempDataWI1StartOKNG where Judge = 'OK';
    select COUNT(Judge) into CountNG from tempDataWI1StartOKNG where Judge = 'NG';
    
    
    select CountOK, CountNG;
    DROP TEMPORARY TABLE IF EXISTS tempDataWI1StartOKNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi1StartStackOkNgByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi1StartStackOkNgByDate`(IN StartDate DATETIME)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS tempData;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        DayInMonth INT,
        TotalOK INT,
        TotalNG INT
    );

    SET @DateEnd = DAY(last_day(StartDate));
    SET @i = 1;
    
	  SET @today_date = CURDATE();
	  IF MONTH(StartDate) = MONTH(@today_date) AND YEAR(StartDate) = YEAR(@today_date) THEN
	  SET @DateEnd = Day(@today_date);
	  END IF;
    
    
    WHILE @i <= @DateEnd DO
        SET @DayInMonth = DATE(DATE_FORMAT(StartDate, CONCAT('%Y-%m-', @i)));

        SET @sql = CONCAT('INSERT INTO tempData (DayInMonth, TotalOK, TotalNG) SELECT  
            ', @i, ' as DayInMonth,
            Count(case when temp.Judge = "OK" THEN 1 END) as TotalOK,
            Count(case when temp.Judge = "NG" THEN 1 END) as TotalNG 
        FROM (
            SELECT Judge
            FROM wi1start
            WHERE TimeInsert BETWEEN "', @DayInMonth, '" AND "', DATE_FORMAT(@DayInMonth, '%Y-%m-%d 23:59:59'),'"
        ) AS temp;');
	
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET @i = @i + 1;
    END WHILE;
    
    SELECT * FROM tempData WHERE TotalOK <> 0 OR TotalNG <> 0;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi1startTotalNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi1startTotalNG`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
   DROP TEMPORARY TABLE IF EXISTS tempDataWi1startTotalNG;
   CREATE TEMPORARY TABLE IF NOT EXISTS tempDataWi1startTotalNG (
        CodeModel VARCHAR(255),
        Judge VARCHAR(10)
    );
    
    -- if isRealTime = true then
    -- INSERT INTO tempDataWi1startTotalNG
    -- SELECT   SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1)AS CodeModel,
           -- CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    -- FROM Wi1start AS w
    -- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
    -- else
    INSERT INTO tempDataWi1startTotalNG
    SELECT   SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM Wi1start AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- end if;
    
    SELECT temp.CodeModel, COUNT(*) as TotalNG
    FROM tempDataWi1startTotalNG AS temp 
    WHERE temp.Judge = 'NG'
    GROUP BY temp.CodeModel
    ORDER BY TotalNG DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataWi1startTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi1StartValue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi1StartValue`(
    IN DateStart DATETIME,
    IN DateEnd DATETIME,
    IN isRealTime BIT,
    IN CodeModelInput TEXT
)
BEGIN
    -- Author:     <KhánhNN>
    -- Create date: <25/12/2023>
    -- Description: <Lấy danh sách Giá trị wi1start theo nhóm>
    DROP TEMPORARY TABLE IF EXISTS tempDataWi1StartValue;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataWi1StartValue (
        CodeBack VARCHAR(255),
        CodeModel VARCHAR(255),
        ValueActual DECIMAL(18, 2),
        LLValue     DECIMAL(18,2),
        ULValue     DECIMAL(18,2)
    );

    -- IF isRealTime = TRUE THEN
        -- INSERT INTO tempDataWi1StartValue
        -- SELECT
            -- w.CodeBack,
             -- SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1) AS CodeModel,
            -- w.ValueActual ,
            -- w.LL,
            -- w.UL
        -- FROM
         --   wi1start AS w
       --  WHERE
           --  (w.CodeBack IS NOT NULL)
          --   AND (TRIM(w.CodeBack) NOT LIKE '')
         --    AND w.ValueActual <> 0
       --  ORDER BY
        --     w.TimeInsert
       --  LIMIT 1000;
    -- ELSE
        INSERT INTO tempDataWi1StartValue
        SELECT
            w.CodeBack ,
           SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1)AS CodeModel,
            w.ValueActual ,
            w.LL,
            w.UL
        FROM
            wi1start AS w
        WHERE
            (w.TimeInsert BETWEEN DateStart AND DateEnd)
            AND (w.CodeBack IS NOT NULL)
            AND (TRIM(w.CodeBack) NOT LIKE '')
            AND w.ValueActual <> 0
        ORDER BY
            w.TimeInsert
        LIMIT 1000;
   --  END IF;

    IF CodeModelInput = '' THEN
        SELECT
            t.CodeModel as Code,
            SUM(t.ValueActual) / COUNT(t.ValueActual) AS TotalValue,
            SUM(t.LLValue) / COUNT(t.LLValue) AS LLValue,
            SUM(t.ULValue) / COUNT(t.ULValue) AS ULValue
        FROM
            tempDataWi1StartValue as t
        GROUP BY
            t.CodeModel
		ORDER BY Code;
    ELSE
        SELECT
            t.CodeBack as Code,
            t.ValueActual as TotalValue,
            t.LLValue,
            t.ULValue
        FROM
            tempDataWi1StartValue as t
        WHERE
            -- t.CodeModel = CodeModelInput;
             find_in_set(t.CodeModel,CodeModelInput) > 0
            -- CodeModelInput LIKE  CONCAT('%', t.CodeModel,'%');
		ORDER BY Code;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tempDataWi1StartValue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi1StartVolt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi1StartVolt`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit, In arrCode text)
BEGIN
CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        CodeBack VARCHAR(255),
        Volt bigint
    );
    if isRealTime = true then
    INSERT INTO tempData
    SELECT w.CodeBack,
           substring(w.Volt,1, length(w.Volt)-1) / w.ValueActual  AS Volt
    FROM wi1start AS w
    WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  And w.ValueActual <> 0
    and (arrCode is null or strcmp(arrCode,'') = 0 or find_in_set(CodeModel, arrCode) ) order by TimePLC limit 1000;
    else
    INSERT INTO tempData
    SELECT w.CodeBack,
           substring(w.Volt,1, length(w.Volt)-1) / w.ValueActual  AS Volt
    FROM wi1start AS w
    WHERE (w.TimePLC BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')
			And w.ValueActual <> 0 and ( arrCode is null or strcmp(arrCode,'') = 0 or find_in_set(CodeModel, arrCode)) order by TimePLC limit 1000
            ;
	end if;
    SELECT CodeBack, Volt as VoltValue
    FROM tempData AS temp;
    
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi1withOKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi1withOKNG`(IN DateStart datetime, IN DateEnd datetime, in isRealTime bit)
BEGIN
	DECLARE CountOK INT DEFAULT 0;
    DECLARE CountNG INT DEFAULT 0;

	DROP TEMPORARY TABLE IF EXISTS tempDataWi1withOKNG;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataWi1withOKNG (
        Judge VARCHAR(10)
    );
    
    -- if isRealTime = true then
    -- INSERT INTO tempDataWi1withOKNG
    -- SELECT
          --  CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    -- FROM wi1with AS w
    -- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') order by TimeInsert desc limit 1000 ;
    -- else
    INSERT INTO tempDataWi1withOKNG
    SELECT
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM wi1with AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- end if;
    
    select COUNT(Judge) into CountOK from tempDataWi1withOKNG where Judge = 'OK';
    select COUNT(Judge) into CountNG from tempDataWi1withOKNG where Judge = 'NG';
    
    
    select CountOK, CountNG;
    DROP TEMPORARY TABLE IF EXISTS tempDataWi1withOKNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi1WithRatioOkNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi1WithRatioOkNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotalNG (
			CodeModel VARCHAR(255),
			Judge VARCHAR(10)
		);
    
   
    INSERT INTO tempDataTotalNG
    SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM wi1with AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') order by TimeInsert desc limit 1000 ;

    
	SELECT 
		temp.CodeModel AS Code,
		COUNT(CASE
			WHEN temp.Judge = 'NG' THEN 1
		END) AS TotalNG,
		COUNT(CASE
			WHEN temp.Judge = 'OK' THEN 1
		END) AS TotalOK
	FROM
		tempDataTotalNG AS temp
	GROUP BY temp.CodeModel
	ORDER BY (TotalNG + TotalOK) DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi1WithStackOkNgByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi1WithStackOkNgByDate`(IN StartDate DATETIME)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS tempData;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        DayInMonth INT,
        TotalOK INT,
        TotalNG INT
    );

    SET @DateEnd = DAY(last_day(StartDate));
    SET @i = 1;
    
	  SET @today_date = CURDATE();
	  IF MONTH(StartDate) = MONTH(@today_date) AND YEAR(StartDate) = YEAR(@today_date) THEN
	  SET @DateEnd = Day(@today_date);
	  END IF;
    
    
    WHILE @i <= @DateEnd DO
        SET @DayInMonth = DATE(DATE_FORMAT(StartDate, CONCAT('%Y-%m-', @i)));

        SET @sql = CONCAT('INSERT INTO tempData (DayInMonth, TotalOK, TotalNG) SELECT  
            ', @i, ' as DayInMonth,
            Count(case when temp.Judge = "OK" THEN 1 END) as TotalOK,
            Count(case when temp.Judge = "NG" THEN 1 END) as TotalNG 
        FROM (
            SELECT Judge
            FROM wi1with
            WHERE TimeInsert BETWEEN "', @DayInMonth, '" AND "', DATE_FORMAT(@DayInMonth, '%Y-%m-%d 23:59:59'),'"
        ) AS temp;');
	
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET @i = @i + 1;
    END WHILE;
    
    SELECT * FROM tempData WHERE TotalOK <> 0 OR TotalNG <> 0;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi1WithTotalNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi1WithTotalNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataWi1WithTotalNg;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataWi1WithTotalNg (
        CodeModel VARCHAR(255),
        Judge VARCHAR(10)
    );
    
    -- if isRealTime = true then
    -- INSERT INTO tempDataWi1WithTotalNg
    -- SELECT SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1),
          --  CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
   --  FROM wi1with AS w
    -- WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
   --  else
    INSERT INTO tempDataWi1WithTotalNg
    SELECT  SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1),
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM wi1with AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  order by TimeInsert desc limit 1000 ;
	-- end if;
    
    SELECT temp.CodeModel, COUNT(*) as TotalNG
    FROM tempDataWi1WithTotalNg AS temp 
    WHERE temp.Judge = 'NG'
    GROUP BY temp.CodeModel
    ORDER BY TotalNG DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataWi1WithTotalNg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi1withValueActual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi1withValueActual`(
    IN DateStart DATETIME,
    IN DateEnd DATETIME,
    IN isRealTime BIT,
    IN CodeModelInput text
)
BEGIN
    -- Author:     <LMK>
    -- Create date: <27/12/2023>
    
    DROP TEMPORARY TABLE IF EXISTS tempWi1withValue;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempWi1withValue (
        CodeBack VARCHAR(255),
        CodeModel VARCHAR(255),
        ValueActual DECIMAL(18, 2),
        LLValue     DECIMAL(18,2),
        ULValue     DECIMAL(18,2)
    );

    -- IF isRealTime = TRUE THEN
        -- INSERT INTO tempWi1withValue
       --  SELECT
           --  w.CodeBack,
          --  SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1) as CodeModel,
           --  w.ValueActual,
           --  w.LL,
           --  w.UL
        -- FROM
            -- wi1with AS w
        -- WHERE
            -- (w.CodeBack IS NOT NULL)
            -- AND (TRIM(w.CodeBack) NOT LIKE '')
           -- AND w.ValueActual <> 0
       --  ORDER BY
         --    w.TimeInsert
        -- LIMIT 1000;
    -- ELSE
        INSERT INTO tempWi1withValue
        SELECT
            w.CodeBack ,
           SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1) as CodeModel,
            w.ValueActual,
            w.LL,
            w.UL
        FROM
            wi1with AS w
        WHERE
            (w.TimeInsert BETWEEN DateStart AND DateEnd)
            AND (w.CodeBack IS NOT NULL)
            AND (TRIM(w.CodeBack) NOT LIKE '')
            AND w.ValueActual <> 0
        ORDER BY
            w.TimeInsert
        LIMIT 1000;
   --  END IF;

    IF CodeModelInput = '' THEN
        SELECT
            t.CodeModel as Code,
            SUM(t.ValueActual) / COUNT(t.ValueActual) AS TotalValue,
            SUM(t.LLValue) / COUNT(t.LLValue) AS LLValue,
            SUM(t.ULValue) / COUNT(t.ULValue) AS ULValue
        FROM
            tempWi1withValue as t
        GROUP BY
            t.CodeModel
		ORDER BY Code;
    ELSE
        SELECT
            t.CodeBack as Code,
            t.ValueActual as TotalValue,
            t.LLValue,
            t.ULValue
        FROM
            tempWi1withValue as t
        WHERE
            -- t.CodeModel = CodeModelInput;
            -- CodeModelInput LIKE  CONCAT('%', t.CodeModel,'%');
            find_in_set(t.CodeModel,CodeModelInput) > 0
		ORDER BY Code;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tempWi1withValue;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi1withVolt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi1withVolt`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit, In arrCode text)
BEGIN
CREATE TEMPORARY TABLE IF NOT EXISTS tempDataWi1withVolt (
        CodeBack VARCHAR(255),
        Volt bigint
    );
    if isRealTime = true then
    INSERT INTO tempDataWi1withVolt
    SELECT w.CodeBack,
           substring(w.Volt,1, length(w.Volt)-1) / w.ValueActual  AS Volt
    FROM wi1with AS w
    WHERE (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')  And w.ValueActual <> 0
    and (arrCode is null or strcmp(arrCode,'') = 0 or find_in_set(CodeModel, arrCode) ) limit 1000;
    else
    INSERT INTO tempDataWi1withVolt
    SELECT w.CodeBack,
           substring(w.Volt,1, length(w.Volt)-1) / w.ValueActual  AS Volt
    FROM wi1with AS w
    WHERE (w.TimePLC BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '')
			And w.ValueActual <> 0 and ( arrCode is null or strcmp(arrCode,'') = 0 or find_in_set(CodeModel, arrCode)) order by TimePLC limit 1000
            ;
	end if;
    
    SELECT CodeBack, Volt as VoltValue
    FROM tempDataWi1withVolt AS temp;
    
    DROP TEMPORARY TABLE IF EXISTS tempDataWi1withVolt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi2CodeModels` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi2CodeModels`()
begin
-- Created by: Lã Ngọc Hải
-- Created date: 25/12/2023
-- Description: lấy tất cả CodeModel để người dùng lựa chọn.
select distinct SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1) as CodeModel from wi2 as w
where w.CodeModel = CodeModel and w.CodeModel is not null and w.CodeModel not like ""
order by CodeModel;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi2OKNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi2OKNG`(IN DateStart datetime, IN DateEnd datetime, IN isRealTime boolean)
BEGIN
-- Created by: Lã Ngọc Hải
-- Created date: 25/12/2023
-- Description: lấy số lượng sản phẩm được đánh giá OK và NG
    DECLARE CountOK INT DEFAULT 0;
    DECLARE CountNG INT DEFAULT 0;

    CREATE TEMPORARY TABLE IF NOT EXISTS tempDataWi2OKNG (
        Judge VARCHAR(255)
    );
	-- IF(isRealTime) then
		-- INSERT INTO tempDataWi2OKNG
		-- SELECT CASE WHEN w.CodeBack <> CONCAT(w.CodeModel, w.CodeSerial) THEN 'NG' ELSE w.Judge END AS Judge
		-- FROM wi2 AS w
		-- LIMIT 1000;
    -- ELSE
		INSERT INTO tempDataWi2OKNG
		SELECT CASE WHEN w.CodeBack <> CONCAT(w.CodeModel, w.CodeSerial) THEN 'NG' ELSE w.Judge END AS Judge
		FROM wi2 AS w
		WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND  w.CodeBack IS NOT NULL AND w.CodeBack not like '';
    -- END IF;

    -- Calculate counts
    SELECT COUNT(Judge) INTO CountOK FROM tempDataWi2OKNG WHERE Judge = 'OK';
    SELECT COUNT(Judge) INTO CountNG FROM tempDataWi2OKNG WHERE Judge = 'NG';

    SELECT CountOK AS CountOK, CountNG AS CountNG;

    DROP TEMPORARY TABLE IF EXISTS tempDataWi2OKNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi2RatioOkNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi2RatioOkNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotalNG (
			CodeModel VARCHAR(255),
			Judge VARCHAR(10)
		);
    
   
    INSERT INTO tempDataTotalNG
    SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM wi2 AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') order by TimeInsert desc limit 1000 ;

    
	SELECT 
		temp.CodeModel AS Code,
		COUNT(CASE
			WHEN temp.Judge = 'NG' THEN 1
		END) AS TotalNG,
		COUNT(CASE
			WHEN temp.Judge = 'OK' THEN 1
		END) AS TotalOK
	FROM
		tempDataTotalNG AS temp
	GROUP BY temp.CodeModel
	ORDER BY (TotalNG + TotalOK) DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi2StackOkNgByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi2StackOkNgByDate`(IN DateStart DATETIME)
BEGIN

	DROP TEMPORARY TABLE IF EXISTS tempData;
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        DayInMonth INT,
        TotalOK INT,
        TotalNG INT
    );

    SET @DateEnd = DAY(last_day(DateStart));
    SET @i = 1;
    
	  SET @today_date = CURDATE();
	  IF MONTH(DateStart) = MONTH(@today_date) AND YEAR(DateStart) = YEAR(@today_date) THEN
	  SET @DateEnd = Day(@today_date);
	  END IF;
    
    
    WHILE @i <= @DateEnd DO
        SET @DayInMonth = DATE(DATE_FORMAT(DateStart, CONCAT('%Y-%m-', @i)));

        SET @sql = CONCAT('INSERT INTO tempData (DayInMonth, TotalOK, TotalNG) SELECT  
            ', @i, ' as DayInMonth,
            Count(case when temp.Judge = "OK" THEN 1 END) as TotalOK,
            Count(case when temp.Judge = "NG" THEN 1 END) as TotalNG 
        FROM (
            SELECT Judge
            FROM wi2
            WHERE TimeInsert BETWEEN "', @DayInMonth, '" AND "', DATE_FORMAT(@DayInMonth, '%Y-%m-%d 23:59:59'),'"
        ) AS temp;');
	
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SET @i = @i + 1;
    END WHILE;
    
SELECT 
    *
FROM
    tempData WHERE TotalOK <> 0 OR TotalNG <> 0;
    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi2TotalNG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi2TotalNG`(IN DateStart datetime, IN DateEnd datetime, IN isRealTime boolean)
BEGIN
-- Created by: Lã Ngọc Hải
-- Created date: 25/12/2023
-- Description: lấy số lượng sản phẩm được đánh giá là NG, sắp xếp theo CodeModel
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        CodeModel VARCHAR(255),
        Judge VARCHAR(10)
    );
    
    -- if (isRealTime) then
		-- INSERT INTO tempData
		-- SELECT SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1) as CodeModel, CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
		-- FROM wi2 AS w
		-- limit 1000;
    -- else
		INSERT INTO tempData
		SELECT  SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1) as CodeModel, CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
		FROM wi2 AS w
		WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL or TRIM(w.CodeBack) not like '');
    -- end if;
    
	SELECT temp.CodeModel, COUNT(*) as TotalNG
    FROM tempData AS temp 
    WHERE temp.Judge = 'NG'
    GROUP BY temp.CodeModel
    ORDER BY TotalNG DESC;

    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWi2Value` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWi2Value`(
    IN DateStart DATETIME,
    IN DateEnd DATETIME,
    IN isRealTime BIT,
    IN CodeModelInput TEXT
)
BEGIN
    -- Author:     <KhánhNN>
    -- Create date: <25/12/2023>
    -- Description: <Lấy danh sách Giá trị wi1start theo nhóm>
    
    CREATE TEMPORARY TABLE IF NOT EXISTS tempData (
        CodeBack VARCHAR(255),
        CodeModel VARCHAR(255),
        ValueActual DECIMAL(18, 2),
        LLValue     DECIMAL(18,3),
        ULValue     DECIMAL(18,3)
    );

    -- IF isRealTime = TRUE THEN
       --  INSERT INTO tempData
        -- SELECT
           --  w.CodeBack,
           --  SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1) as CodeModel,
           --  w.ValueActual,
           --  w.LL,
           --  w.UL
        -- FROM
           --  wi2 AS w
       --  WHERE
           --  (w.CodeBack IS NOT NULL)
           --  AND (TRIM(w.CodeBack) NOT LIKE '')
           --  AND w.ValueActual <> 0
       --  ORDER BY
           --  w.TimeInsert
       --  LIMIT 1000;
    -- ELSE
        INSERT INTO tempData
        SELECT
            w.CodeBack ,
           SUBSTRING_INDEX( LEFT(w.CodeModel,8),'-',-1) as CodeModel,
            w.ValueActual,
            w.LL,
            w.UL
        FROM
            wi2 AS w
        WHERE
            (w.TimeInsert BETWEEN DateStart AND DateEnd)
            AND (w.CodeBack IS NOT NULL)
            AND (TRIM(w.CodeBack) NOT LIKE '')
            AND w.ValueActual <> 0
        ORDER BY
            w.TimeInsert
        LIMIT 1000;
   --  END IF;

    IF CodeModelInput = '' THEN
        SELECT
            t.CodeModel,
            SUM(t.ValueActual) / COUNT(t.ValueActual) AS TotalValue,
            SUM(t.LLValue) / COUNT(t.LLValue) AS LLValue,
            SUM(t.ULValue) / COUNT(t.ULValue) AS ULValue
        FROM
            tempData as t
        GROUP BY
            t.CodeModel
		ORDER BY CodeModel;
    ELSE
        SELECT
            t.CodeBack,
            t.ValueActual as TotalValue,
            t.LLValue,
            t.ULValue
        FROM
            tempData as t
        WHERE
           -- t.CodeModel = CodeModelInput;
            find_in_set(t.CodeModel,CodeModelInput) > 0
		ORDER BY CodeBack;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tempData;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetWiStartRatioOkNg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `spGetWiStartRatioOkNg`(IN DateStart datetime, IN DateEnd datetime, In isRealTime bit)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
	CREATE TEMPORARY TABLE IF NOT EXISTS tempDataTotalNG (
			CodeModel VARCHAR(255),
			Judge VARCHAR(10)
		);
    
   
    INSERT INTO tempDataTotalNG
    SELECT SUBSTRING_INDEX( LEFT(CodeModel,8),'-',-1)AS CodeModel,
           CASE WHEN w.CodeBack <> CONCAT(TRIM(w.CodeModel), TRIM(w.CodeSerial)) THEN 'NG' ELSE w.Judge END AS Judge
    FROM wi1start AS w
    WHERE (w.TimeInsert BETWEEN DateStart AND DateEnd) AND (w.CodeBack IS NOT NULL) AND ( TRIM(w.CodeBack) not like '') order by TimeInsert desc limit 1000 ;

    
	SELECT 
		temp.CodeModel AS Code,
		COUNT(CASE
			WHEN temp.Judge = 'NG' THEN 1
		END) AS TotalNG,
		COUNT(CASE
			WHEN temp.Judge = 'OK' THEN 1
		END) AS TotalOK
	FROM
		tempDataTotalNG AS temp
	GROUP BY temp.CodeModel
	ORDER BY (TotalNG + TotalOK) DESC; 

    DROP TEMPORARY TABLE IF EXISTS tempDataTotalNG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_ClearAllPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_ClearAllPlan`()
BEGIN
    DECLARE _hournow int;
    Set _hournow = hour(now());
IF(_hournow > 5) then
		DELETE FROM `dataplc`.`dataplan`
        where DATE(dataplan.TimeUpdate) = DATE(NOW());
        DELETE FROM `dataplc`.`dataplanca1`
        where  DATE(dataplanca1.TimeUpdate) = DATE(NOW());
        DELETE FROM `dataplc`.`dataplanca2`
        where DATE(dataplanca2.TimeUpdate) = DATE(NOW());
        DELETE FROM `dataplc`.`dataplanca3`
        where DATE(dataplanca3.TimeUpdate) = DATE(NOW());
ELSE
		DELETE FROM `dataplc`.`dataplan`
        where  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
        DELETE FROM `dataplc`.`dataplanca1`
        where  Date(dataplanca1.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
        DELETE FROM `dataplc`.`dataplanca2`
        where  Date(dataplanca2.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
        DELETE FROM `dataplc`.`dataplanca3`
        where Date(dataplanca3.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_GetStartTimeAndEndTimePlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_GetStartTimeAndEndTimePlan`(IN _Shift varchar(5))
BEGIN
 DECLARE _hournow int;
    Set _hournow = hour(now());
    if(_Shift = '1') then
		 IF(_hournow > 5) then
	select * from dataplanca1 
        where Model = 'Total' AND DATE(dataplanca1.TimeUpdate) = DATE(NOW());
    ELSE
	select * from dataplanca1 
        where Model = 'Total' AND Date(dataplanca1.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
    elseif(_Shift = '2') then
		 IF(_hournow > 5) then
	select * from dataplanca2 
        where Model = 'Total' AND DATE(dataplanca2.TimeUpdate) = DATE(NOW());
    ELSE
	select * from dataplanca2 
        where Model = 'Total' AND Date(dataplanca2.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
    elseif(_Shift = '3') then
		 IF(_hournow > 5) then
	select * from dataplanca3 
        where Model = 'Total' AND DATE(dataplanca3.TimeUpdate) = DATE(NOW());
    ELSE
	select * from dataplanca3 
        where Model = 'Total' AND Date(dataplanca3.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
    else
		 IF(_hournow > 5) then
	select * from dataplan 
        where Model = 'Total' AND DATE(dataplan.TimeUpdate) = DATE(NOW());
    ELSE
	select * from dataplan 
        where Model = 'Total' AND Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_LoadDataForBarChartPlanGas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_LoadDataForBarChartPlanGas`(IN _Shift varchar(5))
BEGIN
	DECLARE _hournow int;
    Set _hournow = hour(now());
	IF(_Shift = '1') Then
	IF(_hournow > 5) then
SET @StartDate = CONCAT(CURRENT_DATE, ' 06:00:00');
SET @EndDate = CONCAT(CURRENT_DATE, ' 14:00:00');
SELECT dataplanca1.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplanca1.QuantityDay,dataplanca1.QuantityPerSec,dataplanca1.TimeStart,dataplanca1.TimeEnd,dataplanca1.TotalTime
FROM dataplanca1
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplanca1
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND TimePLC Between @StartDate  and @EndDate 
    ) AS b ON dataplanca1.Model = b.CodeModel
    WHERE dataplanca1.Model <> 'ToTal' AND DATE(dataplanca1.TimeUpdate) = DATE(NOW())
    GROUP BY dataplanca1.Model
) AS c ON dataplanca1.Model = c.Model where dataplanca1.Model <> 'ToTal' AND DATE(dataplanca1.TimeUpdate) = DATE(NOW());
    else 
SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
SET @EndDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 14:00:00');
    SELECT dataplanca1.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplanca1.QuantityDay,dataplanca1.QuantityPerSec,dataplanca1.TimeStart,dataplanca1.TimeEnd,dataplanca1.TotalTime
FROM dataplanca1
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplanca1
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND TimePLC Between @StartDate  and @EndDate 
    ) AS b ON dataplanca1.Model = b.CodeModel
    WHERE dataplanca1.Model <> 'ToTal' AND Date(dataplanca1.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
    GROUP BY dataplanca1.Model
) AS c ON dataplanca1.Model = c.Model where dataplanca1.Model <> 'ToTal' AND Date(dataplanca1.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
end IF;
	ELSEIF(_Shift = '2') Then
IF(_hournow > 5) then
SET @StartDate = CONCAT(CURRENT_DATE, ' 14:00:00');
SET @EndDate = CONCAT(CURRENT_DATE, ' 22:00:00');
SELECT dataplanca2.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplanca2.QuantityDay,dataplanca2.QuantityPerSec,dataplanca2.TimeStart,dataplanca2.TimeEnd,dataplanca2.TotalTime
FROM dataplanca2
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplanca2
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND TimePLC Between @StartDate  and @EndDate 
    ) AS b ON dataplanca2.Model = b.CodeModel
    WHERE dataplanca2.Model <> 'ToTal' AND DATE(dataplanca2.TimeUpdate) = DATE(NOW())
    GROUP BY dataplanca2.Model
) AS c ON dataplanca2.Model = c.Model where dataplanca2.Model <> 'ToTal' AND DATE(dataplanca2.TimeUpdate) = DATE(NOW());
    else 
SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 14:00:00');
SET @EndDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 22:00:00');
    SELECT dataplanca2.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplanca2.QuantityDay,dataplanca2.QuantityPerSec,dataplanca2.TimeStart,dataplanca2.TimeEnd,dataplanca2.TotalTime
FROM dataplanca2
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplanca2
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND TimePLC Between @StartDate  and @EndDate 
    ) AS b ON dataplanca2.Model = b.CodeModel
    WHERE dataplanca2.Model <> 'ToTal' AND Date(dataplanca2.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
    GROUP BY dataplanca2.Model
) AS c ON dataplanca2.Model = c.Model where dataplanca2.Model <> 'ToTal' AND Date(dataplanca2.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
end if;
	ELSEIF(_Shift = '3') Then
IF(_hournow > 5) then
SET @StartDate = CONCAT(CURRENT_DATE, ' 22:00:00');
SET @EndDate = CONCAT(DATE_ADD(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
SELECT dataplanca3.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplanca3.QuantityDay,dataplanca3.QuantityPerSec,dataplanca3.TimeStart,dataplanca3.TimeEnd,dataplanca3.TotalTime
FROM dataplanca3
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplanca3
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND TimePLC Between @StartDate  and @EndDate 
    ) AS b ON dataplanca3.Model = b.CodeModel
    WHERE dataplanca3.Model <> 'ToTal' AND DATE(dataplanca3.TimeUpdate) = DATE(NOW())
    GROUP BY dataplanca3.Model
) AS c ON dataplanca3.Model = c.Model where dataplanca3.Model <> 'ToTal' AND DATE(dataplanca3.TimeUpdate) = DATE(NOW());
    else 
SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 22:00:00');
SET @EndDate = CONCAT(CURRENT_DATE, ' 06:00:00');
    SELECT dataplanca3.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplanca3.QuantityDay,dataplanca3.QuantityPerSec,dataplanca3.TimeStart,dataplanca3.TimeEnd,dataplanca3.TotalTime
FROM dataplanca3
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplanca3
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND TimePLC Between @StartDate  and @EndDate 
    ) AS b ON dataplanca3.Model = b.CodeModel
    WHERE dataplanca3.Model <> 'ToTal' AND Date(dataplanca3.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
    GROUP BY dataplanca3.Model
) AS c ON dataplanca3.Model = c.Model where dataplanca3.Model <> 'ToTal' AND Date(dataplanca3.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
end if;
	ELSE
		IF(_hournow > 5) then
SELECT dataplan.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplan.QuantityDay,dataplan.QuantityPerSec,dataplan.TimeStart,dataplan.TimeEnd,dataplan.TotalTime
FROM dataplan
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplan
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND DATE(TimePLC) = CURDATE() AND HOUR(TimePLC) > 5
    ) AS b ON dataplan.Model = b.CodeModel
    WHERE dataplan.Model <> 'ToTal' AND DATE(dataplan.TimeUpdate) = DATE(NOW())
    GROUP BY dataplan.Model
) AS c ON dataplan.Model = c.Model where dataplan.Model <> 'ToTal' AND DATE(dataplan.TimeUpdate) = DATE(NOW());
    else 
    SELECT dataplan.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplan.QuantityDay,dataplan.QuantityPerSec,dataplan.TimeStart,dataplan.TimeEnd,dataplan.TotalTime
FROM dataplan
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplan
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND ((Date(TimePLC) = curdate() and hour(TimePLC)>= 0 AND hour(TimePLC) < 6) or (DATE_SUB(CURDATE(), INTERVAL 1 DAY) = Date(TimePLC) AND hour(TimePLC)>5))
    ) AS b ON dataplan.Model = b.CodeModel
    WHERE dataplan.Model <> 'ToTal' AND Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
    GROUP BY dataplan.Model
) AS c ON dataplan.Model = c.Model where dataplan.Model <> 'ToTal' AND Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
	END IF;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_LoadDataForBarChartPlanGasMonitor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_LoadDataForBarChartPlanGasMonitor`(IN _Shift varchar(5))
BEGIN
	DECLARE _hournow int;
    Set _hournow = hour(now());
IF(_Shift = '1') Then
 IF(_hournow > 5) then
SET @StartDate = CONCAT(CURRENT_DATE, ' 06:00:00');
SET @EndDate = CONCAT(CURRENT_DATE, ' 14:00:00');
SELECT dataplanca1.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplanca1.QuantityDay,dataplanca1.QuantityPerSec,dataplanca1.TimeStart,dataplanca1.TimeEnd,dataplanca1.TotalTime
FROM dataplanca1
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplanca1
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND TimePLC Between @StartDate  and @EndDate 
    ) AS b ON dataplanca1.Model = b.CodeModel
    WHERE dataplanca1.Model <> 'ToTal' AND DATE(dataplanca1.TimeUpdate) = DATE(NOW())
    GROUP BY dataplanca1.Model
) AS c ON dataplanca1.Model = c.Model where dataplanca1.Model <> 'ToTal' And MonitorSpecial =1 AND DATE(dataplanca1.TimeUpdate) = DATE(NOW());
    else 
SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
SET @EndDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 14:00:00');
    SELECT dataplanca1.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplanca1.QuantityDay,dataplanca1.QuantityPerSec,dataplanca1.TimeStart,dataplanca1.TimeEnd,dataplanca1.TotalTime
FROM dataplanca1
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplanca1
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND TimePLC Between @StartDate  and @EndDate
    ) AS b ON dataplanca1.Model = b.CodeModel
    WHERE dataplanca1.Model <> 'ToTal'   AND Date(dataplanca1.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
    GROUP BY dataplanca1.Model
) AS c ON dataplanca1.Model = c.Model where dataplanca1.Model <> 'ToTal' And MonitorSpecial =1 AND Date(dataplanca1.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
	END IF;
ELSEIF(_Shift = '2') Then
 IF(_hournow > 5) then
SET @StartDate = CONCAT(CURRENT_DATE, ' 14:00:00');
SET @EndDate = CONCAT(CURRENT_DATE, ' 22:00:00');
SELECT dataplanca2.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplanca2.QuantityDay,dataplanca2.QuantityPerSec,dataplanca2.TimeStart,dataplanca2.TimeEnd,dataplanca2.TotalTime
FROM dataplanca2
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplanca2
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND TimePLC Between @StartDate  and @EndDate 
    ) AS b ON dataplanca2.Model = b.CodeModel
    WHERE dataplanca2.Model <> 'ToTal' AND DATE(dataplanca2.TimeUpdate) = DATE(NOW())
    GROUP BY dataplanca2.Model
) AS c ON dataplanca2.Model = c.Model where dataplanca2.Model <> 'ToTal' And MonitorSpecial =1 AND DATE(dataplanca2.TimeUpdate) = DATE(NOW());
    else 
SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 14:00:00');
SET @EndDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 22:00:00');
    SELECT dataplanca2.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplanca2.QuantityDay,dataplanca2.QuantityPerSec,dataplanca2.TimeStart,dataplanca2.TimeEnd,dataplanca2.TotalTime
FROM dataplanca2
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplanca2
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND TimePLC Between @StartDate  and @EndDate
    ) AS b ON dataplanca2.Model = b.CodeModel
    WHERE dataplanca2.Model <> 'ToTal'   AND Date(dataplanca2.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
    GROUP BY dataplanca2.Model
) AS c ON dataplanca2.Model = c.Model where dataplanca2.Model <> 'ToTal' And MonitorSpecial =1 AND Date(dataplanca2.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
	END IF;
ELSEIF(_Shift = '3') Then
	 IF(_hournow > 5) then
SET @StartDate = CONCAT(CURRENT_DATE, ' 22:00:00');
SET @EndDate = CONCAT(DATE_ADD(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
SELECT dataplanca3.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplanca3.QuantityDay,dataplanca3.QuantityPerSec,dataplanca3.TimeStart,dataplanca3.TimeEnd,dataplanca3.TotalTime
FROM dataplanca3
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplanca3
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND TimePLC Between @StartDate  and @EndDate 
    ) AS b ON dataplanca3.Model = b.CodeModel
    WHERE dataplanca3.Model <> 'ToTal' AND DATE(dataplanca3.TimeUpdate) = DATE(NOW())
    GROUP BY dataplanca3.Model
) AS c ON dataplanca3.Model = c.Model where dataplanca3.Model <> 'ToTal' And MonitorSpecial =1 AND DATE(dataplanca3.TimeUpdate) = DATE(NOW());
    else 
SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 22:00:00');
SET @EndDate = CONCAT(CURRENT_DATE, ' 06:00:00');
    SELECT dataplanca3.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplanca3.QuantityDay,dataplanca3.QuantityPerSec,dataplanca3.TimeStart,dataplanca3.TimeEnd,dataplanca3.TotalTime
FROM dataplanca3
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplanca3
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND TimePLC Between @StartDate  and @EndDate
    ) AS b ON dataplanca3.Model = b.CodeModel
    WHERE dataplanca3.Model <> 'ToTal'   AND Date(dataplanca3.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
    GROUP BY dataplanca3.Model
) AS c ON dataplanca3.Model = c.Model where dataplanca3.Model <> 'ToTal' And MonitorSpecial =1 AND Date(dataplanca3.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
	END IF;
ELSE
	    IF(_hournow > 5) then
SELECT dataplan.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplan.QuantityDay,dataplan.QuantityPerSec,dataplan.TimeStart,dataplan.TimeEnd,dataplan.TotalTime
FROM dataplan
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplan
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND DATE(TimePLC) = CURDATE() AND HOUR(TimePLC) > 5
    ) AS b ON dataplan.Model = b.CodeModel
    WHERE dataplan.Model <> 'ToTal' AND DATE(dataplan.TimeUpdate) = DATE(NOW())
    GROUP BY dataplan.Model
) AS c ON dataplan.Model = c.Model where dataplan.Model <> 'ToTal' And MonitorSpecial =1 AND DATE(dataplan.TimeUpdate) = DATE(NOW());
    else 
    SELECT dataplan.Model, COALESCE(c.QuantityActual, 0) AS QuantityActual, dataplan.QuantityDay,dataplan.QuantityPerSec,dataplan.TimeStart,dataplan.TimeEnd,dataplan.TotalTime
FROM dataplan
LEFT JOIN (
    SELECT Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM dataplan
    LEFT JOIN (
        SELECT * FROM gas
        WHERE Judge = 'OK' AND ((Date(TimePLC) = curdate() and hour(TimePLC)>= 0 AND hour(TimePLC) < 6) or (DATE_SUB(CURDATE(), INTERVAL 1 DAY) = Date(TimePLC) AND hour(TimePLC)>5))
    ) AS b ON dataplan.Model = b.CodeModel
    WHERE dataplan.Model <> 'ToTal'   AND Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
    GROUP BY dataplan.Model
) AS c ON dataplan.Model = c.Model where dataplan.Model <> 'ToTal' And MonitorSpecial =1 AND Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
	END IF;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_LoadDataForLineChartPlanGasByTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_LoadDataForLineChartPlanGasByTime`(IN _ModelName nvarchar(30),IN _Shift varchar(5))
BEGIN	
    DECLARE _hournow int;
    Set _hournow = hour(now());
if(_Shift = '1') then
	if (_ModelName = 'all') then
      IF(_hournow > 5) then
       SET @StartDate = CONCAT(CURRENT_DATE, ' 06:00:00');
	SET @EndDate = CONCAT(CURRENT_DATE, ' 14:00:00');
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplanca1
WHERE
    Model = 'Total'
        AND DATE(ta_tbl_dataplanca1.TimeUpdate) = DATE(NOW())
LIMIT 1;

      else
		SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
		SET @EndDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 14:00:00');
		
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplanca1
WHERE
    Model = 'Total'
        AND DATE(ta_tbl_dataplanca1.TimeUpdate) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
LIMIT 1;

        END IF;
   else
     IF(_hournow > 5) then
       SET @StartDate = CONCAT(CURRENT_DATE, ' 06:00:00');
	SET @EndDate = CONCAT(CURRENT_DATE, ' 14:00:00');
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate and CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplanca1
WHERE
    Model = _ModelName
        AND DATE(ta_tbl_dataplanca1.TimeUpdate) = DATE(NOW())
LIMIT 1;

      else
		SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
		SET @EndDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 14:00:00');
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate  and CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplanca1
WHERE
    Model = _ModelName
        AND DATE(ta_tbl_dataplanca1.TimeUpdate) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
LIMIT 1;

        END IF;
  END IF;
elseif(_Shift = '2') then
	if (_ModelName = 'all') then
      IF(_hournow > 5) then
       SET @StartDate = CONCAT(CURRENT_DATE, ' 14:00:00');
	SET @EndDate = CONCAT(CURRENT_DATE, ' 22:00:00');
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplanca2
WHERE
    Model = 'Total'
        AND DATE(ta_tbl_dataplanca2.TimeUpdate) = DATE(NOW())
LIMIT 1;

      else
		SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 14:00:00');
		SET @EndDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 22:00:00');
		
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplanca2
WHERE
    Model = 'Total'
        AND DATE(ta_tbl_dataplanca2.TimeUpdate) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
LIMIT 1;

        END IF;
   else
     IF(_hournow > 5) then
       SET @StartDate = CONCAT(CURRENT_DATE, ' 14:00:00');
	SET @EndDate = CONCAT(CURRENT_DATE, ' 22:00:00');
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate and CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplanca2
WHERE
    Model = _ModelName
        AND DATE(ta_tbl_dataplanca2.TimeUpdate) = DATE(NOW())
LIMIT 1;

      else
		SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 14:00:00');
		SET @EndDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 22:00:00');
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate  and CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplanca2
WHERE
    Model = _ModelName
        AND DATE(ta_tbl_dataplanca2.TimeUpdate) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
LIMIT 1;

        END IF;
  END IF;
elseif(_Shift = '3') then
	if (_ModelName = 'all') then
      IF(_hournow > 5) then
       SET @StartDate = CONCAT(CURRENT_DATE, ' 22:00:00');
	SET @EndDate = CONCAT(DATE_ADD(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplanca3
WHERE
    Model = 'Total'
        AND DATE(ta_tbl_dataplanca3.TimeUpdate) = DATE(NOW())
LIMIT 1;

      else
SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 22:00:00');
SET @EndDate = CONCAT(CURRENT_DATE, ' 06:00:00');
		
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplanca3
WHERE
    Model = 'Total'
        AND DATE(ta_tbl_dataplanca3.TimeUpdate) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
LIMIT 1;

        END IF;
   else
     IF(_hournow > 5) then
       SET @StartDate = CONCAT(CURRENT_DATE, ' 22:00:00');
	SET @EndDate = CONCAT(DATE_ADD(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate and CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplanca3
WHERE
    Model = _ModelName
        AND DATE(ta_tbl_dataplanca3.TimeUpdate) = DATE(NOW())
LIMIT 1;

      else
SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 22:00:00');
SET @EndDate = CONCAT(CURRENT_DATE, ' 06:00:00');
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate  and CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplanca3
WHERE
    Model = _ModelName
        AND DATE(ta_tbl_dataplanca3.TimeUpdate) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
LIMIT 1;

        END IF;
  END IF;
else
	if (_ModelName = 'all') then
      IF(_hournow > 5) then
       SET @StartDate = CONCAT(CURRENT_DATE, ' 06:00:00');
SET @EndDate = CONCAT(DATE_ADD(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplan
WHERE
    Model = 'Total'
        AND DATE(ta_tbl_dataplan.TimeUpdate) = DATE(NOW())
LIMIT 1;

      else
		SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
		SET @EndDate = CONCAT(CURRENT_DATE, ' 06:00:00');
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplan
WHERE
    Model = 'Total'
        AND DATE(ta_tbl_dataplan.TimeUpdate) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
LIMIT 1;

        END IF;
   else
     IF(_hournow > 5) then
        SET @StartDate = CONCAT(CURRENT_DATE, ' 06:00:00');
		SET @EndDate = CONCAT(DATE_ADD(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate and CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplan
WHERE
    Model = _ModelName
        AND DATE(ta_tbl_dataplan.TimeUpdate) = DATE(NOW())
LIMIT 1;

      else
		SET @StartDate = CONCAT(DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), ' 06:00:00');
		SET @EndDate = CONCAT(CURRENT_DATE, ' 06:00:00');
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN @StartDate AND @EndDate  and CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime
FROM
    ta_tbl_dataplan
WHERE
    Model = _ModelName
        AND DATE(ta_tbl_dataplan.TimeUpdate) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
LIMIT 1;

        END IF;
  END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_LoadDataPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_LoadDataPlan`()
BEGIN
	DECLARE _hournow int;
    Set _hournow = hour(now());
    IF(_hournow > 5) then
	SELECT * FROM dataplc.dataplan where Date(TimeUpdate) = Date(now()) and Model <> 'Total';
    ELSE
	SELECT * FROM dataplc.dataplan
        where Model <> 'Total' AND Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_LoadDataPlanCa1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_LoadDataPlanCa1`()
BEGIN
	DECLARE _hournow int;
    Set _hournow = hour(now());
    IF(_hournow > 5) then
	SELECT * FROM dataplc.dataplanca1 where Date(TimeUpdate) = Date(now()) and Model <> 'Total';
    ELSE
	SELECT * FROM dataplc.dataplanca1
        where Model <> 'Total' AND Date(dataplanca1.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_LoadDataPlanCa2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_LoadDataPlanCa2`()
BEGIN
	DECLARE _hournow int;
    Set _hournow = hour(now());
    IF(_hournow > 5) then
	SELECT * FROM dataplc.dataplanca2 where Date(dataplanca2.TimeUpdate) = Date(now()) and Model <> 'Total';
    ELSE
	SELECT * FROM dataplc.dataplanca2
        where Model <> 'Total' AND Date(dataplanca2.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_LoadDataPlanCa3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_LoadDataPlanCa3`()
BEGIN
	DECLARE _hournow int;
    Set _hournow = hour(now());
    IF(_hournow > 5) then
	SELECT * FROM dataplc.dataplanca3 where Date(dataplanca3.TimeUpdate) = Date(now()) and Model <> 'Total';
    ELSE
	SELECT * FROM dataplc.dataplanca3
        where Model <> 'Total' AND Date(dataplanca3.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_LoadQuantityPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_LoadQuantityPlan`(IN _ModelName nvarchar(30),IN _Shift varchar(5))
BEGIN
 DECLARE _hournow int;
 Set _hournow = hour(now());
if(_Shift  = 1) then
	IF(_hournow > 5) then
	 if (_ModelName = 'all') then
            select QuantityDay from dataplanca1 where Model = 'Total' and  Date(dataplanca1.TimeUpdate ) = Date(now());
         else
            select QuantityDay from dataplanca1 where Model = _ModelName and  Date(dataplanca1.TimeUpdate ) = Date(now());
         end if;
     else
	 if (_ModelName = 'all') then
            select QuantityDay from dataplanca1 where Model = 'Total' and  Date(dataplanca1.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
         else
            select QuantityDay from dataplanca1 where Model = _ModelName and  Date(dataplanca1.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
         end if; 
    END IF;
elseif(_Shift  = 2) then
	IF(_hournow > 5) then
	 if (_ModelName = 'all') then
            select QuantityDay from dataplanca2 where Model = 'Total' and  Date(dataplanca2.TimeUpdate ) = Date(now());
         else
            select QuantityDay from dataplanca2 where Model = _ModelName and  Date(dataplanca2.TimeUpdate ) = Date(now());
         end if;
     else
	 if (_ModelName = 'all') then
            select QuantityDay from dataplanca2 where Model = 'Total' and  Date(dataplanca2.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
         else
            select QuantityDay from dataplanca2 where Model = _ModelName and  Date(dataplanca2.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
         end if; 
    END IF;
elseif(_Shift  = 3) then
	IF(_hournow > 5) then
	 if (_ModelName = 'all') then
            select QuantityDay from dataplanca3 where Model = 'Total' and  Date(dataplanca3.TimeUpdate ) = Date(now());
         else
            select QuantityDay from dataplanca3 where Model = _ModelName and  Date(dataplanca3.TimeUpdate ) = Date(now());
         end if;
     else
	 if (_ModelName = 'all') then
            select QuantityDay from dataplanca3 where Model = 'Total' and  Date(dataplanca3.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
         else
            select QuantityDay from dataplanca3 where Model = _ModelName and  Date(dataplanca3.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
         end if; 
    END IF;
else
IF(_hournow > 5) then
	 if (_ModelName = 'all') then
            select QuantityDay from dataplan where Model = 'Total' and  Date(dataplan.TimeUpdate ) = Date(now());
         else
            select QuantityDay from dataplan where Model = _ModelName and  Date(dataplan.TimeUpdate ) = Date(now());
         end if;
     else
	 if (_ModelName = 'all') then
            select QuantityDay from dataplan where Model = 'Total' and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
         else
            select QuantityDay from dataplan where Model = _ModelName and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
         end if; 
    END IF;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_MonitorSpecial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_MonitorSpecial`(IN _ModelName nvarchar(30),IN _Shift varchar(5))
BEGIN
		DECLARE _hournow int;
    	Set _hournow = hour(now());
        IF(_Shift = '1') then
			IF(_hournow > 5) then
		if(exists(select MonitorSpecial from dataplanca1 where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`dataplanca1`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName and  Date(dataplanca1.TimeUpdate ) = Date(now());
		else
			UPDATE `dataplc`.`dataplanca1`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName and  Date(dataplanca1.TimeUpdate ) = Date(now());
		end if;
    	else
		if(exists(select MonitorSpecial from dataplanca1 where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`dataplanca1`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName and  Date(dataplanca1.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
		else
			UPDATE `dataplc`.`dataplanca1`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName and  Date(dataplanca1.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
		end if;     		
    	END IF;
        elseif(_Shift = '2') then
			IF(_hournow > 5) then
		if(exists(select MonitorSpecial from dataplanca2 where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`dataplanca2`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName and  Date(dataplanca2.TimeUpdate ) = Date(now());
		else
			UPDATE `dataplc`.`dataplanca2`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName and  Date(dataplanca2.TimeUpdate ) = Date(now());
		end if;
    	else
		if(exists(select MonitorSpecial from dataplanca2 where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`dataplanca2`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName and  Date(dataplanca2.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
		else
			UPDATE `dataplc`.`dataplanca2`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName and  Date(dataplanca2.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
		end if;     		
    	END IF;
        elseif(_Shift = '3') then
			IF(_hournow > 5) then
		if(exists(select MonitorSpecial from dataplanca3 where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`dataplanca3`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName and  Date(dataplanca3.TimeUpdate ) = Date(now());
		else
			UPDATE `dataplc`.`dataplanca3`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName and  Date(dataplanca3.TimeUpdate ) = Date(now());
		end if;
    	else
		if(exists(select MonitorSpecial from dataplanca3 where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`dataplanca3`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName and  Date(dataplanca3.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
		else
			UPDATE `dataplc`.`dataplanca3`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName and  Date(dataplanca3.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
		end if;     		
    	END IF;
        else
			IF(_hournow > 5) then
		if(exists(select MonitorSpecial from dataplan where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`dataplan`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName and  Date(dataplan.TimeUpdate ) = Date(now());
		else
			UPDATE `dataplc`.`dataplan`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName and  Date(dataplan.TimeUpdate ) = Date(now());
		end if;
    	else
		if(exists(select MonitorSpecial from dataplan where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`dataplan`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
		else
			UPDATE `dataplc`.`dataplan`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
		end if;     		
    	END IF;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_ClearAllPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_ClearAllPlan`()
BEGIN	
		DELETE FROM `dataplc`.`ta_tbl_dataplan`;
        DELETE FROM `dataplc`.`ta_tbl_dataplanca1`;
        DELETE FROM `dataplc`.`ta_tbl_dataplanca2`;
        DELETE FROM `dataplc`.`ta_tbl_dataplanca3`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_GetStartTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_GetStartTime`()
BEGIN
    SELECT * FROM dataplc.ta_tbl_dataplan where Model = 'Total';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_GetStartTimeAndEndTimePlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_GetStartTimeAndEndTimePlan`(IN _Shift varchar(5))
BEGIN
    if(_Shift = '1') then
	select * from ta_tbl_dataplanca1 
        where Model = 'Total';
    elseif(_Shift = '2') then
	select * from ta_tbl_dataplanca2
        where Model = 'Total';
    elseif(_Shift = '3') then
	select * from ta_tbl_dataplanca3
        where Model = 'Total';
    else
	select * from ta_tbl_dataplan 
        where Model = 'Total';
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_LoadDataForBarChartPlanGas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_LoadDataForBarChartPlanGas`(IN _Shift varchar(5))
BEGIN
	Declare _StartDate datetime;
    Declare _EndDate datetime;
	IF(_Shift = '1') Then
    SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplanca1 where Model = 'Total';
	
SELECT 
    ta_tbl_dataplanca1.Model,
    COALESCE(c.QuantityActual, 0) AS QuantityActual,
    ta_tbl_dataplanca1.QuantityDay,
    ta_tbl_dataplanca1.QuantityPerSec,
    ta_tbl_dataplanca1.TimeStart,
    ta_tbl_dataplanca1.TimeEnd,
    ta_tbl_dataplanca1.TotalTime,
    ta_tbl_dataplanca1.TypePlan
FROM
    ta_tbl_dataplanca1
        LEFT JOIN
    (SELECT 
        Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM
        ta_tbl_dataplanca1
    LEFT JOIN (SELECT 
        *
    FROM
        gas
    WHERE
        Judge = 'OK'
            AND TimePLC BETWEEN _StartDate AND _EndDate) AS b ON ta_tbl_dataplanca1.Model = b.CodeModel
    WHERE
        ta_tbl_dataplanca1.Model <> 'ToTal'
            
    GROUP BY ta_tbl_dataplanca1.Model) AS c ON ta_tbl_dataplanca1.Model = c.Model
WHERE
    ta_tbl_dataplanca1.Model <> 'ToTal';
   
	ELSEIF(_Shift = '2') Then
    SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplanca2 where Model = 'Total';
SELECT 
    ta_tbl_dataplanca2.Model,
    COALESCE(c.QuantityActual, 0) AS QuantityActual,
    ta_tbl_dataplanca2.QuantityDay,
    ta_tbl_dataplanca2.QuantityPerSec,
    ta_tbl_dataplanca2.TimeStart,
    ta_tbl_dataplanca2.TimeEnd,
    ta_tbl_dataplanca2.TotalTime,
    ta_tbl_dataplanca2.TypePlan
FROM
    ta_tbl_dataplanca2
        LEFT JOIN
    (SELECT 
        Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM
        ta_tbl_dataplanca2
    LEFT JOIN (SELECT 
        *
    FROM
        gas
    WHERE
        Judge = 'OK'
            AND TimePLC BETWEEN _StartDate AND _EndDate) AS b ON ta_tbl_dataplanca2.Model = b.CodeModel
    WHERE
        ta_tbl_dataplanca2.Model <> 'ToTal'
            
    GROUP BY ta_tbl_dataplanca2.Model) AS c ON ta_tbl_dataplanca2.Model = c.Model
WHERE
    ta_tbl_dataplanca2.Model <> 'ToTal';
    
	ELSEIF(_Shift = '3') Then
    SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplanca3 where Model = 'Total';
    
SELECT 
    ta_tbl_dataplanca3.Model,
    COALESCE(c.QuantityActual, 0) AS QuantityActual,
    ta_tbl_dataplanca3.QuantityDay,
    ta_tbl_dataplanca3.QuantityPerSec,
    ta_tbl_dataplanca3.TimeStart,
    ta_tbl_dataplanca3.TimeEnd,
    ta_tbl_dataplanca3.TotalTime,
    ta_tbl_dataplanca3.TypePlan
FROM
    ta_tbl_dataplanca3
        LEFT JOIN
    (SELECT 
        Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM
        ta_tbl_dataplanca3
    LEFT JOIN (SELECT 
        *
    FROM
        gas
    WHERE
        Judge = 'OK'
            AND TimePLC BETWEEN _StartDate AND _EndDate) AS b ON ta_tbl_dataplanca3.Model = b.CodeModel
    WHERE
        ta_tbl_dataplanca3.Model <> 'ToTal'
            
    GROUP BY ta_tbl_dataplanca3.Model) AS c ON ta_tbl_dataplanca3.Model = c.Model
WHERE
    ta_tbl_dataplanca3.Model <> 'ToTal';

	ELSE
    SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplan where Model = 'Total';
    
	
SELECT 
    ta_tbl_dataplan.Model,
    COALESCE(c.QuantityActual, 0) AS QuantityActual,
    ta_tbl_dataplan.QuantityDay,
    ta_tbl_dataplan.QuantityPerSec,
    ta_tbl_dataplan.TimeStart,
    ta_tbl_dataplan.TimeEnd,
    ta_tbl_dataplan.TotalTime,
    ta_tbl_dataplan.TypePlan
FROM
    ta_tbl_dataplan
        LEFT JOIN
    (SELECT 
        Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM
        ta_tbl_dataplan
    LEFT JOIN (SELECT 
        *
    FROM
        gas
    WHERE
        Judge = 'OK'
            AND TimePLC BETWEEN _StartDate AND _EndDate) AS b ON ta_tbl_dataplan.Model = b.CodeModel
    WHERE
        ta_tbl_dataplan.Model <> 'ToTal'
            
    GROUP BY ta_tbl_dataplan.Model) AS c ON ta_tbl_dataplan.Model = c.Model
WHERE
    ta_tbl_dataplan.Model <> 'ToTal';
    
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_LoadDataForBarChartPlanGasMonitor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_LoadDataForBarChartPlanGasMonitor`(IN _Shift varchar(5))
BEGIN
	Declare _StartDate datetime;
    Declare _EndDate datetime;
	IF(_Shift = '1') Then
    SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplanca1 where Model = 'Total';
	
SELECT 
    ta_tbl_dataplanca1.Model,
    COALESCE(c.QuantityActual, 0) AS QuantityActual,
    ta_tbl_dataplanca1.QuantityDay,
    ta_tbl_dataplanca1.QuantityPerSec,
    ta_tbl_dataplanca1.TimeStart,
    ta_tbl_dataplanca1.TimeEnd,
    ta_tbl_dataplanca1.TotalTime,
    ta_tbl_dataplanca1.TypePlan
FROM
    ta_tbl_dataplanca1
        LEFT JOIN
    (SELECT 
        Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM
        ta_tbl_dataplanca1
    LEFT JOIN (SELECT 
        *
    FROM
        gas
    WHERE
        Judge = 'OK'
            AND TimePLC BETWEEN _StartDate AND _EndDate) AS b ON ta_tbl_dataplanca1.Model = b.CodeModel
    WHERE
        ta_tbl_dataplanca1.Model <> 'ToTal'
            
    GROUP BY ta_tbl_dataplanca1.Model) AS c ON ta_tbl_dataplanca1.Model = c.Model
WHERE
	
    ta_tbl_dataplanca1.Model <> 'ToTal' AND MonitorSpecial = 1;
   
	ELSEIF(_Shift = '2') Then
    SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplanca2 where Model = 'Total';
    
	
SELECT 
    ta_tbl_dataplanca2.Model,
    COALESCE(c.QuantityActual, 0) AS QuantityActual,
    ta_tbl_dataplanca2.QuantityDay,
    ta_tbl_dataplanca2.QuantityPerSec,
    ta_tbl_dataplanca2.TimeStart,
    ta_tbl_dataplanca2.TimeEnd,
    ta_tbl_dataplanca2.TotalTime,
    ta_tbl_dataplanca2.TypePlan
FROM
    ta_tbl_dataplanca2
        LEFT JOIN
    (SELECT 
        Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM
        ta_tbl_dataplanca2
    LEFT JOIN (SELECT 
        *
    FROM
        gas
    WHERE
        Judge = 'OK'
            AND TimePLC BETWEEN @StartDate AND @EndDate) AS b ON ta_tbl_dataplanca2.Model = b.CodeModel
    WHERE
        ta_tbl_dataplanca2.Model <> 'ToTal'
            
    GROUP BY ta_tbl_dataplanca2.Model) AS c ON ta_tbl_dataplanca2.Model = c.Model
WHERE
    ta_tbl_dataplanca2.Model <> 'ToTal' AND MonitorSpecial = 1;
   
	ELSEIF(_Shift = '3') Then
    SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplanca3 where Model = 'Total';
    
	
SELECT 
    ta_tbl_dataplanca3.Model,
    COALESCE(c.QuantityActual, 0) AS QuantityActual,
    ta_tbl_dataplanca3.QuantityDay,
    ta_tbl_dataplanca3.QuantityPerSec,
    ta_tbl_dataplanca3.TimeStart,
    ta_tbl_dataplanca3.TimeEnd,
    ta_tbl_dataplanca3.TotalTime,
    ta_tbl_dataplanca3.TypePlan
FROM
    ta_tbl_dataplanca3
        LEFT JOIN
    (SELECT 
        Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM
        ta_tbl_dataplanca3
    LEFT JOIN (SELECT 
        *
    FROM
        gas
    WHERE
        Judge = 'OK'
            AND TimePLC BETWEEN @StartDate AND @EndDate) AS b ON ta_tbl_dataplanca3.Model = b.CodeModel
    WHERE
        ta_tbl_dataplanca3.Model <> 'ToTal'
            
    GROUP BY ta_tbl_dataplanca3.Model) AS c ON ta_tbl_dataplanca3.Model = c.Model
WHERE
    ta_tbl_dataplanca3.Model <> 'ToTal' AND MonitorSpecial = 1;
   
	ELSE
    SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplan where Model = 'Total';
	
SELECT 
    ta_tbl_dataplan.Model,
    COALESCE(c.QuantityActual, 0) AS QuantityActual,
    ta_tbl_dataplan.QuantityDay,
    ta_tbl_dataplan.QuantityPerSec,
    ta_tbl_dataplan.TimeStart,
    ta_tbl_dataplan.TimeEnd,
    ta_tbl_dataplan.TotalTime,
    ta_tbl_dataplan.TypePlan
FROM
    ta_tbl_dataplan
        LEFT JOIN
    (SELECT 
        Model, COUNT(DISTINCT CodeBack) AS QuantityActual
    FROM
        ta_tbl_dataplan
    LEFT JOIN (SELECT 
        *
    FROM
        gas
    WHERE
        Judge = 'OK'
            AND TimePLC BETWEEN _StartDate AND _EndDate) AS b ON ta_tbl_dataplan.Model = b.CodeModel
    WHERE
        ta_tbl_dataplan.Model <> 'ToTal'
            
    GROUP BY ta_tbl_dataplan.Model) AS c ON ta_tbl_dataplan.Model = c.Model
WHERE
    ta_tbl_dataplan.Model <> 'ToTal' AND MonitorSpecial = 1;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_LoadDataForLineChartPlancheckfinalByTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_LoadDataForLineChartPlancheckfinalByTime`(IN _ModelName nvarchar(30),IN _Shift varchar(5))
BEGIN	
   Declare _StartDate datetime;
   Declare _EndDate datetime;
if(_Shift = '1') then
	 SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplanca1 where Model = 'Total';
	if (_ModelName = 'all') then
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimeUpdate`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    datacheckfinal AS ta
WHERE
    ta.TimeUpdate BETWEEN _StartDate AND _EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplanca1
WHERE
    Model = 'Total'
LIMIT 1;
   else
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimeUpdate`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    datacheckfinal AS ta
WHERE
    ta.TimeUpdate BETWEEN _StartDate AND _EndDate
        AND CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplanca1
WHERE
    Model = _ModelName
LIMIT 1;
  END IF;
elseif(_Shift = '2') then
		 SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplanca2 where Model = 'Total';
	if (_ModelName = 'all') then
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimeUpdate`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    datacheckfinal AS ta
WHERE
    ta.TimeUpdate BETWEEN _StartDate AND _EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplanca2
WHERE
    Model = 'Total'
LIMIT 1;
   else
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimeUpdate`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    datacheckfinal AS ta
WHERE
    ta.TimeUpdate BETWEEN _StartDate AND _EndDate
        AND CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplanca2
WHERE
    Model = _ModelName
LIMIT 1;
  END IF;
elseif(_Shift = '3') then
		 SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplanca3 where Model = 'Total';
	if (_ModelName = 'all') then
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimeUpdate`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    datacheckfinal AS ta
WHERE
    ta.TimeUpdate BETWEEN _StartDate AND _EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplanca3
WHERE
    Model = 'Total'
LIMIT 1;
   else
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimeUpdate`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    datacheckfinal AS ta
WHERE
    ta.TimeUpdate BETWEEN _StartDate AND _EndDate
        AND CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplanca3
WHERE
    Model = _ModelName
LIMIT 1;
  END IF;
else
		 SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplan where Model = 'Total';
	if (_ModelName = 'all') then
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimeUpdate`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    datacheckfinal AS ta
WHERE
    ta.TimeUpdate BETWEEN _StartDate AND _EndDate and Judge_Total = 'OK'
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplan
WHERE
    Model = 'Total'
LIMIT 1;
   else
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimeUpdate`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    datacheckfinal AS ta
WHERE
    ta.TimeUpdate BETWEEN _StartDate AND _EndDate
        AND CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplan
WHERE
    Model = _ModelName
LIMIT 1;
  END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_LoadDataForLineChartPlanGasByTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_LoadDataForLineChartPlanGasByTime`(IN _ModelName nvarchar(30),IN _Shift varchar(5))
BEGIN	
   Declare _StartDate datetime;
   Declare _EndDate datetime;
if(_Shift = '1') then
	 SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplanca1 where Model = 'Total';
	if (_ModelName = 'all') then
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN _StartDate AND _EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplanca1
WHERE
    Model = 'Total'
LIMIT 1;
   else
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN _StartDate AND _EndDate
        AND CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplanca1
WHERE
    Model = _ModelName
LIMIT 1;
  END IF;
elseif(_Shift = '2') then
		 SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplanca2 where Model = 'Total';
	if (_ModelName = 'all') then
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN _StartDate AND _EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplanca2
WHERE
    Model = 'Total'
LIMIT 1;
   else
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN _StartDate AND _EndDate
        AND CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplanca2
WHERE
    Model = _ModelName
LIMIT 1;
  END IF;
elseif(_Shift = '3') then
		 SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplanca3 where Model = 'Total';
	if (_ModelName = 'all') then
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN _StartDate AND _EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplanca3
WHERE
    Model = 'Total'
LIMIT 1;
   else
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN _StartDate AND _EndDate
        AND CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplanca3
WHERE
    Model = _ModelName
LIMIT 1;
  END IF;
else
		 SELECT TimeStart,TimeEnd into _StartDate, _EndDate FROM dataplc.ta_tbl_dataplan where Model = 'Total';
	if (_ModelName = 'all') then
SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN _StartDate AND _EndDate
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplan
WHERE
    Model = 'Total'
LIMIT 1;
   else
		SELECT 
    FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(`TimePLC`) / 300) * 300 + 300) AS TimeDataActual,
    COUNT(DISTINCT ta.CodeBack) AS mycount
FROM
    gas_ok AS ta
WHERE
    ta.TimePLC BETWEEN _StartDate AND _EndDate
        AND CodeModel = _ModelName
GROUP BY TimeDataActual;
SELECT 
    TimeStart, TimeEnd, QuantityDay, QuantityPerSec, TotalTime,TypePlan
FROM
    ta_tbl_dataplan
WHERE
    Model = _ModelName
LIMIT 1;
  END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_LoadDataPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_LoadDataPlan`()
BEGIN
	
	SELECT * FROM dataplc.ta_tbl_dataplan where Model <> 'Total';
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_LoadDataPlanCa1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_LoadDataPlanCa1`()
BEGIN		
	SELECT * FROM dataplc.ta_tbl_dataplanca1 where Model <> 'Total';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_LoadDataPlanCa2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_LoadDataPlanCa2`()
BEGIN
	SELECT * FROM dataplc.ta_tbl_dataplanca2 where Model <> 'Total';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_LoadDataPlanCa3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_LoadDataPlanCa3`()
BEGIN
	SELECT * FROM dataplc.ta_tbl_dataplanca3 where Model <> 'Total';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_LoadModelPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_LoadModelPlan`()
BEGIN
	
   SELECT Model FROM ta_tbl_dataplan  where Model <> 'Total';
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_LoadQuantityPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_LoadQuantityPlan`(IN _ModelName nvarchar(30),IN _Shift varchar(5))
BEGIN
	
if(_Shift  = 1) then
	 if (_ModelName = 'all') then
            select QuantityDay from ta_tbl_dataplanca1 where Model = 'Total';
             SELECT * FROM dataplc.ta_tbl_dataplan where Model = 'Total';
         else
            select QuantityDay from ta_tbl_dataplanca1 where Model = _ModelName;
             SELECT * FROM dataplc.ta_tbl_dataplan where Model = 'Total';
         end if;
elseif(_Shift  = 2) then
	
	 if (_ModelName = 'all') then
            select QuantityDay from ta_tbl_dataplanca2 where Model = 'Total';
            SELECT * FROM dataplc.ta_tbl_dataplan where Model = 'Total';
         else
            select QuantityDay from ta_tbl_dataplanca2 where Model = _ModelName;
            SELECT * FROM dataplc.ta_tbl_dataplan where Model = 'Total';
         end if;
         
elseif(_Shift  = 3) then
	 if (_ModelName = 'all') then
            select QuantityDay from ta_tbl_dataplanca3 where Model = 'Total';
            SELECT * FROM dataplc.ta_tbl_dataplan where Model = 'Total';
         else
            select QuantityDay from ta_tbl_dataplanca3 where Model = _ModelName;
            SELECT * FROM dataplc.ta_tbl_dataplan where Model = 'Total';
         end if;
else

	 if (_ModelName = 'all') then
            select QuantityDay from ta_tbl_dataplan where Model = 'Total';
            SELECT * FROM dataplc.ta_tbl_dataplan where Model = 'Total';
         else
            select QuantityDay from ta_tbl_dataplan where Model = _ModelName;
            SELECT * FROM dataplc.ta_tbl_dataplan where Model = 'Total';
         end if;
    
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_LoadShift` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_LoadShift`()
BEGIN	
		SELECT * FROM dataplc.ta_tbl_dataplan where Model = 'Total';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_MonitorSpecial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_MonitorSpecial`(IN _ModelName nvarchar(30),IN _Shift varchar(5))
BEGIN
		DECLARE _hournow int;
    	Set _hournow = hour(now());
        IF(_Shift = '1') then
		if(exists(select MonitorSpecial from ta_tbl_dataplanca1 where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`ta_tbl_dataplanca1`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName;
		else
			UPDATE `dataplc`.`ta_tbl_dataplanca1`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName;
		end if;
        elseif(_Shift = '2') then
			
		if(exists(select MonitorSpecial from ta_tbl_dataplanca2 where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`ta_tbl_dataplanca2`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName; 
		else
			UPDATE `dataplc`.`ta_tbl_dataplanca2`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName;
		end if;
        elseif(_Shift = '3') then
			
		if(exists(select MonitorSpecial from ta_tbl_dataplanca3 where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`ta_tbl_dataplanca3`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName;
		else
			UPDATE `dataplc`.`ta_tbl_dataplanca3`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName;
		end if;
        else
		if(exists(select MonitorSpecial from ta_tbl_dataplan where Model = _ModelName and MonitorSpecial = 0))  then
			UPDATE `dataplc`.`ta_tbl_dataplan`
			SET `MonitorSpecial` = 1
			WHERE Model = _ModelName;
		else
			UPDATE `dataplc`.`ta_tbl_dataplan`
			SET `MonitorSpecial` = 0
			WHERE Model = _ModelName;
		end if;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_sp_UpdateDateTimePlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_sp_UpdateDateTimePlan`(IN _ModelName nvarchar(30),IN _TimeFrom datetime,IN _TimeTo datetime,IN _TotalTime double,IN _Shift varchar(5))
BEGIN
	DECLARE _hournow int;
    	Set _hournow = hour(now());
        
        if(_Shift = '1') then
			
		UPDATE `dataplc`.`ta_tbl_dataplanca1`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName;
    	
        elseif(_Shift = '2') then
			
		UPDATE `dataplc`.`ta_tbl_dataplanca2`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName;
    	
        elseif(_Shift = '3') then
			
		UPDATE `dataplc`.`ta_tbl_dataplanca3`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName;
    	
        else
       
		UPDATE `dataplc`.`ta_tbl_dataplan`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName;
        end if;
        
        
    	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TA_UpdateDateTimePlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `TA_UpdateDateTimePlan`(IN _ModelName nvarchar(30),IN _TimeFrom datetime,IN _TimeTo datetime,IN _TotalTime double,IN _Shift varchar(5))
BEGIN
	DECLARE _hournow int;
    	Set _hournow = hour(now());
        
        if(_Shift = '1') then
			 IF(_hournow > 5) then
		UPDATE `dataplc`.`dataplanca1`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName and  Date(dataplanca1.TimeUpdate ) = Date(now());
    	else
		UPDATE `dataplc`.`dataplanca1`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName and  Date(dataplanca1.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    	END IF;
        elseif(_Shift = '2') then
			 IF(_hournow > 5) then
		UPDATE `dataplc`.`dataplanca2`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName and  Date(dataplanca2.TimeUpdate ) = Date(now());
    	else
		UPDATE `dataplc`.`dataplanca2`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName and  Date(dataplanca2.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    	END IF;
        elseif(_Shift = '3') then
			 IF(_hournow > 5) then
		UPDATE `dataplc`.`dataplanca3`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName and  Date(dataplanca3.TimeUpdate ) = Date(now());
    	else
		UPDATE `dataplc`.`dataplanca3`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName and  Date(dataplanca3.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    	END IF;
        else
        IF(_hournow > 5) then
		UPDATE `dataplc`.`dataplan`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName and  Date(dataplan.TimeUpdate ) = Date(now());
    	else
		UPDATE `dataplc`.`dataplan`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    	END IF;
        end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TestStored` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`192.168.3.178` PROCEDURE `TestStored`()
BEGIN
    CREATE TEMPORARY TABLE tempMonthYear (
        MonthYear VARCHAR(10)
    );
    
    INSERT INTO tempMonthYear
    SELECT DATE_FORMAT(DATE_SUB(CURRENT_DATE(), INTERVAL n MONTH), '%m-%Y') AS MonthYear
    FROM (
        SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL
        SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
        SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL
        SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11
    ) AS months;

    select * from tempMonthYear;
    
    DROP TEMPORARY TABLE IF EXISTS tempMonthYear;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateConfigConnectPlc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`%` PROCEDURE `UpdateConfigConnectPlc`(
    IpAddress VARCHAR(30),
    PortNumber INT,
    NameDeviceTrigerReadCabi INT,
    NameDeviceDataCabi INT,
    NameDeviceDataPerson INT,
    NameDeviceDataReason INT,
    NameDeviceSendResult INT,
    AliveBit INT,
    NameDeviceSendConfirm INT,
    NameDeviceTrigerReadError INT,
    VP tinyint,
    GAS tinyint,
    WI1WITH tinyint,
    WI1START tinyint,
    IP tinyint,
    DF tinyint,
    TEMP tinyint,
    IOT tinyint,
    WI2 tinyint,
    PAN tinyint,
    CAMBACK tinyint,
    CAMFRONT tinyint
)
BEGIN
    UPDATE ConfigConnectionPlc
    SET 
        IpAddress = IpAddress,
        PortNumber = PortNumber,
        NameDeviceTrigerReadCabi = NameDeviceTrigerReadCabi,
        NameDeviceDataCabi = NameDeviceDataCabi,
        NameDeviceDataPerson = NameDeviceDataPerson,
        NameDeviceDataReason = NameDeviceDataReason,
        NameDeviceSendResult = NameDeviceSendResult,
        AliveBit = AliveBit,
        NameDeviceSendConfirm = NameDeviceSendConfirm,
        NameDeviceTrigerReadError = NameDeviceTrigerReadError;
	UPDATE configcheckfinal
    SET 
       VP = VP,
    GAS =GAS,
    WI1WITH =WI1WITH,
    WI1START =WI1START,
    IP =IP,
    DF =DF,
    TEMP =TEMP,
    IOT =IOT,
    WI2 =WI2,
    PAN =PAN,
    CAMBACK =CAMBACK,
    CAMFRONT = CAMFRONT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDataFinalCheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`%` PROCEDURE `UpdateDataFinalCheck`(
    IN p_CodeBack VARCHAR(30),
    IN p_ReasonError VARCHAR(100),
    IN p_PersonConfirm VARCHAR(50)
)
BEGIN
    UPDATE DataCheckFinal
    SET
        ReasonError = p_ReasonError,
        PersonConfirm = p_PersonConfirm
    WHERE CodeBack = p_CodeBack;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDateTimePlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TA`@`localhost` PROCEDURE `UpdateDateTimePlan`(IN _ModelName nvarchar(30),IN _TimeFrom datetime,IN _TimeTo datetime,IN _TotalTime double)
BEGIN
	DECLARE _hournow int;
    	Set _hournow = hour(now());
    	IF(_hournow > 5) then
		UPDATE `dataplc`.`dataplan`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName and  Date(dataplan.TimeUpdate ) = Date(now());
    	else
		UPDATE `dataplc`.`dataplan`
		SET `TotalTime` = _TotalTime,`TimeStart` = _TimeFrom,`TimeEnd` = _TimeTo, `QuantityPerSec` = QuantityDay/_TotalTime
		WHERE Model = _ModelName and  Date(dataplan.TimeUpdate ) = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
    	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `sakila`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sakila` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sakila`;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `actor_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`),
  KEY `idx_actor_last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `actor_info`
--

DROP TABLE IF EXISTS `actor_info`;
/*!50001 DROP VIEW IF EXISTS `actor_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `actor_info` AS SELECT 
 1 AS `actor_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `film_info`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `district` varchar(20) NOT NULL,
  `city_id` smallint unsigned NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `location` geometry NOT NULL /*!80003 SRID 0 */,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `idx_fk_city_id` (`city_id`),
  SPATIAL KEY `idx_location` (`location`),
  CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `country_id` smallint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`),
  KEY `idx_fk_country_id` (`country_id`),
  CONSTRAINT `fk_city_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` tinyint unsigned NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address_id` smallint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  KEY `idx_fk_store_id` (`store_id`),
  KEY `idx_fk_address_id` (`address_id`),
  KEY `idx_last_name` (`last_name`),
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customer_create_date` BEFORE INSERT ON `customer` FOR EACH ROW SET NEW.create_date = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `customer_list`
--

DROP TABLE IF EXISTS `customer_list`;
/*!50001 DROP VIEW IF EXISTS `customer_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_list` AS SELECT 
 1 AS `ID`,
 1 AS `name`,
 1 AS `address`,
 1 AS `zip code`,
 1 AS `phone`,
 1 AS `city`,
 1 AS `country`,
 1 AS `notes`,
 1 AS `SID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `film_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` text,
  `release_year` year DEFAULT NULL,
  `language_id` tinyint unsigned NOT NULL,
  `original_language_id` tinyint unsigned DEFAULT NULL,
  `rental_duration` tinyint unsigned NOT NULL DEFAULT '3',
  `rental_rate` decimal(4,2) NOT NULL DEFAULT '4.99',
  `length` smallint unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) NOT NULL DEFAULT '19.99',
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `special_features` set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`film_id`),
  KEY `idx_title` (`title`),
  KEY `idx_fk_language_id` (`language_id`),
  KEY `idx_fk_original_language_id` (`original_language_id`),
  CONSTRAINT `fk_film_language` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_language_original` FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) OR (old.description != new.description) OR (old.film_id != new.film_id)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `film_actor`
--

DROP TABLE IF EXISTS `film_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_actor` (
  `actor_id` smallint unsigned NOT NULL,
  `film_id` smallint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`,`film_id`),
  KEY `idx_fk_film_id` (`film_id`),
  CONSTRAINT `fk_film_actor_actor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_actor_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `film_category`
--

DROP TABLE IF EXISTS `film_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_category` (
  `film_id` smallint unsigned NOT NULL,
  `category_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`film_id`,`category_id`),
  KEY `fk_film_category_category` (`category_id`),
  CONSTRAINT `fk_film_category_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_category_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `film_list`
--

DROP TABLE IF EXISTS `film_list`;
/*!50001 DROP VIEW IF EXISTS `film_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `film_list` AS SELECT 
 1 AS `FID`,
 1 AS `title`,
 1 AS `description`,
 1 AS `category`,
 1 AS `price`,
 1 AS `length`,
 1 AS `rating`,
 1 AS `actors`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `film_text`
--

DROP TABLE IF EXISTS `film_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_text` (
  `film_id` smallint NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`film_id`),
  FULLTEXT KEY `idx_title_description` (`title`,`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `film_id` smallint unsigned NOT NULL,
  `store_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_id`),
  KEY `idx_fk_film_id` (`film_id`),
  KEY `idx_store_id_film_id` (`store_id`,`film_id`),
  CONSTRAINT `fk_inventory_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_inventory_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4582 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `language_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `nicer_but_slower_film_list`
--

DROP TABLE IF EXISTS `nicer_but_slower_film_list`;
/*!50001 DROP VIEW IF EXISTS `nicer_but_slower_film_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nicer_but_slower_film_list` AS SELECT 
 1 AS `FID`,
 1 AS `title`,
 1 AS `description`,
 1 AS `category`,
 1 AS `price`,
 1 AS `length`,
 1 AS `rating`,
 1 AS `actors`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` smallint unsigned NOT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `rental_id` int DEFAULT NULL,
  `amount` decimal(5,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `idx_fk_staff_id` (`staff_id`),
  KEY `idx_fk_customer_id` (`customer_id`),
  KEY `fk_payment_rental` (`rental_id`),
  CONSTRAINT `fk_payment_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_rental` FOREIGN KEY (`rental_id`) REFERENCES `rental` (`rental_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `payment_date` BEFORE INSERT ON `payment` FOR EACH ROW SET NEW.payment_date = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `rental_id` int NOT NULL AUTO_INCREMENT,
  `rental_date` datetime NOT NULL,
  `inventory_id` mediumint unsigned NOT NULL,
  `customer_id` smallint unsigned NOT NULL,
  `return_date` datetime DEFAULT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rental_id`),
  UNIQUE KEY `rental_date` (`rental_date`,`inventory_id`,`customer_id`),
  KEY `idx_fk_inventory_id` (`inventory_id`),
  KEY `idx_fk_customer_id` (`customer_id`),
  KEY `idx_fk_staff_id` (`staff_id`),
  CONSTRAINT `fk_rental_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rental_date` BEFORE INSERT ON `rental` FOR EACH ROW SET NEW.rental_date = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `sales_by_film_category`
--

DROP TABLE IF EXISTS `sales_by_film_category`;
/*!50001 DROP VIEW IF EXISTS `sales_by_film_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales_by_film_category` AS SELECT 
 1 AS `category`,
 1 AS `total_sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sales_by_store`
--

DROP TABLE IF EXISTS `sales_by_store`;
/*!50001 DROP VIEW IF EXISTS `sales_by_store`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales_by_store` AS SELECT 
 1 AS `store`,
 1 AS `manager`,
 1 AS `total_sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address_id` smallint unsigned NOT NULL,
  `picture` blob,
  `email` varchar(50) DEFAULT NULL,
  `store_id` tinyint unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `username` varchar(16) NOT NULL,
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`staff_id`),
  KEY `idx_fk_store_id` (`store_id`),
  KEY `idx_fk_address_id` (`address_id`),
  CONSTRAINT `fk_staff_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `staff_list`
--

DROP TABLE IF EXISTS `staff_list`;
/*!50001 DROP VIEW IF EXISTS `staff_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `staff_list` AS SELECT 
 1 AS `ID`,
 1 AS `name`,
 1 AS `address`,
 1 AS `zip code`,
 1 AS `phone`,
 1 AS `city`,
 1 AS `country`,
 1 AS `SID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `manager_staff_id` tinyint unsigned NOT NULL,
  `address_id` smallint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `idx_unique_manager` (`manager_staff_id`),
  KEY `idx_fk_address_id` (`address_id`),
  CONSTRAINT `fk_store_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_store_staff` FOREIGN KEY (`manager_staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'sakila'
--

--
-- Dumping routines for database 'sakila'
--
/*!50003 DROP FUNCTION IF EXISTS `get_customer_balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_customer_balance`(p_customer_id INT, p_effective_date DATETIME) RETURNS decimal(5,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN

       #OK, WE NEED TO CALCULATE THE CURRENT BALANCE GIVEN A CUSTOMER_ID AND A DATE
       #THAT WE WANT THE BALANCE TO BE EFFECTIVE FOR. THE BALANCE IS:
       #   1) RENTAL FEES FOR ALL PREVIOUS RENTALS
       #   2) ONE DOLLAR FOR EVERY DAY THE PREVIOUS RENTALS ARE OVERDUE
       #   3) IF A FILM IS MORE THAN RENTAL_DURATION * 2 OVERDUE, CHARGE THE REPLACEMENT_COST
       #   4) SUBTRACT ALL PAYMENTS MADE BEFORE THE DATE SPECIFIED

  DECLARE v_rentfees DECIMAL(5,2); #FEES PAID TO RENT THE VIDEOS INITIALLY
  DECLARE v_overfees INTEGER;      #LATE FEES FOR PRIOR RENTALS
  DECLARE v_payments DECIMAL(5,2); #SUM OF PAYMENTS MADE PREVIOUSLY

  SELECT IFNULL(SUM(film.rental_rate),0) INTO v_rentfees
    FROM film, inventory, rental
    WHERE film.film_id = inventory.film_id
      AND inventory.inventory_id = rental.inventory_id
      AND rental.rental_date <= p_effective_date
      AND rental.customer_id = p_customer_id;

  SELECT IFNULL(SUM(IF((TO_DAYS(rental.return_date) - TO_DAYS(rental.rental_date)) > film.rental_duration,
        ((TO_DAYS(rental.return_date) - TO_DAYS(rental.rental_date)) - film.rental_duration),0)),0) INTO v_overfees
    FROM rental, inventory, film
    WHERE film.film_id = inventory.film_id
      AND inventory.inventory_id = rental.inventory_id
      AND rental.rental_date <= p_effective_date
      AND rental.customer_id = p_customer_id;


  SELECT IFNULL(SUM(payment.amount),0) INTO v_payments
    FROM payment

    WHERE payment.payment_date <= p_effective_date
    AND payment.customer_id = p_customer_id;

  RETURN v_rentfees + v_overfees - v_payments;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `inventory_held_by_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `inventory_held_by_customer`(p_inventory_id INT) RETURNS int
    READS SQL DATA
BEGIN
  DECLARE v_customer_id INT;
  DECLARE EXIT HANDLER FOR NOT FOUND RETURN NULL;

  SELECT customer_id INTO v_customer_id
  FROM rental
  WHERE return_date IS NULL
  AND inventory_id = p_inventory_id;

  RETURN v_customer_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `inventory_in_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `inventory_in_stock`(p_inventory_id INT) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
    DECLARE v_rentals INT;
    DECLARE v_out     INT;

    #AN ITEM IS IN-STOCK IF THERE ARE EITHER NO ROWS IN THE rental TABLE
    #FOR THE ITEM OR ALL ROWS HAVE return_date POPULATED

    SELECT COUNT(*) INTO v_rentals
    FROM rental
    WHERE inventory_id = p_inventory_id;

    IF v_rentals = 0 THEN
      RETURN TRUE;
    END IF;

    SELECT COUNT(rental_id) INTO v_out
    FROM inventory LEFT JOIN rental USING(inventory_id)
    WHERE inventory.inventory_id = p_inventory_id
    AND rental.return_date IS NULL;

    IF v_out > 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `film_in_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `film_in_stock`(IN p_film_id INT, IN p_store_id INT, OUT p_film_count INT)
    READS SQL DATA
BEGIN
     SELECT inventory_id
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND inventory_in_stock(inventory_id);

     SELECT COUNT(*)
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND inventory_in_stock(inventory_id)
     INTO p_film_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `film_not_in_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `film_not_in_stock`(IN p_film_id INT, IN p_store_id INT, OUT p_film_count INT)
    READS SQL DATA
BEGIN
     SELECT inventory_id
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND NOT inventory_in_stock(inventory_id);

     SELECT COUNT(*)
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND NOT inventory_in_stock(inventory_id)
     INTO p_film_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rewards_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rewards_report`(
    IN min_monthly_purchases TINYINT UNSIGNED
    , IN min_dollar_amount_purchased DECIMAL(10,2)
    , OUT count_rewardees INT
)
    READS SQL DATA
    COMMENT 'Provides a customizable report on best customers'
proc: BEGIN

    DECLARE last_month_start DATE;
    DECLARE last_month_end DATE;

    /* Some sanity checks... */
    IF min_monthly_purchases = 0 THEN
        SELECT 'Minimum monthly purchases parameter must be > 0';
        LEAVE proc;
    END IF;
    IF min_dollar_amount_purchased = 0.00 THEN
        SELECT 'Minimum monthly dollar amount purchased parameter must be > $0.00';
        LEAVE proc;
    END IF;

    /* Determine start and end time periods */
    SET last_month_start = DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH);
    SET last_month_start = STR_TO_DATE(CONCAT(YEAR(last_month_start),'-',MONTH(last_month_start),'-01'),'%Y-%m-%d');
    SET last_month_end = LAST_DAY(last_month_start);

    /*
        Create a temporary storage area for
        Customer IDs.
    */
    CREATE TEMPORARY TABLE tmpCustomer (customer_id SMALLINT UNSIGNED NOT NULL PRIMARY KEY);

    /*
        Find all customers meeting the
        monthly purchase requirements
    */
    INSERT INTO tmpCustomer (customer_id)
    SELECT p.customer_id
    FROM payment AS p
    WHERE DATE(p.payment_date) BETWEEN last_month_start AND last_month_end
    GROUP BY customer_id
    HAVING SUM(p.amount) > min_dollar_amount_purchased
    AND COUNT(customer_id) > min_monthly_purchases;

    /* Populate OUT parameter with count of found customers */
    SELECT COUNT(*) FROM tmpCustomer INTO count_rewardees;

    /*
        Output ALL customer information of matching rewardees.
        Customize output as needed.
    */
    SELECT c.*
    FROM tmpCustomer AS t
    INNER JOIN customer AS c ON t.customer_id = c.customer_id;

    /* Clean up */
    DROP TABLE tmpCustomer;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `world`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `world` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `world`;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` char(35) NOT NULL DEFAULT '',
  `CountryCode` char(3) NOT NULL DEFAULT '',
  `District` char(20) NOT NULL DEFAULT '',
  `Population` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CountryCode` (`CountryCode`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`CountryCode`) REFERENCES `country` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=4080 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `Code` char(3) NOT NULL DEFAULT '',
  `Name` char(52) NOT NULL DEFAULT '',
  `Continent` enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
  `Region` char(26) NOT NULL DEFAULT '',
  `SurfaceArea` decimal(10,2) NOT NULL DEFAULT '0.00',
  `IndepYear` smallint DEFAULT NULL,
  `Population` int NOT NULL DEFAULT '0',
  `LifeExpectancy` decimal(3,1) DEFAULT NULL,
  `GNP` decimal(10,2) DEFAULT NULL,
  `GNPOld` decimal(10,2) DEFAULT NULL,
  `LocalName` char(45) NOT NULL DEFAULT '',
  `GovernmentForm` char(45) NOT NULL DEFAULT '',
  `HeadOfState` char(60) DEFAULT NULL,
  `Capital` int DEFAULT NULL,
  `Code2` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countrylanguage`
--

DROP TABLE IF EXISTS `countrylanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countrylanguage` (
  `CountryCode` char(3) NOT NULL DEFAULT '',
  `Language` char(30) NOT NULL DEFAULT '',
  `IsOfficial` enum('T','F') NOT NULL DEFAULT 'F',
  `Percentage` decimal(4,1) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`CountryCode`,`Language`),
  KEY `CountryCode` (`CountryCode`),
  CONSTRAINT `countryLanguage_ibfk_1` FOREIGN KEY (`CountryCode`) REFERENCES `country` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'world'
--

--
-- Dumping routines for database 'world'
--

--
-- Current Database: `dataplc`
--

USE `dataplc`;

--
-- Current Database: `mysql`
--

USE `mysql`;

--
-- Current Database: `sakila`
--

USE `sakila`;

--
-- Final view structure for view `actor_info`
--

/*!50001 DROP VIEW IF EXISTS `actor_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `actor_info` AS select `a`.`actor_id` AS `actor_id`,`a`.`first_name` AS `first_name`,`a`.`last_name` AS `last_name`,group_concat(distinct concat(`c`.`name`,': ',(select group_concat(`f`.`title` order by `f`.`title` ASC separator ', ') from ((`film` `f` join `film_category` `fc` on((`f`.`film_id` = `fc`.`film_id`))) join `film_actor` `fa` on((`f`.`film_id` = `fa`.`film_id`))) where ((`fc`.`category_id` = `c`.`category_id`) and (`fa`.`actor_id` = `a`.`actor_id`)))) order by `c`.`name` ASC separator '; ') AS `film_info` from (((`actor` `a` left join `film_actor` `fa` on((`a`.`actor_id` = `fa`.`actor_id`))) left join `film_category` `fc` on((`fa`.`film_id` = `fc`.`film_id`))) left join `category` `c` on((`fc`.`category_id` = `c`.`category_id`))) group by `a`.`actor_id`,`a`.`first_name`,`a`.`last_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_list`
--

/*!50001 DROP VIEW IF EXISTS `customer_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_list` AS select `cu`.`customer_id` AS `ID`,concat(`cu`.`first_name`,_utf8mb4' ',`cu`.`last_name`) AS `name`,`a`.`address` AS `address`,`a`.`postal_code` AS `zip code`,`a`.`phone` AS `phone`,`city`.`city` AS `city`,`country`.`country` AS `country`,if(`cu`.`active`,_utf8mb4'active',_utf8mb4'') AS `notes`,`cu`.`store_id` AS `SID` from (((`customer` `cu` join `address` `a` on((`cu`.`address_id` = `a`.`address_id`))) join `city` on((`a`.`city_id` = `city`.`city_id`))) join `country` on((`city`.`country_id` = `country`.`country_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `film_list`
--

/*!50001 DROP VIEW IF EXISTS `film_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `film_list` AS select `film`.`film_id` AS `FID`,`film`.`title` AS `title`,`film`.`description` AS `description`,`category`.`name` AS `category`,`film`.`rental_rate` AS `price`,`film`.`length` AS `length`,`film`.`rating` AS `rating`,group_concat(concat(`actor`.`first_name`,_utf8mb4' ',`actor`.`last_name`) separator ', ') AS `actors` from ((((`category` left join `film_category` on((`category`.`category_id` = `film_category`.`category_id`))) left join `film` on((`film_category`.`film_id` = `film`.`film_id`))) join `film_actor` on((`film`.`film_id` = `film_actor`.`film_id`))) join `actor` on((`film_actor`.`actor_id` = `actor`.`actor_id`))) group by `film`.`film_id`,`category`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nicer_but_slower_film_list`
--

/*!50001 DROP VIEW IF EXISTS `nicer_but_slower_film_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nicer_but_slower_film_list` AS select `film`.`film_id` AS `FID`,`film`.`title` AS `title`,`film`.`description` AS `description`,`category`.`name` AS `category`,`film`.`rental_rate` AS `price`,`film`.`length` AS `length`,`film`.`rating` AS `rating`,group_concat(concat(concat(upper(substr(`actor`.`first_name`,1,1)),lower(substr(`actor`.`first_name`,2,length(`actor`.`first_name`))),_utf8mb4' ',concat(upper(substr(`actor`.`last_name`,1,1)),lower(substr(`actor`.`last_name`,2,length(`actor`.`last_name`)))))) separator ', ') AS `actors` from ((((`category` left join `film_category` on((`category`.`category_id` = `film_category`.`category_id`))) left join `film` on((`film_category`.`film_id` = `film`.`film_id`))) join `film_actor` on((`film`.`film_id` = `film_actor`.`film_id`))) join `actor` on((`film_actor`.`actor_id` = `actor`.`actor_id`))) group by `film`.`film_id`,`category`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_by_film_category`
--

/*!50001 DROP VIEW IF EXISTS `sales_by_film_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_by_film_category` AS select `c`.`name` AS `category`,sum(`p`.`amount`) AS `total_sales` from (((((`payment` `p` join `rental` `r` on((`p`.`rental_id` = `r`.`rental_id`))) join `inventory` `i` on((`r`.`inventory_id` = `i`.`inventory_id`))) join `film` `f` on((`i`.`film_id` = `f`.`film_id`))) join `film_category` `fc` on((`f`.`film_id` = `fc`.`film_id`))) join `category` `c` on((`fc`.`category_id` = `c`.`category_id`))) group by `c`.`name` order by `total_sales` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_by_store`
--

/*!50001 DROP VIEW IF EXISTS `sales_by_store`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_by_store` AS select concat(`c`.`city`,_utf8mb4',',`cy`.`country`) AS `store`,concat(`m`.`first_name`,_utf8mb4' ',`m`.`last_name`) AS `manager`,sum(`p`.`amount`) AS `total_sales` from (((((((`payment` `p` join `rental` `r` on((`p`.`rental_id` = `r`.`rental_id`))) join `inventory` `i` on((`r`.`inventory_id` = `i`.`inventory_id`))) join `store` `s` on((`i`.`store_id` = `s`.`store_id`))) join `address` `a` on((`s`.`address_id` = `a`.`address_id`))) join `city` `c` on((`a`.`city_id` = `c`.`city_id`))) join `country` `cy` on((`c`.`country_id` = `cy`.`country_id`))) join `staff` `m` on((`s`.`manager_staff_id` = `m`.`staff_id`))) group by `s`.`store_id` order by `cy`.`country`,`c`.`city` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staff_list`
--

/*!50001 DROP VIEW IF EXISTS `staff_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_list` AS select `s`.`staff_id` AS `ID`,concat(`s`.`first_name`,_utf8mb4' ',`s`.`last_name`) AS `name`,`a`.`address` AS `address`,`a`.`postal_code` AS `zip code`,`a`.`phone` AS `phone`,`city`.`city` AS `city`,`country`.`country` AS `country`,`s`.`store_id` AS `SID` from (((`staff` `s` join `address` `a` on((`s`.`address_id` = `a`.`address_id`))) join `city` on((`a`.`city_id` = `city`.`city_id`))) join `country` on((`city`.`country_id` = `country`.`country_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `world`
--

USE `world`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=@OLD_INNODB_STATS_AUTO_RECALC */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-22 15:50:40
