-- SELECT 문은 데이터베이스에 보관되어 있는 데이터 조회할 때 사용
-- SELECT 절은 FROM 절에 명시한 테이블에서 조회할 열을 지정할 수 있음
-- SELECT [조회할 열], [조회할 열] FROM 테이블이름;
SELECT * FROM EMP;  --* 모든 칼럼을 의미, FROM 다음에 오는 것이 테이블 이름, SQL 수행문은 ;(세미클론)으로 끝나이


-- 특정 칼럼만 선택해서 조회
SELECT EMPNO, ENAME, DEPTNO FROM EMP;
-- 사원번호와 부서번호만 나오도록 SQL 작성 (EMPNO, DEPTNO)
SELECT  EMPNO, DEPTNO FROM EMP;
-- 한눈에 보기 좋게 별칭 부여하기
SELECT ENAME, SAL, COMM, SAL * 12 + COMM
	FROM EMP;
-- 한눈에 보기 좋게 별칭 부여하기
SELECT ENAME "이름" SAL AS "급여", COMM AS "성과급", SAL * 12 "연봉"
	FROM EMP;

-- 중복 제거하는 DISTINCT, 데이터를 조회할 때 중복되는 행이 여러 행이 조회될 때, 중복된 행을 한 개씩만 선택
SELECT DISTINCT deptno 
FROM EMP
ORDER BY DEPTNO;

-- 컬럼값을 게산하는 산술 연산자 (+, -, *, / )
SELECT ename, sal, sal * 12 "연간 급여", sal * 12 + comm "총 연봉"
	FROM EMP;
	
-- 연습문제 : 직책(job)을 중복 제거하고 출력하
SELECT DISTINCT job, EMPNO FROM emp;

-- WHERE 구문 (조건문)
-- 데이터 조회할 때 사용자 원하는 조건에 맞는 데이터만 조회할 때 사용
SELECT * FROM EMP	-- 먼저 테이블이 선택되고, WHERE 절에서 행을 제한하고, 출력할 열을 결정 
WHERE DEPTNO = 20;

-- 사원번호가 7369번인 사원의 모든 정보를 보여줘.
SELECT * FROM EMP
	WHERE EMPNO = 7369;		-- 데이터베이스에서 비교는 = (같다) 라는 의미로 사용됨   
	
-- 급여가 2500 초과인 사원번호, 이름, 직책, 급여 출력
-- emp 테이블에서 급여가 2500 초과인 행을 선택하고, 사원번호, 사원 이름, 직책, 급여에 대한 컬럼을 선택해 출력  
SELECT empno, ename, job, sal
	FROM EMP
	WHERE sal > 2500;

-- WHERE 절에 기본 연산자 사용
SELECT e.ename
	FROM EMP e JOIN DEPT d
	ON e.DEPTNO = d.DEPTNO;

SELECT * FROM emp
	WHERE sal * 12 = 36000;

-- WHERE 절에 사용하는 비교 연산자 : > , >= , < , <=
-- 성과급이 500 초과인 사람의 모든 정보 출력
SELECT * FROM EMP
	WHERE comm > 500;

-- 입사일이 81년 1월 1일 이전인 사람의 모든 정보 출력하기 
SELECT * FROM EMP 
	WHERE HIREDATE < '81/01/01'		-- 데이터베이스의 문자열 비교시 ' ' , DATE	타입은 날짜의 형식에 맞으면 가능
	
-- 같지 않음을 표현하는 여러가지 방법 : <> , != , ^= , NOT 컬럼명 = 
SELECT * FROM EMP 
	-- WHERE DEPTNO <> 30;
	-- WHERE DEPTNO != 30;
	WHERE DEPTNO ^= 30;
	WHERE NOT DEPTNO = 30;

-- 논리 연산자 : AND , OR , NOT
-- 급여가 3000 이상이고 부서가 20번 사원의 모든 정보 출력하기
SELECT * FROM EMP 
	WHERE sal >= 3000 AND DEPTNO = 20;

-- 급여가 3000 이상이거나 부서가 20번 사원의 모든 정보 출력하기
SELECT * FROM EMP 
	WHERE sal >= 3000 OR DEPTNO = 20;

-- 급여가 3000 이상이고, 부서가 20번이고 입사일이 82년 1월 1일 이전 사원의 모든 정보 출력하기 
SELECT * FROM EMP 
	WHERE sal >= 3000 AND DEPTNO = 20 AND HIREDATE < '82/01/01';

-- 급여가 3000 이상이고, 부서가 20번이거나, 입사일이 82년 1월 1일 이전 사원의 모든 정보 출력하기 
SELECT * FROM EMP 
	WHERE sal >= 3000 AND ( DEPTNO = 20 OR HIREDATE < '82/01/01');

-- 급여가 2500 이상이고 직책이 MANAGER인 사원의 모든 정보 출력
SELECT * FROM EMP
	WHERE sal >= 2500 AND JOB = 'MANAGER';

-- IN 연산자 : 여러개의 열 이름을 조회할 경우 연속해서 나열할 수 있음 
SELECT * FROM EMP
	WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK'
