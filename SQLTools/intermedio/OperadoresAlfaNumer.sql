-- los Operadores n�mericos los puedes conjugar con letras y n�meros


--Operador % te devuelve el sobrante que no se pudo dividir
declare @numero1 decimal (20,2)= 30
declare @numero2 decimal (20,2)= 20.5
declare @resultado decimal (20,2)

set @resultado = @numero1 % @numero2
print @resultado


declare @texto1 varchar (20)= 'Luis'
declare @texto2 varchar (20)= 'Lui5'

--Operador <> es diferente
if @texto1 <> @texto2
print 'No son iguales'