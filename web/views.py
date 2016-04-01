from django.shortcuts import render
from django.core.exceptions import ObjectDoesNotExist
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
    pass
def user_logout(request):
    pass