/************************************************************/
### MYSQL DBMS 권힌부여 localhost ###
/************************************************************/

-- 사용자 이름 (User Name) : 데이터베이스에 로그인하는데 사용되는 식별자
-- 						: 데이터베이스 시스템에 특정 권한을 가질 수 있고 이를 통해 DB 객체(INSTANCE)에 접근할 수 있음.

-- 권한 (Permission)		: 1. SELECT	: 레코드 조회			FROM 테이블
-- 						: 2. INSERT	: NEW 레코드 삽입		TO 테이블
-- 						: 3. UPDATE : 레코드 수정			FROM 테이블
-- 						: 4. DELETE : 레코드 삭제			TO 테이블
-- 						: 5. CREATE : NEW 테이블, 뷰, 인덱스 등 생성
-- 						: 6. ALTER  : 테이블 구조 변경
-- 						: 7. DROP	: 테이블, 뷰, 인덱스 등 삭제
-- 						: 8. GRANT	: 다른 사용자에게 권한 부여

-- 접속한 두 명의 사용자 이름이 동일하다면 어떻게 구분할까?
-- ==> 사용자 호스트(User Host)가 사용됨.


-- 사용자 호스트(User Name)	: 사용자 이름이 동일할 때 접속 호스트(IP주소)가 다를 수 있음.
-- 						: 사용자의 호스트 정보(사용자가 접속하는 클라이언트 컴퓨터) == 접속 구분 요소

## 생성(CREATE) ##
-- 사용자를 만들면 껍데기 사용자가 만들어짐 == 권한이 없음
-- 따라서 GRANT 라는 명령어를 이용해 권한을 부여해야함. 
-- 				↓ 사용자 이름
CREATE USER `korea`@`localhost` IDENTIFIED BY 'test1234'; 
-- 						↑ 사용자 호스트				↑ 비밀번호

-- @				: 사용자와 호스트를 구분해주는 구분자
-- localhost		: 로컬 호스트(현재 컴퓨터)에서만 접속이 가능함.
-- 					: 사용자가 직접 접근하는 컴퓨터나 서버를 의미, 외부 접속 X, 로컬 접속 O
-- IDENTIFIED BY	: 암호 설정 키워드, 사용자에게 암호를 부여함.
-- 									사용자는 암호를 알아야 접속 가능.
-- 비밀번호는 구성요소가 아닌 그냥 문자열로 인식함

SHOW GRANTS;			-- 현재 접속한 사용자(CONNECTION)의 권한 확인

/*****************************/
### 권한(PERMISSION) ###
/*****************************/
## 부여(GRANT) ##
GRANT SELECT ON *.* TO `korea`@`loclahost`;