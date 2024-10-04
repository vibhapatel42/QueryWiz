/* first lets create a table*/
create table sectio2(s_id int, s_name varchar(20), strength int );

/* Inserting values into table */
insert into SECTIO2 values(1, 'computer science', 20);
insert into SECTIO2 values(2, 'portal', 45);
insert into SECTIO2 values(3, 'geeksforgeeks', 60);
COMMIT;
select * from SECTION1;
/* Defining function */
create or replace function totalStrength

/* Defining return type */
return integer
as
total integer:=0;

BEGIN					

/* calculating the sum and storing it in total*/
select sum(strength) into total from sectio2;
return total;

/*closing function*/
END totalStrength;
/
DECLARE
answer integer;

BEGIN
answer:=totalstrength();
dbms_output.put_line('Total strength of students is ' || answer);
END;
/