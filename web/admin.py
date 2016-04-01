from django.contrib import admin
import models
# Register your models here.
class article_display(admin.ModelAdmin):
    list_display = ('id','title','head_img','content','author_id')
admin.site.register(models.Article,article_display)
admin.site.register(models.Comment)
admin.site.register(models.ThumbUP)
admin.site.register(models.UserGroup)
admin.site.register(models.UserProfile)
admin.site.register(models.Category)