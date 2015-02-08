setenforce 0
cd
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

sudo yum -y groupinstall "Development Tools"

sudo yum -y install openssl-devel readline-devel zlib-devel curl-devel libyaml-devel

sudo yum -y install ImageMagick ImageMagick-devel ipa-pgothic-fonts

#rbenvをインストール
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

#ruby-buildをインストール
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

source ~/.bash_profile

rbenv install 2.1.0

rbenv global 2.1.0
rbenv rehash