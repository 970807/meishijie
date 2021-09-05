/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : meishijie

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 06/09/2021 05:21:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for home_recomment_first_category_list
-- ----------------------------
DROP TABLE IF EXISTS `home_recomment_first_category_list`;
CREATE TABLE `home_recomment_first_category_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `columnTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home_recomment_first_category_list
-- ----------------------------
INSERT INTO `home_recomment_first_category_list` VALUES (1, '新鲜推荐');
INSERT INTO `home_recomment_first_category_list` VALUES (2, '时令菜肴');
INSERT INTO `home_recomment_first_category_list` VALUES (3, '肉食精选');

-- ----------------------------
-- Table structure for home_recomment_second_category_list
-- ----------------------------
DROP TABLE IF EXISTS `home_recomment_second_category_list`;
CREATE TABLE `home_recomment_second_category_list`  (
  `id` int NOT NULL,
  `parentId` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `isVideo` tinyint(1) NULL DEFAULT NULL,
  `linkUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `authorName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `authorAvatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `coverUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home_recomment_second_category_list
-- ----------------------------
INSERT INTO `home_recomment_second_category_list` VALUES (1, 1, '食光有约之茄汁南瓜夹', '南瓜、大虾、鸡蛋', 0, 'https://www.meishij.net/zuofa/shiguangyouyuezhiqiezhinanguajia.html', '慕容食光', 'https://z3.ax1x.com/2021/08/29/hGWCrt.jpg', 'https://z3.ax1x.com/2021/08/29/hGRsvn.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (2, 1, '食光有约之炸鸡脯丸', '鸡脯肉、蛋白', 0, 'https://www.meishij.net/zuofa/shiguangyouyuezhizhajifuwan.html', '慕容食光', 'https://z3.ax1x.com/2021/08/29/hGWCrt.jpg', 'https://z3.ax1x.com/2021/08/29/hGRWUU.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (3, 1, '香酥豌豆', '豌豆', 0, 'https://www.meishij.net/zuofa/xiangsuwandou.html', '糖糖食味记', 'https://z3.ax1x.com/2021/08/29/hGWFVf.jpg', 'https://z3.ax1x.com/2021/08/29/hGR4C4.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (4, 1, '【烧汁金菇肥牛卷】', '肥牛、金针菇、洋葱', 0, 'https://www.meishij.net/zuofa/shaozhijingufeiniujuan.html', '甜叮妈咪', 'https://z3.ax1x.com/2021/08/29/hGXYKf.jpg', 'https://z3.ax1x.com/2021/08/29/hGR7K1.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (5, 1, '超大口牛肉酱拌面', '玉米粒、豌豆', 0, 'https://www.meishij.net/zuofa/chaodakouniuroujiangbanmian.html', '尘暁', 'https://z3.ax1x.com/2021/08/29/hGXWa4.jpg', 'https://z3.ax1x.com/2021/08/29/hGRLVK.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (6, 2, '炒合菜', '芹菜,香干,胡萝卜,绿豆芽', 1, 'https://www.meishij.net/zuofa/chaohecai_11.html', '美食小编', 'https://z3.ax1x.com/2021/08/29/hGXzRI.jpg', 'https://z3.ax1x.com/2021/08/29/hGXIR1.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (7, 2, '重口味，轻挑战的水煮鱼片做法', '黑鱼肉片,莴笋尖,芹菜,蒜苗,黄豆芽,辣椒酱', 1, 'https://www.meishij.net/zuofa/zhongkouweiqingtiaozhandeshuizhuyupianzuofa.html', '白白白云OoO', 'https://z3.ax1x.com/2021/08/29/hGj9QP.jpg', 'https://z3.ax1x.com/2021/08/29/hGX7M6.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (8, 2, '醒酒汤', '绿豆芽', 1, 'https://www.meishij.net/zuofa/xingjiutang_1.html', '美食小编', 'https://z3.ax1x.com/2021/08/29/hGXzRI.jpg', 'https://z3.ax1x.com/2021/08/29/hGXOde.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (9, 2, '麻辣水煮鱼', '鱼,豆芽,芹菜,蒜苗', 1, 'https://www.meishij.net/zuofa/malashuizhuyu_35.html', '食客姐', 'https://z3.ax1x.com/2021/08/29/hGjCsf.jpg', 'https://z3.ax1x.com/2021/08/29/hGXXIH.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (10, 2, '豆芽炒肉', '猪五花,绿豆芽', 1, 'https://www.meishij.net/zuofa/douyachaorou_15.html', '美食小编', 'https://z3.ax1x.com/2021/08/29/hGXzRI.jpg', 'https://z3.ax1x.com/2021/08/29/hGXvid.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (11, 3, '鲜虾披萨', '高筋面粉,低筋面粉,虾', 0, 'https://www.meishij.net/zuofa/xianxiapisa_5.html', '木予的烘焙时光机', 'https://z3.ax1x.com/2021/08/29/hGjdOK.jpg', 'https://z3.ax1x.com/2021/08/29/hGjAoQ.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (12, 3, '巨好吃香辣烤鸡翅，超简单', '鸡翅中,贝贝南瓜,水果玉米,香菇', 1, 'https://www.meishij.net/zuofa/juhaochixianglakaojichichaojiandan.html', '蝶舞九天', 'https://z3.ax1x.com/2021/08/29/hGj0eO.jpg', 'https://z3.ax1x.com/2021/08/29/hGjleU.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (13, 3, '生姜这样吃，给肉都不换', '生姜,大葱,瘦肉', 1, 'https://www.meishij.net/zuofa/shengjiangzheyangchigeiroudubuhuan.html', '木木木木de健康生活', 'https://z3.ax1x.com/2021/08/29/hGjsFH.jpg', 'https://z3.ax1x.com/2021/08/29/hGjJY9.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (14, 3, '青萝卜丝鸡肉丸子汤', '青萝卜,粉丝,鸡胸肉,木耳,青椒', 0, 'https://www.meishij.net/zuofa/qingluobosijirouwanzitang.html', '霖食记', 'https://z3.ax1x.com/2021/08/29/hGjgSI.jpg', 'https://z3.ax1x.com/2021/08/29/hGjUQx.jpg');
INSERT INTO `home_recomment_second_category_list` VALUES (15, 3, '农家小炒肉', '五花肉,香豆干,大蒜叶,生姜', 0, 'https://www.meishij.net/zuofa/nongjiaxiaochaorouwucan.html', '我叫一尾鱼', 'https://z3.ax1x.com/2021/08/29/hGj2lt.jpg', 'https://z3.ax1x.com/2021/08/29/hGjay6.jpg');

-- ----------------------------
-- Table structure for hot_today_search_list
-- ----------------------------
DROP TABLE IF EXISTS `hot_today_search_list`;
CREATE TABLE `hot_today_search_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `isHot` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hot_today_search_list
-- ----------------------------
INSERT INTO `hot_today_search_list` VALUES (1, '早餐', 1);
INSERT INTO `hot_today_search_list` VALUES (2, '鱼香肉丝', 1);
INSERT INTO `hot_today_search_list` VALUES (3, '家常菜', 1);
INSERT INTO `hot_today_search_list` VALUES (4, '红烧肉', 0);
INSERT INTO `hot_today_search_list` VALUES (5, '牛肉', 0);
INSERT INTO `hot_today_search_list` VALUES (6, '红烧排骨', 0);
INSERT INTO `hot_today_search_list` VALUES (7, '宫保鸡丁', 0);
INSERT INTO `hot_today_search_list` VALUES (8, '酸菜鱼', 0);
INSERT INTO `hot_today_search_list` VALUES (9, '可乐鸡翅', 0);

-- ----------------------------
-- Table structure for hot_today_video_list
-- ----------------------------
DROP TABLE IF EXISTS `hot_today_video_list`;
CREATE TABLE `hot_today_video_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `userAvatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `linkUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `coverUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `videoUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hot_today_video_list
-- ----------------------------
INSERT INTO `hot_today_video_list` VALUES (1, '葱油拌面', '菜菜美食日记', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/avatar_菜菜美食日记.jpg?versionId=CAEQKhiBgMDaodLd3RciIGMxNTY3N2JkNTU1NzQwOTc5ZjI3NjMxYjM5MDU2MGRl', 'https://i.meishi.cc/daren_task/article_detail.php?id=131036', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/葱油拌面.jpg?versionId=CAEQKhiBgICugsTd3RciIGMzY2Q3YzQwZDM2NzQzYWQ4N2NmMDFkYjI4ZmZhMzQ2', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/video_葱油拌面.mp4?versionId=CAEQKhiBgICUwZHe3RciIDFhNjIyYjg4ZWZmMjRjNTVhNWNiMjU5YWFkOWJjODky');
INSERT INTO `hot_today_video_list` VALUES (2, '凉拌藕片', '馋哭姐', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/avatar_馋哭姐.jpg?versionId=CAEQKhiBgIDYodLd3RciIDA4MTFhNzk3ZDc3ODRhMzk4MDE5NTcxMjFhM2U2MjI0', 'https://i.meishi.cc/daren_task/article_detail.php?id=90617', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/凉拌藕片.jpg?versionId=CAEQKhiBgIDsgcTd3RciIDdkZTk2MzJkODI4ODRhNjc5YzY0YjQ0NDRmNTIxYjhh', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/video_凉拌藕片.mp4?versionId=CAEQKhiBgICpv5He3RciIGRkN2NhYTFmODI0ODQxZjZhZDdkNzc2MWNiZTVjMDJk');
INSERT INTO `hot_today_video_list` VALUES (3, '瘦身冬瓜汤', '舌里美食记', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/avatar_舌里美食记.jpg?versionId=CAEQKhiBgMDKodLd3RciIGVlOTQxNjFmODY1MjRiZGE5NjMwNWUzMmVjYjBkNWU4', 'https://i.meishi.cc/daren_task/article_detail.php?id=146633', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/瘦身冬瓜汤.jpg?versionId=CAEQKhiBgMDXgcTd3RciIDM1MjBlM2ZlMWVlZTRjMWU4ODEyMDk2M2UwN2U3MDE2', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/video_瘦身冬瓜汤.mp4?versionId=CAEQKhiBgMDbv5He3RciIDE2NmNmNmU3YzFiZTQ3MWU4OGU5OTRhZmY0ZjQxMGI0');
INSERT INTO `hot_today_video_list` VALUES (4, '茄子豆角', '新东方小食神', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/avatar_新东方小食神.jpg?versionId=CAEQKhiBgIDDodLd3RciIGYxNzFkZGU1M2IzNDRhNjA4MTgyZGUzMDc1YTFjMWI3', 'https://www.meishij.net/zuofa/qiezidoujiao_15.html', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/茄子豆角.jpg?versionId=CAEQKhiBgMD.gcTd3RciIDE3ZDQzMWEwNDg2ZTQyZDVhZTY0NDZiYzk5NWEwMTc2', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/video_茄子豆角.mp4?versionId=CAEQKhiBgMDTwJHe3RciIGE3NDc2OGJhYTNiNDQ1ZDQ5YjExNTYyYjhjZjY3ZTQ4');

-- ----------------------------
-- Table structure for three_meals_today_first_category_list
-- ----------------------------
DROP TABLE IF EXISTS `three_meals_today_first_category_list`;
CREATE TABLE `three_meals_today_first_category_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of three_meals_today_first_category_list
-- ----------------------------
INSERT INTO `three_meals_today_first_category_list` VALUES (1, '早餐');
INSERT INTO `three_meals_today_first_category_list` VALUES (2, '午餐');
INSERT INTO `three_meals_today_first_category_list` VALUES (3, '下午茶');
INSERT INTO `three_meals_today_first_category_list` VALUES (4, '晚餐');
INSERT INTO `three_meals_today_first_category_list` VALUES (5, '夜宵');

-- ----------------------------
-- Table structure for three_meals_today_second_category_list
-- ----------------------------
DROP TABLE IF EXISTS `three_meals_today_second_category_list`;
CREATE TABLE `three_meals_today_second_category_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `coverUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of three_meals_today_second_category_list
-- ----------------------------
INSERT INTO `three_meals_today_second_category_list` VALUES (1, 1, '五彩虾仁炒饭', '营养丰富，早餐最爱', 'https://z3.ax1x.com/2021/08/29/hGguKx.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (2, 1, '爱心满满的黑椒蔬菜牛排', '简单快手，分分钟搞定', 'https://z3.ax1x.com/2021/08/29/hGgRs0.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (3, 1, '鲜活时蔬面', '简单美味，几分钟搞定早餐', 'https://z3.ax1x.com/2021/08/29/hGghZT.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (4, 2, '蜜汁烤五花肉', '经典家常，上桌就光盘', 'https://z3.ax1x.com/2021/08/29/hGgTJJ.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (5, 2, '家常小炒', '经济实惠，有滋有味', 'https://z3.ax1x.com/2021/08/29/hG2Eef.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (6, 2, '酱香洋葱烤鸡', '营养美味，一吃停不下来', 'https://z3.ax1x.com/2021/08/29/hG2mFg.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (7, 3, '花朵酥脆曲奇', '香气扑鼻，好吃过瘾', 'https://z3.ax1x.com/2021/08/29/hG2lyq.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (8, 3, '舒芙蕾厚松饼', '惊艳味蕾，好吃到爆', 'https://z3.ax1x.com/2021/08/29/hG2NY4.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (9, 3, '紫薯西米露', '美味下午茶，让人欲罢不能', 'https://z3.ax1x.com/2021/08/29/hG2BOx.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (10, 4, '红烧猪蹄', '美味飘香，满足味蕾', 'https://z3.ax1x.com/2021/08/29/hG22fH.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (11, 4, '凉拌西兰花', '鲜香可口，美味下饭', 'https://z3.ax1x.com/2021/08/29/hG2Wpd.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (12, 4, '减肥餐～苦瓜酿肉', '家常经典，上桌被抢光', 'https://z3.ax1x.com/2021/08/29/hG24Xt.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (13, 5, '孜然土豆', '味道超赞，无比解馋', 'https://z3.ax1x.com/2021/08/29/hG2T78.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (14, 5, '酸辣鸡爪', '均衡营养，滋补养生', 'https://z3.ax1x.com/2021/08/29/hG2qhQ.jpg');
INSERT INTO `three_meals_today_second_category_list` VALUES (15, 5, '风味花生', '美味过瘾，好吃停不下嘴', 'https://z3.ax1x.com/2021/08/29/hG2jcn.jpg');

-- ----------------------------
-- Table structure for user_list
-- ----------------------------
DROP TABLE IF EXISTS `user_list`;
CREATE TABLE `user_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_list
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
