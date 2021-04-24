-- CASOS DE PRUEBAS DE POSTGRESQL

--Caso 1

CALL "Subastas"."Insert_Admin"(
	'Admin2', 
	'Admin2pw'
)

-- Caso 3

CALL "Subastas"."Insert_Comprador"(
	1, 
	'sha@ic43.com', 
	'Selena Huerta Alcalá', 
	'pselen', 
	84396536, 
	41, 
	'pselenpw'
)

CALL "Subastas"."Insert_Comprador"(
	2, 
	'cbm@gustr.com', 
	'Cesario Briones Madrigal', 
	'cesar', 
	60676016, 
	41, 
	'cesarpw'
)

CALL "Subastas"."Insert_Comprador"(
	3, 
	'bmc@ic43.com', 
	'Basileo Mata Cardona', 
	'basil', 
	83273025, 
	41, 
	basilpw
)

CALL "Subastas"."Insert_Comprador"(
	4, 
	'jcr@ic43.com', 
	'Julia Carvajal Robles', 
	'julia', 
	87799157, 
	41, 
	'juliapw'
)

-- Caso 4

CALL "Subastas"."Insert_Admin"(
	'Admin3', 
	'Admin3pw'
)

CALL "Subastas"."Insert_Comprador"(
	5, 
	'ohr@gustr.com', 
	'Oscar Henríquez Robledo', 
	'oscar', 
	84934609, 
	41, 
	'oscarpw'
)

CALL "Subastas"."Insert_Comprador"(
	6, 
	'lts@gustr.com', 
	'Ligia Toledo Soto', 
	'ligia', 
	67228161, 
	41, 
	'ligiapw'
)

-- Caso 5

CALL Subastas.Insert_Subasta(
	'Guitarra Fender Squier Estándar.', 
	'', 
	120000, 
	2021-04-23 00:00:00, 
	2021-04-23 00:00:00, 
	3, 
	303
)

-- Caso 6

SELECT "Subastas".listado_por_cat_y_sub_cat(
	'Instrumentos y equipos musicales',
	'Guitarra'
)

CALL "Subastas"."Insert_Puja"(
	1, 
	125000, 
	'2021-04-23', 
	27, 
	2
)

-- Caso 7

SELECT "Subastas".listado_por_cat_y_sub_cat(
	'Instrumentos y equipos musicales',
	'Guitarra'
)

CALL "Subastas"."Insert_Puja"(
	2, 
	125001, 
	'2021-04-23', 
	27, 
	6
)

CALL "Subastas"."Insert_Puja"(
	3, 
	130000, 
	'2021-04-23', 
	27, 
	6
)

SELECT "Subastas".list_historial_pujas(27)

CALL Subastas.Insert_Subasta(
	'Jacket GAV MARES', 
	'', 
	167000, 
	2021-04-23 00:00:00, 
	2021-04-23 00:00:00, 
	6, 
	355
)

SELECT "Subastas".listado_por_cat_y_sub_cat(
	'Artículos deportivos',
	'Deportes acuáticos'
)

-- Caso 8

SELECT "Subastas".listado_por_cat_y_sub_cat(
	'Artículos deportivos',
	'Deportes acuáticos'
)

-- Caso 9

CALL Subastas.Insert_Subasta(
	'Jacket GAV MARES', 
	'', 
	125000, 
	2021-04-23 00:00:00, 
	2021-04-23 00:00:00, 
	6, 
	355
)

-- Caso 11

CALL "Subastas"."Update_Comprador"(...)
CALL "Subastas"."Update_Comprador"(...)

-- Caso 12

SELECT "Subastas".list_historial_subastas()
SELECT "Subastas".list_historial_pujas(27)

CALL "Subastas"."Insert_Puja"(
	4, 
	134000, 
	'2021-04-23', 
	27, 
	1
)

CALL "Subastas"."Insert_Puja"(
	5, 
	137000, 
	'2021-04-23', 
	27, 
	1
)

-- Caso 13
select * from "Subastas"."Puja"
SELECT "Subastas".list_historial_subastas(3)

SELECT "Subastas".list_historial_pujas(1)



