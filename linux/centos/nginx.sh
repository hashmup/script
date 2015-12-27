echo -e "[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/\ngpgcheck=0\nenabled=1" > /etc/yum.repos.d/nginx.repo
yum install -y nginx
nginx -v

/etc/init.d/nginx restart

# install php
# the latest for now is 5.5+
rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
yum erase php*
sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
yum -y --enablerepo=remi-php56,remi,epel install php php-mbstring php-xml php-mysql php-pdo php-mcrypt php-pecl-memcache php-devel
yum -y --enablerepo=remi-php56 install php-fpm

cp -p /etc/php.ini /etc/php.ini.org
sed -i -e 's/;date.timezone =/date.timezone = "Asia\/Tokyo"/' /etc/php.ini | grep date.timezone

# make a sample index
echo -e "session.save_path=\"/var/lib/php/session\"" >> /etc/php.ini
chown -R root.nginx /var/lib/php/session
sed -i -e 's/group = apache/group = nginx/g' /etc/php-fpm.d/www.conf
sed -i -e 's/user = apache/user = nginx/g' /etc/php-fpm.d/www.conf
echo -e "location ~ \.php {\n\troot           /usr/share/nginx/html;\n\t# fastcgi_pass unix:/var/run/php5-fpm.sock;\n\tfastcgi_pass   127.0.0.1:9000;\n\tfastcgi_index  index.php;\n\tfastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;    << document_rootを渡す\n\tinclude        fastcgi_params;\n}" >> /etc/nginx/conf.d/default.conf
echo '<?php phpinfo();' > /usr/share/nginx/html/index.php
/etc/init.d/php-fpm start
chkconfig php-fpm on
/etc/init.d/nginx restart

# install phpMyAdmin
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
yum install -y phpmyadmin

chown apache:apache -R /usr/share/phpMyAdmin
echo -e "server {\n\tlisten 80;\n\tserver_name phpmyadmin.aid.blue;\n\n\tlocation / {\n\t\troot /usr/share/phpMyAdmin;\n\t\tindex index.php;\n\t\t}\n\n\tlocation ~ \.php$ {\n\t\tfastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;\n\t\tfastcgi_index index.php;\n\t\tfastcgi_param SCRIPT_FILENAME /usr/share/phpMyAdmin/$fastcgi_script_name;\n\t\tinclude fastcgi_params;\n\t}\n}" > /etc/nginx/conf.d/phpmyadmin.conf
/etc/init.d/nginx restart
