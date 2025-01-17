create database Netflix;
use Netflix;

create table peliculas(
	id int primary key auto_increment,
    nombre varchar(15),
    duracion int constraint chk_duracion check(duracion between 50 and 100),
	director varchar(20),
    genero enum("accion","terror","aventura","comedia"),
    puntuacion decimal (2,1),
    fecha date
);

insert into peliculas (NOMBRE, DURACION, DIRECTOR, GENERO, PUNTUACION, FECHA) values
('A todo gas',120,'Rob Cohen','accion',6.3,'2001-10-12'),
('Hereditary',137,'Ary Aster','terror',9.1,'2018-02-22'),
('Avatar',154,'James Cameron','aventura',7.8,'2010-12-04'),
('Silent Hill',180,'Chirstopher Gans','terror',4.4,'2003-01-01'),
('Project X',98,'Nima Nourizadeh','comedia',5.8,'2012-06-16'),
('Anabelle',105,'Jhon R.Leonetti','terror',7.1,'2006-09-10');

Ejercicio 1.- Modifica la duración de las peliculas para que se muestre el contenido en horas en vez de en minutos

update peliculas
set duracion = duracion/60;

Ejercicio 2.- Modifica la Puntuación para que se muestren 2 decimales en vez de 1

update peliculas
set puntuacion = puntuacion decimal (3,2)

Ejercicio 3.- Modifica el número de caracteres permitidos en Nombre para que admita 25 caracteres

alter table peliculas
modify nombre varchar(25)

Ejercicio 4.- Añade una nueva fila a la tabla con los datos de la película "La cabaña en el bosque"

("La cabaña en el bosque", 95, "Drew Goddard", "terror", 7.0, "2012-04-13");

Ejercicio 5.- Modifica la columna Puntación para que se llame Puntos

alter table peliculas
rename column puntuación to puntos

Ejercicio 6.- Añade una nueva columna Crítica que admita los valores (MALA, REGULAR, BUENA, MUY BUENA)

alter table peliculas
add column critica enum("mala","regular","buena","muy buena")

Ejercicio 7.- Añade valores a la columa Crítica siguiendo los siguientes criterios.
- Si la pelicula tiene menos o igual a un 5 en la Puntuación, añade el valor MALA
- Si la pelicula tiene más de un 5 y menos de un 6.5 en la Puntuación, añade el valor REGULAR
- Si la pelicula tiene más o igual a un 6.5 y menos de un 8.5 en la Puntuación, añade el valor BUENA
- Si la pelicula tiene más o igual a un 8.5 en la Puntuación, añade el valor MUY BUENA

update peliculas
set critica = "mala"
where puntos<=5;

update peliculas
set critica = "regular"
where puntos >5 and puntos<6.5;

update peliculas
set critica = "buena"
where puntos>=6.5 and puntos<8.5;

update peliculas
set criticas = "muy buena"
where puntos>=8.5;

Ejercicio 8.- Elimina las filas de las películas con ID superior a 6

delete
from peliculas
where id>6;


Ejercicio 9.- Elimina las filas que sean del año 2010

delete
from peliculas
where year(fecha) = "2010";

Ejercicio 10.- Elimina las filas de las películas dirigidas por Ary Aster y tengan una duración menor a 3 horas

delete
from peliculas
where director = "Ary Aster" and duracion<3;

Ejercicio 11.- Elimina las filas de las películas que contengan una X en su nombre.

delete
from peliculas
where nombre like "%x%"

Ejercicio 12.- Elimina las filas de las películas del mes de enero, y que la crítica sea distina a BUENA o MUY BUENA.

delete 
from peliculas
where month(fecha)= 1 and critica != "buena" and critica != "muy buena";