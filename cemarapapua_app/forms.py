from django import forms
from .models import Masteruser
from .models import Mastercategory


class UserForm(forms.ModelForm):
    class Meta:
        model = Masteruser
        fields = ['username','password','full_name','level_user']

class CategoryForm(forms.ModelForm):
    class Meta:
        model = Mastercategory
        fields = ['category_id','categorys','category_status']
  

