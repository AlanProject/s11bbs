#-*- coding:utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
# Create your models here.

# 帖子

class Article(models.Model):

    title = models.CharField(u"文章标题", max_length=255, unique=True)
    categroy = models.ForeignKey("Category", verbose_name=u"板块")
    head_img = models.ImageField(upload_to="uploads")
    content = models.TextField(u"内容")
    author = models.ForeignKey("UserProfile")
    publish_date = models.TimeField(auto_now=True)
    hidden = models.BooleanField(default=False)
    priority = models.IntegerField(u"优先级", default=1000)

    def __unicode__(self):
        return "%s author:%s" % (self.title ,self.author)

# 评论
class Comment(models.Model):
    article = models.ForeignKey("Article")
    user = models.ForeignKey('UserProfile')
    parent_comment = models.ForeignKey('self',related_name='p_comment', blank=True, null=True)
    comment = models.TextField(max_length=1000)
    date = models.TimeField(auto_now=True)

    def __unicode__(self):
        return "%s user:%s" % (self.comment, self.user)


# 点赞
class ThumbUP(models.Model):
    article = models.ForeignKey('Article')
    user = models.ForeignKey('UserProfile')
    date = models.TimeField(auto_now=True)

    def __unicode__(self):
        return "user:%s" % self.user

# 板块
class Category(models.Model):
    name = models.CharField(max_length=64, unique=True)
    admin = models.ManyToManyField("UserProfile")

    def __unicode__(self):
        return self.name

# 用户
class UserProfile(models.Model):
    user = models.OneToOneField(User)
    name = models.CharField(max_length=32)
    groups = models.ManyToManyField("UserGroup")

    def __unicode__(self):
        return self.name

# 用户组
class UserGroup(models.Model):
    name = models.CharField(max_length=64,unique=True)

    def __unicode__(self):
        return self.name