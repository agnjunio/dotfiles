# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

BROWSER=/usr/bin/google-chrome-stable
TERMINAL=/usr/bin/termite
EDITOR=/usr/bin/vim
VISUAL=vim

# GO
#export PATH="$PATH:~/go/bin"
#export GOPATH=$(go env GOPATH)

# JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# NVM
nvmimport="/usr/share/nvm/init-nvm.sh"

if [[ -f "$nvmimport" ]]; then
    source "$nvmimport"
else
    echo "Could not source ${nvmimport}."
fi

#ANDROID
export ANDROID_SDK_ROOT=~/Android/Sdk
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:~/Android/Sdk/platform-tools:~/Android/Sdk/emulator:~/Android/Sdk/tools/bin
#source /etc/profile.d/android-ndk.sh

#AOSP
export AOSP_VOL=~/aosp

#ROM Tools
#source ~/projects/rom-tools/env.sh

# Disable terminal key catching
stty -ixon

# Aliases
source ~/.aliases

vim() {
  local CMD=vim
  type nvim &> /dev/null && CMD=nvim
  command $CMD $@
}
