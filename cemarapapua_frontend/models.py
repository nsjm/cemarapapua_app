import builtins
from django.core.exceptions import EmptyResultSet
from django.db import models
from django.db.models.base import Model
from django.db.models.expressions import F
from django.db.models import Q
import pprint

from django.db.models.fields.related import ForeignKey

# Create your models here.
class Mastermenu(models.Model):
    menu_id     = models.IntegerField(null=False,primary_key=True)
    menu        = models.TextField(null=False,blank=False)
    parent_id   = models.IntegerField(null=False, blank=False)
    status      = models.TextField(null=False,blank=False)
    level       = models.CharField(max_length=1,null=False,blank= False, default='A')
    url         = models.TextField(null=False,blank=False)
    icon         = models.TextField(null=False,blank=False)

    class Meta:
        managed = False
        db_table = 'master\".\"mastermenu'
        
class Masteruser(models.Model):
    user_id     = models.IntegerField(null=False,primary_key=True)
    username    = models.TextField(null=False,blank=False)
    password    = models.TextField(null=False,blank=False)
    full_name    = models.TextField(null=False,blank=False)
    level_user  = models.CharField(max_length=20,blank=False,null=False, default='admin')
    user_status = models.CharField(max_length=1,null=False,blank= False, default='Y')
    class Meta:
        managed = False
        db_table = 'master\".\"masteruser'


class Mastercategory(models.Model):
    category_id = models.IntegerField(null=False,primary_key=True)
    categorys    = models.TextField(null=False,blank=False)
    category_status = models.CharField(max_length=1,null=False,blank= False, default='Y')

    class Meta:
        managed = False
        db_table = 'master\".\"mastercategory'

class Album(models.Model):
    album_id = models.IntegerField(null=False,primary_key=True)
    album_name    = models.TextField(null=False,blank=False)
    album_status = models.CharField(max_length=1,null=False,blank= False, default='Y')

    class Meta:
        managed = False
        db_table = 'public\".\"album'

class Gallery(models.Model):
    gallery_id      = models.IntegerField(null=False,primary_key=True)
    gallery_name    = models.TextField(null=False,blank=False)
    gallery_img     = models.TextField(null=False,blank=False)
    gallery_date    = models.DateField()
    user_id         = models.ForeignKey(Masteruser, on_delete=models.CASCADE, db_column='user_id')
    gallery_status  = models.CharField(max_length=20,blank=False, default='link')
    gallery_link    = models.TextField(null=False,blank=False)
    album_id        = models.ForeignKey(Album, on_delete=models.CASCADE, db_column='album_id')
    gallery_log = models.CharField(max_length=1,null=False,blank= False, default='Y')

    class Meta:
        managed = False
        db_table = 'public\".\"gallery'

class Firtu(models.Model):
    firtu_id        = models.IntegerField(null=False,primary_key=True)
    firtu_title     = models.TextField(null=False,blank=False)
    firtu_date      = models.DateField()
    firtu_desc      = models.TextField(null=False,blank=False)
    firtu_img       = models.TextField(null=False,blank=False)
    firtu_status = models.CharField(max_length=1,null=False,blank= False, default='Y')

    class Meta:
        managed = False
        db_table = 'public\".\"firtu'

class Postsberitaslider(models.Model):
    posts_id        = models.IntegerField(null=False,primary_key=True)
    posts_date      = models.DateField()
    user_id         = models.ForeignKey(Masteruser, on_delete=models.CASCADE, db_column='user_id')
    posts_title     = models.TextField(null=False,blank=False)
    posts_desc      = models.TextField(null=False,blank=False)
    posts_img       = models.TextField(null=False,blank=False)
    category_id     = models.ForeignKey(Mastercategory,on_delete=models.CASCADE,db_column='category_id')
    posts_status    = models.CharField(max_length=20,blank=False,null=False, default='publish')
    posts_page_view = models.IntegerField(null=False,blank=False)
    posts_keyword   = models.TextField(null=False,blank=False)

    class Meta :
        managed = False
        db_table = 'public\".\"posts'


              