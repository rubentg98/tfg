FROM rubentg98/centos-systemd

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

# Install centreon
RUN yum install -y centreon-base-config-centreon-engine centreon-widget\* 

RUN yum -y install httpd24

RUN echo "date.timezone = Europe/Paris" >> /etc/php.ini
#RUN systemctl restart rh-php72-php-fpm

RUN systemctl enable php-fpm httpd24-httpd centreon cbd centengine gorgoned snmptrapd centreontrapd snmpd

EXPOSE 80


#¡¡¡¡¡NO HAY QUE OLVIDAR LANZARLO CON PRIVILEGED!!!!!!!!