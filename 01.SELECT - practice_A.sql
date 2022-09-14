/*
 ���̺�(table)�̶�?

�����ͺ��̽� ���� ��� �����͸� ���̺��� ���� ����

��(record)�� ��(�÷�)���� �̷���� �����ͺ��̽� ��ü

���̺� = ǥ

��=����=ROW

��=����=COLUMN
*/

/*
-- SELECT : ������ ��ȸ
--      RESULT SET : SELECT�������� �����͸� ��ȸ�� �����

ex) �ش� ���ǿ� �����ʴ� ������� ������ 0������ ���� ���� �ִ�

RESULT SET�� ����� ��0�࡯ �̻� `

ex) �ش� ���ǿ� �����ʴ� ������� ������ 0������ ���� ���� �ִ�

SELECT �÷���

SELECT �÷���[, ... ] - ���� ��ȸ���� // ���� ���� ��ȸ�Ұ��� �˷�����ϴ� �÷����� ����.

FROM ���̺���; // ��ȸ�ϰ��� �ϴ� �÷��� ���Ե� ���̺��� ���

SELECT �÷��� FROM ���̺���;

*/


-- EMPLOYEE ���̺��� ���,�̸�,�޿� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEEL

--EMPLOYEE ���̺��� ��� ���� ��ȸ
SELECT * FROM EMPLOYEE;

/*
-- �ǽ� ���� --
1.JOB ���̺��� ��� ���� ��ȸ
2.JOB ���̺��� ���� �̸� ��ȸ
3.DEPARTMENT ���̺��� ��� ���� ��ȸ
4.EMPLOYEE ���̺��� ������, �̸���, ��ȭ��ȣ, ������ ��ȸ
5.EMPLYEE ���̺��� ������, ����̸�, ���� ��ȸ
*/

--1.JOB ���̺��� ��� ���� ��ȸ
-- ���1
SELECT * FROM JOB;

-- ���2
SELECT JOB_CODE,JOB_NAME FROM JOB; 


--2.JOB ���̺��� ���� �̸� ��ȸ
SELECT JOB_NAME FROM JOB;

--3.DEPARTMENT ���̺��� ��� ���� ��ȸ
-- ���1
SELECT * FROM DEPARTMENT;

-- ���2
SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID FROM DEPARTMENT;

--4.EMPLOYEE ���̺��� ������, �̸���, ��ȭ��ȣ, ������ ��ȸ
SELECT EMP_NAME,EMAIL,PHONE,HIRE_DATE FROM EMPLOYEE;

--5.EMPLYEE ���̺��� ������, ����̸�, ���� ��ȸ
SELECT HIRE_DATE, EMP_NAME,SALARY FROM EMPLOYEE;



--�÷� �� ��� ����
--EMPLOYEE���̺����� ������, ���� ��ȸ(���� = �޿�*12)
SELECT EMP_NAME, SALARY*12 ���� FROM EMPLOYEE;

--EMPLOYEE���̺����� ������, ����, ���ʽ��� �߰��� ���� ��ȸ
-- ���1
SELECT EMP_NAME, SALARY*12 ����, SALARY*(1+BONUS) FROM EMPLOYEE;
--  ���Ŀ� NULL�� ������ ������� NULL�� ���� 
-- ���2
SELECT EMP_NAME �̸�, SALARY * 12 ����, SALARY*(1+BONUS)*12 AS ���ʽ�
FROM EMPLOYEE;


/*
------------�ǽ�����------------
1.EMPLOYEE���̺����� �̸�, ����, �Ѽ��ɾ�(���ʽ�����), �Ǽ��ɾ�(�Ѽ��ɾ�-(����*����3%)) ��ȸ
2.EMPLOYEE���̺����� �̸�, ������, �ٹ��ϼ�(���� ��¥ - ������) ��ȸ 
 - ���ó�¥ SYSDATE
*/
--(SALARY+SALARY*BONUS)*12
SELECT EMP_NAME �̸�, SALARY * 12 ����,SALARY *(1+BONUS)*12 "�Ѽ��ɾ�(���ʽ�����)", 
        SALARY *(1+BONUS)*12 - SALARY*12*0.03 AS �Ǽ��ɾ�
