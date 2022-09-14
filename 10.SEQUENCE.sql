------------------------------------------------------------------------------
------------------------------------SEQUENCE----------------------------------
------------------------------------------------------------------------------

/*


    <���� ����>

������ ����
CREATE SEQUENCE ��������
[ START WITH n ]    -- ���� �� ����, �����ϸ� �ڵ� 1 ����
[ INCREMENT BY n ]  -- ���� ���� ���� ����ġ, �����ϸ� �ڵ� 1 ����
[ MAXVALUE n | NOMAXVALUE ] -- �߻���ų �ִ밪, NOMAXVALUE�� ��� 10�� 27�������� ����
[ MINVALUE n | NOMINVALUE ] -- �߻���ų �ּҰ�, 10�� 26�������� ����
[ CYCLE | NOCYCLE ] -- �ݺ�| ��ݺ� : �� ��ȯ����. ����Ŭ �Ѿ�� �ٽ� ���ۼ��ڷ� ȸ��
[ CACHE ����Ʈ ũ�� | NOCACHE ]

������ ���� : CREATE SEQUENCE ��������;
������ ��� : INSERT INTO ���̺���(��������.NEXTVAL,'������',...)
-- CURRVAL,NEXTVAL
������ ���� : ALTER SEQUENCE ��������;
������ ���� : DROP SEQUENCE ��������;
������ ��ü ����Ʈ ��ȸ : SELECT * FROM USER_SEQUENCES;

*/

-- SEQUENCE ����
CREATE SEQUENCE SEQ_1ST -- ���� ù�� �����ϸ� ���� ��������
START WITH 1        -- ������ �⺻�� : 1
INCREMENT BY 1      -- ������ �⺻�� : 1
MAXVALUE 5          -- ������ �⺻�� : 10�� 27����
MINVALUE 1          -- ������ �⺻�� : 
CYCLE               -- ������ �⺻�� : NOCYCLE
NOCACHE;            -- ������ �⺻�� : NOCACHE

CREATE SEQUENCE SEQ_2ND -- ���� ����
MAXVALUE 10             
CYCLE              
NOCACHE;

-- SEQUENCE ���
-- ��������.NEXTVAL ����,���������� ���� // ��������.CURRVAL : ���� ��������
INSERT INTO UC VALUES(SEQ_1ST.NEXTVAL,'A','AA','��',DEFAULT);
-- ���� �ִ��� NEXTVAL�� ���� �ɶ����� ���� �����ؼ� �̹� �ִ� 2���� ���� �ڿ� 3������ �߰���
INSERT INTO UC VALUES(SEQ_1ST.NEXTVAL,'B','BB','��',DEFAULT);
INSERT INTO UC VALUES(SEQ_1ST.NEXTVAL,'C','CC','��',DEFAULT); 
-- SEQ_1ST.NEXTVAL�� 3�� ����Ǿ� ���� 3

-- SEQUENCE ����
-- START WITH ���۰� ���� �Ұ�
ALTER SEQUENCE SEQ_1ST
INCREMENT BY 2
MAXVALUE 10;

-- SEQUENCE ����
DROP SEQUENCE SEQ_1ST;

-- SEQUENCE ��ü ����Ʈ ��ȸ
SELECT * FROM USER_SEQUENCES; -- ���� S ���



------------------------------------------------------------------------------

