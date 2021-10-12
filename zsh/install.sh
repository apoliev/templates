#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

# Creating backup
zshrc_file="$HOME/.zshrc"
if [ -e $zshrc_file ]; then
  echo -e "\e[33mCreating backup file (.zshrc.bak)...\e[0m"
  cp $HOME/.zshrc $HOME/.zshrc.bak
  echo -e "\e[32mSuccess\e[0m\n"
fi

# Copying template
echo -e "\e[33mInstall zshrc...\e[0m"
cp $DIR/zshrc $HOME/.zshrc
echo -e "\e[32mSuccess\e[0m\n"

# Copying plugins
echo -e "\e[33mCopying plugins...\e[0m"
cp -a $DIR/plugins/conda $HOME/.oh-my-zsh/custom/plugins
cp -a $DIR/plugins/rvm $HOME/.oh-my-zsh/custom/plugins
cp -a $DIR/plugins/nvm $HOME/.oh-my-zsh/custom/plugins
echo -e "\e[32mSuccess\e[0m\n"

# Copying themes
echo -e "\e[33mCopying themes...\e[0m"
cp $DIR/themes/bira-shell.zsh-theme $HOME/.oh-my-zsh/custom/themes
echo -e "\e[32mSuccess\e[0m\n"

# Settings for plugins
echo -e "\e[33mSet configs for plugins...\e[0m"

echo "rvm_silence_path_mismatch_check_flag=1" > $HOME/.rvmrc
echo -e "\e[32mSuccess for rvm\e[0m"

echo "changeps1: false" > $HOME/.condarc
echo -e "\e[32mSuccess for conda\e[0m"
