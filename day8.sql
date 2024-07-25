use sqlbootcamp;
show tables;
select * from learners;
select * from courses;

-- Count of the number of students who joined the course via Linekdin , Youtube,Community
 select SourceOfJoining,Count(*) as num_of_learners 
 from learners group by SourceOfJoining;
 
 -- any unknown aggregate column cannot be used 
 
 -- Count of the number of students who joined the course via Source Of Joining,and Location
 select SourceOfJoining , Location ,Count(*) as num_of_learners from learners group by SourceOfJoining,Location;
 
 SELECT 
    Location,
    SUM(CASE WHEN SourceOfJoining = 'linkedin' THEN 1 ELSE 0 END) AS Linkedin,
    SUM(CASE WHEN SourceOfJoining = 'Youtube' THEN 1 ELSE 0 END) AS Youtube,
    SUM(CASE WHEN SourceOfJoining = 'community' THEN 1 ELSE 0 END) AS Community,
    COUNT(*) AS total_learners
FROM 
    learners
GROUP BY 
    Location;

-- corresponding to each course how many students have enrolled
select selectedcourse , count(*) as num_of_students from learners group by selectedcourse;
-- from --> select --> groupby --> count

-- corresponding to individual source of joining ,give the maximum yeafrs of experience any person
select sourceofjoining , max(yearsofexperience) as max_years from learners group by sourceofjoining;

-- corresponding to individual source of joining ,give the maximum yeafrs of experience any person
select sourceofjoining , avg(yearsofexperience) as max_years from learners group by sourceofjoining;

-- display the reports of those learners who have joined the course via more than 1 source of joining
-- if any filteration is rquired after group by use having clause
SELECT learnerphoneno,GROUP_CONCAT(DISTINCT learnerid) as LearnerIdAlloted, GROUP_CONCAT(DISTINCT SourceOfJoining) AS SourcesOfJoining
FROM learners
GROUP BY learnerphoneno
HAVING COUNT(DISTINCT SourceOfJoining) > 1;

-- Display the count of students who joined via linkedin
select count(*) as studentsfromLinkedin from learners where sourceofjoining = "linkedin";

-- less efficient
-- select sourceofjoining , count(*) as num_of_students
-- from learners
-- group by sourceofjoining
-- having sourceofjoining = "Linkedin";

-- Logical Operators

-- display the course which doesnot include excel
 select count(*) from courses where coursename not like "%excel%";

-- display the records of those students who have less than 4 years of experience and source of joining Youtube
select * from learners
where YearsOfExperience < 4 and sourceofjoining ="Youtube";

-- display the records of those students who have in between 1 to 3 years of experience and source of joining Youtube
select * from learners
where YearsOfExperience between 1 and 4 and sourceofjoining ="Youtube";
 
-- alter command
desc employee1;
alter table employee1 add column jobPosition varchar(50);
alter table employee1 modify column jobPosition varchar(40);
alter table employee1 drop column jobPosition;

-- if we have auto increment we cannot drop the primary key 

-- delete vs truncate vs drop
-- DELETE:
-- Removes specific rows based on a condition.
-- Slower than TRUNCATE.
-- Generates log entries and can be rolled back if in a transaction.
-- • DROP:
-- Deletes the entire table or database.
-- Removes both the data and the table structure permanently.
-- Cannot be rolled back.
-- • TRUNCATE:
-- Deletes all rows from a table.
-- Faster than DELETE as it doesn't log each row deletion.
-- Resets identity columns (auto-increment columns) to their seed value.
-- Cannot be rolled back.

-- Datatypes in Sql  --> Decimal
desc courses;
create table courses_updated(
	CourseId int auto_increment,
    CourseName varchar(50),
    CourseDurationMonths decimal(3,1),
    CourseFee double,
    changed_at timestamp default now(),
    primary key(CourseId)
);
-- drop table courses_updated;
-- decimal(3,1) 3 is the precision that means maximum no of digits and precison 1 means after decimal point
insert into courses_updated(CourseName,CourseDurationMonths,CourseFee) values("Complete Excel Mastery",2.54,1499);
insert into courses_updated(CourseName,CourseDurationMonths,CourseFee) values("SQL Mastery Bootcamp",1.5,2499);
insert into courses_updated(CourseName,CourseDurationMonths,CourseFee) values("Complete DSA for Interview",3.4,5499);
insert into courses_updated(CourseName,CourseDurationMonths,CourseFee) values("Statistics for Data Science",4.5,2499);
select * from courses_updated;

-- update the coursefee ofcomplete Dsa for interview to 4999
update courses_updated set coursefee = 4999 where courseid = 3;


-- to get update timesatmps for every updates
create table courses_updated_again(
	CourseId int auto_increment,
    CourseName varchar(50),
    CourseDurationMonths decimal(3,1),
    CourseFee double,
    changed_at timestamp default now() on update now(),
    primary key(CourseId)
);
insert into courses_updated_again(CourseName,CourseDurationMonths,CourseFee) values("Complete Excel Mastery",2.54,1499);
insert into courses_updated_again(CourseName,CourseDurationMonths,CourseFee) values("SQL Mastery Bootcamp",1.5,2499);
insert into courses_updated_again(CourseName,CourseDurationMonths,CourseFee) values("Complete DSA for Interview",3.4,5499);
insert into courses_updated_again(CourseName,CourseDurationMonths,CourseFee) values("Statistics for Data Science",4.5,2499);

update courses_updated_again set coursefee = 6999 where courseid = 3;
select * from courses_updated_again;