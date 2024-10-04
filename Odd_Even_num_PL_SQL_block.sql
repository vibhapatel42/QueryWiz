create table temp4 (id integer, no integer, even_odd varchar(30)); 
DECLARE
   x NUMBER := 50;
BEGIN
   FOR i IN 1..x LOOP
      IF MOD(i,2) = 0 THEN     -- i is even
         INSERT INTO temp1 VALUES (i, x, 'i is even');
      ELSE
         INSERT INTO temp1 VALUES (i, x, 'i is odd');
      END IF;
      x := x + 1;
   END LOOP;
   COMMIT;
END;
/
