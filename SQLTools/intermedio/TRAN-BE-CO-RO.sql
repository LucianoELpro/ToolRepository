

--  esta combinación de sentencias verifican que si es que se ha afectado solo 1 linea por la cual se confirma
-- la transaccion con "commit tran" si es afectado por más filas se cancela con "rollback tran"  NO OLVIDAR
-- AL CONDICIONAL IF CON "@@ROWCOUNT"

BEGIN TRAN
	UPDATE tbl_patient set phone = 444  where surname = 'perez'
	if @@ROWCOUNT = 1
		commit tran
	else
		rollback tran


