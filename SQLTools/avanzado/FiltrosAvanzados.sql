-- FILTROS

	SELECT
			*
	 FROM
			Person.Person P
			left JOIN Person.EmailAddress E
			on E.BusinessEntityID = P.BusinessEntityID
	WHERE 
			Isnull(E.BusinessEntityId,'') =''
			and Isnull(p.Title,'')=''


--  WHERE CASE ES OTRA MANERA DE HACER UN 'LISTARALL'
ALTER procedure [dbo].[uspFiltrarMarca]
@nombre varchar(100) = null
as 
begin
	
	select IIDMARCA,NOMBREMARCA,DESCRIPCION
	from marca
	where BHABILITADO=1 and NOMBREMARCA like 
	case When
	(isnull(@nombre,''))<>'' then  '%'+@nombre+'%'
	else
	NOMBREMARCA
	end
end

--FILTRO EN OTRA BASE DE DATOS + RECUPERAR DATOS DE BD COPIA A TBL ORIGINAL
Insert into Northwind.dbo.tblEnOtraDb -- TABLA A LA QUE LE INSERTAMOS LOS DATOS PERDIDOS
select A.* FROM Person.Address A
left join Northwind.dbo.tblEnOtraDb B
on B.AddressID = A.AddressID
Where ISNULL(B.AddressId,0)=0






