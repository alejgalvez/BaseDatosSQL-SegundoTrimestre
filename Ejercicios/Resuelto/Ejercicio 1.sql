CREATE DATABASE POKEMON_GO;
USE POKEMON_GO;

CREATE TABLE POKEMON (
	ID int primary key not null,
    	Nombre varchar(15),
    	Tipo enum("ROCA","TIERRA","PLANTA"),
    	Altura decimal(4,2),
    	Edad decimal (3,0),
    	Fecha_nac DATE
);

INSERT INTO POKEMON VALUES
	(1, 'JON', 'TIERRA', '1.20', '123', '2001-12-30'),
	(2,'MARCOS', 'TIERRA', '1.40', '11', '2012-10-18'),
	(3, 'CELIA', 'PLANTA', '1.00', '29', '2000-02-02'),
	(4, 'JUANMA', 'ROCA', '2.15', '32', '1999-01-01'),
	(5, 'JAVIER', 'TIERRA', '0.90', '2', '2002-07-12'),
	(6, 'CARMEN', 'PLANTA', '2.42', '14', '1997-03-27');

Ejercicio 1.- Muestra todos los datos de la tabla POKEMON.
Select * 
from POKEMON;
Ejercicio 2.- Muestra todos los nombres de los pokemon.
Select nombre 
from POKEMON;
Ejercicio 3.- Muestra todos los nombres de los pokemon junto a su edad.
Select nombre, edad 
from POKEMON;
Ejercicio 4.- Muestra todos los nombres de los pokemon ordenados alfabéticamente.
Select  nombre
from POKEMON 
order by nombre asc;
Ejercicio 5.- Muestra todos los nombres y edad de los pokemon ordenados de mayor a menor.
Select *
from POKEMON 
order by nombre,edad; 
Ejercicio 6.- Muestra el número de pokemons en total en la tabla POKEMON.
Select count (id)
from POKEMON;
Ejercicio 7.- Muestra la media de edad de los pokemon.
Select avg (edad)
from POKEMON;
Ejercicio 8.- Muestra la edad del pokemon con mayor edad de la tabla POKEMON.
Select max(Edad)
from POKEMON;
Ejercicio 9.- Muestra la altura del pokemon más pequeño de la tabla POKEMON.
Select min(Altura)
from POKEMON;
Ejercicio 10.- Muestra el tipo y nombre de los pokemon, ordenados alfabéticamente por el tipo y nombre de estos.
Select tipo,nombre 
from POKEMON 
order by tipo,nombre;
Ejercicio 11.- Muestra los 3 pokemon de más edad, ordenador de mayor a menor.
Select* 
from POKEMON
order by edad DESC
limit 3;
Ejercicio 12.- Muestra los datos del pokemon más mayor de la tabla POKEMON.
Select *
from POKEMON
order by edad DESC
limit 1;
Ejercicio 13.- Muestra los distintos tipos de Tipo de pokemon que existen en la tabla POKEMON sin que se repitan en el resultado.
Select distinct tipo
from POKEMON; 