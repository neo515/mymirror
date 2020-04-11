#!/bin/bash

brew --repo  || { echo '似乎还没有安装brew,安装之后再执行吧'; exit 1 ; } ;

echo '1. 中科大(ustc)
2. 清华(tsinghua)
3. 官方'
read -p '请输入要使用的镜像来源: ' mirror

case "$mirror" in
1)
    url_brew='git://mirrors.ustc.edu.cn/brew.git'
    url_brew_bottles='git://mirrors.ustc.edu.cn/homebrew-core.git'
    ;;
2)
    url_brew='https://mirrors.tuna.tsinghua.edu.cn/git/brew.git'
    url_brew_bottles='https://mirrors.tuna.tsinghua.edu.cn/git/homebrew-core.git'
    ;;
3)
    url_brew='https://github.com/Homebrew/brew.git'
    url_brew_bottles='https://github.com/Homebrew/homebrew-core'
    ;;
*)
    echo '输入错误,请重新开始'
    exit 1
    ;;
esac


cd `brew --repo`
git remote set-url origin $url_brew
git remote  -v

echo '-------------------'

cd `brew --repo`/Library/Taps/homebrew/homebrew-core
git remote set-url origin $url_brew_bottles
git remote  -v

