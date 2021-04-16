/*
- SQL : ���������� (Structure Query Language)
- DML : Data Manipulation Language
    - ���̺��� �����͸� �����ϴ� ��� (CRUD : Create, Retrieve, Update, Delete)
    - INSERT, DELETE, UPDATE, SELECT, MERGE (�� ���� �����ͺ��̽� ��ü�� ��ħ)
    - ��������� COMMIT �� ��������� DB�� �ݿ�

- DDL : Data Definition Language
    - DB ���̺��� ��Ű���� ����, �����ϴ� ��� (���̺� ��ü�� ���� / ����)
    - ���̺� ����, �÷� �߰�, Ÿ�� ����, ���� �������� ����, ���� ��
    - CREATE, ALTER, DROP, TRUNCATE, RENAME
    - �ٷ� COMMIT �Ǿ� DB�� �ݿ���

- TCL : Transactional Control Language
    - Ʈ������ ��� ���õ� ���
    - COMMIT (Ʈ�������� �������� ����Ǹ� ������ �ݿ���), ROLLBACK (Ʈ������ ���� �߿� ������ �߻��ϸ� ���), SAVEPOINT (�ѹ� �� Ư���� ���������� ������ �ѹ�)
    - Ŀ���̳� �ѹ��� �� ������ ������� �ʰ�, �ѹ� �����ϸ� Ŀ�Ե��� ���� ���� ��θ� DB�� �ݿ���
    - �ѹ鵵 ������ Ŀ���� �������� ��� ��ҵ�
    
- DCL : Data Control Language
    - DB�� ���̺��� ���ٱ����̳� CRUD ������ �����ϴ� ���
    - Ư�� ����ڿ��� ���̺��� ��ȸ ���� �㰡 / ���� ��
    - GRANT (DB ��ü�� ������ �ο�), REVOKE (�̹� �ο��� DB ��ü ���� ���)
*/


-- ���̺� ����Ʈ ���
SELECT *
  FROM TABS;

-- Ư�� ���̺��� ��Ű�� ���
DESC TEST_TABLE_2
;

-- 
SELECT *
  FROM TEST_TABLE_2
;

--
CREATE TABLE TEST_TABLE_2 (
    NAME VARCHAR2(10),
    AGE NUMBER(15, 2),
    JOB VARCHAR2(10),
    MENTOR VARCHAR2(10),
    BIRTH DATE
)
;

--
INSERT INTO TEST_TABLE_2
     VALUES ('P', 10, 'WORKER', TO_DATE('20110326', 'YYYYMMDDHH24MISS'))
;

--
UPDATE TEST_TABLE_2
   SET JOB = 'STUDENT'
 WHERE NAME = 'P'
;

--
DELETE 
  FROM TEST_TABLE_2
 WHERE NAME = 'P'
;

-- �ߺ��� ���� ���
SELECT DISTINCT NAME
  FROM TEST_TABLE_2
;
  
-- IN 
SELECT *
  FROM TEST_TABLE_2
 WHERE AGE IN (10, 15, 22)
;
 
-- BETWEEN
SELECT *
  FROM TEST_TABLE_2
 WHERE AGE BETWEEN 0 AND 10
;
 
-- ORDER BY (��� ����)
SELECT *
  FROM TEST_TABLE_2
 ORDER BY AGE ASC
;
 
SELECT *
  FROM TEST_TABLE_2
 ORDER BY AGE DESC
;

-- AGGREGATION FUNCTION (���� �Լ�)
-- ���̺��� ��ü ���ڵ带 ������� Ư�� Į���� �����ؼ� �� ���� ���� �����ϴ� �Լ�
-- COUNT(), AVG(), SUM(), MIN(), MAX(), FIRST(), LAST() ��
SELECT COUNT(*)
  FROM TEST_TABLE_2
 WHERE AGE = '10'
;

SELECT SUM(AGE)
  FROM TEST_TABLE_2
;

-- LENGTH() : ���ڵ��� ���ڿ� Į���� ���ڼ��� ����
SELECT NAME, LENGTH(NAME)
  FROM TEST_TABLE_2
;

-- SUBSTR(COLUMN, START_INDEX, LENGTH) : ���ڿ��� �߰��κ��� ����
SELECT JOB, SUBSTR(JOB, 2, 1) 
  FROM TEST_TABLE_2
;

-- UPPER()/LOWER() : ���ڿ��� �빮��/�ҹ��ڷ� ����
SELECT JOB, UPPER(JOB)
  FROM TEST_TABLE_2
;

-- ROUND() : ���ڵ��� ���� Į������ �ݿø��ؼ� ����
SELECT AGE, ROUND(AGE / 7)
  FROM TEST_TABLE_2
;

-- JOIN
-- ���� �ٸ� ���̺��� ���� Į���� �������� ��ġ�� (�����ϴ�) ���̺� ���� ����
-- ������ ��� ���̺��� ���� ���̺��� Į�� ���� �հ� ����

-- ǥ�� JOIN
    SELECT COUNT(*)
      FROM TEST_TABLE_1 JOIN TEST_TABLE_2
        ON TEST_TABLE_1.NAME = TEST_TABLE_2.NAME
    ;

    -- ���� �� NULL ���� ����ϴ� �������� (�Ұ�) �� �ܺ����� (���) ���� ����
    -- INNER JOIN
    -- ���� �� NULL ���� ������� ����
    -- NULL ���� ���� ���ڵ�� JOIN ������� ����
    SELECT COUNT(*)
      FROM TEST_TABLE_1 INNER JOIN TEST_TABLE_2
        ON TEST_TABLE_1.NAME = TEST_TABLE_2.NAME
    ;

    -- LEFT JOIN
    -- ���� �� JOIN �� ���� ���̺��� NULL ���� �����ؼ� ǥ��
    SELECT COUNT(*)
      FROM TEST_TABLE_1 LEFT JOIN TEST_TABLE_2
        ON TEST_TABLE_1.NAME = TEST_TABLE_2.NAME
    ;

    -- RIGHT JOIN
    -- ���� �� JOIN �� ������ ���̺��� NULL ���� �����ؼ� ǥ��
    SELECT COUNT(*)
      FROM TEST_TABLE_1 RIGHT JOIN TEST_TABLE_2
        ON TEST_TABLE_1.NAME = TEST_TABLE_2.NAME
    ;

    -- FULL JOIN
    -- LEFT JOIN �� RIGHT JOIN �� ������ (UNION)
    SELECT COUNT(*)
      FROM TEST_TABLE_1 JOIN TEST_TABLE_2
        ON TEST_TABLE_1.NAME = TEST_TABLE_2.NAME
    ;



