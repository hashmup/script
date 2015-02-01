#homebrewのインストール
java -version

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor

brew update

echo -e 'export HOMEBREW_CASK_OPTS="--appdir=/Applications"'

. brewcask.sh
