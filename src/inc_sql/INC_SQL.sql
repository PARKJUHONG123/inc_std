/*
- SQL : 인터프리터 (Structure Query Language)
- DML : Data Manipulation Language
    - 테이블의 데이터를 조작하는 기능 (CRUD : Create, Retrieve, Update, Delete)
    - INSERT, DELETE, UPDATE, SELECT, MERGE (두 개의 데이터베이스 객체를 합침)
    - 명시적으로 COMMIT 을 실행해줘야 DB에 반영

- DDL : Data Definition Language
    - DB 테이블의 스키마를 정의, 수정하는 기능 (테이블 자체를 수정 / 변경)
    - 테이블 생성, 컬럼 추가, 타입 변경, 각종 제약조건 지정, 수정 등
    - CREATE, ALTER, DROP, TRUNCATE, RENAME
    - 바로 COMMIT 되어 DB에 반영됨

- TCL : Transactional Control Language
    - 트랜젝션 제어에 관련된 기능
    - COMMIT (트랜젝션이 문제없이 수행되면 내용을 반영함), ROLLBACK (트랜젝션 수행 중에 문제가 발생하면 취소), SAVEPOINT (롤백 시 특정한 시점까지만 수행을 롤백)
    - 커밋이나 롤백은 줄 단위로 수행되지 않고, 한번 수행하면 커밋되지 않은 정보 모두를 DB에 반영함
    - 롤백도 마지막 커밋한 지점까지 모두 취소됨
    
- DCL : Data Control Language
    - DB나 테이블의 접근권한이나 CRUD 권한을 정의하는 기능
    - 특정 사용자에게 테이블의 조회 권한 허가 / 금지 등
    - GRANT (DB 객체에 권한을 부여), REVOKE (이미 부여된 DB 객체 권한 취소)
*/


-- 테이블 리스트 출력
SELECT *
  FROM TABS;

-- 특정 테이블의 스키마 출력
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

-- 중복값 제외 출력
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
 
-- ORDER BY (결과 정렬)
SELECT *
  FROM TEST_TABLE_2
 ORDER BY AGE ASC
;
 
SELECT *
  FROM TEST_TABLE_2
 ORDER BY AGE DESC
;

-- AGGREGATION FUNCTION (집합 함수)
-- 테이블의 전체 레코드를 대상으로 특정 칼럼을 적용해서 한 개의 값을 리턴하는 함수
-- COUNT(), AVG(), SUM(), MIN(), MAX(), FIRST(), LAST() 등
SELECT COUNT(*)
  FROM TEST_TABLE_2
 WHERE AGE = '10'
;

SELECT SUM(AGE)
  FROM TEST_TABLE_2
;

-- LENGTH() : 레코드의 문자열 칼럼의 글자수를 리턴
SELECT NAME, LENGTH(NAME)
  FROM TEST_TABLE_2
;

-- SUBSTR(COLUMN, START_INDEX, LENGTH) : 문자열의 중간부분을 리턴
SELECT JOB, SUBSTR(JOB, 2, 1) 
  FROM TEST_TABLE_2
;

-- UPPER()/LOWER() : 문자열을 대문자/소문자로 리턴
SELECT JOB, UPPER(JOB)
  FROM TEST_TABLE_2
;

-- ROUND() : 레코드의 숫자 칼럼값을 반올림해서 리턴
SELECT AGE, ROUND(AGE / 7)
  FROM TEST_TABLE_2
;

-- JOIN
-- 서로 다른 테이블을 공통 칼럼을 기준으로 합치는 (결합하는) 테이블 단위 연산
-- 조인의 결과 테이블은 이전 테이블의 칼럼 수의 합과 같음

