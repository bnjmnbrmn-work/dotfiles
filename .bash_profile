[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" 
#function ts() {
#  gdate +"%T.%3N"
#  echo ' ' $1
#}
if [[ "$TERM" != "screen-256color" ]] && [[ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]] && [ -z "$INTELLIJ_ENVIRONMENT_READER" ]
then
 tmux attach-session -t "$USER" || tmux new-session -s "$USER"
 exit
fi

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"


#export DOCKER_DEFAULT_PLATFORM='linux/amd64'

#[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
[[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]] && . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#if [ -f ~/.git-completion.bash ]; then
#    . ~/.git-completion.bash
#fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#source <(kubectl completion bash)
. ~/.kubectl_bash_completion

alias k=kubectl


complete -F __start_kubectl k


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"

. /opt/homebrew/opt/asdf/libexec/asdf.sh


. /opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash


#for asdf ruby plugin
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
#export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

alias dvev='. ~/.gradle/dv_gradle_envars.sh'

#if (docker info | grep aarch64 >/dev/null) && [  "$DOCKER_DEFAULT_PLATFORM" != "linux/amd64" ]; then
    export DV_DOCKER_PLATFORM='linux/arm64'
#fi

. ${HOMEBREW_PREFIX}/etc/profile.d/z.sh

# >>> coursier install directory >>>
export PATH="$PATH:/Users/bermanb/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

eval "$(gh completion -s bash)"

. ~/util/completion-ruby/completion-ruby-all
. "$HOME/.cargo/env"

export PATH="/opt/homebrew/opt/llvm@12/bin:$PATH"

[[ -f ~/.bashrc ]] && source ~/.bashrc 

. ~/.quarkus_bash_completion