SELECT * FROM EMP
	WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK')

-- IN 연산자를 사용해 20번과 30번 부서에 포함된 사원의 모든 정보 조회
SELECT * FROM EMP
	WHERE DEPTNO IN (20, 30)
	
-- NOT IN 연산자를 사용해 20번과 30번 부서에 포함된 사원 조회
SELECT * FROM EMP
	WHERE DEPTNO NOT IN(10);

-- 비교 연산자와 AND 연산자를 사용하여 출력하기
SELECT * FROM EMP
	WHERE JOB != 'MANAGER' AND JOB <> 'SALESMAN' AND JOB ^= 'CLERK';

-- BETWEEN A AND B 연산자 : 일정한 범위를 조회할 때 사용하는 연산자
-- 급여가  2000에서 3000사이 사원의 모든 정보를 출력
SELECT * FROM EMP
	WHERE SAL >= 2000 AND SAL <= 3000;

-- BETWEEN A AND B 연산자 : 일정한 범위를 조회할 때 사용하는 연산자
SELECT * FROM EMP
	WHERE SAL BETWEEN 2000 AND 3000;

-- 사원번호가 7689에서 7902까지의 사원의 모든 정보 출력하기
SELECT * FROM EMP
	WHERE EMPNO BETWEEN 7689 AMD 7902;

-- 1980년이 아닌 해에 입사한 사원의 모든 정보를 출력
SELECT * FROM EMP
	WHERE NOT HIREDATE BETWEEN '1980/01/01' AND '1980/12/31'
	
-- LIKE, NOT LIKE 연산자 : 문자열을 검색할 때 사용하는 연산자
-- % : 길이와 상관없이 모든 문자 데이터를 의미
-- _ : 문자 1개를 의미
SELECT empno, ename FROM EMP
WHERE  EMPNO LIKE '%K%'  -- 앞과뒤의 문자열 길이에 상관없이 K라는 문자가 ename에 사원의 정보 출력 포함되 있

-- 사원의 이름의 두 번째 글자가 L인 사원만 출력하기
SELECT * FROM EMP
	WHERE ename LIKE '_L%';
	

-- [실습] 사원 이름에 AM이 포함되어 있는 사원 데이터만 출력 
SELECT * FROM EMP
	WHERE ENAME LIKE '%AM%';

-- [실습] 사원 이름에 AM이 포함되어 있지 않은 사원 데이터만 출력 
SELECT * FROM EMP
	WHERE ENAME NOT LIKE '%AM%';

-- 와일드카드 문자가 데이터 일부일 경우 ( % , _ ) escape로 지정된 '\' 뒤에 오는 %와일드카드가 아니라는 의미
SELECT * FROM EMP
	WHERE ENAME LIKE '%\%P' ESCAPE '\'; 	-- 사원이름이 %P로 끝나는 사원을 조회
	
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal, comm, deptno)
	VALUES (1001, 'JAME%S', 'MANAGER', 7839, '2024-10-15', 3500, 450, 30);

DELETE FROM EMP
	WHERE empno = 1001;

SELECT * FROM emp;

-- is null 연산자 :
-- 데이터 값에는 NULL 값을 가질 수 있음, 값이 정해지지 않음을 의미, 연산불가(계산, 비교, 할당)
SELECT ename, sal, sal*12+comm "연봉", COMM
	FROM emp;

-- 비교연산으로 NULL 비교하기
SELECT * FROM EMP
	WHERE COMM = NULL;

-- 해당 데이터가 NULL 인지 확인하는 방법은 is NULL 연산자를 사용해야 함 
SELECT * FROM EMP
	WHERE COMM IS NULL;

-- 해당 데이터가 NULL 이 아닌 데이터만 출력하기
SELECT * FROM EMP
	WHERE COMM IS NOT NULL;

-- 직속상관이 있는 사원 데이터만 출력하기
SELECT * FROM EMP 
	WHERE MGR IS NOT NULL; 

-- 정렬을 위한 ORDER BY 절 : 오름차순 또는 내림차순 정렬 가능
SELECT * FROM EMP
	ORDER BY sal DESC;	-- 급여에 대한 오름차순 정렬
	
-- 사원번호 기준 내림차순 정렬하기
SELECT * FROM EMP
	ORDER BY EMPNO DESC;
	
-- 정렬 조건을 여러 컬럼을 설정하기
SELECT * FROM EMP
	ORDER BY SAL DESC, ENAME;	-- 급여가 많은 사람 순으로 정렬하고, 급여가 같으면 이름순 정렬하기
	
-- 별칭 사용과 ORDER BY 
SELECT empno 사원번호, ename 사원명, sal 월급, hiredate 입사일		-- 실행순서 3번, 출력해야할 컬럼 제한
	FROM EMP		-- 실행순서 1번, 먼저 테이블을 가져
	WHERE sal >= 2000		-- 실행순서 2번, 해당 조건에 맞는 행 (튜플)을 가져
	ORDER BY 월급 DESC, 사원명 ASC;	-- 실행순서 4번, 마지막 정렬을 수행함 
	
