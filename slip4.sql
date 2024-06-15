create table Customer (cno integer primary key, cname varchar(20), city varchar(20));
insert into customer values(101,'Ram','Pune');
insert into customer values(102,'Om','Nagar');

create table Account (a_no int primary key, a_type varchar(10),opening_date  date, balance money,cno int references customer);
insert into Account values(1,'saving','2004-03-31','5753554',101);
insert into Account values(2,'current','2004-03-31','5753554',101);
insert into Account values(3,'saving','2004-03-31','5753554',102);

1]Write a function which accepts account no as input and prints
the details of that account.
Query:-
create or replace function f3(ano1 account.a_no%type)returns void as
$$
DECLARE
  r1 account%rowtype;
BEGIN
  select * into r1 from account where a_no=ano1;
  raise notice'Account Number = %',r1.a_no;
  raise notice'Account type = %',r1.a_type;
  raise notice'Account Opening Date = %',r1.opening_date;
  raise notice'Account Balance = %',r1.balance;
  raise notice'Customer Number  = %',r1.cno;
END;
$$
language plpgsql;


2]Write a function using cursor which accepts customer name and
prints all account details of that customer. If the customer name
is invalid, print appropriate message.
query
create or replace function f4(cname1 customer.cname%type)returns void as
$$
DECLARE
c int=0;
  c1 cursor for select a.* from account as a,customer as c where c.cno=a.cno
  and cname1=cname;
  r1 account%rowtype; 
BEGIN
  open c1;
  loop
   fetch c1 into r1;
   exit when not found;raise notice'Account Number = %',r1.a_no;
  raise notice'Account type = %',r1.a_type;
  raise notice'Account Opening Date = %',r1.opening_date;
  raise notice'Account Balance = %',r1.balance;
  raise notice'Customer Number  = %',r1.cno;
    c=1;
  end loop;

  close c1;
  if(c=0)then
   raise exception'Invalid Data HAs been entered';
   end if;
END;
$$
language plpgsql;

Q3]
Write a trigger which is executed whenever update is made to
the account table. If the balance becomes less than 1000, print an
error message that balance cannot be less than 1000.

create or replace function f5()returns trigger as
$$

BEGIN
  if(new.balance<'1000')then
    raise exception'Balance cannot be less than 1000';
  end if;  
END;
$$
language plpgsql;

create trigger t4
after update on account
for each row
execute procedure f5();








