#!/usr/bin/env sh

if [ "$(uname)" == "Darwin" ]; then
  os="osx"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  os="linux"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  os="win32"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
  os="win64"
fi

echo "Syncing dotfiles on ${os}..."

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
    .
    ..
    .*~
    .*swp
    .git
    .gitmodules
    sync.sh
    .gitignore
    scripts
  )

  case ${os} in
    linux*)
      local files=$(ls --color=never -A $(for ignore in ${ignores[@]}; do echo -n '-I $ignore '; done))
      ;;
    osx*)
      local ignoredirs=". .. '.*~' '.*swp' .git .gitmodules sync.sh .kde .xdg-config .local-config .gitignore .powerline ycm_compile.log scripts pacman-hooks .editorconfig"
      local files_to_install=$(find .* -depth 0 $(echo $ignoredirs | xargs -n1 -I % echo -n '-not -name % ') | xargs echo)
      ;;
    *)
      local files=""
      ;;
  esac

  for file in $files; do
    sync_dot_file $file || return 1
  done
  return 0
}

bkpdir="$HOME/.dot-backups/bkp-`date +'%b-%d-%y_%H:%M:%S'`"

sync_dot_files &&

echo "Dotfiles synchronized successfully."
unset bkpdir
