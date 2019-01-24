create table localidades(
  id_localidad number(5)
    constraint localidades_pk primary key,
  nombre varchar2(50)
    constraint localidades_nn1 not null,
  poblacion number(8),
  n_provincia number(2)
    constraint localidades_nn2 not null
);

create table provincias(
  n_provincia number(2)
    constraint provincias_pk primary key,
  nombre varchar2(25)
    constraint provincias_uk1 unique
    constraint provincias_nn1 not null,
  superficie number(5),
  id_capital number(5)
    constraint provincias_uk2 unique
    constraint provincias_nn2 not null,
  id_comunidad number(2)
    constraint provincias_nn3 not null
);

alter table localidades add constraint localidades_fk foreign key(n_provincia)  references provincias;
alter table provincias add constraint provincias_fk foreign key (id_capital) references localidades;

create table comunidades (
id_comunidad number(2)
  constraint comunidades_pk primary key,
nombre varchar2(25)
  constraint comunidades_uk1 unique
  constraint comunidades_nn1 not null,
id_capital number(5)
  constraint comunidades_uk2 unique
  constraint comunidades_nn2 not null,
max_provincias number(1)
);

alter table comunidades add constraint comunidades_fk foreign key (id_capital) references localidades;
alter table provincias add constraint provincias_fk2 foreign key (id_comunidad) references comunidades;
