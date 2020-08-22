from django.shortcuts import render
import pyodbc
from easysell_api.models import Usuario, PuntuacionProducto, Producto, Rol, RolUsuario
from rest_framework import generics, viewsets, permissions
import django.db.models.manager
from easysell_api.serializers import UsuarioSerializer, RolUsuarioSerializer


#Modificar cadena según SQL Local
conn = pyodbc.connect('Driver={sql server};'
                        'Server=USUARIO-PC;'
                        'Database=EasySell;'
                        'Trusted_Connection=yes;')
                        
def cal_producto_usuario(request):
    cursor = conn.cursor()
    cursor.execute("select usu.nombre USUARIO, pro.NOMBRE PRODUCTO, pun.CALIFICACION, pun.FECHA_CALIFICACION "
                   "from usuario usu "
                   "join puntuacion_producto pun on usu.id = pun.id_usuario "
                   "join PRODUCTO pro on pun.ID_PRODUCTO = pro.ID")
    result = cursor.fetchall()
    return render(request, 'cal_producto_usuario.html',{'cal_producto_usuario':result})

def not_cal_producto_usuario(request):
    cursor = conn.cursor()
    cursor.execute("select usu.id ID_USUARIO, usu.NOMBRE NOMBRE_USUARIO "
                   "from USUARIO usu "                    
                   "left join PUNTUACION_PRODUCTO pun on usu.ID = pun.ID_USUARIO "
                   "where pun.ID_USUARIO is null")
    result = cursor.fetchall()
    return render(request, 'not_cal_producto_usuario.html',{'not_cal_producto_usuario':result})

def usuarios(request):
    cursor = conn.cursor()
    cursor.execute("select usu.id ID_USUARIO, usu.NOMBRE NOMBRE_USUARIO, rol.NOMBRE NOMBRE_ROL "
                   "from USUARIO usu "
                   "join ROL_USUARIO rol_usu on usu.ID = rol_usu.ID_USUARIO "
                   "join ROL rol on rol_usu.ID_ROL = rol.ID "
                   "ORDER BY usu.NOMBRE asc")
    result = cursor.fetchall()
    return render(request, 'usuarios.html', {'usuarios':result})

def acceso_item_usuario(request):
    cursor = conn.cursor()
    cursor.execute("select usu.NOMBRE NOMBRE_USUARIO, item.ITEM_ACCESO "
                      "from USUARIO usu "
                      "join ROL_USUARIO rol_usu on usu.ID = rol_usu.ID_USUARIO "
                      "join ROL rol on rol_usu.ID_ROL = rol.ID "
                      "join ACCESO_ROL_ITEM acc on rol.ID = acc.ID_ROL "
                      "join ITEM_PLATAFORMA item on acc.ID_ITEM = item.ID "
                      "order by usu.NOMBRE asc")
    result = cursor.fetchall()
    return render(request, 'acceso_item_usuario.html', {'acceso_item_usuario':result})

def consulta_usuario_producto(request):
    cursor = conn.cursor()
    cursor.execute("select usu.NOMBRE NOMBRE_USUARIO, pro.NOMBRE NOMBRE_PRODUCTO, con.FECHA_CONSULTA, con.TEXTO TEXTO_CONSULTA "
                      "from USUARIO usu "
                      "join CONSULTA con on usu.ID = con.ID_USUARIO "
                      "join PRODUCTO pro on con.ID_PRODUCTO = pro.ID "
                      "order by con.FECHA_CONSULTA desc")
    result = cursor.fetchall()
    return render(request, 'consulta_usuario_producto.html', {'consulta_usuario_producto':result}) 

def ranking_producto(request):
    cursor = conn.cursor()
    cursor.execute("select pro.NOMBRE, pun.CALIFICACION "
                      "from PRODUCTO pro "
                      "join PUNTUACION_PRODUCTO pun on pro.ID = pun.ID_PRODUCTO "
                      "order by pun.CALIFICACION desc ")
    result = cursor.fetchall()
    return render(request, 'ranking_producto.html', {'ranking_producto':result}) 