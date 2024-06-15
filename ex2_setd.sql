EX-2 SETD
SET D
Student – Competition Database
Consider the following entities and their relationship.
Student (s_reg_no, s_name, s_class)
Competition (comp_no, comp_name, comp_type)
Relationship between Student and Competition is many-to-many with descriptive attribute rank
and year.
create table student(s_reg_no int primary key,s_name varchar(50),s_class varchar(20) check(s_class in('fy','sy','ty')));
insert into student values(1,'Sahil','fy');
insert into student values(2,'Sagar','sy');
insert into student values(3,'Krushna','ty');

create table competition(comp_no int primary key,comp_name varchar(20),comp_type varchar(20));
insert into competition values(101,'Dance','National');
insert into competition values(102,'Drawing','State');
insert into competition values(103,'Boxing','National');

create table sc(s_reg_no int references student,comp_no int references competition,rank varchar,year int);
insert into sc values(1,101,'first',2019);
insert into sc values(1,103,'second',2018);
insert into sc values(2,101,'third',2019);
insert into sc values(2,102,'first',2017);
insert into sc values(3,103,'first',2019);
insert into sc values(3,105,'first',2020);

a) Write a cursor which will display year wise details of competitions held. (Use
parameterized cursor)


b) Write a cursor which will display student wise total count of competition participated.
DO
$$
declare 

ci cursor for select s_name,count(*) fro student,competition,sc where student.s_reg_no=sc.s_reg_no and competition.comp_no=sc.comp_no group by s_name;
begin
open cursor;
 loop
  fetch c1;
  exit when not found;
raise notice'%',c1
 end loop;
close cursor;
END;
$$
language plpgsql;