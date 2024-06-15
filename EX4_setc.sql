create table wholesaler(wno int primary key,wname varchar(20),address text,city varchar(30));
insert into wholesaler values(1,'Krushna','Kanda Market','Shrirampur');
insert into wholesaler values(2,'Prem','MG Road','Mumbai');
insert into wholesaler values(3,'Sahil','Chor Bazar','Delhi');

create table product(pno int primary key,product_name varchar(20),rate money);
insert into product values(101,'Wafers',60);
insert into product values(102,'Keyboard',200);
insert into product values(103,'Perfumes',100);

create table wp(wno int references wholesaler,pno int references product,quantity int);
insert into wp values(1,101,50);
insert into wp values(1,102,10);
insert into wp values(1,103,40);
insert into wp values(2,102,50);
insert into wp values(2,103,50);
insert into wp values(2,101,100);
insert into wp values(3,102,40);
insert into wp values(3,103,150);
insert into wp values(3,101,200);

create or replace function chk_quan(a int)returns void as
$$
begin
 if a>=50 and a<=200 then
   insert into wp(quantity) values(a);
 else
   raise exception'Invalid Input';
 end if;
end;
$$
language plpgsql;     

create or replace function chk_rate(a money)returns void as
$$
begin
 if a<='0' then
   raise exception'Invalid Input';
 else
   raise notice'correct Input';
 end if;
end;
$$
language plpgsql;  

c. Write a function to accept product name as parameter. If entered product name is not valid then
raise an user defined exception”Invalid_Product_Name” otherwise display product detailsof
specified product.
ans:-
select * from product where product_name='Wafers';
create or replace function product_details(pname product.product_name%type)returns void as
$$
declare
r1 product%rowtype;
begin
 select * into r1 from product where product_name=pname;
 if not found then
    raise exception'Invalid product name.!!!!!!!';
 end if;
 raise notice'Product name=%',r1.product_name;
 raise notice'Product pno=%',r1.pno;
 raise notice'Product name=%',r1.rate;
 end;
$$
language plpgsql;


