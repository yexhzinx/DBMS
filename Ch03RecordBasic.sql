SELECT * FROM `studydb`.`tbl_usr`;



### 삽입 (INSERT) ###
-- 1. 데이터 삽입 성공 - 열 명시 경우
-- 			↓ 스키마 	   ↓ 테이블    ↓ 열,...
INSERT INTO `studydb`.`tbl_usr` (`index`, `name`, `age`, `contact`, `email`, `country`)
						VALUES (1, '김철수', 45, '010-1234-1111', 'chulsoo.kim@example.com', 'korea');
                        
-- 2. 데이터 삽입 성공 - 열 명시 생략
INSERT INTO `studydb`.`tbl_usr` VALUES (2, '고냠미', 3, '010-1234-222', 'cat@example.com', 'korea');
INSERT INTO `studydb`.`tbl_usr` VALUES ('korea', '이동하', 12, 12, '010-1234-1010', 'dongha@example.com');
-- 얻을 수 있는 KeyPoint : 1. 열을 명시하지 않으면, 기본 테이블이 가지는 구조(열의 순서)대로 데이터가 삽입이 된다.
-- 					    2. 데이터의 순서가 다르면, 열을 명시함으로써 열에 대한 데이터를 매핑시켜준다.

-- 3. 데이터 삽입 성공
-- 열의 순서를 다르게 명시하면, 데이터도 그 순서에 맞춰서 작성해야함.
INSERT INTO `studydb`.`tbl_usr` (`index`, `name`, `contact`, `age`, `email`, `country`)
						VALUES (1, '김철수', '010-1234-1111', 45, 'chulsoo.kim@example.com', 'korea');

-- 4. 데이터 삽입 성공
-- NULL을 허용하는 열을 빼고 데이터를 삽입
INSERT INTO `studydb`.`tbl_usr` (`index`, `contact`, `age`, `email`)
						VALUES (1, '010-1234-1111', 45, 'chulsoo.kim@example.com');

                        
-- 5. 데이터 삽입 실패 - NOT NULL인 열에 데이터를 명시하지 않은 경우
-- 					 == 열의 형식이 비어있으면 X, 데이터를 삽입 하지 X 경우
INSERT INTO `studydb`.`tbl_usr` (`name`, `contact`, `age`, `email`, `country`)
						VALUES ('김철수', '010-1234-1111', 45, 'chulsoo.kim@example.com', 'korea');
                        
                        
### 레코드 삭제 (DELETE) ###

-- DELETE FROM `schema_name`.`table_name` WHERE <조건>;
DELETE FROM `studydb`.`tbl_usr` WHERE `age` = 45;

### 비교 연산자 (Comparison Operators) ###
-- x >= y : x가 y이상
-- x <= y : x가 y이하
-- x > y  : x가 y초과
-- x < y  : x가 y미만
-- x = y  : x가 y랑 같음(숫자, 문자 등)
-- x <> y : x가 y랑 다름

### 논리 연산자 (Logical Operators) ###
-- x IS NULL		 : x가 NULL임
-- x IS NOT NULL 	 : x가 NULL이 아님
-- x AND y			 : x 및 y 조건 둘 다 참(TRUE)이어야 참을 반환
-- x OR y			 : x 및 y 조건 둘 중 하나 이상이 참이면 참을 반환

### 패턴 매칭 연산자 (Pattern Matching Operator) ###
-- x LIKE y			 : x가 y의 형태를 가짐
-- 					 : % : 와일드 카드, 모든 문자열을 대체

SELECT * FROM `shopdb`.`employees` WHERE `name` LIKE '이%';






-- # 에러 코드 발생 ( 데이터 삭제 / 수정 시도할 때 ) #
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
-- 이와 같은 에러코드를 만날 때가 있음
--  보통 삭제 / 수정 시에 KEY로 잡힌 열을 이용해서 삭제가 가능하다.
-- 이를 설정으로 그냥 삭제할 수 있는 방법이 있음.

-- 1번 방법
-- 메뉴 탭 - Edit - Preferences - SQL Editor - 밑부분 safe update(reject UPDATES and DELETES no restrictions) 체크 해제 후 mysql workbench 다시 시작

-- 2번 방법 (일시적 제한 해제)
SET SQL_SAFE_UPDATES = 0; 			-- safe mode 비활성화
-- DELETE FROM ... 삭제 진행
SET SQL_SAFE_UPDATES = 1;			-- safe mode 활성화

                        
### 레코드 수정 (UPDATE) ###
-- UPDATE `schema_name`.`table_name` SET `column_name` = < Value > WHERE < 조건 >;
-- UPDATE `스키마명`.`테이블명` SET `열 이름` = < 변경 값 > WHERE < 조건 >;

