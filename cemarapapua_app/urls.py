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
from cemarapapua_app.views import *

app_name = 'cemarapapua_admin'
urlpatterns = [
    # routing ambil class dari view.py
    path('', Cemarapapua_index.as_view(),name='home'),
    path('user/', User.as_view(),name='user'),
    path('user/AddUser/', AddUser.as_view(), name='addusers'),
    path('user/EditUser/<int:userid>/', ProsesEditUser.as_view(), name='edituser'),
    path('user/deleteUser/<int:pk>/', DeleteUser.as_view(), name='deluser'),
    path('category/', Category.as_view(),name='category'),
    path('category/addCategory/', AddCategory.as_view(),name='addcategory'),
    path('user/EditCategory/<int:kategoryid>/', ProsesEditCategory.as_view(), name='editcategory'),
    path('category/deleteCategory/<int:pk>/', DeleteCategory.as_view(), name='delcategory'),
    # path('berita/<int:idberita>/', Berita.as_view()),
    path('mastermenu/', Menu.as_view(),name='mastermenu'),
    path('menu/addmenu/', AddMenu.as_view(),name='addmenu'),
    path('menu/EditMenu/<int:menuid>/', ProsesEditMenu.as_view(), name='editmenu'),
    path('menu/deleteMenu/<int:menuid>/', DeleteMenu.as_view(), name='delmenu'),
    path('setting_app/',Setting_aplikasi_Base.as_view(),name='setting_app'),
    path('kegiatanGereja/', PostsGereja.as_view(),name='kegiatanGereja'),
    path('firtu/', PostsFirtu.as_view(),name='firtu'),
    path('opini/', PostsOpini.as_view(),name='opini'),
    path('postsnews/', Posts.as_view(),name='postsnews'),
    path('postsnews/AddPostBerita/', AddPostBerita.as_view(), name='addPosts'),
    path('login/', Login.as_view(), name='login'),
    path('CekLogin/', CekLogin.as_view(),name='CekLogin'),
 
]
