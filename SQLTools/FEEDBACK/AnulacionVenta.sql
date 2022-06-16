ALTER proc [dbo].[ingreso_anular]
@idingreso int
as
update ingreso set estado='Anulado'
where idingreso=@idingreso;
update articulo 
set stock=stock-d.cantidad
from articulo a
inner join
(select idarticulo,cantidad from detalle_ingreso where idingreso=@idingreso) as d
on a.idarticulo=d.idarticulo;


select * from ingreso
select * from articulo
select * from detalle_ingreso