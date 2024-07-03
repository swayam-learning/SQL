use worker;
show tables;
select * from bonus;
select * from workers;
select * from title;
select department,count(department) from workers group by department having count(department)>2;
select department,count(department),sum(salary) from workers group by department,salary having sum(salary)>600000;

-- Constarints
-- DDL(Data Definition Language)
-- Primary Key -- Not Null,Unique,only one Primary Key,It's good practice to have primary ke as INT because it's faster

-- Foreign key
-- to refer the primary key of the other table

-- CREATE TABLE ORDER (
-- INT PRIMARY KEY,
-- id delivery_date DATE,
-- order_placed_date DATE,
-- FOREIGN KEY (cust_id) REFERENCES customer(id)
-- ;

-- UNIQUE -- can have null values

