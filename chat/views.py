from django.shortcuts import render,HttpResponse
import models
import json,Queue
# Create your views here.
message_queue = {}

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
def message_manage(request):
    message_info = {}
    if request.method == 'GET':
        user = request.GET.get('contact')
        if message_queue.has_key(user):
            message_num = message_queue.get(user).qsize()
            if message_num == 0:
                return HttpResponse('')
            message = message_queue[user].get()
            return HttpResponse(json.dumps(message))
        else:
            print message_queue
            return HttpResponse('')
    else:
        message_info['to'] = request.POST.get('to')
        message_info['message'] = request.POST.get('message')
        message_info['from'] = request.POST.get('from')
        if not message_queue.has_key(message_info['to']):
            message_queue[message_info['to']] = Queue.Queue()
        message_queue[message_info['to']].put(message_info)
        return HttpResponse('')