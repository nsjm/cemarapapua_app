from django.http import response
from django.shortcuts import render
from typing import ValuesView
from django.http import request
from django.http.response import HttpResponse
from django.views import View
from cemarapapua_app.models import *
from django.db.models import Max
from django.db.models import Count
import requests
import pprint


# Create your views here.
# class index/home
class Cemarapapua_front_index(View):
    def get(self, request):
        godataCovid = [
            {
                "dirawat"   :0,
                "meninggal" :0,
                "positif"   :0,
                "sembuh"    :0,
                "is_error"    :True
            }
        ]
        datamenuHome            = Mastermenu.objects.filter(level='F', status = 'aktif').order_by('menu_id')
        # dataCovid               = requests.get('https://api.kawalcorona.com/indonesia')
        # try:
        #     godataCovid             = dataCovid.json()
        # except Exception as e:
        #     pass
        databeritaSlider            = Postsberita.objects.all().order_by('-posts_date')[:5]
        databeritaSlidertopone      = Postsberita.objects.all().order_by('-posts_date','-posts_page_view')[:2]
        databeritaUtama             = Postsberita.objects.filter(category_id=11)
        databeritaPercategory       = Postsberita.objects.all().order_by('posts_id').reverse() 
        dataGallery                 = Gallery.objects.all()
        dataMastercategry           = Mastercategory.objects.all().order_by('category_id')[:5]
        # dataBeritaterbaru           = Postsberita.objects.all().order_by('posts_id').reverse()[:5]
        databeritaTerpopuler        = Postsberita.objects.all().order_by('-posts_page_view')[:5]
        databeritaTerpopulerOne     = Postsberita.objects.all().order_by('-posts_page_view')[:1]
        datafituHome                = Postsfirmantuhan.objects.all().order_by('-firtu_id')[:5]
        dataGerejaHome              = Postsberita.objects.filter(category_id=2)[:5]
        dataOpiniHome               = Postsberita.objects.filter(category_id=14)[:5]
       

        dataMenu = {
            "menuheader"                : datamenuHome,
            "copedshow"                 : godataCovid,
            "beritaSlider"              : databeritaSlider,
            "beritaUtama"               : databeritaUtama,
            "galleryHome"               : dataGallery,
            "dataBeritaPerkategory"     : databeritaPercategory,
            "dataKategoryBerita"        : dataMastercategry,
            # "dataTerbaru"               : dataBeritaterbaru,
            "dataBeritaSliderTopone"    : databeritaSlidertopone,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "dataterpopulerTop"         : databeritaTerpopulerOne,
            "firtuHomeView"             : datafituHome,
            "dataGerjaView"             : dataGerejaHome,
            "dataOpiniView"             : dataOpiniHome,
        }

        
        return render(request, 'frontend/content.html',dataMenu)

class Contact(View):
    def get(self, request):
        return render(request,'frontend/contact.html')

class Kegiatan_gereja(View):
    def get(self, request):

        dataKegiatan_gereja    = Postsberita.objects.filter(category_id = 2).order_by('-posts_id')[:10]
        dataKategoriBerita     = Mastercategory.objects.order_by('category_id')
        dataGroupByKategori    = Mastercategory.objects.all().annotate(
                    count_post = Count('categorys', filter=Q(postsberita__category_id = F('category_id'))))
        databeritaTerpopuler   = Postsberita.objects.filter(category_id = 2).order_by('-posts_page_view')[:5]
        datafituHome           = Postsfirmantuhan.objects.all().order_by('-firtu_id')[:5]
        databeritaterkait      = Postsberita.objects.filter(category_id=2)
        
        dataGereja = {
            "dataMenuGerejaView"        :  dataKegiatan_gereja,  
            "dataKategori"              :  dataKategoriBerita,
            "dataJumlahKategori"        :  dataGroupByKategori,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "firtuGerejaView"           : datafituHome,
            "beritaTerkait"             : databeritaterkait,
        }

        return render(request,'frontend/kegiatan_gereja.html',dataGereja)

class Firmantuhan(View):
    def get(self, request):
        datafituview                = Postsfirmantuhan.objects.all().order_by('-firtu_id')[:10]
        dataGroupByKategori         = Mastercategory.objects.all().annotate(
                count_post          = Count('categorys', filter=Q(postsberita__category_id = F('category_id'))))
        databeritaTerpopuler        = Postsberita.objects.filter(category_id = 2).order_by('-posts_page_view')[:5]
        databeritaterkait           = Postsberita.objects.filter(category_id=2)

        dataFirtu = {
            "dataFirtuView"             : datafituview,
            "dataJumlahKategori"        :  dataGroupByKategori,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "beritaTerkait"             : databeritaterkait,
        }


        return render(request,'frontend/firtu.html',dataFirtu)

