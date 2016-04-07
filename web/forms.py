#!/usr/bin/env python
#-*- coding:utf-8 -*-
from django import forms
class AritcleForms(forms.Form):
    article_title = forms.CharField(max_length=255,min_length=5)
    article_summery = forms.CharField(max_length=255,min_length=5)
    article_headimg = forms.ImageField()
    article_category_id = forms.IntegerField()
    article_content = forms.CharField(max_length=255,min_length=10)
