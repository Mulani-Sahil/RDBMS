mant to many
create table student (sno int primary key,sname varchar(30),sclass varchar(10), saddrs varchar(50));

create table teacher(tno int primary key,tname varchar(30),qualification varchar(10), experience int);

create table ST(sno int references student,tno int references teacher,subject varchar(20));

insert into student values (101,'om','FY','Pune');
insert into student values (102,'sai','FY','Pune'); 
insert into student values (103,'ram','SY','Pune');

insert into teacher values (01,'Mr.Joshi','Bsc',3);
insert into teacher values (02,'Mr.Navle','Ph.D',5);
insert into teacher values (03,'Mrs.Joshi','BCA',2);

insert into ST values (101,01, 'DS');
insert into ST values (101,02, 'PHP');
insert into ST values (101,01, 'RDBMS');
insert into ST values (101,03, 'DBMS');
insert into ST values (102,01, 'DS');
insert into ST values (102,01, 'Java');
insert into ST values (102,02, 'PHP');
insert into ST values (102,02, 'DBMS');
insert into ST values (103,01, 'DBMS');
insert into ST values (103,01, 'RDBMS');
insert into ST values (103,03, 'DS');
a)most expre teacher of math
= create or replace function teach()returns void as
$$
declare
t_name teacher.tname%type;
 begin 
  select tname into t_name from st,teacher as t where t.tno=st.tno
    and experience=(select max(experience) from teacher) and 
    subject='DBMS'; 
    raise notice'Most exprience teacher in dbms=%',t_name;

end; $$ 
language plpgsql;

b) Write a function to find the teacher teaching maximum number of subjects.
select tname from teacher,st where teacher.tno=st.tno and subject=(select max(subject) from st);


= create or replace function max_tech()returns void as
  $$
declare
 t_name teacher.tname%type;
begin
 select tname into t_name from teacher,st where teacher.tno=st.tno and subject=(select max(subject) from st);
 raise notice'teacher teaching maximum subject is=%',t_name;
 end;
 $$
 language plpgsql;

c) Write a function to find the number of teachers having qualification “Ph.D.”.
 
  create or replace function tea()returns int as
 $$
 declare
  cnt int ;
 begin
  select count(*) into cnt from teacher where qualification='Ph.D';
  return cnt;
end;
$$
language plpgsql;

select tea();
