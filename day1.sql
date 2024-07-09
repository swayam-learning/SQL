USE WORKER;
SELECT * FROM WORKERS;
SELECT SALARY FROM WORKERS;
SELECT FIRST_NAME,SALARY FROM WORKERS;

-- DUAL TABLE
SELECT 444+11;
-- CREATES A DUMMY TABLE FRO THIS
SELECT NOW();
SELECT lcase("SWAYAM");

-- WHERE CLAUSE
SELECT * FROM WORKERS WHERE SALARY >120000;
SELECT * FROM WORKERS WHERE DEPARTMENT="HR";

-- BETWEEN CLAUSE
SELECT * FROM WORKERS WHERE SALARY BETWEEN 10000  AND 100000;
SELECT FIRST_NAME, LAST_NAME FROM WORKERS WHERE SALARY BETWEEN 1000 AND 100000;

-- OR CLAUSE
SELECT * FROM WORKERS WHERE DEPARTMENT = "HR" OR "ADMIN";

-- IN ORDER TO REDUCE DEPENDENCE ON OR CLAUSE WE USE IN
-- IN CLAUSE
SELECT * FROM TITLE  WHERE WORKER_TITLE  IN ("EXECUTIVE","MANAGER","QUANT") ;

-- NOT(NEGATION)
SELECT * FROM TITLE  WHERE WORKER_TITLE  NOT IN ("EXECUTIVE","MANAGER","QUANT") ;

-- IS NULL
SELECT * FROM TITLE  WHERE AFFECTED_FROM IS NULL;

-- pattern searching/wildcard % , _
-- % means any no of characters
-- _ means only one character
SELECT * FROM workers  WHERE first_name LIKE "%H";
-- The above code means we can any no of alphabets which has h at the end
 SELECT * FROM workers  WHERE first_name LIKE "v%";
 SELECT * FROM workers  WHERE first_name LIKE "%A";
 SELECT * FROM workers  WHERE first_name LIKE "_A%";
 SELECT * FROM workers  WHERE first_name LIKE "__V%E%";
 SELECT * FROM workers  WHERE first_name LIKE "__V%A";
  -- in the above query my intent is to find name which has third letter as V and ends with A
SELECT * FROM workers 
WHERE first_name REGEXP '^[vac]';
-- in the above line we want to select those columns which have name starting from either v or a or c

SELECT * FROM workers 
WHERE first_name REGEXP '[vac]';
-- Since there's no ^ at the beginning of the regular expression,
--  it will match first_name values that contain 'v', 'a', or 'c' anywhere in the string, not just at the beginning.

SELECT * FROM workers 
WHERE first_name REGEXP '^[a-f]';
-- Select all records where the first letter of the City starts with anything from an "a" to an "f".

SELECT * FROM workers 
WHERE first_name REGEXP '^[^acf]';
-- Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".

--  Sorting of Data
 SELECT * FROM workers ORDER BY SALARY; -- ASC ASCENDING IS BY DEFAULT
 SELECT * FROM workers ORDER BY SALARY DESC;
 
 -- DISTINCT VALUES
 SELECT DEPARTMENT FROM WORKERS;
 SELECT DISTINCT DEPARTMENT FROM WORKERS;
 
 -- DATA GROUPING
 -- IN ORDER TO FIND NO OF EMPLOYEES WORKING IN A DEPARTMENT SOMETHING SIMILAR .VALUE_COUNTS() IN PANDAS
 -- AGGREGATION
 -- GROUP BY
 SELECT DEPARTMENT FROM WORKERS GROUP BY DEPARTMENT ;
-- BASICALLY GROUP BY SAYS WHATEVER IS PROVIDED BETWEEN SELECT AND FROM , SAME SHOULD BE PROVIDED FOR GROUP BY
-- WITHOUT AGGREGATION FUNCTION GROUP BY GIVES SAME OUTPUT AS DISTINCT
 SELECT DEPARTMENT,COUNT(*) FROM WORKERS GROUP BY DEPARTMENT ;
 -- Q. Find average salary per deaprtment
SELECT DEPARTMENT,AVG(SALARY) FROM WORKERS GROUP BY DEPARTMENT;
  -- Q. Find average salary per deaprtment and sort the salary according to the average salary
SELECT DEPARTMENT,AVG(SALARY) AS AVG_SALARY FROM WORKERS GROUP BY DEPARTMENT ORDER BY AVG_SALARY DESC;
-- if we use SUM(SALARY) we will get some of salary for each department in the upper code
-- but if we use COUNT(SALART) we will get count of people having salary per department basically non null values
SELECT DEPARTMENT,count(SALARY) FROM WORKERS GROUP BY DEPARTMENT;
SELECT DEPARTMENT,sum(SALARY) FROM WORKERS GROUP BY DEPARTMENT;
SELECT DEPARTMENT,MAX(SALARY) FROM WORKERS GROUP BY DEPARTMENT;
SELECT DEPARTMENT,MIN(SALARY) FROM WORKERS GROUP BY DEPARTMENT;

-- WHERE WITH GROUP BY
SELECT DEPARTMENT,count(SALARY),FIRST_NAME FROM WORKERS WHERE FIRST_NAME LIKE "%A" GROUP BY DEPARTMENT,FIRST_NAME;

-- HAVING WITH GROUP BY
SELECT DEPARTMENT,count(SALARY),FIRST_NAME FROM WORKERS GROUP BY DEPARTMENT,FIRST_NAME HAVING FIRST_NAME LIKE "%A";

-- WHERE vs HAVING

-- 1. Both have same function of filtering the row base on certain conditions.
-- 2.WHERE clause is used to filter the rows from the table based on specified condition
-- 3. HAVING clause is used to filter the rows from the groups based on the specified condition.
-- 4. HAVING is used after GROUP BY while WHERE is used before GROUP BY clause.
-- 5. If you are using HAVING, GROUP BY is necessary.
-- 6. WHERE can be used with SELECT, UPDATE & DELETE keywords while GROUP BY used with SELECT

select * from workers where salary between 100000 and 110000;


