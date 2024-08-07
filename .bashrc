# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|screen-256color|xterm-256color) color_prompt=yes;;
esac




export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias sed=gsed

# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


export EDITOR=vim


alias gpg2=gpg


#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fzf --bash)"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    mv|cp|rm)     fzf "$@" --preview 'cat {} | head -200' ;;
    *)            fzf "$@" ;;
  esac
}

#. <(npm completion)
#. ~/.npm_completion



eval "$(starship init bash)"


export PATH="$HOME/.asdf/shims:$PATH"

#alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
#alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

export LESS=-XR

#export SOURCE4ENV_DIR=~/source4env
#for file in $(ls -1 "$SOURCE4ENV_DIR"); do
#  alias "sac${file}"=". ${SOURCE4ENV_DIR}/${file}"
#done

em () {
  emacsclient -c -a '' "$@" &
}

en () {
  emacsclient -c -a '' -t "$@"
}



pushd()
{
  if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi

  builtin pushd "${DIR}" > /dev/null
}

pushd_builtin()
{
  builtin pushd > /dev/null
#  echo -n "DIRSTACK: "
#  dirs
}

popd()
{
  builtin popd > /dev/null
#  echo -n "DIRSTACK: "
  dirs
}

alias cd='pushd'
alias back='popd'
alias flip='pushd_builtin'

#alias gd=pushd
#alias pd=popd
#alias slurp='pushd - && pushd'
alias dirs='dirs -v'

alias cd1='pushd +1'
alias cd2='pushd +2'
alias cd3='pushd +3'
alias cd4='pushd +4'
alias cd5='pushd +5'
alias cd6='pushd +6'
alias cd7='pushd +7'
alias cd8='pushd +8'
alias cd9='pushd +9'


alias sdh='cd "$(eval ls -d "$(builtin dirs -p | uniq | fzf )")"'

export PATH="${PATH}:/Users/bermanb/.azureauth/0.8.0"

export OPENSSL_CONF=~/.config/openssl.cnf

export PATH="~/.config/emacs/bin:$PATH"

if [ -d "/Applications/Emacs.app/Contents/MacOS" ]; then
    export PATH="/Applications/Emacs.app/Contents/MacOS:$PATH"
    export PATH="/Applications/Emacs.app/Contents/MacOS/bin-arm64-11:$PATH"
    alias emacs=Emacs
fi
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# Created by `pipx` on 2024-08-07 14:01:03
export PATH="$PATH:/Users/benjamin-berman/.local/bin"
