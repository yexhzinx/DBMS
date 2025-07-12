CREATE SCHEMA `shopdb`;

-- 유저 테이블 생성
CREATE TABLE `shopdb`.`userTbl` (
	`userID` VARCHAR(8) NOT NULL 	COMMENT '회원번호',
    `name` VARCHAR(10) NOT NULL		COMMENT '회원이름',
    `birthyear` INT NOT NULL		COMMENT '생년월일',
    `addr` VARCHAR(2) NOT NULL		COMMENT '주소',
    `mobile1` VARCHAR(3)			COMMENT '전화번호 앞자리',
    `mobile2` VARCHAR(8)			COMMENT '전화번호 뒷자리',
    `height` SMALLINT				COMMENT '키',
    `mDate` DATE					COMMENT '가입 날짜',
    CONSTRAINT PRIMARY KEY (`userID`)
);

-- 구매 테이블 생성
CREATE TABLE `shopdb`.`buyTbl` (
	`num` INT NOT NULL				COMMENT '구매번호',
    `userID` VARCHAR(8) NOT NULl	COMMENT '회원번호',
    `prodName` VARCHAR(15) NOT NULL	COMMENT '상품이름',
    `groupName` VARCHAR(15)			COMMENT '그룹명',
    `price` INT NOT NULL 			COMMENT '가격',
    `amount` SMALLINT NOT NULL		COMMENT '수량',
    CONSTRAINT PRIMARY KEY (`num`),
    CONSTRAINT FOREIGN KEY (`userID`) REFERENCES `shopdb`.`userTbl` (`userID`)
);

-- Usertbl 값삽입
INSERT INTO `shopdb`.`userTbl` VALUES('LSG','이승기',1987,'서울','011','1111111',182,'2008-8-8');
INSERT INTO `shopdb`.`userTbl` VALUES('KBS','김범수',1979,'경남','011','2222222',173,'2012-4-4');
INSERT INTO `shopdb`.`userTbl` VALUES('KKH','김경호',1971,'전남','019','3333333',177,'2007-7-7');
INSERT INTO `shopdb`.`userTbl` VALUES('JYP','조용필',1950,'경기','011','4444444',166,'2009-4-4');
INSERT INTO `shopdb`.`userTbl` VALUES('SSK','성시경',1979,'서울',NULL,NULL,186,'2013-12-12');
INSERT INTO `shopdb`.`userTbl` VALUES('LJB','임재범',1963,'서울','016','6666666',182,'2009-9-9');
INSERT INTO `shopdb`.`userTbl` VALUES('YJS','윤종신',1969,'경남',NULL,NULL,170,'2005-5-5');
INSERT INTO `shopdb`.`userTbl` VALUES('EJW','은지원',1972,'경북','011','8888888',174,'2014-3-3');
INSERT INTO `shopdb`.`userTbl` VALUES('JKW','조관우',1965,'경기','018','9999999',172,'2010-10-10');
INSERT INTO `shopdb`.`userTbl` VALUES('BBK','바비킴',1973,'서울','010','0000000',176,'2013-5-5');

-- Buytbl 값 삽입
INSERT INTO `shopdb`.`buyTbl` VALUES(1,'KBS','운동화',NULL,30,2);
INSERT INTO `shopdb`.`buyTbl` VALUES(2,'KBS','노트북','전자',1000,1);
INSERT INTO `shopdb`.`buyTbl` VALUES(3,'JYP','모니터','전자',200,1);
INSERT INTO `shopdb`.`buyTbl` VALUES(4,'BBK','모니터','전자',200,5);
INSERT INTO `shopdb`.`buyTbl` VALUES(5,'KBS','청바지','의류',50,3);
INSERT INTO `shopdb`.`buyTbl` VALUES(6,'BBK','메모리','전자',80,10);
INSERT INTO `shopdb`.`buyTbl` VALUES(7,'SSK','책','서적',15,5);
INSERT INTO `shopdb`.`buyTbl` VALUES(8,'EJW','책','서적',15,2);
INSERT INTO `shopdb`.`buyTbl` VALUES(9,'EJW','청바지','의류',50,1);
INSERT INTO `shopdb`.`buyTbl` VALUES(10,'BBK','운동화',NULL,30,2);
INSERT INTO `shopdb`.`buyTbl` VALUES(11,'EJW','책','서적',15,1);
INSERT INTO `shopdb`.`buyTbl` VALUES(12,'BBK','운동화',NULL,30,2);

