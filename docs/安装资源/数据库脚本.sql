    /*
     Navicat Premium Data Transfer

     Source Server         : 127.0.0.1--本地
     Source Server Type    : MySQL
     Source Server Version : 50722
     Source Host           : localhost:3306
     Source Schema         : yf_exam_lite

     Target Server Type    : MySQL
     Target Server Version : 50722
     File Encoding         : 65001

     Date: 19/11/2021 10:05:32
    */

    SET NAMES utf8mb4;
    SET FOREIGN_KEY_CHECKS = 0;

    -- ----------------------------
    -- Table structure for el_exam
    -- ----------------------------
    DROP TABLE IF EXISTS `el_exam`;
    CREATE TABLE `el_exam` (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
      `title` varchar(255) NOT NULL COMMENT '考试名称',
      `content` varchar(255) NOT NULL DEFAULT '' COMMENT '考试描述',
      `open_type` int(11) NOT NULL DEFAULT '1' COMMENT '1公开2班级3定员',
      `join_type` int(11) NOT NULL COMMENT '组题方式1题库,2指定',
      `level` int(11) NOT NULL DEFAULT '0' COMMENT '难度:0不限,1普通,2较难',
      `state` int(11) NOT NULL DEFAULT '0' COMMENT '考试状态',
      `time_limit` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否限时',
      `start_time` datetime DEFAULT NULL COMMENT '开始时间',
      `end_time` datetime DEFAULT NULL COMMENT '结束时间',
      `create_time` datetime DEFAULT NULL COMMENT '创建时间',
      `update_time` datetime DEFAULT NULL COMMENT '更新时间',
      `total_score` int(11) NOT NULL DEFAULT '0' COMMENT '总分数',
      `total_time` int(11) NOT NULL DEFAULT '0' COMMENT '总时长（分钟）',
      `qualify_score` int(11) NOT NULL DEFAULT '0' COMMENT '及格分数',
      PRIMARY KEY (`id`) USING BTREE,
      KEY `open_type` (`open_type`),
      KEY `level` (`level`),
      KEY `join_type` (`join_type`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试';

    -- ----------------------------
    -- Records of el_exam
    -- ----------------------------
    BEGIN;
    COMMIT;

    -- ----------------------------
    -- Table structure for el_exam_depart
    -- ----------------------------
    DROP TABLE IF EXISTS `el_exam_depart`;
    CREATE TABLE `el_exam_depart` (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
      `exam_id` bigint COMMENT '考试ID',
      `depart_id` bigint  COMMENT '班级ID',
      PRIMARY KEY (`id`) USING BTREE,
      KEY `exam_id` (`exam_id`),
      KEY `depart_id` (`depart_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试-班级关系表';

    -- ----------------------------
    -- Records of el_exam_depart
    -- ----------------------------
    BEGIN;
    COMMIT;

    -- ----------------------------
    -- Table structure for el_exam_repo
    -- ----------------------------
    DROP TABLE IF EXISTS `el_exam_repo`;
    CREATE TABLE `el_exam_repo` (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
      `exam_id` bigint NOT NULL COMMENT '考试ID',
      `repo_id` bigint NOT NULL COMMENT '题库ID',
      `radio_count` int(11) NOT NULL DEFAULT '0' COMMENT '单选题数量',
      `radio_score` int(11) NOT NULL DEFAULT '0' COMMENT '单选题分数',
      `multi_count` int(11) NOT NULL DEFAULT '0' COMMENT '多选题数量',
      `multi_score` int(11) NOT NULL DEFAULT '0' COMMENT '多选题分数',
      `judge_count` int(11) NOT NULL DEFAULT '0' COMMENT '判断题数量',
      `judge_score` int(11) NOT NULL DEFAULT '0' COMMENT '判断题分数',
      `saq_count` int(11) NOT NULL DEFAULT '0' COMMENT '简答题数量',
      `saq_score` int(11) NOT NULL DEFAULT '0' COMMENT '简答题分数',
      PRIMARY KEY (`id`) USING BTREE,
      UNIQUE KEY `exam_repo_id` (`exam_id`,`repo_id`),
      KEY `rule_id` (`exam_id`) USING BTREE,
      KEY `repo_id` (`repo_id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试-题库关系表';

    -- ----------------------------
    -- Records of el_exam_repo
    -- ----------------------------
    BEGIN;
    COMMIT;

    -- ----------------------------
    -- Table structure for el_paper
    -- ----------------------------
    DROP TABLE IF EXISTS `el_paper`;
    CREATE TABLE `el_paper` (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '试卷ID',
      `user_id` bigint NOT NULL COMMENT '用户ID',
      `depart_id` bigint NOT NULL COMMENT '班级ID',
      `exam_id` bigint NOT NULL COMMENT '规则ID',
      `title` varchar(64) NOT NULL COMMENT '考试标题',
      `total_time` int(11) NOT NULL DEFAULT '0' COMMENT '考试时长',
      `user_time` int(11) NOT NULL DEFAULT '0' COMMENT '用户时长',
      `total_score` int(11) NOT NULL DEFAULT '0' COMMENT '试卷总分',
      `qualify_score` int(11) NOT NULL DEFAULT '0' COMMENT '及格分',
      `obj_score` int(11) NOT NULL DEFAULT '0' COMMENT '客观分',
      `subj_score` int(11) NOT NULL DEFAULT '0' COMMENT '主观分',
      `user_score` int(11) NOT NULL COMMENT '用户得分',
      `has_saq` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否包含简答题',
      `state` int(11) NOT NULL DEFAULT '1' COMMENT '试卷状态',
      `create_time` datetime DEFAULT NULL COMMENT '创建时间',
      `update_time` datetime DEFAULT NULL COMMENT '更新时间',
      `limit_time` datetime DEFAULT NULL COMMENT '截止时间',
      PRIMARY KEY (`id`) USING BTREE,
      KEY `user_id` (`user_id`) USING BTREE,
      KEY `exam_id` (`exam_id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试卷';

    -- ----------------------------
    -- Records of el_paper
    -- ----------------------------
    BEGIN;
    COMMIT;

    -- ----------------------------
    -- Table structure for el_paper_qu
    -- ----------------------------
    DROP TABLE IF EXISTS `el_paper_qu`;
    CREATE TABLE `el_paper_qu` (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
      `paper_id` bigint NOT NULL COMMENT '试卷ID',
      `qu_id` bigint NOT NULL COMMENT '题目ID',
      `qu_type` int(11) NOT NULL COMMENT '题目类型',
      `answered` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否已答',
      `answer` varchar(5000) NOT NULL DEFAULT '' COMMENT '主观答案',
      `sort` int(11) NOT NULL DEFAULT '0' COMMENT '问题排序',
      `score` int(11) NOT NULL DEFAULT '0' COMMENT '单题分分值',
      `actual_score` int(11) NOT NULL DEFAULT '0' COMMENT '实际得分(主观题)',
      `is_right` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否答对',
      PRIMARY KEY (`id`) USING BTREE,
      KEY `paper_id` (`paper_id`) USING BTREE,
      KEY `qu_id` (`qu_id`) USING BTREE,
      KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
      KEY `sort` (`sort`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试卷-考题关系表';

    -- ----------------------------
    -- Records of el_paper_qu
    -- ----------------------------
    BEGIN;
    COMMIT;

    -- ----------------------------
    -- Table structure for el_paper_qu_answer
    -- ----------------------------
    DROP TABLE IF EXISTS `el_paper_qu_answer`;
    CREATE TABLE `el_paper_qu_answer` (
                                          `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增ID',
      `paper_id` bigint NOT NULL COMMENT '试卷ID',
      `answer_id` bigint NOT NULL COMMENT '回答项ID',
      `qu_id` bigint NOT NULL COMMENT '题目ID',
      `is_right` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否正确项',
      `checked` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否选中',
      `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
      `abc` varchar(64) NOT NULL DEFAULT '' COMMENT '选项标签',
      PRIMARY KEY (`id`) USING BTREE,
      KEY `paper_id` (`paper_id`) USING BTREE,
      KEY `qu_id` (`qu_id`) USING BTREE,
      KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
      KEY `sort` (`sort`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试卷考题备选答案';

    -- ----------------------------
    -- Records of el_paper_qu_answer
    -- ----------------------------
    BEGIN;
    COMMIT;

    -- ----------------------------
    -- Table structure for el_qu
    -- ----------------------------
    DROP TABLE IF EXISTS `el_qu`;
    CREATE TABLE `el_qu` (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '题目ID',
      `qu_type` int(11) NOT NULL COMMENT '题目类型',
      `level` int(11) NOT NULL DEFAULT '1' COMMENT '1普通,2较难',
      `image` varchar(500) NOT NULL DEFAULT '' COMMENT '题目图片',
      `content` varchar(2000) NOT NULL COMMENT '题目内容',
      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
      `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '题目备注',
      `analysis` varchar(2000) NOT NULL DEFAULT '' COMMENT '整题解析',
      PRIMARY KEY (`id`) USING BTREE,
      KEY `qu_type` (`qu_type`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='问题题目';

    -- ----------------------------
    -- Records of el_qu
    -- ----------------------------
    BEGIN;
    COMMIT;

    -- ----------------------------
    -- Table structure for el_qu_answer
    -- ----------------------------
    DROP TABLE IF EXISTS `el_qu_answer`;
    CREATE TABLE `el_qu_answer` (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '答案ID',
      `qu_id` bigint NOT NULL COMMENT '问题ID',
      `is_right` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否正确',
      `image` varchar(500) NOT NULL DEFAULT '' COMMENT '选项图片',
      `content` varchar(5000) NOT NULL DEFAULT '' COMMENT '答案内容',
      `analysis` varchar(5000) NOT NULL DEFAULT '' COMMENT '答案分析',
      PRIMARY KEY (`id`) USING BTREE,
      KEY `qu_id` (`qu_id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='候选答案';

    -- ----------------------------
    -- Records of el_qu_answer
    -- ----------------------------
    BEGIN;
    COMMIT;

    -- ----------------------------
    -- Table structure for el_qu_repo
    -- ----------------------------
    DROP TABLE IF EXISTS `el_qu_repo`;
    CREATE TABLE `el_qu_repo` (
                                  `id` bigint NOT NULL AUTO_INCREMENT,
      `qu_id` bigint NOT NULL COMMENT '试题',
      `repo_id` bigint NOT NULL COMMENT '归属题库',
      `qu_type` int(11) NOT NULL DEFAULT '0' COMMENT '题目类型',
      `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
      PRIMARY KEY (`id`) USING BTREE,
      KEY `qu_id` (`qu_id`) USING BTREE,
      KEY `repo_id` (`repo_id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='试题题库';

    -- ----------------------------
    -- Records of el_qu_repo
    -- ----------------------------
    BEGIN;
    COMMIT;

    -- ----------------------------
    -- Table structure for el_repo
    -- ----------------------------
    DROP TABLE IF EXISTS `el_repo`;
    CREATE TABLE `el_repo` (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '题库ID',
      `code` varchar(255) NOT NULL DEFAULT '' COMMENT '题库编号',
      `title` varchar(255) NOT NULL COMMENT '题库名称',
      `radio_count` int(11) NOT NULL DEFAULT '0' COMMENT '单选数量',
      `multi_count` int(11) NOT NULL DEFAULT '0' COMMENT '多选数量',
      `judge_count` int(11) NOT NULL DEFAULT '0' COMMENT '判断数量',
      `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '题库备注',
      `create_time` datetime DEFAULT NULL COMMENT '创建时间',
      `update_time` datetime DEFAULT NULL COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题库';

    -- ----------------------------
    -- Records of el_repo
    -- ----------------------------
    BEGIN;
    COMMIT;

    -- ----------------------------
    -- Table structure for el_user_book
    -- ----------------------------
    DROP TABLE IF EXISTS `el_user_book`;
    CREATE TABLE `el_user_book` (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
      `exam_id` bigint NOT NULL COMMENT '考试ID',
      `user_id` bigint NOT NULL COMMENT '用户ID',
      `qu_id` bigint NOT NULL COMMENT '题目ID',
      `create_time` datetime DEFAULT NULL COMMENT '加入时间',
      `update_time` datetime DEFAULT NULL COMMENT '最近错误时间',
      `wrong_count` int(11) NOT NULL COMMENT '错误时间',
      `title` varchar(1000) NOT NULL COMMENT '题目标题',
      `sort` int(11) NOT NULL COMMENT '错题序号',
      PRIMARY KEY (`id`) USING BTREE,
      KEY `user_id` (`user_id`),
      KEY `sort` (`sort`),
      KEY `exam_id` (`exam_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='错题本';

    -- ----------------------------
    -- Records of el_user_book
    -- ----------------------------
    BEGIN;
    COMMIT;

    -- ----------------------------
    -- Table structure for el_user_exam
    -- ----------------------------
    DROP TABLE IF EXISTS `el_user_exam`;
    CREATE TABLE `el_user_exam` (
                                    `id` bigint NOT NULL AUTO_INCREMENT,
      `user_id` bigint NOT NULL COMMENT '用户ID',
      `exam_id` bigint NOT NULL COMMENT '考试ID',
      `try_count` int(11) NOT NULL DEFAULT '1' COMMENT '考试次数',
      `max_score` int(11) NOT NULL DEFAULT '0' COMMENT '最高分数',
      `passed` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否通过',
      `create_time` datetime DEFAULT NULL COMMENT '创建时间',
      `update_time` datetime DEFAULT NULL COMMENT '更新时间',
      PRIMARY KEY (`id`) USING BTREE,
      UNIQUE KEY `user_id` (`user_id`,`exam_id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='考试记录';

    -- ----------------------------
    -- Records of el_user_exam
    -- ----------------------------
    BEGIN;
    COMMIT;

    -- ----------------------------
    -- Table structure for sys_config
    -- ----------------------------
    DROP TABLE IF EXISTS `sys_config`;
    CREATE TABLE `sys_config` (
                                  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
      `site_name` varchar(255) DEFAULT NULL COMMENT '系统名称',
      `front_logo` varchar(255) DEFAULT NULL COMMENT '前端LOGO',
      `back_logo` varchar(255) DEFAULT NULL COMMENT '后台LOGO',
      `create_time` datetime DEFAULT NULL COMMENT '创建时间',
      `update_time` datetime DEFAULT NULL COMMENT '更新时间',
      `create_by` varchar(255) DEFAULT '' COMMENT '创建人',
      `update_by` varchar(255) DEFAULT '' COMMENT '修改人',
      `data_flag` int(11) DEFAULT '0' COMMENT '数据标识',
      PRIMARY KEY (`id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统设置';

    -- ----------------------------
    -- Records of sys_config
    -- ----------------------------
    BEGIN;
    INSERT INTO `sys_config` VALUES ('1', '在线考试系统', NULL, NULL, '2021-12-03 16:51:30', '2021-12-03 16:51:30', '', '', 1);
    COMMIT;

    -- ----------------------------
    -- Table structure for sys_depart
    -- ----------------------------
    DROP TABLE IF EXISTS `sys_depart`;
    CREATE TABLE `sys_depart` (
                                  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
      `dept_type` int(11) NOT NULL DEFAULT '1' COMMENT '1普通班级2单开班',
      `parent_id` bigint NOT NULL COMMENT '所属上级',
      `dept_name` varchar(255) NOT NULL DEFAULT '' COMMENT '班级名称',
      `dept_code` varchar(255) NOT NULL DEFAULT '' COMMENT '班级编码',
      `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
      PRIMARY KEY (`id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级信息';

    -- ----------------------------
    -- Records of sys_depart
    -- ----------------------------
    BEGIN;
    INSERT INTO `sys_depart` VALUES ('1', 1, '0', '软件工程', 'A01', 1);
    INSERT INTO `sys_depart` VALUES ('2', 1, '1', '1班', 'A01A01', 1);
    INSERT INTO `sys_depart` VALUES ('3', 1, '1', '2班', 'A01A02', 2);
    INSERT INTO `sys_depart` VALUES ('4', 1, '0', '计算机技术', 'A02', 2);
    INSERT INTO `sys_depart` VALUES ('5', 1, '4', '1班', 'A02A01', 1);
    INSERT INTO `sys_depart` VALUES ('6', 1, '4', '2班', 'A02A02', 2);
    INSERT INTO `sys_depart` VALUES ('7', 1, '0', '物联网工程', 'A03', 3);
    INSERT INTO `sys_depart` VALUES ('8', 1, '7', '1班', 'A03A01', 1);
    INSERT INTO `sys_depart` VALUES ('9', 1, '7', '2班', 'A03A02', 2);
    INSERT INTO `sys_depart` VALUES ('10', 1, '7', '3班', 'A03A03', 3);
    COMMIT;

    -- ----------------------------
    -- Table structure for sys_role
    -- ----------------------------
    DROP TABLE IF EXISTS `sys_role`;
    CREATE TABLE `sys_role` (
      `id` varchar(32) NOT NULL COMMENT '角色编码',
      `role_name` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名称',
      PRIMARY KEY (`id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色';

    -- ----------------------------
    -- Records of sys_role
    -- ----------------------------
    BEGIN;
    INSERT INTO `sys_role` VALUES ('admin', '管理员');
    INSERT INTO `sys_role` VALUES ('student', '学员');
    INSERT INTO `sys_role` VALUES ('teacher', '老师');
    COMMIT;

    -- ----------------------------
    -- Table structure for sys_user
    -- ----------------------------
    DROP TABLE IF EXISTS `sys_user`;
    CREATE TABLE `sys_user` (
                                `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
      `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
      `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
      `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
      `salt` varchar(255) NOT NULL DEFAULT '' COMMENT '密码盐',
      `role_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '角色列表',
      `depart_id` bigint NOT NULL COMMENT '班级ID',
      `create_time` datetime DEFAULT NULL COMMENT '创建时间',
      `update_time` datetime DEFAULT NULL COMMENT '更新时间',
      `state` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
      `data_flag` int(11) NOT NULL DEFAULT '0' COMMENT '0正常,1隐藏',
      PRIMARY KEY (`id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理用户';

    -- ----------------------------
    -- Records of sys_user
    -- ----------------------------
    BEGIN;
    INSERT INTO `sys_user` VALUES ('1', 'admin', '陈老师', '06681cd08837b21adf6b5ef9279d403d', 'XoFFuS', 'admin', '1', '2021-04-20 13:51:03', '2021-04-20 13:51:03', 0, 0);
    INSERT INTO `sys_user` VALUES ('2', 'person', '张三', '6dfdd6761a3e8319719f32abb9aeae9c', 'tZCjLq', 'student', '2', '2021-04-20 14:41:35', '2021-04-20 14:41:35', 0, 0);
    COMMIT;

    -- ----------------------------
    -- Table structure for sys_user_role
    -- ----------------------------
    DROP TABLE IF EXISTS `sys_user_role`;
    CREATE TABLE `sys_user_role` (
      `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
      `user_id` bigint NOT NULL COMMENT '用户ID',
      `role_id` varchar(32) NOT NULL COMMENT '角色ID',
      PRIMARY KEY (`id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色';

    -- ----------------------------
    -- Records of sys_user_role
    -- ----------------------------
    BEGIN;
    INSERT INTO `sys_user_role` VALUES ('1', '1', 'admin');
    INSERT INTO `sys_user_role` VALUES ('2', '2', 'student');
    COMMIT;

    SET FOREIGN_KEY_CHECKS = 1;
