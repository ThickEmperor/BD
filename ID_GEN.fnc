create or replace function ID_GEN(Opcion IN Char) return varchar2 is
  Result varchar2(6);
  cadena Int;
Begin
--____________________________________________________________
  If Opcion = 'Q' Then
     Select Max(to_number(Substr(Id_Quizz,4,3))) Into CADENA From P_QUIZZ;
     cadena:= to_char(cadena+1);
     Result:= 'QZZ'||cadena;
  End If;
--____________________________________________________________ 
--____________________________________________________________
  If Opcion = 'P' Then
     Select Max(to_number(Substr(Id_Pregunta,4,3))) Into CADENA From P_QUIZZ_PREGUNTA;
     cadena:= to_char(cadena+1);
     Result:= 'QZP'||cadena;
  End If;
--____________________________________________________________
--____________________________________________________________
  If Opcion = 'R' Then
     Select Max(to_number(Substr(Id_Respuesta,4,3))) Into CADENA From P_PREGUNTA_RESPUESTA;
     cadena:= to_char(cadena+1);
     Result:= 'PRR'||cadena;
  End If;
--____________________________________________________________
--____________________________________________________________
  If Opcion = 'U' Then
     Select Max(to_number(Substr(Id_Usuario_Quizz,4,3))) Into CADENA From P_USUARIO_QUIZZ;
     cadena:= to_char(cadena+1);
     Result:= 'UQZ'||cadena;
  End If;
--____________________________________________________________
--____________________________________________________________
  If Opcion = 'F' Then
     Select Max(to_number(Substr(Id_Usuario_Respuestas,4,3))) Into CADENA From P_USUARIO_RESPUESTAS;
     cadena:= to_char(cadena+1);
     Result:= 'URP'||cadena;
  End If;
--____________________________________________________________
  return(Result);
end ID_GEN;
/
