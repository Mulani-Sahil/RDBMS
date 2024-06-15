create or replace function fun_doctor()returns trigger as
$$
declare
begin 
if(new.charges>0)then
    raise exception'Charges greater than 500 are not allowed...!!!!';
end if;
return new;
end;
$$
language plpgsql;

create trigger sb1 
before insert or update on doctor
for each row
execute procedure fun_doctor();

b. Write a trigger that restricts insertion of charges value greater than 500.
ans:-
create or replace function fun_doctor1()returns trigger as
$$
declare
begin 
if(new.charges>500)then
    raise exception'Charges greater than 500 are not allowed...!!!!';
end if;
return new;
end;
$$
language plpgsql;

create trigger sb2 
before insert on doctor
for each row
execute procedure fun_doctor1();
