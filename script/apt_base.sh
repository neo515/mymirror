#!/bin/bash

apt-get install -y apt-transport-https ca-certificates  curl software-properties-common

cp -ar /etc/apt/sources.list /etc/apt/sources.list.bak.`date +%s`

sed -i '/^[^#]/s#archive.ubuntu.com#mirrors.aliyun.com#'  /etc/apt/sources.list

apt update

