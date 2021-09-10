from django.db.models import Case, When, F, Value, BooleanField
from cemarapapua_frontend.models import Mastermenu
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




