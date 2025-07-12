/***************************************/
### 제약 조건 ###
/***************************************/
-- 제약 조건이란? DB에서 데이터의 무결성(Data Integrity)를 유지,
-- 				      데이터의 일관성(Data Consistency)를 보장하기 위해 사용됨.

-- -----------------------------------------------------------------------------------------
-- 1. 기본키 (PK) 	: CONSTRAINT PRIMARY KEY (`COLUMN_name`, ... )
-- 2. 유니크  	 	: CONSTRAINT UNIQUE (`COLUMN_name`, ... )
-- 3. 외래키 (FK) 	: CONSTRAINT FOREIGN KEY (`COLUMN_name`, ... ) 
-- 										REFERENCES `scheam_name`.`table_name` (`references_column_name`, ...)

-- 					  OR

-- 					  CONSTRAINT FOREIGN KEY (`대상열`, ... ) 
-- 										REFERENCES `scheam_name`.`table_name` (`참고열`, ...)
-- -----------------------------------------------------------------------------------------
-- 외래키(FK)가 걸리는 ''' 참고 열 '''은 기본키(PK)이거나 UNIQUE KEY이여야 한다.
-- ''' 대상 열 '''과 ''' 참고 열 '''의 타입이 서로 일치해야한다.


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


-- 1번 테이블 만들기 
-- 여러분들이 직접 만들기

-- 유저 테이블 생성
CREATE TABLE `shopdb`.`userTbl` (
	COMMENT '회원번호',
    COMMENT '회원이름',
    COMMENT '생년월일',
    COMMENT '주소',
    COMMENT '전화번호 앞자리',
    COMMENT '전화번호 뒷자리',
    COMMENT '키',
    COMMENT '가입 날짜',
    
);

-- 구매 테이블 생성
CREATE TABLE `shopdb`.`buyTbl` (
	COMMENT '구매번호',
	COMMENT '회원번호',
    COMMENT '상품이름',
    COMMENT '그룹명',
    COMMENT '가격',
    COMMENT '수량',
);

-- 2번 값삽입
-- 스터디룸 참조



-- 3번 문제 풀기














