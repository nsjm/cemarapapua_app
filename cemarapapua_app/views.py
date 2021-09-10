from typing import ValuesView
from django.db.models import fields
from django.http import request
from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.views import View
import pprint
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView, DeleteView, UpdateView
# from .forms import  *
import bcrypt
from django import forms
import datetime
from ckeditor.widgets import CKEditorWidget
from django.contrib.auth import authenticate



from cemarapapua_app.models import *
class Cemarapapua_index(View):
   def get(self, request):
       
       return render(request,'admin/content.html')
        
class Setting_aplikasi_Base(View):
    def get(self, request):
        mSettingAplikasi = Setting_aplikasi.objects.all().order_by('-setting_id')
        
        data_SettingAplikasi = {
                "VsettingAplikasi": mSettingAplikasi  
            }
        return render(request,'admin/setting_app.html',data_SettingAplikasi)

class Menu(View):
    def get(self, request):
        form  = MenuForm_add()
        mMastermenu = Mastermenu.objects.all().order_by('menu_id')
        
        data_mastermenu = {
                "Vmenu" : mMastermenu ,
                "form"  : form, 
            }
        return render(request,'admin/mastermenu.html',data_mastermenu)

class MenuForm_add(forms.ModelForm):
    class Meta:
            model = Mastermenu
            fields = ['menu','parent_id','url','icon']
    menu = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    parent_id = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    url = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    icon = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))

class AddMenu(View):
    def post(self,request):
        formAddmenu = MenuForm_add(request.POST)
        if formAddmenu.is_valid():
            formAddmenu.save()
            return redirect('cemarapapua_admin:mastermenu')
        return redirect('cemarapapua_admin:mastermenu')

class MenuFrom_edit(forms.ModelForm):
    class Meta:
        model   = Mastermenu
        fields = ['menu','parent_id','url','icon']
    menu = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    parent_id = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    url = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    icon = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))

class ProsesEditMenu(View):
    def post(self, request, menuid):
        formEditMenu = MenuFrom_edit(request.POST)
        if formEditMenu.is_valid():
            menu_dt             = Mastermenu.objects.get(menu_id = menuid)
            menu_dt.menu        = formEditMenu.cleaned_data.get('menu')
            menu_dt.parent_id        = formEditMenu.cleaned_data.get('parent_id')
            menu_dt.url        = formEditMenu.cleaned_data.get('url')
            menu_dt.icon        = formEditMenu.cleaned_data.get('icon')
            menu_dt.status      = 'aktif'
            menu_dt.save()
        return redirect('cemarapapua_admin:mastermenu')

class DeleteMenu(View):
    def get(self, request, menuid):
        try:
            qryUpdate_Menu = Mastermenu.objects.get(menu_id = menuid)
            qryUpdate_Menu.status = 'Tidak'
            qryUpdate_Menu.save()

        except Mastermenu.DoesNotExist:
            return redirect('cemarapapua_admin:mastermenu')  
        return redirect('cemarapapua_admin:mastermenu')

class User(View):
    def get(self, request):
        form = UserForm_add()
        password_from_form = 'bb'.encode('utf-8')
        password_from_db = b'$2b$12$.wiC1KNbrFNvq1hMgxOpKObti1JXbPybanyTQu68C7lYLKZG3dQKa'
        if bcrypt.checkpw(password_from_form, password_from_db):
            print("Cocok , Redirect Ke Index Dashboard")
        else:
            print("Redirect ke login page")
        muser = Masteruser.objects.all().order_by('user_id')
        dataUser = {
                    "ViewMaster_user" : muser, 
                    "form":form,
                }
        return render(request,'admin/masteruser.html',dataUser)

# function insert data user
class UserForm_add(forms.ModelForm):
    class Meta:
        model = Masteruser
        fields = ['username','password','full_name','level_user']
    
    level_user = [
            ('superadmin', 'Super Admin'),
            ('admin', 'Admin'),
            ('client', 'Client'),
        ]
    
    username = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    full_name = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    level_user = forms.ChoiceField(widget=forms.Select(attrs={'class':'form-control'}), choices=level_user)
    password = forms.CharField(label='subject', widget=forms.PasswordInput(attrs={'class': "form-control"}))

