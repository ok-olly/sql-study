-- 단일행 함수

-- 문자 함수
-- 대소문자 변환 UPPER LOWER INITCAP
SELECT UPPER('SQL COURES'), LOWER('SQL COURSE'), INITCAP('SQL COURSE') FROM DUAL; -- 듀얼 테스트용 테이블을 이용하여 연습

-- 문자 조작 함수
SELECT SUBSTR('ABCDEFG',3,4), LENGTH('ABCDEFG'), INSTR('ABCDEFG','D') FROM DUAL;
SELECT TRIM('   헬로우    '), '    헬로우   ' FROM DUAL; -- 공백을 없애준다.

-- 문자 함수 예제
SELECT department_id, last_name
FROM EMPLOYEES
WHERE LOWER(last_name) = 'higgins';

SELECT last_name, CONCAT('직업명이 ', job_id) AS 직업명
FROM employees
where substr(job_id, 4, 3) = 'REP';

-- 문자열의 가장 끝 문자(-1은 문자열의 가장 끝부터)
SELECT last_name, SUBSTR(last_name, -1, 1)
FROM employees;

-- 문자열 바꾸기
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM employees;

-- 예제 1 employees 테이블에서 last_name을 소문자와 대문자로 각각 출력하고, email의 첫번째 문자는 대문자로 출력
SELECT last_name 이름, LOWER(last_name) LOWER적용, UPPER(last_name) UPPER적용, EMAIL 이메일, INITCAP(EMAIL) INITCAP적용
FROM employees;

-- 예제 2 employees 테이블에서 job_id 데이터 값의 첫째 자리부터 시작해서 두 개의 문자를 출력
SELECT job_id 직업명, substr(job_id, 1, 2) 앞의2개
FROM employees;

-- 숫자형 함수
-- 반올림 함수 ROUND(숫자, 자릿수), 자릿수가 없으면 정수로 반올림
SELECT ROUND(15.193), ROUND(15.193, 0), ROUND(15.193, 1), ROUND(15.193, 2)
FROM DUAL;

-- 직원번호가 짝수번인 직원들만 출력
SELECT employee_id 짝수번째, last_name
FROM employees
WHERE MOD(employee_id, 2) = 0 -- 짝수
ORDER BY employee_id;

