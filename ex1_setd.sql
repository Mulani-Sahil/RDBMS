SET D
Project – Employee Database

create table project(pno int primary key,pname varchar(30),ptype varchar(20), duration_years int);
insert into project values(1,'Robotics','Tech',5);
insert into project values(2,'Medcare','Medical',2);
insert into project values(3,'Machine learning','Ai',4);
insert into project values(4,'Headset','wearables',2);
insert into project values(5,'watch','wearables',2);
insert into project values(6,'Data science','Ai',3);


create table employee(empno int primary key,ename varchar(20),joining_date date);
insert into employee values(101,'Apple','2022-12-19');
insert into employee values(102,'Mango','2021-02-17');
insert into employee values(103,'Banana','2023-02-09');
insert into employee values(104,'Grapes','2021-02-19');
insert into employee values(105,'Orange','2020-12-29');

create table pe(pno int references project,empno int references employee,start_date date);
insert into pe values(1,101,'2023-08-1');
insert into pe values(2,104,'2024-09-2');
insert into pe values(3,102,'2023-07-3');
insert into pe values(4,101,'2025-05-4');
insert into pe values(2,105,'2024-11-20');
insert into pe values(5,102,'2022-08-15');
insert into pe values(1,105,'2023-08-26');
insert into pe values(2,103,'2025-08-30');
insert into pe values(6,102,'2023-08-29');
insert into pe values(5,101,'2025-07-20');
insert into pe values(1,104,'2026-08-19');

a. Write a stored function to accept project type as an input and display all project names of
that type.
ans:-
create or replace function disp_pname(ptype1 project.ptype%type)returns void
as
$$
declare
  c1 cursor for select pname from project where ptype=ptype1;
  pname1 project.pname%type;
begin
   open c1;
    loop
     fetch c1 into pname1;
     exit when not found;
        raise notice'Product Name is %',pname1;
    end loop;
   close c1;
  end;
$$
language plpgsql;  


b. Write a function which accepts employee name and prints the details of the project which
the employee works on.
ans:-
create or replace function disp_details(ename1 employee.ename%type)returns void as
$$
declare
p_details project%rowtype;
   c1 cursor for 
   select project.* from project,employee,pe
   where project.pno=pe.pno
   and employee.empno=pe.empno
   and ename=ename1;
begin
   open c1;
     loop
       fetch c1 into p_details;
       exit when not found;
       raise notice'Project no=%',p_details.pno;
       raise notice'Project name=%',p_details.pname;
       raise notice'Project Type=%',p_details.ptype;
       raise notice'Project Duration=%',p_details.duration_years;
       raise notice'  ';
     end loop;
   close c1;
end;
$$
language plpgsql;



c. Write a function to accept project name as input and returns the number of employees
working on the project.
ans-
create or replace function cnt_emp(pname1 project.pname%type)returns int as
$$
declare
 cnt int;
 begin
  select count(ename) into cnt from employee,project,pe where project.pno=pe.pno and employee.empno=pe.empno and pname=pname1;
return cnt;
 end;
 $$
 language plpgsql; 


create or replace function cnt_emp(pname1 project.pname%type)returns int as
$$
declare
 cnt int;
 begin
  select count(ename) into cnt from employee,project,pe where project.pno=pe.pno and employee.empno=pe.empno and pname=pname1;
  raise notice'number of employees working in % is %',ename1,cnt;
 end;
 $$
 language plpgsql; 