-- ORACLE JOIN
    -- CROSS JOIN
    -- ���� ������ ���� ��쳪, ������ ��ȿ���� ������ ����� (��� ����� �� ����)
    SELECT *
      FROM TEST_TABLE_1, TEST_TABLE_2
    ;    
    
    -- EQUI (nature) JOIN
    -- ǥ�� JOIN �� ������
    -- NATURE JOIN �� ���� ������� �ʾƵ� ORACLE �� Į�� �̸����� JOIN ���� ����
    -- ��� ���̺� �������� �����ϴ� Į���� ������� ����
    SELECT *
      FROM TEST_TABLE_1, TEST_TABLE_2
     WHERE TEST_TABLE_1.NAME = TEST_TABLE_2.NAME
    ;
    
    SELECT *
      FROM TEST_TABLE_1 NATURAL JOIN TEST_TABLE_2
    ;
    
    SELECT *
      FROM TEST_TABLE_1 JOIN TEST_TABLE_2 USING(NAME) -- ����Ǵ� Į���� ���� ���, A �� DEPT_NO, EMP_NO �� B�� DEPT_NO, EMP_NO �� ���� ��, �����ؼ� JOIN �ϴ� ���
    ;
    
    
    -- NON-EQUI JOIN
    -- EQUI JOIN �� �ش���� �ʴ� ��� (���� Į���� �ƴ� ������ JOIN)    
    SELECT *
     FROM TEST_TABLE_1, TEST_TABLE_2
    WHERE TEST_TABLE_1.AGE BETWEEN 1 AND 10
    ;
    
    -- OUTER JOIN
    -- �����Ǵ� Į���� �����ϴ� ��쿡�� ���
    -- �����Ǳ� ������ �ʴ� Į���� (+) ����
    SELECT *
      FROM TEST_TABLE_1, TEST_TABLE_2
     WHERE TEST_TABLE_1.NAME (+) = TEST_TABLE_2.NAME
    ;    
    
    -- SELF JOIN
    -- ��ü ���̺���� ����
    -- �л�-������ ���踦 �ľ��ϴ� ��� ��� ���
    SELECT *
      FROM TEST_TABLE_2 A, TEST_TABLE_2 B
     WHERE A.NAME = B.MENTOR -- �л��� �ְ�, �ش� �л��� �����л��� �˾Ƴ��� ���� ���
   ;
   
 -- ALIAS
    -- SQL ���� ��� ���� �� Į���� ���� ������ ����ؼ� ǥ���ϴ� ���
    -- JOIN �� �� ���� ����
    -- ���� ��� (����ȭ�ؼ� �������� ����� �� �ְ� ��)
    SELECT EMP.NAME AS NAME, DEPT.DNAME AS DEPARTMENT, DEPT.LOCATION AS LOCATION
      FROM EMP JOIN DEPT USING(DEPTNO)
    
    
 -- VIEW
    -- �ӽ� ���̺��� �� ����
    -- ������ ����� �ӽ� ���̺� ����
    -- Simple View : �ϳ��� ���̺��� ����
    -- Complex View : ���� ���� ���̺��� ������ ���ͼ� ����
    
    -- User ���� View ���������� ��� ��    
    GRANT CREATE VIEW TO scott;
    
    CREATE OR REPLACE VIEW EMP_HIGH_WAGE
    AS SELECT *
         FROM EMP
        WHERE SAL >= 3000;
    
 -- CREATE TABLE SELECT
    -- ������ ����� ������ ���ο� ���̺��� �����ϴ� ��
    -- VIEW �� ����� �Ͱ� ���������� VIEW �� �ӽ� ���̺�
    CREATE TABLE EMP_SALESMAN
               AS SELECT *
                  FROM EMP
                  WHERE JOB = 'SALESMAN'
    ;    
 
 -- INSERT INTO SELECT
    -- ������ ����� �̹� �����ϴ� ���̺� �־���
    -- ���� �������� ������ ���� ���̺��� ��������� ��
    
    INSERT INTO EMP_SALESMAN
           AS SELECT *
              FROM EMP
              WHERE JOB = 'SALESMAN'
    ;    

-- CASE ... WHEN ... END
    -- ������
    -- EMP ���̺��� ������, ABBR_JOB �� �ִ� 3�ڷ� ���� �� �ڸ� �ҹ��ڷ� ����ϰ�, JOB �� ���� ǥ���Ͻÿ�    
    SELECT EMP.ENAME, CASE
                            WHEN LENGTH(EMP.JOB) > 3 THEN LOWER(SUBSTR(EMP.JOB, 1, 3))
                            WHEN LENGTH(EMP.JOB) <= 3 THEN LOWER(EMP.JOB)
                            ELSE NULL
                       END AS ABBR_JOB, EMP.JOB
    FROM EMP
    ;

-- LIKE �˻�
    -- ���ϵ�ī�� (% : 0~N ����, _ : 1����)
    -- LIKE �˻��� ��Ī�ϱ� ���� DBMS �� �δ��� �����Ƿ� LIKE �� OR �� ���� �������ڸ� �ߺ��ؼ� ������� �ʴ� �� ����
    SELECT *
      FROM EMP
     WHERE ENAME LIKE '%S%' -- S �� �����ϰ� �ִ� �̸��� ���� �����
   ;
   
   SELECT *
     FROM EMP
    WHERE ENAME LIKE 'A___'  -- ABCD, ALEN
   ;


-- NULL
    -- NULL = �ش� Į���� ���� ������ �ǹ�
    -- NULL ���� ������ �ִ� Į���� �˻��Ϸ��� IS NULL
    -- NULL �� �ƴ� ���� ������ �ִ� Į���� �˻��Ϸ��� IS NOT NULL

    SELECT *
      FROM EMP
     WHERE MGR IS NULL
   ;
     
   SELECT *
     FROM EMP
    WHERE COMM IS NOT NULL
   ;


-- NULL �Լ�
    -- ����Į���� ������ �� NULL �� ó�����ִ� �Լ�
    -- ���ڿ���/�����Լ��� ���� ó���� ����Ǿ� ����
    -- ���� �Լ��� ������ �ִ� ���� NULL �Լ��� ����ؾ� ��

    SELECT ENAME, NVL(COMM * 1.5, 0) -- ���� ������ 0�� ǥ��
      FROM EMP
    ;
    
    SELECT ENAME, NVL2(COMM * 1.5, 'Y', 'N') -- ���� �����ϸ� Y ������ N ǥ��
      FROM EMP
    ;
    
    SELECT ENAME, COALESCE(COMM, COMM, 1) -- ���� ������ ǥ���ϰ�, ������ 1 ǥ��
      FROM EMP
    ;
    
    
 -- GROUP BY
    -- SELECT Į����, �����Լ��� (Į��) FROM ���̺�� GROUP BY Į����;
    SELECT DEPT.DNAME, COUNT(DEPT.DNAME) AS NUMBER_COUNT    -- EMP ���̺��� �μ��� ������
      FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
  GROUP BY DEPT.DNAME
  ;
  
 -- HAVING
    -- ���� ���꿡 WHERE ������ ��ü�� ���
    SELECT DEPT.DNAME, COUNT(DEPT.DNAME) AS NUMBER_COUNT    -- EMP ���̺��� ���� ���� 5�� �̻��� �μ��� �μ��� ������ ���
      FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
  GROUP BY DEPT.DNAME
    HAVING COUNT(DEPT.DNAME) >= 5
  ;
  
  
  -- SUBQUERY
    -- ������ ���� �� �ٸ� �������� �ִ� ����
    -- ���������� ���� ������ ���ԵǴ� ����
        -- () �� ����� ���δ� ����
        -- ORDER BY �� ������� ����
        
    -- ��� ������ ��ġ
        -- SELECT, FROM, WHERE, HAVING, ORDER BY, VALUES (INSERT), SET (UPDATE)
    -- ����
        -- ������ (Single Row)
        -- ������ (Multi Row)
        -- ���� �÷� (Multi Column)
        
 -- ������ ��������
    -- ����� ���ڵ� �ϳ��� ��������
    -- �Ϲ� ������ (=, >, < ��) ���
    
    SELECT COUNT(*)
      FROM EMP
     WHERE DEPTNO = ( SELECT DEPTNO
                        FROM DEPT
                       WHERE DNAME = 'ACCOUNTING' )
    ;
    
    SELECT ENAME, SAL
      FROM EMP
     WHERE SAL > (SELECT AVG(SAL)
                    FROM EMP
                   WHERE DEPTNO = ( SELECT DEPTNO
                                      FROM DEPT
                                     WHERE DNAME = 'RESEARCH' ) )
    ;
    
 -- ������ ��������
    -- ����� ���ڵ� ���� ���� ��������
    -- ������ ������ (IN, ALL, ANY, EXISTS) ���
    
    -- ALL
        -- ���� ���� ���ڵ��� AND ȿ�� (���� ū ������ ū)
        -- SAL > ALL (SELECT SAL ...)
        SELECT ENAME, SAL
          FROM EMP
         WHERE SAL > ALL( SELECT SAL
                            FROM EMP
                           WHERE DEPTNO = 20 )
        ; -- �μ���ȣ�� 20�� �μ��� ��� �������� ������ �� ���� ������ ENAME �� SAL �� ǥ��
        
        
    -- ANY
        -- ���� ���� ���ڵ��� OR ȿ�� (���� ���� ������ ū)
        -- SAL > ANY (SELECT SAL ...)
        SELECT ENAME, SAL
          FROM EMP
         WHERE SAL > ANY( SELECT SAL
                            FROM EMP
                           WHERE DEPTNO = 20 )
        ; -- �μ���ȣ�� 20�� �μ��� ���� �� ���� ������ �������� ������ �� ���� ������ ENAME �� SAL �� ǥ��
        
        
    -- IN
        -- ����� �߿� �ִ� �� �߿����� �ǹ�, ������ �����
        SELECT DEPTNO, COUNT(DEPTNO)
          FROM EMP
         WHERE DEPTNO IN ( SELECT DEPTNO
                             FROM DEPT
                            WHERE DNAME IN ('ACCOUNTING', 'RESEARCH') )
        GROUP BY DEPTNO
        ; -- �μ����� 'ACCOUNTING', 'RESEARCH' �� �μ��� �μ���ȣ �� ���� ��ȣ�� ǥ��
      

 -- ��ƼĮ�� ��������
    -- ����� Į�� ���� ���� ��������
        SELECT ENAME, JOB, DEPTNO
          FROM EMP
         WHERE (ENAME, JOB, DEPTNO) IN ( SELECT ENAME, JOB, DEPTNO
                                           FROM EMP
                                          WHERE SAL > 3000 )
        ; -- �޿��� 3000�� �Ѿ�� ������� JOB, �μ���ȣ�� ǥ��

