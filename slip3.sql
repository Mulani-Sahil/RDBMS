create table Hospital (h_no int primary key, h_name varchar(20), city varchar(10));

create table Doctor (d_no int primary key,d_name varchar(30),
specialization varchar(35),charges int,h_no int references hospital);

insert into hospital values(101,'Morge','Shrirampur');
insert into hospital values(102,'Padghan','Shrirampur');
insert into hospital values(103,'Kamgar','Shrirampur'); 

insert into doctor values(1,'Dr.Morge','MBBS',1000,101);
insert into doctor values(2,'Dr.Sahil','MBBS',500,101);
insert into doctor values(3,'Dr.kale','MBBS',600,102);
insert into doctor values(4,'Dr.Gadhe','MBBS',5000,102);
insert into doctor values(5,'Dr.Mohan','MBBS',400,103);


Write a trigger before insert/update on Doctor table. Raise
exception if charges are <0 .
Query:-
create or replace function f1()returns trigger as
$$
DECLARE
BEGIN
  if(new.charges<0)then
     raise exception'Charges Can not be less than 0';
  end if;
  return new;
END;
$$
language plpgsql;

 create trigger t2
 before insert or update on doctor
 for each row
 execute procedure f1();
 
 Write a function which will accept the name of the doctor and
print the hospital details that the doctor is visiting.

create or replace function f2(name1 doctor.d_name%type)returns void as
$$
DECLARE
  r1 hospital%rowtype;
  c1 cursor for select * from hospital,doctor where hospital.h_no=doctor.h_no and d_name=name1;
BEGIN
   open c1;
   loop
   fetch c1 into r1;
   exit when not found;
     raise notice'Hospital Number=%',r1.h_no;
     raise notice'Hospital Name=%',r1.h_name;
     raise notice'City=%',r1.city;
   end loop;
   close c1;
END;
$$
language plpgsql;


Write a function using cursor to accept the city name and print
the names of all hospitals in that city.
query:
create or replace function f3(cname1 hospital.city%type)returns void as
$$
DECLARE
BEGIN
END;
$$
lanuae plpgsql;






























