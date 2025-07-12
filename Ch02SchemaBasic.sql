/********************************/
### 스키마 (SCHEMA) ###
/********************************/

## 생성 (CREATE) ##
-- 스키마 (SCHEMA, DATABASE)는 실제 데이터를 포함하지 않는다.
-- 스키마는 단순히 서로 관련있는 테이블(Table)을 담기 위해 존재한다.
   CREATE SCHEMA `test_schema`;
-- 명령어   키워드	      ↑ 스키마 이름

CREATE SCHEMA IF NOT EXISTS `test_schema`;
-- 			  ↑ ''' IF NOT EXISTS '''는 동일한 이름의 스키마(DB)가 존재하더라도 오류 발생 X


## 조회 (SHOW) ##
SHOW SCHEMAS;

## 삭제 (DROP) ##
DROP SCHEMA `test_schema`;
-- 				↑ 스키마 이름
DROP SCHEMA IF EXISTS `test_schema`;



/*******************************/
### 데이터 타입 ###
/*******************************/

### 정수형 ###

-- 부호 없는 정수는 뒤에 UNSINGED를 붙인다.
-- TINYINT 				: 1 Byte, -128 ~ 127 (저장범위)

-- SMALLINT				: 2 Bytes, -32768 ~ 32767

-- MEDIUMINT			: 3 Bytes, -8388608 ~ 8388607

