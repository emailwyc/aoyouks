/*
Navicat MySQL Data Transfer

Source Server         : my
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-04-21 18:25:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名称',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '用户密码',
  `errornum` int(11) NOT NULL DEFAULT '10' COMMENT '错误次数',
  `token` varchar(255) NOT NULL DEFAULT '',
  `logins` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否允许多点登录',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `ct` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'soonebaby', 'aefcbd7108630bf5e89a52c69fe30fab', '9', '41a19c472be7ff28d2b13097202ed509', '1', '127.0.0.1', '2017-04-05 19:03:54');

-- ----------------------------
-- Table structure for `album`
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '相册id',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `img_icon` varchar(255) NOT NULL COMMENT 'icon地址',
  `scale` float NOT NULL DEFAULT '0' COMMENT '图片名称',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('1', '1', '/ui/system/images/soonebaby10.jpg', '/ui/system/images/soonebaby10.jpg', '0', '2017-03-21 11:45:18');
INSERT INTO `album` VALUES ('2', '1', '/ui/system/images/soonebaby11.jpg', '/ui/system/images/soonebaby11.jpg', '0', '2017-03-21 11:45:18');
INSERT INTO `album` VALUES ('3', '1', '/ui/system/images/soonebaby12.jpg', '/ui/system/images/soonebaby12.jpg', '0', '2017-03-21 11:45:18');
INSERT INTO `album` VALUES ('4', '2', '/ui/system/images/soonebaby13.jpg', '/ui/system/images/soonebaby13.jpg', '0', '2017-03-21 12:06:32');
INSERT INTO `album` VALUES ('5', '2', '/ui/system/images/soonebaby14.jpg', '/ui/system/images/soonebaby14.jpg', '0', '2017-03-21 12:06:32');
INSERT INTO `album` VALUES ('6', '2', '/ui/system/images/soonebaby15.jpg', '/ui/system/images/soonebaby15.jpg', '0', '2017-03-21 12:06:32');
INSERT INTO `album` VALUES ('7', '2', '/ui/system/images/soonebaby16.jpg', '/ui/system/images/soonebaby16.jpg', '0', '2017-03-21 12:06:32');
INSERT INTO `album` VALUES ('8', '2', '/ui/system/images/soonebaby17.jpg', '/ui/system/images/soonebaby17.jpg', '0', '2017-03-21 12:06:32');
INSERT INTO `album` VALUES ('9', '2', '/ui/system/images/soonebaby18.jpg', '/ui/system/images/soonebaby18.jpg', '0', '2017-03-21 12:06:32');
INSERT INTO `album` VALUES ('10', '2', '/ui/system/images/soonebaby19.jpg', '/ui/system/images/soonebaby19.jpg', '0', '2017-03-21 12:06:32');

-- ----------------------------
-- Table structure for `album_class`
-- ----------------------------
DROP TABLE IF EXISTS `album_class`;
CREATE TABLE `album_class` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `photo_num` int(11) NOT NULL DEFAULT '0' COMMENT '图片数量',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:显示0：不显示',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '当前时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album_class
-- ----------------------------
INSERT INTO `album_class` VALUES ('1', '微博收集', '3', '/ui/system/images/soonebaby12.jpg', '1', '2017-03-21 10:45:09');
INSERT INTO `album_class` VALUES ('2', '精美图片收集', '8', '/ui/system/images/soonebaby12.jpg', '1', '2017-03-21 10:45:36');

-- ----------------------------
-- Table structure for `album_comment`
-- ----------------------------
DROP TABLE IF EXISTS `album_comment`;
CREATE TABLE `album_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `aid` int(11) NOT NULL COMMENT '文章id',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:评论2回复',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(50) NOT NULL DEFAULT '' COMMENT '头像',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '内容',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `ext` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展字段',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `pid` (`pid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album_comment
-- ----------------------------
INSERT INTO `album_comment` VALUES ('3', '2', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/118.jpg', '好漂亮啊<img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\">', 'emailwyc@163.com', '2017-03-21 13:57:31', '127.0.0.1', '获取失败', '');
INSERT INTO `album_comment` VALUES ('4', '2', '2', '3', 'SooneBaby', '/ui/system/images/default_avatar/118.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 13:59:58', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `album_comment` VALUES ('5', '2', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/118.jpg', '相片不错<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 14:00:41', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `album_comment` VALUES ('6', '2', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/118.jpg', '很棒的照片<img src=\"/ui/system/comment/images/face/17.gif\" class=\"face\">', '', '2017-03-21 14:04:06', '127.0.0.1', '未分配或者内网IP', '');

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `cid` int(11) NOT NULL COMMENT '分类id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '头图',
  `short` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL COMMENT '文章内容',
  `author` varchar(50) NOT NULL DEFAULT '' COMMENT '作者',
  `author_link` varchar(255) NOT NULL DEFAULT '' COMMENT '作者链接',
  `is_reward` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否打赏',
  `is_hot` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否热门',
  `pv` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `comnum` int(11) NOT NULL DEFAULT '0' COMMENT '评论数量',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `status` (`status`),
  KEY `pv` (`pv`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('2', '1', '你和高级工程师的差距在哪里？', '/ui/system/images/58594e47cc35d.png', '用PHP做网站访客统计，听起来好像有点多此一举，想想有那么多好用的统计工具不用，偏偏想自己写？不过，有时还是按项目需求走吧。', '    之前很多人问过我这么个问题，说怎样才能成为一名高级工程师？我觉得这是一个很好的话题，技术人的职业规划不管如何发展，总归是一个从初级到高级的过程，不要妄想从初级一步跨越到架构师、CTO 之类的职位，所以高级工程师这个过渡阶段显得就很重要了，那么今天就来给大家说说你们还差在哪里！    \r\n\r\n    1、工作经验与技术积累\r\n\r\n    说到高级工程师大家的第一印象自然就是工作经验丰富，技术够牛逼。\r\n\r\n    注意这里说的是工作经验，并不是指工作时间。有的人踏踏实实做项目，业余时间想着多学点新技术，坚持读书，认真写博客总结，多实践，加上自己本身悟性又不差的，2、3 年的时间都可以有别人 3、5 年的工作经验，成长为公司的高级工程师水到渠成。而有的人混日子，做的项目得过且过，业余时间玩游戏，追剧，也许你在公司工作了 10 年看起来兢兢业业，然而你对自己没有更高的要求，安于现状，不求进步，这类人即使有 10 年的工作时间，却只能止步于此。\r\n\r\n    靠着自己持续不断的学习，以及工作经验的积累，一步一步，见得市面多，踩的坑也多，技术越来越牛逼也是理所应当的事，而技术是一个高级工程师最基本的要求，然而我却认为只要不是傻子，对技术有点追求的人，想达到这点不难，只是时间长短问题而已，除了技术，你跟那些真正的高级工程师还有其他方面的差距！\r\n\r\n    2、责任心\r\n\r\n    高级工程师责任心一定很强，责任心是体现一个人的态度问题，对于一个 bug ，他们永远都会重视，想尽一切办法找到原因并尽快解决，而有的人对于 bug 却是得过且过，解决 bug 的态度就是尝试，认为从表面上解决了就 ok 了。\r\n\r\n    我们 CTO 十几年的软件开发经验，有用户反馈 bug ，不管多忙，不管什么时间，一定停下手头上的事情，去找到原因并解决。我在薄荷的经历，曾不止一次跟着他为了解决一个 bug 搞到深夜，有几次深夜发现一个导致用户不能付款的 bug ，我都躺床上睡觉了，被 CTO 喊起来半夜赶往公司去修复的经历，当时还觉得不理解，时间长了，我才意识到这种责任心是职业素养，现在也深深的被感染，在任何时候、任何时间，我的手机、电脑都是不离身，出问题一定第一时间进行响应！对比下你们，你们的责任心够强么？\r\n\r\n    3、主动\r\n\r\n    有没有这种经历？就是项目做完了，感觉没事可做了，那就刷刷微博，聊聊 QQ 吧。\r\n\r\n    然而那些优秀的工程师是怎么样的？\r\n\r\n    他们项目做完了会想着哪里代码写的不够好，会想着重构下。    \r\n\r\n    自己在赶某个功能的时候太匆忙了，刚好利用这段时间看看有没有更好的办法实现。\r\n\r\n    这个项目做完了，学到了不少东西，又踩了不少坑，写写博客总结下。    \r\n\r\n    做完这个项目感觉架构方面的知识挺缺乏，自己赶紧学习下相关的知识吧。\r\n\r\n    初级工程师是等着被分派事情做的，分派的事情做完了感觉就没事可做了。而高级工程师会自己主动找事做，他们永远不会觉得自己的时间多余，重构、优化、学习、总结等等等，有一大堆可以主动做的事。\r\n\r\n    4、敢于承担\r\n<ul class=\"infos list-paddingleft-2\" style=\"list-style-type: none;\"><p style=\"text-indent: 2em; line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">之前很多人问过我这么个问题，说怎样才能成为一名高级工程师？我觉得这是一个很好的话题，技术人的职业规划不管如何发展，总归是一个从初级到高级的过程，不要妄想从初级一步跨越到架构师、CTO 之类的职位，所以高级工程师这个过渡阶段显得就很重要了，那么今天就来给大家说说你们还差在哪里！&nbsp; &nbsp;&nbsp;</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">1、工作经验与技术积累</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">说到高级工程师大家的第一印象自然就是工作经验丰富，技术够牛逼。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">注意这里说的是工作经验，并不是指工作时间。有的人踏踏实实做项目，业余时间想着多学点新技术，坚持读书，认真写博客总结，多实践，加上自己本身悟性又不差的，2、3 年的时间都可以有别人 3、5 年的工作经验，成长为公司的高级工程师水到渠成。而有的人混日子，做的项目得过且过，业余时间玩游戏，追剧，也许你在公司工作了 10 年看起来兢兢业业，然而你对自己没有更高的要求，安于现状，不求进步，这类人即使有 10 年的工作时间，却只能止步于此。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">靠着自己持续不断的学习，以及工作经验的积累，一步一步，见得市面多，踩的坑也多，技术越来越牛逼也是理所应当的事，而技术是一个高级工程师最基本的要求，然而我却认为只要不是傻子，对技术有点追求的人，想达到这点不难，只是时间长短问题而已，除了技术，你跟那些真正的高级工程师还有其他方面的差距！</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">2、责任心</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">高级工程师责任心一定很强，责任心是体现一个人的态度问题，对于一个 bug ，他们永远都会重视，想尽一切办法找到原因并尽快解决，而有的人对于 bug 却是得过且过，解决 bug 的态度就是尝试，认为从表面上解决了就 ok 了。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">我们 CTO 十几年的软件开发经验，有用户反馈 bug ，不管多忙，不管什么时间，一定停下手头上的事情，去找到原因并解决。我在薄荷的经历，曾不止一次跟着他为了解决一个 bug 搞到深夜，有几次深夜发现一个导致用户不能付款的 bug ，我都躺床上睡觉了，被 CTO 喊起来半夜赶往公司去修复的经历，当时还觉得不理解，时间长了，我才意识到这种责任心是职业素养，现在也深深的被感染，在任何时候、任何时间，我的手机、电脑都是不离身，出问题一定第一时间进行响应！对比下你们，你们的责任心够强么？</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">3、主动</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">有没有这种经历？就是项目做完了，感觉没事可做了，那就刷刷微博，聊聊 QQ 吧。</span></p><p style=\"text-indent: 0em; line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">然而那些优秀的工程师是怎么样的？</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">他们项目做完了会想着哪里代码写的不够好，会想着重构下。&nbsp; &nbsp;&nbsp;</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">\r\n	自己在赶某个功能的时候太匆忙了，刚好利用这段时间看看有没有更好的办法实现。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">这个项目做完了，学到了不少东西，又踩了不少坑，写写博客总结下。&nbsp; &nbsp;&nbsp;</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">\r\n	做完这个项目感觉架构方面的知识挺缺乏，自己赶紧学习下相关的知识吧。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">初级工程师是等着被分派事情做的，分派的事情做完了感觉就没事可做了。而高级工程师会自己主动找事做，他们永远不会觉得自己的时间多余，重构、优化、学习、总结等等等，有一大堆可以主动做的事。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">4、敢于承担</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">初级工程师在拿到一个稍微复杂点的需求的时候第一印象就是好复杂，我实现不了，哪怕这个技术别家证明可以实现。而高级工程师则不会不做技术调研就说 no ，敢于接受挑战，除非在做过充分的技术调研之后，确信确实实现不了，否则都会付出 200% 的努力去实现它。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">对于技术如此，同样的对于一些解决方案、架构设计、历史遗留问题的解决甚至项目负责人等的挑战都会勇于承担，你不逼下自己，给自己点压力，你永远不知道自己的潜力有多大，而就是在这一次次攻克难关的过程中，你的成长是飞速的！所以，不妨试着让自己承担一些有挑战的工作！</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">5、团队合作精神</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">如今这个时代再也不是英雄主义时代了，团队才是一切，任你能力再出众，但是跟一个团队比起来，你还是寡不敌众。所以，优秀的高级工程师永远有团队合作精神，永远以团队利益为优先，任何时候，不要做拖团队后腿的那位！</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">富有凝聚力的团队是一个公司最具竞争力的核心武器，所以，请从思想上让自己有这个意识，团队永远大于个人！</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">6、参与业务、产品</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">我见过太多的程序员，产品经理给出需求的时候，闷头就开始写代码，中途需求变动了，然后就开始在心里大骂产品经理傻×，简直就是所谓的「码农」，虽然我们都拿「码农」来自嘲，但是我相信我们都不希望成为真正的码农，我们要做的是工程师！</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">而工程师跟码农的区别就是，他们不只是闷头 Coding，他们会参与产品、参与业务，虽然我们的主要职责是开发，但是如果能在需求阶段跟产品经理一起讨论，也许在产品、业务上你不专业，但是可以从技术的角度来一起思考，一起参与进来，尽量帮忙把需求更完善些。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">初级工程师拿到需求会直接开始做，然后做着做着发现有问题了，要么技术实现不了，要么逻辑有问题。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">而高级工程师拿到需求会考虑很多，技术的可行性？对现有业务有没有帮助？对现有技术架构的影响？扩展性如何？等等...之后才会再进行设计编码阶段。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">所以好的工程师是可以对产品有很大的帮助作用的，而且跟产品经理多进行沟通交流，除了技术外，对产品、对业务、对商业你也能学到不少东西，以后的路会更广。所以，不要做闷头 Coding 的码农，做关心业务、产品的工程师！</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">最后，以上是我总结的优秀的高级工程师的一些标准，别总说你跟那些人只是技术上的差距而已，除了技术，其他地方可能差的更远。技术可以靠时间来弥补，但是其他几个方面可是时间无法弥补的，希望大家自己对照下，不管是所谓的高级工程师也好，还是之后的小组 Leader，甚至再之后的架构师、CTO，这些特质是必须具备的，问问自己，你们的差距还有多远？</span></p></ul>', 'SooneBaby', '/about', '1', '0', '0', '1', '0', '2017-03-13 12:39:05');
INSERT INTO `article` VALUES ('3', '4', '用PHP做网站的PV、UV、IP访客统计', '/ui/system/images/5859524f9dcbf.png', '用PHP做网站访客统计，听起来好像有点多此一举，想想有那么多好用的统计工具不用，偏偏想自己写？不过，有时还是按项目需求走吧。', '<ul class=\"infos list-paddingleft-2\" style=\"list-style-type: none;\"><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">用PHP做网站访客统计，听起来好像有点多此一举，想想有那么多好用的统计工具不用，偏偏想自己写？不过，有时还是按项目需求走吧。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">就当我是在废话吧，还是想唠叨一下PV、UV、IP三者的定义与区别。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\"><strong style=\"margin: 0px; padding: 0px;\">1.PV(page view)</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">页面访问量，即此页面(站点)被打开过多少次，比如打开本博首页然后有电击进入了本文，此时便为本博贡献了2PV，本文1PV，如果您现在手滑按了下F5，那么就为本博贡献了3PV（首页1+本文2）。</p><strong class=\"hib\" style=\"margin: 0px; padding: 0px; color: rgb(255, 255, 255); height: 10px; font-size: 5px; font-family: \'white-space:normal;\'; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\"></strong><span style=\"margin: 0px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;background-color:#FFFFFF;\';\"></span><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\"><strong style=\"margin: 0px; padding: 0px;\">2.UV(Unqie Vistor)</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">独立访客数，指的是不同的、通过互联网访问、浏览一个网页的自然人。一般情况下，是使用COOKIE进行区分。比如，您现在访问了本文，会给本博UV加1，随后您关闭了浏览器，接着您的朋友又用您的电脑访问了本博，此时，UV是不会变的，因为浏览器的COOKIE没变。再比如，您使用新浪微博登录访问的本博，随后退出帐号，又用腾许微博登录访问本博，那么先后就会给本博UV加2，因为浏览器记录到了两个用户。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\"><strong style=\"margin: 0px; padding: 0px;\">3.IP(internet protocol)</strong></p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">独立IP数目，记录访问本博的真实IP数量，可以使用程序记录，也可以通过分析服务器日志统计。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">前面也有说到IP和UV这里有些绕。可以拿下面几种情况理解。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">您家里有多台电脑，都连了家里的一个路由器，这是通过不同的PC访问本博，只会记录一个IP数，因为对外IP是一样的。但是会记录多个UV，因为记录到了多个不同的COOKIE，甚至在同一电脑上使用不同的浏览器都有可能会加两个UV。在登录的情况下，就算同一PC、同一浏览器，只要是多个用户访问，都会加多个UV的。此时不巧您忽然断网了，过了一会重新拨号上网，IP变了，这时候本博的IP数会再加1，但是如果还是使用刚才的PC，刚才的浏览器访问本博的话，UV是不会变的，因为您的的COOKIE没变。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">这样大概就可以理解了吧？当然，或许您会说，UV存在客户端的COOCKIE中，这不就意味着可以伪造了吗？这个安心啦，首先不说谁会没事儿搞这个，其次是我记得《大数据时代》中，作者好像反复强调数据的非准确性。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">当然，UV只是网站流量的其中一个指标而已，具体指标还是要综合这三者进行分析的，一般情况下IP数量的统计是比较容易实现，具有较高的真实性（相对来说）。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">另外需要说明的是，IP和UV惯例一般都是以24小时为一个周期的。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">好啦，唠了一大堆理论，该说一下程序了。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">我接到的需求是统计指定页面的各项指标，而非整站，所以就要在各个页面做统计了。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">PV、IP的统计都比较容易了，PV是每次加载页面都加1，IP就是获取客户端的真实IP，然后看今日是否有记录，没有就加1。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">UV，写入COOKIE，同样要进行今日是否有记录进行判断，本来如果是统计全站的话，直接记录一个COOKIE，然后在访问的时候，查询是否存在COOKIE即可，但是此次需求是要求统计指定的页，而我又不想记录太大的数据量（比如每次访问都记录IP、COOKIE、URL，最后入库时再做算法统计），所以就在COOKIE这做了个小手脚。</p><br><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">页面每次加载，取出指定日期记录文件中的PV数，加1。同时，打开IP记录文件，追加一条数据。也可以类似服务器日志那样，每次加载页面，就把此次访问的所有数据写入记录文件中，然后写计划任务，每日午夜执行，更新数据库。（一定不要每次都操作数据库啊，负担太大！）</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(85, 85, 85); font-family: \'font-size:14px;white-space:normal;\';\">啊哈，说道最后还是没有列出代码，只因此次代码太过特殊，写代码还不如唠一下理论，授人以鱼不如授人以渔不是吗？</p></ul>', 'SooneBaby', '/about', '1', '1', '0', '1', '0', '2017-03-13 12:39:15');
INSERT INTO `article` VALUES ('4', '2', '我的个人博客网站是怎么制作的？', '/ui/system/images/585939c1cb595.jpg', '首先得恭喜自己，因为今天我的个人博客网站终于上线了！要问到我做个人博客的初衷是什么？这得追溯到大学的时候，大学刚接触到Dreamweaver，喜欢上Photoshop', '<p style=\"text-indent: 2em;\"><span style=\"font-size: 16px; font-family: 宋体, SimSun;\">首先得恭喜自己，因为今天我的个人博客网站终于上线了！要问到我做个人博客的初衷是什么？这得追溯到大学的时候，大学刚接触到Dreamweaver，喜欢上Photoshop是就萌芽出做一个属于自己的网站。那时就在想有个自己的网站得多神气啊！说实话那时就是单纯的喜欢，不过今天算是如愿以偿了！<br style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">说到做网站，我相信每一个做web前端、网站后台、SEO技术及自媒体相关的工作人员，心里面都有个做个人网站的想法。那么建立个人网站可以给我们带来什么：</span></p>', 'SooneBaby', '/about', '1', '0', '3', '1', '0', '2017-03-13 12:39:22');
INSERT INTO `article` VALUES ('5', '8', '10个吸引百度蜘蛛爬行网站的技巧', '/ui/system/images/585949886ec58.jpg', '大家都知道百度收录你网站的页面，首先得让百度蜘蛛去爬你的网站，只有让百度蜘蛛喜欢爬你的网站，你的网站收录自然就高了。下面小编整理10个非常适用的吸引百度蜘蛛爬行的技', '    大家都知道百度收录你网站的页面，首先得让百度蜘蛛去爬你的网站，只有让百度蜘蛛喜欢爬你的网站，你的网站收录自然就高了。下面小编整理10个非常适用的吸引百度蜘蛛爬行的技巧。\r\n\r\n    1.高权重的外链\r\n\r\n    高权重网站就有权威、百度蜘蛛是肯定特殊对待的，抓取的频率就相对高，而且网站的权重越高被爬行的深度也会比较高，相应能被抓取的页面也会变多。这样的话蜘蛛也会随着友情链接爬行到我们自己的网站，所以大家在换友链的时间，尽量换高权重的站点。\r\n\r\n    2.网站保持更新\r\n\r\n    蜘蛛每次爬行都会把页面数据存储起来。如果第二次爬行发现页面与第一次收录的完全一样，说明页面没有更新，蜘蛛也就没有必要经常抓取了。页面内容经常更新，蜘蛛就会更加频繁的访问页面。有规律的进行文章更新，这样蜘蛛就会根据你的规律有效的过来抓取，不仅让你的更新文章能更快的抓取到，而且也不会造成蜘蛛经常性的白跑一趟。还有就是更新后，记得主动去提交链接。\r\n\r\n    3.文章的原创性\r\n\r\n    优质的原创内容对于百度蜘蛛的诱惑力是非常巨大的，蜘蛛存在的目的就是寻找新东西，所以网站更新的文章不要采集、也不要每天都是转载，我们需要给蜘蛛真正有价值的原创内容，蜘蛛能得到喜欢的，自然会对你的网站产生好感，经常性的过来觅食。\r\n\r\n    4.首页推荐\r\n<ul class=\"infos list-paddingleft-2\" style=\"list-style-type: none;\"><p style=\"margin-top: 0px; padding: 0px;\">大家都知道百度收录你网站的页面，首先得让百度蜘蛛去爬你的网站，只有让百度蜘蛛喜欢爬你的网站，你的网站收录自然就高了。下面小编整理10个非常适用的吸引百度蜘蛛爬行的技巧。</p><p style=\"margin-top: 0px; padding: 0px;\">1.高权重的外链</p><p style=\"margin-top: 0px; padding: 0px;\">高权重网站就有权威、百度蜘蛛是肯定特殊对待的，抓取的频率就相对高，而且网站的权重越高被爬行的深度也会比较高，相应能被抓取的页面也会变多。这样的话蜘蛛也会随着友情链接爬行到我们自己的网站，所以大家在换友链的时间，尽量换高权重的站点。</p><p style=\"margin-top: 0px; padding: 0px;\">2.网站保持更新</p><p style=\"margin-top: 0px; padding: 0px;\">蜘蛛每次爬行都会把页面数据存储起来。如果第二次爬行发现页面与第一次收录的完全一样，说明页面没有更新，蜘蛛也就没有必要经常抓取了。页面内容经常更新，蜘蛛就会更加频繁的访问页面。有规律的进行文章更新，这样蜘蛛就会根据你的规律有效的过来抓取，不仅让你的更新文章能更快的抓取到，而且也不会造成蜘蛛经常性的白跑一趟。还有就是更新后，记得主动去提交链接。</p><p style=\"margin-top: 0px; padding: 0px;\">3.文章的原创性</p><p style=\"margin-top: 0px; padding: 0px;\">优质的原创内容对于百度蜘蛛的诱惑力是非常巨大的，蜘蛛存在的目的就是寻找新东西，所以网站更新的文章不要采集、也不要每天都是转载，我们需要给蜘蛛真正有价值的原创内容，蜘蛛能得到喜欢的，自然会对你的网站产生好感，经常性的过来觅食。</p><p style=\"margin-top: 0px; padding: 0px;\">4.首页推荐</p><p style=\"margin-top: 0px; padding: 0px;\">首页是蜘蛛来访次数最多的页面，也是网站权重最高的页面，可以在首页设置更新版块，这样不仅能让首页更新起来，促进蜘蛛的来访频率，而且可以促进更新页的抓取收录。同理在栏目页也可以进行此操作。</p><p style=\"margin-top: 0px; padding: 0px;\">5.扁平化网站结构</p><p style=\"margin-top: 0px; padding: 0px;\">蜘蛛抓取也是有自己的线路的，在之前你就给他铺好路，网站结构不要过于复杂，链接层次不要太深，一般三层即可。如果链接层次太深，后面的页面很难被蜘蛛抓取到。</p><p style=\"margin-top: 0px; padding: 0px;\">6.网站内链建设</p><p style=\"margin-top: 0px; padding: 0px;\">蜘蛛的爬行是跟着链接走的，所以内链的合理优化可以要蜘蛛抓取到更多的页面，促进网站的收录。内链建设过程中要给用户合理推荐，除了在文章中增加锚文本之外，可以设置相关推荐，热门文章，更多喜欢之类的栏目，这是很多网站都在利用的，可以让蜘蛛抓取更大范围的页面。</p><p style=\"margin-top: 0px; padding: 0px;\">7.建设网站地图。</p><p style=\"margin-top: 0px; padding: 0px;\">搜索引擎蜘蛛非常喜欢网站地图，网站地图是一个网站所有链接的容器。很多网站的链接层次比较深，蜘蛛很难抓取到，网站地图可以方便搜索引擎蜘蛛抓取网站页面，通过抓取网站页面，清晰了解网站的架构，所以建设一个网站地图不仅提高抓取率还能获得蜘蛛好感。</p><p style=\"margin-top: 0px; padding: 0px;\">8.检查死链，设置404页面</p><p style=\"margin-top: 0px; padding: 0px;\">搜索引擎蜘蛛是通过链接来爬行搜索，如果太多链接无法到达，不但收录页面数量会减少，而且你的网站在搜索引擎中的权重会大大降低。蜘蛛在遇见死链就像进了死胡同，又得折返重新来过，大大降低蜘蛛在网站的抓取效率，所以一定要定期排查网站的死链，向搜索引擎提交，同时要做好网站的404页面，告诉搜索引擎错误页面。</p><p style=\"margin-top: 0px; padding: 0px;\">9.检查robots文件</p><p style=\"margin-top: 0px; padding: 0px;\">很多网站有意无意的直接在robots文件屏蔽了百度或网站部分页面，却整天在找原因为什么蜘蛛不来抓取我的页面，这能怪百度吗?你都不让别人进门了，百度是怎么收录你的网页?所以有必要时常去检查一下网站robots文件是否正常。</p><p style=\"margin-top: 0px; padding: 0px;\">10.监测蜘蛛的爬行。</p><p style=\"margin-top: 0px; padding: 0px;\">利用网站日志监测蜘蛛正在抓取哪些页面、抓取过哪些页面，还可以利用站长工具对蜘蛛的爬行速度进行查看，合理分配资源，以达到更高的抓取速度和勾引更多的蜘蛛。</p><p style=\"margin-top: 0px; padding: 0px;\">网站要获得更多的收录就需要做好搜索引擎蜘蛛的抓取优化工作，网站优化不是一朝一夕的事情，耐心做好基础工作才是网站优化的根本。</p></ul>', 'SooneBaby', '/about', '1', '0', '30', '1', '0', '2017-03-13 12:39:27');
INSERT INTO `article` VALUES ('6', '2', '多台web服务器如何共享SESSION?', '/ui/system/images/585949e3c5119.jpg', 'web服务器集群（多台web服务器）session同步、共享的3种解决方法。在做了web集群后，你肯定会首先考虑session同步问题', '<ul class=\"infos list-paddingleft-2\" style=\"list-style-type: none;\"><p style=\"margin-top: 0px; padding: 0px; text-indent: 0em;\"><span style=\"margin: 0px; padding: 0px;\">web服务器集群（多台web服务器）session同步、共享的3种解决方法。</span><span style=\"font-family: tahoma, arial, 宋体; line-height: 25.2px;\">在做了web集群后，你肯定会首先考虑session同步问题，因为通过负载均衡后，同一个IP访问同一个页面会被分配到不同的服务器上，如果session不同步的话，一个登录用户，一会是登录状态，一会又不是登录状态。所以本文就根据这种情况给出三种不同的方法来解决这个问题：&nbsp;</span></p><p style=\"margin-top: 0px; padding: 0px; text-indent: 0em;\"><span style=\"color: rgb(255, 0, 0);\"><strong style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">一、利用数据库同步session&nbsp;</strong></span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">在做多服务器session同步时我没有用这种方法，如果非要用这种方法的话，我想过二种方法：&nbsp;</span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">1，用一个低端电脑建个数据库专门存放web服务器的session，或者，把这个专门的数据库建在文件服务器上，用户访问web服务器时，会去这个专门的数据库check一下session的情况，以达到session同步的目的。&nbsp;</span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">2，这种方法是把存放session的表和其他数据库表放在一起，如果mysql也做了集群了话，每个mysql节点都要有这张表，并且这张session表的数据表要实时同步。&nbsp;</span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">说明：用数据库来同步session，会加大数据库的负担，数据库本来就是容易产生瓶颈的地方，如果把session还放到数据库里面，无疑是雪上加霜。上面的二种方法，第一点方法较好，把放session的表独立开来，减轻了真正数据库的负担&nbsp;</span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\"><strong style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">二、利用cookie同步session&nbsp;</strong></span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">session是文件的形势存放在服务器端的，cookie是文件的形势存在客户端的，怎么实现同步呢？方法很简单，就是把用户访问页面产生的session放到cookie里面，就是以cookie为中转站。你访问web服务器A，产生了session把它放到cookie里面了，你访问被分配到web服务器B，这个时候，web服务器B先判断服务器有没有这个session，如果没有，在去看看客户端的cookie里面有没有这个session，如果也没有，说明session真的不存，如果cookie里面有，就把cookie里面的sessoin同步到web服务器B，这样就可以实现session的同步了。</span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">说明：这种方法实现起来简单，方便，也不会加大数据库的负担，但是如果客户端把cookie禁掉了的话，那么session就无从同步了，这样会给网站带来损失；cookie的安全性不高，虽然它已经加了密，但是还是可以伪造的。&nbsp;</span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\"><strong style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">三、利用memcache同步session&nbsp;</strong></span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">memcache可以做分布式，如果没有这功能，他也不能用来做session同步。他可以把web服务器中的内存组合起来，成为一个\"内存池\"，不管是哪个服务器产生的sessoin都可以放到这个\"内存池\"中，其他的都可以使用。&nbsp;</span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">优点：以这种方式来同步session，不会加大数据库的负担，并且安全性比用cookie大大的提高，把session放到内存里面，比从文件中读取要快很多。&nbsp;</span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">缺点：memcache把内存分成很多种规格的存储块，有块就有大小，这种方式也就决定了，memcache不能完全利用内存，会产生内存碎片，如果存储块不足，还会产生内存溢出。&nbsp;</span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\"><strong style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">四、总结&nbsp;</strong></span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">上面三种方法都是可行的&nbsp;</span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">第一种方法，最影响系统速度的那种，不推荐使用；&nbsp;</span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">第二种方法，效果不错，不过安全隐患一样的存在；&nbsp;</span><br style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\"><span style=\"margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体; line-height: 25.2px;\">第三种方法，个人觉得第三种方法是最好的，推荐大家使用</span></p></ul>', 'SooneBaby', '/about', '1', '0', '1', '1', '0', '2017-03-13 19:25:28');
INSERT INTO `article` VALUES ('7', '8', '个人SEO博客网站优化该注意什么？', '/ui/system/images/585939c1cb595.jpg', '网站SEO优化是一个长期坚持的过程，做网站优化的SEOer，我相信你们都是非常有耐心的人。废话不多说，今天小编结合自身SEO知识给大家讲讲个人SEO博客该如何优化？纵观现', '<ul class=\"infos list-paddingleft-2\" style=\"list-style-type: none;\"><p style=\"margin-top: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">网站SEO优化是一个长期坚持的过程，做网站优化的SEOer，我相信你们都是非常有耐心的人。废话不多说，今天小编结合自身SEO知识给大家讲讲个人SEO博客该如何优化？纵观现在博客发展的趋势，不管是SEO博客还是其他的技术博客，博客定位问题都存在一个很大的误区。</span><span style=\"margin: 0px; padding: 0px;\">博主们很少会想，博客网站是做给谁看的？哪些人会浏览我们的网站？我的网站能吸引什么样的人群？你有想过吗？</span></p><p style=\"margin-top: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">一、博客定位</span></p><p style=\"margin-top: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">搭建博客之前我们一定要想清楚，谁是我们的精准客户群？</span><span style=\"margin: 0px; padding: 0px;\">适当的给每个页面增加标题（title）标题的格式一般为：文章标题-博客标题、栏目标题-博客标题。网站</span><span style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">前期也非常利于优化。标题也可以选择一个指数100-200的主词+一个长尾词，这样前期是非常容易取得权重和排名的</span><span style=\"margin: 0px; padding: 0px;\">。</span></span></p><p style=\"margin-top: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">二、域名的选择问题</span></p><p style=\"margin-top: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">小编提醒搭建在选择域名的时候，尽量选用自己名字的全拼，如果你的名字被别人抢注了，那你最好起一个能跟SEO相关的域名。建议大家在域名选择上一定要起一个简短而又好记的域名，尽量选用.com后缀的域名。</span></p><p style=\"margin-top: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">三、发布优质内容</span><br style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">优质的内容是文章排版整齐，图文并茂，而且字体最好采用14号字体，文章可读性要强，优质的内容包括原创性高、对用户有阅读价值。</span></p><p style=\"margin-top: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">四、向百度提交链接</span></p><p style=\"margin-top: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">更新了优质的文章，那就把链接提交给百度，不然等百度蜘蛛慢慢来抓取，会耗费很多时间，不会提交链接的可以给我留言。</span></p><p style=\"margin-top: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">五、去大型论坛投稿</span><br style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">大型的意思就是权重高、流量大的论坛，比如“西祠胡同”。谢了文章接下来就是宣传和推广了，也就是传说中的“外链”，但很多新手所发布的外链，根本无法增加浏览量，顶多发外链收录传递权重而已，并不能增加曝光率，原因可能是发布的地方不对口，我们尽量去一些权重比较高的论坛去发外链，因为权重高的论坛更容易收录。</span><br style=\"margin: 0px; padding: 0px;\"></p></ul>', 'SooneBaby', '/about', '1', '0', '9', '1', '0', '2017-03-13 19:25:29');
INSERT INTO `article` VALUES ('8', '4', '20个PHP面试题及答案', '/ui/system/images/58594ea45ea8d.jpg', 'php学了那么久了，先来小试牛刀，看下这些PHP程序员面试题都会不会？', '<p><span style=\"font-size: 14px;\">php学了那么久了，先来小试牛刀，看下这些PHP程序员面试题都会不会？<br><strong>初级题目</strong><br>1.问题：请用最简单的语言描述PHP是什么？<br>答：PHP全称：Hypertext Preprocessor，是一种用来开发动态网站的服务器脚本语言。<br>2.问题：echo，print()和print_r()有什么区别？<br>答：echo是一个语言结构，没有返回值。<br>print是一个函数，返回int类型的值[只能打印int string]。<br>print_r()是一个函数，返回bool类型值，按结构输出变量的值，打印关于变量的易于理解的信息[数组、对象等]<br>3.问题：什么是MVC？<br>答：MVC由Model（模型）, View（视图）和Controller（控制器）组成，PHP MVC可以更高效地管理好3个不同层的PHP代码。<br>Model：数据信息存取层。<br>View：view层负责将应用的数据以特定的方式展现在界面上。<br>Controller：通常控制器负责从视图读取数据，控制用户输入，并向模型发送数据。<br>4.问题：在页面中引用CSS有几种方式？<br>答：在页面中使用CSS有3中方式：<br>引用外部CSS文件<br>内部定义Style样式<br>内联样式<br>5.问题：PHP支持多继承吗？<br>答：不支持。PHP类只能继承一个父类，并用关键字“extends”标识。<br>6.问题：请问PHP中echo和print有什么区别？<br>这两个看起来很相似，因为它们都是将一些值打印在屏幕上。但是echo和print的本质区别在于：echo用来输出字符串，显示多个值的时候可以用逗号隔开。只支持基本类型，print不仅可以打印字符串值，而且可以打印函数的返回值。<br>7.问题：PHP中的PEAR是什么？<br>答：PEAR也就是为PHP扩展与应用库（PHP Extension and Application Repository），它是一个PHP扩展及应用的一个代码仓库。<br>8.问题：PHP中的错误类型有哪些？<br>答：PHP中遇到的错误类型大致有3类。<br>提示：这都是一些非常正常的信息，而非重大的错误，有些甚至不会展示给用户。比如访问不存在的变量。<br>警告：这是有点严重的错误，将会把警告信息展示给用户，但不会影响代码的输出，比如包含一些不存在的文件。<br>错误：这是真正的严重错误，比如访问不存在的PHP类。<br>9.问题：如何在PHP中定义常量？<br>答：PHP中使用Define () 来定义常量。<br>define (“Newconstant”, 30);<br>10.问题：如何不使用submit按钮来提交表单？<br>答：如果我们不想用submit按钮来提交表单，我们也可以用超链接来提交，我们可以这样写代码：&lt;a href=”javascript: document.myform.submit();”&gt;Submit Me&lt;/a&gt;<br>11.问题：error_reporting(2047)什么作用？<br>答：PHP 显示所有错误 E_ALL<br><strong>中级题目</strong><br>1.问题：请使用正则写一个函数验证电子邮件的格式是否正确？<br>答：preg_match(‘/^[\\w\\-\\.]+@[\\w\\-]+(\\.\\w+)+$/’,$email);<br>2.问题：如何用PHP和MySQL上传视频？<br>答：我们可以在数据库中存放视频的地址，而不需要将真正的视频数据存在数据库中。可以将视频数据存放在服务器的指定文件夹下，上传的默认大小是2MB，但是我们也可以在php.ini文件中修改max_file size选项来改变。<br>3.问题：请问GET和POST方法有什么区别？<br>答：我们再网页上填写的表单信息都可以通过这两个方法将数据传递到服务器上，当我们使用GET方法是，所有的信息都会出现在URL地址中，并且使用GET方法最多只能传递1024个字符，所以如果在传输量小或者安全性不那么重要的情况下可以使用GET方法。说到POST方法，最多可以传输2MB字节的数据，而且可以根据需要调节。<br>4.问题：打开php.ini中的Safe_mode，会影响哪些函数？列举6个！<br>答：1用户输入输出函数(fopen() file() require(),只能用于调用这些函数有相同脚本的拥有者)<br>2:创建新文件(限制用户只在该用户拥有目录下创建文件)<br>3:用户调用popen() systen() exec()等脚本，只有脚本处在safe_mode_exec_dir配置指令指定的目录中才可能<br>4:加强HTTP认证，认证脚本拥有者的UID的划入认证领域范围内，此外启用安全模式下，不会设置PHP_AUTH<br>5:mysql服务器所用的用户名必须与调用mysql_connect()的文件的拥有者用户名相同<br>6:受影响的函数变量以及配置命令达到40个<br>5.问题： 请使用PHP写出冒泡排序算法的代码。<br>答：//冒泡排序<br>function maopao($arr) {<br>$count = count($arr);<br>for($i=0; $i&lt;$count-1; ++$i) {<br>for($j=0; $j&lt;$count-$i-1; ++$j) {<br>if($arr[$j] &gt; $arr[$j+1]) {<br>$temp = $arr[$j];<br>$arr[$j] = $arr[$j+1];<br>$arr[$j+1] = $temp;<br>}<br>}<br>}<br>return $arr;<br>}<br>6.问题： 请使用PHP写出顺序排序算法的代码。<br>答：//顺序排序<br>function shunxu($arr) {<br>$count = count($arr);<br>for($i=0; $i&lt;$count-1; ++$i) {<br>$p = $i;<br>for($j=$i+1; $j&lt;$count; ++$j) {<br>$p = $arr[$p] &gt; $arr[$j] ? $j : $p;<br>}<br>if($p != $i) {<br>$tvalue = $arr[$i];<br>$arr[$i] = $arr[$p];<br>$arr[$p] = $tvalue;<br>}<br>}<br>return $arr;<br>}<br>7.问题：写个函数用来对二维数组排序。<br>答：<br>function array_sort_by_any_row($array_name, $row_id, $order_type){<br>$array_temp=array();<br>foreach($array_name as $key=&gt;$value){<br>$array_temp[$key]=$value[$row_id];<br>}<br>if($order_type===”ASC”){ //顺序<br>asort($array_temp);<br>} else {<br>arsort($array_temp);<br>}<br>$result_array=array();<br>foreach($array_temp as $key=&gt;$value){<br>$result_array[$key]=$array_name[$key];<br>}<br>return $result_array;<br>}<br>$arr = array(<br>array(‘num’=&gt;5, ‘value’=&gt;6),<br>array(‘num’=&gt;2, ‘value’=&gt;39),<br>array(‘num’=&gt;36, ‘value’=&gt;29)<br>);<br>$sortarr = array_sort_by_any_row($arr, ‘num’, ‘DESC’);<br>print_r($sortarr);<br>8.问题： 写5个不同的函数，来截取一个全路径的文件的扩展名，允许封装php库中已有的函数。<br>答：$path = str_replace(‘\\\\’, ‘/’,__FILE__);<br>echo $path.’&lt;br /&gt;’;<br>function extname1($path) {<br>return strrchr($path, ‘.’);<br>}<br>function extname2($path) {<br>$position = strrpos($path, ‘.’);<br>return substr($path, $position);<br>}<br>function extname3($path) {<br>$arr = explode(‘.’, $path);<br>return $arr[count($arr) &ndash; 1];<br>}<br>function extname4($path) {<br>preg_match_all(‘/[\\w\\/\\:\\-]+\\.([\\w]+)$/’, $path, $out);<br>return $out[1][0];<br>}<br>function extname5($path) {<br>return preg_replace(‘/^[^\\.]+\\.([\\w]+)$/’, ‘${1}’, basename($path));<br>}<br>print_r(extname5($path));<br>9.问题：一群猴子排成一圈，按1，2，…，n依次编号。然后从第1只开始数，数到第m只,把它踢出圈，从它后面再开始数，再数到第m只，在把它踢出去…，如此不停的进行下去，直到最后只剩下一只猴子为止，那只猴子就叫做大王。要求编程模拟此过程，输入m、n, 输出最后那个大王的编号。<br>答：yuesefu环问题，PPC有很多针对这个问题的处理，我的就不上啦<br>function yuesefu($n,$m) {<br>$r=0;<br>for($i=2; $i&lt;=$n; $i++) {<br>$r=($r+$m)%$i;<br>}<br>return $r+1;<br>}<br>print_r(yuesefu(3,3));值。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">print是一个函数，返回int类型的值[只能打印int string]。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">print_r()是一个函数，返回bool类型值，按结构输出变量的值，打印关于变量的易于理解的信息[数组、对象等]<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">3.问题：什么是MVC？<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：MVC由Model（模型）, View（视图）和Controller（控制器）组成，PHP MVC可以更高效地管理好3个不同层的PHP代码。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">Model：数据信息存取层。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">View：view层负责将应用的数据以特定的方式展现在界面上。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">Controller：通常控制器负责从视图读取数据，控制用户输入，并向模型发送数据。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">4.问题：在页面中引用CSS有几种方式？<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：在页面中使用CSS有3中方式：<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">引用外部CSS文件<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">内部定义Style样式<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">内联样式<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">5.问题：PHP支持多继承吗？<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：不支持。PHP类只能继承一个父类，并用关键字“extends”标识。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">6.问题：请问PHP中echo和print有什么区别？<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">这两个看起来很相似，因为它们都是将一些值打印在屏幕上。但是echo和print的本质区别在于：echo用来输出字符串，显示多个值的时候可以用逗号隔开。只支持基本类型，print不仅可以打印字符串值，而且可以打印函数的返回值。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">7.问题：PHP中的PEAR是什么？<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：PEAR也就是为PHP扩展与应用库（PHP Extension and Application Repository），它是一个PHP扩展及应用的一个代码仓库。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">8.问题：PHP中的错误类型有哪些？<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：PHP中遇到的错误类型大致有3类。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">提示：这都是一些非常正常的信息，而非重大的错误，有些甚至不会展示给用户。比如访问不存在的变量。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">警告：这是有点严重的错误，将会把警告信息展示给用户，但不会影响代码的输出，比如包含一些不存在的文件。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">错误：这是真正的严重错误，比如访问不存在的PHP类。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">9.问题：如何在PHP中定义常量？<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：PHP中使用Define () 来定义常量。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">define (“Newconstant”, 30);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">10.问题：如何不使用submit按钮来提交表单？<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：如果我们不想用submit按钮来提交表单，我们也可以用超链接来提交，我们可以这样写代码：&lt;a href=”javascript: document.myform.submit();”&gt;Submit Me&lt;/a&gt;<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">11.问题：error_reporting(2047)什么作用？<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：PHP 显示所有错误 E_ALL<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\"><strong>高级题目</strong><br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">1.问题：请使用正则写一个函数验证电子邮件的格式是否正确？<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：preg_match(‘/^[\\w\\-\\.]+@[\\w\\-]+(\\.\\w+)+$/’,$email);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">2.问题：如何用PHP和MySQL上传视频？<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：我们可以在数据库中存放视频的地址，而不需要将真正的视频数据存在数据库中。可以将视频数据存放在服务器的指定文件夹下，上传的默认大小是2MB，但是我们也可以在php.ini文件中修改max_file size选项来改变。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">3.问题：请问GET和POST方法有什么区别？<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：我们再网页上填写的表单信息都可以通过这两个方法将数据传递到服务器上，当我们使用GET方法是，所有的信息都会出现在URL地址中，并且使用GET方法最多只能传递1024个字符，所以如果在传输量小或者安全性不那么重要的情况下可以使用GET方法。说到POST方法，最多可以传输2MB字节的数据，而且可以根据需要调节。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">4.问题：打开php.ini中的Safe_mode，会影响哪些函数？列举6个！<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：1用户输入输出函数(fopen() file() require(),只能用于调用这些函数有相同脚本的拥有者)<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">2:创建新文件(限制用户只在该用户拥有目录下创建文件)<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">3:用户调用popen() systen() exec()等脚本，只有脚本处在safe_mode_exec_dir配置指令指定的目录中才可能<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">4:加强HTTP认证，认证脚本拥有者的UID的划入认证领域范围内，此外启用安全模式下，不会设置PHP_AUTH<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">5:mysql服务器所用的用户名必须与调用mysql_connect()的文件的拥有者用户名相同<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">6:受影响的函数变量以及配置命令达到40个<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">5.问题： 请使用PHP写出冒泡排序算法的代码。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：//冒泡排序<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">function maopao($arr) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$count = count($arr);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">for($i=0; $i&lt;$count-1; ++$i) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">for($j=0; $j&lt;$count-$i-1; ++$j) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">if($arr[$j] &gt; $arr[$j+1]) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$temp = $arr[$j];<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$arr[$j] = $arr[$j+1];<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$arr[$j+1] = $temp;<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">return $arr;<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">6.问题： 请使用PHP写出顺序排序算法的代码。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：//顺序排序<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">function shunxu($arr) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$count = count($arr);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">for($i=0; $i&lt;$count-1; ++$i) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$p = $i;<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">for($j=$i+1; $j&lt;$count; ++$j) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$p = $arr[$p] &gt; $arr[$j] ? $j : $p;<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">if($p != $i) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$tvalue = $arr[$i];<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$arr[$i] = $arr[$p];<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$arr[$p] = $tvalue;<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">return $arr;<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">7.问题：写个函数用来对二维数组排序。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">function array_sort_by_any_row($array_name, $row_id, $order_type){<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$array_temp=array();<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">foreach($array_name as $key=&gt;$value){<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$array_temp[$key]=$value[$row_id];<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">if($order_type===”ASC”){ //顺序<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">asort($array_temp);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">} else {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">arsort($array_temp);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$result_array=array();<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">foreach($array_temp as $key=&gt;$value){<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$result_array[$key]=$array_name[$key];<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">return $result_array;<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$arr = array(<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">array(‘num’=&gt;5, ‘value’=&gt;6),<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">array(‘num’=&gt;2, ‘value’=&gt;39),<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">array(‘num’=&gt;36, ‘value’=&gt;29)<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$sortarr = array_sort_by_any_row($arr, ‘num’, ‘DESC’);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">print_r($sortarr);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">8.问题： 写5个不同的函数，来截取一个全路径的文件的扩展名，允许封装php库中已有的函数。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：$path = str_replace(‘\\\\’, ‘/’,__FILE__);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">echo $path.’&lt;br /&gt;’;<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">function extname1($path) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">return strrchr($path, ‘.’);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">function extname2($path) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$position = strrpos($path, ‘.’);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">return substr($path, $position);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">function extname3($path) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$arr = explode(‘.’, $path);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">return $arr[count($arr) &ndash; 1];<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">function extname4($path) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">preg_match_all(‘/[\\w\\/\\:\\-]+\\.([\\w]+)$/’, $path, $out);<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">return $out[1][0];<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">function extname5($path) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">return preg_replace(‘/^[^\\.]+\\.([\\w]+)$/’, ‘${1}’, basename($path));<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">print_r(extname5($path));<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">9.问题：一群猴子排成一圈，按1，2，…，n依次编号。然后从第1只开始数，数到第m只,把它踢出圈，从它后面再开始数，再数到第m只，在把它踢出去…，如此不停的进行下去，直到最后只剩下一只猴子为止，那只猴子就叫做大王。要求编程模拟此过程，输入m、n, 输出最后那个大王的编号。<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">答：yuesefu环问题，PPC有很多针对这个问题的处理，我的就不上啦<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">function yuesefu($n,$m) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$r=0;<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">for($i=2; $i&lt;=$n; $i++) {<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">$r=($r+$m)%$i;<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">return $r+1;<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">}<br style=\"white-space: normal; margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-family: 宋体, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 28px; text-indent: 28px; background-color: rgb(255, 255, 255);\">print_r(yuesefu(3,3));</span></p>\r\n内部定义Style样式\r\n内联样式\r\n5.问题：PHP支持多继承吗？\r\n答：不支持。PHP类只能继承一个父类，并用关键字“extends”标识。\r\n6.问题：请问PHP中echo和print有什么区别？\r\n这两个看起来很相似，因为它们都是将一些值打印在屏幕上。但是echo和print的本质区别在于：echo用来输出字符串，显示多个值的时候可以用逗号隔开。只支持基本类型，print不仅可以打印字符串值，而且可以打印函数的返回值。\r\n7.问题：PHP中的PEAR是什么？\r\n答：PEAR也就是为PHP扩展与应用库（PHP Extension and Application Repository），它是一个PHP扩展及应用的一个代码仓库。\r\n8.问题：PHP中的错误类型有哪些？\r\n答：PHP中遇到的错误类型大致有3类。\r\n提示：这都是一些非常正常的信息，而非重大的错误，有些甚至不会展示给用户。比如访问不存在的变量。\r\n警告：这是有点严重的错误，将会把警告信息展示给用户，但不会影响代码的输出，比如包含一些不存在的文件。\r\n错误：这是真正的严重错误，比如访问不存在的PHP类。\r\n9.问题：如何在PHP中定义常量？\r\n答：PHP中使用Define () 来定义常量。\r\ndefine (“Newconstant”, 30);\r\n10.问题：如何不使用submit按钮来提交表单？\r\n答：如果我们不想用submit按钮来提交表单，我们也可以用超链接来提交，我们可以这样写代码：<a href=”javascript: document.myform.submit();”>Submit Me</a>\r\n11.问题：error_reporting(2047)什么作用？\r\n答：PHP 显示所有错误 E_ALL\r\n中级题目\r\n1.问题：请使用正则写一个函数验证电子邮件的格式是否正确？\r\n答：preg_match(‘/^[\\w\\-\\.]+@[\\w\\-]+(\\.\\w+)+$/’,$email);\r\n2.问题：如何用PHP和MySQL上传视频？\r\n答：我们可以在数据库中存放视频的地址，而不需要将真正的视频数据存在数据库中。可以将视频数据存放在服务器的指定文件夹下，上传的默认大小是2MB，但是我们也可以在php.ini文件中修改max_file size选项来改变。\r\n3.问题：请问GET和POST方法有什么区别？\r\n答：我们再网页上填写的表单信息都可以通过这两个方法将数据传递到服务器上，当我们使用GET方法是，所有的信息都会出现在URL地址中，并且使用GET方法最多只能传递1024个字符，所以如果在传输量小或者安全性不那么重要的情况下可以使用GET方法。说到POST方法，最多可以传输2MB字节的数据，而且可以根据需要调节。\r\n4.问题：打开php.ini中的Safe_mode，会影响哪些函数？列举6个！\r\n答：1用户输入输出函数(fopen() file() require(),只能用于调用这些函数有相同脚本的拥有者)\r\n2:创建新文件(限制用户只在该用户拥有目录下创建文件)\r\n3:用户调用popen() systen() exec()等脚本，只有脚本处在safe_mode_exec_dir配置指令指定的目录中才可能\r\n4:加强HTTP认证，认证脚本拥有者的UID的划入认证领域范围内，此外启用安全模式下，不会设置PHP_AUTH\r\n5:mysql服务器所用的用户名必须与调用mysql_connect()的文件的拥有者用户名相同\r\n6:受影响的函数变量以及配置命令达到40个\r\n5.问题： 请使用PHP写出冒泡排序算法的代码。\r\n答：//冒泡排序\r\nfunction maopao($arr) {\r\n$count = count($arr);\r\nfor($i=0; $i<$count-1; ++$i) {\r\nfor($j=0; $j<$count-$i-1; ++$j) {\r\nif($arr[$j] > $arr[$j+1]) {\r\n$temp = $arr[$j];\r\n$arr[$j] = $arr[$j+1];\r\n$arr[$j+1] = $temp;\r\n}\r\n}\r\n}\r\nreturn $arr;\r\n}\r\n6.问题： 请使用PHP写出顺序排序算法的代码。\r\n答：//顺序排序\r\nfunction shunxu($arr) {\r\n$count = count($arr);\r\nfor($i=0; $i<$count-1; ++$i) {\r\n$p = $i;\r\nfor($j=$i+1; $j<$count; ++$j) {\r\n$p = $arr[$p] > $arr[$j] ? $j : $p;\r\n}\r\nif($p != $i) {\r\n$tvalue = $arr[$i];\r\n$arr[$i] = $arr[$p];\r\n$arr[$p] = $tvalue;\r\n}\r\n}\r\nreturn $arr;\r\n}\r\n7.问题：写个函数用来对二维数组排序。\r\n答：\r\nfunction array_sort_by_any_row($array_name, $row_id, $order_type){\r\n$array_temp=array();\r\nforeach($array_name as $key=>$value){\r\n$array_temp[$key]=$value[$row_id];\r\n}\r\nif($order_type===”ASC”){ //顺序\r\nasort($array_temp);\r\n} else {\r\narsort($array_temp);\r\n}\r\n$result_array=array();\r\nforeach($array_temp as $key=>$value){\r\n$result_array[$key]=$array_name[$key];\r\n}\r\nreturn $result_array;\r\n}\r\n$arr = array(\r\narray(‘num’=>5, ‘value’=>6),\r\narray(‘num’=>2, ‘value’=>39),\r\narray(‘num’=>36, ‘value’=>29)\r\n);\r\n$sortarr = array_sort_by_any_row($arr, ‘num’, ‘DESC’);\r\nprint_r($sortarr);\r\n8.问题： 写5个不同的函数，来截取一个全路径的文件的扩展名，允许封装php库中已有的函数。\r\n答：$path = str_replace(‘\\\\’, ‘/’,__FILE__);\r\necho $path.’<br />’;\r\nfunction extname1($path) {\r\nreturn strrchr($path, ‘.’);\r\n}\r\nfunction extname2($path) {\r\n$position = strrpos($path, ‘.’);\r\nreturn substr($path, $position);\r\n}\r\nfunction extname3($path) {\r\n$arr = explode(‘.’, $path);\r\nreturn $arr[count($arr) – 1];\r\n}\r\nfunction extname4($path) {\r\npreg_match_all(‘/[\\w\\/\\:\\-]+\\.([\\w]+)$/’, $path, $out);\r\nreturn $out[1][0];\r\n}\r\nfunction extname5($path) {\r\nreturn preg_replace(‘/^[^\\.]+\\.([\\w]+)$/’, ‘${1}’, basename($path));\r\n}\r\nprint_r(extname5($path));\r\n9.问题：一群猴子排成一圈，按1，2，…，n依次编号。然后从第1只开始数，数到第m只,把它踢出圈，从它后面再开始数，再数到第m只，在把它踢出去…，如此不停的进行下去，直到最后只剩下一只猴子为止，那只猴子就叫做大王。要求编程模拟此过程，输入m、n, 输出最后那个大王的编号。\r\n答：yuesefu环问题，PPC有很多针对这个问题的处理，我的就不上啦\r\nfunction yuesefu($n,$m) {\r\n$r=0;\r\nfor($i=2; $i<=$n; $i++) {\r\n$r=($r+$m)%$i;\r\n}\r\nreturn $r+1;\r\n}\r\nprint_r(yuesefu(3,3));值。\r\nprint是一个函数，返回int类型的值[只能打印int string]。\r\nprint_r()是一个函数，返回bool类型值，按结构输出变量的值，打印关于变量的易于理解的信息[数组、对象等]\r\n3.问题：什么是MVC？\r\n答：MVC由Model（模型）, View（视图）和Controller（控制器）组成，PHP MVC可以更高效地管理好3个不同层的PHP代码。\r\nModel：数据信息存取层。\r\nView：view层负责将应用的数据以特定的方式展现在界面上。\r\nController：通常控制器负责从视图读取数据，控制用户输入，并向模型发送数据。\r\n4.问题：在页面中引用CSS有几种方式？\r\n答：在页面中使用CSS有3中方式：\r\n引用外部CSS文件\r\n内部定义Style样式\r\n内联样式\r\n5.问题：PHP支持多继承吗？\r\n答：不支持。PHP类只能继承一个父类，并用关键字“extends”标识。\r\n6.问题：请问PHP中echo和print有什么区别？\r\n这两个看起来很相似，因为它们都是将一些值打印在屏幕上。但是echo和print的本质区别在于：echo用来输出字符串，显示多个值的时候可以用逗号隔开。只支持基本类型，print不仅可以打印字符串值，而且可以打印函数的返回值。\r\n7.问题：PHP中的PEAR是什么？\r\n答：PEAR也就是为PHP扩展与应用库（PHP Extension and Application Repository），它是一个PHP扩展及应用的一个代码仓库。\r\n8.问题：PHP中的错误类型有哪些？\r\n答：PHP中遇到的错误类型大致有3类。\r\n提示：这都是一些非常正常的信息，而非重大的错误，有些甚至不会展示给用户。比如访问不存在的变量。\r\n警告：这是有点严重的错误，将会把警告信息展示给用户，但不会影响代码的输出，比如包含一些不存在的文件。\r\n错误：这是真正的严重错误，比如访问不存在的PHP类。\r\n9.问题：如何在PHP中定义常量？\r\n答：PHP中使用Define () 来定义常量。\r\ndefine (“Newconstant”, 30);\r\n10.问题：如何不使用submit按钮来提交表单？\r\n答：如果我们不想用submit按钮来提交表单，我们也可以用超链接来提交，我们可以这样写代码：<a href=”javascript: document.myform.submit();”>Submit Me</a>\r\n11.问题：error_reporting(2047)什么作用？\r\n答：PHP 显示所有错误 E_ALL\r\n高级题目\r\n1.问题：请使用正则写一个函数验证电子邮件的格式是否正确？\r\n答：preg_match(‘/^[\\w\\-\\.]+@[\\w\\-]+(\\.\\w+)+$/’,$email);\r\n2.问题：如何用PHP和MySQL上传视频？\r\n答：我们可以在数据库中存放视频的地址，而不需要将真正的视频数据存在数据库中。可以将视频数据存放在服务器的指定文件夹下，上传的默认大小是2MB，但是我们也可以在php.ini文件中修改max_file size选项来改变。\r\n3.问题：请问GET和POST方法有什么区别？\r\n答：我们再网页上填写的表单信息都可以通过这两个方法将数据传递到服务器上，当我们使用GET方法是，所有的信息都会出现在URL地址中，并且使用GET方法最多只能传递1024个字符，所以如果在传输量小或者安全性不那么重要的情况下可以使用GET方法。说到POST方法，最多可以传输2MB字节的数据，而且可以根据需要调节。\r\n4.问题：打开php.ini中的Safe_mode，会影响哪些函数？列举6个！\r\n答：1用户输入输出函数(fopen() file() require(),只能用于调用这些函数有相同脚本的拥有者)\r\n2:创建新文件(限制用户只在该用户拥有目录下创建文件)\r\n3:用户调用popen() systen() exec()等脚本，只有脚本处在safe_mode_exec_dir配置指令指定的目录中才可能\r\n4:加强HTTP认证，认证脚本拥有者的UID的划入认证领域范围内，此外启用安全模式下，不会设置PHP_AUTH\r\n5:mysql服务器所用的用户名必须与调用mysql_connect()的文件的拥有者用户名相同\r\n6:受影响的函数变量以及配置命令达到40个\r\n5.问题： 请使用PHP写出冒泡排序算法的代码。\r\n答：//冒泡排序\r\nfunction maopao($arr) {\r\n$count = count($arr);\r\nfor($i=0; $i<$count-1; ++$i) {\r\nfor($j=0; $j<$count-$i-1; ++$j) {\r\nif($arr[$j] > $arr[$j+1]) {\r\n$temp = $arr[$j];\r\n$arr[$j] = $arr[$j+1];\r\n$arr[$j+1] = $temp;\r\n}\r\n}\r\n}\r\nreturn $arr;\r\n}\r\n6.问题： 请使用PHP写出顺序排序算法的代码。\r\n答：//顺序排序\r\nfunction shunxu($arr) {\r\n$count = count($arr);\r\nfor($i=0; $i<$count-1; ++$i) {\r\n$p = $i;\r\nfor($j=$i+1; $j<$count; ++$j) {\r\n$p = $arr[$p] > $arr[$j] ? $j : $p;\r\n}\r\nif($p != $i) {\r\n$tvalue = $arr[$i];\r\n$arr[$i] = $arr[$p];\r\n$arr[$p] = $tvalue;\r\n}\r\n}\r\nreturn $arr;\r\n}\r\n7.问题：写个函数用来对二维数组排序。\r\n答：\r\nfunction array_sort_by_any_row($array_name, $row_id, $order_type){\r\n$array_temp=array();\r\nforeach($array_name as $key=>$value){\r\n$array_temp[$key]=$value[$row_id];\r\n}\r\nif($order_type===”ASC”){ //顺序\r\nasort($array_temp);\r\n} else {\r\narsort($array_temp);\r\n}\r\n$result_array=array();\r\nforeach($array_temp as $key=>$value){\r\n$result_array[$key]=$array_name[$key];\r\n}\r\nreturn $result_array;\r\n}\r\n$arr = array(\r\narray(‘num’=>5, ‘value’=>6),\r\narray(‘num’=>2, ‘value’=>39),\r\narray(‘num’=>36, ‘value’=>29)\r\n);\r\n$sortarr = array_sort_by_any_row($arr, ‘num’, ‘DESC’);\r\nprint_r($sortarr);\r\n8.问题： 写5个不同的函数，来截取一个全路径的文件的扩展名，允许封装php库中已有的函数。\r\n答：$path = str_replace(‘\\\\’, ‘/’,__FILE__);\r\necho $path.’<br />’;\r\nfunction extname1($path) {\r\nreturn strrchr($path, ‘.’);\r\n}\r\nfunction extname2($path) {\r\n$position = strrpos($path, ‘.’);\r\nreturn substr($path, $position);\r\n}\r\nfunction extname3($path) {\r\n$arr = explode(‘.’, $path);\r\nreturn $arr[count($arr) – 1];\r\n}\r\nfunction extname4($path) {\r\npreg_match_all(‘/[\\w\\/\\:\\-]+\\.([\\w]+)$/’, $path, $out);\r\nreturn $out[1][0];\r\n}\r\nfunction extname5($path) {\r\nreturn preg_replace(‘/^[^\\.]+\\.([\\w]+)$/’, ‘${1}’, basename($path));\r\n}\r\nprint_r(extname5($path));\r\n9.问题：一群猴子排成一圈，按1，2，…，n依次编号。然后从第1只开始数，数到第m只,把它踢出圈，从它后面再开始数，再数到第m只，在把它踢出去…，如此不停的进行下去，直到最后只剩下一只猴子为止，那只猴子就叫做大王。要求编程模拟此过程，输入m、n, 输出最后那个大王的编号。\r\n答：yuesefu环问题，PPC有很多针对这个问题的处理，我的就不上啦\r\nfunction yuesefu($n,$m) {\r\n$r=0;\r\nfor($i=2; $i<=$n; $i++) {\r\n$r=($r+$m)%$i;\r\n}\r\nreturn $r+1;\r\n}\r\nprint_r(yuesefu(3,3));', 'SooneBaby', '/about', '1', '0', '0', '1', '0', '2017-03-13 19:25:30');
INSERT INTO `article` VALUES ('9', '8', '分析百度蜘蛛IP，做最牛逼的SEOer', '/ui/system/images/585952c4de195.jpg', '一个真正的懂得做SEO的站长，他一定是个懂得分析网站日志的人。那么网站日志密密麻麻的全是代码，我们该分析什么呢？我们分析的就是百度蜘蛛有没有来过我们的网站，它是什么时', '<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><p style=\"margin-top: 0px;padding: 0px\">一个真正的懂得做SEO的站长，他一定是个懂得分析网站日志的人。那么网站日志密密麻麻的全是代码，我们该分析什么呢？我们分析的就是百度蜘蛛有没有来过我们的网站，它是什么时候来我们网站的，它来我们网站是做什么的？而要了解这些，我们就必须了解百度蜘蛛的IP。</p><p style=\"margin-top: 0px;padding: 0px\"><span style=\";padding: 0px;line-height: 1.5\">百度蜘蛛大概分为三类：</span></p><p style=\"margin-top: 0px;padding: 0px\"><span style=\";padding: 0px;line-height: 1.5\">第一类、220.181.108.*：这是我们最常见的IP，</span><span style=\";padding: 0px;line-height: 1.5\">这段</span><span style=\";padding: 0px;line-height: 1.5\">IP</span><span style=\";padding: 0px;line-height: 1.5\">注意负责抓取网站的更新，和增加网站的权重的作用。其中，220.181.108.86</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">它抓取的网页权重是最大的，如果说这个蜘蛛在你的网页上返回正常的话，说明你的网站问题不大，如何抓取的时候返回数据库有其他的数值的话，说明网站问题就很大了，一定要注意。</span></p><p style=\"margin-top: 0px;padding: 0px\"><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">快照蜘蛛：<span style=\";padding: 0px\">220.181.108.75，</span>顾名思义就是说专门给你网页拍照的蜘蛛。</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">IP</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">结尾的</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">75</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">的就是快照蜘蛛，它来到你网站越多越好。</span></p><p style=\"margin-top: 0px;padding: 0px\"><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">高权重蜘蛛：<span style=\";padding: 0px\">220.181.108.89，</span>IP</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">结尾的</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">89</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">的蜘蛛，我们称为高权重的蜘蛛，但是它的权重没有</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">IP86</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">结尾的高，但是权重也是非常不错的。</span></p><p style=\"margin-top: 0px;padding: 0px\"><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">接下来就是</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">:94,97,80,83,</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">这些蜘蛛都是高权重的蜘蛛，它们的权重是依此递减的。剩下来的就是普通的蜘蛛了，它们会抓取新的网站的内容，返回数据库的值有</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">200</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">的话，一般情况下，会在</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">24</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">到</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">40</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">小时至内会被放出的。如果现实</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">304</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">的话，就说明此网站有待考察。</span></p><p style=\"margin-top: 0px;padding: 0px\"><span style=\";padding: 0px;line-height: 1.5\">第二类、123.125.71.*：</span><span style=\";padding: 0px;line-height: 1.5\">这段</span><span style=\";padding: 0px;line-height: 1.5\">IP</span><span style=\";padding: 0px;line-height: 1.5\">注意负责一些权重比较低的网站文章抓取情况，和文章原创度的情况，一般会在</span><span style=\";padding: 0px;line-height: 1.5\">48</span><span style=\";padding: 0px;line-height: 1.5\">小时内抓取你的网页，但是也会在</span><span style=\";padding: 0px;line-height: 1.5\">48</span><span style=\";padding: 0px;line-height: 1.5\">小时内删除你的资料。这也是许多新手站长奇怪的是为什么我的网站收录不到很久就没有排名的原因。一定要请大家注意，这个</span><span style=\";padding: 0px;line-height: 1.5\">IP</span><span style=\";padding: 0px;line-height: 1.5\">出现在网站日记的话一定要小心</span><span style=\";padding: 0px;line-height: 1.5\">!</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">这段</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">IP</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">有两个功能</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">!</span></p><p style=\"margin-top: 0px;padding: 0px\"><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">一，检查更新情况，一般这种情况的蜘蛛权重都比较低，它们一般只会检查网站的首页的更新情况。</span></p><p style=\"margin-top: 0px;padding: 0px\"><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">二，文章的原创度的多少，此原理来自半发现象，怎么说呢，一般情况下被一个低权重的百度蜘蛛抓取过的网页的，它会再在抓取网页，如果发现相同的地方，会在</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">48</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">小时内删除的，并且还会降权的。这便就是为什么网站重复的东西被称为垃圾的原因！</span></p><p style=\"margin-top: 0px;padding: 0px\"><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">第三类、123.125.68.*：<span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">最后这段IP是大家不愿意看到的一个</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">IP</span>，</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">这段</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">IP</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">我们一般叫做黑武士，他如果来到你的网站的话，你的网站基本就会被降权或者被</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">K</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">掉，情况好的只会抓取你一次，如果网站大量出现这样的百度蜘蛛的话，你的网站就准备被</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">K</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">掉吧，也说明了百度发现你做了很多不好的事情。这个</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">IP</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">事许多老站长都不愿意看到的</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">IP</span><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">。</span></p><p style=\"margin-top: 0px;padding: 0px\"><span style=\";padding: 0px;line-height: 1.5;text-indent: 28px\">通过这篇文章的分析，相信大家都认识到并不是所以的百度蜘蛛光临你的网站都是好事。学会分析蜘蛛IP，做最牛逼的SEOer。</span></p></ul>', 'SooneBaby', '/about', '1', '1', '0', '1', '0', '2017-03-13 19:25:30');
INSERT INTO `article` VALUES ('10', '3', '20个面试题让你真正了解jQuery', '/ui/system/images/585953dcc9be5.png', '函数是 jQuery() 函数的别称， $() 函数用于将任何对象包裹成 jQuery 对象，接着你就被允许调用定义在 jQuery 对象上的多个不同方法', '<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">1. jQuery&nbsp;</strong></span><strong style=\";padding: 0px\">库中的</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;$()&nbsp;</strong></span><strong style=\";padding: 0px\">是什么？</strong>（答案如下）</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">$()&nbsp;</span>函数是<span style=\";padding: 0px\">&nbsp;jQuery()&nbsp;</span>函数的别称，&nbsp;<span style=\";padding: 0px\">$()&nbsp;</span>函数用于将任何对象包裹成<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>对象，接着你就被允许调用定义在<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>对象上的多个不同方法。你甚至可以将一个选择器字符串传入<span style=\";padding: 0px\">&nbsp;$()&nbsp;</span>函数，它会返回一个包含所有匹配的<span style=\";padding: 0px\">&nbsp;DOM&nbsp;</span>元素数组的<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>对象。这个问题我已经见过好几次被提及，尽管它非常基础，它经常被用来区分一个开发人员是否了解<span style=\";padding: 0px\">&nbsp;jQuery</span>。<span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">&nbsp;</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">2.&nbsp;</strong></span><strong style=\";padding: 0px\">网页上有</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;5&nbsp;</strong></span><strong style=\";padding: 0px\">个</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;&lt;div&gt;&nbsp;</strong></span><strong style=\";padding: 0px\">元素，如何使用</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;jQuery</strong></span><strong style=\";padding: 0px\">来选择它们？</strong></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">另一个重要的<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>问题是基于选择器的。<span style=\";padding: 0px\">jQuery&nbsp;</span>支持不同类型的选择器，例如<span style=\";padding: 0px\">&nbsp;ID&nbsp;</span>选择器、<span style=\";padding: 0px\">class&nbsp;</span>选择器、标签选择器。鉴于这个问题没提到<span style=\";padding: 0px\">&nbsp;ID&nbsp;</span>和<span style=\";padding: 0px\">&nbsp;class</span>，你可以用标签选择器来选择所有的<span style=\";padding: 0px\">&nbsp;div&nbsp;</span>元素。<span style=\";padding: 0px\">jQuery&nbsp;</span>代码：<span style=\";padding: 0px\">$(</span>“<span style=\";padding: 0px\">div</span>”<span style=\";padding: 0px\">)</span>，这样会返回一个包含所有<span style=\";padding: 0px\">&nbsp;5&nbsp;</span>个<span style=\";padding: 0px\">&nbsp;div&nbsp;</span>标签的<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>对象。更详细的解答参见上面链接的文章。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">3. jQuery&nbsp;</strong></span><strong style=\";padding: 0px\">里的</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;ID&nbsp;</strong></span><strong style=\";padding: 0px\">选择器和</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;class&nbsp;</strong></span><strong style=\";padding: 0px\">选择器有何不同？</strong></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">如果你用过<span style=\";padding: 0px\">&nbsp;CSS</span>，你也许就知道<span style=\";padding: 0px\">&nbsp;ID&nbsp;</span>选择器和<span style=\";padding: 0px\">&nbsp;class&nbsp;</span>选择器之间的差异，<span style=\";padding: 0px\">jQuery&nbsp;</span>也同样如此。<span style=\";padding: 0px\">ID&nbsp;</span>选择器使用<span style=\";padding: 0px\">&nbsp;ID&nbsp;</span>来选择元素，比如<span style=\";padding: 0px\">&nbsp;#element1</span>，而<span style=\";padding: 0px\">&nbsp;class&nbsp;</span>选择器使用<span style=\";padding: 0px\">&nbsp;CSS class&nbsp;</span>来选择元素。当你只需要选择一个元素时，使用<span style=\";padding: 0px\">&nbsp;ID&nbsp;</span>选择器，而如果你想要选择一组具有相同<span style=\";padding: 0px\">&nbsp;CSS class&nbsp;</span>的元素，就要用<span style=\";padding: 0px\">&nbsp;class&nbsp;</span>选择器。在面试过程中，你有很大几率会被要求使用<span style=\";padding: 0px\">&nbsp;ID&nbsp;</span>选择器和<span style=\";padding: 0px\">&nbsp;class&nbsp;</span>选择器来写代码。下面的<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>代码使用了<span style=\";padding: 0px\">&nbsp;ID&nbsp;</span>选择器和<span style=\";padding: 0px\">class&nbsp;</span>选择器：</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">$(\'#LoginTextBox\')&nbsp; // Returns element wrapped as jQuery object with id=\'LoginTextBox\'</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">$(\'.active\') // Returns all elements with CSS class active.</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">正如你所见，从语法角度来说，<span style=\";padding: 0px\">ID&nbsp;</span>选择器和<span style=\";padding: 0px\">&nbsp;class&nbsp;</span>选择器的另一个不同之处是，前者用字符”<span style=\";padding: 0px\">#</span>”而后者用字符”<span style=\";padding: 0px\">.</span>”。更详细的分析和讨论参见上面的答案链接。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">4.&nbsp;</strong></span><strong style=\";padding: 0px\">如何在点击一个按钮时使用</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;jQuery&nbsp;</strong></span><strong style=\";padding: 0px\">隐藏一个图片？</strong></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">这是一个事件处理问题。<span style=\";padding: 0px\">jQuery</span>为按钮点击之类的事件提供了很好的支持。你可以通过以下代码去隐藏一个通过<span style=\";padding: 0px\">ID</span>或<span style=\";padding: 0px\">class</span>定位到的图片。你需要知道如何为按钮设置事件并执行<span style=\";padding: 0px\">hide()&nbsp;</span>方法，代码如下所示：</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">$(\'#ButtonToClick\').click(function(){</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">$(\'#ImageToHide\').hide();</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">});</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">我喜欢这个问题，因为很贴近实际使用，代码也不复杂。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">5.&nbsp; $(document).ready()&nbsp;</strong></span><strong style=\";padding: 0px\">是个什么函数？为什么要用它？</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">(answer)</strong></span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">这个问题很重要，并且常常被问到。<span style=\";padding: 0px\">&nbsp;ready()&nbsp;</span>函数用于在文档进入<span style=\";padding: 0px\">ready</span>状态时执行代码。当<span style=\";padding: 0px\">DOM&nbsp;</span>完全加载（例如<span style=\";padding: 0px\">HTML</span>被完全解析<span style=\";padding: 0px\">DOM</span>树构建完成时），<span style=\";padding: 0px\">jQuery</span>允许你执行代码。使用<span style=\";padding: 0px\">$(document).ready()</span>的最大好处在于它适用于所有浏览器，<span style=\";padding: 0px\">jQuery</span>帮你解决了跨浏览器的难题。需要进一步了解的用户可以点击<span style=\";padding: 0px\">&nbsp;answer</span>链接查看详细讨论。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">6. JavaScript window.onload&nbsp;</strong></span><strong style=\";padding: 0px\">事件和</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;jQuery ready&nbsp;</strong></span><strong style=\";padding: 0px\">函数有何不同？</strong></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">这个问答是紧接着上一个的。<span style=\";padding: 0px\">JavaScript window.onload&nbsp;</span>事件和<span style=\";padding: 0px\">&nbsp;jQuery ready&nbsp;</span>函数之间的主要区别是，前者除了要等待<span style=\";padding: 0px\">&nbsp;DOM&nbsp;</span>被创建还要等到包括大型图片、音频、视频在内的所有外部资源都完全加载。如果加载图片和媒体内容花费了大量时间，用户就会感受到定义在<span style=\";padding: 0px\">&nbsp;window.onload&nbsp;</span>事件上的代码在执行时有明显的延迟。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">另一方面，<span style=\";padding: 0px\">jQuery ready()&nbsp;</span>函数只需对<span style=\";padding: 0px\">&nbsp;DOM&nbsp;</span>树的等待，而无需对图像或外部资源加载的等待，从而执行起来更快。使用<span style=\";padding: 0px\">&nbsp;jQuery $(document).ready()&nbsp;</span>的另一个优势是你可以在网页里多次使用它，浏览器会按它们在<span style=\";padding: 0px\">&nbsp;HTML</span>页面里出现的顺序执行它们，相反对于<span style=\";padding: 0px\">&nbsp;onload&nbsp;</span>技术而言，只能在单一函数里使用。鉴于这个好处，用<span style=\";padding: 0px\">&nbsp;jQuery ready()&nbsp;</span>函数比用<span style=\";padding: 0px\">&nbsp;JavaScript window.onload&nbsp;</span>事件要更好些。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">7.&nbsp;</strong></span><strong style=\";padding: 0px\">如何找到所有</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;HTML select&nbsp;</strong></span><strong style=\";padding: 0px\">标签的选中项？</strong></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">这是面试里比较棘手的<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>问题之一。这是个基础的问题，但是别期望每个<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>初学者都知道它。你能用下面的<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>选择器获取所有具备<span style=\";padding: 0px\">&nbsp;multiple=true&nbsp;</span>的<span style=\";padding: 0px\">&nbsp;&lt;select &gt;&nbsp;</span>标签的选中项：</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">$(\'[name=NameOfSelectedTag] :selected\')</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">这段代码结合使用了属性选择器和<span style=\";padding: 0px\">&nbsp;:selected&nbsp;</span>选择器，结果只返回被选中的选项。你可按需修改它，比如用<span style=\";padding: 0px\">id&nbsp;</span>属性而不是<span style=\";padding: 0px\">&nbsp;name&nbsp;</span>属性来获取<span style=\";padding: 0px\">&nbsp;&lt;select&gt;&nbsp;</span>标签。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">8. jQuery&nbsp;</strong></span><strong style=\";padding: 0px\">里的</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;each()&nbsp;</strong></span><strong style=\";padding: 0px\">是什么函数？你是如何使用它的？</strong></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">each()&nbsp;</span>函数就像是<span style=\";padding: 0px\">&nbsp;Java&nbsp;</span>里的一个<span style=\";padding: 0px\">&nbsp;Iterator</span>，它允许你遍历一个元素集合。你可以传一个函数给<span style=\";padding: 0px\">&nbsp;each()&nbsp;</span>方法，被调用的<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>对象会在其每个元素上执行传入的函数。有时这个问题会紧接着上面一个问题，举个例子，如何在<span style=\";padding: 0px\">&nbsp;alert&nbsp;</span>框里显示所有选中项。我们可以用上面的选择器代码找出所有选中项，然后我们在<span style=\";padding: 0px\">&nbsp;alert&nbsp;</span>框中用<span style=\";padding: 0px\">each()&nbsp;</span>方法来一个个打印它们，代码如下：</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">$(\'[name=NameOfSelectedTag] :selected\').each(function(selected) {</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">&nbsp;&nbsp;&nbsp; alert($(selected).text());</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">});</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">其中</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">&nbsp;text()&nbsp;</span><span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">方法返回选项的文本。</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">9.&nbsp;</strong></span><strong style=\";padding: 0px\">你是如何将一个</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;HTML&nbsp;</strong></span><strong style=\";padding: 0px\">元素添加到</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;DOM&nbsp;</strong></span><strong style=\";padding: 0px\">树中的？</strong></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">你可以用<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>方法<span style=\";padding: 0px\">&nbsp;appendTo()&nbsp;</span>将一个<span style=\";padding: 0px\">&nbsp;HTML&nbsp;</span>元素添加到<span style=\";padding: 0px\">&nbsp;DOM&nbsp;</span>树中。这是<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>提供的众多操控<span style=\";padding: 0px\">&nbsp;DOM</span>的方法中的一个。你可以通过&nbsp;<span style=\";padding: 0px\">appendTo()&nbsp;</span>方法在指定的<span style=\";padding: 0px\">&nbsp;DOM&nbsp;</span>元素末尾添加一个现存的元素或者一个新的<span style=\";padding: 0px\">&nbsp;HTML</span>元素。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">10.&nbsp;</strong></span><strong style=\";padding: 0px\">你能用</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;jQuery&nbsp;</strong></span><strong style=\";padding: 0px\">代码选择所有在段落内部的超链接吗？</strong></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">这是另一个关于选择器的<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>面试题。就像其他问题那样，只需一行<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>代码就能搞定。你可以使用下面这个<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>代码片段来选择所有嵌套在段落（<span style=\";padding: 0px\">&lt;p&gt;</span>标签）内部的超链接（<span style=\";padding: 0px\">&lt;a&gt;</span>标签）……</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">11. $(this)&nbsp;</strong></span><strong style=\";padding: 0px\">和</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;this&nbsp;</strong></span><strong style=\";padding: 0px\">关键字在</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;jQuery&nbsp;</strong></span><strong style=\";padding: 0px\">中有何不同？</strong></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">这对于很多<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>初学者来说是一个棘手的问题，其实是个简单的问题。<span style=\";padding: 0px\">$(this)&nbsp;</span>返回一个<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>对象，你可以对它调用多个<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>方法，比如用<span style=\";padding: 0px\">&nbsp;text()&nbsp;</span>获取文本，用<span style=\";padding: 0px\">val()&nbsp;</span>获取值等等。而<span style=\";padding: 0px\">&nbsp;this&nbsp;</span>代表当前元素，它是<span style=\";padding: 0px\">&nbsp;JavaScript&nbsp;</span>关键词中的一个，表示上下文中的当前<span style=\";padding: 0px\">&nbsp;DOM&nbsp;</span>元素。你不能对它调用<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>方法，直到它被<span style=\";padding: 0px\">&nbsp;$()</span>函数包裹，例如<span style=\";padding: 0px\">&nbsp;$(this)</span>。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">12.&nbsp;</strong></span><strong style=\";padding: 0px\">你如何使用</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">jQuery</strong></span><strong style=\";padding: 0px\">来提取一个</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">HTML&nbsp;</strong></span><strong style=\";padding: 0px\">标记的属性 例如</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">.&nbsp;</strong></span><strong style=\";padding: 0px\">链接的</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">href?</strong></span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">attr()&nbsp;</span>方法被用来提取任意一个<span style=\";padding: 0px\">HTML</span>元素的一个属性的值<span style=\";padding: 0px\">.&nbsp;</span>你首先需要利用<span style=\";padding: 0px\">jQuery</span>选择及选取到所有的链接或者一个特定的链接，然后你可以应用<span style=\";padding: 0px\">attr()</span>方法来获得他们的<span style=\";padding: 0px\">href</span>属性的值。下面的代码会找到页面中所有的链接并返回<span style=\";padding: 0px\">href</span>值：</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">$(\'a\').each(function(){</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">&nbsp;&nbsp; alert($(this).attr(\'href\'));</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">});</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">13.&nbsp;</strong></span><strong style=\";padding: 0px\">你如何使用</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">jQuery</strong></span><strong style=\";padding: 0px\">设置一个属性值</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">?</strong>&nbsp;</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">前面这个问题之后额外的一个后续问题是，<span style=\";padding: 0px\">attr()</span>方法和<span style=\";padding: 0px\">jQuery</span>中的其它方法一样，能力不止一样<span style=\";padding: 0px\">.&nbsp;</span>如果你在调用<span style=\";padding: 0px\">attr()</span>的同时带上一个值 例如<span style=\";padding: 0px\">. attr(name, value),&nbsp;</span>这里<span style=\";padding: 0px\">name</span>是属性的名称，<span style=\";padding: 0px\">value</span>是属性的新值。<span style=\";padding: 0px;text-indent: 28px;line-height: 1.5\">&nbsp;</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">14. jQuery</strong></span><strong style=\";padding: 0px\">中</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;detach()&nbsp;</strong></span><strong style=\";padding: 0px\">和</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;remove()&nbsp;</strong></span><strong style=\";padding: 0px\">方法的区别是什么</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">?</strong></span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">尽管<span style=\";padding: 0px\">&nbsp;detach()&nbsp;</span>和<span style=\";padding: 0px\">&nbsp;remove()&nbsp;</span>方法都被用来移除一个<span style=\";padding: 0px\">DOM</span>元素<span style=\";padding: 0px\">,&nbsp;</span>两者之间的主要不同在于<span style=\";padding: 0px\">&nbsp;detach()&nbsp;</span>会保持对过去被解除元素的跟踪<span style=\";padding: 0px\">,&nbsp;</span>因此它可以被取消解除<span style=\";padding: 0px\">,&nbsp;</span>而<span style=\";padding: 0px\">&nbsp;remove()&nbsp;</span>方法则会保持过去被移除对象的引用<span style=\";padding: 0px\">.&nbsp;</span>你也还可以看看 用来向<span style=\";padding: 0px\">DOM</span>中添加元素的<span style=\";padding: 0px\">&nbsp;appendTo()&nbsp;</span>方法<span style=\";padding: 0px\">.</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">15.&nbsp;</strong></span><strong style=\";padding: 0px\">你如何利用</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">jQuery</strong></span><strong style=\";padding: 0px\">来向一个元素中添加和移除</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">CSS</strong></span><strong style=\";padding: 0px\">类</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">?</strong>&nbsp;</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">通过利用<span style=\";padding: 0px\">&nbsp;addClass()&nbsp;</span>和<span style=\";padding: 0px\">&nbsp;removeClass()&nbsp;</span>这两个<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>方法。动态的改变元素的<span style=\";padding: 0px\">class</span>属性可以很简单例如<span style=\";padding: 0px\">.&nbsp;</span>使用类“<span style=\";padding: 0px\">.active</span>”来标记它们的未激活和激活状态，等等<span style=\";padding: 0px\">.</span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">16.&nbsp;</strong></span><strong style=\";padding: 0px\">使用</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;CDN&nbsp;</strong></span><strong style=\";padding: 0px\">加载</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;jQuery&nbsp;</strong></span><strong style=\";padding: 0px\">库的主要优势是什么</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;?&nbsp;</strong></span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">这是一个稍微高级点儿的<span style=\";padding: 0px\">jQuery</span>问题。好吧，除了报错节省服务器带宽以及更快的下载速度这许多的好处之外<span style=\";padding: 0px\">,&nbsp;</span>最重要的是，如果浏览器已经从同一个<span style=\";padding: 0px\">CDN</span>下载类相同的<span style=\";padding: 0px\">&nbsp;jQuery&nbsp;</span>版本<span style=\";padding: 0px\">,&nbsp;</span>那么它就不会再去下载它一次<span style=\";padding: 0px\">.&nbsp;</span>因此今时今日，许多公共的网站都将<span style=\";padding: 0px\">jQuery</span>用于用户交互和动画<span style=\";padding: 0px\">,&nbsp;</span>如果浏览器已经有了下载好的<span style=\";padding: 0px\">jQuery</span>库，网站就能有非常好的展示机会。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">17.&nbsp; jQuery.get()&nbsp;</strong></span><strong style=\";padding: 0px\">和</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;jQuery.ajax()&nbsp;</strong></span><strong style=\";padding: 0px\">方法之间的区别是什么</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">?</strong></span></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\">ajax()&nbsp;</span>方法更强大，更具可配置性<span style=\";padding: 0px\">,&nbsp;</span>让你可以指定等待多久，以及如何处理错误。<span style=\";padding: 0px\">get()&nbsp;</span>方法是一个只获取一些数据的专门化方法。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">18. jQuery&nbsp;</strong></span><strong style=\";padding: 0px\">中的方法链是什么？使用方法链有什么好处？</strong></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">方法链是对一个方法返回的结果调用另一个方法，这使得代码简洁明了，同时由于只对<span style=\";padding: 0px\">&nbsp;DOM&nbsp;</span>进行了一轮查找，性能方面更加出色。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">19.&nbsp;</strong></span><strong style=\";padding: 0px\">你要是在一个</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;jQuery&nbsp;</strong></span><strong style=\";padding: 0px\">事件处理程序里返回了</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;false&nbsp;</strong></span><strong style=\";padding: 0px\">会怎样？</strong></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">这通常用于阻止事件向上冒泡。</p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\"><span style=\";padding: 0px\"><strong style=\";padding: 0px\">20.&nbsp;</strong></span><strong style=\";padding: 0px\">哪种方式更高效：</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">document.getElementbyId(</strong></span><strong style=\";padding: 0px\">“</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">myId</strong></span><strong style=\";padding: 0px\">”</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">)&nbsp;</strong></span><strong style=\";padding: 0px\">还是</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">&nbsp;$(</strong></span><strong style=\";padding: 0px\">“</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">#myId</strong></span><strong style=\";padding: 0px\">”</strong><span style=\";padding: 0px\"><strong style=\";padding: 0px\">)</strong></span><strong style=\";padding: 0px\">？</strong></p><p style=\"margin-top: 0px;padding: 0px;text-indent: 28px\">第一种，因为它直接调用了<span style=\";padding: 0px\">&nbsp;JavaScript&nbsp;</span>引擎。</p></ul>', 'SooneBaby', '/about', '1', '0', '2', '1', '0', '2017-03-13 19:25:31');
INSERT INTO `article` VALUES ('11', '4', 'PHP开发环境：如何启用MySQL功能', '/ui/system/images/58595725600ad.png', '最近觉得自己的php版本太低了，想安装个版本高的玩玩。可考虑到自己装的集成环境，就果断的把自己的php的wamp集成环境卸载掉了，重新来安装php自定义开发环境', '<ul class=\"infos list-paddingleft-2\" style=\"list-style-type: none;\"><p style=\"margin-top: 0px; padding: 0px;\">最近觉得自己的php版本太低了，想安装个版本高的玩玩。可考虑到自己装的集成环境，就果断的把自己的php的wamp集成环境卸载掉了，重新来安装php自定义开发环境。一个个来装确实费事，而且特别麻烦，但是小编觉得正是这种底层的东西才能把一门语言学的的更深。其实php自定义安装难就难在<a href=\"#\" target=\"_blank\" style=\"margin: 0px; padding: 0px; transition: all 1s ease 0s; text-decoration: none; color: rgb(51, 51, 51);\">php与Apache的整合</a>，其他的都还是挺简单的。今天小编就给大家讲讲MySQL的安装注意事项。</p><p style=\"margin-top: 0px; padding: 0px;\">小编在之前提过，整个php开发环境的搭建，最重要的两个文件是httpd.conf和php.inn。一个是控制Apache的配置文件，一个是控制php的配置环境。当你打着两个文件吃透，自定义安装php的开发环境已不在话下。那么安装MySQL跟这个两个文件有什么关系吗？答案是肯定的，要想正确启用MySQL功能，我们必须在php.ini文件中打开extension=php_mysql.dll和extension=php_mysqli.dll开关，即把这两个文件前面的分号删掉，就成功启用了MySQL了。</p></ul>', 'SooneBaby', '/about', '1', '1', '1', '1', '0', '2017-03-13 19:25:31');
INSERT INTO `article` VALUES ('12', '1', 'HTTP协议中POST与GET 本质区别详解', '/ui/system/images/585956addc8e4.jpg', '一般在浏览器中输入网址访问资源都是通过GET方式；在FORM提交中，可以通过Method指定提交方式为GET或者POST，默认为GET提交 Http定义了与服务器交互的不同方法，最基本的方', '<ul class=\"infos list-paddingleft-2\" style=\"\"><p style=\"margin-top: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\"><strong style=\"margin: 0px; padding: 0px;\">一 原理区别 &nbsp;</strong>&nbsp;&nbsp; &nbsp;</span></p><p style=\"\">&nbsp;一般在浏览器中输入网址访问资源都是通过GET方式；在FORM提交中，可以通过Method指定提交方式为GET或者POST，默认为GET提交 &nbsp; &nbsp; &nbsp;Http定义了与服务器交互的不同方法，最基本的方法有4种，分别是GET，POST，PUT，DELETE &nbsp; &nbsp; URL全称是资源描述符，我们可以这样认为：一个URL地址，它用于描述一个网络上的资源，而HTTP中的GET，POST，PUT，DELETE就对应着对这个资源的查 ，改 ，增 ，删 4个操作。到这里，大家应该有个大概的了解了，GET一般用于获取/查询 资源信息，而POST一般用于更新 资源信息(个人认为这是GET和POST的本质区别，也是协议设计者的本意，其它区别都是具体表现形式的差异 )。 &nbsp; &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">&nbsp;根据HTTP规范，GET用于信息获取，而且应该是安全的和幂等的 。 &nbsp; &nbsp; &nbsp;&nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">1.所谓安全的意味着该操作用于获取信息而非修改信息。换句话说，GET请求一般不应产生副作用。就是说，它仅仅是获取资源信息，就像数据库查询一样，不会修改，增加数据，不会影响资源的状态。 &nbsp; &nbsp; &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">* 注意：这里安全的含义仅仅是指是非修改信息。 &nbsp; &nbsp; &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">&nbsp;</span><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">根据HTTP规范，POST表示可能修改变服务器上的资源的请求 。继续引用上面的例子：还是新闻以网站为例，读者对新闻发表自己的评论应该通过POST实现，因为在评论提交后站点的资源已经不同了，或者说资源被修改了。 &nbsp; &nbsp;</span></p><p style=\"margin-top: 0px; padding: 0px;\">上面大概说了一下HTTP规范中，GET和POST的一些原理性的问题。但在实际的做的时候，很多人却没有按照HTTP规范去做，导致这个问题的原因有很多，比如说： &nbsp; &nbsp; &nbsp;&nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">1.很多人贪方便，更新资源时用了GET，因为用POST必须要到FORM（表单），这样会麻烦一点。 &nbsp; &nbsp; &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">2.对资源的增，删，改，查操作，其实都可以通过GET/POST完成，不需要用到PUT和DELETE。 &nbsp; &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">&nbsp;3.另外一个是，早期的但是Web MVC框架设计者们并没有有意识地将URL当作抽象的资源来看待和设计 。还有一个较为严重的问题是传统的Web MVC框架基本上都只支持GET和POST两种HTTP方法，而不支持PUT和DELETE方法。 &nbsp; &nbsp; &nbsp;&nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">* 简单解释一下MVC：MVC本来是存在于Desktop程序中的，M是指数据模型，V是指用户界面，C则是控制器。使用MVC的目的是将M和V的实现代码分离，从而使同一个程序可以使用不同的表现形式。 &nbsp; &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">&nbsp;以上3点典型地描述了老一套的风格（没有严格遵守HTTP规范），随着架构的发展，现在出现REST(Representational State Transfer)，一套支持HTTP规范的新风格，这里不多说了，可以参考《RESTful Web Services》。 &nbsp;&nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\"><strong style=\"margin: 0px; padding: 0px;\">&nbsp; 二 表现形式区别 &nbsp; &nbsp; &nbsp;&nbsp;</strong></p><p style=\"margin-top: 0px; padding: 0px;\">&nbsp;搞清了两者的原理区别，我们再来看一下他们实际应用中的区别： &nbsp; &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">&nbsp;为了理解两者在传输过程中的不同，我们先看一下HTTP协议的格式： &nbsp; &nbsp; &nbsp;&nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">HTTP请求： &nbsp; &nbsp; &lt;request line&gt; &nbsp; &nbsp; &lt;headers&gt; &nbsp; &nbsp; &lt;blank line&gt; &nbsp; &nbsp; &lt;request-body&gt;] &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">&nbsp;在HTTP请求中，第一行必须是一个请求行（request line），用来说明请求类型、要访问的资源以及使用的HTTP版本。紧接着是一个首部（header）小节，用来说明服务器要使用的附加信息。在首部之后是一个空行，再此之后可以添加任意的其他数据[称之为主体（body）]。 &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">&nbsp;GET与POST方法实例： &nbsp; &nbsp;GET /books/?sex=man&amp;name=Professional HTTP/1.1 &nbsp; Host: www.wrox.com &nbsp; &nbsp;User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.6) &nbsp;&nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">有了以上对HTTP请求的了解和示例，我们再来看两种提交方式的区别： &nbsp; &nbsp; &nbsp; &nbsp;</span></p><p style=\"margin-top: 0px; padding: 0px;\">（1）GET提交，请求的数据会附在URL之后（就是把数据放置在HTTP协议头中），以?分割URL和传输数据，多个参数用&amp;连接；例如：login.action?name=hyddd&amp;password=idontknow&amp;verify=%E4%BD%A0 %E5%A5%BD。如果数据是英文字母/数字，原样发送，如果是空格，转换为+，如果是中文/其他字符，则直接把字符串用BASE64加密，得出如： %E4%BD%A0%E5%A5%BD，其中％XX中的XX为该符号以16进制表示的ASCII。 &nbsp; &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">&nbsp;POST提交：把提交的数据放置在是HTTP包的包体中。上文示例中红色字体标明的就是实际的传输数据 &nbsp; &nbsp; &nbsp;&nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">&nbsp;因此，GET提交的数据会在地址栏中显示出来，而POST提交，地址栏不会改变 &nbsp; &nbsp; &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">(2)传输数据的大小：首先声明：HTTP协议没有对传输的数据大小进行限制，HTTP协议规范也没有对URL长度进行限制。 &nbsp; &nbsp;&nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">而在实际开发中存在的限制主要有： &nbsp; &nbsp;&nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">&nbsp;GET:特定浏览器和服务器对URL长度有限制，例如IE对URL长度的限制是2083字节(2K+35)。对于其他浏览器，如Netscape、FireFox等，理论上没有长度限制，其限制取决于操作系统的支持。 &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">&nbsp;因此对于GET提交时，传输数据就会受到URL长度的限制。 &nbsp; &nbsp;</p><p style=\"margin-top: 0px; padding: 0px;\">&nbsp;POST:由于不是通过URL传值，理论上数据不受限。但实际各个WEB服务器会规定对post提交数据大小进行限制，Apache、IIS6都有各自的配置。&nbsp;</p></ul>', 'SooneBaby', '/about', '1', '0', '23', '1', '2', '2017-03-13 19:25:32');
INSERT INTO `article` VALUES ('13', '7', 'JavaScript入门篇挑战编程', '/ui/system/images/585951277c225.png', '为了学好php，小编也是在不断的提高自己，在学习JavaScript过程中碰到这样一个题目，为实现以下功能填补相应的代码，现在分享给大家', '<ul class=\"infos list-paddingleft-2\" style=\"list-style-type: none;\"><p style=\"margin-top: 0px; padding: 0px;\">为了学好php，小编也是在不断的提高自己，在学习JavaScript过程中碰到这样一个题目，为实现以下功能填补相应的代码，现在分享给大家。</p><p style=\"margin-top: 0px; padding: 0px;\">题目如下：请编写\"改变颜色\"、\"改变宽高\"、\"隐藏内容\"、\"显示内容\"、\"取消设置\"的函数，点击相应按钮执行相应操作，点击\"取消设置\"按钮后，提示是否取消设置，如是执行操作，否则不做操作。</p><p style=\"margin-top: 0px; padding: 0px;\">一、定义\"改变颜色\"的函数<br style=\"margin: 0px; padding: 0px;\">提示:<br style=\"margin: 0px; padding: 0px;\">obj.style.color<br style=\"margin: 0px; padding: 0px;\">obj.style.backgroundColor&nbsp;<br style=\"margin: 0px; padding: 0px;\">二、定义\"改变宽高\"的函数<br style=\"margin: 0px; padding: 0px;\">提示:<br style=\"margin: 0px; padding: 0px;\">obj.style.width<br style=\"margin: 0px; padding: 0px;\">obj.style.height&nbsp;<br style=\"margin: 0px; padding: 0px;\">三、定义\"隐藏内容\"的函数<br style=\"margin: 0px; padding: 0px;\">提示:<br style=\"margin: 0px; padding: 0px;\">obj.style.display=\"none\";<br style=\"margin: 0px; padding: 0px;\">四、定义\"显示内容\"的函数<br style=\"margin: 0px; padding: 0px;\">提示:<br style=\"margin: 0px; padding: 0px;\">obj.style.display=\"block\";<br style=\"margin: 0px; padding: 0px;\">五、定义\"取消设置\"的函数<br style=\"margin: 0px; padding: 0px;\">使用confirm()确定框，来确认是否取消设置。<br style=\"margin: 0px; padding: 0px;\">如是将以上所有的设置恢复原始值,否则不做操作。<br style=\"margin: 0px; padding: 0px;\">六、当点击相应按钮，执行相应操作，为按钮添加相应事件</p><p style=\"margin-top: 0px; padding: 0px;\">集体代码如下，其中红色为填补答案</p></ul>', 'SooneBaby', '/about', '1', '0', '0', '1', '0', '2017-03-13 19:25:32');
INSERT INTO `article` VALUES ('14', '4', 'php常用表单验证类', '/ui/system/images/5859516f09c8f.jpg', 'php常用表单验证你了解多少？', '<pre style=\"box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; padding: 5px; margin-top: 0px; margin-bottom: 10px; line-height: 15.6px; color: rgb(51, 51, 51); word-break: break-all; word-wrap: break-word; border-width: 1px; border-style: solid none; border-color: rgb(170, 204, 153); border-image: initial; border-radius: 4px; white-space: pre-wrap; text-align: justify;\">php常用表单验证你了解多少？&nbsp;\r\n\r\n	&lt;?php&nbsp;\r\n\r\n	/**&nbsp;\r\n\r\n	*&nbsp;页面作用：常用表单验证类&nbsp;\r\n	*/&nbsp;\r\n\r\n	class&nbsp;class_post&nbsp;{&nbsp;\r\n	\r\n	//验证是否为指定长度的字母/数字组合&nbsp;\r\n	function&nbsp;fun_text1($num1,$num2,$str)&nbsp;\r\n	{&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;(preg_match(\"/^[a-zA-Z0-9]{\".$num1.\",\".$num2.\"}$/\",$str))?true:false;&nbsp;\r\n\r\n	}&nbsp;&nbsp;\r\n\r\n	//验证是否为指定长度数字&nbsp;\r\n	function&nbsp;fun_text2($num1,$num2,$str)&nbsp;\r\n	{&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;(preg_match(\"/^[0-9]{\".$num1.\",\".$num2.\"}$/i\",$str))?true:false;&nbsp;\r\n\r\n	}&nbsp;\r\n\r\n	//验证是否为指定长度汉字&nbsp;\r\n	function&nbsp;fun_font($num1,$num2,$str)&nbsp;\r\n	{&nbsp;\r\n\r\n	//&nbsp;preg_match(\"/^[\\xa0-\\xff]{1,4}$/\",&nbsp;$string);&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;(preg_match(\"/^([\\x81-\\xfe][\\x40-\\xfe]){\".$num1.\",\".$num2.\"}$/\",$str))?true:false;&nbsp;\r\n\r\n	}&nbsp;\r\n\r\n	//验证身份证号码&nbsp;\r\n	function&nbsp;fun_status($str)&nbsp;\r\n	{&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;(preg_match(\'/(^([\\d]{15}|[\\d]{18}|[\\d]{17}x)$)/\',$str))?true:false;&nbsp;\r\n\r\n	}&nbsp;\r\n\r\n	//验证邮件地址&nbsp;\r\n	function&nbsp;fun_email($str){&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;(preg_match(\'/^[_\\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\\.)+[a-z]{2,4}$/\',$str))?true:false;&nbsp;\r\n\r\n	}&nbsp;&nbsp;\r\n\r\n	//验证电话号码&nbsp;\r\n	function&nbsp;fun_phone($str)&nbsp;\r\n	{&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;return&nbsp;(preg_match(\"/^((\\(\\d{3}\\))|(\\d{3}\\-))?(\\(0\\d{2,3}\\)|0\\d{2,3}-)?[1-9]\\d{6,7}$/\",$str))?true:false;&nbsp;\r\n\r\n	}&nbsp;\r\n\r\n	//验证邮编&nbsp;\r\n\r\n	function&nbsp;fun_zip($str)&nbsp;\r\n	{&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;return&nbsp;(preg_match(\"/^[1-9]\\d{5}$/\",$str))?true:false;&nbsp;\r\n\r\n	}&nbsp;\r\n\r\n	//验证url地址&nbsp;\r\n\r\n	function&nbsp;fun_url($str)&nbsp;\r\n	{&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;return&nbsp;(preg_match(\"/^http:\\/\\/[A-Za-z0-9]+\\.[A-Za-z0-9]+[\\/=\\?%\\-&amp;_~`@[\\]\\\':+!]*([^&lt;&gt;\\\"\\\"])*$/\",$str))?true:false;&nbsp;\r\n\r\n	}&nbsp;&nbsp;\r\n\r\n	//&nbsp;数据入库&nbsp;转义&nbsp;特殊字符&nbsp;传入值可为字符串&nbsp;或&nbsp;一维数组&nbsp;&nbsp;\r\n\r\n	function&nbsp;data_join(&amp;$data)&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;if(get_magic_quotes_gpc()&nbsp;==&nbsp;false)&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(is_array($data)){&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;foreach&nbsp;($data&nbsp;as&nbsp;$k&nbsp;=&gt;&nbsp;$v){&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$data[$k]&nbsp;=&nbsp;addslashes($v);&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;}else&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;$data&nbsp;=&nbsp;addslashes($data);&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;}&nbsp;\r\n	&nbsp;&nbsp;&nbsp;Return&nbsp;$data;&nbsp;\r\n\r\n	}&nbsp;&nbsp;\r\n\r\n	//&nbsp;数据出库&nbsp;还原&nbsp;特殊字符&nbsp;传入值可为字符串&nbsp;或&nbsp;一/二维数组&nbsp;\r\n\r\n	function&nbsp;data_revert(&amp;$data)&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;if&nbsp;(is_array($data))&nbsp;\r\n	&nbsp;&nbsp;&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;foreach&nbsp;($data&nbsp;as&nbsp;$k1&nbsp;=&gt;&nbsp;$v1)&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(is_array($v1))&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;foreach&nbsp;($v1&nbsp;as&nbsp;$k2&nbsp;=&gt;&nbsp;$v2)&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$data[$k1][$k2]&nbsp;=&nbsp;stripslashes($v2);&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$data[$k1]&nbsp;=&nbsp;stripslashes($v1);&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n	&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;\r\n	&nbsp;&nbsp;&nbsp;}else&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;$data&nbsp;=&nbsp;stripslashes($data);&nbsp;\r\n	&nbsp;&nbsp;&nbsp;}&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;Return&nbsp;$data;&nbsp;\r\n\r\n	}&nbsp;&nbsp;\r\n	//&nbsp;数据显示&nbsp;还原&nbsp;数据格式&nbsp;主要用于内容输出&nbsp;传入值可为字符串&nbsp;或&nbsp;一/二维数组&nbsp;\r\n\r\n	//&nbsp;执行此方法前应先data_revert()，表单内容无须此还原&nbsp;\r\n	function&nbsp;data_show(&amp;$data)&nbsp;\r\n	{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;if&nbsp;(is_array($data))&nbsp;\r\n	&nbsp;&nbsp;&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;foreach&nbsp;($data&nbsp;as&nbsp;$k1&nbsp;=&gt;&nbsp;$v1)&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(is_array($v1))&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;foreach&nbsp;($v1&nbsp;as&nbsp;$k2&nbsp;=&gt;&nbsp;$v2)&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$data[$k1][$k2]=nl2br(htmlspecialchars($data[$k1][$k2]));&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$data[$k1][$k2]=str_replace(\"&nbsp;\",\"&nbsp;\",$data[$k1][$k2]);&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$data[$k1][$k2]=str_replace(\"\\n\",\"&lt;br&gt;\\n\",$data[$k1][$k2]);&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}else{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$data[$k1]=nl2br(htmlspecialchars($data[$k1]));&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$data[$k1]=str_replace(\"&nbsp;\",\"&nbsp;\",$data[$k1]);&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$data[$k1]=str_replace(\"\\n\",\"&lt;br&gt;\\n\",$data[$k1]);&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;}else&nbsp;{&nbsp;\r\n	&nbsp;&nbsp;&nbsp;$data=nl2br(htmlspecialchars($data));&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;$data=str_replace(\"&nbsp;\",\"&nbsp;\",$data);&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;$data=str_replace(\"\\n\",\"&lt;br&gt;\\n\",$data);&nbsp;\r\n\r\n	&nbsp;&nbsp;&nbsp;}&nbsp;\r\n	&nbsp;&nbsp;&nbsp;return&nbsp;$data;&nbsp;\r\n\r\n	}&nbsp;\r\n\r\n	}&nbsp;\r\n\r\n	?&gt;</pre>', 'SooneBaby', '/about', '1', '0', '2', '1', '0', '2017-03-13 19:25:33');
INSERT INTO `article` VALUES ('15', '7', '什么是Web编程，搞懂这几点你就入门了', '/ui/system/images/585d3a4678a8e.JPG', '有些事你从来没有接触过，你就感觉困难、自己干不来，那么你永远不知道那里面是怎么回事。有些事你去认真对待，当你回过头来发现自己已经入门了', '<p>有些事你从来没有接触过，你就感觉困难、自己干不来，那么你永远不知道那里面是怎么回事。有些事你去认真对待，当你回过头来发现自己已经入门了。编程其实没有想象中的那么困难，其实你只是缺少一颗好奇坚持的心。Web编程，仔细想想， 其实本质上就那点事儿， 你抓住了几个重点问题， 学起来一点都不难。</p><p><span style=\"color: rgb(255, 0, 0);\"><strong>1、理解浏览器/服务器结构 (B/S)</strong></span></p><p>B/S 是从 90年代的客户端/服务器端发展而来， 共同点都是由一个（或一组）服务器来服务多个客户端。 差别在于：首先，C/S结构的客户端可能是由不同语言编写的，例如VB,Delphi, PowerBuilder等， B/S结构中浏览器成为了一个通用的客户端， 程序以Web的方式呈现，不需要安装，服务器端的升级就意味着所有客户端的升级，这和C/S相比是个翻天覆地的变化。其次B/S的访问协议也标准化为HTTP(s) &nbsp;，而不是原来各种各样的私有协议。最后B/S结构中的服务器面向全球用户访问，而不像C/S那样仅仅是局域网， 所以压力更大， 挑战更大。</p><p><span style=\"color: rgb(255, 0, 0);\"><strong>2、Web页面是怎么组成的？</strong></span><br></p><p>简单来说就是HTML + CSS + Javascript , &nbsp;我们看到的Web界面就是由这三者组成。HTML负责结构， CSS负责展现， 而Javascript负责行为。我们说的前端开发也主要是做这一块， 对于前端工程师，需要能理解DOM 模型，以及如何通过javascript(例如JQuery等框架)来操作DOM模型。&nbsp;</p><p><span style=\"color: rgb(255, 0, 0);\"><strong>3、浏览器和服务器是怎么打交道的？</strong></span><br></p><p>当然是HTTP ! &nbsp;HTTP说穿了就是浏览器和服务器聊天是的一种约定， 这个约定确保双方互相理解。完整的HTTP是非常复杂的，《HTTP权威指南》一书厚达700多页。</p><p>其实我们最常用， 也是最重要的也就那么几点：<br></p><p>(1) GET 和 POST 。 GET从服务器端获取数据， &nbsp;POST 向服务器端发送数据(由此引出图片上传问题)</p><p>(2) HTTP是个没有状态的协议，需要通过额外的机制来维持状态（例如登录状态）， 常用的方法就是cookie。</p><p>(3) 理解HTTP 状态码</p><p>(4) 理解 同步 vs 异步(由此引出AJAX，以及JQuery等框架)</p><p><span style=\"color: rgb(255, 0, 0);\"><strong>4、URL 和 代码的映射</strong></span></p><p>理解url 和 代码之间的关联， 例如 www.xxx.com?action=login &nbsp;这样的url 是怎么和后端的业务代码关联起来的？ 这样的规则是在哪里定义的？ 用代码、注解还是配置文件？后端的业务代码该如何组织？ 相信现在不会有人把业务逻辑都写到Servlet当中了， &nbsp;所以需要很多MVC 框架像Struts , SpringMVC 来组织代码，让系统清晰易懂。</p><p><span style=\"color: rgb(255, 0, 0);\"><strong>5、数据的验证、转换和绑定</strong></span><br></p><p>如何保证浏览器发过来的数据是符合要求的？ 例如不能为空、不超过8个字符、两个密码必须相等.... &nbsp;， 出错了得给出错误提示。浏览器发过来的数据都是形如username=liuxin&amp;password=123456这样简单的文本， 但是后台程序却有着丰富的数据类型，什么String, Date ,Integer等等。 所以需要把文本变成指定语言的类型。类型转换以后， 后端的业务代码怎么才能有效的使用呢？最简单的就是弄一个key : value 这个样的Map 出来， 业务代码直接用map.get(key) 即可。高级一点的可以把页面发来的数据直接绑定到对象的属性上， 并且支持数组，嵌套等复杂的结构。例如user.name=liuxin&amp;user.password=123456 &nbsp;可以绑定到一个叫User的对象， 其中有两个属性userName和password。&nbsp;</p><p><span style=\"color: rgb(255, 0, 0);\"><strong>6、Web安全</strong></span></p><p>如何防止黑客利用SQL 注入，跨站脚本攻击， 跨站请求伪造等手段来攻击系统？</p><p><span style=\"color: rgb(255, 0, 0);\"><strong>7、数据库访问</strong></span><br></p><p>这一块是比较麻烦的， 毕竟面向对象(OO)世界和关系(Relational)数据库之间存在着天然的鸿沟。 对于简单的应用， 直接写点JDBC就够用了，只需要掌握Connection, Statement , Resultset这三个基础。 复杂点的需要用O/R Mapping 框架来搞定，例如 Hibernate, MyBatis &nbsp;，还有RoR的ActiveRecord。这其中比较棘手的就是表之间的关联， 就是所谓的一对多， 一对一， 多对多这样的关系， 如何在面向对象的世界里描述。扩展开去，还需要处理连接池， 事务，锁 等各种烦人问题。</p><p><span style=\"color: rgb(255, 0, 0);\"><strong>8、用什么技术来生成Web页面？</strong></span></p><p>这里说的Web页面就是第2点中的页面，包括HTML, CSS, Javascript。 能不能直接用Servlet的PrintWriter 直接输出HTML ? 当然可以，只是以后就没有人看懂了。现在用来创建Web页面的技术多如牛毛：例如 JSP, Velocity, Freemaker, Groovy 等等， 他们都有一个共同点： 模板技术。说白了就是有一个HTML的模板， 里边可以嵌入代码， 这个模板在运行时（例如在Tomcat当中）就可以根据输入的不同而生成不同内容的Web界面了。 无论哪种模板，都需要面对一个重要问题：如何展示从业务逻辑层发送来的数据？ &nbsp;这一步骤其实和第5步中的数据绑定有密切关系。因为这一步需要确定诸如user.name &nbsp;, user.password这样的字段名称。</p><p><span style=\"color: rgb(255, 0, 0);\"><strong>9、如何把对象变成XML或者JSON字符串？</strong></span></p><p>由于AJAX以及手机端的存在，对于一个URL的请求， 他们要求的返回值通常不是HTML页面， 而是XML或者JSON数据， 此时需要有框架把对象转化成相应的字符串。 搞定了Web这些基础的东西，在公司里做一个Web程序员应该不在话下了， 接下来需要学习的就是像高并发，缓存，搜索，分布式等高级的内容了。</p><p><br></p>', 'SooneBaby', '/about', '1', '0', '449', '1', '4', '2017-03-13 19:25:33');

-- ----------------------------
-- Table structure for `article_class`
-- ----------------------------
DROP TABLE IF EXISTS `article_class`;
CREATE TABLE `article_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_class
-- ----------------------------
INSERT INTO `article_class` VALUES ('1', '杂乱无章', '2');
INSERT INTO `article_class` VALUES ('2', '系统架构', '2');
INSERT INTO `article_class` VALUES ('3', '前端设计', '1');
INSERT INTO `article_class` VALUES ('4', 'php语言', '4');
INSERT INTO `article_class` VALUES ('5', '数据库', '0');
INSERT INTO `article_class` VALUES ('6', '游戏开发', '0');
INSERT INTO `article_class` VALUES ('7', '网页设计', '2');
INSERT INTO `article_class` VALUES ('8', '搜索引擎', '3');

-- ----------------------------
-- Table structure for `article_comment`
-- ----------------------------
DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE `article_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `aid` int(11) NOT NULL COMMENT '文章id',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:评论2回复',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(50) NOT NULL DEFAULT '' COMMENT '头像',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '内容',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `ext` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展字段',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `pid` (`pid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_comment
-- ----------------------------
INSERT INTO `article_comment` VALUES ('1', '15', '1', '0', '1', '/ui/system/images/soonebaby.jpg', '阿斯顿发生地方', 'emailwyc@163.com', '2017-03-14 22:59:13', '12.12.12.21', '北京23', '');
INSERT INTO `article_comment` VALUES ('2', '15', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/118.jpg', '功能做的不错啊<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-20 13:30:13', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `article_comment` VALUES ('3', '12', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/2.gif\" class=\"face\">', '', '2017-03-21 17:14:52', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `article_comment` VALUES ('4', '12', '1', '0', '小沈阳', '/ui/system/images/default_avatar/86.jpg', '啊里噶抖<img src=\"/ui/system/comment/images/face/16.gif\" class=\"face\">', '', '2017-03-22 21:26:14', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `article_comment` VALUES ('5', '15', '2', '2', '你好', '/ui/system/images/default_avatar/110.jpg', '１１', '', '2017-04-19 16:06:22', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `article_comment` VALUES ('6', '15', '2', '2', '你好', '/ui/system/images/default_avatar/110.jpg', '&amp;lt;i class=&quot;el-twitter&quot;&amp;gt;&amp;lt;/i&amp;gt;测试', '1', '2017-04-19 16:27:26', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `article_comment` VALUES ('7', '15', '2', '2', '你好', '/ui/system/images/default_avatar/110.jpg', '１１', '', '2017-04-19 16:46:39', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `article_comment` VALUES ('8', '15', '2', '2', '管理员', '/ui/system/images/default_avatar/110.jpg', '领导发话了', '1', '2017-04-19 17:04:39', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `article_comment` VALUES ('9', '15', '1', '0', '管理员', '/ui/system/images/default_avatar/110.jpg', '测试', '', '2017-04-19 17:26:02', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `article_comment` VALUES ('10', '15', '1', '0', '管理员', '/ui/system/images/soonebaby.jpg', '测试', '', '2017-04-19 17:37:07', '127.0.0.1', '未分配或者内网IP', '');

-- ----------------------------
-- Table structure for `article_tags`
-- ----------------------------
DROP TABLE IF EXISTS `article_tags`;
CREATE TABLE `article_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL COMMENT '标签id',
  `aid` int(11) NOT NULL COMMENT '文章id',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_tags
-- ----------------------------
INSERT INTO `article_tags` VALUES ('1', '20', '2');
INSERT INTO `article_tags` VALUES ('2', '1', '3');
INSERT INTO `article_tags` VALUES ('3', '8', '4');
INSERT INTO `article_tags` VALUES ('4', '7', '5');
INSERT INTO `article_tags` VALUES ('5', '11', '6');
INSERT INTO `article_tags` VALUES ('6', '7', '7');
INSERT INTO `article_tags` VALUES ('7', '1', '8');
INSERT INTO `article_tags` VALUES ('8', '7', '9');
INSERT INTO `article_tags` VALUES ('9', '16', '10');
INSERT INTO `article_tags` VALUES ('10', '4', '11');
INSERT INTO `article_tags` VALUES ('11', '11', '12');
INSERT INTO `article_tags` VALUES ('12', '21', '13');
INSERT INTO `article_tags` VALUES ('13', '1', '14');
INSERT INTO `article_tags` VALUES ('14', '11', '15');

-- ----------------------------
-- Table structure for `download`
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `kwd` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `content` text NOT NULL COMMENT '内容',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT 'icon',
  `dnum` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `durl` varchar(255) NOT NULL COMMENT '下载url',
  `lurl` varchar(255) NOT NULL DEFAULT '' COMMENT '连接地址',
  `pv` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `is_hot` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否热门',
  `uptime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download
-- ----------------------------
INSERT INTO `download` VALUES ('1', '随手拍的美照1', '美照1', '<p style=\"text-align: center;\">随手美照</p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby14.jpg\" title=\"随手美照\" alt=\"随手美照\"></p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby15.jpg\" title=\"随手美照\" alt=\"随手美照\"></p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby16.jpg\" title=\"随手美照\" alt=\"随手美照\"></p> ', '/ui/system/images/soonebaby12.jpg', '0', 'ui/system/images/soonebaby12.jpg', 'http://baidu.com', '6', '0', '2017-03-22 12:51:21', '2017-03-21 21:46:44');
INSERT INTO `download` VALUES ('2', '随手拍的美照2', '美照2', '<p style=\"text-align: center;\">随手美照</p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby14.jpg\" title=\"随手美照\" alt=\"随手美照\"></p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby15.jpg\" title=\"随手美照\" alt=\"随手美照\"></p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby16.jpg\" title=\"随手美照\" alt=\"随手美照\"></p> ', '/ui/system/images/soonebaby12.jpg', '0', 'ui/system/images/soonebaby13.jpg', '', '1', '1', '2017-03-23 11:40:01', '2017-03-21 21:46:44');
INSERT INTO `download` VALUES ('4', '随手拍的美照3', '美照3', '<p style=\"text-align: center;\">随手美照</p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby14.jpg\" title=\"随手美照\" alt=\"随手美照\"></p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby15.jpg\" title=\"随手美照\" alt=\"随手美照\"></p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby16.jpg\" title=\"随手美照\" alt=\"随手美照\"></p> ', '/ui/system/images/soonebaby12.jpg', '0', 'ui/system/images/soonebaby14.jpg', '', '0', '0', '2017-03-22 12:51:22', '2017-03-21 21:46:44');
INSERT INTO `download` VALUES ('5', '随手拍的美照4', '美照4', '<p style=\"text-align: center;\">随手美照</p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby14.jpg\" title=\"随手美照\" alt=\"随手美照\"></p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby15.jpg\" title=\"随手美照\" alt=\"随手美照\"></p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby16.jpg\" title=\"随手美照\" alt=\"随手美照\"></p> ', '/ui/system/images/soonebaby12.jpg', '0', 'ui/system/images/soonebaby15.jpg', '', '5', '0', '2017-03-23 11:57:54', '2017-03-21 21:46:44');
INSERT INTO `download` VALUES ('6', '随手拍的美照5', '美照5', '<p style=\"text-align: center;\">随手美照</p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby14.jpg\" title=\"随手美照\" alt=\"随手美照\"></p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby15.jpg\" title=\"随手美照\" alt=\"随手美照\"></p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby16.jpg\" title=\"随手美照\" alt=\"随手美照\"></p> ', '/ui/system/images/soonebaby12.jpg', '0', 'ui/system/images/soonebaby19.jpg', '', '0', '0', '2017-03-22 12:51:24', '2017-03-21 21:46:44');
INSERT INTO `download` VALUES ('7', '随手拍的美照6', '美照6', '<p style=\"text-align: center;\">随手美照</p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby14.jpg\" title=\"随手美照\" alt=\"随手美照\"></p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby15.jpg\" title=\"随手美照\" alt=\"随手美照\"></p><p style=\"text-align: center;\"><img src=\"/ui/system/images/soonebaby16.jpg\" title=\"随手美照\" alt=\"随手美照\"></p> ', '/ui/system/images/soonebaby12.jpg', '3', 'ui/system/images/soonebaby20.jpg', '', '33', '0', '2017-03-28 19:56:40', '2017-03-21 21:46:44');

-- ----------------------------
-- Table structure for `download_comment`
-- ----------------------------
DROP TABLE IF EXISTS `download_comment`;
CREATE TABLE `download_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `aid` int(11) NOT NULL COMMENT '文章id',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:评论2回复',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(50) NOT NULL DEFAULT '' COMMENT '头像',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '内容',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `ext` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展字段',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `pid` (`pid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download_comment
-- ----------------------------
INSERT INTO `download_comment` VALUES ('4', '1', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '不错<img src=\"/ui/system/comment/images/face/28.gif\" class=\"face\">', '', '2017-03-22 11:49:22', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `download_comment` VALUES ('5', '7', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-22 12:04:58', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `download_comment` VALUES ('6', '7', '2', '5', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/17.gif\" class=\"face\">', '', '2017-03-22 12:15:10', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `download_comment` VALUES ('7', '7', '2', '5', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '回复@SooneBaby： 你干啥啊', '', '2017-03-22 12:15:56', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `download_comment` VALUES ('8', '7', '2', '5', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '回复@SooneBaby： 哈哈', '', '2017-03-22 12:16:26', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `download_comment` VALUES ('9', '7', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-22 12:19:25', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `download_comment` VALUES ('10', '7', '2', '5', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '撒旦法', '', '2017-03-22 12:21:32', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `download_comment` VALUES ('11', '7', '2', '5', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '撒旦法', '', '2017-03-22 12:22:59', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `download_comment` VALUES ('12', '7', '2', '5', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '暗室逢灯', '', '2017-03-22 12:23:22', '127.0.0.1', '未分配或者内网IP', '');

-- ----------------------------
-- Table structure for `friend_links`
-- ----------------------------
DROP TABLE IF EXISTS `friend_links`;
CREATE TABLE `friend_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '友情链接id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `website` varchar(50) NOT NULL DEFAULT '' COMMENT '网站',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '介绍',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:未审核，1审核通过，2审核不通过',
  `order` int(11) NOT NULL DEFAULT '0',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend_links
-- ----------------------------
INSERT INTO `friend_links` VALUES ('1', '草客天下', 'emailwyc@163.com', 'http://emailwyc.blog.163.com/', '草客天下', '1', '0', '2017-03-24 11:56:00');
INSERT INTO `friend_links` VALUES ('2', '百度博客', 'emailwyc@163.com', 'http://www.baidu.com', '测试', '0', '0', '2017-03-24 15:27:10');

-- ----------------------------
-- Table structure for `history_today`
-- ----------------------------
DROP TABLE IF EXISTS `history_today`;
CREATE TABLE `history_today` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `month` tinyint(4) NOT NULL,
  `day` tinyint(4) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `year` (`year`),
  KEY `month, day` (`month`,`day`)
) ENGINE=InnoDB AUTO_INCREMENT=3559 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history_today
-- ----------------------------
INSERT INTO `history_today` VALUES ('2', '1085', '1', '1', '司马光主持编撰的《资治通鉴》成书。');
INSERT INTO `history_today` VALUES ('3', '1085', '1', '1', '《资治通鉴》编成');
INSERT INTO `history_today` VALUES ('4', '1788', '1', '1', '伦敦泰晤士报首次出版');
INSERT INTO `history_today` VALUES ('5', '1801', '1', '1', '英格兰、苏格兰、威尔士和爱尔兰合并组成大不列颠及爱尔兰联合王国');
INSERT INTO `history_today` VALUES ('6', '1861', '1', '1', '迪亚兹攻占墨西哥城');
INSERT INTO `history_today` VALUES ('7', '1863', '1', '1', '美国总统林肯正式实施黑人奴隶解放宣言说');
INSERT INTO `history_today` VALUES ('8', '1893', '1', '1', '日本采用公历');
INSERT INTO `history_today` VALUES ('9', '1901', '1', '1', '英国在澳洲的殖民地组成澳大利亚联邦');
INSERT INTO `history_today` VALUES ('10', '1912', '1', '1', '中华书局创办');
INSERT INTO `history_today` VALUES ('11', '1912', '1', '1', '孙中山就任中华民国临时大总统');
INSERT INTO `history_today` VALUES ('12', '1905', '1', '2', '日俄战争：驻守旅顺的俄军向日军投降。');
INSERT INTO `history_today` VALUES ('13', '1909', '1', '2', '意大利墨西拿发生地震，20万人丧生。 ');
INSERT INTO `history_today` VALUES ('14', '1909', '1', '2', '清政府将袁世凯撤职。');
INSERT INTO `history_today` VALUES ('15', '1909', '1', '2', '摄政王借口“足疾”罢斥袁世凯');
INSERT INTO `history_today` VALUES ('16', '1920', '1', '2', '美国禁酒令生效。');
INSERT INTO `history_today` VALUES ('17', '1920', '1', '2', '北洋政府颁布第一个废除文言文、采用国语的法令');
INSERT INTO `history_today` VALUES ('18', '1921', '1', '2', '卢森堡共产党成立');
INSERT INTO `history_today` VALUES ('19', '1923', '1', '2', '《中国国民党党纲》公布。');
INSERT INTO `history_today` VALUES ('20', '1931', '1', '2', '巴拿马政府被逐下台');
INSERT INTO `history_today` VALUES ('21', '1932', '1', '2', '日军攻占锦州，中国东北三省全部沦陷。 ');
INSERT INTO `history_today` VALUES ('22', '1777', '1', '3', '普林斯顿战役，美军战胜英军');
INSERT INTO `history_today` VALUES ('23', '1839', '1', '3', '清朝道光帝任命林则徐为钦差大臣，主持查禁鸦片。 ');
INSERT INTO `history_today` VALUES ('24', '1843', '1', '3', '魏源编著《海国图志》刻本出版');
INSERT INTO `history_today` VALUES ('25', '1851', '1', '3', '法国物理学家傅科证实了地球的自转');
INSERT INTO `history_today` VALUES ('26', '1868', '1', '3', '日本明治维新开始。');
INSERT INTO `history_today` VALUES ('27', '1911', '1', '3', '伦敦警察痛恨俄无政府主义者');
INSERT INTO `history_today` VALUES ('28', '1912', '1', '3', '《越铎日报》在绍兴创刊');
INSERT INTO `history_today` VALUES ('29', '1912', '1', '3', '孙中山领导的国民临时政府组成');
INSERT INTO `history_today` VALUES ('30', '1914', '1', '3', '呼伦贝尔自治政府与俄国商人签订在乌奴尔沟等地采伐树木的合同');
INSERT INTO `history_today` VALUES ('31', '1927', '1', '3', '汉口爆发“一·三”事件，中国政府宣布收回汉口英租界。');
INSERT INTO `history_today` VALUES ('32', '1884', '1', '4', '费边社在伦敦成立');
INSERT INTO `history_today` VALUES ('33', '1900', '1', '4', '罢工浪潮席卷欧洲。');
INSERT INTO `history_today` VALUES ('34', '1917', '1', '4', '蔡元培就任北京大学校长。 ');
INSERT INTO `history_today` VALUES ('35', '1921', '1', '4', '郑振铎、沈雁冰、叶圣陶、周作人、王统照、孙伏园、许地山12人等发起成立文学研究会。 ');
INSERT INTO `history_today` VALUES ('36', '1927', '1', '4', '毛泽东考察湖南农民运动');
INSERT INTO `history_today` VALUES ('37', '1932', '1', '4', '印度国大党被英国当局宣布为非法。甘地入狱。 ');
INSERT INTO `history_today` VALUES ('38', '1933', '1', '4', '柏林10万人反法西斯示威游行');
INSERT INTO `history_today` VALUES ('39', '1935', '1', '4', '中国工农红军突破乌江。');
INSERT INTO `history_today` VALUES ('40', '1937', '1', '4', '张学良南京被囚');
INSERT INTO `history_today` VALUES ('41', '1940', '1', '4', '德政府成立战时经济会议，戈林负责');
INSERT INTO `history_today` VALUES ('42', '1896', '1', '5', 'X射线公诸于世');
INSERT INTO `history_today` VALUES ('43', '1904', '1', '5', '京剧科班“喜连成”成立。');
INSERT INTO `history_today` VALUES ('44', '1904', '1', '5', '著名京剧科班“喜连成”成立');
INSERT INTO `history_today` VALUES ('45', '1914', '1', '5', '福特付给工人日薪5美元产量猛增');
INSERT INTO `history_today` VALUES ('46', '1919', '1', '5', '法西斯党--德国工人党成立');
INSERT INTO `history_today` VALUES ('47', '1919', '1', '5', '德国柏林工人总罢工并武装起义');
INSERT INTO `history_today` VALUES ('48', '1929', '1', '5', '南斯拉夫国王亚历山大一世取消宪法，宣布独裁。');
INSERT INTO `history_today` VALUES ('49', '1930', '1', '5', '斯大林开始实行农业集体化 ');
INSERT INTO `history_today` VALUES ('50', '1930', '1', '5', '毛泽东撰写《星星之火，可以燎原》');
INSERT INTO `history_today` VALUES ('51', '1942', '1', '5', '联合国推举蒋介石任中国战区最高统帅');
INSERT INTO `history_today` VALUES ('52', '1374', '1', '6', '明朝《大明律》首次颁行天下');
INSERT INTO `history_today` VALUES ('53', '1913', '1', '6', '巴尔干同盟会议因意见不合而破裂');
INSERT INTO `history_today` VALUES ('54', '1925', '1', '6', '墨索里尼改组内阁，全部由法西斯份子组成');
INSERT INTO `history_today` VALUES ('55', '1927', '1', '6', '九江英国人被赶出租界');
INSERT INTO `history_today` VALUES ('56', '1929', '1', '6', '亚利山大成为南斯拉夫的独裁者');
INSERT INTO `history_today` VALUES ('57', '1935', '1', '6', '中国工农红军占领遵义城');
INSERT INTO `history_today` VALUES ('58', '1938', '1', '6', '新四军军部成立');
INSERT INTO `history_today` VALUES ('59', '1941', '1', '6', '美国总统富兰克林·罗斯福向国会提交《租借法案》。');
INSERT INTO `history_today` VALUES ('60', '1941', '1', '6', '国民党制造震惊中外的“皖南事变”');
INSERT INTO `history_today` VALUES ('61', '1950', '1', '6', '英国宣布承认中华人民共和国');
INSERT INTO `history_today` VALUES ('62', '1558', '1', '7', '法国从英国手中夺取了加来');
INSERT INTO `history_today` VALUES ('63', '1610', '1', '7', '意大利物理学家、天文学家伽利略首次利用自制的望远镜观察太空反射光');
INSERT INTO `history_today` VALUES ('64', '1841', '1', '7', '英国企图以武力迫使清朝钦差大臣琦善屈服，出动舰船10余艘进攻沙角、大角炮台，发动虎门之战');
INSERT INTO `history_today` VALUES ('65', '1911', '1', '7', '劳斯第一个发现癌病毒');
INSERT INTO `history_today` VALUES ('66', '1912', '1', '7', '南非非洲人国民大会成立');
INSERT INTO `history_today` VALUES ('67', '1919', '1', '7', '阿根廷“血腥的一周”开始，一周内死伤约6千人');
INSERT INTO `history_today` VALUES ('68', '1927', '1', '7', '纽约与伦敦间的第一个商业电话业务开始');
INSERT INTO `history_today` VALUES ('69', '1931', '1', '7', '中共六届四中全会在上海举行');
INSERT INTO `history_today` VALUES ('70', '1932', '1', '7', '史汀生主义宣布');
INSERT INTO `history_today` VALUES ('71', '1933', '1', '7', '中共临时中央由上海迁至瑞金');
INSERT INTO `history_today` VALUES ('72', '0', '1', '8', '汉武帝即位');
INSERT INTO `history_today` VALUES ('73', '1902', '1', '8', '慈禧从西安返回北京');
INSERT INTO `history_today` VALUES ('74', '1905', '1', '8', '世界上最大的钻石在南非发现');
INSERT INTO `history_today` VALUES ('75', '1926', '1', '8', '伊本-沙特发动政变，自立为沙特国王');
INSERT INTO `history_today` VALUES ('76', '1937', '1', '8', '美国参众两院拒绝向西班牙内战双方输出武器');
INSERT INTO `history_today` VALUES ('77', '1938', '1', '8', '白求恩到达武汉，支持中国抗战(图文)');
INSERT INTO `history_today` VALUES ('78', '1944', '1', '8', '墨索里尼判处齐亚诺等死刑');
INSERT INTO `history_today` VALUES ('79', '1950', '1', '8', '甘肃省人民政府成立');
INSERT INTO `history_today` VALUES ('80', '1951', '1', '8', '朝鲜人民军攻克仁川港');
INSERT INTO `history_today` VALUES ('81', '1954', '1', '8', '中共中央号召发展农业生产合作社');
INSERT INTO `history_today` VALUES ('82', '1522', '1', '9', '西班牙摄政王艾德里安当选为教皇艾德里安六世');
INSERT INTO `history_today` VALUES ('83', '1588', '1', '9', '日内瓦成为瑞士的一个独立州');
INSERT INTO `history_today` VALUES ('84', '1788', '1', '9', '康涅狄格成为美国的第五州');
INSERT INTO `history_today` VALUES ('85', '1906', '1', '9', '李伯元著《官场现形记》在上海出版');
INSERT INTO `history_today` VALUES ('86', '1915', '1', '9', '第一次世界大战英军发起加里波利战役');
INSERT INTO `history_today` VALUES ('87', '1917', '1', '9', '俄国各城市举行罢工反对战争');
INSERT INTO `history_today` VALUES ('88', '1928', '1', '9', '蒋介石东山再起，复任革命军总司令。');
INSERT INTO `history_today` VALUES ('89', '1928', '1', '9', '斯大林将包括托洛茨基在内的反对人士赶出苏联。');
INSERT INTO `history_today` VALUES ('90', '1932', '1', '9', '英国照会日本，要求在中国东北实行门户开放');
INSERT INTO `history_today` VALUES ('91', '1940', '1', '9', '毛泽东演讲《新民主主义论》');
INSERT INTO `history_today` VALUES ('92', '1914', '1', '10', '袁世凯宣布解散国会');
INSERT INTO `history_today` VALUES ('93', '1920', '1', '10', '国际联盟成立');
INSERT INTO `history_today` VALUES ('94', '1920', '1', '10', '日本与德国正式媾和');
INSERT INTO `history_today` VALUES ('95', '1921', '1', '10', '土耳其涅纽村战役，国民军击溃希腊军队的进攻');
INSERT INTO `history_today` VALUES ('96', '1923', '1', '10', '法国、比利时联军占领德国鲁尔地区');
INSERT INTO `history_today` VALUES ('97', '1938', '1', '10', '日本军队登陆青岛');
INSERT INTO `history_today` VALUES ('98', '1940', '1', '10', '意大利与匈牙利缔结军事同盟条约');
INSERT INTO `history_today` VALUES ('99', '1940', '1', '10', '英国实行食糖、黄油和熏肉配给。');
INSERT INTO `history_today` VALUES ('100', '1940', '1', '10', '英国总督宣布战后给予印度自治领地位');
INSERT INTO `history_today` VALUES ('101', '1946', '1', '10', '联合国大会第一届第一次会议在伦敦举行');
INSERT INTO `history_today` VALUES ('102', '1569', '1', '11', '英格兰首次发行彩票');
INSERT INTO `history_today` VALUES ('103', '1571', '1', '11', '奥地利贵族开始享有宗教自由');
INSERT INTO `history_today` VALUES ('104', '1759', '1', '11', '美国第一家人寿保险公司成立');
INSERT INTO `history_today` VALUES ('105', '1851', '1', '11', '洪秀全在广西金田领导发动了太平天国起义');
INSERT INTO `history_today` VALUES ('106', '1904', '1', '11', '英军在索马里屠杀1,000多名回教苦行僧');
INSERT INTO `history_today` VALUES ('107', '1904', '1', '11', '孙中山在檀香山加入致公堂');
INSERT INTO `history_today` VALUES ('108', '1914', '1', '11', '本世纪初女权运动迅速发展');
INSERT INTO `history_today` VALUES ('109', '1917', '1', '11', '中国抚顺发生煤矿瓦斯爆炸，917名矿工死亡');
INSERT INTO `history_today` VALUES ('110', '1919', '1', '11', '罗马尼亚并吞特兰西瓦尼亚');
INSERT INTO `history_today` VALUES ('111', '1919', '1', '11', '苏俄人民委员会颁布余粮收集制法令');
INSERT INTO `history_today` VALUES ('112', '1791', '1', '12', '四大徽班进北京，京剧开始形成');
INSERT INTO `history_today` VALUES ('113', '1853', '1', '12', '太平天国攻占武昌');
INSERT INTO `history_today` VALUES ('114', '1904', '1', '12', '清廷兴修京师观象台');
INSERT INTO `history_today` VALUES ('115', '1912', '1', '12', '彭家珍与良弼同归于尽。');
INSERT INTO `history_today` VALUES ('116', '1913', '1', '12', '教育部以部令第1号公布《大学规程》');
INSERT INTO `history_today` VALUES ('117', '1920', '1', '12', '中国政府废止文言文教学');
INSERT INTO `history_today` VALUES ('118', '1922', '1', '12', '香港海员大罢工');
INSERT INTO `history_today` VALUES ('119', '1926', '1', '12', '巴斯德研究所称已发现抗破伤风血清。');
INSERT INTO `history_today` VALUES ('120', '1932', '1', '12', '法国、比利时因德国拖欠一战战争赔款，联合出兵占领鲁尔区');
INSERT INTO `history_today` VALUES ('121', '1937', '1', '12', '红军西路军遭受国民党“围剿”');
INSERT INTO `history_today` VALUES ('122', '1716', '1', '13', '《康熙字典》成书');
INSERT INTO `history_today` VALUES ('123', '1904', '1', '13', '日本向俄国发出最后通牒，日俄战争爆发');
INSERT INTO `history_today` VALUES ('124', '1908', '1', '13', '法尔芒第一次进行长时间圆圈飞行。');
INSERT INTO `history_today` VALUES ('125', '1908', '1', '13', '中、英、德签订《津浦铁路借款合同》');
INSERT INTO `history_today` VALUES ('126', '1935', '1', '13', '方志敏被俘');
INSERT INTO `history_today` VALUES ('127', '1935', '1', '13', '萨尔公民投票赞成重新并入德国');
INSERT INTO `history_today` VALUES ('128', '1938', '1', '13', '世界上第一部彩色动画片《白雪公主和七个小矮人》问世');
INSERT INTO `history_today` VALUES ('129', '1958', '1', '13', '九千多科学家要求签订禁止核武器的国际协定');
INSERT INTO `history_today` VALUES ('130', '1962', '1', '13', '东方歌舞团成立。');
INSERT INTO `history_today` VALUES ('131', '1964', '1', '13', '第一届阿拉伯国家首脑会议在开罗举行');
INSERT INTO `history_today` VALUES ('132', '1784', '1', '14', '美国独立战争正式结束');
INSERT INTO `history_today` VALUES ('133', '1907', '1', '14', '秋瑾等在上海创办《中国女报》');
INSERT INTO `history_today` VALUES ('134', '1916', '1', '14', '荷兰须德海水坝崩溃，造成洪水泛滥');
INSERT INTO `history_today` VALUES ('135', '1916', '1', '14', '巴尔干特快车首次通车');
INSERT INTO `history_today` VALUES ('136', '1938', '1', '14', '新疆军阀盛世才清洗异已，杀300多人');
INSERT INTO `history_today` VALUES ('137', '1940', '1', '14', '玛格丽特二世登基　丹麦历史上第二位女君主诞生');
INSERT INTO `history_today` VALUES ('138', '1943', '1', '14', '卡萨布兰卡会议在摩洛哥举行');
INSERT INTO `history_today` VALUES ('139', '1946', '1', '14', '世界上第一台计算机诞生');
INSERT INTO `history_today` VALUES ('140', '1948', '1', '14', '电影《一江春水向东流》创中国电影卖座最高纪录');
INSERT INTO `history_today` VALUES ('141', '1949', '1', '14', '毛泽东发表时局声明，提出了达到真正和平的八项条件');
INSERT INTO `history_today` VALUES ('142', '1759', '1', '15', '大英博物馆正式对公众开放');
INSERT INTO `history_today` VALUES ('143', '1851', '1', '15', '美国最早的反抗黑奴制度的黑人武装团体“美国基列人同盟”成立');
INSERT INTO `history_today` VALUES ('144', '1906', '1', '15', '无线电发明家波波夫逝世');
INSERT INTO `history_today` VALUES ('145', '1913', '1', '15', '李烈钧抗拒袁世凯');
INSERT INTO `history_today` VALUES ('146', '1915', '1', '15', '德国齐柏林飞艇轰炸英国伦敦');
INSERT INTO `history_today` VALUES ('147', '1916', '1', '15', '饥民大闹上海');
INSERT INTO `history_today` VALUES ('148', '1916', '1', '15', '蔡锷率护国军讨伐袁世凯');
INSERT INTO `history_today` VALUES ('149', '1918', '1', '15', '岑春煊另立政府，成立西南各省联合会 ');
INSERT INTO `history_today` VALUES ('150', '1918', '1', '15', '陈独秀说：只有德先生、赛先生可以救中国');
INSERT INTO `history_today` VALUES ('151', '1925', '1', '15', '广东革命政府出兵征伐陈炯明 ');
INSERT INTO `history_today` VALUES ('152', '1581', '1', '16', '英国议会驱逐天主教徒');
INSERT INTO `history_today` VALUES ('153', '1900', '1', '16', '英国放弃对萨摩亚岛的主权');
INSERT INTO `history_today` VALUES ('154', '1909', '1', '16', '人类发现南磁极');
INSERT INTO `history_today` VALUES ('155', '1920', '1', '16', '协约国要求引渡德皇威廉二世，遭荷兰拒绝');
INSERT INTO `history_today` VALUES ('156', '1923', '1', '16', '孙中山夺回广州，发表和平统一宣言');
INSERT INTO `history_today` VALUES ('157', '1929', '1', '16', '苏联前革命军事委员会主席、托洛茨基集团的首领托洛茨基被驱逐出境');
INSERT INTO `history_today` VALUES ('158', '1933', '1', '16', '东北义勇军进击通辽日军');
INSERT INTO `history_today` VALUES ('159', '1934', '1', '16', '蒋介石占领福州，十九路军兵败降蒋');
INSERT INTO `history_today` VALUES ('160', '1940', '1', '16', '希特勒取消原定的西线进攻计划');
INSERT INTO `history_today` VALUES ('161', '1942', '1', '16', '尼赫鲁接替甘地成为国大党领袖');
INSERT INTO `history_today` VALUES ('162', '0', '1', '17', '中国汉景帝时期爆发七国之乱');
INSERT INTO `history_today` VALUES ('163', '1786', '1', '17', '法国天文学家梅尚，在巴黎用小望远镜发现了在宝瓶座β星附近有一颗不大的彗星---恩克彗星。');
INSERT INTO `history_today` VALUES ('164', '1897', '1', '17', '谭嗣同重要哲学著作《仁学》编写完成');
INSERT INTO `history_today` VALUES ('165', '1912', '1', '17', '斯科特比阿蒙森晚一个月到达南极');
INSERT INTO `history_today` VALUES ('166', '1917', '1', '17', '美国用2500万美元从丹麦手中得到西印度群岛');
INSERT INTO `history_today` VALUES ('167', '1923', '1', '17', '蔡元培愤而辞去北大校长职务，抗议非法逮捕北大教师。');
INSERT INTO `history_today` VALUES ('168', '1931', '1', '17', '左联五位作家被捕');
INSERT INTO `history_today` VALUES ('169', '1933', '1', '17', '中共发表宣言：停止内战一致抗日');
INSERT INTO `history_today` VALUES ('170', '1936', '1', '17', '德国纳粹戈培尔要求扩张殖民地');
INSERT INTO `history_today` VALUES ('171', '1939', '1', '17', '中国语言文字学家钱玄同先生逝世');
INSERT INTO `history_today` VALUES ('172', '1701', '1', '18', '腓特烈一世加冕，成为普鲁士国王');
INSERT INTO `history_today` VALUES ('173', '1871', '1', '18', '德意志帝国成立');
INSERT INTO `history_today` VALUES ('174', '1896', '1', '18', 'X光机第一次展出');
INSERT INTO `history_today` VALUES ('175', '1902', '1', '18', '慈禧太后第一次撤帘露面，公开召见各国驻华使节');
INSERT INTO `history_today` VALUES ('176', '1911', '1', '18', '飞行员伊利首次成功地在轮船上起飞和降落');
INSERT INTO `history_today` VALUES ('177', '1911', '1', '18', '黄兴在香港设置广州起义总指挥部');
INSERT INTO `history_today` VALUES ('178', '1915', '1', '18', '日本公使日置益向袁世凯递交“二十一条”');
INSERT INTO `history_today` VALUES ('179', '1918', '1', '18', '威尔逊提出解决战后问题的14点方案');
INSERT INTO `history_today` VALUES ('180', '1919', '1', '18', '签订凡尔赛条约的巴黎和会召开');
INSERT INTO `history_today` VALUES ('181', '1922', '1', '18', '李大钊发表文章《现代的女权运动》');
INSERT INTO `history_today` VALUES ('182', '1895', '1', '19', '日军在山东成山头登陆');
INSERT INTO `history_today` VALUES ('183', '1903', '1', '19', '法国宣布举办第一届环法自行车赛');
INSERT INTO `history_today` VALUES ('184', '1912', '1', '19', '南京临时政府实行学校改革，原教科书废除');
INSERT INTO `history_today` VALUES ('185', '1916', '1', '19', '袁英暗杀袁世凯未遂');
INSERT INTO `history_today` VALUES ('186', '1923', '1', '19', '法国宣布发明了射程90公里的新火炮');
INSERT INTO `history_today` VALUES ('187', '1934', '1', '19', '伪满洲国在日本关东军的导演下，在吉林长春恢复帝制。中国清朝最后一个皇帝溥仪又当上康德皇帝，并宣布将“满洲国”改称为“大满洲帝国”');
INSERT INTO `history_today` VALUES ('188', '1946', '1', '19', '远东国际军事法庭成立');
INSERT INTO `history_today` VALUES ('189', '1960', '1', '19', '中国科学院原子能所的游泳池式研究反应堆工程开工。同年2月12日，铀浓缩式试验室建成，并正式移交使用。');
INSERT INTO `history_today` VALUES ('190', '1960', '1', '19', '波音707首次通航');
INSERT INTO `history_today` VALUES ('191', '1967', '1', '19', '越战美军周伤亡数字达到最高点');
INSERT INTO `history_today` VALUES ('192', '1259', '1', '20', '英格兰议会首次举行会议');
INSERT INTO `history_today` VALUES ('193', '1907', '1', '20', '瑞士公民投票反对教会与国家分离');
INSERT INTO `history_today` VALUES ('194', '1920', '1', '20', '美国在赤色恐惧的搜捕中有3000人被捕');
INSERT INTO `history_today` VALUES ('195', '1924', '1', '20', '第一次国共合作（中国国民党第一次全国代表大会召开）。 ');
INSERT INTO `history_today` VALUES ('196', '1930', '1', '20', '美国飞行员林白以14.75小时创横跨美国飞行纪录');
INSERT INTO `history_today` VALUES ('197', '1931', '1', '20', '欧洲失业人数创记录');
INSERT INTO `history_today` VALUES ('198', '1931', '1', '20', '中共处分罗章龙、王克金等');
INSERT INTO `history_today` VALUES ('199', '1933', '1', '20', '美国第32任总统罗斯福就职');
INSERT INTO `history_today` VALUES ('200', '1934', '1', '20', '伪满实行帝制，溥仪又当皇帝');
INSERT INTO `history_today` VALUES ('201', '1936', '1', '20', '英国乔治五世去世，爱德华八世即位');
INSERT INTO `history_today` VALUES ('202', '1895', '1', '21', '日本决定占领钓鱼岛');
INSERT INTO `history_today` VALUES ('203', '1899', '1', '21', '欧宝公司开始生产汽车');
INSERT INTO `history_today` VALUES ('204', '1900', '1', '21', '加拿大军队启程前往南非参加布尔战争');
INSERT INTO `history_today` VALUES ('205', '1911', '1', '21', '美国劳斯首次提出癌肿瘤是病毒所致');
INSERT INTO `history_today` VALUES ('206', '1919', '1', '21', '爱尔兰宣布独立，尚在狱中的德瓦勒拉当选总统');
INSERT INTO `history_today` VALUES ('207', '1930', '1', '21', '伦敦海军会议开幕');
INSERT INTO `history_today` VALUES ('208', '1934', '1', '21', '中华苏维埃第二次全国代表大会召开');
INSERT INTO `history_today` VALUES ('209', '1936', '1', '21', '“爱江山还是爱美人”——英王爱德华八世的痛苦选择');
INSERT INTO `history_today` VALUES ('210', '1937', '1', '21', '红军西路军西征失败，董振堂牺牲');
INSERT INTO `history_today` VALUES ('211', '1937', '1', '21', '中国人民抗日军政大学成立');
INSERT INTO `history_today` VALUES ('212', '1878', '1', '22', '祖鲁在伊山得瓦纳战役（Battle of Isandlwana）中击败英国军队');
INSERT INTO `history_today` VALUES ('213', '1902', '1', '22', '英国维多利亚女王逝世，爱德华七世继位');
INSERT INTO `history_today` VALUES ('214', '1905', '1', '22', '俄国1905年革命');
INSERT INTO `history_today` VALUES ('215', '1905', '1', '22', '彼得堡的“流血星期日”');
INSERT INTO `history_today` VALUES ('216', '1916', '1', '22', '《民国日报》创刊');
INSERT INTO `history_today` VALUES ('217', '1924', '1', '22', '英国工党首次执政');
INSERT INTO `history_today` VALUES ('218', '1928', '1', '22', '朱德、陈毅领导湘南起义');
INSERT INTO `history_today` VALUES ('219', '1944', '1', '22', '二战期间盟军在意大利安齐奥登陆');
INSERT INTO `history_today` VALUES ('220', '1946', '1', '22', '廖承志获释');
INSERT INTO `history_today` VALUES ('221', '1949', '1', '22', '李宗仁接受中共谈判条件');
INSERT INTO `history_today` VALUES ('222', '1368', '1', '23', '朱元璋建立明朝');
INSERT INTO `history_today` VALUES ('223', '1719', '1', '23', '神圣罗马帝国皇帝查理四世允许列支敦士登公国独立');
INSERT INTO `history_today` VALUES ('224', '1923', '1', '23', '中国第一座民办广播电台开始播音');
INSERT INTO `history_today` VALUES ('225', '1937', '1', '23', '苏联布哈林等17名共产党领导人被判死刑');
INSERT INTO `history_today` VALUES ('226', '1940', '1', '23', '汪精卫等人决定成立伪南京政府');
INSERT INTO `history_today` VALUES ('227', '1941', '1', '23', '重建新四军军部');
INSERT INTO `history_today` VALUES ('228', '1943', '1', '23', '英国第八军攻占的黎波里');
INSERT INTO `history_today` VALUES ('229', '1945', '1', '23', '苏军进抵奥德河');
INSERT INTO `history_today` VALUES ('230', '1947', '1', '23', '国民党统治区物价一天内上涨二三倍');
INSERT INTO `history_today` VALUES ('231', '1956', '1', '23', '1956年到1967年全国农业发展纲要发表');
INSERT INTO `history_today` VALUES ('232', '1859', '1', '24', '瓦拉几亚和摩尔达维亚两公国在亚历山大·约翰·库扎的领导下联合成为罗马尼亚');
INSERT INTO `history_today` VALUES ('233', '1888', '1', '24', '雅克布·L·沃特曼得到打字机色带的专利');
INSERT INTO `history_today` VALUES ('234', '1891', '1', '24', '约翰·巴兰斯任新西兰总理');
INSERT INTO `history_today` VALUES ('235', '1900', '1', '24', '慈禧立端王载漪子溥隽为大阿哥（皇储），谋废光绪帝。');
INSERT INTO `history_today` VALUES ('236', '1900', '1', '24', '南非布尔人军队在斯皮翁高地战败');
INSERT INTO `history_today` VALUES ('237', '1915', '1', '24', '英军击沉德国“布柳彻”号战舰');
INSERT INTO `history_today` VALUES ('238', '1921', '1', '24', '协约国就德国的战争赔款问题举行会谈');
INSERT INTO `history_today` VALUES ('239', '1924', '1', '24', '彼得堡改称列宁格勒');
INSERT INTO `history_today` VALUES ('240', '1924', '1', '24', '黄埔军校开始筹建。 ');
INSERT INTO `history_today` VALUES ('241', '1936', '1', '24', '埃塞俄比亚军队在马加里抗击意大利');
INSERT INTO `history_today` VALUES ('242', '1327', '1', '25', '英王爱德华三世加冕');
INSERT INTO `history_today` VALUES ('243', '1504', '1', '25', '意大利艺术家米开朗琪罗完成大卫巨像雕刻');
INSERT INTO `history_today` VALUES ('244', '1554', '1', '25', '巴西圣保罗市建立');
INSERT INTO `history_today` VALUES ('245', '1755', '1', '25', '俄罗斯女沙皇伊丽莎白·彼得罗芙娜下令建立莫斯科大学');
INSERT INTO `history_today` VALUES ('246', '1787', '1', '25', '2000名美国起义军攻占军火库，被1200名政府军镇压');
INSERT INTO `history_today` VALUES ('247', '1791', '1', '25', '英国国会决议把魁北克分成为上加拿大和下加拿大两部分');
INSERT INTO `history_today` VALUES ('248', '1831', '1', '25', '波兰国王尼古拉一世被国会废黜');
INSERT INTO `history_today` VALUES ('249', '1881', '1', '25', '爱迪生和贝尔成立东方电话公司');
INSERT INTO `history_today` VALUES ('250', '1901', '1', '25', '美国众议院提出法案禁止中国移民入境');
INSERT INTO `history_today` VALUES ('251', '1911', '1', '25', '中国第一部专门刑法典颁布');
INSERT INTO `history_today` VALUES ('252', '1210', '1', '26', '陆游逝世');
INSERT INTO `history_today` VALUES ('253', '1291', '1', '26', '元世祖命郭守敬开凿通惠河');
INSERT INTO `history_today` VALUES ('254', '1788', '1', '26', '澳大利亚国庆日');
INSERT INTO `history_today` VALUES ('255', '1841', '1', '26', '英国占领香港岛，香港开始成为英国殖民地');
INSERT INTO `history_today` VALUES ('256', '1885', '1', '26', '苏丹马赫迪起义军攻克喀土穆，成立独立国家');
INSERT INTO `history_today` VALUES ('257', '1910', '1', '26', '巴黎卢浮宫被洪水包围造成上亿美元损失');
INSERT INTO `history_today` VALUES ('258', '1923', '1', '26', '孙中山与苏俄代表越飞发表联合宣言');
INSERT INTO `history_today` VALUES ('259', '1925', '1', '26', '中国社会主义青年团改名为中国共产主义青年团');
INSERT INTO `history_today` VALUES ('260', '1934', '1', '26', '德国和波兰在柏林签订《互不侵犯条约》');
INSERT INTO `history_today` VALUES ('261', '1939', '1', '26', '佛朗哥占领巴塞罗那，标志着西班牙长达35年的独裁统治正式确立');
INSERT INTO `history_today` VALUES ('262', '1822', '1', '27', '文明古国希腊独立');
INSERT INTO `history_today` VALUES ('263', '1841', '1', '27', '第一次鸦片战争：道光帝向英国宣战');
INSERT INTO `history_today` VALUES ('264', '1888', '1', '27', '国家地理学会成立');
INSERT INTO `history_today` VALUES ('265', '1903', '1', '27', '中葡两国订立澳门有关章程');
INSERT INTO `history_today` VALUES ('266', '1913', '1', '27', '美国运动员吉米-索普退还授予他的奥运会奖牌');
INSERT INTO `history_today` VALUES ('267', '1924', '1', '27', '南斯拉夫将阜姆让给意大利');
INSERT INTO `history_today` VALUES ('268', '1926', '1', '27', '电视诞生');
INSERT INTO `history_today` VALUES ('269', '1928', '1', '27', '电视诞生。');
INSERT INTO `history_today` VALUES ('270', '1937', '1', '27', '美国遭受严重水灾，100万人无家可归');
INSERT INTO `history_today` VALUES ('271', '1945', '1', '27', '苏军解放奥斯维辛集中营');
INSERT INTO `history_today` VALUES ('272', '1005', '1', '28', '宋辽澶渊之盟');
INSERT INTO `history_today` VALUES ('273', '1115', '1', '28', '完颜阿骨打建立金朝');
INSERT INTO `history_today` VALUES ('274', '1123', '1', '28', '崇德天皇任日本天皇');
INSERT INTO `history_today` VALUES ('275', '1132', '1', '28', '中国南宋名将韩世忠用云梯、火炮攻打建州城');
INSERT INTO `history_today` VALUES ('276', '1662', '1', '28', '驻台湾的荷兰军队向郑成功投降');
INSERT INTO `history_today` VALUES ('277', '1917', '1', '28', '《甲寅日刊》创刊');
INSERT INTO `history_today` VALUES ('278', '1918', '1', '28', '苏联红军成立，立宪会议解散 ');
INSERT INTO `history_today` VALUES ('279', '1930', '1', '28', '禁酒法实施十年，酒精中毒患者急剧增加');
INSERT INTO `history_today` VALUES ('280', '1930', '1', '28', '西班牙独裁者德里维拉辞职');
INSERT INTO `history_today` VALUES ('281', '1931', '1', '28', '纳维罗任巴拉圭总统');
INSERT INTO `history_today` VALUES ('282', '1901', '1', '29', '清廷下诏“变法”实行“新政”');
INSERT INTO `history_today` VALUES ('283', '1903', '1', '29', '湖北留日学生李书城等在东京创办《湖北学生界》');
INSERT INTO `history_today` VALUES ('284', '1903', '1', '29', '马君武等呼吁“排满”革命');
INSERT INTO `history_today` VALUES ('285', '1906', '1', '29', '《官场现形记》出版');
INSERT INTO `history_today` VALUES ('286', '1906', '1', '29', '电影在京城大受欢迎');
INSERT INTO `history_today` VALUES ('287', '1916', '1', '29', '德军首次动用飞艇袭击巴黎');
INSERT INTO `history_today` VALUES ('288', '1920', '1', '29', '天津“廿九”惨案');
INSERT INTO `history_today` VALUES ('289', '1927', '1', '29', '美国平均每6人有一辆汽车，居世界之首');
INSERT INTO `history_today` VALUES ('290', '1935', '1', '29', '长征红军开始四渡赤水');
INSERT INTO `history_today` VALUES ('291', '1944', '1', '29', '纳粹计划培育雅利安优秀民族');
INSERT INTO `history_today` VALUES ('292', '1649', '1', '30', '英国国王查理一世被处死');
INSERT INTO `history_today` VALUES ('293', '1820', '1', '30', '南极洲被发现');
INSERT INTO `history_today` VALUES ('294', '1902', '1', '30', '日本成为英国在太平洋地区的盟国。');
INSERT INTO `history_today` VALUES ('295', '1911', '1', '30', '湖北革命党人在武昌成立文学社');
INSERT INTO `history_today` VALUES ('296', '1912', '1', '30', '英上院否决爱尔兰自治提案');
INSERT INTO `history_today` VALUES ('297', '1914', '1', '30', '好莱坞成为世界电影中心');
INSERT INTO `history_today` VALUES ('298', '1926', '1', '30', '英军撤出莱茵区');
INSERT INTO `history_today` VALUES ('299', '1928', '1', '30', '两广战争：桂系胜粤系');
INSERT INTO `history_today` VALUES ('300', '1933', '1', '30', '希特勒被任命为德国总理');
INSERT INTO `history_today` VALUES ('301', '1937', '1', '30', '希特勒保证不侵犯比利时与荷兰的中立');
INSERT INTO `history_today` VALUES ('302', '1906', '1', '31', '女权主义者不惜通过暴力以获得参政权');
INSERT INTO `history_today` VALUES ('303', '1917', '1', '31', '德宣布无限制潜艇战');
INSERT INTO `history_today` VALUES ('304', '1923', '1', '31', '德国出现严重通货膨胀');
INSERT INTO `history_today` VALUES ('305', '1927', '1', '31', '英军开往上海，中国奋起反抗');
INSERT INTO `history_today` VALUES ('306', '1932', '1', '31', '李杜组建吉林自卫军，联合抗日');
INSERT INTO `history_today` VALUES ('307', '1934', '1', '31', '罗斯福使美元贬值40%');
INSERT INTO `history_today` VALUES ('308', '1942', '1', '31', '日军进入马尼拉');
INSERT INTO `history_today` VALUES ('309', '1943', '1', '31', '德军在斯大林格勒投降');
INSERT INTO `history_today` VALUES ('310', '1945', '1', '31', '苏军连续向柏林外围发动进攻');
INSERT INTO `history_today` VALUES ('311', '1949', '1', '31', '平津战役结束，北平和平解放');
INSERT INTO `history_today` VALUES ('312', '1587', '2', '1', '英国伊丽莎白女王一世签署命令，处死苏格兰的玛丽女王');
INSERT INTO `history_today` VALUES ('313', '1662', '2', '1', '郑成功收复台湾');
INSERT INTO `history_today` VALUES ('314', '1727', '2', '1', '西班牙包围直布罗陀，英国和西班牙不宣而战');
INSERT INTO `history_today` VALUES ('315', '1734', '2', '1', '土耳其、波斯战争开始');
INSERT INTO `history_today` VALUES ('316', '1793', '2', '1', '法国对荷兰和英国宣战');
INSERT INTO `history_today` VALUES ('317', '1901', '2', '1', '清廷下旨护洋保教');
INSERT INTO `history_today` VALUES ('318', '1902', '2', '1', '光绪帝下旨准许汉满通婚');
INSERT INTO `history_today` VALUES ('319', '1903', '2', '1', '德、意、英取消了对委内瑞拉的封锁');
INSERT INTO `history_today` VALUES ('320', '1909', '2', '1', '万国禁烟会在上海召开');
INSERT INTO `history_today` VALUES ('321', '1913', '2', '1', '中国参加首届远东运动会');
INSERT INTO `history_today` VALUES ('322', '1535', '2', '2', '阿根廷城市布宜诺斯艾利斯建成');
INSERT INTO `history_today` VALUES ('323', '1895', '2', '2', '威海卫被日军占领');
INSERT INTO `history_today` VALUES ('324', '1913', '2', '2', '世界最大的火车站——纽约中央火车站启用');
INSERT INTO `history_today` VALUES ('325', '1919', '2', '2', '葡萄牙宣布成立君主国');
INSERT INTO `history_today` VALUES ('326', '1920', '2', '2', '胡适启用新式标点符号。');
INSERT INTO `history_today` VALUES ('327', '1920', '2', '2', '爱沙尼亚同苏联签订和约并宣布独立');
INSERT INTO `history_today` VALUES ('328', '1922', '2', '2', '华盛顿会议拒绝中国要求废除21条的要求');
INSERT INTO `history_today` VALUES ('329', '1923', '2', '2', '英国从爱尔兰撤军，爱尔兰26个郡成立“自由邦”');
INSERT INTO `history_today` VALUES ('330', '1928', '2', '2', '蒋介石再次独揽国民党党政军大权');
INSERT INTO `history_today` VALUES ('331', '1932', '2', '2', '南京政府密令海空军不准配合十九路军对日作战');
INSERT INTO `history_today` VALUES ('332', '1783', '2', '3', '美国独立战争：西班牙承认美国独立');
INSERT INTO `history_today` VALUES ('333', '1901', '2', '3', '日本民间军国主义团体黑龙会成立。');
INSERT INTO `history_today` VALUES ('334', '1936', '2', '3', '红军抗日先锋军渡河东征');
INSERT INTO `history_today` VALUES ('335', '1945', '2', '3', '二战期间美国军队从日本人手里夺回马尼拉');
INSERT INTO `history_today` VALUES ('336', '1947', '2', '3', '电影《八千里路云和月》广受欢迎');
INSERT INTO `history_today` VALUES ('337', '1952', '2', '3', '中共要求“三反”运动和整党运动相结合');
INSERT INTO `history_today` VALUES ('338', '1958', '2', '3', '荷兰、比利时、卢森堡成立经济联合体');
INSERT INTO `history_today` VALUES ('339', '1959', '2', '3', '我国大量援助越南');
INSERT INTO `history_today` VALUES ('340', '1966', '2', '3', '中央文化革命小组拟定《二月提纲》');
INSERT INTO `history_today` VALUES ('341', '1966', '2', '3', '《解放军报》发表题为《永远突出政治》的社论');
INSERT INTO `history_today` VALUES ('342', '1861', '2', '4', '美利坚联盟国(邦联)建立');
INSERT INTO `history_today` VALUES ('343', '1898', '2', '4', '清政府印造昭信股票');
INSERT INTO `history_today` VALUES ('344', '1903', '2', '4', '二十世纪中国首例伪钞案，主犯均为日本人');
INSERT INTO `history_today` VALUES ('345', '1922', '2', '4', '印度乔里乔拉发生村民反抗英殖民统治事件');
INSERT INTO `history_today` VALUES ('346', '1922', '2', '4', '中国被迫签订《解决山东悬案条例》');
INSERT INTO `history_today` VALUES ('347', '1932', '2', '4', '“一·二八”事件战争规模升级');
INSERT INTO `history_today` VALUES ('348', '1936', '2', '4', '获诺贝尔奖的美籍华人——丁肇中诞辰');
INSERT INTO `history_today` VALUES ('349', '1945', '2', '4', '雅尔塔会议召开，中国丧失部分主权');
INSERT INTO `history_today` VALUES ('350', '1948', '2', '4', '缅甸脱离英联邦宣布独立，建立缅甸联邦');
INSERT INTO `history_today` VALUES ('351', '1948', '2', '4', '缅甸联邦成立');
INSERT INTO `history_today` VALUES ('352', '1500', '2', '5', '意大利从法国人手里收复了米兰');
INSERT INTO `history_today` VALUES ('353', '1649', '2', '5', '苏格兰人宣告查里二世成为爱丁堡国王');
INSERT INTO `history_today` VALUES ('354', '1900', '2', '5', '摩根组建资产为10亿美元的钢铁公司');
INSERT INTO `history_today` VALUES ('355', '1901', '2', '5', '摩根购并钢铁公司成为钢铁巨头');
INSERT INTO `history_today` VALUES ('356', '1912', '2', '5', '民国政府的第一家银行——中国银行在上海开业');
INSERT INTO `history_today` VALUES ('357', '1919', '2', '5', '“黄色国际”建立');
INSERT INTO `history_today` VALUES ('358', '1922', '2', '5', '美国杂志《读者文摘》创刊');
INSERT INTO `history_today` VALUES ('359', '1927', '2', '5', '毛泽东考察湖南农民运动结束');
INSERT INTO `history_today` VALUES ('360', '1929', '2', '5', '国民党政府将奉天省改名为辽宁省');
INSERT INTO `history_today` VALUES ('361', '1940', '2', '5', '十四世达赖喇嘛丹增嘉措坐床');
INSERT INTO `history_today` VALUES ('362', '1689', '2', '6', '英国发生“光荣革命”事件');
INSERT INTO `history_today` VALUES ('363', '1788', '2', '6', '麻萨诸塞州成为第六个批准美国宪法的州');
INSERT INTO `history_today` VALUES ('364', '1840', '2', '6', '英国与毛利人签署《怀唐伊条约》，新西兰成为英国殖民地');
INSERT INTO `history_today` VALUES ('365', '1908', '2', '6', '上海首次试行有轨电车');
INSERT INTO `history_today` VALUES ('366', '1909', '2', '6', '我国延续二千多年的奴婢制度宣告终结');
INSERT INTO `history_today` VALUES ('367', '1919', '2', '6', '德国魏玛共和国建立');
INSERT INTO `history_today` VALUES ('368', '1922', '2', '6', '侵犯中国主权的“九国公约”在华盛顿签订');
INSERT INTO `history_today` VALUES ('369', '1928', '2', '6', '周文雍和陈铁军举行“刑场上的婚礼”');
INSERT INTO `history_today` VALUES ('370', '1937', '2', '6', '张国焘向中共中央检讨错误');
INSERT INTO `history_today` VALUES ('371', '1938', '2', '6', '八路军改为第十八集团军');
INSERT INTO `history_today` VALUES ('372', '1807', '2', '7', '拿破仑率领的法国军队和俄国、普鲁士等国组成的第四次反法同盟在东普鲁士相遇，埃劳战役爆发');
INSERT INTO `history_today` VALUES ('373', '1914', '2', '7', '北京政府统一币制');
INSERT INTO `history_today` VALUES ('374', '1923', '2', '7', '京汉铁路工人大罢工');
INSERT INTO `history_today` VALUES ('375', '1939', '2', '7', '国民党成立国防最高委员会，蒋介石为委员长');
INSERT INTO `history_today` VALUES ('376', '1947', '2', '7', '东北解放军牡丹江军分区战斗英雄杨子荣生擒“座山雕”张乐山。 ');
INSERT INTO `history_today` VALUES ('377', '1955', '2', '7', '人大常委会改志愿兵役制为义务兵役制');
INSERT INTO `history_today` VALUES ('378', '1957', '2', '7', '我国与斯里兰卡建交');
INSERT INTO `history_today` VALUES ('379', '1959', '2', '7', '朱德对农村办公共食堂提出异议');
INSERT INTO `history_today` VALUES ('380', '1959', '2', '7', '中苏签订经济合作协定');
INSERT INTO `history_today` VALUES ('381', '1961', '2', '7', '中央决定减少全国招生腾出力量加强农业建设');
INSERT INTO `history_today` VALUES ('382', '1902', '2', '8', '梁启超创办《新民丛报》');
INSERT INTO `history_today` VALUES ('383', '1904', '2', '8', '日俄战争爆发');
INSERT INTO `history_today` VALUES ('384', '1926', '2', '8', '美国考古探察队在墨西哥发现玛雅金字塔');
INSERT INTO `history_today` VALUES ('385', '1931', '2', '8', '中共发布土改政策，使农民获得更多的土地所有权');
INSERT INTO `history_today` VALUES ('386', '1945', '2', '8', '英美盟军开始向莱茵河地区发起进攻。');
INSERT INTO `history_today` VALUES ('387', '1946', '2', '8', '北朝鲜临时人民委员会建立，选举金日成为委员长');
INSERT INTO `history_today` VALUES ('388', '1946', '2', '8', '国民党军在东北大举进攻');
INSERT INTO `history_today` VALUES ('389', '1949', '2', '8', '中共中央军委发出《把军队变为工作队》的指示');
INSERT INTO `history_today` VALUES ('390', '1956', '2', '8', '周恩来作《经济工作要实事求是》的发言');
INSERT INTO `history_today` VALUES ('391', '1966', '2', '8', '意大利专家试图挽救比萨斜塔的不断倾斜');
INSERT INTO `history_today` VALUES ('392', '1849', '2', '9', '罗马共和国宣布成立');
INSERT INTO `history_today` VALUES ('393', '1863', '2', '9', '红十字国际委员会在瑞士的日内瓦成立');
INSERT INTO `history_today` VALUES ('394', '1900', '2', '9', '世界网球赛戴维斯杯产生');
INSERT INTO `history_today` VALUES ('395', '1916', '2', '9', '中国足球队首次出国比赛');
INSERT INTO `history_today` VALUES ('396', '1919', '2', '9', '首次开创巴黎飞往伦敦的商业性飞行');
INSERT INTO `history_today` VALUES ('397', '1921', '2', '9', '蒙古活佛宣布外蒙独立');
INSERT INTO `history_today` VALUES ('398', '1925', '2', '9', '上海日资纱厂工人举行大罢工');
INSERT INTO `history_today` VALUES ('399', '1928', '2', '9', '共产国际对中共作出新指示');
INSERT INTO `history_today` VALUES ('400', '1940', '2', '9', '八路军重创顽军石友三部');
INSERT INTO `history_today` VALUES ('401', '1941', '2', '9', '德国军队在隆美尔率领下从意大利进入北非');
INSERT INTO `history_today` VALUES ('402', '1763', '2', '10', '巴黎和约的签订结束了七年战争');
INSERT INTO `history_today` VALUES ('403', '1906', '2', '10', '英国第一艘“无畏”号战舰下水');
INSERT INTO `history_today` VALUES ('404', '1907', '2', '10', '中国勘定第一口油井');
INSERT INTO `history_today` VALUES ('405', '1922', '2', '10', '印度国大党停止“不合作运动”');
INSERT INTO `history_today` VALUES ('406', '1931', '2', '10', '王明提出“左”倾冒险主义的政治纲领');
INSERT INTO `history_today` VALUES ('407', '1935', '2', '10', '考古学家发现已知最古老的城市');
INSERT INTO `history_today` VALUES ('408', '1937', '2', '10', '中共对国民党提出建立抗日民族统一战线');
INSERT INTO `history_today` VALUES ('409', '1938', '2', '10', '晋察冀边区实行减租减息');
INSERT INTO `history_today` VALUES ('410', '1939', '2', '10', '中共中央向全党发出《中央关于河北等地摩擦问题的指示》');
INSERT INTO `history_today` VALUES ('411', '1939', '2', '10', '日本军队占领中国的海南岛');
INSERT INTO `history_today` VALUES ('412', '1855', '2', '11', '石达开率太平军在江西湖口大败曾国藩的湘军');
INSERT INTO `history_today` VALUES ('413', '1895', '2', '11', '北洋海军在威海刘公岛向日本军队投降，全军覆灭');
INSERT INTO `history_today` VALUES ('414', '1897', '2', '11', '商务印书馆在上海成立');
INSERT INTO `history_today` VALUES ('415', '1900', '2', '11', '清廷令挖康梁祖墓，购“二犯”人头');
INSERT INTO `history_today` VALUES ('416', '1908', '2', '11', '爱迪生获得发明电影放映机专利权');
INSERT INTO `history_today` VALUES ('417', '1908', '2', '11', '俄克拉荷马州成为美国第46个州');
INSERT INTO `history_today` VALUES ('418', '1936', '2', '11', '卓别林的《摩登时代》在伦敦上演');
INSERT INTO `history_today` VALUES ('419', '1937', '2', '11', '国共两党就合作问题在西安谈判');
INSERT INTO `history_today` VALUES ('420', '1958', '2', '11', '《汉语拼音方案》颁布实施');
INSERT INTO `history_today` VALUES ('421', '1963', '2', '11', '中央决定在农村开展“四清”运动');
INSERT INTO `history_today` VALUES ('422', '1138', '2', '12', '金国颁布女真文字');
INSERT INTO `history_today` VALUES ('423', '1908', '2', '12', '中国第一家钢铁联合企业成立');
INSERT INTO `history_today` VALUES ('424', '1910', '2', '12', '十三世达赖喇嘛逃往印度');
INSERT INTO `history_today` VALUES ('425', '1912', '2', '12', '清朝末代皇帝溥仪（宣统）宣布退位，延续两千多年的封建帝制结束。');
INSERT INTO `history_today` VALUES ('426', '1922', '2', '12', '意选出新教皇命名庇护十一世');
INSERT INTO `history_today` VALUES ('427', '1924', '2', '12', '格什温的奇迹《蓝色狂想曲》问世');
INSERT INTO `history_today` VALUES ('428', '1924', '2', '12', '国王图特安哈门的石棺于3300年后打开');
INSERT INTO `history_today` VALUES ('429', '1930', '2', '12', '中国自由大同盟成立');
INSERT INTO `history_today` VALUES ('430', '1934', '2', '12', '法国人民平息法西斯分子的暴乱');
INSERT INTO `history_today` VALUES ('431', '1939', '2', '12', '柯棣华随印度援华医疗队抵达延安');
INSERT INTO `history_today` VALUES ('432', '1895', '2', '13', '清政府派李鸿章赴日议和');
INSERT INTO `history_today` VALUES ('433', '1896', '2', '13', '俄国在华开设银行');
INSERT INTO `history_today` VALUES ('434', '1907', '2', '13', '英国要求参政的妇女冲击国会');
INSERT INTO `history_today` VALUES ('435', '1907', '2', '13', '康有为将保皇会改称“国民宪政会”');
INSERT INTO `history_today` VALUES ('436', '1912', '2', '13', '孙中山请辞临时大总统');
INSERT INTO `history_today` VALUES ('437', '1928', '2', '13', '英国医学家弗莱明发现青霉素');
INSERT INTO `history_today` VALUES ('438', '1930', '2', '13', '中国自由大同盟成立。');
INSERT INTO `history_today` VALUES ('439', '1931', '2', '13', '抚顺三千矿工死于事故');
INSERT INTO `history_today` VALUES ('440', '1935', '2', '13', '三年南方游击战');
INSERT INTO `history_today` VALUES ('441', '1943', '2', '13', '日军将唐玄奘头盖骨交给汪伪政府');
INSERT INTO `history_today` VALUES ('442', '1859', '2', '14', '美国合并俄勒冈州');
INSERT INTO `history_today` VALUES ('443', '1876', '2', '14', '亚历山大·贝尔获得电话的专利');
INSERT INTO `history_today` VALUES ('444', '1879', '2', '14', '智利同玻利维亚、秘鲁两国爆发太平洋战争');
INSERT INTO `history_today` VALUES ('445', '1901', '2', '14', '清朝下令惩办反洋教的王公大臣');
INSERT INTO `history_today` VALUES ('446', '1912', '2', '14', '孙中山辞去临时大总统一职');
INSERT INTO `history_today` VALUES ('447', '1924', '2', '14', '国际商业机器有限公司（即IBM）成立');
INSERT INTO `history_today` VALUES ('448', '1946', '2', '14', '世界上第一台电子计算机(ENIAC)在美国宾夕法尼亚大学诞生');
INSERT INTO `history_today` VALUES ('449', '1949', '2', '14', '李宗仁派和平使团与中共谈判');
INSERT INTO `history_today` VALUES ('450', '1949', '2', '14', '美国谋求台湾独立失败');
INSERT INTO `history_today` VALUES ('451', '1950', '2', '14', '《中苏友好同盟互助条约》在莫斯科签订');
INSERT INTO `history_today` VALUES ('452', '1764', '2', '15', '美国城市圣路易斯建立');
INSERT INTO `history_today` VALUES ('453', '1898', '2', '15', '美西战争爆发');
INSERT INTO `history_today` VALUES ('454', '1904', '2', '15', '反清组织华兴会成立');
INSERT INTO `history_today` VALUES ('455', '1912', '2', '15', '袁世凯任临时大总统');
INSERT INTO `history_today` VALUES ('456', '1913', '2', '15', '汉字注音字母诞生');
INSERT INTO `history_today` VALUES ('457', '1935', '2', '15', '东北抗日联军发表统一建制宣言');
INSERT INTO `history_today` VALUES ('458', '1937', '2', '15', '国民党内外政策开始转变');
INSERT INTO `history_today` VALUES ('459', '1942', '2', '15', '新加坡落入日军手中');
INSERT INTO `history_today` VALUES ('460', '1948', '2', '15', '解放区土地改革开始');
INSERT INTO `history_today` VALUES ('461', '1950', '2', '15', '迪士尼电影《仙履奇缘》诞生');
INSERT INTO `history_today` VALUES ('462', '1870', '2', '16', '普法战争，法国失败');
INSERT INTO `history_today` VALUES ('463', '1909', '2', '16', '南洋兄弟烟草公司重新崛起');
INSERT INTO `history_today` VALUES ('464', '1910', '2', '16', '同盟会分裂，孙中山、章太炎分道扬镳');
INSERT INTO `history_today` VALUES ('465', '1930', '2', '16', '红军有了第一架飞机——“列宁”号');
INSERT INTO `history_today` VALUES ('466', '1932', '2', '16', '日本侵略者策划成立“满洲国”');
INSERT INTO `history_today` VALUES ('467', '1935', '2', '16', '红军取得长征以来第一次重大胜利');
INSERT INTO `history_today` VALUES ('468', '1943', '2', '16', '在第二次世界大战中，苏军从德军手中收复哈尔科夫');
INSERT INTO `history_today` VALUES ('469', '1945', '2', '16', '美国空军猛袭东京');
INSERT INTO `history_today` VALUES ('470', '1955', '2', '16', '中共中央统战工作方针确定');
INSERT INTO `history_today` VALUES ('471', '1959', '2', '16', '菲德尔·卡斯特罗就任古巴总理');
INSERT INTO `history_today` VALUES ('472', '1616', '2', '17', '努尔哈赤即汗位，建立“大金国”，史称后金');
INSERT INTO `history_today` VALUES ('473', '1895', '2', '17', '北洋水师全军覆没，中日甲午战争以中国彻底失败而告终');
INSERT INTO `history_today` VALUES ('474', '1905', '2', '17', '革命党人杀死俄国大公');
INSERT INTO `history_today` VALUES ('475', '1916', '2', '17', '英、法军队在一次大战中占领德国殖民地喀麦隆');
INSERT INTO `history_today` VALUES ('476', '1930', '2', '17', '中外签约中国法律行于租界');
INSERT INTO `history_today` VALUES ('477', '1933', '2', '17', '日军向热河发起进攻');
INSERT INTO `history_today` VALUES ('478', '1933', '2', '17', '宋庆龄在上海莫利哀路住宅内宴请肖伯纳后留影');
INSERT INTO `history_today` VALUES ('479', '1936', '2', '17', '英国和爱尔兰签订贸易条约，关税战结束');
INSERT INTO `history_today` VALUES ('480', '1936', '2', '17', '中共发布《东征宣言》');
INSERT INTO `history_today` VALUES ('481', '1938', '2', '17', '朱德与阎锡山、卫立煌共同制订作战计划');
INSERT INTO `history_today` VALUES ('482', '1885', '2', '18', '马克·吐温的《哈克贝利·费恩历险记》首次出版');
INSERT INTO `history_today` VALUES ('483', '1901', '2', '18', '本世纪最初的十年，移民潮水般地涌入美国');
INSERT INTO `history_today` VALUES ('484', '1905', '2', '18', '留日爱国学生发起成立抗俄铁血会');
INSERT INTO `history_today` VALUES ('485', '1917', '2', '18', '陈独秀倡导文学革命');
INSERT INTO `history_today` VALUES ('486', '1918', '2', '18', '山东蒲台处黄河因冰块堵塞河道而决口（此处具体日期有待考证，一说2月17日）');
INSERT INTO `history_today` VALUES ('487', '1918', '2', '18', '德国全线进攻苏联');
INSERT INTO `history_today` VALUES ('488', '1931', '2', '18', '性科学的传播者张竞生遭受不公平待遇');
INSERT INTO `history_today` VALUES ('489', '1936', '2', '18', '红军东征');
INSERT INTO `history_today` VALUES ('490', '1938', '2', '18', '八路军破袭同蒲、正太铁路');
INSERT INTO `history_today` VALUES ('491', '1938', '2', '18', '中日武汉空战，五烈士牺牲 武汉民众庆祝空军胜利');
INSERT INTO `history_today` VALUES ('492', '1878', '2', '19', '保加利亚人民共和国独立');
INSERT INTO `history_today` VALUES ('493', '1878', '2', '19', '托马斯·爱迪生获得留声机的专利权');
INSERT INTO `history_today` VALUES ('494', '1900', '2', '19', '清廷欲禁义和拳');
INSERT INTO `history_today` VALUES ('495', '1901', '2', '19', '开平矿务局易主');
INSERT INTO `history_today` VALUES ('496', '1907', '2', '19', '黄冈起义失败。');
INSERT INTO `history_today` VALUES ('497', '1934', '2', '19', '蒋介石发起“新生活运动”');
INSERT INTO `history_today` VALUES ('498', '1934', '2', '19', '上海149种书籍被禁。');
INSERT INTO `history_today` VALUES ('499', '1936', '2', '19', '红军与东北军达成协议');
INSERT INTO `history_today` VALUES ('500', '1941', '2', '19', '德国空军恢复对伦敦的大规模空袭');
INSERT INTO `history_today` VALUES ('501', '1942', '2', '19', '日本飞机首次袭击澳洲大陆——澳大利亚达尔文港');
INSERT INTO `history_today` VALUES ('502', '1897', '2', '20', '大清邮政在北京开办');
INSERT INTO `history_today` VALUES ('503', '1911', '2', '20', '东三省鼠疫流行');
INSERT INTO `history_today` VALUES ('504', '1915', '2', '20', '巴拿马运河开通');
INSERT INTO `history_today` VALUES ('505', '1918', '2', '20', '德军向苏维埃俄国发起猛烈进攻');
INSERT INTO `history_today` VALUES ('506', '1919', '2', '20', '南北议和在上海举行');
INSERT INTO `history_today` VALUES ('507', '1925', '2', '20', '上海棉纱厂工人罢工');
INSERT INTO `history_today` VALUES ('508', '1930', '2', '20', '安阳“殷墟”出土文物引起世界关注');
INSERT INTO `history_today` VALUES ('509', '1936', '2', '20', ' 东北抗日联军杨靖宇、赵尚志等联名发表《东北抗日联军统一建制宣言》。');
INSERT INTO `history_today` VALUES ('510', '1942', '2', '20', '晋冀鲁豫边区决定精兵简政');
INSERT INTO `history_today` VALUES ('511', '1943', '2', '20', '墨西哥帕里库廷火山喷发');
INSERT INTO `history_today` VALUES ('512', '1874', '2', '21', '“马嘉理事件”发生');
INSERT INTO `history_today` VALUES ('513', '1895', '2', '21', '兴中会成立');
INSERT INTO `history_today` VALUES ('514', '1898', '2', '21', '谭嗣同等创立南学会');
INSERT INTO `history_today` VALUES ('515', '1915', '2', '21', '马苏里亚恩湖第二次战役结束，俄军死亡20万，被俘10万。');
INSERT INTO `history_today` VALUES ('516', '1916', '2', '21', '凡尔登战役开始。这是第一次世界大战中破坏性最大的一次战役，也是第一次世界大战的转折点。');
INSERT INTO `history_today` VALUES ('517', '1921', '2', '21', '礼萨汗发动军事政变');
INSERT INTO `history_today` VALUES ('518', '1933', '2', '21', '工农红军粉碎国民党第四次“围剿”');
INSERT INTO `history_today` VALUES ('519', '1934', '2', '21', '抗联成立总指挥部，杨靖宇挂帅');
INSERT INTO `history_today` VALUES ('520', '1936', '2', '21', '中共提出召集全国抗日救国代表大会');
INSERT INTO `history_today` VALUES ('521', '1937', '2', '21', '国民党接受共产党提出的建立统一战线的主张');
INSERT INTO `history_today` VALUES ('522', '1848', '2', '22', '法国“二月革命”爆发');
INSERT INTO `history_today` VALUES ('523', '1902', '2', '22', '科学家研究发现黄热病是由蚊子传播的');
INSERT INTO `history_today` VALUES ('524', '1906', '2', '22', '洋教士杀中国知县激发南昌教案');
INSERT INTO `history_today` VALUES ('525', '1921', '2', '22', '考茨基等创办“第二半国际”');
INSERT INTO `history_today` VALUES ('526', '1925', '2', '22', '欧洲货币体系的积极倡导者——德斯坦诞辰');
INSERT INTO `history_today` VALUES ('527', '1927', '2', '22', '上海工人举行第二次武装起义');
INSERT INTO `history_today` VALUES ('528', '1962', '2', '22', '中央下决心精兵简政');
INSERT INTO `history_today` VALUES ('529', '1964', '2', '22', '我国与刚果建交');
INSERT INTO `history_today` VALUES ('530', '1967', '2', '22', '苏哈托取代苏加诺成为印尼总统');
INSERT INTO `history_today` VALUES ('531', '1974', '2', '22', '毛泽东提出“三个世界”的理论');
INSERT INTO `history_today` VALUES ('532', '1893', '2', '23', '鲁道夫·迪塞尔为其发明的柴油机取得了专利');
INSERT INTO `history_today` VALUES ('533', '1918', '2', '23', '苏联红军节');
INSERT INTO `history_today` VALUES ('534', '1921', '2', '23', '苏联的海军人员在喀琅斯塔岛的海军基地发动反布尔什维克叛变，被苏共粉碎');
INSERT INTO `history_today` VALUES ('535', '1926', '2', '23', '国共两党发动民众讨伐吴佩孚');
INSERT INTO `history_today` VALUES ('536', '1947', '2', '23', '莱芜战役生俘李仙洲，歼蒋军七个旅');
INSERT INTO `history_today` VALUES ('537', '1947', '2', '23', '国际标准化组织正式成立');
INSERT INTO `history_today` VALUES ('538', '1949', '2', '23', '亚洲运动会联合会成立');
INSERT INTO `history_today` VALUES ('539', '1972', '2', '23', '抗议者烧毁都柏林的英国大使馆');
INSERT INTO `history_today` VALUES ('540', '1979', '2', '23', '第五届全国人大常委会第六次会议决定每年的3月12日为中国植树节');
INSERT INTO `history_today` VALUES ('541', '1980', '2', '23', '中共召开十一届五中全会');
INSERT INTO `history_today` VALUES ('542', '1824', '2', '24', '第一次英缅战争爆发');
INSERT INTO `history_today` VALUES ('543', '1848', '2', '24', '《共产党宣言》在伦敦正式出版');
INSERT INTO `history_today` VALUES ('544', '1881', '2', '24', '沙俄强迫中国清政府签订了中俄《伊犁条约》');
INSERT INTO `history_today` VALUES ('545', '1912', '2', '24', '南京临时政府改革称呼');
INSERT INTO `history_today` VALUES ('546', '1918', '2', '24', '爱沙尼亚宣布从俄罗斯独立');
INSERT INTO `history_today` VALUES ('547', '1931', '2', '24', '巴金发表长篇小说《家》');
INSERT INTO `history_today` VALUES ('548', '1935', '2', '24', '瞿秋白被俘');
INSERT INTO `history_today` VALUES ('549', '1942', '2', '24', '“美国之音”创立');
INSERT INTO `history_today` VALUES ('550', '1946', '2', '24', '阿根廷举行大选，庇隆当选总统');
INSERT INTO `history_today` VALUES ('551', '1950', '2', '24', '中国政务院通令禁毒');
INSERT INTO `history_today` VALUES ('552', '1906', '2', '25', '“南昌教案”发生');
INSERT INTO `history_today` VALUES ('553', '1933', '2', '25', '日本因入侵中国退出国际联盟');
INSERT INTO `history_today` VALUES ('554', '1936', '2', '25', '李克农与国民党67军进行抗日合作');
INSERT INTO `history_today` VALUES ('555', '1946', '2', '25', '“军队整编方案”签署');
INSERT INTO `history_today` VALUES ('556', '1946', '2', '25', '国共美三方签署《整军方案》');
INSERT INTO `history_today` VALUES ('557', '1948', '2', '25', '营口国民党军队起义');
INSERT INTO `history_today` VALUES ('558', '1949', '2', '25', '“重庆”号巡洋舰起义');
INSERT INTO `history_today` VALUES ('559', '1954', '2', '25', '纳赛尔上校夺取政权，担任埃及总理');
INSERT INTO `history_today` VALUES ('560', '1964', '2', '25', '国防部授予某部六连“硬骨头六连”称号');
INSERT INTO `history_today` VALUES ('561', '1975', '2', '25', '邓小平狠抓铁路整顿');
INSERT INTO `history_today` VALUES ('562', '1841', '2', '26', '关天培血战虎门');
INSERT INTO `history_today` VALUES ('563', '1848', '2', '26', '法兰西第二共和国成立');
INSERT INTO `history_today` VALUES ('564', '1871', '2', '26', '普法战争以法国失败告终');
INSERT INTO `history_today` VALUES ('565', '1876', '2', '26', '日本胁迫朝鲜缔结《江华条约》');
INSERT INTO `history_today` VALUES ('566', '1913', '2', '26', '中国出现第一位电影女演员');
INSERT INTO `history_today` VALUES ('567', '1914', '2', '26', '直隶都督赵秉钧被袁世凯毒死');
INSERT INTO `history_today` VALUES ('568', '1917', '2', '26', '德国宣布全面无限制潜艇战，美国与德国断交');
INSERT INTO `history_today` VALUES ('569', '1930', '2', '26', '纽约安装红绿灯，保护步行的人');
INSERT INTO `history_today` VALUES ('570', '1932', '2', '26', '中共临时中央发表为取得上海战争的胜利告全国民众宣言');
INSERT INTO `history_today` VALUES ('571', '1936', '2', '26', '德国大众汽车问世');
INSERT INTO `history_today` VALUES ('572', '1720', '2', '27', '四国联盟和西班牙签订和平条约');
INSERT INTO `history_today` VALUES ('573', '1921', '2', '27', '周恩来、李富春等在巴黎成立中国少年共产党');
INSERT INTO `history_today` VALUES ('574', '1929', '2', '27', '国民政府动议“废止中医”');
INSERT INTO `history_today` VALUES ('575', '1931', '2', '27', '毛泽东确定土地改革后农民对土地的所有权');
INSERT INTO `history_today` VALUES ('576', '1933', '2', '27', '希特勒制造“国会纵火案”');
INSERT INTO `history_today` VALUES ('577', '1933', '2', '27', '黄陂山地伏击战');
INSERT INTO `history_today` VALUES ('578', '1936', '2', '27', '红军与西北军握手言和');
INSERT INTO `history_today` VALUES ('579', '1942', '2', '27', '全党范围的整风运动开始');
INSERT INTO `history_today` VALUES ('580', '1944', '2', '27', '多米尼加独立');
INSERT INTO `history_today` VALUES ('581', '1949', '2', '27', '北平限制外国新闻记者的活动');
INSERT INTO `history_today` VALUES ('582', '1901', '2', '28', '京剧表演艺术家马连良诞辰');
INSERT INTO `history_today` VALUES ('583', '1901', '2', '28', '诺贝尔奖“双料”获得者林纳·鲍林');
INSERT INTO `history_today` VALUES ('584', '1918', '2', '28', '中国香港赛马场倒坍大惨案 死亡604人');
INSERT INTO `history_today` VALUES ('585', '1919', '2', '28', '阿曼努拉登上阿富汗王位');
INSERT INTO `history_today` VALUES ('586', '1922', '2', '28', '英国宣布结束埃及“保护国地位”');
INSERT INTO `history_today` VALUES ('587', '1931', '2', '28', '蒋介石囚禁胡汉民');
INSERT INTO `history_today` VALUES ('588', '1947', '2', '28', '“二.二八”起义');
INSERT INTO `history_today` VALUES ('589', '1950', '2', '28', '《关于国营、公营工厂建立工厂管理委员会的指示》');
INSERT INTO `history_today` VALUES ('590', '1958', '2', '28', '中央号召干部下放劳动锻炼');
INSERT INTO `history_today` VALUES ('591', '1971', '2', '28', '中共中央兴办“五·七”干校');
INSERT INTO `history_today` VALUES ('592', '1856', '3', '1', '“西林教案”（即“马神甫事件”）发生');
INSERT INTO `history_today` VALUES ('593', '1896', '3', '1', '埃塞俄比亚抗击意大利殖民者');
INSERT INTO `history_today` VALUES ('594', '1948', '3', '1', '宜川战役开始');
INSERT INTO `history_today` VALUES ('595', '1952', '3', '1', '政务院举行第126次政务会议');
INSERT INTO `history_today` VALUES ('596', '1956', '3', '1', '全国工资会议在北京举行');
INSERT INTO `history_today` VALUES ('597', '1956', '3', '1', '李维汉在全国工商界青年积极分子大会上作报告');
INSERT INTO `history_today` VALUES ('598', '1956', '3', '1', '全国工商界青年积极分子大会闭幕');
INSERT INTO `history_today` VALUES ('599', '1960', '3', '1', '中国首次派船接运受迫害的印尼归侨');
INSERT INTO `history_today` VALUES ('600', '1972', '3', '1', '我国与加纳恢复外交关系');
INSERT INTO `history_today` VALUES ('601', '1972', '3', '1', '我新闻工作者代表团友好访问欧洲六国后回京');
INSERT INTO `history_today` VALUES ('602', '1824', '3', '2', '捷克音乐家斯美塔那诞辰');
INSERT INTO `history_today` VALUES ('603', '1855', '3', '2', '亚历山大二世成为俄罗斯沙皇');
INSERT INTO `history_today` VALUES ('604', '1861', '3', '2', '亚历山大二世颁布废除农奴制法令，俄国开始农奴制改革');
INSERT INTO `history_today` VALUES ('605', '1871', '3', '2', '保加利亚解放');
INSERT INTO `history_today` VALUES ('606', '1876', '3', '2', '“京剧”之名在上海《申报》诞生');
INSERT INTO `history_today` VALUES ('607', '1919', '3', '2', '第三国际成立');
INSERT INTO `history_today` VALUES ('608', '1924', '3', '2', '孙中山提出国民党应与共产党志同道合');
INSERT INTO `history_today` VALUES ('609', '1930', '3', '2', '中国左翼作家联盟成立');
INSERT INTO `history_today` VALUES ('610', '1931', '3', '2', '红四军歼灭敌三十四师');
INSERT INTO `history_today` VALUES ('611', '1932', '3', '2', '摩洛哥王国宣布独立');
INSERT INTO `history_today` VALUES ('612', '1861', '3', '3', '俄国宣布废除农奴制');
INSERT INTO `history_today` VALUES ('613', '1912', '3', '3', '同盟会改组为公开政党');
INSERT INTO `history_today` VALUES ('614', '1915', '3', '3', '影片《一个国家的诞生》纽约上演');
INSERT INTO `history_today` VALUES ('615', '1918', '3', '3', '德俄签订布列斯特和约');
INSERT INTO `history_today` VALUES ('616', '1924', '3', '3', '土耳其实行近代化改革');
INSERT INTO `history_today` VALUES ('617', '1932', '3', '3', '淞沪战事结束');
INSERT INTO `history_today` VALUES ('618', '1945', '3', '3', '第二次世界大战：芬兰向轴心国宣战');
INSERT INTO `history_today` VALUES ('619', '1948', '3', '3', '西北野战军取得宜川战役大捷');
INSERT INTO `history_today` VALUES ('620', '1948', '3', '3', '彭德怀全歼蒋第二十九军，刘戡自杀');
INSERT INTO `history_today` VALUES ('621', '1955', '3', '3', '中共中央和国务院发出《关于迅速布置粮食购销工作，安定农民生产情绪的紧急指示》');
INSERT INTO `history_today` VALUES ('622', '1152', '3', '4', '“红胡子”腓特烈当选国王');
INSERT INTO `history_today` VALUES ('623', '1861', '3', '4', '亚伯拉罕·林肯就任美国第16任总统');
INSERT INTO `history_today` VALUES ('624', '1862', '3', '4', '中俄签订陆路通商章程');
INSERT INTO `history_today` VALUES ('625', '1907', '3', '4', '孙中山被迫离日');
INSERT INTO `history_today` VALUES ('626', '1917', '3', '4', '国务总理段祺瑞出走天津，府院之争愈演愈烈');
INSERT INTO `history_today` VALUES ('627', '1919', '3', '4', '列宁组成第三共产国际');
INSERT INTO `history_today` VALUES ('628', '1921', '3', '4', '哈定就任美国第２９任总统');
INSERT INTO `history_today` VALUES ('629', '1922', '3', '4', '香港英军制造“沙田惨案”');
INSERT INTO `history_today` VALUES ('630', '1923', '3', '4', '胡适大力提倡研究国学');
INSERT INTO `history_today` VALUES ('631', '1933', '3', '4', '日军攻占古北口');
INSERT INTO `history_today` VALUES ('632', '1908', '3', '5', '上海公共租界有轨电车开始运营');
INSERT INTO `history_today` VALUES ('633', '1918', '3', '5', '孙中山起用蒋介石');
INSERT INTO `history_today` VALUES ('634', '1927', '3', '5', '毛泽东的《湖南农民运动考察报告》发表');
INSERT INTO `history_today` VALUES ('635', '1931', '3', '5', '甘地一欧文协定签订');
INSERT INTO `history_today` VALUES ('636', '1949', '3', '5', '中共七届二中全会在西柏坡召开');
INSERT INTO `history_today` VALUES ('637', '1952', '3', '5', '毛泽东确立对违法工商户的处理原则');
INSERT INTO `history_today` VALUES ('638', '1958', '3', '5', '广西壮族自治区正式成立');
INSERT INTO `history_today` VALUES ('639', '1963', '3', '5', '《人民日报》发表毛主席题词：“向雷锋同志学习”');
INSERT INTO `history_today` VALUES ('640', '1978', '3', '5', '五届全国人大第一次会议通过宪法修正案');
INSERT INTO `history_today` VALUES ('641', '1979', '3', '5', '我参加对越自卫反击战边防部队奉命撤回中国境内');
INSERT INTO `history_today` VALUES ('642', '1521', '3', '6', '麦哲伦发现关岛');
INSERT INTO `history_today` VALUES ('643', '1834', '3', '6', '加拿大最大城市多伦多成立');
INSERT INTO `history_today` VALUES ('644', '1853', '3', '6', '朱塞佩·威尔第的著名歌剧《茶花女》在威尼斯凤凰歌剧院首演');
INSERT INTO `history_today` VALUES ('645', '1898', '3', '6', '中国和德国签订胶澳租界条约');
INSERT INTO `history_today` VALUES ('646', '1899', '3', '6', '阿斯匹灵获准上市');
INSERT INTO `history_today` VALUES ('647', '1902', '3', '6', '皇家马德里俱乐部成立');
INSERT INTO `history_today` VALUES ('648', '1908', '3', '6', '清廷与英订立沪杭甬铁路供款合同，引起地方不满');
INSERT INTO `history_today` VALUES ('649', '1921', '3', '6', '中华海员工业联合总会在香港成立');
INSERT INTO `history_today` VALUES ('650', '1932', '3', '6', '蒋介石任军事委员会委员长');
INSERT INTO `history_today` VALUES ('651', '1933', '3', '6', '宋哲元第二十九军血战喜峰口');
INSERT INTO `history_today` VALUES ('652', '1798', '3', '7', '法国军队进入罗马，罗马共和国成立');
INSERT INTO `history_today` VALUES ('653', '1905', '3', '7', '震旦学生集体退学，反对法人干预教育');
INSERT INTO `history_today` VALUES ('654', '1910', '3', '7', '精武体育会在上海成立');
INSERT INTO `history_today` VALUES ('655', '1912', '3', '7', '保定陆军军官学校建立');
INSERT INTO `history_today` VALUES ('656', '1924', '3', '7', '无线电广播转播7000英里');
INSERT INTO `history_today` VALUES ('657', '1927', '3', '7', '毛泽东创办武昌中央农民运动讲习所开课');
INSERT INTO `history_today` VALUES ('658', '1931', '3', '7', '毛泽东制定游击战争方略');
INSERT INTO `history_today` VALUES ('659', '1932', '3', '7', '罗斯福实行新政');
INSERT INTO `history_today` VALUES ('660', '1933', '3', '7', '热河失落，张学良引咎下野');
INSERT INTO `history_today` VALUES ('661', '1936', '3', '7', '纳粹占领莱茵区');
INSERT INTO `history_today` VALUES ('662', '1917', '3', '8', '俄国二月革命爆发');
INSERT INTO `history_today` VALUES ('663', '1918', '3', '8', '皖系政党发起成立安福俱乐部');
INSERT INTO `history_today` VALUES ('664', '1921', '3', '8', '俄共（布）“十六”召开，决定实行“新经济政策”');
INSERT INTO `history_today` VALUES ('665', '1939', '3', '8', '日军占领南昌');
INSERT INTO `history_today` VALUES ('666', '1944', '3', '8', '喷火式飞机在对德战斗中发挥威力');
INSERT INTO `history_today` VALUES ('667', '1952', '3', '8', '新中国培养出第一批全体女飞行员');
INSERT INTO `history_today` VALUES ('668', '1952', '3', '8', '人类第一次成功地使用机械心脏');
INSERT INTO `history_today` VALUES ('669', '1952', '3', '8', '我国政府发表声明　谴责美国使用细菌武器');
INSERT INTO `history_today` VALUES ('670', '1958', '3', '8', '中共召开“成都会议”');
INSERT INTO `history_today` VALUES ('671', '1960', '3', '8', '我国第一所“电视广播大学”正式开学');
INSERT INTO `history_today` VALUES ('672', '1152', '3', '9', '腓特烈一世加冕为神圣罗马帝国皇帝');
INSERT INTO `history_today` VALUES ('673', '1451', '3', '9', '意大利探险家亚美利哥诞辰');
INSERT INTO `history_today` VALUES ('674', '1823', '3', '9', '圣西门自杀');
INSERT INTO `history_today` VALUES ('675', '1916', '3', '9', '法英瓜分中东');
INSERT INTO `history_today` VALUES ('676', '1918', '3', '9', '协约国开始武装干涉苏俄');
INSERT INTO `history_today` VALUES ('677', '1918', '3', '9', '以列宁为首的第一个工农苏维埃政府迁都莫斯科');
INSERT INTO `history_today` VALUES ('678', '1923', '3', '9', '列宁患中风病被迫离职');
INSERT INTO `history_today` VALUES ('679', '1926', '3', '9', '湖南驱逐赵恒惕');
INSERT INTO `history_today` VALUES ('680', '1932', '3', '9', '伪满洲国在长春成立');
INSERT INTO `history_today` VALUES ('681', '1932', '3', '9', '溥仪重登“皇位”');
INSERT INTO `history_today` VALUES ('682', '1876', '3', '10', '贝尔发明电话');
INSERT INTO `history_today` VALUES ('683', '1912', '3', '10', '袁世凯在京就任临时大总统');
INSERT INTO `history_today` VALUES ('684', '1918', '3', '10', '苏俄首都由彼得格勒迁至莫斯科');
INSERT INTO `history_today` VALUES ('685', '1921', '3', '10', '交通大学成立，正式招收新生');
INSERT INTO `history_today` VALUES ('686', '1927', '3', '10', '国民党二届三中全会举行');
INSERT INTO `history_today` VALUES ('687', '1928', '3', '10', '徐志摩主编的《新月》杂志创刊');
INSERT INTO `history_today` VALUES ('688', '1928', '3', '10', '毛泽东被降职任师长');
INSERT INTO `history_today` VALUES ('689', '1933', '3', '10', '南京政府废两改元统一币制');
INSERT INTO `history_today` VALUES ('690', '1940', '3', '10', '蒋日秘密圆桌会谈结束');
INSERT INTO `history_today` VALUES ('691', '1943', '3', '10', '蒋介石发表《中国之命运》');
INSERT INTO `history_today` VALUES ('692', '1161', '3', '11', '中国南宋发行纸币：交子');
INSERT INTO `history_today` VALUES ('693', '1904', '3', '11', '近代中国历史最悠久的大型综合刊物《东方杂志》在上海创刊');
INSERT INTO `history_today` VALUES ('694', '1912', '3', '11', '《中华民国临时约法》颁布');
INSERT INTO `history_today` VALUES ('695', '1912', '3', '11', '孙中山下令劝禁缠足');
INSERT INTO `history_today` VALUES ('696', '1914', '3', '11', '英藏擅自划定麦克马洪线');
INSERT INTO `history_today` VALUES ('697', '1925', '3', '11', '孙中山签署“总理遗嘱”');
INSERT INTO `history_today` VALUES ('698', '1932', '3', '11', '共产国际军事顾问李德到达中央苏区');
INSERT INTO `history_today` VALUES ('699', '1940', '3', '11', '八路军歼灭国民党第九十七军大部');
INSERT INTO `history_today` VALUES ('700', '1941', '3', '11', '美国罗斯福总统签署《贷款和出租武器法案》');
INSERT INTO `history_today` VALUES ('701', '1951', '3', '11', '中华全国世界语协会成立');
INSERT INTO `history_today` VALUES ('702', '1782', '3', '12', '《四库全书》编成');
INSERT INTO `history_today` VALUES ('703', '1898', '3', '12', '田汉诞辰');
INSERT INTO `history_today` VALUES ('704', '1913', '3', '12', '北京政府发布宗教信仰自由令');
INSERT INTO `history_today` VALUES ('705', '1926', '3', '12', '大沽口事件发生，中国主权遭践踏');
INSERT INTO `history_today` VALUES ('706', '1930', '3', '12', '甘地发动“食盐进军”，第二次不合作运动开始');
INSERT INTO `history_today` VALUES ('707', '1942', '3', '12', '第二次世界大战菲律宾沦陷');
INSERT INTO `history_today` VALUES ('708', '1947', '3', '12', '杜鲁门主义提出，美苏“冷战”正式开始');
INSERT INTO `history_today` VALUES ('709', '1960', '3', '12', '北京科学教育电影制片厂成立');
INSERT INTO `history_today` VALUES ('710', '1980', '3', '12', '邓小平作题为《精简军队，提高战斗力》的讲话');
INSERT INTO `history_today` VALUES ('711', '1983', '3', '12', '津巴布韦大逮捕，反对党领袖恩科莫逃亡');
INSERT INTO `history_today` VALUES ('712', '1781', '3', '13', '英国天文学家赫歇耳发现天王星');
INSERT INTO `history_today` VALUES ('713', '1868', '3', '13', '美国参议院开始弹劾安德鲁·约翰逊总统，罪名是“犯有重大罪行和行为失检');
INSERT INTO `history_today` VALUES ('714', '1901', '3', '13', '钢铁大王卡耐基宣布退休');
INSERT INTO `history_today` VALUES ('715', '1905', '3', '13', '日俄激战，俄军被迫放弃沈阳');
INSERT INTO `history_today` VALUES ('716', '1920', '3', '13', '柏林发生保皇党未遂政变--卡普暴动');
INSERT INTO `history_today` VALUES ('717', '1921', '3', '13', '蒙古宣布与中国脱离关系');
INSERT INTO `history_today` VALUES ('718', '1928', '3', '13', '加利福尼亚水坝坍塌，400多人丧生');
INSERT INTO `history_today` VALUES ('719', '1930', '3', '13', '美国天文学家汤博宣布发现冥王星');
INSERT INTO `history_today` VALUES ('720', '1939', '3', '13', '希特勒策动斯洛伐克脱离捷克“独立”，由德国“保护”');
INSERT INTO `history_today` VALUES ('721', '1940', '3', '13', '苏芬签订和约，芬兰割让大片领土');
INSERT INTO `history_today` VALUES ('722', '1689', '3', '14', '自由议会在苏格兰开会，威廉和玛丽被宣布为英格兰国王和王后');
INSERT INTO `history_today` VALUES ('723', '1917', '3', '14', '中国与德国绝交，参与第一次世界大战');
INSERT INTO `history_today` VALUES ('724', '1938', '3', '14', '德国吞并奥地利');
INSERT INTO `history_today` VALUES ('725', '1947', '3', '14', '美菲军事基地协定签订，租期99年');
INSERT INTO `history_today` VALUES ('726', '1948', '3', '14', '洛阳战役告捷');
INSERT INTO `history_today` VALUES ('727', '1951', '3', '14', '在朝鲜战争中，联合国军队第二次收复汉城（首尔）');
INSERT INTO `history_today` VALUES ('728', '1962', '3', '14', '联合国裁军委员会会议在日内瓦举行');
INSERT INTO `history_today` VALUES ('729', '1963', '3', '14', '美国妇女玛格丽特·沃德成为第一个驾驶“F－106”战斗机的妇女');
INSERT INTO `history_today` VALUES ('730', '1964', '3', '14', '涉嫌肯尼迪凶杀案的杰克·鲁比被判处死刑');
INSERT INTO `history_today` VALUES ('731', '1979', '3', '14', '李先念等建议对国民经济实行调整');
INSERT INTO `history_today` VALUES ('732', '1493', '3', '15', '哥伦布“发现新大陆”');
INSERT INTO `history_today` VALUES ('733', '1776', '3', '15', '南卡罗莱纳宣布脱离英国独立');
INSERT INTO `history_today` VALUES ('734', '1820', '3', '15', '缅因州成为美国第23个州');
INSERT INTO `history_today` VALUES ('735', '1848', '3', '15', '匈牙利爆发反对哈布斯堡王朝统治的革命');
INSERT INTO `history_today` VALUES ('736', '1903', '3', '15', '章炳麟、邹容受审');
INSERT INTO `history_today` VALUES ('737', '1906', '3', '15', '英国劳斯莱斯集团正式注册');
INSERT INTO `history_today` VALUES ('738', '1917', '3', '15', '俄国建立临时政府');
INSERT INTO `history_today` VALUES ('739', '1920', '3', '15', '美国参议院第二次拒绝批准凡尔赛和约');
INSERT INTO `history_today` VALUES ('740', '1921', '3', '15', '苏俄决定实行新经济政策');
INSERT INTO `history_today` VALUES ('741', '1922', '3', '15', '张石川创办明星电影公司');
INSERT INTO `history_today` VALUES ('742', '1908', '3', '16', '南丁格尔被授予伦敦城自由奖。');
INSERT INTO `history_today` VALUES ('743', '1914', '3', '16', '欧洲军备竞赛和战争言论升级');
INSERT INTO `history_today` VALUES ('744', '1915', '3', '16', '上海发起抵制日货运动');
INSERT INTO `history_today` VALUES ('745', '1916', '3', '16', '文学流派达达主义在法国诞生');
INSERT INTO `history_today` VALUES ('746', '1917', '3', '16', '俄国沙皇退位');
INSERT INTO `history_today` VALUES ('747', '1925', '3', '16', '云南大理发生7.1级地震');
INSERT INTO `history_today` VALUES ('748', '1926', '3', '16', '美国发明家戈达德制造的世界上第一枚液体火箭升空');
INSERT INTO `history_today` VALUES ('749', '1943', '3', '16', '新四军生擒韩德勤');
INSERT INTO `history_today` VALUES ('750', '1950', '3', '16', '全国展开大规模剿匪斗争');
INSERT INTO `history_today` VALUES ('751', '1950', '3', '16', '数学家华罗庚自美国回归北京');
INSERT INTO `history_today` VALUES ('752', '1912', '3', '17', '梅兰芳首演京剧《木兰从军》');
INSERT INTO `history_today` VALUES ('753', '1916', '3', '17', '护国战争中蔡锷大败张敬尧');
INSERT INTO `history_today` VALUES ('754', '1919', '3', '17', '我国第一批勤工俭学留法学生赴法国');
INSERT INTO `history_today` VALUES ('755', '1927', '3', '17', '共产党员和国民党左派联合挫败蒋介石另立中央的企图');
INSERT INTO `history_today` VALUES ('756', '1939', '3', '17', '南昌会战中国军队伤亡惨重');
INSERT INTO `history_today` VALUES ('757', '1945', '3', '17', '硫磺岛血战以美国取得胜利宣告结束');
INSERT INTO `history_today` VALUES ('758', '1946', '3', '17', '国民党召开六届二中全会通过多项反共决议');
INSERT INTO `history_today` VALUES ('759', '1948', '3', '17', '攻克洛阳的野战部队全部撤离');
INSERT INTO `history_today` VALUES ('760', '1948', '3', '17', '《布鲁塞尔条约》签订');
INSERT INTO `history_today` VALUES ('761', '1949', '3', '17', '解放军拟定渡江日期');
INSERT INTO `history_today` VALUES ('762', '1644', '3', '18', '李自成攻克北京，明朝灭亡');
INSERT INTO `history_today` VALUES ('763', '1871', '3', '18', '巴黎公社革命爆发');
INSERT INTO `history_today` VALUES ('764', '1921', '3', '18', '世界上第一家节育诊所在伦敦开业');
INSERT INTO `history_today` VALUES ('765', '1922', '3', '18', '中共创办上海大学');
INSERT INTO `history_today` VALUES ('766', '1926', '3', '18', '北京发生“三一八”惨案');
INSERT INTO `history_today` VALUES ('767', '1929', '3', '18', '王明由莫斯科回国，欲改造中共');
INSERT INTO `history_today` VALUES ('768', '1937', '3', '18', '美一教会学校发生天然气爆炸');
INSERT INTO `history_today` VALUES ('769', '1940', '3', '18', '墨索里尼同希特勒会晤');
INSERT INTO `history_today` VALUES ('770', '1942', '3', '18', '抗日战争滇湎路战役开始');
INSERT INTO `history_today` VALUES ('771', '1943', '3', '18', '新四军生擒韩德勤');
INSERT INTO `history_today` VALUES ('772', '1279', '3', '19', '陆秀夫背幼帝投海殉国   南宋亡');
INSERT INTO `history_today` VALUES ('773', '1796', '3', '19', '法国实行新闻自由');
INSERT INTO `history_today` VALUES ('774', '1815', '3', '19', '拿破仑在巴黎重登法国皇帝');
INSERT INTO `history_today` VALUES ('775', '1900', '3', '19', '伊文思开始挖掘公元前16世纪的克诺索斯宫');
INSERT INTO `history_today` VALUES ('776', '1934', '3', '19', '蒋介石借四马联军翦除孙殿英部');
INSERT INTO `history_today` VALUES ('777', '1941', '3', '19', '中国民主同盟成立');
INSERT INTO `history_today` VALUES ('778', '1944', '3', '19', '红军逼近，匈牙利犹太人被送往奥斯威辛');
INSERT INTO `history_today` VALUES ('779', '1944', '3', '19', '郭沫若《甲申三百年祭》发表');
INSERT INTO `history_today` VALUES ('780', '1946', '3', '19', '美国驻华军事顾问团成立');
INSERT INTO `history_today` VALUES ('781', '1949', '3', '19', '“重庆”号巡洋舰被蒋机炸沉');
INSERT INTO `history_today` VALUES ('782', '1413', '3', '20', '亨利五世继承英格兰王位');
INSERT INTO `history_today` VALUES ('783', '1815', '3', '20', '法国史上的“百日王朝”');
INSERT INTO `history_today` VALUES ('784', '1896', '3', '20', '清朝建立邮政，标志中国邮政正式诞生');
INSERT INTO `history_today` VALUES ('785', '1902', '3', '20', '袁世凯派学生赴日学军事');
INSERT INTO `history_today` VALUES ('786', '1913', '3', '20', '国民党代理事长、资产阶级民主革命家宋教仁在上海火车站遭袁世凯爪牙被刺杀，22日逝世。');
INSERT INTO `history_today` VALUES ('787', '1926', '3', '20', '蒋介石制造反共的“中山舰事件”');
INSERT INTO `history_today` VALUES ('788', '1931', '3', '20', '《西线无战事》获第3届奥斯卡最佳影片奖');
INSERT INTO `history_today` VALUES ('789', '1933', '3', '20', '纳粹建立第一个集中营');
INSERT INTO `history_today` VALUES ('790', '1943', '3', '20', '毛泽东任中共中央政治局主席');
INSERT INTO `history_today` VALUES ('791', '1948', '3', '20', '毛泽东预言1949年成立中央人民政府');
INSERT INTO `history_today` VALUES ('792', '1804', '3', '21', '法国《拿破仑法典》颁布');
INSERT INTO `history_today` VALUES ('793', '1836', '3', '21', '加尔各答公共图书馆向公众开');
INSERT INTO `history_today` VALUES ('794', '1919', '3', '21', '贝洛-库恩控制匈牙利');
INSERT INTO `history_today` VALUES ('795', '1927', '3', '21', '上海工人第三次武装起义');
INSERT INTO `history_today` VALUES ('796', '1927', '3', '21', '蒋介石占领上海');
INSERT INTO `history_today` VALUES ('797', '1934', '3', '21', '希特勒计划建立庞大的公路系统');
INSERT INTO `history_today` VALUES ('798', '1939', '3', '21', '蒋介石派特务赴河内刺杀汪精卫未果');
INSERT INTO `history_today` VALUES ('799', '1948', '3', '21', '苏联退出柏林的同盟国委员会');
INSERT INTO `history_today` VALUES ('800', '1955', '3', '21', '中共中央召开全国代表会议');
INSERT INTO `history_today` VALUES ('801', '1955', '3', '21', '毛泽东题词：要建立一支强大的空军');
INSERT INTO `history_today` VALUES ('802', '1895', '3', '22', '卢米埃尔兄弟拍摄的人类历史上第一部电影《工厂的大门》在巴黎首映');
INSERT INTO `history_today` VALUES ('803', '1901', '3', '22', '梅塞德斯车有了自己的名字');
INSERT INTO `history_today` VALUES ('804', '1914', '3', '22', '上海图画美术学院开始使用人体模特');
INSERT INTO `history_today` VALUES ('805', '1916', '3', '22', '袁世凯宣布取消帝制');
INSERT INTO `history_today` VALUES ('806', '1924', '3', '22', '英国第一家航空公司宣告成立');
INSERT INTO `history_today` VALUES ('807', '1928', '3', '22', '毛泽东颁布三大纪律、六项注意');
INSERT INTO `history_today` VALUES ('808', '1932', '3', '22', '中华民族复兴社成立');
INSERT INTO `history_today` VALUES ('809', '1941', '3', '22', '国民党设立上饶集中营');
INSERT INTO `history_today` VALUES ('810', '1942', '3', '22', '于伶完成话剧《长夜行》');
INSERT INTO `history_today` VALUES ('811', '1945', '3', '22', '阿拉伯国家联盟成立');
INSERT INTO `history_today` VALUES ('812', '1678', '3', '23', '吴三桂在衡州称帝');
INSERT INTO `history_today` VALUES ('813', '1913', '3', '23', '刺杀宋教仁凶手被抓获');
INSERT INTO `history_today` VALUES ('814', '1918', '3', '23', '段祺瑞再次成为国务总理');
INSERT INTO `history_today` VALUES ('815', '1919', '3', '23', '平民教育讲演团成立');
INSERT INTO `history_today` VALUES ('816', '1919', '3', '23', '贝尼托·墨索里尼建立“战斗的法西斯”党');
INSERT INTO `history_today` VALUES ('817', '1925', '3', '23', '美国田纳西州禁止讲授进化论');
INSERT INTO `history_today` VALUES ('818', '1927', '3', '23', '安庆惨案');
INSERT INTO `history_today` VALUES ('819', '1933', '3', '23', '德国国会将独裁权授予希特勒');
INSERT INTO `history_today` VALUES ('820', '1937', '3', '23', '中共中央政治局在延安召开扩大会议');
INSERT INTO `history_today` VALUES ('821', '1938', '3', '23', '抗日战争中的台儿庄大战开始');
INSERT INTO `history_today` VALUES ('822', '1596', '3', '24', '布洛涅和约使者英格兰同法国和苏格兰的战争宣告结束');
INSERT INTO `history_today` VALUES ('823', '1603', '3', '24', '苏格兰国王詹姆士一世加冕为英国国王');
INSERT INTO `history_today` VALUES ('824', '1882', '3', '24', '德国细菌学家罗伯特·科赫（1843～1910）宣布分离出肺结核病菌');
INSERT INTO `history_today` VALUES ('825', '1885', '3', '24', '镇南关大捷');
INSERT INTO `history_today` VALUES ('826', '1896', '3', '24', '俄国波波夫表演无线电通信成功');
INSERT INTO `history_today` VALUES ('827', '1900', '3', '24', '最后一只野生旅鸽被人类猎杀');
INSERT INTO `history_today` VALUES ('828', '1914', '3', '24', '西姆拉会议，英国代表与西藏地方政府代表擅自划定中印边界走向，即“麦克马洪线”');
INSERT INTO `history_today` VALUES ('829', '1919', '3', '24', '北京发起工读互助团');
INSERT INTO `history_today` VALUES ('830', '1921', '3', '24', '陈独秀在广东活动建党');
INSERT INTO `history_today` VALUES ('831', '1927', '3', '24', '南京发生“三.二四”惨案（南京惨案）');
INSERT INTO `history_today` VALUES ('832', '1807', '3', '25', '英国宣布废止奴隶贸易');
INSERT INTO `history_today` VALUES ('833', '1815', '3', '25', '奥地利、英国、普鲁士和俄国建立反对拿破仑新同盟，以维持欧洲确立的秩序。');
INSERT INTO `history_today` VALUES ('834', '1821', '3', '25', '希腊人民发动起义');
INSERT INTO `history_today` VALUES ('835', '1895', '3', '25', '意大利入侵埃塞俄比亚');
INSERT INTO `history_today` VALUES ('836', '1901', '3', '25', '保卫托尔斯泰');
INSERT INTO `history_today` VALUES ('837', '1913', '3', '25', '孙中山决定武装倒袁');
INSERT INTO `history_today` VALUES ('838', '1918', '3', '25', '大威力新式步枪在美国试验成功');
INSERT INTO `history_today` VALUES ('839', '1924', '3', '25', '雅典议会宣布希腊为共和国');
INSERT INTO `history_today` VALUES ('840', '1936', '3', '25', '阎锡山在山西成立“自强救国同志会”');
INSERT INTO `history_today` VALUES ('841', '1937', '3', '25', '阳翰笙编写的国防影片《夜奔》上演');
INSERT INTO `history_today` VALUES ('842', '1895', '3', '26', '日本派兵占领台湾岛和澎湖列岛，遭到台湾人民的奋起抵抗');
INSERT INTO `history_today` VALUES ('843', '1901', '3', '26', '杨儒在莫斯科再度拒签屈辱条约');
INSERT INTO `history_today` VALUES ('844', '1918', '3', '26', '法国将领福煦受命统帅协约国联军');
INSERT INTO `history_today` VALUES ('845', '1931', '3', '26', '日本军人为发动侵华战争造舆论');
INSERT INTO `history_today` VALUES ('846', '1940', '3', '26', '夏衍编剧的影片《白云故乡》在沪上映');
INSERT INTO `history_today` VALUES ('847', '1947', '3', '26', '蒋介石下令赦免周佛海死刑');
INSERT INTO `history_today` VALUES ('848', '1949', '3', '26', '中共中央决定派周恩来等与国民党进行和平谈判');
INSERT INTO `history_today` VALUES ('849', '1952', '3', '26', '索尔克为预防小儿麻痹症带来福音');
INSERT INTO `history_today` VALUES ('850', '1958', '3', '26', '中共中央工作会议结束');
INSERT INTO `history_today` VALUES ('851', '1971', '3', '26', '我国与喀麦隆建交');
INSERT INTO `history_today` VALUES ('852', '1862', '3', '27', '美商旗昌轮船公司在上海成立');
INSERT INTO `history_today` VALUES ('853', '1898', '3', '27', '清政府被迫与俄国签订了《中俄旅大租地条约》');
INSERT INTO `history_today` VALUES ('854', '1901', '3', '27', '美国抓获菲律宾的反抗运动领袖');
INSERT INTO `history_today` VALUES ('855', '1913', '3', '27', '天津成立改良戏曲练习所');
INSERT INTO `history_today` VALUES ('856', '1933', '3', '27', '英国帝国化学工业公司的埃里克·法维克特与雷金纳德·基普森发现聚氯乙烯。');
INSERT INTO `history_today` VALUES ('857', '1938', '3', '27', '中华全国文艺界抗敌协会成立');
INSERT INTO `history_today` VALUES ('858', '1941', '3', '27', '电影《乱世风光》再现孤岛上海');
INSERT INTO `history_today` VALUES ('859', '1946', '3', '27', '国共达成东北停战协议');
INSERT INTO `history_today` VALUES ('860', '1946', '3', '27', '通用电气和通用汽车公司结束了4个月的罢工');
INSERT INTO `history_today` VALUES ('861', '1947', '3', '27', '三下江南，四保临江');
INSERT INTO `history_today` VALUES ('862', '1272', '3', '28', '中国元朝改中都为大都');
INSERT INTO `history_today` VALUES ('863', '1854', '3', '28', '英国与法国对俄国宣战，克里米亚战争爆发');
INSERT INTO `history_today` VALUES ('864', '1871', '3', '28', '巴黎公社成立');
INSERT INTO `history_today` VALUES ('865', '1910', '3', '28', '法国人法布尔成功试飞第一架水上飞机');
INSERT INTO `history_today` VALUES ('866', '1920', '3', '28', '霍尔蒂夺取匈牙利政权');
INSERT INTO `history_today` VALUES ('867', '1927', '3', '28', '上海工人第三次武装起义宣告胜利');
INSERT INTO `history_today` VALUES ('868', '1930', '3', '28', '土耳其城市君士坦丁堡易名伊斯坦布尔');
INSERT INTO `history_today` VALUES ('869', '1931', '3', '28', '国民党向红军发起第二次“围剿”');
INSERT INTO `history_today` VALUES ('870', '1938', '3', '28', '伪“维新政府”在南京成立');
INSERT INTO `history_today` VALUES ('871', '1939', '3', '28', '历时３２个月的西班牙内战结束');
INSERT INTO `history_today` VALUES ('872', '1853', '3', '29', '太平天国建都江宁（南京），改江宁为“天京”');
INSERT INTO `history_today` VALUES ('873', '1861', '3', '29', '宋景诗等领导黑旗军起义');
INSERT INTO `history_today` VALUES ('874', '1867', '3', '29', '英国的北美法案确立加拿大自治领的地位');
INSERT INTO `history_today` VALUES ('875', '1903', '3', '29', '《科学世界》在上海创刊');
INSERT INTO `history_today` VALUES ('876', '1904', '3', '29', '中国第一个官办银行批准设立，是为国家银行之始');
INSERT INTO `history_today` VALUES ('877', '1917', '3', '29', '蔡元培要留学生莫崇洋媚外');
INSERT INTO `history_today` VALUES ('878', '1919', '3', '29', '美科学家预言火箭登月旅行将成为可能');
INSERT INTO `history_today` VALUES ('879', '1924', '3', '29', '鲁迅发表短篇小说《祝福》');
INSERT INTO `history_today` VALUES ('880', '1924', '3', '29', '长城电影公司的首部影片《弃妇》上映');
INSERT INTO `history_today` VALUES ('881', '1926', '3', '29', '西山会议派擅自召开国民党“二大”');
INSERT INTO `history_today` VALUES ('882', '1842', '3', '30', '克劳福德·朗医生首次在美国佐治亚州把乙醚作为麻醉药');
INSERT INTO `history_today` VALUES ('883', '1867', '3', '30', '俄国驻美公使巴伦·爱德华·德斯托克尔与美国国务卿威·亨利·西沃德签订俄国向美国转让阿拉斯加领土的条约');
INSERT INTO `history_today` VALUES ('884', '1879', '3', '30', '日本侵占琉球，废琉球王国，改置为冲绳县');
INSERT INTO `history_today` VALUES ('885', '1912', '3', '30', '根据非斯协定法国获得摩洛哥');
INSERT INTO `history_today` VALUES ('886', '1928', '3', '30', '毛泽东从严治军');
INSERT INTO `history_today` VALUES ('887', '1938', '3', '30', '中国青年记者协会成立');
INSERT INTO `history_today` VALUES ('888', '1940', '3', '30', '汪伪“华北政务委员会”成立');
INSERT INTO `history_today` VALUES ('889', '1940', '3', '30', '南京举行汪伪政府成立典礼');
INSERT INTO `history_today` VALUES ('890', '1943', '3', '30', '蒋介石发表《中国之命运》');
INSERT INTO `history_today` VALUES ('891', '1948', '3', '30', '国共双方军事力量对比发生巨大变化');
INSERT INTO `history_today` VALUES ('892', '1885', '3', '31', '英国宣布贝专纳北部为英国保护地，南非的斯蒂尔兰共和国宣告结束');
INSERT INTO `history_today` VALUES ('893', '1889', '3', '31', '法国巴黎埃菲尔铁塔落成');
INSERT INTO `history_today` VALUES ('894', '1904', '3', '31', '俄国舰队在海参崴附近海面覆没');
INSERT INTO `history_today` VALUES ('895', '1920', '3', '31', '北京大学马克思学说研究会成立');
INSERT INTO `history_today` VALUES ('896', '1921', '3', '31', '英国煤矿工人开始大罢工');
INSERT INTO `history_today` VALUES ('897', '1935', '3', '31', '战争乌云笼罩着欧洲');
INSERT INTO `history_today` VALUES ('898', '1937', '3', '31', '中共中央对张国焘的错误做出决定');
INSERT INTO `history_today` VALUES ('899', '1942', '3', '31', '中美签订《五亿美元借款协定》');
INSERT INTO `history_today` VALUES ('900', '1945', '3', '31', '刘少奇谈修改党章草案');
INSERT INTO `history_today` VALUES ('901', '1953', '3', '31', '瑞典人哈马舍尔德当选联合国秘书长');
INSERT INTO `history_today` VALUES ('902', '1356', '4', '1', '朱元璋攻克集庆（南京）');
INSERT INTO `history_today` VALUES ('903', '1572', '4', '1', '荷兰独立战争开始');
INSERT INTO `history_today` VALUES ('904', '1867', '4', '1', '新加坡成为英国的直辖殖民地(Crown Colony)');
INSERT INTO `history_today` VALUES ('905', '1906', '4', '1', '中国京汉铁路全线通车');
INSERT INTO `history_today` VALUES ('906', '1912', '4', '1', '孙中山解除临时大总统职');
INSERT INTO `history_today` VALUES ('907', '1913', '4', '1', '福特公司引入流产线大规模生产T型汽车');
INSERT INTO `history_today` VALUES ('908', '1915', '4', '1', '上海掀起激动全国的储金救国运动');
INSERT INTO `history_today` VALUES ('909', '1919', '4', '1', '出席巴黎和会的中国代表抗议英美法三国会议');
INSERT INTO `history_today` VALUES ('910', '1924', '4', '1', '希特勒因啤酒店暴动被判五年监禁');
INSERT INTO `history_today` VALUES ('911', '1927', '4', '1', '蒋介石与汪精卫密谈反共“清党”');
INSERT INTO `history_today` VALUES ('912', '1917', '4', '2', '美国国会首次出现女性议员，来自蒙大拿州的珍妮特·拉金。');
INSERT INTO `history_today` VALUES ('913', '1945', '4', '2', '美军开始大规模轰炸日本本土');
INSERT INTO `history_today` VALUES ('914', '1949', '4', '2', '中国妇女代表大会第一次会议在北京闭幕');
INSERT INTO `history_today` VALUES ('915', '1949', '4', '2', '北大西洋公约组织成立欧洲盟事最高司令部');
INSERT INTO `history_today` VALUES ('916', '1950', '4', '2', '中央戏剧学院成立');
INSERT INTO `history_today` VALUES ('917', '1953', '4', '2', '第一次普选人民代表');
INSERT INTO `history_today` VALUES ('918', '1962', '4', '2', '周恩来提出国民经济要调整');
INSERT INTO `history_today` VALUES ('919', '1979', '4', '2', '总政开始平反冤案');
INSERT INTO `history_today` VALUES ('920', '1982', '4', '2', '我国著名作家巴金接受1982年“但丁国际奖”');
INSERT INTO `history_today` VALUES ('921', '1982', '4', '2', '英阿马岛之战开始');
INSERT INTO `history_today` VALUES ('922', '1913', '4', '3', '美国女权主义者潘克赫斯特夫人被判入狱');
INSERT INTO `history_today` VALUES ('923', '1915', '4', '3', '中国戏曲研究院在北京成立');
INSERT INTO `history_today` VALUES ('924', '1930', '4', '3', '德国前总理科尔诞辰');
INSERT INTO `history_today` VALUES ('925', '1933', '4', '3', '两架英国双翼飞机首次成功飞越珠穆朗玛峰');
INSERT INTO `history_today` VALUES ('926', '1937', '4', '3', '江苏法院对“七君子”提出公诉');
INSERT INTO `history_today` VALUES ('927', '1942', '4', '3', '中共中央宣传部作出《关于在延安讨论中央决定及毛泽东同志整顿三风报告的决定》');
INSERT INTO `history_today` VALUES ('928', '1943', '4', '3', '中共中央发布《关于继续开展整风运动的决定》');
INSERT INTO `history_today` VALUES ('929', '1943', '4', '3', '延安整风运动开始转入审干肃反阶段');
INSERT INTO `history_today` VALUES ('930', '1946', '4', '3', '盟国对日管制委员会成立');
INSERT INTO `history_today` VALUES ('931', '1949', '4', '3', '美国、英国等11国外长在华盛顿签订了北大西洋公约');
INSERT INTO `history_today` VALUES ('932', '1581', '4', '4', '法兰西斯·德瑞克完成环球航行，成为全世界第一个完成全程航行的船长');
INSERT INTO `history_today` VALUES ('933', '1660', '4', '4', '查理二世颂布《布雷达宣言》');
INSERT INTO `history_today` VALUES ('934', '1712', '4', '4', '中国清代康熙帝推行“滋生人丁，永不加赋”制');
INSERT INTO `history_today` VALUES ('935', '1885', '4', '4', '中法签订《停战条件》');
INSERT INTO `history_today` VALUES ('936', '1896', '4', '4', '首届现代奥运会在雅典举行');
INSERT INTO `history_today` VALUES ('937', '1933', '4', '4', '国民党军队在中央革命根据地边沿修筑碉堡');
INSERT INTO `history_today` VALUES ('938', '1936', '4', '4', '中共西北局颁布土地政策');
INSERT INTO `history_today` VALUES ('939', '1938', '4', '4', '北大、清华、南开组成西南联大');
INSERT INTO `history_today` VALUES ('940', '1939', '4', '4', '陕甘宁边区颁布《土地条例》');
INSERT INTO `history_today` VALUES ('941', '1939', '4', '4', '陕甘宁边区公布《施政纲领》');
INSERT INTO `history_today` VALUES ('942', '1242', '4', '5', '楚德湖战役');
INSERT INTO `history_today` VALUES ('943', '1795', '4', '5', '法普签订巴塞尔和约');
INSERT INTO `history_today` VALUES ('944', '1815', '4', '5', '印度尼西亚坦博腊火山喷发');
INSERT INTO `history_today` VALUES ('945', '1927', '4', '5', '美国泳将约翰尼·韦斯摩勒一天创三项世界纪录');
INSERT INTO `history_today` VALUES ('946', '1927', '4', '5', '陈独秀与汪精卫发表“联合宣言”');
INSERT INTO `history_today` VALUES ('947', '1937', '4', '5', '国共两党同祭黄帝陵');
INSERT INTO `history_today` VALUES ('948', '1938', '4', '5', '张国焘逃离延安，中共将其开除党籍');
INSERT INTO `history_today` VALUES ('949', '1945', '4', '5', '苏联通告废止苏日中立条约');
INSERT INTO `history_today` VALUES ('950', '1955', '4', '5', '丘吉尔退休，艾登任英国首相');
INSERT INTO `history_today` VALUES ('951', '1959', '4', '5', '中共八届七中全会在上海举行');
INSERT INTO `history_today` VALUES ('952', '1904', '4', '6', '孙中山受困旧金山');
INSERT INTO `history_today` VALUES ('953', '1909', '4', '6', '罗伯特-皮尔里到达北极');
INSERT INTO `history_today` VALUES ('954', '1917', '4', '6', '美国国会投票通过参战决定');
INSERT INTO `history_today` VALUES ('955', '1919', '4', '6', '《共产党宣言》节译发表');
INSERT INTO `history_today` VALUES ('956', '1919', '4', '6', '印度发生反英的总罢业的绝食斗争');
INSERT INTO `history_today` VALUES ('957', '1921', '4', '6', '陈嘉庚创办厦门大学');
INSERT INTO `history_today` VALUES ('958', '1924', '4', '6', '环球飞行首次成功');
INSERT INTO `history_today` VALUES ('959', '1925', '4', '6', '首次在飞行中放映电影');
INSERT INTO `history_today` VALUES ('960', '1927', '4', '6', '李大钊被捕');
INSERT INTO `history_today` VALUES ('961', '1935', '4', '6', '钱塘江大桥动工');
INSERT INTO `history_today` VALUES ('962', '1906', '4', '7', '维苏威火山爆发');
INSERT INTO `history_today` VALUES ('963', '1921', '4', '7', '南方建立正式政府推孙中山为非常大总统');
INSERT INTO `history_today` VALUES ('964', '1924', '4', '7', '墨索里尼在公民选举中获得支持');
INSERT INTO `history_today` VALUES ('965', '1938', '4', '7', '台儿庄战役胜利结束');
INSERT INTO `history_today` VALUES ('966', '1939', '4', '7', '中国军队反攻南昌');
INSERT INTO `history_today` VALUES ('967', '1947', '4', '7', '阿拉伯复兴社会党成立');
INSERT INTO `history_today` VALUES ('968', '1956', '4', '7', '中苏签署土尔克斯坦铁路援建协定');
INSERT INTO `history_today` VALUES ('969', '1965', '4', '7', '中共中央发出《关于调整文化部领导问题的批复》');
INSERT INTO `history_today` VALUES ('970', '1976', '4', '7', '中央政治局通过毛泽东提议撤销邓小平党内外一切职务');
INSERT INTO `history_today` VALUES ('971', '1976', '4', '7', '邓小平被撤职，华国锋任中央第一副主席、总理');
INSERT INTO `history_today` VALUES ('972', '1525', '4', '8', '条顿骑士团团长改信路德教，普鲁士公国成立');
INSERT INTO `history_today` VALUES ('973', '1695', '4', '8', '北京故宫太和殿（俗称金銮殿）建成');
INSERT INTO `history_today` VALUES ('974', '1710', '4', '8', '康熙命编纂《字典》');
INSERT INTO `history_today` VALUES ('975', '1896', '4', '8', '上海交通大学建校');
INSERT INTO `history_today` VALUES ('976', '1902', '4', '8', '俄国同意从中国东北撤军');
INSERT INTO `history_today` VALUES ('977', '1902', '4', '8', '俄国与清政府签订中俄《交收东三省条约》');
INSERT INTO `history_today` VALUES ('978', '1904', '4', '8', '英法条约签订 协约国形成');
INSERT INTO `history_today` VALUES ('979', '1913', '4', '8', '中华民国第一届国会开幕');
INSERT INTO `history_today` VALUES ('980', '1913', '4', '8', '美国总统威尔逊发表国情咨文受到欢迎');
INSERT INTO `history_today` VALUES ('981', '1938', '4', '8', '加纳外交家科菲-安南出生');
INSERT INTO `history_today` VALUES ('982', '1241', '4', '9', '列格尼卡战役');
INSERT INTO `history_today` VALUES ('983', '1865', '4', '9', '美国南北战争');
INSERT INTO `history_today` VALUES ('984', '1907', '4', '9', '死刑和暗杀在俄国不断上升');
INSERT INTO `history_today` VALUES ('985', '1924', '4', '9', '道威斯计划发表');
INSERT INTO `history_today` VALUES ('986', '1936', '4', '9', '张学良飞抵延安，与周恩来共谈合作抗日');
INSERT INTO `history_today` VALUES ('987', '1940', '4', '9', '纳粹入侵斯堪的纳维亚半岛');
INSERT INTO `history_today` VALUES ('988', '1941', '4', '9', '中国军队于江西上高歼日军两万');
INSERT INTO `history_today` VALUES ('989', '1942', '4', '9', '盟军3.6万人在菲律宾被日军俘虏');
INSERT INTO `history_today` VALUES ('990', '1944', '4', '9', '戴高乐成为法国军队总司令');
INSERT INTO `history_today` VALUES ('991', '1948', '4', '9', '贝京信奉法西斯　制造德尔亚辛村惨案');
INSERT INTO `history_today` VALUES ('992', '1606', '4', '10', '弗吉尼亚公司在英国国王詹姆士一世的支持下建立，专门负责在北美建立殖民地。');
INSERT INTO `history_today` VALUES ('993', '1741', '4', '10', '奥地利王位继承战争');
INSERT INTO `history_today` VALUES ('994', '1790', '4', '10', '美国专利体系建立');
INSERT INTO `history_today` VALUES ('995', '1840', '4', '10', '英国议会就对华战争问题举行辩论');
INSERT INTO `history_today` VALUES ('996', '1857', '4', '10', '驻扎在密拉特的英国印度士兵起义，这是印度独立运动的一部分。');
INSERT INTO `history_today` VALUES ('997', '1874', '4', '10', '第一个植树节在美国内布拉斯加州举行');
INSERT INTO `history_today` VALUES ('998', '1896', '4', '10', '斯皮里东·路易斯获得第一届现代奥运会马拉松项目金牌');
INSERT INTO `history_today` VALUES ('999', '1905', '4', '10', '京师大学堂举办了第一次运动会');
INSERT INTO `history_today` VALUES ('1000', '1906', '4', '10', '中国公学在上海创办');
INSERT INTO `history_today` VALUES ('1001', '1912', '4', '10', '泰坦尼克号从南安普顿港出发，开始了它的第一次，也是唯一一次航行。');
INSERT INTO `history_today` VALUES ('1002', '1241', '4', '11', '蒙古军队在巴图汗的率领下击败匈牙利军队');
INSERT INTO `history_today` VALUES ('1003', '1381', '4', '11', '朱元璋建陵墓');
INSERT INTO `history_today` VALUES ('1004', '1636', '4', '11', '清太宗皇太极改“大金”国号为“大清”，称帝');
INSERT INTO `history_today` VALUES ('1005', '1865', '4', '11', '美国总统林肯发表最后一次公众讲话');
INSERT INTO `history_today` VALUES ('1006', '1868', '4', '11', '日本结束幕府政治');
INSERT INTO `history_today` VALUES ('1007', '1899', '4', '11', '美国占领菲律宾');
INSERT INTO `history_today` VALUES ('1008', '1905', '4', '11', '京师大学堂举办了第一次运动会');
INSERT INTO `history_today` VALUES ('1009', '1912', '4', '11', '中国佛教总会成立');
INSERT INTO `history_today` VALUES ('1010', '1919', '4', '11', '国际劳工组织成立');
INSERT INTO `history_today` VALUES ('1011', '1919', '4', '11', '大韩民国临时政府在上海成立');
INSERT INTO `history_today` VALUES ('1012', '1204', '4', '12', '十字军洗劫君士坦丁堡');
INSERT INTO `history_today` VALUES ('1013', '1847', '4', '12', '容闳前往美国留学');
INSERT INTO `history_today` VALUES ('1014', '1861', '4', '12', '美国南北战争正式爆发');
INSERT INTO `history_today` VALUES ('1015', '1898', '4', '12', '康有为等成立保国会');
INSERT INTO `history_today` VALUES ('1016', '1904', '4', '12', '藏军与英军战于江孜');
INSERT INTO `history_today` VALUES ('1017', '1919', '4', '12', '苏俄第一次星期六义务劳动');
INSERT INTO `history_today` VALUES ('1018', '1921', '4', '12', '美国总统哈定拒绝参加国际联盟');
INSERT INTO `history_today` VALUES ('1019', '1922', '4', '12', '胖子阿巴克尔演艺生涯结束');
INSERT INTO `history_today` VALUES ('1020', '1924', '4', '12', '泰戈尔访问中国');
INSERT INTO `history_today` VALUES ('1021', '1927', '4', '12', '“四·一二”反革命政变');
INSERT INTO `history_today` VALUES ('1022', '1904', '4', '13', '俄舰队司令在海战中葬生');
INSERT INTO `history_today` VALUES ('1023', '1919', '4', '13', '印度发生阿姆利则惨案');
INSERT INTO `history_today` VALUES ('1024', '1919', '4', '13', '巴伐利亚苏维埃共和国建立');
INSERT INTO `history_today` VALUES ('1025', '1939', '4', '13', '黄河大合唱在延安首演');
INSERT INTO `history_today` VALUES ('1026', '1941', '4', '13', '日苏中立条约签订');
INSERT INTO `history_today` VALUES ('1027', '1944', '4', '13', '苏联收复刻赤半岛');
INSERT INTO `history_today` VALUES ('1028', '1945', '4', '13', '苏联红军收复维也纳');
INSERT INTO `history_today` VALUES ('1029', '1949', '4', '13', '国共两党就国内和平协定举行谈判');
INSERT INTO `history_today` VALUES ('1030', '1950', '4', '13', '新中国第一部法规《婚姻法》诞生');
INSERT INTO `history_today` VALUES ('1031', '1950', '4', '13', '中国与印度尼西亚共和国建交');
INSERT INTO `history_today` VALUES ('1032', '1898', '4', '14', '清政府与美国签订《粤汉铁路借款合同》');
INSERT INTO `history_today` VALUES ('1033', '1900', '4', '14', '世界博览会在巴黎开幕');
INSERT INTO `history_today` VALUES ('1034', '1910', '4', '14', '美国铺设第一条海底电缆');
INSERT INTO `history_today` VALUES ('1035', '1918', '4', '14', '毛泽东等发起长沙新民学会');
INSERT INTO `history_today` VALUES ('1036', '1923', '4', '14', '全国教育统计普查结束');
INSERT INTO `history_today` VALUES ('1037', '1927', '4', '14', '共产国际执行委员会指出蒋介石已成了工人运动的敌人');
INSERT INTO `history_today` VALUES ('1038', '1928', '4', '14', '揭露日本侵华野心第一人');
INSERT INTO `history_today` VALUES ('1039', '1931', '4', '14', '西班牙第二共和国建立');
INSERT INTO `history_today` VALUES ('1040', '1933', '4', '14', '陈独秀案开始审理；盛世才主政新疆。');
INSERT INTO `history_today` VALUES ('1041', '1946', '4', '14', '东北民主联军击战长春伪满军警部队');
INSERT INTO `history_today` VALUES ('1042', '1861', '4', '15', '林肯政府发布讨伐令，向南部联盟宣战，南北战争爆发');
INSERT INTO `history_today` VALUES ('1043', '1891', '4', '15', '加拿大医生班廷发现胰岛素');
INSERT INTO `history_today` VALUES ('1044', '1896', '4', '15', '第一届现代奥运会在希腊雅典结束');
INSERT INTO `history_today` VALUES ('1045', '1907', '4', '15', '俄国和日本军队撤离满洲');
INSERT INTO `history_today` VALUES ('1046', '1912', '4', '15', '泰坦尼克号与冰山相撞后沉没');
INSERT INTO `history_today` VALUES ('1047', '1914', '4', '15', '中国拒绝接受麦克马洪线');
INSERT INTO `history_today` VALUES ('1048', '1917', '4', '15', '黄兴归葬岳麓山');
INSERT INTO `history_today` VALUES ('1049', '1919', '4', '15', '《新青年》提倡男女公开社交');
INSERT INTO `history_today` VALUES ('1050', '1926', '4', '15', '军阀禁止刘海粟用裸体模特儿教学');
INSERT INTO `history_today` VALUES ('1051', '1926', '4', '15', '冯玉祥退却　张作霖入京');
INSERT INTO `history_today` VALUES ('1052', '1071', '4', '16', '东罗马帝国（即拜占庭帝国）在意大利境内的统治正式结束');
INSERT INTO `history_today` VALUES ('1053', '1903', '4', '16', '基什尼奥发生残酷大屠杀');
INSERT INTO `history_today` VALUES ('1054', '1919', '4', '16', '美国提出：山东由五国共管');
INSERT INTO `history_today` VALUES ('1055', '1922', '4', '16', '德国和俄国签订《拉巴洛条约》');
INSERT INTO `history_today` VALUES ('1056', '1925', '4', '16', '为纪念孙中山先生，广东省香山县改名“中山县”，永丰舰改名“中山舰”');
INSERT INTO `history_today` VALUES ('1057', '1927', '4', '16', '周恩来等建议武汉迅速出兵讨伐蒋介石');
INSERT INTO `history_today` VALUES ('1058', '1928', '4', '16', '日本再次出兵山东');
INSERT INTO `history_today` VALUES ('1059', '1945', '4', '16', '苏军向柏林发起总攻');
INSERT INTO `history_today` VALUES ('1060', '1946', '4', '16', '汪精卫之妻陈壁君被公审');
INSERT INTO `history_today` VALUES ('1061', '1948', '4', '16', '杜鲁门批准援外法案');
INSERT INTO `history_today` VALUES ('1062', '1492', '4', '17', '西班牙和哥伦布签订一份准许他航海到亚洲采购香料的合约');
INSERT INTO `history_today` VALUES ('1063', '1895', '4', '17', '《马关条约》签订');
INSERT INTO `history_today` VALUES ('1064', '1898', '4', '17', '资产阶级维新派成立保国会');
INSERT INTO `history_today` VALUES ('1065', '1912', '4', '17', '俄国连那金矿工人暴动');
INSERT INTO `history_today` VALUES ('1066', '1917', '4', '17', '列宁发表《四月提纲》');
INSERT INTO `history_today` VALUES ('1067', '1919', '4', '17', '卓别林等建立自己的电影公司');
INSERT INTO `history_today` VALUES ('1068', '1934', '4', '17', '法国取消了托洛茨基的政治避难权');
INSERT INTO `history_today` VALUES ('1069', '1934', '4', '17', '日本发表侵华宣言--天羽声明');
INSERT INTO `history_today` VALUES ('1070', '1941', '4', '17', '纳粹德国侵入南斯拉夫');
INSERT INTO `history_today` VALUES ('1071', '1942', '4', '17', '在缅中国远征军被日军击溃');
INSERT INTO `history_today` VALUES ('1072', '1025', '4', '18', '波列斯瓦夫一世加冕为历史上第一位波兰国王');
INSERT INTO `history_today` VALUES ('1073', '1885', '4', '18', '中日签订《天津条约》');
INSERT INTO `history_today` VALUES ('1074', '1897', '4', '18', '希土战争爆发');
INSERT INTO `history_today` VALUES ('1075', '1906', '4', '18', '革命党和君主立宪派展开论战');
INSERT INTO `history_today` VALUES ('1076', '1906', '4', '18', '美国旧金山大地震　千人丧生');
INSERT INTO `history_today` VALUES ('1077', '1918', '4', '18', '毛泽东、蔡和森等人在长沙创办新民学会');
INSERT INTO `history_today` VALUES ('1078', '1927', '4', '18', '蒋介石建立南京国民政府');
INSERT INTO `history_today` VALUES ('1079', '1942', '4', '18', '美国杜立德轰炸机编队首次空袭东京');
INSERT INTO `history_today` VALUES ('1080', '1947', '4', '18', '蒋介石改组“国民政府”');
INSERT INTO `history_today` VALUES ('1081', '1949', '4', '18', '中国新民主主义青年团第一次全国代表大会结束');
INSERT INTO `history_today` VALUES ('1082', '1775', '4', '19', '美国独立战争爆发');
INSERT INTO `history_today` VALUES ('1083', '1839', '4', '19', '欧洲多国签订伦敦条约，正式承认比利时独立。');
INSERT INTO `history_today` VALUES ('1084', '1906', '4', '19', '旧金山发生大地震');
INSERT INTO `history_today` VALUES ('1085', '1927', '4', '19', '武汉国民政府挥师北伐');
INSERT INTO `history_today` VALUES ('1086', '1933', '4', '19', '罗斯福取消美元的金本位制');
INSERT INTO `history_today` VALUES ('1087', '1943', '4', '19', '华沙犹太人爆发反纳粹起义');
INSERT INTO `history_today` VALUES ('1088', '1948', '4', '19', '国民党在大陆举行最后一次选举');
INSERT INTO `history_today` VALUES ('1089', '1950', '4', '19', '中央发出《关于在报纸刊物上展开批评和自我批评的决定》');
INSERT INTO `history_today` VALUES ('1090', '1954', '4', '19', '中共中央决定成立编制五年计划纲要草案八人工作小组');
INSERT INTO `history_today` VALUES ('1091', '1954', '4', '19', '周恩来出席日内瓦会议');
INSERT INTO `history_today` VALUES ('1092', '1902', '4', '20', '新艺术作品在巴黎展出');
INSERT INTO `history_today` VALUES ('1093', '1910', '4', '20', '哈雷彗星到达近日点');
INSERT INTO `history_today` VALUES ('1094', '1913', '4', '20', '邓肯宣布无限期取消一切演出活动');
INSERT INTO `history_today` VALUES ('1095', '1930', '4', '20', '印度白沙瓦起义');
INSERT INTO `history_today` VALUES ('1096', '1932', '4', '20', '由红一军团和红五军团组成的东路军攻占漳州');
INSERT INTO `history_today` VALUES ('1097', '1934', '4', '20', '宋庆龄等呼吁全体总动员武装抗日');
INSERT INTO `history_today` VALUES ('1098', '1934', '4', '20', '《中国人民对日作战的基本纲领》发表');
INSERT INTO `history_today` VALUES ('1099', '1937', '4', '20', '托马斯-曼呼吁拯救德国文化');
INSERT INTO `history_today` VALUES ('1100', '1940', '4', '20', '电影《魂断蓝桥》首映');
INSERT INTO `history_today` VALUES ('1101', '1945', '4', '20', '王明公开向中共中央作检查');
INSERT INTO `history_today` VALUES ('1102', '1153', '4', '21', '金朝改燕京为中都');
INSERT INTO `history_today` VALUES ('1103', '1899', '4', '21', '美西战争爆发');
INSERT INTO `history_today` VALUES ('1104', '1901', '4', '21', '罗丹的作品《维克多·雨果》引起轰动');
INSERT INTO `history_today` VALUES ('1105', '1901', '4', '21', '筹办“新政”的机构成立');
INSERT INTO `history_today` VALUES ('1106', '1930', '4', '21', '五大国签署海军条约');
INSERT INTO `history_today` VALUES ('1107', '1938', '4', '21', '中共中央发出《对平原游击战的指示》');
INSERT INTO `history_today` VALUES ('1108', '1945', '4', '21', '中国共产党举行第七次全国代表大会的预备会');
INSERT INTO `history_today` VALUES ('1109', '1949', '4', '21', '毛泽东、朱德发布《向全国进军命令》，中国人民解放军百万雄师开始横渡长江．');
INSERT INTO `history_today` VALUES ('1110', '1953', '4', '21', '《罗马假日》公演');
INSERT INTO `history_today` VALUES ('1111', '1955', '4', '21', '中共中央农村工作部召开第三次全国农村工作会议');
INSERT INTO `history_today` VALUES ('1112', '1898', '4', '22', '严复译著《天演论》出版');
INSERT INTO `history_today` VALUES ('1113', '1915', '4', '22', '德军在第一次世界大战首次施放毒气');
INSERT INTO `history_today` VALUES ('1114', '1922', '4', '22', '孙中山允许共产党员加入国民党');
INSERT INTO `history_today` VALUES ('1115', '1925', '4', '22', '鲁迅疾呼埋葬国粹');
INSERT INTO `history_today` VALUES ('1116', '1927', '4', '22', '共产国际驻中国代表团 发表宣言谴责蒋介石');
INSERT INTO `history_today` VALUES ('1117', '1946', '4', '22', '原汪伪政府要员褚民谊被判死刑');
INSERT INTO `history_today` VALUES ('1118', '1948', '4', '22', '解放军收复延安');
INSERT INTO `history_today` VALUES ('1119', '1958', '4', '22', '中华人民共和国人民英雄纪念碑在北京天安门广场建成。');
INSERT INTO `history_today` VALUES ('1120', '1960', '4', '22', '中宣部部长陆定一发表《在列宁的革命旗帜下团结起来》');
INSERT INTO `history_today` VALUES ('1121', '1961', '4', '22', '法国秘密军在阿尔及利亚叛乱 ');
INSERT INTO `history_today` VALUES ('1122', '1910', '4', '23', '汪精卫等谋刺载沣未遂被捕');
INSERT INTO `history_today` VALUES ('1123', '1945', '4', '23', '中共第七次全国代表大会开幕');
INSERT INTO `history_today` VALUES ('1124', '1949', '4', '23', '人民解放军占领南京，中国人民解放军海军诞生');
INSERT INTO `history_today` VALUES ('1125', '1949', '4', '23', '人民解放军突破千里江防　毛泽东赋诗追穷寇');
INSERT INTO `history_today` VALUES ('1126', '1956', '4', '23', '第一架国产喷气式歼击机试制成功');
INSERT INTO `history_today` VALUES ('1127', '1960', '4', '23', '我国第一艘万吨轮在大跃进狂热中下水');
INSERT INTO `history_today` VALUES ('1128', '1960', '4', '23', '第一艘万吨级远洋货轮--“东风号”下水');
INSERT INTO `history_today` VALUES ('1129', '1974', '4', '23', '葡萄牙尉官运动发动“红色革命”');
INSERT INTO `history_today` VALUES ('1130', '1975', '4', '23', '锡金被并入印度');
INSERT INTO `history_today` VALUES ('1131', '1975', '4', '23', '南越内阁辞职，美国总统宣布越南战争结束');
INSERT INTO `history_today` VALUES ('1132', '1192', '4', '24', '卢沟桥建成');
INSERT INTO `history_today` VALUES ('1133', '1792', '4', '24', '里勒创作《马赛曲》');
INSERT INTO `history_today` VALUES ('1134', '1800', '4', '24', '美国国会图书馆成立');
INSERT INTO `history_today` VALUES ('1135', '1905', '4', '24', '清廷废除死刑中的凌迟、枭首、戮尸');
INSERT INTO `history_today` VALUES ('1136', '1916', '4', '24', '爱尔兰爆发复活节起义');
INSERT INTO `history_today` VALUES ('1137', '1925', '4', '24', '陈诚等发起孙中山主义学会');
INSERT INTO `history_today` VALUES ('1138', '1925', '4', '24', '莽原社成立');
INSERT INTO `history_today` VALUES ('1139', '1931', '4', '24', '顾顺章叛变，中共中央机关险遭破坏');
INSERT INTO `history_today` VALUES ('1140', '1937', '4', '24', '中共中央在抗日战争时期的机关刊物《解放》在延安创刊');
INSERT INTO `history_today` VALUES ('1141', '1937', '4', '24', '新华书店在延安成立');
INSERT INTO `history_today` VALUES ('1142', '1644', '4', '25', '明思宗崇祯皇帝在景山自缢，明朝灭亡');
INSERT INTO `history_today` VALUES ('1143', '1886', '4', '25', '中法签订越南边界通商章程');
INSERT INTO `history_today` VALUES ('1144', '1925', '4', '25', '兴登堡当选德国总统');
INSERT INTO `history_today` VALUES ('1145', '1926', '4', '25', '礼萨·汗自立为,波斯国王');
INSERT INTO `history_today` VALUES ('1146', '1927', '4', '25', '萧楚女被捕牺牲');
INSERT INTO `history_today` VALUES ('1147', '1927', '4', '25', '武汉举行了三十万人的反蒋大会');
INSERT INTO `history_today` VALUES ('1148', '1930', '4', '25', '中共要求配合上海罢工');
INSERT INTO `history_today` VALUES ('1149', '1932', '4', '25', '金日成创建抗日武装');
INSERT INTO `history_today` VALUES ('1150', '1936', '4', '25', '中国共产党提议建立抗日人民阵线');
INSERT INTO `history_today` VALUES ('1151', '1945', '4', '25', '盟军与苏军在德国易北河会师');
INSERT INTO `history_today` VALUES ('1152', '1565', '4', '27', '西班牙人建立了在菲律宾的第一个殖民地');
INSERT INTO `history_today` VALUES ('1153', '1902', '4', '27', '中国教育会在上海成立');
INSERT INTO `history_today` VALUES ('1154', '1903', '4', '27', '中国最早的工科大学天津北洋大学开学');
INSERT INTO `history_today` VALUES ('1155', '1903', '4', '27', '上海开展拒俄运动');
INSERT INTO `history_today` VALUES ('1156', '1905', '4', '27', '俄国第一届杜马开幕');
INSERT INTO `history_today` VALUES ('1157', '1909', '4', '27', '霍元甲轰动上海滩');
INSERT INTO `history_today` VALUES ('1158', '1911', '4', '27', '黄花岗起义');
INSERT INTO `history_today` VALUES ('1159', '1924', '4', '27', '道斯计划被提交给战争赔偿小组');
INSERT INTO `history_today` VALUES ('1160', '1927', '4', '27', '蒋介石发动上海“四.一二”政变');
INSERT INTO `history_today` VALUES ('1161', '1927', '4', '27', '中共“五大”开幕');
INSERT INTO `history_today` VALUES ('1162', '1906', '4', '28', '革命党与改良派大论战');
INSERT INTO `history_today` VALUES ('1163', '1919', '4', '28', '高尔察克白卫军进攻失败');
INSERT INTO `history_today` VALUES ('1164', '1922', '4', '28', '直奉战争爆发');
INSERT INTO `history_today` VALUES ('1165', '1928', '4', '28', '朱德、毛泽东井冈山会师');
INSERT INTO `history_today` VALUES ('1166', '1936', '4', '28', '16岁的法鲁克继承埃及王位');
INSERT INTO `history_today` VALUES ('1167', '1945', '4', '28', '新四军阜宁大捷 ');
INSERT INTO `history_today` VALUES ('1168', '1945', '4', '28', '墨索里尼被处决');
INSERT INTO `history_today` VALUES ('1169', '1955', '4', '28', '百花齐放百家争鸣方针提出');
INSERT INTO `history_today` VALUES ('1170', '1956', '4', '28', '毛泽东提出科学、文艺都要百花齐放、百家争鸣');
INSERT INTO `history_today` VALUES ('1171', '1964', '4', '28', '毛泽东在杭州对社队办企业、核算单位、粮食政策等问题发表了意见');
INSERT INTO `history_today` VALUES ('1172', '1902', '4', '29', '美国参议院轻易通过排斥华人法案');
INSERT INTO `history_today` VALUES ('1173', '1903', '4', '29', '法国开始关闭所有的修道院');
INSERT INTO `history_today` VALUES ('1174', '1903', '4', '29', '留日学生组织“拒俄运动”');
INSERT INTO `history_today` VALUES ('1175', '1916', '4', '29', '英国特遣部队向土耳其投降');
INSERT INTO `history_today` VALUES ('1176', '1921', '4', '29', '协约国向德国递交战争索赔帐单');
INSERT INTO `history_today` VALUES ('1177', '1921', '4', '29', '协约国伦敦会议召开');
INSERT INTO `history_today` VALUES ('1178', '1922', '4', '29', '直奉大战爆发');
INSERT INTO `history_today` VALUES ('1179', '1923', '4', '29', '历时一年的全国教育统计普查结束');
INSERT INTO `history_today` VALUES ('1180', '1928', '4', '29', '土耳其人放弃伊斯兰教并改用英文字母');
INSERT INTO `history_today` VALUES ('1181', '1932', '4', '29', '日本侵华军总司令白川大将被炸毙命');
INSERT INTO `history_today` VALUES ('1182', '1872', '4', '30', '《申报》创刊');
INSERT INTO `history_today` VALUES ('1183', '1896', '4', '30', '李鸿章出使俄国');
INSERT INTO `history_today` VALUES ('1184', '1900', '4', '30', '夏威夷成为美国的准州');
INSERT INTO `history_today` VALUES ('1185', '1905', '4', '30', '京师大学堂首次举办运动会');
INSERT INTO `history_today` VALUES ('1186', '1919', '4', '30', '巴黎和会决定将德国在山东的权益转给日本');
INSERT INTO `history_today` VALUES ('1187', '1925', '4', '30', '装饰艺术在巴黎诞生');
INSERT INTO `history_today` VALUES ('1188', '1931', '4', '30', '第二次反“围剿”取得胜利');
INSERT INTO `history_today` VALUES ('1189', '1934', '4', '30', '奥地利总理陶尔斐斯以独裁对抗纳粹');
INSERT INTO `history_today` VALUES ('1190', '1936', '4', '30', '意大利攻占埃塞俄比亚首都');
INSERT INTO `history_today` VALUES ('1191', '1936', '4', '30', '日本向东北武装移民');
INSERT INTO `history_today` VALUES ('1192', '1707', '5', '1', '英格兰（包含威尔士）和苏格兰在大不列颠王国的名称下实行联合');
INSERT INTO `history_today` VALUES ('1193', '1773', '5', '1', '清朝开设《四库全书》编纂馆');
INSERT INTO `history_today` VALUES ('1194', '1790', '5', '1', '美国完成第一次人口普查');
INSERT INTO `history_today` VALUES ('1195', '1834', '5', '1', '奴隶制在英国领土范围内被废除');
INSERT INTO `history_today` VALUES ('1196', '1840', '5', '1', '英国正式发行世界上首枚邮票黑便士，正面为维多利亚女王的头像。');
INSERT INTO `history_today` VALUES ('1197', '1851', '5', '1', '第一届国际博览会在英国伦敦开幕');
INSERT INTO `history_today` VALUES ('1198', '1886', '5', '1', '美国芝加哥发生大规模游行示威——干草市场暴乱，要求八小时工作制');
INSERT INTO `history_today` VALUES ('1199', '1894', '5', '1', '甲午战争：日本宣布对中国开战');
INSERT INTO `history_today` VALUES ('1200', '1898', '5', '1', '美西战争——美国海军占领马尼拉');
INSERT INTO `history_today` VALUES ('1201', '1914', '5', '1', '袁世凯颁布《中华民国约法》');
INSERT INTO `history_today` VALUES ('1202', '1808', '5', '2', '西班牙马德里居民起义反抗法国占领');
INSERT INTO `history_today` VALUES ('1203', '1842', '5', '2', '英国宪章运动爆发');
INSERT INTO `history_today` VALUES ('1204', '1895', '5', '2', '广东南海举人康有为等人在北京发起公车上书，要求改革');
INSERT INTO `history_today` VALUES ('1205', '1895', '5', '2', '英国南非公司将在赞比亚以南的领地组成罗得西亚');
INSERT INTO `history_today` VALUES ('1206', '1921', '5', '2', '大都市展览会展出后印象现代艺术');
INSERT INTO `history_today` VALUES ('1207', '1933', '5', '2', '希特勒解散所有工会');
INSERT INTO `history_today` VALUES ('1208', '1936', '5', '2', '红军结束东征作战');
INSERT INTO `history_today` VALUES ('1209', '1937', '5', '2', '中共中央召开全国代表会议');
INSERT INTO `history_today` VALUES ('1210', '1940', '5', '2', '枣宜会战开始');
INSERT INTO `history_today` VALUES ('1211', '1942', '5', '2', '中共中央在延安杨家岭召开延安文艺工作者座谈会');
INSERT INTO `history_today` VALUES ('1212', '1875', '5', '3', '清政府任命左宗棠督办新疆军务');
INSERT INTO `history_today` VALUES ('1213', '1901', '5', '3', '清政府向列强赔款四亿五千万两');
INSERT INTO `history_today` VALUES ('1214', '1904', '5', '3', '日军占领大连');
INSERT INTO `history_today` VALUES ('1215', '1913', '5', '3', '善后借款案在国会引起混乱');
INSERT INTO `history_today` VALUES ('1216', '1917', '5', '3', '俄国临时政府发生第一次危机');
INSERT INTO `history_today` VALUES ('1217', '1923', '5', '3', '人类首次不停顿横贯大陆飞行');
INSERT INTO `history_today` VALUES ('1218', '1923', '5', '3', '国空军的奥克利·凯利和麦克里迪中尉完成人类首次不停顿横贯大陆飞行');
INSERT INTO `history_today` VALUES ('1219', '1926', '5', '3', '英国工人总罢工');
INSERT INTO `history_today` VALUES ('1220', '1926', '5', '3', '第六届广州农讲所开学');
INSERT INTO `history_today` VALUES ('1221', '1927', '5', '3', '华纳制片公司推出了电影史上第一部有声片');
INSERT INTO `history_today` VALUES ('1222', '1260', '5', '5', '忽必烈成为蒙古帝国大汗。');
INSERT INTO `history_today` VALUES ('1223', '1640', '5', '5', '英国国王查理一世解散议会（“短期国会”）。');
INSERT INTO `history_today` VALUES ('1224', '1835', '5', '5', '欧洲大陆上的第一条铁路在比利时开通，从布鲁塞尔至梅赫伦。');
INSERT INTO `history_today` VALUES ('1225', '1898', '5', '5', '张之洞发表《劝学篇》');
INSERT INTO `history_today` VALUES ('1226', '1904', '5', '5', '藏兵与入侵英军在江孜激战');
INSERT INTO `history_today` VALUES ('1227', '1905', '5', '5', '俄太平洋舰队在对马海峡覆没');
INSERT INTO `history_today` VALUES ('1228', '1912', '5', '5', '第五届奥林匹克运动会开幕');
INSERT INTO `history_today` VALUES ('1229', '1921', '5', '5', '孙中山就任非常大总统');
INSERT INTO `history_today` VALUES ('1230', '1922', '5', '5', '中国社会主义青年团第一次代表大会召开');
INSERT INTO `history_today` VALUES ('1231', '1923', '5', '5', '山东临城发生惊动中外的火车大劫案');
INSERT INTO `history_today` VALUES ('1232', '1527', '5', '6', '西班牙和神圣罗马帝国军队攻入罗马');
INSERT INTO `history_today` VALUES ('1233', '1682', '5', '6', '法国国王路易十四迁居凡尔赛宫。');
INSERT INTO `history_today` VALUES ('1234', '1840', '5', '6', '英国发行了世界上最早的邮票');
INSERT INTO `history_today` VALUES ('1235', '1871', '5', '6', '伟大的发明者亚维克多·格林尼教授出生于法国瑟尔堡');
INSERT INTO `history_today` VALUES ('1236', '1889', '5', '6', '埃菲尔铁塔于世界博览会上正式对外开放');
INSERT INTO `history_today` VALUES ('1237', '1919', '5', '6', '五四学潮扩大到全国');
INSERT INTO `history_today` VALUES ('1238', '1922', '5', '6', '第一次全国劳动大会结束');
INSERT INTO `history_today` VALUES ('1239', '1933', '5', '6', '南京国民政府谋求与日在华北停战');
INSERT INTO `history_today` VALUES ('1240', '1934', '5', '6', '中共中央批评肃反扩大化');
INSERT INTO `history_today` VALUES ('1241', '1937', '5', '6', '德国巨型载客飞艇“兴登堡”号在美国新泽西州焚毁，从此飞艇退出了商业飞行的舞台。');
INSERT INTO `history_today` VALUES ('1242', '1821', '5', '7', '英国接管塞拉利昂、冈比亚和黄金海岸，组成英属西非');
INSERT INTO `history_today` VALUES ('1243', '1832', '5', '7', '希腊脱离奥斯曼帝国独立');
INSERT INTO `history_today` VALUES ('1244', '1848', '5', '7', '普鲁士军队粉碎华沙起义');
INSERT INTO `history_today` VALUES ('1245', '1916', '5', '7', '护国军政府设立军务院');
INSERT INTO `history_today` VALUES ('1246', '1935', '5', '7', '日本向佳木斯武装移民');
INSERT INTO `history_today` VALUES ('1247', '1937', '5', '7', '毛泽东、刘少奇作报告为实现抗日民族统一战线而努力');
INSERT INTO `history_today` VALUES ('1248', '1939', '5', '7', '德、意宣布结成军事政治同盟，罗马—柏林轴心建立。');
INSERT INTO `history_today` VALUES ('1249', '1940', '5', '7', '英国首相张伯伦提出辞职');
INSERT INTO `history_today` VALUES ('1250', '1945', '5', '7', '法西斯德国无条件投降');
INSERT INTO `history_today` VALUES ('1251', '1946', '5', '7', '英国和法国从叙利亚撤军');
INSERT INTO `history_today` VALUES ('1252', '1884', '5', '8', '《点石斋画报》在上海创刊');
INSERT INTO `history_today` VALUES ('1253', '1916', '5', '8', '护国军军务院成立');
INSERT INTO `history_today` VALUES ('1254', '1933', '5', '8', '蒋介石发表攘外必先安内的演讲');
INSERT INTO `history_today` VALUES ('1255', '1942', '5', '8', '日本自珍珠港事件后首次遭受重大打击');
INSERT INTO `history_today` VALUES ('1256', '1945', '5', '8', '德国签署无条件投降书');
INSERT INTO `history_today` VALUES ('1257', '1945', '5', '8', '欧洲反法西斯战争胜利结束');
INSERT INTO `history_today` VALUES ('1258', '1952', '5', '8', '珠穆朗玛峰正名');
INSERT INTO `history_today` VALUES ('1259', '1952', '5', '8', '盟军在朝鲜发动最大规模空袭');
INSERT INTO `history_today` VALUES ('1260', '1955', '5', '8', '爱国华侨领袖事司徒美登在北京逝世');
INSERT INTO `history_today` VALUES ('1261', '1957', '5', '8', '中央统战部开始召开各民主党派负责人、无党派民主人士座谈会');
INSERT INTO `history_today` VALUES ('1262', '1502', '5', '9', '哥伦布最后一次启航出发，探索他认为的印度（另一说为5月11日）');
INSERT INTO `history_today` VALUES ('1263', '1900', '5', '9', '义和团深入京城清廷频令严禁');
INSERT INTO `history_today` VALUES ('1264', '1901', '5', '9', '20世纪第一次股市暴跌');
INSERT INTO `history_today` VALUES ('1265', '1915', '5', '9', '袁世凯接受丧权辱国的“二十一条”');
INSERT INTO `history_today` VALUES ('1266', '1919', '5', '9', '蔡元培辞去北京大学校长职务');
INSERT INTO `history_today` VALUES ('1267', '1925', '5', '9', '全国第二次劳动大会和广东省第一次农民代表大会结束');
INSERT INTO `history_today` VALUES ('1268', '1931', '5', '9', '中共中央作出《目前的政治形势及党的紧急任务》的决议');
INSERT INTO `history_today` VALUES ('1269', '1932', '5', '9', '中共痛斥停战协定');
INSERT INTO `history_today` VALUES ('1270', '1936', '5', '9', '意大利占领埃塞俄比亚');
INSERT INTO `history_today` VALUES ('1271', '1939', '5', '9', '八路军于五台山地区重创日军');
INSERT INTO `history_today` VALUES ('1272', '1901', '5', '10', '秦力山等创办《国民报》杂志');
INSERT INTO `history_today` VALUES ('1273', '1905', '5', '10', '上海工商界反对续订“美约”');
INSERT INTO `history_today` VALUES ('1274', '1906', '5', '10', '俄国第一届国家杜马会议召开');
INSERT INTO `history_today` VALUES ('1275', '1924', '5', '10', '中共中央执行委员会扩大会议在上海召开');
INSERT INTO `history_today` VALUES ('1276', '1927', '5', '10', '中国共产主义青年团第四次全国代表大会在武汉召开');
INSERT INTO `history_today` VALUES ('1277', '1933', '5', '10', '纳粹焚烧禁书');
INSERT INTO `history_today` VALUES ('1278', '1939', '5', '10', '毛泽东为“鲁艺”成立一周年题词');
INSERT INTO `history_today` VALUES ('1279', '1940', '5', '10', '丘吉尔临危受命出任英国首相');
INSERT INTO `history_today` VALUES ('1280', '1940', '5', '10', '德军发动“闪电战”进入荷兰比利时');
INSERT INTO `history_today` VALUES ('1281', '1941', '5', '10', '希特勒助手赫斯飞往苏格兰');
INSERT INTO `history_today` VALUES ('1282', '1507', '5', '11', '法国吞并意大利的热那亚');
INSERT INTO `history_today` VALUES ('1283', '1824', '5', '11', '英国军队占领缅甸仰光。');
INSERT INTO `history_today` VALUES ('1284', '1860', '5', '11', '世界史上著名的“千人军”开始远征');
INSERT INTO `history_today` VALUES ('1285', '1901', '5', '11', '世界上第一起交通罚款');
INSERT INTO `history_today` VALUES ('1286', '1926', '5', '11', '“诺加”号飞艇开始飞艇首次飞越北极');
INSERT INTO `history_today` VALUES ('1287', '1939', '5', '11', '《黄河大合唱》首次演唱');
INSERT INTO `history_today` VALUES ('1288', '1944', '5', '11', '中央发出《关于敌进攻河南情况下的工作方针的指示》');
INSERT INTO `history_today` VALUES ('1289', '1949', '5', '11', '联合国大会投票同意以色列加入联合国');
INSERT INTO `history_today` VALUES ('1290', '1950', '5', '11', '我国与丹麦建交');
INSERT INTO `history_today` VALUES ('1291', '1957', '5', '11', '我国政府发表声明谴责美国导弹部队进驻台湾');
INSERT INTO `history_today` VALUES ('1292', '1870', '5', '12', '缅尼托巴加入加拿大。');
INSERT INTO `history_today` VALUES ('1293', '1909', '5', '12', '著名影星凯瑟琳·赫本出生于美国');
INSERT INTO `history_today` VALUES ('1294', '1915', '5', '12', '卢西塔尼亚号客轮被德军鱼雷击沉');
INSERT INTO `history_today` VALUES ('1295', '1931', '5', '12', '张国焘主持鄂豫皖中央分局');
INSERT INTO `history_today` VALUES ('1296', '1939', '5', '12', '诺门坎事件发生');
INSERT INTO `history_today` VALUES ('1297', '1940', '5', '12', '日军执行“101号作战协定”空袭重庆');
INSERT INTO `history_today` VALUES ('1298', '1943', '5', '12', '日本在台湾实行海军“志愿兵制度”');
INSERT INTO `history_today` VALUES ('1299', '1943', '5', '12', '北非的战争结束');
INSERT INTO `history_today` VALUES ('1300', '1949', '5', '12', '解放军发动上海战役');
INSERT INTO `history_today` VALUES ('1301', '1949', '5', '12', '中共中央决定建立华中局');
INSERT INTO `history_today` VALUES ('1302', '1883', '5', '13', '爱迪生发现在真空玻璃泡中可从金属板极通电流到热灯丝极。');
INSERT INTO `history_today` VALUES ('1303', '1888', '5', '13', '巴西废除农奴制。');
INSERT INTO `history_today` VALUES ('1304', '1912', '5', '13', '英国成立空军。');
INSERT INTO `history_today` VALUES ('1305', '1922', '5', '13', '胡适呼唤好人政府');
INSERT INTO `history_today` VALUES ('1306', '1931', '5', '13', '中央苏区第二次反“围剿”告捷');
INSERT INTO `history_today` VALUES ('1307', '1941', '5', '13', '中共中央决定成立中共中央西北局');
INSERT INTO `history_today` VALUES ('1308', '1942', '5', '13', '中共中央军委决定成立陕甘宁晋绥联防军司令部');
INSERT INTO `history_today` VALUES ('1309', '1947', '5', '13', '孟良崮战役开始');
INSERT INTO `history_today` VALUES ('1310', '1947', '5', '13', '华东野战军全歼敌人的整编第七十四师');
INSERT INTO `history_today` VALUES ('1311', '1954', '5', '13', '我国第一座大型山谷水库——永定河官厅水库竣工启用。');
INSERT INTO `history_today` VALUES ('1312', '1900', '5', '14', '第二届奥运会在法国首都巴黎举行');
INSERT INTO `history_today` VALUES ('1313', '1905', '5', '14', '袁世凯练成北洋新军');
INSERT INTO `history_today` VALUES ('1314', '1911', '5', '14', '长沙万人集会掀起保路运动');
INSERT INTO `history_today` VALUES ('1315', '1926', '5', '14', '“诺加”号飞艇飞行５４００千米，完成了飞艇首次横越北极的飞行');
INSERT INTO `history_today` VALUES ('1316', '1937', '5', '14', '东北军被整编');
INSERT INTO `history_today` VALUES ('1317', '1937', '5', '14', '苏区代表会议结束');
INSERT INTO `history_today` VALUES ('1318', '1943', '5', '14', '庞炳勋、孙殿英率部投日。');
INSERT INTO `history_today` VALUES ('1319', '1948', '5', '14', '以色列正式宣布成立。');
INSERT INTO `history_today` VALUES ('1320', '1953', '5', '14', '第一个五年计划开始实施。');
INSERT INTO `history_today` VALUES ('1321', '1955', '5', '14', '华沙条约组织建立');
INSERT INTO `history_today` VALUES ('1322', '1756', '5', '15', '英国向法国宣战，七年战争爆发');
INSERT INTO `history_today` VALUES ('1323', '1767', '5', '15', '热那亚把科西嘉岛卖给法国。');
INSERT INTO `history_today` VALUES ('1324', '1871', '5', '15', '德国颁布第175条，开始了德国迫害同性恋者的历史。');
INSERT INTO `history_today` VALUES ('1325', '1878', '5', '15', '日本东京证券交易所创立。');
INSERT INTO `history_today` VALUES ('1326', '1889', '5', '15', '法国巴黎埃菲尔铁塔落成开放。');
INSERT INTO `history_today` VALUES ('1327', '1904', '5', '15', '中国红十字会创立');
INSERT INTO `history_today` VALUES ('1328', '1911', '5', '15', '美最高法院裁定美孚石油公司解散');
INSERT INTO `history_today` VALUES ('1329', '1912', '5', '15', '京师大学堂改称北京大学');
INSERT INTO `history_today` VALUES ('1330', '1918', '5', '15', '鲁迅出版中国第一部白话文小说《狂人日记》');
INSERT INTO `history_today` VALUES ('1331', '1926', '5', '15', '整理党务案事件发生');
INSERT INTO `history_today` VALUES ('1332', '1804', '5', '16', '拿破仑一世宣布法国为帝国');
INSERT INTO `history_today` VALUES ('1333', '1880', '5', '16', '匈牙利总工人党建立');
INSERT INTO `history_today` VALUES ('1334', '1929', '5', '16', '第一届电影“学院奖”在好莱坞颁奖');
INSERT INTO `history_today` VALUES ('1335', '1941', '5', '16', '《解放日报》在延安创刊');
INSERT INTO `history_today` VALUES ('1336', '1943', '5', '16', '华沙犹太人区被毁灭');
INSERT INTO `history_today` VALUES ('1337', '1947', '5', '16', '国民党军第七十四师于孟良崮覆灭');
INSERT INTO `history_today` VALUES ('1338', '1947', '5', '16', '鲁南沂蒙山区孟良崮战役取得胜利');
INSERT INTO `history_today` VALUES ('1339', '1950', '5', '16', '全军参谋会议决定裁军140万');
INSERT INTO `history_today` VALUES ('1340', '1958', '5', '16', '“大跃进”运动全面展开');
INSERT INTO `history_today` VALUES ('1341', '1966', '5', '16', '毛泽东发动文化大革命');
INSERT INTO `history_today` VALUES ('1342', '1792', '5', '17', '世界上最大的证券市场——纽约证券交易所成立');
INSERT INTO `history_today` VALUES ('1343', '1927', '5', '17', '叶挺平叛武汉国民革命军独立十四师师长夏斗寅的叛变');
INSERT INTO `history_today` VALUES ('1344', '1928', '5', '17', '第九届奥林匹克运动会开幕');
INSERT INTO `history_today` VALUES ('1345', '1948', '5', '17', '临汾战役结束');
INSERT INTO `history_today` VALUES ('1346', '1949', '5', '17', '蒋介石劫运黄金白银去台湾');
INSERT INTO `history_today` VALUES ('1347', '1949', '5', '17', '中国人民解放军第四野战军解放武汉三镇：汉口、武昌、汉阳');
INSERT INTO `history_today` VALUES ('1348', '1953', '5', '17', '中央政治局举行会议讨论教育工作');
INSERT INTO `history_today` VALUES ('1349', '1954', '5', '17', '美国最高法院宣布废除黑白分校制');
INSERT INTO `history_today` VALUES ('1350', '1973', '5', '17', '美参议院专门小组开始水门事件听证会');
INSERT INTO `history_today` VALUES ('1351', '1975', '5', '17', '法国一箭双星试验成功');
INSERT INTO `history_today` VALUES ('1352', '1764', '5', '18', '锡伯族迁移到新疆');
INSERT INTO `history_today` VALUES ('1353', '1917', '5', '18', '美国全国动员准备参加一战');
INSERT INTO `history_today` VALUES ('1354', '1927', '5', '18', '共产国际执委第八次全会召开 作出关于中国问题的决定');
INSERT INTO `history_today` VALUES ('1355', '1928', '5', '18', '毛泽东提出游击战十六字诀');
INSERT INTO `history_today` VALUES ('1356', '1936', '5', '18', '红一方面军西征战役开始');
INSERT INTO `history_today` VALUES ('1357', '1946', '5', '18', '国共合作修复花园口大堤');
INSERT INTO `history_today` VALUES ('1358', '1947', '5', '18', '镇远、靖远两舰铁锚从日本运回');
INSERT INTO `history_today` VALUES ('1359', '1953', '5', '18', '妇女第一次驾机突破音速');
INSERT INTO `history_today` VALUES ('1360', '1970', '5', '18', '肯特州立大学枪击事件');
INSERT INTO `history_today` VALUES ('1361', '1972', '5', '18', '中国与荷兰王国建交');
INSERT INTO `history_today` VALUES ('1362', '1536', '5', '19', '英国国王亨利八世第二个王后被斩首');
INSERT INTO `history_today` VALUES ('1363', '1554', '5', '19', '法国国王亨利二世侵略荷兰');
INSERT INTO `history_today` VALUES ('1364', '1568', '5', '19', '英格兰的伊丽莎白一世女王将其表妹——苏格兰女王玛丽一世投入监狱');
INSERT INTO `history_today` VALUES ('1365', '1613', '5', '19', '中国明代大旅行家、理学家和文学家徐霞客自浙江宁海出发，开始游历大山名川');
INSERT INTO `history_today` VALUES ('1366', '1792', '5', '19', '俄国入侵波兰');
INSERT INTO `history_today` VALUES ('1367', '1793', '5', '19', '法国军队从土伦出发远征埃及');
INSERT INTO `history_today` VALUES ('1368', '1853', '5', '19', '太平军西征');
INSERT INTO `history_today` VALUES ('1369', '1883', '5', '19', '纸桥战役');
INSERT INTO `history_today` VALUES ('1370', '1900', '5', '19', '列强要求带兵入京保护使馆');
INSERT INTO `history_today` VALUES ('1371', '1909', '5', '19', '巴甫洛娃倾倒巴黎');
INSERT INTO `history_today` VALUES ('1372', '1498', '5', '20', '瓦斯科·达·伽马抵达印度卡利库特');
INSERT INTO `history_today` VALUES ('1373', '1900', '5', '20', '第二届奥林匹克运动会开幕。');
INSERT INTO `history_today` VALUES ('1374', '1902', '5', '20', '古巴共和国成立');
INSERT INTO `history_today` VALUES ('1375', '1912', '5', '20', '戴季陶身陷文字狱。');
INSERT INTO `history_today` VALUES ('1376', '1912', '5', '20', '戴季陶身陷文字狱');
INSERT INTO `history_today` VALUES ('1377', '1927', '5', '20', '美国飞行员查尔斯开始人类第一次单人驾机飞越大西洋的飞行');
INSERT INTO `history_today` VALUES ('1378', '1932', '5', '20', '陶尔斐斯当选奥地利总理。');
INSERT INTO `history_today` VALUES ('1379', '1940', '5', '20', '日军血腥残杀昔阳百姓');
INSERT INTO `history_today` VALUES ('1380', '1941', '5', '20', '中共中央华中局组成');
INSERT INTO `history_today` VALUES ('1381', '1947', '5', '20', '南京发生“5.20”血案');
INSERT INTO `history_today` VALUES ('1382', '1358', '5', '21', '法国历史上最大的农民起义——“札克雷起义”爆发');
INSERT INTO `history_today` VALUES ('1383', '1638', '5', '21', '（明思宗崇帧十一年四月辛丑）张献忠在谷城向明军熊文灿伪装投降');
INSERT INTO `history_today` VALUES ('1384', '1873', '5', '21', '江西瑞昌群众拆毁美国教堂');
INSERT INTO `history_today` VALUES ('1385', '1884', '5', '21', '美国自由女神像安装竣工');
INSERT INTO `history_today` VALUES ('1386', '1900', '5', '21', '英、美、法、德各驻华公使再次照会清政府，敦促严厉镇压义和团及惩办镇压不力的官吏');
INSERT INTO `history_today` VALUES ('1387', '1902', '5', '21', '张之洞创立湖北师范学堂');
INSERT INTO `history_today` VALUES ('1388', '1904', '5', '21', '《苏报》案了结');
INSERT INTO `history_today` VALUES ('1389', '1917', '5', '21', '黎元洪罢免段祺瑞府院之争越演越烈');
INSERT INTO `history_today` VALUES ('1390', '1920', '5', '21', '墨西哥首任总统卡兰萨逝世');
INSERT INTO `history_today` VALUES ('1391', '1925', '5', '21', '东征军奉命回师广州');
INSERT INTO `history_today` VALUES ('1392', '1882', '5', '22', '朝鲜与美国签订不平等条约《朝美修好条约》');
INSERT INTO `history_today` VALUES ('1393', '1907', '5', '22', '黄冈起义爆发');
INSERT INTO `history_today` VALUES ('1394', '192', '5', '22', '东汉司徒王允等杀董卓');
INSERT INTO `history_today` VALUES ('1395', '1928', '5', '22', '湘赣边界党的第一次代表大会结束');
INSERT INTO `history_today` VALUES ('1396', '1930', '5', '22', '中国共产党提出中国革命必将引发世界革命');
INSERT INTO `history_today` VALUES ('1397', '1935', '5', '22', '长征红军通过彝族地区');
INSERT INTO `history_today` VALUES ('1398', '1938', '5', '22', '中共中央书记处发出《关于徐州失守后华中工作的指示》');
INSERT INTO `history_today` VALUES ('1399', '1939', '5', '22', '德意法西斯签订战略同盟协定');
INSERT INTO `history_today` VALUES ('1400', '1943', '5', '22', '共产国际解散');
INSERT INTO `history_today` VALUES ('1401', '1946', '5', '22', '东北民主联军从四平战略撤退');
INSERT INTO `history_today` VALUES ('1402', '1430', '5', '23', '圣女贞德在贡比涅被勃艮第军队俘虏');
INSERT INTO `history_today` VALUES ('1403', '1618', '5', '23', '布拉格掷出窗外事件爆发，后成为了三十年战争的导火索');
INSERT INTO `history_today` VALUES ('1404', '1873', '5', '23', '加拿大国会成立西北骑警，为加拿大皇家骑警的前身');
INSERT INTO `history_today` VALUES ('1405', '1914', '5', '23', '袁世凯改革全国地方官制');
INSERT INTO `history_today` VALUES ('1406', '1915', '5', '23', '意大利退出三国同盟以后与奥地利开战');
INSERT INTO `history_today` VALUES ('1407', '1917', '5', '23', '黎元洪免去段祺瑞的国务总理职务');
INSERT INTO `history_today` VALUES ('1408', '1920', '5', '23', '高阳创立私立无锡中学');
INSERT INTO `history_today` VALUES ('1409', '1928', '5', '23', '“米老鼠”卡通形象诞生');
INSERT INTO `history_today` VALUES ('1410', '1937', '5', '23', '洛克菲勒病逝');
INSERT INTO `history_today` VALUES ('1411', '1942', '5', '23', '毛泽东在延安文艺座谈会上讲话');
INSERT INTO `history_today` VALUES ('1412', '1500', '5', '24', '葡萄牙航海家迪亚士逝世');
INSERT INTO `history_today` VALUES ('1413', '1626', '5', '24', '荷兰人从印第安人手中买下纽约曼哈顿');
INSERT INTO `history_today` VALUES ('1414', '1787', '5', '24', '大陆会议在费城召开');
INSERT INTO `history_today` VALUES ('1415', '1822', '5', '24', '法国天文学家恩克预报某彗星下一次过近日点的日期为1822年5月24日');
INSERT INTO `history_today` VALUES ('1416', '1844', '5', '24', '美国发明家莫尔斯向40英里外的巴尔的摩城发出了世界上首份电报。');
INSERT INTO `history_today` VALUES ('1417', '1893', '5', '24', '九三学社发起人王卓然诞辰');
INSERT INTO `history_today` VALUES ('1418', '1911', '5', '24', '纽约公共图书馆对外开放');
INSERT INTO `history_today` VALUES ('1419', '1911', '5', '24', '共进会与文学社携手共图大举');
INSERT INTO `history_today` VALUES ('1420', '1923', '5', '24', '共产国际指示中共重视土地革命');
INSERT INTO `history_today` VALUES ('1421', '1934', '5', '24', '查科战争中规模最大的战役发生');
INSERT INTO `history_today` VALUES ('1422', '1521', '5', '25', '马丁·路德被宣布为异端');
INSERT INTO `history_today` VALUES ('1423', '1870', '5', '25', '英帝国爆发爱尔兰自治运动');
INSERT INTO `history_today` VALUES ('1424', '1895', '5', '25', '台湾民主国成立，唐景崧被推为总统。');
INSERT INTO `history_today` VALUES ('1425', '1902', '5', '25', '台湾归顺式场惨案发生，265名抗日义军惨遭杀害');
INSERT INTO `history_today` VALUES ('1426', '1911', '5', '25', '墨西哥反叛分子获胜迪亚斯总统离职');
INSERT INTO `history_today` VALUES ('1427', '1915', '5', '25', '袁世凯接签订丧权辱国的不平等条约——“二十一条”');
INSERT INTO `history_today` VALUES ('1428', '1918', '5', '25', '首批美国军用飞机在法参战');
INSERT INTO `history_today` VALUES ('1429', '1928', '5', '25', '中共决定将工农革命军定名“红军”');
INSERT INTO `history_today` VALUES ('1430', '1941', '5', '25', '毛泽东著文《揭破远东慕尼黑的阴谋》');
INSERT INTO `history_today` VALUES ('1431', '1944', '5', '25', '盟军会师意大利直指罗马');
INSERT INTO `history_today` VALUES ('1432', '1840', '5', '26', '林则徐反对闭关锁国');
INSERT INTO `history_today` VALUES ('1433', '1900', '5', '26', '莫高窟“藏经洞”被发现');
INSERT INTO `history_today` VALUES ('1434', '1926', '5', '26', '里夫战争结束');
INSERT INTO `history_today` VALUES ('1435', '1933', '5', '26', '察哈尔民众抗日同盟军成立');
INSERT INTO `history_today` VALUES ('1436', '1938', '5', '26', '抗日战争研究会召开　毛泽东作《论持久战》演讲');
INSERT INTO `history_today` VALUES ('1437', '1939', '5', '26', '毛泽东为纪念中国人民抗日军事政治大学成立三周年发表文章');
INSERT INTO `history_today` VALUES ('1438', '1946', '5', '26', '普密蓬继承泰国王位');
INSERT INTO `history_today` VALUES ('1439', '1948', '5', '26', '毛泽东等到达西柏坡');
INSERT INTO `history_today` VALUES ('1440', '1948', '5', '26', '董存瑞舍身炸碉堡');
INSERT INTO `history_today` VALUES ('1441', '1950', '5', '26', '全国七大城市工商局长会议结束');
INSERT INTO `history_today` VALUES ('1442', '1129', '5', '27', '（宋高宋建炎三年五月乙酉）高宗致建康，致书金人：“愿用正朔，比于藩臣”');
INSERT INTO `history_today` VALUES ('1443', '1340', '5', '27', '（元顺帝至元六年五月癸丑）元政府明令：禁民间藏军器');
INSERT INTO `history_today` VALUES ('1444', '1644', '5', '27', '（顺治元年四月己卯）清军至山海关，吴三桂开关出迎，大军入关');
INSERT INTO `history_today` VALUES ('1445', '1684', '5', '27', '（康熙二十三年四月己酉）设台湾府、县等官，隶福建行省');
INSERT INTO `history_today` VALUES ('1446', '1703', '5', '27', '苏联列宁格勒城奠基日，城市命名为圣彼得堡');
INSERT INTO `history_today` VALUES ('1447', '1871', '5', '27', '贝尔-拉雪兹公墓战斗');
INSERT INTO `history_today` VALUES ('1448', '1897', '5', '27', '盛宣怀开办中国通商银行上海总行');
INSERT INTO `history_today` VALUES ('1449', '1897', '5', '27', '中国和比利时议定《芦汉铁路借款合同》');
INSERT INTO `history_today` VALUES ('1450', '1900', '5', '27', '中国爆发义和团运动');
INSERT INTO `history_today` VALUES ('1451', '1903', '5', '27', '上海《苏报》发表章炳麟介绍邹容所著《革命军》文章');
INSERT INTO `history_today` VALUES ('1452', '1351', '5', '28', '颖州刘福通以红巾为号发动起义，史称“红巾起义”');
INSERT INTO `history_today` VALUES ('1453', '1503', '5', '28', '英格兰和苏格兰签订永远和平条约');
INSERT INTO `history_today` VALUES ('1454', '1588', '5', '28', '西班牙无敌舰队前往英吉利海峡和英国皇家海军作战');
INSERT INTO `history_today` VALUES ('1455', '1858', '5', '28', '中国清朝黑龙江将军奕山与沙俄东西伯利亚总督穆拉维约夫签订《中俄瑷珲条约》');
INSERT INTO `history_today` VALUES ('1456', '1862', '5', '28', '李秀成率太平军又败“常胜军”，击沉火轮一只。');
INSERT INTO `history_today` VALUES ('1457', '1871', '5', '28', '巴黎公社委员瓦尔兰就义');
INSERT INTO `history_today` VALUES ('1458', '1900', '5', '28', '义和团焚烧长辛店、卢沟桥车站，截断电线，芦保京津铁路中断');
INSERT INTO `history_today` VALUES ('1459', '1902', '5', '28', '爱迪生发明电池');
INSERT INTO `history_today` VALUES ('1460', '1905', '5', '28', '俄军对马岛海域遭到惨重损失');
INSERT INTO `history_today` VALUES ('1461', '1918', '5', '28', '首个民主共和制的伊斯兰国家成立');
INSERT INTO `history_today` VALUES ('1462', '1382', '5', '29', '朱元璋设立锦衣卫');
INSERT INTO `history_today` VALUES ('1463', '1453', '5', '29', '东罗马帝国灭亡');
INSERT INTO `history_today` VALUES ('1464', '1904', '5', '29', '中国红十字会成立');
INSERT INTO `history_today` VALUES ('1465', '1910', '5', '29', '飞机与火车赛跑');
INSERT INTO `history_today` VALUES ('1466', '1934', '5', '29', '美国放弃在古巴的权利');
INSERT INTO `history_today` VALUES ('1467', '1935', '5', '29', '中央红军强渡大渡河');
INSERT INTO `history_today` VALUES ('1468', '1936', '5', '29', '“国防文艺运动”在我国蓬勃兴起');
INSERT INTO `history_today` VALUES ('1469', '1948', '5', '29', '曹禺首次从影');
INSERT INTO `history_today` VALUES ('1470', '1953', '5', '29', '人类首次登上珠峰');
INSERT INTO `history_today` VALUES ('1471', '1958', '5', '29', '全世界都在转呼拉圈');
INSERT INTO `history_today` VALUES ('1472', '1814', '5', '30', '巴枯宁诞辰');
INSERT INTO `history_today` VALUES ('1473', '1902', '5', '30', '台湾林氏家族殉难');
INSERT INTO `history_today` VALUES ('1474', '1912', '5', '30', '吴稚晖、汪精卫等发起留法俭学运动');
INSERT INTO `history_today` VALUES ('1475', '1912', '5', '30', '上千架皇家空军轰炸机空袭科隆');
INSERT INTO `history_today` VALUES ('1476', '1925', '5', '30', '“五卅”运动爆发');
INSERT INTO `history_today` VALUES ('1477', '1933', '5', '30', '中签署《塘沽协定》');
INSERT INTO `history_today` VALUES ('1478', '1939', '5', '30', '陈云提出共产党员的六条标准');
INSERT INTO `history_today` VALUES ('1479', '1943', '5', '30', '臭名昭著的中美特种技术合作所成立');
INSERT INTO `history_today` VALUES ('1480', '1945', '5', '30', '延安公演歌剧《白毛女》');
INSERT INTO `history_today` VALUES ('1481', '1950', '5', '30', '中国人民解放军全军参谋会议在北京结束');
INSERT INTO `history_today` VALUES ('1482', '1707', '5', '31', '匈牙利民族英雄拉科齐·费伦茨当选国家元首');
INSERT INTO `history_today` VALUES ('1483', '1902', '5', '31', '布尔战争结束');
INSERT INTO `history_today` VALUES ('1484', '1903', '5', '31', '邹容著作《革命军》出版');
INSERT INTO `history_today` VALUES ('1485', '1906', '5', '31', '罗瑞卿大将诞辰');
INSERT INTO `history_today` VALUES ('1486', '1913', '5', '31', '“白狼”攻克唐县');
INSERT INTO `history_today` VALUES ('1487', '1916', '5', '31', '日德兰半岛之战');
INSERT INTO `history_today` VALUES ('1488', '1918', '5', '31', '俄国面临内战的严峻形势');
INSERT INTO `history_today` VALUES ('1489', '1918', '5', '31', '美军在亚眠前线获胜');
INSERT INTO `history_today` VALUES ('1490', '1924', '5', '31', '中国和苏联签订《中俄解决悬案大纲协定》');
INSERT INTO `history_today` VALUES ('1491', '1926', '5', '31', '伯德和贝内特乘飞机环绕北极飞行成功');
INSERT INTO `history_today` VALUES ('1492', '1524', '6', '1', '德国农民战争爆发');
INSERT INTO `history_today` VALUES ('1493', '1859', '6', '1', '美国哲学家杜威诞辰');
INSERT INTO `history_today` VALUES ('1494', '1898', '6', '1', '维新派妇女团体创办中国女学会书塾');
INSERT INTO `history_today` VALUES ('1495', '1904', '6', '1', '胶济铁路建成通车');
INSERT INTO `history_today` VALUES ('1496', '1917', '6', '1', '吴虞呼吁男女平权');
INSERT INTO `history_today` VALUES ('1497', '1923', '6', '1', '日兵枪杀长沙市民　酿成“六一惨案”');
INSERT INTO `history_today` VALUES ('1498', '1925', '6', '1', '上海总工会公开成立');
INSERT INTO `history_today` VALUES ('1499', '1927', '6', '1', '日军以保护侨民为由在青岛登陆');
INSERT INTO `history_today` VALUES ('1500', '1929', '6', '1', '孙中山灵柩奉安紫金山');
INSERT INTO `history_today` VALUES ('1501', '1933', '6', '1', '中共苏区政府尝试解决农民土地问题');
INSERT INTO `history_today` VALUES ('1502', '1793', '6', '2', '巴黎人民举行新的起义　法国雅各宾派执政');
INSERT INTO `history_today` VALUES ('1503', '1907', '6', '2', '广东惠州七女湖起义');
INSERT INTO `history_today` VALUES ('1504', '1921', '6', '2', '清华教授赵元任和杨步伟举行新式结婚');
INSERT INTO `history_today` VALUES ('1505', '1927', '6', '2', '国学大师王国维自沉');
INSERT INTO `history_today` VALUES ('1506', '1934', '6', '2', '中央苏区动员群众节粮支前');
INSERT INTO `history_today` VALUES ('1507', '1942', '6', '2', '中共中央总学习委员会成立');
INSERT INTO `history_today` VALUES ('1508', '1942', '6', '2', '中美签署《中美租借协定》');
INSERT INTO `history_today` VALUES ('1509', '1946', '6', '2', '意大利共和国成立');
INSERT INTO `history_today` VALUES ('1510', '1949', '6', '2', '京沪杭战役胜利结束');
INSERT INTO `history_today` VALUES ('1511', '1949', '6', '2', '青岛解放');
INSERT INTO `history_today` VALUES ('1512', '1839', '6', '3', '林则徐在虎门公开销毁鸦片');
INSERT INTO `history_today` VALUES ('1513', '1896', '6', '3', '清政府同俄国政府签订《中俄密约》');
INSERT INTO `history_today` VALUES ('1514', '1919', '6', '3', '中国工人阶级第一次进行大规模政治罢工');
INSERT INTO `history_today` VALUES ('1515', '1920', '6', '3', '中国万吨轮出口美国');
INSERT INTO `history_today` VALUES ('1516', '1921', '6', '3', '共产国际派人来华建议及早建党');
INSERT INTO `history_today` VALUES ('1517', '1921', '6', '3', '李大钊、马叙伦等师生请愿遭打');
INSERT INTO `history_today` VALUES ('1518', '1935', '6', '3', '豪华客轮诺曼底号创造横越大西洋速度纪录');
INSERT INTO `history_today` VALUES ('1519', '1936', '6', '3', '斯诺到达陕北');
INSERT INTO `history_today` VALUES ('1520', '1937', '6', '3', '温莎公爵结婚');
INSERT INTO `history_today` VALUES ('1521', '1940', '6', '3', '中共中央对学生工作作出决定');
INSERT INTO `history_today` VALUES ('1522', '1922', '6', '4', '邓肯式的舞蹈风靡欧美');
INSERT INTO `history_today` VALUES ('1523', '1925', '6', '4', '广州发生滇桂军叛乱');
INSERT INTO `history_today` VALUES ('1524', '1928', '6', '4', '张作霖在皇姑屯被炸身亡');
INSERT INTO `history_today` VALUES ('1525', '1928', '6', '4', '中共中央向朱、毛下达指示');
INSERT INTO `history_today` VALUES ('1526', '1940', '6', '4', '英法军队敦刻尔克大撤退结束。');
INSERT INTO `history_today` VALUES ('1527', '1941', '6', '4', '庆祝“抗大”成立五周年');
INSERT INTO `history_today` VALUES ('1528', '1942', '6', '4', '中途岛之战爆发');
INSERT INTO `history_today` VALUES ('1529', '1943', '6', '4', '中共中央发布《关于领导方法的决定》');
INSERT INTO `history_today` VALUES ('1530', '1944', '6', '4', '盟军攻克罗马');
INSERT INTO `history_today` VALUES ('1531', '1946', '6', '4', '庇隆当选阿根廷总统');
INSERT INTO `history_today` VALUES ('1532', '1723', '6', '5', '英国经济学家亚当·斯密诞辰');
INSERT INTO `history_today` VALUES ('1533', '1926', '6', '5', '叶挺独立团攻克湖南攸县');
INSERT INTO `history_today` VALUES ('1534', '1927', '6', '5', '武汉国民政府解除苏联顾问鲍罗廷和加伦等140余人的职务');
INSERT INTO `history_today` VALUES ('1535', '1929', '6', '5', '宋子文清理广东财政');
INSERT INTO `history_today` VALUES ('1536', '1932', '6', '5', '中共中央对第四次反围剿作出部署。');
INSERT INTO `history_today` VALUES ('1537', '1932', '6', '5', '中共中央对第四次反围剿作出部署');
INSERT INTO `history_today` VALUES ('1538', '1941', '6', '5', '重庆防空隧道发生窒息惨案。');
INSERT INTO `history_today` VALUES ('1539', '1941', '6', '5', '重庆发生防空大隧道惨案');
INSERT INTO `history_today` VALUES ('1540', '1944', '6', '5', '诺曼底登陆');
INSERT INTO `history_today` VALUES ('1541', '1944', '6', '5', '中共中央加强城市工作');
INSERT INTO `history_today` VALUES ('1542', '1914', '6', '6', '《礼拜六》周刊创刊。');
INSERT INTO `history_today` VALUES ('1543', '1918', '6', '6', '中国第一家证券交易所开业');
INSERT INTO `history_today` VALUES ('1544', '1925', '6', '6', '克莱斯勒建立汽车公司。');
INSERT INTO `history_today` VALUES ('1545', '1925', '6', '6', '中国共产党发表告全国民众书');
INSERT INTO `history_today` VALUES ('1546', '1932', '6', '6', '各界呼吁国共停止内战。');
INSERT INTO `history_today` VALUES ('1547', '1933', '6', '6', '苏区作出扩大红军百万决议。');
INSERT INTO `history_today` VALUES ('1548', '1936', '6', '6', '张国焘取消“第二中央”');
INSERT INTO `history_today` VALUES ('1549', '1939', '6', '6', '日军攻占汕头。');
INSERT INTO `history_today` VALUES ('1550', '1944', '6', '6', '盟军在法国诺曼底登陆。');
INSERT INTO `history_today` VALUES ('1551', '1944', '6', '6', '诺曼底登陆纪念图片集(一)');
INSERT INTO `history_today` VALUES ('1552', '1901', '6', '7', '梁启超《立宪法议》发表');
INSERT INTO `history_today` VALUES ('1553', '1901', '6', '7', '四十五个州县城镇被停科考五年');
INSERT INTO `history_today` VALUES ('1554', '1902', '6', '7', '山西设立大学堂');
INSERT INTO `history_today` VALUES ('1555', '1914', '6', '7', '第一艘货船通过巴拿马运河');
INSERT INTO `history_today` VALUES ('1556', '1915', '6', '7', '中俄蒙签订协约');
INSERT INTO `history_today` VALUES ('1557', '1916', '6', '7', '独立各省取消独立');
INSERT INTO `history_today` VALUES ('1558', '1916', '6', '7', '巡洋舰沉没基钦纳勋爵遇难');
INSERT INTO `history_today` VALUES ('1559', '1916', '6', '7', '黎元洪继任大总统');
INSERT INTO `history_today` VALUES ('1560', '1922', '6', '7', '《妇女杂志》在中国首倡计划生育');
INSERT INTO `history_today` VALUES ('1561', '1928', '6', '7', '孙殿英夜盗东陵');
INSERT INTO `history_today` VALUES ('1562', '1529', '6', '8', '中世纪的一次重大宗教战争——卡佩尔战争爆发');
INSERT INTO `history_today` VALUES ('1563', '1810', '6', '8', '德国作曲家舒曼诞辰');
INSERT INTO `history_today` VALUES ('1564', '1881', '6', '8', '清政府撤回留美学生');
INSERT INTO `history_today` VALUES ('1565', '1924', '6', '8', '人类首次向珠穆朗玛峰冲击未果');
INSERT INTO `history_today` VALUES ('1566', '1932', '6', '8', '乡村工学团试验计划开始推广');
INSERT INTO `history_today` VALUES ('1567', '1932', '6', '8', '中共就反帝运动中的统一战线问题发出指示信');
INSERT INTO `history_today` VALUES ('1568', '1934', '6', '8', '藏本英明事件弥布战争风云');
INSERT INTO `history_today` VALUES ('1569', '1937', '6', '8', '国共两党庐山谈判');
INSERT INTO `history_today` VALUES ('1570', '1948', '6', '8', '朱自清宁肯饿死不食美国粮');
INSERT INTO `history_today` VALUES ('1571', '1948', '6', '8', '董存瑞被追记为战斗英雄、模范共产党员');
INSERT INTO `history_today` VALUES ('1572', '1881', '6', '9', '中国第一条自建铁路——唐胥铁路铺轨');
INSERT INTO `history_today` VALUES ('1573', '1885', '6', '9', '《中法新约》签订');
INSERT INTO `history_today` VALUES ('1574', '1925', '6', '9', '凯末尔在土耳其推行改革');
INSERT INTO `history_today` VALUES ('1575', '1931', '6', '9', '杜月笙举办宗祠落成典礼　大摆排场');
INSERT INTO `history_today` VALUES ('1576', '1932', '6', '9', '蒋介石在庐山开会部署“围剿”');
INSERT INTO `history_today` VALUES ('1577', '1932', '6', '9', '国民党通令封禁抗影片');
INSERT INTO `history_today` VALUES ('1578', '1938', '6', '9', '蒋介石下令决花园口抵日军　淹死百姓89万人');
INSERT INTO `history_today` VALUES ('1579', '1941', '6', '9', '中央军委发出《关于冀南工作的指示》');
INSERT INTO `history_today` VALUES ('1580', '1942', '6', '9', '冀中八路军伏击日军参观团');
INSERT INTO `history_today` VALUES ('1581', '1944', '6', '9', '中外记者西北参观团抵达延安');
INSERT INTO `history_today` VALUES ('1582', '1900', '6', '10', '西摩率八国联军向北京进发');
INSERT INTO `history_today` VALUES ('1583', '1907', '6', '10', '卢米埃尔兄弟发明三色照片制作工艺');
INSERT INTO `history_today` VALUES ('1584', '1907', '6', '10', '北京-巴黎汽车大赛开始');
INSERT INTO `history_today` VALUES ('1585', '1919', '6', '10', '陆、曹、章被撤职');
INSERT INTO `history_today` VALUES ('1586', '1920', '6', '10', '川滇黔战争爆发');
INSERT INTO `history_today` VALUES ('1587', '1927', '6', '10', '共产国际发出“五月指示信”　试图挽救中国革命');
INSERT INTO `history_today` VALUES ('1588', '1929', '6', '10', '英国妇女首次进入内阁');
INSERT INTO `history_today` VALUES ('1589', '1931', '6', '10', '指挥家托斯卡尼尼拒演法西斯乐曲');
INSERT INTO `history_today` VALUES ('1590', '1932', '6', '10', '《文学月刊》出版');
INSERT INTO `history_today` VALUES ('1591', '1939', '6', '10', '毛泽东论中共发起的全党干部学习运动');
INSERT INTO `history_today` VALUES ('1592', '1898', '6', '11', '戊戌变法开始');
INSERT INTO `history_today` VALUES ('1593', '1903', '6', '11', '塞尔维亚国王和王后遇刺身亡');
INSERT INTO `history_today` VALUES ('1594', '1907', '6', '11', '刘师复谋刺李准');
INSERT INTO `history_today` VALUES ('1595', '1915', '6', '11', '中俄蒙签订《恰克图协约》');
INSERT INTO `history_today` VALUES ('1596', '1919', '6', '11', '陈独秀被捕');
INSERT INTO `history_today` VALUES ('1597', '1919', '6', '11', '徐世昌提出辞职');
INSERT INTO `history_today` VALUES ('1598', '1924', '6', '11', '日本政党政治开始');
INSERT INTO `history_today` VALUES ('1599', '1930', '6', '11', '中共政治局通过李立三的激进主义决议案');
INSERT INTO `history_today` VALUES ('1600', '1937', '6', '11', '“七君子”被控参与发动西安事变');
INSERT INTO `history_today` VALUES ('1601', '1938', '6', '11', '中共代表参加共产国际主席团会议');
INSERT INTO `history_today` VALUES ('1602', '1127', '6', '12', '南宋建立');
INSERT INTO `history_today` VALUES ('1603', '1901', '6', '12', '古巴成为美国的保护国');
INSERT INTO `history_today` VALUES ('1604', '1904', '6', '12', '《时报》创刊');
INSERT INTO `history_today` VALUES ('1605', '1923', '6', '12', '“三大”正式确立国共合作方针');
INSERT INTO `history_today` VALUES ('1606', '1923', '6', '12', '鲁迅参加爱情问题大讨论');
INSERT INTO `history_today` VALUES ('1607', '1923', '6', '12', '临城火车大劫案人质获释');
INSERT INTO `history_today` VALUES ('1608', '1928', '6', '12', '斯大林接见中共领导人');
INSERT INTO `history_today` VALUES ('1609', '1930', '6', '12', '蔡和森遇害');
INSERT INTO `history_today` VALUES ('1610', '1935', '6', '12', '红一方面军翻越夹金山与红四方面军会师');
INSERT INTO `history_today` VALUES ('1611', '1939', '6', '12', '平江惨案');
INSERT INTO `history_today` VALUES ('1612', '1858', '6', '13', '《中俄天津条约》签订');
INSERT INTO `history_today` VALUES ('1613', '1867', '6', '13', '美国派军舰侵入台湾遭痛击');
INSERT INTO `history_today` VALUES ('1614', '1900', '6', '13', '义和团运动');
INSERT INTO `history_today` VALUES ('1615', '1923', '6', '13', '北洋政府内讧　黎元洪出走天津');
INSERT INTO `history_today` VALUES ('1616', '1926', '6', '13', '毕苏斯基在波兰建立独裁政权');
INSERT INTO `history_today` VALUES ('1617', '1927', '6', '13', '任弼时同陈独秀的一次斗争');
INSERT INTO `history_today` VALUES ('1618', '1940', '6', '13', '国民党查禁毛泽东的《新民主主义论》');
INSERT INTO `history_today` VALUES ('1619', '1940', '6', '13', '电影《蝴蝶梦》上映');
INSERT INTO `history_today` VALUES ('1620', '1956', '6', '13', '英国从苏伊士运河撤走最后一批军队');
INSERT INTO `history_today` VALUES ('1621', '1959', '6', '13', '中央发出《关于调整1959年主要物资分配和基本建设计划的紧急指示》');
INSERT INTO `history_today` VALUES ('1622', '1905', '6', '14', '“波将金号”起义');
INSERT INTO `history_today` VALUES ('1623', '1919', '6', '14', '首次横越大西洋连续飞行成功');
INSERT INTO `history_today` VALUES ('1624', '1920', '6', '14', '德国社会科学家马克斯·韦伯逝世');
INSERT INTO `history_today` VALUES ('1625', '1934', '6', '14', '电影《渔光曲》首映受欢迎');
INSERT INTO `history_today` VALUES ('1626', '1938', '6', '14', '宋庆龄发起保卫中国同盟');
INSERT INTO `history_today` VALUES ('1627', '1938', '6', '14', '“保卫中国同盟”在香港成立');
INSERT INTO `history_today` VALUES ('1628', '1940', '6', '14', '德军举行巴黎入城仪式');
INSERT INTO `history_today` VALUES ('1629', '1943', '6', '14', '英军攻克西西里的三个岛屿');
INSERT INTO `history_today` VALUES ('1630', '1945', '6', '14', '中共七大闭幕 毛泽东思想被确立为党的指导思想');
INSERT INTO `history_today` VALUES ('1631', '1950', '6', '14', '中国人民政治协商会议第一届全国委员会举行第二次会议');
INSERT INTO `history_today` VALUES ('1632', '1215', '6', '15', '英国颁布《自由大宪章》');
INSERT INTO `history_today` VALUES ('1633', '1381', '6', '15', '英国农民领袖瓦特·泰勒遇刺身亡　起义失败');
INSERT INTO `history_today` VALUES ('1634', '1922', '6', '15', '中共首次发表对时局的主张');
INSERT INTO `history_today` VALUES ('1635', '1923', '6', '15', '瞿秋白首次翻译发表的《国际歌》中文歌词');
INSERT INTO `history_today` VALUES ('1636', '1926', '6', '15', '刘海粟为孙传芳禁止人体模特事声辩');
INSERT INTO `history_today` VALUES ('1637', '1928', '6', '15', '南京国民政府宣告完成统一大业');
INSERT INTO `history_today` VALUES ('1638', '1948', '6', '15', '《人民日报》创刊');
INSERT INTO `history_today` VALUES ('1639', '1949', '6', '15', '新政协筹备会第一次全体会议举行');
INSERT INTO `history_today` VALUES ('1640', '1953', '6', '15', '过渡时期总路线提出');
INSERT INTO `history_today` VALUES ('1641', '1962', '6', '15', '“好猫论”出台');
INSERT INTO `history_today` VALUES ('1642', '1842', '6', '16', '江南提督陈化成战死');
INSERT INTO `history_today` VALUES ('1643', '1888', '6', '16', '《国际歌》诞生');
INSERT INTO `history_today` VALUES ('1644', '1903', '6', '16', '亨利·福特成立汽车公司');
INSERT INTO `history_today` VALUES ('1645', '1917', '6', '16', '苏维埃举行第一次会议');
INSERT INTO `history_today` VALUES ('1646', '1919', '6', '16', '全国学联成立');
INSERT INTO `history_today` VALUES ('1647', '1919', '6', '16', '斯洛伐克苏维埃共和国成立');
INSERT INTO `history_today` VALUES ('1648', '1921', '6', '16', '胡适提出“打孔店”');
INSERT INTO `history_today` VALUES ('1649', '1922', '6', '16', '陈炯明炮击孙中山');
INSERT INTO `history_today` VALUES ('1650', '1922', '6', '16', '陈炯明发动羊城兵变');
INSERT INTO `history_today` VALUES ('1651', '1924', '6', '16', '黄埔军校举行开学典礼');
INSERT INTO `history_today` VALUES ('1652', '1900', '6', '17', '八国联军攻占大沽炮台');
INSERT INTO `history_today` VALUES ('1653', '1902', '6', '17', '《大公报》问世');
INSERT INTO `history_today` VALUES ('1654', '1907', '6', '17', '同盟会内部分歧,章炳麟与孙中山对立');
INSERT INTO `history_today` VALUES ('1655', '1907', '6', '17', '杨翠喜妓案加剧清廷内部倾轧');
INSERT INTO `history_today` VALUES ('1656', '1911', '6', '17', '保路同志会成立');
INSERT INTO `history_today` VALUES ('1657', '1915', '6', '17', '土耳其屠杀大批亚美尼亚人');
INSERT INTO `history_today` VALUES ('1658', '1924', '6', '17', '共产国际召开第五次代表大会 李大钊等代表中国共产党出席');
INSERT INTO `history_today` VALUES ('1659', '1944', '6', '17', '中共对美、蒋方针作出指示');
INSERT INTO `history_today` VALUES ('1660', '1948', '6', '17', '豫东战役获胜');
INSERT INTO `history_today` VALUES ('1661', '1951', '6', '17', '廖承志提出侨务工作基本方针');
INSERT INTO `history_today` VALUES ('1662', '1815', '6', '18', '滑铁卢战役');
INSERT INTO `history_today` VALUES ('1663', '1858', '6', '18', '美国诱迫清政府签订《中美天津条约》');
INSERT INTO `history_today` VALUES ('1664', '1918', '6', '18', '中签订吉会铁路垫款合同');
INSERT INTO `history_today` VALUES ('1665', '1928', '6', '18', '第一位成功飞越大西洋的女性');
INSERT INTO `history_today` VALUES ('1666', '1928', '6', '18', '中共六大在莫斯科召开');
INSERT INTO `history_today` VALUES ('1667', '1935', '6', '18', '德英签订海军协定');
INSERT INTO `history_today` VALUES ('1668', '1940', '6', '18', '戴高乐将军与6.18宣言');
INSERT INTO `history_today` VALUES ('1669', '1940', '6', '18', '戴高乐呼吁法国人民抵抗德军');
INSERT INTO `history_today` VALUES ('1670', '1940', '6', '18', '枣宜会战结束');
INSERT INTO `history_today` VALUES ('1671', '1941', '6', '18', '中英划界滇缅路');
INSERT INTO `history_today` VALUES ('1672', '1522', '6', '19', '西英联合进攻法国');
INSERT INTO `history_today` VALUES ('1673', '1908', '6', '19', '清廷将电报收归官办');
INSERT INTO `history_today` VALUES ('1674', '1925', '6', '19', '省港大罢工开始');
INSERT INTO `history_today` VALUES ('1675', '1926', '6', '19', '整理党务案出台，国共联席会议成立');
INSERT INTO `history_today` VALUES ('1676', '1930', '6', '19', '中共提出组织兵士暴动问题');
INSERT INTO `history_today` VALUES ('1677', '1930', '6', '19', '中国工农红军第三军团成立');
INSERT INTO `history_today` VALUES ('1678', '1931', '6', '19', '日本制订征服“满蒙”的方案');
INSERT INTO `history_today` VALUES ('1679', '1931', '6', '19', '赛珍珠作品《大地》正式出版');
INSERT INTO `history_today` VALUES ('1680', '1934', '6', '19', '毛泽东与项英、张国焘联名发表反帝宣言');
INSERT INTO `history_today` VALUES ('1681', '1938', '6', '19', '周恩来向蒋介石交涉十条意见');
INSERT INTO `history_today` VALUES ('1682', '1409', '6', '20', '明十三陵开始营建');
INSERT INTO `history_today` VALUES ('1683', '1549', '6', '20', '英国历史上著名的罗伯特·凯特起义');
INSERT INTO `history_today` VALUES ('1684', '1789', '6', '20', '“网球厅宣誓”：法国资产阶级革命史上的一件大事');
INSERT INTO `history_today` VALUES ('1685', '1898', '6', '20', '英国在美西战争中夺得关岛');
INSERT INTO `history_today` VALUES ('1686', '1900', '6', '20', '清军击毙德国公使克林德');
INSERT INTO `history_today` VALUES ('1687', '1923', '6', '20', '爱情问题大讨论宣告结束');
INSERT INTO `history_today` VALUES ('1688', '1927', '6', '20', '英美海军会议开幕');
INSERT INTO `history_today` VALUES ('1689', '1928', '6', '20', '新疆归顺南京政府');
INSERT INTO `history_today` VALUES ('1690', '1936', '6', '20', '中共中央发出致国民党二中全会书');
INSERT INTO `history_today` VALUES ('1691', '1940', '6', '20', '法国关闭滇越铁路');
INSERT INTO `history_today` VALUES ('1692', '1813', '6', '21', '维多利亚战役');
INSERT INTO `history_today` VALUES ('1693', '1870', '6', '21', '天津教案发生');
INSERT INTO `history_today` VALUES ('1694', '1900', '6', '21', '清廷向列强宣战');
INSERT INTO `history_today` VALUES ('1695', '1933', '6', '21', '察哈尔民众抗日同盟军开赴前线抗日');
INSERT INTO `history_today` VALUES ('1696', '1945', '6', '21', '冲绳战役结束');
INSERT INTO `history_today` VALUES ('1697', '1953', '6', '21', '苏联出动大批坦克镇压东柏林骚乱');
INSERT INTO `history_today` VALUES ('1698', '1956', '6', '21', '我国政府宽大释放第一批日本战犯');
INSERT INTO `history_today` VALUES ('1699', '1960', '6', '21', '苏共致书攻击中共');
INSERT INTO `history_today` VALUES ('1700', '1971', '6', '21', '日本数千学生示威要求归还冲绳');
INSERT INTO `history_today` VALUES ('1701', '1982', '6', '21', '行刺里根的刺客被判无罪释放');
INSERT INTO `history_today` VALUES ('1702', '1848', '6', '22', '法国六月起义爆发');
INSERT INTO `history_today` VALUES ('1703', '1895', '6', '22', '台湾军民为反抗日本侵略进行新竹保卫战');
INSERT INTO `history_today` VALUES ('1704', '1900', '6', '22', '敦煌莫高窟发现藏经洞');
INSERT INTO `history_today` VALUES ('1705', '1902', '6', '22', '中英签订《上海会审公廨合同》');
INSERT INTO `history_today` VALUES ('1706', '1910', '6', '22', '万国博览会上　中国展品受好评');
INSERT INTO `history_today` VALUES ('1707', '1920', '6', '22', '吴佩孚要求解散安福系');
INSERT INTO `history_today` VALUES ('1708', '1923', '6', '22', '德国马克急剧下跌');
INSERT INTO `history_today` VALUES ('1709', '1927', '6', '22', '冯玉祥部清除共产党员');
INSERT INTO `history_today` VALUES ('1710', '1929', '6', '22', '中共红四军“七大”在龙岩城的一所中学内召开');
INSERT INTO `history_today` VALUES ('1711', '1930', '6', '22', '前中共总书记向忠发叛变被杀');
INSERT INTO `history_today` VALUES ('1712', '1894', '6', '23', '国际奥林匹克运动委员会成立');
INSERT INTO `history_today` VALUES ('1713', '1908', '6', '23', '美国将部分庚子赔款退还中国');
INSERT INTO `history_today` VALUES ('1714', '1911', '6', '23', '英国国王乔治五世加冕');
INSERT INTO `history_today` VALUES ('1715', '1925', '6', '23', '沙基惨案发生');
INSERT INTO `history_today` VALUES ('1716', '1939', '6', '23', '八路军发出第二期整军训令');
INSERT INTO `history_today` VALUES ('1717', '1944', '6', '23', '日军对衡阳实施毁灭性攻击');
INSERT INTO `history_today` VALUES ('1718', '1946', '6', '23', '蒋介石大举围攻中原解放区');
INSERT INTO `history_today` VALUES ('1719', '1946', '6', '23', '南京发生“下关惨案”');
INSERT INTO `history_today` VALUES ('1720', '1946', '6', '23', '我国反内战运动走向高潮');
INSERT INTO `history_today` VALUES ('1721', '1946', '6', '23', '南京发生“下关惨案”，周恩来赴院慰问伤者');
INSERT INTO `history_today` VALUES ('1722', '1812', '6', '24', '拿破仑进攻俄国　惨遭败绩');
INSERT INTO `history_today` VALUES ('1723', '1901', '6', '24', '毕加索作品首次在巴黎展出');
INSERT INTO `history_today` VALUES ('1724', '1904', '6', '24', '纽约一轮船失火693人丧命');
INSERT INTO `history_today` VALUES ('1725', '1911', '6', '24', '电影首次进入我国民间放映');
INSERT INTO `history_today` VALUES ('1726', '1932', '6', '24', '泰国立宪');
INSERT INTO `history_today` VALUES ('1727', '1946', '6', '24', '传达中央关于指派一只精干部队保证主力安全突围的指示');
INSERT INTO `history_today` VALUES ('1728', '1960', '6', '24', '中苏两党代表团交锋布加勒斯特会议');
INSERT INTO `history_today` VALUES ('1729', '1960', '6', '24', '中苏两党关系公开破裂');
INSERT INTO `history_today` VALUES ('1730', '1960', '6', '24', '卢蒙巴成为刚果总理');
INSERT INTO `history_today` VALUES ('1731', '1975', '6', '24', '中央军委召开扩大会议');
INSERT INTO `history_today` VALUES ('1732', '1929', '6', '25', '蒋桂战争结束');
INSERT INTO `history_today` VALUES ('1733', '1938', '6', '25', '美国将每小时最低工资定为40美分');
INSERT INTO `history_today` VALUES ('1734', '1939', '6', '25', '苏联向中国提供巨额贷款');
INSERT INTO `history_today` VALUES ('1735', '1939', '6', '25', '影片《孤岛天堂》上映受欢迎');
INSERT INTO `history_today` VALUES ('1736', '1942', '6', '25', '隆美尔攻入埃及');
INSERT INTO `history_today` VALUES ('1737', '1942', '6', '25', '艾森豪威尔就任美驻欧洲战区司令');
INSERT INTO `history_today` VALUES ('1738', '1948', '6', '25', '苏联对柏林实行封锁');
INSERT INTO `history_today` VALUES ('1739', '1950', '6', '25', '全面爆发朝鲜战争');
INSERT INTO `history_today` VALUES ('1740', '1951', '6', '25', '世界首次播出彩色电视节目');
INSERT INTO `history_today` VALUES ('1741', '1954', '6', '25', '周恩来提出和平共处五项原则');
INSERT INTO `history_today` VALUES ('1742', '1900', '6', '26', '南方各省督抚与英美达成东南互保协议');
INSERT INTO `history_today` VALUES ('1743', '1918', '6', '26', '德军使用贝尔塔巨炮轰击巴黎');
INSERT INTO `history_today` VALUES ('1744', '1923', '6', '26', '紫禁城发生大火');
INSERT INTO `history_today` VALUES ('1745', '1929', '6', '26', '中国共产党举行六届二中全会');
INSERT INTO `history_today` VALUES ('1746', '1930', '6', '26', '埃及六月起义爆发');
INSERT INTO `history_today` VALUES ('1747', '1931', '6', '26', '东北发生中村事件');
INSERT INTO `history_today` VALUES ('1748', '1935', '6', '26', '两河口召开政治局扩大会议');
INSERT INTO `history_today` VALUES ('1749', '1945', '6', '26', '联合国托管理事会成立');
INSERT INTO `history_today` VALUES ('1750', '1946', '6', '26', '国民党军进攻中原解放区');
INSERT INTO `history_today` VALUES ('1751', '1946', '6', '26', '《美国军事援华法案》通过');
INSERT INTO `history_today` VALUES ('1752', '1858', '6', '27', '《中法天津条约》签署');
INSERT INTO `history_today` VALUES ('1753', '1905', '6', '27', '俄黑海舰队“波将金”号起义');
INSERT INTO `history_today` VALUES ('1754', '1917', '6', '27', '潘兴率美军在法国登陆');
INSERT INTO `history_today` VALUES ('1755', '1927', '6', '27', '日本制定对华侵略总政策');
INSERT INTO `history_today` VALUES ('1756', '1935', '6', '27', '中日签订《秦土协定》');
INSERT INTO `history_today` VALUES ('1757', '1938', '6', '27', '国民政府提出“保卫大武汉”');
INSERT INTO `history_today` VALUES ('1758', '1940', '6', '27', '苏联占领波罗的海沿岸三国');
INSERT INTO `history_today` VALUES ('1759', '1942', '6', '27', '德军渡过顿河向高加索油田进攻');
INSERT INTO `history_today` VALUES ('1760', '1950', '6', '27', '美国第七舰队进驻台湾海峡');
INSERT INTO `history_today` VALUES ('1761', '1954', '6', '27', '苏联第一个原子电力站发电');
INSERT INTO `history_today` VALUES ('1762', '1840', '6', '28', '鸦片战争爆发');
INSERT INTO `history_today` VALUES ('1763', '1841', '6', '28', '林则徐被贬新疆伊犁');
INSERT INTO `history_today` VALUES ('1764', '1902', '6', '28', '美国决定开凿巴拿马运河');
INSERT INTO `history_today` VALUES ('1765', '1914', '6', '28', '“一战”导火线：斐迪南大公萨拉热窝遇剌');
INSERT INTO `history_today` VALUES ('1766', '1919', '6', '28', '中国拒绝在凡尔赛和约上签字');
INSERT INTO `history_today` VALUES ('1767', '1926', '6', '28', '张作霖吴佩孚联合组建北京政府');
INSERT INTO `history_today` VALUES ('1768', '1934', '6', '28', '“满洲帝国”实行日满经济一体化');
INSERT INTO `history_today` VALUES ('1769', '1942', '6', '28', '成吉思汗陵大祭');
INSERT INTO `history_today` VALUES ('1770', '1946', '6', '28', '意大利废除君主制');
INSERT INTO `history_today` VALUES ('1771', '1950', '6', '28', '毛泽东号召全国人民团结起来打败美帝国主义');
INSERT INTO `history_today` VALUES ('1772', '1900', '6', '29', '诺贝尔基金会成立');
INSERT INTO `history_today` VALUES ('1773', '1900', '6', '29', '意大利国王遇刺');
INSERT INTO `history_today` VALUES ('1774', '1903', '6', '29', '《苏报》案发生');
INSERT INTO `history_today` VALUES ('1775', '1906', '6', '29', '章炳麟出狱');
INSERT INTO `history_today` VALUES ('1776', '1913', '6', '29', '第二次巴尔干战争爆发');
INSERT INTO `history_today` VALUES ('1777', '1916', '6', '29', '段祺瑞被迫恢复旧约法');
INSERT INTO `history_today` VALUES ('1778', '1920', '6', '29', '中国加入国际联盟');
INSERT INTO `history_today` VALUES ('1779', '1925', '6', '29', '省港工人大罢工');
INSERT INTO `history_today` VALUES ('1780', '1946', '6', '29', '苏加诺号召为独立而战');
INSERT INTO `history_today` VALUES ('1781', '1957', '6', '29', '马林科夫莫洛托夫等人被开除出苏共中央');
INSERT INTO `history_today` VALUES ('1782', '1860', '6', '30', '牛津大辩论');
INSERT INTO `history_today` VALUES ('1783', '1906', '6', '30', '美国颁布确保食品和药品纯洁性法案');
INSERT INTO `history_today` VALUES ('1784', '1908', '6', '30', '通古斯事件之谜');
INSERT INTO `history_today` VALUES ('1785', '1914', '6', '30', '袁世凯下令　各省“都督”变“将军”');
INSERT INTO `history_today` VALUES ('1786', '1930', '6', '30', '法国军队提前撤出莱茵兰');
INSERT INTO `history_today` VALUES ('1787', '1932', '6', '30', '国民党查禁抗日影片');
INSERT INTO `history_today` VALUES ('1788', '1932', '6', '30', '中共定八月一日为建军节');
INSERT INTO `history_today` VALUES ('1789', '1934', '6', '30', '希特勒清洗冲锋队');
INSERT INTO `history_today` VALUES ('1790', '1936', '6', '30', '红二、六军团与红四方面军胜利会师');
INSERT INTO `history_today` VALUES ('1791', '1941', '6', '30', '纳粹全面入侵俄国');
INSERT INTO `history_today` VALUES ('1792', '1915', '7', '1', '中国思想家顾准。');
INSERT INTO `history_today` VALUES ('1793', '1917', '7', '1', '张勋复辟。');
INSERT INTO `history_today` VALUES ('1794', '1919', '7', '1', '少年中国学会成立');
INSERT INTO `history_today` VALUES ('1795', '1927', '7', '1', '印度政治家钱德拉·谢卡尔出生。');
INSERT INTO `history_today` VALUES ('1796', '1931', '7', '1', '蒋介石发动第三次军事“围剿”。');
INSERT INTO `history_today` VALUES ('1797', '1941', '7', '1', '中共中央作出《关于增强党性的决定》');
INSERT INTO `history_today` VALUES ('1798', '1944', '7', '1', '中共中央发出整训军队的指示');
INSERT INTO `history_today` VALUES ('1799', '1947', '7', '1', '东北民主联军转入反攻。');
INSERT INTO `history_today` VALUES ('1800', '1949', '7', '1', '毛泽东在《人民日报》发表《论人民民主专政》');
INSERT INTO `history_today` VALUES ('1801', '1952', '7', '1', '成渝铁路建成通车');
INSERT INTO `history_today` VALUES ('1802', '1840', '7', '2', '英舰进犯厦门邓廷桢奋力退敌');
INSERT INTO `history_today` VALUES ('1803', '1922', '7', '2', '孙中山讨伐陈炯明海军司令突然倒戈');
INSERT INTO `history_today` VALUES ('1804', '1931', '7', '2', '波斯特和加蒂结束了环球飞行');
INSERT INTO `history_today` VALUES ('1805', '1931', '7', '2', '日本人制造万宝山事件');
INSERT INTO `history_today` VALUES ('1806', '1935', '7', '2', '日本制定掠夺华北资源大纲');
INSERT INTO `history_today` VALUES ('1807', '1936', '7', '2', '红二、红四方面军开始北上');
INSERT INTO `history_today` VALUES ('1808', '1941', '7', '2', '刘少奇作《论党内斗争》演讲');
INSERT INTO `history_today` VALUES ('1809', '1942', '7', '2', '中共要求正确对待原第四方面军干部');
INSERT INTO `history_today` VALUES ('1810', '1945', '7', '2', '中苏谈判商讨苏军出兵条件');
INSERT INTO `history_today` VALUES ('1811', '1947', '7', '2', '波兰把奥斯威辛集中营改为纪念馆');
INSERT INTO `history_today` VALUES ('1812', '1844', '7', '3', '《中美望厦条约》签订');
INSERT INTO `history_today` VALUES ('1813', '1898', '7', '3', '北京大学的前身京师大学堂成立');
INSERT INTO `history_today` VALUES ('1814', '1902', '7', '3', '暴乱席卷俄国南部');
INSERT INTO `history_today` VALUES ('1815', '1904', '7', '3', '科学补习所成立');
INSERT INTO `history_today` VALUES ('1816', '1905', '7', '3', '法国将教会和政府分离');
INSERT INTO `history_today` VALUES ('1817', '1914', '7', '3', '英国麦克马洪西藏地方政府擅自签订《西姆拉条约》');
INSERT INTO `history_today` VALUES ('1818', '1923', '7', '3', '英国提议国际共管中国');
INSERT INTO `history_today` VALUES ('1819', '1924', '7', '3', '广州农民运动讲习所正式开学');
INSERT INTO `history_today` VALUES ('1820', '1928', '7', '3', '电视机在美国开始普及');
INSERT INTO `history_today` VALUES ('1821', '1929', '7', '3', '阎锡山囚禁冯玉祥');
INSERT INTO `history_today` VALUES ('1822', '1776', '7', '4', '美国独立日');
INSERT INTO `history_today` VALUES ('1823', '1904', '7', '4', '中国历史上最后一次科举考试。');
INSERT INTO `history_today` VALUES ('1824', '1910', '7', '4', '日俄签约侵夺“满洲”');
INSERT INTO `history_today` VALUES ('1825', '1920', '7', '4', '“公理战胜”碑落成');
INSERT INTO `history_today` VALUES ('1826', '1942', '7', '4', '毛泽东指出整风的首要对象是高级干部');
INSERT INTO `history_today` VALUES ('1827', '1944', '7', '4', '中共代表对国共和谈不抱希望');
INSERT INTO `history_today` VALUES ('1828', '1945', '7', '4', '毛泽东与黄炎培谈“历史周期率”');
INSERT INTO `history_today` VALUES ('1829', '1947', '7', '4', '蒋介石颁布《戡乱共匪叛乱总动员令》，实行“戡乱”救国。');
INSERT INTO `history_today` VALUES ('1830', '1949', '7', '4', '国民党以银元券代替金元券');
INSERT INTO `history_today` VALUES ('1831', '1972', '7', '4', '朝鲜南北双方发表和平统一联合声明。');
INSERT INTO `history_today` VALUES ('1832', '1811', '7', '5', '委内瑞拉独立');
INSERT INTO `history_today` VALUES ('1833', '1830', '7', '5', '法国占领阿尔及利亚。');
INSERT INTO `history_today` VALUES ('1834', '1848', '7', '5', '北平“七·五”惨案');
INSERT INTO `history_today` VALUES ('1835', '1854', '7', '5', '中国《上海英法美租地章程》公布。');
INSERT INTO `history_today` VALUES ('1836', '1898', '7', '5', '光绪帝下谕奖励新学人材');
INSERT INTO `history_today` VALUES ('1837', '1918', '7', '5', '中华民国军政府组成');
INSERT INTO `history_today` VALUES ('1838', '1928', '7', '5', '孙殿英盗掘东陵');
INSERT INTO `history_today` VALUES ('1839', '1930', '7', '5', '周恩来在联共会议上作报告');
INSERT INTO `history_today` VALUES ('1840', '1943', '7', '5', '库尔斯克战役爆发');
INSERT INTO `history_today` VALUES ('1841', '1943', '7', '5', '王稼祥首次提出“毛泽东思想”');
INSERT INTO `history_today` VALUES ('1842', '1895', '7', '6', '《中俄四厘借款合同》订立。');
INSERT INTO `history_today` VALUES ('1843', '1900', '7', '6', '沙皇尼古拉二世下令大举入侵中国东北。');
INSERT INTO `history_today` VALUES ('1844', '1907', '7', '6', '徐锡麟刺杀安徽巡抚恩铭');
INSERT INTO `history_today` VALUES ('1845', '1908', '7', '6', '香港国际机场正式启用');
INSERT INTO `history_today` VALUES ('1846', '1916', '7', '6', '军阀割据的时代开始');
INSERT INTO `history_today` VALUES ('1847', '1925', '7', '6', '在广州成立了省港罢工委员会');
INSERT INTO `history_today` VALUES ('1848', '1935', '7', '6', '中日签订《何梅协定》');
INSERT INTO `history_today` VALUES ('1849', '1938', '7', '6', '国民参政会一届一次会议召开');
INSERT INTO `history_today` VALUES ('1850', '1949', '7', '6', '上海百万军民庆祝解放');
INSERT INTO `history_today` VALUES ('1851', '1949', '7', '6', '周恩来在中华全国文学艺术工作者代表大会上做政治报告');
INSERT INTO `history_today` VALUES ('1852', '0', '7', '7', '汉武帝刘彻出生');
INSERT INTO `history_today` VALUES ('1853', '1746', '7', '7', '意大利天文学家朱塞普·皮亚齐出生');
INSERT INTO `history_today` VALUES ('1854', '1887', '7', '7', '俄国画家夏加尔诞辰');
INSERT INTO `history_today` VALUES ('1855', '1893', '7', '7', '苏联诗人马雅可夫斯基诞辰');
INSERT INTO `history_today` VALUES ('1856', '1901', '7', '7', '日本特摄之父圆谷英二出生，其作品有著名的《哥斯拉》和《奥特曼》');
INSERT INTO `history_today` VALUES ('1857', '1907', '7', '7', '被誉为“美国现代科幻小说之父”罗伯特·安森·海因莱因出生');
INSERT INTO `history_today` VALUES ('1858', '1937', '7', '7', '中华人民共和国香港特别行政区首任行政长官董建华出生');
INSERT INTO `history_today` VALUES ('1859', '1955', '7', '7', '中国大陆导演赵宝刚出生');
INSERT INTO `history_today` VALUES ('1860', '1960', '7', '7', '中国大陆演员和导演英达出生');
INSERT INTO `history_today` VALUES ('1861', '1964', '7', '7', '日本漫画家藤岛康介出生。代表作有《逮捕令》、《我的女神》');
INSERT INTO `history_today` VALUES ('1862', '1621', '7', '8', '法国作家拉封丹诞辰');
INSERT INTO `history_today` VALUES ('1863', '1839', '7', '8', '标准石油公司创始人洛克菲勒出生');
INSERT INTO `history_today` VALUES ('1864', '1867', '7', '8', '珂勒惠支诞生，德国版画家、雕刻家');
INSERT INTO `history_today` VALUES ('1865', '1891', '7', '8', '中国现代中国画家胡佩衡出生');
INSERT INTO `history_today` VALUES ('1866', '1904', '7', '8', '法国数学家埃利·约瑟夫·嘉当出生。');
INSERT INTO `history_today` VALUES ('1867', '1937', '7', '8', '日本漫画家永岛慎二出生');
INSERT INTO `history_today` VALUES ('1868', '1957', '7', '8', '台湾政治人物王家贞出生');
INSERT INTO `history_today` VALUES ('1869', '1967', '7', '8', '日本动画声优大西健晴出生。');
INSERT INTO `history_today` VALUES ('1870', '1967', '7', '8', '香港歌手及演员陈小春出生。');
INSERT INTO `history_today` VALUES ('1871', '1969', '7', '8', '香港演员及主持人陈芷菁出生');
INSERT INTO `history_today` VALUES ('1872', '1249', '7', '9', '日本天皇龟山天皇出生');
INSERT INTO `history_today` VALUES ('1873', '1701', '7', '9', '法国路易十五，路易十六时代的政治人物让-弗雷德里克·菲利波出生。');
INSERT INTO `history_today` VALUES ('1874', '1781', '7', '9', '乔治·史蒂芬逊诞生，火车的发明人。');
INSERT INTO `history_today` VALUES ('1875', '1791', '7', '9', '德国图书馆学家弗里德里希·阿道夫·艾伯特诞生。');
INSERT INTO `history_today` VALUES ('1876', '1843', '7', '9', '戈尔季诞生，神经组织学家和病理学家。');
INSERT INTO `history_today` VALUES ('1877', '1847', '7', '9', '中国武术家黄飞鸿出生');
INSERT INTO `history_today` VALUES ('1878', '1858', '7', '9', '美国人类学家法兰兹·鲍亚士诞生。');
INSERT INTO `history_today` VALUES ('1879', '1888', '7', '9', '现代出版家、商务印书馆总经理王云五出生。');
INSERT INTO `history_today` VALUES ('1880', '1894', '7', '9', '苏联物理学家彼得·卡皮查出生');
INSERT INTO `history_today` VALUES ('1881', '1911', '7', '9', '美国著名的物理学家约翰·阿奇博尔德·惠勒出生。');
INSERT INTO `history_today` VALUES ('1882', '1509', '7', '10', '著名的宗教改革活动家加尔文诞辰');
INSERT INTO `history_today` VALUES ('1883', '1830', '7', '10', '法国印象派画家卡米耶·毕沙罗诞生。');
INSERT INTO `history_today` VALUES ('1884', '1865', '7', '10', '尼古拉·特斯拉诞生，世界知名的发明家、物理学家、机械工程师和电机工程师，美籍西伯利亚人');
INSERT INTO `history_today` VALUES ('1885', '1871', '7', '10', '法国画家普鲁斯特诞辰');
INSERT INTO `history_today` VALUES ('1886', '1915', '7', '10', '贝洛出生，美国作家，1976年获诺贝尔文学奖。');
INSERT INTO `history_today` VALUES ('1887', '1943', '7', '10', '首位获大满贯网球冠军的黑人阿瑟·阿什出生');
INSERT INTO `history_today` VALUES ('1888', '1961', '7', '10', '香港歌手张学友出生');
INSERT INTO `history_today` VALUES ('1889', '1966', '7', '10', '中国一级藏族女作家梅卓出生');
INSERT INTO `history_today` VALUES ('1890', '1976', '7', '10', '里昂的琼斯·埃迪米尔森出生。');
INSERT INTO `history_today` VALUES ('1891', '1976', '7', '10', '摩纳哥的卢多维奇·久利出生。');
INSERT INTO `history_today` VALUES ('1892', '1274', '7', '11', '罗伯特·布鲁斯，苏格兰国王，民族英雄。');
INSERT INTO `history_today` VALUES ('1893', '1628', '7', '11', '日本大名德川光国出生');
INSERT INTO `history_today` VALUES ('1894', '1657', '7', '11', '腓特烈一世，普鲁士国王。');
INSERT INTO `history_today` VALUES ('1895', '1767', '7', '11', '美国第6任总统约翰·昆西·亚当斯出生');
INSERT INTO `history_today` VALUES ('1896', '1890', '7', '11', '著名建筑设计师沈理源出生');
INSERT INTO `history_today` VALUES ('1897', '1899', '7', '11', '美国论文家、童书作家E·B·怀特出生');
INSERT INTO `history_today` VALUES ('1898', '1916', '7', '11', '普罗霍罗夫，俄罗斯“激光之父”。');
INSERT INTO `history_today` VALUES ('1899', '1916', '7', '11', '爱德华·高夫·惠特拉姆，第21任澳大利亚总理，“中澳建交之父”。');
INSERT INTO `history_today` VALUES ('1900', '1920', '7', '11', '美国电影和舞台演员尤伯·连纳出生');
INSERT INTO `history_today` VALUES ('1901', '1920', '7', '11', '我国著名化学家、教育家唐有祺出生。');
INSERT INTO `history_today` VALUES ('1902', '1817', '7', '12', '美国作家亨利·戴维·梭罗诞生。');
INSERT INTO `history_today` VALUES ('1903', '1901', '7', '12', '地方实力派三请变法。');
INSERT INTO `history_today` VALUES ('1904', '1906', '7', '12', '德雷福斯冤案昭雪');
INSERT INTO `history_today` VALUES ('1905', '1913', '7', '12', '孙中山兴兵讨伐袁世凯，发动“二次革命”');
INSERT INTO `history_today` VALUES ('1906', '1926', '7', '12', '中共举行中央执行委员会第三次扩大会议');
INSERT INTO `history_today` VALUES ('1907', '1927', '7', '12', '中共中央改组　陈独秀停职');
INSERT INTO `history_today` VALUES ('1908', '1948', '7', '12', '画家乔治-布拉克获威尼斯奖');
INSERT INTO `history_today` VALUES ('1909', '1970', '7', '12', '美国电影《巴顿将军》上映');
INSERT INTO `history_today` VALUES ('1910', '1975', '7', '12', '英国掀起裸体飞跑热潮');
INSERT INTO `history_today` VALUES ('1911', '1982', '7', '12', '不速之客夜闯英国女王寝室');
INSERT INTO `history_today` VALUES ('1912', '1881', '7', '13', '济南教案发生。');
INSERT INTO `history_today` VALUES ('1913', '1904', '7', '13', '西伯利亚铁路竣工。');
INSERT INTO `history_today` VALUES ('1914', '1919', '7', '13', '英国飞艇往返飞越大西洋成功。');
INSERT INTO `history_today` VALUES ('1915', '1924', '7', '13', '反帝运动大联盟成立。');
INSERT INTO `history_today` VALUES ('1916', '1927', '7', '13', '中共决定从国民政府中撤出');
INSERT INTO `history_today` VALUES ('1917', '1936', '7', '13', '陈济棠下野，两广事变结束。');
INSERT INTO `history_today` VALUES ('1918', '1944', '7', '13', '中共对大资产阶级及英美资产阶级的政策。');
INSERT INTO `history_today` VALUES ('1919', '1946', '7', '13', '毛泽东、朱德致电李、闻家属');
INSERT INTO `history_today` VALUES ('1920', '1947', '7', '13', '美国发现一批恐龙化石。');
INSERT INTO `history_today` VALUES ('1921', '1950', '7', '13', '东北边防军组成。');
INSERT INTO `history_today` VALUES ('1922', '1789', '7', '14', '巴黎人民攻克巴士底狱。');
INSERT INTO `history_today` VALUES ('1923', '1889', '7', '14', '第二国际成立');
INSERT INTO `history_today` VALUES ('1924', '1916', '7', '14', '北京政府惩办帝制祸首');
INSERT INTO `history_today` VALUES ('1925', '1916', '7', '14', '军务院撤销　护国战争结束');
INSERT INTO `history_today` VALUES ('1926', '1917', '7', '14', '中国第一俱乐部“大世界”开业');
INSERT INTO `history_today` VALUES ('1927', '1918', '7', '14', '毛泽东创办《湘江评论》');
INSERT INTO `history_today` VALUES ('1928', '1931', '7', '14', '经济危机使德国多家银行倒闭');
INSERT INTO `history_today` VALUES ('1929', '1938', '7', '14', '美国百万富翁飞行员创环球飞行新记录');
INSERT INTO `history_today` VALUES ('1930', '1964', '7', '14', '我国文艺界“大批判”浪潮迅速扩展');
INSERT INTO `history_today` VALUES ('1931', '1964', '7', '14', '苏共中央发表公开信　攻击中国共产党');
INSERT INTO `history_today` VALUES ('1932', '1909', '7', '15', '中葡开始澳门勘界谈判');
INSERT INTO `history_today` VALUES ('1933', '1924', '7', '15', '沙面工人大罢工');
INSERT INTO `history_today` VALUES ('1934', '1927', '7', '15', '奥地利全国范围内发生暴乱。');
INSERT INTO `history_today` VALUES ('1935', '1927', '7', '15', '汪精卫集团开始“分共”，大革命彻底失败');
INSERT INTO `history_today` VALUES ('1936', '1934', '7', '15', '中国工农红军北上先遣队组成');
INSERT INTO `history_today` VALUES ('1937', '1937', '7', '15', '中共中央向国民党送交《中国共产党为公布国共合作宣言》');
INSERT INTO `history_today` VALUES ('1938', '1949', '7', '15', '《工人日报》创刊。');
INSERT INTO `history_today` VALUES ('1939', '1957', '7', '15', '马寅初发表《新人口论》。');
INSERT INTO `history_today` VALUES ('1940', '1960', '7', '15', '肯尼迪提出新边疆政策');
INSERT INTO `history_today` VALUES ('1941', '1960', '7', '15', '加丹加省从刚果分裂，内战爆发');
INSERT INTO `history_today` VALUES ('1942', '1900', '7', '16', '俄军惨屠海兰泡华民五千余人');
INSERT INTO `history_today` VALUES ('1943', '1912', '7', '16', '同盟会改组');
INSERT INTO `history_today` VALUES ('1944', '1922', '7', '16', '党的二大——制定民主革命纲领');
INSERT INTO `history_today` VALUES ('1945', '1923', '7', '16', '溥仪裁撤宫内太监');
INSERT INTO `history_today` VALUES ('1946', '1936', '7', '16', '中共要求团结哥老会');
INSERT INTO `history_today` VALUES ('1947', '1945', '7', '16', '世界第一颗原子弹爆炸');
INSERT INTO `history_today` VALUES ('1948', '1946', '7', '16', '马尔梅迪大屠杀的罪犯党卫军成员被判决');
INSERT INTO `history_today` VALUES ('1949', '1946', '7', '16', '美国无偿转让给蒋二百七十一艘军舰');
INSERT INTO `history_today` VALUES ('1950', '1951', '7', '16', '比利时第五任国王博杜安一世即位');
INSERT INTO `history_today` VALUES ('1951', '1960', '7', '16', '苏联撤走全部专家');
INSERT INTO `history_today` VALUES ('1952', '1402', '7', '17', '朱棣继帝位');
INSERT INTO `history_today` VALUES ('1953', '1900', '7', '17', '俄军尽屠江东六十四屯居民');
INSERT INTO `history_today` VALUES ('1954', '1909', '7', '17', '霍元甲创办精武体操会');
INSERT INTO `history_today` VALUES ('1955', '1917', '7', '17', '俄国七月流血事件发生');
INSERT INTO `history_today` VALUES ('1956', '1920', '7', '17', '天津被捕学生周恩来等无罪获释');
INSERT INTO `history_today` VALUES ('1957', '1928', '7', '17', '共产国际六大召开');
INSERT INTO `history_today` VALUES ('1958', '1942', '7', '17', '斯大林格勒大会战');
INSERT INTO `history_today` VALUES ('1959', '1945', '7', '17', '波茨坦会议开幕波茨坦会议');
INSERT INTO `history_today` VALUES ('1960', '1946', '7', '17', '周恩来在南京对目前时局发表重要谈话');
INSERT INTO `history_today` VALUES ('1961', '1947', '7', '17', '中共中央召开全国土地会议');
INSERT INTO `history_today` VALUES ('1962', '1899', '7', '18', '居里夫妇发现“钋”。');
INSERT INTO `history_today` VALUES ('1963', '1925', '7', '18', '希特勒《我的奋斗》出版发行。');
INSERT INTO `history_today` VALUES ('1964', '1927', '7', '18', '宋庆龄发表文章　斥责汪精卫、蒋介石叛变革命');
INSERT INTO `history_today` VALUES ('1965', '1933', '7', '18', '蒋介石开办庐山军官训练团。');
INSERT INTO `history_today` VALUES ('1966', '1936', '7', '18', '西班牙内战爆发。');
INSERT INTO `history_today` VALUES ('1967', '1942', '7', '18', '史迪威提出“反攻缅甸计划”。');
INSERT INTO `history_today` VALUES ('1968', '1947', '7', '18', '英国拦截逃离德国的犹太人的轮船。');
INSERT INTO `history_today` VALUES ('1969', '1955', '7', '18', '第一座迪斯尼乐园正式向公众开放。');
INSERT INTO `history_today` VALUES ('1970', '1955', '7', '18', '国务院决定撤销热河省和西康省');
INSERT INTO `history_today` VALUES ('1971', '1956', '7', '18', '中国政府宽释第二批日本战犯。');
INSERT INTO `history_today` VALUES ('1972', '1864', '7', '19', '太平天国天京失陷。');
INSERT INTO `history_today` VALUES ('1973', '1870', '7', '19', '普法战争爆发。');
INSERT INTO `history_today` VALUES ('1974', '1919', '7', '19', '直皖战争结束，段祺瑞辞职');
INSERT INTO `history_today` VALUES ('1975', '1927', '7', '19', '工人运动领袖赵世炎牺牲');
INSERT INTO `history_today` VALUES ('1976', '1949', '7', '19', '全国文学艺术工作者代表大会召开');
INSERT INTO `history_today` VALUES ('1977', '1952', '7', '19', '第15届奥运会在芬兰赫尔辛基举行');
INSERT INTO `history_today` VALUES ('1978', '1954', '7', '19', '引擎班机波音707首航');
INSERT INTO `history_today` VALUES ('1979', '1958', '7', '19', '我国与柬埔寨建交。');
INSERT INTO `history_today` VALUES ('1980', '1961', '7', '19', '中共中央发出《关于自然科学工作中若干政策问题的批示报告》');
INSERT INTO `history_today` VALUES ('1981', '1961', '7', '19', '中央批准施行《科研十四条》');
INSERT INTO `history_today` VALUES ('1982', '1847', '7', '20', '上海发生徐家汇教案。');
INSERT INTO `history_today` VALUES ('1983', '1899', '7', '20', '康有为在加拿大创立“保皇会”');
INSERT INTO `history_today` VALUES ('1984', '1900', '7', '20', '齐柏林飞艇首次飞行');
INSERT INTO `history_today` VALUES ('1985', '1926', '7', '20', '捷尔任斯基逝世');
INSERT INTO `history_today` VALUES ('1986', '1936', '7', '20', '黑海两海峡公约订立');
INSERT INTO `history_today` VALUES ('1987', '1939', '7', '20', '中共在延安创办了中国女子大学');
INSERT INTO `history_today` VALUES ('1988', '1944', '7', '20', '“七二零”谋刺希特勒事件');
INSERT INTO `history_today` VALUES ('1989', '1946', '7', '20', '中共指示以自我战争粉碎蒋介石的进攻');
INSERT INTO `history_today` VALUES ('1990', '1951', '7', '20', '毛泽东表述“毛泽东思想”');
INSERT INTO `history_today` VALUES ('1991', '1960', '7', '20', '班达拉奈克夫人出任斯里兰卡总理');
INSERT INTO `history_today` VALUES ('1992', '1919', '7', '21', '《天津学生联合会会报》创刊。');
INSERT INTO `history_today` VALUES ('1993', '1928', '7', '21', '全国反日大会在上海召开');
INSERT INTO `history_today` VALUES ('1994', '1947', '7', '21', '中共中央召开小河村会议');
INSERT INTO `history_today` VALUES ('1995', '1950', '7', '21', '中共中央转发北京市委关于整风工作的报告。');
INSERT INTO `history_today` VALUES ('1996', '1954', '7', '21', '关于印度支那问题的日内瓦协议签订。');
INSERT INTO `history_today` VALUES ('1997', '1956', '7', '21', '周恩来强调专政要继续　民主要扩大');
INSERT INTO `history_today` VALUES ('1998', '1960', '7', '21', '英国人创造单身横渡大西洋新纪录。');
INSERT INTO `history_today` VALUES ('1999', '1963', '7', '21', '琼瑶发表第一部长篇小说《窗外》。');
INSERT INTO `history_today` VALUES ('2000', '1968', '7', '21', '毛泽东对《从上海机床厂看培养工程技术人员的道路》作批示');
INSERT INTO `history_today` VALUES ('2001', '1969', '7', '21', '“阿波罗”号登上月球。');
INSERT INTO `history_today` VALUES ('2002', '1843', '7', '22', '《中英五口通商章程》在香港实施。');
INSERT INTO `history_today` VALUES ('2003', '1919', '7', '22', '全国学生联合会发表《终止罢课宣言》');
INSERT INTO `history_today` VALUES ('2004', '1928', '7', '22', '彭德怀等发动平江起义');
INSERT INTO `history_today` VALUES ('2005', '1944', '7', '22', '美军观察组考察延安');
INSERT INTO `history_today` VALUES ('2006', '1946', '7', '22', '耶路撒冷的英国办事处被炸毁');
INSERT INTO `history_today` VALUES ('2007', '1952', '7', '22', '埃及七月革命爆发');
INSERT INTO `history_today` VALUES ('2008', '1958', '7', '22', '中共中央军事委员会扩大会议结束');
INSERT INTO `history_today` VALUES ('2009', '1967', '7', '22', '“文攻武卫”口号出笼');
INSERT INTO `history_today` VALUES ('2010', '1968', '7', '22', '毛泽东说：学制要缩短，教育要革命');
INSERT INTO `history_today` VALUES ('2011', '1970', '7', '22', '成昆铁路建成通车');
INSERT INTO `history_today` VALUES ('2012', '1892', '7', '23', '孙中山在香港西医书院毕业');
INSERT INTO `history_today` VALUES ('2013', '1900', '7', '23', '第一次泛非会议召开');
INSERT INTO `history_today` VALUES ('2014', '1903', '7', '23', '福特公司售出第一辆汽车');
INSERT INTO `history_today` VALUES ('2015', '1921', '7', '23', '中国共产党第一次代表大会召开');
INSERT INTO `history_today` VALUES ('2016', '1930', '7', '23', '共产国际就中国革命问题作出决议');
INSERT INTO `history_today` VALUES ('2017', '1939', '7', '23', '中共中央指出抗战是艰苦的持久战');
INSERT INTO `history_today` VALUES ('2018', '1946', '7', '23', '宋庆龄发表反对独裁和内战的声明');
INSERT INTO `history_today` VALUES ('2019', '1947', '7', '23', '毛泽东提出五年打败蒋介石');
INSERT INTO `history_today` VALUES ('2020', '1949', '7', '23', '全国工会工作会议在北平举行');
INSERT INTO `history_today` VALUES ('2021', '1950', '7', '23', '关于镇压反革命活动的指示公布');
INSERT INTO `history_today` VALUES ('2022', '1189', '7', '24', '“治天下匠”耶律楚材诞辰');
INSERT INTO `history_today` VALUES ('2023', '1783', '7', '24', '玻利瓦尔诞生，南美殖民地独立战争领袖（1830年逝世）');
INSERT INTO `history_today` VALUES ('2024', '1802', '7', '24', '大仲马诞生，法国作家（1870年逝世）');
INSERT INTO `history_today` VALUES ('2025', '1828', '7', '24', '车尔尼雪夫斯基诞生，俄国作家（1889年逝世）');
INSERT INTO `history_today` VALUES ('2026', '1842', '7', '24', '郑观应，中国近现代改良主义者');
INSERT INTO `history_today` VALUES ('2027', '1886', '7', '24', '谷崎润一郎诞生，日本著名的小说家（1965年逝世） 。');
INSERT INTO `history_today` VALUES ('2028', '1909', '7', '24', '杰尔兹·罗佐基，波兰数学家、密码学家（1942年逝世） 。');
INSERT INTO `history_today` VALUES ('2029', '1917', '7', '24', '潘希真，笔名琦君，台湾知名作家。（2006年逝世）。');
INSERT INTO `history_today` VALUES ('2030', '1936', '7', '24', '闫怀礼，著名演员。（2009年逝世）。');
INSERT INTO `history_today` VALUES ('2031', '1962', '7', '24', '商天娥，香港演员。');
INSERT INTO `history_today` VALUES ('2032', '1886', '7', '25', '重庆教案发生。');
INSERT INTO `history_today` VALUES ('2033', '1894', '7', '25', '日舰袭击中国船舰　发动侵略战争');
INSERT INTO `history_today` VALUES ('2034', '1898', '7', '25', '张之洞所著《劝学篇》颁发各省。');
INSERT INTO `history_today` VALUES ('2035', '1909', '7', '25', '飞机第一次成功飞越英吉利海峡');
INSERT INTO `history_today` VALUES ('2036', '1919', '7', '25', '苏俄发表第一次对华宣言');
INSERT INTO `history_today` VALUES ('2037', '1944', '7', '25', '中共中央发布向河南敌后进军的命令');
INSERT INTO `history_today` VALUES ('2038', '1946', '7', '25', '比基尼泳装首次亮相');
INSERT INTO `history_today` VALUES ('2039', '1953', '7', '25', '成渝铁路交付运营');
INSERT INTO `history_today` VALUES ('2040', '1961', '7', '25', '苏美扩大防务计划');
INSERT INTO `history_today` VALUES ('2041', '1976', '7', '25', '云南元谋猿人年龄首次测出');
INSERT INTO `history_today` VALUES ('2042', '1898', '7', '26', '清政府改《时务报》为官办');
INSERT INTO `history_today` VALUES ('2043', '1940', '7', '26', '日本提出所谓大东亚共荣圈构想');
INSERT INTO `history_today` VALUES ('2044', '1945', '7', '26', '中、美、英三国签署发表了《波茨坦公告》');
INSERT INTO `history_today` VALUES ('2045', '1947', '7', '26', '美国军事力量终于得以统一');
INSERT INTO `history_today` VALUES ('2046', '1947', '7', '26', '日本降舰驶抵上海');
INSERT INTO `history_today` VALUES ('2047', '1953', '7', '26', '古巴爆发“七·二六运动”');
INSERT INTO `history_today` VALUES ('2048', '1954', '7', '26', '首批国产飞机试飞');
INSERT INTO `history_today` VALUES ('2049', '1956', '7', '26', '国家开始对私营工商业进行社会主义改造');
INSERT INTO `history_today` VALUES ('2050', '1956', '7', '26', '埃及总统纳赛尔接管苏伊士运河');
INSERT INTO `history_today` VALUES ('2051', '1959', '7', '26', '毛泽东对李云仲的信作出批示');
INSERT INTO `history_today` VALUES ('2052', '1921', '7', '27', '胰岛素分离成功。');
INSERT INTO `history_today` VALUES ('2053', '1937', '7', '27', '毛泽东、张闻天强调红军改编原则');
INSERT INTO `history_today` VALUES ('2054', '1948', '7', '27', '中共揭露国民党假和平的阴谋');
INSERT INTO `history_today` VALUES ('2055', '1949', '7', '27', '世界第一架喷气客机号试飞。');
INSERT INTO `history_today` VALUES ('2056', '1949', '7', '27', '中共中央委托陈云召开财政经济会议');
INSERT INTO `history_today` VALUES ('2057', '1953', '7', '27', '《朝鲜停战协定》在板门店签订');
INSERT INTO `history_today` VALUES ('2058', '1953', '7', '27', '朝鲜战争结束');
INSERT INTO `history_today` VALUES ('2059', '1954', '7', '27', '英国结束对埃及72年的占领。');
INSERT INTO `history_today` VALUES ('2060', '1958', '7', '27', '包兰铁路通车。');
INSERT INTO `history_today` VALUES ('2061', '1965', '7', '27', '毛泽东接见海外归来的李宗仁及其夫人');
INSERT INTO `history_today` VALUES ('2062', '1841', '7', '28', '道光皇帝谕令沿海各省撤兵');
INSERT INTO `history_today` VALUES ('2063', '1878', '7', '28', '清政府与美国签订《中美续增条约》');
INSERT INTO `history_today` VALUES ('2064', '1908', '7', '28', '我国最早设立的国家储蓄银行');
INSERT INTO `history_today` VALUES ('2065', '1949', '7', '28', '英舰“紫石英”号逃出长江口');
INSERT INTO `history_today` VALUES ('2066', '1976', '7', '28', '“7·28”唐山大地震');
INSERT INTO `history_today` VALUES ('2067', '1980', '7', '28', '中共内蒙古自治区委召开常委扩大会议讨论经济搞活的问题');
INSERT INTO `history_today` VALUES ('2068', '1980', '7', '28', '中共中央给黄克诚平反，恢复名誉');
INSERT INTO `history_today` VALUES ('2069', '1984', '7', '28', '第23届奥运会在洛杉矶举行');
INSERT INTO `history_today` VALUES ('2070', '1989', '7', '28', '中共中央、国务院关于近期做几件群众关心的事的决定');
INSERT INTO `history_today` VALUES ('2071', '1990', '7', '28', '王震副主席再访北大荒');
INSERT INTO `history_today` VALUES ('2072', '1030', '7', '29', '奥拉夫二世（Olaf II），挪威国王（995年诞生）');
INSERT INTO `history_today` VALUES ('2073', '1099', '7', '29', '乌尔班二世（Pope Urban II），罗马教皇（1042年诞生');
INSERT INTO `history_today` VALUES ('2074', '1108', '7', '29', '菲利普一世（Philip I），法国国王（1052年诞生）');
INSERT INTO `history_today` VALUES ('2075', '1128', '7', '29', '宗泽，南宋将领（1060年诞生）');
INSERT INTO `history_today` VALUES ('2076', '1507', '7', '29', '马丁·贝海姆（Martin Behaim），德国裔航海家、地理学家（1459年诞生）');
INSERT INTO `history_today` VALUES ('2077', '1612', '7', '29', '邦加尔（Jacques Bongars），法国学者、外交官（1554年诞生）');
INSERT INTO `history_today` VALUES ('2078', '1616', '7', '29', '汤显祖，明朝戏曲家（1550年诞生）');
INSERT INTO `history_today` VALUES ('2079', '1644', '7', '29', '乌尔班八世（Pope Urban VIII），罗马教皇（1568年诞生');
INSERT INTO `history_today` VALUES ('2080', '1752', '7', '29', '彼得·沃伦（Peter Warren），英国海军上将');
INSERT INTO `history_today` VALUES ('2081', '1781', '7', '29', 'Johann Kies，德国天文学家、数学家（1713年诞生）');
INSERT INTO `history_today` VALUES ('2082', '1085', '7', '30', '北宋废除新法');
INSERT INTO `history_today` VALUES ('2083', '1862', '7', '30', '徐寿和华蘅芳合作制成轮船汽机');
INSERT INTO `history_today` VALUES ('2084', '1903', '7', '30', '“布尔什维克”和“孟什维克”两派对立');
INSERT INTO `history_today` VALUES ('2085', '1905', '7', '30', '孙中山发起同盟会');
INSERT INTO `history_today` VALUES ('2086', '1907', '7', '30', '日俄共同谋划分裂中国');
INSERT INTO `history_today` VALUES ('2087', '1923', '7', '30', '中国自行设计生产第一架飞机');
INSERT INTO `history_today` VALUES ('2088', '1932', '7', '30', '中国首次参加奥运会，唯一参加比赛的是短跑选手刘长春。');
INSERT INTO `history_today` VALUES ('2089', '1937', '7', '30', '“七君子”出狱');
INSERT INTO `history_today` VALUES ('2090', '1937', '7', '30', '平津沦陷');
INSERT INTO `history_today` VALUES ('2091', '1943', '7', '30', '毛泽东作出敌后工作指示');
INSERT INTO `history_today` VALUES ('2092', '1556', '7', '31', '圣依纳爵·罗耀拉，罗马天主教耶稣会的创始人（-1491年？）');
INSERT INTO `history_today` VALUES ('2093', '1911', '7', '31', '同盟会中部总会成立');
INSERT INTO `history_today` VALUES ('2094', '1920', '7', '31', '伯尔尼国际成立。');
INSERT INTO `history_today` VALUES ('2095', '1946', '7', '31', '汉奸殷汝耕被判死刑');
INSERT INTO `history_today` VALUES ('2096', '1950', '7', '31', '彭德怀被授予“朝鲜英雄”称号。');
INSERT INTO `history_today` VALUES ('2097', '1950', '7', '31', '美国开始干预朝鲜战争。');
INSERT INTO `history_today` VALUES ('2098', '1955', '7', '31', '毛泽东作《关于农业合作化问题》的报告');
INSERT INTO `history_today` VALUES ('2099', '1955', '7', '31', '党中央召集省委市委、自治区党委书记会议');
INSERT INTO `history_today` VALUES ('2100', '1958', '7', '31', '伊拉克政变。');
INSERT INTO `history_today` VALUES ('2101', '1958', '7', '31', '毛泽东拒绝苏方建立联合舰队建议。');
INSERT INTO `history_today` VALUES ('2102', '1498', '8', '1', '哥伦布在第三次航行中于奥里诺科河口附近发现了南美洲。');
INSERT INTO `history_today` VALUES ('2103', '1647', '8', '1', '清朝顺治皇帝晋封多铎为辅政叔德豫亲王。');
INSERT INTO `history_today` VALUES ('2104', '1655', '8', '1', '清立内十三衙门铁碑，严禁宦官干政。');
INSERT INTO `history_today` VALUES ('2105', '1774', '8', '1', '英国化学家普利斯特列在实验室加热氧化汞时发现氧气。');
INSERT INTO `history_today` VALUES ('2106', '1894', '8', '1', '中日两国宣战，甲午战争全面爆发');
INSERT INTO `history_today` VALUES ('2107', '1895', '8', '1', '古田教案发生。');
INSERT INTO `history_today` VALUES ('2108', '1896', '8', '1', '中国第一次放映电影');
INSERT INTO `history_today` VALUES ('2109', '1914', '8', '1', '德国首先向俄国宣战 “一战”爆发');
INSERT INTO `history_today` VALUES ('2110', '1914', '8', '1', '德国首先向俄国宣战  “一战”爆发');
INSERT INTO `history_today` VALUES ('2111', '1915', '8', '1', '“袁大头”成为唯一法定国币');
INSERT INTO `history_today` VALUES ('2112', '1608', '8', '2', '英国屠杀在托里岛避难的爱尔兰造反者。');
INSERT INTO `history_today` VALUES ('2113', '1815', '8', '2', '普鲁士、奥地利、英国和俄国一致同意由英国人作出关于囚禁拿破仑的决定，于是拿破仑被放逐到圣赫勒拿岛。');
INSERT INTO `history_today` VALUES ('2114', '1830', '8', '2', '法国波旁王朝国王查理十世在七月革命压力下被迫宣布退位，把王位让给其孙尚博尔伯爵。');
INSERT INTO `history_today` VALUES ('2115', '1860', '8', '2', '李秀成大破洋枪队于江苏青浦。');
INSERT INTO `history_today` VALUES ('2116', '1911', '8', '2', '赵尔丰任成都总督');
INSERT INTO `history_today` VALUES ('2117', '1914', '8', '2', '第一次世界大战全面爆发');
INSERT INTO `history_today` VALUES ('2118', '1916', '8', '2', '邵飘萍创办新闻编译社');
INSERT INTO `history_today` VALUES ('2119', '1918', '8', '2', '庄士敦成为溥仪的英语教师');
INSERT INTO `history_today` VALUES ('2120', '1923', '8', '2', '浙江发起和平运动');
INSERT INTO `history_today` VALUES ('2121', '1934', '8', '2', '希特勒继任德国总统');
INSERT INTO `history_today` VALUES ('2122', '1460', '8', '3', '苏格兰国王詹姆斯二世逝世，其子詹姆斯三世继位。');
INSERT INTO `history_today` VALUES ('2123', '1492', '8', '3', '哥伦布第一次远航');
INSERT INTO `history_today` VALUES ('2124', '1567', '8', '3', '伊达政宗，日本 战国大名');
INSERT INTO `history_today` VALUES ('2125', '1778', '8', '3', '意大利米兰斯卡拉歌剧院启用');
INSERT INTO `history_today` VALUES ('2126', '1904', '8', '3', '英军侵占西藏地方首府拉萨');
INSERT INTO `history_today` VALUES ('2127', '1918', '8', '3', '日本抢米暴动开始');
INSERT INTO `history_today` VALUES ('2128', '1923', '8', '3', '鲁迅出版小说集《呐喊》');
INSERT INTO `history_today` VALUES ('2129', '1933', '8', '3', '冯玉祥辞去同盟军总司令职');
INSERT INTO `history_today` VALUES ('2130', '1938', '8', '3', '日军向武汉合围');
INSERT INTO `history_today` VALUES ('2131', '1940', '8', '3', '波罗的海三国加入苏联');
INSERT INTO `history_today` VALUES ('2132', '1578', '8', '4', '葡萄牙国王塞巴斯蒂昂率领军队与摩洛哥军队交战，在撤退时溺死于马哈赞河。');
INSERT INTO `history_today` VALUES ('2133', '1701', '8', '4', '在西班牙王位继承战争中.');
INSERT INTO `history_today` VALUES ('2134', '1789', '8', '4', '法国废除封建制。');
INSERT INTO `history_today` VALUES ('2135', '1791', '8', '4', '土耳其根据西斯托瓦条约，把罗马尼亚南部的奥尔肖瓦割让给奥地利。');
INSERT INTO `history_today` VALUES ('2136', '1820', '8', '4', '中国河南许州(今许昌)发生6级地震。');
INSERT INTO `history_today` VALUES ('2137', '1876', '8', '4', '凯尔文学院创立。');
INSERT INTO `history_today` VALUES ('2138', '1900', '8', '4', '中国东北瑷珲城火烧案');
INSERT INTO `history_today` VALUES ('2139', '1906', '8', '4', '京剧剧本首次结集出版');
INSERT INTO `history_today` VALUES ('2140', '1912', '8', '4', '美国海军陆战队开进尼加拉瓜');
INSERT INTO `history_today` VALUES ('2141', '1913', '8', '4', '孙中山等大批党人出逃日本');
INSERT INTO `history_today` VALUES ('2142', '1600', '8', '5', '苏格兰发生高里阴谋事件。');
INSERT INTO `history_today` VALUES ('2143', '1884', '8', '5', '刘铭传抗法');
INSERT INTO `history_today` VALUES ('2144', '1914', '8', '5', '白朗战死虎狼爬岭');
INSERT INTO `history_today` VALUES ('2145', '1919', '8', '5', '土耳其民族主义运动爆发');
INSERT INTO `history_today` VALUES ('2146', '1921', '8', '5', '第一辆无人驾驶、由无线电操纵的汽车在美国试验成功');
INSERT INTO `history_today` VALUES ('2147', '1926', '8', '5', '第一部配乐电影在美国纽约上映,片名《唐璜》');
INSERT INTO `history_today` VALUES ('2148', '1944', '8', '5', '中国军队攻占密支那');
INSERT INTO `history_today` VALUES ('2149', '1949', '8', '5', '美国发表《美国与中国的关系》白皮书');
INSERT INTO `history_today` VALUES ('2150', '1950', '8', '5', '国民党中央改造委员会在台北成立');
INSERT INTO `history_today` VALUES ('2151', '1962', '8', '5', '好莱坞著名影星玛丽莲·梦露“自杀”');
INSERT INTO `history_today` VALUES ('2152', '1399', '8', '6', '燕王朱棣起兵北平，以“清君侧”为名，发动“靖难之役”。');
INSERT INTO `history_today` VALUES ('2153', '1726', '8', '6', '神圣罗马帝国和俄国缔结反土耳其军事联盟。');
INSERT INTO `history_today` VALUES ('2154', '1806', '8', '6', '弗朗西斯二世正式放弃神圣罗马帝国皇位，成为奥地利皇帝弗朗西斯一世，神圣罗马帝国结束。');
INSERT INTO `history_today` VALUES ('2155', '1914', '8', '6', '奥匈帝国对俄宣战。同日，塞尔维亚和门的内哥罗对奥匈帝国宣战。');
INSERT INTO `history_today` VALUES ('2156', '1915', '8', '6', '第一次世界大战中德军占领华沙');
INSERT INTO `history_today` VALUES ('2157', '1926', '8', '6', '来自纽约的游泳运动员格特鲁德-埃德尔用了14小时31分成功游渡英吉利海峡，成为世界第一位游过英吉利海峡的妇女');
INSERT INTO `history_today` VALUES ('2158', '1930', '8', '6', '中共成立指挥全国武装暴动的最高机构');
INSERT INTO `history_today` VALUES ('2159', '1931', '8', '6', '第三次反围剿战争开始');
INSERT INTO `history_today` VALUES ('2160', '1932', '8', '6', '最早的国际电影节威尼斯国际电影节创办，这是世界上第一个国际电影节，被誉为“国际电影节之父”。');
INSERT INTO `history_today` VALUES ('2161', '1935', '8', '6', '中共中央政治局在中央红军长征途中于四川毛儿盖召开会议。');
INSERT INTO `history_today` VALUES ('2162', '1819', '8', '7', '玻利瓦尔和桑坦德领导的起义军在波哥大附近波亚卡桥边击溃西班牙殖民军主力。史称“波亚卡战役”。');
INSERT INTO `history_today` VALUES ('2163', '1888', '8', '7', '英国伦敦白教堂区发生20世纪最神秘连环杀人案——凶手“开膛手杰克”至今不知道是何人。');
INSERT INTO `history_today` VALUES ('2164', '1904', '8', '7', '日俄在我国辽阳、旅顺展开争夺战');
INSERT INTO `history_today` VALUES ('2165', '1919', '8', '7', '孙中山辞去政务总裁一职');
INSERT INTO `history_today` VALUES ('2166', '1924', '8', '7', '婚外两性关系引起许多恶性事件');
INSERT INTO `history_today` VALUES ('2167', '1927', '8', '7', '“八七会议”召开');
INSERT INTO `history_today` VALUES ('2168', '1939', '8', '7', '美孚石油公司获准开采阿拉伯石油');
INSERT INTO `history_today` VALUES ('2169', '1942', '8', '7', '瓜达尔卡纳尔岛战役开始');
INSERT INTO `history_today` VALUES ('2170', '1947', '8', '7', '千里挺进大别山');
INSERT INTO `history_today` VALUES ('2171', '1949', '8', '7', '梵蒂冈确信发现了圣彼得骨骸');
INSERT INTO `history_today` VALUES ('2172', '1549', '8', '8', '法国向英国宣战');
INSERT INTO `history_today` VALUES ('2173', '1890', '8', '8', '大足教案');
INSERT INTO `history_today` VALUES ('2174', '1913', '8', '8', '讨袁军与北军在南京血战');
INSERT INTO `history_today` VALUES ('2175', '1918', '8', '8', '一战：亚眠战役。');
INSERT INTO `history_today` VALUES ('2176', '1925', '8', '8', '美国4万名三K党党徒举行示威');
INSERT INTO `history_today` VALUES ('2177', '1940', '8', '8', '法国四名著名人物被维希政府逮捕');
INSERT INTO `history_today` VALUES ('2178', '1944', '8', '8', '日军攻陷衡阳，在衡阳烧杀淫掠');
INSERT INTO `history_today` VALUES ('2179', '1945', '8', '8', '二战：苏联向日本宣战。');
INSERT INTO `history_today` VALUES ('2180', '1945', '8', '8', '美国签署联合国宪章，成为联合国第一个成员国。');
INSERT INTO `history_today` VALUES ('2181', '1946', '8', '8', '中共土改政策向富农让步');
INSERT INTO `history_today` VALUES ('2182', '1173', '8', '9', '意大利著名的比萨斜塔破土动工。');
INSERT INTO `history_today` VALUES ('2183', '1615', '8', '9', '法国爆发第二次内战。');
INSERT INTO `history_today` VALUES ('2184', '1896', '8', '9', '《时务报》在上海发行');
INSERT INTO `history_today` VALUES ('2185', '1897', '8', '9', '国际数学家大会在瑞士苏黎世召开');
INSERT INTO `history_today` VALUES ('2186', '1900', '8', '9', '唐才常“讨贼勤王”失败');
INSERT INTO `history_today` VALUES ('2187', '1901', '8', '9', '俄克拉荷马移民获得大批印第安人土地');
INSERT INTO `history_today` VALUES ('2188', '1919', '8', '9', '中国试制成功第一架水上飞机');
INSERT INTO `history_today` VALUES ('2189', '1919', '8', '9', '英国同意确保波斯主权军队');
INSERT INTO `history_today` VALUES ('2190', '1930', '8', '9', '中国农工民主党在上海成立');
INSERT INTO `history_today` VALUES ('2191', '1931', '8', '9', '土族废除土司制度');
INSERT INTO `history_today` VALUES ('2192', '1566', '8', '10', '荷兰独立战争');
INSERT INTO `history_today` VALUES ('2193', '1664', '8', '10', '土耳其和神圣罗马帝国签订沃什堡停战协议');
INSERT INTO `history_today` VALUES ('2194', '1792', '8', '10', '法国人民推翻君主统治');
INSERT INTO `history_today` VALUES ('2195', '1792', '8', '10', '法国大革命：路易十六被逮捕。');
INSERT INTO `history_today` VALUES ('2196', '1809', '8', '10', '在被西班牙殖民统治三个世纪之后，基多宣布独立。');
INSERT INTO `history_today` VALUES ('2197', '1898', '8', '10', '光绪帝要求内外诸臣议事莫“墨守旧章”');
INSERT INTO `history_today` VALUES ('2198', '1900', '8', '10', '戴维斯和沃德赢得第一个戴维斯奖杯');
INSERT INTO `history_today` VALUES ('2199', '1913', '8', '10', '巴尔干战争结束。');
INSERT INTO `history_today` VALUES ('2200', '1918', '8', '10', '段祺瑞改革币制。');
INSERT INTO `history_today` VALUES ('2201', '1932', '8', '10', '琼崖根据地大部被国民党攻占');
INSERT INTO `history_today` VALUES ('2202', '1566', '8', '11', '欧洲历史上著名的“破坏圣像运动”');
INSERT INTO `history_today` VALUES ('2203', '1863', '8', '11', '法国确定柬埔寨为其保护国。');
INSERT INTO `history_today` VALUES ('2204', '1872', '8', '11', '中国第一批留学生启程赴美.');
INSERT INTO `history_today` VALUES ('2205', '1902', '8', '11', '中国第一所专业艺术学校成立');
INSERT INTO `history_today` VALUES ('2206', '1912', '8', '11', '袁世凯秘密扩充北洋军');
INSERT INTO `history_today` VALUES ('2207', '1912', '8', '11', '中国国民党成立');
INSERT INTO `history_today` VALUES ('2208', '1917', '8', '11', '唐继尧通电护法');
INSERT INTO `history_today` VALUES ('2209', '1938', '8', '11', '抗敌演剧队在武汉成立');
INSERT INTO `history_today` VALUES ('2210', '1945', '8', '11', '我军第一次使用“解放军”名称');
INSERT INTO `history_today` VALUES ('2211', '1945', '8', '11', '八路军发动对日军的全面大反攻');
INSERT INTO `history_today` VALUES ('2212', '1905', '8', '12', '挪威公民投票中止同瑞典的联盟');
INSERT INTO `history_today` VALUES ('2213', '1908', '8', '12', '“t型”福特牌汽车问世');
INSERT INTO `history_today` VALUES ('2214', '1918', '8', '12', '新国会成立');
INSERT INTO `history_today` VALUES ('2215', '1925', '8', '12', '章士钊免去鲁迅教育部佥事职务');
INSERT INTO `history_today` VALUES ('2216', '1932', '8', '12', '9.5万人观看洛杉矶奥运会闭幕式');
INSERT INTO `history_today` VALUES ('2217', '1937', '8', '12', '蒋介石任海陆空军大元帅');
INSERT INTO `history_today` VALUES ('2218', '1949', '8', '12', '关于保护战争受难者的日内瓦公约签订');
INSERT INTO `history_today` VALUES ('2219', '1954', '8', '12', '联合国军撤出北朝鲜的最后一块土地');
INSERT INTO `history_today` VALUES ('2220', '1959', '8', '12', '小石城制止暴徒活动');
INSERT INTO `history_today` VALUES ('2221', '1961', '8', '12', '英国释放肯尼亚民族主义者肯雅塔');
INSERT INTO `history_today` VALUES ('2222', '1792', '8', '13', '法国大革命');
INSERT INTO `history_today` VALUES ('2223', '1803', '8', '13', '清朝封阮福映为安南国王');
INSERT INTO `history_today` VALUES ('2224', '1814', '8', '13', '好望角省成为英国殖民地');
INSERT INTO `history_today` VALUES ('2225', '1905', '8', '13', '挪威成为独立国家');
INSERT INTO `history_today` VALUES ('2226', '1912', '8', '13', '法国医生发现癌细胞');
INSERT INTO `history_today` VALUES ('2227', '1927', '8', '13', '蒋介石下野');
INSERT INTO `history_today` VALUES ('2228', '1937', '8', '13', '“八-一三”事变');
INSERT INTO `history_today` VALUES ('2229', '1939', '8', '13', '日军占领深圳封锁香港');
INSERT INTO `history_today` VALUES ('2230', '1943', '8', '13', '国民党“降官如毛，降将如潮”');
INSERT INTO `history_today` VALUES ('2231', '1945', '8', '13', '毛泽东提出抗战胜利后对蒋方针');
INSERT INTO `history_today` VALUES ('2232', '1385', '8', '14', '葡萄牙人在阿尔儒巴罗塔战役中击败了卡斯蒂利亚人。');
INSERT INTO `history_today` VALUES ('2233', '1733', '8', '14', '波兰继承王位的战争开始。');
INSERT INTO `history_today` VALUES ('2234', '1784', '8', '14', '俄国在科迪亚克岛建立其在阿拉斯加的第一个殖民地。...');
INSERT INTO `history_today` VALUES ('2235', '1811', '8', '14', '英国占领爪哇。');
INSERT INTO `history_today` VALUES ('2236', '1900', '8', '14', '八国联军向北京发起总攻。');
INSERT INTO `history_today` VALUES ('2237', '1915', '8', '14', '杨度等六人发起筹安会');
INSERT INTO `history_today` VALUES ('2238', '1917', '8', '14', '中国正式对德国、奥地利宣战');
INSERT INTO `history_today` VALUES ('2239', '1920', '8', '14', '第七届奥运会在安特卫普举行');
INSERT INTO `history_today` VALUES ('2240', '1934', '8', '14', '参加十四届奥运会的中国运动员举债归国');
INSERT INTO `history_today` VALUES ('2241', '1937', '8', '14', '日机轰炸南京');
INSERT INTO `history_today` VALUES ('2242', '1521', '8', '15', '中美洲阿兹特克帝国首都铁诺奇蒂特兰被西班牙殖民者科尔特斯带领的军队攻陷,阿兹特克帝国灭亡.');
INSERT INTO `history_today` VALUES ('2243', '1878', '8', '15', '我国第一套邮票发行——大龙邮票');
INSERT INTO `history_today` VALUES ('2244', '1900', '8', '15', '八国联军入京，慈禧光绪仓皇避难');
INSERT INTO `history_today` VALUES ('2245', '1900', '8', '15', '慈禧将珍妃投于井内');
INSERT INTO `history_today` VALUES ('2246', '1911', '8', '15', '俄国支持外蒙独立');
INSERT INTO `history_today` VALUES ('2247', '1913', '8', '15', '陈焕章、梁启超等倡议定孔教为国教');
INSERT INTO `history_today` VALUES ('2248', '1914', '8', '15', '巴拿马运河通航');
INSERT INTO `history_today` VALUES ('2249', '1915', '8', '15', '蔡锷、梁启超密谋倒袁');
INSERT INTO `history_today` VALUES ('2250', '1918', '8', '15', '美国与苏俄断交');
INSERT INTO `history_today` VALUES ('2251', '1920', '8', '15', '上海共产主义小组陈独秀、李汉俊发起创办《劳动界》周刊，这是中国共产党创办的第一份通俗工人读物');
INSERT INTO `history_today` VALUES ('2252', '1743', '8', '16', '由英国拳击冠军杰克·布劳顿首次制定了拳击规则。');
INSERT INTO `history_today` VALUES ('2253', '1819', '8', '16', '“彼得卢惨案”发生。');
INSERT INTO `history_today` VALUES ('2254', '1900', '8', '16', '八国联军攻陷北京。');
INSERT INTO `history_today` VALUES ('2255', '1914', '8', '16', '蒋介石到上海筹办起义指挥总部');
INSERT INTO `history_today` VALUES ('2256', '1919', '8', '16', '胡适主张整理国故');
INSERT INTO `history_today` VALUES ('2257', '1922', '8', '16', '中共发起劳动立法运动');
INSERT INTO `history_today` VALUES ('2258', '1931', '8', '16', '兰州发生雷马事变');
INSERT INTO `history_today` VALUES ('2259', '1933', '8', '16', '日军在东北设立细菌部队');
INSERT INTO `history_today` VALUES ('2260', '1945', '8', '16', '越南八月革命开始');
INSERT INTO `history_today` VALUES ('2261', '1945', '8', '16', '日本大本营再次向日军下达停止战斗行动的命令');
INSERT INTO `history_today` VALUES ('2262', '1740', '8', '17', '本笃十四世当选为教皇。');
INSERT INTO `history_today` VALUES ('2263', '1743', '8', '17', '俄国和瑞典鉴订奥布和约，芬兰南部直到直乌门河割让给俄国。');
INSERT INTO `history_today` VALUES ('2264', '1815', '8', '17', '拿破仑到达被放逐的圣赫勒拿岛。');
INSERT INTO `history_today` VALUES ('2265', '1877', '8', '17', '左宗棠奏请在新疆设行省');
INSERT INTO `history_today` VALUES ('2266', '1895', '8', '17', '《中外纪闻》创刊');
INSERT INTO `history_today` VALUES ('2267', '1924', '8', '17', '广州沙面罢工结束。');
INSERT INTO `history_today` VALUES ('2268', '1931', '8', '17', '邓演达被逮捕。');
INSERT INTO `history_today` VALUES ('2269', '1945', '8', '17', '印度尼西亚八月革命爆发');
INSERT INTO `history_today` VALUES ('2270', '1945', '8', '17', '溥仪被苏军俘获。');
INSERT INTO `history_today` VALUES ('2271', '1949', '8', '17', '解放军攻占福州,开始“万寿桥激战”；同日，日本松川事件发生');
INSERT INTO `history_today` VALUES ('2272', '1527', '8', '18', '法军占领意大利的帕维亚和热那亚');
INSERT INTO `history_today` VALUES ('2273', '1905', '8', '18', '反清革命组织共进会成立');
INSERT INTO `history_today` VALUES ('2274', '1914', '8', '18', '美国总统宣布在“一战”中保持中立。');
INSERT INTO `history_today` VALUES ('2275', '1925', '8', '18', '国民革命军正式组建');
INSERT INTO `history_today` VALUES ('2276', '1926', '8', '18', '北伐军攻克汀泗桥、贺胜桥');
INSERT INTO `history_today` VALUES ('2277', '1932', '8', '18', '湘鄂边苏区受到重创');
INSERT INTO `history_today` VALUES ('2278', '1938', '8', '18', '袁牧之、吴印咸创办延安电影团');
INSERT INTO `history_today` VALUES ('2279', '1942', '8', '18', '日本反战同盟华北联合会成立');
INSERT INTO `history_today` VALUES ('2280', '1949', '8', '18', '毛泽东著《别了，司徒雷登》。');
INSERT INTO `history_today` VALUES ('2281', '1950', '8', '18', '第一次自然科学工作者代表会议召开。');
INSERT INTO `history_today` VALUES ('2282', '1587', '8', '19', '教皇西克斯图斯王五世宣布，天主教发动对英格兰的战争。');
INSERT INTO `history_today` VALUES ('2283', '1861', '8', '19', '大成国起义军主力受重挫');
INSERT INTO `history_today` VALUES ('2284', '1866', '8', '19', '左宗棠在福建设立清政府规模最大的新式造船厂——福州船政局');
INSERT INTO `history_today` VALUES ('2285', '1903', '8', '19', '在色雷斯东部爆发了保加利亚人反对土耳其的普列欧布拉兹赫尼起义..');
INSERT INTO `history_today` VALUES ('2286', '1905', '8', '19', '俄国沙皇成立杜马');
INSERT INTO `history_today` VALUES ('2287', '1908', '8', '19', '比利时正式兼并刚果');
INSERT INTO `history_today` VALUES ('2288', '1918', '8', '19', '诗人李叔同出家');
INSERT INTO `history_today` VALUES ('2289', '1942', '8', '19', '盟军突击队袭击迪耶普失败');
INSERT INTO `history_today` VALUES ('2290', '1942', '8', '19', '斯大林格勒大会战开始');
INSERT INTO `history_today` VALUES ('2291', '1948', '8', '19', '国民政府发行金圆券');
INSERT INTO `history_today` VALUES ('2292', '1935', '8', '20', '1935年8月4日中共中央在毛儿盖召开政治局会议');
INSERT INTO `history_today` VALUES ('2293', '1609', '8', '21', '意大利科学家伽利略展示了人类历史上第一架按照科学原理制造出来的望远镜。');
INSERT INTO `history_today` VALUES ('2294', '1898', '8', '21', '清廷设立农工商总局');
INSERT INTO `history_today` VALUES ('2295', '1900', '8', '21', '维新派自立军起义失败。');
INSERT INTO `history_today` VALUES ('2296', '1903', '8', '21', '两个美国人驾车横跨美国大陆。');
INSERT INTO `history_today` VALUES ('2297', '1908', '8', '21', '奥维尔-赖特建造第一架军用飞机。');
INSERT INTO `history_today` VALUES ('2298', '1935', '8', '21', '红一、四方面军开始穿越草地。');
INSERT INTO `history_today` VALUES ('2299', '1937', '8', '21', '中苏签订《互不侵犯条约》。');
INSERT INTO `history_today` VALUES ('2300', '1940', '8', '21', '聂荣臻于战火中救出日本女孩。');
INSERT INTO `history_today` VALUES ('2301', '1945', '8', '21', '日本向中国投降。');
INSERT INTO `history_today` VALUES ('2302', '1953', '8', '21', '中国少年儿童队改名为中国少年先锋队');
INSERT INTO `history_today` VALUES ('2303', '2001', '8', '22', '北约组织决定派遣维和部队前往马其顿。');
INSERT INTO `history_today` VALUES ('2304', '1930', '8', '23', '红一军团和红三军团在湖南浏阳永和会师，中国工农红军第一方面军成立。');
INSERT INTO `history_today` VALUES ('2305', '1945', '8', '24', '蒋介石代表中国在联合国宪章上签字。');
INSERT INTO `history_today` VALUES ('2306', '1227', '8', '25', '成吉思汗逝世，蒙古领袖（生于1162年） ');
INSERT INTO `history_today` VALUES ('2307', '1996', '8', '25', '女作家戴厚英被害');
INSERT INTO `history_today` VALUES ('2308', '2006', '8', '27', '《中华人民共和国合伙企业法》正式施行,自2007年6月1日起施行。');
INSERT INTO `history_today` VALUES ('2309', '1953', '8', '28', '全国开展增产节约运动。');
INSERT INTO `history_today` VALUES ('2310', '1978', '8', '29', '三名美国人驾驶气球首次完成横渡大西洋的飞行。');
INSERT INTO `history_today` VALUES ('2311', '1363', '8', '31', '朱元璋和陈友谅大战于鄱阳湖');
INSERT INTO `history_today` VALUES ('2312', '1888', '8', '31', '开膛手杰克於伦敦犯下第一起凶杀案');
INSERT INTO `history_today` VALUES ('2313', '1907', '8', '31', '英、法、俄三国协约形成');
INSERT INTO `history_today` VALUES ('2314', '1916', '8', '31', '蔡锷东渡日本养病');
INSERT INTO `history_today` VALUES ('2315', '1935', '8', '31', '美国通过《中立法案》');
INSERT INTO `history_today` VALUES ('2316', '1937', '8', '31', '日本华北方面军成立');
INSERT INTO `history_today` VALUES ('2317', '1940', '8', '31', '陈毅建议八路军迅速南进');
INSERT INTO `history_today` VALUES ('2318', '1941', '8', '31', '晋察冀边区完成民主大选举');
INSERT INTO `history_today` VALUES ('2319', '1944', '8', '31', '毛泽东论述新民主主义社会基础问题');
INSERT INTO `history_today` VALUES ('2320', '1944', '8', '31', '波兰人在华沙起义');
INSERT INTO `history_today` VALUES ('2321', '1870', '9', '1', '普法战争　法军溃败');
INSERT INTO `history_today` VALUES ('2322', '1904', '9', '1', '拉德克利夫学院授予海伦·凯勒学位');
INSERT INTO `history_today` VALUES ('2323', '1906', '9', '1', '清廷宣布预备立宪');
INSERT INTO `history_today` VALUES ('2324', '1916', '9', '1', '《新青年》出版');
INSERT INTO `history_today` VALUES ('2325', '1917', '9', '1', '孙中山当选为广州军政府大元帅,吴景濂');
INSERT INTO `history_today` VALUES ('2326', '1923', '9', '1', '日本关东大地震');
INSERT INTO `history_today` VALUES ('2327', '1937', '9', '1', '淞沪战事惨烈');
INSERT INTO `history_today` VALUES ('2328', '1939', '9', '1', '德国进攻波兰　“二战”全面爆发');
INSERT INTO `history_today` VALUES ('2329', '1942', '9', '1', '《关于统一抗日根据地党的领导及调整各组织间关系的决定》');
INSERT INTO `history_today` VALUES ('2330', '1947', '9', '1', '中共中央发出《解放战争第二年的战略方针》');
INSERT INTO `history_today` VALUES ('2331', '1856', '9', '2', '太平天国“天京事变”');
INSERT INTO `history_today` VALUES ('2332', '1905', '9', '2', '清政府废除科举制度');
INSERT INTO `history_today` VALUES ('2333', '1910', '9', '2', '著名诗人郭小川出生');
INSERT INTO `history_today` VALUES ('2334', '1914', '9', '2', '日军在山东登陆');
INSERT INTO `history_today` VALUES ('2335', '1931', '9', '2', '红军粉碎第三次围剿');
INSERT INTO `history_today` VALUES ('2336', '1944', '9', '2', '日军进攻广西');
INSERT INTO `history_today` VALUES ('2337', '1945', '9', '2', '朝鲜三八线划分');
INSERT INTO `history_today` VALUES ('2338', '1945', '9', '2', '日本签署无条件投降书');
INSERT INTO `history_today` VALUES ('2339', '1945', '9', '2', '阎锡山秘密收留军');
INSERT INTO `history_today` VALUES ('2340', '1947', '9', '2', '里约热内卢条约签署');
INSERT INTO `history_today` VALUES ('2341', '1866', '9', '3', '第一国际的日内瓦会议召开');
INSERT INTO `history_today` VALUES ('2342', '1900', '9', '3', '奕匡归京办理和八国联军议和事宜');
INSERT INTO `history_today` VALUES ('2343', '1900', '9', '3', '八国联军四出伐剿捕杀京郊义和团员');
INSERT INTO `history_today` VALUES ('2344', '1916', '9', '3', '齐柏林飞艇在空袭伦敦时被击落');
INSERT INTO `history_today` VALUES ('2345', '1926', '9', '3', '北伐军在武汉、南昌展开攻城战');
INSERT INTO `history_today` VALUES ('2346', '1933', '9', '3', '“少共国际师”正式成立');
INSERT INTO `history_today` VALUES ('2347', '1936', '9', '3', '不干涉西班牙内战协定签字');
INSERT INTO `history_today` VALUES ('2348', '1941', '9', '3', '中国军队收复福州');
INSERT INTO `history_today` VALUES ('2349', '1943', '9', '3', '意大利向盟国投降');
INSERT INTO `history_today` VALUES ('2350', '1945', '9', '3', '毛泽东：“庆祝抗日胜利， 中华民族解放万岁!”');
INSERT INTO `history_today` VALUES ('2351', '1763', '9', '4', '法国作家夏多勃里昂出生');
INSERT INTO `history_today` VALUES ('2352', '1905', '9', '4', '复旦公学开学');
INSERT INTO `history_today` VALUES ('2353', '1908', '9', '4', '美国作家赖特诞生');
INSERT INTO `history_today` VALUES ('2354', '1918', '9', '4', '徐世昌当选为总统');
INSERT INTO `history_today` VALUES ('2355', '1924', '9', '4', '孙中山组建北伐军');
INSERT INTO `history_today` VALUES ('2356', '1941', '9', '4', '纳粹包围列宁格勒');
INSERT INTO `history_today` VALUES ('2357', '0', '9', '4', '中共提出建立联合政府');
INSERT INTO `history_today` VALUES ('2358', '1945', '9', '4', '国共两党举行重庆谈判');
INSERT INTO `history_today` VALUES ('2359', '1951', '9', '4', '美国操纵对日和约问题的签署');
INSERT INTO `history_today` VALUES ('2360', '1958', '9', '4', '中国宣布领海权');
INSERT INTO `history_today` VALUES ('2361', '1901', '9', '5', '美国总统麦金利遇刺');
INSERT INTO `history_today` VALUES ('2362', '1905', '9', '5', '日本比谷骚乱事件发生');
INSERT INTO `history_today` VALUES ('2363', '1905', '9', '5', '在中国土地上进行的日俄战争结束');
INSERT INTO `history_today` VALUES ('2364', '1914', '9', '5', '德英法在马恩河展开大会战');
INSERT INTO `history_today` VALUES ('2365', '1919', '9', '5', '可口可乐公司成立');
INSERT INTO `history_today` VALUES ('2366', '1937', '9', '5', '最大一次纳粹集会在纽伦堡举行');
INSERT INTO `history_today` VALUES ('2367', '1939', '9', '5', '汪伪政权设立特务组织“七十六号”');
INSERT INTO `history_today` VALUES ('2368', '1944', '9', '5', '张思德牺牲　毛泽东发表演讲');
INSERT INTO `history_today` VALUES ('2369', '1945', '9', '5', '中共创办的延安新华广播电台正式开始播音');
INSERT INTO `history_today` VALUES ('2370', '1966', '9', '5', '红卫兵大串连');
INSERT INTO `history_today` VALUES ('2371', '1522', '9', '6', '麦哲伦环球航行结束');
INSERT INTO `history_today` VALUES ('2372', '1860', '9', '6', '原始派画家玛丽·摩西出生');
INSERT INTO `history_today` VALUES ('2373', '1899', '9', '6', '美国海约翰提出对华“门户开放”政策的照会');
INSERT INTO `history_today` VALUES ('2374', '1909', '9', '6', '谁先到达北极之争');
INSERT INTO `history_today` VALUES ('2375', '1937', '9', '6', '陕甘宁边区政府成立');
INSERT INTO `history_today` VALUES ('2376', '1944', '9', '6', '赫尔利到中国调解国共关系');
INSERT INTO `history_today` VALUES ('2377', '1944', '9', '6', '德国V-2型火箭袭击伦敦');
INSERT INTO `history_today` VALUES ('2378', '1945', '9', '6', '毛泽东赠柳亚子《沁园春·雪》');
INSERT INTO `history_today` VALUES ('2379', '1958', '9', '6', '毛泽东要求把工作重点放在工业方面');
INSERT INTO `history_today` VALUES ('2380', '1963', '9', '6', '中苏论战进入“白炽化”');
INSERT INTO `history_today` VALUES ('2381', '1298', '9', '7', '马可·波罗与鲁思梯谦合著《马可·波罗行记》');
INSERT INTO `history_today` VALUES ('2382', '1689', '9', '7', '中俄《尼布楚条约》签订');
INSERT INTO `history_today` VALUES ('2383', '1812', '9', '7', '标志着拿破仑的“伟大的军队”覆灭开始的俄法博罗季诺决战');
INSERT INTO `history_today` VALUES ('2384', '1822', '9', '7', '巴西独立');
INSERT INTO `history_today` VALUES ('2385', '1901', '9', '7', '《辛丑条约》签订');
INSERT INTO `history_today` VALUES ('2386', '1911', '9', '7', '赵尔丰大肆屠杀成都市民');
INSERT INTO `history_today` VALUES ('2387', '1923', '9', '7', '闻一多诗集《红烛》出版');
INSERT INTO `history_today` VALUES ('2388', '1927', '9', '7', '南昌起义军受挫');
INSERT INTO `history_today` VALUES ('2389', '1927', '9', '7', '中共在中南各地领导农民武装暴动');
INSERT INTO `history_today` VALUES ('2390', '1952', '9', '7', '纳吉布掌握埃及大权');
INSERT INTO `history_today` VALUES ('2391', '1380', '9', '8', '俄罗斯莫斯科大公得米特里与宗主国蒙古军会战于涅普利雅德瓦河与顿河汇合处的库利科夫平原，获得胜利。得米特里自此被称为“顿斯科伊”。（意即顿河上的）');
INSERT INTO `history_today` VALUES ('2392', '1565', '9', '8', '西班牙远征军在今佛罗里达圣奥古斯登陆，并建立北美第一个永久的定居地。');
INSERT INTO `history_today` VALUES ('2393', '1860', '9', '8', '清政府派怡亲王载垣兵部尚书穆荫为钦差大臣往通州与英法议和。固礼给在天津的伊格那提耶夫送情报说清军集结通州。');
INSERT INTO `history_today` VALUES ('2394', '1900', '9', '8', '飓风袭击美国得克萨斯州加尔夫斯顿地区，致使6000人死亡，财产损失2000万美元。');
INSERT INTO `history_today` VALUES ('2395', '1904', '9', '8', '收回利权运动兴起');
INSERT INTO `history_today` VALUES ('2396', '1911', '9', '8', '成都邻县民团数万，聚集省城外，秦载赓等率保路同志军包围成都，川省各地人民纷纷举事，成都闭城，电报不通。');
INSERT INTO `history_today` VALUES ('2397', '1926', '9', '8', '德国获准加入国际联盟');
INSERT INTO `history_today` VALUES ('2398', '1934', '9', '8', '莫罗城堡号客轮失火，130人丧生');
INSERT INTO `history_today` VALUES ('2399', '1943', '9', '8', '盟军司令艾森豪威尔和意大利巴多格里奥政府分别广播停战宣言，宣布意大利无条件投降。规定意大利应尽一切努力拒绝给予德国人对抗盟国的便利条件，盟军有权自由使用意大利的飞机场和海军基地。');
INSERT INTO `history_today` VALUES ('2400', '1944', '9', '8', '德国第一次向伦敦发射V—2火箭。此种火箭可携带一吨炸药超音速飞行。（“v”是德文复仇武器一词字首）');
INSERT INTO `history_today` VALUES ('2401', '1338', '9', '9', '京师大地震，至14日方止。');
INSERT INTO `history_today` VALUES ('2402', '1513', '9', '9', '英国人在布兰克斯埃附近打败苏格兰人');
INSERT INTO `history_today` VALUES ('2403', '0', '9', '9', '桓帝与宦官单超谋诛梁冀');
INSERT INTO `history_today` VALUES ('2404', '1603', '9', '9', '赫洛普卡领导的俄国农民起义失败');
INSERT INTO `history_today` VALUES ('2405', '1776', '9', '9', '大陆会议将北美各州的邦联正式命名为美利坚合众国');
INSERT INTO `history_today` VALUES ('2406', '1791', '9', '9', '美国将其新都命名为华盛顿哥伦比亚特区，以纪念其首位总统乔治·华盛顿。');
INSERT INTO `history_today` VALUES ('2407', '1850', '9', '9', '加利福尼亚州加入美国联邦。');
INSERT INTO `history_today` VALUES ('2408', '1853', '9', '9', '上海英领事声明海关税实行“领事代征制”。');
INSERT INTO `history_today` VALUES ('2409', '1870', '9', '9', '第一国际总委员会发表马克思起草的关于普法战争的第二篇普法宣言。');
INSERT INTO `history_today` VALUES ('2410', '1886', '9', '9', '世界著名版权保护公约——伯尔尼公约签署');
INSERT INTO `history_today` VALUES ('2411', '1419', '9', '10', '勃艮第公爵无畏的约翰被刺杀。');
INSERT INTO `history_today` VALUES ('2412', '1561', '9', '10', '第四次川中岛合战');
INSERT INTO `history_today` VALUES ('2413', '1721', '9', '10', '俄罗斯帝国与瑞典王国签订尼斯塔德条约，结束了大北方战争。');
INSERT INTO `history_today` VALUES ('2414', '1813', '9', '10', '佩里率领的美国海军在俄亥俄州爆发的伊利湖战役中击败英国皇家海军。');
INSERT INTO `history_today` VALUES ('2415', '1846', '9', '10', '伊莱亚斯·豪在美国获得缝纫机专利权');
INSERT INTO `history_today` VALUES ('2416', '1898', '9', '10', '奥匈帝国皇后伊莉莎白被意大利无政府主义者刺死');
INSERT INTO `history_today` VALUES ('2417', '1907', '9', '10', '英国政府赋予新西兰以自治领地位');
INSERT INTO `history_today` VALUES ('2418', '1917', '9', '10', '段祺瑞解散国会后，孙中山在广州召开国会非常会议，组织护法军政府，就任大总统，并誓师北伐。1945“上党战役”开始。至10月12日，国民党军队被歼三万五千余人，促成了《双十协定》的签字。');
INSERT INTO `history_today` VALUES ('2419', '1919', '9', '10', '圣日尔曼和约签字。条约规定奥匈帝国解体，奥地利承认匈、波、捷等国的独立，还有奥地利割地、赔款等内容。');
INSERT INTO `history_today` VALUES ('2420', '1922', '9', '10', '胡适提出联省自治主张');
INSERT INTO `history_today` VALUES ('2421', '1913', '9', '11', '国务总理熊希龄组成“名流内阁”');
INSERT INTO `history_today` VALUES ('2422', '1936', '9', '11', '梁启超《饮冰室合集》出版');
INSERT INTO `history_today` VALUES ('2423', '1937', '9', '11', '中日两军鏖战平型关内外');
INSERT INTO `history_today` VALUES ('2424', '1941', '9', '11', '中国国际广播电台开播');
INSERT INTO `history_today` VALUES ('2425', '1943', '9', '11', '汪伪特工头目李士群被军毒死');
INSERT INTO `history_today` VALUES ('2426', '1945', '9', '11', '东条英机自杀未遂');
INSERT INTO `history_today` VALUES ('2427', '1969', '9', '11', '日本恐怖组织“赤军”成立');
INSERT INTO `history_today` VALUES ('2428', '1972', '9', '11', '金庸结束武侠小说创作');
INSERT INTO `history_today` VALUES ('2429', '1977', '9', '11', '华国锋批评国家计委提出的工业增长速度“太保守”');
INSERT INTO `history_today` VALUES ('2430', '1979', '9', '11', '万里顶压力推行');
INSERT INTO `history_today` VALUES ('2431', '1368', '9', '12', '大都更名北平。');
INSERT INTO `history_today` VALUES ('2432', '1801', '9', '12', '俄国沙皇亚历山大一世宣布吞并格鲁吉亚，格鲁吉亚承认俄国的决定，拒绝接受波斯传统的保护。');
INSERT INTO `history_today` VALUES ('2433', '1838', '9', '12', '（清宣宗道光十八年七月二十四日）林则徐上奏道光帝。奏报义律犯我沿海城市及要求重治吸食鸦片者。');
INSERT INTO `history_today` VALUES ('2434', '1891', '9', '12', '《人民日报》发表《关于全国县级直接选举工作的总结报告》');
INSERT INTO `history_today` VALUES ('2435', '1913', '9', '12', '革命军熊克武放弃重庆，“二次革命”失败。');
INSERT INTO `history_today` VALUES ('2436', '1916', '9', '12', '世界上第一架无线电操纵的无人驾驶飞机在美国试飞。');
INSERT INTO `history_today` VALUES ('2437', '1917', '9', '12', '俄国科尔尼洛夫叛乱被粉碎');
INSERT INTO `history_today` VALUES ('2438', '1919', '9', '12', '蔡元培重回北京大学');
INSERT INTO `history_today` VALUES ('2439', '1919', '9', '12', '意大利著名作家、热情的民族主义者和世界大战中的英雄加布里埃勒·邓南遮率领一支志愿军夺取了南斯拉夫和意大利之间有争议的城市──阜姆，宣布建立共和国。');
INSERT INTO `history_today` VALUES ('2440', '1935', '9', '12', '中央政治局会议反对张国焘分裂中央');
INSERT INTO `history_today` VALUES ('2441', '1510', '9', '13', '刘瑾谋反事发');
INSERT INTO `history_today` VALUES ('2442', '1796', '9', '13', '乾隆举行第三次“千叟宴”');
INSERT INTO `history_today` VALUES ('2443', '1871', '9', '13', '《中日通商章程》在天津签订');
INSERT INTO `history_today` VALUES ('2444', '1920', '9', '13', '美国的城市人口超过农村人口');
INSERT INTO `history_today` VALUES ('2445', '1922', '9', '13', '中国共产党第一份机关报出版发行');
INSERT INTO `history_today` VALUES ('2446', '1922', '9', '13', '中共中央机关刊物《向导》创刊');
INSERT INTO `history_today` VALUES ('2447', '1932', '9', '13', '日本向我国东北武装移民');
INSERT INTO `history_today` VALUES ('2448', '1943', '9', '13', '墨索里尼死里逃生');
INSERT INTO `history_today` VALUES ('2449', '1958', '9', '13', '中共中央宣传部召开文艺创作座谈会');
INSERT INTO `history_today` VALUES ('2450', '1959', '9', '13', '第一届在北京举行');
INSERT INTO `history_today` VALUES ('2451', '1368', '9', '14', '明朝军队开至元大都齐仕门外，明军攻城而入，元朝灭亡。');
INSERT INTO `history_today` VALUES ('2452', '1774', '9', '14', '俄国农民起义领袖普加乔夫在遭到决定性的失败，被一批哥萨克领导人出卖后，被俘入狱。次年1月被沙皇政府处死。');
INSERT INTO `history_today` VALUES ('2453', '1783', '9', '14', '乾隆皇帝在热河接见英商使者马甘尼。');
INSERT INTO `history_today` VALUES ('2454', '1812', '9', '14', '俄国军队火烧莫斯科以阻挡拿破仑的入侵。');
INSERT INTO `history_today` VALUES ('2455', '1814', '9', '14', '美国青年律师弗朗西斯·斯科特为搭救朋友被扣留在英军船上。这日黎明，斯科特遥望美军要塞星条旗，一口气写成了《星条旗之歌》，迅即流传开来。1931年3月，国会决议星条旗为正式的美国国旗。');
INSERT INTO `history_today` VALUES ('2456', '1861', '9', '14', '清廷御史董元醇上疏提出“暂请皇太后垂帘听决”，那拉氏要辅政大臣照办，肃顺“令军机处拟旨驳还”。');
INSERT INTO `history_today` VALUES ('2457', '1867', '9', '14', '《资本论》第一卷出版');
INSERT INTO `history_today` VALUES ('2458', '1874', '9', '14', '清政府抗议日本出兵台湾，日本派全权大臣大久保利通在北京与奕沂商议台湾事件。');
INSERT INTO `history_today` VALUES ('2459', '1901', '9', '14', '由于麦金莱总统遇刺身亡，副总统西奥多·罗斯福就任美国第二十六届总统。');
INSERT INTO `history_today` VALUES ('2460', '1914', '9', '14', '德军参谋总长赫尔姆斯·约翰内斯·毛奇将军，因在第一次世界大战初期指挥马恩河战役失败而被解职。');
INSERT INTO `history_today` VALUES ('2461', '1914', '9', '15', '兴登堡再次打败俄国人');
INSERT INTO `history_today` VALUES ('2462', '1915', '9', '15', '陈独秀创办《青年杂志》');
INSERT INTO `history_today` VALUES ('2463', '1915', '9', '15', '《新青年》杂志创刊');
INSERT INTO `history_today` VALUES ('2464', '1916', '9', '15', '坦克在“一战”中大显神威');
INSERT INTO `history_today` VALUES ('2465', '1924', '9', '15', '第二次直奉战争爆发');
INSERT INTO `history_today` VALUES ('2466', '1928', '9', '15', '英国医学家弗莱明发现青霉素。');
INSERT INTO `history_today` VALUES ('2467', '1931', '9', '15', '中共临时中央政治局成立');
INSERT INTO `history_today` VALUES ('2468', '1932', '9', '15', '日本承认“满洲国”');
INSERT INTO `history_today` VALUES ('2469', '1935', '9', '15', '德意志血统和荣誉保护法公布');
INSERT INTO `history_today` VALUES ('2470', '1936', '9', '15', '中共中央提出建立民主共和国');
INSERT INTO `history_today` VALUES ('2471', '1131', '9', '16', '（高宗绍兴元年八月丁亥）任秦桧为尚书右仆射，同中书门下平章事兼知枢密院事。');
INSERT INTO `history_today` VALUES ('2472', '1620', '9', '16', '驶往北美的第一艘英国移民船“五月花号”从英国出发。船上载有贫苦农民、工匠、契约奴和被迫害的清教徒，共一百零二人。在航程中，清教徒商订了《五月花号公约》。此公约奠定了以后在新英格兰诸州定居时组织自治政府的基础。');
INSERT INTO `history_today` VALUES ('2473', '1810', '9', '16', '墨西哥多洛雷斯教区神甫伊达尔哥，发动反对西班牙殖民统治的起义。同年12月在爪达拉哈拉组成政府。次年7月31日，起义失败后，伊达尔哥被处死。他的首级被殖民者示众达十年之久。伊达尔哥被称为“墨西哥独立之父”。');
INSERT INTO `history_today` VALUES ('2474', '1810', '9', '16', '墨西哥宣布独立。');
INSERT INTO `history_today` VALUES ('2475', '1856', '9', '16', '云南杜文秀领导回民起义，攻占大理，自称总统兵马大元帅。');
INSERT INTO `history_today` VALUES ('2476', '1861', '9', '16', '脱离石达开之朱衣点等六十余名将领率部“返妨回京”，洪秀全授该军“扶朝天军”称号。');
INSERT INTO `history_today` VALUES ('2477', '1869', '9', '16', '山东巡抚丁宝桢将慈禧太后宠信的太监安德海正法。');
INSERT INTO `history_today` VALUES ('2478', '1880', '9', '16', '左宗棠创办的兰州机器织呢局开工。这是洋务运动中清政府官办最早的机器毛纺织厂。1884年倒闭。');
INSERT INTO `history_today` VALUES ('2479', '1898', '9', '16', '光绪帝召见袁世凯，赏袁侍郎职，专办练兵事务，随时具奏应办事宜。');
INSERT INTO `history_today` VALUES ('2480', '1908', '9', '16', '美国通用汽车公司成立');
INSERT INTO `history_today` VALUES ('2481', '1871', '9', '17', '第一国际的一次重要会议——伦敦会议');
INSERT INTO `history_today` VALUES ('2482', '1900', '9', '17', '英国议会通过《澳大利亚联邦法》');
INSERT INTO `history_today` VALUES ('2483', '1926', '9', '17', '冯玉祥五原誓师');
INSERT INTO `history_today` VALUES ('2484', '1933', '9', '17', '中共严明党纪反对腐化');
INSERT INTO `history_today` VALUES ('2485', '1942', '9', '17', '中共提出对待知识分子政策');
INSERT INTO `history_today` VALUES ('2486', '1945', '9', '17', '郁达夫被日本宪兵杀害');
INSERT INTO `history_today` VALUES ('2487', '1958', '9', '17', '卡斯特罗游击队向古巴政府发起反攻');
INSERT INTO `history_today` VALUES ('2488', '1959', '9', '17', '彭德怀黄克诚被免职');
INSERT INTO `history_today` VALUES ('2489', '1978', '9', '17', '戴维营协议签署');
INSERT INTO `history_today` VALUES ('2490', '1980', '9', '17', '波兰工人讨论筹建全波独立自治工会');
INSERT INTO `history_today` VALUES ('2491', '1328', '9', '18', '（元文宗天历元年八月甲辰）黎明，百官集兴圣宫，燕铁木儿率阿拉铁木儿、孛伦赤等十七人兵皆露刃发动政变，谋立武宗子周王和世琼。');
INSERT INTO `history_today` VALUES ('2492', '1544', '9', '18', '瑞典国王古斯塔夫一世同法国结盟，对抗丹麦和神圣罗马帝国结盟。');
INSERT INTO `history_today` VALUES ('2493', '1810', '9', '18', '智利国庆');
INSERT INTO `history_today` VALUES ('2494', '1830', '9', '18', '第一台美国人制造的火车头，彼得·库拍的“大拇指汤姆号”在返回巴尔的摩途中与一匹马赛跑失败。');
INSERT INTO `history_today` VALUES ('2495', '1880', '9', '18', '李鸿章于天津设立电报总局，架设天津、上海间电线，次年年底通电。');
INSERT INTO `history_today` VALUES ('2496', '1898', '9', '18', '御史杨崇伊至颐和园上封事于慈禧，请太后“训政”。同时谭嗣同访袁世凯，劝助新政，袁伪装答应，旋即向荣禄告密。');
INSERT INTO `history_today` VALUES ('2497', '1910', '9', '18', '湖北新军革命团体群治学社更名为振武学社，于武昌召开成立会。');
INSERT INTO `history_today` VALUES ('2498', '1915', '9', '18', '孙中山在日本组成的中华革命党发表通告，提露袁世凯帝制自为的罪恶行径，号召人民速起革命。');
INSERT INTO `history_today` VALUES ('2499', '1917', '9', '18', '护法战争开始');
INSERT INTO `history_today` VALUES ('2500', '1922', '9', '18', '匈牙利被接纳加入国际联盟。同日，希腊武装干涉军被逐出安纳托利亚。');
INSERT INTO `history_today` VALUES ('2501', '1356', '9', '19', '英法百年战争期间，英王爱德华三世之子“黑太子”爱德华，与法军激战于普法提埃，并击溃法军，俘虏法王约翰二世。从而导致了巴黎市民起义。');
INSERT INTO `history_today` VALUES ('2502', '1556', '9', '19', '（明世宗嘉靖三十五年八月壬寅）嘉靖皇帝以灵芝草入药，乃诏有司从元岳、龙虎、三茅、齐之及五岳搜集，宛平县民张巨佑献出五本，皇帝赏以银钱。从此，臣民献灵芝者接连而至。');
INSERT INTO `history_today` VALUES ('2503', '1796', '9', '19', '华盛顿不顾公众的强大压力，拒绝连任第三届总统。他在对美国人民的告别辞中，宣布他打算退出政治和公共生活。这就是美国总统两任传统的起源，直至1940年始由富兰克林·罗斯福打破。');
INSERT INTO `history_today` VALUES ('2504', '1870', '9', '19', '普法战争中，德军占领凡尔赛。');
INSERT INTO `history_today` VALUES ('2505', '1894', '9', '19', '洋务派创办的上海华盛纺织总厂开工');
INSERT INTO `history_today` VALUES ('2506', '1909', '9', '19', '江西宜春县数千群众进行反对“新政捐款”斗争。');
INSERT INTO `history_today` VALUES ('2507', '1921', '9', '19', '摩洛哥北部独立，成立里夫共和国');
INSERT INTO `history_today` VALUES ('2508', '1927', '9', '19', '中央政治局会议通过《关于“左派国民党”及苏维埃口号问题决议案》');
INSERT INTO `history_today` VALUES ('2509', '1927', '9', '19', '在湖南浏阳县文家市召开的中共前敌委员会议上，毛泽东提出“引兵井冈”的主张。20日，在毛泽东率领下，秋收起义失败的部队向井冈山进军。开创了“农村包围城市”的革命道路。');
INSERT INTO `history_today` VALUES ('2510', '1937', '9', '19', '日本用非法手段与美国争夺南美市场');
INSERT INTO `history_today` VALUES ('2511', '1013', '9', '20', '（真宗大中祥符六年八月壬申）《君臣事迹》书成，赐名《册府元龟》。');
INSERT INTO `history_today` VALUES ('2512', '1519', '9', '20', '麦哲伦环球航行');
INSERT INTO `history_today` VALUES ('2513', '1519', '9', '20', '葡萄牙航海家麦哲伦在西班牙国王支持下，率五艘帆船，265名水手，从西班牙桑卢卡尔港出发，开始了环球航行，试图寻找一条通往东印度群岛的西行航线。');
INSERT INTO `history_today` VALUES ('2514', '1644', '9', '20', '清顺治帝驾车由盛京出发，迁都北京，沈阳成为陪都。');
INSERT INTO `history_today` VALUES ('2515', '1792', '9', '20', '法国大革命期间，革命军于马恩省瓦尔密村附近大败普、奥干涉军。这一决定性胜利扭转了战局，挽救了法国革命。');
INSERT INTO `history_today` VALUES ('2516', '1838', '9', '20', '湖广总督林则徐奏陈严禁吸食鸦片。');
INSERT INTO `history_today` VALUES ('2517', '1863', '9', '20', '上海英、美租界正式合并，改称“公共租界”。');
INSERT INTO `history_today` VALUES ('2518', '1865', '9', '20', '曾国藩、李鸿章设立江南机器制造总局。');
INSERT INTO `history_today` VALUES ('2519', '1870', '9', '20', '普法战争爆发后，法军撤离罗马，意大利军队占领之，实现统一。');
INSERT INTO `history_today` VALUES ('2520', '1881', '9', '20', '由于加菲尔德总统遭暗杀身亡，副总统切斯特·艾伦·阿瑟就任美国第二十一届总统。');
INSERT INTO `history_today` VALUES ('2521', '1898', '9', '21', '慈禧太后发动戊戌政变');
INSERT INTO `history_today` VALUES ('2522', '1900', '9', '21', '摄影家吴印咸出生');
INSERT INTO `history_today` VALUES ('2523', '1900', '9', '21', '我国飞机设计师冯如第一次试飞成功');
INSERT INTO `history_today` VALUES ('2524', '1920', '9', '21', '民主革命家朱执信遇难');
INSERT INTO `history_today` VALUES ('2525', '1926', '9', '21', '荷兰物理学家昂内斯首次发现物理超导性');
INSERT INTO `history_today` VALUES ('2526', '1931', '9', '21', '南京政府向国联控告日本');
INSERT INTO `history_today` VALUES ('2527', '1945', '9', '21', '英国同意印度独立');
INSERT INTO `history_today` VALUES ('2528', '1949', '9', '21', '毛泽东发表《中国人民站起来了》的著名讲话');
INSERT INTO `history_today` VALUES ('2529', '1949', '9', '21', '中国人民政治协商会议第一届全体会议召开');
INSERT INTO `history_today` VALUES ('2530', '1962', '9', '21', '伊戈尔·斯特拉文斯基回到苏联');
INSERT INTO `history_today` VALUES ('2531', '1422', '9', '22', '瑞士独立日');
INSERT INTO `history_today` VALUES ('2532', '1499', '9', '22', '瑞士独立。');
INSERT INTO `history_today` VALUES ('2533', '1550', '9', '22', '神圣罗马帝国舰队在突尼斯的迈赫迪亚俘获土耳其“阿非利加塔”号舰。');
INSERT INTO `history_today` VALUES ('2534', '1630', '9', '22', '明朝抗清将领袁崇焕被崇祯皇帝凌迟处死于北京。');
INSERT INTO `history_today` VALUES ('2535', '1776', '9', '22', '美国间谍黑尔未经审判即被处绞刑。他最后的遗言是：“我唯一感到遗憾的是我只能为我的国家献出一次生命。”');
INSERT INTO `history_today` VALUES ('2536', '1792', '9', '22', '法兰西第一共和国颁布的共和历将历元定于今日。');
INSERT INTO `history_today` VALUES ('2537', '1860', '9', '22', '英法联军迈进北京，咸丰皇帝从圆明园出逃往热河。');
INSERT INTO `history_today` VALUES ('2538', '1862', '9', '22', '美国总统林肯发表《解放黑人奴隶宣言》。');
INSERT INTO `history_today` VALUES ('2539', '1862', '9', '22', '太平军大败“常胜军”于浙江慈溪，毙“常胜军”领队华尔。');
INSERT INTO `history_today` VALUES ('2540', '1869', '9', '22', '德国作曲家瓦格纳创作的歌剧《尼伯龙根的指环》的第一部分《莱茵的黄金》在慕尼黑首演。');
INSERT INTO `history_today` VALUES ('2541', '1459', '9', '23', '英国玫瑰战争：布洛希思战役。英格兰约克家族的军队在布洛希思之役中战胜前来阻击的兰开斯特家族的军队。');
INSERT INTO `history_today` VALUES ('2542', '1529', '9', '23', '苏莱曼一世亲率奥斯曼帝国军队围攻维也纳。');
INSERT INTO `history_today` VALUES ('2543', '1809', '9', '23', '自来水笔获准生产');
INSERT INTO `history_today` VALUES ('2544', '1831', '9', '23', '法拉第发明发电机。');
INSERT INTO `history_today` VALUES ('2545', '1846', '9', '23', '德国天文学家伽勒第一次观察到海王星');
INSERT INTO `history_today` VALUES ('2546', '1861', '9', '23', '浙江平阳人赵起发动金钱会起义');
INSERT INTO `history_today` VALUES ('2547', '1862', '9', '23', '俾斯麦出任普鲁士首相，德国开始统一。');
INSERT INTO `history_today` VALUES ('2548', '1889', '9', '23', '日本任天堂公司在京都由山内房治郎创立。');
INSERT INTO `history_today` VALUES ('2549', '1900', '9', '23', '第二国际巴黎代表大会召开');
INSERT INTO `history_today` VALUES ('2550', '1905', '9', '23', '广西桂林府中学堂开办，即今天的桂林中学。');
INSERT INTO `history_today` VALUES ('2551', '1529', '9', '24', '鄂图曼帝国军队包围维也纳。');
INSERT INTO `history_today` VALUES ('2552', '1550', '9', '24', '（嘉靖二十九年八月乙亥）明世宗时，俺答汗率鞑靼军入古北口，直逼北京城下。当时严嵩执政，不准诸将出击，以待鞑靼军掳掠后自行撤退。史称“庚戌之变”。');
INSERT INTO `history_today` VALUES ('2553', '1568', '9', '24', '西班牙舰队在波多黎各的圣胡安俘获了约翰·霍金斯率领的英国舰队的船只。');
INSERT INTO `history_today` VALUES ('2554', '1841', '9', '24', '文莱苏丹将沙捞越割让给英国探险家布鲁克，布鲁克成为沙捞越的白人拉者。');
INSERT INTO `history_today` VALUES ('2555', '1852', '9', '24', '法国人吉法尔制造的用蒸汽机推进的飞船试飞成功。');
INSERT INTO `history_today` VALUES ('2556', '1853', '9', '24', '法国吞并新喀里多尼亚。');
INSERT INTO `history_today` VALUES ('2557', '1886', '9', '24', '哈同和罗迦陵结婚。');
INSERT INTO `history_today` VALUES ('2558', '189', '9', '24', '（汉灵帝中平六年八月庚午）张让等劫持少帝与陈留王出走，尚书卢植等追及，张让投河而死。');
INSERT INTO `history_today` VALUES ('2559', '1901', '9', '24', '清政府与日本签定重庆日租界协议书，30年为期。');
INSERT INTO `history_today` VALUES ('2560', '1903', '9', '24', '阿尔弗雷德·迪金接替埃德蒙·巴顿成为澳大利亚第二任总理。');
INSERT INTO `history_today` VALUES ('2561', '1066', '9', '25', '英格兰国王哈罗德二世在约克的史丹福德桥之战中击败挪威军队，挪威国王哈拉尔德三世阵亡，结束了维京人对英格兰的统治');
INSERT INTO `history_today` VALUES ('2562', '1396', '9', '25', '奥斯曼帝国苏丹巴耶塞特一世率领军队在尼科堡战役中击败匈牙利、法国等国组成的基督教联军。');
INSERT INTO `history_today` VALUES ('2563', '1513', '9', '25', '继西班牙达塞德·雷盎发现弗罗里达半岛后，西班牙人瓦斯科·努涅斯·巴尔波于今天穿过巴拿马地峡，发现太平洋。');
INSERT INTO `history_today` VALUES ('2564', '1555', '9', '25', '神圣罗马帝国皇帝查理五世与德意志新教诸侯签订奥格斯堡和约');
INSERT INTO `history_today` VALUES ('2565', '1660', '9', '25', '清朝顺治帝的董鄂妃被追封为端敬皇后。');
INSERT INTO `history_today` VALUES ('2566', '1789', '9', '25', '12条美国宪法修正案被提出，其中后十条得到美国国会通过，史称美国权利法案，第二条后于1992年被通过，成为美国宪法第27修正案。');
INSERT INTO `history_today` VALUES ('2567', '1851', '9', '25', '太平军攻占永安州。');
INSERT INTO `history_today` VALUES ('2568', '1883', '9', '25', '俄国劳动解放社成立');
INSERT INTO `history_today` VALUES ('2569', '1904', '9', '25', '成都兵工厂职工近600人抗议工头克扣工资举行罢工十数日。');
INSERT INTO `history_today` VALUES ('2570', '1911', '9', '25', '近代革命家、同盟会会员吴永珊（玉章）、王天杰等率保路同志军，在四川荣县起义，建立革命政权。');
INSERT INTO `history_today` VALUES ('2571', '1368', '9', '26', '（明洪武元年八月壬午）朱元璋到达北京（今开封），改大都路为北平府。');
INSERT INTO `history_today` VALUES ('2572', '1371', '9', '26', '马其顿的塞尔维亚诸亲王联盟军在马里查河畔的彻诺门（奇尔门）被土耳其人打败。保中利亚、马其顿的统治者以及拜占庭皇帝被迫承认了奥托曼土耳其苏丹的宗主权。');
INSERT INTO `history_today` VALUES ('2573', '1580', '9', '26', '英国航海家法兰西斯·德雷克，带领56名幸存者乘“金鹿”号回到英国普利茅斯港，完成了震惊欧洲的又一次环球航行。');
INSERT INTO `history_today` VALUES ('2574', '1679', '9', '26', '丹麦和瑞典签订隆德条约，条约规定丹麦人交出征服的全部土地。');
INSERT INTO `history_today` VALUES ('2575', '1687', '9', '26', '雅典的帕台农神庙在墨索里尼领导的威尼斯共和国部队的轰炸中被部分摧毁。');
INSERT INTO `history_today` VALUES ('2576', '1789', '9', '26', '托马斯·杰弗逊被任命为美国第一任国务卿，John Jay被任命为美国第一任最高法院首席大法官，Samuel Osgood被任命为美国第一任邮电部长，Edmund Randolph被任命为美国第一任首席检察官。');
INSERT INTO `history_today` VALUES ('2577', '1815', '9', '26', '俄、普、奥三国在巴黎发表缔结“神圣同盟”');
INSERT INTO `history_today` VALUES ('2578', '1848', '9', '26', '德国政府下令逮捕恩格斯。');
INSERT INTO `history_today` VALUES ('2579', '1907', '9', '26', '新西兰从英国独立，获得主权。');
INSERT INTO `history_today` VALUES ('2580', '1941', '9', '26', '中共对党费问题作出明确规定');
INSERT INTO `history_today` VALUES ('2581', '1540', '9', '27', '“耶稣会”作为一个僧团，正式为教皇批准。');
INSERT INTO `history_today` VALUES ('2582', '1601', '9', '27', '三千名西班牙军队在爱尔兰的基尼尔登陆，支持叛乱的蒂尤伯爵；由吉安·安德烈亚·多里亚率领的西班牙和意大利联合征讨阿尔及利亚的行动失败。');
INSERT INTO `history_today` VALUES ('2583', '1787', '9', '27', '美国宪法送交各州表决认可。');
INSERT INTO `history_today` VALUES ('2584', '1821', '9', '27', '墨西哥从西班牙治下获得独立。');
INSERT INTO `history_today` VALUES ('2585', '1822', '9', '27', '让·弗朗索瓦·商博良宣布解密罗塞塔石。');
INSERT INTO `history_today` VALUES ('2586', '1825', '9', '27', '第一条蒸汽火车线路在英国开始运营。英国工人出身的总工程师司蒂芬逊亲自驾驶着自己设计的蒸汽机车，牵引着满载第一批乘客的列车，在英国斯托克顿和达林顿间40公里的铁路上行驶，成为世界交通史上划时代的大事，蒸汽机车成了工业革命的标志。');
INSERT INTO `history_today` VALUES ('2587', '1854', '9', '27', '“北冰洋”号客轮在大西洋沉没，三百名旅客丧生。');
INSERT INTO `history_today` VALUES ('2588', '1858', '9', '27', '天地会起义，建立大成国');
INSERT INTO `history_today` VALUES ('2589', '1862', '9', '27', '美国内战期间，第一支由自由黑人组成的联邦团队“非洲骑兵团”在新奥尔良成立。');
INSERT INTO `history_today` VALUES ('2590', '1905', '9', '27', '阿尔伯特·爱因斯坦在德文物理学年鉴（Annalen der Physik）上发表论文“动体的惯性取决于其能量吗？”，揭示了能量与质量的关系。');
INSERT INTO `history_today` VALUES ('2591', '1066', '9', '28', '征服者威廉登陆英格兰。');
INSERT INTO `history_today` VALUES ('2592', '1392', '9', '28', '李成桂改国号为朝鲜。');
INSERT INTO `history_today` VALUES ('2593', '1448', '9', '28', '克里斯蒂安一世成为丹麦国王，丹麦开始了奥尔登堡王朝的统治。');
INSERT INTO `history_today` VALUES ('2594', '1864', '9', '28', '第一国际成立');
INSERT INTO `history_today` VALUES ('2595', '1867', '9', '28', '多伦多成为加拿大首都。');
INSERT INTO `history_today` VALUES ('2596', '1868', '9', '28', '上海江南制造总局第一号火轮船竣工');
INSERT INTO `history_today` VALUES ('2597', '1871', '9', '28', '巴西通过法律，禁止儿童奴隶。');
INSERT INTO `history_today` VALUES ('2598', '189', '9', '28', '董卓废少帝，立陈留王刘协为帝。');
INSERT INTO `history_today` VALUES ('2599', '1893', '9', '28', '波尔图足球俱乐部成立。');
INSERT INTO `history_today` VALUES ('2600', '1906', '9', '28', '清政府决定对八旗进行整顿。');
INSERT INTO `history_today` VALUES ('2601', '1066', '9', '29', '诺曼底公爵威廉登陆英格兰');
INSERT INTO `history_today` VALUES ('2602', '1901', '9', '29', '意大利科学家费米诞生');
INSERT INTO `history_today` VALUES ('2603', '1913', '9', '29', '中国最早的故事片上映');
INSERT INTO `history_today` VALUES ('2604', '1915', '9', '29', '中文打字机获发明专利');
INSERT INTO `history_today` VALUES ('2605', '1927', '9', '29', '“三湾改编”确定了中国共产党对军队的绝对领导');
INSERT INTO `history_today` VALUES ('2606', '1941', '9', '29', '苏美英三国领导人举行莫斯科会议');
INSERT INTO `history_today` VALUES ('2607', '1951', '9', '29', '中央决定开展知识分子思想改造运动');
INSERT INTO `history_today` VALUES ('2608', '1954', '9', '29', '赫鲁晓夫访华');
INSERT INTO `history_today` VALUES ('2609', '1957', '9', '29', '新中国建成第一座天文馆');
INSERT INTO `history_today` VALUES ('2610', '1958', '9', '29', '全国钢铁产量大放“卫星”');
INSERT INTO `history_today` VALUES ('2611', '1862', '9', '30', '德国首任宰相俾斯麦实行“铁血政策”');
INSERT INTO `history_today` VALUES ('2612', '1887', '9', '30', '黄河决口');
INSERT INTO `history_today` VALUES ('2613', '1911', '9', '30', '意大利与土耳其争夺的黎波里');
INSERT INTO `history_today` VALUES ('2614', '1926', '9', '30', '丰子恺漫画结集面世');
INSERT INTO `history_today` VALUES ('2615', '1931', '9', '30', '国际联盟决议日本撤兵');
INSERT INTO `history_today` VALUES ('2616', '1938', '9', '30', '出卖捷克的慕尼黑协定签署');
INSERT INTO `history_today` VALUES ('2617', '1938', '9', '30', '《慕尼黑协定》图片集');
INSERT INTO `history_today` VALUES ('2618', '1940', '9', '30', '德国狂轰英国伦敦');
INSERT INTO `history_today` VALUES ('2619', '1941', '9', '30', '莫斯科会战图片集(一)');
INSERT INTO `history_today` VALUES ('2620', '1941', '9', '30', '莫斯科保卫战开始');
INSERT INTO `history_today` VALUES ('2621', '1890', '10', '1', '美国国会正式设立约塞米蒂国家公园。');
INSERT INTO `history_today` VALUES ('2622', '1925', '10', '1', '国民革命军举行第二次东征');
INSERT INTO `history_today` VALUES ('2623', '1927', '10', '1', '苏联开始实施第一个五年计划');
INSERT INTO `history_today` VALUES ('2624', '1931', '10', '1', '日本人在东北拼凑伪政权');
INSERT INTO `history_today` VALUES ('2625', '1931', '10', '1', '我国收回英租界威海卫');
INSERT INTO `history_today` VALUES ('2626', '1938', '10', '1', '大型纪录片《延安与八路军》开拍');
INSERT INTO `history_today` VALUES ('2627', '1940', '10', '1', '八路军暂停“百团大战”');
INSERT INTO `history_today` VALUES ('2628', '1945', '10', '1', '陈公博被押解离日返国');
INSERT INTO `history_today` VALUES ('2629', '1946', '10', '1', '中共中央发出《3个月总结》的指示');
INSERT INTO `history_today` VALUES ('2630', '1949', '10', '1', '中华人民共和国第一次国庆阅兵');
INSERT INTO `history_today` VALUES ('2631', '1895', '10', '2', '天津中西学堂（天津大学前身）开学');
INSERT INTO `history_today` VALUES ('2632', '1901', '10', '2', '郑士良等发起惠州起义。');
INSERT INTO `history_today` VALUES ('2633', '1909', '10', '2', '京张铁路正式通车');
INSERT INTO `history_today` VALUES ('2634', '1920', '10', '2', '日本出兵占领吉林珲春。');
INSERT INTO `history_today` VALUES ('2635', '1925', '10', '2', '英国发明家贝尔德发明电视');
INSERT INTO `history_today` VALUES ('2636', '1926', '10', '2', '冯玉祥大军南下西安。');
INSERT INTO `history_today` VALUES ('2637', '1931', '10', '2', '全国民众反日游行示威。');
INSERT INTO `history_today` VALUES ('2638', '1932', '10', '2', '“九·一八”事变调查报告书发表。');
INSERT INTO `history_today` VALUES ('2639', '1941', '10', '2', '莫斯科保卫战');
INSERT INTO `history_today` VALUES ('2640', '1949', '10', '2', '广东战役开始');
INSERT INTO `history_today` VALUES ('2641', '1877', '10', '3', '李鸿章筹办开平矿务局。');
INSERT INTO `history_today` VALUES ('2642', '1912', '10', '3', '《民国服制》公布');
INSERT INTO `history_today` VALUES ('2643', '1928', '10', '3', '国民政府宣告进入训政时期');
INSERT INTO `history_today` VALUES ('2644', '1935', '10', '3', '意大利法西斯发动侵略埃塞俄比亚的战争');
INSERT INTO `history_today` VALUES ('2645', '1945', '10', '3', '世界工会联合会成立');
INSERT INTO `history_today` VALUES ('2646', '1949', '10', '3', '我国与俄罗斯建交');
INSERT INTO `history_today` VALUES ('2647', '1949', '10', '3', '中苏建立大使级外交关系');
INSERT INTO `history_today` VALUES ('2648', '1950', '10', '3', '中国人民大学正式成立');
INSERT INTO `history_today` VALUES ('2649', '1972', '10', '3', '美苏签署限制武器条约。');
INSERT INTO `history_today` VALUES ('2650', '1973', '10', '3', '中共中央成立专案组审查林彪、陈伯达反党集团');
INSERT INTO `history_today` VALUES ('2651', '1539', '10', '4', '英格兰国王亨利八世为同克莱夫斯的安妮结婚而签署婚姻条约。');
INSERT INTO `history_today` VALUES ('2652', '1845', '10', '4', '福州人民痛击为非作歹的英领事馆翻译官巴厦礼。');
INSERT INTO `history_today` VALUES ('2653', '1861', '10', '4', '清廷上东西两太后徽号为慈安皇太后、慈禧皇太后。');
INSERT INTO `history_today` VALUES ('2654', '1865', '10', '4', '拿破仑三世同俾斯麦在比里亚茨会晤时，同意普鲁士在德意志拥有至高无上的权力和成立一个统一的意大利。');
INSERT INTO `history_today` VALUES ('2655', '1910', '10', '4', '葡萄牙1910年革命爆发。');
INSERT INTO `history_today` VALUES ('2656', '1911', '10', '4', '广（州）九（龙）铁路（九广铁路）竣工通车。');
INSERT INTO `history_today` VALUES ('2657', '1913', '10', '4', '宪法会议通过大总统选举法。');
INSERT INTO `history_today` VALUES ('2658', '1920', '10', '4', '北京第一个共产主义小组成立，李大钊为负责人。');
INSERT INTO `history_today` VALUES ('2659', '1924', '10', '4', '广东省一百八十八县镇商团代表集合于佛山，策划叛乱。');
INSERT INTO `history_today` VALUES ('2660', '1939', '10', '4', '毛泽东为《共产党人》撰写发刊词。');
INSERT INTO `history_today` VALUES ('2661', '1582', '10', '5', '罗马教皇格利高利十三世（也做格里高利十三世）制定现今通用的公历。');
INSERT INTO `history_today` VALUES ('2662', '1793', '10', '5', '法国大革命期间废除了基督教。');
INSERT INTO `history_today` VALUES ('2663', '1813', '10', '5', '天理教教主李文成等起义。');
INSERT INTO `history_today` VALUES ('2664', '1910', '10', '5', '墨西哥革命爆发。');
INSERT INTO `history_today` VALUES ('2665', '1934', '10', '5', '红军与广东军阀陈济棠达成秘密协议，向陈济棠部“借道长征”，为红军突围转移创造有利条件。');
INSERT INTO `history_today` VALUES ('2666', '1938', '10', '5', '希特勒的军队接收苏台德地区。');
INSERT INTO `history_today` VALUES ('2667', '1940', '10', '5', '新四军黄桥战役取得胜利');
INSERT INTO `history_today` VALUES ('2668', '1949', '10', '5', '中国与罗马尼亚建交。罗马尼亚位于欧洲巴尔干半岛北部，首都布加勒斯特。');
INSERT INTO `history_today` VALUES ('2669', '1954', '10', '5', '中国与挪威王国建交。挪威位于北欧斯堪的纳维亚半岛西北部，首都奥斯陆。');
INSERT INTO `history_today` VALUES ('2670', '1954', '10', '5', '国务院高等教育部发出关于重点高等学校和专家工作范围的决定。确定中国人民大学、北京大学、清华大学、哈尔滨工业大学、北京农业大学、北京医学院6校为全国性的重点学校。这是新中国确定的第一批全国性重点高校。');
INSERT INTO `history_today` VALUES ('2671', '1142', '10', '6', '秦桧任宋朝太师、魏公。');
INSERT INTO `history_today` VALUES ('2672', '1470', '10', '6', '英国玫瑰战争期间，国王亨利六世在被囚禁于伦敦塔多年之后，获释出狱。');
INSERT INTO `history_today` VALUES ('2673', '1683', '10', '6', '第一位去美洲的德国定居者列达宾夕法尼亚州的费城。');
INSERT INTO `history_today` VALUES ('2674', '1860', '10', '6', '英法联军掠夺圆明园。');
INSERT INTO `history_today` VALUES ('2675', '1866', '10', '6', '清政府批准筹设天津机器局。');
INSERT INTO `history_today` VALUES ('2676', '1905', '10', '6', '瑞士设立中央银行。');
INSERT INTO `history_today` VALUES ('2677', '1908', '10', '6', '克里特岛宣布脱离土耳其帝国，并入希腊。');
INSERT INTO `history_today` VALUES ('2678', '1913', '10', '6', '袁世凯就任正式大总统。');
INSERT INTO `history_today` VALUES ('2679', '1927', '10', '6', '阿尔·乔尔森主演第一部有声电影。');
INSERT INTO `history_today` VALUES ('2680', '1940', '10', '6', '新四军获黄桥决战胜利。');
INSERT INTO `history_today` VALUES ('2681', '1132', '10', '7', '（宋高宗绍兴二年八月甲寅）秦桧罢相。');
INSERT INTO `history_today` VALUES ('2682', '1571', '10', '7', '希腊基努教神圣同盟船队在雷庞湾展开海战。');
INSERT INTO `history_today` VALUES ('2683', '1737', '10', '7', '台风袭击印度加尔各答地方时，曾出现12米高的水头，造成30万人死亡。');
INSERT INTO `history_today` VALUES ('2684', '1864', '10', '7', '沙俄强迫清政府签订了《中俄勘分西北界约记》。致此，沙俄共割占了中国西部巴尔喀什湖以东、以南和斋桑淖尔南北四十四万多平方公里的领土。');
INSERT INTO `history_today` VALUES ('2685', '1888', '10', '7', '清政府批准《北洋海军章程》，北洋海军正式建立。');
INSERT INTO `history_today` VALUES ('2686', '1910', '10', '7', '全国掀起国会请愿高潮。');
INSERT INTO `history_today` VALUES ('2687', '1913', '10', '7', '亨利·福特建立了第一条装配线。');
INSERT INTO `history_today` VALUES ('2688', '1913', '10', '7', '国会选举黎元洪为副总统。');
INSERT INTO `history_today` VALUES ('2689', '1917', '10', '7', '孙中山通电否认北京冯国璋、段祺瑞政府，并令各军北伐');
INSERT INTO `history_today` VALUES ('2690', '1927', '10', '7', '毛泽东率领秋收起义军抵达江西宁岗茅坪。27日进驻茨坪，开创井冈山革命根据地。');
INSERT INTO `history_today` VALUES ('2691', '1480', '10', '8', '金帐汗国阿黑麻汗率军与莫斯科大公伊凡三世对峙于乌格拉河，后不战而退，此役宣告莫斯科完全摆脱金帐汗国控制。');
INSERT INTO `history_today` VALUES ('2692', '1813', '10', '8', '天理教徒林清在北京举事，率众攻入皇宫。');
INSERT INTO `history_today` VALUES ('2693', '1843', '10', '8', '清政府与英国签订《虎门条约》。');
INSERT INTO `history_today` VALUES ('2694', '1856', '10', '8', '英国制造“亚罗号事件”');
INSERT INTO `history_today` VALUES ('2695', '1871', '10', '8', '美国伊利诺伊州发生芝加哥大火，威斯康星州发生火龙卷。');
INSERT INTO `history_today` VALUES ('2696', '1895', '10', '8', '朝鲜国闵妃(后追封大韩帝国明成皇后)李氏被日本浪人虐杀致死，史称“乙未之变”。');
INSERT INTO `history_today` VALUES ('2697', '1906', '10', '8', '卷发革命从英国发起。');
INSERT INTO `history_today` VALUES ('2698', '1910', '10', '8', '上海银号钱庄纷纷倒闭。');
INSERT INTO `history_today` VALUES ('2699', '1928', '10', '8', '蒋介石与胡汉民再度合作执政。');
INSERT INTO `history_today` VALUES ('2700', '1938', '10', '8', '台湾爆发反对日本侵占的反战运动，日军大肆镇压屠杀民众200余人。');
INSERT INTO `history_today` VALUES ('2701', '1701', '10', '9', '康涅狄格高等学校（耶鲁大学前名）建校。');
INSERT INTO `history_today` VALUES ('2702', '1769', '10', '9', '詹姆斯·库克船长在杨格尼克角首次登陆新西兰。');
INSERT INTO `history_today` VALUES ('2703', '1774', '10', '9', '山东王伦以清水教（白莲教支派）发动起义。');
INSERT INTO `history_today` VALUES ('2704', '1807', '10', '9', '普鲁士首相斯坦因颁布了关于解放农奴人生依附关系停止徭役的法令。史称“十月赦令”。');
INSERT INTO `history_today` VALUES ('2705', '1874', '10', '9', '《伯尔尼条约》签署，万国邮政联盟在瑞士伯尔尼成立，旨在促进全世界建立一套简单方便的国际邮件交换系统，以保证邮件不受国界等限制而自由流通。');
INSERT INTO `history_today` VALUES ('2706', '1912', '10', '9', '第一次巴尔干战争爆发。');
INSERT INTO `history_today` VALUES ('2707', '1936', '10', '9', '红军总部、红四方面军与红一方面军会师。');
INSERT INTO `history_today` VALUES ('2708', '1941', '10', '9', '中日第二次长沙会战结束。');
INSERT INTO `history_today` VALUES ('2709', '1944', '10', '9', '四大国建议建立联合国。');
INSERT INTO `history_today` VALUES ('2710', '1948', '10', '9', '英国前首相丘吉尔提出三环外交。');
INSERT INTO `history_today` VALUES ('2711', '1868', '10', '10', '古巴爆发第一次独立战争');
INSERT INTO `history_today` VALUES ('2712', '1911', '10', '10', '武昌起义——辛亥革命爆发');
INSERT INTO `history_today` VALUES ('2713', '1913', '10', '10', '袁世凯于太和殿举行总统就职典礼。企图实行北洋军阀的专制独裁统治。');
INSERT INTO `history_today` VALUES ('2714', '1913', '10', '10', '巴拿马运河开通');
INSERT INTO `history_today` VALUES ('2715', '1919', '10', '10', '中华革命党更名为国民党。');
INSERT INTO `history_today` VALUES ('2716', '1923', '10', '10', '曹锟就任巨额买来的大总统。');
INSERT INTO `history_today` VALUES ('2717', '1925', '10', '10', '故宫首次对外开放。');
INSERT INTO `history_today` VALUES ('2718', '1926', '10', '10', '中国历史博物馆开馆。');
INSERT INTO `history_today` VALUES ('2719', '1926', '10', '10', '北伐军攻克武昌');
INSERT INTO `history_today` VALUES ('2720', '1932', '10', '10', '中央分局决定红四方面军向西转移');
INSERT INTO `history_today` VALUES ('2721', '1900', '10', '11', '李鸿章开始与八国联军的艰难谈判。');
INSERT INTO `history_today` VALUES ('2722', '1917', '10', '11', '本世纪最重要的女谍被枪决。');
INSERT INTO `history_today` VALUES ('2723', '1919', '10', '11', '邓尼金白卫军进攻遭失败。');
INSERT INTO `history_today` VALUES ('2724', '1932', '10', '11', '毛泽东被苏区中央局撤职');
INSERT INTO `history_today` VALUES ('2725', '1937', '10', '11', '淞沪战线中日军队展开大场之战。');
INSERT INTO `history_today` VALUES ('2726', '1937', '10', '11', '中忻口大战');
INSERT INTO `history_today` VALUES ('2727', '1944', '10', '11', '日军包围桂林，直逼柳州。');
INSERT INTO `history_today` VALUES ('2728', '1946', '10', '11', '国民党一党包办召开“国民大会”');
INSERT INTO `history_today` VALUES ('2729', '1957', '10', '11', '世界最大的望远镜在英国建成。');
INSERT INTO `history_today` VALUES ('2730', '1964', '10', '11', '赫鲁晓夫下台。');
INSERT INTO `history_today` VALUES ('2731', '1492', '10', '12', '哥伦布发现美洲大陆。');
INSERT INTO `history_today` VALUES ('2732', '1885', '10', '12', '清政府改台湾府为行省，命刘铭传为台湾巡抚。');
INSERT INTO `history_today` VALUES ('2733', '1929', '10', '12', '苏军向张学良军队发动猛烈进攻。');
INSERT INTO `history_today` VALUES ('2734', '1937', '10', '12', '新四军正式组建');
INSERT INTO `history_today` VALUES ('2735', '1940', '10', '12', '日本军国组织大政翼赞会成立。');
INSERT INTO `history_today` VALUES ('2736', '1940', '10', '12', '上海首任汉奸市长傅筱庵被军统刺杀。');
INSERT INTO `history_today` VALUES ('2737', '1945', '10', '12', '刘邓取得上党大捷。');
INSERT INTO `history_today` VALUES ('2738', '1951', '10', '12', '《毛泽东选集》第一卷出版发行');
INSERT INTO `history_today` VALUES ('2739', '1954', '10', '12', '中苏签订一揽子经济技术合作项目');
INSERT INTO `history_today` VALUES ('2740', '1960', '10', '12', '日中友好人士浅沼稻次郎遇刺身亡');
INSERT INTO `history_today` VALUES ('2741', '1884', '10', '13', '格林尼治时间正式被采用为国际标准时间。');
INSERT INTO `history_today` VALUES ('2742', '1921', '10', '13', '粤汉铁路工人大罢工');
INSERT INTO `history_today` VALUES ('2743', '1927', '10', '13', '鲁丝·埃尔德飞渡大西洋失败');
INSERT INTO `history_today` VALUES ('2744', '1928', '10', '13', '安阳殷墟开始发掘');
INSERT INTO `history_today` VALUES ('2745', '1929', '10', '13', '红四军出击东江损失重大');
INSERT INTO `history_today` VALUES ('2746', '1937', '10', '13', '新四军建军');
INSERT INTO `history_today` VALUES ('2747', '1949', '10', '13', '中国少年儿童队（中国少年先锋队前身）成立');
INSERT INTO `history_today` VALUES ('2748', '1962', '10', '13', '巴拿马运河大桥建成');
INSERT INTO `history_today` VALUES ('2749', '1968', '10', '13', '中共八届十二中全会在北京举行');
INSERT INTO `history_today` VALUES ('2750', '1970', '10', '13', '中国与加拿大建立外交关系');
INSERT INTO `history_today` VALUES ('2751', '1902', '10', '14', '京师大学堂正式招生');
INSERT INTO `history_today` VALUES ('2752', '1911', '10', '14', '清朝政府启用袁世凯，任命其为湖广总督');
INSERT INTO `history_today` VALUES ('2753', '1911', '10', '14', '清廷启用袁世凯');
INSERT INTO `history_today` VALUES ('2754', '1918', '10', '14', '我国第一个新闻研究机构——北京大学新闻学研究会成立');
INSERT INTO `history_today` VALUES ('2755', '1920', '10', '14', '唐山煤矿瓦斯大爆炸');
INSERT INTO `history_today` VALUES ('2756', '1925', '10', '14', '广东革命政府东征军攻下惠州');
INSERT INTO `history_today` VALUES ('2757', '1933', '10', '14', '希特勒退出国际联盟');
INSERT INTO `history_today` VALUES ('2758', '1939', '10', '14', '英国军舰“皇家橡树”号被击沉');
INSERT INTO `history_today` VALUES ('2759', '1949', '10', '14', '中国人民解放军解放广州');
INSERT INTO `history_today` VALUES ('2760', '1951', '10', '14', '中美洲国家组织成立');
INSERT INTO `history_today` VALUES ('2761', '1917', '10', '15', '北京大学开始实行选科制。');
INSERT INTO `history_today` VALUES ('2762', '1924', '10', '15', '广州商团叛乱被扑灭。');
INSERT INTO `history_today` VALUES ('2763', '1925', '10', '15', '浙奉大战爆发');
INSERT INTO `history_today` VALUES ('2764', '1925', '10', '15', '陈赓救蒋介石一命');
INSERT INTO `history_today` VALUES ('2765', '1929', '10', '15', '陈独秀取消主义的破产');
INSERT INTO `history_today` VALUES ('2766', '1932', '10', '15', '前中共总书记陈独秀被捕');
INSERT INTO `history_today` VALUES ('2767', '1944', '10', '15', '中国军队歼灭缅甸八莫、卡的克日军。');
INSERT INTO `history_today` VALUES ('2768', '1945', '10', '15', '纳粹德国空军部长戈林自杀');
INSERT INTO `history_today` VALUES ('2769', '1947', '10', '15', '世界第一次超音速飞机——喷气式飞机试飞。');
INSERT INTO `history_today` VALUES ('2770', '1948', '10', '15', '解放军攻克锦州。');
INSERT INTO `history_today` VALUES ('2771', '1922', '10', '16', '开滦煤矿工人罢工失败');
INSERT INTO `history_today` VALUES ('2772', '1933', '10', '16', '抗日同盟军失败');
INSERT INTO `history_today` VALUES ('2773', '1937', '10', '16', '刘少奇：《抗日游击战争中的若干基本问题》');
INSERT INTO `history_today` VALUES ('2774', '1949', '10', '16', '我国与蒙古国建交');
INSERT INTO `history_today` VALUES ('2775', '1950', '10', '16', '人民解放军进军西藏');
INSERT INTO `history_today` VALUES ('2776', '1953', '10', '16', '中共中央通过《关于实于粮食的计划收购与计划供应的决议》');
INSERT INTO `history_today` VALUES ('2777', '1954', '10', '16', '毛泽东发表《关于红楼梦研究问题的信》');
INSERT INTO `history_today` VALUES ('2778', '1964', '10', '16', '我国第一颗原子弹爆炸成功');
INSERT INTO `history_today` VALUES ('2779', '1964', '10', '16', '勃列日涅夫取代赫鲁晓夫  成为苏共中央第一书记');
INSERT INTO `history_today` VALUES ('2780', '1968', '10', '16', '《人民日报》转载《红旗》杂志社论《吸收无产阶级的新鲜血液》');
INSERT INTO `history_today` VALUES ('2781', '1907', '10', '17', '梁启超等在日本东京成立政闻社');
INSERT INTO `history_today` VALUES ('2782', '1924', '10', '17', '直奉军阀山海关战役开始');
INSERT INTO `history_today` VALUES ('2783', '1932', '10', '17', '蒋介石采取新策略围剿红军');
INSERT INTO `history_today` VALUES ('2784', '1941', '10', '17', '东条英机继任日本内阁总理大臣');
INSERT INTO `history_today` VALUES ('2785', '1945', '10', '17', '胡安·庇隆取得阿根廷的统治地位');
INSERT INTO `history_today` VALUES ('2786', '1948', '10', '17', '长春和平解放');
INSERT INTO `history_today` VALUES ('2787', '1948', '10', '17', '电影《三毛流浪记》拍摄');
INSERT INTO `history_today` VALUES ('2788', '1958', '10', '17', '我国著名文学家、社会科学家、文化部副部长郑振铎率文化代表团出国访问途中，因飞机失事遇难');
INSERT INTO `history_today` VALUES ('2789', '1963', '10', '17', '联合国提案要求不把核武器投入空间轨道');
INSERT INTO `history_today` VALUES ('2790', '1963', '10', '17', '中国捐赠的首批物资运抵古巴');
INSERT INTO `history_today` VALUES ('2791', '1851', '10', '18', '美国作家赫尔曼·梅尔维尔的小说《白鲸》以缩节本形式首次出版');
INSERT INTO `history_today` VALUES ('2792', '1860', '10', '18', '(第二次鸦片战争）英法联军入侵北京，火烧举世文明的皇家园林圆明园');
INSERT INTO `history_today` VALUES ('2793', '1860', '10', '18', '北京和会，签署《天津条约》，第二次鸦片战争结束');
INSERT INTO `history_today` VALUES ('2794', '1867', '10', '18', '美国获得阿拉斯加');
INSERT INTO `history_today` VALUES ('2795', '1880', '10', '18', '美国阿拉斯加州矿业城市朱诺建城');
INSERT INTO `history_today` VALUES ('2796', '1910', '10', '18', '中国首届运动会开幕');
INSERT INTO `history_today` VALUES ('2797', '1911', '10', '18', '革命军政府与清军恶战');
INSERT INTO `history_today` VALUES ('2798', '1914', '10', '18', '德军潜艇U-27击毁英军潜艇E-3，这是战争史上第一次潜对潜作战');
INSERT INTO `history_today` VALUES ('2799', '1920', '10', '18', '英国矿工举行罢工');
INSERT INTO `history_today` VALUES ('2800', '1922', '10', '18', '英国国家广播公司（BBC）正式创立');
INSERT INTO `history_today` VALUES ('2801', '1781', '10', '19', '美国独立战争结束');
INSERT INTO `history_today` VALUES ('2802', '1812', '10', '19', '拿破仑撤离莫斯科');
INSERT INTO `history_today` VALUES ('2803', '1813', '10', '19', '莱比锡战役拿破仑惨败');
INSERT INTO `history_today` VALUES ('2804', '1893', '10', '19', '上海机器织布局失火焚毁');
INSERT INTO `history_today` VALUES ('2805', '1935', '10', '19', '中共中央和红一方面军到达陕北');
INSERT INTO `history_today` VALUES ('2806', '1937', '10', '19', '八路军第129师夜袭山西阳明堡日军机场，毁敌飞机20架，使日军数日内无法对忻口中国军队阵地进行轰炸');
INSERT INTO `history_today` VALUES ('2807', '1940', '10', '19', '蒋介石发出“皓电”，限令黄河以南新四军于一个月内撤到黄河以北，同时密令其数十万军队准备进攻华中新四军，从而掀起了第二次反共高潮');
INSERT INTO `history_today` VALUES ('2808', '1942', '10', '19', '中共中央西北局召开高级干部会议');
INSERT INTO `history_today` VALUES ('2809', '1943', '10', '19', '《解放日报》发表《在延安文艺座谈会上的讲话》');
INSERT INTO `history_today` VALUES ('2810', '1950', '10', '19', '以彭德怀为司令员兼政治委员的中国人民志愿军分别从丹东、长甸河口、集安等地跨过鸭绿江赴朝鲜前线，拉开了抗美援朝战争的序幕');
INSERT INTO `history_today` VALUES ('2811', '1548', '10', '20', '玻利维亚首都拉巴斯建成。“拉巴斯”在西班牙文中是“和平”的意思');
INSERT INTO `history_today` VALUES ('2812', '1626', '10', '20', '努尔哈赤第八子皇太极在沈阳登基，是为清太宗');
INSERT INTO `history_today` VALUES ('2813', '1853', '10', '20', '克里米亚战争爆发');
INSERT INTO `history_today` VALUES ('2814', '1883', '10', '20', '秘鲁按照《安索尔条约》把国土割让给智利');
INSERT INTO `history_today` VALUES ('2815', '1917', '10', '20', '国内第一家自建百货大楼开始营业');
INSERT INTO `history_today` VALUES ('2816', '1923', '10', '20', '《中国青年》创刊');
INSERT INTO `history_today` VALUES ('2817', '1924', '10', '20', '梅兰芳赴日本巡回演出');
INSERT INTO `history_today` VALUES ('2818', '1944', '10', '20', '贝尔格莱德解放');
INSERT INTO `history_today` VALUES ('2819', '1944', '10', '20', '美国麦克阿瑟将军和菲律宾前总统奥斯梅纳率领美军在菲律宾中部莱特岛登陆，打响了旨在把日军赶出菲律宾的莱特湾战役');
INSERT INTO `history_today` VALUES ('2820', '1945', '10', '20', '毛泽东与赫尔利达成五点协议');
INSERT INTO `history_today` VALUES ('2821', '1512', '10', '21', '马丁·路德进入维滕堡大学神学院');
INSERT INTO `history_today` VALUES ('2822', '1520', '10', '21', '麦哲伦发现麦哲伦海峡');
INSERT INTO `history_today` VALUES ('2823', '1641', '10', '21', '爱尔兰爆发民族起义');
INSERT INTO `history_today` VALUES ('2824', '1652', '10', '21', '“投石党”起义又称“福隆德”起义');
INSERT INTO `history_today` VALUES ('2825', '1805', '10', '21', '英国在特拉法尔加海战中战胜法国');
INSERT INTO `history_today` VALUES ('2826', '1805', '10', '21', '拿破仑率领法军在乌尔姆打败奥地利军队，奥地利将军麦克投降');
INSERT INTO `history_today` VALUES ('2827', '1854', '10', '21', '南丁格尔等为首的38名护士远赴克里米亚战场');
INSERT INTO `history_today` VALUES ('2828', '1873', '10', '21', '中国的台湾宝岛遭到日军侵略，台南县沦陷，标志日军全面占领台湾的开始。');
INSERT INTO `history_today` VALUES ('2829', '1879', '10', '21', '美国科学家爱迪生发明了电灯');
INSERT INTO `history_today` VALUES ('2830', '1895', '10', '21', '台南失陷在即，刘永福内渡大陆');
INSERT INTO `history_today` VALUES ('2831', '1911', '10', '22', '长沙革命成功');
INSERT INTO `history_today` VALUES ('2832', '1936', '10', '22', '红军三大主力会师');
INSERT INTO `history_today` VALUES ('2833', '1936', '10', '22', '蒋介石赴西安训示张学良、杨虎城');
INSERT INTO `history_today` VALUES ('2834', '1947', '10', '22', '晋察冀野战军出击清风店');
INSERT INTO `history_today` VALUES ('2835', '1959', '10', '22', '火箭探月使月球出现新的“火山口”');
INSERT INTO `history_today` VALUES ('2836', '1962', '10', '22', '肯尼迪宣布封锁古巴七项措施');
INSERT INTO `history_today` VALUES ('2837', '1962', '10', '22', '古巴导弹危机');
INSERT INTO `history_today` VALUES ('2838', '1978', '10', '22', '邓小平前往日本访问');
INSERT INTO `history_today` VALUES ('2839', '1980', '10', '22', '我国制成首批船用卫星导航接收机');
INSERT INTO `history_today` VALUES ('2840', '1981', '10', '22', '赵紫阳提出关于国际合作的五项原则');
INSERT INTO `history_today` VALUES ('2841', '1856', '10', '23', '英军海军借口“亚罗号事件”悍然发动进攻，正式挑起了第二次鸦片战争');
INSERT INTO `history_today` VALUES ('2842', '1868', '10', '23', '日本天皇改元明治');
INSERT INTO `history_today` VALUES ('2843', '1918', '10', '23', '熊希龄、蔡元培、张謇等人发起组织成立和平期成会');
INSERT INTO `history_today` VALUES ('2844', '1922', '10', '23', '开滦煤矿工人罢工');
INSERT INTO `history_today` VALUES ('2845', '1923', '10', '23', '德国汉堡起义爆发');
INSERT INTO `history_today` VALUES ('2846', '1924', '10', '23', '冯玉祥发动北京政变');
INSERT INTO `history_today` VALUES ('2847', '1931', '10', '23', '左翼电影运动开始');
INSERT INTO `history_today` VALUES ('2848', '1938', '10', '23', '日军占领广州');
INSERT INTO `history_today` VALUES ('2849', '1942', '10', '23', '阿拉曼战役开始');
INSERT INTO `history_today` VALUES ('2850', '1947', '10', '23', '美电影界发生“共产主义”风波');
INSERT INTO `history_today` VALUES ('2851', '1260', '10', '24', '拜巴尔一世刺杀埃及苏丹忽秃斯，夺取埃及政权');
INSERT INTO `history_today` VALUES ('2852', '1360', '10', '24', '百年战争：《布勒丁尼和约》生效，英国和法国暂时休战');
INSERT INTO `history_today` VALUES ('2853', '1648', '10', '24', '法国、瑞典与德国新教同盟及德皇于在威斯特、伐利亚的两个城市签订威斯特伐利亚和约');
INSERT INTO `history_today` VALUES ('2854', '1795', '10', '24', '普鲁士、奥地利和俄罗斯首次瓜分波兰');
INSERT INTO `history_today` VALUES ('2855', '1844', '10', '24', '清两广总督耆英在法国军舰“阿吉默特”号上同拉萼尼签订了中法第一个不平等条约《黄埔条约》');
INSERT INTO `history_today` VALUES ('2856', '1857', '10', '24', '位于英格兰谢菲尔德的锡菲足球会正式成立，成为世界上第一间的足球会。');
INSERT INTO `history_today` VALUES ('2857', '1860', '10', '24', '清政府与英国签订《中英北京条约》');
INSERT INTO `history_today` VALUES ('2858', '1876', '10', '24', '日本发生了熊本士族反对维新政府的武装叛乱。史称“神风连之乱”或“敬神党之乱”');
INSERT INTO `history_today` VALUES ('2859', '1877', '10', '24', '中国清军左宗棠之刘锦棠部攻克阿古柏占领的新疆重镇阿克苏');
INSERT INTO `history_today` VALUES ('2860', '1894', '10', '24', '甲午战争：日军进入中国境内');
INSERT INTO `history_today` VALUES ('2861', '1555', '10', '25', '查理五世逊西班牙王位');
INSERT INTO `history_today` VALUES ('2862', '1860', '10', '25', '清政府与法国签订《中法北京条约》');
INSERT INTO `history_today` VALUES ('2863', '1864', '10', '25', '太平天国幼天王、洪秀全长子洪天贵福于江西石城荒山被清军所俘');
INSERT INTO `history_today` VALUES ('2864', '1881', '10', '25', '毕加索诞生');
INSERT INTO `history_today` VALUES ('2865', '1915', '10', '25', '孙中山与宋庆龄结婚');
INSERT INTO `history_today` VALUES ('2866', '1923', '10', '25', '国民党召开改组预备会议');
INSERT INTO `history_today` VALUES ('2867', '1938', '10', '25', '中日武汉会战结束：抗战进入相持阶段');
INSERT INTO `history_today` VALUES ('2868', '1945', '10', '25', '中国战区台湾省受降仪式在台北市中山堂举行，台湾及澎湖列岛正式重归中国版图。从此，被日本占领长达50年之久的台湾岛回归祖国');
INSERT INTO `history_today` VALUES ('2869', '1948', '10', '25', '毛泽东三则电讯退敌兵');
INSERT INTO `history_today` VALUES ('2870', '1952', '10', '25', '周恩来预言中国将和平转入社会主义');
INSERT INTO `history_today` VALUES ('2871', '1863', '10', '26', '现代足球诞生日');
INSERT INTO `history_today` VALUES ('2872', '1904', '10', '26', '南洋华侨巨商张振勋因捐巨款办实业而受爵');
INSERT INTO `history_today` VALUES ('2873', '1905', '10', '26', '挪威独立，获得承认');
INSERT INTO `history_today` VALUES ('2874', '1909', '10', '26', '“日本俾斯麦”伊藤博文被朝鲜爱国志士安重根击毙');
INSERT INTO `history_today` VALUES ('2875', '1926', '10', '26', '尼加拉瓜反美游击战争爆发');
INSERT INTO `history_today` VALUES ('2876', '1930', '10', '26', '台湾雾社起义失败');
INSERT INTO `history_today` VALUES ('2877', '1930', '10', '26', '瓦加斯叛变夺取巴西政权');
INSERT INTO `history_today` VALUES ('2878', '1931', '10', '26', '英雄金笔厂前身的华孚金笔厂成立');
INSERT INTO `history_today` VALUES ('2879', '1933', '10', '26', '红军与十九路军签订反日反蒋初步协定');
INSERT INTO `history_today` VALUES ('2880', '1937', '10', '26', '日军攻陷娘子关');
INSERT INTO `history_today` VALUES ('2881', '1910', '10', '27', '清政府与美国摩根财团在北京签订《美国借款草合同》，向美国借款五千万美元');
INSERT INTO `history_today` VALUES ('2882', '1915', '10', '27', '美军进入一战前线');
INSERT INTO `history_today` VALUES ('2883', '1930', '10', '27', '台湾省雾社爆发高山族同胞反抗日本侵略者的雾社起义，击毙击伤占领台湾的日本军队近千人。后被日本殖民政府残酷镇压，起义领导人及2000多高山族同胞被杀害');
INSERT INTO `history_today` VALUES ('2884', '1934', '10', '27', '日本蓄意挑起张北事件');
INSERT INTO `history_today` VALUES ('2885', '1937', '10', '27', '伪蒙古联盟自治政府成立');
INSERT INTO `history_today` VALUES ('2886', '1937', '10', '27', '八百壮士坚守四行仓库');
INSERT INTO `history_today` VALUES ('2887', '1938', '10', '27', '日军对中国军队进行毒气战');
INSERT INTO `history_today` VALUES ('2888', '1940', '10', '27', '延安筹建新华广播电台');
INSERT INTO `history_today` VALUES ('2889', '1940', '10', '27', '卓别林的《大独裁者》上映');
INSERT INTO `history_today` VALUES ('2890', '1947', '10', '27', '国民党政府与美国签订《中美救济协定》');
INSERT INTO `history_today` VALUES ('2891', '1277', '10', '28', '元大都（今北京）出现日全食');
INSERT INTO `history_today` VALUES ('2892', '1492', '10', '28', '哥伦布在古巴靠岸');
INSERT INTO `history_today` VALUES ('2893', '1868', '10', '28', '爱迪生申请平生第一项专利——电子投票记录仪');
INSERT INTO `history_today` VALUES ('2894', '1886', '10', '28', '美国总统格罗弗·克利夫兰为自由女神像揭幕');
INSERT INTO `history_today` VALUES ('2895', '1902', '10', '28', '马克思第一次被介绍给国人');
INSERT INTO `history_today` VALUES ('2896', '1918', '10', '28', '捷克斯洛伐克从奥匈帝国独立');
INSERT INTO `history_today` VALUES ('2897', '1919', '10', '28', '美国全国禁酒法令颁布');
INSERT INTO `history_today` VALUES ('2898', '1922', '10', '28', '墨索里尼率领意大利法西斯分子向罗马进军，并在梵蒂冈教廷的帮助下接管意大利政府');
INSERT INTO `history_today` VALUES ('2899', '1940', '10', '28', '意军开始入侵希腊');
INSERT INTO `history_today` VALUES ('2900', '1945', '10', '28', '赵树理发表《小二黑结婚》');
INSERT INTO `history_today` VALUES ('2901', '1888', '10', '29', '关于苏伊士运河的《君士坦丁堡公约》签订');
INSERT INTO `history_today` VALUES ('2902', '1902', '10', '29', '中国第一所女子学校招生');
INSERT INTO `history_today` VALUES ('2903', '1907', '10', '29', '山阴县令李钟岳义殉秋瑾');
INSERT INTO `history_today` VALUES ('2904', '1911', '10', '29', '阎锡山就任山西军政府都督');
INSERT INTO `history_today` VALUES ('2905', '1914', '10', '29', '土耳其被迫与协约国宣战');
INSERT INTO `history_today` VALUES ('2906', '1916', '10', '29', '阿拉伯人在汉志起义，反对奥斯曼帝国');
INSERT INTO `history_today` VALUES ('2907', '1922', '10', '29', '墨索里尼法西斯分子抵达罗马');
INSERT INTO `history_today` VALUES ('2908', '1923', '10', '29', '土耳其凯末尔革命胜利');
INSERT INTO `history_today` VALUES ('2909', '1929', '10', '29', '世界经济大危机爆发');
INSERT INTO `history_today` VALUES ('2910', '1948', '10', '29', '蒋经国“打虎”失败');
INSERT INTO `history_today` VALUES ('2911', '1270', '10', '30', '第八次十字军与突尼斯达成停战协议');
INSERT INTO `history_today` VALUES ('2912', '1644', '10', '30', '清世祖福临定都北京');
INSERT INTO `history_today` VALUES ('2913', '1863', '10', '30', '丹麦威廉王子抵达雅典，就位成为希腊国王乔治一世');
INSERT INTO `history_today` VALUES ('2914', '1864', '10', '30', '丹麦宣布放弃石勒苏益格和荷尔斯泰因，两地被普鲁士和奥地利瓜分');
INSERT INTO `history_today` VALUES ('2915', '1905', '10', '30', '俄国沙皇尼古拉二世颁布《十月宣言》，确立杜马作为立法机关');
INSERT INTO `history_today` VALUES ('2916', '1911', '10', '30', '第一届索耳末会议在布鲁塞尔召开');
INSERT INTO `history_today` VALUES ('2917', '1911', '10', '30', '蔡锷等于昆明起义成功');
INSERT INTO `history_today` VALUES ('2918', '1918', '10', '30', '第一次世界大战奥斯曼帝国投降');
INSERT INTO `history_today` VALUES ('2919', '1918', '10', '30', '德意志各省在维也纳成立德意志民族议会');
INSERT INTO `history_today` VALUES ('2920', '1918', '10', '30', '斯洛伐克各地代表在马丁召开民族会议，宣布和捷克合并成独立的捷克斯洛伐克，史称“马丁会议”');
INSERT INTO `history_today` VALUES ('2921', '1183', '10', '31', '日本朝廷天皇事实上承认源赖朝对于国家的支配');
INSERT INTO `history_today` VALUES ('2922', '1471', '10', '31', '日本伯耆国家守护山名丰之，计谋叛乱被杀害');
INSERT INTO `history_today` VALUES ('2923', '1517', '10', '31', '在德意志的维滕贝格教堂门前，马丁·路德贴出《关于赎罪券效能的辩论》，即著名的“九十五条论纲”。掀起宗教改革运动');
INSERT INTO `history_today` VALUES ('2924', '1651', '10', '31', '清改承天门为天安门');
INSERT INTO `history_today` VALUES ('2925', '1874', '10', '31', '中日订立《台事北京专约》');
INSERT INTO `history_today` VALUES ('2926', '1892', '10', '31', '阿瑟·柯南道尔小说《福尔摩斯的冒险》开始发行');
INSERT INTO `history_today` VALUES ('2927', '1914', '10', '31', '第一次世界大战:日本侵略德国驻地，青岛的战斗开始');
INSERT INTO `history_today` VALUES ('2928', '1918', '10', '31', '匈牙利爆发资产阶级民主革命，结束了欧洲最大的王朝之一哈布斯堡王朝400多年统治');
INSERT INTO `history_today` VALUES ('2929', '1918', '10', '31', '第一次世界大战，同盟国土耳其被迫宣布向协约国投降');
INSERT INTO `history_today` VALUES ('2930', '1918', '10', '31', '奥地利宣布共和');
INSERT INTO `history_today` VALUES ('2931', '1887', '11', '1', '“同文学会”在上海成立');
INSERT INTO `history_today` VALUES ('2932', '1919', '11', '1', '美国历史上第一次工人运动高潮');
INSERT INTO `history_today` VALUES ('2933', '1922', '11', '1', '墨索里尼出任意大利总理');
INSERT INTO `history_today` VALUES ('2934', '1922', '11', '1', '凯末尔宣布废除苏丹制');
INSERT INTO `history_today` VALUES ('2935', '1928', '11', '1', '国民党政府成立中央银行，宋子文任总裁');
INSERT INTO `history_today` VALUES ('2936', '1949', '11', '1', '“西南战役”开始');
INSERT INTO `history_today` VALUES ('2937', '1952', '11', '1', '美国进行第一颗氢弹试验。');
INSERT INTO `history_today` VALUES ('2938', '1954', '11', '1', '阿尔及利亚民族解放战争爆发');
INSERT INTO `history_today` VALUES ('2939', '1958', '11', '1', '中国与摩洛哥王国建交');
INSERT INTO `history_today` VALUES ('2940', '1981', '11', '1', '安提瓜和巴布达宣布独立');
INSERT INTO `history_today` VALUES ('2941', '1841', '11', '2', '阿富汗第一次抗英斗争');
INSERT INTO `history_today` VALUES ('2942', '1861', '11', '2', '慈禧太后发动北京宫廷政变');
INSERT INTO `history_today` VALUES ('2943', '1917', '11', '2', '石井--兰辛协定订立');
INSERT INTO `history_today` VALUES ('2944', '1917', '11', '2', '贝尔福宣言出笼');
INSERT INTO `history_today` VALUES ('2945', '1939', '11', '2', '日军对晋察冀边区开始大“扫荡”');
INSERT INTO `history_today` VALUES ('2946', '1948', '11', '2', '沈阳解放，辽沈战役大获全胜');
INSERT INTO `history_today` VALUES ('2947', '1948', '11', '2', '杜鲁门连任美国总统');
INSERT INTO `history_today` VALUES ('2948', '1949', '11', '2', '印尼--荷兰圆桌会议协定签订');
INSERT INTO `history_today` VALUES ('2949', '1950', '11', '2', '英国现实主义戏剧家萧伯纳逝世，享年94岁');
INSERT INTO `history_today` VALUES ('2950', '1957', '11', '2', '毛泽东访问苏联');
INSERT INTO `history_today` VALUES ('2951', '1869', '11', '3', '安庆教案发生');
INSERT INTO `history_today` VALUES ('2952', '1950', '11', '3', '联合国大会通过“为和平联合行动”的决议');
INSERT INTO `history_today` VALUES ('2953', '1957', '11', '3', '苏联载狗的卫星二号上天');
INSERT INTO `history_today` VALUES ('2954', '1962', '11', '3', '吴丹出任联合国秘书长');
INSERT INTO `history_today` VALUES ('2955', '1970', '11', '3', '阿连德任智利总统');
INSERT INTO `history_today` VALUES ('2956', '1978', '11', '3', '多米尼加联邦独立');
INSERT INTO `history_today` VALUES ('2957', '1979', '11', '3', '美‘柏伽索斯112号’卫星在大西洋坠毁');
INSERT INTO `history_today` VALUES ('2958', '1982', '11', '3', '茅以升获美国工程学会外国院士称号');
INSERT INTO `history_today` VALUES ('2959', '1983', '11', '3', '英国将把狮身人面像胡须归还埃及');
INSERT INTO `history_today` VALUES ('2960', '1987', '11', '3', '联合国向袁隆平颁发科学奖');
INSERT INTO `history_today` VALUES ('2961', '1903', '11', '4', '黄兴、宋教仁等创建华兴会');
INSERT INTO `history_today` VALUES ('2962', '1918', '11', '4', '青年土耳其党解散');
INSERT INTO `history_today` VALUES ('2963', '1922', '11', '4', '奥斯曼土耳其苏丹被废黜帝国崩溃');
INSERT INTO `history_today` VALUES ('2964', '1922', '11', '4', '埃及法老图坦哈蒙墓发现');
INSERT INTO `history_today` VALUES ('2965', '1931', '11', '4', '马占山率部在江桥与日军激战');
INSERT INTO `history_today` VALUES ('2966', '1942', '11', '4', '隆美尔在阿拉曼战役惨败');
INSERT INTO `history_today` VALUES ('2967', '1944', '11', '4', '毛泽东致函盛赞罗斯福');
INSERT INTO `history_today` VALUES ('2968', '1946', '11', '4', '中美商约签订');
INSERT INTO `history_today` VALUES ('2969', '1946', '11', '4', '联合国教育、科学及文化组织（简称“教科文组织”）成立');
INSERT INTO `history_today` VALUES ('2970', '1950', '11', '4', '中国共产党和民主党派联合发表抗美援朝宣言');
INSERT INTO `history_today` VALUES ('2971', '1838', '11', '5', '中美洲联邦解体，洪都拉斯宣布独立');
INSERT INTO `history_today` VALUES ('2972', '1905', '11', '5', '墨水瓶风波引发蔡元培建立爱国学社');
INSERT INTO `history_today` VALUES ('2973', '1905', '11', '5', '沙皇尼古拉二世残暴屠杀犹太人');
INSERT INTO `history_today` VALUES ('2974', '1906', '11', '5', '法国开办第一家生产飞机的工厂');
INSERT INTO `history_today` VALUES ('2975', '1960', '11', '5', '我国第一枚国产近程导弹发射成功。这是我国军事装备史上一个重要的转折点。');
INSERT INTO `history_today` VALUES ('2976', '1964', '11', '5', '周恩来率代表团参加十月革命47年周年纪念活动');
INSERT INTO `history_today` VALUES ('2977', '1982', '11', '5', '巴西巴拉圭合建的世界最大水电站主坝建成');
INSERT INTO `history_today` VALUES ('2978', '1983', '11', '5', '乌拉圭首都发生严重冲突');
INSERT INTO `history_today` VALUES ('2979', '1986', '11', '5', '我国第一台核子秤研制成功');
INSERT INTO `history_today` VALUES ('2980', '1991', '11', '5', '越南共产党领导对中国进行正式访问');
INSERT INTO `history_today` VALUES ('2981', '1860', '11', '6', '亚伯拉罕·林肯当选为第十六届美国总统。他是第一位共和党总统。');
INSERT INTO `history_today` VALUES ('2982', '1861', '11', '6', '杰弗逊·汉密尔顿·戴维斯获选为任期六年的美利坚联盟国总统（南北战争时期）。');
INSERT INTO `history_today` VALUES ('2983', '1900', '11', '6', '八国联军组建军事法庭斩杀中国官员。');
INSERT INTO `history_today` VALUES ('2984', '1903', '11', '6', '《南华早报》在香港创刊及出版。');
INSERT INTO `history_today` VALUES ('2985', '1911', '11', '6', '马德罗就任墨西哥总统');
INSERT INTO `history_today` VALUES ('2986', '1918', '11', '6', '波兰宣布独立，是为波兰第二共和国');
INSERT INTO `history_today` VALUES ('2987', '1936', '11', '6', '马德里保卫战开始。');
INSERT INTO `history_today` VALUES ('2988', '1941', '11', '6', '毛泽东发表演说论新民主主义政策');
INSERT INTO `history_today` VALUES ('2989', '1947', '11', '6', '石家庄解放');
INSERT INTO `history_today` VALUES ('2990', '1948', '11', '6', '淮海战役开始');
INSERT INTO `history_today` VALUES ('2991', '1504', '11', '7', '哥伦布第一次返航西班牙。');
INSERT INTO `history_today` VALUES ('2992', '1659', '11', '7', '西班牙和法国签订比利牛斯和约。');
INSERT INTO `history_today` VALUES ('2993', '1665', '11', '7', '《伦敦公报》开始发行，这是现存的历史最长的报纸。');
INSERT INTO `history_today` VALUES ('2994', '1917', '11', '7', '俄国十月革命爆发');
INSERT INTO `history_today` VALUES ('2995', '1918', '11', '7', '波兰共和国临时人民政府宣告成立。');
INSERT INTO `history_today` VALUES ('2996', '1920', '11', '7', '《共产党》杂志秘密发刊。');
INSERT INTO `history_today` VALUES ('2997', '1921', '11', '7', '墨索里尼宣布法西斯政党成立。');
INSERT INTO `history_today` VALUES ('2998', '1928', '11', '7', '胡佛当选美国总统。');
INSERT INTO `history_today` VALUES ('2999', '1931', '11', '7', '中华苏维埃第一次全国代表大会召开。');
INSERT INTO `history_today` VALUES ('3000', '1931', '11', '7', '新华通讯社成立。');
INSERT INTO `history_today` VALUES ('3001', '1520', '11', '8', '斯德哥尔摩大屠杀。');
INSERT INTO `history_today` VALUES ('3002', '1620', '11', '8', '白山战役。');
INSERT INTO `history_today` VALUES ('3003', '1858', '11', '8', '中国与英国签订不平等条约《中英通商章程善后条约》又称《中英通商章程》。');
INSERT INTO `history_today` VALUES ('3004', '1895', '11', '8', '德国物理学家伦琴发现X射线。');
INSERT INTO `history_today` VALUES ('3005', '1907', '11', '8', '第一张传真照片诞生。');
INSERT INTO `history_today` VALUES ('3006', '1917', '11', '8', '苏俄土地法令通过。');
INSERT INTO `history_today` VALUES ('3007', '1970', '11', '8', '倪志钦打破男子跳高世界纪录。');
INSERT INTO `history_today` VALUES ('3008', '1971', '11', '8', 'INTEL公司生产了第一款微处理器Intel 4004。');
INSERT INTO `history_today` VALUES ('3009', '1980', '11', '8', '天安门修葺工程完成。');
INSERT INTO `history_today` VALUES ('3010', '1985', '11', '8', '哥伦比亚政府军收复司法大楼。');
INSERT INTO `history_today` VALUES ('3011', '1799', '11', '9', '法国的“雾月政变”。');
INSERT INTO `history_today` VALUES ('3012', '1918', '11', '9', '德国十一月革命爆发。');
INSERT INTO `history_today` VALUES ('3013', '1937', '11', '9', '太原失守。');
INSERT INTO `history_today` VALUES ('3014', '1943', '11', '9', '铁托成为南斯拉夫政府领导人。');
INSERT INTO `history_today` VALUES ('3015', '1949', '11', '9', '中共中央发出《关于成立中央及各级党的纪律检查委员会的决定》。');
INSERT INTO `history_today` VALUES ('3016', '1971', '11', '9', '中国与黎巴嫩共和国建交。');
INSERT INTO `history_today` VALUES ('3017', '1982', '11', '9', '法国试制成功中子弹。');
INSERT INTO `history_today` VALUES ('3018', '1988', '11', '9', '中国农工民主党第十次全国代表大会在北京举行。');
INSERT INTO `history_today` VALUES ('3019', '1989', '11', '9', '中共十三届五中全会召开 会议通过了《中共中央关于进一步治理整顿和深化改革的决定》。');
INSERT INTO `history_today` VALUES ('3020', '1989', '11', '9', '毕加索名画盗窃案破获。');
INSERT INTO `history_today` VALUES ('3021', '1924', '11', '10', '孙中山发表《北上宣言》。');
INSERT INTO `history_today` VALUES ('3022', '1928', '11', '10', '日本天皇裕仁即位。');
INSERT INTO `history_today` VALUES ('3023', '1944', '11', '10', '桂林、柳州同日失陷。');
INSERT INTO `history_today` VALUES ('3024', '1963', '11', '10', '首届新兴力量运动会在印尼雅加达开幕。');
INSERT INTO `history_today` VALUES ('3025', '1965', '11', '10', '《评新编历史剧〈海瑞罢官〉》揭开“文化大革命”的序幕。');
INSERT INTO `history_today` VALUES ('3026', '1980', '11', '10', '中共中央政治局连续召开9次会议。');
INSERT INTO `history_today` VALUES ('3027', '1990', '11', '10', '哈勃望远镜首次观察类星体。');
INSERT INTO `history_today` VALUES ('3028', '1994', '11', '10', '《关于坚决防止和纠正选拔任用干部工作中不正之风的通知》');
INSERT INTO `history_today` VALUES ('3029', '1994', '11', '10', '我国首台无缆水下机器人问世。');
INSERT INTO `history_today` VALUES ('3030', '1998', '11', '10', '邪教“主神教”覆灭。');
INSERT INTO `history_today` VALUES ('3031', '1500', '11', '11', '《格拉纳达条约》签订。');
INSERT INTO `history_today` VALUES ('3032', '1620', '11', '11', '第一批到达美洲的英国殖民者签订《五月花号协定》，成为普利茅斯殖民地的基本法律。');
INSERT INTO `history_today` VALUES ('3033', '1918', '11', '11', '第一次世界大战结束。');
INSERT INTO `history_today` VALUES ('3034', '1928', '11', '11', '中共要求全党纠正错误观念。');
INSERT INTO `history_today` VALUES ('3035', '1929', '11', '11', '中国收回镇江英租界。');
INSERT INTO `history_today` VALUES ('3036', '1949', '11', '11', '中国人民解放军空军成立。');
INSERT INTO `history_today` VALUES ('3037', '1975', '11', '11', '马尔科姆·弗雷泽任看守内阁总理。');
INSERT INTO `history_today` VALUES ('3038', '1989', '11', '11', '亚洲最大航空博物馆正式开放。');
INSERT INTO `history_today` VALUES ('3039', '1989', '11', '11', '美国最大的核动力航空母舰服役。');
INSERT INTO `history_today` VALUES ('3040', '1993', '11', '11', '中共十四届三中全会在北京举行');
INSERT INTO `history_today` VALUES ('3041', '1866', '11', '12', '第1任国民党主席孙中山诞生。');
INSERT INTO `history_today` VALUES ('3042', '1918', '11', '12', '奥地利成为共和国。');
INSERT INTO `history_today` VALUES ('3043', '1921', '11', '12', '华盛顿会议召开。');
INSERT INTO `history_today` VALUES ('3044', '1926', '11', '12', '印尼反荷大起义爆发。');
INSERT INTO `history_today` VALUES ('3045', '1937', '11', '12', '淞沪会战结束。');
INSERT INTO `history_today` VALUES ('3046', '1938', '11', '12', '长沙实行“焦土抗战”。');
INSERT INTO `history_today` VALUES ('3047', '1947', '11', '12', '台湾民主自治同盟在香港成立。');
INSERT INTO `history_today` VALUES ('3048', '1955', '11', '12', '西德重组军队。');
INSERT INTO `history_today` VALUES ('3049', '1956', '11', '12', '全军参谋长会议在北京举行。');
INSERT INTO `history_today` VALUES ('3050', '1973', '11', '12', '基辛格第六次访华　毛泽东会见。');
INSERT INTO `history_today` VALUES ('3051', '1907', '11', '13', '世界上第一架直升飞机在法国飞起。');
INSERT INTO `history_today` VALUES ('3052', '1909', '11', '13', '第一个革命文学团体——南社成立。');
INSERT INTO `history_today` VALUES ('3053', '1918', '11', '13', '北京将克林德碑改名“公理战胜”。');
INSERT INTO `history_today` VALUES ('3054', '1927', '11', '13', '“黄麻起义”');
INSERT INTO `history_today` VALUES ('3055', '1945', '11', '13', '戴高乐当选法国总统。');
INSERT INTO `history_today` VALUES ('3056', '1975', '11', '13', '中国与科摩罗伊斯兰联邦共和国建交。');
INSERT INTO `history_today` VALUES ('3057', '1975', '11', '13', '世界卫生组织宣布，亚洲有史以来第一次消灭天花。');
INSERT INTO `history_today` VALUES ('3058', '1984', '11', '13', '柴达木首次发现旧石器和南极石。');
INSERT INTO `history_today` VALUES ('3059', '1985', '11', '13', '我国第一颗原子弹爆轰试验场纪念碑落成。');
INSERT INTO `history_today` VALUES ('3060', '1989', '11', '13', '世界最大正负电子对撞机落成。');
INSERT INTO `history_today` VALUES ('3061', '1860', '11', '14', '清与俄签订《中俄北京条约》。');
INSERT INTO `history_today` VALUES ('3062', '1960', '11', '14', '中国发生三年自然灾害。');
INSERT INTO `history_today` VALUES ('3063', '1979', '11', '14', '约旦河西岸所有市长全体辞职。');
INSERT INTO `history_today` VALUES ('3064', '1980', '11', '14', '陈云提出搞好党风的重要意见。');
INSERT INTO `history_today` VALUES ('3065', '1983', '11', '14', '美提出削减中程核武器新建议遭苏拒绝。');
INSERT INTO `history_today` VALUES ('3066', '1987', '11', '14', '中共中央政治局在北京举行第一次全体会议。');
INSERT INTO `history_today` VALUES ('3067', '1988', '11', '14', '中美登山队员征服南极文森峰。');
INSERT INTO `history_today` VALUES ('3068', '1988', '11', '14', '台湾核发首批“入台旅行证”。');
INSERT INTO `history_today` VALUES ('3069', '1988', '11', '14', '澳决定用我火箭发射卫星。');
INSERT INTO `history_today` VALUES ('3070', '1991', '11', '14', '柬埔寨西哈努克亲王返抵金边。');
INSERT INTO `history_today` VALUES ('3071', '1889', '11', '15', '巴西宣布废除帝制。');
INSERT INTO `history_today` VALUES ('3072', '1892', '11', '15', '沙俄向清政府提出帕米尔划界问题。');
INSERT INTO `history_today` VALUES ('3073', '1918', '11', '15', '李大钊预言：试看将来的环球　必是赤旗的世界。');
INSERT INTO `history_today` VALUES ('3074', '1952', '11', '15', '中央政府决定改变大行政区政府设置。');
INSERT INTO `history_today` VALUES ('3075', '1971', '11', '15', '应联合国秘书长的邀请，以乔冠华为团长的中国代表团正式出席联合国大会。');
INSERT INTO `history_today` VALUES ('3076', '1976', '11', '15', '初步揭批“四人帮”的罪行。');
INSERT INTO `history_today` VALUES ('3077', '1978', '11', '15', '天安门事件平反。');
INSERT INTO `history_today` VALUES ('3078', '1982', '11', '15', '联合国大会通过关于和平解决国际争端的《马尼拉宣言》。');
INSERT INTO `history_today` VALUES ('3079', '1984', '11', '15', '中共中央书记处举行会议。');
INSERT INTO `history_today` VALUES ('3080', '1984', '11', '15', '全国宣传部长会议在北京召开。');
INSERT INTO `history_today` VALUES ('3081', '1632', '11', '16', '吕岑战役，瑞典国王古斯塔夫二世战死。');
INSERT INTO `history_today` VALUES ('3082', '1904', '11', '16', '约翰·安布罗斯·弗莱明发明真空管。');
INSERT INTO `history_today` VALUES ('3083', '1957', '11', '16', '苏联建成世界第一座煤气动力电站');
INSERT INTO `history_today` VALUES ('3084', '1959', '11', '16', '音乐剧《音乐之声》首次在百老汇上演');
INSERT INTO `history_today` VALUES ('3085', '1960', '11', '16', '苏联研制成“会说话”的机器帮助盲人');
INSERT INTO `history_today` VALUES ('3086', '1972', '11', '16', '联合国教科文组织通过《保护世界文化和自然遗产公约》。');
INSERT INTO `history_today` VALUES ('3087', '1972', '11', '16', '中国与卢森堡大公国建交');
INSERT INTO `history_today` VALUES ('3088', '1973', '11', '16', '根治海河报捷');
INSERT INTO `history_today` VALUES ('3089', '1978', '11', '16', '话剧《于无声处》在京首场演出。');
INSERT INTO `history_today` VALUES ('3090', '1981', '11', '16', '中国女排首次荣获世界冠军');
INSERT INTO `history_today` VALUES ('3091', '1869', '11', '17', '沟通地中海与红海的苏伊士运河竣工通航。');
INSERT INTO `history_today` VALUES ('3092', '1884', '11', '17', '清政府在新疆建立行省。');
INSERT INTO `history_today` VALUES ('3093', '1933', '11', '17', '美国正式承认苏联。');
INSERT INTO `history_today` VALUES ('3094', '1949', '11', '17', '阮晋勇出生，越南国会总理。');
INSERT INTO `history_today` VALUES ('3095', '1956', '11', '17', '邓小平说，马列主义要与中国的实际情况相结合。');
INSERT INTO `history_today` VALUES ('3096', '1969', '11', '17', '美苏关于限制战略核武器会谈。');
INSERT INTO `history_today` VALUES ('3097', '1984', '11', '17', '中共中央、国务院要求严格控制成立全国性组织。');
INSERT INTO `history_today` VALUES ('3098', '1989', '11', '17', '我国首台小巨型电子计算机问世。');
INSERT INTO `history_today` VALUES ('3099', '1991', '11', '17', '美发现地球上最大头骨化石。');
INSERT INTO `history_today` VALUES ('3100', '1993', '11', '17', '莫斯科列宁博物馆关闭。');
INSERT INTO `history_today` VALUES ('3101', '1067', '11', '18', '司马光初进读通志，赐名《资治通鉴》（附图）。');
INSERT INTO `history_today` VALUES ('3102', '1626', '11', '18', '梵蒂冈的圣彼得大教堂重建后正式宣告落成。');
INSERT INTO `history_today` VALUES ('3103', '1901', '11', '18', '英国同意将运河权交给美国。');
INSERT INTO `history_today` VALUES ('3104', '1918', '11', '18', '拉脱维亚宣告独立。');
INSERT INTO `history_today` VALUES ('3105', '1957', '11', '18', '中国云南红河哈尼族彝族自治州成立。');
INSERT INTO `history_today` VALUES ('3106', '1958', '11', '18', '海河拦河大坝合龙。');
INSERT INTO `history_today` VALUES ('3107', '1963', '11', '18', '伊拉克发生新的军事政变。');
INSERT INTO `history_today` VALUES ('3108', '1965', '11', '18', '林彪提出“突出政治”五原则。');
INSERT INTO `history_today` VALUES ('3109', '1974', '11', '18', '美国总统首次访日。');
INSERT INTO `history_today` VALUES ('3110', '1978', '11', '18', '“人民圣殿教”900多信徒集体自杀。');
INSERT INTO `history_today` VALUES ('3111', '1935', '11', '19', '红二、红六军团开始长征');
INSERT INTO `history_today` VALUES ('3112', '1969', '11', '19', '贝利攻进第一千个球');
INSERT INTO `history_today` VALUES ('3113', '1980', '11', '19', '大陆第一支时装表演队诞生');
INSERT INTO `history_today` VALUES ('3114', '1982', '11', '19', '第九届亚运会在新德里开幕');
INSERT INTO `history_today` VALUES ('3115', '1984', '11', '19', '墨西哥城石油气大爆炸');
INSERT INTO `history_today` VALUES ('3116', '1984', '11', '19', '中国第一支南极考察队出发');
INSERT INTO `history_today` VALUES ('3117', '1985', '11', '19', '美苏在日内瓦举行首脑会谈');
INSERT INTO `history_today` VALUES ('3118', '1986', '11', '19', '南盘江上兴建大型水电站');
INSERT INTO `history_today` VALUES ('3119', '1986', '11', '19', '我国野生东北虎已不足三十只');
INSERT INTO `history_today` VALUES ('3120', '1988', '11', '19', '台湾当局准许大陆台籍国民党兵返故乡');
INSERT INTO `history_today` VALUES ('3121', '1904', '11', '20', '光复会成立');
INSERT INTO `history_today` VALUES ('3122', '1933', '11', '20', '十九路军发动反蒋福建事变');
INSERT INTO `history_today` VALUES ('3123', '1937', '11', '20', '国民党政府迁都重庆');
INSERT INTO `history_today` VALUES ('3124', '1945', '11', '20', '日本战犯本庄繁自杀');
INSERT INTO `history_today` VALUES ('3125', '1959', '11', '20', '英国“小自由贸易区”正式建立');
INSERT INTO `history_today` VALUES ('3126', '1959', '11', '20', '替美蒋制造军火日本一家工厂大爆炸');
INSERT INTO `history_today` VALUES ('3127', '1961', '11', '20', '阿尔及利亚爱国者绝食抗法获胜');
INSERT INTO `history_today` VALUES ('3128', '1962', '11', '20', '西德发生政府危机');
INSERT INTO `history_today` VALUES ('3129', '1975', '11', '20', '西班牙独裁者佛朗哥去世');
INSERT INTO `history_today` VALUES ('3130', '1979', '11', '20', '西安--拉萨航线通航');
INSERT INTO `history_today` VALUES ('3131', '1783', '11', '21', '法国蒙特哥菲尔一对兄弟乘坐自己制造的热气球飞行了25分钟，这是人类首次热气球旅行。');
INSERT INTO `history_today` VALUES ('3132', '1806', '11', '21', '拿破仑颁布柏林敕令，规定对不列颠诸岛实行经济封锁。');
INSERT INTO `history_today` VALUES ('3133', '1877', '11', '21', '爱迪生宣布发明留声机。');
INSERT INTO `history_today` VALUES ('3134', '1878', '11', '21', '英国与阿富汗爆发第二次英阿战争。');
INSERT INTO `history_today` VALUES ('3135', '1885', '11', '21', '上海格致书院首次放映电影，这是中国人第一次看到电影。');
INSERT INTO `history_today` VALUES ('3136', '1887', '11', '21', '清政府派美国驻华公使蒲安臣为出使大臣。');
INSERT INTO `history_today` VALUES ('3137', '1927', '11', '21', '我国第一个工农政权――海陆丰苏维埃成立。');
INSERT INTO `history_today` VALUES ('3138', '1944', '11', '21', '毛泽东致函郭沫若 告诉他已把《甲申三百年祭》指定为整风文件。');
INSERT INTO `history_today` VALUES ('3139', '1946', '11', '21', '季米特洛夫任保加利亚总理。');
INSERT INTO `history_today` VALUES ('3140', '1977', '11', '21', '埃及与以色列达成和解。');
INSERT INTO `history_today` VALUES ('3141', '1699', '11', '22', '丹麦、俄国、萨克森和波兰签订瓜分瑞典帝国条约。');
INSERT INTO `history_today` VALUES ('3142', '1926', '11', '22', '共产国际执委第七次扩大全会在莫斯科举行。');
INSERT INTO `history_today` VALUES ('3143', '1928', '11', '22', '中国青年天文学家张钰哲在美国叶凯士天文台发现一颗编号第1125号的小行星');
INSERT INTO `history_today` VALUES ('3144', '1943', '11', '22', '中英美领导人举行开罗会议。');
INSERT INTO `history_today` VALUES ('3145', '1956', '11', '22', '第十六届墨尔本奥运会开幕。');
INSERT INTO `history_today` VALUES ('3146', '1962', '11', '22', '苏联建设当时世界最长的地下输水管道。');
INSERT INTO `history_today` VALUES ('3147', '1963', '11', '22', '第一届新兴力量运动会闭幕。');
INSERT INTO `history_today` VALUES ('3148', '1975', '11', '22', '胡安·卡洛斯出任西班牙国王。');
INSERT INTO `history_today` VALUES ('3149', '1984', '11', '22', '中共中央整党工作指导委员会发出第十号通知。');
INSERT INTO `history_today` VALUES ('3150', '1989', '11', '22', '微缩景区“锦绣中华”在深圳开幕。');
INSERT INTO `history_today` VALUES ('3151', '1784', '11', '23', '最早一封航空邮件，现存于安麦斯特大学。');
INSERT INTO `history_today` VALUES ('3152', '1876', '11', '23', '独裁者迪亚斯就任墨西哥总统。');
INSERT INTO `history_today` VALUES ('3153', '1920', '11', '23', '苏俄租让法令颁布。');
INSERT INTO `history_today` VALUES ('3154', '1925', '11', '23', '国民党右派召开西山会议排斥共产党人。');
INSERT INTO `history_today` VALUES ('3155', '1936', '11', '23', '“七君子”事件。');
INSERT INTO `history_today` VALUES ('3156', '1979', '11', '23', '三k党在美国南部再次活跃。');
INSERT INTO `history_today` VALUES ('3157', '1982', '11', '23', '安德罗波夫出任苏共总书记。');
INSERT INTO `history_today` VALUES ('3158', '1983', '11', '23', '中共中央总书记胡耀邦对日本进行友好访问。');
INSERT INTO `history_today` VALUES ('3159', '1988', '11', '23', '意大利培养成功艾滋病试验鼠。');
INSERT INTO `history_today` VALUES ('3160', '1993', '11', '23', '古巴政府向江泽民授勋。');
INSERT INTO `history_today` VALUES ('3161', '1859', '11', '24', '达尔文《物种起源》正式出版。');
INSERT INTO `history_today` VALUES ('3162', '1894', '11', '24', '孙中山在檀香山创立兴中会。');
INSERT INTO `history_today` VALUES ('3163', '1923', '11', '24', '中国共产党在上海召开三届一中全会');
INSERT INTO `history_today` VALUES ('3164', '1934', '11', '24', '凯末尔被授予阿塔图克称号。');
INSERT INTO `history_today` VALUES ('3165', '1969', '11', '24', '美国宇宙飞船第二次登月');
INSERT INTO `history_today` VALUES ('3166', '1976', '11', '24', '毛主席纪念堂奠基仪式在北京举行。');
INSERT INTO `history_today` VALUES ('3167', '1980', '11', '24', '邓小平：党与党的关系应该是平等的和同志式的关系');
INSERT INTO `history_today` VALUES ('3168', '1982', '11', '24', '全国政协五届五次会议在北京举行 邓小平主持。');
INSERT INTO `history_today` VALUES ('3169', '1987', '11', '24', '钱坤喜研制成电动全人工心脏。');
INSERT INTO `history_today` VALUES ('3170', '1988', '11', '24', '世界最大木板典籍《乾隆版大藏经》重印');
INSERT INTO `history_today` VALUES ('3171', '1928', '11', '25', '毛泽东总结井冈山武装斗争经验。');
INSERT INTO `history_today` VALUES ('3172', '1936', '11', '25', '日德反共产国际协定签订');
INSERT INTO `history_today` VALUES ('3173', '1951', '11', '25', '《人民日报》发表了《大家都来做广播体操》的文章。');
INSERT INTO `history_today` VALUES ('3174', '1952', '11', '25', '阿加莎·克里斯蒂的名剧捕鼠器在伦敦首演。');
INSERT INTO `history_today` VALUES ('3175', '1958', '11', '25', '三门峡截流成功');
INSERT INTO `history_today` VALUES ('3176', '1975', '11', '25', '苏里南共和国宣告独立');
INSERT INTO `history_today` VALUES ('3177', '1982', '11', '25', '中央军委授予张华荣誉称号');
INSERT INTO `history_today` VALUES ('3178', '1983', '11', '25', '第六届全国人大常委会第三次会议在京举行。');
INSERT INTO `history_today` VALUES ('3179', '1992', '11', '25', '《解体法》。');
INSERT INTO `history_today` VALUES ('3180', '1835', '11', '25', '安德鲁·卡内基，美国钢铁大王。');
INSERT INTO `history_today` VALUES ('3181', '1580', '11', '26', '法国第七次宗教战争结束。');
INSERT INTO `history_today` VALUES ('3182', '1905', '11', '26', '中国同盟会机关报《民报》创刊。');
INSERT INTO `history_today` VALUES ('3183', '1919', '11', '26', '青年共产国际成立。');
INSERT INTO `history_today` VALUES ('3184', '1922', '11', '26', '埃及法老图坦卡蒙墓开放。');
INSERT INTO `history_today` VALUES ('3185', '1940', '11', '26', '德国将华沙的犹太人驱进犹太人居住区');
INSERT INTO `history_today` VALUES ('3186', '1942', '11', '26', '铁托率领的南斯拉夫游击队在波斯尼亚比哈奇组织召开了南斯拉夫反法西斯人民解放委员会的第1次会议。');
INSERT INTO `history_today` VALUES ('3187', '1943', '11', '26', '陕甘宁边区劳动英雄大会召开。');
INSERT INTO `history_today` VALUES ('3188', '1950', '11', '26', '朝鲜战争第二次战役爆发。');
INSERT INTO `history_today` VALUES ('3189', '1951', '11', '26', '中国人民保卫儿童全国委员会成立，宋庆龄任主席。');
INSERT INTO `history_today` VALUES ('3190', '1965', '11', '26', '法国发射第一个人造地球卫星');
INSERT INTO `history_today` VALUES ('3191', '1902', '11', '27', '梁启超等人的《新小说》在日本创刊。');
INSERT INTO `history_today` VALUES ('3192', '1907', '11', '27', '割让刚果给比利时的条约签订。');
INSERT INTO `history_today` VALUES ('3193', '1919', '11', '27', '纳依和约签订。');
INSERT INTO `history_today` VALUES ('3194', '1925', '11', '27', '叶挺独立团组成。');
INSERT INTO `history_today` VALUES ('3195', '1948', '11', '27', '中共部署平津战役东北野战军入关。');
INSERT INTO `history_today` VALUES ('3196', '1960', '11', '27', '雷锋荣立二等功，作为立功代表在全团授奖大会上发言。');
INSERT INTO `history_today` VALUES ('3197', '1961', '11', '27', '苏联制成世界上第一个月球仪。');
INSERT INTO `history_today` VALUES ('3198', '1962', '11', '27', '波音727飞机试飞。');
INSERT INTO `history_today` VALUES ('3199', '1990', '11', '27', '马卓安当选为英国首相。');
INSERT INTO `history_today` VALUES ('3200', '1997', '11', '27', '证明爱因斯坦清白无辜。');
INSERT INTO `history_today` VALUES ('3201', '1912', '11', '28', '阿尔巴尼亚独立');
INSERT INTO `history_today` VALUES ('3202', '1920', '11', '28', '孙中山返广州重组军政府');
INSERT INTO `history_today` VALUES ('3203', '1923', '11', '28', '共产国际作出“中国问题”的决议案。');
INSERT INTO `history_today` VALUES ('3204', '1935', '11', '28', '中共发表《抗日救国宣言》');
INSERT INTO `history_today` VALUES ('3205', '1943', '11', '28', '美苏英三国德黑兰会议开幕');
INSERT INTO `history_today` VALUES ('3206', '1957', '11', '28', '美国X-13喷气动力垂直起降试验机首次完成从垂直起飞到水平飞行的过渡。');
INSERT INTO `history_today` VALUES ('3207', '1958', '11', '28', '中共八届六中全会举行 通过了《关于人民公社若干问题的决议》');
INSERT INTO `history_today` VALUES ('3208', '1960', '11', '28', '中共中央对《甘肃省委关于贯彻中央紧急指示信的第四次报告》作了重要批示。');
INSERT INTO `history_today` VALUES ('3209', '1960', '11', '28', '毛里塔尼亚宣布建立独立的伊斯兰共和国。');
INSERT INTO `history_today` VALUES ('3210', '1964', '11', '28', '水手四号发回第一批火星照片');
INSERT INTO `history_today` VALUES ('3211', '0', '11', '29', '国民党进步人士邓演达被害');
INSERT INTO `history_today` VALUES ('3212', '1941', '11', '29', '苏联英雄卓娅遇难纪');
INSERT INTO `history_today` VALUES ('3213', '1947', '11', '29', '联合国通过关于巴勒斯坦分治的决议');
INSERT INTO `history_today` VALUES ('3214', '1953', '11', '29', '法国伞兵部队在老挝边境着陆');
INSERT INTO `history_today` VALUES ('3215', '1973', '11', '29', '甘肃发现完整剑齿象化石');
INSERT INTO `history_today` VALUES ('3216', '1977', '11', '29', '我国首播外国电视剧');
INSERT INTO `history_today` VALUES ('3217', '1983', '11', '29', '我国首次发行“票中票”');
INSERT INTO `history_today` VALUES ('3218', '1986', '11', '29', '“实践号”考察船完成黑潮调查任务');
INSERT INTO `history_today` VALUES ('3219', '1986', '11', '29', '拉丁美洲民主政党论坛成立');
INSERT INTO `history_today` VALUES ('3220', '1995', '11', '29', '十世班禅转世灵童金瓶掣签在拉萨举行');
INSERT INTO `history_today` VALUES ('3221', '1609', '11', '30', '伽利略第一次用望远镜观测月球。');
INSERT INTO `history_today` VALUES ('3222', '1924', '11', '30', '人类首次通过无线电波将一张图片传送过大西洋。');
INSERT INTO `history_today` VALUES ('3223', '1939', '11', '30', '冬季战争爆发。');
INSERT INTO `history_today` VALUES ('3224', '1939', '11', '30', '苏芬战争爆发');
INSERT INTO `history_today` VALUES ('3225', '1949', '11', '30', '重庆解放');
INSERT INTO `history_today` VALUES ('3226', '1962', '11', '30', '缅甸人吴丹当选为联合国秘书长。');
INSERT INTO `history_today` VALUES ('3227', '1966', '11', '30', '巴巴多斯脱离英国殖民统治，宣告独立。');
INSERT INTO `history_today` VALUES ('3228', '1986', '11', '30', '全国第一个舆论研究机构成立');
INSERT INTO `history_today` VALUES ('3229', '1993', '11', '30', '中国性病艾滋病防治协会成立');
INSERT INTO `history_today` VALUES ('3230', '1994', '11', '30', '全国组织工作会议在北京举行。');
INSERT INTO `history_today` VALUES ('3231', '1640', '12', '1', '葡萄牙脱离哈布斯堡王朝统治，恢复独立。');
INSERT INTO `history_today` VALUES ('3232', '1821', '12', '1', '哥斯达黎加制定第一部宪法。');
INSERT INTO `history_today` VALUES ('3233', '1918', '12', '1', '特兰西瓦尼亚分别宣布与罗马尼亚合并，因而成为罗马尼亚的国庆日。');
INSERT INTO `history_today` VALUES ('3234', '1925', '12', '1', '《洛迦诺公约》在伦敦正式签署。');
INSERT INTO `history_today` VALUES ('3235', '1934', '12', '1', '苏联领导人基洛夫被暗杀');
INSERT INTO `history_today` VALUES ('3236', '1937', '12', '1', '南京保卫战开始');
INSERT INTO `history_today` VALUES ('3237', '1959', '12', '1', '《南极条约》签署');
INSERT INTO `history_today` VALUES ('3238', '1991', '12', '1', '乌克兰全民公决，决定脱离苏联独立');
INSERT INTO `history_today` VALUES ('3239', '1999', '12', '1', '科学家完整破译第22对人体染色体遗传密码。');
INSERT INTO `history_today` VALUES ('3240', '1081', '12', '1', '法国国王路易六世出生。');
INSERT INTO `history_today` VALUES ('3241', '1804', '12', '2', '拿破仑·波拿巴加冕为法兰西第一帝国皇帝。');
INSERT INTO `history_today` VALUES ('3242', '1823', '12', '2', '反对西欧在西半球扩张的美国的门罗主义出笼，《门罗宣言》发表。');
INSERT INTO `history_today` VALUES ('3243', '1907', '12', '2', '镇南关起义爆发。');
INSERT INTO `history_today` VALUES ('3244', '1908', '12', '2', '末代皇帝溥仪登基');
INSERT INTO `history_today` VALUES ('3245', '1929', '12', '2', '北平周口店发现中国猿人头盖骨');
INSERT INTO `history_today` VALUES ('3246', '1942', '12', '2', '在意大利物理学家费米的主持下，美国建立了世界上第一座原子反应堆。');
INSERT INTO `history_today` VALUES ('3247', '1942', '12', '2', '原子裂变成功');
INSERT INTO `history_today` VALUES ('3248', '1949', '12', '2', '中央决定发行人民胜利公债。');
INSERT INTO `history_today` VALUES ('3249', '1971', '12', '2', '阿拉伯联合酋长国正式宣布成立。');
INSERT INTO `history_today` VALUES ('3250', '1975', '12', '2', '毛泽东主席会见美国总统福特。');
INSERT INTO `history_today` VALUES ('3251', '1912', '12', '3', '第一次巴尔干战争结束。');
INSERT INTO `history_today` VALUES ('3252', '1971', '12', '3', '印度对巴基斯坦发动全面进攻');
INSERT INTO `history_today` VALUES ('3253', '1980', '12', '3', '中共中央、国务院作出《关于普及小学教育若干问题的决定》。');
INSERT INTO `history_today` VALUES ('3254', '1982', '12', '3', '联合国大会通过《关于残疾人的世界行动纲领》。');
INSERT INTO `history_today` VALUES ('3255', '1984', '12', '3', '中共中央、国务院发出《关于严禁党政机关和党政干部经商、办企业的决定》。');
INSERT INTO `history_today` VALUES ('3256', '1984', '12', '3', '法国首次举行使用微机比赛');
INSERT INTO `history_today` VALUES ('3257', '1984', '12', '3', '印度博帕尔发生特大毒气外泄,');
INSERT INTO `history_today` VALUES ('3258', '1985', '12', '3', '我国第一条货轮海运邮路开通');
INSERT INTO `history_today` VALUES ('3259', '1989', '12', '3', '世界首例肝心肾移植成功');
INSERT INTO `history_today` VALUES ('3260', '1990', '12', '3', '德国统一后首次大选揭晓');
INSERT INTO `history_today` VALUES ('3261', '1931', '12', '4', '巴金完成长篇小说《家》。');
INSERT INTO `history_today` VALUES ('3262', '1935', '12', '4', '美国拉什莫尔山国家纪念碑开始动工兴建。');
INSERT INTO `history_today` VALUES ('3263', '1936', '12', '4', '蒋介石赴西安促张、杨“进剿”陕北。');
INSERT INTO `history_today` VALUES ('3264', '1958', '12', '4', '达荷美（现在的贝宁）宣布为共和国。');
INSERT INTO `history_today` VALUES ('3265', '1965', '12', '4', '美国发射“双子星座七号”宇宙飞船。');
INSERT INTO `history_today` VALUES ('3266', '1967', '12', '4', '世界上第一例心脏移植手术在南非开普敦的一家医院获得成功。');
INSERT INTO `history_today` VALUES ('3267', '1971', '12', '4', '印度军队在东巴基斯坦发动攻势，空军袭击西巴基斯坦重要机场。');
INSERT INTO `history_today` VALUES ('3268', '1977', '12', '4', '中非帝国皇帝博卡萨为自己靡费加冕。');
INSERT INTO `history_today` VALUES ('3269', '1982', '12', '4', '五届人大五次会议通过新宪法。');
INSERT INTO `history_today` VALUES ('3270', '1986', '12', '4', '苏联绘制出第一张太空地质图。');
INSERT INTO `history_today` VALUES ('3271', '1893', '12', '5', '中英签订《中英会议藏印条款》。');
INSERT INTO `history_today` VALUES ('3272', '1913', '12', '5', '英国禁止向爱尔兰运送武器。');
INSERT INTO `history_today` VALUES ('3273', '1926', '12', '5', '郭松龄与张作霖在东北混战');
INSERT INTO `history_today` VALUES ('3274', '1936', '12', '5', '苏联通过了建国后的第三部宪法。');
INSERT INTO `history_today` VALUES ('3275', '1939', '12', '5', '国民党第一次反共高潮开始。');
INSERT INTO `history_today` VALUES ('3276', '1940', '12', '5', '百团大战胜利结束。');
INSERT INTO `history_today` VALUES ('3277', '1941', '12', '5', '苏联在莫斯科城下向德军发起反攻。');
INSERT INTO `history_today` VALUES ('3278', '1955', '12', '5', '美国劳联和产联合并。');
INSERT INTO `history_today` VALUES ('3279', '1971', '12', '5', '苏联在安理会中否决敦促印巴停止在克什米尔敌对行动的决议。');
INSERT INTO `history_today` VALUES ('3280', '1977', '12', '5', '埃及同敌视埃及和平倡议的5个阿拉伯国家断交。');
INSERT INTO `history_today` VALUES ('3281', '1768', '12', '6', '《大不列颠百科全书》第一版出版。');
INSERT INTO `history_today` VALUES ('3282', '1877', '12', '6', '《华盛顿邮报》开始出版。');
INSERT INTO `history_today` VALUES ('3283', '1877', '12', '6', '发明大王爱迪生展出了他发明的世界上第一台留声机。');
INSERT INTO `history_today` VALUES ('3284', '1905', '12', '6', '探险家阿蒙森探明地球磁极。');
INSERT INTO `history_today` VALUES ('3285', '1917', '12', '6', '芬兰宣布独立。');
INSERT INTO `history_today` VALUES ('3286', '1917', '12', '6', '芬兰宣布独立');
INSERT INTO `history_today` VALUES ('3287', '1921', '12', '6', '爱尔兰摆脱英国统治争取独立的运动，终于获得了成功。');
INSERT INTO `history_today` VALUES ('3288', '1922', '12', '6', '爱尔兰自由邦成立');
INSERT INTO `history_today` VALUES ('3289', '1928', '12', '6', '玻利维亚和巴拉圭战争开始。');
INSERT INTO `history_today` VALUES ('3290', '1929', '12', '6', '土耳其妇女开始享有选举权。');
INSERT INTO `history_today` VALUES ('3291', '1916', '12', '7', '劳合·乔治出任英国首相。');
INSERT INTO `history_today` VALUES ('3292', '1957', '12', '7', '第一个卫星的运载火箭陨落。');
INSERT INTO `history_today` VALUES ('3293', '1971', '12', '7', '中国与塞内加尔建交。');
INSERT INTO `history_today` VALUES ('3294', '1975', '12', '7', '葡萄牙同印度尼西亚断交。');
INSERT INTO `history_today` VALUES ('3295', '1976', '12', '7', '我国又成功地发射一颗人造地球卫星。');
INSERT INTO `history_today` VALUES ('3296', '1976', '12', '7', '瓦尔德海姆联合国继任联合国秘书长。');
INSERT INTO `history_today` VALUES ('3297', '1985', '12', '7', '中国和尼加拉瓜建立外交关系。');
INSERT INTO `history_today` VALUES ('3298', '1985', '12', '7', '南亚七国区域合作首脑会议在孟加拉国首都达卡开幕。');
INSERT INTO `history_today` VALUES ('3299', '1987', '12', '7', '我国首次将电子能量加速到千兆电子伏。');
INSERT INTO `history_today` VALUES ('3300', '1991', '12', '7', '美国研制出全数字电视系统。');
INSERT INTO `history_today` VALUES ('3301', '1920', '12', '8', '西北五马联合自治');
INSERT INTO `history_today` VALUES ('3302', '1941', '12', '8', '太平洋战争爆发，中共中央发表宣言。');
INSERT INTO `history_today` VALUES ('3303', '1947', '12', '8', '中共中央召开会议讨论研究当前形势和党的政策。');
INSERT INTO `history_today` VALUES ('3304', '1952', '12', '8', '摩洛哥人民开始反对法国殖民者的武装反抗。');
INSERT INTO `history_today` VALUES ('3305', '1953', '12', '8', '美国在联合国大会建议国际控制原子能。');
INSERT INTO `history_today` VALUES ('3306', '1958', '12', '8', '全非人民大会召开');
INSERT INTO `history_today` VALUES ('3307', '1965', '12', '8', '毛泽东主持中共中央政治局常委扩大会议。');
INSERT INTO `history_today` VALUES ('3308', '1971', '12', '8', '中国与冰岛建交。');
INSERT INTO `history_today` VALUES ('3309', '1985', '12', '8', '南亚国家区域联盟成立。');
INSERT INTO `history_today` VALUES ('3310', '1987', '12', '8', '美苏签署销毁中程和中短程导弹条约签字。');
INSERT INTO `history_today` VALUES ('3311', '1917', '12', '9', '葡萄牙共和政府垮台。');
INSERT INTO `history_today` VALUES ('3312', '1935', '12', '9', '“一二·九”运动。');
INSERT INTO `history_today` VALUES ('3313', '1935', '12', '9', '红军表示与东北抗日联军一致抗日。');
INSERT INTO `history_today` VALUES ('3314', '1941', '12', '9', '中国政府对日、德、意宣战。');
INSERT INTO `history_today` VALUES ('3315', '1948', '12', '9', '联合国大会通过《防止及惩治灭绝种族罪公约》。');
INSERT INTO `history_today` VALUES ('3316', '1949', '12', '9', '云南、西康和平解放。');
INSERT INTO `history_today` VALUES ('3317', '1958', '12', '9', '黄河三门峡截流工程结束。');
INSERT INTO `history_today` VALUES ('3318', '1959', '12', '9', '中国政府抗议印尼反华排华。');
INSERT INTO `history_today` VALUES ('3319', '1961', '12', '9', '坦噶尼喀宣布独立。');
INSERT INTO `history_today` VALUES ('3320', '1966', '12', '9', '中央发布抓革命、促生产十条规定。');
INSERT INTO `history_today` VALUES ('3321', '1898', '12', '10', '美国和西班牙和平条约');
INSERT INTO `history_today` VALUES ('3322', '1898', '12', '10', '巴黎条约。');
INSERT INTO `history_today` VALUES ('3323', '1901', '12', '10', '瑞典首次颁发诺贝尔奖');
INSERT INTO `history_today` VALUES ('3324', '1903', '12', '10', '英军再次侵入西藏。');
INSERT INTO `history_today` VALUES ('3325', '1931', '12', '10', '国联决议组织调查团来华。');
INSERT INTO `history_today` VALUES ('3326', '1937', '12', '10', '科学家发现爪哇人。');
INSERT INTO `history_today` VALUES ('3327', '1941', '12', '10', '美国对德国、意大利宣战。');
INSERT INTO `history_today` VALUES ('3328', '1941', '12', '10', '中国军队开始入缅对日作战。');
INSERT INTO `history_today` VALUES ('3329', '1944', '12', '10', '中日豫湘桂战役结束。');
INSERT INTO `history_today` VALUES ('3330', '1948', '12', '10', '《世界人权宣言》通过并发表。');
INSERT INTO `history_today` VALUES ('3331', '1903', '12', '11', '殷墟甲骨开始流失国外。');
INSERT INTO `history_today` VALUES ('3332', '1914', '12', '11', '日本内阁通过对华“二十一条”。');
INSERT INTO `history_today` VALUES ('3333', '1915', '12', '11', '袁世凯称帝。');
INSERT INTO `history_today` VALUES ('3334', '1927', '12', '11', '广州起义爆发。');
INSERT INTO `history_today` VALUES ('3335', '1929', '12', '11', '百色起义。');
INSERT INTO `history_today` VALUES ('3336', '1948', '12', '11', '平津战役基本解放了华北地区。');
INSERT INTO `history_today` VALUES ('3337', '1949', '12', '11', '广西全境解放。');
INSERT INTO `history_today` VALUES ('3338', '1961', '12', '11', '美国对南越反共战争的第一次直接军事支持。');
INSERT INTO `history_today` VALUES ('3339', '1961', '12', '11', '唐代长安城遗址被发掘出来。');
INSERT INTO `history_today` VALUES ('3340', '1964', '12', '11', '美在南越推行“特种战争”。');
INSERT INTO `history_today` VALUES ('3341', '1642', '12', '12', '荷兰航海家塔斯曼发现新西兰。');
INSERT INTO `history_today` VALUES ('3342', '1804', '12', '12', '西班牙对英国宣战。并发起战争。');
INSERT INTO `history_today` VALUES ('3343', '1887', '12', '12', '土耳其向西方国家呼吁，要求调解同俄国的战争。');
INSERT INTO `history_today` VALUES ('3344', '1925', '12', '12', '伊朗巴列维王朝建立。');
INSERT INTO `history_today` VALUES ('3345', '1936', '12', '12', '西安事变爆发');
INSERT INTO `history_today` VALUES ('3346', '1948', '12', '12', '唐山解放。');
INSERT INTO `history_today` VALUES ('3347', '1949', '12', '12', '中国收复南沙群岛。');
INSERT INTO `history_today` VALUES ('3348', '1952', '12', '12', '毕加索把新作和平鸽献给世界和平大会。');
INSERT INTO `history_today` VALUES ('3349', '1954', '12', '12', '中央军委召开扩大会议划分军区 。');
INSERT INTO `history_today` VALUES ('3350', '1963', '12', '12', '肯尼亚独立。');
INSERT INTO `history_today` VALUES ('3351', '1897', '12', '13', '俄国军队占领中国的旅顺港。');
INSERT INTO `history_today` VALUES ('3352', '1913', '12', '13', '世界名画《蒙娜·丽莎》失而复得。');
INSERT INTO `history_today` VALUES ('3353', '1921', '12', '13', '四国在华盛顿签订海军条约。');
INSERT INTO `history_today` VALUES ('3354', '1924', '12', '13', '《现代评论》创刊。');
INSERT INTO `history_today` VALUES ('3355', '1937', '12', '13', '南京大屠杀');
INSERT INTO `history_today` VALUES ('3356', '1964', '12', '13', '中华人民共和国主席特赦令。');
INSERT INTO `history_today` VALUES ('3357', '1971', '12', '13', '美、法总统发表联合公报宣布美元贬值。');
INSERT INTO `history_today` VALUES ('3358', '1978', '12', '13', '邓小平的讲话成为党十一届三中全会的主题报告。');
INSERT INTO `history_today` VALUES ('3359', '1979', '12', '13', '美国试验成功三叉戟Ⅰ式导弹。');
INSERT INTO `history_today` VALUES ('3360', '1981', '12', '13', '阿根廷发生纸币风波。');
INSERT INTO `history_today` VALUES ('3361', '1408', '12', '14', '《永乐大典》。');
INSERT INTO `history_today` VALUES ('3362', '1905', '12', '14', '伊朗革命爆发。');
INSERT INTO `history_today` VALUES ('3363', '1906', '12', '14', '普朗克首创“量子论”。');
INSERT INTO `history_today` VALUES ('3364', '1911', '12', '14', '挪威探险家阿蒙森成为到达南极的第一人。');
INSERT INTO `history_today` VALUES ('3365', '1920', '12', '14', '爱尔兰被一分为二。');
INSERT INTO `history_today` VALUES ('3366', '1927', '12', '14', '国民政府与苏联断交。');
INSERT INTO `history_today` VALUES ('3367', '1927', '12', '14', '英国承认伊拉克独立。');
INSERT INTO `history_today` VALUES ('3368', '1931', '12', '14', '宁都起义。');
INSERT INTO `history_today` VALUES ('3369', '1960', '12', '14', '我国与索马里建交。');
INSERT INTO `history_today` VALUES ('3370', '1960', '12', '14', '联大通过关于给殖民地独立的宣言。');
INSERT INTO `history_today` VALUES ('3371', '1912', '12', '15', '北京政府颁布《戒严法》');
INSERT INTO `history_today` VALUES ('3372', '1931', '12', '15', '蒋介石第二次下野');
INSERT INTO `history_today` VALUES ('3373', '1931', '12', '15', '黄显声组建“辽宁抗日义勇军”');
INSERT INTO `history_today` VALUES ('3374', '1944', '12', '15', '美国建立五星上将军衔');
INSERT INTO `history_today` VALUES ('3375', '1949', '12', '15', '中国人民外交学会成立');
INSERT INTO `history_today` VALUES ('3376', '1965', '12', '15', '美国两艘飞船在太空轨道相会');
INSERT INTO `history_today` VALUES ('3377', '1978', '12', '15', '《天安门诗抄》出版');
INSERT INTO `history_today` VALUES ('3378', '1982', '12', '15', '首届茅盾文学奖授奖仪式举行');
INSERT INTO `history_today` VALUES ('3379', '1988', '12', '15', '北大研制出新一代电子出版系统');
INSERT INTO `history_today` VALUES ('3380', '1989', '12', '15', '第4个《洛美协定》签署');
INSERT INTO `history_today` VALUES ('3381', '1773', '12', '16', '波士顿倾茶事件。');
INSERT INTO `history_today` VALUES ('3382', '1890', '12', '16', '人类第一次利用血清注射治疗疾病获得成功。');
INSERT INTO `history_today` VALUES ('3383', '1917', '12', '16', '俄国签署停战协议。');
INSERT INTO `history_today` VALUES ('3384', '1920', '12', '16', '宁夏海源大地震二十三万人丧生');
INSERT INTO `history_today` VALUES ('3385', '1927', '12', '16', '桂系与粤系开战');
INSERT INTO `history_today` VALUES ('3386', '1944', '12', '16', '德军在阿登进行“狮鹫”反攻计划');
INSERT INTO `history_today` VALUES ('3387', '1945', '12', '16', '中共派代表赴重庆参加政协会议。');
INSERT INTO `history_today` VALUES ('3388', '1945', '12', '16', '中国民主建国会成立。');
INSERT INTO `history_today` VALUES ('3389', '1949', '12', '16', '毛泽东率中国代表团访问苏联');
INSERT INTO `history_today` VALUES ('3390', '1961', '12', '16', '巴林国国庆（酋长即位日）。');
INSERT INTO `history_today` VALUES ('3391', '1538', '12', '17', '罗马教皇宣布开除亨利八世教籍 。');
INSERT INTO `history_today` VALUES ('3392', '1888', '12', '17', '北洋水师在威海刘公岛成立。');
INSERT INTO `history_today` VALUES ('3393', '1903', '12', '17', '莱特兄弟试飞人类第一架飞机成功。');
INSERT INTO `history_today` VALUES ('3394', '1931', '12', '17', '中国南京发生珍珠桥惨案。');
INSERT INTO `history_today` VALUES ('3395', '1941', '12', '17', '中共施行“精兵简政”。');
INSERT INTO `history_today` VALUES ('3396', '1946', '12', '17', '中共北满部队一下江南。');
INSERT INTO `history_today` VALUES ('3397', '1962', '12', '17', '美当局宣告中共“有罪”。');
INSERT INTO `history_today` VALUES ('3398', '1971', '12', '17', '印度和东巴基斯坦之间双方达成停火协议 。');
INSERT INTO `history_today` VALUES ('3399', '1971', '12', '17', '民主德国和联邦德国签定了交通运输协议。');
INSERT INTO `history_today` VALUES ('3400', '1986', '12', '17', '世界第一例心肺肝同时移植手术取得成功。');
INSERT INTO `history_today` VALUES ('3401', '1949', '12', '18', '奥威尔著新著《一九八四年》发表');
INSERT INTO `history_today` VALUES ('3402', '1969', '12', '18', '英国废除死刑');
INSERT INTO `history_today` VALUES ('3403', '1971', '12', '18', '美元在第二次世界大战后首次贬值');
INSERT INTO `history_today` VALUES ('3404', '1978', '12', '18', '中国共产党十一届三中全会召开');
INSERT INTO `history_today` VALUES ('3405', '1979', '12', '18', '消除对妇女一切形式歧视公约通过');
INSERT INTO `history_today` VALUES ('3406', '1987', '12', '18', '我国制成第一部完全国产化机器人');
INSERT INTO `history_today` VALUES ('3407', '1994', '12', '18', '我首台光学雨量计问世');
INSERT INTO `history_today` VALUES ('3408', '1994', '12', '18', '俄罗斯联邦派兵进入车臣');
INSERT INTO `history_today` VALUES ('3409', '1938', '12', '18', '中译本《西行漫记》公开发行');
INSERT INTO `history_today` VALUES ('3410', '1978', '12', '18', '我国参加首次全球大气试验');
INSERT INTO `history_today` VALUES ('3411', '1280', '12', '19', '《授时历》。');
INSERT INTO `history_today` VALUES ('3412', '1793', '12', '19', '土伦之役：拿破仑·波拿巴占领土伦。');
INSERT INTO `history_today` VALUES ('3413', '1945', '12', '19', '越南、老挝、柬埔寨抗法救国战争全面爆发。');
INSERT INTO `history_today` VALUES ('3414', '1957', '12', '19', '欧洲各国同意在欧洲部署核武器。');
INSERT INTO `history_today` VALUES ('3415', '1960', '12', '19', '中国与柬埔寨王国缔结友好和互不侵犯条约。');
INSERT INTO `history_today` VALUES ('3416', '1972', '12', '19', '最后一次“阿波罗”登月计划结束');
INSERT INTO `history_today` VALUES ('3417', '1979', '12', '19', '日本学者首次确定致癌遗传基因结构。');
INSERT INTO `history_today` VALUES ('3418', '1984', '12', '19', '美国正式退出联合国教科文组织。');
INSERT INTO `history_today` VALUES ('3419', '1988', '12', '19', '印度总理拉吉夫·甘地访问我国。');
INSERT INTO `history_today` VALUES ('3420', '1994', '12', '19', '香港回归倒计时牌在天安门广场矗立。');
INSERT INTO `history_today` VALUES ('3421', '1582', '12', '20', '法国采用格利高利历法。');
INSERT INTO `history_today` VALUES ('3422', '1860', '12', '20', '南卡罗莱那州宣布脱离美国。');
INSERT INTO `history_today` VALUES ('3423', '1912', '12', '20', '土耳其和巴尔干国家举行伦敦和会。');
INSERT INTO `history_today` VALUES ('3424', '1917', '12', '20', '全俄肃反委员会成立。');
INSERT INTO `history_today` VALUES ('3425', '1945', '12', '20', '马歇尔来华调停国共关系');
INSERT INTO `history_today` VALUES ('3426', '1948', '12', '20', '天津战役开始');
INSERT INTO `history_today` VALUES ('3427', '1958', '12', '20', '我国与阿尔及利亚建交。');
INSERT INTO `history_today` VALUES ('3428', '1959', '12', '20', '苏联制成世界上第一架电子排版机');
INSERT INTO `history_today` VALUES ('3429', '1960', '12', '20', '越南南方民族解放阵线成立');
INSERT INTO `history_today` VALUES ('3430', '1973', '12', '20', '西班牙总理布兰科被炸身亡');
INSERT INTO `history_today` VALUES ('3431', '1921', '12', '21', '苏俄电气化计划批准');
INSERT INTO `history_today` VALUES ('3432', '1935', '12', '21', '载客21人的DC-3型飞机试航');
INSERT INTO `history_today` VALUES ('3433', '1967', '12', '21', '人类首次心脏移植手术成功');
INSERT INTO `history_today` VALUES ('3434', '1973', '12', '21', '中东和平会议在日内瓦举行');
INSERT INTO `history_today` VALUES ('3435', '1991', '12', '21', '钱塘江第二大桥建成');
INSERT INTO `history_today` VALUES ('3436', '1993', '12', '21', '美国信息高速公路政策初步成型');
INSERT INTO `history_today` VALUES ('3437', '1995', '12', '21', '克林顿同意交出“白水事件”材料');
INSERT INTO `history_today` VALUES ('3438', '1945', '12', '21', '美国将军巴顿逝世');
INSERT INTO `history_today` VALUES ('3439', '1965', '12', '21', '黄炎培逝世');
INSERT INTO `history_today` VALUES ('3440', '1972', '12', '21', '关于东西德关系的基础条约签订');
INSERT INTO `history_today` VALUES ('3441', '1958', '12', '22', '戴高乐当选法兰西第五共和国首任总统');
INSERT INTO `history_today` VALUES ('3442', '1970', '12', '22', '周恩来主持召开华北会议。');
INSERT INTO `history_today` VALUES ('3443', '1971', '12', '22', '孟加拉共和国建立。');
INSERT INTO `history_today` VALUES ('3444', '1972', '12', '22', '中国与新西兰建交');
INSERT INTO `history_today` VALUES ('3445', '1978', '12', '22', '中国共产党十一届三中全会在北京闭幕。');
INSERT INTO `history_today` VALUES ('3446', '1989', '12', '22', '罗马尼亚内战爆发。');
INSERT INTO `history_today` VALUES ('3447', '1989', '12', '22', '辽西发现史前巨型建筑');
INSERT INTO `history_today` VALUES ('3448', '1992', '12', '22', '全国财政工作会议在北京举行。');
INSERT INTO `history_today` VALUES ('3449', '1993', '12', '22', '南非临时宪法诞生');
INSERT INTO `history_today` VALUES ('3450', '1994', '12', '22', '“申根协定”确定生效日期');
INSERT INTO `history_today` VALUES ('3451', '1915', '12', '23', '《辞源》畅销全国。');
INSERT INTO `history_today` VALUES ('3452', '1941', '12', '23', '日军发动第三次长沙战役。');
INSERT INTO `history_today` VALUES ('3453', '1949', '12', '23', '全国教育工作会议召开');
INSERT INTO `history_today` VALUES ('3454', '1966', '12', '23', '结晶胰岛素。');
INSERT INTO `history_today` VALUES ('3455', '1974', '12', '23', '毛泽东同周恩来、王洪文谈话。');
INSERT INTO `history_today` VALUES ('3456', '1986', '12', '23', '超轻型飞机进行不着陆环球飞行。');
INSERT INTO `history_today` VALUES ('3457', '1987', '12', '23', '北京国际电信局开通。');
INSERT INTO `history_today` VALUES ('3458', '1988', '12', '23', '印度总理拉吉夫·甘地结束对我国的正式访问。');
INSERT INTO `history_today` VALUES ('3459', '1999', '12', '23', '科特迪瓦发生兵变政府被推翻。');
INSERT INTO `history_today` VALUES ('3460', '1974', '12', '23', '原田淑人逝世（1885年4月5日出生），日本著名考古学家、日本东洋考古学开创者之一、日本东洋风俗、服饰史研究名家。');
INSERT INTO `history_today` VALUES ('3461', '1913', '12', '24', '美国联邦储备开始');
INSERT INTO `history_today` VALUES ('3462', '1935', '12', '24', '萧红出版《生死场》轰动上海文坛');
INSERT INTO `history_today` VALUES ('3463', '1942', '12', '24', '美国海军上将达尔朗被暗杀');
INSERT INTO `history_today` VALUES ('3464', '1956', '12', '24', '英法军队撤离苏伊士');
INSERT INTO `history_today` VALUES ('3465', '1964', '12', '24', '西贡美国军官宿舍大楼大爆炸');
INSERT INTO `history_today` VALUES ('3466', '1979', '12', '24', '西欧联合发射‘阿丽阿娜’火箭成功');
INSERT INTO `history_today` VALUES ('3467', '1980', '12', '24', '中非共和国法庭判处前皇帝博卡萨死刑');
INSERT INTO `history_today` VALUES ('3468', '1986', '12', '24', '我国开始实行科技统计报告制度');
INSERT INTO `history_today` VALUES ('3469', '1987', '12', '24', '成渝铁路电气化工程建成');
INSERT INTO `history_today` VALUES ('3470', '1987', '12', '24', '天文学家推断耶稣诞生日期');
INSERT INTO `history_today` VALUES ('3471', '1935', '12', '25', '瓦窑堡会议召开。');
INSERT INTO `history_today` VALUES ('3472', '1935', '12', '25', '中共中央在瓦窑堡召开扩大会议。');
INSERT INTO `history_today` VALUES ('3473', '1946', '12', '25', '国民大会通过《中华民国宪法》。');
INSERT INTO `history_today` VALUES ('3474', '1947', '12', '25', '十二月会议召开。');
INSERT INTO `history_today` VALUES ('3475', '1948', '12', '25', '荷兰攻占印尼茉莉芬城');
INSERT INTO `history_today` VALUES ('3476', '1954', '12', '25', '康藏、青藏公路正式通车');
INSERT INTO `history_today` VALUES ('3477', '1970', '12', '25', '毛泽东批准兴建葛洲坝工程。');
INSERT INTO `history_today` VALUES ('3478', '1978', '12', '25', '越南侵柬战争爆发');
INSERT INTO `history_today` VALUES ('3479', '1990', '12', '25', '中共十三届七中全会在北京举行。');
INSERT INTO `history_today` VALUES ('3480', '1991', '12', '25', '苏联解体');
INSERT INTO `history_today` VALUES ('3481', '1898', '12', '26', '居里夫人发现镭。');
INSERT INTO `history_today` VALUES ('3482', '1941', '12', '26', '第二次世界大战中，美国宣布马尼拉是不设防城市。');
INSERT INTO `history_today` VALUES ('3483', '1957', '12', '26', '第一届亚非人民团结大会在埃及首都开罗召开。');
INSERT INTO `history_today` VALUES ('3484', '1962', '12', '26', '中国与蒙古签订边界条约。');
INSERT INTO `history_today` VALUES ('3485', '1962', '12', '26', '中蒙边界条约在北京签订');
INSERT INTO `history_today` VALUES ('3486', '1966', '12', '26', '中国研制的中程火箭首次飞行试验基本成功。');
INSERT INTO `history_today` VALUES ('3487', '1974', '12', '26', '苏联把不载人的科学空间站发射到地球轨道。');
INSERT INTO `history_today` VALUES ('3488', '1976', '12', '26', '毛泽东《论十大关系》重新发表。');
INSERT INTO `history_today` VALUES ('3489', '1978', '12', '26', '我国第二条交通大干线枝柳铁路通车。');
INSERT INTO `history_today` VALUES ('3490', '1983', '12', '26', '海冰101号在上海下水。');
INSERT INTO `history_today` VALUES ('3491', '1831', '12', '27', '英国博物学家达尔文开始环球航行。');
INSERT INTO `history_today` VALUES ('3492', '1930', '12', '27', '中国工农红军第一次反围剿战争开始。');
INSERT INTO `history_today` VALUES ('3493', '1945', '12', '27', '国际货币基金组织和世界银行成立。');
INSERT INTO `history_today` VALUES ('3494', '1947', '12', '27', '希腊政府解散共产党和民族解放阵线。');
INSERT INTO `history_today` VALUES ('3495', '1948', '12', '27', '国民党政府盗运第一、二批文物离京。');
INSERT INTO `history_today` VALUES ('3496', '1968', '12', '27', '首批绕月飞行的宇航员平安返回地球。');
INSERT INTO `history_today` VALUES ('3497', '1974', '12', '27', '我国第一条“地下大动脉。');
INSERT INTO `history_today` VALUES ('3498', '1979', '12', '27', '苏联入侵阿富汗');
INSERT INTO `history_today` VALUES ('3499', '1981', '12', '27', '中华全国台湾同胞联谊会成立。');
INSERT INTO `history_today` VALUES ('3500', '1984', '12', '27', '我国首批考察队员登上南极洲，在乔治岛上准备建站。');
INSERT INTO `history_today` VALUES ('3501', '1929', '12', '28', '红军召开古田会议');
INSERT INTO `history_today` VALUES ('3502', '1942', '12', '28', '在第二次世界大战中，日本飞机轰炸印度的加尔各答。');
INSERT INTO `history_today` VALUES ('3503', '1944', '12', '28', '匈牙利临时政府对德宣战');
INSERT INTO `history_today` VALUES ('3504', '1955', '12', '28', '第五次全国手工业生产合作会议在北京结束。');
INSERT INTO `history_today` VALUES ('3505', '1964', '12', '28', '意大利国会选出新总统萨拉盖特。');
INSERT INTO `history_today` VALUES ('3506', '1964', '12', '28', '全国工作会议结束。');
INSERT INTO `history_today` VALUES ('3507', '1978', '12', '28', '国务院发明奖励条例发布');
INSERT INTO `history_today` VALUES ('3508', '1984', '12', '28', '我国第二条地铁天津地铁建成通车');
INSERT INTO `history_today` VALUES ('3509', '1985', '12', '28', '我国颁发首批专利证书。');
INSERT INTO `history_today` VALUES ('3510', '1992', '12', '28', '南京长江大桥高架桥建成。');
INSERT INTO `history_today` VALUES ('3511', '1503', '12', '29', '西班牙完全征服那不勒斯。');
INSERT INTO `history_today` VALUES ('3512', '1911', '12', '29', '起义军与袁世凯政府达成协议');
INSERT INTO `history_today` VALUES ('3513', '1911', '12', '29', '孙中山当选为临时大总统');
INSERT INTO `history_today` VALUES ('3514', '1919', '12', '29', '日食试验证明了爱因斯坦的理论。');
INSERT INTO `history_today` VALUES ('3515', '1920', '12', '29', '法国共产党成立。');
INSERT INTO `history_today` VALUES ('3516', '1928', '12', '29', '东三省改旗易帜。');
INSERT INTO `history_today` VALUES ('3517', '1932', '12', '29', '中国民权保障同盟成立。');
INSERT INTO `history_today` VALUES ('3518', '1950', '12', '29', '毛泽东所著《实践论》发表。');
INSERT INTO `history_today` VALUES ('3519', '1975', '12', '29', '云梦秦简发现。');
INSERT INTO `history_today` VALUES ('3520', '1981', '12', '29', '美国总统里根宣布对苏联实行经济制裁');
INSERT INTO `history_today` VALUES ('3521', '1918', '12', '30', '德国共产党成立');
INSERT INTO `history_today` VALUES ('3522', '1922', '12', '30', '苏维埃社会主义共和国联盟成立');
INSERT INTO `history_today` VALUES ('3523', '1930', '12', '30', '中共苏区击破蒋介石第一次“围剿”');
INSERT INTO `history_today` VALUES ('3524', '1944', '12', '30', '希腊爆发内战国王退位。');
INSERT INTO `history_today` VALUES ('3525', '1945', '12', '30', '中国民主促进会成立。');
INSERT INTO `history_today` VALUES ('3526', '1984', '12', '30', '中国南极考察队的全体队员顺利地登上了乔治岛。');
INSERT INTO `history_today` VALUES ('3527', '1993', '12', '30', '原苏军全部撤离蒙古。');
INSERT INTO `history_today` VALUES ('3528', '1994', '12', '30', '三门峡黄河公路大桥通车。');
INSERT INTO `history_today` VALUES ('3529', '1997', '12', '30', '中国和南非建交。');
INSERT INTO `history_today` VALUES ('3530', '1998', '12', '30', '新疆准噶尔盆地又诞生一个年产百万吨油田——石西油田。');
INSERT INTO `history_today` VALUES ('3531', '1915', '12', '31', '云南宣告独立护国战争爆发');
INSERT INTO `history_today` VALUES ('3532', '1931', '12', '31', '苏联第一个五年计划完成');
INSERT INTO `history_today` VALUES ('3533', '1936', '12', '31', '张学良被囚禁');
INSERT INTO `history_today` VALUES ('3534', '1947', '12', '31', '罗马尼亚王朝倒台');
INSERT INTO `history_today` VALUES ('3535', '1953', '12', '31', '搜寻“雪人”的工作开始进行');
INSERT INTO `history_today` VALUES ('3536', '1982', '12', '31', '加纳发生军事政变');
INSERT INTO `history_today` VALUES ('3537', '1986', '12', '31', '我国试行《企业破产法》');
INSERT INTO `history_today` VALUES ('3538', '1987', '12', '31', '我国核潜艇首次远航告捷');
INSERT INTO `history_today` VALUES ('3539', '1991', '12', '31', '苏联销毁最后一枚中程导弹');
INSERT INTO `history_today` VALUES ('3540', '1992', '12', '31', '我国首座超临界大型电厂投产');
INSERT INTO `history_today` VALUES ('3541', '1948', '2', '29', '宜川战役爆发');
INSERT INTO `history_today` VALUES ('3542', '1928', '2', '29', '桑植起义');
INSERT INTO `history_today` VALUES ('3543', '1856', '2', '29', '“西林教案”发生');
INSERT INTO `history_today` VALUES ('3544', '2008', '2', '29', '纪念周恩来诞辰110周年');
INSERT INTO `history_today` VALUES ('3545', '2015', '4', '26', '当代诗人、书画家汪国真去世');
INSERT INTO `history_today` VALUES ('3546', '2001', '4', '26', '第一个知识产权日');
INSERT INTO `history_today` VALUES ('3547', '1955', '4', '26', '国家一级演员陈道明出生');
INSERT INTO `history_today` VALUES ('3548', '2016', '4', '26', '中国第一架迪士尼号首航');
INSERT INTO `history_today` VALUES ('3549', '1997', '5', '4', '电影《鸦片战争》发行签约');
INSERT INTO `history_today` VALUES ('3550', '1983', '5', '4', '伊朗共产党被解散');
INSERT INTO `history_today` VALUES ('3551', '1998', '5', '4', '北京大学喜庆百年华诞');
INSERT INTO `history_today` VALUES ('3552', '2013', '8', '26', '球星特雷西·麦克格雷迪宣布正式从NBA退役');
INSERT INTO `history_today` VALUES ('3553', '2004', '8', '26', '中国台北队夺得奥运参赛史上的首枚金牌');
INSERT INTO `history_today` VALUES ('3554', '1980', '8', '26', '全国律师咨询日');
INSERT INTO `history_today` VALUES ('3555', '2016', '8', '30', '中国驻吉尔吉斯斯坦大使馆遭袭击发生爆炸');
INSERT INTO `history_today` VALUES ('3556', '2007', '8', '30', '中国出台反垄断法，禁止各种垄断行为');
INSERT INTO `history_today` VALUES ('3557', '2003', '8', '30', '甄子丹与汪诗诗结婚');
INSERT INTO `history_today` VALUES ('3558', '1991', '8', '30', '我国开始全面清理“三角债”');

-- ----------------------------
-- Table structure for `leaving_comment`
-- ----------------------------
DROP TABLE IF EXISTS `leaving_comment`;
CREATE TABLE `leaving_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `aid` int(11) NOT NULL COMMENT '文章id',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:评论2回复',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(50) NOT NULL DEFAULT '' COMMENT '头像',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '内容',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `ext` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展字段',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `pid` (`pid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leaving_comment
-- ----------------------------
INSERT INTO `leaving_comment` VALUES ('3', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '我来踩一下！<img src=\"/ui/system/comment/images/face/22.gif\" class=\"face\">', '', '2017-03-21 15:11:45', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `leaving_comment` VALUES ('4', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 16:39:59', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `leaving_comment` VALUES ('5', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 16:40:08', '127.0.0.1', '获取失败', '');
INSERT INTO `leaving_comment` VALUES ('6', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 16:40:14', '127.0.0.1', '获取失败', '');
INSERT INTO `leaving_comment` VALUES ('7', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 16:40:18', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `leaving_comment` VALUES ('8', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 16:40:21', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `leaving_comment` VALUES ('9', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 16:40:33', '127.0.0.1', '获取失败', '');
INSERT INTO `leaving_comment` VALUES ('10', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 16:40:51', '127.0.0.1', '获取失败', '');
INSERT INTO `leaving_comment` VALUES ('11', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 16:40:58', '127.0.0.1', '获取失败', '');
INSERT INTO `leaving_comment` VALUES ('12', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 16:41:00', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `leaving_comment` VALUES ('13', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 16:41:06', '127.0.0.1', '获取失败', '');
INSERT INTO `leaving_comment` VALUES ('14', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 16:41:09', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `leaving_comment` VALUES ('15', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-21 16:41:11', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `leaving_comment` VALUES ('16', '0', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/110.jpg', '<img src=\"/ui/system/comment/images/face/6.gif\" class=\"face\">做的不孬', '', '2017-03-23 11:23:32', '127.0.0.1', '未分配或者内网IP', '');

-- ----------------------------
-- Table structure for `message_rolling`
-- ----------------------------
DROP TABLE IF EXISTS `message_rolling`;
CREATE TABLE `message_rolling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT '消息内容',
  `starttime` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(11) NOT NULL DEFAULT '1999999999' COMMENT '结束时间',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `starttime` (`starttime`),
  KEY `endtime` (`endtime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_rolling
-- ----------------------------
INSERT INTO `message_rolling` VALUES ('1', '欢迎来到SooneBaby博客家园，如有需求请留言！', '0', '1999999999', '2017-03-10 12:07:12');
INSERT INTO `message_rolling` VALUES ('2', '内容如有侵犯，请立即联系管理员删除', '0', '1999999999', '2017-03-10 12:48:20');
INSERT INTO `message_rolling` VALUES ('3', '本站内容仅供学习和参阅，不做任何商业用途。', '0', '1999999999', '2017-03-10 13:08:42');

-- ----------------------------
-- Table structure for `publish_logs`
-- ----------------------------
DROP TABLE IF EXISTS `publish_logs`;
CREATE TABLE `publish_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class` tinyint(4) NOT NULL COMMENT '类别：1文章2说说3图片',
  `content` varchar(50) NOT NULL DEFAULT '' COMMENT '内容',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publish_logs
-- ----------------------------
INSERT INTO `publish_logs` VALUES ('1', '2', 'hello world!', '2017-03-20 13:32:43');

-- ----------------------------
-- Table structure for `saying`
-- ----------------------------
DROP TABLE IF EXISTS `saying`;
CREATE TABLE `saying` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '说说内容',
  `comnum` int(11) NOT NULL DEFAULT '0' COMMENT '评论数量',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `pv` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `addr` varchar(50) NOT NULL DEFAULT '' COMMENT '发表地点',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of saying
-- ----------------------------
INSERT INTO `saying` VALUES ('1', 'hello word!', '我的第一个程序！', '1', '127.0.0.1', '18', '北京市', '2017-03-20 13:36:30');

-- ----------------------------
-- Table structure for `saying_comment`
-- ----------------------------
DROP TABLE IF EXISTS `saying_comment`;
CREATE TABLE `saying_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `aid` int(11) NOT NULL COMMENT '文章id',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:评论2回复',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(50) NOT NULL DEFAULT '' COMMENT '头像',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '内容',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `address` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `ext` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展字段',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `pid` (`pid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of saying_comment
-- ----------------------------
INSERT INTO `saying_comment` VALUES ('3', '1', '1', '0', 'SooneBaby', '/ui/system/images/default_avatar/118.jpg', '<img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/3.gif\" class=\"face\">', '', '2017-03-20 16:08:13', '127.0.0.1', '未分配或者内网IP', '');
INSERT INTO `saying_comment` VALUES ('4', '1', '2', '3', 'SooneBaby', '/ui/system/images/default_avatar/118.jpg', '<img src=\"/ui/system/comment/images/face/15.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/15.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/15.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/15.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/15.gif\" class=\"face\"><img src=\"/ui/system/comment/images/face/15.gif\" class=\"face\">', '', '2017-03-20 16:08:42', '127.0.0.1', '未分配或者内网IP', '');

-- ----------------------------
-- Table structure for `subscribe`
-- ----------------------------
DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subscribe
-- ----------------------------

-- ----------------------------
-- Table structure for `swiper_slide`
-- ----------------------------
DROP TABLE IF EXISTS `swiper_slide`;
CREATE TABLE `swiper_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `img` varchar(255) DEFAULT '' COMMENT '图片地址',
  `link` varchar(255) DEFAULT '' COMMENT '链接地址',
  `order` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL COMMENT '位置',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `position` (`position`),
  KEY `order` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swiper_slide
-- ----------------------------
INSERT INTO `swiper_slide` VALUES ('1', 'SooneBaby博客全新上线', '/ui/system/images/2016122200022.jpg', '#', '0', 'index', '2017-03-13 11:14:44');
INSERT INTO `swiper_slide` VALUES ('2', '一句话，就是一个故事', '/ui/system/images/2016122200011.jpg', '#', '0', 'index', '2017-03-13 11:15:33');
INSERT INTO `swiper_slide` VALUES ('3', '大好山河风景图', '/ui/system/images/2016122200033.jpg', '#', '0', 'index', '2017-03-13 11:15:56');

-- ----------------------------
-- Table structure for `system_base`
-- ----------------------------
DROP TABLE IF EXISTS `system_base`;
CREATE TABLE `system_base` (
  `mark` varchar(50) NOT NULL COMMENT '标记',
  `value` varchar(50) NOT NULL DEFAULT '' COMMENT '值',
  `init` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否初始化的时候显示',
  UNIQUE KEY `mark` (`mark`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_base
-- ----------------------------
INSERT INTO `system_base` VALUES ('author', 'SooneBaby', '1');
INSERT INTO `system_base` VALUES ('avatar', '/ui/system/images/soonebaby.jpg', '1');
INSERT INTO `system_base` VALUES ('desc', '爱笑的女孩运气都不会太差！', '1');
INSERT INTO `system_base` VALUES ('stime', '1485878400', '1');

-- ----------------------------
-- Table structure for `system_text`
-- ----------------------------
DROP TABLE IF EXISTS `system_text`;
CREATE TABLE `system_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mark` varchar(50) NOT NULL,
  `value` text,
  `group` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mark` (`mark`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_text
-- ----------------------------
INSERT INTO `system_text` VALUES ('1', 'website', '<p>\r\n	<span style=\"font-size:16px;color:#E53333;font-family:&#39;Microsoft YaHei&#39;;\"><strong>SooneBaby:本站内容仅供学习和参阅，不做任何商业用途。</strong></span>\r\n</p>\r\n<p>\r\n	<br>\r\n</p>\r\n<p>\r\n	<br>\r\n</p>', 'about');
INSERT INTO `system_text` VALUES ('2', 'owner', '<p>\r\n	<strong><span style=\"font-family:&#39;Microsoft YaHei&#39;;line-height:2;\">中文名</span></strong><span style=\"font-family:&#39;Microsoft YaHei&#39;;line-height:2;\">：</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;line-height:2;\">思密达</span>\r\n</p>\r\n<p>\r\n	<strong><span style=\"font-family:&#39;Microsoft YaHei&#39;;line-height:2;\">职业：</span></strong><span style=\"font-family:&#39;Microsoft YaHei&#39;;line-height:2;\">前端开发工程师</span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"><b><span style=\"font-family:&#39;Microsoft YaHei&#39;;line-height:2;\">个人简介：</span></b><span></span></span><span style=\"white-space:normal;\"><b><span style=\"font-family:&#39;Microsoft YaHei&#39;;\"></span></b><span style=\"color:#64451D;font-family:&#39;Microsoft YaHei&#39;;line-height:2;\"><span style=\"color:#333333;line-height:2;\">精通html+css+js技术开发，目前擅长页面排版和页面js动态效果等，熟练jQuery、Bootstrap、AJAX、javascript、Html、CSS等前端页面技术和SEO网站优化技术，了解Unix、Lunix等系统基本命令操作。</span></span></span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;font-size:14px;\"><span style=\"color:#64451D;font-family:&#39;Microsoft YaHei&#39;;font-size:16px;\"><span style=\"color:#333333;\"><br>\r\n</span></span></span>\r\n</p>', 'about');
INSERT INTO `system_text` VALUES ('3', 'desc', '<p>\r\n	<span style=\"line-height:2;font-family:&#39;Microsoft YaHei&#39;;\"><strong>前台设计</strong></span><span style=\"line-height:2;font-family:&#39;Microsoft YaHei&#39;;\">：</span><span style=\"line-height:2;\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;line-height:2;\">css3+html5自适应布局</span></span>\r\n</p>\r\n<p>\r\n	<strong><span style=\"line-height:2;font-family:&#39;Microsoft YaHei&#39;;\">后台主程序</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;line-height:2;\">：</span></strong><span style=\"font-family:&#39;Microsoft YaHei&#39;;line-height:2;\"><span style=\"line-height:2;font-family:&#39;Microsoft YaHei&#39;;\">PHP+CodeIgniter</span></span>\r\n</p>\r\n<p>\r\n	<span><span style=\"line-height:2;color:#000000;font-family:&#39;Microsoft YaHei&#39;;\"><strong>网站简介</strong></span><strong><span style=\"color:#000000;font-family:&#39;Microsoft YaHei&#39;;line-height:2;\"><span style=\"line-height:2;\">：</span></span></strong><span style=\"color:#000000;font-family:&#39;Microsoft YaHei&#39;;\"><span style=\"line-height:1.5;\"></span><span style=\"line-height:2;\">本站是由全新的html5+css3设计的界面，不支持ie8，ie9，有的浏览器为双核，兼容模式则是ie模式，如果其他浏览器访问本站出现提示页面，那说明该浏览器ie内核是ie9及以下；如果发现bug还请您留言提出，相信我会做的更好！</span></span></span>\r\n</p>\r\n<p>\r\n	<br>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><b></b></span>\r\n</p>\r\n', 'about');

-- ----------------------------
-- Table structure for `system_variable`
-- ----------------------------
DROP TABLE IF EXISTS `system_variable`;
CREATE TABLE `system_variable` (
  `mark` varchar(50) NOT NULL COMMENT 'key',
  `value` varchar(100) NOT NULL COMMENT '值',
  `init` tinyint(4) NOT NULL DEFAULT '1' COMMENT '系统是否自动调取',
  PRIMARY KEY (`mark`),
  KEY `init` (`init`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_variable
-- ----------------------------
INSERT INTO `system_variable` VALUES ('artnum', '14', '1');
INSERT INTO `system_variable` VALUES ('comnum', '27', '1');
INSERT INTO `system_variable` VALUES ('leavenum', '14', '1');
INSERT INTO `system_variable` VALUES ('photonum', '11', '1');
INSERT INTO `system_variable` VALUES ('resnum', '6', '1');
INSERT INTO `system_variable` VALUES ('saynum', '1', '1');
INSERT INTO `system_variable` VALUES ('visitnum', '1947', '1');

-- ----------------------------
-- Table structure for `tags_cloud`
-- ----------------------------
DROP TABLE IF EXISTS `tags_cloud`;
CREATE TABLE `tags_cloud` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签云',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '标签云名称',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags_cloud
-- ----------------------------
INSERT INTO `tags_cloud` VALUES ('1', 'PHP', '3', '0');
INSERT INTO `tags_cloud` VALUES ('2', 'HTML5', '0', '0');
INSERT INTO `tags_cloud` VALUES ('3', 'Linux', '0', '0');
INSERT INTO `tags_cloud` VALUES ('4', 'Mysql', '1', '0');
INSERT INTO `tags_cloud` VALUES ('5', 'jQuery', '0', '0');
INSERT INTO `tags_cloud` VALUES ('6', 'CodeIgniter', '0', '0');
INSERT INTO `tags_cloud` VALUES ('7', 'SEO', '3', '0');
INSERT INTO `tags_cloud` VALUES ('8', '个人博客', '1', '0');
INSERT INTO `tags_cloud` VALUES ('9', 'session', '0', '0');
INSERT INTO `tags_cloud` VALUES ('10', 'cookie', '0', '0');
INSERT INTO `tags_cloud` VALUES ('11', 'Web开发', '3', '0');
INSERT INTO `tags_cloud` VALUES ('12', '安全', '0', '0');
INSERT INTO `tags_cloud` VALUES ('13', '微信', '0', '0');
INSERT INTO `tags_cloud` VALUES ('14', '缓存', '0', '0');
INSERT INTO `tags_cloud` VALUES ('15', '数据结构', '0', '0');
INSERT INTO `tags_cloud` VALUES ('16', '面试题', '1', '0');
INSERT INTO `tags_cloud` VALUES ('17', 'Nosql', '0', '0');
INSERT INTO `tags_cloud` VALUES ('18', 'Socket', '0', '0');
INSERT INTO `tags_cloud` VALUES ('19', '服务器', '0', '0');
INSERT INTO `tags_cloud` VALUES ('20', '乱七八糟', '1', '0');
INSERT INTO `tags_cloud` VALUES ('21', 'javascript', '1', '0');

-- ----------------------------
-- Table structure for `visit_logs`
-- ----------------------------
DROP TABLE IF EXISTS `visit_logs`;
CREATE TABLE `visit_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '访问id',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip',
  `addr` varchar(50) NOT NULL DEFAULT '' COMMENT '地址',
  `vnum` int(10) unsigned NOT NULL DEFAULT '0',
  `ut` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `ct` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`),
  KEY `ct` (`ct`),
  KEY `ut` (`ut`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visit_logs
-- ----------------------------
INSERT INTO `visit_logs` VALUES ('1', '127.0.0.1', '未分配或者内网IP', '1947', '2017-04-19 17:37:02', '2017-03-12 20:33:11');
