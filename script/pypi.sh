#!/bin/bash

pip_config="$HOME/.pip/pip.conf"

if [ ! -f $pip_config ] ;then
    mkdir -p $HOME/.pip/
else
    mv -f ${pip_config} ${pip_config}.bak.`date "+%s"`
fi


cat <<EOF > $HOME/.pip/pip.conf
[global]
trusted-host=mirrors.aliyun.com
index-url=http://mirrors.aliyun.com/pypi/simple/
timeout = 30
EOF

