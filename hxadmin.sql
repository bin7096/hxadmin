/*
 Navicat MySQL Data Transfer

 Source Server         : 127.0.0.1_3306
 Source Server Type    : MySQL
 Source Server Version : 50641
 Source Host           : 127.0.0.1:3306
 Source Schema         : hxadmin

 Target Server Type    : MySQL
 Target Server Version : 50641
 File Encoding         : 65001

 Date: 27/03/2019 22:28:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tp_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_access`;
CREATE TABLE `tp_admin_access`  (
  `role_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `node_id` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `pid` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  INDEX `groupId`(`role_id`) USING BTREE,
  INDEX `nodeId`(`node_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tp_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_group`;
CREATE TABLE `tp_admin_group`  (
  `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'icon小图标',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 50,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_admin_group
-- ----------------------------
INSERT INTO `tp_admin_group` VALUES (1, '系统管理', '&#xe61d;', 2, 1, '', 0, 1450752856, 1481180175);
INSERT INTO `tp_admin_group` VALUES (2, '工具', '&#xe616;', 3, 1, '', 0, 1476016712, 1481180175);
INSERT INTO `tp_admin_group` VALUES (3, '商品管理', '&amp;#xe66a;', 3, 1, '', 0, 1553720931, 1553720931);

-- ----------------------------
-- Table structure for tp_admin_node
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_node`;
CREATE TABLE `tp_admin_node`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '节点类型，1-控制器 | 0-方法',
  `sort` smallint(6) UNSIGNED NOT NULL DEFAULT 50,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `isdelete`(`isdelete`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_admin_node
-- ----------------------------
INSERT INTO `tp_admin_node` VALUES (1, 0, 1, 'Admin', '后台管理', '后台管理，不可更改', 1, 1, 1, 1, 0);
INSERT INTO `tp_admin_node` VALUES (2, 1, 1, 'AdminGroup', '分组管理', ' ', 2, 1, 1, 1, 0);
INSERT INTO `tp_admin_node` VALUES (3, 1, 1, 'AdminNode', '节点管理', ' ', 2, 1, 2, 1, 0);
INSERT INTO `tp_admin_node` VALUES (4, 1, 1, 'AdminRole', '角色管理', ' ', 2, 1, 3, 1, 0);
INSERT INTO `tp_admin_node` VALUES (5, 1, 1, 'AdminUser', '用户管理', '', 2, 1, 4, 1, 0);
INSERT INTO `tp_admin_node` VALUES (6, 1, 0, 'Index', '首页', '', 2, 1, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (7, 6, 0, 'welcome', '欢迎页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (8, 6, 0, 'index', '未定义', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (9, 1, 2, 'Generate', '代码自动生成', '', 2, 1, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (10, 1, 2, 'Demo/excel', 'Excel一键导出', '', 2, 0, 2, 1, 0);
INSERT INTO `tp_admin_node` VALUES (11, 1, 2, 'Demo/download', '下载', '', 2, 0, 3, 1, 0);
INSERT INTO `tp_admin_node` VALUES (12, 1, 2, 'Demo/downloadImage', '远程图片下载', '', 2, 0, 4, 1, 0);
INSERT INTO `tp_admin_node` VALUES (13, 1, 2, 'Demo/mail', '邮件发送', '', 2, 0, 5, 1, 0);
INSERT INTO `tp_admin_node` VALUES (14, 1, 2, 'Demo/qiniu', '七牛上传', '', 2, 0, 6, 1, 0);
INSERT INTO `tp_admin_node` VALUES (15, 1, 2, 'Demo/hashids', 'ID加密', '', 2, 0, 7, 1, 0);
INSERT INTO `tp_admin_node` VALUES (16, 1, 2, 'Demo/layer', '丰富弹层', '', 2, 0, 8, 1, 0);
INSERT INTO `tp_admin_node` VALUES (17, 1, 2, 'Demo/tableFixed', '表格溢出', '', 2, 0, 9, 1, 0);
INSERT INTO `tp_admin_node` VALUES (18, 1, 2, 'Demo/ueditor', '百度编辑器', '', 2, 0, 10, 1, 0);
INSERT INTO `tp_admin_node` VALUES (19, 1, 2, 'Demo/imageUpload', '图片上传', '', 2, 0, 11, 1, 0);
INSERT INTO `tp_admin_node` VALUES (20, 1, 2, 'Demo/qrcode', '二维码生成', '', 2, 0, 12, 1, 0);
INSERT INTO `tp_admin_node` VALUES (21, 1, 1, 'NodeMap', '节点图', '', 2, 1, 5, 1, 0);
INSERT INTO `tp_admin_node` VALUES (22, 1, 1, 'WebLog', '操作日志', '', 2, 1, 6, 1, 0);
INSERT INTO `tp_admin_node` VALUES (23, 1, 1, 'LoginLog', '登录日志', '', 2, 1, 7, 1, 0);
INSERT INTO `tp_admin_node` VALUES (59, 1, 2, 'one.two.three.Four/index', '多级节点', '', 2, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (24, 23, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (25, 22, 0, 'index', '列表', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (26, 22, 0, 'detail', '详情', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (27, 21, 0, 'load', '自动导入', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (28, 21, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (29, 5, 0, 'add', '添加', '', 3, 0, 51, 1, 0);
INSERT INTO `tp_admin_node` VALUES (30, 21, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (31, 21, 0, 'deleteForever', '永久删除', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (32, 9, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (33, 9, 0, 'generate', '生成方法', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (34, 5, 0, 'password', '修改密码', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (35, 5, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (36, 5, 0, 'add', '添加', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (37, 5, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (38, 4, 0, 'user', '用户列表', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (39, 4, 0, 'access', '授权', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (40, 4, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (41, 4, 0, 'add', '添加', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (42, 4, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (43, 4, 0, 'forbid', '默认禁用操作', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (44, 4, 0, 'resume', '默认恢复操作', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (45, 3, 0, 'load', '节点快速导入测试', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (46, 3, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (47, 3, 0, 'add', '添加', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (48, 3, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (49, 3, 0, 'forbid', '默认禁用操作', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (50, 3, 0, 'resume', '默认恢复操作', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (51, 2, 0, 'index', '首页', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (52, 2, 0, 'add', '添加', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (53, 2, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (54, 2, 0, 'forbid', '默认禁用操作', '', 3, 0, 51, 1, 0);
INSERT INTO `tp_admin_node` VALUES (55, 2, 0, 'resume', '默认恢复操作', '', 3, 0, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (56, 1, 2, 'one', '一级菜单', '', 2, 1, 13, 1, 0);
INSERT INTO `tp_admin_node` VALUES (60, 56, 2, 'two', '二级', '', 3, 1, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (61, 60, 2, 'three', '三级菜单', '', 4, 1, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (62, 61, 2, 'Four', '四级菜单', '', 5, 1, 50, 1, 0);
INSERT INTO `tp_admin_node` VALUES (63, 1, 3, 'Goods', '商品列表', '', 2, 1, 3, 1, 0);
INSERT INTO `tp_admin_node` VALUES (64, 63, 0, 'index', '主页', '', 3, 0, 1, 1, 0);
INSERT INTO `tp_admin_node` VALUES (65, 63, 0, 'add', '添加', '', 3, 0, 2, 1, 0);
INSERT INTO `tp_admin_node` VALUES (66, 63, 0, 'edit', '编辑', '', 3, 0, 3, 1, 0);
INSERT INTO `tp_admin_node` VALUES (67, 63, 0, 'del', '删除', '', 3, 0, 4, 1, 0);

-- ----------------------------
-- Table structure for tp_admin_node_load
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_node_load`;
CREATE TABLE `tp_admin_node_load`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点快速导入' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_admin_node_load
-- ----------------------------
INSERT INTO `tp_admin_node_load` VALUES (4, '编辑', 'edit', 1);
INSERT INTO `tp_admin_node_load` VALUES (5, '添加', 'add', 1);
INSERT INTO `tp_admin_node_load` VALUES (6, '首页', 'index', 1);
INSERT INTO `tp_admin_node_load` VALUES (7, '删除', 'delete', 1);

-- ----------------------------
-- Table structure for tp_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role`;
CREATE TABLE `tp_admin_role`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`pid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `isdelete`(`isdelete`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_admin_role
-- ----------------------------
INSERT INTO `tp_admin_role` VALUES (1, 0, '领导组', ' ', 1, 0, 1208784792, 1254325558);
INSERT INTO `tp_admin_role` VALUES (2, 0, '网编组', ' ', 0, 0, 1215496283, 1454049929);

-- ----------------------------
-- Table structure for tp_admin_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role_user`;
CREATE TABLE `tp_admin_role_user`  (
  `role_id` mediumint(9) UNSIGNED NULL DEFAULT NULL,
  `user_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `group_id`(`role_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for tp_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_user`;
CREATE TABLE `tp_admin_user`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_login_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `last_login_ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_count` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 50,
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `accountpassword`(`account`, `password`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_admin_user
-- ----------------------------
INSERT INTO `tp_admin_user` VALUES (1, 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', 1553719106, '183.14.28.70', 387, 'tianpian0805@gmail.com', '13121126169', '我是超级管理员', 1, 0, 1222907803, 1451033528);
INSERT INTO `tp_admin_user` VALUES (2, 'demo', '测试', 'e10adc3949ba59abbe56e057f20f883e', 1481206367, '127.0.0.1', 5, '', '', '', 1, 0, 1476777133, 1477399793);

-- ----------------------------
-- Table structure for tp_file
-- ----------------------------
DROP TABLE IF EXISTS `tp_file`;
CREATE TABLE `tp_file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '文件类型，1-image | 2-file',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原文件名',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tp_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods`;
CREATE TABLE `tp_goods`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `original_price` decimal(10, 2) NOT NULL COMMENT '原价',
  `detail` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品详情',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `isdelete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已删除（0-否，1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tp_goods_pic
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_pic`;
CREATE TABLE `tp_goods_pic`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL COMMENT '商品ID',
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片路径',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tp_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_login_log`;
CREATE TABLE `tp_login_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `login_ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `login_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_login_log
-- ----------------------------
INSERT INTO `tp_login_log` VALUES (1, 1, '183.14.133.239', '中国 广东 深圳 ', 'Chrome(69.0.3497.81)', 'Windows 10', '2019-03-27 07:06:30');
INSERT INTO `tp_login_log` VALUES (2, 1, '183.14.28.70', '中国 广东 深圳 ', 'Chrome(69.0.3497.81)', 'Windows 10', '2019-03-28 04:38:26');

-- ----------------------------
-- Table structure for tp_node_map
-- ----------------------------
DROP TABLE IF EXISTS `tp_node_map`;
CREATE TABLE `tp_node_map`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '节点图描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `map`(`method`, `module`, `controller`, `action`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点图' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tp_one_two_three_four
-- ----------------------------
DROP TABLE IF EXISTS `tp_one_two_three_four`;
CREATE TABLE `tp_one_two_three_four`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '四级控制器主键',
  `field1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段一',
  `option` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选填',
  `select` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下拉框',
  `radio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单选',
  `checkbox` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '复选框',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `textarea` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本域',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日期',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sort` smallint(5) NULL DEFAULT 50 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除状态，1-删除 | 0-正常',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '四级控制器' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tp_one_two_three_four
-- ----------------------------
INSERT INTO `tp_one_two_three_four` VALUES (1, 'yuan1994', 'tpadmin', '2', '1', NULL, '2222', 'https://github.com/yuan1994/tpadmin', '2016-12-07', '13012345678', 'tianpian0805@gmail.com', 50, 1, 0, 1481947278, 1481947353);

-- ----------------------------
-- Table structure for tp_web_log_001
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_log_001`;
CREATE TABLE `tp_web_log_001`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `ip`(`ip`) USING BTREE,
  INDEX `create_at`(`create_at`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_web_log_001
-- ----------------------------
INSERT INTO `tp_web_log_001` VALUES (1, 0, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553641530);
INSERT INTO `tp_web_log_001` VALUES (2, 0, '183.14.133.239', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1553641579);
INSERT INTO `tp_web_log_001` VALUES (3, 0, '183.14.133.239', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"3ra4\";}', 1553641590);
INSERT INTO `tp_web_log_001` VALUES (4, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553641590);
INSERT INTO `tp_web_log_001` VALUES (5, 1, '183.14.133.239', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553641590);
INSERT INTO `tp_web_log_001` VALUES (6, 0, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553718987);
INSERT INTO `tp_web_log_001` VALUES (7, 0, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1553718987);
INSERT INTO `tp_web_log_001` VALUES (8, 0, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"vf2s\";}', 1553719063);
INSERT INTO `tp_web_log_001` VALUES (9, 0, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"2inx\";}', 1553719106);
INSERT INTO `tp_web_log_001` VALUES (10, 1, '183.14.135.129', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553719106);
INSERT INTO `tp_web_log_001` VALUES (11, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553719106);
INSERT INTO `tp_web_log_001` VALUES (12, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1553719113);
INSERT INTO `tp_web_log_001` VALUES (13, 1, '183.14.28.66', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', 1553720636);
INSERT INTO `tp_web_log_001` VALUES (14, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"商品管理\";s:4:\"icon\";s:12:\"&amp;#xe66a;\";s:4:\"sort\";s:1:\"3\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', 1553720931);
INSERT INTO `tp_web_log_001` VALUES (15, 1, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1553720931);
INSERT INTO `tp_web_log_001` VALUES (16, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', 1553720941);
INSERT INTO `tp_web_log_001` VALUES (17, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_group/edit/id/3.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', 1553721168);
INSERT INTO `tp_web_log_001` VALUES (18, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721171);
INSERT INTO `tp_web_log_001` VALUES (19, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721174);
INSERT INTO `tp_web_log_001` VALUES (20, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1553721174);
INSERT INTO `tp_web_log_001` VALUES (21, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1553721183);
INSERT INTO `tp_web_log_001` VALUES (22, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"3\";s:5:\"title\";s:12:\"商品管理\";s:4:\"name\";s:10:\"AdminGoods\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"3\";s:6:\"status\";s:1:\"1\";}', 1553721413);
INSERT INTO `tp_web_log_001` VALUES (23, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721413);
INSERT INTO `tp_web_log_001` VALUES (24, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721413);
INSERT INTO `tp_web_log_001` VALUES (25, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1553721414);
INSERT INTO `tp_web_log_001` VALUES (26, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721415);
INSERT INTO `tp_web_log_001` VALUES (27, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:2:\"63\";}', 1553721417);
INSERT INTO `tp_web_log_001` VALUES (28, 1, '183.14.28.61', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721432);
INSERT INTO `tp_web_log_001` VALUES (29, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1553721438);
INSERT INTO `tp_web_log_001` VALUES (30, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721444);
INSERT INTO `tp_web_log_001` VALUES (31, 1, '183.14.28.66', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/edit?id=1', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1553721446);
INSERT INTO `tp_web_log_001` VALUES (32, 1, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"0\";}', 1553721458);
INSERT INTO `tp_web_log_001` VALUES (33, 1, '183.14.28.66', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721461);
INSERT INTO `tp_web_log_001` VALUES (34, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:2:\"63\";}', 1553721465);
INSERT INTO `tp_web_log_001` VALUES (35, 1, '183.14.135.129', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553721476);
INSERT INTO `tp_web_log_001` VALUES (36, 1, '183.14.28.66', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553721476);
INSERT INTO `tp_web_log_001` VALUES (37, 1, '183.14.135.129', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721484);
INSERT INTO `tp_web_log_001` VALUES (38, 1, '183.14.135.129', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721484);
INSERT INTO `tp_web_log_001` VALUES (39, 1, '183.14.28.61', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1553721484);
INSERT INTO `tp_web_log_001` VALUES (40, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721486);
INSERT INTO `tp_web_log_001` VALUES (41, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/edit?id=63', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"63\";}', 1553721491);
INSERT INTO `tp_web_log_001` VALUES (42, 1, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/edit', 'admin', 'AdminNode', 'edit', 'POST', 'a:9:{s:2:\"id\";s:2:\"63\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"3\";s:5:\"title\";s:12:\"商品列表\";s:4:\"name\";s:5:\"Goods\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"3\";s:6:\"status\";s:1:\"1\";}', 1553721506);
INSERT INTO `tp_web_log_001` VALUES (43, 1, '183.14.28.66', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721506);
INSERT INTO `tp_web_log_001` VALUES (44, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721506);
INSERT INTO `tp_web_log_001` VALUES (45, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721507);
INSERT INTO `tp_web_log_001` VALUES (46, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:2:\"63\";}', 1553721521);
INSERT INTO `tp_web_log_001` VALUES (47, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:2:\"63\";s:5:\"level\";s:1:\"3\";s:8:\"group_id\";s:1:\"0\";s:5:\"title\";s:6:\"主页\";s:4:\"name\";s:5:\"index\";s:4:\"type\";s:1:\"0\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1553721537);
INSERT INTO `tp_web_log_001` VALUES (48, 1, '183.14.135.129', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721537);
INSERT INTO `tp_web_log_001` VALUES (49, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721538);
INSERT INTO `tp_web_log_001` VALUES (50, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721538);
INSERT INTO `tp_web_log_001` VALUES (51, 1, '183.14.28.61', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:2:\"63\";}', 1553721540);
INSERT INTO `tp_web_log_001` VALUES (52, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:2:\"63\";s:5:\"level\";s:1:\"3\";s:8:\"group_id\";s:1:\"0\";s:5:\"title\";s:6:\"添加\";s:4:\"name\";s:3:\"add\";s:4:\"type\";s:1:\"0\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"1\";}', 1553721551);
INSERT INTO `tp_web_log_001` VALUES (53, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721552);
INSERT INTO `tp_web_log_001` VALUES (54, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721552);
INSERT INTO `tp_web_log_001` VALUES (55, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721552);
INSERT INTO `tp_web_log_001` VALUES (56, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:2:\"63\";}', 1553721553);
INSERT INTO `tp_web_log_001` VALUES (57, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:2:\"63\";s:5:\"level\";s:1:\"3\";s:8:\"group_id\";s:1:\"0\";s:5:\"title\";s:6:\"编辑\";s:4:\"name\";s:4:\"edit\";s:4:\"type\";s:1:\"0\";s:4:\"sort\";s:1:\"3\";s:6:\"status\";s:1:\"1\";}', 1553721563);
INSERT INTO `tp_web_log_001` VALUES (58, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721563);
INSERT INTO `tp_web_log_001` VALUES (59, 1, '183.14.28.61', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721564);
INSERT INTO `tp_web_log_001` VALUES (60, 1, '183.14.135.129', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721564);
INSERT INTO `tp_web_log_001` VALUES (61, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:2:\"63\";}', 1553721566);
INSERT INTO `tp_web_log_001` VALUES (62, 1, '183.14.28.61', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:2:\"63\";s:5:\"level\";s:1:\"3\";s:8:\"group_id\";s:1:\"0\";s:5:\"title\";s:6:\"删除\";s:4:\"name\";s:3:\"del\";s:4:\"type\";s:1:\"0\";s:4:\"sort\";s:1:\"4\";s:6:\"status\";s:1:\"1\";}', 1553721577);
INSERT INTO `tp_web_log_001` VALUES (63, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721577);
INSERT INTO `tp_web_log_001` VALUES (64, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721578);
INSERT INTO `tp_web_log_001` VALUES (65, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721578);
INSERT INTO `tp_web_log_001` VALUES (66, 1, '183.14.135.121', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553721680);
INSERT INTO `tp_web_log_001` VALUES (67, 1, '183.14.135.121', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553721681);
INSERT INTO `tp_web_log_001` VALUES (68, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553722189);
INSERT INTO `tp_web_log_001` VALUES (69, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553722189);
INSERT INTO `tp_web_log_001` VALUES (70, 1, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553722213);
INSERT INTO `tp_web_log_001` VALUES (71, 1, '183.14.28.66', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553722213);
INSERT INTO `tp_web_log_001` VALUES (72, 1, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/goods/index.html', 'admin', 'Goods', 'index', 'GET', 'a:0:{}', 1553722215);
INSERT INTO `tp_web_log_001` VALUES (73, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553722260);
INSERT INTO `tp_web_log_001` VALUES (74, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553722261);
INSERT INTO `tp_web_log_001` VALUES (75, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/goods/index.html', 'admin', 'Goods', 'index', 'GET', 'a:0:{}', 1553722262);
INSERT INTO `tp_web_log_001` VALUES (76, 1, '183.14.135.121', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/demo/imageupload.html', 'admin', 'Demo', 'imageupload', 'GET', 'a:0:{}', 1553723243);
INSERT INTO `tp_web_log_001` VALUES (77, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1553723245);
INSERT INTO `tp_web_log_001` VALUES (78, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/goods/index.html', 'admin', 'Goods', 'index', 'GET', 'a:0:{}', 1553723641);
INSERT INTO `tp_web_log_001` VALUES (79, 1, '183.14.28.61', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553723641);
INSERT INTO `tp_web_log_001` VALUES (80, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553723642);
INSERT INTO `tp_web_log_001` VALUES (81, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/goods/index.html', 'admin', 'Goods', 'index', 'GET', 'a:0:{}', 1553723643);
INSERT INTO `tp_web_log_001` VALUES (82, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553723879);
INSERT INTO `tp_web_log_001` VALUES (83, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553723879);
INSERT INTO `tp_web_log_001` VALUES (84, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/goods/index.html', 'admin', 'Goods', 'index', 'GET', 'a:0:{}', 1553723880);

-- ----------------------------
-- Table structure for tp_web_log_all
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_log_all`;
CREATE TABLE `tp_web_log_all`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `ip`(`ip`) USING BTREE,
  INDEX `create_at`(`create_at`) USING BTREE
) ENGINE = MRG_MYISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站日志' INSERT_METHOD = LAST ROW_FORMAT = Dynamic UNION = (`tp_web_log_001`);

-- ----------------------------
-- Records of tp_web_log_all
-- ----------------------------
INSERT INTO `tp_web_log_all` VALUES (1, 0, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553641530);
INSERT INTO `tp_web_log_all` VALUES (2, 0, '183.14.133.239', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1553641579);
INSERT INTO `tp_web_log_all` VALUES (3, 0, '183.14.133.239', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"3ra4\";}', 1553641590);
INSERT INTO `tp_web_log_all` VALUES (4, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553641590);
INSERT INTO `tp_web_log_all` VALUES (5, 1, '183.14.133.239', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553641590);
INSERT INTO `tp_web_log_all` VALUES (6, 0, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553718987);
INSERT INTO `tp_web_log_all` VALUES (7, 0, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1553718987);
INSERT INTO `tp_web_log_all` VALUES (8, 0, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"vf2s\";}', 1553719063);
INSERT INTO `tp_web_log_all` VALUES (9, 0, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"2inx\";}', 1553719106);
INSERT INTO `tp_web_log_all` VALUES (10, 1, '183.14.135.129', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553719106);
INSERT INTO `tp_web_log_all` VALUES (11, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553719106);
INSERT INTO `tp_web_log_all` VALUES (12, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1553719113);
INSERT INTO `tp_web_log_all` VALUES (13, 1, '183.14.28.66', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', 1553720636);
INSERT INTO `tp_web_log_all` VALUES (14, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"商品管理\";s:4:\"icon\";s:12:\"&amp;#xe66a;\";s:4:\"sort\";s:1:\"3\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', 1553720931);
INSERT INTO `tp_web_log_all` VALUES (15, 1, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1553720931);
INSERT INTO `tp_web_log_all` VALUES (16, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', 1553720941);
INSERT INTO `tp_web_log_all` VALUES (17, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_group/edit/id/3.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', 1553721168);
INSERT INTO `tp_web_log_all` VALUES (18, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721171);
INSERT INTO `tp_web_log_all` VALUES (19, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721174);
INSERT INTO `tp_web_log_all` VALUES (20, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1553721174);
INSERT INTO `tp_web_log_all` VALUES (21, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1553721183);
INSERT INTO `tp_web_log_all` VALUES (22, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"3\";s:5:\"title\";s:12:\"商品管理\";s:4:\"name\";s:10:\"AdminGoods\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"3\";s:6:\"status\";s:1:\"1\";}', 1553721413);
INSERT INTO `tp_web_log_all` VALUES (23, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721413);
INSERT INTO `tp_web_log_all` VALUES (24, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721413);
INSERT INTO `tp_web_log_all` VALUES (25, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1553721414);
INSERT INTO `tp_web_log_all` VALUES (26, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721415);
INSERT INTO `tp_web_log_all` VALUES (27, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:2:\"63\";}', 1553721417);
INSERT INTO `tp_web_log_all` VALUES (28, 1, '183.14.28.61', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721432);
INSERT INTO `tp_web_log_all` VALUES (29, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', 1553721438);
INSERT INTO `tp_web_log_all` VALUES (30, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721444);
INSERT INTO `tp_web_log_all` VALUES (31, 1, '183.14.28.66', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/edit?id=1', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', 1553721446);
INSERT INTO `tp_web_log_all` VALUES (32, 1, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"0\";}', 1553721458);
INSERT INTO `tp_web_log_all` VALUES (33, 1, '183.14.28.66', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721461);
INSERT INTO `tp_web_log_all` VALUES (34, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:2:\"63\";}', 1553721465);
INSERT INTO `tp_web_log_all` VALUES (35, 1, '183.14.135.129', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553721476);
INSERT INTO `tp_web_log_all` VALUES (36, 1, '183.14.28.66', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553721476);
INSERT INTO `tp_web_log_all` VALUES (37, 1, '183.14.135.129', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721484);
INSERT INTO `tp_web_log_all` VALUES (38, 1, '183.14.135.129', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721484);
INSERT INTO `tp_web_log_all` VALUES (39, 1, '183.14.28.61', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', 1553721484);
INSERT INTO `tp_web_log_all` VALUES (40, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721486);
INSERT INTO `tp_web_log_all` VALUES (41, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/edit?id=63', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:\"id\";s:2:\"63\";}', 1553721491);
INSERT INTO `tp_web_log_all` VALUES (42, 1, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/edit', 'admin', 'AdminNode', 'edit', 'POST', 'a:9:{s:2:\"id\";s:2:\"63\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"3\";s:5:\"title\";s:12:\"商品列表\";s:4:\"name\";s:5:\"Goods\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:1:\"3\";s:6:\"status\";s:1:\"1\";}', 1553721506);
INSERT INTO `tp_web_log_all` VALUES (43, 1, '183.14.28.66', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721506);
INSERT INTO `tp_web_log_all` VALUES (44, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721506);
INSERT INTO `tp_web_log_all` VALUES (45, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721507);
INSERT INTO `tp_web_log_all` VALUES (46, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:2:\"63\";}', 1553721521);
INSERT INTO `tp_web_log_all` VALUES (47, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:2:\"63\";s:5:\"level\";s:1:\"3\";s:8:\"group_id\";s:1:\"0\";s:5:\"title\";s:6:\"主页\";s:4:\"name\";s:5:\"index\";s:4:\"type\";s:1:\"0\";s:4:\"sort\";s:1:\"1\";s:6:\"status\";s:1:\"1\";}', 1553721537);
INSERT INTO `tp_web_log_all` VALUES (48, 1, '183.14.135.129', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721537);
INSERT INTO `tp_web_log_all` VALUES (49, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721538);
INSERT INTO `tp_web_log_all` VALUES (50, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721538);
INSERT INTO `tp_web_log_all` VALUES (51, 1, '183.14.28.61', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:2:\"63\";}', 1553721540);
INSERT INTO `tp_web_log_all` VALUES (52, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:2:\"63\";s:5:\"level\";s:1:\"3\";s:8:\"group_id\";s:1:\"0\";s:5:\"title\";s:6:\"添加\";s:4:\"name\";s:3:\"add\";s:4:\"type\";s:1:\"0\";s:4:\"sort\";s:1:\"2\";s:6:\"status\";s:1:\"1\";}', 1553721551);
INSERT INTO `tp_web_log_all` VALUES (53, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721552);
INSERT INTO `tp_web_log_all` VALUES (54, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721552);
INSERT INTO `tp_web_log_all` VALUES (55, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721552);
INSERT INTO `tp_web_log_all` VALUES (56, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:2:\"63\";}', 1553721553);
INSERT INTO `tp_web_log_all` VALUES (57, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:2:\"63\";s:5:\"level\";s:1:\"3\";s:8:\"group_id\";s:1:\"0\";s:5:\"title\";s:6:\"编辑\";s:4:\"name\";s:4:\"edit\";s:4:\"type\";s:1:\"0\";s:4:\"sort\";s:1:\"3\";s:6:\"status\";s:1:\"1\";}', 1553721563);
INSERT INTO `tp_web_log_all` VALUES (58, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721563);
INSERT INTO `tp_web_log_all` VALUES (59, 1, '183.14.28.61', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721564);
INSERT INTO `tp_web_log_all` VALUES (60, 1, '183.14.135.129', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721564);
INSERT INTO `tp_web_log_all` VALUES (61, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:2:\"63\";}', 1553721566);
INSERT INTO `tp_web_log_all` VALUES (62, 1, '183.14.28.61', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:2:\"63\";s:5:\"level\";s:1:\"3\";s:8:\"group_id\";s:1:\"0\";s:5:\"title\";s:6:\"删除\";s:4:\"name\";s:3:\"del\";s:4:\"type\";s:1:\"0\";s:4:\"sort\";s:1:\"4\";s:6:\"status\";s:1:\"1\";}', 1553721577);
INSERT INTO `tp_web_log_all` VALUES (63, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1553721577);
INSERT INTO `tp_web_log_all` VALUES (64, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', 1553721578);
INSERT INTO `tp_web_log_all` VALUES (65, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', 1553721578);
INSERT INTO `tp_web_log_all` VALUES (66, 1, '183.14.135.121', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553721680);
INSERT INTO `tp_web_log_all` VALUES (67, 1, '183.14.135.121', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553721681);
INSERT INTO `tp_web_log_all` VALUES (68, 1, '183.14.28.64', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553722189);
INSERT INTO `tp_web_log_all` VALUES (69, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553722189);
INSERT INTO `tp_web_log_all` VALUES (70, 1, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553722213);
INSERT INTO `tp_web_log_all` VALUES (71, 1, '183.14.28.66', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553722213);
INSERT INTO `tp_web_log_all` VALUES (72, 1, '183.14.28.70', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/goods/index.html', 'admin', 'Goods', 'index', 'GET', 'a:0:{}', 1553722215);
INSERT INTO `tp_web_log_all` VALUES (73, 1, '183.14.28.69', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553722260);
INSERT INTO `tp_web_log_all` VALUES (74, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553722261);
INSERT INTO `tp_web_log_all` VALUES (75, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/goods/index.html', 'admin', 'Goods', 'index', 'GET', 'a:0:{}', 1553722262);
INSERT INTO `tp_web_log_all` VALUES (76, 1, '183.14.135.121', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/demo/imageupload.html', 'admin', 'Demo', 'imageupload', 'GET', 'a:0:{}', 1553723243);
INSERT INTO `tp_web_log_all` VALUES (77, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:6:\"upload\";}', 1553723245);
INSERT INTO `tp_web_log_all` VALUES (78, 1, '183.14.28.68', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/goods/index.html', 'admin', 'Goods', 'index', 'GET', 'a:0:{}', 1553723641);
INSERT INTO `tp_web_log_all` VALUES (79, 1, '183.14.28.61', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553723641);
INSERT INTO `tp_web_log_all` VALUES (80, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553723642);
INSERT INTO `tp_web_log_all` VALUES (81, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/goods/index.html', 'admin', 'Goods', 'index', 'GET', 'a:0:{}', 1553723643);
INSERT INTO `tp_web_log_all` VALUES (82, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1553723879);
INSERT INTO `tp_web_log_all` VALUES (83, 1, '183.14.28.67', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1553723879);
INSERT INTO `tp_web_log_all` VALUES (84, 1, '183.14.28.62', '中国 广东 深圳 ', 'Windows 10', 'Chrome(69.0.3497.81)', 'http://119.3.1.237:8081/admin/goods/index.html', 'admin', 'Goods', 'index', 'GET', 'a:0:{}', 1553723880);

SET FOREIGN_KEY_CHECKS = 1;
