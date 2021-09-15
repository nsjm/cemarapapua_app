import re
from typing import ValuesView
from django.db.models import fields
from django.db.models.base import Model
from django.db.models.fields import files
from django.forms.models import ModelForm
from django.http import request
from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.views import View
import pprint,os
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView, DeleteView, UpdateView
# from .forms import  *
import bcrypt, random
from django import forms
import datetime
from ckeditor.widgets import CKEditorWidget
from django.contrib.auth import authenticate
from django.contrib import messages
from cemarapapua.settings import SESI_ADMIN,BASE_DIR

from global_var.global_var import Security, my_login_checking,dropbox_,upload_file



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
            a.password = hashed.decode('utf-8')
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


class UserProfile_log(View):
    def get(self,request,userid):
        userProfil_dt = Masteruser.objects.get(user_id = userid)
        form = EditProfilUser()
        profil_dt = {
            "view_profile":userProfil_dt,
            "form":form,
        }
        return render (request, 'admin/profil_user.html', profil_dt)

class EditProfilUser(forms.ModelForm):
    class Meta:
        model = Masteruser
        fields = ['username','full_name','password']
    username = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    full_name = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    password = forms.CharField(label='subject', widget=forms.PasswordInput(attrs={'class': "form-control"})) 
    
class Proses_updateProfil(View):
    def post(self, request, userid):
        formeditprofil =  EditProfilUser(request.POST)
        if formeditprofil.is_valid():
            getPasswordField = formeditprofil.cleaned_data.get('password')
            hashed = bcrypt.hashpw(getPasswordField.encode('utf-8'), bcrypt.gensalt())
            a = formeditprofil.save(commit=False)
            a.password = hashed.decode('utf-8')
            profil_dt = Masteruser.objects.get(user_id = userid)
            profil_dt.username = formeditprofil.cleaned_data.get('username')
            profil_dt.full_name =formeditprofil.cleaned_data.get('full_name')
            return redirect('cemarapapua_admin:userprofile',userid)
        return redirect('cemarapapua_admin:userprofile',userid)

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
        fields   = ['category_id','posts_title','posts_desc','posts_img','posts_keyword'] 
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
        formAddBerita = PostsFrom_add(request.POST,request.FILES)
        if formAddBerita.is_valid():
            upload = request.FILES.get('posts_img')

            a = formAddBerita.save(commit=False)
            a.user_id = Masteruser.objects.get(user_id = 1)
            dbx_ = dropbox_()
            c_upload = upload_file()
            check_filename = Postsberita.objects.filter(posts_img = upload.name).exists()
            if check_filename:
                name_file = str(random.randint(0, 10000))+'_'+upload.name
            else:
                name_file = upload.name
            l_name, s_name = c_upload.handle_uploaded_file(upload, name_file)
            
            
            with open(l_name, 'rb') as f:
                data_ = f.read()
            upload_stat = dbx_.upload(data_,filename=name_file)
            
            if upload_stat:
                os.remove(l_name)
                a.posts_img = s_name
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
class DetailPosts(View):
    def get(self, request, pk):
        mDetailPosts = Postsberita.objects.filter(posts_id = pk)
        dataPostsNews = {
            "ViewDetailPostNews" : mDetailPosts,
        }
        return render(request,'admin/detail_postsnews.html',dataPostsNews)
# edit posting berita
class ViewEditPosts(View):
    def get(self, request, postsid):
        mDetailPosts = Postsberita.objects.get(posts_id = postsid)
        form = PostsForm_edit(initial={
            'posts_title':mDetailPosts.posts_title,
            'posts_desc' :mDetailPosts.posts_desc,
            'posts_img'  :mDetailPosts.posts_img,
            'posts_keyword': mDetailPosts.posts_keyword,
            'category_id': mDetailPosts.category_id})
        idpk = postsid
        dataPostsNews = {
            "form"  :   form,
            "IDPOSTS" : idpk,
        }
        return render(request,'admin/editposts.html',dataPostsNews)

class PostsForm_edit(forms.ModelForm):
    class Meta:
        model = Postsberita
        fields = ['posts_title','posts_desc','category_id','posts_img','posts_keyword']
    posts_title   =   forms.CharField(label='posts_title', widget=forms.TextInput(attrs={'class': "form-control"}))
    posts_desc    =   forms.CharField(widget=CKEditorWidget())
    posts_img     =   forms.FileField()
    posts_keyword =   forms.CharField(label='posts_desc', widget=forms.TextInput(attrs={'class': "form-control"}))
    category_id   =   forms.ModelChoiceField(queryset=Mastercategory.objects.all(),empty_label='Pilih Kategori',widget=forms.Select(attrs={'class':'form-control'}))

