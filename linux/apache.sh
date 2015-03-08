service httpd stop
yum remove *httpd*
yum install -y httpd httpd-devel
service httpd start
chkconfig httpd on

# install phpMyAdmin
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
yum install -y phpmyadmin

chown apache:apache -R /usr/share/phpMyAdmin
echo -e "Alias /phpmyadmin /usr/share/phpMyAdmin\nAlias /phpMyAdmin /usr/share/phpMyAdmin\n<Directory /usr/share/phpMyAdmin/>\nOrder allow,deny\nAllow from All\n</Directory>" > /etc/httpd/conf.d/phpMyAdmin.conf