-- 표준 JOIN
    SELECT COUNT(*)
      FROM TEST_TABLE_1 JOIN TEST_TABLE_2
        ON TEST_TABLE_1.NAME = TEST_TABLE_2.NAME
    ;

    -- 조인 시 NULL 값을 허용하는 내부조인 (불가) 과 외부조인 (허용) 으로 구분
    -- INNER JOIN
    -- 조인 시 NULL 값을 허용하지 않음
    -- NULL 값을 가진 레코드는 JOIN 결과에서 빠짐
    SELECT COUNT(*)
      FROM TEST_TABLE_1 INNER JOIN TEST_TABLE_2
        ON TEST_TABLE_1.NAME = TEST_TABLE_2.NAME
    ;

    -- LEFT JOIN
    -- 조인 시 JOIN 의 왼쪽 테이블의 NULL 값을 포함해서 표시
    SELECT COUNT(*)
      FROM TEST_TABLE_1 LEFT JOIN TEST_TABLE_2
        ON TEST_TABLE_1.NAME = TEST_TABLE_2.NAME
    ;

    -- RIGHT JOIN
    -- 조인 시 JOIN 의 오른쪽 테이블의 NULL 값을 포함해서 표시
    SELECT COUNT(*)
      FROM TEST_TABLE_1 RIGHT JOIN TEST_TABLE_2
        ON TEST_TABLE_1.NAME = TEST_TABLE_2.NAME
    ;

    -- FULL JOIN
    -- LEFT JOIN 과 RIGHT JOIN 의 합집합 (UNION)
    SELECT COUNT(*)
      FROM TEST_TABLE_1 JOIN TEST_TABLE_2
        ON TEST_TABLE_1.NAME = TEST_TABLE_2.NAME
    ;



-- ORACLE JOIN
    -- CROSS JOIN
    -- 조인 조건이 없는 경우나, 조건이 유효하지 않으면 사용함 (모든 경우의 수 조합)
    SELECT *
      FROM TEST_TABLE_1, TEST_TABLE_2
    ;    
    
    -- EQUI (nature) JOIN
    -- 표준 JOIN 과 유사함
    -- NATURE JOIN 의 경우는 명시하지 않아도 ORACLE 이 칼럼 이름으로 JOIN 조건 설정
    -- 대상 테이블에 공통으로 존재하는 칼럼을 대상으로 조인
    SELECT *
      FROM TEST_TABLE_1, TEST_TABLE_2
     WHERE TEST_TABLE_1.NAME = TEST_TABLE_2.NAME
    ;
    
    SELECT *
      FROM TEST_TABLE_1 NATURAL JOIN TEST_TABLE_2
    ;
    
    SELECT *
      FROM TEST_TABLE_1 JOIN TEST_TABLE_2 USING(NAME) -- 공통되는 칼럼이 많을 경우, A 의 DEPT_NO, EMP_NO 과 B의 DEPT_NO, EMP_NO 이 있을 때, 지정해서 JOIN 하는 방법
    ;
    
    
    -- NON-EQUI JOIN
    -- EQUI JOIN 에 해당되지 않는 경우 (공통 칼럼이 아닌 것으로 JOIN)    
    SELECT *
     FROM TEST_TABLE_1, TEST_TABLE_2
    WHERE TEST_TABLE_1.AGE BETWEEN 1 AND 10
    ;
    
    -- OUTER JOIN
    -- 누락되는 칼럼이 존재하는 경우에도 출력
    -- 누락되기 원하지 않는 칼럼에 (+) 붙임
    SELECT *
      FROM TEST_TABLE_1, TEST_TABLE_2
     WHERE TEST_TABLE_1.NAME (+) = TEST_TABLE_2.NAME
    ;    
    
    -- SELF JOIN
    -- 자체 테이블과의 조인
    -- 학생-조교의 관계를 파악하는 경우 등에서 사용
    SELECT *
      FROM TEST_TABLE_2 A, TEST_TABLE_2 B
     WHERE A.NAME = B.MENTOR -- 학생이 있고, 해당 학생의 조교학생을 알아내기 위한 방법
   ;
   
 -- ALIAS
    -- SQL 쿼리 결과 생성 시 칼럼명에 대한 별명을 사용해서 표시하는 기능
    -- JOIN 할 때 많이 사용됨
    -- 별명 사용 (간략화해서 쿼리에서 사용할 수 있게 함)
    SELECT EMP.NAME AS NAME, DEPT.DNAME AS DEPARTMENT, DEPT.LOCATION AS LOCATION
      FROM EMP JOIN DEPT USING(DEPTNO)
    
    
 -- VIEW
    -- 임시 테이블의 한 종류
    -- 쿼리의 결과를 임시 테이블에 저장
    -- Simple View : 하나의 테이블에서 생성
    -- Complex View : 여러 개의 테이블에서 정보를 빼와서 생성
    
    -- User 에게 View 생성권한을 줘야 함    
    GRANT CREATE VIEW TO scott;
    
    CREATE OR REPLACE VIEW EMP_HIGH_WAGE
    AS SELECT *
         FROM EMP
        WHERE SAL >= 3000;
    
 -- CREATE TABLE SELECT
    -- 쿼리의 결과를 가지고 새로운 테이블을 생성하는 것
    -- VIEW 를 만드는 것과 유사하지만 VIEW 는 임시 테이블
    CREATE TABLE EMP_SALESMAN
               AS SELECT *
                  FROM EMP
                  WHERE JOB = 'SALESMAN'
    ;    
 
 -- INSERT INTO SELECT
    -- 쿼리의 결과를 이미 존재하는 테이블에 넣어줌
    -- 만약 존재하지 않으면 먼저 테이블을 생성해줘야 함
    
    INSERT INTO EMP_SALESMAN
           AS SELECT *
              FROM EMP
              WHERE JOB = 'SALESMAN'
    ;    

