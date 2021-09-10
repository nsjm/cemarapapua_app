from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from django.contrib import messages
from django.db import connection
from django.test import TestCase, override_settings
from django.contrib.auth.models import User

from cemarapapua.settings import SESI_ADMIN, ALLOWED_HOSTS, STATIC_URL

import datetime

def cek_user(get_response):
    def middleware(request):
        if request.path.startswith('/dashboardadmin/'):
            response = get_response(request)

            print(request.session.get('next_admin'))
            if(request.session.get('next_admin')):
                if request.get_host() in ALLOWED_HOSTS:
                    request.session['username_final_admin'] = request.session.get(SESI_ADMIN,'')
                else:
                    messages.error(request, 'Connection Blocked, Please Contact Admin')
            
            # if request.session.get('telo') == 'telo' and request.path != reverse('cemarapapua_admin:user_config') and request.path != reverse('cemarapapua_admin:login'):
            #     return HttpResponseRedirect(reverse('cemarapapua_admin:user_config')) 
            # elif not request.session.get('username_final_admin','') and request.path not in [reverse('cemarapapua_admin:login'), reverse('cemarapapua_admin:user_config'), reverse('apirest_get')]:
            if not request.session.get('username_final_admin','') and request.path not in [reverse('cemarapapua_admin:login')] and not request.path.startswith(STATIC_URL) and not request.path.startswith('/report'):
                return HttpResponseRedirect(reverse('cemarapapua_admin:login'))
            else:
                # activate if you wanna use inactive session time limit for 1 hour
                # now = datetime.datetime.now().strftime('%H:%M:%S')
                # last_activity = request.session.get('last_login_timestamp','00:00:00')

                # if(request.session.get('username_final_admin')):
                #     menus = ['/dash/','/dash/logout/']

                #     if(request.path in ['/dash/login/']):
                #         print('djancuk2')
                #         return HttpResponseRedirect(reverse('cemarapapua_admin:home'))

                # selisih = get_time(request,now,last_activity)
        
                # if selisih>=100 and request.path not in ['/dash/login/'] and not request.path.startswith(STATIC_URL) and not request.path.startswith('/report'):   
                #     request.session.flush()
                #     messages.success(request, "Sesi anda sudah habis, silahkan Login kembali.")
                #     return HttpResponseRedirect(reverse('cemarapapua_admin:login'))
                # else:
                #     request.session['last_login_timestamp'] = now        
                #     return response

                if(request.session.get('username_final_admin')):
                    menus = ['/dash/','/dash/logout/']

                    if(request.path in ['/dash/login/']):
                        return HttpResponseRedirect(reverse('cemarapapua_admin:home'))     
                return response
        else:

            response = get_response(request)
            
            return response
            # if(request.session.get('next_client')):
            #     if request.get_host() in ALLOWED_HOSTS:
            #         request.session['username_final_client'] = request.session.get(SESI,'')
            #     else:
            #         messages.error(request, 'Connection Blocked, Please Contact Admin')
            
            # # if request.session.get('telo') == 'telo' and request.path != reverse('client:user_config') and request.path != reverse('client:login'):
            # #     return HttpResponseRedirect(reverse('client:user_config')) 
            # # elif not request.session.get('username_final_client','') and request.path not in [reverse('client:login'), reverse('client:user_config'), reverse('apirest_get')]:
            # if not request.session.get('username_final_client','') and request.path not in [reverse('client:login')] and not request.path.startswith(STATIC_URL) and not request.path.startswith('/report'):
            #     return HttpResponseRedirect(reverse('client:login'))
            # else:
            #     # activate if you wanna use inactive session time limit for 1 hour
            #     # now = datetime.datetime.now().strftime('%H:%M:%S')
            #     # last_activity = request.session.get('last_login_timestamp','00:00:00')

            #     # if(request.session.get('username_final_client')):
            #     #     menus = ['/dash/','/dash/logout/']

            #     #     if(request.path in ['/dash/login/']):
            #     #         print('djancuk2')
            #     #         return HttpResponseRedirect(reverse('client:index'))

            #     # selisih = get_time(request,now,last_activity)
        
            #     # if selisih>=100 and request.path not in ['/dash/login/'] and not request.path.startswith(STATIC_URL) and not request.path.startswith('/report'):   
            #     #     request.session.flush()
            #     #     messages.success(request, "Sesi anda sudah habis, silahkan Login kembali.")
            #     #     return HttpResponseRedirect(reverse('client:login'))
            #     # else:
            #     #     request.session['last_login_timestamp'] = now        
            #     #     return response

            #     if(request.session.get('username_final_client')):
            #         menus = ['/dash/','/dash/logout/']

            #         if(request.path in ['/dash/login/']):
            #             return HttpResponseRedirect(reverse('client:index'))     
            #     return response
    return middleware
 

