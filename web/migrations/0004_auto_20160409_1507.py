# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-04-09 07:07
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0003_article_summery'),
    ]

    operations = [
        migrations.RenameField(
            model_name='article',
            old_name='categroy',
            new_name='category',
        ),
    ]