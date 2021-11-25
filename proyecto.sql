Create Table Usuarios(
Idd Int Not Null,
Nombres Varchar2 (40) Not Null,
ApePat Varchar2(40) Not Null,
ApeMat Varchar2(40)Not Null,
Matricula Varchar2(12) Not Null,
Tipo Varchar2(10) Not Null,
Fecha Date Not Null,
NumQuizzes Int,
Constraint PK$IDD$USUARIOS Primary Key(Idd),
Constraint UK$Matricula$Usuarios Unique(Matricula)
);
Create Table Quiz(
Idd Int Not Null,
Nombre Varchar2 (40) Not Null,
NumPreguntas Int Not Null,
Fecha Date Not Null,
Creador Int Not Null,
Constraint PK$IDD$QUIZ Primary Key (Idd),
Constraint FK$CREADOR$USUARIOS Foreign Key (Creador) References Usuarios(Idd)
);
Create Table Preguntas(
Idd Int Not Null,
IdQ Int Not Null,
NumPregunta Int Not Null,
DescPregunta Varchar2(80) Not Null,
TipoPregunta Varchar2(15) Not Null,
Opc1 Varchar2(80),
Opc2 Varchar2(80),
Opc3 Varchar2(80),
Opc4 Varchar2(80),
Respuesta Varchar2(80),
Constraint PK$IDD$PREGUNTAS Primary Key (Idd),
Constraint FK$IDQ$QUIZ Foreign Key (IdQ) References Quiz(Idd)
);
Create Table Resultados(
Idd Int Not Null,
Usuario Int Not Null,
Quizz Int Not Null,
Pregunta Int Not Null,
Fecha Date Not Null,
Respuesta Varchar2(80),
Resultado Varchar2(10),
Constraint PK$IDD$RESULTADOS Primary Key(Idd),
Constraint FK$USUARIO$USUARIOS Foreign Key(Usuario) References Usuarios(Idd),
Constraint FK$QUIZZ$QUIZ Foreign Key(Quizz) References Quiz(Idd),
Constraint FK$PREGUNTA$PREGUNTAS Foreign Key(Pregunta) References Preguntas(Idd)
);
