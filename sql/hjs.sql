/*
 Navicat Premium Data Transfer

 Source Server         : 192
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:55001
 Source Schema         : hjs

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 05/04/2024 18:01:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_chat
-- ----------------------------
DROP TABLE IF EXISTS `t_chat`;
CREATE TABLE `t_chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `send_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chat_user` (`user_id`),
  CONSTRAINT `fk_chat_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_chat
-- ----------------------------
BEGIN;
INSERT INTO `t_chat` (`id`, `user_id`, `send_time`, `message`) VALUES (3, 2, '2024-04-01 11:25:13', '你好');
INSERT INTO `t_chat` (`id`, `user_id`, `send_time`, `message`) VALUES (4, 2, '2024-04-01 13:19:12', '今天天气不错');
INSERT INTO `t_chat` (`id`, `user_id`, `send_time`, `message`) VALUES (5, 2, '2024-04-01 13:20:05', '我是拓海');
INSERT INTO `t_chat` (`id`, `user_id`, `send_time`, `message`) VALUES (6, 2, '2024-04-01 13:21:34', 'hello');
INSERT INTO `t_chat` (`id`, `user_id`, `send_time`, `message`) VALUES (7, 1, '2024-04-01 14:40:39', 'hello');
COMMIT;

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_course
-- ----------------------------
BEGIN;
INSERT INTO `t_course` (`id`, `name`, `level`, `level_name`, `item_order`, `deleted`, `subject_id`) VALUES (5, '测试课程2', 1, '大一', NULL, b'0', 4);
COMMIT;

-- ----------------------------
-- Table structure for t_exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper`;
CREATE TABLE `t_exam_paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `paper_type` int DEFAULT NULL,
  `grade_level` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  `question_count` int DEFAULT NULL,
  `suggest_time` int DEFAULT NULL,
  `limit_start_time` datetime DEFAULT NULL,
  `limit_end_time` datetime DEFAULT NULL,
  `frame_text_content_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `task_exam_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_exam_paper
-- ----------------------------
BEGIN;
INSERT INTO `t_exam_paper` (`id`, `name`, `subject_id`, `paper_type`, `grade_level`, `score`, `question_count`, `suggest_time`, `limit_start_time`, `limit_end_time`, `frame_text_content_id`, `create_user`, `create_time`, `deleted`, `task_exam_id`) VALUES (2, '计算机测试', 4, 1, 1, 100, 1, 5, NULL, NULL, 5, 2, '2024-04-02 12:10:04', b'0', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_exam_paper_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_answer`;
CREATE TABLE `t_exam_paper_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_paper_id` int DEFAULT NULL,
  `paper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paper_type` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `system_score` int DEFAULT NULL,
  `user_score` int DEFAULT NULL,
  `paper_score` int DEFAULT NULL,
  `question_correct` int DEFAULT NULL,
  `question_count` int DEFAULT NULL,
  `do_time` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `task_exam_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_exam_paper_answer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_exam_paper_question_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_question_customer_answer`;
CREATE TABLE `t_exam_paper_question_customer_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `exam_paper_id` int DEFAULT NULL,
  `exam_paper_answer_id` int DEFAULT NULL,
  `question_type` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `customer_score` int DEFAULT NULL,
  `question_score` int DEFAULT NULL,
  `question_text_content_id` int DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text_content_id` int DEFAULT NULL,
  `do_right` bit(1) DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_exam_paper_question_customer_answer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `is_deleted` int DEFAULT '0',
  `status` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `send_user_id` int DEFAULT NULL,
  `send_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `send_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receive_user_count` int DEFAULT NULL,
  `read_count` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_message_user
-- ----------------------------
DROP TABLE IF EXISTS `t_message_user`;
CREATE TABLE `t_message_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message_id` int DEFAULT NULL,
  `receive_user_id` int DEFAULT NULL,
  `receive_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receive_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `readed` bit(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_message_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_type` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  `grade_level` int DEFAULT NULL,
  `difficult` int DEFAULT NULL,
  `correct` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `info_text_content_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_question
-- ----------------------------
BEGIN;
INSERT INTO `t_question` (`id`, `question_type`, `subject_id`, `score`, `grade_level`, `difficult`, `correct`, `info_text_content_id`, `create_user`, `status`, `create_time`, `deleted`) VALUES (3, 1, 4, 100, 1, 3, 'D', 4, 2, 1, '2024-04-02 12:09:34', b'0');
COMMIT;

-- ----------------------------
-- Table structure for t_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
BEGIN;
INSERT INTO `t_subject` (`id`, `name`, `level`, `level_name`, `item_order`, `deleted`) VALUES (4, '计算机理论', 1, '大一', NULL, b'0');
COMMIT;

-- ----------------------------
-- Table structure for t_task_exam
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam`;
CREATE TABLE `t_task_exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grade_level` int DEFAULT NULL,
  `frame_text_content_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `create_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_task_exam
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_task_exam_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam_customer_answer`;
CREATE TABLE `t_task_exam_customer_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_exam_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `text_content_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_task_exam_customer_answer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_text_content
-- ----------------------------
DROP TABLE IF EXISTS `t_text_content`;
CREATE TABLE `t_text_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_text_content
-- ----------------------------
BEGIN;
INSERT INTO `t_text_content` (`id`, `content`, `create_time`) VALUES (4, '{\"titleContent\":\"<p>以下哪个不是计算机设备</p>\",\"analyze\":\"自己想\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"鼠标\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"键盘\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"显示器\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"大象\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2024-04-02 12:09:34');
INSERT INTO `t_text_content` (`id`, `content`, `create_time`) VALUES (5, '[{\"name\":\"单选\",\"questionItems\":[{\"id\":3,\"itemOrder\":1}]}]', '2024-04-02 12:10:04');
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` int DEFAULT NULL,
  `birth_day` datetime DEFAULT NULL,
  `user_level` int DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `last_active_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` (`id`, `user_uuid`, `user_name`, `password`, `real_name`, `age`, `sex`, `birth_day`, `user_level`, `phone`, `role`, `status`, `image_path`, `create_time`, `modify_time`, `last_active_time`, `deleted`, `wx_open_id`) VALUES (1, 'd2d29da2-dcb3-4013-b874-727626236f47', 'student', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '学生', 18, 1, '2019-09-01 16:00:00', 1, '19171171610', 1, 1, 'https://pic.baike.soso.com/ugc/baikepic2/0/20160728015541-1794165038.jpg/800', '2019-09-07 18:55:02', '2020-02-04 08:26:54', NULL, b'0', NULL);
INSERT INTO `t_user` (`id`, `user_uuid`, `user_name`, `password`, `real_name`, `age`, `sex`, `birth_day`, `user_level`, `phone`, `role`, `status`, `image_path`, `create_time`, `modify_time`, `last_active_time`, `deleted`, `wx_open_id`) VALUES (2, '52045f5f-a13f-4ccc-93dd-f7ee8270ad4c', 'admin', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '管理员', 30, 1, '2019-09-07 18:56:07', NULL, NULL, 3, 1, NULL, '2019-09-07 18:56:21', NULL, NULL, b'0', NULL);
INSERT INTO `t_user` (`id`, `user_uuid`, `user_name`, `password`, `real_name`, `age`, `sex`, `birth_day`, `user_level`, `phone`, `role`, `status`, `image_path`, `create_time`, `modify_time`, `last_active_time`, `deleted`, `wx_open_id`) VALUES (4, '298f12d5-2a63-4c68-97ca-d9dac74b7072', 'teacher', 'KFclGTMzoIthymmxVU2xKNNda/IH9YcNvzfmpIt0r9RSAzUwAkpZY4s+ETI4ZKzRdMTJBcakIYmzatVH3BuBm2GoTPUIyfIiNgFf//iHdd3AwVLe2rPCo11TQVrWvBDsT5M+4grGFzXoZpHDL25L6ITnH4hFYhmuB51fFqq/ub8=', '老师', NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, '2024-03-23 10:32:17', '2024-03-23 10:32:40', '2024-03-23 10:32:17', b'0', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_user_event_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_event_log`;
CREATE TABLE `t_user_event_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user_event_log
-- ----------------------------
BEGIN;
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (1, 3, 'hahaha', NULL, '欢迎 hahaha 注册来到学之思开源考试系统', '2024-03-22 17:08:39');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (2, 3, 'hahaha', NULL, 'hahaha 登录了学之思开源考试系统', '2024-03-22 17:09:00');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (3, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-22 17:12:06');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (4, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-22 17:13:02');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (5, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-22 17:13:22');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (6, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-22 17:17:17');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (7, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-22 17:17:32');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (8, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-22 17:20:29');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (9, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-22 17:20:41');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (10, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-22 17:25:25');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (11, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-22 17:25:49');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (12, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-22 17:26:35');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (13, 1, 'student', '学生', 'student 登出了学之思开源考试系统', '2024-03-22 17:34:20');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (14, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-22 17:35:43');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (15, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 10:22:54');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (16, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 12:03:06');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (17, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 13:12:47');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (18, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 13:47:56');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (19, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 15:08:07');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (20, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 15:18:48');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (21, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 15:26:44');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (22, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 15:33:59');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (23, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 15:53:25');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (24, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 15:57:35');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (25, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 16:04:52');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (26, 2, 'admin', '管理员', 'admin 登出了学之思开源考试系统', '2024-03-23 16:44:54');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (27, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 16:45:04');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (28, 4, 'teacher', '老师', 'teacher 登录了学之思开源考试系统', '2024-03-23 16:51:44');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (29, 4, 'teacher', '老师', 'teacher 登录了学之思开源考试系统', '2024-03-23 16:51:55');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (30, 4, 'teacher', '老师', 'teacher 登录了学之思开源考试系统', '2024-03-23 16:57:32');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (31, 4, 'teacher', '老师', 'teacher 登录了学之思开源考试系统', '2024-03-23 16:59:10');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (32, 4, 'teacher', '老师', 'teacher 登录了学之思开源考试系统', '2024-03-23 16:59:32');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (33, 4, 'teacher', '老师', 'teacher 登录了学之思开源考试系统', '2024-03-23 17:01:09');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (34, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 17:01:59');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (35, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 17:37:30');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (36, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 18:19:44');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (37, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 18:21:56');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (38, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 18:22:44');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (39, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 18:35:06');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (40, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 18:38:42');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (41, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 18:40:35');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (42, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 19:13:16');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (43, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 19:17:11');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (44, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 20:12:06');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (45, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 21:38:54');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (46, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 21:40:15');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (47, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 22:10:28');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (48, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 22:12:50');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (49, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:16:19');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (50, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:17:40');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (51, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:17:53');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (52, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:26:42');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (53, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:26:44');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (54, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:26:51');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (55, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:26:56');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (56, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:27:32');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (57, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:27:48');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (58, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:27:50');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (59, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:28:13');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (60, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:28:14');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (61, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:28:27');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (62, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:28:29');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (63, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:28:45');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (64, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:31:10');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (65, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:31:46');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (66, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:31:47');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (67, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:31:48');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (68, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:31:49');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (69, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:31:49');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (70, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:31:52');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (71, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:33:34');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (72, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:35:33');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (73, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:38:31');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (74, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:38:36');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (75, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:39:01');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (76, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:42:01');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (77, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:42:29');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (78, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:42:41');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (79, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:43:49');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (80, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:43:52');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (81, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:47:11');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (82, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:50:08');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (83, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:50:30');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (84, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:57:29');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (85, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:57:33');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (86, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:57:38');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (87, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:57:39');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (88, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:57:40');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (89, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:57:40');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (90, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:58:07');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (91, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 13:59:10');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (92, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:10:45');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (93, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:10:52');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (94, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:11:07');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (95, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:12:17');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (96, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:12:19');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (97, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:12:20');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (98, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:12:20');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (99, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:12:21');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (100, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:12:47');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (101, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:12:49');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (102, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:14:14');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (103, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:14:22');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (104, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:14:24');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (105, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:17:05');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (106, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:52:34');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (107, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:52:37');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (108, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:53:26');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (109, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:53:59');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (110, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:53:59');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (111, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:55:18');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (112, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:56:21');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (113, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 14:56:24');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (114, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 15:01:52');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (115, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-31 15:01:55');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (116, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-04-01 13:48:16');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (117, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-04-01 13:48:24');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (118, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-04-01 13:48:26');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (119, 2, 'admin', '管理员', 'admin 登录了HJS开源考试系统', '2024-04-01 14:19:32');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (120, 2, 'admin', '管理员', 'admin 登出了HJS开源考试系统', '2024-04-01 14:20:19');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (121, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-01 14:42:13');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (122, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-01 16:07:23');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (123, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-01 17:33:15');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (124, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-01 20:57:00');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (125, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-01 21:36:02');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (126, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-01 21:53:16');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (127, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-01 22:29:27');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (128, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-01 22:37:02');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (129, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-01 22:38:05');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (130, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-01 22:38:45');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (131, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-01 22:39:08');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (132, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-01 22:40:31');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (133, 1, 'student', '学生', 'student 登出了hjs开源考试系统', '2024-04-01 22:49:56');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (134, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-01 22:50:38');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (135, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-02 11:32:36');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (136, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-02 11:36:48');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (137, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-02 11:37:01');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (138, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-02 11:37:25');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (139, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-02 13:05:13');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (140, 2, 'admin', '管理员', 'admin 登出了hjs开源考试系统', '2024-04-02 13:12:16');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (141, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 10:31:07');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (142, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 11:56:52');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (143, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 12:36:54');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (144, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 14:36:19');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (145, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 15:46:40');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (146, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 16:22:59');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (147, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 16:27:19');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (148, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 16:30:28');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (149, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 17:06:03');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (150, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 17:08:33');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (151, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 17:12:23');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (152, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 17:14:13');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (153, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 17:19:15');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (154, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-03 17:26:56');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (155, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-04 16:29:57');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (156, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 17:48:37');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (157, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 17:56:00');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (158, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 18:08:35');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (159, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 18:11:08');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (160, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 18:21:47');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (161, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 18:32:24');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (162, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 18:33:30');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (163, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 18:37:44');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (164, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 18:44:35');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (165, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 18:46:19');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (166, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 18:55:09');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (167, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 19:05:52');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (168, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 19:10:40');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (169, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 19:12:32');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (170, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 19:15:00');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (171, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 19:15:58');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (172, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 19:18:03');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (173, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 19:19:03');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (174, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 19:47:27');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (175, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 19:53:25');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (176, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 19:55:22');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (177, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-04 20:02:11');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (178, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 13:42:52');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (179, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 13:44:00');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (180, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 13:44:48');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (181, 2, 'admin', '管理员', 'admin 登录了hjs开源考试系统', '2024-04-05 13:53:18');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (182, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 13:53:45');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (183, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 13:54:43');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (184, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 13:58:10');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (185, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 13:59:21');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (186, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 14:04:02');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (187, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 14:44:22');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (188, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 14:45:44');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (189, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 14:49:28');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (190, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 14:50:29');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (191, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 14:51:14');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (192, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 14:52:15');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (193, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 15:03:29');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (194, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 15:53:45');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (195, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 15:54:42');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (196, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 16:01:04');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (197, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 16:02:06');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (198, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 16:19:24');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (199, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 16:19:57');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (200, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 16:26:58');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (201, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 16:32:09');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (202, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 16:33:26');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (203, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 16:38:17');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (204, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 17:41:10');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (205, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 17:44:47');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (206, 1, 'student', '学生', 'student 登录了hjs开源考试系统', '2024-04-05 17:59:09');
COMMIT;

-- ----------------------------
-- Table structure for t_user_token
-- ----------------------------
DROP TABLE IF EXISTS `t_user_token`;
CREATE TABLE `t_user_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user_token
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
