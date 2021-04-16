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
    -- 데이터를 위한 데이터
    -- DB, 테이블의 스키마에 대한 정보를 저장하는 테이블
    -- DB명, 테이블명, 칼럼명, 사용자명 등

    -- 종류
        -- 데이터 딕셔너리
            -- 데이터베이스의 정보 저장
            -- 시스템 카탈로그라고 함
            -- 일반적으로 READ-ONLY
            
            -- 예시 (PREFIX 에 따라서 다른 정보)
                -- USER_TABLES
                    -- TABS
                        -- 접속한 사용자가 소유한 테이블의 정보를 저장하는 데이터 딕셔너리
                    -- COLS
                        -- 접속한 사용자가 소유한 테이블들의 칼럼 정보들을 저장하는 데이터 딕셔너리
                -- ALL_TABLES
                -- DBA_TABLES
                -- CBA_TABLES (컨테이너 관련 딕셔너리 : 오라클 12C에 추가됨)


        -- 데이터 디렉토리
            -- DBMS의 모든 데이터가 저장되는 디렉토리
            -- DB저장, 상태 및 로그 저장
    
-- 케릭터셋 (CHARSET)
    -- 문자인코딩 정보
    -- 메타데이터의 일종
    -- 문자열(VARCHAR, CHAR) 의 값을 저장할 때 사용되는 기본정보
    -- DB/테이블별로 별도 설정 가능
    
    -- 종류
        -- ASCII/ISO-8859-1 (아스키 계열)
        -- EUC-KR/KSC_5601 (한글 완성형 계열)
        -- UTF8/UNICODE (유니코드 계열)
        -- UTF8 (오라클 기본) (1BYTE ~ 4BYTE) (한글은 3BYTE)
        SELECT * FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER = 'NLS_CHARACTERSET';
    
    -- ASCII
        -- 한 자에 한 바이트 할당
        -- DBCS (Double Byte Character Set) : 한글 완성형은 영문자/숫자 : 1Byte , 한글 : 2Byte
        -- 나라마다 다른 언어가 있기 때문에 이를 국제 표준화한 것이 ISO-8859
    -- 한글코드
        -- 완성형 (1 + 7 + 8 : 글자 하나를 지정함 '강' 이라는 글자를 저장) / 조합형 (5 + 5 + 5 : ㄱ + ㅏ + ㅇ 과 같이 5비트씩 저장)
        -- 한글의 가능한 글자 모든 조합 : 11172 자의 조합
        -- 표준완성형 : KSC5601 / EUC-KR
        -- MS의 확장완성형 : MS949 / CP949  
    -- 유니코드
        -- 전세계의 모든 글자를 가지는 문자코드
        -- 아스키 코드를 유니코드로 변환
        -- 유니코드 기반의 윈도우를 만들면 각 나라별로 다른 OS 를 만들 필요가 없어짐
        -- 기본평면, 확장평면 형태 (주로 2BYTE)
    -- UTF-8
        -- 아스키 코드를 유니코드로 변환하는 과정에서 호환이 안되는 경우도 존재함
        -- 유니코드의 가변길이 인코딩 (1BYTE ~ 6BYTE)
        -- 아스키 코드와의 호환성 (1BYTE 인 경우 아스키 코드 사용)
        -- 한글의 경우는 3BYTE
        
        
