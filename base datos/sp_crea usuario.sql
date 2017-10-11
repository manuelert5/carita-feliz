CREATE OR ALTER PROCEDURE crea_usuario 
	@nombre			VARCHAR(50), 
	@apellido		VARCHAR(50),
	@email			VARCHAR(50),
	@contraseña		VARCHAR(25),
	@nit			VARCHAR(25),
	@socio			INTEGER,
	@rol			TinyInt,
	@departamento	VARCHAR(25),
	@municipio		VARCHAR(25),
	@referencia		VARCHAR(75),
	@telefono		VARCHAR(10),
	@retorno		VARCHAR(100) OUTPUT
AS 
	DECLARE	@id_persona			AS INTEGER;
	DECLARE	@comprueba_email	AS INTEGER;
	DECLARE	@comprueba_nit		AS INTEGER;
	DECLARE @validacion			AS TINYINT;

BEGIN --Inicia SP
	SET @validacion=0;

	SET @comprueba_email	=	ISNULL((SELECT 1 FROM persona WHERE email=@email),0);
	SET @comprueba_nit		=	ISNULL((SELECT 1 FROM persona WHERE nit=@nit),0);
	
	IF(@comprueba_email=1)
	BEGIN
		SET @retorno='2627'+': El correo electronico ya existe!<br>';
	END;
	IF(@comprueba_nit=1)
	BEGIN
		SET @retorno=@retorno+'2627'+': El nit ya existe!<br>'+CHAR(10);
	END;

	PRINT @retorno;

	IF(@comprueba_email=0 AND @comprueba_nit=0)
	BEGIN--inicia if
		BEGIN TRAN insterta_persona --Inicia Transaccion
		BEGIN TRY

			SELECT @id_persona= ISNULL((SELECT MAX(id_persona) FROM PERSONA),0) +1---RECUPERA EL ULTIMO ID Y LO AGREGA UN NUMERO


			INSERT INTO persona (id_persona,	nombre,		apellido,	email,	contraseña,		nit,	id_rol_fk) VALUES 
								(@id_persona,	@nombre,	@apellido,	@email,	@contraseña,	@nit,	@rol);
		
		
			INSERT INTO	direccion_entrega (departamento,	municipio,	referencia,		id_persona_fk) VALUES
										  (@departamento,	@municipio,	@referencia,	@id_persona);
		
			INSERT INTO telefono (telefono,		id_persona_fk) VALUES
								 (@telefono,	@id_persona);
		
			IF @rol=2--si el rol es de un afiliado 
			BEGIN
				DECLARE @comprueba_socio AS INTEGER
				SET @comprueba_socio=ISNULL((SELECT 1 FROM persona WHERE id_persona=@socio AND id_rol_fk=1),0)
				--PRINT @comprueba_socio
				IF(@comprueba_socio=1)--SI ENCUENTRA ALGUN SOCIO
				BEGIN 
					DECLARE @id_afiliados_del_socio AS INTEGER
					SELECT @id_afiliados_del_socio= ISNULL((SELECT MAX(id_afiliado_del_socio) FROM afiliados_del_socio),0) +1---RECUPERA EL ULTIMO ID Y LO AGREGA UN NUMERO
				
					INSERT INTO afiliados_del_socio (id_afiliado_del_socio,		id_persona_socio,	id_persona_afiliado)	VALUES
													(@id_afiliados_del_socio,	@socio,			@id_persona);
				END;
				IF(@comprueba_socio=0)
				BEGIN
					ROLLBACK TRAN insterta_persona;
					SET @validacion=1;
					SET @retorno='El id del socio no es valido<br>'+CHAR(10);
					PRINT @retorno;
				END;
			END;

			IF(@validacion=0)
			BEGIN
				COMMIT TRAN insterta_persona --Guarda cambios en la transaccion
				SET @retorno =@@ERROR
				PRINT @retorno
			END;
	
		END TRY	--Finaliza la seccion de codigo que pueda generar errores
		BEGIN CATCH 

			SET @retorno =@@ERROR+ERROR_MESSAGE();
			PRINT @retorno
		
			ROLLBACK TRAN insterta_persona---deshace cambios

		END CATCH
		END--DEL IF
	RETURN --RETORNA EL VALOR DEL RESUALTADO EN LA VARIABLE DE SALIDA
END	--FInaliza SP





EXECUTE crea_usuario	@nombre			='Jose Maria', 
						@apellido		='Perez Garcia',
						@email			='m@Wgmdsssail.com',
						@contraseña		='xxx',
						@telefono		='79263012',
						@departamento	='Peten',
						@municipio		='San Benito',
						@referencia		='A la par del banrrural',
						@nit			='11222112111',
						@rol			=	2,
						@retorno		='',
						@socio			=2
select * from rol

select * from persona
select * from afiliados_del_socio

EXECUTE crea_usuario	@nombre			='Pedro Pancho', 
						@apellido		='Ariaza Lima',
						@email			='m@gmail.com',
						@contraseña		='xxx',
						@telefono		='79263012',
						@departamento	='Peten',
						@municipio		='San Benito',
						@referencia		='A la par del banrrural',
						@nit			='1111111',
						@rol			=	2,
						@msg			=''



						select * from persona
						select * from telefono	
						select * from telefono


CREATE OR ALTER PROCEDURE loguea_user 
	@email		VARCHAR(50),
	@pass		VARCHAR(25),
	@id_usr		INTEGER		 OUTPUT,
	@retorno	VARCHAR(100) OUTPUT,
	@nombre		VARCHAR(50)  OUTPUT,
	@rol		VARCHAR(50)  OUTPUT


AS
BEGIN
	SELECT	@id_usr	=	id_persona,
			@nombre	=	nombre,
			@rol	=	id_rol_fk
	FROM persona
						 WHERE email=@email AND 
						 contraseña=@pass

	--SET @retorno	=	@@ERROR;
	
	
	PRINT 'ID_USR: ';
	PRINT @id_usr;
	PRINT 'NOMBRE ';
	PRINT @nombre

	--PRINT 'Retrono';
	--PRINT @retorno;
	RETURN
END


EXECUTE loguea_user @email='jm@gmail.com',@pass='xxx', @id_usr=42,@retorno='', @nombre=''

insert into rol values( 'Administrador')


select * from rol

select MAX(id_rol) from rol



print @@identity

SELECT * FROM persona
SELECT * FROM afiliados_del_socio

DELETE FROM persona WHERE id_persona=3
DELETE FROM telefono	WHERE id_persona_fk=3

delete from persona
delete from direccion_entrega
delete from telefono
