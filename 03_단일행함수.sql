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

-- 예제
SELECT SALARY, ROUND(SALARY/30) 정수, ROUND(SALARY/30, 1) 소수1, ROUND(SALARY/30, -1) "10의자리"
FROM employees;

-- 날짜형 함수, SYSDATE는 현재 날짜를 의미
-- 일은 시간이 12시 이상이면 반올림
SELECT SYSDATE 현재날짜, ROUND(SYSDATE, 'DD') 일
FROM DUAL;

SELECT hire_date
FROM employees;

--  날짜형 함수 , sysdate는 현재 날짜를 의미

-- 일은 시간이 12시 이상이면 반올림
SELECT SYSDATE 현재날짜, ROUND(sysdate, 'DD') 일, ROUND(sysdate, 'MM') 월, ROUND(sysdate, 'YYYY') 년도
        , ROUND( MONTHS_BETWEEN('2021/10/5', '2021/06/10') , 1 ) 월차이
FROM DUAL;

SELECT hire_date FROM employees;

-- 날짜에 더하기 빼기를 하면 => 실제 날짜가 더하거나 빼진다.
SELECT sysdate 오늘날자, sysdate + 1 내일 , sysdate - 1 어제
FROM dual;

-- 예제 1, 2
SELECT sysdate, hire_date, MONTHS_BETWEEN(SYSDATE,hire_date) 월차이
FROM employees where department_id = 100;

SELECT hire_date, ADD_MONTHS(hire_date , 3) 더하기3개월, ADD_MONTHS(hire_date , -3) 빼기3개월
FROM employees WHERE employee_id BETWEEN 100 AND 106;

-- 변환형 함수
-- 숫자 => 문자로 변환
SELECT 
    TO_CHAR( 12345678 , '999,999,999') 콤마형식,
    TO_CHAR( 12345678.678 , '999,999,999.99') 콤마소수점형식,
    TO_CHAR( 12345678 , '$999,999,999') 달러형식,
    TO_CHAR( 12345678 , 'L999,999,999') 로컬통화
FROM DUAL;

-- 날짜 => 문자로 변환

SELECT 
    TO_CHAR( sysdate , 'YYYY/MM/DD') 날짜표시,
    TO_CHAR( sysdate , 'YYYY/MM/DD HH24:MI:SS') 시간표시
FROM DUAL;

-- 예제 1 EMPLOYEES 테이블에서 DEPARTMENT_ID가 100인 사원들의 입사일을 이용하여 날짜형식 '월/년도'
SELECT employee_id, TO_CHAR(hire_date, 'MM/YY') 입사월
FROM EMPLOYEES
WHERE department_id = 100;

-- 예제 2 EMPLOYEES 테이블에서 SALARY가 10000달러가 넘는 사원들의 이름과 월급을 월급이 많은순으로 나타내어라
SELECT LAST_name 이름, to_char(SALARY, '$999,999,999.99') 월급
FROM EMPLOYEES
WHERE SALARY > 10000
ORDER BY SALARY DESC;

-- 문자열을 날짜로 변환
SELECT TO_DATE('2011-01-01', 'YYYY-MM-DD')
FROM DUAL;

--문자열을 숫자로 변환
SELECT TO_NUMBER('0123')+100
FROM DUAL;

-- 널값 관련 함수 (NULL)
-- NVL(값, 0) => 만약 값이 널이면 0으로 변환
SELECT last_name, nvl(manager_id, 0) 매니저
FROM EMPLOYEES
WHERE LAST_NAME = 'King';

-- NVL2(값, 첫번째, 두번째) => 만약 값이 널값이 아니면 첫번째, 맞으면 두번째
SELECT last_name, nvl2(manager_id, 1, 0) 매니저
FROM EMPLOYEES
WHERE LAST_NAME = 'King';


-- 예제 1 employees 테이블에서 아래와 같이 이름, 월급(salary), 커미션(commission_pct)를 NVL함수 사용, 연봉은 (월급*12)+(월급*12*커미션)
SELECT last_name 이름, salary 월급, nvl(commission_pct, 0) 커미션, (salary*12)+salary*12*nvl(commission_pct, 0) 연봉
FROM employees;

--예제 2 위의 예제에 더하여 연봉계산은 nvl2함수를 사용하여 커미션이 있을 때와 없을 때 계산방법을 나타낸다
SELECT last_name 이름, salary 월급, nvl(commission_pct, 0) 커미션, (salary*12)+salary*12*nvl(commission_pct, 0) 연봉, nvl2(commission_pct, 'SAL+COMM', 'SAL') 연봉계산
FROM employees;

-- DECODE 함수
SELECT LAST_NAME 이름, JOB_ID, SALARY,
    DECODE(JOB_ID, 'IT_PROG', SALARY*1.10, 'ST_CLERK', SALARY*1.15, 'SA_REP', SALARY*1.20, SALARY) "수정월급"
FROM EMPLOYEES;

--예제 EMPLOYEES 테이블에서 DECODE 함수를 이용해서 월급에 따른 세율을 나타내세요. TRUNC(SALARY/2000)의 값이 0일 때 0%, 1일 때 9%,,,
SELECT last_name 이름, job_id 직무, salary 월급, DECODE(TRUNC(SALARY/2000), 0, 0, 1, 0.09, 2, 0.2, 3, 0.3, 4, 0.4, 5, 0.42, 6, 0.44, 7, 0.45, 0.45) 세율
FROM EMPLOYEES;

-- CASE 함수 비교가능
SELECT LAST_NAME 이름, JOB_ID, SALARY,
    CASE JOB_ID WHEN 'IT_PROG' THEN SALARY*1.10
                WHEN 'ST_CLERK' THEN SALARY*1.15
                WHEN 'SA_REP' THEN SALARY*1.20
                ELSE SALARY
    END "월급 수정"
FROM EMPLOYEES;


SELECT LAST_NAME 이름, JOB_ID, SALARY,
    CASE WHEN SALARY<5000 THEN 'LOW'
        WHEN SALARY<10000 THEN 'MEDIUM'
        WHEN SALARY<20000 THEN 'GOOD'
        ELSE 'EXCELLENT'
    END "급여 수준"
FROM EMPLOYEES;

-- 예제 EMPLOYEES 테이블에서 JOB_ID가 IT_PROG라면 EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY를 출력하되 SALARY가 9000이상이면 '상위급여', SALARY가 6000과 8999사이면 '중위급여', 그 외는 '하위급여'라고 출력
SELECT employee_id, first_name, last_name, salary,
    CASE WHEN SALARY>=9000 THEN '상위급여'
        WHEN SALARY>=6000 THEN '중위급여'
        ELSE '하위급여'
    END 급여등급
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';
