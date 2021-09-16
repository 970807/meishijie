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

 Date: 16/09/2021 08:46:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for home_recommend_column_list
-- ----------------------------
DROP TABLE IF EXISTS `home_recommend_column_list`;
CREATE TABLE `home_recommend_column_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `column_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `show_recipe_count` int NOT NULL,
  `recipe_list_str` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜谱id,排序值;菜谱id,排序值;菜谱id,排序值;',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home_recommend_column_list
-- ----------------------------
INSERT INTO `home_recommend_column_list` VALUES (1, '时令菜肴', 5, '4ac932f0-128c-45f0-9ecc-c6b0f1853ddf,3;585c9581-8e91-4f8e-950f-ec1571507b99,5;2972563b-4184-4383-9d4b-5417b17b5419,7;', '2021-09-16 07:08:16', '2021-09-16 07:08:16');

-- ----------------------------
-- Table structure for home_recomment_first_category_list
-- ----------------------------
DROP TABLE IF EXISTS `home_recomment_first_category_list`;
CREATE TABLE `home_recomment_first_category_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `columnTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hot_today_video_list
-- ----------------------------
INSERT INTO `hot_today_video_list` VALUES (1, '葱油拌面', '菜菜美食日记', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/avatar_菜菜美食日记.jpg?versionId=CAEQKhiBgMDaodLd3RciIGMxNTY3N2JkNTU1NzQwOTc5ZjI3NjMxYjM5MDU2MGRl', 'https://i.meishi.cc/daren_task/article_detail.php?id=131036', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/葱油拌面.jpg?versionId=CAEQKhiBgICugsTd3RciIGMzY2Q3YzQwZDM2NzQzYWQ4N2NmMDFkYjI4ZmZhMzQ2', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/video_葱油拌面.mp4?versionId=CAEQKhiBgICUwZHe3RciIDFhNjIyYjg4ZWZmMjRjNTVhNWNiMjU5YWFkOWJjODky');
INSERT INTO `hot_today_video_list` VALUES (2, '凉拌藕片', '馋哭姐', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/avatar_馋哭姐.jpg?versionId=CAEQKhiBgIDYodLd3RciIDA4MTFhNzk3ZDc3ODRhMzk4MDE5NTcxMjFhM2U2MjI0', 'https://i.meishi.cc/daren_task/article_detail.php?id=90617', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/凉拌藕片.jpg?versionId=CAEQKhiBgIDsgcTd3RciIDdkZTk2MzJkODI4ODRhNjc5YzY0YjQ0NDRmNTIxYjhh', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/video_凉拌藕片.mp4?versionId=CAEQKhiBgICpv5He3RciIGRkN2NhYTFmODI0ODQxZjZhZDdkNzc2MWNiZTVjMDJk');
INSERT INTO `hot_today_video_list` VALUES (3, '瘦身冬瓜汤', '舌里美食记', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/avatar_舌里美食记.jpg?versionId=CAEQKhiBgMDKodLd3RciIGVlOTQxNjFmODY1MjRiZGE5NjMwNWUzMmVjYjBkNWU4', 'https://i.meishi.cc/daren_task/article_detail.php?id=146633', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/瘦身冬瓜汤.jpg?versionId=CAEQKhiBgMDXgcTd3RciIDM1MjBlM2ZlMWVlZTRjMWU4ODEyMDk2M2UwN2U3MDE2', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/video_瘦身冬瓜汤.mp4?versionId=CAEQKhiBgMDbv5He3RciIDE2NmNmNmU3YzFiZTQ3MWU4OGU5OTRhZmY0ZjQxMGI0');
INSERT INTO `hot_today_video_list` VALUES (4, '茄子豆角', '新东方小食神', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/avatar_新东方小食神.jpg?versionId=CAEQKhiBgIDDodLd3RciIGYxNzFkZGU1M2IzNDRhNjA4MTgyZGUzMDc1YTFjMWI3', 'https://www.meishij.net/zuofa/qiezidoujiao_15.html', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/茄子豆角.jpg?versionId=CAEQKhiBgMD.gcTd3RciIDE3ZDQzMWEwNDg2ZTQyZDVhZTY0NDZiYzk5NWEwMTc2', 'https://meishijie210906.oss-cn-shenzhen.aliyuncs.com/hotTodayVideo/video_茄子豆角.mp4?versionId=CAEQKhiBgMDTwJHe3RciIGE3NDc2OGJhYTNiNDQ1ZDQ5YjExNTYyYjhjZjY3ZTQ4');

-- ----------------------------
-- Table structure for recipe_detail_list
-- ----------------------------
DROP TABLE IF EXISTS `recipe_detail_list`;
CREATE TABLE `recipe_detail_list`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_video` tinyint UNSIGNED NOT NULL COMMENT '是否是视频菜谱 1 => 是 0 => 否',
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜谱封面地址',
  `video_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜谱视频地址',
  `recipe_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜谱名称',
  `fav_count` int NOT NULL COMMENT '收藏数',
  `brower_count` int NOT NULL COMMENT '浏览数',
  `simple_introduction_technology` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '工艺',
  `simple_introduction_taste` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '口味',
  `simple_introduction_time` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '时间',
  `simple_introduction_difficulty` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '难度',
  `recipe_qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜谱二维码',
  `main_ingredients_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主料',
  `sub_ingredients_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '辅料',
  `people_count` int NOT NULL COMMENT '例：3人份',
  `author_id` int NOT NULL COMMENT '作者用户id',
  `author_words` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `finish_food_imgs_str` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `steps_str` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜谱步骤：格式 =>  步骤图片,步骤内容;步骤图片,步骤内容;',
  `recipe_tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `origin_web_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '美食杰官方对应的链接',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recipe_detail_list
-- ----------------------------
INSERT INTO `recipe_detail_list` VALUES ('2972563b-4184-4383-9d4b-5417b17b5419', 1, 'https://st-cn.meishij.net/r/239/17/2941989/s2941989_158177917020040.jpg', 'https://v2.meishij.net/my/2941989/1581779105078.mp4?k=b147bbf35d322e7f&t=1631749054', '腌制辣白菜', 1, 3315, '腌', '家常味', '90分钟', '新手尝试', 'https://www.meishij.net/ajax/qrcode_wap.php?i=1956797', '白菜:1颗;苹果:1个;雪梨:1个;白萝卜:半根;蒜苗:3根;虾皮:30克;', '糯米粉:200克;水:150克;辣椒粉:200克;糖:2勺;盐:3勺;姜:30克;蒜:30克;', 2, 3, '每逢过年都会腌制一些菜，今天做个韩式辣白菜，做法很简单哦', 'https://st-cn.meishij.net/rs/239/17/2941989/n2941989_158178540865284.jpg;https://st-cn.meishij.net/rs/239/17/2941989/n2941989_158178540947667.jpg;', 'https://st-cn.meishij.net/rs/239/17/2941989/n2941989_158178535225625.jpg,白菜一颗;https://st-cn.meishij.net/rs/239/17/2941989/n2941989_158178536243186.jpg,切成2半，涂抹上盐，腌制4个小时;https://st-cn.meishij.net/rs/239/17/2941989/n2941989_158178536200377.jpg,准备酱料的食材;https://st-cn.meishij.net/rs/239/17/2941989/n2941989_158178536509086.jpg,白萝卜，蒜苗切丝;https://st-cn.meishij.net/rs/239/17/2941989/n2941989_158178538734190.jpg,糯米粉用水煮开;https://st-cn.meishij.net/rs/239/17/2941989/n2941989_158178538838404.jpg,加入辣椒粉，虾皮，姜蒜沫;https://st-cn.meishij.net/rs/239/17/2941989/n2941989_158178538504885.jpg,放入白萝卜，苹果，梨和蒜苗;https://st-cn.meishij.net/rs/239/17/2941989/n2941989_158178539149482.jpg,拌匀后加入糖和盐;https://st-cn.meishij.net/rs/239/17/2941989/n2941989_158178539751143.jpg,搅拌均匀，涂抹到白菜上;https://st-cn.meishij.net/rs/239/17/2941989/n2941989_158178540233214.jpg,放入容器里，密封腌制3-5天。;', '', NULL, '2021-09-16 07:07:42', '2021-09-16 07:07:42');
INSERT INTO `recipe_detail_list` VALUES ('4ac932f0-128c-45f0-9ecc-c6b0f1853ddf', 1, 'https://st-cn.meishij.net/r/150/151/14787900/s14787900_161647441951905.jpg', 'https://v2.meishij.net/my/14787900/1616474392066.mp4?k=65a5b6f60da13687&t=1631749025', '春天不可错过，野菜这样吃味道超赞…蒸豌', 399, 6148, '蒸', '家常味', '30分钟', '未知', 'https://www.meishij.net/ajax/qrcode_wap.php?i=1981774', '豌豆苗:500克;面粉:适量;', '盐:适量;蒜瓣:10瓣;蒜苗:2根;生抽:2勺;陈醋:2勺;白糖:1勺;油辣椒:1勺;芝麻油:适量;', 3, 2, '春天真是各种野菜上市的时候，春天的滋味不可错过。\n简单面粉拌一拌蒸一蒸，绝美滋味！', 'https://st-cn.meishij.net/rs/150/151/14787900/n14787900_161641461140233.jpg;https://st-cn.meishij.net/rs/150/151/14787900/n14787900_161641461889429.jpg;', 'https://st-cn.meishij.net/rs/150/151/14787900/n14787900_161641456506731.jpg,豌豆苗洗净沥干水分。;https://st-cn.meishij.net/rs/150/151/14787900/n14787900_161641456768143.jpg,把豌豆苗均匀的拌上干面粉放入蒸笼。;https://st-cn.meishij.net/rs/150/151/14787900/n14787900_161641457075990.jpg,蒸锅上汽放入蒸笼大火蒸至10分钟。;https://st-cn.meishij.net/rs/150/151/14787900/n14787900_161641457306671.jpg,把蒜瓣，蒜苗切碎。;https://st-cn.meishij.net/rs/150/151/14787900/n14787900_161641457684674.jpg,小碗中加入生抽，陈醋，糖油辣椒，香油拌均匀。;https://st-cn.meishij.net/rs/150/151/14787900/n14787900_161641458014785.jpg,蒸好的豌豆苗加入盐，蒜末，蒜苗拌均匀。;https://st-cn.meishij.net/rs/150/151/14787900/n14787900_161641458731776.jpg,随蘸料上桌食用。;', '蒸野菜的时候，野菜一定要把水分沥干，最好是晒一下，然后再拌面粉蒸至，这样才能保证野菜口感好。', NULL, '2021-09-16 07:07:22', '2021-09-16 07:07:22');
INSERT INTO `recipe_detail_list` VALUES ('585c9581-8e91-4f8e-950f-ec1571507b99', 1, 'https://st-cn.meishij.net/r/41/203/113291/s113291_155082461119028.jpg', 'http://gslb.miaopai.com/stream/h~4AoQyPfrg2WsM4ba-Rhx17PDHXBGs2NYLx3g__.mp4?', '蒜苗回锅肉', 94, 36611, '炒', '家常味', '30分钟', '新手尝试', 'https://www.meishij.net/ajax/qrcode_wap.php?i=1919709', '蒜苗:50克;五花肉:100克;', '姜:5克;葱:10克;蒜:8克;', 1, 1, '无', 'https://st-cn.meishij.net/rs/41/203/113291/n113291_155082473777384.jpg;', 'https://st-cn.meishij.net/rs/41/203/113291/n113291_155082469456562.jpg,姜丝5克，葱花10克，蒜片8克，蒜苗50克切段，五花肉100克切块;https://st-cn.meishij.net/rs/41/203/113291/n113291_155082470331756.jpg,锅中食用油5ML，倒入蒜片，葱花，大火爆香;https://st-cn.meishij.net/rs/41/203/113291/n113291_155082471382386.jpg,倒入五花肉，煸炒至肉块变色;https://st-cn.meishij.net/rs/41/203/113291/n113291_155082472160064.jpg,倒入花椒1克、豆豉15克，翻炒均匀，豆瓣酱20克，生抽50克，翻炒出红油;https://st-cn.meishij.net/rs/41/203/113291/n113291_155082473214110.jpg,倒入蒜苗，翻炒均匀;', '', NULL, '2021-09-16 07:06:59', '2021-09-16 07:06:59');

-- ----------------------------
-- Table structure for recipe_ingredient_category_list
-- ----------------------------
DROP TABLE IF EXISTS `recipe_ingredient_category_list`;
CREATE TABLE `recipe_ingredient_category_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '食材分类名称',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recipe_ingredient_category_list
-- ----------------------------
INSERT INTO `recipe_ingredient_category_list` VALUES (1, '蔬果类', '2021-09-12 00:32:18', '2021-09-12 00:32:18');
INSERT INTO `recipe_ingredient_category_list` VALUES (2, '生鲜类', '2021-09-12 00:32:27', '2021-09-12 00:32:27');
INSERT INTO `recipe_ingredient_category_list` VALUES (3, '五谷', '2021-09-12 00:32:35', '2021-09-12 00:32:35');
INSERT INTO `recipe_ingredient_category_list` VALUES (4, '食品与饮品', '2021-09-12 00:32:45', '2021-09-12 00:32:45');
INSERT INTO `recipe_ingredient_category_list` VALUES (5, '维生素', '2021-09-12 00:32:52', '2021-09-12 00:32:52');
INSERT INTO `recipe_ingredient_category_list` VALUES (6, '体质', '2021-09-12 00:32:58', '2021-09-12 00:32:58');
INSERT INTO `recipe_ingredient_category_list` VALUES (7, '茎叶花类', '2021-09-12 00:33:10', '2021-09-12 00:33:10');
INSERT INTO `recipe_ingredient_category_list` VALUES (8, '根茎类', '2021-09-12 00:33:21', '2021-09-12 00:33:21');
INSERT INTO `recipe_ingredient_category_list` VALUES (9, '瓜果类', '2021-09-12 00:33:29', '2021-09-12 00:33:29');
INSERT INTO `recipe_ingredient_category_list` VALUES (10, '菌类', '2021-09-12 00:33:35', '2021-09-12 00:33:35');
INSERT INTO `recipe_ingredient_category_list` VALUES (11, '葱蒜类', '2021-09-12 00:33:51', '2021-09-12 00:33:51');
INSERT INTO `recipe_ingredient_category_list` VALUES (12, '鲜豆类', '2021-09-12 00:34:08', '2021-09-12 00:34:08');
INSERT INTO `recipe_ingredient_category_list` VALUES (13, '猪肉', '2021-09-12 00:34:16', '2021-09-12 00:34:16');
INSERT INTO `recipe_ingredient_category_list` VALUES (14, '牛肉', '2021-09-12 00:34:22', '2021-09-12 00:34:22');
INSERT INTO `recipe_ingredient_category_list` VALUES (15, '羊肉', '2021-09-12 00:34:30', '2021-09-12 00:34:30');
INSERT INTO `recipe_ingredient_category_list` VALUES (16, '鸡肉', '2021-09-12 00:34:37', '2021-09-12 00:34:37');
INSERT INTO `recipe_ingredient_category_list` VALUES (17, '鸭肉', '2021-09-12 00:34:43', '2021-09-12 00:34:43');
INSERT INTO `recipe_ingredient_category_list` VALUES (18, '肉制品', '2021-09-12 00:34:53', '2021-09-12 00:34:53');
INSERT INTO `recipe_ingredient_category_list` VALUES (19, '其他肉类', '2021-09-12 00:35:02', '2021-09-12 00:35:02');
INSERT INTO `recipe_ingredient_category_list` VALUES (20, '淡水鱼', '2021-09-12 00:35:09', '2021-09-12 00:35:09');
INSERT INTO `recipe_ingredient_category_list` VALUES (21, '咸水鱼', '2021-09-12 00:35:15', '2021-09-12 00:35:15');
INSERT INTO `recipe_ingredient_category_list` VALUES (22, '鱼制品', '2021-09-12 00:35:22', '2021-09-12 00:35:22');
INSERT INTO `recipe_ingredient_category_list` VALUES (23, '虾', '2021-09-12 00:35:28', '2021-09-12 00:35:28');
INSERT INTO `recipe_ingredient_category_list` VALUES (24, '蟹', '2021-09-12 00:35:34', '2021-09-12 00:35:34');
INSERT INTO `recipe_ingredient_category_list` VALUES (25, '藻类', '2021-09-12 00:35:40', '2021-09-12 00:35:40');
INSERT INTO `recipe_ingredient_category_list` VALUES (26, '贝', '2021-09-12 00:35:47', '2021-09-12 00:35:47');
INSERT INTO `recipe_ingredient_category_list` VALUES (27, '其他水产', '2021-09-12 00:35:54', '2021-09-12 00:35:54');
INSERT INTO `recipe_ingredient_category_list` VALUES (28, '蛋类', '2021-09-12 00:35:59', '2021-09-12 00:35:59');
INSERT INTO `recipe_ingredient_category_list` VALUES (29, '奶类', '2021-09-12 00:36:03', '2021-09-12 00:36:03');
INSERT INTO `recipe_ingredient_category_list` VALUES (30, '豆类', '2021-09-12 00:36:09', '2021-09-12 00:36:09');
INSERT INTO `recipe_ingredient_category_list` VALUES (31, '豆制品', '2021-09-12 00:36:14', '2021-09-12 00:36:14');
INSERT INTO `recipe_ingredient_category_list` VALUES (32, '水果', '2021-09-12 00:36:21', '2021-09-12 00:36:21');
INSERT INTO `recipe_ingredient_category_list` VALUES (33, '干果', '2021-09-12 00:36:28', '2021-09-12 00:36:28');
INSERT INTO `recipe_ingredient_category_list` VALUES (34, '药材', '2021-09-12 00:37:04', '2021-09-12 00:37:04');
INSERT INTO `recipe_ingredient_category_list` VALUES (35, '调味品', '2021-09-12 00:37:15', '2021-09-12 01:20:21');

-- ----------------------------
-- Table structure for recipe_ingredient_list
-- ----------------------------
DROP TABLE IF EXISTS `recipe_ingredient_list`;
CREATE TABLE `recipe_ingredient_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `ingredient_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 669 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recipe_ingredient_list
-- ----------------------------
INSERT INTO `recipe_ingredient_list` VALUES (1, 1, '蔬菜', '2021-09-12 02:39:21', '2021-09-12 02:39:21');
INSERT INTO `recipe_ingredient_list` VALUES (2, 1, '水果', '2021-09-12 02:39:40', '2021-09-12 02:39:40');
INSERT INTO `recipe_ingredient_list` VALUES (3, 1, '薯类淀粉', '2021-09-12 02:39:53', '2021-09-12 02:39:53');
INSERT INTO `recipe_ingredient_list` VALUES (4, 1, '菌藻', '2021-09-12 02:40:15', '2021-09-12 02:40:15');
INSERT INTO `recipe_ingredient_list` VALUES (5, 2, '畜肉', '2021-09-12 02:40:42', '2021-09-12 02:40:42');
INSERT INTO `recipe_ingredient_list` VALUES (6, 2, '禽肉', '2021-09-12 02:41:01', '2021-09-12 02:41:01');
INSERT INTO `recipe_ingredient_list` VALUES (7, 2, '鱼虾蟹贝', '2021-09-12 02:41:16', '2021-09-12 02:41:16');
INSERT INTO `recipe_ingredient_list` VALUES (8, 2, '蛋类', '2021-09-12 02:41:27', '2021-09-12 02:41:27');
INSERT INTO `recipe_ingredient_list` VALUES (9, 3, '谷类', '2021-09-12 02:41:38', '2021-09-12 02:41:38');
INSERT INTO `recipe_ingredient_list` VALUES (10, 3, '干豆', '2021-09-12 02:41:48', '2021-09-12 02:41:48');
INSERT INTO `recipe_ingredient_list` VALUES (11, 3, '坚果种子', '2021-09-12 02:42:00', '2021-09-12 02:42:00');
INSERT INTO `recipe_ingredient_list` VALUES (12, 4, '速食食品', '2021-09-12 02:42:14', '2021-09-12 02:42:14');
INSERT INTO `recipe_ingredient_list` VALUES (13, 4, '婴幼儿食品', '2021-09-12 02:42:36', '2021-09-12 02:42:36');
INSERT INTO `recipe_ingredient_list` VALUES (14, 4, '小吃甜饼', '2021-09-12 02:42:51', '2021-09-12 02:42:51');
INSERT INTO `recipe_ingredient_list` VALUES (15, 4, '糖蜜饯', '2021-09-12 02:43:09', '2021-09-12 02:43:09');
INSERT INTO `recipe_ingredient_list` VALUES (16, 4, '乳类', '2021-09-12 02:43:20', '2021-09-12 02:43:20');
INSERT INTO `recipe_ingredient_list` VALUES (17, 4, '软饮料', '2021-09-12 02:43:35', '2021-09-12 02:43:35');
INSERT INTO `recipe_ingredient_list` VALUES (18, 4, '酒精饮料', '2021-09-12 02:43:46', '2021-09-12 02:43:46');
INSERT INTO `recipe_ingredient_list` VALUES (19, 5, '维生素A', '2021-09-12 02:43:58', '2021-09-12 02:43:58');
INSERT INTO `recipe_ingredient_list` VALUES (20, 5, '维生素B1', '2021-09-12 02:44:08', '2021-09-12 02:44:08');
INSERT INTO `recipe_ingredient_list` VALUES (21, 5, '维生素B2', '2021-09-12 02:44:19', '2021-09-12 02:44:19');
INSERT INTO `recipe_ingredient_list` VALUES (22, 5, '维生素B6', '2021-09-12 02:44:30', '2021-09-12 02:44:30');
INSERT INTO `recipe_ingredient_list` VALUES (23, 5, '维生素B12', '2021-09-12 02:44:39', '2021-09-12 02:44:39');
INSERT INTO `recipe_ingredient_list` VALUES (24, 5, '维生素C', '2021-09-12 02:44:52', '2021-09-12 02:44:52');
INSERT INTO `recipe_ingredient_list` VALUES (25, 5, '维生素E', '2021-09-12 02:45:01', '2021-09-12 02:45:01');
INSERT INTO `recipe_ingredient_list` VALUES (26, 6, '阳虚质', '2021-09-12 02:45:19', '2021-09-12 02:45:19');
INSERT INTO `recipe_ingredient_list` VALUES (27, 6, '阴虚质', '2021-09-12 02:45:30', '2021-09-12 02:45:30');
INSERT INTO `recipe_ingredient_list` VALUES (28, 6, '气虚质', '2021-09-12 02:45:39', '2021-09-12 02:45:39');
INSERT INTO `recipe_ingredient_list` VALUES (29, 6, '气郁质', '2021-09-12 02:45:57', '2021-09-12 02:45:57');
INSERT INTO `recipe_ingredient_list` VALUES (30, 6, '痰湿质', '2021-09-12 02:46:10', '2021-09-12 02:46:10');
INSERT INTO `recipe_ingredient_list` VALUES (31, 6, '湿热质', '2021-09-12 02:46:21', '2021-09-12 02:46:21');
INSERT INTO `recipe_ingredient_list` VALUES (32, 6, '血瘀质', '2021-09-12 02:46:34', '2021-09-12 02:46:34');
INSERT INTO `recipe_ingredient_list` VALUES (33, 6, '特禀质', '2021-09-12 02:46:45', '2021-09-12 02:46:45');
INSERT INTO `recipe_ingredient_list` VALUES (34, 6, '平和质', '2021-09-12 02:46:56', '2021-09-12 02:46:56');
INSERT INTO `recipe_ingredient_list` VALUES (35, 7, '白菜', '2021-09-12 02:47:13', '2021-09-12 02:47:13');
INSERT INTO `recipe_ingredient_list` VALUES (36, 7, '菜花', '2021-09-12 02:47:32', '2021-09-12 02:47:32');
INSERT INTO `recipe_ingredient_list` VALUES (37, 7, '小白菜', '2021-09-12 02:47:41', '2021-09-12 02:47:41');
INSERT INTO `recipe_ingredient_list` VALUES (38, 7, '娃娃菜', '2021-09-12 02:47:49', '2021-09-12 02:47:49');
INSERT INTO `recipe_ingredient_list` VALUES (39, 7, '芥菜', '2021-09-12 02:47:57', '2021-09-12 02:47:57');
INSERT INTO `recipe_ingredient_list` VALUES (40, 7, '茼蒿', '2021-09-12 02:48:09', '2021-09-12 02:48:09');
INSERT INTO `recipe_ingredient_list` VALUES (41, 7, '梅菜', '2021-09-12 02:48:23', '2021-09-12 02:48:23');
INSERT INTO `recipe_ingredient_list` VALUES (42, 7, '茴香', '2021-09-12 02:48:34', '2021-09-12 02:48:34');
INSERT INTO `recipe_ingredient_list` VALUES (43, 7, '苦菊', '2021-09-12 02:48:43', '2021-09-12 02:48:43');
INSERT INTO `recipe_ingredient_list` VALUES (44, 7, '春笋', '2021-09-12 02:48:52', '2021-09-12 02:48:52');
INSERT INTO `recipe_ingredient_list` VALUES (45, 7, '木耳菜', '2021-09-12 02:49:03', '2021-09-12 02:49:03');
INSERT INTO `recipe_ingredient_list` VALUES (46, 7, '萝卜苗', '2021-09-12 02:49:15', '2021-09-12 02:49:15');
INSERT INTO `recipe_ingredient_list` VALUES (47, 7, '香芹', '2021-09-12 02:49:26', '2021-09-12 02:49:26');
INSERT INTO `recipe_ingredient_list` VALUES (48, 7, '苜蓿', '2021-09-12 02:49:39', '2021-09-12 02:49:39');
INSERT INTO `recipe_ingredient_list` VALUES (49, 7, '雪菜', '2021-09-12 02:49:47', '2021-09-12 02:49:47');
INSERT INTO `recipe_ingredient_list` VALUES (50, 7, '芝麻菜', '2021-09-12 02:49:58', '2021-09-12 02:49:58');
INSERT INTO `recipe_ingredient_list` VALUES (51, 7, '刺儿菜', '2021-09-12 02:50:10', '2021-09-12 02:50:10');
INSERT INTO `recipe_ingredient_list` VALUES (52, 7, '萝卜叶', '2021-09-12 02:50:27', '2021-09-12 02:50:27');
INSERT INTO `recipe_ingredient_list` VALUES (53, 7, '豆瓣菜', '2021-09-12 02:50:39', '2021-09-12 02:50:39');
INSERT INTO `recipe_ingredient_list` VALUES (54, 7, '紫背天葵', '2021-09-12 02:50:51', '2021-09-12 02:50:51');
INSERT INTO `recipe_ingredient_list` VALUES (55, 7, '莼菜', '2021-09-12 02:51:03', '2021-09-12 02:51:03');
INSERT INTO `recipe_ingredient_list` VALUES (56, 7, '芹菜', '2021-09-12 02:51:14', '2021-09-12 02:51:14');
INSERT INTO `recipe_ingredient_list` VALUES (57, 7, '西兰花', '2021-09-12 02:51:34', '2021-09-12 02:51:34');
INSERT INTO `recipe_ingredient_list` VALUES (58, 7, '卷心菜', '2021-09-12 02:51:44', '2021-09-12 02:51:44');
INSERT INTO `recipe_ingredient_list` VALUES (59, 7, '油菜', '2021-09-12 02:51:55', '2021-09-12 02:51:55');
INSERT INTO `recipe_ingredient_list` VALUES (60, 7, '西芹', '2021-09-12 02:52:04', '2021-09-12 02:52:04');
INSERT INTO `recipe_ingredient_list` VALUES (61, 7, '竹笋', '2021-09-12 02:52:11', '2021-09-12 02:52:11');
INSERT INTO `recipe_ingredient_list` VALUES (62, 7, '芦笋', '2021-09-12 02:52:20', '2021-09-12 02:52:20');
INSERT INTO `recipe_ingredient_list` VALUES (63, 7, '梅干菜', '2021-09-12 02:52:31', '2021-09-12 02:52:31');
INSERT INTO `recipe_ingredient_list` VALUES (64, 7, '芦荟', '2021-09-12 02:52:38', '2021-09-12 02:52:38');
INSERT INTO `recipe_ingredient_list` VALUES (65, 7, '空心菜', '2021-09-12 02:52:46', '2021-09-12 02:52:46');
INSERT INTO `recipe_ingredient_list` VALUES (66, 7, '豌豆尖', '2021-09-12 02:52:53', '2021-09-12 02:52:53');
INSERT INTO `recipe_ingredient_list` VALUES (67, 7, '圆生菜', '2021-09-12 02:53:05', '2021-09-12 02:53:05');
INSERT INTO `recipe_ingredient_list` VALUES (68, 7, '香菜', '2021-09-12 02:53:12', '2021-09-12 02:53:12');
INSERT INTO `recipe_ingredient_list` VALUES (69, 7, '韭菜', '2021-09-12 02:53:18', '2021-09-12 02:53:18');
INSERT INTO `recipe_ingredient_list` VALUES (70, 7, '黄花菜', '2021-09-12 02:53:28', '2021-09-12 02:53:28');
INSERT INTO `recipe_ingredient_list` VALUES (71, 7, '红菜苔', '2021-09-12 02:53:39', '2021-09-12 02:53:39');
INSERT INTO `recipe_ingredient_list` VALUES (72, 7, '枸杞菜', '2021-09-12 02:53:51', '2021-09-12 02:53:51');
INSERT INTO `recipe_ingredient_list` VALUES (73, 7, '蒲菜', '2021-09-12 02:54:00', '2021-09-12 02:54:00');
INSERT INTO `recipe_ingredient_list` VALUES (74, 7, '马齿苋', '2021-09-12 02:54:11', '2021-09-12 02:54:11');
INSERT INTO `recipe_ingredient_list` VALUES (75, 7, '龙蒿', '2021-09-12 02:54:26', '2021-09-12 02:54:26');
INSERT INTO `recipe_ingredient_list` VALUES (76, 7, '菠菜', '2021-09-12 02:54:34', '2021-09-12 02:54:34');
INSERT INTO `recipe_ingredient_list` VALUES (77, 7, '酸白菜', '2021-09-12 02:54:44', '2021-09-12 02:54:44');
INSERT INTO `recipe_ingredient_list` VALUES (78, 7, '莴笋', '2021-09-12 02:54:52', '2021-09-12 02:54:52');
INSERT INTO `recipe_ingredient_list` VALUES (79, 7, '百合', '2021-09-12 02:55:00', '2021-09-12 02:55:00');
INSERT INTO `recipe_ingredient_list` VALUES (80, 7, '苋菜', '2021-09-12 02:55:12', '2021-09-12 02:55:12');
INSERT INTO `recipe_ingredient_list` VALUES (81, 7, '紫甘蓝', '2021-09-12 02:55:20', '2021-09-12 02:55:20');
INSERT INTO `recipe_ingredient_list` VALUES (82, 7, '荠菜', '2021-09-12 02:55:30', '2021-09-12 02:55:30');
INSERT INTO `recipe_ingredient_list` VALUES (83, 7, '芹菜叶', '2021-09-12 02:55:39', '2021-09-12 02:55:39');
INSERT INTO `recipe_ingredient_list` VALUES (84, 7, '芥兰', '2021-09-12 02:55:49', '2021-09-12 02:55:49');
INSERT INTO `recipe_ingredient_list` VALUES (85, 7, '橄榄菜', '2021-09-12 02:55:58', '2021-09-12 02:55:58');
INSERT INTO `recipe_ingredient_list` VALUES (86, 7, '油麦菜', '2021-09-12 02:56:09', '2021-09-12 02:56:09');
INSERT INTO `recipe_ingredient_list` VALUES (87, 7, '芥蓝', '2021-09-12 02:56:24', '2021-09-12 02:56:24');
INSERT INTO `recipe_ingredient_list` VALUES (88, 7, '霸王花', '2021-09-12 02:56:32', '2021-09-12 02:56:32');
INSERT INTO `recipe_ingredient_list` VALUES (89, 7, '生菜', '2021-09-12 02:56:41', '2021-09-12 02:56:41');
INSERT INTO `recipe_ingredient_list` VALUES (90, 7, '马兰头', '2021-09-12 02:56:49', '2021-09-12 02:56:49');
INSERT INTO `recipe_ingredient_list` VALUES (91, 7, '刺老芽', '2021-09-12 02:56:58', '2021-09-12 02:56:58');
INSERT INTO `recipe_ingredient_list` VALUES (92, 7, '菊花脑', '2021-09-12 02:57:05', '2021-09-12 02:57:05');
INSERT INTO `recipe_ingredient_list` VALUES (93, 7, '藜蒿', '2021-09-12 02:57:17', '2021-09-12 02:57:17');
INSERT INTO `recipe_ingredient_list` VALUES (94, 7, '牛心菜', '2021-09-12 02:57:25', '2021-09-12 02:57:25');
INSERT INTO `recipe_ingredient_list` VALUES (95, 7, '槐米', '2021-09-12 02:57:35', '2021-09-12 02:57:35');
INSERT INTO `recipe_ingredient_list` VALUES (96, 8, '土豆', '2021-09-12 02:57:46', '2021-09-12 02:57:46');
INSERT INTO `recipe_ingredient_list` VALUES (97, 8, '胡萝卜', '2021-09-12 02:57:59', '2021-09-12 02:57:59');
INSERT INTO `recipe_ingredient_list` VALUES (98, 8, '魔芋', '2021-09-12 02:58:08', '2021-09-12 02:58:08');
INSERT INTO `recipe_ingredient_list` VALUES (99, 8, '牛蒡', '2021-09-12 02:58:18', '2021-09-12 02:58:18');
INSERT INTO `recipe_ingredient_list` VALUES (100, 8, '青萝卜', '2021-09-12 02:58:26', '2021-09-12 02:58:26');
INSERT INTO `recipe_ingredient_list` VALUES (101, 8, '菱角', '2021-09-12 02:58:38', '2021-09-12 02:58:38');
INSERT INTO `recipe_ingredient_list` VALUES (102, 8, '心里美萝卜', '2021-09-12 02:58:47', '2021-09-12 02:58:47');
INSERT INTO `recipe_ingredient_list` VALUES (103, 8, '野蒜', '2021-09-12 02:59:02', '2021-09-12 02:59:02');
INSERT INTO `recipe_ingredient_list` VALUES (104, 8, '苤蓝', '2021-09-12 02:59:11', '2021-09-12 02:59:11');
INSERT INTO `recipe_ingredient_list` VALUES (105, 8, '红薯', '2021-09-12 02:59:18', '2021-09-12 02:59:18');
INSERT INTO `recipe_ingredient_list` VALUES (106, 8, '白萝卜', '2021-09-12 02:59:25', '2021-09-12 02:59:25');
INSERT INTO `recipe_ingredient_list` VALUES (107, 8, '山药', '2021-09-12 02:59:35', '2021-09-12 02:59:35');
INSERT INTO `recipe_ingredient_list` VALUES (108, 8, '荸荠', '2021-09-12 02:59:46', '2021-09-12 02:59:46');
INSERT INTO `recipe_ingredient_list` VALUES (109, 8, '春笋', '2021-09-12 03:03:14', '2021-09-12 03:03:14');
INSERT INTO `recipe_ingredient_list` VALUES (110, 8, '慈菇', '2021-09-12 03:03:42', '2021-09-12 03:03:42');
INSERT INTO `recipe_ingredient_list` VALUES (111, 8, '甜菜根', '2021-09-12 03:03:57', '2021-09-12 03:03:57');
INSERT INTO `recipe_ingredient_list` VALUES (112, 8, '藠头', '2021-09-12 03:04:09', '2021-09-12 03:04:09');
INSERT INTO `recipe_ingredient_list` VALUES (113, 8, '芋头', '2021-09-12 03:04:18', '2021-09-12 03:04:18');
INSERT INTO `recipe_ingredient_list` VALUES (114, 8, '竹笋', '2021-09-12 03:04:26', '2021-09-12 03:04:26');
INSERT INTO `recipe_ingredient_list` VALUES (115, 8, '藕', '2021-09-12 03:04:57', '2021-09-12 03:04:57');
INSERT INTO `recipe_ingredient_list` VALUES (116, 8, '紫薯', '2021-09-12 03:05:05', '2021-09-12 03:05:05');
INSERT INTO `recipe_ingredient_list` VALUES (117, 8, '冬笋', '2021-09-12 03:05:11', '2021-09-12 03:05:11');
INSERT INTO `recipe_ingredient_list` VALUES (118, 8, '藕带', '2021-09-12 03:05:19', '2021-09-12 03:05:19');
INSERT INTO `recipe_ingredient_list` VALUES (119, 8, '红萝卜', '2021-09-12 03:05:29', '2021-09-12 03:05:29');
INSERT INTO `recipe_ingredient_list` VALUES (120, 8, '铁棍山药', '2021-09-12 03:05:38', '2021-09-12 03:05:38');
INSERT INTO `recipe_ingredient_list` VALUES (121, 9, '茄子', '2021-09-12 03:05:47', '2021-09-12 03:05:47');
INSERT INTO `recipe_ingredient_list` VALUES (122, 9, '黄瓜', '2021-09-12 03:05:56', '2021-09-12 03:05:56');
INSERT INTO `recipe_ingredient_list` VALUES (123, 9, '南瓜', '2021-09-12 03:06:06', '2021-09-12 03:06:06');
INSERT INTO `recipe_ingredient_list` VALUES (124, 9, '葫芦', '2021-09-12 03:06:15', '2021-09-12 03:06:15');
INSERT INTO `recipe_ingredient_list` VALUES (125, 9, '佛手瓜', '2021-09-12 03:06:27', '2021-09-12 03:06:27');
INSERT INTO `recipe_ingredient_list` VALUES (126, 9, '辣椒', '2021-09-12 03:06:34', '2021-09-12 03:06:34');
INSERT INTO `recipe_ingredient_list` VALUES (127, 9, '黄秋葵', '2021-09-12 03:06:43', '2021-09-12 03:06:43');
INSERT INTO `recipe_ingredient_list` VALUES (128, 9, '青椒', '2021-09-12 03:06:52', '2021-09-12 03:06:52');
INSERT INTO `recipe_ingredient_list` VALUES (129, 9, '冬瓜', '2021-09-12 03:06:59', '2021-09-12 03:06:59');
INSERT INTO `recipe_ingredient_list` VALUES (130, 9, '丝瓜', '2021-09-12 03:07:05', '2021-09-12 03:07:05');
INSERT INTO `recipe_ingredient_list` VALUES (131, 9, '红椒', '2021-09-12 03:07:13', '2021-09-12 03:07:13');
INSERT INTO `recipe_ingredient_list` VALUES (132, 9, '彩椒', '2021-09-12 03:07:34', '2021-09-12 03:07:34');
INSERT INTO `recipe_ingredient_list` VALUES (133, 9, '茄子（绿皮）', '2021-09-12 03:07:50', '2021-09-12 03:07:50');
INSERT INTO `recipe_ingredient_list` VALUES (134, 9, '方瓜', '2021-09-12 03:08:00', '2021-09-12 03:08:00');
INSERT INTO `recipe_ingredient_list` VALUES (135, 9, '西红柿', '2021-09-12 03:08:07', '2021-09-12 03:08:07');
INSERT INTO `recipe_ingredient_list` VALUES (136, 9, '苦瓜', '2021-09-12 03:08:14', '2021-09-12 03:08:14');
INSERT INTO `recipe_ingredient_list` VALUES (137, 9, '西葫芦', '2021-09-12 03:08:23', '2021-09-12 03:08:23');
INSERT INTO `recipe_ingredient_list` VALUES (138, 9, '瓠瓜', '2021-09-12 03:08:36', '2021-09-12 03:08:36');
INSERT INTO `recipe_ingredient_list` VALUES (139, 9, '茄子（圆）', '2021-09-12 03:08:45', '2021-09-12 03:08:45');
INSERT INTO `recipe_ingredient_list` VALUES (140, 9, '笋瓜', '2021-09-12 03:08:54', '2021-09-12 03:08:54');
INSERT INTO `recipe_ingredient_list` VALUES (141, 9, '节瓜', '2021-09-12 03:09:02', '2021-09-12 03:09:02');
INSERT INTO `recipe_ingredient_list` VALUES (142, 10, '香菇', '2021-09-12 03:09:11', '2021-09-12 03:09:11');
INSERT INTO `recipe_ingredient_list` VALUES (143, 10, '平菇', '2021-09-12 03:09:22', '2021-09-12 03:09:22');
INSERT INTO `recipe_ingredient_list` VALUES (144, 10, '茶树菇', '2021-09-12 03:09:32', '2021-09-12 03:09:59');
INSERT INTO `recipe_ingredient_list` VALUES (145, 10, '猴头菇', '2021-09-12 03:09:40', '2021-09-12 03:09:54');
INSERT INTO `recipe_ingredient_list` VALUES (146, 10, '蘑菇', '2021-09-12 03:09:48', '2021-09-12 03:09:48');
INSERT INTO `recipe_ingredient_list` VALUES (147, 10, '雪莲菌', '2021-09-12 03:10:11', '2021-09-12 03:10:11');
INSERT INTO `recipe_ingredient_list` VALUES (148, 10, '木耳（水发）', '2021-09-12 03:10:21', '2021-09-12 03:10:21');
INSERT INTO `recipe_ingredient_list` VALUES (149, 10, '鸡油菌', '2021-09-12 03:10:31', '2021-09-12 03:10:31');
INSERT INTO `recipe_ingredient_list` VALUES (150, 10, '地衣（水浸）', '2021-09-12 03:10:40', '2021-09-12 03:10:40');
INSERT INTO `recipe_ingredient_list` VALUES (151, 10, '虫草花', '2021-09-12 03:10:50', '2021-09-12 03:10:50');
INSERT INTO `recipe_ingredient_list` VALUES (152, 10, '金针菇', '2021-09-12 03:10:59', '2021-09-12 03:10:59');
INSERT INTO `recipe_ingredient_list` VALUES (153, 10, '草菇', '2021-09-12 03:11:07', '2021-09-12 03:11:07');
INSERT INTO `recipe_ingredient_list` VALUES (154, 10, '木耳', '2021-09-12 03:11:12', '2021-09-12 03:11:12');
INSERT INTO `recipe_ingredient_list` VALUES (155, 10, '白蘑菇', '2021-09-12 03:11:20', '2021-09-12 03:11:20');
INSERT INTO `recipe_ingredient_list` VALUES (156, 10, '竹笋', '2021-09-12 03:11:29', '2021-09-12 03:11:29');
INSERT INTO `recipe_ingredient_list` VALUES (157, 10, '羊肚菌', '2021-09-12 03:11:38', '2021-09-12 03:11:38');
INSERT INTO `recipe_ingredient_list` VALUES (158, 10, '榛蘑', '2021-09-12 03:11:47', '2021-09-12 03:11:47');
INSERT INTO `recipe_ingredient_list` VALUES (159, 10, '乳牛肝菌（干）', '2021-09-12 03:11:56', '2021-09-12 03:11:56');
INSERT INTO `recipe_ingredient_list` VALUES (160, 10, '红菌菇', '2021-09-12 03:12:13', '2021-09-12 03:12:13');
INSERT INTO `recipe_ingredient_list` VALUES (161, 10, '杏鲍菇', '2021-09-12 03:12:21', '2021-09-12 03:12:21');
INSERT INTO `recipe_ingredient_list` VALUES (162, 10, '口蘑', '2021-09-12 03:12:32', '2021-09-12 03:12:32');
INSERT INTO `recipe_ingredient_list` VALUES (163, 10, '银耳', '2021-09-12 03:12:41', '2021-09-12 03:12:41');
INSERT INTO `recipe_ingredient_list` VALUES (164, 10, '蟹味菇', '2021-09-12 03:12:53', '2021-09-12 03:12:53');
INSERT INTO `recipe_ingredient_list` VALUES (165, 10, '鸡腿菇', '2021-09-12 03:13:00', '2021-09-12 03:13:00');
INSERT INTO `recipe_ingredient_list` VALUES (166, 10, '元蘑', '2021-09-12 03:13:11', '2021-09-12 03:13:11');
INSERT INTO `recipe_ingredient_list` VALUES (167, 10, '海鲜菇', '2021-09-12 03:13:19', '2021-09-12 03:13:19');
INSERT INTO `recipe_ingredient_list` VALUES (168, 10, '干香菇', '2021-09-12 03:13:26', '2021-09-12 03:13:26');
INSERT INTO `recipe_ingredient_list` VALUES (169, 10, '松蘑', '2021-09-12 03:13:35', '2021-09-12 03:13:35');
INSERT INTO `recipe_ingredient_list` VALUES (170, 11, '洋葱', '2021-09-12 03:14:05', '2021-09-12 03:14:05');
INSERT INTO `recipe_ingredient_list` VALUES (171, 11, '韭黄', '2021-09-12 03:14:14', '2021-09-12 03:14:14');
INSERT INTO `recipe_ingredient_list` VALUES (172, 11, '大蒜', '2021-09-12 03:14:21', '2021-09-12 03:14:21');
INSERT INTO `recipe_ingredient_list` VALUES (173, 11, '葱白', '2021-09-12 03:14:27', '2021-09-12 03:14:27');
INSERT INTO `recipe_ingredient_list` VALUES (174, 11, '韭菜', '2021-09-12 03:14:36', '2021-09-12 03:14:36');
INSERT INTO `recipe_ingredient_list` VALUES (175, 11, '大葱', '2021-09-12 03:14:49', '2021-09-12 03:14:49');
INSERT INTO `recipe_ingredient_list` VALUES (176, 11, '小葱', '2021-09-12 03:14:55', '2021-09-12 03:14:55');
INSERT INTO `recipe_ingredient_list` VALUES (177, 11, '青蒜', '2021-09-12 03:15:06', '2021-09-12 03:15:06');
INSERT INTO `recipe_ingredient_list` VALUES (178, 11, '蒜苔', '2021-09-12 03:15:24', '2021-09-12 03:15:24');
INSERT INTO `recipe_ingredient_list` VALUES (179, 11, '蒜', '2021-09-12 03:15:30', '2021-09-12 03:15:30');
INSERT INTO `recipe_ingredient_list` VALUES (180, 11, '蒜苗', '2021-09-12 03:15:40', '2021-09-12 03:15:40');
INSERT INTO `recipe_ingredient_list` VALUES (181, 12, '豆角', '2021-09-12 03:15:52', '2021-09-12 03:15:52');
INSERT INTO `recipe_ingredient_list` VALUES (182, 12, '绿豆芽', '2021-09-12 03:16:02', '2021-09-12 03:16:02');
INSERT INTO `recipe_ingredient_list` VALUES (183, 12, '扁豆', '2021-09-12 03:16:10', '2021-09-12 03:16:10');
INSERT INTO `recipe_ingredient_list` VALUES (184, 12, '刀豆', '2021-09-12 03:16:17', '2021-09-12 03:16:17');
INSERT INTO `recipe_ingredient_list` VALUES (185, 12, '芸豆', '2021-09-12 03:16:27', '2021-09-12 03:16:27');
INSERT INTO `recipe_ingredient_list` VALUES (186, 12, '山药豆', '2021-09-12 03:16:36', '2021-09-12 03:16:36');
INSERT INTO `recipe_ingredient_list` VALUES (187, 12, '四季豆', '2021-09-12 03:16:46', '2021-09-12 03:16:46');
INSERT INTO `recipe_ingredient_list` VALUES (188, 12, '黄豆芽', '2021-09-12 03:16:54', '2021-09-12 03:16:54');
INSERT INTO `recipe_ingredient_list` VALUES (189, 12, '豌豆苗', '2021-09-12 03:17:01', '2021-09-12 03:17:01');
INSERT INTO `recipe_ingredient_list` VALUES (190, 12, '蚕豆', '2021-09-12 03:17:22', '2021-09-12 03:17:22');
INSERT INTO `recipe_ingredient_list` VALUES (191, 12, '荷兰豆', '2021-09-12 03:17:30', '2021-09-12 03:17:30');
INSERT INTO `recipe_ingredient_list` VALUES (192, 12, '毛豆', '2021-09-12 03:17:41', '2021-09-12 03:17:41');
INSERT INTO `recipe_ingredient_list` VALUES (193, 12, '豇豆', '2021-09-12 03:17:50', '2021-09-12 03:17:50');
INSERT INTO `recipe_ingredient_list` VALUES (194, 12, '豆荚', '2021-09-12 03:17:59', '2021-09-12 03:17:59');
INSERT INTO `recipe_ingredient_list` VALUES (195, 12, '鲜豌豆', '2021-09-12 03:19:23', '2021-09-12 03:19:23');
INSERT INTO `recipe_ingredient_list` VALUES (196, 13, '猪小排', '2021-09-12 03:19:35', '2021-09-12 03:19:35');
INSERT INTO `recipe_ingredient_list` VALUES (197, 13, '五花肉', '2021-09-12 03:19:43', '2021-09-12 03:19:43');
INSERT INTO `recipe_ingredient_list` VALUES (198, 13, '猪血', '2021-09-12 03:19:56', '2021-09-12 03:19:56');
INSERT INTO `recipe_ingredient_list` VALUES (199, 13, '猪肘', '2021-09-12 03:20:06', '2021-09-12 03:20:06');
INSERT INTO `recipe_ingredient_list` VALUES (200, 13, '猪肺', '2021-09-12 03:20:18', '2021-09-12 03:20:18');
INSERT INTO `recipe_ingredient_list` VALUES (201, 13, '排骨', '2021-09-12 03:20:25', '2021-09-12 03:20:25');
INSERT INTO `recipe_ingredient_list` VALUES (202, 13, '猪排', '2021-09-12 03:20:32', '2021-09-12 03:20:32');
INSERT INTO `recipe_ingredient_list` VALUES (203, 13, '猪肉', '2021-09-12 03:20:40', '2021-09-12 03:20:40');
INSERT INTO `recipe_ingredient_list` VALUES (204, 13, '猪肝', '2021-09-12 03:20:48', '2021-09-12 03:20:48');
INSERT INTO `recipe_ingredient_list` VALUES (205, 13, '猪腰', '2021-09-12 03:20:56', '2021-09-12 03:20:56');
INSERT INTO `recipe_ingredient_list` VALUES (206, 13, '猪耳朵', '2021-09-12 03:21:06', '2021-09-12 03:21:06');
INSERT INTO `recipe_ingredient_list` VALUES (207, 13, '猪大肠', '2021-09-12 03:21:13', '2021-09-12 03:21:13');
INSERT INTO `recipe_ingredient_list` VALUES (208, 13, '猪里脊肉', '2021-09-12 03:21:24', '2021-09-12 03:21:24');
INSERT INTO `recipe_ingredient_list` VALUES (209, 13, '猪舌头', '2021-09-12 03:21:33', '2021-09-12 03:21:33');
INSERT INTO `recipe_ingredient_list` VALUES (210, 13, '猪蹄', '2021-09-12 03:21:40', '2021-09-12 03:21:40');
INSERT INTO `recipe_ingredient_list` VALUES (211, 13, '猪肚', '2021-09-12 03:21:47', '2021-09-12 03:21:47');
INSERT INTO `recipe_ingredient_list` VALUES (212, 13, '猪皮', '2021-09-12 03:21:59', '2021-09-12 03:21:59');
INSERT INTO `recipe_ingredient_list` VALUES (213, 13, '猪心', '2021-09-12 03:22:07', '2021-09-12 03:22:07');
INSERT INTO `recipe_ingredient_list` VALUES (214, 13, '猪大骨头', '2021-09-12 03:22:19', '2021-09-12 03:22:19');
INSERT INTO `recipe_ingredient_list` VALUES (215, 13, '猪脑', '2021-09-12 03:22:26', '2021-09-12 03:22:26');
INSERT INTO `recipe_ingredient_list` VALUES (216, 14, '牛肉', '2021-09-12 03:22:36', '2021-09-12 03:22:36');
INSERT INTO `recipe_ingredient_list` VALUES (217, 14, '牛肚', '2021-09-12 03:22:44', '2021-09-12 03:22:44');
INSERT INTO `recipe_ingredient_list` VALUES (218, 14, '牛筋', '2021-09-12 03:22:54', '2021-09-12 03:22:54');
INSERT INTO `recipe_ingredient_list` VALUES (219, 14, '牛仔骨', '2021-09-12 03:23:01', '2021-09-12 03:23:01');
INSERT INTO `recipe_ingredient_list` VALUES (220, 14, '牛肾', '2021-09-12 03:23:20', '2021-09-12 03:23:20');
INSERT INTO `recipe_ingredient_list` VALUES (221, 14, '牛排', '2021-09-12 03:23:30', '2021-09-12 03:23:30');
INSERT INTO `recipe_ingredient_list` VALUES (222, 14, '牛尾', '2021-09-12 03:23:38', '2021-09-12 03:23:38');
INSERT INTO `recipe_ingredient_list` VALUES (223, 14, '牛骨', '2021-09-12 03:23:49', '2021-09-12 03:23:49');
INSERT INTO `recipe_ingredient_list` VALUES (224, 14, '牛腩', '2021-09-12 03:23:56', '2021-09-12 03:23:56');
INSERT INTO `recipe_ingredient_list` VALUES (225, 14, '牛鞭', '2021-09-12 03:24:05', '2021-09-12 03:24:05');
INSERT INTO `recipe_ingredient_list` VALUES (226, 14, '肥牛', '2021-09-12 03:24:11', '2021-09-12 03:24:11');
INSERT INTO `recipe_ingredient_list` VALUES (227, 14, '牛柳', '2021-09-12 03:24:18', '2021-09-12 03:24:18');
INSERT INTO `recipe_ingredient_list` VALUES (228, 14, '牛蹄筋', '2021-09-12 03:24:27', '2021-09-12 03:24:27');
INSERT INTO `recipe_ingredient_list` VALUES (229, 14, '牛肺', '2021-09-12 03:24:37', '2021-09-12 03:24:37');
INSERT INTO `recipe_ingredient_list` VALUES (230, 15, '羊肉', '2021-09-12 03:24:47', '2021-09-12 03:24:47');
INSERT INTO `recipe_ingredient_list` VALUES (231, 15, '羊蝎子', '2021-09-12 03:24:57', '2021-09-12 03:24:57');
INSERT INTO `recipe_ingredient_list` VALUES (232, 15, '羊肾', '2021-09-12 03:25:14', '2021-09-12 03:25:14');
INSERT INTO `recipe_ingredient_list` VALUES (233, 15, '羊排', '2021-09-12 03:25:22', '2021-09-12 03:25:22');
INSERT INTO `recipe_ingredient_list` VALUES (234, 15, '羊肝', '2021-09-12 03:25:35', '2021-09-12 03:25:35');
INSERT INTO `recipe_ingredient_list` VALUES (235, 15, '羊血', '2021-09-12 03:25:45', '2021-09-12 03:25:45');
INSERT INTO `recipe_ingredient_list` VALUES (236, 15, '羊腿', '2021-09-12 03:25:53', '2021-09-12 03:25:53');
INSERT INTO `recipe_ingredient_list` VALUES (237, 15, '羊肚', '2021-09-12 03:26:03', '2021-09-12 03:26:03');
INSERT INTO `recipe_ingredient_list` VALUES (238, 15, '羊骨', '2021-09-12 03:26:11', '2021-09-12 03:26:11');
INSERT INTO `recipe_ingredient_list` VALUES (239, 16, '鸡翅', '2021-09-12 03:26:31', '2021-09-12 03:26:31');
INSERT INTO `recipe_ingredient_list` VALUES (240, 16, '鸡爪', '2021-09-12 03:26:41', '2021-09-12 03:27:03');
INSERT INTO `recipe_ingredient_list` VALUES (241, 16, '鸡心', '2021-09-12 03:27:12', '2021-09-12 03:27:12');
INSERT INTO `recipe_ingredient_list` VALUES (242, 16, '童子鸡', '2021-09-12 03:27:19', '2021-09-12 03:27:19');
INSERT INTO `recipe_ingredient_list` VALUES (243, 16, '柴鸡', '2021-09-12 03:27:41', '2021-09-12 03:27:41');
INSERT INTO `recipe_ingredient_list` VALUES (244, 16, '鸡腿', '2021-09-12 03:27:48', '2021-09-12 03:27:48');
INSERT INTO `recipe_ingredient_list` VALUES (245, 16, '鸡胗', '2021-09-12 03:27:57', '2021-09-12 03:27:57');
INSERT INTO `recipe_ingredient_list` VALUES (246, 16, '鸡肝', '2021-09-12 03:28:04', '2021-09-12 03:28:04');
INSERT INTO `recipe_ingredient_list` VALUES (247, 16, '乌骨鸡', '2021-09-12 03:28:11', '2021-09-12 03:28:11');
INSERT INTO `recipe_ingredient_list` VALUES (248, 16, '鸡血', '2021-09-12 03:28:17', '2021-09-12 03:28:17');
INSERT INTO `recipe_ingredient_list` VALUES (249, 16, '鸡肉', '2021-09-12 03:28:25', '2021-09-12 03:28:25');
INSERT INTO `recipe_ingredient_list` VALUES (250, 16, '鸡翅根', '2021-09-12 03:28:34', '2021-09-12 03:28:34');
INSERT INTO `recipe_ingredient_list` VALUES (251, 16, '鸡脖', '2021-09-12 03:28:43', '2021-09-12 03:28:43');
INSERT INTO `recipe_ingredient_list` VALUES (252, 16, '三黄鸡', '2021-09-12 03:28:53', '2021-09-12 03:28:53');
INSERT INTO `recipe_ingredient_list` VALUES (253, 16, '鸡翅中', '2021-09-12 03:29:01', '2021-09-12 03:29:01');
INSERT INTO `recipe_ingredient_list` VALUES (254, 17, '鸭肉', '2021-09-12 03:29:09', '2021-09-12 03:29:09');
INSERT INTO `recipe_ingredient_list` VALUES (255, 17, '鸭胗', '2021-09-12 03:29:17', '2021-09-12 03:29:17');
INSERT INTO `recipe_ingredient_list` VALUES (256, 17, '鸭掌', '2021-09-12 03:29:30', '2021-09-12 03:29:30');
INSERT INTO `recipe_ingredient_list` VALUES (257, 17, '鸭肝', '2021-09-12 03:29:39', '2021-09-12 03:29:39');
INSERT INTO `recipe_ingredient_list` VALUES (258, 17, '鸭腿', '2021-09-12 03:29:46', '2021-09-12 03:29:46');
INSERT INTO `recipe_ingredient_list` VALUES (259, 17, '鸭翅', '2021-09-12 03:29:53', '2021-09-12 03:29:53');
INSERT INTO `recipe_ingredient_list` VALUES (260, 17, '鸭头', '2021-09-12 03:30:01', '2021-09-12 03:30:01');
INSERT INTO `recipe_ingredient_list` VALUES (261, 17, '鸭血', '2021-09-12 03:30:10', '2021-09-12 03:30:10');
INSERT INTO `recipe_ingredient_list` VALUES (262, 17, '鸭舌', '2021-09-12 03:30:18', '2021-09-12 03:30:18');
INSERT INTO `recipe_ingredient_list` VALUES (263, 17, '鸭肠', '2021-09-12 03:30:28', '2021-09-12 03:30:28');
INSERT INTO `recipe_ingredient_list` VALUES (264, 18, '腊肉', '2021-09-12 03:30:37', '2021-09-12 03:30:37');
INSERT INTO `recipe_ingredient_list` VALUES (265, 18, '咸肉', '2021-09-12 03:30:46', '2021-09-12 03:30:46');
INSERT INTO `recipe_ingredient_list` VALUES (266, 18, '午餐肉', '2021-09-12 03:30:55', '2021-09-12 03:30:55');
INSERT INTO `recipe_ingredient_list` VALUES (267, 18, '腊鱼', '2021-09-12 03:31:06', '2021-09-12 03:31:06');
INSERT INTO `recipe_ingredient_list` VALUES (268, 18, '火腿', '2021-09-12 03:31:14', '2021-09-12 03:31:14');
INSERT INTO `recipe_ingredient_list` VALUES (269, 18, '肉松', '2021-09-12 03:31:20', '2021-09-12 03:31:20');
INSERT INTO `recipe_ingredient_list` VALUES (270, 18, '熏肉', '2021-09-12 03:31:33', '2021-09-12 03:31:33');
INSERT INTO `recipe_ingredient_list` VALUES (271, 18, '熏鱼', '2021-09-12 03:31:41', '2021-09-12 03:31:41');
INSERT INTO `recipe_ingredient_list` VALUES (272, 18, '香肠', '2021-09-12 03:31:51', '2021-09-12 03:31:51');
INSERT INTO `recipe_ingredient_list` VALUES (273, 18, '培根', '2021-09-12 03:32:02', '2021-09-12 03:32:02');
INSERT INTO `recipe_ingredient_list` VALUES (274, 19, '鹌鹑', '2021-09-12 03:32:18', '2021-09-12 03:32:18');
INSERT INTO `recipe_ingredient_list` VALUES (275, 19, '牛蛙', '2021-09-12 03:32:25', '2021-09-12 03:32:25');
INSERT INTO `recipe_ingredient_list` VALUES (276, 19, '驴肉', '2021-09-12 03:32:35', '2021-09-12 03:32:35');
INSERT INTO `recipe_ingredient_list` VALUES (277, 19, '鹧鸪', '2021-09-12 03:32:45', '2021-09-12 03:32:45');
INSERT INTO `recipe_ingredient_list` VALUES (278, 19, '乳鸽', '2021-09-12 03:32:53', '2021-09-12 03:32:53');
INSERT INTO `recipe_ingredient_list` VALUES (279, 19, '鸽子', '2021-09-12 03:33:01', '2021-09-12 03:33:01');
INSERT INTO `recipe_ingredient_list` VALUES (280, 19, '兔肉', '2021-09-12 03:33:10', '2021-09-12 03:33:10');
INSERT INTO `recipe_ingredient_list` VALUES (281, 19, '鹅肉', '2021-09-12 03:33:17', '2021-09-12 03:33:17');
INSERT INTO `recipe_ingredient_list` VALUES (282, 19, '蚕蛹', '2021-09-12 03:33:36', '2021-09-12 03:33:36');
INSERT INTO `recipe_ingredient_list` VALUES (283, 19, '鸽肉', '2021-09-12 03:33:46', '2021-09-12 03:33:46');
INSERT INTO `recipe_ingredient_list` VALUES (284, 19, '火鸡', '2021-09-12 03:33:54', '2021-09-12 03:33:54');
INSERT INTO `recipe_ingredient_list` VALUES (285, 19, '鹿肉（梅花鹿）', '2021-09-12 03:34:03', '2021-09-12 03:34:03');
INSERT INTO `recipe_ingredient_list` VALUES (286, 19, '雪蛤', '2021-09-12 03:34:10', '2021-09-12 03:34:10');
INSERT INTO `recipe_ingredient_list` VALUES (287, 19, '鹅肝', '2021-09-12 03:34:18', '2021-09-12 03:34:18');
INSERT INTO `recipe_ingredient_list` VALUES (288, 20, '草鱼', '2021-09-12 03:34:29', '2021-09-12 03:34:29');
INSERT INTO `recipe_ingredient_list` VALUES (289, 20, '鲢鱼', '2021-09-12 03:34:39', '2021-09-12 03:34:39');
INSERT INTO `recipe_ingredient_list` VALUES (290, 20, '银鱼', '2021-09-12 03:34:48', '2021-09-12 03:34:48');
INSERT INTO `recipe_ingredient_list` VALUES (291, 20, '鳊鱼', '2021-09-12 03:34:56', '2021-09-12 03:34:56');
INSERT INTO `recipe_ingredient_list` VALUES (292, 20, '鮰鱼', '2021-09-12 03:35:04', '2021-09-12 03:35:04');
INSERT INTO `recipe_ingredient_list` VALUES (293, 20, '鲤鱼', '2021-09-12 03:35:12', '2021-09-12 03:35:12');
INSERT INTO `recipe_ingredient_list` VALUES (294, 20, '青鱼', '2021-09-12 03:35:21', '2021-09-12 03:35:21');
INSERT INTO `recipe_ingredient_list` VALUES (295, 20, '罗非鱼', '2021-09-12 03:35:30', '2021-09-12 03:35:30');
INSERT INTO `recipe_ingredient_list` VALUES (296, 20, '桂鱼', '2021-09-12 03:35:37', '2021-09-12 03:35:37');
INSERT INTO `recipe_ingredient_list` VALUES (297, 20, '鲫鱼', '2021-09-12 03:35:49', '2021-09-12 03:35:49');
INSERT INTO `recipe_ingredient_list` VALUES (298, 20, '鲶鱼', '2021-09-12 03:35:57', '2021-09-12 03:35:57');
INSERT INTO `recipe_ingredient_list` VALUES (299, 20, '武昌鱼', '2021-09-12 03:36:08', '2021-09-12 03:36:08');
INSERT INTO `recipe_ingredient_list` VALUES (300, 20, '泥鳅', '2021-09-12 03:36:17', '2021-09-12 03:36:17');
INSERT INTO `recipe_ingredient_list` VALUES (301, 21, '带鱼', '2021-09-12 03:36:27', '2021-09-12 03:36:27');
INSERT INTO `recipe_ingredient_list` VALUES (302, 21, '鲅鱼', '2021-09-12 03:36:38', '2021-09-12 03:36:38');
INSERT INTO `recipe_ingredient_list` VALUES (303, 21, '鳗鱼', '2021-09-12 03:36:46', '2021-09-12 03:36:46');
INSERT INTO `recipe_ingredient_list` VALUES (304, 21, '梭鱼', '2021-09-12 03:36:56', '2021-09-12 03:36:56');
INSERT INTO `recipe_ingredient_list` VALUES (305, 21, '沙丁鱼', '2021-09-12 03:37:05', '2021-09-12 03:37:05');
INSERT INTO `recipe_ingredient_list` VALUES (306, 21, '石斑鱼', '2021-09-12 03:37:12', '2021-09-12 03:37:12');
INSERT INTO `recipe_ingredient_list` VALUES (307, 21, '老板鱼', '2021-09-12 03:37:26', '2021-09-12 03:37:26');
INSERT INTO `recipe_ingredient_list` VALUES (308, 21, '马面鱼', '2021-09-12 03:37:35', '2021-09-12 03:37:35');
INSERT INTO `recipe_ingredient_list` VALUES (309, 21, '鲈鱼', '2021-09-12 03:37:44', '2021-09-12 03:37:44');
INSERT INTO `recipe_ingredient_list` VALUES (310, 21, '金枪鱼', '2021-09-12 03:37:57', '2021-09-12 03:37:57');
INSERT INTO `recipe_ingredient_list` VALUES (311, 21, '三文鱼', '2021-09-12 03:38:05', '2021-09-12 03:38:05');
INSERT INTO `recipe_ingredient_list` VALUES (312, 21, '秋刀鱼', '2021-09-12 03:38:12', '2021-09-12 03:38:12');
INSERT INTO `recipe_ingredient_list` VALUES (313, 21, '多春鱼', '2021-09-12 03:38:23', '2021-09-12 03:38:23');
INSERT INTO `recipe_ingredient_list` VALUES (314, 21, '鲷鱼', '2021-09-12 03:38:34', '2021-09-12 03:38:34');
INSERT INTO `recipe_ingredient_list` VALUES (315, 21, '小黄花鱼', '2021-09-12 03:38:41', '2021-09-12 03:38:41');
INSERT INTO `recipe_ingredient_list` VALUES (316, 21, '鳕鱼', '2021-09-12 03:38:51', '2021-09-12 03:38:51');
INSERT INTO `recipe_ingredient_list` VALUES (317, 21, '鲳鱼', '2021-09-12 03:39:00', '2021-09-12 03:39:00');
INSERT INTO `recipe_ingredient_list` VALUES (318, 21, '龙利鱼', '2021-09-12 03:39:10', '2021-09-12 03:39:10');
INSERT INTO `recipe_ingredient_list` VALUES (319, 21, '比目鱼', '2021-09-12 03:39:18', '2021-09-12 03:39:18');
INSERT INTO `recipe_ingredient_list` VALUES (320, 21, '明太鱼', '2021-09-12 03:39:28', '2021-09-12 03:39:28');
INSERT INTO `recipe_ingredient_list` VALUES (321, 21, '沙尖鱼', '2021-09-12 03:39:37', '2021-09-12 03:39:37');
INSERT INTO `recipe_ingredient_list` VALUES (322, 21, '湟鱼', '2021-09-12 03:39:47', '2021-09-12 03:39:47');
INSERT INTO `recipe_ingredient_list` VALUES (323, 22, '鱼丸', '2021-09-12 03:40:00', '2021-09-12 03:40:00');
INSERT INTO `recipe_ingredient_list` VALUES (324, 22, '鱼籽', '2021-09-12 03:40:09', '2021-09-12 03:40:09');
INSERT INTO `recipe_ingredient_list` VALUES (325, 22, '鱼头', '2021-09-12 03:40:16', '2021-09-12 03:40:16');
INSERT INTO `recipe_ingredient_list` VALUES (326, 22, '花胶', '2021-09-12 03:40:27', '2021-09-12 03:40:27');
INSERT INTO `recipe_ingredient_list` VALUES (327, 22, '鱼干', '2021-09-12 03:40:37', '2021-09-12 03:40:37');
INSERT INTO `recipe_ingredient_list` VALUES (328, 23, '虾', '2021-09-12 03:40:43', '2021-09-12 03:40:43');
INSERT INTO `recipe_ingredient_list` VALUES (329, 23, '河虾', '2021-09-12 03:40:50', '2021-09-12 03:40:50');
INSERT INTO `recipe_ingredient_list` VALUES (330, 23, '皮皮虾', '2021-09-12 03:40:57', '2021-09-12 03:40:57');
INSERT INTO `recipe_ingredient_list` VALUES (331, 23, '虾仁', '2021-09-12 03:41:05', '2021-09-12 03:41:05');
INSERT INTO `recipe_ingredient_list` VALUES (332, 23, '虾米', '2021-09-12 03:41:11', '2021-09-12 03:41:11');
INSERT INTO `recipe_ingredient_list` VALUES (333, 23, '对虾', '2021-09-12 03:41:19', '2021-09-12 03:41:19');
INSERT INTO `recipe_ingredient_list` VALUES (334, 23, '海虾', '2021-09-12 03:41:32', '2021-09-12 03:41:32');
INSERT INTO `recipe_ingredient_list` VALUES (335, 23, '龙虾', '2021-09-12 03:41:39', '2021-09-12 03:41:39');
INSERT INTO `recipe_ingredient_list` VALUES (336, 23, '虾皮', '2021-09-12 03:41:46', '2021-09-12 03:41:46');
INSERT INTO `recipe_ingredient_list` VALUES (337, 23, '明虾', '2021-09-12 03:41:53', '2021-09-12 03:41:53');
INSERT INTO `recipe_ingredient_list` VALUES (338, 23, '基围虾', '2021-09-12 03:42:00', '2021-09-12 03:42:00');
INSERT INTO `recipe_ingredient_list` VALUES (339, 23, '北极虾', '2021-09-12 03:42:08', '2021-09-12 03:42:08');
INSERT INTO `recipe_ingredient_list` VALUES (340, 23, '海米', '2021-09-12 03:42:17', '2021-09-12 03:42:17');
INSERT INTO `recipe_ingredient_list` VALUES (341, 24, '螃蟹', '2021-09-12 03:42:25', '2021-09-12 03:42:25');
INSERT INTO `recipe_ingredient_list` VALUES (342, 24, '青蟹', '2021-09-12 03:42:34', '2021-09-12 03:42:34');
INSERT INTO `recipe_ingredient_list` VALUES (343, 24, '河蟹', '2021-09-12 03:42:42', '2021-09-12 03:42:42');
INSERT INTO `recipe_ingredient_list` VALUES (344, 24, '梭子蟹', '2021-09-12 03:42:49', '2021-09-12 03:42:49');
INSERT INTO `recipe_ingredient_list` VALUES (345, 24, '海蟹', '2021-09-12 03:42:58', '2021-09-12 03:42:58');
INSERT INTO `recipe_ingredient_list` VALUES (346, 24, '大闸蟹', '2021-09-12 03:43:05', '2021-09-12 03:43:05');
INSERT INTO `recipe_ingredient_list` VALUES (347, 25, '海带', '2021-09-12 03:43:17', '2021-09-12 03:43:17');
INSERT INTO `recipe_ingredient_list` VALUES (348, 25, '海肠', '2021-09-12 03:43:26', '2021-09-12 03:43:26');
INSERT INTO `recipe_ingredient_list` VALUES (349, 25, '发菜', '2021-09-12 03:43:34', '2021-09-12 03:43:34');
INSERT INTO `recipe_ingredient_list` VALUES (350, 25, '海藻', '2021-09-12 03:43:42', '2021-09-12 03:43:42');
INSERT INTO `recipe_ingredient_list` VALUES (351, 25, '苔菜', '2021-09-12 03:43:51', '2021-09-12 03:43:51');
INSERT INTO `recipe_ingredient_list` VALUES (352, 25, '紫菜', '2021-09-12 03:44:04', '2021-09-12 03:44:04');
INSERT INTO `recipe_ingredient_list` VALUES (353, 25, '裙带菜', '2021-09-12 03:44:14', '2021-09-12 03:44:14');
INSERT INTO `recipe_ingredient_list` VALUES (354, 26, '鲍鱼', '2021-09-12 03:44:23', '2021-09-12 03:44:23');
INSERT INTO `recipe_ingredient_list` VALUES (355, 26, '蛏子', '2021-09-12 03:44:37', '2021-09-12 03:44:37');
INSERT INTO `recipe_ingredient_list` VALUES (356, 26, '干贝', '2021-09-12 03:44:47', '2021-09-12 03:44:47');
INSERT INTO `recipe_ingredient_list` VALUES (357, 26, '贻贝', '2021-09-12 03:44:56', '2021-09-12 03:44:56');
INSERT INTO `recipe_ingredient_list` VALUES (358, 26, '北极贝', '2021-09-12 03:45:04', '2021-09-12 03:45:04');
INSERT INTO `recipe_ingredient_list` VALUES (359, 26, '生蚝', '2021-09-12 03:45:12', '2021-09-12 03:45:12');
INSERT INTO `recipe_ingredient_list` VALUES (360, 26, '蛤蜊', '2021-09-12 03:45:20', '2021-09-12 03:45:20');
INSERT INTO `recipe_ingredient_list` VALUES (361, 26, '海螺', '2021-09-12 03:45:30', '2021-09-12 03:45:30');
INSERT INTO `recipe_ingredient_list` VALUES (362, 26, '鲜贝', '2021-09-12 03:45:49', '2021-09-12 03:45:49');
INSERT INTO `recipe_ingredient_list` VALUES (363, 26, '青口', '2021-09-12 03:45:58', '2021-09-12 03:45:58');
INSERT INTO `recipe_ingredient_list` VALUES (364, 26, '牡蛎', '2021-09-12 03:46:12', '2021-09-12 03:46:12');
INSERT INTO `recipe_ingredient_list` VALUES (365, 26, '毛蛤蜊', '2021-09-12 03:46:20', '2021-09-12 03:46:20');
INSERT INTO `recipe_ingredient_list` VALUES (366, 26, '文蛤', '2021-09-12 03:46:29', '2021-09-12 03:46:29');
INSERT INTO `recipe_ingredient_list` VALUES (367, 26, '田螺', '2021-09-12 03:46:35', '2021-09-12 03:46:35');
INSERT INTO `recipe_ingredient_list` VALUES (368, 26, '扇贝', '2021-09-12 03:46:42', '2021-09-12 03:46:42');
INSERT INTO `recipe_ingredient_list` VALUES (369, 26, '河蚌', '2021-09-12 03:46:53', '2021-09-12 03:46:53');
INSERT INTO `recipe_ingredient_list` VALUES (370, 26, '花螺', '2021-09-12 03:47:02', '2021-09-12 03:47:02');
INSERT INTO `recipe_ingredient_list` VALUES (371, 26, '淡菜', '2021-09-12 03:47:11', '2021-09-12 03:47:11');
INSERT INTO `recipe_ingredient_list` VALUES (372, 27, '海参', '2021-09-12 03:47:19', '2021-09-12 03:47:19');
INSERT INTO `recipe_ingredient_list` VALUES (373, 27, '田鸡', '2021-09-12 03:47:28', '2021-09-12 03:47:28');
INSERT INTO `recipe_ingredient_list` VALUES (374, 27, '海蜇皮', '2021-09-12 03:47:37', '2021-09-12 03:47:37');
INSERT INTO `recipe_ingredient_list` VALUES (375, 27, '鱿鱼', '2021-09-12 03:47:44', '2021-09-12 03:47:44');
INSERT INTO `recipe_ingredient_list` VALUES (376, 27, '甲鱼', '2021-09-12 03:47:52', '2021-09-12 03:47:52');
INSERT INTO `recipe_ingredient_list` VALUES (377, 27, '墨鱼', '2021-09-12 03:48:00', '2021-09-12 03:48:00');
INSERT INTO `recipe_ingredient_list` VALUES (378, 27, '海胆', '2021-09-12 03:48:07', '2021-09-12 03:48:07');
INSERT INTO `recipe_ingredient_list` VALUES (379, 28, '鸡蛋', '2021-09-12 03:48:16', '2021-09-12 03:48:16');
INSERT INTO `recipe_ingredient_list` VALUES (380, 28, '咸鸭蛋', '2021-09-12 03:48:23', '2021-09-12 03:48:23');
INSERT INTO `recipe_ingredient_list` VALUES (381, 28, '鹅蛋', '2021-09-12 03:48:29', '2021-09-12 03:48:29');
INSERT INTO `recipe_ingredient_list` VALUES (382, 28, '鸭蛋', '2021-09-12 03:48:36', '2021-09-12 03:48:36');
INSERT INTO `recipe_ingredient_list` VALUES (383, 28, '鸽子蛋', '2021-09-12 03:48:44', '2021-09-12 03:48:44');
INSERT INTO `recipe_ingredient_list` VALUES (384, 28, '鹌鹑蛋', '2021-09-12 03:48:52', '2021-09-12 03:48:52');
INSERT INTO `recipe_ingredient_list` VALUES (385, 28, '松花蛋', '2021-09-12 03:48:59', '2021-09-12 03:48:59');
INSERT INTO `recipe_ingredient_list` VALUES (386, 29, '奶酪', '2021-09-12 03:49:10', '2021-09-12 03:49:10');
INSERT INTO `recipe_ingredient_list` VALUES (387, 29, '黄油', '2021-09-12 03:49:19', '2021-09-12 03:49:19');
INSERT INTO `recipe_ingredient_list` VALUES (388, 29, '奶油', '2021-09-12 03:49:26', '2021-09-12 03:49:26');
INSERT INTO `recipe_ingredient_list` VALUES (389, 30, '红豆', '2021-09-12 03:49:42', '2021-09-12 03:49:42');
INSERT INTO `recipe_ingredient_list` VALUES (390, 30, '黑豆', '2021-09-12 03:49:50', '2021-09-12 03:49:50');
INSERT INTO `recipe_ingredient_list` VALUES (391, 30, '绿豆', '2021-09-12 03:49:57', '2021-09-12 03:49:57');
INSERT INTO `recipe_ingredient_list` VALUES (392, 30, '蚕豆', '2021-09-12 03:50:04', '2021-09-12 03:50:04');
INSERT INTO `recipe_ingredient_list` VALUES (393, 30, '黄豆', '2021-09-12 03:50:11', '2021-09-12 03:50:11');
INSERT INTO `recipe_ingredient_list` VALUES (394, 30, '青豆', '2021-09-12 03:50:17', '2021-09-12 03:50:17');
INSERT INTO `recipe_ingredient_list` VALUES (395, 30, '豌豆', '2021-09-12 03:50:24', '2021-09-12 03:50:24');
INSERT INTO `recipe_ingredient_list` VALUES (396, 31, '豆腐', '2021-09-12 03:50:32', '2021-09-12 03:50:32');
INSERT INTO `recipe_ingredient_list` VALUES (397, 31, '豆腐干', '2021-09-12 03:50:43', '2021-09-12 03:50:43');
INSERT INTO `recipe_ingredient_list` VALUES (398, 31, '豆浆', '2021-09-12 03:50:53', '2021-09-12 03:50:53');
INSERT INTO `recipe_ingredient_list` VALUES (399, 31, '豆渣', '2021-09-12 03:51:01', '2021-09-12 03:51:01');
INSERT INTO `recipe_ingredient_list` VALUES (400, 31, '豆腐丝', '2021-09-12 03:51:09', '2021-09-12 03:51:09');
INSERT INTO `recipe_ingredient_list` VALUES (401, 31, '豆腐渣', '2021-09-12 03:51:19', '2021-09-12 03:51:19');
INSERT INTO `recipe_ingredient_list` VALUES (402, 31, '内脂豆腐', '2021-09-12 03:51:41', '2021-09-12 03:51:41');
INSERT INTO `recipe_ingredient_list` VALUES (403, 31, '千张', '2021-09-12 03:51:49', '2021-09-12 03:51:49');
INSERT INTO `recipe_ingredient_list` VALUES (404, 31, '豆腐皮', '2021-09-12 03:51:59', '2021-09-12 03:51:59');
INSERT INTO `recipe_ingredient_list` VALUES (405, 31, '油豆腐', '2021-09-12 03:52:09', '2021-09-12 03:52:09');
INSERT INTO `recipe_ingredient_list` VALUES (406, 31, '素鸡', '2021-09-12 03:52:20', '2021-09-12 03:52:20');
INSERT INTO `recipe_ingredient_list` VALUES (407, 31, '烤麸', '2021-09-12 03:52:29', '2021-09-12 03:52:29');
INSERT INTO `recipe_ingredient_list` VALUES (408, 31, '豆腐卷', '2021-09-12 03:52:42', '2021-09-12 03:52:42');
INSERT INTO `recipe_ingredient_list` VALUES (409, 31, '南豆腐', '2021-09-12 03:52:54', '2021-09-12 03:52:54');
INSERT INTO `recipe_ingredient_list` VALUES (410, 31, '腐竹', '2021-09-12 03:53:03', '2021-09-12 03:53:03');
INSERT INTO `recipe_ingredient_list` VALUES (411, 31, '豆豉', '2021-09-12 03:53:11', '2021-09-12 03:53:11');
INSERT INTO `recipe_ingredient_list` VALUES (412, 31, '冻豆腐', '2021-09-12 03:53:20', '2021-09-12 03:53:20');
INSERT INTO `recipe_ingredient_list` VALUES (413, 31, '红豆沙', '2021-09-12 03:53:32', '2021-09-12 03:53:32');
INSERT INTO `recipe_ingredient_list` VALUES (414, 31, '北豆腐', '2021-09-12 03:53:40', '2021-09-12 03:53:40');
INSERT INTO `recipe_ingredient_list` VALUES (415, 31, '鸡蛋豆腐', '2021-09-12 03:53:51', '2021-09-12 03:53:51');
INSERT INTO `recipe_ingredient_list` VALUES (416, 32, '柚子', '2021-09-12 03:54:03', '2021-09-12 03:54:03');
INSERT INTO `recipe_ingredient_list` VALUES (417, 32, '柿子', '2021-09-12 03:54:14', '2021-09-12 03:54:14');
INSERT INTO `recipe_ingredient_list` VALUES (418, 32, '橘子', '2021-09-12 03:54:21', '2021-09-12 03:54:21');
INSERT INTO `recipe_ingredient_list` VALUES (419, 32, '木瓜', '2021-09-12 03:54:31', '2021-09-12 03:54:31');
INSERT INTO `recipe_ingredient_list` VALUES (420, 32, '橙子', '2021-09-12 03:54:38', '2021-09-12 03:54:38');
INSERT INTO `recipe_ingredient_list` VALUES (421, 32, '枣', '2021-09-12 03:54:45', '2021-09-12 03:54:45');
INSERT INTO `recipe_ingredient_list` VALUES (422, 32, '草莓', '2021-09-12 03:54:52', '2021-09-12 03:54:52');
INSERT INTO `recipe_ingredient_list` VALUES (423, 32, '葡萄干', '2021-09-12 03:55:00', '2021-09-12 03:55:00');
INSERT INTO `recipe_ingredient_list` VALUES (424, 32, '椰汁', '2021-09-12 03:55:07', '2021-09-12 03:55:07');
INSERT INTO `recipe_ingredient_list` VALUES (425, 32, '百香果', '2021-09-12 03:55:18', '2021-09-12 03:55:18');
INSERT INTO `recipe_ingredient_list` VALUES (426, 32, '桑葚', '2021-09-12 03:55:26', '2021-09-12 03:55:26');
INSERT INTO `recipe_ingredient_list` VALUES (427, 32, '石榴', '2021-09-12 03:55:37', '2021-09-12 03:55:37');
INSERT INTO `recipe_ingredient_list` VALUES (428, 32, '西瓜皮', '2021-09-12 03:55:44', '2021-09-12 03:55:44');
INSERT INTO `recipe_ingredient_list` VALUES (429, 32, '杨梅', '2021-09-12 03:55:51', '2021-09-12 03:55:51');
INSERT INTO `recipe_ingredient_list` VALUES (430, 32, '哈密瓜', '2021-09-12 03:55:59', '2021-09-12 03:55:59');
INSERT INTO `recipe_ingredient_list` VALUES (431, 32, '冬枣', '2021-09-12 03:56:05', '2021-09-12 03:56:05');
INSERT INTO `recipe_ingredient_list` VALUES (432, 32, '樱桃西红柿', '2021-09-12 03:56:19', '2021-09-12 03:56:19');
INSERT INTO `recipe_ingredient_list` VALUES (433, 32, '雪莲果', '2021-09-12 03:56:29', '2021-09-12 03:56:29');
INSERT INTO `recipe_ingredient_list` VALUES (434, 32, '枇杷', '2021-09-12 03:56:38', '2021-09-12 03:56:38');
INSERT INTO `recipe_ingredient_list` VALUES (435, 32, '仙人掌果', '2021-09-12 03:56:48', '2021-09-12 03:56:48');
INSERT INTO `recipe_ingredient_list` VALUES (436, 32, '金丝小枣', '2021-09-12 03:56:59', '2021-09-12 03:56:59');
INSERT INTO `recipe_ingredient_list` VALUES (437, 32, '黄皮果', '2021-09-12 03:57:08', '2021-09-12 03:57:08');
INSERT INTO `recipe_ingredient_list` VALUES (438, 32, '黑加仑子', '2021-09-12 03:57:17', '2021-09-12 03:57:17');
INSERT INTO `recipe_ingredient_list` VALUES (439, 32, '猕猴桃', '2021-09-12 03:57:24', '2021-09-12 03:57:24');
INSERT INTO `recipe_ingredient_list` VALUES (440, 32, '甘蔗', '2021-09-12 03:57:46', '2021-09-12 03:57:46');
INSERT INTO `recipe_ingredient_list` VALUES (441, 32, '山楂', '2021-09-12 03:57:53', '2021-09-12 03:57:53');
INSERT INTO `recipe_ingredient_list` VALUES (442, 32, '苹果', '2021-09-12 03:58:01', '2021-09-12 03:58:01');
INSERT INTO `recipe_ingredient_list` VALUES (443, 32, '榴莲', '2021-09-12 03:58:21', '2021-09-12 03:58:21');
INSERT INTO `recipe_ingredient_list` VALUES (444, 32, '菠萝', '2021-09-12 03:58:29', '2021-09-12 03:58:29');
INSERT INTO `recipe_ingredient_list` VALUES (445, 32, '桂圆', '2021-09-12 03:58:38', '2021-09-12 03:58:38');
INSERT INTO `recipe_ingredient_list` VALUES (446, 32, '樱桃', '2021-09-12 03:58:51', '2021-09-12 03:58:51');
INSERT INTO `recipe_ingredient_list` VALUES (447, 32, '荔枝', '2021-09-12 03:59:01', '2021-09-12 03:59:01');
INSERT INTO `recipe_ingredient_list` VALUES (448, 32, '金桔', '2021-09-12 03:59:23', '2021-09-12 03:59:23');
INSERT INTO `recipe_ingredient_list` VALUES (449, 32, '杏', '2021-09-12 03:59:31', '2021-09-12 03:59:31');
INSERT INTO `recipe_ingredient_list` VALUES (450, 32, '椰子', '2021-09-12 03:59:38', '2021-09-12 03:59:38');
INSERT INTO `recipe_ingredient_list` VALUES (451, 32, '蔓越莓', '2021-09-12 03:59:47', '2021-09-12 03:59:47');
INSERT INTO `recipe_ingredient_list` VALUES (452, 32, '柑桔', '2021-09-12 03:59:54', '2021-09-12 03:59:54');
INSERT INTO `recipe_ingredient_list` VALUES (453, 32, '酸枣', '2021-09-12 04:00:04', '2021-09-12 04:00:04');
INSERT INTO `recipe_ingredient_list` VALUES (454, 32, '鸭梨', '2021-09-12 04:00:21', '2021-09-12 04:00:21');
INSERT INTO `recipe_ingredient_list` VALUES (455, 32, '覆盆子', '2021-09-12 04:00:30', '2021-09-12 04:00:30');
INSERT INTO `recipe_ingredient_list` VALUES (456, 32, '葡萄柚', '2021-09-12 04:00:43', '2021-09-12 04:00:43');
INSERT INTO `recipe_ingredient_list` VALUES (457, 32, '树莓', '2021-09-12 04:00:51', '2021-09-12 04:00:51');
INSERT INTO `recipe_ingredient_list` VALUES (458, 32, '香梨', '2021-09-12 04:01:00', '2021-09-12 04:01:00');
INSERT INTO `recipe_ingredient_list` VALUES (459, 32, '莲雾', '2021-09-12 04:01:08', '2021-09-12 04:01:08');
INSERT INTO `recipe_ingredient_list` VALUES (460, 32, '人参果', '2021-09-12 04:01:15', '2021-09-12 04:01:15');
INSERT INTO `recipe_ingredient_list` VALUES (461, 32, '梨', '2021-09-12 04:01:32', '2021-09-12 04:01:32');
INSERT INTO `recipe_ingredient_list` VALUES (462, 32, '火龙果', '2021-09-12 04:01:40', '2021-09-12 04:01:40');
INSERT INTO `recipe_ingredient_list` VALUES (463, 32, '香蕉', '2021-09-12 04:01:48', '2021-09-12 04:01:48');
INSERT INTO `recipe_ingredient_list` VALUES (464, 32, '葡萄', '2021-09-12 04:01:56', '2021-09-12 04:01:56');
INSERT INTO `recipe_ingredient_list` VALUES (465, 32, '芒果', '2021-09-12 04:02:02', '2021-09-12 04:02:02');
INSERT INTO `recipe_ingredient_list` VALUES (466, 32, '柠檬', '2021-09-12 04:02:10', '2021-09-12 04:02:10');
INSERT INTO `recipe_ingredient_list` VALUES (467, 32, '蓝莓', '2021-09-12 04:02:18', '2021-09-12 04:02:18');
INSERT INTO `recipe_ingredient_list` VALUES (468, 32, '西瓜', '2021-09-12 04:02:24', '2021-09-12 04:02:24');
INSERT INTO `recipe_ingredient_list` VALUES (469, 32, '桃', '2021-09-12 04:02:31', '2021-09-12 04:02:31');
INSERT INTO `recipe_ingredient_list` VALUES (470, 32, '牛油果', '2021-09-12 04:02:39', '2021-09-12 04:02:39');
INSERT INTO `recipe_ingredient_list` VALUES (471, 32, '李子', '2021-09-12 04:02:47', '2021-09-12 04:02:47');
INSERT INTO `recipe_ingredient_list` VALUES (472, 32, '无花果', '2021-09-12 04:02:54', '2021-09-12 04:02:54');
INSERT INTO `recipe_ingredient_list` VALUES (473, 32, '香瓜', '2021-09-12 04:03:02', '2021-09-12 04:03:02');
INSERT INTO `recipe_ingredient_list` VALUES (474, 32, '杨桃', '2021-09-12 04:03:12', '2021-09-12 04:03:12');
INSERT INTO `recipe_ingredient_list` VALUES (475, 32, '佛手柑', '2021-09-12 04:03:25', '2021-09-12 04:03:25');
INSERT INTO `recipe_ingredient_list` VALUES (476, 32, '槟榔', '2021-09-12 04:03:32', '2021-09-12 04:03:32');
INSERT INTO `recipe_ingredient_list` VALUES (477, 32, '山竹', '2021-09-12 04:03:40', '2021-09-12 04:03:40');
INSERT INTO `recipe_ingredient_list` VALUES (478, 32, '黑橄榄', '2021-09-12 04:03:48', '2021-09-12 04:03:48');
INSERT INTO `recipe_ingredient_list` VALUES (479, 32, '番石榴', '2021-09-12 04:04:07', '2021-09-12 04:04:07');
INSERT INTO `recipe_ingredient_list` VALUES (480, 32, '红毛丹', '2021-09-12 04:04:16', '2021-09-12 04:04:16');
INSERT INTO `recipe_ingredient_list` VALUES (481, 32, '车厘子', '2021-09-12 04:04:24', '2021-09-12 04:04:24');
INSERT INTO `recipe_ingredient_list` VALUES (482, 32, '提子', '2021-09-12 04:04:31', '2021-09-12 04:04:31');
INSERT INTO `recipe_ingredient_list` VALUES (483, 33, '花生', '2021-09-12 04:04:55', '2021-09-12 04:04:55');
INSERT INTO `recipe_ingredient_list` VALUES (484, 33, '核桃', '2021-09-12 04:05:04', '2021-09-12 04:05:04');
INSERT INTO `recipe_ingredient_list` VALUES (485, 33, '莲子', '2021-09-12 04:05:12', '2021-09-12 04:05:12');
INSERT INTO `recipe_ingredient_list` VALUES (486, 33, '海底椰', '2021-09-12 04:05:20', '2021-09-12 04:05:20');
INSERT INTO `recipe_ingredient_list` VALUES (487, 33, '开心果', '2021-09-12 04:05:26', '2021-09-12 04:05:26');
INSERT INTO `recipe_ingredient_list` VALUES (488, 33, '蜜枣', '2021-09-12 04:05:35', '2021-09-12 04:05:35');
INSERT INTO `recipe_ingredient_list` VALUES (489, 33, '山核桃（干）', '2021-09-12 04:05:44', '2021-09-12 04:05:44');
INSERT INTO `recipe_ingredient_list` VALUES (490, 33, '碧根果', '2021-09-12 04:05:58', '2021-09-12 04:05:58');
INSERT INTO `recipe_ingredient_list` VALUES (491, 33, '腰果', '2021-09-12 04:06:07', '2021-09-12 04:06:07');
INSERT INTO `recipe_ingredient_list` VALUES (492, 33, '芝麻', '2021-09-12 04:06:12', '2021-09-12 04:06:12');
INSERT INTO `recipe_ingredient_list` VALUES (493, 33, '榛子', '2021-09-12 04:06:21', '2021-09-12 04:06:21');
INSERT INTO `recipe_ingredient_list` VALUES (494, 33, '红枣干', '2021-09-12 04:06:29', '2021-09-12 04:06:29');
INSERT INTO `recipe_ingredient_list` VALUES (495, 33, '板栗', '2021-09-12 04:06:36', '2021-09-12 04:06:36');
INSERT INTO `recipe_ingredient_list` VALUES (496, 33, '阿胶枣', '2021-09-12 04:06:45', '2021-09-12 04:06:45');
INSERT INTO `recipe_ingredient_list` VALUES (497, 33, '柿饼', '2021-09-12 04:06:52', '2021-09-12 04:06:52');
INSERT INTO `recipe_ingredient_list` VALUES (498, 33, '亚麻籽', '2021-09-12 04:07:02', '2021-09-12 04:07:02');
INSERT INTO `recipe_ingredient_list` VALUES (499, 33, '松子', '2021-09-12 04:07:10', '2021-09-12 04:07:10');
INSERT INTO `recipe_ingredient_list` VALUES (500, 33, '杏仁（炒）', '2021-09-12 04:07:19', '2021-09-12 04:07:19');
INSERT INTO `recipe_ingredient_list` VALUES (501, 33, '夏威夷果', '2021-09-12 04:07:26', '2021-09-12 04:07:26');
INSERT INTO `recipe_ingredient_list` VALUES (502, 33, '南瓜子', '2021-09-12 04:07:37', '2021-09-12 04:07:37');
INSERT INTO `recipe_ingredient_list` VALUES (503, 33, '白果（干）', '2021-09-12 04:07:46', '2021-09-12 04:07:46');
INSERT INTO `recipe_ingredient_list` VALUES (504, 33, '桂圆肉', '2021-09-12 04:07:58', '2021-09-12 04:07:58');
INSERT INTO `recipe_ingredient_list` VALUES (505, 33, '葡萄干', '2021-09-12 04:08:07', '2021-09-12 04:08:07');
INSERT INTO `recipe_ingredient_list` VALUES (506, 3, '糯米', '2021-09-12 04:08:27', '2021-09-12 04:08:27');
INSERT INTO `recipe_ingredient_list` VALUES (507, 3, '黑米', '2021-09-12 04:08:37', '2021-09-12 04:08:37');
INSERT INTO `recipe_ingredient_list` VALUES (508, 3, '面粉', '2021-09-12 04:08:49', '2021-09-12 04:08:49');
INSERT INTO `recipe_ingredient_list` VALUES (509, 3, '芝麻', '2021-09-12 04:08:54', '2021-09-12 04:08:54');
INSERT INTO `recipe_ingredient_list` VALUES (510, 3, '麦芽', '2021-09-12 04:09:03', '2021-09-12 04:09:03');
INSERT INTO `recipe_ingredient_list` VALUES (511, 3, '糙米', '2021-09-12 04:09:11', '2021-09-12 04:09:11');
INSERT INTO `recipe_ingredient_list` VALUES (512, 3, '谷芽', '2021-09-12 04:09:19', '2021-09-12 04:09:19');
INSERT INTO `recipe_ingredient_list` VALUES (513, 3, '青稞', '2021-09-12 04:09:29', '2021-09-12 04:09:29');
INSERT INTO `recipe_ingredient_list` VALUES (514, 3, '红曲米', '2021-09-12 04:09:36', '2021-09-12 04:09:36');
INSERT INTO `recipe_ingredient_list` VALUES (515, 3, '大米', '2021-09-12 04:09:42', '2021-09-12 04:09:42');
INSERT INTO `recipe_ingredient_list` VALUES (516, 3, '红米', '2021-09-12 04:09:48', '2021-09-12 04:09:48');
INSERT INTO `recipe_ingredient_list` VALUES (517, 3, '低筋面粉', '2021-09-12 04:09:57', '2021-09-12 04:09:57');
INSERT INTO `recipe_ingredient_list` VALUES (518, 3, '薏米', '2021-09-12 04:10:06', '2021-09-12 04:10:06');
INSERT INTO `recipe_ingredient_list` VALUES (519, 3, '西米', '2021-09-12 04:10:13', '2021-09-12 04:10:13');
INSERT INTO `recipe_ingredient_list` VALUES (520, 3, '香米', '2021-09-12 04:10:21', '2021-09-12 04:10:21');
INSERT INTO `recipe_ingredient_list` VALUES (521, 3, '黄米', '2021-09-12 04:10:29', '2021-09-12 04:10:29');
INSERT INTO `recipe_ingredient_list` VALUES (522, 3, '鸭血糯', '2021-09-12 04:10:37', '2021-09-12 04:10:37');
INSERT INTO `recipe_ingredient_list` VALUES (523, 3, '小米', '2021-09-12 04:10:43', '2021-09-12 04:10:43');
INSERT INTO `recipe_ingredient_list` VALUES (524, 3, '紫米', '2021-09-12 04:10:50', '2021-09-12 04:10:50');
INSERT INTO `recipe_ingredient_list` VALUES (525, 3, '高筋面粉', '2021-09-12 04:10:58', '2021-09-12 04:10:58');
INSERT INTO `recipe_ingredient_list` VALUES (526, 3, '荞麦', '2021-09-12 04:11:06', '2021-09-12 04:11:06');
INSERT INTO `recipe_ingredient_list` VALUES (527, 3, '燕麦', '2021-09-12 04:11:11', '2021-09-12 04:11:11');
INSERT INTO `recipe_ingredient_list` VALUES (528, 3, '大麦', '2021-09-12 04:11:28', '2021-09-12 04:11:28');
INSERT INTO `recipe_ingredient_list` VALUES (529, 3, '苦荞麦粉', '2021-09-12 04:11:36', '2021-09-12 04:11:36');
INSERT INTO `recipe_ingredient_list` VALUES (530, 34, '燕窝', '2021-09-12 04:11:49', '2021-09-12 04:11:49');
INSERT INTO `recipe_ingredient_list` VALUES (531, 34, '何首乌', '2021-09-12 04:11:59', '2021-09-12 04:11:59');
INSERT INTO `recipe_ingredient_list` VALUES (532, 34, '葛根', '2021-09-12 04:12:08', '2021-09-12 04:12:08');
INSERT INTO `recipe_ingredient_list` VALUES (533, 34, '当归', '2021-09-12 04:12:16', '2021-09-12 04:12:16');
INSERT INTO `recipe_ingredient_list` VALUES (534, 34, '芡实', '2021-09-12 04:12:27', '2021-09-12 04:12:27');
INSERT INTO `recipe_ingredient_list` VALUES (535, 34, '茯苓', '2021-09-12 04:12:36', '2021-09-12 04:12:36');
INSERT INTO `recipe_ingredient_list` VALUES (536, 34, '板蓝根', '2021-09-12 04:12:45', '2021-09-12 04:12:45');
INSERT INTO `recipe_ingredient_list` VALUES (537, 34, '车前草', '2021-09-12 04:12:54', '2021-09-12 04:12:54');
INSERT INTO `recipe_ingredient_list` VALUES (538, 34, '山楂叶', '2021-09-12 04:13:02', '2021-09-12 04:13:02');
INSERT INTO `recipe_ingredient_list` VALUES (539, 34, '白术', '2021-09-12 04:13:10', '2021-09-12 04:13:10');
INSERT INTO `recipe_ingredient_list` VALUES (540, 34, '甘草', '2021-09-12 04:13:17', '2021-09-12 04:13:17');
INSERT INTO `recipe_ingredient_list` VALUES (541, 34, '荷叶', '2021-09-12 04:13:25', '2021-09-12 04:13:25');
INSERT INTO `recipe_ingredient_list` VALUES (542, 34, '白芷', '2021-09-12 04:13:34', '2021-09-12 04:13:34');
INSERT INTO `recipe_ingredient_list` VALUES (543, 34, '玉竹', '2021-09-12 04:13:42', '2021-09-12 04:13:42');
INSERT INTO `recipe_ingredient_list` VALUES (544, 34, '桔皮', '2021-09-12 04:13:50', '2021-09-12 04:13:50');
INSERT INTO `recipe_ingredient_list` VALUES (545, 34, '兰香子', '2021-09-12 04:13:57', '2021-09-12 04:13:57');
INSERT INTO `recipe_ingredient_list` VALUES (546, 34, '天麻', '2021-09-12 04:14:05', '2021-09-12 04:14:05');
INSERT INTO `recipe_ingredient_list` VALUES (547, 34, '菟丝子', '2021-09-12 04:14:13', '2021-09-12 04:14:13');
INSERT INTO `recipe_ingredient_list` VALUES (548, 34, '紫苏', '2021-09-12 04:14:25', '2021-09-12 04:14:25');
INSERT INTO `recipe_ingredient_list` VALUES (549, 34, '罗汉果', '2021-09-12 04:14:34', '2021-09-12 04:14:34');
INSERT INTO `recipe_ingredient_list` VALUES (550, 34, '乌梅', '2021-09-12 04:14:41', '2021-09-12 04:14:41');
INSERT INTO `recipe_ingredient_list` VALUES (551, 34, '肉桂', '2021-09-12 04:14:50', '2021-09-12 04:14:50');
INSERT INTO `recipe_ingredient_list` VALUES (552, 34, '乌树叶', '2021-09-12 04:14:58', '2021-09-12 04:14:58');
INSERT INTO `recipe_ingredient_list` VALUES (553, 34, '土三七', '2021-09-12 04:15:06', '2021-09-12 04:15:06');
INSERT INTO `recipe_ingredient_list` VALUES (554, 34, '巴戟天', '2021-09-12 04:15:14', '2021-09-12 04:15:14');
INSERT INTO `recipe_ingredient_list` VALUES (555, 34, '橘红', '2021-09-12 04:15:22', '2021-09-12 04:15:22');
INSERT INTO `recipe_ingredient_list` VALUES (556, 34, '牡丹花', '2021-09-12 04:15:31', '2021-09-12 04:15:31');
INSERT INTO `recipe_ingredient_list` VALUES (557, 34, '白矾', '2021-09-12 04:15:39', '2021-09-12 04:15:39');
INSERT INTO `recipe_ingredient_list` VALUES (558, 34, '知了', '2021-09-12 04:15:46', '2021-09-12 04:15:46');
INSERT INTO `recipe_ingredient_list` VALUES (559, 34, '紫苏子', '2021-09-12 04:15:54', '2021-09-12 04:15:54');
INSERT INTO `recipe_ingredient_list` VALUES (560, 34, '艾叶', '2021-09-12 04:16:06', '2021-09-12 04:16:06');
INSERT INTO `recipe_ingredient_list` VALUES (561, 34, '草果', '2021-09-12 04:16:19', '2021-09-12 04:16:19');
INSERT INTO `recipe_ingredient_list` VALUES (562, 34, '虎杖（鲜）', '2021-09-12 04:16:27', '2021-09-12 04:16:27');
INSERT INTO `recipe_ingredient_list` VALUES (563, 34, '藿香叶（鲜）', '2021-09-12 04:16:37', '2021-09-12 04:16:37');
INSERT INTO `recipe_ingredient_list` VALUES (564, 34, '通草', '2021-09-12 04:16:47', '2021-09-12 04:16:47');
INSERT INTO `recipe_ingredient_list` VALUES (565, 34, '锁阳', '2021-09-12 04:16:54', '2021-09-12 04:16:54');
INSERT INTO `recipe_ingredient_list` VALUES (566, 34, '鼠尾草', '2021-09-12 04:17:02', '2021-09-12 04:17:02');
INSERT INTO `recipe_ingredient_list` VALUES (567, 34, '五味子', '2021-09-12 04:17:10', '2021-09-12 04:17:10');
INSERT INTO `recipe_ingredient_list` VALUES (568, 34, '酸枣仁', '2021-09-12 04:17:18', '2021-09-12 04:17:18');
INSERT INTO `recipe_ingredient_list` VALUES (569, 34, '防风', '2021-09-12 04:17:26', '2021-09-12 04:17:26');
INSERT INTO `recipe_ingredient_list` VALUES (570, 34, '白参', '2021-09-12 04:17:34', '2021-09-12 04:17:34');
INSERT INTO `recipe_ingredient_list` VALUES (571, 34, '蛋白粉', '2021-09-12 04:17:41', '2021-09-12 04:17:41');
INSERT INTO `recipe_ingredient_list` VALUES (572, 34, '枇杷叶', '2021-09-12 04:17:51', '2021-09-12 04:17:51');
INSERT INTO `recipe_ingredient_list` VALUES (573, 34, '川贝母', '2021-09-12 04:18:00', '2021-09-12 04:18:00');
INSERT INTO `recipe_ingredient_list` VALUES (574, 34, '月季花茶', '2021-09-12 04:18:09', '2021-09-12 04:18:09');
INSERT INTO `recipe_ingredient_list` VALUES (575, 34, '茵陈蒿', '2021-09-12 04:18:18', '2021-09-12 04:18:18');
INSERT INTO `recipe_ingredient_list` VALUES (576, 34, '栀子', '2021-09-12 04:18:26', '2021-09-12 04:18:26');
INSERT INTO `recipe_ingredient_list` VALUES (577, 34, '珍珠粉圆', '2021-09-12 04:18:34', '2021-09-12 04:18:34');
INSERT INTO `recipe_ingredient_list` VALUES (578, 34, '玫瑰茄', '2021-09-12 04:18:43', '2021-09-12 04:18:43');
INSERT INTO `recipe_ingredient_list` VALUES (579, 34, '迷迭香', '2021-09-12 04:18:50', '2021-09-12 04:18:50');
INSERT INTO `recipe_ingredient_list` VALUES (580, 34, '紫草', '2021-09-12 04:19:00', '2021-09-12 04:19:00');
INSERT INTO `recipe_ingredient_list` VALUES (581, 34, '荆芥', '2021-09-12 04:19:09', '2021-09-12 04:19:09');
INSERT INTO `recipe_ingredient_list` VALUES (582, 34, '吴茱萸', '2021-09-12 04:19:18', '2021-09-12 04:19:18');
INSERT INTO `recipe_ingredient_list` VALUES (583, 34, '枇杷花', '2021-09-12 04:19:27', '2021-09-12 04:19:27');
INSERT INTO `recipe_ingredient_list` VALUES (584, 34, '火麻仁', '2021-09-12 04:19:37', '2021-09-12 04:19:37');
INSERT INTO `recipe_ingredient_list` VALUES (585, 34, '人参', '2021-09-12 04:19:47', '2021-09-12 04:19:47');
INSERT INTO `recipe_ingredient_list` VALUES (586, 34, '枸杞', '2021-09-12 04:19:55', '2021-09-12 04:19:55');
INSERT INTO `recipe_ingredient_list` VALUES (587, 34, '黄芪', '2021-09-12 04:20:07', '2021-09-12 04:20:07');
INSERT INTO `recipe_ingredient_list` VALUES (588, 34, '玉米须', '2021-09-12 04:20:15', '2021-09-12 04:20:15');
INSERT INTO `recipe_ingredient_list` VALUES (589, 34, '益母草', '2021-09-12 04:20:23', '2021-09-12 04:20:23');
INSERT INTO `recipe_ingredient_list` VALUES (590, 34, '灵芝', '2021-09-12 04:20:31', '2021-09-12 04:20:31');
INSERT INTO `recipe_ingredient_list` VALUES (591, 34, '白芍', '2021-09-12 04:20:39', '2021-09-12 04:20:39');
INSERT INTO `recipe_ingredient_list` VALUES (592, 34, '鸡骨草', '2021-09-12 04:20:47', '2021-09-12 04:20:47');
INSERT INTO `recipe_ingredient_list` VALUES (593, 34, '田七', '2021-09-12 04:21:03', '2021-09-12 04:21:03');
INSERT INTO `recipe_ingredient_list` VALUES (594, 34, '桂皮', '2021-09-12 04:21:12', '2021-09-12 04:21:12');
INSERT INTO `recipe_ingredient_list` VALUES (595, 34, '西洋参', '2021-09-12 04:21:20', '2021-09-12 04:21:20');
INSERT INTO `recipe_ingredient_list` VALUES (596, 34, '干黄花菜', '2021-09-12 04:21:37', '2021-09-12 04:21:37');
INSERT INTO `recipe_ingredient_list` VALUES (597, 34, '丁香', '2021-09-12 04:21:45', '2021-09-12 04:21:45');
INSERT INTO `recipe_ingredient_list` VALUES (598, 34, '冬虫夏草', '2021-09-12 04:21:55', '2021-09-12 04:21:55');
INSERT INTO `recipe_ingredient_list` VALUES (599, 34, '石斛', '2021-09-12 04:22:03', '2021-09-12 04:22:03');
INSERT INTO `recipe_ingredient_list` VALUES (600, 34, '黄莲', '2021-09-12 04:22:18', '2021-09-12 04:22:18');
INSERT INTO `recipe_ingredient_list` VALUES (601, 34, '桂花', '2021-09-12 04:22:26', '2021-09-12 04:22:26');
INSERT INTO `recipe_ingredient_list` VALUES (602, 34, '鱼腥草', '2021-09-12 04:22:34', '2021-09-12 04:22:34');
INSERT INTO `recipe_ingredient_list` VALUES (603, 34, '紫苏叶', '2021-09-12 04:22:41', '2021-09-12 04:22:41');
INSERT INTO `recipe_ingredient_list` VALUES (604, 34, '胖大海', '2021-09-12 04:22:50', '2021-09-12 04:22:50');
INSERT INTO `recipe_ingredient_list` VALUES (605, 34, '五指毛桃', '2021-09-12 04:23:03', '2021-09-12 04:23:03');
INSERT INTO `recipe_ingredient_list` VALUES (606, 34, '大黄', '2021-09-12 04:23:15', '2021-09-12 04:23:15');
INSERT INTO `recipe_ingredient_list` VALUES (607, 34, '杜鹃花', '2021-09-12 04:23:23', '2021-09-12 04:23:23');
INSERT INTO `recipe_ingredient_list` VALUES (608, 34, '欧石楠', '2021-09-12 04:23:31', '2021-09-12 04:23:31');
INSERT INTO `recipe_ingredient_list` VALUES (609, 34, '玉兰花', '2021-09-12 04:23:39', '2021-09-12 04:23:39');
INSERT INTO `recipe_ingredient_list` VALUES (610, 34, '白豆蔻', '2021-09-12 04:23:48', '2021-09-12 04:23:48');
INSERT INTO `recipe_ingredient_list` VALUES (611, 34, '砂仁', '2021-09-12 04:23:56', '2021-09-12 04:23:56');
INSERT INTO `recipe_ingredient_list` VALUES (612, 34, '紫藤花', '2021-09-12 04:24:03', '2021-09-12 04:24:03');
INSERT INTO `recipe_ingredient_list` VALUES (613, 34, '芙蓉花', '2021-09-12 04:24:10', '2021-09-12 04:24:10');
INSERT INTO `recipe_ingredient_list` VALUES (614, 34, '蒲公英叶', '2021-09-12 04:24:16', '2021-09-12 04:24:16');
INSERT INTO `recipe_ingredient_list` VALUES (615, 34, '薰衣草', '2021-09-12 04:24:30', '2021-09-12 04:24:30');
INSERT INTO `recipe_ingredient_list` VALUES (616, 34, '豆蔻', '2021-09-12 04:24:40', '2021-09-12 04:24:40');
INSERT INTO `recipe_ingredient_list` VALUES (617, 34, '野蒜', '2021-09-12 04:24:50', '2021-09-12 04:24:50');
INSERT INTO `recipe_ingredient_list` VALUES (618, 34, '香附', '2021-09-12 04:25:01', '2021-09-12 04:25:01');
INSERT INTO `recipe_ingredient_list` VALUES (619, 34, '鸡屎藤', '2021-09-12 04:25:18', '2021-09-12 04:25:18');
INSERT INTO `recipe_ingredient_list` VALUES (620, 34, '太子参', '2021-09-12 04:25:26', '2021-09-12 04:25:26');
INSERT INTO `recipe_ingredient_list` VALUES (621, 34, '红景天', '2021-09-12 04:25:39', '2021-09-12 04:25:39');
INSERT INTO `recipe_ingredient_list` VALUES (622, 34, '鸡内金', '2021-09-12 04:25:49', '2021-09-12 04:25:49');
INSERT INTO `recipe_ingredient_list` VALUES (623, 34, '板兰叶', '2021-09-12 04:25:58', '2021-09-12 04:25:58');
INSERT INTO `recipe_ingredient_list` VALUES (624, 34, '柚子皮', '2021-09-12 04:26:06', '2021-09-12 04:26:06');
INSERT INTO `recipe_ingredient_list` VALUES (625, 34, '沙棘', '2021-09-12 04:26:14', '2021-09-12 04:26:14');
INSERT INTO `recipe_ingredient_list` VALUES (626, 34, '桃胶', '2021-09-12 04:26:22', '2021-09-12 04:26:22');
INSERT INTO `recipe_ingredient_list` VALUES (627, 34, '刺梨', '2021-09-12 04:26:33', '2021-09-12 04:26:33');
INSERT INTO `recipe_ingredient_list` VALUES (628, 34, '桑寄生', '2021-09-12 04:26:42', '2021-09-12 04:26:42');
INSERT INTO `recipe_ingredient_list` VALUES (629, 34, '土茯苓', '2021-09-12 04:26:51', '2021-09-12 04:26:51');
INSERT INTO `recipe_ingredient_list` VALUES (630, 34, '石菖蒲', '2021-09-12 04:27:05', '2021-09-12 04:27:05');
INSERT INTO `recipe_ingredient_list` VALUES (631, 34, '地骨皮', '2021-09-12 04:27:15', '2021-09-12 04:27:15');
INSERT INTO `recipe_ingredient_list` VALUES (632, 34, '积雪草', '2021-09-12 04:27:25', '2021-09-12 04:27:25');
INSERT INTO `recipe_ingredient_list` VALUES (633, 34, '百合花', '2021-09-12 04:27:33', '2021-09-12 04:27:33');
INSERT INTO `recipe_ingredient_list` VALUES (634, 34, '牛膝', '2021-09-12 04:27:41', '2021-09-12 04:27:41');
INSERT INTO `recipe_ingredient_list` VALUES (635, 34, '威灵仙', '2021-09-12 04:27:49', '2021-09-12 04:27:49');
INSERT INTO `recipe_ingredient_list` VALUES (636, 34, '鸭跖草', '2021-09-12 04:27:58', '2021-09-12 04:27:58');
INSERT INTO `recipe_ingredient_list` VALUES (637, 35, '味精', '2021-09-12 04:28:11', '2021-09-12 04:28:11');
INSERT INTO `recipe_ingredient_list` VALUES (638, 35, '白糖', '2021-09-12 04:28:19', '2021-09-12 04:28:19');
INSERT INTO `recipe_ingredient_list` VALUES (639, 35, '豆瓣酱', '2021-09-12 04:28:27', '2021-09-12 04:28:27');
INSERT INTO `recipe_ingredient_list` VALUES (640, 35, '辣根', '2021-09-12 04:28:35', '2021-09-12 04:28:35');
INSERT INTO `recipe_ingredient_list` VALUES (641, 35, '芥末', '2021-09-12 04:28:43', '2021-09-12 04:28:43');
INSERT INTO `recipe_ingredient_list` VALUES (642, 35, '胡椒粉', '2021-09-12 04:28:51', '2021-09-12 04:28:51');
INSERT INTO `recipe_ingredient_list` VALUES (643, 35, '茴香籽', '2021-09-12 04:28:59', '2021-09-12 04:28:59');
INSERT INTO `recipe_ingredient_list` VALUES (644, 35, '花生油', '2021-09-12 04:29:09', '2021-09-12 04:29:09');
INSERT INTO `recipe_ingredient_list` VALUES (645, 35, '料酒', '2021-09-12 04:29:19', '2021-09-12 04:29:19');
INSERT INTO `recipe_ingredient_list` VALUES (646, 35, '亚麻籽油', '2021-09-12 04:29:29', '2021-09-12 04:29:29');
INSERT INTO `recipe_ingredient_list` VALUES (647, 35, '葡萄籽油', '2021-09-12 04:29:37', '2021-09-12 04:29:37');
INSERT INTO `recipe_ingredient_list` VALUES (648, 35, '红糖', '2021-09-12 04:29:46', '2021-09-12 04:29:46');
INSERT INTO `recipe_ingredient_list` VALUES (649, 35, '姜', '2021-09-12 04:29:53', '2021-09-12 04:29:53');
INSERT INTO `recipe_ingredient_list` VALUES (650, 35, '番茄酱', '2021-09-12 04:30:01', '2021-09-12 04:30:01');
INSERT INTO `recipe_ingredient_list` VALUES (651, 35, '干辣椒', '2021-09-12 04:30:11', '2021-09-12 04:30:11');
INSERT INTO `recipe_ingredient_list` VALUES (652, 35, '咖喱', '2021-09-12 04:30:19', '2021-09-12 04:30:19');
INSERT INTO `recipe_ingredient_list` VALUES (653, 35, '花椒', '2021-09-12 04:30:28', '2021-09-12 04:30:28');
INSERT INTO `recipe_ingredient_list` VALUES (654, 35, '八角', '2021-09-12 04:30:36', '2021-09-12 04:30:36');
INSERT INTO `recipe_ingredient_list` VALUES (655, 35, '苏打粉', '2021-09-12 04:30:44', '2021-09-12 04:30:44');
INSERT INTO `recipe_ingredient_list` VALUES (656, 35, '蚝油', '2021-09-12 04:30:52', '2021-09-12 04:30:52');
INSERT INTO `recipe_ingredient_list` VALUES (657, 35, '茶油', '2021-09-12 04:31:00', '2021-09-12 04:31:00');
INSERT INTO `recipe_ingredient_list` VALUES (658, 35, '草寇', '2021-09-12 04:31:07', '2021-09-12 04:31:07');
INSERT INTO `recipe_ingredient_list` VALUES (659, 35, '冰糖', '2021-09-12 04:31:16', '2021-09-12 04:31:16');
INSERT INTO `recipe_ingredient_list` VALUES (660, 35, '醋', '2021-09-12 04:31:29', '2021-09-12 04:31:29');
INSERT INTO `recipe_ingredient_list` VALUES (661, 35, '山葵', '2021-09-12 04:31:36', '2021-09-12 04:31:36');
INSERT INTO `recipe_ingredient_list` VALUES (662, 35, '胡椒', '2021-09-12 04:31:44', '2021-09-12 04:31:44');
INSERT INTO `recipe_ingredient_list` VALUES (663, 35, '芝麻油', '2021-09-12 04:31:52', '2021-09-12 04:31:52');
INSERT INTO `recipe_ingredient_list` VALUES (664, 35, '酱油', '2021-09-12 04:31:59', '2021-09-12 04:31:59');
INSERT INTO `recipe_ingredient_list` VALUES (665, 35, '猪油', '2021-09-12 04:32:07', '2021-09-12 04:32:07');
INSERT INTO `recipe_ingredient_list` VALUES (666, 35, '椰子油', '2021-09-12 04:32:17', '2021-09-12 04:32:17');
INSERT INTO `recipe_ingredient_list` VALUES (667, 35, '孜然', '2021-09-12 04:32:25', '2021-09-12 04:32:25');
INSERT INTO `recipe_ingredient_list` VALUES (668, 35, '胡麻油', '2021-09-12 04:32:36', '2021-09-12 04:32:36');

-- ----------------------------
-- Table structure for three_meals_today_first_category_list
-- ----------------------------
DROP TABLE IF EXISTS `three_meals_today_first_category_list`;
CREATE TABLE `three_meals_today_first_category_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

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
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `fan_count` int NULL DEFAULT 0,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_list
-- ----------------------------
INSERT INTO `user_list` VALUES (1, NULL, '469337ca-28f5-4feb-b70c-ddffb9df1e2b', '469337ca-28f5-4feb-b70c-ddffb9df1e2b', '美食小编', 'https://s1.st.meishij.net/user/41/203/t113291_86576.jpg', 0, '2021-09-16 07:06:59', '2021-09-16 07:06:59');
INSERT INTO `user_list` VALUES (2, NULL, 'ca163053-f9da-494b-84f7-78584f19a10d', 'ca163053-f9da-494b-84f7-78584f19a10d', '红豆厨坊', 'https://s1.st.meishij.net/user/150/151/t14787900_161011039628014.jpg', 0, '2021-09-16 07:07:22', '2021-09-16 07:07:22');
INSERT INTO `user_list` VALUES (3, NULL, '46c501d1-70ee-4510-a3ad-d9d6ec5ab35f', '46c501d1-70ee-4510-a3ad-d9d6ec5ab35f', '青柠食记', 'https://s1.st.meishij.net/user/239/17/t2941989_157043044493736.jpg', 0, '2021-09-16 07:07:42', '2021-09-16 07:07:42');

SET FOREIGN_KEY_CHECKS = 1;
