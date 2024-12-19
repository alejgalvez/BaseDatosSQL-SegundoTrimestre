CREATE DATABASE NOTAS;
USE NOTAS;

CREATE TABLE ALUMNOS(
	DNI VARCHAR(9) PRIMARY KEY NOT NULL,
	NOMBRE VARCHAR(15) NOT NULL,
	APELLIDO VARCHAR(15) NOT NULL,
	EDAD DECIMAL (2,0),
    FECHA_NAC DATE,
    GENERO ENUM ("MASCULINO","FEMENINO","OTROS")
);

CREATE TABLE ASIGNATURAS(
	ID DECIMAL (1,0) PRIMARY KEY NOT NULL,
    NOMBRE VARCHAR(15),
    GRADO VARCHAR(6),
    CURSO ENUM ("1","2") NOT NULL
);

CREATE TABLE NOTAS(
	COD INT AUTO_INCREMENT PRIMARY KEY,
    NOTA DECIMAL(3,2),
    PROFESOR VARCHAR(20)
);

ALTER TABLE NOTAS ADD COLUMN ID_ALUMNO VARCHAR(9);
ALTER TABLE NOTAS ADD CONSTRAINT FK_ID FOREIGN KEY (ID_ALUMNO) REFERENCES ALUMNOS(DNI);

ALTER TABLE NOTAS ADD COLUMN ID_ASIGNATURA DECIMAL (1,0);
ALTER TABLE NOTAS ADD CONSTRAINT FK_ID2 FOREIGN KEY (ID_ASIGNATURA) REFERENCES ASIGNATURAS(ID);

INSERT INTO ALUMNOS VALUES

("26815739A","ALEJANDRO","GALVEZ","28","1996-05-22","MASCULINO"),
("26815736B","DANIEL","JIMENEZ","19","2005-01-04","MASCULINO"),
("26815760F","CLARA","CARMONA","19","2005-01-25","OTROS"),
("26815760T","ALVARO","PEINADO","22","2002-07-12","FEMENINO"),
("26815754F","JON","ZAMORA","34","1990-10-10","MASCULINO");

INSERT INTO ASIGNATURAS VALUES

("1","ALEJANDRO","DAW","1"),
("2","DANIEL","DAW","1"),
("3","ALVARO","DAM","2"),
("4","CLARA","DAM","2"),
("5","JON","DAW","1");

INSERT INTO NOTAS (NOTA, PROFESOR, ID_ALUMNO, ID_ASIGNATURA) VALUES
(6.35, "ANTONIO", "26815739A", "1")
(9.25, "JOSE ANTONIO", "26815736B", "2")
(7.55, "FRANCISCO", "26815760F", "4")
(8.15, "VICTOR", "26815760T", "3")
(9.50, "JOSE", "26815754F", "5");

SELECT * FROM NOTAS;