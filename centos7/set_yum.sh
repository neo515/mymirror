#!/bin/bash

function reset_yumrepo {
    # 备份并重置
    cp -ar /etc/yum.repos.d{,.bak.`date +%s`}
    rm -rf /etc/yum.repos.d/*
}

function downer {
    which  wget >/dev/null 2>&1 || which  curl >/dev/null 2>&1 || yum install -y curl
}

function config_yumrepo {
    if which  wget >/dev/null 2>&1 ;then
        wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
        wget -O /etc/yum.repos.d/epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo
    elif which curl >/dev/null 2>&1;then
        curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
        curl -o /etc/yum.repos.d/epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo
    else
        yum -y install  curl
        curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
        curl -o /etc/yum.repos.d/epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo
    fi
    yum clean all
    yum makecache fast
}

downer
reset_yumrepo
config_yumrepo
