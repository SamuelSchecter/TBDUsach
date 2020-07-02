Select 
	u.NOMBRE, 
	p.CALIFICACION calificacion, 
	p.FECHA_CALIFICACION fecha_calificacion,
	prod.NOMBRE producto
from USUARIO u
join PUNTUACION_USUARIO p on u.ID = p.ID_USUARIO_CALIFICADO
join PUBLICACION pu on u.ID = pu.ID_USUARIO
join PRODUCTO prod on pu.ID = prod.ID_PUBLICACION
where u.ESTADO_ACTIVACION = 1