class AddUser(View):
    def post(self,request):
        formAddUser = UserForm_add(request.POST)
        if formAddUser.is_valid():
            getPasswordField = formAddUser.cleaned_data.get('password')
            hashed = bcrypt.hashpw(getPasswordField.encode('utf-8'), bcrypt.gensalt())
            a = formAddUser.save(commit=False)
            a.password = hashed
            formAddUser.save()
            return redirect('cemarapapua_admin:user')
        return redirect('cemarapapua_admin:user')

class UserForm_edit(forms.ModelForm):
    class Meta:
        model = Masteruser
        fields = ['username','full_name','level_user']
    
    level_user = [
            ('superadmin', 'Super Admin'),
            ('admin', 'Admin'),
            ('client', 'Client'),
        ]
    
    username = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    full_name = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    level_user = forms.ChoiceField(widget=forms.Select(attrs={'class':'form-control'}), choices=level_user)

class ProsesEditUser(View):
    def post(self, request, userid):
        formEditUser = UserForm_edit(request.POST)
        if formEditUser.is_valid():
            user_dt = Masteruser.objects.get(user_id = userid)
            user_dt.username = formEditUser.cleaned_data.get('username')
            user_dt.full_name = formEditUser.cleaned_data.get('full_name')
            user_dt.level_user = formEditUser.cleaned_data.get('level_user')
            user_dt.save()
        
        return redirect('cemarapapua_admin:user')

class DeleteUser(View):
    # model = Masteruser
    # success_url = reverse_lazy('cemarapapua_admin:user')
    # def get(self, request, *args, **kwargs):
    #     return self.post(request, *args, **kwargs)
    def get(self, request, pk):
        
        try:
            qryUpdate_User = Masteruser.objects.get(user_id = pk)
            qryUpdate_User.user_status = 'N'
            qryUpdate_User.save()
            
        except Masteruser.DoesNotExist:
            return redirect('cemarapapua_admin:user')  
        return redirect('cemarapapua_admin:user')    

class Category(View):
    def get(self, request):
        form = CatetegoryFrom_add()
        mcategory = Mastercategory.objects.all()
        # pprint.pprint(mcategory)
        data_category = {
                "kategory": mcategory,
                 "form":form, 
            }
        return render(request,'admin/category.html',data_category)

class CatetegoryFrom_add(forms.ModelForm):
    class Meta:
        model   = Mastercategory
        fields  = ['categorys'] 
    
    categorys = forms.CharField(label='kategori', widget=forms.TextInput(attrs={'class': "form-control"}))

class AddCategory(View):
    def post(self,request):
        formAddCategory = CatetegoryFrom_add(request.POST)
        if formAddCategory.is_valid():
            formAddCategory.save()
            return redirect('cemarapapua_admin:category')
        return redirect('cemarapapua_admin:category')

class CatetegoryFrom_edit(forms.ModelForm):
    class Meta:
        model   = Mastercategory
        fields  = ['categorys'] 
    categorys = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))

class ProsesEditCategory(View):
    def post(self, request, kategoryid):
        formEditCategory = CatetegoryFrom_edit(request.POST)
        if formEditCategory.is_valid():
            category_dt             = Mastercategory.objects.get(category_id = kategoryid)
            category_dt.categorys   = formEditCategory.cleaned_data.get('categorys')
            category_dt.category_status = 'Y'
            category_dt.save()
        return redirect('cemarapapua_admin:category')

class DeleteCategory(View):
    def get(self, request, pk):
        try:
            qryUpdateCategory = Mastercategory.objects.get(category_id = pk)
            qryUpdateCategory.category_status = 'N'
            qryUpdateCategory.save()

        except Mastercategory.DoesNotExist:
            return redirect('cemarapapua_admin:category')
        return redirect('cemarapapua_admin:category')


