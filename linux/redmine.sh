setenforce 0

rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

sudo yum groupinstall "Development Tools"

sudo yum -y install openssl-devel readline-devel zlib-devel curl-devel libyaml-devel

sudo yum -y install ImageMagick ImageMagick-devel ipa-pgothic-fonts

#ruby関連のinstall

#rbenvをインストール
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

echo -e "\nexport PATH=\"$HOME/.rbenv/bin:$PATH\"" >> ~/.bash_profile
echo -e 'eval "$(rbenv init -)"' >> ~/.bash_profile

#ruby-buildをインストール
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

source ~/.bash_profile

rbenv install 2.1.0

source ~/.bash_profile

rbenv rehash
rbenv global 2.1.0

rbenv exec gem install bundler --no-rdoc --no-ri
rbenv rehash

sudo chmod o+x ~/.rbenv/

#mysql設定
sudo mysql -uroot -e "create database db_redmine default character set utf8;"
sudo mysql -uroot -e "grant all on db_redmine.* to user_redmine identified by 'admin';"
sudo mysql -uroot -e "flush privileges;"

#redmine

sudo wget http://www.redmine.org/releases/redmine-2.4.3.tar.gz
sudo tar zxvf redmine-2.4.3.tar.gz
sudo echo -e "production:\n adapter:mysql2\n database:db_redmine\n host:localhost\n username:user_redmine\n password:admin\n encoding:utf8" > redmine-2.4.3/config/database.yml

sudo echo -e "production:\n email_delivery:\n  delivery_method::smtp\n  smtp_settings:\n   address:'localhost'\n   port:25\n   domain:'tweet-project.net'\n rmagick_font_path: /usr/share/fonts/ipa-pgothic/ipagp.ttf" > redmine-2.4.3/config/configuration.yml

sudo mv redmine-2.4.3 /var/lib/redmine

cd /var/lib/redmine
rbenv local 2.1.0
rbenv rehash

bundle install --without development test
bundle exec rake generate_secret_token
RAILS_ENV=production bundle exec rake db::migrate

rbenv exec gem install passenger --no-rdoc --no-ri
rbenv rehash

sudo passenger-install-apache2-module

sudo echo -e "LoadModule passenger_module /root/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/passenger-4.0.37/buildout/apache2/mod_passenger.so\n<IfModule mod_passenger.c>\n  PassengerRoot /root/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/passenger-4.0.37\n  PassengerDefaultRuby /root/.rbenv/versions/2.1.0/bin/ruby\n</IfModule>" > /etc/httpd/conf.d/passenger.conf
service httpd configtest
service httpd restart
chkconfig httpd on
sudo chown -R apache:apache /var/lib/redmine