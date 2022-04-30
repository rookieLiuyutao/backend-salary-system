-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: yutao_data
-- ------------------------------------------------------
-- Server version	5.7.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table`
(
    `table_id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_name`        varchar(200) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '表名称',
    `table_comment`     varchar(500) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '表描述',
    `sub_table_name`    varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '关联子表的表名',
    `sub_table_fk_name` varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '子表关联的外键名',
    `class_name`        varchar(100) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '实体类名称',
    `tpl_category`      varchar(200) COLLATE utf8mb4_unicode_ci  DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
    `package_name`      varchar(100) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '生成包路径',
    `module_name`       varchar(30) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '生成模块名',
    `business_name`     varchar(30) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '生成业务名',
    `function_name`     varchar(50) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '生成功能名',
    `function_author`   varchar(50) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '生成功能作者',
    `gen_type`          char(1) COLLATE utf8mb4_unicode_ci       DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
    `gen_path`          varchar(200) COLLATE utf8mb4_unicode_ci  DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
    `options`           varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其它生成选项',
    `create_by`         varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '' COMMENT '创建者',
    `create_time`       datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '' COMMENT '更新者',
    `update_time`       datetime                                 DEFAULT NULL COMMENT '更新时间',
    `remark`            varchar(500) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`table_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column`
(
    `column_id`      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '归属表编号',
    `column_name`    varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列描述',
    `column_type`    varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列类型',
    `java_type`      varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA类型',
    `java_field`     varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk`          char(1) COLLATE utf8mb4_unicode_ci      DEFAULT NULL COMMENT '是否主键（1是）',
    `is_increment`   char(1) COLLATE utf8mb4_unicode_ci      DEFAULT NULL COMMENT '是否自增（1是）',
    `is_required`    char(1) COLLATE utf8mb4_unicode_ci      DEFAULT NULL COMMENT '是否必填（1是）',
    `is_insert`      char(1) COLLATE utf8mb4_unicode_ci      DEFAULT NULL COMMENT '是否为插入字段（1是）',
    `is_edit`        char(1) COLLATE utf8mb4_unicode_ci      DEFAULT NULL COMMENT '是否编辑字段（1是）',
    `is_list`        char(1) COLLATE utf8mb4_unicode_ci      DEFAULT NULL COMMENT '是否列表字段（1是）',
    `is_query`       char(1) COLLATE utf8mb4_unicode_ci      DEFAULT NULL COMMENT '是否查询字段（1是）',
    `query_type`     varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    `html_type`      varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type`      varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
    `sort`           int(11)                                 DEFAULT NULL COMMENT '排序',
    `create_by`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '创建者',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '更新者',
    `update_time`    datetime                                DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`column_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers`
(
    `sched_name`    varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`  varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `blob_data`     blob COMMENT '存放持久化Trigger对象',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`),
    CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars`
