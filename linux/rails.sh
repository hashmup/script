cd
gem update --system 2.1.0
echo -e "install: --no-rdoc --no-ri\nupdate: --no-rdoc --no-ri" >> ~/.gemrc
gem install rails --version 4.0.5
gem install mysql2
gem install omniauth
