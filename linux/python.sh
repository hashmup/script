cd
#準備
yum install -y gcc gcc-c++ make openssl-devel bzip2-devel zlib-devel readline-devel sqlite-devel

git clone git://github.com/yyuu/pyenv.git ~/.pyenv

source ~/.bash_profile

pyenv install 3.4.1
pyenv install 2.7.8