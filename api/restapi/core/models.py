# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.contrib.auth.models import User


class Estado(models.Model):
    nombre = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'ESTADO'


class ItemPlataforma(models.Model):
    item_acceso = models.CharField(max_length=100, blank=True, null=True)
    estado = models.ForeignKey(Estado, on_delete=models.CASCADE)

    class Meta:
        managed = True
        db_table = 'ITEM_PLATAFORMA'


class AccesoUsuario(models.Model):
    id_usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    fecha_acceso = models.DateField(blank=True, null=True)
    estado = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'ACCESO_USUARIO'


class Compra(models.Model):
    costo = models.IntegerField(blank=True, null=True)
    id_usuario = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        managed = True
        db_table = 'COMPRA'


class Publicacion(models.Model):
    fecha_creacion = models.DateField(blank=True, null=True)
    id_usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    estado = models.ForeignKey(Estado, on_delete=models.CASCADE)

    class Meta:
        managed = True
        db_table = 'PUBLICACION'


class Producto(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    estado = models.ForeignKey(Estado, on_delete=models.CASCADE)
    id_publicacion = models.ForeignKey(Publicacion, on_delete=models.CASCADE)
    precio = models.IntegerField(blank=True, null=True)
    descripcion = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'PRODUCTO'


class Consulta(models.Model):
    texto = models.CharField(max_length=1000, blank=True, null=True)
    fecha_consulta = models.DateField(blank=True, null=True)
    estado = models.ForeignKey(Estado, on_delete=models.CASCADE)
    id_usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    id_producto = models.ForeignKey(Producto, on_delete=models.CASCADE)

    class Meta:
        managed = True
        db_table = 'CONSULTA'


class DetalleCompra(models.Model):
    id_producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.IntegerField(blank=True, null=True)
    fecha_compra = models.DateField(blank=True, null=True)
    id_compra = models.ForeignKey(Compra, on_delete=models.CASCADE)

    class Meta:
        managed = True
        db_table = 'DETALLE_COMPRA'


class Imagen(models.Model):
    id_producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    imagen = models.BinaryField(blank=True, null=True)
    tamano = models.IntegerField(blank=True, null=True)
    formato = models.CharField(max_length=10, blank=True, null=True)
    fecha_creacion = models.DateField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'IMAGEN'


class Categoria(models.Model):
    tipo = models.CharField(max_length=100, blank=True, null=True)
    nombre = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'CATEGORIA'


class CategoriaProducto(models.Model):
    id_producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    id_categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)

    class Meta:
        managed = True
        db_table = 'CATEGORIA_PRODUCTO'

        
class PuntuacionProducto(models.Model):
    id_producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    id_usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    comentario = models.CharField(max_length=1000, blank=True, null=True)
    calificacion = models.IntegerField(blank=True, null=True)
    fecha_puntuacion_producto = models.DateField(blank=True, null=True)
    fecha_calificacion = models.DateField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'PUNTUACION_PRODUCTO'


class PuntuacionUsuario(models.Model):
    id_usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    id_usuario_calificado = models.IntegerField(null=False)
    fecha_puntuacion = models.DateField(blank=True, null=True)
    calificacion = models.IntegerField(blank=True, null=True)
    fecha_calificacion = models.DateField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'PUNTUACION_USUARIO'


class Rol(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    fecha_creacion = models.DateField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'ROL'


class RolUsuario(models.Model):
    id_usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    id_rol = models.ForeignKey(Rol, on_delete=models.CASCADE)

    class Meta:
        managed = True
        db_table = 'ROL_USUARIO'


class AccesoRolItem(models.Model):
    id_rol = models.ForeignKey(Rol, on_delete=models.CASCADE)
    id_item = models.ForeignKey(ItemPlataforma, on_delete=models.CASCADE)

    class Meta:
        managed = True
        db_table = 'ACCESO_ROL_ITEM'


class AuthGroup(models.Model):
    name = models.CharField(max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'