FROM EMPLOYEE;




 

-- �÷� ��Ī
-- �÷���  AS ��Ī / �÷��� AS ����Ī�� / �÷��� ��Ī / �÷��� ����Ī��



/*
���ͷ�(literal)
�� ��ü �� ��

����Ŭ������ ����,���ڿ�,����Ʈ ������� �� �̱������̼�(�� ��)���� �����ش�
������ Ÿ�Կ� ������� ��Ī(����) �ܿ��� �� �̱������̼����� ���Ѵ�
*/ 

-- EMPLOYEE ���̺����� ������ ���� ��ȣ, �����, �޿�, ���� ��ȸ




-- ��Ī : "" 
-- ���ͷ��� �̱������̼����� ó���Ѵ� : ' '
-- '��'�̶�� �÷��� �����ְ� ���������� ���������̼�""���� ����������



-- EMPLOYEE���̺����� ������ ���� �ڵ� ��ȸ

-- bang���� �����ϴ� email �� ��ȸ
-- ��� : ����� bang ns@kh.kr
SELECT EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE 'bang%';

-- ��� : ����
SELECT EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE 'Bang%';
-- ���ͷ��� ��ҹ��� ö���� �����ϱ⿡ �빮�� BANG���� �����ϴ� EMAIL�� ��� �ȳ��� ��



-- EMPLOYEE ���̺����� ������ �μ� �ڵ带 �ߺ� ���� ��ȸ
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;


-- DISTINCT�� �ѹ��� �� �� �ִ�
--SELECT DISTINCT DEPT_CODE, DISTINCT DEPT_CODE -- error
--FROM EMPLOYEE;



/*
SELECT �÷��� -- ��ȸ�ϰ��� �ϴ� �÷��� ���
FROM ���̺��� -- ��ȸ�ϰ��� �ϴ� �ø��� ���Ե� ���̺��� ���
WHERE ���ǽ�; -- ���� �����ϴ� ���� ���, ������ �����ϴ� �ุ ��ȯ
             -- ���ǽ� ������ �ٿ��� ��밡��. ������ WHERE�� �Ѱ��� ���


--�񱳿�����
>, <, >=, <=, = ,!= 

ũ��, �۴�, ũ�ų� ����
���� : =
�����ʴ� : != , ^= , <>
*/

--EMPLOYEE���̺����� �μ��ڵ尡 'D9'�� ������ �̸�, �μ��ڵ� ��ȸ
SELECT  EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';



-- '' ���� D9�� ���� �÷����� �����ϰ� ��
-- 'd9'��� �ᵵ �ȵ�. ���ͷ��� ��ҹ��� ����



--�޿��� 4000000�̻��� ������ �̸�, �޿� ��ȸ
-- ''�� ���ε� ���ڷ� �������Ѵ�. '' ��� ��
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY >= 4000000;




-- EMPLOYEE���̺����� �μ��ڵ尡 D9�� �ƴ� ����� ���, �̸�, �μ��ڵ���ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE != 'D9';
--WHERE DEPT_CODE ^= 'D9';
--WHERE DEPT_CODE <> 'D9';



-- EMPLOYEE ���̺����� ��� ���ΰ� N�� ������ ��ȸ�ϰ� �ٹ� ���θ� ���������� ǥ��
-- ���,�̸�, ������, �ٹ����� ��ȸ
SELECT EMP_ID, EMP_NAME, HIRE_DATE, '�ٹ� ����' ������
FROM EMPLOYEE
WHERE ENT_YN = 'N';




