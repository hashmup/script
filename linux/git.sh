# clean history
yum update

yum clean all

yum install wget

# install gcc compiler
yum install gcc

# install git
# the latest is 1.8+
wget http://git-core.googlecode.com/files/git-1.9.0.tar.gz
wget -O git-manpages-1.9.0.tar.gz http://code.google.com/p/git-core/downloads/detail?name=git-manpages-1.9.0.tar.gz&can=2&q=
yum install zlib-devel perl-CPAN gettext
tar xvfz git-1.9.0.tar.gz
cd git-1.9.0
./configure
make
make prefix=/usr install