if which git >/dev/null; then
  . brew.sh
  . macinit.sh
  . ~/script/common/vim.sh
  . ~/script/common/link.sh
  mkdir ~/vagrantBoxes
  . ~/javascript/npm.sh
  . ~/javascript/bower.sh
else
  echo git command not exist
  java -version
  xcode-select --install
fi
