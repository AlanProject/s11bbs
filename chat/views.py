#-*- coding:utf-8 -*-
from django.shortcuts import render,HttpResponse
import models
import time
import json,Queue
# Create your views here.
message_queue = {
    'single':{},
    'group':{}

}

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
    date = time.strftime('%Y/%m/%d %H:%M:%S')
    # 判断请求类型如果为GET则为获取信息
    if request.method == 'GET':
        # 定义消息列表 将消息从队列中取出临时储存到列表
        message = []
        # 获取联系人id 根据此id从队列中获取消息
        sendto = request.GET.get('sendto')
        froms = request.GET.get('from')
        # 获取类型判断是用户还是群组
        types = request.GET.get('type')
        # 判断是否存在用户队列 如果不存在则创建队列

        if not message_queue[types].has_key(sendto):
            message_queue[types][sendto]= {froms:Queue.Queue()}
        # 获取消息队列的大小 既消息的条数
        if not message_queue[types][sendto].has_key(froms):
            message_queue[types][sendto][froms]= Queue.Queue()

        message_num = message_queue[types][sendto][froms].qsize()
        # 如果为0则表明消息队列为空等待5s
        if message_num == 0:
            message.append(message_queue[types][sendto][froms].get())
        # 如果不为空则获取数据
        # else:
            # 根据消息队列的长度来循环获取
        for i in range(message_num):
            message.append(message_queue[types][sendto][froms].get())
        return HttpResponse(json.dumps(message))
    # 判断请求类型如果为POST则为上传消息
    else:
        message_info = {}
        types = request.POST.get('type')
        tmp_message = request.POST.get('message')
        username = request.user.userprofile.name
        message = '<div class="message_my"><p>'+username+'&nbsp'+'&nbsp'+date+'</p><p>'+tmp_message+'</p></div>'
        sendto = request.POST.get('to')
        froms = request.POST.get('from')
        message_info['message'] = message
        if not message_queue[types].has_key(sendto):
            message_queue[types][sendto] = {froms:Queue.Queue()}
        message_queue[types][sendto][froms].put(message_info)
        return HttpResponse(message)