SELECT SYSDATE FROM DUAL;

-- �� �� �ּ��Դϴ�.
-- HR����(���������)�� ����ϰ� ��й�ȣ 1234 ����
ALTER USER HR ACCOUNT UNLOCK IDENTIFIED BY 1234;

-- SCOTT 계정을 설치및 비번정하기
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql;
ALTER USER scott 
IDENTIFIED BY 1234
ACCOUNT UNLOCK ;