class ProsesEditPosts(View):
    def post(self, request, postsid):
        formeditPosts = PostsForm_edit(request.POST)
        if formeditPosts.is_valid():
            upload = request.FILES.get('posts_img')

            a = PostsForm_edit.save(commit=False)
            a.user_id = Masteruser.objects.get(user_id = 1)
            dbx_ = dropbox_()
            c_upload = upload_file()
            check_filename = Postsberita.objects.filter(posts_img = upload.name).exists()
            if check_filename:
                name_file = str(random.randint(0, 10000))+'_'+upload.name
            else:
                name_file = upload.name
            l_name, s_name = c_upload.handle_uploaded_file(upload, name_file)
            
            
            with open(l_name, 'rb') as f:
                data_ = f.read()
            upload_stat = dbx_.upload(data_,filename=name_file)
            
            if upload_stat:
                os.remove(l_name)
                a.posts_img = s_name
                PostsForm_edit.save()
                post_dt = Postsberita.objects.get(postsid)
                post_dt.posts_title = formeditPosts.cleaned_data.get('posts_title')
                post_dt.posts_desc = formeditPosts.cleaned_data.get('posts_desc')
                post_dt.posts_img = formeditPosts.cleaned_data.get('posts_img')
                post_dt.posts_keyword = formeditPosts.cleaned_data.get('posts_keyword')
                post_dt.category_id = formeditPosts.cleaned_data.get('category_id')
                post_dt.save()
            return redirect('cemarapapua_admin:postsnews')
        return redirect('cemarapapua_admin:postsnews')



class PostsGereja(View):
    def get(self, request):
        mDatagereja = Postsberita.objects.filter(category_id=2).order_by('posts_id')

        dataVkGereja = {
                    "ViewdataGereja" : mDatagereja,
                    
                }
        return render(request,'admin/listGereja.html',dataVkGereja)
# delete Postingan Gereja
class DeleteKegiatanGereja(View):
    def get(self, request, pk):
        try:
            qryUpdateKegiatangereja = Postsberita.objects.get(posts_id=pk)
            qryUpdateKegiatangereja.posts_status = 'draft'
            qryUpdateKegiatangereja.save()

        except Postsberita.DoesNotExist:
            return redirect('cemarapapua_admin:kegiatanGereja')

        return redirect('cemarapapua_admin:kegiatanGereja')
#detail postingan kegiatan gereja
class DetailPostsGereja(View):
    def get(self, request, pk):
        mDetailPosts = Postsberita.objects.filter(posts_id = pk)
        dataPostsNews = {
            "ViewDetailPostNews" : mDetailPosts,
            
        }
        return render(request,'admin/detail_kegiatanGereja.html',dataPostsNews)
class PostsFirtu(View):
    def get(self, request):
        mDatafirtu = Postsfirmantuhan.objects.all().order_by('firtu_id')
        
        
        dataVkGereja = {
                    "ViewdataFirtu" : mDatafirtu,
                    
                }
        return render(request,'admin/listfirtu.html',dataVkGereja)
# tambah firtu
class FirtuFrom_add(forms.ModelForm):
    
    class Meta:
        model     =   Postsfirmantuhan
        fields    =   ['firtu_title','firtu_desc','firtu_img'] 
    firtu_title   =   forms.CharField(label='firtu_title', widget=forms.TextInput(attrs={'class': "form-control"}))
    firtu_desc    =   forms.CharField(widget=CKEditorWidget())
    firtu_img     =   forms.FileField()

class AddPostFirtu(View):
    def get(self, request):
        form = FirtuFrom_add()
        
        AddPosts = { 
            "form"  :   form
        }
        return render(request,'admin/addFirtu.html',AddPosts)

class Proses_addFirtu(View):
    def post(self,request):
        formAddFirtu = FirtuFrom_add(request.POST,request.FILES)
        if formAddFirtu.is_valid():
            upload = request.FILES.get('firtu_img')

            a = formAddFirtu.save(commit=False)
            a.user_id = Masteruser.objects.get(user_id = 1)
            dbx_ = dropbox_()
            c_upload = upload_file()
            check_filename = Postsfirmantuhan.objects.filter(firtu_img = upload.name).exists()
            if check_filename:
                name_file = str(random.randint(0, 10000))+'_'+upload.name
            else:
                name_file = upload.name
            l_name, s_name = c_upload.handle_uploaded_file(upload, name_file)
            
            with open(l_name, 'rb') as f:
                data_ = f.read()
            upload_stat = dbx_.upload(data_,filename=name_file)
            
            if upload_stat:
                os.remove(l_name)
                a.firtu_img = s_name
                formAddFirtu.save()
            return redirect('cemarapapua_admin:firtu')
        return redirect('cemarapapua_admin:firtu')
