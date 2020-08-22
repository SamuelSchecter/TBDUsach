from rest_framework.filters import OrderingFilter
from django_filters.rest_framework import DjangoFilterBackend, FilterSet
from django.contrib.auth.models import User
from rest_framework.permissions import AllowAny
from rest_framework import generics, viewsets
from core.models import Publicacion, Estado, Producto, Categoria
from core.serializers import UserSerializer, PublicacionSerializer, EstadoSerializer, ProductoSerializer, CategoriaSerializer, ProductosPorUsuarioSerializer


class ListaUsuarios(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    ordering_fields = '__all__'
    filterset_fields = ['id', 'username', 'email', 'first_name', 'last_name', 'user_permissions', 'last_login', 'is_superuser', 'is_staff']


class ListaPublicaciones(generics.ListAPIView):
    queryset = Publicacion.objects.all()
    serializer_class = PublicacionSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    ordering_fields = '__all__'
    filterset_fields = '__all__'


class ListaEstados(generics.ListAPIView):
    queryset = Estado.objects.all()
    serializer_class = EstadoSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    ordering_fields = '__all__'
    filterset_fields = '__all__'


class ListaProductos(generics.ListAPIView):
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    ordering_fields = '__all__'
    filterset_fields = '__all__'


class ListaCategorias(generics.ListAPIView):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    ordering_fields = '__all__'
    filterset_fields = '__all__'


class ProductosPorUsuarioLista(generics.ListAPIView):
    queryset = Producto.objects.all()
    serializer_class = ProductosPorUsuarioSerializer
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    ordering_fields = '__all__'
    filterset_fields = '__all__'
