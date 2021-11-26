Create Table Usuarios(
IdU Varchar2(6) Not Null,--@@@###
Nombres Varchar2 (40) Not Null,
ApePat Varchar2(40) Not Null,
ApeMat Varchar2(40)Not Null,
Matricula Varchar2(12) Not Null,
Tipo Varchar2(10) Not Null,
Fecha Date Not Null,
NumQuizzes Int,
Email Varchar2(80),
Contrasenia Varchar2(30)
Constraint PK$IDU$USUARIOS Primary Key(IdU),
Constraint UK$Matricula$Usuarios Unique(Matricula)
);
--------------------------------------------------
Create Table Quiz(
IdQ Varchar2(6) Not Null,--QZ####
Nombre Varchar2 (40) Not Null,
NumPreguntas Int Not Null,
Fecha Date Not Null,
Creador Varchar2(6) Not Null,--@@@###
Constraint PK$IDQ$QUIZ Primary Key (IdQ),
Constraint FK$CREADOR$USUARIOS Foreign Key (Creador) References Usuarios(IdU)
);
-----------------------------------------------------
Create Table Preguntas(
IdP Varchar2(6) Not Null,--PR####
IdQ Varchar2(6) Not Null,--@@@###
NumPregunta Int Not Null,
DescPregunta Varchar2(80) Not Null,
TipoPregunta Varchar2(15) Not Null,
Opc1 Varchar2(80),
Opc2 Varchar2(80),
Opc3 Varchar2(80),
Opc4 Varchar2(80),
Respuesta Varchar2(80),
Constraint PK$IDP$PREGUNTAS Primary Key (IdP),
Constraint FK$IDQ$QUIZ Foreign Key (IdQ) References Quiz(IdQ)
);
----------------------------------------------------------
Create Table Resultados(
IdR Varchar2(6) Not Null,--QR####
Usuario Int Not Null,
Quizz Int Not Null,
Pregunta Int Not Null,
Fecha Date Not Null,
Respuesta Varchar2(80),
Resultado Varchar2(10),
Constraint PK$IDR$RESULTADOS Primary Key(IdR),
Constraint FK$USUARIO$USUARIOS Foreign Key(Usuario) References Usuarios(IdU),
Constraint FK$QUIZZ$QUIZ Foreign Key(Quizz) References Quiz(IdQ),
Constraint FK$PREGUNTA$PREGUNTAS Foreign Key(Pregunta) References Preguntas(IdP)
);
-------------------------------------------------------
Create Table ResultadosQuizz(
IdRQ Varchar2(6),--RQ####
IdQ Varchar2(6),--QZ####
Calificaion Number,--En el juego es precisión
Correcto Int,
Incorrecto Int,
Puntuacion Int,
TiempoRlz Time,
Correctas Int,
Incorrectas Int,
Racha Int,
Constraint PK$IDQR$RESULTADOSQUIZZ Primary Key(IdRQ),
Constraint FK$RESULTADOSQUIZZ$QUIZZ Foreign Key (IdQ) References Quiz(IdQ)
);
---------------------------------------------------------


Select Substr(Nombre, 1, 1)|| Substr(ApePat, 1, 1) ||Substr(ApeMat, 1, 1)
from tabla where idd = 1--Función generadora de ID
