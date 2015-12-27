sudo yum install -y openssh-server
sudo yum install -y postfix
sudo yum install -y cronie
sudo service postfix start
sudo chkconfig postfix on
sudo lokkit -s http -s ssh

cd
curl -O https://downloads-packages.s3.amazonaws.com/centos-6.6/gitlab-7.8.2_omnibus.1-1.el6.x86_64.rpm
sudo rpm -i gitlab-ce-8.2.1.rpm
sudo gitlab-ctl reconfigure
