 /*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 11/06/2024 22:48:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accumulatedovertime
-- ----------------------------
DROP TABLE IF EXISTS `accumulatedovertime`;
CREATE TABLE `accumulatedovertime`  (
  `employee_id` int NOT NULL COMMENT '员工标识',
  `total_overtime_hours` bigint NOT NULL COMMENT '累计加班小时数',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '累计加班时间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accumulatedovertime
-- ----------------------------
INSERT INTO `accumulatedovertime` VALUES (1, 0);
INSERT INTO `accumulatedovertime` VALUES (2, 74);
INSERT INTO `accumulatedovertime` VALUES (4671947, 186);

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `employee_id` int NOT NULL AUTO_INCREMENT COMMENT '员工唯一标识',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '员工姓名',
  `character_id` int NOT NULL COMMENT '角色标识',
  `omr_account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'OMR账号',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '员工信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employees
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'OvertimeRequests', '加班申请信息表', NULL, NULL, 'OvertimeRequests', 'crud', '', 'com.ruoyi.system', 'system', 'OvertimeRequests', '加班申请信息', 'ruoyi', '0', '/', NULL, 'admin', '2024-05-26 23:43:03', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'OvertimeApprovals', '加班审批信息表', NULL, NULL, 'OvertimeApprovals', 'crud', '', 'com.ruoyi.system', 'system', 'OvertimeApprovals', '加班审批信息', 'ruoyi', '0', '/', NULL, 'admin', '2024-05-27 16:31:59', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'AccumulatedOvertime', '累计加班时间表', NULL, NULL, 'AccumulatedOvertime', 'crud', '', 'com.ruoyi.system', 'system', 'AccumulatedOvertime', '累计加班时间', 'ruoyi', '0', '/', NULL, 'admin', '2024-05-27 21:25:59', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'leaverequests', '调休申请信息表', NULL, NULL, 'Leaverequests', 'crud', '', 'com.ruoyi.system', 'system', 'leaverequests', '调休申请信息', 'ruoyi', '0', '/', NULL, 'admin', '2024-06-11 21:08:04', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'overtime_id', '加班申请唯一标识', 'int', 'Long', 'overtimeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-26 23:43:03', '', '2024-05-30 14:48:25');
INSERT INTO `gen_table_column` VALUES (2, 1, 'employee_id', '申请加班的员工标识', 'int', 'Long', 'employeeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-05-26 23:43:03', '', '2024-05-30 14:48:25');
INSERT INTO `gen_table_column` VALUES (3, 1, 'apply_date', '申请日期', 'date', 'Date', 'applyDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2024-05-26 23:43:04', '', '2024-05-30 14:48:25');
INSERT INTO `gen_table_column` VALUES (4, 1, 'start_time', '加班开始时间', 'datetime', 'Date', 'startTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-05-26 23:43:04', '', '2024-05-30 14:48:25');
INSERT INTO `gen_table_column` VALUES (5, 1, 'end_time', '加班结束时间', 'datetime', 'Date', 'endTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-05-26 23:43:04', '', '2024-05-30 14:48:25');
INSERT INTO `gen_table_column` VALUES (6, 1, 'status', '申请状态（待审批、已批准、已拒绝）', 'enum(\'Pending\',\'Approved\',\'Rejected\')', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2024-05-26 23:43:04', '', '2024-05-30 14:48:25');
INSERT INTO `gen_table_column` VALUES (7, 1, 'reason', '加班原因', 'text', 'String', 'reason', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2024-05-26 23:43:04', '', '2024-05-30 14:48:25');
INSERT INTO `gen_table_column` VALUES (8, 2, 'approval_id', '审批记录唯一标识', 'int', 'Long', 'approvalId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-27 16:31:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, 2, 'overtime_id', '加班申请标识', 'int', 'Long', 'overtimeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-05-27 16:31:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, 2, 'approver_id', '审批人（管理员）标识', 'int', 'Long', 'approverId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-05-27 16:31:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, 2, 'approval_date', '审批日期', 'date', 'Date', 'approvalDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-05-27 16:31:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, 2, 'approval_status', '审批状态（已批准、已拒绝）', 'enum(\'Approved\',\'Rejected\')', 'String', 'approvalStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2024-05-27 16:31:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, 2, 'comments', '审批意见', 'text', 'String', 'comments', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2024-05-27 16:31:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, 3, 'employee_id', '员工标识', 'int', 'Long', 'employeeId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-27 21:25:59', '', '2024-06-11 20:56:31');
INSERT INTO `gen_table_column` VALUES (15, 3, 'total_overtime_hours', '累计加班小时数', 'decimal(10,2)', 'Long', 'totalOvertimeHours', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-05-27 21:25:59', '', '2024-06-11 20:56:31');
INSERT INTO `gen_table_column` VALUES (16, 1, 'overtime_hours', '加班时长（小时）', 'int', 'Long', 'overtimeHours', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, '', '2024-05-30 14:48:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, 7, 'leave_id', '调休申请唯一标识', 'int', 'Long', 'leaveId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-06-11 21:08:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, 7, 'employee_id', '申请调休的员工标识', 'int', 'Long', 'employeeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-06-11 21:08:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, 7, 'apply_date', '申请日期', 'date', 'Date', 'applyDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2024-06-11 21:08:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, 7, 'leave_start_date', '调休开始日期', 'datetime', 'Date', 'leaveStartDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-06-11 21:08:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, 7, 'leave_end_date', '调休结束日期', 'datetime', 'Date', 'leaveEndDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-06-11 21:08:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, 7, 'leave_hours', '调休时长（单位为小时）', 'int', 'Long', 'leaveHours', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-06-11 21:08:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, 7, 'status', '申请状态（待审批、已批准、已拒绝）', 'enum(\'Pending\',\'Approved\',\'Rejected\')', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2024-06-11 21:08:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, 7, 'reason', '调休原因', 'text', 'String', 'reason', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 8, 'admin', '2024-06-11 21:08:04', '', NULL);

-- ----------------------------
-- Table structure for leaveapprovals
-- ----------------------------
DROP TABLE IF EXISTS `leaveapprovals`;
CREATE TABLE `leaveapprovals`  (
  `approval_id` int NOT NULL AUTO_INCREMENT COMMENT '审批记录唯一标识',
  `leave_id` int NOT NULL COMMENT '调休申请标识',
  `approver_id` int NOT NULL COMMENT '审批人（管理员）标识',
  `approval_date` date NOT NULL COMMENT '审批日期',
  `approval_status` enum('Approved','Rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '审批状态（已批准、已拒绝）',
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '审批意见',
  PRIMARY KEY (`approval_id`) USING BTREE,
  INDEX `leave_id`(`leave_id` ASC) USING BTREE,
  INDEX `approver_id`(`approver_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '调休审批信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leaveapprovals
-- ----------------------------

-- ----------------------------
-- Table structure for leavedeductions
-- ----------------------------
DROP TABLE IF EXISTS `leavedeductions`;
CREATE TABLE `leavedeductions`  (
  `deduction_id` int NOT NULL AUTO_INCREMENT COMMENT '扣除记录唯一标识',
  `employee_id` int NOT NULL COMMENT '员工标识',
  `leave_id` int NOT NULL COMMENT '调休申请标识',
  `deducted_hours` decimal(10, 2) NOT NULL COMMENT '扣除的加班小时数',
  PRIMARY KEY (`deduction_id`) USING BTREE,
  INDEX `employee_id`(`employee_id` ASC) USING BTREE,
  INDEX `leave_id`(`leave_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '调休扣除记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leavedeductions
-- ----------------------------

-- ----------------------------
-- Table structure for leaverequests
-- ----------------------------
DROP TABLE IF EXISTS `leaverequests`;
CREATE TABLE `leaverequests`  (
  `leave_id` int NOT NULL AUTO_INCREMENT COMMENT '调休申请唯一标识',
  `employee_id` int NOT NULL COMMENT '申请调休的员工标识',
  `apply_date` date NOT NULL COMMENT '申请日期',
  `leave_start_date` datetime NOT NULL COMMENT '调休开始日期',
  `leave_end_date` datetime NOT NULL COMMENT '调休结束日期',
  `leave_hours` int NOT NULL COMMENT '调休时长（单位为小时）',
  `status` enum('Pending','Approved','Rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申请状态（待审批、已批准、已拒绝）',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '调休原因',
  PRIMARY KEY (`leave_id`) USING BTREE,
  INDEX `employee_id`(`employee_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '调休申请信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leaverequests
-- ----------------------------
INSERT INTO `leaverequests` VALUES (1, 4671947, '2024-06-11', '2024-06-11 00:00:00', '2024-06-13 00:00:00', 12, 'Pending', NULL);
INSERT INTO `leaverequests` VALUES (2, 4671947, '2024-06-11', '2024-06-11 00:00:00', '2024-06-11 00:00:00', 0, 'Pending', NULL);
INSERT INTO `leaverequests` VALUES (3, 4671947, '2024-06-11', '2024-06-11 00:00:00', '2024-06-11 00:00:00', 0, 'Pending', NULL);
INSERT INTO `leaverequests` VALUES (4, 4671947, '2024-06-11', '2024-06-11 00:00:00', '2024-06-11 23:02:00', 9, 'Pending', NULL);
INSERT INTO `leaverequests` VALUES (5, 4671947, '2024-06-11', '2024-06-11 00:00:00', '2024-06-11 23:02:00', 8, 'Pending', NULL);
INSERT INTO `leaverequests` VALUES (6, 4671947, '2024-06-11', '2024-06-11 00:00:00', '2024-06-11 23:02:00', 8, 'Pending', NULL);
INSERT INTO `leaverequests` VALUES (7, 4671947, '2024-06-11', '2024-06-11 00:00:00', '2024-06-11 23:02:00', 8, 'Pending', NULL);
INSERT INTO `leaverequests` VALUES (8, 4671947, '2024-06-11', '2024-06-11 08:30:00', '2024-06-12 17:30:00', 16, 'Pending', 'test=16');
INSERT INTO `leaverequests` VALUES (9, 4671947, '2024-06-11', '2024-06-11 00:00:00', '2024-06-14 00:00:00', 24, 'Pending', 'test=24');

-- ----------------------------
-- Table structure for overtimeapprovals
-- ----------------------------
DROP TABLE IF EXISTS `overtimeapprovals`;
CREATE TABLE `overtimeapprovals`  (
  `approval_id` int NOT NULL AUTO_INCREMENT COMMENT '审批记录唯一标识',
  `overtime_id` int NOT NULL COMMENT '加班申请标识',
  `approver_id` int NOT NULL COMMENT '审批人（管理员）标识',
  `approval_date` date NOT NULL COMMENT '审批日期',
  `approval_status` enum('Approved','Rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '审批状态（已批准、已拒绝）',
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '审批意见',
  PRIMARY KEY (`approval_id`) USING BTREE,
  INDEX `overtime_id`(`overtime_id` ASC) USING BTREE,
  INDEX `approver_id`(`approver_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '加班审批信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of overtimeapprovals
-- ----------------------------

-- ----------------------------
-- Table structure for overtimerequests
-- ----------------------------
DROP TABLE IF EXISTS `overtimerequests`;
CREATE TABLE `overtimerequests`  (
  `overtime_id` int NOT NULL AUTO_INCREMENT COMMENT '加班申请唯一标识',
  `employee_id` int NOT NULL COMMENT '申请加班的员工标识',
  `apply_date` date NOT NULL COMMENT '申请日期',
  `start_time` datetime NOT NULL COMMENT '加班开始时间',
  `end_time` datetime NOT NULL COMMENT '加班结束时间',
  `status` enum('Pending','Approved','Rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申请状态（待审批、已批准、已拒绝）',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '加班原因',
  `overtime_hours` int NOT NULL COMMENT '加班时长（小时）',
  PRIMARY KEY (`overtime_id`) USING BTREE,
  INDEX `employee_id`(`employee_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '加班申请信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of overtimerequests
-- ----------------------------
INSERT INTO `overtimerequests` VALUES (4, 1, '2024-05-27', '2024-05-27 21:05:00', '2024-05-28 00:00:00', 'Approved', '724值班', 0);
INSERT INTO `overtimerequests` VALUES (6, 2, '2024-05-28', '2024-05-29 00:00:00', '2024-05-30 00:00:00', 'Approved', NULL, 24);
INSERT INTO `overtimerequests` VALUES (7, 2, '2024-05-27', '2024-05-28 00:00:00', '2024-05-28 02:02:00', 'Pending', '123', 0);
INSERT INTO `overtimerequests` VALUES (8, 2, '2024-05-27', '2024-05-23 00:00:00', '2024-05-24 00:00:00', 'Approved', '2+24', 24);
INSERT INTO `overtimerequests` VALUES (9, 4671947, '2024-05-27', '2024-05-28 00:00:00', '2024-05-29 00:00:00', 'Approved', '724', 24);
INSERT INTO `overtimerequests` VALUES (10, 4671947, '2024-05-27', '2024-05-30 00:00:00', '2024-05-31 00:00:00', 'Rejected', '123', 24);
INSERT INTO `overtimerequests` VALUES (11, 4671947, '2024-05-27', '2024-05-14 00:00:00', '2024-05-16 00:00:00', 'Rejected', NULL, 48);
INSERT INTO `overtimerequests` VALUES (12, 4671947, '2024-05-27', '2024-05-29 00:00:00', '2024-05-30 00:00:00', 'Rejected', NULL, 24);
INSERT INTO `overtimerequests` VALUES (13, 4671947, '2024-05-27', '2024-05-22 00:00:00', '2024-05-23 00:00:00', 'Rejected', NULL, 24);
INSERT INTO `overtimerequests` VALUES (14, 4671947, '2024-05-27', '2024-05-30 00:00:00', '2024-05-30 08:55:00', 'Approved', NULL, 8);
INSERT INTO `overtimerequests` VALUES (15, 4671947, '2024-05-28', '2024-05-29 00:00:00', '2024-05-29 03:47:00', 'Approved', NULL, 0);
INSERT INTO `overtimerequests` VALUES (16, 4671947, '2024-05-27', '2024-05-22 00:00:00', '2024-05-22 16:49:00', 'Approved', NULL, 16);
INSERT INTO `overtimerequests` VALUES (17, 4671947, '2024-05-28', '2024-05-29 00:00:00', '2024-05-29 12:12:00', 'Approved', NULL, 12);
INSERT INTO `overtimerequests` VALUES (18, 4671947, '2024-05-28', '2024-05-30 08:00:00', '2024-05-30 09:26:00', 'Approved', NULL, 0);
INSERT INTO `overtimerequests` VALUES (19, 4671947, '2024-05-28', '2024-05-29 00:00:00', '2024-05-29 03:56:00', 'Approved', NULL, 0);
INSERT INTO `overtimerequests` VALUES (20, 4671947, '2024-05-09', '2024-05-28 00:00:00', '2024-05-29 00:00:00', 'Approved', NULL, 24);
INSERT INTO `overtimerequests` VALUES (21, 4671947, '2024-05-30', '2024-05-30 00:00:00', '2024-05-30 00:00:00', 'Pending', '测试0小时', 0);
INSERT INTO `overtimerequests` VALUES (22, 4671947, '2024-05-30', '2024-05-30 01:02:00', '2024-05-30 02:10:00', 'Pending', '测试02', 0);
INSERT INTO `overtimerequests` VALUES (23, 4671947, '2024-05-30', '2024-05-30 00:03:00', '2024-05-30 07:15:00', 'Approved', '测试03', 4);
INSERT INTO `overtimerequests` VALUES (24, 4671947, '2024-05-30', '2024-05-30 01:02:00', '2024-05-30 08:13:00', 'Approved', '测试03', 4);
INSERT INTO `overtimerequests` VALUES (25, 4671947, '2024-05-30', '2024-05-30 00:56:00', '2024-05-30 08:59:00', 'Approved', '测试04', 8);
INSERT INTO `overtimerequests` VALUES (26, 4671947, '2024-05-30', '2024-05-30 09:00:00', '2024-05-30 11:00:00', 'Pending', '测试默认日期', 0);
INSERT INTO `overtimerequests` VALUES (27, 4671947, '2024-05-30', '2024-05-30 22:00:00', '2024-05-31 00:00:00', 'Pending', '默认用户测试', 0);
INSERT INTO `overtimerequests` VALUES (28, 1, '2024-06-11', '2024-06-11 20:23:00', '2024-06-12 00:00:00', 'Approved', 'test', 0);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-05-26 23:24:15', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-26 23:24:15', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-05-26 23:24:15', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2024-05-26 23:24:15', 'admin', '2024-05-31 10:21:39', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-05-26 23:24:15', 'admin', '2024-05-31 10:21:45', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-05-26 23:24:15', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-26 23:24:14', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-26 23:24:14', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-26 23:24:14', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-26 23:24:14', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-26 23:24:14', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-26 23:24:14', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-26 23:24:14', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-26 23:24:14', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-26 23:24:14', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-26 23:24:14', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '同意', 'approve', 'sys_oper_type', NULL, 'success', 'N', '0', 'yj', '2024-05-30 16:09:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '拒绝', 'refuse', 'sys_oper_type', NULL, 'danger', 'N', '0', 'yj', '2024-05-30 16:09:49', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-05-26 23:24:15', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-05-26 23:24:15', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-05-26 23:24:15', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-05-26 23:24:15', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 191 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '192.168.0.109', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-26 23:41:09');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-27 14:41:50');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-27 16:03:32');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-27 20:32:52');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-27 22:41:41');
INSERT INTO `sys_logininfor` VALUES (105, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '1', '用户不存在/密码错误', '2024-05-27 22:41:54');
INSERT INTO `sys_logininfor` VALUES (106, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '1', '用户不存在/密码错误', '2024-05-27 22:41:57');
INSERT INTO `sys_logininfor` VALUES (107, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-27 22:42:03');
INSERT INTO `sys_logininfor` VALUES (108, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-27 22:42:19');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '1', '验证码错误', '2024-05-27 22:42:23');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-27 22:42:26');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-27 23:10:17');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-27 23:10:22');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-27 23:12:58');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-27 23:13:04');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-27 23:24:13');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-27 23:24:21');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-27 23:31:24');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-27 23:31:29');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-27 23:50:10');
INSERT INTO `sys_logininfor` VALUES (120, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '1', '用户不存在/密码错误', '2024-05-27 23:50:19');
INSERT INTO `sys_logininfor` VALUES (121, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-27 23:50:27');
INSERT INTO `sys_logininfor` VALUES (122, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-27 23:50:38');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-27 23:50:43');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-27 23:51:36');
INSERT INTO `sys_logininfor` VALUES (125, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '1', '用户不存在/密码错误', '2024-05-27 23:51:42');
INSERT INTO `sys_logininfor` VALUES (126, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-27 23:51:51');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-29 21:13:02');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-29 21:43:23');
INSERT INTO `sys_logininfor` VALUES (129, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '1', '用户不存在/密码错误', '2024-05-29 21:43:45');
INSERT INTO `sys_logininfor` VALUES (130, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-29 21:43:53');
INSERT INTO `sys_logininfor` VALUES (131, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-29 21:44:05');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-29 21:44:08');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-29 21:44:51');
INSERT INTO `sys_logininfor` VALUES (134, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '1', '验证码错误', '2024-05-29 21:45:01');
INSERT INTO `sys_logininfor` VALUES (135, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '1', '用户不存在/密码错误', '2024-05-29 21:45:04');
INSERT INTO `sys_logininfor` VALUES (136, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-29 21:45:09');
INSERT INTO `sys_logininfor` VALUES (137, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-29 21:46:07');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-29 21:46:10');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-29 21:46:22');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-29 21:46:27');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-29 21:46:40');
INSERT INTO `sys_logininfor` VALUES (142, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-29 21:46:47');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '1', '验证码已失效', '2024-05-30 10:53:00');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 10:53:05');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 10:54:35');
INSERT INTO `sys_logininfor` VALUES (146, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 10:54:45');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 14:21:11');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 14:21:39');
INSERT INTO `sys_logininfor` VALUES (149, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 14:21:50');
INSERT INTO `sys_logininfor` VALUES (150, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '1', '用户不存在/密码错误', '2024-05-30 15:40:53');
INSERT INTO `sys_logininfor` VALUES (151, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 15:40:59');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 19:07:46');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 19:16:05');
INSERT INTO `sys_logininfor` VALUES (154, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 19:16:12');
INSERT INTO `sys_logininfor` VALUES (155, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 19:31:44');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 19:31:51');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 19:51:13');
INSERT INTO `sys_logininfor` VALUES (158, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 19:51:21');
INSERT INTO `sys_logininfor` VALUES (159, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 19:51:27');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 19:51:29');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 19:53:07');
INSERT INTO `sys_logininfor` VALUES (162, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 19:53:13');
INSERT INTO `sys_logininfor` VALUES (163, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 19:54:37');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 19:54:40');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 19:57:50');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 19:57:55');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 19:59:28');
INSERT INTO `sys_logininfor` VALUES (168, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 19:59:35');
INSERT INTO `sys_logininfor` VALUES (169, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 21:09:24');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 21:09:29');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 21:09:38');
INSERT INTO `sys_logininfor` VALUES (172, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 21:09:46');
INSERT INTO `sys_logininfor` VALUES (173, 'yj', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-30 23:12:30');
INSERT INTO `sys_logininfor` VALUES (174, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-30 23:13:00');
INSERT INTO `sys_logininfor` VALUES (175, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '1', '用户不存在/密码错误', '2024-05-31 09:04:37');
INSERT INTO `sys_logininfor` VALUES (176, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-31 09:04:46');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-31 10:19:01');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-31 10:21:53');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-31 10:21:58');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-31 10:22:45');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-31 10:57:09');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-31 11:01:04');
INSERT INTO `sys_logininfor` VALUES (183, '188888', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '注册成功', '2024-05-31 11:01:20');
INSERT INTO `sys_logininfor` VALUES (184, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-31 11:02:40');
INSERT INTO `sys_logininfor` VALUES (185, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-31 11:14:44');
INSERT INTO `sys_logininfor` VALUES (186, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-31 11:14:51');
INSERT INTO `sys_logininfor` VALUES (187, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-31 12:07:32');
INSERT INTO `sys_logininfor` VALUES (188, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '退出成功', '2024-05-31 12:27:12');
INSERT INTO `sys_logininfor` VALUES (189, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Mac OS X', '0', '登录成功', '2024-05-31 12:27:19');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 20:22:49');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 20:26:20');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-11 21:34:56');
INSERT INTO `sys_logininfor` VALUES (193, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 21:35:02');
INSERT INTO `sys_logininfor` VALUES (194, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-11 21:36:02');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 21:36:10');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-11 21:36:30');
INSERT INTO `sys_logininfor` VALUES (197, '4671947', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-11 21:36:37');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2046 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-05-26 23:24:14', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-05-26 23:24:14', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-05-26 23:24:14', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-05-26 23:24:14', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-05-26 23:24:14', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-05-26 23:24:14', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-05-26 23:24:14', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-05-26 23:24:14', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-05-26 23:24:14', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-05-26 23:24:14', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-05-26 23:24:14', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-05-26 23:24:14', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-05-26 23:24:14', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-05-26 23:24:14', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-05-26 23:24:14', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-05-26 23:24:14', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-05-26 23:24:14', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-05-26 23:24:14', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-05-26 23:24:14', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-05-26 23:24:14', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-05-26 23:24:14', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-05-26 23:24:14', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-05-26 23:24:14', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '加班管理', 0, 4, 'overtime', NULL, NULL, 1, 0, 'M', '0', '0', '', 'date', 'admin', '2024-05-30 19:37:22', 'admin', '2024-05-30 19:50:35', '');
INSERT INTO `sys_menu` VALUES (2028, '加班申请信息', 2027, 1, 'OvertimeRequests', 'system/OvertimeRequests/index', NULL, 1, 0, 'C', '0', '0', 'system:OvertimeRequests:list', 'form', 'admin', '2024-05-30 19:39:28', 'admin', '2024-05-30 19:44:40', '加班申请信息菜单');
INSERT INTO `sys_menu` VALUES (2029, '加班申请信息查询', 2028, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:OvertimeRequests:query', '#', 'admin', '2024-05-30 19:39:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '加班申请信息新增', 2028, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:OvertimeRequests:add', '#', 'admin', '2024-05-30 19:39:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '加班申请信息修改', 2028, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:OvertimeRequests:edit', '#', 'admin', '2024-05-30 19:39:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '加班申请信息删除', 2028, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:OvertimeRequests:remove', '#', 'admin', '2024-05-30 19:39:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '加班申请信息导出', 2028, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:OvertimeRequests:export', '#', 'admin', '2024-05-30 19:39:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '加班审批信息', 2027, 2, 'OvertimeApprovals', 'system/OvertimeApprovals/index', NULL, 1, 0, 'C', '0', '0', 'system:OvertimeApprovals:list', 'search', 'admin', '2024-05-30 19:40:58', 'admin', '2024-05-30 19:44:56', '加班审批信息菜单');
INSERT INTO `sys_menu` VALUES (2035, '加班审批信息查询', 2034, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:OvertimeApprovals:query', '#', 'admin', '2024-05-30 19:40:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '加班审批信息新增', 2034, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:OvertimeApprovals:add', '#', 'admin', '2024-05-30 19:40:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '加班审批信息修改', 2034, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:OvertimeApprovals:edit', '#', 'admin', '2024-05-30 19:40:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '加班审批信息删除', 2034, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:OvertimeApprovals:remove', '#', 'admin', '2024-05-30 19:40:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '加班审批信息导出', 2034, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:OvertimeApprovals:export', '#', 'admin', '2024-05-30 19:40:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '累计加班时间', 2027, 3, 'AccumulatedOvertime', 'system/AccumulatedOvertime/index', NULL, 1, 0, 'C', '1', '0', 'system:AccumulatedOvertime:list', '#', 'admin', '2024-05-30 19:56:55', 'admin', '2024-05-30 19:58:42', '累计加班时间菜单');
INSERT INTO `sys_menu` VALUES (2041, '累计加班时间查询', 2040, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:AccumulatedOvertime:query', '#', 'admin', '2024-05-30 19:56:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '累计加班时间新增', 2040, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:AccumulatedOvertime:add', '#', 'admin', '2024-05-30 19:56:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '累计加班时间修改', 2040, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:AccumulatedOvertime:edit', '#', 'admin', '2024-05-30 19:56:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '累计加班时间删除', 2040, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:AccumulatedOvertime:remove', '#', 'admin', '2024-05-30 19:56:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '累计加班时间导出', 2040, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:AccumulatedOvertime:export', '#', 'admin', '2024-05-30 19:56:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '调休申请信息', 3, 1, 'leaverequests', 'system/leaverequests/index', NULL, 1, 0, 'C', '0', '0', 'system:leaverequests:list', '#', 'admin', '2024-06-11 20:43:04', '', NULL, '调休申请信息菜单');
INSERT INTO `sys_menu` VALUES (2047, '调休申请信息查询', 2046, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:leaverequests:query', '#', 'admin', '2024-06-11 20:43:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '调休申请信息新增', 2046, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:leaverequests:add', '#', 'admin', '2024-06-11 20:43:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '调休申请信息修改', 2046, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:leaverequests:edit', '#', 'admin', '2024-06-11 20:43:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '调休申请信息删除', 2046, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:leaverequests:remove', '#', 'admin', '2024-06-11 20:43:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '调休申请信息导出', 2046, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:leaverequests:export', '#', 'admin', '2024-06-11 20:43:04', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-05-26 23:24:15', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-05-26 23:24:15', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 241 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '192.168.0.109', '内网IP', '{\"tables\":\"OvertimeRequests\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-26 23:43:04', 92);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '192.168.0.109', '内网IP', '{\"tables\":\"OvertimeRequests\"}', NULL, 0, NULL, '2024-05-26 23:43:06', 214);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"time\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"加班申请\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"OvertimeRequests\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:05:43', 27);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"time\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"加班申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"OvertimeRequests/OvertimeRequests\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:06:47', 18);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-27 16:06:47\",\"icon\":\"time\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"加班申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"OvertimeRequests/OvertimeRequests/index.vue\",\"perms\":\"OvertimeRequests:OvertimeRequests\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:08:29', 12);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"OvertimeRequests/OvertimeRequests/index.vue\",\"createTime\":\"2024-05-27 16:06:47\",\"icon\":\"time\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"加班申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"OvertimeRequests/OvertimeRequests/index.vue\",\"perms\":\"OvertimeRequests:OvertimeRequests\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:08:40', 16);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"OvertimeRequests/OvertimeRequests/index.vue\",\"createTime\":\"2024-05-27 16:06:47\",\"icon\":\"time\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"加班申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"OvertimeRequests/OvertimeRequests/index\",\"perms\":\"OvertimeRequests:OvertimeRequests\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:08:55', 12);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"OvertimeRequests/OvertimeRequests/index.vue\",\"createTime\":\"2024-05-27 16:06:47\",\"icon\":\"time\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"加班申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"OvertimeRequests\",\"perms\":\"OvertimeRequests:OvertimeRequests\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:09:36', 16);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"OvertimeRequests/OvertimeRequests/index.vue\",\"createTime\":\"2024-05-27 16:06:47\",\"icon\":\"time\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"加班申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"OvertimeRequests\",\"perms\":\"OvertimeRequests:OvertimeRequests:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:09:59', 16);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"OvertimeRequests/OvertimeRequests/index\",\"createTime\":\"2024-05-27 16:06:47\",\"icon\":\"time\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"加班申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"OvertimeRequests\",\"perms\":\"OvertimeRequests:OvertimeRequests:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:10:17', 15);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增申请\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"perms\":\"OvertimeRequests:OvertimeRequests:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:11:09', 15);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"OvertimeRequests/index\",\"createTime\":\"2024-05-27 16:06:47\",\"icon\":\"time\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"加班申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"OvertimeRequests\",\"perms\":\"OvertimeRequests:OvertimeRequests:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:15:07', 11);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"OvertimeRequests/index\",\"createTime\":\"2024-05-27 16:06:47\",\"icon\":\"time\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"加班申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"OvertimeRequests\",\"perms\":\"system:OvertimeRequests:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:30:16', 28);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-27 16:05:43\",\"icon\":\"time\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"加班申请\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:30:23', 13);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"OvertimeApprovals\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:31:59', 85);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"OvertimeApprovals\"}', NULL, 0, NULL, '2024-05-27 16:32:03', 191);
INSERT INTO `sys_oper_log` VALUES (116, '加班审批信息', 1, 'com.ruoyi.system.controller.OvertimeApprovalsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeApprovals', '127.0.0.1', '内网IP', '{\"approvalDate\":\"2024-05-20\",\"approverId\":123,\"comments\":\"12\",\"overtimeId\":4671947,\"params\":{}}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimeapprovals`, CONSTRAINT `overtimeapprovals_ibfk_1` FOREIGN KEY (`overtime_id`) REFERENCES `overtimerequests` (`overtime_id`))\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/OvertimeApprovalsMapper.xml]\n### The error may involve com.ruoyi.system.mapper.OvertimeApprovalsMapper.insertOvertimeApprovals-Inline\n### The error occurred while setting parameters\n### SQL: insert into OvertimeApprovals          ( overtime_id,             approver_id,             approval_date,                          comments )           values ( ?,             ?,             ?,                          ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimeapprovals`, CONSTRAINT `overtimeapprovals_ibfk_1` FOREIGN KEY (`overtime_id`) REFERENCES `overtimerequests` (`overtime_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimeapprovals`, CONSTRAINT `overtimeapprovals_ibfk_1` FOREIGN KEY (`overtime_id`) REFERENCES `overtimerequests` (`overtime_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimeapprovals`, CONSTRAINT `overtimeapprovals_ibfk_1` FOREIGN KEY (`overtime_id`) REFERENCES `overtimerequests` (`overtime_id`))', '2024-05-27 16:36:51', 87);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-05-27 16:41:00', 13);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-05-27 16:41:46', 9);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:43:23', 19);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:43:27', 10);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:43:30', 16);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-05-27 16:43:32', 7);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2009', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-05-27 16:44:21', 4);
INSERT INTO `sys_oper_log` VALUES (124, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27\",\"employeeId\":4671947,\"endTime\":\"2024-05-28\",\"params\":{},\"reason\":\"123\",\"startTime\":\"2024-05-27\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimerequests`, CONSTRAINT `overtimerequests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/OvertimeRequestsMapper.xml]\n### The error may involve com.ruoyi.system.mapper.OvertimeRequestsMapper.insertOvertimeRequests-Inline\n### The error occurred while setting parameters\n### SQL: insert into OvertimeRequests          ( employee_id,             apply_date,             start_time,             end_time,                          reason )           values ( ?,             ?,             ?,             ?,                          ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimerequests`, CONSTRAINT `overtimerequests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimerequests`, CONSTRAINT `overtimerequests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimerequests`, CONSTRAINT `overtimerequests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))', '2024-05-27 16:49:25', 83);
INSERT INTO `sys_oper_log` VALUES (125, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27\",\"employeeId\":4671947,\"endTime\":\"2024-05-28\",\"params\":{},\"reason\":\"123\",\"startTime\":\"2024-05-27\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimerequests`, CONSTRAINT `overtimerequests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/OvertimeRequestsMapper.xml]\n### The error may involve com.ruoyi.system.mapper.OvertimeRequestsMapper.insertOvertimeRequests-Inline\n### The error occurred while setting parameters\n### SQL: insert into OvertimeRequests          ( employee_id,             apply_date,             start_time,             end_time,                          reason )           values ( ?,             ?,             ?,             ?,                          ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimerequests`, CONSTRAINT `overtimerequests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimerequests`, CONSTRAINT `overtimerequests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimerequests`, CONSTRAINT `overtimerequests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))', '2024-05-27 16:49:26', 10);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"加班调休\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"system\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:55:26', 23);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2016', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:59:31', 18);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2017', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:59:33', 17);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2018', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:59:35', 15);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2019', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:59:37', 17);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2020', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 16:59:38', 15);
INSERT INTO `sys_oper_log` VALUES (132, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27\",\"employeeId\":123,\"endTime\":\"2024-05-28\",\"params\":{},\"reason\":\"123\",\"startTime\":\"2024-05-28\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimerequests`, CONSTRAINT `overtimerequests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/OvertimeRequestsMapper.xml]\n### The error may involve com.ruoyi.system.mapper.OvertimeRequestsMapper.insertOvertimeRequests-Inline\n### The error occurred while setting parameters\n### SQL: insert into OvertimeRequests          ( employee_id,             apply_date,             start_time,             end_time,                          reason )           values ( ?,             ?,             ?,             ?,                          ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimerequests`, CONSTRAINT `overtimerequests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimerequests`, CONSTRAINT `overtimerequests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`overtimerequests`, CONSTRAINT `overtimerequests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))', '2024-05-27 20:33:20', 79);
INSERT INTO `sys_oper_log` VALUES (133, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27\",\"employeeId\":1,\"endTime\":\"2024-05-28\",\"overtimeId\":4,\"params\":{},\"startTime\":\"2024-05-27\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 20:43:24', 13);
INSERT INTO `sys_oper_log` VALUES (134, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27\",\"employeeId\":1,\"endTime\":\"2024-05-28\",\"overtimeId\":4,\"params\":{},\"reason\":\"724值班\",\"startTime\":\"2024-05-27\",\"status\":\"Pending\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 20:44:28', 12);
INSERT INTO `sys_oper_log` VALUES (135, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27\",\"employeeId\":2,\"endTime\":\"2024-05-29\",\"overtimeId\":5,\"params\":{},\"reason\":\"2405投产\",\"startTime\":\"2024-05-15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 20:44:49', 11);
INSERT INTO `sys_oper_log` VALUES (136, '加班申请信息', 5, 'com.ruoyi.system.controller.OvertimeRequestsController.export()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-05-27 20:44:53', 757);
INSERT INTO `sys_oper_log` VALUES (137, '加班申请信息', 3, 'com.ruoyi.system.controller.OvertimeRequestsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/OvertimeRequests/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 20:52:22', 12);
INSERT INTO `sys_oper_log` VALUES (138, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-28\",\"employeeId\":2,\"endTime\":\"2024-05-30\",\"overtimeId\":6,\"params\":{},\"startTime\":\"2024-05-29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 21:01:50', 14);
INSERT INTO `sys_oper_log` VALUES (139, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27\",\"employeeId\":1,\"endTime\":\"2024-05-28\",\"overtimeId\":4,\"params\":{},\"reason\":\"724值班\",\"startTime\":\"2024-05-27\",\"status\":\"Pending\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 21:03:55', 4);
INSERT INTO `sys_oper_log` VALUES (140, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 00:00\",\"employeeId\":1,\"endTime\":\"2024-05-28 00:00\",\"overtimeId\":4,\"params\":{},\"reason\":\"724值班\",\"startTime\":\"2024-05-27 21:05\",\"status\":\"Pending\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 21:05:49', 21);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"AccumulatedOvertime\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 21:25:59', 61);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"OvertimeRequests\"}', NULL, 0, NULL, '2024-05-27 21:26:08', 231);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"AccumulatedOvertime\"}', NULL, 0, NULL, '2024-05-27 21:26:59', 39);
INSERT INTO `sys_oper_log` VALUES (144, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 21:44\",\"employeeId\":2,\"endTime\":\"2024-05-28 04:18\",\"params\":{},\"reason\":\"724值班\",\"startTime\":\"2024-05-28 02:00\"}', NULL, 1, 'java.util.Date cannot be cast to java.time.temporal.Temporal', '2024-05-27 21:44:58', 20);
INSERT INTO `sys_oper_log` VALUES (145, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 21:50\",\"employeeId\":2,\"endTime\":\"2024-05-28 04:12\",\"params\":{},\"reason\":\"12345\",\"startTime\":\"2024-05-28 02:00\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/AccumulatedOvertimeMapper.xml]\n### The error may involve com.ruoyi.system.mapper.AccumulatedOvertimeMapper.insertAccumulatedOvertime-Inline\n### The error occurred while setting parameters\n### SQL: insert into AccumulatedOvertime          ( employee_id,             total_overtime_hours )           values ( ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))', '2024-05-27 21:50:25', 102);
INSERT INTO `sys_oper_log` VALUES (146, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 21:53\",\"employeeId\":2,\"endTime\":\"2024-05-28 02:02\",\"params\":{},\"startTime\":\"2024-05-28 00:00\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/AccumulatedOvertimeMapper.xml]\n### The error may involve com.ruoyi.system.mapper.AccumulatedOvertimeMapper.insertAccumulatedOvertime-Inline\n### The error occurred while setting parameters\n### SQL: insert into AccumulatedOvertime          ( employee_id,             total_overtime_hours )           values ( ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))', '2024-05-27 21:54:17', 41867);
INSERT INTO `sys_oper_log` VALUES (147, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 21:54\",\"employeeId\":2,\"endTime\":\"2024-05-28 02:02\",\"params\":{},\"startTime\":\"2024-05-28 00:00\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/AccumulatedOvertimeMapper.xml]\n### The error may involve com.ruoyi.system.mapper.AccumulatedOvertimeMapper.insertAccumulatedOvertime-Inline\n### The error occurred while setting parameters\n### SQL: insert into AccumulatedOvertime          ( employee_id,             total_overtime_hours )           values ( ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))', '2024-05-27 21:55:00', 101);
INSERT INTO `sys_oper_log` VALUES (148, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 21:55\",\"employeeId\":2,\"endTime\":\"2024-05-28 01:32\",\"params\":{},\"startTime\":\"2024-05-28 00:00\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/AccumulatedOvertimeMapper.xml]\n### The error may involve com.ruoyi.system.mapper.AccumulatedOvertimeMapper.insertAccumulatedOvertime-Inline\n### The error occurred while setting parameters\n### SQL: insert into AccumulatedOvertime          ( employee_id,             total_overtime_hours )           values ( ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))', '2024-05-27 21:56:06', 96);
INSERT INTO `sys_oper_log` VALUES (149, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 21:55\",\"employeeId\":2,\"endTime\":\"2024-05-28 01:32\",\"params\":{},\"startTime\":\"2024-05-28 00:00\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/AccumulatedOvertimeMapper.xml]\n### The error may involve com.ruoyi.system.mapper.AccumulatedOvertimeMapper.insertAccumulatedOvertime-Inline\n### The error occurred while setting parameters\n### SQL: insert into AccumulatedOvertime          ( employee_id,             total_overtime_hours )           values ( ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry-vue`.`accumulatedovertime`, CONSTRAINT `accumulatedovertime_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))', '2024-05-27 22:02:33', 334186);
INSERT INTO `sys_oper_log` VALUES (150, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 22:07\",\"employeeId\":2,\"endTime\":\"2024-05-28 02:02\",\"overtimeId\":7,\"params\":{},\"reason\":\"123\",\"startTime\":\"2024-05-28 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 22:08:12', 17453);
INSERT INTO `sys_oper_log` VALUES (151, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 22:08\",\"employeeId\":2,\"endTime\":\"2024-05-29 05:02\",\"params\":{},\"reason\":\"123\",\"startTime\":\"2024-05-29 00:00\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'accumulatedovertime.PRIMARY\'\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/AccumulatedOvertimeMapper.xml]\n### The error may involve com.ruoyi.system.mapper.AccumulatedOvertimeMapper.insertAccumulatedOvertime-Inline\n### The error occurred while setting parameters\n### SQL: insert into AccumulatedOvertime          ( employee_id,             total_overtime_hours )           values ( ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'accumulatedovertime.PRIMARY\'\n; Duplicate entry \'2\' for key \'accumulatedovertime.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'accumulatedovertime.PRIMARY\'', '2024-05-27 22:08:55', 95);
INSERT INTO `sys_oper_log` VALUES (152, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 22:10\",\"employeeId\":2,\"endTime\":\"2024-05-17 00:00\",\"params\":{},\"startTime\":\"2024-05-16 00:00\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'accumulatedovertime.PRIMARY\'\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/AccumulatedOvertimeMapper.xml]\n### The error may involve com.ruoyi.system.mapper.AccumulatedOvertimeMapper.insertAccumulatedOvertime-Inline\n### The error occurred while setting parameters\n### SQL: insert into AccumulatedOvertime          ( employee_id,             total_overtime_hours )           values ( ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'accumulatedovertime.PRIMARY\'\n; Duplicate entry \'2\' for key \'accumulatedovertime.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'accumulatedovertime.PRIMARY\'', '2024-05-27 22:10:56', 18);
INSERT INTO `sys_oper_log` VALUES (153, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-15 00:00\",\"employeeId\":2,\"endTime\":\"2024-05-17 00:00\",\"params\":{},\"startTime\":\"2024-05-16 00:00\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'accumulatedovertime.PRIMARY\'\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/AccumulatedOvertimeMapper.xml]\n### The error may involve com.ruoyi.system.mapper.AccumulatedOvertimeMapper.insertAccumulatedOvertime-Inline\n### The error occurred while setting parameters\n### SQL: insert into AccumulatedOvertime          ( employee_id,             total_overtime_hours )           values ( ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'accumulatedovertime.PRIMARY\'\n; Duplicate entry \'2\' for key \'accumulatedovertime.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'accumulatedovertime.PRIMARY\'', '2024-05-27 22:14:07', 134943);
INSERT INTO `sys_oper_log` VALUES (154, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 22:14\",\"employeeId\":2,\"endTime\":\"2024-05-24 00:00\",\"overtimeId\":8,\"params\":{},\"reason\":\"2+24\",\"startTime\":\"2024-05-23 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 22:15:00', 62);
INSERT INTO `sys_oper_log` VALUES (155, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 22:29\",\"employeeId\":4671947,\"endTime\":\"2024-05-29 00:00\",\"overtimeId\":9,\"params\":{},\"reason\":\"724\",\"startTime\":\"2024-05-28 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 22:29:28', 20);
INSERT INTO `sys_oper_log` VALUES (156, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 22:29\",\"employeeId\":4671947,\"endTime\":\"2024-05-31 00:00\",\"overtimeId\":10,\"params\":{},\"reason\":\"123\",\"startTime\":\"2024-05-30 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 22:29:53', 19);
INSERT INTO `sys_oper_log` VALUES (157, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 22:31\",\"employeeId\":4671947,\"endTime\":\"2024-05-16 00:00\",\"overtimeId\":11,\"params\":{},\"startTime\":\"2024-05-14 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 22:32:04', 66);
INSERT INTO `sys_oper_log` VALUES (158, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 22:32\",\"employeeId\":4671947,\"endTime\":\"2024-05-30 00:00\",\"overtimeId\":12,\"params\":{},\"startTime\":\"2024-05-29 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 22:33:45', 57462);
INSERT INTO `sys_oper_log` VALUES (159, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 22:35\",\"employeeId\":4671947,\"endTime\":\"2024-05-23 00:00\",\"overtimeId\":13,\"params\":{},\"startTime\":\"2024-05-22 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 22:35:30', 98);
INSERT INTO `sys_oper_log` VALUES (160, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 00:00\",\"employeeId\":4671947,\"endTime\":\"2024-05-30 08:55\",\"overtimeId\":14,\"params\":{},\"startTime\":\"2024-05-30 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 22:36:13', 19);
INSERT INTO `sys_oper_log` VALUES (161, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-28 00:00\",\"employeeId\":4671947,\"endTime\":\"2024-05-29 03:47\",\"overtimeId\":15,\"params\":{},\"startTime\":\"2024-05-29 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 22:37:05', 19);
INSERT INTO `sys_oper_log` VALUES (162, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-27 22:37\",\"employeeId\":4671947,\"endTime\":\"2024-05-22 16:49\",\"overtimeId\":16,\"params\":{},\"startTime\":\"2024-05-22 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 22:38:58', 65141);
INSERT INTO `sys_oper_log` VALUES (163, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"yj\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":4671947,\"userName\":\"yj\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 22:40:29', 25);
INSERT INTO `sys_oper_log` VALUES (164, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":4671947}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 22:41:23', 118);
INSERT INTO `sys_oper_log` VALUES (165, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginDate\":\"2024-05-27 23:50:27\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"yj\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":4671947,\"userName\":\"yj\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 23:51:04', 33);
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2015', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 23:51:17', 12);
INSERT INTO `sys_oper_log` VALUES (167, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-26 23:24:14\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[3,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,2003,2004,2005,2006,2007,2008,2021,2022,2023,2024,2025,2026,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-27 23:51:33', 35);
INSERT INTO `sys_oper_log` VALUES (168, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-28 00:20\",\"employeeId\":4671947,\"endTime\":\"2024-05-29 11:12\",\"overtimeId\":17,\"params\":{},\"startTime\":\"2024-05-29 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-28 00:20:41', 62);
INSERT INTO `sys_oper_log` VALUES (169, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-28 00:20\",\"employeeId\":4671947,\"endTime\":\"2024-05-30 09:26\",\"overtimeId\":18,\"params\":{},\"startTime\":\"2024-05-30 08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-28 00:21:17', 17);
INSERT INTO `sys_oper_log` VALUES (170, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-28 00:22\",\"employeeId\":4671947,\"endTime\":\"2024-05-29 03:56\",\"overtimeId\":19,\"params\":{},\"startTime\":\"2024-05-29 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-28 00:22:25', 19);
INSERT INTO `sys_oper_log` VALUES (171, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-09\",\"employeeId\":4671947,\"endTime\":\"2024-05-29 00:00\",\"overtimeId\":20,\"params\":{},\"startTime\":\"2024-05-28 00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-28 00:40:35', 54);
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"OvertimeRequests\"}', NULL, 0, NULL, '2024-05-29 21:29:59', 199);
INSERT INTO `sys_oper_log` VALUES (173, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-26 23:24:14\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2021,2022,2023,2024,2025,2026,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-29 21:44:48', 42);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'yj', '测试部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"OvertimeApprovals\"}', NULL, 0, NULL, '2024-05-30 11:00:23', 362);
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'yj', '测试部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"OvertimeRequests\"}', NULL, 0, NULL, '2024-05-30 11:02:25', 67);
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'yj', '测试部门', '/tool/gen/synchDb/OvertimeRequests', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 14:48:25', 103);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'yj', '测试部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"OvertimeRequests\"}', NULL, 0, NULL, '2024-05-30 14:49:47', 80);
INSERT INTO `sys_oper_log` VALUES (178, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-30\",\"employeeId\":4671947,\"endTime\":\"2024-05-30\",\"overtimeHours\":0,\"overtimeId\":21,\"params\":{},\"reason\":\"测试0小时\",\"startTime\":\"2024-05-30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 14:56:41', 40);
INSERT INTO `sys_oper_log` VALUES (179, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-30\",\"employeeId\":4671947,\"endTime\":\"2024-05-30 02:10\",\"overtimeHours\":0,\"overtimeId\":22,\"params\":{},\"reason\":\"测试02\",\"startTime\":\"2024-05-30 01:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 15:00:41', 47);
INSERT INTO `sys_oper_log` VALUES (180, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-30\",\"employeeId\":4671947,\"endTime\":\"2024-05-30 07:15\",\"overtimeHours\":4,\"overtimeId\":23,\"params\":{},\"reason\":\"测试03\",\"startTime\":\"2024-05-30 00:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 15:01:15', 13);
INSERT INTO `sys_oper_log` VALUES (181, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-30\",\"employeeId\":4671947,\"endTime\":\"2024-05-30 08:13\",\"overtimeHours\":4,\"overtimeId\":24,\"params\":{},\"reason\":\"测试03\",\"startTime\":\"2024-05-30 01:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 15:02:03', 13);
INSERT INTO `sys_oper_log` VALUES (182, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-30\",\"employeeId\":4671947,\"endTime\":\"2024-05-30 08:59\",\"overtimeHours\":8,\"overtimeId\":25,\"params\":{},\"reason\":\"测试04\",\"startTime\":\"2024-05-30 00:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 15:02:34', 15);
INSERT INTO `sys_oper_log` VALUES (183, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-30 16:04:25', 10);
INSERT INTO `sys_oper_log` VALUES (184, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-30 16:04:49', 1);
INSERT INTO `sys_oper_log` VALUES (185, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-30 16:05:07', 1);
INSERT INTO `sys_oper_log` VALUES (186, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'yj', '测试部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"yj\",\"default\":false,\"dictLabel\":\"同意\",\"dictSort\":0,\"dictType\":\"sys_oper_type\",\"dictValue\":\"approve\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 16:09:29', 16);
INSERT INTO `sys_oper_log` VALUES (187, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'yj', '测试部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"yj\",\"default\":false,\"dictLabel\":\"拒绝\",\"dictSort\":0,\"dictType\":\"sys_oper_type\",\"dictValue\":\"refuse\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 16:09:49', 20);
INSERT INTO `sys_oper_log` VALUES (188, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 16:13:25', 3679);
INSERT INTO `sys_oper_log` VALUES (189, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.refuse()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/refuse/10', '127.0.0.1', '内网IP', '[10]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 16:13:40', 13);
INSERT INTO `sys_oper_log` VALUES (190, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.refuse()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/refuse/11,12,13', '127.0.0.1', '内网IP', '[11,12,13]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 16:13:47', 14);
INSERT INTO `sys_oper_log` VALUES (191, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/14', '127.0.0.1', '内网IP', '[14]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 16:19:10', 3051);
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/AccumulatedOvertime', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:08:01', 56);
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"AccumulatedOvertime\"}', NULL, 0, NULL, '2024-05-30 19:08:02', 258);
INSERT INTO `sys_oper_log` VALUES (194, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/16', '127.0.0.1', '内网IP', '[16]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:19:53', 42);
INSERT INTO `sys_oper_log` VALUES (195, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/9', '127.0.0.1', '内网IP', '[9]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:20:44', 20);
INSERT INTO `sys_oper_log` VALUES (196, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/24,25', '127.0.0.1', '内网IP', '[24,25]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:21:29', 23);
INSERT INTO `sys_oper_log` VALUES (197, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"N\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2024-05-26 23:24:15\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:32:17', 18);
INSERT INTO `sys_oper_log` VALUES (198, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2021,2022,2023,2024,2025,2026,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleKey\":\"admin\",\"roleName\":\"团队经理\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"新增角色\'团队经理\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2024-05-30 19:33:00', 8);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"加班管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:37:22', 22);
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/OvertimeRequests/index\",\"createTime\":\"2024-05-30 19:39:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"加班申请信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2027,\"path\":\"OvertimeRequests\",\"perms\":\"system:OvertimeRequests:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:41:39', 14);
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/OvertimeApprovals/index\",\"createTime\":\"2024-05-30 19:40:58\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2034,\"menuName\":\"加班审批信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2027,\"path\":\"OvertimeApprovals\",\"perms\":\"system:OvertimeApprovals:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:41:50', 7);
INSERT INTO `sys_oper_log` VALUES (202, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'admin', '研发部门', '/system/OvertimeRequests/approve/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:42:17', 15);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-05-30 19:42:30', 4);
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-05-30 19:42:36', 12);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-05-30 19:43:23', 6);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/OvertimeRequests/index\",\"createTime\":\"2024-05-27 16:13:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"加班申请信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"OvertimeRequests\",\"perms\":\"system:OvertimeRequests:list\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:43:35', 12);
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/OvertimeApprovals/index\",\"createTime\":\"2024-05-27 16:34:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"加班审批信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"OvertimeApprovals\",\"perms\":\"system:OvertimeApprovals:list\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:43:39', 9);
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/AccumulatedOvertime/index\",\"createTime\":\"2024-05-27 22:21:44\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"累计加班时间\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"AccumulatedOvertime\",\"perms\":\"system:AccumulatedOvertime:list\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:43:42', 13);
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/OvertimeApprovals/index\",\"createTime\":\"2024-05-30 19:40:58\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2034,\"menuName\":\"加班审批信息\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2027,\"path\":\"OvertimeApprovals\",\"perms\":\"system:OvertimeApprovals:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:44:17', 13);
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/OvertimeRequests/index\",\"createTime\":\"2024-05-30 19:39:28\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"加班申请信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2027,\"path\":\"OvertimeRequests\",\"perms\":\"system:OvertimeRequests:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:44:40', 13);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/OvertimeApprovals/index\",\"createTime\":\"2024-05-30 19:40:58\",\"icon\":\"search\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2034,\"menuName\":\"加班审批信息\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2027,\"path\":\"OvertimeApprovals\",\"perms\":\"system:OvertimeApprovals:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:44:56', 12);
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-30 19:37:22\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"加班管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:50:05', 13);
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-30 19:37:22\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"加班管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"overtime\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:50:35', 12);
INSERT INTO `sys_oper_log` VALUES (214, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-26 23:24:14\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:52:15', 34);
INSERT INTO `sys_oper_log` VALUES (215, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039],\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"团队经理\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:52:56', 21);
INSERT INTO `sys_oper_log` VALUES (216, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginDate\":\"2024-05-30 19:53:14\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"yj\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":4671947,\"userName\":\"yj\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:55:05', 17);
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/AccumulatedOvertime', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:56:39', 29);
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"AccumulatedOvertime\"}', NULL, 0, NULL, '2024-05-30 19:56:40', 175);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/AccumulatedOvertime/index\",\"createTime\":\"2024-05-30 19:56:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2040,\"menuName\":\"累计加班时间\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2027,\"path\":\"AccumulatedOvertime\",\"perms\":\"system:AccumulatedOvertime:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:58:32', 21);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/AccumulatedOvertime/index\",\"createTime\":\"2024-05-30 19:56:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2040,\"menuName\":\"累计加班时间\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2027,\"path\":\"AccumulatedOvertime\",\"perms\":\"system:AccumulatedOvertime:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:58:42', 9);
INSERT INTO `sys_oper_log` VALUES (221, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-30 19:52:56\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045],\"params\":{},\"roleId\":100,\"roleKey\":\"manager\",\"roleName\":\"团队经理\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:58:51', 46);
INSERT INTO `sys_oper_log` VALUES (222, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-26 23:24:14\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 19:58:55', 33);
INSERT INTO `sys_oper_log` VALUES (223, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/15', '127.0.0.1', '内网IP', '[15]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 20:09:21', 23);
INSERT INTO `sys_oper_log` VALUES (224, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/17,18', '127.0.0.1', '内网IP', '[17,18]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 20:30:00', 30);
INSERT INTO `sys_oper_log` VALUES (225, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/20', '127.0.0.1', '内网IP', '[20]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 20:33:02', 19);
INSERT INTO `sys_oper_log` VALUES (226, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/19', '127.0.0.1', '内网IP', '[19]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 20:33:52', 19);
INSERT INTO `sys_oper_log` VALUES (227, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"employeeId\":4671947,\"endTime\":\"2024-05-30 21:34\",\"overtimeHours\":12,\"params\":{},\"reason\":\"test\",\"startTime\":\"2024-05-30 09:00\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'apply_date\' doesn\'t have a default value\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/OvertimeRequestsMapper.xml]\n### The error may involve com.ruoyi.system.mapper.OvertimeRequestsMapper.insertOvertimeRequests-Inline\n### The error occurred while setting parameters\n### SQL: insert into OvertimeRequests          ( employee_id,                          start_time,             end_time,                          reason,             overtime_hours )           values ( ?,                          ?,             ?,                          ?,             ? )\n### Cause: java.sql.SQLException: Field \'apply_date\' doesn\'t have a default value\n; Field \'apply_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'apply_date\' doesn\'t have a default value', '2024-05-30 21:34:17', 280);
INSERT INTO `sys_oper_log` VALUES (228, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"employeeId\":4671947,\"endTime\":\"2024-05-30 11:03\",\"overtimeHours\":8,\"params\":{},\"reason\":\"test默认提交日期\",\"startTime\":\"2024-05-30 02:02\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'apply_date\' doesn\'t have a default value\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/OvertimeRequestsMapper.xml]\n### The error may involve com.ruoyi.system.mapper.OvertimeRequestsMapper.insertOvertimeRequests-Inline\n### The error occurred while setting parameters\n### SQL: insert into OvertimeRequests          ( employee_id,                          start_time,             end_time,                          reason,             overtime_hours )           values ( ?,                          ?,             ?,                          ?,             ? )\n### Cause: java.sql.SQLException: Field \'apply_date\' doesn\'t have a default value\n; Field \'apply_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'apply_date\' doesn\'t have a default value', '2024-05-30 21:43:00', 29);
INSERT INTO `sys_oper_log` VALUES (229, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-30\",\"employeeId\":4671947,\"endTime\":\"2024-05-30 11:00\",\"overtimeHours\":0,\"overtimeId\":26,\"params\":{},\"reason\":\"测试默认日期\",\"startTime\":\"2024-05-30 09:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 21:44:09', 44);
INSERT INTO `sys_oper_log` VALUES (230, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-30\",\"endTime\":\"2024-05-31 00:00\",\"overtimeHours\":0,\"params\":{},\"startTime\":\"2024-05-30 21:58\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/OvertimeRequestsMapper.xml]\n### The error may involve com.ruoyi.system.mapper.OvertimeRequestsMapper.insertOvertimeRequests-Inline\n### The error occurred while setting parameters\n### SQL: insert into OvertimeRequests          ( apply_date,             start_time,             end_time,                                       overtime_hours )           values ( ?,             ?,             ?,                                       ? )\n### Cause: java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value\n; Field \'employee_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value', '2024-05-30 21:58:18', 64);
INSERT INTO `sys_oper_log` VALUES (231, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-30\",\"endTime\":\"2024-05-31 00:00\",\"overtimeHours\":0,\"params\":{},\"startTime\":\"2024-05-30 21:58\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value\n### The error may exist in file [/Users/yang/Documents/RuoYi-Vue-master/ruoyi-system/target/classes/mapper/system/OvertimeRequestsMapper.xml]\n### The error may involve com.ruoyi.system.mapper.OvertimeRequestsMapper.insertOvertimeRequests-Inline\n### The error occurred while setting parameters\n### SQL: insert into OvertimeRequests          ( apply_date,             start_time,             end_time,                                       overtime_hours )           values ( ?,             ?,             ?,                                       ? )\n### Cause: java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value\n; Field \'employee_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'employee_id\' doesn\'t have a default value', '2024-05-30 21:58:19', 5);
INSERT INTO `sys_oper_log` VALUES (232, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'yj', '测试部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-05-30\",\"employeeId\":4671947,\"endTime\":\"2024-05-31 00:00\",\"overtimeHours\":0,\"overtimeId\":27,\"params\":{},\"reason\":\"默认用户测试\",\"startTime\":\"2024-05-30 22:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 22:00:36', 46);
INSERT INTO `sys_oper_log` VALUES (233, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'yj', '测试部门', '/system/OvertimeRequests/approve/8', '127.0.0.1', '内网IP', '[8]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 22:38:16', 41);
INSERT INTO `sys_oper_log` VALUES (234, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, '4671947', '测试部门', '/system/OvertimeRequests/approve/23', '127.0.0.1', '内网IP', '[23]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 23:16:29', 57);
INSERT INTO `sys_oper_log` VALUES (235, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, '4671947', '测试部门', '/system/OvertimeRequests/approve/6', '127.0.0.1', '内网IP', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-31 09:05:05', 40);
INSERT INTO `sys_oper_log` VALUES (236, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2024-05-26 23:24:15\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-30 19:32:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-31 10:21:39', 33);
INSERT INTO `sys_oper_log` VALUES (237, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2024-05-26 23:24:15\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-31 10:21:45', 25);
INSERT INTO `sys_oper_log` VALUES (238, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-31 10:22:24', 30);
INSERT INTO `sys_oper_log` VALUES (239, '加班申请信息', 1, 'com.ruoyi.system.controller.OvertimeRequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/OvertimeRequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-06-11\",\"employeeId\":1,\"endTime\":\"2024-06-12 00:00\",\"overtimeHours\":0,\"overtimeId\":28,\"params\":{},\"reason\":\"test\",\"startTime\":\"2024-06-11 20:23\",\"userId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 20:23:24', 25);
INSERT INTO `sys_oper_log` VALUES (240, '加班申请信息', 2, 'com.ruoyi.system.controller.OvertimeRequestsController.approve()', 'PUT', 1, 'admin', '研发部门', '/system/OvertimeRequests/approve/28', '127.0.0.1', '内网IP', '[28]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 20:23:38', 15);
INSERT INTO `sys_oper_log` VALUES (241, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"leaverequests\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 20:38:17', 39);
INSERT INTO `sys_oper_log` VALUES (242, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"leaverequests\"}', NULL, 0, NULL, '2024-06-11 20:38:52', 156);
INSERT INTO `sys_oper_log` VALUES (243, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/leaverequests', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 20:55:48', 54);
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 20:55:52', 12);
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"leaverequests\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 20:56:02', 44);
INSERT INTO `sys_oper_log` VALUES (246, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/AccumulatedOvertime', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 20:56:31', 17);
INSERT INTO `sys_oper_log` VALUES (247, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"leaverequests\",\"className\":\"LeaveRequests\",\"columns\":[{\"capJavaField\":\"LeaveId\",\"columnComment\":\"调休申请唯一标识\",\"columnId\":25,\"columnName\":\"leave_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-11 20:56:02\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"leaveId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EmployeeId\",\"columnComment\":\"申请调休的员工标识\",\"columnId\":26,\"columnName\":\"employee_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-06-11 20:56:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"employeeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ApplyDate\",\"columnComment\":\"申请日期\",\"columnId\":27,\"columnName\":\"apply_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-06-11 20:56:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"applyDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LeaveStartDate\",\"columnComment\":\"调休开始日期\",\"columnId\":28,\"columnName\":\"leave_start_date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-06-11 20:56:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 20:57:03', 30);
INSERT INTO `sys_oper_log` VALUES (248, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"LeaveRequests\"}', NULL, 0, NULL, '2024-06-11 20:57:13', 40);
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:07:33', 27);
INSERT INTO `sys_oper_log` VALUES (250, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"employees\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:07:49', 40);
INSERT INTO `sys_oper_log` VALUES (251, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:07:56', 8);
INSERT INTO `sys_oper_log` VALUES (252, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"leaverequests\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:08:04', 35);
INSERT INTO `sys_oper_log` VALUES (253, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"leaverequests\"}', NULL, 0, NULL, '2024-06-11 21:08:07', 164);
INSERT INTO `sys_oper_log` VALUES (254, '调休申请信息', 1, 'com.ruoyi.system.controller.LeaverequestsController.add()', 'POST', 1, 'admin', '研发部门', '/system/leaverequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-06-11\",\"employeeId\":4671947,\"leaveEndDate\":\"2024-06-13\",\"leaveHours\":12,\"leaveId\":1,\"leaveStartDate\":\"2024-06-11\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:11:08', 29);
INSERT INTO `sys_oper_log` VALUES (255, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-05-26 23:24:14\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,2046,2047,2048,2049,2050,2051,116,1055,1056,1057,1058,1059,1060,117,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:36:27', 39);
INSERT INTO `sys_oper_log` VALUES (256, '调休申请信息', 1, 'com.ruoyi.system.controller.LeaverequestsController.add()', 'POST', 1, '4671947', '测试部门', '/system/leaverequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-06-11\",\"employeeId\":4671947,\"leaveEndDate\":\"2024-06-11\",\"leaveHours\":0,\"leaveId\":2,\"leaveStartDate\":\"2024-06-11\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:38:18', 14575);
INSERT INTO `sys_oper_log` VALUES (257, '调休申请信息', 1, 'com.ruoyi.system.controller.LeaverequestsController.add()', 'POST', 1, '4671947', '测试部门', '/system/leaverequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-06-11\",\"employeeId\":4671947,\"leaveEndDate\":\"2024-06-11\",\"leaveHours\":0,\"leaveId\":3,\"leaveStartDate\":\"2024-06-11\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:39:04', 22064);
INSERT INTO `sys_oper_log` VALUES (258, '调休申请信息', 1, 'com.ruoyi.system.controller.LeaverequestsController.add()', 'POST', 1, '4671947', '测试部门', '/system/leaverequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-06-11\",\"employeeId\":4671947,\"leaveEndDate\":\"2024-06-11 23:02\",\"leaveHours\":9,\"leaveId\":4,\"leaveStartDate\":\"2024-06-11 00:00\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:43:08', 199297);
INSERT INTO `sys_oper_log` VALUES (259, '调休申请信息', 1, 'com.ruoyi.system.controller.LeaverequestsController.add()', 'POST', 1, '4671947', '测试部门', '/system/leaverequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-06-11\",\"employeeId\":4671947,\"leaveEndDate\":\"2024-06-11 23:02\",\"leaveHours\":8,\"leaveId\":5,\"leaveStartDate\":\"2024-06-11 00:00\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:44:07', 22640);
INSERT INTO `sys_oper_log` VALUES (260, '调休申请信息', 1, 'com.ruoyi.system.controller.LeaverequestsController.add()', 'POST', 1, '4671947', '测试部门', '/system/leaverequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-06-11\",\"employeeId\":4671947,\"leaveEndDate\":\"2024-06-11 23:02\",\"leaveHours\":8,\"leaveId\":6,\"leaveStartDate\":\"2024-06-11 00:00\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:44:50', 14426);
INSERT INTO `sys_oper_log` VALUES (261, '调休申请信息', 1, 'com.ruoyi.system.controller.LeaverequestsController.add()', 'POST', 1, '4671947', '测试部门', '/system/leaverequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-06-11\",\"employeeId\":4671947,\"leaveEndDate\":\"2024-06-11 23:02\",\"leaveHours\":8,\"leaveId\":7,\"leaveStartDate\":\"2024-06-11 00:00\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:45:14', 25);
INSERT INTO `sys_oper_log` VALUES (262, '调休申请信息', 1, 'com.ruoyi.system.controller.LeaverequestsController.add()', 'POST', 1, '4671947', '测试部门', '/system/leaverequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-06-11\",\"employeeId\":4671947,\"leaveEndDate\":\"2024-06-12 17:30\",\"leaveHours\":16,\"leaveId\":8,\"leaveStartDate\":\"2024-06-11 08:30\",\"params\":{},\"reason\":\"test=16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:47:20', 7);
INSERT INTO `sys_oper_log` VALUES (263, '调休申请信息', 1, 'com.ruoyi.system.controller.LeaverequestsController.add()', 'POST', 1, '4671947', '测试部门', '/system/leaverequests', '127.0.0.1', '内网IP', '{\"applyDate\":\"2024-06-11\",\"employeeId\":4671947,\"leaveEndDate\":\"2024-06-14 00:00\",\"leaveHours\":24,\"leaveId\":9,\"leaveStartDate\":\"2024-06-11 00:00\",\"params\":{},\"reason\":\"test=24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 21:47:49', 6);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-05-26 23:24:14', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-05-26 23:24:14', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-05-26 23:24:14', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-05-26 23:24:14', 'admin', '2024-06-11 21:36:27', '普通角色');
INSERT INTO `sys_role` VALUES (100, '团队经理', 'manager', 3, '1', 1, 1, '0', '0', 'admin', '2024-05-30 19:52:56', 'admin', '2024-05-30 19:58:51', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2038);
INSERT INTO `sys_role_menu` VALUES (2, 2039);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2042);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (2, 2048);
INSERT INTO `sys_role_menu` VALUES (2, 2049);
INSERT INTO `sys_role_menu` VALUES (2, 2050);
INSERT INTO `sys_role_menu` VALUES (2, 2051);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2038);
INSERT INTO `sys_role_menu` VALUES (100, 2039);
INSERT INTO `sys_role_menu` VALUES (100, 2040);
INSERT INTO `sys_role_menu` VALUES (100, 2041);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2043);
INSERT INTO `sys_role_menu` VALUES (100, 2044);
INSERT INTO `sys_role_menu` VALUES (100, 2045);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4671949 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-11 21:36:10', 'admin', '2024-05-26 23:24:14', '', '2024-06-11 21:36:10', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-05-26 23:24:14', 'admin', '2024-05-26 23:24:14', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (4671947, 105, '4671947', 'yj', '00', '', '', '0', '', '$2a$10$IK8GFXDzG5GQvbyfD5rsx.t5gqSEH/NvcCvOG9HnbIOYstC7osYGK', '0', '0', '127.0.0.1', '2024-06-11 21:36:37', '', NULL, 'admin', '2024-06-11 21:36:36', NULL);
INSERT INTO `sys_user` VALUES (4671948, NULL, '188888', '188888', '00', '', '', '0', '', '$2a$10$g1B3ygQXjfFQMzydWQzPMudDTsO4GY4j2BEZCU/x8WhixfxSGbkSK', '0', '0', '', NULL, '', '2024-05-31 11:01:20', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_copy1
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_copy1`;
CREATE TABLE `sys_user_copy1`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_copy1
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_copy2
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_copy2`;
CREATE TABLE `sys_user_copy2`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_copy2
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (4671947, 2);

SET FOREIGN_KEY_CHECKS = 1;
