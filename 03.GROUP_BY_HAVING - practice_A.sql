

/*
<SELECT���� ����>
SELECT
FROM
WHERE 
GROUP BY
HAVING
ORDER BY

<SELECT���� ����>
SELECT : �÷��� AS ��Ī, ����, �Լ���       -> ��ȸ�ϰ��� �ϴ� �÷� ���
FROM : ���̺� ��                           -> �÷��� ���� �ִ� ���̺� ���
WHERE : WHERE �÷���|�Լ��� �񱳿����� �񱳰� -> SELECT�� ���ǽ� ����
GROUP BY : �׷����� ���� �÷���              -> �׷��Լ��� ����� �׷� ���
HAVING : �׷��Լ��� �񱳿����� �񱳰�         -> �׷��Լ��� ���ǽ� ����
ORDER BY : �÷���|��Ī|�÷� ���� ���Ĺ�� [NULLS FIRST | LAST]; -> ���� ���� ���
    - SELECT���� ��Ī�� ��ξ��ٸ�, ��Ī���ε� ���� ����


<�������>
1)FROM : �����ؼ� ���� ���
2)WHERE : ���� �߷����� ���� ���� �÷��鸸 ����
3)GROUP BY
4)HAVING
5)SELECT
6)ORDER BY


*/


------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------


-- ORDER BY
-- ����
-- �������� ASC / �������� DESC
--   ���� ����  /   ���� �Ұ�
-- ������������ NULL�� �������� ��ġ
-- ������������ NULL�� ù ��ġ
-- ��Ī,��ȣ�� ���� ����

SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
-- �̸����� ��������(ASC)
--ORDER BY EMP_NAME ASC;
-- ASC�� ��������. 
--ORDER BY EMP_NAME;
-- ���������� ���� �Ұ�. ������
--ORDER BY EMP_NAME DESC;
-- NULL�� �� �ִ� ���� ���߿� ��ġ�� ���·� ��������
--ORDER BY DEPT_CODE;
-- NULL�� ���� ��ġ �� ��������
--ORDER BY DEPT_CODE DESC;
--ORDER BY DEPT_CODE DESC NULLS FIRST;
-- ���������� ���� NULL�� ���߿� ��ġ�ϴ°� �⺻, ���������� ���� NULL�� ���� ��ġ�ϴ°� �⺻
ORDER BY DEPT_CODE DESC NULLS LAST;


-- ��Ī���� �����غ���
SELECT EMP_ID, EMP_NAME, SALARY �޿�, DEPT_CODE -- �޿� : ��Ī
FROM EMPLOYEE
--ORDER BY SALARY;
--ORDER BY �޿�;
-- 2�� EMP_NAME ����
--ORDER BY 2 DESC;
-- 3�� SALARY�� ���� ��������
ORDER BY 3 DESC;


-- ����Ʈ�� �������̺��� ���� ����. �׷��� ��Ī�� �о�� �� �ִ� ��. �Ʒ� ������� ����
-- ORDER BY �̿ܿ� ��Ī�� ���� �� �ִ°� ����. �ڵ� �� ���� ���� ����
-- ��Ī�� �÷��� �ƴ϶� ���� �����͸� �����÷��ϴ� ���� : invailid identifier


/*
�������
1)FROM���� �����ؼ� ���� ���
2)WHERE ���ؼ� ���� �߷�����
���� ���� �÷��鸸 ����
3)GROUP BY
4)HAVING
5)SELECT
6)ORDER BY
*/


------------------------------------------------------------------------------
------------------------------------------------------------------------------
--------------------------------GROUP BY--------------------------------------
------------------------------------------------------------------------------


-- GROUP BY
-- �����͵��� ���ϴ� �׷����� ���� �� ���
-- �׷��Լ����� ���� ������ �����ϴ� ��
-- �׷��Լ��� ����� �׷� ���


-- �μ� �� �޿� �հ� ��ȸ
SELECT SUM(SALARY), DEPT_CODE -- ERROR : not a single-group group function
FROM EMPLOYEE; -- �� �޼��������� SINGLE�� ������ �׷��� ...?
-- �̱۰� �׷� �Բ� ����� �� ���ٴ� �ǹ� // ����� �ϳ��� ���;��ϴ� �׷��Լ��ε� �������� ������ ���� �� �Լ��� ȥ�� �Ұ�
-- �̱� : SUM(SALARY)
-- �׷� : DEPT_CODE

-- �μ� �� �޿� �հ��Ѵٰ��ϸ� ���� �μ����� �׷���� ���� ��
-- ������ �μ� �׷��� ������ �հ� ���س��ư� ��. 
-- ������ � �͵��� �׷� ������ �˷���� ����� �� �ִ�




-- EMPYLOEE���̺����� �μ� �� �޿� �հ�, �޿� ���, �ο� ���� ��ȸ
-- �׷�ȭ �� ���� �׷�ȭ�� ������ �Ǵ� �÷��� �����غ���
SELECT DEPT_CODE, SUM(SALARY), AVG(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;
-- �׷��������� ���� �Ϲ��Լ��� ���ƾ��Ѵ�. 
-- GROUP BY�� ���� �÷����� SELECT ������ �÷����� ���ƾ���


-- EMPLOYEE���̺����� �μ��ڵ�� ���ʽ� �޴� ����� ��ȸ
SELECT DEPT_CODE, COUNT(BONUS)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;


-- IS NOT NULL ���
SELECT DEPT_CODE, COUNT(BONUS)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;
-- ����� � ������? 
-- D2�μ����� ���ʽ� �޴� ����� ���µ� �̰� �ȳ���




--WHERE BONUS IS NOT NULL -- WHERE���� ������ COUNT(*)�� ������� ī��Ʈ��

--EMPLOYEE���̺����� �����ڵ�, ���ʽ��� �޴� ����� ��ȸ
SELECT JOB_CODE, COUNT(BONUS)
FROM EMPLOYEE
GROUP BY JOB_CODE;
-- ���ʽ� �ȹ޴� ����� �Ⱥ��� �ʹٸ�, WHERE BONUS IS NOT NULL �߰� 







--EMPLOYEE���̺����� ������ ���� �� �޿� ���(����ó��(���� �����϶�� �ǹ�)), �޿��հ�, �ο� �� ��ȸ(�ο����� ��������)
SELECT FLOOR(AVG(SALARY)),SUM(SALARY), COUNT(*), 
        DECODE(SUBSTR(EMP_NO,8,1),1,'��',2,'��') -- SELECT�� ù��°�� GROUP BY �������̶� �ȳ��͵� �Ǵµ�
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1);


SELECT FLOOR(AVG(SALARY)),SUM(SALARY), COUNT(*),
        CASE WHEN SUBSTR(EMP_NO,8,1) = 1 THEN '��'
             WHEN SUBSTR(EMP_NO,8,1) = 2 THEN '��'
            -- ELSE '��'
        END ����
FROM employee
GROUP BY SUBSTR(EMP_NO,8,1);

---RE
SELECT FLOOR(AVG(SALARY)),SUM(SALARY), COUNT(*),
        DECODE(SUBSTR(EMP_NO,8,1),1,'��','��')
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1)
ORDER BY COUNT(*) DESC;


--EMPLOYEE���̺����� ������ ���� �� �޿� ���(����ó��(���� �����϶�� �ǹ�)), �޿��հ�, �ο� �� ��ȸ(�ο����� ��������)
-- �����Ϳ� ���������� ���� �����͸� GROUP BY�ؼ� ���,�հ�,�� ��ȸ�ؾ���
-- CASE WHEN
SELECT FLOOR(AVG(SALARY)), SUM(SALARY), COUNT(*) ,
        CASE WHEN SUBSTR(EMP_NO,8,1)=1 THEN '��'
             WHEN SUBSTR(EMP_NO,8,1)=2 THEN '��'
        END "����"
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1)
ORDER BY COUNT(*) DESC;

-- DECODE
SELECT DECODE(SUBSTR(EMP_NO,8,1),1,'��','��')����, FLOOR(AVG(SALARY)), SUM(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1)
ORDER BY COUNT(*) DESC;


