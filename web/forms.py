#!/usr/bin/env python
#-*- coding:utf-8 -*-
from django import forms
import os
class AritcleForms(forms.Form):
    title = forms.CharField(max_length=255,min_length=5)
    summery = forms.CharField(max_length=255,min_length=5)
    head_img = forms.ImageField()
    category_id = forms.IntegerField()
    content = forms.CharField(min_length=10)
    priority = forms.IntegerField()
    hidden = forms.CharField()
class UserRegister(forms.Form):
    username = forms.CharField(max_length=16)
    password = forms.PasswordInput()
    email = forms.EmailField()
def file_upload(request,file):
    base_dir = 'statics/imgs'
    user_dir = '%s/%s'%(base_dir,request.user.userprofile.id)
    file_name = '%s/%s'%(user_dir,file.name)
    if not os.path.exists(user_dir):
        os.mkdir(user_dir)
    with open(file_name,'wb+') as f:
        for line in file.chunks():
            f.write(line)
    return  '/static/imgs/%s/%s'%(request.user.userprofile.id,file.name)