/*

-- < SEQUENCE >
�ڵ� ��ȣ �߻���
���������� ���� ���� �ڵ� ����
PK(PRIMARY KEY=�����ĺ���)�� �ڵ� ������Ű�� ����

�Խ��� �۹�ȣ�� ���� ����


-- ����
CREATE SEQUENCE sequence_name
[ START WITH n ]    -- ���� �� ����, �����ϸ� �ڵ� 1 ����
[ INCREMENT BY n ]  -- ���� ���� ���� ����ġ, �����ϸ� �ڵ� 1 ����
[ MAXVALUE n | NOMAXVALUE ] -- �߻���ų �ִ밪, NOMAXVALUE�� ��� 10�� 27�������� ����
[ MINVALUE n | NOMINVALUE ] -- -�߻���ų �ּҰ�, 10�� 26�������� ����
[ CYCLE | NOCYCLE ] -- �ݺ�| ��ݺ� : �� ��ȯ����. ����Ŭ �Ѿ�� �ٽ� ���ۼ��ڷ� ȸ��
[ CACHE ����Ʈ ũ�� | NOCACHE ] -- ĳ�� �޸� ���. ����ϸ� �� �� �������� 1�� �� �����ϴٰ� ���ڱ� 20�� �����ϰų� �׷� ���� �ִ�
    -- ������ ���� �����ϰ� �������ٺ��� ĳ�ø� ����Ѵٰ� ���� �� 1�� �����ϰڴ� 
    -- ���������� �����س��� ���� ������ ���ڱ� 20�� ������ �� �ִ� ��Ȳ�� �߻��� �� �־ 
    -- ���� �̰� 20�� �ڰ� ������ �Ǵ°� �ƴ����� 1�� ���������� �����ϱ⸦ ���ϸ� 
    -- ��ĳ�ø� ���°� ����. ��ĳ�� ���ٰ� ���� ���� �� �ƴϴ�


-- START WITH : ������ ���� ��
-- INCREMENT BY : ������ ���� ��
-- MAXVALUE : ������ �ִ� ��
-- MINVALUE : ������ �ּ� ��
-- CYCLE : �ִ밪 ���� �� ��ȯ ����, NOCYCLE�� �����Ϸ�� ������ �����Ѵ�.
-- CACHE : �޸𸮻󿡼� ���������� ����(CACHE)���� ���θ� ����
--         �⺻���� 20, ���ϴ� ���ڸ�ŭ �̸� ����� ĳ�÷� ���ֽ�Ų��
--				/ NOCACHE :������ �޸𸮻󿡼� ���������� �������� �ʴ´�


*/
------------------------------------------------------------------------------
------------------------------------------------------------------------------

-- SEQ_EMPID�� ���� ���� �� ��ȸ
SELECT SEQ_EMPID.CURRVAL FROM DUAL;
--ORA-08002: sequence SEQ_EMPID.CURRVAL is not yet defined in this session
--������ SEQ_EMPID.�� ���ǿ��� CURRVAL�� ���� ���ǵ��� �ʾҽ��ϴ�.

SELECT SEQ_EMPID.NEXTVAL FROM DUAL;
--3�� ����� ���� �߻�
-- ������ SEQ_EMPID.NEXTVAL exceeds MAXVALUE�� ��ʷε� �� �����ϴ�.
-- 3������ �� MAXVALUE �ʰ� �� �����߻�
-- CYCLE�� ������ �ʱⰪ���� �ٽ� �Ѿ�� ��

-- ������ SEQ_EID ����
-- �� ���� ���� 300�̰� �ִ밪�� 10000, ��ȯ���� �ʰ� ĳ�ø޸� ��� ���ϸ� ���� ���ڴ� 1

CREATE SEQUENCE SEQ_EID
 START WITH 300
--INCREMENT BY 1
MAXVALUE 10000
NOCYCLE
NOCACHE;



-- SEQUENCE ����

CREATE SEQUENCE SEQ_EMPID
START WITH 300 
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE; -- Sequence SEQ_EMPID��(��) �����Ǿ����ϴ�.
-- �ǹ�: ������ �̸� SEQ_EMPID�� 300���� ���ڰ��� 5�� �����ϸ� 
-- �ִ�ġ 310���� �۵��ϰ� ���� ��ȯ��Ű�� �ʴ´�. ĳ�ø޸� ���X


SELECT * FROM USER_VIEWS;     -- ��ü �並 ��ȸ�� �� �ִ� �ڵ�
SELECT * FROM USER_SEQUENCES; -- ��ü �������� ��ȸ�� �� �ִ� �ڵ�

------------------------------------------------------------------------------



-- SEQUENCE ���

-- CURRVAL
-- NEXTVAL


