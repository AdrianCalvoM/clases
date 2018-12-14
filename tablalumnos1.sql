create table alumnos(
  dni char(9) constraint alumnos_pk primary key,
  nombre varchar2(40) constraint alumnos_nn1 not null,
  apellido1 varchar2(50) constraint alumnos_nn2 not null,
  apellido2 varchar2(50),
  direccion varchar2(50),
  telefono char(9),
  edad number(3)
);

create table empresas(
  cif char(9) constraint empresas_pk primary key,
  nombre varchar2(25) constraint empresas_uk1 unique
                      constraint empresas_nn1 not null,
  telefono char(9),
  direccion varchar2(50)
);

alter table alumnos add(
  cif char(9) constraint alumnos_fk1 references empresas on delete set null
  );