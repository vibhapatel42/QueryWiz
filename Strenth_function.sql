/* first lets create a table*/
create table section(s_id int, s_name varchar(20), strength int );

/* Inserting values into table */
insert into section values(1, 'computer science', 20);
insert into section values(2, 'portal', 45);
insert into section values(3, 'geeksforgeeks', 60);
select * from SECTION;
/* Defining function */
create or replace function totalStrength

/* Defining return type */
return integer
as
total integer:=0;

BEGIN					

/* calculating the sum and storing it in total*/
select sum(strength) into total from section;
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
