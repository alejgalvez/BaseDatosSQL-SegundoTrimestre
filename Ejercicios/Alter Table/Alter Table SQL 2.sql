create database LA_LIGA;

use LA_LIGA;

create table EQUIPO(
		ID int not null,
		Nombre varchar(12), 
		Edad_media decimal(2,0),
		Color enum ('Unicolor','Multicolor'), 
		primary key(ID)
	);
    
create table JUGADOR(
		DNI varchar(9) not null,
		Nombre varchar(12), 
		Altura decimal(3,2),
		Fecha_nac DATE,
		Hora_nac TIME,
		primary key(DNI)
	);
    
insert into EQUIPO VALUES 
('1', 'BARCELONA', '24', 'Unicolor'),
('2', 'Madrid', '27', 'Multicolor'),
('3', 'Real socie', '24', 'Multicolor');
    
insert into JUGADOR VALUES
(101, 'MESSI', 1.42, '2000-12-12', '12:00:00', '1'),
('102', 'CRISTIANO', '1.32', '2001-01-01', '12:00:00', '1'),
('103', 'NEYMAR', '2.32', '2010-10-10', '12:00:00', '3');

    
Ejercicio 1.- Añade una nueva columna “Equipo” en la tabla JUGADOR

ALTER TABLE JUGADOR
ADD COLUMN EQUIPO INT

Ejercicio 2.- Haz que la columna Equipo sea FK referenciando al ID de la tabla equipo.

ALTER TABLE JUGADOR
ADD CONSTRAINT FK_EQUIPO
FOREIGN KEY (EQUIPO)
REFERENCES EQUIPO(ID)

Ejercicio 3.- Añade 5 filas de contenido a cada una de las tablas creadas.

insert into EQUIPO VALUES 
('1', 'BARCELONA', '24', 'Unicolor'),
('2', 'Madrid', '27', 'Multicolor'),
('3', 'Real socie', '24', 'Multicolor');
    
insert into JUGADOR VALUES
(101, 'MESSI', 1.42, '2000-12-12', '12:00:00', '1'),
('102', 'CRISTIANO', '1.32', '2001-01-01', '12:00:00', '1'),
('103', 'NEYMAR', '2.32', '2010-10-10', '12:00:00', '3');

Ejercicio 4.- Añade una nueva columna (no nula) “Numero” de tipo numérico en la tabla JUGADOR que por defecto contenga el valor 1.

ALTER TABLE JUGADOR
ADD COLUMN NUMERO INT DEFAULT 1

Ejercicio 5.- Modifica la tabla JUGADOR para que el contenido del jugador con nombre Messi tenga el número 10.

UPDATE JUGADOR
SET DNI ="10"
WHERE NOMBRE = "MESSI"

Ejercicio 6.- Elimina las filas de la tabla EQUIPO con edad media superior a 26.

DELETE 
FROM EQUIPO
WHERE EDAD > 26

Ejercicio 7.- Elimina la columna Hora_nac de la tabla JUGADOR.

ALTER TABLE JUGADOR
DROP COLUMN HORA_NAC


Ejercicio 8.- Elimina una fila de contenido de la tabla JUGADOR de nombre Messi.

DELETE
FROM JUGADOR
WHERE NOMBRE = "MESSI"

Ejercicio 9.- Elimina la tabla JUGADOR.

DROP TABLE JUGADOR

Ejercicio 10.- Elimina la base de datos LA_LIGA.

DROP DATABASE LA_LIGA