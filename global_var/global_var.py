from django.db.models import Case, When, F, Value, BooleanField
from cemarapapua_frontend.models import Mastermenu
import bcrypt

def global_var(request):
    datamenuHome = Mastermenu.objects.filter(level='F', status = 'aktif').order_by('menu_id')
    datamenuAdmin = Mastermenu.objects.filter(level='A').annotate(
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



