. ~/.commonenv
. ~/.bashenv
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
zsh