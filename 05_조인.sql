-- 조인(JOIN)

-- ON을 사용한 기본 조인
SELECT E.EMPLOYEE_ID 직원번호, E.LAST_NAME 이름, D.DEPARTMENT_ID 부서번호, D.DEPARTMENT_NAME 부서이름
FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
    
-- WHERE 절을 사용한 예전 조인방법
SELECT E.EMPLOYEE_ID 직원번호, E.LAST_NAME 이름, D.DEPARTMENT_ID 부서번호, D.DEPARTMENT_NAME 부서이름
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 3개 테이블 직원 부서 로케이션 테이블 조인하기
SELECT E.EMPLOYEE_ID 직원번호, D.DEPARTMENT_NAME 부서이름, L.CITY 도시
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON L.LOCATION_ID = D.LOCATION_ID;

-- 예제 다시 확인하기
SELECT D.department_name 부서명, L.city 도서, C.country_name 국가
FROM DEPARTMENTS D
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
JOIN COUNTRIES D ON L.CONUTRY_ID =  C.COUNTRY_ID
WHERE L.CITY IN('Seattle', 'London') AND C.COUNTRY_NAME LIKE 'United%';

-- 자체 조인
select e.last_name 직원, m.last_name 매니저
from employees e
join employees m
on e.manager_id = m.employee_id;

-- 외부 조인
-- 기본 조인(부서번호가 NULL인 직원은 제외, KIMBERELY)
SELECT e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON e.department_id = D.department_id;

SELECT * FROM employees WHERE department_id IS NULL; --부서번호가 NULL인 직원

-- LEFT 외부 조인 : 직원 테이블 중에 부서가 없는 직원도 출력
SELECT e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM EMPLOYEES E
LEFT OUTER JOIN DEPARTMENTS D
ON e.department_id = D.department_id;

-- RIGHT 외부 조인 : 부서 테이블에 있지만 직원테이블에서 사용하지 않는 부서도 전부 출력됨
SELECT e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM EMPLOYEES E
RIGHT OUTER JOIN DEPARTMENTS D
ON e.department_id = D.department_id;

-- FULL 외부 조인 : 조건에 맞지 않는 모든 데이터 줄을 출력함
SELECT e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM EMPLOYEES E
FULL OUTER JOIN DEPARTMENTS D
ON e.department_id = D.department_id;

-- 예제
SELECT c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호, l.city 도시
FROM countries C
LEFT OUTER JOIN locations L
ON c.country_id = l.country_id
ORDER BY l.location_id DESC;

-- 크로스 조인 예제 CROSS JOIN
SELECT c.country_name 국가, r.region_name 지역이름
FROM countries C
CROSS JOIN regions R;