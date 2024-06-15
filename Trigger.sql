Trigger
Trigger: is an error Message Occurs at runtime when Invalid SQL statement are executed.......
            Trigger message occurs when Invalid INSERT/UPDATE/DELETE commands are   executed...........             
          Trigger Fire(execute) automatically......
         It fire when Invalid insert/update/delete commands Executed.....
         Trigger used for Validation..purpose....
         Trigger Avoid Invalid Entry....
Note:
    Trigger Execute Before/After SQL Commands...
    we can execute trigger using:statement or row....
    trigger execute: insert/update/delete commands...

    types of Trigger:(12)
     1)before insert row trigger...
     2)before update row trigger...
     3)before delete row trigger...
     4)before insert statement trigger...
     5)before update statement trigger...
     6)before delete statement trigger...

     7)after insert row trigger...
     8)after update row trigger...
     9)after delete row trigger...
     10)after insert statement trigger...
     11)after update statement trigger...
     12)after delete statement trigger...

syntax:  trigger function:
create or replace function FunctionName() returns trigger as
$$
declare
begin 
  if(condition) then
   raise exception'Error Message..';
  end if;
return new;
end; 
$$
language plpgsql;

syntax of Trigger:

create trigger TriggerName
before/after      insert/update/delete   on TableName
for each row/Statement
execute procedure functionName();




b. Write a trigger that restricts insertion of charges value greater than 500

create table Doctor (d_no int primary key,
d_name varchar(30),
specialization varchar(35),
charges int);

create or replace function fun_doctor() returns trigger as
$$
declare
begin 
  if(new.charges>500) then
   raise exception'Charges greater than 500 Not Allowed.......';
  end if;
return new;
end; 
$$
language plpgsql;

create trigger t1
before insert  on  Doctor
for each row
execute procedure fun_doctor();

insert into doctor values(101,'om','MBBS',400);
insert into doctor values(102,'sai','MBBS',700);

postgres=# insert into doctor values(102,'sai','MBBS',700);
ERROR:  charges greater than 500 not Allowed...
CONTEXT:  PL/pgSQL function fun1() line 5 at RAISE





create table Account (a_no int primary key,
 a_type varchar(10),
 opening_date  date,
 balance money);

Write a trigger before inserting an account record in Account table and raise exception if balance is <500.

create or replace function fun_account() returns trigger as
$$
declare
begin 
  if(new.balance<'500') then
   raise exception'Account Balance must be greater than 500.....';
  end if;
return new;
end; 
$$
language plpgsql;

create trigger t5
before insert  on  Account
for each row
execute procedure fun_account();

insert into account values(1001,'Saving','2024-02-20',5000);
insert into account values(1002,'Current','2024-01-20',300);

postgres=# insert into account values(1002,'Current','2024-01-20',300);
ERROR:  Account Balance must be greater than 500.....

a. Write a trigger which is executed whenever update is made to the account table.
 If the balance becomes less than 1000, print an error message that balance cannot be less than 1000.


create or replace function fun5() returns trigger as
$$
declare
begin 
  if(new.balance<'1000') then
   raise exception'update kartani balance less than 1000 nako...';
  end if;
return new;
end; 
$$
language plpgsql;

create trigger t6
before update  on  Account
for each row
execute procedure fun5();

update Account set balance='25000' 
where a_no=1001;

update Account set balance='900' 
where a_no=1001;
SET A:item_supplier database

create table item(ino int primary key,iname varchar(20),quantity int);

insert into item values(101,'pen',200);
insert into item values(102,'pencil',300);
insert into item values(103,'notebook',400);
insert into item values(104,'ink',250);
insert into item values(105,'book',1857);

create table supplier(sno int primary key,sname varchar(20),addr varchar(20),city varchar(20));

insert into supplier values(201,'om','pune','pune');
insert into supplier values(202,'sai','shirdi','shirdi');
insert into supplier values(203,'ram','shrirampur','shrirampur');
insert into supplier values(204,'sham','mumbai','mumbai');
insert into supplier values(205,'sunder','nager','nager');

create table item_sup(ino int references item,sno int references supplier,rate int);

