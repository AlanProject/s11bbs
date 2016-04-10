#!/usr/bin/env python
#-*- coding:utf-8 -*-
from django import template
register = template.Library()
def deep_search(comment_dic,i):
    for k,v in comment_dic.items():
        if k == i.parent_comment:
            comment_dic[k][i] = {}
            return
        else:
            deep_search(v,i)
def html_views(comment_dic,margin_left):
    html = ""
    for k,v in comment_dic.items():
        html +="<div style='margin-left:%spx' class='comment_node'>"%margin_left+"<p>"+str(k.user)+'&nbsp&nbsp'+k.comment+"&nbsp&nbsp"+str(k.date)+"</p>"+"</div>"
        if v:
            html += html_views(v,margin_left+15)
    return html
@register.simple_tag
def comment_tree(comment_tuple):
    comment_dic = {}
    for i in comment_tuple:
        if i.parent_comment is None:
            comment_dic[i] = {}
        else:
            deep_search(comment_dic,i)
    html = "<div class='comment_box'>"
    margin_left = 0
    for k,v  in comment_dic.items():
        html +="<div class='comment_node'>"+"<p>"+str(k.user)+'&nbsp&nbsp'+k.comment+"&nbsp&nbsp"+str(k.date)+"<p>"+"</div>"
        html+= html_views(v,margin_left+15)
    html += "</div>"
    return html