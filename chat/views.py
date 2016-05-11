#-*- coding:utf-8 -*-
from django.shortcuts import render,HttpResponse
import models
from web import models as web_models
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
        types = request.GET.get('types')
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
    # 判断请求类型如果为GET则为获取信息
    if request.method == 'GET':
        # 定义消息列表 将消息从队列中取出临时储存到列表
        message = []
        # 获取联系人id 根据此id从队列中获取消息
        sendto = request.GET.get('sendto')
        froms = request.GET.get('froms')
        # 获取类型判断是用户还是群组
        types = request.GET.get('types')
        # 判断是否存在用户队列 如果不存在则创建队列
        if not message_queue[types].has_key(sendto):
            message_queue[types][sendto]= {froms:Queue.Queue()}
        # 获取消息队列的大小 既消息的条数
        if not message_queue[types][sendto].has_key(froms):
            message_queue[types][sendto][froms]= Queue.Queue()
        message_num = message_queue[types][sendto][froms].qsize()
        try:
            if message_num != 0:
                for i in range(message_num):
                    message.append(message_queue[types][sendto][froms].get())
            else:
                message.append(message_queue[types][sendto][froms].get(timeout=60))
            return HttpResponse(json.dumps(message))
        except Queue.Empty as e:
            return HttpResponse(json.dumps(message))

    # 判断请求类型如果为POST则为上传消息
    else:
        date = time.strftime('%Y/%m/%d %H:%M:%S')
        # 定义消息存储字典
        message_info = {}
        # 获取type类型判断是组还是用户
        types = request.POST.get('types')
        # 获取当前用户名
        username = request.user.userprofile.name
        # 拼接消息 用户名+时间+消息内容
        message = '<div class="message_my"><p>'+username+'&nbsp'+'&nbsp'+date+'</p><p>'+request.POST.get('message')+'</p></div>'
        # 发送给谁
        sendto = request.POST.get('sendto')
        # 谁发送
        froms = request.POST.get('froms')
        # 消息内容
        message_info['message'] = message
        # 判断是否存在接收用户的数据字典
        if types == 'group':
            group_obj = models.ChatGroup.objects.get(id=sendto)
            data = web_models.UserProfile.objects.filter(chatgroup=group_obj).values()
            for item in data:
                userid = unicode(item.get('user_id'))
                if userid != froms:
                    if not message_queue[types].has_key(userid):
                        # 如果不存在则创建
                        message_queue[types][userid] = {sendto:Queue.Queue()}
                    # 将消息添加到消息队列
                    message_queue[types][userid][sendto].put(message_info)
        else:
            if not message_queue[types].has_key(sendto):
                # 如果不存在则创建
                message_queue[types][sendto] = {froms:Queue.Queue()}
            # 将消息添加到消息队列
            message_queue[types][sendto][froms].put(message_info)
        return HttpResponse(message)