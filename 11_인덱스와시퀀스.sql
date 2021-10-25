-- 인덱스

-- 인덱스 조회하기 (테이블 이름은 대문자로 넣는다)
SELECT * FROM ALL_IND_COLUMNS
WHERE table_name = 'EMPLOYEES';

-- 새 테이블 만들기
CREATE TABLE members (
    member_id INT,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR2(255) NOT NULL,
    PRIMARY KEY(member_id)
);
SELECT * FROM MEMBERS ORDER BY MEMEBER_ID;

--일반 열을 검색하기 이름이 하스인 사람
SELECT * FROM MEMBERS WHERE LAST_NAME = 'Harse';

-- 아래의 쿼리문의 실행보고서를 작성한다.
EXPLAIN PLAN FOR
SELECT * FROM MEMBERS WHERE LAST_NAME = 'Harse';

-- 저장된 실행보고서를 읽기
SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());

-- 인덱스 만들기
CREATE INDEX members_last_name_i on members(last_name);

-- 인덱스 삭제
DROP INDEX members_last_name_i;

-- 예제 멀티 인덱스 만들기
CREATE INDEX MEMBERS_NAME_I ON MEMBERS(LAST_NAME, FIRST_NAME);

SELECT * FROM ALL_IND_COLUMNS WHERE TABLE_NAME = 'MEMBERS';

SELECT * FROM MEMBERS
WHERE LAST_NAME LIKE 'A%' AND FIRST_NAME LIKE 'M%';

EXPLAIN PLAN FOR
SELECT * FROM MEMBERS
WHERE LAST_NAME LIKE 'A%' AND FIRST_NAME LIKE 'M%';

SELECT PLAN_TABLE_OUTPUT FROM TABLE(DBMS_XPLAN.DISPLAY());