--SP DINAMICO CON UN PARAMETRO
--exec Sel_Products 'P'


alter procedure Sel_Products
@order char(1)

as
begin

declare @script nvarchar(1000)
declare @orderby nvarchar(1000)

set @script ='select 
		   ProductID, 
		   [name],
		   ReorderPoint 
	from  
		   [Production].[Product]'
set @orderby = (case   
		 when  @order ='N' then ' Order by [name]'
		 when  @order ='I' then ' Order by ProductID'
		 when  @order ='P' then ' Order by ReorderPoint'
    end)
set @script = @script + @orderby

exec Sp_ExecuteSql @script
end

--SP DINAMICO CON UN PARAMETRO CON OUTPUT

declare @out nvarchar(max)
exec SetDinamicQueryProduct 'P',@out output
exec Sp_ExecuteSql @out


alter procedure SetDinamicQueryProduct
@order char(1),
@out varchar(max) output
as
begin

declare @script nvarchar(1000)
declare @orderby nvarchar(1000)

set @script ='select 
		   ProductID, 
		   [name],
		   ReorderPoint 
	from  
		   [Production].[Product]'
set @orderby = (case   
		 when  @order ='N' then ' Order by [name]'
		 when  @order ='I' then ' Order by ProductID'
		 when  @order ='P' then ' Order by ReorderPoint'
    end)
set @out = @script + @orderby
end