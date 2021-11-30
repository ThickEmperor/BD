create or replace trigger TG$ID_PREGUNTA$BEFORE
  before insert on p_quizz_pregunta  
  for each row
declare
  -- local variables here
begin
  :New.Id_Pregunta:= ID_GEN('P');
end TG$ID_PREGUNTA$BEFORE;
/
