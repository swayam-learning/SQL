use sqlbootcamp;
select database();
create table employee1(
	Employee_ID int primary key not null auto_increment,
    FirstName varchar(50) ,
    LastName varchar(50) ,
    Age int ,
    Salary float,
    Location varchar(50)
    );
show tables;
select * from employee1;
desc employee1;
insert into employee1(FirstName,LastName,Age,Salary,Location) values ("swayam","barik",22,200000,"Bangalore");
insert into employee1(FirstName,LastName,Age,Salary,Location) values ("akhil","george",23,100000,"Gurugram");
insert into employee1(FirstName,LastName,Age,Salary,Location) values ("Kanesha","brownie",22,300000,"UK");
insert into employee1(FirstName,LastName,Age,Salary,Location) values ("Naga","Sai",32,70000,"America");
insert into employee1(FirstName,LastName,Age,Salary,Location) values ("Megha","Mehak",25,80000,"Kozhikode");
insert into employee1(FirstName,LastName,Age,Salary,Location) values ("Yashi","Gangubai",22,20000,"Chennai");

-- employee details whose salary is more than 100000
select firstname,lastname from employee1 where salary > 100000;

-- flow of code --> from --> where --> select
-- records of the employee having age more than 25

select * from employee1 where age>25;
-- update v/s alter
-- update is DML and Alter is DDl
-- update --> update the record inside the table
-- alter ---> is used to update the schema of the table
-- Q.s. update the last name of swayam to swarup
update employee1 set lastname="swarup" where employee_id=1;

-- delete the record emplpyee id 4
delete from employee1 where employee_id =4;
