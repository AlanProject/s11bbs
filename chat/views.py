from django.shortcuts import render,HttpResponse
import models
import json
# Create your views here.
def hot_chat(request):
    return render(request, 'chat/hot_chat.html')

def contact_select(request):
    if request.method == 'GET':
        types = request.GET.get('type')
        if types == 'single':
            friend_list_tmp = request.user.userprofile.friend.select_related().values('id','username')
            friend_list = []
            for item in friend_list_tmp:
                data = {'name':item['username'],'id':item['id']}
                friend_list.append(data)
            data = {'contact_list':list(friend_list)}
            return HttpResponse(json.dumps(data))
        elif types == 'group':
            group_list = request.user.userprofile.chatgroup.select_related().values('id','name')
            data = {'contact_list':list(group_list)}
            return HttpResponse(json.dumps(data))
        else:
            pass
def message_upload(request):
    if request.method == 'GET':
        message = request.GET
        return HttpResponse(message)
    else:
        message = request.POST.get()
        return HttpResponse(message)