SET A
1)Find maximum and minimum from two numbers
    ans:-
    DO $$
    DECLARE
    a int=11;
    b int=22;
    BEGIN
    if(a>b)then
    raise notice '% is greater',a;
    else
    raise notice '% is greater',b;
    end if;
    END$$;

2. Check the number is positive, negative or zero.
    ans:-
create or replace function pnz(n int) returns text as
$$
begin
if(n>0)then
raise notice ' positive';
else if(n<0)then
raise notice 'negative';
else
raise notice 'zero';
end if;
end if;
end;
$$
language plpgsql;

3. Find maximum and minimum from three numbers
ans:-
create or replace function gat(a int,b int,c int) returns text as
$$
begin
if(a>b and a>c)then
raise notice '% is greater',a;
else if(b>a and b>c)then
raise notice '% is greater',b;
else
raise notice '% is greater',c;
end if;
end if;
end;
$$
language plpgsql;

4. Find number is even or odd
ans:-
create or replace function e_o(n int) returns text as
$$
BEGIN
 if(n%2=0)then
   raise notice 'The number is even';
 else
   raise notice 'The number is even';
end if;
END;
$$
language plpgsql; 

5. Find sum of first 10 numbers (using unconditional loop)
ans:-
create or replace function softd()returns int as
$$
DECLARE
i int;
s int=0;
BEGIN
for i in 1..10
 loop
   s=s+i;
 end loop;
raise notice 'Sum of first ten digit is %',s;
END;
$$
language plpgsql; 

6. Display all odd numbers from 1 to 50.
ans:-
create or replace function odd_no()returns int as
$$
DECLARE
i int;
BEGIN
for i in 1..50
 loop 
  if(i%2=1)then
   raise notice'%',i;
  end if; 
 end loop;
 END;
 $$
 language plpgsql; 

 7. Find sum and average of first n numbers using conditional loop(while)
 ans:-
 create or replace function sumavg(n int)returns void as
 $$
 DECLARE
  s int=0;
  avg float;
BEGIN
  for i in 1..n
   loop
    s=s+i;
    i=i+1;
   end loop;
   avg=s/n;
   raise notice 'Sum is %',s;
   raise notice 'Average is %',avg(float);
END;
$$
language plpgsql;   

8. Count even numbers from given range(m to n) (for)
  ans:-
  create or replace function even_cnt(a int,b int) returns void as
  $$
  DECLARE
   i int;
   cnt int=0;
  BEGIN
   for i in a..b
    loop
     if(i%2=0)then
      cnt=cnt+1;
     end if;
    end loop;
    raise notice 'Even count is %',cnt;
    END;
    $$
    language plpgsql;

9. Search the given number is in given range.
  ans:-
create or replace function search(a int,b int,c int) returns void as
$$
DECLARE
 i int;
 cnt int=0;
BEGIN
   if(c>a and c<b)then
    raise notice 'It is in range';
   else if(c<a and c>b)then
    raise notice 'It is in range';
   else
    raise notice 'It is not in range';
   end if;
   end if; 
  END;
  $$
  language plpgsql;

10. Display a number in word (Using Case) and loop.
create or replace function digit_words(n int)returns void as
$$
 begin
 case n
 when 0 then raise notice'zero';
 when 1 then raise notice'one';
 when 2 then raise notice'Two';
 when 3 then raise notice'Three';
 when 4 then raise notice'Four';
 when 5 then raise notice'Five';
 when 6 then raise notice'Six';
 when 7 then raise notice'Seven';
 when 8 then raise notice'Eight';
 when 9 then raise notice'Nine';
 else
  raise notice 'It is not a digit';
  end case;
end;
$$
language plpgsql; 
