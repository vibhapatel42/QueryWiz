select * from instructor;
select distinct dept_name	from instructor;
select all dept_name	from instructor;
select * from instructor;
select  '437';
select '437' as FOO;
select  'Z'	from instructor;
select ID, name, salary/12 from instructor;
select ID, name, salary/12  as monthly_salary from instructor;
select name,salary	from instructor	where dept_name = 'Finance';
select name from instructor where dept_name = 'Comp. Sci.' and salary > 70000;
select name from instructor where dept_name = 'Music' and salary <= 70000;
select name from instructor where dept_name = 'Comp. Sci.' and salary between 70000 and 90000;
select * from instructor, teaches;
select instructor.name,teaches.course_id from instructor cross join teaches;
select * from instructor cross join teaches;
select name, course_id from instructor , teaches where instructor.ID = teaches.ID;
select name, course_id,dept_name from instructor , teaches where instructor.ID = teaches.ID
and  instructor. dept_name = 'Finance';

#Find the names of all instructors who have a higher salary than 
#some instructor in 'Comp. Sci'.


select distinct T.name, T.salary,S.name,S.salary from instructor as T, 
instructor as S 
where T.salary > S.salary and S.dept_name = 'Comp. Sci.';

select name	from instructor	where name like '%zar%';
select name	from instructor	where name like '__';
select name	from instructor	where name like '__ZAR%';
## String Operators
SELECT CONCAT('My', 'S', 'QL');
insert into instructor values ('22224', 'Einstein', 'Physics', '75000');
insert into instructor values ('21236', 'Wu', 'Physics', '30000');
select name,salary from instructor order by salary desc,name desc;
select distinct name, dept_name, salary from instructor order by dept_name,name,salary;
select name, salary from instructor where salary between 30000 and 900000;
select name, salary from instructor where salary >=30000 and salary<= 90000;

select name, course_id from instructor, teaches 
where (instructor.ID, dept_name) = (teaches.ID, 'Biology');
select course_id from student, takes
where (student.ID, dept_name)=(takes.ID,'Biology');
#Find courses that ran in Fall 2017 or in Spring 2018
(select course_id,building from section where semester = 'Fall' and year = 2009) union
(select course_id,building  from section where semester = 'Spring' and year = 2010);
(select course_id,building  from section where semester = 'spring' and year = 2010);
#Find courses that ran in Fall 2017 and in Spring 2018
#(select course_id  from section where sem = 'Fall' and year = 2017) intersect
#(select course_id  from section where sem = 'Spring' and year = 2018);
SELECT DISTINCT s1.course_id
FROM section s1
JOIN section s2 ON s1.course_id = s2.course_id
WHERE s1.semester = 'Fall' AND s1.year = 2009
AND s2.semester = 'Spring' AND s2.year = 2010;
SELECT DISTINCT s1.course_id
FROM section s1
JOIN section s2 ON s1.course_id = s2.course_id;
##With join and IN
SELECT DISTINCT s1.course_id
FROM section AS s1
JOIN section AS s2 ON s1.course_id = s2.course_id
WHERE s1.semester = 'Fall' AND s1.year = 2009
  AND s1.course_id Not IN (SELECT course_id FROM section WHERE semester = 'Spring' AND year = 2010);



#Find courses that ran in Fall 2010 but not in Spring 2009
#(select course_id  from section where sem = 'Fall' and year = 2017) except
#(select course_id  from section where sem = 'Spring' and year = 2018);
select distinct course_id from section where semester='Fall' and year = 2009 and semester != 'Spring' and year != 2010;
SELECT DISTINCT s1.course_id
FROM section AS s1
LEFT JOIN section AS s2 ON s1.course_id = s2.course_id
WHERE s1.semester = 'Fall' AND s1.year = 2009
  AND s2.course_id IS NULL
  AND s2.semester = 'Spring' AND s2.year = 2010;

select name from instructor	where salary is not null;
## Subqueries


#Find the average salary of instructors in the Computer Science department 
select dept_name, avg (salary) avg_salary from instructor where dept_name= 'Comp. Sci.';
#Find the total number of instructors who teach a course in the Spring 2018 semester
select count(ID) from teaches where semester = 'Spring' and year = 2010;
#Find the number of tuples in the course relation
select count(*)  from course;
#Find the average salary of instructors in each department
select dept_name, avg (salary) avg_salary from instructor group by dept_name;
select dept_name, sum(salary) from instructor 	group by dept_name;
select S.course_id, count(distinct S.ID), C.title 
from takes S inner join course C on S.course_id=C.course_id group by S.course_id;
#Find the names and average salaries of all departments whose average salary is greater than 42000
select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name
having avg (salary) > 42000;

