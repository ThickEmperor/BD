create or replace trigger TG$ID_USR_RSP$BEFORE
  before insert on p_usuario_respuestas  
  for each row
declare
  -- local variables here
begin
  :New.Id_Usuario_Respuestas:= ID_GEN('F');
end TG$ID_USR_RSP$BEFORE;
/
