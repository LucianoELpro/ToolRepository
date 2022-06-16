--SELECT * FROM HumanResources.Employee
--SELECT * FROM HumanResources.employeeList
--CREATE TABLE HumanResources.employeeList(NationalIDNumber varchar(10),JobTitle varchar(100))

-- USAR LA BD QUE CORRESPONDA
use AdventureWorks2017
--DECLARO LAS VARIABLES DONDE ALMACENARÁ CADA ITERACION
DECLARE @NationalIDNumber varchar(10),@JobTitle varchar(100)
--FAST_FORWARD TIENE LA PROPIEDAD DE SOLO LECTURA
DECLARE micursor CURSOR FOR
SELECT NationalIDNumber, JobTitle from HumanResources.Employee
Where Gender = 'M'
--LEO EL PRIMER REGISTRO Y ALMACENO LOS CAMPOS EN LAS VARIABLES

OPEN micursor
	FETCH NEXT FROM micursor
	INTO @NationalIDNumber,@JobTitle
   -- MIENTRAS FETCH_STATUS=0 QUIERE DECIR QUE NO HA LLEGADO AL FINAL DE LA TABLA
	WHILE @@FETCH_STATUS = 0
		BEGIN
		   -- INSERTO EN LA TABLA EMPLOYEELIST
		   INSERT INTO  HumanResources.employeeList VALUES(@NationalIDNumber,@JobTitle)
		   -- ACTUALIZO EL REGISTRO DE LA TABLA EMPLOYEE QUE COINCIDE
		   --CON EL ACTUAL DEL CURSOR (OPTIONAL)
		   UPDATE HumanResources.Employee SET CurrentFlag = 0
		   WHERE CURRENT OF micursor

		   --PASAMOS AL SIGUIENTE REGISTRO
		   FETCH NEXT FROM micursor
		   INTO @NationalIDNumber,@JobTitle
		END
CLOSE micursor
DEALLOCATE micursor --LIBERO LA MEMORIA