-- CASE ... WHEN ... END
    -- 조건절
    -- EMP 테이블에서 직원명, ABBR_JOB 을 최대 3자로 앞쪽 세 자를 소문자로 출력하고, JOB 을 같이 표시하시오    
    SELECT EMP.ENAME, CASE
                            WHEN LENGTH(EMP.JOB) > 3 THEN LOWER(SUBSTR(EMP.JOB, 1, 3))
                            WHEN LENGTH(EMP.JOB) <= 3 THEN LOWER(EMP.JOB)
                            ELSE NULL
                       END AS ABBR_JOB, EMP.JOB
    FROM EMP
    ;

-- LIKE 검색
    -- 와일드카드 (% : 0~N 글자, _ : 1글자)
    -- LIKE 검색은 매칭하기 위해 DBMS 에 부담이 많으므로 LIKE 에 OR 과 같은 논리조건자를 중복해서 사용하지 않는 게 좋음
    SELECT *
      FROM EMP
     WHERE ENAME LIKE '%S%' -- S 를 포함하고 있는 이름을 가진 사원들
   ;
   
   SELECT *
     FROM EMP
    WHERE ENAME LIKE 'A___'  -- ABCD, ALEN
   ;


-- NULL
    -- NULL = 해당 칼럼의 값이 없음을 의미
    -- NULL 값을 가지고 있는 칼럼을 검색하려면 IS NULL
    -- NULL 이 아닌 값을 가지고 있는 칼럼을 검색하려면 IS NOT NULL

    SELECT *
      FROM EMP
     WHERE MGR IS NULL
   ;
     
   SELECT *
     FROM EMP
    WHERE COMM IS NOT NULL
   ;


