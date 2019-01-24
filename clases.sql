create table empresas(
  cif char(9)
    constraint empresas_pk primary key,
  nombre varchar2(25)
    constraint empresas_uk1 unique
    constraint empresas_nn1 not null,
  telefono char(9),
  direccion varchar2(50)
);

create table alumnos(
  dni char(9)
    constraint alumnos_pk primary key,
  nombre varchar2(50)
    constraint alumnos_nn1 not null,
  apellido1 varchar2(50)
    constraint alumnos_nn2 not null,
  apellido2 varchar2(50)
    constraint alumnos_nn3 not null,
  direccion varchar2(50),
  telefono char(2),
  edad number(2),
  cif char(9)
    constraint alumnos_fk references empresas(cif)
);

create table profesores(
  dni char(9)
    constraint profesores_pk primary key,
  nombre varchar2(50)
    constraint profesores_nn1 not null,
  apellido1 varchar2(50)
    constraint profesores_nn2 not null,
  apellido2 varchar2(50)
    constraint profesores_nn3 not null,
  direccion varchar2(50),
  telefono char(9)
);

create table tipos_curso(
  cod_curso char(8)
    constraint tipos_curso_pk primary key,
  titulo varchar2(50)
    constraint tipos_curso_uk1 unique,
  temario clob
);

create table cursos(
  n_curso number(3)
    constraint cursos_pk primary key,
  fecha_inicio timestamp,
  fecha_fin timestamp,
  cod_curso char(8)
    constraint cursos_fk1 references tipos_curso(cod_curso),
  dni_profesor char(9)
    constraint cursos_fk2 references profesores(dni)
);

create table asistir(
  dni char(9)
    constraint asistir_fk1 references alumnos(dni),
  n_curso number(3)
    constraint asistir_fk2 references cursos(n_curso),
  nota number(4,2),
  constraint asistir_pk primary key (dni,n_curso)
);


