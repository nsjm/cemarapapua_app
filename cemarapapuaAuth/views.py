
from typing import ValuesView
from django.http import request
from django.http.response import HttpResponse
from django.shortcuts import render
from django.views import View
# Create your views here.
class Login(View):
   def get(self, request):
       loginText = "Sign in to continue to Cemarapapua."
       redirect_authenticated_user = True
       dataTextLogin = {
           "textLogin"      :   loginText,
           "redirectLogin"  :   redirect_authenticated_user
       } 
       
       return render(request,'auth/indexs.html',dataTextLogin)

class CekAuth(View):
    def get(self, request):
        ceklogin = "Username & password"

        dataCeklogin = {
            "cek" : ceklogin
        }
        return render(request,'admin/indedx.html',dataCeklogin)
