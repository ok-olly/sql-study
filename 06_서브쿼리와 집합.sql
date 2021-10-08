-- 서브쿼리

-- Popp 직원보다 늦게 입사한 사람 (Popp 직원의 고용일 먼저 알기, 그 다음에 이 고용일보다 늦은 사람 검색하기)
-- 주의점 :  단일행 서브쿼리를 사용할 때는 서브쿼리의 결과가 비교하는 데이터와 같고 하나만 출력되어야 한다.
SELECT last_name 이름, hire_date 고용일자
FROM employees
WHERE hire_date > ( SELECT hire_date
                    FROM employees
                    WHERE last_name = 'Popp' ); -- 괄호부분만 블럭지정해서 ctrl + enter 하면 얘만 나옴
                    
-- 그룹함수의 결과를 서브쿼리로 사용
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE salary = ( SELECT min(salary) FROM employees ) ;

-- 예제 1
SELECT last_name, salary
FROM employees
where salary > (SELECT salary FROM employees where last_name = 'Abel');
                
-- 예제 2
SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, salary 급여
FROM employees
WHERE department_id = ( SELECT department_id FROM employees where last_name = 'Bull')
AND salary > ( SELECT salary FROM employees WHERE last_name = 'Bull' );
                    
-- 예제 3
SELECT last_name , salary, manager_id
FROM employees
WHERE manager_id = (SELECT employee_id FROM employees WHERE last_name = 'Russell');
                    
-- 예제 4
SELECT *
FROM employees
where job_id = (SELECT job_id FROM JOBS where job_TITLE = 'Stock Manager');

-- 다중행 서브쿼리 (서브쿼리 결과가 여러 개의 행으로 출력)

SELECT MIN(SALARY) FROM EMPLOYEES GROUP BY department_id; -- 부서별 최저월급

-- 다중행 서브쿼리에서는 바로 =, <, > 비교를 할 수 없다.
-- IN은 값이 하나라도 같으면 검색됨
SELECT department_id, EMPLOYEE_ID, LAST_NAME -- 부서별 최저월급 받는 사람들
FROM employees
WHERE SALARY IN (SELECT MIN(SALARY) FROM EMPLOYEES GROUP BY department_id)
ORDER BY department_id;

-- ANY 도 값이 하나라도 맞으면 검색됨
SELECT department_id, LAST_NAME, salary
FROM employees
WHERE SALARY < ANY(SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG') -- 9000이 제일 큰 값이라 그 아래 작은 값 전부임
    AND JOB_ID != 'IT_PROG'
ORDER BY SALARY DESC;

-- ALL은 값이 전부 다 만족해야한다.
SELECT department_id, LAST_NAME, salary
FROM employees
WHERE SALARY < ALL(SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG') -- 4200이 제일 작은 값이라 그보다 작은 값만
    AND JOB_ID != 'IT_PROG'
ORDER BY SALARY DESC;

-- 예제 1
SELECT employee_id, first_name, JOB_ID 직종, SALARY 급여
FROM EMPLOYEES
WHERE MANAGER_ID IN (SELECT MANAGER_ID FROM EMPLOYEES WHERE DEPARTMENT_ID = 20)
AND DEPARTMENT_ID <> 20;

-- 예제 2
SELECT employee_id, last_name, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY < ANY (SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'ST_MAN') -- 즉 급여가 8000보다 작으면 다 출력
ORDER BY SALARY;

-- 예제 3
SELECT employee_id, last_name, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY < ALL (SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG') -- 즉 급여가 4200보다 작아야 출력 
ORDER BY SALARY DESC;

-- 다중열 서브쿼리 (열이 여러 개일 때)
-- 이름이 Bruce인 직원과 같은 매니저, 같은 직업인 사람을 출력
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, JOB_ID) IN (SELECT manager_id, JOB_ID FROM employees WHERE first_name = 'Bruce')
    AND first_name <> 'Bruce'; -- Bruce의 매니저 아이디가 103일테니까 브루스는 출력되지 않도록 뺀다
    
-- 부서별 최소 급여를 받는 직원들을 검색
SELECT department_id 부서번호, employee_id 사원번호, first_name, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, min(salary) FROM employees group by department_id)
order by department_id;

-- 예제 : 직업별 최소 월급을 받는 사람들을 출력
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN (SELECT job_id, min(salary) FROM employees group by job_id)
order by salary DESC;

-- 집합
-- UNION 합집합 : 중복을 제거한다. (결과 115개 행)
SELECT EMPLOYEE_ID 직원번호, JOB_ID 직종 FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID FROM job_history;

-- UNION ALL 합집합 : 두 개의 SELECT문의 결과를 합친다. (결과 117개 행)
SELECT EMPLOYEE_ID 직원번호, JOB_ID 직종 FROM EMPLOYEES
UNION ALL
SELECT EMPLOYEE_ID, JOB_ID FROM job_history;

-- INTERSECT 교집합 (결과 2개 행)
SELECT EMPLOYEE_ID 직원번호, JOB_ID 직종 FROM EMPLOYEES
INTERSECT
SELECT EMPLOYEE_ID, JOB_ID FROM job_history;

-- MINUS 차집합 (결과 105개 행 : 107-2)
SELECT EMPLOYEE_ID 직원번호, JOB_ID 직종 FROM EMPLOYEES
MINUS
SELECT EMPLOYEE_ID, JOB_ID FROM job_history;

-- 예제 1
SELECT DEPARTMENT_ID FROM EMPLOYEES
UNION
SELECT DEPARTMENT_ID FROM DEPARTMENTS;

-- 예제 2
SELECT DEPARTMENT_ID FROM EMPLOYEES
UNION ALL
SELECT DEPARTMENT_ID FROM DEPARTMENTS;

-- 예제 3
SELECT DEPARTMENT_ID FROM EMPLOYEES
INTERSECT
SELECT DEPARTMENT_ID FROM DEPARTMENTS;

-- 예제 4
SELECT DEPARTMENT_ID FROM DEPARTMENTS
MINUS
SELECT DEPARTMENT_ID FROM EMPLOYEES;