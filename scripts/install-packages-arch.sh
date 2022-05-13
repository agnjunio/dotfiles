#!/bin/env bash

set -e

packages_core=(
  base-devel
  git
  openssh
  tig
  neovim
  the_silver_searcher
)

packages_aur=()

# Let's do it!
install_packages() {
    local label=$1; shift
    local packages=( $@ )
    echo "## Installing ${label} arch packages..."
    sudo pacman -S ${packages[@]}
}

# Sync pacman hooks
if [ -d /etc/pacman.d ]; then
  echo "## Installing pacman hooks..."
  sudo ln -sfv "$PWD"/pacman-hooks/* /etc/pacman.d/hooks
fi

echo '## Syncing the Arch Repositories...'
sudo pacman -Sy

install_packages 'Mirrorlist' rsync reflector pacman-mirrorlist
install_packages 'Core' ${packages_core[@]}

echo "## Ensuring 'yay' is installed.."
if ! type yay 2>/dev/null; then
    echo "## yay not installed yet.. Let's do it now :)"
    (
        tmpdir=$(mktemp -d)
	git clone https://aur.archlinux.org/yay.git $tmpdir
        cd $tmpdir
        makepkg -sri
    )
fi

echo "## Installing AUR packages..."
yay -S ${packages_aur[@]}

