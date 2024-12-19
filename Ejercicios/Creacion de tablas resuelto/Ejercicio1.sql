create database CESUR;
use CESUR;

create table Alumno(
DNI varchar(9) primary key,
	Nombre varchar(15),
	Apellido varchar(20),
	Edad int
);
create table Grado(
	ID int primary key,
	Nombre varchar(15),
	Horas int
);
 /*MODIFICA LA TABLA ALUMNO AÑADIENDO UNA RENSTRICCION Y
LE DECIMOS QUE GRADO_ID HACE REFERENCIA AL ID DE GRADO*/
alter table alumno add column grado_id int;
alter table alumno add constraint fk_grado             
foreign key (grado) references grado(id);

insert into Alumno VALUES

("1A","Alejandro","Galvez","28","1"),
("2A","Alvaro","Peinado","22","2"),
("3A","Daniel","Jimenez","20","3"),
("4A","Esteban","Molina","22","4"),
("5A","Clara","Carmona","20","5");

insert into Grado VALUES

("1","DAW","150"),
("2","DAM","200"),
("3","ASIR","200"),
("4","Enfermeria","180"),
("5","Nutricion","250");

SELECT * FROM ALUMNO AS A INNER JOIN GRADO AS G ON A.GRADO=G.ID