-------------- �ǽ����� --------------
--1.EMPLOYEE���̺����� ������ 3000000�̻��� ����� �̸�, ����, ������ ��ȸ
--2.EMPLOYEE���̺����� SAL_LEVEL�� S1�� ����� �̸�, ����, ������, ����ó ��ȸ
--3.EMPLOYEE���̺����� �Ǽ��ɾ�(�Ѽ��ɾ�-(����*����3%))�� 5õ���� �̻��� 
--  ����� �̸�, �޿�, �Ǽ��ɾ�, ������ ��ȸ

SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY >= 3000000;

SELECT EMP_NAME, SALARY, HIRE_DATE, PHONE
FROM EMPLOYEE
WHERE SAL_LEVEL = 'S1';

SELECT EMP_NAME, SALARY, SALARY+SALARY*(SALARY*BONUS)-(SALARY*12*0.03)�Ǽ��ɾ�, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY+SALARY*(SALARY*BONUS)-(SALARY*12*0.03) >= 5000000;

------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------



-- ���� ������ AND OR
-- EMPLOYEE ���̺����� �μ��ڵ尡 D6�̰� �޿��� 3000000���� ���� �޴� ������ �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE,SALARY  
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' AND SALARY > 3000000;


-- EMPLOYEE ���̺����� �μ��ڵ尡 D6�̰ų� �޿��� 3000000���� ���� �޴� ������ �̸�,�μ��ڵ�, �޿���ȸ
SELECT  EMP_NAME, DEPT_CODE,SALARY 
FROM EMPLOYEE
WHERE   DEPT_CODE = 'D6' OR SALARY > 3000000;




-- 1.EMPLOYEE ���̺����� ������ 4000000�̻��̰� JOB_CODE�� J2�� ����� ��ü ���� ��ȸ
-- 2.EMPLOYEE ���̺��� DEPT_CODE�� D9�̰ų� D5�� ��� �߿� �������� 02�� 1�� 1�Ϻ��� ���� �����
--   �̸�, �μ��ڵ�, ������ ��ȸ
SELECT *  
FROM EMPLOYEE
WHERE SALARY >= 4000000 AND JOB_CODE ='J2';

SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9' OR HIRE_DATE < '02/01/01';

--- �ٽ�Ǯ��
SELECT *
FROM EMPLOYEE
WHERE SALARY >= 4000000 AND JOB_CODE = 'J2';

SELECT  EMP_NAME, DEPT_CODE, HIRE_DATE 
FROM EMPLOYEE
WHERE  (DEPT_CODE = 'D9' OR DEPT_CODE = 'D5')
        AND HIRE_DATE < '02/01/01' ;

-- �� �ڵ�� Ʋ�� �ڵ�
-- �����Ϻ��� ������ ���� ��. ���ú��� ������ �� ū ����
-- ��¥�� �������� ���ǽ��� ���ٸ� ''�� ��������Ѵ�
-- �ڹٳ� SQL�̳� OR AND�� AND�� �켱������ ���� ����
-- OR�� ���� �����ϰ� �ʹٸ� �Ұ�ȣ�� ���� ��





------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------


-- BETWEEN AND
-- ~�̻� ~����

-- EMPLOYEE ���̺����� �޿��� 3500000�̻� 6000000���ϸ� �޴� ����� ���, �̸�, �޿�, �μ��ڵ�, �����ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE, JOB_CODE
FROM EMPLOYEE  
WHERE SALARY >= 3500000 AND SALARY <= 6000000;

SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE, JOB_CODE
FROM EMPLOYEE 
WHERE SALARY BETWEEN 3500000 AND 6000000;

---�ٽ� Ǯ��
SELECT  EMP_ID, EMP_NAME, SALARY, DEPT_CODE, JOB_CODE 
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;
SELECT  EMP_ID, EMP_NAME, SALARY, DEPT_CODE, JOB_CODE 
FROM EMPLOYEE
WHERE SALARY>=3500000 AND SALARY <=6000000;


-- �ݴ�� �޿��� 3500000�̸� 6000000�ʰ��� �޴� ����� ���, �̸�, �޿�, �μ��ڵ�, �����ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE, JOB_CODE
FROM EMPLOYEE
--WHERE SALARY < 3500000 OR SALARY > 6000000; 
--WHERE SALARY NOT BETWEEN 3500000 AND 6000000;
WHERE NOT SALARY BETWEEN 3500000 AND 6000000;

