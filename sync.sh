#!/bin/bash

backup_dot_file() {
  local f=$1
  local dir=$(dirname "$bkpdir/`echo $f | sed "s,$HOME/,,"`")
  [ -d $dir ] || mkdir -p $dir
  mv $f $dir
}

sync_dot_file() {
  local file=$1
  local link=$2
  [ -z $link ] && link=$file
  local src=$PWD/$file
  local tgt=$HOME/$link

  echo -n "Installing ${src}: "
  if [[ -L $tgt && `readlink -f $tgt` = $src ]]; then
    echo "skipping..."
    return 0
  fi
  if [[ -f $tgt || -d $tgt ]]; then
    echo "replacing..."
    backup_dot_file $tgt || return 1
  else
    echo "linking..."
  fi
  ln -sf $src $tgt
  return 0
}

sync_dot_files() {
  local ignoredirs='-I ".*~" -I ".*swp" -I .git -I .gitmodules -I sync.sh -I .kde -I .xdg-config -I .local-config -I .gitignore -I .powerline -I ycm_compile.log -I scripts -I pacman-hooks -I .editorconfig'
  local files_to_install=`eval "ls --color=never -A $ignoredirs"`

  for file in $files_to_install; do
    sync_dot_file $file || return 1
  done
  return 0
}

bkpdir="$HOME/.dot-backups/bkp-`date +'%b-%d-%y_%H:%M:%S'`"

sync_dot_files &&

echo "Dotfiles synchronized successfully."
unset bkpdir
