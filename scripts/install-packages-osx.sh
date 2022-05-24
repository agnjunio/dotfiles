#!/bin/bash

set -e

packages=(
    neovim
    fzf
    git
    tig
    tmux
    zsh
)

# Let's do it!
install_packages() {
    local packages=( $@ )
    echo "## Installing dependencies..."
    NONINTERACTIVE=1 brew install ${packages[@]}
}

echo "## Ensuring 'homebrew' is installed..."
if ! type brew 2>/dev/null; then
    echo "## homebrew not installed yet. Let's do it now :)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

install_packages ${packages[@]}
