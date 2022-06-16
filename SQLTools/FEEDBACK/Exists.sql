-- view table
select *  from usuario
--create procedure 
alter procedure SpUsuarioExist
@valor varchar(max),
@output bit output
as
begin
if exists (select nombre from usuario where nombre =ltrim(rtrim(@valor)))
	 begin
	 set @output=1
	 end
else
	 begin
	 set @output=0
	 end
end

--make comprobation
declare @rpta bit
exec SpUsuarioExist 'Luis Perez',@rpta output
print @rpta