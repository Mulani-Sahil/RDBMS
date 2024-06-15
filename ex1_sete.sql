SET E
Student - Subject Database
Consider the following database
create  table student1(rno integer primary key,sname varchar(30),address varchar(50),class varchar(10));
insert into student1 values(1,'Tiger','Shrirampur','fy');
insert into student1 values(2,'Lion','Pune','sy');
insert into student1 values(3,'Zebra','Malegaon','ty');

create table subject(scode varchar(10) primary key,subject_name varchar(20));
insert into subject values(101,'Rdbms');
insert into subject values(102,'Advance C');
insert into subject values(103,'Bootstrap');
insert into subject values(104,'English');
insert into subject values(105,'OE');

create table ss(rno integer references student,scode varchar(10) references subject,marks_scored int);
insert into ss values(1,101,78);
insert into ss values(1,102,85);
insert into ss values(1,103,96);
insert into ss values(1,104,54);
insert into ss values(1,105,66);
insert into ss values(2,101,78);
insert into ss values(2,102,96);
insert into ss values(2,103,88);
insert into ss values(2,104,66);
insert into ss values(2,105,75);
insert into ss values(2,101,71);
insert into ss values(2,102,36);
insert into ss values(2,103,56);
insert into ss values(2,104,89);
insert into ss values(2,105,78);

a.Write a function which will accept the roll no and print all thedetails of that student.
ans:-
create or replace function E1(rno1 int)returns void as
  $$
  declare
   r1 student1%rowtype;
  begin
   select * into r1 from student1  where rno=rno1;
   raise notice'Roll no=%',r1.rno;   
   raise notice'Name=%',r1.sname;   
   raise notice'Address=%',r1.address;   
   raise notice'class=%',r1.class;   
  end;
$$
language plpgsql;

b. Write a function to accept student name as input and displays details of that student.
ans:-
create or replace function E2(sname1 student1.sname%type)returns void as
  $$
  declare
   r1 student1%rowtype;
  begin
   select * into r1 from student where sname=sname1;
   raise notice'Roll no=%',r1.rno;   
   raise notice'Name=%',r1.sname;   
   raise notice'Address=%',r1.address;   
   raise notice'class=%',r1.class;   
  end;
$$
language plpgsql;
select E2('Lion');
c. Write a stored function using cursors, to accept class from the user and display the details of
the students of that class.
ans:-
create or replace function E3(class1 student1.class%type)returns void as
$$
 declare
  r1 student1%rowtype;
 c1 cursor for select * from student1 where class=class1;
begin
  open c1;
    loop
   fetch c1 into r1;
   exit when not found;
    raise notice'Roll no=%',r1.rno;   
    raise notice'Name=%',r1.sname;   
    raise notice'Address=%',r1.address;   
    raise notice'class=%',r1.class;   
  end loop;
  close c1;
end;$$
language plpgsql;
select E3('fy');