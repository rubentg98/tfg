FROM mariadb:latest

# Update CentOS
RUN yum -y update


#Install Redhat Software Collections repository
RUN yum install -y centos-release-scl

# Install Centreon Repository
RUN yum install -y https://yum.centreon.com/standard/20.04/el7/stable/noarch/RPMS/centreon-release-20.04-1.el7.centos.noarch.rpm

RUN yum install -y centreon-database


