drop table customersnew;
create TABLE customersnew
(ID INT,
name VARCHAR2(50),
Age INT,
Address VARCHAR2(20),
salary DECIMAL(10,2));
INSERT INTO CUSTOMERSNEW VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00);
INSERT INTO CUSTOMERSNEW VALUES (2, 'Khilan', 25, 'Delhi', 1500.00);
INSERT INTO CUSTOMERSNEW VALUES (3, 'Kaushik', 23, 'Kota', 2000.00);
INSERT INTO CUSTOMERSNEW VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00);
INSERT INTO CUSTOMERSNEW VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00);
INSERT INTO CUSTOMERSNEW VALUES (6, 'Komal', 22, 'MP', 4500.00);
COMMIT;
select * from CUSTOMERSNEW;
DELETE from CUSTOMERSNEW;
-- Internal Cursor
DECLARE  
   total_rows number(2); 
BEGIN 
   UPDATE customersnew 
   SET salary = salary + 500; 
   IF sql%notfound THEN 
      dbms_output.put_line('no customers selected'); 
   ELSIF sql%found THEN 
      total_rows := sql%rowcount;
      dbms_output.put_line( total_rows || ' customers selected '); 
   END IF;  
END; 
/       
select * from CUSTOMERSNEW;
COMMIT;
-- Explicit cursor
DECLARE 
   c_id customersnew.id%type; 
   c_name customersnew.name%type; 
   c_addr customersnew.address%type; 
   CURSOR c_customers is 
      SELECT id, name, address FROM CUSTOMERSNEW; 
BEGIN 
   OPEN c_customers; 
   LOOP 
   FETCH c_customers into c_id, c_name, c_addr; 
      EXIT WHEN c_customers%notfound; 
      dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr); 
   END LOOP; 
   CLOSE c_customers; 
END; 
/
-- Table based record
DECLARE 
   customer_rec CUSTOMERSNEW%rowtype; 
BEGIN 
   SELECT * into customer_rec 
   FROM CUSTOMERSNEW 
   WHERE id = 5;  
   dbms_output.put_line('Customer ID: ' || customer_rec.id); 
   dbms_output.put_line('Customer Name: ' || customer_rec.name); 
   dbms_output.put_line('Customer Address: ' || customer_rec.address); 
   dbms_output.put_line('Customer Salary: ' || customer_rec.salary); 
END; 
/

-- Cursor Based Records
DECLARE 
   CURSOR customer_cur is 
      SELECT id, name, address  
      FROM CUSTOMERSNEW; 
   customer_rec customer_cur%rowtype; 
BEGIN 
   OPEN customer_cur; 
   LOOP 
      FETCH customer_cur into customer_rec; 
      EXIT WHEN customer_cur%notfound; 
      DBMS_OUTPUT.put_line(customer_rec.id || ' ' || customer_rec.name); 
   END LOOP; 
END; 
/
-- User defined record
DECLARE 
   type books is record 
      (title varchar(50), 
      author varchar(50), 
      subject varchar(100), 
      book_id number); 
   book1 books; 
   book2 books; 
BEGIN 
   -- Book 1 specification 
   book1.title  := 'C Programming'; 
   book1.author := 'Nuha Ali ';  
   book1.subject := 'C Programming Tutorial'; 
   book1.book_id := 6495407;  
   -- Book 2 specification 
   book2.title := 'Telecom Billing'; 
   book2.author := 'Zara Ali'; 
   book2.subject := 'Telecom Billing Tutorial'; 
   book2.book_id := 6495700;  
  
  -- Print book 1 record 
   dbms_output.put_line('Book 1 title : '|| book1.title); 
   dbms_output.put_line('Book 1 author : '|| book1.author); 
   dbms_output.put_line('Book 1 subject : '|| book1.subject); 
   dbms_output.put_line('Book 1 book_id : ' || book1.book_id); 
   
   -- Print book 2 record 
   dbms_output.put_line('Book 2 title : '|| book2.title); 
   dbms_output.put_line('Book 2 author : '|| book2.author); 
   dbms_output.put_line('Book 2 subject : '|| book2.subject); 
   dbms_output.put_line('Book 2 book_id : '|| book2.book_id); 
END; 
/

-- Triggers
CREATE OR REPLACE TRIGGER display_salary_changes 
BEFORE DELETE OR INSERT OR UPDATE ON CUSTOMERSNEW 
FOR EACH ROW 
WHEN (NEW.ID > 0) 
DECLARE 
   sal_diff number; 
BEGIN 
   sal_diff := :NEW.salary  - :OLD.salary; 
   dbms_output.put_line('Old salary: ' || :OLD.salary); 
   dbms_output.put_line('New salary: ' || :NEW.salary); 
   dbms_output.put_line('Salary difference: ' || sal_diff); 
END; 
/ 
-- let's trigger the trigger
INSERT INTO CUSTOMERSNEW (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (7, 'Kriti', 22, 'HP', 7500.00 ); 
UPDATE CUSTOMERSNEW 
SET salary = salary + 500 
WHERE id = 2;
delete customersnew where id=4;