SELECT SYSDATE FROM DUAL;

-- 한줄 주석입니다.
-- HR계정(연습용계정)을 언락하고 비밀번호 1234 지정 .
ALTER USER HR ACCOUNT UNLOCK 
IDENTIFIED BY 1234;

-- SCOTT 계정을 설치및 비번정하기
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql;
ALTER USER scott 
IDENTIFIED BY 1234
ACCOUNT UNLOCK ;