-- ���տ���
    -- UNION, INTERSECT, MINUS ��
    -- UNION
        -- �� ������ ������� ���ļ� ����
        -- �� ������ ��� ������ �����ؾ� �� (�⺻������ DISTINCT ����)
        -- �ٸ� ���̺��̶� ������� ���ĸ� ��ġ�ϸ� ��
        
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'CLERK'
        
        UNION
        
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'SALESMAN'
        ; -- EMP ���̺��� JOB�� 'CLERK' �� 'SALESMAN' �� ������ �μ���ȣ�� ǥ���Ͻÿ�

    -- UNION ALL
        -- �ߺ��� ����ϴ� UNION
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'CLERK'
         
        UNION
        
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'SALESMAN'
        ;

    -- INTERSECT
        -- �� ������ ����� �� ���밪�� ã�Ƽ� ����
        -- �� ������ ��� ������ �����ؾ� �� (�⺻������ DISTINCT ����)
        -- �ٸ� ���̺��̶� ������� ���ĸ� ��ġ�ϸ� ��
        
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'CLERK'
         
        INTERSECT
        
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'SALESMAN'
        ;
 
    -- MINUS / EXCEPT
        -- ����1�� ��������� ����2�� ������� ���� ������
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'CLERK'
         
        MINUS
        
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'SALESMAN'
        ;
     
-- �ڷ���
    -- NUMBER(a, b)
        -- ���ڸ� �ٷ�µ� ����ϴ� ������ Ÿ��
        -- number(10, 2) : �Ҽ��� �������� 10�ڸ�, �Ҽ��� ���� 2�ڸ�
        -- �ٸ� �ý���/������ ȣȯ���� ���� int/float ���
    -- ���ڿ�
        -- CHAR(size) : �������� ���ڿ� (ex. CHAR(10) �� 'SIMPLE' �� �ְ� �Ǹ� 'SIMPLE    ' ���·� ����Ǳ� ������ TRIM() �� ����ؼ� ��ĭ�� �����ؾ� ��)
        -- VARCHAR2(size) : �������� ���ڿ�
    -- Long
        -- 2GB �̳��� ���ڿ��� ó���ϴ� ������
    -- Date
        -- ��¥�� ������ �����͸� �����ϴ� ������ Ÿ��
    -- CLOB (Character Large Object)
        -- 4GB ������ ���ڿ��� �����ϴ� ������ Ÿ��
    -- BLOB (Binary Large Object)
        -- 4GB ������ ���̳ʸ� �����͸� �����ϴ� ������ Ÿ��

-- �������� (CONSTRAINT)
    -- NOT NULL
        -- �����Ͱ� NULL ���� �޾Ƶ����� ����
    -- UNIQUE
        -- ���̺� ������ ���� �ԷµǾ� ���� ��� �޾Ƶ����� ����
    -- PRIMARY KEY
        -- �⺻Ű �������� (UNIQUE, NOT NULL)
    -- FOREIGN KEY
        -- �ܷ�Ű ��������
    -- CHECK
        -- �Է°� üũ (ex. AGE >= 0)
    -- DEFAULT
        -- Į������ �Էµ��� ������ �⺻���� �Է�
            
-- ��Ű��
    -- DDL (Data Definition Language)
        -- DB�� ���̺��� CRUD
        -- ���̺� ���� ������ ��Ÿ������ (Metadata) �� ������ ���� (Data Dictionary) �� ���� / ������
    -- DB ����
    CREATE DATABASE DB_NAME;
    
    -- ���̺� ����
    CREATE TABLE BUSINESS_CARD (
        ID INT NOT NULL,
        NAME VARCHAR2(255),
        ADDRESS VARCHAR2(255) DEFAULT 'SEOUL', -- ���� �������� ������ SEOUL �� �Էµ�
        TELEPHONE VARCHAR2(255),
        AGE FLOAT(3), -- FLOAT = FLOAT(22) �� ���� �ǹ� (PRECISION : 1~128)
        PRIMARY KEY(ID),
        CHECK(AGE >= 0) -- AGE �� 0�� �Ѵ� �͸� ���� �� �ְ� ��
    );
    
    CREATE TABLE SALARY (
        ID NUMBER(38) NOT NULL, -- NUMBER(38, 0) �� DEFAULT ������ INT �� ������ = NUMBER(38) �� ���� �ǹ� (PRECISION : 1~38, SCALE : -84~127)
        SALARY_AMOUNT NUMBER, -- NUMBER(38, 0)
        BUSINESS_CARD_ID NUMBER NOT NULL,
        PRIMARY KEY(ID),
        FOREIGN KEY(BUSINESS_CARD_ID) REFERENCES BUSINESS_CARD(ID) -- BUSINESS_CARD ���̺� ID �� �ִ��� Ȯ���ϰ�, ������ INSERT �� �� �ְ� ��
    );
    
    INSERT INTO BUSINESS_CARD(ID, NAME, TELEPHONE, AGE)
         VALUES (1, 'SAM', '123-4567', 10)
    ; -- DEFAULT ���� �����Ǿ� ���� ��� �ش� Į���� �����ϰ� ���� �� ����
    
    
    -- ���̺� ���� ���
    DESC BUSINESS_CARD;

-- SEQUENCE
    -- �ڵ���ȣ ������
        -- �⺻Ű�� ����ϱ� ���ϵ��� ���ڸ� ������ ��Ģ�� ���� ����
        -- �ٸ� DBMS�� AUTO_INCREMENT �Ӽ��� �����ϴ� ����
        -- CREATE SEQUENCE SEQUENCE_NAME
        -- START WITH N
        -- INCREMENT BY N
    
    -- ������ ��ȸ �Լ�
        -- CURRVAL()
        -- NEXTVAL()
        
    CREATE TABLE BUSINESS_CARD (
        ID INT,
        NAME VARCHAR2(255),
        ADDRESS VARCHAR2(255),
        TELEPHONE VARCHAR2(255)
    );
    
    CREATE SEQUENCE BUSINESS_CARD_SEQ
         START WITH 1 -- DEFAULT
          INCREMENT 1 -- DEFAULT
    ; -- SEQUENCE ����
    
    SELECT BUSINESS_CARD_SEQ.NEXTVAL
      FROM DUAL
    ; -- 1 � ���ǿ��� NEXTVAL �� ���� ���� ä CURRVAL �� �䱸�ϰ� �Ǹ� ���� �߻���. CURRVAL �� �ٷ� �� ������ ���� ���� ������ �ִ� ���� ������ ���� �ǹ��ϹǷ� �ѹ��� NEXTVAL �� �䱸�� ���� ���ٸ� �����ϰ� �ִ� CURRVAL ���� ���� ����

    SELECT BUSINESS_CARD_SEQ.CURRVAL
      FROM DUAL
    ; -- 1
    
    INSERT INTO BUSINESS_CARD
        VALUES (BUSINESS_CARD_SEQ.NEXTVAL, 
                'BOB', 
                'SEOUL', 
                '123-4567')
    ;

    INSERT INTO BUSINESS_CARD
        VALUES (BUSINESS_CARD_SEQ.NEXTVAL, 
                'SAM', 
                'DAEGU', 
                '345-6789')
    ;

    SELECT *
      FROM BUSINESS_CARD;
      -- 2 / BOB / SEOUL / 123-4567
      -- 3 / SAM / DAEGU / 345-6789
      
-- �ߺ����� ����
    -- ���̺� ���� ������ �ߺ����� �ʾƾ� ��
        -- ������ ������ ���� ���̺� ����Ǿ� ������ ������ ���� �δ�� ���Ἲ ������ ���� ����
    -- �̸� ���� ����ȭ�� ���� �ߺ��� ����
        -- �� 1 ������, �� 2 ������, �� 3 ������
    -- �ߺ��� ���� �� �ʿ��� ������ �ܷ�Ű (Foreign Key) �� ���� ������ ���� �ʿ��� ������ ���� [RDBMS]

