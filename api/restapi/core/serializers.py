from django.contrib.auth.models import User
from rest_framework import serializers
from core.models import CategoriaProducto, Publicacion, Estado

# serializador con todos los campos de usuario de ejemplo
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'  

class CategoriaProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = CategoriaProducto
        fields = '__all__' 

class EstadoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Estado
        fields = '__all__' 

class PublicacionSerializer(serializers.ModelSerializer):
    estado = EstadoSerializer()
    class Meta:
        model = Publicacion
        fields = '__all__' 