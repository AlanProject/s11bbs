/**
 * Created by jhwangyl2 on 2016/5/9.
 */
UID = $('.dropdown-toggle').attr('uid');

//获取数据列表
$(document).ready(function(){
    CONTACT = {};
    GLOBAL_LOCAL_SESSION = {
        single:{},
        group:{}
    };
    GetContacts()
});
//获取数据列表结束

function ChangeTypes(argv){
    $(argv).addClass('action');
    $(argv).siblings().removeClass('action');
    GetContacts()
}

//获取联系人列表
function GetContacts(){
    var type = $('.action').attr('contact-type');
    var id = $('.action').attr('content_id');
    var data = {'id':id,'types':type};
    var html = '';
    $.ajax({
        url: "/chat/contact_select/", //请求到的url
        data: data, //需要提交的数据内容 字典格式
        type: "GET",  //使用GET模式进行请求
        success: function (callback) {
            $('#contact_list .list-group').empty();
            $.each(JSON.parse(callback)['contact_list'],function(k,v){
                CONTACT[v.id] = v.name;
                html +='<li style="margin-top:5px" onclick="ContactActive(this);" contact_id='+ v.id+' class="list-group-item">'+ v.name+'<span class="badge"></span>'+'</li>'
            });
            $('#contact_list .list-group').append(html);
        }
    });
}


//点击事件 选中联系人
function ContactActive(test){
    MessageDumpSession($('#contact_box_message').html(), $('.action').attr('contact-type'), $('#contact_box_head .message_title').attr('contact_id'));
    $('#contact_box_message').html('');
    $(test).addClass('clinck');
    $(test).attr('satatus','active');
    $(test).siblings().removeClass('clinck');
    $('.message_title').html('<a>'+CONTACT[$(test).attr('contact_id')]+'&nbsp'+'&nbsp'+'message ing ...'+'</a>');
    $('.message_title').attr('contact_id',$(test).attr('contact_id'));
    $('.message_text').attr('contact_id',$(test).attr('contact_id'));
    //{#获取用户之前的消息#}
    MessageLoadSession($('.action').attr('contact-type'), $(test).attr('contact_id'));
    MessageGetFromServer();
}
//点击事件 结束

//发送消息
$('#contact_box_bottom input').click(function(){
    var input_data = $('textarea').val();
    var date_base = new Date();
    if (input_data){
        //{#封装消息内容#}
        var message_info = {
            'sendto':$('.message_title').attr('contact_id'),
            'froms':UID,
            'types':$('.action').attr('contact-type'),
            'message':input_data
        };
        //{#将消息传递给上传消息函数进行保存处理#}
        MessageUpToServer(message_info);
    }
    $('textarea').val('');
});
//发送消息END


//存储消息到后台
function MessageUpToServer(data){
    if (data['message']){
        $.ajax({
            url:'/chat/message_manage/',
            data:data,
            type:'POST',
            success:function(callback){
                $('#contact_box_message').append(callback);
                $('.message_text').animate({scrollTop: $('.message_text')[0].scrollHeight}, 600);
            }
        })
    }
}
//存储消息到后台 END



//获取消息
function MessageGetFromServer(){
    var c_id = GLOBAL_LOCAL_SESSION;
    var contact = UID;
    var forms = $('.message_title').attr('contact_id');
    $.ajax({
        url:'/chat/message_manage/',
        type:'GET',
        data:{'sendto':contact,
            'froms':forms,
            'types':$('.action').attr('contact-type')
        },
        success:function(callback){
            var data = '';
            var message = '';
            var type = $('.action').attr('contact-type');

            $.each(JSON.parse(callback), function (k,v) {
                if (forms == $('.message_title').attr('contact_id')){
                    $('#contact_box_message').append(v.message);
                    $('.message_text').animate({scrollTop: $('.message_text')[0].scrollHeight}, 600);
                }else{
                    if ($('.list-group-item').attr('contact_id') == forms){
                        $('.badge').val(10);
                        message += v.message
                    };

                }

            });
            MessageGetFromServer();
            MessageDumpSession(message, type , forms)
        }
    });
}

//{#将对话框中的消息缓存到本地#}
function MessageDumpSession(message, type , sendto){
    if (type == 'single'){
        GLOBAL_LOCAL_SESSION['single'][sendto]  = message
    }else{
        GLOBAL_LOCAL_SESSION['group'][sendto] = message
    }
}

//{#将本地的消息缓存加载到对话框#}
function MessageLoadSession(type , sendto){
    if (type == 'single'){
        if (GLOBAL_LOCAL_SESSION.single[sendto]){
            $('#contact_box_message').html(GLOBAL_LOCAL_SESSION.single[sendto])
        }else{
            $('#contact_box_message').html('')
        }
    }else{
        if (GLOBAL_LOCAL_SESSION.group[sendto]){
            $('#contact_box_message').html(GLOBAL_LOCAL_SESSION.single[sendto])
        }else{
            $('#contact_box_message').html('')
        }
    }
}