# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AccesoRolItem(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_rol = models.ForeignKey('Rol', models.DO_NOTHING, db_column='ID_ROL')  # Field name made lowercase.
    id_item = models.ForeignKey('ItemPlataforma', models.DO_NOTHING, db_column='ID_ITEM')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ACCESO_ROL_ITEM'


class AccesoUsuario(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='ID_USUARIO')  # Field name made lowercase.
    fecha_acceso = models.DateField(db_column='FECHA_ACCESO', blank=True, null=True)  # Field name made lowercase.
    estado = models.BooleanField(db_column='ESTADO', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ACCESO_USUARIO'


class Categoria(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    tipo = models.CharField(db_column='TIPO', max_length=100, blank=True, null=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=100, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CATEGORIA'


class CategoriaProducto(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_producto = models.ForeignKey('Producto', models.DO_NOTHING, db_column='ID_PRODUCTO')  # Field name made lowercase.
    id_categoria = models.ForeignKey(Categoria, models.DO_NOTHING, db_column='ID_CATEGORIA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CATEGORIA_PRODUCTO'


class Compra(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    costo = models.IntegerField(db_column='COSTO', blank=True, null=True)  # Field name made lowercase.
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='ID_USUARIO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'COMPRA'


class Consulta(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    texto = models.CharField(db_column='TEXTO', max_length=1000, blank=True, null=True)  # Field name made lowercase.
    fecha_consulta = models.DateField(db_column='FECHA_CONSULTA', blank=True, null=True)  # Field name made lowercase.
    estado = models.ForeignKey('Estado', models.DO_NOTHING, db_column='ESTADO')  # Field name made lowercase.
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='ID_USUARIO')  # Field name made lowercase.
    id_producto = models.ForeignKey('Producto', models.DO_NOTHING, db_column='ID_PRODUCTO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CONSULTA'


class DetalleCompra(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_producto = models.ForeignKey('Producto', models.DO_NOTHING, db_column='ID_PRODUCTO')  # Field name made lowercase.
    cantidad = models.IntegerField(db_column='CANTIDAD', blank=True, null=True)  # Field name made lowercase.
    fecha_compra = models.DateField(db_column='FECHA_COMPRA', blank=True, null=True)  # Field name made lowercase.
    id_compra = models.ForeignKey(Compra, models.DO_NOTHING, db_column='ID_COMPRA')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'DETALLE_COMPRA'


class Estado(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ESTADO'


class Imagen(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_producto = models.ForeignKey('Producto', models.DO_NOTHING, db_column='ID_PRODUCTO')  # Field name made lowercase.
    imagen = models.BinaryField(db_column='IMAGEN', blank=True, null=True)  # Field name made lowercase.
    tamano = models.IntegerField(db_column='TAMANO', blank=True, null=True)  # Field name made lowercase.
    formato = models.CharField(db_column='FORMATO', max_length=10, blank=True, null=True)  # Field name made lowercase.
    fecha_creacion = models.DateField(db_column='FECHA_CREACION', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'IMAGEN'


class ItemPlataforma(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    item_acceso = models.CharField(db_column='ITEM_ACCESO', max_length=100, blank=True, null=True)  # Field name made lowercase.
    estado = models.ForeignKey(Estado, models.DO_NOTHING, db_column='ESTADO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ITEM_PLATAFORMA'


class Producto(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=100, blank=True, null=True)  # Field name made lowercase.
    estado = models.ForeignKey(Estado, models.DO_NOTHING, db_column='ESTADO')  # Field name made lowercase.
    id_publicacion = models.ForeignKey('Publicacion', models.DO_NOTHING, db_column='ID_PUBLICACION')  # Field name made lowercase.
    precio = models.IntegerField(db_column='PRECIO', blank=True, null=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=1000, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PRODUCTO'


class Publicacion(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    fecha_creacion = models.DateField(db_column='FECHA_CREACION', blank=True, null=True)  # Field name made lowercase.
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='ID_USUARIO')  # Field name made lowercase.
    estado = models.ForeignKey(Estado, models.DO_NOTHING, db_column='ESTADO')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PUBLICACION'


class PuntuacionProducto(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_producto = models.ForeignKey(Producto, models.DO_NOTHING, db_column='ID_PRODUCTO')  # Field name made lowercase.
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='ID_USUARIO')  # Field name made lowercase.
    comentario = models.CharField(db_column='COMENTARIO', max_length=1000, blank=True, null=True)  # Field name made lowercase.
    calificacion = models.IntegerField(db_column='CALIFICACION', blank=True, null=True)  # Field name made lowercase.
    fecha_puntuacion_producto = models.DateField(db_column='FECHA_PUNTUACION_PRODUCTO', blank=True, null=True)  # Field name made lowercase.
    fecha_calificacion = models.DateField(db_column='FECHA_CALIFICACION', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PUNTUACION_PRODUCTO'


class PuntuacionUsuario(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='ID_USUARIO')  # Field name made lowercase.
    id_usuario_calificado = models.IntegerField(db_column='ID_USUARIO_CALIFICADO')  # Field name made lowercase.
    fecha_puntuacion = models.DateField(db_column='FECHA_PUNTUACION', blank=True, null=True)  # Field name made lowercase.
    calificacion = models.IntegerField(db_column='CALIFICACION', blank=True, null=True)  # Field name made lowercase.
    fecha_calificacion = models.DateField(db_column='FECHA_CALIFICACION', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'PUNTUACION_USUARIO'


class Rol(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=100, blank=True, null=True)  # Field name made lowercase.
    fecha_creacion = models.DateField(db_column='FECHA_CREACION', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ROL'


class RolUsuario(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='ID_USUARIO')  # Field name made lowercase.
    id_rol = models.ForeignKey(Rol, models.DO_NOTHING, db_column='ID_ROL')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ROL_USUARIO'


class Usuario(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='NOMBRE', max_length=100, blank=True, null=True)  # Field name made lowercase.
    direccion = models.CharField(db_column='DIRECCION', max_length=100, blank=True, null=True)  # Field name made lowercase.
    fecha_nac = models.DateField(db_column='FECHA_NAC', blank=True, null=True)  # Field name made lowercase.
    ocupacion = models.CharField(db_column='OCUPACION', max_length=100, blank=True, null=True)  # Field name made lowercase.
    telefono = models.CharField(db_column='TELEFONO', max_length=15, blank=True, null=True)  # Field name made lowercase.
    fecha_creacion = models.DateField(db_column='FECHA_CREACION', blank=True, null=True)  # Field name made lowercase.
    estado_activacion = models.ForeignKey('self', models.DO_NOTHING, db_column='ESTADO_ACTIVACION')  # Field name made lowercase.
    contrasena = models.CharField(db_column='CONTRASENA', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'USUARIO'


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
