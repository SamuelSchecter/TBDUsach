1-Listar publicaciones vigentes de mes de enero.

Select [dbo].[Publicacion].fecha_creacion from [dbo].[Publicacion].[estado]
where [dbo].[publicacion].id_publicacion=[dbo].[estado].id_estado and [dbo].[estado].nombre=1 and CAST([dbo].[estado].fecha_creacion as VARCHAR) like 'Ene%2020%'

2-Eliminar publicaciones del año 2018.

delete [dbo].[Producto] from [dbo].[Publicacion] where [dbo].[Publicacion].id_publicacion=[dbo].[Producto].id_publicacion and CAST ([dbo].[Producto].nombre as varchar) like '%2018'

3-Listar todos las publicaciones del mes de Junio.

Select [dbo].[Publicacion].fecha_creacion from [dbo].[Publicacion].[estado]
where [dbo].[publicacion].id_publicacion=[dbo].[estado].id_estado and [dbo].[estado].nombre=0, [dbo].[estado].nombre=1 and CAST([dbo].[estado].fecha_creacion as VARCHAR) like 'Jun%2020%'

4-Consultar los pagos realizados por cada publicación

Select [dbo].[compra].costo as Pagos, [dbo].[usuario].nombre
from [dbo].[usuario], [dbo].[compra]
where [dbo].[usuario].id_usuario=[dbo].[compra].id_compra AND [dbo].[usuario].id_usuario=2 
UNION
Select [dbo].[producto].precio as Pagos, [dbo].[usuario].nombre
from [dbo].[usuario], [dbo].[producto]
where [dbo].[usuario].id_usuario=[dbo].[producto].id_producto AND [dbo].[usuario].id_usuario=2 

5-Informe de Ingresos mensuales

Select SUM([dbo].[compra].costo) as ingresos, [dbo].[detalle_compra].fecha_compra from [dbo].[compra],[dbo].[detalle compra]
where [dbo].[compra].id_compra=[dbo].[detalle_compra].id_detalle_compra and [dbo].[compra].id_estado=1
group by [dbo].[detalle_compra].fecha_compra

6-Actualizar el costo de una publicacion

update [dbo].[compra]
set [dbo].[compra].costo = 1
where [dbo].[cuota].id_cuota