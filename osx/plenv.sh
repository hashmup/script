brew install plenv perl-build cpanminus
mkdir -p ~/.plenv/plugins
git clone git://github.com/radford/plenv-pmset.git ~/.plenv/plugins/
source ~/.bash_profile

plenv install 5.18.0
plenv install 5.19.7
