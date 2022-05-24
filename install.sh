# install util-linux-user
sudo dnf install util-linux-user # provides chsh

# install stow
sudo dnf install stow -y

# install zsh
sudo dnf install zsh -y

# add zsh to valid shells
command -v zsh | sudo tee -a /etc/shells

# make zsh default shell 
sudo chsh -s $(which zsh) $USER

# Install antibody and generate zsh_plugins.sh
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

antibody bundle < .zsh_plugins.txt > .zsh_plugins.sh

# activate stow packages
stow zsh
stow bash

# install additional packages
dnf install bat tldr

# install pyenv
sudo dnf install gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite \
sqlite-devel openssl-devel xz xz-devel libffi-devel patch # pyenv dependencies

curl https://pyenv.run | zsh # pyenv installer
