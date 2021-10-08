-- DML 작업

-- 데이터 입력 INSERT
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300, 'Game', 100, 1700);

SELECT * FROM DEPARTMENTS ORDER BY DEPARTMENT_ID DESC;

-- 테이블 열의 구조를 확인
DESC DEPARTMENTS;

-- 특정 열만 입력 (미입력 시 NULL)
INSERT INTO departments(department_id, department_name)
VALUES (280, 'Music');

-- 열의 이름들을 생략하면 다 적어야함
INSERT INTO departments
VALUES (290, 'Busan', NULL, 1700);

-- 예제 1
INSERT INTO departments VALUES (271, 'Sample 1', 200, 1700);
INSERT INTO departments VALUES (272, 'Sample 2', 200, 1700);
INSERT INTO departments VALUES (273, 'Sample 3', 200, 1700);

-- 데이터의 수정 UPDATE : 특정행을 업데이트 하므로 WHERE절을 작성해야한다
UPDATE departments
SET manager_id = 200
WHERE department_name = 'Game';

-- 예제
UPDATE departments SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;

-- 두 개 이상 열을 업데이트 (열, 열, 열, ...)
UPDATE departments
SET manager_id = 100, location_id = 1800
WHERE department_name = 'Game';

-- 데이터의 삭제 DELETE
-- 특정 행을 where절에 넣어서 삭제
DELETE FROM departments
WHERE department_name = 'Music';

DELETE FROM departments
WHERE department_name = 'Game';

DELETE FROM departments
WHERE department_id = 290;

DELETE FROM departments
WHERE department_name LIKE '%Sample%';

-- 전체삭제 ( WHERE을 안 적었을 때)
DELETE FROM DEPARTMENTS; -- 직원 테이블에서 이걸 참조하고 있어서 바로 삭제불가

-- 120번 이상 부서들 삭제
DELETE FROM DEPARTMENTS
WHERE department_id >= 120;

-- COMMIT 전에는 ROLLBACK 가능
ROLLBACK;

-- GAME 부서를 생성하고 COMMIT
COMMIT;

-- 자동 커밋 설정여부 확인
SHOW AUTOCOMMIT;

-- ON 실행 시에 자동 COMMIT
SET AUTOCOMMIT ON;

-- OFF 실행 시에 수동 COMMIT
SET AUTOCOMMIT OFF;

