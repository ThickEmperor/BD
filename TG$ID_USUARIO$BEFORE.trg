create or replace trigger TG$ID_USUARIO$BEFORE
  before insert on p_usuario  
  for each row
declare
  -- local variables here
begin
  Insert Into P_USUARIO Values
  (USR_ID_GEN(:New.Nombre,:New.Apepat,:New.Apemat),
  :New.Nombre,:New.Apepat,:New.Apemat,:New.Email,:New.Contrasenia,:New.Perfil);
end TG$ID_USUARIO$BEFORE;
/
