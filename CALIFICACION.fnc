CREATE OR REPLACE FUNCTION CALIFICACION(Quizz In Varchar2) Return Integer Is
CORRECTAS Integer;
TOTAL Integer;
RESULT INTEGER;
Begin
  Select Count(*)Into total From P_QUIZZ_PREGUNTA T Where t.id_quizz = Quizz Group By t.id_quizz ;
  Select Sum(correcta)Into CORRECTAS From P_PREGUNTA_RESPUESTA Where Id_Quizz = Quizz;
  RESULT:=CORRECTAS*100/TOTAL;
  RETURN(RESULT);
END CALIFICACION;