-- NULL 함수
    -- 숫자칼럼을 연산할 때 NULL 을 처리해주는 함수
    -- 숫자연산/집합함수의 경우는 처리가 내장되어 있음
    -- 직접 함수나 쿼리에 넣는 경우는 NULL 함수를 사용해야 함

    SELECT ENAME, NVL(COMM * 1.5, 0) -- 값이 없으면 0을 표시
      FROM EMP
    ;
    
    SELECT ENAME, NVL2(COMM * 1.5, 'Y', 'N') -- 값이 존재하면 Y 없으면 N 표시
      FROM EMP
    ;
    
    SELECT ENAME, COALESCE(COMM, COMM, 1) -- 값이 있으면 표시하고, 없으면 1 표시
      FROM EMP
    ;
    
    
 -- GROUP BY
    -- SELECT 칼럼명, 집합함수명 (칼럼) FROM 테이블명 GROUP BY 칼럼명;
    SELECT DEPT.DNAME, COUNT(DEPT.DNAME) AS NUMBER_COUNT    -- EMP 테이블의 부서별 직원수
      FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
  GROUP BY DEPT.DNAME
  ;
  
 -- HAVING
    -- 집합 연산에 WHERE 조건절 대체로 사용
    SELECT DEPT.DNAME, COUNT(DEPT.DNAME) AS NUMBER_COUNT    -- EMP 테이블의 직원 수가 5명 이상인 부서의 부서별 직원수 출력
      FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
  GROUP BY DEPT.DNAME
    HAVING COUNT(DEPT.DNAME) >= 5
  ;
  
  
  -- SUBQUERY
    -- 쿼리문 내에 또 다른 쿼리문이 있는 형태
    -- 서브쿼리는 메인 쿼리에 포함되는 관계
        -- () 를 사용해 감싸는 형태
        -- ORDER BY 를 사용하지 못함
        
    -- 사용 가능한 위치
        -- SELECT, FROM, WHERE, HAVING, ORDER BY, VALUES (INSERT), SET (UPDATE)
    -- 종류
        -- 단일행 (Single Row)
        -- 다중행 (Multi Row)
        -- 다중 컬럼 (Multi Column)
        
 -- 단일행 서브쿼리
    -- 결과가 레코드 하나인 서브쿼리
    -- 일반 연산자 (=, >, < 등) 사용
    
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
    
 -- 다중행 서브쿼리
    -- 결과가 레코드 여러 개인 서브쿼리
    -- 다중행 연산자 (IN, ALL, ANY, EXISTS) 사용
    
    -- ALL
        -- 여러 개의 레코드의 AND 효과 (가장 큰 값보다 큰)
        -- SAL > ALL (SELECT SAL ...)
        SELECT ENAME, SAL
          FROM EMP
         WHERE SAL > ALL( SELECT SAL
                            FROM EMP
                           WHERE DEPTNO = 20 )
        ; -- 부서번호가 20인 부서의 모든 직원보다 연봉이 더 많은 직원의 ENAME 과 SAL 을 표시
        
        
    -- ANY
        -- 여러 개의 레코드의 OR 효과 (가장 작은 값보다 큰)
        -- SAL > ANY (SELECT SAL ...)
        SELECT ENAME, SAL
          FROM EMP
         WHERE SAL > ANY( SELECT SAL
                            FROM EMP
                           WHERE DEPTNO = 20 )
        ; -- 부서번호가 20인 부서의 직원 중 최저 연봉의 직원보다 연봉이 더 많은 직원의 ENAME 과 SAL 을 표시
        
        
    -- IN
        -- 결과값 중에 있는 것 중에서의 의미, 일종의 서브셋
        SELECT DEPTNO, COUNT(DEPTNO)
          FROM EMP
         WHERE DEPTNO IN ( SELECT DEPTNO
                             FROM DEPT
                            WHERE DNAME IN ('ACCOUNTING', 'RESEARCH') )
        GROUP BY DEPTNO
        ; -- 부서명이 'ACCOUNTING', 'RESEARCH' 인 부서의 부서번호 별 직원 번호를 표시
      

 -- 멀티칼럼 서브쿼리
    -- 결과가 칼럼 여러 개인 서브쿼리
        SELECT ENAME, JOB, DEPTNO
          FROM EMP
         WHERE (ENAME, JOB, DEPTNO) IN ( SELECT ENAME, JOB, DEPTNO
                                           FROM EMP
                                          WHERE SAL > 3000 )
        ; -- 급여가 3000이 넘어가는 직원명과 JOB, 부서번호를 표시

-- 집합연산
    -- UNION, INTERSECT, MINUS 등
    -- UNION
        -- 두 쿼리의 결과값을 합쳐서 리턴
        -- 두 쿼리의 결과 형식이 동일해야 함 (기본적으로 DISTINCT 적용)
        -- 다른 테이블이라도 결과값의 형식만 일치하면 됨
        
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'CLERK'
        
        UNION
        
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'SALESMAN'
        ; -- EMP 테이블에서 JOB이 'CLERK' 와 'SALESMAN' 인 직원의 부서번호를 표시하시오

    -- UNION ALL
        -- 중복을 허용하는 UNION
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'CLERK'
         
        UNION
        
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'SALESMAN'
        ;

    -- INTERSECT
        -- 두 쿼리의 결과값 중 공통값을 찾아서 리턴
        -- 두 쿼리의 결과 형식이 동일해야 함 (기본적으로 DISTINCT 적용)
        -- 다른 테이블이라도 결과값의 형식만 일치하면 됨
        
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'CLERK'
         
        INTERSECT
        
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'SALESMAN'
        ;
 
    -- MINUS / EXCEPT
        -- 쿼리1의 결과값에서 쿼리2의 결과값을 빼서 리턴함
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'CLERK'
         
        MINUS
        
        SELECT DEPTNO
          FROM EMP
         WHERE JOB = 'SALESMAN'
        ;
     
