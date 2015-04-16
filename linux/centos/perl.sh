cd
git clone git://github.com/tokuhirom/plenv.git /usr/local/plenv

mkdir /usr/local/plenv/plugins

git clone git://github.com/tokuhirom/Perl-Build.git /usr/local/plenv/plugins/perl-build/
source ~/.bash_profile

plenv install 5.19.2