-- 데이터베이스 백업
    -- 물리 백업 : 특정 테이블만 백업하지 못하고, DB 파일 전체에 대해서 백업
        -- 핫 백업 (오라클 서비스가 동작하는 중에 백업)
            -- 데이터파일 복사
                -- 전체 파일이 10GB 일 경우, 10GB 전체를 백업함
            -- RMAN 백업 (프로그램 툴 사용)
                -- Incremental Backup
                    -- 전체 파일이 10GB 일 경우, 변경사항만 백업함
                -- Cumulative Backup
        
        -- 콜드 백업 (오라클 서비스가 정지한 상태에서 백업)
        
    -- 논리 백업
        -- 특정 테이블만 백업 가능 (SQL 을 통해서)
        -- EXPORT / IMPORT
        -- 오라클 10G 이상부터는 DATAPUMP (프로그램 툴)
            -- 고속백업
            -- 기존 백업툴과 호환 불가 (기존 EXP 툴로 백업했을 때, DATAPUMP 사용 불가)

        -- 전체 백업 (예시)
        EXP USERID = HR/HR FILE = './HR.DUMP' FULL = Y

        -- HR 스키마를 백업하시오 (유저 아이디를 지정하고, 저장되어서 생성될 파일의 위치와 이름을 정해줌) (예시)
        EXP USERID = HR/HR FILE = './HR.DUMP'


-- 데이터베이스 복원
    -- [조건] DB 생성하고, TABLESPACE 생성하고, 계정 생성 및 TABLESPACE 접근 권한을 추가해야 함
    -- 이 후에 IMP 명령어를 통해 IMPORT 해줘야 함

    -- HR 스키마를 복원하시오 (예시)
    IMP USERID = HR/HR FILE = './HR.DUMP'
    
    
-- 데이터베이스 로그
    -- REDO LOG
        -- DML/DDL 실행할 경우 기록됨
        -- 장애 발생 시 파일 참고해서 복구
        -- DML 자체는 저장하지 않고, 변경 사항에 대해 기록
        -- DDL 의 경우는 문장 자체와 변경 사항을 기록

        -- REDO 로그를 보는 방법
        ALTER SYSTEM SWITCH LOGFILE
        DESC v$log; -- 어떤 로그들이 ACTIVE, CURRENT, INACTIVE 상태인지
        DESC v$logfile; -- 로그의 ID 와 파일 위치 및 이름
        
    -- ALERT LOG
        -- 백그라운드 프로세스 작업로그, 에러 발생 시 남겨짐
    
    -- ARCHIVE LOG
        -- 유효기간이 끝난 REDO 의 논리적인 복사본
    
    -- TRACE FILES
        -- ALTER SESSION SET SQL_TRACE = TRUE
        -- CPU, 메모리, DISK I/O 에 대한 실행결과를 남김
        -- SQL 튜닝 시 필요함
        
        
-- 파티셔닝/샤닝
    -- 데이터베이스 파티셔닝 (PARTITIONING)
        -- VLDB (VERY LARGE DBMS)
            -- 전체 DB가 하나의 DBMS 시스템에 다 들어가기 힘들어지는 경우
            -- 테이블들을 여러 개의 군으로 나눠서 분산 저장
            -- 하나의 테이블이 방대한 경우에는 사전방식 (a-m, n-r, s-z) 와 같이 나눠서 저장
        
        -- 종류        
            -- 파티셔닝 (PARTITIONING)
                -- DBMS 레벨에서의 분할
                
            -- 샤딩 (SHARDING)
                -- DBMS 외부에서 분할 / 응용레벨에서 구별해야 함
            
        -- 제약사항 발생 (CONSTRAINTS)
            -- 테이블 단위 연산이 힘들어짐 (비용 문제)
                -- 조인연산 어려움 -> 정규화 (NORMALIZATION) 문제
                -- 역정규화 (DENORMALIZATION) -> 중복허용으로 해결
            -- 외래키 (FK) 의 효용 문제
                -- 레고드 추가 시 참조 무결성 조건 체크 -> 시스템 부담증가로 수동전환
                -- CRUD 시 위치 (LOCATION) 를 인식해야 함 (파티셔닝 / 샤딩의 차이점)
                
        -- 이점 (BENEFITS)
            -- 데이터 전체 검색 시 필요한 부분만 탐색해서 성능 증가
            -- 전체 데이터를 손실할 가능성이 줄어듬 (가용성 향상)
            -- 파티션별 백업/복구 가능
            -- 파티션 단위로 I/O 분산 가능 (업데이트 성능 증가 : 주로 샤딩의 성능이 좋아짐)
            
        -- 방식
            -- 범위 (RANGE) : A~M / N~R / S~Z [연속적인 경우]
            -- 해시 (HASH) : HASH 함수 파티션별로 크기를 비슷하게 나눔 [거의 비슷하게 나뉘어짐]
            -- 리스트 (LIST) : 특정한 칼럼을 기준 [비연속적인 경우]
            -- 컴포지트 (COMPOSITE) : RANGE-HASH / RANGE-LIST
            -- 인터벌 (INTERVAL) : RANGE 파티션에서 MAXVALUE 파티션 없이 지정된 인터벌 수를 가지는 파티션이 생성
            -- 레퍼런스 (REFERENCE) : 부모와 1:1 관계의 자식 테이블 파티션할 때 사용함
            
            
        -- BUSINESSCARD 테이블에 연도 (CREATETIME) 칼럼을 추가하고 파티셔닝하시오
        CREATE TABLE BUSINESSCARD (ID INT NOT NULL, NAME VARCHAR2(255), ADDRESS VARCHAR2(255), TELEPHONE VARCHAR2(255), CREATETIME DATE)
        PARTITION BY RANGE (
            YEAR(CREATETIME)) (
                                PARTITION P0 VALUE LESS THAN (2013),
                                PARTITION P1 VALUE LESS THAN (2014),
                                PARTITION P2 VALUE LESS THAN (2015),
                                PARTITION P3 VALUE LESS THAN MAXVALUE
                              );
                              
        -- 파티션 추가
        ALTER TABLE BUSINESSCARD
          ADD PARTITION (
                          PARTITION P4 VALUE LESS THAN (2005)
                        );
        
        -- 파티션 삭제
        ALTER TABLE BUSINESSCARD
         DROP PARTITION P4;
         
        -- 파티션 분할
        ALTER TABLE BUSINESSCARD
         REORGANIZE PARTITION P3 INTO (
                                      PARTITION P3 VALUE LESS THAN (2015),
                                      PARTITION P4 VALUE LESS THAN MAXVALUE
                                      );
        
        -- 파티션 병합
        ALTER TABLE BUSINESSCARD
         REORGANIZE PARTITION P2, P3 INTO (
                                          PARTITION P23 VALUE LESS THAN (2014)
                                          );


-- 데이터베이스 복제
    -- DBMS 의 내용을 복제해 동일한 DB 내용을 유지
    -- 두 개 이상의 DBMS 시스템을 마스터 / 슬레이브로 나눠서 마스터 DBMS -> 슬레이브 DBMS 로 SQL 쿼리 복제 (SELECT 제외)
        -- 데이터 업데이트 (CUD) 는 마스터에서 진행
        -- 읽기 (R) 은 슬레이브에서 진행
    -- 읽기 성능 향상 (Read Scalability : 슬레이브가 한 개가 아니라, 여러 개로 늘어날 수록 사용자들을 여러 슬레이브 DB로 분산해서 읽을 수 있게 함)
    -- 고가용성 (HA : High Availability) 지원 (복제를 했기 때문에 다른 DBMS 에서 에러가 발생해도 읽는 것에는 문제가 없음)
    -- 오라클에서는 RAC (Real Application Clusters) 라는 기능으로 불림 (= Oracle Parallel Server)
    -- 오라클 데이터가드 (Oracle Dataguard : Active 와 StandBy 를 구분함) 와 다른 기능
    -- 최소 두 개 이상의 오라클 서버 필요 (가상화 시스템 또는 물리 서버)
    
    
