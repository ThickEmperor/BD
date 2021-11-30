create or replace trigger TG$ID_USR_QZZ$BEFORE
  before insert on p_usuario_quizz  
  for each row
declare
  -- local variables here
begin
  :New.Id_Usuario_Quizz:= ID_GEN('U');
end TG$ID_USR_QZZ$BEFORE;
/
