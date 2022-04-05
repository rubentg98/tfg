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

# Install ssh
RUN yum -y install openssh-server openssh-client
RUN mkdir /var/run/sshd
RUN echo 'root:centreon' | chpasswd
RUN sed -i 's/^#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config
#RUN /etc/init.d/ssh start && /etc/init.d/ssh stop

# Install centreon
RUN yum install -y centreon-base-config-centreon-engine centreon-widget\* 

RUN yum -y install httpd24

RUN echo "date.timezone = Europe/Paris" >> /etc/php.ini
#RUN systemctl restart rh-php72-php-fpm

RUN systemctl enable php-fpm httpd24-httpd centreon cbd centengine gorgoned snmptrapd centreontrapd snmpd

EXPOSE 80
#CMD ["echo \"date.timezone = Europe/Paris\" >> /etc/opt/rh/rh-php72/php.d/50-centreon.ini"]
#CMD [ "systemctl start httpd24-httpd" ]
#RUN centreon-base-config-centreon-engine centreon-installed centreon-clapi 
#RUN /etc/init.d/mysql stop

#¡¡¡¡¡NO HAY QUE OLVIDAR LANZARLO CON PRIVILEGED!!!!!!!!