CREATE OR REPLACE TRIGGER TG$ID_USUARIO$BEFORE
  before insert on p_usuario  
  for each row
declare
  -- local variables here
begin
  :New.Id_Usuario := USR_ID_GEN(:New.Nombre,:New.Apepat,:New.Apemat);
end TG$ID_USUARIO$BEFORE;