class Posts(View):
    def get(self, request):
        mPosts = Postsberita.objects.all().order_by('posts_id')
        dataPostsNews = {
            "ViewPostNews" : mPosts,
            #  "form":form,
        }
        return render(request,'admin/postsnews.html',dataPostsNews)

class PostsFrom_add(forms.ModelForm):
    
    class Meta:
        model    = Postsberita
        fields   = ['posts_date','user_id','category_id','menu_id','posts_title','posts_desc','posts_img','posts_page_view','posts_keyword'] 
    posts_date    =   forms.DateField(initial=datetime.date.today,widget = forms.HiddenInput(), required = False)
    posts_title   =   forms.CharField(label='posts_title', widget=forms.TextInput(attrs={'class': "form-control"}))
    posts_desc    =   forms.CharField(widget=CKEditorWidget())
    posts_img     =   forms.FileField()
    posts_keyword =   forms.CharField(label='posts_desc', widget=forms.TextInput(attrs={'class': "form-control"}))
    category_id   =   forms.ModelChoiceField(queryset=Mastercategory.objects.all(),empty_label='Pilih Kategori',widget=forms.Select(attrs={'class':'form-control'}))

class AddPostBerita(View):
    def get(self, request):
        form = PostsFrom_add()
        AddPosts = { 
            "form"  :   form
        }
        return render(request,'admin/addposts.html',AddPosts)

class Proses_addBerita(View):
    def post(self,request):
        formAddBerita = PostsFrom_add(request.POST)
        if formAddBerita.is_valid():
            print('blablabla')
            formAddBerita.save()
            return redirect('cemarapapua_admin:postsnews')
        return redirect('cemarapapua_admin:postsnews')

# delete post berita
class DeletePosts(View):
    def get(self, request, pk):
        try:
            qryUpdatePosts = Postsberita.objects.get(posts_id = pk)
            qryUpdatePosts.posts_status = 'draft'
            qryUpdatePosts.save()

        except Postsberita.DoesNotExist:
            return redirect('cemarapapua_admin:postsnews')
        return redirect('cemarapapua_admin:postsnews')
# view detail berita admin


class PostsGereja(View):
    def get(self, request):
        mDatagereja = Postsberita.objects.filter(category_id=2).order_by('posts_id')

        dataVkGereja = {
                    "ViewdataGereja" : mDatagereja,
                    
                }
        return render(request,'admin/listGereja.html',dataVkGereja)

class PostsFirtu(View):
    def get(self, request):
        mDatafirtu = Postsfirmantuhan.objects.all().order_by('firtu_id')
        
        
        dataVkGereja = {
                    "ViewdataFirtu" : mDatafirtu,
                    
                }
        return render(request,'admin/listfirtu.html',dataVkGereja)

class PostsOpini(View):
    def get(self, request):
        mDataopini = Postsberita.objects.filter(category_id=14).order_by('posts_id')
        
        
        dataVkGereja = {
                    "Viewdataopini" : mDataopini,
                    
                }
        return render(request,'admin/listopini.html',dataVkGereja)

class Login(View):
    def get(self, request):
        formLogin = UserForm_login(request.POST)
        loginUser = "Sign in to continue to Creator."
        dataLogin = { 
                        "Vlogin" : loginUser ,
                        'form'   : formLogin
                    }
        return render(request,'admin/login.html',dataLogin)

    def post(self, request):
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        cekusername = Masteruser.objects.filter(username = username ).exists()
        cekpassword = Masteruser.objects.filter(password = password).exists()
        user = authenticate(request, username=username, password=password)
        print(user)
        if user is not None:
            return redirect('cemarapapua_admin:home')
        else:
            return redirect('cemarapapua_admin:login')

        return redirect('cemarapapua_admin:login')

class UserForm_login(forms.ModelForm):
    class Meta:
        model = Masteruser
        fields = ['username','password']
    username = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    password = forms.CharField(label='subject', widget=forms.PasswordInput(attrs={'class': "form-control"}))


            






    