UPDATE `studydb`.`tbl_usr` SET `country` = 'japan' WHERE `index` = 1;



### 레코드 조회 (SELECT) ###
-- SELECT <COLUMN>, <COLUMN>, ... FROM `schema_name`.`table_name`;
-- 이때 테이블의 전체 열을 조회하려면 * 키워드를 이용한다.
-- =====> SELECT * FROM `schema._name`.`table_name`;

SELECT `age`, `name` FROM `studydb`.`tbl_usr`; 		-- 기본

SELECT * FROM `studydb`.`tbl_usr`;

### 레코드 조건 조회 (SELECT) ###
-- SELECT <COLUMN>, <COLUMN>, ... FROM `schema_name`.`table_name` <기타>
-- 기타 :
-- 			1. WHERE <조건> 							: 조건
-- 			2. ORDER BY <COLUMN> ASC || DESC 		: ''' 열 ''' 을 기준으로 정렬함. (ASC : 오름차순(기본), DESC : 내림차순)
-- 			3. LIMIT x 								: 조회되는 레코드의 개수를 x개로 제한함.


-- 1번 예제
SELECT * FROM `studydb`.`tbl_usr` WHERE `age` >= 35;

-- 2번 예제
SELECT * FROM `studydb`.`tbl_usr` ORDER BY `age` DESC;
 
-- 3번 예제
SELECT * FROM `studydb`.`tbl_usr` LIMIT 3;


-- 1. 아래 정보를 만족하는 테이블을 만들기
-- FILED 	TYPE					NULL 	DEFAULT
-- index	int(10) unsigned		NO			
-- name		varchar(5)			`	YES		
-- age		tinyint(3) unsigned		NO		1			
-- contact	varchar(13)				NO			
-- email	varchar(50)				NO			
-- country	varchar(30)				YES		korea	

CREATE TABLE `studydb`.`tbl_usr` (
	`index` INT UNSIGNED NOT NULL,
    `name` VARCHAR(5),
    `age` TINYINT UNSIGNED NOT NULL DEFAULT 1,
    `contact` VARCHAR(13) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `country` VARCHAR(30) DEFAULT 'korea'

);

-- 2. 데이터 삽입하기
INSERT INTO `studydb`.`tbl_usr` (`index`, `name`, `age`, `contact`, `email`, `country`) VALUES
(1, '철수', 28, '010-1234-5678', 'chulsoo@example.com', 'korea'),
(2, '영희', 35, '010-2345-6789', 'younghee@example.com', 'korea'),
(3, '민수', 42, '010-3456-7890', 'minsoo@example.com', 'korea'),
(4, '지영', 46, '010-4567-8901', 'jiyoung@example.com', 'korea'),
(5, '진우', 30, '010-5678-9012', 'jinwoo@example.com', 'korea'),
(6, '수지', 46, '010-6789-0123', 'suji@example.com', 'korea'),
(7, '태호', 25, '010-7890-1234', 'taeho@example.com', 'korea'),
(8, '하늘', 39, '010-8901-2345', 'haneul@example.com', 'korea');

-- 3. 아래 조건을 만족하는 조건 레코드 조회하기 !!!
-- 나이가 30살 초과인 유저 테이블에서 나이가 
-- 제일 많은 사람 두명의 이름과 나이 열 정보를 조회하세요 !!    3'ㅡ'3

-- 1. 테이블 안의 모든 데이터 조회
SELECT * FROM `studydb`.`tbl_usr`;

-- 2. 조건 추가 : 나이가 30살 초과인 회원 데이터를 조회하기 == WHERE 조건절 사용
SELECT * FROM `studydb`.`tbl_usr` WHERE `age` > 30; 

-- 3. 조건 추가 : 나이가 많은 순서대로 정렬				  == ORDER BY 정렬 조건 사용
SELECT * FROM `studydb`.`tbl_usr` WHERE `age` > 30 ORDER BY `age` DESC; 

-- 4. 조건 추가 : 여기서 두명의 레코드 선택 			  == LIMIT x 조건 사용
SELECT * FROM `studydb`.`tbl_usr` WHERE `age` > 30 ORDER BY `age` DESC LIMIT 2; 

-- 5. 열 선택 : 나이 열과 이름 열을 선택해서 조회하기
SELECT `name`, `age` FROM `studydb`.`tbl_usr` WHERE `age` > 30 ORDER BY `age` DESC LIMIT 2; 












                        
                        
                        
                        
                        


