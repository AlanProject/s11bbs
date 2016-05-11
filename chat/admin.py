from django.contrib import admin
import models
# Register your models here.
class chatgroup_display(admin.ModelAdmin):
    list_display = ('id','name','descride')
admin.site.register(models.ChatGroup,chatgroup_display)
