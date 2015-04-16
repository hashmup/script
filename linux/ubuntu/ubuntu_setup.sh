sudo apt-get -y update
# 初期フォルダ作成

# 初期に必要なソフトのインストール
sudo apt-get -y install vim-gnome
sudo apt-get -y install emacs23
sudo apt-get -y install ssh

sudo apt-get -y install wget
sudo apt-get -y install git

sudo apt-get -y install default-jdk

sudo apt-get -y install build-essential
sudo apt-get -y install libsqlite3-dev
sudo apt-get -y install sqlite3
sudo apt-get -y install bzip2 libbz2-dev
sudo apt-get -y install libssl-dev openssl
sudo apt-get -y install libreadline6 libreadline6-dev
sudo apt-get -y install mysql-server

# vim
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

#python

git clone git://github.com/yyuu/pyenv.git ~/pyenv
sudo mv ~/pyenv/ /usr/local/
sudo chmod -R a+x /usr/local/pyenv
sudo chmod -R 777 /usr/local/pyenv
source ~/.bash_profile

pyenv install 3.4.1
pyenv install 2.7.9


# perl

git clone git://github.com/tokuhirom/plenv.git ~/plenv
sudo mv ~/plenv/ /usr/local/
sudo chmod -R a+x /usr/local/plenv
sudo chmod -R 777 /usr/local/plenv
mkdir /usr/local/plenv/plugins
git clone git://github.com/tokuhirom/Perl-Build.git /usr/local/plenv/plugins/perl-build/
source ~/.bash_profile

plenv install 5.19.2

# ruby
sudo apt-get -y install bison curl zlib1g-dev libyaml-dev libxml2-dev autoconf libncurses5-dev

git clone git://github.com/sstephenson/rbenv.git ~/rbenv
sudo mv ~/rbenv /usr/local/
sudo chmod -R a+x /usr/local/rbenv
sudo chmod -R 777
mkdir /usr/local/rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-guild/
sudo chmod -R a+x /usr/local/rbenv
sudo chmod -R 777

source ~/.bash_profile

rbenv install 2.1.0
rbenv global 2.1.0
rbenv rehash

. ~/script/linux/common/rails.sh

# javascript(node.js)
wget https://raw.github.com/hokaccha/nodebrew/master/nodebrew
perl nodebrew setup
source ~/.bash_profile

nodebrew -v
nodebrew install-binary stable
nodebrew use stable

node -v

# php
sudo apt-get -y install php5-fpm php5-gd php5
sudo apt-get -y install php5-cli

# scala
sudo apt-get -y remove scala-library scala
wget http://www.scala-lang.org/files/archive/scala-2.11.6.dev
sudo dpkg -i scala-2.11.6.deb
sudo apt-get -y update
sudo apt-get -y install scala

wget http://dl.bintray.com/sbt/debian/sbt-0.13.8.deb
sudo dpkg -i sbt-0.13.8.deb
sudo apt-get -y update
sudo apt-get -y install sbt

# c#
sudo apt-get -y install mono-gmcs
