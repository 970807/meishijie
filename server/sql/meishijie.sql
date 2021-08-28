/*
 Navicat Premium Data Transfer

 Source Server         : my
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : meishijie

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 27/08/2021 21:41:52
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

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
INSERT INTO `home_recomment_second_category_list` VALUES (1, 1, '食光有约之茄汁南瓜夹', '南瓜、大虾、鸡蛋', 0, 'https://www.meishij.net/zuofa/shiguangyouyuezhiqiezhinanguajia.html', '慕容食光', 'https://pic.rmb.bdstatic.com/bjh/5f6b305d577eb44ab1f2d1f7f97837be.jpeg', 'https://pic.rmb.bdstatic.com/bjh/e59afc3c92a20a5f13c0cc9e3caf2c83.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (2, 1, '食光有约之炸鸡脯丸', '鸡脯肉、蛋白', 0, 'https://www.meishij.net/zuofa/shiguangyouyuezhizhajifuwan.html', '慕容食光', 'https://pic.rmb.bdstatic.com/bjh/5f6b305d577eb44ab1f2d1f7f97837be.jpeg', 'https://pic.rmb.bdstatic.com/bjh/6b82acecbeebb06d1053428093b4b807.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (3, 1, '香酥豌豆', '豌豆', 0, 'https://www.meishij.net/zuofa/xiangsuwandou.html', '糖糖食味记', 'https://pic.rmb.bdstatic.com/bjh/7f69bb382cc4f8df435e30b0e8483934.jpeg', 'https://pic.rmb.bdstatic.com/bjh/da3325fc9c4b6e24374f154a8353e4ef.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (4, 1, '【烧汁金菇肥牛卷】', '肥牛、金针菇、洋葱', 0, 'https://www.meishij.net/zuofa/shaozhijingufeiniujuan.html', '甜叮妈咪', 'https://pic.rmb.bdstatic.com/bjh/a2265d64bee28f1eb1a74871fc27ead7.jpeg', 'https://pic.rmb.bdstatic.com/bjh/84f05f064999150e671ae803b4ba5fb0.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (5, 1, '超大口牛肉酱拌面', '玉米粒、豌豆', 0, 'https://www.meishij.net/zuofa/chaodakouniuroujiangbanmian.html', '尘暁', 'https://pic.rmb.bdstatic.com/bjh/7aefd17cc5ac629e3d7cfb5ab632cc26.jpeg', 'https://pic.rmb.bdstatic.com/bjh/d9da52a9c5f8155357c939a5e7144b55.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (6, 2, '炒合菜', '芹菜,香干,胡萝卜,绿豆芽', 1, 'https://www.meishij.net/zuofa/chaohecai_11.html', '美食小编', 'https://pic.rmb.bdstatic.com/bjh/3dec5794b6a7cc2c402af41763daee39.jpeg', 'https://pic.rmb.bdstatic.com/bjh/28c7694965a448dd8e09a5d5c80c3068.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (7, 2, '重口味，轻挑战的水煮鱼片做法', '黑鱼肉片,莴笋尖,芹菜,蒜苗,黄豆芽,辣椒酱', 1, 'https://www.meishij.net/zuofa/zhongkouweiqingtiaozhandeshuizhuyupianzuofa.html', '白白白云OoO', 'https://pic.rmb.bdstatic.com/bjh/48e70f329ef764b79e18289a6e5947ec.jpeg', 'https://pic.rmb.bdstatic.com/bjh/7b02a996113f92e3e311da21f1863e66.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (8, 2, '醒酒汤', '绿豆芽', 1, 'https://www.meishij.net/zuofa/xingjiutang_1.html', '美食小编', 'https://pic.rmb.bdstatic.com/bjh/3dec5794b6a7cc2c402af41763daee39.jpeg', 'https://pic.rmb.bdstatic.com/bjh/aa133302e61d60c5619dadd5273a1ef5.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (9, 2, '麻辣水煮鱼', '鱼,豆芽,芹菜,蒜苗', 1, 'https://www.meishij.net/zuofa/malashuizhuyu_35.html', '食客姐', 'https://pic.rmb.bdstatic.com/bjh/fa26270ac0bb1adf4f537a5306adb045.jpeg', 'https://pic.rmb.bdstatic.com/bjh/f35a3381937dea1c92c55c14e37bc357.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (10, 2, '豆芽炒肉', '猪五花,绿豆芽', 1, 'https://www.meishij.net/zuofa/douyachaorou_15.html', '美食小编', 'https://pic.rmb.bdstatic.com/bjh/3dec5794b6a7cc2c402af41763daee39.jpeg', 'https://pic.rmb.bdstatic.com/bjh/b35b41b173556ddc81de3ce21299a3b7.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (11, 3, '鲜虾披萨', '高筋面粉,低筋面粉,虾', 0, 'https://www.meishij.net/zuofa/xianxiapisa_5.html', '木予的烘焙时光机', 'https://pic.rmb.bdstatic.com/bjh/f262bf190b24a08ed944362ee2e05ce8.jpeg', 'https://pic.rmb.bdstatic.com/bjh/b0a255d10080a4a6e7a36e01f442a904.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (12, 3, '巨好吃香辣烤鸡翅，超简单', '鸡翅中,贝贝南瓜,水果玉米,香菇', 1, 'https://www.meishij.net/zuofa/juhaochixianglakaojichichaojiandan.html', '蝶舞九天', 'https://pic.rmb.bdstatic.com/bjh/c44abfb01ba10934720078f90d9a914c.jpeg', 'https://pic.rmb.bdstatic.com/bjh/871be7888fdd7174aba68573eb2d220b.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (13, 3, '生姜这样吃，给肉都不换', '生姜,大葱,瘦肉', 1, 'https://www.meishij.net/zuofa/shengjiangzheyangchigeiroudubuhuan.html', '木木木木de健康生活', 'https://pic.rmb.bdstatic.com/bjh/6b5f8ce626f62d057e7e49cec36195c1.jpeg', 'https://pic.rmb.bdstatic.com/bjh/ecf7131cdc6d7512db6ac0f1dd78f77d.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (14, 3, '青萝卜丝鸡肉丸子汤', '青萝卜,粉丝,鸡胸肉,木耳,青椒', 0, 'https://www.meishij.net/zuofa/qingluobosijirouwanzitang.html', '霖食记', 'https://pic.rmb.bdstatic.com/bjh/2967da84b04a1175729fb3de138a2dff.jpeg', 'https://pic.rmb.bdstatic.com/bjh/11b771c2a46ef701774f37dc5bee57a6.jpeg');
INSERT INTO `home_recomment_second_category_list` VALUES (15, 3, '农家小炒肉', '五花肉,香豆干,大蒜叶,生姜', 0, 'https://www.meishij.net/zuofa/nongjiaxiaochaorouwucan.html', '我叫一尾鱼', 'https://pic.rmb.bdstatic.com/bjh/63c0508c17cb2212266234fdbe349a3d.jpeg', 'https://pic.rmb.bdstatic.com/bjh/9fe4205c7f69f7a977ea3c25b95b4d4c.jpeg');

-- ----------------------------
-- Table structure for hot_today_search_list
-- ----------------------------
DROP TABLE IF EXISTS `hot_today_search_list`;
CREATE TABLE `hot_today_search_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `isHot` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hot_today_video_list
-- ----------------------------
INSERT INTO `hot_today_video_list` VALUES (1, '葱油拌面', '菜菜美食日记', 'https://pic.rmb.bdstatic.com/bjh/0fe27d0ba12ce63b77ea3754810cf738.jpeg', 'https://i.meishi.cc/daren_task/article_detail.php?id=131036', 'https://pic.rmb.bdstatic.com/bjh/ea745fe2b02c8ca8404ebb96a02c0294.jpeg', 'http://gslb.miaopai.com/stream/AydNGOZYO9Spgn37hZjXuZNp~qbLHDqf3QX32w__.mp4?vend=miaopai');
INSERT INTO `hot_today_video_list` VALUES (2, '凉拌藕片', '馋哭姐', 'https://pic.rmb.bdstatic.com/bjh/ebdaa0e01d39a4397df0f0d9dcfdff63.jpeg', 'https://i.meishi.cc/daren_task/article_detail.php?id=90617', 'https://pic.rmb.bdstatic.com/bjh/46e833c171c6658e231af023d828c066.jpeg', 'https://v2.meishij.net/test/1195478806/3273b2dbf84ff1cd2233440d787c2dcb.mp4?k=b8d6e61f32d35d02&t=1629517036');
INSERT INTO `hot_today_video_list` VALUES (3, '瘦身冬瓜汤', '舌里美食记', 'https://pic.rmb.bdstatic.com/bjh/7aa4aa91916e56e6ec1c9a5985b5143f.jpeg', 'https://i.meishi.cc/daren_task/article_detail.php?id=146633', 'https://pic.rmb.bdstatic.com/bjh/5e9c9e6af4010a99f0e31f87702887ee.jpeg', 'https://v2.meishij.net/3rd/dy/5200514/v_6775372880894102797.mp4?k=f2f0dd4a7ad4b17f&t=1629517036');
INSERT INTO `hot_today_video_list` VALUES (4, '茄子豆角', '新东方小食神', 'https://pic.rmb.bdstatic.com/bjh/1f4e007c6f984e0b4d63add4215c41fe.jpeg', 'https://www.meishij.net/zuofa/qiezidoujiao_15.html', 'https://pic.rmb.bdstatic.com/bjh/9282a4b2944bfb83bda10aa694d0d65f.jpeg', 'https://v2.meishij.net/test/81648328/f9e542c2387759019de80916ad2514fa.mp4?k=ee0348ab0587c033&t=1629517036');

-- ----------------------------
-- Table structure for three_meals_today_first_category_list
-- ----------------------------
DROP TABLE IF EXISTS `three_meals_today_first_category_list`;
CREATE TABLE `three_meals_today_first_category_list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of three_meals_today_second_category_list
-- ----------------------------
INSERT INTO `three_meals_today_second_category_list` VALUES (1, 1, '五彩虾仁炒饭', '营养丰富，早餐最爱', 'https://pic.rmb.bdstatic.com/bjh/df14c5d41cecfe26740a42c0b4670bb0.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (2, 1, '爱心满满的黑椒蔬菜牛排', '简单快手，分分钟搞定', 'https://pic.rmb.bdstatic.com/bjh/6a05bf8fe8817f1676b30eae6e43144e.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (3, 1, '鲜活时蔬面', '简单美味，几分钟搞定早餐', 'https://pic.rmb.bdstatic.com/bjh/02265517167aacba91c2b866f940484d.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (4, 2, '蜜汁烤五花肉', '经典家常，上桌就光盘', 'https://pic.rmb.bdstatic.com/bjh/ec3d384a984a2c155c606e1288afdbd1.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (5, 2, '家常小炒', '经济实惠，有滋有味', 'https://pic.rmb.bdstatic.com/bjh/bde8f17b33d6729938ca2589201f65a3.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (6, 2, '酱香洋葱烤鸡', '营养美味，一吃停不下来', 'https://pic.rmb.bdstatic.com/bjh/bd4edfa3604bdac51a4aa4fa89f30611.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (7, 3, '花朵酥脆曲奇', '香气扑鼻，好吃过瘾', 'https://pic.rmb.bdstatic.com/bjh/055ce876539c06f7199c02600014693d.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (8, 3, '舒芙蕾厚松饼', '惊艳味蕾，好吃到爆', 'https://pic.rmb.bdstatic.com/bjh/9db33e4e353b578709f614f7f9f44f0e.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (9, 3, '紫薯西米露', '美味下午茶，让人欲罢不能', 'https://pic.rmb.bdstatic.com/bjh/fd91656db097e66b5ef0ccff3188b51f.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (10, 4, '红烧猪蹄', '美味飘香，满足味蕾', 'https://pic.rmb.bdstatic.com/bjh/db336716dc870fd417c0c2299ba3eef9.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (11, 4, '凉拌西兰花', '鲜香可口，美味下饭', 'https://pic.rmb.bdstatic.com/bjh/72e5b170dc69d131f6798d309ef39e8e.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (12, 4, '减肥餐～苦瓜酿肉', '家常经典，上桌被抢光', 'https://pic.rmb.bdstatic.com/bjh/6e2c16024e0d23303acbc64ce31f9799.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (13, 5, '孜然土豆', '味道超赞，无比解馋', 'https://pic.rmb.bdstatic.com/bjh/375ee062a2b850320966133fea8a1add.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (14, 5, '酸辣鸡爪', '均衡营养，滋补养生', 'https://pic.rmb.bdstatic.com/bjh/992e22d92980f0c01ffdc271f9d12e9f.jpeg');
INSERT INTO `three_meals_today_second_category_list` VALUES (15, 5, '风味花生', '美味过瘾，好吃停不下嘴', 'https://pic.rmb.bdstatic.com/bjh/25fc6e94b67292de9acd03175ed452c4.jpeg');

SET FOREIGN_KEY_CHECKS = 1;
