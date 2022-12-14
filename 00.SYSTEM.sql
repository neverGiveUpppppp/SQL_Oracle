--DAA DICTIONARY = 데이터 사전
-- 데이터베이스에 관한 전반적인 정보 제공
-- 관리자 계정은 내용 변경에 대한 권한을 가지고 있지만
-- 일반 사용자계정은 읽기만 가능함(단순 조히ㅗ)

-- 계정 생성
-- 12c 이상에서부터 계정을 만들기 위해 앞에 c##을 붙여야만 가능하게 만듬
-- CREATE USER C##KH IDENTIFIED BY KH;
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- 11g 포함
CREATE USER KH IDENTIFIED BY KH; -- 권한 부여


-- 한줄 주석과 여러 줄 주석
/*
    관리자 계정 : = 시스템 계정
        데이터베이스 생성과 관리를 담당하는 슈퍼 유저 계정
        오브젝트의 생성, 변경 삭제 등 작업 가능
        데이터베이스에 대한 모든 권한과 책임을 갖는 계정
        
        
    사용자 계정 :  (ex. 사용자 정의 클래스. 사용자 정의 예외 → 필요에 의해 사용자가 생성)
        데이터베이스에 대하여 작업(질의, 갱신)을 수행할 수 있는 계정
        일반 계정은 보안을 위해 업무에 필요한 최소한의 권한만 가지는 것을 원칙으로 함
*/        
-- Data Dictionary - 데이터 사전
-- 데이터베이스에 관한 전반적인 정보 제공
-- 관리자 계정은 내용변경에 대한 권한을 가지고 있지만
-- 일반 사용자 계정은 읽기만 가능함(단순 조회)


-- 계정생성
-- 12c 이상에서부터 계정을 만들기 위해 앞에 C##붙여야만 가능하게 만듦
--CREATE USER C##KH IDENTIFIED BY KH;
--ALTER SESSION SET "_ORACLE_SCRIPTE"=TRUE; → C##안붙여도되는 코드
--Session이(가) 변경되었습니다. 나오면 앞으로 C##안붙여도 됨 ^^

-- 11g 포함
CREATE USER KH 
IDENTIFIED BY KH; -- 계정이름이 KH이고 비밀번호가 KH인 계정 생성
-- CREATE USER 계정명 IDENTIFY BY 비밀번호 → 계정명과 그에대한 비밀번호  생성

GRANT CONNECT, RESOURCE TO KH;  -- 권한부여
-- 부여하다 ~를  ~에게 계정명
-- CONNECT 접근 RESOURCE 저장

-- 12C 이상부터 용량제한 없애는 쿼리
--ALTER USER KH DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON



