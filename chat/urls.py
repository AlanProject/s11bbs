#!/usr/bin/env python
#-*- coding:utf-8 -*-

from django.conf.urls import url
from django.contrib import admin
from chat import views

urlpatterns = [
    url(r'^$', views.hot_chat, name='hot_chat'),
    url(r'^contact_select/$', views.contact_select, name='contact_select'),
    url(r'^message_upload/$', views.message_upload, name='message_upload'),
]