insert into item_sup values(101,201,3000);
insert into item_sup values(102,202,2000);
insert into item_sup values(102,203,4000);
insert into item_sup values(103,204,3500);
insert into item_sup values(104,204,2200);
insert into item_sup values(105,205,2700);

a.write a trigger before update on rate field,if the difference in the old rate and new rate to be entered is 
  more than Rs 2000/-.Raise an exception and display the corresponding message
->

create or replace function fun1() returns trigger as'
declare
begin 
  if(new.rate-old.rate>2000) then
   raise notice''the difference between old rate and new rate should be less than 2000'';
  end if;
return new;
end; 
'language 'plpgsql';

create trigger t1
before update on item_sup
for each row
execute procedure fun1();

output:
  smile=# update item_sup set rate=5000 where rate=2000;
NOTICE:  the difference should be less than 2000

b.write a trigger before insert or update on rate field,if the rate to be entered is zero then.
  Raise an exception and display the message"Zero rate not allowed".
->  
create or replace function fun1() returns trigger as'
declare
begin 
  if(new.rate=0) then
   raise notice''Zero rate not allowed'';
  end if;
return new;
end; 
'language 'plpgsql';

create trigger t5
before insert or update on item_sup
for each row
execute procedure fun1();
  
output:
  smile=# insert into item_sup values(105,201,0);
NOTICE:  Zero rate not allowed.
  

##SET B student marks database

create table student(rno int primary key,name varchar(20),addr varchar(20),class varchar(10));

insert into student values(101,'om','pune','fybcs');
insert into student values(102,'sai','shirdi','sybcs');
insert into student values(103,'ram','shrirampur','tybcs');
insert into student values(104,'sham','mumbai','mcs');
insert into student values(105,'sunder','nager','fybcs');

create table subject(sno int primary key,scode varchar(10),subname varchar(20));

insert into subject values(201,'01AA','mathematics');
insert into subject values(202,'02BB','datastructure');
insert into subject values(203,'03CC','rdbms');
insert into subject values(204,'04DD','statestic');
insert into subject values(205,'05EE','english');

create table stud_sub(rno int references student,sno int references subject,marks int);
 
insert into stud_sub values(101,201,45);
insert into stud_sub values(101,201,20);
insert into stud_sub values(101,201,60);
insert into stud_sub values(101,201,70);
insert into stud_sub values(101,201,90);

a.write a trigger deleting a student record from the student table.
Raise a notice and display the message
  "student record is being deleted".
->
create or replace function fun() returns trigger 
as
$$
DECLARE
BEGIN
           raise notice'student record is being deleted';
    return new;
END; 
$$
language plpgsql;


create trigger t1
before delete on student
for each row
execute procedure fun();

triggereg=# delete from student where rno=105;
NOTICE:  student record is being deleted
DELETE 0

b.write a trigger to ensure that the marks entered for a student,with respect to a subject is never<10 and greater than 100.
->
 create or replace function insertmark() returns trigger
 as
$$
declare
begin 
  if(new.marks<10 OR new.marks>100) then
    RAISE EXCEPTION 'marks should in between 10 and 100';
  end if;
return new;
end; 
$$
language plpgsql;

create trigger marks3
before insert or update on stud_sub
for each row
execute procedure insertmark();

triggereg=# insert into stud_sub values(102,202,155);
ERROR:  marks should in between 10 and 100
CONTEXT:  PL/pgSQL function insertmark() line 5 at RAISE

##SET C
 NEWS PAPER DATABASE
 
create table newspaper(title varchar(20) primary key,language varchar(20),publisher varchar(20),cost money);
insert into newspaper values('sakal','marathi','om',5);
insert into newspaper values('lokmat','marathi','sai',7);
insert into newspaper values('hindustan_times','hindi','ram',5);
insert into newspaper values('business_news','english','sham',4);
insert into newspaper values('pudhari','marathi','vinod',3);

create table city(pincode varchar(6) primary key,name varchar(20),state varchar(20));
insert into city values('413709','shrirampur','maharashtra');
insert into city values('400030','mumbai','maharashtra');
insert into city values('532789','rajkot','rajasthan');
insert into city values('420701','pune','maharashtra');
 
