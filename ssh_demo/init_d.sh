

#!/bin/sh

cd /etc/yum.repos.d/ 
mkdir /etc/yum.repos.d/back
mv * back

curl -o /etc/yum.repos.d/CentOS-Base.repo  http://mirrors.cloud.tencent.com/repo/centos7_base.repo \
&&curl -o /etc/yum.repos.d/epel.repo http://mirrors.cloud.tencent.com/repo/epel-7.repo\

yum clean all\
&&yum makecache

yum install -y iproute

yum install -y openssh-server

/bin/echo "toor" | passwd --stdin root\
&&ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_ecdsa_key \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_ed25519_key\
&&/bin/sed -i 's/.*session.*required.*pam_loginuid.so.*/session optional pam_loginuid.so/g' /etc/pam.d/sshd \
    && /bin/sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config \
    && /bin/sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config

