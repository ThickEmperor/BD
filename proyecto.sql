--TABLA QUE ALVERGARÁ LOS DATOS DEL USUARIO
Create Table P_USUARIO(
Id_Usuario Varchar2 (6) Not Null,
Nombre Varchar2(50) Not Null,   
ApePat VARCHAR2(50) Not Null,
ApeMat VARCHAR2(50) Not Null,
Email Varchar2 (50) Not Null,
Contrasenia Varchar2(50) Not Null,
Perfil Varchar2(50),
Constraint PK$ID_USUARIO$P_USUARIOS Primary Key(Id_Usuario),
Constraint UK$EMAIL$P_USUARIO Unique(Email)
)
--EL PERFIL ES PARA SABER SI ES EL QUE HIZO EL QUIZZ O ES EL QUE LO RESPONDE

Create Table P_QUIZZ(
Id_Quizz Varchar2(6) Not Null,
Id_Usuario Varchar2(6) Not Null,  
Descripcion_quizz Varchar2(50),
Fecha_creacion Date Default Sysdate,
Constraint PK$ID_QUIZZ$P_QUIZZ Primary Key(Id_Quizz),
Constraint FK$P_QUIZZ$P_USUARIOS Foreign Key(Id_Usuario) References P_USUARIO(Id_Usuario)
) 


Create Table P_QUIZZ_PREGUNTA(
Id_Pregunta Varchar2(6) Not Null,
Id_Quizz Varchar2(6) Not Null,
Pregunta Varchar2(150) Not Null,     -- CUAL ES LA PREGUNTA
Opc1 Varchar2(100) Not Null,  -- LAS OPCIONES QUE PUEDE TENER LE PREGUNTA
Opc2 Varchar2(100) Not Null,
Opc3 Varchar2(100) Not Null,
Opc4 Varchar2(100) Not Null,
Respuesta Varchar2(100) Not Null,
Calificacion Integer Default 10,  --- CAMPO PARA SABER EL VALOR DE LA PREGUNTA DONDE EL VALOR POR DEFAULT VALDRA UN 10
Constraint PK$ID_PREGUNTA$P_QUIZZ_PREG Primary Key(Id_Pregunta),
Constraint FK$P_QUIZZ_PREGUNTA$P_QUIZZ Foreign Key(Id_Quizz) References P_QUIZZ(Id_Quizz)
)  -- 


--TABLA QUE REGISTRA QUE QUIZZ HACE UN DETERMINADO USUARIO
Create Table P_USUARIO_QUIZZ(
Id_Usuario_Quizz Varchar2(6) NOT NULL,
Id_Usuario Varchar2(6) NOT NULL,
Id_Quizz Varchar2(6) NOT Null,
Constraint PK$ID_USUARIO_QUIZZ$P_USER_QZZ Primary Key(Id_Usuario_Quizz),
Constraint FK$P_USUARIO_QUIZZ$P_USUARIO Foreign Key(Id_Usuario) References P_USUARIO(Id_Usuario),
Constraint FK$P_Quizz$P_QUIZZ Foreign Key(Id_Quizz) References P_Quizz(Id_Quizz)
)


Create Table P_USUARIO_QUIZZ_PREGUNTA(
Id_usuario_quizz_pregunta Varchar2(6) Not Null,
Id_usuario Varchar2(6) Not Null,
Id_pregunta Varchar2(6) Not Null,
Respuesta Int Not Null, --CON ESTO SE CHECA SI LA RESPUESTA ESTA CORRECTA O INCORRECTA
Tiempo_respuesta Date Default Sysdate,
Constraint PK$ID_USR_QZ_PRG$P_USR_QZ_PRG Primary Key(Id_Usuario_Quizz_Pregunta),
Constraint FK$P_USR_QZ_PRG$P_USR Foreign Key(Id_Usuario) References P_USUARIO(Id_Usuario),
Constraint FK$P_USR_QZ_PREG$P_PREG Foreign Key(Id_Pregunta) References P_Quizz_Pregunta(Id_Pregunta)
)