class Opini(View):
    def get(self, request):
        dataOpini               = Postsberita.objects.filter(category_id=14).order_by('-posts_id')[:10]
        dataGroupByKategori     = Mastercategory.objects.all().annotate(
                count_post      = Count('categorys', filter=Q(postsberita__category_id = F('category_id'))))
        databeritaTerpopuler    = Postsberita.objects.all().order_by('-posts_page_view')[:5]
        databeritaterkait       = Postsberita.objects.filter(category_id=14)
        datafituview            = Postsfirmantuhan.objects.all().order_by('-firtu_id')[:5]

        dataOpiniView = {
            "opiniView" : dataOpini,
            "dataJumlahKategori"        :  dataGroupByKategori,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "beritaTerkait"             : databeritaterkait,
             "dataFirtuView"             : datafituview,
        }

        return render(request,'frontend/opini.html',dataOpiniView)

class Foto(View):
    def get(self, request):
        dataFoto                = Gallery.objects.all().filter(gallery_status='foto').order_by('-gallery_id')
        dataGroupByKategori     = Mastercategory.objects.all().annotate(
                count_post      = Count('categorys', filter=Q(postsberita__category_id = F('category_id'))))
        databeritaTerpopuler    = Postsberita.objects.all().order_by('-posts_page_view')[:5]
        databeritaterkait       = Postsberita.objects.order_by('-posts_id')[:5]

        dataFotoView = {
            "FotoView"                  : dataFoto,
            "dataJumlahKategori"        :  dataGroupByKategori,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "beritaTerkait"             : databeritaterkait,
        }

        return render(request,'frontend/foto.html',dataFotoView)
class Video(View):
    def get(self, request):
        dataFoto                = Gallery.objects.all().filter(gallery_status='video').order_by('-gallery_id')
        dataGroupByKategori     = Mastercategory.objects.all().annotate(
                count_post      = Count('categorys', filter=Q(postsberita__category_id = F('category_id'))))
        databeritaTerpopuler    = Postsberita.objects.all().order_by('-posts_page_view')[:5]
        databeritaterkait       = Postsberita.objects.order_by('-posts_id')[:5]

        dataFotoView = {
            "FotoView"                  : dataFoto,
            "dataJumlahKategori"        :  dataGroupByKategori,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "beritaTerkait"             : databeritaterkait,
        }

        return render(request,'frontend/video.html',dataFotoView)

class Pemerintah(View):
    def get(self, request):
        dataBeritaPemerintah    = Postsberita.objects.filter(category_id = 11).order_by('-posts_id')[:5]
        dataGroupByKategori     = Mastercategory.objects.all().annotate(
                count_post      = Count('categorys', filter=Q(postsberita__category_id = F('category_id'))))
        databeritaTerpopuler    = Postsberita.objects.all().order_by('-posts_page_view')[:5]
        databeritaterkait       = Postsberita.objects.order_by('-posts_id')[:5]
        datafituview            = Postsfirmantuhan.objects.all().order_by('-firtu_id')[:5]

        dataViewberitapemerintah = {
           "dataVberitaPemerintah"      : dataBeritaPemerintah,
           "dataJumlahKategori"         :  dataGroupByKategori,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "beritaTerkait"             : databeritaterkait, 
            "dataFirtuView"             : datafituview,
        }

        return render(request,'frontend/pemerintah.html', dataViewberitapemerintah)

class Hukumpolitik(View):
    def get(self, request):
        dataBeritahukumpolitik  = Postsberita.objects.filter(category_id = 12).order_by('-posts_id')[:5]
        dataGroupByKategori     = Mastercategory.objects.all().annotate(
                count_post      = Count('categorys', filter=Q(postsberita__category_id = F('category_id'))))
        databeritaTerpopuler    = Postsberita.objects.all().order_by('-posts_page_view')[:5]
        databeritaterkait       = Postsberita.objects.order_by('-posts_id')[:5]
        datafituview            = Postsfirmantuhan.objects.all().order_by('-firtu_id')[:5]

        dataViewberitahukumpolitik = {
           "dataVberitahukumpolitik"    : dataBeritahukumpolitik,
           "dataJumlahKategori"         :  dataGroupByKategori,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "beritaTerkait"             : databeritaterkait, 
            "dataFirtuView"             : datafituview,
        }

        return render(request,'frontend/hukumpolitik.html', dataViewberitahukumpolitik)