-- ������ [�ߺ��� �����ϱ� ���� ���̺� ���� ��Ģ]
    -- �� 1 ������ : ���� �� ���� ��ŭ �ɰ���
    /*
        (����)
        �� [#����ȣ, ����, �����] �� �ִ� ���̺��� ���� ���� ���� ������ �� �� ����
        
        (1NF)
        �� [#����ȣ, ����] - (��ü�� �Ǿ�) 1 : N (����Ͽ�) - ��� [#�����, ���, ���]
    */
    
    
    -- �� 2 ������ : ���̺��� �÷����� PRIMARY KEY�� ���� �����Ǵ� �÷������� �����ض�
    /*
        �а���� [#�й�, #�ڽ��ڵ�, ���ڵ�, �򰡳���, �ڽ���, �Ⱓ]
        - UID (���� �ĺ���) �� �й��� ���ڵ�, �򰡳����� ����
        - UID �� �ڽ��ڵ尡 �ڽ���, �Ⱓ�� ����      
        
        �ڽ� [#�ڽ��ڵ�, �ڽ���, �Ⱓ] - (��Ϲ޾�) 1 : N (����Ͽ�) - �а���� [#�й�, ���ڵ�, �򰡳���]
    
    */
    
    -- �� 3 ������ : �÷��� ���� ���Ӱ��谡 ������ �� ��
    /*
        �ڽ� [#�ڽ��ڵ�, �ڽ���, �Ⱓ] - (��Ϲ޾�) 1 : N (����Ͽ�) - �а���� [#�й�, ���ڵ�, �򰡳���]
        - UID (���� �ĺ��� = �й�) �� ���ڵ忡 ���� ���ӵǰ�, �򰡳����� ���� ���ӵ�
        - UID (���� �ĺ��� = �й�) �� �򰡳����� ���� ���ӵ�
        
        �ڽ� [#�ڽ��ڵ�, �ڽ���, �Ⱓ] - (��Ϲ޾�) 1 : N (����Ͽ�) - �а���� [#�й�] - (�򰡹޾�) N : 1 (�����Ǿ�) - ���׸� [#���ڵ�, �򰡳���]
        
    */


-- �������Ἲ (Referential Integrity)
    -- �ܷ�Ű (FK) �� ����Ǵ� ��Ģ
    -- �ܷ�Ű�� �����Ǵ� ���� ���̺��� Ű�� ���踦 ���
    -- �ܷ�Ű�� �����ϸ� ���� ���̺� �ش� ���ڵ� ���� �ݵ�� �����ؾ� ��
    -- ���� ���� ���ڵ带 �����Ϸ��� �����ϴ� �ܷ�Ű (FK) ���� ���� NULL �� ������ ��
    -- �ܷ�Ű �������谡 ���� ���, ���ڵ� �߰�/���� �� ���İ��踦 ��Ÿ��


-- ��Ű�� ����
    -- �̹� ������ ��Ű���� ���� ������ ��� ���
    -- ���̺� Į�� �߰� / ���� / ����

    -- ���̺� Į�� �߰�
    ALTER TABLE BUSINESS_CARD
           ADD (ID INT)
           DROP COLUMN ID
    ;

    -- Į�� Ÿ�� ����
    ALTER TABLE BUSINESS_CARD
         MODIFY ADDRESS CHAR(255)
    ;

    -- Į���� ����
    ALTER TABLE BUSINESS_CARD
         RENAME ADDRESS
             TO ADDRESS_CHG
    ;


    -- ID Į�� PK ����
    ALTER TABLE BUSINESS_CARD
           ADD PRIMARY KEY(ID)
          DROP PRIMARY KEY
    ;

    -- UNIQUE �������� �߰�/����
    ALTER TABLE BUSINESS_CARD
            ADD UNIQUE (NAME)
            ADD CONSTRAINT UNIQUE_CONSTRAINT_NAME UNIQUE (NAME, ID)
           DROP UNIQUE UNIQUE_CONSTRAINT_NAME
    ;
    

    -- �ܷ�Ű �������� �߰�/����
    ALTER TABLE BUSINESS_CARD
            ADD FOREIGN KEY (NAME) REFERENCES EMP(ENAME)
            DROP FOREIGN KEY NAME
    ;
    
    -- CHECK �������� �߰�/����
    ALTER TABLE BUSINESS_CARD
            ADD CHECK (AGE > 0)
            ADD CONSTRAINT CHECK_CONSTRAINT_NAME CHECK (AGE > 0)
           DROP CHECK CHECK_CONSTRAINT_NAME
    ;
    
    -- DEFAULT �������� �߰�/����
    ALTER TABLE BUSINESS_CARD
          ALTER NAME SET DEFAULT 'ANONYMOUS'
          ALTER NAME DROP DEFAULT
    ;    
    
    -- ADDRESS_CHG �⺻�� ���� ('SEOUL')
    ALTER TABLE BUSINESS_CARD
         MODIFY ADDRESS_CHG DEFAULT('SEOUL')
    ;

    -- ���̺�� ����
    ALTER TABLE BUSINESS_CARD
         RENAME TO BUSINESS_CARD_TABLE 
    ;

-- ��Ű�� ����
    -- DB ����
    DROP DATABASE INC_STD;
    
    -- ���̺� ����
        -- ���̺� ����, ����� ���̺� ��ü ����
        -- ���̺�, ����, ��ü ��� ����
        -- ���� �� �ǵ��� �� ����
        DROP TABLE TABLE_NAME;
    
        -- ���ڵ带 ������ �ϳ��� ����, ���̺� ��Ű�� ����
        -- �����ʹ� ���������� ���̺� �뷮�� �پ� ���� ����
        -- Ư�� �����͸� ���� �� ����
        -- ���� �� �߸� ������ ���� �ǵ��� �� ����
        DELETE *
          FROM TALBE_NAME
        ;
        
        -- ���̺� ���븸 ����, ���̺� ��Ű�� ���� (���� ��ɾ�)
        -- �뷮�� �پ���, �ε��� � ��� ������ (�Ѳ����� �� ������)
        -- ���� �� ���� �ǵ��� �� ����
        TRUNCATE TABLE TABLE_NAME;

-- ���� ����
    -- ���� ���� (Access Control) ����
        -- DCL (Data Control Language)
            -- ���� �� ���� �����ϴ� ���
            -- Ư�� ���̺� ���� CRUD ���� ����
            
            -- CREATE USER, DROP USER, DROP ANY TABLE, BACKUP ANY TABLE, QUERY REWRITE, CREATE SESSION, CREATE TABLE, CREATE VIEW

    /*
    -- ���� �۾�
    CONN SYS AS SYSDBA
    CRAETE USER SAMPLE IDENTIFIED BY TEST; -- SAMPLE ����� �߰� (��й�ȣ : TEST)
    CONN USER/TEST
    SHOW USER;    
    SELECT * FROM SCOTT.EMP;
    */

    GRANT CREATE SESSION
       TO SAMPLE
    ;
    
    -- SAMPLE ����ڿ��� EMP ���̺� ��ȸ���� �ο�
    GRANT SELECT ON EMP
       TO SAMPLE
    ;

    GRANT SELECT ON EMP
       TO SAMPLE
       WITH GRANT OPTION -- ����ڰ� ��ü�� ������ ������ �ο������鼭 �� ������ �ٸ� ����ڿ��� �ο��� �� �ִ� ���ѵ� �Բ� �ο�����
    ;


    -- SAMPLE ����ڿ��� EMP ���̺� ��ȸ���� ����
    REVOKE SELECT ON EMP
      FROM SAMPLE
    ;


    -- ���� ��ȸ (���� ����ڰ� �ٸ� ����ڿ��� �ο��� ���� ����)
    SELECT *
      FROM USER_TAB_PRIVS_MADE
    ;
    
    -- ���� ��ȸ (�ڽſ��� �ο��� ����� ����)
    SELECT *
      FROM USER_TAB_PRIVS_RECD
    ;
    
