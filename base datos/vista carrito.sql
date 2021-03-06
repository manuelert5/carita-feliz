CREATE OR ALTER FUNCTION retorna_carrito 
(
@id_per_carrito INTEGER
)
RETURNS TABLE
RETURN
(
	
	SELECT carrito.id_carrito, pro.id_producto, pro.nombre, pro.marca, carrito.cantidad, pro.url_imagen,
				CASE
					WHEN pro.existencia=0											THEN 'Sin existencia'--cuando no hay productos
					WHEN pro.existencia>=20 AND pro.existencia>=carrito.cantidad	THEN 'Mas de 20'--y los productos en carrito son menos de los que hay en bodega
					WHEN pro.existencia<20	AND pro.existencia>=10	
											AND pro.existencia>=carrito.cantidad 	THEN 'Menos de 20'--y los productos en carrito son menos de los que hay en bodega
					WHEN pro.existencia<10	AND pro.existencia>=carrito.cantidad 	THEN 'Solo quedan '+CONVERT(VARCHAR(4),(pro.existencia))--cuando hay menos de 10 y los productos en carrito son menos de los que hay en bodega
					WHEN pro.existencia<carrito.cantidad 							THEN 'Solo puede agregar '+CONVERT(VARCHAR(4),(pro.existencia))

				END AS estado,
				
				CASE 
					WHEN (SELECT persona.id_rol_fk FROM persona WHERE id_persona=@id_per_carrito)=1	THEN pro.precio_socio--precio cuando es un afiliado
					WHEN (SELECT persona.id_rol_fk FROM persona WHERE id_persona=@id_per_carrito)=2	THEN pro.precio_afiliado--precio cuando es un afiliado
				
				END AS precio
				
		FROM carrito_productos AS carrito  LEFT JOIN 
			 producto AS pro ON carrito.id_producto_fk=pro.id_producto  WHERE carrito.id_persona_fk=@id_per_carrito--AND per.id_rol_fk=@rol
)

------------------------


select * from carrito_productos 

select * from retorna_carrito(2)

SELECT * FROM PERSONA




