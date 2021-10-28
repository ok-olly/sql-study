-- DCL : 데이터 제어어 (데이터베이스 사용 권한을 주고 회수하는 명령어)

-- 테이블 스페이스의 생성 (테이블을 생성할 수 있는 공간)
CREATE TABLESPACE johnSpace
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\john.dbf' SIZE 10M
AUTOEXTEND ON NEXT 5M;
-- 파일이름 john.dbf에 10mb 사이즈로 파일 생성, 자동으로 5mb씩 증가

-- 새 유저 존 생성, 비밀번호 1234, 테이블 스페이스 johnSpace 사용
CREATE USER john IDENTIFIED BY 1234 DEFAULT TABLESPACE johnSpace;

-- 존에게 접속권한 주기
GRANT CREATE SESSION TO john;

-- 존에게 테이블 만들기 권한 주기
GRANT CREATE TABLE TO john;

-- 롤(권한들의 모음)을 주기, CONNECT는 접속 관련 권한들, RESOURCE는 테이블 및 객체 사용권한
GRANT CONNECT, RESOURCE TO john;

-- DBA 롤은 관리자권한들이기 때문에 주지 않는다.

-- 권한을 제거 REVOKE 명령어
-- 유저 존에 테이블 생성, 객체 관련 모든 권한 제거
REVOKE CREATE TABLE, RESOURCE FROM john;
-- 접속 권한들 제거
REVOKE CONNECT FROM john;

-- 계정 삭제 (접속 중에 안되므로 접속 해제한 후에 삭제)
DROP USER john CASCADE;

-- 테이블 스페이스 삭제
DROP TABLESPACE johnSpace;

-- 계정에 비밀번호 변경: 스콧계정의 비번을 tiger로 변경
ALTER USER scott IDENTIFIED BY "tiger";

-- 현재 오라클 서버의 포트번호를 확인
SELECT dbms_xdb.gethttpport() FROM DUAL;

-- 나중에 톰캣 프로그램을 설치하면 이 서버는 똑같이 기본 8080이기 때문에 포트가 같아서 에러 발생

-- 미리 오라클의 포트 번호를 9090으로 바꿔보자
EXEC dbms_xdb.sethttpport(9090);
commit;
