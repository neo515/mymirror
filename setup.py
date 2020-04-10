#!/bin/env python2
#coding: utf8

import os

app_mirrors={
    "centos系统":{
        1:"国内yum源(aliyun): 支持centos6/7",
        2:"docker-ce国内源(aliyun)",
        3:"kubernetes国内源(aliyun)",
        4:"mysql官方yum源",
        5:"openstack官方yum源",
        6:"svn官方yum源",
        7:"pip国内源(aliyun)",
    },
    "ubuntu系统":{
        8:"国内apt源(aliyun)",
        9:"docker-ce国内源(aliyun)"
    }
}

print('支持配置的源:')
for platform,apps in app_mirrors.items():
    if apps:
        print("  @{}".format(platform))
    _apps=apps.items()
    _apps.sort(key=lambda x:x[0])
    for _seq,app  in _apps:
        print('    ({}) {}'.format(_seq,app))
    print('')

    
seq=raw_input('输入序号: ')
seq=int(seq)
if seq == 1:
    command="bash script/yum_base.sh"
    os.system(command)
elif seq == 2:
    os.system("bash script/yum_dockerCE.sh")
elif seq == 3:
    os.system("bash script/yum_kubernetes.sh")
elif seq == 4:
    mysql_vers=['5.5', '5.6', '5.7', '8.0']
    print "支持的版本有: {}".format(',  '.join(mysql_vers))
    mysql_ver=raw_input('输入mysql的版本: ')
    if mysql_ver not in mysql_vers:
        print('输入错误')
        exit()
    os.system("bash script/yum_mysql.sh {}".format(mysql_ver))
elif seq == 5:
    os.system("bash script/yum_openstack.sh")
elif seq == 6:
    print """
#centos5: 1.7 - 1.9
#centos6: 1.7 - 1.13
#centos7: 1.7 - 1.13
#centos8: 1.9 - 1.10
"""
    svn_ver=raw_input('输入svn的版本: ')
    os.system("bash script/yum_svn.sh {}".format(svn_ver))
elif seq == 7:
    os.system("bash script/pypi.sh")
elif seq == 8:
    os.system("bash script/apt_base.sh")
elif seq == 9:
    os.system("bash script/apt_dockerCE.sh")
else:
    print('输入错误')
    exit()

