create database subqueriesdata;
use subqueriesdata;
create table employee(
ID integer,
ENAME varchar(15),	
DOJ date,
SALARY decimal,
BONUS decimal,
DEPT varchar(15),
COMPID integer,
Manager varchar(15));
insert into Employee values
(1,'James Potter','2014-06-01',75000,1000,'ICP',1001,null),
(2,'Ethan Mccarty','2014-02-01',90000,1200,'ETA',null,null),
(3,'Emily Rayner','2014-01-01',25000,100,'ETA',1002,2),
(4,'Jack Abraham','2014-07-01',30000,Null,'ETA',null,2),
(5,'Ayaz Mohammad','2014-04-01',40000,Null,'ICP',1003,1);
drop table employee;

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

## Subquery with select clause
SELECT ID, ENAME, SALARY, (SELECT AVG(SALARY) FROM EMPLOYEE) AS AVGSAL FROM EMPLOYEE;
## The result contains average salary of all employees as additional attribute.
## Subquery in FROM clause
SELECT * FROM (SELECT ID, ENAME, SALARY FROM Employee) A;  
#The above subquery filters three columns from the employee table which are displayed by the parent query.

##Fetch details of employees who are getting highest salary.
## Single Row-Equity Operator
SELECT Id, EName, Salary, Dept FROM Employee E1 WHERE Salary = (SELECT MAX(Salary) FROM Employee E2);
##Display the department in which the maximum total salary is paid to the employees.

# Signle Row-Nested Function
# SELECT MAX(SUM(Salary)) FROM Employee GROUP BY Dept;
# SELECT DEPT FROM Employee  GROUP BY DEPT Having SUM(Salary) = (SELECT MAX(SUM(Salary)) FROM Employee GROUP BY Dept);
SELECT GROUP_CONCAT(DEPT) FROM Employee WHERE DEPT = (SELECT DEPT FROM Employee GROUP BY DEPT ORDER BY SUM(salary) DESC LIMIT 1);
# Display the details of computer which are allocated to the employees.
# Multiple row-IN operator
SELECT CompId, Make, Model FROM Computer WHERE CompId IN (SELECT CompId FROM Employee);
## Independent subquery can be replaced by join if it is used with IN clause to fetch foreign keys from another table. 
## The JOIN solution for query in example 3 (Multiple Row- In Operator) is:
## Join Equivalent
## This query using joins also fetches CompId of all computers that are allocated to employees.
SELECT C.CompId, Make, Model FROM Computer C, Employee E WHERE E.CompId = C.CompId;
# A Join cannot be replaced by a subquery if it is using columns from both the tables in SELECT clause. 
# Attributes from subquery tables cannot be accessed in the outer query.
SELECT Id, EName, E.CompId, Make FROM Computer C, Employee E WHERE E.CompId = C.CompId;
## A Subquery must be used if value of aggregate function is required in where clause.
## Subquery Mandatory
SELECT EName,Dept FROM Employee WHERE Salary>(SELECT AVG(Salary) FROM Employee);
## The above querycannot be replaced by join as it is using aggregate function.

## Coorelated Subquery
## Display the details of all employees whose salary is greater than or equal to average salary of the employees in their own department.
## SingleRow Aggregate functions
SELECT Id, EName, DEPT, Salary FROM Employee E1 WHERE Salary >=(SELECT AVG(Salary) FROM Employee E2 WHERE E1.DEPT = E2.DEPT);
#Display the details of all employees whose salary is greater than their manager’s salary.
SELECT Id, EName, DEPT, Salary FROM Employee E WHERE Salary > (SELECT Salary FROM Employee M WHERE E.Manager = M.ID);
# EXISTS keyword is used to check presence of rows in the subquery. 
# The main query returns the row only if at least one row exists in the subquery. 
# EXISTS clause follows short circuit logic i.e. the query calculation is terminated as soon as criteria is met. 
# As a result it is generally faster than equivalent join statements.
SELECT CompId, Make, Model FROM Computer C WHERE EXISTS (SELECT 1 FROM Employee E WHERE E.CompId = C.CompId);
## NOT EXISTS is opposite of EXISTS i.e. it is used to check absence of rows in the subquery. 
## The main query returns the row only if at least no row exists in the subquery. 
## It also uses short circuit logic and is hence faster.
SELECT CompId, Make, Model FROM Computer C WHERE NOT EXISTS (SELECT 1 FROM Employee E WHERE E.CompId = C.CompId);


create table exa(
ID VARCHAR(6)
);
insert into exa values
('S110'),
('S220');
SELECT ID, CAST(REGEXP_REPLACE(ID, '[^0-9]+', '') AS UNSIGNED) AS numeric_value FROM exa;
