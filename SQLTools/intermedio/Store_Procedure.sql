

--SUBCONSULTA CON STORE PROCEDURE

create proc SpEjemplo
@edad int,
@nombre varchar(20)
as
begin
select *,'campos'(select 'campo1' from 'tabla2' where tbl1.idEdad= tbl2.idEdad) from 'tabla1' where nombre = @nombre and edad = @edad

end

--BUSCAR
create procedure Sp_articule_search  
@search varchar(200)  
as  
begin  
select a.id_articule as ID, a.id_category,a.artCodigo as Codigo,a.artName as Nombre,a.artPrice as Precio,  
a.artStock as Stock,a.artDescrip as Descripcion,a.artimage as Imagen,a.artStatus as Estado  
From tbl_articule a inner join tbl_category c on a.id_category = c.id_category  
where a.artName like '%'+ltrim(rtrim(@search))+ '%'  or a.artDescrip like '%' +ltrim(rtrim(@search))+ '%'  
order by a.artName  asc  
end  

--BUSQUEDA AVANZADA

create procedure Sp_sale_searchArticle  
@search varchar(200)  
as  
begin  
select a.id_articule as ID, a.id_category,a.artCodigo as Codigo,a.artName as Nombre,a.artPrice as Precio,  
a.artStock as Stock,a.artDescrip as Descripcion,a.artimage as Imagen,a.artStatus as Estado  
From tbl_articule a inner join tbl_category c on a.id_category = c.id_category  
where (a.artName like '%'+@search+ '%'  or a.artDescrip like '%' +@search+ '%') and a.artStock>0  
order by a.artName  asc  
end  

--INSERT INSERTAR DOBLE TABLLA

create procedure Sp_sale_insert  
@id_company int,  
@id_user int,   
@salDoctype varchar(200),  
@salDocserial varchar(200),  
@salNumber varchar(200),  
@saltaxe decimal(11,2),  
@salTotal decimal(11,2),  
@salDetail type_detail_purchase readonly  
as  
begin  
insert into tbl_sale (id_company,id_user,salDoctype,salDocserial,salNumber,salDate,saltaxe,salTotal,salStatus) values  
(@id_company,@id_user,@salDoctype,@salDocserial,@salNumber,getdate(),@saltaxe,@salTotal,'Aceptado')  
  
insert into tbl_saleDetail (id_sale,id_articule,sdlAmoung,sdlprice,sdlOff)  
select @@IDENTITY,a.id_articule,a.sdlamount,a.sdlprice,a.sdlOff from @salDetail a  
end  


--UPDATE ELIMINAR LOGICO

CREATE procedure [dbo].[Sp_purchase_canceled]  
@id_purchase int  
as  
begin  
update tbl_purchase set purStatus = 'Anulado'  
where id_purchase=@id_purchase  
update tbl_articule set artStock=a.artStock - b.pdlAmoung  
from tbl_articule a inner join (select id_articule, pdlAmoung from tbl_purchaseDetail where id_purchase=@id_purchase)  
as b on a.id_articule = b.id_articule  
end


--VALIDAR

create procedure Sp_Company_Exist  
@name varchar(200),  
@exist bit output  
as  
begin  
if exists (select comName from tbl_company where comName=ltrim(rtrim(@name)))  
 begin  
 set @exist = 1  
 end  
else  
 begin  
 set @exist = 0  
 end  
end  

--CREATE TABLE

CREATE TYPE [dbo].[type_detail_purchase] AS TABLE(
	[id_articule] [int] NULL,
	[artcode] [varchar](200) NULL,
	[artName] [varchar](200) NULL,
	[artStock] [int] NULL,
	[sdlamount] [int] NULL,
	[sdlprice] [decimal](11, 2) NULL,
	[sdlOff] [decimal](11, 2) NULL,
	[sdltotal] [decimal](11, 2) NULL
)
GO