-- ���� ����

    -- ���� ���̺� ���� CRUD ������ ����ں��� �����ϸ� ����� ���� ���̺� �� X ����� ���� ������ ����
    -- �̷� �������� �����ϱ� ���ؼ� �� (����) �� ���ϰ� ���Һ� ���� �����ϰ� ����ڿ��� ������ �ο��ϴ� ���·� ���
    -- ����ڰ� ���� ���� ���� ������ ���� ������
    
    -- ���� ����
    CREATE ROLE ROLE_NAME;
    
    -- ���ҿ� ���� ���� ����
    GRANT CREATE SESSION, CREATE TABLE TO ROLE_NAME; -- ���ҿ� ���� �ο� (���̺� ����, ����)
    
    GRANT [CRUD] ON TABLE_NAME TO ROLE_NAME;
    GRANT UPDATE(ENAME) ON SCOTT.EMP TO TEST; -- ���� 1) TEST ���ҿ� EMP ���̺��� �˻�, �߰� ���� �ο�
    GRANT SELECT, INSERT ON SCOTT.EMP TO TEST; -- ���� 2) TEST ���ҿ� EMP ���̺��� ��ȸ, ������Ʈ ���� �ο�
    GRANT ALL ON SCOTT.EMP TO TEST; -- ���� 3) TEST ���ҿ� EMP ���̺��� ��� ���� �ο�    
        
    -- ����ڿ��� ���� �ο�
    GRANT ROLE_NAME TO USER_NAME;
    
    -- ���ҿ� �ο��� �ش� ���̺��� ��� ���� ����
    REVOKE ALL ON TABLE_NAME FROM ROLE_NAME;


-- INDEX
    -- �˻��� ������ �ϱ� ���� �ڷᱸ�� (�ַ� B Ʈ�� �迭)
        -- ���ڵ� �߰� / ���� / ���� �� �ش� Į������ �ٽ� ������ �� �˻��� �ʿ��� ������ �̸� ����� �˻� �ӵ��� ���� (TRADE OFF)
    -- �⺻Ű�� �ڵ����� �ε��� ����
    -- �ε��� ON/OFF �� ���� �˻� �ӵ� ���� ü�� (�뷮�� �������ϼ��� ū ����)
    -- ���� (JOIN) �ÿ��� ������ �� : �ϳ��� ���̺��� ��ȸ�� �Ŀ� ��ġ�� ��찡 ����


    -- ����
        -- ���� �˻��� ���ؼ��� �����Ͱ� �ݵ�� ���� (Sorting) �Ǿ� �־�� ��
        -- ���ĵǾ� ���� �ʴٸ� ��������� ��ü �������� ���� �ʿ� (BEST : 1, WORST : N, AVE : N/2)
        -- ���ĵǾ� ���� ��� �����͸� ���� �ð����� ã�� �� ����
        -- ������/������ �迭�� �ַ� ����

    -- �ε���
        -- �����˻� (Binary Search)
            -- �ִ� log2(N) �� ���� �˻� ����
        -- B-Ʈ�� (B-Tree)
            -- ���� �˻��� ���������� �� ���� �񱳸� 2�� (a, b : a < b)
                -- ���� ������ ���� ��� (x < a)
                -- ū ���� ���� �� ������ ��� (a < x < b)
                -- ū ������ ū ��� (b < x)
            -- B Ʈ�� �迭�� �����˻� �迭���� ���� O(NlogN) ~ O(N^2)
            -- �����Ͱ� �߰�/����/����� ������ a, b �� ������Ʈ


    -- �ε��� ����
        -- �⺻Ű (PK), �ܷ�Ű (FK) �� ��쿡�� �ε����� �ڵ����� ������
        -- ����
            -- ���� (Unique INDEX)
            -- ����� (Non-Unique)
            -- ����
            -- ����
            -- �Լ���� �ε���

    -- �ε��� �߰�/����
    CREATE INDEX INDEX_NAME ON TABLE_NAME(COLUMN_NAME);
    CREATE INDEX INDEX_NAME ON TABLE_NAME(COLUMN_NAME1, COLUMN_NAME2, ...);
    CREATE UNIQUE INDEX INDEX_NAME ON TABLE_NAME(COLUMN_NAME);
    ALTER TABLE TABLE_NAME DROP INDEX INDEX_NAME;
    ALTER INDEX INDEX_NAME REBUILD; -- ������Ų �ε����� �ٽ� ����
    
    -- �ε��� Ȯ��
    SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME -- �ε��� Ÿ���� �˰� ���� ��
      FROM USER_INDEXES
     WHERE TABLE_NAME IN ('EMP', 'DEPT')
    ;
    
    SELECT INDEX_NAME, TABLE_NAME, COLUMN_NAME -- ��� �÷��� �ε����� ����Ǿ�����
      FROM USER_IND_COLUMNS
     WHERE TABLE_NAME IN ('EMP', 'DEPT')
    ;

    -- VISIBILITY INDEX
    SELECT TABLE_NAME, INDEX_NAME, VISIBILITY
      FROM USER_INDEXES
     WHERE TABLE_NAME = 'BUSINESS_CARD'
    ;
    
    -- �������̸� Ȯ���Ϸ��� INDEX ���� A/B (ON/OFF) �׽�Ʈ�� �ʿ���
    -- INDEX �� �����ϱ� �� INVISIBLE ���·� ����� �̸� Ȯ���� �� �ְ� ��
    -- INDEX ���� PREVIEW (���� INDEX �� ȿ���� �ִ���)
    ALTER INDEX INDEX_NAME INVISIBLE;
    
    
-- ��Ÿ������ (METHADATA)
    -- �����͸� ���� ������
    -- DB, ���̺��� ��Ű���� ���� ������ �����ϴ� ���̺�
    -- DB��, ���̺��, Į����, ����ڸ� ��

    -- ����
        -- ������ ��ųʸ�
            -- �����ͺ��̽��� ���� ����
            -- �ý��� īŻ�α׶�� ��
            -- �Ϲ������� READ-ONLY
            
            -- ���� (PREFIX �� ���� �ٸ� ����)
                -- USER_TABLES
                    -- TABS
                        -- ������ ����ڰ� ������ ���̺��� ������ �����ϴ� ������ ��ųʸ�
                    -- COLS
                        -- ������ ����ڰ� ������ ���̺���� Į�� �������� �����ϴ� ������ ��ųʸ�
                -- ALL_TABLES
                -- DBA_TABLES
                -- CBA_TABLES (�����̳� ���� ��ųʸ� : ����Ŭ 12C�� �߰���)


        -- ������ ���丮
            -- DBMS�� ��� �����Ͱ� ����Ǵ� ���丮
            -- DB����, ���� �� �α� ����
    
-- �ɸ��ͼ� (CHARSET)
    -- �������ڵ� ����
    -- ��Ÿ�������� ����
    -- ���ڿ�(VARCHAR, CHAR) �� ���� ������ �� ���Ǵ� �⺻����
    -- DB/���̺��� ���� ���� ����
    
    -- ����
        -- ASCII/ISO-8859-1 (�ƽ�Ű �迭)
        -- EUC-KR/KSC_5601 (�ѱ� �ϼ��� �迭)
        -- UTF8/UNICODE (�����ڵ� �迭)
        -- UTF8 (����Ŭ �⺻) (1BYTE ~ 4BYTE) (�ѱ��� 3BYTE)
        SELECT * FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER = 'NLS_CHARACTERSET';
    
    -- ASCII
        -- �� �ڿ� �� ����Ʈ �Ҵ�
        -- DBCS (Double Byte Character Set) : �ѱ� �ϼ����� ������/���� : 1Byte , �ѱ� : 2Byte
        -- ���󸶴� �ٸ� �� �ֱ� ������ �̸� ���� ǥ��ȭ�� ���� ISO-8859
    -- �ѱ��ڵ�
        -- �ϼ��� (1 + 7 + 8 : ���� �ϳ��� ������ '��' �̶�� ���ڸ� ����) / ������ (5 + 5 + 5 : �� + �� + �� �� ���� 5��Ʈ�� ����)
        -- �ѱ��� ������ ���� ��� ���� : 11172 ���� ����
        -- ǥ�ؿϼ��� : KSC5601 / EUC-KR
        -- MS�� Ȯ��ϼ��� : MS949 / CP949  
    -- �����ڵ�
        -- �������� ��� ���ڸ� ������ �����ڵ�
        -- �ƽ�Ű �ڵ带 �����ڵ�� ��ȯ
        -- �����ڵ� ����� �����츦 ����� �� ���󺰷� �ٸ� OS �� ���� �ʿ䰡 ������
        -- �⺻���, Ȯ����� ���� (�ַ� 2BYTE)
    -- UTF-8
        -- �ƽ�Ű �ڵ带 �����ڵ�� ��ȯ�ϴ� �������� ȣȯ�� �ȵǴ� ��쵵 ������
        -- �����ڵ��� �������� ���ڵ� (1BYTE ~ 6BYTE)
        -- �ƽ�Ű �ڵ���� ȣȯ�� (1BYTE �� ��� �ƽ�Ű �ڵ� ���)
        -- �ѱ��� ���� 3BYTE
        
        