-- 오라클 12C
    -- 멀티테넌트 (Multi-Tenant) 아키텍처
        -- 하나의 CDB (Container DB) 에 여러 개의 PDB (Pluggable DB) 를 생성 관리
        -- 하나의 컨테이너에 여러 개의 DB 종속
        
        -- 구조
            -- 루트 (Root) 컨테이너 (CDB$ROOT)
                -- 공통사용자 + 오라클이 제공하는 메타데이터
                -- 컴퓨터
            -- 시드 (Seed) 컨테이너 (PDB$SEED)
                -- 새로운 PDB를 생성할 때 사용하는 템플릿
                -- USB
            -- PDB 컨테이너
                -- 기존의 생성했던 DB에 해당
                -- USB 내 데이터
                
            -- 하나의 컨테이너 DB (CDB) 에 여러 개의 Pluggalbe DB (PDB) 를 넣을 수 있다
            -- PDB 를 생성하는 과정에서 기본 템플릿에 해당하는 SEED 를 기반으로 생성한다
            -- 구성방식 : KEY/VALUE, ORDERED KEY/VALUE, DOCUMENT-BASED
                
                
        -- 작업 자원 관리 (Workload Resource Management)
            -- PDB 별로 우선순위 할당 (상/중/하)
            -- PDB 별로 리소스 공유 (1/N : 각 PDB별로 전체 WORKLOAD 를 SHARE 할 수 있음)
        -- 백업/복구
            -- CDB / PDB 단위로 가능함

        -- 메타데이터 (DICTIONARY VIEW)
            -- CDB_
                -- 모든 컨테이너에 존재하는 오브젝트
            -- DBA_
                -- 현재 컨테이너에 존재하는 오브젝트
            -- ALL_
                -- 현재 컨테이너에 현재 사용자가 접근 가능한 오브젝트
            -- USER_
                -- 현재 컨테이너에 현재 사용자가 생성한 오브젝트
            

    -- DECODE(기존 값, 조건, 대체 값)
    -- ROWNUM (오라클 내부적으로 가상컬럼을 가지고 있음 : 1부터 시작)
        -- ROWID : 고유 줄 번호
        -- ROWNUM : 결과물 출력라인번호
        -- 일부만 출력하려면 ROWNUM 사용
    
    -- 휴지통
        -- 오라클 10G 부터 휴지통 지원
        -- 테이블 삭제 시 삭제되지 않고 별도의 휴지통에 들어감
        
        -- 휴지통 비우기
        PURGE RECYCLEBIN;
        
        -- 휴지통 보기
        SHOW RECYCLEBIN;
        
        -- 삭제 취소
        FLASHBACK TABLE TABLE_NAME TO BEFORE DROP;
        
        -- 삭제 시 휴지통에 안 넣기
        DROP TABLE TABLE_NAME PURGE;

-- 트랜잭션 (Transaction)
    -- 복수의 SQL 문을 수행하는 도중 (EX. 은행 간의 이체) 에 장애가 발생했을 때 장애에 대응할 수 있도록 하는 기능
    -- 전체 수행 (COMMIT) 과 전체 취소 (ROLLBACK) 두 가지의 결과값만 가져야 함
    -- SAVEPOINT 명령어까지 ROLLBACK 할 수 있음
    -- AUTOCOMMIT 이 되는 경우
        -- DDL / DCL 명령문
        -- 오라클이 정상종료가 된 경우

    -- ACID 특성
        -- Atomatic (원자성)
            -- 전체적으로 수행이 되던지, 안되던지 해야 함 (All or Nothing)
        -- Consistency (일관성)
            -- 트랜잭션 전후에 데이터가 손상을 받으면 안됨
            -- 같은 데이터가 다른 값을 가지면 안됨
        -- Isolation (고립성 / 격리수준)
            -- 여러 개의 트랜잭션이 수행될 때 성능과 데이터 안정성 간의 TRADE-OFF
        -- Durability (지속성)
            -- 트랜잭션이 종료된 이후에도 데이터에 문제가 없어야 함 (장시간)

    -- SAVEPOINT
    CREATE TABLE BC(NAME VARCHAR2(255));
    INSERT INTO BC VALUES("BOB");
    SAVEPOINT C1;
    DELETE FROM BC; -- 레코드 삭제
    ROLLBACK TO C1; -- DDL 

    -- LOCAL TRANSACTION (로컬 트랜잭션)
        -- 동일한 시스템 안에서의 트랜잭션
        -- DBMS 가 보장하는 경우가 많음
        -- A은행의 1번 계좌에서 A은행의 2번 계좌로 전송하는 경우
        -- 전송하는 과정을 DBMS 내에서 ROLLBACK 할 수 있음
        
    -- GLOBAL TRANSACTION (글로벌 트랜잭션)
        -- 분산 트랜잭션
        -- 서로 다른 시스템에서의 트랜잭션
        -- DBMS 외부의 미들웨어 / WAS 가 보장
        -- A은행의 1번 계좌에서 B은행의 2번 계좌로 전송하는 경우
        -- 전송하는 과정을 WAS나 미들웨어가 취소해줘야 함

