#!/usr/bin/env python
#-*- coding:utf-8 -*-
my_tuple = (
(None,'A'),
('A','A-1'),
('A','A-2'),
('A-2','A-2-1'),
('A-2','A-2-2'),
('A-2-2','A-2-2-1'),
('A-1','A-1-1'),
(None,'B'),
('B','B-1'),
('B','B-2'),
('B-2','B-2-1'),)
my_dic = {}
def comment_deep(my_dic,parent,son):
    for k,son_dic in my_dic.items():
        if k == parent:
            my_dic[k][son] = {}
            return
        else:
            comment_deep(my_dic[k],parent,son)

def comment_first ():
    for parent,son in my_tuple:
        if parent == None:
            my_dic[son] = {}
        else:
            comment_deep(my_dic,parent,son)

if __name__ == '__main__':
    comment_first()
    print my_dic