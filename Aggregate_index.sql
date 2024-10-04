create database course;
use course;
create table Instructor (
id integer(10),
Iname varchar(20),
Dept varchar(10),
Salary decimal
);
#truncate instructor;
insert into instructor values
(10101,'Srinivasan','Comp. Sci.',65000),
(12121, 'Wu', 'Finance', 90000),
(15151 , 'Mozart', 'Music', 40000),
(22222 ,'Einstein', 'Physics', 95000),
(32343 ,'El Said' ,'History', 60000),
(33456 ,'Gold', 'Physics', 87000),
(45565, 'Katz', 'Comp. Sci.', 75000),
(58583 ,'Califieri', 'History', 62000),
(76543, 'Singh', 'Finance', 80000),
(76766 ,'Crick', 'Biology', 72000),
(83821 , 'Brandt', 'Comp. Sci.', 92000),
(98345 ,'Kim', 'Elec. Eng.', 80000);

create table Courseinfo (
courseid integer(10),
title varchar(20),
Dept varchar(10),
credit integer(1)
);
alter table Courseinfo modify courseid varchar(10);
alter table Courseinfo modify title varchar(30);
insert into Courseinfo values
('BIO-101', 'Intro. to Biology','Biology', 4),
('BIO-301', 'Genetics', 'Biology', 4),
('BIO-399', 'Computational Biology', 'Biology', 3),
('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4),
('CS-190', 'Game Design', 'Comp. Sci.', 4),
('CS-315', 'Robotics', 'Comp. Sci.', 3),
('CS-319', 'Image Processing', 'Comp. Sci.', 3),
('CS-347', 'Database System Concepts', 'Comp. Sci.', 3),
('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3),
('FIN-201', 'Investment Banking', 'Finance', 3),
('HIS-351', 'World History', 'History', 3),
('MU-199', 'Music Video Production', 'Music', 3),
('PHY-101', 'Physical Principles', 'Physics', 4);

## Let's do some Aggregate exercise

select dept_name, avg(salary)
from instructor
where dept_name = 'Music'; ## will assign random name to resulting column

select avg (salary) as avg_salary, dept_name    ## will assign avg_salary name to resulting column
from instructor
where dept_name  = 'Comp. Sci.';
select avg (tot_cred), dept_name from
student
where dept_name = 'Comp. Sci.';
## Let's create one more table named section
create table section (
courseid varchar(10),
secid integer(1),
semester varchar(30),
taughtyear year,
building varchar(20),
roomno integer(10),
timeslot varchar(5)
);

insert into section values
('BIO-101', 1 ,'Summer', 2017, 'Painter', 514, 'B'),
('BIO-301', 1, 'Summer' ,2018, 'Painter', 514, 'A'),
('CS-101', 1, 'Fall', 2017, 'Packard', 101, 'H'),
('CS-101', 1 ,'Spring', 2018 ,'Packard', 101 ,'F'),
('CS-190', 1, 'Spring', 2017, 'Taylor', 3128, 'E'),
('CS-190', 2, 'Spring', 2017, 'Taylor', 3128, 'A'),
('CS-315', 1 ,'Spring', 2018, 'Watson', 120, 'D'),
('CS-319', 1 ,'Spring', 2018, 'Watson', 100, 'B'),
('CS-319', 2, 'Spring', 2018, 'Taylor', 3128, 'C'),
('CS-347', 1 ,'Fall', 2017, 'Taylor', 3128, 'A'),
('EE-181' ,1 ,'Spring', 2017, 'Taylor', 3128, 'C'),
('FIN-201', 1 ,'Spring', 2018, 'Packard', 101, 'B'),
('S-351', 1, 'Spring', 2018, 'Painter', 514, 'C'),
('MU-199', 1 ,'Spring', 2018, 'Packard', 101, 'D'),
('PHY-101', 1 ,'Fall', 2017, 'Watson', 100, 'A');
create table teaches (
id integer(10),
courseid varchar(10),
secid integer(1),
semester varchar(30),
taughtyear year
);
insert into teaches values
(10101, 'CS-101', 1 ,'Fall', 2017),
(10101, 'CS-315', 1 ,'Spring', 2018),
(10101,'CS-347', 1 ,'Fall', 2017),
(12121, 'FIN-201', 1 ,'Spring', 2018),
(15151, 'MU-199', 1 ,'Spring', 2018),
(22222, 'PHY-101', 1, 'Fall', 2017),
(32343, 'HIS-351', 1, 'Spring', 2018),
(45565, 'CS-101', 1 ,'Spring', 2018),
(45565, 'CS-319', 1 ,'Spring', 2018),
(76766, 'BIO-101', 1 ,'Summer', 2017),
(76766, 'BIO-301', 1, 'Summer', 2018),
(83821, 'CS-190', 1 ,'Spring', 2017),
(83821, 'CS-190', 2 ,'Spring', 2017),
(83821, 'CS-319', 2 ,'Spring', 2018),
(98345, 'EE-181', 1 ,'Spring', 2017);

select count(distinct ID)     
from teaches
where semester = 'Spring' and year = 2010;

select * from instructor;

select count(*) from teaches;

SELECT count(*) FROM instructor where instructor.dept_name ='Comp. Sci.'; ### Count with where condition
select sum(salary), dept_name from instructor group by dept_name;
select count(*), semester from section group by semester;
#select COUNT(*)  FROM section
#  GROUP BY semester; ## Count with Distinct values  

select title , count(*) from course group by title having count(*)>1; ## Count with having clause

### Group By Clause
select dept_name, avg(salary) as avg_salary     ## Calculating the average salary in each department
from instructor
group by dept_name;
select dept_name, count(distinct instructor.id) as instr_count
from instructor, teaches
where instructor.id= teaches.id and semester = 'Spring' and year = 2010
group by dept_name;   ## calculate the number of instructors in each department who teach a course in the spring 2018 semester 

#### The Having Clause
select dept_name, avg(salary) as avg_salary
from instructor
group by dept_name
having avg (salary) > 42000; ### finding those departments where the average salary of the instructors is more than $42,000
select  avg (tot_cred), course_id,sec_id,semester
from student, takes
where student.ID= takes.ID and year = 2010
group by  sec_id
having count(student.ID) >= 2;
###### For each course section offered in 2017, find the average total credits (tot cred) of all students enrolled in the section, if the section has at least 2 students.
##### SUM Values

select sum(salary) from instructor;  # Select clause 
select sum(salary) from instructor where salary > 50000;   ### SUM with where condition
## Sum with Group By
## Sum with having


### MAX Function
select max(salary) from instructor;
### MIN Function
select min(salary) from instructor;

#### Index
show tables;

select * from instructor;

create index index_instructor_name
on instructor(Iname); 
alter table instructor
drop index index_instructor_name;

desc instructor;

## Combining two columns using index
create index index_instructor_name_Dept
on instructor(Iname,Dept);
alter table instructor 
drop index index_instructor_name_Dept;
create index dept_index on instructor (dept);
create unique index id_index_1 on instructor (id);
alter table instructor
drop index dept_index;
select * from instructor where dept='Comp. Sci.';
#### Dropping Index
alter table instructor
drop index index_instructor_name_Dept;
alter table instructor
drop index index_instructor_name;

### Use Explain Command
explain select * from instructor;
EXPLAIN SELECT * FROM instructor WHERE id = 10101;  ## Explain with where
SELECT * FROM instructor WHERE id = 10101