SHOW TABLES IN `ustbl_usrerTbl`;
SHOW TABLES IN `buyTbl`;

DESC `shopdb`.`userTbl`;
DESC `shopdb`.`buyTbl`;

SELECT * FROM `shopdb`.`userTbl`;
SELECT * FROM `shopdb`.`buyTbl`;

-- 1.
SELECT * FROM `shopdb`.`userTbl` WHERE `name` = '김경호'; 

-- 2.
SELECT * FROM `shopdb`.`userTbl` WHERE `userID` = 'LSG';

-- 3.
SELECT * FROM `shopdb`.`userTbl` WHERE `birthyear` > 1900;

-- 4.
SELECT * FROM `shopdb`.`userTbl` WHERE `height` <= 170;

-- 5. 
SELECT * FROM `shopdb`.`userTbl` WHERE `birthyear` > 1900 AND `height` >= 182;

-- 6.
SELECT * FROM `shopdb`.`userTbl` WHERE `birthyear` > 1900 OR `height` >= 182;

-- 7.
SELECT * FROM `shopdb`.`userTbl` WHERE `birthyear` > 1910 AND `birthyear` < 1970;
SELECT * FROM `shopdb`.`userTbl` WHERE `birthyear` BETWEEN 1910 AND 1970;

-- 8.
SELECT * FROM `shopdb`.`userTbl` WHERE `addr` = '서울' OR `addr` = '경남';
SELECT * FROM `shopdb`.`userTbl` WHERE `addr` IN ('서울', '경남');

-- 9.
SELECT * FROM `shopdb`.`userTbl` WHERE `name` LIKE '김%';

-- 10.
SELECT * FROM `shopdb`.`userTbl` WHERE `name` LIKE '%수';

-- 11.
SELECT * FROM `shopdb`.`userTbl` WHERE `name` LIKE '%경%';

-- 12.
SELECT * FROM `shopdb`.`buyTbl` WHERE `amount` >= 5;

-- 13. 
SELECT `UserID`, `prodName` FROM `shopdb`.`buyTbl` WHERE `price` >= 50 AND `price` <= 500;
SELECT `UserID`, `prodName` FROM `shopdb`.`buyTbl` WHERE `price` BETWEEN 50 AND 500;

-- 14.
SELECT * FROM `shopdb`.`buyTbl` WHERE `amount` >= 10 OR `price` >= 100; 

-- 15.
SELECT * FROM `shopdb`.`buyTbl` WHERE `userID` LIKE 'K%';

/**********************************************************************************************/
SELECT * FROM `shopdb`.`userTbl`;
SELECT * FROM `shopdb`.`buyTbl`;
/**********************************************************************************************/

-- 16.
SELECT * FROM `shopdb`.`buyTbl` WHERE `groupName` = '서적' OR `groupName` = '전자';
SELECT * FROM `shopdb`.`buyTbl` WHERE `groupName` IN ('서적', '전자');

-- 17.
SELECT * FROM `shopdb`.`buyTbl` WHERE `prodName` = '책' OR `userID` LIKE '%w';

-- 18.
SELECT * FROM `shopdb`.`buyTbl` WHERE `groupName` IS NOT NULL;

-- 19.
SELECT * FROM `shopdb`.`userTbl` LIMIT 3;

-- 20.
SELECT * FROM `shopdb`.`buyTbl` ORDER BY `userID`; 

-- 21.
SELECT * FROM `shopdb`.`buyTbl` ORDER BY `price` DESC;

-- 22.
SELECT * FROM `shopdb`.`buyTbl` ORDER BY `amount` ASC , `prodName` DESC;

-- 23.
SELECT * FROM `shopdb`.`buyTbl` WHERE `amount` >= 3 ORDER BY `prodName` DESC;

-- 24.
SELECT * FROM `shopdb`.`userTbl` WHERE `height` > (SELECT 'height' FROM `shopdb`.`userTbl` WHERE `name` = '김경호');

-- 25.
INSERT INTO `shopdb`.`userTbl` VALUES('ABC','김범수',2010,'대구','010','00112233',190,'2012-1-1');
INSERT INTO `shopdb`.`userTbl` VALUES('ACB','김범수',2000,'경기','011','44556677',170,'2004-3-2');
SELECT * FROM `shopdb`.`userTbl` WHERE `name` LIKE '김범수' ORDER BY `height` DESC LIMIT 1;

-- 26.
SELECT * FROM `shopdb`.`userTbl` WHERE `name` LIKE '%범%' ORDER BY `height` DESC LIMIT 2;