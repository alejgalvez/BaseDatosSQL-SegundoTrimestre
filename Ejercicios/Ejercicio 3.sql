CREATE DATABASE IF NOT EXISTS Netflix;
USE Netflix;

CREATE TABLE IF NOT EXISTS Peliculas(
	ID int primary key,
    Nombre VARCHAR(30),
    Duracion INT,
    Director VARCHAR(20),
    Genero ENUM ('acción', 'drama', 'comedia'),
    Nota FLOAT
);

CREATE TABLE IF NOT EXISTS Reparto(
	DNI VARCHAR(9) primary key,
    Nombre VARCHAR(30),
    Apellido VARCHAR(30),
    Fecha_nac DATE
);

ALTER TABLE Peliculas ADD COLUMN Protagonista VARCHAR(9), 
ADD CONSTRAINT `FK_PROTAGONISTA` 
FOREIGN KEY (Protagonista) 
REFERENCES Reparto(DNI);

INSERT INTO Reparto (DNI, Nombre, Apellido, Fecha_nac) VALUES
("1234", "Will", "Smith", "1985-12-13"),
("1357", "Salma", "Hayek", "1976-02-11"),
("1222", "George", "Clooney", "2000-02-23"),
("1265", "Adam", "Sandler", "1980-12-13"),
("1212", "Nemo", " ", "1985-01-07");


INSERT INTO Peliculas (ID, Nombre, Duracion, Director, Genero, Nota, Protagonista) VALUES
(1, 'Bright', 120, 'Fernando', 'acción', 3.1, "1234"),
(2, 'Frida', 100, 'Daniel', 'drama', 7.6, "1357"),
(3, 'Los dos papas', 160, 'Adrián', 'comedia', 8.3, "1222"),
(4, 'Animales nocturnos', 185, 'Tomás', 'drama', 9.5, "1357"),
(5, 'Oceans Eleven', 150, 'Nuria', 'acción', 3.5, "1222"),
(6, 'Buscando a Nemo', 120, 'Jon', 'comedia', 2.1, "1212"),
(7, 'El Hoyo', 110, 'Ivan', 'acción', 9.9, "1265"),
(8, 'Diamante en bruto', 140, 'Paola', 'acción', 8.1, "1265");

Ejercicio 1.- Muestra los DNI y nombres de los actores de reparto junto con el tiempo total de duración de sus peliculas. Utiliza la función GROUP BY para agrupar los resultados.

Ejercicio 2.- Muestra los DNIs de los actores de reparto junto con las peliculas que hayan rodado.

SELECT R.DNI, P.NOMBRE
FROM REPARTO AS R INNER JOIN PELICULAS AS P ON R.DNI=P.PROTAGONISTA;

Ejercicio 3.- Muestra el nombre de las peliculas junto con el apellido de su protagonista que hayan realizado películas de acción y hayan nacido más tarde de 1984.

SELECT P.NOMBRE, R.APELLIDO
FROM REPARTO AS R INNER JOIN PELICULAS AS P ON R.DNI=P.PROTAGONISTA
WHERE P.GENERO LIKE "ACCIÓN" AND YEAR(R.FECHA_NAC)>1984;

Ejercicio 4.- Muestra los nombres de las 3 peliculas con mayor puntuación junto con nombre y apellido del protagonista.

SELECT P.NOMBRE, R.NOMBRE, R.APELLIDO
FROM REPARTO AS R INNER JOIN PELICULAS AS P ON R.DNI=P.PROTAGONISTA
ORDER BY P.NOTA DESC 
LIMIT 3;
 
Ejercicio 5.- Muestra la fecha de nacimiento del actor más joven de la tabla, y la media de las notas de las películas en una tabla que nombre las columnas como JOVEN y MEDIA. 

SELECT MAX(R.FECHA_NAC) AS JOVEN, AVG(P.NOTA) AS MEDIA
FROM REPARTO AS R INNER JOIN PELICULAS AS P ON R.DNI=P.PROTAGONISTA;

Ejercicio 6.- Muestra todos los datos de las películas que coincida que el nombre de la pelicula y el apellido su protagonista tengan el mismo número de caracteres. Haz que en el resultado no se repitan los resultados y muestra todos los datos sin especificar las columnas que se quieren mostrar.

SELECT P.*
FROM REPARTO AS R INNER JOIN PELICULAS AS P ON R.DNI=P.PROTAGONISTA
WHERE CHAR_LENGTH(P.NOMBRE)=CHAR_LENGTH(R.APELLIDO);

Ejercicio 7.- Muestra los nombres y apellidos de todos los actores de la tabla reparto junto al nombre y nota de las peliculas en las que han trabajado. Ordena el resultado en orden alfabético por el nombre de los actores y por la nota de las películas que han rodado (de mayor a menor).

SELECT R.NOMBRE, R.APELLIDO, P.NOMBRE, P.NOTA
FROM REPARTO AS R INNER JOIN PELICULAS AS P ON R.DNI=P.PROTAGONISTA
ORDER BY R.NOMBRE ASC, P.NOTA DESC;

Ejercicio 8.- Muestra los nombres de los actores junto con la nota de la pelicula con mayor puntuación que hayan rodado. Utiliza la función GROUP BY para agrupar los resultados.
