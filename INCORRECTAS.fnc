CREATE OR REPLACE FUNCTION INCORRECTAS(CORRECTAS IN INTEGER, TOTAL IN INTEGER) IS
RESULT INTEGER;
BEGIN
  RESULT:=TOTAL-CORRECTAS;
  RETURN(RESULT);
END INCORRECTAS:
/
