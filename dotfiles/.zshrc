bindkey -v

autoload -Uz colors

colors

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %=%# "

autoload -Uz select-word-style
select-word-style default

zstyle ':zle:*' word-chars  "/=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

########################################
# オプション
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt extended_glob
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt RM_STAR_SILENT
setopt RM_STAR_WAIT

# alias
. ~/.commonenv
. ~/.zshenv
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
alias -g L='| less'
alias -g G='| grep'
# copy to clipboard
if which pbcopy >/dev/null 2>&1 ; then
  alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
  alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
  alias -g C='| putclip'
fi
. ~/.shalias

# directory
hash -d dot=~/script/dotfiles
hash -d py2=~/work/python/py2
hash -d py3=~/work/python/py3
hash -d js=~/work/js
hash -d vag=~/vagrantBoxes
hash -d se=~/Dropbox/東京大学/工学部機械情報工学科/3年s1s2/SE