class SosialBudaya(View):
    def get(self, request):
        dataBeritaSosialBudaya  = Postsberita.objects.filter(category_id = 13).order_by('-posts_id')[:5]
        dataGroupByKategori     = Mastercategory.objects.all().annotate(
                count_post      = Count('categorys', filter=Q(postsberita__category_id = F('category_id'))))
        databeritaTerpopuler    = Postsberita.objects.all().order_by('-posts_page_view')[:5]
        databeritaterkait       = Postsberita.objects.order_by('-posts_id')[:5]
        datafituview            = Postsfirmantuhan.objects.all().order_by('-firtu_id')[:5]

        dataViewberitaSosialBudaya = {
           "dataVberitaSosialBudaya"    : dataBeritaSosialBudaya,
           "dataJumlahKategori"         :  dataGroupByKategori,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "beritaTerkait"             : databeritaterkait, 
            "dataFirtuView"             : datafituview,
        }

        return render(request,'frontend/sosialbudaya.html', dataViewberitaSosialBudaya)

class Pendidikan(View):
    def get(self, request):
        dataBeritapendidikan    = Postsberita.objects.filter(category_id = 4).order_by('-posts_id')[:5]
        dataGroupByKategori     = Mastercategory.objects.all().annotate(
                count_post      = Count('categorys', filter=Q(postsberita__category_id = F('category_id'))))
        databeritaTerpopuler    = Postsberita.objects.all().order_by('-posts_page_view')[:5]
        databeritaterkait       = Postsberita.objects.order_by('-posts_id')[:5]
        datafituview                = Postsfirmantuhan.objects.all().order_by('-firtu_id')[:5]

        dataViewberitapendidikan = {
           "dataVberitapendidikan"      : dataBeritapendidikan,
           "dataJumlahKategori"         :  dataGroupByKategori,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "beritaTerkait"             : databeritaterkait, 
            "dataFirtuView"             : datafituview,
        }

        return render(request,'frontend/pendidikan.html', dataViewberitapendidikan)

class Ekonomi(View):
    def get(self, request):
        dataBeritaekonomi       = Postsberita.objects.filter(category_id = 5).order_by('-posts_id')[:5]
        dataGroupByKategori     = Mastercategory.objects.all().annotate(
                count_post      = Count('categorys', filter=Q(postsberita__category_id = F('category_id'))))
        databeritaTerpopuler    = Postsberita.objects.all().order_by('-posts_page_view')[:5]
        databeritaterkait       = Postsberita.objects.order_by('-posts_id')[:5]
        datafituview            = Postsfirmantuhan.objects.all().order_by('-firtu_id')[:5]

        dataViewberitaekonomi = {
           "dataVberitaekonomi"         : dataBeritaekonomi,
           "dataJumlahKategori"         :  dataGroupByKategori,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "beritaTerkait"             : databeritaterkait, 
            "dataFirtuView"             : datafituview,
        }

        return render(request,'frontend/ekonomi.html', dataViewberitaekonomi)

class Kesehatan(View):
    def get(self, request):
        dataBeritakesehatan     = Postsberita.objects.filter(category_id = 6).order_by('-posts_id')[:5]
        dataGroupByKategori     = Mastercategory.objects.all().annotate(
                count_post      = Count('categorys', filter=Q(postsberita__category_id = F('category_id'))))
        databeritaTerpopuler    = Postsberita.objects.all().order_by('-posts_page_view')[:5]
        databeritaterkait       = Postsberita.objects.order_by('-posts_id')[:5]
        datafituview            = Postsfirmantuhan.objects.all().order_by('-firtu_id')[:5]

        dataViewberitakesehatan = {
           "dataVberitakesehatan"       : dataBeritakesehatan,
           "dataJumlahKategori"         : dataGroupByKategori,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "beritaTerkait"             : databeritaterkait, 
            "dataFirtuView"             : datafituview,
        }

        return render(request,'frontend/kesehatan.html', dataViewberitakesehatan)
class Detail_post(View):
    def get(self, request, pk):
        mDetailPosts = Postsberita.objects.filter(posts_id = pk)
        dataGroupByKategori     = Mastercategory.objects.all().annotate(
                count_post      = Count('categorys', filter=Q(postsberita__category_id = F('category_id'))))
        databeritaTerpopuler    = Postsberita.objects.all().order_by('-posts_page_view')[:5]
        databeritaterkait       = Postsberita.objects.order_by('-posts_id')[:5]
        datafituview            = Postsfirmantuhan.objects.all().order_by('-firtu_id')[:5]
        dataPostsNews = {
            "ViewDetailPostNews" : mDetailPosts,
            "dataJumlahKategori"         :  dataGroupByKategori,
            "databeritaTerpopulerView"  : databeritaTerpopuler,
            "beritaTerkait"             : databeritaterkait, 
            "dataFirtuView"             : datafituview,
            
        }
        return render(request,'frontend/detail_posts.html',dataPostsNews)