-- ��������.CURRVAL : ���� ������ ������ ��
--                  ���������� NEXTVAL�� ���� ȣ��� ���� �����. �׷��� ���簪�̶�� �θ��� ��
-- ��������.NEXTVAL : �������� ���� ������ ������Ų �� = ���� ������������ ����ġ��ŭ ������ ��
--                  ���� ������ ������Ű�⵵ ������ ���ʷ� �������� �����Ű�⵵ ��
--                  NEXTVAL�� ó�� �����������ϰ� ó�� �����ؼ� ������� ���� CURRVAL�� ����
    
    
    
    
--SEQ_EMPID�� ���� '���� ��' ��ȸ
SELECT SEQ_EMPID.CURRVAL FROM DUAL;
-- ERROR : ORA-08002: sequence SEQ_EMPID2.CURRVAL is not yet defined in this session
-- ���� : ���� ��������.NEXTVAL�� �������� �����Ű�� �ʾƼ� ����. NEXTVAL���� CURRVAL�� ���ʰ��� �޾ƿ���.
SELECT SEQ_EMPID.NEXTVAL FROM DUAL; -- 300 // 305 // 310 ���� ������ 5�� �� �����Ǽ� ��µ�. �ִ�ġ������310�̶� ����
-- �ִ�ġ �ٴٶ��� �� �����޼���
-- ORA-08004: sequence SEQ_EMPID.NEXTVAL exceeds MAXVALUE and cannot be instantiated
-- �ִ�ġ MAXVALUE�� 310���� �����Ǿ��־� ���̻� �ν��Ͻ�ȭ �� �� ����



-- ������ SEQ_EID ����
-- ��, ���۰��� 300�̰� �ִ밪�� 10000, ��ȯ���� �ʰ� ĳ�� �޸� ��� ���ϸ� ���� ���ڴ� 1

CREATE SEQUENCE SEQ_EID
START WITH 300
INCREMENT BY 1
MAXVALUE 10000
NOCYCLE
NOCACHE; -- Sequence SEQ_EID��(��) �����Ǿ����ϴ�.


-- ������ ����
INSERT INTO EMPLOYEE
VALUES(SEQ_EID.NEXTVAL, '������','891023-1540123','nam@n.n','01022223333','D2','J7','S1',
        50000000,0.1,200,SYSDATE, NULL, DEFAULT);
-- VALUES�� ù���� �����ĺ���(PK, PRIMARY KEY) �ڸ��� �������� ���� ���δ�

-- ���� �ϴ� �Ǽ�
CREATE TABLE EX(
    E_ID NUMBER DEFAULT SEQ_EID.NEXTVAL,
    E_NAME VARCHR2(30)
); -- NEXTVAL�� INSERT�� ����ϴ� �� ���� ����
   -- ORA-00984: column not allowed here
   -- 11g������ �����߻� // 19C�� ���̺� ������ ������ ��� ����
   
INSERT INTO EX VALUES(DEFAULT, '1'); -- INSERT
SELECT * FROM EX;
   

------------------------------------------------------------------------------
-- ������ ����

-- ALTER SEQUENCE ��������

-- ��ü�� ���� ����
-- ��ü�� ALTER�� ����
-- START WITH �� �����Ұ� (������ �������� ���� ����)

-- MAXVALUE�� ���� ��ġ���� ���� ��ġ�δ� ����Ұ�

ALTER SEQUENCE SEQ_EMPID
INCREMENT BY 10
MAXVALUE 400
CYCLE; -- ĳ�� �����Ҳ��� ���� ���� ����
-- Sequence SEQ_EMPID��(��) ����Ǿ����ϴ�.

-- ���� ����� SELECT�� Ȯ��
SELECT * FROM USER_SEQUENCES; -- SEQ_EMPID	1	400	10	Y	N	0	320

SELECT SEQ_EMPID.NEXTVAL FROM DUAL; -- 300 310 ... 400 1 // �ƽ�ġ400���� ���ٰ� 
                                    -- CYCLE �ɼǼ����صױ⿡ MINVALUE�� 1���� �ٽý���




------------------------------------------------------------------------------



------------------------------------------------------------------------------

/*
CREATE SEQUENCE seq_empno
START WITH 1000
INCREMENT BY 1
CACHE 20; -- CACHE 20 ���
SELECT seq_empno.NEXTVAL FROM dual; -- 1000 1001 1002





CREATE SEQUENCE SEQ_EMPID2
START WITH 300 
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE;

SELECT SEQ_EMPID2.CURRVAL FROM DUAL;
SELECT SEQ_EMPID2.NEXTVAL FROM DUAL;

DROP SEQUENCE SEQ_EMPID2;


ROLLBACK;

*/
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------

------------------------------------------------------------------------------






