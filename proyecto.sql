------------------------------------------------------------
Create Table P_USUARIO(
Id_Usuario Varchar2 (6) Not Null,
Nombre Varchar2(50) Not Null,   
ApePat Varchar2(50) Not Null,
ApeMat Varchar2(50) Not Null,
Email Varchar2 (50) Not Null,
Contrasenia Varchar2(50) Not Null,
Perfil Varchar2(50),--(Alumno/Profesor)
Constraint PK$ID_USR$P_USUARIOS Primary Key(Id_Usuario),
Constraint UK$EMAIL$P_USR Unique(Email)
)
Insert Into P_USUARIO Values 
('AAA0','Default','Default','Default','Default0@default.com','DefaultPassword','Alumno');
Insert Into P_USUARIO Values 
('AAA1','Default','Default','Default','Default1@default.com','DefaultPassword','Alumno');
Select * From P_USUARIO
------------------------------------------------------------
Create Table P_QUIZZ(
Id_Quizz Varchar2(6) Not Null,
Id_Usuario Varchar2(6) Not Null,  
Titulo Varchar2(30) Not Null,
Fecha_Creacion Date Default Sysdate,
Descripcion_Quizz Varchar2(50),
Constraint PK$ID_QZ$P_QUIZZ Primary Key(Id_Quizz),
Constraint FK$P_QZ$P_USUARIOS Foreign Key(Id_Usuario) References P_USUARIO(Id_Usuario)
) 
Insert Into P_QUIZZ Values
('QZZ0','AAA0','Default',Default,'Default');
Insert Into P_QUIZZ Values
('QZZ1','AAA1','Default',Default,'Default');
Select * From P_QUIZZ
------------------------------------------------------------
Create Table P_QUIZZ_PREGUNTA(
Id_Pregunta Varchar2(6) Not Null,
Id_Quizz Varchar2(6) Not Null,   --A que quizz pertenece
Pregunta Varchar2(150) Not Null,     -- Pregunta perse
Tipo Varchar2 (25) Not Null,--(Abierta/Opc.Multiple/Check/Verdadero & Falso)
Constraint PK$ID_PRG$P_QZ_PRG Primary Key(Id_Pregunta),
Constraint FK$P_QZ_PRG$P_QZ Foreign Key(Id_Quizz) References P_QUIZZ(Id_Quizz)
)  
Insert Into P_QUIZZ_PREGUNTA Values
('QZP0','QZZ0','Default','Default');
Insert Into P_QUIZZ_PREGUNTA Values
('QZP1','QZZ1','Default','Default');
Select * From P_QUIZZ_PREGUNTA
------------------------------------------------------------
Create Table P_PREGUNTA_RESPUESTA(
Id_Respuesta Varchar2(6) Not Null,
Id_Quizz Varchar2(6) Not Null,      -- A que quizz pertenece
Id_Pregunta Varchar2(6) Not Null,   --A que pregunta pertence
Opciones Varchar2(250),             --Pueden ser varias o ninguna; el programa se encargara de diferenciarlas
Respuesta Varchar2(100),            --La respuesta correcta
Correcta Smallint,                  -- 1(correcta)/0(incorrecta)
Constraint PK$ID_RSP$P_QZ_RSP Primary Key(Id_Respuesta),
Constraint FK$P_PRG_RSP$P_QZ Foreign Key(Id_Quizz) References P_QUIZZ(Id_Quizz),
Constraint FK$P_PRG_RSP$P_QZ_PRG Foreign Key(Id_Pregunta) References P_QUIZZ_PREGUNTA(Id_Pregunta)
)
Insert Into P_PREGUNTA_RESPUESTA Values
('PRR0','QZZ0','QZP0','Default','Default',1);
Insert Into P_PREGUNTA_RESPUESTA Values
('PRR1','QZZ1','QZP1','Default','Default',1);
Select * From P_PREGUNTA_RESPUESTA
------------------------------------------------------------
Create Table P_USUARIO_QUIZZ(
Id_Usuario_Quizz Varchar2(6) Not Null,
Id_Usuario Varchar2(6) Not Null,         --El usuario que respondio el quizz
Id_Quizz Varchar2(6) Not Null,           --El quizz que respondio
Puntaje Int Not Null,                    --Calificacion obtenida(# de aciertos)
Fecha_Inicio timestamp Default Systimestamp,
Fecha_Final timestamp Default Systimestamp,
Tiempo_Realizacion timestamp Default Systimestamp,--fecha_final - fecha_inicio [FNC]
Constraint PK$ID_USR_QZ$P_USR_QZ Primary Key(Id_Usuario_Quizz),
Constraint FK$P_USR_QZ$P_QZ Foreign Key(Id_Quizz) References P_QUIZZ(Id_Quizz),
Constraint FK$P_USR_QZ$P_USR Foreign Key(Id_Usuario) References P_USUARIO(Id_Usuario)
)
Insert Into P_USUARIO_QUIZZ Values
('UQZ0','AAA0','QZZ0',1,Default,Default,Default);
Insert Into P_USUARIO_QUIZZ Values
('UQZ1','AAA1','QZZ1',1,Default,Default,Default);
Select * From P_USUARIO_QUIZZ
------------------------------------------------------------
Create Table P_USUARIO_RESPUESTAS(
Id_Usuario_Respuestas Varchar2(6) Not Null,
Id_Usuario_Quizz Varchar2(6) Not Null,    --El quizz que respondio el usuario
Id_Respuesta Varchar2(6) Not Null,        --La pregunta que esta respondiendo
Respuesta_Usuario Varchar2(50),           --Almacenamiento de la respuesta dada por el usuario
Constraint PK$ID_USR_RSP$P_USR_RSP Primary Key(Id_Usuario_Respuestas),
Constraint FK$P_USR_RSP$P_USR_QZ Foreign Key(Id_Usuario_Quizz) References P_USUARIO_QUIZZ(Id_Usuario_Quizz),
Constraint FK$P_USR_RSP$P_USR_RSP Foreign Key(Id_Respuesta) References P_PREGUNTA_RESPUESTA(Id_Respuesta)
)
Insert Into P_USUARIO_RESPUESTAS Values
('URP0','UQZ0','PRR0','Default');
Insert Into P_USUARIO_RESPUESTAS Values
('URP1','UQZ1','PRR1','Default');
Select * From P_USUARIO_RESPUESTAS
-------------------------------------------------------------------------------------------------------
--Función generadora de ID

Select USR_ID_GEN('Luis','Enrique','Rojas') From dual

Select ID_GEN('F') From dual
--__________________________________________________________________________________________________________-
create or replace view AUTOR_DEL_QUIZZ as
  --FECHA DE CREACION DEL QUIZZ Y AUTOR
SELECT DISTINCT ID_QUIZZ,DESCRIPCION_QUIZZ, FECHA_CREACION, U.NOMBRE FROM P_QUIZZ JOIN P_USUARIO U USING (ID_USUARIO)
Select * From Autor_del_quizz
--_______________________________________
Create Or Replace View stats_finales As
Select 
UQ.ID_USUARIO,
U.NOMBRE||' '||U.APEPAT||' '||U.APEMAT NOMBRE,
UQ.FECHA_INICIO,
UQ.TIEMPO_REALIZACION,
UQ.ID_QUIZZ,
Q.TITULO,
UQ.PUNTAJE,
(Select Sum(correcta)From P_PREGUNTA_RESPUESTA Where Id_Quizz = Q.ID_QUIZZ) ACIERTOS,
INCORRECTAS(UQ.ID_QUIZZ) INCORRECTAS,
US.NOMBRE||' '||US.APEPAT||' '||US.APEMAT PROFESOR,
US.ID_USUARIO
From P_USUARIO_QUIZZ UQ
Join P_QUIZZ Q On Q.ID_QUIZZ = UQ.ID_QUIZZ
Join P_USUARIO U On U.ID_USUARIO = UQ.ID_USUARIO 
Join P_USUARIO US On US.ID_USUARIO = Q.ID_USUARIO
Where ID_USUARIO_QUIZZ = 'UQZ2'
