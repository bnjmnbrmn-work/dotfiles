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

#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[00;35m\]\w\[\033[00m\]\$ '
source ~/.git-prompt.sh
function __get_prompt {
  if [ -z "$AWS_PROFILE" ]; then
    AWS_PROFILE_PROMPT_COMPONENT=""
  else
    AWS_PROFILE_PROMPT_COMPONENT="\[\033[38;5;220m\]$AWS_PROFILE\[\033[00m\]:"
  fi
  __git_ps1 "\[\033[01;32m\]\u@\h\[\033[00m\]:$AWS_PROFILE_PROMPT_COMPONENT\[\033[00;35m\]\w\[\033[00m\]" "\n\$ "
}
#PROMPT_COMMAND='__git_ps1 "\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[00;35m\]\w\[\033[00m\]" "\$ "'
PROMPT_COMMAND='__get_prompt'
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_DESCRIBE_STYLE=branch
GIT_PS1_SHOWCOLORHINTS=true


#this particular trick unfortunately means that node and npm won't be included in PATH
#leaving it here in case it leads to a better solution
#mynvm() {
#  unalias nvm
#  if [ -z "$nvm_unset" ]; then
#    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#    nvm_unset=false
#  fi
#  nvm "$@"
#}
#alias nvm=mynvm

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias gpg2=gpg

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"

#[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

complete -C '/opt/homebrew/bin/aws_completer' aws
#complete -C '/Users/bermanb/.asdf/shims/aws_completer' aws


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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
. ~/.npm_completion


# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/bermanb/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

eval "$(starship init bash)"
. "$HOME/.cargo/env"

[ -f "/Users/bermanb/.ghcup/env" ] && source "/Users/bermanb/.ghcup/env" # ghcup-env

export PATH="$HOME/.asdf/shims:$PATH"
export PATH="/Applications/Coq-Platform~8.15~2022.04.app/Contents/Resources/bin:$PATH"
export PATH="~/.emacs.d/bin:$PATH"

#alias emacs="emacs -c -a ''"

#export PATH=/nix/store/mbvlwkzp6g4nfbcas1xw10crh7v1jrx7-deno-1.28.3/bin:$PATH

#export PATH=/Users/bermanb/ce/emacs_stuff/emacs-from-scratch/.emacs.d:$PATH
export PATH="/Users/bermanb/.config/emacs/bin:$PATH"

alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

export UPMC_ROOT_CA=$HOME/certs_to_trust/UPMC-ROOT-CA.pem

export AWS_CA_BUNDLE=~/certs_to_trust/AWS_AND_UPMC_BUNDLE.pem

export LESS=-XR

export GITLAB_HOME="$HOME/gitlab"

export SOURCE4ENV_DIR=/Users/bermanb/projects/cdris/hcos_operations/source4env

for file in $(ls -1 "$SOURCE4ENV_DIR"); do
  alias "sac${file}"=". ${SOURCE4ENV_DIR}/${file}"
done

em () {
  emacsclient -c -a '' "$@" &
}

en () {
  emacsclient -c -a '' -t "$@"
}

. ~/.private/artifactory_credentials.sh

#export CDPATH=~/projects/cdris:$CDPATH
#export CDPATH=~/projects/hedis:$CDPATH
#export CDPATH=~/projects/api-gateway:$CDPATH
#export CDPATH=~/projects/juno:$CDPATH
#export CDPATH=~/projects/kamioka:$CDPATH
#export CDPATH=~/projects/bermanb:$CDPATH


pushd()
{
  if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi

  builtin pushd "${DIR}" > /dev/null
#  echo -n "DIRSTACK: "
#  dirs
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