-- 자료형
    -- NUMBER(a, b)
        -- 숫자를 다루는데 사용하는 데이터 타입
        -- number(10, 2) : 소수점 기준으로 10자리, 소수점 이하 2자리
        -- 다른 시스템/언어와의 호환성을 위해 int/float 허용
    -- 문자열
        -- CHAR(size) : 고정길이 문자열 (ex. CHAR(10) 에 'SIMPLE' 을 넣게 되면 'SIMPLE    ' 형태로 저장되기 때문에 TRIM() 을 사용해서 빈칸을 삭제해야 함)
        -- VARCHAR2(size) : 가변길이 문자열
    -- Long
        -- 2GB 이내의 문자열을 처리하는 데이터
    -- Date
        -- 날짜와 관련한 데이터를 저장하는 데이터 타입
    -- CLOB (Character Large Object)
        -- 4GB 이하의 문자열을 저장하는 데이터 타입
    -- BLOB (Binary Large Object)
        -- 4GB 이하의 바이너리 데이터를 저장하는 데이터 타입

-- 제약조건 (CONSTRAINT)
    -- NOT NULL
        -- 데이터가 NULL 값을 받아들이지 않음
    -- UNIQUE
        -- 테이블에 동일한 값이 입력되어 있을 경우 받아들이지 않음
    -- PRIMARY KEY
        -- 기본키 제약조건 (UNIQUE, NOT NULL)
    -- FOREIGN KEY
        -- 외래키 제약조건
    -- CHECK
        -- 입력값 체크 (ex. AGE >= 0)
    -- DEFAULT
        -- 칼럼값이 입력되지 않으면 기본값을 입력
            
-- 스키마
    -- DDL (Data Definition Language)
        -- DB와 테이블을 CRUD
        -- 테이블에 대한 정보는 메타데이터 (Metadata) 로 데이터 사전 (Data Dictionary) 에 저장 / 관리됨
    -- DB 생성
    CREATE DATABASE DB_NAME;
    
    -- 테이블 생성
    CREATE TABLE BUSINESS_CARD (
        ID INT NOT NULL,
        NAME VARCHAR2(255),
        ADDRESS VARCHAR2(255) DEFAULT 'SEOUL', -- 값이 지정되지 않으면 SEOUL 이 입력됨
        TELEPHONE VARCHAR2(255),
        AGE FLOAT(3), -- FLOAT = FLOAT(22) 와 같은 의미 (PRECISION : 1~128)
        PRIMARY KEY(ID),
        CHECK(AGE >= 0) -- AGE 가 0이 넘는 것만 넣을 수 있게 함
    );
    
    CREATE TABLE SALARY (
        ID NUMBER(38) NOT NULL, -- NUMBER(38, 0) 은 DEFAULT 값으로 INT 와 동일함 = NUMBER(38) 과 같은 의미 (PRECISION : 1~38, SCALE : -84~127)
        SALARY_AMOUNT NUMBER, -- NUMBER(38, 0)
        BUSINESS_CARD_ID NUMBER NOT NULL,
        PRIMARY KEY(ID),
        FOREIGN KEY(BUSINESS_CARD_ID) REFERENCES BUSINESS_CARD(ID) -- BUSINESS_CARD 테이블에 ID 가 있는지 확인하고, 있으면 INSERT 할 수 있게 함
    );
    
    INSERT INTO BUSINESS_CARD(ID, NAME, TELEPHONE, AGE)
         VALUES (1, 'SAM', '123-4567', 10)
    ; -- DEFAULT 값이 지정되어 있을 경우 해당 칼럼을 제외하고 넣을 수 있음
    
    
    -- 테이블 정보 출력
    DESC BUSINESS_CARD;

-- SEQUENCE
    -- 자동번호 생성기
        -- 기본키로 사용하기 편하도록 숫자를 정해진 규칙에 의해 생성
        -- 다른 DBMS의 AUTO_INCREMENT 속성에 대응하는 개념
        -- CREATE SEQUENCE SEQUENCE_NAME
        -- START WITH N
        -- INCREMENT BY N
    
    -- 시퀀스 조회 함수
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
    ; -- SEQUENCE 생성
    
    SELECT BUSINESS_CARD_SEQ.NEXTVAL
      FROM DUAL
    ; -- 1 어떤 세션에서 NEXTVAL 을 하지 않은 채 CURRVAL 을 요구하게 되면 에러 발생함. CURRVAL 은 바로 그 세션이 지금 현재 가지고 있는 최종 시퀸스 값을 의미하므로 한번도 NEXTVAL 을 요구한 적이 없다면 보유하고 있는 CURRVAL 값이 없기 때문

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
      
-- 중복정보 수정
    -- 테이블 간의 정보는 중복되지 않아야 함
        -- 동일한 정보가 여러 테이블에 저장되어 있으면 수정에 대한 부담과 무결성 유지가 쉽지 않음
    -- 이를 위해 정규화를 통해 중복성 제거
        -- 제 1 정규형, 제 2 정규형, 제 3 정규형
    -- 중복성 제거 후 필요한 정보는 외래키 (Foreign Key) 를 통한 조인을 통해 필요한 정보를 구함 [RDBMS]