-- EMPLOYEE���̺����� �μ� �ڵ庰�� ���� ������ ����� �޿� �հ� ��ȸ
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE 
GROUP BY DEPT_CODE, JOB_CODE;

-- EMPLOYEE���̺����� �μ� �ڵ庰�� ���� ������ ����� �޿� �հ� ��ȸ
-- �μ���, �� ���޺� 2���� �׷��� �ʿ�
-- ��� ���
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE,JOB_CODE;



------------------------------------------------------------------------------
------------------------------------HAVING------------------------------------
------------------------------------------------------------------------------

-- HAVING
-- ������
-- ��� = WHERE
-- ���� WHERE ��� �Ϲ� �÷�
--     HAVING ��� GROUP BY�� ������


-- 1)�μ� �ڵ�� �޿� 3000000�̻��� ������ �׷� �� ��� �޿� ��ȸ
-- 2)�μ� �ڵ�� �޿� ��� 3000000�̻��� �׷� �� ��ձ޿� ��ȸ

-- 1)�μ� �ڵ�� �޿� 3000000�̻��� ������ �׷� �� ��� �޿� ��ȸ
-- ��� ���

SELECT DEPT_CODE,AVG(SALARY)
FROM EMPLOYEE
WHERE SALARY >= 3000000
GROUP BY DEPT_CODE;


-- 2)�μ� �ڵ�� �޿� ��� 3000000�̻��� �׷� �� ��ձ޿� ��ȸ

SELECT AVG(SALARY)
FROM EMPLOYEE
WHERE SALARY >= 300000
GROUP BY DEPT_CODE;

SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000;


-- �μ� �� �޿� �հ� �� 900000�� �ʰ��ϴ� �μ��ڵ�� �޿� �հ� ��ȸ
-- ��� ���


SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) > 900000
ORDER BY DEPT_CODE;

------------------------------------------------------------------------------
----------------------------------�ٽ�Ǯ���----------------------------------

--EMPLOYEE���̺����� ������ ���� �� �޿� ���(����ó��(���� �����϶�� �ǹ�)), �޿��հ�, �ο� �� ��ȸ(�ο����� ��������)
-- �����Ϳ� ���������� ���� �����͸� GROUP BY�ؼ� ���,�հ�,�� ��ȸ�ؾ���

SELECT FLOOR(AVG(SALARY)), SUM(SALARY), COUNT(*),
        DECODE(SUBSTR(EMP_NO,8,1),1,'��','��')
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1)
ORDER BY COUNT(*) DESC; 

SELECT FLOOR(AVG(SALARY)), SUM(SALARY), COUNT(*),
        CASE WHEN SUBSTR(EMP_NO,8,1)=1 THEN '��'
             ELSE '��'
        END ����
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1)
ORDER BY COUNT(*) DESC; 

-- EMPLOYEE���̺����� �μ� �ڵ庰�� ���� ������ ����� �޿� �հ� ��ȸ
-- �μ���, �� ���޺� 2���� �׷��� �ʿ�

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE;


-- 1)�μ� �ڵ�� �޿� 3000000�̻��� ������ �׷� �� ��� �޿� ��ȸ
-- 2)�μ� �ڵ�� �޿� ��� 3000000�̻��� �׷� �� ��ձ޿� ��ȸ

SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
WHERE SALARY >= 3000000
GROUP BY DEPT_CODE;

SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, SALARY
HAVING SALARY >= 3000000;

-- 2)�μ� �ڵ�� �޿� ��� 3000000�̻��� �׷� �� ��ձ޿� ��ȸ
SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000;


---RE
SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000;

-- �μ� �� �޿� �հ� �� 900000�� �ʰ��ϴ� �μ��ڵ�� �޿� �հ� ��ȸ

SELECT DEPT_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) > 900000
ORDER BY DEPT_CODE;


---RE
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) > 900000;

------------------------------------------------------------------------------
------------------------------------------------------------------------------



