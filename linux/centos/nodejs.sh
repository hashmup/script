cd
wget https://raw.github.com/hokaccha/nodebrew/master/nodebrew
perl nodebrew setup
source ~/.bash_profile

nodebrew -v

nodebrew install-binary stable

nodebrew use stable

node -v

sudo echo -e "[mongodb]\nname=MongoDB Repository\nbaseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/\ngpgcheck=0\nenabled=1" > /etc/yum.repos.d/mongodb.repo

sudo yum install -y mongo-10gen mongo-10gen-server

sudo service mongod start

sudo chkconfig mongod on
