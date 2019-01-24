create table puestos(
  cod_puesto number(2)
    constraint puestos_pk primary key,
  titulo_puesto varchar2(25)
    constraint puestos_uk1 unique
    constraint puestos_nn1 not null,
  salario_min number(11,2),
  salario_max number(11,2)
);

create table historial(
  cod_puesto number(2),
  cod_emp number(4),
  fecha_inicio date
    constraint historial_nn1 not null,
  fecha_fin date,
  cod_dep number(3),
  salario number(11,2),
  constraint historial_pk primary key (cod_puesto,cod_emp)
);

alter table historial add constraint historial_fk1 foreign key(cod_puesto) references puestos;

create table empleados(
  cod_emp number(4)
    constraint empleados_pk primary key,
  nombre varchar2(50)
    constraint empleados_nn1 not null,
  apellido1 varchar2(50)
    constraint empleados_nn2 not null,
  apellido2 varchar2(50)
    constraint empleados_nn3 not null,
  telefono char(9),
  direccion varchar2(50),
  email varchar2(50)
    constraint empleados_uk1 unique,
  cod_jefe number(4),
  cod_dep number(3)
);

alter table historial add constraint historial_fk2 foreign key(cod_emp) references empleados;

create table departamentos(
  cod_dep number(2)
    constraint departamentos_pk primary key,
  nombre_dep varchar2(25)
    constraint departamentos_uk1 unique
    constraint departamentos_nn1 not null,
  cod_resp number(4),
  cod_loc number(3)
);

alter table empleados add constraint empleados_fk2 foreign key(cod_dep) references departamentos;
alter table empleados add constraint empleados_fk1 foreign key(cod_jefe) references empleados;
alter table historial add constraint historial_fk3 foreign key(cod_dep) references departamentos;
alter table departamentos add constraint departamentos_fk1 foreign key(cod_resp) references empleados;

create table localizaciones (
  cod_localizacion number(3)
    constraint localizacionees_pk primary key,
  localidad varchar2(50)
    constraint localizaciones_nn1 not null,
  direccion varchar2(50),
  cp char(5),
  provincia varchar2(25)
);

alter table departamentos add constraint departamentos_fk2 foreign key(cod_loc) references localizaciones;

alter table empleados add (nif char(10) constraint empleados_nn4 not null);
alter table empleados add constraint empleados_uk2 unique (nif);
alter table departamentos drop constraint departamentos_nn1 cascade;
alter table localizaciones rename to locations;
alter table locations rename column localidad to poblacion;
alter table locations modify provincia constraint localizaciones_nn2 not null;
alter table locations modify direccion varchar2(40);
alter table historial add constraint historial_ck check(fecha_fin>fecha_inicio);