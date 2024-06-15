
create table Department(dno int primary key,dname varchar(10) not null,city varchar(10));

create table employee(eno int primary key,ename varchar(10) not null,salary int check(salary>0),dno int references Department);

insert into department values(101,'computer','pune');
insert into department values(102,'account','mumbai');
insert into department values(103,'HR','pune');

insert into employee values(1,'om',50000,101);
insert into employee values(2,'sai',40000,101);

insert into employee values(3,'ram',70000,102);
insert into employee values(4,'sham',24000,102);

insert into employee values(5,'aba',40000,103);
insert into employee values(6,'baba',25000,103);


q1]Write a function to accept department name and display the
average salary of employees in that department.
query
select avg(salary) into r1 from employee,department where department.dno=employee.dno
and dname='computer';

create or replace function f6(dname1 department.dname%type)returns int as
$$
declare
 r1 employee.salary%type;
begin
  select avg(salary) into r1 from employee,department where department.dno=employee.dno
and dname=dname1;
return r1;
end;
$$
language plpgsql;

Q2]
Write a cursor to display the names of employees who works in
“HR” department.
create or replace function f7()returns void as
$$
declare
 r1 employee%rowtype;
 c1 cursor for select * from employee as e,department as d
 where e.dno=d.dno
 and dname='HR';
begin
  open c1;
   loop
    fetch c1 into r1;
    exit when not found;
    raise notice'Employee number = %',r1.eno;
    raise notice'Employee name = %',r1.ename;
    raise notice'Employee salary = %',r1.salary;
    raise notice'Employee Department number = %',r1.dno;
   end loop;
  close c1;
end;
$$
language plpgsql;





