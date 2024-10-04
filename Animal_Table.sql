use ddlexercise;
create table animal (
ID INTEGER(11),
name varchar(45),
species varchar(45),
life_exp integer(11));
insert into animal
values (1,'Cat','Mammal',20),     
(2,'Elephant','Mammal',70),     
(3,'Trout','Fish',5),     
(4,'Shark','Fish',25),    
 (5,'Canary','Bird',20),     
 (6,'Albatross','Bird',40),     
 (7,'Swift','Bird',5);
 ALTER TABLE  animal MODIFY life_exp INT(3);
 
ALTER TABLE animal ADD Is_Extinct BOOL DEFAULT false;
SET sql_safe_updates=0; 

UPDATE animal SET Is_Extinct = TRUE;
INSERT INTO animal (id, name) VALUES (8, 'Beaver');
Delete from animal where life_exp<10;
ALTER TABLE  animal DROP Is_Extinct;
UPDATE animal SET life_exp = life_exp/2 WHERE name='Elephant';
SELECT * FROM animal WHERE species='Mammal' AND life_exp>40;

SELECT * FROM animal WHERE life_exp IS NULL;

UPDATE animal SET life_exp = 0 WHERE life_exp IS NULL;

select * from animal