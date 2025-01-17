Create database cesur;
use cesur;

CREATE TABLE ALUMNO(

DNI varchar(9),
nombre varchar(15),
apellido varchar(20),
edad INT,
PRIMARY KEY(DNI)
);


CREATE TABLE GRADO(

ID INT,
nombre varchar(15),
horas INT,
PRIMARY KEY(ID)
);

INSERT INTO ALUMNO (DNI, nombre, apellido, edad) values

('44566835T', 'jon', 'zamora', 32),
('44576835T', 'manuel', 'fernandez', 22),
('43466835T', 'lorena', 'aleman', 20),
('42166835T', 'pepe', 'gavilan', 18),
('41166835T', 'celia', 'flores', 40);

INSERT INTO GRADO (ID, nombre, horas) values

(001, 'DAM1', 430),
(002, 'DAW2', 300),
(003, 'ASIR1', 500),
(004, 'SMR1', 300),
(005, 'SMR2', 270);

ALTER TABLE ALUMNO ADD COLUMN grado int,
ADD CONSTRAINT `fk_id_grado` FOREIGN KEY (grado) REFERENCES GRADO (id);

Ejercicio 1.- Añade una nueva columna (no nula) “Ciudad” a la tabla ALUMNO de tipo caracteres (máximo 15 caracteres) que por defecto tenga “Malaga” como valor. 

ALTER TABLE ALUMNO
ADD COLUMN CIUDAD VARCHAR(15) NOT NULL DEFAULT "MALAGA";

Ejercicio 2.- Modifica la columna “Ciudad” para que acepte valores nulos.

ALTER TABLE ALUMNO
MODIFY CIUDAD VARCHAR(15) DEFAULT "MALAGA";

Ejercicio 3.- Modifica la columna “Ciudad” para que acepte valores de hasta 25 caracteres.

ALTER TABLE ALUMNO
MODIFY CIUDAD VARCHAR(25) DEFAULT "MALAGA";

Ejercicio 4.- Modifica el nombre de la columna “Ciudad” a “Localidad”.

ALTER TABLE ALUMNO
RENAME COLUMN CIUDAD TO LOCALIDAD; 

Ejercicio 5.- Añade una nueva columna “Media” en la tabla ALUMNO que sea de tipo decimal (con un decimal máximo) y pueda tener una nota máxima de 9,9.

ALTER TABLE ALUMNO
ADD MEDIA DECIMAL(2,1);

Ejercicio 6.- Modifica la columna “Media” para que acepte valores con 2 decimales, tenga el valor 0,0 por defecto y no pueda ser NULL.

ALTER TABLE ALUMNO
MODIFY MEDIA DECIMAL(3,2) NOT NULL DEFAULT 0,0;

Ejercicio 7.- Elimina la restricción de clave foránea de la columna Grado de la tabla ALUMNO.

ALTER TABLE ALUMNO
DROP FOREIGN KEY FK_ID_GRADO;

Ejercicio 8.- Elimina la restricción de clave primaria de la columna DNI de la tabla ALUMNO.

ALTER TABLE ALUMNO
DROP PRIMARY KEY;

Ejercicio 9.- Elimina la columna Grado de la tabla ALUMNO.

ALTER TABLE ALUMNO
DROP COLUMN GRADO

Ejercicio 10.- Añade una clave primaria a la tabla ALUMNO que sea un entero y se incremente de forma automática.

ALTER TABLE ALUMNO
ADD COLUMN ID_ALUMNO INT AUTO_INCREMENT PRIMARY KEY;

Ejercicio 11.- Añade una restricción a la columna Nombre de la tabla GRADO para que los valores del nombre siempre contenga el número 1 o el número 2.

ALTER TABLE GRADO
ADD CONSTRAINT CHK_NOMBRE CHECK (NOMBRE LIKE '%1%' OR NOMBRE LIKE '%2%');

Ejercicio 12- Elimina la restricción de la columna Nombre de la tabla GRADO

ALTER TABLE GRADO
DROP CONSTRAINT CHK_NOMBRE;

Ejercicio 13.- Modifica el nombre de la tabla GRADO a CICLO.

ALTER TABLE GRADO
RENAME GRADO TO CICLO;

Ejercicio 14.- Elimina las tablas CICLO y ALUMNO.

DROP TABLE CICLO, ALUMNO;

Ejercicio 15.- Elimina la base de datos CESUR.

DROP DATABASE CESUR; 