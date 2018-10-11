FroM centos:7
ENV container docker
MAINTAINER wathit <wathit.c@traceon.com>
LABEL Description="Centos STD v1"
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
RUN 	yum update -y ;\
	yum install openssh-server -y;\
	yum install openssh-clients -y;\
	yum install net-tools-y ;\
	yum install nano -y ;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
