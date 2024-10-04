create database ddlexercise;
use ddlexercise;
drop table student;
CREATE TABLE Student (
    StudentId INTEGER ,
    FName VARCHAR(10), 
    Gender CHAR(1) ,  
    DOJ DATE);
#SELECT DATE_FORMAT("2017-06-15", "%M %d %Y");

Insert INTO Student(StudentId,FName,Gender,DOJ)
values (1001 ,'Alex','M','2015-01-23'),
	   (1002 ,'Alica','F','2015-08-12');
SELECT * from Student;
##Altering table to add contact No.
ALTER TABLE Student 
ADD ContactNo INTEGER;
Insert INTO Student(ContactNo)
values('657435632');
ALTER TABLE Student
Modify Gender CHAR(2);
ALTER TABLE Student
Rename column ContactNo TO updatedContactNo;
#SELECT * from Student

#### TCL Commands