create table nc(title varchar(20) references newspaper,pincode varchar(6) references city,daily_req int);
insert into nc values('sakal','413709',4000);
insert into nc values('lokmat','413709',2000);
insert into nc values('hindustan_times','413709',200);
insert into nc values('business_news','413709',500);
insert into nc values('sakal','400030',5000);
insert into nc values('pudhari','400030',3000);
insert into nc values('lokmat','400030',1000);
insert into nc values('hindustan_times','400030',100);
insert into nc values('hindustan_times','420701',150);
insert into nc values('hindustan_times','532789',100);
insert into nc values('sakal','532789',1000);
Write a stored function to accept city name as input and print the names of Newspapers available in that City. 
select newspaper.title from newspaper,city,nc
where newspaper.title=nc.title
and city.pincode=nc.pincode
and name='rajkot';

a.calculate the length of pincode.write a trigger which will fire before insert on the cities table which check
  that the pincode must be of 6 digit.if it is more or less then it display the appropriate message.
->
create or replace function fun() returns trigger as
$$
declare
begin
 if(new.length(pincode)!=6) then 
  raise EXCEPTION 'pincode is not valid it must be 6 digit';
 end if;
return new;
end; 
$$
language plpgsql;

create trigger pincode
before insert or update on cities1
for each row
execute procedure fun();

b.write a trigger which will prevent deleting cities from maharashtra state.
->
create or replace function fun() returns trigger as
$$
declare
begin
 if(state:='maharashtra') then 
  raise EXCEPTION 'the record doesn't delete';
 end if;
return new;
end; 
$$
language plpgsql;

create trigger mah
before insert or update on cities1
for each row
execute procedure fun();


set D: using railway reservation database

create table train(tno int primary key,
tname varchar(20),
dep_time time,
arr_time time,
source_stn varchar(20),
dest_stn varchar(20),
 no_of_res_bogies int,
bogies_cap int);

insert into train values(101,'mumbai_exp','08:30:45','09:30:00','mumbai','goa',30,35); 
insert into train values(102,'delhi_exp','15:20:45','16:30:00','delhi','kashmir',25,25); 
insert into train values(103,'bombay_exp','20:45:45','21:30:00','dombivali','new_mumbai',40,50); 
insert into train values(104,'shivaji_exp','22:40:45','22:55:15','sambhajinagar','raygad',28,30); 


create table pass(pid int primary key,
pname varchar(20),
address varchar(20),
age int,
gender varchar(20));

insert into pass values(201,'aa','pune',25,'male');
insert into pass values(202,'bb','shrirampur',20,'female');
insert into pass values(203,'cc','mumbai',38,'male');
insert into pass values(204,'mr.bhosle','nashik',50,'female');
insert into pass values(205,'mr.jadhav','pune',30,'male');





create table ticket(tno int references train,
pid int references pass,
  tick_no int,
bogie_no int,
no_of_berths int,
date date,
  ticket_amt int,
status varchar(20));

insert into ticket values(101,201,1223,10,30,'2009-05-13',1000,'confirm');
insert into ticket values(101,202,2223,4,23,'2009-05-13',2000,'waiting');
insert into ticket values(102,203,4523,7,65,'2009-05-13',407,'confirm');
insert into ticket values(103,204,6533,2,40,'2009-05-13',500,'waiting');
insert into ticket values(104,205,1720,9,30,'2009-05-13',700,'waiting');





a.create a trigger to validate train arrival time must be less than train departure time.
->
create or replace function fun1() returns trigger as'
declare
begin 
  if(new.arr_time>dep_time) then
   raise notice''arrival time must be less than departure time'';
  end if;
return new;
end; 
'language 'plpgsql';

create trigger time
before insert or update on train
for each row
execute procedure fun1();

b.write a trigger which will be activated before changing the status field in the ticket table and print
 a message to the user.

create or replace function fun1() returns trigger as'
declare
begin 
   raise notice''do not change the status field'';
return new;
end; 
'language 'plpgsql';

create trigger time
before update on ticket
for each row
execute procedure fun1();

set E:using bus transportion database

