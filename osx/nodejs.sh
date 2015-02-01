cd
wget https://raw.github.com/hokaccha/nodebrew/master/nodebrew
perl nodebrew setup
export PATH=$HOME/.nodebrew/current/bin:$PATH
source ~/.bashrc
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bash_profile && source ~/.bash_profile
nodebrew -v
nodebrew install-binary stable
nodebrew use stable
node -v

npm install -g bower
