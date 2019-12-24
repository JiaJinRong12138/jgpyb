/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : db_jgpyb

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 20/12/2019 18:01:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_activity
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity`;
CREATE TABLE `tb_activity`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '动态id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `time` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发布时间（时间戳）',
  `img_uri` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户动态的图片',
  `context` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '动态内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_USER_ID_LINK_ACTIVITY_USERID`(`user_id`) USING BTREE,
  CONSTRAINT `FK_USER_ID_LINK_ACTIVITY_USERID` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_activity
-- ----------------------------
INSERT INTO `tb_activity` VALUES ('activity-2e7c8d49-d930-4b92-81f5-13303f67cca2', 'user-64781ff1-5b78-481c-9b44-0c440efe2592', '1576767861162', '[\"/file/acimg/2019-12-19-15-04-18&b9468dd4fd39c2d9da9bfcd786dc2d88.jpg\"]', '测试：大保gba蛋');
INSERT INTO `tb_activity` VALUES ('activity-32ec4e8a-9f13-4102-a39b-3fd5bebe3f77', 'user-c191d332-0880-4b39-8c2d-73b023c042f4', '1576761020781', '[\"/file/acimg/2019-12-19-13-10-17&10fe1d9d0bfe53e31cd76fcc47dd5b3c.jpeg\",\"/file/acimg/2019-12-19-13-10-17&b9468dd4fd39c2d9da9bfcd786dc2d88.jpg\",\"/file/acimg/2019-12-19-13-10-17&bce13bad37ebdd50bbb5d0d047c6278c.jpg\",\"/file/acimg/2019-12-19-13-10-17&c3ff54e2a76de0dddacd0a343ec334d9.jpeg\",\"/file/acimg/2019-12-19-13-10-17&fcad254183bf8a760b7f0475390e3297.jpeg\"]', '测试：我是梅花十一的妹妹梅花十三');
INSERT INTO `tb_activity` VALUES ('activity-cd672179-3290-47f2-9562-7d7f09cba64e', 'user-c191d332-0880-4b39-8c2d-73b023c042f4', '1576832872375', NULL, '测试：动态点赞人数测试');

-- ----------------------------
-- Table structure for tb_addr_statistics
-- ----------------------------
DROP TABLE IF EXISTS `tb_addr_statistics`;
CREATE TABLE `tb_addr_statistics`  (
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `count_user` int(10) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_relationship
-- ----------------------------
DROP TABLE IF EXISTS `tb_relationship`;
CREATE TABLE `tb_relationship`  (
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `like_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '喜欢的用户',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `FK_USER_ID_LINK_RELATIONSHIP_LIKE_USER_ID`(`like_user_id`) USING BTREE,
  CONSTRAINT `FK_USER_ID_LINK_RELATIONSHIP_LIKE_USER_ID` FOREIGN KEY (`like_user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USER_ID_LINK_RELATIONSHIP_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_to_activity
-- ----------------------------
DROP TABLE IF EXISTS `tb_to_activity`;
CREATE TABLE `tb_to_activity`  (
  `activity_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '动态id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  INDEX `FK_ACTIVITY_ID_LINK_TOACTIVITY_ID`(`activity_id`) USING BTREE,
  INDEX `FK_USER_ID_LINK_TO_ACTIVITY_USERID`(`user_id`) USING BTREE,
  CONSTRAINT `FK_ACTIVITY_ID_LINK_TOACTIVITY_ID` FOREIGN KEY (`activity_id`) REFERENCES `tb_activity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USER_ID_LINK_TO_ACTIVITY_USERID` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_to_activity
-- ----------------------------
INSERT INTO `tb_to_activity` VALUES ('activity-2e7c8d49-d930-4b92-81f5-13303f67cca2', 'user-c191d332-0880-4b39-8c2d-73b023c042f4');
INSERT INTO `tb_to_activity` VALUES ('activity-cd672179-3290-47f2-9562-7d7f09cba64e', 'user-c191d332-0880-4b39-8c2d-73b023c042f4');
INSERT INTO `tb_to_activity` VALUES ('activity-32ec4e8a-9f13-4102-a39b-3fd5bebe3f77', 'user-c191d332-0880-4b39-8c2d-73b023c042f4');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账户',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码（MD5）',
  `head_uri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像链接',
  `sex` int(20) NOT NULL COMMENT '性别',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `education` int(20) NOT NULL COMMENT '学历',
  `work` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工作',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所在城市',
  `hobby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '爱好',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '自我介绍',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQUE_USERNAME`(`username`) USING BTREE COMMENT 'username唯一性',
  UNIQUE INDEX `UNIQUE_NICKNAME`(`nickname`) USING BTREE COMMENT 'nickname唯一性'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('user-173d2086-ef22-4ff6-96af-596da1fbebf9', '12138', '698d51a19d8a121ce581499d7b701668', '/file/img/2019-12-17-13-02-28&TIM图片20191126131454 - 副本.jpg', 1, '13881163394@163.com', 'jj', 4, '学生', 'sss', 'sss', 'sss');
INSERT INTO `tb_user` VALUES ('user-64781ff1-5b78-481c-9b44-0c440efe2592', 'admin', '21232f297a57a5a743894a0e4a801fc3', '/file/img/2019-12-19-06-55-03&b9468dd4fd39c2d9da9bfcd786dc2d88.jpg', 1, 'admin@test.com', '鸡大保', 4, '刺客', '小鸡岛', '赚钱', '大保发廊CEO');
INSERT INTO `tb_user` VALUES ('user-bce35724-1c2c-40d4-b84c-ce8f941d5c11', 'jj12138', '698d51a19d8a121ce581499d7b701668', '/file/img/2019-12-17-14-41-51&Screenshot_2019-10-30-13-05-08-889_哔哩哔哩.png', 1, '13158528636@qq.com', 'jjr', 2, '学生', '绵阳市', '学习', '');
INSERT INTO `tb_user` VALUES ('user-c191d332-0880-4b39-8c2d-73b023c042f4', '1111', 'b59c67bf196a4758191e42f76670ceba', '/file/img/2019-12-18-08-09-05&c3ff54e2a76de0dddacd0a343ec334d9.jpeg', 1, '13158528636@qq.com', '11', 4, '学生', '绵阳市', '学习', '11');

-- ----------------------------
-- Table structure for tb_user_statistics
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_statistics`;
CREATE TABLE `tb_user_statistics`  (
  `count_user` int(10) NULL DEFAULT NULL,
  `count_man` int(10) NULL DEFAULT NULL,
  `count_woman` int(10) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
