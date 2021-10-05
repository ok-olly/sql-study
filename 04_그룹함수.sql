-- 그룹함수 (다중행 함수, 집계함수)
SELECT ROUND(AVG(SALARY)) 평균값, MAX(SALARY) 최대값, MIN(SALARY) 최소값, SUM(SALARY) 합계, COUNT(SALARY) 카운트
FROM employees
WHERE JOB_ID LIKE '%REP%';

SELECT COUNT(*)
FROM EMPLOYEES;

SELECT COUNT(*)
FROM EMPLOYEES
WHERE department_id = 80; -- 80번 부서의 직원들

-- 그룹함수에서는 널값을 제외하고 계산한다. (단, 예외 COUNT(*))
SELECT COUNT(DEPARTMENT_ID)
FROM employees; -- 1명이 부서가 없음(KIMBERELY GRANT라는 사람임. 29번줄 실행시켜보기)

SELECT COUNT(DISTINCT DEPARTMENT_ID)
FROM employees; -- 중복되지 않은 부서의 개수

SELECT AVG(commission_pct)
FROM employees; -- 널값을 제외한 모든 직원들의 커미션 평균

-- GROUP BY 절 : 특정 그룹으로 나누어서 그룹함수를 사용
SELECT department_id 부서명, ROUND(AVG(SALARY)) 평균급여
FROM EMPLOYEES
GROUP BY department_id
ORDER BY DEPARTMENT_ID; --부서번호로 그룹나눔

SELECT *
FROM EMPLOYEES
WHERE department_id IS NULL; -- 부서가 없는 사람

-- 예제 1 부서별 사원수, 최대급여, 최소급여, 급여합계, 평균급여를 급여합계가 큰 순으로 조회
SELECT DEPARTMENT_ID 부서명, COUNT(*) 사원수, MAX(SALARY) 최대급여, MIN(SALARY) 최소급여, SUM(salary) 급여합계, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 급여합계 DESC;

-- 예제 2 부서별, 직업별(JOB_ID), 상사번호(MANAGER_ID)별로 그룹을 지어 SALARY 합계와 그룹별 직원의 숫자를 출력
SELECT department_id 부서번호, JOB_ID 직업, MAnAGER_ID 상사번호, SUM(salary) 월급합계, COUNT(*) 직원수
From employees
GROUP BY DEPARTMENT_ID, JOB_ID, MANAGER_ID
ORDER BY department_id;

-- 예제 3 부서별로 최고 월급을 뽑아서 평균을 내고, 최저월급 또한 평균을 내어 출력
SELECT
    AVG(MAX(SALARY)) 부서별최고월급평균,
    AVG(MIN(SALARY)) 부서별최저월급평균
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 그룹 함수의 조건절 HAVING
SELECT department_id 부서번호, COUNT(*) 사원수
FROM EMPLOYEES
GROUP BY department_id
HAVING COUNT(*) > 5; --사원수 5명이 넘는 부서

-- 예제 1
SELECT job_id 직종, SUM(SALARY) 월급여합계
FROM employees
WHERE job_id !='AC_MGR'
GROUP BY JOB_ID
HAVING AVG(salary) > 10000
ORDER BY 월급여합계 DESC;

-- 예제 2
SELECT department_id 부서번호, AVG(SALARY) 평균급여
FROM employees
WHERE department_id <> 40
GROUP BY department_id
HAVING AVG(salary) <= 7000;

-- 예제 3
SELECT job_id, SUM(SALARY) 급여총액
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY JOB_ID
HAVING SUM(SALARY) >= 13000
ORDER BY SUM(salary) DESC;