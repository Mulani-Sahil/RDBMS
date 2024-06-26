Bus–Route Database

create table Bus(bus_no int primary key,capacity int, depo_name varchar(20));

insert into bus values(1,54,'Shrirampur');
insert into bus values(2,64,'Pune');
insert into bus values(3,50,'Nagar');
insert into bus values(110,50,'Nagar');

create table Route(route_no int primary key,source varchar(20),destination varchar(20), No_of_stations int);

insert into route values(101,'Airport','Station',6);
insert into route values(102,'Station','Airport',4);
insert into route values(103,'Airport','Station',9);

create table BR(bus_no int references bus,route_no int references route);

insert into br values(3,101);
insert into br values(3,101);
insert into br values(2,102);
insert into br values(2,102);
insert into br values(1,103);
insert into br values(1,103);
insert into br values(110,103);
insert into br values(110,102);

a. Write a stored function using cursor,which will give details of all routes on which bus no 110 is running.

create or replace function f()returns void as $$
declare
 c1 cursor for select r.* from route as r,br where br.route_no=r.route_no   and bus_no=110;
 d1 route%rowtype;
begin
 open c1;
loop
  fetch c1 into d1;
   exit when not found;
  raise notice'Route no=% Source=% destination=% no of stations=%',                    d1.route_no,d1.source ,d1.destination,d1.no_of_stations;        
end loop;
close c1;
end;$$
 language plpgsql;
select f();

b. Write a stored function using cursor, which will give details of all buses on route from “Station” to “Airport”.


create or replace function f01()returns void as $$
declare
  c1 cursor for select b.* from route as r,bus as b,br where br.route_no=r.route_no  and b.bus_no=br.bus_no and r.source='Station' and r.destination='Airport';                         
 d1 bus%rowtype;
begin
 open c1;
loop
  fetch c1 into d1;
   exit when not found;
  raise notice'bus no=% Capacity=% deponame=% ',d1.bus_no,d1.capacity,d1.depo_name;        
end loop;
close c1;
end;$$
 language plpgsql;
select f01();
