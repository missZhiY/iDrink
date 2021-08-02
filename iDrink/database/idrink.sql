/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : idrink

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2021-08-02 14:32:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `administrator`
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(12) NOT NULL,
  `a_password` varchar(12) NOT NULL,
  `a_phone` varchar(12) NOT NULL,
  `a_address` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`a_id`,`a_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('1', '逸欣', '123456', '15855514005', '安徽合肥');
INSERT INTO `administrator` VALUES ('2', '小林', '123456', '15855555555', '安徽合肥');
INSERT INTO `administrator` VALUES ('3', '阿黄', '123456', '13333333333', '重庆');
INSERT INTO `administrator` VALUES ('4', '阿尧', '123456', '13911111111', '安徽合肥');
INSERT INTO `administrator` VALUES ('5', '阿荣', '123456', '15655555555', '安徽合肥');
INSERT INTO `administrator` VALUES ('6', '怡宝', '123456', '15222222222', '北京');
INSERT INTO `administrator` VALUES ('7', '阿翔', '123456', '18222222222', '安徽合肥');
INSERT INTO `administrator` VALUES ('8', '丁宝', '123456', '15611111111', '安徽合肥');
INSERT INTO `administrator` VALUES ('9', '阿龙', '123456', '18211111111', '安徽合肥');
INSERT INTO `administrator` VALUES ('10', '小王', '123456', '15511111111', '海南');
INSERT INTO `administrator` VALUES ('11', '大力', '123456', '18922222222', '浙江绍兴');
INSERT INTO `administrator` VALUES ('12', '阿坤', '123456', '15666666666', '上海');
INSERT INTO `administrator` VALUES ('13', '小涵', '123456', '15333333333', '湖南长沙');
INSERT INTO `administrator` VALUES ('14', '阿阳', '123456', '18611111111', '深圳');
INSERT INTO `administrator` VALUES ('15', '阿玉', '123456', '13655555555', '安徽六安');
INSERT INTO `administrator` VALUES ('16', '小黄', '123456', '15522222222', '湖南长沙');
INSERT INTO `administrator` VALUES ('17', '阿杜', '123456', '13812345678', '安徽合肥');
INSERT INTO `administrator` VALUES ('18', '阿狗', '123456', '13312345678', '河北沧州');
INSERT INTO `administrator` VALUES ('19', '老李', '123456', '15812345678', '河南郑州');
INSERT INTO `administrator` VALUES ('20', '阿平', '123456', '18612345678', '湖南长沙');
INSERT INTO `administrator` VALUES ('21', '老彭', '123456', '18912345678', '湖北荆州');
INSERT INTO `administrator` VALUES ('22', '阿尧', '123456', '13811112222', '安徽合肥');
INSERT INTO `administrator` VALUES ('23', '阿亮', '123456', '132123456789', '上海');
INSERT INTO `administrator` VALUES ('24', '阿宁', '123456', '13811112222', '安徽合肥');
INSERT INTO `administrator` VALUES ('25', '阿贝', '123456', '13311112222', '山西平遥');
INSERT INTO `administrator` VALUES ('26', '小兰', '123456', '13833332222', '河南郑州');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(12) NOT NULL,
  `c_priority` int(11) DEFAULT NULL,
  `c_phone` varchar(12) NOT NULL,
  `c_address` varchar(12) NOT NULL,
  `c_product` varchar(12) NOT NULL,
  `c_price` varchar(6) NOT NULL,
  `c_ordercount` int(11) DEFAULT NULL,
  `c_totalpay` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '华联超市（安徽合肥）', '2', '15611111111', '安徽省合肥市', '怡宝', '1.8', '1000', '1800.0');
INSERT INTO `customer` VALUES ('2', '华联超市（安徽蚌埠）', '2', '15211111111', '安徽省蚌埠市', '百事可乐', '3', '2000', '6000.0');
INSERT INTO `customer` VALUES ('4', '华联超市（安徽合肥）', '1', '15611111111', '安徽省合肥市', '百岁山', '2.0', '1000', '2000.0');
INSERT INTO `customer` VALUES ('5', '华农荟五教超', '1', '0123-4567', '湖北省武汉市', '怡宝', '1.3', '3000', '3900.0');
INSERT INTO `customer` VALUES ('6', '华农荟五教超', '1', '0123-4567', '湖北省武汉市', '美年达（橙味）', '2.0', '1000', '2000.0');
INSERT INTO `customer` VALUES ('7', '华农荟五教超', '1', '0123-4567', '湖北省武汉市', '雪碧', '2.8', '1000', '2800.0');
INSERT INTO `customer` VALUES ('15', '湖北华农教超', '1', '0123-4567', '湖北省武汉市', '百岁山', '2.3', '1000', '2300.0');
INSERT INTO `customer` VALUES ('16', '华农荟五教超', '1', '0123-4567', '湖北省武汉市', '农夫山泉', '1.8', '1000', '1800.0');
INSERT INTO `customer` VALUES ('17', '世纪联华（北京）', '2', '0111-1111', '北京市', '农夫山泉', '1.9', '2000', '3800.0');

-- ----------------------------
-- Table structure for `dict`
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_type` varchar(12) DEFAULT NULL,
  `dict_con` varchar(12) DEFAULT NULL,
  `dict_item` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('6', '001', '产品名称', '怡宝');
