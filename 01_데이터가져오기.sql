-- 주석 단축키 CTRL+/
/*
여러줄
주석
*/
-- 1. 테이블의 모든 행과 열을 읽어오기, 명령문 실행은 CTRL+ENTER
-- * 은 전체 열, 명령문 끝에는 세미콜론(;)이 있어야한다.
SELECT * 
FROM departments;

-- 2. 특정 열만 조회하기
SELECT department_id, department_name FROM departments;

-- 3. 별칭 붙이기 (열의 이름)
SELECT department_id AS 부서번호, department_name 부서이름 FROM departments;

-- 4. 산술 연산자 ( +,-,*,/)
SELECT first_name 이름, job_id 직책, salary 월급
FROM EMPLOYEES;

-- 월급에 100씩 뺀 열을 만들기
SELECT first_name 이름, job_id 직책, salary 월급, salary-100 월급수정
FROM EMPLOYEES;

-- 월급에 10%를 빼기
SELECT first_name 이름, job_id 직책, salary 월급, salary-salary/10 월급수정
FROM EMPLOYEES;

-- 보너스를 주는데 SALARY에 1000을 뺀 값의 5%로 책정
SELECT
    last_name,
    first_name,
    job_id,
    salary,
    (salary-1000)*0.05 AS 보너스
FROM EMPLOYEES;

-- DISTINCT : 중복값을 제거 !
SELECT DISTINCT JOB_ID
FROM employees;

-- 예제 1 EMPLOYEES 테이블에서 EMPLOYEE_ID, FIRST_NAME, LAST_NAME을 출력
SELECT employee_id, first_name, last_name
FROM EMPLOYEES;

-- 예제 2 EMPLOYEES 테이블에서 FIRST_NAME, SALARY, SALARY*1.1 AS 뉴셀러리 출력
SELECT first_name, salary, salary*1.1 AS 뉴셀러리
FROM EMPLOYEES;

-- 예제 3 EMPLOYEES 테이블에서 EMPLOYEE_ID는 '사원번호', FIRST_NAME은 '이름', LAST_NAME은 '성'으로 출력
SELECT employee_id AS 사원번호, first_name 이름, last_name 성
FROM EMPLOYEES;

-- 연결 연산자 || : 열을 붙여서 하나의 열로 출력
SELECT LAST_NAME || ' is a ' || job_id AS 직업정보
FROM EMPLOYEES;

-- 예제 4 EMPLOYEES 테이블에서 EMPLOYEE_ID를 출력, FIRST_NAME과 LAST_NAME을 붙여서 출력하지만 가운데 한 칸 띄우기, 다음 열에 EMAIL 출력하지만 @COMPANY.COM 문구 붙이기
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME NAME, EMAIL || '@COMPANY.COM' EMAIL
FROM EMPLOYEES;

DESC EMPLOYEES;

DESC DEPARTMENTS;