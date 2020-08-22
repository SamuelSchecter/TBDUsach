"""restapi URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url
from core.views import ListaUsuarios, ListaEstados, ListaPublicaciones, ListaProductos, ListaCategorias, ProductosPorUsuarioLista


urlpatterns = [
    path('admin/', admin.site.urls),
    url(r'^usuarios/', ListaUsuarios.as_view()),
    url(r'^estados/', ListaEstados.as_view()),
    url(r'^publicaciones/', ListaPublicaciones.as_view()),
    url(r'^productos/', ListaProductos.as_view()),
    url(r'^categorias/', ListaCategorias.as_view()),
    url(r'^usuario/productos', ProductosPorUsuarioLista.as_view())
]
