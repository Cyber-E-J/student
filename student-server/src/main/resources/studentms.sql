/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`studentms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `studentms`;

/* Table structure for table `c` */

DROP TABLE IF EXISTS `c`;

CREATE TABLE `c` (
                     `cid` int(11) NOT NULL AUTO_INCREMENT,
                     `cname` varchar(30) NOT NULL,
                     `ccredit` tinyint(4) DEFAULT NULL,
                     `exam_time` DATETIME DEFAULT NULL,
                     `exam_location` VARCHAR(50) DEFAULT NULL,
                     PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/* Data for the table `c` */

INSERT INTO `c`(`cid`,`cname`,`ccredit`, `exam_time`, `exam_location`) VALUES
                                                                           (7,'数据结构',6, '2024-06-15 09:00:00', '教室A'),
                                                                           (8,'组合数学',3, '2024-06-16 09:00:00', '教室B'),
                                                                           (9,'计算机网络',5, '2024-06-17 09:00:00', '教室C'),
                                                                           (10,'计算机组成原理',5, '2024-06-18 09:00:00', '教室D'),
                                                                           (11,'RJC教你做选课系统',10, '2024-06-19 09:00:00', '教室E'),
                                                                           (12,'test说',22, '2024-06-20 09:00:00', '教室F');

/* Table structure for table `ct` */

DROP TABLE IF EXISTS `ct`;

CREATE TABLE `ct` (
                      `ctid` int(11) NOT NULL AUTO_INCREMENT,
                      `cid` int(11) DEFAULT NULL,
                      `tid` int(11) DEFAULT NULL,
                      `term` varchar(30) NOT NULL,
                      PRIMARY KEY (`ctid`),
                      KEY `cid` (`cid`),
                      KEY `tid` (`tid`),
                      CONSTRAINT `ct_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `c` (`cid`),
                      CONSTRAINT `ct_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `t` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/* Data for the table `ct` */

INSERT INTO `ct`(`ctid`,`cid`,`tid`,`term`) VALUES
                                                (5,8,4,'22-春季学期'),
                                                (6,7,4,'22-春季学期'),
                                                (7,10,13,'22-春季学期'),
                                                (8,9,13,'22-春季学期'),
                                                (9,11,4,'22-春季学期'),
                                                (10,9,4,'22-春季学期');

/* Table structure for table `s` */

DROP TABLE IF EXISTS `s`;

CREATE TABLE `s` (
                     `sid` int(11) NOT NULL AUTO_INCREMENT,
                     `sname` varchar(30) NOT NULL,
                     `password` varchar(30) NOT NULL,
                     PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

/* Data for the table `s` */

INSERT INTO `s`(`sid`,`sname`,`password`) VALUES
                                              (1,'阮健乘','1234'),
                                              (2,'张四','123'),
                                              (3,'李四','1234'),
                                              (4,'彭昊辉','123456'),
                                              (6,'林春霞','123'),
                                              (7,'董一超','12345'),
                                              (8,'董超','123'),
                                              (9,'张千','10086'),
                                              (10,'李万','10085'),
                                              (14,'薇尔莉特','123'),
                                              (21,'庄亮','123'),
                                              (22,'钟平','1234'),
                                              (23,'李煜豪','123');

/* Table structure for table `sct` */

DROP TABLE IF EXISTS `sct`;

CREATE TABLE `sct` (
                       `sctid` int(11) NOT NULL AUTO_INCREMENT,
                       `sid` int(11) DEFAULT NULL,
                       `cid` int(11) DEFAULT NULL,
                       `tid` int(11) DEFAULT NULL,
                       `grade` float DEFAULT NULL,
                       `term` varchar(30) DEFAULT NULL,
                       PRIMARY KEY (`sctid`),
                       KEY `sid` (`sid`),
                       KEY `tid` (`tid`),
                       KEY `cid` (`cid`),
                       CONSTRAINT `sct_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `s` (`sid`),
                       CONSTRAINT `sct_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `ct` (`tid`),
                       CONSTRAINT `sct_ibfk_3` FOREIGN KEY (`cid`) REFERENCES `ct` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

/* Data for the table `sct` */

INSERT INTO `sct`(`sctid`,`sid`,`cid`,`tid`,`grade`,`term`) VALUES
                                                                (10,2,8,4,2,'22-春季学期'),
                                                                (11,2,10,13,NULL,'22-春季学期'),
                                                                (12,2,7,4,5,'22-春季学期'),
                                                                (13,4,8,4,10,'22-春季学期'),
                                                                (14,4,7,4,NULL,'22-春季学期'),
                                                                (15,4,10,13,NULL,'22-春季学期'),
                                                                (16,1,8,4,NULL,'22-春季学期'),
                                                                (17,1,10,13,NULL,'22-春季学期');

/* Table structure for table `t` */

DROP TABLE IF EXISTS `t`;

CREATE TABLE `t` (
                     `tid` int(11) NOT NULL AUTO_INCREMENT,
                     `tname` varchar(30) NOT NULL,
                     `password` varchar(30) NOT NULL,
                     PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/* Data for the table `t` */

INSERT INTO `t`(`tid`,`tname`,`password`) VALUES
                                              (4,'李玉民','1234'),
                                              (6,'admin','123'),
                                              (13,'张三','123'),
                                              (14,'王五2','12334');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;