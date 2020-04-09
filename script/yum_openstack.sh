#/bin/bash

cat <<EOF > /etc/yum.repos.d/openstack.repo
[openswitch]
name= openswitch
baseurl=https://repos.fedorapeople.org/openstack/EOL/openstack-icehouse/epel-6/
enabled=1
gpgcheck=0
EOF