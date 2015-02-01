brew install plenv perl-build cpanminus
mkdir -p ~/.plenv/plugins
cd ~/.plenv/plugins
git clone git://github.com/radford/plenv-pmset.git ~/.plenv/plugins/

echo 'export PATH="$HOME/.plenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(plenv init -)"' >> ~/.bash_profile

source ~/.bash_profile

plenv install 5.18.0
plenv install 5.19.7
