from django import template
from global_var.global_var import dropbox_
# custume tags digunakan untuk di tags template
register = template.Library()
# pattren data link dari dropbox
def generate_thumbnail(path):
    viewImagedbx = dropbox_()
    urlnya = viewImagedbx.get_createshared_link('/cemarapapua_assets/{}'.format(path))
    return urlnya
# untuk mengenerete pattern link
register.filter('generate_thumbnail', generate_thumbnail)