from django.contrib import admin
from core.models import AccesoRolItem
from core.models import AccesoUsuario
from core.models import Categoria
from core.models import CategoriaProducto
from core.models import Compra
from core.models import Consulta
from core.models import DetalleCompra
from core.models import Estado
from core.models import Imagen
from core.models import ItemPlataforma
from core.models import Producto
from core.models import Publicacion
from core.models import PuntuacionProducto
from core.models import PuntuacionUsuario
from core.models import Rol
from core.models import RolUsuario
from core.models import Usuario

# Register your models here.
admin.site.register(AccesoRolItem)
admin.site.register(AccesoUsuario)
admin.site.register(Categoria)
admin.site.register(CategoriaProducto)
admin.site.register(Compra)
admin.site.register(Consulta)
admin.site.register(DetalleCompra)
admin.site.register(Estado)
admin.site.register(Imagen)
admin.site.register(ItemPlataforma)
admin.site.register(Producto)
admin.site.register(Publicacion)
admin.site.register(PuntuacionProducto)
admin.site.register(PuntuacionUsuario)
admin.site.register(Rol)
admin.site.register(RolUsuario)
admin.site.register(Usuario)