
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

if [[ "$TERM" != "screen-256color" ]] && [[ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]] && [ -z "$INTELLIJ_ENVIRONMENT_READER" ]
then
 tmux attach-session -t "$USER" || tmux new-session -s "$USER"
 exit
fi

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"



[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
#[[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]] && . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#if [ -f ~/.git-completion.bash ]; then
#    . ~/.git-completion.bash
#fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source <(kubectl completion bash)
#. ~/.kubectl_bash_completion

alias k=kubectl


complete -F __start_kubectl k


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"

#. /opt/homebrew/opt/asdf/libexec/asdf.sh


#. /opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash


#for asdf ruby plugin
#export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
#export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"


#. ${HOMEBREW_PREFIX}/etc/profile.d/z.sh


#eval "$(gh completion -s bash)"



[[ -f ~/.bashrc ]] && source ~/.bashrc 

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh"  ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

# Created by `pipx` on 2024-08-07 14:01:03
export PATH="$PATH:/Users/benjamin-berman/.local/bin"

export JAVA_HOME=$(/usr/libexec/java_home -v 12)
