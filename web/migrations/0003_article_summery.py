# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-04-07 07:41
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0002_auto_20160330_1617'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='summery',
            field=models.CharField(default='defatulessd alan', max_length=25),
            preserve_default=False,
        ),
    ]
