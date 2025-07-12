### DBMS(DataBase Management System) ###

-- DBMS (DataBase management System)
-- |
-- | ㅡ RDBMS(Realtional DBMS, 관계형 데이터 베이스)
-- 	특성 : 데이터간의 종속성/연결성을 부여, 무결성(integrity) 보장을 목적으로 하는 DBMS

-- EX) MariaDB : 우리가 배우고 있는 과목 PHP/JSP
-- 	   MySQL   : PHP/JSP
-- 	   Ms-SQL  : (윈도우)ASP, 잘 안씀 :)
--     Oracle DB : JSP, 금융에서 많이 씀, 데이터가 적으면 MYSQL, MariaDB 더 빠르지만, 데이터 많아질수록 Oracle 더 빠르다.

-- |
-- | ㅡ Non-RDBMS(No SQL, 비관계형 데이터베이스)
-- 특성 : 쉬운 방식으로 대용량의 자료(데이터)를 병렬 형태로 저장

-- Ex) (참고) MongoDB
-- 			 HBase


### 주석 ###

-- 주석 : 데이터베이스 객체(테이블, 열, 뷰, 저장 프로시저 등) 이나 쿼리에 추가되는 설명, 또는 메모
-- 주석 사용 이유 : 데이터베이스 스키마의 가독성과 이해를 돕기 위해 사용됨.

### 주석의 종류 ###

-- , # : 단일 주석

/*
	: 여러줄 주석 ( == 다중 주석 )
*/


-- 주석 단축키 : CTRL + / 

### 데이터베이스 명령어 한눈에 보기 ###
-- 			만들기		보기			수정하기		삭제하기
-- 			CREATE		READ		UPDATE		DELETE
-- USER		CREATE		.			ALTER		DROP
-- SCHEMA	CREATE		SHOW{s}		.			DROP
-- TABLE	CREATE		SHOW{s}		ALTER		DROP
-- RECORD	INSERT		SELECT		UPDATE		DELETE



### 명명법(Naming Convention) ###
-- Example) Table Member를 하나의 단어로 만들 떄,
-- 1. 카멜 케이스 			: tableMember
-- 2. 파스칼 케이스 		: TableMember
-- 3. 스네이크 케이스 		: table_member
-- 4. 어퍼 스네이크 케이스 	: TABLE_MEMBER
-- 5. 케밥 케이스 			: table-member
-- ==> DB는 ''스네이크 케이스''를 사용함.




