-- 연결 연산자 : SELECT문 조회 시 컬럼 사이에 특정한 문자를 넣을 때 사용
SELECT ename || '의 직책은' || job "사원 정보"
	FROM emp; 

-- [실습문제1] 사원 이름이 S로 끝나는 사원 데이터를 모두 출력
SELECT * FROM EMP
	WHERE ENAME LIKE '%S';

-- [실습문제2] 30번 부서에 근무하고 있는 사원 중, 직책이 SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서번호 출력
SELECT empno, ename, job, sal, deptno
	FROM EMP
	WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

-- [실습문제3] 20번과 30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원의 사원번호, 이름, 직책, 급여, 부서번호 출력
SELECT empno, ename, job, sal, deptno
	FROM EMP
	WHERE DEPTNO IN (20, 30) AND SAL > 2000; 

-- [실습문제4] 급여가 2000 이상 3000 이하 범위 이외의 값을 가진 사원의 모든 정보 출력
SELECT * FROM EMP
	WHERE SAL NOT BETWEEN 2000 AND 3000; 

-- [실습문제5] 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000 ~ 2000 사이가 아닌 사원의 이름, 번호, 급여, 부서번호 출력
SELECT  empno, ename, job, sal, deptno
	FROM EMP
	WHERE ENAME LIKE '%E%'
	AND DEPTNO = 30
	AND SAL NOT BETWEEN 1000 AND 2000;

-- [실습문제6] 추가 수당이 존재하지 않고, 상급자가 존재하고 직책이 MANAGER, CLERK 인 사원 중 사원이름의 두번째 글자가 L이 아닌 사원의 모든 정보 출력하
SELECT * FROM EMP
	WHERE COMM IS NULL
	AND MGR IS NOT NULL
	AND JOB IN ('MANAGER', 'CLERK')
	AND ENAME NOT LIKE '_L%';



-- SELECT 연습 문제 --

-- 1. EMP테이블에서 COMM 의 값이 NULL이 아닌 정보 조회
SELECT * FROM EMP
	WHERE COMM IS NOT NULL;

-- 2. EMP테이블에서 커미션을 받지 못하는 직원 조회
SELECT * FROM EMP
	WHERE comm IS NULL OR comm = 0;

-- 3. EMP테이블에서 관리자가 없는 직원 정보 조회
SELECT * FROM EMP
	WHERE MGR IS NULL;

-- 4. EMP테이블에서 급여를 많이 받는 직원 순으로 조회
SELECT * FROM EMP
	ORDER BY sal DESC;

-- 5. EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회
SELECT * FROM EMP
	ORDER BY sal DESC, COMM;

-- 6. EMP테이블에서 사원번호, 사원명, 직급, 입사일 조회 (단, 입사일을 오름차순 정렬 처리)
SELECT empno, ename, job, hiredate
	FROM EMP
	ORDER BY HIREDATE;
	
-- 7. EMP테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)
SELECT empno, ename
	FROM EMP
	ORDER BY EMPNO DESC;

-- 8. EMP테이블에서 사번, 입사일, 사원명, 급여 조회 (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)
SELECT deptno, hiredate, ename, sal
	FROM EMP
	ORDER BY DEPTNO , HIREDATE DESC;

--9. 오늘 날짜에 대한 정보 조회
SELECT SYSDATE 
	FROM DUAL;

-- 10. EMP테이블에서 사번, 사원명, 급여 조회  (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)
SELECT empno, ename, TRUNC(sal, -2)
	FROM EMP
	ORDER BY SAL DESC;
	
-- 11. EMP테이블에서 사원번호가 홀수인 사원들을 조회
SELECT empno
	FROM EMP
	WHERE empno/2 != 0;
	
--12. EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)
SELECT ename, 
       EXTRACT(YEAR FROM hiredate) AS hire_year, 
       EXTRACT(MONTH FROM hiredate) AS hire_month
FROM EMP;
	
--13. EMP테이블에서 9월에 입사한 직원의 정보 조회
SELECT * FROM EMP
	WHERE EXTRACT (MONTH FROM hiredate) = 9;

--14. EMP테이블에서 81년도에 입사한 직원 조회
SELECT * FROM EMP
	WHERE HIREDATE BETWEEN '1981/01/01' AND '1981/12/31';

SELECT * FROM EMP
	WHERE EXTRACT (YEAR FROM hiredate) = 1981;

-- 15. EMP테이블에서 이름이 'E'로 끝나는 직원 조회
SELECT * FROM EMP
	WHERE ENAME LIKE '%E';

--16. EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회
SELECT * FROM EMP
	WHERE ename LIKE '__R%';

--17. EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회
SELECT empno, ename, hiredate, ADD_MONTHS(hiredate, 12*40) 	-- 특정 날짜에 개월 수를 더해 날짜를 계
	FROM EMP;

18. EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회

--19. 오늘 날짜에서 년도만 추출
SELECT EXTRACT (YEAR FROM sysdate)
	FROM DUAL;
























	
	
	
	