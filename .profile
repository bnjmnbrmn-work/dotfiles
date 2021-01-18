# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export M2_HOME=/media/$USER/fa5c0c12-5bb7-4ec7-9736-2734d2a71e3d/apache-maven-3.3.9
export M2=$M2_HOME/bin
export MAVEN_OPTS=""
export PATH=$PATH:$M2
export PATH=$PATH:/media/$USER/fa5c0c12-5bb7-4ec7-9736-2734d2a71e3d/glassfish4/bin:/media/$USER/fa5c0c12-5bb7-4ec7-9736-2734d2a71e3d/glassfish4/glassfish/bin
export CATALINA_HOME=/media/$USER/fa5c0c12-5bb7-4ec7-9736-2734d2a71e3d/apache-tomcat-8.0.23 

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
