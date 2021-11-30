CREATE OR REPLACE TRIGGER TG$ONLY_PROF$BEFORE
  before insert on p_quizz  
  for each row
declare
  -- local variables here
  cadena Varchar2(15);
  Cursor cursor1 Is
  Select u.perfil From P_Usuario u Where u.id_usuario =:New.Id_Usuario;
  
Begin
Open cursor1;
     Fetch cursor1 Into cadena;
     dbms_output.put_line(cadena);
     If Not  cadena = 'Profesor' Then
     raise_application_error(-20000,'Solo un profesor puede crear un quizz');
     End If;
Close cursor1;  
end TG$ONLY_PROF$BEFORE;
/
