from easysell_api.models import Usuario, RolUsuario
from rest_framework import serializers

class UsuarioSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Usuario
        fields = ['id','NOMBRE','DIRECCION','FECHA_NAC','OCUPACION','TELEFONO','FECHA_CREACION','ESTADO_ACTIVACION','CONTRASENA']

class RolUsuarioSerializer(serializers.HyperlinkedModelSerializer)   :
    usuario_rol = UsuarioSerializer()
    class Meta:
        model = RolUsuario
        fields = ['id', 'id_usuario', 'id_rol', 'usuario_rol']