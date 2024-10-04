create database DMLexercise;
USE dmlexercise;
drop table Salesman;
drop table product;
drop table sale;
drop table saledetail;
create table Salesman (
Sid integer primary key,
Sname varchar(20),
Location varchar(20));
create table Product(
Prodid integer primary key,
Pdesc varchar(20),
Price float(10),
Category varchar(10),
Discount integer(10));
create table Sale (
Saleid integer primary key,
Sid integer,
Sidate date,
Amount float(5),
foreign key(Sid) references Salesman(Sid));
create table Saledetail(
Saleid integer,
Prodid integer,
Quantity integer,
foreign key(Saleid) references Sale(Saleid),
foreign key(Prodid) references Product(Prodid));

## Using Insert Command
insert	into Salesman values(
11, 'Elizabeth', 'London');  ## Without using column list
insert	into Salesman (Sid,Sname,Location)
values(12, 'John', 'Pune');  ### With column list
insert into Salesman values
(13,'Priyanka','Bihar'),
(14,'Aman','Delhi');
insert into product (ProdId, PDesc, Price, Category, Discount) values 
(110, 'Bat', 50, 'Sports', NULL ), 
#insert into product (ProdId, PDesc, Price, Category, Discount) values 
(111, 'Ball', 25, 'Sports', NULL ),
#insert into product (ProdId, PDesc, Price, Category, Discount) values 
(112, 'Tennis Ball', 35, 'Sports', NULL ),
#insert into product (ProdId, PDesc, Price, Category, Discount) values 
(113, 'shirt', 100, 'Apparel', 5 ); 
alter table product modify price decimal;
alter table product modify category varchar(20);
insert into product (ProdId, PDesc, Price, Category, Discount) values 
(114, 'LED TV', 35000, 'Electronics', 10 );
 
## Let's first try SELECT command
select * from Salesman;
select * from product;
###Write a query to list product id, price and category for all products from the Product table.
select Prodid,Price,Category from product;
select Category from product;
drop table employee;
### Lets create one more table as a employee table
create table Employee (
id integer(10),
Ename varchar(20),
DOJ date, # YYYY-MM-DD
Salary decimal,
Bonus decimal,
Dept varchar(10),
Designation varchar(10));
#truncate table Employee;

insert into Employee values
(1,'James Potter','2014-06-01',75000,1000,'ICP','PM'),
(2,'Ethan Mccarty','2014-02-01',90000,1200,'ETA','PM'),
(3,'Emily Rayner','2014-01-01',25000,100,'ETA','SE'),
(4,'Jack Abraham','2014-07-01',30000,Null,'ETA','SSE'),
(5,'Ayaz Mohammad','2014-04-01',40000,Null,'ICP','TA');
#create database DMLexercise;
#USE dmlexercise;
select * from Employee;
create table Salesman (
Sid integer(10),
Sname varchar(20),
Location varchar(20));
create table Product(
Prodid integer(10),
Pdesc varchar(20),
Price float(10),
Category varchar(10),
Discount integer(10));
create table Sale(
Saleid integer(10),
Sid integer(20),
Sidate date,
Amount float(5));
create table Saledetail(
Saleid integer(10),
Prodid integer(10),
Quantity integer(10));

## Using Insert Command
insert	into Salesman values(
11, 'Elizabeth', 'London');  ## Without using column list
insert	into Salesman (Sid,Sname,Location)
values(12, 'John', 'Pune');  ### With column list
insert into Salesman values
(13,'Priyanka','Bihar'),
(14,'Aman','Delhi');
insert into product (ProdId, PDesc, Price, Category, Discount) values 
(110, 'Bat', 50, 'Sports', NULL );  
insert into product (ProdId, PDesc, Price, Category, Discount) values 
(111, 'Ball', 25, 'Sports', NULL );  
insert into product (ProdId, PDesc, Price, Category, Discount) values 
(112, 'Tennis Ball', 35, 'Sports', NULL );  
insert into product (ProdId, PDesc, Price, Category, Discount) values 
(113, 'shirt', 100, 'Apparel', 5 ); 
alter table product modify price decimal;
alter table product modify category varchar(20);
insert into product (ProdId, PDesc, Price, Category, Discount) values 
(114, 'LED TV', 35000, 'Electronics', 10 );
 
