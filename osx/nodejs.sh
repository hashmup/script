cd
wget https://raw.github.com/hokaccha/nodebrew/master/nodebrew
perl nodebrew setup
source ~/.bashrc
nodebrew -v
nodebrew install-binary stable
nodebrew use stable
node -v

npm install -g bower
