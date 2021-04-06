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

-- �ɸ��ͼ� (CHARSET)