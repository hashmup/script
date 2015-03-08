#!/bin/sh
chmod a+x ~/.bash_profile
source ~/.bash_profile
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
yum install -y zsh
wget http://download3.fedora.redhat.com/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm

# install mysql
# the latest version is 5.6.17 on 19th Apr, 2014
service mysqld stop
yum remove *mysql*
yum install -y http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
yum install -y mysql mysql-devel mysql-server mysql-utilities
service mysqld start
chkconfig mysqld on

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