create	database joinexercise;
use joinexercise;
create table Computer(
COMPID integer,
MAKE varchar(15),	
MODEL varchar(15),	
MYEAR integer);
insert into Computer values
(1001,'Dell','Vostro',2013),
(1002,'Dell','Precision',2014),
(1003,'Lenovo','Edge',2013),
(1004,'Lenovo','Horizon',2014);
drop table employee;
create table Employee(
ID integer,
ENAME varchar(15),	
DEPT varchar(15),	
COMPID integer,
Mname varchar(15),
MID integer);
truncate employee;
insert into Employee values
(1,'James Potter','ICP',1001,'Emily Rayner',3),
(2,'Ethan McCarty','ETA',NULL,'Emily Rayner',3),
(3,'Emily Rayner','ETA',1002,'Ayaz Mohammad',5),
(4,'Jack Abraham','ETA',NULL,'Ayaz Mohammad',5),
(5,'Ayaz Mohammad','ICP',1003,'Emily Rayner',3);


## Cross Join
select employee.ID,employee.ENAME, employee.COMPID, computer.COMPID,computer.MAKE from 
Employee cross join computer; ##cartesian product

select * from employee,computer;

SELECT E.ID, E.ENAME, E.COMPID AS E_COMPID, C.COMPID, C.Model
FROM Employee E CROSS JOIN Computer C;

## Inner Join
SELECT ID, ENAME,  E.dept, E.COMPID E_COMPID, C.COMPID AS C_COMPID, MODEL 
FROM Employee E INNER JOIN Computer C ON E.COMPID = C.COMPID;

## Conditional join using Where
SELECT ID, ENAME,E.dept,  E.COMPID AS E_COMPID, C.COMPID AS C_COMPID, MODEL 
FROM Employee E INNER JOIN Computer C ON E.COMPID = C.COMPID where	Dept='ICP';

## Conditional join using AND
SELECT ID, ENAME, E.COMPID AS E_COMPID, C.COMPID AS C_COMPID, MODEL 
FROM Employee E INNER JOIN Computer C ON E.COMPID = C.COMPID and	Dept='ICP';
alter table employee add manager varchar(15);
alter table employee drop column manager;
alter table employee add mid integer;
## Self join with the same table
SELECT EMP.ENAME EMPNAME, MGR.mNAME MGRNAME 
FROM Employee EMP inner JOIN Employee MGR ON  EMP.ID = Mgr.ID;

## Left join
SELECT ID, ENAME, E.COMPID AS E_COMPID, C.COMPID AS C_COMPID, MODEL
FROM Employee E LEFT OUTER JOIN Computer C ON E.COMPID = C.COMPID;

## Left Outer Join with Where Condition
SELECT Id, EName, Dept, E.CompId AS E_CompId, C.CompId AS C_CompId, Model 
FROM Employee E LEFT JOIN Computer C ON E.CompId = C.CompId WHERE Dept = 'ETA';

## Left Outer join with AND condition
SELECT Id, EName, Dept, E.CompId AS E_CompId, C.CompId AS C_CompId, Model FROM Employee E 
LEFT JOIN Computer C ON E.CompId = C.CompId AND Dept = 'ETA';

## LookUp table with WHERE
SELECT Id, EName, E.CompId AS E_CompId, C.CompId AS C_CompId, Model, MYear 
FROM Employee E LEFT OUTER JOIN Computer C ON E.CompId = C.CompId WHERE MYear = '2014';

##Look Up table with AND Condition
SELECT Id, EName, E.CompId AS E_CompId, C.CompId AS C_CompId, Model, MYear FROM Employee E 
LEFT OUTER JOIN Computer C ON E.CompId = C.CompId AND MYear = '2014';

## Right Outer Join
SELECT ID, ENAME, E.COMPID AS E_COMPID, C.COMPID AS C_COMPID, MODEL 
FROM Employee E RIGHT OUTER JOIN Computer C ON E.COMPID = C.COMPID;

## Full Join
SELECT ID, ENAME, E.COMPID AS E_COMPID	
FROM Employee E
union
select C.COMPID AS C_COMPID, MODEL, MYEAR
FROM Computer C