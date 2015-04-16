cd
gem update --system
echo -e "install: --no-rdoc --no-ri\nupdate: --no-rdoc --no-ri" >> ~/.gemrc
rbenv exec gem install bundler
rbenv rehash
gem install --no-ri --no-rdoc rails
rbenv rehash

gem install mysql2
gem install omniauth
