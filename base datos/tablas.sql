alter table persona add unique (email)--para que el mail sea unico
alter table persona add unique (nit)--para que el mail sea unico





alter table afiliados_del_socio drop constraint id_persona_socio


create table persona (
id_persona	INTEGER PRIMARY KEY ,--IDENTITY,
nombre		VARCHAR(50),
apellido	VARCHAR(50),
email		VARCHAR(50),
contraseña	VARCHAR(25),
nit			VARCHAR(30),
id_rol_fk	TinyInt,
FOREIGN KEY (id_rol_fk) REFERENCES rol(id_rol))


CREATE TABLE direccion_entrega(
id_direccion	INTEGER PRIMARY KEY IDENTITY,
departamento	VARCHAR(25),
municipio		VARCHAR(25),
referencia		VARCHAR(75),
id_persona_fk	INTEGER,
FOREIGN KEY (id_persona_fk) REFERENCES persona(id_persona))

CREATE TABLE telefono(
id_telefono		INTEGER PRIMARY KEY IDENTITY,
telefono		VARCHAR(10),
id_persona_fk	INTEGER,
FOREIGN KEY (id_persona_fk) REFERENCES persona(id_persona))


create table rol (
id_rol	tinyInt PRIMARY KEY IDENTITY,
rol		VARCHAR(25))

drop table afiliados_del_socio
CREATE TABLE afiliados_del_socio(
	id_afiliado_del_socio	INTEGER PRIMARY KEY,
	id_persona_socio		INTEGER,
	id_persona_afiliado		INTEGER,
	FOREIGN KEY (id_persona_socio) REFERENCES persona(id_persona),
	FOREIGN KEY (id_persona_afiliado) REFERENCES persona(id_persona)
);

CREATE TABLE categoria(
id_categoria	INTEGER PRIMARY KEY IDENTITY,
categoraia		VARCHAR(75))

insert into categoria values('Jabones');
insert into categoria values('Lociones Para Dama');
insert into categoria values('Lociones Para Caballero');
insert into categoria values('Ropa');

select * from categoria



CREATE TABLE producto (
id_producto			INTEGER PRIMARY KEY IDENTITY,
nombre				VARCHAR(50),
existencia			INTEGER,
codigo_barras		VARCHAR(60),
descripcion			VARCHAR(150),
peso				DECIMAL(3,2),
precio_socio		DECIMAL(5,2),
precio_afiliado		DECIMAL(5,2),
calificacion_global	DECIMAL(2,2),
id_cat_fk			INTEGER,
url_imagen			VARCHAR(120),
marca				VARCHAR(25)

FOREIGN KEY (id_cat_fk) REFERENCES categoria(id_categoria))



CREATE TABLE detalle_producto(
id_detalle_producto INTEGER PRIMARY KEY IDENTITY,
numero_lote			INTEGER,
costo_unidad		DECIMAL(5,2),
unidades_del_lote	INTEGER,
existencia_lote		INTEGER,
fecha_ingreso		VARCHAR(10),
fecha_expiracion	VARCHAR(10),
id_producto_fk		INTEGER,

FOREIGN KEY (id_detalle_producto) REFERENCES producto(id_producto))


create table carrito_productos (
id_carrito		INTEGER PRIMARY KEY,
id_persona_fk	INTEGER,
id_producto_fk	INTEGER,
cantidad		INTEGER,
FOREIGN KEY(id_persona_fk)	REFERENCES persona(id_persona),
FOREIGN KEY(id_producto_fk)	REFERENCES producto(id_producto)
)

alter table carrito_productos add estado varchar(25);

select * from carrito_productos


create table sub_categoria(
id_subCategoria INTEGER PRIMARY KEY,
nombre_subCat	VARCHAR(50),
id_categoria_fk	INTEGER,
FOREIGN KEY (id_categoria_fk) REFERENCES categoria(id_categoria))


SELECT * FROM categoria



select * from producto