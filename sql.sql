CREATE TABLE Persona (
DNI varchar (10),
Nombre varchar (20) NOT NULL,
Primer_Apellido varchar (20) NOT NULL,
CONSTRAINT pk_Persona PRIMARY KEY (DNI)
);

CREATE TABLE Planificacion (
Codigo int (20),
Fecha date NOT NULL,
CONSTRAINT pk_Planificacion PRIMARY KEY (Codigo)
);

CREATE TABLE Gimnasio (
Nombre varchar (50),
CONSTRAINT pk_Gimnasio PRIMARY KEY (Nombre)
);


CREATE TABLE Entrenador (
id int AUTO_INCREMENT,
DNIPersona varchar (10) NOT NULL,
Salario float (4) NOT NULL,
NombreGimnasio varchar (50) NOT NULL,
CONSTRAINT pk_Entrenador PRIMARY KEY (id),
CONSTRAINT fk_Entrenador_Persona FOREIGN KEY (DNIPersona) REFERENCES
Persona (DNI),
CONSTRAINT fk_Entrenador_Gimnasio FOREIGN KEY (NombreGimnasio)
REFERENCES Gimnasio (Nombre)
);CREATE TABLE Cliente (
id int AUTO_INCREMENT,
DNIPersona varchar (10) NOT NULL,
Fecha date NOT NULL,
CONSTRAINT pk_Cliente PRIMARY KEY (id),
CONSTRAINT fk_Cliente_Persona FOREIGN KEY (DNIPersona) REFERENCES
Persona (DNI)
);


CREATE TABLE Entrenador_Planificacion_Cliente (
id int AUTO_INCREMENT,
idCliente int NOT NULL,
codigoPlanificacion int (20) NOT NULL,
idEntrenador int NOT NULL,
CONSTRAINT pk_Entrnador_Planificacion_Cliente PRIMARY KEY (id),
CONSTRAINT fk_Entrnador_Planificacion_Cliente_Cliente FOREIGN KEY (idCliente)
REFERENCES Cliente (id),
CONSTRAINT fk_Entrnador_Planificacion_cliente_Entrenador FOREIGN KEY
(idEntrenador) REFERENCES Entrenador (id),
CONSTRAINT fk_Entrnador_Planificacion_Cliente_Planificacion FOREIGN KEY
(codigoPlanificacion) REFERENCES Planificacion (Codigo)
);CREATE TABLE Entrenamiento (
CodigoPlanificacion int (20) NOT NULL,
Codigo int (20),
Fecha date NOT NULL,
CONSTRAINT pk_Entrenamiento PRIMARY KEY (Codigo),
CONSTRAINT fk_Entrenamiento_Planificacion FOREIGN KEY (CodigoPlanificacion)
REFERENCES Planificacion (Codigo)
);


CREATE TABLE Ejercicio (
Nombre varchar (50),
NumeroDeRepeticiones int (2) NOT NULL,
NumeroDeSeries int (2) NOT NULL,
CONSTRAINT pk_Ejercicio PRIMARY KEY (Nombre)
);

CREATE TABLE Entrenamiento_Ejercicio (
id int AUTO_INCREMENT,
NombreEjercicio varchar (50) NOT NULL ,
CodigoEntrenamiento int (20) NOT NULL,
CONSTRAINT fk_Entrenamiento_Ejercicio_Ejercicio FOREIGN KEY (NombreEjercicio)
REFERENCES Ejercicio (Nombre),
CONSTRAINT fk_Entrenamiento_Ejercicio_Entrenamiento FOREIGN KEY
(CodigoEntrenamiento) REFERENCES Entrenamiento (Codigo),
CONSTRAINT pk_Entrenamiento_Ejercicio PRIMARY KEY (id)
);


CREATE TABLE Material (
Nombre varchar (50),
CONSTRAINT pk_Material PRIMARY KEY (Nombre)
);

CREATE TABLE Ejercicio_Material (
id int AUTO_INCREMENT,
NombreMaterial varchar (50) NOT NULL,
NombreEjercicio varchar (50) NOT NULL,
CONSTRAINT pk_Ejercicio_Material PRIMARY KEY (id),
CONSTRAINT fk_Ejercicio_Material_Material FOREIGN KEY(NombreMaterial)
REFERENCES Material (Nombre),
CONSTRAINT fk_Ejercicio_Material_Ejercicio FOREIGN KEY(NombreEjercicio)
REFERENCES Ejercicio (Nombre)
);
