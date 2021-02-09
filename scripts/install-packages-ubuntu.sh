#!/bin/bash

set -e

packages=(
    curl
    fonts-powerline
    git
    tig
    tmux
    zsh
)

# Let's do it!
install_packages() {
    local packages=( $@ )
    echo "## Installing dependencies..."
    sudo apt install ${packages[@]} -y
}

echo '## Updating repositories...'
sudo apt update
install_packages ${packages[@]}

echo "## Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
