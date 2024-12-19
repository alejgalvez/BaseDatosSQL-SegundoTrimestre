create database concesionario;
use concesionario;

create table coche(
	id int auto_increment primary key,
    matricula varchar(8) constraint chk_matricula check (char_length(matricula)=8 and matricula like "%-%") unique not null,
	precio decimal (8,2) constraint chk_precio check (precio between 10000.00 and 1000000.00),
    color enum("negro","blanco","azul","rojo","gris") default "negro"
)auto_increment = 2000;

create table vendedor(
	dni varchar(9) constraint chk_dni check(char_length(dni)=9) primary key,
    nombre varchar(10) constraint chk_nombre check(nombre like "%a%a%" and nombre like "%r%") not null,
    apellido varchar(20) constraint chk_apellido check(apellido like "%s" and char_length(apellido)>=8),
    direccion varchar(100) constraint chk_direccion check(direccion like "%Avenida%" or direccion like "%Calle%"and (direccion like "%bloque%" or direccion like "%numero%")),
    email varchar(20) constraint chk_email check(email like "%@%" and email like "%gmail%" or email like "%hotmail%" and (email like "%.com" or email like "%.es")) not null
);


create table venta(
	id_venta int auto_increment primary key,
    coche int,
    empleado varchar(9) constraint chk_empleado check(char_length(empleado)=9),
    fecha_venta date constraint chk_fecha_venta check(month(fecha_venta) between 6 and 8)
);


alter table venta add constraint fk_coche
foreign key (coche) references coche(id);

alter table venta add constraint fk_empleado
foreign key (empleado) references vendedor(dni);


insert into coche (matricula) values
("4356-BJG");

insert into vendedor (dni,nombre,email) values
("26503436A","Alvaro","ale@gmail.com");

select * from coche;
select * from vendedor;
