ALTER trigger [dbo].[Ingreso_ActualizarStock]
On [dbo].[detalle_ingreso]
for insert
as
update a set a.stock=a.stock+d.cantidad
from articulo as a inner join inserted as d on d.idarticulo=a.idarticulo



ALTER trigger [dbo].[VentaAnulada_ActualizarStock]
	   on [dbo].[detalle_venta]
	   for Update
	   as
	   Update a set a.stock=a.stock+d.cantidad
	   from articulo as a inner join
	   DELETED as d on d.idarticulo=a.idarticulo


ALTER TRIGGER [dbo].[Venta_ActualizarStock]
   ON [dbo].[detalle_venta]
   FOR INSERT
   AS
   UPDATE a SET a.stock=a.stock-d.cantidad
   FROM articulo AS a INNER JOIN
   INSERTED AS d ON d.idarticulo=a.idarticulo