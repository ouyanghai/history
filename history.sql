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

CREATE TABLE `his_incident` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '事件标题',
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


