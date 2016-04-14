#-*- coding:utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
class ChatGroup(models.Model):
    name = models.CharField(max_length=30)
    descride = models.CharField(max_length=100,null=True,blank=True)
    def __unicode__(self):
        return "group%s descride:%s" % (self.name ,self.descride)
