/*
Navicat MySQL Data Transfer

Source Server         : mysql_local
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : starter

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-02-09 15:03:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_blog
-- ----------------------------
DROP TABLE IF EXISTS `cms_blog`;
CREATE TABLE `cms_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_blog
-- ----------------------------
INSERT INTO `cms_blog` VALUES ('1', 'hello', '我的博客，内容是。。。', '2018-02-22 09:53:05', '1', 'F0');
INSERT INTO `cms_blog` VALUES ('2', 'cccc', '过年回家', '2018-02-13 10:30:01', '1', 'F0');

-- ----------------------------
-- Table structure for core_audit
-- ----------------------------
DROP TABLE IF EXISTS `core_audit`;
CREATE TABLE `core_audit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FUNCTION_CODE` varchar(45) DEFAULT NULL,
  `FUNCTION_NAME` varchar(45) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `USER_NAME` varchar(45) DEFAULT NULL,
  `IP` varchar(45) DEFAULT NULL,
  `CREATE_TIME` datetime(6) DEFAULT NULL,
  `SUCCESS` tinyint(4) DEFAULT NULL,
  `MESSAGE` text,
  `ORG_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_audit
-- ----------------------------
INSERT INTO `core_audit` VALUES ('1', 'org.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-06 19:58:50.876000', '1', '', null);
INSERT INTO `core_audit` VALUES ('2', 'org.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-06 19:58:51.377000', '1', '', null);
INSERT INTO `core_audit` VALUES ('3', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:00:10.972000', '1', '', null);
INSERT INTO `core_audit` VALUES ('4', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:00:11.130000', '1', '', null);
INSERT INTO `core_audit` VALUES ('5', 'user.add', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:00:39.562000', '1', '', null);
INSERT INTO `core_audit` VALUES ('6', 'user.edit', '用户编辑', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:10:15.399000', '1', '', null);
INSERT INTO `core_audit` VALUES ('7', 'user.query', '用户列表', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:10:15.846000', '1', '', null);
INSERT INTO `core_audit` VALUES ('8', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:10:16.882000', '1', '', null);
INSERT INTO `core_audit` VALUES ('9', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:10:17.056000', '1', '', null);
INSERT INTO `core_audit` VALUES ('10', 'user.edit', '用户编辑', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:14:46.789000', '0', 'java.sql.SQLException: Error on delete of \'C:\\Users\\ADMINI~1\\AppData\\Local\\Temp\\#sql978_2c3_6.MYI\' (Errcode: 13 - Permission denied)', null);
INSERT INTO `core_audit` VALUES ('11', 'user.edit', '用户编辑', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:15:12.861000', '1', '', null);
INSERT INTO `core_audit` VALUES ('12', 'user.query', '用户列表', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:15:13.294000', '1', '', null);
INSERT INTO `core_audit` VALUES ('13', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:15:14.636000', '1', '', null);
INSERT INTO `core_audit` VALUES ('14', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:15:14.876000', '1', '', null);
INSERT INTO `core_audit` VALUES ('15', 'audit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-06 20:16:23.824000', '1', '', null);
INSERT INTO `core_audit` VALUES ('16', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:42:58.091000', '1', '', null);
INSERT INTO `core_audit` VALUES ('17', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:42:58.394000', '1', '', null);
INSERT INTO `core_audit` VALUES ('18', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:53:11.745000', '1', '', null);
INSERT INTO `core_audit` VALUES ('19', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:53:11.943000', '1', '', null);
INSERT INTO `core_audit` VALUES ('20', 'user.add', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:53:13.058000', '1', '', null);
INSERT INTO `core_audit` VALUES ('21', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:53:28.999000', '1', '', null);
INSERT INTO `core_audit` VALUES ('22', 'role.add', '角色添加', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:53:29.162000', '1', '', null);
INSERT INTO `core_audit` VALUES ('23', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:53:43.017000', '1', '', null);
INSERT INTO `core_audit` VALUES ('24', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:53:43.148000', '1', '', null);
INSERT INTO `core_audit` VALUES ('25', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:53:45.338000', '1', '', null);
INSERT INTO `core_audit` VALUES ('26', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:56:03.185000', '1', '', null);
INSERT INTO `core_audit` VALUES ('27', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:56:03.646000', '1', '', null);
INSERT INTO `core_audit` VALUES ('28', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:56:06.264000', '1', '', null);
INSERT INTO `core_audit` VALUES ('29', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:56:07.508000', '1', '', null);
INSERT INTO `core_audit` VALUES ('30', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:56:09.524000', '1', '', null);
INSERT INTO `core_audit` VALUES ('31', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 09:56:10.738000', '1', '', null);
INSERT INTO `core_audit` VALUES ('32', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:02:00.590000', '1', '', null);
INSERT INTO `core_audit` VALUES ('33', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:02:00.803000', '1', '', null);
INSERT INTO `core_audit` VALUES ('34', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:02:02.991000', '1', '', null);
INSERT INTO `core_audit` VALUES ('35', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:05:40.367000', '1', '', null);
INSERT INTO `core_audit` VALUES ('36', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:05:40.496000', '1', '', null);
INSERT INTO `core_audit` VALUES ('37', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:05:42.173000', '1', '', null);
INSERT INTO `core_audit` VALUES ('38', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:06:02.218000', '1', '', null);
INSERT INTO `core_audit` VALUES ('39', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:07:45.273000', '1', '', null);
INSERT INTO `core_audit` VALUES ('40', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:07:45.943000', '1', '', null);
INSERT INTO `core_audit` VALUES ('41', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:07:47.715000', '1', '', null);
INSERT INTO `core_audit` VALUES ('42', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:08:03.378000', '1', '', null);
INSERT INTO `core_audit` VALUES ('43', 'role.update', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:08:03.484000', '1', '', null);
INSERT INTO `core_audit` VALUES ('44', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:08:16.535000', '1', '', null);
INSERT INTO `core_audit` VALUES ('45', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', '2018-02-07 10:08:16.691000', '1', '', null);

-- ----------------------------
-- Table structure for core_dict
-- ----------------------------
DROP TABLE IF EXISTS `core_dict`;
CREATE TABLE `core_dict` (
  `VALUE` varchar(16) NOT NULL,
  `NAME` varchar(128) NOT NULL COMMENT '名称',
  `TYPE` varchar(64) NOT NULL COMMENT '字典编码',
  `TYPE_NAME` varchar(64) NOT NULL COMMENT '类型描述',
  `SORT` int(6) DEFAULT NULL COMMENT '排序',
  `PARENT` varchar(64) DEFAULT NULL COMMENT '父id',
  `DEL_FLAG` int(6) DEFAULT NULL COMMENT '删除标记',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime(6) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`VALUE`),
  KEY `idx_code` (`TYPE`),
  KEY `idx_pid` (`PARENT`),
  KEY `idx_value` (`VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of core_dict
-- ----------------------------
INSERT INTO `core_dict` VALUES ('DA0', '查看自己', 'data_access_type', '数据权限', '1', null, '0', '11111111111111111', null);
INSERT INTO `core_dict` VALUES ('DA1', '查看本公司', 'data_access_type', '数据权限', '2', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('DA2', '查看同机构', 'data_access_type', '数据权限', '3', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('DA3', '查看本部门', 'data_access_type', '数据权限', '4', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('DA4', '查看集团', 'data_access_type', '数据权限', '5', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('DA5', '查看母公司', 'data_access_type', '数据权限', '6', null, '0', null, '2017-10-14 11:45:02.000000');
INSERT INTO `core_dict` VALUES ('FN0', '普通功能', 'function_type', '功能点类型', '2', null, '0', null, '2017-10-23 10:18:03.000000');
INSERT INTO `core_dict` VALUES ('FN1', '含数据权限', 'function_type', '功能点类型', '1', null, '0', null, '2017-10-23 10:20:05.000000');
INSERT INTO `core_dict` VALUES ('JT_01', '管理岗位', 'job_type', '岗位类型', '1', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('JT_02', '技术岗位', 'job_type', '岗位类型', '2', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('JT_S_01', '董事会', 'job_sub_managment_type', '管理岗位子类型', '1', 'JT_01', '0', null, null);
INSERT INTO `core_dict` VALUES ('JT_S_02', '秘书', 'job_sub_managment_type', '管理岗位子类型', '2', 'JT_01', '0', null, null);
INSERT INTO `core_dict` VALUES ('JT_S_03', '技术经理', 'job_dev_sub_type', '技术岗位子类型', '1', 'JT_02', '0', null, null);
INSERT INTO `core_dict` VALUES ('JT_S_04', '程序员', 'job_dev_sub_type', '技术岗位子类型', '2', 'JT_02', '0', null, null);
INSERT INTO `core_dict` VALUES ('MENU_M', '菜单', 'menu_type', '菜单类型', '3', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('MENU_N', '导航', 'menu_type', '菜单类型', '2', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('MENU_S', '系统', 'menu_type', '菜单类型', '1', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('ORGT0', '集团总部', 'org_type', '机构类型', '1', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('ORGT1', '分公司', 'org_type', '机构类型', '2', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('ORGT2', '部门', 'org_type', '机构类型', '3', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('ORGT3', '小组', 'org_type', '机构类型', '4', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('R0', '操作角色', 'role_type', '数据权限', '1', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('R1', '工作流角色', 'role_type', '用户角色', '2', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('S0', '禁用', 'user_state', '用户状态', '2', null, '0', null, null);
INSERT INTO `core_dict` VALUES ('S1', '启用', 'user_state', '用户状态', '1', null, '0', null, null);

-- ----------------------------
-- Table structure for core_file
-- ----------------------------
DROP TABLE IF EXISTS `core_file`;
CREATE TABLE `core_file` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) DEFAULT NULL COMMENT '文件名称',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `BIZ_NO` varchar(128) DEFAULT NULL COMMENT '业务ID',
  `UPDATE_USER_ID` int(20) DEFAULT NULL COMMENT '上传人id',
  `EXT1` varchar(255) DEFAULT NULL COMMENT '扩展字段',
  `DEL_FLAG` tinyint(6) DEFAULT NULL COMMENT '删除标记',
  `CREATE_TIME` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `UPLOAD_USER_ORG` int(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of core_file
-- ----------------------------
INSERT INTO `core_file` VALUES ('1', '文件1', '/dal', '1', '1', null, '0', null, '1');
INSERT INTO `core_file` VALUES ('2', 'ajls', '/aefs', '2', '2', null, '0', null, '1');

-- ----------------------------
-- Table structure for core_file_tag
-- ----------------------------
DROP TABLE IF EXISTS `core_file_tag`;
CREATE TABLE `core_file_tag` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `KEY` varchar(64) NOT NULL COMMENT 'key，关键字',
  `VALUE` varchar(255) NOT NULL COMMENT '关键字对应的值',
  `FILE_ID` int(20) NOT NULL COMMENT 'sys_file的id，文件id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文件标签';

-- ----------------------------
-- Records of core_file_tag
-- ----------------------------
INSERT INTO `core_file_tag` VALUES ('1', 'customer', '12332', '1');
INSERT INTO `core_file_tag` VALUES ('2', 'type', 'crdit', '2');

-- ----------------------------
-- Table structure for core_function
-- ----------------------------
DROP TABLE IF EXISTS `core_function`;
CREATE TABLE `core_function` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `CODE` text,
  `NAME` varchar(16) DEFAULT NULL,
  `CREATE_TIME` datetime(6) DEFAULT NULL,
  `ACCESS_URL` text,
  `PARENT_ID` int(65) DEFAULT NULL,
  `TYPE` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_function
-- ----------------------------
INSERT INTO `core_function` VALUES ('1', 'user', '用户功能', null, '/admin/user/index.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('2', 'user.query', '用户列表', null, null, '1', 'FN1');
INSERT INTO `core_function` VALUES ('3', 'user.edit', '用户编辑', null, null, '1', 'FN0');
INSERT INTO `core_function` VALUES ('6', 'org', '组织机构', null, '/admin/org/index.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('7', 'role', '角色管理', null, '/admin/role/index.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('8', 'menu', '菜单管理', null, '/admin/menu/index.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('9', 'function', '功能点管理', null, '/admin/function/index.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('10', 'roleFunction', '角色功能授权', null, '/admin/role/function.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('11', 'roleDataAccess', '角色数据授权', null, '/admin/role/data.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('12', 'code', '代码生成', null, '/core/codeGen/index.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('13', 'dict', '字典管理', null, '/admin/dict/index.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('14', 'internalField', '内部交易方管理', null, '/trade/interAndRelate/interField.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('15', 'internalTrade', '内部交易管理', null, '/views/usermng/main.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('16', 'relateField', '关联方管理', null, '/trade/internalAndRelational/relateField.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('17', 'relateTrade', '关联交易管理', null, '/trade/internalAndRelational/relateTrade.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('18', 'audit', '审计查询', null, '/admin/audit/index.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('19', 'file', '相关文档', null, '/trade/interAndRelate/file.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('91', 'test', '测试', '2017-10-11 16:59:01.000000', '/test/test.do', '6', 'FN0');
INSERT INTO `core_function` VALUES ('161', 'role.add', '角色添加', '2017-10-23 09:45:05.000000', null, '7', 'FN0');
INSERT INTO `core_function` VALUES ('167', 'workflow.admin', '工作流监控', null, '/admin/workflow/index.do', '0', 'FN0');
INSERT INTO `core_function` VALUES ('180', 'code.query', '代码生成测试', null, null, '12', 'FN0');
INSERT INTO `core_function` VALUES ('181', 'blog.query', '博客查询功能', null, '', '182', 'FN0');
INSERT INTO `core_function` VALUES ('182', 'blog', '博客测试', null, '/admin/blog/index.do', '0', 'FN0');

-- ----------------------------
-- Table structure for core_menu
-- ----------------------------
DROP TABLE IF EXISTS `core_menu`;
CREATE TABLE `core_menu` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(16) DEFAULT NULL,
  `NAME` varchar(16) DEFAULT NULL,
  `CREATE_TIME` datetime(6) DEFAULT NULL,
  `FUNCTION_ID` int(6) DEFAULT NULL,
  `TYPE` varchar(6) DEFAULT NULL COMMENT '1,系统，2 导航 3 菜单项（对应某个功能点）',
  `PARENT_MENU_ID` int(65) DEFAULT NULL,
  `SEQ` int(65) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_menu
-- ----------------------------
INSERT INTO `core_menu` VALUES ('8', '系统管理', '系统管理', null, null, 'MENU_S', '0', '1', null);
INSERT INTO `core_menu` VALUES ('10', '用户管理', '用户管理', null, '1', 'MENU_M', '18', '1', null);
INSERT INTO `core_menu` VALUES ('11', '组织机构管理', '组织机构管理', null, '6', 'MENU_M', '18', '2', null);
INSERT INTO `core_menu` VALUES ('12', '角色管理', '角色管理', null, '7', 'MENU_M', '18', '3', null);
INSERT INTO `core_menu` VALUES ('13', '菜单项', '菜单项', null, '8', 'MENU_M', '18', '4', null);
INSERT INTO `core_menu` VALUES ('14', '功能点管理', '功能点管理', null, '9', 'MENU_M', '18', '5', null);
INSERT INTO `core_menu` VALUES ('15', '字典数据管理', '字典数据管理', null, '13', 'MENU_M', '18', '6', null);
INSERT INTO `core_menu` VALUES ('16', '审计查询', '审计查询', null, '18', 'MENU_M', '19', '7', null);
INSERT INTO `core_menu` VALUES ('17', '代码生成', '代码生成', null, '12', 'MENU_M', '19', '8', null);
INSERT INTO `core_menu` VALUES ('18', '基础管理', '基础管理', null, null, 'MENU_N', '8', '1', null);
INSERT INTO `core_menu` VALUES ('19', '监控管理', '监控管理', null, null, 'MENU_N', '8', '2', null);
INSERT INTO `core_menu` VALUES ('20', '流程监控', '流程监控', null, '167', 'MENU_M', '19', '3', null);
INSERT INTO `core_menu` VALUES ('21', '角色功能授权', '角色功能授权', null, '10', 'MENU_M', '18', '8', null);
INSERT INTO `core_menu` VALUES ('22', '角色数据授权', '角色数据授权', null, '11', 'MENU_M', '18', '9', null);
INSERT INTO `core_menu` VALUES ('23', '博客测试', '博客测试', null, '182', 'MENU_M', '19', '9', null);

-- ----------------------------
-- Table structure for core_org
-- ----------------------------
DROP TABLE IF EXISTS `core_org`;
CREATE TABLE `core_org` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(16) NOT NULL,
  `NAME` varchar(16) NOT NULL,
  `CREATE_TIME` datetime(6) DEFAULT NULL,
  `PARENT_ORG_ID` int(20) DEFAULT NULL,
  `TYPE` varchar(6) NOT NULL COMMENT '1 公司，2 部门，3 小组',
  `DEL_FLAG` tinyint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_org
-- ----------------------------
INSERT INTO `core_org` VALUES ('1', '集团公司', '集团', '2018-02-02 17:18:50.000000', null, 'ORGT0', '0');
INSERT INTO `core_org` VALUES ('3', '信息科技部门', '信息科技部门', null, '1', 'ORGT2', '0');
INSERT INTO `core_org` VALUES ('4', '贵州银行', '贵州银行', '2018-02-02 17:18:56.000000', '1', 'ORGT1', '0');
INSERT INTO `core_org` VALUES ('5', '贵州银行金科', '贵州银行金融科技开发公司', null, '4', 'ORGT1', '0');
INSERT INTO `core_org` VALUES ('6', '金科研发', '金科研发', null, '5', 'ORGT2', '0');
INSERT INTO `core_org` VALUES ('7', '金科研发部门', '金科研发部门', '2018-02-05 13:49:52.754000', '6', 'ORGT2', '0');
INSERT INTO `core_org` VALUES ('8', '金科研发2部', '金科研发2部', '2018-02-05 13:50:43.901000', '6', 'ORGT2', '0');

-- ----------------------------
-- Table structure for core_role
-- ----------------------------
DROP TABLE IF EXISTS `core_role`;
CREATE TABLE `core_role` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(16) DEFAULT NULL COMMENT '角色编码',
  `NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `CREATE_TIME` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `TYPE` varchar(6) DEFAULT NULL COMMENT '1 可以配置 2 固定权限角色',
  PRIMARY KEY (`ID`),
  KEY `code_idx` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_role
-- ----------------------------
INSERT INTO `core_role` VALUES ('1', 'DEPT_MANAGER', '部门管理员', null, 'R0');
INSERT INTO `core_role` VALUES ('2', 'CEO', '公司CEO', null, 'R0');
INSERT INTO `core_role` VALUES ('3', 'ASSIST', '助理', null, 'R0');
INSERT INTO `core_role` VALUES ('12', '111', '2324324', '2017-09-06 04:08:00.000000', 'R0');
INSERT INTO `core_role` VALUES ('13', '1111', '哈哈', '2017-09-06 04:09:05.000000', 'R0');
INSERT INTO `core_role` VALUES ('14', '11', '角色测李家智', '2017-09-06 05:13:05.000000', 'R0');
INSERT INTO `core_role` VALUES ('15', 'admin', 'ivy', '2017-09-06 05:35:04.000000', 'R0');
INSERT INTO `core_role` VALUES ('16', 'tetttt', '测试角色李家智', '2017-09-06 21:27:02.000000', 'R0');
INSERT INTO `core_role` VALUES ('17', '123', '我', '2017-09-06 21:23:03.000000', 'R0');
INSERT INTO `core_role` VALUES ('18', '23', '234', '2017-09-06 21:41:03.000000', 'R0');
INSERT INTO `core_role` VALUES ('19', '132484', '1', '2017-09-06 21:42:02.000000', 'R0');
INSERT INTO `core_role` VALUES ('20', '12', '123', '2017-09-06 21:50:03.000000', 'R0');
INSERT INTO `core_role` VALUES ('21', '122', '123', '2017-09-06 21:51:00.000000', 'R0');
INSERT INTO `core_role` VALUES ('22', '12334', '23', '2017-09-06 21:51:03.000000', 'R0');
INSERT INTO `core_role` VALUES ('23', '12334', '23', '2017-09-06 21:51:05.000000', 'R0');
INSERT INTO `core_role` VALUES ('24', '123343', '23', '2017-09-06 21:52:02.000000', 'R0');
INSERT INTO `core_role` VALUES ('25', '112', '2', '2017-09-06 21:55:00.000000', 'R0');
INSERT INTO `core_role` VALUES ('26', '12', '23', '2017-09-06 22:19:01.000000', 'R0');
INSERT INTO `core_role` VALUES ('27', '123', '11', '2017-09-08 00:33:04.000000', 'R0');
INSERT INTO `core_role` VALUES ('28', '1234', '11', '2017-09-08 00:33:04.000000', 'R0');
INSERT INTO `core_role` VALUES ('29', '12345', '11haha', '2017-09-08 00:33:05.000000', 'R1');
INSERT INTO `core_role` VALUES ('30', '12344', '11', '2017-09-08 00:34:00.000000', 'R1');
INSERT INTO `core_role` VALUES ('31', '123445', '11', '2017-09-08 00:34:01.000000', 'R0');
INSERT INTO `core_role` VALUES ('32', '1234456', '11', '2017-09-08 00:34:01.000000', 'R0');
INSERT INTO `core_role` VALUES ('33', '123445677', '11', '2017-09-08 00:34:01.000000', 'R0');
INSERT INTO `core_role` VALUES ('34', '1232144', '1', '2017-09-08 01:12:02.000000', 'R0');
INSERT INTO `core_role` VALUES ('35', '112314', '哈哈', '2017-09-08 01:15:00.000000', 'R0');
INSERT INTO `core_role` VALUES ('36', '12357', '11', '2017-09-08 03:05:03.000000', 'R0');
INSERT INTO `core_role` VALUES ('37', '123213', '11', '2017-09-10 21:30:01.000000', 'R0');
INSERT INTO `core_role` VALUES ('79', 'test111', 'ivy', '2017-10-10 13:48:02.000000', 'R1');
INSERT INTO `core_role` VALUES ('98', '123213', '11111111', '2017-10-14 17:21:03.000000', 'R1');
INSERT INTO `core_role` VALUES ('99', '2343', '2344', '2017-10-14 17:22:04.000000', 'R1');
INSERT INTO `core_role` VALUES ('173', 'dept.admin', '部门辅助管理员', '2017-10-25 10:29:03.000000', 'R0');

-- ----------------------------
-- Table structure for core_role_function
-- ----------------------------
DROP TABLE IF EXISTS `core_role_function`;
CREATE TABLE `core_role_function` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(65) DEFAULT NULL,
  `FUNCTION_ID` int(65) DEFAULT NULL,
  `DATA_ACCESS_TYPE` tinyint(65) DEFAULT NULL,
  `DATA_ACCESS_POLICY` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_role_function
-- ----------------------------
INSERT INTO `core_role_function` VALUES ('1', '1', '1', '5', null);
INSERT INTO `core_role_function` VALUES ('2', '1', '2', '6', null);
INSERT INTO `core_role_function` VALUES ('3', '1', '3', '5', null);
INSERT INTO `core_role_function` VALUES ('4', '2', '2', '3', null);
INSERT INTO `core_role_function` VALUES ('5', '3', '2', '5', null);
INSERT INTO `core_role_function` VALUES ('6', '3', '3', '5', null);
INSERT INTO `core_role_function` VALUES ('162', '1', '6', null, null);
INSERT INTO `core_role_function` VALUES ('164', '1', '91', null, null);
INSERT INTO `core_role_function` VALUES ('174', '173', '1', null, null);
INSERT INTO `core_role_function` VALUES ('176', '173', '2', '5', null);
INSERT INTO `core_role_function` VALUES ('177', '173', '3', null, null);
INSERT INTO `core_role_function` VALUES ('178', '173', '167', null, null);
INSERT INTO `core_role_function` VALUES ('183', '35', '12', null, null);
INSERT INTO `core_role_function` VALUES ('185', '35', '180', null, null);
INSERT INTO `core_role_function` VALUES ('186', '35', '35', '5', null);
INSERT INTO `core_role_function` VALUES ('187', '16', '2', '6', null);
INSERT INTO `core_role_function` VALUES ('188', '16', '91', '5', null);
INSERT INTO `core_role_function` VALUES ('189', '16', '161', '4', null);
INSERT INTO `core_role_function` VALUES ('190', '16', '167', '3', null);
INSERT INTO `core_role_function` VALUES ('191', '16', '180', '2', null);
INSERT INTO `core_role_function` VALUES ('192', '3', '1', null, null);
INSERT INTO `core_role_function` VALUES ('194', '3', '12', null, null);
INSERT INTO `core_role_function` VALUES ('196', '3', '180', '3', null);

-- ----------------------------
-- Table structure for core_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `core_role_menu`;
CREATE TABLE `core_role_menu` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(65) DEFAULT NULL,
  `MENU_ID` int(65) DEFAULT NULL,
  `CREATE_TIME` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_role_menu
-- ----------------------------
INSERT INTO `core_role_menu` VALUES ('1', '1', '10', null);
INSERT INTO `core_role_menu` VALUES ('163', '1', '11', null);
INSERT INTO `core_role_menu` VALUES ('175', '173', '10', null);
INSERT INTO `core_role_menu` VALUES ('184', '35', '17', null);
INSERT INTO `core_role_menu` VALUES ('193', '3', '10', null);
INSERT INTO `core_role_menu` VALUES ('195', '3', '17', null);

-- ----------------------------
-- Table structure for core_user
-- ----------------------------
DROP TABLE IF EXISTS `core_user`;
CREATE TABLE `core_user` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(16) DEFAULT NULL,
  `NAME` varchar(16) DEFAULT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `CREATE_TIME` datetime(6) DEFAULT NULL,
  `ORG_ID` int(65) DEFAULT NULL,
  `STATE` varchar(16) DEFAULT NULL COMMENT '用户状态 1:启用 0:停用',
  `JOB_TYPE` varchar(16) DEFAULT NULL,
  `DEL_FLAG` tinyint(6) DEFAULT NULL COMMENT '用户删除标记 0:未删除 1:已删除',
  `update_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_user
-- ----------------------------
INSERT INTO `core_user` VALUES ('1', 'admin', '超级管理员', '123456', '2017-09-13 09:21:03.000000', '1', 'S1', 'JT_S_01', '0', '2017-09-13 09:21:03');
INSERT INTO `core_user` VALUES ('171', 'lixx', '李小小', null, '2018-01-28 11:21:20.914000', '6', 'S1', 'JT_S_04', '0', null);
INSERT INTO `core_user` VALUES ('172', 'lixx2', '李xx2', '123456', '2018-01-28 11:22:38.814000', '4', 'S1', 'JT_S_02', '0', null);
INSERT INTO `core_user` VALUES ('173', 'test1', 'test1', '123', '2018-01-28 14:44:55.407000', '5', 'S1', 'JT_S_04', '0', null);

-- ----------------------------
-- Table structure for core_user_role
-- ----------------------------
DROP TABLE IF EXISTS `core_user_role`;
CREATE TABLE `core_user_role` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(20) DEFAULT NULL,
  `ROLE_ID` int(20) DEFAULT NULL,
  `ORG_ID` int(20) DEFAULT NULL,
  `CREATE_TIME` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8 COMMENT='用户角色关系表';

-- ----------------------------
-- Records of core_user_role
-- ----------------------------
INSERT INTO `core_user_role` VALUES ('1', '3', '1', '4', null);
INSERT INTO `core_user_role` VALUES ('2', '4', '2', '5', null);
INSERT INTO `core_user_role` VALUES ('3', '75', '3', '6', '2017-09-21 18:03:05.000000');
INSERT INTO `core_user_role` VALUES ('35', '1', '1', '1', '2017-09-06 01:12:02.000000');
INSERT INTO `core_user_role` VALUES ('36', '1', '3', '6', '2017-09-06 03:33:05.000000');
INSERT INTO `core_user_role` VALUES ('38', '1', '1', '3', '2017-09-06 03:35:02.000000');
INSERT INTO `core_user_role` VALUES ('41', '1', '1', '5', '2017-09-06 03:58:02.000000');
INSERT INTO `core_user_role` VALUES ('42', '3', '3', '1', '2017-09-06 04:01:00.000000');
INSERT INTO `core_user_role` VALUES ('47', '47', '3', '1', '2017-09-06 22:00:01.000000');
INSERT INTO `core_user_role` VALUES ('49', '5', '3', '4', '2017-09-06 22:01:00.000000');
INSERT INTO `core_user_role` VALUES ('52', '47', '2', '1', '2017-09-07 01:12:02.000000');
INSERT INTO `core_user_role` VALUES ('53', '48', '3', '4', '2017-09-07 01:14:04.000000');
INSERT INTO `core_user_role` VALUES ('55', '68', '2', '3', '2017-09-07 21:42:03.000000');
INSERT INTO `core_user_role` VALUES ('125', '74', '1', '4', '2017-10-17 09:37:02.000000');
INSERT INTO `core_user_role` VALUES ('144', '74', '3', null, '2017-10-17 16:55:00.000000');
INSERT INTO `core_user_role` VALUES ('145', '67', '3', null, '2017-10-17 16:55:01.000000');
INSERT INTO `core_user_role` VALUES ('146', '73', '3', null, '2017-10-17 16:55:02.000000');
INSERT INTO `core_user_role` VALUES ('147', '22', '3', null, '2017-10-17 16:55:04.000000');
INSERT INTO `core_user_role` VALUES ('148', '68', '3', null, '2017-10-17 16:56:00.000000');
INSERT INTO `core_user_role` VALUES ('168', '72', '1', '3', '2017-10-24 14:40:04.000000');
INSERT INTO `core_user_role` VALUES ('169', '41', '1', null, '2017-10-25 08:58:01.000000');
INSERT INTO `core_user_role` VALUES ('171', '170', '1', '5', '2017-10-25 09:08:05.000000');
INSERT INTO `core_user_role` VALUES ('172', '171', '1', '4', '2018-02-02 09:36:40.967000');
