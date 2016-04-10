"""s11bbs URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from web import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.index,name='index'),
    url(r'^article_list/(\d+)/$', views.article_list, name='article_list'),
    url(r'^logout/', views.user_logout, name='logout'),
    url(r'^login/', views.user_login, name='login'),
    url(r'^register/', views.user_register, name='register'),
    url(r'^send_post/', views.send_post, name='send_post'),
    url(r'^aritcle/(\d+)/$', views.article, name='aritcle_view'),
    url(r'^comment/$', views.comment,)
]
