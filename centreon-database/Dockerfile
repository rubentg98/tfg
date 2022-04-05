FROM local/c7-systemd

# Update CentOS
RUN yum -y update

#Install Redhat Software Collections repository
RUN yum install -y centos-release-scl

RUN yum install -y yum-utils
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum-config-manager --enable remi-php80


# Install Centreon Repository
RUN yum install -y https://yum.centreon.com/standard/21.10/el7/stable/noarch/RPMS/centreon-release-21.10-5.el7.centos.noarch.rpm

#Install Redhat Software Collections repository
RUN yum install -y centreon-database

# Install ssh
RUN yum -y install openssh-server openssh-client
RUN mkdir /var/run/sshd
RUN echo 'root:centreon' | chpasswd
RUN sed -i 's/^#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config

RUN systemctl enable mariadb

EXPOSE 3306