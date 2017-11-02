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



create table reclamo (
id_reclamo INTEGER PRIMARY KEY,
id_factura_fk	INTEGER,
fecha			VARCHAR(10),
FOREIGN KEY (id_factura_fk) REFERENCES factura(id_factura)
)

create table detalle_reclamo(
	id_detelle INTEGER PRIMARY KEY,
	motivo	VARCHAR(75),
	desripcion	VARCHAR(200),
	id_detalle_factura_fk INTEGER,
	id_reclamo_fk	INTEGER,
	FOREIGN KEY (id_detalle_factura_fk) REFERENCES detalle_factura(id_detalle),
	FOREIGN KEY (id_reclamo_fk)			REFERENCES reclamo(id_reclamo)
)

DROP TABLE reclamo



create or alter procedure inserta_reclamo
@idFactura	INTEGER,
@idDetFac	INTEGER,
@motivo		VARCHAR(75),
@descipcion VARCHAR (200),
@retorno	VARCHAR(10) OUTPUT
AS 
	DECLARE @idReclamo INTEGER
	DECLARE @fecha varchar(10)
	DECLARE @idDetalleReclamo INTEGER
BEGIN
	BEGIN TRY
		BEGIN TRAN inserta
			SET @idReclamo=(SELECT id_reclamo FROM reclamo WHERE id_factura_fk=@idFactura)

			IF (@idReclamo is null)--si el id reclamo es nulo es porque no se a creado ese reclamo
			BEGIN
				SELECT @idReclamo= ISNULL((SELECT MAX(id_reclamo) FROM reclamo),0) +1---RECUPERA EL ULTIMO ID Y LO AGREGA UN NUMERO
				SET @fecha= (SELECT FORMAT (getdate(), 'dd/MM/yyyy') as VARCHAR);


				INSERT INTO reclamo(id_reclamo,id_factura_fk,fecha) VALUES
								   (@idReclamo,@idFactura,@fecha)
			END;--TERMINA EL IF

			IF (@idReclamo is not null)
			BEGIN
				SET @idDetalleReclamo= ISNULL((SELECT MAX(id_detelle) FROM detalle_reclamo),0)+1
				
				INSERT INTO detalle_reclamo(id_detelle, motivo, desripcion, id_detalle_factura_fk, id_reclamo_fk) 
							VALUES(@idDetalleReclamo,@motivo,@descipcion,@idDetFac,@idReclamo)
			SET @retorno=@@ERROR;


			END--TERMINA EL IF
			COMMIT TRAN inserta

	END TRY

	BEGIN CATCH
		SET @retorno=@@ERROR;	
		ROLLBACK TRAN  inserta
	END CATCH
END

execute inserta_reclamo 0,0,'',''


select * from reclamo
select * from detalle_reclamo


select * from factura
select * from detalle_factura


select * from producto

select * from categoria


create or alter function retorna_categoria()
RETURNS TABLE
RETURN
(
	select * from categoria where categoraia
)



SELECT * FROM retorna_categoria()



select * from producto where 
				nombre LIKE '%\'+'a'+'%' ESCAPE '\' OR
				nombre LIKE '%_'+'A'+'_%' ESCAPE '_'


select * from sub_categoria

drop table catalago

create table catalago(
id_catalago INTEGER PRIMARY KEY,
nombre		VARCHAR(25),
paginas		INTEGER,
fechaInicio	DATE,
fechaFin    DATE)


CREATE OR ALTER PROCEDURE crea_catalago
@nombre	VARCHAR(25),
@fechaI VARCHAR(10),
@fechaF	VARCHAR(10),
@paginas	INTEGER,
@retorno	VARCHAR(10) OUTPUT

AS
	DECLARE @idCatatalago	INTEGER
	DECLARE @fechaIconver	DATE
	DECLARE @fechaFconver	DATE

BEGIN
	BEGIN TRY
		BEGIN TRAN
			
			SET @idCatatalago= ISNULL((SELECT MAX(id_catalago) FROM catalago),0) +1---RECUPERA EL ULTIMO ID Y LO AGREGA UN NUMERO
			SET @fechaIconver= CONVERT(DATE, @fechaI, 120)
			SET @fechaFconver= CONVERT(DATE, @fechaF, 120)




			INSERT INTO catalago(id_catalago,	nombre,	paginas,	fechaInicio,	fechaFin) 
						VALUES  (@idCatatalago, @nombre,@paginas,	@fechaIconver,	@fechaFconver)

			SET @retorno=@@ERROR;
			PRINT @retorno
			COMMIT




	
	END TRY
	
	BEGIN CATCH
		SET @retorno=@@ERROR;
			PRINT @retorno

		ROLLBACK TRAN
	END CATCH	

END


EXECUTE crea_catalago 'Verano', '31/10/2017', '10/03/2018',24,''


select * from catalago




create or alter procedure crea 