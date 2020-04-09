#!/bin/bash

rpm -q yum-utils >/dev/null || yum install -y yum-utils

# yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo   #可能无法访问
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo #替代官方yum源