wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm
sudo yum --enablerepo=remi,epel install redis
sudo service redis start
sudo chkconfig redis on

sudo su
cd /usr/local/src
git clone git://github.com/nicolasff/phpredis.git
cd phpredis
phpize
./configure
make
make install

echo "extension=redis.so" > /etc/php.d/redis.ini

service httpd restart