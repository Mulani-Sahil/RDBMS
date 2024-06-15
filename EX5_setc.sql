SET C
create table student(rno int primary key,name varchar(20),addr varchar(20),class varchar(10));

insert into student values(101,'om','pune','fybcs');
insert into student values(102,'sai','shirdi','sybcs');
insert into student values(103,'ram','shrirampur','tybcs');
insert into student values(104,'sham','mumbai','mcs');
insert into student values(105,'sunder','nager','fybcs');

create table subject(sno int primary key,scode varchar(10),subname varchar(20));

insert into subject values(201,'01AA','mathematics');
insert into subject values(202,'02BB','datastructure');
insert into subject values(203,'03CC','rdbms');
insert into subject values(204,'04DD','statestic');
insert into subject values(205,'05EE','english');

create table stud_sub(rno int references student,sno int references subject,marks int);
 
insert into stud_sub values(101,201,45);
insert into stud_sub values(101,201,20);
insert into stud_sub values(101,201,60);
insert into stud_sub values(101,201,70);
insert into stud_sub values(101,201,90);

a. Write a trigger before insert/update the marks_scored. Raise exception if Marks are
negative.
ans:-
  create or replace function marks_negative()returns trigger as
  $$
  declare
  begin
   if(new.marks<0)then
     raise exception'Marks in nagative are not allowed..!!!!!!!!';
   end if;
   return new;
  end;
  $$
  language plpgsql;

create trigger e5sc
before insert or delete on stud_sub
for each row
execute procedure marks_negative();


b. Write a trigger which is executed when insertion is made in the student-subject table. If
marks_scored is less than 0, give appropriate message and do not allow the insertion.
ans:-
  create or replace function marks_zero()returns trigger as
  $$
  declare
  begin
   if(new.marks=0)then
     raise exception'Marks zero is not allowed..!!!!!!!!';
   end if;
   return new;
  end;
  $$
  language plpgsql;

create trigger e5scb
before insert or delete on stud_sub
for each row
execute procedure marks_zero();

c. Write a trigger which will prevent deleting students from ‘Pune’ city.
ans:-
create or replace function delete_stud11()returns trigger as
$$
declare
begin
  raise exception'Data can not be deleted......!!!! ';
end;
$$
language plpgsql;  

create trigger e5scc3
before delete on student
for each row
execute procedure delete_stud();   