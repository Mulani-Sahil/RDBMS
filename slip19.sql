create table Area (aid int primary key, aname varchar(20),area_type varchar(5));
insert into area values(101,'Shivaji Road','Rural');
insert into area values(102,'Mj Road','Rural');
insert into area values(103,'Main Road','Urban');

create table Person(pno int primary key,name varchar(20),birthdate date,income money,aid int references area);

insert into Person values(1,'Shivaji','2009-05-01',1000,101);
insert into Person values(2,'Adii','2020-05-01',25000,101);
insert into Person values(3,'Karan','2006-04-04',4500,102);
insert into Person values(4,'Krish','2016-06-30',26000,102);
insert into Person values(5,'Sagar','2010-07-11',45000,103);
insert into Person values(6,'Sahil','2030-11-21',3600,103);


Q1]Write a stored function to update the income of all persons living in
rural area by 10%.
query
create or replace function f14()returns void as
$$
DECLARE
BEGIN
 update person set income=income+income*0.1;
END;
$$
language plpgsql;

END;
$$
language plpgsql;


Q2]Write a trigger before deleting a person record from the persons
table. Raise a notice and display the message “person record is being
deleted”.
Query
create or replace function f15()returns trigger as
$$
DECLARE
BEGIN
 raise notice'Person record is being deleted';
 return old;
END;
$$
language plpgsql;
create trigger t15
before delete on person
for each row
execute procedure f15();

Q3]Write a cursor to display the names of persons living in urban area.
Query
create or replace function f16()returns void as
$$
DECLARE
 c1 cursor for select name from person,area where area.aid=person.aid and area_type='Urban';
 r1 person.name%type;
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
