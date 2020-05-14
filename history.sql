DROP TABLE IF EXISTS `his_theme`;
CREATE TABLE `his_theme` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '分类图标',
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '分类名称',
  `desc` varchar(1024) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '分类描述',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态，1可见；0不可见',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_store_goods_cate_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='主题-分类';

DROP TABLE IF EXISTS `his_incident`;
CREATE TABLE `his_incident` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '事件标题',
	`label` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '事件标签',
  `logo` text COLLATE utf8mb4_general_ci COMMENT '事件图标',
  `content` longtext COLLATE utf8mb4_general_ci COMMENT '商品内容',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态：1可见；0不可见',
  `start_at` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '开始时间',
  `end_at` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '结束时间',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_title` (`title`) USING BTREE,
  KEY `index_start_at` (`start_at`) USING BTREE,
  KEY `index_end_at` (`end_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='历史事件';

DROP TABLE IF EXISTS `his_literature`;
CREATE TABLE `his_literature` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
	`vice_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '副标题',
	`author_id` bigint(20) unsigned DEFAULT '0' COMMENT '作者id',
	`author_name` varchar(125) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作者名称',
  `content` longtext COLLATE utf8mb4_general_ci COMMENT '内容',
	`sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态：1可见；0不可见',
  `start_at` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '开始时间',
  `end_at` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '结束时间',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_title` (`title`) USING BTREE,
	KEY `index_author_id` (`author_id`) USING BTREE,
	KEY `index_author_name` (`author_name`) USING BTREE,
  KEY `index_start_at` (`start_at`) USING BTREE,
  KEY `index_end_at` (`end_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='作品';

DROP TABLE IF EXISTS `his_literature_content`;
CREATE TABLE `his_literature_content` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
	`literature_id` bigint(20) unsigned DEFAULT '0' COMMENT '作品id',
	`chapter_id` int(11) unsigned DEFAULT '0' COMMENT '章节排序id',
	`chapter_title` varchar(125) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '章节标题',
  `content` longtext COLLATE utf8mb4_general_ci COMMENT '内容',
	`sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态：1可见；0不可见',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_literature_id` (`literature_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='作品内容';

DROP TABLE IF EXISTS `his_figures`;
CREATE TABLE `his_figures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
	`surname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓',
	`given_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名',
	`word` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字',
	`called` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '号',
	`profession` text COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职业',
	`height` int(11) DEFAULT NULL,
	`weight` int(11) DEFAULT NULL,
	`age` int(4) DEFAULT NULL,
	`gender` int(4) DEFAULT NULL COMMENT '1男；2女；3男变女；4女变男',
	`dynasty_id` varchar(125) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '时期id',
	`dynasty` varchar(125) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '时期名称',
	`country` varchar(125) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '国家',
	`country_code` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '国家编码',
	`province` varchar(125) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省',
	`city` varchar(125) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '市',
	`address1` varchar(125) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '县，区',
	`address2` varchar(125) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '村、街道',
	`address3` varchar(125) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '街道，门牌号，其他地址详情',
	`logo` text COLLATE utf8mb4_general_ci COMMENT '人物图片',
  `pic` text COLLATE utf8mb4_general_ci COMMENT '人物图片',
	`status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态：1可见；0不可见',
	`sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
	`content` longtext COLLATE utf8mb4_general_ci COMMENT '简介',
  `start_at` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '出生日期',
  `end_at` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '死亡时间',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_name` (`name`) USING BTREE,
	KEY `index_dynasty_id` (`dynasty_id`) USING BTREE,
	KEY `index_dynasty` (`dynasty`) USING BTREE,	
  KEY `index_start_at` (`start_at`) USING BTREE,
  KEY `index_end_at` (`end_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='人物表';

DROP TABLE IF EXISTS `his_dynasty`;
CREATE TABLE `his_dynasty` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
	`pid` bigint(20) unsigned default null,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '朝代时期名称',
	`vice_title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '别称',
	`logo` text COLLATE utf8mb4_general_ci COMMENT '事件图标',
	`type` tinyint(1) unsigned DEFAULT '1' COMMENT '1时期；2朝代',
  `content` longtext COLLATE utf8mb4_general_ci COMMENT '内容',
	`sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态：1可见；0不可见',
  `start_at` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '开始时间',
  `end_at` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '结束时间',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_title` (`title`) USING BTREE,
  KEY `index_start_at` (`start_at`) USING BTREE,
  KEY `index_end_at` (`end_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='朝代时期表';

DROP TABLE IF EXISTS `his_profession`;
CREATE TABLE `his_profession` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `vice_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '别称',
  `level` int(11) unsigned DEFAULT '1' COMMENT '等级',
  `content` longtext COLLATE utf8mb4_general_ci COMMENT '内容',
	`sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态：1可见；0不可见',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_title` (`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='职业及等级';