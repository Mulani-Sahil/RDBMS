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


Q1]Write a trigger before inserting the teacher record into a teacher
table. Experience should be a minimum of 4 years. If it is less than 4
years trigger gets fired and displays an appropriate message.
query
create or replace function f12()returns trigger as
$$
DECLARE
BEGIN
 if(new.experience<4)then
  raise exception'Experience shold be greater than zero..';
  end if;
END;
$$
language plpgsql;

create trigger t12
before insert on teacher
for each row
execute procedure f12();

Q2] Write a cursor to accept the student name from the user as an input
and give list of subjects taken by the student.

Query
create or replace function f13(Sname1 varchar(50))returns void as
$$
DECLARE
r1 st.subject%type;
c1 cursor for select subject from student,st where student.roll_no=st.roll_no and sname=sname1;
BEGIN
 open c1;
 loop
 fetch c1 into r1;
 exit when not found;
 raise notice'%',r1;
 end loop;
 close c1;
END;
$$
language plpgsql;



