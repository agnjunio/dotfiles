#!/bin/bash

set -e

is_wsl() {
    if grep -qi microsoft /proc/version 2>/dev/null; then
        return 0
    fi
    return 1
}

packages=(
    bison
    clang
    curl
    dos2unix
    fonts-powerline
    gcc
    git
    golang
    make
    neovim
    ripgrep
    tig
    terraform
    tmux
    zsh
)

# Non-WSL only packages
if ! is_wsl; then
    packages+=(
        docker-ce
        docker-ce-cli
        containerd.io
        docker-buildx-plugin
        docker-compose-plugin
    )
fi

add_repositories() {
    # Ensure minimal tools are installed
    sudo apt update
    sudo apt install -y install ca-certificates curl gnupg

    # Add docker repository only if not in WSL
    if ! is_wsl; then
        sudo install -m 0755 -d /etc/apt/keyrings
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        sudo chmod a+r /etc/apt/keyrings/docker.asc
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    fi

    # Add Hashicorp repository
    wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
}

echo "## Adding repositories..."
add_repositories

echo '## Updating repositories...'
sudo apt update

echo "## Installing packages..."
sudo apt install ${packages[@]} -y

if ! omz version &>/dev/null; then 
    echo "## Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "## Installation complete. You can now run the sync.sh script"
