# BD
Tabla Usuarios
	Id [PK]
	Nombres
	Apellidos
	Matricula
	Tipo de usaurio (Profesor/Alumno)
	Fecha de creación de usuario
	# de quizzes (realizados/contestados)
Tabla Quiz
	Id [PK]
	Nombre del quizz
	# de preguntas
	Fecha de creación de quizz
	Usuario que creo el quizz [FK--->Usuarios/Id]
Tabla Preguntas
	Id de la pregunta[PK]
	Id del quizz al que pertenece [FK--->Quiz/Id]
	# de pregunta
	Descripción de la pregunta
	Tipo de pregunta
	Opc.1
	Opc.2
	Opc.3
	Opc.4
	Respuesta
Tabla Resultados del usuario
	Id[PK]
	Usuario que realizo el quizz[FK--->Usuarios/ID]
	Quizz al que pertenece la pregunta[FK--->Quizz/ID]
	Pregunta que esta respondiendo[FK--->Preguntas/# de pregunta]
	Fecha que se contesto el quizz
	Respuesta
	Correcta/Incorrecta
Tabla (Vista) Quizzes contestados(se junte todo)
