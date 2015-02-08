cd
yum -y install mercurial
yum -y install ncurses-devel
cd /usr/local/src
hg clone https://vim.googlecode.com/hg/vim
cd /usr/local/src/vim
hg tags
hg pull
hg update
./configure –enable-multibyte –with-features=huge –disable-selinux –prefix=/usr/local
make
make install
echo -e "alias vim='/usr/local/src/vim/src/vim'" >> ~/.bash_profile
source ~/.bash_profile
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim