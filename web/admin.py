from django.contrib import admin
import models
# Register your models here.
admin.site.register(models.Article)
admin.site.register(models.Comment)
admin.site.register(models.ThumbUP)
admin.site.register(models.UserGroup)
admin.site.register(models.UserProfile)
admin.site.register(models.Category)