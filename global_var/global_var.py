from os import stat
from django.core import exceptions
from django.db.models import Case, When, F, Value, BooleanField
from cemarapapua_app.models import Mastermenu
import bcrypt,dropbox, os
from cemarapapua.settings import SESI_ADMIN
from functools import wraps
from django.shortcuts import redirect
from cemarapapua.settings import MEDIA_ROOT
from django.core.files.storage import FileSystemStorage

def global_var(request):
    datamenuHome = Mastermenu.objects.filter(level='F', status = 'aktif').order_by('menu_id')
    datamenuAdmin = Mastermenu.objects.filter(level='A', status = 'aktif').annotate(
                is_submenu = Case(
                                        When(menu_id__in = Mastermenu.objects.exclude(parent_id = 0).values('parent_id'), then=Value(True)),
                                        default=False,
                                        output_field=BooleanField(),
                                    )
    ).order_by('menu_id')
    data = {
        'menuheader': datamenuHome,
        'menuAdmin' : datamenuAdmin,
    }
    return data

class Security:
    def __init__(self, string):
        self.pwd = string

    def encrypt_pwd(self):
        self.hashed = bcrypt.hashpw(self.pwd.encode('utf-8'), bcrypt.gensalt())
        self.hashed = self.hashed.decode('utf-8')

    def pwd_macthing(self, pwd_db):
        return bcrypt.checkpw(self.pwd.encode('utf-8'), pwd_db.encode('utf-8'))

def my_login_required(function):
    @wraps(function)
    def wrapper(self, request, *args, **kw):
        if not self.request.session.get(SESI_ADMIN):
            return redirect('cemarapapua_admin:login')
        else:
            return function(self, request, *args, **kw)
    return wrapper

def my_login_checking(function):
    @wraps(function)
    def wrapper(self, request, *args, **kw):
        if not self.request.session.get(SESI_ADMIN):
            return function(self, request, *args, **kw)
        else:
            return redirect('cemarapapua_admin:home')
    return wrapper

class dropbox_:
    def __init__(self):
        self.dbx = dropbox.Dropbox('fNYJnMeO5CQAAAAAAAAAAfaZc_MmCONfdNAFUY8zVqndxZG68dqrQYrKeQsPM3HH')
    
    def cekakun(self):
        return self.dbx.users_get_current_account()

    def upload(self,files,path='/cemarapapua_assets/',filename=''):
        status = False
        try:
            self.dbx.files_upload(files, path+filename)
            status = True
        except Exception as e:
            status = False
            print('Error Upload Dropbox', e)
        return status
class upload_file:
    def handle_uploaded_file(self, file_ ,filename=''):
        fss = FileSystemStorage(location = MEDIA_ROOT)
        file = fss.save(filename.replace(' ',''), file_)
        file_url = fss.url(file)
        return os.path.join(MEDIA_ROOT, file_url), file_url