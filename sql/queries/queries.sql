/*==============================================================*/
/* Todos los usuarios con todos los productos que venden.       */
/*==============================================================*/
SELECT u.NOMBRE, a.NOMBRE
FROM USUARIO u 
INNER JOIN PUBLICACION p
ON p.ID_USUARIO=u.ID
INNER JOIN PRODUCTO a
ON a.ID_PUBLICACION = p.ID
ORDER BY u.NOMBRE ASC

/*==============================================================*/
/* Usuarios con todos los productos que vende.                  */
/*==============================================================*/
SELECT u.NOMBRE, a.NOMBRE
FROM USUARIO u 
INNER JOIN PUBLICACION p
ON p.ID_USUARIO=u.ID
INNER JOIN PRODUCTO a
ON a.ID_PUBLICACION = p.ID WHERE u.NOMBRE='NOMBRE USUARIO'
ORDER BY u.NOMBRE ASC

/*==============================================================*/
/* Usuarios con los productos que ha vendido.                  */
/*==============================================================*/
SELECT u.NOMBRE, a.NOMBRE
FROM USUARIO u 
INNER JOIN PUBLICACION p
ON u.ID=p.ID_USUARIO
INNER JOIN PRODUCTO a 
ON p.ID=a.ID_PUBLICACION
INNER JOIN DETALLE_COMPRA dc
ON p.ID=dc.ID_PRODUCTO WHERE u.NOMBRE='julio'
GROUP BY u.NOMBRE, a.NOMBRE

/*==============================================================*/
/* Usuarios que más productos han vendido.                      */
/*==============================================================*/
SELECT u.NOMBRE, SUM(dc.CANTIDAD)
FROM USUARIO u 
INNER JOIN PUBLICACION p
ON u.ID=p.ID_USUARIO
INNER JOIN PRODUCTO a 
ON p.ID=a.ID_PUBLICACION
INNER JOIN DETALLE_COMPRA dc
ON p.ID=dc.ID_PRODUCTO 
GROUP BY u.NOMBRE
HAVING SUM(dc.CANTIDAD)=
(SELECT MAX(mas) FROM (SELECT u.NOMBRE, SUM(CANTIDAD) mas
FROM USUARIO u 
INNER JOIN PUBLICACION p
ON u.ID=p.ID_USUARIO
INNER JOIN PRODUCTO a 
ON p.ID=a.ID_PUBLICACION
INNER JOIN DETALLE_COMPRA dc
ON p.ID=dc.ID_PRODUCTO 
GROUP BY u.NOMBRE)
GO
)

/*==============================================================*/
/* Usuarios que menos productos han vendido.                    */
/*==============================================================*/
SELECT u.NOMBRE, SUM(dc.CANTIDAD)
FROM USUARIO u 
INNER JOIN PUBLICACION p
ON u.ID=p.ID_USUARIO
INNER JOIN PRODUCTO a 
ON p.ID=a.ID_PUBLICACION
INNER JOIN DETALLE_COMPRA dc
ON p.ID=dc.ID_PRODUCTO 
GROUP BY u.NOMBRE
HAVING SUM(dc.CANTIDAD)=
(SELECT MIN(mas) FROM (SELECT u.NOMBRE, SUM(CANTIDAD) mas
FROM USUARIO u 
INNER JOIN PUBLICACION p
ON u.ID=p.ID_USUARIO
INNER JOIN PRODUCTO a 
ON p.ID=a.ID_PUBLICACION
INNER JOIN DETALLE_COMPRA dc
ON p.ID=dc.ID_PRODUCTO 
GROUP BY u.NOMBRE)
GO
)

