
--CREATE

*****CREATE TABLE -- CREA UNA TABLA 

*****CREATE TYPE VARIABLE FROM DECIMAL(10,2)-- PARA UN TIPO DE,  TIPO DATO*/

create/alter FUNCTION nombre (@variable varchar(200))
returns varchar (200)
as
	begin
	set @variable = @variable + ' Soy Luis'
	return @variable
	end

Select dbo.nombre ('Hola')


*****CREATE TYPE TABLE  -- PARA CREAR UN TIPO, TIPO TABLA


--ALTER

*****ALTER TABLE 'TABLA' ALTER COLUMN/ROW 'COLUMN/ROW' INT(--TIPO DE DATO) ALTERA UNA TABLE
--DENTRO SUS COLUMNAS FILAS Y SUS TIPOS DE DATOS O EL SCRIP DE UN STORE PROCEDURE
*****ALTER TABLE 'TABLA' DROP CALUMN/ROW 'NAMECOLUMN'--ELIMINA LA COLUMNA CREADA


--DROP

-->>DROP ELIMINA OBJETOS DE NIVEL COMO TABLAS  COLUMNAS O BASE DE DATOS<<<
DROP TABLE
DROP 'DATABASE'

--TRUNCATE 

-- ELIMINA LOS REGISTRO DE UNA TABLA AS� COMO QUE REINICIA LOS CAMPOS IDENTITY
TRUNCATE TABLE 'TABLA'
DBCC CHECKIDENT ('TABLA',reseed,0) -- POSICIONA EL CAMPO IDENTITY CON ESTA SENTENCIA
