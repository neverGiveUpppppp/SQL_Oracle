------------------------------------------------------------------------------
--------------------------------PL/SQL(절차형 SQL)-----------------------------
------------------------------------------------------------------------------
/*

PL/SQL ( Procedural Language extension to SQL) = 절차형 SQL
오라클 자체에 내장되어있는 절차적 언어

절차적 언어(Procedural Language)란?
반복문,if문 같은 것들이 절차적으로 사용되는 코드들임
절차적 논리, 계산 같은 것들이 sql에서 사용되는 것

변수의 정의, 조건처리, 반복처리(반복문) 등을 지원하여 PL/SQL을 통해서 SQL의 단점 보완

PL/SQL의 구조
1.선언부(DECLARE SECTION)          :   DECLARE
2.실행부(EXECUTABLE SECTION)       :   BEGIN
3.예외처리부(EXCEPTION SECTION)     :   EXCEPTION

1.선언부(DECLARE SECTION)      : 변수, 상수 선언하는 부분 
        -> DECLARE로 시작
2.실행부(EXECUTABLE SECTION)   : 제어문, 함수 정의 등 로직을 기술 하는 부분 
        -> BEGIN으로 시작
3.예외처리부(EXCEPTION SECTION) : 예외 발생 시, 해결할 수 있는 문장 기술 부분 
        -> EXCEPTION으로 시작
        
선언부,예외처리부 생략가능
 - 필요에 따라 안 쓸 수도 있다는 의미
 
자바로 보면 
System.out.println("안녕");

String hello = "안녕";
System.out.println(hello);


*/

SET SERVEROUTPUT ON;  
BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLOW WORLD');
END;
/ 

SET SERVEROUTPUT ON;
BEGIN   
    DBMS_OUTPUT.PUT_LINE('HELLOW WORLD');
END;
/
-- / 포함해서 위 코드 옆에 주석 달면 에러 발생
-- SET SERVEROUTPUT ON; : 출력 결과에 뜨게끔 하는 코드
-- SP2-0265: serveroutput은 ON 또는 OFF로 설정되어야 합니다.
--      -> 주석이 위아래 옆 없어야한다. 시작부터 끝까지 안에 주석도 없어야해서 밖으로 빼줄 것 
-- PL/SQL 프로시저가 성공적으로 완료되었습니다.
-- 엔드로 끝나는게 맞는데 여기 문장이 끝이다라는 의미로 /까지 적어줘야함


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- 선언부 작성

/*
-- 자바코드로 예시
-- 이 자바코드를 선언부로 작성해 볼 것임

-선언부
int empId;
String empName;
final int PI = 3.14; -- 선언 초기화 같이하면 선언부 쪽

-실행부
empId = 888;        -- 값 초기화 부분도 실행부로 본다.
empName = "도대담";  
System.out.println("empId : " + empId;
System.out.println("empName : " + empName);
System.out.println("PI : " + PI);

*/

-- 선언부
DECLARE -- 변수설정 // 변수 3개
    EMP_ID NUMBER;          -- 얘는 따로따로 직접 지정해서 쓴 것
    EMP_NAME VARCHAR(30);   -- 따로 쓰는게 아닌 참조해서 쓰는 방법도 있음
    PI CONSTANT NUMBER := 3.14; -- 상수 넘버. 오라클에서의 상수는 CONSTANT
                                -- 오라클의 대입연산자 : :=
                                