INSERT INTO `dict` VALUES ('7', '001', '产品名称', '百事可乐');
INSERT INTO `dict` VALUES ('8', '001', '产品名称', '美年达（橙味）');
INSERT INTO `dict` VALUES ('9', '001', '产品名称', '农夫山泉');
INSERT INTO `dict` VALUES ('10', '001', '产品名称', '百岁山');
INSERT INTO `dict` VALUES ('11', '001', '产品名称', '雪碧');
INSERT INTO `dict` VALUES ('12', '001', '产品名称', '芬达（橙味）');
INSERT INTO `dict` VALUES ('13', '002', '供应商名称', '华润怡宝（四川）');
INSERT INTO `dict` VALUES ('14', '002', '供应商名称', '华润怡宝（深圳）');
INSERT INTO `dict` VALUES ('15', '002', '供应商名称', '华润怡宝（湖南）');
INSERT INTO `dict` VALUES ('16', '002', '供应商名称', '百事中国（四川成都）');
INSERT INTO `dict` VALUES ('17', '002', '供应商名称', '百事中国（黄值重庆）');
INSERT INTO `dict` VALUES ('18', '002', '供应商名称', '景田百岁山（深圳）');
INSERT INTO `dict` VALUES ('19', '002', '供应商名称', '农夫山泉股份有限公司');
INSERT INTO `dict` VALUES ('20', '002', '供应商名称', '百事中国（安徽合肥）');
INSERT INTO `dict` VALUES ('21', '002', '供应商名称', '百事中国（河南郑州）');
INSERT INTO `dict` VALUES ('22', '002', '供应商名称', '景田百岁山（广州）');
INSERT INTO `dict` VALUES ('28', '003', '供应商地址', '四川成都');
INSERT INTO `dict` VALUES ('29', '003', '供应商地址', '深圳');
INSERT INTO `dict` VALUES ('30', '003', '供应商地址', '湖南常德');
INSERT INTO `dict` VALUES ('31', '003', '供应商地址', '四川成都');
INSERT INTO `dict` VALUES ('32', '003', '供应商地址', '重庆');
INSERT INTO `dict` VALUES ('33', '003', '供应商地址', '广东深圳');
INSERT INTO `dict` VALUES ('34', '003', '供应商地址', '浙江杭州');
INSERT INTO `dict` VALUES ('35', '003', '供应商地址', '安徽合肥');
INSERT INTO `dict` VALUES ('36', '003', '供应商地址', '河南郑州');
INSERT INTO `dict` VALUES ('37', '003', '供应商地址', '广州');
INSERT INTO `dict` VALUES ('43', '004', '客户', '华联超市（安徽合肥）');
INSERT INTO `dict` VALUES ('44', '004', '客户', '华联超市（安徽蚌埠）');
INSERT INTO `dict` VALUES ('45', '004', '客户', '华联超市（北京）');
INSERT INTO `dict` VALUES ('46', '005', '客户地址', '安徽省合肥市');
INSERT INTO `dict` VALUES ('47', '005', '客户地址', '安徽省蚌埠市');
INSERT INTO `dict` VALUES ('48', '005', '客户地址', '北京市海淀区');
INSERT INTO `dict` VALUES ('49', '004', '客户', '湖北华农教超');
INSERT INTO `dict` VALUES ('50', '005', '客户地址', '湖北省武汉市');
INSERT INTO `dict` VALUES ('52', '004', '客户', '华农荟五教超');
INSERT INTO `dict` VALUES ('53', '004', '客户', '世纪联华（北京）');
INSERT INTO `dict` VALUES ('54', '005', '客户地址', '北京市');
INSERT INTO `dict` VALUES ('55', '002', '供应商名称', '恒大冰泉（广东）');
INSERT INTO `dict` VALUES ('56', '001', '产品名称', '恒大冰泉');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(12) DEFAULT NULL,
  `price` varchar(6) DEFAULT NULL,
  `s_name` varchar(12) DEFAULT NULL,
  `s_address` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '怡宝', '1.2', '华润怡宝（四川）', '四川成都');
