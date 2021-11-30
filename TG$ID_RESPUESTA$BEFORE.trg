create or replace trigger TG$ID_RESPUESTA$BEFORE
  before insert on p_pregunta_respuesta  
  for each row
declare
  -- local variables here
begin
  :New.Id_Respuesta:= ID_GEN('R');
end TG$ID_RESPUESTA$BEFORE;
/
