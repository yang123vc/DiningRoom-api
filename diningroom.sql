-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-01-28 07:37:00
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diningroom`
--

-- --------------------------------------------------------

--
-- 表的结构 `dr_admin`
--

CREATE TABLE `dr_admin` (
  `aid` int(11) NOT NULL,
  `aname` varchar(32) DEFAULT NULL,
  `apwd` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dr_admin`
--

INSERT INTO `dr_admin` (`aid`, `aname`, `apwd`) VALUES
(1, 'admin', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9'),
(2, 'boss', '*48988DE3C6ABF91327B641580BA3286EF77A9401');

-- --------------------------------------------------------

--
-- 表的结构 `dr_category`
--

CREATE TABLE `dr_category` (
  `cid` int(11) NOT NULL,
  `cname` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dr_category`
--

INSERT INTO `dr_category` (`cid`, `cname`) VALUES
(1, '肉类'),
(2, '海鲜河鲜'),
(3, '丸滑类'),
(4, '蔬菜豆制品'),
(5, '菌菇类');

-- --------------------------------------------------------

--
-- 表的结构 `dr_dish`
--

CREATE TABLE `dr_dish` (
  `did` int(11) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `imgUrl` varchar(128) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `detail` varchar(128) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dr_dish`
--

INSERT INTO `dr_dish` (`did`, `title`, `imgUrl`, `price`, `detail`, `categoryId`) VALUES
(1, '草鱼片', 'r9470.jpg', '35.00', '选鲜活草鱼，切出鱼片冷鲜保存。锅开后再煮1分钟左右即可食用', 1),
(2, '脆皮肠', 'r9017.jpg', '15.00', '锅开后再煮3分钟左右即可食用', 1),
(3, '酥肉', 'r4760.jpg', '25.00', '选用冷鲜五花肉，加上鸡蛋，淀粉等原料炸制，色泽黄亮，酥软醇香，肥而不腻。锅开后再煮3分钟左右即可食用', 1),
(4, '牛百叶', 'r9302.jpg', '40.00', '毛肚切丝后，配以调味料腌制而成。锅开后再煮2分钟左右即可食用', 1),
(5, '腰花', 'r9287.jpg', '32.00', '选用大型厂家冷鲜腰花，经过解冻、清洗、切片而成。锅开后涮30秒左右即可食用', 1),
(6, '猪脑花', 'r9711.jpg', '28.00', '选用大型厂家冷鲜猪脑经过清洗，过水、撕膜而成。肉质细腻，锅开后再煮8分钟左右即可食用', 1),
(7, '草鱼片', 'r9470.jpg', '35.00', '选鲜活草鱼，切出鱼片冷鲜保存。锅开后再煮1分钟左右即可食用', 1),
(8, '脆皮肠', 'r9017.jpg', '15.00', '锅开后再煮3分钟左右即可食用', 1),
(9, '午餐肉', 'r6110.jpg', '18.00', '锅开后再煮2分钟左右即可食用', 1),
(10, '牛仔骨', 'r7130.jpg', '43.00', '牛仔骨又称牛小排，选自资质合格的厂家生产配送。锅开后再煮5分钟左右即可食用', 1),
(11, '新西兰羊肉卷', 'r8110.jpg', '52.00', '选用新西兰羔羊肉的前胸和肩胛为原料，在国内经过分割、压制成型，肥瘦均匀。锅开后涮30秒左右即可食用', 1),
(12, '捞派嫩羊肉', 'r1238.jpg', '48.00', '海底捞只选用生长周期达到6—8个月的草原羔羊，肉嫩筋少而膻味少', 1),
(13, '澳洲肥牛', 'r6213.jpg', '68.00', '百分百澳洲牛肉的前胸部位，口感香嫩，汁浓味厚。锅开后涮30秒即可食用', 1),
(14, '捞派鸭肠', 'r9913.jpg', '19.00', '捞派鸭肠，选用资质和证件齐全的屠宰场鸭肠。经过掏肠、去大油、结石、抛肠、清洗、刀工去小油、清洗等步骤', 1),
(15, '手切羊肉', 'r1313.jpg', '46.00', '甄选12月龄以下羔羊后腿以及羊霖，经过切配、装盘而成。锅开后再煮1分钟左右即可食用。', 1),
(16, '猪蹄', 'r7719.jpg', '35.00', '猪蹄斩成小块，经过清洗，过水，用十余种符合国家食品安全的食材一起炖煮而成。锅开后再煮5分钟即可食用', 1),
(17, '冻虾', 'h3181.jpg', '29.00', '将活虾冷冻而成。肉质脆嫩，锅开后再煮4分钟左右即可食用', 2),
(18, '青斑', 'h8231.jpg', '36.00', '经过宰杀、去内脏、清洗、装盘而成。锅开后鱼片煮1分钟左右，鱼头、鱼排煮4分钟即可食用', 2),
(19, '活虾', 'h7112.jpg', '48.00', '选自广东湛江、北海区域南美白虾，清洗干净装盘，锅开后再煮2分钟左右即可食用', 2),
(20, '鱿鱼须', 'h2133.jpg', '28.00', '选用鱿鱼触角，速冻保鲜。锅开后再煮5分钟左右即可食用', 2),
(21, '大闸蟹', 'h1375.jpg', '50.00', '大闸蟹又称河蟹、毛蟹、清水蟹、大闸蟹或螃蟹，顾客可根据情况选择生、熟两种大闸蟹，生的大闸蟹，锅开后再煮8分钟左右即可食用', 2),
(22, '油蛤', 'h7811.jpg', '12.00', '经过宰杀、去内脏、清洗、装盘而成。锅开后再煮4分钟左右即可食用', 2),
(23, '油条虾', 'h1385.jpg', '36.00', '油条炸制后，裹入虾滑而成。将油条的香味和虾滑的脆嫩结合在一起，锅开后再煮3分钟左右即可食用', 2),
(24, '扇贝', 'h7715.jpg', '27.00', '鲜活扇贝，餐前宰杀后上桌。锅开后再煮4分钟左右即可食用', 2),
(25, '无刺巴沙鱼', 'h2881.jpg', '30.00', '巴沙鱼口味鲜嫩，且无刺无腥味，特别适合老人、小孩食用', 2),
(26, '撒尿牛肉丸', 'w8181.jpg', '35.00', '选用牛后腿部位牛霖，经过排酸、绞碎、搅打成的牛肉滑，捏成丸子后，里面裹入用老鸡、火腿等精心熬制的汤', 3),
(27, '西式牛肉滑', 'w9910.jpg', '41.00', '选用牛后腿部位，经过排酸、绞碎、搅打而成的牛肉滑，放入香菇、芹菜粒等原料，配以蛋黄。开锅后由服务员搅拌均匀、做成小丸下入', 3),
(28, '招牌虾滑', 'w7199.jpg', '30.00', '精选湛江、北海区域出产的南美品种白虾虾仁，配以盐和淀粉等调料制作而成。虾肉含量越高，虾滑口感越纯正', 3),
(29, '精品肉丸', 'w2811.jpg', '19.00', '选自资质合格的厂家。锅开后浮起来后再煮3分钟左右即可食用', 3),
(30, '手工墨鱼丸', 'w6138.jpg', '28.00', '墨鱼经破碎、搅拌等工艺，再配以秘制调料混合而成。锅开后再浮起来再煮3分钟即可食用', 1),
(31, '丸类组合', 'w6121.jpg', '31.00', '丸类组合', 3),
(32, '包心生菜', 'c8813.jpg', '16.00', '包心生菜', 4),
(33, '蒿子秆', 'c1838.jpg', '20.00', '经过挑选、清洗、切配、装盘而成，锅开后再煮1分钟左右即可食用', 4),
(34, '竹笋', 'c8811.jpg', '22.00', '竹笋清洗后对剖切开，装盘，口感脆爽，锅开后再煮4分钟左右即可食用', 4),
(35, '土豆', 'c1834.jpg', '10.00', '经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮4分钟左右即可食用', 4),
(36, '山药', 'c6123.jpg', '18.00', '经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮3分钟左右即可食用', 4),
(37, '冬瓜', 'c8822.jpg', '15.00', '经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮1分钟即可食用，不宜久煮，否则会煮溶', 4),
(38, '白萝卜', 'c8137.jpg', '9.00', '经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮3分钟左右即可食用', 4),
(39, '红薯', 'c1831.jpg', '9.90', '经过去泥、挑选、去皮、清洗、切配、装盘而成。口感香甜，锅开后再煮4分钟左右即可食用', 4),
(40, '小白菜', 'c6333.jpg', '12.00', '经过挑选、清洗、切配、装盘而成。锅开后再煮2分钟左右即可食用', 4),
(41, '娃娃菜', 'c6188.jpg', '16.00', '通过挑选、清洗、切配、装盘而成，易吸收锅底汤汁，锅开后再煮2分钟左右即可食用', 4),
(42, '炸豆衣', 'c6111.jpg', '22.00', '鲜豆皮酿制，豆香味浓郁，锅开后涮30秒左右即可食用', 4),
(43, '捞派豆花', 'c8119.jpg', '19.00', '采用优质大豆磨浆，经传统手工工艺压制而成。锅开后再煮5分钟左右即可食用。配上豆花蘸碟，口味更突出', 4),
(44, '有机香菇', 'j7712.jpg', '28.00', '经过挑选、清洗、装盘而成。锅开后再煮2分钟左右即可食用', 5),
(45, '木耳', 'j8181.jpg', '24.00', '经过浸泡、挑选、装盘而成。锅开后再煮3分钟左右即可食用', 5),
(46, '平菇', 'j5612.jpg', '22.00', '经过挑选、清洗、装盘而成。脆嫩而肥厚，锅开后再煮5分钟左右即可食用', 5),
(47, '椎茸', 'j7715.jpg', '36.00', '经过清洗、切配、装盘而成。锅开后再煮4分钟左右即可食用', 5),
(48, '竹荪', 'j7755.jpg', '29.00', '野生竹荪，口感爽滑、脆嫩，开锅后煮3分钟左右即可食用', 5),
(49, '香菇', 'j6619.jpg', '24.00', '经过挑选、清洗、切配、装盘而成。锅开后再煮5分钟左右即可食用', 5),
(50, '金针菇', 'j6119.jpg', '28.00', '经过挑选、清洗、装盘而成。菌盖滑嫩、清脆，锅开后再煮2分钟左右即可食用', 5);

-- --------------------------------------------------------

--
-- 表的结构 `dr_order`
--

CREATE TABLE `dr_order` (
  `oid` int(11) NOT NULL,
  `startTime` bigint(20) DEFAULT NULL,
  `endTime` bigint(20) DEFAULT NULL,
  `customerCount` int(11) DEFAULT NULL,
  `tableId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dr_order`
--

INSERT INTO `dr_order` (`oid`, `startTime`, `endTime`, `customerCount`, `tableId`) VALUES
(100000, 1547800000000, 1547814918000, 2, 1),
(100001, 1547801000000, 1547824918000, 4, 2),
(100002, 1547802000000, 1547834918000, 3, 3),
(100003, 1547803000000, 1547844918000, 5, 5),
(100004, 1547804000000, 1547854918000, 8, 6),
(100005, 1547805000000, 1547864918000, 2, 7),
(100006, 1547806000000, 1547874918000, 1, 8),
(100007, 1547807000000, 1547884918000, 2, 9),
(100008, 1547808000000, 1547894918000, 6, 10),
(100009, 1547809000000, 1547804918000, 3, 11),
(100010, 1547800000000, 1547814918000, 10, 12),
(100011, 1547801000000, 1547824918000, 2, 13),
(100012, 1547802000000, 1547834918000, 4, 15),
(100013, 1547800000000, 1547814918000, 2, 1),
(100014, 1547801000000, 1547824918000, 4, 2),
(100015, 1547802000000, 1547834918000, 3, 3),
(100016, 1547803000000, 0, 5, 5),
(100017, 1547804000000, 1547854918000, 8, 6),
(100018, 1547805000000, 0, 2, 7),
(100019, 1547806000000, 1547874918000, 1, 8),
(100020, 1547807000000, 1547884918000, 2, 9),
(100021, 1547808000000, 0, 6, 10),
(100022, 1547809000000, 1547804918000, 3, 11),
(100023, 1547800000000, 0, 10, 12),
(100024, 1547801000000, 1547824918000, 2, 13),
(100025, 1547802000000, 0, 4, 15);

-- --------------------------------------------------------

--
-- 表的结构 `dr_order_detail`
--

CREATE TABLE `dr_order_detail` (
  `oid` int(11) NOT NULL,
  `dishId` int(11) DEFAULT NULL,
  `dishCount` int(11) DEFAULT NULL,
  `customerName` varchar(32) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dr_order_detail`
--

INSERT INTO `dr_order_detail` (`oid`, `dishId`, `dishCount`, `customerName`, `orderId`) VALUES
(1, 50, 2, '丁丁', 100000),
(2, 24, 2, '丁丁', 100001),
(3, 37, 1, '当当', 100002),
(4, 18, 3, '豆豆', 100003),
(5, 22, 1, '丫丫', 100004),
(6, 21, 2, '丁丁', 100005),
(7, 36, 1, '当当', 100006),
(8, 1, 2, '豆豆', 100007),
(9, 3, 2, '丫丫', 100008),
(10, 11, 2, '丁丁', 100000),
(11, 14, 2, '丁丁', 100001),
(12, 27, 1, '当当', 100002),
(13, 8, 3, '豆豆', 100003),
(14, 42, 1, '丫丫', 100004),
(15, 11, 2, '丁丁', 100005),
(16, 16, 1, '当当', 100006),
(17, 1, 2, '豆豆', 100007),
(18, 3, 2, '丫丫', 100008),
(19, 15, 2, '丁丁', 100009),
(20, 4, 1, '当当', 100010),
(21, 12, 3, '豆豆', 100011),
(22, 9, 1, '丫丫', 100012),
(23, 33, 2, '丁丁', 100013),
(24, 24, 1, '当当', 100014),
(25, 30, 3, '豆豆', 100015),
(26, 20, 2, '丫丫', 100016),
(27, 16, 4, '当当', 100017),
(28, 8, 2, '丫丫', 100018),
(29, 6, 2, '丁丁', 100019),
(30, 5, 1, '当当', 100020),
(31, 29, 1, '豆豆', 100021),
(32, 27, 1, '丫丫', 100022),
(33, 19, 5, '丁丁', 100023),
(34, 16, 1, '当当', 100024),
(35, 11, 1, '豆豆', 100025),
(36, 8, 2, '丫丫', 100016),
(37, 16, 1, '当当', 100017),
(38, 2, 3, '丫丫', 100018),
(39, 1, 2, '丁丁', 100019),
(40, 3, 1, '当当', 100020),
(41, 29, 2, '豆豆', 100021),
(42, 8, 1, '丫丫', 100022),
(43, 7, 4, '丁丁', 100023),
(44, 16, 6, '当当', 100024),
(45, 28, 3, '豆豆', 100025),
(46, 2, 3, '丫丫', 100018),
(47, 42, 2, '丁丁', 100019),
(48, 11, 1, '当当', 100020),
(49, 19, 2, '豆豆', 100021),
(50, 17, 1, '丫丫', 100022),
(51, 12, 4, '丁丁', 100023),
(52, 35, 6, '当当', 100024),
(53, 31, 3, '豆豆', 100025),
(54, 1, 3, '丫丫', 100018),
(55, 2, 1, '丁丁', 100019),
(56, 3, 1, '当当', 100020),
(57, 32, 4, '丁丁', 100023),
(58, 47, 6, '当当', 100024),
(59, 41, 3, '豆豆', 100025),
(60, 2, 3, '丫丫', 100018),
(61, 42, 2, '丁丁', 100019),
(62, 43, 1, '当当', 100020),
(63, 44, 2, '豆豆', 100021),
(64, 48, 1, '丫丫', 100022),
(65, 46, 4, '丁丁', 100023),
(66, 49, 2, '当当', 100024),
(67, 40, 3, '豆豆', 100025),
(68, 31, 1, '丫丫', 100022),
(69, 37, 2, '丁丁', 100023),
(70, 7, 1, '当当', 100024),
(71, 10, 3, '豆豆', 100025),
(72, 39, 1, '丫丫', 100022),
(73, 32, 2, '丁丁', 100023),
(74, 35, 2, '丁丁', 100023),
(75, 9, 1, '当当', 100024),
(76, 50, 3, '豆豆', 100025),
(77, 39, 1, '丫丫', 100022),
(78, 4, 2, '丁丁', 100023),
(79, 31, 2, '丁丁', 100023),
(80, 7, 1, '当当', 100024),
(81, 30, 3, '豆豆', 100025),
(82, 32, 1, '丫丫', 100022),
(83, 41, 2, '丁丁', 100023),
(84, 17, 1, '当当', 100024),
(85, 20, 3, '豆豆', 100025),
(86, 3, 1, '丫丫', 100022),
(87, 4, 2, '丁丁', 100023),
(88, 8, 1, '当当', 100024),
(89, 29, 3, '豆豆', 100025);

-- --------------------------------------------------------

--
-- 表的结构 `dr_reservation`
--

CREATE TABLE `dr_reservation` (
  `rid` int(11) NOT NULL,
  `contactName` varchar(32) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `contactTime` bigint(20) DEFAULT NULL,
  `dinnerTime` bigint(20) DEFAULT NULL,
  `tableId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dr_reservation`
--

INSERT INTO `dr_reservation` (`rid`, `contactName`, `phone`, `contactTime`, `dinnerTime`, `tableId`) VALUES
(1, '丁丁', '13501234561', 1548311700000, 1549011000000, 1),
(2, '当当', '13501234562', 1548311710000, 1549011100000, 1),
(3, '豆豆', '13501234563', 1548311720000, 1549011200000, 2),
(4, '丫丫', '13501234564', 1548311730000, 1549011300000, 2),
(5, '丁丁', '13501234565', 1548311740000, 1549011400000, 3),
(6, '当当', '13501234566', 1548311750000, 1549011500000, 3),
(7, '豆豆', '13501234561', 1548311760000, 1549011600000, 5),
(8, '丫丫', '13501234562', 1548311770000, 1549011700000, 5),
(9, '丁丁', '13501234563', 1548311780000, 1549011800000, 6),
(10, '当当', '13501234564', 1548311790000, 1549011900000, 6),
(11, '豆豆', '13501234565', 1548311800000, 1549011000000, 7),
(12, '丫丫', '13501234566', 1548311810000, 1549011100000, 8),
(13, '豆豆', '13501234567', 1548311820000, 1549011200000, 9),
(14, '丫丫', '13501234561', 1548311840000, 1549011300000, 10),
(15, '丁丁', '13501234562', 1548311850000, 1549011400000, 10),
(16, '当当', '13501234563', 1548311860000, 1549011500000, 11),
(17, '豆豆', '13501234564', 1548311870000, 1549011600000, 11),
(18, '丫丫', '13501234565', 1548311880000, 1549011600000, 12),
(19, '豆豆', '13501234566', 1548311890000, 1549011500000, 13),
(20, '当当', '13501234567', 1548311900000, 1549011300000, 13),
(21, '丫丫', '13501234568', 1548311910000, 1549011200000, 15);

-- --------------------------------------------------------

--
-- 表的结构 `dr_settings`
--

CREATE TABLE `dr_settings` (
  `sid` int(11) NOT NULL,
  `appName` varchar(32) DEFAULT NULL,
  `apiUrl` varchar(64) DEFAULT NULL,
  `adminUrl` varchar(64) DEFAULT NULL,
  `appUrl` varchar(64) DEFAULT NULL,
  `icp` varchar(64) DEFAULT NULL,
  `copyright` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dr_settings`
--

INSERT INTO `dr_settings` (`sid`, `appName`, `apiUrl`, `adminUrl`, `appUrl`, `icp`, `copyright`) VALUES
(1, '小肥牛', 'http://127.0.0.1:8090', 'http://127.0.0.1:8091', 'http://127.0.0.1:8092', '京ICP备12003709号-3', 'Copyright © 北京达内金桥科技有限公司版权所有');

-- --------------------------------------------------------

--
-- 表的结构 `dr_table`
--

CREATE TABLE `dr_table` (
  `tid` int(11) NOT NULL,
  `tname` varchar(32) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dr_table`
--

INSERT INTO `dr_table` (`tid`, `tname`, `type`, `status`) VALUES
(1, '金镶玉', '2人桌', 1),
(2, '玉如意', '2人桌', 1),
(3, '齐天寿', '6人桌', 3),
(5, '福临门', '4人桌', 2),
(6, '全家福', '6人桌', 3),
(7, '展宏图', '2人桌', 1),
(8, '万年长', '8人桌', 1),
(9, '百事通', '4人桌', 3),
(10, '满堂彩', '10人桌', 2),
(11, '鸿运头', '8人桌', 1),
(12, '福满堂', '12人桌', 1),
(13, '高升阁', '4人桌', 3),
(15, '乐逍遥', '2人桌', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dr_admin`
--
ALTER TABLE `dr_admin`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `aname` (`aname`);

--
-- Indexes for table `dr_category`
--
ALTER TABLE `dr_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `dr_dish`
--
ALTER TABLE `dr_dish`
  ADD PRIMARY KEY (`did`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `dr_order`
--
ALTER TABLE `dr_order`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `tableId` (`tableId`);

--
-- Indexes for table `dr_order_detail`
--
ALTER TABLE `dr_order_detail`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `dishId` (`dishId`),
  ADD KEY `orderId` (`orderId`);

--
-- Indexes for table `dr_reservation`
--
ALTER TABLE `dr_reservation`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `tableId` (`tableId`);

--
-- Indexes for table `dr_settings`
--
ALTER TABLE `dr_settings`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `dr_table`
--
ALTER TABLE `dr_table`
  ADD PRIMARY KEY (`tid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `dr_admin`
--
ALTER TABLE `dr_admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `dr_category`
--
ALTER TABLE `dr_category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `dr_dish`
--
ALTER TABLE `dr_dish`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- 使用表AUTO_INCREMENT `dr_order`
--
ALTER TABLE `dr_order`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100026;

--
-- 使用表AUTO_INCREMENT `dr_order_detail`
--
ALTER TABLE `dr_order_detail`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- 使用表AUTO_INCREMENT `dr_reservation`
--
ALTER TABLE `dr_reservation`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- 使用表AUTO_INCREMENT `dr_settings`
--
ALTER TABLE `dr_settings`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `dr_table`
--
ALTER TABLE `dr_table`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 限制导出的表
--

--
-- 限制表 `dr_dish`
--
ALTER TABLE `dr_dish`
  ADD CONSTRAINT `dr_dish_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `dr_category` (`cid`);

--
-- 限制表 `dr_order`
--
ALTER TABLE `dr_order`
  ADD CONSTRAINT `dr_order_ibfk_1` FOREIGN KEY (`tableId`) REFERENCES `dr_table` (`tid`);

--
-- 限制表 `dr_order_detail`
--
ALTER TABLE `dr_order_detail`
  ADD CONSTRAINT `dr_order_detail_ibfk_1` FOREIGN KEY (`dishId`) REFERENCES `dr_dish` (`did`),
  ADD CONSTRAINT `dr_order_detail_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `dr_order` (`oid`);

--
-- 限制表 `dr_reservation`
--
ALTER TABLE `dr_reservation`
  ADD CONSTRAINT `dr_reservation_ibfk_1` FOREIGN KEY (`tableId`) REFERENCES `dr_table` (`tid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