/*==============================================================*/
/* Usuarios que no han vendido productos.                       */
/*==============================================================*/
SELECT u.NOMBRE, SUM(dc.CANTIDAD)
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN PUBLICACION p
ON u.ID=p.ID_USUARIO
LEFT JOIN PRODUCTO a 
ON p.ID=a.ID_PUBLICACION
LEFT JOIN DETALLE_COMPRA dc
ON p.ID=dc.ID_PRODUCTO 
WHERE r.NOMBRE='proveedor'
GROUP BY u.NOMBRE
HAVING SUM(dc.CANTIDAD ) IS NULL

/*==============================================================*/
/* Todos los usuarios con todos los productos que compraron.    */
/*==============================================================*/
SELECT u.NOMBRE, a.NOMBRE
FROM USUARIO u 
INNER JOIN COMPRA c
ON c.ID_USUARIO=u.ID
INNER JOIN DETALLE_COMPRA d
ON d.ID_COMPRA = c.ID
INNER JOIN PRODUCTO a
ON d.ID_PRODUCTO=a.ID 
ORDER BY u.NOMBRE ASC

/*==============================================================*/
/* Usuarios con todos los productos que compró.                 */
/*==============================================================*/
SELECT u.NOMBRE, a.NOMBRE
FROM USUARIO u 
INNER JOIN COMPRA c
ON c.ID_USUARIO=u.ID
INNER JOIN DETALLE_COMPRA d
ON d.ID_COMPRA = c.ID
INNER JOIN PRODUCTO a
ON d.ID_PRODUCTO=a.ID WHERE u.NOMBRE='NOMBRE USUARIO'
ORDER BY u.NOMBRE ASC

/*==============================================================*/
/* Usuarios que menos productos han comprado.                   */
/*==============================================================*/
SELECT u.NOMBRE, COUNT(u.NOMBRE) CANTIDAD_PRODUCTOS
FROM USUARIO u 
INNER JOIN COMPRA c
ON c.ID_USUARIO=u.ID
INNER JOIN DETALLE_COMPRA d
ON d.ID_COMPRA = c.ID
INNER JOIN PRODUCTO a
ON d.ID_PRODUCTO=a.ID
GROUP BY u.NOMBRE
HAVING COUNT(u.NOMBRE)=
(SELECT MIN(mas) FROM (SELECT u.NOMBRE, COUNT(u.NOMBRE) mas
FROM USUARIO u 
INNER JOIN COMPRA c
ON c.ID_USUARIO=u.ID
INNER JOIN DETALLE_COMPRA d
ON d.ID_COMPRA = c.ID
INNER JOIN PRODUCTO a
ON d.ID_PRODUCTO=a.ID
GROUP BY u.NOMBRE)
GO
)

/*==============================================================*/
/* Usuarios que más productos han comprado.                     */
/*==============================================================*/
SELECT u.NOMBRE, COUNT(u.NOMBRE) CANTIDAD_PRODUCTOS
FROM USUARIO u 
INNER JOIN COMPRA c
ON c.ID_USUARIO=u.ID
INNER JOIN DETALLE_COMPRA d
ON d.ID_COMPRA = c.ID
INNER JOIN PRODUCTO a
ON d.ID_PRODUCTO=a.ID
GROUP BY u.NOMBRE
HAVING COUNT(u.NOMBRE)=
(SELECT MAX(mas) FROM (SELECT u.NOMBRE, COUNT(u.NOMBRE) mas
FROM USUARIO u 
INNER JOIN COMPRA c
ON c.ID_USUARIO=u.ID
INNER JOIN DETALLE_COMPRA d
ON d.ID_COMPRA = c.ID
INNER JOIN PRODUCTO a
ON d.ID_PRODUCTO=a.ID
GROUP BY u.NOMBRE)
GO
)

/*==============================================================*/
/* Usuarios que no han comprado.                                */
/*==============================================================*/
SELECT u.NOMBRE
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN COMPRA c
ON c.ID_USUARIO=u.ID
WHERE r.NOMBRE='cosumidor' and c.ID_USUARIO IS NULL