-------�ǽ�����-------
-- 1.EMPLOYEE ���̺��� �������� 90/01/01 ~ 01/01/01�� ����� ��ü ������ ��ȸ
-- �ð������� ���μ��� ���� ���� �ð��� ������ ������� ������

SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE >= '90/01/01' AND HIRE_DATE <= '01/01/01';

SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND  '01/01/01';

-- WHERE HIRE_DATE >= '90/01/01' AND HIRE_DATE <= '01/01/01';

---�ٽ�Ǯ��
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE >= '90/01/01' AND HIRE_DATE <='01/01/01';


------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------

/*
-- LIKE
���Ϸ��� ���� Ư�� ������ ������Ű���� ��ȸ
ex) �̸ῡ i�� ���� ���� ��ȸ, �̸��� �达�� �� ����� ��ȸ

���ϵ�ī�� 2����
 _ : 1����
 % : 0���� �̻�

ex)
'_' (�ѱ���)
'__' (�α���)
'___' (������)

 '����%' : ���ڷ� �����ϴ� ��
    ���� �ڷ� �����͵� ok
    ex) �����ְ�, ����(����), ���ڿ�, ����
 '%����' : ���ڷ� ������ ��
    ���� �տ� �����͵� ok
    ex) �Ա���, �ѱ��� ����, (����)����
 '��%��' : �۷� �����ؼ� �ڷ� ������ ��
    �۰� �� ���� �����͵� ok
    ex)�۾��� �߾���, ����, �۰���, ��(����)��
 '%����%' : ���ڰ� ���ԵǾ��ִ� ��
        ex) �ѱ��ڰ�, �Ա���, ����, �ѵα���

*/

--EMPLOYEE ���̺����� ���� ������ ����� ���, �̸�, ������ ��ȸ
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%';
-- WHERE EMP_NAME LIKE '��__';
-- �� �����ϳ� �̸��� �������� ����鸸 �����ؼ� �̸��� �α��ڳ� �ױ����̻��̸� ��Ȯ���� ������



--EMPLOYEE ���̺����� �̸��� '��'�� ���Ե� ������ �̸�, �ֹι�ȣ, �μ��ڵ� ��ȸ
SELECT EMP_NAME, EMP_NO, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';


--EMPLOYEE ���̺��� ��ȭ��ȣ 4��° �ڸ��� 9�� �����ϴ� ����� ���, �̸�, ��ȭ��ȣ ��ȸ
-- ���� ��� : 01012345678
-- 01X ���ڸ� + 9�� �����ϴ� �׹���° �ڸ���
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '___9%';

---RE
SELECT EMP_ID, EMP_NAME,PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '___9%';


--EMPLOYEE ���̺����� �̸��� �� _�� �� ���ڰ� 3�ڸ��� �̸��� �ּҸ� ���� ����� ���, �̸�, �̸��� �ּ� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___ _%' ESCAPE ' ';

--RE
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___!_%' ESCAPE '!';



/*
LIKE�� �� �� ����!
���ϵ�ī�� : _ %
���� �ѱ���,�� 0���� �̻��� ��Ÿ���� ���ϵ� ī��

������ �ڸ��� ����� 3�� + �˻��ϰ��� �ϴ� �����ͷ��� ����� 1�� = ��4���� �����
�˻��ϰ��� �ϴ� ������ ���ڿ� ���ϵ� ī�尡 ��ġ�� ��쿡�� ���ϰ� ���ϵ� ī�带 �������� ���ϱ� ������
ESCAPE OPTION�� ���� �������ش�
 - ����(������)���� �� �� �տ� ���б�ȣ ���

*/


------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------



--  ESCAPE �ĺ���

-- EMPLOYEE���̺����� �达 ���� �ƴ� ������ ���, �̸�, ������ ��ȸ
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
--WHERE EMP_NAME NOT LIKE '��%';
WHERE NOT EMP_NAME LIKE '��%';