## Let's first try SELECT command
select * from Salesman;

###Write a query to list product id, price and category for all products from the Product table.
select Prodid,Price,Category,Discount from product;
select Category from product;
### Lets create one more table as a employee table
create table Employee (
id integer(10),
Ename varchar(20),
DOJ date, # YYYY-MM-DD
Salary decimal,
Bonus decimal,
Dept varchar(10),
Designation varchar(10));
#truncate table Employee;
insert into Employee values
(1,'James Potter','2014-06-01',75000,1000,'ICP','PM'),
(2,'Ethan Mccarty','2014-02-01',90000,1200,'ETA','PM'),
(3,'Emily Rayner','2014-01-01',25000,100,'ETA','SE'),
(4,'Jack Abraham','2014-07-01',30000,Null,'ETA','SSE'),
(5,'Ayaz Mohammad','2014-04-01',40000,Null,'ICP','TA');
SELECT ID, ENAME,Salary FROM Employee WHERE SALARY > 40000;   # Comparision Operator 1
SELECT ID, ENAME FROM Employee WHERE ENAME = 'James Potter'; # Comparision Operator 2
SELECT * FROM Employee WHERE SALARY >= 30000 AND DEPT = 'ETA'; ## AND operator for multiple conditions
SELECT * FROM Employee WHERE SALARY >= 75000 OR DEPT = 'ICP'; ## Or operator
SELECT ID, ENAME,Salary FROM Employee WHERE SALARY BETWEEN 30000 and 50000 AND DEPT = 'ETA'; ## Between
SELECT ID, ENAME FROM Employee WHERE ID IN (2,5); ###IN 
SELECT ID, ENAME, DEPT FROM Employee WHERE DEPT IN ('ETA','ICP');
SELECT ID, ENAME FROM Employee WHERE ID NOT IN (2,3);
select * from Employee;
SELECT ID, EName FROM Employee WHERE BONUS = NULL; ### Wrong use of equal operator to find null
SELECT ID, EName FROM Employee WHERE BONUS IS NULL;
SELECT ID, EName FROM Employee WHERE BONUS IS NOT NULL;
SELECT ID, ENAME FROM Employee WHERE BONUS IN (NULL);

SELECT Id, EName, Designation FROM Employee WHERE Designation = 'PM';
SELECT Id, EName, Designation FROM Employee WHERE Designation = 'PM  ';  ## Trailing spaces are not ignored
SELECT Id, EName, Designation FROM Employee WHERE Designation = '  PM';  ## Leading spaces cannot be ignored
SELECT Id, EName, Designation FROM Employee WHERE EName = 'James Potter';  ## Filtering varchar with equal operator
SELECT Id, EName, Designation FROM Employee WHERE EName = 'James Potter '; ## Trailing spaces are not ignored for VARCHAR2 data type.
SELECT Id, EName, Designation FROM Employee WHERE EName = ' James Potter'; ##’- Leading spaces are not ignored for VARCHAR2 data type.

### LIKE Query
SELECT ID, ENAME FROM Employee WHERE ENAME LIKE 'E%'; ## STart Pattern
SELECT ID, ENAME FROM Employee WHERE ENAME LIKE '%r'; ## End Pattern
SELECT ID, ENAME FROM Employee WHERE ENAME LIKE '%m%'; ##Anywhere between pattern
SELECT ID, ENAME, DOJ FROM Employee WHERE DOJ LIKE '__14%'; ## DatesEnd Pattern
SELECT ID, ENAME, DOJ FROM Employee WHERE DOJ LIKE '2014-06-__'; ##Fixed Pattern
SELECT ID, ENAME FROM Employee WHERE ENAME LIKE '_a%'; ##Mixed Pattern

