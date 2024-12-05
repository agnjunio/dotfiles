#!/bin/bash

set -e

packages=(
    bison
    clang
    curl
    fonts-powerline
    gcc
    git
    golang
    make
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

echo "## Installing volta (Node Version Manager)"
curl https://get.volta.sh | bash

echo "## Installing gvm (Go Version Manager)"
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

echo "## Installation complete. You can now run the sync.sh script"