/*==============================================================*/
/* Detalle de alguna compra.                                    */
/*==============================================================*/
SELECT c.ID, p.NOMBRE, p.PRECIO, dc.CANTIDAD, c.COSTO, dc.FECHA_COMPRA, u.NOMBRE
FROM DETALLE_COMPRA dc
INNER JOIN PRODUCTO p
ON dc.ID_PRODUCTO=p.ID
INNER JOIN COMPRA c
ON c.ID=dc.ID_COMPRA
INNER JOIN USUARIO u
ON u.ID=c.ID_USUARIO
WHERE c.ID = 3

/*==============================================================*/
/* Detalle de todas las compras.                                */
/*==============================================================*/
SELECT c.ID, p.NOMBRE, p.PRECIO, dc.CANTIDAD, c.COSTO, dc.FECHA_COMPRA, u.NOMBRE
FROM DETALLE_COMPRA dc
INNER JOIN PRODUCTO p
ON dc.ID_PRODUCTO=p.ID
INNER JOIN COMPRA c
ON c.ID=dc.ID_COMPRA
INNER JOIN USUARIO u
ON u.ID=c.ID_USUARIO

/*==============================================================*/
/* Todos los usuarios y sus puntuaciones.                       */
/*==============================================================*/
SELECT u.NOMBRE, p.CALIFICACION
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN PUNTUACION_USUARIO p
ON u.ID=p.ID_USUARIO_CALIFICADO
WHERE r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor'
ORDER BY u.NOMBRE ASC

