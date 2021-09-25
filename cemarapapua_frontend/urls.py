"""cemarapapua URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
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
from django import views
from django.contrib import admin
from django.urls import path
from django.urls.conf import include
from cemarapapua_frontend.views import *

app_name = 'cemarapapua_front'
urlpatterns = [
    # routing ambil class dari view.py
    path('', Cemarapapua_front_index.as_view()),
    path('contact/', Contact.as_view(),name='contact'),
    path('kegiatan_gereja/', Kegiatan_gereja.as_view(),name='kegiatan_gereja'),
    path('firtu/', Firmantuhan.as_view(),name='firtu'),
    path('gallery_foto/', Foto.as_view(),name='gallery_foto'),
    path('gallery_video/', Video.as_view(),name='gallery_video'),
    path('opini/', Opini.as_view(),name='opini'),
    path('pemerintah/', Pemerintah.as_view(),name='pemerintah'),
    path('hukumpolitik/', Hukumpolitik.as_view(),name='hukumpolitik'),
    path('sosialbudaya/', SosialBudaya.as_view(),name='sosialbudaya'),
    path('pendidikan/', Pendidikan.as_view(),name='pendidikan'),
    path('ekonomi/', Ekonomi.as_view(),name='ekonomi'),
    path('kesehatan/', Kesehatan.as_view(),name='kesehatan'),
    path('Detail_post/<int:pk>/', Detail_post.as_view(), name='detailposts'),
    path('Detail_firtu/<int:pk>/', Detail_firtu.as_view(), name='detailfirtu'),
    
  

]
