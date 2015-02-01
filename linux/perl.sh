git clone git://github.com/tokuhirom/plenv.git ~/.plenv

git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/
echo 'export PATH="$HOME/.plenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(plenv init -)"' >> ~/.bash_profile
exec $SHELL -l

plenv install 5.19.2