# Used for setting user's environment variables; it should not contain commands that produce output or assume the shell is attached to a tty. This file will always be sourced.

# USER VARS
export BROWSER=firefox
export TERMINAL=termite
export EDITOR=nvim
export VISUAL=nvim

# JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

#ANDROID
export ANDROID_SDK_ROOT=~/Android/Sdk
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:~/Android/Sdk/platform-tools:~/Android/Sdk/emulator:~/Android/Sdk/tools/bin:~/Android/Sdk/ndk-bundle

#AOSP
export AOSP_VOL=~/aosp

#GO
export PATH="$HOME/go/bin:$PATH"
export GOPATH=$(go env GOPATH)

#PYTHON
export VIRTUAL_ENV_DISABLE_PROMPT=1

#YARN
export PATH=$PATH:~/.yarn/bin

