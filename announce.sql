/*
Navicat MySQL Data Transfer

Source Server         : AAA
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : oa_system

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-11-10 09:58:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for announce
-- ----------------------------
DROP TABLE IF EXISTS `announce`;
CREATE TABLE `announce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `endTime` date DEFAULT NULL,
  `suntime` date DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `content` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announce
-- ----------------------------
INSERT INTO `announce` VALUES ('7', '第2集', '1', '2018-02-02', '2018-05-05', '2018-10-11', '1', 'asdfghj');
INSERT INTO `announce` VALUES ('8', 'java高级1', '1', '2018-02-02', '2018-05-05', '2018-10-11', '1', 'sadfadsf');
INSERT INTO `announce` VALUES ('12', 'java高级1', '1', '2018-02-02', '2018-05-05', '2019-02-02', '1', 'sadfadsf');
INSERT INTO `announce` VALUES ('13', 'java高级1', '0', '2018-02-02', '2018-05-05', '2018-10-11', '1', 'sadfadsf');
INSERT INTO `announce` VALUES ('14', '第2集', '0', '2018-02-02', '2018-05-05', '2018-10-15', '1', '驱蚊器翁');
INSERT INTO `announce` VALUES ('15', 'qwe', '1', '2018-10-10', '2018-12-10', '2019-05-05', '1', 'adsf');
INSERT INTO `announce` VALUES ('16', null, '1', null, null, null, null, null);
INSERT INTO `announce` VALUES ('17', null, '1', null, null, null, null, null);
INSERT INTO `announce` VALUES ('18', '测试', '0', '2018-02-02', '2018-05-05', '2018-10-15', '1', '双方的第三代');
INSERT INTO `announce` VALUES ('19', 'testttttt', '0', '2018-02-02', '2018-05-05', '2018-10-11', '1', '123123');
INSERT INTO `announce` VALUES ('20', 'Test123123', '0', '2018-02-02', '2018-05-05', '2018-10-15', '1', '驱蚊器翁');
INSERT INTO `announce` VALUES ('21', '最后一次测试', '1', '2018-02-02', '2018-05-05', '2018-10-15', '1', '驱蚊器翁');
INSERT INTO `announce` VALUES ('22', '阿斯顿发斯蒂芬', '0', '2018-02-02', '2018-05-05', '2018-10-15', '1', '我去二群翁群翁');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookId` varchar(11) DEFAULT NULL,
  `name` varchar(11) DEFAULT NULL,
  `id` int(1) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('A11', '金瓶梅', '1');
INSERT INTO `book` VALUES ('A22', '水浒传', '2');
INSERT INTO `book` VALUES ('A33', '西游记', '3');
INSERT INTO `book` VALUES ('A44', '将夜', '4');
INSERT INTO `book` VALUES ('A55', '盘龙', '5');
INSERT INTO `book` VALUES ('A66', '红楼梦', '6');
INSERT INTO `book` VALUES ('A88', '三国演义', '7');

-- ----------------------------
-- Table structure for book_reserve
-- ----------------------------
DROP TABLE IF EXISTS `book_reserve`;
CREATE TABLE `book_reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `endTime` timestamp NULL DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `bookId` int(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `typeall` int(11) DEFAULT NULL,
  `taskid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_reserve
-- ----------------------------
INSERT INTO `book_reserve` VALUES ('1', '1', '2018-11-13 00:00:00', '2018-11-14 00:00:00', '1', '2', '2', '1', null, null);
INSERT INTO `book_reserve` VALUES ('2', '1', '2018-11-13 00:00:00', '2018-11-13 00:00:00', '1', '2', '2', '1', null, null);
INSERT INTO `book_reserve` VALUES ('3', '1', '2018-11-13 12:00:00', '2018-11-13 15:00:00', '1', '2', '2', '1', null, null);
INSERT INTO `book_reserve` VALUES ('10', '1', '2018-11-13 00:00:00', '2018-11-13 00:00:00', '1', '2', '2', '1', null, null);
INSERT INTO `book_reserve` VALUES ('11', '18', '2018-11-13 00:00:00', '2018-11-13 00:00:00', '2', '2', '13', '1', null, null);
INSERT INTO `book_reserve` VALUES ('12', '18', '2018-11-17 00:00:00', '2018-11-17 00:00:00', '2', '2', '13', null, '5', '50006');
INSERT INTO `book_reserve` VALUES ('13', '18', '2018-11-14 00:00:00', '2018-11-14 00:00:00', '2', '3', '13', '0', '5', '52528');
INSERT INTO `book_reserve` VALUES ('14', '18', '2018-11-13 00:00:00', '2018-11-13 00:00:00', '2', '5', '19', '0', '5', '65017');

-- ----------------------------
-- Table structure for cachet
-- ----------------------------
DROP TABLE IF EXISTS `cachet`;
CREATE TABLE `cachet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `utime` date DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `remark` varchar(22) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `typeall` int(11) DEFAULT NULL,
  `taskid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cachet
-- ----------------------------
INSERT INTO `cachet` VALUES ('1', '1', '2018-11-14', '1', '2', 'asda', '1', null, null, null);
INSERT INTO `cachet` VALUES ('9', '18', '2018-11-14', '2', '2', 'sad', '13', null, '45006', null);
INSERT INTO `cachet` VALUES ('10', '18', '2018-11-14', '2', '1', 'gdfg', '13', '4', '47506', null);
INSERT INTO `cachet` VALUES ('11', '18', '2018-11-14', '2', '2', 'asd', '13', '4', '52517', null);
INSERT INTO `cachet` VALUES ('12', '18', '2018-11-14', '2', '2', 'sad', '12', '4', '57517', '0');
INSERT INTO `cachet` VALUES ('13', '18', '2018-11-14', '2', '2', 'fuf', '12', '4', '65006', '0');
INSERT INTO `cachet` VALUES ('14', '12', '2018-12-11', '1', '2', '', '26', '4', '25', '0');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carId` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('1', '京A12212', '金杯小货车', '白色', '我最快');
INSERT INTO `car` VALUES ('2', '京A12211', '五菱荣光', '红色', '秋名山见');
INSERT INTO `car` VALUES ('3', '京A12213', '五菱宏光', '白色', '六六');
INSERT INTO `car` VALUES ('4', '京A12214', '现代轿车', '白色', '牛比');
INSERT INTO `car` VALUES ('8', '京A99999', '法拉利', '酒红色', '无');
INSERT INTO `car` VALUES ('9', '京B12211', '奥迪A8L', '黑色', '无');
INSERT INTO `car` VALUES ('10', '京B12221', '奔驰S级', '黑色', '');
INSERT INTO `car` VALUES ('11', '京A12223', '红旗H7', '钢琴黑', '无');
INSERT INTO `car` VALUES ('12', '京A00001', '红旗H9阅兵版', '黑色', '无');
INSERT INTO `car` VALUES ('13', '京A00002', '红旗H9至尊版', '黑色', '无');
INSERT INTO `car` VALUES ('14', '京A11111', '红旗H9行政版', '黑色', '无');
INSERT INTO `car` VALUES ('15', '京B66666', '英菲尼迪', '紫色', '无');
INSERT INTO `car` VALUES ('16', '京B88888', '兰博基尼毒药', '金属灰', '无');
INSERT INTO `car` VALUES ('17', '京B99999', '迈凯伦P1', '黑白', null);
INSERT INTO `car` VALUES ('18', '京A12345', '奥迪A6L', '黑色', '');
INSERT INTO `car` VALUES ('19', '京A12344', '奥迪A6L', '黑色', '');
INSERT INTO `car` VALUES ('20', '京A12332', '奥迪A4L', '白色', '');
INSERT INTO `car` VALUES ('23', '京A44444', '奥迪A8L', '黑色', '');
INSERT INTO `car` VALUES ('31', '京B66645', '丰田皇冠', '黑色', null);
INSERT INTO `car` VALUES ('35', '京A13331', '奇瑞', '白色', '无');
INSERT INTO `car` VALUES ('36', '京K88888', '现代索纳塔', '黑色', '东方工商');

-- ----------------------------
-- Table structure for car_reserve
-- ----------------------------
DROP TABLE IF EXISTS `car_reserve`;
CREATE TABLE `car_reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carId` varchar(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `endTime` date DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `miles` int(11) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `taskid` int(11) DEFAULT NULL,
  `typeall` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_reserve
-- ----------------------------
INSERT INTO `car_reserve` VALUES ('2', '京A66666', '4', '2018-11-11', '2018-11-20', '南京', '1200', '风格化法国', '3', null, null, null);
INSERT INTO `car_reserve` VALUES ('3', '京B88888', '4', '2018-11-11', '2018-11-20', '上海', '1200', '纷纷改行', '2', null, null, null);
INSERT INTO `car_reserve` VALUES ('6', '京B88888', '4', '2018-11-25', '2018-11-30', '南京', '1200', '的风光过后', '4', null, null, null);
INSERT INTO `car_reserve` VALUES ('7', '京B88888', '4', '2018-12-22', '2018-12-25', '南京', '1250', '符合规范规定', '2', '56', '3', '0');
INSERT INTO `car_reserve` VALUES ('8', '京A88888', '4', '2018-11-11', '2018-11-20', '上海', '1200', '公务', '2', '67', '3', '0');
INSERT INTO `car_reserve` VALUES ('9', '京A66666', '4', '2018-11-21', '2018-11-22', '合肥', '1250', '送人', '2', '78', '3', '0');
INSERT INTO `car_reserve` VALUES ('10', '京B88888', '4', '2018-12-01', '2018-12-02', '合肥', '1200', '接总经理', '3', '89', '3', '0');
INSERT INTO `car_reserve` VALUES ('11', '京B66666', '4', '2018-11-11', '2018-11-20', '合肥', '1200', '先垫付部分', '2', '5029', '3', '0');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '研发部');
INSERT INTO `dept` VALUES ('2', '人事部');
INSERT INTO `dept` VALUES ('3', '业务部');
INSERT INTO `dept` VALUES ('4', '运营部');
INSERT INTO `dept` VALUES ('5', '市场部');
INSERT INTO `dept` VALUES ('6', '公关部');

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name1` varchar(110) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `pId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `remark` varchar(11) DEFAULT NULL,
  `isdelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document
-- ----------------------------
INSERT INTO `document` VALUES ('1', '文件夹', '', '文件夹', '-1', '11', '2018-11-06', '备注', '0');
INSERT INTO `document` VALUES ('5', '文件夹', '/resource/wenjain', '文件夹', '11', '11', '2018-11-06', '备注', '0');
INSERT INTO `document` VALUES ('11', '文件夹', '', '文件夹', '-1', '12', '2018-11-06', '备注', '0');
INSERT INTO `document` VALUES ('16', '驱蚊器翁', '', '文件夹', '-1', '12', '2018-11-07', '备注', '0');
INSERT INTO `document` VALUES ('17', '文件夹1', '/resource/wenjain', '文件夹', '11', '12', '2018-11-06', '备注', '1');
INSERT INTO `document` VALUES ('24', '文件夹3', '/resource/wenjain', '文件夹', '1', '12', '2018-11-06', '备注1', '0');
INSERT INTO `document` VALUES ('32', '夹', 'C:\\Users\\LulzSec\\Desktop\\新建文件夹\\AOsystem1\\target\\AOsystem1\\resource/Test.java', 'java', null, '11', null, 'qwdf', '0');
INSERT INTO `document` VALUES ('33', '夹', 'C:\\Users\\LulzSec\\Desktop\\新建文件夹\\AOsystem1\\target\\AOsystem1\\resource/新建文本文档.txt', '新建文本文档.txt', null, '11', null, 'qwe', '0');
INSERT INTO `document` VALUES ('34', '夹1', 'C:\\Users\\LulzSec\\Desktop\\新建文件夹\\AOsystem1\\target\\AOsystem1\\resource/Test.java', 'java', null, '13', null, '是大法官', '0');
INSERT INTO `document` VALUES ('35', '夹', '', '文件夹', '-1', '13', '2018-11-08', null, '0');
INSERT INTO `document` VALUES ('36', '文件夹1', '/resource/wenjain', '文件夹', '11', '14', '2018-11-06', '备注', '1');
INSERT INTO `document` VALUES ('37', '文件夹2', '/resource/wenjain', '文件夹', '11', '14', '2018-11-06', '备注', '1');
INSERT INTO `document` VALUES ('38', '文件夹3', '/resource/wenjain', '文件夹', '11', '15', '2018-11-06', '备注', '1');

-- ----------------------------
-- Table structure for income
-- ----------------------------
DROP TABLE IF EXISTS `income`;
CREATE TABLE `income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `taskid` int(11) DEFAULT NULL,
  `typeall` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of income
-- ----------------------------
INSERT INTO `income` VALUES ('1', '1', '5', '部门主管', '2018-11-06', '想得钱', '5', null, null, null);
INSERT INTO `income` VALUES ('2', '3', '3', '总经理', '2018-11-08', '阿飞噶', '1', null, null, null);
INSERT INTO `income` VALUES ('3', '4', '6', '总经理', '2018-11-11', '我赚钱了', '4', null, null, null);
INSERT INTO `income` VALUES ('4', '1', '1', '普通职员', '2018-11-11', '我赚钱了', '2', null, null, null);
INSERT INTO `income` VALUES ('5', '1', '1', '普通职员', '2018-11-11', '我赚钱了', '2', null, null, null);
INSERT INTO `income` VALUES ('6', '1', '1', '普通职员', '2018-11-11', '风格非官方', '2', null, null, null);
INSERT INTO `income` VALUES ('7', '1', '1', '普通职员', '2018-11-11', '我赚钱了', '2', null, null, null);
INSERT INTO `income` VALUES ('8', '1', '1', '普通职员', '2018-11-11', '我赚钱了', '2', null, null, null);
INSERT INTO `income` VALUES ('9', '4', '6', '总经理', '2018-11-25', '发货的法国', '3', '41', '7', '0');
INSERT INTO `income` VALUES ('10', '4', '6', '总经理', '2018-11-11', '', '2', '2529', '7', '0');

-- ----------------------------
-- Table structure for leavetype
-- ----------------------------
DROP TABLE IF EXISTS `leavetype`;
CREATE TABLE `leavetype` (
  `leaveid` int(11) NOT NULL AUTO_INCREMENT,
  `leavename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`leaveid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leavetype
-- ----------------------------
INSERT INTO `leavetype` VALUES ('1', '事假');
INSERT INTO `leavetype` VALUES ('2', '病假');
INSERT INTO `leavetype` VALUES ('3', '婚假');
INSERT INTO `leavetype` VALUES ('4', '丧假');

-- ----------------------------
-- Table structure for leavex
-- ----------------------------
DROP TABLE IF EXISTS `leavex`;
CREATE TABLE `leavex` (
  `leaveid` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `endTime` date DEFAULT NULL,
  `taskid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `remark` varchar(10) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `state` int(22) DEFAULT NULL,
  `typeall` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leavex
-- ----------------------------
INSERT INTO `leavex` VALUES ('1', '1', '1', '1', '2018-10-20', '2018-11-04', '1', '7', '1', '的粉色发', '14', '1', '1');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(225) DEFAULT NULL,
  `roleName` varchar(225) DEFAULT NULL,
  `event` varchar(225) DEFAULT NULL,
  `remark` varchar(225) DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', 'user', null, '添加菜单', '无', '2018-11-06 00:00:00');
INSERT INTO `log` VALUES ('2', 'user', null, '添加菜单', '无', '2018-11-06 00:00:00');
INSERT INTO `log` VALUES ('3', 'user', null, '添加菜单', '无', '2018-11-06 07:32:46');
INSERT INTO `log` VALUES ('4', 'user', null, '添加菜单', '无', '2018-11-06 07:43:34');
INSERT INTO `log` VALUES ('5', 'user', '普通职员', '添加菜单', '无', '2018-11-06 07:52:40');
INSERT INTO `log` VALUES ('6', 'user', '普通职员', '添加用户', '无', '2018-11-06 08:13:14');
INSERT INTO `log` VALUES ('7', 'user', '普通职员', '添加角色', '无', '2018-11-06 08:14:58');
INSERT INTO `log` VALUES ('11', 'user', '普通职员', '修改角色', '无', '2018-11-06 08:15:11');
INSERT INTO `log` VALUES ('12', 'user', '普通职员', '添加菜单', '无', '2018-11-06 08:15:24');
INSERT INTO `log` VALUES ('17', 'user', '普通职员', '修改用户', '无', '2018-11-06 08:16:33');
INSERT INTO `log` VALUES ('36', 'user', '普通职员', '修改菜单', '无', '2018-11-06 08:15:43');
INSERT INTO `log` VALUES ('37', 'user', '普通职员', '修改角色', '无', '2018-11-07 10:16:10');
INSERT INTO `log` VALUES ('38', 'user', '普通职员', '修改角色', '无', '2018-11-07 10:19:21');
INSERT INTO `log` VALUES ('39', 'user', '普通职员', '导出日志到excel', '无', '2018-11-07 11:20:32');
INSERT INTO `log` VALUES ('40', 'user', '普通职员', '添加用户', '无', '2018-11-07 11:57:09');
INSERT INTO `log` VALUES ('41', 'user', '普通职员', '添加用户', '无', '2018-11-07 02:11:32');
INSERT INTO `log` VALUES ('42', 'user', '普通职员', '添加用户', '无', '2018-11-07 02:21:10');
INSERT INTO `log` VALUES ('43', 'user', '普通职员', '导出excel', '无', '2018-11-07 02:26:25');
INSERT INTO `log` VALUES ('44', 'user', '普通职员', '修改用户', '无', '2018-11-07 02:39:03');
INSERT INTO `log` VALUES ('45', 'user', '普通职员', '添加用户', '无', '2018-11-07 14:42:33');
INSERT INTO `log` VALUES ('46', 'user', '普通职员', '修改用户', '无', '2018-11-07 14:43:29');
INSERT INTO `log` VALUES ('47', 'user', '普通职员', '添加用户', '', '2018-11-07 14:51:32');
INSERT INTO `log` VALUES ('48', 'user', '普通职员', null, '无', '2018-11-07 15:11:14');
INSERT INTO `log` VALUES ('49', 'user', '普通职员', null, '无', '2018-11-07 15:11:21');
INSERT INTO `log` VALUES ('50', 'user', '普通职员', null, '无', '2018-11-07 15:16:28');
INSERT INTO `log` VALUES ('51', 'user', '普通职员', null, '无', '2018-11-07 15:16:29');
INSERT INTO `log` VALUES ('52', 'user', '普通职员', '\'修改状态\'', '\'无\'', '2018-11-07 15:27:55');
INSERT INTO `log` VALUES ('53', 'user', '普通职员', '\'修改状态\'', '\'无\'', '2018-11-07 15:27:57');
INSERT INTO `log` VALUES ('54', 'user', '普通职员', '修改角色的状态', '无', '2018-11-07 16:14:58');
INSERT INTO `log` VALUES ('55', 'user', '普通职员', '修改角色的状态', '无', '2018-11-07 16:14:59');
INSERT INTO `log` VALUES ('56', 'user', '普通职员', '修改角色', '无', '2018-11-07 16:15:12');
INSERT INTO `log` VALUES ('57', 'user', '普通职员', '修改角色', '无', '2018-11-07 16:15:51');
INSERT INTO `log` VALUES ('58', 'user', '普通职员', '添加用户', '无', '2018-11-07 17:01:49');
INSERT INTO `log` VALUES ('59', 'user', '普通职员', '修改菜单', '无', '2018-11-07 20:36:18');
INSERT INTO `log` VALUES ('60', 'user', '普通职员', '批量删除菜单', '无', '2018-11-07 20:36:28');
INSERT INTO `log` VALUES ('61', 'user', '普通职员', '批量删除菜单', '无', '2018-11-07 20:36:38');
INSERT INTO `log` VALUES ('62', 'user', '普通职员', '批量删除菜单', '无', '2018-11-07 20:40:47');
INSERT INTO `log` VALUES ('63', 'user', '普通职员', '批量删除菜单', '无', '2018-11-07 20:40:51');
INSERT INTO `log` VALUES ('64', 'user', '普通职员', '添加角色', '无', '2018-11-07 20:47:19');
INSERT INTO `log` VALUES ('65', 'user', '普通职员', '删除一个角色', '无', '2018-11-07 20:47:55');
INSERT INTO `log` VALUES ('66', 'us', '普通职员', '批量删除用户', '无', '2018-11-07 20:59:55');
INSERT INTO `log` VALUES ('67', 'us', '普通职员', '批量删除用户', '无', '2018-11-07 21:00:02');
INSERT INTO `log` VALUES ('68', 'user', '普通职员', '添加用户', '无', '2018-11-08 10:46:49');
INSERT INTO `log` VALUES ('69', 'user', '普通职员', '导出excel', '无', '2018-11-08 10:53:51');
INSERT INTO `log` VALUES ('70', 'user', '普通职员', '导出menu的excel', '无', '2018-11-08 10:54:01');
INSERT INTO `log` VALUES ('71', 'user', '普通职员', '导出日志到excel', '无', '2018-11-08 10:54:07');
INSERT INTO `log` VALUES ('72', 'us', '普通职员', '添加用户', '无', '2018-11-08 17:41:00');
INSERT INTO `log` VALUES ('73', 'user', '普通职员', '修改角色', '无', '2018-11-08 20:59:41');
INSERT INTO `log` VALUES ('74', 'user', '普通职员', '修改角色', '无', '2018-11-08 21:03:16');
INSERT INTO `log` VALUES ('75', 'user', '普通职员', '修改角色', '无', '2018-11-08 21:03:31');
INSERT INTO `log` VALUES ('76', 'user', '普通职员', '修改角色', '无', '2018-11-08 21:04:07');
INSERT INTO `log` VALUES ('77', 'user1', '系统管理员', '修改角色', '无', '2018-11-08 21:06:22');
INSERT INTO `log` VALUES ('78', 'user', '普通职员', null, '无', '2018-11-09 09:35:05');
INSERT INTO `log` VALUES ('79', 'user1', '系统管理员', '修改用户', '无', '2018-11-09 09:37:59');
INSERT INTO `log` VALUES ('80', 'user1', '系统管理员', '修改用户', '无', '2018-11-09 09:38:23');
INSERT INTO `log` VALUES ('81', 'us', '部门领导', '添加用户', '无', '2018-11-09 09:54:53');
INSERT INTO `log` VALUES ('82', 'us', '部门领导', '修改用户', '无', '2018-11-09 09:55:07');
INSERT INTO `log` VALUES ('83', 'us', '部门领导', null, '无', '2018-11-09 09:56:04');
INSERT INTO `log` VALUES ('84', 'us', '部门领导', '修改用户', '无', '2018-11-09 09:57:15');
INSERT INTO `log` VALUES ('85', 'us', '部门领导', '修改角色的状态', '无', '2018-11-09 09:57:27');
INSERT INTO `log` VALUES ('86', 'us', '部门领导', '\'删除菜单\'', '\'无\'', '2018-11-09 10:01:22');
INSERT INTO `log` VALUES ('87', 'us', '部门领导', '导出menu的excel', '无', '2018-11-09 10:01:34');
INSERT INTO `log` VALUES ('88', 'us', '部门领导', '导出menu的excel', '无', '2018-11-09 10:02:03');
INSERT INTO `log` VALUES ('89', 'user1', '系统管理员', '添加用户', '无', '2018-11-09 11:43:10');
INSERT INTO `log` VALUES ('90', 'user1', '系统管理员', null, '无', '2018-11-09 11:43:20');
INSERT INTO `log` VALUES ('91', 'user1', '系统管理员', null, '无', '2018-11-09 11:43:26');
INSERT INTO `log` VALUES ('92', 'user1', '系统管理员', '批量删除用户', '无', '2018-11-09 11:43:34');
INSERT INTO `log` VALUES ('93', 'user1', '系统管理员', '导出excel', '无', '2018-11-09 11:45:38');
INSERT INTO `log` VALUES ('94', 'user1', '系统管理员', '添加角色', '无', '2018-11-09 11:47:04');
INSERT INTO `log` VALUES ('95', 'user1', '系统管理员', '修改角色', '无', '2018-11-09 11:47:18');
INSERT INTO `log` VALUES ('96', 'user1', '系统管理员', '删除一个角色', '无', '2018-11-09 11:48:28');
INSERT INTO `log` VALUES ('97', 'user1', '系统管理员', '添加菜单', '无', '2018-11-09 11:49:11');
INSERT INTO `log` VALUES ('98', 'user1', '系统管理员', '添加菜单', '无', '2018-11-09 11:49:28');
INSERT INTO `log` VALUES ('99', 'user1', '系统管理员', '批量删除菜单', '无', '2018-11-09 11:49:44');
INSERT INTO `log` VALUES ('100', 'user1', '系统管理员', '添加菜单', '无', '2018-11-09 11:49:59');
INSERT INTO `log` VALUES ('101', 'user1', '系统管理员', '批量删除菜单', '无', '2018-11-09 11:50:11');
INSERT INTO `log` VALUES ('102', 'user1', '系统管理员', '\'删除菜单\'', '\'无\'', '2018-11-09 11:50:22');
INSERT INTO `log` VALUES ('103', 'user1', '系统管理员', '导出日志到excel', '无', '2018-11-09 11:51:11');
INSERT INTO `log` VALUES ('104', 'user1', '系统管理员', '导出menu的excel', '无', '2018-11-09 11:51:38');
INSERT INTO `log` VALUES ('105', 'user1', '系统管理员', '更新会议室信息', null, '2018-11-09 11:54:35');
INSERT INTO `log` VALUES ('106', 'user1', '系统管理员', '导出会议室信息', null, '2018-11-09 11:54:44');
INSERT INTO `log` VALUES ('107', 'user1', '系统管理员', '删除会议室信息', null, '2018-11-09 11:55:05');
INSERT INTO `log` VALUES ('108', 'user1', '系统管理员', '添加会议室信息', null, '2018-11-09 11:55:36');
INSERT INTO `log` VALUES ('109', 'user1', '系统管理员', '批量添加会议室预约信息', null, '2018-11-09 12:00:08');
INSERT INTO `log` VALUES ('110', 'user1', '系统管理员', '批量添加会议室预约信息', null, '2018-11-09 12:00:36');
INSERT INTO `log` VALUES ('111', 'user1', '系统管理员', '取消预订会议室', null, '2018-11-09 12:02:18');
INSERT INTO `log` VALUES ('112', 'user1', '系统管理员', '批量添加会议室预约信息', null, '2018-11-09 12:02:32');
INSERT INTO `log` VALUES ('113', 'user1', '系统管理员', '添加用章申请', null, '2018-11-09 12:03:12');
INSERT INTO `log` VALUES ('114', 'us', '部门领导', '导出excel', '无', '2018-11-10 09:09:56');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `pId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `menuname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '1', '-1', '0', '我的桌面');
INSERT INTO `menu` VALUES ('2', '/resource/myself/demo1/getList', '1', '0', '待处理任务');
INSERT INTO `menu` VALUES ('3', '/resource/myself/demo2/getAnounceMent', '1', '0', '通告信息');
INSERT INTO `menu` VALUES ('4', '/resource/myself/demo3/list.jsp', '1', '0', '密码修改');
INSERT INTO `menu` VALUES ('5', '/resource/myself/demo4/getTask', '1', '0', '我的申请');
INSERT INTO `menu` VALUES ('6', '1', '-1', '0', '系统设置');
INSERT INTO `menu` VALUES ('7', '/resource/system/user/getallUser', '6', '0', '用户管理');
INSERT INTO `menu` VALUES ('8', '/resource/system/role/getallrole', '6', '0', '角色管理');
INSERT INTO `menu` VALUES ('9', '/resource/system/menu/getallmenu', '6', '0', '菜单管理');
INSERT INTO `menu` VALUES ('10', '/resource/system/log/listlog', '6', '0', '操作日志');
INSERT INTO `menu` VALUES ('11', '1', '-1', '0', '行政管理');
INSERT INTO `menu` VALUES ('12', '/resource/xingzheng/room/queryall', '11', '0', '会议室管理');
INSERT INTO `menu` VALUES ('13', '/resource/xingzheng/demo2/getcarlist', '11', '0', '用车管理');
INSERT INTO `menu` VALUES ('14', '/xingzheng/room/queryallchapter', '11', '0', '用章管理');
INSERT INTO `menu` VALUES ('15', '/xingzheng/books/queryallbooks', '11', '0', '图书借阅申请');
INSERT INTO `menu` VALUES ('16', '/xingzheng/card/querycard', '11', '0', '名片印制流程');
INSERT INTO `menu` VALUES ('17', '1', '-1', '0', '人事管理');
INSERT INTO `menu` VALUES ('18', '/resource/renshi/demo1/getuser', '17', '0', '请假申请');
INSERT INTO `menu` VALUES ('19', '/resource/renshi/demo1/getuser2', '17', '0', '出差申请');
INSERT INTO `menu` VALUES ('20', '/resource/renshi/demo1/getuser3', '17', '0', '收入证明流程');
INSERT INTO `menu` VALUES ('21', '1', '-1', '0', '通告管理');
INSERT INTO `menu` VALUES ('22', '/resource/tonggao/demo1/selectlist', '21', '0', '通告列表');
INSERT INTO `menu` VALUES ('23', '1', '-1', '0', '文档管理');
INSERT INTO `menu` VALUES ('24', '/resource/wendang/demo1/selectlist', '23', '0', '文档列表');
INSERT INTO `menu` VALUES ('25', '/resource/wendang/demo1/huishousel', '23', '0', '文档回收站');
INSERT INTO `menu` VALUES ('36', '', '-1', '0', '通告信息12');
INSERT INTO `menu` VALUES ('39', 'fdsf', '36', '0', 'req');

-- ----------------------------
-- Table structure for org_dept
-- ----------------------------
DROP TABLE IF EXISTS `org_dept`;
CREATE TABLE `org_dept` (
  `orgId` int(11) NOT NULL,
  `deptId` int(11) NOT NULL,
  PRIMARY KEY (`orgId`,`deptId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_dept
-- ----------------------------
INSERT INTO `org_dept` VALUES ('1', '1');
INSERT INTO `org_dept` VALUES ('1', '2');
INSERT INTO `org_dept` VALUES ('1', '3');
INSERT INTO `org_dept` VALUES ('2', '4');
INSERT INTO `org_dept` VALUES ('2', '5');
INSERT INTO `org_dept` VALUES ('3', '6');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', '阿里巴巴');
INSERT INTO `organization` VALUES ('2', '京东');
INSERT INTO `organization` VALUES ('3', '华为');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  `remark` varchar(225) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '普通职员', '好好工作', '0');
INSERT INTO `role` VALUES ('2', '人事专员', '招人', '0');
INSERT INTO `role` VALUES ('3', '系统管理员', '管理所有', '0');
INSERT INTO `role` VALUES ('4', '部门领导', '管理下属部门', '0');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '1');
INSERT INTO `role_menu` VALUES ('1', '2');
INSERT INTO `role_menu` VALUES ('1', '3');
INSERT INTO `role_menu` VALUES ('1', '4');
INSERT INTO `role_menu` VALUES ('1', '5');
INSERT INTO `role_menu` VALUES ('1', '6');
INSERT INTO `role_menu` VALUES ('1', '7');
INSERT INTO `role_menu` VALUES ('2', '1');
INSERT INTO `role_menu` VALUES ('2', '2');
INSERT INTO `role_menu` VALUES ('2', '3');
INSERT INTO `role_menu` VALUES ('2', '4');
INSERT INTO `role_menu` VALUES ('2', '5');
INSERT INTO `role_menu` VALUES ('2', '6');
INSERT INTO `role_menu` VALUES ('2', '7');
INSERT INTO `role_menu` VALUES ('2', '17');
INSERT INTO `role_menu` VALUES ('2', '18');
INSERT INTO `role_menu` VALUES ('2', '19');
INSERT INTO `role_menu` VALUES ('2', '20');
INSERT INTO `role_menu` VALUES ('2', '21');
INSERT INTO `role_menu` VALUES ('2', '22');
INSERT INTO `role_menu` VALUES ('3', '1');
INSERT INTO `role_menu` VALUES ('3', '2');
INSERT INTO `role_menu` VALUES ('3', '3');
INSERT INTO `role_menu` VALUES ('3', '4');
INSERT INTO `role_menu` VALUES ('3', '5');
INSERT INTO `role_menu` VALUES ('3', '6');
INSERT INTO `role_menu` VALUES ('3', '7');
INSERT INTO `role_menu` VALUES ('3', '8');
INSERT INTO `role_menu` VALUES ('3', '9');
INSERT INTO `role_menu` VALUES ('3', '10');
INSERT INTO `role_menu` VALUES ('3', '11');
INSERT INTO `role_menu` VALUES ('3', '12');
INSERT INTO `role_menu` VALUES ('3', '13');
INSERT INTO `role_menu` VALUES ('3', '14');
INSERT INTO `role_menu` VALUES ('3', '15');
INSERT INTO `role_menu` VALUES ('3', '16');
INSERT INTO `role_menu` VALUES ('3', '17');
INSERT INTO `role_menu` VALUES ('3', '18');
INSERT INTO `role_menu` VALUES ('3', '19');
INSERT INTO `role_menu` VALUES ('3', '20');
INSERT INTO `role_menu` VALUES ('3', '21');
INSERT INTO `role_menu` VALUES ('3', '22');
INSERT INTO `role_menu` VALUES ('3', '23');
INSERT INTO `role_menu` VALUES ('3', '24');
INSERT INTO `role_menu` VALUES ('3', '25');
INSERT INTO `role_menu` VALUES ('4', '1');
INSERT INTO `role_menu` VALUES ('4', '2');
INSERT INTO `role_menu` VALUES ('4', '3');
INSERT INTO `role_menu` VALUES ('4', '4');
INSERT INTO `role_menu` VALUES ('4', '5');
INSERT INTO `role_menu` VALUES ('4', '6');
INSERT INTO `role_menu` VALUES ('4', '7');
INSERT INTO `role_menu` VALUES ('4', '8');
INSERT INTO `role_menu` VALUES ('4', '9');
INSERT INTO `role_menu` VALUES ('4', '10');
INSERT INTO `role_menu` VALUES ('4', '11');
INSERT INTO `role_menu` VALUES ('4', '12');
INSERT INTO `role_menu` VALUES ('4', '13');
INSERT INTO `role_menu` VALUES ('4', '14');
INSERT INTO `role_menu` VALUES ('4', '15');
INSERT INTO `role_menu` VALUES ('4', '16');
INSERT INTO `role_menu` VALUES ('4', '17');
INSERT INTO `role_menu` VALUES ('4', '18');
INSERT INTO `role_menu` VALUES ('4', '19');
INSERT INTO `role_menu` VALUES ('4', '20');
INSERT INTO `role_menu` VALUES ('4', '21');
INSERT INTO `role_menu` VALUES ('4', '22');
INSERT INTO `role_menu` VALUES ('4', '23');
INSERT INTO `role_menu` VALUES ('4', '24');
INSERT INTO `role_menu` VALUES ('4', '25');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(22) DEFAULT NULL,
  `remark` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', 'A112', 'A座一楼多媒体会议室');
INSERT INTO `room` VALUES ('2', 'A221', 'A座三楼多媒体会议室');
INSERT INTO `room` VALUES ('4', 'A223', 'A座三楼多媒体会议室');
INSERT INTO `room` VALUES ('7', 'A226', 'A座三楼多媒体会议室');
INSERT INTO `room` VALUES ('11', 'A446', 'A座四楼多媒体会议室');

-- ----------------------------
-- Table structure for room_reserve
-- ----------------------------
DROP TABLE IF EXISTS `room_reserve`;
CREATE TABLE `room_reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomId` int(11) DEFAULT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `endTime` timestamp NULL DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `reserveTime` date DEFAULT NULL,
  `typeall` int(11) DEFAULT NULL,
  `taskid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_reserve
-- ----------------------------
INSERT INTO `room_reserve` VALUES ('1', '1', '2018-11-12 00:00:00', '2018-11-13 00:00:00', '1', '11', '2', '0', '2018-11-10', null, null);
INSERT INTO `room_reserve` VALUES ('2', '1', '2018-11-12 00:00:00', '2018-11-13 00:00:00', '1', '11', '2', '1', '2018-11-10', null, null);
INSERT INTO `room_reserve` VALUES ('8', '1', '2018-11-13 00:00:00', '2018-11-13 15:00:00', '2', '11', '1', '1', '2018-11-05', null, null);
INSERT INTO `room_reserve` VALUES ('9', '1', '2018-11-13 00:00:00', '2018-11-13 15:00:00', '2', '18', '1', '1', '2018-11-05', null, null);
INSERT INTO `room_reserve` VALUES ('10', '1', '2018-11-14 00:00:04', '2018-11-14 15:00:00', '3', '18', '1', '1', '2018-11-06', null, null);
INSERT INTO `room_reserve` VALUES ('11', '1', '2018-11-14 00:00:04', '2018-11-14 15:00:00', '3', '18', '1', '1', '2018-11-06', null, null);
INSERT INTO `room_reserve` VALUES ('20', '1', '2018-11-17 00:00:00', '2018-11-17 15:00:00', '2', '1', '2', '1', '2018-11-07', null, null);
INSERT INTO `room_reserve` VALUES ('21', '2', '2018-11-17 00:00:00', '2018-11-17 15:00:00', '3', '1', '2', '0', '2018-11-07', null, null);
INSERT INTO `room_reserve` VALUES ('22', '4', '2018-11-17 00:00:00', '2018-11-17 15:00:00', '4', '18', '2', '1', '2018-11-07', null, null);
INSERT INTO `room_reserve` VALUES ('23', '8', '2018-11-17 11:00:00', '2018-11-17 15:00:00', '3', '18', '2', '1', '2018-11-07', null, null);
INSERT INTO `room_reserve` VALUES ('24', '8', '2018-11-17 12:00:00', '2018-11-17 15:00:00', '3', '18', '2', '1', '2018-11-07', null, null);
INSERT INTO `room_reserve` VALUES ('25', '4', '2018-11-13 12:00:00', '2018-11-13 14:00:00', '2', '18', '13', '1', '2018-11-08', null, null);
INSERT INTO `room_reserve` VALUES ('26', '4', '2018-11-13 12:00:00', '2018-11-13 14:00:00', '2', '18', '13', '1', '2018-11-08', null, null);
INSERT INTO `room_reserve` VALUES ('27', '1', '2018-11-17 12:00:00', '2018-11-17 15:00:00', '4', '18', '13', '1', '2018-11-08', '8', '52506');
INSERT INTO `room_reserve` VALUES ('28', '2', '2018-11-15 12:00:00', '2018-11-15 15:00:00', '4', '12', '26', '1', '2018-11-09', '8', '10');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `typeall` int(11) DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `taskId` int(11) DEFAULT NULL,
  `name` varchar(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `subTime` date DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '1', '1', '1', '1', '发送端', '1', '2', '2018-11-01', '2018-11-04', '1');
INSERT INTO `task` VALUES ('2', '1', '2', '1', '1', 'trip', '1', '14', '2018-07-08', '2018-11-07', '1');

-- ----------------------------
-- Table structure for traffic
-- ----------------------------
DROP TABLE IF EXISTS `traffic`;
CREATE TABLE `traffic` (
  `trafficid` int(11) NOT NULL AUTO_INCREMENT,
  `trafficname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trafficid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traffic
-- ----------------------------
INSERT INTO `traffic` VALUES ('1', '火车');
INSERT INTO `traffic` VALUES ('2', '飞机');
INSERT INTO `traffic` VALUES ('3', '汽车');
INSERT INTO `traffic` VALUES ('4', '轮船');

-- ----------------------------
-- Table structure for trip
-- ----------------------------
DROP TABLE IF EXISTS `trip`;
CREATE TABLE `trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `endTime` date DEFAULT NULL,
  `address` varchar(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  `work` varchar(20) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `taskid` int(11) DEFAULT NULL,
  `typeall` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trip
-- ----------------------------
INSERT INTO `trip` VALUES ('1', '1', '5', null, null, '合肥', null, '出差', '谈判', '666', '5', null, null, null);
INSERT INTO `trip` VALUES ('2', '1', '5', '2018-11-06', '2018-11-09', '3', '1', '出差1', '谈判1', '999', '5', null, null, null);
INSERT INTO `trip` VALUES ('3', '3', '3', '2018-11-08', '2018-11-09', '合肥', '3', '发的', '发放', '666', '1', null, null, null);
INSERT INTO `trip` VALUES ('4', '1', '1', '2018-11-08', '2018-11-09', '合肥', '2', '范公式', '山东分公司', '666', '2', null, null, null);
INSERT INTO `trip` VALUES ('5', '1', '1', '2018-11-08', '2018-11-09', '上海', '1', '规范化', '国防生', '999', '2', null, null, null);
INSERT INTO `trip` VALUES ('6', '4', '6', '2018-11-11', '2018-11-20', '南京', '2', '公务', '谈判', '9999', '3', null, null, null);
INSERT INTO `trip` VALUES ('7', '4', '6', '2018-11-11', '2018-11-20', '南京', '2', '公务', '谈判', '9999', '2', null, null, null);
INSERT INTO `trip` VALUES ('8', '4', '6', '2018-11-11', '2018-11-20', '南京', '2', '公务', '谈判', '9999', '2', null, null, null);
INSERT INTO `trip` VALUES ('9', '4', '6', '2018-11-11', '2018-11-21', '合肥', '3', '公务', '谈判', '9999', '2', '26', '2', '0');
INSERT INTO `trip` VALUES ('10', '4', '6', '2018-11-11', '2018-11-21', '合肥', '2', '公务', '谈判', '19999999', '2', '2518', '2', '0');
INSERT INTO `trip` VALUES ('11', '4', '6', '2018-11-11', '2018-11-21', '合肥', '2', '法国和', '放噶根据', '666', '2', '5018', '2', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(225) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `idcard` varchar(225) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(225) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `job` varchar(225) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `photo` varchar(225) DEFAULT NULL,
  `orgId` int(11) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('11', 'user', '123ab', '王某人', '512501197203035172', '46', '13456786567', '0', '普通职员', '1', '222.png', '1', '2', '1');
INSERT INTO `user` VALUES ('12', 'user1', 'www111', '王某人', '512501197203035172', '46', '13456786567', '0', '普通职员', '3', '222.png', '3', '1', '0');
INSERT INTO `user` VALUES ('13', 'user11', 'qwer12345', '送一天1', '512501197203035172', '46', '13456786567', '0', '部门经理', '1', '222.png', '1', '1', '0');
INSERT INTO `user` VALUES ('14', 'user111', 'qwer1234', '王某人', '512501197203035172', '46', '13456786567', '0', '部门经理', '2', '222.png', '1', '1', '0');
INSERT INTO `user` VALUES ('15', 'user2', 'qweqwe21312', '王某人', '512501197203035172', '46', '13456786567', '0', '部门经理', '1', '222.png', '1', '1', '0');
INSERT INTO `user` VALUES ('17', 'user22', '123werws1qw', '送一天1', '512501197203035172', '46', '13456786567', '0', '部门经理', '1', '222.png', '1', '1', '0');
INSERT INTO `user` VALUES ('18', 'user13123', 'qweqre213', '送一天11', '512501197203035172', '46', '13456786567', '0', '部门经理', '2', '222.png', '1', '1', '0');
INSERT INTO `user` VALUES ('19', 'user231', 'wqeasewq23', '送一天11', '512501197203035172', '46', '13678956789', '0', '部门经理', '2', '222.png', '1', '1', '0');
INSERT INTO `user` VALUES ('20', 'usereqw', '1qwe1231eqw', 'qwerqre', '512501197203035172', '46', '13456786567', '0', '部门经理', '1', '222.png', '1', '1', '0');
INSERT INTO `user` VALUES ('21', 'user1134', 'wqeqwe321413', '王某人', '512501197203035172', '46', '13456786567', '0', '部门经理', '1', '222.png', '1', '1', '0');
INSERT INTO `user` VALUES ('22', 'user1123', '213wqeweeqw', '213', '512501197203035172', '46', '13456786567', '0', '部门经理', '1', '222.png', '1', '1', '0');
INSERT INTO `user` VALUES ('23', 'user2131', 'weqwqd213', '送一天1', '512501197203035172', '46', '13678956789', '0', '部门经理', '1', '222.png', '1', '1', '0');
INSERT INTO `user` VALUES ('24', 'us', 'use123', 'aaaaaa', '430101197405210908', '46', '13456786567', '0', '部门经理', '4', '222.png', '1', '1', '0');
INSERT INTO `user` VALUES ('25', 'user34', 'qewewq21331', '王某人23', '512501197203035172', '46', '13456786567', '0', '部门经理', '1', '222.png', '1', '1', '0');
INSERT INTO `user` VALUES ('26', 'user15', '123', '小康王', '411423199405176018', '24', '18437955210', '0', '部门经理', '2', '222.png', '1', '1', '0');

-- ----------------------------
-- Table structure for vcard
-- ----------------------------
DROP TABLE IF EXISTS `vcard`;
CREATE TABLE `vcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `job` varchar(11) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `typeall` int(11) DEFAULT NULL,
  `taskid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vcard
-- ----------------------------
INSERT INTO `vcard` VALUES ('1', '1', '2018-11-12', '1', '超管', '13333333333', '234', 'fdg', '1', null, null, '0');
INSERT INTO `vcard` VALUES ('2', '1', '2018-11-12', '1', '超管', '13333333333', '234', 'asdasd', '2', null, null, '0');
INSERT INTO `vcard` VALUES ('3', '18', '2018-11-17', '2', '普通用户', '18437955210', '999', '000', '13', '0', null, '0');
INSERT INTO `vcard` VALUES ('4', '18', '2018-11-12', '2', '普通用户', '18437955210', '342', 'sda', '13', '6', '50017', '0');
INSERT INTO `vcard` VALUES ('5', '18', '2018-11-12', '2', '普通用户', '18437955210', '324', 'asd', '13', '0', null, '0');
INSERT INTO `vcard` VALUES ('6', '18', '2018-11-12', '2', '普通用户', '18437955210', '324', '324', '13', '0', null, '0');
INSERT INTO `vcard` VALUES ('7', '18', '2018-11-12', '2', '普通用户', '18437955210', '234', '123', '13', '6', '55006', '0');
INSERT INTO `vcard` VALUES ('8', '18', '2018-11-12', '2', '普通用户', '18437955210', '213123', 'asd', '12', '6', '57506', '0');
INSERT INTO `vcard` VALUES ('9', '18', '2018-11-12', '2', '普通用户', '18437955210', '43444', 'sad', '19', '6', '65027', null);
