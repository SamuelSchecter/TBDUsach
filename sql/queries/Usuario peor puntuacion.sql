Select top 1
	u.NOMBRE, 
	p.CALIFICACION calificacion, 
	p.FECHA_CALIFICACION fecha_calificacion
from USUARIO u
join PUNTUACION_USUARIO p on u.ID = p.ID_USUARIO_CALIFICADO
order by p.CALIFICACION asc
