from django.shortcuts import render
from rest_framework.response import Response
from django.contrib.auth.models import User
from rest_framework.permissions import AllowAny
from rest_framework import generics, viewsets
from core.models import Publicacion, Estado
from core.serializers import UserSerializer, PublicacionSerializer, EstadoSerializer

# vista listar todos los usuarios de ejemplo
class UserList(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer

class PublicacionList(generics.ListAPIView):
    serializer_class = PublicacionSerializer

    def get_queryset(self):
        queryset = Publicacion.objects.all()
        estado = self.request.query_params.get('estado', None)
        queryset = Publicacion.objects.filter(estado__nombre=estado)
        return queryset

class EstadoList(generics.ListAPIView):
    queryset = Estado.objects.all()
    serializer_class = EstadoSerializer

