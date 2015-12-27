. ~/.commonenv
if [ -f ~/.bashenv ] ; then
. ~/.bashenv
fi
alias la='ls -lah'
alias ll='ls -l'
cdls(){
  \cd "$@" && ls
}
alias cd="cdls"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo '
. ~/.shalias

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
