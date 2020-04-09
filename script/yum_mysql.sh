#!/bin/bash

mysql_ver=$1
mysql_ver=`echo $mysql_ver|tr -d '.'`

rpm -ivh https://dev.mysql.com/get/mysql80-community-release-el6-3.noarch.rpm

# mysql: 5.5 5.6 5.7 8.0

yum-config-manager --enable  mysql${mysql_ver}-community   
yum-config-manager --disable mysql80-community

