if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi
JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

export PATH=/usr/local/bin:$PATH

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(plenv init -)"

alias sublime="open -a 'Sublime Text 2'"
alias iterm="open -a iTerm"
alias sql="open -a MySQLWorkbench"
alias drop="open -a Dropbox"
alias ch="open -a '/opt/homebrew-cask/Caskroom/google-chrome/latest/Google Chrome.app'"
alias android="open -a 'Android Studio'"
alias r="open -a RStudio"
alias hub="open -a GitHub"
alias note="open -a Evernote"
alias xcode="open -a Xcode"
alias xcode6="open -a Xcode6-Beta5"
alias trans="open -a Transmit"
alias tw="open -a Twitter"
alias tterm="open -a TotalTerminal"
alias line="open -a LINE"
alias geny="open -a Genymotion"
alias skype="open -a Skype"
alias kobito="open -a Kobito"
alias tv="open -a teamviewer"
alias para="open -a 'Parallels Desktop'"
alias ll="ls -l"
alias lf="ls -f"
alias la="ls -al"
cdls(){
  \cd "$@" && ls
}
alias cd="cdls"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

alias tr="~/.pyenv/versions/ve3.4.1/bin/python3 ~/.shell_py/transit.py"
alias transit="tr;sleep 60;tr;sleep 60;tr;sleep 60;tr;sleep 60;tr;sleep 60;tr"
alias mongodb="mongod --config /usr/local/etc/mongod.conf"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=/usr/texbin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
export PATH=/usr/texbin:$PATH
alias tex="open -a TexShop"
export PYTHONPATH="~/.pyenv/versions/2.7.9/lib/python2.7/site-packages:$PYTHONPATH"
export PYTHONPATH="~/.pyenv/versions/3.4.1/lib/python3.4/site-packages:$PYTHONPATH"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages/:$PYTHONPATH"
alias eclipse="open -a /Applications/eclipse/Eclipse.app"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vgst="vagrant global-status"
tmux
