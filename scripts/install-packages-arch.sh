#!/bin/bash

set -e

packages_core=(
    base-devel
    git
    bash-completion
    clang
    openssh
    alsa-utils
    highlight
    rsync
    strace
    gdb
    htop
    sshuttle
    libcanberra
    fuse2
    gtkmm
    tig
    archey3
    inotify-tools
    jre8-openjdk
    cups
    avahi
    wmctrl
    intel-ucode
    linux-firmware
    linux-headers
    repo
    boost
    python
    python-pip
    task
    unzip
    vim
    neovim
    the_silver_searcher
    )

packages32=(
    lib32-fontconfig
    lib32-libpng12
    lib32-libsm
    lib32-libxinerama
    lib32-libxrender
    lib32-libjpeg6-turbo
    lib32-libxtst
    )

packages_graphics=(
    xsel
    plasma-workspace
    compton
    chromium
    termite
    ttf-dejavu
    gnome-tweak-tool gnome-keyring
    numix-gtk-theme
    arc-gtk-theme
    adapta-gtk-theme
    deepin-icon-theme oxygen-icons
    adapta-gtk-theme
    playerctl
    gparted
    nomacs
    evince
    udiskie
    nemo
    nemo-fileroller
    unclutter
    powerline-fonts
    breeze
    pavucontrol
    xdg-user-dirs
    feh
    )

# AUR
packages_aur=(
    ncurses5-compat-libs
    ttf-opensans
    ttf-raleway
    tmux-bash-completion
    scrcpy
    cquery-git
    python-language-server
    )

# Let's do it!
install_packages() {
    local label=$1; shift
    local packages=( $@ )
    echo "## Installing ${label} arch packages..."
    sudo pacman -S ${packages[@]}
}

sync_pacman_hooks() {
  if [ -d /etc/pacman.d ]; then
    echo "Installing pacman hooks..."
    sudo ln -sfv "$PWD"/../pacman-hooks/* /etc/pacman.d/hooks
  fi
}

# Sync pacman hooks
sync_pacman_hooks &&

echo '## Syncing the Arch Repositories...'
sudo pacman -Sy

install_packages 'Core' ${packages_core[@]}
# TODO make sure 'Multilib' is enable in /etc/pacman.conf'
install_packages 'Multilib' ${packages32[@]}
install_packages 'Graphics' ${packages_graphics[@]}

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
yay -S ${packages_aur[@]} --noconfirm

