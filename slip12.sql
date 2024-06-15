Section II : Relational Database Management Systems
[15 marks]
Consider the followingr Department-employee database.
create table department(dno integer primary key,dname varchar(20),city varchar(20));
insert into department values(1,'Computer Science','Shrirampur');
insert into department values(2,'Science','Pune');
insert into department values(3,'Geography','Nashik');
insert into department values(4,'Mathematics','Pune');
insert into department values(5,'Political Science','Shrirampur');

create table employee(eno integer primary key,ename varchar(20),salary money,dno int references department);
insert into employee values(101,'Mr.Sagar',55000,1);
insert into employee values(201,'Mr.Himanshu',65000,2);
insert into employee values(301,'Miss.Priyanka',70000,2);
insert into employee values(401,'Mr.Shrisairaj',25000,3);
insert into employee values(501,'Mr.Krushna',45000,4);
insert into employee values(601,'Mr.Varad',55000,3);
insert into employee values(701,'Mr.Nilesh',65000,5);
insert into employee values(801,'Mr.Pranav',70000,2);
insert into employee values(901,'Mr.Ganesh',25000,3);

Department and Employee are related with a one to many relationship

i.Write a function to accept department city as input and returns
the total number of departments in that city.
query:-
create or replace function sp121(d_name department.dname%type)returns int
as
$$
DECLARE
c1 int;
BEGIN
select count(dname) into c1 from department where city=d_name;
return c1;
END;
$$
language plpgsql;

ii.Write a cursor to display the department-wise names of
employees whose salary is between 50000 and 70000.
create or replace function sp122()returns void as
$$
DECLARE
   c1 cursor for select dname,salary from employee,department
   where department.dno=employee.dno
   and salary>'50000' and salary<'70000';
   d1 department.dname%type;
   e1 employee.salary%type;
BEGIN
   open c1;
   loop
    fetch c1 into d1;
    exit when not found;
    fetch c1 into e1;
    exit when not found;
    raise notice'%',d1;
    raise notice'%',e1;
   end loop;
   close c1;
   END;
   $$
language plpgsql;

iii.Write a trigger before inserting an employee record in the
Employee table. Raise an exception if salary < 0.
create or replace function sp123()returns trigger as
$$
declare
begin
 if(new.salary<'0')then 
 Raise exception'Salary cannot be less than zero...!!!';
end if;
return new;

end;
$$
language plpgsql;

create trigger s31
before insert on employee
for each row
execute procedure sp123();
insert into employee values(100,'Mr.Sagar','-9',1);