#Find courses offered in Fall 2017 and in Spring 2018
select distinct course_id
from section
where semester = 'Fall' and year= 2009 and  course_id in 
(select course_id from section
where semester = 'Spring' and year= 2010);
select course_id from section
where semester = 'Fall' and year= 2009;
select course_id from section
where semester = 'Spring' and year= 2010;
#Find courses offered in Fall 2009 but not in Spring 2010
select distinct course_id
from section
where semester = 'Fall' and year= 2009;
select course_id from section
where semester = 'Spring' and year= 2010;
select distinct course_id
from section
where semester = 'Fall' and year= 2009 and course_id  not in 
(select course_id from section
where semester = 'Spring' and year= 2010);

#Name all instructors whose name is neither “Mozart” nor Einstein”
select distinct name from instructor
where  name not in ('Mozart', 'Einstein');
select distinct name from instructor
where  salary in (75000, 95000);
#Find the total number of (distinct) students who have taken course sections taught by the instructor with ID 10101
select count(distinct ID)
from takes
where (course_id, sec_id, semester, year) in 
(select course_id, sec_id, semester, year
from teaches
where teaches.ID= 10101);

#Find names of instructors with salary greater than that of some (at least one) instructor in the Biology department.
select distinct T.name,T.salary, S.name, S.salary
from instructor as T, instructor as S
where T.salary > max(S.salary) and S.dept_name = 'Comp. Sci.';

## Same query using Some clause
select name,salary
from instructor
where salary > some (select salary from instructor where dept_name = 'Comp. Sci.');

#Find the names of all instructors whose salary is greater than the salary of all instructors in the Biology department.
select name,salary
from instructor
where salary < all (select salary from instructor where dept_name = 'Finance');

## Use of Exists clause
## Find all courses taught in both fall 2009 semester and spring 2010 semester
select course_id  from section as S  where semester = 'Fall' and year = 2009 and 
not exists  
(select * from section as T where semester = 'Spring' and year= 2010 and 
S.course_id = T.course_id);
   
## Use of not exists clause
## Find all students who have taken all courses offered in the Biology department.
#select distinct S.ID, S.name
#from student as S
#where not exists ( (select course_id from course where dept_name = 'Biology') except
#(select T.course_id from takes as T where S.ID = T.ID));
SELECT DISTINCT S.ID, S.name
FROM student AS S
WHERE S.ID NOT IN (
    SELECT T.ID
    FROM takes AS T
    WHERE T.course_id IN (SELECT course_id FROM course WHERE dept_name = 'Biology')
);
SELECT T.ID
    FROM takes AS T
    WHERE T.course_id IN (SELECT course_id FROM course WHERE dept_name = 'Biology');
SELECT course_id FROM course WHERE dept_name = 'Biology';
## Find all courses that were offered at most once in 2017

#select T.course_id from course as T where unique
#(select R.course_id from section as R where T.course_id= R.course_id and R.year = 2017);

SELECT DISTINCT T.course_id
FROM course AS T
WHERE not EXISTS (
    SELECT 1
    FROM section AS R
    WHERE T.course_id = R.course_id AND R.year = 2009
);

SELECT 1
    FROM section AS R
    WHERE R.year = 2009;
## Subqueries in FROM clause
## Find the average instructors’ salaries of those departments where the average salary is greater than $42,000.”
select dept_name,avg(salary) from instructor group by dept_name having avg(salary)>42000;
select dept_name, avg(salary) as avg_salary from instructor
group by dept_name having avg_salary>42000;

select dept_name, avg_salary from 
( select dept_name, avg (salary) as avg_salary from instructor
group by dept_name) as finaltable
where avg_salary > 42000;

## Another Query
select dept_name, avg_salary from 
(select dept_name, avg (salary) from instructor group by dept_name) 
as finaldept (dept_name,avg_salary)
where avg_salary > 42000;

## With Clause
## Find all departments with the maximum budget 
with max_budget(value) as (select max(budget) from department) 
select dept_name from department, max_budget where department.budget = max_budget.value;

select max(budget) from department;