-- ROLLUP, CUBE
-- ���� �Լ� : �׷캰 ������ ������� �����ϴ� �Լ�
-- ���� �Լ��� ���ٴ°� ������ ��������� ������ �������ִ°� �±��� ������µ� �ٵ�
--
-- �Ѿ� ť�� ������
-- �Ѿ��� ���ڷ� ���޹��� �� �� ù��° �ѹ��� ����
-- ť��� ���ڷ� ������ ��� �͵鿡 ���� �߰� ����
--      ex)ROLLUP : GROUP BY�� �׷��ε� ù�׷��� �������� �հ� ��ȯ
--      ex)CUBE : GROUP BY�� �׷��ε� ù�׷��� �������� �հ� ��ȯ�� ��, �ι�° �׷��� �հ� �� ��ȯ

SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
--GROUP BY JOB_CODE           -- �� ���� �ڵ庰 �հ� 7��
--GROUP BY ROLLUP(JOB_CODE) -- �Ѿ��̳� ť���ڵ� �߰��� ���� �ϳ� �� ����. ���������� �����ʹ� ����
GROUP BY CUBE(JOB_CODE) --
ORDER BY JOB_CODE;


--EMPLOYEE���̺����� �� �μ��ڵ帶�� �����ڵ� �� �޿� ��, �μ� �� �޿� ��, ���� ��ȸ
SELECT DEPT_CODE,JOB_CODE, SUM(SALARY)
FROM EMPLOYEE 
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY DEPT_CODE;


---RE
SELECT DEPT_CODE, JOB_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE;

-- ROLLUP
SELECT DEPT_CODE,JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP (DEPT_CODE, JOB_CODE);

-- CUBE
-- �׷캰 ������ ����� �����ϴ� �Լ�
-- �Ѿ��� ���ڷ� ���޹��� �� �� ù��° �ѹ��� ����
-- ť��� ���ڷ� ������ ��� �͵鿡 ���� �߰� ����



------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------SET OPERATION----------------------------------
------------------------------------------------------------------------------


-- SET OPERATION : ���� ������
-- �� �� �̻��� ���̺����� ������ ������� �ʰ� ������ �����͸� ��ȸ�ϴ� ���

-- ����
-- UNION : ������ OR����
-- INTERSECT : ������ AND����
-- MINUS : ������ A-B
-- ������ ����� ������ ����� �ϳ��� ���� �ش� �Լ��� ����, ����� ��ȯ

-- ������ A OR B
-- ������ A AND B ����и�
-- ������ A - B
-- ������ A B�� ������ ������

-- UNION : ������ OR����
-- INTERSECT : ������ AND����
-- MINUS : ������ A-B
-- UNION ALL : AND���� + OR����(�ߺ��� �� �߰���ȸ)
-- 

------------------------------------------------------------------------------
------------------------------------------------------------------------------

-- UNION : ������
-- �� ������ ����� �ϳ��� ���� AND�������� ��ȯ
-- �� ���? WHERE���� ������ �� ���ų� OR�� ó���ϱ� ���� ���
-- UNION ������
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID = 200; -- ������
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID = 201; -- ������
-- UNION ����
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID = 200 
UNION
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID = 201; -- ������ ������
--�������
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID = 200  OR EMP_ID = 201;


-- EMPLOYEE���̺����� DEPT_CODE�� D5�̰ų� �޿��� 300000�� �ʰ��ϴ� 
-- ������ ���, �̸�, �μ��ڵ�, �޿���ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' OR SALARY = 300000;
-- UNION ����
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' 
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY = 300000;


------------------------------------------------------------------------------
------------------------------------------------------------------------------


-- INTERSECT : ������
-- ������ ����� ������ ����� �ϳ��� ���� OR���� ����, ����� ��ȯ
-- INTERSECT ���
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' 
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY = 300000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' 
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 300000;
--���տ����ڿ��� SELECT ���� �����ؾ� �ǰ� FROM���� �޶� �볪��?
-- ����


------------------------------------------------------------------------------
------------------------------------------------------------------------------


-- MINUS : ������

-- DEPT�ڵ尡 D5�̸鼭 ������ 3000000�ʰ��� ����� �����ϴ� �ڵ�

-- UNINON ALL
-- 



------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------



------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------






















------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------








