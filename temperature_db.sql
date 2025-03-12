/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.6
 Source Server Type    : MySQL
 Source Server Version : 50620
 Source Host           : localhost:3306
 Source Schema         : temperature_db

 Target Server Type    : MySQL
 Target Server Version : 50620
 File Encoding         : 65001

 Date: 26/02/2024 20:45:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for t_temperature
-- ----------------------------
DROP TABLE IF EXISTS `t_temperature`;
CREATE TABLE `t_temperature`  (
  `temperatureId` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录d',
  `temperatureValue` float NOT NULL COMMENT '温度值',
  `temperatureTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录时间',
  PRIMARY KEY (`temperatureId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 480 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_temperature
-- ----------------------------
INSERT INTO `t_temperature` VALUES (0, 16.5, '2024-02-26 15:25:04');
INSERT INTO `t_temperature` VALUES (1, 23.5, '2024-02-25 17:20:01');
INSERT INTO `t_temperature` VALUES (2, 28.7, '2024-02-25 17:21:48');
INSERT INTO `t_temperature` VALUES (65, 16.5, '2024-02-26 15:25:05');
INSERT INTO `t_temperature` VALUES (66, 16.5, '2024-02-26 15:25:07');
INSERT INTO `t_temperature` VALUES (67, 16.5, '2024-02-26 15:25:08');
INSERT INTO `t_temperature` VALUES (68, 16.5, '2024-02-26 15:25:10');
INSERT INTO `t_temperature` VALUES (69, 16.5625, '2024-02-26 15:25:11');
INSERT INTO `t_temperature` VALUES (70, 16.5, '2024-02-26 15:25:12');
INSERT INTO `t_temperature` VALUES (71, 16.5, '2024-02-26 15:25:14');
INSERT INTO `t_temperature` VALUES (72, 16.5625, '2024-02-26 15:25:15');
INSERT INTO `t_temperature` VALUES (73, 16.5, '2024-02-26 15:25:17');
INSERT INTO `t_temperature` VALUES (74, 16.5, '2024-02-26 15:25:18');
INSERT INTO `t_temperature` VALUES (75, 16.5, '2024-02-26 15:25:20');
INSERT INTO `t_temperature` VALUES (76, 16.4375, '2024-02-26 15:25:21');
INSERT INTO `t_temperature` VALUES (77, 16.4375, '2024-02-26 15:25:22');
INSERT INTO `t_temperature` VALUES (78, 16.5, '2024-02-26 15:25:24');
INSERT INTO `t_temperature` VALUES (79, 16.4375, '2024-02-26 15:25:25');
INSERT INTO `t_temperature` VALUES (80, 16.5, '2024-02-26 15:25:27');
INSERT INTO `t_temperature` VALUES (81, 16.5, '2024-02-26 15:25:28');
INSERT INTO `t_temperature` VALUES (82, 16.5, '2024-02-26 15:25:30');
INSERT INTO `t_temperature` VALUES (83, 16.5, '2024-02-26 15:25:31');
INSERT INTO `t_temperature` VALUES (84, 16.5, '2024-02-26 15:25:33');
INSERT INTO `t_temperature` VALUES (85, 16.5625, '2024-02-26 15:25:34');
INSERT INTO `t_temperature` VALUES (86, 16.5625, '2024-02-26 15:25:35');
INSERT INTO `t_temperature` VALUES (87, 16.5625, '2024-02-26 15:25:37');
INSERT INTO `t_temperature` VALUES (88, 16.5625, '2024-02-26 15:25:38');
INSERT INTO `t_temperature` VALUES (89, 16.625, '2024-02-26 15:25:40');
INSERT INTO `t_temperature` VALUES (90, 16.625, '2024-02-26 15:25:41');
INSERT INTO `t_temperature` VALUES (91, 16.625, '2024-02-26 15:25:43');
INSERT INTO `t_temperature` VALUES (92, 16.6875, '2024-02-26 15:25:44');
INSERT INTO `t_temperature` VALUES (93, 16.6875, '2024-02-26 15:25:45');
INSERT INTO `t_temperature` VALUES (94, 16.6875, '2024-02-26 15:25:47');
INSERT INTO `t_temperature` VALUES (95, 16.6875, '2024-02-26 15:25:48');
INSERT INTO `t_temperature` VALUES (96, 16.6875, '2024-02-26 15:25:50');
INSERT INTO `t_temperature` VALUES (97, 16.6875, '2024-02-26 15:25:51');
INSERT INTO `t_temperature` VALUES (98, 16.6875, '2024-02-26 15:25:53');
INSERT INTO `t_temperature` VALUES (99, 16.6875, '2024-02-26 15:25:54');
INSERT INTO `t_temperature` VALUES (100, 16.6875, '2024-02-26 15:25:56');
INSERT INTO `t_temperature` VALUES (101, 16.6875, '2024-02-26 15:25:57');
INSERT INTO `t_temperature` VALUES (102, 16.75, '2024-02-26 15:25:58');
INSERT INTO `t_temperature` VALUES (103, 16.6875, '2024-02-26 15:26:00');
INSERT INTO `t_temperature` VALUES (104, 16.6875, '2024-02-26 15:26:01');
INSERT INTO `t_temperature` VALUES (105, 16.6875, '2024-02-26 15:26:03');
INSERT INTO `t_temperature` VALUES (106, 16.6875, '2024-02-26 15:26:04');
INSERT INTO `t_temperature` VALUES (107, 16.6875, '2024-02-26 15:26:06');
INSERT INTO `t_temperature` VALUES (108, 16.6875, '2024-02-26 15:26:07');
INSERT INTO `t_temperature` VALUES (109, 16.6875, '2024-02-26 15:26:08');
INSERT INTO `t_temperature` VALUES (110, 16.6875, '2024-02-26 15:26:10');
INSERT INTO `t_temperature` VALUES (111, 16.6875, '2024-02-26 15:26:11');
INSERT INTO `t_temperature` VALUES (112, 16.75, '2024-02-26 15:26:13');
INSERT INTO `t_temperature` VALUES (113, 16.75, '2024-02-26 15:26:14');
INSERT INTO `t_temperature` VALUES (114, 16.6875, '2024-02-26 15:26:16');
INSERT INTO `t_temperature` VALUES (115, 16.6875, '2024-02-26 15:26:17');
INSERT INTO `t_temperature` VALUES (116, 16.75, '2024-02-26 15:26:19');
INSERT INTO `t_temperature` VALUES (117, 16.75, '2024-02-26 15:26:20');
INSERT INTO `t_temperature` VALUES (118, 16.75, '2024-02-26 15:26:21');
INSERT INTO `t_temperature` VALUES (119, 16.75, '2024-02-26 15:26:23');
INSERT INTO `t_temperature` VALUES (120, 16.6875, '2024-02-26 15:26:24');
INSERT INTO `t_temperature` VALUES (121, 16.75, '2024-02-26 15:26:26');
INSERT INTO `t_temperature` VALUES (122, 16.6875, '2024-02-26 15:26:27');
INSERT INTO `t_temperature` VALUES (123, 16.75, '2024-02-26 15:26:29');
INSERT INTO `t_temperature` VALUES (124, 16.75, '2024-02-26 15:26:30');
INSERT INTO `t_temperature` VALUES (125, 16.6875, '2024-02-26 15:26:31');
INSERT INTO `t_temperature` VALUES (126, 16.6875, '2024-02-26 15:26:33');
INSERT INTO `t_temperature` VALUES (127, 16.75, '2024-02-26 15:26:34');
INSERT INTO `t_temperature` VALUES (128, 16.6875, '2024-02-26 15:26:36');
INSERT INTO `t_temperature` VALUES (129, 16.6875, '2024-02-26 15:26:37');
INSERT INTO `t_temperature` VALUES (130, 16.6875, '2024-02-26 15:26:39');
INSERT INTO `t_temperature` VALUES (131, 16.6875, '2024-02-26 15:26:40');
INSERT INTO `t_temperature` VALUES (132, 16.6875, '2024-02-26 15:26:42');
INSERT INTO `t_temperature` VALUES (133, 16.6875, '2024-02-26 15:26:43');
INSERT INTO `t_temperature` VALUES (134, 16.6875, '2024-02-26 15:26:44');
INSERT INTO `t_temperature` VALUES (135, 16.625, '2024-02-26 15:26:46');
INSERT INTO `t_temperature` VALUES (136, 16.6875, '2024-02-26 15:26:47');
INSERT INTO `t_temperature` VALUES (137, 16.6875, '2024-02-26 15:26:49');
INSERT INTO `t_temperature` VALUES (138, 16.6875, '2024-02-26 15:26:50');
INSERT INTO `t_temperature` VALUES (139, 16.6875, '2024-02-26 15:26:52');
INSERT INTO `t_temperature` VALUES (140, 16.625, '2024-02-26 15:26:53');
INSERT INTO `t_temperature` VALUES (141, 16.6875, '2024-02-26 15:26:54');
INSERT INTO `t_temperature` VALUES (142, 16.6875, '2024-02-26 15:26:56');
INSERT INTO `t_temperature` VALUES (143, 16.6875, '2024-02-26 15:26:57');
INSERT INTO `t_temperature` VALUES (144, 16.6875, '2024-02-26 15:26:59');
INSERT INTO `t_temperature` VALUES (145, 16.6875, '2024-02-26 15:27:00');
INSERT INTO `t_temperature` VALUES (146, 16.6875, '2024-02-26 15:27:02');
INSERT INTO `t_temperature` VALUES (147, 16.625, '2024-02-26 15:27:03');
INSERT INTO `t_temperature` VALUES (148, 16.625, '2024-02-26 15:27:05');
INSERT INTO `t_temperature` VALUES (149, 16.625, '2024-02-26 15:27:06');
INSERT INTO `t_temperature` VALUES (150, 16.625, '2024-02-26 15:27:07');
INSERT INTO `t_temperature` VALUES (151, 16.625, '2024-02-26 15:27:09');
INSERT INTO `t_temperature` VALUES (152, 16.625, '2024-02-26 15:27:10');
INSERT INTO `t_temperature` VALUES (153, 16.6875, '2024-02-26 15:27:12');
INSERT INTO `t_temperature` VALUES (154, 16.625, '2024-02-26 15:27:13');
INSERT INTO `t_temperature` VALUES (155, 16.625, '2024-02-26 15:27:15');
INSERT INTO `t_temperature` VALUES (156, 16.625, '2024-02-26 15:27:16');
INSERT INTO `t_temperature` VALUES (157, 16.625, '2024-02-26 15:27:17');
INSERT INTO `t_temperature` VALUES (158, 16.625, '2024-02-26 15:27:19');
INSERT INTO `t_temperature` VALUES (159, 16.625, '2024-02-26 15:27:20');
INSERT INTO `t_temperature` VALUES (160, 16.625, '2024-02-26 15:27:22');
INSERT INTO `t_temperature` VALUES (161, 16.625, '2024-02-26 15:27:23');
INSERT INTO `t_temperature` VALUES (162, 16.625, '2024-02-26 15:27:25');
INSERT INTO `t_temperature` VALUES (163, 16.6875, '2024-02-26 15:27:26');
INSERT INTO `t_temperature` VALUES (164, 16.6875, '2024-02-26 15:27:28');
INSERT INTO `t_temperature` VALUES (165, 16.625, '2024-02-26 15:27:29');
INSERT INTO `t_temperature` VALUES (166, 16.625, '2024-02-26 15:27:30');
INSERT INTO `t_temperature` VALUES (167, 16.6875, '2024-02-26 15:27:32');
INSERT INTO `t_temperature` VALUES (168, 16.6875, '2024-02-26 15:27:33');
INSERT INTO `t_temperature` VALUES (169, 16.625, '2024-02-26 15:27:35');
INSERT INTO `t_temperature` VALUES (170, 16.625, '2024-02-26 15:27:36');
INSERT INTO `t_temperature` VALUES (171, 16.625, '2024-02-26 15:27:38');
INSERT INTO `t_temperature` VALUES (172, 16.625, '2024-02-26 15:27:39');
INSERT INTO `t_temperature` VALUES (173, 16.625, '2024-02-26 15:27:40');
INSERT INTO `t_temperature` VALUES (174, 16.625, '2024-02-26 15:27:42');
INSERT INTO `t_temperature` VALUES (175, 16.625, '2024-02-26 15:27:43');
INSERT INTO `t_temperature` VALUES (176, 16.625, '2024-02-26 15:27:45');
INSERT INTO `t_temperature` VALUES (177, 16.625, '2024-02-26 15:27:46');
INSERT INTO `t_temperature` VALUES (178, 16.625, '2024-02-26 15:27:48');
INSERT INTO `t_temperature` VALUES (179, 16.625, '2024-02-26 15:27:49');
INSERT INTO `t_temperature` VALUES (180, 16.625, '2024-02-26 15:27:50');
INSERT INTO `t_temperature` VALUES (181, 16.625, '2024-02-26 15:27:52');
INSERT INTO `t_temperature` VALUES (182, 16.625, '2024-02-26 15:27:53');
INSERT INTO `t_temperature` VALUES (183, 16.5625, '2024-02-26 15:27:55');
INSERT INTO `t_temperature` VALUES (184, 16.5625, '2024-02-26 15:27:56');
INSERT INTO `t_temperature` VALUES (185, 16.5625, '2024-02-26 15:27:58');
INSERT INTO `t_temperature` VALUES (186, 16.5625, '2024-02-26 15:27:59');
INSERT INTO `t_temperature` VALUES (187, 16.5625, '2024-02-26 15:28:01');
INSERT INTO `t_temperature` VALUES (188, 16.5625, '2024-02-26 15:28:02');
INSERT INTO `t_temperature` VALUES (189, 16.5625, '2024-02-26 15:28:03');
INSERT INTO `t_temperature` VALUES (190, 16.5625, '2024-02-26 15:28:05');
INSERT INTO `t_temperature` VALUES (191, 16.5625, '2024-02-26 15:28:06');
INSERT INTO `t_temperature` VALUES (192, 16.5625, '2024-02-26 15:28:08');
INSERT INTO `t_temperature` VALUES (193, 16.5625, '2024-02-26 15:28:09');
INSERT INTO `t_temperature` VALUES (194, 16.5625, '2024-02-26 15:28:11');
INSERT INTO `t_temperature` VALUES (195, 16.5625, '2024-02-26 15:28:12');
INSERT INTO `t_temperature` VALUES (196, 16.5625, '2024-02-26 15:28:13');
INSERT INTO `t_temperature` VALUES (197, 16.5625, '2024-02-26 15:28:15');
INSERT INTO `t_temperature` VALUES (198, 16.5625, '2024-02-26 15:28:16');
INSERT INTO `t_temperature` VALUES (199, 16.5625, '2024-02-26 15:28:18');
INSERT INTO `t_temperature` VALUES (200, 16.5625, '2024-02-26 15:28:19');
INSERT INTO `t_temperature` VALUES (201, 16.5625, '2024-02-26 15:28:21');
INSERT INTO `t_temperature` VALUES (202, 16.5625, '2024-02-26 15:28:22');
INSERT INTO `t_temperature` VALUES (203, 16.5625, '2024-02-26 15:28:24');
INSERT INTO `t_temperature` VALUES (204, 16.5, '2024-02-26 15:28:25');
INSERT INTO `t_temperature` VALUES (205, 16.5625, '2024-02-26 15:28:26');
INSERT INTO `t_temperature` VALUES (206, 16.5625, '2024-02-26 15:28:28');
INSERT INTO `t_temperature` VALUES (207, 16.5625, '2024-02-26 15:28:29');
INSERT INTO `t_temperature` VALUES (208, 16.5625, '2024-02-26 15:28:31');
INSERT INTO `t_temperature` VALUES (209, 16.5625, '2024-02-26 15:28:32');
INSERT INTO `t_temperature` VALUES (210, 16.5625, '2024-02-26 15:28:34');
INSERT INTO `t_temperature` VALUES (211, 16.5625, '2024-02-26 15:28:35');
INSERT INTO `t_temperature` VALUES (212, 16.5625, '2024-02-26 15:28:36');
INSERT INTO `t_temperature` VALUES (213, 16.5625, '2024-02-26 15:28:38');
INSERT INTO `t_temperature` VALUES (214, 16.5625, '2024-02-26 15:28:39');
INSERT INTO `t_temperature` VALUES (215, 16.5625, '2024-02-26 15:28:41');
INSERT INTO `t_temperature` VALUES (216, 16.5625, '2024-02-26 15:28:42');
INSERT INTO `t_temperature` VALUES (217, 16.5625, '2024-02-26 15:28:44');
INSERT INTO `t_temperature` VALUES (218, 16.5625, '2024-02-26 15:28:45');
INSERT INTO `t_temperature` VALUES (219, 16.5625, '2024-02-26 15:28:47');
INSERT INTO `t_temperature` VALUES (220, 16.5625, '2024-02-26 15:28:48');
INSERT INTO `t_temperature` VALUES (221, 16.5, '2024-02-26 15:28:49');
INSERT INTO `t_temperature` VALUES (222, 16.5, '2024-02-26 15:28:51');
INSERT INTO `t_temperature` VALUES (223, 16.5625, '2024-02-26 15:28:52');
INSERT INTO `t_temperature` VALUES (224, 16.5625, '2024-02-26 15:28:54');
INSERT INTO `t_temperature` VALUES (225, 16.5625, '2024-02-26 15:28:55');
INSERT INTO `t_temperature` VALUES (226, 16.5625, '2024-02-26 15:28:57');
INSERT INTO `t_temperature` VALUES (227, 16.5, '2024-02-26 15:28:58');
INSERT INTO `t_temperature` VALUES (228, 16.5625, '2024-02-26 15:28:59');
INSERT INTO `t_temperature` VALUES (229, 16.5625, '2024-02-26 15:29:01');
INSERT INTO `t_temperature` VALUES (230, 16.5625, '2024-02-26 15:29:03');
INSERT INTO `t_temperature` VALUES (231, 16.5625, '2024-02-26 15:29:04');
INSERT INTO `t_temperature` VALUES (232, 16.5625, '2024-02-26 15:29:05');
INSERT INTO `t_temperature` VALUES (233, 16.5625, '2024-02-26 15:29:07');
INSERT INTO `t_temperature` VALUES (234, 16.5625, '2024-02-26 15:29:08');
INSERT INTO `t_temperature` VALUES (235, 16.5625, '2024-02-26 15:29:10');
INSERT INTO `t_temperature` VALUES (236, 16.5625, '2024-02-26 15:29:11');
INSERT INTO `t_temperature` VALUES (237, 16.5625, '2024-02-26 15:29:12');
INSERT INTO `t_temperature` VALUES (238, 16.5625, '2024-02-26 15:29:14');
INSERT INTO `t_temperature` VALUES (239, 16.5625, '2024-02-26 15:29:15');
INSERT INTO `t_temperature` VALUES (240, 16.5625, '2024-02-26 15:29:17');
INSERT INTO `t_temperature` VALUES (241, 16.5625, '2024-02-26 15:29:18');
INSERT INTO `t_temperature` VALUES (242, 16.5625, '2024-02-26 16:37:44');
INSERT INTO `t_temperature` VALUES (243, 16.25, '2024-02-26 16:37:49');
INSERT INTO `t_temperature` VALUES (244, 16.25, '2024-02-26 16:37:54');
INSERT INTO `t_temperature` VALUES (245, 16.25, '2024-02-26 16:37:59');
INSERT INTO `t_temperature` VALUES (246, 16.1875, '2024-02-26 16:38:04');
INSERT INTO `t_temperature` VALUES (247, 16.1875, '2024-02-26 16:38:09');
INSERT INTO `t_temperature` VALUES (248, 16.1875, '2024-02-26 16:38:14');
INSERT INTO `t_temperature` VALUES (249, 16.1875, '2024-02-26 16:38:19');
INSERT INTO `t_temperature` VALUES (250, 16.125, '2024-02-26 16:38:24');
INSERT INTO `t_temperature` VALUES (251, 16.125, '2024-02-26 16:38:30');
INSERT INTO `t_temperature` VALUES (252, 16.125, '2024-02-26 16:38:35');
INSERT INTO `t_temperature` VALUES (253, 16.1875, '2024-02-26 16:38:40');
INSERT INTO `t_temperature` VALUES (254, 16.1875, '2024-02-26 16:38:45');
INSERT INTO `t_temperature` VALUES (255, 16.125, '2024-02-26 16:38:50');
INSERT INTO `t_temperature` VALUES (256, 16.1875, '2024-02-26 16:38:55');
INSERT INTO `t_temperature` VALUES (257, 16.125, '2024-02-26 16:39:00');
INSERT INTO `t_temperature` VALUES (258, 16.125, '2024-02-26 16:39:05');
INSERT INTO `t_temperature` VALUES (259, 16.125, '2024-02-26 16:39:10');
INSERT INTO `t_temperature` VALUES (260, 16.1875, '2024-02-26 16:39:15');
INSERT INTO `t_temperature` VALUES (261, 16.1875, '2024-02-26 16:39:20');
INSERT INTO `t_temperature` VALUES (262, 16.25, '2024-02-26 16:39:26');
INSERT INTO `t_temperature` VALUES (263, 16.1875, '2024-02-26 16:39:31');
INSERT INTO `t_temperature` VALUES (264, 16.25, '2024-02-26 16:39:36');
INSERT INTO `t_temperature` VALUES (265, 16.1875, '2024-02-26 16:39:41');
INSERT INTO `t_temperature` VALUES (266, 16.125, '2024-02-26 16:39:46');
INSERT INTO `t_temperature` VALUES (267, 16.125, '2024-02-26 16:39:51');
INSERT INTO `t_temperature` VALUES (268, 85, '2024-02-26 20:12:07');
INSERT INTO `t_temperature` VALUES (269, 16.6875, '2024-02-26 20:12:12');
INSERT INTO `t_temperature` VALUES (270, 16.6875, '2024-02-26 20:12:17');
INSERT INTO `t_temperature` VALUES (271, 16.75, '2024-02-26 20:12:22');
INSERT INTO `t_temperature` VALUES (272, 16.6875, '2024-02-26 20:12:27');
INSERT INTO `t_temperature` VALUES (273, 16.6875, '2024-02-26 20:12:32');
INSERT INTO `t_temperature` VALUES (274, 16.6875, '2024-02-26 20:12:38');
INSERT INTO `t_temperature` VALUES (275, 16.625, '2024-02-26 20:12:43');
INSERT INTO `t_temperature` VALUES (276, 16.6875, '2024-02-26 20:12:48');
INSERT INTO `t_temperature` VALUES (277, 16.625, '2024-02-26 20:12:53');
INSERT INTO `t_temperature` VALUES (278, 16.625, '2024-02-26 20:12:58');
INSERT INTO `t_temperature` VALUES (279, 16.625, '2024-02-26 20:13:03');
INSERT INTO `t_temperature` VALUES (280, 16.625, '2024-02-26 20:13:08');
INSERT INTO `t_temperature` VALUES (281, 16.625, '2024-02-26 20:13:13');
INSERT INTO `t_temperature` VALUES (282, 16.5625, '2024-02-26 20:13:18');
INSERT INTO `t_temperature` VALUES (283, 16.625, '2024-02-26 20:13:23');
INSERT INTO `t_temperature` VALUES (284, 16.625, '2024-02-26 20:13:29');
INSERT INTO `t_temperature` VALUES (285, 16.6875, '2024-02-26 20:13:34');
INSERT INTO `t_temperature` VALUES (286, 16.6875, '2024-02-26 20:13:39');
INSERT INTO `t_temperature` VALUES (287, 16.625, '2024-02-26 20:13:44');
INSERT INTO `t_temperature` VALUES (288, 16.625, '2024-02-26 20:13:49');
INSERT INTO `t_temperature` VALUES (289, 16.625, '2024-02-26 20:13:54');
INSERT INTO `t_temperature` VALUES (290, 16.6875, '2024-02-26 20:13:59');
INSERT INTO `t_temperature` VALUES (291, 16.6875, '2024-02-26 20:14:04');
INSERT INTO `t_temperature` VALUES (292, 16.6875, '2024-02-26 20:14:09');
INSERT INTO `t_temperature` VALUES (293, 16.6875, '2024-02-26 20:14:14');
INSERT INTO `t_temperature` VALUES (294, 16.6875, '2024-02-26 20:14:20');
INSERT INTO `t_temperature` VALUES (295, 16.6875, '2024-02-26 20:14:25');
INSERT INTO `t_temperature` VALUES (296, 16.6875, '2024-02-26 20:14:30');
INSERT INTO `t_temperature` VALUES (297, 16.6875, '2024-02-26 20:14:35');
INSERT INTO `t_temperature` VALUES (298, 16.6875, '2024-02-26 20:14:40');
INSERT INTO `t_temperature` VALUES (299, 16.625, '2024-02-26 20:14:45');
INSERT INTO `t_temperature` VALUES (300, 16.625, '2024-02-26 20:14:50');
INSERT INTO `t_temperature` VALUES (301, 16.625, '2024-02-26 20:15:16');
INSERT INTO `t_temperature` VALUES (302, 16.75, '2024-02-26 20:15:21');
INSERT INTO `t_temperature` VALUES (303, 16.75, '2024-02-26 20:15:26');
INSERT INTO `t_temperature` VALUES (304, 16.75, '2024-02-26 20:15:31');
INSERT INTO `t_temperature` VALUES (305, 16.8125, '2024-02-26 20:15:36');
INSERT INTO `t_temperature` VALUES (306, 16.75, '2024-02-26 20:15:41');
INSERT INTO `t_temperature` VALUES (307, 16.75, '2024-02-26 20:15:46');
INSERT INTO `t_temperature` VALUES (308, 16.75, '2024-02-26 20:15:52');
INSERT INTO `t_temperature` VALUES (309, 16.75, '2024-02-26 20:15:57');
INSERT INTO `t_temperature` VALUES (310, 16.75, '2024-02-26 20:16:02');
INSERT INTO `t_temperature` VALUES (311, 16.75, '2024-02-26 20:16:07');
INSERT INTO `t_temperature` VALUES (312, 16.8125, '2024-02-26 20:16:12');
INSERT INTO `t_temperature` VALUES (313, 16.875, '2024-02-26 20:16:17');
INSERT INTO `t_temperature` VALUES (314, 16.875, '2024-02-26 20:16:22');
INSERT INTO `t_temperature` VALUES (315, 17, '2024-02-26 20:16:27');
INSERT INTO `t_temperature` VALUES (316, 17.0625, '2024-02-26 20:16:32');
INSERT INTO `t_temperature` VALUES (317, 17.125, '2024-02-26 20:16:37');
INSERT INTO `t_temperature` VALUES (318, 17.1875, '2024-02-26 20:16:43');
INSERT INTO `t_temperature` VALUES (319, 17.375, '2024-02-26 20:16:48');
INSERT INTO `t_temperature` VALUES (320, 17.5, '2024-02-26 20:16:53');
INSERT INTO `t_temperature` VALUES (321, 17.625, '2024-02-26 20:16:58');
INSERT INTO `t_temperature` VALUES (322, 17.6875, '2024-02-26 20:17:03');
INSERT INTO `t_temperature` VALUES (323, 17.75, '2024-02-26 20:17:08');
INSERT INTO `t_temperature` VALUES (324, 17.875, '2024-02-26 20:17:13');
INSERT INTO `t_temperature` VALUES (325, 17.9375, '2024-02-26 20:17:18');
INSERT INTO `t_temperature` VALUES (326, 18.0625, '2024-02-26 20:17:23');
INSERT INTO `t_temperature` VALUES (327, 18.0625, '2024-02-26 20:17:28');
INSERT INTO `t_temperature` VALUES (328, 17.9375, '2024-02-26 20:20:02');
INSERT INTO `t_temperature` VALUES (329, 17.25, '2024-02-26 20:20:07');
INSERT INTO `t_temperature` VALUES (330, 17.25, '2024-02-26 20:20:12');
INSERT INTO `t_temperature` VALUES (331, 17.1875, '2024-02-26 20:20:17');
INSERT INTO `t_temperature` VALUES (332, 17.1875, '2024-02-26 20:20:22');
INSERT INTO `t_temperature` VALUES (333, 17.1875, '2024-02-26 20:20:27');
INSERT INTO `t_temperature` VALUES (334, 17.125, '2024-02-26 20:20:32');
INSERT INTO `t_temperature` VALUES (335, 17.0625, '2024-02-26 20:20:37');
INSERT INTO `t_temperature` VALUES (336, 17.1875, '2024-02-26 20:20:43');
INSERT INTO `t_temperature` VALUES (337, 17.0625, '2024-02-26 20:23:09');
INSERT INTO `t_temperature` VALUES (338, 17, '2024-02-26 20:23:14');
INSERT INTO `t_temperature` VALUES (339, 17, '2024-02-26 20:23:19');
INSERT INTO `t_temperature` VALUES (340, 17, '2024-02-26 20:23:25');
INSERT INTO `t_temperature` VALUES (341, 17, '2024-02-26 20:23:30');
INSERT INTO `t_temperature` VALUES (342, 17, '2024-02-26 20:23:35');
INSERT INTO `t_temperature` VALUES (343, 16.9375, '2024-02-26 20:23:40');
INSERT INTO `t_temperature` VALUES (344, 16.9375, '2024-02-26 20:23:45');
INSERT INTO `t_temperature` VALUES (345, 16.9375, '2024-02-26 20:23:50');
INSERT INTO `t_temperature` VALUES (346, 16.875, '2024-02-26 20:23:55');
INSERT INTO `t_temperature` VALUES (347, 16.875, '2024-02-26 20:24:00');
INSERT INTO `t_temperature` VALUES (348, 16.8125, '2024-02-26 20:24:05');
INSERT INTO `t_temperature` VALUES (349, 16.8125, '2024-02-26 20:24:10');
INSERT INTO `t_temperature` VALUES (350, 16.75, '2024-02-26 20:24:16');
INSERT INTO `t_temperature` VALUES (351, 16.8125, '2024-02-26 20:24:21');
INSERT INTO `t_temperature` VALUES (352, 16.8125, '2024-02-26 20:24:26');
INSERT INTO `t_temperature` VALUES (353, 16.8125, '2024-02-26 20:24:31');
INSERT INTO `t_temperature` VALUES (354, 16.8125, '2024-02-26 20:24:36');
INSERT INTO `t_temperature` VALUES (355, 16.75, '2024-02-26 20:24:41');
INSERT INTO `t_temperature` VALUES (356, 16.8125, '2024-02-26 20:24:46');
INSERT INTO `t_temperature` VALUES (357, 16.8125, '2024-02-26 20:24:51');
INSERT INTO `t_temperature` VALUES (358, 16.8125, '2024-02-26 20:24:56');
INSERT INTO `t_temperature` VALUES (359, 16.8125, '2024-02-26 20:25:01');
INSERT INTO `t_temperature` VALUES (360, 16.75, '2024-02-26 20:25:07');
INSERT INTO `t_temperature` VALUES (361, 16.75, '2024-02-26 20:25:12');
INSERT INTO `t_temperature` VALUES (362, 16.75, '2024-02-26 20:25:17');
INSERT INTO `t_temperature` VALUES (363, 16.75, '2024-02-26 20:25:22');
INSERT INTO `t_temperature` VALUES (364, 16.8125, '2024-02-26 20:25:27');
INSERT INTO `t_temperature` VALUES (365, 16.75, '2024-02-26 20:25:32');
INSERT INTO `t_temperature` VALUES (366, 16.8125, '2024-02-26 20:25:37');
INSERT INTO `t_temperature` VALUES (367, 16.8125, '2024-02-26 20:25:42');
INSERT INTO `t_temperature` VALUES (368, 16.8125, '2024-02-26 20:25:47');
INSERT INTO `t_temperature` VALUES (369, 16.8125, '2024-02-26 20:25:53');
INSERT INTO `t_temperature` VALUES (370, 16.875, '2024-02-26 20:25:58');
INSERT INTO `t_temperature` VALUES (371, 16.875, '2024-02-26 20:26:03');
INSERT INTO `t_temperature` VALUES (372, 16.875, '2024-02-26 20:26:08');
INSERT INTO `t_temperature` VALUES (373, 16.875, '2024-02-26 20:26:13');
INSERT INTO `t_temperature` VALUES (374, 16.875, '2024-02-26 20:26:18');
INSERT INTO `t_temperature` VALUES (375, 16.8125, '2024-02-26 20:26:23');
INSERT INTO `t_temperature` VALUES (376, 16.8125, '2024-02-26 20:26:28');
INSERT INTO `t_temperature` VALUES (377, 16.875, '2024-02-26 20:26:33');
INSERT INTO `t_temperature` VALUES (378, 16.875, '2024-02-26 20:26:38');
INSERT INTO `t_temperature` VALUES (379, 16.875, '2024-02-26 20:26:43');
INSERT INTO `t_temperature` VALUES (380, 16.875, '2024-02-26 20:26:49');
INSERT INTO `t_temperature` VALUES (381, 16.875, '2024-02-26 20:26:54');
INSERT INTO `t_temperature` VALUES (382, 16.875, '2024-02-26 20:26:59');
INSERT INTO `t_temperature` VALUES (383, 16.875, '2024-02-26 20:27:04');
INSERT INTO `t_temperature` VALUES (384, 16.875, '2024-02-26 20:27:09');
INSERT INTO `t_temperature` VALUES (385, 16.9375, '2024-02-26 20:27:14');
INSERT INTO `t_temperature` VALUES (386, 16.9375, '2024-02-26 20:27:19');
INSERT INTO `t_temperature` VALUES (387, 16.9375, '2024-02-26 20:27:24');
INSERT INTO `t_temperature` VALUES (388, 16.875, '2024-02-26 20:27:29');
INSERT INTO `t_temperature` VALUES (389, 16.875, '2024-02-26 20:27:34');
INSERT INTO `t_temperature` VALUES (390, 16.875, '2024-02-26 20:27:39');
INSERT INTO `t_temperature` VALUES (391, 16.8125, '2024-02-26 20:27:45');
INSERT INTO `t_temperature` VALUES (392, 16.875, '2024-02-26 20:27:50');
INSERT INTO `t_temperature` VALUES (393, 16.8125, '2024-02-26 20:27:55');
INSERT INTO `t_temperature` VALUES (394, 16.75, '2024-02-26 20:28:00');
INSERT INTO `t_temperature` VALUES (395, 16.6875, '2024-02-26 20:28:05');
INSERT INTO `t_temperature` VALUES (396, 16.75, '2024-02-26 20:28:10');
INSERT INTO `t_temperature` VALUES (397, 16.8125, '2024-02-26 20:28:15');
INSERT INTO `t_temperature` VALUES (398, 16.875, '2024-02-26 20:28:20');
INSERT INTO `t_temperature` VALUES (399, 16.875, '2024-02-26 20:28:25');
INSERT INTO `t_temperature` VALUES (400, 16.875, '2024-02-26 20:28:30');
INSERT INTO `t_temperature` VALUES (401, 16.875, '2024-02-26 20:28:35');
INSERT INTO `t_temperature` VALUES (402, 16.875, '2024-02-26 20:28:41');
INSERT INTO `t_temperature` VALUES (403, 16.9375, '2024-02-26 20:28:46');
INSERT INTO `t_temperature` VALUES (404, 16.875, '2024-02-26 20:28:51');
INSERT INTO `t_temperature` VALUES (405, 16.8125, '2024-02-26 20:28:56');
INSERT INTO `t_temperature` VALUES (406, 16.8125, '2024-02-26 20:29:01');
INSERT INTO `t_temperature` VALUES (407, 16.8125, '2024-02-26 20:29:06');
INSERT INTO `t_temperature` VALUES (408, 16.875, '2024-02-26 20:29:11');
INSERT INTO `t_temperature` VALUES (409, 16.875, '2024-02-26 20:29:16');
INSERT INTO `t_temperature` VALUES (410, 16.875, '2024-02-26 20:29:21');
INSERT INTO `t_temperature` VALUES (411, 16.875, '2024-02-26 20:29:26');
INSERT INTO `t_temperature` VALUES (412, 16.875, '2024-02-26 20:29:31');
INSERT INTO `t_temperature` VALUES (413, 16.875, '2024-02-26 20:29:36');
INSERT INTO `t_temperature` VALUES (414, 16.875, '2024-02-26 20:29:42');
INSERT INTO `t_temperature` VALUES (415, 16.875, '2024-02-26 20:29:47');
INSERT INTO `t_temperature` VALUES (416, 16.875, '2024-02-26 20:29:52');
INSERT INTO `t_temperature` VALUES (417, 16.9375, '2024-02-26 20:29:57');
INSERT INTO `t_temperature` VALUES (418, 16.9375, '2024-02-26 20:30:02');
INSERT INTO `t_temperature` VALUES (419, 16.875, '2024-02-26 20:30:07');
INSERT INTO `t_temperature` VALUES (420, 16.875, '2024-02-26 20:30:12');
INSERT INTO `t_temperature` VALUES (421, 16.875, '2024-02-26 20:30:17');
INSERT INTO `t_temperature` VALUES (422, 16.875, '2024-02-26 20:30:22');
INSERT INTO `t_temperature` VALUES (423, 16.8125, '2024-02-26 20:30:27');
INSERT INTO `t_temperature` VALUES (424, 16.875, '2024-02-26 20:30:32');
INSERT INTO `t_temperature` VALUES (425, 16.8125, '2024-02-26 20:30:38');
INSERT INTO `t_temperature` VALUES (426, 16.8125, '2024-02-26 20:30:43');
INSERT INTO `t_temperature` VALUES (427, 16.8125, '2024-02-26 20:30:48');
INSERT INTO `t_temperature` VALUES (428, 16.875, '2024-02-26 20:30:53');
INSERT INTO `t_temperature` VALUES (429, 16.8125, '2024-02-26 20:30:58');
INSERT INTO `t_temperature` VALUES (430, 16.8125, '2024-02-26 20:31:03');
INSERT INTO `t_temperature` VALUES (431, 16.8125, '2024-02-26 20:31:08');
INSERT INTO `t_temperature` VALUES (432, 16.8125, '2024-02-26 20:31:13');
INSERT INTO `t_temperature` VALUES (433, 16.8125, '2024-02-26 20:31:18');
INSERT INTO `t_temperature` VALUES (434, 16.8125, '2024-02-26 20:31:23');
INSERT INTO `t_temperature` VALUES (435, 16.75, '2024-02-26 20:31:28');
INSERT INTO `t_temperature` VALUES (436, 16.8125, '2024-02-26 20:31:34');
INSERT INTO `t_temperature` VALUES (437, 16.75, '2024-02-26 20:31:39');
INSERT INTO `t_temperature` VALUES (438, 16.6875, '2024-02-26 20:31:44');
INSERT INTO `t_temperature` VALUES (439, 16.6875, '2024-02-26 20:31:49');
INSERT INTO `t_temperature` VALUES (440, 16.6875, '2024-02-26 20:31:54');
INSERT INTO `t_temperature` VALUES (441, 16.6875, '2024-02-26 20:31:59');
INSERT INTO `t_temperature` VALUES (442, 16.6875, '2024-02-26 20:32:04');
INSERT INTO `t_temperature` VALUES (443, 16.6875, '2024-02-26 20:32:09');
INSERT INTO `t_temperature` VALUES (444, 16.625, '2024-02-26 20:32:14');
INSERT INTO `t_temperature` VALUES (445, 16.625, '2024-02-26 20:32:19');
INSERT INTO `t_temperature` VALUES (446, 16.625, '2024-02-26 20:32:24');
INSERT INTO `t_temperature` VALUES (447, 16.625, '2024-02-26 20:32:30');
INSERT INTO `t_temperature` VALUES (448, 16.5625, '2024-02-26 20:32:35');
INSERT INTO `t_temperature` VALUES (449, 16.5625, '2024-02-26 20:32:40');
INSERT INTO `t_temperature` VALUES (450, 16.5625, '2024-02-26 20:32:45');
INSERT INTO `t_temperature` VALUES (451, 16.5625, '2024-02-26 20:32:50');
INSERT INTO `t_temperature` VALUES (452, 16.5625, '2024-02-26 20:32:55');
INSERT INTO `t_temperature` VALUES (453, 16.5625, '2024-02-26 20:33:00');
INSERT INTO `t_temperature` VALUES (454, 16.5625, '2024-02-26 20:33:05');
INSERT INTO `t_temperature` VALUES (455, 16.5625, '2024-02-26 20:33:10');
INSERT INTO `t_temperature` VALUES (456, 16.5625, '2024-02-26 20:33:15');
INSERT INTO `t_temperature` VALUES (457, 16.5625, '2024-02-26 20:33:20');
INSERT INTO `t_temperature` VALUES (458, 16.5625, '2024-02-26 20:33:26');
INSERT INTO `t_temperature` VALUES (459, 16.625, '2024-02-26 20:33:31');
INSERT INTO `t_temperature` VALUES (460, 16.625, '2024-02-26 20:33:36');
INSERT INTO `t_temperature` VALUES (461, 16.625, '2024-02-26 20:33:41');
INSERT INTO `t_temperature` VALUES (462, 16.5625, '2024-02-26 20:33:46');
INSERT INTO `t_temperature` VALUES (463, 16.5625, '2024-02-26 20:33:51');
INSERT INTO `t_temperature` VALUES (464, 16.5625, '2024-02-26 20:33:56');
INSERT INTO `t_temperature` VALUES (465, 16.5625, '2024-02-26 20:34:01');
INSERT INTO `t_temperature` VALUES (466, 16.5, '2024-02-26 20:34:06');
INSERT INTO `t_temperature` VALUES (467, 16.5, '2024-02-26 20:34:11');
INSERT INTO `t_temperature` VALUES (468, 16.5, '2024-02-26 20:34:16');
INSERT INTO `t_temperature` VALUES (469, 16.5, '2024-02-26 20:34:22');
INSERT INTO `t_temperature` VALUES (470, 16.5, '2024-02-26 20:34:27');
INSERT INTO `t_temperature` VALUES (471, 16.5625, '2024-02-26 20:34:32');
INSERT INTO `t_temperature` VALUES (472, 16.5625, '2024-02-26 20:34:37');
INSERT INTO `t_temperature` VALUES (473, 16.5625, '2024-02-26 20:34:42');
INSERT INTO `t_temperature` VALUES (474, 16.5625, '2024-02-26 20:34:47');
INSERT INTO `t_temperature` VALUES (475, 16.5625, '2024-02-26 20:34:52');
INSERT INTO `t_temperature` VALUES (476, 16.5625, '2024-02-26 20:34:57');
INSERT INTO `t_temperature` VALUES (477, 16.5, '2024-02-26 20:35:02');
INSERT INTO `t_temperature` VALUES (478, 16.5625, '2024-02-26 20:35:07');
INSERT INTO `t_temperature` VALUES (479, 16.5, '2024-02-26 20:35:12');

-- ----------------------------
-- Table structure for t_threshold
-- ----------------------------
DROP TABLE IF EXISTS `t_threshold`;
CREATE TABLE `t_threshold`  (
  `thresholdId` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `upperLimit` float NOT NULL COMMENT '阀值上限',
  `lowerLimit` float NOT NULL COMMENT '阀值下限',
  `addTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成时间',
  PRIMARY KEY (`thresholdId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_threshold
-- ----------------------------
INSERT INTO `t_threshold` VALUES (1, 48.5, 15, '2024-02-25 17:21:15');

SET FOREIGN_KEY_CHECKS = 1;
