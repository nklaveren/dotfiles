
cp ./vscode/keybindings.json /mnt/c/Users/{{ansible_env.USER_WIN}}/AppData/Roaming/Code/User/keybindings.json
cp ./vscode/settings.json /mnt/c/Users/{{ansible_env.USER_WIN}}/AppData/Roaming/Code/User/settings.json

cp ./.zshrc /home/{{ansible_env.USER}}/.zshrc
cp ./.zsh_profile /home/{{ansible_env.USER}}/.zsh_profile

cp ./my.zsh-theme /home/{{ansible_env.USER}}/.oh-my-zsh/themes/my.zsh-theme
