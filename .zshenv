# Only run these is NO_RCS is not set
if [[ ! -o norcs ]]; then
  export TERMINAL=termite
  export EDITOR=nvim
  export VISUAL=nvim
  export SSH_KEY_PATH="~/.ssh/rsa_id"

  typeset -U path
  path=($path $HOME/.bin $HOME/.local/bin)

  export GOPATH=$(go env GOPATH)
  path=($path ~/go/bin)

  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
  export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

  export ANDROID_SDK_ROOT=~/Android/Sdk
  export ANDROID_HOME=~/Android/Sdk
  path=($path ~/Android/Sdk/platform-tools ~/Android/Sdk/emulator ~/Android/Sdk/tools/bin)

  path=($path ~/.yarn/bin)

  export GTK_IM_MODULE=ibus
  export XMODIFIERS=@im=ibus
  export QT_IM_MODULE=ibus
fi
