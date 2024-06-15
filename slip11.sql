Consider the following Customer- Account database.

Customer (cno integer, cname varchar(20), city varchar(20))
Account (accno integer, acc_type varchar(10), opening_date date, balance money)
create table customer(cno integer primary key,cname varchar(20),city varchar(20));
insert into customer values(1001,'Om','Shrirampur');
insert into customer values(1002,'Om','Shrirampur');
insert into customer values(1003,'Om','Shrirampur');
insert into customer values(1004,'Om','Shrirampur');
insert into customer values(1005,'Om','Shrirampur');

create table account(a_no int primary key,a_type varchar(10),opening_date date,balance money,cno int references customer);
insert into account values(1101,'saving','19-12-2023','150000',1001);
insert into account values(2102,'current','12-11-2024','50000',1002);
insert into account values(3103,'current','11-09-2024','100000',1002);
insert into account values(4104,'saving','29-02-2024','15000',1004);
insert into account values(5105,'saving','23-04-2022','110000',1005);

i.Write a function to display the number of accounts whose
opening date is before’03/07/2015’.
query:-
create or replace function sp111()returns void as
$$
declare
c1 int;
begin
 select a_no into c1 from account where opening_date='23-04-2022';
 raise notice'Account nunber=%',c1;
  end;
 $$
language plpgsql;

ii.Write a cursor to display the account details of all customers
from “Pune” city.
query:-
create or replace function sp112()returns void as
$$
declare
c1 cursor for select account.* from account,customer
where customer.cno=account.cno
and city='Shrirampur';
d1 account%rowtype;
begin
open c1;
loop
 fetch c1 into d1;
 exit when not found;
 raise notice'a_no=%',d1.a_no;
 raise notice'a_type=%',d1.a_type;
 raise notice'opening_date=%',d1.opening_date;
 raise notice'balance=%',d1.balance;
 raise notice'cno=%',d1.cno;
end loop;
close c1;
end;
$$
language plpgsql;

iii.Write a trigger before deleting an account record from Account
table. Raise a notice and display the message “Account record is
being deleted.”
create or replace function sp113()returns trigger as
$$
declare
begin
 Raise notice'Account record is being deleted';
return old;
end;
$$
language plpgsql;

create trigger s3
before delete on account
for each row
execute procedure sp113();