-- 정규형 [중복을 제거하기 위한 테이블 정의 규칙]
    -- 제 1 정규형 : 나눌 수 있을 만큼 쪼개라
    /*
        (기존)
        고객 [#고객번호, 고객명, 계약일] 만 있는 테이블에서 고객이 여러 번의 예약을 할 수 없음
        
        (1NF)
        고객 [#고객번호, 고객명] - (주체가 되어) 1 : N (계약하여) - 계약 [#계약일, 장소, 결과]
    */
    
    
    -- 제 2 정규형 : 테이블의 컬럼들이 PRIMARY KEY와 직접 연관되는 컬럼만으로 구성해라
    /*
        학과등록 [#학번, #코스코드, 평가코드, 평가내역, 코스명, 기간]
        - UID (고유 식별자) 의 학번이 평가코드, 평가내역과 연관
        - UID 의 코스코드가 코스명, 기간과 연관      
        
        코스 [#코스코드, 코스명, 기간] - (등록받아) 1 : N (등록하여) - 학과등록 [#학번, 평가코드, 평가내역]
    
    */
    
    -- 제 3 정규형 : 컬럼들 간의 종속관계가 있으면 안 됨
    /*
        코스 [#코스코드, 코스명, 기간] - (등록받아) 1 : N (등록하여) - 학과등록 [#학번, 평가코드, 평가내역]
        - UID (고유 식별자 = 학번) 가 평가코드에 직접 종속되고, 평가내역에 간접 종속됨
        - UID (고유 식별자 = 학번) 가 평가내역에 간접 종속됨
        
        코스 [#코스코드, 코스명, 기간] - (등록받아) 1 : N (등록하여) - 학과등록 [#학번] - (평가받아) N : 1 (지정되어) - 평가항목 [#평가코드, 평가내역]
        
    */


-- 참조무결성 (Referential Integrity)
    -- 외래키 (FK) 에 적용되는 규칙
    -- 외래키와 참조되는 원래 테이블의 키와 관계를 명시
    -- 외래키를 참조하면 원래 테이블에 해당 레코드 값이 반드시 존재해야 함
    -- 만약 원래 레코드를 삭제하려면 참조하는 외래키 (FK) 값을 먼저 NULL 로 만들어야 함
    -- 외래키 참조관계가 있을 경우, 레코드 추가/삭제 시 선후관계를 나타냄


-- 스키마 수정
    -- 이미 생성된 스키마에 대해 수정할 경우 사용
    -- 테이블 칼럼 추가 / 삭제 / 수정

    -- 테이블 칼럼 추가
    ALTER TABLE BUSINESS_CARD
           ADD (ID INT)
           DROP COLUMN ID
    ;

    -- 칼럼 타입 변경
    ALTER TABLE BUSINESS_CARD
         MODIFY ADDRESS CHAR(255)
    ;

    -- 칼럼명 변경
    ALTER TABLE BUSINESS_CARD
         RENAME ADDRESS
             TO ADDRESS_CHG
    ;


    -- ID 칼럼 PK 설정
    ALTER TABLE BUSINESS_CARD
           ADD PRIMARY KEY(ID)
          DROP PRIMARY KEY
    ;

    -- UNIQUE 제약조건 추가/삭제
    ALTER TABLE BUSINESS_CARD
            ADD UNIQUE (NAME)
            ADD CONSTRAINT UNIQUE_CONSTRAINT_NAME UNIQUE (NAME, ID)
           DROP UNIQUE UNIQUE_CONSTRAINT_NAME
    ;
    

    -- 외래키 제약조건 추가/삭제
    ALTER TABLE BUSINESS_CARD
            ADD FOREIGN KEY (NAME) REFERENCES EMP(ENAME)
            DROP FOREIGN KEY NAME
    ;
    
    -- CHECK 제약조건 추가/삭제
    ALTER TABLE BUSINESS_CARD
            ADD CHECK (AGE > 0)
            ADD CONSTRAINT CHECK_CONSTRAINT_NAME CHECK (AGE > 0)
           DROP CHECK CHECK_CONSTRAINT_NAME
    ;
    
    -- DEFAULT 제약조건 추가/삭제
    ALTER TABLE BUSINESS_CARD
          ALTER NAME SET DEFAULT 'ANONYMOUS'
          ALTER NAME DROP DEFAULT
    ;    
    
    -- ADDRESS_CHG 기본값 설정 ('SEOUL')
    ALTER TABLE BUSINESS_CARD
         MODIFY ADDRESS_CHG DEFAULT('SEOUL')
    ;

    -- 테이블명 변경
    ALTER TABLE BUSINESS_CARD
         RENAME TO BUSINESS_CARD_TABLE 
    ;