-- LOCK
    -- 공유자원 (리소스) 에 대해 여러 개의 트랜잭션이 접근하려고 경쟁하려고 할 때 제어하는 방법
        -- 동시성 제어 (Concurrency Control) 라고 하고 보통 Lock 으로 해결
        -- 프로그래밍에서는 동기화 (Synchronization)
    -- 일관성 (Consistency) 과 무결성 (Integrity) 을 지키기 위해 적용
    
    -- Lock Granularity
        -- 글로벌 락 (Global Lock)
            -- 특정 트랜잭션이 수행되면 다른 트랜잭션이 모두 정지하는 경우
            -- 데이터베이스 덤프의 경우, 
                -- 일반 백업 : 서비스가 정지된 상태에서 백업
                -- 고급 백업 : 서비스가 동작하는 상태에서 백업 (격리의 문제 발생 - 백업 중 업데이트가 되면 어느 상태를 백업해야 할까?)
                    -- Read Uncommited : 트랜잭션이 종료되지 않은 상태의 대상 데이터를 읽어감 (트랜잭션이 종료되면 데이터 값이 변경될 수 있음 = 현재값을 일단 참고하지만 최종값은 변경될 수 있음) (EX. 아직 개표가 끝나지 않은 득표현황)
                    -- Read Commited : 트랜잭션이 종료된 상태의 데이터만을 읽음 = 현재 트랜잭션이 진행되면서 데이터를 참고할 때 다른 트랜잭션에서는 작업이 종료된 데이터만을 읽음 (= 트랜잭션이 동일한 쿼리를 여러 번 수행시킬 때 쿼리값이 달라질 수 있음)
                    -- Repeatable Read : 백업이 시작되는 시점 전의 업데이트 내역만 적용함 (= 트랜잭션이 진행되는 도중에 쿼리를 반복수행하더라도 결과값은 계속 동일해야 함)
                    -- Serializable : 데이터 값에 문제가 생기는 경우가 아예 발생하지 않게 끔 트랜잭션끼리 겹치지 않음 (성능 낮음)

        -- 테이블 단위 락 (Table Lock)
            -- 동일한 테이블을 다른 트랜잭션이 사용하고 있다면 접근 금지
            
        -- 줄단위 락 (Row Lock)
            -- 동일한 줄 (Row) 만 접근 금지
    


-- PL/SQL
    -- Oracle's Procedure Language Extension to SQL
    -- 기존의 비절차적인 SQL 문에서 절차지향적인 성격을 더함
    -- 변수 정의, 조건문, 반복문 등을 지원
    -- 블럭구조, 자체 컴파일 가능
    -- DECLARE 를 사용해서 정의
    
    -- 유형
        -- ANONYMOUS
            DECLARE
            BEGIN
            EXCEPTION
            END
            
        -- PROCEDURE (리턴값 없음)
            PROCEDURE PROCEDURE_NAME IS
            BEGIN
            EXCEPTION
            END
        
        -- FUNCTION (리턴값 있음)
            FUNCTION FUNCTION_NAME RETURN DATATYPE IS
            BEGIN
                RETURN VALUE;
            EXCEPTION
            END


