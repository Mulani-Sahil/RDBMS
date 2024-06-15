SET A

create table movie(mname varchar(25) primary key,release_year int,budget money);
insert into movie values('KGF 2',2022,100);
insert into movie values('RRR',2022,250);
insert into movie values('Bramastra',2022,300);
insert into movie values('Salaar',2023,100);
insert into movie values('Animal',2023,200);

create table actor(aname varchar(30) primary key,role varchar(20),charges money,address varchar(30));
insert into actor values('Yash','Hero',25,'Telangana');
insert into actor values('Prabhas','Hero',100,'Tamil Nadu');
insert into actor values('Sanjay Dutt','Villan',20,'Mumbai');
insert into actor values('Shrinidi Shetty','Heroine',5,'Chennai');
insert into actor values('Ranbir Kapoor','Mad',30,'Delhi');
insert into actor values('Salam Bhoi','Single',250,'Mumbai');

create table ma(mname varchar(25) references movie,aname varchar(30) references actor);
insert into ma values('KGF 2','Yash');
insert into ma values('KGF 2','Sanjay Dutt');
insert into ma values('KGF 2','Shrinidi Shetty');
insert into ma values('Salaar','Prabhas');
insert into ma values('Animal','Ranbir Kapoor');
insert into ma values('RRR','Salam Bhoi');

a. Write a trigger which will be executed whenever an actor is deleted from the actor table,
display appropriate message.
ans:-
create or replace function a_del()returns trigger as
$$
begin
 raise exception'Actor cannot be deleted';
end;
$$
language plpgsql;

create trigger t1
BEFORE DELETE on actor
for each row
execute procedure a_del();
delete from actor where aname='Yash'; 
  
b. Write a trigger which will be executed whenever a movie is deleted from the movie table,
display appropriate message.
ans:-
create or replace function delete_movie()returns trigger as
$$
begin
 raise exception'Movie cannot be deleted';
end;
$$
language plpgsql;

create trigger t4
BEFORE DELETE on movie
for each row
execute procedure delete_movie();
delete from movie where mname='KGF 2'; 

c. Write a trigger which will be executed whenever insertion is made to the movie table. If
the budget is less than 1,00,000 do not allow the insertion. Give appropriate message.
ans:-
create or replace function invalid_insertion()returns trigger as
$$
begin
 if (new.budget<'100000') then
 raise exception'BUdget is less plzzz increase it.....🙏️';
 end if;
 return new;
 end;
 $$
 language plpgsql;
 
  create trigger t5
  before insert on movie
  for each row
  execute procedure invalid_insertion();
  
  insert into movie values('RFR',2023,'1000000');
	