### Distinction Clause
SELECT DISTINCT Designation FROM Employee WHERE Bonus IS NOT NULL;

## Using Update Command without Where Clause
SET sql_safe_updates=0;  # Need to disable safe update mode
UPDATE Employee SET Salary = Salary * 1.10; ## without where clause
select * from Employee;
UPDATE Employee SET Salary = Salary * 1.20 WHERE ID = 2; ##  SIngle Column Update
select * from Employee;
UPDATE Employee SET SALARY = Salary * 1.3, BONUS = Salary*1.2 WHERE ID = 1; ## Multiple Column update
select * from Employee;
UPDATE Employee SET SALARY = 100, SALARY = 200 WHERE ID = 1; ##Duplicate Column Update
select * from Employee;

UPDATE Employee SET SALARY = SALARY * 1.40 WHERE DESIGNATION = 'SE' AND DEPT = 'ETA'; ## Multiple Conditions using Where
#UPDATE table Employee SET Salary = Salary * 2;  ## Incorrect Syntax, will give error
select * from Employee;

### Let's modify table to apply some constraints
## alter table Employee modify id numeric auto_increment null;
## alter table Employee add primary key (id);
## alter table Employee modify Ename varchar(40) not null;
## alter table Employee modify DOJ date not null ;
## alter table Employee modify Salary decimal(9,2) not null;
## alter table Employee modify Bonus decimal(9,2) null;
## alter table Employee modify Dept char(3) not null;
## alter table Employee modify Designation char(3) not null;
## alter table Employee add Manager numeric null;
select ID, Ename, Salary from employee order by Ename;
### Let's try ORDER By clause for data sorting
Select ID, ENAME, DOJ, SALARY, DEPT, DESIGNATION FROM Employee ORDER BY Ename,SALARY; ## Single column default, 
## Data is sorted in Ascending Order if the sort order is not specifie
Select ID, ENAME, DOJ, SALARY, DEPT, DESIGNATION FROM Employee ORDER BY DEPT ASC; ## Single column Asceding
Select ID, ENAME, DOJ, SALARY, DEPT, DESIGNATION FROM Employee ORDER BY DOJ DESC; ## Single column descending
Select ID, ENAME, DOJ, SALARY, DEPT, DESIGNATION FROM Employee ORDER BY DEPT, DESIGNATION; #Multiple columns
Select ID, ENAME, DOJ, SALARY, DEPT, DESIGNATION FROM Employee ORDER BY DEPT ASC, DESIGNATION DESC, salary desc; #Multiple Sort Order
insert into Employee values
(6,'James Potter','2014-06-01',70100,1000,'ICP','PM'),
(7,'Ethan Mccarty','2014-02-01',80000,1200,'ETA','PM'),
(8,'Emily Rayner','2014-01-01',20000,100,'ETA','SE'),
(9,'Jack Abraham','2014-07-01',35000,Null,'ETA','SSE'),
(10,'Ayaz Mohammad','2014-04-01',45000,Null,'ICP','TA');
Select ID, ENAME, DOJ, SALARY, DEPT, DESIGNATION FROM Employee ORDER BY 2,4 DESC; # Positional Sort based on column position
Select ID, ENAME, DOJ, DEPT, DESIGNATION FROM Employee ORDER BY SALARY; #Not in Select Clause,The column being sorted need not be present in the SELECT clause
Select ID, ENAME, DOJ, SALARY, BONUS, DEPT, DESIGNATION FROM Employee ORDER BY BONUS; ## Order by on null columns ASC
Select ID, ENAME, DOJ, SALARY, BONUS, DEPT, DESIGNATION FROM Employee ORDER BY BONUS DESC; ## Order by on null columns Des 
 

