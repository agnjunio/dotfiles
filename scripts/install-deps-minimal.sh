#!/bin/bash

set -e

packages_deps=(
  zsh
  git
  vim
  w3m
  )

install_pacapt() {
  echo "## Ensuring 'pacapt' is installed.."
  if ! type pacapt 2>/dev/null; then
    echo "## pacapt not installed yet.. Installing"
    sudo -E wget https://github.com/icy/pacapt/raw/ng/pacapt -O /usr/local/bin/pacapt
    sudo chmod 755 /usr/local/bin/pacapt
  fi
}

install_packages() {
  local label=$1; shift
  local packages=( $@ )
  echo "## Installing ${label} packages..."
  yes | sudo pacapt -S ${packages[@]}
}

install_tmux() {
  if ! type tmux 2>/dev/null; then
    echo '## Installing libevent'
    (
    local libevent=libevent-2.0.20-stable
    local libeventdir=$(mktemp -d)
    cd $libeventdir
    wget https://github.com/downloads/libevent/libevent/${libevent}.tar.gz 
    tar xvfz ${libevent}.tar.gz
    cd $libevent
    ./configure
    make
    sudo make install
    rm -rf $libeventdir
    )

    echo '## Installing tmux from source'
    (
    local tmuxdir=$(mktemp -d)
    cd $tmuxdir
    git clone https://github.com/ThomasAdam/tmux.git --depth=1
    cd tmux
    ./autogen.sh
    ./configure --prefix=/usr/local
    make
    sudo make install
    rm -rf $tmuxdir
    )
  fi
}

# TODO
install_ag() {
  echo '## Installing the silver searcher from source'
  (
  local agdir=$(mktemp -d)
  cd $agdir
  git clone https://github.com/ggreer/the_silver_searcher.git --depth=1
  cd the_silver_searcher
  ./build.sh
  sudo make install
  rm -rf $agdir
  )
}

# Let's do it!
install_pacapt

echo '## Syncing repositories'
sudo pacapt -Sy

install_packages 'dependency' ${packages_deps[@]}

echo '## Setting default terminal to zsh'
sudo chsh -s /bin/zsh $USER

install_tmux
echo '## Done!'
