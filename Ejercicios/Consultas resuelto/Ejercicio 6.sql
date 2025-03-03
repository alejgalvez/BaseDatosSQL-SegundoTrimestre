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

Ejercicio 1.- Muestra los datos de los actores que hayan nacido antes del actor con DNI "1212" ordenador por Nombre.

SELECT *
FROM REPARTO 
WHERE FECHA_NAC < (SELECT FECHA_NAC FROM REPARTO WHERE DNI="1212");

Ejercicio 2.- Muestra los datos de los actores que hayan nacido el mes de febrero y tengan el mismo número de caracteres (o más) en el nombre que la actriz de apellido "Hayek".
 El resultado no debe incluir a la actriz con apellido "Hayek".
  
SELECT *  
FROM REPARTO
WHERE MONTH(FECHA_NAC)=2
AND CHAR_LENGTH(NOMBRE)>=(SELECT CHAR_LENGTH(NOMBRE) FROM REPARTO WHERE APELLIDO="HAYEK")
AND APELLIDO !="HAYEK";  

Ejercicio 3.- Muestra los DNIs de los actores junto con la media de puntuación de las películas que hayan rodado. No utilices la función GROUP BY.

SELECT R.DNI, (SELECT AVG(P.NOTA) FROM PELICULAS AS P WHERE P.PROTAGONISTA=R.DNI)
FROM REPARTO AS R;

 
Ejercicio 4.- Muestra los datos de la película con puntuación menor a la película rodada por el actor de nombre "Will".

SELECT P.*
FROM PELICULAS AS P
WHERE P.NOTA < (SELECT P.NOTA FROM REPARTO AS R INNER JOIN PELICULAS AS P ON R.DNI=P.PROTAGONISTA WHERE R.NOMBRE LIKE "WILL");
 
Ejercicio 5.- Muestra los datos de las películas con puntuación mayor que la película con mayor puntuación rodada por el actor de apellido "Clooney".
 Ordena los resultados por la puntuación de mayor a menor.

SELECT P.*
FROM REPARTO AS R INNER JOIN PELICULAS AS P ON R.DNI=P.PROTAGONISTA
WHERE P.NOTA > (SELECT MAX(P.NOTA) FROM REPARTO AS R INNER JOIN PELICULAS AS P ON R.DNI=P.PROTAGONISTA WHERE R.APELLIDO LIKE "CLOONEY")
 ORDER BY NOTA DESC;

Ejercicio 6.- Muestra el número de peliculas que haya rodado el protagonista de Oceans Eleven en una columna llamada "Número".

SELECT COUNT(P.ID) AS NUMERO 
FROM REPARTO AS R INNER JOIN PELICULAS AS P ON R.DNI=P.PROTAGONISTA
WHERE P.PROTAGONISTA = (SELECT P.PROTAGONISTA FROM REPARTO AS R INNER JOIN PELICULAS AS P ON R.DNI=P.PROTAGONISTA WHERE P.NOMBRE LIKE "OCEANS ELEVEN");

Ejercicio 7.- Muestra los datos de las películas con puntuación mayor que la peor película del actor que haya nacido en el mes de diciembre,
 y menor que la mejor película que haya rodado el mismo actor. El actor en cuestión no puede ser el mismo que haya rodado la película "Bright".

SELECT *
FROM PELICULAS
WHERE NOTA > (SELECT MIN(P.NOTA) FROM PELICULAS AS P INNER JOIN REPARTO AS R ON P.PROTAGONISTA=R.DNI 
WHERE MONTH(R.FECHA_NAC)=12)
AND NOTA < (SELECT MAX(P.NOTA)
FROM PELICULAS AS P INNER JOIN REPARTO AS R ON PROTAGONISTA=R.DNI
WHERE MONTH(R.FECHA_NAC)=12)
AND PROTAGONISTA <> (SELECT PROTAGONISTA FROM PELICULAS WHERE NOMBRE="BRIGHT");
 