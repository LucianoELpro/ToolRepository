

--IF --  EXISTS  - BREAK -- RETURNS


declare @idpaciente int
declare @idturno int

set @idpaciente =7

if @idpaciente = 7
	begin
			set @idturno  = 20
			select * from 'tabla' where @idpaciente = @idpaciente
				if exists(select * from 'tabla' where ='campo1'='dato')
					print'Existe'
					RETURNS--sale del scrip y no ejecutaba nada
					BREAK -- sale del bucle y ejecuta lo que sigue
	end
else		
	begin
		print 'No se cumplió la condición'
	end

--WHILE


declare @contador int = 0

while @contador  <=10
	begin
		print @contador
		set @contador = @contador+1
	end

-- CASE

select *,(case when 'campo1' ='dato1' then 'verde'
			   when 'campo1' ='dato2' then 'rojo'
			   when 'campo1' ='dato3' then 'azul'
			else 'gris' end) as 'namedelcampo'from 'tabla'


