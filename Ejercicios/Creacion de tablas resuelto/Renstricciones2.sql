create database POKEMON_GO;
use POKEMON_GO;

create table POKEMON(
	id int auto_increment primary key,
	nombre varchar(15) constraint chk_nombre check(nombre not like "% %"),
	altura decimal(3,2) constraint chk_altura check(altura between 0.51 and 3.49),
	edad int constraint chk_edad check(edad between 1 and 100),
	fecha_nac date not null
)auto_increment=100;

create table ENTRENADOR(
	dni varchar(9) primary key constraint chk_dni check (dni regexp "[A-Za-z]"),
    nombre varchar(15),
    apellido varchar(20) constraint chk_apellido check (apellido like "%a%a%"),
    genero enum ("masculino","femenino","otros") not null,
    pokemon int
);

alter table entrenador add constraint fk_id
foreign key (pokemon) references pokemon(id);

insert into pokemon (nombre,altura,edad,fecha_nac) values

("Alejandro",1.73,28,"1996-05-22"),
("Esteban",1.80,22,"2002-10-29"),
("Daniel",1.70,19,"2005-01-04"),
("Clara",1.60,19,"2005-01-01");

insert into entrenador values

("26815735A", "Alberto","Gamea","masculino",100),
("26815735B", "Alfredo","Garcia","masculino",101),
("26815735C", "Laura","Jamanez","femenino",100),
("26815735D", "Khalid","Garrida","otros",103);

select * from pokemon;
select * from entrenador
