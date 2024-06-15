 many to maany
create table Item(item_no int primary key,iname varchar(20));

create table Supplier (s_no int primary key, sname varchar(20), city char(10));

create table i_s(item_no int references item,s_no int references supplier,rate int,quantity int );

insert into item values(101, 'keyboard');
insert into item values(102,'mouse');
insert into item values(103, 'monitor');

insert into supplier values(1,'om', 'pune');
insert into supplier values(2, 'sai', 'pune');
insert into supplier values (3, 'ram', 'shrirampur');
insert into supplier values(4,'sham', 'shrirampur');

insert into I_S values(101,1,350,6); 
insert into I_S values(102,1,200,4);
insert into I_S values(101,2,250,8);
insert into I_S values(102,2,150,7);
insert into I_S values(103,2,5000,6); 
insert into I_S values(101,1,500,4);


i. Write a function to accept the city name as input and returns the
number of suppliers living in that city.
create or replace function f8(cname varchar(10))returns int as
$$
DECLARE
   c1 int=0;
BEGIN
  select count(sname) into c1 from supplier where city=cname;
  return c1;
END;
$$
language plpgsql;

Q2]Write a cursor to display the names of items whose rate is more
than 500.
query:-

select iname from item,i_s where item.item_no=i_s.item_no
and rate>500;

create or replace function f9()returns void as
$$
DECLARE
 r1 item.iname%type;
 c1 cursor for select iname from item,i_s where item.item_no=i_s.item_no and rate>500; 
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
select f9();


q3]Write a trigger before insert or update on rate field. If the rate is
 less than 50 then raise the appropriate exception
 
query:-
create or replace function f10()returns trigger as
$$
DECLARE
BEGIN
  if(new.rate<50)then
   raise exception'Rate cannot be less than 50';
 end if;  
 return new;
END;
$$
language plpgsql;
 
create trigger t10
before insert or update on i_s
for each row
execute procedure f10(); 























