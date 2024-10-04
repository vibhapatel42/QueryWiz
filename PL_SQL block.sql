-- SQL integration example--
-- A Simple PL/SQL Block
BEGIN
    DBMS_OUTPUT.PUT_LINE(SYSDATE);
END;
/

--Same block with declaration section
DECLARE
l_right_now VARCHAR2(9);
BEGIN
    l_right_now := SYSDATE;
    DBMS_OUTPUT.PUT_LINE(l_right_now);
END;
/

-- Same blok with exception handler
DECLARE
l_right_now VARCHAR2(4);
BEGIN
l_right_now := SYSDATE;
DBMS_OUTPUT.PUT_LINE (l_right_now);
EXCEPTION
WHEN VALUE_ERROR
THEN
DBMS_OUTPUT.PUT_LINE('I bet l_right_now is too small '
|| 'for the default date format!');
END;
/
-- Nested Block
PROCEDURE calc_totals
IS
year_total NUMBER;
BEGIN
year_total := 0;
/* Beginning of nested block */
DECLARE
month_total NUMBER;
BEGIN
month_total := year_total / 12;
END ;
--set_month_total;
/* End of nested block */
END;
/