---RE
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '��%';

--WHERE NOT EMP_NAME LIKE '��%';
-- NOT ���� : �ش� �÷��� �յ� �� �� ����

/*
WHERE EMP_NAME != '��%'; 
 = Ȥ�� != '��%'���� �˻��ϸ� '��%' ��������ü�� �˻�
LIKE '��%' �ڿ� ��� ���� �������
LIKE�� ����ϴ� % _ �� ���ϵ�ī�� ����޴´�    
    LIKE�� ���ڿ� ���� ���� �˻��ϴ� ��

!= '��%'������ �̸��� ��%�� ����� ã�� ��(���ͷ� ��% �����͸� ã�� ��)
    ���⼭ %�� ���ϵ�ī��� ������ ���� �ʰ� �׳� ���� ��ȣ %�� ��

*/

-----------�ǽ�����-----------
--1.EMPLOYEE ���̺����� �̸� ���� '��'���� ������ ��� �̸� ��ȸ
--2.EMPLOYEE ���̺����� ��ȭ��ȣ ó�� ���ڸ��� 010�� �ƴ� ����� �̸�, ��ȭ��ȣ ��ȸ
--3.EMPLOYEE ���̺����� �����ּ� _�� ���� 4���̸鼭 DEPT_CODE�� D9 �Ǵ� D6�̰�
--  �������� 90/01/01 ~ 00/12/01�̰�, �޿��� 2700000�� �̻��� ����� ��ü ���� ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��';

SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '____!_%' ESCAPE '!'
        AND (DEPT_CODE = 'D9' OR DEPT_CODE = 'D6')
        -- AND (HIRE_DATE >= '90/01/01' AND HIRE_DATE <= '00/12/01')
        AND HIRE_DATE BETWEEN '90/01/01' AND '00/12/01'
        AND SALARY >= 2700000;


---RE
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��';

SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '____!_%' ESCAPE '!' 
            AND (DEPT_CODE = 'D9' OR DEPT_CODE = 'D6')
            AND HIRE_DATE BETWEEN '90/01/01' AND '00/12/01'
            AND SALARY >= 2700000;

------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------

-- IS NULL
-- IS NOT NULL
-- �÷����� NULL�̳�
-- �÷����� NULL�� �ƴϳ�

--EMPLOYEE ���̺����� ���ʽ��� ���� �ʴ� ����� ���, �̸�, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME,SALARY,BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;
---RE
SELECT EMP_ID, EMP_NAME,SALARY,BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;

--WHERE BONUS = NULL; �� �ȳ���
--WHERE BONUS = (null); �� �ȳ���

--EMPLOYEE ���̺����� ���ʽ��� �޴� ����� ���, �̸�, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME,SALARY,BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;
WHERE NOT BONUS IS NULL;
---RE
SELECT EMP_ID, EMP_NAME,SALARY,BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

-- WHERE NOT BONUS IS NULL; 
-- NOT�� �÷Ÿ� �տ� �پ ����

--WHERE BONUS NOT LIKE '%(null)%';


-- EMPLOYEE ���̺����� �����ڵ� ���� �μ� ��ġ�� ���� ���� ������ �̸�, ������, �μ��ڵ� ��ȸ
-- EMPLOYEE ���̺����� �μ� ��ġ�� ���� �ʾ����� ���ʽ��� ���޹޴� ������ �̸�,  ���ʽ�, �μ��ڵ� ��ȸ
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL AND DEPT_CODE IS NULL;


SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;

---RE
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL AND DEPT_CODE IS NULL;

SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE 
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;


------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------


--IN
-- ��Ͽ� ��ġ�ϴ� ���� ������ TRUE�� �Ǿ� �� ��ȯ
-- ��Ͽ� ��ġ�ϴ� ���� ������ TRUE�� ��ȯ


-- D6�μ��� D9�μ������� �̸�, �μ��ڵ�, �޿� ��ȸ
-- �����ڵ尡 J1, J2, J3, J4�� ������� �̸�, �����ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D9';

SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
--WHERE JOB_CODE = 'J1' OR JOB_CODE = 'J2' OR JOB_CODE = 'J3' OR JOB_CODE =  'J4';
WHERE JOB_CODE IN ('J1','J2','J3','J4'); 

---RE
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN ('J1','J2','J3','J4');


-- �Ұ�ȣ�� ó�� ���� D6�� �µ����̰� �� ���� üũ�ؼ� ��ȯ. ���� D9üũ



------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------


-- ���� ������ ||
-- �ڹٿ����� or������������ ��ȣ�� SQL������ ���Ῥ����
-- EMPLOYEE���̺����� ���, �̸�, �޿��� �����ؼ� ��ȸ (EX. 200������8000000)
SELECT EMP_ID || EMP_NAME || SALARY �޿�
FROM EMPLOYEE;


-- EMPLOYEE���̺����� ' "�����"�� ������ "�޿�"���Դϴ�' �������� ��ȸ
SELECT EMP_NAME ||'���� ������' || SALARY ||'�� �Դϴ�'
FROM EMPLOYEE;
-- �������� ���� ���� ��� �ʿ�

---RE
SELECT EMP_NAME, EMAIL || ' �̸��� �ּ� '||'����'
FROM EMPLOYEE;


------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------




--BETWEEN
-- �ݴ�� �޿��� 3500000�̸� 6000000�ʰ��� �޴� ����� ���, �̸�, �޿�, �μ��ڵ�, �����ڵ� ��ȸ

SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE, JOB_CODE
FROM EMPLOYEE
--WHERE SALARY BETWEEN 3500000 AND 6000000;
WHERE SALARY NOT BETWEEN 3500000 AND 6000000;
-- 1.EMPLOYEE ���̺��� �������� 90/01/01 ~ 01/01/01�� ����� ��ü ������ ��ȸ (BETWEEN ���)
SELECT *
FROM EMPLOYEE
--WHERE HIRE_DATE >= '90/01/01' AND HIRE_DATE <= '01/01/01';
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';

-- LIKE
--EMPLOYEE ���̺����� �̸��� �� _�� �� ���ڰ� 3�ڸ��� �̸��� �ּҸ� ���� ����� ����� ���, �̸�, �̸��� �ּ� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___^_%' ESCAPE '^';

-- NULL
-- EMPLOYEE ���̺����� �μ� ��ġ�� ���� �ʾ����� ���ʽ��� ���޹޴� ������ �̸�,  ���ʽ�, �μ��ڵ� ��ȸ
SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;

-- IN
-- �����ڵ尡 J1, J2, J3, J4�� ������� �̸�, �����ڵ�, �޿� ��ȸ
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
--WHERE JOB_CODE = 'J1' OR JOB_CODE = 'J2' OR JOB_CODE = 'J3' OR JOB_CODE = 'J4';
WHERE JOB_CODE IN ('J1','J2','J3','J4');

-----------�ǽ�����-----------
--1.EMPLOYEE ���̺����� �̸� ���� '��'���� ������ ��� �̸� ��ȸ
--2.EMPLOYEE ���̺����� ��ȭ��ȣ ó�� ���ڸ��� 010�� �ƴ� ����� �̸�, ��ȭ��ȣ ��ȸ
--3.EMPLOYEE ���̺����� �����ּ� _�� ���� 4���̸鼭 DEPT_CODE�� D9 �Ǵ� D6�̰�
--  �������� 90/01/01 ~ 00/12/01�̰�, �޿��� 2700000�� �̻��� ����� ��ü ���� ��ȸ

SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��';

SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

SELECT  *
FROM EMPLOYEE
WHERE EMAIL LIKE '____!_%' ESCAPE '!' 
        AND (DEPT_CODE 'D9' OR DEPT_CODE 'D6')
        AND HIRE_DATE '90/01/01' AND '00/12/01'
        AND SALARY >= 2700000;












