
/*
SELECT * FROM sales.salesperson
SELECT * FROM sales.salesTerritory
*/

BEGIN TRY

INSERT INTO sales.SalesPerson
VALUES (270,20,100,200,0,25000,200000, newid(), getdate())
END try

BEGIN CATCH
	IF @@ERROR = 547
	 RAISERROR (50001,-1,4, 'sales.salesperson')
	 ELSE
	RAISERROR ('Error al insertar una venta',16,1)
END CATCH

--ERRORES PERSONALIZADOS
--ID ERROR > 50000
--SEVERITY 1 A 25

--sp_addmessage 50001,16,'Ocurrió un error de foreign key en la tabla sales.salesperson, por favor revisar'
--sp_dropmessage 50001
--sp_addmessage 50001,16,'Ocurrió un error de foreign key en la tabla %s, por favor revisar'

