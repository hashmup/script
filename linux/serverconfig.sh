#!/bin/sh

# deactivate selinux
setenforce 0

# check if sudo
if [[ $(whoami) != 'root' ]]; then
    echo "please run as a super user."
    exit 1
fi
# clean history
yum update

yum clean all

yum install -y wget
yum install -y vim
wget http://download3.fedora.redhat.com/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm

# install apache server
# default is the latest?
service httpd stop
yum remove *httpd*
yum install -y httpd httpd-devel
service httpd start
chkconfig httpd on

# install mysql
# the latest version is 5.6.17 on 19th Apr, 2014
service mysqld stop
yum remove *mysql*
yum install -y http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
yum install -y mysql mysql-devel mysql-server mysql-utilities
service mysqld start
chkconfig mysqld on

# install php
# the latest for now is 5.5+
rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
yum erase php*
yum install -y php55w php55w-opcache php55w-mysql php55w-devel php55w-mcrypt

# make a sample index
echo '<?php phpinfo();' > /var/www/html/index.php
service httpd restart

# install phpMyAdmin
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
yum install -y phpmyadmin

chown apache:apache -R /usr/share/phpMyAdmin
echo -e "Alias /phpmyadmin /usr/share/phpMyAdmin\nAlias /phpMyAdmin /usr/share/phpMyAdmin\n<Directory /usr/share/phpMyAdmin/>\nOrder allow,deny\nAllow from All\n</Directory>" > /etc/httpd/conf.d/phpMyAdmin.conf

service httpd restart

# install gcc compiler
yum install -y gcc

# install git
# the latest is 1.8+
wget http://git-core.googlecode.com/files/git-1.9.0.tar.gz
wget -O git-manpages-1.9.0.tar.gz http://code.google.com/p/git-core/downloads/detail?name=git-manpages-1.9.0.tar.gz&can=2&q=
yum install -y zlib-devel perl-CPAN gettext
tar xvfz git-1.9.0.tar.gz
cd git-1.9.0
./configure
make
make prefix=/usr install

yum update