# delete firman tuhan
class Deletefirtu(View):
    def get(self, request, pk):
        try:
            qryUpdatefirtu = Postsfirmantuhan.objects.get(firtu_id=pk)
            qryUpdatefirtu.firtu_status = 'N'
            qryUpdatefirtu.save()

        except Postsfirmantuhan.DoesNotExist:
            return redirect('cemarapapua_admin:firtu')
        return redirect('cemarapapua_admin:firtu')
# Detail Firman Tuhan
class DetailFirmanTuhan(View):
    def get(self, request, pk):
        mDetailFirtu = Postsfirmantuhan.objects.filter(firtu_id = pk)
        dataFirtu = {
            "ViewDetailFirtu" : mDetailFirtu,
            
        }
        return render(request,'admin/detail_firtu.html',dataFirtu)

class PostsOpini(View):
    def get(self, request):
        mDataopini = Postsberita.objects.filter(category_id=14).order_by('posts_id')
        
        
        dataVkGereja = {
                    "Viewdataopini" : mDataopini,
                    
                }
        return render(request,'admin/listopini.html',dataVkGereja)


class Album(View):
     def get(self, request):
        form       = FormAdd_album()
        mDataAlbum = AlbumPosts.objects.all()
        data_album = {
                "Viewalbum" : mDataAlbum,
                "form"      : form
            }
        return render(request,'admin/album.html',data_album)
# tambah form album
class FormAdd_album(forms.ModelForm):
    class Meta:
        model  = AlbumPosts
        fields = ['album_name']
    album_name = forms.CharField(label='Nama Album', widget=forms.TextInput(attrs={'class':"form-control"}))
# proses simpan album
class prosesAddAlbum(View):
    def post(self,request):
        formAddAlbum = FormAdd_album(request.POST)
        if formAddAlbum.is_valid():
            formAddAlbum.save()
            return redirect('cemarapapua_admin:album')
        return redirect('cemarapapua_admin:addalbum')
        
# Proses Delete Album
class DeleteAlbum(View):
    def get(self, request, albumid):
        try:
            queryUpdateAlbum = AlbumPosts.objects.get(album_id=albumid)
            queryUpdateAlbum.album_status = 'N'
            queryUpdateAlbum.save()
        except AlbumPosts.DoesNotExist:
            return redirect('cemarapapua_admin:album')
        return redirect('cemarapapua_admin:album')
# Form update album
class FormUpdate_album(forms.ModelForm):
    class Meta:
        model  = AlbumPosts
        fields = ['album_name']
    album_name = forms.CharField(label='Album Name', widget=forms.TextInput(attrs={'class':'form-control'}))
# proses update album
class ProsesUpdateAlbum(View):
    def post(self, request, albumid):
        formsupdateAlbum = FormUpdate_album(request.POST)
        if formsupdateAlbum.is_valid():
            album_data = AlbumPosts.objects.get(album_id= albumid)
            album_data.album_name = formsupdateAlbum.cleaned_data.get('album_name')
            album_data.album_status='Y'
            album_data.save()        
        return redirect('cemarapapua_admin:album')
# view data gallery
class viewgallery(View):
    def get(self, request):
        mDataGallery = Gallery.objects.all()
        data_gallery = {
            "viewGallery": mDataGallery,
        }
        return render(request,'admin/gallery.html',data_gallery)   

# delete gallery data
class DeleteGallery(View):
    def get(self, request, galleryID):
        try:
            qryUpdateGallery = Gallery.objects.get(gallery_id = galleryID)
            qryUpdateGallery.gallery_log = 'N'
            qryUpdateGallery.save()
        except Gallery.DoesNotExist:
            return redirect('cemarapapua_admin:gallery')
        return redirect('cemarapapua_admin:gallery')
# insert data gallery
class AddGallery_From(forms.ModelForm):
    class Meta:
       model  = Gallery
       fields = ['gallery_name','gallery_img','gallery_status','gallery_link','album_id']
    gallery_status = [
            ('F', 'Foto'),
            ('V', 'Video'),
        ]
    gallery_name    = forms.CharField(label='firtu_title', widget=forms.TextInput(attrs={'class': "form-control"}))
    gallery_img     = forms.FileField()
    gallery_status  = forms.ChoiceField(widget=forms.Select(attrs={'class':'form-control'}), choices=gallery_status)
    gallery_link    = forms.CharField(label='firtu_title', widget=forms.TextInput(attrs={'class': "form-control"}))
    album_id        = forms.ModelChoiceField(queryset=AlbumPosts.objects.all(),empty_label='Pilih Album',widget=forms.Select(attrs={'class':'form-control'}))
