#!/bin/bash

wd=$(pwd)

# zsh
chsh -s $(which zsh)
ln -sfn $wd/.zshrc ~/.zshrc

#oh-my-zsh
ln -sfn $wd/my.zsh-theme ~/.oh-my-zsh/custom/themes/my.zsh-theme

# set zsh as default
chsh -s $(which zsh)