-- 실행부                                
BEGIN
    EMP_ID := 888;
    EMP_NAME := '도대담';

    DBMS_OUTPUT.PUT_LINE('EMP_ID ' || EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMP_NAME : ' || EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('PI : ' || PI);
END;
/ 
---RE
DECLARE
    EMP_ID NUMBER;
    EMP_NAME VARCHAR2(30);
BEGIN
    EMP_ID = 999;
    EMP_NAME = 'A';
    DBMS_OUTPUT.PUT_LINE(EMP_ID);
END;
/

-- EMP_ID의 정보를 참조해 올 것임
-- 선언부
DECLARE
    EMP_ID EMPLOYEE.EMP_ID%TYPE;
    EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
-- 실행부
BEGIN
    SELECT EMP_ID, EMP_NAME
    INTO EMP_ID, EMP_NAME
    FROM EMPLOYEE
--    WHERE EMP_ID = 200;
    WHERE EMP_ID = '&사원';
    
    DBMS_OUTPUT.PUT_LINE('사번 : '||EMP_ID);
    DBMS_OUTPUT.PUT_LINE('이름 : '||EMP_NAME);
    
END;
/
-- EMP_ID의 정보를 참조해 올 것임
DECLARE
    EI EMPLOYEE.EMP_ID%TYPE;
    EN EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME
    INTO EI, EN
    FROM EMPLOYEE
    WHERE EMP_ID = 200;
    
    DBMS_OUTPUT.PUT_LINE(EI); 
END;
/

/* 문제
레퍼런스 변수로 EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, SALARY를 선언하고
EMPLOYEE 테이블에서 사번, 이름, 직급코드, 부서코드, 급여를 조회하고
선언한 레퍼런스 변수에 담아 출력하시오
단, 입력받은 이름과 일치하는 조건의 직원을 조회하세요.                               
*/

DECLARE
    
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
    INTO EI, EN,DC,JC,SAL
    FROM EMPLOYEE
    
END;
/

DECLARE 
    EMP_ID EMPLOYEE.EMP_ID%TYPE;
    EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
    DEPT_CODE EMPLOYEE.DEPT_CODE%TYPE;
    JOB_CODE EMPLOYEE.JOB_CODE%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
    INTO EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
    FROM EMPLOYEE
    WHERE EMP_NAME = '&이름';
    
    DBMS_OUTPUT.PUT_LINE('사번 : '||EMP_ID);
    DBMS_OUTPUT.PUT_LINE('이름 : '||EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('부서CODE : '||DEPT_CODE);
    DBMS_OUTPUT.PUT_LINE('잡코드 : '||JOB_CODE);
    DBMS_OUTPUT.PUT_LINE('연봉 : '||SALARY);
END;
/



/* 문제
레퍼런스 변수로 EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, SALARY를 선언하고
EMPLOYEE 테이블에서 사번, 이름, 직급코드, 부서코드, 급여를 조회하고
선언한 레퍼런스 변수에 담아 출력하시오
단, 입력받은 이름과 일치하는 조건의 직원을 조회하세요.                               
*/

DECLARE
    EMP_ID EMPLOYEE.EMP_ID%TYPE;
    EN EMPLOYEE.EMP_NAME%TYPE;
    DC EMPLOYEE.DEPT_CODE%TYPE;
    JC EMPLOYEE.JOB_CODE%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, SALARY
    INTO EMP_ID, EN, DC, JC, SAL
    FROM EMPLOYEE
    WHERE EMP_NAME = '&사원명';
    
    DBMS_OUTPUT.PUT_LINE('EMP_ID : '||EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EN : '||EN);
    DBMS_OUTPUT.PUT_LINE('DC : '||DC);  
    DBMS_OUTPUT.PUT_LINE('JC : '||JC);
    DBMS_OUTPUT.PUT_LINE('SAL : '||SAL);
END;
/

/* -- 출력 결과
EMP_ID 209
EMP_NAME 심봉선
DEPT_CODE D5
JOB_CODE J3
SALARY 3500000
*/


--변수를 많이 쓴다면?

-- 한 행 전체를 가지고 오는 레퍼런스
-- %ROWTYPE

DECLARE
    E EMPLOYEE%ROWTYPE;
BEGIN 
    SELECT *
    INTO E
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    
    DBMS_OUTPUT.PUT_LINE('사번 : '||E.EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMP_NAME : '||E.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('SALARY : '||E.SALARY);
END;
/

-- 한 행 전체 참조 : %ROWTYEP + INTO
DECLARE
   E EMPLOYEE%ROWTYPE;
BEGIN 
    SELECT *
    INTO E
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    
    DBMS_OUTPUT.PUT_LINE('사번 : ' ||E.EMP_ID);
END;
/
-- 선언부 생략 가능하니 각각 세미콜론(;)으로 마침을 해줘야한다

---RE
-- %ROWTYPE
DECLARE
    EMP EMPLOYEE%ROWTYPE;
BEGIN
    SELECT * 
    INTO EMP
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    
    DBMS_OUTPUT.PUT_LINE('사번 : ' ||EMP.EMP_ID);
    DBMS_OUTPUT.PUT_LINE('이름 : ' ||EMP.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('SALARY : ' ||EMP.SALARY);
END;
/
------------------------------------------------------------------------------
-----------------------------------조건문--------------------------------------
------------------------------------------------------------------------------

-- 조건문

-- IF ~ THEN ~ END IF;
-- IF ~ THEN ~ END IF= 자바 단일 IF문


-- EMP_ID를 입력받아 해당 사원의 사번, 이름, 급여, 보너스율 출력
-- 보너스를 받지 않는 사원은 보너스율 출력 전 '보너스를 지급받지 않는 사원입니다.' 출력
-- 일단 IF문 없이

--선언부
DECLARE  -- 변수설정 // 변수 
    EMP_ID EMPLOYEE.EMP_ID%TYPE;
    EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
    BONUS EMPLOYEE.BONUS%TYPE;
--실행부
BEGIN 
    SELECT EMP_ID,EMP_NAME,SALARY, BONUS
    INTO EMP_ID,EMP_NAME,SALARY, BONUS -- 별칭인지 여부 확인하자
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    
    DBMS_OUTPUT.PUT_LINE('사번:' || EMP_ID);

END;
/


-- 조건문

-- IF ~ THEN ~ END IF;
-- IF ~ THEN ~ END IF= 자바 단일 IF문


-- EMP_ID를 입력받아 해당 사원의 사번, 이름, 급여, 보너스율 출력
-- 보너스를 받지 않는 사원은 보너스율 출력 전 '보너스를 지급받지 않는 사원입니다.' 출력

-- NVL 적용 + BNS = 0
DECLARE 
    EI EMPLOYEE.EMP_ID%TYPE;
    EN EMPLOYEE.EMP_NAME%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    BNS EMPLOYEE.BONUS%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY, NVL(BONUS,0)
    INTO EI, EN, SAL, BNS
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    
    IF BNS = 0
        THEN DBMS_OUTPUT.PUT_LINE('보너스X 사원');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('사번:' || EI);
    DBMS_OUTPUT.PUT_LINE('이름:' || EN);
    DBMS_OUTPUT.PUT_LINE('월급:' || SAL);
    DBMS_OUTPUT.PUT_LINE('보너스:' || BNS*100||'%');
    
END;
/

-- BNS IS NULL
DECLARE 
    EI EMPLOYEE.EMP_ID%TYPE;
    EN EMPLOYEE.EMP_NAME%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    BNS EMPLOYEE.BONUS%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY, BONUS
    INTO EI, EN, SAL, BNS
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    
    IF BNS IS NULL
        THEN DBMS_OUTPUT.PUT_LINE('보너스 없는 사원');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('사번:' || EI);
    DBMS_OUTPUT.PUT_LINE('이름:' || EN);
    DBMS_OUTPUT.PUT_LINE('월급:' || SAL);
    DBMS_OUTPUT.PUT_LINE('보너스:' || BNS*100||'%');
    
END;
/




------------------------------------------------------------------------------

-- IF ~ THEN ~ ELSE ~ END IF
-- IF ~ THEN ~ ELSE ~ END IF == IF ~ ELSE문


-- EMP_ID를 입력받아 해당 사원의 사번, 이름, 부서명, 소속 출력
-- TEAM 변수를 만들어 소속이 KO인 사원은 국내팀, 아닌 사원은 해외팀으로 저장

DECLARE
    EL EMPLOYEE.EMP_ID%TYPE;
    EN EMPLOYEE.EMP_NAME%TYPE;
    DT DEPARTMENT.DEPT_TITLE%TYPE;
    NC LOCATION.NATIONAL_CODE%TYPE;
    TEAM VARCHAR2(10);
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE
    INTO EL, EN, DT, NC
    FROM EMPLOYEE
        LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
        LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
    WHERE EMP_ID = '&사번';
    
    IF NC = 'KO'
        THEN TEAM := '국내팀';
    ELSE TEAM := '해외팀';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('사번 ' || EL);
    DBMS_OUTPUT.PUT_LINE('성함 ' || EN);
    DBMS_OUTPUT.PUT_LINE('부서명 ' || DT);
    DBMS_OUTPUT.PUT_LINE('소속 ' || TEAM);
END;
/


DECLARE
    EMP_ID EMPLOYEE.EMP_ID%TYPE;
    EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
    DEPT_TITLE DEPARTMENT.DEPT_TITLE%TYPE;
    NATIONAL_CODE LOCATION.NATIONAL_CODE%TYPE;
    TEAM VARCHAR(10);
    
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE
    INTO EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE
    FROM EMPLOYEE
        LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
        LEFT JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
    WHERE EMP_ID = '&사번';
    
    IF national_code = 'KO'
        THEN TEAM := '국내팀';
    ELSE TEAM := '해외팀';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('사번 : ' || EMP_ID); 
    DBMS_OUTPUT.PUT_LINE('이름 : ' || EMP_NAME); 
    DBMS_OUTPUT.PUT_LINE('부서 : ' || DEPT_TITLE);
    DBMS_OUTPUT.PUT_LINE('소속 : ' || TEAM);
END;
/

-- EMP_ID를 입력받아 해당 사원의 사번, 이름, 부서명, 소속 출력
-- TEAM 변수를 만들어 소속이 KO인 사원은 국내팀, 아닌 사원은 해외팀으로 저장
-- 변수명 바꿔서 다시한번
DECLARE
    EI EMPLOYEE.EMP_ID%TYPE;
    EN EMPLOYEE.EMP_NAME%TYPE;
    DT DEPARTMENT.DEPT_TITLE%TYPE;
    NC LOCATION.NATIONAL_CODE%TYPE;
    TEAM VARCHAR2(10);
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE
    INTO EI, EN, DT, NC
    FROM EMPLOYEE
        LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
        LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
    WHERE EMP_ID = '&사번';
    
    IF NC = 'KO'
        THEN TEAM := '국내팀';
    ELSE TEAM := '해외팀';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('사번 : ' || EI); 
    DBMS_OUTPUT.PUT_LINE('이름 : ' || EN); 
    DBMS_OUTPUT.PUT_LINE('부서 : ' || DT);
    DBMS_OUTPUT.PUT_LINE('소속 : ' || NC);   
END;
/


-- 사용자에게 사번을 받아와 그 사원의 전체 정보를 VEMP에 저장
-- VEMP를 이용하여 연봉 계산(보너스가 있는 사원은 보너스도 포함하여 계산)
-- 연봉 계산 결과 값은 YSALARY에 저장
-- 급여 이름 연봉(\1,000,000 형식)으로 출력
-- (IF없이 NVL문으로도 가능)

-- 사원 1명의 전체정보니까 한 행 전체 -> %ROWTYPE


DECLARE
    VEMP EMPLOYEE%ROWTYPE;
    YSALARY NUMBER;
BEGIN
    SELECT *
    INTO VEMP
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    
    IF VEMP.BONUS IS NOT NULL
        THEN YSALARY := (VEMP.SALARY + VEMP.SALARY * VEMP.BONUS)*12;
    ELSE YSALARY := VEMP.SALARY * 12;
    END IF;

    DBMS_OUTPUT.PUT_LINE(VEMP.SALARY||' '|| VEMP.EMP_NAME||' '||
                        TO_CHAR(YSALARY, 'FML999,999,999'));
END;
/


DECLARE
    VEMP EMPLOYEE%ROWTYPE;
    YSALARY NUMBER;
BEGIN
    SELECT *
    INTO VEMP
    FROM EMPLOYEE
    WHERE EMP_ID = '&사원번호';
    
    IF VEMP.BONUS IS NOT NULL   
        THEN YSALARY := VEMP.SALARY * (1+VEMP.BONUS)*12;
    ELSE YSALARY := VEMP.SALARY*12;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(VEMP.EMP_ID); 
    -- SELECT에서 *전체 불러오기 때문에 변수명.컬럼명으로 명시해서 불러와야한다
    DBMS_OUTPUT.PUT_LINE(VEMP.SALARY||' '||VEMP.EMP_NAME||' '||YSALARY||
                        TO_CHAR(YSALARY,'FML999,999,999')); 
    
END;
/

-- 사용자에게 사번을 받아와 그 사원의 전체 정보를 VEMP에 저장
-- VEMP를 이용하여 연봉 계산(보너스가 있는 사원은 보너스도 포함하여 계산)
-- 연봉 계산 결과 값은 YSALARY에 저장
-- 급여 이름 연봉(\1,000,000 형식)으로 출력
-- (IF없이 NVL문으로도 가능)
DECLARE
    VEMP EMPLOYEE%ROWTYPE;
    YSALARY NUMBER;
BEGIN
    SELECT *
    INTO VEMP
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    
    IF VEMP.BONUS IS NOT NULL
        THEN YSALARY := VEMP.SALARY*(1+VEMP.BONUS)*12;
    ELSE YSALARY := VEMP.SALARY*12;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(VEMP.SALARY||' '||vemp.EMP_NAME||' '||
                        TO_CHAR(YSALARY,'FML999,999,999'));     
    
    
END;
/

------------------------------------------------------------------------------

-- IF~ THEN~ ELSIF~ THEN~ ELSE~ END IF
-- IF~ THEN~ ELSIF~ THEN~ ELSE~ END IF == IF~ ELSE IF~ ELSE문


-- 점수를 입력받아 SCORE 변수에 저장
-- 90점 이상이면 A, 80이상이면 B, 70이상은 C, 60점 이상은 D, 그 미만은 F 처리하여 GRADE 변수에 저장
-- 출력형식 : 당신의 점수는 N점이고, 학점은 M학점입니다.



DECLARE
    SCORE NUMBER;
    GRADE VARCHAR2(1);
BEGIN 
    SCORE := '&점수입력';
    
    IF SCORE >= 90
        THEN GRADE := 'A';
    ELSIF SCORE >= 80
        THEN GRADE := 'B';
    ELSIF SCORE >= 70
        THEN GRADE := 'C';
    ELSE GRADE := 'F';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('당신의 점수는 '||SCORE||'점이고, 학점은 '||GRADE||'학점입니다.');
END;
/



DECLARE
    SCORE NUMBER;
    GRADE VARCHAR2(1);
BEGIN
    SCORE := '&점수';
        
    IF SCORE >= 90
        THEN GRADE := 'A';
    ELSIF SCORE >= 80
        THEN GRADE := 'B';
    ELSIF SCORE >= 70
        THEN GRADE := 'C';
    ELSIF SCORE >= 60
        THEN GRADE := 'D';
    ELSE GRADE := 'F';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('당신의 점수는 '||SCORE||'점이고, 학점은 '||GRADE||'점 입니다'); 
END;
/
-- 점수를 입력받아 SCORE 변수에 저장
-- 90점 이상이면 A, 80이상이면 B, 70이상은 C, 60점 이상은 D, 그 미만은 F 처리하여 GRADE 변수에 저장
-- 출력형식 : 당신의 점수는 N점이고, 학점은 M학점입니다.

DECLARE
    SCORE NUMBER;
    GRADE VARCHAR2(1);
BEGIN
    SCORE := '&점수';
    
    IF SCORE >= 90
        THEN GRADE := 'A';
    ELSIF SCORE >= 80
        THEN GRADE := 'B';
    ELSIF SCORE >= 70
        THEN GRADE := 'C';
    ELSIF SCORE >= 60
        THEN GRADE := 'D';
    ELSE GRADE := 'F';
    END IF; 
    
    DBMS_OUTPUT.PUT_LINE('당신의 점수는 '||SCORE||'점이고, 학점은 '||GRADE||'학점 입니다.');
END;
/

SET SERVEROUTPUT ON;
------------------------------------------------------------------------------
------------------------------------------------------------------------------

-- CASE~ WHEN~ THEN~ END(SWITCH문)

-- 프로그램 재실행 후 프린트만 찍히고 다른 내용들이 안나온다면,
-- SET SERVEROUTPUT ON; 코드 찍어주고 하면 다 잘나올 것

-- IF문은 THEN마다 세미콜론( ; )이 들어가지만 CASE WHEN THEN END문은 안들어가고 마지막 END에만





-- 사원 번호를 입력하여 해당 사원의 사번,이름,부서명 출력
-- 선언부

DECLARE 
    EI EMPLOYEE%ROWTYPE;
    DEP DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
    SELECT *
    INTO EI
    FROM EMPLOYEE
--        LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
    WHERE EMP_ID = '&사원';
    
    DEP := CASE 
                WHEN EI.DEPT_CODE = 'D1' THEN '인사관리부'               
                WHEN EI.DEPT_CODE = 'D2' THEN '회계관리부'
                ELSE '배정X'
           END;    
    
    DBMS_OUTPUT.PUT_LINE(EI.EMP_ID||' '||EI.EMP_NAME||' '||DEP);
    
END;
/

DECLARE 
    EI EMPLOYEE%ROWTYPE;
    DEP DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
    SELECT *
    INTO EI
    FROM EMPLOYEE
--        LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
    WHERE EMP_ID = '&사원';
    
    DEP := CASE EI.DEPT_CODE
                WHEN 'D1' THEN '인사관리부'               
                WHEN 'D2' THEN '회계관리부'
                ELSE '배정X'
           END;    
    
    DBMS_OUTPUT.PUT_LINE(EI.EMP_ID||' '||EI.EMP_NAME||' '||DEP);
    
END;
/

DECLARE -- 변수설정 // 변수 2개
    EMP EMPLOYEE%ROWTYPE; -- EMPLOYEE테이블의 EMP_ID의 데이터를 참조하겠다
    DNAME DEPARTMENT.DEPT_TITLE%TYPE;
-- 실행부
BEGIN
    SELECT * INTO EMP    
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
-- 방법1
--    DNAME := CASE
--                WHEN EMP.DEPT_CODE = 'D1' THEN '인사관리부'
--                WHEN EMP.DEPT_CODE = 'D2' THEN '회계관리부'
--                WHEN EMP.DEPT_CODE = 'D3' THEN '마케팅부'
--                WHEN EMP.DEPT_CODE = 'D4' THEN '국내영업부'
--                WHEN EMP.DEPT_CODE = 'D5' THEN '해외영업1부'
--                WHEN EMP.DEPT_CODE = 'D6' THEN '해외영업2부'
--                WHEN EMP.DEPT_CODE = 'D7' THEN '해외영업3부'
--                WHEN EMP.DEPT_CODE = 'D8' THEN '기술지원부'
--                WHEN EMP.DEPT_CODE = 'D9' THEN '총무부'
--                ELSE '배정X'
--            END;
-- 방법2
    DNAME := CASE EMP.DEPT_CODE
                WHEN 'D1' THEN '인사관리부'
                WHEN 'D2' THEN '회계관리부'
                WHEN 'D3' THEN '마케팅부'
                WHEN 'D4' THEN '국내영업부'
                WHEN 'D5' THEN '해외영업1부'
                WHEN 'D6' THEN '해외영업2부'
                WHEN 'D7' THEN '해외영업3부'
                WHEN 'D8' THEN '기술지원부'
                WHEN 'D9' THEN '총무부'
                ELSE '배정X'
            END;
    DBMS_OUTPUT.PUT_LINE(EMP.EMP_ID||' '||EMP.EMP_NAME||' ' ||DNAME);
    
END;
/

------------------------------------------------------------------------------
--------------------------------------반복문-----------------------------------
------------------------------------------------------------------------------

-- 반복문


-- BASIC LOOP
-- LOOP ~ END LOOP;
-- 반복할 내용을 작성하고 마지막에 반복을 벗어날 조건 명시
-- FOR문과 다르게 단순 반복만


-- 1~5까지 순차적 출력

DECLARE
    N NUMBER := 1;
BEGIN
    LOOP 
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;
        EXIT WHEN N > 5;
    END LOOP;
END;
/

DECLARE
    N NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;
        EXIT WHEN N > 5;
    END LOOP;
END;
/

DECLARE
 N NUMBER := 1;
BEGIN
    LOOP
    DBMS_OUTPUT.PUT_LINE(N);
    N := N + 1;
    
        IF N > 5 THEN EXIT;
        END IF;
    END LOOP;
END;
/

DECLARE
    N NUMBER := 1; -- 값 초기화
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;         -- i+1처럼 값 증가
-- 방법1        
--        IF N > 5 THEN EXIT; -- 반복문 종료 조건
--        END IF;
-- 방법2
        EXIT WHEN N > 5;    -- 반복문 종료 조건
    END LOOP;
END;
/
-- 1~5까지 세로로 정상출력됨



-- 반복 종료 방법 2가지
/*
-- 방법1        
IF N > 5 THEN EXIT; -- 반복문 종료 조건
END IF;
-- 방법2
EXIT WHEN N > 5;
*/
------------------------------------------------------------------------------

-- FOR LOOP

-- 특별한 목적이 있지 않는 이상 DECLARE 선언부가 필요X
-- 가데이터를 넣어서 미리 돌려보기 위해 FOR LOOP을 써서 가데이터를 많이 넣는데 사용한다

-- 1~5까지 순차적 출력

DECLARE
    N NUMBER := 1;
BEGIN
    LOOP
    DBMS_OUTPUT.PUT_LINE(N);
    N := N + 1;
        IF N > 5 THEN EXIT;
        END IF;
    END LOOP;
END;
/
BEGIN
    FOR N IN 1..5
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/

BEGIN
    FOR N IN 1..5   -- 의미 1부터 5까지 // .. 2개 점 3개쓰며 에러발생
    LOOP            --  N은 자동적으로 NUMBER타입의 변수 설정됨
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/

-- 5~1까지 출력
BEGIN
    FOR NN IN REVERSE 1..5
    LOOP
        DBMS_OUTPUT.PUT_LINE(NN);
    END LOOP;
END;
/

BEGIN
    FOR N2 IN REVERSE 5..1  -- 기본적으로 앞 숫자가 작아야 FOR문이 돌게된다. 
    LOOP                    -- REVERSE 붙일 것
        DBMS_OUTPUT.PUT_LINE(N2);
    END LOOP;
END;
/

BEGIN
    FOR N2 IN REVERSE 5..1  -- 기본적으로 앞 숫자가 작아야 FOR문이 돌게된다. 
    LOOP                    -- REVERSE 붙일 것
        DBMS_OUTPUT.PUT_LINE(N2);
    END LOOP;
END;
/
-- REVERSE 추가 전 FOR N2 IN 5..1로만 출력하면,
-- PL/SQL 프로시저가 성공적으로 완료되었습니다. 뜨지만 아무것도 안뜬다

-- 현업 사용 예시
-- 가데이터 넣기
BEGIN
    FOR N IN 1..30   
    LOOP            
        INSERT INTO TB1 VALUES(I); -- -- 가데이터 넣기
    END LOOP;
END;
/

------------------------------------------------------------------------------

-- WHILE LOOP

-- 변수 값 초기화 시, 덮어쓰기 가능
-- ex)위에 코드에서 N 이미 사용했지만 아래서 다시 값 초기화해서 사용됨

-- 1~5까지 순차적 출력

DECLARE
    N NUMBER := 1;
BEGIN
    WHILE N <= 5
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;
    END LOOP;
END;
/

DECLARE
    N NUMBER := 1;
BEGIN
    WHILE N <= 6
    LOOP 
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;
    END LOOP;
END;
/

DECLARE
    N NUMBER := 1;
BEGIN
    WHILE N < 5
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;
    END LOOP;
END;
/

DECLARE
    N NUMBER := 1; -- 값 초기화
BEGIN
    WHILE N <= 5
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;     -- N + 1의 LOOP 안 위치 중요. 기억!
    END LOOP;
END;
/

-- 5~1까지 출력
DECLARE
    N NUMBER := 5;
BEGIN
    WHILE N >= 1
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N - 1;
    END LOOP;
END;
/

DECLARE
    N NUMBER := 5; -- 값 초기화
BEGIN
    WHILE N >= 1
    LOOP 
        DBMS_OUTPUT.PUT_LINE(N);
        N := N - 1;     -- N - 1의 LOOP 안 위치 중요. 기억!
    END LOOP;
END;
/


-- 구구단 출력
-- 짝수 단 출력
-- 1)WHILE문
-- 2)FOR문 - WHILE문
-- 3)WHILE문 - FOR문

-- 1-9단 FOR문 출력
-- FOR문 안에서 연산가능
BEGIN
    FOR N IN 2..8/2 -- FOR문 안에서 연산가능
    LOOP
        DBMS_OUTPUT.PUT_LINE('---'||N||'단---');    
        FOR NN IN 1..9
        LOOP
            DBMS_OUTPUT.PUT_LINE(N||' x '||NN||' = '||N*NN);
        END LOOP;
    END LOOP;
END;
/

BEGIN
    FOR N IN 1..9
    LOOP
        DBMS_OUTPUT.PUT_LINE('---'||N||'단---');
        FOR M IN 1..9
        LOOP
            DBMS_OUTPUT.PUT_LINE(N||' x '||M||' = '||N*M );
        END LOOP;
    END LOOP;
END;
/

-- 1-9단 WHILE문 출력
DECLARE
    N NUMBER := 1;
    NN NUMBER := 1;
BEGIN
    WHILE N <= 9
    LOOP
        DBMS_OUTPUT.PUT_LINE('---'||N||'단---'); 
        
        DECLARE
            NN NUMBER := 1;
        BEGIN   
            WHILE NN <= 9
            LOOP
            DBMS_OUTPUT.PUT_LINE(N||' x '||NN||' = '||N*NN);
            NN := NN + 1;
            END LOOP;    
            N := N + 1;
        END;
    END LOOP;
END;
/

-- 짝수 단 출력


-- WHILE문
-- 에러남... 미완성
DECLARE
    N NUMBER := 1; -- 값 초기화
BEGIN
    WHILE N <= 9
    LOOP
        DBMS_OUTPUT.PUT_LINE('---'||N||'단---');
        
        DECLARE
            M NUMBER := 1; -- 값 초기화
        BEGIN
            WHILE M <= 9
            LOOP
                DBMS_OUTPUT.PUT_LINE(N||' x '||M||' = '||N*M );
                M := M + 1;
            END LOOP; 
            N := N + 1;     -- N + 1의 LOOP 안 위치 중요. 기억!
    END LOOP;
END;
/

COMMIT;
------------------------------------------------------------------------------
----------------------------예외 처리(EXCEPTION)--------------------------------
------------------------------------------------------------------------------

-- 예외 처리(EXCEPTION)

-- NO_DATA_FOUND : SELECT문이 데이터 행을 반환하지 못할 때
-- DUP_VAL_ON_INDEX : UNIQUE 제약조건이 들어간 컬럼에 중복 값이 들어갔을 때
--                      DUPLICATE VALUE ON INDEX
-- ZERO_DIVIDE : 0으로 나눌 때


-- DUP_VAL_ON_INDEX
BEGIN
    UPDATE EMPLOYEE
    SET EMP_ID = '&사번'
    WHERE EMP_ID = 200;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('이미 존재하는 사번입니다.');
END;
/
BEGIN
    UPDATE EMPLOYEE
    SET EMP_ID = '&사번' -- 201 인풋
    WHERE EMP_ID = 200;
    -- ERROR : ORA-00001: unique constraint (KH.EMPLOYEE_PK) violated
    -- 예외처리 해보자
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('이미 존재하는 사번입니다.');
END;
/
BEGIN
    UPDATE EMPLOYEE
    SET EMP_ID = '&사원'
    WHERE EMP_ID = 999;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX
    THEN DBMS_OUTPUT.PUT_LINE('이미 존재하는 사번입니다.');
END;
/

-- NO_DATA_FOUND
DECLARE
    NAME VARCHAR2(30);
BEGIN
    SELECT EMP_NAME INTO NAME
    FROM EMPLOYEE
    WHERE EMP_ID = 0;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('조회 결과가 없습니다');
END;
/
DECLARE
    FIND VARCHAR2(30);
BEGIN
    SELECT EMP_NAME 
    INTO FIND
    FROM EMPLOYEE
    WHERE EMP_ID = 0;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('조회 결과가 없습니다.');
END;

------------------------------------------------------------------------------





