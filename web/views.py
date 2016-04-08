#-*- coding:utf-8 -*-
from django.shortcuts import render,redirect,HttpResponseRedirect,HttpResponse
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth import authenticate,login,logout
from forms import AritcleForms
import models
# Create your views here.
def index(request):
    return render(request, 'index.html')

def article_list(request, articlce_id):
    try:
        contents = models.Article.objects.all()
    except ObjectDoesNotExist as e:
        render(request,'404.html')
    return render(request,'article_list.html', {'contents':contents})
def send_post(request):
    if request.method == "POST":
        forms = AritcleForms(request.POST,request.FILES)
        if forms.is_valid():
            #获取前端提交进来的值 字典格式{'name':'username'}
            froms_dic = forms.cleaned_data

            return  HttpResponse('post')
        else:
            print 'error'
    # 获取版块信息格式：[{u'id': 2L, 'name': u'hot'}, {u'id': 1L, 'name': u'notice'}] 并传递到前端
    category_tuple = models.Category.objects.all().values_list()
    return render(request,'send_post.html',{'category_tuple':category_tuple})

def user_logout(request):
    logout(request)
    return HttpResponseRedirect('/')

def user_login(request):
    #从前端form表单获取用户名和密码
    username = request.POST.get('username')
    password = request.POST.get('passwd')
    # 判断请求类型如果为POST 则进行用户验证否则跳转到当前页面
    if request.method == 'POST':
        # 对用户名密码进行验证如果验证成功则返回用户名和密码的一个对象 如果不成功则返回None
        login_status = authenticate(username=username, password=password)
        # 如果不为空说明认证成功跳转到首页
        if login_status:
            login(request, login_status)
            return redirect('/')
        # 如果为空则跳转到login并进行erro渲染
        else:
            err_dic = {'error_messages':'User Name or password error'}
            return render(request, 'login.html', err_dic)
    return render(request, 'login.html')


def user_register(request):
    return render(request, 'register.html')