export PATH=$HOME/bin:/usr/local/bin:$PATH:~/.local/bin

export ZSH="$HOME/.oh-my-zsh"

export DOTFILES=$HOME/repos/dotfiles

ZSH_THEME="my"

unsetopt BEEP

source $ZSH/oh-my-zsh.sh

source $DOTFILES/.zsh_profile
