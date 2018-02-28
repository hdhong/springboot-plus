/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.1.0

Source Server         : 172.16.86.56 oracle starter
Source Server Version : 110200
Source Host           : 172.16.86.56:1521
Source Schema         : STARTER

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2018-02-24 14:59:47
*/


create sequence core_seq
minvalue 1
maxvalue 999999999999999999999999999
start with 1001
increment by 1
nocache;


create sequence audit_seq
minvalue 1
maxvalue 999999999999999999999999999
start with 1001
increment by 1
nocache;

/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.1.0

Source Server         : 172.16.86.56 oracle starter
Source Server Version : 110200
Source Host           : 172.16.86.56:1521
Source Schema         : STARTER

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2018-02-24 14:59:47
*/





-- ----------------------------
-- Table structure for cms_blog
-- ----------------------------
DROP TABLE cms_blog;
CREATE TABLE cms_blog (
id NUMBER(11) NOT NULL ,
title VARCHAR2(255) NULL ,
content VARCHAR2(512) NULL ,
create_time DATE NULL ,
create_user_id NUMBER(11) NULL ,
type VARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of cms_blog
-- ----------------------------
INSERT INTO  cms_blog VALUES ('1', 'hello', '我的博客，内容是。。。', TO_DATE('2018-02-22 09:53:05', 'YYYY-MM-DD HH24:MI:SS'), '1', 'F0');
INSERT INTO  cms_blog VALUES ('2', 'cccc', '过年回家', TO_DATE('2018-02-13 10:30:01', 'YYYY-MM-DD HH24:MI:SS'), '1', 'F0');

-- ----------------------------
-- Table structure for core_audit
-- ----------------------------
DROP TABLE  core_audit;
CREATE TABLE  core_audit (
ID NUMBER(11) NOT NULL ,
FUNCTION_CODE VARCHAR2(45) NULL ,
FUNCTION_NAME VARCHAR2(45) NULL ,
USER_ID NUMBER(11) NULL ,
USER_NAME VARCHAR2(45) NULL ,
IP VARCHAR2(45) NULL ,
CREATE_TIME DATE NULL ,
SUCCESS NUMBER(4) NULL ,
MESSAGE NCLOB NULL ,
ORG_ID VARCHAR2(45) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of core_audit
-- ----------------------------
INSERT INTO  core_audit VALUES ('1', 'org.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 19:58:50', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('2', 'org.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 19:58:51', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('3', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:00:10', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('4', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:00:11', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('5', 'user.add', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:00:39', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('6', 'user.edit', '用户编辑', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:10:15', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('7', 'user.query', '用户列表', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:10:15', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('8', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:10:16', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('9', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:10:17', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('10', 'user.edit', '用户编辑', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:14:46', 'YYYY-MM-DD HH24:MI:SS'), '0', 'java.sql.SQLException: Error on delete of ''C:\Users\ADMINI~1\AppData\Local\Temp\#sql978_2c3_6.MYI'' (Errcode: 13 - Permission denied)', null);
INSERT INTO  core_audit VALUES ('11', 'user.edit', '用户编辑', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:15:12', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('12', 'user.query', '用户列表', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:15:13', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('13', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:15:14', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('14', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:15:14', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('15', 'audit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-06 20:16:23', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('16', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:42:58', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('17', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:42:58', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('18', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:53:11', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('19', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:53:11', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('20', 'user.add', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:53:13', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('21', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:53:28', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('22', 'role.add', '角色添加', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:53:29', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('23', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:53:43', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('24', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:53:43', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('25', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:53:45', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('26', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:56:03', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('27', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:56:03', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('28', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:56:06', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('29', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:56:07', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('30', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:56:09', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('31', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 09:56:10', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('32', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:02:00', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('33', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:02:00', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('34', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:02:02', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('35', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:05:40', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('36', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:05:40', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('37', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:05:42', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('38', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:06:02', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('39', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:07:45', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('40', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:07:45', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('41', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:07:47', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('42', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:08:03', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('43', 'role.update', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:08:03', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('44', 'role.edit', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:08:16', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);
INSERT INTO  core_audit VALUES ('45', 'role.query', '未定义', '1', '超级管理员', '172.16.49.65', TO_DATE('2018-02-07 10:08:16', 'YYYY-MM-DD HH24:MI:SS'), '1', empty_clob(), null);

-- ----------------------------
-- Table structure for core_dict
-- ----------------------------
DROP TABLE  core_dict;
create table CORE_DICT
(
  id          NUMBER(11) not null,
  value       VARCHAR2(16) not null,
  name        VARCHAR2(128) not null,
  type        VARCHAR2(64) not null,
  type_name   VARCHAR2(64) not null,
  sort        NUMBER(11),
  parent      VARCHAR2(64),
  del_flag    NUMBER(11),
  remark      VARCHAR2(255),
  create_time DATE
  
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE  core_dict IS '字典表';
COMMENT ON COLUMN  core_dict."NAME" IS '名称';
COMMENT ON COLUMN  core_dict."TYPE" IS '字典编码';
COMMENT ON COLUMN  core_dict."TYPE_NAME" IS '类型描述';
COMMENT ON COLUMN  core_dict."SORT" IS '排序';
COMMENT ON COLUMN  core_dict."PARENT" IS '父id';
COMMENT ON COLUMN  core_dict."DEL_FLAG" IS '删除标记';
COMMENT ON COLUMN  core_dict."REMARK" IS '备注';
COMMENT ON COLUMN  core_dict."CREATE_TIME" IS '创建时间';


insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('DA0', '查看自己', 'data_access_type', '数据权限', 1, null, 0, '11111111111111111123', null, 1);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('DA1', '查看本公司', 'data_access_type', '数据权限', 3, null, 0, 'hello,go', null, 2);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('DA2', '查看同机构', 'data_access_type', '数据权限', 3, null, 0, null, null, 3);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('DA3', '查看本部门', 'data_access_type', '数据权限', 4, null, 0, null, null, 4);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('DA4', '查看集团', 'data_access_type', '数据权限', 5, null, 0, null, null, 5);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('DA5', '查看母公司', 'data_access_type', '数据权限', 6, null, 0, null, to_date('14-10-2017 11:45:02', 'dd-mm-yyyy hh24:mi:ss'), 6);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('FN0', '普通功能', 'function_type', '功能点类型', 2, null, 0, null, to_date('23-10-2017 10:18:03', 'dd-mm-yyyy hh24:mi:ss'), 7);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('FN1', '含数据权限', 'function_type', '功能点类型', 1, null, 0, null, to_date('23-10-2017 10:20:05', 'dd-mm-yyyy hh24:mi:ss'), 8);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('JT_01', '管理岗位', 'job_type', '岗位类型', 1, null, 0, null, null, 9);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('JT_02', '技术岗位', 'job_type', '岗位类型', 2, null, 0, null, null, 10);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('JT_S_01', '董事会', 'job_sub_managment_type', '管理岗位子类型', 1, '10', 0, null, null, 11);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('JT_S_02', '秘书', 'job_sub_managment_type', '管理岗位子类型', 2, '10', 0, null, null, 12);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('JT_S_03', '技术经理', 'job_dev_sub_type', '技术岗位子类型', 1, '11', 0, null, null, 13);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('JT_S_04', '程序员', 'job_dev_sub_type', '技术岗位子类型', 2, '11', 0, null, null, 14);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('MENU_M', '菜单', 'menu_type', '菜单类型', 3, null, 0, null, null, 15);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('MENU_N', '导航', 'menu_type', '菜单类型', 2, null, 0, null, null, 16);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('MENU_S', '系统', 'menu_type', '菜单类型', 1, null, 0, null, null, 17);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('ORGT0', '集团总部', 'org_type', '机构类型', 1, null, 0, null, null, 18);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('ORGT1', '分公司', 'org_type', '机构类型', 2, null, 0, null, null, 19);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('ORGT2', '部门', 'org_type', '机构类型', 3, null, 0, null, null, 20);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('ORGT3', '小组', 'org_type', '机构类型', 4, null, 0, null, null, 21);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('R0', '操作角色', 'role_type', '数据权限', 1, null, 0, null, null, 22);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('R1', '工作流角色', 'role_type', '用户角色', 2, null, 0, null, null, 23);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('S0', '禁用', 'user_state', '用户状态', 2, null, 0, null, null, 24);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('S1', '启用', 'user_state', '用户状态', 1, null, 0, null, null, 25);
insert into CORE_DICT (value, name, type, type_name, sort, parent, del_flag, remark, create_time, id)
values ('sdfsd', 'sdfsdf', 'sdfsdf', 'sdfsdf', 1, null, 1, 'dsfsdf', to_date('18-02-2018 21:31:02', 'dd-mm-yyyy hh24:mi:ss'), 26);


-- ----------------------------
-- Table structure for core_file
-- ----------------------------
DROP TABLE  core_file;
CREATE TABLE  core_file (
ID NUMBER(11) NOT NULL ,
NAME VARCHAR2(64) NULL ,
PATH VARCHAR2(255) NULL ,
BIZ_NO VARCHAR2(128) NULL ,
UPDATE_USER_ID NUMBER(11) NULL ,
EXT1 VARCHAR2(255) NULL ,
DEL_FLAG NUMBER(4) NULL ,
CREATE_TIME DATE NULL ,
UPLOAD_USER_ORG NUMBER(11) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE  core_file IS '文件表';
COMMENT ON COLUMN  core_file."NAME" IS '文件名称';
COMMENT ON COLUMN  core_file."PATH" IS '路径';
COMMENT ON COLUMN  core_file."BIZ_NO" IS '业务ID';
COMMENT ON COLUMN  core_file."UPDATE_USER_ID" IS '上传人id';
COMMENT ON COLUMN  core_file."EXT1" IS '扩展字段';
COMMENT ON COLUMN  core_file."DEL_FLAG" IS '删除标记';
COMMENT ON COLUMN  core_file."CREATE_TIME" IS '创建时间';

-- ----------------------------
-- Records of core_file
-- ----------------------------
INSERT INTO  core_file VALUES ('1', '文件1', '/dal', '1', '1', null, '0', null, '1');
INSERT INTO  core_file VALUES ('2', 'ajls', '/aefs', '2', '2', null, '0', null, '1');

-- ----------------------------
-- Table structure for core_file_tag
-- ----------------------------
DROP TABLE  core_file_tag;
CREATE TABLE  core_file_tag (
ID NUMBER(11) NOT NULL ,
KEY VARCHAR2(64) NOT NULL ,
VALUE VARCHAR2(255) NOT NULL ,
FILE_ID NUMBER(11) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE  core_file_tag IS '文件标签';
COMMENT ON COLUMN  core_file_tag."KEY" IS 'key，关键字';
COMMENT ON COLUMN  core_file_tag."VALUE" IS '关键字对应的值';
COMMENT ON COLUMN  core_file_tag."FILE_ID" IS 'sys_file的id，文件id';

-- ----------------------------
-- Records of core_file_tag
-- ----------------------------
INSERT INTO  core_file_tag VALUES ('1', 'customer', '12332', '1');
INSERT INTO  core_file_tag VALUES ('2', 'type', 'crdit', '2');

-- ----------------------------
-- Table structure for core_function
-- ----------------------------
DROP TABLE core_function;
CREATE TABLE core_function (
ID NUMBER(11) NOT NULL ,
CODE NCLOB NULL ,
NAME VARCHAR2(16) NULL ,
CREATE_TIME DATE NULL ,
ACCESS_URL NCLOB NULL ,
PARENT_ID NUMBER(11) NULL ,
TYPE VARCHAR2(4) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of core_function
-- ----------------------------
INSERT INTO  core_function VALUES ('1', 'user', '用户功能', null, '/admin/user/index.do', '0', 'FN0');
INSERT INTO  core_function VALUES ('2', 'user.query', '用户列表', null, null, '1', 'FN1');
INSERT INTO  core_function VALUES ('3', 'user.edit', '用户编辑', null, null, '1', 'FN0');
INSERT INTO  core_function VALUES ('6', 'org', '组织机构', null, '/admin/org/index.do', '0', 'FN0');
INSERT INTO  core_function VALUES ('7', 'role', '角色管理', null, '/admin/role/index.do', '0', 'FN0');
INSERT INTO  core_function VALUES ('8', 'menu', '菜单管理', null, '/admin/menu/index.do', '0', 'FN0');
INSERT INTO  core_function VALUES ('9', 'function', '功能点管理', null, '/admin/function/index.do', '0', 'FN0');
INSERT INTO  core_function VALUES ('10', 'roleFunction', '角色功能授权', null, '/admin/role/function.do', '0', 'FN0');
INSERT INTO  core_function VALUES ('11', 'roleDataAccess', '角色数据授权', null, '/admin/role/data.do', '0', 'FN0');
INSERT INTO  core_function VALUES ('12', 'code', '代码生成', null, '/core/codeGen/index.do', '0', 'FN0');
INSERT INTO  core_function VALUES ('13', 'dict', '字典管理', null, '/admin/dict/index.do', '0', 'FN0');
INSERT INTO  core_function VALUES ('18', 'trace', '审计查询', null, '/admin/audit/index.do', '0', 'FN0');
INSERT INTO  core_function VALUES ('19', 'file', '相关文档', null, '/trade/interAndRelate/file.do', '0', 'FN0');
INSERT INTO  core_function VALUES ('91', 'test', '测试', TO_DATE('2017-10-11 16:59:01', 'YYYY-MM-DD HH24:MI:SS'), '/test/test.do', '6', 'FN0');
INSERT INTO  core_function VALUES ('161', 'role.add', '角色添加', TO_DATE('2017-10-23 09:45:05', 'YYYY-MM-DD HH24:MI:SS'), null, '7', 'FN0');
INSERT INTO  core_function VALUES ('167', 'workflow.admin', '工作流监控', null, '/admin/workflow/index.do', '0', 'FN0');
INSERT INTO  core_function VALUES ('180', 'code.query', '代码生成测试', null, null, '12', 'FN0');
INSERT INTO  core_function VALUES ('181', 'blog.query', '博客查询功能', null, empty_clob(), '182', 'FN0');
INSERT INTO  core_function VALUES ('182', 'blog', '博客测试', null, '/admin/blog/index.do', '0', 'FN0');

-- ----------------------------
-- Table structure for core_menu
-- ----------------------------
DROP TABLE core_menu;
CREATE TABLE core_menu (
ID NUMBER(11) NOT NULL ,
CODE VARCHAR2(16) NULL ,
NAME VARCHAR2(16) NULL ,
CREATE_TIME DATE NULL ,
FUNCTION_ID NUMBER(11) NULL ,
TYPE VARCHAR2(6) NULL ,
PARENT_MENU_ID NUMBER(11) NULL ,
SEQ NUMBER(11) NULL ,
ICON VARCHAR2(255) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN  core_menu."TYPE" IS '1,系统，2 导航 3 菜单项（对应某个功能点）';
COMMENT ON COLUMN  core_menu."ICON" IS '图标';

-- ----------------------------
-- Records of core_menu
-- ----------------------------
INSERT INTO  core_menu VALUES ('8', '系统管理', '系统管理', null, null, 'MENU_S', '0', '1', null);
INSERT INTO  core_menu VALUES ('10', '用户管理', '用户管理', null, '1', 'MENU_M', '18', '1', null);
INSERT INTO  core_menu VALUES ('11', '组织机构管理', '组织机构管理', null, '6', 'MENU_M', '18', '2', null);
INSERT INTO  core_menu VALUES ('12', '角色管理', '角色管理', null, '7', 'MENU_M', '18', '3', null);
INSERT INTO  core_menu VALUES ('13', '菜单项', '菜单项', null, '8', 'MENU_M', '18', '4', null);
INSERT INTO  core_menu VALUES ('14', '功能点管理', '功能点管理', null, '9', 'MENU_M', '18', '5', null);
INSERT INTO  core_menu VALUES ('15', '字典数据管理', '字典数据管理', null, '13', 'MENU_M', '18', '6', null);
INSERT INTO  core_menu VALUES ('16', '审计查询', '审计查询', null, '18', 'MENU_M', '19', '7', null);
INSERT INTO  core_menu VALUES ('17', '代码生成', '代码生成', null, '12', 'MENU_M', '19', '8', null);
INSERT INTO  core_menu VALUES ('18', '基础管理', '基础管理', null, null, 'MENU_N', '8', '1', null);
INSERT INTO  core_menu VALUES ('19', '监控管理', '监控管理', null, null, 'MENU_N', '8', '2', null);
INSERT INTO  core_menu VALUES ('20', '流程监控', '流程监控', null, '167', 'MENU_M', '19', '3', null);
INSERT INTO  core_menu VALUES ('21', '角色功能授权', '角色功能授权', null, '10', 'MENU_M', '18', '8', null);
INSERT INTO  core_menu VALUES ('22', '角色数据授权', '角色数据授权', null, '11', 'MENU_M', '18', '9', null);
INSERT INTO  core_menu VALUES ('23', '博客测试', '博客测试1', null, '182', 'MENU_M', '19', '9', null);

-- ----------------------------
-- Table structure for core_org
-- ----------------------------
DROP TABLE core_org;
CREATE TABLE  core_org (
ID NUMBER(11) NOT NULL ,
CODE VARCHAR2(16) NOT NULL ,
NAME VARCHAR2(128) NOT NULL ,
CREATE_TIME DATE NULL ,
PARENT_ORG_ID NUMBER(11) NULL ,
TYPE VARCHAR2(6) NOT NULL ,
DEL_FLAG NUMBER(4) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN  core_org.TYPE IS '1 公司，2 部门，3 小组';

-- ----------------------------
-- Records of core_org
-- ----------------------------
INSERT INTO  core_org VALUES ('1', '集团公司', '集团', TO_DATE('2018-02-02 17:18:50', 'YYYY-MM-DD HH24:MI:SS'), null, 'ORGT0', '0');
INSERT INTO  core_org VALUES ('3', '信息科技部门', '信息科技部门', null, '1', 'ORGT2', '0');
INSERT INTO  core_org VALUES ('4', '贵州银行', '贵州银行', TO_DATE('2018-02-02 17:18:56', 'YYYY-MM-DD HH24:MI:SS'), '1', 'ORGT1', '0');
INSERT INTO  core_org VALUES ('5', '贵州银行金科', '贵州银行金融科技开发公司', null, '4', 'ORGT1', '0');
INSERT INTO  core_org VALUES ('6', '金科研发', '金科研发', null, '5', 'ORGT2', '0');
INSERT INTO  core_org VALUES ('7', '金科研发部门', '金科研发部门', TO_DATE('2018-02-05 13:49:52', 'YYYY-MM-DD HH24:MI:SS'), '6', 'ORGT2', '0');
INSERT INTO  core_org VALUES ('8', '金科研发2部', '金科研发2部', TO_DATE('2018-02-05 13:50:43', 'YYYY-MM-DD HH24:MI:SS'), '6', 'ORGT2', '0');

-- ----------------------------
-- Table structure for core_role
-- ----------------------------
DROP TABLE core_role;
CREATE TABLE  core_role (
ID NUMBER(11) NOT NULL ,
CODE VARCHAR2(16) NULL ,
NAME VARCHAR2(255) NULL ,
CREATE_TIME DATE NULL ,
TYPE VARCHAR2(6) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN  core_role."CODE" IS '角色编码';
COMMENT ON COLUMN  core_role."NAME" IS '角色名称';
COMMENT ON COLUMN  core_role."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN  core_role."TYPE" IS '1 可以配置 2 固定权限角色';

-- ----------------------------
-- Records of core_role
-- ----------------------------
INSERT INTO  core_role VALUES ('1', 'DEPT_MANAGER', '部门管理员', null, 'R0');
INSERT INTO  core_role VALUES ('2', 'CEO', '公司CEO', null, 'R0');
INSERT INTO  core_role VALUES ('3', 'ASSIST', '助理', null, 'R0');
INSERT INTO  core_role VALUES ('12', '111', '2324324', TO_DATE('2017-09-06 04:08:00', 'YYYY-MM-DD HH24:MI:SS'), 'R0');
INSERT INTO  core_role VALUES ('13', '1111', '哈哈', TO_DATE('2017-09-06 04:09:05', 'YYYY-MM-DD HH24:MI:SS'), 'R0');
INSERT INTO  core_role VALUES ('15', 'admin', 'ivy', TO_DATE('2017-09-06 05:35:04', 'YYYY-MM-DD HH24:MI:SS'), 'R0');
INSERT INTO  core_role VALUES ('17', '123', '我', TO_DATE('2017-09-06 21:23:03', 'YYYY-MM-DD HH24:MI:SS'), 'R0');
INSERT INTO  core_role VALUES ('18', '23', '234', TO_DATE('2017-09-06 21:41:03', 'YYYY-MM-DD HH24:MI:SS'), 'R0');
INSERT INTO  core_role VALUES ('19', '132484', '1', TO_DATE('2017-09-06 21:42:02', 'YYYY-MM-DD HH24:MI:SS'), 'R0');
INSERT INTO  core_role VALUES ('173', 'dept.admin', '部门辅助管理员', TO_DATE('2017-10-25 10:29:03', 'YYYY-MM-DD HH24:MI:SS'), 'R0');

-- ----------------------------
-- Table structure for core_role_function
-- ----------------------------
DROP TABLE core_role_function;
CREATE TABLE  core_role_function (
ID NUMBER(11) NOT NULL ,
ROLE_ID NUMBER(11) NULL ,
FUNCTION_ID NUMBER(11) NULL ,
DATA_ACCESS_TYPE NUMBER(4) NULL ,
DATA_ACCESS_POLICY VARCHAR2(128) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of core_role_function
-- ----------------------------
INSERT INTO  core_role_function VALUES ('1', '1', '1', '5', null);
INSERT INTO  core_role_function VALUES ('2', '1', '2', '1', null);
INSERT INTO  core_role_function VALUES ('3', '1', '3', '5', null);
INSERT INTO  core_role_function VALUES ('4', '2', '2', '2', null);
INSERT INTO  core_role_function VALUES ('5', '3', '2', '5', null);
INSERT INTO  core_role_function VALUES ('6', '3', '3', '5', null);
INSERT INTO  core_role_function VALUES ('162', '1', '6', null, null);
INSERT INTO  core_role_function VALUES ('164', '1', '91', null, null);
INSERT INTO  core_role_function VALUES ('174', '173', '1', null, null);
INSERT INTO  core_role_function VALUES ('176', '173', '2', '5', null);
INSERT INTO  core_role_function VALUES ('177', '173', '3', null, null);
INSERT INTO  core_role_function VALUES ('178', '173', '167', null, null);
INSERT INTO  core_role_function VALUES ('192', '3', '1', null, null);
INSERT INTO  core_role_function VALUES ('194', '3', '12', null, null);
INSERT INTO  core_role_function VALUES ('196', '3', '180', '3', null);
INSERT INTO  core_role_function VALUES ('197', null, '1', null, null);
INSERT INTO  core_role_function VALUES ('198', null, '2', null, null);
INSERT INTO  core_role_function VALUES ('199', null, '3', null, null);
INSERT INTO  core_role_function VALUES ('200', null, '6', null, null);
INSERT INTO  core_role_function VALUES ('201', null, '91', null, null);
INSERT INTO  core_role_function VALUES ('202', null, '8', null, null);
INSERT INTO  core_role_function VALUES ('205', '1', '182', null, null);
INSERT INTO  core_role_function VALUES ('206', '1', '181', null, null);

-- ----------------------------
-- Table structure for core_role_menu
-- ----------------------------
DROP TABLE core_role_menu;
CREATE TABLE  core_role_menu (
ID NUMBER(11) NOT NULL ,
ROLE_ID NUMBER(11) NULL ,
MENU_ID NUMBER(11) NULL ,
CREATE_TIME DATE NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of core_role_menu
-- ----------------------------
INSERT INTO  core_role_menu VALUES ('1', '1', '10', null);
INSERT INTO  core_role_menu VALUES ('163', '1', '11', null);
INSERT INTO  core_role_menu VALUES ('175', '173', '10', null);
INSERT INTO  core_role_menu VALUES ('193', '3', '10', null);
INSERT INTO  core_role_menu VALUES ('195', '3', '17', null);
INSERT INTO  core_role_menu VALUES ('196', null, '10', null);
INSERT INTO  core_role_menu VALUES ('197', null, '11', null);
INSERT INTO  core_role_menu VALUES ('198', null, '13', null);
INSERT INTO  core_role_menu VALUES ('200', '1', '23', null);

-- ----------------------------
-- Table structure for core_user
-- ----------------------------
DROP TABLE core_user;
CREATE TABLE  core_user (
ID NUMBER(11) NOT NULL ,
CODE VARCHAR2(16) NULL ,
NAME VARCHAR2(16) NULL ,
PASSWORD VARCHAR2(64) NULL ,
CREATE_TIME DATE NULL ,
ORG_ID NUMBER(11) NULL ,
STATE VARCHAR2(16) NULL ,
JOB_TYPE1 VARCHAR2(16) NULL ,
DEL_FLAG NUMBER(4) NULL ,
update_Time DATE NULL ,
JOB_TYPE0 VARCHAR2(16) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN  core_user."STATE" IS '用户状态 1:启用 0:停用';
COMMENT ON COLUMN  core_user."DEL_FLAG" IS '用户删除标记 0:未删除 1:已删除';

-- ----------------------------
-- Records of core_user
-- ----------------------------
INSERT INTO  core_user VALUES ('1', 'admin', '超级管理员1', '123456', TO_DATE('2017-09-13 09:21:03', 'YYYY-MM-DD HH24:MI:SS'), '1', 'S1', 'JT_S_01', '0', TO_DATE('2017-09-13 09:21:03', 'YYYY-MM-DD HH24:MI:SS'), 'JT_01');
INSERT INTO  core_user VALUES ('171', 'lixx', '李小小', null, TO_DATE('2018-01-28 11:21:20', 'YYYY-MM-DD HH24:MI:SS'), '3', 'S1', 'JT_S_04', '0', null, 'JT_02');
INSERT INTO  core_user VALUES ('172', 'lixx2', '李xx2', '123456', TO_DATE('2018-01-28 11:22:38', 'YYYY-MM-DD HH24:MI:SS'), '4', 'S1', 'JT_S_02', '0', null, 'JT_01');
INSERT INTO  core_user VALUES ('173', 'test1', 'test1', '123', TO_DATE('2018-01-28 14:44:55', 'YYYY-MM-DD HH24:MI:SS'), '5', 'S1', 'JT_S_04', '0', null, 'JT_02');
INSERT INTO  core_user VALUES ('174', 'hank250', '李小熊', null, TO_DATE('2018-02-16 11:36:41', 'YYYY-MM-DD HH24:MI:SS'), '4', 'S1', 'JT_S_04', '0', null, 'JT_02');

-- ----------------------------
-- Table structure for core_user_role
-- ----------------------------
DROP TABLE core_user_role;
CREATE TABLE  core_user_role (
ID NUMBER(11) NOT NULL ,
USER_ID NUMBER(11) NULL ,
ROLE_ID NUMBER(11) NULL ,
ORG_ID NUMBER(11) NULL ,
CREATE_TIME DATE NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE  core_user_role IS '用户角色关系表';

-- ----------------------------
-- Records of core_user_role
-- ----------------------------
INSERT INTO  core_user_role VALUES ('1', '3', '1', '4', null);
INSERT INTO  core_user_role VALUES ('2', '4', '2', '5', null);
INSERT INTO  core_user_role VALUES ('3', '75', '3', '6', TO_DATE('2017-09-21 18:03:05', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('35', '1', '1', '1', TO_DATE('2017-09-06 01:12:02', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('36', '1', '3', '6', TO_DATE('2017-09-06 03:33:05', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('38', '1', '1', '3', TO_DATE('2017-09-06 03:35:02', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('41', '1', '1', '5', TO_DATE('2017-09-06 03:58:02', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('42', '3', '3', '1', TO_DATE('2017-09-06 04:01:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('47', '47', '3', '1', TO_DATE('2017-09-06 22:00:01', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('49', '5', '3', '4', TO_DATE('2017-09-06 22:01:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('52', '47', '2', '1', TO_DATE('2017-09-07 01:12:02', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('53', '48', '3', '4', TO_DATE('2017-09-07 01:14:04', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('55', '68', '2', '3', TO_DATE('2017-09-07 21:42:03', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('125', '74', '1', '4', TO_DATE('2017-10-17 09:37:02', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('144', '74', '3', null, TO_DATE('2017-10-17 16:55:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('145', '67', '3', null, TO_DATE('2017-10-17 16:55:01', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('146', '73', '3', null, TO_DATE('2017-10-17 16:55:02', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('147', '22', '3', null, TO_DATE('2017-10-17 16:55:04', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('148', '68', '3', null, TO_DATE('2017-10-17 16:56:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('168', '72', '1', '3', TO_DATE('2017-10-24 14:40:04', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('169', '41', '1', null, TO_DATE('2017-10-25 08:58:01', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('171', '170', '1', '5', TO_DATE('2017-10-25 09:08:05', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO  core_user_role VALUES ('172', '171', '1', '4', TO_DATE('2018-02-02 09:36:40', 'YYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Indexes structure for table cms_blog
-- ----------------------------

-- ----------------------------
-- Checks structure for table cms_blog
-- ----------------------------
ALTER TABLE  cms_blog ADD CHECK (id IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table cms_blog
-- ----------------------------
ALTER TABLE  cms_blog ADD PRIMARY KEY (id);

-- ----------------------------
-- Indexes structure for table core_audit
-- ----------------------------

-- ----------------------------
-- Checks structure for table core_audit
-- ----------------------------
ALTER TABLE  core_audit ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table core_audit
-- ----------------------------
ALTER TABLE  core_audit ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table core_dict
-- ----------------------------
CREATE INDEX  "idx_code"
ON  core_dict (TYPE ASC)
LOGGING
VISIBLE;
CREATE INDEX  "idx_pid"
ON  core_dict (PARENT ASC)
LOGGING
VISIBLE;
CREATE INDEX  "idx_value"
ON  core_dict (VALUE ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table core_dict
-- ----------------------------
ALTER TABLE  core_dict ADD CHECK (VALUE IS NOT NULL);
ALTER TABLE  core_dict ADD CHECK (NAME IS NOT NULL);
ALTER TABLE  core_dict ADD CHECK (TYPE IS NOT NULL);
ALTER TABLE  core_dict ADD CHECK (TYPE_NAME IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table core_dict
-- ----------------------------
ALTER TABLE  core_dict ADD PRIMARY KEY (id);

-- ----------------------------
-- Indexes structure for table core_file
-- ----------------------------

-- ----------------------------
-- Checks structure for table core_file
-- ----------------------------
ALTER TABLE  core_file ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table core_file
-- ----------------------------
ALTER TABLE  core_file ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table core_file_tag
-- ----------------------------

-- ----------------------------
-- Checks structure for table core_file_tag
-- ----------------------------
ALTER TABLE  core_file_tag ADD CHECK (ID IS NOT NULL);
ALTER TABLE  core_file_tag ADD CHECK (KEY IS NOT NULL);
ALTER TABLE  core_file_tag ADD CHECK (VALUE IS NOT NULL);
ALTER TABLE  core_file_tag ADD CHECK (FILE_ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table core_file_tag
-- ----------------------------
ALTER TABLE  core_file_tag ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table core_function
-- ----------------------------

-- ----------------------------
-- Checks structure for table core_function
-- ----------------------------
ALTER TABLE  core_function ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table core_function
-- ----------------------------
ALTER TABLE  core_function ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table core_menu
-- ----------------------------

-- ----------------------------
-- Checks structure for table core_menu
-- ----------------------------
ALTER TABLE  core_menu ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table core_menu
-- ----------------------------
ALTER TABLE  core_menu ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table core_org
-- ----------------------------

-- ----------------------------
-- Checks structure for table core_org
-- ----------------------------
ALTER TABLE  core_org ADD CHECK (ID IS NOT NULL);
ALTER TABLE  core_org ADD CHECK (CODE IS NOT NULL);
ALTER TABLE  core_org ADD CHECK (NAME IS NOT NULL);
ALTER TABLE  core_org ADD CHECK (TYPE IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table core_org
-- ----------------------------
ALTER TABLE  core_org ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table core_role
-- ----------------------------
CREATE INDEX  "code_idx"
ON  core_role (CODE ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table core_role
-- ----------------------------
ALTER TABLE  core_role ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table core_role
-- ----------------------------
ALTER TABLE  core_role ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table core_role_function
-- ----------------------------

-- ----------------------------
-- Checks structure for table core_role_function
-- ----------------------------
ALTER TABLE  core_role_function ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table core_role_function
-- ----------------------------
ALTER TABLE  core_role_function ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table core_role_menu
-- ----------------------------

-- ----------------------------
-- Checks structure for table core_role_menu
-- ----------------------------
ALTER TABLE  core_role_menu ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table core_role_menu
-- ----------------------------
ALTER TABLE  core_role_menu ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table core_user
-- ----------------------------

-- ----------------------------
-- Checks structure for table core_user
-- ----------------------------
ALTER TABLE  core_user ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table core_user
-- ----------------------------
ALTER TABLE  core_user ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table core_user_role
-- ----------------------------

-- ----------------------------
-- Checks structure for table core_user_role
-- ----------------------------
ALTER TABLE  core_user_role ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table core_user_role
-- ----------------------------
ALTER TABLE  core_user_role ADD PRIMARY KEY (ID);
