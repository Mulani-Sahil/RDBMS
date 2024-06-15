create table Customer (cno integer primary key, cname varchar(20), city varchar(20));
insert into customer values(101,'Ram','Pune');
insert into customer values(102,'Om','Nagar');

create table Account (a_no int primary key, a_type varchar(10),opening_date  date, balance money,cno int references customer);
insert into Account values(1,'saving','2004-03-31','5753554',101);
insert into Account values(2,'current','2004-03-31','5753554',101);
insert into Account values(3,'saving','2004-03-31','5753554',102);

Q1]Write a function which accepts customer name as input and counts
the total number of accounts of that customer.

query
create or replace function f19(cname1 varchar(50))returns int as
$$
DECLARE
 r int;
BEGIN
 select count(*) into r from customer,account where customer.cno=account.cno and cname=cname1;
 return r;
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


Q3]Write a trigger which does not allow deletion of accounts of
type.
Query
create or replace function f8(cname varchar(10))returns void as
$$
DECLARE
BEGIN
END;
$$
language plpgsql;