create table route(rno int,source char(20),destination char(20),no_of_stations int);

  insert into route values(201,'shrirampur','shirdi',4);
  insert into route values(202,'jalgoan','akola',6);
  insert into route values(203,'nashik','shirdi',10);  
  insert into route values(204,'ahmednager','mumbai',8);
  insert into route values(205,'pune','dhule',9);

create table bus(bno int,capacity int not null,depot_name varchar(20),rno int);

 insert into bus values(101,40,'shrirampur',201);
 insert into bus values(102,30,'shirdi',202);
 insert into bus values(103,20,'mumbai',203);
 insert into bus values(104,25,'pune',204);
 insert into bus values(105,35,'nashik',205);
 
create table driver(dno int,dname char(20),l_no int unique,address char(20),d_age int,salary int);

 insert into driver values(301,'aaa',1554,'pune',30,15000);
 insert into driver values(302,'bbb',1664,'shrirampur',40,10000);
insert into driver values(303,'ccc',1774,'mumbai',50,20000); 
insert into driver values(304,'ddd',1224,'nashik',28,18000);

create table bd(bno int,dno int,date_of_duty date,shift char);

 insert into bd values(101,301,'2011-09-26',1);
insert into bd values(105,302,'2012-04-17',2);
insert into bd values(102,303,'2013-05-03',1);
insert into bd values(103,304,'2014-08-18',2);
insert into bd values(104,305,'2015-01-26',2);

a.define a trigger after insert or update the record of driver if the age is between 18 and 50 give the messege
  "valid entry"otherwise give appropriate message.
->
create or replace function fun1() returns trigger as'
declare
begin
   if(new.d_age>18 and new.d_age<50) then 
     raise notice''valid entry'';
   else
     raise EXCEPTION''invalid entry'';
   end if;
return new;
end; 
'language 'plpgsql';

create trigger tt
after insert or update on driver
for each row
execute procedure fun1();

b.define a trigger after delete the record of bus having capacity<10.display the message accordingly.
->
create or replace function fun1() returns trigger as'
declare
begin
     if(new.capacity<10) then
     raise notice''the record having capacity less than 10 deleted'';
     end if;
return new;
end; 
'language 'plpgsql';

create trigger nn
before delete on bus
for each row
execute procedure fun1();





create table Actor(a_name varchar(30),
 role varchar(30),
 charges money,
 a_address varchar(30) );

insert into Actor values('om','hero',50000,'pune');
insert into Actor values('sai','villan',100000,'pune');
insert into Actor values('sham','hero',50000,'pune');

postgres=# delete from actor where a_name='om';
DELETE 1

Write a trigger which will be executed whenever an actor is deleted from the actor table, display appropriate message. 

create or replace function fun1() returns trigger 
as
$$
DECLARE
BEGIN
           raise  exception 'actor record delete karu shkat nahi...trigger fire Zala... ';
 return new;
END; 
$$
language plpgsql;

create trigger t11
before delete on actor
for each row
execute procedure fun1();
 
postgres=# delete from actor where a_name='sai';
ERROR:  actor record is being deleted
CONTEXT:  PL/pgSQL function fun1() line 4 at RAISE






create table  Movie (m_name varchar (25), release_year integer, budget money);
insert into movie values('aa','2021',150000);
insert into movie values('rrr','2022',50000);
 
b. Write a trigger which will be executed whenever a movie is deleted from the movie table, display appropriate message

create or replace function fun1() returns trigger 
as
$$
DECLARE
BEGIN
           raise  exception 'delete movie record not Allowed...';
    return new;
END; 
$$
language plpgsql;

create trigger t1
before delete on movie
for each row
execute procedure fun1();
 

Write a trigger which will be executed whenever insertion is made to the movie table. If the budget is less than 1,00,000 do not allow the insertion. Give appropriate message.

create or replace function fun1() returns trigger as
$$
declare
begin
     if(new.budget<'100000') then
     raise exception' budget less than 1 lakh not Allowed...';
     end if;
return new;
end; 
$$
language plpgsql;

create trigger t3
before insert on movie
for each row
execute procedure fun1();

postgres=# insert into movie values('abcd','2022',70000);
ERROR:   budget less than 1 lakh not Allowed...
CONTEXT:  PL/pgSQL function fun1() line 5 at RAISE