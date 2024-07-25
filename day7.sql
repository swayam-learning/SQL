-- delete v/s drop
-- drop --> is a DDL command
-- delete --> is a DML command
-- prmiary key should be unique and not null 
-- unique key is to be unique and can be null(there is no restriction)
use sqlbootcamp;
create table courses(
	CourseId int primary key auto_increment,
    CourseName varchar(50),
    CourseDurationMonths int,
    CourseFee double
);
desc courses;
insert into courses(CourseName,CourseDurationMonths,CourseFee) values("Complete Excel Mastery",2,1499);
insert into courses(CourseName,CourseDurationMonths,CourseFee) values("SQL Mastery Bootcamp",1,2499);
insert into courses(CourseName,CourseDurationMonths,CourseFee) values("Complete DSA for Interview",3,5499);
select * from courses;

create table Learners(
	LearnerID int auto_increment,
    LearnerFirstName varchar(50) not null,
    LearnerLastName varchar(50) not null,
    LearnerPhoneNo varchar(15),
    LearnerEmailId varchar(50),
    SelectedCourse int not null,
	LearnerEnrollmentDate timestamp not null,
    YearsOfExperience int not null,
    LearnerComapny varchar(50),
    SourceOfJoining varchar(50) not null,
    BatchStartDate timestamp not null,
    Location varchar(50) not null,
    primary key(LearnerID),
    unique key (LearnerEmailId),
    foreign key(SelectedCourse) references courses(CourseId)
);
desc learners;
-- insert the learners details in the learners table
insert into learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailId,LearnerEnrollmentDate,SelectedCourse,YearsOfExperience,LearnerComapny,SourceOfJoining,BatchStartDate,Location)
values("Akash", "Mishra", '9998887776', "akash@gmail.com", '2024-01-21', 1, 4, "Amazon", "LinkedIn", '2024-02-29', "Bengaluru"),
	  ("Rishikesh","Joshi","9950192388", "carjkop@gmail.com", '2024-03-19', 3, 2, "HCL", "Youtube", '2024-03-25', "Chennai"),
      ("Jeevan","Hegde", "9657856732","jeevanhegdek@yahoo.co.in", '2024-01-15', 2, 0, "", "Linkedin", '2024-01-16', "Noida"),
      ("Akhil","George","7689558930", "akhil.george.8743@gmail.com", '2024-03-13', 3, 4, "Accenture", "Community", '2024-03-25', "Bengaluru"),
      ("Sidhish","Kumar","6475765443", "sidhishkumar@gmail.com",'2024-01-10', 1, 4, "Meta", "Youtube", '2024-03-29', "Bengaluru"),
      ("NagaSai","Sreedhar","9182937061", "saisreedhar2001@gmail.com", '2024-03-17', 3, 4, "TCS", "Community", '2024-03-25', "Mumbai");
insert into learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailId,LearnerEnrollmentDate,SelectedCourse,YearsOfExperience,LearnerComapny,SourceOfJoining,BatchStartDate,Location)
values("Akash", "Mishra", '9998887776', "akash1@gmail.com", '2024-01-21', 1, 4, "Amazon", "Youtube", '2024-02-27', "Bengaluru");

select * from learners;
-- Data Analysis [employee,learners,course]
-- 1. Record of the employee getting highest salary
-- order by --> sorting the data points ,default ascending order
select * from employee1 
order by salary desc
limit 1; 
-- command-flow >>> from --> select --> order by --> limit
select max(salary) as max_salary from employee1;

-- 2. Records of the employee getting highest salary and age is greater than 25
select * from employee1 where age > 22 order by salary desc limit 1 ;
-- command flow >> from --> where --> select --> order by --> limit

-- 3. Display the number of enrollments in the website of courses
select count(*) as num_of_enrollments from learners;

-- 4. Display the no of enrollments for the course id = 3(SQL Mastery Bootcamp)
select count(*) as num_of_3 from learners where selectedcourse =3;
-- inside the count we should put the primary key

-- 5. count the number of learners enrolled in the month of january
select count(*) as jan_enrollment from learners where LearnerEnrollmentDate like "%-01-%";

-- 6. update jeevan data with years of experience as 1 year and comapnys as amazon
update learners set YearsOfExperience=1 , LearnerComapny='Amazon' where learnerid =3;
select * from learners;
-- In SQL, the SET clause in an UPDATE statement requires assignments to be separated by 
-- commas rather than using the logical operator AND. The AND operator is used in the WHERE clause to combine multiple conditions.

-- 7. Count the number of companies where learneers currently doing their job
select count(Distinct learnercomapny) as distinct_companies from learners;
