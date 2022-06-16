

select dbo.concatenar('Lopez','Roberto') -- consulta de una función o metodo con parametros
select dbo.obtenerPais(4) -- consulta de una función o metodo con parametros
select * from dbo.listaPaises() -- La consulta es diferente ya que es como una tabla


create function obtenerPais(@idpaciente paciente)
returns varchar (50)
as
begin
	declare @pais varchar (50)
	set @pais =(select PA.pais from tbl_patient p inner join tbl_country PA on PA.idPais =P.idPais 
				where idpaciente =@idpaciente)

	return @pais
end



create function concatenar (@apellido varchar(50),@nombre varchar(50))

returns varchar (100)

as
begin
		declare @resultado (100)
		set @resultado = @apellid+', '+@nombre
	return @resultado
end



-- FUNCIONES DE TIPO TABLA  QUE DEVUELVAN UNA TABLA


CREATE FUNCTION listaPaises()
returns @paises table(idpais char(3),pais varchar(50))
as
begin

		insert into @paises values('ESP','España')
		insert into @paises values('MEX','Mexico')
		insert into @paises values('CHI','Chile')
		
	return -- en esta parte no se pone el nombre de la variable sino solo "return"

end