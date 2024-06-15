bank database
consider the following database maintained by a bank. the bank maintains information about
its branches, customers and their loan applications.
following are the tables:
    create  table branch(bid integer primary key, bname varchar(30),bcity varchar(10));
    insert into branch values(101,'MG Road','Pune');
    insert into branch values(102,'Shivaji Road','Shrirampur');
    insert into branch values(103,'Newasa Road','Shrirampur');

    create table customer(cno integer primary key,cname varchar(20),caddr varchar(35),city varchar(20));
    insert into customer values(201,'om','pune','pune');
    insert into customer values(202,'sai','pune','pune');
    insert into customer values(203,'Ram','shrirampur','shrirampur');
    insert into customer values(204,'sham','nashik','nashik');
    insert into customer values(205,'sagar','Mumbai','Mumbai');

    create table loan_app(lno integer primary key,lamtrequired money,lamtapproved
    money,l_date date);
    insert into loan_app values(301,'5000','6000','2000-01-12');
    insert into loan_app values(302,'7000','5000','2001-02-13');
    insert into loan_app values(303,'8000','7000','2002-03-14');
    insert into loan_app values(304,'9000','9000','2003-07-15');
    insert into loan_app values(305,'12000','12000','2005-07-20');
    
    create table bcl(bid integer references branch(bid),cno int references customer(cno),lno integer references loan_app(lno));
    insert into bcl values(101,201,301);
    insert into bcl values(102,201,302);
    insert into bcl values(102,201,303);
    insert into bcl values(103,203,304);
    insert into bcl values(103,203,305);

a) Write a function that returns the total number of customers of a particular branch.( Accept
branch name as input parameter.)
select count(*) from branch,customer,bcl
where branch.bid=bcl.bid
and customer.cno=bcl.cno
and bname='Newasa';
create or replace function count_cust(bname1 branch.bname%type)returns int
as
$$
Declare
 cnt int;
Begin
 select count(*) into cnt from branch,customer,bcl
 where branch.bid=bcl.bid
 and customer.cno=bcl.cno
 and bname=bname1;
 return cnt;
END;
$$
language plpgsql; 

b) Write a function to find the maximum loan amount approved.
ans:-
select max(lamtapproved) from loan_app;
create or replace function dispmaxamt()returns money
as
$$
Declare
 cnt loan_app.lamtapproved%type;
Begin
 select max(lamtapproved) into cnt from loan_app;
 return cnt;
END;
$$
language plpgsql; 


c) Create a function which returns the total number of customers who have applied for a loan
more than Rs.100000. (Accept loan amount as input parameter)
ans:-
create or replace function disp_amt(lamtapp1 loan_app.lamtapproved%type)returns int
as
$$
Declare
 cnt int;
Begin
select count(*) into cnt from customer,loan_app,bcl
where customer.cno=bcl.cno
and loan_app.lno=bcl.lno
and lamtapproved>=lamtapp1;
 return cnt;
END;
$$
language plpgsql;