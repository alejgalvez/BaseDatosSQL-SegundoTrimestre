create database pruebaexamen2;
use pruebaexamen2;

create table tabla(
id int AUTO_INCREMENT primary key,
nombre varchar(10) not null CHECK (char_LENGTH(nombre) >= 5),
apellido varchar(10) constraint chk_apellido check(apellido not like '%s%s%s%'),
altura dec(3,2) not null,
edad int constraint chk_edad check (edad between 18 and 63),
direccion varchar(50) not null constraint chk_direccion check ((direccion like '%calle%' or direccion like '%avenida%') and (direccion like '%nº%' or direccion like '%bloque%') and (char_length(direccion) >= 10)),
genero enum('Masculino','Femenino','Otros') default 'Otros',
fecha date not null constraint chk_fecha check (month(fecha)!=6 and month(fecha)!=7 and month(fecha)!=8 and month(fecha)!=9),
email varchar(50) constraint chk_email check (email like '%@%' and (email like '%gmail%' or email like '%hotmail%'))
)auto_increment=50;

insert into tabla (nombre, altura, direccion, fecha) values
('Juanita', 1.75, 'calle San Miguel nº 10', '2022-05-15'),
('María', 1.68, 'avenida España bloque 3, 2ºA', '2022-02-15'),
('Pedro', 1.80, 'calle Mayor nº 25', '2022-02-21');

Ejercicio 2.- Realiza las siguientes modificaciones en la tabla del ejercicio 1.
- Modifica el nombre de la tabla*/

alter table tabla rename tablita;

- Modifica del nombre de la columna “email” a “correo”

alter table tablita drop check chk_email;
alter table tablita rename column email to correo;

- Modifica la restricción de la fecha para que permita valores de fechas contenidos en verano e invierno

alter table tablita drop check chk_fecha;
alter table tablita modify fecha date not null constraint chk_fecha check (month(fecha)=6 and month(fecha)=7 and month(fecha)=8 and month(fecha)=9 and month(fecha)=12 and month(fecha)=1 and month(fecha)=2 and month(fecha)=3);

- Modifica el atributo “altura” para que permita dos enteros con dos decimales

alter table tablita modify altura dec(4,2) not null;

- Modifica el atributo apellido para que añada un valor por defecto

alter table tablita drop check chk_apellido;
alter table tablita modify apellido varchar(10) constraint chk_apellido check(apellido not like '%s%s%s%') default "Ramirez"; 

- Añade el carácter “m” en el contenido de la altura (ejemplo, 1.90m)

alter table tablita modify altura varchar(10);
UPDATE tablita SET altura = CONCAT(altura, "m");

- Modifica el atributo Edad para que permita valores mayores de 65

alter table tablita drop check chk_edad;
alter table tablita modify edad int constraint chk_edad check ((edad between 18 and 63) or edad>65);

- Modifica el valor de género para que aparezca Femenino por defecto

alter table tablita modify genero enum('Masculino','Femenino','Otros') default 'Femenino';

- Elimina todos los registros que contengan un email de tipo “hotmail”

delete from tablita where correo like "%hotmail%";

- Elimina todos los registros que contengan género Masculino

delete from tablita where genero like "%masculino%";

- Elimina la columna ID

alter table tablita drop column id;

- Elimina la tabla del ejercicio

drop table tablita;