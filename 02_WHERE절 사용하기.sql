-- WHERE절
SELECT *
FROM EMPLOYEES
WHERE SALARY > 14000; -- 월급이 14000보다 많은 직원

SELECT *
FROM EMPLOYEES
WHERE LAST_NAME = 'King'; --문자열은 따옴표로 표시, 이름이 King인 직원

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE < '2002/06/10'; --날짜를 비교, 고용일이 2002년 6월 10일 이전

-- 예제 1 employees 테이블에서 employee_id가 100인 직원정보 출력
SELECT *
FROM employees
where employee_id = 100;

-- 예제 2 employees 테이블에서 first_name이 David인 직원정보 출력
SELECT *
FROM employees
where FIRST_NAME = 'David';

-- 예제 3 employees 테이블에서 employee_id가 105 이하인 직원 정보를 출력
SELECT *
FROM employees
where EMPLOYEE_ID <= 105;

-- 예제 4 job_history 테이블에서 start_date가 2006년3월3일 이후인 정보를 출력
SELECT *
FROM JOB_HISTORY
where START_DATE >= '2006/03/03';

-- 예제 5 departments 테이블에서 location_id가 1700이 아닌 모든 부서를 출력
SELECT *
FROM DEPARTMENTS
where LOCATION_ID <> 1700;

-- 논리 연산자 AND OR NOT
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60
OR DEPARTMENT_ID = 80
AND SALARY > 10000;

SELECT *
FROM employees
WHERE NOT (hire_date > '2004/01/01' OR salary > 5000);
-- hire_date <= '2004/01/01' AND salary <= 5000

-- 예제 1 employees 테이블에서 salary가 4000보다 크면서, job_id가 IT_PROG인 employee들을 조회
SELECT *
FROM employees
WHERE salary > 4000
AND job_id = 'IT_PROG';

-- 예제 2 employees 테이블에서 우선 salary는 4000보다 커야하고 job_id는 IT_PROG거나(or) FI_ACCOUNT인 경우 조회
SELECT *
FROM employees
WHERE salary > 4000
AND (job_id = 'IT_PROG'
OR job_id='FI_ACCOUNT');

-- IN 연산자 : ()안의 값과 같을 때  OR로 연결
SELECT *
FROM employees
WHERE salary IN ( 4000, 3000, 2700);

-- 예제 1 employees 테이블에서 salary가 10000, 17000, 24000인 직원 정보 출력
SELECT *
FROM employees
WHERE salary IN ( 10000, 17000, 24000 );

-- 예제 2 employees 테이블에서 departmet_ID가 30, 50, 80, 100, 110이 아닌 직원 출력
SELECT *
FROM employees
WHERE department_id NOT IN ( 30, 50, 80, 100, 110 );

-- between 사이값
SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

-- 예제 1 employees 테이블에서 salary가 10000 이상이고 20000 이하인 직원정보 출력
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

-- 예제 2 employees 테이블에서 hire_date가 2004년 1월 1일부터 2004년 12월 30일 사이인 직원정보 출력
SELECT *
FROM employees
WHERE hire_date BETWEEN '2004/01/01' AND '2004/12/30';

-- 예제 3 employees 테이블에서 salary가 7000 미만이거나, 17000 보다 많은 사원 출력
SELECT *
FROM employees
WHERE salary NOT BETWEEN 7000 and 17000;

-- LIKE 연산자 : _와 %를 같이 사용해서 문자열을 검색
SELECT *
FROM employees
WHERE last_name LIKE 'B%'; -- 대문자 B로 시작, 뒤에는 상관없음

SELECT *
FROM employees
WHERE last_name LIKE '%b%'; -- 문자열의 중간에 b가 있으면 전부 출력

SELECT *
FROM employees
WHERE last_name LIKE '____y'; -- 언더바(_)는 정확한 자릿수를 표현

-- 예제 1 employees 테이블에서 job_id 값이 AD를 포함하는 모든 데이터를 조회
SELECT *
FROM employees
WHERE job_id LIKE '%AD%';

-- 예제 2 employees 테이블에서 job_id가 AD를 포함하면서 AD 뒤에 따라오는 문자열이 3자리인 데이터 값을 갖는 직원정보 조회
SELECT *
FROM employees
WHERE job_id LIKE '%AD___';

-- 예제 3 employees 테이블에서 전화번호 뒷자리가 1234로 끝나는 직원정보 조회
SELECT *
FROM employees
WHERE phone_number LIKE '%1234';

-- 예제 4 employees 테이블에서 전화번호에 3이 들어가지 않으면서 전화번호 끝자리가 9로 끝나는 직원정보 조회
SELECT *
FROM employees
WHERE phone_number not LIKE '%3%'
AND phone_number LIKE '%9';

-- 예제 5 employees 테이블에서 job_id에 MGR을 포함하거나 ASST를 포함하는 직원정보 조회
SELECT *
FROM employees
WHERE job_id LIKE '%MGR%'
OR job_id LIKE '%ASST%';

SELECT commission_pct FROM employees;
-- null은 입력되지 않은 사용할 수 없는 값. 이 값은 0이나 공백(' ')이 아니다.
-- null값을 검색하기 위해 is NULL을 사용한다.
SELECT *
FROM employees
WHERE commission_pct is NULL;
-- null값이 아닌 경우만 찾을 때 is NOT NULL을 사용한다.
SELECT *
FROM employees
WHERE commission_pct is NOT NULL;