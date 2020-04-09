#!/bin/bash
#支持centos6、7、8

function reset_yumrepo {
    # 备份并重置
    cp -ar /etc/yum.repos.d{,.bak.`date +%s`}
    rm -rf /etc/yum.repos.d/*
}

function get_sys_version {
    rpm -q --queryformat '%{VERSION}' centos-release
}

function downer {

    rpm -q curl >/dev/null 2>&1 || rpm -q wget >/dev/null 2>&1 || yum install -y curl
}

function config_yumrepo {
    sys_ver=`get_sys_version`
    if wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-${sys_ver}.repo >/dev/null 2>&1 ;then
        # wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-${sys_ver}.repo >/dev/null 2>&1
        wget -O /etc/yum.repos.d/epel-${sys_ver}.repo http://mirrors.aliyun.com/repo/epel-${sys_ver}.repo >/dev/null 2>&1
    elif curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-${sys_ver}.repo >/dev/null 2>&1;then
        # curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-${sys_ver}.repo >/dev/null 2>&1
        curl -o /etc/yum.repos.d/epel-${sys_ver}.repo http://mirrors.aliyun.com/repo/epel-${sys_ver}.repo >/dev/null 2>&1
    else
        echo '安装失败. 请先安装wget/curl工具'
        exit 1
    fi
    yum clean all
    yum makecache fast
}

downer
reset_yumrepo
config_yumrepo
