# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/isde/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# activate zsh plugins
source ~/.zsh_plugins.sh
bindkey '^ ' autosuggest-accept

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# configure fzf keybindings
source /usr/share/fzf/shell/key-bindings.zsh

# aliases
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -la"

alias mvn15="JAVA_HOME=~/.jdks/corretto-15.0.2/ mvn"

# make keys work as expected
bindkey '^[[1;5D' backward-word # ctrl-left
bindkey '^[[1;5C' forward-word # ctrl-right
bindkey '^[[3~' delete-char # del key
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

# add ~/.local/bin to path
export PATH="$HOME/.local/bin:$PATH"

# make vim the standard editor
export VISUAL=vim
export EDITOR="$VISUAL"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

