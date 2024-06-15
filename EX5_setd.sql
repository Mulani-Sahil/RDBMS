SET D
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

a. Write a trigger which is executed whenever update is made to the account table. If the
balance becomes less than 1000, print anerror message that balance cannot be less than
1000.
ans:-
create or replace function e5sd1()returns trigger as
$$
declare
begin
 if(new.balance<1000)then
   raise exception'Balance cannot be less than zero....!!!';
 end if;
 return new;
end;
$$
language plpgsql;  

create trigger e5sd1t
before update on account
for each row 
execute procedure e5sd1(); 

b. Write a trigger before deleting an account record from Account table. Raise a notice and
display the message “Account record is being deleted.”
ans:-
create or replace function e5sd2()returns trigger as
$$
declare
begin
  raise exception'Account record is being deleted...............!!!!!!!!';
end;
$$
language plpgsql;

create trigger e5sd2t
before delete on account 
for each row
execute procedure e5sd2();

c. Write a trigger before inserting an account record in Accounttable and raise exception if
balance is <500.
ans:-
create or replace function e5sd3()returns trigger as
$$
declare
begin
 if(new.balance<500)then
   raise exception'Balance should br greater than 500....!!!';
 end if;
 return new;
end;
$$
language plpgsql;  

create trigger e5sd3t
before insert on account
for each row 
execute procedure e5sd3(); 
 
