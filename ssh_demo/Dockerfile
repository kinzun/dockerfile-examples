
FROM centos:latest

MAINTAINER do (r@d.com)


WORKDIR /
COPY init_d.sh /
COPY authorized_keys /root/.ssh/authorized_keys
# 密钥
RUN  ./init_d.sh

# 配置文件
EXPOSE 22


CMD ["/usr/sbin/sshd","-D"]
