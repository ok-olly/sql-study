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

-- 시퀀스
CREATE SEQUENCE 시퀀스1; -- 생성
DROP SEQUENCE 시퀀스1; --삭제

SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME = '시퀀스1';

-- 시퀀스 테스트 (이름.NEXTVAL => 증가하는 값이 리턴)
SELECT 시퀀스1.NEXTVAL FROM DUAL;

CREATE TABLE 부서_테스트 (
    부서번호 NUMBER PRIMARY KEY,
    부서이름 VARCHAR2(100)
);

INSERT INTO 부서_테스트 VALUES (시퀀스1.NEXTVAL, '영업부');
INSERT INTO 부서_테스트 VALUES (시퀀스1.NEXTVAL, '개발부');

SELECT * FROM 부서_테스트;

--시퀀스의 값은 증가시키지 않고 현재 값을 알고 싶을 때 (이름.CURRVAL)
SELECT 시퀀스1.CURRVAL FROM DUAL;

-- 시퀀스 옵션 시작값 10부터 증가는 20
CREATE SEQUENCE 시퀀스2
START WITH 10
INCREMENT BY 20;

-- 시퀀스 확인
SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME = '시퀀스2';

-- 입력
INSERT INTO 부서_테스트 VALUES (시퀀스2.NEXTVAL, '마케팅부');
INSERT INTO 부서_테스트 VALUES (시퀀스2.NEXTVAL, '교육부');
INSERT INTO 부서_테스트 VALUES (시퀀스2.NEXTVAL, '경영부');
SELECT * FROM 부서_테스트 ORDER BY 부서번호;

-- 시퀀스로 전체번호를 업데이트
UPDATE 부서_테스트 SET 부서번호=시퀀스2.NEXTVAL;

-- 시퀀스2의 증가값을 2로 수정해보자 (시작값은 수정불가)
ALTER SEQUENCE 시퀀스2
INCREMENT BY 2;

