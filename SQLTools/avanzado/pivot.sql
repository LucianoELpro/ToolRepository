/*
select * from Sales.SalesOrderHeader --salesorderID, orderdate
select * from Sales.SalesOrderDetail --salesorderID, productID
select * from Production.Product --productID, productsubcategoryID
select * from Production.ProductSubcategory --productsubcategoryID, productcategoryID
select * from Production.ProductSubcategory --productcategoryID, name
*/

WITH VentasPorCategoria as
	(SELECT DISTINCT 
		DATEPART(YEAR,SOH.OrderDate)as anio,
		PC.[name] as categoria,
		P.ProductID
	FROM sales.SalesOrderHeader SOH
	inner join sales.SalesOrderDetail SOD on SOD.SalesOrderID = SOH.SalesOrderID
	inner join production.product P on P.ProductID = SOD.ProductID
	inner join production.productSubcategory PSC on PSC.ProductSubcategoryID = P.ProductSubcategoryID
	inner join production.ProductCategory PC on PC.ProductCategoryID = PSC.ProductCategoryID)
--APLICAMOS PIVOT AL RESULTADO GUARDADO EN ventasPorCategoria

SELECT * FROM VentasPorCategoria
PIVOT (count (productID) For anio IN ([2014],[2013],[2011])) as pivotTable
UNPIVOT (productID For anio IN ([2014],[2013],[2011])) as unpivotTable