-- �����ͺ��̽� ���
    -- ���� ��� : Ư�� ���̺� ������� ���ϰ�, DB ���� ��ü�� ���ؼ� ���
        -- �� ��� (����Ŭ ���񽺰� �����ϴ� �߿� ���)
            -- ���������� ����
                -- ��ü ������ 10GB �� ���, 10GB ��ü�� �����
            -- RMAN ��� (���α׷� �� ���)
                -- Incremental Backup
                    -- ��ü ������ 10GB �� ���, ������׸� �����
                -- Cumulative Backup
        
        -- �ݵ� ��� (����Ŭ ���񽺰� ������ ���¿��� ���)
        
    -- �� ���
        -- Ư�� ���̺� ��� ���� (SQL �� ���ؼ�)
        -- EXPORT / IMPORT
        -- ����Ŭ 10G �̻���ʹ� DATAPUMP (���α׷� ��)
            -- ��ӹ��
            -- ���� ������� ȣȯ �Ұ� (���� EXP ���� ������� ��, DATAPUMP ��� �Ұ�)

        -- ��ü ��� (����)
        EXP USERID = HR/HR FILE = './HR.DUMP' FULL = Y

        -- HR ��Ű���� ����Ͻÿ� (���� ���̵� �����ϰ�, ����Ǿ ������ ������ ��ġ�� �̸��� ������) (����)
        EXP USERID = HR/HR FILE = './HR.DUMP'


-- �����ͺ��̽� ����
    -- [����] DB �����ϰ�, TABLESPACE �����ϰ�, ���� ���� �� TABLESPACE ���� ������ �߰��ؾ� ��
    -- �� �Ŀ� IMP ��ɾ ���� IMPORT ����� ��

    -- HR ��Ű���� �����Ͻÿ� (����)
    IMP USERID = HR/HR FILE = './HR.DUMP'
    
    
-- �����ͺ��̽� �α�
    -- REDO LOG
        -- DML/DDL ������ ��� ��ϵ�
        -- ��� �߻� �� ���� �����ؼ� ����
        -- DML ��ü�� �������� �ʰ�, ���� ���׿� ���� ���
        -- DDL �� ���� ���� ��ü�� ���� ������ ���

        -- REDO �α׸� ���� ���
        ALTER SYSTEM SWITCH LOGFILE
        DESC v$log; -- � �α׵��� ACTIVE, CURRENT, INACTIVE ��������
        DESC v$logfile; -- �α��� ID �� ���� ��ġ �� �̸�
        
    -- ALERT LOG
        -- ��׶��� ���μ��� �۾��α�, ���� �߻� �� ������
    
    -- ARCHIVE LOG
        -- ��ȿ�Ⱓ�� ���� REDO �� ������ ���纻
    
    -- TRACE FILES
        -- ALTER SESSION SET SQL_TRACE = TRUE
        -- CPU, �޸�, DISK I/O �� ���� �������� ����
        -- SQL Ʃ�� �� �ʿ���
        
        
-- ��Ƽ�Ŵ�/����
    -- �����ͺ��̽� ��Ƽ�Ŵ� (PARTITIONING)
        -- VLDB (VERY LARGE DBMS)
            -- ��ü DB�� �ϳ��� DBMS �ý��ۿ� �� ���� ��������� ���
            -- ���̺���� ���� ���� ������ ������ �л� ����
            -- �ϳ��� ���̺��� ����� ��쿡�� ������� (a-m, n-r, s-z) �� ���� ������ ����
        
        -- ����        
            -- ��Ƽ�Ŵ� (PARTITIONING)
                -- DBMS ���������� ����
                
            -- ���� (SHARDING)
                -- DBMS �ܺο��� ���� / ���뷹������ �����ؾ� ��
            
        -- ������� �߻� (CONSTRAINTS)
            -- ���̺� ���� ������ ������� (��� ����)
                -- ���ο��� ����� -> ����ȭ (NORMALIZATION) ����
                -- ������ȭ (DENORMALIZATION) -> �ߺ�������� �ذ�
            -- �ܷ�Ű (FK) �� ȿ�� ����
                -- ����� �߰� �� ���� ���Ἲ ���� üũ -> �ý��� �δ������� ������ȯ
                -- CRUD �� ��ġ (LOCATION) �� �ν��ؾ� �� (��Ƽ�Ŵ� / ������ ������)
                
        -- ���� (BENEFITS)
            -- ������ ��ü �˻� �� �ʿ��� �κи� Ž���ؼ� ���� ����
            -- ��ü �����͸� �ս��� ���ɼ��� �پ�� (���뼺 ���)
            -- ��Ƽ�Ǻ� ���/���� ����
            -- ��Ƽ�� ������ I/O �л� ���� (������Ʈ ���� ���� : �ַ� ������ ������ ������)
            
        -- ���
            -- ���� (RANGE) : A~M / N~R / S~Z [�������� ���]
            -- �ؽ� (HASH) : HASH �Լ� ��Ƽ�Ǻ��� ũ�⸦ ����ϰ� ���� [���� ����ϰ� ��������]
            -- ����Ʈ (LIST) : Ư���� Į���� ���� [�񿬼����� ���]
            -- ������Ʈ (COMPOSITE) : RANGE-HASH / RANGE-LIST
            -- ���͹� (INTERVAL) : RANGE ��Ƽ�ǿ��� MAXVALUE ��Ƽ�� ���� ������ ���͹� ���� ������ ��Ƽ���� ����
            -- ���۷��� (REFERENCE) : �θ�� 1:1 ������ �ڽ� ���̺� ��Ƽ���� �� �����
            
            
        -- BUSINESSCARD ���̺� ���� (CREATETIME) Į���� �߰��ϰ� ��Ƽ�Ŵ��Ͻÿ�
        CREATE TABLE BUSINESSCARD (ID INT NOT NULL, NAME VARCHAR2(255), ADDRESS VARCHAR2(255), TELEPHONE VARCHAR2(255), CREATETIME DATE)
        PARTITION BY RANGE (
            YEAR(CREATETIME)) (
                                PARTITION P0 VALUE LESS THAN (2013),
                                PARTITION P1 VALUE LESS THAN (2014),
                                PARTITION P2 VALUE LESS THAN (2015),
                                PARTITION P3 VALUE LESS THAN MAXVALUE
                              );
                              
        -- ��Ƽ�� �߰�
        ALTER TABLE BUSINESSCARD
          ADD PARTITION (
                          PARTITION P4 VALUE LESS THAN (2005)
                        );
        
        -- ��Ƽ�� ����
        ALTER TABLE BUSINESSCARD
         DROP PARTITION P4;
         
        -- ��Ƽ�� ����
        ALTER TABLE BUSINESSCARD
         REORGANIZE PARTITION P3 INTO (
                                      PARTITION P3 VALUE LESS THAN (2015),
                                      PARTITION P4 VALUE LESS THAN MAXVALUE
                                      );
        
        -- ��Ƽ�� ����
        ALTER TABLE BUSINESSCARD
         REORGANIZE PARTITION P2, P3 INTO (
                                          PARTITION P23 VALUE LESS THAN (2014)
                                          );


-- �����ͺ��̽� ����
    -- DBMS �� ������ ������ ������ DB ������ ����
    -- �� �� �̻��� DBMS �ý����� ������ / �����̺�� ������ ������ DBMS -> �����̺� DBMS �� SQL ���� ���� (SELECT ����)
        -- ������ ������Ʈ (CUD) �� �����Ϳ��� ����
        -- �б� (R) �� �����̺꿡�� ����
    -- �б� ���� ��� (Read Scalability : �����̺갡 �� ���� �ƴ϶�, ���� ���� �þ ���� ����ڵ��� ���� �����̺� DB�� �л��ؼ� ���� �� �ְ� ��)
    -- ���뼺 (HA : High Availability) ���� (������ �߱� ������ �ٸ� DBMS ���� ������ �߻��ص� �д� �Ϳ��� ������ ����)
    -- ����Ŭ������ RAC (Real Application Clusters) ��� ������� �Ҹ� (= Oracle Parallel Server)
    -- ����Ŭ �����Ͱ��� (Oracle Dataguard : Active �� StandBy �� ������) �� �ٸ� ���
    -- �ּ� �� �� �̻��� ����Ŭ ���� �ʿ� (����ȭ �ý��� �Ǵ� ���� ����)
    
    
