#! /bin/sh

echo "installing packages"
sudo rpm-ostree install zsh vim bat tldr fzf git-delta nodejs stow --idempotent -y

echo "creating toolbox for temporary packages"
toolbox create dotfiles-install-utils
alias tmprun='toolbox run -c dotfiles-install-utils'

echo "installing stow in a temporary container"
tmprun sudo dnf install stow -y

echo "activating zsh stow-package"
tmprun stow zsh
echo "activating git stow-package"
tmprun stow git
echo "activating vim stow-package"
tmprun stow vim

echo "exiting and removing temporary toolbox"
podman kill dotfiles-install-utils  
toolbox rm dotfiles-install-utils

echo "making zsh default shell" 
sudo usermod --shell /bin/zsh $USER

echo "installing antibody, a zsh plugin manager"
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

echo "bundling zsh_plugins.sh from zsh_plugins.txt"
antibody bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh

echo "applying installed packages to running system"
sudo rpm-ostree apply-live

echo "installing vim plugins"
vim +'PlugInstall --sync' +qa
