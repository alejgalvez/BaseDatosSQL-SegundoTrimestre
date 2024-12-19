CREATE DATABASE IF NOT EXISTS Netflix;
USE Netflix;


CREATE TABLE IF NOT EXISTS Peliculas(
	id_peli int,
    nombre_peli VARCHAR(30),
    duracion INT,
    director_peli VARCHAR(20),
    género_peli ENUM ('acción', 'drama', 'comedia'),
    nota_peli FLOAT,
    actor INT,
    primary key (id_peli)
);


CREATE TABLE IF NOT EXISTS Actores(
	id_actor INT,
    nombre VARCHAR(30),
    fecha_nac DATE,
    sueldo INT,
    sexo ENUM ('femenino', 'masculino', 'otros'),
    primary key (id_actor)
);

INSERT INTO Actores(id_actor, nombre, fecha_nac, sueldo, sexo) VALUES
(101, 'Leonardo', '1980-12-01' , 3000000, 'masculino'),
(102, 'Julia', '1997-09-09' , 1000000, 'femenino'),
(103, 'Brad', '1983-02-02' , 700000, 'masculino'),
(104, 'Carlos', '1986-03-03' , 250000, 'masculino'),
(105, 'Santiago', '1970-04-04' , 4000000, 'masculino'),
(106, 'Penelope', '1976-05-05' , 23000, 'femenino'),
(107, 'Noa', '1981-06-06' , 770000, 'otros'),
(108, 'Jon', '1996-07-07' , 6000, 'otros');

INSERT INTO Peliculas (nombre_peli, duracion, director_peli, género_peli, nota_peli, id_peli, actor) VALUES
('Bright', 120, 'Fernando', 'acción', 3.1, 1, 101),
('Frida', 100, 'Daniel', 'drama', 7.6, 2, 101),
('Los dos papas', 160, 'Adrián', 'comedia', 8.3, 3, 102),
('Animales nocturnos', 185, 'Tomás', 'drama', 9.5, 4, 107),
('Oceans Eleven', 150, 'Nuria', 'acción', 3.5, 5, 104),
('Buscando a Nemo', 120, 'Jon', 'acción', 2.1, 6, 103),
('El Hoyo', 110, 'Ivan', 'acción', 9.9, 7, 105),
('Diamante en bruto', 140, 'Paola', 'acción', 7, 8, 101);

1. Obten el nombre y la fecha de nacimiento de los actores con un sueldo menor que 1.000.000 y que su nombre
contenga la letra "e" o una letra "n" o tenga menos de 4 caracteres.
Ordena el resultado por la fecha de nacimiento de los actores, de mayor a menor.

SELECT NOMBRE, FECHA_NAC
FROM ACTORES
WHERE SUELDO < 1000000 AND NOMBRE LIKE "%E%N%" OR CHAR_LENGTH(NOMBRE)<4
ORDER BY FECHA_NAC;

2. Obten el nombre del actor que mas peliculas haya rodado junto con el numero de peliculas que haya rodado y 
que su sexo sea distinto a "Masculino". Muestra el resultado en dos columnas de nombre ACTOR y PELIS.

SELECT A.NOMBRE AS ACTOR, COUNT(P.ID_PELI) AS PELIS
FROM ACTORES AS A INNER JOIN PELICULAS AS P ON A.ID_ACTOR=P.ACTOR
WHERE A.SEXO != "MASCULINO"
GROUP BY A.NOMBRE;

3. Obten los nombres y sueldos de los actores que cobren mas del doble del sueldo "Noa".
Muestra los resultados en columnas llamadas NOM_ACTOR y SUELDO_ACTOR, ordenados por el sueldo de mayor a menor.

SELECT NOMBRE AS NOM_ACTOR, SUELDO AS SUELDO_ACTOR
FROM ACTORES
WHERE SUELDO > (2*(SELECT SUELDO FROM ACTORES WHERE NOMBRE LIKE "NOA"))
ORDER BY SUELDO DESC;

4. Obten el nombre de los actores nacidos en un mismo dia y mes, y hayan trabajado en una pelicula dirigida por 
"jon", "Adrian", "Nuria" o "Ivan". Muestra el resultado en una columna ACT ordenados por orden alfabetico.

SELECT A.NOMBRE AS ACT
FROM ACTORES AS A INNER JOIN PELICULAS AS P ON A.ID_ACTOR=P.ACTOR
WHERE P.DIRECTOR_PELI IN ("JON","ADRIAN","NURIA","IVAN") AND (MONTH(FECHA_NAC)=DAY(FECHA_NAC))
ORDER BY A.NOMBRE;

5. Obten todos los datos de las peliculas que contengan mas de una letra "o" en su nombre, su duracion sea menor
que la duracion de "Animales nocturnos" y su puntuacion sea mayor que la peliculas del actor "Carlos".
Ordena los resultados por la nota de la pelicula, de mayor a menor.

SELECT P.*
FROM PELICULAS AS P
WHERE P.NOMBRE_PELI LIKE "%O%O%" AND DURACION < (SELECT P.DURACION FROM PELICULAS AS P WHERE P.NOMBRE_PELI = "ANIMALES NOCTURNOS")
AND P.NOTA_PELI > (SELECT P.NOTA_PELI FROM ACTORES AS A INNER JOIN PELICULAS AS P ON A.ID_ACTOR=P.ACTOR WHERE A.NOMBRE = "CARLOS")
ORDER BY P.NOTA_PELI DESC;
