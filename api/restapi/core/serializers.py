from django.contrib.auth.models import User
from rest_framework import serializers
from core.models import CategoriaProducto, Publicacion, Estado, Producto, Categoria


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'password', )  


class CategoriaProductoSerializer(serializers.ModelSerializer):

    class Meta:
        model = CategoriaProducto
        fields = '__all__' 


class EstadoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Estado
        fields = '__all__'


class PublicacionSerializer(serializers.ModelSerializer):
    id_usuario = UserSerializer()
    estado = EstadoSerializer()
    class Meta:
        model = Publicacion
        fields = '__all__'


class ProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = '__all__'


class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = '__all__'


class ProductosPorUsuarioSerializer(serializers.ModelSerializer):
    id_publicacion = PublicacionSerializer()
    class Meta:
        model = Producto
        fields = '__all__'