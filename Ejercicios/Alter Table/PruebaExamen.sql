create database Centro_adopcion;

use Centro_adopcion;

create table Perros(
	id int primary key,
    color enum("marron","gris","blanco")
);

create table Humanos(
	dni int primary key,
    sexo enum("f","m"),
    n_cuenta int
);

 INSERT INTO Perros (ID, nombre, edad, altura, raza, color, fecha_nac) values 
(1,'Toby',1,0.65,'Bulldog','marron','2018-10-10'),
(2,'Toby',5,1.20,'Pastor Alemán','gris','2015-01-12'),
(3,'Toby',12,2.05,'Galgo','blanco','2007-03-03'),
(4,'Toby',3,0.85,'Labrador','gris','2016-12-15'),
(5,'Toby',6,1.60,'Chihuahua','marron','2014-05-05');

 
 insert into Humanos (DNI, nombre, apellido, n_cuenta, edad, sexo) values
('44566880R','Jon','Zamora',12345678,22,'M',5),
('12300200M','Nuria','Lester',49213572,35,'F',3),
('42424242P','Aitor','Ramiro',67356870,43,'M',2),
('12345678L','Maria','Jimenez',68806005,19,'F',4);

alter table Humanos add constraint fk_perros foreign key (id) references Perros(id);

Ejercicio 5.- Inserta los siguientes datos en las tablas creadas.
- Inserta un nuevo perro con los siguientes datos:
- ID: 25
- Nombre: Timmy
- Edad: 3 años
- Altura: 1,85
- Raza: Shar Pei
- Color: Marrón
- Fecha_nac: 12 de octubre de 2016

insert into (25,"Timmy",3,1.85,"Shar Pei","Marrón","2016-10-12") values

- Añade en la tabla “Perros” una nueva columna “Estado” (Adiestrado o salvaje)
- Inserta valores para que el valor “Estado” no sea nulo
alter table Perros
add estado varchar(20) chk_estado check(estado in ("adiestrado","salvaje")) not null

Ejercicio 6.- Realiza las siguientes modificaciones de contenidos en las tablas creadas.

- Modifica la altura de los perros para que los datos se muestren en centímetros en vez de en metros

update Perros
set altura = altura/100

- Modifica la edad de los perros para que los datos se muestren en meses en vez de en años

#este esta mal, preguntar

update Perros
set year(fecha_nac) = month(fecha_nac)

- Añade en los nombres de los humanos el prefijo Sr o Sra dependiendo de su sexo

update Humanos
set nombre


- Modifica el atributo “sexo” para que aparezca Femenino o Masculino en vez de F o M

