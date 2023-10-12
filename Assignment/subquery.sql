create database subquery;
use subquery;
create table department(
DID varchar(50),
Dname varchar(50),
Dhead varchar(50),
Dlocation varchar(50),
Dranking varchar(50),
primary key(DID)
);

insert into department(DID,Dname,Dhead,Dlocation,Dranking) values("3006", "HR","Hellen","California","6");

create table employee(
EmployeeID varchar(50),
Ename varchar(50),
Position varchar(50),
Salary int (15),
Dept varchar(50),
primary key(EmployeeID),
foreign key(Dept) references department(DID)
);

insert into employee(EmployeeID,Ename,Position, Salary,Dept) values("1008","Fluer","Clerk", "1200", "3004");

select Ename from employee where Dept = (select DID from department where Dlocation = "Texas");

Create table EmployeesInCalifornia(
EmployeeID varchar(50),
Ename varchar(50),
Postion varchar(50),
Salary int (15),
primary key(EmployeeID)
);

insert into EmployeesInCalifornia select EmployeeID, Ename,  Position, Salary from employee where Dept in (select DID from department where Dlocation = "California");

update employee set salary = salary + salary * 0.1 where Dept = (select DID from department  where Dranking = 1 );


