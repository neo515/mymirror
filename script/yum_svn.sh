#/bin/bash

#centos5: 1.7 - 1.9
#centos6: 1.7 - 1.13
#centos7: 1.7 - 1.13
#centos8: 1.9 - 1.10

svn_ver=$1
ver_main=`echo  $svn_ver|awk -F'.' '{print $1}'`
ver_child=`echo $svn_ver|awk -F'.' '{print $2}'`

function get_sys_version {
    rpm -q --queryformat '%{VERSION}' centos-release
}

sys_ver=`get_sys_version`

if [ "$sys_ver" = 5 -a "$ver_main" = 1 ] && [ "$ver_child" -ge 7 -a "$ver_child" -le 9 ];then
    :
elif [ "$sys_ver" = 6 -a "$ver_main" = 1 ] && [ "$ver_child" -ge 7 -a "$ver_child" -le 13 ];then
    :
elif [ "$sys_ver" = 7 -a "$ver_main" = 1 ] && [ "$ver_child" -ge 7 -a "$ver_child" -le 13 ];then
    :
elif [ "$sys_ver" = 8 -a "$ver_main" = 1 ] && [ "$ver_child" -ge 9 -a "$ver_child" -le 10 ];then
    :
else:
    echo '输入错误,请核对版本'
    exit 1
fi

cat <<EOF > /etc/yum.repos.d/wandisco-svn.repo
[WandiscoSVN]
name=Wandisco SVN Repo
baseurl=http://opensource.wandisco.com/centos/`get_sys_version`/svn-${svn_ver}/RPMS/\$basearch/
enabled=1
gpgcheck=1
EOF

