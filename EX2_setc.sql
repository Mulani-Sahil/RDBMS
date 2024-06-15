Person (pno int, name varchar (20), birthdate date, income money)
Area (aid int, aname varchar (20), area_type varchar (5) )
The person and area related to many to one relationship. The attribute ‘area_type’ can have
values either ‘urban’ or ‘rural’.
Create the above database in PostGreSQL and insert sufficient records.
a. Write a cursor to accept a month as an input parameter from the user and display the
names of persons whose birthday falls in that particular month.
b. Write a cursor to display the names of persons living in urban area.
c. Write a cursor to print names of all persons having income between50000 and 100000.

create table area(aid int primary key,aname varchar(20),area_type varchar(20));
insert into area values(101,'pune','urban');
insert into area values(102,'Khanapur','rural');
insert into area values(103,'belapur','rural');
insert into area values(104,'mumbai','urban');

create table person(pno int primary key,pname varchar(20),birthdate date,income money,aid int references area);
insert into person values(1,'om','2000-10-15',30000,101);
insert into person values(2,'sai','2001-8-11',40000,102);
insert into person values(3,'ram','2000-3-13',50000,102);
insert into person values(4,'sham','2001-8-11',34000,103);
insert into person values(5,'aman','2001-8-11',44000,103);
insert into person values(6,'aba','2001-8-11',35000,104);
insert into person values(7,'dad','2001-8-11',35000,104);

a. Write a cursor to accept a month as an input parameter from the user and display the
names of persons whose birthday falls in that particular month.
create or replace function month(m int)returns void 
as
$$
declare
  t_name person.pname%type;
  c1 cursor from select pname from person where extract(month from birthdate)=m;
begin
  open c1;
 loop
  fetch c1 into t_name;
  exit when not found;
  raise notice'person name=%',t_name;
 end loop;
end;
$$
language plpgsql;

b. Write a cursor to display the names of persons living in urban area.
ans:-
DO $$
DECLARE
 p_pname person.pname%type;
 c1 cursor for select pname from area,person where area.aid=person.aid and area_type='urban';
begin
 open c1;
 loop
  fetch c1 into p_pname;
  exit when not found;
  raise notice'Person name=%',p_pname;
 end loop;
 close c1;
 END;
 $$
 language plpgsql; 

c. Write a cursor to print names of all persons having income between50000 and 100000.
ans:-
 DO $$
 DECLARE
  p_name person.pname%type;
  c1 cursor for select pname from person where income>='35000' and income<='45000'; 
 BEGIN
  open c1;
   loop
   fetch c1 into p_name;
   exit when not found;
   raise notice'Pname is %',p_name;
   end loop;
     close c1;
END;
$$
language plpgsql; 

