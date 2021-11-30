create or replace function USR_ID_GEN(Nom In Varchar2,ApePat In Varchar2 ,Apemat In Varchar2) return varchar2 is
  Result varchar2(6);
  CADENA Int;
Begin
  Select Max(to_number(Substr(Id_Usuario,4,3))) Into CADENA From P_USUARIO;
  cadena:= to_char(cadena+1);
  Result:= Substr(Nom, 1, 1)|| Substr(ApePat, 1, 1) ||Substr(ApeMat, 1, 1)||cadena;
  
  return(Result);
end USR_ID_GEN;
/
