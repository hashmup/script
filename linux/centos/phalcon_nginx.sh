#phalconのインストールに必要なモジュールをインストール
yum install -y libtool gcc
#phalconのインストール => /var
cd /var

git clone git://github.com/phalcon/cphalcon.git
cd cphalcon/build/64bits
export CC="gcc"
export CFLAGS="-o2 -fno-delete-null-pointer-checks -finline-functions -fomit-frame-pointer"
phpize
./configure --enable-phalcon
make && sudo make install

sudo cp /var/cphalcon/build/64bits/modules/phalcon.so /usr/lib64/php/modules/
echo "extension=phalcon.so" > /etc/php.d/phalcon.ini
service php-fpm restart
php -r "print_r(get_loaded_extensions());" | grep phalcon

#phalcon develop toolsのインストール
mkdir /usr/local/phalcon && cd /usr/local/phalcon
curl -s http://getcomposer.org/installer | php
echo -e "{\n\t\"require\": {\n\t\t\"phalcon/devtools\":\"dev-master\"\n\t}\n}" > /usr/local/phalcon/composer.json
php composer.phar install
ln -s /usr/local/phalcon/vendor/phalcon/devtools/phalcon.php /usr/bin/phalcon
chmod ugo+x /usr/bin/phalcon
