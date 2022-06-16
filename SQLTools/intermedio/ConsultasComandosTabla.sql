


********INDICE********

1. dbcc checkident()
2. distinct
3. group by
4. TOP
5. asc/desc
6. min/max
7. sum/avg/count
8. having count
9. in/like/not in/not like /between
10. inner join
11. Union all


-- reinicia la n�meraci�n del campo identity
dbcc checkident('tabla',reseed,0) -- EL TRUNCATE ELIMINA Y REINICIA CAMPO IDENTITY

--***SELECT--WHERE -- AND -- OR--TOP --ORDER BY -- (DISTINCT AND GRUOP BY)
-- MIN  MAX SUM IN LIKE NOT BETWEEN

--definici�n: trae los datos no repetidos seg�n el filtro where
select DISTINCT * from 'tabla' WHERE 'campo1'='datos' and 'campo2'='datos'

--definici�n: trae todos los datos no repetidos o agrupados siempre se escribe el mismo campo
select 'CAMPO1' * from 'TABLA' GROUP BY 'CAMPO1'
--definici�n: trae solo los 2 primeros datos seg�n filtro where y ordenado por
select TOP 2 * from 'tabla' WHERE 'campo1'='datos' and 'campo2'='dato'ORDER BY 'campo3'  asc/desc

select min('campo1') from 'tabla'
--definici�n trae el dato m�ximo de una tabla agrupados
select 'campo2'max('campo1') from 'tabla' group by 'campo2'
--definici�n: trae la suma del campo referenciado y agrupado o comprimido
select sum('campo1'),'campo2'from 'tabla' group by 'campo2'

--definici�n : trae el promedio con  AVG del campo referenciado
select AVG('campo1') from 'tabla'
--definici�n: cuenta todos los registro o seg�n el filtro where
select COUNT ('campo1')from 'tabla' where 'campo2'='datos'
--definici�n: el filtro having count cuenta los registro repetidos seg�n el filtro y los muestra
--todos deben estar en el mismo campo si campo1 tiene 3 registro se trae ese dato que cumpla con 3
--seg�n filtro having count
select 'campo1' from 'tabla' group by 'campo1'  having count('campo1')=><'datos'
--definici�n: trae datos que est�n en el filtro where IN (coincidencias n�mericas o texto) 
select * from 'tabla' where 'campo1'= in('datos',1,2,3,'datos')
--definici�n: trae todos los datos que contengan el filtro like, es util para textos o store procedure
select *  from 'tabla' where 'campo1' NOT like '%'+'datos'+'%'
--definici�n: USANDO EL OPERADOR NOT EN IN Y LIKE
select * from 'tabla' where 'campo1'= NOT in('datos',1,2,3,'datos')
--trae datos entre criterios
select * from 'tabla' where 'campo1' between 'dato de campo1' and 'dato del campo1'

--RESTRINCIONES CON AND() OR
--ESTE ES LA MANERA PERFECTA DE CONCIONAR UN BUSQUEDA CON PARENTESIS Y OPERADORES AND Y OR DONDE PRIORIZAMOS
--EL CAMPO 1 COMO SI O SI DEBE CUMPLIRSE
SELECT *  from 'Tabla' where 'campo1' = 'dato1' and ('campo2'='dato2' or 'campo3'='dato3', 'campo4'='dato4')










--***DELETE --WHERE -- AND
delete from 'tabla'  WHERE 'campo1'='datos' and 'campo2'='datos'

--***UPDATE --WHERE -- AND
update 'tabla' set 'campo1'='datos' --WHERE 'campo1'='datos' and 'campo2'='datos'

--**INSERT
insert into 'tabla' ('campo1','campo2')values('datos','datos')

------------------------------------------------------------------------------
SELECT * FROM tbl_history inner join tbl_concept on id = id

Select *  from tbl_turn
union all
select * from tbl_turn