-- 저장 프로시저 (STORED PROCEDURE)
    -- SQL을 함수 형태로 저장하고 사용하는 방법 (Static SQL)
    -- 이미 컴파일되어 있어서 성능이 빠름
    -- SQL 인터프리터를 거치지 않고 미리 컴파일하는 (PRE-COMPILE) 하는 방식으로 DBMS에 저장
    -- 동일한 쿼리를 가지는 저장프로시저가 인자만 다르게 계속 수행되는 상황에서 효율이 높음
    -- Static SQL 로 일반적인 Dynamic SQL 보다 성능이 좋음
    
    -- 저장 프로시저 정의
    CREATE PROCEDURE PROCEDURE_NAME(PARAMTER PARAMTER_TYPE, ...)
    BEGIN
        -- SQL 문장들
    END
    
    -- 저장 프로시저 호출
    EXECUTE PROCEDURE_NAME;
    
    -- 저장 프로시저 삭제
    DROP PROCEDURE PROCEDURE_NAME;    

    -- [예시] EMP 테이블의 SAL 값을 10% 인상하는 저장 프로시저
    CREATE OR REPLACE PROCEDURE INCREASE_SAL (EMPNO_IN IN NUMBER) IS
    BEGIN
        UPDATE EMP
           SET SAL = SAL * 1.1
         WHERE EMPNO = EMPNO_IN;
        COMMIT;
    END INCREASE_SAL; -- END 뒤에 프로시저 이름은 생략 가능
    
    EXECUTE INCREASE_SAL(7369);


-- 함수 (FUNCTION)
    -- [예시] EMP 테이블의 레코드 갯수를 리턴하는 함수
    CREATE OR REPLACE FUNCTION COUNT_RECORD (V_SAMPLE IN NUMBER) RETURN NUMBER IS
    V_COUNT NUMBER; -- 내부 변수 선언
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
    

-- 트리거 (TRIGGER)    -- 특정한 조건이 되면 자동으로 호출되는 저장 프로시저 (EX. 레코드가 삭제되면 자동으로 참조무결성을 체크하는 트리거)
    -- 트리거 정의
    CREATE TRIGGER TRIGGER_NAME BEFORE (또는 AFTER) CRUD ON TABLE_NAME
    (FOR EACH ROW)
    BEGIN
        변경 전 (OLD.칼럼명) 또는 변경 후 (NEW.칼럼명) 을 이용한 처리
    END
    
    -- 트리거 삭제
    DROP TRIGGER TRIGGER_NAME;
    
    -- [예시] EMP 테이블의 레코드가 추가될 때마다 간단한 메세지를 출력하시오
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


