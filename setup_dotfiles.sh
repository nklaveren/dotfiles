#!/bin/bash

wd=`pwd`

mkdir -p ~/.config

# zsh
chsh -s $(which zsh)
ln -sfn $wd/.zsh_profile ~/.zsh_profile
ln -sfn $wd/.zshrc ~/.zshrc

#oh-my-zsh
ln -sfn $wd/nige.zsh-theme ~/.oh-my-zsh/custom/themes/nige.zsh-theme

# Neovim
ln -sfn $wd/nvim ~/.config/nvim

# set zsh as default
chsh -s $(which zsh)