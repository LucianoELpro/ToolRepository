--Sentencias 

----------------------------------------------
***INDICE****
1.Sp_help
2.Sp_helptext
3.LEN()
4.LEFT()
5.RIGHT()
6.REPLACE()
7.REPLICATE()
8.LTRIM()
9.RTRIM()
10.CONCAT()
11. getdate()
12. getutcdate()
13. dateadd()  year//mm/yy/dd , day,min,hour,second,etc
14. datediff()
15.  datepart()
16.  Isdate()
17.  convert()
18. cast()




-----------------------------------------------
-- LEFT RIGHT, reciben 2 parametros EL PRIMERO ES LA VARIABLE Y EL SEGUNDO EL NÚMERO
-- DE CARACTER A EXTRAER

LEFT(@VARIABLE,5)

--LEN -- RECIBE 1 PARAMETRO Y DEVUELVE EL NÚMERO DE CARACTERES

LEFT(@VARIABLE,LEN(@VARIABLE)-4)

REPLACE

LEN
LEFT
RIGTH
------------------------------------
DECLARE @VAR1 VARCHAR (20)
DECLARE @VAR2 VARCHAR (20)
SET @VAR1 = 'Ramir"o'
SET @VAR2 = 'Gonz@alez'

select REPLACE (@var2,'@','')
print @var1
 --------------------------------

 PRINT REPLICATE('0',5)

 ------------------------------

DECLARE @VAR1 VARCHAR (20)
DECLARE @VAR2 VARCHAR (20)
SET @VAR1 = '		Ramiro'
SET @VAR2 = 'Gonzalez			'

SELECT LTRIM(RTRIM(@VAR1))+''+LTRIM(RTRIM(@VAR2))+'*'

-----------------------------------------

DECLARE @VAR1 VARCHAR (20)
DECLARE @VAR2 VARCHAR (20)
SET @VAR1 = '		Ramiro'
SET @VAR2 = 'Gonzalez    '

SELECT CONCAT(LTRIM(RTRIM(@VAR1)),' ',LTRIM(RTRIM(@VAR2)),'A','B','C')

-------------------------------------------------
select getdate()
select getutcdate()

select dateadd(day,2,getdate()) --Agrega fechas según los parametros que les indiques 

select datediff(year,getdate(),'20170120') -- resta´días, meses, años etc el parametro del medio resta al del izquierdo
select datepart(dw,getdate()) -- te devuelve el número de años, meses,días etc de una fecha selecionada dw,dd,yy,hh

if Isdate('20211022') =1   -- valida si es fecha
print 'es una fecha'
else
print 'no es una fecha'

----------------------------------------------------------------------------------------
CONVERT AND CAST

declare @numero money
set @numero = 500.40
print @numero
--select cast(@numero as int) as numero

print convert(int,@numero)

--PARA TRABAJAR CON FECHAS
print convert (char(20),@fecha1,112) > print convert (char(20),@fecha2,112) -- tiene 3 parametros
