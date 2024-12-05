#!/bin/bash

set -e

packages=(
    clang
    curl
    fonts-powerline
    git
    neovim
    ripgrep
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

echo "## Installing nvm (Node Version Manager)"
bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh)"

echo "## Installation complete. You can now run the sync.sh script"