-- 대형 데이터베이스 구축기술
    -- 데이터는 계속 늘어남 : 한 대의 DBMS 서버로는 처리능력의 한계
    -- 1. 성능 업그레이드
        -- HDD -> SSD -> 인 메모리 머신 (IN-MEMORY-MACHINE)
    
    -- 2. 샤딩 (SHARDING)
        -- DBMS 내용을 분할 (DB/테이블)
        -- 쓰기 (WRITE) 성능 향상 [Write Scalability 향상]
        -- 중복허용 : Denormalize = Location 이 고려되기 때문에 Join 이 어려워짐 = 서로 다른 DBMS 서버이기 때문 = 중복과 위치 투명성을 포기하는 대신
        -- 게임에서 월드를 구분해서 운영하는 방식과 동일 (각 월드마다 하나의 DB)MMV
        
    -- 3. 복제 (REPLICATION)
        -- 동일한 DBMS 를 여러 개 유지 (MASTER/SLAVE)
        -- 읽기 성능 향상 [Read Scalability 향상]
        -- DB#1(M) : CUD / DB#2(S) : R
        -- 포털 사이트에서 많이 사용함
        
    -- 스케일 업 (Scale-Up)
        -- 보통 말하는 업그레이드를 말함
        -- CPU 클럭 속도 증가, 코어 수 증가, 메모리 증가
        -- 보통 성능증가에 비해 가격 증가가 더 빠름 (비용부담)
        -- 병렬 컴퓨팅(Parallel Computing) / 전용 네트워크
        -- Tiglely-Coupled System
        
    -- 스케일 아웃 (Scale-Out)
        -- 동일한 서버/DBMS 를 병렬로 구축
        -- 분산 컴퓨팅 (Distributed Computing)
        -- Loosely Coupled System - 상대적으로 저렴
        -- 노드 수를 추가하여 계속 성능 향상 가능 (효율은 상대적으로 떨어짐)
        
  -- NoSQL
    -- Not Only SQL
    -- 일반 RDBMS (B-TREE : INDEX 검색) 가 주로 읽기/검색 성능에 최적화
    -- 쓰기 성능이 중요한 응용의 경우 좋은 성능을 보이는 경우가 많음
        -- 로그를 기록하는 시스템들은 읽기보다 쓰기가 더 중요함 (일반적인 RDBMS 에서는 인덱스를 삭제하는 것밖에 없지만, NoSQL 을 사용함으로써 쓰기가 더 빠름)
        -- 로그 머신, SNS 메신저 (밴드, 카카오톡 등)
    -- 기존 RDBMS 를 완전히 대체하는 것이라기 보단느 보완재의 역할
    -- 특정 기술을 말하는 것이 아니라 일련의 제품군을 가리킴
    -- 제품군
        -- MongoDB, Apache Cassandra, Apache HBASE, Redis 등

    -- CAP 이론
        -- C (Consistency : 일관성)
            -- 어떤 노드를 접근하더라도 데이터 값이 동일해야 함
        -- A (Availability : 가용성)
            -- 노드 일부가 FAIL 되더라도 서비스가 중단이 안되어야 함
            -- 네이버의 수 만대 서버 중 몇 개의 서버가 죽더라도 서비스는 깨지면 안됨
        -- P (Partition Tolerance : 파티션 내성)
            -- 노드 간 통신에 장애가 생겨도 문제가 없어야 함

    -- CAP 이론을 이용한 NoSQL 시스템 분류
        -- 어떤 시스템도 3가지 모두를 만족시킬 수 없다
            -- CA : 일반 RDBMS
            -- CP : Hbase, MongoDB, Redis
            -- AP : Cassandra
    
    -- 저장 형태에 대한 분류
        -- KEY/VALUE
            -- 키 값을 주면 밸류를 리턴하는 형태
            -- JSON 과 유사한 형태, Redis
        
        -- ORDERED KEY/VALUE
            -- 키 값으로 정렬되는 형태
            -- Hadoop, Cassandra, HBase
        
        -- DOCUMENT BASED
            -- 벨류 값이 JSON/XML 문서인 형태
            -- MongoDB
            
    -- 스키마리스 (Schemaless)
        -- 스키마 (DDL) 기반이 아니라 필요하면 새로운 컬럼 (키) 를 추가하면 됨
        -- 전체적으로 동일한 구조가 아닐 수 있음
        
        -- RDMBS : 정규형 데이터 (EX. INSERT 할 때 EMAIL 칼럼에 해당되는 값이 없으면 NULL)
        -- NoSQL : 반정규형 데이터 (Semi) (EX. INSERT 할 때 EMAIL 칼럼에 해당되는 값이 없어도 가능 = 데이터가 필요할 경우 스키마가 없어도 사용 가능함)
        -- 검색엔진 : 비정규형 데이터 (Plain Text) (EX. 스키마 즉 형식이 없음)
        
        