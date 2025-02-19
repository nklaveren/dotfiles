export PATH=$HOME/bin:/usr/local/bin:$PATH:~/.local/bin

export ZSH="$HOME/.oh-my-zsh"

export DOTFILES=$HOME/repos/dotfiles

ZSH_THEME="my"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-bat)

unsetopt BEEP

source $ZSH/oh-my-zsh.sh

source $DOTFILES/.zsh_profile

export PATH=$HOME/.local/share/netcoredbg/bin:$PATH