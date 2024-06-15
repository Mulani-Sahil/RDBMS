create table project(pno integer primary key,pname varchar(30),ptype varchar(20),duration integer);
insert into project values(1,'Zenith Solutions','Business Consulting',3);
insert into project values(2,'EcoHarvest','Agriculture',5);
insert into project values(3,'SwiftServe','Technology',4);
insert into project values(4,'HealthTrack','Healthcare',6);
insert into project values(5,'GreenGenie','Renewable Energy',3);

create table emp(eno integer primary key,ename varchar(20),qualification varchar(15),salary float,joining_date date
insert into emp values(101,'Sagar','bbaca',25000,'2022-01-09');
insert into emp values(102,'Sahil','bcs',35000,'2023-01-09');
insert into emp values(103,'Krushna','mbbs',15000,'2022-12-09');
insert into emp values(104,'Himanshu','bds',75000,'2024-02-29');
insert into emp values(105,'Sairaj','Phd Maths',6300,'2021-01-09');
insert into emp values(106,'nobody','Pilot',100020,'2019-06-09');

create table ep(eno int references emp,pno int references project,start_date date,no_of_hours_worked int);
insert into ep values()

Relationship between Project and Employee is many to many with descriptive attribute start_date,
no_of_hours_worked.
Q 2) A Create the above database in PostGreSQL and insert sufficient records.
[5 marks]
B Execute Any two of the following using PL/pgSQL
[10 marks]
i. Write a function to accept project name as input and returns the
number of employees working on the project.
ii. Write a cursor to display all projects having duration > ____.
iii. Write a trigger before insert or update on no_of_hours field. If the
no_of_hours_worked is less than zero then raise an exception and
display the appropriate message.