INSERT INTO `products` VALUES ('2', '怡宝', '1.4', '华润怡宝（深圳）', '深圳');
INSERT INTO `products` VALUES ('3', '怡宝', '1.3', '华润怡宝（湖南）', '湖南常德');
INSERT INTO `products` VALUES ('4', '美年达（橙味）', '2.5', '百事中国（四川成都）', '四川成都');
INSERT INTO `products` VALUES ('5', '百事可乐', '2.3', '百事中国（黄值重庆）', '重庆');
INSERT INTO `products` VALUES ('6', '百岁山', '2', '景田百岁山（深圳）', '广东深圳');
INSERT INTO `products` VALUES ('7', '农夫山泉（矿泉水）', '1.3', '农夫山泉股份有限公司', '浙江杭州');
INSERT INTO `products` VALUES ('8', '雪碧', '2.5', '百事中国（安徽合肥）', '安徽合肥');
INSERT INTO `products` VALUES ('9', '美年达（橙味）', '2.3', '百事中国（河南郑州）', '河南郑州');
INSERT INTO `products` VALUES ('10', '百岁山', '1.8', '景田百岁山（广州）', '广州');
INSERT INTO `products` VALUES ('16', '怡宝', '1.7', '华润怡宝（山东）', '山东曹县');
INSERT INTO `products` VALUES ('28', '恒大冰泉', '2.0', '恒大冰泉（广东）', '广州');

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(12) NOT NULL,
  `s_product` varchar(12) DEFAULT NULL,
  `s_price` varchar(6) NOT NULL,
  `s_address` varchar(12) DEFAULT NULL,
  `s_phone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '华润怡宝（四川）', '怡宝', '1.2', '四川成都', '0555-1111');
INSERT INTO `supplier` VALUES ('2', '华润怡宝（深圳）', '怡宝', '1.4', '深圳', '0555-2222');
INSERT INTO `supplier` VALUES ('3', '华润怡宝（湖南）', '怡宝', '1.3', '湖南常德', '0551-3333');
INSERT INTO `supplier` VALUES ('4', '百事中国（四川成都）', '美年达（橙味）', '2.5', '四川成都', '0551-4444');
INSERT INTO `supplier` VALUES ('5', '百事中国（黄值重庆）', '百事可乐', '2.3', '重庆', '0551-5555');
INSERT INTO `supplier` VALUES ('6', '景田百岁山（深圳）', '百岁山', '2', '广东深圳', '0551-6666');
INSERT INTO `supplier` VALUES ('7', '农夫山泉股份有限公司', '农夫山泉（矿泉水）', '1.3', '浙江杭州', '0551-7777');
INSERT INTO `supplier` VALUES ('8', '百事中国（安徽合肥）', '雪碧', '2.5', '安徽合肥', '0551-8888');
INSERT INTO `supplier` VALUES ('9', '百事中国（河南郑州）', '美年达（橙味）', '2.3', '河南郑州', '0551-9999');
INSERT INTO `supplier` VALUES ('10', '景田百岁山（广州）', '百岁山', '1.8', '广州', '0552-1111');
INSERT INTO `supplier` VALUES ('11', '华润怡宝（山东）', '怡宝', '1.7', '山东曹县', '0552-6666');
INSERT INTO `supplier` VALUES ('24', '恒大冰泉（广东）', '恒大冰泉', '1.9', '广州', '0331-3333');

-- ----------------------------
-- Table structure for `vip`
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `v_id` int(11) NOT NULL,
  `v_cid` int(11) NOT NULL,
  `v_name` varchar(12) NOT NULL,
  `v_phone` varchar(12) NOT NULL,
  `v_level` int(11) NOT NULL,
  `v_discount` varchar(2) NOT NULL,
  `v_endtime` date DEFAULT NULL,
  PRIMARY KEY (`v_id`,`v_cid`),
  KEY `vc` (`v_cid`),
  CONSTRAINT `vc` FOREIGN KEY (`v_cid`) REFERENCES `customer` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip
-- ----------------------------
DROP TRIGGER IF EXISTS `trigger_dictCus`;
DELIMITER ;;
CREATE TRIGGER `trigger_dictCus` AFTER INSERT ON `customer` FOR EACH ROW begin
	if(not exists(select * from dict where dict_item = new.c_name))
	then
		insert into dict(dict_type, dict_con, dict_item)
		values('004', '客户', new.c_name);
		if(not exists(select * from dict where dict_item = new.c_address))
		then
			insert into dict(dict_type, dict_con, dict_item)
			values('005', '客户地址', new.c_address);
		end if;
	end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_dictPro`;
DELIMITER ;;
CREATE TRIGGER `trigger_dictPro` AFTER INSERT ON `products` FOR EACH ROW begin
	if(not exists(select * from dict where dict_item = new.p_name))
	then
		insert into dict(dict_type, dict_con, dict_item)
		values('001', '产品名称', new.p_name);
	end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_dictSup`;
DELIMITER ;;
CREATE TRIGGER `trigger_dictSup` AFTER INSERT ON `supplier` FOR EACH ROW begin
	if(not exists(select * from dict where dict_item = new.s_name))
	then
		insert into dict(dict_type, dict_con, dict_item)
		values('002', '供应商名称', new.s_name);
		if(not exists(select * from dict where dict_item = new.s_address))
		then
			insert into dict(dict_type, dict_con, dict_item)
			values('003', '供应商地址', new.s_address);
		end if;
	end if;
	insert into products(p_name, price, s_name, s_address)
	values(new.s_product, new.s_price, new.s_name, new.s_address);
end
;;
DELIMITER ;
