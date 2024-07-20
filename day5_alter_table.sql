-- Adding of column in a table
use worker;
show tables;
select * from workers;
alter table workers
add head_of_department varchar(50) 
after department;
update workers
set head_of_department = case
        when department="hr" then "aditya"
        when department="admin" then "advait"
        when department ="analyst" then "neha"
        when department ="manager" then "aditya"
end;
select * from workers;

-- Modify the column in a table
alter table workers
modify group_ varchar(50) null;

describe workers;

-- drop column
alter table workers
drop group_;

-- rename column
alter table workers
change column last_name surname varchar(255) null;

-- rename table
alter table workers
rename to staff;

select * from staff;

-- renaming the column back to original name
alter table staff
rename to workers;

-- renaming table in sakila database
use sakila;
alter table actor 
rename to abhineta;
select * from abhineta;

-- also works
rename table abhineta to actors;