-- ����Ŭ 12C
    -- ��Ƽ�׳�Ʈ (Multi-Tenant) ��Ű��ó
        -- �ϳ��� CDB (Container DB) �� ���� ���� PDB (Pluggable DB) �� ���� ����
        -- �ϳ��� �����̳ʿ� ���� ���� DB ����
        
        -- ����
            -- ��Ʈ (Root) �����̳� (CDB$ROOT)
                -- �������� + ����Ŭ�� �����ϴ� ��Ÿ������
                -- ��ǻ��
            -- �õ� (Seed) �����̳� (PDB$SEED)
                -- ���ο� PDB�� ������ �� ����ϴ� ���ø�
                -- USB
            -- PDB �����̳�
                -- ������ �����ߴ� DB�� �ش�
                -- USB �� ������
                
            -- �ϳ��� �����̳� DB (CDB) �� ���� ���� Pluggalbe DB (PDB) �� ���� �� �ִ�
            -- PDB �� �����ϴ� �������� �⺻ ���ø��� �ش��ϴ� SEED �� ������� �����Ѵ�
            -- ������� : KEY/VALUE, ORDERED KEY/VALUE, DOCUMENT-BASED
                
                
        -- �۾� �ڿ� ���� (Workload Resource Management)
            -- PDB ���� �켱���� �Ҵ� (��/��/��)
            -- PDB ���� ���ҽ� ���� (1/N : �� PDB���� ��ü WORKLOAD �� SHARE �� �� ����)
        -- ���/����
            -- CDB / PDB ������ ������

        -- ��Ÿ������ (DICTIONARY VIEW)
            -- CDB_
                -- ��� �����̳ʿ� �����ϴ� ������Ʈ
            -- DBA_
                -- ���� �����̳ʿ� �����ϴ� ������Ʈ
            -- ALL_
                -- ���� �����̳ʿ� ���� ����ڰ� ���� ������ ������Ʈ
            -- USER_
                -- ���� �����̳ʿ� ���� ����ڰ� ������ ������Ʈ
            

    -- DECODE(���� ��, ����, ��ü ��)
    -- ROWNUM (����Ŭ ���������� �����÷��� ������ ���� : 1���� ����)
        -- ROWID : ���� �� ��ȣ
        -- ROWNUM : ����� ��¶��ι�ȣ
        -- �Ϻθ� ����Ϸ��� ROWNUM ���
    
    -- ������
        -- ����Ŭ 10G ���� ������ ����
        -- ���̺� ���� �� �������� �ʰ� ������ �����뿡 ��
        
        -- ������ ����
        PURGE RECYCLEBIN;
        
        -- ������ ����
        SHOW RECYCLEBIN;
        
        -- ���� ���
        FLASHBACK TABLE TABLE_NAME TO BEFORE DROP;
        
        -- ���� �� �����뿡 �� �ֱ�
        DROP TABLE TABLE_NAME PURGE;

-- Ʈ����� (Transaction)
    -- ������ SQL ���� �����ϴ� ���� (EX. ���� ���� ��ü) �� ��ְ� �߻����� �� ��ֿ� ������ �� �ֵ��� �ϴ� ���
    -- ��ü ���� (COMMIT) �� ��ü ��� (ROLLBACK) �� ������ ������� ������ ��
    -- SAVEPOINT ��ɾ���� ROLLBACK �� �� ����
    -- AUTOCOMMIT �� �Ǵ� ���
        -- DDL / DCL ��ɹ�
        -- ����Ŭ�� �������ᰡ �� ���

    -- ACID Ư��
        -- Atomatic (���ڼ�)
            -- ��ü������ ������ �Ǵ���, �ȵǴ��� �ؾ� �� (All or Nothing)
        -- Consistency (�ϰ���)
            -- Ʈ����� ���Ŀ� �����Ͱ� �ջ��� ������ �ȵ�
            -- ���� �����Ͱ� �ٸ� ���� ������ �ȵ�
        -- Isolation (���� / �ݸ�����)
            -- ���� ���� Ʈ������� ����� �� ���ɰ� ������ ������ ���� TRADE-OFF
        -- Durability (���Ӽ�)
            -- Ʈ������� ����� ���Ŀ��� �����Ϳ� ������ ����� �� (��ð�)

    -- SAVEPOINT
    CREATE TABLE BC(NAME VARCHAR2(255));
    INSERT INTO BC VALUES("BOB");
    SAVEPOINT C1;
    DELETE FROM BC; -- ���ڵ� ����
    ROLLBACK TO C1; -- DDL 

    -- LOCAL TRANSACTION (���� Ʈ�����)
        -- ������ �ý��� �ȿ����� Ʈ�����
        -- DBMS �� �����ϴ� ��찡 ����
        -- A������ 1�� ���¿��� A������ 2�� ���·� �����ϴ� ���
        -- �����ϴ� ������ DBMS ������ ROLLBACK �� �� ����
        
    -- GLOBAL TRANSACTION (�۷ι� Ʈ�����)
        -- �л� Ʈ�����
        -- ���� �ٸ� �ý��ۿ����� Ʈ�����
        -- DBMS �ܺ��� �̵���� / WAS �� ����
        -- A������ 1�� ���¿��� B������ 2�� ���·� �����ϴ� ���
        -- �����ϴ� ������ WAS�� �̵��� �������� ��

-- LOCK
    -- �����ڿ� (���ҽ�) �� ���� ���� ���� Ʈ������� �����Ϸ��� �����Ϸ��� �� �� �����ϴ� ���
        -- ���ü� ���� (Concurrency Control) ��� �ϰ� ���� Lock ���� �ذ�
        -- ���α׷��ֿ����� ����ȭ (Synchronization)
    -- �ϰ��� (Consistency) �� ���Ἲ (Integrity) �� ��Ű�� ���� ����
    
    -- Lock Granularity
        -- �۷ι� �� (Global Lock)
            -- Ư�� Ʈ������� ����Ǹ� �ٸ� Ʈ������� ��� �����ϴ� ���
            -- �����ͺ��̽� ������ ���, 
                -- �Ϲ� ��� : ���񽺰� ������ ���¿��� ���
                -- ��� ��� : ���񽺰� �����ϴ� ���¿��� ��� (�ݸ��� ���� �߻� - ��� �� ������Ʈ�� �Ǹ� ��� ���¸� ����ؾ� �ұ�?)
                    -- Read Uncommited : Ʈ������� ������� ���� ������ ��� �����͸� �о (Ʈ������� ����Ǹ� ������ ���� ����� �� ���� = ���簪�� �ϴ� ���������� �������� ����� �� ����) (EX. ���� ��ǥ�� ������ ���� ��ǥ��Ȳ)
                    -- Read Commited : Ʈ������� ����� ������ �����͸��� ���� = ���� Ʈ������� ����Ǹ鼭 �����͸� ������ �� �ٸ� Ʈ����ǿ����� �۾��� ����� �����͸��� ���� (= Ʈ������� ������ ������ ���� �� �����ų �� �������� �޶��� �� ����)
                    -- Repeatable Read : ����� ���۵Ǵ� ���� ���� ������Ʈ ������ ������ (= Ʈ������� ����Ǵ� ���߿� ������ �ݺ������ϴ��� ������� ��� �����ؾ� ��)
                    -- Serializable : ������ ���� ������ ����� ��찡 �ƿ� �߻����� �ʰ� �� Ʈ����ǳ��� ��ġ�� ���� (���� ����)

        -- ���̺� ���� �� (Table Lock)
            -- ������ ���̺��� �ٸ� Ʈ������� ����ϰ� �ִٸ� ���� ����
            
        -- �ٴ��� �� (Row Lock)
            -- ������ �� (Row) �� ���� ����
    


-- PL/SQL
    -- Oracle's Procedure Language Extension to SQL
    -- ������ ���������� SQL ������ ������������ ������ ����
    -- ���� ����, ���ǹ�, �ݺ��� ���� ����
    -- ������, ��ü ������ ����
    -- DECLARE �� ����ؼ� ����
    
    -- ����
        -- ANONYMOUS
            DECLARE
            BEGIN
            EXCEPTION
            END
            
        -- PROCEDURE (���ϰ� ����)
            PROCEDURE PROCEDURE_NAME IS
            BEGIN
            EXCEPTION
            END
        
        -- FUNCTION (���ϰ� ����)
            FUNCTION FUNCTION_NAME RETURN DATATYPE IS
            BEGIN
                RETURN VALUE;
            EXCEPTION
            END


