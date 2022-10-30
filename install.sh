#! /bin/sh

echo "installing util-linux-user for chsh command"
sudo dnf install util-linux-user -y

echo "installing stow"
sudo dnf install stow -y

echo "activating zsh stow-package"
stow zsh
echo "activating git stow-package"
stow git

echo "installing zsh"
sudo dnf install zsh -y

echo "adding zsh to valid shells"
command -v zsh | sudo tee -a /etc/shells

echo "making zsh default shell" 
sudo chsh -s $(which zsh) $USER

echo "installing antibody, a zsh plugin manager"
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

echo "bundling zsh_plugins.sh from zsh_plugins.txt"
antibody bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh

echo "installing pyenv"
curl https://pyenv.run | bash

echo "installing additional packages"
sudo dnf install -y \
	    bat \
	    tldr \
	    fzf \
