create or replace trigger TG$PUNTAJE$BEFORE
  before insert on p_usuario_quizz  
  for each row
declare
  -- local variables here
begin
  :New.Puntaje := CALIFICACION(:New.Id_Quizz);
end TG$PUNTAJE$BEFORE;
/
