create table precios(
  fecha_inicio date,
  fech_fin date,
  cod_art char(7),
  precio number(7,2),
constraint precios_pk primary key (fecha_inicio,cod_art)
);

create table articulos(
  cod_art char(7)
    constraint articulos_pk primary key,
  nombre varchar2(40)
    constraint articulos_nn1 not null,
  marca varchar2(20)
    constraint articulos_nn2 not null,
  modelo varchar2(15)
    constraint articulos_nn3 not null
);

alter table precios add constraint articulos_fk1 foreign key(cod_art) references articulos;

create table pertenecer(
  cod_art char(7),
  id_sec number(3),
constraint pertenecer_pk primary key (cod_art,id_sec)
);

alter table pertenecer add constraint pertenecer_fk1 foreign key(cod_art) references articulos on delete cascade;

create table secciones(
  id_sec number(3)
    constraint secciones_pk primary key,
  id_supersec number(3),
  nombre varchar2(40)
    constraint secciones_uk1 unique
    constraint secciones_nn1 not null
);

alter table pertenecer add constraint pertenecer_pk2 foreign key(id_sec) references secciones;
alter table secciones add constraint secciones_fk1 foreign key(id_supersec) references secciones;
alter table precios add constraint precios_ck1 check (fecha_inicio<fech_fin);
alter table precios add constraint precios_ck2 check (precio>0);

alter table secciones add constraint secciones_uk2 unique(id_supersec);
alter table articulos add constraint articulos_ck1 check (modelo like '%-%');
alter table precios_historicos add  constraint precios_ck3 check (fecha_inicio>=to_date('1/1/2015','dd/mm/yyyy') AND fecha_inicio<=to_date('31/12/2015','dd/mm/yyyy'));
alter table precios_historicos add  constraint precios_ck4 check (fecha_final>=to_date('31/12/2015','dd/mm/yyyy'));
alter table articulos modify(nombre varchar2(50));
alter table precios rename to precios_historicos;
alter table precios_historicos rename column fech_fin to fecha_final;