(
    `sched_name`    varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `calendar_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日历名称',
    `calendar`      blob                                    NOT NULL COMMENT '存放持久化calendar对象',
    PRIMARY KEY (`sched_name`, `calendar_name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers`
(
    `sched_name`      varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`    varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`   varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `cron_expression` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cron表达式',
    `time_zone_id`    varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '时区',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`),
    CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_fired_triggers`
(
    `sched_name`        varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `entry_id`          varchar(95) COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '调度器实例id',
    `trigger_name`      varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`     varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `instance_name`     varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例名',
    `fired_time`        bigint(13)                              NOT NULL COMMENT '触发的时间',
    `sched_time`        bigint(13)                              NOT NULL COMMENT '定时器制定的时间',
    `priority`          int(11)                                 NOT NULL COMMENT '优先级',
    `state`             varchar(16) COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '状态',
    `job_name`          varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务名称',
    `job_group`         varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务组名',
    `is_nonconcurrent`  varchar(1) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '是否并发',
    `requests_recovery` varchar(1) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '是否接受恢复执行',
    PRIMARY KEY (`sched_name`, `entry_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_details`
(
    `sched_name`        varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `job_name`          varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
    `job_group`         varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
    `description`       varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '相关介绍',
    `job_class_name`    varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行任务类名称',
    `is_durable`        varchar(1) COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '是否持久化',
    `is_nonconcurrent`  varchar(1) COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '是否并发',
    `is_update_data`    varchar(1) COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '是否更新数据',
    `requests_recovery` varchar(1) COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '是否接受恢复执行',
    `job_data`          blob COMMENT '存放持久化job对象',
    PRIMARY KEY (`sched_name`, `job_name`, `job_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks`
(
    `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `lock_name`  varchar(40) COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '悲观锁名称',
    PRIMARY KEY (`sched_name`, `lock_name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps`
(
    `sched_name`    varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    PRIMARY KEY (`sched_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state`
(
    `sched_name`        varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `instance_name`     varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实例名称',
    `last_checkin_time` bigint(13)                              NOT NULL COMMENT '上次检查时间',
    `checkin_interval`  bigint(13)                              NOT NULL COMMENT '检查间隔时间',
    PRIMARY KEY (`sched_name`, `instance_name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state`
    DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state`
VALUES ('yutaoScheduler', '565bf33e0aca1651320251157', 1651324339213, 15000);
/*!40000 ALTER TABLE `qrtz_scheduler_state`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers`
(
    `sched_name`      varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`    varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group`   varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `repeat_count`    bigint(7)                               NOT NULL COMMENT '重复的次数统计',
    `repeat_interval` bigint(12)                              NOT NULL COMMENT '重复的间隔时间',
    `times_triggered` bigint(10)                              NOT NULL COMMENT '已经触发的次数',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`),
    CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simprop_triggers`
(
    `sched_name`    varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`  varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
    `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
    `str_prop_1`    varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
    `str_prop_2`    varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
    `str_prop_3`    varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
    `int_prop_1`    int(11)                                 DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
    `int_prop_2`    int(11)                                 DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
    `long_prop_1`   bigint(20)                              DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
    `long_prop_2`   bigint(20)                              DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
    `dec_prop_1`    decimal(13, 4)                          DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
    `dec_prop_2`    decimal(13, 4)                          DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
    `bool_prop_1`   varchar(1) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
    `bool_prop_2`   varchar(1) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`),
    CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_triggers`
(
    `sched_name`     varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
    `trigger_name`   varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的名字',
    `trigger_group`  varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
    `job_name`       varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
    `job_group`      varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
    `description`    varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '相关介绍',
    `next_fire_time` bigint(13)                              DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
    `prev_fire_time` bigint(13)                              DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
    `priority`       int(11)                                 DEFAULT NULL COMMENT '优先级',
    `trigger_state`  varchar(16) COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '触发器状态',
    `trigger_type`   varchar(8) COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '触发器的类型',
    `start_time`     bigint(13)                              NOT NULL COMMENT '开始时间',
    `end_time`       bigint(13)                              DEFAULT NULL COMMENT '结束时间',
    `calendar_name`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日程表名称',
    `misfire_instr`  smallint(2)                             DEFAULT NULL COMMENT '补偿执行的策略',
    `job_data`       blob COMMENT '存放持久化job对象',
    PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`),
    KEY `sched_name` (`sched_name`, `job_name`, `job_group`),
    CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_attendance`
--

DROP TABLE IF EXISTS `sys_attendance`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_attendance`
(
    `absence_id`  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '缺勤记录id',
    `user_id`     bigint(20) NOT NULL COMMENT '用户ID',
    `update_time` date       NOT NULL COMMENT '缺勤时间',
    PRIMARY KEY (`absence_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `sys_attendance_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 180002
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='出勤表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_attendance`
--

LOCK TABLES `sys_attendance` WRITE;
/*!40000 ALTER TABLE `sys_attendance`
    DISABLE KEYS */;
INSERT INTO `sys_attendance`
VALUES (180001, 1, '2022-04-30');
/*!40000 ALTER TABLE `sys_attendance`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_bank`
--

DROP TABLE IF EXISTS `sys_bank`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_bank`
(
    `bankcard_id` bigint(20)                             NOT NULL AUTO_INCREMENT COMMENT '银行卡号',
    `user_name`   varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
    `before_tax`  double DEFAULT '0' COMMENT '税前工资',
    `deduction`   double DEFAULT '0' COMMENT '扣除税款',
    `after_tax`   double DEFAULT '0' COMMENT '税后工资',
    PRIMARY KEY (`bankcard_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 181302
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='银行扣税表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_bank`
--

LOCK TABLES `sys_bank` WRITE;
/*!40000 ALTER TABLE `sys_bank`
    DISABLE KEYS */;
INSERT INTO `sys_bank`
VALUES (181301, '刘宇韬', 0, 0, 0);
/*!40000 ALTER TABLE `sys_bank`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config`
(
    `config_id`    int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1) COLLATE utf8mb4_unicode_ci      DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
    `create_by`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '创建者',
    `create_time`  datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '更新者',
    `update_time`  datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`config_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config`
    DISABLE KEYS */;
INSERT INTO `sys_config`
VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-04-30 20:17:57', '', NULL,
        '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
       (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-04-30 20:17:57', '', NULL,
        '初始化密码 123456'),
       (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-04-30 20:17:57', '', NULL,
        '深色主题theme-dark，浅色主题theme-light'),
       (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-04-30 20:17:58', '', NULL,
        '是否开启验证码功能（true开启，false关闭）'),
       (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-04-30 20:17:58', '', NULL,
        '是否开启注册用户功能（true开启，false关闭）');
/*!40000 ALTER TABLE `sys_config`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id`   bigint(20)                             DEFAULT '0' COMMENT '父部门id',
    `ancestors`   varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '祖级列表',
    `dept_name`   varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
    `order_num`   int(4)                                 DEFAULT '0' COMMENT '显示顺序',
    `leader`      varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `status`      char(1) COLLATE utf8mb4_unicode_ci     DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
    `del_flag`    char(1) COLLATE utf8mb4_unicode_ci     DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`   varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
    `create_time` datetime                               DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
    `update_time` datetime                               DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`dept_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 200
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept`
    DISABLE KEYS */;
INSERT INTO `sys_dept`
VALUES (100, 0, '0', '太原理工大学', 0, '郑强', '15888888888', '66669999@qq.com', '0', '0', 'admin', '2022-04-30 20:15:43', '',
        NULL),
       (101, 100, '0,100', '太原理工大学', 1, '郑强', '15888888888', '66669999@qq.com', '0', '0', 'admin',
        '2022-04-30 20:15:43', '',
        NULL),
       (102, 100, '0,100', '软件系', 2, '郑强', '15888888888', '66669999@qq.com', '0', '0', 'admin', '2022-04-30 20:15:44',
        '',
        NULL),
       (103, 101, '0,100,101', '数学系', 1, '郑强', '15888888888', '66669999@qq.com', '0', '0', 'admin',
        '2022-04-30 20:15:44', '',
        NULL),
       (104, 101, '0,100,101', '系党委', 2, '郑强', '15888888888', '66669999@qq.com', '0', '0', 'admin',
        '2022-04-30 20:15:45', '',
        NULL),
       (105, 101, '0,100,101', '系办公室', 3, '郑强', '15888888888', '66669999@qq.com', '0', '0', 'admin',
        '2022-04-30 20:15:45',
        '', NULL),
       (106, 101, '0,100,101', '教务部', 4, '郑强', '15888888888', '66669999@qq.com', '0', '0', 'admin',
        '2022-04-30 20:15:46', '',
        NULL),
       (107, 101, '0,100,101', '组织部', 5, '郑强', '15888888888', '66669999@qq.com', '0', '0', 'admin',
        '2022-04-30 20:15:46', '',
        NULL),
       (108, 102, '0,100,102', '宣传部', 1, '郑强', '15888888888', '66669999@qq.com', '0', '0', 'admin',
        '2022-04-30 20:15:48', '',
        NULL),
       (109, 102, '0,100,102', '统战部', 2, '郑强', '15888888888', '66669999@qq.com', '0', '0', 'admin',
        '2022-04-30 20:15:48', '',
        NULL);
/*!40000 ALTER TABLE `sys_dept`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int(4)                                  DEFAULT '0' COMMENT '字典排序',
    `dict_label`  varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1) COLLATE utf8mb4_unicode_ci      DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
    `status`      char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data`
    DISABLE KEYS */;
INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-04-30 20:17:43', '', NULL, '性别男'),
       (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-04-30 20:17:43', '', NULL, '性别女'),
       (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-04-30 20:17:43', '', NULL, '性别未知'),
       (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-04-30 20:17:44', '', NULL, '显示菜单'),
       (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-04-30 20:17:44', '', NULL, '隐藏菜单'),
       (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-04-30 20:17:45', '', NULL,
        '正常状态'),
       (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-04-30 20:17:45', '', NULL,
        '停用状态'),
       (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-04-30 20:17:46', '', NULL, '正常状态'),
       (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-04-30 20:17:47', '', NULL, '停用状态'),
       (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-04-30 20:17:47', '', NULL, '默认分组'),
       (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-04-30 20:17:47', '', NULL, '系统分组'),
       (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-04-30 20:17:48', '', NULL, '系统默认是'),
       (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-04-30 20:17:48', '', NULL, '系统默认否'),
       (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-04-30 20:17:48', '', NULL, '通知'),
       (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-04-30 20:17:49', '', NULL, '公告'),
       (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-04-30 20:17:49', '', NULL,
        '正常状态'),
       (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-04-30 20:17:50', '', NULL,
        '关闭状态'),
       (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-04-30 20:17:50', '', NULL, '新增操作'),
       (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-04-30 20:17:51', '', NULL, '修改操作'),
       (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-04-30 20:17:51', '', NULL, '删除操作'),
       (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-04-30 20:17:52', '', NULL, '授权操作'),
       (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-04-30 20:17:53', '', NULL, '导出操作'),
       (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-04-30 20:17:53', '', NULL, '导入操作'),
       (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-04-30 20:17:54', '', NULL, '强退操作'),
       (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-04-30 20:17:54', '', NULL, '生成操作'),
       (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-04-30 20:17:55', '', NULL, '清空操作'),
       (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-04-30 20:17:55', '', NULL,
        '正常状态'),
       (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-04-30 20:17:55', '', NULL,
        '停用状态');
/*!40000 ALTER TABLE `sys_dict_data`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
    `status`      char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_id`),
    UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type`
    DISABLE KEYS */;
INSERT INTO `sys_dict_type`
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-04-30 20:17:38', '', NULL, '用户性别列表'),
       (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-04-30 20:17:38', '', NULL, '菜单状态列表'),
       (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-04-30 20:17:39', '', NULL, '系统开关列表'),
       (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-04-30 20:17:39', '', NULL, '任务状态列表'),
       (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-04-30 20:17:39', '', NULL, '任务分组列表'),
       (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-04-30 20:17:40', '', NULL, '系统是否列表'),
       (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-04-30 20:17:40', '', NULL, '通知类型列表'),
       (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-04-30 20:17:41', '', NULL, '通知状态列表'),
       (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-04-30 20:17:41', '', NULL, '操作类型列表'),
       (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-04-30 20:17:42', '', NULL, '登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job`
(
    `job_id`          bigint(20)                              NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    `job_name`        varchar(64) COLLATE utf8mb4_unicode_ci  NOT NULL DEFAULT '' COMMENT '任务名称',
    `job_group`       varchar(64) COLLATE utf8mb4_unicode_ci  NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
    `invoke_target`   varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
    `cron_expression` varchar(255) COLLATE utf8mb4_unicode_ci          DEFAULT '' COMMENT 'cron执行表达式',
    `misfire_policy`  varchar(20) COLLATE utf8mb4_unicode_ci           DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
    `concurrent`      char(1) COLLATE utf8mb4_unicode_ci               DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
    `status`          char(1) COLLATE utf8mb4_unicode_ci               DEFAULT '0' COMMENT '状态（0正常 1暂停）',
    `create_by`       varchar(64) COLLATE utf8mb4_unicode_ci           DEFAULT '' COMMENT '创建者',
    `create_time`     datetime                                         DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(64) COLLATE utf8mb4_unicode_ci           DEFAULT '' COMMENT '更新者',
    `update_time`     datetime                                         DEFAULT NULL COMMENT '更新时间',
    `remark`          varchar(500) COLLATE utf8mb4_unicode_ci          DEFAULT '' COMMENT '备注信息',
    PRIMARY KEY (`job_id`, `job_name`, `job_group`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job`
    DISABLE KEYS */;
INSERT INTO `sys_job`
VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-04-30 20:18:00',
        '', NULL, ''),
       (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin',
        '2022-04-30 20:18:00', '', NULL, ''),
       (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3',
        '1', '1', 'admin', '2022-04-30 20:18:01', '', NULL, '');
/*!40000 ALTER TABLE `sys_job`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log`
(
    `job_log_id`     bigint(20)                              NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
    `job_name`       varchar(64) COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '任务名称',
    `job_group`      varchar(64) COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '任务组名',
    `invoke_target`  varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
    `job_message`    varchar(500) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '日志信息',
    `status`         char(1) COLLATE utf8mb4_unicode_ci       DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
    `exception_info` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '异常信息',
    `create_time`    datetime                                 DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`job_log_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor`
(
    `info_id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
    `user_name`      varchar(50) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '用户账号',
    `ipaddr`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP地址',
    `login_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录地点',
    `browser`        varchar(50) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '浏览器类型',
    `os`             varchar(50) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '操作系统',
    `status`         char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
    `msg`            varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '提示消息',
    `login_time`     datetime                                DEFAULT NULL COMMENT '访问时间',
    PRIMARY KEY (`info_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 101
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor`
    DISABLE KEYS */;
INSERT INTO `sys_logininfor`
VALUES (100, '刘宇韬', '172.21.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 20:29:44');
/*!40000 ALTER TABLE `sys_logininfor`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint(20)                             NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
    `parent_id`   bigint(20)                              DEFAULT '0' COMMENT '父菜单ID',
    `order_num`   int(4)                                  DEFAULT '0' COMMENT '显示顺序',
    `path`        varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '路由地址',
    `component`   varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件路径',
    `query`       varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路由参数',
    `is_frame`    int(1)                                  DEFAULT '1' COMMENT '是否为外链（0是 1否）',
    `is_cache`    int(1)                                  DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
    `menu_type`   char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
    `status`      char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
    `perms`       varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '#' COMMENT '菜单图标',
    `create_by`   varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`menu_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2020
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu`
    DISABLE KEYS */;
INSERT INTO `sys_menu`
VALUES (1, '系统管理', 0, 2, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-04-30 20:15:57', '刘宇韬',
        '2022-04-30 20:41:07', '系统管理目录'),
       (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-04-30 20:15:58', '',
        NULL, '系统监控目录'),
       (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-04-30 20:15:59', '', NULL,
        '系统工具目录'),
       (4, '球球大作战', 0, 4, 'https://game.liuyutao666.top/', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin',
        '2022-04-30 20:16:01', '刘宇韬', '2022-04-30 20:40:26', '郑强官网地址'),
       (100, '用户管理', 2018, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin',
        '2022-04-30 20:16:03', '刘宇韬', '2022-04-30 20:36:07', '用户管理菜单'),
       (101, '角色管理', 2019, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples',
        'admin', '2022-04-30 20:16:03', '刘宇韬', '2022-04-30 20:39:31', '角色管理菜单'),
       (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table',
        'admin', '2022-04-30 20:16:04', '', NULL, '菜单管理菜单'),
       (103, '部门管理', 2018, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin',
        '2022-04-30 20:16:04', '刘宇韬', '2022-04-30 20:36:14', '部门管理菜单'),
       (104, '岗位管理', 2019, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin',
        '2022-04-30 20:16:05', '刘宇韬', '2022-04-30 20:38:56', '岗位管理菜单'),
       (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin',
        '2022-04-30 20:16:05', '', NULL, '字典管理菜单'),
       (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit',
        'admin', '2022-04-30 20:16:06', '', NULL, '参数设置菜单'),
       (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message',
        'admin', '2022-04-30 20:16:06', '', NULL, '通知公告菜单'),
       (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-04-30 20:16:07', '', NULL,
        '日志管理菜单'),
       (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online',
        'admin', '2022-04-30 20:16:09', '', NULL, '在线用户菜单'),
       (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin',
        '2022-04-30 20:16:10', '', NULL, '定时任务菜单'),
       (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid',
        'admin', '2022-04-30 20:16:10', '', NULL, '数据监控菜单'),
       (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server',
        'admin', '2022-04-30 20:16:11', '', NULL, '服务监控菜单'),
       (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis',
        'admin', '2022-04-30 20:16:12', '', NULL, '缓存监控菜单'),
       (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin',
        '2022-04-30 20:16:12', '', NULL, '表单构建菜单'),
       (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin',
        '2022-04-30 20:16:13', '', NULL, '代码生成菜单'),
       (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger',
        'admin', '2022-04-30 20:16:14', '', NULL, '系统接口菜单'),
       (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list',
        'form', 'admin', '2022-04-30 20:16:14', '', NULL, '操作日志菜单'),
       (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0',
        'monitor:logininfor:list', 'logininfor', 'admin', '2022-04-30 20:16:15', '', NULL, '登录日志菜单'),
       (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-04-30 20:16:16',
        '', NULL, ''),
       (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-04-30 20:16:16',
        '', NULL, ''),
       (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-04-30 20:16:17',
        '', NULL, ''),
       (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin',
        '2022-04-30 20:16:17', '', NULL, ''),
       (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin',
        '2022-04-30 20:16:17', '', NULL, ''),
       (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin',
        '2022-04-30 20:16:18', '', NULL, ''),
       (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin',
        '2022-04-30 20:16:19', '', NULL, ''),
       (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-04-30 20:16:19',
        '', NULL, ''),
       (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-04-30 20:16:19',
        '', NULL, ''),
       (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-04-30 20:16:20',
        '', NULL, ''),
       (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin',
        '2022-04-30 20:16:21', '', NULL, ''),
       (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin',
        '2022-04-30 20:16:21', '', NULL, ''),
       (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-04-30 20:16:21',
        '', NULL, ''),
       (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-04-30 20:16:21',
        '', NULL, ''),
       (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-04-30 20:16:22',
        '', NULL, ''),
       (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin',
        '2022-04-30 20:16:22', '', NULL, ''),
       (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-04-30 20:16:23',
        '', NULL, ''),
       (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-04-30 20:16:24',
        '', NULL, ''),
       (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-04-30 20:16:24',
        '', NULL, ''),
       (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin',
        '2022-04-30 20:16:24', '', NULL, ''),
       (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-04-30 20:16:24',
        '', NULL, ''),
       (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-04-30 20:16:25',
        '', NULL, ''),
       (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-04-30 20:16:25',
        '', NULL, ''),
       (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin',
        '2022-04-30 20:16:25', '', NULL, ''),
       (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin',
        '2022-04-30 20:16:26', '', NULL, ''),
       (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin',
        '2022-04-30 20:16:26', '', NULL, ''),
       (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-04-30 20:16:26',
        '', NULL, ''),
       (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-04-30 20:16:27',
        '', NULL, ''),
       (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin',
        '2022-04-30 20:16:27', '', NULL, ''),
       (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin',
        '2022-04-30 20:16:27', '', NULL, ''),
       (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin',
        '2022-04-30 20:16:28', '', NULL, ''),
       (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin',
        '2022-04-30 20:16:28', '', NULL, ''),
       (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin',
        '2022-04-30 20:16:28', '', NULL, ''),
       (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin',
        '2022-04-30 20:16:29', '', NULL, ''),
       (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin',
        '2022-04-30 20:16:29', '', NULL, ''),
       (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin',
        '2022-04-30 20:16:29', '', NULL, ''),
       (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin',
        '2022-04-30 20:16:30', '', NULL, ''),
       (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin',
        '2022-04-30 20:16:30', '', NULL, ''),
       (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin',
        '2022-04-30 20:16:30', '', NULL, ''),
       (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin',
        '2022-04-30 20:16:31', '', NULL, ''),
       (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin',
        '2022-04-30 20:16:32', '', NULL, ''),
       (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin',
        '2022-04-30 20:16:32', '', NULL, ''),
       (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin',
        '2022-04-30 20:16:32', '', NULL, ''),
       (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin',
        '2022-04-30 20:16:33', '', NULL, ''),
       (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin',
        '2022-04-30 20:16:33', '', NULL, ''),
       (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin',
        '2022-04-30 20:16:34', '', NULL, ''),
       (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin',
        '2022-04-30 20:16:34', '', NULL, ''),
       (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin',
        '2022-04-30 20:16:34', '', NULL, ''),
       (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin',
        '2022-04-30 20:16:35', '', NULL, ''),
       (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-04-30 20:16:35',
        '', NULL, ''),
       (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-04-30 20:16:36',
        '', NULL, ''),
       (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin',
        '2022-04-30 20:16:36', '', NULL, ''),
       (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin',
        '2022-04-30 20:16:37', '', NULL, ''),
       (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin',
        '2022-04-30 20:16:37', '', NULL, ''),
       (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-04-30 20:16:38',
        '', NULL, ''),
       (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-04-30 20:16:38',
        '', NULL, ''),
       (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-04-30 20:16:38',
        '', NULL, ''),
       (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-04-30 20:16:39',
        '', NULL, ''),
       (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-04-30 20:16:39',
        '', NULL, ''),
       (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-04-30 20:16:39',
        '', NULL, ''),
       (2000, '出勤', 2018, 1, 'attendance', 'system/attendance/index', NULL, 1, 0, 'C', '0', '0',
        'system:attendance:list', 'people', 'admin', '2022-04-30 20:16:40', '刘宇韬', '2022-04-30 20:41:56', '出勤菜单'),
       (2001, '出勤查询', 2000, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:attendance:query', '#', 'admin',
        '2022-04-30 20:16:41', '', NULL, ''),
       (2002, '出勤新增', 2000, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:attendance:add', '#', 'admin',
        '2022-04-30 20:16:41', '', NULL, ''),
       (2003, '出勤修改', 2000, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:attendance:edit', '#', 'admin',
        '2022-04-30 20:16:42', '', NULL, ''),
       (2004, '出勤删除', 2000, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:attendance:remove', '#', 'admin',
        '2022-04-30 20:16:42', '', NULL, ''),
       (2005, '出勤导出', 2000, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:attendance:export', '#', 'admin',
        '2022-04-30 20:16:42', '', NULL, ''),
       (2006, '银行扣税', 2018, 1, 'bank', 'system/bank/index', NULL, 1, 0, 'C', '0', '0', 'system:bank:list', 'tab',
        'admin', '2022-04-30 20:16:43', '刘宇韬', '2022-04-30 20:42:47', '银行扣税菜单'),
       (2007, '银行扣税查询', 2006, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:bank:query', '#', 'admin',
        '2022-04-30 20:16:43', '', NULL, ''),
       (2008, '银行扣税新增', 2006, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:bank:add', '#', 'admin',
        '2022-04-30 20:16:44', '', NULL, ''),
       (2009, '银行扣税修改', 2006, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:bank:edit', '#', 'admin',
        '2022-04-30 20:16:44', '', NULL, ''),
       (2010, '银行扣税删除', 2006, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:bank:remove', '#', 'admin',
        '2022-04-30 20:16:44', '', NULL, ''),
       (2011, '银行扣税导出', 2006, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:bank:export', '#', 'admin',
        '2022-04-30 20:16:45', '', NULL, ''),
       (2012, '工资', 2018, 1, 'salary', 'system/salary/index', NULL, 1, 0, 'C', '0', '0', 'system:salary:list', 'money',
        'admin', '2022-04-30 20:16:45', '刘宇韬', '2022-04-30 20:43:30', '工资菜单'),
       (2013, '工资查询', 2012, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:salary:query', '#', 'admin',
        '2022-04-30 20:16:46', '', NULL, ''),
       (2014, '工资新增', 2012, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:salary:add', '#', 'admin',
        '2022-04-30 20:16:47', '', NULL, ''),
       (2015, '工资修改', 2012, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:salary:edit', '#', 'admin',
        '2022-04-30 20:16:47', '', NULL, ''),
       (2016, '工资删除', 2012, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:salary:remove', '#', 'admin',
        '2022-04-30 20:16:47', '', NULL, ''),
       (2017, '工资导出', 2012, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:salary:export', '#', 'admin',
        '2022-04-30 20:16:48', '', NULL, ''),
       (2018, '业务菜单', 0, 1, 'work', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'excel', '刘宇韬', '2022-04-30 20:32:51', '',
        NULL, ''),
       (2019, '权限管理', 0, 1, 'permission', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'lock', '刘宇韬', '2022-04-30 20:38:11',
        '', NULL, '');
/*!40000 ALTER TABLE `sys_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice`
(
    `notice_id`      int(4)                                 NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `notice_title`   varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
    `notice_type`    char(1) COLLATE utf8mb4_unicode_ci     NOT NULL COMMENT '公告类型（1通知 2公告）',
    `notice_content` longblob COMMENT '公告内容',
    `status`         char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    `create_by`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '创建者',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '更新者',
    `update_time`    datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`notice_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice`
    DISABLE KEYS */;
INSERT INTO `sys_notice`
VALUES (1, '温馨提醒：2018-07-01 郑强新版本发布啦', '2', _binary '新版本内容', '0', 'admin', '2022-04-30 20:18:03', '', NULL, '管理员'),
       (2, '维护通知：2018-07-01 郑强系统凌晨维护', '1', _binary '维护内容', '0', 'admin', '2022-04-30 20:18:03', '', NULL, '管理员');
/*!40000 ALTER TABLE `sys_notice`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log`
(
    `oper_id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
    `title`          varchar(50) COLLATE utf8mb4_unicode_ci   DEFAULT '' COMMENT '模块标题',
    `business_type`  int(2)                                   DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
    `method`         varchar(100) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '方法名称',
    `request_method` varchar(10) COLLATE utf8mb4_unicode_ci   DEFAULT '' COMMENT '请求方式',
    `operator_type`  int(1)                                   DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
    `oper_name`      varchar(50) COLLATE utf8mb4_unicode_ci   DEFAULT '' COMMENT '操作人员',
    `dept_name`      varchar(50) COLLATE utf8mb4_unicode_ci   DEFAULT '' COMMENT '部门名称',
    `oper_url`       varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '请求URL',
    `oper_ip`        varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '主机地址',
    `oper_location`  varchar(255) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '操作地点',
    `oper_param`     varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求参数',
    `json_result`    varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '返回参数',
    `status`         int(1)                                   DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
    `error_msg`      varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '错误消息',
    `oper_time`      datetime                                 DEFAULT NULL COMMENT '操作时间',
    PRIMARY KEY (`oper_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 130
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log`
    DISABLE KEYS */;
INSERT INTO `sys_oper_log`
VALUES (100, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"工资\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"salary\",\"component\":\"system/salary/index\",\"children\":[],\"createTime\":1651321005000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":2012,\"menuType\":\"C\",\"perms\":\"system:salary:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:20:51'),
       (101, '填入罚金', 5, 'com.yutao.web.controller.system.SysSalaryController.handleLateFine()', 'POST', 1, '刘宇韬', NULL,
        '/system/salary/handleSalary', '172.21.0.1', '内网IP', '{\"params\":{}} {\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:25:01'),
       (102, '填入罚金', 5, 'com.yutao.web.controller.system.SysSalaryController.handleLateFine()', 'POST', 1, '刘宇韬', NULL,
        '/system/salary/handleSalary', '172.21.0.1', '内网IP', '{\"params\":{}} {\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:25:05'),
       (103, '递交给银行的表', 5, 'com.yutao.web.controller.system.SysSalaryController.bankExport()', 'POST', 1, '刘宇韬', NULL,
        '/system/salary/bankExport', '172.21.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2022-04-30 20:25:12'),
       (104, '菜单管理', 1, 'com.yutao.web.controller.system.SysMenuController.add()', 'POST', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":\"1\",\"menuName\":\"业务菜单\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"work\",\"createBy\":\"刘宇韬\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:32:51'),
       (105, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"工资\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"salary\",\"component\":\"system/salary/index\",\"children\":[],\"createTime\":1651321005000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":2012,\"menuType\":\"C\",\"perms\":\"system:salary:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:34:09'),
       (106, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"peoples\",\"orderNum\":\"2\",\"menuName\":\"角色管理\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"role\",\"component\":\"system/role/index\",\"children\":[],\"createTime\":1651320963000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":101,\"menuType\":\"C\",\"perms\":\"system:role:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:35:01'),
       (107, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"出勤\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"attendance\",\"component\":\"system/attendance/index\",\"children\":[],\"createTime\":1651321000000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:attendance:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:35:10'),
       (108, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"银行扣税\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"bank\",\"component\":\"system/bank/index\",\"children\":[],\"createTime\":1651321003000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"C\",\"perms\":\"system:bank:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:35:25'),
       (109, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"user\",\"orderNum\":\"1\",\"menuName\":\"用户管理\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"user\",\"component\":\"system/user/index\",\"children\":[],\"createTime\":1651320963000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":100,\"menuType\":\"C\",\"perms\":\"system:user:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:36:07'),
       (110, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tree\",\"orderNum\":\"4\",\"menuName\":\"部门管理\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"dept\",\"component\":\"system/dept/index\",\"children\":[],\"createTime\":1651320964000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":103,\"menuType\":\"C\",\"perms\":\"system:dept:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:36:14'),
       (111, '菜单管理', 1, 'com.yutao.web.controller.system.SysMenuController.add()', 'POST', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"lock\",\"orderNum\":\"1\",\"menuName\":\"权限管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"permission\",\"createBy\":\"刘宇韬\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:38:11'),
       (112, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"post\",\"orderNum\":\"5\",\"menuName\":\"岗位管理\",\"params\":{},\"parentId\":2019,\"isCache\":\"0\",\"path\":\"post\",\"component\":\"system/post/index\",\"children\":[],\"createTime\":1651320965000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":104,\"menuType\":\"C\",\"perms\":\"system:post:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:38:56'),
       (113, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"peoples\",\"orderNum\":\"2\",\"menuName\":\"角色管理\",\"params\":{},\"parentId\":2019,\"isCache\":\"0\",\"path\":\"role\",\"component\":\"system/role/index\",\"children\":[],\"createTime\":1651320963000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":101,\"menuType\":\"C\",\"perms\":\"system:role:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:39:31'),
       (114, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"球球大作战\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"https://game.liuyutao666.top/\",\"children\":[],\"createTime\":1651320961000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:40:26'),
       (115, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"system\",\"orderNum\":\"2\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1651320957000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:41:07'),
       (116, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"1\",\"menuName\":\"出勤\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"attendance\",\"component\":\"system/attendance/index\",\"children\":[],\"createTime\":1651321000000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:attendance:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:41:56'),
       (117, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"tab\",\"orderNum\":\"1\",\"menuName\":\"银行扣税\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"bank\",\"component\":\"system/bank/index\",\"children\":[],\"createTime\":1651321003000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"C\",\"perms\":\"system:bank:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:42:47'),
       (118, '菜单管理', 2, 'com.yutao.web.controller.system.SysMenuController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/menu', '172.21.0.1', '内网IP',
        '{\"visible\":\"0\",\"icon\":\"money\",\"orderNum\":\"1\",\"menuName\":\"工资\",\"params\":{},\"parentId\":2018,\"isCache\":\"0\",\"path\":\"salary\",\"component\":\"system/salary/index\",\"children\":[],\"createTime\":1651321005000,\"updateBy\":\"刘宇韬\",\"isFrame\":\"1\",\"menuId\":2012,\"menuType\":\"C\",\"perms\":\"system:salary:list\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:43:30'),
       (119, '工资管理', 6, 'com.yutao.web.controller.system.SysSalaryController.importData()', 'POST', 1, '刘宇韬', NULL,
        '/system/salary/importData', '172.21.0.1', '内网IP', 'false', NULL, 1,
        '很抱歉，导入失败！共 3 条数据格式不正确，错误如下：<br/>1工资null 导入失败：\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/yutao/yutao.jar!/BOOT-INF/lib/yutao-system-3.8.1.jar!/mapper/system/SysSalaryMapper.xml]\n### The error may involve com.yutao.system.mapper.SysSalaryMapper.insertSysSalary-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_salary          ( bankcard_id,             update_time )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value<br/>2工资null 导入失败：\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/yutao/yutao.jar!/BOOT-INF/lib/yutao-system-3.8.1.jar!/mapper/system/SysSalaryMapper.xml]\n### The error may involve com.yutao.system.mapper.SysSalaryMapper.insertSysSalary-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_salary          ( bankcard_id,             update_time )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value<br/>3工资null 导入失败：\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/yutao/yutao.jar!/BOOT-INF/lib/yutao-system-3.8.1.jar!/mapper/system/SysSalaryMapper.xml]\n### The error may involve com.yutao.system.mapper.SysSalaryMapper.insertSysSalary-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_salary          ( bankcard_id,             update_time )           values ( ?,           ',
        '2022-04-30 20:45:14'),
       (120, '工资管理', 6, 'com.yutao.web.controller.system.SysSalaryController.importData()', 'POST', 1, '刘宇韬', NULL,
        '/system/salary/importData', '172.21.0.1', '内网IP', 'false', NULL, 1,
        '很抱歉，导入失败！共 3 条数据格式不正确，错误如下：<br/>1工资null 导入失败：\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/yutao/yutao.jar!/BOOT-INF/lib/yutao-system-3.8.1.jar!/mapper/system/SysSalaryMapper.xml]\n### The error may involve com.yutao.system.mapper.SysSalaryMapper.insertSysSalary-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_salary          ( bankcard_id,             update_time )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value<br/>2工资null 导入失败：\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/yutao/yutao.jar!/BOOT-INF/lib/yutao-system-3.8.1.jar!/mapper/system/SysSalaryMapper.xml]\n### The error may involve com.yutao.system.mapper.SysSalaryMapper.insertSysSalary-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_salary          ( bankcard_id,             update_time )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value<br/>3工资null 导入失败：\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/yutao/yutao.jar!/BOOT-INF/lib/yutao-system-3.8.1.jar!/mapper/system/SysSalaryMapper.xml]\n### The error may involve com.yutao.system.mapper.SysSalaryMapper.insertSysSalary-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_salary          ( bankcard_id,             update_time )           values ( ?,           ',
        '2022-04-30 20:45:35'),
       (121, '工资管理', 6, 'com.yutao.web.controller.system.SysSalaryController.importData()', 'POST', 1, '刘宇韬', NULL,
        '/system/salary/importData', '172.21.0.1', '内网IP', 'false',
        '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1工资信息200 导入成功\",\"code\":200}', 0, NULL, '2022-04-30 20:45:55'),
       (122, '填入罚金', 5, 'com.yutao.web.controller.system.SysSalaryController.handleLateFine()', 'POST', 1, '刘宇韬', NULL,
        '/system/salary/handleSalary', '172.21.0.1', '内网IP', '{\"params\":{}} {\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:46:34'),
       (123, '用户管理', 6, 'com.yutao.web.controller.system.SysUserController.importData()', 'POST', 1, '刘宇韬', NULL,
        '/system/user/importData', '172.21.0.1', '内网IP', 'false',
        '{\"msg\":\"恭喜您，数据已全部导入成功！共 7 条，数据如下：<br/>1、账号 test1 导入成功<br/>2、账号 test2 导入成功<br/>3、账号 test3 导入成功<br/>4、账号 test4 导入成功<br/>5、账号 test5 导入成功<br/>6、账号 test6 导入成功<br/>7、账号 test7 导入成功\",\"code\":200}',
        0, NULL, '2022-04-30 20:47:02'),
       (124, '用户管理', 1, 'com.yutao.web.controller.system.SysUserController.add()', 'POST', 1, '刘宇韬', NULL,
        '/system/user', '172.21.0.1', '内网IP',
        '{\"phonenumber\":\"18333333333\",\"admin\":false,\"password\":\"$2a$10$EMkYT3laqwV2IjbuCD.hCeYaLDHZy5.iqjfCUVscAltSvPXfODPli\",\"postIds\":[3],\"nickName\":\"root\",\"sex\":\"0\",\"params\":{},\"userName\":\"root\",\"userId\":100,\"createBy\":\"刘宇韬\",\"roleIds\":[],\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:47:56'),
       (125, '角色管理', 1, 'com.yutao.web.controller.system.SysRoleController.add()', 'POST', 1, '刘宇韬', NULL,
        '/system/role', '172.21.0.1', '内网IP',
        '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createBy\":\"刘宇韬\",\"menuCheckStrictly\":true,\"roleKey\":\"manager\",\"roleName\":\"普通管理员\",\"deptIds\":[],\"menuIds\":[2018,100,1001,1002,1003,1004,1005,1006,1007,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,103,1017,1018,1019,1020,2019,101,1008,1009,1010,1011,1012,104,1021,1022,1023,1024,1025,4],\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:49:25'),
       (126, '用户管理', 2, 'com.yutao.web.controller.system.SysUserController.edit()', 'PUT', 1, '刘宇韬', NULL,
        '/system/user', '172.21.0.1', '内网IP',
        '{\"roles\":[],\"phonenumber\":\"18333333333\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"刘宇韬\",\"postIds\":[3],\"loginIp\":\"\",\"email\":\"1916689406@qq.com\",\"nickName\":\"root\",\"sex\":\"0\",\"deptId\":109,\"avatar\":\"\",\"params\":{},\"userName\":\"root\",\"userId\":100,\"createBy\":\"刘宇韬\",\"roleIds\":[100],\"createTime\":1651322876000,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-04-30 20:50:01'),
       (127, '银行扣税', 2, 'com.yutao.web.controller.system.SysBankController.handleTax()', 'POST', 1, '刘宇韬', NULL,
        '/system/bank/handleTax', '172.21.0.1', '内网IP', '{\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}',
        0, NULL, '2022-04-30 20:50:53'),
       (128, '银行扣税', 2, 'com.yutao.web.controller.system.SysBankController.handleTax()', 'POST', 1, '刘宇韬', NULL,
        '/system/bank/handleTax', '172.21.0.1', '内网IP', '{\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}',
        0, NULL, '2022-04-30 20:50:57'),
       (129, '银行扣税', 2, 'com.yutao.web.controller.system.SysBankController.handleTax()', 'POST', 1, '刘宇韬', NULL,
        '/system/bank/handleTax', '172.21.0.1', '内网IP', '{\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}',
        0, NULL, '2022-04-30 20:51:00');
/*!40000 ALTER TABLE `sys_oper_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post`
(
    `post_id`     bigint(20)                             NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
    `post_code`   varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
    `post_name`   varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
    `post_salary` double                                 NOT NULL COMMENT '岗位月基本工资',
    `post_sort`   int(4)                                 NOT NULL COMMENT '显示顺序',
    `status`      char(1) COLLATE utf8mb4_unicode_ci     NOT NULL COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`post_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post`
    DISABLE KEYS */;
INSERT INTO `sys_post`
VALUES (1, 'ceo', '董事长', 30000, 1, '0', 'admin', '2022-04-30 20:15:52', '', NULL, ''),
       (2, 'se', '项目经理', 25000, 2, '0', 'admin', '2022-04-30 20:15:53', '', NULL, ''),
       (3, 'hr', '人力资源', 15000, 3, '0', 'admin', '2022-04-30 20:15:54', '', NULL, ''),
       (4, 'user', '普通员工', 10000, 4, '0', 'admin', '2022-04-30 20:15:54', '', NULL, '');
/*!40000 ALTER TABLE `sys_post`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role`
(
    `role_id`             bigint(20)                              NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_name`           varchar(30) COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '角色名称',
    `role_key`            varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
    `role_sort`           int(4)                                  NOT NULL COMMENT '显示顺序',
    `data_scope`          char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    `menu_check_strictly` tinyint(1)                              DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
    `dept_check_strictly` tinyint(1)                              DEFAULT '1' COMMENT '部门树选择项是否关联显示',
    `status`              char(1) COLLATE utf8mb4_unicode_ci      NOT NULL COMMENT '角色状态（0正常 1停用）',
    `del_flag`            char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`           varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '创建者',
    `create_time`         datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`           varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '更新者',
    `update_time`         datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`              varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`role_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 101
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role`
    DISABLE KEYS */;
INSERT INTO `sys_role`
VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-04-30 20:15:55', '', NULL, '超级管理员'),
       (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-04-30 20:15:56', '', NULL, '普通角色'),
       (100, '普通管理员', 'manager', 3, '1', 1, 1, '0', '0', '刘宇韬', '2022-04-30 20:49:25', '', NULL, NULL);
/*!40000 ALTER TABLE `sys_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept`
(
    `role_id` bigint(20) NOT NULL COMMENT '角色ID',
    `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`role_id`, `dept_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept`
    DISABLE KEYS */;
INSERT INTO `sys_role_dept`
VALUES (2, 100),
       (2, 101),
       (2, 105);
/*!40000 ALTER TABLE `sys_role_dept`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu`
(
    `role_id` bigint(20) NOT NULL COMMENT '角色ID',
    `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`role_id`, `menu_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu`
    DISABLE KEYS */;
INSERT INTO `sys_role_menu`
VALUES (2, 1),
       (2, 2),
       (2, 3),
       (2, 4),
       (2, 100),
       (2, 101),
       (2, 102),
       (2, 103),
       (2, 104),
       (2, 105),
       (2, 106),
       (2, 107),
       (2, 108),
       (2, 109),
       (2, 110),
       (2, 111),
       (2, 112),
       (2, 113),
       (2, 114),
       (2, 115),
       (2, 116),
       (2, 500),
       (2, 501),
       (2, 1000),
       (2, 1001),
       (2, 1002),
       (2, 1003),
       (2, 1004),
       (2, 1005),
       (2, 1006),
       (2, 1007),
       (2, 1008),
       (2, 1009),
       (2, 1010),
       (2, 1011),
       (2, 1012),
       (2, 1013),
       (2, 1014),
       (2, 1015),
       (2, 1016),
       (2, 1017),
       (2, 1018),
       (2, 1019),
       (2, 1020),
       (2, 1021),
       (2, 1022),
       (2, 1023),
       (2, 1024),
       (2, 1025),
       (2, 1026),
       (2, 1027),
       (2, 1028),
       (2, 1029),
       (2, 1030),
       (2, 1031),
       (2, 1032),
       (2, 1033),
       (2, 1034),
       (2, 1035),
       (2, 1036),
       (2, 1037),
       (2, 1038),
       (2, 1039),
       (2, 1040),
       (2, 1041),
       (2, 1042),
       (2, 1043),
       (2, 1044),
       (2, 1045),
       (2, 1046),
       (2, 1047),
       (2, 1048),
       (2, 1049),
       (2, 1050),
       (2, 1051),
       (2, 1052),
       (2, 1053),
       (2, 1054),
       (2, 1055),
       (2, 1056),
       (2, 1057),
       (2, 1058),
       (2, 1059),
       (2, 1060),
       (100, 4),
       (100, 100),
       (100, 101),
       (100, 103),
       (100, 104),
       (100, 1001),
       (100, 1002),
       (100, 1003),
       (100, 1004),
       (100, 1005),
       (100, 1006),
       (100, 1007),
       (100, 1008),
       (100, 1009),
       (100, 1010),
       (100, 1011),
       (100, 1012),
       (100, 1017),
       (100, 1018),
       (100, 1019),
       (100, 1020),
       (100, 1021),
       (100, 1022),
       (100, 1023),
       (100, 1024),
       (100, 1025),
       (100, 2000),
       (100, 2001),
       (100, 2002),
       (100, 2003),
       (100, 2004),
       (100, 2005),
       (100, 2006),
       (100, 2007),
       (100, 2008),
       (100, 2009),
       (100, 2010),
       (100, 2011),
       (100, 2012),
       (100, 2013),
       (100, 2014),
       (100, 2015),
       (100, 2016),
       (100, 2017),
       (100, 2018),
       (100, 2019);
/*!40000 ALTER TABLE `sys_role_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_salary`
--

DROP TABLE IF EXISTS `sys_salary`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_salary`
(
    `salary_id`   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '工资发放记录id',
    `user_id`     bigint(20) NOT NULL COMMENT '用户ID',
    `dept_name`   varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
    `bankcard_id` bigint(20) NOT NULL COMMENT '银行卡号',
    `update_time` date       NOT NULL COMMENT '发放时间',
    `income`      double     NOT NULL COMMENT '基础工资',
    `rewards`     double                                 DEFAULT '0' COMMENT '全勤奖金',
    `cost`        double                                 DEFAULT '0' COMMENT '迟到罚款',
    `before_tax`  double                                 DEFAULT '0' COMMENT '税前总工资',
    PRIMARY KEY (`salary_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `sys_salary_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 201
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='工资表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_salary`
--

LOCK TABLES `sys_salary` WRITE;
/*!40000 ALTER TABLE `sys_salary`
    DISABLE KEYS */;
INSERT INTO `sys_salary`
VALUES (1, 1, '软件学院', 181301, '2022-04-30', 30000, 0, 100, 29900),
       (200, 2, '系办公室', 181301, '2022-04-30', 31000, 0, 100, 30900);
/*!40000 ALTER TABLE `sys_salary`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user`
(
    `user_id`     bigint(20)                             NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `dept_id`     bigint(20)                              DEFAULT NULL COMMENT '部门ID',
    `user_name`   varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
    `nick_name`   varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
    `user_type`   varchar(2) COLLATE utf8mb4_unicode_ci   DEFAULT '00' COMMENT '用户类型（00系统用户）',
    `email`       varchar(50) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '用户邮箱',
    `phoneNumber` varchar(11) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '手机号码',
    `sex`         char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
    `avatar`      varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像地址',
    `password`    varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
    `status`      char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
    `del_flag`    char(1) COLLATE utf8mb4_unicode_ci      DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `login_ip`    varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后登录IP',
    `login_date`  datetime                                DEFAULT NULL COMMENT '最后登录时间',
    `create_by`   varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 101
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user`
    DISABLE KEYS */;
INSERT INTO `sys_user`
VALUES (1, 103, '刘宇韬', '大菜狗', '00', '958532148@qq.com', '13233059962', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '172.21.0.1', '2022-04-30 20:29:44',
        'admin', '2022-04-30 20:15:50', '', '2022-04-30 20:29:44', '管理员'),
       (2, 105, '王誉', 'wang', '00', 'ry@qq.com', '15666666666', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-04-30 20:15:50',
        'admin', '2022-04-30 20:15:50', '', NULL, '测试员'),
       (9, NULL, 'test1', 'test1', '00', '', '15535250001', '0', '',
        '$2a$10$2A3ddskNRJy2qXffXc2jIOIVzi4CzeSTHP.19U0B3G8pT1xPPhwBO', '0', '0', '', NULL, '刘宇韬',
        '2022-04-30 20:47:01', '', NULL, NULL),
       (10, NULL, 'test2', 'test2', '00', '', '15535250002', '0', '',
        '$2a$10$WZFiFrl1oblyWu0lGyb0G.v2ArRl0wkoA4oBrBXRfr6O9/fYaewyq', '0', '0', '', NULL, '刘宇韬',
        '2022-04-30 20:47:01', '', NULL, NULL),
       (11, NULL, 'test3', 'test3', '00', '', '15535250003', '0', '',
        '$2a$10$yj8PndpCJpPKQeHz.smKDeOQWROu5EIH8SVpj05bXVV5KvPiNsEhC', '0', '0', '', NULL, '刘宇韬',
        '2022-04-30 20:47:01', '', NULL, NULL),
       (12, NULL, 'test4', 'test4', '00', '', '15535250004', '0', '',
        '$2a$10$gFufpiSM.Ptkp/aPYaHMf.LbuWoZLf2RKgvncDtHXk8bKcA40isgG', '0', '0', '', NULL, '刘宇韬',
        '2022-04-30 20:47:01', '', NULL, NULL),
       (13, NULL, 'test5', 'test5', '00', '', '15535250005', '0', '',
        '$2a$10$FfXGFHXQFpapl6pB7ZrEeOaggPOF8vZ2AtOJJGGsZ6itbn6ZaPCeq', '0', '0', '', NULL, '刘宇韬',
        '2022-04-30 20:47:01', '', NULL, NULL),
       (14, NULL, 'test6', 'test6', '00', '', '15535250005', '0', '',
        '$2a$10$s4OfjAFurxEUPN05xokcwekvY55Peifkzo/Axt0pEHToRn7bNXrDK', '0', '0', '', NULL, '刘宇韬',
        '2022-04-30 20:47:01', '', NULL, NULL),
       (15, NULL, 'test7', 'test7', '00', '', '15535250005', '0', '',
        '$2a$10$Y8gGAmix6yC388rCpjHuOuQmBGuEDQG8EZgjLOMVK8nKOtyajIiki', '0', '0', '', NULL, '刘宇韬',
        '2022-04-30 20:47:02', '', NULL, NULL),
       (100, 109, 'root', 'root', '00', '1916689406@qq.com', '18333333333', '0', '',
        '$2a$10$EMkYT3laqwV2IjbuCD.hCeYaLDHZy5.iqjfCUVscAltSvPXfODPli', '0', '0', '', NULL, '刘宇韬',
        '2022-04-30 20:47:56', '刘宇韬', '2022-04-30 20:50:01', NULL);
/*!40000 ALTER TABLE `sys_user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post`
(
    `user_id` bigint(20) NOT NULL COMMENT '用户ID',
    `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
    PRIMARY KEY (`user_id`, `post_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post`
    DISABLE KEYS */;
INSERT INTO `sys_user_post`
VALUES (1, 1),
       (2, 2),
       (100, 3);
/*!40000 ALTER TABLE `sys_user_post`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role`
(
    `user_id` bigint(20) NOT NULL COMMENT '用户ID',
    `role_id` bigint(20) NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`, `role_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT ='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role`
    DISABLE KEYS */;
INSERT INTO `sys_user_role`
VALUES (1, 1),
       (2, 2),
       (100, 100);
/*!40000 ALTER TABLE `sys_user_role`
    ENABLE KEYS */;
UNLOCK TABLES;

# 配置root用户远程登陆权限
GRANT ALL ON *.* TO 'root'@'%';

# 刷新权限
flush privileges;



/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2022-04-30 13:12:25
