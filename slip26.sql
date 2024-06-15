create table CAR(c_no int primary key,owner varchar(20),
model text,colour text);

insert into CAR values(101,'OM','Ertiga','White');
insert into CAR values(102,'Sai','SUV700','White');
insert into CAR values(103,'Ram','Ertiga','RED');

create table driver(driver_no int primary key,
driver_name text,lic_no int,address text,age int,sal int);

insert into driver values(1,'aman',1111,'pune',30,9000);
insert into driver values(2,'sham',2222,'mumbai',40,12000);
insert into driver values(3,'aba',3333,'shirdi',35,15000);

create table CD(c_no int references CAR,driver_no int references driver);

insert into CD values(101,1);
insert into cD values(102,2);
insert into cD values(103,3);
insert into cD values(103,1);


Q1]Write a function which accepts the driver name and counts the
number of cars driven by the driver.
query
create or replace function f17(name1 varchar(20))returns int as
$$
DECLARE
ri int; 
BEGIN
 select count(model) into ri from car,driver,cd where car.c_no=cd.c_no and driver.driver_no=cd.driver_no and driver_name=name1;
return ri;
END;
$$
language plpgsql;


Q2]
Query
create or replace function f8(cname varchar(10))returns void as
$$
DECLARE
BEGIN
END;
$$
language plpgsql;


Q3]Write a trigger before insert/update on Driver. Raise exception if
driver salary is negative or zero
Query
create or replace function f18()returns trigger as
$$
DECLARE
BEGIN
 if(new.sal<=0)then
   raise exception'Salary cannot be less than  or equal zero';
   return new;
   end if;
END;
$$
language plpgsql;
create trigger t18
before insert or delete on driver
for each row
execute procedure f18();