-- 스키마 삭제
    -- DB 삭제
    DROP DATABASE INC_STD;
    
    -- 테이블 삭제
        -- 테이블 삭제, 내용과 테이블 전체 삭제
        -- 테이블, 공간, 객체 모두 삭제
        -- 삭제 후 되돌릴 수 없음
        DROP TABLE TABLE_NAME;
    
        -- 레코드를 일일히 하나씩 지움, 테이블 스키마 유지
        -- 데이터는 지워지지만 테이블 용량은 줄어 들지 않음
        -- 특정 데이터만 지울 수 있음
        -- 삭제 후 잘못 삭제한 것을 되돌릴 수 있음
        DELETE *
          FROM TALBE_NAME
        ;
        
        -- 테이블 내용만 지움, 테이블 스키마 유지 (전용 명령어)
        -- 용량이 줄어들고, 인덱스 등도 모두 삭제됨 (한꺼번에 다 지워짐)
        -- 삭제 후 절대 되돌릴 수 없음
        TRUNCATE TABLE TABLE_NAME;

-- 권한 설정
    -- 접근 권한 (Access Control) 설정
        -- DCL (Data Control Language)
            -- 권한 및 역할 설정하는 언어
            -- 특정 테이블에 대한 CRUD 권한 설정
            
            -- CREATE USER, DROP USER, DROP ANY TABLE, BACKUP ANY TABLE, QUERY REWRITE, CREATE SESSION, CREATE TABLE, CREATE VIEW

    /*
    -- 사전 작업
    CONN SYS AS SYSDBA
    CRAETE USER SAMPLE IDENTIFIED BY TEST; -- SAMPLE 사용자 추가 (비밀번호 : TEST)
    CONN USER/TEST
    SHOW USER;    
    SELECT * FROM SCOTT.EMP;
    */

    GRANT CREATE SESSION
       TO SAMPLE
    ;
    
    -- SAMPLE 사용자에게 EMP 테이블 조회권한 부여
    GRANT SELECT ON EMP
       TO SAMPLE
    ;

    GRANT SELECT ON EMP
       TO SAMPLE
       WITH GRANT OPTION -- 사용자가 객체를 접근할 권한을 부여받으면서 그 권한을 다른 사용자에게 부여할 수 있는 권한도 함께 부여받음
    ;


    -- SAMPLE 사용자에게 EMP 테이블 조회권한 삭제
    REVOKE SELECT ON EMP
      FROM SAMPLE
    ;


    -- 권한 조회 (현재 사용자가 다른 사용자에게 부여한 권한 정보)
    SELECT *
      FROM USER_TAB_PRIVS_MADE
    ;
    
    -- 권한 조회 (자신에게 부여된 사용자 권한)
    SELECT *
      FROM USER_TAB_PRIVS_RECD
    ;
    
-- 역할 설정

    -- 개별 테이블에 대한 CRUD 권한을 사용자별로 설정하면 경우의 수가 테이블 수 X 사용자 수의 조합이 생김
    -- 이런 문제점을 개선하기 위해서 롤 (역할) 을 정하고 역할별 권한 설정하고 사용자에게 역할을 부여하는 형태로 사용
    -- 사용자가 여러 개의 롤을 가지는 것이 가능함
    
    -- 역할 생성
    CREATE ROLE ROLE_NAME;
    
    -- 역할에 대해 권한 설정
    GRANT CREATE SESSION, CREATE TABLE TO ROLE_NAME; -- 역할에 권한 부여 (테이블 생성, 접속)
    
    GRANT [CRUD] ON TABLE_NAME TO ROLE_NAME;
    GRANT UPDATE(ENAME) ON SCOTT.EMP TO TEST; -- 예제 1) TEST 역할에 EMP 테이블의 검색, 추가 권한 부여
    GRANT SELECT, INSERT ON SCOTT.EMP TO TEST; -- 예제 2) TEST 역할에 EMP 테이블의 조회, 업데이트 권한 부여
    GRANT ALL ON SCOTT.EMP TO TEST; -- 예제 3) TEST 역할에 EMP 테이블의 모든 권한 부여    
        
    -- 사용자에게 역할 부여
    GRANT ROLE_NAME TO USER_NAME;
    
    -- 역할에 부여된 해당 테이블의 모든 권한 삭제
    REVOKE ALL ON TABLE_NAME FROM ROLE_NAME;


