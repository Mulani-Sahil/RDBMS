create table Bus(bus_no int primary key,
capacity  int,
depo_name varchar(20));

insert into Bus values(1,40,'Shrirampur');
insert into Bus values(2,50,'Newasa');
insert into Bus values(3,55,'Nagar');
insert into Bus values(4,30,'Nashik');
insert into Bus values(5,40,'Gangapur');
insert into Bus values(6,40,'Vaijapur');
insert into Bus values(7,45,'Nagar');

create table Route(Route_no  int primary key,
source varchar(20),
destination varchar(20),
no_of_stations int);

insert into Route values(101,'Shrirampur','Pune',10);
insert into Route values(102,'Shrirampur','Nashik',7);
insert into Route values(103,'Ahmednagar','Shirdi',4);

create table BR(bus_no int references Bus,
route_no int references route);

insert into BR values(1,101);
insert into BR values(2,101);
insert into BR values(3,101);
insert into BR values(4,102);
insert into BR values(5,102);
insert into BR values(6,103);
insert into BR values(7,103);
insert into BR values(1,102);


a. Write a stored function using cursor, which will give details of all routes on which bus no
110 is running.
ans:-
create or replace function details_route()returns void as 
$$
declare
 r1 Route%rowtype;
 c1 cursor for select route.* from BUs,Route,BR 
 where Bus.bus_no=BR.bus_no
 and Route.route_no=BR.route_no
 and bus.bus_no=1;
begin
  open c1;
   loop
    fetch c1 into r1;
    exit when not found;
    raise notice'Route Number = %',r1.route_no;
    raise notice'Source = %',r1.source;
    raise notice'destination = %',r1.destination;
    raise notice'No_of_stations = %',r1.No_of_stations;
   end loop;
     close c1; 
end;
$$
language plpgsql;

b. Write a stored function using cursor, which will give details of all buses on route from
“Station” to “Airport”.
ans:-
create or replace function details_bus()returns void as
$$
declare
 r1 Bus%rowtype;
 c1 cursor for select Bus.* from Bus,Route,BR 
 where Bus.bus_no=BR.bus_no
 and Route.route_no=BR.route_no
 and source='Shrirampur'
 and destination='Pune';
begin
  open c1;
   loop
    fetch c1 into r1;
    exit when not found;
    raise notice'Bus Number = %',r1.bus_no;
    raise notice'Capacity = %',r1.capacity;
    raise notice'Depo_name = %',r1.Depo_name;
    end loop;
    close c1; 
end;
$$
language plpgsql;
