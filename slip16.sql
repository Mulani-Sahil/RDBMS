mant to many

create table student(Roll_No int primary key, Sname varchar (20), Sclass char (10)check (Sclass in('fy','sy','ty')));

create table teacher(tno int primary key,tname varchar(10),experience numeric(5));
 
create table st(Roll_No int references student,tno int references teacher,subject text);
 
insert into student values(1,'sham','fy');
insert into student values(2,'ram','sy');
insert into student values(3,'aman','sy');
insert into student values(4,'sai','ty');

insert into teacher values(11,'Mr.sai',12);
insert into teacher values(22,'Mr.patil',4);
insert into teacher values(33,'Mrs.shinde',7);
insert into teacher values(44,'Mrs.pawar',11);

insert into st values(1,11,'DBMS');
insert into st values(2,22,'COMPUTER');
insert into st values(3,33,'DBMS');
insert into st values(4,44,'DBMS');



mant to many

create table student(Roll_No int primary key, Sname varchar (20), Sclass char (10)check (Sclass in('fy','sy','ty')));

create table teacher(tno int primary key,tname varchar(10),experience numeric(5));
 
create table st(Roll_No int references student,tno int references teacher,subject text);
 
insert into student values(1,'sham','fy');
insert into student values(2,'ram','sy');
insert into student values(3,'aman','sy');
insert into student values(4,'sai','ty');

insert into teacher values(11,'Mr.sai',12);
insert into teacher values(22,'Mr.patil',4);
insert into teacher values(33,'Mrs.shinde',7);
insert into teacher values(44,'Mrs.pawar',11);

insert into st values(1,11,'DBMS');
insert into st values(2,22,'COMPUTER');
insert into st values(3,33,'DBMS');
insert into st values(4,44,'DBMS');

Q1]Write a trigger before insert the record of the student in the Student
table. If the Roll_No is less than or equal to zero then the trigger 
gets fired and displays the message “Invalid Roll Number”.
query
create or replace function f11()returns trigger as
$$
DECLARE
BEGIN
 if(new.roll_no<=0)then
  raise exception'Invalid Roll_no';
 end if;
END;
$$
language plpgsql;

create trigger t11
before insert on student
for each row
execute procedure f11();


Q2]Write a cursor to accept the students name from the user as an
input and display names of all teachers teaching that student.
Query:-
create or replace function f8(cname varchar(10))returns void as
$$
DECLARE
BEGIN
END;
$$
language plpgsql;


Q3]Write a stored function to count the number of teachers having
experience > 10 years

Query
create or replace function f8(cname varchar(10))returns void as
$$
DECLARE
BEGIN
END;
$$
language plpgsql;


