use worker;
-- we can also drop multiple databases
-- DROP DATABASE Database_Name1, [ Database_Name2, ......., Database_NameN ] ;  
-- NOW IN MYSQL WE CANNOT DIRECTLY RENAME A DATABASE THERE ARE TWO WAYS TO SOLVE THIS PROBLEM 
-- EITHER CREATE A NEW DATABASE AND COPY ALL THE TABLE AFTER THAT YOU CAN DROP THE OLD DATABASE

CREATE DATABASE EMPLOYEES;
RENAME TABLE WORKERS.WORKERS TO EMPLOYEES.WORKERS;
RENAME TABLE WORKERS.BONUS TO EMPLOYEES.BONUS;
RENAME TABLE WORKERS.TITLE TO EMPLOYEES.TITLE;

-- These statements rename tables from the WORKER database to the EMPLOYEES database.
-- After renaming, the original tables (WORKER.WORKERS, WORKER.BONUS, WORKER.TITLE) 
-- no longer exist in the WORKER database because they have been moved to the EMPLOYEE  database.

-- IN ORDER TO CREATE A COPY 
CREATE DATABASE IF NOT EXISTS MAJDOOR;
-- COPY TABLES FROM WORKERS TO MAJDOOR
CREATE TABLE MAJDOOR.WORKER LIKE WORKER.WORKERS;
INSERT INTO MAJDOOR.WORKER SELECT * FROM WORKER.WORKERS; 
-- SIMILARLY FOR OTHER WE CAN REPEAT THESE STEPS
  
-- **ANOTHER WAY OF RENAMING A DATABASE**
-- FIRST WE CREATE A PHYSICAL COPY OF THE OLD DATABASE
-- mysqkdump -u root -p -R OLD_DBNAME > ODL_DDBNAME.SQL;
-- mysqladmin -u root -p CREATE NEWDBNAME;
-- mysql -u root -p NEWDBNAME < OLDBDNAME;

-- ALTER DATABASE old_database_name MODIFY NAME = new_database_name; in sql doesnot work in mysql workbench
 
 -- DESCRIBING A TABLE
desc WORKER.WORKERS; -- CANNOT RUN FOR MULTIPLE TABLES TOGETHER
-- SIMILAR TO DF.INFO() OF PANDAS 

-- DELETE V/S DROP V/S TRUNCATE

-- When you drop a table:
-- Table structure will be dropped
-- Relationship will be dropped
-- Integrity constraints will be dropped
-- Access privileges will also be dropped

-- DELETE statement only deletes the rows from the table based on the condition 
-- defined by WHERE clause or delete all the rows from the table when condition is not specified.
delete from workers where worker_id=1001;
select * from workers; -- here 1001 is missing
-- now if we say delete without condition
delete from workers;
-- created and inserted values again to maintian integrity of the table

-- **The TRUNCATE statement: it is used to delete all the rows from the table and free the containing spaces**
truncate table bonus;
select * from bonus;

-- it might look that delete without condition is simialr to truncate but it is false
-- Key Differences:
-- Transactionality: DELETE can be part of a transaction and can be rolled back, while TRUNCATE is not transactional and cannot be rolled back.
-- Logging and Triggers: DELETE logs each row deletion and can trigger associated triggers. TRUNCATE does not log individual deletions and does not trigger delete triggers.
-- Performance: TRUNCATE is generally faster than DELETE for large tables because it does not log each row deletion and does not trigger cascading actions.

-- **rename table**
rename table workers to employees;
select * from employees;

rename table employees to workers;
select * from workers;

-- **copying content from one table to another**
create table worker_details as select * from  workers;
select * from worker_details;

-- **conditional copying**
create table high_salary_empoloyee as select * from workers where salary >100000;
select * from high_salary_empoloyee;

-- **Create local temporary table**
CREATE TEMPORARY TABLE local_temp_table (
    id INT,
    name VARCHAR(50)
);
-- Insert data into local and global temporary tables
INSERT INTO local_temp_table VALUES (1, 'John');

-- Select data from both temporary tables
SELECT * FROM local_temp_table;
-- global temproary tables are not supported in mysql 

-- Drop local temporary table (automatically dropped at end of session)
DROP TEMPORARY TABLE IF EXISTS local_temp_table;
-- temproary tables are not visible in the tables of the schema
show tables;

-- in sql server
-- CREATE TABLE ##new global temp table (  
-- User id int,  
-- User name varchar (50),  
-- User address varchar (150)  
-- )  

-- CREATE TABLE #local temp table (  
-- User id int,  
-- Username varchar (50),  
-- User address varchar (150)  
-- )  

-- **ALTER TABLE**
ALTER TABLE WORKERS ADD GROUP_ VARCHAR(20);
select * from workers;
UPDATE WORKERS
SET GROUP_ = IF(WORKER_ID = 1001, 'G1',
               IF(WORKER_ID = 1002, 'G1',
               IF(WORKER_ID = 1003, 'G2',
               IF(WORKER_ID = 1004, 'G3',
               IF(WORKER_ID = 1005, 'G2',"UNKNOWN")))));
-- Example: Update GROUP_ based on WORKER_ID using CASE statement
UPDATE WORKERS
SET GROUP_ = CASE
    WHEN WORKER_ID = 1006 THEN 'G1'
    WHEN WORKER_ID = 1007 THEN 'G1'
    WHEN WORKER_ID = 1008 THEN 'G2'
    WHEN WORKER_ID = 1009 THEN 'G3'
    WHEN WORKER_ID = 1010 THEN 'G2'
END;
SELECT * FROM WORKERS;

