#!/usr/bin/env bash

echo "Syncing dotfiles..."

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
  if [[ -L $tgt && `readlink $tgt` = $src ]]; then
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
  local ignores=(
    .*~
    .*swp
    .git
    .gitmodules
    sync.sh
    .gitignore
    scripts
  )
  local files=$(ls -A --color=never)

  for file in $files; do
    local ignored=0
    for ignore in ${ignores[@]}; do
      if [[ $file == $ignore ]]; then ignored=1; break; fi
    done
    [[ $ignored == "0" ]] && sync_dot_file $file
  done
  return 0
}

bkpdir="$HOME/.dot-backups/bkp-`date +'%b-%d-%y_%H:%M:%S'`"

sync_dot_files &&

echo "Dotfiles synchronized successfully."
unset bkpdir