#form tambah gallery
class AddPosts_gallery(View):
    def get(self, request):
        form = AddGallery_From()
        viewAdd_gallery = {
            "form":form
        }  
        return render(request,'admin/addGallery.html',viewAdd_gallery)   
# Proses simpan gallery
class Proses_addGallery(View):
    def post(self,request):
        formAddgaleri = AddGallery_From(request.POST,request.FILES)
        if formAddgaleri.is_valid():
            upload = request.FILES.get('gallery_img')

            a = formAddgaleri.save(commit=False)
            a.user_id = Masteruser.objects.get(user_id = 1)
            dbx_ = dropbox_()
            c_upload = upload_file()
            check_filename = Gallery.objects.filter(gallery_img = upload.name).exists()
            if check_filename:
                name_file = str(random.randint(0, 10000))+'_'+upload.name
            else:
                name_file = upload.name
            l_name, s_name = c_upload.handle_uploaded_file(upload, name_file)
            
            with open(l_name, 'rb') as f:
                data_ = f.read()
            upload_stat = dbx_.upload(data_,filename=name_file)
            
            if upload_stat:
                os.remove(l_name)
                a.firtu_img = s_name
                formAddgaleri.save()
            return redirect('cemarapapua_admin:gallery')
        return redirect('cemarapapua_admin:gallery')
# view komentar pengunjung

class ViewCommentarVisitor(View):
    def get(self, request):
        data_comment = CommetarPengunjung.objects.all()
        view_com = {
            "V_comVisitor" : data_comment ,
            

        }
        return render(request, 'admin/commentar_pengunjung.html', view_com)

# hapus komentar
class BalasComentar(View):
    def get(self, request, pk):
        try:
            qryUpdateCom = CommetarPengunjung.objects.get(commentar_id = pk)
            qryUpdateCom.com_status = 'N'
            qryUpdateCom.save()
        except CommetarPengunjung.DoesNotExist:
            return redirect('cemarapapua_admin:komentarpengujung')
        return redirect('cemarapapua_admin:komentarpengujung')
# login admin
class Login(View):
    @my_login_checking
    def get(self, request):
        formLogin = UserForm_login(request.POST)
        loginUser = "Sign in to continue to Creator."
        dataLogin = { 
                        "Vlogin" : loginUser ,
                        'form'   : formLogin
                    }
        return render(request,'admin/login.html',dataLogin)

    def post(self, request):
        form = UserForm_login(request.POST)

        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')

            try:
                data_user_client = Masteruser.objects.filter(username = username).count()
                if data_user_client == 1:
                    d_p = Security(password)
                    data_u = Masteruser.objects.get(username = username)
                    if d_p.pwd_macthing(data_u.password):

                        request.session['next_admin'] = 'jangansaru'
                        request.session[SESI_ADMIN] = data_u.username

                        request.session['uname_admin'] = data_u.username
                        request.session['fullname_admin'] = data_u.full_name
                        request.session['status_admin'] = data_u.user_status
                        request.session['level_admin'] = data_u.level_user
                        request.session['uid_client'] = data_u.user_id
                        
                        messages.success(request, 'Selamat Datang, {}'.format(data_u.full_name.upper()))
                        return redirect('cemarapapua_admin:home')
                    else:
                        messages.error(request, 'Password Salah !.')
                        return redirect('cemarapapua_admin:login')
                else:
                    messages.error(request, 'User Tidak Ditemukan.')
                    return redirect('cemarapapua_admin:login')
            except Exception as e:
                print('Error Login,',e)
                messages.warning(request, 'Isi Form Dengan Benar !')
        else:
            messages.warning(request, 'Mohon Isi Form Dengan Benar !')

        return redirect('cemarapapua_admin:login')




class UserForm_login(forms.ModelForm):
    class Meta:
        model = Masteruser
        fields = ['username','password']
    username = forms.CharField(label='subject', widget=forms.TextInput(attrs={'class': "form-control"}))
    password = forms.CharField(label='subject', widget=forms.PasswordInput(attrs={'class': "form-control"}))

class Logout(View):
    def get(self, request):
        request.session.flush()
        messages.success(request, 'Anda Berhasil Logout. Sampai Jumpa Lagi...')
        return redirect('cemarapapua_admin:login')

            






    

