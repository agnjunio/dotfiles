# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

BROWSER=google-chrome-stable
TERMINAL=termite
EDITOR=nvim
VISUAL=nvim

function source_if_exists() {
  if [[ -f $1 ]]; then
    source $1
  fi
}

# GO
#export PATH="$PATH:~/go/bin"
#export GOPATH=$(go env GOPATH)

# JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

# NVM
nvmimport="/usr/share/nvm/init-nvm.sh"
source_if_exists $nvmimport

#ANDROID
export ANDROID_SDK_ROOT=~/Android/Sdk
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:~/Android/Sdk/platform-tools:~/Android/Sdk/emulator:~/Android/Sdk/tools/bin
#source /etc/profile.d/android-ndk.sh

#AOSP
export AOSP_VOL=~/aosp

#YARN
export PATH=$PATH:~/.yarn/bin

#Chromium
export PATH=$PATH:$HOME/projects/chromium/depot_tools

#RUST
source_if_exists $HOME/.cargo/env

# Disable terminal key catching
stty -ixon

# Aliases
source_if_exists $HOME/.aliases

vim() {
  local CMD=vim
  type nvim &> /dev/null && CMD=nvim
  command $CMD $@
}
