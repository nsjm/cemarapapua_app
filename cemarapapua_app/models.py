from django.core.exceptions import EmptyResultSet
from django.db import models
from django.db.models.expressions import F
from django.contrib.auth.models import AbstractUser
from ckeditor.fields import RichTextField
# Create your models here.
class Setting_aplikasi(models.Model):
    setting_id                  = models.IntegerField(null=False,primary_key=True)
    setting_nohp                = models.TextField(null=False,blank=False)
    setting_addres              = models.TextField(null=False,blank=False)
    setting_about_title         = models.TextField(null=False,blank=False)
    setting_about_organisasi    = models.TextField(null=False,blank=False)
    setting_email               = models.TextField(null=False,blank=False)
    setting_desc_app            = models.TextField(null=False,blank=False)
    
    class Meta:
        managed = False
        db_table = 'master\".\"setting_aplikasi'

class Masteruser(models.Model):
    user_id  = models.AutoField(primary_key=True, null=False)
    username = models.TextField(null=False,blank=False)
    password = models.TextField(null=False,blank=False)
    full_name = models.TextField(null=False,blank=False)
    level_user = models.TextField(max_length=20,null=False,blank= False, default='superadmin')
    user_status = models.CharField(max_length=1,null=False,blank= False, default='Y')
    
    class Meta:
        managed = False
        db_table = 'master\".\"masteruser'

class Mastercategory(models.Model):
    category_id = models.AutoField(primary_key=True, null=False)
    categorys = models.TextField(null=False,blank=False)
    category_status = models.CharField(max_length=1,null=False,blank= False, default='Y')

    class Meta:
        managed = False
        db_table = 'master\".\"mastercategory'
    def __str__(self):
        return self.categorys 

class Mastermenu(models.Model):
    menu_id     = models.AutoField(primary_key=True, null=False)
    menu        = models.TextField(null=False,blank=False)
    parent_id   = models.IntegerField(null=False,blank=False)
    status      = models.CharField(max_length=5,null=False,blank= False, default='aktif')
    level       = models.CharField(max_length=1,null=False,blank= False, default='A')
    url         = models.TextField(null=False,blank=False)
    icon        = models.TextField(null=False,blank=False)
    
    class Meta:
        managed = False
        db_table = 'master\".\"mastermenu'

class Postsberita(models.Model):
    posts_id        = models.IntegerField(null=False,primary_key=True)
    posts_date      = models.DateField()
    user_id         = models.ForeignKey(Masteruser, on_delete=models.CASCADE, db_column='user_id')
    posts_title     = models.TextField(null=False,blank=False)
    posts_desc      = RichTextField()
    posts_img       = models.TextField(null=False,blank=False)
    category_id     = models.ForeignKey(Mastercategory,on_delete=models.CASCADE,db_column='category_id')
    menu_id         = models.IntegerField(null=False,blank=False)
    posts_status    = models.CharField(max_length=20,blank=False,null=False, default='publish')
    posts_page_view = models.IntegerField(null=False,blank=False)
    posts_keyword   = models.TextField(null=False,blank=False)

    class Meta :
        managed = False
        db_table = 'public\".\"posts'
  

class Postsfirmantuhan(models.Model):
    
    firtu_id        = models.IntegerField(null=False,primary_key=True)
    firtu_title     = models.TextField(null=False,blank=False)
    firtu_date      = models.DateField()
    firtu_desc      = models.TextField(null=False,blank=False)
    firtu_img       = models.TextField(null=False,blank=False)
    firtu_status    = models.CharField(max_length=1,null=False,blank= False, default='Y')

    class Meta:
        managed = False
        db_table = 'public\".\"firtu'

