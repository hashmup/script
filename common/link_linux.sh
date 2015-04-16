source ~/.bash_profile
mkdir -p ~/work
mkdir -p ~/work/python
mkdir -p ~/work/js
mkdir -p ~/work/ruby

ln -s ~/script/common/npm.sh ~/work/js/
ln -s ~/script/common/bower.sh ~/work/js/
ln -s ~/script/common/pip.sh ~/work/python/
ln -s ~/script/dotfiles_linux/.bashrc ~/
ln -s ~/script/dotfiles_linux/.bash_profile ~/
ln -s ~/script/dotfiles_linux/.emmet_snippets_custom.json ~/
ln -s ~/script/dotfiles_linux/.vimrc ~/
#ln -s ~/script/dotfiles_linux/.zshrc ~/
#ln -s ~/script/dotfiles_linux/.zshenv ~/
ln -s ~/script/dotfiles_linux/.bashenv ~/
ln -s ~/script/dotfiles_linux/.commonenv ~/