-- INDEX
    -- 검색을 빠르게 하기 위한 자료구조 (주로 B 트리 계열)
        -- 레코드 추가 / 수정 / 삭제 시 해당 칼럼으로 다시 정렬한 후 검색에 필요한 값들을 미리 계산해 검색 속도를 높임 (TRADE OFF)
    -- 기본키는 자동으로 인덱스 설정
    -- 인덱스 ON/OFF 를 통해 검색 속도 차이 체감 (대량의 데이터일수록 큰 영향)
    -- 조인 (JOIN) 시에도 영향을 줌 : 하나의 테이블을 조회한 후에 합치는 경우가 많음


    -- 정렬
        -- 빠른 검색을 위해서는 데이터가 반드시 정렬 (Sorting) 되어 있어야 함
        -- 정렬되어 있지 않다면 평균적으로 전체 데이터의 절반 필요 (BEST : 1, WORST : N, AVE : N/2)
        -- 정렬되어 있을 경우 데이터를 빠른 시간으로 찾을 수 있음
        -- 퀵정렬/힙정렬 계열이 주로 사용됨

    -- 인덱스
        -- 이진검색 (Binary Search)
            -- 최대 log2(N) 번 내에 검색 가능
        -- B-트리 (B-Tree)
            -- 이진 검색과 유사하지만 한 번에 비교를 2번 (a, b : a < b)
                -- 작은 값보다 작은 경우 (x < a)
                -- 큰 값과 작은 값 사이의 경우 (a < x < b)
                -- 큰 값보다 큰 경우 (b < x)
            -- B 트리 계열이 이진검색 계열보다 빠름 O(NlogN) ~ O(N^2)
            -- 데이터가 추가/삭제/변경될 때마다 a, b 값 업데이트


    -- 인덱스 설정
        -- 기본키 (PK), 외래키 (FK) 의 경우에는 인덱스가 자동으로 생성됨
        -- 종류
            -- 고유 (Unique INDEX)
            -- 비고유 (Non-Unique)
            -- 단일
            -- 복합
            -- 함수기반 인덱스

    -- 인덱스 추가/삭제
    CREATE INDEX INDEX_NAME ON TABLE_NAME(COLUMN_NAME);
    CREATE INDEX INDEX_NAME ON TABLE_NAME(COLUMN_NAME1, COLUMN_NAME2, ...);
    CREATE UNIQUE INDEX INDEX_NAME ON TABLE_NAME(COLUMN_NAME);
    ALTER TABLE TABLE_NAME DROP INDEX INDEX_NAME;
    ALTER INDEX INDEX_NAME REBUILD; -- 정지시킨 인덱스를 다시 실행
    
    -- 인덱스 확인
    SELECT INDEX_NAME, INDEX_TYPE, TABLE_NAME -- 인덱스 타입을 알고 싶을 때
      FROM USER_INDEXES
     WHERE TABLE_NAME IN ('EMP', 'DEPT')
    ;
    
    SELECT INDEX_NAME, TABLE_NAME, COLUMN_NAME -- 어느 컬럼에 인덱스가 적용되었는지
      FROM USER_IND_COLUMNS
     WHERE TABLE_NAME IN ('EMP', 'DEPT')
    ;

    -- VISIBILITY INDEX
    SELECT TABLE_NAME, INDEX_NAME, VISIBILITY
      FROM USER_INDEXES
     WHERE TABLE_NAME = 'BUSINESS_CARD'
    ;
    
    -- 성능차이를 확인하려면 INDEX 관련 A/B (ON/OFF) 테스트가 필요함
    -- INDEX 를 삭제하기 전 INVISIBLE 상태로 만들어 미리 확인할 수 있게 함
    -- INDEX 삭제 PREVIEW (실제 INDEX 가 효과가 있는지)
    ALTER INDEX INDEX_NAME INVISIBLE;
    
    
-- 메타데이터 (METHADATA)

-- 케릭터셋 (CHARSET)