## Complex queries using WITH clause
# Find all departments where the total salary is greater than the average of the total salary at all departments
with dept_total (dept_name, value) as
        (select dept_name, sum(salary)
         from instructor
         group by dept_name),
dept_total_avg(value) as
       (select avg(value)
       from dept_total)
select dept_name
from dept_total, dept_total_avg
where dept_total.value > dept_total_avg.value;

## Scalar Subquery-Where single value is expected
## List all departments along with the number of instructors in each department
select dept_name, ( select count(*) from instructor where department.dept_name = instructor.dept_name) 
as num_instructors from department;
select dept_name, count(*) from instructor group by dept_name;

insert into instructor 
select ID, name, dept_name,30000  from   student
where   dept_name = 'Finance' and tot_cred > 4;

select * from instructor;

select ID, name, dept_name from   student
where   dept_name = 'Music' and tot_cred > 14;
### DML###
#Updates
update instructor set salary = salary*1.05 
where salary < (select avg(salary)  from instructor);
#Increase salaries of instructors whose salary is over $100,000 by 3%, and all others by a 5% 
update instructor	set salary = salary * 1.03  where salary > 70000 and dept_name = 'Finance' ;     
update instructor   set salary = salary * 1.05  where salary <= 100000;

update instructor  set salary = case
when salary <= 100000 then salary * 1.05
else salary * 1.03
end;

# Recompute and update tot_creds value for all students
#update student S set tot_cred = (select sum(credits) from takes, course
#where takes.course_id = course.course_id  and S.ID= takes.ID.and 
#takes.grade <> 'F' and takes.grade is not null);
#Sets tot_creds to null for students who have not taken any course
#Instead of sum(credits), use:
#case when sum(credits) is not null then sum(credits)  else 0 end













## Joins
#List the names of instructors along with the course ID of the courses that they taught
select name, course_id from  student, takes;
select name, course_id from instructor, teaches where instructor.ID =teaches.ID; 
select name, course_id from  student, takes where student.ID = takes.ID;
### Natural Join
select name, course_id from instructor natural join teaches;
select name, course_id from student natural join takes;
select * from student natural join takes;

-- List the names of students instructors along with the titles of courses that they have taken
select name, title from student natural join takes, course where takes.course_id = course.course_id;
##Incorrect version
select *   from student natural join takes natural join course;
select name, title  from  (student natural join takes)  join course using (course_id);

select * from  student join takes on student.ID  = takes.ID;
#equivalent to
select *  from  student , takes where  student.ID  = takes.ID;
select * from course natural left outer join prereq where course.course_id=prereq.course_id;
select * from course natural right outer join prereq where course.course_id=prereq.course_id;
select * from course natural join prereq using(course_id);
select * from course full join prereq using (course_id);
select * from course inner join prereq on course.course_id=prereq.course_id;



create view faculty as select ID, name, dept_name from instructor;
select * from faculty;
# Find all instructors in the Biology Department
select * from faculty where dept_name = 'Biology';

insert into faculty values ('30766', 'Bob', 'Music');

## Create a view of department salary totals
 create view departments_total_salary(dept_name, total_salary) as 
 select dept_name, sum(salary) from instructor group by dept_name;

select total_salary from departments_total_salary where dept_name = 'Comp. Sci.';

## Views defined using other views
create view physics_fall_2009 as select course.course_id, sec_id, building, room_number 
from course, section where course.course_id = section.course_id and 
course.dept_name = 'Physics' and section.semester = 'Fall' and section.year = 2009;
select * from physics_fall_2009;
create view physics_fall_2009_watson as select course_id, room_number 
from physics_fall_2009 where building= 'Watson';

select * from physics_fall_2009_watson;

## Expand the view physics_fall_2009_watson
create view physics_fall_2009_watson as
    select course_id, room_number
    from (select course.course_id, building, room_number
          from course, section
          where course.course_id = section.course_id
               and course.dept_name = 'Physics'
               and section.semester = 'Fall'
               and section.year = '2009') as physicsfalltable
     where building= 'Watson';

select * from physics_fall_2009_watson;

create view instructor_info as select ID, name, building from instructor, department 
where instructor.dept_name = department.dept_name;
insert into instructor_info 
             values ('69987', 'White', 'Taylor');

create view history_instructors as
  select * from instructor   where dept_name= 'History';
insert into history_instructors 
             values ('69987', 'White', 'Taylor', null);

## Creating index

create index studentID_index on student(ID);
select * from  student where  ID = '12345'
