brew install readline openssl
brew install rbenv ruby-build rbenv-gem-rehash rbenv-gemset
brew install apple-gcc42
source ~/.bash_profile

RUBY_CONFIGURE_OPTS="--with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)" rbenv install 2.1.3
rbenv global 2.1.3
sudo gem update --system
sudo gem install bundler && sudo gem install rails
sudo gem install sass --pre && sudo gem install compass --pre && sudo gem install compass-recipes --pre && sudo gem install animation --pre && sudo gem install susy --pre && sudo gem install haml