/*==============================================================*/
/* Usuario y sus puntuaciones.                                  */
/*==============================================================*/
SELECT u.NOMBRE, p.CALIFICACION
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN PUNTUACION_USUARIO p
ON u.ID=p.ID_USUARIO_CALIFICADO
WHERE (r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor') AND u.NOMBRE='NOMBRE USUARIO'
ORDER BY u.NOMBRE ASC

/*==============================================================*/
/* Usuarios con mejor promedio de puntuación.              */
/*==============================================================*/
SELECT u.NOMBRE, AVG(p.CALIFICACION) PROMEDIO
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN PUNTUACION_USUARIO p
ON u.ID=p.ID_USUARIO_CALIFICADO
WHERE r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor'
GROUP BY u.NOMBRE
HAVING AVG(p.CALIFICACION )=
(SELECT MAX(PROM) FROM (SELECT u.NOMBRE, AVG(p.CALIFICACION) prom
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN PUNTUACION_USUARIO p
ON u.ID=p.ID_USUARIO_CALIFICADO
WHERE r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor'
GROUP BY u.NOMBRE)
GO
)

/*==============================================================*/
/* Usuarios con peor promedio de puntuación.                    */
/*==============================================================*/
SELECT u.NOMBRE, AVG(p.CALIFICACION) PROMEDIO
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN PUNTUACION_USUARIO p
ON u.ID=p.ID_USUARIO_CALIFICADO
WHERE r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor'
GROUP BY u.NOMBRE
HAVING AVG(p.CALIFICACION )=
(SELECT MIN(PROM) FROM (SELECT u.NOMBRE, AVG(p.CALIFICACION) prom
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN PUNTUACION_USUARIO p
ON u.ID=p.ID_USUARIO_CALIFICADO
WHERE r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor'
GROUP BY u.NOMBRE)
GO
)

/*==============================================================*/
/* Usuarios sin puntuaciones.                                   */
/*==============================================================*/
SELECT u.NOMBRE, p.CALIFICACION
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN PUNTUACION_USUARIO p
ON u.ID=p.ID_USUARIO_CALIFICADO
WHERE (r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor') AND p.CALIFICACION IS NULL
ORDER BY u.NOMBRE ASC

/*==============================================================*/
/* Todos los productos con todas sus puntuaciones.              */
/*==============================================================*/
SELECT p.NOMBRE, pp.CALIFICACION, u.NOMBRE
FROM PRODUCTO p
LEFT JOIN PUNTUACION_PRODUCTO pp
ON p.ID=pp.ID_PRODUCTO
INNER JOIN PUBLICACION p2
ON p.ID_PUBLICACION=p2.ID
INNER JOIN USUARIO u
ON u.ID=p2.ID_USUARIO
ORDER BY p.NOMBRE ASC

/*==============================================================*/
/* Producto con todas sus puntuaciones.                         */
/*==============================================================*/
SELECT p.NOMBRE, pp.CALIFICACION, u.NOMBRE
FROM PRODUCTO p
LEFT JOIN PUNTUACION_PRODUCTO pp
ON p.ID=pp.ID_PRODUCTO
INNER JOIN PUBLICACION p2
ON p.ID_PUBLICACION=p2.ID
INNER JOIN USUARIO u
ON u.ID=p2.ID_USUARIO
WHERE p.NOMBRE='NOMBRE PRODUCTO'

/*==============================================================*/
/* Productos no puntuados.                                      */
/*==============================================================*/
SELECT p.NOMBRE, pp.CALIFICACION, u.NOMBRE
FROM PRODUCTO p
LEFT JOIN PUNTUACION_PRODUCTO pp
ON p.ID=pp.ID_PRODUCTO
INNER JOIN PUBLICACION p2
ON p.ID_PUBLICACION=p2.ID
INNER JOIN USUARIO u
ON u.ID=p2.ID_USUARIO WHERE pp.CALIFICACION IS NULL
ORDER BY p.NOMBRE ASC

/*==============================================================*/
/* Productos con más numero de puntuaciones.                    */
/*==============================================================*/
SELECT p.NOMBRE, COUNT(p.NOMBRE) CANTIDAD
FROM PRODUCTO p
LEFT JOIN PUNTUACION_PRODUCTO pp
ON p.ID=pp.ID_PRODUCTO
GROUP BY p.NOMBRE
HAVING COUNT(p.NOMBRE)=
(SELECT MAX(mas) FROM (SELECT p.NOMBRE, COUNT(p.NOMBRE) mas
FROM PRODUCTO p
LEFT JOIN PUNTUACION_PRODUCTO pp
ON p.ID=pp.ID_PRODUCTO
GROUP BY p.NOMBRE)
GO
)

/*==============================================================*/
/* Productos con menos numero de puntuaciones.                  */
/*==============================================================*/
SELECT p.NOMBRE, COUNT(p.NOMBRE) CANTIDAD
FROM PRODUCTO p
LEFT JOIN PUNTUACION_PRODUCTO pp
ON p.ID=pp.ID_PRODUCTO
GROUP BY p.NOMBRE
HAVING COUNT(p.NOMBRE)=
(SELECT MIN(mas) FROM (SELECT p.NOMBRE, COUNT(p.NOMBRE) mas
FROM PRODUCTO p
LEFT JOIN PUNTUACION_PRODUCTO pp
ON p.ID=pp.ID_PRODUCTO
GROUP BY p.NOMBRE)
GO
)

/*==============================================================*/
/* Productos con mejor promedio de puntuaciones.                */
/*==============================================================*/
SELECT p.NOMBRE, AVG(pp.CALIFICACION ) PROMEDIO
FROM PRODUCTO p
LEFT JOIN PUNTUACION_PRODUCTO pp
ON p.ID=pp.ID_PRODUCTO
GROUP BY p.NOMBRE
HAVING AVG(pp.CALIFICACION )=
(SELECT MAX(mas) FROM (SELECT p.NOMBRE, AVG(pp.CALIFICACION) mas
FROM PRODUCTO p
LEFT JOIN PUNTUACION_PRODUCTO pp
ON p.ID=pp.ID_PRODUCTO
GROUP BY p.NOMBRE)
GO
)

/*==============================================================*/
/* Productos con peor promedio de puntuaciones.                 */
/*==============================================================*/
SELECT p.NOMBRE, AVG(pp.CALIFICACION ) PROMEDIO
FROM PRODUCTO p
LEFT JOIN PUNTUACION_PRODUCTO pp
ON p.ID=pp.ID_PRODUCTO
GROUP BY p.NOMBRE
HAVING AVG(pp.CALIFICACION )=
(SELECT MIN(mas) FROM (SELECT p.NOMBRE, AVG(pp.CALIFICACION) mas
FROM PRODUCTO p
LEFT JOIN PUNTUACION_PRODUCTO pp
ON p.ID=pp.ID_PRODUCTO
GROUP BY p.NOMBRE)
GO
)

/*==============================================================*/
/* Todos los usuarios y los productos puntuados.                */
/*==============================================================*/
SELECT u.NOMBRE, p.NOMBRE, pp.CALIFICACION
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN PUNTUACION_PRODUCTO pp
ON u.ID=pp.ID_USUARIO
LEFT JOIN PRODUCTO p
ON p.ID=pp.ID_PRODUCTO
WHERE r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor'
GROUP BY u.NOMBRE, p.NOMBRE, pp.CALIFICACION

/*==============================================================*/
/* Usuario y productos puntuados que ha puntuado.               */
/*==============================================================*/
SELECT u.NOMBRE, p.NOMBRE, pp.CALIFICACION
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
INNER JOIN PUNTUACION_PRODUCTO pp
ON u.ID=pp.ID_USUARIO
INNER JOIN PRODUCTO p
ON p.ID=pp.ID_PRODUCTO
WHERE (r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor') AND u.NOMBRE='CARLOS'
GROUP BY u.NOMBRE, p.NOMBRE, pp.CALIFICACION

/*==============================================================*/
/* Usuarios que no han puntuado productos.                      */
/*==============================================================*/
SELECT u.NOMBRE
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN PUNTUACION_PRODUCTO pp
ON u.ID=pp.ID_USUARIO
LEFT JOIN PRODUCTO p
ON p.ID=pp.ID_PRODUCTO
WHERE (r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor') AND pp.CALIFICACION IS NULL
ORDER BY u.NOMBRE ASC

/*==============================================================*/
/* Usuarios que más productos han puntuado.                     */
/*==============================================================*/
SELECT u.NOMBRE, COUNT(pp.CALIFICACION ) CANTIDAD_EVALUACIONES
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
INNER JOIN PUNTUACION_PRODUCTO pp
ON u.ID=pp.ID_USUARIO
INNER JOIN PRODUCTO p
ON p.ID=pp.ID_PRODUCTO
WHERE r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor'
GROUP BY u.NOMBRE
HAVING COUNT(pp.CALIFICACION)=
(SELECT MAX(mas) FROM (SELECT u.NOMBRE, COUNT(pp.CALIFICACION ) mas
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
INNER JOIN PUNTUACION_PRODUCTO pp
ON u.ID=pp.ID_USUARIO
INNER JOIN PRODUCTO p
ON p.ID=pp.ID_PRODUCTO
WHERE r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor'
GROUP BY u.NOMBRE)
GO
)

/*==============================================================*/
/* Usuarios que menos productos han puntuado.                   */
/*==============================================================*/
SELECT u.NOMBRE, COUNT(pp.CALIFICACION ) CANTIDAD_EVALUACIONES
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
INNER JOIN PUNTUACION_PRODUCTO pp
ON u.ID=pp.ID_USUARIO
INNER JOIN PRODUCTO p
ON p.ID=pp.ID_PRODUCTO
WHERE r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor'
GROUP BY u.NOMBRE
HAVING COUNT(pp.CALIFICACION)=
(SELECT MIN(mas) FROM (SELECT u.NOMBRE, COUNT(pp.CALIFICACION ) mas
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
INNER JOIN PUNTUACION_PRODUCTO pp
ON u.ID=pp.ID_USUARIO
INNER JOIN PRODUCTO p
ON p.ID=pp.ID_PRODUCTO
WHERE r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor'
GROUP BY u.NOMBRE)
GO
)

/*==============================================================*/
/* Todos los usuarios con sus roles.                            */
/*==============================================================*/
SELECT u.NOMBRE, r.NOMBRE
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
ORDER BY u.NOMBRE, r.NOMBRE ASC

/*==============================================================*/
/* Usuario y sus roles.                                         */
/*==============================================================*/
SELECT u.NOMBRE, r.NOMBRE
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
WHERE u.NOMBRE = 'JUAN'
ORDER BY u.NOMBRE, r.NOMBRE

/*==============================================================*/
/* Todos los usuarios y sus accesos.                            */
/*==============================================================*/
SELECT u.NOMBRE, au.FECHA_ACCESO
FROM USUARIO u
INNER JOIN ACCESO_USUARIO au
ON u.ID=au.ID_USUARIO
ORDER BY u.NOMBRE, au.FECHA_ACCESO ASC

/*==============================================================*/
/* Usuario y sus accesos.                                       */
/*==============================================================*/
SELECT u.NOMBRE, au.FECHA_ACCESO
FROM USUARIO u
INNER JOIN ACCESO_USUARIO au
ON u.ID=au.ID_USUARIO
WHERE u.NOMBRE = 'MIGUEL'
ORDER BY u.NOMBRE, au.FECHA_ACCESO ASC

/*==============================================================*/
/* Último acceso usuario.                                       */
/*==============================================================*/
SELECT u.NOMBRE, MAX(au.FECHA_ACCESO) ULTIMO_ACCESO
FROM USUARIO u
INNER JOIN ACCESO_USUARIO au
ON u.ID=au.ID_USUARIO
WHERE u.NOMBRE = 'MIGUEL'
GROUP BY u.NOMBRE

/*==============================================================*/
/* Primer acceso usuario.                                       */
/*==============================================================*/
SELECT u.NOMBRE, MIN(au.FECHA_ACCESO) ULTIMO_ACCESO
FROM USUARIO u
INNER JOIN ACCESO_USUARIO au
ON u.ID=au.ID_USUARIO
WHERE u.NOMBRE = 'MIGUEL'
GROUP BY u.NOMBRE

/*==============================================================*/
/* Todos los usuarios con todas sus consultas.                  */
/*==============================================================*/
SELECT u.NOMBRE, p.NOMBRE, c.TEXTO
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN CONSULTA c
ON u.ID=c.ID_USUARIO
LEFT JOIN PRODUCTO p
ON p.ID=c.ID_PRODUCTO
WHERE r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor'
GROUP BY u.NOMBRE, p.NOMBRE, c.TEXTO

/*==============================================================*/
/* Usuario con todas sus consultas.                  */
/*==============================================================*/
SELECT u.NOMBRE, p.NOMBRE, c.TEXTO
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN CONSULTA c
ON u.ID=c.ID_USUARIO
LEFT JOIN PRODUCTO p
ON p.ID=c.ID_PRODUCTO
WHERE (r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor') AND u.NOMBRE = 'ANDRES'
GROUP BY u.NOMBRE, p.NOMBRE, c.TEXTO

/*==============================================================*/
/* Usuarios que no han hecho consultas.                  */
/*==============================================================*/
SELECT u.NOMBRE
FROM USUARIO u
INNER JOIN ROL_USUARIO ru
ON u.ID=ru.ID_USUARIO
INNER JOIN ROL r
ON r.ID=ru.ID_ROL
LEFT JOIN CONSULTA c
ON u.ID=c.ID_USUARIO
LEFT JOIN PRODUCTO p
ON p.ID=c.ID_PRODUCTO
WHERE (r.NOMBRE='cosumidor' OR r.NOMBRE='proveedor') AND c.TEXTO IS NULL 
GROUP BY u.NOMBRE



