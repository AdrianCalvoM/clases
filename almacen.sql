create table tipos_pieza(
  tipo char(2)
    constraint tipos_pieza_pk primary key,
  descripcion varchar2(25)
    constraint tipos_pieza_nn1 not null
);

create table piezas (
  tipo char(2),
  modelo number(2),
  precio_venta number(11,4)
    constraint piezas_nn1 null,
  constraint piezas_pk primary key (tipo,modelo)
);

create table suministros (
  tipo char(2),
  modelo number(2),
  cif char(9),
  precio_compra number(11,4)
    constraint piezas_nn1 not null,
  constraint suministros_pk primary key (tipo,modelo,cif),
  constraint suministros_fk foreign key (tipo,modelo,cif)
);

create table empresas (
  cif char(9)
    constraint empresas_pk primary key ,
  nombre varchar2(50)
    constraint empresas_uk1 unique
    constraint empresas_nn1 not null,
  telefono char(9),
  direccion varchar2(50),
  localidad varchar2(50),
  provincia varchar2(50)
);

create table pedidos(
  n_pedido number(4)
    constraint pedidos_pk primary key,
  cif char(9)
    constraint pedidos_nn1 not null,
  fecha date
    constraint pedidos_nn2 not null,
  constraint pedidos_fk1 references empresas(cif),
);