-- INT	`				: 4 Bytes, 약 -21억 ~ 약 21억

-- BIGINT				: 8 Bytes, 너무 많아요 T^T (거의 모든 정수 범위라고 보시면 됩니다)



### 소수형(실수형) ###

# 소수형의 FLOAT는 연산 오류가 너무 심해서 생략

-- DOUBLE : 8 Bytes, -1.7976931348623157 x 10 ^ 308 ~ 1.7976931348623157 x 10 ^ 308
-- 		  : 부동 소수점 수를 나타내는 데이터 유형, DECIMAL보다 유연한 처리가 가능
-- 		  : 특성상 연산 오류가 발생하여 소숫점 뒷자리가 버려지거나 연산상 오류가 발생할 수 있음.

-- DECIMAL(a, b) : (a + 1) Bytes, a는 전체 자리 길이, b는 소숫점 자리 길이
-- 				 : 정수 한자리, 소숫점 두 자리를 원한다면, DECIMAL(3, 2)가 맞음.
-- 				 : 용량이 큰 대신, FLOAT이나 DOUBLE이 가지는 한계인 연산 오류가 없음.
-- 				 : 정확한 소수점 이하의 값을 저장할 수 O
-- 				 : 따라서 금융 데이터나 정확한 계산이 필요한 경우에 사용됨.
-- ++) BIGINT를 뛰어넘는 자리수를 쓴다면 DECIMAL을 쓰면 됨. 근데 그럴 일이 있으려나요 3-3 


### 날짜/시간 ###
-- DATE : 3 Bytes, 년/월/일

-- TIME : 3 Bytes, 시/분/초

-- DATETIME : 8 Bytes, 년/월/일 시:분:초
-- 			: 0000-01-01 00:00:00 ~ 9999-12-31 23:59:59

-- TIMESTAMP : 4 Bytes, 년/월/일 시:분:초
-- 			 : 1970-01-01 00:00:00 ~ 2038-01-19 03:14:07
-- 		     : UNIX 시간 저장 : 1970년 1월 1일 0시 0분 0초부터 지금까지 지난 시간 초

--  YEAR : 1 Bytes, 년


### 논리 ###

-- BOOLEAN : 1 Byte, 참(True) / 거짓(False) 값만 가진다.
-- 		   : 실제로는 TINYINT(1)로 작동하며 0은 거짓, 1은 참으로 작동함.


### 문자 ###

-- VARCHAR(n) : n Bytes, 최대 65535 Bytes
-- 			  : 한 테이블 내에 존재하는 모든 VARCHAR 길이의 합이 65535를 초과 X
-- 			  : 지금은 바이트 단위 X, 글자수 단위 O ( VARCHAR(10) : 언어 구분 없이 10자 )
-- 			  : 행 내에 데이터를 저장, 데이터가 작을 경우, 효율적
-- 			  : But, 테이블 내 모든 VARCAHR 열의 길이 합이 65535 Bytes 초과할 수 X

-- TINYTEXT(n) : n Bytes, 최대 255 Bytes

-- TEXT(n)     : n Bytes, 최대 65535 Bytes
-- 			   : 데이터를 테이블 외부에 저장, 행 내에는 데이터의 위치를 나타내는 포인터만 저장
-- 			   : 따라서 테이블 내 여러 TEXT 열이 있어도 문제 X

-- MEDIUMTEXT(n) : n Bytes, 최대 16777215 Bytes
-- LONGTEXT(n)   : n Bytes, 최대 4294967295 Bytes



### 기타 ###
-- 이진 데이터 (Binary Data)

-- TINYBLOB(n) : n Bytes

-- BLOB(n) : n Bytes, 65535 Bytes

-- MEDIUMBLOB(n) : n Bytes

-- LONGBLOB(n) : n Bytes, 최대 4294967295 Bytes

-- 이진 데이터 : 업로드 한 데이터를 테이블에 담고자 할 떄 사용. (첨부파일, 프로필 사진 등)



/********************************/
### 테이블 (Table) ###
/********************************/

# 테이블 만들 때 열에 대한 명시 필요
# 테이블 이름은 복수형으로 짓는게 낫다.

## 생성 (CREATE) ##
-- 			  ↓ 스키마   ↓ 테이블 이름(복수형)
CREATE TABLE `studydb`.`tbl_usr` (
-- 	↓ 열 이름
	`age` TINYINT UNSIGNED NOT NULL DEFAULT 1,
-- 			↑ 타입 			↑ 열 속성(콤마 안쓰고 띄워쓰기로 구분) + 열을 구분할 땐 마지막에 ,로 구분함.
	`name` VARCHAR(5)
-- <제약조건 CONSTRAINT>,...
);

CREATE SCHEMA `studydb`;


## 테이블 삭제 (DROP) ##
-- 			↓ 스키마   ↓ 테이블 이름
DROP TABLE `studydb`.`tbl_usr`;

## 테이블 조회 (SHOW) ##
SHOW TABLES IN `studydb`;


## 테이블 정보 조회 (DESCRIBE) ##
DESC `studydb`.`tbl_usr`;
/*
Field	Type				Null	Default Extra
age		tinyint(3) unsigned	NO		1
name	varchar(5)			Yes
*/


## 테이블 수정 (ALTER) ##
-- 				↓ 스키마 		   ↓ 테이블 이름
-- ALTER TABLE `schema_name`.`table_name` < 수정 사항 > ;

# 열 추가 (ADD COLUMN) #

ALTER TABLE `studydb`.`tbl_usr` ADD COLUMN `contact` VARCHAR(11) NOT NULL;
ALTER TABLE `studydb`.`tbl_usr` ADD COLUMN `country` VARCHAR(30) DEFAULT 'korea';
ALTER TABLE `studydb`.`tbl_usr` ADD COLUMN `email` VARCHAR(11) NOT NULL AFTER `name`;
ALTER TABLE `studydb`.`tbl_usr` ADD COLUMN `index` INT UNSIGNED NOT NULL FIRST;

-- OR (위아래 상관 X)

ALTER TABLE `studydb`.`tbl_usr` ADD COLUMN `contact` VARCHAR(11) NOT NULL,
								ADD COLUMN `country` VARCHAR(30) DEFAULT 'korea',
                                ADD COLUMN `email` VARCHAR(11) NOT NULL AFTER `name`,
                                ADD COLUMN `index` INT UNSIGNED NOT NULL FIRST;
                                
                                
# 열 삭제 (DROP COLUMN) #            

ALTER TABLE `studydb`.`tbl_usr` DROP COLUMN `contact`;

DESC `studydb`.`tbl_usr`;

# 열 수정 (MODIFY COLUMN) #            
ALTER TABLE `studydb`.`tbl_usr` MODIFY COLUMN `contact` VARCHAR(13) NOT NULL;
ALTER TABLE `studydb`.`tbl_usr` MODIFY COLUMN `email` VARCHAR(50) NOT NULL AFTER `contact`;

ALTER TABLE `studydb`.`tbl_usr` MODIFY COLUMN `age` TINYINT UNSIGNED NOT NULL DEFAULT 1 AFTER `name`;
ALTER TABLE `studydb`.`tbl_usr` MODIFY COLUMN `country` VARCHAR(30) DEFAULT 'korea' AFTER `email`;



/**************************************/
### 열 속성 (COLUMN PROPERTY) ###
/**************************************/

-- 1. UNIQUE 	: 해당 열의 중복 X

-- 2. NOT NULL 	 : 해당 열 값이 비어있을 수 X

-- 3. DEFAULT x	 : 해당 열 값이 명시되지 않은 경우 (NOT NULL 여부와 무관하게) 기본값으로 x 사용

-- 4. AUTO_INCREMENT : 해당 열 값에 대해 명시되지 않은 경우 1부터 시작하여 자동 증가한 값을 사용
-- 					 : 해당 열이 기본키(PRIMARY KEY)일 때에만 작동

-- 5. CHECK 		 : 해당 열의 값이 특정 조건을 만족해야 함.
-- 					 : Ex) 나이가 음수가 아니거나 날짜가 특정 범위 내에 있어야 하는 경우.

-- 6. INDEX			 : 해당 열에 대한 인덱스 생성 , 검색 성능 향상시키는데 사용 			-- 나중에 DB 끝나고 찾아보기 (숙제)

-- 7. PRIMARY KEY	 : 해당 열이 테이블의 기본 키 (PRIMARY KEY)로 지정됨.
-- 					 : 테이블의 각 행을 고유하게 식별하는데 사용, NULL 허용 X

-- 8. READ ONLY	 	 : 해당 열은 읽기 전용 (Read-Only)로 설정함, 수정 X








