-- ���� ���ν��� (STORED PROCEDURE)
    -- SQL�� �Լ� ���·� �����ϰ� ����ϴ� ��� (Static SQL)
    -- �̹� �����ϵǾ� �־ ������ ����
    -- SQL ���������͸� ��ġ�� �ʰ� �̸� �������ϴ� (PRE-COMPILE) �ϴ� ������� DBMS�� ����
    -- ������ ������ ������ �������ν����� ���ڸ� �ٸ��� ��� ����Ǵ� ��Ȳ���� ȿ���� ����
    -- Static SQL �� �Ϲ����� Dynamic SQL ���� ������ ����
    
    -- ���� ���ν��� ����
    CREATE PROCEDURE PROCEDURE_NAME(PARAMTER PARAMTER_TYPE, ...)
    BEGIN
        -- SQL �����
    END
    
    -- ���� ���ν��� ȣ��
    EXECUTE PROCEDURE_NAME;
    
    -- ���� ���ν��� ����
    DROP PROCEDURE PROCEDURE_NAME;    

    -- [����] EMP ���̺��� SAL ���� 10% �λ��ϴ� ���� ���ν���
    CREATE OR REPLACE PROCEDURE INCREASE_SAL (EMPNO_IN IN NUMBER) IS
    BEGIN
        UPDATE EMP
           SET SAL = SAL * 1.1
         WHERE EMPNO = EMPNO_IN;
        COMMIT;
    END INCREASE_SAL; -- END �ڿ� ���ν��� �̸��� ���� ����
    
    EXECUTE INCREASE_SAL(7369);


-- �Լ� (FUNCTION)
    -- [����] EMP ���̺��� ���ڵ� ������ �����ϴ� �Լ�
    CREATE OR REPLACE FUNCTION COUNT_RECORD (V_SAMPLE IN NUMBER) RETURN NUMBER IS
    V_COUNT NUMBER; -- ���� ���� ����
    BEGIN
        SELECT COUNT(*)
          INTO V_COUNT
          FROM EMP;
        RETURN V_COUNT;
    END COUNT_RECORD;
    /
    
    VAR SAMPLE NUMBER;
    EXECUTE :SAMPLE := COUNT_RECORD(1);
    PRINT SAMPLE;
    

-- Ʈ���� (TRIGGER)    -- Ư���� ������ �Ǹ� �ڵ����� ȣ��Ǵ� ���� ���ν��� (EX. ���ڵ尡 �����Ǹ� �ڵ����� �������Ἲ�� üũ�ϴ� Ʈ����)
    -- Ʈ���� ����
    CREATE TRIGGER TRIGGER_NAME BEFORE (�Ǵ� AFTER) CRUD ON TABLE_NAME
    (FOR EACH ROW)
    BEGIN
        ���� �� (OLD.Į����) �Ǵ� ���� �� (NEW.Į����) �� �̿��� ó��
    END
    
    -- Ʈ���� ����
    DROP TRIGGER TRIGGER_NAME;
    
    -- [����] EMP ���̺��� ���ڵ尡 �߰��� ������ ������ �޼����� ����Ͻÿ�
    CREATE OR REPLACE TRIGGER INSERT_TRIGGER
    BEFORE INSERT ON EMP
    FOR EACH ROW
    
    DECLARE
    BEGIN
        DBMS_OUTPUT.PUT_LINE('HELLO');
    END;
    /
    
    SET SERVEROUTPUT ON;
    INSERT INTO EMP (EMPNO, ENAME, SAL)
             VALUES (1000, 'HA', 1000);


-- ���� �����ͺ��̽� ������
    -- �����ʹ� ��� �þ : �� ���� DBMS �����δ� ó���ɷ��� �Ѱ�
    -- 1. ���� ���׷��̵�
        -- HDD -> SSD -> �� �޸� �ӽ� (IN-MEMORY-MACHINE)
    
    -- 2. ���� (SHARDING)
        -- DBMS ������ ���� (DB/���̺�)
        -- ���� (WRITE) ���� ��� [Write Scalability ���]
        -- �ߺ���� : Denormalize = Location �� ����Ǳ� ������ Join �� ������� = ���� �ٸ� DBMS �����̱� ���� = �ߺ��� ��ġ ������ �����ϴ� ���
        -- ���ӿ��� ���带 �����ؼ� ��ϴ� ��İ� ���� (�� ���帶�� �ϳ��� DB)MMV
        
    -- 3. ���� (REPLICATION)
        -- ������ DBMS �� ���� �� ���� (MASTER/SLAVE)
        -- �б� ���� ��� [Read Scalability ���]
        -- DB#1(M) : CUD / DB#2(S) : R
        -- ���� ����Ʈ���� ���� �����
        
    -- ������ �� (Scale-Up)
        -- ���� ���ϴ� ���׷��̵带 ����
        -- CPU Ŭ�� �ӵ� ����, �ھ� �� ����, �޸� ����
        -- ���� ���������� ���� ���� ������ �� ���� (���δ�)
        -- ���� ��ǻ��(Parallel Computing) / ���� ��Ʈ��ũ
        -- Tiglely-Coupled System
        
    -- ������ �ƿ� (Scale-Out)
        -- ������ ����/DBMS �� ���ķ� ����
        -- �л� ��ǻ�� (Distributed Computing)
        -- Loosely Coupled System - ��������� ����
        -- ��� ���� �߰��Ͽ� ��� ���� ��� ���� (ȿ���� ��������� ������)
        
  -- NoSQL
    -- Not Only SQL
    -- �Ϲ� RDBMS (B-TREE : INDEX �˻�) �� �ַ� �б�/�˻� ���ɿ� ����ȭ
    -- ���� ������ �߿��� ������ ��� ���� ������ ���̴� ��찡 ����
        -- �α׸� ����ϴ� �ý��۵��� �б⺸�� ���Ⱑ �� �߿��� (�Ϲ����� RDBMS ������ �ε����� �����ϴ� �͹ۿ� ������, NoSQL �� ��������ν� ���Ⱑ �� ����)
        -- �α� �ӽ�, SNS �޽��� (���, īī���� ��)
    -- ���� RDBMS �� ������ ��ü�ϴ� ���̶�� ���ܴ� �������� ����
    -- Ư�� ����� ���ϴ� ���� �ƴ϶� �Ϸ��� ��ǰ���� ����Ŵ
    -- ��ǰ��
        -- MongoDB, Apache Cassandra, Apache HBASE, Redis ��

    -- CAP �̷�
        -- C (Consistency : �ϰ���)
            -- � ��带 �����ϴ��� ������ ���� �����ؾ� ��
        -- A (Availability : ���뼺)
            -- ��� �Ϻΰ� FAIL �Ǵ��� ���񽺰� �ߴ��� �ȵǾ�� ��
            -- ���̹��� �� ���� ���� �� �� ���� ������ �״��� ���񽺴� ������ �ȵ�
        -- P (Partition Tolerance : ��Ƽ�� ����)
            -- ��� �� ��ſ� ��ְ� ���ܵ� ������ ����� ��

    -- CAP �̷��� �̿��� NoSQL �ý��� �з�
        -- � �ý��۵� 3���� ��θ� ������ų �� ����
            -- CA : �Ϲ� RDBMS
            -- CP : Hbase, MongoDB, Redis
            -- AP : Cassandra
    
    -- ���� ���¿� ���� �з�
        -- KEY/VALUE
            -- Ű ���� �ָ� ����� �����ϴ� ����
            -- JSON �� ������ ����, Redis
        
        -- ORDERED KEY/VALUE
            -- Ű ������ ���ĵǴ� ����
            -- Hadoop, Cassandra, HBase
        
        -- DOCUMENT BASED
            -- ���� ���� JSON/XML ������ ����
            -- MongoDB
            
    -- ��Ű������ (Schemaless)
        -- ��Ű�� (DDL) ����� �ƴ϶� �ʿ��ϸ� ���ο� �÷� (Ű) �� �߰��ϸ� ��
        -- ��ü������ ������ ������ �ƴ� �� ����
        
        -- RDMBS : ������ ������ (EX. INSERT �� �� EMAIL Į���� �ش�Ǵ� ���� ������ NULL)
        -- NoSQL : �������� ������ (Semi) (EX. INSERT �� �� EMAIL Į���� �ش�Ǵ� ���� ��� ���� = �����Ͱ� �ʿ��� ��� ��Ű���� ��� ��� ������)
        -- �˻����� : �������� ������ (Plain Text) (EX. ��Ű�� �� ������ ����)
        
        