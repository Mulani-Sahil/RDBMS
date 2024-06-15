Doctor – Hospital Database
create table hospital(h_no int primary key,h_name varchar(20),city varchar(10));
insert into hospital values(101,'Shirsath','Shrirampur');
insert into hospital values(102,'Ruby','Pune');
insert into hospital values(103,'MacCare','Ahmednagar');
  
create table Doctor(d_no int primary key,d_name varchar(30),specialization varchar(35), charges int,h_no int references hospital);
insert into doctor(1,'Dr.Krushna','MBBS',100,101);
insert into doctor(2,'Dr.Sahil','BDS',200,102);
insert into doctor(3,'Dr.Pranav','BHMS',250,102);
insert into doctor(4,'Dr.Ram','BHMS',100,101);
insert into doctor(5,'Dr.Varad','MBBS',50,103);
insert into doctor(6,'Dr.Sagar','BDS',100,101);


Doctor and Hospital are related with many to one relationship.
Create the above database in PostGreSQL and insert sufficient records.
a. Write a trigger before insert/update on Doctor table. Raise exception if charges are <0.
b. Write a trigger that restricts insertion of charges value greater than 500.
